#if 0
#elif defined(__arm64__) && __arm64__
// Generated by Apple Swift version 5.5.2 (swiftlang-1300.0.47.5 clang-1300.0.29.30)
#ifndef IMAD_SWIFT_H
#define IMAD_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import ObjectiveC;
@import SafariServices;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="IMAd",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class EngageAd;

SWIFT_PROTOCOL("_TtP4IMAd15AdEventCallback_")
@protocol AdEventCallback
@optional
- (void)adDidExpandWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidCancelExpandWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidCloseExpandedWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionWillBeginWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionDidEndWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionWillLeaveApplicationWithEngageAd:(EngageAd * _Nullable)engageAd;
- (void)adDidBeginPreviewWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidEndPreviewWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidUnloadWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adWasClickedWithEngageAd:(EngageAd * _Nonnull)engageAd;
@end

@class AdUnit;
@class NSString;

SWIFT_PROTOCOL("_TtP4IMAd14AdLoadCallback_")
@protocol AdLoadCallback
- (void)adReadyWithAdUnit:(AdUnit * _Nonnull)adUnit;
- (void)adFailedWithZoneId:(NSString * _Nonnull)zoneId error:(NSError * _Nonnull)error;
@end


SWIFT_CLASS("_TtC4IMAd10AdTracking")
@interface AdTracking : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd6AdUnit")
@interface AdUnit : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

typedef SWIFT_ENUM(NSInteger, ClickTagMode, open) {
  ClickTagModeExternalBrowser = 0,
  ClickTagModeInAppBrowser = 1,
};

@class UIView;

SWIFT_CLASS("_TtC4IMAd8EngageAd")
@interface EngageAd : AdUnit
- (UIView * _Nullable)getAdView SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd21EngageAdConfiguration")
@interface EngageAdConfiguration : NSObject
- (nonnull instancetype)initWithAvailableArea:(CGRect)availableArea OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC4IMAd17EngageBannerModel")
@interface EngageBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class SdkConfiguration;

SWIFT_CLASS("_TtC4IMAd4IMAd")
@interface IMAd : NSObject
- (IMAd * _Nonnull)initIMAdSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (IMAd * _Nonnull)initIMAdSDKWithConfiguration:(SdkConfiguration * _Nonnull)configuration SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class IMAdTargetingProperties;
@class UIViewController;
@class NSNumber;

SWIFT_CLASS("_TtC4IMAd10IMAdEngage")
@interface IMAdEngage : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
- (IMAdEngage * _Nonnull)initIMAdEngageWithImadSDK:(IMAd * _Nonnull)imadSDK publisherId:(NSString * _Nonnull)publisherId SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)setPremiumZoneWithPremiumZoneId:(NSString * _Nonnull)premiumZoneId;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback adEventCallback:(id <AdEventCallback> _Nonnull)adEventCallback viewController:(UIViewController * _Nonnull)viewController config:(EngageAdConfiguration * _Nullable)config;
- (void)setAdRefreshIntervalWithNewAdRefreshInterval:(NSInteger)newAdRefreshInterval;
- (void)destroy;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd10IMAdNative")
@interface IMAdNative : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
/// Init NativeAds
- (IMAdNative * _Nonnull)initIMAdNativeWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
/// Load Native Ads
/// @param zoneId The id of the ads url
/// @return completionHandler Return Native Ads Data in NativeAdsModel, NSCache for Image and NSError
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd15IMAdNativeVideo")
@interface IMAdNativeVideo : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
/// Init NativeVideo
- (IMAdNativeVideo * _Nonnull)initIMAdNativeVideoWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd23IMAdTargetingProperties")
@interface IMAdTargetingProperties : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Gender;)
+ (NSString * _Nonnull)IMATargetPropKey_Gender SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Age;)
+ (NSString * _Nonnull)IMATargetPropKey_Age SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Birthday;)
+ (NSString * _Nonnull)IMATargetPropKey_Birthday SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Persona;)
+ (NSString * _Nonnull)IMATargetPropKey_Persona SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Language;)
+ (NSString * _Nonnull)IMATargetPropKey_Language SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Latitude;)
+ (NSString * _Nonnull)IMATargetPropKey_Latitude SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Longtide;)
+ (NSString * _Nonnull)IMATargetPropKey_Longtide SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)setTargetingPropertiesWithKey:(NSString * _Nonnull)key value:(NSString * _Nonnull)value;
- (NSString * _Nonnull)getPropertiseDictString SWIFT_WARN_UNUSED_RESULT;
@end

@protocol VideoInterstitialAdLoadCallback;

