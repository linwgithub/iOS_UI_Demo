//
//  ViewController.m
//  21-UITextField焦点转移
//
//  Created by linw on 16/8/20.
//  Copyright © 2016年 linw. All rights reserved.
//

#import "ViewController.h"
#import "KBToolBar.h"

@interface ViewController ()<KBToolBarDelegate>
@property (weak, nonatomic) IBOutlet UITextField *testfiled;

@property (weak, nonatomic) IBOutlet UIView *mainView;

@property (strong, nonatomic) KBToolBar *toolbar;
@property (strong, nonatomic) NSArray *fields;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"%s",__func__);
    
    self.testfiled.inputAccessoryView = self.toolbar;
    NSMutableArray *filesArray = [NSMutableArray array];
    
    //遍历UITextFiled添加键盘盘工具条
    for (UIView *subView in self.mainView.subviews) {
        if ([subView isKindOfClass:[UITextField class]]) {
            UITextField *tf = (UITextField *)subView;
            tf.inputAccessoryView = self.toolbar;
            //绑定tag
            tf.tag = filesArray.count;
            
            [filesArray addObject:tf];
        }
    }

    self.fields = filesArray;
    
    //监听键盘事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillHideNotification object:nil];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)kbToolBarClick:(KBToolBar *)kbtoolbar clickButton:(UIBarButtonItem *)barButton{
    NSLog(@"%s",__func__);
    switch (barButton.tag) {
        case 0:
            [self preViewTextField];
            break;
        case 1:
            [self nextTextField];
            break;
        case 2:
            
            break;
        default:
            break;
    }
}

- (void)preViewTextField{
    NSLog(@"%s",__func__);
    NSInteger currentIndex = [self getTextfieldIndex];

    self.toolbar.nextButton.enabled = YES;
    self.toolbar.previewButton.enabled = (currentIndex == 1);
    [self.fields[currentIndex -1] becomeFirstResponder];
}

- (void)nextTextField{
    NSLog(@"%s",__func__);
    NSInteger currentIndex = [self getTextfieldIndex];
    
    self.toolbar.previewButton.enabled = YES;
    self.toolbar.nextButton.enabled = (currentIndex == (self.fields.count -1));
    [self.fields[currentIndex +1] becomeFirstResponder];
}

/**
 *  键盘出现
 *
 *  @param notifi <#notifi description#>
 */
- (void)keyBoardWillShow:(NSNotification *)notifi{
    
//    NSInteger currentIndex = [self getTextfieldIndex];
//    self.toolbar.previewButton.enabled = (currentIndex != 0);
//    self.toolbar.nextButton.enabled = (currentIndex != self.fields.count -1);
//
//    UITextField *currentField = self.fields[[self getTextfieldIndex]];
//
//    //currentTf.frame.origin.y +  currentTf.frame.size.height
//    CGFloat maxY = CGRectGetMaxY(currentField.frame);
//    //+ self.mainView.frame.origin.y;
//    
//    //2.获取键盘的y值
//    CGRect kbEndFrm = [notifi.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
//    CGFloat kbY = kbEndFrm.origin.y;
//    
//    //3.进行比较
//    //计算距离
//    CGFloat delta = kbY - maxY;
//    if(delta < 0){//需要往上移
//        //添加个动画
//        [UIView animateWithDuration:0.25 animations:^{
//            self.view.transform = CGAffineTransformMakeTranslation(0, delta);
//        }];
//        
//    }

    
}

/**
 *  键盘消失
 *
 *  @param notifi <#notifi description#>
 */
- (void)keyBoardWillHide:(NSNotification *)notifi{
    NSLog(@"%s",__func__);
    /**
     *  恢复原状
     */
    self.view.transform = CGAffineTransformIdentity;
    
    /**
     *  恢复按钮点击能力
     */
    self.toolbar.previewButton.enabled = YES;
    self.toolbar.nextButton.enabled = YES;
}

//- (NSArray *)fields{
//    NSLog(@"%s",__func__);
//    if (_fields == nil) {
//        NSMutableArray *filesArray = [NSMutableArray array];
//        for (UIView *subView in self.mainView.subviews) {
//            if ([subView isKindOfClass:[UITextField class]]) {
//                UITextField *tf = (UITextField *)subView;
//                tf.inputAccessoryView = self.toolbar;
//                tf.tag = filesArray.count;
//                [filesArray addObject:tf];
//            }
//        }
//        _fields = filesArray;
//    }
//    return _fields;
//}


- (KBToolBar *)toolbar{
    NSLog(@"%s",__func__);
    if (!_toolbar) {
        _toolbar = [KBToolBar kbtoolBar];
        _toolbar.kbDelegate = self;
    }
    return _toolbar;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)getTextfieldIndex{
    NSLog(@"%s",__func__);
    for (UITextField *tf in self.fields) {
        if (tf.resignFirstResponder) {
            return tf.tag;
        }
    }
    return -1;
}

/**
 *  退出键盘
 */
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"%s",__func__);
    [self.view endEditing:YES];
}

@end
