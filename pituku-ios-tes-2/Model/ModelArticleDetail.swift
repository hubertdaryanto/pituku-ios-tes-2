//
//  ModelArticleDetail.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 08/11/23.
//

import Foundation

struct ModelArticleDetailResponse: Decodable {
    let data: ModelArticleDetail
}

struct ModelArticleDetail: Decodable {
    let body: String
    let title: String
    let description: String
}
