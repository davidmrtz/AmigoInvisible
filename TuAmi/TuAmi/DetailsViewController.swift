

import UIKit
extension CollectionType {
    /// Return a copy of `self` with its elements shuffled
    func shuffle() -> [Generator.Element] {
        var list = Array(self)
        list.shuffleInPlace()
        return list
    }
}

extension MutableCollectionType where Index == Int {
    /// Shuffle the elements of `self` in-place.
    
    mutating func shuffleInPlace() {
        // empty and single-element collections don't shuffle
        if count < 2 { return }
        
        for i in 0..<count - 1 {
            let j = Int(arc4random_uniform(UInt32(count - i))) + i
            guard i != j else { continue }
            swap(&self[i], &self[j])
        }
    }
}
class DetailsViewController: UIViewController {
    
    
    

    
    @IBOutlet weak var titleTextField: UITextField!
    
    @IBOutlet weak var descriptionTextField: UITextView!
    var todoData:NSDictionary = NSDictionary()
    
    var toDoItems:NSMutableArray = NSMutableArray()
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let toDoItemList:NSMutableArray? = userDefaults.objectForKey(titleTextField.text!) as? NSMutableArray
        
        if (toDoItemList != nil) {
            toDoItems=toDoItemList!
            print("lista",toDoItems)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

      titleTextField.userInteractionEnabled=false
        descriptionTextField.userInteractionEnabled=false
        
      titleTextField.text=todoData.objectForKey("nombre") as? String
        
      descriptionTextField.text=todoData.objectForKey("importemaximo") as? String
       
       
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

    
    @IBAction func buttonSorteo(sender: AnyObject) {    
        print(toDoItems.count)
        var n = 0
        var numbers = [0,1,2,3,4,5,6,7]
        var array = [0,1,2,3,4,5,6,7]
        
            repeat{
                
                while (n <= array.count - 1){
                    
                    if (numbers[n] == array[n]){
                        numbers.shuffleInPlace()
                        n = 0
                    }else{ n = n + 1
                    }
                }
                
            }while(numbers[n-1] == array[n-1])
            print(array)
            print(numbers)
        }

}