//
//  NetworkManager.swift
//  PryanikiTestProject
//
//  Created by Игорь on 21.03.2021.
//

import Alamofire
import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    private init() {}

    private let urlAddress = "https://pryaniky.com/static/json/sample.json"
    private var delegate: ModelDelegate?

    func fetchData(
        with successHandler: @escaping (Response) -> Void,
        and errorHandler: @escaping (String) -> Void
    ) {
        AF.request(urlAddress).responseDecodable(of: Response.self) { (response) in
            guard let response = response.value else { return }
        }
    }
}
