
./out/sl03_evb.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .type    Reset_Handler, %function
Reset_Handler:
#    lrw      r0, 0x80000000
#    mtcr     r0, psr

    la       x2, g_top_irqstack
       0:	20001117          	auipc	sp,0x20001
       4:	01410113          	addi	sp,sp,20 # 20001014 <g_top_irqstack>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
    la      x3, __bss_start__
       8:	20000197          	auipc	gp,0x20000
       c:	ffc18193          	addi	gp,gp,-4 # 20000004 <__data_end__>
    la      x4, __bss_end__
      10:	20004217          	auipc	tp,0x20004
      14:	9d420213          	addi	tp,tp,-1580 # 200039e4 <__bss_end__>

    li      x5, 0
      18:	4281                	li	t0,0

    sub    x4, x4, x3
      1a:	40320233          	sub	tp,tp,gp
    beqz    x4, .L_loop1_done
      1e:	00020863          	beqz	tp,2e <Reset_Handler+0x2e>

.L_loop1:
    sw      x5, 0(x3)
      22:	0051a023          	sw	t0,0(gp)
    addi    x3, x3, 4
      26:	0191                	addi	gp,gp,4
    addi    x4, x4, -4
      28:	1271                	addi	tp,tp,-4
    bnez    x4, .L_loop1
      2a:	fe021ce3          	bnez	tp,22 <Reset_Handler+0x22>
    #bseti   r0, 14
    #mtcr    r0, cr<31, 0>
#endif

#ifndef __NO_SYSTEM_INIT
    jal    SystemInit
      2e:	6eb010ef          	jal	ra,1f18 <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal    board_init
      32:	711010ef          	jal	ra,1f42 <board_init>
#    lrw     r0, VIC_TSPR
#    movi    r1, 0xb00
#    stw     r1, (r0)
#endif

    jal    main
      36:	144020ef          	jal	ra,217a <main>

0000003a <__exit>:
    .size   Reset_Handler, . - Reset_Handler

__exit:
    j __exit
      3a:	a001                	j	3a <__exit>

0000003c <memset>:
      3c:	433d                	li	t1,15
      3e:	872a                	mv	a4,a0
      40:	02c37363          	bleu	a2,t1,66 <memset+0x2a>
      44:	00f77793          	andi	a5,a4,15
      48:	efbd                	bnez	a5,c6 <memset+0x8a>
      4a:	e5ad                	bnez	a1,b4 <memset+0x78>
      4c:	ff067693          	andi	a3,a2,-16
      50:	8a3d                	andi	a2,a2,15
      52:	96ba                	add	a3,a3,a4
      54:	c30c                	sw	a1,0(a4)
      56:	c34c                	sw	a1,4(a4)
      58:	c70c                	sw	a1,8(a4)
      5a:	c74c                	sw	a1,12(a4)
      5c:	0741                	addi	a4,a4,16
      5e:	fed76be3          	bltu	a4,a3,54 <memset+0x18>
      62:	e211                	bnez	a2,66 <memset+0x2a>
      64:	8082                	ret
      66:	40c306b3          	sub	a3,t1,a2
      6a:	068a                	slli	a3,a3,0x2
      6c:	00000297          	auipc	t0,0x0
      70:	9696                	add	a3,a3,t0
      72:	00a68067          	jr	10(a3)
      76:	00b70723          	sb	a1,14(a4)
      7a:	00b706a3          	sb	a1,13(a4)
      7e:	00b70623          	sb	a1,12(a4)
      82:	00b705a3          	sb	a1,11(a4)
      86:	00b70523          	sb	a1,10(a4)
      8a:	00b704a3          	sb	a1,9(a4)
      8e:	00b70423          	sb	a1,8(a4)
      92:	00b703a3          	sb	a1,7(a4)
      96:	00b70323          	sb	a1,6(a4)
      9a:	00b702a3          	sb	a1,5(a4)
      9e:	00b70223          	sb	a1,4(a4)
      a2:	00b701a3          	sb	a1,3(a4)
      a6:	00b70123          	sb	a1,2(a4)
      aa:	00b700a3          	sb	a1,1(a4)
      ae:	00b70023          	sb	a1,0(a4)
      b2:	8082                	ret
      b4:	0ff5f593          	andi	a1,a1,255
      b8:	00859693          	slli	a3,a1,0x8
      bc:	8dd5                	or	a1,a1,a3
      be:	01059693          	slli	a3,a1,0x10
      c2:	8dd5                	or	a1,a1,a3
      c4:	b761                	j	4c <memset+0x10>
      c6:	00279693          	slli	a3,a5,0x2
      ca:	00000297          	auipc	t0,0x0
      ce:	9696                	add	a3,a3,t0
      d0:	8286                	mv	t0,ra
      d2:	fa8680e7          	jalr	-88(a3)
      d6:	8096                	mv	ra,t0
      d8:	17c1                	addi	a5,a5,-16
      da:	8f1d                	sub	a4,a4,a5
      dc:	963e                	add	a2,a2,a5
      de:	f8c374e3          	bleu	a2,t1,66 <memset+0x2a>
      e2:	b7a5                	j	4a <memset+0xe>

000000e4 <strcmp>:
      e4:	00b56733          	or	a4,a0,a1
      e8:	53fd                	li	t2,-1
      ea:	8b0d                	andi	a4,a4,3
      ec:	e779                	bnez	a4,1ba <strcmp+0xd6>
      ee:	7f7f87b7          	lui	a5,0x7f7f8
      f2:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <__heap_end+0x5f777f7f>
      f6:	4110                	lw	a2,0(a0)
      f8:	4194                	lw	a3,0(a1)
      fa:	00f672b3          	and	t0,a2,a5
      fe:	00f66333          	or	t1,a2,a5
     102:	92be                	add	t0,t0,a5
     104:	0062e2b3          	or	t0,t0,t1
     108:	0c729763          	bne	t0,t2,1d6 <strcmp+0xf2>
     10c:	06d61863          	bne	a2,a3,17c <strcmp+0x98>
     110:	4150                	lw	a2,4(a0)
     112:	41d4                	lw	a3,4(a1)
     114:	00f672b3          	and	t0,a2,a5
     118:	00f66333          	or	t1,a2,a5
     11c:	92be                	add	t0,t0,a5
     11e:	0062e2b3          	or	t0,t0,t1
     122:	0a729863          	bne	t0,t2,1d2 <strcmp+0xee>
     126:	04d61b63          	bne	a2,a3,17c <strcmp+0x98>
     12a:	4510                	lw	a2,8(a0)
     12c:	4594                	lw	a3,8(a1)
     12e:	00f672b3          	and	t0,a2,a5
     132:	00f66333          	or	t1,a2,a5
     136:	92be                	add	t0,t0,a5
     138:	0062e2b3          	or	t0,t0,t1
     13c:	0a729163          	bne	t0,t2,1de <strcmp+0xfa>
     140:	02d61e63          	bne	a2,a3,17c <strcmp+0x98>
     144:	4550                	lw	a2,12(a0)
     146:	45d4                	lw	a3,12(a1)
     148:	00f672b3          	and	t0,a2,a5
     14c:	00f66333          	or	t1,a2,a5
     150:	92be                	add	t0,t0,a5
     152:	0062e2b3          	or	t0,t0,t1
     156:	08729a63          	bne	t0,t2,1ea <strcmp+0x106>
     15a:	02d61163          	bne	a2,a3,17c <strcmp+0x98>
     15e:	4910                	lw	a2,16(a0)
     160:	4994                	lw	a3,16(a1)
     162:	00f672b3          	and	t0,a2,a5
     166:	00f66333          	or	t1,a2,a5
     16a:	92be                	add	t0,t0,a5
     16c:	0062e2b3          	or	t0,t0,t1
     170:	08729363          	bne	t0,t2,1f6 <strcmp+0x112>
     174:	0551                	addi	a0,a0,20
     176:	05d1                	addi	a1,a1,20
     178:	f6d60fe3          	beq	a2,a3,f6 <strcmp+0x12>
     17c:	01061713          	slli	a4,a2,0x10
     180:	01069793          	slli	a5,a3,0x10
     184:	00f71c63          	bne	a4,a5,19c <strcmp+0xb8>
     188:	01065713          	srli	a4,a2,0x10
     18c:	0106d793          	srli	a5,a3,0x10
     190:	40f70533          	sub	a0,a4,a5
     194:	0ff57593          	andi	a1,a0,255
     198:	e991                	bnez	a1,1ac <strcmp+0xc8>
     19a:	8082                	ret
     19c:	8341                	srli	a4,a4,0x10
     19e:	83c1                	srli	a5,a5,0x10
     1a0:	40f70533          	sub	a0,a4,a5
     1a4:	0ff57593          	andi	a1,a0,255
     1a8:	e191                	bnez	a1,1ac <strcmp+0xc8>
     1aa:	8082                	ret
     1ac:	0ff77713          	andi	a4,a4,255
     1b0:	0ff7f793          	andi	a5,a5,255
     1b4:	40f70533          	sub	a0,a4,a5
     1b8:	8082                	ret
     1ba:	00054603          	lbu	a2,0(a0)
     1be:	0005c683          	lbu	a3,0(a1)
     1c2:	0505                	addi	a0,a0,1
     1c4:	0585                	addi	a1,a1,1
     1c6:	00d61363          	bne	a2,a3,1cc <strcmp+0xe8>
     1ca:	fa65                	bnez	a2,1ba <strcmp+0xd6>
     1cc:	40d60533          	sub	a0,a2,a3
     1d0:	8082                	ret
     1d2:	0511                	addi	a0,a0,4
     1d4:	0591                	addi	a1,a1,4
     1d6:	fed612e3          	bne	a2,a3,1ba <strcmp+0xd6>
     1da:	4501                	li	a0,0
     1dc:	8082                	ret
     1de:	0521                	addi	a0,a0,8
     1e0:	05a1                	addi	a1,a1,8
     1e2:	fcd61ce3          	bne	a2,a3,1ba <strcmp+0xd6>
     1e6:	4501                	li	a0,0
     1e8:	8082                	ret
     1ea:	0531                	addi	a0,a0,12
     1ec:	05b1                	addi	a1,a1,12
     1ee:	fcd616e3          	bne	a2,a3,1ba <strcmp+0xd6>
     1f2:	4501                	li	a0,0
     1f4:	8082                	ret
     1f6:	0541                	addi	a0,a0,16
     1f8:	05c1                	addi	a1,a1,16
     1fa:	fcd610e3          	bne	a2,a3,1ba <strcmp+0xd6>
     1fe:	4501                	li	a0,0
     200:	8082                	ret

00000202 <__udivdi3>:
     202:	1161                	addi	sp,sp,-8
     204:	c222                	sw	s0,4(sp)
     206:	c026                	sw	s1,0(sp)
     208:	87ae                	mv	a5,a1
     20a:	20069c63          	bnez	a3,422 <__udivdi3+0x220>
     20e:	83b6                	mv	t2,a3
     210:	668d                	lui	a3,0x3
     212:	8332                	mv	t1,a2
     214:	82aa                	mv	t0,a0
     216:	bc068693          	addi	a3,a3,-1088 # 2bc0 <__clz_tab>
     21a:	0ac5fd63          	bleu	a2,a1,2d4 <__udivdi3+0xd2>
     21e:	6741                	lui	a4,0x10
     220:	0ae67363          	bleu	a4,a2,2c6 <__udivdi3+0xc4>
     224:	0ff00713          	li	a4,255
     228:	00c73733          	sltu	a4,a4,a2
     22c:	070e                	slli	a4,a4,0x3
     22e:	00e653b3          	srl	t2,a2,a4
     232:	969e                	add	a3,a3,t2
     234:	0006c683          	lbu	a3,0(a3)
     238:	9736                	add	a4,a4,a3
     23a:	02000693          	li	a3,32
     23e:	8e99                	sub	a3,a3,a4
     240:	ca91                	beqz	a3,254 <__udivdi3+0x52>
     242:	00d795b3          	sll	a1,a5,a3
     246:	00e55733          	srl	a4,a0,a4
     24a:	00d61333          	sll	t1,a2,a3
     24e:	8dd9                	or	a1,a1,a4
     250:	00d512b3          	sll	t0,a0,a3
     254:	01035513          	srli	a0,t1,0x10
     258:	02a5f733          	remu	a4,a1,a0
     25c:	01031613          	slli	a2,t1,0x10
     260:	8241                	srli	a2,a2,0x10
     262:	0102d693          	srli	a3,t0,0x10
     266:	02a5d5b3          	divu	a1,a1,a0
     26a:	0742                	slli	a4,a4,0x10
     26c:	8ed9                	or	a3,a3,a4
     26e:	02b607b3          	mul	a5,a2,a1
     272:	872e                	mv	a4,a1
     274:	00f6fc63          	bleu	a5,a3,28c <__udivdi3+0x8a>
     278:	969a                	add	a3,a3,t1
     27a:	fff58713          	addi	a4,a1,-1
     27e:	0066e763          	bltu	a3,t1,28c <__udivdi3+0x8a>
     282:	00f6f563          	bleu	a5,a3,28c <__udivdi3+0x8a>
     286:	ffe58713          	addi	a4,a1,-2
     28a:	969a                	add	a3,a3,t1
     28c:	8e9d                	sub	a3,a3,a5
     28e:	02a6f7b3          	remu	a5,a3,a0
     292:	02c2                	slli	t0,t0,0x10
     294:	0102d293          	srli	t0,t0,0x10
     298:	02a6d6b3          	divu	a3,a3,a0
     29c:	07c2                	slli	a5,a5,0x10
     29e:	0057e2b3          	or	t0,a5,t0
     2a2:	02d60633          	mul	a2,a2,a3
     2a6:	8536                	mv	a0,a3
     2a8:	00c2fb63          	bleu	a2,t0,2be <__udivdi3+0xbc>
     2ac:	929a                	add	t0,t0,t1
     2ae:	fff68513          	addi	a0,a3,-1
     2b2:	0062e663          	bltu	t0,t1,2be <__udivdi3+0xbc>
     2b6:	00c2f463          	bleu	a2,t0,2be <__udivdi3+0xbc>
     2ba:	ffe68513          	addi	a0,a3,-2
     2be:	0742                	slli	a4,a4,0x10
     2c0:	8f49                	or	a4,a4,a0
     2c2:	4581                	li	a1,0
     2c4:	a85d                	j	37a <__udivdi3+0x178>
     2c6:	010003b7          	lui	t2,0x1000
     2ca:	4741                	li	a4,16
     2cc:	f67661e3          	bltu	a2,t2,22e <__udivdi3+0x2c>
     2d0:	4761                	li	a4,24
     2d2:	bfb1                	j	22e <__udivdi3+0x2c>
     2d4:	e601                	bnez	a2,2dc <__udivdi3+0xda>
     2d6:	4705                	li	a4,1
     2d8:	02c75333          	divu	t1,a4,a2
     2dc:	6741                	lui	a4,0x10
     2de:	0ae37363          	bleu	a4,t1,384 <__udivdi3+0x182>
     2e2:	0ff00713          	li	a4,255
     2e6:	00677363          	bleu	t1,a4,2ec <__udivdi3+0xea>
     2ea:	43a1                	li	t2,8
     2ec:	00735733          	srl	a4,t1,t2
     2f0:	96ba                	add	a3,a3,a4
     2f2:	0006c703          	lbu	a4,0(a3)
     2f6:	971e                	add	a4,a4,t2
     2f8:	02000393          	li	t2,32
     2fc:	40e383b3          	sub	t2,t2,a4
     300:	08039963          	bnez	t2,392 <__udivdi3+0x190>
     304:	406787b3          	sub	a5,a5,t1
     308:	4585                	li	a1,1
     30a:	01035413          	srli	s0,t1,0x10
     30e:	01031393          	slli	t2,t1,0x10
     312:	0103d393          	srli	t2,t2,0x10
     316:	0102d693          	srli	a3,t0,0x10
     31a:	0287f733          	remu	a4,a5,s0
     31e:	0287d7b3          	divu	a5,a5,s0
     322:	0742                	slli	a4,a4,0x10
     324:	8ed9                	or	a3,a3,a4
     326:	02f38633          	mul	a2,t2,a5
     32a:	873e                	mv	a4,a5
     32c:	00c6fc63          	bleu	a2,a3,344 <__udivdi3+0x142>
     330:	969a                	add	a3,a3,t1
     332:	fff78713          	addi	a4,a5,-1
     336:	0066e763          	bltu	a3,t1,344 <__udivdi3+0x142>
     33a:	00c6f563          	bleu	a2,a3,344 <__udivdi3+0x142>
     33e:	ffe78713          	addi	a4,a5,-2
     342:	969a                	add	a3,a3,t1
     344:	8e91                	sub	a3,a3,a2
     346:	0286f7b3          	remu	a5,a3,s0
     34a:	02c2                	slli	t0,t0,0x10
     34c:	0102d293          	srli	t0,t0,0x10
     350:	0286d6b3          	divu	a3,a3,s0
     354:	07c2                	slli	a5,a5,0x10
     356:	0057e2b3          	or	t0,a5,t0
     35a:	02d383b3          	mul	t2,t2,a3
     35e:	8536                	mv	a0,a3
     360:	0072fb63          	bleu	t2,t0,376 <__udivdi3+0x174>
     364:	929a                	add	t0,t0,t1
     366:	fff68513          	addi	a0,a3,-1
     36a:	0062e663          	bltu	t0,t1,376 <__udivdi3+0x174>
     36e:	0072f463          	bleu	t2,t0,376 <__udivdi3+0x174>
     372:	ffe68513          	addi	a0,a3,-2
     376:	0742                	slli	a4,a4,0x10
     378:	8f49                	or	a4,a4,a0
     37a:	853a                	mv	a0,a4
     37c:	4412                	lw	s0,4(sp)
     37e:	4482                	lw	s1,0(sp)
     380:	0121                	addi	sp,sp,8
     382:	8082                	ret
     384:	01000737          	lui	a4,0x1000
     388:	43c1                	li	t2,16
     38a:	f6e361e3          	bltu	t1,a4,2ec <__udivdi3+0xea>
     38e:	43e1                	li	t2,24
     390:	bfb1                	j	2ec <__udivdi3+0xea>
     392:	00731333          	sll	t1,t1,t2
     396:	00e7d6b3          	srl	a3,a5,a4
     39a:	01035593          	srli	a1,t1,0x10
     39e:	007797b3          	sll	a5,a5,t2
     3a2:	007512b3          	sll	t0,a0,t2
     3a6:	02b6d3b3          	divu	t2,a3,a1
     3aa:	00e55733          	srl	a4,a0,a4
     3ae:	00f76633          	or	a2,a4,a5
     3b2:	01031793          	slli	a5,t1,0x10
     3b6:	83c1                	srli	a5,a5,0x10
     3b8:	01065513          	srli	a0,a2,0x10
     3bc:	02b6f733          	remu	a4,a3,a1
     3c0:	027786b3          	mul	a3,a5,t2
     3c4:	0742                	slli	a4,a4,0x10
     3c6:	8f49                	or	a4,a4,a0
     3c8:	851e                	mv	a0,t2
     3ca:	00d77c63          	bleu	a3,a4,3e2 <__udivdi3+0x1e0>
     3ce:	971a                	add	a4,a4,t1
     3d0:	fff38513          	addi	a0,t2,-1 # ffffff <__erodata+0xffcccb>
     3d4:	00676763          	bltu	a4,t1,3e2 <__udivdi3+0x1e0>
     3d8:	00d77563          	bleu	a3,a4,3e2 <__udivdi3+0x1e0>
     3dc:	ffe38513          	addi	a0,t2,-2
     3e0:	971a                	add	a4,a4,t1
     3e2:	40d706b3          	sub	a3,a4,a3
     3e6:	02b6f733          	remu	a4,a3,a1
     3ea:	02b6d6b3          	divu	a3,a3,a1
     3ee:	0742                	slli	a4,a4,0x10
     3f0:	02d783b3          	mul	t2,a5,a3
     3f4:	01061793          	slli	a5,a2,0x10
     3f8:	83c1                	srli	a5,a5,0x10
     3fa:	8fd9                	or	a5,a5,a4
     3fc:	8736                	mv	a4,a3
     3fe:	0077fc63          	bleu	t2,a5,416 <__udivdi3+0x214>
     402:	979a                	add	a5,a5,t1
     404:	fff68713          	addi	a4,a3,-1
     408:	0067e763          	bltu	a5,t1,416 <__udivdi3+0x214>
     40c:	0077f563          	bleu	t2,a5,416 <__udivdi3+0x214>
     410:	ffe68713          	addi	a4,a3,-2
     414:	979a                	add	a5,a5,t1
     416:	01051593          	slli	a1,a0,0x10
     41a:	407787b3          	sub	a5,a5,t2
     41e:	8dd9                	or	a1,a1,a4
     420:	b5ed                	j	30a <__udivdi3+0x108>
     422:	12d5ef63          	bltu	a1,a3,560 <__udivdi3+0x35e>
     426:	6741                	lui	a4,0x10
     428:	02e6fc63          	bleu	a4,a3,460 <__udivdi3+0x25e>
     42c:	0ff00713          	li	a4,255
     430:	00d73733          	sltu	a4,a4,a3
     434:	070e                	slli	a4,a4,0x3
     436:	630d                	lui	t1,0x3
     438:	00e6d5b3          	srl	a1,a3,a4
     43c:	bc030313          	addi	t1,t1,-1088 # 2bc0 <__clz_tab>
     440:	959a                	add	a1,a1,t1
     442:	0005c583          	lbu	a1,0(a1)
     446:	972e                	add	a4,a4,a1
     448:	02000593          	li	a1,32
     44c:	8d99                	sub	a1,a1,a4
     44e:	e185                	bnez	a1,46e <__udivdi3+0x26c>
     450:	4705                	li	a4,1
     452:	f2f6e4e3          	bltu	a3,a5,37a <__udivdi3+0x178>
     456:	00c53633          	sltu	a2,a0,a2
     45a:	00164713          	xori	a4,a2,1
     45e:	bf31                	j	37a <__udivdi3+0x178>
     460:	010005b7          	lui	a1,0x1000
     464:	4741                	li	a4,16
     466:	fcb6e8e3          	bltu	a3,a1,436 <__udivdi3+0x234>
     46a:	4761                	li	a4,24
     46c:	b7e9                	j	436 <__udivdi3+0x234>
     46e:	00e65333          	srl	t1,a2,a4
     472:	00b696b3          	sll	a3,a3,a1
     476:	00d366b3          	or	a3,t1,a3
     47a:	00e7d3b3          	srl	t2,a5,a4
     47e:	0106d413          	srli	s0,a3,0x10
     482:	0283f2b3          	remu	t0,t2,s0
     486:	00e55733          	srl	a4,a0,a4
     48a:	00b797b3          	sll	a5,a5,a1
     48e:	8fd9                	or	a5,a5,a4
     490:	01069713          	slli	a4,a3,0x10
     494:	8341                	srli	a4,a4,0x10
     496:	0107d313          	srli	t1,a5,0x10
     49a:	00b61633          	sll	a2,a2,a1
     49e:	0283d3b3          	divu	t2,t2,s0
     4a2:	02c2                	slli	t0,t0,0x10
     4a4:	0062e2b3          	or	t0,t0,t1
     4a8:	027704b3          	mul	s1,a4,t2
     4ac:	831e                	mv	t1,t2
     4ae:	0092fc63          	bleu	s1,t0,4c6 <__udivdi3+0x2c4>
     4b2:	92b6                	add	t0,t0,a3
     4b4:	fff38313          	addi	t1,t2,-1
     4b8:	00d2e763          	bltu	t0,a3,4c6 <__udivdi3+0x2c4>
     4bc:	0092f563          	bleu	s1,t0,4c6 <__udivdi3+0x2c4>
     4c0:	ffe38313          	addi	t1,t2,-2
     4c4:	92b6                	add	t0,t0,a3
     4c6:	409282b3          	sub	t0,t0,s1
     4ca:	0282f3b3          	remu	t2,t0,s0
     4ce:	07c2                	slli	a5,a5,0x10
     4d0:	83c1                	srli	a5,a5,0x10
     4d2:	0282d2b3          	divu	t0,t0,s0
     4d6:	03c2                	slli	t2,t2,0x10
     4d8:	00f3e7b3          	or	a5,t2,a5
     4dc:	02570733          	mul	a4,a4,t0
     4e0:	8396                	mv	t2,t0
     4e2:	00e7fc63          	bleu	a4,a5,4fa <__udivdi3+0x2f8>
     4e6:	97b6                	add	a5,a5,a3
     4e8:	fff28393          	addi	t2,t0,-1 # c9 <memset+0x8d>
     4ec:	00d7e763          	bltu	a5,a3,4fa <__udivdi3+0x2f8>
     4f0:	00e7f563          	bleu	a4,a5,4fa <__udivdi3+0x2f8>
     4f4:	ffe28393          	addi	t2,t0,-2
     4f8:	97b6                	add	a5,a5,a3
     4fa:	8f99                	sub	a5,a5,a4
     4fc:	01031713          	slli	a4,t1,0x10
     500:	00776733          	or	a4,a4,t2
     504:	63c1                	lui	t2,0x10
     506:	fff38313          	addi	t1,t2,-1 # ffff <__erodata+0xcccb>
     50a:	006776b3          	and	a3,a4,t1
     50e:	01075413          	srli	s0,a4,0x10
     512:	00667333          	and	t1,a2,t1
     516:	8241                	srli	a2,a2,0x10
     518:	026682b3          	mul	t0,a3,t1
     51c:	02640333          	mul	t1,s0,t1
     520:	02c40433          	mul	s0,s0,a2
     524:	02c68633          	mul	a2,a3,a2
     528:	0102d693          	srli	a3,t0,0x10
     52c:	961a                	add	a2,a2,t1
     52e:	96b2                	add	a3,a3,a2
     530:	0066f363          	bleu	t1,a3,536 <__udivdi3+0x334>
     534:	941e                	add	s0,s0,t2
     536:	0106d613          	srli	a2,a3,0x10
     53a:	9432                	add	s0,s0,a2
     53c:	0287e063          	bltu	a5,s0,55c <__udivdi3+0x35a>
     540:	d88791e3          	bne	a5,s0,2c2 <__udivdi3+0xc0>
     544:	67c1                	lui	a5,0x10
     546:	17fd                	addi	a5,a5,-1
     548:	8efd                	and	a3,a3,a5
     54a:	06c2                	slli	a3,a3,0x10
     54c:	00f2f2b3          	and	t0,t0,a5
     550:	00b51533          	sll	a0,a0,a1
     554:	9696                	add	a3,a3,t0
     556:	4581                	li	a1,0
     558:	e2d571e3          	bleu	a3,a0,37a <__udivdi3+0x178>
     55c:	177d                	addi	a4,a4,-1
     55e:	b395                	j	2c2 <__udivdi3+0xc0>
     560:	4581                	li	a1,0
     562:	4701                	li	a4,0
     564:	bd19                	j	37a <__udivdi3+0x178>

