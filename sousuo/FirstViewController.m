//
//  ViewController.m
//  搜索
//
//  Created by admin on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()<UITableViewDelegate,UITableViewDataSource,UISearchResultsUpdating>
@property (nonatomic, strong) UISearchController *searchController;
@property (nonatomic, strong) UITableView *tv;
@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
  
    self.view.backgroundColor=[UIColor whiteColor];
    
    UITableView *tv=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
    tv.delegate=self;
    tv.dataSource=self;

    
    self.searchController = [[UISearchController alloc]initWithSearchResultsController:nil];
    
    self.searchController.searchBar.frame = CGRectMake(0, 0, 0, 30);
    

 
    
//  修改Searchbar的背景色
    self.searchController.searchBar.barTintColor=[UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1] ;

    
 /*****去掉self.searchController.searchBar上下的两条黑线***********/
    UISearchBar *searchBar = self.searchController.searchBar;
    UIImageView *barImageView = [[[searchBar.subviews firstObject] subviews] firstObject];
    barImageView.layer.borderColor = [UIColor colorWithRed:235.0/255 green:235.0/255 blue:241.0/255 alpha:1].CGColor;
    barImageView.layer.borderWidth = 1;
 
    
    
    //搜索时，背景变暗色
    self.searchController.dimsBackgroundDuringPresentation = NO;
    //搜索时，背景变模糊
    self.searchController.obscuresBackgroundDuringPresentation = NO;
    //背景颜色
    self.searchController.searchResultsUpdater = self;
   [self.searchController.searchBar sizeToFit];
    
   
    //搜索栏表头视图
    tv.tableHeaderView = self.searchController.searchBar;
    
    

//  去掉多余的tableView
    tv.tableFooterView=[[UIView alloc]init];
    
    [tv registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [self.view addSubview:tv];
    self.tv=tv;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.searchController.active) {
        return  3;
    }else{
        return 5;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text=[self str];
    cell.textLabel.textColor=self.navigationController.navigationBar.tintColor=[UIColor colorWithRed:22.0/255 green:160.0/255 blue:3.0/255 alpha:1] ;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0;
}

-(CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 30;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(NSString *)str{
    NSDate *date = [NSDate date];
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    formatter.dateFormat = @"YYYY-MM-dd HH:mm:ss";
    NSString *str = [formatter stringFromDate:date];
    return str;
}

- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    if (searchController.active) {
        
//        显示取消按钮。英文变中文
        self.searchController.searchBar.showsCancelButton=YES;
        UIButton *canceLBtn = [self.searchController.searchBar valueForKey:@"cancelButton"];
        [canceLBtn setTitleColor:[UIColor colorWithRed:22.0/255 green:160.0/255 blue:3.0/255 alpha:1]
                        forState:UIControlStateNormal];
        [canceLBtn setTitle:@"取消" forState:UIControlStateNormal];
    }
    
    //刷新表格
    [self.tv reloadData];

}

-(UIStatusBarStyle)preferredStatusBarStyle{
    if (self.searchController.active) {
        return UIStatusBarStyleDefault;
    }else{
    return UIStatusBarStyleLightContent;
}
}
@end
