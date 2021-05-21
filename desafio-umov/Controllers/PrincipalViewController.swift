//
//  PrincipalViewController.swift
//  desafio-umov
//
//  Created by João on 18/05/21.
//  Copyright © 2021 João. All rights reserved.
//

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
        binding()
    }
    
    override func loadView() {
        self.view = uiController
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
