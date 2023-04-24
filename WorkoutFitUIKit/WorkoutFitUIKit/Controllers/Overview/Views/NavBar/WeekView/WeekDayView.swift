//
//  WeekDayView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 15.12.2022.
//

import UIKit


extension WeekView {
    final class WeekDayView: WABaseView {
        private let nameLabel = UILabel()
        private let dateLabel = UILabel()
        private let stakView = UIStackView()
        
        func configure(with index: Int, and name: String){
            let startOfWeek = Date().startOfWeek
            let currentDay = startOfWeek.agoForward(to: index)
            let day = Date.calendar.component(.day, from: currentDay)
            
            let isToday = currentDay.stripTime() == Date().stripTime()
            
            backgroundColor = isToday ? R.Colors.active : R.Colors.backgroundColor
            
            nameLabel.text = name.uppercased()
            nameLabel.textColor = isToday ? .white : R.Colors.inActive
            dateLabel.text = "\(day)"
            dateLabel.textColor = isToday ? .white : R.Colors.inActive
        }
    }
}

extension WeekView.WeekDayView {
    override func setupViews() {
        super.setupViews()
        setupView(stakView)
        
        stakView.addArrangedSubview(nameLabel)
        stakView.addArrangedSubview(dateLabel)
        
    }
    
    override func constraintViews() {
        super.constraintViews()
        NSLayoutConstraint.activate([
            stakView.centerYAnchor.constraint(equalTo: centerYAnchor),
            stakView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        
        layer.cornerRadius = 5
        layer.masksToBounds = true
        
        nameLabel.font = R.Fonts.helveticaRegular(with: 10)
        nameLabel.textAlignment = .center
        
        dateLabel.font = R.Fonts.helveticaRegular(with: 15)
        dateLabel.textAlignment = .center
        
        stakView.spacing = 3
        stakView.axis = .vertical
    }
}
