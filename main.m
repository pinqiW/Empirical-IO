function[VBar0,VBar1,p1]=main(theta1,R)
beta = 0.9;
% state variable
a = [1;2;3;4;5];
% Initialized V bar - there are five possible values for a so each Vbar is a 5 vector
VBar0 = zeros (5,1);
VBar1 = zeros(5,1);
% to start the loop off
diff = 10;
while diff>=.00001
    % Expect value of the max of two logit errors
    % Construct a V(x {t+1}))
    V0xt1 = [VBar0(2:5,1); VBar0(5,1)];
    V1xt1 = [VBar1(2:5,1); VBar1(5,1)];
    % If we reset, contruct V(1)
    V0reset = [VBar0(1,1); VBar0(1,1);VBar0(1,1);VBar0(1,1);VBar0(1,1)];
    V1reset = [VBar1(1,1); VBar1(1,1); VBar1(1,1); VBar1(1,1); VBar1(1,1)] ;
    % Evaluate the the expected value of the max
    EV0 = .5775 +log(exp(V0xt1)+ exp(V1xt1));
    EV1 = .5775 +log(exp(V0reset)+ exp(V1reset));
    % Update Vbar0 - if we don't replace
    VBar0u = theta1*a + beta*(EV0);
    % Update Vbar1 - if we do replace
    VBar1u = R + beta*(EV1);
    %Take the difference of the updated and the previous
    diff1 = VBar0-VBar0u;
    diff2 = VBar1-VBar1u;
    % See how close we are from the previous value function
    diff = norm(diff1) + norm(diff2);
    % Set up for next round
    VBar0=VBar0u;
    VBar1=VBar1u;
end

p1=exp(VBar1)./(exp(VBar0)+exp(VBar1));
end



