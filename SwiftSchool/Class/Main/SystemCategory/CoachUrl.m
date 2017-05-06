//
//  CoachUrl.m
//  PresidentHelper
//
//  Created by 张森明 on 2017/3/4.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import "CoachUrl.h"


static BOOL isDebug     = NO;//标记是否是开发测试环境

//微信baseUrl
static NSString * url1 = @"http://xinwei.yixc.com/rmwebwechat";//test
static NSString * url2 = @"http://js.yixc.com/rmwebwechat";

//驾校baseUrl
static NSString * url3 = @"http://xinwei.yixc.com/rmwebapp";//tets
static NSString * url4 = @"http://js.yixc.com/rmwebapp";

//单锭机baseUrl
static NSString * url5 = @"http://xinwei.yixc.com/rmwebacs";//test
static NSString * url6 = @"http://js.yixc.com/rmwebacs";

//非baseURL
static NSString * url7 = @"http://xinwei.yixc.com";//211(http://wechat.yixc.bid)
static NSString * url8 = @"http://js.yixc.com";

//照片的baseUrl
static NSString * url9 = @"http://rm-webapp-test.oss-cn-hangzhou.aliyuncs.com";//test:dev  xinwei:test
static NSString * url10 = @"http://rm-webapp.oss-cn-hangzhou.aliyuncs.com";

// 教练订单列表用到
static NSString * newTestHost  = @"http://183.238.51.33:3800/jp2ass.api";//test //183.238.51.33:3800
static NSString * newOfficialHost  = @"http://js.yixc.com/jp2ass.api";

@implementation CoachUrl

//添加排班
+(NSString *)addSchecoaCoaid:(NSString *)coaid{
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/sch/brsch/coach-%@",url,coaid];
}
//根据教练获取其所在分校的所有培训场地
+(NSString *)trainareasBrid:(NSString *)brid{
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/coach-%@/trainareas",url,brid];
}
//查询教练的排班详情
+(NSString *)searchClassTypeListBrid:(NSString *)brid{
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach-%@/charges",url,brid];
}
//删除班型
+(NSString *)deleteClassTypeId:(NSString *)classId{
    NSString * url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach/charge-%@",url,classId];
}
//查询教练
+(NSString *)coachInfoWithCoachId:(NSString *)coachId{
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/stu/sch/brsch/coach-%@",url,coachId];
}
/**
 获取全部预约列表URL
 */
+ (NSString *)getStudentReservationListUrl {
    NSString *url = isDebug ? url3 : url4;
    return [NSString stringWithFormat:@"%@/learncar/learn/derive/appointwithcoach",url];
}

/**
 获取指定日期的预约列表
 */
+ (NSString *)getApponintedDateStudentReservationListUrlWithCoachId:(NSString *)coachId withDate:(NSString *)date withPage:(NSInteger)page andPageSize:(NSInteger)pageSize {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coa-%@/appoint/%@?page=%ld&pagesize=%ld",url,coachId,date,page,(long)pageSize];
}

/**
 获取学员报名意向列表URL
 */
+ (NSString *)getApplicationIntentionListUrlWithCoachId:(NSString *)coachId withPage:(NSInteger)page andPageSize:(NSInteger)pageSize {
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/sch/brsch/coach-%@/enroll/%ld/%ld",url,coachId,page,pageSize];
}

/**
 获取教练评价列表URL
 */
+ (NSString *)getEvaluationListUrl {
    NSString *url = isDebug ? url7 : url8;
    return [NSString stringWithFormat:@"%@/learncar/learn/derive/fullevabycoa",url];
}

/**
 获取教练点评URL
 */
+ (NSString *)getCommitEvaluationUrl {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach/comment",url];
}

/**
 新增班型（收费标准）URL
 */
+ (NSString *)getAddClassTypeUrl {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach/charge",url];
}

/**
 添加 / 查询 / 删除宣传口号URL
 @param coachId 教练id
 */
+ (NSString *)getAddOrQueryOrDeleteSloganUrlWithCoachId:(NSString *)coachId {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach-%@/ad",url,coachId];
}

