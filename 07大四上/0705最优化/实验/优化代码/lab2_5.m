options=optimset('LargeScale','off','HessUpdate','dfp','gradobj','on');
[x,fval]=fminunc('nnd',[2,3],options)

options=optimset('LargeScale','off','HessUpdate','bfgs','gradobj','on');
[x,fval]=fminunc('nnd',[2,3],options)
