import numpy as np
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.ensemble import RandomForestClassifier
from sklearn.metrics import confusion_matrix
from sklearn.preprocessing import LabelEncoder
from sklearn.decomposition import PCA
from sklearn.metrics import classification_report
from celestial_functions import drop_columns, redshift_plot, split_data, get_predictions, get_importance, correlation_heatmap, countplot,pairplot, pca_plot_train

# Prepare data
data = pd.read_csv('objects_10000.csv')
data = drop_columns(data)
x_train, y_train, x_test, y_test = split_data(data, 'class')
print('Unique redshifts: {}'.format(len(data['redshift'].unique())))

# Train models using different algorithms
accuracy = get_predictions(x_train, y_train, data)
print(accuracy)

# Predict using Random Forest
model_rf = RandomForestClassifier(random_state = 100, n_estimators = 10)
model_rf.fit(x_train, y_train)
y_pred = model_rf.predict(x_test)
# Confusion matrix
class_labels = LabelEncoder().fit(data['class']).inverse_transform([0,1,2])
conf_mat = pd.DataFrame(confusion_matrix(y_test, y_pred), columns = class_labels, index = class_labels)
print(conf_mat)
# Classification report
print(classification_report(y_test, y_pred))

# PCA
pca = PCA(n_components = 2)
pca_data = pca.fit_transform(x_test)
pca_data = pca_data.T

# Plot predictions
plt.figure('Random Forest after PCA')
plt.title('Test data predictions after PCA')
color_dict = {'STAR':'blue','GALAXY':'green','QSO':'orange'}
plt.scatter(pca_data[0], pca_data[1], s = 1, color=[color_dict[i] for i in y_pred])
plt.xlabel("Principal component 1")
plt.ylabel("Principal component 2")
plt.grid()

#get_importance(data, 'class')
#correlation_heatmap(data)

pca_plot_train(x_train, y_train)
#countplot(data, 'class')
#redshift_plot(data)

plt.show()
