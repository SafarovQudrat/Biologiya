//
//  main.cpp
//  jhsdvcbksdhc
//
//  Created by MacBook Pro on 14/03/23.
//

#include <iostream>
using namespace std;
int main() {
    int x,n,a,b,k=0;
    cin>>n>>x>>a;
    for(int i = 1;i<=n;i++){
        cin>>b;
        a = a*x + b;
        k = k+2;
        
    }
    cout<<"a="<<a<<endl;
    cout<<"k="<<k<<endl;
}



