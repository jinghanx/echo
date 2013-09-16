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

+ (NSDictionary *) sendMessage:(Message *)message {
    return [self requestUrl:@"http://192.168.1.89:8080/examples/echo" WithContent:[SerializeUtil serialize:message.content forKey:@"message"]];
}

+ (NSDictionary *)pullUserFor:(NSString *)DeviceName {
    return [self requestUrl:@"http://192.168.1.89:8080/examples/echo" WithContent:[SerializeUtil serialize:DeviceName forKey:@"deviceName"]];
}

+ (NSDictionary *)requestUrl:(NSString *)url WithContent:(NSData *)content{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalCacheData timeoutInterval:10];
    [request setHTTPMethod:@"POST"];
    [request setHTTPBody:content];
    NSError *requestError;
    NSURLResponse *urlResponse = nil;
    NSData *response = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&requestError];
    NSDictionary *returnDic = [SerializeUtil  deSerialize:response];
    return returnDic;
}

@end
