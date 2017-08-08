
## webSocket

[SocketRocket](https://github.com/facebook/SocketRocket)

### SRWebSocket

```objc

  @interface SRWebSocket : NSObject

  // Make it with this
  - (instancetype)initWithURLRequest:(NSURLRequest *)request;

  // Set this before opening
  @property (nonatomic, weak) id <SRWebSocketDelegate> delegate;

  // Open with this
  - (void)open;

  // Close it with this
  - (void)close;

  // Send a Data
  - (void)sendData:(nullable NSData *)data error:(NSError **)error;

  // Send a UTF8 String
  - (void)sendString:(NSString *)string error:(NSError **)error;

  @end

```


### SRWebSocketDelegate

```objc

@protocol SRWebSocketDelegate <NSObject>

@optional

- (void)webSocketDidOpen:(SRWebSocket *)webSocket;

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessageWithString:(NSString *)string;
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessageWithData:(NSData *)data;

- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;
- (void)webSocket:(SRWebSocket *)webSocket didCloseWithCode:(NSInteger)code reason:(nullable NSString *)reason wasClean:(BOOL)wasClean;

@end

```