SWIFT_CLASS("_TtC4IMAd21IMAdVideoInterstitial")
@interface IMAdVideoInterstitial : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
- (IMAdVideoInterstitial * _Nonnull)initIMAdVideoInterstitialWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback videoInterstitialAdLoadCallback:(id <VideoInterstitialAdLoadCallback> _Nonnull)videoInterstitialAdLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSData;

SWIFT_CLASS("_TtC4IMAd8NativeAd")
@interface NativeAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (NSString * _Nonnull)getTitle SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getDesc SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getAdvertiser SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getThumbnail SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getPortraitImage SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getLandscapeImage SWIFT_WARN_UNUSED_RESULT;
- (void)clickedWithViewController:(UIViewController * _Nonnull)viewController;
- (void)displayed;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC4IMAd28NativeAdCreativeDetailsModel")
@interface NativeAdCreativeDetailsModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd29NativeAdInvitationBannerModel")
@interface NativeAdInvitationBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd13NativeVideoAd")
@interface NativeVideoAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getTitle SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getDesc SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getAdvertiser SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (void)clickedWithViewController:(UIViewController * _Nonnull)viewController;
- (void)displayed;
- (void)setVideoViewWithVideoView:(UIView * _Nonnull)videoView;
- (void)pauseVideo;
- (void)resumeVideo;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




SWIFT_CLASS("_TtC4IMAd31NativeVideoCreativeDetailsModel")
@interface NativeVideoCreativeDetailsModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd32NativeVideoInvitationBannerModel")
@interface NativeVideoInvitationBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class SFSafariViewController;

SWIFT_CLASS("_TtC4IMAd11SFSafariWeb")
@interface SFSafariWeb : NSObject <SFSafariViewControllerDelegate>
- (void)safariViewControllerDidFinish:(SFSafariViewController * _Nonnull)controller;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd16SdkConfiguration")
@interface SdkConfiguration : NSObject
- (nonnull instancetype)initWithClickTagMode:(enum ClickTagMode)clickTagMode OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC4IMAd19VideoInterstitialAd")
@interface VideoInterstitialAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (void)showWithViewController:(UIViewController * _Nonnull)viewController;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_PROTOCOL("_TtP4IMAd31VideoInterstitialAdLoadCallback_")
@protocol VideoInterstitialAdLoadCallback
- (void)adClosed;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#elif defined(__x86_64__) && __x86_64__
// Generated by Apple Swift version 5.5.2 (swiftlang-1300.0.47.5 clang-1300.0.29.30)
#ifndef IMAD_SWIFT_H
#define IMAD_SWIFT_H
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wgcc-compat"

#if !defined(__has_include)
# define __has_include(x) 0
#endif
#if !defined(__has_attribute)
# define __has_attribute(x) 0
#endif
#if !defined(__has_feature)
# define __has_feature(x) 0
#endif
#if !defined(__has_warning)
# define __has_warning(x) 0
#endif

#if __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <Foundation/Foundation.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus)
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if __has_attribute(ns_consumed)
# define SWIFT_RELEASES_ARGUMENT __attribute__((ns_consumed))
#else
# define SWIFT_RELEASES_ARGUMENT
#endif
#if __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if __has_attribute(noreturn)
# define SWIFT_NORETURN __attribute__((noreturn))
#else
# define SWIFT_NORETURN
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif
#if !defined(SWIFT_RESILIENT_CLASS)
# if __has_attribute(objc_class_stub)
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME) __attribute__((objc_class_stub))
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_class_stub)) SWIFT_CLASS_NAMED(SWIFT_NAME)
# else
#  define SWIFT_RESILIENT_CLASS(SWIFT_NAME) SWIFT_CLASS(SWIFT_NAME)
#  define SWIFT_RESILIENT_CLASS_NAMED(SWIFT_NAME) SWIFT_CLASS_NAMED(SWIFT_NAME)
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM_ATTR)
# if defined(__has_attribute) && __has_attribute(enum_extensibility)
#  define SWIFT_ENUM_ATTR(_extensibility) __attribute__((enum_extensibility(_extensibility)))
# else
#  define SWIFT_ENUM_ATTR(_extensibility)
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name, _extensibility) enum _name : _type _name; enum SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# if __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_ATTR(_extensibility) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME, _extensibility) SWIFT_ENUM(_type, _name, _extensibility)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_WEAK_IMPORT)
# define SWIFT_WEAK_IMPORT __attribute__((weak_import))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if __has_feature(attribute_diagnose_if_objc)
# define SWIFT_DEPRECATED_OBJC(Msg) __attribute__((diagnose_if(1, Msg, "warning")))
#else
# define SWIFT_DEPRECATED_OBJC(Msg) SWIFT_DEPRECATED_MSG(Msg)
#endif
#if !defined(IBSegueAction)
# define IBSegueAction
#endif
#if __has_feature(modules)
#if __has_warning("-Watimport-in-framework-header")
#pragma clang diagnostic ignored "-Watimport-in-framework-header"
#endif
@import CoreGraphics;
@import ObjectiveC;
@import SafariServices;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"
#if __has_warning("-Wpragma-clang-attribute")
# pragma clang diagnostic ignored "-Wpragma-clang-attribute"
#endif
#pragma clang diagnostic ignored "-Wunknown-pragmas"
#pragma clang diagnostic ignored "-Wnullability"

