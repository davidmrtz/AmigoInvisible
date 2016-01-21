

import UIKit

class DetailsPerViewController: UIViewController {
    
    
    @IBOutlet weak var titleTextField: UITextField!
    
    var nombrearray3 = String()
    var todoDataP:NSDictionary = NSDictionary()
    
    @IBOutlet weak var descriptionTextField: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
        titleTextField.text=todoDataP.objectForKey("nombre") as? String
        
        
        descriptionTextField.text=todoDataP.objectForKey("preferencias") as? String
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
        
        
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let mutableItemList: NSMutableArray = NSMutableArray()
        
        mutableItemList.removeObject(todoDataP)
        userDefault.removeObjectForKey(nombrearray3)
        userDefault.setObject(mutableItemList, forKey: nombrearray3)
        userDefault.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
  
    
}
