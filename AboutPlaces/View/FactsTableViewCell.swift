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
    }
    
    func addContraintsToElementFactImageView()
    {
        factsImageView.translatesAutoresizingMaskIntoConstraints = false
        factsImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        // width constraint
        factsImageView.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        //Bottom anchor for height
         factsImageView.bottomAnchor.constraint(equalTo:self.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func addContraintsToElementFactTitleLabel()
    {
        factTitleLabel.translatesAutoresizingMaskIntoConstraints = false
       
        let trailingConstraints =  NSLayoutConstraint(item: factTitleLabel,
        attribute: .leadingMargin,
        relatedBy: .equal,
        toItem: factsImageView,
        attribute: .trailingMargin,
        multiplier: 1,
        constant: 30)
        
        let topConstraints = NSLayoutConstraint(item: factTitleLabel,
        attribute: .top,
        relatedBy: .equal,
        toItem: factsImageView,
        attribute: .top,
        multiplier: 1,
        constant: 10)
        factsImageView.widthAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        factsImageView.heightAnchor.constraint(equalToConstant: CGFloat(100)).isActive = true
        
        self.addConstraints([trailingConstraints])
        self.addConstraints([topConstraints])
        
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
