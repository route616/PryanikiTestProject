//
//  CollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 21.03.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"

    var text: String? {
        didSet {
            guard let text = text else { return }
            let textLabel = UILabel()
            textLabel.text = text
            textLabel.frame = contentView.frame
            addSubview(textLabel)
        }
    }

    var image: Data? {
        didSet {
            guard let imageData = image else { return }
            guard let image = UIImage(data: imageData) else { return }
            let imageView = UIImageView(image: image)
            imageView.sizeToFit()
            imageView.frame = contentView.frame
            addSubview(imageView)
        }
    }
}
