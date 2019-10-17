//
//  FactsTableViewCell.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import UIKit

class FactsTableViewCell: UITableViewCell {


    
    let factsImageView : UIImageView = {
    let image = UIImage(named: "artificial-intelligence-1")
    let imgView = UIImageView(image: image!)
    imgView.contentMode = .scaleAspectFit
    imgView.clipsToBounds = true
    return imgView
    }()
    
    let factTitleLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
    lbl.text = "Space Program is good"
    lbl.font = UIFont.boldSystemFont(ofSize: 20)
    lbl.textAlignment = .left
    return lbl
    }()
    
    
    let factsDescriptionLabel : UILabel = {
    let lbl = UILabel()
    lbl.textColor = .black
        lbl.text = "Space Program is good"

    lbl.font = UIFont.systemFont(ofSize: 16)
    lbl.textAlignment = .left
    lbl.numberOfLines = 0
    return lbl
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
       
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(factTitleLabel)
        addSubview(factsImageView)
        addSubview(factsDescriptionLabel)
        
        addContraintsToElementFactImageView()
        addContraintsToElementFactTitleLabel()
        addContraintsToElementFactDescriptionLabel()
    }
    
    func addContraintsToElementFactImageView()
    {
       factsImageView.translatesAutoresizingMaskIntoConstraints = false

        let leadConstraints =  NSLayoutConstraint(item: factsImageView,
                    attribute: .leading,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .leading,
                    multiplier: 1,
                    constant: 15)
        
        let height =  NSLayoutConstraint(item: factsImageView,
              attribute: .height,
              relatedBy: .equal,
              toItem: nil,
              attribute: .height,
              multiplier: 1,
              constant: 85)

        let width =  NSLayoutConstraint(item: factsImageView,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 85)

 

        let horizontal =  NSLayoutConstraint(item: factsImageView,
                    attribute: .centerY,
                    relatedBy: .equal,
                    toItem: self,
                    attribute: .centerY,
                    multiplier: 1,
                    constant: 0)
   

         self.addConstraints([leadConstraints])
         self.addConstraints([height])
         self.addConstraints([width])
         self.addConstraints([horizontal])
        
    }
    
    func addContraintsToElementFactTitleLabel()
    {
        factTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        let topConstraints =  NSLayoutConstraint(item: factTitleLabel,
              attribute: .left,
              relatedBy: .equal,
              toItem: factsImageView,
              attribute: .right,
              multiplier: 1,
              constant: 10)
        
        let leadConstraints =  NSLayoutConstraint(item: factTitleLabel,
              attribute: .top,
              relatedBy: .equal,
              toItem: self,
              attribute: .top,
              multiplier: 1,
              constant: 0)
        
        let height =  NSLayoutConstraint(item: factTitleLabel,
              attribute: .height,
              relatedBy: .equal,
              toItem: nil,
              attribute: .notAnAttribute,
              multiplier: 1,
              constant: 30)

        let width =  NSLayoutConstraint(item: factTitleLabel,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 250)

        
        self.addConstraints([topConstraints])
        self.addConstraints([leadConstraints])
        self.addConstraints([height])
        self.addConstraints([width])

    }
    
    func addContraintsToElementFactDescriptionLabel()
    {
    
        factsDescriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        let top = NSLayoutConstraint(item: factsDescriptionLabel,
        attribute: .top,
        relatedBy: .equal,
        toItem: factTitleLabel,
        attribute: .bottom,
        multiplier: 1,
        constant: 10)
        
          let lead = NSLayoutConstraint(item: factsDescriptionLabel, attribute: .left, relatedBy: .equal, toItem: factsImageView, attribute: .right, multiplier: 1, constant: 10)

          let width = NSLayoutConstraint(item: factsDescriptionLabel, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200)

       factsDescriptionLabel.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true

        self.addConstraints([top])
        self.addConstraints([lead])
        self.addConstraints([width])
    }
    
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    required init?(coder aDecoder: NSCoder)
    {
        fatalError("init(coder:) has not been implemented")
    
    }

    
}
