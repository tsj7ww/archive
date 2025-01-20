import numpy as np
import pandas as pd

from sklearn.pipeline import make_pipeline
from sklearn.metrics import mean_squared_error,mean_absolute_error
from sklearn.model_selection import GridSearchCV

# models
from sklearn.ensemble import RandomForestRegressor, GradientBoostingRegressor
from sklearn.neighbors import KNeighborsRegressor
from sklearn.kernel_ridge import KernelRidge
from sklearn.linear_model import (
    Ridge, Lasso, ElasticNet, SGDRegressor, 
    BayesianRidge, RANSACRegressor, PassiveAggressiveRegressor, 
    HuberRegressor, ARDRegression, LinearRegression
)
from sklearn.neural_network import MLPRegressor
from sklearn.tree import DecisionTreeRegressor
from xgboost import XGBRegressor
from lightgbm import LGBMRegressor
from sklearn.svm import SVR
from catboost import CatBoostRegressor
from mlxtend.regressor import StackingRegressor

# neural network
# import tensorflow as tf
# import tensorflow_decision_forests as tfdf

class Model:
    """
    """
    def __init__(self,
                 model,params,name,
                 x_train,y_train,
                 x_test,y_test,
                 x_predict,
                 run_grid=False
            ):
        
        self.base_model = model
        self.params = params
        self.name = name
        
        self.x_train = x_train
        self.y_train = y_train
        self.x_test = x_test
        self.y_test = y_test
        self.x_train_full = pd.concat([x_train,x_test],axis=0)
        self.y_train_full = pd.concat([y_train,y_test],axis=0)
        self.x_predict = x_predict
        
        self.run_grid = run_grid

        self.pred_train = None
        self.pred_test = None
        self.pred_train_full = None
        self.pred_main = None

        self.mse = None
        self.rmse = None
        self.mae = None

        self.label = 'SalePrice'
    
    def run(self,run_type):
        if self.name == 'neural':
            self._nn(run_type)
        elif self.base_model == CatBoostRegressor:
            model = self.base_model(silent=True,**{
                'iterations': 6000,
                'learning_rate': 0.005,
                'depth': 4,
                'l2_leaf_reg': 1,
                'eval_metric':'RMSE',
                'early_stopping_rounds': 200,
                'random_seed': 42
        })
        elif self.base_model == StackingRegressor:
            model = self.base_model(
                regressors=(
                    CatBoostRegressor(silent=True),
                    LinearRegression(),
                    BayesianRidge(),
                    GradientBoostingRegressor()
                ),
                meta_regressor = CatBoostRegressor(silent=True),
                use_features_in_secondary = True
                )
        else:
            model = self.base_model()
        
        if run_type == 'test':
            input_nm = 'train'
            x = self.x_train
            y = self.y_train
            predict = self.x_test
        elif run_type == 'main':
            input_nm = 'train_full'
            x = self.x_train_full
            y = self.y_train_full
            predict = self.x_predict
            
        if self.run_grid:
            grid = GridSearchCV(model,self.params,cv=5,scoring='mean_squared_error',verbose=0,n_jobs=-1)
            grid.fit(x,y)
            model = grid.best_estimator_
        
        model.fit(x,y)
        setattr(self,f'pred_{input_nm}',np.expm1(pd.Series(model.predict(x),name=self.name,index=x.index)))
        setattr(self,f'pred_{run_type}',np.expm1(pd.Series(model.predict(predict),name=self.name,index=predict.index)))

    def eval(self):
        self.mse = mean_squared_error(np.expm1(self.y_test),self.pred_test)
        self.rmse = None
        self.mae = mean_absolute_error(np.expm1(self.y_test),self.pred_test)
    
    def _nn(self,run_type):
        model = self.base_model(hyperparameter_template="benchmark_rank1",task = tfdf.keras.Task.REGRESSION)
        
        if run_type == 'test':
            input_nm = 'train'
            x = tfdf.keras.pd_dataframe_to_tf_dataset(
                pd.concat([self.x_train,self.y_train],axis=1),
                label=self.label,
                task=tfdf.keras.Task.REGRESSION
            )
            predict = tfdf.keras.pd_dataframe_to_tf_dataset(
                self.x_test,
                task=tfdf.keras.Task.REGRESSION
            )
        elif run_type == 'main':
            input_nm = 'train_full'
            x = tfdf.keras.pd_dataframe_to_tf_dataset(
                pd.concat([self.x_train_full,self.y_train_full],axis=1),
                label=self.label,
                task=tfdf.keras.Task.REGRESSION
            )
            predict = tfdf.keras.pd_dataframe_to_tf_dataset(
                self.x_predict,
                task=tfdf.keras.Task.REGRESSION
            )

        model.compile(metrics=['mse'])
        model.fit(x=x)
        setattr(self,f'pred_{input_nm}',np.expm1(pd.Series(model.predict(x),name=self.name,index=x.index)))
        setattr(self,f'pred_{run_type}',np.expm1(pd.Series(model.predict(predict),name=self.name,index=predict.index)))

