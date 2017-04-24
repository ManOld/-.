//
//  Nav.m
//  sousuo
//
//  Created by admin on 2017/4/24.
//  Copyright © 2017年 admin. All rights reserved.
//

#import "Nav.h"

@interface Nav ()

@end

@implementation Nav

-(instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    self=[super initWithRootViewController:rootViewController];
    if (self) {
        UINavigationBar *bar = [[UINavigationBar alloc]init];
        bar.tintColor=[UIColor colorWithRed:22.0/255 green:160.0/255 blue:3.0/255 alpha:1] ;
        bar.barTintColor=[UIColor colorWithRed:43.0/255 green:42.0/255 blue:47.0/255 alpha:1];
        [self setValue:bar forKey:@"navigationBar"];
    }
    return self;
}

-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    UIBarButtonItem *item = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemSearch target:self action:@selector(clickTheItem)];
    viewController.navigationItem.leftBarButtonItem=item;
    [super pushViewController:viewController animated:YES];
}

-(void)clickTheItem{
    [super popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(UIStatusBarStyle)preferredStatusBarStyle{
    return UIStatusBarStyleLightContent;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
