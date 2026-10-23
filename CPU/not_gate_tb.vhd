LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY not_gate_tb IS
END not_gate_tb;

ARCHITECTURE behavior OF not_gate_tb IS

    COMPONENT not_gate
    PORT(
        A : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL Y : std_logic;

BEGIN

    uut: not_gate PORT MAP (
        A => A,
        Y => Y
    );
	     stim_proc: PROCESS
    BEGIN

        A <= '0';
        WAIT FOR 100 ns;

        A <= '1';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;