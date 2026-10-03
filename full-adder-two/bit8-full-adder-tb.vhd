LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit8_full_adder_tb IS
END bit8_full_adder_tb;

ARCHITECTURE behavior OF bit8_full_adder_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT bit8_full_adder
    PORT(
         A    : IN  std_logic_vector(7 downto 0);
         B    : IN  std_logic_vector(7 downto 0);
         Cin  : IN  std_logic;
         Sum  : OUT std_logic_vector(7 downto 0);
         Cout : OUT std_logic
        );
    END COMPONENT;
	     -- Inputs
    signal A   : std_logic_vector(7 downto 0) := (others => '0');
    signal B   : std_logic_vector(7 downto 0) := (others => '0');
    signal Cin : std_logic := '0';

    -- Outputs
    signal Sum  : std_logic_vector(7 downto 0);
    signal Cout : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: bit8_full_adder PORT MAP (
          A    => A,
          B    => B,
          Cin  => Cin,
          Sum  => Sum,
          Cout => Cout
        );
		  
    -- Stimulus process
    stim_proc: process
    begin

        -- Case 1: 0 + 0 + 0 = 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        wait for 100 ns;

        -- Case 2: 1 + 1 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Case 3: 5 + 3 = 8
        A <= "00000101";
        B <= "00000011";
        Cin <= '0';
        wait for 100 ns;
        -- Case 4: 15 + 1 = 16
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Case 5: 100 + 50 = 150
        A <= "01100100";
        B <= "00110010";
        Cin <= '0';
        wait for 100 ns;

        -- Case 6: 255 + 1 = 256
        A <= "11111111";
        B <= "00000001";
        Cin <= '0';
        wait for 100 ns;

        -- Case 7: 255 + 255 + 1 = 511
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        wait for 100 ns;

        wait;
    end process;

END behavior;