//
//  TrainingCellView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 21.04.2023.
//

import UIKit

enum CellRoundedType {
    case top, bottom, all, notRounded
}

final class TrainingCellView: UICollectionViewCell {
    static let id = "TrainingCellView"
    
    private let checkmarkView = UIImageView(image: R.Images.Overview.checkmarkNotDone)
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 3
        stack.alignment = .leading
        return stack
    }()
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let subtitle: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inActive
        label.textAlignment = .center
        return label
    }()
    
    private let rightArrowView = UIImageView(image: R.Images.Overview.rightArrow)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    required init?(coder: NSCoder) {
        super.init(frame: .zero)
        
        setupViews()
        constraintViews()
        configureAppearance()
    }
    
    func configure(with title: String, subtitle: String, isDone: Bool, roundedType: CellRoundedType) {
        self.title.text = title
        self.subtitle.text = subtitle
        checkmarkView.image = isDone ? R.Images.Overview.checkmarkDone : R.Images.Overview.checkmarkNotDone
        switch roundedType {
        case .all: self.roundCorners(.allCorners, radius: 5)
        case .top: self.roundCorners([.topRight, .topLeft], radius: 5)
        case .bottom: self.roundCorners([.bottomRight, .bottomLeft], radius: 5)
        case .notRounded: self.roundCorners(.allCorners, radius: 0)
        }
    }
}

private extension TrainingCellView{
    
    func setupViews() {
        setupView(checkmarkView)
        setupView(stackView)
        stackView.addArrangedSubview(title)
        stackView.addArrangedSubview(subtitle)
        setupView(rightArrowView)
    }
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            checkmarkView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            checkmarkView.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkmarkView.heightAnchor.constraint(equalToConstant: 20),
            checkmarkView.widthAnchor.constraint(equalTo: checkmarkView.heightAnchor),
            
            stackView.leadingAnchor.constraint(equalTo: checkmarkView.trailingAnchor, constant: 15),
            stackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stackView.trailingAnchor.constraint(equalTo: rightArrowView.leadingAnchor, constant: -15),
            
            rightArrowView.centerYAnchor.constraint(equalTo: centerYAnchor),
            rightArrowView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            rightArrowView.widthAnchor.constraint(equalToConstant: 7),
            rightArrowView.heightAnchor.constraint(equalToConstant: 12)
        ])
    }
    
    func configureAppearance() {
        backgroundColor = .white
        layer.borderWidth = 1
        layer.borderColor = R.Colors.separator.cgColor
        
    }
}



