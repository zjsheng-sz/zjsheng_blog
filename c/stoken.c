//假设你能预知某只股票未来100秒内价格（每秒1个价格），只允许你交易2次（买1次，卖1次），同时最多能持有k股，请写一段代码算出最大收益p
float maxIncome(float A[], int N);

int main(int argc, char const *argv[]) {

	return 0;
}


float maxIncome(float A[], int N){

	float maxIncome = 0;

	for (int i = 0; i < N - 1; i++) {

		for (int j = i + 1; j < N; j++) {

			maxIncome = (A[j] - A[i]) > maxIncome ? (A[j] - A[i]) : maxIncome;

		}
	}
}
