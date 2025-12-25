----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 09/22/2025 03:57:09 PM
-- Design Name: 
-- Module Name: SN74AS885 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use ieee.std_logic_arith.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

 
entity SN74AS885 is 
  Port (  
  P, Q: IN std_ulogic_vector(7 downto 0); 
  LAnot,PG, QG: IN std_logic; 
  PGout, QGout: OUT std_logic 
  ); 
end SN74AS885; 
 
architecture Behavioral of SN74AS885 is 
signal Pin : signed(7  downto 0); 
signal Qin: signed(7  downto 0); 
begin 
 
Pin <= signed(P); 
Qin <= signed(Q); 
 
process(LAnot,P, Q, Pin, Qin, PG, QG) 
 
    begin  
 
        if ((LAnot)='1') then  
            if (P>Q) then  
                PGout <= '1'; 
                QGout <= '0'; 
            elsif (P<Q) then  
                PGout <= '0'; 
                QGout <= '1'; 
            else 
                PGout <= PG; 
                QGout <= QG; 
            end if; 
        else  
            if (Pin>Qin) then  
                PGout <= '1'; 
                QGout <= '0'; 
            elsif (Pin<Qin) then  
                PGout <= '0'; 
                QGout <= '1'; 
            else 
                PGout <= PG; 
                QGout <= QG; 
            end if; 
        end if; 
end process; 
 
end Behavioral;
