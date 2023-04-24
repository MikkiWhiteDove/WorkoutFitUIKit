//
//  PersentView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 22.12.2022.
//

import UIKit


extension TimerView {
    final class PersentView: WABaseView {
        
        private let stackView = {
            let stack = UIStackView()
            stack.axis = .vertical
            stack.distribution = .fillProportionally
            stack.spacing = 5
            return stack
        }()
        
        private let persentLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 23)
            label.textColor = R.Colors.titleGray
            label.textAlignment = .center
            return label
        }()
        
        private let subTitleLabel: UILabel = {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 10)
            label.textColor = R.Colors.inActive
            label.textAlignment = .center
            return label
        }()
    }
}

extension TimerView.PersentView{
    override func setupViews() {
        super.setupViews()
        
        setupView(stackView)
        stackView.addArrangedSubview(persentLabel)
        stackView.addArrangedSubview(subTitleLabel)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
    
    func configure(with title: String, andvalue value: Int) {
        subTitleLabel.text = title
        persentLabel.text = "\(value)%"
    }
}

