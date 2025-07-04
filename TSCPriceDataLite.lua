TSCPriceDataLite = {}
TSCPriceDataLite.name = "TSCPriceDataLite"
_G.TSCPriceDataLite = TSCPriceDataLite

function TSCPriceDataLite:GetPrice(id)
    if id == nil then return nil end
    if type(id) ~= "number" then return nil end

    local data = PriceData[id]
    if data == nil then return nil end

    -- Parse string format: "avgPrice,commonMin,commonMax,salesCount"
    if type(data) == "string" then
        local parts = string.split(data, ",")
        if parts and parts[1] then
            return tonumber(parts[1])
        end
    end

    return nil
end

function TSCPriceDataLite.OnAddOnLoaded(event, addonName)
    if addonName == TSCPriceDataLite.name then
        EVENT_MANAGER:UnregisterForEvent(TSCPriceDataLite.name, EVENT_ADD_ON_LOADED)
    end
end

EVENT_MANAGER:RegisterForEvent(TSCPriceDataLite.name, EVENT_ADD_ON_LOADED, TSCPriceDataLite.OnAddOnLoaded)