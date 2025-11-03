//
//  ViewController.swift
//  firstapp
//
//  Created by Диас Акберген on 12.08.2024.
//
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    lazy var TargetPrice: UITextField = {
        let targetPrice = UITextField()
        targetPrice.placeholder = "0"
        targetPrice.borderStyle = .roundedRect
        targetPrice.keyboardType = .numberPad
        return targetPrice
    }()
    
    lazy var MonthlySaving: UITextField = {
        let monthlySaving = UITextField()
        monthlySaving.placeholder = "0"
        monthlySaving.borderStyle = .roundedRect
        monthlySaving.keyboardType = .numberPad
        return monthlySaving
    }()
    
    lazy var Savings: UITextField = {
        let savings = UITextField()
        savings.placeholder = "0"
        savings.borderStyle = .roundedRect
        savings.keyboardType = .numberPad
        return savings
    }()
    
    lazy var Label: UILabel = {
        let label = UILabel()
        label.text = "My Big Purchase"
        label.font = .systemFont(ofSize: 30)
        return label
    }()
    
    lazy var TargetPriceLabel: UILabel = {
        let largetPriceLabel = UILabel()
        largetPriceLabel.text = "Target Price:"
        largetPriceLabel.font = .systemFont(ofSize: 15)
        return largetPriceLabel
    }()
    lazy var MonthlySavingLabel: UILabel = {
        let monthlySavingLabel = UILabel()
        monthlySavingLabel.text = "Monthly Savings:"
        monthlySavingLabel.font = .systemFont(ofSize: 15)
        return monthlySavingLabel
    }()
    lazy var SavingsLabel: UILabel = {
        let savingsLabel = UILabel()
        savingsLabel.text = "Savings:"
        savingsLabel.font = .systemFont(ofSize: 15)
        return savingsLabel
    }()
    
    lazy var ResultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "Result:"
        resultLabel.font = .systemFont(ofSize: 15)
        return resultLabel
    }()
    
    lazy var CalculateButton: UIButton = {
        let button = UIButton()
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.layer.cornerRadius = 10
        button.backgroundColor = .systemBlue
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        SetupUI()
        
    }

    func SetupUI() {
        view.addSubview(Label)
        view.addSubview(TargetPriceLabel)
        view.addSubview(TargetPrice)
        view.addSubview(MonthlySavingLabel)
        view.addSubview(MonthlySaving)
        view.addSubview(SavingsLabel)
        view.addSubview(Savings)
        view.addSubview(CalculateButton)
        view.addSubview(ResultLabel)
        
        
        
        Label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(30)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        // TARGET PRICE
        TargetPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(Label.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        TargetPrice.snp.makeConstraints { make in
            make.top.equalTo(TargetPriceLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        // MONTHLY SAVING
        MonthlySavingLabel.snp.makeConstraints { make in
            make.top.equalTo(TargetPrice.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        MonthlySaving.snp.makeConstraints { make in
            make.top.equalTo(MonthlySavingLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        
        // SAVINGS
        SavingsLabel.snp.makeConstraints { make in
            make.top.equalTo(MonthlySaving.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        Savings.snp.makeConstraints { make in
            make.top.equalTo(SavingsLabel.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }

        CalculateButton.snp.makeConstraints { make in
            make.top.equalTo(Savings.snp.bottom).offset(40)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
        CalculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        ResultLabel.snp.makeConstraints { make in
            make.top.equalTo(CalculateButton.snp.bottom).offset(20)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(40)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(40)
        }
    }
    @objc func calculate() {
        let a = TargetPrice.text!
        let b = MonthlySaving.text!
        let c = Savings.text!
        let result = (Int(a)! - Int(c)!) / Int(b)!
        ResultLabel.text = String(result)
    }

}

