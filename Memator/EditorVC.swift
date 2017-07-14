//
//  EditorVC.swift
//  Memator
//
//  Created by Sukhrat on 13.07.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit

class EditorVC: UIViewController {
    
    @IBOutlet weak var upperField: UITextField!
    
    @IBOutlet weak var lowerField: UITextField!
    //MARK: Properties
    var meme: Meme!
    var topLbl: UILabel!
    var bottomLbl: UILabel!
    var imageView: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()

        do {
            let data = try Data(contentsOf: URL(string: meme.url)!)
            imageView = UIImageView(image: UIImage(data: data))
            imageView.frame = CGRect(x: 0, y: 50, width: view.frame.width, height: CGFloat(meme.height) * view.frame.width / CGFloat(meme.width))
            
            let viewRect = CGRect(x: 0, y: 30, width: imageView.frame.size.width, height: imageView.frame.size.height)
            let myView = UIView(frame: viewRect)
            view.addSubview(myView)
            myView.addSubview(imageView)
            
            topLbl = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
            
            topLbl.center = CGPoint(x: imageView.center.x, y: 30)
            
            
            topLbl.textColor = UIColor.white
            topLbl.font = UIFont(name: "Impact", size: 50)
            
            topLbl.text = "МНЕ КАЖЕТСЯ"
            topLbl.textAlignment = .center
            topLbl.adjustsFontSizeToFitWidth = true
            imageView.addSubview(topLbl)
            topLbl.numberOfLines = 2
            topLbl.shadowOffset.width = 1
            topLbl.shadowOffset.height = 0
            
            bottomLbl = UILabel(frame: CGRect(x: 0, y: 0, width: imageView.frame.size.width, height: 50))
            bottomLbl.center = CGPoint(x: view.frame.size.width/2, y: imageView.frame.size.height - 30)
            bottomLbl.textAlignment = .center
            bottomLbl.textColor = UIColor.white
            bottomLbl.font = UIFont(name: "Impact", size: 50)
            bottomLbl.text = "ИЛИ ЭТО ГОДНЫЙ МЕМАС"
            imageView.addSubview(bottomLbl)
            bottomLbl.adjustsFontSizeToFitWidth = true
            bottomLbl.numberOfLines = 2
            bottomLbl.shadowOffset.width = 1
            bottomLbl.shadowOffset.height = 0
            
        } catch {
            print("error occurred")
        }
        
        upperField.addTarget(self, action: #selector(upperFieldBeganEditing(textField:)), for: .editingChanged)
        lowerField.addTarget(self, action: #selector(lowerFieldBeganEditing(textField:)), for: .editingChanged)

    }
    
    func upperFieldBeganEditing(textField: UITextField) {
        
        topLbl.text = textField.text?.uppercased()
        
        
    }
    
    func lowerFieldBeganEditing(textField: UITextField) {
        
        bottomLbl.text = textField.text?.uppercased()
        
    }


}
