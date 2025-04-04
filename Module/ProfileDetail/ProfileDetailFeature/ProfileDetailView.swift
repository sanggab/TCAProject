//
//  ProfileDetailView.swift
//  ProfileDetailFeature
//
//  Created by Gab on 4/4/25.
//

import SwiftUI

import Profile

import Kingfisher

import ComposableArchitecture

public struct ProfileDetailView: View {
    private let store: StoreOf<ProfileDetailReducer>
    
    public init(store: StoreOf<ProfileDetailReducer>) {
        self.store = store
    }
    
    public var body: some View {
        let _ = Self._printChanges()
        WithPerceptionTracking {
            VStack {
                Text("ProfileDetailView")
                
                KFImage(URL(string: self.store.profile.imgUrl))
                    .resizable()
                    .frame(width: 300, height: 300)
                
                Text(self.store.profile.name)
                
                Text(String(self.store.profile.age))
                
                Button {
                    self.store.send(.openProfileEdit(self.store.profile))
                } label: {
                    Text("프로필 수정으로 이동")
                }
            }
        }
    }
}

#Preview {
    let store: StoreOf<ProfileDetailReducer> = .init(initialState: ProfileDetailReducer.State()) {
        ProfileDetailReducer()
    }
    
    ProfileDetailView(store: store)
}
