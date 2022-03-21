//
//  SexViewController.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 20.03.2022.
//

import UIKit

class SexViewController: UIViewController {
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
    let firstModel = CardView.ViewModel(pickTitle: "Мужской", pickDescription: "", moreButtonIsShowed: false, descriptionLabelIsShowed: false , pickButtonIsPressed: true)
    let secondModel = CardView.ViewModel(pickTitle: "Женский", pickDescription: "", moreButtonIsShowed: false, descriptionLabelIsShowed: false, pickButtonIsPressed: true)
    
    let continueButtonView = ContinueButton()
    let continueButtonViewModel = ContinueButton.ViewModel(moreButtonIsActive: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        continueButtonView.continueButton.isEnabled = false
        continueButtonView.continueButton.addTarget(nil, action: #selector(continueButtonPressed), for: .touchUpInside)
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
        
        let firstFrame = CGRect(x: 20,
                                y: 20,
                                width: UIScreen.main.bounds.width - 20 - 20,
                                height: firstCardHeight)
        let secondFrame = CGRect(x: 20,
                                 y: firstFrame.maxY + 20,
                                 width: UIScreen.main.bounds.width - 20 - 20,
                                 height: secondCardHeight)
        
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
        continueButtonView.frame = continueButtonViewFrame
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width
                                        , height: firstCardHeight + secondCardHeight )
        contentView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: firstCardHeight + secondCardHeight + 60)
    }
}

extension SexViewController {
    func setupScrollView(){
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        scrollView.frame = view.bounds
    }
    func setupViews(){
        view.backgroundColor = .secondarySystemBackground
        title = "Выберите ваш пол"
        setupScrollView()
        view.addSubview(continueButtonView)
        continueButtonView.viewModel = continueButtonViewModel
        firstView.viewModel = firstModel
        secondView.viewModel = secondModel
        
        contentView.addSubviews([
            firstView, secondView
        ])
        firstView.pickButton.addTarget(self, action: #selector(tappedCard1), for: .touchUpInside)
        secondView.pickButton.addTarget(self, action: #selector(tappedCard2), for: .touchUpInside)
    }
}

extension SexViewController {
    @objc func tappedCard1 () {
        secondView.highlightedCard = false
        selectedCard = firstView
        if firstView.highlightedCard {
            continueButtonView.continueButton.isEnabled = false
        } else {
            continueButtonView.continueButton.isEnabled = true
        }
        
        firstView.highlightedCard.toggle()
    }
    @objc func tappedCard2 () {
        firstView.highlightedCard = false
        selectedCard = secondView
        if secondView.highlightedCard {
            continueButtonView.continueButton.isEnabled = false
        } else {
            continueButtonView.continueButton.isEnabled = true
        }
        secondView.highlightedCard.toggle()
    }
}

extension SexViewController {
    @objc func continueButtonPressed() {
        let ageVC = AgeViewController()
        guard let selectedCard = selectedCard else {return}
        ageVC.sex = selectedCard.viewModel.pickTitle
        navigationController?.pushViewController(ageVC, animated: true)
    }
}
