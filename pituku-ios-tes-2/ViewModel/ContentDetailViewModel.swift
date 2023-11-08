//
//  ContentDetailViewModel.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 09/11/23.
//

import SwiftUI
import WebKit

final class ContentDetailViewModel: ObservableObject {
    @Published var contentDetail: ModelArticleDetail? = nil
    @Published var contentSelected: ModelArticleList
    @Published var wkWebView: WKWebView? = nil
    
    init(contentSelected: ModelArticleList) {
        self.contentSelected = contentSelected
    }
    
    func fetchArticleDetail() {
        WebService().getArticleDetail(id: contentSelected.id){ (success, articleDetailResponse) in
            switch success {
            case true:
                if let articleDetailResponse = articleDetailResponse {
                    self.contentDetail = articleDetailResponse.data
                    self.setupWebView()
                }
            case false:
                break
            }
        }
    }
    
    private func setupWebView() {
        let preferences = WKWebpagePreferences()
        preferences.allowsContentJavaScript = true
        let controller = WKUserContentController()
        let configuration = WKWebViewConfiguration()
        configuration.defaultWebpagePreferences = preferences
        configuration.userContentController = controller
        self.wkWebView = WKWebView(frame: .zero, configuration: configuration)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
            if let body = self.contentDetail?.body {
                self.wkWebView?.loadHTMLString(body, baseURL: Bundle.main.bundleURL)                
            }
        }
    }
}
