//
//  UIViewController.swift
//  MarketWatch
//
//  Created by Senrysa on 01/03/21.
//

import UIKit

extension BaseViewController {
    func setRightRefreshButton() {
        let rightRefreshButton: UIBarButtonItem = UIBarButtonItem(image: UIImage(named: "refresh")?.withRenderingMode(UIImage.RenderingMode.alwaysOriginal), style: UIBarButtonItem.Style.plain, target: self, action: #selector(self.reloadWatchlist))
        self.navigationItem.rightBarButtonItems = [rightRefreshButton]
    }
    
    @objc open func reloadWatchlist() {
    
      }
}
