//
//  ContentView.swift
//  MySchdules
//
//  Created by RajayGoms on 6/19/25.
//

import SwiftUI

struct ContentView: View {
    @State var signInSuccess = false
        
        var body: some View {
            return Group {
                if signInSuccess {
                    HomeView(signInSuccess: $signInSuccess)
                }
                else {
                    LogInView(signInSuccess: $signInSuccess)
                }
            }
        }
}

#Preview {
    ContentView()
}
