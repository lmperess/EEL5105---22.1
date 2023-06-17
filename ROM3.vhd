library ieee;
use ieee.std_logic_1164.all;

entity ROM3 is port (

    address : in  std_logic_vector(3 downto 0);
    data    : out std_logic_vector(79 downto 0));
    
end ROM3;

architecture Rom_Arch of ROM3 is

type memory is array (00 to 15) of std_logic_vector(79 downto 0);
constant my_Rom : memory := (

	00 => x"30486090C00C12060903", -- BIN- L: 11000000 10010000 01100000 01001000 00110000  R: 00000011 00001001 00000110 00010010 00001100
	01 => x"10080604021512090603", -- BCD- L: 02 04 06 08 10  R: 03 06 09 12 15	
   02 => x"090C1218249030481824", -- BIN  L: 00100100 00011000 00010010 00001100 00001001  R: 00100100 00011000 01001000 00110000 10010000
	03 => x"20181614123027242118", -- BCD- L: 12 14 16 18 20  R: 18 21 24 27 30
	04 => x"420309128442C0904121", -- BIN- L: 10000100 00010010 00001001 00000011 01000010  R: 00100001 01001000 10010000 11000000 01000010
	05 => x"30282624224542393633", -- BCD- L: 22 24 26 28 30  R: 33 36 39 42 45
	06 => x"21C08209828403419041", -- BIN- L: 10000010 00001001 10000010 11000000 00100001  R: 01000001 10010000 01000001 00000011 10000100
	07 => x"40383634326057545148", -- BCD- L: 32 34 36 38 40  R: 48 51 54 57 60
	08 => x"88604184901106822109", -- BIN- L: 10010000 10000100 01000001 01100000 10001000  R: 00001001 00100001 10000010 00000110 00010001
	09 => x"50484644427572696663", -- BCD- L: 42 44 46 48 50  R: 63 66 69 72 75
   10 => x"30486090C00C12060903", -- BIN- L: 11000000 10010000 01100000 01001000 00110000  R: 00000011 00001001 00000110 00010010 00001100
	11 => x"60585654529087848178", -- BCD- L: 52 54 56 58 60  R: 78 81 84 87 9
	12 => x"090C1218249030481824", -- BIN- L: 00100100 00011000 00010010 00001100 00001001  R: 00100100 00011000 01001000 00110000 10010000 
	13 => x"70686664620502999693", -- BCD- L: 62 64 66 68 70  R: 93 96 99 02 05
	14 => x"420309128442C0904121", -- BIN- L: 10000100 00010010 00001001 00000011 01000010  R: 00100001 01001000 10010000 11000000 01000010
	15 => x"80787674722017141108");-- BCD- L: 72 74 76 78 80  R: 08 11 14 17 20  
	    -- a ordem eh da direita pra esquerda: 5<-4<-3<-2<-1      5<-4<-3<-2<-1
    	 -- e de baixo pra cima, a primeira rodada eh a linha 15, depois a 14, etc. 
	 
	
begin
   process (address)
   begin
       case address is
       when "0000" => data <= my_rom(00);
       when "0001" => data <= my_rom(01);
       when "0010" => data <= my_rom(02);
       when "0011" => data <= my_rom(03);
       when "0100" => data <= my_rom(04);
       when "0101" => data <= my_rom(05);
       when "0110" => data <= my_rom(06);
       when "0111" => data <= my_rom(07);
       when "1000" => data <= my_rom(08);
       when "1001" => data <= my_rom(09);
	    when "1010" => data <= my_rom(10);
	    when "1011" => data <= my_rom(11);
       when "1100" => data <= my_rom(12);
	    when "1101" => data <= my_rom(13);
	    when "1110" => data <= my_rom(14);
	    when others => data <= my_rom(15);
     end case;
  end process;
end architecture Rom_Arch;
