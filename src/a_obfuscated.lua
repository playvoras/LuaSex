local function rrvqFRyx(lLOktUJPSWLW)return(lLOktUJPSWLW>=48 and lLOktUJPSWLW<=57)or(lLOktUJPSWLW>=65 and lLOktUJPSWLW<=90)or(lLOktUJPSWLW>=97 and lLOktUJPSWLW<=122)end local function QwYgwVKjVV(WSMpxbbHLrL,YDbnjBExJXuQ)local xmjNQSsbI={}for i=1,#WSMpxbbHLrL do local lLOktUJPSWLW=WSMpxbbHLrL:byte(i)if rrvqFRyx(lLOktUJPSWLW)then local DypBZAUZLLUy if lLOktUJPSWLW>=48 and lLOktUJPSWLW<=57 then DypBZAUZLLUy=((lLOktUJPSWLW-48-YDbnjBExJXuQ+10)% 10)+48 elseif lLOktUJPSWLW>=65 and lLOktUJPSWLW<=90 then DypBZAUZLLUy=((lLOktUJPSWLW-65-YDbnjBExJXuQ+26)% 26)+65 elseif lLOktUJPSWLW>=97 and lLOktUJPSWLW<=122 then DypBZAUZLLUy=((lLOktUJPSWLW-97-YDbnjBExJXuQ+26)% 26)+97 end table.insert(xmjNQSsbI,string.char(DypBZAUZLLUy))else table.insert(xmjNQSsbI,string.char(lLOktUJPSWLW))end end return table.concat(xmjNQSsbI)end local function rrvqFRyx(lLOktUJPSWLW)return(lLOktUJPSWLW>=48 and lLOktUJPSWLW<=57)or(lLOktUJPSWLW>=65 and lLOktUJPSWLW<=90)or(lLOktUJPSWLW>=97 and lLOktUJPSWLW<=122)end local function VvSBLfix(b,c)local d,e,f,g,h,i,j,k,l,m=table.insert,table.concat,string.char,math.floor,string.reverse,{},#c,#b,1,{}b=h(b)c=h(c)while l<=k do local n,o=0,0;for p=1,4 do if l<=k then local q=c:find(b:sub(l,l),1,true)n=n*j+q-1;l=l+1;o=o+1 end end;for r=3,1,-1 do local s=n%256;n=g(n/256)if r<=o-1 then m[r]=f(s)end end;d(i,e(m))end;return e(i)end print(VvSBLfix(QwYgwVKjVV("F^f8n?98",2),QwYgwVKjVV("uTB8;=([U4SKV}m9QRkIrj,g3YdP`>|Nyo+6$q-bGMw.7E:~FZnhf@C{HsWv%ADlJxpt&O*i<5a0?X_21Lce!/]#^)z",25)))