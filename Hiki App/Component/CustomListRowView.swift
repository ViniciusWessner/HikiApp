//
//  CustomListRowView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct CustomListRowView: View {
    
    @State var rowLabel: String
    @State var rowIcon: String
    @State var rowContent: String? = nil
    @State var rowTintcolor: Color
    @State var rowLinkLabel: String? = nil
    @State var rowLinkDestination: String? = nil
    
    
    var body: some View {
        LabeledContent{
            if rowContent != nil {
                Text(rowContent!)
                    .foregroundStyle(.primary)
                    .fontWeight(.heavy)
            } else if (rowLinkLabel != nil && rowLinkDestination != nil) {
                Link(rowLinkLabel!, destination: URL(string: rowLinkDestination!)!)
                    .foregroundStyle(.indigo)
            } else {
                EmptyView()
            }
        }label: {
            HStack{
                ZStack{
                    RoundedRectangle(cornerRadius: 8)
                        .frame(width: 30, height: 30)
                        .foregroundStyle(rowTintcolor)
                    Image(systemName: rowIcon)
                        .foregroundStyle(.white)
                        .fontWeight(.semibold)
                }
                
                Text(rowLabel)
            }
        }
    }
}

#Preview {
    List{
        CustomListRowView(rowLabel: "Designer",
                          rowIcon: "paintpalette",
                          rowContent: nil,
                          rowTintcolor: .pink,
                          rowLinkLabel: "Vinicius",
                          rowLinkDestination: "https://viniciuswessner.com"
        )
        
    }
}
