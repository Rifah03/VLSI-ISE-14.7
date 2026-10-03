LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY NOT_gate_tb IS
END NOT_gate_tb;

ARCHITECTURE behavior OF NOT_gate_tb IS

    -- Component Declaration for the Unit Under Test (UUT)

    COMPONENT NOT_gate
    PORT(
         A : IN std_logic;
         Y : OUT std_logic
        );
    END COMPONENT;

    -- Input
    signal A : std_logic := '0';

    -- Output
    signal Y : std_logic;

BEGIN
    -- Instantiate the Unit Under Test (UUT)
    uut: NOT_gate PORT MAP (
          A => A,
          Y => Y
        );

    -- Stimulus process
    stim_proc: process
    begin

        -- Case 1: A=0 -> Y=1
        A <= '0';
        wait for 100 ns;

        -- Case 2: A=1 -> Y=0
        A <= '1';
        wait for 100 ns;

        wait;
    end process;

END behavior;