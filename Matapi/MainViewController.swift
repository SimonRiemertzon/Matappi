import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func goToSearchFood(_ sender: Any) {
        performSegue(withIdentifier: "goToSearchForFoodSegue", sender: self)
    }
    
    //func onData(data : [[String:Any]]) {
    
    //}
    
    @IBAction func search(_ sender: Any) {
        //"force unwrap"? ska vara okej ibland
        
       
        
        //getData(searchText: searchField.text, onData: onData)
        
        
        
    }
}




