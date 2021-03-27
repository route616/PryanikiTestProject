//
//  CollectionViewCell.swift
//  PryanikiTestProject
//
//  Created by Игорь on 25.03.2021.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    static let identifier = "cell"

    var textLabel = UILabel()
    var imageView = UIImageView()
    var segmentedControl = UISegmentedControl()

    var delegate: CollectionViewCellDelegate?

    var selectedID: Int?

    var text: String? {
        didSet {
            guard let text = self.text else { return }
            textLabel.text = text
            textLabel.textAlignment = .center
            textLabel.isHidden = false
        }
    }

    var selector: [Int: String]? {
        didSet {
            guard let selector = self.selector else { return }
            for segment in selector {
                segmentedControl.insertSegment(
                    withTitle: segment.value, at: segment.key - 1, animated: false
                )
            }
            if let selectedSegment = selectedID {
                segmentedControl.selectedSegmentIndex = selectedSegment - 1
            }
            segmentedControl.isHidden = false
        }
    }

    var image: Data? {
        didSet {
            guard let imageData = self.image, let image = UIImage(data: imageData) else {
                return
            }
            imageView.image = image
            imageView.isHidden = false
        }
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubviews()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupSubviews()
    }

    private func setupSubviews() {
        contentView.backgroundColor = .systemBackground
        textLabel.center = contentView.center
        textLabel.frame = contentView.frame
        textLabel.isHidden = true

        segmentedControl.frame.size = CGSize(width: contentView.frame.width, height: 44)
        segmentedControl.center = contentView.center
        segmentedControl.addTarget(self, action: #selector(changeSegment), for: .valueChanged)
        segmentedControl.isHidden = true

        imageView.center = contentView.center
        imageView.frame = contentView.frame
        imageView.contentMode = .scaleAspectFit
        imageView.isHidden = true

        addSubview(textLabel)
        addSubview(segmentedControl)
        addSubview(imageView)
    }

    @objc private func changeSegment(sender: UISegmentedControl) {
        delegate?.didTappedSegment(sender: sender)
    }
}
