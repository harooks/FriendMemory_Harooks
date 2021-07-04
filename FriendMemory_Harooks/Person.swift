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
    
    //id これはこの間説明した key みたいなものだよ。これで各Personの区別がつくよ！
    @objc dynamic var id = 0
    
    //maxId これは現状のidの最大値だよ！Personが５人realmに保存されたら maxId は 5 だよ！
    var maxId: Int { return try! Realm().objects(Person.self).sorted(byKeyPath: "id").last?.id ?? 0 }
    @objc dynamic var name = ""
    @objc dynamic var gender = 0
    @objc dynamic var relation = 0
    @objc dynamic var facePic: String? = ""
    
    /**
     id をプライマリーキーとして設定
     */
    override static func primaryKey() -> String? {
        return "id"
    }
    
 
    
//    init(name: String, facePic: UIImage, gender: Int, relation: Int) {
    
    

}

