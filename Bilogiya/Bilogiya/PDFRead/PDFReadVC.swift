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
    let text = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(pdfView)
        guard let url = Bundle.main.url(forResource: text, withExtension: "pdf") else {return}
        guard let document = PDFDocument(url: url) else {return}
        pdfView.document = document
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pdfView.frame = view.bounds
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
