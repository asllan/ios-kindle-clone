//
//  BookPagerController.swift
//  kindle-clone
//
//  Created by Ukjin Lee on 2017-06-01.
//  Copyright © 2017 ukjin. All rights reserved.
//

import UIKit

class BookPagerController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    var book: Book?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = book?.title
        
        collectionView?.backgroundColor = .white
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: "cellId")
        
        let layout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout
        layout?.scrollDirection = .horizontal
        layout?.minimumLineSpacing = 0
        
        collectionView?.isPagingEnabled = true
    }
    
    // the method in UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height - 44 - 20)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath)
        return cell
    }
}
