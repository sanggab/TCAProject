//
//  TCAProjectApp.swift
//  TCAProject
//
//  Created by Gab on 4/3/25.
//

import SwiftUI

import ComposableArchitecture

@main
struct TCAProjectApp: App {
    let store: StoreOf<AppReducer> = .init(initialState: AppReducer.State()) {
        AppReducer()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView(store: store)
        }
    }
}
