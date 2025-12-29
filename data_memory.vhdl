library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all;
 
entity data_mem is 
  port (MW, CLK : in std_logic;
  		
        mem_add : in std_logic_vector(15 downto 0);   
        mem_di  : in std_logic_vector(15 downto 0);   
        mem_do  : out std_logic_vector(15 downto 0));  
end entity; 

architecture Behav of data_mem is 
	type RAM is array(0 to ((16)-1)) of std_logic_vector(15 downto 0);
	signal storage: RAM := (	

		0 => "0000000000000000",
		1 => "0000000000000001", 
		2 => "0000000000000010",   
		3 => "0000000000000011", 
		4 => "0000000000000100", 
		5 => "0101010001000001", 
		6 => "1100011001000010", 
		7 => "1000010000000100", 				
		8 => "1000010000000100", 
		10 => "0000000001010010", 
		11 => "0000000001010000", 
		others=>(others=>'1'));

	
	begin
	process(CLK, mem_add, MW, storage) 
		begin
			
			if rising_edge(CLK) and MW = '1' then
				if(to_integer(unsigned(mem_add))>15) then 
					 
					else
					
					storage(to_integer(unsigned(mem_add))) <= mem_di;
				 end if;
			end if;
			    
				 if(to_integer(unsigned(mem_add))>15) then 
					
					else
				     mem_do <= storage(to_integer(unsigned(mem_add)));
			     end if;

	end process;
end Behav;

