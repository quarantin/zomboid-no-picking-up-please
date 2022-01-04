local NoPickingUpPlease = {}

NoPickingUpPlease.whitelist = {}
NoPickingUpPlease.whitelist.barbecue  = true
NoPickingUpPlease.whitelist.fireplace = true
NoPickingUpPlease.whitelist.freezer   = true
NoPickingUpPlease.whitelist.fridge    = true
NoPickingUpPlease.whitelist.microwave = true
NoPickingUpPlease.whitelist.stove     = true
NoPickingUpPlease.whitelist.woodstove = true

local ISMoveableCursor_isValid = ISMoveableCursor.isValid
ISMoveableCursor.isValid = function(self, square)

	local objects = square:getObjects()
	for i = 0, objects:size() - 1 do

		local object = objects:get(i);
		local sprite = object:getSprite()
		local props = sprite:getProperties()

		if props:Is(IsoFlagType.container) then
			local containerType = object:getContainer():getType()
			if not NoPickingUpPlease.whitelist[containerType] then
				return false
			end
		end
	end

	return ISMoveableCursor_isValid(self, square)
end
