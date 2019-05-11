import time
import numpy as np
import pandas as pd
import seaborn as sns
import matplotlib.pyplot as plt
from sklearn.model_selection import train_test_split, GridSearchCV, cross_val_score
from sklearn.metrics import accuracy_score
from sklearn.tree import DecisionTreeClassifier
from sklearn.neighbors import KNeighborsClassifier
from sklearn.ensemble import RandomForestClassifier, AdaBoostClassifier
from sklearn.naive_bayes import GaussianNB
from sklearn.svm import SVC
from sklearn.metrics import classification_report, confusion_matrix 
from sklearn.preprocessing import LabelEncoder, StandardScaler
from sklearn.decomposition import PCA
from sklearn.neural_network import MLPClassifier

def drop_columns(data):
    data = data.drop('spectraltype', axis=1)
    data = data.drop('dec', axis=1)
    data = data.drop('ra', axis=1)
    # Final model features
    # Redshift
    #data = data.drop('redshift', axis=1)
    # Ellipticity
    data = data.drop(['deVAB_u','deVAB_g','deVAB_r','deVAB_i','deVAB_z'], axis=1)
    # Effective radius
    #data = data.drop(['deVRad_u','deVRad_g','deVRad_r','deVRad_i','deVRad_z'], axis=1)
    # Telescope filter band
    #data = data.drop(['u','g','r','i','z'], axis=1)

    # Removing due to excessive correlation:
    # Petrosian magitude
    data = data.drop(['petroMag_u','petroMag_g','petroMag_r','petroMag_i','petroMag_z'], axis=1)
    # PSF magnitude
    data = data.drop(['psfMag_u','psfMag_g','psfMag_r','psfMag_i','psfMag_z'], axis=1)
    # Petrosian radius
    data = data.drop(['petroRad_u','petroRad_g','petroRad_r','petroRad_i','petroRad_z'], axis=1)
    # Petrosian flux
    data = data.drop(['petroFlux_u','petroFlux_g','petroFlux_r','petroFlux_i','petroFlux_z'], axis=1)
    # Spectrum projected onto filter
    data = data.drop(['spectroFlux_u','spectroFlux_g','spectroFlux_r','spectroFlux_i','spectroFlux_z'], axis=1)
    # Adaptive fourth moment of object
    data = data.drop(['mCr4_u','mCr4_g','mCr4_r','mCr4_i','mCr4_z'], axis=1)
    return data

def split_data(data, column):
    train, test = train_test_split(data, test_size=0.3, random_state=100)
    x_train = train.drop(column, axis=1)
    y_train = train[column]
    x_test = test.drop(column,axis=1)
    y_test = test[column]
    return x_train, y_train, x_test, y_test

def get_importance(data, column):
    plt.figure('Importance plot')
    model = RandomForestClassifier()
    model.fit(data.drop(column, axis=1) , data[column])
    imp = model.feature_importances_
    f = data.columns.drop(column)
    f_sorted = f[np.argsort(imp)[::-1]]
    sns.barplot(x=f,y = imp, order = f_sorted)
    plt.title("Random Forest classifier")
    plt.xlabel("Features")
    plt.ylabel("Importance")

def correlation_heatmap(data):
    plt.figure('Correlation heatmap')
    ax = plt.axes()
    sns.heatmap(np.round(data.corr(), 3), annot=True, linewidths=0, cmap='YlGnBu')
    ax.set_title('Correlation between features')

def pairplot(data, column):
    sns.pairplot(data,kind='scatter',hue=column,palette="Set2")

def countplot(data, column):
    plt.figure('Countplot')
    sns.set(style="darkgrid")
    sns.countplot(y=column, data=data, hue=column)

def redshift_plot(data):
    sns.scatterplot(data["class"],data["redshift"],hue=data["class"],s=10)

def temperature_plot(data):
    sns.scatterplot(data["spectraltype"],data["temperature"],hue=data["spectraltype"],s=10, legend=False)


def get_predictions(x_train, y_train, data):
    accuracy = pd.DataFrame(columns = ['Algorithm','Accuracy','Time'])

    # Decision tree
    start = time.perf_counter()
    model_dt = DecisionTreeClassifier(random_state = 100)
    scores = cross_val_score(model_dt, x_train, y_train, cv=5, scoring="accuracy")
    end = time.perf_counter()
    accuracy = accuracy.append({'Algorithm': 'Decision Tree', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    # KNN
    start = time.perf_counter()
    model_knn = KNeighborsClassifier()
    scores = cross_val_score(model_knn, x_train, y_train, cv=5, scoring="accuracy")
    end = time.perf_counter()
    accuracy = accuracy.append({'Algorithm': 'KNN', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    # Random Forest
    start = time.perf_counter()
    model_rf = RandomForestClassifier(random_state = 100, n_estimators = 10)
    scores = cross_val_score(model_rf, x_train, y_train, cv=5, scoring="accuracy")
    end = time.perf_counter()
    accuracy = accuracy.append({'Algorithm': 'Random Forest','Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)
    
    # Naive Bayes
    #start = time.perf_counter()
    #model_nb = GaussianNB()
    #scores = cross_val_score(model_nb, x_train, y_train, cv=5, scoring="accuracy")
    #end = time.perf_counter()
    #accuracy = accuracy.append({'Algorithm': 'Naive bayes', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    # AdaBoost
    start = time.perf_counter()
    model_ab = AdaBoostClassifier(random_state = 100)
    scores = cross_val_score(model_ab, x_train, y_train, cv=5, scoring="accuracy")
    end = time.perf_counter()
    accuracy = accuracy.append({'Algorithm': 'AdaBoost', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    # SVM
    start = time.perf_counter()
    model_svm = SVC(gamma='auto')
    scores = cross_val_score(model_svm, x_train, y_train, cv=5, scoring="accuracy")
    end = time.perf_counter()
    accuracy = accuracy.append({'Algorithm': 'SVM', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    # Multilayer Perceptron
    #start = time.perf_counter()
    #model_mlp = MLPClassifier(hidden_layer_sizes = (1000,1000), max_iter = 1000)
    #scores = cross_val_score(model_mlp, x_train, y_train, cv=5, scoring="accuracy")
    #end = time.perf_counter()
    #accuracy = accuracy.append({'Algorithm': 'MLP', 'Accuracy': scores.mean(), 'Time': end - start}, ignore_index=True)

    return accuracy

def pca_plot(x_train, y_train):
    pca_d = PCA()
    pca_d.fit(x_train)
    cumsum = np.cumsum(pca_d.explained_variance_ratio_)
    d = np.argmax(cumsum >= 0.95) + 1
    plt.figure('PCA best fit')
    plt.plot(cumsum)
    plt.axvline(d,c='r',linestyle='--')
    plt.xlabel("Dimensions")
    plt.ylabel("Importance")
    plt.grid()

    color_dict = {'STAR':'blue','GALAXY':'green','QSO':'orange'}

    pca = PCA(n_components = d)
    d_reduced = pca.fit_transform(x_train)
    d_reduced = np.array(d_reduced).T
    plt.figure('PCA plot')
    plt.scatter(d_reduced[0], d_reduced[1], s = 5, color=[color_dict[i] for i in y_train])
    plt.xlabel("Principal component 1")
    plt.ylabel("Principal component 2")
    plt.grid()
    
def filter_spectraltypes(data, N):
    col = 'spectraltype'
    filtered = pd.DataFrame()
    for i in data[col].unique():
        counts = data[data[col]==i].count()[col]
        if counts >= N:
            filtered = pd.concat([data[data[col]==i], filtered])
    return filtered

