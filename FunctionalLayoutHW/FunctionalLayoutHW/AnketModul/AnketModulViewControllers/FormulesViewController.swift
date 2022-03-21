//
//  ViewController.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 19.03.2022.
//

import UIKit

class FormulesViewController: UIViewController {
    var sex = ""
    var age = ""
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var selectedCard: CardView?
    
    let firstView = CardView()
    let secondView = CardView()
    let thirdView = CardView()
    
    let firstModel = CardView.ViewModel(pickTitle: "Формула Харриса-Бенедикта", pickDescription: "Классическая формула для рассчета суточной потребности в каллориях", moreButtonIsShowed: true, descriptionLabelIsShowed: true, pickButtonIsPressed: true)
    let secondModel = CardView.ViewModel(pickTitle: "Формула Миффлина-Сан Жеора", pickDescription: "Более современная формула, принятая в 2005 году", moreButtonIsShowed: true, descriptionLabelIsShowed: true, pickButtonIsPressed: true)
    let thirdModel = CardView.ViewModel(pickTitle: "Выберу сам", pickDescription: "Я знаю сколько калорий мне нужно", moreButtonIsShowed: false, descriptionLabelIsShowed: false, pickButtonIsPressed: true)
    
    let continueButtonView = ContinueButton()
    let continueButtonViewModel = ContinueButton.ViewModel(moreButtonIsActive: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let firstCardHeight = CardView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: firstModel
        )
            .calculateLayout()
            .cardHeight
        let secondCardHeight = CardView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: secondModel
        )
            .calculateLayout()
            .cardHeight
        let thirdCardHeight = CardView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: thirdModel
        )
            .calculateLayout()
            .cardHeight
        
        let firstFrame = CGRect(x: 20,
                                y: 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: firstCardHeight)
        let secondFrame = CGRect(x: 20,
                                 y: firstFrame.maxY + 20,
                                 width: UIScreen.main.bounds.width - 20 - 20,
                                 height: secondCardHeight)
        
        let thirdFrame = CGRect(x: 20,
                                y: secondFrame.maxY + 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: thirdCardHeight)
        
        let continueButtonViewFrameHeight = ContinueButton.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: continueButtonViewModel
        )
            .calculateLayout()
            .cardHeight
        
        
        let continueButtonViewFrame = CGRect(x: 20,
                                             y: UIScreen.main.bounds.height - continueButtonViewFrameHeight - 20,
                                             width: UIScreen.main.bounds.width - 20 - 20,
                                             height: continueButtonViewFrameHeight)
        
        firstView.frame = firstFrame
        secondView.frame = secondFrame
        thirdView.frame = thirdFrame
        continueButtonView.frame = continueButtonViewFrame
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width
                                        , height: firstCardHeight + secondCardHeight + thirdCardHeight + continueButtonViewFrameHeight * 2 + 20 )
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: firstCardHeight + secondCardHeight + thirdCardHeight + continueButtonViewFrameHeight * 2 + 20)
    }
    
    private func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
    }
    
    private func setupViews() {
        view.backgroundColor = .secondarySystemBackground
        title = "Выберите систему"
        firstView.viewModel = firstModel
        secondView.viewModel = secondModel
        thirdView.viewModel = thirdModel
        setupScrollView()
        view.addSubview(continueButtonView)
        continueButtonView.viewModel = continueButtonViewModel
        contentView.addSubviews([
            firstView, secondView, thirdView
        ])
        
        firstView.pickButton.addTarget(self, action: #selector(tappedCard1), for: .touchUpInside)
        secondView.pickButton.addTarget(self, action: #selector(tappedCard2), for: .touchUpInside)
        thirdView.pickButton.addTarget(self, action: #selector(tappedCard3), for: .touchUpInside)
        continueButtonView.continueButton.isEnabled = false
        continueButtonView.continueButton.addTarget(nil, action: #selector(continueButtonPressed), for: .touchUpInside)
        firstView.moreButton.addTarget(nil, action: #selector(firstViewMoreButtonPressed), for: .touchUpInside)
        secondView.moreButton.addTarget(nil, action: #selector(secondViewMoreButtonPressed), for: .touchUpInside)
    }
}

extension FormulesViewController {
    @objc func tappedCard1 () {
        secondView.highlightedCard = false
        thirdView.highlightedCard = false
        if firstView.highlightedCard {
            continueButtonView.continueButton.isEnabled = false
        } else {
            continueButtonView.continueButton.isEnabled = true
        }
        selectedCard = firstView
        firstView.highlightedCard.toggle()
    }
    @objc func tappedCard2 () {
        firstView.highlightedCard = false
        thirdView.highlightedCard = false
        if secondView.highlightedCard {
            continueButtonView.continueButton.isEnabled = false
        } else {
            continueButtonView.continueButton.isEnabled = true
        }
        selectedCard = secondView
        secondView.highlightedCard.toggle()
    }
    @objc func tappedCard3 () {
        firstView.highlightedCard = false
        secondView.highlightedCard = false
        if thirdView.highlightedCard {
            continueButtonView.continueButton.isEnabled = false
        } else {
            continueButtonView.continueButton.isEnabled = true
        }
        selectedCard = thirdView
        thirdView.highlightedCard.toggle()
    }
    
}

extension FormulesViewController {
    @objc func continueButtonPressed() {
        let resultVC = ResultViewController()
        resultVC.age = age
        resultVC.sex = sex
        resultVC.formula = selectedCard!.viewModel.pickTitle
        navigationController?.pushViewController(resultVC, animated: true)
    }
    
    @objc func firstViewMoreButtonPressed() {
        let formuleMoretVC = FormuleMoreViewController()
        formuleMoretVC.formula = firstView.viewModel.pickTitle
        navigationController?.pushViewController(formuleMoretVC, animated: true)
    }
    @objc func secondViewMoreButtonPressed() {
        let formuleMoretVC = FormuleMoreViewController()
        formuleMoretVC.formula = secondView.viewModel.pickTitle
        navigationController?.pushViewController(formuleMoretVC, animated: true)
    }
}



