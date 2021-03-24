//
//  ImageCollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 23.03.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    var imageView: UIImageView

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupCell()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupCell()
    }

    private func setupCell() {
        imageView = UIImageView()
        imageView.center = contentView.center
        imageView.frame.size = contentView.frame.size
        imageView.sizeToFit()
        contentView.addSubview(imageView)
    }
}
