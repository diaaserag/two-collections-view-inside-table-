//
//  ViewController.swift
//  collectionview
//
//  Created by diaa on 09/08/2021.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var arrall = [allData]()
    @IBOutlet weak var tableViewContainer: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewContainer.delegate = self
        tableViewContainer.dataSource = self
        arrall.append(allData(logo: [UIImage(named: "1")!,UIImage(named: "2")!,UIImage(named: "3")!]))
    }

    }

extension ViewController{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrall.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableViewContainer.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)as! logoCell
        let dd = arrall[indexPath.row]
        cell.seenddata(imgs:dd.logo)
        cell.recevdata(phoneImag: dd.phonsImag, phonesName: dd.phonsName)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(self.view.frame.height)
    }
}



struct allData {
    let logo : [UIImage]
    let phonsImag : [UIImage] = [UIImage(named: "4")!,UIImage(named: "7")!,UIImage(named: "8")!]
    let phonsName : [String] = ["Apple iPhone 11 with FaceTime - 128GB, 4GB RAM, 4G LTE, Black","Samsung Galaxy Note 10 Dual SIM - 256GB, 8GB RAM, 4G LTE, Aura Black","Sony Xperia 1 J9110 128GB 6GB RAM International Version - White"]
    
}