/**
 添加 / 查询个人简介URL
 
 @param coachId 教练id
 */
+ (NSString *)getAddOrQueryIntroductionUrlWithCoachId:(NSString *)coachId {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach-%@/introduction",url,coachId];
}

/**
 修改服务特色URL
 */
+ (NSString *)getEditServicesUrl {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach/services",url];
}

/**
 修改练车地点URL
 */
+ (NSString *)getEditTrainPlaceUrlWithCoachId:(NSString *)coachId andTrainPlaceId:(NSString *)trainPlaceId {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coach-%@/trainarea-%@",url,coachId,trainPlaceId];
}

/**
 修改教练个人生活照URL
 */
+ (NSString *)getEditCoachPhotoUrlWithCoachId:(NSString *)coachId andDeleteIdArray:(NSArray *)deleteIdArray {
    NSString *url = isDebug ? url5 : url6;
    NSString *photoIds = [deleteIdArray componentsJoinedByString:@","];
    if (photoIds == nil) {
        photoIds = @"";
    }
    return [NSString stringWithFormat:@"%@/coach-%@/photo?title=&delphoids=%@",url,coachId,photoIds];
}


/**
 批量删除教练员图片
 
 @param photoIdArray 图片id数组
 */
+ (NSString *)getDeleteCoachPhotoUrlWithPhotoIdArray:(NSArray *)photoIdArray {
    NSString *url = isDebug ? url5 : url6;
    NSString *photoIds = [photoIdArray componentsJoinedByString:@","];
    if (photoIds == nil) {
        photoIds = @"";
    }
    return [NSString stringWithFormat:@"%@/coach/photos?delphoids=%@",url,photoIds];
}

/**
 照片的url
 */
+ (NSString *)photoUrl:(NSString *)url {
    NSString *baseUrl = isDebug ? url9 : url10;
    return [NSString stringWithFormat:@"%@/%@",baseUrl,url];
}

#pragma mark - zjh
//登录url
+(NSString *)getLoginUrl{
    
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/coach/login",url];
}

//2.4获取已教过学员列表
//http://baseurl/sch/brsch/coach-{id}/teach/{page}/{pagesize}
+(NSString *)getStudentListUrlWithCoachId:(NSString *)coachId andPage:(NSInteger)page andPageSize:(NSInteger)pageSize
{
    NSString *url = isDebug ? url1 :url2;
    return [NSString stringWithFormat:@"%@/sch/brsch/coach-%@/teach/%ld/%ld",url,coachId,page,pageSize];
}

/**
 获取教练已经绑定的学员列表
 
 @param coachid 教练id
 @param page 页数
 @param pageSize 每页数
 */
+ (NSString *)getBindingStudentUrlWithCoachId:(NSString *)coachid withPage:(NSInteger)page andPageSize:(NSInteger)pageSize {
    NSString *url = isDebug ? url5 :url6;
    return [NSString stringWithFormat:@"%@/coaStuBind/coa-%@/%ld/%ld",url,coachid,(long)page,(long)pageSize];
}

//4.61 获取需要打印的培训审核表(学员学时信息)
//http://baseurl/sch/brsch/assessment/clahours/stu-{stuid}
+ (NSString *)getStudentLearnTimeInformationWithStudentId:(NSString *)studentId
{
    NSString *url = isDebug ? url5 :url6;
    
    return [NSString stringWithFormat:@"%@/sch/brsch/assessment/clahours/stu-%@",url,studentId];
}

// 获取学员某个科目的每天学时
// http://baseurl/sch/brsch/dailyrec/stu-{stuid}/subject-{subject}
+ (NSString *)getStudentPeriodsWithStudentId:(NSString *)studentId withSubject:(NSInteger)subject withPage:(NSInteger)page andPageSize:(NSInteger)pageSize {
    NSString *url = isDebug ? url5 :url6;
    return [NSString stringWithFormat:@"%@/sch/brsch/dailyrec/stu-%@/subject-%ld/%ld/%ld",url,studentId,(long)subject,(long)page,(long)pageSize];
}

