---
layout: page
title: Tutorials
---

# Clear-sky calculation

A typical workflow for a clear-sky calculation is to

1. allocate memory
1. set gas concentration values
1. compute the optical properties of the gaseous atmosphere
1. compute radiative fluxes

This repository contains all the pieces needed to perform a clear-sky calculation. An [example](https://github.com/earth-system-radiation/rte-rrtmgp/tree/master/examples/rfmip-clear-sky) is provided.

# All-sky calculation

An all-sky calculation is a small variant

1. allocate memory
1. set gas concentration values
1. compute the optical properties of the gaseous atmosphere
1. compute the optical properties of aerosol and add these to the optical properties
1. compute the optical properties of clouds and add these to the optical properties
1. compute radiative fluxes

An [example](https://github.com/earth-system-radiation/rte-rrtmgp/tree/main/examples/all-sky) of this workflow is available in the repository. The example also demonstrates how to complete an end-to-end calculation on a GPU using OpenACC. Users must provide methods for computing the optical properties of clouds and gases (an [example cloud optics class](https://github.com/earth-system-radiation/rte-rrtmgp/tree/main/rrtmgp-frontend) is provided).
