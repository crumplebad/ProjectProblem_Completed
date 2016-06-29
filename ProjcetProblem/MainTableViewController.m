//
//  MainTableViewController.m
//  ProjectProblem
//
//  Created by Michael on 11/3/15.
//  Copyright © 2015 Michael. All rights reserved.
//

#import "MainTableViewController.h"
#import "UIColor+Cortica.h"
#import "Logger.h"

@interface MainTableViewController (){

    NSMutableArray *gFileList;
    NSMutableArray *gFileColorList;
}


@end

@implementation MainTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [Logger logLine:self.subpath];
    [self populateData];
}

- (void)populateData {
    if (self.subpath == nil) {
        self.subpath = [[NSBundle mainBundle] bundlePath];
    }
    gFileList = [NSMutableArray new];
    gFileColorList = [NSMutableArray new];
    NSArray *directoryContent = [[NSFileManager defaultManager] contentsOfDirectoryAtPath:self.subpath error:NULL];

    for (id file in directoryContent) {
        [gFileList addObject:file];
        [gFileColorList addObject:[UIColor colorForFileExt:[file pathExtension]]];//Alternatively use dictionary to store UIColor, with ext as key
        //I did not create File class add color @property to it, bcoz color is not property of a given file, it's a property of the file type/ext. Hence decide to mainta two separate arrays.
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return gFileList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath  {
    NSString *filename = gFileList[indexPath.row];
    cell.textLabel.textColor = gFileColorList[indexPath.row];
    cell.textLabel.text = filename;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *append = gFileList[indexPath.row];
    NSString *newPath = [NSString stringWithFormat:@"%@/%@",self.subpath,append];

    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    MainTableViewController * controller = [storyboard instantiateViewControllerWithIdentifier:@"fileTable"];
    controller.subpath = newPath;
    [self.navigationController pushViewController:controller animated:YES];
}

@end