#if __has_attribute(external_source_symbol)
# pragma push_macro("any")
# undef any
# pragma clang attribute push(__attribute__((external_source_symbol(language="Swift", defined_in="IMAd",generated_declaration))), apply_to=any(function,enum,objc_interface,objc_category,objc_protocol))
# pragma pop_macro("any")
#endif

@class EngageAd;

SWIFT_PROTOCOL("_TtP4IMAd15AdEventCallback_")
@protocol AdEventCallback
@optional
- (void)adDidExpandWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidCancelExpandWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidCloseExpandedWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionWillBeginWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionDidEndWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adActionWillLeaveApplicationWithEngageAd:(EngageAd * _Nullable)engageAd;
- (void)adDidBeginPreviewWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidEndPreviewWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adDidUnloadWithEngageAd:(EngageAd * _Nonnull)engageAd;
- (void)adWasClickedWithEngageAd:(EngageAd * _Nonnull)engageAd;
@end

@class AdUnit;
@class NSString;

SWIFT_PROTOCOL("_TtP4IMAd14AdLoadCallback_")
@protocol AdLoadCallback
- (void)adReadyWithAdUnit:(AdUnit * _Nonnull)adUnit;
- (void)adFailedWithZoneId:(NSString * _Nonnull)zoneId error:(NSError * _Nonnull)error;
@end


SWIFT_CLASS("_TtC4IMAd10AdTracking")
@interface AdTracking : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd6AdUnit")
@interface AdUnit : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

typedef SWIFT_ENUM(NSInteger, ClickTagMode, open) {
  ClickTagModeExternalBrowser = 0,
  ClickTagModeInAppBrowser = 1,
};

@class UIView;

SWIFT_CLASS("_TtC4IMAd8EngageAd")
@interface EngageAd : AdUnit
- (UIView * _Nullable)getAdView SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd21EngageAdConfiguration")
@interface EngageAdConfiguration : NSObject
- (nonnull instancetype)initWithAvailableArea:(CGRect)availableArea OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC4IMAd17EngageBannerModel")
@interface EngageBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class SdkConfiguration;

SWIFT_CLASS("_TtC4IMAd4IMAd")
@interface IMAd : NSObject
- (IMAd * _Nonnull)initIMAdSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (IMAd * _Nonnull)initIMAdSDKWithConfiguration:(SdkConfiguration * _Nonnull)configuration SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class IMAdTargetingProperties;
@class UIViewController;
@class NSNumber;

SWIFT_CLASS("_TtC4IMAd10IMAdEngage")
@interface IMAdEngage : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
- (IMAdEngage * _Nonnull)initIMAdEngageWithImadSDK:(IMAd * _Nonnull)imadSDK publisherId:(NSString * _Nonnull)publisherId SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)setPremiumZoneWithPremiumZoneId:(NSString * _Nonnull)premiumZoneId;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback adEventCallback:(id <AdEventCallback> _Nonnull)adEventCallback viewController:(UIViewController * _Nonnull)viewController config:(EngageAdConfiguration * _Nullable)config;
- (void)setAdRefreshIntervalWithNewAdRefreshInterval:(NSInteger)newAdRefreshInterval;
- (void)destroy;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd10IMAdNative")
@interface IMAdNative : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
/// Init NativeAds
- (IMAdNative * _Nonnull)initIMAdNativeWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
/// Load Native Ads
/// @param zoneId The id of the ads url
/// @return completionHandler Return Native Ads Data in NativeAdsModel, NSCache for Image and NSError
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd15IMAdNativeVideo")
@interface IMAdNativeVideo : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
/// Init NativeVideo
- (IMAdNativeVideo * _Nonnull)initIMAdNativeVideoWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd23IMAdTargetingProperties")
@interface IMAdTargetingProperties : NSObject
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Gender;)
+ (NSString * _Nonnull)IMATargetPropKey_Gender SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Age;)
+ (NSString * _Nonnull)IMATargetPropKey_Age SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Birthday;)
+ (NSString * _Nonnull)IMATargetPropKey_Birthday SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Persona;)
+ (NSString * _Nonnull)IMATargetPropKey_Persona SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Language;)
+ (NSString * _Nonnull)IMATargetPropKey_Language SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Latitude;)
+ (NSString * _Nonnull)IMATargetPropKey_Latitude SWIFT_WARN_UNUSED_RESULT;
SWIFT_CLASS_PROPERTY(@property (nonatomic, class, readonly, copy) NSString * _Nonnull IMATargetPropKey_Longtide;)
+ (NSString * _Nonnull)IMATargetPropKey_Longtide SWIFT_WARN_UNUSED_RESULT;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
- (void)setTargetingPropertiesWithKey:(NSString * _Nonnull)key value:(NSString * _Nonnull)value;
- (NSString * _Nonnull)getPropertiseDictString SWIFT_WARN_UNUSED_RESULT;
@end

