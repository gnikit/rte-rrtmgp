---
layout: page
title: How to build and run tests
---

How to build the libraries, tests, and examples, run the tests, and verify the results

## In a nutshell

RTE+RRTMGP uses `CMake`. To generate a configuration using the `ninja` build system:
`cmake -S . -B build -G "Ninja" \               -DCMAKE_BUILD_TYPE=RelWithDebInfo \               -DBUILD_TESTING=ON`

To build the code once a configuation has been generated:
`cmake --build build`

To run the examples and tests and check the results:
`ctest --test-dir build`

Evaluating the results of the tests requires `Python` and the packages described in `environment*.yml`.

## Building and testing using (Gnu) autotools

Sergey Kosukhin and his colleagues at the Max Planck Institute for Meteorology
maintain the `autoconf` branch which adds Gnu `autotools` building to `main` branch.

## Supplying data

Data files needed for RRTMGP are available via a [data repository](https://github.com/earth-system-radiation/rrtmgp-data) or
as a [Zenodo archive](https://doi.org/10.5281/zenodo.7988260).

`ctest` fetches a specific version of this data for running the tests and examples.

## Example compiler flags

In these examples `FC` is the Fortran compilers using flags `FCFLAGS`

### Gnu Fortran

(see also the [continuous integration](https://github.com/earth-system-radiation/rte-rrtmgp/blob/main/.github/workflows/continuous-integration.yml))
`FC`: `gfortran-12` or `gfortran-13` or `gfortran-14`

#### Debugging flags

`FCFLAGS: "-ffree-line-length-none -m64 -std=f2008 -march=native -fbounds-check -finit-real=nan"`

#### Even stricter debugging flags

`FCFLAGS: "-ffree-line-length-none -m64 -std=f2008 -march=native -fbounds-check -fbacktrace -finit-real=nan -pedantic -g -Wall"`

### Intel Fortran Classic

(see also the [continuous integration](https://github.com/earth-system-radiation/rte-rrtmgp/blob/main/.github/workflows/containerized-ci.yml))
`FC: ifort`

#### Debugging flags

`FCFLAGS: "-m64 -g -traceback -heap-arrays -assume realloc_lhs -extend-source 132 -check bounds,uninit,pointers,stack -stand f08"`

#### Optimization flags:

`FCFLAGS:"-m64 -O3 -g -traceback -heap-arrays -assume realloc_lhs -extend-source 132"`

### Intel Fortran

(LLVM, see also the [continuous integration](https://github.com/earth-system-radiation/rte-rrtmgp/blob/main/.github/workflows/containerized-ci.yml))
`FC: ifx`

#### Debugging flags

`FCFLAGS: "-debug -traceback -heap-arrays -assume realloc_lhs -extend-source 132 -stand f08"`

#### Using OpenMP GPU offload

See [this open issue](https://github.com/earth-system-radiation/rte-rrtmgp/issues/194)

### NVFortran

(see also the see also the [continuous integration](https://github.com/earth-system-radiation/rte-rrtmgp/blob/main/.github/workflows/containerized-ci.yml))
`FC: nvfortran`

#### Debugging flags

`FCFLAGS: "-g -Minfo -Mbounds -Mchkptr -Mstandard -Kieee -Mchkstk -Mallocatable=03  -Mpreprocess"`

#### Optimization flags:

`FCFLAGS: "-O3 -fast -Minfo -Mallocatable=03 -Mpreprocess"`

### HPE CCE for GPU using OpenMP-acc: crayftn -- requires at least CCE 14.0.0

`FC: crayftn`

#### Debugging flags (these appear to be insufficient during the link stage)

`FCFLAGS: "-hnoacc -homp -O0"`
