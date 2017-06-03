//
//  Models.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-05-31.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]
    let coverImageUrl: String
    
    init(bookDictionary: [String : Any]) {
        title = bookDictionary["title"] as? String ?? ""
        author = bookDictionary["author"] as? String ?? ""
        coverImageUrl = bookDictionary["coverImageUrl"] as? String ?? ""
        
        var bookPages = [Page]()
        if let pageDictionaries = bookDictionary["pages"] as? [[String: Any]] {
            for pageDictionary in pageDictionaries {
                if let text = pageDictionary["text"] as? String {
                    let num = pageDictionary["id"] as? Int ?? 0
                    let page = Page(number: num, text: text)
                    bookPages.append(page)
                }
            }
        }
        pages = bookPages
    }
}

class Page {
    let number: Int
    let text: String
    
    init(number: Int, text: String) {
        self.number = number
        self.text = text
    }
}
