import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.tree import DecisionTreeClassifier
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder
from sklearn.decomposition import PCA
from sklearn.metrics import classification_report
from celestial_functions import temperature_plot, filter_spectraltypes, split_data, get_predictions, get_importance, correlation_heatmap, pairplot
import pprint

# 1. Preprare data
data = pd.read_csv('stars_10000.csv')
data = data[data.spectraltype != 'O9.5Ib...']
data = data[data.spectraltype != 'O9.5Vvar']
data = data[data.spectraltype != '0']
data = data.drop('redshift', axis=1)
data = data.drop('color', axis=1)
data = data.drop('gravity', axis=1)
data = data.drop('metallicity', axis=1)
#data = data.drop('temperature', axis=1)
#data.sort_values(by=['spectraltype'])
data = filter_spectraltypes(data, 5)
x_train, y_train, x_test, y_test = split_data(data, 'spectraltype')

# Print unique spectral types and length of data
print('Unique spectral types: {}'.format(len(data['spectraltype'].unique())))
print('Data size: {}'.format(len(x_train)))
print('Unique temperatures: {}'.format(len(data['temperature'].unique())))

# 2. Train models using different algorithms
accuracy = get_predictions(x_train, y_train, data)
print(accuracy)

# 3. Predict using best algorithm Decision Tree.
model_dt = DecisionTreeClassifier(random_state = 100)
model_dt.fit(x_train, y_train)
y_pred = model_dt.predict(x_test)
# Classification report
print(classification_report(y_test, y_pred))

# 4. Plotting
#pairplot(data, 'spectraltype') # For pairplot need to filter out a lot of types so max 5-6 remains, otherwise error
#get_importance(data, 'spectraltype')
#correlation_heatmap(data)

plt.figure('Train data')
plt.title('Train data')
sns.scatterplot(x_train["temperature"], y_train, hue=y_train, s=10, legend=False)

plt.figure('Test data')
plt.title('Test data result')
sns.scatterplot(x_test["temperature"], y_pred, hue=y_pred, s=10, legend=False)

#result = data.groupby('spectraltype').temperature.unique()
#pp = pprint.PrettyPrinter(indent=4, width=200)
#pp.pprint(result)

plt.show()
