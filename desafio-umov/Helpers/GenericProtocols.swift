//
//  GenericProtocols.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

protocol ConfigurarView {
    func addSubviews()
    func addContraints()
    func setupView()
}

extension ConfigurarView {
    func setupView() {
        addSubviews()
        addContraints()
    }
}
