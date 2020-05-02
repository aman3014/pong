architecture rtl of debouncer is

signal s_buttonCurrent, s_oneCurrent, s_twoCurrent, s_threeCurrent : std_logic;
signal s_buttonNext, s_oneNext, s_twoNext, s_threeNext : std_logic;

begin

s_oneNext <= button;
s_twoNext <= s_oneCurrent;
s_threeNext <= s_twoCurrent;
s_buttonNext <= '1' when not(enable = '1' or reset = '1') and (s_buttonCurrent = '1' or (s_twoCurrent = '1' and s_threeCurrent = '0')) else '0';

button_o <= s_buttonCurrent;

fsm : process(clock) is
begin
	if (rising_edge(clock)) then
		s_oneCurrent <= s_oneNext;
		s_twoCurrent <= s_twoNext;
		s_threeCurrent <= s_threeNext;
		s_buttonCurrent <= s_buttonNext;
	end if;
end process fsm;

end architecture rtl;