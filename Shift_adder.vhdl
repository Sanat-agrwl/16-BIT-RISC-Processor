library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Shift_adder is port(
  a : in std_logic_vector(15 downto 0);
  b : in std_logic_vector(15 downto 0);
  alu3out : out std_logic_vector(15 downto 0)
);
end entity;

architecture behave3 of Shift_adder is
  begin
  
  process(a,b)
  variable temp : std_logic_vector(15 downto 0);
    begin
		temp(15 downto 1) := b(14 downto 0);
			temp(0) := '0';	
      alu3out <= (a + temp);
  end process;
end architecture;