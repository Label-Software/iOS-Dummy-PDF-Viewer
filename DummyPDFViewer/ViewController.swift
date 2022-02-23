import UIKit
import PDFKit

class ViewController: UIViewController {
    
    let fileUrl: URL? = Bundle.main.url(forResource: "Dummy", withExtension: "docx")

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray

        let pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(pdfView)
        
        pdfView.autoScales = true
        if let documentUrl = fileUrl {
            pdfView.document = PDFDocument(url: documentUrl)
        }
    }
    
    @IBAction func ShareButtonTapped(_ sender: Any) {
        let activityViewController = UIActivityViewController(activityItems: [fileUrl!], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
}
