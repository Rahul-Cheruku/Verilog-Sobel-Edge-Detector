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

# Reports/Observations:

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/407bee55-0150-4f28-9126-44016952226e)

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/2ca450c9-4d53-48f1-9547-c690ba4eeb22)

<pre>

Max Delay Paths
--------------------------------------------------------------------------------------
Slack:                    inf
  Source:                 Bi22[0]
                            (input port)
  Destination:            fil_out[5]
                            (output port)
  Path Group:             (none)
  Path Type:              Max at Slow Process Corner
  Data Path Delay:        22.873ns  (logic 9.030ns (39.480%)  route 13.843ns (60.520%))
  Logic Levels:           20  (CARRY4=9 IBUF=1 LUT4=2 LUT5=6 LUT6=1 OBUF=1)

+-------------------------+------+-------+------------+-----------+-------+
|        Site Type        | Used | Fixed | Prohibited | Available | Util% |
+-------------------------+------+-------+------------+-----------+-------+
| Slice LUTs              |   87 |     0 |          0 |     20800 |  0.42 |
|   LUT as Logic          |   87 |     0 |          0 |     20800 |  0.42 |
|   LUT as Memory         |    0 |     0 |          0 |      9600 |  0.00 |
| Slice Registers         |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Flip Flop |    0 |     0 |          0 |     41600 |  0.00 |
|   Register as Latch     |    0 |     0 |          0 |     41600 |  0.00 |
| F7 Muxes                |    0 |     0 |          0 |     16300 |  0.00 |
| F8 Muxes                |    0 |     0 |          0 |      8150 |  0.00 |
+-------------------------+------+-------+------------+-----------+-------+
* Warning! LUT value is adjusted to account for LUT combining.

</pre>

## Custom MAC 
![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/eb0cdd44-f5a2-4eee-9cf0-8bba45de7f6a)

## MAC configs:

![image](https://github.com/Rahul-Cheruku/Verilog-Sobel-Edge-Detector/assets/77064752/f65233e9-af74-4e60-a5d5-ce27c37ca9de)



 

 
