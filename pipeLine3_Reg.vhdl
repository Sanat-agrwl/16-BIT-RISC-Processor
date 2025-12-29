library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipeline3 is port(
  data31_9 : in std_logic_vector(22 downto 0);
  data8_0 : in std_logic_vector(8 downto 0);
  data47_32 : in std_logic_vector(15 downto 0);
  data63_48 : in std_logic_vector(15 downto 0);
  wr : in std_logic;
  data_out : out std_logic_vector(63 downto 0);
  clk : in std_logic
);
            end entity;

architecture Struct of pipeline3 is 
        signal data : std_logic_vector(63 downto 0) := (others=>'0');
        begin
          process(data31_9,data8_0,data47_32,data63_48,clk,wr)
          begin
            
            if(rising_edge(clk) and wr = '1') then
              data(31 downto 9) <= data31_9;
              data(8 downto 0) <= data8_0;
              data(47 downto 32) <= data47_32;
              data(63 downto 48)<= data63_48;

            end if;
          end process;
          
          process(data)
          begin

            data_out <= data;
          end process;
        end architecture;