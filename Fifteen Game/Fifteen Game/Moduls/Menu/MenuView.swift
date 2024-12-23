import SwiftUI

struct MenuView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showTeam = false
    @State private var showGame = false
    @State private var showShop = false
    @State private var showRules = false
    @State private var showSettings = false
    
    
    @StateObject var user = User.shared
      @StateObject var settingsVM = SettingsModel()
    @StateObject var shopVM = ShopViewModel()
    @StateObject var teamVM = TeamViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(spacing: 0) {
                Spacer()
                
                if geometry.size.width < geometry.size.height {
                    // Вертикальная ориентация
                    ZStack {
                        
                        VStack {
                            HStack(spacing: 5){
                                Spacer()
                              
                                ZStack {
                                    Image(.coinsBg)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 80:43)
                                    Text("\(user.coins)")
                                        .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40 :16, weight: .black))
                                        .foregroundStyle(.white)
                                        .textCase(.uppercase)
                                }.frame(height: DeviceInfo.shared.deviceType == .pad ? 100:55)
                                
                            }
                            Spacer()
                        }.padding()
                        
                        HStack {
                            Spacer()
                            VStack(spacing: 25) {
                                Button {
                                    showTeam = true
                                } label: {
                                    ZStack {
                                        Image(.teamBg)
                                            .resizable()
                                            .scaledToFit()
                                            
                                        VStack(spacing: -5) {
                                            Text("Team")
                                                .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40:20, weight: .bold))
                                                .foregroundStyle(.white)
                                                .textCase(.uppercase)
                                            HStack(spacing: DeviceInfo.shared.deviceType == .pad ? 100:50) {
                                                Spacer()
                                                if let currentTeam = teamVM.currentTeam {
                                                    HStack {
                                                        Image(currentTeam.icon)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: DeviceInfo.shared.deviceType == .pad ? 50:25)
                                                        
                                                        Text(currentTeam.name)
                                                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 20:10, weight: .regular))
                                                            .foregroundStyle(.white)
                                                            .textCase(.uppercase)
                                                    }
                                                    HStack {
                                                        Text("Score: \(currentTeam.score)")
                                                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 20:10, weight: .regular))
                                                            .foregroundStyle(.white)
                                                            .textCase(.uppercase)
                                                        Image(.team1Logo)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: DeviceInfo.shared.deviceType == .pad ? 50:25)
                                                            .opacity(0)
                                                    }
                                                }
                                                Spacer()
                                            }
                                        }
                                    }.frame(height: DeviceInfo.shared.deviceType == .pad ? 140:70)
                                }
                                
                                Button {
                                    showGame = true
                                } label: {
                                    TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Let's fly", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                }
                                
                                
                                Button {
                                    showShop = true
                                } label: {
                                    TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Shop", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                }
                                
                                Button {
                                    showRules = true
                                } label: {
                                    TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "How to play?", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                }
                                
                                Button {
                                    showSettings = true
                                } label: {
                                    TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Settings", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                }
                                
                            }
                            Spacer()
                        }
                    }
                } else {
                    ZStack {
                        
                        VStack {
                            HStack(spacing: 5){
                                Spacer()
                                ZStack {
                                    Image(.coinsBg)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 80:43)
                                    Text("\(user.coins)")
                                        .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40 :16, weight: .black))
                                        .foregroundStyle(.white)
                                        .textCase(.uppercase)
                                }.frame(height: DeviceInfo.shared.deviceType == .pad ? 100:55)
                                
                            }.padding([.top, .trailing], 20)
                            Spacer()
                        }
                        
                        VStack {
                            Spacer()
                            
                            VStack(spacing: 0) {
                                Spacer()
                                Button {
                                    showTeam = true
                                } label: {
                                    ZStack {
                                        Image(.teamBg)
                                            .resizable()
                                            .scaledToFit()
                                            
                                        VStack(spacing: 0) {
                                            Text("Team")
                                                .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 48:24, weight: .bold))
                                                .foregroundStyle(.white)
                                                .textCase(.uppercase)
                                            HStack(spacing: DeviceInfo.shared.deviceType == .pad ? 140:70) {
                                                Spacer()
                                                if let currentTeam = teamVM.currentTeam {
                                                    HStack {
                                                        Image(currentTeam.icon)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: DeviceInfo.shared.deviceType == .pad ? 70:35)
                                                        
                                                        Text(currentTeam.name)
                                                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 28:14, weight: .regular))
                                                            .foregroundStyle(.white)
                                                            .textCase(.uppercase)
                                                    }
                                                    HStack {
                                                        Text("Score: \(currentTeam.score)")
                                                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 28:14, weight: .regular))
                                                            .foregroundStyle(.white)
                                                            .textCase(.uppercase)
                                                        Image(.team1Logo)
                                                            .resizable()
                                                            .scaledToFit()
                                                            .frame(height: DeviceInfo.shared.deviceType == .pad ? 70:35)
                                                            .opacity(0)
                                                    }
                                                }
                                                Spacer()
                                            }
                                        }
                                    }.frame(height: DeviceInfo.shared.deviceType == .pad ? 190:107)
                                }
                                HStack(spacing: 5) {
                                    Spacer()
                                    Button {
                                        
                                        showGame = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Let's fly", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    
                                    Button {
                                        
                                        showShop = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Shop", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    Spacer()
                                }
                                
                                HStack(spacing: 5) {
                                    Spacer()
                                    Button {
                                        showRules = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "How to play?", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    
                                    Button {
                                        showSettings = true
                                    } label: {
                                        TextBg(height: DeviceInfo.shared.deviceType == .pad ? 150 : 75, text: "Settings", textSize: DeviceInfo.shared.deviceType == .pad ? 40 : 24)
                                    }
                                    Spacer()
                                }
                                
                                Spacer()
                            }.padding(.top)
                           
                        }
                        
                        
                    }
                }
            }
            .background(
                Image(.bg)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .scaledToFill()
                
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
            .fullScreenCover(isPresented: $showTeam) {
                TeamView(viewModel: teamVM)
            }
            .fullScreenCover(isPresented: $showGame) {
                GameView(teamVM: teamVM)
            }
            .fullScreenCover(isPresented: $showShop) {
                ShopView(viewModel: shopVM)
            }
            .fullScreenCover(isPresented: $showRules) {
                RulesView()
            }
            .fullScreenCover(isPresented: $showSettings) {
                SettingsView(settings: settingsVM)
                
            }
            
        }
    }
}

#Preview {
    MenuView()
}
