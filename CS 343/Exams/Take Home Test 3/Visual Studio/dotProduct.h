#pragma once

float dotProduct(float a[], float b[], int n) {
	float result = 0;
	for (int i = 0; i < n; i++) {
		result = result + (a[i] * b[i]);      
	} 
	return result;
}

float manualDotProduct(float* a, float* b, int n) {
    float result = 0.0; 
    _asm {
        vxorps ymm0, ymm0, ymm0; 
        mov eax, dword ptr[a]
        mov ebx, dword ptr[b] 
        mov ecx, n 

       $mainloop:
            vmovups ymm1, [eax] 
            vmovups ymm2, [ebx] 
            vmulps ymm3, ymm1, ymm2
            vaddps ymm0, ymm3, ymm0
            add eax, 32 
            add ebx, 32 
            sub ecx, 8 
            jnz $mainloop
            vhaddps ymm0, ymm0, ymm0 
            vhaddps ymm0, ymm0, ymm0
            vperm2f128 ymm3, ymm0, ymm0, 1
            vaddps ymm0, ymm3, ymm0
            vextractI128 xmm3, ymm0, 1 
            movss dword ptr[result], xmm3 
    }
    return result;
}

float DPPSDotProduct(float* a, float* b, int n) {
    float result = 0.0; 
    _asm {
        vxorps ymm3, ymm3, ymm3
        mov eax, dword ptr[a]
        mov ebx, dword ptr[b]
        mov ecx, n

        $mainloop:
            vmovups ymm0, [eax]
            vmovups ymm1, [ebx]
            vdpps ymm2, ymm0, ymm1, 0xFF
            vaddps ymm3, ymm2, ymm3
            add eax, 32
            add ebx, 32 
            sub ecx, 8 
            jnz $mainloop

            vperm2f128 ymm0, ymm3, ymm3, 1
            vaddps ymm3, ymm0, ymm3
            vextractI128 xmm3, ymm3, 1
            movss dword ptr[result], xmm3 
    }
    return result;
}