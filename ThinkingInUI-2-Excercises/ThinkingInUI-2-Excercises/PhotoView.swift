import SwiftUI
import Foundation

struct PhotoView: View {
    @ObservedObject var image: Remote<UIImage>
    init(_ url: URL) {
        image = Remote(url: url, transform: {UIImage(data: $0)})
    }
    var body: some View {
        Group {
            if image.value == nil {
                Text("Loading ..")
                    .onAppear{self.image.load()}
            } else {
                Image(uiImage: image.value!)
                .resizable()
                    .aspectRatio(image.value!.size,contentMode: .fit)
            }
        }
    }
}
