//
//  ValorDoDescontoTests.swift
//  desafio-umovTests
//
//  Created by João on 19/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import XCTest
@testable import desafio_umov

class ValorDoDescontoTests: XCTestCase {
    
    private var descontos: ValorDoDesconto!
    
    private let valorDescontoSegundaCrianca = 0.55
    private let valorDescontoSegundaIdoso = 0.60
    private let valorDescontoSegundaEstudante = 0.80
    
    private let valorDescontoTercaCrianca = 0.83
    private let valorDescontoTercaIdoso = 0.90
    private let valorDescontoTercaEstudante = 0.40
    
    private let valorDescontoQuartaCrianca = 1.65
    private let valorDescontoQuartaIdoso = 2.40
    private let valorDescontoQuartaEstudante = 4.00
    
    private let valorDescontoQuintaCrianca = 0.0
    private let valorDescontoQuintaIdoso = 1.80
    private let valorDescontoQuintaEstudante = 2.40
    
    private let valorDescontoSextaCrianca = 0.61
    private let valorDescontoSextaIdoso = 0.0
    private let valorDescontoSextaEstudante = 0.0
    
    private let valorDescontoSabadoDomingoFeriadoCrianca = 0.0
    private let valorDescontoSabadoDomingoFeriadoIdoso = 0.30
    private let valorDescontoSabadoDomingoFeriadoEstudante = 0.0
    
    private let valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha = 2.80
    private let valorDescontoSabadoDomingoFeriadoEstudanteSemCarteirinha = 0.0

    override func setUp() {
    }

    override func tearDown() {
    }

    func testCalculaDesconto() {
        descontos = ValorDoDesconto.calculaDesconto(dia: .segunda)
        XCTAssertEqual(valorDescontoSegundaCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoSegundaIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoSegundaEstudante, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .terca)
        XCTAssertEqual(valorDescontoTercaCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoTercaIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoTercaEstudante, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .quarta)
        XCTAssertEqual(valorDescontoQuartaCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoQuartaIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoQuartaEstudante, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .quinta)
        XCTAssertEqual(valorDescontoQuintaCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoQuintaIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoSextaEstudante, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .sexta)
        XCTAssertEqual(valorDescontoSextaCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoSextaIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoSextaEstudante, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .sabadoDomingoFeriado)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoCrianca, descontos.criancas)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoIdoso, descontos.idosos)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudante, descontos.estudantes)
    }
    
    func testCalculaDescontoEstudanteComCarteirinha() {
        descontos = ValorDoDesconto.calculaDesconto(dia: .segunda, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha,
                       descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .terca, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha,
                       descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .quarta, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha, descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .quinta, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha,
                       descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .sexta, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteComCarteirinha,
                       descontos.estudantes)
        
        descontos = ValorDoDesconto.calculaDesconto(dia: .sabadoDomingoFeriado, estudanteComCarteirinha: true)
        XCTAssertEqual(valorDescontoSabadoDomingoFeriadoEstudanteSemCarteirinha,
                       descontos.estudantes)
    }

}
