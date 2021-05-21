//
//  PercentualDescontosTests.swift
//  desafio-umovTests
//
//  Created by João on 19/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import XCTest
@testable import desafio_umov

/*

Calcule os seguintes descontos para as entradas dado o preço dos ingressos:

- Crianças: R$ 5.50
- Estudantes: R$ 8.00
- Idosos: R$ 6.00

Segunda-Feira:
      - 10% para todos(crianças, idosos, estudantes)

Terça-Feira:
      - 15% idosos e crianças;
      - 5% estudantes;

Quarta-Feira:
      - 40% idosos
      - 30% crianças
      - 50% estudantes

Quinta-Feira
      - 30% idosos e estudantes

Sexta-Feira
      - 11% crianças

Domingo/Sábados/Feriados
      - 5% Idosos

OBS1.: Todo estudante mediante apresentação da carteirinha de estudante
       possui para todos os dias da semana, exceto finais de semana,
       35% de desconto em todos os ingressos;

OBS2.: Descontos não são cumulativos

*/

class PercentualDescontosTests: XCTestCase {
    
    private var percentualDescontos: PercentualDescontos!
    
    private let descontoSegundaTodos = 10.0
    private let descontoEstudanteCarteirinhaDiaDeSemana = 35.0
    
    private let descontoTercaIdosoECrianca = 15.0
    private let descontoTercaEstudante = 5.0
    
    private let descontoQuartaIdoso = 40.0
    private let descontoQuartaCrianca = 30.0
    private let descontoQuartaEstudante = 50.0
    
    private let descontoQuintaIdosoEEstudante = 30.0
    private let descontoQuintaCrianca = 0.0
    
    private let descontoSextaCrianca = 11.0
    private let descontoSextaIdosoEEstudante = 0.0
    
    private let descontoSabadoDomingoEFeriadoEstudanteECrianca = 0.0
    private let descontoSabadoDomingoEFeriadoIdoso = 5.0
    private let descontoEstudanteCarteirinhaFimDeSemana = 0.0

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testPercentualDescontoConformeDia() {
        percentualDescontos = Dia.segunda.descontos
        XCTAssertEqual(descontoSegundaTodos, percentualDescontos.criancas)
        XCTAssertEqual(descontoSegundaTodos, percentualDescontos.idosos)
        XCTAssertEqual(descontoSegundaTodos, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaDiaDeSemana, percentualDescontos.estudantesComCarteirinha)
        
        percentualDescontos = Dia.terca.descontos
        XCTAssertEqual(descontoTercaIdosoECrianca, percentualDescontos.criancas)
        XCTAssertEqual(descontoTercaIdosoECrianca, percentualDescontos.idosos)
        XCTAssertEqual(descontoTercaEstudante, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaDiaDeSemana, percentualDescontos.estudantesComCarteirinha)
        
        percentualDescontos = Dia.quarta.descontos
        XCTAssertEqual(descontoQuartaCrianca, percentualDescontos.criancas)
        XCTAssertEqual(descontoQuartaIdoso, percentualDescontos.idosos)
        XCTAssertEqual(descontoQuartaEstudante, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaDiaDeSemana, percentualDescontos.estudantesComCarteirinha)
        
        percentualDescontos = Dia.quinta.descontos
        XCTAssertEqual(descontoQuintaCrianca, percentualDescontos.criancas)
        XCTAssertEqual(descontoQuintaIdosoEEstudante, percentualDescontos.idosos)
        XCTAssertEqual(descontoQuintaIdosoEEstudante, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaDiaDeSemana, percentualDescontos.estudantesComCarteirinha)
        
        percentualDescontos = Dia.sexta.descontos
        XCTAssertEqual(descontoSextaCrianca, percentualDescontos.criancas)
        XCTAssertEqual(descontoSextaIdosoEEstudante, percentualDescontos.idosos)
        XCTAssertEqual(descontoSextaIdosoEEstudante, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaDiaDeSemana, percentualDescontos.estudantesComCarteirinha)
        
        percentualDescontos = Dia.sabadoDomingoFeriado.descontos
        XCTAssertEqual(descontoSabadoDomingoEFeriadoEstudanteECrianca, percentualDescontos.criancas)
        XCTAssertEqual(descontoSabadoDomingoEFeriadoIdoso, percentualDescontos.idosos)
        XCTAssertEqual(descontoSabadoDomingoEFeriadoEstudanteECrianca, percentualDescontos.estudantes)
        XCTAssertEqual(descontoEstudanteCarteirinhaFimDeSemana, percentualDescontos.estudantesComCarteirinha)
    }

}
