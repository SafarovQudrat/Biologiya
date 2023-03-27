//
//  MainVC.swift
//  Bilogiya
//
//  Created by MacBook Pro on 25/02/24.
//

import UIKit
import PDFKit

class MainVC: UIViewController {

    @IBOutlet weak var collectionV: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(UINib(nibName: "BooksCVC", bundle: nil), forCellWithReuseIdentifier: "BooksCVC")
        setNavBar()
    }

    
    func setNavBar(){
        let apparence = UINavigationBarAppearance()
        apparence.configureWithOpaqueBackground()
        apparence.backgroundColor = .white
        self.navigationItem.standardAppearance = apparence
        self.navigationItem.scrollEdgeAppearance = apparence
        navigationItem.title = "Kitoblar"
    }

   

}
extension MainVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        7
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCVC", for: indexPath) as? BooksCVC else {return UICollectionViewCell()}
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.collectionV.frame.width - 16)/2, height: self.collectionV.frame.height/3 )
    }
    
    
}
