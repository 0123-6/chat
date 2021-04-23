<!DOCTYPE html><html><head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<title>LayIM 移动版</title>

<link rel="stylesheet" href="//res.layui.com/layui/dist/css/layui.mobile.css">
<link id="layuicss-skinlayim-mobilecss" rel="stylesheet"
      href="//res.layui.com/layui/dist/css/modules/layim/mobile/layim.css?v=2.0" media="all">

</head>
<body>


<script src="//res.layui.com/layui/dist/layui.js?v=20210129"></script>
<script>
    layui.config({
        version: '20210129'
    }).use('mobile', function () {
        var mobile = layui.mobile
            , layim = mobile.layim
            , layer = mobile.layer;

        //提示层
        layer.msg = function (content) {
            return layer.open({
                content: content
                , skin: 'msg'
                , time: 2 //2秒后自动关闭
            });
        };

        //演示自动回复
        var autoReplay = [
            '您好，我现在有事不在，一会再和您联系。',
            '你没发错吧？face[微笑] ',
            '洗澡中，请勿打扰，偷窥请购票，个体四十，团体八折，订票电话：一般人我不告诉他！face[哈哈] ',
            '你好，我是主人的美女秘书，有什么事就跟我说吧，等他回来我会转告他的。face[心] face[心] face[心] ',
            'face[威武] face[威武] face[威武] face[威武] ',
            '<（@￣︶￣@）>',
            '你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。',
            'face[黑线]  你慢慢说，别急……',
            '(*^__^*) face[嘻嘻] ，是贤心吗？'
        ];

        layim.config({
            //上传图片接口
            uploadImage: {
                url: '/upload/image' //（返回的数据格式见下文）
                , type: '' //默认post
            }

            //上传文件接口
            , uploadFile: {
                url: '/upload/file' //（返回的数据格式见下文）
                , type: '' //默认post
            }

            , init: {
                //我的信息
                mine: {
                    "username": "纸飞机" //我的昵称
                    , "id": 123 //我的ID
                    , "avatar": "//cdn.layui.com/upload/2017_2/168_1487445347637_70429.jpg" //我的头像
                    , "sign": "懒得签名"
                }
                //我的好友列表
                , friend: [{
                    "groupname": "名人"
                    , "id": 0
                    , "list": [{
                        "username": "贤心"
                        , "id": "100001"
                        , "avatar": "//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
                        , "sign": "这些都是测试数据，实际使用请严格按照该格式返回"
                        , "status": "online"
                    }, {
                        "username": "刘涛tamia"
                        , "id": "100001222"
                        , "sign": "如约而至，不负姊妹欢乐颂"
                        , "avatar": "//tva4.sinaimg.cn/crop.0.1.1125.1125.180/475bb144jw8f9nwebnuhkj20v90vbwh9.jpg"
                    }, {
                        "username": "谢楠"
                        , "id": "10034001"
                        , "avatar": "//tva2.sinaimg.cn/crop.1.0.747.747.180/633f068fjw8f9h040n951j20ku0kr74t.jpg"
                        , "sign": ""
                    }, {
                        "username": "马小云"
                        , "id": "168168"
                        , "avatar": "//tva1.sinaimg.cn/crop.0.0.180.180.180/7fde8b93jw1e8qgp5bmzyj2050050aa8.jpg"
                        , "sign": "让天下没有难写的代码"
                    }, {
                        "username": "徐小峥"
                        , "id": "666666"
                        , "avatar": "//tva1.sinaimg.cn/crop.0.0.512.512.180/6a4acad5jw8eqi6yaholjj20e80e8t9f.jpg"
                        , "sign": "代码在囧途，也要写到底"
                    }]
                }, {
                    "groupname": "网红"
                    , "id": 1
                    , "list": [{
                        "username": "罗玉凤"
                        , "id": "121286"
                        , "avatar": "//tva4.sinaimg.cn/crop.0.0.640.640.180/4a02849cjw8fc8vn18vktj20hs0hs75v.jpg"
                        , "sign": "在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱"
                    }, {
                        "username": "Z_子晴"
                        , "id": "108101"
                        , "avatar": "//tva1.sinaimg.cn/crop.0.23.1242.1242.180/8693225ajw8fbimjimpjwj20yi0zs77l.jpg"
                        , "sign": "微电商达人"
                    }, {
                        "username": "大鱼_MsYuyu"
                        , "id": "12123454"
                        , "avatar": "//tva2.sinaimg.cn/crop.0.0.512.512.180/005LMAegjw8f2bp9qg4mrj30e80e8dg5.jpg"
                        , "sign": "我瘋了！這也太準了吧  超級笑點低"
                    }, {
                        "username": "Lemon_CC"
                        , "id": "102101"
                        , "avatar": "//tva4.sinaimg.cn/crop.0.0.180.180.180/6d424ea5jw1e8qgp5bmzyj2050050aa8.jpg"
                        , "sign": ""
                    }, {
                        "username": "柏小雪"
                        , "id": "3435343"
                        , "avatar": "//tva2.sinaimg.cn/crop.0.8.751.751.180/961a9be5jw8fczq7q98i7j20kv0lcwfn.jpg"
                        , "sign": ""
                    }]
                }, {
                    "groupname": "女神"
                    , "id": 2
                    , "list": [{
                        "username": "林心如"
                        , "id": "76543"
                        , "avatar": "//tva3.sinaimg.cn/crop.0.0.512.512.180/48f122e6jw8fcmi072lkyj20e80e8t9i.jpg"
                        , "sign": "我爱贤心"
                    }, {
                        "username": "佟丽娅"
                        , "id": "4803920"
                        , "avatar": "//tva3.sinaimg.cn/crop.0.0.750.750.180/5033b6dbjw8etqysyifpkj20ku0kuwfw.jpg"
                        , "sign": "我也爱贤心吖吖啊"
                    }]
                }]
                , "group": [{
                    "groupname": "前端群"
                    , "id": "101"
                    , "avatar": "http://tp2.sinaimg.cn/2211874245/180/40050524279/0"
                }, {
                    "groupname": "Fly社区官方群"
                    , "id": "102"
                    , "avatar": "http://tp2.sinaimg.cn/5488749285/50/5719808192/1"
                }]
            }

            //扩展更多列表
            , moreList: [{
                alias: 'find'
                , title: '发现'
                , iconUnicode: '&#xe628;' //图标字体的unicode，可不填
                , iconClass: '' //图标字体的class类名
            }, {
                alias: 'share'
                , title: '分享与邀请'
                , iconUnicode: '&#xe641;' //图标字体的unicode，可不填
                , iconClass: '' //图标字体的class类名
            }]

            //,isNewFriend: false //是否开启“新的朋友”
            , isgroup: true //是否开启“群聊”
            //,chatTitleColor: '#c00' //顶部Bar颜色
            //,title: 'LayIM' //应用名，默认：我的IM
        });

        //创建一个会话
        /*
        layim.chat({
          id: 111111
          ,name: '许闲心'
          ,type: 'kefu' //friend、group等字符，如果是group，则创建的是群聊
          ,avatar: '//tp1.sinaimg.cn/1571889140/180/40030060651/1'
        });
        */

        //监听点击“新的朋友”
        layim.on('newFriend', function () {
            layim.panel({
                title: '新的朋友' //标题
                , tpl: '<div style="padding: 10px;">自定义模版，{{d.data.test}}</div>' //模版
                , data: { //数据
                    test: '么么哒'
                }
            });
        });

        //查看聊天信息
        layim.on('detail', function (data) {
            //console.log(data); //获取当前会话对象
            layim.panel({
                title: data.name + ' 聊天信息' //标题
                ,
                tpl: '<div style="padding: 10px;">自定义模版，<a href="http://www.layui.com/doc/modules/layim_mobile.html#ondetail" target="_blank">参考文档</a></div>' //模版
                ,
                data: { //数据
                    test: '么么哒'
                }
            });
        });

        //监听点击更多列表
        layim.on('moreList', function (obj) {
            switch (obj.alias) {
                case 'find':
                    layer.msg('自定义发现动作');

                    //模拟标记“发现新动态”为已读
                    layim.showNew('More', false);
                    layim.showNew('find', false);
                    break;
                case 'share':
                    layim.panel({
                        title: '邀请好友' //标题
                        , tpl: '<div style="padding: 10px;">自定义模版，{{d.data.test}}</div>' //模版
                        , data: { //数据
                            test: '么么哒'
                        }
                    });
                    break;
            }
        });

        //监听发送消息
        layim.on('sendMessage', function (data) {
            var To = data.to;
            //console.log(data);

            //演示自动回复
            setTimeout(function () {
                var obj = {};
                if (To.type === 'group') {
                    obj = {
                        username: '模拟群员' + (Math.random() * 100 | 0)
                        , avatar: layui.cache.dir + 'images/face/' + (Math.random() * 72 | 0) + '.gif'
                        , id: To.id
                        , type: To.type
                        , content: autoReplay[Math.random() * 9 | 0]
                    }
                } else {
                    obj = {
                        username: To.name
                        , avatar: To.avatar
                        , id: To.id
                        , type: To.type
                        , content: autoReplay[Math.random() * 9 | 0]
                    }
                }
                layim.getMessage(obj);
            }, 1000);
        });

        //模拟收到一条好友消息
        setTimeout(function () {
            layim.getMessage({
                username: "贤心"
                , avatar: "//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg"
                , id: "100001"
                , type: "friend"
                , cid: Math.random() * 100000 | 0 //模拟消息id，会赋值在li的data-cid上，以便完成一些消息的操作（如撤回），可不填
                , content: "嗨，欢迎体验LayIM。演示标记：" + new Date().getTime()
            });
        }, 2000);

        //监听查看更多记录
        layim.on('chatlog', function (data, ul) {
            console.log(data);
            layim.panel({
                title: '与 ' + data.username + ' 的聊天记录' //标题
                , tpl: '<div style="padding: 10px;">这里是模版，{{d.data.test}}</div>' //模版
                , data: { //数据
                    test: 'Hello'
                }
            });
        });


        //模拟"更多"有新动态
        layim.showNew('More', true);
        layim.showNew('find', true);
    });
