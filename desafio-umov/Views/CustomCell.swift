//
//  CustomCell.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    let dia: Dia
    
    init(dia: Dia) {
        self.dia = dia
        super.init(style: .default, reuseIdentifier: "cell")
        configurarCell()
    }
    
    private func configurarCell() {
        self.textLabel?.text = dia.rawValue
        self.textLabel?.textColor = .black
        backgroundColor = .white
        selectionStyle = .none
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
