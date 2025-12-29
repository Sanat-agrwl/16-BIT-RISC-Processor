library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity Adder_16 is port(
  a : in std_logic_vector(15 downto 0);
  b : in std_logic_vector(15 downto 0);
  clk : in std_logic;
  alu2out : out std_logic_vector(15 downto 0)
);
 end entity;

architecture behave2 of Adder_16 is

	signal sync_c : std_logic_vector(15 downto 0) := "0000000000000000";
  begin

  process(a,b)
  variable temp : std_logic_vector(15 downto 0) := "0000000000000000";
    begin
      temp := (a) + ( b) ;

        sync_c <= temp(15 downto 0);
  end process;
  alu2out<= sync_c;
end architecture;