////4.63查看某个学员某个科目的所有培训记录
////http://baseurl/sch/brsch/trainrec/stu-{stuid}/subject-{subject}/{page}/{pagesize}
//+ (NSString *)getStudentTrainingRecordWithStudentId:(NSString *)studentId andSubject:(NSInteger)subject andPage:(NSInteger)page andPagesize:(NSInteger)pagesize
//{
//    NSString *url = isDebug ? url5 :url6;
//    return [NSString stringWithFormat:@"%@/sch/brsch/trainrec/stu-%@/subject-%ld/%ld/%ld",url,studentId,subject,page,pagesize];
//}

//4.63查看某个学员某个科目的某一天的所有培训记录
//http://baseurl/sch/brsch/trainrec/stu-{stuid}/subject-{subject}/{page}/{pagesize}
+ (NSString *)getStudentTrainingRecordWithStudentId:(NSString *)studentId andSubject:(NSInteger)subject andPage:(NSInteger)page andPagesize:(NSInteger)pagesize andDate:(NSString *)date
{
    NSString *url = isDebug ? url5 :url6;
    return [NSString stringWithFormat:@"%@/sch/brsch/trainrec/stu-%@/subject-%ld/%ld/%ld?date=%@",url,studentId,(long)subject,(long)page,(long)pagesize,date];
}


// 行车轨迹
// http://baseurl/sch/brsch/trainingcar/track/{devid}/{timefrom}/{timeto}
+ (NSString *)getTrajectoryWithDeviceId:(NSString *)deviceId withFromTime:(NSString *)fromTime andEndTime:(NSString *)endTime {
    NSString *url = isDebug ? url1 :url2;
    return [NSString stringWithFormat:@"%@/sch/brsch/trainingcar/track/%@/%@/%@",url,deviceId,fromTime,endTime];
}

+ (NSString *)getStudentInfoWithStudentID{
    
    NSString *url = isDebug ? url5 :url6;
    return [NSString stringWithFormat:@"%@/student",url];
}

// 查看科目二和科目三的教学区域（用于标注围栏）
+ (NSString *)getTeachingRegionWithBrid:(NSString *)brid andPhase:(NSInteger)phase {
    NSString *url = isDebug ? url1 :url2;
    return [NSString stringWithFormat:@"%@/brsch-%@/phase-%ld/region",url,brid,(long)phase];
}

// 获取学员具体科目评测成绩
+ (NSString *)getStudentEvaluationWithStudentId:(NSString *)studentId andPhase:(NSString *)phase {
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/student-%@/examresult-%@",url,studentId,phase];
}

// 获取学员具体科目的约考和考试记录
+ (NSString *)getStudentExaminationRecordWithStudentId:(NSString *)studentId andPhase:(NSString *)phase {
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/student-%@/apomexam-%@",url,studentId,phase];
}
// 获取某个月份的预约记录
// http://localhost:8080/rmwebapp/schedule/brsch/{page}/{pagesize}/appoint/records
+ (NSString *)getStudentReservationOfMonthWithPage:(int)page andPagesize:(int)pagesize {
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/schedule/brsch/%d/%d/appoint/records",url,page,pagesize];
}

// 确认发布
+ (NSString *)confirmReleaseUrl{
    NSString *url = isDebug ? url7 : url8;
    return [NSString stringWithFormat:@"%@/learncar/learn/basis/addcoachposition",url];
}

// 查询学员
+ (NSString *)queryStudentUrl {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/student",url];
}

// 绑定学员
+ (NSString *)bindingStudent {
    NSString *url = isDebug ? url5 : url6;
    return [NSString stringWithFormat:@"%@/coaStuBind",url];
}

// 教练订单列表
+ (NSString *)coachOrderListUrl {
    NSString *url = isDebug ? newTestHost : newOfficialHost;
    return [NSString stringWithFormat:@"%@/order/coach/pagelist",url];
    
}

/**
 查询教练
 */
+ (NSString *)queryCoachInfoWithCoachId:(NSString *)coachId {
    NSString *url = isDebug ? url1 : url2;
    return [NSString stringWithFormat:@"%@/stu/sch/brsch/coach-%@",url,coachId];
}
@end
