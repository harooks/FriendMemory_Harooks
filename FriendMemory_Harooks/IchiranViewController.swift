//
//  IchiranViewController.swift
//  FriendMemory_Harooks
//
//  Created by Haruko Okada on 7/3/21.
//

import UIKit
import RealmSwift

class IchiranViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    private var realm: Realm!
    var friends: Results<Person>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // Do any additional setup after loading the view.
        do{
            let realm = try Realm()
            friends = realm.objects(Person.self)
            
        }catch{
        }
        
        //tableView.register(UINib (nibName: "PersonTableViewCell", bundle: nil), forCellReuseIdentifier: "Cell")

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        

        return friends.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 180
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonTableViewCell
    
        let genderInt = friends[indexPath.row].gender
        let relationInt = friends[indexPath.row].relation
        
        let imageUrl = friends[indexPath.row].facePic
        
        let imagePathURL = URL(string: imageUrl!)
        print("image path url: \(imagePathURL)")
        
        let uiImage = UIImage(contentsOfFile: imagePathURL!.path)
//        let uiImage = getSavedImage(named: imageUrl!)
        
        
        cell.personImage.image = UIImage(contentsOfFile: imagePathURL!.path)
        
        cell.personName.text = friends[indexPath.row].name
        
        if genderInt == 0 {
            cell.personGender.text = "男"
        } else if genderInt == 1 {
            cell.personGender.text = "女"
        } else {
            cell.personGender.text = "不明"
        }
        
        if relationInt == 0 {
            cell.personRelation.text = "学校の友達"
        } else if relationInt == 1 {
            cell.personRelation.text = "習い事の友達"
        } else {
            cell.personRelation.text = "家族"
        }
  
        return cell
        
    }
    
    func getSavedImage(named: String) -> UIImage? {
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            print ("これは画像じゃ！")
        } else {
            print ("これは画像じゃないやんねー")
        }
        return nil
    }
    
}
