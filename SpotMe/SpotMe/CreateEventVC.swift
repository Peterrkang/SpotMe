//
//  CreateEventVC.swift
//  SpotMe
//
//  Created by Peter Kang on 11/3/16.
//  Copyright © 2016 Peter Kang. All rights reserved.
//

import UIKit
import GooglePlaces
import GoogleMaps



class CreateEventVC: UIViewController, UITextFieldDelegate, GMSAutocompleteTableDataSourceDelegate{


    var resultsController: UITableViewController!
    var tableDataSource: GMSAutocompleteTableDataSource!

    var contentRect = CGRect.zero
    
    @IBOutlet weak var searchField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        self.searchField.delegate = self
        
        self.tableDataSource = GMSAutocompleteTableDataSource()
        self.tableDataSource.delegate = self
        self.resultsController = UITableViewController(style: .plain)
        self.resultsController.tableView.delegate = tableDataSource
        self.resultsController.tableView.dataSource = tableDataSource

        
        // Do any additional setup after loading the view.
    }
    

    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
        searchField.resignFirstResponder()
        let text = NSMutableAttributedString(string: place.description)
        text.append(NSAttributedString(string: "\n\n"))
        text.append(place.attributions!)
        
        self.searchField.text = "\(text)"
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
        searchField.resignFirstResponder()
        self.searchField.text = ""
    }
    
    
    func didUpdateAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        resultsController.tableView.reloadData()
    }
    
    func didRequestAutocompletePredictions(for tableDataSource: GMSAutocompleteTableDataSource) {
        resultsController.tableView.reloadData()
    }
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.addChildViewController(resultsController)
        self.resultsController.view.frame = contentRect
        self.resultsController.view.alpha = 0.0
        self.view.addSubview(resultsController.view)
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.resultsController.view.alpha = 1.0
        })
        resultsController.didMove(toParentViewController: self)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        resultsController.willMove(toParentViewController: nil)
        UIView.animate(withDuration: 0.5, animations: {() -> Void in
            self.resultsController.view.alpha = 0.0
            }, completion: {(_ finished: Bool) -> Void in
                self.resultsController.view.removeFromSuperview()
        })
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }

    
    func textFieldDidChange(_ textField: UITextField) {
        tableDataSource.sourceTextHasChanged(textField.text)
    }
    
    
}
