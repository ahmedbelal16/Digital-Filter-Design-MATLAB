function compute_power(b, a, yt, filter_name)
    [~, yf] = compute_mse(b, a, yt);
    pin = sum(yt.^2);
    pout = sum(yf.^2);
    loss_percentage = (pin-pout) / pin * 100;
    fprintf('Power Loss Percentage for %s is: %.2f%%\n\n', filter_name, loss_percentage);
end