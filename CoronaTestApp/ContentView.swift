//
//  ContentView.swift
//  CoronaTestApp
//
//  Created by Feyfolken on 19.02.2021.
//

import SwiftUI

struct ContentView: View {
    @AppStorage ("isDarkMode") private var isDarkMode = false
    
    private let gridRows = [
        GridItem(.flexible())
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [Color("AppBackgroundDarkerColor"),
                                                           Color("AppBackgroundLighterColor"),
                                                           Color("AppBackgroundDarkerColor")]),
                               startPoint: .bottomLeading,
                               endPoint: .topTrailing)
                    .edgesIgnoringSafeArea(.bottom)
                
                ScrollView {
                    VStack {
                        Spacer().frame(height: 30)
                        ScrollView(.horizontal) {
                            LazyHGrid(rows: gridRows) {
                                ForEach(0...6, id: \.self) { _ in
                                    ZStack {
                                        LinearGradient(gradient: Gradient(colors: [Color("InfoViewDarkerColor"),
                                                                                   Color("InfoViewLighterColor")]),
                                                       startPoint: .leading,
                                                       endPoint: .trailing)
                                        .frame(width: 160.0, height: 88.0)
                                        .cornerRadius(42)
                                        
                                        
                                        Text("RUS")
                                            .foregroundColor( Color("CommonTextColor"))
                                            .font(.custom("Kefa", size: 24))
                                            
                                    }
                                }
                            }
                        }.padding()
                    
                        StatsPanelView()
                        Spacer()
                    }
                }
            }
            .navigationBarTitle("Hi, Vadim")
            
            .toolbar {
                Button(action: {
                    isDarkMode.toggle()
                    
                }) {
                    HStack(spacing: 10) {
                        Image("moon")
                        
                    }
                }
            }
            .onAppear {
                UINavigationBarAppearance()
                    .setNabBarColors()
            }
            
        }.preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
        }
    }
}
