function [Best_Score,BestFit,Convergence_curve]=MSCSO(SearchAgents_no,Max_iter,lb,ub,dim,fobj)
BestFit=zeros(1,dim);%best positions
Best_Score=inf;%best fitness
Positions=initialization(SearchAgents_no,dim,ub,lb);%Initialize the positions of solution
Convergence_curve=zeros(1,Max_iter);% Convergance array
t=0; % starting iteration
S=2;   %%% S is maximum Sensitivity range
p=[1:360];   %angle for roulette wheel selection
while t<Max_iter

    for i=1:size(Positions,1)
        Flag4ub=Positions(i,:)>ub; % check if they exceed (up) the boundaries
        Flag4lb=Positions(i,:)<lb;% check if they exceed (down) the boundaries
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        fitness=fobj(Positions(i,:));
        %%LOBL strategy
        k=(1+(t/Max_iter)^0.5)^10;
        Xnew = (ub+lb)/2+(ub+lb)/(2*k)-Positions(i,:)/k;
        %update positions
        flag4ub = Xnew>ub;
        flag4lb = Xnew<lb;
        Xnew = (Xnew.*(~(flag4ub+flag4ub)))+lb.*flag4lb+ub.*flag4ub;
        if(fobj(Xnew)<fobj(Positions(i,:)))
           Positions(i,:) = Xnew;
           fitness = fobj(Xnew);
        end
        if fitness<Best_Score
            Best_Score=fitness;
            BestFit=Positions(i,:);
        end

    end

    rg=S-((S)*t/(Max_iter));                %%%% guides R
    RL = levy_func(SearchAgents_no,dim,1.5);
   for i=1:size(Positions,1)
        r=rand*rg;
        R=((2*rg)*rand)-rg;                 %%%%   controls to transtion phases  
        %% Hunting
        for j=1:size(Positions,2)
        teta=RouletteWheelSelection_SCSO(p);

           if((-1<=R)&&(R<=1))              %%%% R value is between -1 and 1
               % Attacking on the prey
                Rand_position=abs(rand*BestFit(j)-Positions(i,j));
                Positions(i,j)=BestFit(j)-r*Rand_position*cos(teta);
                % Levy Flight Walk Strategy
                L = BestFit(j)-Positions(i,j);
                newX(j) = BestFit(j)+L.*RL(i,j);
           else          
               % Search for prey
                cp=floor(SearchAgents_no*rand()+1);
                CandidatePosition =Positions(cp,:);
                Positions(i,j)=r*(CandidatePosition(j)-rand*Positions(i,j));
                % Triangle walk strategy
                L = BestFit(j)-Positions(i,j);
                LP = L*rand;
                alph = L*L+LP*LP-2*LP*L*cos(2*pi*rand);
                newX(j) = BestFit(j)+r*alph;%(rand-1)
            end
        end

        Flag4ub=Positions(i,:)>ub;% check if they exceed (up) the boundaries
        Flag4lb=Positions(i,:)<lb;% check if they exceed (down) the boundaries
        Positions(i,:)=(Positions(i,:).*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        fitnessnew1=fobj(Positions(i,:));


        Flag4ub=newX>ub;% check if they exceed (up) the boundaries
        Flag4lb=newX<lb;% check if they exceed (down) the boundaries
        newX=(newX.*(~(Flag4ub+Flag4lb)))+ub.*Flag4ub+lb.*Flag4lb;
        fitnessnew2=fobj(newX);
        if fitnessnew2<fitnessnew1
            Positions(i,:)= newX;
        end
   end

    t=t+1;
    Convergence_curve(t)=Best_Score;
end
end



