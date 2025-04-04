//
//  ContentView.swift
//  TCAProject
//
//  Created by Gab on 4/3/25.
//

import SwiftUI

import ProfileEditFeature
import ProfileDetailFeature

import ComposableArchitecture

struct ContentView: View {
    @Perception.Bindable var store: StoreOf<AppReducer>
    
    var body: some View {
        WithPerceptionTracking {
            NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
                WithPerceptionTracking {
                    
                    Button {
                        self.store.send(.moveProfileDeatil)
                    } label: {
                        Text("Move ProfileDetail")
                    }
                    
                    Button {
                        
                    } label: {
                        Text("Move ProfileEdit")
                    }
                }

                
            } destination: { store in
                switch store.case {
                case .profileDetail(let store):
                    WithPerceptionTracking {
                        ProfileDetailView(store: store)
                    }
                case .profileEdit(let store):
                    WithPerceptionTracking {
                        ProfileEditView(store: store)
                    }
                }
            }
        }

    }
}

#Preview {
    let store: StoreOf<AppReducer> = .init(initialState: AppReducer.State()) {
        AppReducer()
    }
    
    ContentView(store: store)
}
