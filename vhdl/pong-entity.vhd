library ieee;
use ieee.std_logic_1164.all;

entity pong is
   port(n_button_up   : in std_logic;
        n_button_down : in std_logic;
        n_reset       : in std_logic;
        clock         : in std_logic;
        playfield     : out std_logic_vector(107 downto 0);
        user          : out std_logic_vector(7 downto 0);
        sys           : out std_logic_vector(7 downto 0));
end entity pong;