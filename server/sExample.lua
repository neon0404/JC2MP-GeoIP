class 'GeoIPExample'

function GeoIPExample:__init()
    self.GeoIP = require("GeoIP")

    Events:Subscribe( "PlayerJoin", self, self.PlayerJoin )
    Events:Subscribe( "PlayerChat", self, self.PlayerChat )
end

function GeoIPExample:PlayerJoin( args )
    local plr = args.player
    if self.GeoIP.isIpValid(plr:GetIP()) then
        local data = self.GeoIP.Query(plr:GetIP())
        Chat:Send(plr, "Hello " .. plr:GetName() .. "!\nAre you from " .. data["city"] .. "?", Color.White)
    end
end

function GeoIPExample:PlayerChat( args )
    local msg = args.text
    local ip = ""

    if ( msg:sub(1, 1) ~= "/" ) then
		return true
	end

	local cmdargs = {}
	for word in string.gmatch(msg, "[^%s]+") do
		table.insert(cmdargs, word)
	end

    if cmdargs[2] then 
        ip = cmdargs[2]
    else
        ip = args.player:GetIP()
    end

	if cmdargs[1] == "/ip" and self.GeoIP.isIpValid(ip) then
        local data = self.GeoIP.Query(ip)
		Chat:Send( args.player, "==============", Color.White )
		Chat:Send( args.player, "Query: ", Color.White, data["query"], Color.DarkGray )
        Chat:Send( args.player, "Status: ", Color.White, data["status"], Color.DarkGray )
        Chat:Send( args.player, "Country: ", Color.White, data["country"], Color.DarkGray )
        Chat:Send( args.player, "Country code: ", Color.White, data["countryCode"], Color.DarkGray )
        Chat:Send( args.player, "Region: ", Color.White, data["region"], Color.DarkGray )
        Chat:Send( args.player, "Region name: ", Color.White, data["regionName"], Color.DarkGray )
        Chat:Send( args.player, "City: ", Color.White, data["city"], Color.DarkGray )
        Chat:Send( args.player, "ZIP: ", Color.White, data["zip"], Color.DarkGray )
        Chat:Send( args.player, "LAT: ", Color.White, tostring(data["lat"]), Color.DarkGray )
        Chat:Send( args.player, "LON: ", Color.White, tostring(data["lon"]), Color.DarkGray )
        Chat:Send( args.player, "TZ: ", Color.White, data["timezone"], Color.DarkGray )
        Chat:Send( args.player, "ISP: ", Color.White, data["isp"], Color.DarkGray )
        Chat:Send( args.player, "Org: ", Color.White, data["org"], Color.DarkGray )
        Chat:Send( args.player, "AS: ", Color.White, data["as"], Color.DarkGray )
		Chat:Send( args.player, "==============", Color.White )
        return false
    elseif cmdargs[1] == "/ip" then
        Chat:Send( args.player, ip .. " is not valid IP", Color.Red )
        return false

    end
	return false
end

GeoIPExample() 