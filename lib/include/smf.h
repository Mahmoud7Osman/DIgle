char* str_rep(const char *str, const char *src, const char *trg){
    int tmp1=strlen(str), tmp2=strlen(src), tmp3=strlen(trg);

    int newsize=tmp1-tmp2+tmp3;
    char *newstr=(char*)malloc(newsize);

    for (int i=0; i<=tmp1; i++){
        if (strncmp((str+i), src, strlen(src))==0){
           strncat(newstr, str, i);
           strncat(newstr, trg, tmp3);
           strcat (newstr, str+i+tmp2);
        }
    }
    return newstr;
}

char* GetHostByName(const char* dns){
   struct hostent* host=gethostbyname(dns);
   char *ipaddr=(char*)malloc(16);

   if (host==0x00)return 0x00;

   inet_ntop(AF_INET, host->h_addr, ipaddr, 16);

   return ipaddr;
}