00000566 <__divdf3>:
     566:	fdc10113          	addi	sp,sp,-36
     56a:	872a                	mv	a4,a0
     56c:	832a                	mv	t1,a0
     56e:	01f5d793          	srli	a5,a1,0x1f
     572:	0145d513          	srli	a0,a1,0x14
     576:	cc26                	sw	s1,24(sp)
     578:	d006                	sw	ra,32(sp)
     57a:	00c59493          	slli	s1,a1,0xc
     57e:	ce22                	sw	s0,28(sp)
     580:	7ff57513          	andi	a0,a0,2047
     584:	c43e                	sw	a5,8(sp)
     586:	80b1                	srli	s1,s1,0xc
     588:	c551                	beqz	a0,614 <__divdf3+0xae>
     58a:	7ff00593          	li	a1,2047
     58e:	0eb50563          	beq	a0,a1,678 <__divdf3+0x112>
     592:	00349793          	slli	a5,s1,0x3
     596:	01d75413          	srli	s0,a4,0x1d
     59a:	8c5d                	or	s0,s0,a5
     59c:	008007b7          	lui	a5,0x800
     5a0:	8c5d                	or	s0,s0,a5
     5a2:	00371313          	slli	t1,a4,0x3
     5a6:	c0150493          	addi	s1,a0,-1023
     5aa:	4381                	li	t2,0
     5ac:	0146d513          	srli	a0,a3,0x14
     5b0:	01f6d713          	srli	a4,a3,0x1f
     5b4:	00c69293          	slli	t0,a3,0xc
     5b8:	7ff57513          	andi	a0,a0,2047
     5bc:	c63a                	sw	a4,12(sp)
     5be:	87b2                	mv	a5,a2
     5c0:	00c2d293          	srli	t0,t0,0xc
     5c4:	c979                	beqz	a0,69a <__divdf3+0x134>
     5c6:	7ff00713          	li	a4,2047
     5ca:	14e50263          	beq	a0,a4,70e <__divdf3+0x1a8>
     5ce:	01d65713          	srli	a4,a2,0x1d
     5d2:	028e                	slli	t0,t0,0x3
     5d4:	005762b3          	or	t0,a4,t0
     5d8:	00800737          	lui	a4,0x800
     5dc:	00e2e733          	or	a4,t0,a4
     5e0:	00361793          	slli	a5,a2,0x3
     5e4:	c0150513          	addi	a0,a0,-1023
     5e8:	4681                	li	a3,0
     5ea:	45b2                	lw	a1,12(sp)
     5ec:	4622                	lw	a2,8(sp)
     5ee:	8e2d                	xor	a2,a2,a1
     5f0:	c032                	sw	a2,0(sp)
     5f2:	40a48633          	sub	a2,s1,a0
     5f6:	c232                	sw	a2,4(sp)
     5f8:	00239613          	slli	a2,t2,0x2
     5fc:	8e55                	or	a2,a2,a3
     5fe:	167d                	addi	a2,a2,-1
     600:	45b9                	li	a1,14
     602:	12c5e763          	bltu	a1,a2,730 <__divdf3+0x1ca>
     606:	658d                	lui	a1,0x3
     608:	060a                	slli	a2,a2,0x2
     60a:	ad058593          	addi	a1,a1,-1328 # 2ad0 <__etext>
     60e:	962e                	add	a2,a2,a1
     610:	4210                	lw	a2,0(a2)
     612:	8602                	jr	a2
     614:	00e4e433          	or	s0,s1,a4
     618:	c825                	beqz	s0,688 <__divdf3+0x122>
     61a:	c636                	sw	a3,12(sp)
     61c:	c232                	sw	a2,4(sp)
     61e:	cc8d                	beqz	s1,658 <__divdf3+0xf2>
     620:	8526                	mv	a0,s1
     622:	c03a                	sw	a4,0(sp)
     624:	0a4010ef          	jal	ra,16c8 <__clzsi2>
     628:	4702                	lw	a4,0(sp)
     62a:	4612                	lw	a2,4(sp)
     62c:	46b2                	lw	a3,12(sp)
     62e:	ff550593          	addi	a1,a0,-11
     632:	4371                	li	t1,28
     634:	02b34c63          	blt	t1,a1,66c <__divdf3+0x106>
     638:	4475                	li	s0,29
     63a:	ff850313          	addi	t1,a0,-8
     63e:	8c0d                	sub	s0,s0,a1
     640:	006497b3          	sll	a5,s1,t1
     644:	00875433          	srl	s0,a4,s0
     648:	8c5d                	or	s0,s0,a5
     64a:	00671333          	sll	t1,a4,t1
     64e:	c0d00593          	li	a1,-1011
     652:	40a584b3          	sub	s1,a1,a0
     656:	bf91                	j	5aa <__divdf3+0x44>
     658:	853a                	mv	a0,a4
     65a:	c03a                	sw	a4,0(sp)
     65c:	06c010ef          	jal	ra,16c8 <__clzsi2>
     660:	02050513          	addi	a0,a0,32
     664:	46b2                	lw	a3,12(sp)
     666:	4612                	lw	a2,4(sp)
     668:	4702                	lw	a4,0(sp)
     66a:	b7d1                	j	62e <__divdf3+0xc8>
     66c:	fd850413          	addi	s0,a0,-40
     670:	00871433          	sll	s0,a4,s0
     674:	4301                	li	t1,0
     676:	bfe1                	j	64e <__divdf3+0xe8>
     678:	00e4e433          	or	s0,s1,a4
     67c:	c811                	beqz	s0,690 <__divdf3+0x12a>
     67e:	8426                	mv	s0,s1
     680:	438d                	li	t2,3
     682:	7ff00493          	li	s1,2047
     686:	b71d                	j	5ac <__divdf3+0x46>
     688:	4301                	li	t1,0
     68a:	4481                	li	s1,0
     68c:	4385                	li	t2,1
     68e:	bf39                	j	5ac <__divdf3+0x46>
     690:	4301                	li	t1,0
     692:	7ff00493          	li	s1,2047
     696:	4389                	li	t2,2
     698:	bf11                	j	5ac <__divdf3+0x46>
     69a:	00c2e733          	or	a4,t0,a2
     69e:	c341                	beqz	a4,71e <__divdf3+0x1b8>
     6a0:	04028363          	beqz	t0,6e6 <__divdf3+0x180>
     6a4:	8516                	mv	a0,t0
     6a6:	ca32                	sw	a2,20(sp)
     6a8:	c81e                	sw	t2,16(sp)
     6aa:	c21a                	sw	t1,4(sp)
     6ac:	c016                	sw	t0,0(sp)
     6ae:	01a010ef          	jal	ra,16c8 <__clzsi2>
     6b2:	4282                	lw	t0,0(sp)
     6b4:	4312                	lw	t1,4(sp)
     6b6:	43c2                	lw	t2,16(sp)
     6b8:	4652                	lw	a2,20(sp)
     6ba:	ff550693          	addi	a3,a0,-11
     6be:	47f1                	li	a5,28
     6c0:	04d7c163          	blt	a5,a3,702 <__divdf3+0x19c>
     6c4:	4775                	li	a4,29
     6c6:	ff850793          	addi	a5,a0,-8
     6ca:	8f15                	sub	a4,a4,a3
     6cc:	00f292b3          	sll	t0,t0,a5
     6d0:	00e65733          	srl	a4,a2,a4
     6d4:	00576733          	or	a4,a4,t0
     6d8:	00f617b3          	sll	a5,a2,a5
     6dc:	c0d00693          	li	a3,-1011
     6e0:	40a68533          	sub	a0,a3,a0
     6e4:	b711                	j	5e8 <__divdf3+0x82>
     6e6:	8532                	mv	a0,a2
     6e8:	ca16                	sw	t0,20(sp)
     6ea:	c81e                	sw	t2,16(sp)
     6ec:	c21a                	sw	t1,4(sp)
     6ee:	c032                	sw	a2,0(sp)
     6f0:	7d9000ef          	jal	ra,16c8 <__clzsi2>
     6f4:	02050513          	addi	a0,a0,32
     6f8:	42d2                	lw	t0,20(sp)
     6fa:	43c2                	lw	t2,16(sp)
     6fc:	4312                	lw	t1,4(sp)
     6fe:	4602                	lw	a2,0(sp)
     700:	bf6d                	j	6ba <__divdf3+0x154>
     702:	fd850293          	addi	t0,a0,-40
     706:	00561733          	sll	a4,a2,t0
     70a:	4781                	li	a5,0
     70c:	bfc1                	j	6dc <__divdf3+0x176>
     70e:	00c2e733          	or	a4,t0,a2
     712:	cb11                	beqz	a4,726 <__divdf3+0x1c0>
     714:	8716                	mv	a4,t0
     716:	7ff00513          	li	a0,2047
     71a:	468d                	li	a3,3
     71c:	b5f9                	j	5ea <__divdf3+0x84>
     71e:	4781                	li	a5,0
     720:	4501                	li	a0,0
     722:	4685                	li	a3,1
     724:	b5d9                	j	5ea <__divdf3+0x84>
     726:	4781                	li	a5,0
     728:	7ff00513          	li	a0,2047
     72c:	4689                	li	a3,2
     72e:	bd75                	j	5ea <__divdf3+0x84>
     730:	00876663          	bltu	a4,s0,73c <__divdf3+0x1d6>
     734:	2ce41563          	bne	s0,a4,9fe <__divdf3+0x498>
     738:	2cf36363          	bltu	t1,a5,9fe <__divdf3+0x498>
     73c:	01f41593          	slli	a1,s0,0x1f
     740:	00135693          	srli	a3,t1,0x1
     744:	01f31613          	slli	a2,t1,0x1f
     748:	8005                	srli	s0,s0,0x1
     74a:	00d5e333          	or	t1,a1,a3
     74e:	00871293          	slli	t0,a4,0x8
     752:	0187d713          	srli	a4,a5,0x18
     756:	005762b3          	or	t0,a4,t0
     75a:	0102d493          	srli	s1,t0,0x10
     75e:	02945733          	divu	a4,s0,s1
     762:	00879693          	slli	a3,a5,0x8
     766:	01029793          	slli	a5,t0,0x10
     76a:	83c1                	srli	a5,a5,0x10
     76c:	c43e                	sw	a5,8(sp)
     76e:	01035593          	srli	a1,t1,0x10
     772:	02947433          	remu	s0,s0,s1
     776:	02e787b3          	mul	a5,a5,a4
     77a:	0442                	slli	s0,s0,0x10
     77c:	8c4d                	or	s0,s0,a1
     77e:	85ba                	mv	a1,a4
     780:	00f47c63          	bleu	a5,s0,798 <__divdf3+0x232>
     784:	9416                	add	s0,s0,t0
     786:	fff70593          	addi	a1,a4,-1 # 7fffff <__erodata+0x7fcccb>
     78a:	00546763          	bltu	s0,t0,798 <__divdf3+0x232>
     78e:	00f47563          	bleu	a5,s0,798 <__divdf3+0x232>
     792:	ffe70593          	addi	a1,a4,-2
     796:	9416                	add	s0,s0,t0
     798:	40f407b3          	sub	a5,s0,a5
     79c:	0297d533          	divu	a0,a5,s1
     7a0:	01029713          	slli	a4,t0,0x10
     7a4:	8341                	srli	a4,a4,0x10
     7a6:	0342                	slli	t1,t1,0x10
     7a8:	01035313          	srli	t1,t1,0x10
     7ac:	0297f7b3          	remu	a5,a5,s1
     7b0:	83aa                	mv	t2,a0
     7b2:	02a70733          	mul	a4,a4,a0
     7b6:	07c2                	slli	a5,a5,0x10
     7b8:	00f36333          	or	t1,t1,a5
     7bc:	00e37c63          	bleu	a4,t1,7d4 <__divdf3+0x26e>
     7c0:	9316                	add	t1,t1,t0
     7c2:	fff50393          	addi	t2,a0,-1
     7c6:	00536763          	bltu	t1,t0,7d4 <__divdf3+0x26e>
     7ca:	00e37563          	bleu	a4,t1,7d4 <__divdf3+0x26e>
     7ce:	ffe50393          	addi	t2,a0,-2
     7d2:	9316                	add	t1,t1,t0
     7d4:	05c2                	slli	a1,a1,0x10
     7d6:	6441                	lui	s0,0x10
     7d8:	0075e5b3          	or	a1,a1,t2
     7dc:	fff40793          	addi	a5,s0,-1 # ffff <__erodata+0xcccb>
     7e0:	00f5f533          	and	a0,a1,a5
     7e4:	40e30333          	sub	t1,t1,a4
     7e8:	8ff5                	and	a5,a5,a3
     7ea:	0105d713          	srli	a4,a1,0x10
     7ee:	02f503b3          	mul	t2,a0,a5
     7f2:	c43e                	sw	a5,8(sp)
     7f4:	02f707b3          	mul	a5,a4,a5
     7f8:	c63e                	sw	a5,12(sp)
     7fa:	0106d793          	srli	a5,a3,0x10
     7fe:	02a78533          	mul	a0,a5,a0
     802:	02f70733          	mul	a4,a4,a5
     806:	47b2                	lw	a5,12(sp)
     808:	953e                	add	a0,a0,a5
     80a:	0103d793          	srli	a5,t2,0x10
     80e:	97aa                	add	a5,a5,a0
     810:	4532                	lw	a0,12(sp)
     812:	00a7f363          	bleu	a0,a5,818 <__divdf3+0x2b2>
     816:	9722                	add	a4,a4,s0
     818:	0107d413          	srli	s0,a5,0x10
     81c:	943a                	add	s0,s0,a4
     81e:	6741                	lui	a4,0x10
     820:	177d                	addi	a4,a4,-1
     822:	8ff9                	and	a5,a5,a4
     824:	07c2                	slli	a5,a5,0x10
     826:	00e3f3b3          	and	t2,t2,a4
     82a:	93be                	add	t2,t2,a5
     82c:	00836763          	bltu	t1,s0,83a <__divdf3+0x2d4>
     830:	872e                	mv	a4,a1
     832:	02831e63          	bne	t1,s0,86e <__divdf3+0x308>
     836:	02767c63          	bleu	t2,a2,86e <__divdf3+0x308>
     83a:	9636                	add	a2,a2,a3
     83c:	00d637b3          	sltu	a5,a2,a3
     840:	9796                	add	a5,a5,t0
     842:	933e                	add	t1,t1,a5
     844:	fff58713          	addi	a4,a1,-1
     848:	0062e663          	bltu	t0,t1,854 <__divdf3+0x2ee>
     84c:	02629163          	bne	t0,t1,86e <__divdf3+0x308>
     850:	00d66f63          	bltu	a2,a3,86e <__divdf3+0x308>
     854:	00836663          	bltu	t1,s0,860 <__divdf3+0x2fa>
     858:	00641b63          	bne	s0,t1,86e <__divdf3+0x308>
     85c:	00767963          	bleu	t2,a2,86e <__divdf3+0x308>
     860:	9636                	add	a2,a2,a3
     862:	00d637b3          	sltu	a5,a2,a3
     866:	9796                	add	a5,a5,t0
     868:	ffe58713          	addi	a4,a1,-2
     86c:	933e                	add	t1,t1,a5
     86e:	407603b3          	sub	t2,a2,t2
     872:	40830333          	sub	t1,t1,s0
     876:	00763633          	sltu	a2,a2,t2
     87a:	40c30633          	sub	a2,t1,a2
     87e:	57fd                	li	a5,-1
     880:	10c28263          	beq	t0,a2,984 <__divdf3+0x41e>
     884:	02965533          	divu	a0,a2,s1
     888:	01029793          	slli	a5,t0,0x10
     88c:	83c1                	srli	a5,a5,0x10
     88e:	0103d593          	srli	a1,t2,0x10
     892:	02967633          	remu	a2,a2,s1
     896:	02a787b3          	mul	a5,a5,a0
     89a:	0642                	slli	a2,a2,0x10
     89c:	8e4d                	or	a2,a2,a1
     89e:	85aa                	mv	a1,a0
     8a0:	00f67c63          	bleu	a5,a2,8b8 <__divdf3+0x352>
     8a4:	9616                	add	a2,a2,t0
     8a6:	fff50593          	addi	a1,a0,-1
     8aa:	00566763          	bltu	a2,t0,8b8 <__divdf3+0x352>
     8ae:	00f67563          	bleu	a5,a2,8b8 <__divdf3+0x352>
     8b2:	ffe50593          	addi	a1,a0,-2
     8b6:	9616                	add	a2,a2,t0
     8b8:	8e1d                	sub	a2,a2,a5
     8ba:	02965333          	divu	t1,a2,s1
     8be:	01029793          	slli	a5,t0,0x10
     8c2:	83c1                	srli	a5,a5,0x10
     8c4:	03c2                	slli	t2,t2,0x10
     8c6:	0103d393          	srli	t2,t2,0x10
     8ca:	02967633          	remu	a2,a2,s1
     8ce:	841a                	mv	s0,t1
     8d0:	02678533          	mul	a0,a5,t1
     8d4:	01061793          	slli	a5,a2,0x10
     8d8:	00f3e633          	or	a2,t2,a5
     8dc:	00a67c63          	bleu	a0,a2,8f4 <__divdf3+0x38e>
     8e0:	9616                	add	a2,a2,t0
     8e2:	fff30413          	addi	s0,t1,-1
     8e6:	00566763          	bltu	a2,t0,8f4 <__divdf3+0x38e>
     8ea:	00a67563          	bleu	a0,a2,8f4 <__divdf3+0x38e>
     8ee:	ffe30413          	addi	s0,t1,-2
     8f2:	9616                	add	a2,a2,t0
     8f4:	01059793          	slli	a5,a1,0x10
     8f8:	8fc1                	or	a5,a5,s0
     8fa:	4422                	lw	s0,8(sp)
     8fc:	8e09                	sub	a2,a2,a0
     8fe:	4522                	lw	a0,8(sp)
     900:	0107d393          	srli	t2,a5,0x10
     904:	01079593          	slli	a1,a5,0x10
     908:	02838333          	mul	t1,t2,s0
     90c:	81c1                	srli	a1,a1,0x10
     90e:	0106d413          	srli	s0,a3,0x10
     912:	02a58533          	mul	a0,a1,a0
     916:	02b405b3          	mul	a1,s0,a1
     91a:	027403b3          	mul	t2,s0,t2
     91e:	959a                	add	a1,a1,t1
     920:	01055413          	srli	s0,a0,0x10
     924:	95a2                	add	a1,a1,s0
     926:	0065f463          	bleu	t1,a1,92e <__divdf3+0x3c8>
     92a:	6341                	lui	t1,0x10
     92c:	939a                	add	t2,t2,t1
     92e:	0105d313          	srli	t1,a1,0x10
     932:	939a                	add	t2,t2,t1
     934:	6341                	lui	t1,0x10
     936:	137d                	addi	t1,t1,-1
     938:	0065f5b3          	and	a1,a1,t1
     93c:	05c2                	slli	a1,a1,0x10
     93e:	00657533          	and	a0,a0,t1
     942:	952e                	add	a0,a0,a1
     944:	00766563          	bltu	a2,t2,94e <__divdf3+0x3e8>
     948:	1a761263          	bne	a2,t2,aec <__divdf3+0x586>
     94c:	cd05                	beqz	a0,984 <__divdf3+0x41e>
     94e:	9616                	add	a2,a2,t0
     950:	fff78593          	addi	a1,a5,-1 # 7fffff <__erodata+0x7fcccb>
     954:	02566163          	bltu	a2,t0,976 <__divdf3+0x410>
     958:	00766663          	bltu	a2,t2,964 <__divdf3+0x3fe>
     95c:	18761763          	bne	a2,t2,aea <__divdf3+0x584>
     960:	00a6fd63          	bleu	a0,a3,97a <__divdf3+0x414>
     964:	ffe78593          	addi	a1,a5,-2
     968:	00169793          	slli	a5,a3,0x1
     96c:	00d7b6b3          	sltu	a3,a5,a3
     970:	92b6                	add	t0,t0,a3
     972:	9616                	add	a2,a2,t0
     974:	86be                	mv	a3,a5
     976:	00761563          	bne	a2,t2,980 <__divdf3+0x41a>
     97a:	87ae                	mv	a5,a1
     97c:	00d50463          	beq	a0,a3,984 <__divdf3+0x41e>
     980:	0015e793          	ori	a5,a1,1
     984:	4692                	lw	a3,4(sp)
     986:	3ff68613          	addi	a2,a3,1023
     98a:	0ac05963          	blez	a2,a3c <__divdf3+0x4d6>
     98e:	0077f693          	andi	a3,a5,7
     992:	ce81                	beqz	a3,9aa <__divdf3+0x444>
     994:	00f7f693          	andi	a3,a5,15
     998:	4591                	li	a1,4
     99a:	00b68863          	beq	a3,a1,9aa <__divdf3+0x444>
     99e:	00478693          	addi	a3,a5,4
     9a2:	00f6b7b3          	sltu	a5,a3,a5
     9a6:	973e                	add	a4,a4,a5
     9a8:	87b6                	mv	a5,a3
     9aa:	00771693          	slli	a3,a4,0x7
     9ae:	0006d963          	bgez	a3,9c0 <__divdf3+0x45a>
     9b2:	ff0006b7          	lui	a3,0xff000
     9b6:	16fd                	addi	a3,a3,-1
     9b8:	8f75                	and	a4,a4,a3
     9ba:	4692                	lw	a3,4(sp)
     9bc:	40068613          	addi	a2,a3,1024 # ff000400 <__heap_end+0xdef80400>
     9c0:	7fe00693          	li	a3,2046
     9c4:	10c6ca63          	blt	a3,a2,ad8 <__divdf3+0x572>
     9c8:	838d                	srli	a5,a5,0x3
     9ca:	01d71693          	slli	a3,a4,0x1d
     9ce:	8fd5                	or	a5,a5,a3
     9d0:	00375293          	srli	t0,a4,0x3
     9d4:	4702                	lw	a4,0(sp)
     9d6:	7ff67693          	andi	a3,a2,2047
     9da:	02b2                	slli	t0,t0,0xc
     9dc:	5082                	lw	ra,32(sp)
     9de:	4472                	lw	s0,28(sp)
     9e0:	06d2                	slli	a3,a3,0x14
     9e2:	00c2d293          	srli	t0,t0,0xc
     9e6:	01f71613          	slli	a2,a4,0x1f
     9ea:	00d2e2b3          	or	t0,t0,a3
     9ee:	00c2e733          	or	a4,t0,a2
     9f2:	44e2                	lw	s1,24(sp)
     9f4:	853e                	mv	a0,a5
     9f6:	85ba                	mv	a1,a4
     9f8:	02410113          	addi	sp,sp,36
     9fc:	8082                	ret
     9fe:	4692                	lw	a3,4(sp)
     a00:	4601                	li	a2,0
     a02:	16fd                	addi	a3,a3,-1
     a04:	c236                	sw	a3,4(sp)
     a06:	b3a1                	j	74e <__divdf3+0x1e8>
     a08:	47a2                	lw	a5,8(sp)
     a0a:	8722                	mv	a4,s0
     a0c:	869e                	mv	a3,t2
     a0e:	c03e                	sw	a5,0(sp)
     a10:	879a                	mv	a5,t1
     a12:	4609                	li	a2,2
     a14:	0cc68263          	beq	a3,a2,ad8 <__divdf3+0x572>
     a18:	460d                	li	a2,3
     a1a:	0ac68863          	beq	a3,a2,aca <__divdf3+0x564>
     a1e:	4605                	li	a2,1
     a20:	f6c692e3          	bne	a3,a2,984 <__divdf3+0x41e>
     a24:	4281                	li	t0,0
     a26:	4781                	li	a5,0
     a28:	a89d                	j	a9e <__divdf3+0x538>
     a2a:	4632                	lw	a2,12(sp)
     a2c:	c032                	sw	a2,0(sp)
     a2e:	b7d5                	j	a12 <__divdf3+0x4ac>
     a30:	00080737          	lui	a4,0x80
     a34:	4781                	li	a5,0
     a36:	c002                	sw	zero,0(sp)
     a38:	468d                	li	a3,3
     a3a:	bfe1                	j	a12 <__divdf3+0x4ac>
     a3c:	4285                	li	t0,1
     a3e:	40c282b3          	sub	t0,t0,a2
     a42:	03800693          	li	a3,56
     a46:	fc56cfe3          	blt	a3,t0,a24 <__divdf3+0x4be>
     a4a:	46fd                	li	a3,31
     a4c:	0456cb63          	blt	a3,t0,aa2 <__divdf3+0x53c>
     a50:	4692                	lw	a3,4(sp)
     a52:	0057d633          	srl	a2,a5,t0
     a56:	005752b3          	srl	t0,a4,t0
     a5a:	41e68593          	addi	a1,a3,1054
     a5e:	00b716b3          	sll	a3,a4,a1
     a62:	00b797b3          	sll	a5,a5,a1
     a66:	8ed1                	or	a3,a3,a2
     a68:	00f037b3          	snez	a5,a5
     a6c:	8fd5                	or	a5,a5,a3
     a6e:	0077f713          	andi	a4,a5,7
     a72:	cf01                	beqz	a4,a8a <__divdf3+0x524>
     a74:	00f7f713          	andi	a4,a5,15
     a78:	4691                	li	a3,4
     a7a:	00d70863          	beq	a4,a3,a8a <__divdf3+0x524>
     a7e:	00478713          	addi	a4,a5,4
     a82:	00f737b3          	sltu	a5,a4,a5
     a86:	92be                	add	t0,t0,a5
     a88:	87ba                	mv	a5,a4
     a8a:	00829713          	slli	a4,t0,0x8
     a8e:	04074a63          	bltz	a4,ae2 <__divdf3+0x57c>
     a92:	01d29713          	slli	a4,t0,0x1d
     a96:	838d                	srli	a5,a5,0x3
     a98:	8fd9                	or	a5,a5,a4
     a9a:	0032d293          	srli	t0,t0,0x3
     a9e:	4601                	li	a2,0
     aa0:	bf15                	j	9d4 <__divdf3+0x46e>
     aa2:	5685                	li	a3,-31
     aa4:	8e91                	sub	a3,a3,a2
     aa6:	02000613          	li	a2,32
     aaa:	00d756b3          	srl	a3,a4,a3
     aae:	4581                	li	a1,0
     ab0:	00c28763          	beq	t0,a2,abe <__divdf3+0x558>
     ab4:	4612                	lw	a2,4(sp)
     ab6:	43e60593          	addi	a1,a2,1086
     aba:	00b715b3          	sll	a1,a4,a1
     abe:	8fcd                	or	a5,a5,a1
     ac0:	00f037b3          	snez	a5,a5
     ac4:	8fd5                	or	a5,a5,a3
     ac6:	4281                	li	t0,0
     ac8:	b75d                	j	a6e <__divdf3+0x508>
     aca:	000802b7          	lui	t0,0x80
     ace:	4781                	li	a5,0
     ad0:	7ff00613          	li	a2,2047
     ad4:	c002                	sw	zero,0(sp)
     ad6:	bdfd                	j	9d4 <__divdf3+0x46e>
     ad8:	4281                	li	t0,0
     ada:	4781                	li	a5,0
     adc:	7ff00613          	li	a2,2047
     ae0:	bdd5                	j	9d4 <__divdf3+0x46e>
     ae2:	4281                	li	t0,0
     ae4:	4781                	li	a5,0
     ae6:	4605                	li	a2,1
     ae8:	b5f5                	j	9d4 <__divdf3+0x46e>
     aea:	87ae                	mv	a5,a1
     aec:	85be                	mv	a1,a5
     aee:	bd49                	j	980 <__divdf3+0x41a>

