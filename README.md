# Computational Project: Kinematic Analysis of Multibody System 

## Project Overview

This project implements a kinematic analysis program for a multibody mechanism using MATLAB. The mechanism is described in absolute coordinates, and the analysis includes computation of positions, velocities, and accelerations of key points in the system.

**Course:** Dynamics of Multibody System  
**Problem:** Problem 2  
**Assignment Date:** November 16th, 2025  
**Deadline:** January 17th, 2026  
**Author:** Dagem Tsehay Alamrew - 342075  

## Objectives

1. ✅ Create an ADAMS model of the mechanism for kinematic analysis
2. ✅ Develop a MATLAB program for kinematic analysis using absolute coordinates
3. ✅ Calculate and plot positions, velocities, and accelerations
4. ✅ Detect and warn about Jacobian matrix singularities

## Project Structure

```
Adams/
├── Homework.cmd        # ADAMS Database
matlab/
├── main.m              # Main execution script
├── parameters.m        # System parameters and constants
├── constants.m         # Physical constants definition
├── driverParams.m      # Actuator parameters (lk, ak, ωk, ϕk)
├── constrains.m        # Constraint equations implementation
├── Jacobian.m          # Jacobian matrix calculation
├── NewRaphson.m        # Newton-Raphson solver for position analysis
├── velocity.m          # Velocity analysis
├── acceleration.m      # Acceleration analysis
├── Rot.m               # Rotation matrix utilities
├── animation.m         # Mechanism animation/visualization
└── Adams/              # ADAMS database and reference data
    ├── c1.csv - c10.csv  # Comparison data from ADAMS
Report/
└── Report.pdf          # Complete project documentation and results
```

## Mathematical Model

### Actuator Motion

The kth actuator length is defined as a time-dependent function:

```
xk = lk + ak sin(ωk t + ϕk)
```

Where:
- `lk` = nominal length of actuator k
- `ak` = amplitude of oscillation
- `ωk` = angular frequency
- `ϕk` = phase shift

### Coordinate System

The mechanism is described in **absolute coordinates**, where each body's position and orientation are defined with respect to a global reference frame.

### Solution Method

The program uses the **Newton-Raphson method** to solve the constraint equations:
1. Position analysis: Solve constraint equations Φ(q) = 0
2. Velocity analysis: Solve Φq · q̇ = -Φt
3. Acceleration analysis: Solve Φq · q̈ = γ

## Key Features

- ✅ Position, velocity, and acceleration analysis
- ✅ Newton-Raphson iterative solver with convergence checking
- ✅ Jacobian singularity detection and warning
- ✅ Time-stepping integration over specified interval
- ✅ Result plotting and visualization
- ✅ Comparison with ADAMS reference data
- ✅ Comprehensive code comments

## Usage

### Running the Analysis

1. Open MATLAB and navigate to the `matlab/` directory
2. Run the main script:

```matlab
main
```

### Configuration

Edit `parameters.m` to modify:
- Geometric dimensions of the mechanism
- Initial configuration

Edit `driverParams.m` to modify:
- Actuator parameters (lk, ak, ωk, ϕk)
- Simulation time interval (t0, tk)
- Time step (h)

Edit `constants.m` to modify:
- Convergence tolerance
- Maximum number of Newton-Raphson iterations

## Output

The program generates:
1. **Plots** of positions, velocities, and accelerations for key points (e.g., ci, A, B, K)
2. **Console output** showing:
   - Singularity warnings (if detected)
   - Execution status
3. **Animation** of mechanism motion (if enabled)

### Plotting Markers

To visualize marker points on the plots, uncomment the code block starting from **line 185** in `main.m`. This section contains additional plotting routines for letter X, Y, and Z directions with marker positions.


## Documentation

A comprehensive project report is available in `report/Report.pdf`, which includes:
- Theoretical background
- ADAMS model description
- MATLAB procedures documentation
- Results demonstration and visualization
- Comparison between ADAMS and MATLAB results
- Conclusions

## Validation

Results are validated against ADAMS simulation data stored in `Adams/` directory:
- Files `c1.csv` through `c10.csv` contain reference trajectories
- Comparison plots verify accuracy of the MATLAB implementation

## Requirements

- MATLAB
- No additional toolboxes required
- ADAMS View


## References

- Course materials: Examples 5.1 – 5.5

---

## License

Academic project for Warsaw University of Technology (WUT)  
Course: Dynamics of Multibody System

