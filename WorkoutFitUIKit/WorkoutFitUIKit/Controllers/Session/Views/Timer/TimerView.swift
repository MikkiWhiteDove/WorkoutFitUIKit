//
//  TimerView.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 17.12.2022.
//

import UIKit

enum TimerState {
    case isRuning
    case isPaused
    case isStopped
}

final class TimerView: WABaseInfoView {
    
    private let elepsedTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.elapsedTime
        label.font = R.Fonts.helveticaRegular(with: 14)
        label.textColor = R.Colors.inActive
        label.textAlignment = .center
        return label
    }()
    
    private let elepsedTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 46)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeLabel: UILabel = {
        let label = UILabel()
        label.text = R.Strings.Session.remainingTime
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.inActive
        label.textAlignment = .center
        return label
    }()
    
    private let remainingTimeValueLabel: UILabel = {
        let label = UILabel()
        label.font = R.Fonts.helveticaRegular(with: 13)
        label.textColor = R.Colors.titleGray
        label.textAlignment = .center
        return label
    }()
    
    private let timerStackView: UIStackView = {
        let view = UIStackView()
        view.axis = .vertical
        view.distribution = .fillProportionally
        view.spacing = 10
        return view
    }()
    
    private let bottomStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillProportionally
        view.spacing = 25
        return view
    }()
    
    private let completedPersentView = PersentView()
    private let remainingPersentView = PersentView()
    private let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = R.Colors.separator
        return view
    }()
    
    private let progressView = ProgressView()
    
    private var timer = Timer()
    private var timerProgress: CGFloat = 0
    private var timerDuration: Double = 0.0
    
    public var state: TimerState = .isStopped
    var callBack: (() -> Void)?
    
    
    func configure(with duration: Double, progress: Double) {
        timerDuration = duration
        
        let tempCurrentValue = progress > duration ? duration : progress
        let goalValueDeviver = duration == 0 ? 1 : duration
        let percent = tempCurrentValue / goalValueDeviver
        let roundedPercent = Int(round(percent * 100))
        
        elepsedTimeValueLabel.text = getDisplayString(from: Int(tempCurrentValue))
        remainingTimeValueLabel.text = getDisplayString(from: Int(duration) - Int(tempCurrentValue))
        completedPersentView.configure(with: R.Strings.Session.completedPersent, andvalue: roundedPercent)
        remainingPersentView.configure(with: R.Strings.Session.remainingPersent, andvalue: 100 - roundedPercent)
        progressView.drawProgress(with: CGFloat(percent))
    }
    
    func startTimer(){
        timer.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else {return }
            self.timerProgress += 0.01
            if self.timerProgress > self.timerDuration{
                self.timerProgress = self.timerDuration
                timer.invalidate()
                self.callBack?()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
    func pauseTimer(){
        timer.invalidate()
    }
    func stopTimer(){
        guard self.timerProgress > 0 else {return}
        timer.invalidate()
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true, block: { [weak self] timer in
            guard let self = self else {return }
            self.timerProgress -= self.timerDuration * 0.01
            if self.timerProgress <= 0 {
                self.timerProgress = 0
                timer.invalidate()
            }
            self.configure(with: self.timerDuration, progress: self.timerProgress)
        })
    }
}

extension TimerView {
    override func setupViews(){
        super.setupViews()
        
        setupView(progressView)
        setupView(timerStackView)
        setupView(bottomStackView)
        
        [
            elepsedTimeLabel,
            elepsedTimeValueLabel,
            remainingTimeLabel,
            remainingTimeValueLabel
        ].forEach (timerStackView.addArrangedSubview)
        
        [
            completedPersentView,
            bottomSeparatorView,
            remainingPersentView
        ].forEach (bottomStackView.addArrangedSubview)
    }
    override func constraintViews() {
        super.constraintViews()
        
        NSLayoutConstraint.activate([
            progressView.topAnchor.constraint(equalTo: topAnchor, constant: 40),
            progressView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
            progressView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40),
            progressView.heightAnchor.constraint(equalTo: progressView.widthAnchor),
            progressView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -40),
            
            timerStackView.centerYAnchor.constraint(equalTo: progressView.centerYAnchor),
            timerStackView.centerXAnchor.constraint(equalTo: progressView.centerXAnchor),
            
            bottomStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -28),
            bottomStackView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bottomStackView.heightAnchor.constraint(equalToConstant: 35),
            bottomStackView.widthAnchor.constraint(equalToConstant: 175),
            
            bottomSeparatorView.widthAnchor.constraint(equalToConstant: 1),
            
        ])
    }
    override func configureAppearance() {
        super.configureAppearance()
    }
}


private extension TimerView {
    func getDisplayString(from value: Int)-> String {
        let seconds = value % 60
        let minutes = (value / 60) % 60
        let hours = value / 3600

        let secondsStr = seconds < 10 ? "0\(seconds)" : "\(seconds)"
        let minuteStr = minutes < 10 ? "0\(minutes)" : "\(minutes)"
        let hoursStr = hours < 10 ? "0\(hours)" : "\(hours)"

        return hours == 0
        ? [minuteStr, secondsStr].joined(separator: ":")
        : [hoursStr, minuteStr, secondsStr].joined(separator: ":")
    }
}
