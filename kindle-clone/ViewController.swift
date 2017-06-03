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
        
        setupNavigationBarStyle()
        setupNavigationBarButton()
        
        fetchBooks()
        
        tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
        tableView.tableFooterView = UIView()
        
        navigationItem.title = "Kindle"
    }
    
    func setupNavigationBarStyle() {
        navigationController?.navigationBar.barTintColor = UIColor(red: 40/255, green: 40/255, blue: 40/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName: UIColor.white]
    }
    
    func setupNavigationBarButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "menu").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleMenu))
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: #imageLiteral(resourceName: "amazon_icon").withRenderingMode(.alwaysOriginal), style: .plain, target: self, action: #selector(handleIcon))
    }
    
    func handleMenu() {
        print("pressed menu")
    }
    
    func handleIcon() {
        print("pressed icon")
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
}

