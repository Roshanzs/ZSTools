//
//  ZSlistenAudio.m
//  疯子助手
//
//  Created by 紫贝壳 on 2016/11/17.
//  Copyright © 2016年 紫贝壳. All rights reserved.
//

#import "ZSlistenAudio.h"
#import <Speech/Speech.h>

@interface ZSlistenAudio()<AVSpeechSynthesizerDelegate>
@property(nonatomic,strong)AVSpeechSynthesizer *speech;
@property(nonatomic,strong)AVSpeechUtterance *utterance;

@end

@implementation ZSlistenAudio

+(instancetype)shareAudio{
    static ZSlistenAudio *share;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        share = [[ZSlistenAudio alloc]init];
    });
    return share;
}

-(AVSpeechSynthesizer *)speech{
    if (_speech == nil) {
        _speech = [[AVSpeechSynthesizer alloc]init];
        _speech.delegate = self;
    }
    return _speech;
}


-(void)listenWithText:(NSString *)text{
//    NSString *txtPath = [[NSBundle mainBundle] pathForResource:@"mdjyml" ofType:@"txt"];
//    NSStringEncoding *encoding = nil;
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSString *body = [NSString stringWithContentsOfFile:txtPath usedEncoding:encoding error:nil];
        //识别不到，按GBK编码再解码一次.这里不能先按GB18030解码，否则会出现整个文档无换行bug。
//        if (!body) {
//            body = [NSString stringWithContentsOfFile:txtPath encoding:0x80000632 error:nil];
//        }
        //还是识别不到，按GB18030编码再解码一次.
//        if (!body) {
//            body = [NSString stringWithContentsOfFile:txtPath encoding:0x80000631 error:nil];
//        }
//        if (body) {
//                        NSLog(@"2222%@",body);
//        }
        self.utterance = [AVSpeechUtterance speechUtteranceWithString:text];
        self.utterance.rate =  0.4f;
        self.utterance.voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"zh_CN"];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.speech speakUtterance:self.utterance];
        });
    });
}


-(void)stop{
    [self.speech stopSpeakingAtBoundary:AVSpeechBoundaryImmediate];
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didFinishSpeechUtterance:(AVSpeechUtterance *)utterance{
    NSLog(@"nextpage");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"nextPage" object:nil];
}

-(void)speechSynthesizer:(AVSpeechSynthesizer *)synthesizer didStartSpeechUtterance:(AVSpeechUtterance *)utterance{
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"nextPage" object:nil];
}




@end
