# Fortran 90 Codes for Numerical Analysis

Repository for some numerical methods in Fortran 90.

The codes are structured in `PROGRAM` and several `MODULES` for functions and other features


## Content
- `src/Root Finding/`: Newton-Raphson (for 1 unknown and 2 unknown), Bisection Method, Secant Method, Bairstow Method, Müller Method.
- `src/Numerical Linear Algebra/`: Gauss elimination with partial pivoting, LU decomposition, Inverse Matrix.
- `src/ODE/`: Methods for Ordinary Differential Equations: Euler method, Runge-Kutta Method, Finite Difference for Second Order Equation.

## Requisites 
- Fortran 90 Compiler

## How to compile the files
For an individual code use the prefix `gfortran`+`FileName.f90` `-o`

```bash
gfortran archivo.f90 -o programa
./programa
```

