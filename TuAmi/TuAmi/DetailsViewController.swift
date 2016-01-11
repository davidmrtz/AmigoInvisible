

import UIKit

class DetailsViewController: UIViewController {
   
    
    @IBOutlet weak var titleTextField: UITextField!
    
    
    @IBOutlet weak var descriptionTextField: UITextView!
    var todoData:NSDictionary = NSDictionary()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
        titleTextField.text=todoData.objectForKey("nombre") as? String
        
        
        descriptionTextField.text=todoData.objectForKey("importemaximo") as? String
       
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
    
        let DestViewController : PersonaTableViewController = segue.destinationViewController as! PersonaTableViewController
    DestViewController.nombreArray = titleTextField.text!
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteButtonClicked(sender: AnyObject) {
    
    
        
        let userDefault:NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let itemListArray:NSMutableArray = userDefault.objectForKey("ListaGrupos") as! NSMutableArray
        
        let mutableItemList: NSMutableArray = NSMutableArray()
        
        for dict:AnyObject in itemListArray{
            mutableItemList.addObject(dict as! NSDictionary)
        }
        
        mutableItemList.removeObject(todoData)
        userDefault.removeObjectForKey("ListaGrupos")
        userDefault.setObject(mutableItemList, forKey:"ListaGrupos")
        userDefault.synchronize()
        
        self.navigationController?.popViewControllerAnimated(true)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue!, sender: AnyObject!) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
