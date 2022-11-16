//
//  PokemonDetailVC.swift
//  Gen1Pokedex
//
//  Created by Consultant on 11/14/22.
//

import UIKit
//TODO: Implement moves, abilities, name, type
class PokemonDetailVC: UIViewController {
    
    lazy var pokeNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .systemGray
        label.numberOfLines = 0
        
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.addSubview(self.pokeNameLabel)
        
        self.pokeNameLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 8).isActive = true
        self.pokeNameLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 8).isActive = true
        self.pokeNameLabel.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -8).isActive = true
        self.pokeNameLabel.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -8).isActive = true

    }
}

