//
//  Resources.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inActive = UIColor(hexString: "#929DA5")
        
        static let separator = UIColor(hexString: "#E8ECEF")
        static let backgroundColor = UIColor(hexString: "#F8F9F9")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#545C77")
        
        static let subTitleGray = UIColor(hexString: "#D8D8D8")
        
        
    }
    
    enum Strings {
        enum NavBar {
            static let overview = "Today"
            static let session = "Hight, Itensity Cardio"
            static let progress = "Workout Progress"
            static let settings = "Settings"
        }
        
        enum TabBar {
            static func title(for tab: Tabs) -> String {
                switch tab {
                case .overview: return "Home"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        
        enum Settings {}
        
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Details"
            
            static let dailyPerformance = "Daily Performans"
            static let last7days = "Last 7 days"
            
            static let monthlyPerformance = "Monthly performance"
            static let last10months = "Last 10 months"
            
            
        }
        
        enum Session {
            static let navBarStart = "Start   "
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Remaining Time"
            static let completedPersent = "COMPLETED"
            static let remainingPersent = "REMAINING"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"
            
            static let stepsCounter = "Steps Counter"
        }
        
        enum Overview {
            static let allWorkoutButton = "All Workouts"
        }
        
    }
    enum Images {
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(systemName: "house.fill")
                case .session: return UIImage(systemName: "calendar.badge.clock")
                case .progress: return UIImage(systemName: "chart.xyaxis.line")
                case .settings: return UIImage(systemName: "gear")
                }
            }
        }
        enum Session{
            static let heartRate = UIImage(systemName: "heart.circle")
            static let totalSteps = UIImage(systemName: "figure.run.circle")
            static let averagePace = UIImage(systemName: "speedometer")
            static let totalDistance = UIImage(systemName: "mappin.circle")
        }
        enum Common {
            static let downArrow = UIImage(systemName: "chevron.down")
            static let plusButton = UIImage(systemName: "plus")
        }
        enum Overview {
            static let rightArrow = UIImage(systemName: "chevron.right")
            static let checkmarkDone = UIImage(systemName: "checkmark.circle.fill")
            static let checkmarkNotDone = UIImage(systemName: "circle")
        }
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat)-> UIFont {
            UIFont(name: "Helvetica", size: size) ?? UIFont()
        }
    }
}
