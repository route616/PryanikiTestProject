//
//  TextCollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 23.03.2021.
//

import UIKit

class TextCollectionViewCell: UICollectionViewCell {
    var textLabel: UILabel

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    private func setupCell() {
        textLabel = UILabel()
        textLabel.center = contentView.center
        textLabel.frame.size = contentView.frame.size
        textLabel.textAlignment = .center
        contentView.addSubview(textLabel)
    }
}
