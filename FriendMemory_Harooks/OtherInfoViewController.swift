//
//  OtherInfoViewController.swift
//  FriendMemory_Harooks
//
//  Created by Haruko Okada on 7/3/21.
//

import UIKit
import RealmSwift

class OtherInfoViewController: UIViewController {

    
    @IBOutlet weak var nameTextField: UITextField!
    
    var gender: Int = 0
    var relation: Int = 0
    
    let realm = try! Realm()
    let saveData = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //print("that person's url:\(thatPerson.facePic)")
    }
    
    @IBAction func maleButton(_ sender: Any) {
        gender = 0
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        gender = 1
    }
    
    @IBAction func otherGenderButton(_ sender: Any) {
        gender = 2
    }
    
    @IBAction func schoolFriend(_ sender: Any) {
        relation = 0
    }
    
    @IBAction func activityFriend(_ sender: Any) {
        relation = 1
    }
    
    @IBAction func familyFriend(_ sender: Any) {
        relation = 2
    }
    
    var imageURL = String()
    
    @IBAction func register(_ sender: Any) {
        
        var person = Person()
        
        let savedId = saveData.object(forKey: "userId")

        let targetFriend = realm.objects(Person.self).filter("id == %@", savedId).first
        print("saved id here is :  \(savedId)")
        
        do { try realm.write {
          
            targetFriend?.gender = gender
            targetFriend?.relation = relation
            targetFriend?.name = nameTextField.text ?? "no name"
            
        }
        } catch {
            print("Errorrrrr \(error)")
        }
    }
    

}
