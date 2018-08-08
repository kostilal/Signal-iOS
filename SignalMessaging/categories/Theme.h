//
//  Copyright (c) 2018 Open Whisper Systems. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

#ifdef DEBUG
#define THEME_ENABLED
#endif

extern NSString *const ThemeDidChangeNotification;

@interface Theme : NSObject

- (instancetype)init NS_UNAVAILABLE;

+ (BOOL)isDarkThemeEnabled;
#ifdef THEME_ENABLED
+ (void)setIsDarkThemeEnabled:(BOOL)value;
#endif

@property (class, readonly, nonatomic) UIColor *backgroundColor;
@property (class, readonly, nonatomic) UIColor *primaryColor;
@property (class, readonly, nonatomic) UIColor *secondaryColor;
@property (class, readonly, nonatomic) UIColor *boldColor;

#pragma mark - Global App Colors

@property (class, readonly, nonatomic) UIColor *navbarBackgroundColor;
@property (class, readonly, nonatomic) UIColor *navbarIconColor;
@property (class, readonly, nonatomic) UIColor *navbarTitleColor;

@property (class, readonly, nonatomic) UIColor *toolbarBackgroundColor;

@property (class, readonly, nonatomic) UIColor *conversationButtonBackgroundColor;
@property (class, readonly, nonatomic) UIColor *conversationBackgroundColor;

@property (class, readonly, nonatomic) UIColor *cellSelectedColor;

#pragma mark -

+ (UIBarStyle)barStyle;

@end

NS_ASSUME_NONNULL_END
