//
//  CollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 25.03.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"

    var text: String? {
        didSet {
            guard let text = self.text else { return }
            let textLabel = UILabel()
            textLabel.frame = self.frame
            textLabel.text = text
            textLabel.textAlignment = .center
            self.addSubview(textLabel)
        }
    }

    var selector: [Int: String]? {
        didSet {
            guard let selector = self.selector else { return }
            let segmentedControl = UISegmentedControl()
            segmentedControl.frame.size = CGSize(width: self.frame.width - 16, height: 44)
            segmentedControl.center = self.center
            for segment in selector {
                segmentedControl.insertSegment(
                    withTitle: segment.value, at: segment.key - 1, animated: false
                )
            }
            self.addSubview(segmentedControl)
        }
    }

    var image: Data? {
        didSet {
            guard let imageData = self.image, let image = UIImage(data: imageData) else {
                return
            }
            let imageView = UIImageView()
            imageView.frame = self.frame
            imageView.center = self.center
            imageView.contentMode = .scaleAspectFill
            imageView.image = image
            self.addSubview(imageView)
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
}
