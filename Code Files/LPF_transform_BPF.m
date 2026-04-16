% input  : vectors b (LPF numerator coeff.)
%          a (LPF denominator coeff.)
% return : vectors B (BPF numerator coeff.)
%          A (BPF denominator coeff.)

function [B, A] = LPF_transform_BPF(b, a)
% Extract zeros and poles from LPF transfer function
    zeros_lpf = roots(b);
    poles_lpf = roots(a);
    k_lpf = b(1) / a(1);
    
    %To get a BPF centered at π/2 with real coefficients, we rotate the
    % pole-zero pattern by both +π/2 and -π/2, but each may have complex coeff.
    % so we multiply both This creates conjugate pairs that result in 
    % real coefficients

    % First transformation: rotate by +π/2 (multiply by j)
    zeros_1 = zeros_lpf * 1j;
    poles_1 = poles_lpf * 1j;
    
% Second transformation: rotate by -π/2 (multiply by -j)
    zeros_2 = zeros_lpf * (-1j);
    poles_2 = poles_lpf * (-1j);
    
% Combine both transformations (cascade the two systems)
    all_zeros = [zeros_1; zeros_2];
    all_poles = [poles_1; poles_2];
    
% Convert poles and zeros back to polynomial coefficients
    B = poly(all_zeros);
    A = poly(all_poles);
    
% Adjust gain (squared since we cascaded two systems)
    k_bpf = k_lpf^2;
    B = k_bpf * B;

% Normalize so that A(1) = 1
    B = B / A(1);
    A = A / A(1);
    
end