//
//  ContentDetailView.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 09/11/23.
//

import SwiftUI

struct ContentDetailView: View {
    @StateObject var viewModel: ContentDetailViewModel
    var body: some View {
        VStack {
            Text(viewModel.contentDetail?.description ?? "").font(.subheadline)
            //MARK: Web View
            VStack {
                if let wkWebView = viewModel.wkWebView {
                    ContentDetailWebView(wkWebView: wkWebView)
                }
            }
        }.onAppear {
            viewModel.fetchArticleDetail()
        }.navigationTitle(viewModel.contentDetail?.title ?? "Article Detail")
        
    }
}

#Preview {
    ContentDetailView(viewModel: ContentDetailViewModel(contentSelected: ModelArticleList(id: "wer121", title: "Pituku", description: "Pituku")))
}
