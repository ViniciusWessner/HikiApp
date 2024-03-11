//
//  CardView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct CardView: View {
    
    //MARK: propriedades
    
    @State private var imageNumber: Int = 1
    @State private var randomNumber: Int = 1
    @State private var isShowingSheet: Bool = false
    
    // MARK: Functions
    
    func randomImage() {
        repeat {
            randomNumber = Int.random(in: 1...5)
        } while randomNumber == imageNumber
                    
        imageNumber = randomNumber
    }
    
    
    var body: some View {
        
        //MARK: Card
        
        ZStack {
            CustomBackgroundView()
            
            VStack {
                
                //MARK: cabecalho
                VStack(alignment: .leading){
                    HStack {
                        Text("Hiking")
                            .fontWeight(.black)
                            .font(.system(size: 52))
                            .foregroundStyle(
                                LinearGradient(
                                    colors: [
                                        Color(.colorGrayLight),
                                        Color(.colorGrayMedium)],
                                    startPoint: .top,
                                    endPoint: .bottom)
                            )
                        
                        Spacer()
                        
                        Button {
                            //action aqui
                            print("botao pressionado")
                            isShowingSheet.toggle()
                            
                        }label: {
                            CustomButtonView()
                        }
                        .sheet(isPresented: $isShowingSheet) {
                            SettingsView()
                                .presentationDragIndicator(.visible)
                                .presentationDetents([.medium, .large])
                        }
                    }
                    Text("Fun and enjoyable outdoor activity for friends and families.")
                        .multilineTextAlignment(.leading)
                        .italic()
                        .foregroundColor(.colorGrayMedium)
                }//: header
                .padding(.horizontal, 30)
                
                //MARK: Main content
            
                
                ZStack {
                    
                    CustomCircleView()
                    
                    Image("image-\(imageNumber)")
                        .resizable()
                        .scaledToFit()
                        .animation(.easeOut(duration: 2), value: imageNumber)
                }
                
                //MARK: Footer
                
                Button{
                    //action generate randon number
                    print("Button random pressionado: \(imageNumber)")
                    randomImage()
                }label: {
                    Text("Explore more")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundStyle(
                            LinearGradient(
                                colors: [
                                    Color(.colorGreenLight),
                                    Color(.colorGreenMedium)],
                                startPoint: .top,
                                endPoint: .bottom))
                }
                .buttonStyle(GradientButton())
            }
        }//: Card
        .frame(width: 320, height: 570)
    }
}

#Preview {
    CardView()
}
