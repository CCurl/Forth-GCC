#ifndef __STRING_H__
#define __STRING_H__

// *********************************************************************
// String stuff
// *********************************************************************
void string_set(char *dest, char *src)
{
    strcpy(dest, src);
}

// *********************************************************************
void string_cat(char *dest, char *src)
{
    strcat(dest, src);
}

// *********************************************************************
void string_ccat(char *dest, char ch)
{
	char src[20];
	src[0] = ch;
	src[1] = (char)NULL;
    strcat(dest, src);
}

// *********************************************************************
void string_padLeft(char *dest, int targetLen, char withChar)
{
    int len = targetLen - strlen(dest);
    if (len > 0)
    {
        char tmp[128];
        tmp[0] = (char)NULL;
        while (len > 0)
        {
            string_ccat(tmp, withChar);
            --targetLen;
        }
        strcat(tmp, dest);
        strcpy(dest, tmp);
    }
}

// *********************************************************************
void string_padRight(char *dest, int targetLen, char withChar)
{
    int len = strlen(dest);
    while (len < targetLen)
    {
        string_ccat(dest, withChar);
        ++len;
    }
}

// *********************************************************************
void string_makeCounted(char *dest)
{
    char tmp[128], *cp = tmp;
    *(cp++) = strlen(dest);
    string_set(cp, dest);
    string_set(dest, tmp);
}

// *********************************************************************
void string_makeZ(char *dest)
{
    char *cp = dest, *cp1 = cp+1;
    int len = *cp;
    while (len > 0)
    {
        *(cp++) = *(cp1++);
        --len;
    }
    *cp = NULL;
}

// *********************************************************************
bool string_equals(char *str1, char *str2)
{
    return strcmp(str1, str2) == 0 ? true : false;
}

// *********************************************************************
bool string_isEmpty(char *str)
{
	char ch = *str;
	if (ch == 0)
    	return true;
	else
	{
		return false;
	}
	
}

// *********************************************************************
bool string_equals_nocase(char *str1, char *str2)
{
    return stricmp(str1, str2) == 0 ? true : false;
}

// *********************************************************************
int string_len(char *str)
{
    return strlen(str);
}

// *********************************************************************
char *string_ltrim(char *str)
{
    while ((*str) && (*str <= ' '))
    {
        ++str;
    }
    return str;
}

// *********************************************************************
void string_rtrim(char *str)
{
    char *cp = str + string_len(str) - 1;
	while ((str <= cp) && (*cp < ' '))
	{
		*(cp--) = 0;
	}
}

#endif
