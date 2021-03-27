//
//  ViewModel.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import Alamofire
import Foundation

class ViewModel {
    var cells = [CellViewModel]()
    var delegate: ViewModelDelegate?

    init() {
        NetworkManager.shared.fetchData(handle: dataHandle)
    }

    private func dataHandle(model: Response) {
        model.view.forEach { (name) in
            model.data.forEach { (object) in
                if name == object.name {
                    var data: Data? = nil
                    var variants = [Int: String]()
                    if let urlAddress = object.data.url {
                        if let url = URL(string: urlAddress) {
                            do {
                                data = try Data(contentsOf: url)
                            } catch let error {
                                print(error.localizedDescription)
                            }
                        }
                    }
                    if let unwrappedVariants = object.data.variants {
                        unwrappedVariants.forEach { (variant) in
                            variants[variant.id] = variant.text
                        }
                    }
                    let cell = CellViewModel(
                        name: object.name,
                        text: object.data.text,
                        image: data,
                        selectedID: object.data.selectedId,
                        variants: variants.count != 0 ? variants : nil
                    )
                    cells.append(cell)
                }
            }
        }
        delegate?.didFinishFetchingData()
    }
}
