function y = fq2(t,u)
  global omega;
  global beta;
  g=9.8;
  y=zeros(2,1);
  y(1)=u(2);
  y(2)=-1*(omega*omega)*u(1)-(2*beta)*u(2);
   if u(2)>0
      y(2)=y(2)-g/10;
  elseif u(2)<0
      y(2)=y(2)+g/10;
  end
end

