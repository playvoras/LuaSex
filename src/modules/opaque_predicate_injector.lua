local OpaquePredicateInjector = {}

local predicates = {
    " if (math.sin(0) == 0) then ", 
    " if (5^2 == 25) then ", 
    " if ((10 > 5 and 2 < 3) or (7 ~= 8)) then ", 
    " if (#('abcdef') == 6) then ", 
    " if (not false) then ", 
    " if (select(2, pcall(function() return 1 end)) == 1) then ", 
    " if (type(tonumber('123')) == 'number') then ", 
    " if (table.maxn({1, 2, 3}) == 3) then ",  
}

-- Function to check if a statement is safe for injection
local function is_safe_for_injection(statement)
    -- Avoid loops, conditionals, or invalid lines for injection
    if statement:match("^%s*for%s+") or statement:match("^%s*while%s+") or statement:match("^%s*if%s+") or statement:match("^%s*repeat%s+") then
        return false
    end
    -- Avoid statements without semicolons, just whitespace, or encoded blocks
    if statement:match("^%s*$") or not statement:match(".+;") then
        return false
    end
    -- Avoid blocks with encoded strings or already obfuscated code patterns
    if statement:match("[%%$%*%+%-%/%?%^]") or statement:match("[A-Za-z0-9]+%(") then
        return false
    end
    -- Prevent injection after lines ending with a ')'
    if statement:match("%)$") then
        return false
    end
    return true
end

-- Function to inject a random predicate into a given block of code
local function inject_predicate(block)
    local predicate = predicates[math.random(#predicates)]
    -- If the block ends with 'end', inject predicate before it
    if block:match("%s*end%s*;?$") then
        return predicate .. block
    -- Avoid injecting into return statements
    elseif block:match("^%s*return") then
        return block
    else
        return predicate .. block .. " end;"  -- Close the predicate with 'end'
    end
end

-- Process the code by injecting predicates into safe locations
function OpaquePredicateInjector.process(code)
    local success, processed_code = pcall(function()
        return code:gsub("([ \t]*)([^\n;]*;)", function(ws, statement)
            if is_safe_for_injection(statement) then
                return ws .. inject_predicate(statement)
            else
                return ws .. statement
            end
        end)
    end)
    
    if success then
        -- Special handling for return statements to prevent them from being broken
        processed_code = processed_code:gsub("([ \t]*)(return%s+[^\n;]+;)", function(ws, return_stmt)
            return ws .. return_stmt
        end)
        return processed_code
    else
        -- If any error occurs during processing, return the original code
        return code
    end
end

return OpaquePredicateInjector
