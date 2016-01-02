<br/>
CoreNavVC（关注[信息公告牌](https://github.com/CharlinFeng/Show)）
===============
.Objective-c<br/><br/>
.Xcode 7

<br/><br/><br/> 
框架演示
===============

![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/1.gif)<br /><br />

<br/><br/><br/> 
框架说明
===============

注：请直接拖拽CoreNavVC文件夹到你的项目即可,不支持pod。


>1.原创框架，依赖CoreStatus监听网络，直接即可使用。<br />
>2.全自动滑动返回，使用runtime实现，高效完美。<br />
>3.仿QQ网络监听并显示网络视图。
>4.封装更新好的显示与隐藏导航栏。
>5.更好的把控导航条内部控件。
>6.增加分类更方便的增加返回功能。
>7.一键集成透明导航栏。
>8.一键集成下拉放大，并实现对任意UIView的操纵，而不仅仅是UIImageView。
<br/><br/><br/> 

使用说明
===============
<br/><br/>
####1.导入
直接拖拽CoreNavVC文件夹到您项目中，并集成CoreStatus即可。



<br/><br/>
####2.显示与聊天导航条
由于封装的要求，你的显示与隐藏导航条应该是统一放在一个控制器内部，并实现对称性：
注：由于有滑动返回手势的存在，所以最好按如下方式控制导航条的隐藏与还原;

    -(void)viewWillAppear:(BOOL)animated{
        
        [super viewWillAppear:animated];
        
        [self.navigationController showNavBarWithAnim:NO];
    }
    -(void)dealloc{
        [self removeScrollNavbarWithScrollView:self.tableView];
        [self.navigationController showNavBarWithAnim:YES];
    }

<br/><br/>
####3.添加一个顶部视图
您需要特别注意的是，有以下四点：
(1).您的控制器必须是UIViewController或其子类，不能直接是UITableViewController
(2).顶部视图不可会成为tableView的tableViewHeaderView添加。框架使用runtime做了成员属性，
任意UIViewController都有一个叫topView的成员属性，直接把您的顶部视图使用这个指针引用即可。
您也不需要为这个视图添加约束，因为他是基于frame管理计算。此外，你还不需要指定frame。
你只需如下操作即可;

    self.topView = [HeaderTopView topView];

(3).调用方法一键集成下拉放大效果：

    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:30 topView:self.topView originHeight:200];

其中，autoToggleNavbarHeight指的是下拉多大距离导航条开始动态改变透明度。
originHeight表示您的顶部视图topView你希望有多高。

##### 特别说明，如何才能产生下拉放大效果？
其实下拉放大有很多种效果，有的是直接拉imageView，但更多的app的下拉放大，您会发现拉的imageView的顶部还有很多其他控件，现实中就不是拉一个imageView这么简单。
我在制作本框架思考了很多天，最终使用了一个比较聪明的方法，此方法可以兼容一切下拉放大效果，请注意他的本质，没并有拉任何imageView。框架内部是将刚刚您的topView执行了高度layout操作。当然topView被layout了，其内部的子控件也会相应被layout，需要产生下拉放大效果，您需要将imageView和topView的高度关联。同时请注意一些子控件如果不需要动态layout，请设置子控件的约束从topView的底部为标准来约束。



<br/><br/><br/> 
重要事项
===============
框架使用了KVO，请注意一定在在生命周期中remove监听，就是上面dealloc里面的那个方法。
