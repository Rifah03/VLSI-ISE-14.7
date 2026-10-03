library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AND_gate is
    Port (
        A : in  STD_LOGIC;
        B : in  STD_LOGIC;
        Y : out STD_LOGIC
    );
end AND_gate;

architecture Structural of AND_gate is

    component NAND_gate
        Port (
            A : in  STD_LOGIC;
            B : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
		  end component;

    signal N1 : STD_LOGIC;

begin

    -- First NAND gate
    NAND1: NAND_gate
        port map (
            A => A,
            B => B,
            Y => N1
        );

    -- Second NAND gate used as NOT
    NAND2: NAND_gate
        port map (
            A => N1,
            B => N1,
            Y => Y
        );

end Structural;