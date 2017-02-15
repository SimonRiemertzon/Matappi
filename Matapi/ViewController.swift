import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


    @IBAction func onButton(_ sender: UIButton) {
        smallLabel.text = input.text
    }

    @IBOutlet weak var smallLabel: UILabel!
    @IBOutlet weak var input: UITextField!
    
}

