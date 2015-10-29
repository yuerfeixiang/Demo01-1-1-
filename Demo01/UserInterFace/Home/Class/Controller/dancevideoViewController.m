//
//  dancevideoViewController.m
//  danceViewDemo
//
//  Created by zq on 15/10/27.
//  Copyright © 2015年 zq. All rights reserved.
//

#import "dancevideoViewController.h"
#import "danceVeidoTableViewCell.h"
#import <AVFoundation/AVFoundation.h>
#import "Common.h"


@interface dancevideoViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)AVPlayer *player;
@property (nonatomic,strong)UIView *container;
@property (strong, nonatomic)  UIButton *playOrPause;//播放/暂停按钮

@end

@implementation dancevideoViewController
{
    UIScrollView *scrollView;
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self removeObserverFromPlayerItem:_player.currentItem];
    [self removeNotification];
    
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(20, 20, 30, 30)];
    [rightButton addTarget:self action:@selector(backToVie) forControlEvents:UIControlEventTouchUpInside];
    
    rightButton.backgroundColor = [UIColor redColor];
//    UIBarButtonItem *right = [[ UIBarButtonItem alloc]initWithCustomView:rightButton];
    

    [self.view addSubview:rightButton];
    [self setupUI];
//    [self.player play];
    // Do any additional setup after loading the view.
}
-(void)setupUI{
    //创建播放器层
    self.container =[[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, 211)];
    
    self.container.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.container];
    self.playOrPause = [[UIButton alloc]initWithFrame:CGRectMake(15, self.container.frame.size.height-39, 28, 28)];
    self.playOrPause.backgroundColor = [UIColor redColor];
    [self.playOrPause addTarget:self action:@selector(playClick:) forControlEvents:UIControlEventTouchUpInside];
    AVPlayerLayer *playerLayer=[AVPlayerLayer playerLayerWithPlayer:self.player];
    playerLayer.frame=CGRectMake(0, 0, self.view.frame.size.width, 200);
    playerLayer.videoGravity=AVLayerVideoGravityResizeAspect;//视频填充模式
    [self.container.layer addSublayer:playerLayer];
    [self.container addSubview:self.playOrPause];
    self.commentTable = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+211, self.view.frame.size.width, self.view.frame.size.height-64-211) style:UITableViewStylePlain];
    self.commentTable.delegate = self;
    self.commentTable.dataSource = self;
    [self.view addSubview:self.commentTable];
    
}
-(AVPlayer *)player{
    if (!_player) {
        AVPlayerItem *playerItem=[self getPlayItem:0];
        _player=[AVPlayer playerWithPlayerItem:playerItem];
        [self addProgressObserver];
        [self addObserverToPlayerItem:playerItem];
    }
    return _player;
}
-(AVPlayerItem *)getPlayItem:(int)videoIndex{
    NSString *urlStr=[NSString stringWithFormat:@"http://mpv.videocc.net/2c9d4d6574/e/2c9d4d65743b9ef5da3bca038a5b552e_1.mp4"];
    urlStr =[urlStr stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    NSURL *url=[NSURL URLWithString:urlStr];
    AVPlayerItem *playerItem=[AVPlayerItem playerItemWithURL:url];
    return playerItem;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)addNotification{
    //给AVPlayerItem添加播放完成通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(playbackFinished:) name:AVPlayerItemDidPlayToEndTimeNotification object:self.player.currentItem];
}

-(void)removeNotification{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)playbackFinished:(NSNotification *)notification{
    NSLog(@"视频播放完成.");
}
-(void)addProgressObserver{
    AVPlayerItem *playerItem=self.player.currentItem;
//    UIProgressView *progress=self.progress;
    //这里设置每秒执行一次
    [self.player addPeriodicTimeObserverForInterval:CMTimeMake(1.0, 1.0) queue:dispatch_get_main_queue() usingBlock:^(CMTime time) {
        float current=CMTimeGetSeconds(time);
        float total=CMTimeGetSeconds([playerItem duration]);
        NSLog(@"当前已经播放%.2fs.",current);
        if (current) {
//            [progress setProgress:(current/total) animated:YES];
        }
    }];
}
-(void)addObserverToPlayerItem:(AVPlayerItem *)playerItem{
    //监控状态属性，注意AVPlayer也有一个status属性，通过监控它的status也可以获得播放状态
    [playerItem addObserver:self forKeyPath:@"status" options:NSKeyValueObservingOptionNew context:nil];
    //监控网络加载情况属性
    [playerItem addObserver:self forKeyPath:@"loadedTimeRanges" options:NSKeyValueObservingOptionNew context:nil];
}
-(void)removeObserverFromPlayerItem:(AVPlayerItem *)playerItem{
    [playerItem removeObserver:self forKeyPath:@"status"];
    [playerItem removeObserver:self forKeyPath:@"loadedTimeRanges"];
}
/**
 *  通过KVO监控播放器状态
 *
 *  @param keyPath 监控属性
 *  @param object  监视器
 *  @param change  状态改变
 *  @param context 上下文
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context{
    AVPlayerItem *playerItem=object;
    if ([keyPath isEqualToString:@"status"]) {
        AVPlayerStatus status= [[change objectForKey:@"new"] intValue];
        if(status==AVPlayerStatusReadyToPlay){
            NSLog(@"正在播放...，视频总长度:%.2f",CMTimeGetSeconds(playerItem.duration));
        }
    }else if([keyPath isEqualToString:@"loadedTimeRanges"]){
        NSArray *array=playerItem.loadedTimeRanges;
        CMTimeRange timeRange = [array.firstObject CMTimeRangeValue];//本次缓冲时间范围
        float startSeconds = CMTimeGetSeconds(timeRange.start);
        float durationSeconds = CMTimeGetSeconds(timeRange.duration);
        NSTimeInterval totalBuffer = startSeconds + durationSeconds;//缓冲总长度
        NSLog(@"共缓冲：%.2f",totalBuffer);
        //
    }
}

#pragma mark - UI事件
- (void)playClick:(UIButton *)sender {
    //    AVPlayerItemDidPlayToEndTimeNotification
    //AVPlayerItem *playerItem= self.player.currentItem;
    if(self.player.rate==0){ //说明时暂停
        [sender setImage:[UIImage imageNamed:@"player_pause"] forState:UIControlStateNormal];
        [self.player play];
    }else if(self.player.rate==1){//正在播放
        [self.player pause];
        [sender setImage:[UIImage imageNamed:@"player_play"] forState:UIControlStateNormal];
    }
}
#pragma mark - tableView代理,数据源
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(section==0)
    {
        return 1;
    }else
    {
     return 15;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // 1.定义标识
    static NSString *ID = @"cell";
    // 2.去缓存区取出可循环使用的cell
    danceVeidoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    // 3.创建可循环使用的cell
    if ( cell == nil ) {

        cell = [[danceVeidoTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        }


    if (indexPath.section == 0) {
        cell.headImage.hidden = YES;
        cell.nameLabel.hidden = YES;
        cell.supportLabel.hidden = YES;
        cell.supportImage.hidden = YES;
        cell.timeLabel.hidden = YES;
        cell.messageLabel.hidden = YES;
        cell.chooseView.hidden = NO;
        cell.chooseView.frame = CGRectMake(0, 0, self.view.frame.size.width, 134+25);

        for (int i=0; i<10; i++) {
            cell.chooseView.contentSize = CGSizeMake(self.view.frame.size.width, (i+1)*44);
            UIButton *chooseButton = [UIButton buttonWithType:UIButtonTypeCustom];
            chooseButton.frame = CGRectMake(0, i*44, self.view.frame.size.width, 44);
            [cell.chooseView addSubview:chooseButton];
            chooseButton.tag = i;
            [chooseButton addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
            UILabel *numberLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 12, 10, 20)];
            numberLabel.text = [NSString stringWithFormat:@"%d",i];
            numberLabel.textColor = HEXCOLOR(0xbcbcbc);
            [numberLabel setFont:[UIFont systemFontOfSize:14]];
            [chooseButton addSubview:numberLabel];
            UIImageView *axleView = [[UIImageView alloc]initWithFrame:CGRectMake(numberLabel.right+12, 0, 9, 44)];
            [axleView setImage:[UIImage imageNamed:@"已观看2@.png"]];
            [chooseButton addSubview: axleView];
            UILabel *nameLabel = [[UILabel alloc]initWithFrame:CGRectMake(60, 7, 100, 20)];
           
            nameLabel.text = [NSString stringWithFormat:@"蕾哈娜舞蹈教学%d",i];
            nameLabel.textColor = HEXCOLOR(0x656869);
            
            [nameLabel setFont:[UIFont systemFontOfSize:12]];
            [nameLabel sizeToFit];
            [chooseButton addSubview:nameLabel];
            UIView *cottonView = [[UIView alloc]initWithFrame:CGRectMake(nameLabel.left, chooseButton.height-1, 20000, 0.5)];
            [chooseButton addSubview:cottonView];
            cottonView.backgroundColor = HEXCOLOR(0xeaeaea);
            UILabel *timeLabel = [[UILabel alloc]initWithFrame:CGRectMake(73, nameLabel.bottom+7, 20, 10)];
            timeLabel.text = @"11:20";
            timeLabel.textColor = HEXCOLOR(0xbcbcbc);
            [timeLabel setFont:[UIFont systemFontOfSize:10]];
            [timeLabel sizeToFit];
            [chooseButton addSubview:timeLabel];
            UIButton *downloadBut = [UIButton buttonWithType:UIButtonTypeCustom];
            downloadBut.frame = CGRectMake(self.view.frame.size.width-20-17, 13.5, 17, 17);
            downloadBut.backgroundColor = [UIColor redColor];
            [chooseButton addSubview:downloadBut];
        }

//        scrollView.hidden = NO;
//        scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, cell.frame.size.width, 134+25)];
//        scrollView.contentSize = CGSizeMake(cell.size.width, 2000);
//        scrollView.backgroundColor = [UIColor redColor];
//        [cell addSubview:scrollView];
    }else
    {
        cell.chooseView.hidden = YES;
        cell.headImage.hidden = NO;
        cell.nameLabel.hidden = NO;
        cell.supportLabel.hidden = NO;
        cell.supportImage.hidden = NO;
        cell.timeLabel.hidden = NO;
        cell.messageLabel.hidden = NO;
        cell.headImage.frame = CGRectMake(20, 10, 40, 40);
        cell.headImage.backgroundColor = [UIColor redColor];
        cell.headImage.layer.masksToBounds = YES;
        cell.headImage.layer.cornerRadius = 20;
        cell.nameLabel.frame = CGRectMake(cell.headImage.right+5, 12, 20, 30);
        cell.nameLabel.text = @"阿西吧雅蠛蝶";
        [cell.nameLabel sizeToFit];
        
        cell.timeLabel.frame = CGRectMake(cell.nameLabel.right+26, 12, 40, 14);
        cell.timeLabel.text= @"1分钟前";
        [cell.timeLabel sizeToFit];
        cell.supportLabel.frame = CGRectMake(self.view.frame.size.width-50,22, 30, 20);
        cell.supportLabel.text = @"2100";
        
        cell.messageLabel.frame = CGRectMake(cell.headImage.right+5, cell.nameLabel.bottom+8, 30, 15);
        cell.messageLabel.text = @"是不是不是不是不";
        [cell.messageLabel sizeToFit];
    }
    return cell;
    // 4.取出模型数据
    
    // 5.设置cell的数据
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 63)];
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 15, 10, 10)];
        titleLabel.text = @"芭蕾舞教学，授课老师：凡一一";
        titleLabel.textColor = HEXCOLOR(0x656869);
        [titleLabel setFont:[UIFont systemFontOfSize:14]];
        [titleLabel sizeToFit];
        UIView *bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, headerView.height-1, self.view.frame.size.width, 1)];
        bottomView.backgroundColor = HEXCOLOR(0xeaeaea);
        [headerView addSubview:bottomView];
        [headerView addSubview:titleLabel];
        return headerView;
    }else
    {
        UIView *headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 10)];
        headerView.backgroundColor = [UIColor whiteColor];
        UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(20, 6, 10, 10)];
        titleLabel.text = @"评论";
        
        [titleLabel sizeToFit];
        [headerView addSubview:titleLabel];
        return headerView;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section ==0) {
        return 63;
    }else
    {
        
    return 32;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return 134+25;
    }else
    {
        return 59;
    }
}
- (void)backToVie
{

    [self.player pause];

    [self.navigationController popViewControllerAnimated:YES];
    NSLog(@"back");
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [self.commentTable reloadData];
}
#pragma mark - 选集按钮
- (void)buttonClick:(UIButton *)btn
{
    NSLog(@"%ld",(long)btn.tag);
//    if (btn.tag==0) {
//        btn.backgroundColor = [UIColor greenColor];
//    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
