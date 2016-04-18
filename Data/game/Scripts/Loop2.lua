--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- This script holds your gameplay render functions
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Here we have our gameplay logic
rotsp =   6 * Timer.GetDelta();
SpriteBatch.Draw.Pos( logo, 0, 0, 0, 0, 0, 1, 1, 0 );
--
if mode=="game" then
    T_mode=Timer.GetTime()+1;
    count ={2,     4,    6,    8,    10}
    count2={2,     4,    6,    8,    10,     30}
    carop ={car1,car2,car3,car4,car5}
    CRx   ={-100, -100, -100, -100, -100, -300}
    CRy   ={0, 0, 0, 0, 0, 1000}
    CRz   ={0, 0, 0, 0, 0}
    CNx   ={-100, -100, -100, -100, -100}
    CNy   ={0, 0, 0, 0, 0}
    CNt   ={0, 0, 0, 0, 0}
    cf=0;cf_direction=1; cf2=0
    score=0 time=0 ; crash=false crashcop=false  cr=0 crcop=0 offset=0 offset2=0
    mode_disguise=false mode_ghost=false ghost=1 t_cop=0 mode_ghost_coin=false
    continue=false ch=1 g_tiger=false t_tiger=-30
    ImgX = 0  ImgY = -1400  posx=400  posy=500  r=0 r2=0
    mode="hold"
end
if Timer.GetTime()<T_mode then
    trans2=Timer.GetTime()-T_mode;
    SpriteBatch.Draw.Pos( road, ImgX, ImgY, 1, 1, 1, trans2, 0, 0 );
    SpriteBatch.Draw.PosRot(car1, posx, posy,r,35,75, 1, 1, 1,trans2, 0, 0 );
    if ImgY>0 then ImgY=-1400 else ImgY = ImgY +1500 * Timer.GetDelta() end
