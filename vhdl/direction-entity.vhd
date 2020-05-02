library ieee;
use ieee.std_logic_1164.all;

entity direction is
port(change : in std_logic;
     enable : in std_logic;
     reset  : in std_logic;
     clock  : in std_logic;
     dir    : out std_logic);
end entity direction;

