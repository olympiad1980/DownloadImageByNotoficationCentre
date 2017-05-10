
import UIKit

let kBgQ = DispatchQueue.global(qos: .background)
let kMainQueue = DispatchQueue.main

let imageDownloadNotification = "imageDownloadNotification"

class Downloader {
    
    func downloadImageAndPostNotification() {
        print("start", Date().timeIntervalSince1970)
        let url = URL(string: "https://ae01.alicdn.com/kf/HTB1qvLfKXXXXXbAXFXXq6xXFXXXp/south-font-b-america-b-font-chile-patagonia-national-font-b-park-b-font-torres-del.jpg")!
        kBgQ.async {
            let data = try! Data(contentsOf: url)
            print("finish", Date().timeIntervalSince1970)
            let image = UIImage(data: data)
            
            kMainQueue.async {
                NotificationCenter.default.post(name: NSNotification.Name(rawValue: imageDownloadNotification), object: nil, userInfo: ["image" : image ?? "error"])
            }
        }
    }
}
