# YA-Btsbots

YA-Btsbots(Yet another btsbots) 是从btsbots.com继承出来的一个开源项目，项目遵循MIT协议开源.

1. 安装 meteor

    `curl https://install.meteor.com/ | sh`

2. 下载代码，安装 npm 包

    `git clone https://github.com/ety001/btsbots-demo-2016.git`

    `cd btsbots-demo-2016; npm install`

3. 运行 meteor 服务端程序，默认端口为本机 3000 端口，运行成功之后通过浏览器访问本机 3000 端口可以看到页面，但是还没有数据。

    `cd btsbots-demo-2016; meteor run`

    在docker中需要先执行：

    `apt-get install -y locales && locale-gen en_US.UTF-8`

4. 使用 scripts 目录下的 python 脚本生成数据, 需要 python3,

    * 安装依赖包

        `pip3 install bts`

        `pip3 install pymongo`

        `pip3 install pycrypto`

        `sudo apt-get install libffi-dev libssl-dev python-dev`

        `pip3 install graphenelib`

    * 修改配置文件 config.json

        一个是 mongodb 数据库，上面 meteor 启动后默认在 3001 端口开了个 mongodb 服务器。

        一个是 witness_node api 地址，用来获取区块链数据

    * 初始化 balance, order 数据，只需要初始化运行一次

        运行 `python3 correct-balance.py config.json` ，注意作为 demo 代码中我只获取了很少量的数据。

    * 实时监控历史记录、orderbook, balance 等数据

        `python3 monitor.py config.json`

    * 处理统计数据:

        `python3 statistics.py config.json`
