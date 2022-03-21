//
//  ResultViewController.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//

import UIKit

class ResultViewController: UIViewController {
    var sex = ""
    var age = ""
    var formula = ""
    
    let scrollView: UIScrollView = {
        let view = UIScrollView()
        return view
    }()
    
    let contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    var selectedCell: UIView?
    let resultView = ResultView()
    var resultViewModel = ResultView.ViewModel(sexText: "", ageText: "", formulaText: "")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultViewModel.sexText = "Ваш пол: \(sex)"
        resultViewModel.ageText = "Ваш возраст: \(age)"
        resultViewModel.formulaText = "Система: \(formula)"
        setupViews()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        let cardWithTextFieldFrameHeight = ResultView.LayoutBuilder(
            widthOfCard: UIScreen.main.bounds.width - 20 - 20,
            viewModel: resultViewModel
        )
            .calculateLayout()
            .cardHeight
        
        let cardWithTextFieldFrame = CGRect(x: 20,
                                            y: 20,
                                            width: UIScreen.main.bounds.width - 20 - 20,
                                            height: cardWithTextFieldFrameHeight)
        
        resultView.frame = cardWithTextFieldFrame
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
        view.addSubview(resultView)
        resultView.viewModel = resultViewModel
        contentView.addSubviews([
            resultView
        ])
    }
}
