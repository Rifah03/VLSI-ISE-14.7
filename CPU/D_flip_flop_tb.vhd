LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY D_flip_flop_tb IS
END D_flip_flop_tb;

ARCHITECTURE behavior OF D_flip_flop_tb IS

    COMPONENT D_flip_flop
    PORT(
        D     : IN  std_logic;
        CLK   : IN  std_logic;
        RESET : IN  std_logic;
        Q     : OUT std_logic
    );
    END COMPONENT;

    SIGNAL D     : std_logic := '0';
    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
    SIGNAL Q     : std_logic;

    CONSTANT CLK_period : time := 10 ns;
	 BEGIN

    uut: D_flip_flop PORT MAP (
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
        D <= '0';
        WAIT FOR 20 ns;

        -- Test 2: Release reset and store 1
        RESET <= '0';
        D <= '1';
        WAIT FOR 20 ns;

        -- Test 3: Store 0
        D <= '0';
        WAIT FOR 20 ns;

        -- Test 4: Store 1 again
        D <= '1';
        WAIT FOR 20 ns;

        -- Test 5: Activate reset again
        RESET <= '1';
        WAIT FOR 20 ns;
		          -- Test 6: Release reset and store 0
        RESET <= '0';
        D <= '0';
        WAIT FOR 20 ns;

        WAIT;
    END PROCESS;

END behavior;