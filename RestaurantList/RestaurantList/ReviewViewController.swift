import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet weak var backgroundImageView:UIImageView!

    @IBOutlet weak var dialogView: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    let blurEffect = UIBlurEffect(style:UIBlurEffect.Style.dark)
    let blurEffectView = UIVisualEffectView(effect: blurEffect)
    blurEffectView.frame = view.bounds
    backgroundImageView.addSubview(blurEffectView)

    let scale = CGAffineTransform(scaleX: 0, y: 0)
    let translate = CGAffineTransform(translationX: 0, y: 500)
     dialogView.transform = scale.concatenating(translate)
    }
    
    override func viewDidAppear(_ animated:Bool){
    
    UIView.animate(withDuration: 0.7, animations: {
self.dialogView.transform = CGAffineTransform(scaleX: 1, y: 1)
        }, completion: nil)
        
        UIView.animate(withDuration: 0.7, delay: 0.0, usingSpringWithDamping: 0.1, initialSpringVelocity: 0.1, options: [], animations: {
            self.dialogView.transform = CGAffineTransform(translationX: 0,y: 0)
        }, completion: nil)
    }
}

