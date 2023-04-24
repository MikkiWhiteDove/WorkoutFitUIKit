//
//  SectionHeaderView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 21.04.2023.
//

import UIKit

final class SectionHeaderView: UICollectionReusableView {
    static let id = "SectionHeaderView"
    
    private let title: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inActive
        label.textAlignment = .center
        return label
    }()
    
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
    
    func configure(with data: Date) {
        let date = DateFormatter()
        date.dateFormat = "EEEE, MMMM dd"
        
        self.title.text = date.string(from: data).uppercased()
    }
}

private extension SectionHeaderView{
    
    func setupViews() {
        setupView(title)
    }
    func constraintViews() {
        
        NSLayoutConstraint.activate([
            title.centerXAnchor.constraint(equalTo: centerXAnchor),
            title.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func configureAppearance() {}
}
