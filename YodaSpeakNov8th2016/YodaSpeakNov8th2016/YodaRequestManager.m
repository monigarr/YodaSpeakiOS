//
//  YodaRequestManager.m
//  YodaSpeakNov8th2016
//
//

#import "YodaRequestManager.h"
#import "YodaTranslateSentenceModel.h"
#import "AFNetworking.h"
#import "Prefs.h"

@interface YodaRequestManager()

@end

@implementation YodaRequestManager
    
+ (id)sharedInstance {
    static YodaRequestManager *sharedMyInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyInstance = [[self alloc] init];
    });
    return sharedMyInstance;
}
    
    // Translate yoda speak
-(void)getYodaTranslation:(NSString *)message success:(void (^)(YodaTranslateSentenceModel *))success failure:(void (^)(NSError *))failure
    {
        NSLog(@"request : %@", message);
        AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
        manager.responseSerializer = [AFHTTPResponseSerializer serializer];
        manager.requestSerializer = [AFPropertyListRequestSerializer serializer];
        
        [manager.requestSerializer setValue:PREFS_MASHAPE_YODA_KEY forHTTPHeaderField:PREFS_MASHAPE_YODA_KEY_HEADER];
        
        manager.requestSerializer.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
        
        [manager GET:PREFS_MASHAPE_YODA_BASE_URL parameters:@{PREFS_MASHAPE_YODA_BASE_URL_PARAMETERS: message} progress:nil success:^(NSURLSessionTask *task, id responseObject) {
            NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            if (string)
            {
                NSLog(@"response : %@", string);
                YodaTranslateSentenceModel *model = [[YodaTranslateSentenceModel alloc] init];
                model.translateSentence = string;
                success(model);
            }
            else
            {
                failure(nil);
            }
        } failure:^(NSURLSessionTask *operation, NSError *error) {
            failure(error);
        }];
    }
    

@end
