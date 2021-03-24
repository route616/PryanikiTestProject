//
//  SelectorCollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 23.03.2021.
//

import UIKit

class SelectorCollectionViewCell: UICollectionViewCell {
    static let identifier = "Selector Cell"

    var selector: UISegmentedControl!

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    private func setupCell() {
        selector = UISegmentedControl()
        selector.frame.size = CGSize(width: contentView.frame.width, height: 44.0)
        selector.center = contentView.center
        contentView.addSubview(selector)
    }
}
