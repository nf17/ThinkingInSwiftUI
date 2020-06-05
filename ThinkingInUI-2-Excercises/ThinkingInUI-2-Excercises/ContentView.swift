//
//  ContentView.swift
//  ThinkingInUI-2-Excercises
//
//  Created by Faraaz Ahmed Naikar on 6/5/20.
//  Copyright © 2020 Faraaz Ahmed Naikar. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var items = Remote(url: URL(string: "https://picsum.photos/v2/list")!, transform: {try! JSONDecoder().decode([Photo].self, from: $0)})
    var body: some View {
        NavigationView {
            if items.value == nil {
                Text("Loading..")
                    .onAppear{self.items.load()}
            } else {
                List{
                    ForEach(items.value!) {photo in
                        NavigationLink(destination: PhotoView(photo.download_url), label: {Text(photo.author)})
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
