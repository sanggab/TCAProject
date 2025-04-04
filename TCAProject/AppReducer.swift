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
        var path = StackState<Path.State>()
        var detailState: ProfileDetailReducer.State?
        var editState: ProfileEditReducer.State?
    }
    
    enum Action {
        case path(StackActionOf<Path>)
        case moveProfileDeatil
        case moveProfileEdit(ProfileModel)
        case detailAction(ProfileDetailReducer.Action)
        case editAction(ProfileEditReducer.Action)
    }
    
    @Reducer(state: .equatable)
    enum Path {
        case profileDetail(ProfileDetailReducer)
        case profileEdit(ProfileEditReducer)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .moveProfileDeatil:
                state.path.append(.profileDetail(.init()))
                return .none
            case .moveProfileEdit(let model):
                
                state.path.append(.profileEdit(.init(profile: model)))
                return .none
                
            case .path(.element(id: _, action: .profileEdit(.deliverProfile(let model)))):
                print("상갑 logEvent \(#function) AppReducer deliverProfile: \(model)")
                
                return .none
                
            case .path(.element(id: _, action: .profileDetail(.openProfileEdit(let model)))):
                print("상갑 logEvent \(#function) openProfileEdit model: \(model)")
                return .send(.moveProfileEdit(model))
            case .path(.popFrom(id: _)):
                return .none
                
            case .editAction(.deliverProfile(let model)):
                print("상갑 logEvent \(#function) editAction model: \(model)")
                return .send(.detailAction(.updateProfile(model)))
                
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
//        .ifLet(\.detailState, action: \.detailAction) {
//            ProfileDetailReducer()
//        }
//        .ifLet(\.editState, action: \.editAction) {
//            ProfileEditReducer()
//        }
    }
}


