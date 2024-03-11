//
//  MotionAnimationView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct MotionAnimationView: View {
    //MARK: propriedades
    
    @State private var randomCircle: Int = Int.random(in: 6...12)
    @State private var isAnimating: Bool = false
    
    //MARK: functions
    
    // 1- Cordenada aleatoria
    
    func randomCordinate() -> CGFloat {
        return CGFloat.random(in: 0...256)
    }
    
    // 2 - tamanho aleatorio
    
    func randomSize() -> CGFloat {
        return CGFloat(Int.random(in: 4...80))
    }
    // 3 - Escala aleatoria
    
    func randomScale() -> CGFloat {
        return CGFloat(Double.random(in: 0.1...2.0))
    }
    // 4 - Velocidade aleatoria
    
    func randomSpeed() -> Double {
        return Double.random(in: 0.05...0.50)
    }
    
    // 5 - Delay aleatorio
    func randomDelay() -> Double {
        return Double.random(in: 0...2)
    }
    
    
    var body: some View {
        ForEach(0...randomCircle, id: \.self) { item in
            ZStack {
                Circle()
                    .foregroundStyle(.white)
                    .opacity(0.25)
                    .frame(width: randomSize())
                    .position(
                        x: randomCordinate(),
                        y: randomCordinate()
                    )
                    .scaleEffect(isAnimating ? randomScale() : 1)
                    .onAppear(perform: {
                        withAnimation(
                            .interpolatingSpring(
                                stiffness: 0.25,
                                damping: 0.25)
                                .repeatForever()
                                .speed(randomSpeed())
                                .delay(randomDelay())
                        ) {
                            isAnimating = true
                        }
                    })
            }//: zstack
            .frame(width: 256, height: 256)
            .mask(Circle())
            .drawingGroup()
            
        }
    }
}

#Preview {
    MotionAnimationView()
        .background(
            Circle()
                .fill(.teal)
        )
}
