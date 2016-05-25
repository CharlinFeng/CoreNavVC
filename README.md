
CoreNavVC  （连载中）
==========
### 成都时点软件4年精华无私奉献开源

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://cocoapod-badges.herokuapp.com/p/HanekeSwift/badge.png)](http://cocoadocs.org/docsets/HanekeSwift)
[![Build Status](https://travis-ci.org/Haneke/HanekeSwift.svg?branch=master)](https://travis-ci.org/Haneke/HanekeSwift)
[![Join the chat at https://gitter.im/Haneke/HanekeSwift](https://badges.gitter.im/Haneke/HanekeSwift.svg)](https://gitter.im/Haneke/HanekeSwift?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
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
<br/>



<br/><br/><br/>

## 三.扩展篇


#### 一大波炫酷功能正在路上，连载中，未完待续，敬请期待！！！
