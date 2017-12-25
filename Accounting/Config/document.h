//
//  Header.h
//  project
//
//  Created by Alex on 2016/11/18.
//  Copyright © 2016年 yuanzhoulv. All rights reserved.
//

#ifndef Header_h
#define Header_h

/**
 网络请求方法使用
 1.引入对应的网络请求类
 2.创建对象 - (instancetype)initWithApiUrl:(NSString *)api_url;
 3.设置通用参数（httpMethod：默认POST，type：默认NSNetRequestTypeNone正常网络请求类型，imageArr：默认空数组，imageNameArr：默认空数组）
 4.设置具体参数（对应类下自定义的参数）
 5.调用网络请求方法
 - (void)netRequestWithReturnValeuBlock:(ReturnValueBlock)block
                     WithErrorCodeBlock:(ErrorCodeBlock)errorBlock
                       WithFailureBlock:(FailureBlock)failureBlock
                      WithProgressBlock:(ProgressBlock)progressBlock
 6.根据返回的参数处理对应的事件
 */


/**
 JPush推送
 1.引入JPushSDK
 2.引入对应的JPush组件到AppDelegate文件夹下
 3.修改JPush组件中 #warning 的内容
 4.根据对应的项目修改JPushAppKey和apsForProduction
    apsForProduction
    1.3.1版本新增，用于标识当前应用所使用的APNs证书环境。
    0 (默认值)表示采用的是开发证书，1 表示采用生产证书发布应用。
    注：此字段的值要与Build Settings的Code Signing配置的证书环境一致。
 5.根据项目需求上传给后台所需的对应参数（例如：registrationID或者tag等）
 6.推送返回事件处理
 */

/**
 ShareSDK
 1.导入ShareSDK包
 2.添加对应的库
 3.导入对应的组件
 4.根据具体业务调整对应的参数
 5.在对应的控制器实现ShareSDK调起方法
 */




















#endif /* Header_h */
