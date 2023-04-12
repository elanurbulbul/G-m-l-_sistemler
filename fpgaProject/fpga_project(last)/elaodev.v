module LED_Controller(
    input clk,
    output reg red_led,
    output reg blue_led,
    output reg green_led
);

reg [31:0] timer = 0;

always @(posedge clk) begin
    timer <= timer + 1;
    if (timer >= 0 && timer < 100_000_000) begin // 10 saniye boyunca kırmızı LED yanacak
        red_led <= 1;
        blue_led <= 0;
        green_led <= 0;
    end 

    else if (timer >= 100_000_000 && timer < 150_000_000) begin // 5 saniye boyunca yeşil LED yanacak
        red_led <= 0;
        blue_led <= 0;
        green_led <= 1;
    end 

    else if (timer >= 150_000_000 && timer < 170_000_000) begin // 2 saniye boyunca mavi LED yanacak
        red_led <= 0;
        blue_led <= 1;
        green_led <= 0;
    end 
    else begin // herhangi biri değilse tüm LED'ler kapalı olacak
        red_led <= 0;
        blue_led <= 0;
        green_led <= 0;
        timer <= 0;
    end
end

endmodule