MODELS = [
    # ensemble
    {
        'name': 'rf',
        'model': RandomForestRegressor,
        'params': {
            'n_estimators': [100, 200, 300],
            'max_depth': [3, 5, 7, 9],
            'min_samples_split': [2, 3, 4],
            'min_samples_leaf': [1, 2, 3],
            'max_features': ['auto', 'sqrt', 'log2'],
            'bootstrap': [True, False]
        }
    },
    {
        'name': 'gb',
        'model': GradientBoostingRegressor,
        'params': {
            'loss': ['ls', 'lad', 'huber', 'quantile'],
            'learning_rate': [0.01, 0.05, 0.1, 0.2],
            'n_estimators': [100, 200, 300],
            'max_depth': [3, 5, 7, 9],
            'min_samples_split': [2, 3, 4],
            'min_samples_leaf': [1, 2, 3],
            'max_features': ['auto', 'sqrt', 'log2']
        }
    },
    {
        'name': 'xgb',
        'model': XGBRegressor,
        'params': {
            'learning_rate': [0.01, 0.05, 0.1, 0.2],
            'n_estimators': [100, 200, 300],
            'max_depth': [3, 5, 7, 9],
            'min_child_weight': [1, 2, 3],
            'gamma': [0, 0.1, 0.2, 0.3],
            'subsample': [0.5, 0.7, 0.9],
            'colsample_bytree': [0.5, 0.7, 0.9],
            'reg_alpha': [0, 0.1, 0.2, 0.3],
            'reg_lambda': [0.5, 0.7, 0.9],
            'scale_pos_weight': [0.5, 0.7, 0.9]
        }
    },
    {
        'name': 'lgb',
        'model': LGBMRegressor,
        'params': {
            'learning_rate': [0.01, 0.05, 0.1, 0.2],
            'n_estimators': [100, 200, 300],
            'max_depth': [3, 5, 7, 9],
            'num_leaves': [10, 20, 30, 40],
            'min_child_samples': [10, 20, 30, 40],
            'min_child_weight': [1, 2, 3],
            'subsample': [0.5, 0.7, 0.9],
            'colsample_bytree': [0.5, 0.7, 0.9],
            'reg_alpha': [0, 0.1, 0.2, 0.3],
            'reg_lambda': [0.5, 0.7, 0.9],
            'scale_pos_weight': [0.5, 0.7, 0.9]
        }
    },
    {
        'name': 'cat',
        'model': CatBoostRegressor,
        'params': {
            'learning_rate': [0.01, 0.05, 0.1, 0.2],
            'n_estimators': [100, 200, 300],
            'max_depth': [3, 5, 7, 9],
            'subsample': [0.5, 0.7, 0.9],
            'colsample_bylevel': [0.5, 0.7, 0.9],
            'reg_lambda': [0.5, 0.7, 0.9]
        }
    },
    {
        'name': 'svm',
        'model': SVR,
        'params': {
            'kernel': ['linear', 'poly', 'rbf', 'sigmoid'],
            'degree': [2, 3, 4],
            'gamma': ['scale', 'auto'],
            'coef0': [0.0, 0.1, 0.2],
            'tol': [0.001, 0.01, 0.1],
            'C': [0.1, 1, 10],
            'epsilon': [0.1, 0.2, 0.3]
        }
    },
    {
        'name': 'kr',
        'model': KernelRidge,
        'params': {
            'alpha': [0.1, 1, 10],
            'kernel': ['linear', 'poly', 'rbf', 'sigmoid'],
            'degree': [2, 3, 4],
            'gamma': ['scale', 'auto'],
            'coef0': [0.0, 0.1, 0.2]
        }
    },
    {
        'name': 'rdg',
        'model': Ridge,
        'params': {
            'alpha': [0.1, 1, 10],
            'solver': ['auto', 'svd', 'cholesky', 'lsqr', 'sparse_cg', 'sag', 'saga']
        }
    },
    {
        'name': 'lso',
        'model': Lasso,
        'params': {
            'alpha': [0.1, 1, 10],
            'selection': ['cyclic', 'random']
        }
    },
    {
        'name': 'en',
        'model': ElasticNet,
        'params': {
            'alpha': [0.1, 1, 10],
            'l1_ratio': [0.1, 0.5, 0.9],
            'selection': ['cyclic', 'random']
        }
    },
    {
        'name': 'br',
        'model': BayesianRidge,
        'params': {
            'n_iter': [100, 200, 300],
            'tol': [0.001, 0.01, 0.1],
            'alpha_1': [1e-06, 1e-05, 1e-04],
            'alpha_2': [1e-06, 1e-05, 1e-04],
            'lambda_1': [1e-06, 1e-05, 1e-04],
            'lambda_2': [1e-06, 1e-05, 1e-04]
        }
    },
    {
        'name': 'ard',
        'model': ARDRegression,
        'params': {
            'n_iter': [100, 200, 300],
            'tol': [0.001, 0.01, 0.1],
            'alpha_1': [1e-06, 1e-05, 1e-04],
            'alpha_2': [1e-06, 1e-05, 1e-04],
            'lambda_1': [1e-06, 1e-05, 1e-04],
            'lambda_2': [1e-06, 1e-05, 1e-04]
        }
    },
    {
        'name': 'par',
        'model': PassiveAggressiveRegressor,
        'params': {
            'C': [0.1, 1, 10],
            'fit_intercept': [True, False],
            'tol': [0.001, 0.01, 0.1],
            'early_stopping': [True, False],
            'validation_fraction': [0.1, 0.2, 0.3],
            'n_iter_no_change': [5, 10, 15]
        }
    },
    {
        'name': 'ransac',
        'model': RANSACRegressor,
        'params': {
            'min_samples': [0.1, 0.2, 0.3],
            'max_trials': [100, 200, 300],
            'stop_probability': [0.99, 0.98, 0.97],
            'loss': ['absolute_loss', 'squared_loss']
        }
    },
    {
        'name': 'knn',
        'model': KNeighborsRegressor,
        'params': {
            'n_neighbors': [3, 5, 7, 9],
            'weights': ['uniform', 'distance'],
            'algorithm': ['auto', 'ball_tree', 'kd_tree', 'brute'],
            'leaf_size': [10, 20, 30, 40],
            'p': [1, 2]
        }
    },
    {
        'name': 'dt',
        'model': DecisionTreeRegressor,
        'params': {
            'criterion': ['mse', 'friedman_mse', 'mae'],
            'splitter': ['best', 'random'],
            'max_depth': [3, 5, 7, 9],
            'min_samples_split': [0.1, 0.2, 0.3],
            'min_samples_leaf': [0.1, 0.2, 0.3],
            'max_features': ['auto', 'sqrt', 'log2']
        }
    },
    {
        'name': 'sgd',
        'model': SGDRegressor,
        'params': {
            'loss': ['squared_loss', 'huber', 'epsilon_insensitive', 'squared_epsilon_insensitive'],
            'penalty': ['l2', 'l1', 'elasticnet'],
            'alpha': [0.0001, 0.001, 0.01],
            'l1_ratio': [0.15, 0.2, 0.25],
            'fit_intercept': [True, False],
            'tol': [0.001, 0.01, 0.1],
            'epsilon': [0.1, 0.2, 0.3],
            'learning_rate': ['constant', 'optimal', 'invscaling', 'adaptive'],
            'eta0': [0.001, 0.01, 0.1],
            'power_t': [0.1, 0.2, 0.3],
            'early_stopping': [True, False],
            'validation_fraction': [0.1, 0.2, 0.3],
            'n_iter_no_change': [5, 10, 15],
            'warm_start': [True, False],
            'average': [True, False]
        }
    },
    {
        'name': 'mlp',
        'model': MLPRegressor,
        'params': {
            'hidden_layer_sizes': [(100,), (200,), (300,)],
        }
    },
    {
        'name': 'hr',
        'model': HuberRegressor,
        'params': {
            'epsilon': [1.1, 1.2, 1.3],
            'alpha': [0.0001, 0.001, 0.01],
            'fit_intercept': [True, False],
            'tol': [0.001, 0.01, 0.1],
            'warm_start': [True, False]
        }
    },
    {
        'name': 'stack',
        'model': StackingRegressor,
        'params': {}
    },
    # { # neural network
    #     'name': 'neural',
    #     'model': tfdf.keras.RandomForestModel,
    #     'params': {}
    # },
]