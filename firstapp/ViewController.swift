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
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textAlignment = .center
        label.textColor = .label
        label.adjustsFontForContentSizeCategory = true
        return label
    }()
    
    lazy var TargetPriceLabel: UILabel = {
        let largetPriceLabel = UILabel()
        largetPriceLabel.text = "Target Price:"
        largetPriceLabel.font = UIFont.preferredFont(forTextStyle: .body)
        largetPriceLabel.textAlignment = .left
        largetPriceLabel.textColor = .label
        largetPriceLabel.adjustsFontForContentSizeCategory = true
        return largetPriceLabel
    }()
    lazy var MonthlySavingLabel: UILabel = {
        let monthlySavingLabel = UILabel()
        monthlySavingLabel.text = "Monthly Savings:"
        monthlySavingLabel.font = UIFont.preferredFont(forTextStyle: .body)
        monthlySavingLabel.textAlignment = .left
        monthlySavingLabel.textColor = .label
        monthlySavingLabel.adjustsFontForContentSizeCategory = true
        return monthlySavingLabel
    }()
    lazy var SavingsLabel: UILabel = {
        let savingsLabel = UILabel()
        savingsLabel.text = "Savings:"
        savingsLabel.font = UIFont.preferredFont(forTextStyle: .body)
        savingsLabel.textAlignment = .left
        savingsLabel.textColor = .label
        savingsLabel.adjustsFontForContentSizeCategory = true
        return savingsLabel
    }()
    
    lazy var ResultLabel: UILabel = {
        let resultLabel = UILabel()
        resultLabel.text = "Result:"
        resultLabel.font = UIFont.preferredFont(forTextStyle: .body)
        resultLabel.textAlignment = .left
        resultLabel.textColor = .secondaryLabel
        resultLabel.adjustsFontForContentSizeCategory = true
        return resultLabel
    }()
    
    lazy var CalculateButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Calculate", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBackground
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemBlue.cgColor
        button.clipsToBounds = true
        button.titleLabel?.adjustsFontForContentSizeCategory = true
        return button
    }()
    
    lazy var ProgressBar: UIProgressView = {
        let progressBar = UIProgressView(progressViewStyle: UIProgressView.Style.default)
        return progressBar
    }()
    
    lazy var PigImage: UIImageView = {
        let pigImage = UIImageView(image: UIImage(named: "PiggyPoor"))
        pigImage.contentMode = .scaleAspectFit
        pigImage.clipsToBounds = true
        return pigImage
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
        view.addSubview(ProgressBar)
        view.addSubview(PigImage)
        
        
        
        Label.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        // TARGET PRICE
        TargetPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(Label.snp.bottom).offset(28)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        TargetPrice.snp.makeConstraints { make in
            make.top.equalTo(TargetPriceLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        // MONTHLY SAVING
        MonthlySavingLabel.snp.makeConstraints { make in
            make.top.equalTo(TargetPrice.snp.bottom).offset(28)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        MonthlySaving.snp.makeConstraints { make in
            make.top.equalTo(MonthlySavingLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        // SAVINGS
        SavingsLabel.snp.makeConstraints { make in
            make.top.equalTo(MonthlySaving.snp.bottom).offset(28)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        Savings.snp.makeConstraints { make in
            make.top.equalTo(SavingsLabel.snp.bottom).offset(12)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }

        CalculateButton.snp.makeConstraints { make in
            make.top.equalTo(Savings.snp.bottom).offset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        CalculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        PigImage.snp.makeConstraints { make in
            make.top.equalTo(CalculateButton.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        ProgressBar.snp.makeConstraints { make in
            make.top.equalTo(ResultLabel.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        ResultLabel.snp.makeConstraints { make in
            make.top.equalTo(ProgressBar.snp.bottom).offset(16)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        
        
    }
    @objc func calculate() {
        let targetPrice = Int(TargetPrice.text ?? "") ?? 0
            let monthlySaving = Int(MonthlySaving.text ?? "") ?? 0
            let savings = Int(Savings.text ?? "") ?? 0
            
            // Validation
            guard targetPrice > 0, monthlySaving > 0 else {
                ResultLabel.text = "Enter valid numbers"
                return
            }
            
            // Calculation
            let remaining = targetPrice - savings
            if remaining <= 0 {
                ResultLabel.text = "You already have enough 🎉"
                return
            }
            
            let monthsNeeded = Int(ceil(Double(remaining) / Double(monthlySaving)))
            ResultLabel.text = "Months needed: \(monthsNeeded)"
        }
//    @objc func ProgressBarFill() {
//        let progressBar
//    }

}

