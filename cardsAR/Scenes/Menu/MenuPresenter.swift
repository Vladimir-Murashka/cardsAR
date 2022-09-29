//
//  MenuPresenter.swift
//  cardsAR
//
//  Created by Swift Learning on 29.09.2022.
//

// MARK: - MenuPresenterProtocol

protocol MenuPresenterProtocol: AnyObject {}

// MARK: - MenuPresenter

final class MenuPresenter {
    weak var viewController: MenuViewProtocol?
    
    // MARK: - PrivateProperties
    
    // MARK: - Initializer
}

//MARK: - MenuPresenterExtension

extension MenuPresenter: MenuPresenterProtocol {}
