-- Convert the Ip to integer, and check if present in crowdsec DB
ok, err = require "crowdsec".allowIp(ngx.var.remote_addr)
if err ~= nil then 
    ngx.log(ngx.ERR, "[Crowdsec] bouncer error " .. err)
end
if ok == nil then
   ngx.log(ngx.ERR, "[Crowdsec] " .. err)
end
if not ok then
    ngx.log(ngx.ALERT, "[Crowdsec] denied '" .. ngx.var.remote_addr .. "'")
	ngx.exit(ngx.HTTP_FORBIDDEN)
end
