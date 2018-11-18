#!/usr/bin/python

#!/usr/bin/python

import numpy as np
import pandas
from keras.models import Sequential
from keras.layers import Dense
from sklearn.metrics import mean_squared_error
from sklearn import svm
from sklearn import tree
from sklearn.ensemble import GradientBoostingRegressor
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split
from sklearn import preprocessing
import matplotlib.pyplot as plt


# load dataset
print ("Loading Data")
data = pandas.read_csv("usina72.csv")

feature_cols = ['f5', 'f6', 'f7', 'f8', 'f9', 'f10', 'f11', 'f12']
X = data.loc[:,feature_cols]
label_col = ['f3']
Y = data.loc[:,label_col]

## split the data into testing and training
X_train, X_test, y_train, y_test = train_test_split(X,Y,test_size=0.5, random_state=0)

### Normalizacao
scaler = preprocessing.MinMaxScaler()
scaler.fit(X_train)
X_train = scaler.transform(X_train)
X_test = scaler.transform(X_test)

#scaler.fit(y_train)
#y_train = scaler.transform(y_train)
#y_test = scaler.transform(y_test)




print ("Fitting Regressor")
rf = RandomForestRegressor(n_estimators=100)
#
#### .ravel() converte uma coluna num array 1d
rf.fit(X_train, y_train.values.ravel())
vet_test = np.array(y_test.values.ravel())
y_pred = rf.predict(X_test)

MSE = mean_squared_error(y_test.values.ravel(), y_pred)
print ("MSE = :",  MSE)



#### Neural Network\n",
#model = Sequential()
#model.add(Dense(9, input_dim=8, kernel_initializer='normal', activation='relu'))
#model.add(Dense(10, activation='relu'))
#model.add(Dense(1, kernel_initializer='normal'))
#
#model.compile(loss='mean_squared_error', optimizer='adam')
#
#model.fit(X_train, y_train, epochs=100, validation_split=0.33, verbose=1)
#y_pred = model.predict(X_test)
#MSE = mean_squared_error(y_test.ravel(), y_pred)
#print (MSE)



vet_test = np.array(y_test.values.ravel())
vet_pred = np.array(y_pred)
vet_res = vet_test - vet_pred 
print ("Erro Médio: ", np.mean(vet_res) )
print ("Desvio.   : ", np.std(vet_res) )

n, bins, patches = plt.hist(vet_res , 64,density=True)
plt.show()

