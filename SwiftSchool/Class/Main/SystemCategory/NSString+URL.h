//
//  NSString+URL.h
//  AppOfCoach
//
//  Created by 666GPS on 2016/12/6.
//  Copyright © 2016年 张俊辉. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef NS_ENUM(NSInteger,StatisticType) {
    StatisticType_coachAppoint      =  5,//教练预约培训
    StatisticType_teaching          =  1,//教练带教
    StatisticType_educating         =  2,//教练教学
//    StatisticType_carRecords        =  3,//教练车行车
//    StatisticType_fencingTureOver   =  4,//围栏进出
//    StatisticType_fencingCaution    =  5,//围栏报警
    StatisticType_enrollToll        =  0,//招生收费
    StatisticType_waitingExam       =  3,//学员待考
    StatisticType_examRecords       =  4,//学员考试
    StatisticType_appointRecords    =  6 //学员预约
};

@interface NSString (URL)

/**
 照片的url
 */
+ (NSString *)photoUrl:(NSString *)url;

#pragma mark - 首页模块

//1,获取招生收费统计信息
+ (NSString *)getEnrollStudentsChargeInfo;

//1.1首页获取招生收费统计信息
+ (NSString *)getHomeEnrollStudentsChargeInfo;

//2, 获取某驾校或招生点招生收费明细列表
+ (NSString *)getEnrollAddressInfo;

//3,获取某驾校所有招生点当天招生人数情况。
+ (NSString *)getSevenDaysEnrollNum;





#pragma mark - 车辆模块
/**
 *  车辆列表实时数据版本
 */
+(NSString *)vehiclePositions2;
/**
 *  报警信息分页获取
 */
+(NSString *)AlarmList;
/**
 *  影像列表数据查询
 */
+ (NSString *)getVideoList;
/**
 *  按车辆获取教学分析数据。
 */
+(NSString *)getTeacherAnalyseList;
/**
 *  3.7.11.	按车辆获取行车分析数据
 */
+(NSString *)getDriverAnalyseList;

/**
 *  获取车辆指定时间内的简洁轨迹接口定义
 */
+(NSString *)getCarRout;


/**
 *  3.3.1.获取车辆实时位置(单辆车)
 */

+(NSString *)getSingleVehiclePosition;

/**
 *  3.4.1.	实时视频发起(MS9000032)
 */
+ (NSString *)MakeVedioStart;
/**
 *  3.4.4.	实时视频状态查询(MS9000034)
 */

+ (NSString *)queryVedioStatus;

/**
 *  3.4.5.	实时视频续播(MS9000036)
 */
+ (NSString *)letVedioMaintain;
/**
 *  获取车辆详情
 */
+(NSString *)vehicleInfo2;

#pragma mark - 报表模块
//1,统计接口
+ (NSString *)getStatisticWithType:(StatisticType)type;

+ (NSString *)getEnrollAddressListsWith:(NSInteger)branchID;


#pragma mark - 我的模块
/**
 *  订单列表
 */
+(NSString *)getMyOrderList;
/**
 *  订单
 */
+(NSString *)getMyOrderListBrsch:(NSString *)brsch Page:(NSString *)page PageSize:(NSString *)pageSize;

/**
 *  3.17.2.	获取教练分页列表数据
 */
+ (NSString *)getMyTeacherList;

/**
 * 	获取教练总数
 */
+ (NSString *)getMyTeacherTotalNum;

/**
 *  我的学员列表
 */
+(NSString *)getMyStudentsBrid:(NSString *)brid PageNumber:(NSString *)page;
/**
 *  我的学员查询
 */
+(NSString *)getMyStudentsSearchBrid:(NSString *)brid PageNumber:(NSString *)page StudentNmae:(NSString *)studentName;
#pragma mark - 登录接口

//1.登录
+ (NSString *)goToLogin;

//2,获取分校列表信息
+ (NSString *)getBranchSchoolList;

#pragma mark - 根据车牌查询设备号
/**
 *  根据车牌查询设备号
 */
+(NSString *)getEquipmentNumberThroughLicenceNumber;

#pragma mark - 三个总数(学员，教练,车辆)
//获取学员总数
+ (NSString *)getStudentTotalNumber;
//获取教练总数
+ (NSString *)getCoachTotalNumber;
//获取车辆总数
+ (NSString *)getCarTotalNumber;
@end