else
    level=1+math.floor(time/30)
    speed = (1500+50*level) * Timer.GetDelta();
    if Timer.NextSec()==true and not crash then time=time+1 end
    if tiger then car=cars[17] elseif mode_disguise then car=cars[16] elseif level <16 then car=cars[level] else car=cars[15] end
    SpriteBatch.Draw.Pos( road, ImgX, ImgY, 1, 1, 1, 1, 0.5, 0 );
    SpriteBatch.Draw.PosRot( car, posx, posy,r,35,75, 1, 1, 1,ghost, 0, 0 );
    SpriteBatch.Draw.PosRot(car16,CRx[6],CRy[6],r2,35,75, 1, 1, 1,1, 0, 0 );
    cf=cf+cf_direction*speed/15 if cf<0 then cf=0 cf_direction=1 elseif cf>50 then cf=50 cf_direction=-1 if cf2==90 then cf2=0 else cf2=90 end end
    SpriteBatch.Draw.DestSrcRot(coin,50,225,50-cf,50,cf2,0,90,90,0,45,45,1,1,1,1,0,0)
    if t_tiger+30<Timer.GetTime() then SpriteBatch.Draw.DestSrcRot(coin,50,500,50,50,0,90,90,90,0,45,45,1,1,1,1,0,0) end
    SpriteBatch.Draw.DestSrc(font,5,50,90,50,580,0,300,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,5,150,90,50,580,80,300,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,5,300,90,50,580,160,300,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,50,90,30,30,level*100,640,100,80,1,1,1,1,0,0)
    if level>9 then SpriteBatch.Draw.DestSrc(font,20,90,30,30,math.floor(level/10)*100,640,100,80,1,1,1,1,0,0) end
    SpriteBatch.Draw.DestSrc(font,70,250,30,30,score*100,640,100,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,40,250,30,30,math.floor(score/10)*100,640,100,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,10,250,30,30,math.floor(score/100)*100,640,100,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,70,340,30,30,time*100,640,100,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,40,340,30,30,math.floor(time/10)*100,640,100,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,10,340,30,30,math.floor(time/100)*100,640,100,80,1,1,1,1,0,0)

    --controls
    if Input.Key.Down(KeyCodes.Left ) == true and not crash then if posx>135 then posx = posx - speed/2 if r>-0.2 then r=r-rotsp; else r=-0.2; end end end;
    if Input.Key.Down(KeyCodes.Right) == true and not crash then if posx<665 then posx = posx + speed/2 if r<0.2 then r=r+rotsp; else r=0.2; end end end;
    if (Input.Key.Down(KeyCodes.Right) == false and Input.Key.Down(KeyCodes.Left) == false and r~=0 ) or posx<135 or posx>665 then if r<-0.1 then r=r+0.1; else r=0; end; if r> 0.1 then r=r-0.1; else r=0; end end;
    if Input.Key.Down(KeyCodes.Up) == true and not crash then if posy>75  then posy = posy - speed/15 end end;
    if Input.Key.Down(KeyCodes.Down) == true and not crash then if posy<625 then posy = posy + speed/15 end end;
    if Input.Key.DownOnce(KeyCodes.AltLeft) == true and not crash then if tiger then tiger = false else tiger =true end end;
    if Input.Key.DownOnce(KeyCodes.ShiftLeft)==true and tiger and t_tiger+30<Timer.GetTime() and not crash then t_tiger=Timer.GetTime() mode_ghost=true g_tiger=true ghost=0.5 end;
    if ImgY>0 then ImgY=-1400 else ImgY = ImgY +speed end
        --police
            if count2[6]<time then
                CRx[6]=Random.IntMinMax(135,665);
                CRy[6]=700
                t_cop=count2[6]
                count2[6]=count2[6]+Random.IntMinMax(35,45);
            end
            sum=0
            if not crashcop then
            for j=1,5 do
                if (CRx[j]-CRx[6])<60  and (CRy[j]-CRy[6])<140 and (CRx[j]-CRx[6])>-60  and (CRy[j]-CRy[6])>-140 and  CRy[6]<700 then
                    ccc=j cr_timecop=Timer.GetTime() crashcop=true
                end
                if CRz[j]==1 then
                    sum=1 break
                end
            end
            end
                if sum==1 and not crash and not crashcop then
                    if CRx[6]-posx>0 then CRx[6] = CRx[6] - speed/7; if r2>-0.2 then r2=r2-rotsp; else r2=-0.2; end
                                     else CRx[6] = CRx[6] + speed/7; if r2<0.2 then r2=r2+rotsp; else r2=0.2; end end
                else
                    if r2<-0.1 then r2=r2+0.1; else r2=0; end; if r2> 0.1 then r2=r2-0.1; else r2=0; end
                end
            if  not mode_disguise  then if t_cop+10>time then
            CRy[6]=CRy[6]-(speed/40); else
            CRy[6]=CRy[6]+(speed/40); end else
            CRy[6]=CRy[6]+(speed/25); end
            if (CRx[6]-posx)<60  and (CRy[6]-posy)<140 and (CRx[6]-posx)>-60  and (CRy[6]-posy)>-140 and not mode_ghost and not crash  then
                cc=6 cr_time=Timer.GetTime() crash=true end

        -- coins
        for clk=1,5 do
            if count[clk]<time then
                n=Random.IntMinMax(0,25);
                if n==1 then CNt[clk]=90 elseif n==2 then CNt[clk]=180 else CNt[clk]=0 end
                CNx[clk]=Random.IntMinMax(125,675);
                CNy[clk]=Random.IntMinMax(-150,-130);
                count[clk]=count[clk]+5;
            end
            SpriteBatch.Draw.DestSrcRot(coin,CNx[clk],CNy[clk],50-cf,50,cf2,CNt[clk],90,90,0,45,45,1,1,1,1,0,0)
            CNy[clk]=CNy[clk]+(speed/3);
            if (CNx[clk]-posx)<55  and (CNy[clk]-posy)<100 and (CNx[clk]-posx)>-55  and (CNy[clk]-posy)>-100 and not crash then
                CNx[clk]=-100  score=score+1
                if CNt[clk]==90 then mode_ghost_coin=true ghost_time=time+10 ghost_event=Timer.GetTime() elseif CNt[clk]==180 then mode_disguise=true disguise_time =time+10 disguise_event=Timer.GetTime() end
            end
        end
        --op cars
        for clk2=1,5 do
            if count2[clk2]<time then
                n2=Random.IntMinMax(1,16);
                CRx[clk2]=Random.IntMinMax(135,665);
                CRy[clk2]=Random.IntMinMax(-170,-150);
                carop[clk2]= cars[n2]
                count2[clk2]=count2[clk2]+5;
            end
                SpriteBatch.Draw.PosRot(carop[clk2],CRx[clk2],CRy[clk2],0,35,75, 1, 1, 1,1, 0.3, 0 );
            if clk2~=5 then
                CRy[clk2]=CRy[clk2]+(speed/4);
            else
                CRy[5]=CRy[5]+(speed/2);
            end

            if (CRx[clk2]-posx)<60  and (CRy[clk2]-posy)<140 and (CRx[clk2]-posx)>-60  and (CRy[clk2]-posy)>-140 and not mode_ghost then
                cc=clk2 cr_time=Timer.GetTime() crash=true end
            if (CRx[clk2]-CRx[6])<80  and (CRy[6]-CRy[clk2])<400 and (CRx[clk2]-CRx[6])>-80 and (CRy[6]-CRy[clk2])>0 then
                CRz[clk2]=1 else CRz[clk2]=0 end

        end
        -- game modes
        if mode_ghost_coin then
            SpriteBatch.Draw.DestSrcRot(coin,750,125,50-cf,50,cf2,90,90,90,0,45,45,1,1,1,1,0,0)
            mode_ghost=true
            ghost=0.5
            glim=20*(Timer.GetTime()-ghost_event)
            if ghost_event+1>Timer.GetTime() then SpriteBatch.Draw.DestSrc(font,250-2*glim,50-glim,300+4*glim,40+2*glim,0,480,670,80,1,1,1,1-glim/20,0,0) end
            if ghost_time-time>9 then
                SpriteBatch.Draw.DestSrc(font,720,150,30,30,100,640,100,80,1,1,1,1,0,0)
                SpriteBatch.Draw.DestSrc(font,750,150,30,30,0,640,100,80,1,1,1,1,0,0)
            elseif ghost_time-time==0 then mode_ghost=false ghost=1 mode_ghost_coin=false
            else SpriteBatch.Draw.DestSrc(font,735,150,30,30,(ghost_time-time)*100,640,100,80,1,1,1,1,0,0) end
        end
        if g_tiger then
        if t_tiger+1<Timer.GetTime() then mode_ghost=false ghost=1 g_tiger=false end
        end
        if mode_disguise then
            SpriteBatch.Draw.DestSrcRot(coin,750,225,50-cf,50,cf2,180,90,90,0,45,45,1,1,1,1,0,0)
            glim=20*(Timer.GetTime()-disguise_event)
            if disguise_event+1>Timer.GetTime() then SpriteBatch.Draw.DestSrc(font,250-2*glim,50-glim,300+4*glim,40+2*glim,0,560,850,80,1,1,1,1-glim/20,0,0) end
            if disguise_time-time>9 then
                SpriteBatch.Draw.DestSrc(font,720,250,30,30,100,640,100,80,1,1,1,1,0,0)
                SpriteBatch.Draw.DestSrc(font,750,250,30,30,0,640,100,80,1,1,1,1,0,0)
            elseif disguise_time-time==0 then mode_disguise=false
            else SpriteBatch.Draw.DestSrc(font,735,250,30,30,(disguise_time-time)*100,640,100,80,1,1,1,1,0,0) end
        end
        --explosion
        if crash then
            if cr_time+offset<Timer.GetTime() then if cr==704-64 then cr_direction=-1 else cr_direction=1 end cr=cr+cr_direction*64 offset=offset+0.01 end
                CRy[cc]=CRy[cc]+speed/4
                posy=posy+speed/4
                SpriteBatch.Draw.DestSrc(expl,posx-70,posy-125,150,220,cr,0,64,60,1,1,1,1,0,0)
                SpriteBatch.Draw.DestSrc(expl,CRx[cc]-70,CRy[cc]-125,150,220,cr,0,64,60,1,1,1,1,0,0)
            if score>=level*10 then
                SpriteBatch.Draw.DestSrc(font,150,380,500,40,0,720,1000,80,1,1,1,1,0,0)
                SpriteBatch.Draw.DestSrc(font,280,440,120,40,580,240,230,80,ch,ch,ch,1,0,0)
                SpriteBatch.Draw.DestSrc(font,400,440,120,40,580,320,230,80,1.5-ch,1.5-ch,1.5-ch,1,0,0)
                if Input.Key.DownOnce(KeyCodes.Left ) == true then ch=1   end
                if Input.Key.DownOnce(KeyCodes.Right) == true then ch=0.5 end
                if Input.Key.DownOnce(KeyCodes.Enter) == true then if ch==1 then continue=true score=score-level*10 cr_time=Timer.GetTime() crash=false posx=400 posy=800 else cr_time=Timer.GetTime()-5 end end
            else
                if Input.Key.DownOnce(KeyCodes.Enter) == true then cr_time=Timer.GetTime()-5 end
            end
            if cr_time+5<Timer.GetTime() then
            if cr_time+6<Timer.GetTime() then
                mode="menu"     State.SetStateFile("menu"); else
            SpriteBatch.Draw.Pos( logo, 0, 0, 0, 0, 0, Timer.GetTime()-cr_time-5, 0, 0 ); end end
        end
        if crashcop then
            if cr_timecop+offset2<Timer.GetTime() then if crcop==704-64 then cr_direction=-1 else cr_direction=1 end crcop=crcop+cr_direction*64 offset2=offset2+0.01 end
            if cr_timecop+2<Timer.GetTime() then crashcop=false end
                CRy[ccc]=CRy[ccc]+speed/4
                CRy[6]=CRy[6]+speed/4
                SpriteBatch.Draw.DestSrc(expl,CRx[6]-70,CRy[6]-125,150,220,crcop,0,64,60,1,1,1,1,0,0)
                SpriteBatch.Draw.DestSrc(expl,CRx[ccc]-70,CRy[ccc]-125,150,220,crcop,0,64,60,1,1,1,1,0,0)
        end
        if continue==true then
            if cr_time+1>Timer.GetTime() then posy=posy-speed/8 end
            mode_ghost=true ghost=0.5
            if cr_time+2<Timer.GetTime() then continue=false mode_ghost=false ghost=1 end
        end

end

