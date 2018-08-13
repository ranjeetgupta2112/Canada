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
        
        //self.contentView.layer.cornerRadius = contentView.bounds.size.width / 30
        // creating the title label programatically and adding to conatiner view
        labelTitle.font = UIFont(name: "Arial-BoldMT", size: 17)
        labelTitle.tag = 1
        labelTitle.textColor = UIColor.white
        labelTitle.backgroundColor = UIColor.black
        labelTitle.numberOfLines = 0
        labelTitle.translatesAutoresizingMaskIntoConstraints = false;
        labelTitle.preferredMaxLayoutWidth = self.frame.size.width;// assumes the parent view has its frame already set.
        labelTitle.text = "No title available"
        labelTitle.sizeToFit()
        labelTitle.setNeedsDisplay()
        self.contentView.addSubview(labelTitle)
        
        // creating the title label programatically and adding to conatiner view
        labelDescription.font = UIFont(name: "Arial", size: 15)
        labelDescription.tag = 1
        labelDescription.textColor = UIColor.darkText
        labelDescription.numberOfLines = 0
        labelDescription.translatesAutoresizingMaskIntoConstraints = false;
        labelDescription.preferredMaxLayoutWidth = self.frame.size.width;// assumes the parent view has its frame already set.
        labelTitle.text = "No description available"
        labelDescription.sizeToFit()
        labelDescription.setNeedsDisplay()
        self.contentView.addSubview(labelDescription)
        
        // creating the UIImage programatically and adding to conatiner view
        imageFact.translatesAutoresizingMaskIntoConstraints = false
        imageFact.backgroundColor = UIColor.darkGray;
        self.contentView.addSubview(imageFact)
        
        //setting up layout constrains to fit the title, description and image into the cell
        let left : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelTitle, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 5)
        let top : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelTitle, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.top, multiplier: 1, constant: 5)
        let right : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelTitle, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: 5)
        self.contentView.addConstraints([top, left,right])
        
        let topDescription : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelDescription, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.labelTitle, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 5)
        let leftDescription : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelDescription, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let rightDescription : NSLayoutConstraint = NSLayoutConstraint.init(item: self.labelDescription, attribute: NSLayoutAttribute.trailing, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.trailing, multiplier: 1, constant: -10)
        self.contentView.addConstraints([topDescription, leftDescription,rightDescription])
        
        let topImage : NSLayoutConstraint = NSLayoutConstraint.init(item: self.imageFact, attribute: NSLayoutAttribute.top, relatedBy: NSLayoutRelation.equal, toItem: self.labelDescription, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: 5)
        let leftImage : NSLayoutConstraint = NSLayoutConstraint.init(item: self.imageFact, attribute: NSLayoutAttribute.left, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.left, multiplier: 1, constant: 10)
        let heightImage : NSLayoutConstraint = NSLayoutConstraint.init(item: self.imageFact, attribute: NSLayoutAttribute.height, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100)
        let widthImage : NSLayoutConstraint = NSLayoutConstraint.init(item: self.imageFact, attribute: NSLayoutAttribute.width, relatedBy: NSLayoutRelation.equal, toItem: nil, attribute: NSLayoutAttribute.notAnAttribute, multiplier: 1, constant: 100)
        let bottomImage : NSLayoutConstraint = NSLayoutConstraint.init(item: self.imageFact, attribute: NSLayoutAttribute.bottom, relatedBy: NSLayoutRelation.equal, toItem: self.contentView, attribute: NSLayoutAttribute.bottom, multiplier: 1, constant: -10)
        NSLayoutConstraint.activate([topImage, leftImage, heightImage,widthImage,bottomImage])
        self.contentView.addConstraints([topImage, leftImage, heightImage,widthImage,bottomImage])

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
