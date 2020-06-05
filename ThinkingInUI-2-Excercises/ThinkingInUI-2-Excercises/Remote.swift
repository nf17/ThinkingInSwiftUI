//
//  Remote.swift
//  ThinkingInUI-2-Excercises
//
//  Created by Faraaz Ahmed Naikar on 6/5/20.
//  Copyright © 2020 Faraaz Ahmed Naikar. All rights reserved.
//

import Foundation
class LoadingError: Error {
    
}
final class Remote<A>: ObservableObject {
    @Published var result: Result<A, Error>? = nil
    var value: A? { try? result?.get()}
    
    let url: URL
    let transform: (Data) -> A?
    
    init(url: URL, transform: @escaping (Data) -> A?) {
        self.url = url
        self.transform = transform
    }
    
    func load() {
        URLSession.shared.dataTask(with: url) { data, _, _ in
            DispatchQueue.main.async {
                if let d = data, let v = self.transform(d) {
                    self.result = .success(v)
                } else {
                    self.result = .failure(LoadingError())
                }
            }
        }.resume()
    }
}
