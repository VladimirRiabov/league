//
//  AgeViewController.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//


import UIKit

class AgeViewController: UIViewController {
    let validityType: String.ValidityType = .age
    var sex = ""
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var selectedCell: UIView?
    let cardWithTextField = CardWithSelfValidTextField()
    var cardWithSelfValidTextFieldVieModel = CardWithSelfValidTextField.ViewModel(pickTitle: "Cколько Вам лет?", pickDescription: "Ваш возраст необходим для точного рассчета", validationLabelIsShowed: true, descriptionLabelIsShowed: true, pickButtonIsPressed: true)
    
    let continueButtonView = ContinueButton()
    let continueButtonViewModel = ContinueButton.ViewModel(moreButtonIsActive: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        let cardWithTextFieldFrameHeight = CardWithSelfValidTextField.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: cardWithSelfValidTextFieldVieModel
        )
            .calculateLayout()
            .cardHeight
        let continueButtonViewFrameHeight = ContinueButton.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: continueButtonViewModel
        )
            .calculateLayout()
            .cardHeight
        
        let cardWithTextFieldFrame = CGRect(x: 20,
                                            y: 20,
                                            width: UIScreen.main.bounds.width - 20 - 20,
                                            height: cardWithTextFieldFrameHeight)
        
        let continueButtonViewFrame = CGRect(x: 20,
                                             y: UIScreen.main.bounds.height - continueButtonViewFrameHeight - 20,
                                             width: UIScreen.main.bounds.width - 20 - 20,
                                             height: continueButtonViewFrameHeight)
        
        cardWithTextField.frame = cardWithTextFieldFrame
        continueButtonView.frame = continueButtonViewFrame
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width
                                        , height: cardWithTextFieldFrameHeight + 40 )
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: cardWithTextFieldFrameHeight + 40)
    }
    
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = .secondarySystemBackground
        title = "Ваш возраст"
        setupScrollView()
        view.addSubview(continueButtonView)
        cardWithTextField.viewModel = cardWithSelfValidTextFieldVieModel
        continueButtonView.viewModel = continueButtonViewModel
        contentView.addSubviews([
            cardWithTextField
        ])
        cardWithTextField.calloriesTextField.delegate = self
        cardWithTextField.calloriesTextField.addTarget(self, action: #selector(handleTextChange), for: .editingChanged)
        continueButtonView.continueButton.isEnabled = false
        continueButtonView.continueButton.addTarget(nil, action: #selector(continueButtonPressed), for: .touchUpInside)
    }
}

extension AgeViewController {
    @objc func continueButtonPressed() {
        let formulesVC = FormulesViewController()
        formulesVC.sex = sex
        formulesVC.age = cardWithTextField.calloriesTextField.text ?? "Ошибка"
        navigationController?.pushViewController(formulesVC, animated: true)
    }
    
}

extension AgeViewController {
    @objc fileprivate func handleTextChange() {
        guard let text = cardWithTextField.calloriesTextField.text  else { return }
        cardWithTextField.validationLabel.transform = CGAffineTransform(translationX: 0, y: -20).scaledBy(x: 1.0, y: 0.0)
        if cardWithTextField.calloriesTextField.text == "" {
            continueButtonView.continueButton.isEnabled = false
        } else {
            UIView.animate(withDuration: 1.0,
                           delay: 0,
                           options: .transitionFlipFromBottom,
                           animations: {
                self.cardWithTextField.validationLabel.transform = CGAffineTransform(translationX: 0, y: 0).scaledBy(x: 1.0, y: 1.0)
            }, completion: nil)
            switch validityType {
            case .age:
                if text.isValid(validityType) {
                    cardWithTextField.validationLabel.textColor = UIColor(red: 130.0/255.0, green: 236.0/255.0, blue: 130.0/255.0, alpha: 1.0)
                    cardWithTextField.validationLabel.text = "Вы ввели Ваш возраст правильно"
                    continueButtonView.continueButton.isEnabled = true
                } else {
                    cardWithTextField.validationLabel.text = "Вы ввели Ваш возраст неправильно!"
                    cardWithTextField.validationLabel.textColor = .systemRed
                    continueButtonView.continueButton.isEnabled = false
                }
            }
        }
    }
}

extension AgeViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        cardWithTextField.calloriesTextField.resignFirstResponder()
        return true
    }
}






