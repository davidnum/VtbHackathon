//
//  CustomSlider.swift
//  VtbHackathon
//
//  Created by David Num on 10.10.2020.
//

import SwiftUI

struct CustomSlider: View {
    @Binding var value: Double
    var bounds: ClosedRange<Double> = 0...1
    var step: Int
    
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ZStack(alignment: .leading) {
                    HStack {}
                        .frame(width: geometry.size.width, height: 2)
                        .background(Color("ColdGrey20"))
                    HStack {}
                        .frame(width: geometry.size.width / CGFloat(bounds.upperBound - 1) * CGFloat(value - 1), height: 4)
                        .background(Color("Blue60"))
                        .cornerRadius(2)
                        .animation(.easeInOut(duration: 0.2))
                    ZStack {
                        Circle()
                            .fill(Color("Blue60"))
                            .frame(width: 20, height: 20)
                            .cornerRadius(10)
                        Circle()
                            .fill(Color.white)
                            .frame(width: 10, height: 10)
                            .cornerRadius(5)
                        
                    }
                    .offset(x: (CGFloat(value - 1)) * (geometry.size.width - 20) / CGFloat(bounds.upperBound - 1), y: 0)
                    .gesture(DragGesture(minimumDistance: 0)
                                .onChanged({ v in
                                    let partWidth = geometry.size.width / CGFloat(bounds.upperBound - 1)
                                    value = Double(round(v.location.x / partWidth)) + max(0, bounds.lowerBound)
                                })
                    )
                    .animation(.easeInOut(duration: 0.2))
                }
                
                HStack {
                    Text(String(format: "%g", bounds.lowerBound))
                        .foregroundColor(Color("ColdGrey40"))
                        .font(.system(size: 14))
                        .fullSize(alignment: .leading)
                    Text(String(format: "%g", bounds.upperBound))
                        .foregroundColor(Color("ColdGrey40"))
                        .font(.system(size: 14))
                        .fullSize(alignment: .trailing)
                }
            }
            
        }
    }
}

struct CustomSlider_PreviewWrapper: View {
    @State var value: Double = 1
    var body: some View {
        CustomSlider(value: $value, step: 1)
    }
}

struct CustomSlider_Preview: PreviewProvider {
    static var previews: some View {
        CustomSlider_PreviewWrapper()
    }
}
