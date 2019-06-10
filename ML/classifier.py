import turicreate as turi
import os.path

def get_path(path):
    (head,tail) = os.path.split(path)
    (head,d)= os.path.split(head)
    return d

url = "dataset/"

data = turi.image_analysis.load_images(url)


data["listype"] = data["path"].apply(get_path)

data.save("lis.sframe")

data.explore()

dataBuffer = turi.SFrame("lis.sframe")

trainingBuffers, testingBuffers = dataBuffer.random_split(0.9)

#turi.config.set_runtime_config('TURI_CACHE_FILE_LOCATIONS', "/Users/yuriy/Documents/MLClassifier")

model = turi.image_classifier.create(trainingBuffers,target = "listype", model= "VisionFeaturePrint_Scene", l2_penalty = 0.000001)

evaluation = model.evaluate(testingBuffers)

print evaluation["accuracy"]

model.save("lis.model")

model.export_coreml("lis.mlmodel")

#import turicreate as turi
#
#url = "dataset/"
#
#data = turi.image_analysis.load_images(url)
#
#data.save("lis.sframe")
#
#data.explore()
#
#dataBuffer = turi.SFrame("lis.sframe")
#
#trainingBuffers, testingBuffers = dataBuffer.random_split(0.9)
#
#model = turi.logistic_classifier.create(trainingBuffers, target='lable')
#
#prediction = model.classify(testingBuffers)
#
#top = model.predict_topk(testingBuffers,output_type='probability',k=5)
#top = model.predict_topk(testingBuffers,output_type='rank',k=5)
#top = model.predict_topk(testingBuffers,output_type='margin',k=5)
#
#result = model.evaluate(testingBuffers)
#
#top = model.predict_topk(testingBuffers,output_type='probability',k=3)
#
#print(top)
#
#model.save("lis.model")
#
#model.export_coreml("lis.mlmodel")



