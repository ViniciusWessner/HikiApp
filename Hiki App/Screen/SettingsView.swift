//
//  SettingsView.swift
//  Hiki App
//
//  Created by Vinicius Wessner on 07/03/24.
//

import SwiftUI

struct SettingsView: View {
    
    private let alternateAppIcons: [String] = [
        "AppIcon-MagnifyingGlass",
        "AppIcon-Map",
        "AppIcon-Mushroom",
        "AppIcon-Camera",
        "AppIcon-Backpack",
        "AppIcon-Campfire"
    ]
    
    
    var body: some View {
        List{
            //MARK: Section header
            Section {
                HStack {
                    Spacer()
                    Image(systemName: "laurel.leading")
                        .font(.system(size: 80, weight: .black))
                    VStack(spacing: -10) {
                        Text("Hike")
                            .font(.system(size: 66, weight: .black))
                        
                        Text("Editors Choice")
                            .fontWeight(.medium)
                    }
                    
                    Image(systemName: "laurel.trailing")
                        .font(.system(size: 80, weight: .black))
                    Spacer()
                }
                .foregroundStyle(
                    LinearGradient(
                        colors: [
                            Color(.colorGreenLight),
                            Color(.colorGreenMedium),
                            Color(.colorGreenDark)],
                        startPoint: .top,
                        endPoint: .bottom))
                .padding(.top, 8)
                
                VStack(spacing: 8) {
                    Text("Where can you find \nperfect tracks?")
                        .font(.title2)
                        .fontWeight(.heavy)
                    
                    Text("The hike which looks gourgeus in photo but is even better once you are acctuality there. The hike that you hope to again someday. \nFind the bast day hikes in the app")
                        .font(.footnote)
                        .italic()
                    
                    Text("Dust off the boots! it`s time for a walk")
                        .fontWeight(.heavy)
                        .foregroundStyle(Color(.colorGreenMedium))
                }
                .multilineTextAlignment(.center)
                .padding(.bottom, 16)
                .frame(maxWidth: .infinity)
            }//:header sectoin
            .listRowSeparator(.hidden)
            
            //MARK: section icons
            
            
            Section(header: Text("Alternate icons")) {
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 12) {
                        ForEach(alternateAppIcons.indices, id: \.self) { item in
                            Button{
                                print("icon \(alternateAppIcons[item]) was pressed.")
                                UIApplication.shared.setAlternateIconName(alternateAppIcons[item]){ error in
                                    
                                    if error != nil {
                                        print("Ocorreu um erro ao alterar o icone do aplicativo: \(String(describing: error?.localizedDescription))")
                                    } else {
                                        print("Sucesso! icone alterado para o icone \(alternateAppIcons[item])")
                                    }
                                    
                                }
                            }label: {
                                Image("\(alternateAppIcons[item])-Previews")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 80, height: 80)
                                    .cornerRadius(16)
                            }
                        .buttonStyle(.borderless)
                        }
                    }
                }//: end scroolview
                .padding(.top, 12)
                
                Text("Chose your favorite app icon from the colection above.")
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .multilineTextAlignment(.center)
                    .foregroundStyle(.secondary)
                    .font(.footnote)
                    .padding(.bottom, 12)
            }//: end section
            .listRowSeparator(.hidden)
            
            
            
            Section(
                header: Text("About"),
                footer: HStack{
                    Spacer()
                    Text("Copyrigth All rigth reserved.")
                    Spacer()
                }
                    .padding(.vertical, 8)
            ) {
                Text("List Row")
                CustomListRowView(rowLabel: "Application", rowIcon: "apps.iphone", rowContent: "Hike", rowTintcolor: .blue)
                
                CustomListRowView(rowLabel: "Compatibility", rowIcon: "info.circle", rowContent: "Ios, IpadOS", rowTintcolor: .red)
                
                CustomListRowView(rowLabel: "Technology", rowIcon: "swift", rowContent: "Swift", rowTintcolor: .orange)
                
                CustomListRowView(rowLabel: "Version", rowIcon: "gear", rowContent: "1.0", rowTintcolor: .green)
                
                CustomListRowView(rowLabel: "Developer", rowIcon: "ellipsis.curlybraces", rowContent: "Vinicius Wessner", rowTintcolor: .mint)
                
                CustomListRowView(rowLabel: "Website", rowIcon: "globe", rowTintcolor: .indigo, rowLinkLabel: "Clique para acessar", rowLinkDestination: "https://viniciuswessner.vercel.com")
                
            }//: end section
            
            //MARK: Section About
            
        }//: list
    }
}

#Preview {
    SettingsView()
}
