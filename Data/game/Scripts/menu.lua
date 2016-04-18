--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- This script holds your gameplay render functions
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Here we have our gameplay logic
SpriteBatch.Draw.Pos( logo, 0, 0, 0, 0, 0, 1, 0, 0 );
-- And here we are drawing our player on screen
if mode=="menu" then
   T_mode=Timer.GetTime();
   opt=1
   T_exit=false
   options=false
   mode="hold"
end
if Timer.GetTime()<T_mode+0.5 then
    trans2=Timer.GetTime()-T_mode;
    SpriteBatch.Draw.Pos( menu, 0, 0, 1, 1, 1, 2*trans2, 0, 0 );
    SpriteBatch.Draw.DestSrc(font,60,350,300,50,0,0,580,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,60,450,300,50,0,80,580,80,1,1,1,1,0,0)
    SpriteBatch.Draw.DestSrc(font,60,550,300,50,0,160,580,80,1,1,1,1,0,0)
elseif not T_exit then
    if opt==1 then hide_1=1;hide_2=0.5;hide_3=0.5; elseif opt==2 then hide_1=0.5;hide_2=1;hide_3=0.5; elseif opt==3 then hide_1=0.5;hide_2=0.5;hide_3=1; end
    SpriteBatch.Draw.Pos( menu, 0, 0, 1, 1, 1, 1, 0, 0 );
    SpriteBatch.Draw.DestSrc(font,60,350,300,50,0,0,580,80, hide_1, hide_1, hide_1, 1, 0, 0 );
    SpriteBatch.Draw.DestSrc(font,60,450,300,50,0,80,580,80, hide_2, hide_2, hide_2, 1, 0, 0 );
    SpriteBatch.Draw.DestSrc(font,60,550,300,50,0,160,580,80, hide_3, hide_3, hide_3, 1, 0, 0 );
    if options==true then
        if opt==4 then hide_2=1 hide_3=0.5 else hide_2=0.5 hide_3=1 end
        SpriteBatch.Draw.DestSrc(font,60,350,300,50,0,240,580,80, 1, 1, 1, 1, 0, 0 );
        SpriteBatch.Draw.DestSrc(font,60,450,300,50,0,320,580,80, hide_2, hide_2, hide_2, 1, 0, 0 );
        SpriteBatch.Draw.DestSrc(font,60,550,300,50,0,400,580,80, hide_3, hide_3, hide_3, 1, 0, 0 );
    end

    if Input.Key.DownOnce(KeyCodes.Up) == true then
        if opt==1 then opt=3 elseif opt<4 then opt=opt-1 end
        if opt==4 then opt=5 elseif opt==5 then opt=4 end
    end;

    if Input.Key.DownOnce(KeyCodes.Down) == true then
        if opt==3 then opt=1 elseif opt<4 then opt=opt+1 end
        if opt==4 then opt=5 elseif opt==5 then opt=4 end
    end;
    if Input.Key.DownOnce(KeyCodes.Enter) == true then
        if opt== 1 then T_exit=Timer.GetTime();
        elseif opt== 2 then options=true opt=4
        elseif opt== 3 then Engine.Exit()
        elseif opt== 4 then options=false opt=2 Sound.SetVolume(1)
        else                options=false opt=2 Sound.SetVolume (0)end
    end;
else
    if Timer.GetTime()<T_exit+1 then
    trans2=T_exit+1-Timer.GetTime();
    SpriteBatch.Draw.Pos( menu, 0, 0, 1, 1, 1, trans2, 0, 0 );
    else
    mode="game"
    State.SetStateFile("Loop2");
    end
end
