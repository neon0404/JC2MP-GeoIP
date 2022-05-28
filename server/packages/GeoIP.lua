-----------------------------------------------------------------------------
-- GeoIP for JC2MP/Lua
-- Only 45 requests per minute allowed
-- LuaSocket toolkit required
-- Author: Discord: Neon#0404, Telegram: https://t.me/neon0000
-----------------------------------------------------------------------------

-- Module and dependencies --
local socket = require("socket.http")
local json = require("json")
GeoIP = {}
local _M = GeoIP
-- Module and dependencies --

-- Query function --
_M.Query = function( ip, lang )
    if lang == nil then lang = "en" end -- If lang not defined, it will set it to default(english)
    local request = socket.request("http://ip-api.com/json/" .. ip .. "?lang=" .. lang)
    local decoded = json.decode(request)
    if decoded["status"] == "fail" then
        error("GeoIP returned an error: " .. decoded["message"] .. ":" .. decoded["query"]) -- I'm sure that's not the best way to handle exceptions :)
        return "N/A"
    else
        return decoded
    end
end
-- Query function --

return _M -- Just a module return ¯\_(ツ)_/¯

--[[

-- Little documentation -- 

-- All supported language codes

en - English (default)
de - Deutsch (German)
es - Español (Spanish)
fr - Français (French)

-- Note: ip-api.com provides support for another languages, but json.lua can't handle them :(

-- All supported language codes --


-- Returned data example --

    "query": "123.123.123.123",
    "status": "success",
    "continent": "Asia",
    "continentCode": "AS",
    "country": "China",
    "countryCode": "CN",
    "region": "BJ",
    "regionName": "Beijing",
    "city": "Beijing",
    "district": "",
    "zip": "",
    "lat": 39.9075,
    "lon": 116.3972,
    "timezone": "Asia/Shanghai",
    "offset": 28800,
    "currency": "CNY",
    "isp": "China Unicom Beijing Province Network",
    "org": "",
    "as": "AS4808 China Unicom Beijing Province Network",
    "asname": "CHINA169-BJ",
    "mobile": false,
    "proxy": true,
    "hosting": false

-- Returned data example --

-]]