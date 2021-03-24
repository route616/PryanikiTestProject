//
//  ViewModel.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

import Alamofire
import Foundation

class ViewModel {
    var model: Model?

    private let urlAddress = "https://pryaniky.com/static/json/sample.json"

    init() {
        fetchData()
    }

    private func fetchData() {
        AF.request(urlAddress).responseDecodable(of: Model.self) { (response) in
            guard let model = response.value else { return }
            self.model = model
        }
    }
}
