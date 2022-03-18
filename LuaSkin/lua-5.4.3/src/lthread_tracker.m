//
//  lthread_tracker.m
//  lua
//
//  Created by Chris Jones on 18/03/2022.
//  Copyright © 2022 Hammerspoon. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "lthread_tracker.h"

void skin_track_thread(lua_State *L) {
    NSLog(@"skin_track_thread(): %p", L);

    // Note: We can't include Skin.h here, otherwise we create a circular build dependency between lua and LuaSkin, so we're calling LuaSkin class/instance methods by hand
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    Class SkinClass = NSClassFromString(@"LuaSkin");

    id skin = [SkinClass performSelector:@selector(sharedWithState:) withObject:NULL];

    NSMethodSignature *methodSignature = [SkinClass instanceMethodSignatureForSelector:@selector(trackLuaThread:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:skin];
    [invocation setSelector:@selector(trackLuaThread:)];
    [invocation setArgument:&L atIndex:2];
    [invocation invoke];
#pragma clang diagnostic pop
}

void skin_untrack_thread(lua_State *L) {
    NSLog(@"skin_untrack_thread(): %p", L);

    // Note: We can't include Skin.h here, otherwise we create a circular build dependency between lua and LuaSkin, so we're calling LuaSkin class/instance methods by hand
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wundeclared-selector"
    Class SkinClass = NSClassFromString(@"LuaSkin");
    id skin = [SkinClass performSelector:@selector(sharedWithState:) withObject:NULL];

    NSMethodSignature *methodSignature = [SkinClass instanceMethodSignatureForSelector:@selector(untrackLuaThread:)];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:methodSignature];
    [invocation setTarget:skin];
    [invocation setSelector:@selector(untrackLuaThread:)];
    [invocation setArgument:&L atIndex:2];
    [invocation invoke];
#pragma clang diagnostic pop
}
