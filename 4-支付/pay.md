
### 内购买

#### 根据productID 查询商品信息

NSArray \*product = [[NSArray alloc] initWithObjects:productId, nil];

NSSet \*set = [NSSet setWithArray:product];

SKProductsRequest \*productRequest = [[SKProductsRequest alloc] initWithProductIdentifiers:set];

#### 查询的回调

- (void)productsRequest:(SKProductsRequest \*)request didReceiveResponse:(SKProductsResponse \*)response;

- (void)request:(SKRequest \*)request didFailWithError:(NSError \*)error;

#### 发起购买请求

SKPayment \*payment = [SKPayment paymentWithProduct:product[0]];


#### 购买操作后的回调

- (void)paymentQueue:(SKPaymentQueue \*)queue updatedTransactions:(nonnull NSArray<SKPaymentTransaction \*> \*)transactions；

#### 发送交易凭证到服务端


#### 碰到的问题
1. 购买凭证验证超时验证，防止漏单
2. 退款的处理
3. 服务端沙盒账号和正常账号的支付凭证验证
