//
//  CLHTTPRequest.m
//  Criollo
//
//  Created by Cătălin Stan on 3/30/14.
//  Copyright (c) 2014 Catalin Stan. All rights reserved.
//

#import <Criollo/CLHTTPMessage.h>

#import "CLHTTPRequest.h"

@implementation CLHTTPRequest

- (instancetype)initWithMethod:(NSString *)method URL:(NSURL *)URL version:(NSString *)version
{
    self = [super init];
    if ( self != nil ) {
        self.message = CFHTTPMessageCreateRequest(NULL, (__bridge CFStringRef)method, (__bridge CFURLRef)URL, (__bridge CFStringRef)version);
    }
    return self;
}

- (BOOL)appendData:(NSData *)data
{
    return CFHTTPMessageAppendBytes(self.message, data.bytes, data.length);
}

- (BOOL)headerComplete
{
    return CFHTTPMessageIsHeaderComplete(self.message);
}

- (NSString *)method
{
	return (__bridge_transfer NSString *)CFHTTPMessageCopyRequestMethod(self.message);
}

@end
