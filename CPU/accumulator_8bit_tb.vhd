LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY accumulator_8bit_tb IS
END accumulator_8bit_tb;

ARCHITECTURE behavior OF accumulator_8bit_tb IS

    COMPONENT accumulator_8bit
    PORT(
        CLK     : IN  std_logic;
        RESET   : IN  std_logic;
        DATA_IN : IN  std_logic_vector(7 downto 0);
        LOAD    : IN  std_logic;
        ACC_OUT : OUT std_logic_vector(7 downto 0)
    );
    END COMPONENT;
	 SIGNAL CLK     : std_logic := '0';
    SIGNAL RESET   : std_logic := '0';
    SIGNAL DATA_IN : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL LOAD    : std_logic := '0';
    SIGNAL ACC_OUT : std_logic_vector(7 downto 0);

    CONSTANT CLK_period : time := 10 ns;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: accumulator_8bit PORT MAP (
        CLK     => CLK,
        RESET   => RESET,
        DATA_IN => DATA_IN,
        LOAD    => LOAD,
        ACC_OUT => ACC_OUT
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

        -- Test 1: Reset accumulator
        RESET <= '1';
        LOAD <= '0';
        DATA_IN <= "00000000";
        WAIT FOR 20 ns;

        -- Test 2: Load 10
        RESET <= '0';
        LOAD <= '1';
        DATA_IN <= "00001010";
        WAIT FOR 20 ns;
        -- Test 3: Load 25
        DATA_IN <= "00011001";
        WAIT FOR 20 ns;

        -- Test 4: Load 100
        DATA_IN <= "01100100";
        WAIT FOR 20 ns;

        -- Test 5: Hold the current value
        LOAD <= '0';
        DATA_IN <= "11111111";
        WAIT FOR 20 ns;

        -- Test 6: Load 255
        LOAD <= '1';
        DATA_IN <= "11111111";
		   WAIT FOR 20 ns;

        -- Test 7: Reset accumulator again
        RESET <= '1';
        LOAD <= '0';
        WAIT FOR 20 ns;

        -- Test 8: Release reset and load 5
        RESET <= '0';
        LOAD <= '1';
        DATA_IN <= "00000101";
        WAIT FOR 20 ns;

        WAIT;
    END PROCESS;

END behavior;