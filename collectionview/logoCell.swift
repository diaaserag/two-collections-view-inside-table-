//
//  logoCell.swift
//  collectionview
//
//  Created by diaa on 09/08/2021.
//

import UIKit

class logoCell: UITableViewCell,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    var arrlogo = [UIImage]()
    @IBOutlet weak var collectionPHone: UICollectionView!
    @IBOutlet weak var collectionLogo: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        collectionLogo.delegate = self
        collectionLogo.dataSource = self
        collectionPHone.delegate = self
        collectionPHone.dataSource = self
        starttime()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func seenddata(imgs:[UIImage]){
        self.arrlogo = imgs
    }
    var arrphons = [UIImage]()
    var arrnames = [String]()
    func recevdata(phoneImag : [UIImage],phonesName:[String]){
        self.arrnames = phonesName
        self.arrphons = phoneImag
    }
    //MARK:- SCROL AUTO
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    func starttime(){
        let _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(moveAuto), userInfo: nil, repeats: true)
    }

    var currentIndex = 0
    @objc func moveAuto(){
        if currentIndex < arrlogo.count - 1{
            currentIndex += 1
        }
        else{
            currentIndex = 0
        }
        self.collectionLogo.isPagingEnabled = false
        collectionLogo.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredHorizontally, animated: true)
       self.collectionLogo.isPagingEnabled = true
        collectionPHone.scrollToItem(at: IndexPath(item: currentIndex, section: 0), at: .centeredVertically, animated: true)
    }
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    //>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
}
extension logoCell{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionLogo{
        return arrlogo.count
        }
            return arrphons.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView.tag == 1{
        let cell = collectionLogo.dequeueReusableCell(withReuseIdentifier: "colcCell", for: indexPath)as! collectionLOGO
        cell.imagLogo.image = arrlogo[indexPath.row]
            return cell
        }
        else{
        let cellw = collectionPHone.dequeueReusableCell(withReuseIdentifier: "phonecell", for: indexPath)as! phoneCell
            cellw.imagePhone.image = arrphons[indexPath.row]
            cellw.lablPHoneName.text = arrnames[indexPath.row]
            return cellw
        }
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == self.collectionLogo{
        return CGSize(width: self.collectionLogo.frame.width, height: 200)
        }
        else{
            return CGSize(width: self.collectionPHone.frame.width * 0.9, height: 300)
        }
        }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let kind = UICollectionView.elementKindSectionHeader
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "res", for: indexPath) as! CollectionReusableView
            header.lablforCompany.text = "Iphone"
        header.backgroundColor = #colorLiteral(red: 0.9607843161, green: 0.7058823705, blue: 0.200000003, alpha: 1)
            return header
        }
        
    }


