//
//  ImageCollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 23.03.2021.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
    static let identifier = "Image Cell"

    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.center = self.contentView.center
        imageView.frame.size = self.contentView.frame.size
        imageView.sizeToFit()
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        contentView.addSubview(imageView)
    }
}
