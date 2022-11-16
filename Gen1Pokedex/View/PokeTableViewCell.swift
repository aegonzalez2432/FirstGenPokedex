//
//  PokeTableViewCell.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/11/22.
//
import UIKit


class PokeTableViewCell: UITableViewCell {
    
    lazy var sprite: UIImageView = {
        let spt = UIImageView(frame: .zero)
        spt.translatesAutoresizingMaskIntoConstraints = false
        spt.contentMode = .scaleAspectFit
        spt.heightAnchor.constraint(equalToConstant: 150).isActive = true
        spt.widthAnchor.constraint(equalToConstant: 150).isActive = true
        
        return spt
    }()
    
    var pokemonID: Int?
    
    lazy var pokemonName: UILabel = {
        let pokeName = UILabel(frame: .zero)
        pokeName.translatesAutoresizingMaskIntoConstraints = false
        pokeName.backgroundColor = .systemYellow
        
        pokeName.numberOfLines = 2
        pokeName.textColor = .systemRed
        
        
        return pokeName
    }()
    
    lazy var pokeElement: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.backgroundColor = .systemMint

        

        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?){
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.createUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func createUI(){
        
        let vstack = UIStackView(frame: .zero)
        vstack.translatesAutoresizingMaskIntoConstraints = false
        vstack.axis = .vertical
        vstack.spacing = 2
        
        let topBuffer = UIView.createBufferView()
        let bottomBuffer = UIView.createBufferView()
        
        vstack.addArrangedSubview(topBuffer)
        vstack.addArrangedSubview(self.pokemonName)
        vstack.addArrangedSubview(self.pokeElement)
        vstack.addArrangedSubview(bottomBuffer)
        vstack.addArrangedSubview(self.sprite)
        
        
        
        self.contentView.addSubview(self.sprite)
        self.contentView.addSubview(vstack)
        
        self.sprite.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.sprite.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.sprite.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor, constant: 8).isActive = true
        
        vstack.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        vstack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        vstack.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true

        vstack.leadingAnchor.constraint(equalTo: self.sprite.trailingAnchor, constant: 8).isActive = true

        topBuffer.heightAnchor.constraint(equalTo: bottomBuffer.heightAnchor).isActive = true
    }
    
}

extension PokeTableViewCell {
    func configurePokemon(poke: ConstructPokemon) {
        DispatchQueue.main.async {
            self.pokeElement.text = self.pokeTypesToString(type: poke.types)
            self.pokemonName.text = poke.name
            self.pokemonID = poke.id
        }

    }
    
    func pokeTypesToString(type: [Types]) -> String {
        var typesToString: String = ""
        type.forEach{elem in
            typesToString += "   \(elem.type.name)"
            
        }
        
        return typesToString
    }
    
    func configureImageIfNeeded(data: Data, id: Int) {
        if let pokeID = self.pokemonID, pokeID == id {
            DispatchQueue.main.asyncAfter(deadline: .now()){
                self.sprite.image = UIImage(data: data)
            }
        }
    }
}
