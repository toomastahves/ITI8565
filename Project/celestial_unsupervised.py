import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.cluster import KMeans
from sklearn.cluster import DBSCAN
from sklearn.decomposition import PCA
from celestial_functions import drop_columns

def pca_plot(data, y_pred, algorithm):
    pca = PCA(n_components = 2)
    pca_data = pca.fit_transform(data)
    pca_data = pca_data.T

    plt.figure('{} PCA dimensionality reduction'.format(algorithm))
    plt.title("{} PCA plot".format(algorithm))
    sns.scatterplot(x=pca_data[0], y=pca_data[1], hue=y_pred, legend=False, palette="Set2")
    
    plt.xlabel("Principal component 1")
    plt.ylabel("Principal component 2")
    plt.grid()

# Prepare data
data = pd.read_csv('objects_10000.csv')
data = drop_columns(data)
data = data.drop('class', axis=1)

# K-means
model_kmeans = KMeans(n_clusters = 3)
model_kmeans.fit(data)
y_pred = model_kmeans.predict(data)
pca_plot(data, y_pred, 'K-means')

# DBSCAN
dbscan = DBSCAN(eps = 1)
y_pred = dbscan.fit_predict(data)
pca_plot(data, y_pred, 'DBSCAN')

plt.show()
