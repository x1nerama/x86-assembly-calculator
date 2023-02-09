%macro getInput 4
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 0x80

	mov eax,3
	mov ebx,1
	mov ecx,%3
	mov edx,%4
	int 0x80
%endmacro

%macro printStr 2
	mov eax,4
	mov ebx,1
	mov ecx,%1
	mov edx,%2
	int 0x80
%endmacro
