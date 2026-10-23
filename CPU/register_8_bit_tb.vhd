LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY register_8_bit_tb IS
END register_8_bit_tb;

ARCHITECTURE behavior OF register_8_bit_tb IS

    COMPONENT register_8_bit
    PORT(
        D     : IN  std_logic_vector(7 downto 0);
        CLK   : IN  std_logic;
        RESET : IN  std_logic;
        Q     : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;

    SIGNAL D     : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
    SIGNAL Q     : std_logic_vector(7 downto 0);

    CONSTANT CLK_period : time := 10 ns;

BEGIN

    uut: register_8_bit PORT MAP (
        D     => D,
        CLK   => CLK,
        RESET => RESET,
        Q     => Q
    );

    -- Clock generation
    CLK_process: PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period / 2;
        CLK <= '1';
        WAIT FOR CLK_period / 2;
    END PROCESS;
    -- Test stimulus
    stim_proc: PROCESS
    BEGIN

        -- Test 1: Activate reset
        RESET <= '1';
        D <= "00000000";
        WAIT FOR 20 ns;

        -- Test 2: Release reset and store 10110010
        RESET <= '0';
        D <= "10110010";
        WAIT FOR 20 ns;

        -- Test 3: Store 11111111
        D <= "11111111";
        WAIT FOR 20 ns;

        -- Test 4: Store 00001111
        D <= "00001111";
        WAIT FOR 20 ns;
		          -- Test 5: Store 01010101
        D <= "01010101";
        WAIT FOR 20 ns;

        -- Test 6: Activate reset again
        RESET <= '1';
        D <= "11110000";
        WAIT FOR 20 ns;

        -- Test 7: Release reset and store 11001100
        RESET <= '0';
        D <= "11001100";
        WAIT FOR 20 ns;

        WAIT;
    END PROCESS;

END behavior;