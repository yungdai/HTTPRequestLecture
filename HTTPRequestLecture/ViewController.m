
#import "ViewController.h"



@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //initialising the two properties
    _http = [[HTTPCommunication alloc]init];
//    _mapView = [[MKMapView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
//    [self.view addSubview:_mapView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)getJokeWhenButtonPresssed:(id)sender {
    // retrieve the joke using HTTP communication
    NSURL *url = [NSURL URLWithString:@"http://www.bikesharetoronto.com/stations/json"];
    [_http retrieve:url successBlock:^(NSData * response) {
        NSError *error  = nil;
        // deserialise the informationwe get from the API
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
        NSLog(@"%@", response);
        NSLog(@"%@",data);
        
        
        if (!error) {
            NSDictionary *value = data[@"value"];
            if (value && value[@"joke"]) {
                _responseID = value[@"id"];
                
                // update the UI with the joke
                [self.jokeLabel setText:value[@"joke"]];
            }
        }
        
    }];
    
}


@end
