library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all;


entity one_sub is 
	port(
		 lm_on   : in std_logic; 
		 inp_sub : in std_logic_vector(2 downto 0);
		 out_sub : out std_logic_vector(2 downto 0)
		 );
end entity;

architecture Struct of one_sub is
	signal temp: std_logic_vector(2 downto 0);
	begin
	process(inp_sub,lm_on) 
		begin
			if lm_on = '1' then
			   temp <= std_logic_vector(signed(inp_sub) - 1);
			else
				temp <= inp_sub;
			end if;
	end process;
	out_sub<= temp;
end Struct;