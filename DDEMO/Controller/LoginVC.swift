import UIKit

class LoginVC: UIViewController {
    // hello
    @IBOutlet var userName_textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    @IBAction func pressBtn(_ sender: Any) {
        if userName_textField.text == "" {
            print("failed")
        }
        else {
            performSegue(withIdentifier: "show_P2", sender: sender)
        }
    
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination as? MainVC
        controller?.title_text = userName_textField.text
    }
}