00000af0 <__muldf3>:
     af0:	fd810113          	addi	sp,sp,-40
     af4:	872a                	mv	a4,a0
     af6:	832a                	mv	t1,a0
     af8:	01f5d793          	srli	a5,a1,0x1f
     afc:	0145d513          	srli	a0,a1,0x14
     b00:	d022                	sw	s0,32(sp)
     b02:	ce26                	sw	s1,28(sp)
     b04:	d206                	sw	ra,36(sp)
     b06:	00c59493          	slli	s1,a1,0xc
     b0a:	7ff57513          	andi	a0,a0,2047
     b0e:	c43e                	sw	a5,8(sp)
     b10:	8436                	mv	s0,a3
     b12:	80b1                	srli	s1,s1,0xc
     b14:	c551                	beqz	a0,ba0 <__muldf3+0xb0>
     b16:	7ff00693          	li	a3,2047
     b1a:	0ed50363          	beq	a0,a3,c00 <__muldf3+0x110>
     b1e:	01d75693          	srli	a3,a4,0x1d
     b22:	00349793          	slli	a5,s1,0x3
     b26:	8fd5                	or	a5,a5,a3
     b28:	008006b7          	lui	a3,0x800
     b2c:	00d7e3b3          	or	t2,a5,a3
     b30:	00371313          	slli	t1,a4,0x3
     b34:	c0150593          	addi	a1,a0,-1023
     b38:	4481                	li	s1,0
     b3a:	01445513          	srli	a0,s0,0x14
     b3e:	00c41293          	slli	t0,s0,0xc
     b42:	7ff57513          	andi	a0,a0,2047
     b46:	8732                	mv	a4,a2
     b48:	00c2d293          	srli	t0,t0,0xc
     b4c:	807d                	srli	s0,s0,0x1f
     b4e:	c979                	beqz	a0,c24 <__muldf3+0x134>
     b50:	7ff00793          	li	a5,2047
     b54:	14f50663          	beq	a0,a5,ca0 <__muldf3+0x1b0>
     b58:	01d65793          	srli	a5,a2,0x1d
     b5c:	028e                	slli	t0,t0,0x3
     b5e:	0057e2b3          	or	t0,a5,t0
     b62:	008007b7          	lui	a5,0x800
     b66:	00f2e7b3          	or	a5,t0,a5
     b6a:	00361713          	slli	a4,a2,0x3
     b6e:	c0150513          	addi	a0,a0,-1023
     b72:	4681                	li	a3,0
     b74:	4622                	lw	a2,8(sp)
     b76:	8e21                	xor	a2,a2,s0
     b78:	c032                	sw	a2,0(sp)
     b7a:	00a58633          	add	a2,a1,a0
     b7e:	c632                	sw	a2,12(sp)
     b80:	0605                	addi	a2,a2,1
     b82:	c232                	sw	a2,4(sp)
     b84:	00249613          	slli	a2,s1,0x2
     b88:	8e55                	or	a2,a2,a3
     b8a:	167d                	addi	a2,a2,-1
     b8c:	45b9                	li	a1,14
     b8e:	12c5ea63          	bltu	a1,a2,cc2 <__muldf3+0x1d2>
     b92:	658d                	lui	a1,0x3
     b94:	060a                	slli	a2,a2,0x2
     b96:	b0c58593          	addi	a1,a1,-1268 # 2b0c <__etext+0x3c>
     b9a:	962e                	add	a2,a2,a1
     b9c:	4210                	lw	a2,0(a2)
     b9e:	8602                	jr	a2
     ba0:	00e4e3b3          	or	t2,s1,a4
     ba4:	06038763          	beqz	t2,c12 <__muldf3+0x122>
     ba8:	c232                	sw	a2,4(sp)
     baa:	cc85                	beqz	s1,be2 <__muldf3+0xf2>
     bac:	8526                	mv	a0,s1
     bae:	c03a                	sw	a4,0(sp)
     bb0:	319000ef          	jal	ra,16c8 <__clzsi2>
     bb4:	4702                	lw	a4,0(sp)
     bb6:	4612                	lw	a2,4(sp)
     bb8:	ff550593          	addi	a1,a0,-11
     bbc:	46f1                	li	a3,28
     bbe:	02b6cb63          	blt	a3,a1,bf4 <__muldf3+0x104>
     bc2:	46f5                	li	a3,29
     bc4:	ff850313          	addi	t1,a0,-8
     bc8:	8e8d                	sub	a3,a3,a1
     bca:	006497b3          	sll	a5,s1,t1
     bce:	00d756b3          	srl	a3,a4,a3
     bd2:	00f6e3b3          	or	t2,a3,a5
     bd6:	00671333          	sll	t1,a4,t1
     bda:	c0d00593          	li	a1,-1011
     bde:	8d89                	sub	a1,a1,a0
     be0:	bfa1                	j	b38 <__muldf3+0x48>
     be2:	853a                	mv	a0,a4
     be4:	c03a                	sw	a4,0(sp)
     be6:	2e3000ef          	jal	ra,16c8 <__clzsi2>
     bea:	02050513          	addi	a0,a0,32
     bee:	4612                	lw	a2,4(sp)
     bf0:	4702                	lw	a4,0(sp)
     bf2:	b7d9                	j	bb8 <__muldf3+0xc8>
     bf4:	fd850793          	addi	a5,a0,-40
     bf8:	00f713b3          	sll	t2,a4,a5
     bfc:	4301                	li	t1,0
     bfe:	bff1                	j	bda <__muldf3+0xea>
     c00:	00e4e3b3          	or	t2,s1,a4
     c04:	00038b63          	beqz	t2,c1a <__muldf3+0x12a>
     c08:	83a6                	mv	t2,s1
     c0a:	7ff00593          	li	a1,2047
     c0e:	448d                	li	s1,3
     c10:	b72d                	j	b3a <__muldf3+0x4a>
     c12:	4301                	li	t1,0
     c14:	4581                	li	a1,0
     c16:	4485                	li	s1,1
     c18:	b70d                	j	b3a <__muldf3+0x4a>
     c1a:	4301                	li	t1,0
     c1c:	7ff00593          	li	a1,2047
     c20:	4489                	li	s1,2
     c22:	bf21                	j	b3a <__muldf3+0x4a>
     c24:	00c2e7b3          	or	a5,t0,a2
     c28:	c7c1                	beqz	a5,cb0 <__muldf3+0x1c0>
     c2a:	04028563          	beqz	t0,c74 <__muldf3+0x184>
     c2e:	8516                	mv	a0,t0
     c30:	ca32                	sw	a2,20(sp)
     c32:	c81a                	sw	t1,16(sp)
     c34:	c61e                	sw	t2,12(sp)
     c36:	c22e                	sw	a1,4(sp)
     c38:	c016                	sw	t0,0(sp)
     c3a:	28f000ef          	jal	ra,16c8 <__clzsi2>
     c3e:	4282                	lw	t0,0(sp)
     c40:	4592                	lw	a1,4(sp)
     c42:	43b2                	lw	t2,12(sp)
     c44:	4342                	lw	t1,16(sp)
     c46:	4652                	lw	a2,20(sp)
     c48:	ff550693          	addi	a3,a0,-11
     c4c:	47f1                	li	a5,28
     c4e:	04d7c363          	blt	a5,a3,c94 <__muldf3+0x1a4>
     c52:	47f5                	li	a5,29
     c54:	ff850713          	addi	a4,a0,-8
     c58:	8f95                	sub	a5,a5,a3
     c5a:	00e292b3          	sll	t0,t0,a4
     c5e:	00f657b3          	srl	a5,a2,a5
     c62:	0057e7b3          	or	a5,a5,t0
     c66:	00e61733          	sll	a4,a2,a4
     c6a:	c0d00693          	li	a3,-1011
     c6e:	40a68533          	sub	a0,a3,a0
     c72:	b701                	j	b72 <__muldf3+0x82>
     c74:	8532                	mv	a0,a2
     c76:	ca16                	sw	t0,20(sp)
     c78:	c81a                	sw	t1,16(sp)
     c7a:	c61e                	sw	t2,12(sp)
     c7c:	c22e                	sw	a1,4(sp)
     c7e:	c032                	sw	a2,0(sp)
     c80:	249000ef          	jal	ra,16c8 <__clzsi2>
     c84:	02050513          	addi	a0,a0,32
     c88:	42d2                	lw	t0,20(sp)
     c8a:	4342                	lw	t1,16(sp)
     c8c:	43b2                	lw	t2,12(sp)
     c8e:	4592                	lw	a1,4(sp)
     c90:	4602                	lw	a2,0(sp)
     c92:	bf5d                	j	c48 <__muldf3+0x158>
     c94:	fd850293          	addi	t0,a0,-40
     c98:	005617b3          	sll	a5,a2,t0
     c9c:	4701                	li	a4,0
     c9e:	b7f1                	j	c6a <__muldf3+0x17a>
     ca0:	00c2e7b3          	or	a5,t0,a2
     ca4:	cb91                	beqz	a5,cb8 <__muldf3+0x1c8>
     ca6:	8796                	mv	a5,t0
     ca8:	7ff00513          	li	a0,2047
     cac:	468d                	li	a3,3
     cae:	b5d9                	j	b74 <__muldf3+0x84>
     cb0:	4701                	li	a4,0
     cb2:	4501                	li	a0,0
     cb4:	4685                	li	a3,1
     cb6:	bd7d                	j	b74 <__muldf3+0x84>
     cb8:	4701                	li	a4,0
     cba:	7ff00513          	li	a0,2047
     cbe:	4689                	li	a3,2
     cc0:	bd55                	j	b74 <__muldf3+0x84>
     cc2:	01035613          	srli	a2,t1,0x10
     cc6:	01075493          	srli	s1,a4,0x10
     cca:	66c1                	lui	a3,0x10
     ccc:	fff68293          	addi	t0,a3,-1 # ffff <__erodata+0xcccb>
     cd0:	029606b3          	mul	a3,a2,s1
     cd4:	00537333          	and	t1,t1,t0
     cd8:	00577733          	and	a4,a4,t0
     cdc:	02e60433          	mul	s0,a2,a4
     ce0:	c436                	sw	a3,8(sp)
     ce2:	026486b3          	mul	a3,s1,t1
     ce6:	026705b3          	mul	a1,a4,t1
     cea:	96a2                	add	a3,a3,s0
     cec:	8536                	mv	a0,a3
     cee:	0105d693          	srli	a3,a1,0x10
     cf2:	96aa                	add	a3,a3,a0
     cf4:	0086f763          	bleu	s0,a3,d02 <__muldf3+0x212>
     cf8:	02960433          	mul	s0,a2,s1
     cfc:	6541                	lui	a0,0x10
     cfe:	9522                	add	a0,a0,s0
     d00:	c42a                	sw	a0,8(sp)
     d02:	0106d513          	srli	a0,a3,0x10
     d06:	0056f6b3          	and	a3,a3,t0
     d0a:	0055f5b3          	and	a1,a1,t0
     d0e:	06c2                	slli	a3,a3,0x10
     d10:	96ae                	add	a3,a3,a1
     d12:	0057f2b3          	and	t0,a5,t0
     d16:	0107d593          	srli	a1,a5,0x10
     d1a:	ca36                	sw	a3,20(sp)
     d1c:	026287b3          	mul	a5,t0,t1
     d20:	025606b3          	mul	a3,a2,t0
     d24:	0107d413          	srli	s0,a5,0x10
     d28:	02658333          	mul	t1,a1,t1
     d2c:	9336                	add	t1,t1,a3
     d2e:	9322                	add	t1,t1,s0
     d30:	02b60633          	mul	a2,a2,a1
     d34:	00d37463          	bleu	a3,t1,d3c <__muldf3+0x24c>
     d38:	66c1                	lui	a3,0x10
     d3a:	9636                	add	a2,a2,a3
     d3c:	01035413          	srli	s0,t1,0x10
     d40:	00c406b3          	add	a3,s0,a2
     d44:	c836                	sw	a3,16(sp)
     d46:	66c1                	lui	a3,0x10
     d48:	fff68613          	addi	a2,a3,-1 # ffff <__erodata+0xcccb>
     d4c:	00c37333          	and	t1,t1,a2
     d50:	8ff1                	and	a5,a5,a2
     d52:	0342                	slli	t1,t1,0x10
     d54:	933e                	add	t1,t1,a5
     d56:	006507b3          	add	a5,a0,t1
     d5a:	00c3f633          	and	a2,t2,a2
     d5e:	0103d513          	srli	a0,t2,0x10
     d62:	cc3e                	sw	a5,24(sp)
     d64:	02a483b3          	mul	t2,s1,a0
     d68:	02c707b3          	mul	a5,a4,a2
     d6c:	02c484b3          	mul	s1,s1,a2
     d70:	0107d413          	srli	s0,a5,0x10
     d74:	02e50733          	mul	a4,a0,a4
     d78:	94ba                	add	s1,s1,a4
     d7a:	94a2                	add	s1,s1,s0
     d7c:	00e4f363          	bleu	a4,s1,d82 <__muldf3+0x292>
     d80:	93b6                	add	t2,t2,a3
     d82:	02c28433          	mul	s0,t0,a2
     d86:	0104d713          	srli	a4,s1,0x10
     d8a:	93ba                	add	t2,t2,a4
     d8c:	6741                	lui	a4,0x10
     d8e:	fff70693          	addi	a3,a4,-1 # ffff <__erodata+0xcccb>
     d92:	8cf5                	and	s1,s1,a3
     d94:	04c2                	slli	s1,s1,0x10
     d96:	8ff5                	and	a5,a5,a3
     d98:	94be                	add	s1,s1,a5
     d9a:	025502b3          	mul	t0,a0,t0
     d9e:	02c58633          	mul	a2,a1,a2
     da2:	02a58533          	mul	a0,a1,a0
     da6:	9616                	add	a2,a2,t0
     da8:	01045593          	srli	a1,s0,0x10
     dac:	95b2                	add	a1,a1,a2
     dae:	0055f363          	bleu	t0,a1,db4 <__muldf3+0x2c4>
     db2:	953a                	add	a0,a0,a4
     db4:	47a2                	lw	a5,8(sp)
     db6:	4762                	lw	a4,24(sp)
     db8:	00e786b3          	add	a3,a5,a4
     dbc:	67c1                	lui	a5,0x10
     dbe:	17fd                	addi	a5,a5,-1
     dc0:	00f5f633          	and	a2,a1,a5
     dc4:	8c7d                	and	s0,s0,a5
     dc6:	47c2                	lw	a5,16(sp)
     dc8:	0642                	slli	a2,a2,0x10
     dca:	9622                	add	a2,a2,s0
     dcc:	0066b333          	sltu	t1,a3,t1
     dd0:	963e                	add	a2,a2,a5
     dd2:	4742                	lw	a4,16(sp)
     dd4:	96a6                	add	a3,a3,s1
     dd6:	00660433          	add	s0,a2,t1
     dda:	0096b7b3          	sltu	a5,a3,s1
     dde:	007402b3          	add	t0,s0,t2
     de2:	00f284b3          	add	s1,t0,a5
     de6:	00e63633          	sltu	a2,a2,a4
     dea:	00643333          	sltu	t1,s0,t1
     dee:	00f4b7b3          	sltu	a5,s1,a5
     df2:	00666633          	or	a2,a2,t1
     df6:	81c1                	srli	a1,a1,0x10
     df8:	0072b2b3          	sltu	t0,t0,t2
     dfc:	962e                	add	a2,a2,a1
     dfe:	00f2e2b3          	or	t0,t0,a5
     e02:	92b2                	add	t0,t0,a2
     e04:	4652                	lw	a2,20(sp)
     e06:	00969713          	slli	a4,a3,0x9
     e0a:	9516                	add	a0,a0,t0
     e0c:	0174d793          	srli	a5,s1,0x17
     e10:	00951293          	slli	t0,a0,0x9
     e14:	8f51                	or	a4,a4,a2
     e16:	82dd                	srli	a3,a3,0x17
     e18:	00f2e7b3          	or	a5,t0,a5
     e1c:	00e03733          	snez	a4,a4
     e20:	8f55                	or	a4,a4,a3
     e22:	04a6                	slli	s1,s1,0x9
     e24:	00779693          	slli	a3,a5,0x7
     e28:	8f45                	or	a4,a4,s1
     e2a:	0a06d963          	bgez	a3,edc <__muldf3+0x3ec>
     e2e:	00175693          	srli	a3,a4,0x1
     e32:	8b05                	andi	a4,a4,1
     e34:	8f55                	or	a4,a4,a3
     e36:	01f79693          	slli	a3,a5,0x1f
     e3a:	8f55                	or	a4,a4,a3
     e3c:	8385                	srli	a5,a5,0x1
     e3e:	4692                	lw	a3,4(sp)
     e40:	3ff68613          	addi	a2,a3,1023
     e44:	08c05f63          	blez	a2,ee2 <__muldf3+0x3f2>
     e48:	00777693          	andi	a3,a4,7
     e4c:	ce81                	beqz	a3,e64 <__muldf3+0x374>
     e4e:	00f77693          	andi	a3,a4,15
     e52:	4591                	li	a1,4
     e54:	00b68863          	beq	a3,a1,e64 <__muldf3+0x374>
     e58:	00470693          	addi	a3,a4,4
     e5c:	00e6b733          	sltu	a4,a3,a4
     e60:	97ba                	add	a5,a5,a4
     e62:	8736                	mv	a4,a3
     e64:	00779693          	slli	a3,a5,0x7
     e68:	0006d963          	bgez	a3,e7a <__muldf3+0x38a>
     e6c:	ff0006b7          	lui	a3,0xff000
     e70:	16fd                	addi	a3,a3,-1
     e72:	8ff5                	and	a5,a5,a3
     e74:	4692                	lw	a3,4(sp)
     e76:	40068613          	addi	a2,a3,1024 # ff000400 <__heap_end+0xdef80400>
     e7a:	7fe00693          	li	a3,2046
     e7e:	10c6c063          	blt	a3,a2,f7e <__muldf3+0x48e>
     e82:	830d                	srli	a4,a4,0x3
     e84:	01d79693          	slli	a3,a5,0x1d
     e88:	8f55                	or	a4,a4,a3
     e8a:	0037d293          	srli	t0,a5,0x3
     e8e:	4782                	lw	a5,0(sp)
     e90:	02b2                	slli	t0,t0,0xc
     e92:	7ff67693          	andi	a3,a2,2047
     e96:	06d2                	slli	a3,a3,0x14
     e98:	5092                	lw	ra,36(sp)
     e9a:	5402                	lw	s0,32(sp)
     e9c:	00c2d293          	srli	t0,t0,0xc
     ea0:	07fe                	slli	a5,a5,0x1f
     ea2:	00d2e2b3          	or	t0,t0,a3
     ea6:	00f2e6b3          	or	a3,t0,a5
     eaa:	44f2                	lw	s1,28(sp)
     eac:	853a                	mv	a0,a4
     eae:	85b6                	mv	a1,a3
     eb0:	02810113          	addi	sp,sp,40
     eb4:	8082                	ret
     eb6:	47a2                	lw	a5,8(sp)
     eb8:	c03e                	sw	a5,0(sp)
     eba:	879e                	mv	a5,t2
     ebc:	871a                	mv	a4,t1
     ebe:	86a6                	mv	a3,s1
     ec0:	4609                	li	a2,2
     ec2:	0ac68e63          	beq	a3,a2,f7e <__muldf3+0x48e>
     ec6:	460d                	li	a2,3
     ec8:	0ac68463          	beq	a3,a2,f70 <__muldf3+0x480>
     ecc:	4605                	li	a2,1
     ece:	f6c698e3          	bne	a3,a2,e3e <__muldf3+0x34e>
     ed2:	4281                	li	t0,0
     ed4:	4701                	li	a4,0
     ed6:	a0bd                	j	f44 <__muldf3+0x454>
     ed8:	c022                	sw	s0,0(sp)
     eda:	b7dd                	j	ec0 <__muldf3+0x3d0>
     edc:	46b2                	lw	a3,12(sp)
     ede:	c236                	sw	a3,4(sp)
     ee0:	bfb9                	j	e3e <__muldf3+0x34e>
     ee2:	4285                	li	t0,1
     ee4:	40c282b3          	sub	t0,t0,a2
     ee8:	03800693          	li	a3,56
     eec:	fe56c3e3          	blt	a3,t0,ed2 <__muldf3+0x3e2>
     ef0:	46fd                	li	a3,31
     ef2:	0456cb63          	blt	a3,t0,f48 <__muldf3+0x458>
     ef6:	4692                	lw	a3,4(sp)
     ef8:	005755b3          	srl	a1,a4,t0
     efc:	0057d2b3          	srl	t0,a5,t0
     f00:	41e68613          	addi	a2,a3,1054
     f04:	00c796b3          	sll	a3,a5,a2
     f08:	00c71733          	sll	a4,a4,a2
     f0c:	8ecd                	or	a3,a3,a1
     f0e:	00e03733          	snez	a4,a4
     f12:	8f55                	or	a4,a4,a3
     f14:	00777793          	andi	a5,a4,7
     f18:	cf81                	beqz	a5,f30 <__muldf3+0x440>
     f1a:	00f77793          	andi	a5,a4,15
     f1e:	4691                	li	a3,4
     f20:	00d78863          	beq	a5,a3,f30 <__muldf3+0x440>
     f24:	00470793          	addi	a5,a4,4
     f28:	00e7b733          	sltu	a4,a5,a4
     f2c:	92ba                	add	t0,t0,a4
     f2e:	873e                	mv	a4,a5
     f30:	00829793          	slli	a5,t0,0x8
     f34:	0407ca63          	bltz	a5,f88 <__muldf3+0x498>
     f38:	01d29793          	slli	a5,t0,0x1d
     f3c:	830d                	srli	a4,a4,0x3
     f3e:	8f5d                	or	a4,a4,a5
     f40:	0032d293          	srli	t0,t0,0x3
     f44:	4601                	li	a2,0
     f46:	b7a1                	j	e8e <__muldf3+0x39e>
     f48:	5685                	li	a3,-31
     f4a:	8e91                	sub	a3,a3,a2
     f4c:	02000593          	li	a1,32
     f50:	00d7d6b3          	srl	a3,a5,a3
     f54:	4601                	li	a2,0
     f56:	00b28763          	beq	t0,a1,f64 <__muldf3+0x474>
     f5a:	4612                	lw	a2,4(sp)
     f5c:	43e60613          	addi	a2,a2,1086
     f60:	00c79633          	sll	a2,a5,a2
     f64:	8f51                	or	a4,a4,a2
     f66:	00e03733          	snez	a4,a4
     f6a:	8f55                	or	a4,a4,a3
     f6c:	4281                	li	t0,0
     f6e:	b75d                	j	f14 <__muldf3+0x424>
     f70:	000802b7          	lui	t0,0x80
     f74:	4701                	li	a4,0
     f76:	7ff00613          	li	a2,2047
     f7a:	c002                	sw	zero,0(sp)
     f7c:	bf09                	j	e8e <__muldf3+0x39e>
     f7e:	4281                	li	t0,0
     f80:	4701                	li	a4,0
     f82:	7ff00613          	li	a2,2047
     f86:	b721                	j	e8e <__muldf3+0x39e>
     f88:	4281                	li	t0,0
     f8a:	4701                	li	a4,0
     f8c:	4605                	li	a2,1
     f8e:	b701                	j	e8e <__muldf3+0x39e>

00000f90 <__divsf3>:
     f90:	1111                	addi	sp,sp,-28
     f92:	01755613          	srli	a2,a0,0x17
     f96:	01f55793          	srli	a5,a0,0x1f
     f9a:	c826                	sw	s1,16(sp)
     f9c:	cc06                	sw	ra,24(sp)
     f9e:	00951493          	slli	s1,a0,0x9
     fa2:	ca22                	sw	s0,20(sp)
     fa4:	0ff67613          	andi	a2,a2,255
     fa8:	c03e                	sw	a5,0(sp)
     faa:	80a5                	srli	s1,s1,0x9
     fac:	c625                	beqz	a2,1014 <__divsf3+0x84>
     fae:	0ff00793          	li	a5,255
     fb2:	06f60f63          	beq	a2,a5,1030 <__divsf3+0xa0>
     fb6:	00349313          	slli	t1,s1,0x3
     fba:	040007b7          	lui	a5,0x4000
     fbe:	00f364b3          	or	s1,t1,a5
     fc2:	f8160613          	addi	a2,a2,-127
     fc6:	4681                	li	a3,0
     fc8:	0175d513          	srli	a0,a1,0x17
     fcc:	00959413          	slli	s0,a1,0x9
     fd0:	0ff57513          	andi	a0,a0,255
     fd4:	8025                	srli	s0,s0,0x9
     fd6:	81fd                	srli	a1,a1,0x1f
     fd8:	c52d                	beqz	a0,1042 <__divsf3+0xb2>
     fda:	0ff00793          	li	a5,255
     fde:	08f50563          	beq	a0,a5,1068 <__divsf3+0xd8>
     fe2:	040007b7          	lui	a5,0x4000
     fe6:	040e                	slli	s0,s0,0x3
     fe8:	8c5d                	or	s0,s0,a5
     fea:	f8150513          	addi	a0,a0,-127 # ff81 <__erodata+0xcc4d>
     fee:	4781                	li	a5,0
     ff0:	4702                	lw	a4,0(sp)
     ff2:	40a60533          	sub	a0,a2,a0
     ff6:	00269613          	slli	a2,a3,0x2
     ffa:	8e5d                	or	a2,a2,a5
     ffc:	167d                	addi	a2,a2,-1
     ffe:	42b9                	li	t0,14
    1000:	8f2d                	xor	a4,a4,a1
    1002:	06c2ec63          	bltu	t0,a2,107a <__divsf3+0xea>
    1006:	628d                	lui	t0,0x3
    1008:	060a                	slli	a2,a2,0x2
    100a:	b4828293          	addi	t0,t0,-1208 # 2b48 <__etext+0x78>
    100e:	9616                	add	a2,a2,t0
    1010:	4210                	lw	a2,0(a2)
    1012:	8602                	jr	a2
    1014:	c485                	beqz	s1,103c <__divsf3+0xac>
    1016:	8526                	mv	a0,s1
    1018:	c22e                	sw	a1,4(sp)
    101a:	257d                	jal	16c8 <__clzsi2>
    101c:	ffb50793          	addi	a5,a0,-5
    1020:	f8a00613          	li	a2,-118
    1024:	00f494b3          	sll	s1,s1,a5
    1028:	8e09                	sub	a2,a2,a0
    102a:	4681                	li	a3,0
    102c:	4592                	lw	a1,4(sp)
    102e:	bf69                	j	fc8 <__divsf3+0x38>
    1030:	0ff00613          	li	a2,255
    1034:	4689                	li	a3,2
    1036:	d8c9                	beqz	s1,fc8 <__divsf3+0x38>
    1038:	468d                	li	a3,3
    103a:	b779                	j	fc8 <__divsf3+0x38>
    103c:	4601                	li	a2,0
    103e:	4685                	li	a3,1
    1040:	b761                	j	fc8 <__divsf3+0x38>
    1042:	c80d                	beqz	s0,1074 <__divsf3+0xe4>
    1044:	8522                	mv	a0,s0
    1046:	c632                	sw	a2,12(sp)
    1048:	c436                	sw	a3,8(sp)
    104a:	c22e                	sw	a1,4(sp)
    104c:	2db5                	jal	16c8 <__clzsi2>
    104e:	ffb50793          	addi	a5,a0,-5
    1052:	00f41433          	sll	s0,s0,a5
    1056:	f8a00793          	li	a5,-118
    105a:	40a78533          	sub	a0,a5,a0
    105e:	4592                	lw	a1,4(sp)
    1060:	4781                	li	a5,0
    1062:	46a2                	lw	a3,8(sp)
    1064:	4632                	lw	a2,12(sp)
    1066:	b769                	j	ff0 <__divsf3+0x60>
    1068:	0ff00513          	li	a0,255
    106c:	4789                	li	a5,2
    106e:	d049                	beqz	s0,ff0 <__divsf3+0x60>
    1070:	478d                	li	a5,3
    1072:	bfbd                	j	ff0 <__divsf3+0x60>
    1074:	4501                	li	a0,0
    1076:	4785                	li	a5,1
    1078:	bfa5                	j	ff0 <__divsf3+0x60>
    107a:	00541593          	slli	a1,s0,0x5
    107e:	0a84fe63          	bleu	s0,s1,113a <__divsf3+0x1aa>
    1082:	157d                	addi	a0,a0,-1
    1084:	4781                	li	a5,0
    1086:	0105d293          	srli	t0,a1,0x10
    108a:	0254d433          	divu	s0,s1,t0
    108e:	66c1                	lui	a3,0x10
    1090:	16fd                	addi	a3,a3,-1
    1092:	8eed                	and	a3,a3,a1
    1094:	83c1                	srli	a5,a5,0x10
    1096:	0254f633          	remu	a2,s1,t0
    109a:	028683b3          	mul	t2,a3,s0
    109e:	0642                	slli	a2,a2,0x10
    10a0:	8e5d                	or	a2,a2,a5
    10a2:	87a2                	mv	a5,s0
    10a4:	00767c63          	bleu	t2,a2,10bc <__divsf3+0x12c>
    10a8:	962e                	add	a2,a2,a1
    10aa:	fff40793          	addi	a5,s0,-1
    10ae:	00b66763          	bltu	a2,a1,10bc <__divsf3+0x12c>
    10b2:	00767563          	bleu	t2,a2,10bc <__divsf3+0x12c>
    10b6:	ffe40793          	addi	a5,s0,-2
    10ba:	962e                	add	a2,a2,a1
    10bc:	40760633          	sub	a2,a2,t2
    10c0:	025653b3          	divu	t2,a2,t0
    10c4:	02567633          	remu	a2,a2,t0
    10c8:	02768333          	mul	t1,a3,t2
    10cc:	01061693          	slli	a3,a2,0x10
    10d0:	861e                	mv	a2,t2
    10d2:	0066fc63          	bleu	t1,a3,10ea <__divsf3+0x15a>
    10d6:	96ae                	add	a3,a3,a1
    10d8:	fff38613          	addi	a2,t2,-1
    10dc:	00b6e763          	bltu	a3,a1,10ea <__divsf3+0x15a>
    10e0:	0066f563          	bleu	t1,a3,10ea <__divsf3+0x15a>
    10e4:	ffe38613          	addi	a2,t2,-2
    10e8:	96ae                	add	a3,a3,a1
    10ea:	01079413          	slli	s0,a5,0x10
    10ee:	406686b3          	sub	a3,a3,t1
    10f2:	8c51                	or	s0,s0,a2
    10f4:	00d036b3          	snez	a3,a3
    10f8:	8c55                	or	s0,s0,a3
    10fa:	07f50693          	addi	a3,a0,127
    10fe:	08d05563          	blez	a3,1188 <__divsf3+0x1f8>
    1102:	00747793          	andi	a5,s0,7
    1106:	c799                	beqz	a5,1114 <__divsf3+0x184>
    1108:	00f47793          	andi	a5,s0,15
    110c:	4611                	li	a2,4
    110e:	00c78363          	beq	a5,a2,1114 <__divsf3+0x184>
    1112:	0411                	addi	s0,s0,4
    1114:	00441793          	slli	a5,s0,0x4
    1118:	0007d863          	bgez	a5,1128 <__divsf3+0x198>
    111c:	f80007b7          	lui	a5,0xf8000
    1120:	17fd                	addi	a5,a5,-1
    1122:	8c7d                	and	s0,s0,a5
    1124:	08050693          	addi	a3,a0,128
    1128:	0fe00793          	li	a5,254
    112c:	800d                	srli	s0,s0,0x3
    112e:	02d7d863          	ble	a3,a5,115e <__divsf3+0x1ce>
    1132:	4401                	li	s0,0
    1134:	0ff00693          	li	a3,255
    1138:	a01d                	j	115e <__divsf3+0x1ce>
    113a:	01f49793          	slli	a5,s1,0x1f
    113e:	8085                	srli	s1,s1,0x1
    1140:	b799                	j	1086 <__divsf3+0xf6>
    1142:	4702                	lw	a4,0(sp)
    1144:	8426                	mv	s0,s1
    1146:	87b6                	mv	a5,a3
    1148:	4689                	li	a3,2
    114a:	fed784e3          	beq	a5,a3,1132 <__divsf3+0x1a2>
    114e:	468d                	li	a3,3
    1150:	06d78b63          	beq	a5,a3,11c6 <__divsf3+0x236>
    1154:	4685                	li	a3,1
    1156:	fad792e3          	bne	a5,a3,10fa <__divsf3+0x16a>
    115a:	4401                	li	s0,0
    115c:	4681                	li	a3,0
    115e:	0426                	slli	s0,s0,0x9
    1160:	0ff6f693          	andi	a3,a3,255
    1164:	06de                	slli	a3,a3,0x17
    1166:	8025                	srli	s0,s0,0x9
    1168:	8c55                	or	s0,s0,a3
    116a:	01f71513          	slli	a0,a4,0x1f
    116e:	8d41                	or	a0,a0,s0
    1170:	40e2                	lw	ra,24(sp)
    1172:	4452                	lw	s0,20(sp)
    1174:	44c2                	lw	s1,16(sp)
    1176:	0171                	addi	sp,sp,28
    1178:	8082                	ret
    117a:	872e                	mv	a4,a1
    117c:	b7f1                	j	1148 <__divsf3+0x1b8>
    117e:	00400437          	lui	s0,0x400
    1182:	4701                	li	a4,0
    1184:	478d                	li	a5,3
    1186:	b7c9                	j	1148 <__divsf3+0x1b8>
    1188:	4785                	li	a5,1
    118a:	8f95                	sub	a5,a5,a3
    118c:	46ed                	li	a3,27
    118e:	fcf6c6e3          	blt	a3,a5,115a <__divsf3+0x1ca>
    1192:	09e50513          	addi	a0,a0,158
    1196:	00f457b3          	srl	a5,s0,a5
    119a:	00a41433          	sll	s0,s0,a0
    119e:	00803433          	snez	s0,s0
    11a2:	8c5d                	or	s0,s0,a5
    11a4:	00747793          	andi	a5,s0,7
    11a8:	c799                	beqz	a5,11b6 <__divsf3+0x226>
    11aa:	00f47793          	andi	a5,s0,15
    11ae:	4691                	li	a3,4
    11b0:	00d78363          	beq	a5,a3,11b6 <__divsf3+0x226>
    11b4:	0411                	addi	s0,s0,4
    11b6:	00541793          	slli	a5,s0,0x5
    11ba:	800d                	srli	s0,s0,0x3
    11bc:	fa07d0e3          	bgez	a5,115c <__divsf3+0x1cc>
    11c0:	4401                	li	s0,0
    11c2:	4685                	li	a3,1
    11c4:	bf69                	j	115e <__divsf3+0x1ce>
    11c6:	00400437          	lui	s0,0x400
    11ca:	0ff00693          	li	a3,255
    11ce:	4701                	li	a4,0
    11d0:	b779                	j	115e <__divsf3+0x1ce>

000011d2 <__mulsf3>:
    11d2:	1111                	addi	sp,sp,-28
    11d4:	01755613          	srli	a2,a0,0x17
    11d8:	01f55793          	srli	a5,a0,0x1f
    11dc:	c826                	sw	s1,16(sp)
    11de:	cc06                	sw	ra,24(sp)
    11e0:	00951493          	slli	s1,a0,0x9
    11e4:	ca22                	sw	s0,20(sp)
    11e6:	0ff67613          	andi	a2,a2,255
    11ea:	c03e                	sw	a5,0(sp)
    11ec:	80a5                	srli	s1,s1,0x9
    11ee:	ca25                	beqz	a2,125e <__mulsf3+0x8c>
    11f0:	0ff00713          	li	a4,255
    11f4:	08e60363          	beq	a2,a4,127a <__mulsf3+0xa8>
    11f8:	00349793          	slli	a5,s1,0x3
    11fc:	04000737          	lui	a4,0x4000
    1200:	00e7e4b3          	or	s1,a5,a4
    1204:	f8160613          	addi	a2,a2,-127
    1208:	4681                	li	a3,0
    120a:	0175d513          	srli	a0,a1,0x17
    120e:	00959413          	slli	s0,a1,0x9
    1212:	0ff57513          	andi	a0,a0,255
    1216:	8025                	srli	s0,s0,0x9
    1218:	81fd                	srli	a1,a1,0x1f
    121a:	c92d                	beqz	a0,128c <__mulsf3+0xba>
    121c:	0ff00713          	li	a4,255
    1220:	08e50963          	beq	a0,a4,12b2 <__mulsf3+0xe0>
    1224:	040e                	slli	s0,s0,0x3
    1226:	04000737          	lui	a4,0x4000
    122a:	8c59                	or	s0,s0,a4
    122c:	f8150513          	addi	a0,a0,-127
    1230:	4301                	li	t1,0
    1232:	4782                	lw	a5,0(sp)
    1234:	00269293          	slli	t0,a3,0x2
    1238:	0062e2b3          	or	t0,t0,t1
    123c:	9532                	add	a0,a0,a2
    123e:	12fd                	addi	t0,t0,-1
    1240:	43b9                	li	t2,14
    1242:	00b7c733          	xor	a4,a5,a1
    1246:	00150613          	addi	a2,a0,1
    124a:	0653ed63          	bltu	t2,t0,12c4 <__mulsf3+0xf2>
    124e:	650d                	lui	a0,0x3
    1250:	b8450513          	addi	a0,a0,-1148 # 2b84 <__etext+0xb4>
    1254:	028a                	slli	t0,t0,0x2
    1256:	92aa                	add	t0,t0,a0
    1258:	0002a503          	lw	a0,0(t0)
    125c:	8502                	jr	a0
    125e:	c485                	beqz	s1,1286 <__mulsf3+0xb4>
    1260:	8526                	mv	a0,s1
    1262:	c22e                	sw	a1,4(sp)
    1264:	2195                	jal	16c8 <__clzsi2>
    1266:	ffb50713          	addi	a4,a0,-5
    126a:	f8a00613          	li	a2,-118
    126e:	00e494b3          	sll	s1,s1,a4
    1272:	8e09                	sub	a2,a2,a0
    1274:	4681                	li	a3,0
    1276:	4592                	lw	a1,4(sp)
    1278:	bf49                	j	120a <__mulsf3+0x38>
    127a:	0ff00613          	li	a2,255
    127e:	4689                	li	a3,2
    1280:	d4c9                	beqz	s1,120a <__mulsf3+0x38>
    1282:	468d                	li	a3,3
    1284:	b759                	j	120a <__mulsf3+0x38>
    1286:	4601                	li	a2,0
    1288:	4685                	li	a3,1
    128a:	b741                	j	120a <__mulsf3+0x38>
    128c:	c80d                	beqz	s0,12be <__mulsf3+0xec>
    128e:	8522                	mv	a0,s0
    1290:	c632                	sw	a2,12(sp)
    1292:	c436                	sw	a3,8(sp)
    1294:	c22e                	sw	a1,4(sp)
    1296:	290d                	jal	16c8 <__clzsi2>
    1298:	ffb50713          	addi	a4,a0,-5
    129c:	00e41433          	sll	s0,s0,a4
    12a0:	f8a00713          	li	a4,-118
    12a4:	40a70533          	sub	a0,a4,a0
    12a8:	4301                	li	t1,0
    12aa:	4592                	lw	a1,4(sp)
    12ac:	46a2                	lw	a3,8(sp)
    12ae:	4632                	lw	a2,12(sp)
    12b0:	b749                	j	1232 <__mulsf3+0x60>
    12b2:	0ff00513          	li	a0,255
    12b6:	4309                	li	t1,2
    12b8:	dc2d                	beqz	s0,1232 <__mulsf3+0x60>
    12ba:	430d                	li	t1,3
    12bc:	bf9d                	j	1232 <__mulsf3+0x60>
    12be:	4501                	li	a0,0
    12c0:	4305                	li	t1,1
    12c2:	bf85                	j	1232 <__mulsf3+0x60>
    12c4:	63c1                	lui	t2,0x10
    12c6:	fff38293          	addi	t0,t2,-1 # ffff <__erodata+0xcccb>
    12ca:	0104d693          	srli	a3,s1,0x10
    12ce:	01045593          	srli	a1,s0,0x10
    12d2:	0054f7b3          	and	a5,s1,t0
    12d6:	00547433          	and	s0,s0,t0
    12da:	02868333          	mul	t1,a3,s0
    12de:	028784b3          	mul	s1,a5,s0
    12e2:	02f587b3          	mul	a5,a1,a5
    12e6:	0104d413          	srli	s0,s1,0x10
    12ea:	979a                	add	a5,a5,t1
    12ec:	97a2                	add	a5,a5,s0
    12ee:	02b686b3          	mul	a3,a3,a1
    12f2:	0067f363          	bleu	t1,a5,12f8 <__mulsf3+0x126>
    12f6:	969e                	add	a3,a3,t2
    12f8:	0057f433          	and	s0,a5,t0
    12fc:	0442                	slli	s0,s0,0x10
    12fe:	0054f2b3          	and	t0,s1,t0
    1302:	92a2                	add	t0,t0,s0
    1304:	00629413          	slli	s0,t0,0x6
    1308:	00803433          	snez	s0,s0
    130c:	01a2d293          	srli	t0,t0,0x1a
    1310:	005462b3          	or	t0,s0,t0
    1314:	0107d413          	srli	s0,a5,0x10
    1318:	9436                	add	s0,s0,a3
    131a:	041a                	slli	s0,s0,0x6
    131c:	00546433          	or	s0,s0,t0
    1320:	00441793          	slli	a5,s0,0x4
    1324:	0607d763          	bgez	a5,1392 <__mulsf3+0x1c0>
    1328:	00145793          	srli	a5,s0,0x1
    132c:	8805                	andi	s0,s0,1
    132e:	8c5d                	or	s0,s0,a5
    1330:	07f60513          	addi	a0,a2,127
    1334:	06a05163          	blez	a0,1396 <__mulsf3+0x1c4>
    1338:	00747793          	andi	a5,s0,7
    133c:	c799                	beqz	a5,134a <__mulsf3+0x178>
    133e:	00f47793          	andi	a5,s0,15
    1342:	4691                	li	a3,4
    1344:	00d78363          	beq	a5,a3,134a <__mulsf3+0x178>
    1348:	0411                	addi	s0,s0,4
    134a:	00441793          	slli	a5,s0,0x4
    134e:	0007d863          	bgez	a5,135e <__mulsf3+0x18c>
    1352:	f80007b7          	lui	a5,0xf8000
    1356:	17fd                	addi	a5,a5,-1
    1358:	8c7d                	and	s0,s0,a5
    135a:	08060513          	addi	a0,a2,128
    135e:	0fe00793          	li	a5,254
    1362:	800d                	srli	s0,s0,0x3
    1364:	06a7dd63          	ble	a0,a5,13de <__mulsf3+0x20c>
    1368:	4401                	li	s0,0
    136a:	0ff00513          	li	a0,255
    136e:	a885                	j	13de <__mulsf3+0x20c>
    1370:	4702                	lw	a4,0(sp)
    1372:	8426                	mv	s0,s1
    1374:	8336                	mv	t1,a3
    1376:	4789                	li	a5,2
    1378:	fef308e3          	beq	t1,a5,1368 <__mulsf3+0x196>
    137c:	478d                	li	a5,3
    137e:	04f30b63          	beq	t1,a5,13d4 <__mulsf3+0x202>
    1382:	4785                	li	a5,1
    1384:	faf316e3          	bne	t1,a5,1330 <__mulsf3+0x15e>
    1388:	4401                	li	s0,0
    138a:	4501                	li	a0,0
    138c:	a889                	j	13de <__mulsf3+0x20c>
    138e:	872e                	mv	a4,a1
    1390:	b7dd                	j	1376 <__mulsf3+0x1a4>
    1392:	862a                	mv	a2,a0
    1394:	bf71                	j	1330 <__mulsf3+0x15e>
    1396:	4785                	li	a5,1
    1398:	8f89                	sub	a5,a5,a0
    139a:	46ed                	li	a3,27
    139c:	fef6c6e3          	blt	a3,a5,1388 <__mulsf3+0x1b6>
    13a0:	09e60613          	addi	a2,a2,158
    13a4:	00f457b3          	srl	a5,s0,a5
    13a8:	00c41433          	sll	s0,s0,a2
    13ac:	00803433          	snez	s0,s0
    13b0:	8c5d                	or	s0,s0,a5
    13b2:	00747793          	andi	a5,s0,7
    13b6:	c799                	beqz	a5,13c4 <__mulsf3+0x1f2>
    13b8:	00f47793          	andi	a5,s0,15
    13bc:	4691                	li	a3,4
    13be:	00d78363          	beq	a5,a3,13c4 <__mulsf3+0x1f2>
    13c2:	0411                	addi	s0,s0,4
    13c4:	00541793          	slli	a5,s0,0x5
    13c8:	800d                	srli	s0,s0,0x3
    13ca:	fc07d0e3          	bgez	a5,138a <__mulsf3+0x1b8>
    13ce:	4401                	li	s0,0
    13d0:	4505                	li	a0,1
    13d2:	a031                	j	13de <__mulsf3+0x20c>
    13d4:	00400437          	lui	s0,0x400
    13d8:	0ff00513          	li	a0,255
    13dc:	4701                	li	a4,0
    13de:	0ff57793          	andi	a5,a0,255
    13e2:	0426                	slli	s0,s0,0x9
    13e4:	07de                	slli	a5,a5,0x17
    13e6:	8025                	srli	s0,s0,0x9
    13e8:	8c5d                	or	s0,s0,a5
    13ea:	01f71513          	slli	a0,a4,0x1f
    13ee:	8d41                	or	a0,a0,s0
    13f0:	40e2                	lw	ra,24(sp)
    13f2:	4452                	lw	s0,20(sp)
    13f4:	44c2                	lw	s1,16(sp)
    13f6:	0171                	addi	sp,sp,28
    13f8:	8082                	ret

