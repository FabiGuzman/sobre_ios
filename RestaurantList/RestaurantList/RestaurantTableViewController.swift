import UIKit

class RestaurantTableViewController: UITableViewController {
    
var restaurantNames = ["Cafe Deadend","Homei","Teakha","Cafe Loisl","Petite Oyster","For kee restaurant","Po's Atelier","Bourke Street Bakery","Haigh's Chocolate", "Palomino Expresso","Upstate", "Traif", "Graham Avenue Meats and Deli", "Waffle and Wolf","Five Leaves","Cafe llore","Confessional","Barrafina","Donostia","Royal Oak", "CASK Pub and Kitchen"]
    
var restaurantImages = ["cafedeadend.jpg", "homei.jpg","teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg","forkeerestaurant.jpg","posatelier.jpg","bourkestreetbakery.jpg","haighschocolate.jpg", "palominoespresso.jpg","upstate.jpg","traif.jpg",    "grahamavenuemeats.jpg","wafflewolf.jpg","fiveleaves.jpg","cafelore.jpg","confessional.jpg","barrafina.jpg", "donostia.jpg", "royaloak.jpg", "thaicafe.jpg"]



    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.restaurantNames.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) ->
        UITableViewCell {
            
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        cell.textLabel?.text = restaurantNames[indexPath.row]
        cell.imageView?.image = UIImage(named: restaurantImages[indexPath.row])
        return cell
    }

}
