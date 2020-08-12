import UIKit
import PDFKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.lightGray

        let pdfView = PDFView(frame: self.view.bounds)
        pdfView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(pdfView)
        
        pdfView.autoScales = true
        
        let fileURL = Bundle.main.url(forResource: "Dummy", withExtension: "pdf")
        pdfView.document = PDFDocument(url: fileURL!)
    }
    
    @IBAction func ShareButtonTapped(_ sender: Any) {
        let fileURL = Bundle.main.url(forResource: "Dummy", withExtension: "pdf")
        let activityViewController = UIActivityViewController(activityItems: [fileURL!], applicationActivities: nil)
        self.present(activityViewController, animated: true, completion: nil)
    }
    
}
