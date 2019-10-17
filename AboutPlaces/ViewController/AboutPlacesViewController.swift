//
//  AboutPlacesViewController.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import UIKit
import SDWebImage

class AboutPlacesViewController: UIViewController,NetworkServiceDelegate {
   
    let aboutPlacesTableView = UITableView()
    let network = NetworkService()
    var factsObject : Facts?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(aboutPlacesTableView)
        setupTableViewContraints()
        aboutPlacesTableView.dataSource = self
        aboutPlacesTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: FACT_CELL_ID)
        navigationItem.title = "About Canada"
        network.delegate = self
        network.getFactsApiCall(urlString: FACTS_URL)
        // Do any additional setup after loading the view.
    }

 func setupTableViewContraints()
 {
    aboutPlacesTableView.translatesAutoresizingMaskIntoConstraints = false
    aboutPlacesTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
    aboutPlacesTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    aboutPlacesTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    aboutPlacesTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
 }
 
func didCompleteRequest(result: AnyObject)
{
    factsObject = result as? Facts
    if let count = factsObject!.rows?.count{
     print("the count is ")
     print(count)
    }
         DispatchQueue.main.async {
             self.aboutPlacesTableView.reloadData()
         }
}
    
}

extension AboutPlacesViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsObject?.rows?.count ?? 0
    }
 
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        let heightValue = 0.0
//        let cell = tableView.dequeueReusableCell(withIdentifier: FACT_CELL_ID , for: indexPath) as! FactsTableViewCell
//        let text = cell.factsDescriptionLabel.text
//        heightValue = text.size
//    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FACT_CELL_ID , for: indexPath) as! FactsTableViewCell
        cell.factTitleLabel.text = factsObject?.rows![indexPath.row].title
        cell.factsDescriptionLabel.text = factsObject?.rows![indexPath.row].description
     
        //  cell.factsImageView.sd_setImage(with: URL(string: imageUrl), placeholderImage: UIImage(named: "artificial-intelligence-1"))
        return cell
    }
    
    
    
}
