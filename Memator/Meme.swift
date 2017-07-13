//
//  Meme.swift
//  Memator
//
//  Created by Sukhrat on 13.07.17.
//  Copyright © 2017 Sukhrat. All rights reserved.
//

import Foundation

class Meme {
    
    private var _id: String!
    private var _url: String!
    private var _width: Int!
    private var _height: Int!
    
    var id: String {
        return _id
    }
    
    var url: String {
        return _url
    }
    
    var width: Int {
        return _width
    }
    
    var height: Int {
        return _height
    }
    
    init(id: String, url: String, width: Int, height: Int) {
        
        self._id = id
        self._url = url
        self._height = height
        self._width = width
        
    }
    
    
}
