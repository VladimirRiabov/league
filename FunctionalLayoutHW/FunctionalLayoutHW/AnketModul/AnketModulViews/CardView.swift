//
//  PickView.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 19.03.2022.
//

import UIKit

final class CardView: UIView {
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
    
    var highlightedCard: Bool = false {
        didSet {
            UIView.animate(withDuration: 0.5,
                           delay: 0.1,
                           options: .curveEaseInOut,
                           animations: {
                self.highlightedCard ? (self.layer.borderColor = UIColor(red: 184.0/255.0, green: 236.0/255.0, blue: 188.0/255.0, alpha: 1.0).cgColor) : (self.layer.borderColor = UIColor.secondarySystemBackground.cgColor)
            }, completion: nil)
            highlightedCard ? (pickButton.setImage(UIImage(named: "image2") , for: .normal)) : (pickButton.setImage(UIImage(named: "image") , for: .normal))
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
    
    var moreButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Подробнее", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13, weight: .light)
        button.backgroundColor = .systemGray4
        button.setTitleColor(.systemBlue, for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()
    
    var pickButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitleColor(.green, for: .normal)
        button.setImage(UIImage(named: "image") , for: .normal)
        return button
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
        
        titleLabel.frame = finalLayout.titleLabelFrame
        moreButton.frame = finalLayout.moreButtonFrame
        pickButton.frame = finalLayout.pickButtonFrame
        descriptionLabel.frame = finalLayout.descriptionLabelFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
extension CardView {
    private func setupView() {
        backgroundColor = .white
        
        addSubviews([
            titleLabel,
            moreButton,
            pickButton,
            descriptionLabel
        ])
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
}

extension CardView {
    struct LayoutBuilder {
        let widthOfCard: CGFloat
        let viewModel: ViewModel
        func calculateLayout() -> FinalLayout {
            let padding: CGFloat = 20
            
            var pickButtonHeight: CGFloat {
                36
            }
            var pickButtonWidth: CGFloat {
                36
            }
            let titleLabelWidth = widthOfCard - padding * 3 - pickButtonWidth
            var titleLabelY: CGFloat {
                if viewModel.descriptionLabelIsShowed == false {
                    return padding + 7
                } else {
                    return viewModel.moreButtonIsShowed ? padding : padding + 7
                }
            }
            var titleLabelHeight: CGFloat {
                viewModel
                    .pickTitle
                    .height(
                        withWidth: titleLabelWidth,
                        font: .systemFont(ofSize: 17))
                
            }
            
            let descriptionLabelWidth = widthOfCard - padding * 3 - pickButtonWidth
            var descriptionLabelHeight: CGFloat {
                viewModel.descriptionLabelIsShowed ?
                viewModel
                    .pickDescription
                    .height(
                        withWidth: descriptionLabelWidth,
                        font: .systemFont(ofSize: 15)) : 0
            }
            var moreButtonHeight: CGFloat {
                viewModel.moreButtonIsShowed ? 36 : 0
            }
            var moreButtonWidth: CGFloat {
                viewModel.moreButtonIsShowed ? widthOfCard - padding * 2 : 0
            }
            var offset: CGFloat {
                if viewModel.descriptionLabelIsShowed == false && viewModel.moreButtonIsShowed == false {
                    return padding
                } else {
                    return moreButtonHeight + padding + 7
                }
            }
            
            let titleLabelFrame = CGRect(x: padding * 2 + pickButtonWidth,
                                         y: titleLabelY,
                                         width: titleLabelWidth,
                                         height: titleLabelHeight)
            
            let descriptionLabelFrame = CGRect(x: padding * 2 + pickButtonWidth,
                                               y: titleLabelFrame.maxY + padding / 5,
                                               width: descriptionLabelWidth,
                                               height: descriptionLabelHeight)
            
            let pickButtonFrame = CGRect(x: 20,
                                         y: padding,
                                         width: pickButtonWidth,
                                         height: pickButtonHeight)
            
            let moreButtonFrame = CGRect(x: 20,
                                         y: descriptionLabelFrame.maxY + padding / 2,
                                         width: moreButtonWidth,
                                         height: moreButtonHeight)
            
            return FinalLayout(
                pickButtonFrame: pickButtonFrame,
                moreButtonFrame: moreButtonFrame,
                titleLabelFrame: titleLabelFrame,
                descriptionLabelFrame: descriptionLabelFrame,
                offset: offset
            )
        }
    }
    
    struct FinalLayout {
        let pickButtonFrame: CGRect
        let moreButtonFrame: CGRect
        let titleLabelFrame: CGRect
        let descriptionLabelFrame: CGRect
        let offset: CGFloat
        var cardHeight: CGFloat {
            descriptionLabelFrame.maxY + offset
            
        }
    }
}

extension CardView {
    struct ViewModel: Equatable {
        let pickTitle: String
        let pickDescription: String
        let moreButtonIsShowed: Bool
        let descriptionLabelIsShowed: Bool
        let pickButtonIsPressed: Bool
    }
}
