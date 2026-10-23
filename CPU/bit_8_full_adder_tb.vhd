LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY bit_8_full_adder_tb IS
END bit_8_full_adder_tb;

ARCHITECTURE behavior OF bit_8_full_adder_tb IS

    COMPONENT bit_8_full_adder
    PORT(
        A    : IN  std_logic_vector(7 downto 0);
        B    : IN  std_logic_vector(7 downto 0);
        Cin  : IN  std_logic;
        Sum  : OUT std_logic_vector(7 downto 0);
        Cout : OUT std_logic
    );
    END COMPONENT;
	     SIGNAL A    : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL B    : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL Cin  : std_logic := '0';
    SIGNAL Sum  : std_logic_vector(7 downto 0);
    SIGNAL Cout : std_logic;

BEGIN

    uut: bit_8_full_adder PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        Sum  => Sum,
        Cout => Cout
    );
	     stim_proc: PROCESS
    BEGIN

        -- Test 1: 0 + 0
        A <= "00000000";
        B <= "00000000";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 2: 1 + 1 = 2
        A <= "00000001";
        B <= "00000001";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 3: 5 + 3 = 8
        A <= "00000101";
		          B <= "00000011";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 4: 15 + 1 = 16
        A <= "00001111";
        B <= "00000001";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 5: 100 + 50 = 150
        A <= "01100100";
        B <= "00110010";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 6: 255 + 1 = 256 (carry out)
        A <= "11111111";
		          B <= "00000001";
        Cin <= '0';
        WAIT FOR 100 ns;

        -- Test 7: 255 + 255 + 1 = 511
        A <= "11111111";
        B <= "11111111";
        Cin <= '1';
        WAIT FOR 100 ns;

        -- Test 8: Carry-in test, 10 + 20 + 1 = 31
        A <= "00001010";
        B <= "00010100";
        Cin <= '1';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;