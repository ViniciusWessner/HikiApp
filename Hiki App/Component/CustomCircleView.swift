//
//  CustomCircleView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct CustomCircleView: View {
    
    @State private var isAnimationGradient: Bool = false
    
    var body: some View {
        ZStack {
            Circle()
                .fill(
                    LinearGradient(colors: [
                        Color(.colorIndigoMedium),
                        Color(.colorSalmonLigth)],
                                   startPoint: isAnimationGradient ? .topLeading : .bottomLeading,
                                   endPoint: isAnimationGradient ?  .bottomTrailing : .topTrailing)
                )
                .onAppear{
                    withAnimation(.linear(duration: 3.0).repeatForever(autoreverses: true)) {
                        isAnimationGradient.toggle()
                    }
                }
            MotionAnimationView()
        }//: zstack
        .frame(width: 256, height: 256)
    }
}

#Preview {
    CustomCircleView()
}
