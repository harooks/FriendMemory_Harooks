//
//  OtherInfoViewController.swift
//  FriendMemory_Harooks
//
//  Created by Haruko Okada on 7/3/21.
//

import UIKit
import RealmSwift

//ここは画像以外のデータ以外を入力して保存するViewController だよ！
class OtherInfoViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    //ストーリボードは前作ってくれてたストーリーボードそのまんまだよ！
    //やりたいこと：性別と関係がボタンになってたので押したボタンによってIntが変わるようにするよ！
    //なんで Int型で保存するかというと文字より簡単だから！あとで表示する時に「もし gender が 0 だったらlabel.text = ”男”にする」と設定できるよ！わかるかな？？
    //そんな難しくないので複雑に考えないように！じゃあコードを書いてみよう！最初の変数は宣言は残しておいたよ！
    
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
        
    }
    
    @IBAction func femaleButton(_ sender: Any) {
        
    }
    
    @IBAction func otherGenderButton(_ sender: Any) {
        
    }
    
    @IBAction func schoolFriend(_ sender: Any) {
        
    }
    
    @IBAction func activityFriend(_ sender: Any) {
        
    }
    
    @IBAction func familyFriend(_ sender: Any) {
        
    }
    
    var imageURL = String()
    
    @IBAction func register(_ sender: Any) {
        
        //ここでさっき FaceViewControllderでuserdefualtに保存した id を取り出して、saveId という変数に入れるよ！左辺を完成させよう！
        let savedId =

        //targetFriend は上で取ってきた id と同じ id の personオブジェクトだよ！.filterで id == savedId で判別してるよ！
        //ここも説明不足かもだから https://zenn.dev/men_so/articles/02e89dbb561fd4 読んでね！この間も送ったけど、ここのhttps://zenn.dev/men_so/articles/02e89dbb561fd4の部分を参考にしてるよ！
        let targetFriend = realm.objects(Person.self).filter("id == %@", savedId).first
        //読んでもわからなかったら聞いてね！
        
        
        
        do { try realm.write {
            //こんなかにさっき FaceViewControllerで画像pathのURLを保存したみたいに性別、関係、名前を保存してみよう！
            //名前だけIntにできなかったから入力した文字そのまま保存しちゃっていいよ！
            
            
            
            
        }
        } catch {
            print("Errorrrrr \(error)")
        }
    }
    

}
