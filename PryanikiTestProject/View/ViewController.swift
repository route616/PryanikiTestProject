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
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.register(
            CollectionViewCell.self, forCellWithReuseIdentifier: CollectionViewCell.identifier
        )
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .secondarySystemBackground
        return cv
    }()

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = ViewModel()
        viewModel?.delegate = self
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.frame = view.frame
        view.addSubview(collectionView)
    }

    private func presentSegmentInfo(with id: Int, and text: String) {
        let alertController = UIAlertController(
            title: "Selector", 
            message: "Segment ID: \(id)\nText: \(text)", 
            preferredStyle: .alert
        )
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }

    private func presentItemInfo(with name: String, and text: String) {
        let alertController = UIAlertController(
            title: "\(name)", 
            message: "Item description: \(text)", 
            preferredStyle: .actionSheet
        )
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
}

// MARK: - ViewModelDelegate
extension ViewController: ViewModelDelegate {
    func didFinishFetchingData() {
        collectionView.reloadData()
    }
}

// MARK: - UICollectionViewDelegate
extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presentItemInfo(
            with: viewModel?.cells[indexPath.item].name ?? "No name", 
            and: viewModel?.cells[indexPath.item].text ?? "No text"
        )
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
        cell.delegate = self
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(
        _ collectionView: UICollectionView, 
        layout collectionViewLayout: UICollectionViewLayout, 
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        return CGSize(width: collectionView.bounds.width, height: collectionView.bounds.height / 4)
    }
}

// MARK: - CollectionViewCellDelegate
extension ViewController: CollectionViewCellDelegate {
    func didTappedSegment(sender: UISegmentedControl) {
        presentSegmentInfo(
            with: sender.selectedSegmentIndex + 1, 
            and: sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "No text"
        )
    }
}
