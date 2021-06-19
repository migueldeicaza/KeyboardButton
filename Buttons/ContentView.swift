//
//  ContentView.swift
//  Buttons
//
//  Created by Miguel de Icaza on 6/18/21.
//

import SwiftUI

struct ContentView: View {
    let smallRatio = 0.4
    let largeRatio = 0.6
    @State var y: CGFloat = 0
    @State var primary: String
    @State var secondary: String
    @State var buttonSize = 24.0
    @State var tapped = 0
    
    var body: some View {
        ZStack {
            VStack {
                Text ("\(secondary)")
                    .font (.system(size: buttonSize * smallRatio))
                    .foregroundColor(y < buttonSize * smallRatio ? .secondary : .primary)
                Text(primary)
                    .font (.system(size: buttonSize * largeRatio))
                    .foregroundColor(y < buttonSize * smallRatio ? .primary : .secondary)
            }
            .offset(x: 0, y: y)
            .gesture(DragGesture ()
                        .onChanged { value in
                            withAnimation(.easeIn) {
                                y = max (0, min (value.translation.height, buttonSize * largeRatio * 1.3333))
                            }
                        }
                        .onEnded { x in
                            if y > buttonSize * smallRatio {
                                print ("It hits!")
                                tapped = 10
                                withAnimation (.easeIn) {
                                    tapped = 0
                                }
                            }
                            withAnimation(.spring()) {
                                y = 0
                            }
                        })
            .gesture(TapGesture ()
                        .onEnded {
                print ("Tapped")
                tapped = 10
                withAnimation(.easeIn) {
                    tapped = 0
                }
            })
        }
        .padding(3)
        .background(tapped == 0
                    ? Color(UIColor.systemBackground)
                    : Color(UIColor.tertiarySystemFill))
                    
        .cornerRadius(3)
        .shadow(color: .gray, radius: 1, x: 0, y: 1)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ZStack {
                Color (red: 214.0/255.0, green: 216.0/255.0, blue: 221.0/255.0)
                ContentView(primary: "B1", secondary: "B2")
            }
            TextField ("Hello", text: .constant(""))
        }
    }
}
