//
//  ViewController.swift
//  SWDynamicCenter
//
//  Created by DonMag on 9/14/16.
//  Copyright © 2016 DonMag. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

	@IBOutlet weak var mainContainerView: UIView!
	@IBOutlet weak var contentContainerView: UIView!
	
	@IBOutlet weak var theTable: UITableView!
	@IBOutlet weak var buttonsContainerView: UIView!
	
	
	
	
	@IBOutlet weak var tableHeight: NSLayoutConstraint!
	
	var nRows = 8
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		
		self.theTable.hidden = true
		
#if DMDEBUG
	
	self.view.backgroundColor = UIColor.orangeColor()
	
	self.mainContainerView.backgroundColor = UIColor.blueColor()
	self.contentContainerView.backgroundColor = UIColor.cyanColor()
	self.buttonsContainerView.backgroundColor = UIColor.yellowColor()
	
#else
	
	self.view.backgroundColor = UIColor.darkGrayColor()
	
	self.mainContainerView.backgroundColor = UIColor.clearColor()
	self.contentContainerView.backgroundColor = UIColor.clearColor()
	self.buttonsContainerView.backgroundColor = UIColor.clearColor()
	
#endif
		
		
		let headerView = UIView(frame: CGRectMake(0, 0, 100, 40)) //was 40
		headerView.backgroundColor = UIColor.redColor()
		
		let label = UILabel()
		
		label.text = "Tue, Sep 20 - 1 of 1 Events"
		
		label.textAlignment = .Center
		label.frame = headerView.frame
		label.textColor = UIColor.whiteColor().colorWithAlphaComponent(0.7)
		
		label.font = label.font.fontWithSize(14)
		

		headerView.addSubview(label)
		
		theTable.tableHeaderView = headerView
		
		
		label.translatesAutoresizingMaskIntoConstraints = false
		
		let leadingConstraint = NSLayoutConstraint(item: label, attribute: .Leading, relatedBy: .Equal, toItem: headerView, attribute: .Leading, multiplier: 1, constant: 0)
		let trailingConstraint = NSLayoutConstraint(item: label, attribute: .Trailing, relatedBy: .Equal, toItem: headerView, attribute: .Trailing, multiplier: 1, constant: 0)
		let topConstraint = NSLayoutConstraint(item: label, attribute: .Top, relatedBy: .Equal, toItem: headerView, attribute: .Top, multiplier: 1, constant: 0)
		let bottomConstraint = NSLayoutConstraint(item: label, attribute: .Bottom, relatedBy: .Equal, toItem: headerView, attribute: .Bottom, multiplier: 1, constant: 0)

		headerView.addConstraints([leadingConstraint, trailingConstraint, topConstraint, bottomConstraint])

	}
	
	override func viewDidAppear(animated: Bool) {
		super.viewDidAppear(animated)
		
		self.theTable.tableHeaderView?.frame.size.width = self.theTable.frame.size.width
		
		self.adjustTableHeight()
		
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	func adjustTableHeight() -> Void {
		
		dispatch_async(dispatch_get_main_queue(), { () -> Void in

			var h = CGFloat(44 * self.nRows)
			if let hh = self.theTable.tableHeaderView?.frame.size.height {
				h += hh
			}
		
			self.tableHeight.constant = h
			
			self.theTable.hidden = false
			
		})
		
	}
	
	@IBAction func doGrow(sender: AnyObject) {
		
		nRows += 1
		theTable.reloadData()
		
		self.adjustTableHeight()
		
	}
	
	@IBAction func doShrink(sender: AnyObject) {
		
		nRows -= 1
		theTable.reloadData()
		
		self.adjustTableHeight()
		
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

