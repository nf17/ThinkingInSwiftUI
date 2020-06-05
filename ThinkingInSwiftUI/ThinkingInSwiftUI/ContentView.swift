import SwiftUI

struct ContentView: View {
    @State var counter = 0
    var body: some View {
        VStack {
            Button(action: {self.counter+=1}, label: {
                Text("Tap me")
                    .background(Color(.tertiarySystemFill))
                    .border(Color.green)
                    .padding()
                    .border(Color.red)
                    .cornerRadius(5)

            })
            if counter > 0 {
                Text("You've tapped \(counter) times")
            } else {
                Text("You've not yet tapped")
            }
        }.debug()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
