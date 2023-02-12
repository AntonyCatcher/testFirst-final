//
//  SheetViewController.swift
//  testFirst
//
//  Created by Anton  on 10.02.2023.
//

import UIKit

class SheetViewController: UIViewController {
    
    // MARK: - Properties
    
    // Initialize CollectionViews
    let firstCV = FirstCollectionView()
    let secondCV = SecondCollectionView()
    
    // Create a UIView for the button and label
    private lazy var viewForButtonAndLabel: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    // Create a lazy var for the sheet view
    private lazy var sheetView: UIView = {
        let view = UIView()
        
        view.backgroundColor = .white
        
        return view
    }()
    
    // UIButton for sending request
    private var sendButton: UIButton = {
        let button = UIButton()
       
        button.frame = CGRect(x: 100, y: 100, width: 219, height: 60)
        button.backgroundColor = .black
        button.layer.cornerRadius = button.bounds.height / 2
        button.setTitle("Отправить заявку", for: .normal)
        button.titleLabel?.text = "Отправить заявку"
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 15, weight: .medium)
        
        // Add target to open an alert when the button is tapped
        button.addTarget(self, action: #selector(openAlert), for: .touchUpInside)
        
        return button
    }()
    
    // Function to open an alert when the send button is tapped
    @objc func openAlert() {
    
            let alert = UIAlertController(title: "Поздравляем!", message: "Ваша заявка успешно отправлена!", preferredStyle: UIAlertController.Style.alert)
        // Add an action to close the alert
            alert.addAction(UIAlertAction(title: "Закрыть", style: UIAlertAction.Style.default, handler: nil))
        // Present the alert
            self.present(alert, animated: true, completion: nil)
        
    }
    