@protocol VideoInterstitialAdLoadCallback;

SWIFT_CLASS("_TtC4IMAd21IMAdVideoInterstitial")
@interface IMAdVideoInterstitial : NSObject
@property (nonatomic, strong) IMAdTargetingProperties * _Null_unspecified targetingProperties;
- (IMAdVideoInterstitial * _Nonnull)initIMAdVideoInterstitialWithImadSDK:(IMAd * _Nonnull)imadSDK SWIFT_METHOD_FAMILY(none) SWIFT_WARN_UNUSED_RESULT;
- (void)loadWithZoneId:(NSString * _Nonnull)zoneId adLoadCallback:(id <AdLoadCallback> _Nonnull)adLoadCallback videoInterstitialAdLoadCallback:(id <VideoInterstitialAdLoadCallback> _Nonnull)videoInterstitialAdLoadCallback;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class NSData;

SWIFT_CLASS("_TtC4IMAd8NativeAd")
@interface NativeAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (NSString * _Nonnull)getTitle SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getDesc SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getAdvertiser SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getThumbnail SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getPortraitImage SWIFT_WARN_UNUSED_RESULT;
- (NSData * _Nonnull)getLandscapeImage SWIFT_WARN_UNUSED_RESULT;
- (void)clickedWithViewController:(UIViewController * _Nonnull)viewController;
- (void)displayed;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_CLASS("_TtC4IMAd28NativeAdCreativeDetailsModel")
@interface NativeAdCreativeDetailsModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd29NativeAdInvitationBannerModel")
@interface NativeAdInvitationBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd13NativeVideoAd")
@interface NativeVideoAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getTitle SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getDesc SWIFT_WARN_UNUSED_RESULT;
- (NSString * _Nonnull)getAdvertiser SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (void)clickedWithViewController:(UIViewController * _Nonnull)viewController;
- (void)displayed;
- (void)setVideoViewWithVideoView:(UIView * _Nonnull)videoView;
- (void)pauseVideo;
- (void)resumeVideo;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end




SWIFT_CLASS("_TtC4IMAd31NativeVideoCreativeDetailsModel")
@interface NativeVideoCreativeDetailsModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd32NativeVideoInvitationBannerModel")
@interface NativeVideoInvitationBannerModel : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class SFSafariViewController;

SWIFT_CLASS("_TtC4IMAd11SFSafariWeb")
@interface SFSafariWeb : NSObject <SFSafariViewControllerDelegate>
- (void)safariViewControllerDidFinish:(SFSafariViewController * _Nonnull)controller;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end


SWIFT_CLASS("_TtC4IMAd16SdkConfiguration")
@interface SdkConfiguration : NSObject
- (nonnull instancetype)initWithClickTagMode:(enum ClickTagMode)clickTagMode OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
+ (nonnull instancetype)new SWIFT_UNAVAILABLE_MSG("-init is unavailable");
@end


SWIFT_CLASS("_TtC4IMAd19VideoInterstitialAd")
@interface VideoInterstitialAd : AdUnit
- (NSString * _Nullable)getZoneId SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)getType SWIFT_WARN_UNUSED_RESULT;
- (void)destroy;
- (void)showWithViewController:(UIViewController * _Nonnull)viewController;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end



SWIFT_PROTOCOL("_TtP4IMAd31VideoInterstitialAdLoadCallback_")
@protocol VideoInterstitialAdLoadCallback
- (void)adClosed;
@end

#if __has_attribute(external_source_symbol)
# pragma clang attribute pop
#endif
#pragma clang diagnostic pop
#endif

#endif
