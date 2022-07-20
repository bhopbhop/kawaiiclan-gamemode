-- F1/!options/!menu 
-- by Justa

-- Theme
--local theme = Theme:GetPreference("UI") 
--local primary = theme["Colours"]["Primary Colour"]
--local outlines = theme["Toggles"]["Outline Colour"]

-- Update colours
--Theme:AddUpdate("UI",)

-- Function to toggle menu
function UI:ToggleMainmenu()
	-- Already exists
	if (self.mainmenu) then
		self.mainmenu:Remove() 
		self.mainmenu = nil

		return
	end

	-- Size and positioning 
	local width = ScrW() * 0.60
	local height = ScrH() * 0.75

	-- Create
	self.mainmenu = vgui.Create("DPanel")
	self.mainmenu:SetSize(width, height)
	self.mainmenu:Center()

	-- Painting of base
	function self.mainmenu:Paint(width, height)

	end
end

-- Debug concommand
concommand.Add("kawaii_mainmenu", function()
	UI:ToggleMainmenu()
end)