//
//  ValorDoIngressoComDescontoTests.swift
//  desafio-umovTests
//
//  Created by João on 19/05/21.
//  Copyright © 2021 João. All rights reserved.
//

import XCTest
@testable import desafio_umov

class ValorDoIngressoComDescontoTests: XCTestCase {
    
    private var valorIngressoComDesconto: ValorDoIngressoComDesconto!
    private var valorDesconto: ValorDoDesconto!

    override func setUp() {
    }

    override func tearDown() {
    }
    
    func testValorDoIngressoComDesconto() {
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .segunda)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .terca)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .quarta)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .quinta)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .sexta)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .sabadoDomingoFeriado)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.criancas)
        XCTAssertEqual(0, valorIngressoComDesconto.idosos)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
    }
    
    func testValorDoIngressoComDescontoEstudanteComCarteirinha() {
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .segunda, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .terca, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .quarta, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .quinta, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .sexta, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
        
        valorDesconto = ValorDoDesconto.calculaDesconto(dia: .sabadoDomingoFeriado, estudanteComCarteirinha: true)
        valorIngressoComDesconto = ValorDoIngressoComDesconto.calculaValorComDesconto(valorDesconto)
        XCTAssertEqual(0, valorIngressoComDesconto.estudantes)
    }

}
