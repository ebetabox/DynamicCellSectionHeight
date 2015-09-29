//
//  TableViewController.m
//  DynamicSectionHeaderHeight
//
//  Created by Emilio on 29/09/15.
//  Copyright © 2015 Sample. All rights reserved.
//

#import "TableViewController.h"
#import "SampleCell.h"
#import "SampleHeader.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
	[super viewDidLoad];

	[self.tableView registerNib:[UINib nibWithNibName:@"SampleCell" bundle:nil] forCellReuseIdentifier:@"SampleCell"];
	[self.tableView registerNib:[UINib nibWithNibName:@"SampleHeader" bundle:nil] forHeaderFooterViewReuseIdentifier:@"SampleHeader"];

	self.tableView.estimatedRowHeight = 20;
	self.tableView.rowHeight = UITableViewAutomaticDimension;

	self.tableView.sectionHeaderHeight = UITableViewAutomaticDimension;
	self.tableView.estimatedSectionHeaderHeight = 10;

	self.tableView.dataSource = self;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	SampleCell *cell = (SampleCell *)[tableView dequeueReusableCellWithIdentifier:@"SampleCell" forIndexPath:indexPath];

	// Configure the cell...
	cell.label.text = [self randomLenghtString];

	return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
	SampleHeader *header = (SampleHeader * )[tableView dequeueReusableHeaderFooterViewWithIdentifier:@"SampleHeader"];

	switch (section) {
  		case 0:
			header.label.text = @"Section 1. It has a short title.";
		break;

		case 1:
			header.label.text = @"Section 2. It has a medium tilte, the view will grow to addapt";
			break;

		case 2:
			header.label.text = @"Section 3. It has a extra large title, the view will grow to addapt follwoing the autolayout constraints that we have set in the interface builder";
		break;

  		default:
			header.label.text = @"Default header title";
		break;
	}

	return header;
}


- (NSString *)randomLenghtString{
	NSUInteger r = arc4random_uniform(5);

	NSString *baseString = @"Sample cell with variable amount of text to demostrate the dynamic height of for the cell.";

	NSMutableString *mutableText = [[NSMutableString alloc] initWithString:baseString];

	for (int i=0; i<r; i++) {
		[mutableText appendString:baseString];
	}

	return mutableText;
}


@end
