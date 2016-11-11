//
//  YodaRequestManager.h
//  YodaSpeakNov8th2016
//
//  Created by Monica Peters on 11/8/16.
//  Copyright © 2016 MoniGarr.com. All rights reserved.
//

#import <Foundation/Foundation.h>

@class YodaTranslateSentenceModel;

@interface YodaRequestManager : NSObject

+(id)sharedInstance;
    
-(void)getYodaTranslation:(NSString *)message success:(void (^)(YodaTranslateSentenceModel *translateSentenceModel))success failure:(void (^)(NSError *error))failure;
    
    
@end
