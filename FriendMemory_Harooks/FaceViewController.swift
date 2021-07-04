//
//  FaceViewController.swift
//  Friendmemory2
//
//  Created by nodoka on 2021/05/21.
//

import Foundation
import UIKit
import RealmSwift
class FaceViewController: UIViewController, UIImagePickerControllerDelegate & UINavigationControllerDelegate  {
@IBOutlet weak var backgroundImageView: UIImageView!
    
    @IBOutlet weak var backgroundView: UIView!
    
var eyeimageNameArray: [String] = ["maruime.png", "tareme.png", "turime.png"]
var mouthimageNameArray:[String] = ["niko.png","henozi.png","ookuti.png"]
var hairimageNameArray:[String] = ["tanpatu.png","bobu.png","poni-te-ru.png","tuinte-ru.png"]
let realm = try! Realm()

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
        
        let person = Person()
        
        do{
            //スタンプを押した画像のスクリーンショットを撮る
            UIGraphicsBeginImageContextWithOptions(backgroundView.bounds.size, false, 0.0)
            let context: CGContext = UIGraphicsGetCurrentContext()!
            context.translateBy(x: -backgroundView.frame.origin.x, y: -backgroundView.frame.origin.y)
            self.view.layer.render(in: context)
            let capturedImage: UIImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
            

            
            
            createLocalDataFile()
            let pngImageData = capturedImage.pngData()//faceImage.image!.pngData()
            
            try pngImageData!.write(to: documentDirectoryFileURL)
            
            try person.facePic = documentDirectoryFileURL.absoluteString
            
            person.id = person.maxId + 1
            
            print("attempt url: \(person.facePic)")
            print("attempt url: \(documentDirectoryFileURL)")
            saveData.set(person.id, forKey: "userId")
            print("person id is \(person.id)")
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

extension UIView {

    /// Create image snapshot of view.
    ///
    /// - Parameters:
    ///   - rect: The coordinates (in the view's own coordinate space) to be captured. If omitted, the entire `bounds` will be captured.
    ///   - afterScreenUpdates: A Boolean value that indicates whether the snapshot should be rendered after recent changes have been incorporated. Specify the value false if you want to render a snapshot in the view hierarchy’s current state, which might not include recent changes. Defaults to `true`.
    ///
    /// - Returns: The `UIImage` snapshot.

    func snapshot(of rect: CGRect? = nil, afterScreenUpdates: Bool = true) -> UIImage {
        return UIGraphicsImageRenderer(bounds: rect ?? bounds).image { _ in
            drawHierarchy(in: bounds, afterScreenUpdates: afterScreenUpdates)
        }
    }
    
    func getImage() -> UIImage{

           // キャプチャする範囲を取得.
           let rect = self.bounds

           // ビットマップ画像のcontextを作成.
           UIGraphicsBeginImageContextWithOptions(rect.size, false, 0.0)
           let context: CGContext = UIGraphicsGetCurrentContext()!

           // 対象のview内の描画をcontextに複写する.
           self.layer.render(in: context)

           // 現在のcontextのビットマップをUIImageとして取得.
           let capturedImage : UIImage = UIGraphicsGetImageFromCurrentImageContext()!

           // contextを閉じる.
           UIGraphicsEndImageContext()

           return capturedImage
       }
}


