//
//  AppReducer.swift
//  TCAProject
//
//  Created by Gab on 4/4/25.
//

import Foundation

import Profile

import ProfileEditFeature
import ProfileDetailFeature

import ComposableArchitecture

@Reducer
struct AppReducer {
    @ObservableState
    struct State {
        var path = StackState<CoordinatorReducer.State>()
        var detailState: ProfileDetailReducer.State?
        var editState: ProfileEditReducer.State?
    }
    
    enum Action {
        case path(StackActionOf<CoordinatorReducer>)
        case moveProfileDeatil
        case moveProfileEdit(ProfileModel)
        case detailAction(ProfileDetailReducer.Action)
        case editAction(ProfileEditReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveProfileDeatil:
//                state.path.append(.makeProfileDetail(state.detailState))
                return .none
            case .moveProfileEdit(let model):
//                state.path.append(.makeProfileEdit(.init(profile: model)))
                return .none
                
            case .path(.element(id: _, action: .profileEdit(.deliverProfile(let model)))):
                print("상갑 logEvent \(#function) AppReducer deliverProfile: \(model)")
//                state.detailState.profile = model
                return .none
                
            case .path(.element(id: _, action: .profileDetail(.openProfileEdit(let model)))):
                print("상갑 logEvent \(#function) openProfileEdit model: \(model)")
                return .send(.moveProfileEdit(model))
                
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path) {
            CoordinatorReducer()
        }
    }
}


