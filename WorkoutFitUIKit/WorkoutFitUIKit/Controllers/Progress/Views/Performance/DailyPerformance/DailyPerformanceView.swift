//
//  DailyPerformanceView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 27.12.2022.
//

import UIKit

final class DailyPerformanceView: WABaseInfoView {
    private let barsView = WABarsView()
    
    func configure(with items: [WABarView.Data]){
        barsView.configure(with: items)
    }
}

extension DailyPerformanceView {
    override func setupViews(){
        super.setupViews()
        
        setupView(barsView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            barsView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15),
            barsView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            barsView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -15),
            barsView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}


