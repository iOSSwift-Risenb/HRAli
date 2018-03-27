
//import AliPaySDK

public class Ali:NSObject {
    
    static var manager = AliHelper()
    
    
    //MARK:- C-AppCFG
    public class func applicationDidFinish(scheme:String) {
        manager.scheme = scheme
    }
    
    //MARK:- C-CallBack
    public class func applicationOpenURL(url:URL) {
        manager.open(url);
    }
    
    //MARK:- P-PayAPI
    public class func pay(sign:String, success:(()->Void)?, failure:(()->Void)?) {
        manager.paySuccessBlock = success
        manager.payFailureBlock = failure
        AlipaySDK.defaultService().payOrder(sign, fromScheme: manager.scheme) { (result) in
            let value = result?[AnyHashable("resultStatus")] as! String
            if value == "9000" {
                if let s = manager.paySuccessBlock {
                    s()
                }
            } else {
                if let f = manager.payFailureBlock {
                    f()
                }
            }
        }
    }
}
