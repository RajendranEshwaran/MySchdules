//
//  SchduleHeaderView.swift
//  MySchdules
//
//  Created by RajayGoms on 7/3/25.
//

import SwiftUI

struct SchduleHeaderView: View {
    @ObservedObject private var viewModel = ViewModels()
    var body: some View {
        VStack {
            Text("Test :\(viewModel.schuleHeader.title)").font(.system(size: 24, weight: .bold, design: .default))
        }
    }
}

#Preview {
    SchduleHeaderView()
}
