//
//  PokemonViewController.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/11/22.
//
import UIKit

class PokemonViewController: UIViewController {
    
    lazy var pokeTableView: UITableView = {
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        table.dataSource = self
        table.delegate = self
        table.prefetchDataSource = self
        table.register(PokeTableViewCell.self, forCellReuseIdentifier: "PokemonCell")
        return table
    }()
    
    let network: NetworkURLSessionManager
    var results: [NameLink] = []
    var offset: Int = 0
    var limit: Int = 20
    
    init(network: NetworkURLSessionManager = NetworkURLSessionManager()) {
        self.network = network
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        
        fatalError("init(coder:) has not been implemented")
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.createUI()
        
        self.requestNextPage()
    }
    
    func createUI(){
        self.view.backgroundColor = .black
        self.view.addSubview(self.pokeTableView)
        
        self.pokeTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.pokeTableView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokeTableView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor,constant: -8).isActive = true
        self.pokeTableView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
    }
    
    func requestNextPage() {
        //get to 151 pokemons
        if offset == 140 {
            limit = 11
            self.network.fetchPageResult(with: NetworkConstants.basePokePath + "?offset=\(offset)&limit=\(limit)") { result in
                switch result {
                case .success(let page):
                    self.results.append(contentsOf: page.results)
                    self.offset += self.limit
                    DispatchQueue.main.async {
                        self.pokeTableView.reloadData()
                    }
                case .failure(let error):
                    self.presentNetworkErrorAlert(error: error)
                }
            }
        } else if offset > 140 {
            return
        } else {
            self.network.fetchPageResult(with: NetworkConstants.basePokePath + "?offset=\(offset)&limit=\(limit)") { result in
                switch result {
                case .success(let page):
                    self.results.append(contentsOf: page.results)
                    self.offset += self.limit
                    DispatchQueue.main.async {
                        self.pokeTableView.reloadData()
                    }
                case .failure(let error):
                    self.presentNetworkErrorAlert(error: error)
                }
            }
        }
    }
}

extension PokemonViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.results.count 
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "PokemonCell", for: indexPath) as? PokeTableViewCell else {return UITableViewCell()
            }
        //turn results to get the image for the sprite, also the type
        var pokemansId: Int = 0
        let pokeDetails = self.results[indexPath.row].url
        self.network.fetchPokemonResult(with: "\(pokeDetails)") { res in
            switch res {
            case .success(let page):
                cell.configurePokemon(poke: page)
                pokemansId = page.id
                
                if let dayta = ImageCache.shared.get(id: pokemansId){
                    print("image received from cache")
                    cell.configureImageIfNeeded(data: dayta, id: pokemansId)
                } else {
                    DispatchQueue.global().asyncAfter(deadline: .now()){
                        let pokeSprite: String = page.sprites.frontDefault ?? ""
                        self.network.fetchRawData(with: pokeSprite){spriteRes in
                            
                            switch spriteRes {
                            case .success(let data):
                                print("got image!")
                                
                                ImageCache.shared.set(data: data, id: pokemansId)
                                cell.configureImageIfNeeded(data: data, id: pokemansId)
                            case .failure(let err):
                                self.presentNetworkErrorAlert(error: err)
                                print("failed to get image")
                            }
                        }
                    }
                }

            case .failure(let error):
                self.presentNetworkErrorAlert(error: error)
                print("could not access individual pokemon details for \(self.results[indexPath.row].name)")
            }
        }

        
        //CELLFORROWAT DO UPDATE FOR DETAIL OF POKEMON HERE
        return cell
        
        
    }
    
    
}

extension PokemonViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let secondVC = PokemonDetailVC()
        self.navigationController?.pushViewController(secondVC, animated: true)
    }
}

extension PokemonViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        let lastIndexPath = IndexPath(row: self.results.count - 1, section: 0)
        guard indexPaths.contains(lastIndexPath) else {return}
        self.requestNextPage()
    }
    
    
}
