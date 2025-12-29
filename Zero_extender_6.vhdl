library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all; 


entity zero_ext6 is 
  port (in6 : in std_logic_vector(5 downto 0);   
        out6  : out std_logic_vector(15 downto 0));  
end entity;

architecture ZE6 of zero_ext6 is
	begin
	process(in6)
		begin
			out6(5 downto 0) <= in6;
			out6(15 downto 6) <= (others => '0');
		end process;
	end ZE6;



