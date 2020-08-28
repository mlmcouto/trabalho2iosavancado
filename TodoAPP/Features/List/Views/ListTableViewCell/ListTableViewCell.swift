//
//  ListTableViewCell.swift
//  TodoAPP
//
//  Created by aluno on 10/08/20.
//  Copyright © 2020 CESAR School. All rights reserved.
//

import UIKit




final class ListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lineView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var todoLabel: UILabel!
    @IBOutlet weak var createdAtLabel: UILabel!
    
}

extension ListTableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configure (with model: TodoModel){
        lineView.backgroundColor = model.type.typeColor
        titleLabel.text = model.type.typeDescription
        titleLabel.textColor = model.type.typeColor
        todoLabel.text = model.todoDescription
        createdAtLabel.text = formatData(model.date)
    }
    
    private func formatData (_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm a"
        return "at \(String(formatter.string(from: date)))"
    }
}
