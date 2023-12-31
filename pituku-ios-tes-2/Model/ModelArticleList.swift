//
//  ModelArticleList.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 08/11/23.
//

import Foundation

struct ModelArticleListResponse: Decodable {
    let data: [ModelArticleList]
}

struct ModelArticleList: Decodable {
    let id: String
    let title: String
    let description: String
}
