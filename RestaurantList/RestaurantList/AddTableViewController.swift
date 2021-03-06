import UIKit

class AddTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.allowsEditing = false
            imagePicker.sourceType = .photoLibrary
            
        self.present(imagePicker, animated: true, completion: nil)
          }
         }
    }
    
}
