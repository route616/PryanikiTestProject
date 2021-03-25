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
            if self.viewModel == nil { return }
            collectionView.reloadData()
        }
    }

    // MARK: - Collection View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        return cv
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel?.delegate = self
        view.addSubview(collectionView)
    }
}

// MARK: - ViewModelDelegate
extension ViewController: ViewModelDelegate {
    func didFinishFetchingData() {
        collectionView.reloadData()
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
        let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: CollectionViewCell.identifier, for: indexPath
        ) as! CollectionViewCell
        cell.image = cellViewModel.image
        cell.text = cellViewModel.text
        cell.selector = cellViewModel.variants
        return cell
    }
}
