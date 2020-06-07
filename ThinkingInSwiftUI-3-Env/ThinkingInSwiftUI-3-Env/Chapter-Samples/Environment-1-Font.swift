//
//  Environment-1-Font.swift
//  ThinkingInSwiftUI-3-Env
//
//  Created by Faraaz Ahmed Naikar on 6/6/20.
//  Copyright © 2020 Faraaz Ahmed Naikar. All rights reserved.
//

import SwiftUI

struct Environment_1_Font: View {
    var body: some View {
        VStack {
            Text("Hello World")
                //.transformEnvironment(\.font, transform: {dump($0)})
                //.transformEnvironment(\.self, transform: {dump($0)})
        }
        .font(Font.headline)
        .debug()
    }
}

struct Environment_1_Font_Previews: PreviewProvider {
    static var previews: some View {
        Environment_1_Font()
    }
}
