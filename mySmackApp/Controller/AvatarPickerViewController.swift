//
//  AvatarPickerViewController.swift
//  mySmackApp
//
//  Created by Manyuchi, Carrington C on 2025/03/20.
//

import UIKit

class AvatarPickerViewController: UIViewController {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var avatarType = AvatarType.dark
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    

    @IBAction func backPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    
    @IBAction func segmentControlChanged(_ sender: UISegmentedControl) {
        if segmentControl.selectedSegmentIndex == 0 {
            avatarType = .dark
        } else {
            avatarType = .light
        }
        collectionView.reloadData()
    }
    
    
    
}


extension AvatarPickerViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 28
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "avatarCell", for: indexPath) as? AvatarPickerCollectionViewCell else {
            return AvatarPickerCollectionViewCell()
        }
        
        cell.configureCell(index: indexPath.item, type: avatarType)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        var numberOfcolumns: CGFloat = 3
        if UIScreen.main.bounds.width > 320 {
            numberOfcolumns = 4
        }
        
        let spacebetweenCells: CGFloat = 10
        let cellDimension: CGFloat = (collectionView.frame.width - (numberOfcolumns - 1) * spacebetweenCells) / numberOfcolumns
        return CGSize(width: cellDimension, height: cellDimension)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if avatarType == .dark {
            UserDataService.instance.setAvatarName(avatarName: "dark_\(indexPath.item)")
        } else {
            UserDataService.instance.setAvatarName(avatarName: "light_\(indexPath.item)")
        }
        
        self.dismiss(animated: true, completion: nil)
    }
    
    
}
