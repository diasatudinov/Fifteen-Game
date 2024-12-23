import SwiftUI
import StoreKit

struct SettingsView: View {
    @StateObject var user = User.shared
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var settings: SettingsModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        ZStack {
                            Image(.backBtn)
                                .resizable()
                                .scaledToFit()
                        }.frame(height: DeviceInfo.shared.deviceType == .pad ? 100:55)
                        
                    }
                    Spacer()
                    
                    HStack(spacing: 5){
                        Spacer()
                        
                        ZStack {
                            Image(.coinsBg)
                                .resizable()
                                .scaledToFit()
                            
                            Text("\(user.coins)")
                                .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40:20, weight: .black))
                                .foregroundStyle(.white)
                                .textCase(.uppercase)
                        }.frame(height: DeviceInfo.shared.deviceType == .pad ? 100:50)
                        
                    }
                    
                
            }.padding([.top,.horizontal], 20)

                Spacer()
            }
            
            VStack(spacing: 0) {
               
                ZStack {
                    
                    Image(.settingsBg)
                        .resizable()
                        .scaledToFit()
                    
                    VStack(spacing: 5) {
                        Text("music")
                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40:20, weight: .bold))
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                        HStack {
//                            Image(.musicIcon)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: DeviceInfo.shared.deviceType == .pad ? 120:65)
                            Button {
                                settings.musicEnabled.toggle()
                            } label: {
                                if settings.musicEnabled {
                                    Image(.on)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:50)
                                } else {
                                    Image(.off)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:50)
                                }
                            }
                            
                        }
                        
                        Text("Vibration")
                            .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40:20, weight: .bold))
                            .foregroundStyle(.white)
                            .textCase(.uppercase)
                        HStack {
//                            Image(.effectsIcon)
//                                .resizable()
//                                .scaledToFit()
//                                .frame(height: DeviceInfo.shared.deviceType == .pad ? 120:65)
                            
                            Button {
                                settings.soundEnabled.toggle()
                            } label: {
                                if settings.soundEnabled {
                                    Image(.on)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:50)
                                } else {
                                    Image(.off)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:50)
                                }
                            }
                        }.padding(.bottom, 10)
                       
                        Button {
                            rateUs()
                        } label: {
                            ZStack {
                                Image(.textBg)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: DeviceInfo.shared.deviceType == .pad ? 65:50)
                                
                                Text("Rate us")
                                    .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 40:20, weight: .bold))
                                    .foregroundStyle(.white)
                                    .textCase(.uppercase)
                            }
                        }
                        
                    }
                    
                }.scaledToFit().frame(height: DeviceInfo.shared.deviceType == .pad ? 500:312)
            }
        }.background(
            Image(.bg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
        )
    }
    
    func rateUs() {
        if let scene = UIApplication.shared.connectedScenes.first(where: { $0.activationState == .foregroundActive }) as? UIWindowScene {
            SKStoreReviewController.requestReview(in: scene)
        }
    }
}

#Preview {
    SettingsView(settings: SettingsModel())
}