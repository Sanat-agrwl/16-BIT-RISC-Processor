library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all; 

entity zero_ext9 is 
  port (in9 : in std_logic_vector(8 downto 0);   
        out9  : out std_logic_vector(15 downto 0));  
end entity;

architecture ZE9 of zero_ext9 is
	begin
	process(in9)
		begin
			out9(8 downto 0) <= in9;
			out9(15 downto 9) <= (others => '0');
		end process;
	end ZE9;