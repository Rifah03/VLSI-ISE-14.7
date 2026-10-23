library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity bit_8_full_adder is
    Port (
        A    : in  STD_LOGIC_VECTOR(7 downto 0);
        B    : in  STD_LOGIC_VECTOR(7 downto 0);
        Cin  : in  STD_LOGIC;
        Sum  : out STD_LOGIC_VECTOR(7 downto 0);
        Cout : out STD_LOGIC
    );
end bit_8_full_adder;

architecture Structural of bit_8_full_adder is
    component full_adder
        Port (
            A    : in  STD_LOGIC;
            B    : in  STD_LOGIC;
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC;
            Cout : out STD_LOGIC
        );
    end component;

    signal C : STD_LOGIC_VECTOR(8 downto 0);

begin
    C(0) <= Cin;

    FA0: full_adder port map (A(0), B(0), C(0), Sum(0), C(1));
    FA1: full_adder port map (A(1), B(1), C(1), Sum(1), C(2));
    FA2: full_adder port map (A(2), B(2), C(2), Sum(2), C(3));
    FA3: full_adder port map (A(3), B(3), C(3), Sum(3), C(4));
    FA4: full_adder port map (A(4), B(4), C(4), Sum(4), C(5));
	 FA5: full_adder port map (A(5), B(5), C(5), Sum(5), C(6));
    FA6: full_adder port map (A(6), B(6), C(6), Sum(6), C(7));
    FA7: full_adder port map (A(7), B(7), C(7), Sum(7), C(8));

    Cout <= C(8);

end Structural;