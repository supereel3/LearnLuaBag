PlayerData = {}
--我们目前只做背包功能 所以只需要它的道具信息即可

PlayerData.equips = {}
PlayerData.items = {}
PlayerData.gems = {}

--为玩家数据写了一个 初始化方法 以后直接改这里的数据来源即可
function PlayerData:Init()
    --道具信息 不管存本地 还是存服务器 都不会把道具所有信息写上
    --道具ID和道具数量
    table.insert(self.equips, {id = 1, num = 1})
    table.insert(self.equips,{id = 2, num = 1})

    table.insert(self.items, {id = 3, num = 50})
    table.insert(self.items, {id = 4, number = 20})

    table.insert(self.gems, {id = 5, num = 50})
    table.insert(self.gems, {id = 6, num = 30})
end