--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- This script holds your gameplay render functions
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- Here we have our gameplay logic
speed = 600 * Timer.GetDelta();
rotsp =   6 * Timer.GetDelta();
SpriteBatch.Draw.Pos( bg, 0, 0, 0, 0, 0, 1, 0, 0 );
-- And here we are drawing our player on screen

if Input.Key.Down(KeyCodes.Left) == true and Input.Key.Down(KeyCodes.Up) == true  then
	if posx>50 then posx = posx - speed; if r>-0.4 then r=r-rotsp; else r=-0.4; end end
end;

if Input.Key.Down(KeyCodes.Right) == true and Input.Key.Down(KeyCodes.Up) == true  then
	if posx<750 then posx = posx + speed; if r<0.4 then r=r+rotsp; else r=0.4; end end
end;
if Input.Key.Down(KeyCodes.Left) == true and Input.Key.Down(KeyCodes.Down) == true  then
	if posx>50 then posx = posx - speed; if r<0.4 then r=r+rotsp; else r=0.4; end end
end;

if Input.Key.Down(KeyCodes.Right) == true and Input.Key.Down(KeyCodes.Down) == true  then
	if posx<750 then posx = posx + speed; if r>-0.4 then r=r-rotsp; else r=-0.4; end end
end;
if (Input.Key.Down(KeyCodes.Right) == false and Input.Key.Down(KeyCodes.Left) == false and r~=0 and Timer.NextSec) or posx<50 or posx>750 then
    if r<-0.1 then r=r+0.1; else r=0; end; if r> 0.1 then r=r-0.1; else r=0; end
end;
if Input.Key.Down(KeyCodes.Up) == true then
    if ImgY>0 then ImgY=-1400 cy=cy+1400 else ImgY = ImgY + speed; end
end;
if Input.Key.Down(KeyCodes.Down) == true then
    if ImgY<-1400 then ImgY=0 cy=cy-1400 else ImgY = ImgY - speed; end
end;
if Input.Key.DownOnce(KeyCodes.CtrlLeft) then
 if i==14 then i=1; else i=i+1; end
    c="Sample/car"..i..".png";
    car  = Texture.Manager.Load( c );
end
    SpriteBatch.Draw.Pos( road, ImgX, ImgY, 1, 1, 1, 1, 0, 0 );
    SpriteBatch.Draw.PosRot( car, posx, 500,r,50,100, 1, 1, 1, 1, 0, 0 );
    -- Here we have our player position drawed as text
    SpriteBatch.Draw.String( SpriteFont.Default, "road" .. ImgX .. "," .. ImgY, 10, 110 );
    SpriteBatch.Draw.String( SpriteFont.Default, "car" .. posx .. "," .. 440, 10, 100 );


-- Change Mod
if Input.Key.DownOnce(KeyCodes.F1) then
	LoadMod("Tutorial 01 Empty");
end;
if Input.Key.DownOnce(KeyCodes.F2) then
	LoadMod("Tutorial 02 Main and loop script");
end;
if Input.Key.DownOnce(KeyCodes.F3) then
	LoadMod("Tutorial 04 3D Sound");
end;
