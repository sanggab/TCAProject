//
//  SearchBar.swift
//  TCAProject
//
//  Created by Gab on 2023/11/15.
//

import SwiftUI

public struct SearchBar: View {
    @Binding public private(set) var text: String
    @State public private(set) var showBtn: Bool = false
    @Binding public private(set) var toolBarHidden: Bool
    
    public var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.primary)
            
            TextField("검색", text: $text, onEditingChanged: { state in
                print("state -> \(state)")
                self.showBtn = state
                self.toolBarHidden = state
            })
                .foregroundColor(.primary)
                .background(Color.red)
            
            if showBtn {
                Button("취소") {
                    self.hideKeyboard()
                }
            }
        }
        .animation(.linear)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant("hoho"), toolBarHidden: .constant(false))
    }
}
