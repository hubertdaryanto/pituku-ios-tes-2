//
//  ContentViewModel.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 08/11/23.
//

import Foundation
import SwiftUI

final class ContentViewModel: ObservableObject {
    @Published var articleList: [ModelArticleList] = []
    
    func fetchArticleList() {
        WebService().getArticleList{ (success, listArticleResponse) in
            switch success {
            case true:
                if let listArticleResponse = listArticleResponse {
                    self.articleList = listArticleResponse.data
                }
            case false:
                break
            }
        }
    }
}
