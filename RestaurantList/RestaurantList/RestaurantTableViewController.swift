import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurants:[Restaurant] = [
Restaurant(name:"Cafe Deadend", type:"Coffe & Tea Shop", location: "Hong Kong", image: "cafedeadend.jpg", isVisited: false),
Restaurant(name:"Homei", type:"Cafe", location: "Hong Kong", image: "homei.jpg", isVisited: false),
Restaurant(name:"Teakha", type:"Tea House", location: "Hong Kong", image: "teakha.jpg", isVisited: false),
Restaurant(name:"Cafe loisl", type:"Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl.jpg", isVisited: false),
Restaurant(name:"Petyte Oister", type:"French", location: "Hong Kong", image: "petiteoyster.jpg", isVisited: false),
Restaurant(name:"For Kee Restaurant", type:"Bakery", location: "Hong Kong", image: "forkeerestaurant.jpg", isVisited: false),
Restaurant(name:"Po's Atelier", type:"Bakery", location: "Hong Kong", image: "posatelier.jpg", isVisited: false),
Restaurant(name:"Bourke Street Bakery", type:"Chocolate", location: "Sydney", image: "bourkestreetbakery.jpg", isVisited: false),
Restaurant(name:"Haigh's Chocolate", type:"Cafe", location: "Sydney", image: "haighschocolate.jpg", isVisited: false),
Restaurant(name:"Palomino Espresso", type:"American / Seafood", location: "Sydney", image: "palominoespresso.jpg", isVisited: false),
Restaurant(name:"Upstate", type:"American", location: "New York", image: "upstate.jpg", isVisited: false),
Restaurant(name:"Traif", type:"American", location: "New York", image: "traif.jpg", isVisited: false),
Restaurant(name:"Graham Avenue Meats", type:"Breakfast & Brunch", location: "New York", image: "grahamavenuemeats.jpg", isVisited: false),
Restaurant(name:"Waffle & Wolf", type:"Coffee & Tea", location: "New York", image: "wafflewolf.jpg", isVisited: false),
Restaurant(name:"Five Leaves", type:"Coffee & Tea", location: "New York", image: "fiveleaves.jpg", isVisited: false),
Restaurant(name:"Cafe Lore", type:"Latin American", location: "New York", image: "cafelore.jpg", isVisited: false),
Restaurant(name:"Confessional", type:"Spanish", location: "New York", image: "confessional.jpg", isVisited: false),
Restaurant(name:"Barrafina", type:"Spanish", location: "London", image: "barrafina.jpg", isVisited: false),
Restaurant(name:"Donostia", type:"Spanish", location: "London", image: "donostia.jpg", isVisited: false),
Restaurant(name:"Royal Oak", type:"British", location: "London", image: "royaloak.jpg", isVisited: false),
Restaurant(name:"Thai Cafe", type:"Thai", location: "London", image: "thaicafe.jpg", isVisited: false),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1    //para que retorne una sección
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurants.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        let restaurant = restaurants[indexPath.row]
        cell.nameLabel?.text = restaurant.name
        cell.thumbnailImageView?.image = UIImage(named: restaurant.image)
        cell.locationLabel.text = restaurant.location
        cell.typeLabel.text = restaurant.type
        cell.thumbnailImageView.layer.cornerRadius = cell.thumbnailImageView.frame.size.width/2
        cell.thumbnailImageView.clipsToBounds = true
        
        if restaurant.isVisited {
            cell.accessoryType = .checkmark
        }else{
            cell.accessoryType = .none
        }
        
        return cell
    }
    
/*    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let optionMenu = UIAlertController(title:nil,message: "What do you want to do?", preferredStyle: UIAlertController.Style.actionSheet)
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        self.present(optionMenu, animated: true, completion: nil)
        
        // Call action
        let callActionHandler = {(action: UIAlertAction!) -> Void in
            let alertMessage = UIAlertController(title: "Service unavailable", message: "Sorry, the call feature is not available yet.", preferredStyle: .alert)
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
        }
        
        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: UIAlertAction.Style.default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        let isVisitedAction = UIAlertAction(title: "I've been here", style: .default, handler: {
            (action:UIAlertAction!) -> Void in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = UITableViewCell.AccessoryType.checkmark
            self.restaurantIsVisited[indexPath.row] = true
        })
        
        optionMenu.addAction(isVisitedAction)
    }*/
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        
        if editingStyle == .delete{
            self.restaurants.remove(at: indexPath.row)
        }
        
        //self.tableView.reloadData()
        self.tableView.deleteRows(at: [indexPath], with: UITableView.RowAnimation.fade)
    }
    
    override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        
        var shareAction = UITableViewRowAction(style: .default, title: "Share"){
            (action:UITableViewRowAction!, NSIndexPath) -> Void in
let shareMenu = UIAlertController(title: nil, message: "Sharing Using", preferredStyle: .actionSheet)
let twitterAction = UIAlertAction(title: "Twitter", style: .default, handler: nil)
let facebookAction = UIAlertAction(title: "Facebook", style: .default, handler: nil)
let emailAction = UIAlertAction(title: "Email", style: .default, handler: nil)
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)

shareMenu.addAction(twitterAction)
shareMenu.addAction(facebookAction)
shareMenu.addAction(emailAction)
shareMenu.addAction(cancelAction)
        self.present(shareMenu, animated: true, completion: nil)
        }
        
var deleteAction = UITableViewRowAction(style: .default, title: "Delete"){
    (action:UITableViewRowAction!, NSIndexPath) -> Void in

    self.restaurants.remove(at: indexPath.row)
    
    self.tableView.deleteRows(at: [indexPath], with: .fade)
    }
        
 shareAction.backgroundColor = UIColor(red: 255/255.0, green: 166/255.0, blue: 51/255.0, alpha: 1.0)
 deleteAction.backgroundColor = UIColor(red: 51/255.0, green: 51/255.0, blue: 51/255.0, alpha: 1.0)
        
    return [deleteAction, shareAction]
  }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow{
    let destinationController = segue.destination as! DetailViewController
    destinationController.restaurantImage = self.restaurants[indexPath.row].image
    /*destinationController.restaurantNameText = self.restaurants[indexPath.row].name
    destinationController.restaurantLocationText = self.restaurants[indexPath.row].location
                destinationController.restaurantTypeText = self.restaurants[indexPath.row].type*/
            }
        }
    }
}