000013fa <__fixsfsi>:
    13fa:	00800637          	lui	a2,0x800
    13fe:	01755713          	srli	a4,a0,0x17
    1402:	fff60793          	addi	a5,a2,-1 # 7fffff <__erodata+0x7fcccb>
    1406:	0ff77713          	andi	a4,a4,255
    140a:	07e00593          	li	a1,126
    140e:	8fe9                	and	a5,a5,a0
    1410:	01f55693          	srli	a3,a0,0x1f
    1414:	04e5f163          	bleu	a4,a1,1456 <__fixsfsi+0x5c>
    1418:	09d00593          	li	a1,157
    141c:	00e5f863          	bleu	a4,a1,142c <__fixsfsi+0x32>
    1420:	80000537          	lui	a0,0x80000
    1424:	fff54513          	not	a0,a0
    1428:	9536                	add	a0,a0,a3
    142a:	8082                	ret
    142c:	00c7e533          	or	a0,a5,a2
    1430:	09500793          	li	a5,149
    1434:	00e7da63          	ble	a4,a5,1448 <__fixsfsi+0x4e>
    1438:	f6a70713          	addi	a4,a4,-150 # 3ffff6a <__erodata+0x3ffcc36>
    143c:	00e51533          	sll	a0,a0,a4
    1440:	ce81                	beqz	a3,1458 <__fixsfsi+0x5e>
    1442:	40a00533          	neg	a0,a0
    1446:	8082                	ret
    1448:	09600793          	li	a5,150
    144c:	40e78733          	sub	a4,a5,a4
    1450:	00e55533          	srl	a0,a0,a4
    1454:	b7f5                	j	1440 <__fixsfsi+0x46>
    1456:	4501                	li	a0,0
    1458:	8082                	ret

0000145a <__floatsisf>:
    145a:	1151                	addi	sp,sp,-12
    145c:	c406                	sw	ra,8(sp)
    145e:	c222                	sw	s0,4(sp)
    1460:	c026                	sw	s1,0(sp)
    1462:	c54d                	beqz	a0,150c <__floatsisf+0xb2>
    1464:	842a                	mv	s0,a0
    1466:	01f55493          	srli	s1,a0,0x1f
    146a:	00055463          	bgez	a0,1472 <__floatsisf+0x18>
    146e:	40a00433          	neg	s0,a0
    1472:	8522                	mv	a0,s0
    1474:	2c91                	jal	16c8 <__clzsi2>
    1476:	09e00793          	li	a5,158
    147a:	8f89                	sub	a5,a5,a0
    147c:	09600713          	li	a4,150
    1480:	02f74663          	blt	a4,a5,14ac <__floatsisf+0x52>
    1484:	4721                	li	a4,8
    1486:	00a75563          	ble	a0,a4,1490 <__floatsisf+0x36>
    148a:	1561                	addi	a0,a0,-8
    148c:	00a41433          	sll	s0,s0,a0
    1490:	0426                	slli	s0,s0,0x9
    1492:	0ff7f793          	andi	a5,a5,255
    1496:	07de                	slli	a5,a5,0x17
    1498:	8025                	srli	s0,s0,0x9
    149a:	01f49513          	slli	a0,s1,0x1f
    149e:	8c5d                	or	s0,s0,a5
    14a0:	8d41                	or	a0,a0,s0
    14a2:	40a2                	lw	ra,8(sp)
    14a4:	4412                	lw	s0,4(sp)
    14a6:	4482                	lw	s1,0(sp)
    14a8:	0131                	addi	sp,sp,12
    14aa:	8082                	ret
    14ac:	09900713          	li	a4,153
    14b0:	00f75d63          	ble	a5,a4,14ca <__floatsisf+0x70>
    14b4:	4695                	li	a3,5
    14b6:	8e89                	sub	a3,a3,a0
    14b8:	01b50713          	addi	a4,a0,27 # 8000001b <__heap_end+0x5ff8001b>
    14bc:	00d456b3          	srl	a3,s0,a3
    14c0:	00e41433          	sll	s0,s0,a4
    14c4:	00803433          	snez	s0,s0
    14c8:	8c55                	or	s0,s0,a3
    14ca:	4715                	li	a4,5
    14cc:	00a75663          	ble	a0,a4,14d8 <__floatsisf+0x7e>
    14d0:	ffb50713          	addi	a4,a0,-5
    14d4:	00e41433          	sll	s0,s0,a4
    14d8:	fc000737          	lui	a4,0xfc000
    14dc:	177d                	addi	a4,a4,-1
    14de:	00747693          	andi	a3,s0,7
    14e2:	8f61                	and	a4,a4,s0
    14e4:	c691                	beqz	a3,14f0 <__floatsisf+0x96>
    14e6:	883d                	andi	s0,s0,15
    14e8:	4691                	li	a3,4
    14ea:	00d40363          	beq	s0,a3,14f0 <__floatsisf+0x96>
    14ee:	0711                	addi	a4,a4,4
    14f0:	00571693          	slli	a3,a4,0x5
    14f4:	0006d963          	bgez	a3,1506 <__floatsisf+0xac>
    14f8:	fc0007b7          	lui	a5,0xfc000
    14fc:	17fd                	addi	a5,a5,-1
    14fe:	8f7d                	and	a4,a4,a5
    1500:	09f00793          	li	a5,159
    1504:	8f89                	sub	a5,a5,a0
    1506:	00375413          	srli	s0,a4,0x3
    150a:	b759                	j	1490 <__floatsisf+0x36>
    150c:	4401                	li	s0,0
    150e:	4781                	li	a5,0
    1510:	4481                	li	s1,0
    1512:	bfbd                	j	1490 <__floatsisf+0x36>

00001514 <__extendsfdf2>:
    1514:	01755793          	srli	a5,a0,0x17
    1518:	1151                	addi	sp,sp,-12
    151a:	0ff7f793          	andi	a5,a5,255
    151e:	c222                	sw	s0,4(sp)
    1520:	c026                	sw	s1,0(sp)
    1522:	00951413          	slli	s0,a0,0x9
    1526:	01f55493          	srli	s1,a0,0x1f
    152a:	00178513          	addi	a0,a5,1 # fc000001 <__heap_end+0xdbf80001>
    152e:	c406                	sw	ra,8(sp)
    1530:	0fe57513          	andi	a0,a0,254
    1534:	8025                	srli	s0,s0,0x9
    1536:	c515                	beqz	a0,1562 <__extendsfdf2+0x4e>
    1538:	38078513          	addi	a0,a5,896
    153c:	00345793          	srli	a5,s0,0x3
    1540:	0476                	slli	s0,s0,0x1d
    1542:	07b2                	slli	a5,a5,0xc
    1544:	7ff57513          	andi	a0,a0,2047
    1548:	0552                	slli	a0,a0,0x14
    154a:	83b1                	srli	a5,a5,0xc
    154c:	8fc9                	or	a5,a5,a0
    154e:	40a2                	lw	ra,8(sp)
    1550:	8522                	mv	a0,s0
    1552:	4412                	lw	s0,4(sp)
    1554:	04fe                	slli	s1,s1,0x1f
    1556:	0097e733          	or	a4,a5,s1
    155a:	85ba                	mv	a1,a4
    155c:	4482                	lw	s1,0(sp)
    155e:	0131                	addi	sp,sp,12
    1560:	8082                	ret
    1562:	eb95                	bnez	a5,1596 <__extendsfdf2+0x82>
    1564:	dc79                	beqz	s0,1542 <__extendsfdf2+0x2e>
    1566:	8522                	mv	a0,s0
    1568:	2285                	jal	16c8 <__clzsi2>
    156a:	47a9                	li	a5,10
    156c:	00a7cf63          	blt	a5,a0,158a <__extendsfdf2+0x76>
    1570:	47ad                	li	a5,11
    1572:	8f89                	sub	a5,a5,a0
    1574:	01550713          	addi	a4,a0,21
    1578:	00f457b3          	srl	a5,s0,a5
    157c:	00e41433          	sll	s0,s0,a4
    1580:	38900713          	li	a4,905
    1584:	40a70533          	sub	a0,a4,a0
    1588:	bf6d                	j	1542 <__extendsfdf2+0x2e>
    158a:	ff550793          	addi	a5,a0,-11
    158e:	00f417b3          	sll	a5,s0,a5
    1592:	4401                	li	s0,0
    1594:	b7f5                	j	1580 <__extendsfdf2+0x6c>
    1596:	4781                	li	a5,0
    1598:	c419                	beqz	s0,15a6 <__extendsfdf2+0x92>
    159a:	00345793          	srli	a5,s0,0x3
    159e:	00080737          	lui	a4,0x80
    15a2:	0476                	slli	s0,s0,0x1d
    15a4:	8fd9                	or	a5,a5,a4
    15a6:	7ff00513          	li	a0,2047
    15aa:	bf61                	j	1542 <__extendsfdf2+0x2e>

000015ac <__truncdfsf2>:
    15ac:	0145d613          	srli	a2,a1,0x14
    15b0:	00c59693          	slli	a3,a1,0xc
    15b4:	7ff67313          	andi	t1,a2,2047
    15b8:	82b1                	srli	a3,a3,0xc
    15ba:	00130713          	addi	a4,t1,1 # 10001 <__erodata+0xcccd>
    15be:	01d55793          	srli	a5,a0,0x1d
    15c2:	068e                	slli	a3,a3,0x3
    15c4:	7fe77713          	andi	a4,a4,2046
    15c8:	8edd                	or	a3,a3,a5
    15ca:	81fd                	srli	a1,a1,0x1f
    15cc:	00351793          	slli	a5,a0,0x3
    15d0:	c349                	beqz	a4,1652 <__truncdfsf2+0xa6>
    15d2:	c8030713          	addi	a4,t1,-896
    15d6:	0fe00613          	li	a2,254
    15da:	08e64963          	blt	a2,a4,166c <__truncdfsf2+0xc0>
    15de:	06e04263          	bgtz	a4,1642 <__truncdfsf2+0x96>
    15e2:	5625                	li	a2,-23
    15e4:	0cc74763          	blt	a4,a2,16b2 <__truncdfsf2+0x106>
    15e8:	00800637          	lui	a2,0x800
    15ec:	4579                	li	a0,30
    15ee:	8ed1                	or	a3,a3,a2
    15f0:	8d19                	sub	a0,a0,a4
    15f2:	467d                	li	a2,31
    15f4:	02a64363          	blt	a2,a0,161a <__truncdfsf2+0x6e>
    15f8:	c8230613          	addi	a2,t1,-894
    15fc:	00a7d533          	srl	a0,a5,a0
    1600:	00c797b3          	sll	a5,a5,a2
    1604:	00f037b3          	snez	a5,a5
    1608:	00c696b3          	sll	a3,a3,a2
    160c:	8fd5                	or	a5,a5,a3
    160e:	8fc9                	or	a5,a5,a0
    1610:	4701                	li	a4,0
    1612:	0077f693          	andi	a3,a5,7
    1616:	ceb1                	beqz	a3,1672 <__truncdfsf2+0xc6>
    1618:	a879                	j	16b6 <__truncdfsf2+0x10a>
    161a:	52f9                	li	t0,-2
    161c:	40e28733          	sub	a4,t0,a4
    1620:	02000293          	li	t0,32
    1624:	00e6d733          	srl	a4,a3,a4
    1628:	4601                	li	a2,0
    162a:	00550663          	beq	a0,t0,1636 <__truncdfsf2+0x8a>
    162e:	ca230613          	addi	a2,t1,-862
    1632:	00c69633          	sll	a2,a3,a2
    1636:	8e5d                	or	a2,a2,a5
    1638:	00c03633          	snez	a2,a2
    163c:	00c767b3          	or	a5,a4,a2
    1640:	bfc1                	j	1610 <__truncdfsf2+0x64>
    1642:	051a                	slli	a0,a0,0x6
    1644:	00a03533          	snez	a0,a0
    1648:	068e                	slli	a3,a3,0x3
    164a:	83f5                	srli	a5,a5,0x1d
    164c:	8ec9                	or	a3,a3,a0
    164e:	8fd5                	or	a5,a5,a3
    1650:	b7c9                	j	1612 <__truncdfsf2+0x66>
    1652:	8fd5                	or	a5,a5,a3
    1654:	00031563          	bnez	t1,165e <__truncdfsf2+0xb2>
    1658:	00f037b3          	snez	a5,a5
    165c:	bf55                	j	1610 <__truncdfsf2+0x64>
    165e:	0ff00713          	li	a4,255
    1662:	cb81                	beqz	a5,1672 <__truncdfsf2+0xc6>
    1664:	068e                	slli	a3,a3,0x3
    1666:	020007b7          	lui	a5,0x2000
    166a:	b7d5                	j	164e <__truncdfsf2+0xa2>
    166c:	4781                	li	a5,0
    166e:	0ff00713          	li	a4,255
    1672:	00579693          	slli	a3,a5,0x5
    1676:	0006db63          	bgez	a3,168c <__truncdfsf2+0xe0>
    167a:	0705                	addi	a4,a4,1
    167c:	0ff00693          	li	a3,255
    1680:	04d70263          	beq	a4,a3,16c4 <__truncdfsf2+0x118>
    1684:	fc0006b7          	lui	a3,0xfc000
    1688:	16fd                	addi	a3,a3,-1
    168a:	8ff5                	and	a5,a5,a3
    168c:	0ff00693          	li	a3,255
    1690:	838d                	srli	a5,a5,0x3
    1692:	00d71663          	bne	a4,a3,169e <__truncdfsf2+0xf2>
    1696:	c781                	beqz	a5,169e <__truncdfsf2+0xf2>
    1698:	004007b7          	lui	a5,0x400
    169c:	4581                	li	a1,0
    169e:	07a6                	slli	a5,a5,0x9
    16a0:	0ff77713          	andi	a4,a4,255
    16a4:	075e                	slli	a4,a4,0x17
    16a6:	83a5                	srli	a5,a5,0x9
    16a8:	05fe                	slli	a1,a1,0x1f
    16aa:	8fd9                	or	a5,a5,a4
    16ac:	00b7e533          	or	a0,a5,a1
    16b0:	8082                	ret
    16b2:	4785                	li	a5,1
    16b4:	4701                	li	a4,0
    16b6:	00f7f693          	andi	a3,a5,15
    16ba:	4611                	li	a2,4
    16bc:	fac68be3          	beq	a3,a2,1672 <__truncdfsf2+0xc6>
    16c0:	0791                	addi	a5,a5,4
    16c2:	bf45                	j	1672 <__truncdfsf2+0xc6>
    16c4:	4781                	li	a5,0
    16c6:	b7d9                	j	168c <__truncdfsf2+0xe0>

000016c8 <__clzsi2>:
    16c8:	67c1                	lui	a5,0x10
    16ca:	02f57563          	bleu	a5,a0,16f4 <__clzsi2+0x2c>
    16ce:	0ff00793          	li	a5,255
    16d2:	00a7b7b3          	sltu	a5,a5,a0
    16d6:	078e                	slli	a5,a5,0x3
    16d8:	02000713          	li	a4,32
    16dc:	8f1d                	sub	a4,a4,a5
    16de:	00f557b3          	srl	a5,a0,a5
    16e2:	650d                	lui	a0,0x3
    16e4:	bc050513          	addi	a0,a0,-1088 # 2bc0 <__clz_tab>
    16e8:	97aa                	add	a5,a5,a0
    16ea:	0007c503          	lbu	a0,0(a5) # 10000 <__erodata+0xcccc>
    16ee:	40a70533          	sub	a0,a4,a0
    16f2:	8082                	ret
    16f4:	01000737          	lui	a4,0x1000
    16f8:	47c1                	li	a5,16
    16fa:	fce56fe3          	bltu	a0,a4,16d8 <__clzsi2+0x10>
    16fe:	47e1                	li	a5,24
    1700:	bfe1                	j	16d8 <__clzsi2+0x10>

00001702 <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
    1702:	1151                	addi	sp,sp,-12
    1704:	c026                	sw	s1,0(sp)
    1706:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
    1708:	4188                	lw	a0,0(a1)
{
    170a:	c222                	sw	s0,4(sp)
    170c:	c406                	sw	ra,8(sp)
    170e:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
    1710:	2c9d                	jal	1986 <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    1712:	0505                	addi	a0,a0,1
    1714:	0512                	slli	a0,a0,0x4
    1716:	00a487b3          	add	a5,s1,a0
    171a:	4b94                	lw	a3,16(a5)
    171c:	0521                	addi	a0,a0,8
    171e:	9526                	add	a0,a0,s1
    1720:	c2b1                	beqz	a3,1764 <mm_addfreechunk+0x62>
       next && next->size && next->size < node->size;
    1722:	429c                	lw	a5,0(a3)
    1724:	c78d                	beqz	a5,174e <mm_addfreechunk+0x4c>
    1726:	4010                	lw	a2,0(s0)
    1728:	00c7e863          	bltu	a5,a2,1738 <mm_addfreechunk+0x36>
    172c:	a00d                	j	174e <mm_addfreechunk+0x4c>
    172e:	4398                	lw	a4,0(a5)
    1730:	c30d                	beqz	a4,1752 <mm_addfreechunk+0x50>
    1732:	02c77063          	bleu	a2,a4,1752 <mm_addfreechunk+0x50>
    1736:	86be                	mv	a3,a5
       prev = next, next = next->flink);
    1738:	469c                	lw	a5,8(a3)
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    173a:	fbf5                	bnez	a5,172e <mm_addfreechunk+0x2c>

  /* Does it go in mid next or at the end? */

  prev->flink = node;
    173c:	c680                	sw	s0,8(a3)
  node->blink = prev;
    173e:	c454                	sw	a3,12(s0)
  node->flink = next;
    1740:	00042423          	sw	zero,8(s0) # 400008 <__erodata+0x3fccd4>
    {
      /* The new node goes between prev and next */

      next->blink = node;
    }
}
    1744:	40a2                	lw	ra,8(sp)
    1746:	4412                	lw	s0,4(sp)
    1748:	4482                	lw	s1,0(sp)
    174a:	0131                	addi	sp,sp,12
    174c:	8082                	ret
       next && next->size && next->size < node->size;
    174e:	87b6                	mv	a5,a3
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    1750:	86aa                	mv	a3,a0
  prev->flink = node;
    1752:	c680                	sw	s0,8(a3)
  node->blink = prev;
    1754:	c454                	sw	a3,12(s0)
  node->flink = next;
    1756:	c41c                	sw	a5,8(s0)
      next->blink = node;
    1758:	c7c0                	sw	s0,12(a5)
}
    175a:	40a2                	lw	ra,8(sp)
    175c:	4412                	lw	s0,4(sp)
    175e:	4482                	lw	s1,0(sp)
    1760:	0131                	addi	sp,sp,12
    1762:	8082                	ret
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
    1764:	86aa                	mv	a3,a0
    1766:	bfd9                	j	173c <mm_addfreechunk+0x3a>

