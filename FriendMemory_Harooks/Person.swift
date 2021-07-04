//
//  Person.swift
//  Friendmemory2
//
//  Created by Haruko Okada on 6/18/21.
//

import Foundation
import UIKit
import RealmSwift

class Person: Object {
    
    @objc dynamic var id = 0
    var maxId: Int { return try! Realm().objects(Person.self).sorted(byKeyPath: "id").last?.id ?? 0 }
    @objc dynamic var name = ""
    @objc dynamic var gender = 0
    @objc dynamic var relation = 0
    @objc dynamic var facePic: String? = ""
    
//    let people = List<Person>()
    
    
//    dynamic private var imageData: NSData? = nil
//    dynamic private var _image: UIImage? = nil
//
//    @objc dynamic var facepic: UIImage? {
//        set{
//            self._image = newValue
//            if let value = newValue {
//                self.imageData = value.pngData() as NSData?
//            }
//        }
//        get{
//            if let image = self._image {
//                return image
//            }
//            if let data = self.imageData {
//                self._image = UIImage(data: data as Data)
//                return self._image
//            }
//            return nil
//        }
//    }
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
 
    
//    init(name: String, facePic: UIImage, gender: Int, relation: Int) {
    
    

}

