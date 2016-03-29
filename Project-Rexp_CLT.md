---
title: "Coursera Statistical Inference Project - Part 1 (Exponential Distribution Simulation) "
author: "Filomena Ciccarelli"
date: "29 March 2016"
output: pdf_document
---


```r
knitr::opts_chunk$set(echo=TRUE,warning=FALSE, message=FALSE)
```
# Overiew
The purpose of this paper is to simulate an exponential distribution in R and compare it with the Central Limit Theorem. The exponential distribution can be simulated in R with the *rexp(n,lambda)* where *lambda* $\lambda$ is the rate parameter. For the exponential distribution mean=standard deviation= $\1/\lambda$. For this simulation, we investigate the statistical properties of the distribution of the mean of 40 exponentials with $\lambda=0.2$ (sample mean) and assess them against the theoretical mean of the distribution.

## Simulation of forty exponentials


```r
library (pander)
library(ggplot2)
```
