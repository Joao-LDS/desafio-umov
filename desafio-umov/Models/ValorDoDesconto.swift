//
//  ValorDoDesconto.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

struct ValorDoDesconto {
    let criancas: Double
    let estudantes: Double
    let idosos: Double
    
    static func calculaDesconto(dia: Dia, estudanteComCarteirinha: Bool = false) -> ValorDoDesconto {
        let criancas = ValoresIngresso.crianca.rawValue %% dia.descontos.criancas
        
        var estudantes: Double
        if let descontoComCarteirinha = dia.descontos.estudantesComCarteirinha,
            estudanteComCarteirinha {
            estudantes =  ValoresIngresso.estudante.rawValue %% descontoComCarteirinha
        } else {
            estudantes = ValoresIngresso.estudante.rawValue %% dia.descontos.estudantes
        }
        
        let idosos = ValoresIngresso.idoso.rawValue %% dia.descontos.idosos
        return ValorDoDesconto(criancas: criancas, estudantes: estudantes, idosos: idosos)
    }
}
