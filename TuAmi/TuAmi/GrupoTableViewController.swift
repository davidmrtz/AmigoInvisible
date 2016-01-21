

import UIKit

class GrupoTableViewController: UITableViewController {
    
    var toDoItems:NSMutableArray = NSMutableArray()
    
    override func viewDidAppear(animated: Bool) {
        let userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        let toDoItemList:NSMutableArray? = userDefaults.objectForKey("ListaGrupos") as? NSMutableArray
        
        if (toDoItemList != nil) {
            toDoItems=toDoItemList!
        }
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView?) -> Int {
        // #warning Potentially incomplete method implementation.
        // Return the number of sections.
        
        return 1
    }
    
    override func tableView(tableView: UITableView?, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete method implementation.
        // Return the number of rows in the section.
       
        return toDoItems.count
        
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cellid", forIndexPath: indexPath) as UITableViewCell
        
        
        let todoItem :NSDictionary = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
        
        
        
        cell.textLabel?.text = todoItem.objectForKey("nombre") as? String
        
        return cell
         
    }
    

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

        
        if(segue.identifier == "showDetails"){
        
            let indexPath:NSIndexPath = self.tableView.indexPathForSelectedRow!
            let detailViewController:DetailsViewController = segue.destinationViewController as! DetailsViewController
            
            detailViewController.todoData = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
           
        }
        
        else{
        
        }
        
    }
    
    
}
