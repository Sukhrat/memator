//
//  ViewController.swift
//  Memator
//
//  Created by Sukhrat on 10.07.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import UIKit
import Alamofire

class CatalogVC: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var memes = [Meme]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = self
        
        if let layout = collectionView?.collectionViewLayout as? PinterestLayout {
            layout.delegate = self
        }
        
        downloadMemes {
            self.collectionView.reloadData()
        }
        
    }
    
    //MARK: Collection View DataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeCell", for: indexPath) as? MemeCell {
            
            let meme = memes[indexPath.row]
            cell.configureCell(withMemeUrl: meme.url)
            return cell
        }
        
        return MemeCell()
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let meme = memes[indexPath.row]
//        
//        performSegue(withIdentifier: "ShowMeme", sender: meme)
//    }
    
    func downloadMemes(complete: @escaping DownloadComplete) {
        
        Alamofire.request(GET_URL).responseJSON { (response) in
            if let dict = response.result.value as? Dictionary<String, AnyObject> {
                
                if let data = dict["data"] as? Dictionary<String, AnyObject> {
                    
                    if let memes_d = data["memes"] as? [Dictionary<String, AnyObject>] {
                        
                        var id: String!
                        var url: String!
                        var width: Int!
                        var height: Int!
                        for meme in memes_d {
                            
                            id = meme["id"] as! String
                            url = meme["url"] as! String
                            width = meme["width"] as! Int
                            height = meme["height"] as! Int
                            //TODO: remove '\' from url
                            let newMeme = Meme(id: id, url: url, width: width, height: height)
                            self.memes.append(newMeme)
                            
                        }
                        
                    }
                    
                }
                
            }
            
            complete()
        }
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if let memeVC = segue.destination as? MemeVC {
//            if let meme = sender as? Meme {
//                
//                memeVC.meme = meme
//            }
//            
//        }
//    }


}

extension CatalogVC: PinterestLayoutDelegate {
    
    func collectionView(collectionView: UICollectionView, heightForItemAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        let height = Double(memes[indexPath.row].height) * Double(self.view.frame.width)/(2.0*Double(memes[indexPath.row].width))
        return CGFloat(height)
    }
}
