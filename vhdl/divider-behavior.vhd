ARCHITECTURE no_target_specific OF clock_divider IS

   CONSTANT c_reload_value : unsigned( 19 DOWNTO 0 ) :=
               to_unsigned(799999,20);
   SIGNAL s_current_state  : unsigned( 19 DOWNTO 0 );
   SIGNAL s_next_state     : unsigned( 19 DOWNTO 0 );

BEGIN
   s_next_state <= c_reload_value WHEN s_current_state = to_unsigned(0,20) ELSE
                   s_current_state - 1;
   make_state : PROCESS( clock , reset , s_next_state )
   BEGIN
      IF (rising_edge(clock)) THEN
         IF (reset = '1') THEN s_current_state <= (OTHERS => '0');
                          ELSE s_current_state <= s_next_state;
         END IF;
      END IF;
   END PROCESS make_state;
   enable <= '1' WHEN s_current_state = to_unsigned(1,20) ELSE '0';

END no_target_specific;
