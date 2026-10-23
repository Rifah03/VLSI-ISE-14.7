LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY xnor_gate_tb IS
END xnor_gate_tb;

ARCHITECTURE behavior OF xnor_gate_tb IS

    COMPONENT xnor_gate
    PORT(
        A : IN  std_logic;
        B : IN  std_logic;
        Y : OUT std_logic
    );
    END COMPONENT;

    SIGNAL A : std_logic := '0';
    SIGNAL B : std_logic := '0';
    SIGNAL Y : std_logic;

BEGIN

    uut: xnor_gate PORT MAP (
        A => A,
        B => B,
        Y => Y
    );
    stim_proc: PROCESS
    BEGIN

        A <= '0';
        B <= '0';
        WAIT FOR 100 ns;

        A <= '0';
        B <= '1';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '0';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '1';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;