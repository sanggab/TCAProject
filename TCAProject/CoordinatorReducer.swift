//
//  CoordinatorReducer.swift
//  TCAProject
//
//  Created by Gab on 4/4/25.
//

import Foundation

import ProfileEditFeature
import ProfileDetailFeature

import ComposableArchitecture

@Reducer
struct CoordinatorReducer {
    @ObservableState
    enum State {
        case makeProfileDetail(ProfileDetailReducer.State)
        case makeProfileEdit(ProfileEditReducer.State)
    }
    
    enum Action {
        case profileDetail(ProfileDetailReducer.Action)
        case profileEdit(ProfileEditReducer.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: \.makeProfileDetail, action: \.profileDetail) {
            ProfileDetailReducer()
        }
        
        Scope(state: \.makeProfileEdit, action: \.profileEdit) {
            ProfileEditReducer()
        }
    }
}
