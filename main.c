#include <stdio.h>

void my_hello();
long long my_add(long long n1, long long n2);
unsigned char my_byte(long long b);
unsigned int my_byteor(long long b);
unsigned int my_byteorwithoutor(long long b);
long long my_mul2(long long n);
long long my_mul3(long long n);
long long my_incone(long long n);
long long my_decone(long long n);
long long my_mul(long long n1, long long n2);
long long my_factorial(long long n);
long long my_mov(long long n);
int my_test(int n1, int n2);
int my_testu(unsigned int n1, unsigned int n2);
void my_mulhello(unsigned long long n);
long long my_fibo(long long n);
long long my_getrip();

int main(int argc, char **argv)
{
    printf("my_hello():\n");
    my_hello();
    printf("my_add(3, 6) = %lld\n", my_add(3, 6));
    printf("my_byte(0xABCD) = 0x%X\n", my_byte(0xABCD));
    printf("my_byteor(0x1122ABCD) = 0x%X\n", my_byteor(0x1122ABCD));
    printf("my_byteorwithoutor(0x1122ABCD) = 0x%X\n", my_byteorwithoutor(0x1122ABCD));
    printf("my_mul2(6) = %lld\n", my_mul2(6));
    printf("my_mul3(6) = %lld\n", my_mul3(6));
    printf("my_incone(41) = %lld\n", my_incone(41));
    printf("my_decone(43) = %lld\n", my_decone(43));
    printf("my_mul(6, 3) = %lld\n", my_mul(6, 3));
    printf("my_factorial(6) = %lld\n", my_factorial(6));
    printf("my_mov(42) = %lld\n", my_mov(42));
    printf("my_test(5, 8) = %lld\n", my_test(5, 8));
    printf("my_test(5, -8) = %lld\n", my_test(5, -8));
    printf("my_test(-8, -5) = %lld\n", my_test(-8, -5));
    printf("my_test(-8, 5) = %lld\n", my_test(-8, 5));
    printf("my_test(7, 7) = %lld\n", my_test(7, 7));
    printf("my_test(-7, -7) = %lld\n", my_test(-7, -7));
    printf("my_testu(5, 8) = %lld\n", my_testu(5, 8));
    printf("my_testu(8, 5) = %lld\n", my_testu(8, 5));
    printf("my_testu(7, 7) = %lld\n", my_testu(7, 7));
    printf("my_testu(-7, -7) = %lld\n", my_testu(-7, -7));
    printf("my_testu(-1, 1) = %lld\n", my_testu(-1, 1));
    printf("my_testu(1, -1) = %lld\n", my_testu(1, -1));
    printf("my_mulhello(3):\n");
    my_mulhello(3);
    printf("my_fibo(0) = %lld\n", my_fibo(0));
    printf("my_fibo(1) = %lld\n", my_fibo(1));
    printf("my_fibo(2) = %lld\n", my_fibo(2));
    printf("my_fibo(8) = %lld\n", my_fibo(8));
    
    return 0;
}