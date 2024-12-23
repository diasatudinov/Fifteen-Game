//
//  SplashScreen.swift
//  Fifteen Game
//
//  Created by Dias Atudinov on 23.12.2024.
//

import SwiftUI

struct SplashScreen: View {
    @State private var progress: Double = 0.0
    @State private var timer: Timer?

    @State private var scale: CGFloat = 1.0
    
    var body: some View {
        ZStack {
            
            Color.main.ignoresSafeArea()
            
            VStack {
                Spacer()
                
                Image(.logoTL)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 210)
               
                
                Spacer()
                
                ZStack {
                    VStack {
                        Text("Loading...")
                            .font(.custom(Alike.regular.rawValue, size: 24))
                            .textCase(.uppercase)
                        ProgressView(value: progress, total: 100)
                            .progressViewStyle(LinearProgressViewStyle())
                            .accentColor(Color.secondaryMain)
                            .cornerRadius(10)
                            .padding(.horizontal, 1)
                            .overlay {
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.mainRed, lineWidth: 0.5)
                            }
                            .scaleEffect(y: 4.0, anchor: .center)
                            .padding(.horizontal, 92)
                    }
                }
                .foregroundColor(.black)
                .padding(.bottom, 25)
            }
        }.onAppear {
            startTimer()
        }
    }
    
    func startTimer() {
        timer?.invalidate()
        progress = 0
        timer = Timer.scheduledTimer(withTimeInterval: 0.07, repeats: true) { timer in
            if progress < 100 {
                progress += 1
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    SplashScreen()
}
