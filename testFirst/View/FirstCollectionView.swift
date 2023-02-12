//
//  FirstCollectionView.swift
//  testFirst
//
//  Created by Anton  on 08.02.2023.
//

import UIKit

class FirstCollectionView: UICollectionView {
    
    // Declare a flow layout for the collection view
    private let flowLayout = UICollectionViewFlowLayout()
    // Store the data for the labels
    private var labelData =  Data().getData()
    // Store the name to be shifted
    private var shiftedName = ""
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: .zero, collectionViewLayout: flowLayout)
        // Call the method to set the view
        setUpView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Method to set up the collection view
    private func setUpView() {
        // Set the minimum interitem spacing and scroll direction
        flowLayout.minimumInteritemSpacing = 12
        flowLayout.scrollDirection = .horizontal
        
        // Set the background color, translation properties and scroll indicator properties
        backgroundColor = .none
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        bounces = false
        
        // Set the delegate and data source
        delegate = self
        dataSource = self
        
        // Register the collection view cell
        register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
    }
}
    
extension FirstCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    // Return the number of items in the section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labelData.count
    }
    
    // Provide a cell for each item
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        // Check if the cell is an instance of CollectionViewCell
        if let cell = dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? CollectionViewCell {
            // Set the text of the cell
            cell.streamTitle.text = labelData[indexPath.item]
        
            return cell
        }
        return UICollectionViewCell()
    }
    
    // Shift the selected item to the first position
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shiftedName = labelData[indexPath.item]
        labelData.remove(at: indexPath.item)
        labelData.insert(shiftedName, at: 0)
        
        collectionView.moveItem(at: indexPath, to: IndexPath(item: 0, section: 0))
        collectionView.scrollToItem(at: IndexPath(item: 0, section: 0), at: .left, animated: true)
    }
    
    // Method to control the selection behavior of items in the collection view
    // Check if the selected cell is already selected and deselect it if true
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        if collectionView.cellForItem(at: indexPath)?.isSelected ?? false {
            collectionView.deselectItem(at: indexPath, animated: true)
            return false
        }
        return true
    }
    
    // Method to specify the size of cells in the collection view
    // Calculate the size for each cell based on the width of its label
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let font = UIFont(name: "Arial Bold", size: 14)
        let attributes = [NSAttributedString.Key.font : font as Any]
        let width = labelData[indexPath.item].size(withAttributes: attributes).width + 48

        return CGSize(width: width, height: 44)
    }
}
