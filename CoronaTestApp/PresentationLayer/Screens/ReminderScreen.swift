//
//  ReminderScreen.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 11.04.2021.
//

import SwiftUI

struct ReminderData: Identifiable {
    var id = UUID()
    var titleText: String
    var descriptionText: String = "and stay safe"
    var logo: String = "coronavirus"
    var image: Image
    var backgroundColor: Color = Color("NavigationBarBackgroundColor")
}

struct ReminderScreen: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("AppBackgroundDarkerColor"),
                                                       Color("AppBackgroundLighterColor"),
                                                       Color("AppBackgroundDarkerColor")]),
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
                .edgesIgnoringSafeArea(.bottom)
            
            ScrollView {
                ReminderTextInfoView()
                    .padding(.top, 40)
                
                ScrollableCardsGrid()
            }
        }.navigationTitle("Important to remember")
    }
}

struct ReminderScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ReminderScreen()
    }
}

struct ReminderTextInfoView: View {
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                        Color("InfoViewLighterColor")]),
                            startPoint: .leading,
                            endPoint: .trailing)
                 .frame(width: 350, height: 190)
                 .cornerRadius(42)
            
            Text("To protect yourself and others, use verified information about the disease and take the necessary prevention measures.  Follow the recommendations of local health authorities.")
                .font(.custom("Kefa", size: 20))
                .foregroundColor(Color("CommonTextColor"))
                .frame(width: 320, height: 180)
                .multilineTextAlignment(.center)
        }
    }
}

struct ScrollableCardsGrid: View {
    let reminderData = [ReminderData(titleText: "Wear a mask!",
                                     image: Image("wear-a-mask")),
                        ReminderData(titleText: "Wash your hands!",
                                     image: Image("washing-hands")),
                        ReminderData(titleText: "Maintain social distancing!",
                                     image: Image("social-distancing"))]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(reminderData) { item in
                    GeometryReader { geometry in
                        ReminderCardView(reminderData: item)
                            .rotation3DEffect(
                                Angle(degrees: Double(geometry.frame(in: .global).minX - 30) / -20),
                                axis: (x: 0.0, y: 10.0, z: 0.0))
                    }
                    .frame(width: 275, height: 275)
                }
            }
            .padding(30)
            .padding(.bottom, 30)
            .padding(.top, 30)
        }
    }
}
