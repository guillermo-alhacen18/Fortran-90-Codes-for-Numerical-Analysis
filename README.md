# Fortran 90 Codes for Numerical Analysis

Repositorio con implementaciones de métodos numéricos en Fortran 90.

## Contenido
- `src/root_finding/`: Métodos para encontrar raíces (bisección, Newton-Raphson).
- `src/linear_systems/`: Solución de sistemas lineales (eliminación gaussiana, LU).
- `src/integration/`: Integración numérica (trapecio, Simpson).

## Requisitos
- Compilador de Fortran 90 (por ejemplo, `gfortran`).

## Cómo compilar y ejecutar
Para compilar un archivo individual:
```bash
gfortran archivo.f90 -o programa
./programa
