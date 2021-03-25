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
            guard let _ = viewModel else { return }
            collectionView.reloadData()
        }
    }

    // MARK: - Collection View
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.width, height: view.frame.height / 4)
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(
            CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier
        )
        cv.frame.size = CGSize(width: view.bounds.width, height: view.bounds.height)
        cv.delegate = self
        cv.dataSource = self
        cv.backgroundColor = .white
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

//MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(
        _ collectionView: UICollectionView, canEditItemAt indexPath: IndexPath
    ) -> Bool {
        return false
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
        guard let cellViewModel = viewModel?.cells[indexPath.item] else {
            return UICollectionViewCell()
        }
        guard
            let cell = collectionView.dequeueReusableCell(
                withReuseIdentifier: CollectionViewCell.identifier, for: indexPath
            ) as? CollectionViewCell
        else {
            return UICollectionViewCell()
        }
        cell.image = cellViewModel.image
        cell.text = cellViewModel.text
        cell.selectedID = cellViewModel.selectedID
        cell.selector = cellViewModel.variants
        return cell
    }
}
