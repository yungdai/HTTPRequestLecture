
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
    // http://api.icndb.com/jokes/random
    // http://www.bikesharetoronto.com/stations/json
    [_http retrieve:url successBlock:^(NSData * response) {
        NSError *error  = nil;
        // deserialise the informationwe get from the API
        NSDictionary *data = [NSJSONSerialization JSONObjectWithData:response options:0 error:&error];
//        NSLog(@"%@", response);
//        NSLog(@"%@",data);

        
        
        if (!error) {
//            NSDictionary *value = data[@"value"];
//            if (value && value[@"joke"]) {
//                _responseID = value[@"id"];
//                
//                // update the UI with the joke
//                [self.jokeLabel setText:value[@"joke"]];
//            
//             Parsing the bikes
            
            NSArray *value = [data valueForKey:@"stationBeanList"];

            // iterate through the stationBeanList dictionary (which is now stored in the NSDictionary *value)
            
            /* Dictionaries are, by definition, unordered. If you want to apply an order to the keys, you need to sort the keys.
             
             NSArray *keys = [articles allKeys];
             NSArray *sortedKeys = [keys sortedArrayUsingSelector:@selector(compare:)];
             for (NSString *key in sortedKeys) {
             // process key
             }
             */
            

            _stationName = [[NSMutableArray alloc]init];
            for (NSDictionary *results in value) {
                //       [stations addObject:[resultsDictionary objectForKey:@"stationName"]];

                [_stationName addObject:[results objectForKey:@"stationName"]];

            }

            NSLog(@"%@", _stationName);
            NSDictionary *value2 = data[@"value"];
            if (value2 && value2[@"stationName"]) {
                _responseID = value2[@"id"];

            // update the UI with the joke
                [self.jokeLabel setText:value2[@"stationName"]];
//
            }
        }
        
    }];
    
}


@end
