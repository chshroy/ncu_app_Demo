import Foundation

class Item {
    private var _itemName: String!
    private var _addTime: String!
    var itemName: String {
        return _itemName
    }
    var addTime: String {
        return _addTime
    }
    init(itemName: String) {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = .full
        
        dateFormatter.timeStyle = .full
        
        let dateString = dateFormatter.string(from: currentDate)
        _itemName = itemName
        _addTime = dateString
    }
    
}

