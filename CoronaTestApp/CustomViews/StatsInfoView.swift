//
//  StatsInfoView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 19.02.2021.
//

import SwiftUI

struct StatsInfoView: View {
    private var titleText: String
    private var valueText: String
    
    internal init(titleText: String, valueText: String) {
        self.titleText = titleText
        self.valueText = valueText
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                       Color("InfoViewLighterColor")]),
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(width: 170.0, height: 158.0)
                .cornerRadius(42)
            
            VStack {
                Text(titleText)
                    .font(.system(size: 20, weight: .bold, design: .rounded))
                    .frame(width: 150.0, height: 28.0)
                    .foregroundColor(Color("CommonTextColor"))

                Text(valueText)
                    .font(.custom("Kefa", size: 20))
                    .frame(width: 150.0, height: 90.0)
                    .foregroundColor(Color("CommonTextColor"))
                
                
            }
        }
    }
}
