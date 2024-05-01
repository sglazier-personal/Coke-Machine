//
//  ContentView.swift
//  Coke Machine
//
//  Created by Sherwood Glazier on 5/1/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sodaChoice1 = false
    @State private var sodaChoice2 = false
    @State private var sodaChoice3 = false
    @State private var sodaChoice4 = false
    @State private var sodaChoice = false
    
    var body: some View {
        ZStack {
            BackgroundView()
            
            VStack {
                Text("Coke Machine")
                    .font(.system(size: 32, weight: .medium, design: .default))
                    .foregroundColor(.white)
                    .padding()
                HStack {
                    Text("Selection")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.trailing, 40)
                        .padding(.bottom, 40)
                    Text("Selected")
                        .font(.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.white)
                        .padding(.bottom, 40)
                }
                VStack {
                    SodaList(name: "Coke", backgroundColor: .red, sodaChoice: sodaChoice1)
                    SodaList(name: "Sprite", backgroundColor: .green, sodaChoice: sodaChoice2)
                    SodaList(name: "Dr. Pepper", backgroundColor: .purple, sodaChoice: sodaChoice3)
                    SodaList(name: "Orange", backgroundColor: .orange, sodaChoice: sodaChoice4)
                }
                Spacer()
            }
        }
    }
}
struct ContentView_Previews:
    PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct SodaList: View {
        
    var name: String
    var backgroundColor: Color
    var sodaChoice1: Bool
    var sodaChoice: Bool
    
    var body: some View {
        HStack {
            Button {
                sodaChoice1.toggle()
            }
            label: {
                SodaButton(soda: name, backgroundColor: backgroundColor)
            }
            Image(systemName: sodaChoice ? "plus.square.fill" : "minus.square")
                .renderingMode(.original)
                .symbolRenderingMode(.multicolor)
                .font(.system(size: 20, weight: .bold, design: .default))
        }
    }
}

struct BackgroundView: View {
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.red, Color("lightBlue")]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing)
        .edgesIgnoringSafeArea(.all)
    }
}

struct SodaButton: View {
    
    var soda: String
    var backgroundColor: Color
    
    var body: some View {
        Text(soda)
            .frame(width: 150, height: 50)
            .background(backgroundColor)
            .foregroundColor(.white)
            .font(.system(size: 20, weight: .bold, design: .default))
            .cornerRadius(10)
            .padding(.trailing, 30)
    }
}
