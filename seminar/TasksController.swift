//
//  TasksController.swift
//  seminar
//
//  Created by Scott Fox on 10/11/18.
//  Copyright © 2018 Scott Fox. All rights reserved.
//

import UIKit

class TasksController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    class Task{
        var description = ""
        var complete = false
        init( desc: String ) {
            self.description = desc
        } // end constructor
    } // end class
    
    var tasks:[ Task ] = []
    
    @IBOutlet weak var taskIn: UITextField!
    @IBOutlet weak var tasksTable: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ( tasks.count )
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default , reuseIdentifier: "taskCell")
        //set text to task description
        cell.textLabel?.text = tasks[ indexPath.row ].description
        // set background color based on task completion
        if tasks[ indexPath.row ].complete {
            cell.backgroundColor = UIColor( red: 0.0, green: 1.0, blue: 0.0, alpha: 1.0)
        } else { cell.backgroundColor = UIColor( red: 1.0, green: 0.0, blue: 0.0, alpha: 1.0)
            
        }
        return(cell)
    }
    

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var url: St

        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print( "row selected" + String (indexPath.row ) )
        tasks[ indexPath.row ].complete = !tasks[ indexPath.row ].complete
        tasksTable.reloadData()
    }
    
    
    @IBAction func addTaskTouch(_ sender: UIButton) {
        // create newTask as an istance of the Task class
        let newTask = Task( desc: taskIn!.text!  )
        print ( "adding task: " + newTask.description )
        // add newTask to tasks array
        tasks.append( newTask )
        print( tasks )
        tasksTable.reloadData()
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
