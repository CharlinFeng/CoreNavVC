
CoreNavVC  --成都时点软件4年精华无私奉献开源
==========

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Platform](https://cocoapod-badges.herokuapp.com/p/HanekeSwift/badge.png)](http://cocoadocs.org/docsets/HanekeSwift)
[![Build Status](https://travis-ci.org/Haneke/HanekeSwift.svg?branch=master)](https://travis-ci.org/Haneke/HanekeSwift)
[![Join the chat at https://gitter.im/Haneke/HanekeSwift](https://badges.gitter.im/Haneke/HanekeSwift.svg)](https://gitter.im/Haneke/HanekeSwift?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)
<br/>

#### .Xcode 4
#### .iOS7，如果不使用自定义转场动画，最低可以支持到iOS6
#### .OC，Swift完美支持

<br/><br/><br/>

### 一.为什么要开源？
开源是一种精神，时点软件感谢大家长期的支持与厚爱，无私开源奉献给大家，希望继续能支持我们：(成都时点软件冯成林在中国开发者排行榜单中OC排名国内11位，Swfit排名位于第10位，感谢大家支持！[http://githuber.cn/rank](http://githuber.cn/rank))<br/>
> (1). 本框架是Charlin Feng项目必备的基础类框架。<br/>
> (2). 此框架已经在我自己的10多个正式项目中全面使用。<br/>
> (3). 多达4年经验精华积累，让框架更稳定好用实用<br/>
> (4). 关于NavVC的很多功能，我发现是可以全部集成，不过后面发现有很多好用有趣的框架级功能被世界级githuber写的很零散，其实他们都是属于同一个体系的，这也是NavVC出现的必然理由！

注：框架特别太多，这里暂时不一一列表，请详细查看下面功能特性详解。


<br/><br/><br/>

### 二.框架级功能详解

提示：在一切开始前，请自定义您的导航控制器比如AppNavVC，继承自CoreNavVC

##### 1.一句代码定制导航条样式

![image](https://github.com/CharlinFeng/Resource/blob/master/CoreNavVC/01.png)<br/>

    [self navBarAppearanceWithBgColor:[UIColor blackColor] textColor:YeahColor titleFontPoint:18 itemFontPoint:15];

其中，BgColor是指导航条的背景色，textColor指文字颜色，titleFontPoint为titleLabel的文字大小，itemFontPoint为左右label文字大小。



