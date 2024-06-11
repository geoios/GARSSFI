 function [T,Y,Z,L,theta,Iteration,RayInf] = InvRayTrace(PF,TT,YY,HH)
 %% InvRayTracing(PF,TT,YY,HH,tag)->inversion problem
 %�������ã����߸��ٵ���������
 %%%%%%%%%%%%%%%
 %1�������⣺����õ�����ʱ��T��ˮƽλ��Y���������Z
 %a����֪�������桢��Դ���ꡢ����ǡ�����ʱ�� --> ��ȡ�ˮƽλ��
 %b����֪�������桢��Դ���ꡢ����ǡ�ˮƽλ�� --> ��ȡ�����ʱ��
 %c����֪�������桢��Դ���ꡢ����ǡ���� --> ����ʱ�䡢ˮƽλ��
 %%%%%%%%%%%%%%%%
 %2�������⣺���߸��ټ��������theta
 %��֪�������桢��Դ���ꡢĿ������� --> �����
 %����ֵ
 %�������棬���Ƶ����꣬���յ����꣨��ֵ����ʵ��ʱ�䣨����������Ϊ0��
 %���ֵ
 %����ʱ��T��ˮƽλ��Y���������Z


%%%������
%[theta] = IncidentAngle(PF, TT,YY,HH,'Tangent'); 
[T,Y,Z,L,theta,Iteration,RayInf] = InAngle_Li(PF,TT,YY,HH); 

%%%������
%%% ������IncidentAngle �в����н�ļ���ʱ����
% if  T == +inf
%     [T,Y,Z,L] = RayTracing( PF, theta, TT ,  +inf  ,HH  );
% elseif Y == +inf
%     [T,Y,Z,L] = RayTracing( PF, theta, TT ,   YY   ,+inf);
% elseif  H == +inf
%     [T,Y,Z,L] = RayTracing( PF, theta, +inf , YY   ,HH  );
% end



