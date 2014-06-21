##1.  Merging the training and the test sets to create one data set.

subject_test=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/test/subject_test.txt")
X_test=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/test/X_test.txt")
y_test=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/test/y_test.txt")

subject_train=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/train/subject_train.txt")
X_train=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/train/X_train.txt")
y_train=read.table("C:/Users/Arjhun/Desktop/UCI HAR Dataset/train/y_train.txt")

test=cbind(subject_test,y_test,X_test)
train=cbind(subject_train,y_train,X_train)
data=rbind(test,train)

##2.  Extracting only the measurements on the mean and standard deviation for each measurement. 

setwd("C:/Users/Arjhun/Desktop/UCI HAR Dataset")
features=read.table("features.txt")
features[,2]=as.character(features[,2])
colnames(data)=c("volunteer_id","activity_id",features[,2])

mean.std.vector<-grepl('mean\\(\\)|std\\(\\)',features[,2])

true_array=vector()
j=1
for(i in 1:561)
{
  if(mean.std.vector[i]==TRUE)
  {
    true_array[j]=i
    j=j+1
  }
}
true_array=true_array+2
reqcol=c(1,2,true_array)
reqdata=data[,reqcol]

##3.  Using descriptive activity names to name the activities in the data set

for(i in 1:nrow(reqdata))
{
  if(reqdata[i,2]==1)
  {
    reqdata[i,2]="Walking"
  }
  else if(reqdata[i,2]==2)
  {
    reqdata[i,2]="Walking_upstairs"
  }
  else if(reqdata[i,2]==3)
  {
    reqdata[i,2]="Walking_downstairs"
  }
  else if(reqdata[i,2]==4)
  {
    reqdata[i,2]="sitting"
  }
  else if(reqdata[i,2]==5)
  {
    reqdata[i,2]="standing"
  }
  else if(reqdata[i,2]==6)
  {
    reqdata[i,2]="laying"
  }
}

##4.  Appropriately labelling the data set with descriptive variable names.

names(reqdata)=gsub("\\(\\)","",names(reqdata))
names(reqdata)=gsub("\\-",".",names(reqdata))

##5.  Creating a second, independent tidy data set with the average of each variable for each activity and each subject.

library(reshape2)
melteddata <- melt(reqdata, id.vars=c("volunteer_id", "activity_id"))
tidydata <- dcast(data = melteddata, volunteer_id + activity_id ~ variable, fun=mean)

write.table(tidydata,"Tidy_data.txt",row.names=FALSE)
