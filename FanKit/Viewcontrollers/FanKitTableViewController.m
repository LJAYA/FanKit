//
//  FanKitTableViewController.m
//  FanKit
//
//  Created by 向阳凡 on 16/7/5.
//  Copyright © 2016年 凡向阳. All rights reserved.
//

#import "FanKitTableViewController.h"
#import "FanKit.h"
#import "FanCommonViewController.h"

@interface FanKitTableViewController ()

@property(nonatomic,strong)NSMutableArray *dataArray;
@property(nonatomic,strong)NSMutableArray *detailArray;



@end

@implementation FanKitTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.view.backgroundColor=[UIColor whiteColor];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    //@"UIKit",@"Core",@"Libs
    self.dataArray=[@[@[@"Create Control",@"AutoLayout",@"VC Category"] ,@[@"Animation",@"Byte Core/File Operation",@"Time/Date"] ,@[@"Swiperble",@"GesturePassword",@"Alert",@"DragBubble",@"sideslip"] ] mutableCopy];
    self.detailArray=[@[@[@"FanUIKit.h",@"UIView+FanAutoLayout.h",@"UIViewController+FanRoot.h"] ,@[@"FanAnimationToll.h",@"FanDataTool.h",@"NSString+FanTime.h"] ,@[@"FanSwiperbleView.h",@"FanGesturePasswordView.h",@"FanShowView",@"FanDragBubbleView.h",@"FanSideslipManager.h"] ] mutableCopy];

//    [self.tableView registerNib:[UINib nibWithNibName:@"" bundle:nil] forCellReuseIdentifier:@"Cell"];
//    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    
    
//    NSString *ipon=[FanUIKit fan_platformString];
    
//    self.tableView.tableHeaderView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, FanScreenWidth, 0.1)];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
//#warning Incomplete implementation, return the number of sections
    return 3;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0001;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return [(NSArray *)self.dataArray[section] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;

    cell.textLabel.text=self.dataArray[indexPath.section][indexPath.row];
    cell.detailTextLabel.text=self.detailArray[indexPath.section][indexPath.row];
    return cell;
}
//-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
//    
//    return nil;
//}
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section) {
        case 0:
        {
            return @"UIKit";
        }
            break;
        case 1:
        {
            return @"Core";
        }
            break;
        case 2:
        {
            return @"Libs";
        }
            break;
            
        default:
            return @"";
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
    }else if (indexPath.section==1){
        if (indexPath.row==0) {
            [self fan_jumpCommonViewController:@{@"Title":@"Animation",@"Class":@"FanAnimationToll.h/m",@"Demo":@"https://github.com/fanxiangyang/FanAnimationToll"}];
        }
    }else if (indexPath.section==2){
        if (indexPath.row==0) {
            [self fan_jumpVCWithName:@"FanSwiperbleViewController"];
        }else if (indexPath.row==1) {
            [self fan_jumpVCWithName:@"FanGesturePasswordViewController"];
        }else if (indexPath.row==2) {
            [self fan_jumpCommonViewController:@{@"Title":@"FanShowView",@"Class":@"FanShowView文件夹",@"Demo":@"https://github.com/fanxiangyang/FanShowView"}];
        }else if (indexPath.row==4) {
            [self fan_jumpCommonViewController:@{@"Title":@"FanSideslipManager",@"Class":@"FanSideslipManager.h/m",@"Demo":@"https://github.com/fanxiangyang/FanQQSideslipManager"}];
        }
    }
    
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
-(void)fan_jumpCommonViewController:(NSDictionary *)dic{
    FanCommonViewController *cVC=[[FanCommonViewController alloc]init];
    cVC.rootDictionary=dic;
    [self.navigationController pushViewController:cVC animated:YES];
}
-(void)fan_jumpVCWithName:(NSString *)name{
    UIViewController *vc=[FanUIKit fan_classFromName:name];
    if (vc) {
        [self.navigationController pushViewController:vc animated:YES];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
