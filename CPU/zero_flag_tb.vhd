LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY zero_flag_tb IS
END zero_flag_tb;

ARCHITECTURE behavior OF zero_flag_tb IS

    COMPONENT zero_flag
    PORT(
        ACC  : IN  std_logic_vector(7 downto 0);
        ZERO : OUT std_logic
    );
    END COMPONENT;

    SIGNAL ACC  : std_logic_vector(7 downto 0) := (others => '0');
    SIGNAL ZERO : std_logic;

BEGIN

    -- Instantiate the Unit Under Test (UUT)
    uut: zero_flag PORT MAP (
        ACC  => ACC,
        ZERO => ZERO
    );
    -- Stimulus process
    stim_proc: PROCESS
    BEGIN

        -- Test 1: Accumulator is zero
        ACC <= "00000000";
        WAIT FOR 100 ns;

        -- Test 2: Accumulator is not zero
        ACC <= "00000001";
        WAIT FOR 100 ns;

        -- Test 3: Accumulator is zero again
        ACC <= "00000000";
        WAIT FOR 100 ns;
		          -- Test 4: Accumulator has a value of 5
        ACC <= "00000101";
        WAIT FOR 100 ns;

        -- Test 5: Accumulator has the maximum 8-bit value
        ACC <= "11111111";
        WAIT FOR 100 ns;

        -- Test 6: Accumulator is zero again
        ACC <= "00000000";
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;
END behavior;