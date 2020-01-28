
detector = vision.ForegroundDetector('NumTrainingFrames',50,'InitialVariance',50*50);
videoreader = vision.VideoFileReader('cad1.mp4','VideoOutputDataType','uint8');


blob = vision.BlobAnalysis('MinimumBlobArea',300);

videoplayer = vision.DeployableVideoPlayer;
while ~isDone(videoreader)
    
frame = step(videoreader);

fgmask = step(detector,frame);

 [~,~,bbox] = step(blob,fgmask);
 
J = insertShape(frame,'rectangle',bbox);

step(videoplayer,frame);
end
release(detector);
release(videoreader);
release(videoplayer)
release(blob)