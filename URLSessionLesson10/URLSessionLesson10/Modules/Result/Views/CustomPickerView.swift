//
//  PickerView.swift
//  URLSessionLesson10
//
//  Created by Владимир Рябов on 22.03.2022.
//


import UIKit

final class CustomPickerView: UIView {
    var finalLayout: FinalLayout?
    var viewModel: ViewModel! {
        didSet {
            guard viewModel != oldValue else {return}
            finalLayout = nil
            setNeedsLayout()
        }
    }
    
    var pickerView: UIPickerView = {
        let picker = UIPickerView()
        return picker
    }()
    
    var activityIndicatorView: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        return ai
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
        
        pickerView.frame = finalLayout.pickerViewFrame
        activityIndicatorView.frame = finalLayout.activityIndicatorViewFrame
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension CustomPickerView {
    private func setupView() {
        backgroundColor = .white
        
        addSubviews([
            pickerView,
            activityIndicatorView
        ])
        layer.cornerRadius = 12
        layer.borderWidth = 4
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
}

extension CustomPickerView {
    struct LayoutBuilder {
        let widthOfCard: CGFloat
        let viewModel: ViewModel
        func calculateLayout() -> FinalLayout {
            let padding: CGFloat = 20
            var activityIndicatorViewHeight: CGFloat {
                50
            }
            var activityIndicatorViewWidth: CGFloat {
                50
            }
            
            var pickerViewHeight: CGFloat {
                150
            }
            var pickerViewWidth: CGFloat {
                widthOfCard - padding * 2
            }
            
            
            var offset: CGFloat {
                padding
            }
            
            
            
            let activityIndicatorViewFrame = CGRect(x: padding,
                                         y: padding,
                                         width: activityIndicatorViewWidth,
                                         height: activityIndicatorViewHeight )
            let pickerViewFrame = CGRect(x: padding,
                                         y: activityIndicatorViewFrame.maxY + padding / 5,
                                         width: pickerViewWidth,
                                         height: pickerViewHeight )
            
            
            
            return FinalLayout(
                pickerViewFrame: pickerViewFrame,
                activityIndicatorViewFrame: activityIndicatorViewFrame,
                offset: offset
            )
        }
    }
    
    struct FinalLayout {
        let pickerViewFrame: CGRect
        let activityIndicatorViewFrame: CGRect
        let offset: CGFloat
        var cardHeight: CGFloat {
            pickerViewFrame.maxY + offset
        }
    }
}

extension CustomPickerView {
    struct ViewModel: Equatable {
        let pickerIsActive: Bool
    }
}


