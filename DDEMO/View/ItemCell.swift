import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var item_Label: UILabel!
    
    @IBOutlet var date_Label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func updateUI(item: Item) {
        item_Label.text = item.itemName
        date_Label.text = item.addTime
    }

}
