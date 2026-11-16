!============================================
!         MAIN PROGRAM
!============================================
PROGRAM EULER
    USE EULER_AND_FUNCTIONS
    IMPLICIT NONE
    REAL (KIND=8) x0,xf,y0,Sol_n,Sol_2n,Richardson


    x0=0.d0 !Initial time
    y0=1.d0 !Boundary condition y(x0)=y0
    xf=5.d0 !Final time

   !Computations and files
   !CALL EULER_FILE(f,x0,xf,y0,100_8,'f(x,100)')
   !CALL EULER_FILE(f,x0,xf,y0,200_8,'f(x,200)')
   CALL EULER_FILE(f,x0,xf,y0,300_8,'f(x,300)')

   Sol_n=EULER_VALUE(f,x0,xf,y0,2000_8)
   Sol_2n=EULER_VALUE(f,x0,xf,y0,4000_8)

   !===========================================================
   ! Since Euler is of O(h), the solution with extrapolation is
   !             Richardson=2*Euler(h/2)-Euler(h)
   !===========================================================
   Richardson=2.d0*Sol_2n-Sol_n
    WRITE(*,*) 'Sol_n =',Sol_n
    WRITE(*,*) 'Sol_2n=',Sol_2n
    WRITE(*,*) 'Ric_Ex=',Richardson

END PROGRAM EULER



