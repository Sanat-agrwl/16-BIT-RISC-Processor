library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_signed.all;
use IEEE.numeric_std.all;


entity alu1 is port(
    czcontrol : in std_logic_vector(1 downto 0);
    cpl : in std_logic;
    czin : in std_logic_vector(1 downto 0);
    opcode : in std_logic_vector(3 downto 0);
    a,b : in std_logic_vector(15 downto 0);
    aluout : out std_logic_vector(15 downto 0);
    czout : out std_logic_vector(1 downto 0)
);
end entity;

architecture behave of alu1 is
  begin
    process(a,b,opcode,czcontrol,cpl,czin)
	 variable shift : std_logic_vector(15 downto 0);
	 variable temp : std_logic_vector(16 downto 0);
      begin 
      czout <= czin ;
      if(opcode = "0001" and cpl = '0' and (czcontrol = "00" or czcontrol = "10" or czcontrol = "01"))then
        temp := ('0' & a) + ('0'& b) ;
        aluout <= temp(15 downto 0);
        czout(1) <= temp(16);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      
      elsif(opcode = "0001" and cpl = '0' and czcontrol = "11")then
        temp := ('0' & a) + ('0'& b) + ("000000000000000" & czin(1));
        aluout <= temp(15 downto 0);
        czout(1) <= temp(16);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      elsif(opcode = "0001" and cpl = '1' and (czcontrol = "00" or czcontrol = "10" or czcontrol = "01"))then
        temp := ('0' & a) + ('0'& not b) ;
        aluout <= temp(15 downto 0);
        czout(1) <= temp(16);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      
      elsif(opcode = "0001" and cpl = '1' and czcontrol = "11")then
        temp := ('0' & a) + ('0'& not b) + ("000000000000000" & czin(1));
        aluout <= temp(15 downto 0);
        czout(1) <= temp(16);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      elsif(opcode = "0000")then
        temp := ('0' & a) + ('0'& b) ;
        aluout <= temp(15 downto 0);
        czout(1) <= temp(16);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      elsif(opcode = "0010" and cpl = '0'  and (czcontrol = "00" or czcontrol = "10" or czcontrol = "01"))then
        temp := not(('0' & a) and ('0'&  b)) ;
        aluout <= temp(15 downto 0);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
      
      elsif(opcode = "0010" and cpl = '1' and (czcontrol = "00" or czcontrol = "10" or czcontrol = "01"))then
        temp := not(('0' & a) and ('0'&  not b)) ;
        aluout <= temp(15 downto 0);
        if (temp = "00000000000000000") then
          czout(0) <= '1';
        end if;
		elsif(opcode = "0110" or opcode = "0111") then -- lm sm 
			temp := ('0' & a) and ('0' & b);
			aluout <= temp(15 downto 0);
		elsif(opcode = "1111") then
			shift(15 downto 1) := b(14 downto 0);
			shift(0) := '0';	
			temp := ('0' & a) and ('0' & shift);
			aluout <= temp(15 downto 0);
      end if;
      end process;
  end architecture;