//
//  RSAEncrypt.m
//  SwiftSchool
//
//  Created by 666gps on 2017/5/25.
//  Copyright © 2017年 666gps. All rights reserved.
//

#import "RSAEncrypt.h"
#import "NSString+RSA.h"
#import <CommonCrypto/CommonCrypto.h>
@implementation RSAEncrypt
+(NSDictionary *)getToukenAndLoginFlag:(NSDictionary *)parm{
    NSMutableDictionary * toukenDic = [[NSMutableDictionary alloc]init];
    
    NSURLSession *session = [NSURLSession sharedSession];
    //根据会话对象创建task
    NSURL *url = [NSURL URLWithString:@"http://base.api.owl361.com/app/user/syslogin"];
    //创建可变的请求对象
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    //修改请求方法为POST
    request.HTTPMethod = @"POST";
    //设置请求体
    NSDictionary * headerD = @{@"version":@"1.0",@"sign":@"",@"tokenid":@"123",@"sign_t":@"0",@"tag":@"123",@"from":@"300"};
    NSData * headerData = [NSJSONSerialization dataWithJSONObject:headerD options:0 error:nil];
    NSString * headerStr = [[NSString alloc]initWithData:headerData encoding:NSUTF8StringEncoding];
    
     [request setValue:headerStr forHTTPHeaderField:@"rqs-header"];
    
   
    NSDictionary * bodyDic = @{@"verifycode":@"123",@"username":parm[@"nameText"],@"password":parm[@"rsa"]};
    NSData * bodyData = [NSJSONSerialization dataWithJSONObject:bodyDic options:0 error:nil];
    NSString * bodyStr = [[NSString alloc]initWithData:bodyData encoding:NSUTF8StringEncoding];
    request.HTTPBody = [bodyStr dataUsingEncoding:NSUTF8StringEncoding];
    //根据会话对象创建一个Task(发送请求）
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        //解析数据
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        NSLog(@"%@",dict);
    }];
    //执行任务
    [dataTask resume];
    return toukenDic;
}
@end
