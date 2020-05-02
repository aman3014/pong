architecture rtl of bat is

constant INIT : std_logic_vector := "000111000";
signal s_bat_current, s_bat_next : std_logic_vector(8 downto 0);

begin

s_bat_next <= s_bat_current(7 downto 0) & '0' when button_up = '1' and button_down = '0' and s_bat_current(8) = '0' and enable = '1' else
		'0' & s_bat_current(8 downto 1) when button_up = '0' and button_down = '1' and s_bat_current(0) = '0' and enable = '1' else
		s_bat_current;
bat_current <= s_bat_current;
bat_next <= s_bat_next;

fsm : process(clock, reset) is
begin
	if (reset = '1') then
		s_bat_current <= INIT;
	elsif (rising_edge(clock)) then
		s_bat_current <= s_bat_next;
	end if;
end process fsm;

end architecture rtl;