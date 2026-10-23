LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY half_adder_tb IS
END half_adder_tb;

ARCHITECTURE behavior OF half_adder_tb IS

    COMPONENT half_adder
    PORT(
        A     : IN  std_logic;
        B     : IN  std_logic;
        Sum   : OUT std_logic;
        Carry : OUT std_logic
    );
    END COMPONENT;

    SIGNAL A     : std_logic := '0';
    SIGNAL B     : std_logic := '0';
    SIGNAL Sum   : std_logic;
    SIGNAL Carry : std_logic;
BEGIN

    uut: half_adder PORT MAP (
        A     => A,
        B     => B,
        Sum   => Sum,
        Carry => Carry
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