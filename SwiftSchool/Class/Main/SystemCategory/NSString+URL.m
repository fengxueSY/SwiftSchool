//
//  NSString+URL.m
//  AppOfCoach
//
//  Created by 666GPS on 2016/12/6.
//  Copyright © 2016年 张俊辉. All rights reserved.
//

#import "NSString+URL.h"


static BOOL isDebug         =  NO;//标记是否是测试环境

static NSString * testHost     = @"http://xinwei.yixc.com";//xinwei.yixc.com
static NSString * officialHost = @"http://js.yixc.com";

static NSString * newTestHost  = @"http://183.238.51.33:3800/jp2ass.api";//test //183.238.51.33:3800
static NSString * newOfficialHost  = @"http://js.yixc.com/jp2ass.api";

// 照片的前缀
static NSString * photoTestPrefix = @"http://rm-webapp-test.oss-cn-hangzhou.aliyuncs.com";//test: dev  xinwei:test
static NSString * photoPrefix = @"http://rm-webapp.oss-cn-hangzhou.aliyuncs.com";


@implementation NSString (URL)

NSString * newUrl(){
    //测试环境
    return isDebug ? newTestHost : newOfficialHost;
    //开发环境
    //return @"http://183.238.51.33:3800/jp2ass.api";
}
NSString * oldUrl(){
    return isDebug ? testHost : officialHost;
}

/**
 照片的url
 */
+ (NSString *)photoUrl:(NSString *)url {
    NSString *baseUrl = isDebug ? photoTestPrefix : photoPrefix;
    return [NSString stringWithFormat:@"%@/%@",baseUrl,url];
}

#pragma mark - 首页模块

//获取招生收费统计信息
+ (NSString *)getEnrollStudentsChargeInfo{
    
    return [NSString stringWithFormat:@"%@/analysis/stucharge",newUrl()];
}

//首页获取招生收费一个月的招生数量统计信息
+ (NSString *)getHomeEnrollStudentsChargeInfo{
    
    return [NSString stringWithFormat:@"%@/analysis/stu_count",newUrl()];
}

//2,获取招生收费情况
+ (NSString *)getEnrollAddressInfo{

    return [NSString stringWithFormat:@"%@/expense/student-fee-list",newUrl()];
}

//3,获取招生点当天招生人数统计
+ (NSString *)getSevenDaysEnrollNum{
    
    return [NSString stringWithFormat:@"%@/enrollmentpt/student-day-count",newUrl()];
}

#pragma mark - 登录模块

//1.登录
+ (NSString *)goToLogin
{
    return [NSString stringWithFormat:@"%@/rmwebapp/school/login",oldUrl()];
}

//2,获取分校列表信息
+ (NSString *)getBranchSchoolList{
    
    return [NSString stringWithFormat:@"%@/rmwebapp/sch-%ld/brsch-names",oldUrl(),(long)[PHLoginInfo sharePHLoginInfo].schoolId];
}


#pragma mark -  车辆模块
//车辆列表实时数据版本
+(NSString *)vehiclePositions2{
    return [NSString stringWithFormat:@"%@/monitor/vehicle-positions2",newUrl()];
}
//报警信息分页获取
+(NSString *)AlarmList{
    return [NSString stringWithFormat:@"%@/alarm/list",newUrl()];
}
//按车辆获取教学分析数据。
+(NSString *)getTeacherAnalyseList{
    return [NSString stringWithFormat:@"%@/analysis/coachvehicle-use-count2",newUrl()];
}
//3.7.11.	按车辆获取行车分析数据
+(NSString *)getDriverAnalyseList{
    return [NSString stringWithFormat:@"%@/analysis/coachvehicle-run-count2",newUrl()];
}

//获取车辆指定时间内的简洁轨迹接口定义
+(NSString *)getCarRout{
    return [NSString stringWithFormat:@"%@/track/vehicle-line",newUrl()];
}

//3.6.4影像列表数据查询
+ (NSString *)getVideoList
{
    return [NSString stringWithFormat:@"%@/shoot/list",newUrl()];
}

//3.3.1.获取车辆实时位置(单辆车)
+(NSString *)getSingleVehiclePosition
{
    return [NSString stringWithFormat:@"%@/monitor/vehicle-position",newUrl()];
}

//3.4.1.	实时视频发起(MS9000032
+ (NSString *)MakeVedioStart
{
    return [NSString stringWithFormat:@"%@/vedio/start",newUrl()];
}

//3.4.4.	实时视频状态查询(MS9000034)
+ (NSString *)queryVedioStatus{
    return [NSString stringWithFormat:@"%@/vedio/status",newUrl()];
}

//3.4.5.	实时视频续播(MS9000036)
+ (NSString *)letVedioMaintain{
    return [NSString stringWithFormat:@"%@/vedio/maintain",newUrl()];
}

+ (NSString *)letVideoStop
{
    //vedio/status-change
    return [NSString stringWithFormat:@"%@/vedio/maintain",newUrl()];
}
//获取车辆详情
+(NSString *)vehicleInfo2{
    return [NSString stringWithFormat:@"%@/monitor/vehicle-info2",newUrl()];
}
#pragma mark - 报表模块

