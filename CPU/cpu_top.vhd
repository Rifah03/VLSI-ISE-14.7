library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity cpu_top is
    Port (
        CLK          : in  STD_LOGIC;
        RESET        : in  STD_LOGIC;
        ACC_OUT      : out STD_LOGIC_VECTOR(7 downto 0);
        PC_OUT       : out STD_LOGIC_VECTOR(3 downto 0);
        ZERO_OUT     : out STD_LOGIC;
        INSTRUCTION_OUT : out STD_LOGIC_VECTOR(7 downto 0)
    );
end cpu_top;

architecture Structural of cpu_top is

    component program_counter_4_bit
	 Port (
            CLK   : in  STD_LOGIC;
            RESET : in  STD_LOGIC;
            PC    : out STD_LOGIC_VECTOR(3 downto 0)
        );
    end component;

    component program_rom
        Port (
            ADDRESS     : in  STD_LOGIC_VECTOR(3 downto 0);
            INSTRUCTION : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component control_unit
	 Port (
            OPCODE  : in  STD_LOGIC_VECTOR(2 downto 0);
            LOAD    : out STD_LOGIC;
            ADD     : out STD_LOGIC;
            SUB     : out STD_LOGIC;
            JZ      : out STD_LOGIC;
            SHL     : out STD_LOGIC;
            INVALID : out STD_LOGIC
        );
    end component;

    component alu_8bit
        Port (
            A      : in  STD_LOGIC_VECTOR(7 downto 0);
				B      : in  STD_LOGIC_VECTOR(7 downto 0);
            SEL    : in  STD_LOGIC_VECTOR(1 downto 0);
            RESULT : out STD_LOGIC_VECTOR(7 downto 0);
            COUT   : out STD_LOGIC
        );
    end component;

    component accumulator_8bit
        Port (
            CLK      : in  STD_LOGIC;
				RESET    : in  STD_LOGIC;
            DATA_IN  : in  STD_LOGIC_VECTOR(7 downto 0);
            LOAD     : in  STD_LOGIC;
            ACC_OUT  : out STD_LOGIC_VECTOR(7 downto 0)
        );
    end component;

    component zero_flag
        Port (
            ACC  : in  STD_LOGIC_VECTOR(7 downto 0);
            ZERO : out STD_LOGIC
				);
    end component;

    signal PC_VALUE       : STD_LOGIC_VECTOR(3 downto 0);
    signal INSTRUCTION    : STD_LOGIC_VECTOR(7 downto 0);
    signal OPCODE         : STD_LOGIC_VECTOR(2 downto 0);
    signal OPERAND        : STD_LOGIC_VECTOR(7 downto 0);
    signal LOAD_SIG        : STD_LOGIC;
    signal ADD_SIG         : STD_LOGIC;
	 signal SUB_SIG         : STD_LOGIC;
    signal JZ_SIG          : STD_LOGIC;
    signal SHL_SIG         : STD_LOGIC;
    signal INVALID_SIG     : STD_LOGIC;
    signal ACC_VALUE       : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_RESULT      : STD_LOGIC_VECTOR(7 downto 0);
    signal ALU_SEL         : STD_LOGIC_VECTOR(1 downto 0);
    signal ALU_COUT        : STD_LOGIC;
	 signal ZERO_VALUE      : STD_LOGIC;
    signal ACC_LOAD        : STD_LOGIC;
    signal ACC_DATA        : STD_LOGIC_VECTOR(7 downto 0);

begin

    -- Program Counter
    PC1: program_counter_4_bit
	 port map (
            CLK   => CLK,
            RESET => RESET,
            PC    => PC_VALUE
        );

    -- Program ROM
    ROM1: program_rom
        port map (
            ADDRESS     => PC_VALUE,
            INSTRUCTION => INSTRUCTION
        );

    OPCODE  <= INSTRUCTION(7 downto 5);
    OPERAND <= "000" & INSTRUCTION(4 downto 0);
	  -- Instruction Decoder / Control Unit
    CU1: control_unit
        port map (
            OPCODE  => OPCODE,
            LOAD    => LOAD_SIG,
            ADD     => ADD_SIG,
            SUB     => SUB_SIG,
            JZ      => JZ_SIG,
            SHL     => SHL_SIG,
            INVALID => INVALID_SIG
        );

    -- ALU operation selection
    process (ADD_SIG, SUB_SIG, SHL_SIG)
	  begin
        if ADD_SIG = '1' then
            ALU_SEL <= "00";
        elsif SUB_SIG = '1' then
            ALU_SEL <= "10";
        elsif SHL_SIG = '1' then
            ALU_SEL <= "11";
        else
            ALU_SEL <= "01";
        end if;
    end process;

    -- ALU
    ALU1: alu_8bit
        port map (
		  A      => ACC_VALUE,
            B      => OPERAND,
            SEL    => ALU_SEL,
            RESULT => ALU_RESULT,
            COUT   => ALU_COUT
        );

    -- Accumulator input selection
    process (LOAD_SIG, ADD_SIG, SUB_SIG, SHL_SIG,
             OPERAND, ALU_RESULT)
    begin
        if LOAD_SIG = '1' then
            ACC_DATA <= OPERAND;
        elsif ADD_SIG = '1' or SUB_SIG = '1' or SHL_SIG = '1' then
		  ACC_DATA <= ALU_RESULT;
        else
            ACC_DATA <= (others => '0');
        end if;
    end process;

    ACC_LOAD <= LOAD_SIG or ADD_SIG or SUB_SIG or SHL_SIG;

    -- Accumulator
    ACC1: accumulator_8bit
        port map (
		  CLK     => CLK,
            RESET   => RESET,
            DATA_IN => ACC_DATA,
            LOAD    => ACC_LOAD,
            ACC_OUT => ACC_VALUE
        );

    -- Zero Flag
    ZF1: zero_flag
        port map (
            ACC  => ACC_VALUE,
            ZERO => ZERO_VALUE
        );

    -- Top-level outputs
    ACC_OUT         <= ACC_VALUE;
    PC_OUT          <= PC_VALUE;
    ZERO_OUT        <= ZERO_VALUE;
    ZERO_OUT        <= ZERO_VALUE;
    INSTRUCTION_OUT <= INSTRUCTION;

end Structural;