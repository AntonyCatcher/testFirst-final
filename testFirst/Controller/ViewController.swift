
import UIKit

class ViewController: UIViewController, UISheetPresentationControllerDelegate {
    
    // MARK: - Properties
    
    // Identifiers for small, medium, and large detent options
    private let smallId = UISheetPresentationController.Detent.Identifier("small")
    private let mediumId = UISheetPresentationController.Detent.Identifier("medium")
    private let largeId = UISheetPresentationController.Detent.Identifier("large")
    
    // Reference to the SheetViewController
    private let selectedVC = SheetViewController()
    
    // Image view for the background image
    private let imgBackground: UIImageView = {
        let image = UIImageView()
        
        // Set the background image
        image.image = UIImage(named: "image")
       
        return image
    }()
    
    // MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setView()
 
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // Customize the detent options for the sheet presentation controller
        // Define the custom small detent
        let smallDetent = UISheetPresentationController.Detent.custom(identifier: smallId) { context in
            return 334
        }
        
        // Define the custom medium detent
        let mediumDetent = UISheetPresentationController.Detent.custom(identifier: mediumId) { context in
            return 510
        }
        
        // Define the custom large detent
        let largeDetent = UISheetPresentationController.Detent.custom(identifier: largeId) { context in
            return 768
        }
        
        // Check if the sheet presentation controller exists in the selected view controller
        if let sheet = selectedVC.sheetPresentationController {
            
            // Set the detents, preferred corner radius, and delegate for the sheet presentation controller
            sheet.detents = [mediumDetent, smallDetent, largeDetent]
            sheet.preferredCornerRadius = 24
            sheet.delegate = self
            
        }
        
        // Present the selected view controller
        present(selectedVC, animated: true)
    }
    
    private func setView() {
        
        // Set the frame of the background image view to cover the entire view
        imgBackground.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        
        // Add the background image view as a subview to the main view
        view.addSubview(imgBackground)
        
        Constraints()
        
    }
    
    private func Constraints() {
        
        // Disable autoresizing masks
        imgBackground.translatesAutoresizingMaskIntoConstraints = false
    
        NSLayoutConstraint.activate([
            
            imgBackground.leftAnchor.constraint(equalTo: view.leftAnchor),
            imgBackground.rightAnchor.constraint(equalTo: view.rightAnchor),
            imgBackground.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -194),
            imgBackground.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            
        ])
    }
    
    // MARK: - UISheetPresentationControllerDelegate
    
    func sheetPresentationControllerDidChangeSelectedDetentIdentifier(_ sheetPresentationController: UISheetPresentationController) {
        // Handle changes to the selected detent identifier
        switch sheetPresentationController.selectedDetentIdentifier {
        case largeId:
            selectedVC.secondCV.isHidden = false
            selectedVC.secondDesctiprion.isHidden = false
        case mediumId:
            selectedVC.secondCV.isHidden = false
            selectedVC.secondDesctiprion.isHidden = false
        case smallId:
            selectedVC.secondCV.isHidden = true
            selectedVC.secondDesctiprion.isHidden = true
        default:
            break
        }
    }
}



