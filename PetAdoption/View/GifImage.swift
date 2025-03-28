import SwiftUI
import SDWebImageSwiftUI

struct GifImage: View {
    var body: some View {
        WebImage(url: URL(string: "https://media1.tenor.com/m/A17aJ1ZniiUAAAAC/dog-walking.gif"))
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: 200, height: 200)

    }
}


#Preview {
    GifImage()
}
