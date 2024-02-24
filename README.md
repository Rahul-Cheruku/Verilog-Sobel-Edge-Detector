# Verilog-Sobel-Edge-Detector

The operator uses two 3×3 kernels which are convolved with the original image to calculate approximations of the derivatives – one for horizontal changes, and one for vertical. If we define A as the source image, and Gx and Gy are two images which at each point contain the horizontal and vertical derivative approximations respectively, the computations are as follows:

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/e76c2666-b4a7-4a57-bd69-bd73df0800e2)


where ∗ here denotes the 2-dimensional signal processing convolution operation.

The x-coordinate is defined here as increasing in the "right"-direction, and the y-coordinate is defined as increasing in the "down"-direction. At each point in the image, the resulting gradient approximations can be combined to give the gradient magnitude, using:

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/0f11a324-ce1c-4432-9536-529b3f291fd0)



Using this information, we can also calculate the gradient's direction:

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/387e744b-8c6d-4996-af66-93ae8995994a)


## Filtering Window

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/15820f75-219a-49b4-adec-4f6ea8aa260e)


 

 