00001768 <mm_addregion>:

  //mlldbg("Region %d: base=%p size=%u\n", IDX+1, heapstart, heapsize);

  /* Add the size of this region to the total size of the heap */

  heap->mm_heapsize += heapsize;
    1768:	4554                	lw	a3,12(a0)
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    176a:	00f58793          	addi	a5,a1,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
    176e:	962e                	add	a2,a2,a1
    1770:	9a41                	andi	a2,a2,-16
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
    1772:	ff07f593          	andi	a1,a5,-16
  heapsize = heapend - heapbase;
    1776:	40b607b3          	sub	a5,a2,a1
  heap->mm_heapsize += heapsize;
    177a:	96be                	add	a3,a3,a5
    177c:	c554                	sw	a3,12(a0)
   *
   * And create one free node between the guard nodes that contains
   * all available memory.
   */

  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
    177e:	c90c                	sw	a1,16(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    1780:	46a1                	li	a3,8
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    1782:	800002b7          	lui	t0,0x80000

  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
    1786:	17c1                	addi	a5,a5,-16
    1788:	c59c                	sw	a5,8(a1)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
    178a:	c194                	sw	a3,0(a1)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
    178c:	0055a223          	sw	t0,4(a1)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
    1790:	05a1                	addi	a1,a1,8
  node->preceding             = SIZEOF_MM_ALLOCNODE;
    1792:	c1d4                	sw	a3,4(a1)

  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
    1794:	ff860313          	addi	t1,a2,-8 # 7ffff8 <__erodata+0x7fccc4>
    1798:	00652a23          	sw	t1,20(a0)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    179c:	0057e7b3          	or	a5,a5,t0
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
    17a0:	fed62c23          	sw	a3,-8(a2)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
    17a4:	fef62e23          	sw	a5,-4(a2)
  heap->mm_nregions++;
#endif

  /* Add the single, large free node to the nodelist */

  mm_addfreechunk(heap, node);
    17a8:	bfa9                	j	1702 <mm_addfreechunk>

000017aa <mm_initialize>:
 *
 ****************************************************************************/

void mm_initialize(struct mm_heap_s *heap, void *heapstart,
                   size_t heapsize)
{
    17aa:	1141                	addi	sp,sp,-16
    17ac:	c422                	sw	s0,8(sp)
    17ae:	c226                	sw	s1,4(sp)
    17b0:	c606                	sw	ra,12(sp)
    17b2:	842a                	mv	s0,a0
    17b4:	c032                	sw	a2,0(sp)
  //CHECK_FREENODE_SIZE;
#endif

  /* Set up global variables */

  heap->mm_heapsize = 0;
    17b6:	00052623          	sw	zero,12(a0)
{
    17ba:	84ae                	mv	s1,a1
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
    17bc:	13000613          	li	a2,304
    17c0:	4581                	li	a1,0
    17c2:	0561                	addi	a0,a0,24
    17c4:	879fe0ef          	jal	ra,3c <memset>
  for (i = 1; i < MM_NNODES; i++)
    17c8:	4302                	lw	t1,0(sp)
    17ca:	02840793          	addi	a5,s0,40
    17ce:	14840693          	addi	a3,s0,328
    {
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    17d2:	ff078713          	addi	a4,a5,-16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
    17d6:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
    17da:	c7d8                	sw	a4,12(a5)
    17dc:	07c1                	addi	a5,a5,16
  for (i = 1; i < MM_NNODES; i++)
    17de:	fed79ae3          	bne	a5,a3,17d2 <mm_initialize+0x28>

  mm_seminitialize(heap);

  /* Add the initial region of memory to the heap */

  mm_addregion(heap, heapstart, heapsize);
    17e2:	8522                	mv	a0,s0
}
    17e4:	4422                	lw	s0,8(sp)
    17e6:	40b2                	lw	ra,12(sp)
  mm_addregion(heap, heapstart, heapsize);
    17e8:	85a6                	mv	a1,s1
}
    17ea:	4492                	lw	s1,4(sp)
  mm_addregion(heap, heapstart, heapsize);
    17ec:	861a                	mv	a2,t1
}
    17ee:	0141                	addi	sp,sp,16
  mm_addregion(heap, heapstart, heapsize);
    17f0:	bfa5                	j	1768 <mm_addregion>

000017f2 <mm_heap_initialize>:

void mm_heap_initialize(void)
{
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
    17f2:	200045b7          	lui	a1,0x20004
    17f6:	200807b7          	lui	a5,0x20080
    17fa:	9e458613          	addi	a2,a1,-1564 # 200039e4 <__bss_end__>
    17fe:	00078793          	mv	a5,a5
    1802:	20001537          	lui	a0,0x20001
    1806:	40c78633          	sub	a2,a5,a2
    180a:	9e458593          	addi	a1,a1,-1564
    180e:	09c50513          	addi	a0,a0,156 # 2000109c <g_mmheap>
    1812:	bf61                	j	17aa <mm_initialize>

00001814 <mm_mallinfo>:
 *   mallinfo returns a copy of updated current heap information.
 *
 ****************************************************************************/

int mm_mallinfo(struct mm_heap_s *heap, struct mallinfo *info)
{
    1814:	1171                	addi	sp,sp,-4
    1816:	c022                	sw	s0,0(sp)
       * Retake the semaphore for each region to reduce latencies
       */

      mm_takesemaphore(heap);

      for (node = heap->mm_heapstart[region];
    1818:	491c                	lw	a5,16(a0)
           node < heap->mm_heapend[region];
    181a:	4940                	lw	s0,20(a0)
  size_t fordblks = 0;  /* Total non-inuse space */
    181c:	4601                	li	a2,0
      for (node = heap->mm_heapstart[region];
    181e:	0487f463          	bleu	s0,a5,1866 <mm_mallinfo+0x52>
  size_t uordblks = 0;  /* Total allocated space */
    1822:	4381                	li	t2,0
  int    ordblks  = 0;  /* Number of non-inuse chunks */
    1824:	4301                	li	t1,0
  size_t mxordblk = 0;
    1826:	4281                	li	t0,0
    1828:	a809                	j	183a <mm_mallinfo+0x26>
            {
              uordblks += node->size;
            }
          else
            {
              ordblks++;
    182a:	0305                	addi	t1,t1,1
              fordblks += node->size;
    182c:	963a                	add	a2,a2,a4
              if (node->size > mxordblk)
    182e:	00e2f363          	bleu	a4,t0,1834 <mm_mallinfo+0x20>
    1832:	82ba                	mv	t0,a4
           node = (struct mm_allocnode_s *)((char *)node + node->size))
    1834:	97ba                	add	a5,a5,a4
      for (node = heap->mm_heapstart[region];
    1836:	0087fa63          	bleu	s0,a5,184a <mm_mallinfo+0x36>
          if ((node->preceding & MM_ALLOC_BIT) != 0)
    183a:	43d4                	lw	a3,4(a5)
    183c:	4398                	lw	a4,0(a5)
    183e:	fe06d6e3          	bgez	a3,182a <mm_mallinfo+0x16>
           node = (struct mm_allocnode_s *)((char *)node + node->size))
    1842:	97ba                	add	a5,a5,a4
              uordblks += node->size;
    1844:	93ba                	add	t2,t2,a4
      for (node = heap->mm_heapstart[region];
    1846:	fe87eae3          	bltu	a5,s0,183a <mm_mallinfo+0x26>
    184a:	03a1                	addi	t2,t2,8
    }
#undef region

  //DEBUGASSERT(uordblks + fordblks == heap->mm_heapsize);

  info->arena    = heap->mm_heapsize;
    184c:	455c                	lw	a5,12(a0)
  info->ordblks  = ordblks;
  info->mxordblk = mxordblk;
  info->uordblks = uordblks;
  info->fordblks = fordblks;
  return OK;
}
    184e:	4402                	lw	s0,0(sp)
  info->ordblks  = ordblks;
    1850:	0065a223          	sw	t1,4(a1)
  info->arena    = heap->mm_heapsize;
    1854:	c19c                	sw	a5,0(a1)
  info->mxordblk = mxordblk;
    1856:	0055a423          	sw	t0,8(a1)
  info->uordblks = uordblks;
    185a:	0075a623          	sw	t2,12(a1)
  info->fordblks = fordblks;
    185e:	c990                	sw	a2,16(a1)
}
    1860:	4501                	li	a0,0
    1862:	0111                	addi	sp,sp,4
    1864:	8082                	ret
      for (node = heap->mm_heapstart[region];
    1866:	43a1                	li	t2,8
    1868:	4281                	li	t0,0
  int    ordblks  = 0;  /* Number of non-inuse chunks */
    186a:	4301                	li	t1,0
    186c:	b7c5                	j	184c <mm_mallinfo+0x38>

0000186e <mm_max_usedsize_update>:

#if (CONFIG_MM_MAX_USED)
static int g_max_used_size = 0;
int mm_max_usedsize_update(struct mm_heap_s *heap)
{
    186e:	1101                	addi	sp,sp,-32
    1870:	cc22                	sw	s0,24(sp)
    struct mallinfo info;
    mm_mallinfo(heap, &info);
    1872:	858a                	mv	a1,sp

    if(info.uordblks > g_max_used_size)
    1874:	20000437          	lui	s0,0x20000
{
    1878:	ce06                	sw	ra,28(sp)
    if(info.uordblks > g_max_used_size)
    187a:	00440413          	addi	s0,s0,4 # 20000004 <__data_end__>
    mm_mallinfo(heap, &info);
    187e:	3f59                	jal	1814 <mm_mallinfo>
    if(info.uordblks > g_max_used_size)
    1880:	4732                	lw	a4,12(sp)
    1882:	4008                	lw	a0,0(s0)
    1884:	00e55f63          	ble	a4,a0,18a2 <mm_max_usedsize_update+0x34>
    {
        g_max_used_size = info.uordblks;
        if(g_max_used_size >= ((uint32_t)(&__heap_end) - (uint32_t)(&__heap_start) - 2048))
    1888:	200807b7          	lui	a5,0x20080
    188c:	200046b7          	lui	a3,0x20004
    1890:	80078793          	addi	a5,a5,-2048 # 2007f800 <__bss_end__+0x7be1c>
    1894:	9e468693          	addi	a3,a3,-1564 # 200039e4 <__bss_end__>
        g_max_used_size = info.uordblks;
    1898:	c018                	sw	a4,0(s0)
        if(g_max_used_size >= ((uint32_t)(&__heap_end) - (uint32_t)(&__heap_start) - 2048))
    189a:	8f95                	sub	a5,a5,a3
    189c:	853a                	mv	a0,a4
    189e:	00f77663          	bleu	a5,a4,18aa <mm_max_usedsize_update+0x3c>
            mm_leak_dump();
#endif
        }
    }
    return g_max_used_size;
}
    18a2:	40f2                	lw	ra,28(sp)
    18a4:	4462                	lw	s0,24(sp)
    18a6:	6105                	addi	sp,sp,32
    18a8:	8082                	ret
            printf("<mem space warning> peak value %d \n", g_max_used_size);
    18aa:	00003537          	lui	a0,0x3
    18ae:	85ba                	mv	a1,a4
    18b0:	cc050513          	addi	a0,a0,-832 # 2cc0 <__clz_tab+0x100>
    18b4:	798000ef          	jal	ra,204c <printf>
    18b8:	4008                	lw	a0,0(s0)
}
    18ba:	40f2                	lw	ra,28(sp)
    18bc:	4462                	lw	s0,24(sp)
    18be:	6105                	addi	sp,sp,32
    18c0:	8082                	ret

000018c2 <mm_malloc>:
  size_t real_size;
#endif

  /* Handle bad sizes */

  if (size < 1)
    18c2:	cddd                	beqz	a1,1980 <mm_malloc+0xbe>
{
    18c4:	1141                	addi	sp,sp,-16
    18c6:	c226                	sw	s1,4(sp)

  /* Adjust the size to account for (1) the size of the allocated node and
   * (2) to make sure that it is an even multiple of our granule size.
   */

  size = MM_ALIGN_UP(size + SIZEOF_MM_ALLOCNODE);
    18c8:	01758493          	addi	s1,a1,23
{
    18cc:	c606                	sw	ra,12(sp)
    18ce:	c422                	sw	s0,8(sp)
  size = MM_ALIGN_UP(size + SIZEOF_MM_ALLOCNODE);
    18d0:	98c1                	andi	s1,s1,-16

  /* Get the location in the node list to start the search. Special case
   * really big allocations
   */

  if (size >= MM_MAX_CHUNK)
    18d2:	004007b7          	lui	a5,0x400
    18d6:	872a                	mv	a4,a0
    {
      ndx = MM_NNODES-1;
    18d8:	4549                	li	a0,18
  if (size >= MM_MAX_CHUNK)
    18da:	08f4ee63          	bltu	s1,a5,1976 <mm_malloc+0xb4>
  /* Search for a large enough chunk in the list of nodes. This list is
   * ordered by size, but will have occasional zero sized nodes as we visit
   * other mm_nodelist[] entries.
   */

  for (node = heap->mm_nodelist[ndx].flink;
    18de:	00150793          	addi	a5,a0,1
    18e2:	0792                	slli	a5,a5,0x4
    18e4:	97ba                	add	a5,a5,a4
    18e6:	4b80                	lw	s0,16(a5)
    18e8:	e401                	bnez	s0,18f0 <mm_malloc+0x2e>
    18ea:	a099                	j	1930 <mm_malloc+0x6e>
       node && node->size < size;
       node = node->flink);
    18ec:	4400                	lw	s0,8(s0)
  for (node = heap->mm_nodelist[ndx].flink;
    18ee:	c029                	beqz	s0,1930 <mm_malloc+0x6e>
       node && node->size < size;
    18f0:	401c                	lw	a5,0(s0)
    18f2:	fe97ede3          	bltu	a5,s1,18ec <mm_malloc+0x2a>
      /* Remove the node.  There must be a predecessor, but there may not be
       * a successor node.
       */

      //DEBUGASSERT(node->blink);
      node->blink->flink = node->flink;
    18f6:	4414                	lw	a3,8(s0)
    18f8:	4450                	lw	a2,12(s0)
    18fa:	c614                	sw	a3,8(a2)
      if (node->flink)
    18fc:	4414                	lw	a3,8(s0)
    18fe:	c291                	beqz	a3,1902 <mm_malloc+0x40>
        {
          node->flink->blink = node->blink;
    1900:	c6d0                	sw	a2,12(a3)
       * bytes can be smaller (they may be SIZEOF_MM_ALLOCNODE).  In that
       * case, we will just carry the few wasted bytes at the end of the
       * allocation.
       */

      remaining = node->size - size;
    1902:	409786b3          	sub	a3,a5,s1
      if (remaining >= SIZEOF_MM_FREENODE)
    1906:	463d                	li	a2,15
    1908:	02d66e63          	bltu	a2,a3,1944 <mm_malloc+0x82>
          mm_addfreechunk(heap, remainder);
        }

      /* Handle the case of an exact size match */

      node->preceding |= MM_ALLOC_BIT;
    190c:	4054                	lw	a3,4(s0)
    190e:	80000637          	lui	a2,0x80000
      ret = (void *)((char *)node + SIZEOF_MM_ALLOCNODE);
    1912:	00840793          	addi	a5,s0,8
      node->preceding |= MM_ALLOC_BIT;
    1916:	8ed1                	or	a3,a3,a2
    1918:	c054                	sw	a3,4(s0)
    mm_leak_add_chunk(hdr);
    mm_record_minfree();
  }
#endif
  mm_givesemaphore(heap);
  if (!ret) {
    191a:	cb99                	beqz	a5,1930 <mm_malloc+0x6e>
    mm_leak_dump();
#endif
  }

#if (CONFIG_MM_MAX_USED)
  mm_max_usedsize_update(heap);
    191c:	853a                	mv	a0,a4
    191e:	c03e                	sw	a5,0(sp)
    1920:	37b9                	jal	186e <mm_max_usedsize_update>
#endif
  return ret;
    1922:	4782                	lw	a5,0(sp)
}
    1924:	40b2                	lw	ra,12(sp)
    1926:	4422                	lw	s0,8(sp)
    1928:	4492                	lw	s1,4(sp)
    192a:	853e                	mv	a0,a5
    192c:	0141                	addi	sp,sp,16
    192e:	8082                	ret
    printf("Allocation failed, size %d\n", size);
    1930:	00003537          	lui	a0,0x3
    1934:	85a6                	mv	a1,s1
    1936:	ce450513          	addi	a0,a0,-796 # 2ce4 <__clz_tab+0x124>
    193a:	c03a                	sw	a4,0(sp)
    193c:	2f01                	jal	204c <printf>
    193e:	4781                	li	a5,0
    1940:	4702                	lw	a4,0(sp)
    1942:	bfe9                	j	191c <mm_malloc+0x5a>
          remainder = (struct mm_freenode_s *)(((char *)node) + size);
    1944:	009405b3          	add	a1,s0,s1
          remainder->preceding = size;
    1948:	c1c4                	sw	s1,4(a1)
          next = (struct mm_freenode_s *)(((char *)node) + node->size);
    194a:	97a2                	add	a5,a5,s0
          next->preceding = remaining | (next->preceding & MM_ALLOC_BIT);
    194c:	43c8                	lw	a0,4(a5)
    194e:	80000637          	lui	a2,0x80000
          remainder->size = remaining;
    1952:	c194                	sw	a3,0(a1)
          next->preceding = remaining | (next->preceding & MM_ALLOC_BIT);
    1954:	8e69                	and	a2,a2,a0
    1956:	8ed1                	or	a3,a3,a2
          node->size = size;
    1958:	c004                	sw	s1,0(s0)
          next->preceding = remaining | (next->preceding & MM_ALLOC_BIT);
    195a:	c3d4                	sw	a3,4(a5)
          mm_addfreechunk(heap, remainder);
    195c:	853a                	mv	a0,a4
    195e:	c03a                	sw	a4,0(sp)
    1960:	334d                	jal	1702 <mm_addfreechunk>
      node->preceding |= MM_ALLOC_BIT;
    1962:	4054                	lw	a3,4(s0)
    1964:	80000637          	lui	a2,0x80000
      ret = (void *)((char *)node + SIZEOF_MM_ALLOCNODE);
    1968:	00840793          	addi	a5,s0,8
      node->preceding |= MM_ALLOC_BIT;
    196c:	8ed1                	or	a3,a3,a2
    196e:	c054                	sw	a3,4(s0)
          mm_addfreechunk(heap, remainder);
    1970:	4702                	lw	a4,0(sp)
  if (!ret) {
    1972:	f7cd                	bnez	a5,191c <mm_malloc+0x5a>
    1974:	bf75                	j	1930 <mm_malloc+0x6e>
      ndx = mm_size2ndx(size);
    1976:	8526                	mv	a0,s1
    1978:	c03a                	sw	a4,0(sp)
    197a:	2031                	jal	1986 <mm_size2ndx>
    197c:	4702                	lw	a4,0(sp)
    197e:	b785                	j	18de <mm_malloc+0x1c>
      return NULL;
    1980:	4781                	li	a5,0
}
    1982:	853e                	mv	a0,a5
    1984:	8082                	ret

00001986 <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
    1986:	004007b7          	lui	a5,0x400
    198a:	00f57d63          	bleu	a5,a0,19a4 <mm_size2ndx+0x1e>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
    198e:	00455793          	srli	a5,a0,0x4
  while (size > 1)
    1992:	4705                	li	a4,1
  int ndx = 0;
    1994:	4501                	li	a0,0
  while (size > 1)
    1996:	00f77963          	bleu	a5,a4,19a8 <mm_size2ndx+0x22>
    {
      ndx++;
      size >>= 1;
    199a:	8385                	srli	a5,a5,0x1
      ndx++;
    199c:	0505                	addi	a0,a0,1
  while (size > 1)
    199e:	fee79ee3          	bne	a5,a4,199a <mm_size2ndx+0x14>
    19a2:	8082                	ret
       return MM_NNODES-1;
    19a4:	4549                	li	a0,18
    19a6:	8082                	ret
    }

  return ndx;
}
    19a8:	8082                	ret

000019aa <malloc>:
#else
#include <umm_heap.h>
#endif

void *malloc(size_t size)
{
    19aa:	1151                	addi	sp,sp,-12
    19ac:	c406                	sw	ra,8(sp)
    void *ret;

#ifdef CONFIG_KERNEL_NONE
    ret = mm_malloc(USR_HEAP, size, __builtin_return_address(0));
    19ae:	8606                	mv	a2,ra
#else
    ret = csi_kernel_malloc(size, __builtin_return_address(0));
#endif

    return ret;
}
    19b0:	40a2                	lw	ra,8(sp)
    ret = mm_malloc(USR_HEAP, size, __builtin_return_address(0));
    19b2:	85aa                	mv	a1,a0
    19b4:	20001537          	lui	a0,0x20001
    19b8:	09c50513          	addi	a0,a0,156 # 2000109c <g_mmheap>
}
    19bc:	0131                	addi	sp,sp,12
    ret = mm_malloc(USR_HEAP, size, __builtin_return_address(0));
    19be:	b711                	j	18c2 <mm_malloc>

000019c0 <fputc>:
#endif

usart_handle_t console_handle = NULL;

int fputc(int ch, FILE *stream)
{
    19c0:	1151                	addi	sp,sp,-12
    19c2:	c026                	sw	s1,0(sp)
    if (console_handle == NULL) {
    19c4:	200004b7          	lui	s1,0x20000
    19c8:	00848493          	addi	s1,s1,8 # 20000008 <console_handle>
    19cc:	409c                	lw	a5,0(s1)
{
    19ce:	c406                	sw	ra,8(sp)
    19d0:	c222                	sw	s0,4(sp)
    if (console_handle == NULL) {
    19d2:	c785                	beqz	a5,19fa <fputc+0x3a>
        return -1;
    }

    if (ch == '\n') {
    19d4:	4729                	li	a4,10
    19d6:	842a                	mv	s0,a0
    19d8:	00e50c63          	beq	a0,a4,19f0 <fputc+0x30>
        csi_usart_putchar(console_handle, '\r');
    }

    csi_usart_putchar(console_handle, ch);
    19dc:	0ff47593          	andi	a1,s0,255
    19e0:	853e                	mv	a0,a5
    19e2:	2c25                	jal	1c1a <csi_usart_putchar>

    return 0;
    19e4:	4501                	li	a0,0
}
    19e6:	40a2                	lw	ra,8(sp)
    19e8:	4412                	lw	s0,4(sp)
    19ea:	4482                	lw	s1,0(sp)
    19ec:	0131                	addi	sp,sp,12
    19ee:	8082                	ret
        csi_usart_putchar(console_handle, '\r');
    19f0:	853e                	mv	a0,a5
    19f2:	45b5                	li	a1,13
    19f4:	241d                	jal	1c1a <csi_usart_putchar>
    19f6:	409c                	lw	a5,0(s1)
    19f8:	b7d5                	j	19dc <fputc+0x1c>
        return -1;
    19fa:	557d                	li	a0,-1
    19fc:	b7ed                	j	19e6 <fputc+0x26>

000019fe <csi_usart_config_baudrate>:
  \param[in]   addr  usart base to operate.
  \return      error code
*/
int32_t csi_usart_config_baudrate(usart_handle_t handle, uint32_t baud)
{
    USART_NULL_PARAM_CHK(handle);
    19fe:	cd2d                	beqz	a0,1a78 <csi_usart_config_baudrate+0x7a>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    1a00:	4114                	lw	a3,0(a0)


    WAIT_USART_IDLE(addr);
    1a02:	5ef8                	lw	a4,124(a3)
    1a04:	8b05                	andi	a4,a4,1
    1a06:	c31d                	beqz	a4,1a2c <csi_usart_config_baudrate+0x2e>
    1a08:	000f4637          	lui	a2,0xf4
    1a0c:	4701                	li	a4,0
    1a0e:	24060613          	addi	a2,a2,576 # f4240 <__erodata+0xf0f0c>
    1a12:	a019                	j	1a18 <csi_usart_config_baudrate+0x1a>
    1a14:	04c70d63          	beq	a4,a2,1a6e <csi_usart_config_baudrate+0x70>
    1a18:	5efc                	lw	a5,124(a3)
    1a1a:	0705                	addi	a4,a4,1
    1a1c:	8b85                	andi	a5,a5,1
    1a1e:	fbfd                	bnez	a5,1a14 <csi_usart_config_baudrate+0x16>
    1a20:	000f47b7          	lui	a5,0xf4
    1a24:	24078793          	addi	a5,a5,576 # f4240 <__erodata+0xf0f0c>
    1a28:	04f70363          	beq	a4,a5,1a6e <csi_usart_config_baudrate+0x70>

    /* baudrate=(seriak clock freq)/(16*divisor); algorithm :rounding*/
    uint32_t divisor = ((LSP_DEFAULT_FREQ  * 10) / baud) >> 4;
    1a2c:	0bebc7b7          	lui	a5,0xbebc
    1a30:	20078793          	addi	a5,a5,512 # bebc200 <__erodata+0xbeb8ecc>
    1a34:	02b7d7b3          	divu	a5,a5,a1
        divisor = (divisor / 10) + 1;
    } else {
        divisor = divisor / 10;
    }

    addr->LCR |= LCR_SET_DLAB;
    1a38:	46d8                	lw	a4,12(a3)
    1a3a:	4629                	li	a2,10
     * The DLAB must be cleared after the baudrate is setted
     * to access other registers.
     */
    addr->LCR &= (~LCR_SET_DLAB);

    return 0;
    1a3c:	4501                	li	a0,0
    addr->LCR |= LCR_SET_DLAB;
    1a3e:	08076713          	ori	a4,a4,128
    1a42:	c6d8                	sw	a4,12(a3)
    uint32_t divisor = ((LSP_DEFAULT_FREQ  * 10) / baud) >> 4;
    1a44:	8391                	srli	a5,a5,0x4
    if ((divisor % 10) >= 5) {
    1a46:	02c7f733          	remu	a4,a5,a2
    1a4a:	02c7d7b3          	divu	a5,a5,a2
        divisor = (divisor / 10) + 1;
    1a4e:	4611                	li	a2,4
    1a50:	00e63733          	sltu	a4,a2,a4
    1a54:	97ba                	add	a5,a5,a4
    addr->DLL = divisor & 0xff;
    1a56:	0ff7f713          	andi	a4,a5,255
    addr->DLH = (divisor >> 8) & 0xff;
    1a5a:	83a1                	srli	a5,a5,0x8
    addr->DLL = divisor & 0xff;
    1a5c:	c298                	sw	a4,0(a3)
    addr->DLH = (divisor >> 8) & 0xff;
    1a5e:	0ff7f793          	andi	a5,a5,255
    1a62:	c2dc                	sw	a5,4(a3)
    addr->LCR &= (~LCR_SET_DLAB);
    1a64:	46dc                	lw	a5,12(a3)
    1a66:	f7f7f793          	andi	a5,a5,-129
    1a6a:	c6dc                	sw	a5,12(a3)
    return 0;
    1a6c:	8082                	ret
    WAIT_USART_IDLE(addr);
    1a6e:	81020537          	lui	a0,0x81020
    1a72:	08250513          	addi	a0,a0,130 # 81020082 <__heap_end+0x60fa0082>
}
    1a76:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1a78:	81020537          	lui	a0,0x81020
    1a7c:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>
    1a80:	8082                	ret

00001a82 <csi_usart_config_parity>:
  \param[in]   parity    \ref usart_parity_e
  \return      error code
*/
int32_t csi_usart_config_parity(usart_handle_t handle, usart_parity_e parity)
{
    USART_NULL_PARAM_CHK(handle);
    1a82:	c149                	beqz	a0,1b04 <csi_usart_config_parity+0x82>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    1a84:	4114                	lw	a3,0(a0)

    WAIT_USART_IDLE(addr);
    1a86:	5efc                	lw	a5,124(a3)
    1a88:	8b85                	andi	a5,a5,1
    1a8a:	c39d                	beqz	a5,1ab0 <csi_usart_config_parity+0x2e>
    1a8c:	000f4637          	lui	a2,0xf4
    1a90:	4701                	li	a4,0
    1a92:	24060613          	addi	a2,a2,576 # f4240 <__erodata+0xf0f0c>
    1a96:	a019                	j	1a9c <csi_usart_config_parity+0x1a>
    1a98:	06c70163          	beq	a4,a2,1afa <csi_usart_config_parity+0x78>
    1a9c:	5efc                	lw	a5,124(a3)
    1a9e:	0705                	addi	a4,a4,1
    1aa0:	8b85                	andi	a5,a5,1
    1aa2:	fbfd                	bnez	a5,1a98 <csi_usart_config_parity+0x16>
    1aa4:	000f47b7          	lui	a5,0xf4
    1aa8:	24078793          	addi	a5,a5,576 # f4240 <__erodata+0xf0f0c>
    1aac:	04f70763          	beq	a4,a5,1afa <csi_usart_config_parity+0x78>

    switch (parity) {
    1ab0:	4785                	li	a5,1
    1ab2:	02f58a63          	beq	a1,a5,1ae6 <csi_usart_config_parity+0x64>
    1ab6:	c19d                	beqz	a1,1adc <csi_usart_config_parity+0x5a>
    1ab8:	4789                	li	a5,2
    1aba:	00f58763          	beq	a1,a5,1ac8 <csi_usart_config_parity+0x46>
            addr->LCR |= LCR_PARITY_ENABLE;
            addr->LCR |= LCR_PARITY_EVEN;
            break;

        default:
            return ERR_USART(USART_ERROR_PARITY);
    1abe:	81020537          	lui	a0,0x81020
    1ac2:	08950513          	addi	a0,a0,137 # 81020089 <__heap_end+0x60fa0089>
    1ac6:	8082                	ret
            addr->LCR |= LCR_PARITY_ENABLE;
    1ac8:	46dc                	lw	a5,12(a3)
    }

    return 0;
    1aca:	4501                	li	a0,0
            addr->LCR |= LCR_PARITY_ENABLE;
    1acc:	0087e793          	ori	a5,a5,8
    1ad0:	c6dc                	sw	a5,12(a3)
            addr->LCR &= LCR_PARITY_ODD;
    1ad2:	46dc                	lw	a5,12(a3)
    1ad4:	0ef7f793          	andi	a5,a5,239
    1ad8:	c6dc                	sw	a5,12(a3)
            break;
    1ada:	8082                	ret
            addr->LCR &= (~LCR_PARITY_ENABLE);
    1adc:	46dc                	lw	a5,12(a3)
    return 0;
    1ade:	4501                	li	a0,0
            addr->LCR &= (~LCR_PARITY_ENABLE);
    1ae0:	9bdd                	andi	a5,a5,-9
    1ae2:	c6dc                	sw	a5,12(a3)
            break;
    1ae4:	8082                	ret
            addr->LCR |= LCR_PARITY_ENABLE;
    1ae6:	46dc                	lw	a5,12(a3)
    return 0;
    1ae8:	4501                	li	a0,0
            addr->LCR |= LCR_PARITY_ENABLE;
    1aea:	0087e793          	ori	a5,a5,8
    1aee:	c6dc                	sw	a5,12(a3)
            addr->LCR |= LCR_PARITY_EVEN;
    1af0:	46dc                	lw	a5,12(a3)
    1af2:	0107e793          	ori	a5,a5,16
    1af6:	c6dc                	sw	a5,12(a3)
            break;
    1af8:	8082                	ret
    WAIT_USART_IDLE(addr);
    1afa:	81020537          	lui	a0,0x81020
    1afe:	08250513          	addi	a0,a0,130 # 81020082 <__heap_end+0x60fa0082>
}
    1b02:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1b04:	81020537          	lui	a0,0x81020
    1b08:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>
    1b0c:	8082                	ret

00001b0e <csi_usart_config_stopbits>:
  \param[in]   stopbits  \ref usart_stop_bits_e
  \return      error code
*/
int32_t csi_usart_config_stopbits(usart_handle_t handle, usart_stop_bits_e stopbit)
{
    USART_NULL_PARAM_CHK(handle);
    1b0e:	c12d                	beqz	a0,1b70 <csi_usart_config_stopbits+0x62>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    1b10:	4114                	lw	a3,0(a0)

    WAIT_USART_IDLE(addr);
    1b12:	5efc                	lw	a5,124(a3)
    1b14:	8b85                	andi	a5,a5,1
    1b16:	c39d                	beqz	a5,1b3c <csi_usart_config_stopbits+0x2e>
    1b18:	000f4637          	lui	a2,0xf4
    1b1c:	4701                	li	a4,0
    1b1e:	24060613          	addi	a2,a2,576 # f4240 <__erodata+0xf0f0c>
    1b22:	a019                	j	1b28 <csi_usart_config_stopbits+0x1a>
    1b24:	04c70163          	beq	a4,a2,1b66 <csi_usart_config_stopbits+0x58>
    1b28:	5efc                	lw	a5,124(a3)
    1b2a:	0705                	addi	a4,a4,1
    1b2c:	8b85                	andi	a5,a5,1
    1b2e:	fbfd                	bnez	a5,1b24 <csi_usart_config_stopbits+0x16>
    1b30:	000f47b7          	lui	a5,0xf4
    1b34:	24078793          	addi	a5,a5,576 # f4240 <__erodata+0xf0f0c>
    1b38:	02f70763          	beq	a4,a5,1b66 <csi_usart_config_stopbits+0x58>

    switch (stopbit) {
    1b3c:	cd99                	beqz	a1,1b5a <csi_usart_config_stopbits+0x4c>
    1b3e:	4785                	li	a5,1
    1b40:	00f58763          	beq	a1,a5,1b4e <csi_usart_config_stopbits+0x40>
            */
            addr->LCR |= LCR_STOP_BIT2;
            break;

        default:
            return ERR_USART(USART_ERROR_STOP_BITS);
    1b44:	81020537          	lui	a0,0x81020
    1b48:	08a50513          	addi	a0,a0,138 # 8102008a <__heap_end+0x60fa008a>
    1b4c:	8082                	ret
            addr->LCR |= LCR_STOP_BIT2;
    1b4e:	46dc                	lw	a5,12(a3)
    }

    return 0;
    1b50:	4501                	li	a0,0
            addr->LCR |= LCR_STOP_BIT2;
    1b52:	0047e793          	ori	a5,a5,4
    1b56:	c6dc                	sw	a5,12(a3)
            break;
    1b58:	8082                	ret
            addr->LCR &= LCR_STOP_BIT1;
    1b5a:	46dc                	lw	a5,12(a3)
    return 0;
    1b5c:	4501                	li	a0,0
            addr->LCR &= LCR_STOP_BIT1;
    1b5e:	0fb7f793          	andi	a5,a5,251
    1b62:	c6dc                	sw	a5,12(a3)
            break;
    1b64:	8082                	ret
    WAIT_USART_IDLE(addr);
    1b66:	81020537          	lui	a0,0x81020
    1b6a:	08250513          	addi	a0,a0,130 # 81020082 <__heap_end+0x60fa0082>
}
    1b6e:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1b70:	81020537          	lui	a0,0x81020
    1b74:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>
    1b78:	8082                	ret

00001b7a <csi_usart_config_databits>:
  \param[in]   databits      \ref usart_data_bits_e
  \return      error code
*/
int32_t csi_usart_config_databits(usart_handle_t handle, usart_data_bits_e databits)
{
    USART_NULL_PARAM_CHK(handle);
    1b7a:	c959                	beqz	a0,1c10 <csi_usart_config_databits+0x96>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    1b7c:	4114                	lw	a3,0(a0)

    WAIT_USART_IDLE(addr);
    1b7e:	5efc                	lw	a5,124(a3)
    1b80:	8b85                	andi	a5,a5,1
    1b82:	c39d                	beqz	a5,1ba8 <csi_usart_config_databits+0x2e>
    1b84:	000f4637          	lui	a2,0xf4
    1b88:	4701                	li	a4,0
    1b8a:	24060613          	addi	a2,a2,576 # f4240 <__erodata+0xf0f0c>
    1b8e:	a019                	j	1b94 <csi_usart_config_databits+0x1a>
    1b90:	06c70b63          	beq	a4,a2,1c06 <csi_usart_config_databits+0x8c>
    1b94:	5efc                	lw	a5,124(a3)
    1b96:	0705                	addi	a4,a4,1
    1b98:	8b85                	andi	a5,a5,1
    1b9a:	fbfd                	bnez	a5,1b90 <csi_usart_config_databits+0x16>
    1b9c:	000f47b7          	lui	a5,0xf4
    1ba0:	24078793          	addi	a5,a5,576 # f4240 <__erodata+0xf0f0c>
    1ba4:	06f70163          	beq	a4,a5,1c06 <csi_usart_config_databits+0x8c>
     *       01 -- 6 bits
     *       10 -- 7 bits
     *       11 -- 8 bits
     */

    switch (databits) {
    1ba8:	4785                	li	a5,1
    1baa:	02f58463          	beq	a1,a5,1bd2 <csi_usart_config_databits+0x58>
    1bae:	cd85                	beqz	a1,1be6 <csi_usart_config_databits+0x6c>
    1bb0:	4789                	li	a5,2
    1bb2:	04f58063          	beq	a1,a5,1bf2 <csi_usart_config_databits+0x78>
    1bb6:	478d                	li	a5,3
    1bb8:	00f58763          	beq	a1,a5,1bc6 <csi_usart_config_databits+0x4c>
        case USART_DATA_BITS_8:
            addr->LCR |= LCR_WORD_SIZE_8;
            break;

        default:
            return ERR_USART(USART_ERROR_DATA_BITS);
    1bbc:	81020537          	lui	a0,0x81020
    1bc0:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60fa0088>
    1bc4:	8082                	ret
            addr->LCR |= LCR_WORD_SIZE_8;
    1bc6:	46dc                	lw	a5,12(a3)
    }

    return 0;
    1bc8:	4501                	li	a0,0
            addr->LCR |= LCR_WORD_SIZE_8;
    1bca:	0037e793          	ori	a5,a5,3
    1bce:	c6dc                	sw	a5,12(a3)
            break;
    1bd0:	8082                	ret
            addr->LCR &= 0xfd;
    1bd2:	46dc                	lw	a5,12(a3)
    return 0;
    1bd4:	4501                	li	a0,0
            addr->LCR &= 0xfd;
    1bd6:	0fd7f793          	andi	a5,a5,253
    1bda:	c6dc                	sw	a5,12(a3)
            addr->LCR |= LCR_WORD_SIZE_6;
    1bdc:	46dc                	lw	a5,12(a3)
    1bde:	0017e793          	ori	a5,a5,1
    1be2:	c6dc                	sw	a5,12(a3)
            break;
    1be4:	8082                	ret
            addr->LCR &= LCR_WORD_SIZE_5;
    1be6:	46dc                	lw	a5,12(a3)
    return 0;
    1be8:	4501                	li	a0,0
            addr->LCR &= LCR_WORD_SIZE_5;
    1bea:	0fc7f793          	andi	a5,a5,252
    1bee:	c6dc                	sw	a5,12(a3)
            break;
    1bf0:	8082                	ret
            addr->LCR &= 0xfe;
    1bf2:	46dc                	lw	a5,12(a3)
    return 0;
    1bf4:	4501                	li	a0,0
            addr->LCR &= 0xfe;
    1bf6:	0fe7f793          	andi	a5,a5,254
    1bfa:	c6dc                	sw	a5,12(a3)
            addr->LCR |= LCR_WORD_SIZE_7;
    1bfc:	46dc                	lw	a5,12(a3)
    1bfe:	0027e793          	ori	a5,a5,2
    1c02:	c6dc                	sw	a5,12(a3)
            break;
    1c04:	8082                	ret
    WAIT_USART_IDLE(addr);
    1c06:	81020537          	lui	a0,0x81020
    1c0a:	08250513          	addi	a0,a0,130 # 81020082 <__heap_end+0x60fa0082>
}
    1c0e:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1c10:	81020537          	lui	a0,0x81020
    1c14:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>
    1c18:	8082                	ret

00001c1a <csi_usart_putchar>:
  \param[in]   ch  the input charater
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    USART_NULL_PARAM_CHK(handle);
    1c1a:	c909                	beqz	a0,1c2c <csi_usart_putchar+0x12>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    1c1c:	4118                	lw	a4,0(a0)

    while ((!(addr->LSR & DW_LSR_TRANS_EMPTY)));
    1c1e:	4b5c                	lw	a5,20(a4)
    1c20:	0207f793          	andi	a5,a5,32
    1c24:	dfed                	beqz	a5,1c1e <csi_usart_putchar+0x4>

    addr->THR = ch;
    1c26:	c30c                	sw	a1,0(a4)

    return 0;
    1c28:	4501                	li	a0,0
    1c2a:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1c2c:	81020537          	lui	a0,0x81020
    1c30:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>

}
    1c34:	8082                	ret

00001c36 <csi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    1c36:	1131                	addi	sp,sp,-20
    1c38:	c622                	sw	s0,12(sp)
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usart_init(idx, &base, &irq);
    1c3a:	0050                	addi	a2,sp,4
{
    1c3c:	842e                	mv	s0,a1
    int32_t ret = target_usart_init(idx, &base, &irq);
    1c3e:	858a                	mv	a1,sp
{
    1c40:	c426                	sw	s1,8(sp)
    1c42:	c806                	sw	ra,16(sp)
    1c44:	84aa                	mv	s1,a0
    uint32_t base = 0u;
    1c46:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    1c48:	c202                	sw	zero,4(sp)
    int32_t ret = target_usart_init(idx, &base, &irq);
    1c4a:	207d                	jal	1cf8 <target_usart_init>

    if (ret < 0 || ret >= CONFIG_USART_NUM) {
    1c4c:	ed1d                	bnez	a0,1c8a <csi_usart_initialize+0x54>
        return NULL;
    }

    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    1c4e:	00349513          	slli	a0,s1,0x3
    1c52:	8d05                	sub	a0,a0,s1
    usart_priv->base = base;
    usart_priv->irq = irq;
    1c54:	4712                	lw	a4,4(sp)
    usart_priv->base = base;
    1c56:	4682                	lw	a3,0(sp)
    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    1c58:	00351793          	slli	a5,a0,0x3
    1c5c:	20001537          	lui	a0,0x20001
    1c60:	01450513          	addi	a0,a0,20 # 20001014 <g_top_irqstack>
    1c64:	953e                	add	a0,a0,a5
    usart_priv->irq = irq;
    1c66:	c158                	sw	a4,4(a0)
    usart_priv->cb_event = cb_event;
    1c68:	c500                	sw	s0,8(a0)
    usart_priv->idx = idx;
    1c6a:	d944                	sw	s1,52(a0)
    usart_priv->base = base;
    1c6c:	c114                	sw	a3,0(a0)
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);

    /* enable received data available */
    addr->IER = IER_RDA_INT_ENABLE | IIR_RECV_LINE_ENABLE;
    1c6e:	4795                	li	a5,5
    1c70:	c2dc                	sw	a5,4(a3)
#else
    csi_vic_enable_irq(usart_priv->irq);
#endif

    return usart_priv;
}
    1c72:	40c2                	lw	ra,16(sp)
    1c74:	4432                	lw	s0,12(sp)
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
    1c76:	4785                	li	a5,1
    1c78:	00e797b3          	sll	a5,a5,a4
    1c7c:	e000e737          	lui	a4,0xe000e
    1c80:	10f72023          	sw	a5,256(a4) # e000e100 <__heap_end+0xbff8e100>
    1c84:	44a2                	lw	s1,8(sp)
    1c86:	0151                	addi	sp,sp,20
    1c88:	8082                	ret
    1c8a:	40c2                	lw	ra,16(sp)
    1c8c:	4432                	lw	s0,12(sp)
    1c8e:	44a2                	lw	s1,8(sp)
        return NULL;
    1c90:	4501                	li	a0,0
}
    1c92:	0151                	addi	sp,sp,20
    1c94:	8082                	ret

00001c96 <csi_usart_config>:
                         uint32_t baud,
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    1c96:	1121                	addi	sp,sp,-24
    1c98:	c822                	sw	s0,16(sp)
    1c9a:	c626                	sw	s1,12(sp)
    1c9c:	ca06                	sw	ra,20(sp)
    1c9e:	842a                	mv	s0,a0
    1ca0:	c032                	sw	a2,0(sp)
    1ca2:	c236                	sw	a3,4(sp)
    1ca4:	84ba                	mv	s1,a4
    1ca6:	c43e                	sw	a5,8(sp)
    int32_t ret;

    /* control the data_bit of the usart*/
    ret = csi_usart_config_baudrate(handle, baud);
    1ca8:	3b99                	jal	19fe <csi_usart_config_baudrate>

    if (ret < 0) {
    1caa:	02054863          	bltz	a0,1cda <csi_usart_config+0x44>
    USART_NULL_PARAM_CHK(handle);
    1cae:	c021                	beqz	s0,1cee <csi_usart_config+0x58>
    if (mode == USART_MODE_ASYNCHRONOUS) {
    1cb0:	4602                	lw	a2,0(sp)
    1cb2:	ea0d                	bnez	a2,1ce4 <csi_usart_config+0x4e>
    if (ret < 0) {
        return ret;
    }

    /* control the parity of the usart*/
    ret = csi_usart_config_parity(handle, parity);
    1cb4:	4692                	lw	a3,4(sp)
    1cb6:	8522                	mv	a0,s0
    1cb8:	85b6                	mv	a1,a3
    1cba:	33e1                	jal	1a82 <csi_usart_config_parity>

    if (ret < 0) {
    1cbc:	00054f63          	bltz	a0,1cda <csi_usart_config+0x44>
        return ret;
    }

    /* control the stopbit of the usart*/
    ret = csi_usart_config_stopbits(handle, stopbits);
    1cc0:	85a6                	mv	a1,s1
    1cc2:	8522                	mv	a0,s0
    1cc4:	35a9                	jal	1b0e <csi_usart_config_stopbits>

    if (ret < 0) {
    1cc6:	00054a63          	bltz	a0,1cda <csi_usart_config+0x44>
        return ret;
    }

    ret = csi_usart_config_databits(handle, bits);
    1cca:	45a2                	lw	a1,8(sp)
    1ccc:	8522                	mv	a0,s0
    1cce:	3575                	jal	1b7a <csi_usart_config_databits>

    if (ret < 0) {
    1cd0:	00152793          	slti	a5,a0,1
    1cd4:	40f007b3          	neg	a5,a5
    1cd8:	8d7d                	and	a0,a0,a5
        return ret;
    }

    return 0;
}
    1cda:	40d2                	lw	ra,20(sp)
    1cdc:	4442                	lw	s0,16(sp)
    1cde:	44b2                	lw	s1,12(sp)
    1ce0:	0161                	addi	sp,sp,24
    1ce2:	8082                	ret
    return ERR_USART(USART_ERROR_MODE);
    1ce4:	81020537          	lui	a0,0x81020
    1ce8:	08650513          	addi	a0,a0,134 # 81020086 <__heap_end+0x60fa0086>
    1cec:	b7fd                	j	1cda <csi_usart_config+0x44>
    USART_NULL_PARAM_CHK(handle);
    1cee:	81020537          	lui	a0,0x81020
    1cf2:	08450513          	addi	a0,a0,132 # 81020084 <__heap_end+0x60fa0084>
    1cf6:	b7d5                	j	1cda <csi_usart_config+0x44>

00001cf8 <target_usart_init>:
  \brief       get usart instance.
  \return      pointer to usart instance
*/
int32_t target_usart_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= sizeof(s_usart_pin_map) / sizeof(usart_pin_map_t)) {
    1cf8:	e519                	bnez	a0,1d06 <target_usart_init+0xe>
        return -1;
    }

    *base = sg_usart_config[s_usart_pin_map[idx].cfg_idx].base;
    1cfa:	400157b7          	lui	a5,0x40015
    1cfe:	c19c                	sw	a5,0(a1)
    *irq = sg_usart_config[s_usart_pin_map[idx].cfg_idx].irq;
    1d00:	00062023          	sw	zero,0(a2)
    return s_usart_pin_map[idx].cfg_idx;
    1d04:	8082                	ret
        return -1;
    1d06:	557d                	li	a0,-1
}
    1d08:	8082                	ret

00001d0a <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= target_get_timer_count()) {
    1d0a:	478d                	li	a5,3
    1d0c:	00a7cd63          	blt	a5,a0,1d26 <target_get_timer+0x1c>
        return NULL;
    }

    *base = sg_timer_config[idx].base;
    1d10:	678d                	lui	a5,0x3
    1d12:	00351713          	slli	a4,a0,0x3
    1d16:	d0078793          	addi	a5,a5,-768 # 2d00 <sg_timer_config>
    1d1a:	97ba                	add	a5,a5,a4
    1d1c:	4398                	lw	a4,0(a5)
    *irq = sg_timer_config[idx].irq;
    1d1e:	43dc                	lw	a5,4(a5)
    *base = sg_timer_config[idx].base;
    1d20:	c198                	sw	a4,0(a1)
    *irq = sg_timer_config[idx].irq;
    1d22:	c21c                	sw	a5,0(a2)
    return idx;
    1d24:	8082                	ret
        return NULL;
    1d26:	4501                	li	a0,0
}
    1d28:	8082                	ret

