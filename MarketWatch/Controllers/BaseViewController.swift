//
//  BaseViewController.swift
//  MarketWatch
//
//  Created by Senrysa on 28/02/21.
//

import UIKit
import Alamofire
import MaterialComponents.MaterialActivityIndicator

class BaseViewController: UIViewController {
    
    let activityIndicator = MDCActivityIndicator()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        activityIndicator.sizeToFit()
        activityIndicator.center = view.center
        activityIndicator.strokeWidth = 3
        activityIndicator.radius = 16
        activityIndicator.cycleColors = [UIColor.gradientBlueColor,UIColor.gradientGreenColor,UIColor.aquaBlue1,UIColor.aquaBlue2,UIColor.aquaBlue3]
        view.addSubview(activityIndicator)
    }
    
    //MARK:NETWORK MANAGER
    internal class NetworkManager{
        static var sharedManager:NetworkReachabilityManager={
            let manager = NetworkReachabilityManager()
            return manager!
        }()
    }

    func showAlertWithMessage(givenString: String){
        
        let alert=UIAlertController(title:ApplicationName ,message:givenString as String, preferredStyle: .alert);
        alert.addAction(UIAlertAction(title:"OK",style: .default,handler: {
            action in
            
        }));
        self.present(alert, animated:true, completion: nil);
    }
    
    func showHud(hudview : UIView){
        if !activityIndicator.isAnimating{
            self.view.isUserInteractionEnabled = false
            activityIndicator.startAnimating()
        }
    }
        
    func hideHud(hudview : UIView)  {
        if activityIndicator.isAnimating{
            self.view.isUserInteractionEnabled = true
            activityIndicator.stopAnimating()
        }
    }
    
    func stopPreviousRequest(){
        let sessionManager = Alamofire.Session.default
        sessionManager.session.getTasksWithCompletionHandler { dataTasks, uploadTasks, downloadTasks in
            dataTasks.forEach { $0.cancel() }
            uploadTasks.forEach { $0.cancel() }
            downloadTasks.forEach { $0.cancel() }
        }
    }
}
