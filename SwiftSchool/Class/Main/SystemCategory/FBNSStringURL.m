//
//  FBNSStringURL.m
//  FluentBus
//
//  Created by 666GPS on 2016/12/26.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "FBNSStringURL.h"

static NSString * URL1 = @"http://183.238.51.33:3300/ia.bus.api";
//static NSString * URL1 = @"http://116.62.9.102:8080/ia.bus.api";

//钱包和支付

static NSString *URL2 = @"http://183.238.51.33:3300/cass-api";
//static NSString *URL2 = @"http://116.62.9.102:8080/cass-api";

//公钥
static NSString * URL3 = @"http://183.238.51.33:3300/user-api";
//static NSString * URL3 = @"http://116.62.9.102:8080/user-api";


//登录
NSString * loginMyApp(){
    return [NSString stringWithFormat:@"%@/User/loginUser",URL1];
}

//获取公钥的膜和指数
NSString *getLoginKey(){
    return [NSString stringWithFormat:@"%@/secret/regkey",URL3];
}
//获取验证码
NSString *getVode(){
    return [NSString stringWithFormat:@"%@/User/getVerificationCode",URL1];
}

//找回密码(验证码验证)
NSString *checkVCode(){
    return [NSString stringWithFormat:@"%@/User/checkVCode",URL1];
}

//更换手机号码
NSString *changeMobile(){
    return [NSString stringWithFormat:@"%@/User/changeMobile",URL1];
}

//注册
NSString *registerUrl(){
     return [NSString stringWithFormat:@"%@/User/regUser",URL1];
}

//修改密码（重置密码）
NSString *resetPasswordUrl(){
    return [NSString stringWithFormat:@"%@/User/updatePwd",URL1];
}


//获取需求列表
NSString *getNeedListUrl(){
    return [NSString stringWithFormat:@"%@/Demand/getAppDemandList",URL1];
}

//用户报名（需求）
NSString *DemandvotedDemandUrl(){
    
    return [NSString stringWithFormat:@"%@/Demand/votedDemand",URL1];
}

//用户发起需求
NSString *DemandCommitDemandUrl(){
    return [NSString stringWithFormat:@"%@/Demand/commitDemand",URL1];
}

NSString * lap(NSString * pre1,NSString * pre2){
    return [NSString stringWithFormat:@"%@/000/%@--%@",URL1,pre1,pre2];
}

//获取用户信息
NSString * getUserInfo(){
    return [NSString stringWithFormat:@"%@/User/getUserInfo",URL1];
}
//修改用户信息
NSString * alterUserInfo(){
    return [NSString stringWithFormat:@"%@/User/perfectDetails",URL1];
}
//查询线路
NSString * getLineList(){
    return [NSString stringWithFormat:@"%@/Route/getLineList",URL1];
}

//查询路线信息
NSString *getAppLineByRidUrl(){
    
    return [NSString stringWithFormat:@"%@/Route/getAppLineByRid",URL1];
}
//查询途径点（线路）
NSString *searchRoteUrl(){
    return [NSString stringWithFormat:@"%@/Route/getAppStationLine",URL1];
}
//模糊查询线路
NSString * queryStation(){
    return [NSString stringWithFormat:@"%@/Station/queryStation",URL1];
}
//订购页-获取线路产品列表
NSString * getOrderList(){
    return [NSString stringWithFormat:@"%@/Route/getOrderList",URL1];
}
//订购页-根据站点ID搜索线路产品列表
NSString * searchOrderList(){
    return [NSString stringWithFormat:@"%@/Route/searchOrderList",URL1];
}
//用户订单列表获取
NSString * userOrderList(){
    return [NSString stringWithFormat:@"%@/Order/userOrderList",URL1];
}
//用户订单详情获取
NSString * userOrderDetails(){
    return [NSString stringWithFormat:@"%@/Order/userOrderDetails",URL1];
}
//用户车票列表获取
NSString * userTicketList(){
    return [NSString stringWithFormat:@"%@/Order/userTicketList",URL1];
}
//用户车票详情获取
NSString * userTicketDetails(){
    return [NSString stringWithFormat:@"%@/Order/userTicketDetails",URL1];
}

//用户车票详情列表获取
NSString * userTicketDetailsList(){
    return [NSString stringWithFormat:@"%@/Order/userTicketDetailsList",URL1];
}
//创建订单
NSString * createOrder(){
    return [NSString stringWithFormat:@"%@/Order/createOrder",URL1];
}

//获取推送消息列表
NSString *getMessageList(){
    return [NSString stringWithFormat:@"%@/User/getMessageList",URL1];
}

//微信APP支付    原来为/trans/wxpay  请求加了paytype字段
NSString * WeiXinPay(){
    return [NSString stringWithFormat:@"%@/trans/payaction",URL2];
}
//钱包余额查询
NSString * walletQueryfast(){
    return [NSString stringWithFormat:@"%@/wallet/queryfast",URL2];
}
//取消订单
NSString * cancelOrder(){
    return [NSString stringWithFormat:@"%@/Order/cancelOrder",URL1];
}
//创建钱包充值订单
NSString * orderWltrec(){
    return [NSString stringWithFormat:@"%@/Order/wltrec",URL1];
}
// 获取产品实际运营日期
NSString * getDateList(){
    return [NSString stringWithFormat:@"%@/Product/getDateList",URL1];
}
//获取充值下面的优惠信息
NSString * getRechargeApp(){
    return [NSString stringWithFormat:@"%@/Recharge/getRechargeApp",URL1];
}
//用户提交退票申请
NSString * comitRefundOrder(){
    return [NSString stringWithFormat:@"%@/Refund/comitRefundOrder",URL1];
}
//查询退票信息（app使用）
NSString * getRefundByOrderId(){
    return [NSString stringWithFormat:@"%@/Refund/getRefundByOrderId",URL1];
}


#pragma mark - 畅吧定制版接口
//在原来订购列表功能上，当产品停售之后，系统自动显示该产品的本月余座票
NSString * orderlistnew(){
    return [NSString stringWithFormat:@"%@/Route/orderlistnew",URL1];
}
//获取站点实景图数据列表
NSString * Stationimagelist(){
    return [NSString stringWithFormat:@"%@/Station/image/list",URL1];
}
