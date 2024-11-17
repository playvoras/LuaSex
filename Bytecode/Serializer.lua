local bit = (function()local a={_TYPE='module',_NAME='bit.numberlua',_VERSION='0.3.1.20120131'}local b=math.floor;local c=2^32;local d=c-1;local function e(f)local g={}local h=setmetatable({},g)function g:__index(i)local j=f(i)h[i]=j;return j end;return h end;local function k(l,m)local function n(o,p)local q,r=0,1;while o~=0 and p~=0 do local s,t=o%m,p%m;q=q+l[s][t]*r;o=(o-s)/m;p=(p-t)/m;r=r*m end;q=q+(o+p)*r;return q end;return n end;local function u(v)local w=k(v,2)local x=e(function(y)return e(function(z)return w(y,z)end)end)return k(x,2^(v.n or 1))end;function a.tobit(A)return A%2^32 end;a.bxor=u{[0]={[0]=0,[1]=1},[1]={[0]=1,[1]=0},n=4}local B=a.bxor;function a.bnot(C)return d-C end;local D=a.bnot;function a.band(E,F)return(E+F-B(E,F))/2 end;local G=a.band;function a.bor(H,I)return d-G(d-H,d-I)end;local J=a.bor;local K,L;function a.rshift(M,N)if N<0 then return K(M,-N)end;return b(M%2^32/2^N)end;L=a.rshift;function a.lshift(O,P)if P<0 then return L(O,-P)end;return O*2^P%2^32 end;K=a.lshift;function a.tohex(Q,R)R=R or 8;local S;if R<=0 then if R==0 then return''end;S=true;R=-R end;Q=G(Q,16^R-1)return('%0'..R..(S and'X'or'x')):format(Q)end;local T=a.tohex;function a.extract(U,V,W)W=W or 1;return G(L(U,V),2^W-1)end;local X=a.extract;function a.replace(Y,Z,_,a0)a0=a0 or 1;local a1=2^a0-1;Z=G(Z,a1)local a2=D(K(a1,_))return G(Y,a2)+K(Z,_)end;local a3=a.replace;function a.bswap(a4)local a5=G(a4,255)a4=L(a4,8)local a6=G(a4,255)a4=L(a4,8)local a7=G(a4,255)a4=L(a4,8)local a8=G(a4,255)return K(K(K(a5,8)+a6,8)+a7,8)+a8 end;local a9=a.bswap;function a.rrotate(aa,ab)ab=ab%32;local ac=G(aa,2^ab-1)return L(aa,ab)+K(ac,32-ab)end;local ad=a.rrotate;function a.lrotate(ae,af)return ad(ae,-af)end;local ag=a.lrotate;a.rol=a.lrotate;a.ror=a.rrotate;function a.arshift(ah,ai)local aj=L(ah,ai)if ah>=2147483648 then aj=aj+K(2^ai-1,32-ai)end;return aj end;local ak=a.arshift;function a.btest(al,am)return G(al,am)~=0 end;a.bit32={}local function an(ao)return(-1-ao)%c end;a.bit32.bnot=an;local function ap(aq,ar,as,...)local at;if ar then aq=aq%c;ar=ar%c;at=B(aq,ar)if as then at=ap(at,as,...)end;return at elseif aq then return aq%c else return 0 end end;a.bit32.bxor=ap;local function au(av,aw,ax,...)local ay;if aw then av=av%c;aw=aw%c;ay=(av+aw-B(av,aw))/2;if ax then ay=au(ay,ax,...)end;return ay elseif av then return av%c else return d end end;a.bit32.band=au;local function az(aA,aB,aC,...)local aD;if aB then aA=aA%c;aB=aB%c;aD=d-G(d-aA,d-aB)if aC then aD=az(aD,aC,...)end;return aD elseif aA then return aA%c else return 0 end end;a.bit32.bor=az;function a.bit32.btest(...)return au(...)~=0 end;function a.bit32.lrotate(aE,aF)return ag(aE%c,aF)end;function a.bit32.rrotate(aG,aH)return ad(aG%c,aH)end;function a.bit32.lshift(aI,aJ)if aJ>31 or aJ<-31 then return 0 end;return K(aI%c,aJ)end;function a.bit32.rshift(aK,aL)if aL>31 or aL<-31 then return 0 end;return L(aK%c,aL)end;function a.bit32.arshift(aM,aN)aM=aM%c;if aN>=0 then if aN>31 then return aM>=2147483648 and d or 0 else local aO=L(aM,aN)if aM>=2147483648 then aO=aO+K(2^aN-1,32-aN)end;return aO end else return K(aM,-aN)end end;function a.bit32.extract(aP,aQ,...)local aR=...or 1;if aQ<0 or aQ>31 or aR<0 or aQ+aR>32 then error'out of range'end;aP=aP%c;return X(aP,aQ,...)end;function a.bit32.replace(aS,aT,aU,...)local aV=...or 1;if aU<0 or aU>31 or aV<0 or aU+aV>32 then error'out of range'end;aS=aS%c;aT=aT%c;return a3(aS,aT,aU,...)end;a.bit={}function a.bit.tobit(aW)aW=aW%c;if aW>=2147483648 then aW=aW-c end;return aW end;local aX=a.bit.tobit;function a.bit.tohex(aY,...)return T(aY%c,...)end;function a.bit.bnot(aZ)return aX(D(aZ%c))end;local function a_(b0,b1,b2,...)if b2 then return a_(a_(b0,b1),b2,...)elseif b1 then return aX(J(b0%c,b1%c))else return aX(b0)end end;a.bit.bor=a_;local function b3(b4,b5,b6,...)if b6 then return b3(b3(b4,b5),b6,...)elseif b5 then return aX(G(b4%c,b5%c))else return aX(b4)end end;a.bit.band=b3;local function b7(b8,b9,ba,...)if ba then return b7(b7(b8,b9),ba,...)elseif b9 then return aX(B(b8%c,b9%c))else return aX(b8)end end;a.bit.bxor=b7;function a.bit.lshift(bb,bc)return aX(K(bb%c,bc%32))end;function a.bit.rshift(bd,be)return aX(L(bd%c,be%32))end;function a.bit.arshift(bf,bg)return aX(ak(bf%c,bg%32))end;function a.bit.rol(bh,bi)return aX(ag(bh%c,bi%32))end;function a.bit.ror(bj,bk)return aX(ad(bj%c,bk%32))end;function a.bit.bswap(bl)return aX(a9(bl%c))end;return a end)()
local function Serialize(Chunk)
    local Buffer = {}

    local function AddByte(Value)
        table.insert(Buffer, string.char(Value))
    end

    local function WriteBits8(Value)
        AddByte(Value)
    end

    local function WriteBits16(Value)
        for i = 0, 1 do
            AddByte(bit.band(bit.rshift(Value, i * 8), 0xFF))
        end
    end

    local function WriteBits32(Value)
        for i = 0, 3 do
            AddByte(bit.band(bit.rshift(Value, i * 8), 0xFF))
        end
    end

    -- local function WriteBits64(Value)
    --     local Hi = math.floor(Value / 4294967296)
    --     local Lo = Value % 4294967296
    --     WriteBits32(Lo)
    --     WriteBits32(Hi)
    -- end

    local function WriteFloat64(value)
        local sign = 0
        if value < 0 or (value == 0 and 1 / value == -math.huge) then
            sign = 1
        end

        local mantissa, exponent = math.frexp(math.abs(value))
        if value == 0 then
            exponent, mantissa = 0, 0
        elseif value == math.huge then
            exponent, mantissa = 2047, 0
        elseif value ~= value then
            exponent, mantissa = 2047, 1
        else
            mantissa = (mantissa * 2 - 1) * 2 ^ 52
            exponent = exponent + 1022
        end

        local high = sign * 2 ^ 31 + exponent * 2 ^ 20 + math.floor(mantissa / 2 ^ 32)
        local low = mantissa % 2 ^ 32

        WriteBits32(low)
        WriteBits32(high)
    end

    local function WriteString(Str)
        WriteBits32(#Str)
        for i = 1, #Str do
            WriteBits8(string.byte(Str, i))
        end
    end

    local function WriteChunk(SubChunk)
        WriteBits8(SubChunk.Upvals)
        WriteBits8(SubChunk.Parameters)
        WriteBits8(SubChunk.MaxStack)

        WriteBits32(#SubChunk.Instructions)
        for i = 1, #SubChunk.Instructions do
            local Inst = SubChunk.Instructions[i]
            local Data = Inst.Value
            local Enum = Inst.Enum
            local Type = Inst.Type;
            local Mode = Inst.Mode;

            WriteBits32(Data)
            WriteBits8(Enum)
            WriteBits8((Type == "ABC" and 1) or (Type == "ABx" and 2) or (Type == "AsBx" and 3))
            WriteBits16(Inst.A)

            if (Mode.b == "OpArgK") then
                WriteBits8(1)
            elseif (Mode.b == "OpArgN") then
                WriteBits8(0)
            elseif (Mode.b == "OpArgU") then
                WriteBits8(0)
            elseif (Mode.b == "OpArgR") then
                WriteBits8(0)
            end

            if (Mode.c == "OpArgK") then
                WriteBits8(1)
            elseif (Mode.c == "OpArgN") then
                WriteBits8(0)
            elseif (Mode.c == "OpArgU") then
                WriteBits8(0)
            elseif (Mode.c == "OpArgR") then
                WriteBits8(0)
            end

            if (Type == "ABC") then
                WriteBits16(Inst.B)
                WriteBits16(Inst.C)
            elseif(Type == "ABx") then
                WriteBits32(Inst.Bx)
            elseif (Type == "AsBx") then
                WriteBits32(Inst.sBx + 131071)
            end
        end

        WriteBits32(#SubChunk.Constants)
        for i = 1, #SubChunk.Constants do
            local Const = SubChunk.Constants[i]
            local Type = type(Const)

            if (Type == "boolean") then
                WriteBits8(1)
                WriteBits8(Const and 1 or 0)
            elseif (Type == "number") then
                WriteBits8(3)
                WriteFloat64(Const)
            elseif (Type == "string") then
                WriteBits8(4)
                WriteString(Const)
            end
        end

        WriteBits32(#SubChunk.Protos)
        for i = 1, #SubChunk.Protos do
            WriteChunk(SubChunk.Protos[i])
        end
    end

    WriteChunk(Chunk)

    return table.concat(Buffer)
end

return Serialize
