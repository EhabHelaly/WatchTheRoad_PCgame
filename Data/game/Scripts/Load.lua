--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
-- "Main.lua" file is file which loads all files and prepare
-- all things for your game
--=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=

-- This functions genereates small documentation with all functions
-- you can use in scripts (located in: "Data" folder)
Script.SaveCmds();

-- You can also execute script from diffrent file
-- Second argument should be set to TRUE if script is in loop
-- Exec("OtherScript.lua", false);

-- First we set two global variables for our example
Window.SetScreenSize(800,700);
trans=0
T_exit=nil;

--game textures
road  = Texture.Manager.Load( "Sample/road1.png" );
logo  = Texture.Manager.Load( "Sample/logo.png" );
menu  = Texture.Manager.Load( "Sample/menu.png" );
coin  = Texture.Manager.Load( "Sample/coin.png" );
font  = Texture.Manager.Load( "Sample/font.png" );
expl  = Texture.Manager.Load( "Sample/expl.png" );
--cars
car1  = Texture.Manager.Load( "Sample/car1.png" );
car2  = Texture.Manager.Load( "Sample/car2.png" );
car3  = Texture.Manager.Load( "Sample/car3.png" );
car4  = Texture.Manager.Load( "Sample/car4.png" );
car5  = Texture.Manager.Load( "Sample/car5.png" );
car6  = Texture.Manager.Load( "Sample/car6.png" );
car7  = Texture.Manager.Load( "Sample/car7.png" );
car8  = Texture.Manager.Load( "Sample/car8.png" );
car9  = Texture.Manager.Load( "Sample/car9.png" );
car10 = Texture.Manager.Load( "Sample/car10.png" );
car11 = Texture.Manager.Load( "Sample/car11.png" );
car12 = Texture.Manager.Load( "Sample/car12.png" );
car13 = Texture.Manager.Load( "Sample/car13.png" );
car14 = Texture.Manager.Load( "Sample/car14.png" );
car15 = Texture.Manager.Load( "Sample/car15.png" );
car16 = Texture.Manager.Load( "Sample/car16.png" );
car17 = Texture.Manager.Load( "Sample/car17.png" );
cars  ={car1,car2,car3,car4,car5,car6,car7,car8,car9,car10,car11,car12,car13,car14,car15,car16,car17}



State.SetStateFile("start");
