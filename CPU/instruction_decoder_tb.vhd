LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY instruction_decoder_tb IS
END instruction_decoder_tb;

ARCHITECTURE behavior OF instruction_decoder_tb IS

    COMPONENT instruction_decoder
    PORT(
        OPCODE  : IN  std_logic_vector(2 downto 0);
        LOAD    : OUT std_logic;
        ADD     : OUT std_logic;
        SUB     : OUT std_logic;
		  JZ      : OUT std_logic;
        SHL     : OUT std_logic;
        INVALID : OUT std_logic
    );
    END COMPONENT;

    SIGNAL OPCODE  : std_logic_vector(2 downto 0) := (others => '0');
    SIGNAL LOAD    : std_logic;
    SIGNAL ADD     : std_logic;
    SIGNAL SUB     : std_logic;
    SIGNAL JZ      : std_logic;
    SIGNAL SHL     : std_logic;
    SIGNAL INVALID : std_logic;

BEGIN
    uut: instruction_decoder PORT MAP (
        OPCODE  => OPCODE,
        LOAD    => LOAD,
        ADD     => ADD,
        SUB     => SUB,
        JZ      => JZ,
        SHL     => SHL,
        INVALID => INVALID
    );

    stim_proc: PROCESS
    BEGIN
        -- LDI / LOAD: OPCODE = 000
		  OPCODE <= "000";
        WAIT FOR 100 ns;

        -- ADD: OPCODE = 001
        OPCODE <= "001";
        WAIT FOR 100 ns;

        -- SUB: OPCODE = 010
        OPCODE <= "010";
        WAIT FOR 100 ns;

        -- JZ: OPCODE = 011
        OPCODE <= "011";
        WAIT FOR 100 ns;

        -- SHL: OPCODE = 100
        OPCODE <= "100";
        WAIT FOR 100 ns;
		  -- Invalid opcode: 101
        OPCODE <= "101";
        WAIT FOR 100 ns;

        -- Invalid opcode: 110
        OPCODE <= "110";
        WAIT FOR 100 ns;

        -- Invalid opcode: 111
        OPCODE <= "111";
        WAIT FOR 100 ns;

        WAIT;
    END PROCESS;

END behavior;