library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all; 


entity sig_ext6 is 
  port (in6 : in std_logic_vector(5 downto 0);   
        out6  : out std_logic_vector(15 downto 0));  
end entity;

architecture SE6 of sig_ext6 is 
	signal temp : std_logic_vector(15 downto 0);
	begin
	process(in6)
		begin
			temp(5 downto 0) <= in6;
			report "YASHVIR---------->in6:"&integer'image(to_integer(unsigned(in6)));
			temp(15 downto 6) <= (others => in6(5));
		end process;
			out6<=temp; 
	end SE6;



