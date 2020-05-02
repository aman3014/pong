architecture rtl of movement_full is

component direction is 
port(change, enable, reset, clock : in std_logic;
     dir    : out std_logic);
end component;

signal s_pos : std_logic_vector(WIDTH - 1 downto 0);
signal s_dir, s_change : std_logic;

begin

s_change <= ext_change or (s_dir and s_pos(WIDTH - 2)) or (not(s_dir) and s_pos(1));
pos <= s_pos;
dir_o <= s_dir;

m : ENTITY work.movement(rtl)
generic map(WIDTH => WIDTH,
	    INIT => INIT)

port map(dir => s_dir,
	 enable => enable,
	 reset => reset,
	 clock => clock,
	 pos => s_pos);

d : direction
port map(change => s_change,
	 enable => enable,
	 reset => reset,
	 clock => clock,
	 dir => s_dir);

end architecture rtl;