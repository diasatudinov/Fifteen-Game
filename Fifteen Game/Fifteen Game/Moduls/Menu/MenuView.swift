//
//  MenuView.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//


import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showTraining = false
    @State private var showGame = false
    @State private var showResults = false
    @State private var showRules = false
    @State private var showSettings = false
    
    
    @StateObject var settingsVM = SettingsModel()
    @StateObject var teamVM = TeamViewModel()
    @StateObject private var trainingVM = TrainingViewModel()
    
    var body: some View {
        if teamVM.currentTeam == nil {
            TeamsView(viewModel: teamVM)
        } else {
            GeometryReader { geometry in
                VStack(spacing: 0) {
                    Spacer()
                    
                    if geometry.size.width < geometry.size.height {
                        // Вертикальная ориентация
                        ZStack {
                            
                            
                            
                            HStack {
                                Spacer()
                                VStack(spacing: 25) {
                                    Image(.logoTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 210)
                                    Button {
                                        showTraining = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Training", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    
                                    Button {
                                        
                                        showGame = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Online", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    Button {
                                        withAnimation {
                                            showResults = true
                                        }
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Best Results", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    Button {
                                        showRules = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Rules", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    Button {
                                        showSettings = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Settings", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                }
                                Spacer()
                            }
                            
                            if showResults {
                                ZStack {
                                    Image(.bestScoreBg)
                                        .resizable()
                                        .scaledToFit()
                                    
                                    
                                    VStack(spacing: 5) {
                                        Spacer()
                                        Text("Time")
                                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 40:20))
                                            .foregroundStyle(.white)
                                            .textCase(.uppercase)
                                        
                                        Text(trainingVM.scoreTime)
                                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 40:20))
                                            .foregroundStyle(.white)
                                            .textCase(.uppercase)
                                            .padding(.horizontal, 50)
                                            .padding(.vertical, 5)
                                            .background(
                                                Rectangle()
                                                    .foregroundStyle(.timeBg)
                                                    .cornerRadius(20)
                                                
                                            )
                                            .padding(.bottom, DeviceInfo.shared.deviceType == .pad ? 20:10)
                                        
                                        Button {
                                            withAnimation {
                                                showResults = false
                                            }
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 80:38, text: "menu", textSize: DeviceInfo.shared.deviceType == .pad ? 48:24)
                                        }
                                        
                                    }.padding(.bottom, DeviceInfo.shared.deviceType == .pad ? 50:18)
                                }.frame(height: DeviceInfo.shared.deviceType == .pad ? 400:192)
                            }
                            
                            
                        }
                    } else {
                        ZStack {
                            
                            VStack {
                                Spacer()
                                
                                VStack(spacing: 15) {
                                    Image(.logoTL)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 182)
                                    HStack(spacing: 15) {
                                        Spacer()
                                        Button {
                                            showTraining = true
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Training", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                        }
                                        
                                        
                                        Button {
                                            
                                            showGame = true
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Online", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                        }
                                        Spacer()
                                    }
                                    
                                    HStack(spacing: 15) {
                                        Spacer()
                                        Button {
                                            withAnimation {
                                                showResults = true
                                            }
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Best Results", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                        }
                                        
                                        Button {
                                            showRules = true
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Rules", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                        }
                                        Spacer()
                                    }
                                    
                                    HStack(spacing: 5) {
                                        Spacer()
                                        
                                        
                                        Button {
                                            showSettings = true
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 90 : 46, text: "Settings", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                        }
                                        Spacer()
                                    }
                                    
                                    
                                }
                                Spacer()
                            }
                            
                            if showResults {
                                ZStack {
                                    Image(.bestScoreBg)
                                        .resizable()
                                        .scaledToFit()
                                    
                                    
                                    VStack(spacing: 5) {
                                        Spacer()
                                        Text("Time")
                                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 40:20))
                                            .foregroundStyle(.white)
                                            .textCase(.uppercase)
                                        
                                        Text(trainingVM.scoreTime)
                                            .font(.custom(Alike.regular.rawValue, size: DeviceInfo.shared.deviceType == .pad ? 40:20))
                                            .foregroundStyle(.white)
                                            .textCase(.uppercase)
                                            .padding(.horizontal, 50)
                                            .padding(.vertical, 5)
                                            .background(
                                                Rectangle()
                                                    .foregroundStyle(.timeBg)
                                                    .cornerRadius(20)
                                                
                                            )
                                            .padding(.bottom, DeviceInfo.shared.deviceType == .pad ? 20:10)
                                        
                                        Button {
                                            withAnimation {
                                                showResults = false
                                            }
                                        } label: {
                                            TextBg(height: DeviceInfo.shared.deviceType == .pad ? 80:38, text: "menu", textSize: DeviceInfo.shared.deviceType == .pad ? 48:24)
                                        }
                                        
                                    }.padding(.bottom, DeviceInfo.shared.deviceType == .pad ? 50:18)
                                }.frame(height: DeviceInfo.shared.deviceType == .pad ? 400:192)
                            }
                            
                        }
                    }
                    Spacer()
                }
                .background(
                    ZStack {
                        Color.main.ignoresSafeArea()
                        Image(.bgTL)
                            .resizable()
                            .edgesIgnoringSafeArea(.all)
                            .scaledToFill()
                    }
                    
                )
                .onAppear {
                    if settingsVM.musicEnabled {
                        MusicPlayer.shared.playBackgroundMusic()
                    }
                }
                .onChange(of: settingsVM.musicEnabled) { enabled in
                    if enabled {
                        MusicPlayer.shared.playBackgroundMusic()
                    } else {
                        MusicPlayer.shared.stopBackgroundMusic()
                    }
                }
                .fullScreenCover(isPresented: $showTraining) {
                    TrainingView(viewModel: trainingVM, settingsVM: settingsVM)
                }
                .fullScreenCover(isPresented: $showGame) {
                    OnlineView(teamVM: teamVM, settingsVM: settingsVM)
                }
                .fullScreenCover(isPresented: $showRules) {
                    RulesView()
                }
                .fullScreenCover(isPresented: $showSettings) {
                    SettingsView(settings: settingsVM, teamVM: teamVM)
                    
                }
                
            }
        }
        
    }
}

#Preview {
    MenuView()
}
