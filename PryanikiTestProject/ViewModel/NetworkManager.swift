//
//  NetworkManager.swift
//  PryanikiTestProject
//
//  Created by Игорь on 24.03.2021.
//

import Alamofire
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}
    private let urlAddress = "https://pryaniky.com/static/json/sample.json"

    func fetchData(handle: @escaping (Response) -> Void) {
        AF.request(urlAddress).responseDecodable(of: Response.self) { (response) in
            guard let value = response.value else { return }
            handle(value)
        }
    }
}
