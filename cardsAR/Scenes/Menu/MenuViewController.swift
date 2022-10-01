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
    
    private let imageViewBackgroundScreen: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .black
        imageView.image = UIImage(named: "mainBackground")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    private lazy var startButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle(
            "Начать",
            for: .normal
        )
        button.titleLabel?.font = .systemFont(ofSize: 30)
        button.setTitleColor(
            .white,
            for: .normal
        )
        button.backgroundColor = .black
        button.layer.cornerRadius = 12
        button.layer.masksToBounds = true
        button.addTarget(
            self,
            action: #selector(startButtonPressed),
            for: .touchUpInside
        )
        return button
    }()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewController()
    }
    
    // MARK: - Actions
    
    @objc
    private func startButtonPressed() {
        presenter?.startButtonPressed()
    }
}

// MARK: - MenuViewProtocol Impl

extension MenuViewController: MenuViewProtocol {}

// MARK: - PrivateMethods

private extension MenuViewController {
    func setupViewController() {
        navigationController?.isNavigationBarHidden = true
        addSubViews()
        setupConstraints()
    }
    
    func addSubViews() {
        view.addSubviews(
            imageViewBackgroundScreen,
            startButton
        )
    }
    
    func setupConstraints() {
        let imageViewBackgroundScreenOffset: CGFloat = 0
        let startButtonOffset: CGFloat = 16
        
        NSLayoutConstraint.activate([
            imageViewBackgroundScreen.topAnchor.constraint(
                equalTo: view.topAnchor,
                constant: imageViewBackgroundScreenOffset
            ),
            imageViewBackgroundScreen.trailingAnchor.constraint(
                equalTo: view.trailingAnchor,
                constant: imageViewBackgroundScreenOffset
            ),
            imageViewBackgroundScreen.bottomAnchor.constraint(
                equalTo: view.bottomAnchor,
                constant: imageViewBackgroundScreenOffset
            ),
            imageViewBackgroundScreen.leadingAnchor.constraint(
                equalTo: view.leadingAnchor,
                constant: imageViewBackgroundScreenOffset
            ),
            
            startButton.bottomAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.bottomAnchor,
                constant: -startButtonOffset
            ),
            startButton.leadingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.leadingAnchor,
                constant: startButtonOffset
            ),
            startButton.trailingAnchor.constraint(
                equalTo: view.safeAreaLayoutGuide.trailingAnchor,
                constant: -startButtonOffset
            )
        ])
    }
}
