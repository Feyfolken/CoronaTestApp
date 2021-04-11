//
//  ReminderCardView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 11.04.2021.
//

import SwiftUI

struct ReminderCardView: View {
    var reminderData: ReminderData
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                Text(reminderData.titleText)
                    .font(.system(size: 22, weight: .bold))
                    .frame(width: 160, alignment: .leading)
                    .foregroundColor(Color("CommonTextColor"))
                Spacer()
                
                Image(reminderData.logo)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 28, height: 38)
            }
            
            Text(reminderData.descriptionText .uppercased())
                .font(.system(size: 14))
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("CommonTextColor"))

            
            reminderData.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180)
        }
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .frame(width: 275, height: 275)
        .background(reminderData.backgroundColor)
        .cornerRadius(32)
        .shadow(color: reminderData.backgroundColor.opacity(0.6), radius: 20, x: 0, y: 20)
    }
}
