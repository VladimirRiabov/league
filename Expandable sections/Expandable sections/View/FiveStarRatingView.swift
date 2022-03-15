//
//  FiveStarRatingView.swift
//  Expandable sections
//
//  Created by Владимир Рябов on 13.03.2022.
//

import UIKit

class FiveStarRatingView: UIStackView {
    
    let spacingBetweenStars: Int = 4
    let starSize: CGFloat = 22.0
    
    var ratingButtons = [UIButton]()
    var rating: Int = 0 {
        didSet {
            updateButtonSelectionStates()
        }
    }
    var starCount: Int = 5 {
        didSet {
            setUpButtons()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        isUserInteractionEnabled = true
        spacing = CGFloat(spacingBetweenStars)
        setUpButtons()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setUpButtons()
    }
    
    private func setUpButtons() {
        for button in ratingButtons {
            removeArrangedSubview(button)
            button.removeFromSuperview()
        }
        ratingButtons.removeAll()
        
        for index in 0..<starCount {
            let button = UIButton()
            button.backgroundColor = .yellow
            button.setImage(UIImage(named:"emptyStar"), for: .normal)
            button.setImage(UIImage(named: "filledStar"), for: .selected)
            button.setImage(UIImage(named: "highlightedStar"), for: .highlighted)
            button.setImage(UIImage(named: "highlightedStar"), for: [.highlighted, .selected])
            button.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                button.heightAnchor.constraint(equalToConstant: starSize),
                button.widthAnchor.constraint(equalToConstant: starSize)
            ])
            
            button.addTarget(self, action: #selector(ratingButtonTapped(button:)), for: .touchUpInside)
            button.accessibilityLabel = "Set \(index)+1 star rating"
            addArrangedSubview(button)
            ratingButtons.append(button)
        }
        
        updateButtonSelectionStates()
    }
    
    @objc func ratingButtonTapped(button: UIButton) {
        
        guard let index = ratingButtons.firstIndex(of: button) else {
            fatalError("Button is not in the array of Buttons")
        }
        let selectedRating = index+1
        if selectedRating == rating {
            rating = 0
        } else {
            rating = selectedRating
        }
        print(rating)
    }
    
    func updateButtonSelectionStates() {
        for (index, button) in ratingButtons.enumerated() {
            button.isSelected = index < rating
            let hintString: String?
            if rating == index + 1 {
                hintString = "Tap to reset the rating to zero."
            } else {
                hintString = nil
            }
            let valueString: String
            switch (rating) {
            case 0:
                valueString = "No rating set."
            case 1:
                valueString = "1 star set."
            default:
                valueString = "\(rating) stars set."
            }
            button.accessibilityHint = hintString
            button.accessibilityValue = valueString
        }
    }
}

