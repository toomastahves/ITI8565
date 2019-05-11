import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder
from sklearn.decomposition import PCA
from sklearn.metrics import classification_report
from celestial_functions import temperature_plot, filter_spectraltypes, split_data, get_predictions, get_importance, correlation_heatmap, pairplot

# Preprare data
data = pd.read_csv('stars_10000.csv')
data = data[data.spectraltype != 'O9.5Ib...']
data = data[data.spectraltype != 'O9.5Vvar']
data = data.drop('redshift', axis=1)
data = data.drop('color', axis=1)
data = data.drop('gravity', axis=1)
data = data.drop('metallicity', axis=1)
#data = data.drop('temperature', axis=1)
data = filter_spectraltypes(data, 5)
x_train, y_train, x_test, y_test = split_data(data, 'spectraltype')

# Print unique spectral types and length of data
print('Unique spectral types: {}'.format(len(data['spectraltype'].unique())))
print('Data size: {}'.format(len(data)))

# Train models using different algorithms
accuracy = get_predictions(x_train, y_train, data)
print(accuracy)

# Predict using Random Forest
model_rf = RandomForestClassifier(random_state = 100, n_estimators = 10)
model_rf.fit(x_train, y_train)
y_pred = model_rf.predict(x_test)

# Classification report
print(classification_report(y_test, y_pred))

#pairplot(data, 'spectraltype') # For pairplot need to filter out a lot of types so max 5-6 remains, otherwise error
#get_importance(data, 'spectraltype')
#correlation_heatmap(data)
plt.title('Test data result')
sns.scatterplot(y_pred, x_test["temperature"], hue=y_pred, s=10, legend=False)
plt.show()
