//
//  Extension+Double.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

infix operator %%: AdditionPrecedence

extension Double {
    static func %% (valor: Double, desconto: Double) -> Double {
        let resultado = valor * desconto / 100
        return (resultado * 100).rounded() / 100
    }
}
