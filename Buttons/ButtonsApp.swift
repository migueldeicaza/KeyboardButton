//
//  ButtonsApp.swift
//  Buttons
//
//  Created by Miguel de Icaza on 6/18/21.
//

import SwiftUI

@main
struct ButtonsApp: App {
    @State var foo = "test"
    
    var body: some Scene {
        WindowGroup {
            VStack {
                ContentView(primary: "8", secondary: "*")
                TextField ("Hello", text: $foo)
            }
        }
    }
}
