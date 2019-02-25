local _, ns = ...
local B, C, L, DB = unpack(ns)
local module = B:GetModule("AurasTable")

-- 角标的相关法术 [spellID] = {anchor, {r, g, b}}
C.CornerBuffs = {
	["PRIEST"] = {
		[194384] = {"TOPRIGHT", {1, 1, .66}},			-- 救赎
		[214206] = {"TOPRIGHT", {1, 1, .66}},			-- 救赎(PvP)
		[41635]  = {"BOTTOMRIGHT", {.2, .7, .2}},		-- 愈合导言
		[193065] = {"BOTTOMRIGHT", {.54, .21, .78}},	-- 忍辱负重
		[139]    = {"TOPLEFT", {.4, .7, .2}},			-- 恢复
		[17]     = {"TOPLEFT", {.7, .7, .7}},			-- 真言术盾
		[47788]  = {"LEFT", {.86, .45, 0}, true},		-- 守护之魂
		[33206]  = {"LEFT", {.47, .35, .74}, true},		-- 痛苦压制
	},
	["DRUID"] = {
		[774]    = {"TOPRIGHT", {.8, .4, .8}},			-- 回春
		[155777] = {"RIGHT", {.8, .4, .8}},				-- 萌芽
		[8936]   = {"BOTTOMLEFT", {.2, .8, .2}},		-- 愈合
		[33763]  = {"TOPLEFT", {.4, .8, .2}},			-- 生命绽放
		[48438]  = {"BOTTOMRIGHT", {.8, .4, 0}},		-- 野性成长
		[207386] = {"TOP", {.4, .2, .8}},				-- 春暖花开
		[102351] = {"LEFT", {.2, .8, .8}},				-- 结界
		[102352] = {"LEFT", {.2, .8, .8}},				-- 结界(HoT)
		[200389] = {"BOTTOM", {1, 1, .4}},				-- 栽培
	},
	["PALADIN"] = {
		[53563]  = {"TOPRIGHT", {.7, .3, .7}},			-- 道标
		[156910] = {"TOPRIGHT", {.7, .3, .7}},			-- 信仰道标
		[200025] = {"TOPRIGHT", {.7, .3, .7}},			-- 美德道标
		[1022]   = {"BOTTOMRIGHT", {.2, .2, 1}, true},	-- 保护
		[1044]   = {"BOTTOMRIGHT", {.89, .45, 0}, true},-- 自由
		[6940]   = {"BOTTOMRIGHT", {.89, .1, .1}, true},-- 牺牲
		[223306] = {"BOTTOMLEFT", {.7, .7, .3}},		-- 赋予信仰
	},
	["SHAMAN"] = {
		[61295]  = {"TOPRIGHT", {.2, .8, .8}},			-- 激流
		[974]    = {"BOTTOMRIGHT", {1, .8, 0}},			-- 大地之盾
		[207400] = {"BOTTOMLEFT", {.6, .8, 1}},			-- 先祖活力
	},
	["MONK"] = {
		[119611] = {"TOPLEFT", {.3, .8, .6}},			-- 复苏之雾
		[116849] = {"TOPRIGHT", {.2, .8, .2}, true},	-- 作茧缚命
		[124682] = {"BOTTOMLEFT", {.8, .8, .25}},		-- 氤氲之雾
		[191840] = {"BOTTOMRIGHT", {.27, .62, .7}},		-- 精华之泉
	},
	["ROGUE"] = {
		[57934]  = {"BOTTOMRIGHT", {.9, .1, .1}},		-- 嫁祸
	},
	["WARRIOR"] = {
		[114030] = {"TOPLEFT", {.2, .2, 1}},			-- 警戒
	},
	["HUNTER"] = {
		[34477]  = {"BOTTOMRIGHT", {.9, .1, .1}},		-- 误导
		[90361]  = {"TOPLEFT", {.4, .8, .2}},			-- 灵魂治愈
	},
	["WARLOCK"] = {
		[20707]  = {"BOTTOMRIGHT", {.8, .4, .8}},		-- 灵魂石
	},
	["DEMONHUNTER"] = {},
	["MAGE"] = {},
	["DEATHKNIGHT"] = {},
}

