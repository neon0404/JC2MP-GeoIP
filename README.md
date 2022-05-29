# JC2MP-GeoIP


Module for JC2MP that provides Geolocation API from **ip-api.com**

* **Fast** and **easy** integration.
* Lightweight.
* Just **one** function, that cares about all
* Based on **free** and **fast** ip-api.com
* Requires **LuaSocket** toolkit
## Usage

```GeoIP.Query(IP, lang)``` _Returns table_
* IP - Target IP
* lang - Localization parameter, now supports only **en/de/es/fr**

```GeoIP.isIpValid(ip)``` _Returns boolean_
* IP - Target IP

**Simple Example:**
```lua
class 'GeoIPExample'

function GeoIPExample:__init()
    self.GeoIP = require("GeoIP")
    Events:Subscribe( "PlayerJoin", self, self.PlayerJoin )
end

function GeoIPExample:PlayerJoin( args )
    local plr = args.player
    local data = self.GeoIP.Query(plr:GetIP())
    Chat:Send(plr, "Hello " .. plr:GetName() .. "!\nAre you from " .. data["city"] .. "?", Color.White)
end

GeoIPExample() 
```
## Structure 
```json
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
```
* ```GeoIP.Query(IP, lang)["key"]``` 

## TODO List:
* [x] Working module
* [x] "Documentation"
* [x] Multi-locale support
* [ ] Tracking usage
