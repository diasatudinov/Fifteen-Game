import SwiftUI

struct RulesView: View {
    @StateObject var user = User.shared
    @Environment(\.presentationMode) var presentationMode
    var viewModel = RulesViewModel()
    
    @State private var currentTab: Int = 0
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
                
                
                
                ZStack {
                    Image(.rulesBg)
                        .resizable()
                        .scaledToFit()
                    
                    HStack {
                        Spacer()
                        
                        TabView(selection: $currentTab) {
                            achivementView(image: .eagle, header: "In this game, you control an \neagle soaring through the sky.", imageHeight: 40)
                                .tag(0)
                            achivementView(image: .obstacles, header: "Your goal is to avoid obstacles\n like clouds, airplanes, and\n buildings while collecting as\n many gold coins as possible.", imageHeight: 80)
                                .tag(1)
                            achivementView(image: .bonus, header: "Use special abilities to enhance\n your gameplay: the magnet\n helps attract coins from a\n distance, the shield protects\n the eagle from one collision,\n and the speed boost lets you\n dash through tricky areas\n quickly.", imageHeight: 50)
                                .tag(2)
                            achivementView(image: .bonus2, header: "Plan your moves wisely, use\n your abilities strategically,\n and aim to set a high score!", imageHeight: 50)
                                .tag(3)
                        }
                        .tabViewStyle(.page)
                       
                        Spacer()
                    }
                }.frame(height: DeviceInfo.shared.deviceType == .pad ? 500:300)

                    
                
                
                Spacer()
            }
            Spacer()
        }.background(
            Image(.bg)
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .scaledToFill()
            
        )
    }
    
    @ViewBuilder func achivementView(image: ImageResource, header: String, imageHeight: CGFloat) -> some View {
        
        
        HStack(spacing: 20) {
            Button {
                if currentTab > 0 {
                    currentTab -= 1
                }
            } label: {
                Image(.backBtn)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
            }
            VStack(alignment: .center, spacing: 10) {
                
                Image(image)
                    .resizable()
                    .foregroundColor(.black)
                    .scaledToFit()
                    .frame(height: DeviceInfo.shared.deviceType == .pad ? imageHeight * 1.8 : imageHeight)
                
                
                Text(header)
                    .font(.system(size: DeviceInfo.shared.deviceType == .pad ? 32:16, weight: .bold))
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .textCase(.uppercase)
                    .padding(.bottom, 8)
                
            }
            
            Button {
                if currentTab < 3 {
                    currentTab += 1
                }
            } label: {
                Image(.backBtn)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 40)
                    .rotationEffect(.degrees(180))
            }
        }
    }
}

#Preview {
    RulesView()
}