00001d2a <csi_timer_initialize>:
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
    1d2a:	470d                	li	a4,3
    1d2c:	08a76763          	bltu	a4,a0,1dba <csi_timer_initialize+0x90>
{
    1d30:	1131                	addi	sp,sp,-20
    1d32:	c426                	sw	s1,8(sp)
    }

    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t real_idx = target_get_timer(idx, &base, &irq);
    1d34:	0050                	addi	a2,sp,4
    1d36:	84ae                	mv	s1,a1
    1d38:	858a                	mv	a1,sp
{
    1d3a:	c622                	sw	s0,12(sp)
    1d3c:	c806                	sw	ra,16(sp)
    1d3e:	842a                	mv	s0,a0
    uint32_t base = 0u;
    1d40:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    1d42:	c202                	sw	zero,4(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq);
    1d44:	37d9                	jal	1d0a <target_get_timer>

    if (real_idx != idx) {
    1d46:	06a41463          	bne	s0,a0,1dae <csi_timer_initialize+0x84>
        return NULL;
    }

    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->base = base;
    1d4a:	4702                	lw	a4,0(sp)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    1d4c:	00241513          	slli	a0,s0,0x2
    1d50:	942a                	add	s0,s0,a0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    1d52:	4714                	lw	a3,8(a4)
    1d54:	00874783          	lbu	a5,8(a4)
    timer_priv->irq  = irq;
    1d58:	4612                	lw	a2,4(sp)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    1d5a:	20001537          	lui	a0,0x20001
    1d5e:	040a                	slli	s0,s0,0x2
    1d60:	04c50513          	addi	a0,a0,76 # 2000104c <timer_instance>

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
    1d64:	0cc165b7          	lui	a1,0xcc16
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    1d68:	9522                	add	a0,a0,s0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    1d6a:	8ab9                	andi	a3,a3,14
    1d6c:	9bc1                	andi	a5,a5,-16
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
    1d6e:	18058593          	addi	a1,a1,384 # cc16180 <__erodata+0xcc12e4c>
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    1d72:	8fd5                	or	a5,a5,a3
    timer_priv->base = base;
    1d74:	c118                	sw	a4,0(a0)
    timer_priv->irq  = irq;
    1d76:	c150                	sw	a2,4(a0)
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
    1d78:	c54c                	sw	a1,12(a0)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    1d7a:	00f70423          	sb	a5,8(a4)
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;
    1d7e:	4714                	lw	a3,8(a4)
    1d80:	00874783          	lbu	a5,8(a4)
    1d84:	8abd                	andi	a3,a3,15
    1d86:	0046e693          	ori	a3,a3,4
    1d8a:	9bc1                	andi	a5,a5,-16
    1d8c:	8fd5                	or	a5,a5,a3
    1d8e:	00f70423          	sb	a5,8(a4)

    timer_deactive_control(addr);
    timer_priv->cb_event = cb_event;
    1d92:	c504                	sw	s1,8(a0)

    if (cb_event != NULL) {
    1d94:	c881                	beqz	s1,1da4 <csi_timer_initialize+0x7a>
    1d96:	4785                	li	a5,1
    1d98:	00c79633          	sll	a2,a5,a2
    1d9c:	e000e7b7          	lui	a5,0xe000e
    1da0:	10c7a023          	sw	a2,256(a5) # e000e100 <__heap_end+0xbff8e100>
        csi_vic_enable_irq(timer_priv->irq);
#endif
    }

    return (timer_handle_t)timer_priv;
}
    1da4:	40c2                	lw	ra,16(sp)
    1da6:	4432                	lw	s0,12(sp)
    1da8:	44a2                	lw	s1,8(sp)
    1daa:	0151                	addi	sp,sp,20
    1dac:	8082                	ret
    1dae:	40c2                	lw	ra,16(sp)
    1db0:	4432                	lw	s0,12(sp)
    1db2:	44a2                	lw	s1,8(sp)
        return NULL;
    1db4:	4501                	li	a0,0
}
    1db6:	0151                	addi	sp,sp,20
    1db8:	8082                	ret
        return NULL;
    1dba:	4501                	li	a0,0
}
    1dbc:	8082                	ret

00001dbe <csi_timer_uninitialize>:
  \brief       De-initialize TIMER Interface. stops operation and releases the software resources used by the interface
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_uninitialize(timer_handle_t handle)
{
    1dbe:	862a                	mv	a2,a0
    TIMER_NULL_PARAM_CHK(handle);
    1dc0:	c121                	beqz	a0,1e00 <csi_timer_uninitialize+0x42>

    dw_timer_priv_t *timer_priv = (dw_timer_priv_t *)handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    1dc2:	411c                	lw	a5,0(a0)
#if defined CONFIG_CHIP_SH810 || defined CONFIG_CHIP_SH807 || defined CONFIG_CHIP_SH610 || defined CONFIG_CHIP_SH610M
    csi_intc_disable_irq(timer_priv->irq);
#else
    csi_vic_disable_irq(timer_priv->irq);
#endif
    return 0;
    1dc4:	4501                	li	a0,0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
    1dc6:	4794                	lw	a3,8(a5)
    1dc8:	0087c703          	lbu	a4,8(a5)
    1dcc:	8ab9                	andi	a3,a3,14
    1dce:	9b41                	andi	a4,a4,-16
    1dd0:	8f55                	or	a4,a4,a3
    1dd2:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;
    1dd6:	4794                	lw	a3,8(a5)
    1dd8:	0087c703          	lbu	a4,8(a5)
    1ddc:	8abd                	andi	a3,a3,15
    1dde:	0046e693          	ori	a3,a3,4
    1de2:	9b41                	andi	a4,a4,-16
    1de4:	8f55                	or	a4,a4,a3
    1de6:	00e78423          	sb	a4,8(a5)
  \details Disable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_disable_irq(int32_t IRQn)
{
    VIC->ICER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
    1dea:	425c                	lw	a5,4(a2)
    1dec:	4705                	li	a4,1
    timer_priv->cb_event = NULL;
    1dee:	00062423          	sw	zero,8(a2)
    1df2:	00f71733          	sll	a4,a4,a5
    1df6:	e000e7b7          	lui	a5,0xe000e
    1dfa:	18e7a023          	sw	a4,384(a5) # e000e180 <__heap_end+0xbff8e180>
    return 0;
    1dfe:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    1e00:	81070537          	lui	a0,0x81070
    1e04:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    1e08:	8082                	ret

00001e0a <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
    1e0a:	c511                	beqz	a0,1e16 <csi_timer_config+0xc>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    1e0c:	411c                	lw	a5,0(a0)

    switch (mode) {
    1e0e:	c58d                	beqz	a1,1e38 <csi_timer_config+0x2e>
    1e10:	4705                	li	a4,1
    1e12:	00e58763          	beq	a1,a4,1e20 <csi_timer_config+0x16>
    TIMER_NULL_PARAM_CHK(handle);
    1e16:	81070537          	lui	a0,0x81070
    1e1a:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
        default:
            return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    return 0;
}
    1e1e:	8082                	ret
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
    1e20:	4794                	lw	a3,8(a5)
    1e22:	0087c703          	lbu	a4,8(a5)
    return 0;
    1e26:	4501                	li	a0,0
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
    1e28:	8abd                	andi	a3,a3,15
    1e2a:	0026e693          	ori	a3,a3,2
    1e2e:	9b41                	andi	a4,a4,-16
    1e30:	8f55                	or	a4,a4,a3
    1e32:	00e78423          	sb	a4,8(a5)
            break;
    1e36:	8082                	ret
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
    1e38:	4794                	lw	a3,8(a5)
    1e3a:	0087c703          	lbu	a4,8(a5)
    return 0;
    1e3e:	4501                	li	a0,0
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
    1e40:	8ab5                	andi	a3,a3,13
    1e42:	9b41                	andi	a4,a4,-16
    1e44:	8f55                	or	a4,a4,a3
    1e46:	00e78423          	sb	a4,8(a5)
            break;
    1e4a:	8082                	ret

00001e4c <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
    1e4c:	c501                	beqz	a0,1e54 <csi_timer_set_timeout+0x8>

    dw_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
    1e4e:	c54c                	sw	a1,12(a0)
    return 0;
    1e50:	4501                	li	a0,0
    1e52:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    1e54:	81070537          	lui	a0,0x81070
    1e58:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    1e5c:	8082                	ret

00001e5e <csi_timer_start>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    1e5e:	c12d                	beqz	a0,1ec0 <csi_timer_start+0x62>
    timer_priv->timeout_flag = 0;

    uint32_t min_us = LSP_DEFAULT_FREQ / 1000000;
    uint32_t load;

    if (timer_priv->timeout > 0xffffffff / min_us) {
    1e60:	4558                	lw	a4,12(a0)
    1e62:	47d1                	li	a5,20
    timer_priv->timeout_flag = 0;
    1e64:	00052823          	sw	zero,16(a0)
    if (timer_priv->timeout > 0xffffffff / min_us) {
    1e68:	02f737b3          	mulhu	a5,a4,a5
    1e6c:	ebb1                	bnez	a5,1ec0 <csi_timer_start+0x62>
        load = (uint32_t)(timer_priv->timeout * min_us);
    } else {
        load = (uint32_t)(((timer_priv->timeout) * LSP_DEFAULT_FREQ) / 1000000);
    }

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    1e6e:	411c                	lw	a5,0(a0)

    if (timer_priv->timeout == 0) {
    1e70:	ef1d                	bnez	a4,1eae <csi_timer_start+0x50>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    1e72:	577d                	li	a4,-1
    1e74:	c398                	sw	a4,0(a5)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    1e76:	4794                	lw	a3,8(a5)
    1e78:	0087c703          	lbu	a4,8(a5)
    addr->TxControl |= DW_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    addr->TxControl &= ~DW_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    return 0;
    1e7c:	4501                	li	a0,0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    1e7e:	8ab9                	andi	a3,a3,14
    1e80:	9b41                	andi	a4,a4,-16
    1e82:	8f55                	or	a4,a4,a3
    1e84:	00e78423          	sb	a4,8(a5)
    addr->TxControl |= DW_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    1e88:	4794                	lw	a3,8(a5)
    1e8a:	0087c703          	lbu	a4,8(a5)
    1e8e:	8abd                	andi	a3,a3,15
    1e90:	0016e693          	ori	a3,a3,1
    1e94:	9b41                	andi	a4,a4,-16
    1e96:	8f55                	or	a4,a4,a3
    1e98:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    1e9c:	4794                	lw	a3,8(a5)
    1e9e:	0087c703          	lbu	a4,8(a5)
    1ea2:	8aad                	andi	a3,a3,11
    1ea4:	9b41                	andi	a4,a4,-16
    1ea6:	8f55                	or	a4,a4,a3
    1ea8:	00e78423          	sb	a4,8(a5)
}
    1eac:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    1eae:	4794                	lw	a3,8(a5)
    1eb0:	8ab5                	andi	a3,a3,13
    1eb2:	d2e1                	beqz	a3,1e72 <csi_timer_start+0x14>
        load = (uint32_t)(timer_priv->timeout * min_us);
    1eb4:	00271693          	slli	a3,a4,0x2
    1eb8:	9736                	add	a4,a4,a3
    1eba:	070a                	slli	a4,a4,0x2
            addr->TxLoadCount = load;                           /* load time(us) */
    1ebc:	c398                	sw	a4,0(a5)
    1ebe:	bf65                	j	1e76 <csi_timer_start+0x18>
    TIMER_NULL_PARAM_CHK(handle);
    1ec0:	81070537          	lui	a0,0x81070
    1ec4:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
    1ec8:	8082                	ret

00001eca <csi_timer_stop>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_stop(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    1eca:	c515                	beqz	a0,1ef6 <csi_timer_stop+0x2c>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    1ecc:	411c                	lw	a5,0(a0)

    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;      /* enable interrupt */
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */

    return 0;
    1ece:	4501                	li	a0,0
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;      /* enable interrupt */
    1ed0:	4794                	lw	a3,8(a5)
    1ed2:	0087c703          	lbu	a4,8(a5)
    1ed6:	8abd                	andi	a3,a3,15
    1ed8:	0046e693          	ori	a3,a3,4
    1edc:	9b41                	andi	a4,a4,-16
    1ede:	8f55                	or	a4,a4,a3
    1ee0:	00e78423          	sb	a4,8(a5)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    1ee4:	4794                	lw	a3,8(a5)
    1ee6:	0087c703          	lbu	a4,8(a5)
    1eea:	8ab9                	andi	a3,a3,14
    1eec:	9b41                	andi	a4,a4,-16
    1eee:	8f55                	or	a4,a4,a3
    1ef0:	00e78423          	sb	a4,8(a5)
    return 0;
    1ef4:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    1ef6:	81070537          	lui	a0,0x81070
    1efa:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    1efe:	8082                	ret

00001f00 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    1f00:	c519                	beqz	a0,1f0e <csi_timer_get_current_value+0xe>
    TIMER_NULL_PARAM_CHK(value);
    1f02:	c591                	beqz	a1,1f0e <csi_timer_get_current_value+0xe>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    1f04:	411c                	lw	a5,0(a0)

    *value = addr->TxCurrentValue;
    return 0;
    1f06:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    1f08:	43dc                	lw	a5,4(a5)
    1f0a:	c19c                	sw	a5,0(a1)
    return 0;
    1f0c:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    1f0e:	81070537          	lui	a0,0x81070
    1f12:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    1f16:	8082                	ret

00001f18 <SystemInit>:
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
    1f18:	000317b7          	lui	a5,0x31
    1f1c:	e000e737          	lui	a4,0xe000e
    1f20:	d3f78793          	addi	a5,a5,-705 # 30d3f <__erodata+0x2da0b>
    1f24:	cb5c                	sw	a5,20(a4)
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
    1f26:	00072c23          	sw	zero,24(a4) # e000e018 <__heap_end+0xbff8e018>
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
    1f2a:	479d                	li	a5,7
    1f2c:	cb1c                	sw	a5,16(a4)
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
#endif

    SystemCoreClock = SYSTEM_CLOCK;
    1f2e:	013137b7          	lui	a5,0x1313
    1f32:	20000737          	lui	a4,0x20000
    1f36:	d0078793          	addi	a5,a5,-768 # 1312d00 <__erodata+0x130f9cc>
    1f3a:	00f72023          	sw	a5,0(a4) # 20000000 <SystemCoreClock>

#ifndef CONFIG_KERNEL_RHINO
#ifndef CONFIG_NUTTXMM_NONE
    extern void mm_heap_initialize(void);
    mm_heap_initialize();
    1f3e:	8b5ff06f          	j	17f2 <mm_heap_initialize>

00001f42 <board_init>:

extern usart_handle_t console_handle;
extern void ioreuse_initial(void);

void board_init(void)
{
    1f42:	1151                	addi	sp,sp,-12
    /* init the console*/
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    1f44:	4581                	li	a1,0
    1f46:	4501                	li	a0,0
{
    1f48:	c406                	sw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    1f4a:	31f5                	jal	1c36 <csi_usart_initialize>
    /* config the UART */
    csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
}
    1f4c:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    1f4e:	20000337          	lui	t1,0x20000
    csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    1f52:	65f1                	lui	a1,0x1c
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    1f54:	00a32423          	sw	a0,8(t1) # 20000008 <console_handle>
    csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    1f58:	478d                	li	a5,3
    1f5a:	4701                	li	a4,0
    1f5c:	4681                	li	a3,0
    1f5e:	4601                	li	a2,0
    1f60:	20058593          	addi	a1,a1,512 # 1c200 <__erodata+0x18ecc>
}
    1f64:	0131                	addi	sp,sp,12
    csi_usart_config(console_handle, 115200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    1f66:	bb05                	j	1c96 <csi_usart_config>

00001f68 <numtostring>:
* base: the base of system(for example 2,8,10,16 as usual)
* buf: data buffer for change procedure and return result
* return value: the string  after change 
*********************************************************/
static char *numtostring (unsigned int uq, int base, char *buf )
{                               
    1f68:	1171                	addi	sp,sp,-4
    1f6a:	c022                	sw	s0,0(sp)
    1f6c:	000033b7          	lui	t2,0x3
  register char *p, *p0;
  int n = 0, i;

  p = buf;
  *buf = 0;
    1f70:	00060023          	sb	zero,0(a2)
    1f74:	87b2                	mv	a5,a2
  int n = 0, i;
    1f76:	4281                	li	t0,0
    1f78:	d7838393          	addi	t2,t2,-648 # 2d78 <sg_timer_config+0x78>
    1f7c:	a021                	j	1f84 <numtostring+0x1c>
  do 
  {
    *buf ++ = "0123456789abcdef"[uq % base];
    n++;
    1f7e:	82b6                	mv	t0,a3
    1f80:	879a                	mv	a5,t1
  } while (uq /= base);
    1f82:	8522                	mv	a0,s0
    *buf ++ = "0123456789abcdef"[uq % base];
    1f84:	02b57733          	remu	a4,a0,a1
    1f88:	00178313          	addi	t1,a5,1
    n++;
    1f8c:	00128693          	addi	a3,t0,1 # 80000001 <__heap_end+0x5ff80001>
    *buf ++ = "0123456789abcdef"[uq % base];
    1f90:	971e                	add	a4,a4,t2
    1f92:	00074703          	lbu	a4,0(a4)
  } while (uq /= base);
    1f96:	02b55433          	divu	s0,a0,a1
    *buf ++ = "0123456789abcdef"[uq % base];
    1f9a:	fee30fa3          	sb	a4,-1(t1)
  } while (uq /= base);
    1f9e:	feb570e3          	bleu	a1,a0,1f7e <numtostring+0x16>
  p[n] = '\0';
    1fa2:	00d60733          	add	a4,a2,a3
    1fa6:	00070023          	sb	zero,0(a4)
        
  p0 = ++buf;
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1faa:	4741                	li	a4,16
  p0 = ++buf;
    1fac:	00278513          	addi	a0,a5,2
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1fb0:	02e58463          	beq	a1,a4,1fd8 <numtostring+0x70>
    1fb4:	9796                	add	a5,a5,t0
    1fb6:	9616                	add	a2,a2,t0
    1fb8:	872a                	mv	a4,a0
    1fba:	078d                	addi	a5,a5,3
  }
  else
  {
    for (i = 0; i < n; i++)
    {
      p0[i] = p[n - i - 1];
    1fbc:	00064583          	lbu	a1,0(a2)
    1fc0:	0705                	addi	a4,a4,1
    1fc2:	167d                	addi	a2,a2,-1
    1fc4:	feb70fa3          	sb	a1,-1(a4)
    for (i = 0; i < n; i++)
    1fc8:	fef71ae3          	bne	a4,a5,1fbc <numtostring+0x54>
    }
    p0[n] = '\0';
    1fcc:	96aa                	add	a3,a3,a0
    1fce:	00068023          	sb	zero,0(a3)
  }

  return (p0);
}
    1fd2:	4402                	lw	s0,0(sp)
    1fd4:	0111                	addi	sp,sp,4
    1fd6:	8082                	ret
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1fd8:	471d                	li	a4,7
    1fda:	fcd74de3          	blt	a4,a3,1fb4 <numtostring+0x4c>
    for (i = 0; i < 8 - n; i++)
    1fde:	4721                	li	a4,8
    1fe0:	40d706b3          	sub	a3,a4,a3
    1fe4:	00d785b3          	add	a1,a5,a3
      p0[i] = '0';
    1fe8:	03000713          	li	a4,48
    1fec:	00e78123          	sb	a4,2(a5)
    1ff0:	0785                	addi	a5,a5,1
    for (i = 0; i < 8 - n; i++)
    1ff2:	feb79de3          	bne	a5,a1,1fec <numtostring+0x84>
    1ff6:	40d606b3          	sub	a3,a2,a3
    1ffa:	00768713          	addi	a4,a3,7
    1ffe:	a011                	j	2002 <numtostring+0x9a>
    2000:	872e                	mv	a4,a1
      p0[i] = p[8 - i - 1];
    2002:	00074683          	lbu	a3,0(a4)
    2006:	0785                	addi	a5,a5,1
    2008:	fff70593          	addi	a1,a4,-1
    200c:	00d780a3          	sb	a3,1(a5)
    for (; i < 8; i++)
    2010:	fee618e3          	bne	a2,a4,2000 <numtostring+0x98>
    p0[8] = '\0';
    2014:	000304a3          	sb	zero,9(t1)
}
    2018:	4402                	lw	s0,0(sp)
    201a:	0111                	addi	sp,sp,4
    201c:	8082                	ret

0000201e <putchar>:
 * ch: the char need to display
 */
int putchar(int ch)
{
//  while(CK_Uart_PutChar(consoleuart,ch) != SUCCESS);
return fputc(ch, 0);
    201e:	4581                	li	a1,0
    2020:	b245                	j	19c0 <fputc>

00002022 <puts>:
/*
 * display a string on the console
 * ptr: the string need to display
 */
int puts(const char *ptr)
{
    2022:	1151                	addi	sp,sp,-12
    2024:	c222                	sw	s0,4(sp)
    2026:	c406                	sw	ra,8(sp)
    2028:	842a                	mv	s0,a0
   while(*ptr !='\0')
    202a:	00054503          	lbu	a0,0(a0)
    202e:	c519                	beqz	a0,203c <puts+0x1a>
   {
  //   if (SUCCESS == CK_Uart_PutChar(consoleuart,*ptr))
       fputc(*ptr, 0);
    2030:	4581                	li	a1,0
       ptr++;
    2032:	0405                	addi	s0,s0,1
       fputc(*ptr, 0);
    2034:	3271                	jal	19c0 <fputc>
   while(*ptr !='\0')
    2036:	00044503          	lbu	a0,0(s0)
    203a:	f97d                	bnez	a0,2030 <puts+0xe>
   }
 //  CK_Uart_PutChar(consoleuart,'\n');
   fputc('\n', 0);
    203c:	4581                	li	a1,0
    203e:	4529                	li	a0,10
    2040:	3241                	jal	19c0 <fputc>
   return 0;
}
    2042:	40a2                	lw	ra,8(sp)
    2044:	4412                	lw	s0,4(sp)
    2046:	4501                	li	a0,0
    2048:	0131                	addi	sp,sp,12
    204a:	8082                	ret

0000204c <printf>:

/*
 * print the result after translated according to the format
 */
int printf ( const char *fmt, ... )
{
    204c:	f9c10113          	addi	sp,sp,-100
    2050:	d0be                	sw	a5,96(sp)
  int        value;
  unsigned int        ptr;
  char       ch, buf[64], *pbuf;
  va_list    ap;

  va_start(ap, fmt);
    2052:	089c                	addi	a5,sp,80
{
    2054:	c4a2                	sw	s0,72(sp)
    2056:	c686                	sw	ra,76(sp)
    2058:	c2a6                	sw	s1,68(sp)
    205a:	842a                	mv	s0,a0
    205c:	c8ae                	sw	a1,80(sp)
    205e:	cab2                	sw	a2,84(sp)
    2060:	ccb6                	sw	a3,88(sp)
    2062:	ceba                	sw	a4,92(sp)
  va_start(ap, fmt);
    2064:	c03e                	sw	a5,0(sp)
  while (*fmt) 
    2066:	00044503          	lbu	a0,0(s0)
    206a:	c931                	beqz	a0,20be <printf+0x72>
  {
    if (*fmt != '%')
    206c:	02500793          	li	a5,37
    2070:	0ef51863          	bne	a0,a5,2160 <printf+0x114>
    {
      putchar(*fmt++);
      continue;
    }

    switch (*++fmt)
    2074:	00144503          	lbu	a0,1(s0)
    2078:	4755                	li	a4,21
    207a:	f9d50793          	addi	a5,a0,-99
    207e:	0ff7f793          	andi	a5,a5,255
    2082:	0cf76a63          	bltu	a4,a5,2156 <printf+0x10a>
    2086:	670d                	lui	a4,0x3
    2088:	078a                	slli	a5,a5,0x2
    208a:	d2070713          	addi	a4,a4,-736 # 2d20 <sg_timer_config+0x20>
    208e:	97ba                	add	a5,a5,a4
    2090:	439c                	lw	a5,0(a5)
    2092:	8782                	jr	a5
         }
         pbuf = numtostring((unsigned int)value, 10, buf);
         puts_without_enter(pbuf);
         break;
       case 'x':
         value = va_arg(ap,int);
    2094:	4782                	lw	a5,0(sp)
         pbuf = numtostring((unsigned int)value, 16, buf);
    2096:	0050                	addi	a2,sp,4
    2098:	45c1                	li	a1,16
    209a:	4388                	lw	a0,0(a5)
         value = va_arg(ap,int);
    209c:	0791                	addi	a5,a5,4
    209e:	c03e                	sw	a5,0(sp)
         pbuf = numtostring((unsigned int)value, 16, buf);
    20a0:	35e1                	jal	1f68 <numtostring>
    20a2:	84aa                	mv	s1,a0
   while(*ptr !='\0')
    20a4:	00054503          	lbu	a0,0(a0)
    20a8:	c519                	beqz	a0,20b6 <printf+0x6a>
	fputc(*ptr, 0);
    20aa:	4581                	li	a1,0
       ptr++;
    20ac:	0485                	addi	s1,s1,1
	fputc(*ptr, 0);
    20ae:	3a09                	jal	19c0 <fputc>
   while(*ptr !='\0')
    20b0:	0004c503          	lbu	a0,0(s1)
    20b4:	f97d                	bnez	a0,20aa <printf+0x5e>
         break;  
       default:  
         putchar(*fmt);
         break;
    }
    fmt ++;
    20b6:	0409                	addi	s0,s0,2
  while (*fmt) 
    20b8:	00044503          	lbu	a0,0(s0)
    20bc:	f945                	bnez	a0,206c <printf+0x20>
  }
  va_end(ap);
  return 0x01;   
}
    20be:	40b6                	lw	ra,76(sp)
    20c0:	4426                	lw	s0,72(sp)
    20c2:	4496                	lw	s1,68(sp)
    20c4:	4505                	li	a0,1
    20c6:	06410113          	addi	sp,sp,100
    20ca:	8082                	ret
        s = va_arg(ap, const char *);
    20cc:	4702                	lw	a4,0(sp)
    20ce:	4304                	lw	s1,0(a4)
    20d0:	0711                	addi	a4,a4,4
    20d2:	c03a                	sw	a4,0(sp)
   while(*ptr !='\0')
    20d4:	0004c503          	lbu	a0,0(s1)
    20d8:	dd79                	beqz	a0,20b6 <printf+0x6a>
	fputc(*ptr, 0);
    20da:	4581                	li	a1,0
       ptr++;
    20dc:	0485                	addi	s1,s1,1
	fputc(*ptr, 0);
    20de:	8e3ff0ef          	jal	ra,19c0 <fputc>
   while(*ptr !='\0')
    20e2:	0004c503          	lbu	a0,0(s1)
    20e6:	f975                	bnez	a0,20da <printf+0x8e>
    fmt ++;
    20e8:	0409                	addi	s0,s0,2
    20ea:	b7f9                	j	20b8 <printf+0x6c>
         ptr = (unsigned) va_arg(ap, void *); 
    20ec:	4782                	lw	a5,0(sp)
         pbuf = numtostring(ptr, 16, buf);
    20ee:	0050                	addi	a2,sp,4
    20f0:	45c1                	li	a1,16
    20f2:	4388                	lw	a0,0(a5)
         ptr = (unsigned) va_arg(ap, void *); 
    20f4:	0791                	addi	a5,a5,4
    20f6:	c03e                	sw	a5,0(sp)
         pbuf = numtostring(ptr, 16, buf);
    20f8:	3d85                	jal	1f68 <numtostring>
    20fa:	84aa                	mv	s1,a0
   while(*ptr !='\0')
    20fc:	00054503          	lbu	a0,0(a0)
    2100:	d95d                	beqz	a0,20b6 <printf+0x6a>
	fputc(*ptr, 0);
    2102:	4581                	li	a1,0
       ptr++;
    2104:	0485                	addi	s1,s1,1
	fputc(*ptr, 0);
    2106:	8bbff0ef          	jal	ra,19c0 <fputc>
   while(*ptr !='\0')
    210a:	0004c503          	lbu	a0,0(s1)
    210e:	f975                	bnez	a0,2102 <printf+0xb6>
    fmt ++;
    2110:	0409                	addi	s0,s0,2
    2112:	b75d                	j	20b8 <printf+0x6c>
         value = va_arg(ap, int);
    2114:	4782                	lw	a5,0(sp)
    2116:	4384                	lw	s1,0(a5)
    2118:	0791                	addi	a5,a5,4
    211a:	c03e                	sw	a5,0(sp)
         if (value < 0)
    211c:	0404c763          	bltz	s1,216a <printf+0x11e>
         pbuf = numtostring((unsigned int)value, 10, buf);
    2120:	8526                	mv	a0,s1
    2122:	0050                	addi	a2,sp,4
    2124:	45a9                	li	a1,10
    2126:	3589                	jal	1f68 <numtostring>
    2128:	84aa                	mv	s1,a0
   while(*ptr !='\0')
    212a:	00054503          	lbu	a0,0(a0)
    212e:	d541                	beqz	a0,20b6 <printf+0x6a>
	fputc(*ptr, 0);
    2130:	4581                	li	a1,0
       ptr++;
    2132:	0485                	addi	s1,s1,1
	fputc(*ptr, 0);
    2134:	88dff0ef          	jal	ra,19c0 <fputc>
   while(*ptr !='\0')
    2138:	0004c503          	lbu	a0,0(s1)
    213c:	f975                	bnez	a0,2130 <printf+0xe4>
    fmt ++;
    213e:	0409                	addi	s0,s0,2
    2140:	bfa5                	j	20b8 <printf+0x6c>
          ch = (unsigned char)va_arg(ap, int);
    2142:	4782                	lw	a5,0(sp)
return fputc(ch, 0);
    2144:	4581                	li	a1,0
    fmt ++;
    2146:	0409                	addi	s0,s0,2
return fputc(ch, 0);
    2148:	0007c503          	lbu	a0,0(a5)
          ch = (unsigned char)va_arg(ap, int);
    214c:	0791                	addi	a5,a5,4
    214e:	c03e                	sw	a5,0(sp)
return fputc(ch, 0);
    2150:	871ff0ef          	jal	ra,19c0 <fputc>
    fmt ++;
    2154:	b795                	j	20b8 <printf+0x6c>
return fputc(ch, 0);
    2156:	4581                	li	a1,0
    2158:	869ff0ef          	jal	ra,19c0 <fputc>
    fmt ++;
    215c:	0409                	addi	s0,s0,2
    215e:	bfa9                	j	20b8 <printf+0x6c>
return fputc(ch, 0);
    2160:	4581                	li	a1,0
      putchar(*fmt++);
    2162:	0405                	addi	s0,s0,1
return fputc(ch, 0);
    2164:	85dff0ef          	jal	ra,19c0 <fputc>
      continue;
    2168:	bdfd                	j	2066 <printf+0x1a>
return fputc(ch, 0);
    216a:	4581                	li	a1,0
    216c:	02d00513          	li	a0,45
    2170:	851ff0ef          	jal	ra,19c0 <fputc>
            value = 0 - value;
    2174:	409004b3          	neg	s1,s1
    2178:	b765                	j	2120 <printf+0xd4>

0000217a <main>:
    217a:	1151                	addi	sp,sp,-12
    217c:	c406                	sw	ra,8(sp)
    217e:	22ed                	jal	2368 <benchmark_dhry_main>
    2180:	40a2                	lw	ra,8(sp)
    2182:	4501                	li	a0,0
    2184:	0131                	addi	sp,sp,12
    2186:	8082                	ret

00002188 <Proc_6>:
Enumeration Enum_Par_Val;
{
  Enumeration Enum_Loc;

  Enum_Loc = Enum_Par_Val;
  if (Enum_Loc == Ident_3)
    2188:	4789                	li	a5,2
    218a:	00f50e63          	beq	a0,a5,21a6 <Proc_6+0x1e>
    *Enum_Ref_Par = Ident_4;
    218e:	470d                	li	a4,3
    2190:	c198                	sw	a4,0(a1)
  switch (Enum_Val_Par)
    2192:	4705                	li	a4,1
    2194:	00e50c63          	beq	a0,a4,21ac <Proc_6+0x24>
    2198:	c115                	beqz	a0,21bc <Proc_6+0x34>
    219a:	4711                	li	a4,4
    219c:	00e50363          	beq	a0,a4,21a2 <Proc_6+0x1a>
    21a0:	8082                	ret
      *Enum_Ref_Par = Ident_3;
    21a2:	c19c                	sw	a5,0(a1)
} /* Proc_6 */
    21a4:	8082                	ret
      *Enum_Ref_Par = Ident_2;
    21a6:	4785                	li	a5,1
    21a8:	c19c                	sw	a5,0(a1)
      break;
    21aa:	8082                	ret
      if (Int_Glob > 100)
    21ac:	200047b7          	lui	a5,0x20004
    21b0:	90c7a703          	lw	a4,-1780(a5) # 2000390c <Int_Glob>
    21b4:	06400793          	li	a5,100
    21b8:	fee7d6e3          	ble	a4,a5,21a4 <Proc_6+0x1c>
      *Enum_Ref_Par = Ident_1;
    21bc:	0005a023          	sw	zero,0(a1)
    21c0:	8082                	ret

000021c2 <Proc_7>:
  Int_Loc = Int_1_Par_Val + 2;
    21c2:	0509                	addi	a0,a0,2
  *Int_Par_Ref = Int_2_Par_Val + Int_Loc;
    21c4:	95aa                	add	a1,a1,a0
    21c6:	c20c                	sw	a1,0(a2)
} /* Proc_7 */
    21c8:	8082                	ret

