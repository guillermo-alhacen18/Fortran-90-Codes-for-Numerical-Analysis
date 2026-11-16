!====================================================
!      MODULE WITH FUNCTIONS AND SUBROUTINES
!       FOR EULER METHOD AND DATA PLOT
!====================================================
MODULE EULER_AND_FUNCTIONS
    CONTAINS
        !============================================
        !         Subroutine for Euler-Method
        !                   (File)
        !============================================
        SUBROUTINE EULER_FILE(func,x0,xf,y0,n,name)
            IMPLICIT NONE
            REAL (KIND=8),INTENT(IN):: x0,xf,y0
            CHARACTER (LEN=*),INTENT(IN)::name
            INTEGER (KIND=8),INTENT(IN):: n !Grid
            REAL (KIND=8):: dx,xi,yi,yimas1,y00
            INTEGER (KIND=8) i

            !DECLARATION OF KIND OF FUNCTION IS func(x)
            INTERFACE
                FUNCTION func(x,y)
                    IMPLICIT NONE
                    REAL (KIND=8),INTENT(IN):: x,y
                    REAL (KIND=8) func
                END FUNCTION func
            END INTERFACE

            OPEN(UNIT=25,FILE=name//".dat",STATUS='REPLACE') !FILE

            dx=(xf-x0)/DBLE(n) !dx in the grid (CAN BE POSITIVE OR NEGATIVE)

            y00=y0 !initial value y(x0)=y0


            DO i=0,n,1
                xi=x0+DBLE(i)*dx
                yi=y00 !initial value y(x0)=y0
                !=====y(x+dx)=========================
                yimas1=yi+func(xi,yi)*dx
                WRITE(25,'(F18.10,3X,F18.10,F18.10)') xi,yi,yimas1
                !=====Store the last value of y(x+dx) into y(x)=====
                y00=yimas1
            END DO

            CLOSE(UNIT=25,STATUS='KEEP')
        END SUBROUTINE EULER_FILE
        !============================================
        !         FUNCTION for Euler-Method
        !============================================
        FUNCTION EULER_VALUE(func,x0,xf,y0,n)
            IMPLICIT NONE
            REAL (KIND=8),INTENT(IN):: x0,xf,y0
            INTEGER (KIND=8),INTENT(IN):: n !Grid
            REAL (KIND=8):: dx,xi,yi,yimas1,y00,EULER_VALUE
            INTEGER (KIND=8) i

            !DECLARATION OF KIND OF FUNCTION IS func(x)
            INTERFACE
                FUNCTION func(x,y)
                    IMPLICIT NONE
                    REAL (KIND=8),INTENT(IN):: x,y
                    REAL (KIND=8) func
                END FUNCTION func
            END INTERFACE

            dx=(xf-x0)/DBLE(n) !dx in the grid (CAN BE POSITIVE OR NEGATIVE)

            y00=y0 !initial value y(x0)=y0

            DO i=0,n,1
                xi=x0+DBLE(i)*dx
                yi=y00 !initial value y(x0)=y0
                IF (i.EQ.n) THEN
                    EULER_VALUE=yi
                END IF
                !=====y(x+dx)=========================
                yimas1=yi+func(xi,yi)*dx
                !=====Store the last value of y(x+dx) into y(x)=====
                y00=yimas1
            END DO

        END FUNCTION EULER_VALUE

        !============================================
        !         Function f(x)
        !============================================
        FUNCTION f(x,y)
            IMPLICIT NONE
            REAL (KIND=8),INTENT(IN)::x,y
            REAL (KIND=8) f
            f=x**2-DSIN(y)
        END FUNCTION f

END MODULE EULER_AND_FUNCTIONS


