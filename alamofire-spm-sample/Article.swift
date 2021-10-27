//
//  Article.swift
//  alamofire-spm-sample
//
//  Created by yasudamasato on 2021/10/27.
//

import Foundation

struct Aricle: Codable {
    let title: String
    var user: User

    struct User: Codable {
        var name: String
    }
}