000021ca <Proc_8>:
  Int_Loc = Int_1_Par_Val + 5;
    21ca:	00560713          	addi	a4,a2,5
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
    21ce:	0c800313          	li	t1,200
    21d2:	02670333          	mul	t1,a4,t1
    21d6:	060a                	slli	a2,a2,0x2
  Arr_1_Par_Ref [Int_Loc] = Int_2_Par_Val;
    21d8:	00271793          	slli	a5,a4,0x2
    21dc:	953e                	add	a0,a0,a5
    21de:	c114                	sw	a3,0(a0)
  Arr_1_Par_Ref [Int_Loc+30] = Int_Loc;
    21e0:	dd38                	sw	a4,120(a0)
  Arr_1_Par_Ref [Int_Loc+1] = Arr_1_Par_Ref [Int_Loc];
    21e2:	c154                	sw	a3,4(a0)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
    21e4:	00c307b3          	add	a5,t1,a2
    21e8:	97ae                	add	a5,a5,a1
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
    21ea:	4b94                	lw	a3,16(a5)
    Arr_2_Par_Ref [Int_Loc] [Int_Index] = Int_Loc;
    21ec:	cbd8                	sw	a4,20(a5)
    21ee:	cf98                	sw	a4,24(a5)
  Arr_2_Par_Ref [Int_Loc] [Int_Loc-1] += 1;
    21f0:	00168713          	addi	a4,a3,1
    21f4:	cb98                	sw	a4,16(a5)
  Arr_2_Par_Ref [Int_Loc+20] [Int_Loc] = Arr_1_Par_Ref [Int_Loc];
    21f6:	411c                	lw	a5,0(a0)
    21f8:	959a                	add	a1,a1,t1
    21fa:	95b2                	add	a1,a1,a2
    21fc:	6605                	lui	a2,0x1
    21fe:	95b2                	add	a1,a1,a2
    2200:	faf5aa23          	sw	a5,-76(a1)
  Int_Glob = 5;
    2204:	4715                	li	a4,5
    2206:	200047b7          	lui	a5,0x20004
    220a:	90e7a623          	sw	a4,-1780(a5) # 2000390c <Int_Glob>
} /* Proc_8 */
    220e:	8082                	ret

00002210 <Func_1>:
  if (Ch_2_Loc != Ch_2_Par_Val)
    2210:	00b50463          	beq	a0,a1,2218 <Func_1+0x8>
    return (Ident_1);
    2214:	4501                	li	a0,0
} /* Func_1 */
    2216:	8082                	ret
    Ch_1_Glob = Ch_1_Loc;
    2218:	200047b7          	lui	a5,0x20004
    221c:	90a78823          	sb	a0,-1776(a5) # 20003910 <Ch_1_Glob>
    return (Ident_2);
    2220:	4505                	li	a0,1
    2222:	8082                	ret

