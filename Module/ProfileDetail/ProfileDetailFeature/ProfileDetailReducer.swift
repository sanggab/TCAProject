//
//  ProfileDetailReducer.swift
//  ProfileDetailFeature
//
//  Created by Gab on 4/4/25.
//

import Foundation

import Profile

import ComposableArchitecture

@Reducer
public struct ProfileDetailReducer {
    @ObservableState
    public struct State {
        public init() { }
        public var profile: ProfileModel = .makingRandomModel()
    }
    
    public enum Action {
        case onAppear
        case updateProfile(ProfileModel)
        case openProfileEdit(ProfileModel)
    }
    
    public init() {
        
    }
    
    public var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .onAppear:
                
                let profileModel: ProfileModel = .makingRandomModel()
                state.profile = profileModel
                
                return .none
            case .updateProfile(let model):
                state.profile = model
                
                return .none
                
            case .openProfileEdit:
                print("상갑 logEvent \(#function) openProfileEdit")
                return .none
            }
        }
    }
}
