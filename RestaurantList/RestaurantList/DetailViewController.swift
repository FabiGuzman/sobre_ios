import UIKit

class DetailViewController: UIViewController {

@IBOutlet weak var restaurantImageView: UIImageView!
    var restaurantImage:String!
    
    @IBAction func close(segue:UIStoryboardSegue){
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    self.restaurantImageView.image = UIImage(named: restaurantImage)
    }
}

