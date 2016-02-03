Developing Data Products
========================================================
author: JLS
date: Thu Feb 04 00:58:14 2016
transition: rotate

Cars MPG Simulation
========================================================
type: sub-section

This presentation is being created as part of the peer assessment for the coursera developing data products class. Some work from the previous project is extended in developing the application. Below are the tools that used in this project.

- **shiny** to build data product application
- **R-Presentation** to create data product related presentations

Application
========================================================
type: sub-section

To illustrate the understanding of using **shiny** to build an application, a simple **MPG predictor** was developed and it can be accessed at https://jlsiaw.shinyapps.io/DevDataProd/.

User needs to enter the following value to get the predicted MPG:
- Horsepower in bhp
- Weight in ton
- Transmission type: manual or automatic (if not check)


Model
========================================================
type: sub-section

This application is based on **mtcars** dataset in R. User is allowed to enter commonly used weight measurement in **ton**. Application will convert it back to (lb/1000) for model prediction.

A mutivariate linear regression model is running in behind to evaluate all three variables provided by users to get the MPG value.

Source code for the project is available on the [GitHub](https://github.com/jlsiaw/DevDataProd).

Raw Data
========================================================
type: sub-section

Read Data

```r
head(mtcars[, c(1,4,6,9)])
```

```
                   mpg  hp    wt am
Mazda RX4         21.0 110 2.620  1
Mazda RX4 Wag     21.0 110 2.875  1
Datsun 710        22.8  93 2.320  1
Hornet 4 Drive    21.4 110 3.215  0
Hornet Sportabout 18.7 175 3.440  0
Valiant           18.1 105 3.460  0
```
