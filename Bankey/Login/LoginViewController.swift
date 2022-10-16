//
//  LoginViewController.swift
//  Bankey
//
//  Created by Артем Орлов on 10.10.2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func didLogin()
}

protocol LogoutDelegate: AnyObject {
    func didLogout()
}

class LoginViewController: UIViewController {
    
    let textStackView = UIStackView()
    let titleLabel = UILabel()
    let secondaryLabel = UILabel()
    let loginView = LoginView()
    let signInButton = UIButton(type: .system)
    let errorMessageLabel = UILabel()
    
    weak var delegate: LoginViewControllerDelegate?
    
    var userName: String? {
        loginView.userNameTextField.text
    }
    
    var password: String? {
        loginView.passwordTextField.text
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        style()
        layout()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        signInButton.configuration?.showsActivityIndicator = false
    }
}

extension LoginViewController {
    private func style() {
        
        textStackView.translatesAutoresizingMaskIntoConstraints = false
        textStackView.axis = .vertical
        textStackView.spacing = 20
        
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.textAlignment = .center
        titleLabel.text = "Bankey"
        titleLabel.font = UIFont.preferredFont(forTextStyle: .title1)
        titleLabel.adjustsFontForContentSizeCategory = true

        
        secondaryLabel.translatesAutoresizingMaskIntoConstraints = false
        secondaryLabel.textAlignment = .center
        secondaryLabel.text = "Your premium source for all things banking"
        secondaryLabel.font = UIFont.preferredFont(forTextStyle: .title3)
        secondaryLabel.numberOfLines = 0
        secondaryLabel.adjustsFontForContentSizeCategory = true
        
        loginView.translatesAutoresizingMaskIntoConstraints = false
        
        signInButton.translatesAutoresizingMaskIntoConstraints = false
        signInButton.configuration = .filled()
        signInButton.configuration?.imagePadding = 8
        signInButton.setTitle("Sign In", for: [])
        signInButton.addTarget(self, action: #selector(signInTapped), for: .primaryActionTriggered)
        
        errorMessageLabel.translatesAutoresizingMaskIntoConstraints = false
        errorMessageLabel.textAlignment = .center
        errorMessageLabel.textColor = .systemRed
        errorMessageLabel.numberOfLines = 0
        errorMessageLabel.text = "Error failure"
        errorMessageLabel.isHidden = true
    }
    
    private func layout() {
        textStackView.addArrangedSubview(titleLabel)
        textStackView.addArrangedSubview(secondaryLabel)
        
        view.addSubview(textStackView)
        view.addSubview(loginView)
        view.addSubview(signInButton)
        view.addSubview(errorMessageLabel)
        
        //Text label
        
        NSLayoutConstraint.activate([
            textStackView.bottomAnchor.constraint(equalTo: loginView.topAnchor, constant: -70),
            textStackView.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            textStackView.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Login view
        NSLayoutConstraint.activate([
            loginView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            loginView.leadingAnchor.constraint(equalToSystemSpacingAfter: view.leadingAnchor, multiplier: 1),
            view.trailingAnchor.constraint(equalToSystemSpacingAfter: loginView.trailingAnchor, multiplier: 1)
        ])
        
        //Button
        NSLayoutConstraint.activate([
            signInButton.topAnchor.constraint(equalToSystemSpacingBelow: loginView.bottomAnchor, multiplier: 2),
            signInButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            signInButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
        ])
        
        //Label error
        NSLayoutConstraint.activate([
            errorMessageLabel.topAnchor.constraint(equalToSystemSpacingBelow: signInButton.bottomAnchor, multiplier: 2),
            errorMessageLabel.leadingAnchor.constraint(equalTo: signInButton.leadingAnchor),
            errorMessageLabel.trailingAnchor.constraint(equalTo: signInButton.trailingAnchor)
        ])
    }
}

// MARK: - Action

extension LoginViewController {
    @objc func signInTapped () {
        errorMessageLabel.isHidden = true
        login()
    }
    
    private func login() {
        guard let userName = userName, let password = password else {
            assertionFailure("Username / password shpuld never be nil")
            return
        }
        
        if userName.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / password cannot be blank")
        }
        
        if userName == "1" && password == "1" {
            signInButton.configuration?.showsActivityIndicator = true
            delegate?.didLogin() 
        } else {
            configureView(withMessage: "Incorrect suername / password")
            signInButton.configuration?.showsActivityIndicator = false
        }
    }
    private func configureView(withMessage message: String ) {
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
}
