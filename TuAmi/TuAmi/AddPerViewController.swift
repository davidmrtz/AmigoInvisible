

import UIKit

class AddPerViewController: UIViewController {
    @IBOutlet weak var tastTitle: UITextField! = UITextField()
    
    @IBOutlet weak var taskDetails: UITextView! = UITextView()
    
    @IBOutlet weak var button: UIBarButtonItem!
 
    

    override func viewDidLoad() {
        //self.navigationItem.rightBarButtonItem = nil
        super.viewDidLoad()
        if((tastTitle.text) != nil) {
          self.navigationItem.rightBarButtonItem?.accessibilityActivate()
        }
       
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonClick(sender: AnyObject) {
    
        
        let userdefaults:NSUserDefaults = NSUserDefaults.standardUserDefaults();
        
        var itemList:NSMutableArray? = userdefaults.objectForKey("ListaPersonas") as?NSMutableArray
        if (tastTitle.text != "" && taskDetails.text != ""){
        let dataSet:NSMutableDictionary = NSMutableDictionary()
        dataSet.setObject(tastTitle.text!, forKey: "nombre")
        dataSet.setObject(taskDetails.text!, forKey: "preferencias")
        
       
        
        
        if((itemList) != nil){
            
            let newMutableList: NSMutableArray = NSMutableArray()
            
            for dict:AnyObject in itemList!{
                newMutableList.addObject(dict as! NSDictionary)
            }
            
            userdefaults.removeObjectForKey("ListaPersonas")
            newMutableList.addObject(dataSet)
            userdefaults.setObject(newMutableList, forKey: "ListaPersonas")
            
        }else{
           
            itemList=NSMutableArray()
            itemList!.addObject(dataSet)
            userdefaults.setObject(itemList, forKey: "ListaPersonas")
            
        }
        
        userdefaults.synchronize()
        self.navigationController?.popViewControllerAnimated(true)
    }
    }
    
    
}
