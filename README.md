1. 安装 meteor

2. 下载代码，安装 npm 包
`cd btsbots-demo-2016; npm install`

3. 运行 meteor 服务端程序，默认端口为本机 3000 端口，运行成功之后通过浏览器访问本机 3000 端口可以看到页面，但是还没有数据。
`cd btsbots-demo-2016; meteor run`

在docker中需要先执行：
`apt-get install -y locales && locale-gen en_US.UTF-8`

4. 使用 scripts 目录下的 python 脚本生成数据, 需要 python3,

1) 安装依赖 bts 包
`pip3 install bts`

2) 修改配置文件 config.json

一个是 mongodb 数据库，上面 meteor 启动后默认在 3001 端口开了个 mongodb 服务器。

一个是 witness_node api 地址，用来获取区块链数据

3) 初始化 balance, order 数据，只需要初始化运行一次

运行 `python3 correct-balance.py config.json` ，注意作为 demo 代码中我只获取了很少量的数据。

4) 实时监控历史记录、orderbook, balance 等数据
`python3 monitor.py config.json`

5) 处理统计数据:
`python3 statistics.py config.json`