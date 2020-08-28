//
//  CircleImageView.swift
//  TodoAPP
//
//  Created by aluno on 12/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit

final class CircleImageView : UIImageView {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.cornerRadius = frame.size.height / 2
    }
}
