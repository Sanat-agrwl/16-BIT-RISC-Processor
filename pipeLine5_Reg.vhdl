library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipeline5 is port(
  data81_0: in std_logic_vector(81 downto 0);
  data97_82: in std_logic_vector(15 downto 0);
  wr : in std_logic;
  data100_98 : in std_logic_vector(2 downto 0);
  data_out : out std_logic_vector(100 downto 0);
  clk : in std_logic
);
            end entity;
architecture Struct of pipeline5 is 
        signal data : std_logic_vector(100 downto 0) := (others=>'0');
        begin
          process(data81_0,data97_82,clk,wr, data100_98)
          begin
            
            if(rising_edge(clk) and wr = '1') then
              data(97 downto 82) <= data97_82;
              data(81 downto 0) <= data81_0;
              data(100 downto 98) <= data100_98;
            end if;
          end process;
         data_out <= data;
        
end architecture;