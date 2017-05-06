//c函数封装URL，为了更加方便操作
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#pragma marlk --- 例
/**
 *  登录URL
 */
NSString *loginMyApp();

//获取公钥的膜和指数
NSString *getLoginKey();

//获取验证码
NSString *getVode();

//注册
NSString *registerUrl();

//修改密码（重置密码）
NSString *resetPasswordUrl();

//找回密码(验证码验证)
NSString *checkVCode();

//更换手机号码
NSString *changeMobile();

//获取需求列表
NSString *getNeedListUrl();

//用户发起需求
NSString *DemandCommitDemandUrl();

//查询途径点（线路）
NSString *searchRoteUrl();

//查询路线信息
NSString *getAppLineByRidUrl();

//用户报名（需求）
NSString *DemandvotedDemandUrl();

NSString * lap(NSString * pre1,NSString * pre2);
/**
 *  获取用户信息
 */
NSString * getUserInfo();
/**
 *  修改用户信心
 */
NSString * alterUserInfo();
/**
 *  详细查询线路
 */
NSString * getLineList();
/**
 *  模糊查询线路
 */
NSString * queryStation();
/**
 *  订购页-获取线路产品列表
 */
NSString * getOrderList();
/**
 *  订购页-根据站点ID搜索线路产品列表
 */
NSString * searchOrderList();
/**
 *  用户订单列表获取
 */
NSString * userOrderList();
/**
 *  用户订单详情获取
 */
NSString * userOrderDetails();
/**
 *  用户车票列表获取
 */
NSString * userTicketList();
/**
 *  用户车票详情获取
 */
NSString * userTicketDetails();
/**
 *  用户车票详情列表获取
 */
NSString * userTicketDetailsList();
/**
 *  创建订单
 */
NSString * createOrder();


//获取推送消息列表
NSString *getMessageList();

/**
 *  微信APP支付
 */
NSString * WeiXinPay();
/**
 *  钱包余额查询
 */
NSString * walletQueryfast();
/**
 *  取消订单
 */
NSString * cancelOrder();
/**
 * 创建钱包充值订单
 */
NSString * orderWltrec();
/**
 *   获取产品实际运营日期
 */
NSString * getDateList();
/**
 *  获取充值下面的优惠信息
 */
NSString * getRechargeApp();
/**
 *  用户提交退票申请
 */
NSString * comitRefundOrder();
/**
 *  查询退票信息（app使用）
 */
NSString * getRefundByOrderId();


#pragma mark - 畅吧定制版接口
/**
 *  在原来订购列表功能上，当产品停售之后，系统自动显示该产品的本月余座票
 */
NSString * orderlistnew();
/**
 *  获取站点实景图数据列表
 */
NSString * Stationimagelist();
