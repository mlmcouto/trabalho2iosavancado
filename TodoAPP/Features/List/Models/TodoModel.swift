//
//  ListTableViewCellmodel .swift
//  TodoAPP
//
//  Created by aluno on 19/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

struct TodoModel {
    
    let type: ModelType
    let todoDescription: String
    let date: Date
    
    enum ModelType {
        case onPriority, daily, home
        
        var typeDescription: String {
            switch self {
            case .onPriority:
                return "ON PRIORITY"
            case .daily:
                return "DAILY"
            case .home:
                return "HOME"
            }
        }
        
        var typeColor: UIColor {
            switch self {
            case .onPriority:
                return UIColor (named: "onpriority_Color")!
            case .daily:
                return UIColor (named: "daily_Color")!
            case .home:
                return UIColor (named: "home_Color")!
            }
        }
        
        static var AllTypes : [ModelType]{
            [.onPriority, .daily, .home]
        }
    }
    
}
