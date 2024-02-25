//
//  PDFReadVC.swift
//  Bilogiya
//
//  Created by MacBook Pro on 25/02/24.
//

import UIKit
import PDFKit
class PDFReadVC: UIViewController {

    let pdfView = PDFView()
    var text = "5-sinf biologiya"
    var navTitle = "5-sinf biologiya"
    override func viewDidLoad() {
        super.viewDidLoad()
       setNavBar()
        setPdfView()
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }

    func setNavBar(){
        if #available(iOS 13.0, *) {
            let apparence = UINavigationBarAppearance()
            apparence.configureWithOpaqueBackground()
            apparence.backgroundColor = .white
            self.navigationItem.standardAppearance = apparence
            self.navigationItem.scrollEdgeAppearance = apparence

        } 
                navigationItem.title = navTitle
    }
    
    func setPdfView(){
        view.addSubview(pdfView)
        pdfView.autoScales = true
        guard let url = Bundle.main.url(forResource: text, withExtension: "pdf") else {return}
        guard let document = PDFDocument(url: url) else {return}
        pdfView.document = document
    }
    
  

}
