//
//  MenuViewController.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

import UIKit

// MARK: - MenuViewProtocol

protocol MenuViewProtocol: UIViewController {}

// MARK: - MenuViewController

final class MenuViewController: UIViewController {
    var presenter: MenuPresenterProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Actions

}


// MARK: - MenuViewProtocol Impl

extension MenuViewController: MenuViewProtocol {}

// MARK: - PrivateMethods

private extension MenuViewController {
    func setupViewController() {
        view.backgroundColor = .orange
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
    }
    
    func setupConstraints() {
        
        NSLayoutConstraint.activate([
        ])
    }
}

