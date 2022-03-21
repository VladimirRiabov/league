//
//  ResultView.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//

import UIKit

final class ResultView: UIView {
    var finalLayout: FinalLayout?
    var viewModel: ViewModel! {
        didSet {
            guard viewModel != oldValue else {return}
            finalLayout = nil
            formulaLabel.text = viewModel.formulaText
            ageLabel.text = viewModel.ageText
            sexLabel.text = viewModel.sexText
            setNeedsLayout()
        }
    }
    
    private var formulaLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var ageLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    private var sexLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        guard let viewModel = viewModel else { return }
        let builder = LayoutBuilder(widthOfCard: frame.width,
                                    viewModel: viewModel)
        let finalLayout = builder.calculateLayout()
        formulaLabel.frame = finalLayout.formulaLabelFrame
        sexLabel.frame = finalLayout.sexLabelFrame
        ageLabel.frame = finalLayout.ageLabelFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResultView {
    private func setupView() {
        backgroundColor = .white
        
        addSubviews([
            formulaLabel,
            sexLabel,
            ageLabel
        ])
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
}

extension ResultView {
    struct LayoutBuilder {
        let widthOfCard: CGFloat
        let viewModel: ViewModel
        func calculateLayout() -> FinalLayout {
            let padding: CGFloat = 20
            
            let dietLabelHeight = viewModel
                .formulaText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 17))
            
            let ageLabelHeight = viewModel
                .ageText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 15))
            
            let sexLabelHeight = viewModel
                .sexText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 15))
            
            
            let dietLabelFrame = CGRect(x: padding,
                                        y: padding,
                                        width: widthOfCard - padding * 2,
                                        height: dietLabelHeight)
            
            let ageLabelFrame = CGRect(x: padding,
                                       y: dietLabelFrame.maxY + padding / 5,
                                       width: dietLabelFrame.width,
                                       height: ageLabelHeight)
            
            let sexLabelFrame = CGRect(x: padding,
                                       y: ageLabelFrame.maxY + padding / 5,
                                       width: dietLabelFrame.width,
                                       height: sexLabelHeight)
            
            return FinalLayout(
                formulaLabelFrame: dietLabelFrame,
                ageLabelFrame: ageLabelFrame,
                sexLabelFrame: sexLabelFrame,
                padding: padding
            )
        }
    }
    
    struct FinalLayout {
        let formulaLabelFrame: CGRect
        let ageLabelFrame: CGRect
        let sexLabelFrame: CGRect
        let padding: CGFloat
        var cardHeight: CGFloat {
            sexLabelFrame.maxY + padding
        }
    }
}

extension ResultView {
    struct ViewModel: Equatable {
        var sexText: String
        var ageText: String
        var formulaText: String
    }
}
