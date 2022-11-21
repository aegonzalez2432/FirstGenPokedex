//
//  PokemonDetailVC.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/14/22.
//

import UIKit
//TODO: Implement moves, abilities, name, type
class PokemonDetailVC: UIViewController {
    
    lazy var pokeImage: UIImageView = {
        let image = UIImageView(frame: .zero)
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .systemMint
        image.heightAnchor.constraint(equalToConstant: 150).isActive = true
        image.widthAnchor.constraint(equalToConstant: 150).isActive = true
        return image
    }()
    
    lazy var pokeNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray
        label.textColor = .black
        label.heightAnchor.constraint(equalToConstant: 44).isActive = true

        label.numberOfLines = 0
        
        return label
    }()
    
    lazy var pokeType: UILabel = {
        let type = UILabel(frame: .zero)
        type.translatesAutoresizingMaskIntoConstraints = false
        type.heightAnchor.constraint(equalToConstant: 44).isActive = true

        type.backgroundColor = .systemBrown
        type.numberOfLines = 0
        
        return type
    }()
    
    lazy var pokeMoves: UITextView = {
        let move = UITextView(frame: .zero)
        move.translatesAutoresizingMaskIntoConstraints = false
        move.textAlignment = .center
        move.font = UIFont.systemFont(ofSize: 17)
        move.backgroundColor = .systemRed
        move.isScrollEnabled = true
        
        return move
    }()
    
    lazy var pokeAbility: UILabel = {
        let ability = UILabel(frame: .zero)
        ability.translatesAutoresizingMaskIntoConstraints = false
        ability.backgroundColor = .systemBlue
        ability.heightAnchor.constraint(equalToConstant: 44).isActive = true
        
        ability.numberOfLines = 0
        
        return ability
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.pokeNameLabel)
        self.view.addSubview(self.pokeMoves)
        self.view.addSubview(self.pokeAbility)
        self.view.addSubview(self.pokeImage)
        self.view.addSubview(self.pokeType)
        self.view.backgroundColor = .white
        
        
        self.pokeImage.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokeImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        
        
        self.pokeNameLabel.leadingAnchor.constraint(equalTo: self.pokeImage.trailingAnchor, constant: 8).isActive = true
        self.pokeNameLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 8).isActive = true
        self.pokeNameLabel.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.pokeType.topAnchor.constraint(equalTo: self.pokeNameLabel.bottomAnchor, constant: 8).isActive = true
        self.pokeType.leadingAnchor.constraint(equalTo: self.pokeImage.trailingAnchor, constant: 8).isActive = true
        self.pokeType.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.pokeAbility.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokeAbility.topAnchor.constraint(equalTo: self.pokeImage.bottomAnchor, constant: 8).isActive = true
        self.pokeAbility.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        
        self.pokeMoves.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 8).isActive = true
        self.pokeMoves.topAnchor.constraint(equalTo: self.pokeAbility.bottomAnchor, constant: 8).isActive = true
        self.pokeMoves.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -8).isActive = true
        self.pokeMoves.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -8).isActive = true
        
        

    }
}

