//
//  FaceViewController.swift
//  Friendmemory2
//
//  Created by nodoka on 2021/05/21.
//

import Foundation
import UIKit
import RealmSwift
class FaceViewController: UIViewController {
@IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!
    
var eyeimageNameArray: [String] = ["maruime.png", "tareme.png", "turime.png"]
var mouthimageNameArray:[String] = ["niko.png","henozi.png","ookuti.png"]
var hairimageNameArray:[String] = ["tanpatu.png","bobu.png","poni-te-ru.png","tuinte-ru.png"]
let realm = try! Realm()

//userdefualtの宣言！覚えてなかったらmemoアプリを参考にしよう！
let saveData = UserDefaults.standard
    
    

var eyeimageindex: Int = 0
var faceImage: UIImageView!
var mouthimageindex: Int = 0
var hairimageindex: Int = 0

    

override func viewDidLoad() {
    super.viewDidLoad()
    
    let folderPath = realm.configuration.fileURL!.deletingLastPathComponent().path
    print("the realm path is \(folderPath)")
    // Do any additional setup after loading the view.
}

    @IBAction func maruimeBtn(_ sender: Any) {
    eyeimageindex = 1;
}

@IBAction func taremeBtn(_ sender: Any) {
     eyeimageindex = 2;
}

@IBAction func turimeBtn(_ sender: Any) {
     eyeimageindex = 3;
}
   
    @IBAction func nikoBtn(_ sender: Any) {
         mouthimageindex = 1;
    }
    @IBAction func henoziBtn(_ sender: Any) {
         mouthimageindex = 2;
    }
    @IBAction func ookutiBtn(_ sender: Any) {
         mouthimageindex = 3;
    }
    
    @IBAction func tanpatuBtn(_ sender: Any) {
         hairimageindex = 1;
    }
    @IBAction func bobuBtn(_ sender: Any) {
         hairimageindex = 2;
    }
    @IBAction func poniteBtn(_ sender: Any) {
         hairimageindex = 3;
    }
    @IBAction func tuinteBtn(_ sender: Any) {
         hairimageindex = 4;
    }
    @IBAction func backBtn(_ sender: Any) {
    self.faceImage.removeFromSuperview()
}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        let touch: UITouch = touches.first!
        let location: CGPoint = touch.location(in: self.view)
        
        if eyeimageindex != 0{
            faceImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 150, height: 50))
            let image: UIImage =  UIImage(named: eyeimageNameArray[eyeimageindex - 1])!
            
            faceImage.image = image
            faceImage.center = CGPoint(x: location.x, y: location.y)
            self.view.addSubview(faceImage)
            
            eyeimageindex = 0
        }
        
        if mouthimageindex != 0{
            faceImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 90, height: 43))
            let image: UIImage =  UIImage(named: mouthimageNameArray[mouthimageindex - 1])!
            
            faceImage.image = image
            faceImage.center = CGPoint(x: location.x, y: location.y)
            self.view.addSubview(faceImage)
            mouthimageindex = 0
        }
        if hairimageindex != 0{
            faceImage = UIImageView(frame: CGRect(x: 0, y: 0, width: 250, height: 200))
            let image: UIImage =  UIImage(named: hairimageNameArray[hairimageindex - 1])!
            
            faceImage.image = image
            faceImage.center = CGPoint(x: location.x, y: location.y)
            self.view.addSubview(faceImage)
            hairimageindex = 0
        }
        


    }
    
    
    @IBAction func saveBtn(_ sender: Any) {
        
        //これは Person型のオブジェクトだよ！ let number = Int() と同じ概念！
        let person = Person()
        
        do{
            //スタンプを押した画像のスクリーンショットを撮るコード。詳しい意味は理解しなくていいよ。私もコピペしただけww
            //ここはスタンプの教科書と同じだよ！
            UIGraphicsBeginImageContextWithOptions(backgroundView.bounds.size, false, 0.0)
            let context: CGContext = UIGraphicsGetCurrentContext()!
            context.translateBy(x: -backgroundView.frame.origin.x, y: -backgroundView.frame.origin.y)
            self.view.layer.render(in: context)
            let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            

            
            //ここは前にのんが書いてきてくれた画像をローカルに保存してるメソッドだよ！下のほうに書いてあるよ
            createLocalDataFile()
            
            
            //ここでイメージデータをローカルに保存してあるところのpathに変換してるよ！pathはわかるかな？
            let pngImageData = capturedImage.pngData()
            try pngImageData!.write(to: documentDirectoryFileURL)
            
            //documentDirectoryFileURL.absoluteString は画像のpathだよ。
            print("attempt url: \(documentDirectoryFileURL)")
            //でコンソールに出てきたURLをブラウザで開くと多分作った写真が出てくるよ！で、その写真をrealmに保存するよ！
            //realmに保存する時はさっき作ったPerson型（クラス）のオブジェクトの中に保存するんだったね！Personクラスを見てどこの値に保存するか考えてみよう！〇〇はどうなるかな？
            try 〇〇 = documentDirectoryFileURL.absoluteString
            
            //ここで id が毎回変わるように最大idに1を毎回足してるよ！maxId　の意味は Person.swift ファイルに書いてあるよ！
            person.id = person.maxId + 1
            
            //この間のスクールでしたuserdefaultの説明は覚えてるかな？ 22行目にuserdefaultのオブジェクトが宣言してあるよ！
            //この下に22行目に宣言したuserdefault のオブジェクト(saveData）に id を保存しよう！保存の仕方が覚えてなかったらメモ教科書を参考にしよう！
            
            
            //書けたかな？一行だけだからすぐ終わるはず！で、なんでここで id を保存するかというと次の画面にいく時に、今保存したid(key)と同じidの中に他のデータも保存しなきゃいけないからだよ！もしわからなかったら聞いて！！ちょっと説明下手かもだから！
            
            //ここでやっと person を realm に保存するよ！けど今はまだ画像のpathしか入ってないよね！他のデータは次の画面で行うよ！
            try! realm.write{realm.add(person)}
            
            
            
        } catch {
              print("画像の保存に失敗しました")
          }
         
        
    }
    
    
var documentDirectoryFileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
let filePath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

   
    func createLocalDataFile() {
            // 作成するテキストファイルの名前
            let fileName = "\(NSUUID().uuidString).png"

            // DocumentディレクトリのfileURLを取得
            if documentDirectoryFileURL != nil {
                // ディレクトリのパスにファイル名をつなげてファイルのフルパスを作る
                let path = documentDirectoryFileURL.appendingPathComponent(fileName)
                documentDirectoryFileURL = path
                print("成功したらしい！")
            }
        }
}
}


