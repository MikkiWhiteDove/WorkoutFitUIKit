//
//  ProgressController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

class ProgressController: BaseController {

    private let dailyPerformanceView = DailyPerformanceView(with: R.Strings.Progress.dailyPerformance,
                                                            buttonTitle: R.Strings.Progress.last7days)
    private let monthlyPerformanceView = MonthlyPerformanceView(with: R.Strings.Progress.monthlyPerformance,
                                                                 buttonTitle: R.Strings.Progress.last10months)
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

extension ProgressController {
    override func addViews() {
        super.addViews()
        
        view.setupView(dailyPerformanceView)
        view.setupView(monthlyPerformanceView)
        
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            dailyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            dailyPerformanceView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            dailyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            dailyPerformanceView.heightAnchor.constraint(equalTo: dailyPerformanceView.widthAnchor, multiplier: 0.68),
            
            monthlyPerformanceView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            monthlyPerformanceView.topAnchor.constraint(equalTo: dailyPerformanceView.bottomAnchor, constant: 15),
            monthlyPerformanceView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            monthlyPerformanceView.heightAnchor.constraint(equalTo: monthlyPerformanceView.widthAnchor, multiplier: 1.06)
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.progress
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .progress)
        
        addNavBarButton(at: .left, with: R.Strings.Progress.navBarLeft)
        addNavBarButton(at: .right, with: R.Strings.Progress.navBarRight)
        
        dailyPerformanceView.configure(with: [
            .init(value: "1", title: "Mon", heightMultiple: 0.2),
            .init(value: "2", title: "Teu", heightMultiple: 0.4),
            .init(value: "3", title: "Wen", heightMultiple: 0.6),
            .init(value: "4", title: "Thu", heightMultiple: 0.8),
            .init(value: "5", title: "Fri", heightMultiple: 1),
            .init(value: "3", title: "Sat", heightMultiple: 0.6),
            .init(value: "2", title: "Sun", heightMultiple: 0.4)
        ])
        
        monthlyPerformanceView.configure(with: [.init(value: 45, title: "Mar"),
                                                .init(value: 55, title: "Apr"),
                                                .init(value: 60, title: "May"),
                                                .init(value: 65, title: "Jun"),
                                                .init(value: 70, title: "Jul"),
                                                .init(value: 80, title: "Aug"),
                                                .init(value: 65, title: "Sep"),
                                                .init(value: 45, title: "Okt"),
                                                .init(value: 30, title: "Nov"),
                                                .init(value: 15, title: "Dec"),
        ], topChartOffset: 10)
    }
}
