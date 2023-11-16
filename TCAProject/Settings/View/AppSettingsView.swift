//
//  AppSettingsView.swift
//  TCAProject
//
//  Created by Gab on 2023/11/15.
//

import SwiftUI

struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
      static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
          value += nextValue()
      }
}

public struct AppSettingsView: View {
    @State public private(set) var searchText: String = ""
    @ObservedObject var viewModel = AppSettingViewModel()
    @State public private(set) var toolBarHidden: Bool = false
    
    public var body: some View {
        NavigationView {
            Group {
                GeometryReader { proxy in
                    let offsetY = proxy.frame(in: .global).origin.y
                    
                    Form {
                        HStack {
                            SearchBar(text: $searchText, toolBarHidden: $toolBarHidden)
                        }
                    }
                    
                    
                    
                    Color.clear.preference(key: ScrollOffsetKey.self, value: offsetY)
                        .onAppear {
                            print("onAppear -> \(offsetY)")
                            viewModel.setOffset(offset: offsetY)
                        }
                }
            }
            .navigationTitle("\(viewModel.offset)")
            .navigationBarHidden(toolBarHidden)
            .onPreferenceChange(ScrollOffsetKey.self) { offset in
                print("onPreferenceChange -> \(offset)")
                viewModel.setOffset(offset: offset)
            }
        }
        .onTapGesture {
            self.hideKeyboard()
        }
    }
}

struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
    }
}
