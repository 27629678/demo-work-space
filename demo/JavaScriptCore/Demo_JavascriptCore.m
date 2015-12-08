//
//  Demo_JavascriptCore.m
//  Demo
//
//  Created by H-YXH on 15/9/6.
//  Copyright (c) 2015年 NetEase (hangzhou) Network Co.,Ltd. All rights reserved.
//

#import "Demo_JavascriptCore.h"

#import <JavaScriptCore/JavaScriptCore.h>

/* ****************************************************
 *  -Obj-C uses ARC
 *
 *  - JavascriptCore uses garbage collection
 *      - All references are strong
 *
 *  - API memeroy management is mostly automatic
 *
 *  -Two situations that require extra attention
 *      - Storing JavaScript values in Obj-C objects
 *      - Adding JavaScript fields to Obj-C objects
 *
 *
 *
 * ***************************************************/

/* ***************************************************
 *  - API is thread safe
 *  - Locking granularity is JSVirtualMachine
 * ***************************************************/

/* ***************************************************
 *  - Interfacing with the C API
 *      -JSValue <-> JSValueRef
 *      -JSContext <-> JSGlobalContextRef
 *
 *  ```
 *  JSGlobalContextRef = ctx = ...
 *  JSContext* context = [JSContext contextWithJSGlobalContextRef:ctx];
 *
 *  JSContext* context = ...
 *  JSGlobalContextRef ctx = [context JSGlobalContextRef];
 *  ```
 *
 *  ```
 *  JSValueRef valueRef = ...
 *  JSValue* value = [JSValue valueWithJSValueRef:valueRef inContext:context];
 *
 *  JSValue* value = ...
 *  JSValueRef valueRef = [value JSValueRef];
 *  ```
 * ***************************************************/

@class MyPoint;

@protocol MyPointExports <JSExport>

@property double x;
@property double y;

- (NSString *)description;
+ (MyPoint *)makePointWithX:(double)x Y:(double)y;

@end

@interface MyPoint : NSObject <MyPointExports>

@property double x;
@property double y;

- (NSString *)description;
+ (MyPoint *)makePointWithX:(double)x Y:(double)y;

- (void)myPrivateMethod;    // not visible to Javascript Code

@end

@implementation MyPoint

+ (MyPoint *)makePointWithX:(double)x Y:(double)y
{
    MyPoint* instance = [[MyPoint alloc] init];
    [instance setX:x];
    [instance setY:y];
    
    return instance;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"(x:%f,y=%f)", _x, _y];
}

- (void)myPrivateMethod
{
    NSLog(@"i am a private method.");
}

@end

@implementation Demo_JavascriptCore

- (void)didStart
{
    [self evaluteValueFromJS];
    
    [self evaluteValueFromOC];
    
    [self evaluteValueFromJSExport];
    
    [self evaluteValueFromJSFile];
}

- (void)evaluteValueFromJS
{
    JSContext* context = [[JSContext alloc] init];
    
    JSValue* value = [context evaluateScript:@"2+2"];
    
    NSLog(@"2+2 = %d", value.toInt32);
}

- (void)evaluteValueFromOC
{
    JSContext* context = [[JSContext alloc] init];
    context[@"dd_log"] = ^(){
        NSArray* arguments = [JSContext currentArguments];
        for (id obj in arguments) {
            NSLog(@"%@", obj);
        }
    };
    
    NSString* js1 = @"dd_log('param1')";
    [context evaluateScript:js1];
    
    NSString* js2 = @"dd_log('pa','pb')";
    [context evaluateScript:js2];
}

- (void)evaluteValueFromJSExport
{
    JSContext* context = [[JSContext alloc] init];
    
    MyPoint* point = [[MyPoint alloc] init];
    
    context[@"point"] = point;
    
    NSString* js1 = @"point.x=1";
    [context evaluateScript:js1];
    
    NSString* js2 = @"point.y=2";
    [context evaluateScript:js2];
    
    NSString* js3 = @"point.description()";
    JSValue* description = [context evaluateScript:js3];
    
    NSLog(@"Point:%@", description.toString);
}

- (void)evaluteValueFromJSFile
{
    NSString* path = [[NSBundle bundleForClass:self.class] pathForResource:@"main" ofType:@"js"];
    
//    NSLog(@"Main JavaScript Path:%@", path);
    NSString* script = [[NSString alloc] initWithContentsOfFile:path encoding:NSUTF8StringEncoding error:NULL];
    
//    NSLog(@"Content of Script:%@", script);
    
    JSContext* context = [[JSContext alloc] init];
    
    context[@"oc_log"] = ^(){
        NSArray* arguments = [JSContext currentArguments];
        for (id obj in arguments) {
            NSLog(@"Param:%@", obj);
        }
    };
    
    [context evaluateScript:script withSourceURL:[NSURL URLWithString:path]];
    
    [context evaluateScript:@"js_log()"];
}

// resolve retain cycles
- (void)setOnClickHandler:(JSValue *)handler
{
    JSContext* context = [JSContext currentContext];
    id _handler = [JSManagedValue managedValueWithValue:handler];
    [context.virtualMachine addManagedReference:_handler withOwner:self];
}

@end