-- 小队框体的技能监控
C.PartySpells = {
	[57994]  = 12, -- 风剪
	[1766]   = 15, -- 脚踢
	[6552]   = 15, -- 拳击
	[47528]  = 15, -- 心灵冰冻
	[96231]  = 15, -- 责难
	[106839] = 15, -- 迎头痛击
	[116705] = 15, -- 切喉手
	[183752] = 15, -- 瓦解
	[187707] = 15, -- 压制
	[2139]   = 24, -- 法术反制
	[147362] = 24, -- 反制射击
	[15487]  = 45, -- 沉默
	[78675]  = 60, -- 日光术

	[132469] = 30, -- 台风
	[102793] = 30, -- 乌索尔旋风
	[102342] = 60, -- 铁木树皮
	[20546]  = 120, -- 奥术洪流
	[28730]  = 120,
	[50613]  = 120,
	[69179]  = 120,
	[80483]  = 120,
	[129597] = 120,
	[155145] = 120,
	[202719] = 120,
	[232633] = 120,
}

-- 团队框体职业相关Buffs
local list = {
	["ALL"] = {			-- 全职业
		[642] = true,		-- 圣盾术
		[1022] = true,		-- 保护祝福
		[204018] = true,	-- 破咒祝福
		[204150] = true,	-- 圣光护盾
		[86659] = true,		-- 远古列王守卫
		[48792] = true,		-- 冰封之韧
		[871] = true,		-- 盾墙
		[118038] = true,	-- 剑在人在
		[47788] = true,		-- 守护之魂
		[33206] = true,		-- 痛苦压制
		[47585] = true,		-- 消散
		[45438] = true,		-- 冰箱
		[102342] = true,	-- 铁木树皮
		[186265] = true,	-- 灵龟守护
		[196555] = true,	-- 虚空行走
		[31224] = true,		-- 暗影斗篷
		[116849] = true,	-- 作茧缚命
		[115203] = true,	-- 壮胆酒
		[104773] = true,	-- 不灭决心
		[108271] = true,	-- 星界转移
	},
	["WARNING"] = {
		[87023] = true,		-- 灸灼
		[95809] = true,		-- 疯狂
		[123981] = true,	-- 永劫不复
		[209261] = true,	-- 未被污染的邪能
	},
	["DRUID"] = {		-- 德鲁伊
		[774] = true,		-- 回春
		[8936] = true,		-- 愈合
		[33763] = true,		-- 生命绽放
		[48438] = true,		-- 野性成长
		[155777] = true,	-- 萌芽
		[102352] = true,	-- 塞纳里奥结界
		[200389] = true,	-- 栽培
		[157982] = true,	-- 宁静
	},
	["HUNTER"] = {		-- 猎人
		[34477] = true,		-- 误导
	},
	["ROGUE"] = {		-- 盗贼
		[57934] = true,		-- 嫁祸
	},
	["WARRIOR"] = {		-- 战士
		[114030] = true,	-- 警戒
	},
	["SHAMAN"] = {		-- 萨满
		[974] = true,		-- 大地之盾
		[61295] = true,		-- 激流
	},
	["PALADIN"] = {		-- 圣骑士
		[1044] = true,		-- 自由祝福
		[6940] = true,		-- 牺牲祝福
		[25771] = true,		-- 自律
		[53563] = true,		-- 圣光道标
		[156910] = true,	-- 信仰道标
		[223306] = true,	-- 赋予信仰
		[200025] = true,	-- 美德道标
		[200654] = true,	-- 提尔的拯救
		[243174] = true,	-- 神圣黎明
	},
	["PRIEST"] = {		-- 牧师
		[17] = true,		-- 真言术盾
		[139] = true,		-- 恢复
		[41635] = true,		-- 愈合祷言
		[47788] = true,		-- 守护之魂
		[194384] = true,	-- 救赎
		[214206] = true,	-- 救赎
		[152118] = true,	-- 意志洞悉
		[208065] = true,	-- 图雷之光
	},
	["MONK"] = {		-- 武僧
		[119611] = true,	-- 复苏之雾
		[116849] = true,	-- 作茧缚命
		[124682] = true,	-- 氤氲之雾
		[124081] = true,	-- 禅意波
		[191840] = true,	-- 精华之泉
		[115175] = true,	-- 抚慰之雾
	},
	["DEMONHUNTER"] = {	-- DH
	},
	["MAGE"] = {		-- 法师
	},
	["WARLOCK"] = {		-- 术士
	},
	["DEATHKNIGHT"] = {	-- DK
	},
}

module:AddClassSpells(list)