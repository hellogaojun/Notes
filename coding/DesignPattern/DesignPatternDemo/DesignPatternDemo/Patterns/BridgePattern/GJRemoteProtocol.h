//
//  GJRemoteProtocol.h
//  DesignPatternDemo
//
//  Created by gaojun on 2019/4/16.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#ifndef GJRemoteProtocol_h
#define GJRemoteProtocol_h

@protocol GJRemoteProtocol <NSObject>

#pragma mark -  功能键

@required

- (void)up;

- (void)down;

- (void)left;

- (void)right;

@end

#endif /* GJRemoteProtocol_h */
