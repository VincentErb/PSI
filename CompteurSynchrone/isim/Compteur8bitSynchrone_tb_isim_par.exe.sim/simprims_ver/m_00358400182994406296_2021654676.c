/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

/* This file is designed for use with ISim build 0x8ddf5b5d */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif



static void Gate_29_0(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    char *t14;
    char *t15;

LAB0:    t1 = (t0 + 2496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    t2 = (t0 + 1344U);
    t3 = *((char **)t2);
    t2 = (t0 + 2896);
    t4 = (t2 + 56U);
    t5 = *((char **)t4);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 4);
    t9 = (t3 + 4);
    if (*((unsigned int *)t9) == 1)
        goto LAB4;

LAB5:    t10 = *((unsigned int *)t3);
    t11 = (t10 & 1);
    *((unsigned int *)t7) = t11;
    t12 = *((unsigned int *)t9);
    t13 = (t12 & 1);
    *((unsigned int *)t8) = t13;

LAB6:    t14 = (t0 + 2896);
    xsi_driver_vfirst_trans(t14, 0, 0);
    t15 = (t0 + 2816);
    *((int *)t15) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t7) = 1;
    *((unsigned int *)t8) = 1;
    goto LAB6;

}


extern void simprims_ver_m_00358400182994406296_2021654676_2985443199_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_2985443199", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_2985443199.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_3277228084_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_3277228084", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_3277228084.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_0134896529_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_0134896529", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_0134896529.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_1733935451_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_1733935451", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_1733935451.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_3644452940_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_3644452940", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_3644452940.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_1882512879_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_1882512879", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_1882512879.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_2093507646_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_2093507646", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_2093507646.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_3111082672_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_3111082672", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_3111082672.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_0521687300_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_0521687300", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_0521687300.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_0787499929_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_0787499929", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_0787499929.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_2290565165_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_2290565165", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_2290565165.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_2609608528_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_2609608528", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_2609608528.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_4200339088_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676_4200339088", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676_4200339088.didat");
	xsi_register_executes(pe);
}

extern void simprims_ver_m_00358400182994406296_2021654676_init()
{
	static char *pe[] = {(void *)Gate_29_0};
	xsi_register_didat("simprims_ver_m_00358400182994406296_2021654676", "isim/Compteur8bitSynchrone_tb_isim_par.exe.sim/simprims_ver/m_00358400182994406296_2021654676.didat");
	xsi_register_executes(pe);
}
