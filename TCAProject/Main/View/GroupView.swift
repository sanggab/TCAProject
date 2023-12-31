//
//  GroupView.swift
//  TCAProject
//
//  Created by Gab on 2023/11/14.
//

import SwiftUI

struct HeaderView: View {
    var headerText: String
    
    var body: some View {
        Text(headerText)
    }
}

struct GroupView: View {
    let contents = ["안아줘요", "안아달라고", "안돼"]
    
    var body: some View {
        ScrollView {
            Image("안돼")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .cornerRadius(10)

            LazyVStack(pinnedViews: [.sectionHeaders]) {
                Group {
                    ForEach(contents, id: \.self) { name in
                        Section(header:
                                HeaderView(headerText: name)
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 50)
                            .background(Color.red)
                        ) {
                            Image(name)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(12)
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .clipped()
    }
}

struct GroupView_Previews: PreviewProvider {
    static var previews: some View {
        GroupView()
    }
}
