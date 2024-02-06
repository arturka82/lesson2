//
//  ViewController.swift
//  lesson2

import UIKit

class ViewController: UIViewController {

    let firstButton: UIButton = {
        CustomButton(title: "First Button", imageSystemName: "arrow.right.circle.fill")
    }()

    let secondButton: UIButton = {
        CustomButton(title: "Second button", imageSystemName: "arrow.right.circle.fill")
    }()

    let thirdButton: UIButton = {
        CustomButton(title: "Third", imageSystemName: "arrow.right.circle.fill")
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(firstButton)
        view.addSubview(secondButton)
        view.addSubview(thirdButton)

        NSLayoutConstraint.activate([
            firstButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            firstButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16),

            secondButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            secondButton.topAnchor.constraint(equalTo: firstButton.bottomAnchor, constant: 20),

            thirdButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            thirdButton.topAnchor.constraint(equalTo: secondButton.bottomAnchor, constant: 20)
        ])
        
        firstButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        firstButton.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        
        secondButton.addTarget(self, action: #selector(buttonTapped(_:)), for: .touchDown)
        secondButton.addTarget(self, action: #selector(buttonReleased(_:)), for: .touchUpInside)
        
        thirdButton.addTarget(self, action: #selector(presentModalController), for: .touchUpInside)
    }

    @objc func buttonTapped(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
        }
    }

    @objc func buttonReleased(_ sender: UIButton) {
        UIView.animate(withDuration: 0.2) {
            sender.transform = .identity
        }
    }

    @objc func presentModalController() {
        let modalViewController = UIViewController()
        modalViewController.view.backgroundColor = .white
        present(modalViewController, animated: true, completion: nil)
    }
}
