//
//  PrincipalView.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import UIKit

class PrincipalView: UIView {

    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isScrollEnabled = false
        return view
    }()
    
    lazy var estudanteComCarteirinha: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Estudante com carteirinha"
        view.textColor = .black
        return view
    }()
    
    lazy var estudanteComCarteirinhaSwitch: UISwitch = {
        let view = UISwitch()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var valorDescontoCrianca: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    lazy var valorDescontoEstudante: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    lazy var valorDescontoIdoso: UILabel = {
        let view = UILabel()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.numberOfLines = 0
        view.textColor = .black
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .white
        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func ajustaAlturaTableView() {
        tableView.heightAnchor.constraint(equalToConstant: tableView.contentSize.height).isActive = true
        tableView.layoutIfNeeded()
    }
    
}

extension PrincipalView: ConfigurarView {
    func addSubviews() {
        addSubview(tableView)
        addSubview(estudanteComCarteirinha)
        addSubview(estudanteComCarteirinhaSwitch)
        addSubview(valorDescontoCrianca)
        addSubview(valorDescontoEstudante)
        addSubview(valorDescontoIdoso)
    }
    
    func addContraints() {
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
        tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
        tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
        
        estudanteComCarteirinha.topAnchor.constraint(equalTo: tableView.bottomAnchor, constant: 20),
        estudanteComCarteirinha.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        estudanteComCarteirinhaSwitch.centerYAnchor.constraint(equalTo: estudanteComCarteirinha.centerYAnchor),
        estudanteComCarteirinhaSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
        
        valorDescontoCrianca.topAnchor.constraint(equalTo: estudanteComCarteirinha.bottomAnchor, constant: 16),
        valorDescontoCrianca.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        valorDescontoEstudante.topAnchor.constraint(equalTo: valorDescontoCrianca.bottomAnchor, constant: 16),
        valorDescontoEstudante.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
        
        valorDescontoIdoso.topAnchor.constraint(equalTo: valorDescontoEstudante.bottomAnchor, constant: 16),
        valorDescontoIdoso.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16)
        ])
    }
}
