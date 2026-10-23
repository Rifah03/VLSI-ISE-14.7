LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY full_adder_tb IS
END full_adder_tb;

ARCHITECTURE behavior OF full_adder_tb IS

    COMPONENT full_adder
    PORT(
        A    : IN  std_logic;
        B    : IN  std_logic;
        Cin  : IN  std_logic;
        Sum  : OUT std_logic;
        Cout : OUT std_logic
    );
    END COMPONENT;
    SIGNAL A    : std_logic := '0';
    SIGNAL B    : std_logic := '0';
    SIGNAL Cin  : std_logic := '0';
    SIGNAL Sum  : std_logic;
    SIGNAL Cout : std_logic;

BEGIN

    uut: full_adder PORT MAP (
        A    => A,
        B    => B,
        Cin  => Cin,
        Sum  => Sum,
        Cout => Cout
    );

    stim_proc: PROCESS
    BEGIN
        A <= '0';
        B <= '0';
        Cin <= '0';
        WAIT FOR 100 ns;

        A <= '0';
        B <= '0';
        Cin <= '1';
        WAIT FOR 100 ns;

        A <= '0';
        B <= '1';
        Cin <= '0';
        WAIT FOR 100 ns;

        A <= '0';
        B <= '1';
        Cin <= '1';
        WAIT FOR 100 ns;
        A <= '1';
        B <= '0';
        Cin <= '0';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '0';
        Cin <= '1';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '1';
        Cin <= '0';
        WAIT FOR 100 ns;

        A <= '1';
        B <= '1';
        Cin <= '1';
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;