# TSCPriceDataLite

A lightweight ESO addon providing price data from Tamriel Savings Co. This is a simplified version that provides just price lookups.

## Quick Start

**Users**: Install and forget - this addon provides price data to the Tamriel Savings Co Price Fetcher Addon, and your other addons if they use Tamriel Savings Co price data.

**Developers**: Simple API with comprehensive Xbox NA market data. See API below.

## API

The addon exposes a single function:

```lua
local price = TSCPriceDataLite:GetPrice(itemId)
```

### Input
- `itemId`: Number - The ESO item ID (obtained from game API calls like `GetItemLinkItemId()`)

### Output
- Returns a number representing the item's price if found
- Returns `nil` if:
  - Item not found in database
  - Invalid input
  - Any error condition

### Example Usage

```lua
-- Basic price lookup
local itemId = GetItemLinkItemId(itemLink)
local price = TSCPriceDataLite:GetPrice(itemId)

if price then
    -- Price found
    d("Item price: " .. price)
else
    -- No price data available
    d("No price data for this item")
end
```

## Data Structure

The addon uses a space-efficient data structure internally:

```lua
PriceData = {
    [itemId] = price,            -- Direct price entry
    [itemId2] = "referenceId",   -- Reference to another item's price
}
```

Items that share the same price (different traits) use references to avoid data duplication. This is handled transparently by the API - consumers don't need to know about the reference system.

## Version Support

- Version numbers follow the format YYYY.MM.DD (e.g. 2025.06.01) indicating when the price data was last updated
- Price data is updated weekly with the latest market prices
- Check your addon version against the current date to know how fresh your price data is

## Support

Have questions or feedback? Join our Discord community or visit our website:
- **Discord**: https://discord.gg/jcwQ9XXNV4
- **Website**: https://tamrielsavings.com/

## License

This Add-on is not created by, affiliated with or sponsored by ZeniMax Media Inc. or its affiliates. 
The Elder Scrolls® and related logos are registered trademarks or trademarks of ZeniMax Media Inc. in the United States and/or other countries.

### Data Usage and Distribution

The price data contained within this addon is proprietary to Tamriel Savings Co. and is subject to the following terms:

**Addon Development**: ESO addon developers are free and encouraged to use this data within their addons via the provided API functions. Attribution is required for this use case.

**Attribution Required**: When using our data in your addons, you must provide attribution to "Tamriel Savings Co." This can be done in any of the following ways:

- In your addon's manifest/description: "Price data powered by Tamriel Savings Co."
- In your addon's settings or about section: "Uses price data from Tamriel Savings Co."
- In your addon's README or documentation: "This addon uses pricing data provided by Tamriel Savings Co."
- In your addon's credits: List "Tamriel Savings Co." as a data provider
- As a tooltip note: Include "Data from Tamriel Savings Co." where price information is displayed

Choose whichever method best fits your addon's design and user experience.

**No Data Extraction**: The raw price data may not be extracted, copied, or redistributed outside of the ESO addon ecosystem without explicit written permission.

**Other Usage**: Any use of this data outside of ESO addon development (including but not limited to websites, applications, commercial projects, or data analysis) requires prior written consent from Tamriel Savings Co.

**API Usage**: The provided API functions are intended for use within the Elder Scrolls Online game environment and ESO addon development only.

**Derivative Works**: Addon developers may process and analyze our price data to create additional features within their addons. However, creating competing price databases or redistributing processed versions of our data requires prior written consent.

**Data Accuracy**: Our price data represents the most comprehensive dataset available for Xbox NA server, compiled from extensive market analysis. While we strive for accuracy and completeness, price data is provided as-is and market conditions can change rapidly. Users should exercise their own judgment when making trading decisions.

**Enforcement**: We trust the ESO community to respect these terms. If you have questions about acceptable use, permissions, licensing inquiries, questions about data usage or notice potential violations, please reach out to us. We prefer to resolve any issues through friendly communication rather than formal action.
