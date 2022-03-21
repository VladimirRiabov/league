//
//  ContinueButton.swift
//  FunctionalLayoutHW
//
//  Created by Владимир Рябов on 21.03.2022.
//

import UIKit

final class ContinueButton: UIView {
    var finalLayout: FinalLayout?
    var viewModel: ViewModel! {
        didSet {
            guard viewModel != oldValue else {return}
            finalLayout = nil
            setNeedsLayout()
        }
    }
    
    var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Продолжить", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(red: 130.0/255.0, green: 236.0/255.0, blue: 130.0/255.0, alpha: 1.0)
        button.setTitleColor(.white, for: .normal)
        button.layer.cornerRadius = 8
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
        
        continueButton.frame = finalLayout.moreButtonFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ContinueButton {
    private func setupView() {
        backgroundColor = .white
        
        addSubviews([
            continueButton
        ])
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
}

extension ContinueButton {
    struct LayoutBuilder {
        let widthOfCard: CGFloat
        let viewModel: ViewModel
        func calculateLayout() -> FinalLayout {
            let padding: CGFloat = 20
            var moreButtonHeight: CGFloat {
                36
            }
            var moreButtonWidth: CGFloat {
                widthOfCard - padding * 2
            }
            var offset: CGFloat {
                padding
            }
            
            let moreButtonFrame = CGRect(x: padding,
                                         y: padding,
                                         width: moreButtonWidth,
                                         height: moreButtonHeight)
            
            return FinalLayout(
                moreButtonFrame: moreButtonFrame,
                offset: offset
            )
        }
    }
    
    struct FinalLayout {
        let moreButtonFrame: CGRect
        let offset: CGFloat
        var cardHeight: CGFloat {
            moreButtonFrame.maxY + offset
        }
    }
}

extension ContinueButton {
    struct ViewModel: Equatable {
        let moreButtonIsActive: Bool
    }
}
