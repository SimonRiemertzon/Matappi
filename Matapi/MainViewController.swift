import UIKit
var latestSearchResult: [[String:Any]] = []
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
    
    
    @IBAction func search(_ sender: Any) {
        //"force unwrap"? ska vara okej ibland
        
        
        let urlString = "http://www.matapi.se/foodstuff?query=\(searchField.text!)"
        
            if let safeUrlString = urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed), let url = URL(string: safeUrlString) {
                
                let request = URLRequest(url: url)
                let task = URLSession.shared.dataTask(with: request) { (maybeData: Data?,response: URLResponse?,error: Error?) in
                    
                    if let actualData = maybeData {
                        let jsonOptions = JSONSerialization.ReadingOptions()
                        
                        do {
                            if let parsed = try JSONSerialization.jsonObject(with: actualData, options: jsonOptions) as? [[String:Any]] {
                                latestSearchResult = parsed
                                NSLog("Parsed")
                            } else {
                                NSLog("Failed to cast to json")
                            }
                        }
                        catch let parseError {
                            NSLog("Failed to parse json: \(parseError)")
                        }
                    } else {
                        NSLog("No data received")
                    }
                }
                task.resume()
                
                
            } else {
                NSLog("Failed to create URL")
        }
        
            
    }
    }




