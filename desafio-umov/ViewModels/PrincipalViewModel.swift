//
//  PrincipalViewModel.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import Foundation

protocol PrincipalViewModelProtocol {
    var dias: [Dia] { get }
    var diaSelecionado: Dia? { get set }
    var estudanteComCarteirinha: Bool { get set }
    var atualizaValoresNaView: ((ValorDoDesconto?, ValorDoIngressoComDesconto?) -> Void)? { get set }
}

class PrincipalViewModel: PrincipalViewModelProtocol {
    
    var atualizaValoresNaView: ((ValorDoDesconto?, ValorDoIngressoComDesconto?) -> Void)?
    var diaSelecionado: Dia? {
        didSet {
            diaSelecionado != nil ? atulizaValores() : atualizaValoresNaView?(nil, nil)
        }
    }
    var estudanteComCarteirinha: Bool = false {
        didSet {
            atulizaValores()
        }
    }
    
    let dias: [Dia] = [.segunda, .terca, .quarta, .quinta, .sexta, .sabadoDomingoFeriado]
    
    func atulizaValores() {
        guard let dia = self.diaSelecionado else { return }
        let valores = ValorDoDesconto.calculaDesconto(dia: dia, estudanteComCarteirinha: estudanteComCarteirinha)
        atualizaValoresNaView?(valores, ValorDoIngressoComDesconto.calculaValorComDesconto(valores))
    }
}
