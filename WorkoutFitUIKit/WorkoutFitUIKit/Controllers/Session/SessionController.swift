//
//  SessionController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

class SessionController: BaseController {
    
    private let timerView = TimerView()
    private let statsView = StatsView(with: R.Strings.Session.workoutStats)
    private let stepsView = StepsView(with: R.Strings.Session.stepsCounter)
    
    private let timerDuration = 60.0
    
    override func navBarLeftButtonHendler() {
        if timerView.state == .isStopped {
            timerView.startTimer()
        } else {
            timerView.pauseTimer()
        }
        
        timerView.state = timerView.state == .isRuning ? .isStopped  : .isRuning
        setTitleForNavBarButton(
            timerView.state == .isRuning ? R.Strings.Session.navBarPause : R.Strings.Session.navBarStart,
            at: .left)
    }
    override func navBarRightButtonHendler() {
        timerView.stopTimer()
        timerView.state = .isStopped
        
        setTitleForNavBarButton(R.Strings.Session.navBarStart, at: .left)
    }
}

extension SessionController {
    override func addViews() {
        super.addViews()
        
        view.setupView(timerView)
        view.setupView(statsView)
        view.setupView(stepsView)
    }
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([
            timerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            timerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 15),
            timerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            
            statsView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15),
            statsView.topAnchor.constraint(equalTo: timerView.bottomAnchor, constant: 10),
            statsView.trailingAnchor.constraint(equalTo: view.centerXAnchor, constant: -7.5),
//            statsView.heightAnchor.constraint(equalToConstant: 200),
            
            stepsView.leadingAnchor.constraint(equalTo: view.centerXAnchor, constant: 7.5),
            stepsView.topAnchor.constraint(equalTo: statsView.topAnchor),
            stepsView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15),
            stepsView.heightAnchor.constraint(equalTo: statsView.heightAnchor),
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
        
        title = R.Strings.NavBar.session
        navigationController?.tabBarItem.title = R.Strings.TabBar.title(for: .session)
        
        addNavBarButton(at: .left, with: R.Strings.Session.navBarStart)
        addNavBarButton(at: .right, with: R.Strings.Session.navBarFinish)
        timerView.configure(with: timerDuration, progress: 0)
        
        timerView.callBack = { [weak self] in
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self?.navBarRightButtonHendler()
            })
        }
        statsView.configure(with: [
            .heartRate(value: "155"),
            .averagePace(value: "8'20''"),
            .totalSteps(value: "7,682"),
            .totalDistance(value: "8.25")
        ])
        
        stepsView.configure(with: [
            .init(value: "8k", title: "2.14", heightMultiple: 1),
            .init(value: "7k", title: "2.15", heightMultiple: 0.8),
            .init(value: "5k", title: "2.16", heightMultiple: 0.6),
            .init(value: "6k", title: "2.17", heightMultiple: 0.7)
        ])
    }
}
