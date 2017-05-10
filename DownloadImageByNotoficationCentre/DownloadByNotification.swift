
import UIKit

class DownloadByNotification: UIViewController {
    let picters = Downloader()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(imageDownloaded(notification:)), name: NSNotification.Name(rawValue: imageDownloadNotification), object: nil)
    }
    
    func imageDownloaded(notification: Notification) {
        let picters = notification.userInfo?["image"] as! UIImage
        view.backgroundColor = UIColor(patternImage: picters)
    }
    
    @IBAction func tapImageButtonAction(_ sender: UIButton) {
        picters.downloadImageAndPostNotification()
    }
}

