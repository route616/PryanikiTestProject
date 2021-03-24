//
//  ViewModel.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import Alamofire
import Foundation

class ViewModel {
    struct CellViewModel {
        let name: String?
        var text: String?
        var image: Data?
        var selectedID: Int?
        var variants: [Int: String]?

        init(name: String) {
            self.name = name
            self.text = nil
            self.image = nil
            self.selectedID = nil
            self.variants = nil
        }
    }

    private var model: Response?
    private var tempImageData: Data?

    var delegate: ViewModelDelegate?
    var cells = [CellViewModel]()

    init() {
        NetworkManager.shared.delegate = self
        NetworkManager.shared.fetchData(handle: dataHandle)
    }

    private func parseModel() {
        guard let model = self.model else { return }
        for item in model.view {
            cells.append(CellViewModel(name: item))
        }
        for index in cells.indices {
            for object in model.data {
                if cells[index].name == object.name {
                    cells[index].text = object.data.text
                    cells[index].selectedID = object.data.selectedId
                    if let variants = object.data.variants {
                        for variant in variants {
                            cells[index].variants?[variant.id] = variant.text
                        }
                    }
                }
            }
        }
        delegate?.didFinishFetchingData()
    }

    private func dataHandle(model: Response) {
        self.model = model
        parseModel()
    }

    private func imageDataHandle(imageData: Data) {
        self.tempImageData = imageData
    }
}

// MARK: - NetworkManagerDelegate
extension ViewModel: NetworkManagerDelegate {
    func didFinishFetchingImage() {
        
    }
}
