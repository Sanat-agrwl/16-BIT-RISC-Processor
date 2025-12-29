library std;
use std.standard.all;
library ieee;
use ieee.std_logic_1164.all; 
library ieee;
use ieee.numeric_std.all;
 
 
entity one_bit_shift is 
	 port(
		  inp_bit_shifter : in std_logic_vector(8 downto 0);
		  out_bit_shifter : out std_logic_vector(8 downto 0)
	 );
end entity;

architecture Struct of one_bit_shift is
	signal bits_8_shifted : std_logic_vector(8 downto 0);

	begin
	process(inp_bit_shifter)
		begin
			bits_8_shifted(8 downto 1) <= inp_bit_shifter(7 downto 0); 
			bits_8_shifted(0) <='0';
		end process;
		process(bits_8_shifted)
		begin
			out_bit_shifter <= bits_8_shifted;
		end process;
end Struct;