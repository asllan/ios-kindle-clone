//
//  ViewController.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-05-30.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class Book {
    let title: String
    let author: String
    let pages: [Page]
    
    init(title: String, author: String, pages: [Page]) {
        self.title = title
        self.author = author
        self.pages = pages
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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for the second page")
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael B. Becraft",
                         pages: [Page(number: 1, text: "Text for page 1"),
                                 Page(number: 2, text: "Text for page 2"),
                                 Page(number: 3, text: "Text for page 3"),
                                 Page(number: 4, text: "Text for page 4")])
        
        for book in [book, book2] {
            print(book.title)
            for page in book.pages {
                print(page.text)
            }
        }
    }
}

