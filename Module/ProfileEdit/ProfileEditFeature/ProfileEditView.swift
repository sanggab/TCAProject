//
//  ProfileEditView.swift
//  ProfileEditFeature
//
//  Created by Gab on 4/4/25.
//

import SwiftUI

import Profile

import Kingfisher
import ComposableArchitecture

public struct ProfileEditView: View {
    private let store: StoreOf<ProfileEditReducer>
    
    public init(store: StoreOf<ProfileEditReducer>) {
        self.store = store
    }
    
    public var body: some View {
        let _ = Self._printChanges()
        WithPerceptionTracking {
            Text("ProfileEditView")
                .font(.title)
                .foregroundStyle(.black)
            
            KFImage(URL(string: store.profile.imgUrl))
                .resizable()
                .frame(width: 300, height: 300)
            
            Text(store.profile.name)
            
            Text(String(store.profile.age))
            
            Button {
                let randomProfileModel: ProfileModel = .makingRandomModel()
                
                self.store.send(.editProfile(randomProfileModel))
                
            } label: {
                Text("프로필 랜덤 수정 버튼")
            }

            Button {
                self.store.send(.deliverProfile(self.store.profile))
            } label: {
                Text("프로필 전달 하기")
            }

        }
    }
}

#Preview {
    let store: StoreOf<ProfileEditReducer> = .init(initialState: ProfileEditReducer.State(profile: .init(imgUrl: "https://upload3.inven.co.kr/upload/2023/06/17/bbs/i13155390803.webp?MW=360", name: "심상갑", age: 30))) {
        ProfileEditReducer()
    }
    ProfileEditView(store: store)
}
