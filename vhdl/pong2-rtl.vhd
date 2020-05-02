architecture rtl of pong2 is

component clock_divider is
port(clock, reset : in std_logic;
     enable : out std_logic);
end component;

component bat is
port(button_up, button_down, enable, reset, clock : in std_logic;
     bat_o : out std_logic_vector(8 downto 0));
end component;

component collision2 is
port(x_dir, y_dir : in std_logic;
     x_pos : in std_logic_vector(11 downto 0);
     y_pos, bat_pos : in std_logic_vector(8 downto 0);
     button_up, button_down : in std_logic;
     change : out std_logic);
end component;

component score is
port(x_pos : in std_logic_vector(11 downto 0);
     enable, reset, clock : in std_logic;
     user, sys : out std_logic_vector(7 downto 0);
     over : out std_logic);
end component;

component debouncer is
port(button, enable, reset, clock : in std_logic;
     button_o : out std_logic);
end component;

signal s_x_pos : std_logic_vector(11 downto 0);
signal s_y_pos, s_bat : std_logic_vector(8 downto 0);
signal s_x_dir, s_y_dir : std_logic;
signal s_button_up, s_button_down, s_debounced_up, s_debounced_down : std_logic;
signal s_user, s_sys : std_logic_vector(7 downto 0);
signal s_enable, s_reset, s_change, s_over : std_logic;

begin

s_reset <= not(n_reset);
s_button_up <= not(n_button_up);
s_button_down <= not(n_button_down);
user <= s_user;
sys <= s_sys;
display : for y in 8 downto 0 generate
	oneline : for x in 11 downto 0 generate
		playfield(12 * y + x) <= '1' when (s_y_pos(y) = '1' and s_x_pos(x) = '1') or (x = 10 and s_bat(y) = '1') else '0';
	end generate oneline;
end generate display;

divider : clock_divider
port map(clock => clock,
	 reset => s_reset,
	 enable => s_enable);

scor : score
port map(x_pos => s_x_pos,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 user => s_user,
	 sys => s_sys,
	 over => s_over);

up : debouncer
port map(button => s_button_up,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 button_o => s_debounced_up);

down : debouncer
port map(button => s_button_down,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 button_o => s_debounced_down);

b : bat
port map(button_up => s_debounced_up,
	 button_down => s_debounced_down,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 bat_o => s_bat);

x_axis : ENTITY work.movement_full(rtl)
generic map(WIDTH => 12,
	    INIT => "000000100000")
port map(ext_change => s_change,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 pos => s_x_pos,
	 dir_o => s_x_dir);

y_axis : ENTITY work.movement_full(rtl)
generic map(WIDTH => 9,
	    INIT => "000010000")
port map(ext_change => s_change,
	 enable => s_enable,
	 reset => s_reset,
	 clock => clock,
	 pos => s_y_pos,
	 dir_o => s_y_dir);

c : collision2
port map(x_dir => s_x_dir,
	 y_dir => s_y_dir,
	 x_pos => s_x_pos,
	 y_pos => s_y_pos,
	 bat_pos => s_bat,
	 button_up => s_debounced_up,
	 button_down => s_debounced_down,
	 change => s_change);

end architecture rtl;