//
//  StatItemView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 24.12.2022.
//

import UIKit

enum StatsItem {
    case heartRate(value: String)
    case averagePace(value: String)
    case totalDistance(value: String)
    case totalSteps(value: String)
    
    var data: StatItemView.ItemData {
        switch self {
        case .heartRate(let value):
            return .init(image: R.Images.Session.heartRate,
                         value: "\(value) bpm",
                         title: R.Strings.Session.heartRate)
        case .averagePace(let value):
            return .init(image: R.Images.Session.averagePace,
                         value: "\(value) / km",
                         title: R.Strings.Session.averagePace)
        case .totalDistance(let value):
            return .init(image: R.Images.Session.totalDistance,
                         value: "\(value) km",
                         title: R.Strings.Session.totalDistance)
        case .totalSteps(let value):
            return .init(image: R.Images.Session.totalSteps,
                         value: value,
                         title: R.Strings.Session.totalSteps)
        }
    }
}


final class StatItemView: WABaseView {
    
    struct ItemData {
        let image: UIImage?
        let value: String
        let title: String
    }
    
    private let imageView: UIImageView = {
        let image = UIImageView()
        image.tintColor = R.Colors.inActive
        return image
    }()
    
    private let valueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 17)
        label.textColor = R.Colors.titleGray
        return label
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 10)
        label.textColor = R.Colors.inActive
        return label
    }()
    
    private let stackVIew: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        return view
    }()
    
    func configure(with item: StatsItem) {
        imageView.image = item.data.image
        valueLabel.text = item.data.value
        titleLabel.text = item.data.title
    }
}

extension StatItemView {
    override func setupViews(){
        super.setupViews()
        
        setupView(imageView)
        setupView(stackVIew)
        stackVIew.addArrangedSubview(valueLabel)
        stackVIew.addArrangedSubview(titleLabel)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.widthAnchor.constraint(equalToConstant: 30),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor),
            
            stackVIew.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15),
            stackVIew.topAnchor.constraint(equalTo: topAnchor),
            stackVIew.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackVIew.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}

