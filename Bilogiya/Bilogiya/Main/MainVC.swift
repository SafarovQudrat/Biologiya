//
//  MainVC.swift
//  Bilogiya
//
//  Created by MacBook Pro on 25/02/24.
//

import UIKit
import PDFKit
import StoreKit
class MainVC: UIViewController {

    @IBOutlet weak var collectionV: UICollectionView!
    
    var item: [BooksDM] = [
        BooksDM(image: UIImage(named: "Biologiya 5")!, title: "Botanika 5", text: "5-sinf biologiya"),
        BooksDM(image: UIImage(named: "Biologiya 6")!, title: "Bilogiya 6", text: "botanika 6"),
        BooksDM(image: UIImage(named: "Biologiya 7")!, title: "Zoologiya 7", text: "zoologiya 7"),
        BooksDM(image: UIImage(named: "Biologiya 8")!, title: "Bilogiya 8", text: "Biologiya 8"),
        BooksDM(image: UIImage(named: "Biologiya 9")!, title: "Bilogiya 9", text: "Bilogiya 9"),
        BooksDM(image: UIImage(named: "Biologiya 10")!, title: "Bilogiya 10", text: "Bilogiya 10"),
        BooksDM(image: UIImage(named: "Biologiya 11")!, title: "Bilogiya 10", text: "Bilogiya 11"),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionV.delegate = self
        collectionV.dataSource = self
        collectionV.register(UINib(nibName: "BooksCVC", bundle: nil), forCellWithReuseIdentifier: "BooksCVC")
        setNavBar()
    }

    
    func setNavBar(){
        if #available(iOS 13.0, *) {
            let apparence = UINavigationBarAppearance()
            apparence.configureWithOpaqueBackground()
            apparence.backgroundColor = .systemBackground
            self.navigationItem.standardAppearance = apparence
            self.navigationItem.scrollEdgeAppearance = apparence
        } else {
            // Fallback on earlier versions
        }
        
        navigationItem.title = "Kitoblar"
        if #available(iOS 13.0, *) {
            let rateBtn = UIBarButtonItem(image: UIImage(systemName: "star"), style: .done, target: self, action: #selector(rateTapped))
            let shareBtn = UIBarButtonItem(image: UIImage(named: "share"), style: .done, target: self, action: #selector(shareTapped))
            self.navigationItem.leftBarButtonItem = shareBtn
            self.navigationItem.rightBarButtonItem = rateBtn
        }
       
        
    }

    @objc func rateTapped(){
        if #available(iOS 14.0, *) {
            guard let scane = view.window?.windowScene else {return}
            SKStoreReviewController.requestReview(in: scane)
        } else {
            // Fallback on earlier versions
        }
    }
    @objc func shareTapped(){
        
        guard let url = URL(string: "www.google.com") else {return}
        guard let image = UIImage(named: "AppIcon") else {return}
        let sharesheetVC = UIActivityViewController(activityItems: [url,image], applicationActivities: nil)
        present(sharesheetVC, animated: true)
    }
    

}
extension MainVC: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = PDFReadVC()
        vc.navTitle = item[indexPath.item].title
        vc.text = item[indexPath.item].text
        self.navigationItem.backButtonTitle = ""
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        item.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BooksCVC", for: indexPath) as? BooksCVC else {return UICollectionViewCell()}
        cell.updateCell(book: item[indexPath.item])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (self.collectionV.frame.width - 16)/2, height: 1.8 * self.collectionV.frame.height/5 )
    }
    
    
}
