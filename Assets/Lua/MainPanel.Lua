--只要是一个新的对象（面板）我们那就新建一张表
MainPanel = {}

--不是必须写 因为lua的特性 不存在声明变量的概念
--这样写的目的 是当别人在看这个lua代码时 知道这个表（对象）有什么变量很重要
--关联的面板对象
MainPanel.panelObj = nil
--对应的面板控件
MainPanel.btnRole = nil
MainPanel.btnSkill = nil

--需要做 实例化面板对象
--为这个面板处理对应的逻辑 比如按钮点击等等

--初始化该面板 实例化对象 控件事件监听
function MainPanel:Init()
    if self.panelObj == nil then
        --1.实例化面板对象 ABMgr + 设置父对象
        self.panelObj = ABMgr:LoadRes("ui","3DPanel", typeof(GameObject))
        self.panelObj.transform:SetParent(Canvas, false)
        --2.找到对应控件
        --找到子对象 再找到身上挂载的 想要的脚本
        self.btnRole = self.panelObj.transform:Find("btnRole"):GetComponent(typeof(Button))

        print(self.btnRole)
        --3.为控件加上事件监听 进行点击等等的逻辑处理
        --如果直接.传入自己的函数 那么在函数内部 没有办法用self获取内容
        self.btnRole.onClick:AddListener(function()
            self:BtnRoleClick()
        end)
    end
end

function MainPanel:ShowMe()
    self:Init()
    self.panelObj:SetActive(true)
end

function MainPanel:HideMe()
    self.panelObj:SetActive(false)
end

function MainPanel:BtnRoleClick()
    -- print(123123)
    -- print(MainPanel.panelObj)
    BagPanel:ShowMe()
end
