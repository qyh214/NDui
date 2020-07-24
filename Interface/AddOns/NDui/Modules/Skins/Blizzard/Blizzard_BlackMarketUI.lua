local _, ns = ...
local B, C, L, DB = unpack(ns)

C.themes["Blizzard_BlackMarketUI"] = function()
	local r, g, b = DB.r, DB.g, DB.b

	B.StripTextures(BlackMarketFrame)
	BlackMarketFrame.MoneyFrameBorder:SetAlpha(0)
	B.StripTextures(BlackMarketFrame.HotDeal)
	B.CreateBDFrame(BlackMarketFrame.HotDeal.Item)
	BlackMarketFrame.HotDeal.Item.IconTexture:SetTexCoord(unpack(DB.TexCoord))

	local headers = {"ColumnName", "ColumnLevel", "ColumnType", "ColumnDuration", "ColumnHighBidder", "ColumnCurrentBid"}
	for _, header in pairs(headers) do
		local header = BlackMarketFrame[header]
		B.StripTextures(header)
		local bg = B.CreateBDFrame(header, .25)
		bg:SetPoint("TOPLEFT", 2, 0)
		bg:SetPoint("BOTTOMRIGHT", -1, 0)
	end

	B.SetBD(BlackMarketFrame)
	B.CreateBDFrame(BlackMarketFrame.HotDeal, .25)
	B.Reskin(BlackMarketFrame.BidButton)
	B.ReskinClose(BlackMarketFrame.CloseButton)
	B.ReskinInput(BlackMarketBidPriceGold)
	B.ReskinScroll(BlackMarketScrollFrameScrollBar)

	hooksecurefunc("BlackMarketScrollFrame_Update", function()
		local buttons = BlackMarketScrollFrame.buttons
		for i = 1, #buttons do
			local bu = buttons[i]

			bu.Item.IconTexture:SetTexCoord(unpack(DB.TexCoord))
			if not bu.reskinned then
				B.StripTextures(bu)

				bu.Item:SetNormalTexture("")
				bu.Item:SetPushedTexture("")
				bu.Item:GetHighlightTexture():SetColorTexture(1, 1, 1, .25)
				B.CreateBDFrame(bu.Item)
				bu.Item.IconBorder:SetAlpha(0)

				local bg = B.CreateBDFrame(bu, .25)
				bg:SetPoint("TOPLEFT", bu.Item, "TOPRIGHT", 3, C.mult)
				bg:SetPoint("BOTTOMRIGHT", 0, 4)

				bu:SetHighlightTexture(DB.bdTex)
				local hl = bu:GetHighlightTexture()
				hl:SetVertexColor(r, g, b, .2)
				hl.SetAlpha = B.Dummy
				hl:ClearAllPoints()
				hl:SetAllPoints(bg)

				bu.Selection:ClearAllPoints()
				bu.Selection:SetAllPoints(bg)
				bu.Selection:SetTexture(DB.bdTex)
				bu.Selection:SetVertexColor(r, g, b, .1)

				bu.reskinned = true
			end

			if bu:IsShown() and bu.itemLink then
				local _, _, quality = GetItemInfo(bu.itemLink)
				bu.Name:SetTextColor(GetItemQualityColor(quality))
			end
		end
	end)

	hooksecurefunc("BlackMarketFrame_UpdateHotItem", function(self)
		local hotDeal = self.HotDeal
		if hotDeal:IsShown() and hotDeal.itemLink then
			local _, _, quality = GetItemInfo(hotDeal.itemLink)
			hotDeal.Name:SetTextColor(GetItemQualityColor(quality))
		end
		hotDeal.Item.IconBorder:Hide()
	end)
end