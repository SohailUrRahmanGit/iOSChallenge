//
//  AboutPlacesViewController.swift
//  AboutPlaces
//
//  Created by sohail ur rahman on 16/10/19.
//  Copyright © 2019 sohail ur rahman. All rights reserved.
//

import UIKit

class AboutPlacesViewController: UIViewController,NetworkServiceDelegate {
   
    let aboutPlacesTableView = UITableView()
    let network = NetworkService()
    var factsObject : [Facts]?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(aboutPlacesTableView)
        setupTableViewContraints()
        aboutPlacesTableView.dataSource = self
        aboutPlacesTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: "FactsCell")
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
    print(result)
    factsObject = result as? [Facts]
         DispatchQueue.main.async {
//             self.aboutPlacesTableView.reloadData()
         }
}
    
}

extension AboutPlacesViewController:UITableViewDelegate,UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsObject?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FactsCell", for: indexPath) as! FactsTableViewCell
        return cell
    }
    
}
