//
//  ReuseFile.swift
//  Tafakul
//
//  Created by VinodKatta on 21/04/22.
//

import UIKit

class ReuseFile: NSObject {
    
    
    

}


extension UIButton{
    func roundedButton(){
        let maskPath1 = UIBezierPath(roundedRect: bounds,
            byRoundingCorners: [.topLeft , .topRight],
            cornerRadii: CGSize(width: 8, height: 8))
        let maskLayer1 = CAShapeLayer()
        maskLayer1.frame = bounds
        maskLayer1.path = maskPath1.cgPath
        layer.mask = maskLayer1
    }
}


extension UIView {

    func roundTop(radius:CGFloat = 25){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        } else {
            // Fallback on earlier versions
        }
    }

    func roundBottom(radius:CGFloat = 25){
        self.clipsToBounds = true
        self.layer.cornerRadius = radius
        if #available(iOS 11.0, *) {
            self.layer.maskedCorners = [.layerMaxXMaxYCorner, .layerMinXMaxYCorner]
        } else {
            // Fallback on earlier versions
        }
    }
}

extension UIView{

    func setBorder(radius:CGFloat, color:UIColor = UIColor.clear) -> UIView{
        var roundView:UIView = self
        roundView.layer.cornerRadius = CGFloat(radius)
        roundView.layer.borderWidth = 2
        roundView.layer.borderColor = color.cgColor
        roundView.clipsToBounds = true
        return roundView
    }
}

extension UIView {
    //If you want only round corners
    func myViewCorners() {
        
        
        layer.cornerRadius = 23
        layer.borderWidth = 1.5
        let darkGrey = UIColor(hexString: "#3498db").cgColor
        layer.borderColor = darkGrey
        layer.masksToBounds = true
       
    }
}


extension UIView {
    //If you want only round corners
    func myViewCornersTwo() {
        
        
        layer.cornerRadius = 15
        layer.borderWidth = 1.5
        let darkGrey = UIColor(hexString: "#3498db").cgColor
        layer.borderColor = darkGrey
        layer.masksToBounds = true
       
    }
}

extension UIView {
    //If you want only round corners
    func myViewCornersnoColor() {
        
        
        layer.cornerRadius = 15
        layer.borderWidth = 1.5
//        let darkGrey = UIColor(hexString: "#3498db").cgColor
//        layer.borderColor = darkGrey
        layer.masksToBounds = true
       
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
}

extension UITextField {

    //MARK:- Set Image on the right of text fields

  func setupRightImage(imageName:String){
    let imageView = UIImageView(frame: CGRect(x: 10, y: 10, width: 20, height: 20))
    imageView.image = UIImage(named: imageName)
    let imageContainerView: UIView = UIView(frame: CGRect(x: 0, y: 0, width: 55, height: 40))
    imageContainerView.addSubview(imageView)
    rightView = imageContainerView
    rightViewMode = .always
    self.tintColor = .lightGray
}
    
}

