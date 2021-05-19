//
//  Enums.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

enum Dia: String {
    case segunda = "Segunda-Feira"
    case terca = "Terça-Feira"
    case quarta = "Quarta-Feira"
    case quinta = "Quinta-Feira"
    case sexta = "Sexta-Feira"
    case sabadoDomingoFeriado = "Sábados/Domingo/Feriados"
    
    var descontos: PercentualDescontos {
        switch self {
        case .segunda:
            return PercentualDescontos(criancas: 10.0, estudantes: 10.0, estudantesComCarteirinha: 35.0, idosos: 10.0)
        case .terca:
            return PercentualDescontos(criancas: 15.0, estudantes: 5.0, estudantesComCarteirinha: 35.0, idosos: 15.0)
        case .quarta:
            return PercentualDescontos(criancas: 30.0, estudantes: 50.0, estudantesComCarteirinha: 35.0, idosos: 40.0)
        case .quinta:
            return PercentualDescontos(criancas: 0.0, estudantes: 30.0, estudantesComCarteirinha: 35.0, idosos: 30.0)
        case .sexta:
            return PercentualDescontos(criancas: 11.0, estudantes: 0.0, estudantesComCarteirinha: 35.0, idosos: 0.0)
        case .sabadoDomingoFeriado:
            return PercentualDescontos(criancas: 0.0, estudantes: 0.0, idosos: 5.0)
        }
    }
}

enum ValoresIngresso: Double {
    case crianca = 5.5
    case estudante = 8.0
    case idoso = 6.0
}

struct ValoresIngressoComDesconto {
    let crianca: Double
    let estudante: Double
    let idoso: Double
}
