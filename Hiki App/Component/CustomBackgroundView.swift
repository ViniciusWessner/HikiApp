//
//  CustomBackgroundView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct CustomBackgroundView: View {
    var body: some View {
        ZStack {
            // MARK: - 3 depth
            
            Color(.colorGreenDark)
                .cornerRadius(40)
                .offset(y: 12)
            
            // MARK: - 2 Light
            
            Color(.colorGreenLight)
                .cornerRadius(40)
                .offset(y: 3)
                .opacity(0.85)
            
            // MARK: - 1 surface
            
            LinearGradient(
                colors:[
                    Color(.colorGreenLight),
                    Color(.colorGreenMedium)],
                   startPoint: .top,
                   endPoint: .bottom
            )
            .cornerRadius(40)
        }
    }
        
}

#Preview {
    CustomBackgroundView()
        .padding()
}
