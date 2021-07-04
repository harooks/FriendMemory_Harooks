//
//  IchiranViewController.swift
//  FriendMemory_Harooks
//
//  Created by Haruko Okada on 7/3/21.
//

import UIKit
import RealmSwift

//これは友達一覧のViewControllderだよ！realm のデータをtableView に表示していくよ！
class IchiranViewController:  UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
    
    //tableView
    @IBOutlet weak var tableView: UITableView!
    
    private var realm: Realm!
    
    //これは友達が入ってる配列みたいなものだよ！ViewControllder と配列はよく一緒に使われるけど覚えてるかな？
    //覚えていなかったらTechPodで復習しよう！
    var friends: Results<Person>!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        // ここで realm からデータを取り出す。コード書いてみよう！
        
        
        
       

    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        //今はエラーが出てると思うけど足りないところを書いたら直るよ！
        //覚えていなかったらTechPodで復習しよう！それかTableViewの記事はたくさんあるから参考にしよう！
        
        return
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        //これは各セルの高さを指定してるよ（今は１００だけでお好みで変えていいよ）
        return 180
    }
    
    
    
    //ここからは PersonTableViewCell とストーリボードのセルを見て、何やったか理解してから進めてね！
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //ここからが tableViewのメインのセルを出してデータを表示するところだよ！
        //最初は教科書とかにも書いてある簡単なところだから残しておいた！cell は PersontableViewCell のインスタンスだよ。
        //PersonTableViewCellはカスタムセルのファイル(PersonTableViewCell.swift)だよ！ここでセルに表示する要素の変数を宣言してあるよ！
        //identifier("Cell")はストーリーボードのところで設定してあるよ！見つけられるかな？
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! PersonTableViewCell
        
    
        //ここでセルにrealm のデータを表示するコードを書くよ！name(名前の表示) だけ残しておくから他は自分で書いてみよう！
        //性別と関係は OtherInfoViewController でちょこっと書いたように if 文で書こうね！
        //画像はpathからUIImageに変更する方法でできるよ！（この間参考にしてた記事にも書いてあると思う！）
        
        cell.personName.text = friends[indexPath.row].name
        
       
  
        return cell
        
    }
    
}
