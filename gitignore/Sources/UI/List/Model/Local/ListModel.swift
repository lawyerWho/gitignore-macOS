import CombineRealm
import RealmSwift
import Foundation

class ListModel : Object{
    @objc dynamic var id = UUID().uuidString
    @objc dynamic var title : String = .init()
    @objc dynamic var time  = Date()
    @objc dynamic var tag  : [String] = .init()
    @objc dynamic var gitignoreString : String = .init()
    override class func primaryKey() -> String? {return "id"}
}

class ListModelex{
    var title : String
    var time = Date()
    var tag : [String]
    var bookMark : Bool
    
    init(title: String, tag : [String], bookMark : Bool){
        self.title = title
        self.tag = tag
        self.bookMark = bookMark
    }
}
