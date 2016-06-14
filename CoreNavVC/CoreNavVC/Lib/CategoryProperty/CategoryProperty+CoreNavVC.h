//
//  CategoryProperty+CoreNavVC.h
//  CoreNavVC
//
//  Created by 冯成林 on 16/1/2.
//  Copyright © 2016年 冯成林. All rights reserved.
//

#ifndef CategoryProperty_CoreNavVC_h
#define CategoryProperty_CoreNavVC_h

#import <objc/runtime.h>

#define ADD_DYNAMIC_PROPERTY(PROPERTY_TYPE,PROPERTY_NAME,SETTER_NAME) \
\
@dynamic PROPERTY_NAME ; \
\
static char kProperty##PROPERTY_NAME; \
\
- ( PROPERTY_TYPE ) PROPERTY_NAME \
\
{ \
\
return ( PROPERTY_TYPE ) objc_getAssociatedObject(self, &(kProperty##PROPERTY_NAME ) ); \
\
} \
\
- (void) SETTER_NAME :( PROPERTY_TYPE ) PROPERTY_NAME \
\
{ \
\
objc_setAssociatedObject(self, &kProperty##PROPERTY_NAME , PROPERTY_NAME , OBJC_ASSOCIATION_RETAIN); \
}



#define ADD_DYNAMIC_PROPERTY_CGFloat(PROPERTY_TYPE,PROPERTY_NAME,SETTER_NAME) \
\
static char kProperty##PROPERTY_NAME; \
\
- (PROPERTY_TYPE) PROPERTY_NAME \
\
{ \
\
return [objc_getAssociatedObject(self, &(kProperty##PROPERTY_NAME) ) floatValue]; \
\
} \
\
- (void) SETTER_NAME :( PROPERTY_TYPE ) PROPERTY_NAME \
\
{ \
\
objc_setAssociatedObject(self, &kProperty##PROPERTY_NAME , @(PROPERTY_NAME) , OBJC_ASSOCIATION_RETAIN); \
}


#endif

/* CategoryProperty_CoreNavVC_h */
