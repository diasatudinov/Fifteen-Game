//
//  SettingsView.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI
import StoreKit

struct SettingsView: View {
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings: SettingsModel
    @ObservedObject var teamVM: TeamViewModel
    
    @State private var showChangeTeam = false
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
            
            VStack(spacing: 0) {
                Spacer()
                ZStack {
                    
                    Image(.settingsBgTL)
                        .resizable()
                        .scaledToFit()
                    
                    VStack(spacing: 5) {
                        Text("music")
                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 48:24))
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                        HStack {
                            Button {
                                settings.musicEnabled.toggle()
                            } label: {
                                if settings.musicEnabled {
                                    Image(.onTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:26)
                                } else {
                                    Image(.offTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:26)
                                }
                            }
                            
                        }.padding(.bottom, 10)
                        
                        Text("Vibration")
                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 48:24))
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                        HStack {
                            Button {
                                settings.soundEnabled.toggle()
                            } label: {
                                if settings.soundEnabled {
                                    Image(.onTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:26)
                                } else {
                                    Image(.offTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:26)
                                }
                            }
                        }.padding(.bottom, 10)
                        
                        Button {
                            rateUs()
                        } label: {
                            ZStack {
                                
                                Text("Rate us")
                                    .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 48:24))
                                    .foregroundStyle(.white)
                                    .textCase(.uppercase)
                            }
                        }.padding(.bottom, 10)
                        
                        Button {
                            showChangeTeam = true
                        } label: {
                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90:46, text: "Change Team", textSize: DeviceInfo.shared.deviceType == .pad ? 48:24)
                            
                            
                        }
                        
                    }
                    
                }.scaledToFit().frame(height: DeviceInfo.shared.deviceType == .pad ? 550:283)
                Spacer()
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
        .fullScreenCover(isPresented: $showChangeTeam) {
            TeamsView(viewModel: teamVM)
        }
    }
    
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}

#Preview {
    SettingsView(settings: SettingsModel(), teamVM: TeamViewModel())
}
