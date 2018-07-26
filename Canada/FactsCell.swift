//
//  FactsCell.swift
//  Canada
//
//  Created by Sweet on 25/07/18.
//  Copyright © 2018 Sweet. All rights reserved.
//

import UIKit

class FactsCell: UITableViewCell {
    let labelTitle : UILabel! = UILabel()
    let labelDescription : UILabel! = UILabel()
    let imageFact : UIImageView! = UIImageView()


    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        //let labelTitle : UILabel = UILabel()
        // creating the title label programatically and adding to conatiner view
        labelTitle.font = UIFont(name: "Arial-BoldMT", size: 15)
        labelTitle.tag = 1
        labelTitle.textColor = UIColor.black
        labelTitle.numberOfLines = 0
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        labelTitle.preferredMaxLayoutWidth = self.frame.size.width;// assumes the parent view has its frame already set.
        labelTitle.sizeToFit()
        labelTitle.setNeedsDisplay()
        contentView.addSubview(labelTitle)
        
        //let labelDescription : UILabel = UILabel()
        // creating the title label programatically and adding to conatiner view
        labelDescription.font = UIFont(name: "Arial-BoldMT", size: 15)
        labelDescription.tag = 1
        labelDescription.textColor = UIColor.black
        labelDescription.numberOfLines = 0
        labelDescription.translatesAutoresizingMaskIntoConstraints = false;
        labelDescription.preferredMaxLayoutWidth = self.frame.size.width;// assumes the parent view has its frame already set.
        labelDescription.sizeToFit()
        labelDescription.setNeedsDisplay()
        contentView.addSubview(labelTitle)
        
        // creating the UIImage programatically and adding to conatiner view
        //let imageFact : UIImageView = UIImageView()
        imageFact.image = UIImage(named: "default.png")!
        imageFact.translatesAutoresizingMaskIntoConstraints = false
        imageFact.backgroundColor = UIColor.darkGray;
        contentView.addSubview(imageFact)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
