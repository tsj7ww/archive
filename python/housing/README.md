# Regression ML Project - Housing Sale Price Prediction 
Regression modeling and ML project on [Kaggle](https://www.kaggle.com/competitions/house-prices-advanced-regression-techniques) housing data.

## Methodology

#### 1. Preprocessing

###### Steps
1. `Clean` - clean data, handle null values
1. `Dummy` - create dummy variables for categorical fields
1. `Standardize` - standardize numerical data fields (options: standard scaler, robust scaler, min-max scaler)
1. `Select` - feature selection
1. `Split` - split training into fit and score sets

#### 2. Modeling

###### Steps
1. Select model type
    - `Gradient Boosted Decision Tree Regression (gbr)`
    - `Ridge Regression (ridge)`
    - `K-Nearest Neighbor Regression (knn)`
    - `Linear Regression (linreg)`
    - `Random Forest Regression (rfr)`
    - `Kernel Ridge Regression (kernel)`
    - `Elastic Net Regression (enet)`
    - `XGB Regression (xgb)`
1. `Tune`
    - Use `GridSearchCV` to determine optimal model parameters
1. `Predict` - predict target variable for test data using best performing model

#### 3. Neural Network
A `TensorFlow` neural network with two hidden layers is built on top of input data to generate another set of predictions.

#### 4. Meta Model
A meta model is fit on top of training predictions and a `Random Forest Regressor` is used to generate a final sale price prediction using top performing base models:
- `Ridge Regressor`
- `Random Forest Regressor`
- `Kernel Ridge Regressor`
- `XGB Regressor`
- `Gradient Boosted Regressor`