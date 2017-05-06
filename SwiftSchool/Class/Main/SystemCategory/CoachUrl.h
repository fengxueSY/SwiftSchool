//
//  CoachUrl.h
//  PresidentHelper
//
//  Created by 张森明 on 2017/3/4.
//  Copyright © 2017年 张俊辉. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoachUrl : NSObject
#pragma mark - 增加班型界面
/**
 *  添加排班
 */
+(NSString *)addSchecoaCoaid:(NSString *)coaid;
/**
 *  根据教练获取其所在分校的所有培训场地
 */
+(NSString *)trainareasBrid:(NSString *)brid;
#pragma mark - 班型列表界面

/**
 *  查询教练的排班详情
 */
+(NSString *)searchClassTypeListBrid:(NSString *)brid;

/**
 *  删除班型
 */
+(NSString *)deleteClassTypeId:(NSString *)classId;

/**
 *  查询教练
 */
+(NSString *)coachInfoWithCoachId:(NSString *)coachId;

/**
 获取全部预约列表URL
 */
+ (NSString *)getStudentReservationListUrl;

/**
 获取指定日期的预约列表URL
 */
+ (NSString *)getApponintedDateStudentReservationListUrlWithCoachId:(NSString *)coachId withDate:(NSString *)date withPage:(NSInteger)page andPageSize:(NSInteger)pageSize;

/**
 获取学员报名意向列表URL
 */
+ (NSString *)getApplicationIntentionListUrlWithCoachId:(NSString *)coachId withPage:(NSInteger)page andPageSize:(NSInteger)pageSize;

/**
 获取教练评价列表URL
 */
+ (NSString *)getEvaluationListUrl;

/**
 获取教练点评URL
 */
+ (NSString *)getCommitEvaluationUrl;

/**
 新增班型（收费标准）URL
 */
+ (NSString *)getAddClassTypeUrl;

/**
 添加 / 查询 / 删除宣传口号URL
 @param coachId 教练id
 */
+ (NSString *)getAddOrQueryOrDeleteSloganUrlWithCoachId:(NSString *)coachId;

/**
 添加 / 查询个人简介URL
 @param coachId 教练id
 */
+ (NSString *)getAddOrQueryIntroductionUrlWithCoachId:(NSString *)coachId;

/**
 修改服务特色URL
 */
+ (NSString *)getEditServicesUrl;

/**
 修改练车地点URL
 */
+ (NSString *)getEditTrainPlaceUrlWithCoachId:(NSString *)coachId andTrainPlaceId:(NSString *)trainPlaceId;

/**
 修改教练个人生活照URL
 */
+ (NSString *)getEditCoachPhotoUrlWithCoachId:(NSString *)coachId andDeleteIdArray:(NSArray *)deleteIdArray;

/**
 照片的url
 */
+ (NSString *)photoUrl:(NSString *)url;

/**
 批量删除教练员图片
 
 @param photoIdArray 图片id数组
 */
+ (NSString *)getDeleteCoachPhotoUrlWithPhotoIdArray:(NSArray *)photoIdArray;

#pragma mark - zjh
/**
 *  获取登录的url
 */
+(NSString *)getLoginUrl;
//2.4获取已教过学员列表
+ (NSString *)getStudentListUrlWithCoachId:(NSString *)coachId andPage:(NSInteger)page andPageSize:(NSInteger)pageSize;

/**
 获取教练已经绑定的学员列表
 
 @param coachid 教练id
 @param page 页数
 @param pageSize 每页数
 */
+ (NSString *)getBindingStudentUrlWithCoachId:(NSString *)coachid withPage:(NSInteger)page andPageSize:(NSInteger)pageSize;

//4.61 获取需要打印的培训审核表(学员学时信息)
+ (NSString *)getStudentLearnTimeInformationWithStudentId:(NSString *)studentId;

// 获取学员某个科目的每天学时
+ (NSString *)getStudentPeriodsWithStudentId:(NSString *)studentId withSubject:(NSInteger)subject withPage:(NSInteger)page andPageSize:(NSInteger)pageSize;


////4.63查看某个学员某个科目的所有培训记录
//+ (NSString *)getStudentTrainingRecordWithStudentId:(NSString *)studentId andSubject:(NSInteger)subject andPage:(NSInteger)page andPagesize:(NSInteger)pagesize;

//4.63查看某个学员某个科目的某一天的所有培训记录
//http://baseurl/sch/brsch/trainrec/stu-{stuid}/subject-{subject}/{page}/{pagesize}
+ (NSString *)getStudentTrainingRecordWithStudentId:(NSString *)studentId andSubject:(NSInteger)subject andPage:(NSInteger)page andPagesize:(NSInteger)pagesize andDate:(NSString *)date;

// 行车轨迹
// http://baseurl/sch/brsch/trainingcar/track/{devid}/{timefrom}/{timeto}
+ (NSString *)getTrajectoryWithDeviceId:(NSString *)deviceId withFromTime:(NSString *)fromTime andEndTime:(NSString *)endTime;

// 查看科目二和科目三的教学区域（用于标注围栏）
+ (NSString *)getTeachingRegionWithBrid:(NSString *)brid andPhase:(NSInteger)phase;

// 获取学员具体科目评测成绩
+ (NSString *)getStudentEvaluationWithStudentId:(NSString *)studentId andPhase:(NSString *)phase;

// 获取学员具体科目的约考和考试记录
+ (NSString *)getStudentExaminationRecordWithStudentId:(NSString *)studentId andPhase:(NSString *)phase;

// 获取某个月份的预约记录
+ (NSString *)getStudentReservationOfMonthWithPage:(int)page andPagesize:(int)pagesize;

//通过学员身份证获取学员信息
+ (NSString *)getStudentInfoWithStudentID;

// 确认发布
+ (NSString *)confirmReleaseUrl;

// 查询学员
+ (NSString *)queryStudentUrl;

// 绑定学员
+ (NSString *)bindingStudent;

// 教练订单列表
+ (NSString *)coachOrderListUrl;

/**
 查询教练
 */
+ (NSString *)queryCoachInfoWithCoachId:(NSString *)coachId;
@end
