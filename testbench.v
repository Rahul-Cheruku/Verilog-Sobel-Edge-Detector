`timescale 1us / 1ps

module tb;

parameter img_w = 'd256;
parameter img_h = 'd256;
parameter img_input_w= 'd9;
parameter mask_input_w= 'd3;
parameter mask_size= 'd3;

reg [img_input_w+mask_input_w-1:0] zero_G;

reg clk;
integer fd_img, fd_gx, fd_gy, ix, iy,k,m,n,i,j;

reg [mask_input_w-1:0] mask_x [1:mask_size][1:mask_size];
reg [mask_input_w-1:0] mask_y [1:mask_size][1:mask_size];
reg [img_input_w-1:0] img_conv [1:mask_size][1:mask_size];

wire [img_input_w+mask_input_w-1:0] Gx;
wire [img_input_w+mask_input_w-1:0] Gy;

reg [img_input_w-1:0] padded_rows [1:mask_size] [0:img_w+1];


always
    #50 clk = ~clk;

initial
    begin
        clk = 0;
        zero_G = 'b0;
        
        mask_x[1][1] = -'d1;
        mask_x[1][2] = 'd0;
        mask_x[1][3] = 'd1;
        mask_x[2][1] = -'d2;
        mask_x[2][2] = 'd0;
        mask_x[2][3] = 'd2;
        mask_x[3][1] = -'d1;
        mask_x[3][2] = 'd0;
        mask_x[3][3] = 'd1;
        
        mask_y[1][1] = 'd1;
        mask_y[1][2] = 'd2;
        mask_y[1][3] = 'd1;
        mask_y[2][1] = 'd0;
        mask_y[2][2] = 'd0;
        mask_y[2][3] = 'd0;
        mask_y[3][1] = -'d1;
        mask_y[3][2] = -'d2;
        mask_y[3][3] = -'d1;
        


        img_conv[1][1] = 'd2;
        img_conv[1][2] = 'd2;
        img_conv[1][3] = 'd2;
        img_conv[2][1] = 'd2;
        img_conv[2][2] = 'd2;
        img_conv[2][3] = 'd2;
        img_conv[3][1] = 'd2;
        img_conv[3][2] = 'd2;
        img_conv[3][3] = 'd2;
    end


initial
    begin
        fd_img = $fopen("C:/Users/rahul/Desktop/Matlab/edge_detector/harsh/image.txt", "r");
        fd_gx = $fopen("C:/Users/rahul/Desktop/Matlab/edge_detector/harsh/image_gx.txt", "w");
        fd_gy = $fopen("C:/Users/rahul/Desktop/Matlab/edge_detector/harsh/image_gy.txt", "w");
            if(fd_img)
                $display("FILE oppened");
            else
                begin
                    $display("Problem");
                end
        for (iy =2; iy <= mask_size; iy = iy +1)
            begin    
                for (ix = 1; ix<=img_w; ix = ix+1)
                    begin
                        $fscanf(fd_img,"%b",padded_rows[iy][ix]);                 
                    end
            end
       for (i = 0; i<=img_w+1; i = i+1)
            begin
                padded_rows[1][i] = padded_rows[2][i];               
            end
       pad_rows;
    end
always @ (posedge clk)
    begin
        // for a whole row
        for(k = 1; k<=img_w; k = k+1)
            begin 
                for(m = 1; m<=mask_size; m = m+1)
                    begin
                        for(n=1;n<=mask_size; n = n+1)
                            begin
                                img_conv[m][n] = padded_rows[m][k+n-2];
                            end
                    end
                // now that image is the matrix we can store the Gx and Gy
                #1; // waiting to compute Gx and Gy
                $fwrite(fd_gx, "%b", Gx);
                $fwrite(fd_gx, "%s", "   ");
//                if(Gx >= 0)
//                    $fwrite(fd_gx, "%b", Gx);
//                else        
//                    $fwrite(fd_gx, "%b", zero_G);    
//                $fwrite(fd_gx, "%s", "   ");
//                if(Gy >= 0)  
//                    $fwrite(fd_gy, "%b", Gy);
//                else
//                    $fwrite(fd_gy, "%b", zero_G);
                $fwrite(fd_gy, "%b", Gy);
                $fwrite(fd_gy, "%s", "   ");
                
            end
        // update rows!!!
        swift_and_read_a_row;
            
    end

edge_mac_wrapper ed_mac_y
       (.Ai00_0(img_conv[1][1]),
        .Ai01_0(img_conv[1][2]),
        .Ai02_0(img_conv[1][3]),
        .Ai10_0(img_conv[2][1]),
        .Ai11_0(img_conv[2][2]),
        .Ai12_0(img_conv[2][3]),
        .Ai20_0(img_conv[3][1]),
        .Ai21_0(img_conv[3][2]),
        .Ai22_0(img_conv[3][3]),
        .Bi00_0(mask_y[1][1]),
        .Bi01_0(mask_y[1][2]),
        .Bi02_0(mask_y[1][3]),
        .Bi10_0(mask_y[2][1]),
        .Bi11_0(mask_y[2][2]),
        .Bi12_0(mask_y[2][3]),
        .Bi20_0(mask_y[3][1]),
        .Bi21_0(mask_y[3][2]),
        .Bi22_0(mask_y[3][3]),
        .fil_out_0(Gy));
        
edge_mac_wrapper ed_mac_x
       (.Ai00_0(img_conv[1][1]),
        .Ai01_0(img_conv[1][2]),
        .Ai02_0(img_conv[1][3]),
        .Ai10_0(img_conv[2][1]),
        .Ai11_0(img_conv[2][2]),
        .Ai12_0(img_conv[2][3]),
        .Ai20_0(img_conv[3][1]),
        .Ai21_0(img_conv[3][2]),
        .Ai22_0(img_conv[3][3]),
        .Bi00_0(mask_x[1][1]),
        .Bi01_0(mask_x[1][2]),
        .Bi02_0(mask_x[1][3]),
        .Bi10_0(mask_x[2][1]),
        .Bi11_0(mask_x[2][2]),
        .Bi12_0(mask_x[2][3]),
        .Bi20_0(mask_x[3][1]),
        .Bi21_0(mask_x[3][2]),
        .Bi22_0(mask_x[3][3]),
        .fil_out_0(Gx));

//task swift_rows;
//begin
//    for (i = 0; i <= img_w + 1; i = i + 1) 
//        begin
//            padded_rows[1][i] = padded_rows[2][i];
//            padded_rows[2][i] = padded_rows[3][i]; 
//        end   
//end
//endtask

task swift_and_read_a_row;
begin

    for (j = 1; j<=img_w; j = j+1)
        begin
            padded_rows[1][j] = padded_rows[2][j];
            padded_rows[2][j] = padded_rows[3][j];
            $fscanf(fd_img,"%b",padded_rows[3][j]);
            if($feof(fd_img))
                begin
                    $fclose(fd_img);
                    $fclose(fd_gy);
                    $fclose(fd_gx);
                    $finish;   
                end              
        end
    pad_rows;   
end
endtask

task pad_rows;
begin
        padded_rows[1][0] = padded_rows[1][1];        
        padded_rows[2][0] = padded_rows[2][1];         
        padded_rows[3][0] = padded_rows[3][1];
        padded_rows[1][img_w+1] = padded_rows[1][img_w];        
        padded_rows[2][img_w+1] = padded_rows[2][img_w];         
        padded_rows[3][img_w+1] = padded_rows[3][img_w];
end
endtask

endmodule
