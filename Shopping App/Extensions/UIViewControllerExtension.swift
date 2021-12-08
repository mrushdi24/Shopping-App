//
//  UIViewControllerExtension.swift
//  Shopping App
//
//  Created by Mohamed on 01/12/2021.
//


import UIKit


extension UIViewController {
    //Mark:- Set Navigation Bart with custom appearance
    func setNavigationBar() {
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        let barAppearance = UINavigationBarAppearance()
           barAppearance.backgroundColor = .white
           navigationItem.standardAppearance = barAppearance
        navigationItem.scrollEdgeAppearance = barAppearance
    }
    //Mark:- Enable navigatioController Swip with Scroll
    func navigationHideOnSwip(){
        navigationController?.hidesBarsOnSwipe = true
    }
    
}






