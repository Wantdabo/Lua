EventManager = EventManager or BaseClass()

function EventManager:Ctor()
	self.event_list = {}
end

function EventManager:Dtor()
	self.event_list = nil
end

function EventManager:Add(event_name, callback)
	if self.event_list[event_name] == nil then
		self.event_list[event_name] = {}
	end

	local event = {}
	event.event_name = event_name
	event.event_id = #self.event_list[event_name] + 1
	event.callback = callback
	self.event_list[event_name][event.event_id] = event

	return event
end

function EventManager:Remove(event)
	if self.event_list[event.event_name] then
		self.event_list[event.event_name][event.event_id] = nil
	end
end

function EventManager:Fire(event_name, params)
	if self.event_list[event_name] ~= nil then
		for _, v in pairs(self.event_list[event_name]) do
			if v then
				v.callback(params)
			end
		end
	end
end