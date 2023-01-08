--一个面板对应一个表
BagPanel = {}
--"成员变量"
--面板对象
BagPanel.panelObj = nil
--各个控件
BagPanel.btnClose = nil
BagPanel.togEquip = nil
BagPanel.togItem = nil
BagPanel.togGem = nil
BagPanel.svBag = nil
BagPanel.Content = nil

--"成员方法"
--初始化方法
function BagPanel:Init()
    if(self.panelObj == nil) then
        --实例化面板对象
        self.panelObj = ABMgr:LoadRes("ui", "BagPanel", typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)
        --找控件
        --关闭按钮
        self.btnClose = self.panelObj.transform:Find("btn_back"):GetComponent(typeof(Button))
        --print("读取到了关闭按钮：" + self.btnClose.name)
        --找toggle
        local group = self.panelObj.transform:Find("options")
        local test = group:Find("tog_weapon")
        print(test)
        -- self.togEquip = group:Find("tog_weapon"):GetComponent(typepf(Toggle))
        -- self.togItem = group:Find("tog_all"):GetComponent(typeof(Toggle))
        -- self.togGem = group:Find("tog_book"):GetComponent(typeof(Toggle))
        --sv相关
        -- self.svBag = self.panelObj.transform:Find("btnClose"):GetComponent(typeof(Button))

        --加事件
        --关闭按钮
        self.btnClose.onClick:AddListener(function()
            self:HideMe()
        end
        )
    end
    
end
--显示隐藏
function BagPanel:ShowMe()
    self:Init()
    self.panelObj:SetActive(true)
end
function BagPanel:HideMe()
    self.panelObj:SetActive(false)
end

--逻辑处理函数 用来切页签的
--type 1装备 2道具 3宝石
function BagPanel:ChangeType(type)
    --判断如果已经是该页签 就不更新
    if self.nowType == type then
        return
    end

    --切页 根据玩家信息 来进行格子创建

    --更新之前 把老的格子删掉 BagPanel.items
    for i = 1, #self.items do
        --销毁格子对象
        self.items[i]:Destroy()
    end
    self.items = {}
    --再根据当前选择的类型 来创建新的格子 BagPanel.items
    --要根据 传入的type 来选择显示的数据
    local nowItems = nil
    if type == 1 then
        nowItems = PlayerData.equips
    elseif type == 2 then
        nowItems = PlayerData.items
    else
        nowItems = PlayerData.gems
    end

    --创建格子
    for i = 1, #nowItem do 
        --根据数据 创建一个格子对象
        local grid = ItemGrid:new()
        --要实例化对象 设置位置
        grid:Init(self.Content, (i - 1) % 4 * 175, math.floor((i - 1)/4)*175)
        --初始化它的信息 数量和图标
        grid:InitData(nowItems[i])
        --把它存起来
        table.insert(self.items, grid)
    end
end