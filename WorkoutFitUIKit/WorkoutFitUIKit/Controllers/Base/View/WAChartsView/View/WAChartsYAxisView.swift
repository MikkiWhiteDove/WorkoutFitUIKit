//
//  WAChartsYAxisView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 28.12.2022.
//

import UIKit

final class WAChartsYAxisView: WABaseView {
    
    private let stackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .equalSpacing
        return view
    }()
    
    func configure(with data: [WAChartsView.Data]){
        
        stackView.arrangedSubviews.forEach{
            $0.removeFromSuperview()
        }
        (0...9).reversed().forEach {
            let label = UILabel()
            label.font = R.Fonts.helveticaRegular(with: 9)
            label.textColor = R.Colors.inActive
            label.textAlignment = .right
            label.text = "\($0 * 10)"
            
            stackView.addArrangedSubview(label)
        }
    }
}

extension WAChartsYAxisView {
    override func setupViews(){
        super.setupViews()
        
        setupView(stackView)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        backgroundColor = .clear
    }
}
