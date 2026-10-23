LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY cpu_top_tb IS
END cpu_top_tb;

ARCHITECTURE behavior OF cpu_top_tb IS

    COMPONENT cpu_top
    PORT(
        CLK             : IN  std_logic;
        RESET           : IN  std_logic;
        ACC_OUT         : OUT std_logic_vector(7 downto 0);
        PC_OUT          : OUT std_logic_vector(3 downto 0);
        ZERO_OUT        : OUT std_logic;
        INSTRUCTION_OUT : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;
	 -- Inputs
    SIGNAL CLK   : std_logic := '0';
    SIGNAL RESET : std_logic := '0';

    -- Outputs
    SIGNAL ACC_OUT         : std_logic_vector(7 downto 0);
    SIGNAL PC_OUT          : std_logic_vector(3 downto 0);
    SIGNAL ZERO_OUT        : std_logic;
    SIGNAL INSTRUCTION_OUT : std_logic_vector(7 downto 0);

    -- Clock period
    CONSTANT CLK_period : time := 10 ns;
BEGIN

    -- Instantiate the CPU
    uut: cpu_top PORT MAP (
        CLK             => CLK,
        RESET           => RESET,
        ACC_OUT         => ACC_OUT,
        PC_OUT          => PC_OUT,
        ZERO_OUT        => ZERO_OUT,
        INSTRUCTION_OUT => INSTRUCTION_OUT
    );
-- Clock generation
    CLK_process: PROCESS
    BEGIN
        CLK <= '0';
        WAIT FOR CLK_period / 2;
        CLK <= '1';
        WAIT FOR CLK_period / 2;
    END PROCESS;

    -- Test CPU
    stim_proc: PROCESS
    BEGIN
        -- Apply reset
        RESET <= '1';
        WAIT FOR 20 ns;
		  -- Release reset and run the CPU
        RESET <= '0';
        WAIT FOR 500 ns;

        -- Reset the CPU again
        RESET <= '1';
        WAIT FOR 20 ns;

        -- Release reset and run again
        RESET <= '0';
        WAIT FOR 200 ns;

        WAIT;
    END PROCESS;

END behavior;