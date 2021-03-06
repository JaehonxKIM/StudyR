# Ʈ����� ��Ű��
--------------------------------------------------------------
install.packages('arules')
library(arules)

# 1. Ʈ��������� : �������� ����
# 2. ������ ���� : ������ �ʴ� �� ����
tran= read.transactions('train.txt',format='basket',sep=',')
tran
head(tran)
str(tran)
class(tran)

tran@data@i
inspect(tran)#���뺸��
str(inspect(tran))

----------------------------------------------------------------------
rule=apriori(tran,parameter=list(supp=0.3,conf=0.1)) # �������� 30% rule�� 18��
rule=apriori(tran,parameter=list(supp=0.8,conf=0.1)) # �������� 80% rule�� 0��
str(rule)
inspect(rule) # ���뺸��
----------------------------------------------------------------------
#��Ÿ��(A), ����(B) �ŷڵ�
#��Ÿ�̿� ������ ������/��Ÿ���� ������

0.50/0.50=> 1
����(B), ��Ÿ��(B) �ŷڵ�
������ ��Ÿ���� ������/������ ������ 
0.50/0.75 => 0.6666
-----------------------------------------------------------------------
# Arules �ð�ȭ��Ű��

install.packages("arules")
library(arules)
library(arulesViz)
Arule.list <- as(tran,"transactions")
Arule.result <- apriori(Arule.list,parameter=list(supp=0.0001,confidence=0.0001))
plot(Arule.result,method="graph",control=list(type="items"))
-------------------------------------------------------------------------------
test <- subset(Arule.result, subset = rhs %in% "�縻")
plot(test,method="graph",control=list(type="items")) 
--------------------------------------------------------------------------------

