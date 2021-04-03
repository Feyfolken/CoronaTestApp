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
    private var frameSize: CGSize
    private var titleTextFrameSize: CGSize
    private var valueTextFrameSize: CGSize
    private var fontSize: CGFloat
    
    internal init(titleText: String,
                  valueText: String,
                  frameSize: CGSize = CGSize(width: 170.0, height: 158.0),
                  titleTextFrameSize: CGSize = CGSize(width: 150.0, height: 28),
                  valueTextFrameSize: CGSize = CGSize(width: 150.0, height: 90.0),
                  fontSize: CGFloat = 20) {
        self.titleText = titleText
        self.valueText = valueText
        self.frameSize = frameSize
        self.titleTextFrameSize = titleTextFrameSize
        self.valueTextFrameSize = valueTextFrameSize
        self.fontSize = fontSize
    }
    
    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                       Color("InfoViewLighterColor")]),
                           startPoint: .leading,
                           endPoint: .trailing)
                .frame(width: frameSize.width, height: frameSize.height)
                .cornerRadius(42)
            
            VStack {
                Text(titleText)
                    .font(.system(size: fontSize, weight: .bold, design: .rounded))
                    .frame(width: titleTextFrameSize.width, height: titleTextFrameSize.height)
                    .foregroundColor(Color("CommonTextColor"))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)

                Text(valueText)
                    .font(.custom("Kefa", size: fontSize))
                    .frame(width: valueTextFrameSize.width, height: valueTextFrameSize.height)
                    .foregroundColor(Color("CommonTextColor"))
                    .minimumScaleFactor(0.5)
                    .lineLimit(1)

                
            }
        }
    }
}
