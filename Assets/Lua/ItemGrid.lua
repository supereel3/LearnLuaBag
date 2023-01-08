ItemGrid = {}

ItemGrid.obj = nil
ItemGrid.imgIcon = nil
ItemGrid.Text = nil
--成员函数
--实例化格子对象
function ItemGrid:Init(father, posX, posY)
    --实例化格子对象
    self.obj = ABMgr:LoadRes("ui","ItemGrid")
    --设置父对象
    self.obj.transform:SetParent(father,false)
    --继续设置它的位置
    self.obj.transform.localPosition = Vector3(posX,posY, 0)
    --找控件
    self.imgIcon = self.obj.transform:Find("imgIcon"):GetComponent(typeof(Image))
    self.Text = self.obj.transform:Find("Text"):GetComponent(typeof(Text))
end

--初始化格子信息
--data是外面传入的 道具信息 里面包含了 id和num
function ItemGrid:InitData(data)
    --通过 道具ID 去读取 道具配置表 得到图标信息
    local data = ItemData[data.id]
    --根据名字 先加载图集 道具配置表 得到图标信息
    local strs = string.split(data.icom, "_")
    --加载图集
    local spriteAtlas = ABMgr:LoadRes("ui",strs[1],typeof(SpriteAtlas))
    --加载图标
    self.imgIcon.sprite = spriteAtlas:GetSprite(strs[2])
    --设置它的数量
    self.Text.text = data.num
end

--加自己的逻辑
function ItemGrid:Destroy()
    GameObject.Destroy(self.obj)
    self.obj = nil
end