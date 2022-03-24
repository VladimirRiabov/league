//
//  ResultView.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 22.03.2022.
//

import UIKit

final class ResultView: UIView {
    var finalLayout: FinalLayout?
    var viewModel: ViewModel! {
        didSet {
            guard viewModel != oldValue else {return}
            finalLayout = nil
            companyNameLabel.text = viewModel.companyNameText
            symbolLabel.text = viewModel.symbolText
            priceLabel.text = viewModel.priceText
            priceChangeLabel.text = viewModel.priceChangeText
            setNeedsLayout()
        }
    }
    
    private var companyNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var symbolLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var priceLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var priceChangeLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
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
        companyNameLabel.frame = finalLayout.companyNameLabelFrame
        priceLabel.frame = finalLayout.priceLabelFrame
        symbolLabel.frame = finalLayout.symbolLabelFrame
        priceChangeLabel.frame = finalLayout.priceChangeLabelFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ResultView {
    private func setupView() {
        backgroundColor = .white
        
        addSubviews([
            companyNameLabel,
            priceLabel,
            symbolLabel,
            priceChangeLabel
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
            
            let companyNameLabelHeight = viewModel
                .companyNameText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 17))
            
            let priceLabelHeight = viewModel
                .priceText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 17))
            
            let symbolLabelHeight = viewModel
                .symbolText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 17))
            
            let priceChangeLabelHeight = viewModel
                .priceChangeText
                .height(
                    withWidth: widthOfCard - padding * 2,
                    font: .systemFont(ofSize: 17))
            
            let companyNameLabelFrame = CGRect(x: padding,
                                               y: padding,
                                               width: widthOfCard - padding * 2,
                                               height: companyNameLabelHeight)
            
            let priceLabelFrame = CGRect(x: padding,
                                         y: companyNameLabelFrame.maxY + padding / 5,
                                         width: companyNameLabelFrame.width,
                                         height: priceLabelHeight)
            
            let symbolFrame = CGRect(x: padding,
                                     y: priceLabelFrame.maxY + padding / 5,
                                     width: companyNameLabelFrame.width,
                                     height: symbolLabelHeight)
            
            let priceChangeLabelFrame = CGRect(x: padding,
                                               y: symbolFrame.maxY + padding / 5,
                                               width: companyNameLabelFrame.width,
                                               height: priceChangeLabelHeight)
            
            return FinalLayout(
                companyNameLabelFrame: companyNameLabelFrame,
                priceLabelFrame: priceLabelFrame,
                symbolLabelFrame: symbolFrame,
                priceChangeLabelFrame: priceChangeLabelFrame,
                padding: padding
            )
        }
    }
    
    struct FinalLayout {
        let companyNameLabelFrame: CGRect
        let priceLabelFrame: CGRect
        let symbolLabelFrame: CGRect
        let priceChangeLabelFrame: CGRect
        let padding: CGFloat
        var cardHeight: CGFloat {
            priceChangeLabelFrame.maxY + padding
        }
    }
}

extension ResultView {
    struct ViewModel: Equatable {
        var companyNameText: String
        var priceText: String
        var symbolText: String
        var priceChangeText: String
    }
}
