-----------------------------------------------------------------------------
-- GeoIP for JC2MP/Lua, based on ip-api.com
-- Only 45 requests per minute allowed
-- LuaSocket toolkit required
-- Author: Discord: Neon#0404, Telegram: https://t.me/neon0000
-----------------------------------------------------------------------------

-- Module, dependencies and variables --
local socket = require("socket.http")
local json = require("json")
GeoIP = {}
local _M = GeoIP
-- Module, dependencies and variables --


-- Query function --
_M.Query = function( ip, lang )
    if lang == nil then lang = "en" end -- If lang not defined, it will set it to default(english)
        local request, rc, rh = socket.request("http://ip-api.com/json/" .. ip .. "?lang=" .. lang)
        local decoded = json.decode(request)
        if decoded["status"] == "fail" then
            error("GeoIP returned an error: " .. decoded["message"] .. ":" .. decoded["query"]) -- I'm sure that's not the best way to handle exceptions :)
        else
            return decoded
        end
end
-- Query function --


-- Function for validating ip's --
_M.isIpValid = function( ip )
    local request = socket.request("http://ip-api.com/json/" .. ip)
    local decoded = json.decode(request)
    if decoded["status"] == "fail" then
        return false
    else
        return true
    end
end
-- Function for validating ip's --


return _M -- Just a module return ¯\_(ツ)_/¯

--[[

-- Little documentation -- 

-- All supported language codes

en - English (default)
de - Deutsch (German)
es - Español (Spanish)
pt-BR - Português - Brasil (Portuguese)
fr - Français (French)
ja - 日本語 (Japanese)
zh-CN - 中国 (Chinese)
ru - Русский (Russian)

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