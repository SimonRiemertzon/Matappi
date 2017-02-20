import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func goToSearchFood(_ sender: Any) {
        performSegue(withIdentifier: "goToSearchForFoodSegue", sender: self)
    }



}

