library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top is
  generic (
    NUM_BITS : integer := 3
  );
  port (
    input  : in  STD_LOGIC_VECTOR(NUM_BITS-1 downto 0);
    enable : in  STD_LOGIC;
    output : out STD_LOGIC_VECTOR((2**NUM_BITS)-1 downto 0)
  );
end entity;

architecture concurrent_arch of top is
begin
  gen_decoder: for i in 0 to (2**NUM_BITS)-1 generate
    output(i) <= '1' when (enable = '1' and to_integer(unsigned(input)) = i)
                 else '0';
  end generate;
end architecture;
