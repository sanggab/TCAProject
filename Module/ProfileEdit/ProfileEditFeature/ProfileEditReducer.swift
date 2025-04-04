//
//  ProfileEditReducer.swift
//  ProfileEditFeature
//
//  Created by Gab on 4/4/25.
//

import Foundation

import Profile

import ComposableArchitecture

@Reducer
public struct ProfileEditReducer {
    @ObservableState
    public struct State: Equatable {
        public var profile: ProfileModel
        
        public init(profile: ProfileModel) {
            self.profile = profile
        }
    }
    
    public enum Action {
        case onAppear(ProfileModel)
        case editProfile(ProfileModel)
        case deliverProfile(ProfileModel)
    }
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear(let model):
                state.profile = model
                return .none
            case .editProfile(let model):
                state.profile = model
                return .none
            case .deliverProfile(let model):
                print("상갑 logEvent \(#function) deliverProfile")
                return .none
            }
        }
    }
}
