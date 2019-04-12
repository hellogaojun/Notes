//
//  ViewController.m
//  IPAShrink
//
//  Created by gaojun on 2019/4/11.
//  Copyright © 2019年 gaojun. All rights reserved.
//

#define kScreenWidth  [UIScreen mainScreen].bounds.size.width
#define kScreenHeight  [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"
#import <SDWebImage.h>

@interface ViewController () {
    NSInteger _test;
}
@property (weak, nonatomic) IBOutlet UIImageView *webPImView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 
    [self testLoadWebPImage];
}

- (void)testLoadWebPImage {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"test3" ofType:@"webp"];
    NSData *webPImageData = [[NSData alloc]initWithContentsOfFile:path];
    self.webPImView.image = [UIImage sd_imageWithData:webPImageData];
    //    [self.webPImView sd_setImageWithURL:[NSURL fileURLWithPath:path] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
    //
    //    }];
}

- (void)testImageUse {
    UIImageView *imView = [[UIImageView alloc]init];
    imView.image = [UIImage imageNamed:@"reg (1)@2x"];
    UIImageView *imView2 = [[UIImageView alloc]init];
    imView2.image = [UIImage imageNamed:@"选中-0"];
    UIImageView *imView3 = [[UIImageView alloc]init];
    imView3.image = [UIImage imageNamed:@"未选中-年"];
}


- (void)note {
    /**
     一,常见瘦身手段
     1.官方App Thining
     App Thining 会专门针对不同的设备来选择只适用于当前设备的内容以供下载.比如,iPhone6 只会下载@2x的图片资源,iPhone6Plus则只会下载@3x的图片资源.
     使用App Thinning后,用户下载时就只会下载一个适合自己设备的芯片指令架构文件.
     
     App Thinning有三种方式,包括App Slicing,Bitcode,On-Demand-Resources.
     * App Slicing，会在你向 iTunes Connect 上传 App 后，对 App 做切割，创建不同的变体，这样就可以适用到不同的设备。
     * On-Demand Resources，主要是为游戏多关卡场景服务的。它会根据用户的关卡进度下载随后几个关卡的资源，并且已经过关的资源也会被删掉，这样就可以减少初装 App 的包大小。
     * Bitcode ，是针对特定设备进行包大小优化，优化不明显。
     
     *** 其实,在这个阶段,大部分工作都是Xcode和App Store帮我们完成的,只需要在 .xcassets里面加入对应的@2x,@3x图片资源即可,添加的@2x图片和@3x图片，会在上传到 App Store 后被创建成不同的变体以减小 App 安装包的大小。而芯片指令集架构文件只需要按照默认的设置， App Store 就会根据设备创建不同的变体，每个变体里只有当前设备需要的那个芯片指令集架构文件。
     工程里面无论创建几个.xcassets文件夹,打包生成的ipa包里面都只会生成一个Assets.car
     
     2.无用图片资源清理
     建议使用工具扫描:https://github.com/hellogaojun/LSUnusedResources
     使用该工具只可以自己添加扫描规则,当然了,为了保险起见,对扫描出来的结果最好在工程中进行确认.因为这种扫描结果可能出现误检,漏检.比如,某些图片资源未用到,在代码里面被用到了,而这些代码已经被注释了...
     ******工程里的Bundle文件和Pod仓库里的资源文件单独进行检查
     
     3.图片资源压缩
     将图片转换成WebP,可以有损压缩,也可以无损压缩,当然了,对图片压缩处理后,在图片显示时还需要用libwebp进行解析,不过,WebP在CPU消耗和解码时间上会比PNG高两倍.所以,需要在性能和体积上作下取舍,这里仅仅是给出一个建议:如果图片大小超过了 100KB，你可以考虑使用 WebP；而小于 100KB 时，你可以使用网页工具 TinyPng(https://tinypng.com/)或者 GUI 工具ImageOptim(https://imageoptim.com/mac)进行图片压缩。这两个工具的压缩率没有 WebP 那么高，不会改变图片压缩方式，所以解析时对性能损耗也不会增加。
     * 一个png/gif与WebP转换的地址:http://isparta.github.io
    
     
     4.代码瘦身
     可执行文件就是Mach-O文件,其大小是由代码量决定的.对可执行文件进行瘦身,就是找到并删除无用代码的过程.可以有如下一般步骤:
     *  首先，找出方法和类的全集；
     *  然后，找到使用过的方法和类；
     *  接下来，取二者的差集得到无用代码；
     *  最后，由人工确认无用代码可删除后，进行删除即可。
     
     4.1 LinkMap结合Mach-O查找无用代码
     *** 我们可以通过分析LinkMap来获得所有的代码类和方法的信息.获取方式参考Reference文件夹下的linkMap图片所示
     参考Reference下的linkmap-解释说明.txt文件
     但是，这种查看方法并不是完美的，还会有些问题。原因在于,Objective-C 是门动态语言，方法调用可以写成在运行时动态调用，这样就无法收集全所有调用的方法和类。所以，我们通过这种方法找出的无用方法和类就只能作为参考，还需要二次确认。
     ****** MachOView这个软件暂不可用???!!!
     
     4.2 通过AppCode查找无用代码
     这种方式也存在弊端:1.代码量不宜超过百万行 2.可能会出现误检,也需要二次确认
     以本工程为例,使用AppCode 检查的一个结果参考Reference下面的AppCode-UnusedCode图片
     
     4.3 运行时检查类是否真正被使用过
     ***4.1和4.2的检查都是静态检查无用代码,随着App的迭代,可能会留下很多无用代码,这些代码在执行静态检查时会被用到,但是线上可能连这些老功能的入口都没有了,更是没有机会被用户用到。也就是说，这些无用功能相关的代码也是可以删除的。
     
     至于运行时的检查呢???
     
     4.3 自己造clang工具...
     */
}
@end
