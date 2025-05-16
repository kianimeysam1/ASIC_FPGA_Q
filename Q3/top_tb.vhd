library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity top_tb is
end top_tb;

architecture test of top_tb is

  -- Constants
  constant NUM_BITS : integer := 3;
  constant OUT_WIDTH : integer := 2**NUM_BITS;

  -- DUT signals
  signal input  : STD_LOGIC_VECTOR(NUM_BITS-1 downto 0);
  signal enable : STD_LOGIC;
  signal output : STD_LOGIC_VECTOR(OUT_WIDTH-1 downto 0);

  -- Component declaration
  component top
    generic (
      NUM_BITS : integer := 3
    );
    port (
      input  : in  STD_LOGIC_VECTOR(NUM_BITS-1 downto 0);
      enable : in  STD_LOGIC;
      output : out STD_LOGIC_VECTOR((2**NUM_BITS)-1 downto 0)
    );
  end component;

begin

  -- Instantiate the Unit Under Test (UUT)
  uut: top
    generic map (
      NUM_BITS => NUM_BITS
    )
    port map (
      input  => input,
      enable => enable,
      output => output
    );

  -- Stimulus process
  stim_proc: process
  begin
    -- Test with enable = '0'
    enable <= '0';
    for i in 0 to 2**NUM_BITS - 1 loop
      input <= std_logic_vector(to_unsigned(i, NUM_BITS));
      wait for 10 ns;
    end loop;

    -- Test with enable = '1'
    enable <= '1';
    for i in 0 to 2**NUM_BITS - 1 loop
      input <= std_logic_vector(to_unsigned(i, NUM_BITS));
      wait for 10 ns;
    end loop;

    -- Done
    wait;
  end process;

end test;
