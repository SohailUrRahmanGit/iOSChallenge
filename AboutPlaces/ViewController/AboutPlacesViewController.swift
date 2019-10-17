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
    let activityIndicator:UIActivityIndicatorView = UIActivityIndicatorView();

    lazy var refreshControl: UIRefreshControl = {
        let refreshControl = UIRefreshControl()
      refreshControl.addTarget(self, action:
        #selector(self.handleRefresh(_:)),
                               for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.red
        
        return refreshControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        view.addSubview(aboutPlacesTableView)
        self.aboutPlacesTableView.addSubview(self.refreshControl)
        setupTableViewContraints()
        aboutPlacesTableView.dataSource = self
        aboutPlacesTableView.register(FactsTableViewCell.self, forCellReuseIdentifier: FACT_CELL_ID)
        network.delegate = self
        callFactsService()
    }

    /**
    Call this function to call the Rest API.
    */
    func callFactsService()
    {
        network.getFactsApiCall(urlString: FACTS_URL)
        startLoading()
    }
    
    /**
      It handles refresher controls.
       */
    @objc func handleRefresh(_ refreshControl: UIRefreshControl) {
     callFactsService()
     refreshControl.endRefreshing()
    }
    
    /**
    Constrains set for table view
     */
 func setupTableViewContraints()
 {
    aboutPlacesTableView.translatesAutoresizingMaskIntoConstraints = false
    aboutPlacesTableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor).isActive = true
    aboutPlacesTableView.leftAnchor.constraint(equalTo:view.safeAreaLayoutGuide.leftAnchor).isActive = true
    aboutPlacesTableView.rightAnchor.constraint(equalTo:view.safeAreaLayoutGuide.rightAnchor).isActive = true
    aboutPlacesTableView.bottomAnchor.constraint(equalTo:view.safeAreaLayoutGuide.bottomAnchor).isActive = true
 }
    
    /**
    Activity indication will start loading
     */
 func startLoading(){
     activityIndicator.center = self.view.center;
     activityIndicator.hidesWhenStopped = true;
     activityIndicator.style = UIActivityIndicatorView.Style.medium
     view.addSubview(activityIndicator);
     activityIndicator.startAnimating();

 }

    /**
       Activity indication will stop loading
       */
 func stopLoading(){
     activityIndicator.stopAnimating();
 }
    
    
    /**
    Delegat method called from Network service upon successful Call
    */
func didCompleteRequest(result: AnyObject)
{
        factsObject = result as? Facts
         DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.stopLoading()
             self.navigationItem.title = self.factsObject!.title
             self.aboutPlacesTableView.reloadData()
         }
}
    
}

/**
Extensions for TableView Delegate
 */
extension AboutPlacesViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return factsObject?.rows?.count ?? 0
    }
 
}
  
    /**
    Extensions for TableView Datasource
     */
extension AboutPlacesViewController:UITableViewDataSource
    {
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let cell = tableView.dequeueReusableCell(withIdentifier: FACT_CELL_ID , for: indexPath) as! FactsTableViewCell
         
            if let title = factsObject?.rows![indexPath.row].title {
                cell.factTitleLabel.text = title
            }else {
                cell.factTitleLabel.text = TITLE_NOT_AVAILABLE

            }
            
            
            if let description = factsObject?.rows![indexPath.row].description {
                cell.factsDescriptionLabel.text = description
            }else {
                cell.factsDescriptionLabel.text = DESCRIPTION_NOT_AVAILABLE

            }
            
            if let imageURLString = factsObject?.rows![indexPath.row].imageHref {
                cell.factsImageView.sd_setImage(with: URL(string: imageURLString), placeholderImage: UIImage(named: "artificial-intelligence-1"))
            }else {
                cell.factsImageView.image = UIImage(named:"NoPicAvailable.png")
            }

            return cell
        }
    }
    

    

