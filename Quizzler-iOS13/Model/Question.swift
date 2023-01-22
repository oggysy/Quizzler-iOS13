//
//  Question.swift
//  Quizzler-iOS13
//
//  Created by 小木曽佑介 on 2023/01/22.
//  Copyright © 2023 The App Brewery. All rights reserved.
//

import Foundation

struct Question {
    let text: String
    let answer: String
    
    init(q: String, a: String) {
        text = q
        answer = a
    }
}