//1,统计接口
+ (NSString *)getStatisticWithType:(StatisticType)type{
    
    NSString *host = isDebug ? newTestHost : newOfficialHost;
    NSString *url = nil;
    switch (type) {
        case StatisticType_coachAppoint://教练预约培训统计
        {
            NSString *host = isDebug ? testHost : officialHost;
//            http://js.yixc.com/rmwebapp/brsch-111/coach/trainandapporec/1/10?brid=&coaname=&cardnum=&starttime=2017-02-02&endtime=2017-03-02&_=1488446042101
            
            [PHLoginInfo sharePHLoginInfo];
            url =  [NSString stringWithFormat:@"%@/rmwebapp/brsch-%ld/coach/trainandapporec",host,(long)[PHLoginInfo sharePHLoginInfo].brschId];
        }
            break;
        case StatisticType_teaching://教练带教统计
        {
            url =  [NSString stringWithFormat:@"%@/analysis/coachtrain-count",host];
        }
            break;
        case StatisticType_educating://教练车教学统计
        {
            url =  [NSString stringWithFormat:@"%@/analysis/coachvehicle-use-count",host];
        }
            break;
//        case StatisticType_carRecords://教练车行车统计
//        {
//            url =  [NSString stringWithFormat:@"%@/analysis/coachvehicle-run-count",host];
//        }
//            break;
//        case StatisticType_fencingTureOver://围栏进出统计
//        {
//            url =  [NSString stringWithFormat:@"%@/analysis/fencingio-count",host];
//        }
//            break;
//        case StatisticType_fencingCaution://围栏报警统计
//        {
//            url =  [NSString stringWithFormat:@"%@/analysis/fencingwar-count",host];
//        }
//            break;
        case StatisticType_enrollToll://招生收费统计
        {
            url =  [NSString stringWithFormat:@"%@/analysis/stucharge",host];
        }
            break;
        case StatisticType_waitingExam://学员待考统计
        {
            url =  [NSString stringWithFormat:@"%@/analysis/stuexam-pending",host];
        }
            break;
        case StatisticType_examRecords://学员考试统计
        {
            url =  [NSString stringWithFormat:@"%@/analysis/stuexam-count",host];
        }
            break;
        case StatisticType_appointRecords://学员预约培训记录
        {
            
            NSString *host = isDebug ? testHost : officialHost;
            [PHLoginInfo sharePHLoginInfo];
            url =  [NSString stringWithFormat:@"%@/rmwebapp/brsch-%ld/student/trainandapporec",host,(long)[PHLoginInfo sharePHLoginInfo].brschId];
            
//            url =  [NSString stringWithFormat:@"%@",host];
        }
            break;
        default:
            break;
    }
    
    return url;
}

//获取所有的招生点信息
+ (NSString *)getEnrollAddressListsWith:(NSInteger)branchID
{

    return [NSString stringWithFormat:@"%@/rmwebapp/sch/brsch-%ld/branchRecruit",oldUrl(),(long)branchID];
}

#pragma mark -  我的模块
//订单列表
+(NSString *)getMyOrderListBrsch:(NSString *)brsch Page:(NSString *)page PageSize:(NSString *)pageSize OrdersType:(NSString *)ordersType StuName:(NSString *)stuName PayStatus:(NSString *)payStatus OrderCode:(NSString *)orderCode StartTime:(NSString *)startTime EndTime:(NSString *)endTime PayCanal:(NSString *)payCanal{
    return [NSString stringWithFormat:@"%@/rmwebapp/brsch-%@/%@/%@/orders-0",oldUrl(),brsch,page,pageSize];
}
+(NSString *)getMyOrderList{
    return [NSString stringWithFormat:@"%@",oldUrl()];
}
//订单
+(NSString *)getMyOrderListBrsch:(NSString *)brsch Page:(NSString *)page PageSize:(NSString *)pageSize{
     return [NSString stringWithFormat:@"%@/rmwebapp/brsch-%@/%@/%@",oldUrl(),brsch,page,pageSize];
}
//http://baseurl/sch/brsch-{brid}/{page}/{pagesize}/coaches?name=&teachtype=&employstatus=&isblacklist=&tra=&mobile=&cardnum=


//我的教练列表
+ (NSString *)getMyTeacherList
{
    NSString * url = [NSString stringWithFormat:@"%@/coach/pagelist",newUrl()];
    return url;
}

//获取教练总数
+ (NSString *)getMyTeacherTotalNum
{
    NSString *url = [NSString stringWithFormat:@"%@/coach/count",newUrl()];
    return url;
}
//我的学员
+(NSString *)getMyStudentsBrid:(NSString *)brid PageNumber:(NSString *)page{
    return [NSString stringWithFormat:@"%@/rmwebapp/sch/brsch-%@/students/%@/20",oldUrl(),brid,page];
}
//我的学员查询
+(NSString *)getMyStudentsSearchBrid:(NSString *)brid PageNumber:(NSString *)page StudentNmae:(NSString *)studentName{
    return [NSString stringWithFormat:@"%@/rmwebapp/sch/brsch-%@/%@/20/students?name=%@",oldUrl(),brid,page,studentName];
}
#pragma mark -  根据车牌查询设备号
//根据车牌查询设备号
+(NSString *)getEquipmentNumberThroughLicenceNumber{
    NSString * url = [NSString stringWithFormat:@"%@/vehicle/devicenumber",newUrl()];
    return url;
}

#pragma mark - 三个总数(学员，教练,车辆)
//获取学员总数
+ (NSString *)getStudentTotalNumber
{
    NSString * url = [NSString stringWithFormat:@"%@/rmwebapp/stat/student-sum/",oldUrl()];
    return url;
}
//获取教练总数
+ (NSString *)getCoachTotalNumber
{
    NSString * url = [NSString stringWithFormat:@"%@/rmwebapp/stat/coach-sum/",oldUrl()];
    return url;
}
//获取车辆总数
+ (NSString *)getCarTotalNumber
{
    NSString * url = [NSString stringWithFormat:@"%@/rmwebapp/stat/coachcar-sum/",oldUrl()];
    return url;
}

@end
