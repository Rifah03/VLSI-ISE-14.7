LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY program_counter_4_bit_tb IS
END program_counter_4_bit_tb;

ARCHITECTURE behavior OF program_counter_4_bit_tb IS

    COMPONENT program_counter_4_bit
    PORT(
        CLK   : IN  std_logic;
        RESET : IN  std_logic;
        PC    : OUT std_logic_vector(3 downto 0)
    );
    END COMPONENT;

    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';
	     SIGNAL PC    : std_logic_vector(3 downto 0);

    CONSTANT CLK_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: program_counter_4_bit PORT MAP (
        CLK   => CLK,
        RESET => RESET,
        PC    => PC
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
        WAIT FOR 20 ns;

        -- Test 2: Release reset and start counting
        RESET <= '0';
        WAIT FOR 100 ns;

        -- Test 3: Reset the counter again
        RESET <= '1';
        WAIT FOR 20 ns;

        -- Test 4: Release reset and count again
        RESET <= '0';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;