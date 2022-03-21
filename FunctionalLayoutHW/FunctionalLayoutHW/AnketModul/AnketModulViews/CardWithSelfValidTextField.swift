//
//  CardWithSelfValidTextField.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 20.03.2022.
//


import UIKit

final class CardWithSelfValidTextField: UIView {
    var finalLayout: FinalLayout?
    var viewModel: ViewModel! {
        didSet {
            guard viewModel != oldValue else {return}
            finalLayout = nil
            titleLabel.text = viewModel.pickTitle
            descriptionLabel.text = viewModel.pickDescription
            setNeedsLayout()
        }
    }
    
    private var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    private var descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .systemGray
        label.numberOfLines = 0
        return label
    }()
    
    var validationLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .red
        label.numberOfLines = 0
        return label
    }()
    
    var calloriesTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .systemGray5
        tf.layer.cornerRadius = 8
        tf.borderStyle = .roundedRect
        tf.placeholder = "Введите Ваш возраст..."
        return tf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let builder = LayoutBuilder(widthOfCard: frame.width,
                                    viewModel: viewModel)
        
        let finalLayout = builder.calculateLayout()
        
        titleLabel.frame = finalLayout.titleLabelFrame
        calloriesTextField.frame = finalLayout.caloriesTextFieldFrame
        descriptionLabel.frame = finalLayout.descriptionLabelFrame
        validationLabel.frame = finalLayout.validationLabelFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CardWithSelfValidTextField {
    private func setupView() {
        backgroundColor = .white
        addSubviews([
            titleLabel,
            calloriesTextField,
            descriptionLabel,
            validationLabel
        ])
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
}

extension CardWithSelfValidTextField {
    struct LayoutBuilder {
        
        let widthOfCard: CGFloat
        let viewModel: ViewModel
        
        func calculateLayout() -> FinalLayout {
            let padding: CGFloat = 20
            
            let titleLabelWidth = widthOfCard - padding * 2
            
            var titleLabelHeight: CGFloat {
                viewModel
                    .pickTitle
                    .height(
                        withWidth: titleLabelWidth,
                        font: .systemFont(ofSize: 17))
            }
            let descriptionLabelWidth = widthOfCard - padding * 2
            var descriptionLabelHeight: CGFloat {
                viewModel.descriptionLabelIsShowed ?
                viewModel
                    .pickDescription
                    .height(
                        withWidth: descriptionLabelWidth,
                        font: .systemFont(ofSize: 15))
                :
                0
            }
            var caloriseTextFieldHeight: CGFloat {
                36
                
            }
            var caloriseTextFieldWidth: CGFloat {
                widthOfCard - padding * 2
                
            }
            var validationLabelHeight: CGFloat {
                viewModel.validationLabelIsShowed ? 30 : 0
            }
            var validationLabelWidth: CGFloat {
                widthOfCard - padding * 2
            }
            
            var offset: CGFloat {
                padding
            }
            
            let titleLabelFrame = CGRect(x: padding,
                                         y: padding,
                                         width: titleLabelWidth,
                                         height: titleLabelHeight)
            
            let descriptionLabelFrame = CGRect(x: padding,
                                               y: titleLabelFrame.maxY + padding / 5,
                                               width: descriptionLabelWidth,
                                               height: descriptionLabelHeight)
            
            let caloriesTextFieldFrame = CGRect(x: 20,
                                                y: descriptionLabelFrame.maxY + padding / 2,
                                                width: caloriseTextFieldWidth,
                                                height: caloriseTextFieldHeight)
            
            let validationLabelFrame = CGRect(x: 20,
                                              y: caloriesTextFieldFrame.maxY,
                                              width: validationLabelWidth,
                                              height: validationLabelHeight)
            
            return FinalLayout(
                caloriesTextFieldFrame: caloriesTextFieldFrame,
                titleLabelFrame: titleLabelFrame,
                descriptionLabelFrame: descriptionLabelFrame, validationLabelFrame: validationLabelFrame,
                offset: offset
            )
        }
    }
    
    struct FinalLayout {
        let caloriesTextFieldFrame: CGRect
        let titleLabelFrame: CGRect
        let descriptionLabelFrame: CGRect
        var validationLabelFrame: CGRect
        let offset: CGFloat
        var cardHeight: CGFloat {
            validationLabelFrame.maxY + 5
        }
    }
}

extension CardWithSelfValidTextField {
    struct ViewModel: Equatable {
        let pickTitle: String
        let pickDescription: String
        var validationLabelIsShowed: Bool
        let descriptionLabelIsShowed: Bool
        var pickButtonIsPressed: Bool
    }
}





