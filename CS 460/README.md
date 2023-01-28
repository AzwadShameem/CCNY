# CS_460
Data Science
Grade: A+

<h1 align="center">Why classify SMS Spam?</h1>
<p align="center">By Khuziama Rehman - Azwad Shameem - Tufayel Ahmed</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208226187-f72effc6-4da1-4493-8ed1-067ac7d55181.png" />
</p>   

SMS spam is a serious issue and a issue that has skyrocketed recently. In Novemeber 2022, the number of SMS spam has skyrocketed and it is inevitable for this trend to continue because everyone has a cell phone, and they text their friends and family numerous times per day. As a result, many people will receive SMS messages from unknown senders attempting to steal their personal and financial information. This is a serious issue that we are attempting to help solve because spam SMS messages obstruct users and have the potential to steal personal information. 

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208226210-ce703676-7b5b-4148-afa6-e75eff290d2a.png" />
</p> 

This is an intriguing issue because everyone has a cell phone and has been impacted by spam texts. To address a similar issue, tech companies have developed spam detection software. Spam filters detect and prevent unsolicited, unwanted, and virus-infected email from reaching inboxes. Spam filters are used by Internet service providers (ISPs) to ensure that they do not send spam to their customers. Why don't cell phone companies develop software to filter unwanted SMS text messages similar to spam detection software for emails? For our data science project, we developed a model that can classify text messages to determine whether they are spam. Phone companies can use this software to filter unwanted spam texts using our spam classification algorithm, preventing people from being scammed, interfering with people's conversations, and generally improving the user experience.

<h1 align="center">SMS Data</h1>

The primary dataset we used is called “SMS Spam Collection Data Set” and the link to it is “https://archive.ics.uci.edu/ml/datasets/sms+spam+collection”. We took the data from Kaggle, which cites the University as their source. The SMS Spam Collection data set extracted 425 SMS spam messages from the Grubletext Website. The majority of claims about SMS spam messages on this UK forum are made anonymously by cell phone users. Identifying the text of spam messages in claims was a difficult and time-consuming operation that required meticulously analyzing hundreds of web pages. The SMS Spam Collection Data set also extracted 3,375 SMS messages that were randomly selected from The NUS SMS Corpus (NSC) which is a dataset of approximately 10,000 genuine SMS messages gathered for research at the National University of Singapore's Department of Computer Science. The SMS Spam collection dataset has a total of 5574 instances and has 2 columns, type and sms. The type can be ham or spam. Ham denotes that the SMS message is not spam, whereas spam denotes that the SMS message is spam. We choose this dataset because it is basically a corpus of all the available SMS message datasets, unfortunately there is no other alternative because all of the available SMS messages are in this dataset.

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225735-1b229fcd-b15e-46c9-9e20-5f9c13464caf.png" />
</p>   


<h1 align="center">SMS Data Visualization</h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225318-c5907e9d-90b6-4d11-9bac-ba59a7d39085.png" />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225390-33dbefb7-efd4-463c-96a2-e62eafd454ca.png" />
</p>

The visualization at the top depicts the words that are most commonly associated with spam SMS messages. As you can see, the larger text represents words that appear more frequently in spam sms messages. The words "free, text, txt, mobile, call," for example, appear frequently in spam sms messages. Based on the SPAM collection dataset, we used this data to build a model that can detect whether a message is spam. The bottom visualization shows words that are associated with non-spam SMS messages. As you can see, words like "ur, u, love, come, going, think, need" represent words that appear more frequently in non-spam sms messages.

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225451-5f8a2ed3-b6e6-4986-8d18-8d2739b3d07c.png" />
</p>

More visuals to show the difference between which areas Spam SMS and Ham SMS usually tend to be around.

<h1 align="center">SMS Preprocessing</h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225495-d54b2a89-f240-400f-b4cd-329ff5fb003f.png" />
</p>

<h1 align="center">SMS Imbalance</h1>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207986505-c8d7026a-ec25-44f3-817b-982613e2a597.png" />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207986574-a406e160-a416-47c3-ab46-7b3d847a4391.png" />
</p>

After undersampling the classes are now balanced. We choose undersampling as to not overfit to the examples of spam SMS that are in the dataset.

<p align="center">
  <img src="https://user-images.githubusercontent.com/22661020/208225524-9d4746fb-5572-43d4-8911-d5849316b7e7.png" />
</p>

<h1 align="center">Results & Evaluation</h1>

We attempted various methods to classify spam sms messages including sklearn spacy vectors, tfidvector and TensorFlow. Our first method using spacy vectorization of SMS text messages had two models, a Naive Bayes Model and a Neural Network from Sklearn.

<p align="center">Naive Bayes Spacy Vector</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985035-2a790207-85a6-4798-a915-a82e443176ae.png" />
</p>

As you can see the accuracy and precision are near the 80s range, so there is definitely room for improvement.

<p align="center">Neural Network Spacy Vector</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985164-12791ba6-bd92-4a0e-89c5-57211c23ff0c.png" />
</p>

Clearly, the Neural Network does better than the Naive Bayes in most categories but still the precision is lower than 90%. 

Our second method using tfidvector had two models, the naive bayes model and neural network.

<p align="center">Naive Bayes Tfidvector</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985350-be5ba3b0-d66c-400c-a4d5-392cfb981588.png" />
</p>

The Tfidvector from Sklearn really helped improve the overall performance of the model compared to the Spacy Vectors.

<p align="center">Neural Network Tfidvector</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985491-028b3fa3-3b32-419a-bd05-a66c2d1724cf.png" />
</p>

The Neural Network performance was good but lost in some categories compared to the Naive Bayes model using tfidvector.

Lastly, we also tried using TensorFlow because in TensorFlow there is an embedding layer and we wanted to experiment with it to see if we can get even better results.

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985587-f75ce2de-5ea3-49f5-a77d-a4e02e405393.png" />
</p>

Here is the graph of the training of the TensorFlow LSTM with the loss and Accuracy shown.

<p align="center">Results From Test Data Using TensorFlow</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985668-4225b528-3182-4515-845b-ea6a0b481937.png" />
</p>

<p align="center">
  <img src="https://user-images.githubusercontent.com/69356399/207985743-0ce8ce6f-4a25-4d19-8d36-9661e1846ab3.png" />
</p>

As you can see with the TensorFlow LSTM the performance of the accuracy, precision, recall and pr auc is all above 99%, which is really good. This is most likely due to using TensorFlow’s tokenizer and the embedding layer that is in the TensorFlow model. Our model correctly classified SMS messages as spam or ham, and we are impressed with the performance on the dataset, since as shown in the graph above, our model's accuracy score was 99.1% which is phenomenal. However this model isn't industry grade since the data we used was gathered a decade ago in 2012. Currently, there is no workaround because after a lot of researching this was the latest dataset available as a SMS corpus.

<h1 align="center">Future Work</h1>

Something we can do differently in the future to improve our model would be to create our own dataset because the SMS Spam collection dataset extracted the sms messages data nearly a decade ago, in 2012. Creating our own data set will assist us in classifying SMS messages that users are currently receiving. Spam messages have evolved significantly over the years, with automated messages appearing more realistic as technology has enabled people to extract data about people via social media and the internet. It's frightening how many messages I get asking me to fill out forms to reduce my property tax using my real name and information. 

While working on the model, I discovered a few questions: How can we use our model to classify SMS messages that contain real information about users that the machines could have extracted from the internet? Another issue to consider is how we will handle the situation in which a real human sends a message that appears to be spam in a production grade application that utilizes our model. Off the top of my head, I believe that one way to solve this could be to let SMS messages sent from a saved contact bypass the spam filters.
