library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder is
    Port (
        A    : in  STD_LOGIC;
        B    : in  STD_LOGIC;
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC;
        Cout : out STD_LOGIC
    );
end full_adder;

architecture Structural of full_adder is

    component half_adder
        Port (
            A     : in  STD_LOGIC;
            B     : in  STD_LOGIC;
            Sum   : out STD_LOGIC;
            Carry : out STD_LOGIC
				        );
    end component;

    component OR_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal S1 : STD_LOGIC;
    signal C1 : STD_LOGIC;
    signal C2 : STD_LOGIC;

begin

    -- First Half Adder
    HA1: half_adder
	         port map (
            A     => A,
            B     => B,
            Sum   => S1,
            Carry => C1
        );

    -- Second Half Adder
    HA2: half_adder
        port map (
            A     => S1,
            B     => Cin,
            Sum   => Sum,
            Carry => C2
        );

    -- OR gate for final Carry
    OR1: OR_gate
        port map (
            A => C1,
            B => C2,
            Y => Cout
        );

end Structural;