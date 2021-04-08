//
//  HeaderView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 19.02.2021.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Remember to wear a mask and stay safe!")
                    .padding(.leading)
                    .font(.custom("Kefa", size: 18))
                    .foregroundColor(Color(#colorLiteral(red: 0.4756349325, green: 0.4756467342, blue: 0.4756404161, alpha: 1)))
                Spacer()
            }
        }
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}
