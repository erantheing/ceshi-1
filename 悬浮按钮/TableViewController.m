
//
//  TableViewController.m
//  悬浮按钮
//
//  Created by etcxm on 2017/2/16.
//  Copyright © 2017年 erathe. All rights reserved.
//

#import "TableViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
@interface TableViewController ()
@property(strong,nonatomic)UIWindow *window;
@property(strong,nonatomic)UIButton *button;
@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self performSelector:@selector(createButton) withObject:nil afterDelay:1];
    
}

- (void)createButton
{
    _button = [UIButton buttonWithType:UIButtonTypeCustom];
    [_button setTitle:@"悬浮按钮" forState:UIControlStateNormal];
    _button.frame = CGRectMake(0, 0, 80, 80);
//    [_button addTarget:self action:@selector(resignWindow) forControlEvents:UIControlEventTouchUpInside];
      [_button addTarget:self action:@selector(dragMoving:withEvent: )forControlEvents: UIControlEventTouchDragInside];
    //放一个拖动手势，用来改变控件的位置
    _button.backgroundColor=[UIColor yellowColor];
    _window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    _window.windowLevel = UIWindowLevelAlert+1;
    _window.layer.cornerRadius = 40;
    _window.layer.masksToBounds = YES;
    [_window addSubview:_button];
    [_window makeKeyAndVisible];//关键语句,显示window
    
}


/**
 *  关闭悬浮的window
 */
//- (void)resignWindow
//{
//    
//    [_window resignKeyWindow];
//    _window = nil;
//    
//}
- (void) dragMoving: (UIButton *) c withEvent:ev
{
 
    c.center = [[[ev allTouches] anyObject] locationInView:self.view];
    NSLog(@"%f,,,%f",c.center.x,c.center.y);
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    FirstViewController *fir=[[FirstViewController alloc]init];
    [self.navigationController pushViewController:fir animated:YES];


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"cell"];
    }
    cell.textLabel.text=[NSString stringWithFormat:@"123"];
    return cell;
}

@end
