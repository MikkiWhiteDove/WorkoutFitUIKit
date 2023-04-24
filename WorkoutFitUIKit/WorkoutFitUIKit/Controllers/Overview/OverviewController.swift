//
//  OverviewController.swift
//  WorkoutFitUIKit
//
//  Created by Mishana on 09.12.2022.
//

import UIKit

struct TrainigData {
    struct Data{
        let title: String
        let subtitle: String
        let isDone: Bool
    }
    let date: Date
    let items: [Data]
}


class OverviewController: BaseController {

    private let navBar = OverviewNavBar()
    
    private var dataSource: [TrainigData] = []
    
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.showsVerticalScrollIndicator = false
        view.backgroundColor = .clear
        return view
    }()
}

extension OverviewController {
    override func addViews() {
        super.addViews()
        view.setupView(navBar)
        view.setupView(collectionView)
    }
    
    override func layoutViews() {
        super.layoutViews()
        
        NSLayoutConstraint.activate([

            navBar.topAnchor.constraint(equalTo: view.topAnchor),
            navBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            navBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: navBar.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    override func configureAppearance() {
        super.configureAppearance()
        navigationController?.navigationBar.isHidden = true
        
        collectionView.register(TrainingCellView.self, forCellWithReuseIdentifier: TrainingCellView.id)
        collectionView.register(SectionHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeaderView.id)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        dataSource = [
            .init(date: Date(),
                  items: [
                .init(title: "First1", subtitle: "hwruhfie", isDone: true),
                .init(title: "First2", subtitle: "hwruhfie", isDone: false),
                .init(title: "First3", subtitle: "hwruhfie", isDone: true)]),
            .init(date: Date(),
                  items: [
                    .init(title: "Second", subtitle: "wenfjew", isDone: false)]),
            .init(date: Date(),
                  items: [
                    .init(title: "Third", subtitle: "wjefwejn", isDone: true)])
        ]
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension OverviewController: UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        dataSource.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource[section].items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TrainingCellView.id, for: indexPath) as? TrainingCellView else {return UICollectionViewCell()}
        let item = dataSource[indexPath.section].items[indexPath.row]
        
        var roundedType: CellRoundedType
        if indexPath.row == 0 && indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .all
        } else if indexPath.row == 0 {
            roundedType = .top
        } else if indexPath.row == dataSource[indexPath.section].items.count - 1 {
            roundedType = .bottom
        }else {
            roundedType = .notRounded
        }
        
        cell.configure(with: item.title, subtitle: item.subtitle, isDone: item.isDone, roundedType: roundedType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: SectionHeaderView.id, for: indexPath) as? SectionHeaderView else { return UICollectionReusableView() }
        view.configure(with: dataSource[indexPath.section].date)
        return view
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension OverviewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 70)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: collectionView.frame.width, height: 32)
    }
}