00002224 <Func_2>:
{
    2224:	1151                	addi	sp,sp,-12
    2226:	c406                	sw	ra,8(sp)
    2228:	20004337          	lui	t1,0x20004
    if (Func_1 (Str_1_Par_Ref[Int_Loc],
    222c:	00254783          	lbu	a5,2(a0)
    2230:	0035c703          	lbu	a4,3(a1)
    2234:	91034603          	lbu	a2,-1776(t1) # 20003910 <Ch_1_Glob>
    2238:	4681                	li	a3,0
  if (Ch_2_Loc != Ch_2_Par_Val)
    223a:	02e78463          	beq	a5,a4,2262 <Func_2+0x3e>
    223e:	c299                	beqz	a3,2244 <Func_2+0x20>
    2240:	90c30823          	sb	a2,-1776(t1)
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
    2244:	ea1fd0ef          	jal	ra,e4 <strcmp>
      return (false);
    2248:	4781                	li	a5,0
    if (strcmp (Str_1_Par_Ref, Str_2_Par_Ref) > 0)
    224a:	00a05863          	blez	a0,225a <Func_2+0x36>
      Int_Glob = Int_Loc;
    224e:	200047b7          	lui	a5,0x20004
    2252:	4729                	li	a4,10
    2254:	90e7a623          	sw	a4,-1780(a5) # 2000390c <Int_Glob>
      return (true);
    2258:	4785                	li	a5,1
} /* Func_2 */
    225a:	40a2                	lw	ra,8(sp)
    225c:	853e                	mv	a0,a5
    225e:	0131                	addi	sp,sp,12
    2260:	8082                	ret
  if (Ch_2_Loc != Ch_2_Par_Val)
    2262:	4685                	li	a3,1
    2264:	863e                	mv	a2,a5
    2266:	bfd1                	j	223a <Func_2+0x16>

00002268 <Proc_3>:
    /* Ptr_Ref_Par becomes Ptr_Glob */

Rec_Pointer *Ptr_Ref_Par;

{
  if (Ptr_Glob != Null)
    2268:	200047b7          	lui	a5,0x20004
    226c:	9147a603          	lw	a2,-1772(a5) # 20003914 <Ptr_Glob>
    2270:	c609                	beqz	a2,227a <Proc_3+0x12>
    /* then, executed */
    *Ptr_Ref_Par = Ptr_Glob->Ptr_Comp;
    2272:	4218                	lw	a4,0(a2)
    2274:	c118                	sw	a4,0(a0)
    2276:	9147a603          	lw	a2,-1772(a5)
  Proc_7 (10, Int_Glob, &Ptr_Glob->variant.var_1.Int_Comp);
    227a:	200047b7          	lui	a5,0x20004
    227e:	90c7a583          	lw	a1,-1780(a5) # 2000390c <Int_Glob>
    2282:	0631                	addi	a2,a2,12
    2284:	4529                	li	a0,10
    2286:	bf35                	j	21c2 <Proc_7>

00002288 <Proc_1>:
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    2288:	200047b7          	lui	a5,0x20004
    228c:	9147a783          	lw	a5,-1772(a5) # 20003914 <Ptr_Glob>
{
    2290:	1131                	addi	sp,sp,-20
    2292:	c806                	sw	ra,16(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    2294:	5398                	lw	a4,32(a5)
    2296:	0007a083          	lw	ra,0(a5)
{
    229a:	c622                	sw	s0,12(sp)
  REG Rec_Pointer Next_Record = Ptr_Val_Par->Ptr_Comp;
    229c:	4100                	lw	s0,0(a0)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    229e:	0047a383          	lw	t2,4(a5)
    22a2:	0087a283          	lw	t0,8(a5)
    22a6:	0107a303          	lw	t1,16(a5)
    22aa:	4f8c                	lw	a1,24(a5)
    22ac:	4fd0                	lw	a2,28(a5)
    22ae:	5794                	lw	a3,40(a5)
{
    22b0:	c426                	sw	s1,8(sp)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    22b2:	c03a                	sw	a4,0(sp)
{
    22b4:	84aa                	mv	s1,a0
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    22b6:	53d8                	lw	a4,36(a5)
    22b8:	4bc8                	lw	a0,20(a5)
    22ba:	57dc                	lw	a5,44(a5)
    22bc:	00142023          	sw	ra,0(s0)
    22c0:	d45c                	sw	a5,44(s0)
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
    22c2:	409c                	lw	a5,0(s1)
  structassign (*Ptr_Val_Par->Ptr_Comp, *Ptr_Glob);
    22c4:	cc50                	sw	a2,28(s0)
    22c6:	4602                	lw	a2,0(sp)
    22c8:	00742223          	sw	t2,4(s0)
    22cc:	00542423          	sw	t0,8(s0)
    22d0:	00642823          	sw	t1,16(s0)
    22d4:	c848                	sw	a0,20(s0)
    22d6:	cc0c                	sw	a1,24(s0)
    22d8:	d010                	sw	a2,32(s0)
    22da:	d058                	sw	a4,36(s0)
    22dc:	d414                	sw	a3,40(s0)
  Ptr_Val_Par->variant.var_1.Int_Comp = 5;
    22de:	4695                	li	a3,5
    22e0:	c4d4                	sw	a3,12(s1)
        = Ptr_Val_Par->variant.var_1.Int_Comp;
    22e2:	c454                	sw	a3,12(s0)
  Proc_3 (&Next_Record->Ptr_Comp);
    22e4:	8522                	mv	a0,s0
  Next_Record->Ptr_Comp = Ptr_Val_Par->Ptr_Comp;
    22e6:	c01c                	sw	a5,0(s0)
  Proc_3 (&Next_Record->Ptr_Comp);
    22e8:	3741                	jal	2268 <Proc_3>
  if (Next_Record->Discr == Ident_1)
    22ea:	405c                	lw	a5,4(s0)
    22ec:	cba9                	beqz	a5,233e <Proc_1+0xb6>
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
    22ee:	409c                	lw	a5,0(s1)
} /* Proc_1 */
    22f0:	40c2                	lw	ra,16(sp)
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
    22f2:	5398                	lw	a4,32(a5)
    22f4:	4fd4                	lw	a3,28(a5)
    22f6:	4380                	lw	s0,0(a5)
    22f8:	c03a                	sw	a4,0(sp)
    22fa:	53d8                	lw	a4,36(a5)
    22fc:	0047a383          	lw	t2,4(a5)
    2300:	0087a283          	lw	t0,8(a5)
    2304:	00c7a303          	lw	t1,12(a5)
    2308:	4b88                	lw	a0,16(a5)
    230a:	4bcc                	lw	a1,20(a5)
    230c:	4f90                	lw	a2,24(a5)
    230e:	c23a                	sw	a4,4(sp)
    2310:	5798                	lw	a4,40(a5)
    2312:	57dc                	lw	a5,44(a5)
    2314:	ccd4                	sw	a3,28(s1)
    2316:	4682                	lw	a3,0(sp)
    2318:	c080                	sw	s0,0(s1)
} /* Proc_1 */
    231a:	4432                	lw	s0,12(sp)
    structassign (*Ptr_Val_Par, *Ptr_Val_Par->Ptr_Comp);
    231c:	d094                	sw	a3,32(s1)
    231e:	4692                	lw	a3,4(sp)
    2320:	0074a223          	sw	t2,4(s1)
    2324:	0054a423          	sw	t0,8(s1)
    2328:	0064a623          	sw	t1,12(s1)
    232c:	c888                	sw	a0,16(s1)
    232e:	c8cc                	sw	a1,20(s1)
    2330:	cc90                	sw	a2,24(s1)
    2332:	d0d4                	sw	a3,36(s1)
    2334:	d498                	sw	a4,40(s1)
    2336:	d4dc                	sw	a5,44(s1)
} /* Proc_1 */
    2338:	44a2                	lw	s1,8(sp)
    233a:	0151                	addi	sp,sp,20
    233c:	8082                	ret
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp,
    233e:	4488                	lw	a0,8(s1)
    Next_Record->variant.var_1.Int_Comp = 6;
    2340:	4799                	li	a5,6
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp,
    2342:	00840593          	addi	a1,s0,8
    Next_Record->variant.var_1.Int_Comp = 6;
    2346:	c45c                	sw	a5,12(s0)
    Proc_6 (Ptr_Val_Par->variant.var_1.Enum_Comp,
    2348:	3581                	jal	2188 <Proc_6>
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
    234a:	200047b7          	lui	a5,0x20004
    234e:	9147a783          	lw	a5,-1772(a5) # 20003914 <Ptr_Glob>
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10,
    2352:	4448                	lw	a0,12(s0)
    2354:	00c40613          	addi	a2,s0,12
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
    2358:	439c                	lw	a5,0(a5)
} /* Proc_1 */
    235a:	40c2                	lw	ra,16(sp)
    235c:	44a2                	lw	s1,8(sp)
    Next_Record->Ptr_Comp = Ptr_Glob->Ptr_Comp;
    235e:	c01c                	sw	a5,0(s0)
} /* Proc_1 */
    2360:	4432                	lw	s0,12(sp)
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10,
    2362:	45a9                	li	a1,10
} /* Proc_1 */
    2364:	0151                	addi	sp,sp,20
    Proc_7 (Next_Record->variant.var_1.Int_Comp, 10,
    2366:	bdb1                	j	21c2 <Proc_7>

00002368 <benchmark_dhry_main>:
{
    2368:	f9c10113          	addi	sp,sp,-100
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    236c:	03000513          	li	a0,48
{
    2370:	d086                	sw	ra,96(sp)
    2372:	cea2                	sw	s0,92(sp)
    2374:	cca6                	sw	s1,88(sp)
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    2376:	e34ff0ef          	jal	ra,19aa <malloc>
    237a:	842a                	mv	s0,a0
    237c:	200047b7          	lui	a5,0x20004
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    2380:	03000513          	li	a0,48
  Next_Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    2384:	9087a423          	sw	s0,-1784(a5) # 20003908 <Next_Ptr_Glob>
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    2388:	e22ff0ef          	jal	ra,19aa <malloc>
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    238c:	000036b7          	lui	a3,0x3
    2390:	da868713          	addi	a4,a3,-600 # 2da8 <sg_timer_config+0xa8>
    2394:	da86a683          	lw	a3,-600(a3)
    2398:	00472383          	lw	t2,4(a4)
    239c:	00872283          	lw	t0,8(a4)
    23a0:	01c75083          	lhu	ra,28(a4)
    23a4:	00c72303          	lw	t1,12(a4)
    23a8:	4b50                	lw	a2,20(a4)
    23aa:	c036                	sw	a3,0(sp)
    23ac:	4b0c                	lw	a1,16(a4)
    23ae:	4f14                	lw	a3,24(a4)
    23b0:	01e74703          	lbu	a4,30(a4)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    23b4:	000034b7          	lui	s1,0x3
    23b8:	2d448793          	addi	a5,s1,724 # 32d4 <sg_timer_config+0x5d4>
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    23bc:	00e10223          	sb	a4,4(sp)
  Ptr_Glob->variant.var_1.Enum_Comp     = Ident_3;
    23c0:	4709                	li	a4,2
    23c2:	c518                	sw	a4,8(a0)
  Ptr_Glob->variant.var_1.Int_Comp      = 40;
    23c4:	02800713          	li	a4,40
    23c8:	c558                	sw	a4,12(a0)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    23ca:	4702                	lw	a4,0(sp)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    23cc:	2d44a483          	lw	s1,724(s1)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    23d0:	d514                	sw	a3,40(a0)
    23d2:	c918                	sw	a4,16(a0)
    23d4:	00414683          	lbu	a3,4(sp)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    23d8:	43d8                	lw	a4,4(a5)
  Ptr_Glob->Ptr_Comp                    = Next_Ptr_Glob;
    23da:	c100                	sw	s0,0(a0)
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    23dc:	20004437          	lui	s0,0x20004
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    23e0:	00752a23          	sw	t2,20(a0)
    23e4:	00552c23          	sw	t0,24(a0)
    23e8:	02151623          	sh	ra,44(a0)
    23ec:	00652e23          	sw	t1,28(a0)
    23f0:	d150                	sw	a2,36(a0)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    23f2:	00c7a303          	lw	t1,12(a5)
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    23f6:	02d50723          	sb	a3,46(a0)
  Ptr_Glob->Discr                       = Ident_1;
    23fa:	00052223          	sw	zero,4(a0)
  Ptr_Glob = (Rec_Pointer) malloc (sizeof (Rec_Type));
    23fe:	90a42a23          	sw	a0,-1772(s0) # 20003914 <Ptr_Glob>
  strcpy (Ptr_Glob->variant.var_1.Str_Comp,
    2402:	d10c                	sw	a1,32(a0)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    2404:	cc26                	sw	s1,24(sp)
    2406:	ce3a                	sw	a4,28(sp)
    2408:	4b8c                	lw	a1,16(a5)
    240a:	4798                	lw	a4,8(a5)
    240c:	4bd0                	lw	a2,20(a5)
    240e:	4f94                	lw	a3,24(a5)
    2410:	d03a                	sw	a4,32(sp)
    2412:	01c7d703          	lhu	a4,28(a5)
    2416:	01e7c783          	lbu	a5,30(a5)
  printf ("\n");
    241a:	4529                	li	a0,10
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    241c:	02e11a23          	sh	a4,52(sp)
  Arr_2_Glob [8][7] = 10;
    2420:	20001737          	lui	a4,0x20001
    2424:	1f470713          	addi	a4,a4,500 # 200011f4 <Arr_2_Glob>
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    2428:	02f10b23          	sb	a5,54(sp)
  Arr_2_Glob [8][7] = 10;
    242c:	47a9                	li	a5,10
    242e:	64f72e23          	sw	a5,1628(a4)
  strcpy (Str_1_Loc, "DHRYSTONE PROGRAM, 1'ST STRING");
    2432:	d21a                	sw	t1,36(sp)
    2434:	d632                	sw	a2,44(sp)
    2436:	d836                	sw	a3,48(sp)
    2438:	d42e                	sw	a1,40(sp)
  printf ("\n");
    243a:	36d5                	jal	201e <putchar>
  printf ("Dhrystone Benchmark, Version 2.1 (Language: C)\n");
    243c:	00003537          	lui	a0,0x3
    2440:	dc850513          	addi	a0,a0,-568 # 2dc8 <sg_timer_config+0xc8>
    2444:	3ef9                	jal	2022 <puts>
  printf ("\n");
    2446:	4529                	li	a0,10
    2448:	3ed9                	jal	201e <putchar>
  printf ("\n");
    244a:	4529                	li	a0,10
    244c:	3ec9                	jal	201e <putchar>
  printf ("Execution starts, %d runs through Dhrystone\n", Number_Of_Runs);
    244e:	001e85b7          	lui	a1,0x1e8
    2452:	00003537          	lui	a0,0x3
    2456:	48058593          	addi	a1,a1,1152 # 1e8480 <__erodata+0x1e514c>
    245a:	df850513          	addi	a0,a0,-520 # 2df8 <sg_timer_config+0xf8>
    245e:	36fd                	jal	204c <printf>
    Timer_Open();
    2460:	23c9                	jal	2a22 <Timer_Open>
    Timer_Start();
    2462:	2be5                	jal	2a5a <Timer_Start>
  Begin_Time = time ( (long *) 0);
    2464:	4501                	li	a0,0
    2466:	2d21                	jal	2a7e <time>
    2468:	000037b7          	lui	a5,0x3
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    246c:	2f47a703          	lw	a4,756(a5) # 32f4 <sg_timer_config+0x5f4>
    2470:	2f478493          	addi	s1,a5,756
    2474:	c43a                	sw	a4,8(sp)
  Begin_Time = time ( (long *) 0);
    2476:	20001737          	lui	a4,0x20001
    247a:	1ea72823          	sw	a0,496(a4) # 200011f0 <Begin_Time>
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
    247e:	4705                	li	a4,1
    2480:	c03a                	sw	a4,0(sp)
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    2482:	01e4c783          	lbu	a5,30(s1)
    2486:	4c98                	lw	a4,24(s1)

void Proc_5 () /* without parameters */
/*******/
    /* executed once */
{
  Ch_1_Glob = 'A';
    2488:	04100093          	li	ra,65
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    248c:	00f10223          	sb	a5,4(sp)
  Ch_1_Glob = 'A';
    2490:	200047b7          	lui	a5,0x20004
    2494:	90178823          	sb	ra,-1776(a5) # 20003910 <Ch_1_Glob>
  Bool_Glob = Bool_Loc | Bool_Glob;
    2498:	200040b7          	lui	ra,0x20004
    249c:	4785                	li	a5,1
    249e:	9ef0a023          	sw	a5,-1568(ra) # 200039e0 <Bool_Glob>
  Ch_2_Glob = 'B';
    24a2:	04200093          	li	ra,66
    24a6:	200047b7          	lui	a5,0x20004
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    24aa:	0044a383          	lw	t2,4(s1)
    24ae:	0084a283          	lw	t0,8(s1)
    24b2:	00c4a303          	lw	t1,12(s1)
    24b6:	48d4                	lw	a3,20(s1)
    24b8:	4890                	lw	a2,16(s1)
  Ch_2_Glob = 'B';
    24ba:	901788a3          	sb	ra,-1775(a5) # 20003911 <Ch_2_Glob>
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    24be:	01c4d403          	lhu	s0,28(s1)
    24c2:	40a2                	lw	ra,8(sp)
    24c4:	c8ba                	sw	a4,80(sp)
    24c6:	00414703          	lbu	a4,4(sp)
    Enum_Loc = Ident_2;
    24ca:	4785                	li	a5,1
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
    24cc:	182c                	addi	a1,sp,56
    24ce:	0828                	addi	a0,sp,24
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    24d0:	de1e                	sw	t2,60(sp)
    24d2:	c096                	sw	t0,64(sp)
    24d4:	c29a                	sw	t1,68(sp)
    24d6:	c6b6                	sw	a3,76(sp)
    24d8:	04e10b23          	sb	a4,86(sp)
    24dc:	dc06                	sw	ra,56(sp)
    24de:	c4b2                	sw	a2,72(sp)
    Enum_Loc = Ident_2;
    24e0:	ca3e                	sw	a5,20(sp)
    strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 2'ND STRING");
    24e2:	04811a23          	sh	s0,84(sp)
    Bool_Glob = ! Func_2 (Str_1_Loc, Str_2_Loc);
    24e6:	3b3d                	jal	2224 <Func_2>
    24e8:	200040b7          	lui	ra,0x20004
    24ec:	00153793          	seqz	a5,a0
    24f0:	9ef0a023          	sw	a5,-1568(ra) # 200039e0 <Bool_Glob>
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
    24f4:	0810                	addi	a2,sp,16
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
    24f6:	479d                	li	a5,7
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
    24f8:	458d                	li	a1,3
    24fa:	4509                	li	a0,2
      Int_3_Loc = 5 * Int_1_Loc - Int_2_Loc;
    24fc:	c83e                	sw	a5,16(sp)
      Proc_7 (Int_1_Loc, Int_2_Loc, &Int_3_Loc);
    24fe:	31d1                	jal	21c2 <Proc_7>
    Proc_8 (Arr_1_Glob, Arr_2_Glob, Int_1_Loc, Int_3_Loc);
    2500:	46c2                	lw	a3,16(sp)
    2502:	20001737          	lui	a4,0x20001
    2506:	1f470593          	addi	a1,a4,500 # 200011f4 <Arr_2_Glob>
    250a:	20004737          	lui	a4,0x20004
    250e:	91870513          	addi	a0,a4,-1768 # 20003918 <Arr_1_Glob>
    2512:	460d                	li	a2,3
    2514:	395d                	jal	21ca <Proc_8>
    Proc_1 (Ptr_Glob);
    2516:	20004737          	lui	a4,0x20004
    251a:	91472503          	lw	a0,-1772(a4) # 20003914 <Ptr_Glob>
    251e:	33ad                	jal	2288 <Proc_1>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    2520:	200047b7          	lui	a5,0x20004
    2524:	9117c703          	lbu	a4,-1775(a5) # 20003911 <Ch_2_Glob>
    2528:	04000793          	li	a5,64
    252c:	4ae7fc63          	bleu	a4,a5,29e4 <benchmark_dhry_main+0x67c>
    Int_2_Loc = 3;
    2530:	478d                	li	a5,3
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    2532:	04100413          	li	s0,65
    Int_2_Loc = 3;
    2536:	c23e                	sw	a5,4(sp)
    2538:	a819                	j	254e <benchmark_dhry_main+0x1e6>
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    253a:	200047b7          	lui	a5,0x20004
    253e:	9117c703          	lbu	a4,-1775(a5) # 20003911 <Ch_2_Glob>
    2542:	00140793          	addi	a5,s0,1
    2546:	0ff7f413          	andi	s0,a5,255
    254a:	06876a63          	bltu	a4,s0,25be <benchmark_dhry_main+0x256>
      if (Enum_Loc == Func_1 (Ch_Index, 'C'))
    254e:	04300593          	li	a1,67
    2552:	8522                	mv	a0,s0
    2554:	3975                	jal	2210 <Func_1>
    2556:	4752                	lw	a4,20(sp)
    2558:	fee511e3          	bne	a0,a4,253a <benchmark_dhry_main+0x1d2>
        Proc_6 (Ident_1, &Enum_Loc);
    255c:	084c                	addi	a1,sp,20
    255e:	4501                	li	a0,0
    2560:	3125                	jal	2188 <Proc_6>
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
    2562:	000037b7          	lui	a5,0x3
    2566:	31478713          	addi	a4,a5,788 # 3314 <sg_timer_config+0x614>
    256a:	00472383          	lw	t2,4(a4)
    256e:	00872283          	lw	t0,8(a4)
    2572:	00c72303          	lw	t1,12(a4)
    2576:	4b08                	lw	a0,16(a4)
    2578:	4b4c                	lw	a1,20(a4)
    257a:	4f10                	lw	a2,24(a4)
    257c:	01c75683          	lhu	a3,28(a4)
    2580:	01e74703          	lbu	a4,30(a4)
    2584:	3147a083          	lw	ra,788(a5)
        Int_Glob = Run_Index;
    2588:	4782                	lw	a5,0(sp)
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
    258a:	04e10b23          	sb	a4,86(sp)
        Int_Glob = Run_Index;
    258e:	20004737          	lui	a4,0x20004
    2592:	90f72623          	sw	a5,-1780(a4) # 2000390c <Int_Glob>
    2596:	c23e                	sw	a5,4(sp)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    2598:	200047b7          	lui	a5,0x20004
    259c:	9117c703          	lbu	a4,-1775(a5) # 20003911 <Ch_2_Glob>
    25a0:	00140793          	addi	a5,s0,1
        strcpy (Str_2_Loc, "DHRYSTONE PROGRAM, 3'RD STRING");
    25a4:	dc06                	sw	ra,56(sp)
    25a6:	de1e                	sw	t2,60(sp)
    25a8:	c096                	sw	t0,64(sp)
    25aa:	c29a                	sw	t1,68(sp)
    25ac:	c4aa                	sw	a0,72(sp)
    25ae:	c6ae                	sw	a1,76(sp)
    25b0:	c8b2                	sw	a2,80(sp)
    25b2:	04d11a23          	sh	a3,84(sp)
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    25b6:	0ff7f413          	andi	s0,a5,255
    25ba:	f8877ae3          	bleu	s0,a4,254e <benchmark_dhry_main+0x1e6>
    25be:	4712                	lw	a4,4(sp)
    25c0:	00171793          	slli	a5,a4,0x1
    25c4:	00e78433          	add	s0,a5,a4
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
    25c8:	4342                	lw	t1,16(sp)
    if (Ch_1_Glob == 'A')
    25ca:	200047b7          	lui	a5,0x20004
    25ce:	9107c703          	lbu	a4,-1776(a5) # 20003910 <Ch_1_Glob>
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
    25d2:	026446b3          	div	a3,s0,t1
    if (Ch_1_Glob == 'A')
    25d6:	04100793          	li	a5,65
    Int_1_Loc = Int_2_Loc / Int_3_Loc;
    25da:	8636                	mv	a2,a3
    if (Ch_1_Glob == 'A')
    25dc:	00f71963          	bne	a4,a5,25ee <benchmark_dhry_main+0x286>
      *Int_Par_Ref = Int_Loc - Int_Glob;
    25e0:	200047b7          	lui	a5,0x20004
    25e4:	90c7a783          	lw	a5,-1780(a5) # 2000390c <Int_Glob>
      Int_Loc -= 1;
    25e8:	00968613          	addi	a2,a3,9
      *Int_Par_Ref = Int_Loc - Int_Glob;
    25ec:	8e1d                	sub	a2,a2,a5
  for (Run_Index = 1; Run_Index <= Number_Of_Runs; ++Run_Index)
    25ee:	4782                	lw	a5,0(sp)
    25f0:	00178713          	addi	a4,a5,1
    25f4:	001e87b7          	lui	a5,0x1e8
    25f8:	c03a                	sw	a4,0(sp)
    25fa:	48178793          	addi	a5,a5,1153 # 1e8481 <__erodata+0x1e514d>
    25fe:	e8f712e3          	bne	a4,a5,2482 <benchmark_dhry_main+0x11a>
  End_Time = time ( (long *) 0);
    2602:	4501                	li	a0,0
    2604:	c61a                	sw	t1,12(sp)
    2606:	c232                	sw	a2,4(sp)
    2608:	c436                	sw	a3,8(sp)
    260a:	c022                	sw	s0,0(sp)
    260c:	298d                	jal	2a7e <time>
    260e:	200042b7          	lui	t0,0x20004
    2612:	90a2a223          	sw	a0,-1788(t0) # 20003904 <End_Time>
  Timer_Stop();
    2616:	2981                	jal	2a66 <Timer_Stop>
  Timer_Close();
    2618:	29a9                	jal	2a72 <Timer_Close>
  printf ("Execution ends\n");
    261a:	00003537          	lui	a0,0x3
    261e:	e2850513          	addi	a0,a0,-472 # 2e28 <sg_timer_config+0x128>
    2622:	3401                	jal	2022 <puts>
  printf ("\n");
    2624:	4529                	li	a0,10
    2626:	3ae5                	jal	201e <putchar>
  printf ("Final values of the variables used in the benchmark:\n");
    2628:	00003537          	lui	a0,0x3
    262c:	e3850513          	addi	a0,a0,-456 # 2e38 <sg_timer_config+0x138>
    2630:	3acd                	jal	2022 <puts>
  printf ("\n");
    2632:	4529                	li	a0,10
    2634:	32ed                	jal	201e <putchar>
  printf ("Int_Glob:            %d\n", Int_Glob);
    2636:	200047b7          	lui	a5,0x20004
    263a:	90c7a583          	lw	a1,-1780(a5) # 2000390c <Int_Glob>
    263e:	00003537          	lui	a0,0x3
    2642:	e7050513          	addi	a0,a0,-400 # 2e70 <sg_timer_config+0x170>
  printf ("        should be:   %d\n", 5);
    2646:	000034b7          	lui	s1,0x3
  printf ("Int_Glob:            %d\n", Int_Glob);
    264a:	3409                	jal	204c <printf>
  printf ("        should be:   %d\n", 5);
    264c:	4595                	li	a1,5
    264e:	e8c48513          	addi	a0,s1,-372 # 2e8c <sg_timer_config+0x18c>
    2652:	3aed                	jal	204c <printf>
  printf ("Bool_Glob:           %d\n", Bool_Glob);
    2654:	200047b7          	lui	a5,0x20004
    2658:	9e07a583          	lw	a1,-1568(a5) # 200039e0 <Bool_Glob>
    265c:	00003537          	lui	a0,0x3
    2660:	ea850513          	addi	a0,a0,-344 # 2ea8 <sg_timer_config+0x1a8>
    2664:	32e5                	jal	204c <printf>
  printf ("        should be:   %d\n", 1);
    2666:	4585                	li	a1,1
    2668:	e8c48513          	addi	a0,s1,-372
    266c:	32c5                	jal	204c <printf>
  printf ("Ch_1_Glob:           %c\n", Ch_1_Glob);
    266e:	200047b7          	lui	a5,0x20004
    2672:	9107c583          	lbu	a1,-1776(a5) # 20003910 <Ch_1_Glob>
    2676:	00003537          	lui	a0,0x3
    267a:	ec450513          	addi	a0,a0,-316 # 2ec4 <sg_timer_config+0x1c4>
    267e:	32f9                	jal	204c <printf>
  printf ("        should be:   %c\n", 'A');
    2680:	00003437          	lui	s0,0x3
    2684:	04100593          	li	a1,65
    2688:	ee040513          	addi	a0,s0,-288 # 2ee0 <sg_timer_config+0x1e0>
    268c:	32c1                	jal	204c <printf>
  printf ("Ch_2_Glob:           %c\n", Ch_2_Glob);
    268e:	200047b7          	lui	a5,0x20004
    2692:	9117c583          	lbu	a1,-1775(a5) # 20003911 <Ch_2_Glob>
    2696:	00003537          	lui	a0,0x3
    269a:	efc50513          	addi	a0,a0,-260 # 2efc <sg_timer_config+0x1fc>
    269e:	327d                	jal	204c <printf>
  printf ("        should be:   %c\n", 'B');
    26a0:	04200593          	li	a1,66
    26a4:	ee040513          	addi	a0,s0,-288
    26a8:	3255                	jal	204c <printf>
  printf ("Arr_1_Glob[8]:       %d\n", Arr_1_Glob[8]);
    26aa:	200047b7          	lui	a5,0x20004
    26ae:	91878793          	addi	a5,a5,-1768 # 20003918 <Arr_1_Glob>
    26b2:	538c                	lw	a1,32(a5)
    26b4:	00003537          	lui	a0,0x3
    26b8:	f1850513          	addi	a0,a0,-232 # 2f18 <sg_timer_config+0x218>
    26bc:	3a41                	jal	204c <printf>
  printf ("        should be:   %d\n", 7);
    26be:	459d                	li	a1,7
    26c0:	e8c48513          	addi	a0,s1,-372
    26c4:	3261                	jal	204c <printf>
  printf ("Arr_2_Glob[8][7]:    %d\n", Arr_2_Glob[8][7]);
    26c6:	200017b7          	lui	a5,0x20001
    26ca:	1f478793          	addi	a5,a5,500 # 200011f4 <Arr_2_Glob>
    26ce:	65c7a583          	lw	a1,1628(a5)
    26d2:	00003537          	lui	a0,0x3
    26d6:	f3450513          	addi	a0,a0,-204 # 2f34 <sg_timer_config+0x234>
    26da:	3a8d                	jal	204c <printf>
  printf ("        should be:   Number_Of_Runs + 10\n");
    26dc:	00003537          	lui	a0,0x3
    26e0:	f5050513          	addi	a0,a0,-176 # 2f50 <sg_timer_config+0x250>
    26e4:	93fff0ef          	jal	ra,2022 <puts>
  printf ("Ptr_Glob->\n");
    26e8:	00003537          	lui	a0,0x3
    26ec:	f7c50513          	addi	a0,a0,-132 # 2f7c <sg_timer_config+0x27c>
    26f0:	933ff0ef          	jal	ra,2022 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
    26f4:	200047b7          	lui	a5,0x20004
    26f8:	9147a583          	lw	a1,-1772(a5) # 20003914 <Ptr_Glob>
    26fc:	000037b7          	lui	a5,0x3
    2700:	f8878513          	addi	a0,a5,-120 # 2f88 <sg_timer_config+0x288>
    2704:	418c                	lw	a1,0(a1)
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
    2706:	00003437          	lui	s0,0x3
  printf ("  Ptr_Comp:          %d\n", (int) Ptr_Glob->Ptr_Comp);
    270a:	3289                	jal	204c <printf>
  printf ("        should be:   (implementation-dependent)\n");
    270c:	00003537          	lui	a0,0x3
    2710:	fa450513          	addi	a0,a0,-92 # 2fa4 <sg_timer_config+0x2a4>
    2714:	90fff0ef          	jal	ra,2022 <puts>
  printf ("  Discr:             %d\n", Ptr_Glob->Discr);
    2718:	200047b7          	lui	a5,0x20004
    271c:	9147a583          	lw	a1,-1772(a5) # 20003914 <Ptr_Glob>
    2720:	fd440513          	addi	a0,s0,-44 # 2fd4 <sg_timer_config+0x2d4>
    2724:	41cc                	lw	a1,4(a1)
    2726:	927ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 0);
    272a:	4581                	li	a1,0
    272c:	e8c48513          	addi	a0,s1,-372
    2730:	91dff0ef          	jal	ra,204c <printf>
  printf ("  Enum_Comp:         %d\n", Ptr_Glob->variant.var_1.Enum_Comp);
    2734:	200047b7          	lui	a5,0x20004
    2738:	9147a583          	lw	a1,-1772(a5) # 20003914 <Ptr_Glob>
    273c:	00003737          	lui	a4,0x3
    2740:	ff070513          	addi	a0,a4,-16 # 2ff0 <sg_timer_config+0x2f0>
    2744:	458c                	lw	a1,8(a1)
    2746:	907ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 2);
    274a:	4589                	li	a1,2
    274c:	e8c48513          	addi	a0,s1,-372
    2750:	8fdff0ef          	jal	ra,204c <printf>
  printf ("  Int_Comp:          %d\n", Ptr_Glob->variant.var_1.Int_Comp);
    2754:	200047b7          	lui	a5,0x20004
    2758:	9147a583          	lw	a1,-1772(a5) # 20003914 <Ptr_Glob>
    275c:	000036b7          	lui	a3,0x3
    2760:	00c68513          	addi	a0,a3,12 # 300c <sg_timer_config+0x30c>
    2764:	45cc                	lw	a1,12(a1)
    2766:	8e7ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 17);
    276a:	45c5                	li	a1,17
    276c:	e8c48513          	addi	a0,s1,-372
    2770:	8ddff0ef          	jal	ra,204c <printf>
  printf ("  Str_Comp:          %s\n", Ptr_Glob->variant.var_1.Str_Comp);
    2774:	200047b7          	lui	a5,0x20004
    2778:	9147a583          	lw	a1,-1772(a5) # 20003914 <Ptr_Glob>
    277c:	000037b7          	lui	a5,0x3
    2780:	02878513          	addi	a0,a5,40 # 3028 <sg_timer_config+0x328>
    2784:	05c1                	addi	a1,a1,16
    2786:	8c7ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
    278a:	00003637          	lui	a2,0x3
    278e:	04460513          	addi	a0,a2,68 # 3044 <sg_timer_config+0x344>
    2792:	891ff0ef          	jal	ra,2022 <puts>
  printf ("Next_Ptr_Glob->\n");
    2796:	00003537          	lui	a0,0x3
    279a:	07850513          	addi	a0,a0,120 # 3078 <sg_timer_config+0x378>
    279e:	885ff0ef          	jal	ra,2022 <puts>
  printf ("  Ptr_Comp:          %d\n", (int) Next_Ptr_Glob->Ptr_Comp);
    27a2:	200047b7          	lui	a5,0x20004
    27a6:	9087a583          	lw	a1,-1784(a5) # 20003908 <Next_Ptr_Glob>
    27aa:	000037b7          	lui	a5,0x3
    27ae:	f8878513          	addi	a0,a5,-120 # 2f88 <sg_timer_config+0x288>
    27b2:	418c                	lw	a1,0(a1)
    27b4:	899ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   (implementation-dependent), same as above\n");
    27b8:	00003537          	lui	a0,0x3
    27bc:	08850513          	addi	a0,a0,136 # 3088 <sg_timer_config+0x388>
    27c0:	863ff0ef          	jal	ra,2022 <puts>
  printf ("  Discr:             %d\n", Next_Ptr_Glob->Discr);
    27c4:	200047b7          	lui	a5,0x20004
    27c8:	9087a783          	lw	a5,-1784(a5) # 20003908 <Next_Ptr_Glob>
    27cc:	fd440513          	addi	a0,s0,-44
    27d0:	43cc                	lw	a1,4(a5)
    27d2:	87bff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 0);
    27d6:	4581                	li	a1,0
    27d8:	e8c48513          	addi	a0,s1,-372
    27dc:	871ff0ef          	jal	ra,204c <printf>
  printf ("  Enum_Comp:         %d\n", Next_Ptr_Glob->variant.var_1.Enum_Comp);
    27e0:	200047b7          	lui	a5,0x20004
    27e4:	843e                	mv	s0,a5
    27e6:	9087a783          	lw	a5,-1784(a5) # 20003908 <Next_Ptr_Glob>
    27ea:	00003737          	lui	a4,0x3
    27ee:	ff070513          	addi	a0,a4,-16 # 2ff0 <sg_timer_config+0x2f0>
    27f2:	478c                	lw	a1,8(a5)
    27f4:	859ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 1);
    27f8:	4585                	li	a1,1
    27fa:	e8c48513          	addi	a0,s1,-372
    27fe:	84fff0ef          	jal	ra,204c <printf>
  printf ("  Int_Comp:          %d\n", Next_Ptr_Glob->variant.var_1.Int_Comp);
    2802:	90842783          	lw	a5,-1784(s0)
    2806:	000036b7          	lui	a3,0x3
    280a:	00c68513          	addi	a0,a3,12 # 300c <sg_timer_config+0x30c>
    280e:	47cc                	lw	a1,12(a5)
    2810:	83dff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 18);
    2814:	45c9                	li	a1,18
    2816:	e8c48513          	addi	a0,s1,-372
    281a:	833ff0ef          	jal	ra,204c <printf>
  printf ("  Str_Comp:          %s\n",
    281e:	90842583          	lw	a1,-1784(s0)
    2822:	000037b7          	lui	a5,0x3
    2826:	02878513          	addi	a0,a5,40 # 3028 <sg_timer_config+0x328>
    282a:	05c1                	addi	a1,a1,16
    282c:	821ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, SOME STRING\n");
    2830:	00003637          	lui	a2,0x3
    2834:	04460513          	addi	a0,a2,68 # 3044 <sg_timer_config+0x344>
    2838:	feaff0ef          	jal	ra,2022 <puts>
  printf ("Int_1_Loc:           %d\n", Int_1_Loc);
    283c:	4612                	lw	a2,4(sp)
    283e:	00003537          	lui	a0,0x3
    2842:	0c850513          	addi	a0,a0,200 # 30c8 <sg_timer_config+0x3c8>
    2846:	85b2                	mv	a1,a2
    2848:	805ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 5);
    284c:	4595                	li	a1,5
    284e:	e8c48513          	addi	a0,s1,-372
    2852:	ffaff0ef          	jal	ra,204c <printf>
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
    2856:	4332                	lw	t1,12(sp)
    2858:	4702                	lw	a4,0(sp)
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
    285a:	46a2                	lw	a3,8(sp)
    285c:	00003537          	lui	a0,0x3
    Int_2_Loc = 7 * (Int_2_Loc - Int_3_Loc) - Int_1_Loc;
    2860:	40670733          	sub	a4,a4,t1
    2864:	00371793          	slli	a5,a4,0x3
    2868:	40e78733          	sub	a4,a5,a4
  printf ("Int_2_Loc:           %d\n", Int_2_Loc);
    286c:	40d705b3          	sub	a1,a4,a3
    2870:	0e450513          	addi	a0,a0,228 # 30e4 <sg_timer_config+0x3e4>
    2874:	fd8ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 13);
    2878:	45b5                	li	a1,13
    287a:	e8c48513          	addi	a0,s1,-372
    287e:	fceff0ef          	jal	ra,204c <printf>
  printf ("Int_3_Loc:           %d\n", Int_3_Loc);
    2882:	45c2                	lw	a1,16(sp)
    2884:	00003537          	lui	a0,0x3
    2888:	10050513          	addi	a0,a0,256 # 3100 <sg_timer_config+0x400>
    288c:	fc0ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 7);
    2890:	459d                	li	a1,7
    2892:	e8c48513          	addi	a0,s1,-372
    2896:	fb6ff0ef          	jal	ra,204c <printf>
  printf ("Enum_Loc:            %d\n", Enum_Loc);
    289a:	45d2                	lw	a1,20(sp)
    289c:	00003537          	lui	a0,0x3
    28a0:	11c50513          	addi	a0,a0,284 # 311c <sg_timer_config+0x41c>
    28a4:	fa8ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   %d\n", 1);
    28a8:	4585                	li	a1,1
    28aa:	e8c48513          	addi	a0,s1,-372
    28ae:	f9eff0ef          	jal	ra,204c <printf>
  printf ("Str_1_Loc:           %s\n", Str_1_Loc);
    28b2:	00003537          	lui	a0,0x3
    28b6:	082c                	addi	a1,sp,24
    28b8:	13850513          	addi	a0,a0,312 # 3138 <sg_timer_config+0x438>
    28bc:	f90ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 1'ST STRING\n");
    28c0:	00003537          	lui	a0,0x3
    28c4:	15450513          	addi	a0,a0,340 # 3154 <sg_timer_config+0x454>
    28c8:	f5aff0ef          	jal	ra,2022 <puts>
  printf ("Str_2_Loc:           %s\n", Str_2_Loc);
    28cc:	00003537          	lui	a0,0x3
    28d0:	182c                	addi	a1,sp,56
    28d2:	18850513          	addi	a0,a0,392 # 3188 <sg_timer_config+0x488>
    28d6:	f76ff0ef          	jal	ra,204c <printf>
  printf ("        should be:   DHRYSTONE PROGRAM, 2'ND STRING\n");
    28da:	00003537          	lui	a0,0x3
    28de:	1a450513          	addi	a0,a0,420 # 31a4 <sg_timer_config+0x4a4>
    28e2:	f40ff0ef          	jal	ra,2022 <puts>
  printf ("\n");
    28e6:	4529                	li	a0,10
    28e8:	f36ff0ef          	jal	ra,201e <putchar>
  User_Time = End_Time - Begin_Time;
    28ec:	200017b7          	lui	a5,0x20001
    28f0:	200042b7          	lui	t0,0x20004
    28f4:	1f07a703          	lw	a4,496(a5) # 200011f0 <Begin_Time>
    28f8:	9042a503          	lw	a0,-1788(t0) # 20003904 <End_Time>
  if (User_Time < Too_Small_Time)
    28fc:	4785                	li	a5,1
  User_Time = End_Time - Begin_Time;
    28fe:	8d19                	sub	a0,a0,a4
    2900:	20001737          	lui	a4,0x20001
    2904:	1ea72623          	sw	a0,492(a4) # 200011ec <User_Time>
  if (User_Time < Too_Small_Time)
    2908:	0ea7d063          	ble	a0,a5,29e8 <benchmark_dhry_main+0x680>
    Microseconds = (float) User_Time * Mic_secs_Per_Second
    290c:	b4ffe0ef          	jal	ra,145a <__floatsisf>
    2910:	c02a                	sw	a0,0(sp)
    2912:	c03fe0ef          	jal	ra,1514 <__extendsfdf2>
    2916:	00003737          	lui	a4,0x3
    291a:	d9872603          	lw	a2,-616(a4) # 2d98 <sg_timer_config+0x98>
    291e:	d9c72683          	lw	a3,-612(a4)
    Dhrystones_Per_Second = (float) Number_Of_Runs / (float) User_Time;
    2922:	20001437          	lui	s0,0x20001
    printf ("%d \n", (int)Microseconds * 1000);
    2926:	000034b7          	lui	s1,0x3
    Microseconds = (float) User_Time * Mic_secs_Per_Second
    292a:	9c6fe0ef          	jal	ra,af0 <__muldf3>
                        / (float) Number_Of_Runs;
    292e:	00003737          	lui	a4,0x3
    2932:	da072603          	lw	a2,-608(a4) # 2da0 <sg_timer_config+0xa0>
    2936:	da472683          	lw	a3,-604(a4)
    293a:	c2dfd0ef          	jal	ra,566 <__divdf3>
    293e:	c6ffe0ef          	jal	ra,15ac <__truncdfsf2>
    2942:	200017b7          	lui	a5,0x20001
    Dhrystones_Per_Second = (float) Number_Of_Runs / (float) User_Time;
    2946:	00003737          	lui	a4,0x3
                        / (float) Number_Of_Runs;
    294a:	1ea7a223          	sw	a0,484(a5) # 200011e4 <Microseconds>
    Dhrystones_Per_Second = (float) Number_Of_Runs / (float) User_Time;
    294e:	4782                	lw	a5,0(sp)
    2950:	d8c72503          	lw	a0,-628(a4) # 2d8c <sg_timer_config+0x8c>
    2954:	85be                	mv	a1,a5
    2956:	e3afe0ef          	jal	ra,f90 <__divsf3>
    295a:	1ea42423          	sw	a0,488(s0) # 200011e8 <Dhrystones_Per_Second>
    printf ("Microseconds*1000 for one run through Dhrystone: ");
    295e:	00003537          	lui	a0,0x3
    2962:	23050513          	addi	a0,a0,560 # 3230 <sg_timer_config+0x530>
    2966:	ee6ff0ef          	jal	ra,204c <printf>
    printf ("%d \n", (int)Microseconds * 1000);
    296a:	200017b7          	lui	a5,0x20001
    296e:	1e47a503          	lw	a0,484(a5) # 200011e4 <Microseconds>
    2972:	a89fe0ef          	jal	ra,13fa <__fixsfsi>
    2976:	3e800593          	li	a1,1000
    297a:	02b505b3          	mul	a1,a0,a1
    297e:	26448513          	addi	a0,s1,612 # 3264 <sg_timer_config+0x564>
    2982:	ecaff0ef          	jal	ra,204c <printf>
    printf ("Dhrystones per Second:                      ");
    2986:	00003537          	lui	a0,0x3
    298a:	26c50513          	addi	a0,a0,620 # 326c <sg_timer_config+0x56c>
    298e:	ebeff0ef          	jal	ra,204c <printf>
    printf ("%d \n", (int)Dhrystones_Per_Second);
    2992:	1e842503          	lw	a0,488(s0)
    2996:	a65fe0ef          	jal	ra,13fa <__fixsfsi>
    299a:	85aa                	mv	a1,a0
    299c:	26448513          	addi	a0,s1,612
    29a0:	eacff0ef          	jal	ra,204c <printf>
    int val = 100 * Dhrystones_Per_Second / (1757 * 20);
    29a4:	000037b7          	lui	a5,0x3
    29a8:	d907a583          	lw	a1,-624(a5) # 2d90 <sg_timer_config+0x90>
    29ac:	1e842503          	lw	a0,488(s0)
    29b0:	823fe0ef          	jal	ra,11d2 <__mulsf3>
    29b4:	000037b7          	lui	a5,0x3
    29b8:	d947a583          	lw	a1,-620(a5) # 2d94 <sg_timer_config+0x94>
    29bc:	dd4fe0ef          	jal	ra,f90 <__divsf3>
    29c0:	a3bfe0ef          	jal	ra,13fa <__fixsfsi>
    printf ("Score (* 100 DMIPS/MHz):                          %d",
    29c4:	85aa                	mv	a1,a0
    29c6:	00003537          	lui	a0,0x3
    29ca:	29c50513          	addi	a0,a0,668 # 329c <sg_timer_config+0x59c>
    29ce:	e7eff0ef          	jal	ra,204c <printf>
    printf ("\n");
    29d2:	4529                	li	a0,10
    29d4:	e4aff0ef          	jal	ra,201e <putchar>
}
    29d8:	5086                	lw	ra,96(sp)
    29da:	4476                	lw	s0,92(sp)
    29dc:	44e6                	lw	s1,88(sp)
    29de:	06410113          	addi	sp,sp,100
    29e2:	8082                	ret
    for (Ch_Index = 'A'; Ch_Index <= Ch_2_Glob; ++Ch_Index)
    29e4:	4425                	li	s0,9
    29e6:	b6cd                	j	25c8 <benchmark_dhry_main+0x260>
    printf ("Measured time too small to obtain meaningful results\n");
    29e8:	00003537          	lui	a0,0x3
    29ec:	1d850513          	addi	a0,a0,472 # 31d8 <sg_timer_config+0x4d8>
    29f0:	e32ff0ef          	jal	ra,2022 <puts>
    printf ("Please increase number of runs\n");
    29f4:	00003537          	lui	a0,0x3
    29f8:	21050513          	addi	a0,a0,528 # 3210 <sg_timer_config+0x510>
    29fc:	e26ff0ef          	jal	ra,2022 <puts>
    printf ("\n");
    2a00:	4529                	li	a0,10
    2a02:	e1cff0ef          	jal	ra,201e <putchar>
}
    2a06:	5086                	lw	ra,96(sp)
    2a08:	4476                	lw	s0,92(sp)
    2a0a:	44e6                	lw	s1,88(sp)
    2a0c:	06410113          	addi	sp,sp,100
    2a10:	8082                	ret

00002a12 <timer_cb_fun>:
/*
 * Callback function for TIMER0 interrupt, set timer_flag.
 */
static void timer_cb_fun(int32_t idx,timer_event_e event)
{
	SysTimer_LoopCount++;
    2a12:	200007b7          	lui	a5,0x20000
    2a16:	00c78793          	addi	a5,a5,12 # 2000000c <SysTimer_LoopCount>
    2a1a:	4398                	lw	a4,0(a5)
    2a1c:	0705                	addi	a4,a4,1
    2a1e:	c398                	sw	a4,0(a5)
}
    2a20:	8082                	ret

00002a22 <Timer_Open>:
 *start  systimer
 *
 */
void Timer_Open()
{
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    2a22:	000035b7          	lui	a1,0x3
{
    2a26:	1151                	addi	sp,sp,-12
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    2a28:	a1258593          	addi	a1,a1,-1518 # 2a12 <timer_cb_fun>
    2a2c:	4501                	li	a0,0
{
    2a2e:	c406                	sw	ra,8(sp)
    2a30:	c222                	sw	s0,4(sp)
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    2a32:	af8ff0ef          	jal	ra,1d2a <csi_timer_initialize>
    2a36:	20000437          	lui	s0,0x20000
    2a3a:	01040413          	addi	s0,s0,16 # 20000010 <timer_handle>
    csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    2a3e:	4585                	li	a1,1
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    2a40:	c008                	sw	a0,0(s0)
    csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    2a42:	bc8ff0ef          	jal	ra,1e0a <csi_timer_config>
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    2a46:	4008                	lw	a0,0(s0)
}
    2a48:	4412                	lw	s0,4(sp)
    2a4a:	40a2                	lw	ra,8(sp)
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    2a4c:	05f5e5b7          	lui	a1,0x5f5e
    2a50:	10058593          	addi	a1,a1,256 # 5f5e100 <__erodata+0x5f5adcc>
}
    2a54:	0131                	addi	sp,sp,12
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    2a56:	bf6ff06f          	j	1e4c <csi_timer_set_timeout>

00002a5a <Timer_Start>:

void Timer_Start()
{
    csi_timer_start(timer_handle);
    2a5a:	200007b7          	lui	a5,0x20000
    2a5e:	0107a503          	lw	a0,16(a5) # 20000010 <timer_handle>
    2a62:	bfcff06f          	j	1e5e <csi_timer_start>

00002a66 <Timer_Stop>:
}
void Timer_Stop()
{
    csi_timer_stop(timer_handle);
    2a66:	200007b7          	lui	a5,0x20000
    2a6a:	0107a503          	lw	a0,16(a5) # 20000010 <timer_handle>
    2a6e:	c5cff06f          	j	1eca <csi_timer_stop>

00002a72 <Timer_Close>:
}

void Timer_Close()
{
    csi_timer_uninitialize(timer_handle);
    2a72:	200007b7          	lui	a5,0x20000
    2a76:	0107a503          	lw	a0,16(a5) # 20000010 <timer_handle>
    2a7a:	b44ff06f          	j	1dbe <csi_timer_uninitialize>

00002a7e <time>:
  csi_timer_get_current_value (timer_handle, &cv);
    2a7e:	200007b7          	lui	a5,0x20000
    2a82:	0107a503          	lw	a0,16(a5) # 20000010 <timer_handle>
    return  systimer_us;
}

/* run time since run (seconds)*/
 long time()
{
    2a86:	1141                	addi	sp,sp,-16
  csi_timer_get_current_value (timer_handle, &cv);
    2a88:	858a                	mv	a1,sp
{
    2a8a:	c606                	sw	ra,12(sp)
  csi_timer_get_current_value (timer_handle, &cv);
    2a8c:	c74ff0ef          	jal	ra,1f00 <csi_timer_get_current_value>
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    2a90:	200007b7          	lui	a5,0x20000
    2a94:	00c7a703          	lw	a4,12(a5) # 2000000c <SysTimer_LoopCount>
    2a98:	773597b7          	lui	a5,0x77359
    2a9c:	40178313          	addi	t1,a5,1025 # 77359401 <__heap_end+0x572d9401>
    2aa0:	00170793          	addi	a5,a4,1
    2aa4:	026785b3          	mul	a1,a5,t1
    2aa8:	4502                	lw	a0,0(sp)
    unsigned long long systimer_val;
    systimer_val = Timer_CurrentValue();
    return (long)(systimer_val / APB_FREQ);
    2aaa:	01313637          	lui	a2,0x1313
    2aae:	d0060613          	addi	a2,a2,-768 # 1312d00 <__erodata+0x130f9cc>
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    2ab2:	fff54513          	not	a0,a0
    return (long)(systimer_val / APB_FREQ);
    2ab6:	4681                	li	a3,0
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    2ab8:	0267b7b3          	mulhu	a5,a5,t1
    2abc:	952e                	add	a0,a0,a1
    2abe:	00b535b3          	sltu	a1,a0,a1
    2ac2:	17fd                	addi	a5,a5,-1
    return (long)(systimer_val / APB_FREQ);
    2ac4:	95be                	add	a1,a1,a5
    2ac6:	f3cfd0ef          	jal	ra,202 <__udivdi3>
}
    2aca:	40b2                	lw	ra,12(sp)
    2acc:	0141                	addi	sp,sp,16
    2ace:	8082                	ret
