//
//  ViewController.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-05-30.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var books: [Book]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchBooks()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle"
    }

    func fetchBooks() {
        if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
            URLSession.shared.dataTask(with: url) { data, response, error in
                if let err = error {
                    print("Failed to fetch external json books: ", err)
                    return
                }
                guard let data = data else { return }
                do {
                    let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
                    guard let bookDictionaries = json as? [[String: Any]] else { return }

                    self.books = []
                    for bookDictionary in bookDictionaries {
                        let book = Book(bookDictionary: bookDictionary)
                        self.books?.append(book)
                    }

                    DispatchQueue.main.async {
                        self.tableView.reloadData()
                    }
                } catch let jsonError {
                    print("Failed to parse JSON properly", jsonError)
                }
            }.resume()
        }
        
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 86
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
        cell.book = books?[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let count = books?.count {
            return count
        }
        return 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBook = books?[indexPath.row]

        let layout = UICollectionViewFlowLayout();
        let viewController = BookPagerController(collectionViewLayout: layout)
        viewController.book = selectedBook
        let navContoller = UINavigationController(rootViewController: viewController)
        present(navContoller, animated: true, completion: nil)
    }
    
    func setupBooks() {
        let page1 = Page(number: 1, text: "Text for the first page")
        let page2 = Page(number: 2, text: "This is text for the second page")
        let pages = [page1, page2]
        
        let book = Book(title: "Steve Jobs", author: "Walter Isaacson",
                        image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
        let book2 = Book(title: "Bill Gates: A Biography", author: "Michael B. Becraft", image: #imageLiteral(resourceName: "bill_gates"),
                         pages: [Page(number: 1, text: "Text for page 1"),
                                 Page(number: 2, text: "Text for page 2"),
                                 Page(number: 3, text: "Text for page 3"),
                                 Page(number: 4, text: "Text for page 4")])
        
        self.books = [book, book2]
    }
}