    // UILabel to display "Хочешь к нам?"
    private let firstLabel: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 20, y: 100, width: 120, height: 20)
        label.text = "Хочешь к нам?"
        label.font = .init(name: "14_20_Regular SF", size: 15)
        label.textColor = .systemGray
        
        return label
    }()
    
    // UILabel to display "Стажировка в Surf"
    private var titleLabel: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 20, y: 100, width: 214, height: 32)
        label.text = "Стажировка в Surf"
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textColor = .black
        
        return label
    }()
    
    // TextView for the first description
    private var firstDesctiprion: UITextView = {
        let firstDesctiprionText = UITextView()
        
        firstDesctiprionText.text = "Работай над реальными задачами под руководством опытного наставника и получи возможность стать частью команды мечты."
        firstDesctiprionText.frame = CGRect(x: 20, y: 100, width: 335, height: 70)
        firstDesctiprionText.textColor = .systemGray
        firstDesctiprionText.font = .systemFont(ofSize: 14, weight: .regular)
        
        return firstDesctiprionText
    }()
    
    // TextView for the second description
    var secondDesctiprion: UITextView = {
        let secondDesctiprionText = UITextView()
        
        secondDesctiprionText.text = "Получай стипендию, выстраивай удобный график, работай на современном железе."
        secondDesctiprionText.frame = CGRect(x: 20, y: 100, width: 335, height: 50)
        secondDesctiprionText.textColor = .systemGray
        secondDesctiprionText.font = .systemFont(ofSize: 14, weight: .regular)
        
        return secondDesctiprionText
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Call the function to set up the view
        setView()
        // Hide the second description and secondCV
        secondDesctiprion.isHidden = true
        secondCV.isHidden = true
    }
    
    // Function to set up the view
    private func setView() {
        
        // Add the sheetView to the main view
        view.addSubview(sheetView)
        
        // Add the title label, collection views and description text views to the sheetView
        sheetView.addSubview(titleLabel)
        sheetView.addSubview(firstCV)
        sheetView.addSubview(secondCV)
        sheetView.addSubview(firstDesctiprion)
        sheetView.addSubview(secondDesctiprion)
        
        // Add the view for the button and label to the sheetView, and add the button and label to the view for the button and label
        sheetView.addSubview(viewForButtonAndLabel)
        viewForButtonAndLabel.addSubview(sendButton)
        viewForButtonAndLabel.addSubview(firstLabel)
        
        // Call the function to set up Constraints
        Constraints()
    }
    
    // Initialize bottom constraint
    private var bottomConstraint = NSLayoutConstraint()
    
    //adding constraints to the label
    private func Constraints() {
        
        // Disable autoresizing masks
        sheetView.translatesAutoresizingMaskIntoConstraints = false
        sendButton.translatesAutoresizingMaskIntoConstraints = false
        firstLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        firstDesctiprion.translatesAutoresizingMaskIntoConstraints = false
        secondDesctiprion.translatesAutoresizingMaskIntoConstraints = false
        viewForButtonAndLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Set the bottom constraint of sheetView to the bottom anchor of view with 0 constant
        bottomConstraint = sheetView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        
        NSLayoutConstraint.activate([
            
            // Set bottom, left, right, and height constraints for views, button, labels
            
            viewForButtonAndLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
            viewForButtonAndLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
            viewForButtonAndLabel.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
            viewForButtonAndLabel.heightAnchor.constraint(equalToConstant: 120),
            
            sendButton.bottomAnchor.constraint(equalTo: viewForButtonAndLabel.bottomAnchor, constant: -50),
            sendButton.leftAnchor.constraint(equalTo: firstLabel.rightAnchor, constant: 20),
            sendButton.rightAnchor.constraint(equalTo: viewForButtonAndLabel.rightAnchor, constant: -20),
            sendButton.heightAnchor.constraint(equalToConstant: 60),
            
            firstLabel.leftAnchor.constraint(equalTo: viewForButtonAndLabel.leftAnchor, constant: 20),
            firstLabel.widthAnchor.constraint(equalToConstant: 120),
            firstLabel.heightAnchor.constraint(equalToConstant: 20),
            firstLabel.bottomAnchor.constraint(equalTo: viewForButtonAndLabel.bottomAnchor, constant: -70),
            
            titleLabel.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20),
            titleLabel.widthAnchor.constraint(equalToConstant: 260),
            titleLabel.heightAnchor.constraint(equalToConstant: 32),
            titleLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 24),
            
            firstDesctiprion.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 17),
            firstDesctiprion.widthAnchor.constraint(equalToConstant: 335),
            firstDesctiprion.heightAnchor.constraint(equalToConstant: 70),
            
            sheetView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            sheetView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            bottomConstraint,
            sheetView.heightAnchor.constraint(equalTo: view.heightAnchor),
            
            firstCV.topAnchor.constraint(equalTo: firstDesctiprion.bottomAnchor, constant: 12),
            firstCV.leftAnchor.constraint(equalTo: sheetView.leftAnchor, constant: 20),
            firstCV.heightAnchor.constraint(equalToConstant: 44),
            firstCV.rightAnchor.constraint(equalTo: sheetView.rightAnchor),
            firstCV.topAnchor.constraint(equalTo: sheetView.topAnchor, constant: 140),
            
            secondDesctiprion.leftAnchor.constraint(equalTo: sheetView.leftAnchor, constant: 20),
            secondDesctiprion.heightAnchor.constraint(equalToConstant: 50),
            secondDesctiprion.widthAnchor.constraint(equalToConstant: 335),
            secondDesctiprion.topAnchor.constraint(equalTo: firstCV.bottomAnchor, constant: 24),
            
            secondCV.topAnchor.constraint(equalTo: secondDesctiprion.bottomAnchor, constant: 12),
            secondCV.leftAnchor.constraint(equalTo: sheetView.leftAnchor, constant: 20),
            secondCV.heightAnchor.constraint(equalToConstant: 100),
            secondCV.rightAnchor.constraint(equalTo: sheetView.rightAnchor)
        ])
    }
}


