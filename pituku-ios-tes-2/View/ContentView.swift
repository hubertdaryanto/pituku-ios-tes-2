//
//  ContentView.swift
//  pituku-ios-tes-2
//
//  Created by Hubert Daryanto on 08/11/23.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    @State private var showContentDetailView: Bool = false
    @State private var selectedContent: ModelArticleList? = nil
    var body: some View {
        NavigationStack(root: {
            VStack {
                List {
                    ForEach(viewModel.articleList, id: \.id) { data in
                        VStack {
                            Text(data.title).font(.title)
                            Text("\(data.description)").lineLimit(2).font(.body)
                        }.onTapGesture {
                            self.selectedContent = data
                            self.showContentDetailView.toggle()
                        }
                    }
                }
            }.onAppear {
                viewModel.fetchArticleList()
                self.showContentDetailView = false
            }.navigationDestination(isPresented: $showContentDetailView, destination: {
                if let selectedContent = self.selectedContent {
                    ContentDetailView(viewModel: ContentDetailViewModel(contentSelected: selectedContent))
                }
            }).navigationTitle("Pituku Article List")
        })
       
    }
}

#Preview {
    ContentView()
}
