//
//  CollectionViewContentController.swift
//  PushUps
//
//  Created by Andrew Walker on 01/01/2017.
//  Copyright © 2017 Andrew Walker. All rights reserved.
//

import UIKit

internal final class CollectionViewContentController: NSObject, ContentController {
    
    // MARK: - Internal Properties
    
    internal var sections = [SectionContent]()
    internal var collectionView: UICollectionView?
    
    // MARK: - Internal Functions
    
    internal func configure(with collectionView: UICollectionView?) {
        collectionView?.delegate = self
        collectionView?.dataSource = self
        
        self.collectionView = collectionView
    }
    
    internal func reload() {
        self.collectionView?.reloadData()
    }
    
}

extension CollectionViewContentController: UICollectionViewDataSource {
    
    // MARK: - Internal Functions
    
    internal func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.numberOfSections()
    }
    
    internal func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.numberOfItems(in: section)
    }
    
    internal func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cellIdentifier = self.cellIdentifier(for: indexPath)
        let cell = self.collectionView?.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) ?? UICollectionViewCell()
        return cell
    }
    
}

extension CollectionViewContentController: UICollectionViewDelegate {
    
}
