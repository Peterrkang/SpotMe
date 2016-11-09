
import GoogleMaps
import GooglePlaces


class SDKDemoAutocompleteWithTextFieldController: UIViewController, UITextFieldDelegate, GMSAutocompleteTableDataSourceDelegate {
    var searchField: UITextField!
    var resultsController: UITableViewController!
    var tableDataSource: GMSAutocompleteTableDataSource!
    var resultView: UITextView!
    var contentRect = CGRect.zero
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor! = UIColor.white
        let kTextFieldHeight: CGFloat = 44.0
        let kTextFieldInset: CGFloat = 5.0
        self.contentRect = CGRect(x: 0, y: kTextFieldHeight, width: self.view.bounds.size.width, height: self.view.bounds.size.height - kTextFieldHeight)
        self.searchField = UITextField(frame: CGRect(x: kTextFieldInset, y: kTextFieldInset, width: self.view.bounds.size.width - (kTextFieldInset * 2), height: kTextFieldHeight - (kTextFieldInset * 2)))
        self.searchField.autoresizingMask = .flexibleWidth
        self.searchField.borderStyle = .none
        self.searchField.backgroundColor = UIColor.white
        self.searchField.placeholder = "Address..."
        self.searchField.autocorrectionType = .no
        self.searchField.keyboardType = .default
        //self.searchField.returnKeyType; UIReturnKeyDone
        self.searchField.clearButtonMode = .whileEditing
        self.searchField.contentVerticalAlignment = .center
        searchField.addTarget(self, action: #selector(self.textFieldDidChange), for: .editingChanged)
        self.searchField.delegate = self
        self.resultView = UITextView(frame: contentRect)
        self.resultView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.resultView.isEditable = false
        self.resultView.text = "Waiting..."
        self.resultView.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        self.tableDataSource = GMSAutocompleteTableDataSource()
        self.tableDataSource.delegate = self
        self.resultsController = UITableViewController(style: .plain)
        self.resultsController.tableView.delegate = tableDataSource
        self.resultsController.tableView.dataSource = tableDataSource
        self.view.addSubview(searchField)
        self.view.addSubview(resultView)
    }


    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didAutocompleteWith place: GMSPlace) {
        searchField.resignFirstResponder()
        let text = NSMutableAttributedString(string: place.description)
        text.append(NSAttributedString(string: "\n\n"))
        text.append(place.attributions!)
        self.resultView.attributedText = text
        self.searchField.text = place.name
    }
    
    func tableDataSource(_ tableDataSource: GMSAutocompleteTableDataSource, didFailAutocompleteWithError error: Error) {
        searchField.resignFirstResponder()
        self.resultView.text = "Autocomplete failed with error: \(error.localizedDescription)"
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
    // MARK: - Private Methods
    
    func textFieldDidChange(_ textField: UITextField) {
        tableDataSource.sourceTextHasChanged(textField.text)
    }


}
