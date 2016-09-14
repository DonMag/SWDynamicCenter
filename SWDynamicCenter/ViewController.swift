//
//  ViewController.swift
//  SWDynamicCenter
//
//  Created by DonMag on 9/14/16.
//  Copyright © 2016 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var theTable: UITableView!
	
	@IBOutlet weak var tableHeight: NSLayoutConstraint!
	
	var nRows = 8
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		let h = 44 * self.nRows
		self.tableHeight.constant = CGFloat(h)
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func doGrow(sender: AnyObject) {
		
		nRows += 1
		theTable.reloadData()
		dispatch_async(dispatch_get_main_queue(), { () -> Void in
			
			let h = 44 * self.nRows
			self.tableHeight.constant = CGFloat(h)
			
		})
		
	}
	
	@IBAction func doShrink(sender: AnyObject) {
		
		nRows -= 1
		theTable.reloadData()
		dispatch_async(dispatch_get_main_queue(), { () -> Void in
			
			let h = 44 * self.nRows
			self.tableHeight.constant = CGFloat(h)
			
		})
		
	}
	
	
	func numberOfSectionsInTableView(tableView: UITableView) -> Int {
		// #warning Incomplete implementation, return the number of sections
		return 1
	}
	
	func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		// #warning Incomplete implementation, return the number of rows
		return nRows
	}
	
	
	func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCellWithIdentifier("MyCell", forIndexPath: indexPath)
		
		// Configure the cell...
		
		cell.textLabel?.text = "Row \(indexPath.row)"
		
		return cell
	}
	

}

