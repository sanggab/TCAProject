//
//  ProfileModel.swift
//  Profile
//
//  Created by Gab on 4/4/25.
//

import Foundation

public struct ProfileModel: Identifiable, Hashable {
    public typealias ID = String
    
    public static let `default`: ProfileModel = .init(imgUrl: "",
                                                      name: "",
                                                      age: 0)
    
    public var id: String
    
    public var imgUrl: String
    public var name: String
    public var age: Int
    
    public init(id: String = UUID().uuidString, imgUrl: String, name: String, age: Int) {
        self.id = id
        self.imgUrl = imgUrl
        self.name = name
        self.age = age
    }
    
    public static func makingRandomModel() -> ProfileModel {
        let randomimgUrl: String = [
            "https://upload3.inven.co.kr/upload/2023/06/17/bbs/i16438201620.webp?MW=800",
            "https://upload3.inven.co.kr/upload/2023/06/17/bbs/i16443935512.webp?MW=800",
            "https://upload3.inven.co.kr/upload/2023/06/17/bbs/i16428548648.jpg?MW=800",
            "https://upload3.inven.co.kr/upload/2022/01/11/bbs/i15279899653.jpg",
            "https://upload3.inven.co.kr/upload/2023/03/15/bbs/i13997137741.png",
            "https://upload3.inven.co.kr/upload/2023/07/27/bbs/i16289326228.png",
            "https://upload3.inven.co.kr/upload/2022/06/24/bbs/i15932468172.png",
            "https://upload3.inven.co.kr/upload/2022/06/24/bbs/i14961245704.png",
            "https://blog.kakaocdn.net/dn/AleGh/btrocCoX2Fn/uxErAXYJkLBgAvFU6VupP1/img.jpg",
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ8MjhlhQpYl6CsLp6digq_6N0qpNogxYDPjEcudXl6U2xDNXy4ift6YCN-CluMvOwpTEw&usqp=CAU"
        ].randomElement() ?? "https://upload3.inven.co.kr/upload/2022/03/04/bbs/i16283854196.png"
        
        let randomName: String = [
            "주훈",
            "은진",
            "수빈",
            "병은",
            "진우",
            "기은",
            "근영",
            "연학",
            "상갑"
        ].randomElement() ?? "꽝"
        
        let randomAge: Int = (1...100).randomElement() ?? -99
        
        let randomProfileModel: ProfileModel = .init(imgUrl: randomimgUrl, name: randomName, age: randomAge)
        
        return randomProfileModel
    }
}

