//
//  ViewModel.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import Alamofire
import Foundation

class ViewModel {
    private var model: Response?
    private var tempImageData: Data?

    var cells = [CellViewModel]()

    init() {
        NetworkManager.shared.fetchData(handle: dataHandle)
    }

    private func parseModel() {
        
    }

    private func dataHandle(model: Response) {
        self.model = model
        parseModel()
    }

    private func imageDataHandle(imageData: Data) {
        self.tempImageData = imageData
    }
}
