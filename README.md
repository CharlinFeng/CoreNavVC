
CoreNavVC  （连载中，关注[信息公告牌](https://github.com/CharlinFeng/Show)）
==========
### 成都时点软件4年精华无私奉献开源

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)]
[![Platform](https://cocoapod-badges.herokuapp.com/p/HanekeSwift/badge.png)]
[![Build Status](https://travis-ci.org/Haneke/HanekeSwift.svg?branch=master)]
[![Join the chat at https://gitter.im/Haneke/HanekeSwift](https://badges.gitter.im/Haneke/HanekeSwift.svg)]
<br/>

#### .Xcode 4
#### .iOS7，如果不使用自定义转场动画，最低可以支持到iOS6
#### .OC，Swift完美支持

<br/><br/><br/>

## 一.为什么要开源？
开源是一种精神，时点软件感谢大家长期的支持与厚爱，无私开源奉献给大家，希望继续能支持我们：(成都时点软件冯成林在中国开发者排行榜单中OC排名国内11位，Swfit排名位于第10位，感谢大家支持！[总榜http://githuber.cn/rank](http://githuber.cn/rank)， [Objective-C排行榜](http://githuber.cn/search?language=Objective-C)，[Swfit排行榜](http://githuber.cn/search?language=Swift))<br/>
> (1). 本框架是Charlin Feng项目必备的基础类框架。<br/>
> (2). 此框架已经在我自己的10多个正式项目中全面使用。<br/>
> (3). 多达4年经验精华积累，让框架更稳定好用实用<br/>
> (4). 关于NavVC的很多功能，我发现是可以全部集成，不过后面发现有很多好用有趣的框架级功能被世界级githuber写的很零散，其实他们都是属于同一个体系的，这也是NavVC出现的必然理由！

注：框架功能太多，这里暂时不一一列表，请详细查看下面功能特性详解。


<br/><br/><br/>

## 二.基础篇

提示：在一切开始前，请自定义您的导航控制器比如AppNavVC，继承自CoreNavVC

<br/><br/>
##### 1.一句代码定制导航条样式

![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/01.png)<br/>

    [self navBarAppearanceWithBgColor:[UIColor blackColor] textColor:YeahColor titleFontPoint:18 itemFontPoint:15];

其中，BgColor是指导航条的背景色，textColor指文字颜色，titleFontPoint为titleLabel的文字大小，itemFontPoint为左右label文字大小。

<br/><br/>
##### 2.PopGesture

注：本功能是集成了FDPopGesture，但对源码做了一定的改动<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/2.gif)<br/>

>. 全自动的PopGesture<br/>
>. 自动判断并显示PopGesture提示视图<br/>

<br/>
以下是本功能的一些使用细节：<br/>
（1）手势提示视图已自动处理，你无需处理。<br/>
（2）禁用手势直接在VC调用：<br/>

        [self popGestureEnable:NO]; //VC Runtime
        

 (3)启用手势直接在VC调用：<br/>
 
        [self popGestureEnable:YES]; //VC Runtime
        

<br/><br/>
##### 3.自动处理Tabbar
你会发现，框架已经自动处理了在Push与Pop过程中tabbar的自动隐藏与显示，应该就是你直接想要的效果。


<br/><br/>
##### 4.仿QQ无网络实时检测

![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/3.gif)<br/>
你无需任何操作，框架已经全自动处理了网络实时监控。（你可以断开Mac的Wifi测试）<br/>
温馨提示：网络解决方案里面有时点软件落款，别忘了修改，小心扣工资！



<br/><br/>
##### 5.bgView的处理
这个是一个细节，你需要了解的，在navBar的内部，其实是有很多层，navBar和Tabbar与Toolbar机制不完全一样，单从半透明模糊效果来说，navBar和Tabbar内部有一个BlurView，在BlurView下面还有一个bgView，框架已经将这个bgView完全透明化。方便我们做出一些想要的NavBar颜色出来。如果你想了解细节，可以搜索findBgView方法。



<br/><br/>
##### 6.拦截Pop返回事件
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/4.gif)<br/>

你只需直接实现VC的PopAction的Block即可（VC Runtime）。

        self.PopAction = ^{
            //do sth
        };


注意：<br/>
> 1.此功能一般是保存资料，下单付款页面应用较多。<br/>
> 2.特别强调，你需要配置刚刚的PopGesture，因为这个pop被拦截，但PopGesture仍然是可用的，另忘了禁用与开启PopGesture。<br/>




<br/><br/><br/>

## 三.扩展篇（灵感来自淘宝iPhone版商品详情）
<br/>
####  1.任意View的下拉放大（支持ScrollView，tableview，CollectionView）
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/5.gif)<br/>
<br/>

##### （1）特别说明：其他Github上面有很多关于下拉放大的写法，我ppur也写过一个OC版本的（[CorePullScale](https://github.com/CharlinFeng/CorePullScale)）,不过这样做一般有很多问题：
>1. 框架零散，下拉放大其实还是属于我个人认为的导航控制器的一种封装，因为一般下拉放大会关联动态改变导航条的样式，透明度等。<br/>
>2. 最致命的是一般写的下拉放大是只考虑如何放大一个imageView,比如有的app的我的页面，他顶部确实有一个头像，不过在imageView上面还有很多其他控件，如用户昵称，年龄，私信等等其他控件。那么单纯实现一个imageView的下拉放大，将仅仅是一个意义不大的功能。

<br/>
所以本框架的下拉放大，重点是在解决如何集成在合理的位置，同时如果将下拉放大上升到任意View都可以支付下拉放大的需求空间，让下拉放大可以容纳更多的子控件。极大的让需求变化无限可能。
##### （2）使用细节，想要实现任意View的下拉放大，来自我自己想到的一个想法，当前你如果要实现这个效果，除了使用框架，还必须要注意以下细节，才能出现下拉放大效果，否则可能会达不到你想要的效果。<br/>
>1. 需要定制一个view，view最好是autolayout布局。且view内部应该有一个imageView子控件。
>2. 下拉放大的视觉效果应该是imageView产生的，imageView的高度上应该和父类高度有关联
>3. imageView的contentModel最好是设置为AspectFill，并且clipsToBounds.
>4.查看框架演示中，如果想要控件子控件在view中位置固定，直接正确设置对应的autolayout即可。
<br/>

使用方法如下，请直接在控制器中操作：

    //安装 （基于Runtime，请将下拉放大的view直接传递给runtime生成的成员变量nav_topView中即可）
    self.nav_topView = [[NSBundle mainBundle] loadNibNamed:@"TopView" owner:nil options:nil].lastObject;
    [self addScrollNavbarWithScrollView:self.tableView autoToggleNavbarHeight:240 originHeight:200];

### 特别注意：
>1.下拉放大产生的本质是scrollView动态修改了view的高度，并且触发了view的layoutsubviews。<br/>
>2.同时请注意下拉放大的view请不要记录成员变量，不需要你手动添加到scrollview中.<br/>
>3.基于Runtime，请将下拉放大的view直接传递给runtime生成的成员变量nav_topView中即可<br/>
>4.ScrollView表示需要传入页面中引起下拉放大的scrollview，originHeight表示nav_topView你想要的高度，autoToggleNavbarHeight表示引起导航条由透明到不透明开始变化反应的临界值。

### 其他重要事项说明：
框架考虑了众多因素，同时这些功能在我自己项目中已经使用了几年，且经历了10来个版本迭代，一切是为了解耦。同时考虑了与我自己其他框架的兼容以及很多各种各样的其他问题，所以框架你还需要做以下操作：

    -(void)viewWillAppear:(BOOL)animated{
        
        [super viewWillAppear:animated];
        [self viewWillAppear_scrollNavbar]; //调用代码1
    }
    -(void)viewWillDisappear:(BOOL)animated{
        
        [super viewWillDisappear:animated];
        [self viewWillDisappear_scrollNavbar];//调用代码2
    }
    -(void)dealloc{
        [self removeScrollNavbarWithScrollView:self.tableView];//调用代码3
    }

注意：
>1.如果不调用代码1，你会发现没有下拉放大效果。<br/>
>2.如果不调用代码2，你会发现在push下级页面会发生非常多的bug。<br/>
>3.如果不调用代码3，你会发现pop的时侯，程序崩溃，因为框架内部使用了通知与KVO。<br/>

<br/><br/>
####  2.PopBtn 一键添加Pop按钮
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/6.png)<br/>
在app中，经常会出现有的页面因为顶部有大图，或者有幻灯，或者有视频，或者其他原因隐藏了导航条，需要手动添加一个PopBtn的情况，这同样是一种和导航控制器有关的一种需求。请在控制器直接执行以下方法即可：

    /** 添加pop返回功能 */
    [self addPopFunctionWithAnim:YES]; //参数表示是否需要动画

<br/><br/>
####  3.动态修改导航条透明度
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/6.gif)<br/>
注：已经自动实现

<br/><br/>
####  4.与PopGesture的兼容
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/7.gif)<br/>
注：已经自动实现

<br/><br/>
####  4.与PopGesture的兼容
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/7.gif)<br/>
注：已经自动实现

<br/><br/>
####  5.仿淘宝商品详情上拉视差（Runtime）
<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/8.gif)<br/>
注：默认是无视差效果，即上下滚动步调与tableview的offset一致

<br/>
![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/9.gif)<br/>
注：开启视差效果，即上下滚动步调与tableview的offset不一致。（可配置）
开启视差：

    self.enableParallax = YES; //开启视差
    self.parallaxValue = 100; //视差值，建议100-250


<br/><br/><br/>
## 四.炫酷篇 （多达4-5种炫酷特效，一键调用实现，请持续关注！）


#### 一大波炫酷功能正在路上，连载中，未完待续，敬请期待！！！
