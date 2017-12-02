//假设你能预知某只股票未来100秒内价格（每秒1个价格），只允许你交易2次（买1次，卖1次），同时最多能持有k股，请写一段代码算出最大收益p

float getMaxProfit(/* arguments */) {

	float price[100];

	float maxProfit = price[1] - price[0];

	for (int i = 0; i < 100-1; i++) {

		for (int j = i+1; i < 100; j++) {

				maxProfit =  price[j] - price[i] > maxProfit ? price[j] - price[i] : maxProfit;
		}

	}

	return maxProfit;
}



int main(){

	float maxProfit = getMaxProfit();

	printf("%.2f\n",maxProfit );

	return 0;
}
