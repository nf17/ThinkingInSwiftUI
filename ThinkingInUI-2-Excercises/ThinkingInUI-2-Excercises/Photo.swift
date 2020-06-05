//
//  Photo.swift
//  ThinkingInUI-2-Excercises
//
//  Created by Faraaz Ahmed Naikar on 6/5/20.
//  Copyright © 2020 Faraaz Ahmed Naikar. All rights reserved.
//

import Foundation

struct Photo: Codable, Identifiable {
    var id: String
    var author: String
    var width, height: Int
    var url, download_url: URL
    
}
