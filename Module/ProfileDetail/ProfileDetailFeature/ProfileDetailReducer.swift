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
    public struct State: Equatable {
        public var profile: ProfileModel = .makingRandomModel()
        
        public init() {
            
        }
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
                print("상갑 logEvent \(#function) updateProfile: \(model)")
                state.profile = model
                
                return .none
                
            case .openProfileEdit:
                print("상갑 logEvent \(#function) openProfileEdit")
                return .none
            }
        }
    }
}