</script>


<div id="layui-m-layer0" class="layui-m-layer layui-m-layer1" index="0">
    <div class="layui-m-layermain">
        <div class="layui-m-layersection">
            <div class="layui-m-layerchild  layui-m-anim--1">
                <div class="layui-m-layercont">
                    <div class="layim-panel">
                        <div class="layim-title" style="background-color: #36373C;"><p>我的IM<span
                                class="layim-chat-status"></span></p></div>
                        <div class="layui-unselect layim-content">
                            <div class="layui-layim">
                                <div class="layim-tab-content">
                                    <ul class="layim-list-friend">
                                        <ul class="layui-layim-list layui-show layim-list-history">
                                            <li layim-event="chat" data-type="history" data-index="friend100001"
                                                class="layim-friend100001 ">
                                                <div><img
                                                        src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
                                                </div>
                                                <span>贤心</span>
                                                <p>你要和我说话？你真的要和我说话？你确定自己想说吗？你一定非说不可吗？那你说吧，这是自动回复。</p><span
                                                    class="layim-msg-status">1</span></li>
                                        </ul>
                                    </ul>
                                </div>
                                <div class="layim-tab-content layui-show">
                                    <ul class="layim-list-top">
                                        <li layim-event="newFriend"><i class="layui-icon"></i>新的朋友<i class="layim-new"
                                                                                                      id="LAY_layimNewFriend"></i>
                                        </li>
                                        <li layim-event="group"><i class="layui-icon"></i>群聊<i class="layim-new"
                                                                                                id="LAY_layimNewGroup"></i>
                                        </li>
                                    </ul>
                                    <ul class="layim-list-friend">
                                        <li><h5 layim-event="spread" lay-type="true"><i
                                                class="layui-icon"></i><span>名人</span><em>(<cite class="layim-count">
                                            5</cite>)</em></h5>
                                            <ul class="layui-layim-list layui-show">
                                                <li layim-event="chat" data-type="friend" data-index="0"
                                                    class="layim-friend100001 ">
                                                    <div><img
                                                            src="//tva1.sinaimg.cn/crop.0.0.118.118.180/5db11ff4gw1e77d3nqrv8j203b03cweg.jpg">
                                                    </div>
                                                    <span>贤心</span>
                                                    <p>这些都是测试数据，实际使用请严格按照该格式返回</p><span
                                                        class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="0"
                                                    class="layim-friend100001222 ">
                                                    <div><img
                                                            src="//tva4.sinaimg.cn/crop.0.1.1125.1125.180/475bb144jw8f9nwebnuhkj20v90vbwh9.jpg">
                                                    </div>
                                                    <span>刘涛tamia</span>
                                                    <p>如约而至，不负姊妹欢乐颂</p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="0"
                                                    class="layim-friend10034001 ">
                                                    <div><img
                                                            src="//tva2.sinaimg.cn/crop.1.0.747.747.180/633f068fjw8f9h040n951j20ku0kr74t.jpg">
                                                    </div>
                                                    <span>谢楠</span>
                                                    <p></p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="0"
                                                    class="layim-friend168168 ">
                                                    <div><img
                                                            src="//tva1.sinaimg.cn/crop.0.0.180.180.180/7fde8b93jw1e8qgp5bmzyj2050050aa8.jpg">
                                                    </div>
                                                    <span>马小云</span>
                                                    <p>让天下没有难写的代码</p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="0"
                                                    class="layim-friend666666 ">
                                                    <div><img
                                                            src="//tva1.sinaimg.cn/crop.0.0.512.512.180/6a4acad5jw8eqi6yaholjj20e80e8t9f.jpg">
                                                    </div>
                                                    <span>徐小峥</span>
                                                    <p>代码在囧途，也要写到底</p><span class="layim-msg-status">new</span></li>
                                            </ul>
                                        </li>
                                        <li><h5 layim-event="spread" lay-type="false"><i class="layui-icon"></i><span>网红</span><em>(<cite
                                                class="layim-count"> 5</cite>)</em></h5>
                                            <ul class="layui-layim-list">
                                                <li layim-event="chat" data-type="friend" data-index="1"
                                                    class="layim-friend121286 ">
                                                    <div><img
                                                            src="//tva4.sinaimg.cn/crop.0.0.640.640.180/4a02849cjw8fc8vn18vktj20hs0hs75v.jpg">
                                                    </div>
                                                    <span>罗玉凤</span>
                                                    <p>在自己实力不济的时候，不要去相信什么媒体和记者。他们不是善良的人，有时候候他们的采访对当事人而言就是陷阱</p><span
                                                        class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="1"
                                                    class="layim-friend108101 ">
                                                    <div><img
                                                            src="//tva1.sinaimg.cn/crop.0.23.1242.1242.180/8693225ajw8fbimjimpjwj20yi0zs77l.jpg">
                                                    </div>
                                                    <span>Z_子晴</span>
                                                    <p>微电商达人</p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="1"
                                                    class="layim-friend12123454 ">
                                                    <div><img
                                                            src="//tva2.sinaimg.cn/crop.0.0.512.512.180/005LMAegjw8f2bp9qg4mrj30e80e8dg5.jpg">
                                                    </div>
                                                    <span>大鱼_MsYuyu</span>
                                                    <p>我瘋了！這也太準了吧 超級笑點低</p><span class="layim-msg-status">new</span>
                                                </li>
                                                <li layim-event="chat" data-type="friend" data-index="1"
                                                    class="layim-friend102101 ">
                                                    <div><img
                                                            src="//tva4.sinaimg.cn/crop.0.0.180.180.180/6d424ea5jw1e8qgp5bmzyj2050050aa8.jpg">
                                                    </div>
                                                    <span>Lemon_CC</span>
                                                    <p></p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="1"
                                                    class="layim-friend3435343 ">
                                                    <div><img
                                                            src="//tva2.sinaimg.cn/crop.0.8.751.751.180/961a9be5jw8fczq7q98i7j20kv0lcwfn.jpg">
                                                    </div>
                                                    <span>柏小雪</span>
                                                    <p></p><span class="layim-msg-status">new</span></li>
                                            </ul>
                                        </li>
                                        <li><h5 layim-event="spread" lay-type="false"><i class="layui-icon"></i><span>女神</span><em>(<cite
                                                class="layim-count"> 2</cite>)</em></h5>
                                            <ul class="layui-layim-list">
                                                <li layim-event="chat" data-type="friend" data-index="2"
                                                    class="layim-friend76543 ">
                                                    <div><img
                                                            src="//tva3.sinaimg.cn/crop.0.0.512.512.180/48f122e6jw8fcmi072lkyj20e80e8t9i.jpg">
                                                    </div>
                                                    <span>林心如</span>
                                                    <p>我爱贤心</p><span class="layim-msg-status">new</span></li>
                                                <li layim-event="chat" data-type="friend" data-index="2"
                                                    class="layim-friend4803920 ">
                                                    <div><img
                                                            src="//tva3.sinaimg.cn/crop.0.0.750.750.180/5033b6dbjw8etqysyifpkj20ku0kuwfw.jpg">
                                                    </div>
                                                    <span>佟丽娅</span>
                                                    <p>我也爱贤心吖吖啊</p><span class="layim-msg-status">new</span></li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                                <div class="layim-tab-content">
                                    <ul class="layim-list-top">
                                        <li layim-event="moreList" lay-filter="find"><i class="layui-icon "></i>发现<i
                                                class="layim-new" id="LAY_layimNewfind"></i></li>
                                        <li layim-event="moreList" lay-filter="share"><i
                                                class="layui-icon "></i>分享与邀请<i class="layim-new"
                                                                                 id="LAY_layimNewshare"></i></li>
                                        <li layim-event="about"><i class="layui-icon"></i>关于<i class="layim-new"
                                                                                                id="LAY_layimNewAbout"></i>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <ul class="layui-unselect layui-layim-tab">
                                <li title="消息" layim-event="tab" lay-type="message" class=""><i class="layui-icon"></i><span>消息</span><i
                                        class="layim-new" id="LAY_layimNewMsg"></i></li>
                                <li title="联系人" layim-event="tab" lay-type="friend" class="layim-this"><i
                                        class="layui-icon"></i><span>联系人</span><i class="layim-new"
                                                                                   id="LAY_layimNewList"></i></li>
                                <li title="更多" layim-event="tab" lay-type="more" class=""><i
                                        class="layui-icon"></i><span>更多</span><i class="layim-new"
                                                                                  id="LAY_layimNewMore"></i></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="xl-chrome-ext-bar" id="xl_chrome_ext_{4DB361DE-01F7-4376-B494-639E489D19ED}" style="display: none;">
    <div class="xl-chrome-ext-bar__logo"></div>

    <a id="xl_chrome_ext_download" href="javascript:;" class="xl-chrome-ext-bar__option">下载视频</a>
    <a id="xl_chrome_ext_close" href="javascript:;" class="xl-chrome-ext-bar__close"></a>
</div>
</body>
</html>