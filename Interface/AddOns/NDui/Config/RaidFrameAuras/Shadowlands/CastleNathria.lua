local _, ns = ...
local B, C, L, DB = unpack(ns)
local module = B:GetModule("AurasTable")

local TIER = 9
local INSTANCE = 1190 -- 纳斯利亚堡
local BOSS

BOSS = 2393 -- 啸翼

BOSS = 2429 -- 猎手阿尔迪莫

BOSS = 2428 -- 饥饿的毁灭者
module:RegisterDebuff(TIER, INSTANCE, BOSS, 334228) -- 不稳定的喷发
module:RegisterDebuff(TIER, INSTANCE, BOSS, 329298) -- 暴食瘴气

BOSS = 2422 -- 太阳之王的救赎
module:RegisterDebuff(TIER, INSTANCE, BOSS, 333002) -- 劣民印记
module:RegisterDebuff(TIER, INSTANCE, BOSS, 326078) -- 灌注者的恩赐
module:RegisterDebuff(TIER, INSTANCE, BOSS, 325251) -- 骄傲之罪

BOSS = 2418 -- 技师赛·墨克斯

BOSS = 2420 -- 伊涅瓦·暗脉女勋爵
module:RegisterDebuff(TIER, INSTANCE, BOSS, 325936) -- 共享认知
module:RegisterDebuff(TIER, INSTANCE, BOSS, 335396) -- 隐秘欲望
module:RegisterDebuff(TIER, INSTANCE, BOSS, 324982) -- 共受苦难
module:RegisterDebuff(TIER, INSTANCE, BOSS, 324983) -- 共受苦难
module:RegisterDebuff(TIER, INSTANCE, BOSS, 332664) -- 浓缩心能
module:RegisterDebuff(TIER, INSTANCE, BOSS, 325382) -- 扭曲欲望

BOSS = 2426 -- 猩红议会

BOSS = 2394 -- 泥拳
module:RegisterDebuff(TIER, INSTANCE, BOSS, 335470) -- 锁链猛击
module:RegisterDebuff(TIER, INSTANCE, BOSS, 339181) -- 锁链猛击
module:RegisterDebuff(TIER, INSTANCE, BOSS, 331209) -- 怨恨凝视
module:RegisterDebuff(TIER, INSTANCE, BOSS, 335293) -- 锁链联结
module:RegisterDebuff(TIER, INSTANCE, BOSS, 335270) -- 捆住你们
module:RegisterDebuff(TIER, INSTANCE, BOSS, 335295) -- 粉碎锁链

BOSS = 2425 -- 石裔干将

BOSS = 2424 -- 德纳修斯大帝