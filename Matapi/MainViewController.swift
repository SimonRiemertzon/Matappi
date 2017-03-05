import UIKit

class MainViewController: UIViewController {
    
    
    
    @IBOutlet weak var searchField: UITextField!
    @IBOutlet weak var resultView: UITextView!
    @IBOutlet weak var star: UIImageView!
    
    var queue = DispatchQueue.main
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MatAppi"
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.star.layer.removeAllAnimations()
        self.star.transform = CGAffineTransform.identity
        
        queue.async {
            self.animateStars()
        }
    }
    
    
    @IBAction func goToSearchFood(_ sender: Any) {
        performSegue(withIdentifier: "goToSearchForFoodSegue", sender: self)
    }
    
    func animateStars() {
        
        UIView.animate(withDuration: 1,
                       delay: 0,
                       options:[.autoreverse, .repeat],
                       animations : {
                        self.star.transform = CGAffineTransform(scaleX: 2.5, y: 2.5)})
        { finished in
            UIView.animate(withDuration: 1.0,
                           delay: 0,
                           options: [.curveEaseOut, .beginFromCurrentState],
                           animations: {
                            self.star.transform = CGAffineTransform.identity
            },
                           completion: nil
                
            )
            NSLog("Star animation done. Finished = \(finished)")
        }
        UIView.animate(withDuration: 1, delay: 0, options: [.autoreverse, .repeat], animations: { self.star.transform = CGAffineTransform(scaleX: 2.5, y: 2.5) })
    }
    
    
}




