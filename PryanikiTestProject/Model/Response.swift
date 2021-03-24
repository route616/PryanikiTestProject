//
//  Response.swift
//  PryanikiTestProject
//
//  Created by Игорь on 20.03.2021.
//

struct Response: Codable {
    let data: [Object]
    let view: [String]
}

struct Object: Codable {
    let name: String
    let data: Properties
}

struct Properties: Codable {
    let text: String?
    let url: String?
    let selectedId: Int?
    let variants: [VariantProperty]?
}

struct VariantProperty: Codable {
    let id: Int
    let text: String
}
