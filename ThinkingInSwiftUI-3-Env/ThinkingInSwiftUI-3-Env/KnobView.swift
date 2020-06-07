//
//  ContentView.swift
//  Knob
//
//  Created by Chris Eidhof on 05.11.19.
//  Copyright © 2019 Chris Eidhof. All rights reserved.
//

import SwiftUI

struct KnobShape: Shape {
    var pointerSize: CGFloat = 0.1 // these are relative values
    var pointerWidth: CGFloat = 0.1
    func path(in rect: CGRect) -> Path {
        let pointerHeight = rect.height * pointerSize
        let pointerWidth = rect.width * self.pointerWidth
        let circleRect = rect.insetBy(dx: pointerHeight, dy: pointerHeight)
        return Path { p in
            p.addEllipse(in: circleRect)
            p.addRect(CGRect(x: rect.midX - pointerWidth/2, y: 0, width: pointerWidth, height: pointerHeight + 2))
        }
    }
}

struct Knob: View {
    @Binding var value: Double // should be between 0 and 1
    @Environment(\.colorScheme) var colorScheme
    

    var body: some View {
         KnobShape()
            .fill(colorScheme == .dark ? Color.white : Color.black)
            .rotationEffect(Angle(degrees: value * 330))
            .onTapGesture {
                withAnimation(.default) {
                    self.value = self.value < 0.5 ? 1 : 0
                }
            }
    }
}

struct ContentView1: View {
    @State var value: Double = 0.5
    @State var knobSize: CGFloat = 0.1

    var body: some View {
        VStack {
            Knob(value: $value)
                .frame(width: 100, height: 100)
            HStack {
                Text("Value")
                Slider(value: $value, in: 0...1)
            }
            HStack {
                Text("Knob Size")
                Slider(value: $knobSize, in: 0...0.4)
            }
            Button(action: {
                withAnimation(.default) {
                    self.value = self.value == 0 ? 1 : 0
                }
            }, label: { Text("Toggle")})
        }
    }
}

struct ContentView1_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

