/// Created by Matthew Lui on 16/2/2018.
/// Copyright (c) 2018 Chatboy.xyz. All rights reserved.


import Foundation

enum ResponseError: Int {
    case badRequest = 400
    case forbidden = 403
    case notFound = 404
    case methodNotAllowed = 405
    case conflict = 409
    case preconditionFailed = 412
    case unprocessableEntity = 422
}

struct Project: Param {

    static let name = "project"
    var value: String = ""

    func assembly() -> String {
        return "\(Project.name)=\(value)"
    }

    static let myProject = Project(value: "MyProject")
    static let allProject = Project(value: "AllProject")

}
