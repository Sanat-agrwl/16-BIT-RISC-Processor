library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

entity pipeline1 is 
  port(
    pc_in : in std_logic_vector(15 downto 0);
    mem_io : in std_logic_vector(15 downto 0);
    wr : in std_logic;
    data_out : out std_logic_vector(31 downto 0);
    clk : in std_logic
  );
end entity;

architecture Struct of pipeline1 is
  signal data : std_logic_vector(31 downto 0) := (others=>'0');
  begin
    process(pc_in,mem_io,clk,wr)
    begin  
      if(rising_edge(clk) and wr = '1') then
        data(31 downto 16 ) <= pc_in;
        data(15 downto 0) <= mem_io;
        end if;
    end process;
      data_out <= data;     
  end architecture;
