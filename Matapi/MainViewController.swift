import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultView: UITextView!
    @IBOutlet weak var star: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MatAppi"
        
        animateStars()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    @IBAction func goToSearchFood(_ sender: Any) {
        performSegue(withIdentifier: "goToSearchForFoodSegue", sender: self)
    }
    
    func animateStars() {
        UIView.animate(withDuration: 0.5, animations: {
            self.star.transform = CGAffineTransform(scaleX: 1.5, y: 1.5)
        }) { finished in
            NSLog("Star animation done. Finishd = \(finished)")
            self.star.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
    }

}




