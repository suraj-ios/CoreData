//
//  CoreDataTableViewCell.swift
//  CoreDataDemo
//
//  Created by Suraj on 11/11/23.
//

import UIKit
protocol CoreDataTableViewCellDelegate: AnyObject{
    func deleteToDoItem(indexNumber:Int)
}

class CoreDataTableViewCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var deleteButton: UIButton!

    weak var delegate:CoreDataTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func deleteToDoListAction(_ sender: UIButton) {
        self.delegate?.deleteToDoItem(indexNumber: sender.tag)
    }
    
}
