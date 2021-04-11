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
        }
        Spacer()
    }
}

struct ReminderScreen_Previews: PreviewProvider {
    
    static var previews: some View {
        ReminderScreen()
    }
}


