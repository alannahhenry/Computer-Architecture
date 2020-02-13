library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file_tb is
end register_file_tb;

architecture Behavioral of register_file_tb is 

	component register_file is 
		Port(
			src_s0: in std_logic;
			src_s1: in std_logic; -- for  8-1 multiplexer
			src_s2: in std_logic;
		
			des_A: in std_logic;
			des_B: in std_logic; -- for decoder
			des_C: in std_logic;

			Clk: in std_logic; -- clock 
			data_src: in std_logic; -- for 2-1`multiplexer

			data: in std_logic_vector(15 downto 0);

			reg0: out std_logic_vector(15 downto 0);
			reg1: out std_logic_vector(15 downto 0);
			reg2: out std_logic_vector(15 downto 0);
			reg3: out std_logic_vector(15 downto 0);
			reg4: out std_logic_vector(15 downto 0);
			reg5: out std_logic_vector(15 downto 0);
			reg6: out std_logic_vector(15 downto 0);
			reg7: out std_logic_vector(15 downto 0)
		);
	
	signal src_s0 : std_logic := '0';
	signal src_s1 : std_logic := '0';
	signal src_s2 : std_logic := '0';

	signal des_A : std_logic := '0';
	signal des_B : std_logic := '0';
	signal des_C : std_logic := '0';
	
	signal Clk : std_logic := '0';
	signal data_src : std_logic :='0';
	
	signal reg0: std_logic_vector(15 downto 0):= x"0000"; 
	signal reg1: std_logic_vector(15 downto 0):= x"0000";
	signal reg2: std_logic_vector(15 downto 0):= x"0000";
	signal reg3: std_logic_vector(15 downto 0):= x"0000";
	signal reg4: std_logic_vector(15 downto 0):= x"0000";
	signal reg5: std_logic_vector(15 downto 0):= x"0000";
	signal reg6: std_logic_vector(15 downto 0):= x"0000";
	signal reg7: std_logic_vector(15 downto 0):= x"0000";

begin
	UUT: register_file
	PORT MAP(
		src_s0 => src_s0,
		src_s1 => src_s1, 
		src_s2 => src_s2,
		des_A => des_A,
		des_B => des_B,
		des_C => des_C,
		Clk => Clk,
		data_src => data_src,
		data => data,
		
		reg0 => reg0,
		reg1 => reg1, 
		reg2 => reg2,
		reg3 => reg3,
		reg4 => reg4,
		reg5 => reg5,
		reg6 => reg6,
		reg7 => reg7
	);
	
	process: process
	
	begin 
		src_s0 <= '0';
    		src_s1 <= '1';
     		src_s2 <= '0';
     		des_A0 <= '0';
     		des_A1 <= '1';
     		des_A2 <= '0';
     		data_src <= '0';
     		data <= "1111111100000000";
     		Clk <= '0';
     
     		wait for 10 ns;
     
     		Clk <= '1';
      
     		wait for 10 ns;
     
     		data_src <= '1';
     		des_A0 <= '0';
     		des_A1 <= '0';
     		des_A2 <= '0';
     		Clk <= '0';
     
      		wait for 10 ns;
      	  
     		Clk <= '1';
      		wait for 10 ns;
    
   		end process;  

end Behavioral;
			
	
	