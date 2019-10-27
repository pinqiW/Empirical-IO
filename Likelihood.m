function like=Likelihood(param)
global at it
m=param(1);n=param(2);
[~,~,prob]=main(m,n);
like= - sum(it.*log(prob(at,1))+(1-it).*log(1-prob(at,1)));
end
