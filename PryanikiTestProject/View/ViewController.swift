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
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = self.view.bounds
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        return collectionView
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(collectionView)
        viewModel = ViewModel()
        NetworkManager.shared.fetchData(with: printTestJSON, and: printError)
    }

    private func printTestJSON(response: Response) {
        print(response)
    }

    private func printError(error: String) {
        print(error)
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    
}

// MARK: - UICollectionViewDataSource
extension ViewController: UICollectionViewDataSource {
    func collectionView(
        _ collectionView: UICollectionView, numberOfItemsInSection section: Int
    ) -> Int {
        return 1
    }

    func collectionView(
        _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath
    ) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        let size = CGSize(width: view.frame.width, height: view.frame.height / 2)
        cell.frame.size = size
        cell.contentView.backgroundColor = .systemRed
        return cell
    }
}
