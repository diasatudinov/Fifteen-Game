//
//  RulesView.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

struct RulesView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var currentTab: Int = 0
    var body: some View {
        ZStack {
            
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
            VStack {
                
                Image(.logoTL)
                    .resizable()
                    .scaledToFit()
                    .frame(height: DeviceInfo.shared.deviceType == .pad ? 350 : 182)
                
                Text("In this game, the goal is to rearrange the tiles on the board by sliding them into the empty space, creating a numerical sequence or completing a picture. Players must strategize their moves to achieve the solution in the fewest steps or shortest time. The challenge lies in optimizing each move while racing against the opponent to finish first")
                    .foregroundStyle(.white)
                    .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 28:14))
                    .textCase(.uppercase)
                    .padding(10)
                    .padding(.vertical, 7)
                    .multilineTextAlignment(.center)
                    .frame(width: DeviceInfo.shared.deviceType == .pad ? 800:400)
                    .background(
                        Rectangle()
                            .foregroundStyle(.bgMain)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(lineWidth: 2).foregroundStyle(.mainRed)
                            )
                    )
                    .cornerRadius(15)
                    
            }
            
        }.background(
            ZStack {
                Color.main.ignoresSafeArea()
                Image(.bgTL)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
            }
            
        )
    }
}

#Preview {
    RulesView()
}
