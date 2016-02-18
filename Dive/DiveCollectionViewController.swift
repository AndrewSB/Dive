//
//  DiveCollectionViewController.swift
//  Dive
//
//  Created by Andrew Breckenridge on 2/18/16.
//  Copyright © 2016 Andrew Breckenridge. All rights reserved.
//

import UIKit

class DiveCollectionViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView! {
        didSet { collectionView.dataSource = self }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        (collectionView.collectionViewLayout as! UICollectionViewFlowLayout).itemSize = CGSize(width: view.frame.width, height: view.frame.width)
    }

}

extension DiveCollectionViewController: UICollectionViewDataSource {

    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("lol", forIndexPath: indexPath) as! DiveCollectionViewCell
        
        cell.titleLabel.text = "NO \(indexPath.row)"
        
        return cell
    }

}