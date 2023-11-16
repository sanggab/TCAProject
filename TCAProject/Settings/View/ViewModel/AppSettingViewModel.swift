//
//  AppSettingViewModel.swift
//  TCAProject
//
//  Created by Gab on 2023/11/16.
//

import SwiftUI

public protocol AppSettingInput {
    func setOffset(offset: CGFloat)
}

public protocol DefaultAppSettingViewModel: AppSettingInput {
//    associatedtype ViewModel: DefaultAppSettingViewModel
    
    var offset: CGFloat { get }
    
}

public final class AppSettingViewModel: ObservableObject {
    @Published public private(set) var offset: CGFloat = 0.0
    
    public init() {}
    
    public func setOffset(offset: CGFloat) {
        self.offset = offset
    }

}
