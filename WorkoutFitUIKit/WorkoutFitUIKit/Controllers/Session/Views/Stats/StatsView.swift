//
//  StatsView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 24.12.2022.
//

import UIKit

final class StatsView: WABaseInfoView {
    private let stackView: UIStackView = {
       let view = UIStackView()
        view.axis = .vertical
        view.spacing = 15
        return view
    }()
    
    func configure(with items: [StatsItem]){
        items.forEach {
            let itemView = StatItemView()
            itemView.configure(with: $0)
            stackView.addArrangedSubview(itemView)
        }
    }
}

extension StatsView {
    override func setupViews(){
        super.setupViews()
        
        setupView(stackView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}
