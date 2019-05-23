import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder
from sklearn.decomposition import PCA
from sklearn.metrics import classification_report
from celestial_functions import pca_plot_test, drop_columns, redshift_plot, split_data, get_predictions, get_importance, correlation_heatmap, countplot,pairplot, pca_plot_train

# 1. Prepare data
data = pd.read_csv('objects_10000.csv')
data = drop_columns(data)
x_train, y_train, x_test, y_test = split_data(data, 'class')

# 2. Train models using different algorithms
accuracy = get_predictions(x_train, y_train, data)
print(accuracy)

# 3. Best algorithm is Random Forest. Use for further validation.
model_rf = RandomForestClassifier(random_state = 100, n_estimators = 10)
model_rf.fit(x_train, y_train)
y_pred = model_rf.predict(x_test)
# Confusion matrix
class_labels = LabelEncoder().fit(data['class']).inverse_transform([0,1,2])
conf_mat = pd.DataFrame(confusion_matrix(y_test, y_pred), columns = class_labels, index = class_labels)
print(conf_mat)
# Classification report
print(classification_report(y_test, y_pred))

# 4. Draw plots
#get_importance(data, 'class')
correlation_heatmap(data)
pca_plot_train(x_train, y_train)
pca_plot_test(x_test, y_pred)
countplot(data, 'class')
redshift_plot(data)
plt.show()
