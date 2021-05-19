//
//  PrincipalViewController.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

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

import UIKit

class PrincipalViewController: UIViewController {
    
    private var viewModel: PrincipalViewModelProtocol
    private var uiController = PrincipalView()
    
    init(viewModel: PrincipalViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        uiController.tableView.delegate = self
        uiController.tableView.dataSource = self
        uiController.estudanteComCarteirinhaSwitch.addTarget(self, action: #selector(estudanteComCarteirinha(_:)), for: .valueChanged)
        setupView()
        binding()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        uiController.ajustaAlturaTableView()
    }
    
    func binding() {
        viewModel.atualizaValoresNaView = { [weak self] valorDesconto, valorIngressoComDesconto in
            guard let self = self else {
                return
            }
            self.uiController.valorDescontoCrianca.text = """
            Ingresso criança: R$ \(ValoresIngresso.crianca.rawValue)
            Desconto: R$ \(valorDesconto?.criancas ?? 0.0)
            Total: R$ \(valorIngressoComDesconto?.criancas ?? 0.0)
            """
            
            self.uiController.valorDescontoEstudante.text = """
            Ingresso estudantes: R$ \(ValoresIngresso.estudante.rawValue)
            Desconto: R$ \(valorDesconto?.estudantes ?? 0.0)
            Total: R$ \(valorIngressoComDesconto?.estudantes ?? 0.0)
            """
            
            self.uiController.valorDescontoIdoso.text = """
            Ingresso idoso: R$ \(ValoresIngresso.idoso.rawValue)
            Desconto: R$ \(valorDesconto?.idosos ?? 0.0)
            Total: R$ \(valorIngressoComDesconto?.idosos ?? 0.0)
            """
        }
    }
    
    @objc func estudanteComCarteirinha(_ sender: UISwitch) {
        viewModel.estudanteComCarteirinha = sender.isOn
    }
}

extension PrincipalViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.dias.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = CustomCell(dia: viewModel.dias[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? CustomCell else { return }
        if cell.accessoryType == .none {
            tableView.visibleCells.forEach({ $0.accessoryType = .none })
            cell.accessoryType = .checkmark
            viewModel.diaSelecionado = cell.dia
        } else {
            cell.accessoryType = .none
            viewModel.diaSelecionado = nil
        }
    }
}

extension PrincipalViewController: ConfigurarView {
    func addSubviews() {
        view.addSubview(uiController)
    }
    
    func addContraints() {
        uiController.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor).isActive = true
        uiController.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        uiController.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        uiController.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
}
