//
//  ViewExtension.swift
//  ThinkingInSwiftUI
//
//  Created by Faraaz Ahmed Naikar on 5/30/20.
//  Copyright © 2020 Faraaz Ahmed Naikar. All rights reserved.
//

import Foundation
import SwiftUI

extension View {
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}
