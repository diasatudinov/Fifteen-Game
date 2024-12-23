//
//  TeamsView.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//

import SwiftUI

struct TeamsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: TeamViewModel
    @State private var currentTab: Int = 0
    var body: some View {
        ZStack {
            Color.main.ignoresSafeArea()
            
            if viewModel.currentTeam != nil {
                VStack {
                    HStack {
                        Button {
                            presentationMode.wrappedValue.dismiss()
                        } label: {
                            ZStack {
                                Image(.backTL)
                                    .resizable()
                                    .scaledToFit()
                            }.frame(height: DeviceInfo.shared.deviceType == .pad ? 100:50)
                            
                        }
                        Spacer()
                        
                        
                    }.padding([.top,.horizontal], 20)
                    
                    Spacer()
                }
            }
            
            HStack {
                
                Button {
                    if currentTab > 0 {
                        currentTab -= 1
                    }
                } label: {
                    Image(.leftTL)
                        .resizable()
                        .scaledToFit()
                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 100 : 50)
                }
                
                TabView(selection: $currentTab) {
                    ForEach(viewModel.teams.indices, id: \.self) { index in
                        achivementView(image: viewModel.teams[index].icon, header: viewModel.teams[index].name, imageHeight: 204, team: viewModel.teams[index])
                            .tag(index)
                    }
                }
                .tabViewStyle(.page)
                
                .frame(width: DeviceInfo.shared.deviceType == .pad ? 480 : 240)
                
                Button {
                    if currentTab < 4 {
                        currentTab += 1
                    }
                } label: {
                    Image(.leftTL)
                        .resizable()
                        .scaledToFit()
                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 100 : 50)
                        .rotationEffect(.degrees(180))
                }
            }
        }
    }
    
    @ViewBuilder func achivementView(image: String, header: String, imageHeight: CGFloat, team: Team) -> some View {
        
        
        HStack(spacing: 20) {
            
            VStack(alignment: .center, spacing: 10) {
                
                Image(image)
                    .resizable()
                    .foregroundColor(.black)
                    .scaledToFit()
                    .frame(height: DeviceInfo.shared.deviceType == .pad ? imageHeight * 1.8 : imageHeight)
                
                
                Text(header)
                    .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 48:24))
                    .foregroundColor(.black)
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .padding(.bottom, 8)
                
                
                Button {
                    
                    viewModel.currentTeam = team
                } label: {
                    TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90:46, text: viewModel.currentTeam?.name == header ? "Selected" : "Select", textSize: DeviceInfo.shared.deviceType == .pad ? 48:24)
                    
                }
                
                
            }
            
        }
    }
}

#Preview {
    TeamsView(viewModel: TeamViewModel())
}
