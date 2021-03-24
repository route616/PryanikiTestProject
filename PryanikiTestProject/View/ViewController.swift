//
//  ViewController.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - ViewModel
    private var viewModel: ViewModel? {
        didSet {
            collectionView.reloadData()
        }
    }

    // MARK: - Collection View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.frame = self.view.bounds
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel?.model?.view.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let model = self.viewModel?.model else { return UICollectionViewCell() }
        switch model.view[indexPath.item] {
        case "hz":
            let cell = TextCollectionViewCell()
            cell.textLabel.text = model.data[indexPath.item].data.text
            return cell

        case "selector":
            guard let variants = model.data[indexPath.item].data.variants else { 
                return UICollectionViewCell() 
            }
            var items = [Int: String]()
            for item in variants {
                items[item.id] = item.text
            }
            let selector = UISegmentedControl()
            let cell = SelectorCollectionViewCell()
            return cell
            
        case "picture":
            let cell = ImageCollectionViewCell()
            return cell
        default:
            return UICollectionViewCell()
        } // switch
    }
}
