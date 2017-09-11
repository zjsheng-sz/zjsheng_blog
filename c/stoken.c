//假设你能预知某只股票未来100秒内价格（每秒1个价格），只允许你交易2次（买1次，卖1次），同时最多能持有k股，请写一段代码算出最大收益p

int main(){

	float price[100];
	float max_diff = 0.0;
	float p = 0.0;

	for(int i = 0; i < 100; i++){
	
		for(int j = i+1; j < 100; j++){
		
			float diff = price[j] - price[i];
			if(diff > max_diff){
				
			    max_diff = diff;
			}

		}
	}	

	p = max_diff*k;
}

