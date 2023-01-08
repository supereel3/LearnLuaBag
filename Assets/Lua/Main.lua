--首先应该把Json表 从AB包中加载出来
print("准备就绪")
--初始化所有准备好的类名
require("InitClass")
--初始化道具表信息
require("ItemData")
--玩家信息
--1.从本地读取 本地存储有几种方式 PlayerPrefs 和 Json 或者 2进制
--2.网络游戏 从服务器获取
require("PlayerData")
PlayerData:Init()

require("MainPanel")
require("BagPanel")
require("ItemGrid")
MainPanel:Init()