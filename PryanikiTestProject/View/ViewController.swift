//
//  ViewController.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import UIKit

class ViewController: UIViewController {
    // MARK: - ViewModel
    private var viewModel: ViewModel?

    // MARK: - Collection View
    private var collectionView: UICollectionView?// = {
//
//        return collectionView
//    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel?.delegate = self
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.view.frame.width, height: self.view.frame.height / 4)
        let collectionView = UICollectionView(
            frame: self.view.bounds, collectionViewLayout: layout
        )
        collectionView.register(
            SelectorCollectionViewCell.self,
            forCellWithReuseIdentifier: SelectorCollectionViewCell.identifier
        )
//        collectionView.register(
//            ImageCollectionViewCell.self,
//            forCellWithReuseIdentifier: ImageCollectionViewCell.identifier
//        )
//        collectionView.register(
//            TextCollectionViewCell.self,
//            forCellWithReuseIdentifier: TextCollectionViewCell.identifier
//        )
        collectionView.dataSource = self
        view.addSubview(collectionView)
    }
}

// MARK: - ViewModelDelegate
extension ViewController: ViewModelDelegate {
    func didFinishFetchingData() {
        collectionView?.reloadData()
    }
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return viewModel?.cells.count ?? 0
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        guard let cellViewModel = self.viewModel?.cells[indexPath.item] else {
            return UICollectionViewCell()
        }
//        switch cellViewModel.name {
//
//        case "hz":
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: TextCollectionViewCell.identifier, for: indexPath
//            ) as! TextCollectionViewCell
//            cell.textLabel.text = cellViewModel.text
//            return cell
//
//        case "picture":
//            let cell = collectionView.dequeueReusableCell(
//                withReuseIdentifier: ImageCollectionViewCell.identifier, for: indexPath
//            ) as! ImageCollectionViewCell
//            if let imageData = cellViewModel.image {
//                cell.imageView.image = UIImage(data: imageData)
//            }
//            return cell
//
//        case "selector":
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: SelectorCollectionViewCell.identifier, for: indexPath
            ) as! SelectorCollectionViewCell
            if let variants = cellViewModel.variants {
                for variant in variants {
                    cell.selector.insertSegment(
                        withTitle: variant.value, at:variant.key - 1, animated: false
                    )
                }
            }
            return cell
//
//        default:
//            return UICollectionViewCell()
//        }
    }
}
