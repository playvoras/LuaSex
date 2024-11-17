local bit = (function()local a={_TYPE='module',_NAME='bit.numberlua',_VERSION='0.3.1.20120131'}local b=math.floor;local c=2^32;local d=c-1;local function e(f)local g={}local h=setmetatable({},g)function g:__index(i)local j=f(i)h[i]=j;return j end;return h end;local function k(l,m)local function n(o,p)local q,r=0,1;while o~=0 and p~=0 do local s,t=o%m,p%m;q=q+l[s][t]*r;o=(o-s)/m;p=(p-t)/m;r=r*m end;q=q+(o+p)*r;return q end;return n end;local function u(v)local w=k(v,2)local x=e(function(y)return e(function(z)return w(y,z)end)end)return k(x,2^(v.n or 1))end;function a.tobit(A)return A%2^32 end;a.bxor=u{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local B=a.bxor;function a.bnot(C)return d-C end;local D=a.bnot;function a.band(E,F)return(E+F-B(E,F))/2 end;local G=a.band;function a.bor(H,I)return d-G(d-H,d-I)end;local J=a.bor;local K,L;function a.rshift(M,N)if N<0 then return K(M,-N)end;return b(M%2^32/2^N)end;L=a.rshift;function a.lshift(O,P)if P<0 then return L(O,-P)end;return O*2^P%2^32 end;K=a.lshift;function a.tohex(Q,R)R=R or 8;local S;if R<=0 then if R==0 then return''end;S=true;R=-R end;Q=G(Q,16^R-1)return('%0'..R..(S and'X'or'x')):format(Q)end;local T=a.tohex;function a.extract(U,V,W)W=W or 1;return G(L(U,V),2^W-1)end;local X=a.extract;function a.replace(Y,Z,_,a0)a0=a0 or 1;local a1=2^a0-1;Z=G(Z,a1)local a2=D(K(a1,_))return G(Y,a2)+K(Z,_)end;local a3=a.replace;function a.bswap(a4)local a5=G(a4,255)a4=L(a4,8)local a6=G(a4,255)a4=L(a4,8)local a7=G(a4,255)a4=L(a4,8)local a8=G(a4,255)return K(K(K(a5,8)+a6,8)+a7,8)+a8 end;local a9=a.bswap;function a.rrotate(aa,ab)ab=ab%32;local ac=G(aa,2^ab-1)return L(aa,ab)+K(ac,32-ab)end;local ad=a.rrotate;function a.lrotate(ae,af)return ad(ae,-af)end;local ag=a.lrotate;a.rol=a.lrotate;a.ror=a.rrotate;function a.arshift(ah,ai)local aj=L(ah,ai)if ah>=2147483648 then aj=aj+K(2^ai-1,32-ai)end;return aj end;local ak=a.arshift;function a.btest(al,am)return G(al,am)~=0 end;a.bit32={}local function an(ao)return(-1-ao)%c end;a.bit32.bnot=an;local function ap(aq,ar,as,...)local at;if ar then aq=aq%c;ar=ar%c;at=B(aq,ar)if as then at=ap(at,as,...)end;return at elseif aq then return aq%c else return 0 end end;a.bit32.bxor=ap;local function au(av,aw,ax,...)local ay;if aw then av=av%c;aw=aw%c;ay=(av+aw-B(av,aw))/2;if ax then ay=au(ay,ax,...)end;return ay elseif av then return av%c else return d end end;a.bit32.band=au;local function az(aA,aB,aC,...)local aD;if aB then aA=aA%c;aB=aB%c;aD=d-G(d-aA,d-aB)if aC then aD=az(aD,aC,...)end;return aD elseif aA then return aA%c else return 0 end end;a.bit32.bor=az;function a.bit32.btest(...)return au(...)~=0 end;function a.bit32.lrotate(aE,aF)return ag(aE%c,aF)end;function a.bit32.rrotate(aG,aH)return ad(aG%c,aH)end;function a.bit32.lshift(aI,aJ)if aJ>31 or aJ<-31 then return 0 end;return K(aI%c,aJ)end;function a.bit32.rshift(aK,aL)if aL>31 or aL<-31 then return 0 end;return L(aK%c,aL)end;function a.bit32.arshift(aM,aN)aM=aM%c;if aN>=0 then if aN>31 then return aM>=2147483648 and d or 0 else local aO=L(aM,aN)if aM>=2147483648 then aO=aO+K(2^aN-1,32-aN)end;return aO end else return K(aM,-aN)end end;function a.bit32.extract(aP,aQ,...)local aR=...or 1;if aQ<0 or aQ>31 or aR<0 or aQ+aR>32 then error'out of range'end;aP=aP%c;return X(aP,aQ,...)end;function a.bit32.replace(aS,aT,aU,...)local aV=...or 1;if aU<0 or aU>31 or aV<0 or aU+aV>32 then error'out of range'end;aS=aS%c;aT=aT%c;return a3(aS,aT,aU,...)end;a.bit={}function a.bit.tobit(aW)aW=aW%c;if aW>=2147483648 then aW=aW-c end;return aW end;local aX=a.bit.tobit;function a.bit.tohex(aY,...)return T(aY%c,...)end;function a.bit.bnot(aZ)return aX(D(aZ%c))end;local function a_(b0,b1,b2,...)if b2 then return a_(a_(b0,b1),b2,...)elseif b1 then return aX(J(b0%c,b1%c))else return aX(b0)end end;a.bit.bor=a_;local function b3(b4,b5,b6,...)if b6 then return b3(b3(b4,b5),b6,...)elseif b5 then return aX(G(b4%c,b5%c))else return aX(b4)end end;a.bit.band=b3;local function b7(b8,b9,ba,...)if ba then return b7(b7(b8,b9),ba,...)elseif b9 then return aX(B(b8%c,b9%c))else return aX(b8)end end;a.bit.bxor=b7;function a.bit.lshift(bb,bc)return aX(K(bb%c,bc%32))end;function a.bit.rshift(bd,be)return aX(L(bd%c,be%32))end;function a.bit.arshift(bf,bg)return aX(ak(bf%c,bg%32))end;function a.bit.rol(bh,bi)return aX(ag(bh%c,bi%32))end;function a.bit.ror(bj,bk)return aX(ad(bj%c,bk%32))end;function a.bit.bswap(bl)return aX(a9(bl%c))end;return a end)()

_G.UsedOps = {}

if not table.create then function table.create(_) return {} end end

local lua_bc_to_state
local stm_lua_func

-- opcode types for getting values
local OPCODE_T = {
	[0] = 'ABC',
	'ABx',
	'ABC',
	'ABC',
	'ABC',
	'ABx',
	'ABC',
	'ABx',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'AsBx',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'ABC',
	'AsBx',
	'AsBx',
	'ABC',
	'ABC',
	'ABC',
	'ABx',
	'ABC',
}

local OPCODE_M = {
	[0] = {b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgK', c = 'OpArgN'},
	{b = 'OpArgU', c = 'OpArgU'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgU', c = 'OpArgN'},
	{b = 'OpArgK', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgN'},
	{b = 'OpArgU', c = 'OpArgN'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgU', c = 'OpArgU'},
	{b = 'OpArgR', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgR'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgK', c = 'OpArgK'},
	{b = 'OpArgR', c = 'OpArgU'},
	{b = 'OpArgR', c = 'OpArgU'},
	{b = 'OpArgU', c = 'OpArgU'},
	{b = 'OpArgU', c = 'OpArgU'},
	{b = 'OpArgU', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgR', c = 'OpArgN'},
	{b = 'OpArgN', c = 'OpArgU'},
	{b = 'OpArgU', c = 'OpArgU'},
	{b = 'OpArgN', c = 'OpArgN'},
	{b = 'OpArgU', c = 'OpArgN'},
	{b = 'OpArgU', c = 'OpArgN'},
}

-- int rd_int_basic(string src, int s, int e, int d)
-- @src - Source binary string
-- @s - Start index of a little endian integer
-- @e - End index of the integer
-- @d - Direction of the loop
local function rd_int_basic(src, s, e, d)
	local num = 0

	-- if bb[l] > 127 then -- signed negative
	-- 	num = num - 256 ^ l
	-- 	bb[l] = bb[l] - 128
	-- end

	for i = s, e, d do
		local mul = 256 ^ math.abs(i - s)

		num = num + mul * string.byte(src, i, i)
	end

	return num
end

-- float rd_flt_basic(byte f1..8)
-- @f1..4 - The 4 bytes composing a little endian float
local function rd_flt_basic(f1, f2, f3, f4)
	local sign = (-1) ^ bit.rshift(f4, 7)
	local exp = bit.rshift(f3, 7) + bit.lshift(bit.band(f4, 0x7F), 1)
	local frac = f1 + bit.lshift(f2, 8) + bit.lshift(bit.band(f3, 0x7F), 16)
	local normal = 1

	if exp == 0 then
		if frac == 0 then
			return sign * 0
		else
			normal = 0
			exp = 1
		end
	elseif exp == 0x7F then
		if frac == 0 then
			return sign * (1 / 0)
		else
			return sign * (0 / 0)
		end
	end

	return sign * 2 ^ (exp - 127) * (1 + normal / 2 ^ 23)
end

-- double rd_dbl_basic(byte f1..8)
-- @f1..8 - The 8 bytes composing a little endian double
local function rd_dbl_basic(f1, f2, f3, f4, f5, f6, f7, f8)
	local sign = (-1) ^ bit.rshift(f8, 7)
	local exp = bit.lshift(bit.band(f8, 0x7F), 4) + bit.rshift(f7, 4)
	local frac = bit.band(f7, 0x0F) * 2 ^ 48
	local normal = 1

	frac = frac + (f6 * 2 ^ 40) + (f5 * 2 ^ 32) + (f4 * 2 ^ 24) + (f3 * 2 ^ 16) + (f2 * 2 ^ 8) + f1 -- help

	if exp == 0 then
		if frac == 0 then
			return sign * 0
		else
			normal = 0
			exp = 1
		end
	elseif exp == 0x7FF then
		if frac == 0 then
			return sign * (1 / 0)
		else
			return sign * (0 / 0)
		end
	end

	return sign * 2 ^ (exp - 1023) * (normal + frac / 2 ^ 52)
end

-- int rd_int_le(string src, int s, int e)
-- @src - Source binary string
-- @s - Start index of a little endian integer
-- @e - End index of the integer
local function rd_int_le(src, s, e) return rd_int_basic(src, s, e - 1, 1) end

-- int rd_int_be(string src, int s, int e)
-- @src - Source binary string
-- @s - Start index of a big endian integer
-- @e - End index of the integer
local function rd_int_be(src, s, e) return rd_int_basic(src, e - 1, s, -1) end

-- float rd_flt_le(string src, int s)
-- @src - Source binary string
-- @s - Start index of little endian float
local function rd_flt_le(src, s) return rd_flt_basic(string.byte(src, s, s + 3)) end

-- float rd_flt_be(string src, int s)
-- @src - Source binary string
-- @s - Start index of big endian float
local function rd_flt_be(src, s)
	local f1, f2, f3, f4 = string.byte(src, s, s + 3)
	return rd_flt_basic(f4, f3, f2, f1)
end

-- double rd_dbl_le(string src, int s)
-- @src - Source binary string
-- @s - Start index of little endian double
local function rd_dbl_le(src, s) return rd_dbl_basic(string.byte(src, s, s + 7)) end

-- double rd_dbl_be(string src, int s)
-- @src - Source binary string
-- @s - Start index of big endian double
local function rd_dbl_be(src, s)
	local f1, f2, f3, f4, f5, f6, f7, f8 = string.byte(src, s, s + 7) -- same
	return rd_dbl_basic(f8, f7, f6, f5, f4, f3, f2, f1)
end

-- to avoid nested ifs in deserializing
local float_types = {
	[4] = {little = rd_flt_le, big = rd_flt_be},
	[8] = {little = rd_dbl_le, big = rd_dbl_be},
}

-- byte stm_byte(Stream S)
-- @S - Stream object to read from
local function stm_byte(S)
	local idx = S.index
	local bt = string.byte(S.source, idx, idx)

	S.index = idx + 1
	return bt
end

-- string stm_string(Stream S, int len)
-- @S - Stream object to read from
-- @len - Length of string being read
local function stm_string(S, len)
	local pos = S.index + len
	local str = string.sub(S.source, S.index, pos - 1)

	S.index = pos
	return str
end

-- string stm_lstring(Stream S)
-- @S - Stream object to read from
local function stm_lstring(S)
	local len = S:s_szt()
	local str

	if len ~= 0 then str = string.sub(stm_string(S, len), 1, -2) end

	return str
end

-- fn cst_int_rdr(string src, int len, fn func)
-- @len - Length of type for reader
-- @func - Reader callback
local function cst_int_rdr(len, func)
	return function(S)
		local pos = S.index + len
		local int = func(S.source, S.index, pos)
		S.index = pos

		return int
	end
end

-- fn cst_flt_rdr(string src, int len, fn func)
-- @len - Length of type for reader
-- @func - Reader callback
local function cst_flt_rdr(len, func)
	return function(S)
		local flt = func(S.source, S.index)
		S.index = S.index + len

		return flt
	end
end

local function stm_inst_list(S)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do
		local ins = S:s_ins()
		local op = bit.band(ins, 0x3F)
		local args = OPCODE_T[op]
		local mode = OPCODE_M[op]
		local data = {Value = ins, Enum = op, Type = args, Mode = mode, A = bit.band(bit.rshift(ins, 6), 0xFF)}

		if args == 'ABC' then
			data.B = bit.band(bit.rshift(ins, 23), 0x1FF)
			data.C = bit.band(bit.rshift(ins, 14), 0x1FF)
			-- data.is_KB = mode.b == 'OpArgK' and data.B > 0xFF -- post process optimization
			-- data.is_KC = mode.c == 'OpArgK' and data.C > 0xFF

			-- if op == 10 then -- decode NEWTABLE array size, store it as constant value
			-- 	local e = bit.band(bit.rshift(data.B, 3), 31)
			-- 	if e == 0 then
			-- 		data.const = data.B
			-- 	else
			-- 		data.const = bit.lshift(bit.band(data.B, 7) + 8, e - 1)
			-- 	end
			-- end
		elseif args == 'ABx' then
			data.Bx = bit.band(bit.rshift(ins, 14), 0x3FFFF)
			-- data.is_K = mode.b == 'OpArgK'
		elseif args == 'AsBx' then
			data.sBx = bit.band(bit.rshift(ins, 14), 0x3FFFF) - 131071
		end

		if not _G.UsedOps[op] then
			_G.UsedOps[op] = op
		end

		list[i] = data
	end

	return list
end

local function stm_const_list(S)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do
		local tt = stm_byte(S)
		local k

		if tt == 1 then
			k = stm_byte(S) ~= 0
		elseif tt == 3 then
			k = S:s_num()
		elseif tt == 4 then
			k = stm_lstring(S)
		end

		list[i] = k -- offset +1 during instruction decode
	end

	return list
end

local function stm_sub_list(S, src)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do
		list[i] = stm_lua_func(S, src) -- offset +1 in CLOSURE
	end

	return list
end

local function stm_line_list(S)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do list[i] = S:s_int() end

	return list
end

local function stm_loc_list(S)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do list[i] = {varname = stm_lstring(S), startpc = S:s_int(), endpc = S:s_int()} end

	return list
end

local function stm_upval_list(S)
	local len = S:s_int()
	local list = table.create(len)

	for i = 1, len do list[i] = stm_lstring(S) end

	return list
end

function stm_lua_func(S, psrc)
	local proto = {}
	local src = stm_lstring(S) or psrc -- source is propagated

	proto.SourceName = src -- source name

	S:s_int() -- line defined
	S:s_int() -- last line defined

	proto.Upvals = stm_byte(S) -- num upvalues
	proto.Parameters = stm_byte(S) -- num params

	stm_byte(S) -- vararg flag
	proto.MaxStack = stm_byte(S) -- max stack size

	proto.Instructions = stm_inst_list(S)
	proto.Constants = stm_const_list(S)
	proto.Protos = stm_sub_list(S, src)

    stm_line_list(S)
	stm_loc_list(S)
	stm_upval_list(S)

	-- post process optimization
	-- for _, v in ipairs(proto.code) do
	-- 	if v.is_K then
	-- 		v.const = proto.const[v.Bx + 1] -- offset for 1 based index
	-- 	else
	-- 		if v.is_KB then v.const_B = proto.const[v.B - 0xFF] end

	-- 		if v.is_KC then v.const_C = proto.const[v.C - 0xFF] end
	-- 	end
	-- end

	-- UsedOpcodes[0] = 0
	-- UsedOpcodes[4] = 4

	return proto
end

function lua_bc_to_state(src)
	-- func reader
	local rdr_func

	-- header flags
	local little
	local size_int
	local size_szt
	local size_ins
	local size_num
	local flag_int

	-- stream object
	local stream = {
		-- data
		index = 1,
		source = src,
	}

	assert(stm_string(stream, 4) == '\27Lua', 'invalid Lua signature')
	assert(stm_byte(stream) == 0x51, 'invalid Lua version')
	assert(stm_byte(stream) == 0, 'invalid Lua format')

	little = stm_byte(stream) ~= 0
	size_int = stm_byte(stream)
	size_szt = stm_byte(stream)
	size_ins = stm_byte(stream)
	size_num = stm_byte(stream)
	flag_int = stm_byte(stream) ~= 0

	rdr_func = little and rd_int_le or rd_int_be
	stream.s_int = cst_int_rdr(size_int, rdr_func)
	stream.s_szt = cst_int_rdr(size_szt, rdr_func)
	stream.s_ins = cst_int_rdr(size_ins, rdr_func)

	if flag_int then
		stream.s_num = cst_int_rdr(size_num, rdr_func)
	elseif float_types[size_num] then
		stream.s_num = cst_flt_rdr(size_num, float_types[size_num][little and 'little' or 'big'])
	else
		error('unsupported float size')
	end

	return stm_lua_func(stream, '@virtual')
end

return lua_bc_to_state
