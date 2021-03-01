//
//  WatchlistController.swift
//  MarketWatch
//
//  Created by Senrysa on 27/02/21.
//

import UIKit
import Alamofire

class WatchlistController: BaseViewController {
    
    @IBOutlet weak var tableViewWatchList: UITableView!
    
    var refreshControl: UIRefreshControl!
    var marketWatchResponse : MarketWatchResponse?
    var timer : Timer?

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //self.setRightRefreshButton()
        refreshControl = UIRefreshControl()
        refreshControl.tintColor = UIColor.defaultBorderColor
        refreshControl.attributedTitle = NSAttributedString(string: "Refreshing Data!")
        refreshControl.addTarget(self, action: #selector(callWatchListAPI), for: .valueChanged)
        tableViewWatchList.addSubview(refreshControl)
        
        self.callWatchListAPI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func resetTimer() {
        if timer != nil {
            timer?.invalidate()
            timer = nil
        }
        self.stopPreviousRequest()
        timer = Timer.scheduledTimer(timeInterval: 4.0, target: self, selector: #selector(updateRealTimeData), userInfo: nil, repeats: true)
    }
    
    @objc func updateRealTimeData() {
        MWAPIClient.sharedInstance.getRequestWithURL(parameters: [:], url: .StockList) { (response:NSDictionary?, error:NSError?,responseObject:AFDataResponse<Any>?) in
            self.hideHud(hudview: self.view)
            if ((error) != nil){
                printNew(items: error?.debugDescription as Any)
                self.refreshControl.endRefreshing()
            }
            else{
                self.refreshControl.endRefreshing()
                self.parseWatchListResponse(data: responseObject?.data)
            }
        }
    }
    
    override func reloadWatchlist() {
        //self.callWatchListAPI()
    }

    @objc func callWatchListAPI() {
        if NetworkManager.sharedManager.isReachable == true {
            if timer != nil && ((timer?.isValid) != nil) {
                timer?.invalidate()
                timer = nil
            }
            //printNew(items: NSDate())
            self.showHud(hudview: view)
            MWAPIClient.sharedInstance.getRequestWithURL(parameters: [:], url: .StockList) { (response:NSDictionary?, error:NSError?,responseObject:AFDataResponse<Any>?) in
                self.hideHud(hudview: self.view)
                if ((error) != nil){
                    printNew(items: error?.debugDescription as Any)
                    self.showAlertWithMessage(givenString: response?.value(forKey: "responseMsg") as? String ?? "")
                    self.refreshControl.endRefreshing()
                }
                else{
                    self.refreshControl.endRefreshing()
                    self.parseWatchListResponse(data: responseObject?.data)
                    DispatchQueue.main.async {
                        self.resetTimer()
                    }
                }
            }
        } else {
            self.showAlertWithMessage(givenString: No_Network_Connection)
        }
    }
    
    func parseWatchListResponse(data:Data?) -> Void {
        
        do {
            let decoder = JSONDecoder()
            self.marketWatchResponse = try decoder.decode(MarketWatchResponse.self, from: data!)
                        
            DispatchQueue.main.async {
                //printNew(items: NSDate())
                self.tableViewWatchList.reloadData()
            }
           
        } catch let err {
            printNew(items: "Err:\(err)")
        }
    }
}

extension UIRefreshControl {
    func beginRefreshingManually() {
        if let scrollView = superview as? UIScrollView {
            scrollView.setContentOffset(CGPoint(x: 0, y: scrollView.contentOffset.y - frame.height), animated: true)
        }
        beginRefreshing()
    }
}

extension WatchlistController : UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let mWatchResp = self.marketWatchResponse?.marketSummaryAndSparkResponse {
            return mWatchResp.result?.count ?? 0
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let mWatchObj = self.marketWatchResponse?.marketSummaryAndSparkResponse?.result?[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "WatchListTableViewCell", for: indexPath) as! WatchListTableViewCell
        if mWatchObj?.shortName != nil {
            cell.lblStockName.text = mWatchObj?.shortName
        } else {
            cell.lblStockName.text = mWatchObj?.symbol
        }
        
        cell.lblCompanyName.text = mWatchObj?.fullExchangeName
        
        if mWatchObj?.spark?.close != nil {
            let closeValueCount = (mWatchObj?.spark?.close?.count ?? 0)-1
            
            cell.lblStockPrice.text = "\(mWatchObj?.spark?.close?[closeValueCount] ?? 0)"
            
            let priceChange = (mWatchObj?.spark?.close?[closeValueCount] ?? 0) - (mWatchObj?.spark?.previousClose ?? 0)
            
            if priceChange >= 0 {
                if mWatchObj?.quoteType == "CURRENCY" {
                    cell.lblPercentageChange.text = "+\(String(format: "%.3f", priceChange))"
                }else{
                    cell.lblPercentageChange.text = "+\(String(format: "%.2f", priceChange))"
                }
                
                cell.lblPercentageChange.backgroundColor = UIColor.customGreenColor
                
                cell.lblPostValue.text = "+\(CommonFunctions.getPercentageChange(closeValue: Double(mWatchObj?.spark?.previousClose ?? 0), currentValue: Double(mWatchObj?.spark?.close?[closeValueCount] ?? 0), quoteType: (mWatchObj?.quoteType)!))"
                cell.lblPostValue.textColor = UIColor.customGreenColor
            }else{
                if mWatchObj?.quoteType == "CURRENCY" {
                    cell.lblPercentageChange.text = "\(String(format: "%.3f", priceChange))"
                }else{
                    cell.lblPercentageChange.text = "\(String(format: "%.2f", priceChange))"
                }
                cell.lblPercentageChange.backgroundColor = UIColor.customRedColor
                
                cell.lblPostValue.text = CommonFunctions.getPercentageChange(closeValue: Double(mWatchObj?.spark?.previousClose ?? 0), currentValue: Double(mWatchObj?.spark?.close?[closeValueCount] ?? 0), quoteType: (mWatchObj?.quoteType)!)
                cell.lblPostValue.textColor = UIColor.customRedColor
            }
        } else {
            printNew(items: "\(String(format: "%.4f", mWatchObj?.spark?.previousClose ?? 0))")
            cell.lblStockPrice.text = "\(String(format: "%.4f", mWatchObj?.spark?.previousClose ?? 0))"
            cell.lblPercentageChange.backgroundColor = .lightGray
            cell.lblPercentageChange.textColor = .black
            cell.lblPostValue.textColor = .black
            cell.lblPercentageChange.text = "0.0000"
            cell.lblPostValue.text = "0.00%"
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
    }
}
