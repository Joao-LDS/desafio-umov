//
//  ValorDoIngressoComDesconto.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

struct ValorDoIngressoComDesconto {
    let criancas: Double
    let estudantes: Double
    let idosos: Double
    
    static func calculaValorComDesconto(_ valores: ValorDoDesconto) -> ValorDoIngressoComDesconto {
        let criancas = ValoresIngresso.crianca.rawValue - valores.criancas
        let estudantes =  ValoresIngresso.estudante.rawValue - valores.estudantes
        let idosos = ValoresIngresso.idoso.rawValue - valores.idosos
        return ValorDoIngressoComDesconto(criancas: criancas, estudantes: estudantes, idosos: idosos)
    }
}
