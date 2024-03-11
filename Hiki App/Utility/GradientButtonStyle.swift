//
//  GradientButtonStyle.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import Foundation
import SwiftUI

struct GradientButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration
            .label
            .padding(.vertical)
            .padding(.horizontal, 30)
            .background(
                // condicional de estado com nil coalcing
                // condicao ? a senao : b
                configuration.isPressed ?
                // a - caso o usuario pressione o botao
                LinearGradient(colors: [Color(.colorGrayMedium), Color(.colorGrayLight)], startPoint: .top, endPoint: .bottom)
                :
                // b - com o botao nao pressioanado
                LinearGradient(colors: [Color(.colorGrayLight), Color(.colorGrayMedium)], startPoint: .top, endPoint: .bottom)
            )
            .cornerRadius(40)
    }
}
