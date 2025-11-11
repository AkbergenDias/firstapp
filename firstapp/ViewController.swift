//
//  ViewController.swift
//  firstapp
//
//  Created by Диас Акберген on 12.08.2024.
//
//

import UIKit
import SnapKit

class ViewController: UIViewController, UITextFieldDelegate {
    var currentSavings = 0.0
    var targetPrice = 0.0
    var progress: Float = 0.0
    
    var goal: Goal?
    var goalIndex: Int?
    weak var delegate: GoalUpdateDelegate?
    
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
    
    lazy var Textfield: UITextField = {
        let textField = UITextField()
        textField.text = ""
        textField.font = UIFont.preferredFont(forTextStyle: .title1)
        textField.textAlignment = .left
        textField.textColor = .label
        textField.adjustsFontForContentSizeCategory = true
        return textField
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
    
    lazy var AddSavingButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Add saving", for: .normal)
        button.titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
        button.layer.cornerRadius = 8
        button.backgroundColor = .systemBackground
        button.setTitleColor(.systemGreen, for: .normal)
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.systemGreen.cgColor
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
        view.backgroundColor = .systemBackground
        title = "Big Purchase Calculator"
        
        if let g = goal {
            Textfield.text = g.name
            TargetPrice.text = g.targetPrice > 0 ? "\(Int(g.targetPrice))" : ""
            MonthlySaving.text = g.monthlySaving > 0 ? "\(Int(g.monthlySaving))" : ""
            currentSavings = g.currentSavings
            targetPrice = g.targetPrice
            
            updateProgressBar()
            updatePigImage()
            let remaining = max(targetPrice - currentSavings, 0)
            ResultLabel.text = remaining <= 0 ? "🎉 Goal reached!" : "Remaining: \(Int(remaining)) ₸"
        }
    }
    
    func SetupUI() {
        view.addSubview(Textfield)
        view.addSubview(TargetPriceLabel)
        view.addSubview(TargetPrice)
        view.addSubview(MonthlySavingLabel)
        view.addSubview(MonthlySaving)
        view.addSubview(CalculateButton)
        view.addSubview(AddSavingButton)
        view.addSubview(ResultLabel)
        view.addSubview(ProgressBar)
        view.addSubview(PigImage)
        
        
        
        Textfield.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        
        // TARGET PRICE
        TargetPriceLabel.snp.makeConstraints { make in
            make.top.equalTo(Textfield.snp.bottom).offset(28)
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
        
        CalculateButton.snp.makeConstraints { make in
            make.top.equalTo(MonthlySaving.snp.bottom).offset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        CalculateButton.addTarget(self, action: #selector(calculate), for: .touchUpInside)
        
        AddSavingButton.snp.makeConstraints { make in
            make.top.equalTo(CalculateButton.snp.bottom).offset(32)
            make.leading.equalTo(view.safeAreaLayoutGuide).inset(24)
            make.trailing.equalTo(view.safeAreaLayoutGuide).inset(24)
        }
        AddSavingButton.addTarget(self, action: #selector(addSavings), for: .touchUpInside)
        
        PigImage.snp.makeConstraints { make in
            make.top.equalTo(AddSavingButton.snp.bottom).offset(32)
            make.centerX.equalToSuperview()
            make.width.height.equalTo(150)
        }
        
        ProgressBar.snp.makeConstraints { make in
            make.top.equalTo(PigImage.snp.bottom).offset(16)
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
        
        // Validation
        guard targetPrice > 0, monthlySaving > 0 else {
            ResultLabel.text = "Enter valid numbers"
            return
        }
        
        // Calculation
        let remaining = targetPrice
        if remaining <= 0 {
            ResultLabel.text = "You already have enough 🎉"
            return
        }
        
        let monthsNeeded = Int(ceil(Double(remaining) / Double(monthlySaving)))
        ResultLabel.text = "Months needed: \(monthsNeeded)"
    }
    
    @objc func addSavings() {
        let alert = UIAlertController(title: "Add Savings", message: "How much do you want to add?", preferredStyle: .alert)
        alert.addTextField { textField in
            textField.keyboardType = .decimalPad
            textField.placeholder = "Amount"
        }
        let addAction = UIAlertAction(title: "Add", style: .default) { [weak self] _ in
            guard let self = self else { return }
            let text = alert.textFields?.first?.text ?? ""
            let amount = Double(text) ?? 0.0
            if amount > 0 {
                self.currentSavings += amount
                self.targetPrice = Double(self.TargetPrice.text ?? "") ?? 0.0
                self.updateProgressBar()
                self.updatePigImage()
                let remaining = max(self.targetPrice - self.currentSavings, 0)
                self.ResultLabel.text = remaining <= 0 ? "🎉 Goal reached!" : "Remaining: \(Int(remaining)) ₸"
            }
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        present(alert, animated: true, completion: nil)
    }
    func updatePigImage() {
        if progress < 0.33 {
            PigImage.image = UIImage(named: "PiggyPoor")
        } else if progress < 0.66 {
            PigImage.image = UIImage(named: "PiggyGold")
        } else {
            PigImage.image = UIImage(named: "PiggyRich")
        }
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        UserDefaults.standard.setValue(textField.text, forKey: "GoalName")
    }
    
    func updateProgressBar() {
        guard targetPrice > 0 else {
            ProgressBar.progress = 0
            progress = 0
            return
        }
        progress = Float(currentSavings / targetPrice)
        ProgressBar.progress = min(progress, 1)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        guard var goal = goal, let index = goalIndex else { return }
        
        goal.name = Textfield.text ?? "New Goal"
        goal.targetPrice = Double(TargetPrice.text ?? "") ?? 0.0
        goal.monthlySaving = Double(MonthlySaving.text ?? "") ?? 0.0
        goal.currentSavings = currentSavings
        
        delegate?.didUpdateGoal(goal, at: index)
    }
}
