local StringEncoder = {}

local function generate_random_name(len)
    len = len or math.random(8, 12)
    local charset = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"
    local name = ""
    for _ = 1, len do
        local index = math.random(1, #charset)
        name = name .. charset:sub(index, index)
    end
    return name
end

function StringEncoder.processone(code)
    local random_decrypt_name = generate_random_name()
    local decode_function = [[local function ]]..random_decrypt_name..[[(b,c)local d,e,f,g,h,i,j,k,l,m=table.insert,table.concat,string.char,math.floor,string.reverse,{},#c,#b,1,{}b=h(b)c=h(c)while l<=k do local n,o=0,0;for p=1,4 do if l<=k then local q=c:find(b:sub(l,l),1,true)n=n*j+q-1;l=l+1;o=o+1 end end;for r=3,1,-1 do local s=n%256;n=g(n/256)if r<=o-1 then m[r]=f(s)end end;d(i,e(m))end;return e(i)end]]
    local custom_charset = "!@#$%^&*()-=_+[]{}|;:,.<>?/~`abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"

local function string_shuffle(str)
    local chars = {}
    for i = 1, #str do
        chars[i] = str:sub(i, i)
    end
    for i = #chars, 2, -1 do
        local j = math.random(1, i)
        chars[i], chars[j] = chars[j], chars[i]
    end
    return table.concat(chars)
end

math.randomseed(os.time())
custom_charset = string_shuffle(custom_charset)

local function custom_base_encode(data, charset)
    local function encode_once(data, charset)
        local encoded = {}
        local base = #charset
        local i = 1
        local length = #data
        local pad_length = (3 - (length % 3)) % 3
        data = data .. string.char(0):rep(pad_length)
        while i <= #data do
            local chunk = 0
            for j = 0, 2 do
                chunk = chunk * 256 + data:byte(i)
                i = i + 1
            end
            local temp = {}
            for j = 4, 1, -1 do
                local value = chunk % base
                chunk = math.floor(chunk / base)
                temp[j] = charset:sub(value + 1, value + 1)
            end
            table.insert(encoded, table.concat(temp))
        end
        return string.reverse(table.concat(encoded))
    end
    charset=string.reverse(charset)
    local first_pass = encode_once(data, charset)
    return first_pass
end
    return decode_function .. "\n" .. code:gsub('"([^"]-)"', function(str)
        if type(str) == "string" then
            local encoded_str = custom_base_encode(str, custom_charset)
            return string.format('%s("%s", "%s")', random_decrypt_name, encoded_str, custom_charset)
        else
            return str
        end
    end)
end
local function is_valid_char(byte)
    return (byte >= 48 and byte <= 57) or (byte >= 65 and byte <= 90) or (byte >= 97 and byte <= 122)
end

local function caesar_cipher(data, offset)
    local result = {}
    for i = 1, #data do
        local byte = data:byte(i)
        if is_valid_char(byte) then
            local new_byte
            if byte >= 48 and byte <= 57 then
                new_byte = ((byte - 48 + offset) % 10) + 48
            elseif byte >= 65 and byte <= 90 then
                new_byte = ((byte - 65 + offset) % 26) + 65
            elseif byte >= 97 and byte <= 122 then
                new_byte = ((byte - 97 + offset) % 26) + 97
            end
            table.insert(result, string.char(new_byte))
        else
            table.insert(result, string.char(byte))
        end
    end
    return table.concat(result)
end

function StringEncoder.process(code)
    code = StringEncoder.processone(code)
    local random_decrypt_name = generate_random_name()
    local random_isvalidchar_name = generate_random_name()
    local random_result_name = generate_random_name()
    local random_code_name = generate_random_name()
    local random_offset_name = generate_random_name()
    local random_byte_name = generate_random_name()
    local random_new_byte_name = generate_random_name()

    local decode_function = [[
local function ]] .. random_isvalidchar_name .. [[(]] .. random_byte_name .. [[)
    return (]] .. random_byte_name .. [[ >= 48 and ]] .. random_byte_name .. [[ <= 57) or (]] .. random_byte_name .. [[ >= 65 and ]] .. random_byte_name .. [[ <= 90) or (]] .. random_byte_name .. [[ >= 97 and ]] .. random_byte_name .. [[ <= 122)
end
	
local function ]] .. random_decrypt_name .. [[(]] .. random_code_name .. [[, ]] .. random_offset_name .. [[)
    local ]] .. random_result_name .. [[ = {}
    for i = 1, #]] .. random_code_name .. [[ do
        local ]] .. random_byte_name .. [[ = ]] .. random_code_name .. [[:byte(i)
        if ]] .. random_isvalidchar_name .. [[(]] .. random_byte_name .. [[) then
            local ]] .. random_new_byte_name .. [[
            if ]] .. random_byte_name .. [[ >= 48 and ]] .. random_byte_name .. [[ <= 57 then
                ]] .. random_new_byte_name .. [[ = ((]] .. random_byte_name .. [[ - 48 - ]] .. random_offset_name .. [[ + 10) % 10) + 48
            elseif ]] .. random_byte_name .. [[ >= 65 and ]] .. random_byte_name .. [[ <= 90 then
                ]] .. random_new_byte_name .. [[ = ((]] .. random_byte_name .. [[ - 65 - ]] .. random_offset_name .. [[ + 26) % 26) + 65
            elseif ]] .. random_byte_name .. [[ >= 97 and ]] .. random_byte_name .. [[ <= 122 then
                ]] .. random_new_byte_name .. [[ = ((]] .. random_byte_name .. [[ - 97 - ]] .. random_offset_name .. [[ + 26) % 26) + 97
            end
            table.insert(]] .. random_result_name .. [[, string.char(]] .. random_new_byte_name .. [[))
        else
            table.insert(]] .. random_result_name .. [[, string.char(]] .. random_byte_name .. [[))
        end
    end
    return table.concat(]] .. random_result_name .. [[)
end

local function ]] .. random_isvalidchar_name .. [[(]] .. random_byte_name .. [[)
    return (]] .. random_byte_name .. [[ >= 48 and ]] .. random_byte_name .. [[ <= 57) or (]] .. random_byte_name .. [[ >= 65 and ]] .. random_byte_name .. [[ <= 90) or (]] .. random_byte_name .. [[ >= 97 and ]] .. random_byte_name .. [[ <= 122)
end
]]

    return decode_function .. "\n" .. code:gsub('"([^"]-)"', function(str)
        if type(str) == "string" then
            local offset = math.random(1, 9)
            if str:match("%a") then
                offset = math.random(1, 25)
            end
            local encoded_str = caesar_cipher(str, offset)
            return string.format('%s("%s", %d)', random_decrypt_name, encoded_str, offset)
        else
            return str
        end
    end)
end
return StringEncoder
