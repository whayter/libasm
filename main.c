/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: hwinston <hwinston@student.42.fr>          +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2020/08/03 17:26:42 by hwinston          #+#    #+#             */
/*   Updated: 2020/08/04 15:49:50 by hwinston         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <fcntl.h>
#include <errno.h>

size_t  ft_strlen(const char *str);
char    *ft_strcpy(char * dst, const char * src);
int		ft_strcmp(const char *s1, const char *s2);
ssize_t	ft_write(int fd, const void *buf, size_t nbyte);
ssize_t	ft_read(int fd, void *buf, size_t nbyte);
char	*ft_strdup(const char *str);

int     main(int ac, char **av)
{    
    char *str0 = "";
    char *str1 = "hello";
    char *str2 = "welcome to europe";
    char *str3;
    char *str4;
    char *str5 = NULL;
    char dst1[32];
    char dst2[32];
    int ret;

    printf("===== FT_STRLEN =====\n\n");
    
    printf("   strlen: %d\n", (int)strlen(str0));
	printf("ft_strlen: %d\n", (int)ft_strlen(str0));
    printf("\n");
    printf("   strlen: %d\n", (int)strlen(str1));
	printf("ft_strlen: %d\n", (int)ft_strlen(str1));
    printf("\n");
    printf("   strlen: %d\n", (int)strlen(str2));
	printf("ft_strlen: %d\n", (int)ft_strlen(str2));

    printf("\n===== FT_STRCPY =====\n\n");
    
    strcpy(dst1, str0);
    ft_strcpy(dst2, str0);
    printf("   strcpy: %s\n", dst1);
	printf("ft_strcpy: %s\n", dst2);
    printf("\n");
    bzero(dst1, 32);
    bzero(dst2, 32);
    strcpy(dst1, str1);
    ft_strcpy(dst2, str1);
    printf("   strcpy: %s\n", dst1);
	printf("ft_strcpy: %s\n", dst2);
    printf("\n");
    bzero(dst1, 32);
    bzero(dst2, 32);
    strcpy(dst1, str2);
    ft_strcpy(dst2, str2);
    printf("   strcpy: %s\n", dst1);
	printf("ft_strcpy: %s\n", dst2);

    printf("\n===== FT_STRCMP =====\n\n");

    ret = strcmp(str0, str0);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str0, str0);
	printf("ft_strcmp : %d\n", ret);
    printf("\n");
    ret = strcmp(str1, str1);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str1, str1);
	printf("ft_strcmp : %d\n", ret);
    printf("\n");
    ret = strcmp(str1, str0);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str1, str0);
	printf("ft_strcmp : %d\n", ret);
    printf("\n");
    ret = strcmp(str0, str1);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str0, str1);
	printf("ft_strcmp : %d\n", ret);
    printf("\n");
    ret = strcmp(str1, str2);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str1, str2);
	printf("ft_strcmp : %d\n", ret);
    printf("\n");
    ret = strcmp(str2, str1);
	printf("   strcmp : %d\n", ret);
	ret = ft_strcmp(str2, str1);
	printf("ft_strcmp : %d\n", ret);

    printf("\n=== FT_WRITE ===\n\n");
    
    printf(" =    write (ret = %zd)\n", write(1, str0, strlen(str0)));
    printf(" = ft_write (ret = %zd)\n", ft_write(1, str0, strlen(str0)));
    printf("\n");
    printf(" =    write (ret = %zd)\n", write(1, str1, strlen(str1)));
    printf(" = ft_write (ret = %zd)\n", ft_write(1, str1, strlen(str1)));
    printf("\n");
    printf(" =    write (ret = %zd)\n", write(1, str2, strlen(str2)));
    printf(" = ft_write (ret = %zd)\n", ft_write(1, str2, strlen(str2)));

    printf("\n===== FT_READ =====\n\n");
    
    int fd1 = open(av[1], O_RDONLY);
    int fd2 = open(av[1], O_RDONLY);
    char buf1[64];
    char buf2[64];

    errno = 0;
    int r1 = read(fd1, buf1, 64);
    buf1[r1] = '\0';
    printf("   read : %s (ret = %d)\n", buf1, r1);
    printf("errno : %d\n", errno);
    
    errno = 0;
    int r2 = ft_read(fd2, buf2, 64);
    buf2[r2] = '\0';
	printf("ft_read : %s (ret = %d)\n", buf2, r2);
    printf("errno : %d\n", errno);
    close(fd1);
    close(fd2);

    printf("\n===== FT_STRDUP =====\n\n");
    
    str3 = strdup(str0);
    str4 = ft_strdup(str0);
    printf("   strdup : %s\n", str3);
    printf("ft_strdup : %s\n", str4);
    free (str3);
    free (str4);
    printf("\n");
    str3 = strdup(str1);
    str4 = ft_strdup(str1);
    printf("   strdup : %s\n", str3);
    printf("ft_strdup : %s\n", str4);
    free (str3);
    free (str4);
    printf("\n");
    str3 = strdup(str2);
    str4 = ft_strdup(str2);
    printf("   strdup : %s\n", str3);
    printf("ft_strdup : %s\n", str4);
    free (str3);
    free (str4);

    return (0);
}