--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- This script holds your gameplay render functions
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Here we have our gameplay logic
SpriteBatch.Draw.Pos( logo, 0, 0, 0, 0, 0, 1, 0, 0 );
-- And here we are drawing our player on screen
if Timer.GetTime()<9 then
    if Timer.GetTime()>4 and Timer.GetTime()<5 then trans=(Timer.GetTime()-4) end
    if Timer.GetTime()>7 and Timer.GetTime()<8 then trans=(8-Timer.GetTime()) end
    SpriteBatch.Draw.Pos( logo, 0, 0, 1, 1, 1, trans, 0, 0 );
else
mode="menu";
State.SetStateFile("menu");
end
