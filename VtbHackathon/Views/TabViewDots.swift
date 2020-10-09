import SwiftUI

struct TabViewDots: View {
    let count: Int
    let currentIndex: Int
    
    var body: some View {
        HStack(spacing: 10) {
            ForEach(0..<count) { index in
                Circle()
                    .fill(currentIndex == index ? Color("Blue60") : Color("Grey30"))
                    .scaleEffect(currentIndex == index ? 1.1 : 1)
                    .frame(width: 7.0, height: 7.0)
                    .transition(AnyTransition.opacity.combined(with: .scale))
                    .id(index)
            }
        }
        .padding(.bottom, 50)
    }
}



struct TabViewDots_Previews: PreviewProvider {
    static var previews: some View {
        TabViewDots(count: 3, currentIndex: 1)
    }
}
