//
//  HttpUtil.m
//  echo
//
//  Created by Jinghan Xu on 2/20/13.
//  Copyright (c) 2013 __MyCompanyName__. All rights reserved.
//

#import "HttpUtil.h"
#import "SerializeUtil.h"

@implementation HttpUtil

+ (void) sendMessage:(Message *)message atLocation:(Location *)location from:(User *)userFrom to:(User *)userTo {
    
}

+ (NSData *)pullUserDataFor:(NSString *)DeviceName {
    [self requestUrl:@"http://localhost/getUserData" WithContent:DeviceName];
}

+ (NSData *)requestUrl:(NSString *)url WithContent:(NSString *)content{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:[content dataUsingEncoding:NSUTF8StringEncoding]];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    return response;
}

@end
