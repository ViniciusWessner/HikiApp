//
//  CustomButtonView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct CustomButtonView: View {
    var body: some View {
        ZStack{
            Circle()
                .fill(
                    LinearGradient(
                        colors: [
                            .white,
                            Color(.colorGreenLight),
                            Color(.colorGreenMedium)],
                        startPoint: .top,
                        endPoint: .bottom)
                )
            Circle()
                .stroke(
                    LinearGradient(
                        colors: [
                            Color(.colorGrayLight),
                            Color(.colorGrayMedium)],
                        startPoint: .top,
                        endPoint: .bottom)
                    ,lineWidth: 4)
            
            Image(systemName: "figure.hiking")
                .fontWeight(.black)
                .font(.system(size: 30))
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(.colorGrayLight),
                            Color(.colorGrayMedium)],
                        startPoint: .top,
                        endPoint: .bottom)
                )
        }
        .frame(width: 58, height: 58)
    }
}

#Preview {
    CustomButtonView()
        .previewLayout(.sizeThatFits)
        .padding()
}
