//
//  ViewExtension.swift
//  TCAProject
//
//  Created by Gab on 2023/11/16.
//

import SwiftUI

extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
