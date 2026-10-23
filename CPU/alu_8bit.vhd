library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity alu_8bit is
    Port (
        A      : in  STD_LOGIC_VECTOR(7 downto 0);
        B      : in  STD_LOGIC_VECTOR(7 downto 0);
        SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
        RESULT : out STD_LOGIC_VECTOR(7 downto 0);
        COUT   : out STD_LOGIC
    );
end alu_8bit;

architecture Structural of alu_8bit is

    component bit_8_full_adder
        Port (
            A    : in  STD_LOGIC_VECTOR(7 downto 0);
				            B    : in  STD_LOGIC_VECTOR(7 downto 0);
            Cin  : in  STD_LOGIC;
            Sum  : out STD_LOGIC_VECTOR(7 downto 0);
            Cout : out STD_LOGIC
        );
    end component;

    component not_gate
        Port (
            A : in  STD_LOGIC;
            Y : out STD_LOGIC
        );
    end component;

    signal ADD_RESULT : STD_LOGIC_VECTOR(7 downto 0);
	     signal NAND_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal NOT_RESULT : STD_LOGIC_VECTOR(7 downto 0);
    signal CARRY_OUT : STD_LOGIC;

begin

    -- 8-bit addition
    ADDER: bit_8_full_adder
        port map (
            A    => A,
            B    => B,
            Cin  => '0',
            Sum  => ADD_RESULT,
            Cout => CARRY_OUT
        );
		      -- 8-bit NAND operation
    NAND_RESULT <= A NAND B;

    -- 8-bit NOT operation using the NAND-based NOT gate
    NOT0: not_gate port map (A => A(0), Y => NOT_RESULT(0));
    NOT1: not_gate port map (A => A(1), Y => NOT_RESULT(1));
    NOT2: not_gate port map (A => A(2), Y => NOT_RESULT(2));
	 NOT3: not_gate port map (A => A(3), Y => NOT_RESULT(3));
    NOT4: not_gate port map (A => A(4), Y => NOT_RESULT(4));
    NOT5: not_gate port map (A => A(5), Y => NOT_RESULT(5));
    NOT6: not_gate port map (A => A(6), Y => NOT_RESULT(6));
    NOT7: not_gate port map (A => A(7), Y => NOT_RESULT(7));
	     -- Selection logic
    process (SEL, ADD_RESULT, NAND_RESULT, NOT_RESULT, CARRY_OUT)
    begin
        case SEL is
            when "00" =>
                RESULT <= ADD_RESULT;
                COUT <= CARRY_OUT;

            when "01" =>
                RESULT <= NAND_RESULT;
                COUT <= '0';
					             when "10" =>
                RESULT <= NOT_RESULT;
                COUT <= '0';

            when others =>
                RESULT <= (others => '0');
                COUT <= '0';
        end case;
    end process;

end Structural;