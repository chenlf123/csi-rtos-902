
./out/sl03_evb.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <Reset_Handler>:
    .type    Reset_Handler, %function
Reset_Handler:
#    lrw      r0, 0x80000000
#    mtcr     r0, psr

    la       x2, g_top_irqstack
       0:	20001117          	auipc	sp,0x20001
       4:	03810113          	addi	sp,sp,56 # 20001038 <g_top_irqstack>
 *    __bss_start__: start of the BSS section.
 *    __bss_end__: end of the BSS section.
 *
 *  Both addresses must be aligned to 4 bytes boundary.
 */
    la      x3, __bss_start__
       8:	20000197          	auipc	gp,0x20000
       c:	00818193          	addi	gp,gp,8 # 20000010 <__data_end__>
    la      x4, __bss_end__
      10:	20001217          	auipc	tp,0x20001
      14:	20020213          	addi	tp,tp,512 # 20001210 <__bss_end__>

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
      2e:	56e010ef          	jal	ra,159c <SystemInit>
#endif

#ifndef __NO_BOARD_INIT
    jal    board_init
      32:	598010ef          	jal	ra,15ca <board_init>
#    lrw     r0, VIC_TSPR
#    movi    r1, 0xb00
#    stw     r1, (r0)
#endif

    jal    main
      36:	62c010ef          	jal	ra,1662 <main>

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

000000e4 <__udivdi3>:
      e4:	1161                	addi	sp,sp,-8
      e6:	c222                	sw	s0,4(sp)
      e8:	c026                	sw	s1,0(sp)
      ea:	87ae                	mv	a5,a1
      ec:	20069c63          	bnez	a3,304 <__min_heap_size+0x104>
      f0:	83b6                	mv	t2,a3
      f2:	6699                	lui	a3,0x6
      f4:	8332                	mv	t1,a2
      f6:	82aa                	mv	t0,a0
      f8:	76c68693          	addi	a3,a3,1900 # 676c <__clz_tab>
      fc:	0ac5fd63          	bleu	a2,a1,1b6 <__udivdi3+0xd2>
     100:	6741                	lui	a4,0x10
     102:	0ae67363          	bleu	a4,a2,1a8 <__udivdi3+0xc4>
     106:	0ff00713          	li	a4,255
     10a:	00c73733          	sltu	a4,a4,a2
     10e:	070e                	slli	a4,a4,0x3
     110:	00e653b3          	srl	t2,a2,a4
     114:	969e                	add	a3,a3,t2
     116:	0006c683          	lbu	a3,0(a3)
     11a:	9736                	add	a4,a4,a3
     11c:	02000693          	li	a3,32
     120:	8e99                	sub	a3,a3,a4
     122:	ca91                	beqz	a3,136 <__udivdi3+0x52>
     124:	00d795b3          	sll	a1,a5,a3
     128:	00e55733          	srl	a4,a0,a4
     12c:	00d61333          	sll	t1,a2,a3
     130:	8dd9                	or	a1,a1,a4
     132:	00d512b3          	sll	t0,a0,a3
     136:	01035513          	srli	a0,t1,0x10
     13a:	02a5f733          	remu	a4,a1,a0
     13e:	01031613          	slli	a2,t1,0x10
     142:	8241                	srli	a2,a2,0x10
     144:	0102d693          	srli	a3,t0,0x10
     148:	02a5d5b3          	divu	a1,a1,a0
     14c:	0742                	slli	a4,a4,0x10
     14e:	8ed9                	or	a3,a3,a4
     150:	02b607b3          	mul	a5,a2,a1
     154:	872e                	mv	a4,a1
     156:	00f6fc63          	bleu	a5,a3,16e <__udivdi3+0x8a>
     15a:	969a                	add	a3,a3,t1
     15c:	fff58713          	addi	a4,a1,-1
     160:	0066e763          	bltu	a3,t1,16e <__udivdi3+0x8a>
     164:	00f6f563          	bleu	a5,a3,16e <__udivdi3+0x8a>
     168:	ffe58713          	addi	a4,a1,-2
     16c:	969a                	add	a3,a3,t1
     16e:	8e9d                	sub	a3,a3,a5
     170:	02a6f7b3          	remu	a5,a3,a0
     174:	02c2                	slli	t0,t0,0x10
     176:	0102d293          	srli	t0,t0,0x10
     17a:	02a6d6b3          	divu	a3,a3,a0
     17e:	07c2                	slli	a5,a5,0x10
     180:	0057e2b3          	or	t0,a5,t0
     184:	02d60633          	mul	a2,a2,a3
     188:	8536                	mv	a0,a3
     18a:	00c2fb63          	bleu	a2,t0,1a0 <__udivdi3+0xbc>
     18e:	929a                	add	t0,t0,t1
     190:	fff68513          	addi	a0,a3,-1
     194:	0062e663          	bltu	t0,t1,1a0 <__udivdi3+0xbc>
     198:	00c2f463          	bleu	a2,t0,1a0 <__udivdi3+0xbc>
     19c:	ffe68513          	addi	a0,a3,-2
     1a0:	0742                	slli	a4,a4,0x10
     1a2:	8f49                	or	a4,a4,a0
     1a4:	4581                	li	a1,0
     1a6:	a85d                	j	25c <__min_heap_size+0x5c>
     1a8:	010003b7          	lui	t2,0x1000
     1ac:	4741                	li	a4,16
     1ae:	f67661e3          	bltu	a2,t2,110 <__udivdi3+0x2c>
     1b2:	4761                	li	a4,24
     1b4:	bfb1                	j	110 <__udivdi3+0x2c>
     1b6:	e601                	bnez	a2,1be <__udivdi3+0xda>
     1b8:	4705                	li	a4,1
     1ba:	02c75333          	divu	t1,a4,a2
     1be:	6741                	lui	a4,0x10
     1c0:	0ae37363          	bleu	a4,t1,266 <__min_heap_size+0x66>
     1c4:	0ff00713          	li	a4,255
     1c8:	00677363          	bleu	t1,a4,1ce <__udivdi3+0xea>
     1cc:	43a1                	li	t2,8
     1ce:	00735733          	srl	a4,t1,t2
     1d2:	96ba                	add	a3,a3,a4
     1d4:	0006c703          	lbu	a4,0(a3)
     1d8:	971e                	add	a4,a4,t2
     1da:	02000393          	li	t2,32
     1de:	40e383b3          	sub	t2,t2,a4
     1e2:	08039963          	bnez	t2,274 <__min_heap_size+0x74>
     1e6:	406787b3          	sub	a5,a5,t1
     1ea:	4585                	li	a1,1
     1ec:	01035413          	srli	s0,t1,0x10
     1f0:	01031393          	slli	t2,t1,0x10
     1f4:	0103d393          	srli	t2,t2,0x10
     1f8:	0102d693          	srli	a3,t0,0x10
     1fc:	0287f733          	remu	a4,a5,s0
     200:	0287d7b3          	divu	a5,a5,s0
     204:	0742                	slli	a4,a4,0x10
     206:	8ed9                	or	a3,a3,a4
     208:	02f38633          	mul	a2,t2,a5
     20c:	873e                	mv	a4,a5
     20e:	00c6fc63          	bleu	a2,a3,226 <__min_heap_size+0x26>
     212:	969a                	add	a3,a3,t1
     214:	fff78713          	addi	a4,a5,-1
     218:	0066e763          	bltu	a3,t1,226 <__min_heap_size+0x26>
     21c:	00c6f563          	bleu	a2,a3,226 <__min_heap_size+0x26>
     220:	ffe78713          	addi	a4,a5,-2
     224:	969a                	add	a3,a3,t1
     226:	8e91                	sub	a3,a3,a2
     228:	0286f7b3          	remu	a5,a3,s0
     22c:	02c2                	slli	t0,t0,0x10
     22e:	0102d293          	srli	t0,t0,0x10
     232:	0286d6b3          	divu	a3,a3,s0
     236:	07c2                	slli	a5,a5,0x10
     238:	0057e2b3          	or	t0,a5,t0
     23c:	02d383b3          	mul	t2,t2,a3
     240:	8536                	mv	a0,a3
     242:	0072fb63          	bleu	t2,t0,258 <__min_heap_size+0x58>
     246:	929a                	add	t0,t0,t1
     248:	fff68513          	addi	a0,a3,-1
     24c:	0062e663          	bltu	t0,t1,258 <__min_heap_size+0x58>
     250:	0072f463          	bleu	t2,t0,258 <__min_heap_size+0x58>
     254:	ffe68513          	addi	a0,a3,-2
     258:	0742                	slli	a4,a4,0x10
     25a:	8f49                	or	a4,a4,a0
     25c:	853a                	mv	a0,a4
     25e:	4412                	lw	s0,4(sp)
     260:	4482                	lw	s1,0(sp)
     262:	0121                	addi	sp,sp,8
     264:	8082                	ret
     266:	01000737          	lui	a4,0x1000
     26a:	43c1                	li	t2,16
     26c:	f6e361e3          	bltu	t1,a4,1ce <__udivdi3+0xea>
     270:	43e1                	li	t2,24
     272:	bfb1                	j	1ce <__udivdi3+0xea>
     274:	00731333          	sll	t1,t1,t2
     278:	00e7d6b3          	srl	a3,a5,a4
     27c:	01035593          	srli	a1,t1,0x10
     280:	007797b3          	sll	a5,a5,t2
     284:	007512b3          	sll	t0,a0,t2
     288:	02b6d3b3          	divu	t2,a3,a1
     28c:	00e55733          	srl	a4,a0,a4
     290:	00f76633          	or	a2,a4,a5
     294:	01031793          	slli	a5,t1,0x10
     298:	83c1                	srli	a5,a5,0x10
     29a:	01065513          	srli	a0,a2,0x10
     29e:	02b6f733          	remu	a4,a3,a1
     2a2:	027786b3          	mul	a3,a5,t2
     2a6:	0742                	slli	a4,a4,0x10
     2a8:	8f49                	or	a4,a4,a0
     2aa:	851e                	mv	a0,t2
     2ac:	00d77c63          	bleu	a3,a4,2c4 <__min_heap_size+0xc4>
     2b0:	971a                	add	a4,a4,t1
     2b2:	fff38513          	addi	a0,t2,-1 # ffffff <__erodata+0xff91c7>
     2b6:	00676763          	bltu	a4,t1,2c4 <__min_heap_size+0xc4>
     2ba:	00d77563          	bleu	a3,a4,2c4 <__min_heap_size+0xc4>
     2be:	ffe38513          	addi	a0,t2,-2
     2c2:	971a                	add	a4,a4,t1
     2c4:	40d706b3          	sub	a3,a4,a3
     2c8:	02b6f733          	remu	a4,a3,a1
     2cc:	02b6d6b3          	divu	a3,a3,a1
     2d0:	0742                	slli	a4,a4,0x10
     2d2:	02d783b3          	mul	t2,a5,a3
     2d6:	01061793          	slli	a5,a2,0x10
     2da:	83c1                	srli	a5,a5,0x10
     2dc:	8fd9                	or	a5,a5,a4
     2de:	8736                	mv	a4,a3
     2e0:	0077fc63          	bleu	t2,a5,2f8 <__min_heap_size+0xf8>
     2e4:	979a                	add	a5,a5,t1
     2e6:	fff68713          	addi	a4,a3,-1
     2ea:	0067e763          	bltu	a5,t1,2f8 <__min_heap_size+0xf8>
     2ee:	0077f563          	bleu	t2,a5,2f8 <__min_heap_size+0xf8>
     2f2:	ffe68713          	addi	a4,a3,-2
     2f6:	979a                	add	a5,a5,t1
     2f8:	01051593          	slli	a1,a0,0x10
     2fc:	407787b3          	sub	a5,a5,t2
     300:	8dd9                	or	a1,a1,a4
     302:	b5ed                	j	1ec <__udivdi3+0x108>
     304:	12d5ef63          	bltu	a1,a3,442 <__min_heap_size+0x242>
     308:	6741                	lui	a4,0x10
     30a:	02e6fc63          	bleu	a4,a3,342 <__min_heap_size+0x142>
     30e:	0ff00713          	li	a4,255
     312:	00d73733          	sltu	a4,a4,a3
     316:	070e                	slli	a4,a4,0x3
     318:	6319                	lui	t1,0x6
     31a:	00e6d5b3          	srl	a1,a3,a4
     31e:	76c30313          	addi	t1,t1,1900 # 676c <__clz_tab>
     322:	959a                	add	a1,a1,t1
     324:	0005c583          	lbu	a1,0(a1)
     328:	972e                	add	a4,a4,a1
     32a:	02000593          	li	a1,32
     32e:	8d99                	sub	a1,a1,a4
     330:	e185                	bnez	a1,350 <__min_heap_size+0x150>
     332:	4705                	li	a4,1
     334:	f2f6e4e3          	bltu	a3,a5,25c <__min_heap_size+0x5c>
     338:	00c53633          	sltu	a2,a0,a2
     33c:	00164713          	xori	a4,a2,1
     340:	bf31                	j	25c <__min_heap_size+0x5c>
     342:	010005b7          	lui	a1,0x1000
     346:	4741                	li	a4,16
     348:	fcb6e8e3          	bltu	a3,a1,318 <__min_heap_size+0x118>
     34c:	4761                	li	a4,24
     34e:	b7e9                	j	318 <__min_heap_size+0x118>
     350:	00e65333          	srl	t1,a2,a4
     354:	00b696b3          	sll	a3,a3,a1
     358:	00d366b3          	or	a3,t1,a3
     35c:	00e7d3b3          	srl	t2,a5,a4
     360:	0106d413          	srli	s0,a3,0x10
     364:	0283f2b3          	remu	t0,t2,s0
     368:	00e55733          	srl	a4,a0,a4
     36c:	00b797b3          	sll	a5,a5,a1
     370:	8fd9                	or	a5,a5,a4
     372:	01069713          	slli	a4,a3,0x10
     376:	8341                	srli	a4,a4,0x10
     378:	0107d313          	srli	t1,a5,0x10
     37c:	00b61633          	sll	a2,a2,a1
     380:	0283d3b3          	divu	t2,t2,s0
     384:	02c2                	slli	t0,t0,0x10
     386:	0062e2b3          	or	t0,t0,t1
     38a:	027704b3          	mul	s1,a4,t2
     38e:	831e                	mv	t1,t2
     390:	0092fc63          	bleu	s1,t0,3a8 <__min_heap_size+0x1a8>
     394:	92b6                	add	t0,t0,a3
     396:	fff38313          	addi	t1,t2,-1
     39a:	00d2e763          	bltu	t0,a3,3a8 <__min_heap_size+0x1a8>
     39e:	0092f563          	bleu	s1,t0,3a8 <__min_heap_size+0x1a8>
     3a2:	ffe38313          	addi	t1,t2,-2
     3a6:	92b6                	add	t0,t0,a3
     3a8:	409282b3          	sub	t0,t0,s1
     3ac:	0282f3b3          	remu	t2,t0,s0
     3b0:	07c2                	slli	a5,a5,0x10
     3b2:	83c1                	srli	a5,a5,0x10
     3b4:	0282d2b3          	divu	t0,t0,s0
     3b8:	03c2                	slli	t2,t2,0x10
     3ba:	00f3e7b3          	or	a5,t2,a5
     3be:	02570733          	mul	a4,a4,t0
     3c2:	8396                	mv	t2,t0
     3c4:	00e7fc63          	bleu	a4,a5,3dc <__min_heap_size+0x1dc>
     3c8:	97b6                	add	a5,a5,a3
     3ca:	fff28393          	addi	t2,t0,-1 # c9 <memset+0x8d>
     3ce:	00d7e763          	bltu	a5,a3,3dc <__min_heap_size+0x1dc>
     3d2:	00e7f563          	bleu	a4,a5,3dc <__min_heap_size+0x1dc>
     3d6:	ffe28393          	addi	t2,t0,-2
     3da:	97b6                	add	a5,a5,a3
     3dc:	8f99                	sub	a5,a5,a4
     3de:	01031713          	slli	a4,t1,0x10
     3e2:	00776733          	or	a4,a4,t2
     3e6:	63c1                	lui	t2,0x10
     3e8:	fff38313          	addi	t1,t2,-1 # ffff <__erodata+0x91c7>
     3ec:	006776b3          	and	a3,a4,t1
     3f0:	01075413          	srli	s0,a4,0x10
     3f4:	00667333          	and	t1,a2,t1
     3f8:	8241                	srli	a2,a2,0x10
     3fa:	026682b3          	mul	t0,a3,t1
     3fe:	02640333          	mul	t1,s0,t1
     402:	02c40433          	mul	s0,s0,a2
     406:	02c68633          	mul	a2,a3,a2
     40a:	0102d693          	srli	a3,t0,0x10
     40e:	961a                	add	a2,a2,t1
     410:	96b2                	add	a3,a3,a2
     412:	0066f363          	bleu	t1,a3,418 <__min_heap_size+0x218>
     416:	941e                	add	s0,s0,t2
     418:	0106d613          	srli	a2,a3,0x10
     41c:	9432                	add	s0,s0,a2
     41e:	0287e063          	bltu	a5,s0,43e <__min_heap_size+0x23e>
     422:	d88791e3          	bne	a5,s0,1a4 <__udivdi3+0xc0>
     426:	67c1                	lui	a5,0x10
     428:	17fd                	addi	a5,a5,-1
     42a:	8efd                	and	a3,a3,a5
     42c:	06c2                	slli	a3,a3,0x10
     42e:	00f2f2b3          	and	t0,t0,a5
     432:	00b51533          	sll	a0,a0,a1
     436:	9696                	add	a3,a3,t0
     438:	4581                	li	a1,0
     43a:	e2d571e3          	bleu	a3,a0,25c <__min_heap_size+0x5c>
     43e:	177d                	addi	a4,a4,-1
     440:	b395                	j	1a4 <__udivdi3+0xc0>
     442:	4581                	li	a1,0
     444:	4701                	li	a4,0
     446:	bd19                	j	25c <__min_heap_size+0x5c>

00000448 <__divdf3>:
     448:	fdc10113          	addi	sp,sp,-36
     44c:	872a                	mv	a4,a0
     44e:	832a                	mv	t1,a0
     450:	01f5d793          	srli	a5,a1,0x1f
     454:	0145d513          	srli	a0,a1,0x14
     458:	cc26                	sw	s1,24(sp)
     45a:	d006                	sw	ra,32(sp)
     45c:	00c59493          	slli	s1,a1,0xc
     460:	ce22                	sw	s0,28(sp)
     462:	7ff57513          	andi	a0,a0,2047
     466:	c43e                	sw	a5,8(sp)
     468:	80b1                	srli	s1,s1,0xc
     46a:	c551                	beqz	a0,4f6 <__divdf3+0xae>
     46c:	7ff00593          	li	a1,2047
     470:	0eb50363          	beq	a0,a1,556 <__divdf3+0x10e>
     474:	00349793          	slli	a5,s1,0x3
     478:	01d75413          	srli	s0,a4,0x1d
     47c:	8c5d                	or	s0,s0,a5
     47e:	008007b7          	lui	a5,0x800
     482:	8c5d                	or	s0,s0,a5
     484:	00371313          	slli	t1,a4,0x3
     488:	c0150493          	addi	s1,a0,-1023
     48c:	4381                	li	t2,0
     48e:	0146d513          	srli	a0,a3,0x14
     492:	01f6d713          	srli	a4,a3,0x1f
     496:	00c69293          	slli	t0,a3,0xc
     49a:	7ff57513          	andi	a0,a0,2047
     49e:	c63a                	sw	a4,12(sp)
     4a0:	87b2                	mv	a5,a2
     4a2:	00c2d293          	srli	t0,t0,0xc
     4a6:	c969                	beqz	a0,578 <__divdf3+0x130>
     4a8:	7ff00713          	li	a4,2047
     4ac:	12e50e63          	beq	a0,a4,5e8 <__divdf3+0x1a0>
     4b0:	01d65713          	srli	a4,a2,0x1d
     4b4:	028e                	slli	t0,t0,0x3
     4b6:	005762b3          	or	t0,a4,t0
     4ba:	00800737          	lui	a4,0x800
     4be:	00e2e733          	or	a4,t0,a4
     4c2:	00361793          	slli	a5,a2,0x3
     4c6:	c0150513          	addi	a0,a0,-1023
     4ca:	4681                	li	a3,0
     4cc:	45b2                	lw	a1,12(sp)
     4ce:	4622                	lw	a2,8(sp)
     4d0:	8e2d                	xor	a2,a2,a1
     4d2:	c032                	sw	a2,0(sp)
     4d4:	40a48633          	sub	a2,s1,a0
     4d8:	c232                	sw	a2,4(sp)
     4da:	00239613          	slli	a2,t2,0x2
     4de:	8e55                	or	a2,a2,a3
     4e0:	167d                	addi	a2,a2,-1
     4e2:	45b9                	li	a1,14
     4e4:	12c5e363          	bltu	a1,a2,60a <__divdf3+0x1c2>
     4e8:	6599                	lui	a1,0x6
     4ea:	060a                	slli	a2,a2,0x2
     4ec:	73058593          	addi	a1,a1,1840 # 6730 <__etext>
     4f0:	962e                	add	a2,a2,a1
     4f2:	4210                	lw	a2,0(a2)
     4f4:	8602                	jr	a2
     4f6:	00e4e433          	or	s0,s1,a4
     4fa:	c435                	beqz	s0,566 <__divdf3+0x11e>
     4fc:	c636                	sw	a3,12(sp)
     4fe:	c232                	sw	a2,4(sp)
     500:	cc85                	beqz	s1,538 <__divdf3+0xf0>
     502:	8526                	mv	a0,s1
     504:	c03a                	sw	a4,0(sp)
     506:	2f3d                	jal	c44 <__clzsi2>
     508:	4702                	lw	a4,0(sp)
     50a:	4612                	lw	a2,4(sp)
     50c:	46b2                	lw	a3,12(sp)
     50e:	ff550593          	addi	a1,a0,-11
     512:	4371                	li	t1,28
     514:	02b34b63          	blt	t1,a1,54a <__divdf3+0x102>
     518:	4475                	li	s0,29
     51a:	ff850313          	addi	t1,a0,-8
     51e:	8c0d                	sub	s0,s0,a1
     520:	006497b3          	sll	a5,s1,t1
     524:	00875433          	srl	s0,a4,s0
     528:	8c5d                	or	s0,s0,a5
     52a:	00671333          	sll	t1,a4,t1
     52e:	c0d00593          	li	a1,-1011
     532:	40a584b3          	sub	s1,a1,a0
     536:	bf99                	j	48c <__divdf3+0x44>
     538:	853a                	mv	a0,a4
     53a:	c03a                	sw	a4,0(sp)
     53c:	2721                	jal	c44 <__clzsi2>
     53e:	02050513          	addi	a0,a0,32
     542:	46b2                	lw	a3,12(sp)
     544:	4612                	lw	a2,4(sp)
     546:	4702                	lw	a4,0(sp)
     548:	b7d9                	j	50e <__divdf3+0xc6>
     54a:	fd850413          	addi	s0,a0,-40
     54e:	00871433          	sll	s0,a4,s0
     552:	4301                	li	t1,0
     554:	bfe9                	j	52e <__divdf3+0xe6>
     556:	00e4e433          	or	s0,s1,a4
     55a:	c811                	beqz	s0,56e <__divdf3+0x126>
     55c:	8426                	mv	s0,s1
     55e:	438d                	li	t2,3
     560:	7ff00493          	li	s1,2047
     564:	b72d                	j	48e <__divdf3+0x46>
     566:	4301                	li	t1,0
     568:	4481                	li	s1,0
     56a:	4385                	li	t2,1
     56c:	b70d                	j	48e <__divdf3+0x46>
     56e:	4301                	li	t1,0
     570:	7ff00493          	li	s1,2047
     574:	4389                	li	t2,2
     576:	bf21                	j	48e <__divdf3+0x46>
     578:	00c2e733          	or	a4,t0,a2
     57c:	cf35                	beqz	a4,5f8 <__divdf3+0x1b0>
     57e:	04028263          	beqz	t0,5c2 <__divdf3+0x17a>
     582:	8516                	mv	a0,t0
     584:	ca32                	sw	a2,20(sp)
     586:	c81e                	sw	t2,16(sp)
     588:	c21a                	sw	t1,4(sp)
     58a:	c016                	sw	t0,0(sp)
     58c:	2d65                	jal	c44 <__clzsi2>
     58e:	4282                	lw	t0,0(sp)
     590:	4312                	lw	t1,4(sp)
     592:	43c2                	lw	t2,16(sp)
     594:	4652                	lw	a2,20(sp)
     596:	ff550693          	addi	a3,a0,-11
     59a:	47f1                	li	a5,28
     59c:	04d7c063          	blt	a5,a3,5dc <__divdf3+0x194>
     5a0:	4775                	li	a4,29
     5a2:	ff850793          	addi	a5,a0,-8
     5a6:	8f15                	sub	a4,a4,a3
     5a8:	00f292b3          	sll	t0,t0,a5
     5ac:	00e65733          	srl	a4,a2,a4
     5b0:	00576733          	or	a4,a4,t0
     5b4:	00f617b3          	sll	a5,a2,a5
     5b8:	c0d00693          	li	a3,-1011
     5bc:	40a68533          	sub	a0,a3,a0
     5c0:	b729                	j	4ca <__divdf3+0x82>
     5c2:	8532                	mv	a0,a2
     5c4:	ca16                	sw	t0,20(sp)
     5c6:	c81e                	sw	t2,16(sp)
     5c8:	c21a                	sw	t1,4(sp)
     5ca:	c032                	sw	a2,0(sp)
     5cc:	2da5                	jal	c44 <__clzsi2>
     5ce:	02050513          	addi	a0,a0,32
     5d2:	42d2                	lw	t0,20(sp)
     5d4:	43c2                	lw	t2,16(sp)
     5d6:	4312                	lw	t1,4(sp)
     5d8:	4602                	lw	a2,0(sp)
     5da:	bf75                	j	596 <__divdf3+0x14e>
     5dc:	fd850293          	addi	t0,a0,-40
     5e0:	00561733          	sll	a4,a2,t0
     5e4:	4781                	li	a5,0
     5e6:	bfc9                	j	5b8 <__divdf3+0x170>
     5e8:	00c2e733          	or	a4,t0,a2
     5ec:	cb11                	beqz	a4,600 <__divdf3+0x1b8>
     5ee:	8716                	mv	a4,t0
     5f0:	7ff00513          	li	a0,2047
     5f4:	468d                	li	a3,3
     5f6:	bdd9                	j	4cc <__divdf3+0x84>
     5f8:	4781                	li	a5,0
     5fa:	4501                	li	a0,0
     5fc:	4685                	li	a3,1
     5fe:	b5f9                	j	4cc <__divdf3+0x84>
     600:	4781                	li	a5,0
     602:	7ff00513          	li	a0,2047
     606:	4689                	li	a3,2
     608:	b5d1                	j	4cc <__divdf3+0x84>
     60a:	00876663          	bltu	a4,s0,616 <__divdf3+0x1ce>
     60e:	2ce41563          	bne	s0,a4,8d8 <__divdf3+0x490>
     612:	2cf36363          	bltu	t1,a5,8d8 <__divdf3+0x490>
     616:	01f41593          	slli	a1,s0,0x1f
     61a:	00135693          	srli	a3,t1,0x1
     61e:	01f31613          	slli	a2,t1,0x1f
     622:	8005                	srli	s0,s0,0x1
     624:	00d5e333          	or	t1,a1,a3
     628:	00871293          	slli	t0,a4,0x8
     62c:	0187d713          	srli	a4,a5,0x18
     630:	005762b3          	or	t0,a4,t0
     634:	0102d493          	srli	s1,t0,0x10
     638:	02945733          	divu	a4,s0,s1
     63c:	00879693          	slli	a3,a5,0x8
     640:	01029793          	slli	a5,t0,0x10
     644:	83c1                	srli	a5,a5,0x10
     646:	c43e                	sw	a5,8(sp)
     648:	01035593          	srli	a1,t1,0x10
     64c:	02947433          	remu	s0,s0,s1
     650:	02e787b3          	mul	a5,a5,a4
     654:	0442                	slli	s0,s0,0x10
     656:	8c4d                	or	s0,s0,a1
     658:	85ba                	mv	a1,a4
     65a:	00f47c63          	bleu	a5,s0,672 <__divdf3+0x22a>
     65e:	9416                	add	s0,s0,t0
     660:	fff70593          	addi	a1,a4,-1 # 7fffff <__erodata+0x7f91c7>
     664:	00546763          	bltu	s0,t0,672 <__divdf3+0x22a>
     668:	00f47563          	bleu	a5,s0,672 <__divdf3+0x22a>
     66c:	ffe70593          	addi	a1,a4,-2
     670:	9416                	add	s0,s0,t0
     672:	40f407b3          	sub	a5,s0,a5
     676:	0297d533          	divu	a0,a5,s1
     67a:	01029713          	slli	a4,t0,0x10
     67e:	8341                	srli	a4,a4,0x10
     680:	0342                	slli	t1,t1,0x10
     682:	01035313          	srli	t1,t1,0x10
     686:	0297f7b3          	remu	a5,a5,s1
     68a:	83aa                	mv	t2,a0
     68c:	02a70733          	mul	a4,a4,a0
     690:	07c2                	slli	a5,a5,0x10
     692:	00f36333          	or	t1,t1,a5
     696:	00e37c63          	bleu	a4,t1,6ae <__divdf3+0x266>
     69a:	9316                	add	t1,t1,t0
     69c:	fff50393          	addi	t2,a0,-1
     6a0:	00536763          	bltu	t1,t0,6ae <__divdf3+0x266>
     6a4:	00e37563          	bleu	a4,t1,6ae <__divdf3+0x266>
     6a8:	ffe50393          	addi	t2,a0,-2
     6ac:	9316                	add	t1,t1,t0
     6ae:	05c2                	slli	a1,a1,0x10
     6b0:	6441                	lui	s0,0x10
     6b2:	0075e5b3          	or	a1,a1,t2
     6b6:	fff40793          	addi	a5,s0,-1 # ffff <__erodata+0x91c7>
     6ba:	00f5f533          	and	a0,a1,a5
     6be:	40e30333          	sub	t1,t1,a4
     6c2:	8ff5                	and	a5,a5,a3
     6c4:	0105d713          	srli	a4,a1,0x10
     6c8:	02f503b3          	mul	t2,a0,a5
     6cc:	c43e                	sw	a5,8(sp)
     6ce:	02f707b3          	mul	a5,a4,a5
     6d2:	c63e                	sw	a5,12(sp)
     6d4:	0106d793          	srli	a5,a3,0x10
     6d8:	02a78533          	mul	a0,a5,a0
     6dc:	02f70733          	mul	a4,a4,a5
     6e0:	47b2                	lw	a5,12(sp)
     6e2:	953e                	add	a0,a0,a5
     6e4:	0103d793          	srli	a5,t2,0x10
     6e8:	97aa                	add	a5,a5,a0
     6ea:	4532                	lw	a0,12(sp)
     6ec:	00a7f363          	bleu	a0,a5,6f2 <__divdf3+0x2aa>
     6f0:	9722                	add	a4,a4,s0
     6f2:	0107d413          	srli	s0,a5,0x10
     6f6:	943a                	add	s0,s0,a4
     6f8:	6741                	lui	a4,0x10
     6fa:	177d                	addi	a4,a4,-1
     6fc:	8ff9                	and	a5,a5,a4
     6fe:	07c2                	slli	a5,a5,0x10
     700:	00e3f3b3          	and	t2,t2,a4
     704:	93be                	add	t2,t2,a5
     706:	00836763          	bltu	t1,s0,714 <__divdf3+0x2cc>
     70a:	872e                	mv	a4,a1
     70c:	02831e63          	bne	t1,s0,748 <__divdf3+0x300>
     710:	02767c63          	bleu	t2,a2,748 <__divdf3+0x300>
     714:	9636                	add	a2,a2,a3
     716:	00d637b3          	sltu	a5,a2,a3
     71a:	9796                	add	a5,a5,t0
     71c:	933e                	add	t1,t1,a5
     71e:	fff58713          	addi	a4,a1,-1
     722:	0062e663          	bltu	t0,t1,72e <__divdf3+0x2e6>
     726:	02629163          	bne	t0,t1,748 <__divdf3+0x300>
     72a:	00d66f63          	bltu	a2,a3,748 <__divdf3+0x300>
     72e:	00836663          	bltu	t1,s0,73a <__divdf3+0x2f2>
     732:	00641b63          	bne	s0,t1,748 <__divdf3+0x300>
     736:	00767963          	bleu	t2,a2,748 <__divdf3+0x300>
     73a:	9636                	add	a2,a2,a3
     73c:	00d637b3          	sltu	a5,a2,a3
     740:	9796                	add	a5,a5,t0
     742:	ffe58713          	addi	a4,a1,-2
     746:	933e                	add	t1,t1,a5
     748:	407603b3          	sub	t2,a2,t2
     74c:	40830333          	sub	t1,t1,s0
     750:	00763633          	sltu	a2,a2,t2
     754:	40c30633          	sub	a2,t1,a2
     758:	57fd                	li	a5,-1
     75a:	10c28263          	beq	t0,a2,85e <__divdf3+0x416>
     75e:	02965533          	divu	a0,a2,s1
     762:	01029793          	slli	a5,t0,0x10
     766:	83c1                	srli	a5,a5,0x10
     768:	0103d593          	srli	a1,t2,0x10
     76c:	02967633          	remu	a2,a2,s1
     770:	02a787b3          	mul	a5,a5,a0
     774:	0642                	slli	a2,a2,0x10
     776:	8e4d                	or	a2,a2,a1
     778:	85aa                	mv	a1,a0
     77a:	00f67c63          	bleu	a5,a2,792 <__divdf3+0x34a>
     77e:	9616                	add	a2,a2,t0
     780:	fff50593          	addi	a1,a0,-1
     784:	00566763          	bltu	a2,t0,792 <__divdf3+0x34a>
     788:	00f67563          	bleu	a5,a2,792 <__divdf3+0x34a>
     78c:	ffe50593          	addi	a1,a0,-2
     790:	9616                	add	a2,a2,t0
     792:	8e1d                	sub	a2,a2,a5
     794:	02965333          	divu	t1,a2,s1
     798:	01029793          	slli	a5,t0,0x10
     79c:	83c1                	srli	a5,a5,0x10
     79e:	03c2                	slli	t2,t2,0x10
     7a0:	0103d393          	srli	t2,t2,0x10
     7a4:	02967633          	remu	a2,a2,s1
     7a8:	841a                	mv	s0,t1
     7aa:	02678533          	mul	a0,a5,t1
     7ae:	01061793          	slli	a5,a2,0x10
     7b2:	00f3e633          	or	a2,t2,a5
     7b6:	00a67c63          	bleu	a0,a2,7ce <__divdf3+0x386>
     7ba:	9616                	add	a2,a2,t0
     7bc:	fff30413          	addi	s0,t1,-1
     7c0:	00566763          	bltu	a2,t0,7ce <__divdf3+0x386>
     7c4:	00a67563          	bleu	a0,a2,7ce <__divdf3+0x386>
     7c8:	ffe30413          	addi	s0,t1,-2
     7cc:	9616                	add	a2,a2,t0
     7ce:	01059793          	slli	a5,a1,0x10
     7d2:	8fc1                	or	a5,a5,s0
     7d4:	4422                	lw	s0,8(sp)
     7d6:	8e09                	sub	a2,a2,a0
     7d8:	4522                	lw	a0,8(sp)
     7da:	0107d393          	srli	t2,a5,0x10
     7de:	01079593          	slli	a1,a5,0x10
     7e2:	02838333          	mul	t1,t2,s0
     7e6:	81c1                	srli	a1,a1,0x10
     7e8:	0106d413          	srli	s0,a3,0x10
     7ec:	02a58533          	mul	a0,a1,a0
     7f0:	02b405b3          	mul	a1,s0,a1
     7f4:	027403b3          	mul	t2,s0,t2
     7f8:	959a                	add	a1,a1,t1
     7fa:	01055413          	srli	s0,a0,0x10
     7fe:	95a2                	add	a1,a1,s0
     800:	0065f463          	bleu	t1,a1,808 <__divdf3+0x3c0>
     804:	6341                	lui	t1,0x10
     806:	939a                	add	t2,t2,t1
     808:	0105d313          	srli	t1,a1,0x10
     80c:	939a                	add	t2,t2,t1
     80e:	6341                	lui	t1,0x10
     810:	137d                	addi	t1,t1,-1
     812:	0065f5b3          	and	a1,a1,t1
     816:	05c2                	slli	a1,a1,0x10
     818:	00657533          	and	a0,a0,t1
     81c:	952e                	add	a0,a0,a1
     81e:	00766563          	bltu	a2,t2,828 <__divdf3+0x3e0>
     822:	1a761263          	bne	a2,t2,9c6 <__divdf3+0x57e>
     826:	cd05                	beqz	a0,85e <__divdf3+0x416>
     828:	9616                	add	a2,a2,t0
     82a:	fff78593          	addi	a1,a5,-1 # 7fffff <__erodata+0x7f91c7>
     82e:	02566163          	bltu	a2,t0,850 <__divdf3+0x408>
     832:	00766663          	bltu	a2,t2,83e <__divdf3+0x3f6>
     836:	18761763          	bne	a2,t2,9c4 <__divdf3+0x57c>
     83a:	00a6fd63          	bleu	a0,a3,854 <__divdf3+0x40c>
     83e:	ffe78593          	addi	a1,a5,-2
     842:	00169793          	slli	a5,a3,0x1
     846:	00d7b6b3          	sltu	a3,a5,a3
     84a:	92b6                	add	t0,t0,a3
     84c:	9616                	add	a2,a2,t0
     84e:	86be                	mv	a3,a5
     850:	00761563          	bne	a2,t2,85a <__divdf3+0x412>
     854:	87ae                	mv	a5,a1
     856:	00d50463          	beq	a0,a3,85e <__divdf3+0x416>
     85a:	0015e793          	ori	a5,a1,1
     85e:	4692                	lw	a3,4(sp)
     860:	3ff68613          	addi	a2,a3,1023
     864:	0ac05963          	blez	a2,916 <__divdf3+0x4ce>
     868:	0077f693          	andi	a3,a5,7
     86c:	ce81                	beqz	a3,884 <__divdf3+0x43c>
     86e:	00f7f693          	andi	a3,a5,15
     872:	4591                	li	a1,4
     874:	00b68863          	beq	a3,a1,884 <__divdf3+0x43c>
     878:	00478693          	addi	a3,a5,4
     87c:	00f6b7b3          	sltu	a5,a3,a5
     880:	973e                	add	a4,a4,a5
     882:	87b6                	mv	a5,a3
     884:	00771693          	slli	a3,a4,0x7
     888:	0006d963          	bgez	a3,89a <__divdf3+0x452>
     88c:	ff0006b7          	lui	a3,0xff000
     890:	16fd                	addi	a3,a3,-1
     892:	8f75                	and	a4,a4,a3
     894:	4692                	lw	a3,4(sp)
     896:	40068613          	addi	a2,a3,1024 # ff000400 <__heap_end+0xdef80400>
     89a:	7fe00693          	li	a3,2046
     89e:	10c6ca63          	blt	a3,a2,9b2 <__divdf3+0x56a>
     8a2:	838d                	srli	a5,a5,0x3
     8a4:	01d71693          	slli	a3,a4,0x1d
     8a8:	8fd5                	or	a5,a5,a3
     8aa:	00375293          	srli	t0,a4,0x3
     8ae:	4702                	lw	a4,0(sp)
     8b0:	7ff67693          	andi	a3,a2,2047
     8b4:	02b2                	slli	t0,t0,0xc
     8b6:	5082                	lw	ra,32(sp)
     8b8:	4472                	lw	s0,28(sp)
     8ba:	06d2                	slli	a3,a3,0x14
     8bc:	00c2d293          	srli	t0,t0,0xc
     8c0:	01f71613          	slli	a2,a4,0x1f
     8c4:	00d2e2b3          	or	t0,t0,a3
     8c8:	00c2e733          	or	a4,t0,a2
     8cc:	44e2                	lw	s1,24(sp)
     8ce:	853e                	mv	a0,a5
     8d0:	85ba                	mv	a1,a4
     8d2:	02410113          	addi	sp,sp,36
     8d6:	8082                	ret
     8d8:	4692                	lw	a3,4(sp)
     8da:	4601                	li	a2,0
     8dc:	16fd                	addi	a3,a3,-1
     8de:	c236                	sw	a3,4(sp)
     8e0:	b3a1                	j	628 <__divdf3+0x1e0>
     8e2:	47a2                	lw	a5,8(sp)
     8e4:	8722                	mv	a4,s0
     8e6:	869e                	mv	a3,t2
     8e8:	c03e                	sw	a5,0(sp)
     8ea:	879a                	mv	a5,t1
     8ec:	4609                	li	a2,2
     8ee:	0cc68263          	beq	a3,a2,9b2 <__divdf3+0x56a>
     8f2:	460d                	li	a2,3
     8f4:	0ac68863          	beq	a3,a2,9a4 <__divdf3+0x55c>
     8f8:	4605                	li	a2,1
     8fa:	f6c692e3          	bne	a3,a2,85e <__divdf3+0x416>
     8fe:	4281                	li	t0,0
     900:	4781                	li	a5,0
     902:	a89d                	j	978 <__divdf3+0x530>
     904:	4632                	lw	a2,12(sp)
     906:	c032                	sw	a2,0(sp)
     908:	b7d5                	j	8ec <__divdf3+0x4a4>
     90a:	00080737          	lui	a4,0x80
     90e:	4781                	li	a5,0
     910:	c002                	sw	zero,0(sp)
     912:	468d                	li	a3,3
     914:	bfe1                	j	8ec <__divdf3+0x4a4>
     916:	4285                	li	t0,1
     918:	40c282b3          	sub	t0,t0,a2
     91c:	03800693          	li	a3,56
     920:	fc56cfe3          	blt	a3,t0,8fe <__divdf3+0x4b6>
     924:	46fd                	li	a3,31
     926:	0456cb63          	blt	a3,t0,97c <__divdf3+0x534>
     92a:	4692                	lw	a3,4(sp)
     92c:	0057d633          	srl	a2,a5,t0
     930:	005752b3          	srl	t0,a4,t0
     934:	41e68593          	addi	a1,a3,1054
     938:	00b716b3          	sll	a3,a4,a1
     93c:	00b797b3          	sll	a5,a5,a1
     940:	8ed1                	or	a3,a3,a2
     942:	00f037b3          	snez	a5,a5
     946:	8fd5                	or	a5,a5,a3
     948:	0077f713          	andi	a4,a5,7
     94c:	cf01                	beqz	a4,964 <__divdf3+0x51c>
     94e:	00f7f713          	andi	a4,a5,15
     952:	4691                	li	a3,4
     954:	00d70863          	beq	a4,a3,964 <__divdf3+0x51c>
     958:	00478713          	addi	a4,a5,4
     95c:	00f737b3          	sltu	a5,a4,a5
     960:	92be                	add	t0,t0,a5
     962:	87ba                	mv	a5,a4
     964:	00829713          	slli	a4,t0,0x8
     968:	04074a63          	bltz	a4,9bc <__divdf3+0x574>
     96c:	01d29713          	slli	a4,t0,0x1d
     970:	838d                	srli	a5,a5,0x3
     972:	8fd9                	or	a5,a5,a4
     974:	0032d293          	srli	t0,t0,0x3
     978:	4601                	li	a2,0
     97a:	bf15                	j	8ae <__divdf3+0x466>
     97c:	5685                	li	a3,-31
     97e:	8e91                	sub	a3,a3,a2
     980:	02000613          	li	a2,32
     984:	00d756b3          	srl	a3,a4,a3
     988:	4581                	li	a1,0
     98a:	00c28763          	beq	t0,a2,998 <__divdf3+0x550>
     98e:	4612                	lw	a2,4(sp)
     990:	43e60593          	addi	a1,a2,1086
     994:	00b715b3          	sll	a1,a4,a1
     998:	8fcd                	or	a5,a5,a1
     99a:	00f037b3          	snez	a5,a5
     99e:	8fd5                	or	a5,a5,a3
     9a0:	4281                	li	t0,0
     9a2:	b75d                	j	948 <__divdf3+0x500>
     9a4:	000802b7          	lui	t0,0x80
     9a8:	4781                	li	a5,0
     9aa:	7ff00613          	li	a2,2047
     9ae:	c002                	sw	zero,0(sp)
     9b0:	bdfd                	j	8ae <__divdf3+0x466>
     9b2:	4281                	li	t0,0
     9b4:	4781                	li	a5,0
     9b6:	7ff00613          	li	a2,2047
     9ba:	bdd5                	j	8ae <__divdf3+0x466>
     9bc:	4281                	li	t0,0
     9be:	4781                	li	a5,0
     9c0:	4605                	li	a2,1
     9c2:	b5f5                	j	8ae <__divdf3+0x466>
     9c4:	87ae                	mv	a5,a1
     9c6:	85be                	mv	a1,a5
     9c8:	bd49                	j	85a <__divdf3+0x412>

000009ca <__gedf2>:
     9ca:	001007b7          	lui	a5,0x100
     9ce:	17fd                	addi	a5,a5,-1
     9d0:	1151                	addi	sp,sp,-12
     9d2:	00b7f2b3          	and	t0,a5,a1
     9d6:	0145d313          	srli	t1,a1,0x14
     9da:	0146d713          	srli	a4,a3,0x14
     9de:	8ff5                	and	a5,a5,a3
     9e0:	82fd                	srli	a3,a3,0x1f
     9e2:	c422                	sw	s0,8(sp)
     9e4:	c226                	sw	s1,4(sp)
     9e6:	c036                	sw	a3,0(sp)
     9e8:	7ff37313          	andi	t1,t1,2047
     9ec:	7ff00693          	li	a3,2047
     9f0:	83aa                	mv	t2,a0
     9f2:	842a                	mv	s0,a0
     9f4:	81fd                	srli	a1,a1,0x1f
     9f6:	84b2                	mv	s1,a2
     9f8:	7ff77713          	andi	a4,a4,2047
     9fc:	00d31a63          	bne	t1,a3,a10 <__gedf2+0x46>
     a00:	00a2e6b3          	or	a3,t0,a0
     a04:	5579                	li	a0,-2
     a06:	c6bd                	beqz	a3,a74 <__gedf2+0xaa>
     a08:	4422                	lw	s0,8(sp)
     a0a:	4492                	lw	s1,4(sp)
     a0c:	0131                	addi	sp,sp,12
     a0e:	8082                	ret
     a10:	00d71663          	bne	a4,a3,a1c <__gedf2+0x52>
     a14:	00c7e6b3          	or	a3,a5,a2
     a18:	5579                	li	a0,-2
     a1a:	f6fd                	bnez	a3,a08 <__gedf2+0x3e>
     a1c:	04031e63          	bnez	t1,a78 <__gedf2+0xae>
     a20:	0072e533          	or	a0,t0,t2
     a24:	00153513          	seqz	a0,a0
     a28:	e319                	bnez	a4,a2e <__gedf2+0x64>
     a2a:	8e5d                	or	a2,a2,a5
     a2c:	ce15                	beqz	a2,a68 <__gedf2+0x9e>
     a2e:	e519                	bnez	a0,a3c <__gedf2+0x72>
     a30:	4682                	lw	a3,0(sp)
     a32:	00d58963          	beq	a1,a3,a44 <__gedf2+0x7a>
     a36:	4505                	li	a0,1
     a38:	d9e1                	beqz	a1,a08 <__gedf2+0x3e>
     a3a:	a019                	j	a40 <__gedf2+0x76>
     a3c:	4782                	lw	a5,0(sp)
     a3e:	f7e9                	bnez	a5,a08 <__gedf2+0x3e>
     a40:	557d                	li	a0,-1
     a42:	b7d9                	j	a08 <__gedf2+0x3e>
     a44:	fe6749e3          	blt	a4,t1,a36 <__gedf2+0x6c>
     a48:	00e35663          	ble	a4,t1,a54 <__gedf2+0x8a>
     a4c:	557d                	li	a0,-1
     a4e:	ddcd                	beqz	a1,a08 <__gedf2+0x3e>
     a50:	4505                	li	a0,1
     a52:	bf5d                	j	a08 <__gedf2+0x3e>
     a54:	fe57e1e3          	bltu	a5,t0,a36 <__gedf2+0x6c>
     a58:	00f29b63          	bne	t0,a5,a6e <__gedf2+0xa4>
     a5c:	fc84ede3          	bltu	s1,s0,a36 <__gedf2+0x6c>
     a60:	4501                	li	a0,0
     a62:	fa9473e3          	bleu	s1,s0,a08 <__gedf2+0x3e>
     a66:	b7dd                	j	a4c <__gedf2+0x82>
     a68:	d579                	beqz	a0,a36 <__gedf2+0x6c>
     a6a:	4501                	li	a0,0
     a6c:	bf71                	j	a08 <__gedf2+0x3e>
     a6e:	fcf2efe3          	bltu	t0,a5,a4c <__gedf2+0x82>
     a72:	bfe5                	j	a6a <__gedf2+0xa0>
     a74:	fa6700e3          	beq	a4,t1,a14 <__gedf2+0x4a>
     a78:	ff45                	bnez	a4,a30 <__gedf2+0x66>
     a7a:	4501                	li	a0,0
     a7c:	b77d                	j	a2a <__gedf2+0x60>

00000a7e <__ledf2>:
     a7e:	001007b7          	lui	a5,0x100
     a82:	17fd                	addi	a5,a5,-1
     a84:	1151                	addi	sp,sp,-12
     a86:	00b7f2b3          	and	t0,a5,a1
     a8a:	0145d313          	srli	t1,a1,0x14
     a8e:	0146d713          	srli	a4,a3,0x14
     a92:	8ff5                	and	a5,a5,a3
     a94:	82fd                	srli	a3,a3,0x1f
     a96:	c422                	sw	s0,8(sp)
     a98:	c226                	sw	s1,4(sp)
     a9a:	c036                	sw	a3,0(sp)
     a9c:	7ff37313          	andi	t1,t1,2047
     aa0:	7ff00693          	li	a3,2047
     aa4:	83aa                	mv	t2,a0
     aa6:	842a                	mv	s0,a0
     aa8:	81fd                	srli	a1,a1,0x1f
     aaa:	84b2                	mv	s1,a2
     aac:	7ff77713          	andi	a4,a4,2047
     ab0:	00d31a63          	bne	t1,a3,ac4 <__ledf2+0x46>
     ab4:	00a2e6b3          	or	a3,t0,a0
     ab8:	4509                	li	a0,2
     aba:	c6bd                	beqz	a3,b28 <__ledf2+0xaa>
     abc:	4422                	lw	s0,8(sp)
     abe:	4492                	lw	s1,4(sp)
     ac0:	0131                	addi	sp,sp,12
     ac2:	8082                	ret
     ac4:	00d71663          	bne	a4,a3,ad0 <__ledf2+0x52>
     ac8:	00c7e6b3          	or	a3,a5,a2
     acc:	4509                	li	a0,2
     ace:	f6fd                	bnez	a3,abc <__ledf2+0x3e>
     ad0:	04031e63          	bnez	t1,b2c <__ledf2+0xae>
     ad4:	0072e533          	or	a0,t0,t2
     ad8:	00153513          	seqz	a0,a0
     adc:	e319                	bnez	a4,ae2 <__ledf2+0x64>
     ade:	8e5d                	or	a2,a2,a5
     ae0:	ce15                	beqz	a2,b1c <__ledf2+0x9e>
     ae2:	e519                	bnez	a0,af0 <__ledf2+0x72>
     ae4:	4682                	lw	a3,0(sp)
     ae6:	00d58963          	beq	a1,a3,af8 <__ledf2+0x7a>
     aea:	4505                	li	a0,1
     aec:	d9e1                	beqz	a1,abc <__ledf2+0x3e>
     aee:	a019                	j	af4 <__ledf2+0x76>
     af0:	4782                	lw	a5,0(sp)
     af2:	f7e9                	bnez	a5,abc <__ledf2+0x3e>
     af4:	557d                	li	a0,-1
     af6:	b7d9                	j	abc <__ledf2+0x3e>
     af8:	fe6749e3          	blt	a4,t1,aea <__ledf2+0x6c>
     afc:	00e35663          	ble	a4,t1,b08 <__ledf2+0x8a>
     b00:	557d                	li	a0,-1
     b02:	ddcd                	beqz	a1,abc <__ledf2+0x3e>
     b04:	4505                	li	a0,1
     b06:	bf5d                	j	abc <__ledf2+0x3e>
     b08:	fe57e1e3          	bltu	a5,t0,aea <__ledf2+0x6c>
     b0c:	00f29b63          	bne	t0,a5,b22 <__ledf2+0xa4>
     b10:	fc84ede3          	bltu	s1,s0,aea <__ledf2+0x6c>
     b14:	4501                	li	a0,0
     b16:	fa9473e3          	bleu	s1,s0,abc <__ledf2+0x3e>
     b1a:	b7dd                	j	b00 <__ledf2+0x82>
     b1c:	d579                	beqz	a0,aea <__ledf2+0x6c>
     b1e:	4501                	li	a0,0
     b20:	bf71                	j	abc <__ledf2+0x3e>
     b22:	fcf2efe3          	bltu	t0,a5,b00 <__ledf2+0x82>
     b26:	bfe5                	j	b1e <__ledf2+0xa0>
     b28:	fa6700e3          	beq	a4,t1,ac8 <__ledf2+0x4a>
     b2c:	ff45                	bnez	a4,ae4 <__ledf2+0x66>
     b2e:	4501                	li	a0,0
     b30:	b77d                	j	ade <__ledf2+0x60>

00000b32 <__fixdfsi>:
     b32:	0145d713          	srli	a4,a1,0x14
     b36:	001006b7          	lui	a3,0x100
     b3a:	fff68793          	addi	a5,a3,-1 # fffff <__erodata+0xf91c7>
     b3e:	7ff77713          	andi	a4,a4,2047
     b42:	3fe00613          	li	a2,1022
     b46:	8fed                	and	a5,a5,a1
     b48:	81fd                	srli	a1,a1,0x1f
     b4a:	04e65463          	ble	a4,a2,b92 <__fixdfsi+0x60>
     b4e:	41d00613          	li	a2,1053
     b52:	00e65863          	ble	a4,a2,b62 <__fixdfsi+0x30>
     b56:	80000537          	lui	a0,0x80000
     b5a:	fff54513          	not	a0,a0
     b5e:	952e                	add	a0,a0,a1
     b60:	8082                	ret
     b62:	8fd5                	or	a5,a5,a3
     b64:	43300693          	li	a3,1075
     b68:	8e99                	sub	a3,a3,a4
     b6a:	467d                	li	a2,31
     b6c:	00d64d63          	blt	a2,a3,b86 <__fixdfsi+0x54>
     b70:	bed70713          	addi	a4,a4,-1043 # 7fbed <__erodata+0x78db5>
     b74:	00e797b3          	sll	a5,a5,a4
     b78:	00d55533          	srl	a0,a0,a3
     b7c:	8d5d                	or	a0,a0,a5
     b7e:	c999                	beqz	a1,b94 <__fixdfsi+0x62>
     b80:	40a00533          	neg	a0,a0
     b84:	8082                	ret
     b86:	41300513          	li	a0,1043
     b8a:	8d19                	sub	a0,a0,a4
     b8c:	00a7d533          	srl	a0,a5,a0
     b90:	b7fd                	j	b7e <__fixdfsi+0x4c>
     b92:	4501                	li	a0,0
     b94:	8082                	ret

00000b96 <__fixunsdfsi>:
     b96:	0145d713          	srli	a4,a1,0x14
     b9a:	001006b7          	lui	a3,0x100
     b9e:	862a                	mv	a2,a0
     ba0:	fff68793          	addi	a5,a3,-1 # fffff <__erodata+0xf91c7>
     ba4:	7ff77713          	andi	a4,a4,2047
     ba8:	3fe00513          	li	a0,1022
     bac:	8fed                	and	a5,a5,a1
     bae:	81fd                	srli	a1,a1,0x1f
     bb0:	02e55f63          	ble	a4,a0,bee <__fixunsdfsi+0x58>
     bb4:	4501                	li	a0,0
     bb6:	e591                	bnez	a1,bc2 <__fixunsdfsi+0x2c>
     bb8:	41e00593          	li	a1,1054
     bbc:	557d                	li	a0,-1
     bbe:	00e5d363          	ble	a4,a1,bc4 <__fixunsdfsi+0x2e>
     bc2:	8082                	ret
     bc4:	8fd5                	or	a5,a5,a3
     bc6:	43300693          	li	a3,1075
     bca:	8e99                	sub	a3,a3,a4
     bcc:	45fd                	li	a1,31
     bce:	00d5ca63          	blt	a1,a3,be2 <__fixunsdfsi+0x4c>
     bd2:	bed70513          	addi	a0,a4,-1043
     bd6:	00a797b3          	sll	a5,a5,a0
     bda:	00d65533          	srl	a0,a2,a3
     bde:	8d5d                	or	a0,a0,a5
     be0:	8082                	ret
     be2:	41300513          	li	a0,1043
     be6:	8d19                	sub	a0,a0,a4
     be8:	00a7d533          	srl	a0,a5,a0
     bec:	8082                	ret
     bee:	4501                	li	a0,0
     bf0:	8082                	ret

00000bf2 <__floatunsidf>:
     bf2:	1151                	addi	sp,sp,-12
     bf4:	c406                	sw	ra,8(sp)
     bf6:	c222                	sw	s0,4(sp)
     bf8:	c131                	beqz	a0,c3c <__floatunsidf+0x4a>
     bfa:	842a                	mv	s0,a0
     bfc:	20a1                	jal	c44 <__clzsi2>
     bfe:	41e00713          	li	a4,1054
     c02:	47a9                	li	a5,10
     c04:	8f09                	sub	a4,a4,a0
     c06:	02a7c663          	blt	a5,a0,c32 <__floatunsidf+0x40>
     c0a:	47ad                	li	a5,11
     c0c:	8f89                	sub	a5,a5,a0
     c0e:	0555                	addi	a0,a0,21
     c10:	00f457b3          	srl	a5,s0,a5
     c14:	00a41433          	sll	s0,s0,a0
     c18:	8522                	mv	a0,s0
     c1a:	40a2                	lw	ra,8(sp)
     c1c:	4412                	lw	s0,4(sp)
     c1e:	07b2                	slli	a5,a5,0xc
     c20:	7ff77713          	andi	a4,a4,2047
     c24:	0752                	slli	a4,a4,0x14
     c26:	83b1                	srli	a5,a5,0xc
     c28:	00e7e6b3          	or	a3,a5,a4
     c2c:	85b6                	mv	a1,a3
     c2e:	0131                	addi	sp,sp,12
     c30:	8082                	ret
     c32:	1555                	addi	a0,a0,-11
     c34:	00a417b3          	sll	a5,s0,a0
     c38:	4401                	li	s0,0
     c3a:	bff9                	j	c18 <__floatunsidf+0x26>
     c3c:	4781                	li	a5,0
     c3e:	4401                	li	s0,0
     c40:	4701                	li	a4,0
     c42:	bfd9                	j	c18 <__floatunsidf+0x26>

00000c44 <__clzsi2>:
     c44:	67c1                	lui	a5,0x10
     c46:	02f57563          	bleu	a5,a0,c70 <__clzsi2+0x2c>
     c4a:	0ff00793          	li	a5,255
     c4e:	00a7b7b3          	sltu	a5,a5,a0
     c52:	078e                	slli	a5,a5,0x3
     c54:	02000713          	li	a4,32
     c58:	8f1d                	sub	a4,a4,a5
     c5a:	00f557b3          	srl	a5,a0,a5
     c5e:	6519                	lui	a0,0x6
     c60:	76c50513          	addi	a0,a0,1900 # 676c <__clz_tab>
     c64:	97aa                	add	a5,a5,a0
     c66:	0007c503          	lbu	a0,0(a5) # 10000 <__erodata+0x91c8>
     c6a:	40a70533          	sub	a0,a4,a0
     c6e:	8082                	ret
     c70:	01000737          	lui	a4,0x1000
     c74:	47c1                	li	a5,16
     c76:	fce56fe3          	bltu	a0,a4,c54 <__clzsi2+0x10>
     c7a:	47e1                	li	a5,24
     c7c:	bfe1                	j	c54 <__clzsi2+0x10>

00000c7e <mm_size2ndx>:

int mm_size2ndx(size_t size)
{
  int ndx = 0;

  if (size >= MM_MAX_CHUNK)
     c7e:	004007b7          	lui	a5,0x400
     c82:	06f57863          	bleu	a5,a0,cf2 <mm_size2ndx+0x74>
    {
       return MM_NNODES-1;
    }

  size >>= MM_MIN_SHIFT;
     c86:	00455793          	srli	a5,a0,0x4
  while (size > 1)
     c8a:	4705                	li	a4,1
  int ndx = 0;
     c8c:	4501                	li	a0,0
  while (size > 1)
     c8e:	06f77163          	bleu	a5,a4,cf0 <mm_size2ndx+0x72>
    {
      ndx++;
     c92:	0505                	addi	a0,a0,1
      size >>= 1;
     c94:	0017d613          	srli	a2,a5,0x1
      ndx++;
     c98:	86aa                	mv	a3,a0
  while (size > 1)
     c9a:	04e60e63          	beq	a2,a4,cf6 <mm_size2ndx+0x78>
      size >>= 1;
     c9e:	0027d293          	srli	t0,a5,0x2
      ndx++;
     ca2:	0505                	addi	a0,a0,1
  while (size > 1)
     ca4:	04e28663          	beq	t0,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     ca8:	0037d313          	srli	t1,a5,0x3
      ndx++;
     cac:	00268513          	addi	a0,a3,2
  while (size > 1)
     cb0:	04e30063          	beq	t1,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     cb4:	0047d393          	srli	t2,a5,0x4
      ndx++;
     cb8:	00368513          	addi	a0,a3,3
  while (size > 1)
     cbc:	02e38a63          	beq	t2,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     cc0:	0057d593          	srli	a1,a5,0x5
      ndx++;
     cc4:	00468513          	addi	a0,a3,4
  while (size > 1)
     cc8:	02e58463          	beq	a1,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     ccc:	0067d613          	srli	a2,a5,0x6
      ndx++;
     cd0:	00568513          	addi	a0,a3,5
  while (size > 1)
     cd4:	00e60e63          	beq	a2,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     cd8:	0077d293          	srli	t0,a5,0x7
      ndx++;
     cdc:	00668513          	addi	a0,a3,6
  while (size > 1)
     ce0:	00e28863          	beq	t0,a4,cf0 <mm_size2ndx+0x72>
      size >>= 1;
     ce4:	83a1                	srli	a5,a5,0x8
      ndx++;
     ce6:	00768513          	addi	a0,a3,7
  while (size > 1)
     cea:	fae794e3          	bne	a5,a4,c92 <mm_size2ndx+0x14>
     cee:	8082                	ret
    }

  return ndx;
}
     cf0:	8082                	ret
       return MM_NNODES-1;
     cf2:	4549                	li	a0,18
     cf4:	8082                	ret
     cf6:	8082                	ret

00000cf8 <mm_heap_initialize>:
  heap->mm_nregions = 0;
#endif

  /* Initialize the node array */

  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
     cf8:	20001537          	lui	a0,0x20001

  mm_addregion(heap, heapstart, heapsize);
}

void mm_heap_initialize(void)
{
     cfc:	1151                	addi	sp,sp,-12
  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
     cfe:	13000613          	li	a2,304
     d02:	4581                	li	a1,0
     d04:	0d850513          	addi	a0,a0,216 # 200010d8 <g_mmheap+0x18>
{
     d08:	c406                	sw	ra,8(sp)
  memset(heap->mm_nodelist, 0, sizeof(struct mm_freenode_s) * MM_NNODES);
     d0a:	b32ff0ef          	jal	ra,3c <memset>
  for (i = 1; i < MM_NNODES; i++)
     d0e:	200013b7          	lui	t2,0x20001
     d12:	200017b7          	lui	a5,0x20001
     d16:	0c038613          	addi	a2,t2,192 # 200010c0 <g_mmheap>
     d1a:	0e878793          	addi	a5,a5,232 # 200010e8 <g_mmheap+0x28>
     d1e:	14860593          	addi	a1,a2,328
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d22:	ff078713          	addi	a4,a5,-16
     d26:	c7d8                	sw	a4,12(a5)
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d28:	fef7ac23          	sw	a5,-8(a5)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d2c:	01078093          	addi	ra,a5,16
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d30:	fe10ac23          	sw	ra,-8(ra)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d34:	00f0a623          	sw	a5,12(ra)
     d38:	02078693          	addi	a3,a5,32
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d3c:	fed6ac23          	sw	a3,-8(a3)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d40:	0016a623          	sw	ra,12(a3)
     d44:	03078293          	addi	t0,a5,48
     d48:	00d2a623          	sw	a3,12(t0) # 8000c <__erodata+0x791d4>
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d4c:	fe52ac23          	sw	t0,-8(t0)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d50:	04078313          	addi	t1,a5,64
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d54:	fe632c23          	sw	t1,-8(t1) # fff8 <__erodata+0x91c0>
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d58:	00532623          	sw	t0,12(t1)
     d5c:	05078513          	addi	a0,a5,80
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d60:	fea52c23          	sw	a0,-8(a0)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d64:	00652623          	sw	t1,12(a0)
     d68:	06078093          	addi	ra,a5,96
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d6c:	fe10ac23          	sw	ra,-8(ra)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d70:	00a0a623          	sw	a0,12(ra)
     d74:	07078713          	addi	a4,a5,112
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d78:	08078693          	addi	a3,a5,128
     d7c:	fee72c23          	sw	a4,-8(a4) # fffff8 <__erodata+0xff91c0>
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d80:	00172623          	sw	ra,12(a4)
      heap->mm_nodelist[i-1].flink = &heap->mm_nodelist[i];
     d84:	fed6ac23          	sw	a3,-8(a3)
      heap->mm_nodelist[i].blink   = &heap->mm_nodelist[i-1];
     d88:	c6d8                	sw	a4,12(a3)
     d8a:	09078793          	addi	a5,a5,144
  for (i = 1; i < MM_NNODES; i++)
     d8e:	f8f59ae3          	bne	a1,a5,d22 <mm_heap_initialize+0x2a>
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
     d92:	200015b7          	lui	a1,0x20001
     d96:	21058293          	addi	t0,a1,528 # 20001210 <__bss_end__>
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
     d9a:	200800b7          	lui	ra,0x20080
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
     d9e:	00f28313          	addi	t1,t0,15
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
     da2:	00008713          	mv	a4,ra
  heapbase = MM_ALIGN_UP((uintptr_t)heapstart);
     da6:	ff037513          	andi	a0,t1,-16
  heapend  = MM_ALIGN_DOWN((uintptr_t)heapstart + (uintptr_t)heapsize);
     daa:	ff077693          	andi	a3,a4,-16
  heapsize = heapend - heapbase;
     dae:	40a687b3          	sub	a5,a3,a0
  heap->mm_heapstart[IDX]            = (struct mm_allocnode_s *)heapbase;
     db2:	ca08                	sw	a0,16(a2)
  heap->mm_heapsize += heapsize;
     db4:	c65c                	sw	a5,12(a2)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
     db6:	4321                	li	t1,8
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
     db8:	ff078093          	addi	ra,a5,-16
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
     dbc:	800002b7          	lui	t0,0x80000
  node->size                  = heapsize - 2*SIZEOF_MM_ALLOCNODE;
     dc0:	00152423          	sw	ra,8(a0)
  heap->mm_heapstart[IDX]->size      = SIZEOF_MM_ALLOCNODE;
     dc4:	00652023          	sw	t1,0(a0)
  heap->mm_heapstart[IDX]->preceding = MM_ALLOC_BIT;
     dc8:	00552223          	sw	t0,4(a0)
  node                        = (struct mm_freenode_s *)(heapbase + SIZEOF_MM_ALLOCNODE);
     dcc:	00850593          	addi	a1,a0,8
  node->preceding             = SIZEOF_MM_ALLOCNODE;
     dd0:	0065a223          	sw	t1,4(a1)
  heap->mm_heapend[IDX]              = (struct mm_allocnode_s *)(heapend - SIZEOF_MM_ALLOCNODE);
     dd4:	ff868513          	addi	a0,a3,-8
     dd8:	ca48                	sw	a0,20(a2)
  heap->mm_heapend[IDX]->size        = SIZEOF_MM_ALLOCNODE;
     dda:	fe66ac23          	sw	t1,-8(a3)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
     dde:	0050e633          	or	a2,ra,t0
    mm_initialize(&g_mmheap, &__heap_start, (uint32_t)(&__heap_end) - (uint32_t)(&__heap_start));
}
     de2:	40a2                	lw	ra,8(sp)
  heap->mm_heapend[IDX]->preceding   = node->size | MM_ALLOC_BIT;
     de4:	c150                	sw	a2,4(a0)
  mm_addfreechunk(heap, node);
     de6:	0c038513          	addi	a0,t2,192
}
     dea:	0131                	addi	sp,sp,12
  mm_addfreechunk(heap, node);
     dec:	a009                	j	dee <mm_addfreechunk>

00000dee <mm_addfreechunk>:
 *   the mm semaphore
 *
 ****************************************************************************/

void mm_addfreechunk(struct mm_heap_s *heap, struct mm_freenode_s *node)
{
     dee:	1151                	addi	sp,sp,-12
     df0:	c026                	sw	s1,0(sp)
     df2:	84aa                	mv	s1,a0
  struct mm_freenode_s *next;
  struct mm_freenode_s *prev;

  /* Convert the size to a nodelist index */

  int ndx = mm_size2ndx(node->size);
     df4:	4188                	lw	a0,0(a1)
{
     df6:	c222                	sw	s0,4(sp)
     df8:	c406                	sw	ra,8(sp)
     dfa:	842e                	mv	s0,a1
  int ndx = mm_size2ndx(node->size);
     dfc:	3549                	jal	c7e <mm_size2ndx>

  /* Now put the new node int the next */

  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
     dfe:	0505                	addi	a0,a0,1
     e00:	00451293          	slli	t0,a0,0x4
     e04:	00548333          	add	t1,s1,t0
     e08:	01032683          	lw	a3,16(t1)
     e0c:	00828793          	addi	a5,t0,8 # 80000008 <__heap_end+0x5ff80008>
     e10:	00f48733          	add	a4,s1,a5
     e14:	caa9                	beqz	a3,e66 <mm_addfreechunk+0x78>
       next && next->size && next->size < node->size;
     e16:	0006a083          	lw	ra,0(a3)
     e1a:	02008963          	beqz	ra,e4c <mm_addfreechunk+0x5e>
     e1e:	4010                	lw	a2,0(s0)
     e20:	00c0e963          	bltu	ra,a2,e32 <mm_addfreechunk+0x44>
     e24:	a025                	j	e4c <mm_addfreechunk+0x5e>
     e26:	0003a583          	lw	a1,0(t2)
     e2a:	c19d                	beqz	a1,e50 <mm_addfreechunk+0x62>
     e2c:	02c5f263          	bleu	a2,a1,e50 <mm_addfreechunk+0x62>
     e30:	869e                	mv	a3,t2
       prev = next, next = next->flink);
     e32:	0086a383          	lw	t2,8(a3)
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
     e36:	fe0398e3          	bnez	t2,e26 <mm_addfreechunk+0x38>

  /* Does it go in mid next or at the end? */

  prev->flink = node;
     e3a:	c680                	sw	s0,8(a3)
  node->blink = prev;
     e3c:	c454                	sw	a3,12(s0)
  node->flink = next;
     e3e:	00042423          	sw	zero,8(s0)
    {
      /* The new node goes between prev and next */

      next->blink = node;
    }
}
     e42:	40a2                	lw	ra,8(sp)
     e44:	4412                	lw	s0,4(sp)
     e46:	4482                	lw	s1,0(sp)
     e48:	0131                	addi	sp,sp,12
     e4a:	8082                	ret
       next && next->size && next->size < node->size;
     e4c:	83b6                	mv	t2,a3
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
     e4e:	86ba                	mv	a3,a4
  prev->flink = node;
     e50:	c680                	sw	s0,8(a3)
  node->blink = prev;
     e52:	c454                	sw	a3,12(s0)
  node->flink = next;
     e54:	00742423          	sw	t2,8(s0)
      next->blink = node;
     e58:	0083a623          	sw	s0,12(t2)
}
     e5c:	40a2                	lw	ra,8(sp)
     e5e:	4412                	lw	s0,4(sp)
     e60:	4482                	lw	s1,0(sp)
     e62:	0131                	addi	sp,sp,12
     e64:	8082                	ret
  for (prev = &heap->mm_nodelist[ndx], next = heap->mm_nodelist[ndx].flink;
     e66:	86ba                	mv	a3,a4
     e68:	bfc9                	j	e3a <mm_addfreechunk+0x4c>

00000e6a <fputc>:
#endif

usart_handle_t console_handle = NULL;

int fputc(int ch, FILE *stream)
{
     e6a:	1151                	addi	sp,sp,-12
     e6c:	c026                	sw	s1,0(sp)
    if (console_handle == NULL) {
     e6e:	200004b7          	lui	s1,0x20000
     e72:	01048493          	addi	s1,s1,16 # 20000010 <__data_end__>
{
     e76:	c222                	sw	s0,4(sp)
     e78:	842a                	mv	s0,a0
    if (console_handle == NULL) {
     e7a:	4088                	lw	a0,0(s1)
{
     e7c:	c406                	sw	ra,8(sp)
    if (console_handle == NULL) {
     e7e:	c10d                	beqz	a0,ea0 <fputc+0x36>
        return -1;
    }

    if (ch == '\n') {
     e80:	47a9                	li	a5,10
     e82:	00f40b63          	beq	s0,a5,e98 <fputc+0x2e>
        csi_usart_putchar(console_handle, '\r');
    }

    csi_usart_putchar(console_handle, ch);
     e86:	0ff47593          	andi	a1,s0,255
     e8a:	2c8d                	jal	10fc <csi_usart_putchar>

    return 0;
     e8c:	4501                	li	a0,0
}
     e8e:	40a2                	lw	ra,8(sp)
     e90:	4412                	lw	s0,4(sp)
     e92:	4482                	lw	s1,0(sp)
     e94:	0131                	addi	sp,sp,12
     e96:	8082                	ret
        csi_usart_putchar(console_handle, '\r');
     e98:	45b5                	li	a1,13
     e9a:	248d                	jal	10fc <csi_usart_putchar>
     e9c:	4088                	lw	a0,0(s1)
     e9e:	b7e5                	j	e86 <fputc+0x1c>
        return -1;
     ea0:	557d                	li	a0,-1
     ea2:	b7f5                	j	e8e <fputc+0x24>

00000ea4 <csi_timer_initialize>:
  \param[in]   cb_event  Pointer to \ref timer_event_cb_t
  \return      pointer to timer instance
*/
timer_handle_t csi_timer_initialize(int32_t idx, timer_event_cb_t cb_event)
{
    if (idx < 0 || idx >= CONFIG_TIMER_NUM) {
     ea4:	470d                	li	a4,3
     ea6:	0aa76363          	bltu	a4,a0,f4c <csi_timer_initialize+0xa8>
{
     eaa:	1131                	addi	sp,sp,-20
     eac:	c426                	sw	s1,8(sp)
    }

    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t real_idx = target_get_timer(idx, &base, &irq);
     eae:	0050                	addi	a2,sp,4
     eb0:	84ae                	mv	s1,a1
     eb2:	858a                	mv	a1,sp
{
     eb4:	c622                	sw	s0,12(sp)
     eb6:	c806                	sw	ra,16(sp)
     eb8:	842a                	mv	s0,a0
    uint32_t base = 0u;
     eba:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
     ebc:	c202                	sw	zero,4(sp)
    int32_t real_idx = target_get_timer(idx, &base, &irq);
     ebe:	2d65                	jal	1576 <target_get_timer>

    if (real_idx != idx) {
     ec0:	08a41063          	bne	s0,a0,f40 <csi_timer_initialize+0x9c>
        return NULL;
    }

    dw_timer_priv_t *timer_priv = &timer_instance[idx];
    timer_priv->base = base;
     ec4:	4382                	lw	t2,0(sp)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
     ec6:	00241793          	slli	a5,s0,0x2
     eca:	008780b3          	add	ra,a5,s0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
     ece:	0083a703          	lw	a4,8(t2)
     ed2:	0083c783          	lbu	a5,8(t2)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
     ed6:	20001537          	lui	a0,0x20001
    timer_priv->irq  = irq;
     eda:	4612                	lw	a2,4(sp)
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
     edc:	00209293          	slli	t0,ra,0x2
     ee0:	03850313          	addi	t1,a0,56 # 20001038 <g_top_irqstack>

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
     ee4:	0cc165b7          	lui	a1,0xcc16
    dw_timer_priv_t *timer_priv = &timer_instance[idx];
     ee8:	00530533          	add	a0,t1,t0
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
     eec:	18058693          	addi	a3,a1,384 # cc16180 <__erodata+0xcc0f348>
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
     ef0:	00e77413          	andi	s0,a4,14
     ef4:	ff07f093          	andi	ra,a5,-16
    timer_priv->timeout = DW_TIMER_INIT_DEFAULT_VALUE;
     ef8:	c554                	sw	a3,12(a0)
    timer_priv->base = base;
     efa:	00752023          	sw	t2,0(a0)
    timer_priv->irq  = irq;
     efe:	c150                	sw	a2,4(a0)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
     f00:	0080e2b3          	or	t0,ra,s0
     f04:	00538423          	sb	t0,8(t2)
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;
     f08:	0083a303          	lw	t1,8(t2)
     f0c:	0083c703          	lbu	a4,8(t2)
     f10:	00f37593          	andi	a1,t1,15
     f14:	0045e693          	ori	a3,a1,4
     f18:	ff077413          	andi	s0,a4,-16
     f1c:	00d467b3          	or	a5,s0,a3
     f20:	00f38423          	sb	a5,8(t2)

    timer_deactive_control(addr);
    timer_priv->cb_event = cb_event;
     f24:	c504                	sw	s1,8(a0)

    if (cb_event != NULL) {
     f26:	c881                	beqz	s1,f36 <csi_timer_initialize+0x92>
  \details Enable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_enable_irq(int32_t IRQn)
{
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
     f28:	4485                	li	s1,1
     f2a:	00c493b3          	sll	t2,s1,a2
     f2e:	e000e637          	lui	a2,0xe000e
     f32:	10762023          	sw	t2,256(a2) # e000e100 <__heap_end+0xbff8e100>
        csi_vic_enable_irq(timer_priv->irq);
#endif
    }

    return (timer_handle_t)timer_priv;
}
     f36:	40c2                	lw	ra,16(sp)
     f38:	4432                	lw	s0,12(sp)
     f3a:	44a2                	lw	s1,8(sp)
     f3c:	0151                	addi	sp,sp,20
     f3e:	8082                	ret
     f40:	40c2                	lw	ra,16(sp)
     f42:	4432                	lw	s0,12(sp)
     f44:	44a2                	lw	s1,8(sp)
        return NULL;
     f46:	4501                	li	a0,0
}
     f48:	0151                	addi	sp,sp,20
     f4a:	8082                	ret
        return NULL;
     f4c:	4501                	li	a0,0
}
     f4e:	8082                	ret

00000f50 <csi_timer_uninitialize>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_uninitialize(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
     f50:	c531                	beqz	a0,f9c <csi_timer_uninitialize+0x4c>

    dw_timer_priv_t *timer_priv = (dw_timer_priv_t *)handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
     f52:	411c                	lw	a5,0(a0)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;
     f54:	4798                	lw	a4,8(a5)
     f56:	0087c283          	lbu	t0,8(a5)
     f5a:	00e77693          	andi	a3,a4,14
     f5e:	ff02f313          	andi	t1,t0,-16
     f62:	00d363b3          	or	t2,t1,a3
     f66:	00778423          	sb	t2,8(a5)
    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;
     f6a:	478c                	lw	a1,8(a5)
     f6c:	0087c703          	lbu	a4,8(a5)
     f70:	00f5f613          	andi	a2,a1,15
     f74:	00466693          	ori	a3,a2,4
     f78:	ff077293          	andi	t0,a4,-16
     f7c:	00d2e333          	or	t1,t0,a3
     f80:	00678423          	sb	t1,8(a5)

    timer_deactive_control(addr);
    timer_priv->cb_event = NULL;
     f84:	00052423          	sw	zero,8(a0)
  \details Disable a device-specific interrupt in the VIC interrupt controller.
  \param [in]      IRQn  External interrupt number. Value cannot be negative.
 */
__ALWAYS_INLINE void csi_vic_disable_irq(int32_t IRQn)
{
    VIC->ICER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
     f88:	4148                	lw	a0,4(a0)
     f8a:	4785                	li	a5,1
     f8c:	e000e5b7          	lui	a1,0xe000e
     f90:	00a793b3          	sll	t2,a5,a0
     f94:	1875a023          	sw	t2,384(a1) # e000e180 <__heap_end+0xbff8e180>
#if defined CONFIG_CHIP_SH810 || defined CONFIG_CHIP_SH807 || defined CONFIG_CHIP_SH610 || defined CONFIG_CHIP_SH610M
    csi_intc_disable_irq(timer_priv->irq);
#else
    csi_vic_disable_irq(timer_priv->irq);
#endif
    return 0;
     f98:	4501                	li	a0,0
     f9a:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
     f9c:	81070637          	lui	a2,0x81070
     fa0:	08460513          	addi	a0,a2,132 # 81070084 <__heap_end+0x60ff0084>
}
     fa4:	8082                	ret

00000fa6 <csi_timer_config>:
  \param[in]   mode      \ref timer_mode_e
  \return      error code
*/
int32_t csi_timer_config(timer_handle_t handle, timer_mode_e mode)
{
    TIMER_NULL_PARAM_CHK(handle);
     fa6:	c515                	beqz	a0,fd2 <csi_timer_config+0x2c>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
     fa8:	411c                	lw	a5,0(a0)

    switch (mode) {
     faa:	c98d                	beqz	a1,fdc <csi_timer_config+0x36>
     fac:	4285                	li	t0,1
     fae:	02559263          	bne	a1,t0,fd2 <csi_timer_config+0x2c>
        case TIMER_MODE_FREE_RUNNING:
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
            break;

        case TIMER_MODE_RELOAD:
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
     fb2:	0087a303          	lw	t1,8(a5)
     fb6:	0087c503          	lbu	a0,8(a5)
     fba:	00f37393          	andi	t2,t1,15
     fbe:	ff057593          	andi	a1,a0,-16
     fc2:	0023e693          	ori	a3,t2,2
     fc6:	00d5e633          	or	a2,a1,a3
     fca:	00c78423          	sb	a2,8(a5)

        default:
            return ERR_TIMER(DRV_ERROR_PARAMETER);
    }

    return 0;
     fce:	4501                	li	a0,0
            break;
     fd0:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
     fd2:	810707b7          	lui	a5,0x81070
     fd6:	08478513          	addi	a0,a5,132 # 81070084 <__heap_end+0x60ff0084>
}
     fda:	8082                	ret
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
     fdc:	4798                	lw	a4,8(a5)
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
     fde:	0087c503          	lbu	a0,8(a5)
            addr->TxControl &= ~DW_TIMER_TXCONTROL_MODE;
     fe2:	00d77693          	andi	a3,a4,13
            addr->TxControl |= DW_TIMER_TXCONTROL_MODE;
     fe6:	ff057593          	andi	a1,a0,-16
     fea:	00d5e633          	or	a2,a1,a3
     fee:	00c78423          	sb	a2,8(a5)
    return 0;
     ff2:	4501                	li	a0,0
            break;
     ff4:	8082                	ret

00000ff6 <csi_timer_set_timeout>:
  \param[in]   timeout the timeout value in microseconds(us).
  \return      error code
*/
int32_t csi_timer_set_timeout(timer_handle_t handle, uint32_t timeout)
{
    TIMER_NULL_PARAM_CHK(handle);
     ff6:	c501                	beqz	a0,ffe <csi_timer_set_timeout+0x8>

    dw_timer_priv_t *timer_priv = handle;
    timer_priv->timeout = timeout;
     ff8:	c54c                	sw	a1,12(a0)
    return 0;
     ffa:	4501                	li	a0,0
     ffc:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
     ffe:	81070537          	lui	a0,0x81070
    1002:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    1006:	8082                	ret

00001008 <csi_timer_start>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_start(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    1008:	c551                	beqz	a0,1094 <csi_timer_start+0x8c>
    timer_priv->timeout_flag = 0;

    uint32_t min_us = LSP_DEFAULT_FREQ / 1000000;
    uint32_t load;

    if (timer_priv->timeout > 0xffffffff / min_us) {
    100a:	4558                	lw	a4,12(a0)
    100c:	47d1                	li	a5,20
    timer_priv->timeout_flag = 0;
    100e:	00052823          	sw	zero,16(a0)
    if (timer_priv->timeout > 0xffffffff / min_us) {
    1012:	02f732b3          	mulhu	t0,a4,a5
    1016:	06029f63          	bnez	t0,1094 <csi_timer_start+0x8c>
        load = (uint32_t)(timer_priv->timeout * min_us);
    } else {
        load = (uint32_t)(((timer_priv->timeout) * LSP_DEFAULT_FREQ) / 1000000);
    }

    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    101a:	00052303          	lw	t1,0(a0)

    if (timer_priv->timeout == 0) {
    101e:	ef21                	bnez	a4,1076 <csi_timer_start+0x6e>
        addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    } else {
        if ((addr->TxControl | 0x2) == 0x2) {
            addr->TxLoadCount = 0xffffffff;                           /* load time(us) */
    1020:	577d                	li	a4,-1
    1022:	00e32023          	sw	a4,0(t1)
        } else {
            addr->TxLoadCount = load;                           /* load time(us) */
        }
    }

    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    1026:	00832783          	lw	a5,8(t1)
    102a:	00834683          	lbu	a3,8(t1)
    102e:	00e7f293          	andi	t0,a5,14
    1032:	ff06f393          	andi	t2,a3,-16
    1036:	0053e533          	or	a0,t2,t0
    103a:	00a30423          	sb	a0,8(t1)
    addr->TxControl |= DW_TIMER_TXCONTROL_ENABLE;       /* enable the corresponding timer */
    103e:	00832583          	lw	a1,8(t1)
    1042:	00834703          	lbu	a4,8(t1)
    1046:	00f5f613          	andi	a2,a1,15
    104a:	00166793          	ori	a5,a2,1
    104e:	ff077293          	andi	t0,a4,-16
    1052:	00f2e6b3          	or	a3,t0,a5
    1056:	00d30423          	sb	a3,8(t1)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_INTMASK;     /* enable interrupt */
    105a:	00832383          	lw	t2,8(t1)
    105e:	00834583          	lbu	a1,8(t1)
    1062:	00b3f513          	andi	a0,t2,11
    1066:	ff05f613          	andi	a2,a1,-16
    106a:	00a667b3          	or	a5,a2,a0
    106e:	00f30423          	sb	a5,8(t1)
    return 0;
    1072:	4501                	li	a0,0
}
    1074:	8082                	ret
        if ((addr->TxControl | 0x2) == 0x2) {
    1076:	00832683          	lw	a3,8(t1)
    107a:	00d6f393          	andi	t2,a3,13
    107e:	fa0381e3          	beqz	t2,1020 <csi_timer_start+0x18>
        load = (uint32_t)(timer_priv->timeout * min_us);
    1082:	00271513          	slli	a0,a4,0x2
    1086:	00e505b3          	add	a1,a0,a4
    108a:	00259613          	slli	a2,a1,0x2
            addr->TxLoadCount = load;                           /* load time(us) */
    108e:	00c32023          	sw	a2,0(t1)
    1092:	bf51                	j	1026 <csi_timer_start+0x1e>
    TIMER_NULL_PARAM_CHK(handle);
    1094:	81070337          	lui	t1,0x81070
    1098:	08430513          	addi	a0,t1,132 # 81070084 <__heap_end+0x60ff0084>
    109c:	8082                	ret

0000109e <csi_timer_stop>:
  \param[in]   handle timer handle to operate.
  \return      error code
*/
int32_t csi_timer_stop(timer_handle_t handle)
{
    TIMER_NULL_PARAM_CHK(handle);
    109e:	cd05                	beqz	a0,10d6 <csi_timer_stop+0x38>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    10a0:	411c                	lw	a5,0(a0)

    addr->TxControl |= DW_TIMER_TXCONTROL_INTMASK;      /* enable interrupt */
    10a2:	4798                	lw	a4,8(a5)
    10a4:	0087c303          	lbu	t1,8(a5)
    10a8:	00f77293          	andi	t0,a4,15
    10ac:	0042e693          	ori	a3,t0,4
    10b0:	ff037393          	andi	t2,t1,-16
    10b4:	00d3e533          	or	a0,t2,a3
    10b8:	00a78423          	sb	a0,8(a5)
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    10bc:	478c                	lw	a1,8(a5)
    10be:	0087c703          	lbu	a4,8(a5)

    return 0;
    10c2:	4501                	li	a0,0
    addr->TxControl &= ~DW_TIMER_TXCONTROL_ENABLE;      /* disable the timer */
    10c4:	00e5f613          	andi	a2,a1,14
    10c8:	ff077293          	andi	t0,a4,-16
    10cc:	00c2e6b3          	or	a3,t0,a2
    10d0:	00d78423          	sb	a3,8(a5)
    return 0;
    10d4:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    10d6:	810707b7          	lui	a5,0x81070
    10da:	08478513          	addi	a0,a5,132 # 81070084 <__heap_end+0x60ff0084>
}
    10de:	8082                	ret

000010e0 <csi_timer_get_current_value>:
  \param[out]   value     timer current value
  \return      error code
*/
int32_t csi_timer_get_current_value(timer_handle_t handle, uint32_t *value)
{
    TIMER_NULL_PARAM_CHK(handle);
    10e0:	c909                	beqz	a0,10f2 <csi_timer_get_current_value+0x12>
    TIMER_NULL_PARAM_CHK(value);
    10e2:	c981                	beqz	a1,10f2 <csi_timer_get_current_value+0x12>

    dw_timer_priv_t *timer_priv = handle;
    dw_timer_reg_t *addr = (dw_timer_reg_t *)(timer_priv->base);
    10e4:	411c                	lw	a5,0(a0)

    *value = addr->TxCurrentValue;
    return 0;
    10e6:	4501                	li	a0,0
    *value = addr->TxCurrentValue;
    10e8:	0047a283          	lw	t0,4(a5)
    10ec:	0055a023          	sw	t0,0(a1)
    return 0;
    10f0:	8082                	ret
    TIMER_NULL_PARAM_CHK(handle);
    10f2:	81070537          	lui	a0,0x81070
    10f6:	08450513          	addi	a0,a0,132 # 81070084 <__heap_end+0x60ff0084>
}
    10fa:	8082                	ret

000010fc <csi_usart_putchar>:
  \param[in]   ch  the input charater
  \return      error code
*/
int32_t csi_usart_putchar(usart_handle_t handle, uint8_t ch)
{
    USART_NULL_PARAM_CHK(handle);
    10fc:	cd21                	beqz	a0,1154 <csi_usart_putchar+0x58>
    ck_usart_priv_t *usart_priv = handle;
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    10fe:	411c                	lw	a5,0(a0)

    while ((!(addr->LSR & DW_LSR_TRANS_EMPTY)));
    1100:	4bd8                	lw	a4,20(a5)
    1102:	02077293          	andi	t0,a4,32
    1106:	04029463          	bnez	t0,114e <csi_usart_putchar+0x52>
    110a:	0147a303          	lw	t1,20(a5)
    110e:	02037393          	andi	t2,t1,32
    1112:	02039e63          	bnez	t2,114e <csi_usart_putchar+0x52>
    1116:	4bc8                	lw	a0,20(a5)
    1118:	02057613          	andi	a2,a0,32
    111c:	ea0d                	bnez	a2,114e <csi_usart_putchar+0x52>
    111e:	4bd4                	lw	a3,20(a5)
    1120:	0206f713          	andi	a4,a3,32
    1124:	e70d                	bnez	a4,114e <csi_usart_putchar+0x52>
    1126:	0147a283          	lw	t0,20(a5)
    112a:	0202f313          	andi	t1,t0,32
    112e:	02031063          	bnez	t1,114e <csi_usart_putchar+0x52>
    1132:	0147a383          	lw	t2,20(a5)
    1136:	0203f513          	andi	a0,t2,32
    113a:	e911                	bnez	a0,114e <csi_usart_putchar+0x52>
    113c:	4bd0                	lw	a2,20(a5)
    113e:	02067693          	andi	a3,a2,32
    1142:	e691                	bnez	a3,114e <csi_usart_putchar+0x52>
    1144:	4bd8                	lw	a4,20(a5)
    1146:	02077293          	andi	t0,a4,32
    114a:	fa028be3          	beqz	t0,1100 <csi_usart_putchar+0x4>

    addr->THR = ch;
    114e:	c38c                	sw	a1,0(a5)

    return 0;
    1150:	4501                	li	a0,0
    1152:	8082                	ret
    USART_NULL_PARAM_CHK(handle);
    1154:	810205b7          	lui	a1,0x81020
    1158:	08458513          	addi	a0,a1,132 # 81020084 <__heap_end+0x60fa0084>

}
    115c:	8082                	ret

0000115e <csi_usart_initialize>:
  \param[in]   idx usart index
  \param[in]   cb_event  Pointer to \ref usart_event_cb_t
  \return      return usart handle if success
*/
usart_handle_t csi_usart_initialize(int32_t idx, usart_event_cb_t cb_event)
{
    115e:	1131                	addi	sp,sp,-20
    1160:	c622                	sw	s0,12(sp)
    uint32_t base = 0u;
    uint32_t irq = 0u;

    int32_t ret = target_usart_init(idx, &base, &irq);
    1162:	0050                	addi	a2,sp,4
{
    1164:	842e                	mv	s0,a1
    int32_t ret = target_usart_init(idx, &base, &irq);
    1166:	858a                	mv	a1,sp
{
    1168:	c426                	sw	s1,8(sp)
    116a:	c806                	sw	ra,16(sp)
    116c:	84aa                	mv	s1,a0
    uint32_t base = 0u;
    116e:	c002                	sw	zero,0(sp)
    uint32_t irq = 0u;
    1170:	c202                	sw	zero,4(sp)
    int32_t ret = target_usart_init(idx, &base, &irq);
    1172:	2ecd                	jal	1564 <target_usart_init>

    if (ret < 0 || ret >= CONFIG_USART_NUM) {
    1174:	e139                	bnez	a0,11ba <csi_usart_initialize+0x5c>
        return NULL;
    }

    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    1176:	00349513          	slli	a0,s1,0x3
    usart_priv->base = base;
    117a:	4382                	lw	t2,0(sp)
    usart_priv->irq = irq;
    117c:	4712                	lw	a4,4(sp)
    ck_usart_priv_t *usart_priv = &usart_instance[idx];
    117e:	409500b3          	sub	ra,a0,s1
    1182:	200012b7          	lui	t0,0x20001
    1186:	00309793          	slli	a5,ra,0x3
    118a:	08828313          	addi	t1,t0,136 # 20001088 <usart_instance>
    118e:	00f30533          	add	a0,t1,a5
    usart_priv->cb_event = cb_event;
    1192:	c500                	sw	s0,8(a0)
    usart_priv->idx = idx;
    1194:	d944                	sw	s1,52(a0)
    usart_priv->base = base;
    1196:	00752023          	sw	t2,0(a0)
    usart_priv->irq = irq;
    119a:	c158                	sw	a4,4(a0)
#else
    csi_vic_enable_irq(usart_priv->irq);
#endif

    return usart_priv;
}
    119c:	40c2                	lw	ra,16(sp)
    119e:	4432                	lw	s0,12(sp)
    addr->IER = IER_RDA_INT_ENABLE | IIR_RECV_LINE_ENABLE;
    11a0:	4695                	li	a3,5
    VIC->ISER[0U] = (uint32_t)(1UL << (((uint32_t)(int32_t)IRQn) & 0x1FUL));
    11a2:	4585                	li	a1,1
    11a4:	00d3a223          	sw	a3,4(t2)
    11a8:	e000e4b7          	lui	s1,0xe000e
    11ac:	00e59633          	sll	a2,a1,a4
    11b0:	10c4a023          	sw	a2,256(s1) # e000e100 <__heap_end+0xbff8e100>
}
    11b4:	44a2                	lw	s1,8(sp)
    11b6:	0151                	addi	sp,sp,20
    11b8:	8082                	ret
    11ba:	40c2                	lw	ra,16(sp)
    11bc:	4432                	lw	s0,12(sp)
    11be:	44a2                	lw	s1,8(sp)
        return NULL;
    11c0:	4501                	li	a0,0
}
    11c2:	0151                	addi	sp,sp,20
    11c4:	8082                	ret

000011c6 <csi_usart_config>:
    USART_NULL_PARAM_CHK(handle);
    11c6:	38050a63          	beqz	a0,155a <csi_usart_config+0x394>
    ck_usart_reg_t *addr = (ck_usart_reg_t *)(usart_priv->base);
    11ca:	4108                	lw	a0,0(a0)
                         uint32_t baud,
                         usart_mode_e mode,
                         usart_parity_e parity,
                         usart_stop_bits_e stopbits,
                         usart_data_bits_e bits)
{
    11cc:	1171                	addi	sp,sp,-4
    11ce:	c022                	sw	s0,0(sp)
    WAIT_USART_IDLE(addr);
    11d0:	07c52303          	lw	t1,124(a0)
    11d4:	00137293          	andi	t0,t1,1
    11d8:	06028f63          	beqz	t0,1256 <csi_usart_config+0x90>
    11dc:	000f43b7          	lui	t2,0xf4
    11e0:	4301                	li	t1,0
    11e2:	24038393          	addi	t2,t2,576 # f4240 <__erodata+0xed408>
    11e6:	5d60                	lw	s0,124(a0)
    11e8:	0305                	addi	t1,t1,1
    11ea:	829a                	mv	t0,t1
    11ec:	8805                	andi	s0,s0,1
    11ee:	cc31                	beqz	s0,124a <csi_usart_config+0x84>
    11f0:	5d60                	lw	s0,124(a0)
    11f2:	0305                	addi	t1,t1,1
    11f4:	8805                	andi	s0,s0,1
    11f6:	c831                	beqz	s0,124a <csi_usart_config+0x84>
    11f8:	5d60                	lw	s0,124(a0)
    11fa:	00228313          	addi	t1,t0,2
    11fe:	8805                	andi	s0,s0,1
    1200:	c429                	beqz	s0,124a <csi_usart_config+0x84>
    1202:	5d60                	lw	s0,124(a0)
    1204:	00328313          	addi	t1,t0,3
    1208:	8805                	andi	s0,s0,1
    120a:	c021                	beqz	s0,124a <csi_usart_config+0x84>
    120c:	5d60                	lw	s0,124(a0)
    120e:	00428313          	addi	t1,t0,4
    1212:	8805                	andi	s0,s0,1
    1214:	c81d                	beqz	s0,124a <csi_usart_config+0x84>
    1216:	5d60                	lw	s0,124(a0)
    1218:	00528313          	addi	t1,t0,5
    121c:	8805                	andi	s0,s0,1
    121e:	c415                	beqz	s0,124a <csi_usart_config+0x84>
    1220:	5d60                	lw	s0,124(a0)
    1222:	00628313          	addi	t1,t0,6
    1226:	8805                	andi	s0,s0,1
    1228:	c00d                	beqz	s0,124a <csi_usart_config+0x84>
    122a:	00728313          	addi	t1,t0,7
    122e:	07c52283          	lw	t0,124(a0)
    1232:	0012f413          	andi	s0,t0,1
    1236:	c811                	beqz	s0,124a <csi_usart_config+0x84>
    1238:	fa7317e3          	bne	t1,t2,11e6 <csi_usart_config+0x20>
    if (ret < 0) {
        return ret;
    }

    return 0;
}
    123c:	4402                	lw	s0,0(sp)
    WAIT_USART_IDLE(addr);
    123e:	810206b7          	lui	a3,0x81020
    1242:	08268513          	addi	a0,a3,130 # 81020082 <__heap_end+0x60fa0082>
}
    1246:	0111                	addi	sp,sp,4
    1248:	8082                	ret
    WAIT_USART_IDLE(addr);
    124a:	000f43b7          	lui	t2,0xf4
    124e:	24038293          	addi	t0,t2,576 # f4240 <__erodata+0xed408>
    1252:	fe5305e3          	beq	t1,t0,123c <csi_usart_config+0x76>
    uint32_t divisor = ((LSP_DEFAULT_FREQ  * 10) / baud) >> 4;
    1256:	0bebc337          	lui	t1,0xbebc
    125a:	20030413          	addi	s0,t1,512 # bebc200 <__erodata+0xbeb53c8>
    125e:	02b455b3          	divu	a1,s0,a1
    1262:	42a9                	li	t0,10
    1264:	0045d393          	srli	t2,a1,0x4
    if ((divisor % 10) >= 5) {
    1268:	0253f433          	remu	s0,t2,t0
    126c:	4591                	li	a1,4
    126e:	0253d333          	divu	t1,t2,t0
        divisor = (divisor / 10) + 1;
    1272:	0085b3b3          	sltu	t2,a1,s0
    1276:	007302b3          	add	t0,t1,t2
    addr->LCR |= LCR_SET_DLAB;
    127a:	00c52303          	lw	t1,12(a0)
    addr->DLL = divisor & 0xff;
    127e:	0ff2f593          	andi	a1,t0,255
    addr->DLH = (divisor >> 8) & 0xff;
    1282:	0082d393          	srli	t2,t0,0x8
    addr->LCR |= LCR_SET_DLAB;
    1286:	08036413          	ori	s0,t1,128
    128a:	c540                	sw	s0,12(a0)
    addr->DLL = divisor & 0xff;
    128c:	c10c                	sw	a1,0(a0)
    addr->DLH = (divisor >> 8) & 0xff;
    128e:	0ff3f293          	andi	t0,t2,255
    1292:	00552223          	sw	t0,4(a0)
    addr->LCR &= (~LCR_SET_DLAB);
    1296:	00c52303          	lw	t1,12(a0)
    129a:	f7f37413          	andi	s0,t1,-129
    129e:	c540                	sw	s0,12(a0)
    if (mode == USART_MODE_ASYNCHRONOUS) {
    12a0:	2a061863          	bnez	a2,1550 <csi_usart_config+0x38a>
    WAIT_USART_IDLE(addr);
    12a4:	5d6c                	lw	a1,124(a0)
    12a6:	0015f393          	andi	t2,a1,1
    12aa:	08038e63          	beqz	t2,1346 <csi_usart_config+0x180>
    12ae:	000f42b7          	lui	t0,0xf4
    12b2:	4601                	li	a2,0
    12b4:	24028413          	addi	s0,t0,576 # f4240 <__erodata+0xed408>
    12b8:	07c52303          	lw	t1,124(a0)
    12bc:	0605                	addi	a2,a2,1
    12be:	85b2                	mv	a1,a2
    12c0:	00137393          	andi	t2,t1,1
    12c4:	06038b63          	beqz	t2,133a <csi_usart_config+0x174>
    12c8:	07c52283          	lw	t0,124(a0)
    12cc:	0605                	addi	a2,a2,1
    12ce:	0012f313          	andi	t1,t0,1
    12d2:	06030463          	beqz	t1,133a <csi_usart_config+0x174>
    12d6:	07c52383          	lw	t2,124(a0)
    12da:	00258613          	addi	a2,a1,2
    12de:	0013f293          	andi	t0,t2,1
    12e2:	04028c63          	beqz	t0,133a <csi_usart_config+0x174>
    12e6:	07c52303          	lw	t1,124(a0)
    12ea:	00358613          	addi	a2,a1,3
    12ee:	00137393          	andi	t2,t1,1
    12f2:	04038463          	beqz	t2,133a <csi_usart_config+0x174>
    12f6:	07c52283          	lw	t0,124(a0)
    12fa:	00458613          	addi	a2,a1,4
    12fe:	0012f313          	andi	t1,t0,1
    1302:	02030c63          	beqz	t1,133a <csi_usart_config+0x174>
    1306:	07c52383          	lw	t2,124(a0)
    130a:	00558613          	addi	a2,a1,5
    130e:	0013f293          	andi	t0,t2,1
    1312:	02028463          	beqz	t0,133a <csi_usart_config+0x174>
    1316:	07c52303          	lw	t1,124(a0)
    131a:	00658613          	addi	a2,a1,6
    131e:	00137393          	andi	t2,t1,1
    1322:	00038c63          	beqz	t2,133a <csi_usart_config+0x174>
    1326:	00758613          	addi	a2,a1,7
    132a:	5d6c                	lw	a1,124(a0)
    132c:	0015f293          	andi	t0,a1,1
    1330:	00028563          	beqz	t0,133a <csi_usart_config+0x174>
    1334:	f88612e3          	bne	a2,s0,12b8 <csi_usart_config+0xf2>
    1338:	b711                	j	123c <csi_usart_config+0x76>
    133a:	000f4437          	lui	s0,0xf4
    133e:	24040313          	addi	t1,s0,576 # f4240 <__erodata+0xed408>
    1342:	ee660de3          	beq	a2,t1,123c <csi_usart_config+0x76>
    switch (parity) {
    1346:	4385                	li	t2,1
    1348:	1a768063          	beq	a3,t2,14e8 <csi_usart_config+0x322>
    134c:	c6dd                	beqz	a3,13fa <csi_usart_config+0x234>
    134e:	4389                	li	t2,2
    1350:	08769e63          	bne	a3,t2,13ec <csi_usart_config+0x226>
            addr->LCR |= LCR_PARITY_ENABLE;
    1354:	4554                	lw	a3,12(a0)
    1356:	0086e613          	ori	a2,a3,8
    135a:	c550                	sw	a2,12(a0)
            addr->LCR &= LCR_PARITY_ODD;
    135c:	454c                	lw	a1,12(a0)
    135e:	0ef5f293          	andi	t0,a1,239
    1362:	00552623          	sw	t0,12(a0)
    WAIT_USART_IDLE(addr);
    1366:	5d60                	lw	s0,124(a0)
    1368:	00147313          	andi	t1,s0,1
    136c:	0a030363          	beqz	t1,1412 <csi_usart_config+0x24c>
    1370:	000f43b7          	lui	t2,0xf4
    1374:	4681                	li	a3,0
    1376:	24038293          	addi	t0,t2,576 # f4240 <__erodata+0xed408>
    137a:	5d6c                	lw	a1,124(a0)
    137c:	0685                	addi	a3,a3,1
    137e:	8636                	mv	a2,a3
    1380:	0015f413          	andi	s0,a1,1
    1384:	c049                	beqz	s0,1406 <csi_usart_config+0x240>
    1386:	07c52303          	lw	t1,124(a0)
    138a:	0685                	addi	a3,a3,1
    138c:	00137393          	andi	t2,t1,1
    1390:	06038b63          	beqz	t2,1406 <csi_usart_config+0x240>
    1394:	5d6c                	lw	a1,124(a0)
    1396:	00260693          	addi	a3,a2,2
    139a:	0015f413          	andi	s0,a1,1
    139e:	c425                	beqz	s0,1406 <csi_usart_config+0x240>
    13a0:	07c52303          	lw	t1,124(a0)
    13a4:	00360693          	addi	a3,a2,3
    13a8:	00137393          	andi	t2,t1,1
    13ac:	04038d63          	beqz	t2,1406 <csi_usart_config+0x240>
    13b0:	5d6c                	lw	a1,124(a0)
    13b2:	00460693          	addi	a3,a2,4
    13b6:	0015f413          	andi	s0,a1,1
    13ba:	c431                	beqz	s0,1406 <csi_usart_config+0x240>
    13bc:	07c52303          	lw	t1,124(a0)
    13c0:	00560693          	addi	a3,a2,5
    13c4:	00137393          	andi	t2,t1,1
    13c8:	02038f63          	beqz	t2,1406 <csi_usart_config+0x240>
    13cc:	5d6c                	lw	a1,124(a0)
    13ce:	00660693          	addi	a3,a2,6
    13d2:	0015f413          	andi	s0,a1,1
    13d6:	c805                	beqz	s0,1406 <csi_usart_config+0x240>
    13d8:	00760693          	addi	a3,a2,7
    13dc:	5d70                	lw	a2,124(a0)
    13de:	00167313          	andi	t1,a2,1
    13e2:	02030263          	beqz	t1,1406 <csi_usart_config+0x240>
    13e6:	f8569ae3          	bne	a3,t0,137a <csi_usart_config+0x1b4>
    13ea:	bd89                	j	123c <csi_usart_config+0x76>
            return ERR_USART(USART_ERROR_PARITY);
    13ec:	810205b7          	lui	a1,0x81020
    13f0:	08958513          	addi	a0,a1,137 # 81020089 <__heap_end+0x60fa0089>
}
    13f4:	4402                	lw	s0,0(sp)
    13f6:	0111                	addi	sp,sp,4
    13f8:	8082                	ret
            addr->LCR &= (~LCR_PARITY_ENABLE);
    13fa:	4540                	lw	s0,12(a0)
    13fc:	ff747313          	andi	t1,s0,-9
    1400:	00652623          	sw	t1,12(a0)
    if (ret < 0) {
    1404:	b78d                	j	1366 <csi_usart_config+0x1a0>
    WAIT_USART_IDLE(addr);
    1406:	000f42b7          	lui	t0,0xf4
    140a:	24028393          	addi	t2,t0,576 # f4240 <__erodata+0xed408>
    140e:	e27687e3          	beq	a3,t2,123c <csi_usart_config+0x76>
    switch (stopbit) {
    1412:	c76d                	beqz	a4,14fc <csi_usart_config+0x336>
    1414:	4405                	li	s0,1
    1416:	0c871263          	bne	a4,s0,14da <csi_usart_config+0x314>
            addr->LCR |= LCR_STOP_BIT2;
    141a:	4554                	lw	a3,12(a0)
    141c:	0046e613          	ori	a2,a3,4
    1420:	c550                	sw	a2,12(a0)
    WAIT_USART_IDLE(addr);
    1422:	07c52303          	lw	t1,124(a0)
    1426:	00137293          	andi	t0,t1,1
    142a:	08028863          	beqz	t0,14ba <csi_usart_config+0x2f4>
    142e:	000f43b7          	lui	t2,0xf4
    1432:	4701                	li	a4,0
    1434:	24038593          	addi	a1,t2,576 # f4240 <__erodata+0xed408>
    1438:	5d74                	lw	a3,124(a0)
    143a:	0705                	addi	a4,a4,1
    143c:	843a                	mv	s0,a4
    143e:	0016f613          	andi	a2,a3,1
    1442:	c635                	beqz	a2,14ae <csi_usart_config+0x2e8>
    1444:	07c52303          	lw	t1,124(a0)
    1448:	0705                	addi	a4,a4,1
    144a:	00137293          	andi	t0,t1,1
    144e:	06028063          	beqz	t0,14ae <csi_usart_config+0x2e8>
    1452:	07c52383          	lw	t2,124(a0)
    1456:	00240713          	addi	a4,s0,2
    145a:	0013f693          	andi	a3,t2,1
    145e:	caa1                	beqz	a3,14ae <csi_usart_config+0x2e8>
    1460:	5d70                	lw	a2,124(a0)
    1462:	00340713          	addi	a4,s0,3
    1466:	00167313          	andi	t1,a2,1
    146a:	04030263          	beqz	t1,14ae <csi_usart_config+0x2e8>
    146e:	07c52283          	lw	t0,124(a0)
    1472:	00440713          	addi	a4,s0,4
    1476:	0012f393          	andi	t2,t0,1
    147a:	02038a63          	beqz	t2,14ae <csi_usart_config+0x2e8>
    147e:	5d74                	lw	a3,124(a0)
    1480:	00540713          	addi	a4,s0,5
    1484:	0016f613          	andi	a2,a3,1
    1488:	c21d                	beqz	a2,14ae <csi_usart_config+0x2e8>
    148a:	07c52303          	lw	t1,124(a0)
    148e:	00640713          	addi	a4,s0,6
    1492:	00137293          	andi	t0,t1,1
    1496:	00028c63          	beqz	t0,14ae <csi_usart_config+0x2e8>
    149a:	00740713          	addi	a4,s0,7
    149e:	5d60                	lw	s0,124(a0)
    14a0:	00147393          	andi	t2,s0,1
    14a4:	00038563          	beqz	t2,14ae <csi_usart_config+0x2e8>
    14a8:	f8b718e3          	bne	a4,a1,1438 <csi_usart_config+0x272>
    14ac:	bb41                	j	123c <csi_usart_config+0x76>
    14ae:	000f45b7          	lui	a1,0xf4
    14b2:	24058693          	addi	a3,a1,576 # f4240 <__erodata+0xed408>
    14b6:	d8d703e3          	beq	a4,a3,123c <csi_usart_config+0x76>
    switch (databits) {
    14ba:	4605                	li	a2,1
    14bc:	04c78c63          	beq	a5,a2,1514 <csi_usart_config+0x34e>
    14c0:	c7b5                	beqz	a5,152c <csi_usart_config+0x366>
    14c2:	4589                	li	a1,2
    14c4:	06b78b63          	beq	a5,a1,153a <csi_usart_config+0x374>
    14c8:	428d                	li	t0,3
    14ca:	02579e63          	bne	a5,t0,1506 <csi_usart_config+0x340>
            addr->LCR |= LCR_WORD_SIZE_8;
    14ce:	4558                	lw	a4,12(a0)
    14d0:	00376413          	ori	s0,a4,3
    14d4:	c540                	sw	s0,12(a0)
    return 0;
    14d6:	4501                	li	a0,0
    14d8:	bf31                	j	13f4 <csi_usart_config+0x22e>
}
    14da:	4402                	lw	s0,0(sp)
            return ERR_USART(USART_ERROR_STOP_BITS);
    14dc:	810203b7          	lui	t2,0x81020
    14e0:	08a38513          	addi	a0,t2,138 # 8102008a <__heap_end+0x60fa008a>
}
    14e4:	0111                	addi	sp,sp,4
    14e6:	8082                	ret
            addr->LCR |= LCR_PARITY_ENABLE;
    14e8:	4554                	lw	a3,12(a0)
    14ea:	0086e613          	ori	a2,a3,8
    14ee:	c550                	sw	a2,12(a0)
            addr->LCR |= LCR_PARITY_EVEN;
    14f0:	454c                	lw	a1,12(a0)
    14f2:	0105e293          	ori	t0,a1,16
    14f6:	00552623          	sw	t0,12(a0)
    if (ret < 0) {
    14fa:	b5b5                	j	1366 <csi_usart_config+0x1a0>
            addr->LCR &= LCR_STOP_BIT1;
    14fc:	4558                	lw	a4,12(a0)
    14fe:	0fb77593          	andi	a1,a4,251
    1502:	c54c                	sw	a1,12(a0)
    if (ret < 0) {
    1504:	bf39                	j	1422 <csi_usart_config+0x25c>
}
    1506:	4402                	lw	s0,0(sp)
            return ERR_USART(USART_ERROR_DATA_BITS);
    1508:	81020537          	lui	a0,0x81020
    150c:	08850513          	addi	a0,a0,136 # 81020088 <__heap_end+0x60fa0088>
}
    1510:	0111                	addi	sp,sp,4
    1512:	8082                	ret
            addr->LCR &= 0xfd;
    1514:	455c                	lw	a5,12(a0)
    1516:	0fd7f313          	andi	t1,a5,253
    151a:	00652623          	sw	t1,12(a0)
            addr->LCR |= LCR_WORD_SIZE_6;
    151e:	00c52283          	lw	t0,12(a0)
    1522:	0012e713          	ori	a4,t0,1
    1526:	c558                	sw	a4,12(a0)
    return 0;
    1528:	4501                	li	a0,0
    152a:	b5e9                	j	13f4 <csi_usart_config+0x22e>
            addr->LCR &= LCR_WORD_SIZE_5;
    152c:	4540                	lw	s0,12(a0)
    152e:	0fc47393          	andi	t2,s0,252
    1532:	00752623          	sw	t2,12(a0)
    return 0;
    1536:	4501                	li	a0,0
    1538:	bd75                	j	13f4 <csi_usart_config+0x22e>
            addr->LCR &= 0xfe;
    153a:	4554                	lw	a3,12(a0)
    153c:	0fe6f613          	andi	a2,a3,254
    1540:	c550                	sw	a2,12(a0)
            addr->LCR |= LCR_WORD_SIZE_7;
    1542:	455c                	lw	a5,12(a0)
    1544:	0027e313          	ori	t1,a5,2
    1548:	00652623          	sw	t1,12(a0)
    return 0;
    154c:	4501                	li	a0,0
    154e:	b55d                	j	13f4 <csi_usart_config+0x22e>
    return ERR_USART(USART_ERROR_MODE);
    1550:	81020637          	lui	a2,0x81020
    1554:	08660513          	addi	a0,a2,134 # 81020086 <__heap_end+0x60fa0086>
    1558:	bd71                	j	13f4 <csi_usart_config+0x22e>
    USART_NULL_PARAM_CHK(handle);
    155a:	81020637          	lui	a2,0x81020
    155e:	08460513          	addi	a0,a2,132 # 81020084 <__heap_end+0x60fa0084>
}
    1562:	8082                	ret

00001564 <target_usart_init>:
  \brief       get usart instance.
  \return      pointer to usart instance
*/
int32_t target_usart_init(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= sizeof(s_usart_pin_map) / sizeof(usart_pin_map_t)) {
    1564:	e519                	bnez	a0,1572 <target_usart_init+0xe>
        return -1;
    }

    *base = sg_usart_config[s_usart_pin_map[idx].cfg_idx].base;
    1566:	400157b7          	lui	a5,0x40015
    156a:	c19c                	sw	a5,0(a1)
    *irq = sg_usart_config[s_usart_pin_map[idx].cfg_idx].irq;
    156c:	00062023          	sw	zero,0(a2)
    return s_usart_pin_map[idx].cfg_idx;
    1570:	8082                	ret
        return -1;
    1572:	557d                	li	a0,-1
}
    1574:	8082                	ret

00001576 <target_get_timer>:
    return CONFIG_TIMER_NUM;
}

int32_t target_get_timer(int32_t idx, uint32_t *base, uint32_t *irq)
{
    if (idx >= target_get_timer_count()) {
    1576:	478d                	li	a5,3
    1578:	02a7c063          	blt	a5,a0,1598 <target_get_timer+0x22>
        return NULL;
    }

    *base = sg_timer_config[idx].base;
    157c:	629d                	lui	t0,0x7
    157e:	00351713          	slli	a4,a0,0x3
    1582:	86c28313          	addi	t1,t0,-1940 # 686c <sg_timer_config>
    1586:	00e303b3          	add	t2,t1,a4
    158a:	0003a683          	lw	a3,0(t2)
    158e:	c194                	sw	a3,0(a1)
    *irq = sg_timer_config[idx].irq;
    1590:	0043a583          	lw	a1,4(t2)
    1594:	c20c                	sw	a1,0(a2)
    return idx;
    1596:	8082                	ret
        return NULL;
    1598:	4501                	li	a0,0
}
    159a:	8082                	ret

0000159c <SystemInit>:
{
    if ((ticks - 1UL) > CORET_LOAD_RELOAD_Msk) {
        return (1UL);                                                   /* Reload value impossible */
    }

    CORET->LOAD  = (uint32_t)(ticks - 1UL);                           /* set reload register */
    159c:	000317b7          	lui	a5,0x31
    15a0:	e000e737          	lui	a4,0xe000e
    15a4:	d3f78293          	addi	t0,a5,-705 # 30d3f <__erodata+0x29f07>
    15a8:	00572a23          	sw	t0,20(a4) # e000e014 <__heap_end+0xbff8e014>
    CORET->VAL   = 0UL;                                               /* Load the CORET Counter Value */
    15ac:	00072c23          	sw	zero,24(a4)
    CORET->CTRL  = CORET_CTRL_CLKSOURCE_Msk |
    15b0:	431d                	li	t1,7
    csi_vic_enable_irq(CORET_IRQn);
#else
    csi_coret_config(SYSTEM_CLOCK / CONFIG_SYSTICK_HZ, CORET_IRQn);    //for mdelay()
#endif

    SystemCoreClock = SYSTEM_CLOCK;
    15b2:	01313537          	lui	a0,0x1313
    15b6:	00672823          	sw	t1,16(a4)
    15ba:	200003b7          	lui	t2,0x20000
    15be:	d0050593          	addi	a1,a0,-768 # 1312d00 <__erodata+0x130bec8>
    15c2:	00b3a023          	sw	a1,0(t2) # 20000000 <SystemCoreClock>

#ifndef CONFIG_KERNEL_RHINO
#ifndef CONFIG_NUTTXMM_NONE
    extern void mm_heap_initialize(void);
    mm_heap_initialize();
    15c6:	f32ff06f          	j	cf8 <mm_heap_initialize>

000015ca <board_init>:

extern usart_handle_t console_handle;
extern void ioreuse_initial(void);

void board_init(void)
{
    15ca:	1151                	addi	sp,sp,-12
    /* init the console*/
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    15cc:	4581                	li	a1,0
    15ce:	4501                	li	a0,0
{
    15d0:	c406                	sw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    15d2:	3671                	jal	115e <csi_usart_initialize>
    15d4:	200007b7          	lui	a5,0x20000
    /* config the UART */
    csi_usart_config(console_handle, 19200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
}
    15d8:	40a2                	lw	ra,8(sp)
    console_handle = csi_usart_initialize(CONSOLE_IDX, NULL);
    15da:	00a7a823          	sw	a0,16(a5) # 20000010 <__data_end__>
    csi_usart_config(console_handle, 19200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    15de:	6595                	lui	a1,0x5
    15e0:	478d                	li	a5,3
    15e2:	4701                	li	a4,0
    15e4:	4681                	li	a3,0
    15e6:	4601                	li	a2,0
    15e8:	b0058593          	addi	a1,a1,-1280 # 4b00 <core_bench_matrix+0x1108>
}
    15ec:	0131                	addi	sp,sp,12
    csi_usart_config(console_handle, 19200, USART_MODE_ASYNCHRONOUS, USART_PARITY_NONE, USART_STOP_BITS_1, USART_DATA_BITS_8);
    15ee:	bee1                	j	11c6 <csi_usart_config>

000015f0 <start_time>:
	This function will be called right before starting the timed portion of the benchmark.

	Implementation may be capturing a system timer (as implemented in the example code)
	or zeroing some system parameters - e.g. setting the cpu clocks cycles to 0.
*/
void start_time(void) {
    15f0:	1151                	addi	sp,sp,-12
    15f2:	c406                	sw	ra,8(sp)
            return clock_gettime();
    15f4:	20e5                	jal	16dc <clock_gettime>
	GETMYTIME(&start_time_val );
}
    15f6:	40a2                	lw	ra,8(sp)
	GETMYTIME(&start_time_val );
    15f8:	200007b7          	lui	a5,0x20000
    15fc:	02a7a023          	sw	a0,32(a5) # 20000020 <start_time_val>
    1600:	02b7a223          	sw	a1,36(a5)
}
    1604:	0131                	addi	sp,sp,12
    1606:	8082                	ret

00001608 <stop_time>:
	This function will be called right after ending the timed portion of the benchmark.

	Implementation may be capturing a system timer (as implemented in the example code)
	or other system parameters - e.g. reading the current value of cpu cycles counter.
*/
void stop_time(void) {
    1608:	1151                	addi	sp,sp,-12
    160a:	c406                	sw	ra,8(sp)
            return clock_gettime();
    160c:	28c1                	jal	16dc <clock_gettime>
	GETMYTIME(&stop_time_val );
}
    160e:	40a2                	lw	ra,8(sp)
	GETMYTIME(&stop_time_val );
    1610:	200007b7          	lui	a5,0x20000
    1614:	02a7a423          	sw	a0,40(a5) # 20000028 <stop_time_val>
    1618:	02b7a623          	sw	a1,44(a5)
}
    161c:	0131                	addi	sp,sp,12
    161e:	8082                	ret

00001620 <get_time>:
	This methodology is taken to accomodate any hardware or simulated platform.
	The sample implementation returns millisecs by default,
	and the resolution is controlled by <TIMER_RES_DIVIDER>
*/
CORE_TICKS get_time(void) {
	CORE_TICKS elapsed=(CORE_TICKS)(MYTIMEDIFF(stop_time_val, start_time_val));
    1620:	200007b7          	lui	a5,0x20000
    1624:	200002b7          	lui	t0,0x20000
    1628:	0287a503          	lw	a0,40(a5) # 20000028 <stop_time_val>
    162c:	0202a303          	lw	t1,32(t0) # 20000020 <start_time_val>
	return elapsed;
}
    1630:	40650533          	sub	a0,a0,t1
    1634:	8082                	ret

00001636 <time_in_secs>:
	Convert the value returned by get_time to seconds.

	The <secs_ret> type is used to accomodate systems with no support for floating point.
	Default implementation implemented by the EE_TICKS_PER_SEC macro above.
*/
secs_ret time_in_secs(CORE_TICKS ticks) {
    1636:	1151                	addi	sp,sp,-12
    1638:	c406                	sw	ra,8(sp)
	secs_ret retval=((secs_ret)ticks) / (secs_ret)EE_TICKS_PER_SEC;
    163a:	db8ff0ef          	jal	ra,bf2 <__floatunsidf>
    163e:	000077b7          	lui	a5,0x7
    1642:	8907a603          	lw	a2,-1904(a5) # 6890 <sg_timer_config+0x24>
    1646:	8947a683          	lw	a3,-1900(a5)
    164a:	dfffe0ef          	jal	ra,448 <__divdf3>
	return retval;
}
    164e:	40a2                	lw	ra,8(sp)
    1650:	0131                	addi	sp,sp,12
    1652:	8082                	ret

00001654 <portable_init>:
		ee_printf("ERROR! Please define ee_ptr_int to a type that holds a pointer!\n");
	}
	if (sizeof(ee_u32) != 4) {
		ee_printf("ERROR! Please define ee_u32 to a 32b unsigned type!\n");
	}
	p->portable_id=1;
    1654:	4785                	li	a5,1
    1656:	00f50023          	sb	a5,0(a0)
}
    165a:	8082                	ret

0000165c <portable_fini>:
/* Function : portable_fini
	Target specific final code
*/
void portable_fini(core_portable *p)
{
	p->portable_id=0;
    165c:	00050023          	sb	zero,0(a0)
}
    1660:	8082                	ret

00001662 <main>:
    1662:	1151                	addi	sp,sp,-12
    1664:	c406                	sw	ra,8(sp)
    1666:	6be010ef          	jal	ra,2d24 <benchmark_coremark_main>
    166a:	40a2                	lw	ra,8(sp)
    166c:	4501                	li	a0,0
    166e:	0131                	addi	sp,sp,12
    1670:	8082                	ret

00001672 <timer_cb_fun>:
/*
 * Callback function for TIMER0 interrupt, set timer_flag.
 */
static void timer_cb_fun(int32_t idx, timer_event_e event)
{
	SysTimer_LoopCount++;
    1672:	200007b7          	lui	a5,0x20000
    1676:	03078293          	addi	t0,a5,48 # 20000030 <SysTimer_LoopCount>
    167a:	0002a703          	lw	a4,0(t0)
    167e:	00170313          	addi	t1,a4,1
    1682:	0062a023          	sw	t1,0(t0)
}
    1686:	8082                	ret

00001688 <Timer_Open>:
 *start  systimer
 *
 */
void Timer_Open()
{
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    1688:	000015b7          	lui	a1,0x1
{
    168c:	1151                	addi	sp,sp,-12
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    168e:	67258593          	addi	a1,a1,1650 # 1672 <timer_cb_fun>
    1692:	4501                	li	a0,0
{
    1694:	c406                	sw	ra,8(sp)
    1696:	c222                	sw	s0,4(sp)
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    1698:	80dff0ef          	jal	ra,ea4 <csi_timer_initialize>
    169c:	20000437          	lui	s0,0x20000
    16a0:	03440413          	addi	s0,s0,52 # 20000034 <timer_handle>
    csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    16a4:	4585                	li	a1,1
    timer_handle = csi_timer_initialize(0, timer_cb_fun);
    16a6:	c008                	sw	a0,0(s0)
    csi_timer_config(timer_handle, TIMER_MODE_RELOAD);
    16a8:	38fd                	jal	fa6 <csi_timer_config>
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    16aa:	4008                	lw	a0,0(s0)
}
    16ac:	4412                	lw	s0,4(sp)
    16ae:	40a2                	lw	ra,8(sp)
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    16b0:	05f5e2b7          	lui	t0,0x5f5e
    16b4:	10028593          	addi	a1,t0,256 # 5f5e100 <__erodata+0x5f572c8>
}
    16b8:	0131                	addi	sp,sp,12
    csi_timer_set_timeout(timer_handle, TIMER_LOADTIMER);
    16ba:	ba35                	j	ff6 <csi_timer_set_timeout>

000016bc <Timer_Start>:

void Timer_Start()
{
    csi_timer_start(timer_handle);
    16bc:	200007b7          	lui	a5,0x20000
    16c0:	0347a503          	lw	a0,52(a5) # 20000034 <timer_handle>
    16c4:	b291                	j	1008 <csi_timer_start>

000016c6 <Timer_Stop>:
}
void Timer_Stop()
{
    csi_timer_stop(timer_handle);
    16c6:	200007b7          	lui	a5,0x20000
    16ca:	0347a503          	lw	a0,52(a5) # 20000034 <timer_handle>
    16ce:	bac1                	j	109e <csi_timer_stop>

000016d0 <Timer_Close>:
}

void Timer_Close()
{
    csi_timer_uninitialize(timer_handle);
    16d0:	200007b7          	lui	a5,0x20000
    16d4:	0347a503          	lw	a0,52(a5) # 20000034 <timer_handle>
    16d8:	879ff06f          	j	f50 <csi_timer_uninitialize>

000016dc <clock_gettime>:
  csi_timer_get_current_value (timer_handle, &cv);
    16dc:	200007b7          	lui	a5,0x20000
    16e0:	0347a503          	lw	a0,52(a5) # 20000034 <timer_handle>
}

/* time(uS) since run */
unsigned long long  clock_gettime()
{
    16e4:	1141                	addi	sp,sp,-16
  csi_timer_get_current_value (timer_handle, &cv);
    16e6:	858a                	mv	a1,sp
{
    16e8:	c606                	sw	ra,12(sp)
  csi_timer_get_current_value (timer_handle, &cv);
    16ea:	3add                	jal	10e0 <csi_timer_get_current_value>
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    16ec:	200002b7          	lui	t0,0x20000
    16f0:	0302a303          	lw	t1,48(t0) # 20000030 <SysTimer_LoopCount>
    16f4:	77359737          	lui	a4,0x77359
    16f8:	40170513          	addi	a0,a4,1025 # 77359401 <__heap_end+0x572d9401>
    16fc:	00130393          	addi	t2,t1,1
    1700:	02a385b3          	mul	a1,t2,a0
    1704:	4682                	lw	a3,0(sp)
    1706:	fff6c793          	not	a5,a3

    unsigned long long  systimer_val, systimer_us;
    systimer_val = Timer_CurrentValue();
    systimer_us  = systimer_val * 1000000/ APB_FREQ;
    170a:	4681                	li	a3,0
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    170c:	02a3b633          	mulhu	a2,t2,a0
    1710:	00f582b3          	add	t0,a1,a5
    1714:	00b2b333          	sltu	t1,t0,a1
    systimer_us  = systimer_val * 1000000/ APB_FREQ;
    1718:	000f4537          	lui	a0,0xf4
  return (unsigned long long)(SysTimer_LoopCount + 1) * (TIMER_LOADCOUNT + 1) - cv -1;
    171c:	fff60393          	addi	t2,a2,-1
    1720:	00730733          	add	a4,t1,t2
    systimer_us  = systimer_val * 1000000/ APB_FREQ;
    1724:	24050313          	addi	t1,a0,576 # f4240 <__erodata+0xed408>
    1728:	026705b3          	mul	a1,a4,t1
    172c:	01313637          	lui	a2,0x1313
    1730:	d0060613          	addi	a2,a2,-768 # 1312d00 <__erodata+0x130bec8>
    1734:	0262b7b3          	mulhu	a5,t0,t1
    1738:	02628533          	mul	a0,t0,t1
    173c:	95be                	add	a1,a1,a5
    173e:	9a7fe0ef          	jal	ra,e4 <__udivdi3>
    return  systimer_us;
}
    1742:	40b2                	lw	ra,12(sp)
    1744:	0141                	addi	sp,sp,16
    1746:	8082                	ret

00001748 <putchar>:
 * ch: the char need to display
 */
int putchar(int ch)
{
//  while(CK_Uart_PutChar(consoleuart,ch) != SUCCESS);
return fputc(ch, 0);
    1748:	4581                	li	a1,0
    174a:	f20ff06f          	j	e6a <fputc>

0000174e <puts>:
/*
 * display a string on the console
 * ptr: the string need to display
 */
int puts(const char *ptr)
{
    174e:	1151                	addi	sp,sp,-12
    1750:	c222                	sw	s0,4(sp)
    1752:	c406                	sw	ra,8(sp)
    1754:	842a                	mv	s0,a0
   while(*ptr !='\0')
    1756:	00054503          	lbu	a0,0(a0)
    175a:	c135                	beqz	a0,17be <puts+0x70>
   {
  //   if (SUCCESS == CK_Uart_PutChar(consoleuart,*ptr))
       fputc(*ptr, 0);
    175c:	4581                	li	a1,0
    175e:	f0cff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1762:	00144503          	lbu	a0,1(s0)
    1766:	cd21                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    1768:	4581                	li	a1,0
    176a:	f00ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    176e:	00244503          	lbu	a0,2(s0)
    1772:	c531                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    1774:	4581                	li	a1,0
    1776:	ef4ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    177a:	00344503          	lbu	a0,3(s0)
    177e:	c121                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    1780:	4581                	li	a1,0
    1782:	ee8ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1786:	00444503          	lbu	a0,4(s0)
    178a:	c915                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    178c:	4581                	li	a1,0
    178e:	edcff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1792:	00544503          	lbu	a0,5(s0)
    1796:	c505                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    1798:	4581                	li	a1,0
    179a:	ed0ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    179e:	00644503          	lbu	a0,6(s0)
    17a2:	cd11                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    17a4:	4581                	li	a1,0
    17a6:	ec4ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    17aa:	00744503          	lbu	a0,7(s0)
    17ae:	c901                	beqz	a0,17be <puts+0x70>
       fputc(*ptr, 0);
    17b0:	4581                	li	a1,0
    17b2:	eb8ff0ef          	jal	ra,e6a <fputc>
       ptr++;
    17b6:	0421                	addi	s0,s0,8
   while(*ptr !='\0')
    17b8:	00044503          	lbu	a0,0(s0)
    17bc:	f145                	bnez	a0,175c <puts+0xe>
   }
 //  CK_Uart_PutChar(consoleuart,'\n');
   fputc('\n', 0);
    17be:	4581                	li	a1,0
    17c0:	4529                	li	a0,10
    17c2:	ea8ff0ef          	jal	ra,e6a <fputc>
   return 0;
}
    17c6:	40a2                	lw	ra,8(sp)
    17c8:	4412                	lw	s0,4(sp)
    17ca:	4501                	li	a0,0
    17cc:	0131                	addi	sp,sp,12
    17ce:	8082                	ret

000017d0 <printf>:

/*
 * print the result after translated according to the format
 */
int printf ( const char *fmt, ... )
{
    17d0:	f8c10113          	addi	sp,sp,-116
    17d4:	d8be                	sw	a5,112(sp)
    17d6:	ce86                	sw	ra,92(sp)
    17d8:	cca2                	sw	s0,88(sp)
    17da:	caa6                	sw	s1,84(sp)
    17dc:	d0ae                	sw	a1,96(sp)
    17de:	d2b2                	sw	a2,100(sp)
    17e0:	d4b6                	sw	a3,104(sp)
    17e2:	d6ba                	sw	a4,108(sp)
    17e4:	c02a                	sw	a0,0(sp)
  unsigned int        ptr;
  char       ch, buf[64], *pbuf;
  va_list    ap;

  va_start(ap, fmt);
  while (*fmt) 
    17e6:	00054503          	lbu	a0,0(a0)
  va_start(ap, fmt);
    17ea:	109c                	addi	a5,sp,96
    17ec:	c83e                	sw	a5,16(sp)
  while (*fmt) 
    17ee:	02050ee3          	beqz	a0,202a <printf+0x85a>
  {
    if (*fmt != '%')
    17f2:	02500093          	li	ra,37
    17f6:	041515e3          	bne	a0,ra,2040 <printf+0x870>
    {
      putchar(*fmt++);
      continue;
    }

    switch (*++fmt)
    17fa:	4282                	lw	t0,0(sp)
    17fc:	4755                	li	a4,21
    17fe:	0012c503          	lbu	a0,1(t0)
    1802:	f9d50313          	addi	t1,a0,-99
    1806:	0ff37393          	andi	t2,t1,255
    180a:	027767e3          	bltu	a4,t2,2038 <printf+0x868>
    180e:	649d                	lui	s1,0x7
    1810:	00239413          	slli	s0,t2,0x2
    1814:	89848593          	addi	a1,s1,-1896 # 6898 <sg_timer_config+0x2c>
    1818:	00b40633          	add	a2,s0,a1
    181c:	4214                	lw	a3,0(a2)
    181e:	8682                	jr	a3
         }
         pbuf = numtostring((unsigned int)value, 10, buf);
         puts_without_enter(pbuf);
         break;
       case 'x':
         value = va_arg(ap,int);
    1820:	4542                	lw	a0,16(sp)
    1822:	000070b7          	lui	ra,0x7
    1826:	8f008593          	addi	a1,ra,-1808 # 68f0 <sg_timer_config+0x84>
         pbuf = numtostring((unsigned int)value, 16, buf);
    182a:	4110                	lw	a2,0(a0)
  *buf = 0;
    182c:	0854                	addi	a3,sp,20
         value = va_arg(ap,int);
    182e:	00450793          	addi	a5,a0,4
    *buf ++ = "0123456789abcdef"[uq % base];
    1832:	00f67293          	andi	t0,a2,15
    1836:	00558333          	add	t1,a1,t0
    183a:	00034383          	lbu	t2,0(t1)
  *buf = 0;
    183e:	00010a23          	sb	zero,20(sp)
    *buf ++ = "0123456789abcdef"[uq % base];
    1842:	00168493          	addi	s1,a3,1
         value = va_arg(ap,int);
    1846:	c83e                	sw	a5,16(sp)
  int n = 0, i;
    1848:	4701                	li	a4,0
  } while (uq /= base);
    184a:	443d                	li	s0,15
    *buf ++ = "0123456789abcdef"[uq % base];
    184c:	fe748fa3          	sb	t2,-1(s1)
    n++;
    1850:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    1854:	00465093          	srli	ra,a2,0x4
    1858:	12c47063          	bleu	a2,s0,1978 <printf+0x1a8>
    n++;
    185c:	853e                	mv	a0,a5
    185e:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1860:	00f0f793          	andi	a5,ra,15
    1864:	00f582b3          	add	t0,a1,a5
    1868:	0002c383          	lbu	t2,0(t0)
  } while (uq /= base);
    186c:	8326                	mv	t1,s1
    186e:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1870:	0485                	addi	s1,s1,1
    1872:	fe748fa3          	sb	t2,-1(s1)
    n++;
    1876:	00150793          	addi	a5,a0,1
  } while (uq /= base);
    187a:	00865393          	srli	t2,a2,0x8
    187e:	0e147d63          	bleu	ra,s0,1978 <printf+0x1a8>
    *buf ++ = "0123456789abcdef"[uq % base];
    1882:	00f3f093          	andi	ra,t2,15
    n++;
    1886:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1888:	001587b3          	add	a5,a1,ra
    188c:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1890:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1892:	0485                	addi	s1,s1,1
    1894:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1898:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    189c:	00c65093          	srli	ra,a2,0xc
    18a0:	0c747c63          	bleu	t2,s0,1978 <printf+0x1a8>
    *buf ++ = "0123456789abcdef"[uq % base];
    18a4:	00f0f393          	andi	t2,ra,15
    18a8:	007587b3          	add	a5,a1,t2
    18ac:	0007c283          	lbu	t0,0(a5)
    18b0:	00330493          	addi	s1,t1,3
    n++;
    18b4:	00250713          	addi	a4,a0,2
    *buf ++ = "0123456789abcdef"[uq % base];
    18b8:	fe548fa3          	sb	t0,-1(s1)
  } while (uq /= base);
    18bc:	00230693          	addi	a3,t1,2
    n++;
    18c0:	00350793          	addi	a5,a0,3
  } while (uq /= base);
    18c4:	01065393          	srli	t2,a2,0x10
    18c8:	0a147863          	bleu	ra,s0,1978 <printf+0x1a8>
    *buf ++ = "0123456789abcdef"[uq % base];
    18cc:	00f3f093          	andi	ra,t2,15
    n++;
    18d0:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    18d2:	001587b3          	add	a5,a1,ra
    18d6:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    18da:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    18dc:	00430493          	addi	s1,t1,4
    18e0:	fe548fa3          	sb	t0,-1(s1)
    n++;
    18e4:	00450793          	addi	a5,a0,4
  } while (uq /= base);
    18e8:	01465093          	srli	ra,a2,0x14
    18ec:	08747663          	bleu	t2,s0,1978 <printf+0x1a8>
    *buf ++ = "0123456789abcdef"[uq % base];
    18f0:	00f0f393          	andi	t2,ra,15
    n++;
    18f4:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    18f6:	007587b3          	add	a5,a1,t2
    18fa:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    18fe:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1900:	00530493          	addi	s1,t1,5
    1904:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1908:	00550793          	addi	a5,a0,5
  } while (uq /= base);
    190c:	01865393          	srli	t2,a2,0x18
    1910:	06147463          	bleu	ra,s0,1978 <printf+0x1a8>
    *buf ++ = "0123456789abcdef"[uq % base];
    1914:	00f3f093          	andi	ra,t2,15
    n++;
    1918:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    191a:	001587b3          	add	a5,a1,ra
    191e:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1922:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1924:	00630493          	addi	s1,t1,6
    1928:	fe548fa3          	sb	t0,-1(s1)
    n++;
    192c:	00650793          	addi	a5,a0,6
  } while (uq /= base);
    1930:	8271                	srli	a2,a2,0x1c
    1932:	04747363          	bleu	t2,s0,1978 <printf+0x1a8>
    1936:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1938:	00730493          	addi	s1,t1,7
    193c:	00c58333          	add	t1,a1,a2
    1940:	00034383          	lbu	t2,0(t1)
    n++;
    1944:	873e                	mv	a4,a5
    1946:	00750793          	addi	a5,a0,7
    *buf ++ = "0123456789abcdef"[uq % base];
    194a:	fe748fa3          	sb	t2,-1(s1)
  } while (uq /= base);
    194e:	02c47563          	bleu	a2,s0,1978 <printf+0x1a8>
    1952:	4601                	li	a2,0
    *buf ++ = "0123456789abcdef"[uq % base];
    1954:	00f67293          	andi	t0,a2,15
    1958:	00558333          	add	t1,a1,t0
    195c:	00034383          	lbu	t2,0(t1)
  } while (uq /= base);
    1960:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1962:	00168493          	addi	s1,a3,1
    n++;
    1966:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1968:	fe748fa3          	sb	t2,-1(s1)
    n++;
    196c:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    1970:	00465093          	srli	ra,a2,0x4
    1974:	eec464e3          	bltu	s0,a2,185c <printf+0x8c>
  p[n] = '\0';
    1978:	084c                	addi	a1,sp,20
    197a:	00f58533          	add	a0,a1,a5
    197e:	00050023          	sb	zero,0(a0)
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1982:	409d                	li	ra,7
  p0 = ++buf;
    1984:	00268413          	addi	s0,a3,2
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1988:	02f0c3e3          	blt	ra,a5,21ae <printf+0x9de>
    198c:	c636                	sw	a3,12(sp)
    for (i = 0; i < 8 - n; i++)
    198e:	46a1                	li	a3,8
    1990:	40f685b3          	sub	a1,a3,a5
    1994:	862e                	mv	a2,a1
    1996:	c22e                	sw	a1,4(sp)
    1998:	8522                	mv	a0,s0
    199a:	03000593          	li	a1,48
    199e:	c43e                	sw	a5,8(sp)
    19a0:	e9cfe0ef          	jal	ra,3c <memset>
      p0[i] = p[8 - i - 1];
    19a4:	4712                	lw	a4,4(sp)
    19a6:	439d                	li	t2,7
    19a8:	05410293          	addi	t0,sp,84
    19ac:	40e38633          	sub	a2,t2,a4
    19b0:	00c28533          	add	a0,t0,a2
    19b4:	fc054303          	lbu	t1,-64(a0)
    for (; i < 8; i++)
    19b8:	42a2                	lw	t0,8(sp)
      p0[i] = p[8 - i - 1];
    19ba:	00e407b3          	add	a5,s0,a4
    for (; i < 8; i++)
    19be:	46a5                	li	a3,9
    19c0:	40568633          	sub	a2,a3,t0
      p0[i] = p[8 - i - 1];
    19c4:	00678023          	sb	t1,0(a5)
    for (; i < 8; i++)
    19c8:	4721                	li	a4,8
    19ca:	46b2                	lw	a3,12(sp)
    19cc:	0ae60263          	beq	a2,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    19d0:	40c380b3          	sub	ra,t2,a2
    19d4:	08c8                	addi	a0,sp,84
    19d6:	001505b3          	add	a1,a0,ra
    19da:	fc05c303          	lbu	t1,-64(a1)
    19de:	00c407b3          	add	a5,s0,a2
    for (; i < 8; i++)
    19e2:	4629                	li	a2,10
      p0[i] = p[8 - i - 1];
    19e4:	00678023          	sb	t1,0(a5)
    for (; i < 8; i++)
    19e8:	405600b3          	sub	ra,a2,t0
    19ec:	08e08263          	beq	ra,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    19f0:	401385b3          	sub	a1,t2,ra
    19f4:	00b50333          	add	t1,a0,a1
    19f8:	fc034783          	lbu	a5,-64(t1)
    19fc:	00140633          	add	a2,s0,ra
    for (; i < 8; i++)
    1a00:	40ad                	li	ra,11
      p0[i] = p[8 - i - 1];
    1a02:	00f60023          	sb	a5,0(a2)
    for (; i < 8; i++)
    1a06:	40508333          	sub	t1,ra,t0
    1a0a:	06e30363          	beq	t1,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    1a0e:	406385b3          	sub	a1,t2,t1
    1a12:	00b507b3          	add	a5,a0,a1
    1a16:	fc07c083          	lbu	ra,-64(a5)
    1a1a:	00640633          	add	a2,s0,t1
    for (; i < 8; i++)
    1a1e:	4331                	li	t1,12
      p0[i] = p[8 - i - 1];
    1a20:	00160023          	sb	ra,0(a2)
    for (; i < 8; i++)
    1a24:	405307b3          	sub	a5,t1,t0
    1a28:	04e78463          	beq	a5,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    1a2c:	40f385b3          	sub	a1,t2,a5
    1a30:	00b500b3          	add	ra,a0,a1
    1a34:	fc00c303          	lbu	t1,-64(ra)
    1a38:	00f40633          	add	a2,s0,a5
    for (; i < 8; i++)
    1a3c:	47b5                	li	a5,13
      p0[i] = p[8 - i - 1];
    1a3e:	00660023          	sb	t1,0(a2)
    for (; i < 8; i++)
    1a42:	405780b3          	sub	ra,a5,t0
    1a46:	02e08563          	beq	ra,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    1a4a:	401383b3          	sub	t2,t2,ra
    1a4e:	007505b3          	add	a1,a0,t2
    1a52:	fc05c303          	lbu	t1,-64(a1)
    1a56:	00140633          	add	a2,s0,ra
    for (; i < 8; i++)
    1a5a:	47b9                	li	a5,14
      p0[i] = p[8 - i - 1];
    1a5c:	00660023          	sb	t1,0(a2)
    for (; i < 8; i++)
    1a60:	405782b3          	sub	t0,a5,t0
    1a64:	00e28663          	beq	t0,a4,1a70 <printf+0x2a0>
      p0[i] = p[8 - i - 1];
    1a68:	01414703          	lbu	a4,20(sp)
    1a6c:	00e684a3          	sb	a4,9(a3)
    p0[8] = '\0';
    1a70:	000484a3          	sb	zero,9(s1)
    1a74:	01f0006f          	j	2292 <printf+0xac2>
        s = va_arg(ap, const char *);
    1a78:	44c2                	lw	s1,16(sp)
    1a7a:	4080                	lw	s0,0(s1)
    1a7c:	00448093          	addi	ra,s1,4
    1a80:	c806                	sw	ra,16(sp)
   while(*ptr !='\0')
    1a82:	00044503          	lbu	a0,0(s0)
    1a86:	58050963          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1a8a:	4581                	li	a1,0
    1a8c:	bdeff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1a90:	00144503          	lbu	a0,1(s0)
    1a94:	58050263          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1a98:	4581                	li	a1,0
    1a9a:	bd0ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1a9e:	00244503          	lbu	a0,2(s0)
    1aa2:	56050b63          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1aa6:	4581                	li	a1,0
    1aa8:	bc2ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1aac:	00344503          	lbu	a0,3(s0)
    1ab0:	56050463          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1ab4:	4581                	li	a1,0
    1ab6:	bb4ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1aba:	00444503          	lbu	a0,4(s0)
    1abe:	54050d63          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1ac2:	4581                	li	a1,0
    1ac4:	ba6ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1ac8:	00544503          	lbu	a0,5(s0)
    1acc:	54050663          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1ad0:	4581                	li	a1,0
    1ad2:	b98ff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1ad6:	00644503          	lbu	a0,6(s0)
    1ada:	52050f63          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1ade:	4581                	li	a1,0
    1ae0:	b8aff0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1ae4:	00744503          	lbu	a0,7(s0)
    1ae8:	52050863          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1aec:	4581                	li	a1,0
    1aee:	b7cff0ef          	jal	ra,e6a <fputc>
       ptr++;
    1af2:	0421                	addi	s0,s0,8
   while(*ptr !='\0')
    1af4:	00044503          	lbu	a0,0(s0)
    1af8:	f949                	bnez	a0,1a8a <printf+0x2ba>
    1afa:	ab39                	j	2018 <printf+0x848>
//       {     
//          putchar(*s);                              
//        }
//        break;        
       case 'p':
         ptr = (unsigned) va_arg(ap, void *); 
    1afc:	43c2                	lw	t2,16(sp)
    1afe:	000075b7          	lui	a1,0x7
    1b02:	8f058093          	addi	ra,a1,-1808 # 68f0 <sg_timer_config+0x84>
    1b06:	0003a603          	lw	a2,0(t2)
  *buf = 0;
    1b0a:	0854                	addi	a3,sp,20
         ptr = (unsigned) va_arg(ap, void *); 
    1b0c:	00438513          	addi	a0,t2,4
    *buf ++ = "0123456789abcdef"[uq % base];
    1b10:	00f67313          	andi	t1,a2,15
    1b14:	006087b3          	add	a5,ra,t1
    1b18:	0007c283          	lbu	t0,0(a5)
  *buf = 0;
    1b1c:	00010a23          	sb	zero,20(sp)
    *buf ++ = "0123456789abcdef"[uq % base];
    1b20:	00168493          	addi	s1,a3,1
  int n = 0, i;
    1b24:	4701                	li	a4,0
         ptr = (unsigned) va_arg(ap, void *); 
    1b26:	c82a                	sw	a0,16(sp)
  } while (uq /= base);
    1b28:	443d                	li	s0,15
    *buf ++ = "0123456789abcdef"[uq % base];
    1b2a:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1b2e:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    1b32:	00465593          	srli	a1,a2,0x4
    1b36:	12c47063          	bleu	a2,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1b3a:	00f5f393          	andi	t2,a1,15
    n++;
    1b3e:	853e                	mv	a0,a5
    1b40:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1b42:	007087b3          	add	a5,ra,t2
    1b46:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1b4a:	8326                	mv	t1,s1
    1b4c:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1b4e:	0485                	addi	s1,s1,1
    1b50:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1b54:	00150793          	addi	a5,a0,1
  } while (uq /= base);
    1b58:	00865393          	srli	t2,a2,0x8
    1b5c:	0eb47d63          	bleu	a1,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1b60:	00f3f593          	andi	a1,t2,15
    n++;
    1b64:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1b66:	00b087b3          	add	a5,ra,a1
    1b6a:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1b6e:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1b70:	0485                	addi	s1,s1,1
    1b72:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1b76:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    1b7a:	00c65593          	srli	a1,a2,0xc
    1b7e:	0c747c63          	bleu	t2,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1b82:	00f5f393          	andi	t2,a1,15
    1b86:	007087b3          	add	a5,ra,t2
    1b8a:	0007c283          	lbu	t0,0(a5)
    1b8e:	00330493          	addi	s1,t1,3
    n++;
    1b92:	00250713          	addi	a4,a0,2
    *buf ++ = "0123456789abcdef"[uq % base];
    1b96:	fe548fa3          	sb	t0,-1(s1)
  } while (uq /= base);
    1b9a:	00230693          	addi	a3,t1,2
    n++;
    1b9e:	00350793          	addi	a5,a0,3
  } while (uq /= base);
    1ba2:	01065393          	srli	t2,a2,0x10
    1ba6:	0ab47863          	bleu	a1,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1baa:	00f3f593          	andi	a1,t2,15
    n++;
    1bae:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1bb0:	00b087b3          	add	a5,ra,a1
    1bb4:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1bb8:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1bba:	00430493          	addi	s1,t1,4
    1bbe:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1bc2:	00450793          	addi	a5,a0,4
  } while (uq /= base);
    1bc6:	01465593          	srli	a1,a2,0x14
    1bca:	08747663          	bleu	t2,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1bce:	00f5f393          	andi	t2,a1,15
    n++;
    1bd2:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1bd4:	007087b3          	add	a5,ra,t2
    1bd8:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1bdc:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1bde:	00530493          	addi	s1,t1,5
    1be2:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1be6:	00550793          	addi	a5,a0,5
  } while (uq /= base);
    1bea:	01865393          	srli	t2,a2,0x18
    1bee:	06b47463          	bleu	a1,s0,1c56 <printf+0x486>
    *buf ++ = "0123456789abcdef"[uq % base];
    1bf2:	00f3f593          	andi	a1,t2,15
    n++;
    1bf6:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1bf8:	00b087b3          	add	a5,ra,a1
    1bfc:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1c00:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1c02:	00630493          	addi	s1,t1,6
    1c06:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1c0a:	00650793          	addi	a5,a0,6
  } while (uq /= base);
    1c0e:	8271                	srli	a2,a2,0x1c
    1c10:	04747363          	bleu	t2,s0,1c56 <printf+0x486>
    1c14:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1c16:	00730493          	addi	s1,t1,7
    1c1a:	00c08333          	add	t1,ra,a2
    1c1e:	00034383          	lbu	t2,0(t1)
    n++;
    1c22:	873e                	mv	a4,a5
    1c24:	00750793          	addi	a5,a0,7
    *buf ++ = "0123456789abcdef"[uq % base];
    1c28:	fe748fa3          	sb	t2,-1(s1)
  } while (uq /= base);
    1c2c:	02c47563          	bleu	a2,s0,1c56 <printf+0x486>
    1c30:	4601                	li	a2,0
    *buf ++ = "0123456789abcdef"[uq % base];
    1c32:	00f67313          	andi	t1,a2,15
    n++;
    1c36:	873e                	mv	a4,a5
    *buf ++ = "0123456789abcdef"[uq % base];
    1c38:	006087b3          	add	a5,ra,t1
    1c3c:	0007c283          	lbu	t0,0(a5)
  } while (uq /= base);
    1c40:	86a6                	mv	a3,s1
    *buf ++ = "0123456789abcdef"[uq % base];
    1c42:	00168493          	addi	s1,a3,1
    1c46:	fe548fa3          	sb	t0,-1(s1)
    n++;
    1c4a:	00170793          	addi	a5,a4,1
  } while (uq /= base);
    1c4e:	00465593          	srli	a1,a2,0x4
    1c52:	eec464e3          	bltu	s0,a2,1b3a <printf+0x36a>
  p[n] = '\0';
    1c56:	01410093          	addi	ra,sp,20
    1c5a:	00f08533          	add	a0,ra,a5
    1c5e:	00050023          	sb	zero,0(a0)
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1c62:	459d                	li	a1,7
  p0 = ++buf;
    1c64:	00268413          	addi	s0,a3,2
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1c68:	3ef5c463          	blt	a1,a5,2050 <printf+0x880>
    1c6c:	c636                	sw	a3,12(sp)
    for (i = 0; i < 8 - n; i++)
    1c6e:	46a1                	li	a3,8
    1c70:	40f685b3          	sub	a1,a3,a5
    1c74:	862e                	mv	a2,a1
    1c76:	c22e                	sw	a1,4(sp)
    1c78:	8522                	mv	a0,s0
    1c7a:	03000593          	li	a1,48
    1c7e:	c43e                	sw	a5,8(sp)
    1c80:	bbcfe0ef          	jal	ra,3c <memset>
      p0[i] = p[8 - i - 1];
    1c84:	4712                	lw	a4,4(sp)
    1c86:	439d                	li	t2,7
    1c88:	05410293          	addi	t0,sp,84
    1c8c:	40e38633          	sub	a2,t2,a4
    1c90:	00c28533          	add	a0,t0,a2
    1c94:	fc054303          	lbu	t1,-64(a0)
    for (; i < 8; i++)
    1c98:	42a2                	lw	t0,8(sp)
      p0[i] = p[8 - i - 1];
    1c9a:	00e407b3          	add	a5,s0,a4
    for (; i < 8; i++)
    1c9e:	46a5                	li	a3,9
    1ca0:	40568633          	sub	a2,a3,t0
      p0[i] = p[8 - i - 1];
    1ca4:	00678023          	sb	t1,0(a5)
    for (; i < 8; i++)
    1ca8:	4721                	li	a4,8
    1caa:	46b2                	lw	a3,12(sp)
    1cac:	0ae60263          	beq	a2,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1cb0:	40c380b3          	sub	ra,t2,a2
    1cb4:	08c8                	addi	a0,sp,84
    1cb6:	001505b3          	add	a1,a0,ra
    1cba:	fc05c303          	lbu	t1,-64(a1)
    1cbe:	00c407b3          	add	a5,s0,a2
    for (; i < 8; i++)
    1cc2:	4629                	li	a2,10
      p0[i] = p[8 - i - 1];
    1cc4:	00678023          	sb	t1,0(a5)
    for (; i < 8; i++)
    1cc8:	405600b3          	sub	ra,a2,t0
    1ccc:	08e08263          	beq	ra,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1cd0:	401385b3          	sub	a1,t2,ra
    1cd4:	00b50333          	add	t1,a0,a1
    1cd8:	fc034783          	lbu	a5,-64(t1)
    1cdc:	00140633          	add	a2,s0,ra
    for (; i < 8; i++)
    1ce0:	40ad                	li	ra,11
      p0[i] = p[8 - i - 1];
    1ce2:	00f60023          	sb	a5,0(a2)
    for (; i < 8; i++)
    1ce6:	40508333          	sub	t1,ra,t0
    1cea:	06e30363          	beq	t1,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1cee:	406385b3          	sub	a1,t2,t1
    1cf2:	00b507b3          	add	a5,a0,a1
    1cf6:	fc07c083          	lbu	ra,-64(a5)
    1cfa:	00640633          	add	a2,s0,t1
    for (; i < 8; i++)
    1cfe:	4331                	li	t1,12
      p0[i] = p[8 - i - 1];
    1d00:	00160023          	sb	ra,0(a2)
    for (; i < 8; i++)
    1d04:	405307b3          	sub	a5,t1,t0
    1d08:	04e78463          	beq	a5,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1d0c:	40f385b3          	sub	a1,t2,a5
    1d10:	00b500b3          	add	ra,a0,a1
    1d14:	fc00c303          	lbu	t1,-64(ra)
    1d18:	00f40633          	add	a2,s0,a5
    for (; i < 8; i++)
    1d1c:	47b5                	li	a5,13
      p0[i] = p[8 - i - 1];
    1d1e:	00660023          	sb	t1,0(a2)
    for (; i < 8; i++)
    1d22:	405780b3          	sub	ra,a5,t0
    1d26:	02e08563          	beq	ra,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1d2a:	401383b3          	sub	t2,t2,ra
    1d2e:	007505b3          	add	a1,a0,t2
    1d32:	fc05c303          	lbu	t1,-64(a1)
    1d36:	00140633          	add	a2,s0,ra
    for (; i < 8; i++)
    1d3a:	47b9                	li	a5,14
      p0[i] = p[8 - i - 1];
    1d3c:	00660023          	sb	t1,0(a2)
    for (; i < 8; i++)
    1d40:	405782b3          	sub	t0,a5,t0
    1d44:	00e28663          	beq	t0,a4,1d50 <printf+0x580>
      p0[i] = p[8 - i - 1];
    1d48:	01414703          	lbu	a4,20(sp)
    1d4c:	00e684a3          	sb	a4,9(a3)
    p0[8] = '\0';
    1d50:	000484a3          	sb	zero,9(s1)
    1d54:	a6c5                	j	2134 <printf+0x964>
         value = va_arg(ap, int);
    1d56:	44c2                	lw	s1,16(sp)
    1d58:	4080                	lw	s0,0(s1)
    1d5a:	00448093          	addi	ra,s1,4
    1d5e:	c806                	sw	ra,16(sp)
         if (value < 0)
    1d60:	5a044663          	bltz	s0,230c <printf+0xb3c>
         pbuf = numtostring((unsigned int)value, 10, buf);
    1d64:	82a2                	mv	t0,s0
    *buf ++ = "0123456789abcdef"[uq % base];
    1d66:	46a9                	li	a3,10
    1d68:	02d2f733          	remu	a4,t0,a3
    1d6c:	000073b7          	lui	t2,0x7
    1d70:	8f038513          	addi	a0,t2,-1808 # 68f0 <sg_timer_config+0x84>
  *buf = 0;
    1d74:	0850                	addi	a2,sp,20
    1d76:	00010a23          	sb	zero,20(sp)
    *buf ++ = "0123456789abcdef"[uq % base];
    1d7a:	00160593          	addi	a1,a2,1
  int n = 0, i;
    1d7e:	4781                	li	a5,0
  } while (uq /= base);
    1d80:	4325                	li	t1,9
    *buf ++ = "0123456789abcdef"[uq % base];
    1d82:	00e504b3          	add	s1,a0,a4
    1d86:	0004c083          	lbu	ra,0(s1)
    n++;
    1d8a:	00178713          	addi	a4,a5,1
  } while (uq /= base);
    1d8e:	02d2d3b3          	divu	t2,t0,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1d92:	fe158fa3          	sb	ra,-1(a1)
  } while (uq /= base);
    1d96:	12537263          	bleu	t0,t1,1eba <printf+0x6ea>
    n++;
    1d9a:	82ba                	mv	t0,a4
    1d9c:	87ba                	mv	a5,a4
    *buf ++ = "0123456789abcdef"[uq % base];
    1d9e:	00158413          	addi	s0,a1,1
  } while (uq /= base);
    1da2:	862e                	mv	a2,a1
    *buf ++ = "0123456789abcdef"[uq % base];
    1da4:	02d3f733          	remu	a4,t2,a3
    1da8:	00e504b3          	add	s1,a0,a4
    1dac:	0004c083          	lbu	ra,0(s1)
    n++;
    1db0:	00128713          	addi	a4,t0,1
  } while (uq /= base);
    1db4:	02d3d4b3          	divu	s1,t2,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1db8:	fe140fa3          	sb	ra,-1(s0)
  } while (uq /= base);
    1dbc:	0e737f63          	bleu	t2,t1,1eba <printf+0x6ea>
    1dc0:	8622                	mv	a2,s0
    n++;
    1dc2:	87ba                	mv	a5,a4
    *buf ++ = "0123456789abcdef"[uq % base];
    1dc4:	02d4f3b3          	remu	t2,s1,a3
    1dc8:	00750433          	add	s0,a0,t2
    1dcc:	00044703          	lbu	a4,0(s0)
  } while (uq /= base);
    1dd0:	02d4d0b3          	divu	ra,s1,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1dd4:	00e60023          	sb	a4,0(a2)
    n++;
    1dd8:	00178713          	addi	a4,a5,1
  } while (uq /= base);
    1ddc:	0c937f63          	bleu	s1,t1,1eba <printf+0x6ea>
    n++;
    1de0:	00228793          	addi	a5,t0,2
  } while (uq /= base);
    1de4:	00258613          	addi	a2,a1,2
    *buf ++ = "0123456789abcdef"[uq % base];
    1de8:	00358393          	addi	t2,a1,3
    1dec:	02d0f4b3          	remu	s1,ra,a3
    1df0:	00950433          	add	s0,a0,s1
    1df4:	00044703          	lbu	a4,0(s0)
  } while (uq /= base);
    1df8:	02d0d4b3          	divu	s1,ra,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1dfc:	00e58123          	sb	a4,2(a1)
    n++;
    1e00:	00328713          	addi	a4,t0,3
  } while (uq /= base);
    1e04:	0a137b63          	bleu	ra,t1,1eba <printf+0x6ea>
    1e08:	861e                	mv	a2,t2
    n++;
    1e0a:	87ba                	mv	a5,a4
    *buf ++ = "0123456789abcdef"[uq % base];
    1e0c:	00458093          	addi	ra,a1,4
    1e10:	02d4f3b3          	remu	t2,s1,a3
    1e14:	00750433          	add	s0,a0,t2
    1e18:	00044703          	lbu	a4,0(s0)
  } while (uq /= base);
    1e1c:	02d4d433          	divu	s0,s1,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1e20:	00e581a3          	sb	a4,3(a1)
    n++;
    1e24:	00428713          	addi	a4,t0,4
  } while (uq /= base);
    1e28:	08937963          	bleu	s1,t1,1eba <printf+0x6ea>
    n++;
    1e2c:	87ba                	mv	a5,a4
  } while (uq /= base);
    1e2e:	8606                	mv	a2,ra
    *buf ++ = "0123456789abcdef"[uq % base];
    1e30:	00558093          	addi	ra,a1,5
    1e34:	02d474b3          	remu	s1,s0,a3
    1e38:	009503b3          	add	t2,a0,s1
    1e3c:	0003c703          	lbu	a4,0(t2)
  } while (uq /= base);
    1e40:	02d454b3          	divu	s1,s0,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1e44:	00e58223          	sb	a4,4(a1)
    n++;
    1e48:	00528713          	addi	a4,t0,5
  } while (uq /= base);
    1e4c:	06837763          	bleu	s0,t1,1eba <printf+0x6ea>
    n++;
    1e50:	87ba                	mv	a5,a4
  } while (uq /= base);
    1e52:	8606                	mv	a2,ra
    *buf ++ = "0123456789abcdef"[uq % base];
    1e54:	00658093          	addi	ra,a1,6
    1e58:	02d4f433          	remu	s0,s1,a3
    1e5c:	008503b3          	add	t2,a0,s0
    1e60:	0003c703          	lbu	a4,0(t2)
  } while (uq /= base);
    1e64:	02d4d433          	divu	s0,s1,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1e68:	00e582a3          	sb	a4,5(a1)
    n++;
    1e6c:	00628713          	addi	a4,t0,6
  } while (uq /= base);
    1e70:	04937563          	bleu	s1,t1,1eba <printf+0x6ea>
    1e74:	8606                	mv	a2,ra
    n++;
    1e76:	87ba                	mv	a5,a4
    *buf ++ = "0123456789abcdef"[uq % base];
    1e78:	059d                	addi	a1,a1,7
    n++;
    1e7a:	00728713          	addi	a4,t0,7
    *buf ++ = "0123456789abcdef"[uq % base];
    1e7e:	02d474b3          	remu	s1,s0,a3
    1e82:	009500b3          	add	ra,a0,s1
    1e86:	0000c383          	lbu	t2,0(ra)
  } while (uq /= base);
    1e8a:	02d452b3          	divu	t0,s0,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1e8e:	fe758fa3          	sb	t2,-1(a1)
  } while (uq /= base);
    1e92:	02837463          	bleu	s0,t1,1eba <printf+0x6ea>
    n++;
    1e96:	87ba                	mv	a5,a4
  } while (uq /= base);
    1e98:	862e                	mv	a2,a1
    *buf ++ = "0123456789abcdef"[uq % base];
    1e9a:	00160593          	addi	a1,a2,1
    1e9e:	02d2f733          	remu	a4,t0,a3
    1ea2:	00e504b3          	add	s1,a0,a4
    1ea6:	0004c083          	lbu	ra,0(s1)
    n++;
    1eaa:	00178713          	addi	a4,a5,1
  } while (uq /= base);
    1eae:	02d2d3b3          	divu	t2,t0,a3
    *buf ++ = "0123456789abcdef"[uq % base];
    1eb2:	fe158fa3          	sb	ra,-1(a1)
  } while (uq /= base);
    1eb6:	ee5362e3          	bltu	t1,t0,1d9a <printf+0x5ca>
  p[n] = '\0';
    1eba:	97b2                	add	a5,a5,a2
  p0 = ++buf;
    1ebc:	00260413          	addi	s0,a2,2
  p[n] = '\0';
    1ec0:	0848                	addi	a0,sp,20
    1ec2:	00378493          	addi	s1,a5,3
    1ec6:	00e50333          	add	t1,a0,a4
    1eca:	408480b3          	sub	ra,s1,s0
    1ece:	00030023          	sb	zero,0(t1)
  if (base == 16 && n < 8)  //If Hex, the length is fixxed with 8 digitals
    1ed2:	0070f393          	andi	t2,ra,7
    1ed6:	859a                	mv	a1,t1
    1ed8:	86a2                	mv	a3,s0
    1eda:	06038a63          	beqz	t2,1f4e <printf+0x77e>
    1ede:	4285                	li	t0,1
    1ee0:	04538f63          	beq	t2,t0,1f3e <printf+0x76e>
    1ee4:	4509                	li	a0,2
    1ee6:	04a38663          	beq	t2,a0,1f32 <printf+0x762>
    1eea:	478d                	li	a5,3
    1eec:	02f38d63          	beq	t2,a5,1f26 <printf+0x756>
    1ef0:	4091                	li	ra,4
    1ef2:	02138463          	beq	t2,ra,1f1a <printf+0x74a>
    1ef6:	4295                	li	t0,5
    1ef8:	00538b63          	beq	t2,t0,1f0e <printf+0x73e>
    1efc:	4519                	li	a0,6
    1efe:	40a39f63          	bne	t2,a0,231c <printf+0xb4c>
      p0[i] = p[n - i - 1];
    1f02:	fff5c303          	lbu	t1,-1(a1)
    1f06:	0685                	addi	a3,a3,1
    1f08:	15fd                	addi	a1,a1,-1
    1f0a:	fe668fa3          	sb	t1,-1(a3)
    1f0e:	fff5c383          	lbu	t2,-1(a1)
    1f12:	0685                	addi	a3,a3,1
    1f14:	15fd                	addi	a1,a1,-1
    1f16:	fe768fa3          	sb	t2,-1(a3)
    1f1a:	fff5c783          	lbu	a5,-1(a1)
    1f1e:	0685                	addi	a3,a3,1
    1f20:	15fd                	addi	a1,a1,-1
    1f22:	fef68fa3          	sb	a5,-1(a3)
    1f26:	fff5c083          	lbu	ra,-1(a1)
    1f2a:	0685                	addi	a3,a3,1
    1f2c:	15fd                	addi	a1,a1,-1
    1f2e:	fe168fa3          	sb	ra,-1(a3)
    1f32:	fff5c283          	lbu	t0,-1(a1)
    1f36:	0685                	addi	a3,a3,1
    1f38:	15fd                	addi	a1,a1,-1
    1f3a:	fe568fa3          	sb	t0,-1(a3)
    1f3e:	fff5c503          	lbu	a0,-1(a1)
    1f42:	0685                	addi	a3,a3,1
    1f44:	15fd                	addi	a1,a1,-1
    1f46:	fea68fa3          	sb	a0,-1(a3)
    for (i = 0; i < n; i++)
    1f4a:	04d48663          	beq	s1,a3,1f96 <printf+0x7c6>
      p0[i] = p[n - i - 1];
    1f4e:	fff5c303          	lbu	t1,-1(a1)
    1f52:	06a1                	addi	a3,a3,8
    1f54:	15e1                	addi	a1,a1,-8
    1f56:	fe668c23          	sb	t1,-8(a3)
    1f5a:	0065c383          	lbu	t2,6(a1)
    1f5e:	fe768ca3          	sb	t2,-7(a3)
    1f62:	0055c783          	lbu	a5,5(a1)
    1f66:	fef68d23          	sb	a5,-6(a3)
    1f6a:	0045c083          	lbu	ra,4(a1)
    1f6e:	fe168da3          	sb	ra,-5(a3)
    1f72:	0035c283          	lbu	t0,3(a1)
    1f76:	fe568e23          	sb	t0,-4(a3)
    1f7a:	0025c503          	lbu	a0,2(a1)
    1f7e:	fea68ea3          	sb	a0,-3(a3)
    1f82:	0015c303          	lbu	t1,1(a1)
    1f86:	fe668f23          	sb	t1,-2(a3)
    1f8a:	0005c383          	lbu	t2,0(a1)
    1f8e:	fe768fa3          	sb	t2,-1(a3)
    for (i = 0; i < n; i++)
    1f92:	fad49ee3          	bne	s1,a3,1f4e <printf+0x77e>
    p0[n] = '\0';
    1f96:	9722                	add	a4,a4,s0
    1f98:	00070023          	sb	zero,0(a4)
   while(*ptr !='\0')
    1f9c:	00264503          	lbu	a0,2(a2)
    1fa0:	cd25                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fa2:	4581                	li	a1,0
    1fa4:	ec7fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fa8:	00144503          	lbu	a0,1(s0)
    1fac:	c535                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fae:	4581                	li	a1,0
    1fb0:	ebbfe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fb4:	00244503          	lbu	a0,2(s0)
    1fb8:	c125                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fba:	4581                	li	a1,0
    1fbc:	eaffe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fc0:	00344503          	lbu	a0,3(s0)
    1fc4:	c931                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fc6:	4581                	li	a1,0
    1fc8:	ea3fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fcc:	00444503          	lbu	a0,4(s0)
    1fd0:	c521                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fd2:	4581                	li	a1,0
    1fd4:	e97fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fd8:	00544503          	lbu	a0,5(s0)
    1fdc:	cd15                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fde:	4581                	li	a1,0
    1fe0:	e8bfe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1fe4:	00644503          	lbu	a0,6(s0)
    1fe8:	c905                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1fea:	4581                	li	a1,0
    1fec:	e7ffe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    1ff0:	00744503          	lbu	a0,7(s0)
    1ff4:	c115                	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    1ff6:	4581                	li	a1,0
    1ff8:	e73fe0ef          	jal	ra,e6a <fputc>
       ptr++;
    1ffc:	0421                	addi	s0,s0,8
   while(*ptr !='\0')
    1ffe:	00044503          	lbu	a0,0(s0)
    2002:	f145                	bnez	a0,1fa2 <printf+0x7d2>
    2004:	a811                	j	2018 <printf+0x848>
          ch = (unsigned char)va_arg(ap, int);
    2006:	44c2                	lw	s1,16(sp)
return fputc(ch, 0);
    2008:	0004c503          	lbu	a0,0(s1)
          ch = (unsigned char)va_arg(ap, int);
    200c:	00448593          	addi	a1,s1,4
    2010:	c82e                	sw	a1,16(sp)
return fputc(ch, 0);
    2012:	4581                	li	a1,0
    2014:	e57fe0ef          	jal	ra,e6a <fputc>
         break;  
       default:  
         putchar(*fmt);
         break;
    }
    fmt ++;
    2018:	4682                	lw	a3,0(sp)
    201a:	00268093          	addi	ra,a3,2
    201e:	c006                	sw	ra,0(sp)
  while (*fmt) 
    2020:	4502                	lw	a0,0(sp)
    2022:	00054503          	lbu	a0,0(a0)
    2026:	fc051663          	bnez	a0,17f2 <printf+0x22>
  }
  va_end(ap);
  return 0x01;   
}
    202a:	40f6                	lw	ra,92(sp)
    202c:	4466                	lw	s0,88(sp)
    202e:	44d6                	lw	s1,84(sp)
    2030:	4505                	li	a0,1
    2032:	07410113          	addi	sp,sp,116
    2036:	8082                	ret
return fputc(ch, 0);
    2038:	4581                	li	a1,0
    203a:	e31fe0ef          	jal	ra,e6a <fputc>
    203e:	bfe9                	j	2018 <printf+0x848>
      putchar(*fmt++);
    2040:	4282                	lw	t0,0(sp)
return fputc(ch, 0);
    2042:	4581                	li	a1,0
      putchar(*fmt++);
    2044:	00128313          	addi	t1,t0,1
    2048:	c01a                	sw	t1,0(sp)
return fputc(ch, 0);
    204a:	e21fe0ef          	jal	ra,e6a <fputc>
      continue;
    204e:	bfc9                	j	2020 <printf+0x850>
    2050:	9736                	add	a4,a4,a3
    2052:	00370493          	addi	s1,a4,3
    2056:	408482b3          	sub	t0,s1,s0
    205a:	0072f313          	andi	t1,t0,7
    205e:	85aa                	mv	a1,a0
    2060:	8622                	mv	a2,s0
    2062:	08030263          	beqz	t1,20e6 <printf+0x916>
    2066:	4385                	li	t2,1
    2068:	06730763          	beq	t1,t2,20d6 <printf+0x906>
    206c:	4089                	li	ra,2
    206e:	04130e63          	beq	t1,ra,20ca <printf+0x8fa>
    2072:	470d                	li	a4,3
    2074:	04e30563          	beq	t1,a4,20be <printf+0x8ee>
    2078:	4291                	li	t0,4
    207a:	02530c63          	beq	t1,t0,20b2 <printf+0x8e2>
    207e:	4395                	li	t2,5
    2080:	02730363          	beq	t1,t2,20a6 <printf+0x8d6>
    2084:	4099                	li	ra,6
    2086:	00130a63          	beq	t1,ra,209a <printf+0x8ca>
      p0[i] = p[n - i - 1];
    208a:	fff54603          	lbu	a2,-1(a0)
    208e:	fff50593          	addi	a1,a0,-1
    2092:	00c40023          	sb	a2,0(s0)
    2096:	00368613          	addi	a2,a3,3
    209a:	fff5c503          	lbu	a0,-1(a1)
    209e:	0605                	addi	a2,a2,1
    20a0:	15fd                	addi	a1,a1,-1
    20a2:	fea60fa3          	sb	a0,-1(a2)
    20a6:	fff5c303          	lbu	t1,-1(a1)
    20aa:	0605                	addi	a2,a2,1
    20ac:	15fd                	addi	a1,a1,-1
    20ae:	fe660fa3          	sb	t1,-1(a2)
    20b2:	fff5c703          	lbu	a4,-1(a1)
    20b6:	0605                	addi	a2,a2,1
    20b8:	15fd                	addi	a1,a1,-1
    20ba:	fee60fa3          	sb	a4,-1(a2)
    20be:	fff5c283          	lbu	t0,-1(a1)
    20c2:	0605                	addi	a2,a2,1
    20c4:	15fd                	addi	a1,a1,-1
    20c6:	fe560fa3          	sb	t0,-1(a2)
    20ca:	fff5c383          	lbu	t2,-1(a1)
    20ce:	0605                	addi	a2,a2,1
    20d0:	15fd                	addi	a1,a1,-1
    20d2:	fe760fa3          	sb	t2,-1(a2)
    20d6:	fff5c083          	lbu	ra,-1(a1)
    20da:	0605                	addi	a2,a2,1
    20dc:	15fd                	addi	a1,a1,-1
    20de:	fe160fa3          	sb	ra,-1(a2)
    for (i = 0; i < n; i++)
    20e2:	04960663          	beq	a2,s1,212e <printf+0x95e>
      p0[i] = p[n - i - 1];
    20e6:	fff5c503          	lbu	a0,-1(a1)
    20ea:	0621                	addi	a2,a2,8
    20ec:	15e1                	addi	a1,a1,-8
    20ee:	fea60c23          	sb	a0,-8(a2)
    20f2:	0065c303          	lbu	t1,6(a1)
    20f6:	fe660ca3          	sb	t1,-7(a2)
    20fa:	0055c703          	lbu	a4,5(a1)
    20fe:	fee60d23          	sb	a4,-6(a2)
    2102:	0045c283          	lbu	t0,4(a1)
    2106:	fe560da3          	sb	t0,-5(a2)
    210a:	0035c383          	lbu	t2,3(a1)
    210e:	fe760e23          	sb	t2,-4(a2)
    2112:	0025c083          	lbu	ra,2(a1)
    2116:	fe160ea3          	sb	ra,-3(a2)
    211a:	0015c503          	lbu	a0,1(a1)
    211e:	fea60f23          	sb	a0,-2(a2)
    2122:	0005c303          	lbu	t1,0(a1)
    2126:	fe660fa3          	sb	t1,-1(a2)
    for (i = 0; i < n; i++)
    212a:	fa961ee3          	bne	a2,s1,20e6 <printf+0x916>
    p0[n] = '\0';
    212e:	97a2                	add	a5,a5,s0
    2130:	00078023          	sb	zero,0(a5)
   while(*ptr !='\0')
    2134:	0026c503          	lbu	a0,2(a3)
    2138:	ee0500e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    213c:	4581                	li	a1,0
    213e:	d2dfe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    2142:	00144503          	lbu	a0,1(s0)
    2146:	ec0509e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    214a:	4581                	li	a1,0
    214c:	d1ffe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    2150:	00244503          	lbu	a0,2(s0)
    2154:	ec0502e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    2158:	4581                	li	a1,0
    215a:	d11fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    215e:	00344503          	lbu	a0,3(s0)
    2162:	ea050be3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    2166:	4581                	li	a1,0
    2168:	d03fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    216c:	00444503          	lbu	a0,4(s0)
    2170:	ea0504e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    2174:	4581                	li	a1,0
    2176:	cf5fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    217a:	00544503          	lbu	a0,5(s0)
    217e:	e8050de3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    2182:	4581                	li	a1,0
    2184:	ce7fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    2188:	00644503          	lbu	a0,6(s0)
    218c:	e80506e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    2190:	4581                	li	a1,0
    2192:	cd9fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    2196:	00744503          	lbu	a0,7(s0)
    219a:	e6050fe3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    219e:	4581                	li	a1,0
    21a0:	ccbfe0ef          	jal	ra,e6a <fputc>
       ptr++;
    21a4:	0421                	addi	s0,s0,8
   while(*ptr !='\0')
    21a6:	00044503          	lbu	a0,0(s0)
    21aa:	f949                	bnez	a0,213c <printf+0x96c>
    21ac:	b5b5                	j	2018 <printf+0x848>
    21ae:	9736                	add	a4,a4,a3
    21b0:	00370493          	addi	s1,a4,3
    21b4:	408482b3          	sub	t0,s1,s0
    21b8:	0072f313          	andi	t1,t0,7
    21bc:	85aa                	mv	a1,a0
    21be:	8622                	mv	a2,s0
    21c0:	08030263          	beqz	t1,2244 <printf+0xa74>
    21c4:	4385                	li	t2,1
    21c6:	06730763          	beq	t1,t2,2234 <printf+0xa64>
    21ca:	4089                	li	ra,2
    21cc:	04130e63          	beq	t1,ra,2228 <printf+0xa58>
    21d0:	470d                	li	a4,3
    21d2:	04e30563          	beq	t1,a4,221c <printf+0xa4c>
    21d6:	4291                	li	t0,4
    21d8:	02530c63          	beq	t1,t0,2210 <printf+0xa40>
    21dc:	4395                	li	t2,5
    21de:	02730363          	beq	t1,t2,2204 <printf+0xa34>
    21e2:	4099                	li	ra,6
    21e4:	00130a63          	beq	t1,ra,21f8 <printf+0xa28>
      p0[i] = p[n - i - 1];
    21e8:	fff54603          	lbu	a2,-1(a0)
    21ec:	fff50593          	addi	a1,a0,-1
    21f0:	00c40023          	sb	a2,0(s0)
    21f4:	00368613          	addi	a2,a3,3
    21f8:	fff5c503          	lbu	a0,-1(a1)
    21fc:	0605                	addi	a2,a2,1
    21fe:	15fd                	addi	a1,a1,-1
    2200:	fea60fa3          	sb	a0,-1(a2)
    2204:	fff5c303          	lbu	t1,-1(a1)
    2208:	0605                	addi	a2,a2,1
    220a:	15fd                	addi	a1,a1,-1
    220c:	fe660fa3          	sb	t1,-1(a2)
    2210:	fff5c703          	lbu	a4,-1(a1)
    2214:	0605                	addi	a2,a2,1
    2216:	15fd                	addi	a1,a1,-1
    2218:	fee60fa3          	sb	a4,-1(a2)
    221c:	fff5c283          	lbu	t0,-1(a1)
    2220:	0605                	addi	a2,a2,1
    2222:	15fd                	addi	a1,a1,-1
    2224:	fe560fa3          	sb	t0,-1(a2)
    2228:	fff5c383          	lbu	t2,-1(a1)
    222c:	0605                	addi	a2,a2,1
    222e:	15fd                	addi	a1,a1,-1
    2230:	fe760fa3          	sb	t2,-1(a2)
    2234:	fff5c083          	lbu	ra,-1(a1)
    2238:	0605                	addi	a2,a2,1
    223a:	15fd                	addi	a1,a1,-1
    223c:	fe160fa3          	sb	ra,-1(a2)
    for (i = 0; i < n; i++)
    2240:	04960663          	beq	a2,s1,228c <printf+0xabc>
      p0[i] = p[n - i - 1];
    2244:	fff5c503          	lbu	a0,-1(a1)
    2248:	0621                	addi	a2,a2,8
    224a:	15e1                	addi	a1,a1,-8
    224c:	fea60c23          	sb	a0,-8(a2)
    2250:	0065c303          	lbu	t1,6(a1)
    2254:	fe660ca3          	sb	t1,-7(a2)
    2258:	0055c703          	lbu	a4,5(a1)
    225c:	fee60d23          	sb	a4,-6(a2)
    2260:	0045c283          	lbu	t0,4(a1)
    2264:	fe560da3          	sb	t0,-5(a2)
    2268:	0035c383          	lbu	t2,3(a1)
    226c:	fe760e23          	sb	t2,-4(a2)
    2270:	0025c083          	lbu	ra,2(a1)
    2274:	fe160ea3          	sb	ra,-3(a2)
    2278:	0015c503          	lbu	a0,1(a1)
    227c:	fea60f23          	sb	a0,-2(a2)
    2280:	0005c303          	lbu	t1,0(a1)
    2284:	fe660fa3          	sb	t1,-1(a2)
    for (i = 0; i < n; i++)
    2288:	fa961ee3          	bne	a2,s1,2244 <printf+0xa74>
    p0[n] = '\0';
    228c:	97a2                	add	a5,a5,s0
    228e:	00078023          	sb	zero,0(a5)
   while(*ptr !='\0')
    2292:	0026c503          	lbu	a0,2(a3)
    2296:	d80501e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    229a:	4581                	li	a1,0
    229c:	bcffe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22a0:	00144503          	lbu	a0,1(s0)
    22a4:	d6050ae3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22a8:	4581                	li	a1,0
    22aa:	bc1fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22ae:	00244503          	lbu	a0,2(s0)
    22b2:	d60503e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22b6:	4581                	li	a1,0
    22b8:	bb3fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22bc:	00344503          	lbu	a0,3(s0)
    22c0:	d4050ce3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22c4:	4581                	li	a1,0
    22c6:	ba5fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22ca:	00444503          	lbu	a0,4(s0)
    22ce:	d40505e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22d2:	4581                	li	a1,0
    22d4:	b97fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22d8:	00544503          	lbu	a0,5(s0)
    22dc:	d2050ee3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22e0:	4581                	li	a1,0
    22e2:	b89fe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22e6:	00644503          	lbu	a0,6(s0)
    22ea:	d20507e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22ee:	4581                	li	a1,0
    22f0:	b7bfe0ef          	jal	ra,e6a <fputc>
   while(*ptr !='\0')
    22f4:	00744503          	lbu	a0,7(s0)
    22f8:	d20500e3          	beqz	a0,2018 <printf+0x848>
	fputc(*ptr, 0);
    22fc:	4581                	li	a1,0
    22fe:	b6dfe0ef          	jal	ra,e6a <fputc>
       ptr++;
    2302:	0421                	addi	s0,s0,8
   while(*ptr !='\0')
    2304:	00044503          	lbu	a0,0(s0)
    2308:	f949                	bnez	a0,229a <printf+0xaca>
    230a:	b339                	j	2018 <printf+0x848>
return fputc(ch, 0);
    230c:	4581                	li	a1,0
    230e:	02d00513          	li	a0,45
    2312:	b59fe0ef          	jal	ra,e6a <fputc>
            value = 0 - value;
    2316:	40800433          	neg	s0,s0
    231a:	b4a9                	j	1d64 <printf+0x594>
      p0[i] = p[n - i - 1];
    231c:	fff34683          	lbu	a3,-1(t1)
    2320:	fff30593          	addi	a1,t1,-1
    2324:	00d40023          	sb	a3,0(s0)
    2328:	00360693          	addi	a3,a2,3
    232c:	bed9                	j	1f02 <printf+0x732>

0000232e <core_bench_state>:

	Go over the input twice, once direct, and once after introducing some corruption.
*/
ee_u16 core_bench_state(ee_u32 blksize, ee_u8 *memblock,
		ee_s16 seed1, ee_s16 seed2, ee_s16 step, ee_u16 crc)
{
    232e:	f6410113          	addi	sp,sp,-156
    2332:	c926                	sw	s1,144(sp)
    2334:	cd06                	sw	ra,152(sp)
    2336:	cb22                	sw	s0,148(sp)
    2338:	c0be                	sw	a5,64(sp)
#endif
	for (i=0; i<NUM_CORE_STATES; i++) {
		final_counts[i]=track_counts[i]=0;
	}
	/* run the state machine over the input */
	while (*p!=0) {
    233a:	0005c783          	lbu	a5,0(a1)
{
    233e:	c6aa                	sw	a0,76(sp)
    2340:	c2b2                	sw	a2,68(sp)
    2342:	c4b6                	sw	a3,72(sp)
    2344:	da3a                	sw	a4,52(sp)
    2346:	d882                	sw	zero,112(sp)
    2348:	da82                	sw	zero,116(sp)
    234a:	dc82                	sw	zero,120(sp)
    234c:	de82                	sw	zero,124(sp)
    234e:	c102                	sw	zero,128(sp)
    2350:	c302                	sw	zero,132(sp)
    2352:	c502                	sw	zero,136(sp)
    2354:	c702                	sw	zero,140(sp)
    2356:	c882                	sw	zero,80(sp)
    2358:	ca82                	sw	zero,84(sp)
    235a:	cc82                	sw	zero,88(sp)
    235c:	ce82                	sw	zero,92(sp)
    235e:	d082                	sw	zero,96(sp)
    2360:	d282                	sw	zero,100(sp)
    2362:	d482                	sw	zero,104(sp)
    2364:	d682                	sw	zero,108(sp)
    2366:	c002                	sw	zero,0(sp)
    2368:	84ae                	mv	s1,a1
	while (*p!=0) {
    236a:	7c078063          	beqz	a5,2b2a <core_bench_state+0x7fc>
    236e:	5366                	lw	t1,120(sp)
    2370:	5756                	lw	a4,116(sp)
    2372:	438a                	lw	t2,128(sp)
    2374:	441a                	lw	s0,132(sp)
    2376:	5576                	lw	a0,124(sp)
    2378:	45aa                	lw	a1,136(sp)
    237a:	0014c083          	lbu	ra,1(s1)
    237e:	c41a                	sw	t1,8(sp)
    2380:	00148313          	addi	t1,s1,1
    2384:	d03a                	sw	a4,32(sp)
    2386:	ce1e                	sw	t2,28(sp)
    2388:	ca22                	sw	s0,20(sp)
    238a:	c62a                	sw	a0,12(sp)
    238c:	c82e                	sw	a1,16(sp)
	ee_u8 *str=*instr;
	ee_u8 NEXT_SYMBOL;
	enum CORE_STATE state=CORE_START;
	for( ; *str && state != CORE_INVALID; str++ ) {
		NEXT_SYMBOL = *str;
		if (NEXT_SYMBOL==',') /* end of this input */ {
    238e:	de06                	sw	ra,60(sp)
    2390:	dc1a                	sw	t1,56(sp)
    2392:	02c00613          	li	a2,44
    2396:	7ec78a63          	beq	a5,a2,2b8a <core_bench_state+0x85c>
    239a:	c202                	sw	zero,4(sp)
    239c:	8626                	mv	a2,s1
    239e:	873e                	mv	a4,a5
    23a0:	d202                	sw	zero,36(sp)
    23a2:	c002                	sw	zero,0(sp)
    23a4:	cc02                	sw	zero,24(sp)
    23a6:	4401                	li	s0,0
    23a8:	d602                	sw	zero,44(sp)
    23aa:	d402                	sw	zero,40(sp)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    23ac:	4512                	lw	a0,4(sp)
    23ae:	fd070393          	addi	t2,a4,-48
    23b2:	0ff3f693          	andi	a3,t2,255
    23b6:	00150293          	addi	t0,a0,1
    23ba:	c216                	sw	t0,4(sp)
    23bc:	45a5                	li	a1,9
    23be:	26d5e563          	bltu	a1,a3,2628 <core_bench_state+0x2fa>
			break;
		}
		switch(state) {
		case CORE_START:
			if(ee_isdigit(NEXT_SYMBOL)) {
				state = CORE_INT;
    23c2:	4691                	li	a3,4
    23c4:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    23c6:	48008663          	beqz	ra,2852 <core_bench_state+0x524>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    23ca:	02c00713          	li	a4,44
    23ce:	829a                	mv	t0,t1
    23d0:	00130393          	addi	t2,t1,1
    23d4:	74e08563          	beq	ra,a4,2b1e <core_bench_state+0x7f0>
    23d8:	00264303          	lbu	t1,2(a2)
    23dc:	8706                	mv	a4,ra
    23de:	8616                	mv	a2,t0
				state = CORE_INVALID;
				transition_count[CORE_S1]++;
			}
			break;
		case CORE_INT:
			if( NEXT_SYMBOL == '.' ) {
    23e0:	02e00513          	li	a0,46
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    23e4:	42a5                	li	t0,9
		if (NEXT_SYMBOL==',') /* end of this input */ {
    23e6:	02c00093          	li	ra,44
			if( NEXT_SYMBOL == '.' ) {
    23ea:	26a70663          	beq	a4,a0,2656 <core_bench_state+0x328>
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    23ee:	fd070613          	addi	a2,a4,-48
    23f2:	0ff67693          	andi	a3,a2,255
    23f6:	38d2f263          	bleu	a3,t0,277a <core_bench_state+0x44c>
				state = CORE_FLOAT;
				transition_count[CORE_INT]++;
			}
			else if(!ee_isdigit(NEXT_SYMBOL)) {
				state = CORE_INVALID;
				transition_count[CORE_INT]++;
    23fa:	45f2                	lw	a1,28(sp)
    23fc:	4505                	li	a0,1
				state = CORE_INVALID;
    23fe:	4685                	li	a3,1
				transition_count[CORE_INT]++;
    2400:	00158713          	addi	a4,a1,1
    2404:	ce3a                	sw	a4,28(sp)
    2406:	4585                	li	a1,1
    2408:	d62a                	sw	a0,44(sp)
    240a:	871a                	mv	a4,t1
    240c:	861e                	mv	a2,t2
		final_counts[fstate]++;
    240e:	068a                	slli	a3,a3,0x2
    2410:	09010393          	addi	t2,sp,144
    2414:	00d38533          	add	a0,t2,a3
    2418:	fc052083          	lw	ra,-64(a0)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    241c:	02c00293          	li	t0,44
		final_counts[fstate]++;
    2420:	00108313          	addi	t1,ra,1
    2424:	fc652023          	sw	t1,-64(a0)
	while (*p!=0) {
    2428:	c715                	beqz	a4,2454 <core_bench_state+0x126>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    242a:	00164083          	lbu	ra,1(a2)
    242e:	00160313          	addi	t1,a2,1
	enum CORE_STATE state=CORE_START;
    2432:	4681                	li	a3,0
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2434:	f6571ce3          	bne	a4,t0,23ac <core_bench_state+0x7e>
		final_counts[fstate]++;
    2438:	068a                	slli	a3,a3,0x2
    243a:	09010393          	addi	t2,sp,144
    243e:	00d38533          	add	a0,t2,a3
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2442:	8706                	mv	a4,ra
		final_counts[fstate]++;
    2444:	fc052083          	lw	ra,-64(a0)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2448:	861a                	mv	a2,t1
		final_counts[fstate]++;
    244a:	00108313          	addi	t1,ra,1
    244e:	fc652023          	sw	t1,-64(a0)
	while (*p!=0) {
    2452:	ff61                	bnez	a4,242a <core_bench_state+0xfc>
    2454:	5622                	lw	a2,40(sp)
    2456:	c219                	beqz	a2,245c <core_bench_state+0x12e>
    2458:	5702                	lw	a4,32(sp)
    245a:	daba                	sw	a4,116(sp)
    245c:	6c058563          	beqz	a1,2b26 <core_bench_state+0x7f8>
    2460:	4592                	lw	a1,4(sp)
    2462:	d8ae                	sw	a1,112(sp)
    2464:	5292                	lw	t0,36(sp)
    2466:	00028463          	beqz	t0,246e <core_bench_state+0x140>
    246a:	46a2                	lw	a3,8(sp)
    246c:	dcb6                	sw	a3,120(sp)
    246e:	53b2                	lw	t2,44(sp)
    2470:	00038463          	beqz	t2,2478 <core_bench_state+0x14a>
    2474:	4572                	lw	a0,28(sp)
    2476:	c12a                	sw	a0,128(sp)
    2478:	4082                	lw	ra,0(sp)
    247a:	00008463          	beqz	ra,2482 <core_bench_state+0x154>
    247e:	4352                	lw	t1,20(sp)
    2480:	c31a                	sw	t1,132(sp)
    2482:	c019                	beqz	s0,2488 <core_bench_state+0x15a>
    2484:	4432                	lw	s0,12(sp)
    2486:	dea2                	sw	s0,124(sp)
    2488:	4662                	lw	a2,24(sp)
    248a:	c219                	beqz	a2,2490 <core_bench_state+0x162>
    248c:	4742                	lw	a4,16(sp)
    248e:	c53a                	sw	a4,136(sp)
	while (p < (memblock+blksize)) { /* insert some corruption */
    2490:	45b6                	lw	a1,76(sp)
    2492:	4692                	lw	a3,4(sp)
    2494:	00b482b3          	add	t0,s1,a1
    2498:	d616                	sw	t0,44(sp)
    249a:	c036                	sw	a3,0(sp)
    249c:	0254fd63          	bleu	t0,s1,24d6 <core_bench_state+0x1a8>
		if (*p!=',')
    24a0:	50b2                	lw	ra,44(sp)
    24a2:	4516                	lw	a0,68(sp)
    24a4:	5352                	lw	t1,52(sp)
	while (p < (memblock+blksize)) { /* insert some corruption */
    24a6:	87a6                	mv	a5,s1
		if (*p!=',')
    24a8:	02c00393          	li	t2,44
    24ac:	0007c403          	lbu	s0,0(a5)
    24b0:	00740663          	beq	s0,t2,24bc <core_bench_state+0x18e>
			*p^=(ee_u8)seed1;
    24b4:	00a44633          	xor	a2,s0,a0
    24b8:	00c78023          	sb	a2,0(a5)
		p+=step;
    24bc:	979a                	add	a5,a5,t1
	while (p < (memblock+blksize)) { /* insert some corruption */
    24be:	fe17e7e3          	bltu	a5,ra,24ac <core_bench_state+0x17e>
    24c2:	0004c783          	lbu	a5,0(s1)
	while (*p!=0) {
    24c6:	10078163          	beqz	a5,25c8 <core_bench_state+0x29a>
    24ca:	0014c703          	lbu	a4,1(s1)
    24ce:	00148593          	addi	a1,s1,1
    24d2:	dc2e                	sw	a1,56(sp)
    24d4:	de3a                	sw	a4,60(sp)
    24d6:	409a                	lw	ra,132(sp)
    24d8:	5576                	lw	a0,124(sp)
    24da:	52d6                	lw	t0,116(sp)
    24dc:	56e6                	lw	a3,120(sp)
    24de:	438a                	lw	t2,128(sp)
    24e0:	432a                	lw	t1,136(sp)
    24e2:	c806                	sw	ra,16(sp)
    24e4:	c42a                	sw	a0,8(sp)
    24e6:	ce16                	sw	t0,28(sp)
    24e8:	c236                	sw	a3,4(sp)
    24ea:	cc1e                	sw	t2,24(sp)
    24ec:	c61a                	sw	t1,12(sp)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    24ee:	02c00413          	li	s0,44
    24f2:	50f2                	lw	ra,60(sp)
    24f4:	5562                	lw	a0,56(sp)
    24f6:	66878f63          	beq	a5,s0,2b74 <core_bench_state+0x846>
    24fa:	86a6                	mv	a3,s1
    24fc:	ca02                	sw	zero,20(sp)
    24fe:	d002                	sw	zero,32(sp)
    2500:	d402                	sw	zero,40(sp)
    2502:	4401                	li	s0,0
    2504:	d202                	sw	zero,36(sp)
    2506:	4301                	li	t1,0
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2508:	4582                	lw	a1,0(sp)
    250a:	fd078293          	addi	t0,a5,-48
    250e:	0ff2f393          	andi	t2,t0,255
    2512:	00158613          	addi	a2,a1,1
    2516:	c032                	sw	a2,0(sp)
    2518:	4725                	li	a4,9
    251a:	34777763          	bleu	t2,a4,2868 <core_bench_state+0x53a>
			else if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    251e:	02b00593          	li	a1,43
    2522:	4cb78663          	beq	a5,a1,29ee <core_bench_state+0x6c0>
    2526:	02d00613          	li	a2,45
    252a:	4cc78263          	beq	a5,a2,29ee <core_bench_state+0x6c0>
			else if( NEXT_SYMBOL == '.' ) {
    252e:	02e00293          	li	t0,46
    2532:	54578b63          	beq	a5,t0,2a88 <core_bench_state+0x75a>
				transition_count[CORE_INVALID]++;
    2536:	46f2                	lw	a3,28(sp)
    2538:	4385                	li	t2,1
				state = CORE_INVALID;
    253a:	4705                	li	a4,1
				transition_count[CORE_INVALID]++;
    253c:	00168793          	addi	a5,a3,1
    2540:	ce3e                	sw	a5,28(sp)
			break;
    2542:	d21e                	sw	t2,36(sp)
    2544:	4605                	li	a2,1
			transition_count[CORE_START]++;
    2546:	8786                	mv	a5,ra
    2548:	86aa                	mv	a3,a0
		final_counts[fstate]++;
    254a:	070a                	slli	a4,a4,0x2
    254c:	09010293          	addi	t0,sp,144
    2550:	00e283b3          	add	t2,t0,a4
    2554:	fc03a083          	lw	ra,-64(t2)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2558:	02c00593          	li	a1,44
		final_counts[fstate]++;
    255c:	00108513          	addi	a0,ra,1
    2560:	fca3a023          	sw	a0,-64(t2)
	while (*p!=0) {
    2564:	c795                	beqz	a5,2590 <core_bench_state+0x262>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2566:	0016c083          	lbu	ra,1(a3)
    256a:	00168513          	addi	a0,a3,1
	enum CORE_STATE state=CORE_START;
    256e:	4701                	li	a4,0
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2570:	f8b79ce3          	bne	a5,a1,2508 <core_bench_state+0x1da>
		final_counts[fstate]++;
    2574:	070a                	slli	a4,a4,0x2
    2576:	09010293          	addi	t0,sp,144
    257a:	00e283b3          	add	t2,t0,a4
		if (NEXT_SYMBOL==',') /* end of this input */ {
    257e:	8786                	mv	a5,ra
		final_counts[fstate]++;
    2580:	fc03a083          	lw	ra,-64(t2)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2584:	86aa                	mv	a3,a0
		final_counts[fstate]++;
    2586:	00108513          	addi	a0,ra,1
    258a:	fca3a023          	sw	a0,-64(t2)
	while (*p!=0) {
    258e:	ffe1                	bnez	a5,2566 <core_bench_state+0x238>
    2590:	5792                	lw	a5,36(sp)
    2592:	c399                	beqz	a5,2598 <core_bench_state+0x26a>
    2594:	46f2                	lw	a3,28(sp)
    2596:	dab6                	sw	a3,116(sp)
    2598:	c219                	beqz	a2,259e <core_bench_state+0x270>
    259a:	4602                	lw	a2,0(sp)
    259c:	d8b2                	sw	a2,112(sp)
    259e:	5582                	lw	a1,32(sp)
    25a0:	c199                	beqz	a1,25a6 <core_bench_state+0x278>
    25a2:	4712                	lw	a4,4(sp)
    25a4:	dcba                	sw	a4,120(sp)
    25a6:	52a2                	lw	t0,40(sp)
    25a8:	00028463          	beqz	t0,25b0 <core_bench_state+0x282>
    25ac:	43e2                	lw	t2,24(sp)
    25ae:	c11e                	sw	t2,128(sp)
    25b0:	c019                	beqz	s0,25b6 <core_bench_state+0x288>
    25b2:	4442                	lw	s0,16(sp)
    25b4:	c322                	sw	s0,132(sp)
    25b6:	00030463          	beqz	t1,25be <core_bench_state+0x290>
    25ba:	4322                	lw	t1,8(sp)
    25bc:	de9a                	sw	t1,124(sp)
    25be:	40d2                	lw	ra,20(sp)
    25c0:	00008463          	beqz	ra,25c8 <core_bench_state+0x29a>
    25c4:	4532                	lw	a0,12(sp)
    25c6:	c52a                	sw	a0,136(sp)
	while (p < (memblock+blksize)) { /* undo corruption is seed1 and seed2 are equal */
    25c8:	57b2                	lw	a5,44(sp)
		if (*p!=',')
    25ca:	02c00713          	li	a4,44
	while (p < (memblock+blksize)) { /* undo corruption is seed1 and seed2 are equal */
    25ce:	02f4f063          	bleu	a5,s1,25ee <core_bench_state+0x2c0>
    25d2:	45a6                	lw	a1,72(sp)
    25d4:	5652                	lw	a2,52(sp)
    25d6:	86be                	mv	a3,a5
		if (*p!=',')
    25d8:	0004c283          	lbu	t0,0(s1)
    25dc:	00e28663          	beq	t0,a4,25e8 <core_bench_state+0x2ba>
			*p^=(ee_u8)seed2;
    25e0:	00b2c3b3          	xor	t2,t0,a1
    25e4:	00748023          	sb	t2,0(s1)
		p+=step;
    25e8:	94b2                	add	s1,s1,a2
	while (p < (memblock+blksize)) { /* undo corruption is seed1 and seed2 are equal */
    25ea:	fed4e7e3          	bltu	s1,a3,25d8 <core_bench_state+0x2aa>
    25ee:	4586                	lw	a1,64(sp)
	for( ; *str && state != CORE_INVALID; str++ ) {
    25f0:	4481                	li	s1,0
	for (i=0; i<NUM_CORE_STATES; i++) {
    25f2:	02000413          	li	s0,32
		crc=crcu32(final_counts[i],crc);
    25f6:	05010313          	addi	t1,sp,80
    25fa:	009300b3          	add	ra,t1,s1
    25fe:	0000a503          	lw	a0,0(ra)
    2602:	691020ef          	jal	ra,5492 <crcu32>
		crc=crcu32(track_counts[i],crc);
    2606:	1898                	addi	a4,sp,112
    2608:	009707b3          	add	a5,a4,s1
    260c:	85aa                	mv	a1,a0
    260e:	4388                	lw	a0,0(a5)
    2610:	0491                	addi	s1,s1,4
    2612:	681020ef          	jal	ra,5492 <crcu32>
    2616:	85aa                	mv	a1,a0
	for (i=0; i<NUM_CORE_STATES; i++) {
    2618:	fc849fe3          	bne	s1,s0,25f6 <core_bench_state+0x2c8>
}
    261c:	40ea                	lw	ra,152(sp)
    261e:	445a                	lw	s0,148(sp)
    2620:	44ca                	lw	s1,144(sp)
    2622:	09c10113          	addi	sp,sp,156
    2626:	8082                	ret
			else if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    2628:	02b00513          	li	a0,43
    262c:	16a70663          	beq	a4,a0,2798 <core_bench_state+0x46a>
    2630:	02d00293          	li	t0,45
    2634:	16570263          	beq	a4,t0,2798 <core_bench_state+0x46a>
			else if( NEXT_SYMBOL == '.' ) {
    2638:	02e00393          	li	t2,46
    263c:	1e770c63          	beq	a4,t2,2834 <core_bench_state+0x506>
				transition_count[CORE_INVALID]++;
    2640:	5702                	lw	a4,32(sp)
				state = CORE_INVALID;
    2642:	4685                	li	a3,1
    2644:	4585                	li	a1,1
				transition_count[CORE_INVALID]++;
    2646:	00170613          	addi	a2,a4,1
    264a:	d032                	sw	a2,32(sp)
			break;
    264c:	861a                	mv	a2,t1
    264e:	4305                	li	t1,1
    2650:	d41a                	sw	t1,40(sp)
			transition_count[CORE_START]++;
    2652:	8706                	mv	a4,ra
    2654:	bb6d                	j	240e <core_bench_state+0xe0>
				transition_count[CORE_INT]++;
    2656:	42f2                	lw	t0,28(sp)
    2658:	4705                	li	a4,1
    265a:	d63a                	sw	a4,44(sp)
    265c:	00128093          	addi	ra,t0,1
    2660:	ce06                	sw	ra,28(sp)
				state = CORE_FLOAT;
    2662:	4695                	li	a3,5
    2664:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2666:	1e030e63          	beqz	t1,2862 <core_bench_state+0x534>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    266a:	02c00513          	li	a0,44
    266e:	00138293          	addi	t0,t2,1
    2672:	4ca30763          	beq	t1,a0,2b40 <core_bench_state+0x812>
    2676:	00264503          	lbu	a0,2(a2)
			}
			break;
		case CORE_FLOAT:
			if( NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e' ) {
    267a:	04500093          	li	ra,69
    267e:	0df37613          	andi	a2,t1,223
    2682:	02160463          	beq	a2,ra,26aa <core_bench_state+0x37c>
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2686:	fd030393          	addi	t2,t1,-48
    268a:	0ff3f313          	andi	t1,t2,255
    268e:	46a5                	li	a3,9
    2690:	1866f263          	bleu	t1,a3,2814 <core_bench_state+0x4e6>
				state = CORE_S2;
				transition_count[CORE_FLOAT]++;
			}
			else if(!ee_isdigit(NEXT_SYMBOL)) {
				state = CORE_INVALID;
				transition_count[CORE_FLOAT]++;
    2694:	45d2                	lw	a1,20(sp)
    2696:	4085                	li	ra,1
				state = CORE_INVALID;
    2698:	4685                	li	a3,1
				transition_count[CORE_FLOAT]++;
    269a:	00158713          	addi	a4,a1,1
    269e:	ca3a                	sw	a4,20(sp)
    26a0:	4585                	li	a1,1
    26a2:	c006                	sw	ra,0(sp)
    26a4:	872a                	mv	a4,a0
    26a6:	8616                	mv	a2,t0
    26a8:	b39d                	j	240e <core_bench_state+0xe0>
				transition_count[CORE_FLOAT]++;
    26aa:	4652                	lw	a2,20(sp)
    26ac:	4705                	li	a4,1
    26ae:	c03a                	sw	a4,0(sp)
    26b0:	00160693          	addi	a3,a2,1
    26b4:	ca36                	sw	a3,20(sp)
    26b6:	4585                	li	a1,1
				state = CORE_S2;
    26b8:	468d                	li	a3,3
	for( ; *str && state != CORE_INVALID; str++ ) {
    26ba:	18050f63          	beqz	a0,2858 <core_bench_state+0x52a>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    26be:	02c00313          	li	t1,44
    26c2:	00128613          	addi	a2,t0,1
    26c6:	0023c703          	lbu	a4,2(t2)
    26ca:	4585                	li	a1,1
    26cc:	d46501e3          	beq	a0,t1,240e <core_bench_state+0xe0>
			}
			break;
		case CORE_S2:
			if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    26d0:	4432                	lw	s0,12(sp)
    26d2:	fd550093          	addi	ra,a0,-43
    26d6:	0fd0f393          	andi	t2,ra,253
    26da:	00140593          	addi	a1,s0,1
    26de:	c62e                	sw	a1,12(sp)
				state = CORE_EXPONENT;
				transition_count[CORE_S2]++;
			}
			else {
				state = CORE_INVALID;
    26e0:	4685                	li	a3,1
    26e2:	4585                	li	a1,1
    26e4:	4405                	li	s0,1
			if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    26e6:	d20394e3          	bnez	t2,240e <core_bench_state+0xe0>
				state = CORE_EXPONENT;
    26ea:	4699                	li	a3,6
	for( ; *str && state != CORE_INVALID; str++ ) {
    26ec:	d20701e3          	beqz	a4,240e <core_bench_state+0xe0>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    26f0:	00228613          	addi	a2,t0,2
    26f4:	3c670e63          	beq	a4,t1,2ad0 <core_bench_state+0x7a2>
    26f8:	46c2                	lw	a3,16(sp)
    26fa:	0022c503          	lbu	a0,2(t0)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    26fe:	4085                	li	ra,1
    2700:	00168593          	addi	a1,a3,1
    2704:	fd070713          	addi	a4,a4,-48
    2708:	c82e                	sw	a1,16(sp)
    270a:	cc06                	sw	ra,24(sp)
    270c:	0ff77393          	andi	t2,a4,255
    2710:	c022                	sw	s0,0(sp)
    2712:	40a5                	li	ra,9
			if(ee_isdigit(NEXT_SYMBOL)) {
				state = CORE_SCIENTIFIC;
				transition_count[CORE_EXPONENT]++;
			}
			else {
				state = CORE_INVALID;
    2714:	4685                	li	a3,1
    2716:	85a2                	mv	a1,s0
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2718:	872a                	mv	a4,a0
    271a:	ce70eae3          	bltu	ra,t2,240e <core_bench_state+0xe0>
				state = CORE_SCIENTIFIC;
    271e:	469d                	li	a3,7
	for( ; *str && state != CORE_INVALID; str++ ) {
    2720:	ce0507e3          	beqz	a0,240e <core_bench_state+0xe0>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2724:	00328613          	addi	a2,t0,3
    2728:	3e670163          	beq	a4,t1,2b0a <core_bench_state+0x7dc>
    272c:	0032c703          	lbu	a4,3(t0)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2730:	4325                	li	t1,9
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2732:	02c00393          	li	t2,44
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2736:	fd050293          	addi	t0,a0,-48
    273a:	0ff2f513          	andi	a0,t0,255
    273e:	00a37e63          	bleu	a0,t1,275a <core_bench_state+0x42c>
			}
			break;
		case CORE_SCIENTIFIC:
			if(!ee_isdigit(NEXT_SYMBOL)) {
				state = CORE_INVALID;
				transition_count[CORE_INVALID]++;
    2742:	5402                	lw	s0,32(sp)
    2744:	4085                	li	ra,1
    2746:	4585                	li	a1,1
    2748:	00140693          	addi	a3,s0,1
    274c:	d036                	sw	a3,32(sp)
    274e:	d42e                	sw	a1,40(sp)
				state = CORE_INVALID;
    2750:	4685                	li	a3,1
    2752:	c006                	sw	ra,0(sp)
    2754:	4405                	li	s0,1
    2756:	cc06                	sw	ra,24(sp)
    2758:	b95d                	j	240e <core_bench_state+0xe0>
    275a:	4285                	li	t0,1
    275c:	c016                	sw	t0,0(sp)
    275e:	469d                	li	a3,7
    2760:	4585                	li	a1,1
    2762:	4405                	li	s0,1
    2764:	4085                	li	ra,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2766:	36070c63          	beqz	a4,2ade <core_bench_state+0x7b0>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    276a:	00164283          	lbu	t0,1(a2)
    276e:	853a                	mv	a0,a4
    2770:	0605                	addi	a2,a2,1
    2772:	38770963          	beq	a4,t2,2b04 <core_bench_state+0x7d6>
    2776:	8716                	mv	a4,t0
    2778:	bf7d                	j	2736 <core_bench_state+0x408>
    277a:	4605                	li	a2,1
    277c:	d832                	sw	a2,48(sp)
	for( ; *str && state != CORE_INVALID; str++ ) {
    277e:	0e030063          	beqz	t1,285e <core_bench_state+0x530>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2782:	0013c683          	lbu	a3,1(t2)
    2786:	00138593          	addi	a1,t2,1
    278a:	871a                	mv	a4,t1
    278c:	861e                	mv	a2,t2
    278e:	3a130e63          	beq	t1,ra,2b4a <core_bench_state+0x81c>
    2792:	83ae                	mv	t2,a1
    2794:	8336                	mv	t1,a3
    2796:	b991                	j	23ea <core_bench_state+0xbc>
				state = CORE_S1;
    2798:	4689                	li	a3,2
    279a:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    279c:	0a008b63          	beqz	ra,2852 <core_bench_state+0x524>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    27a0:	02c00713          	li	a4,44
    27a4:	00130393          	addi	t2,t1,1
    27a8:	3ae08663          	beq	ra,a4,2b54 <core_bench_state+0x826>
    27ac:	46a2                	lw	a3,8(sp)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    27ae:	fd008513          	addi	a0,ra,-48
    27b2:	00264703          	lbu	a4,2(a2)
    27b6:	00168593          	addi	a1,a3,1
		if (NEXT_SYMBOL==',') /* end of this input */ {
    27ba:	861e                	mv	a2,t2
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    27bc:	c42e                	sw	a1,8(sp)
    27be:	0ff57293          	andi	t0,a0,255
    27c2:	43a5                	li	t2,9
    27c4:	0253f963          	bleu	t0,t2,27f6 <core_bench_state+0x4c8>
			else if( NEXT_SYMBOL == '.' ) {
    27c8:	4505                	li	a0,1
    27ca:	d22a                	sw	a0,36(sp)
    27cc:	02e00293          	li	t0,46
				state = CORE_INVALID;
    27d0:	4685                	li	a3,1
    27d2:	4585                	li	a1,1
			else if( NEXT_SYMBOL == '.' ) {
    27d4:	c2509de3          	bne	ra,t0,240e <core_bench_state+0xe0>
				state = CORE_FLOAT;
    27d8:	4695                	li	a3,5
    27da:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    27dc:	c20709e3          	beqz	a4,240e <core_bench_state+0xe0>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    27e0:	02c00093          	li	ra,44
    27e4:	00160293          	addi	t0,a2,1
    27e8:	36170e63          	beq	a4,ra,2b64 <core_bench_state+0x836>
    27ec:	00234503          	lbu	a0,2(t1)
    27f0:	83b2                	mv	t2,a2
    27f2:	833a                	mv	t1,a4
    27f4:	b559                	j	267a <core_bench_state+0x34c>
				transition_count[CORE_S1]++;
    27f6:	4385                	li	t2,1
    27f8:	d21e                	sw	t2,36(sp)
				state = CORE_INT;
    27fa:	4691                	li	a3,4
    27fc:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    27fe:	c00708e3          	beqz	a4,240e <core_bench_state+0xe0>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2802:	02c00513          	li	a0,44
    2806:	00160393          	addi	t2,a2,1
    280a:	30a70663          	beq	a4,a0,2b16 <core_bench_state+0x7e8>
    280e:	00234303          	lbu	t1,2(t1)
    2812:	b6f9                	j	23e0 <core_bench_state+0xb2>
    2814:	4695                	li	a3,5
    2816:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2818:	c121                	beqz	a0,2858 <core_bench_state+0x52a>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    281a:	0012c703          	lbu	a4,1(t0)
    281e:	00128613          	addi	a2,t0,1
    2822:	8396                	mv	t2,t0
    2824:	02c00293          	li	t0,44
    2828:	832a                	mv	t1,a0
    282a:	be5502e3          	beq	a0,t0,240e <core_bench_state+0xe0>
    282e:	82b2                	mv	t0,a2
    2830:	853a                	mv	a0,a4
    2832:	b5b1                	j	267e <core_bench_state+0x350>
				state = CORE_FLOAT;
    2834:	4695                	li	a3,5
    2836:	4585                	li	a1,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2838:	00008d63          	beqz	ra,2852 <core_bench_state+0x524>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    283c:	02c00513          	li	a0,44
    2840:	839a                	mv	t2,t1
    2842:	00130293          	addi	t0,t1,1
    2846:	36a08263          	beq	ra,a0,2baa <core_bench_state+0x87c>
    284a:	00264503          	lbu	a0,2(a2)
    284e:	8306                	mv	t1,ra
    2850:	b52d                	j	267a <core_bench_state+0x34c>
	for( ; *str && state != CORE_INVALID; str++ ) {
    2852:	4701                	li	a4,0
    2854:	861a                	mv	a2,t1
    2856:	be65                	j	240e <core_bench_state+0xe0>
    2858:	4701                	li	a4,0
    285a:	8616                	mv	a2,t0
    285c:	be4d                	j	240e <core_bench_state+0xe0>
    285e:	4585                	li	a1,1
    2860:	4691                	li	a3,4
    2862:	4701                	li	a4,0
    2864:	861e                	mv	a2,t2
    2866:	b665                	j	240e <core_bench_state+0xe0>
				state = CORE_INT;
    2868:	4711                	li	a4,4
    286a:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    286c:	24008263          	beqz	ra,2ab0 <core_bench_state+0x782>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2870:	02c00793          	li	a5,44
    2874:	82aa                	mv	t0,a0
    2876:	00150393          	addi	t2,a0,1
    287a:	26f08a63          	beq	ra,a5,2aee <core_bench_state+0x7c0>
    287e:	0026c503          	lbu	a0,2(a3)
    2882:	8786                	mv	a5,ra
    2884:	8696                	mv	a3,t0
			if( NEXT_SYMBOL == '.' ) {
    2886:	02e00593          	li	a1,46
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    288a:	42a5                	li	t0,9
		if (NEXT_SYMBOL==',') /* end of this input */ {
    288c:	02c00093          	li	ra,44
			if( NEXT_SYMBOL == '.' ) {
    2890:	02b78363          	beq	a5,a1,28b6 <core_bench_state+0x588>
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2894:	fd078693          	addi	a3,a5,-48
    2898:	0ff6f713          	andi	a4,a3,255
    289c:	12e2fb63          	bleu	a4,t0,29d2 <core_bench_state+0x6a4>
				transition_count[CORE_INT]++;
    28a0:	4662                	lw	a2,24(sp)
    28a2:	4585                	li	a1,1
				state = CORE_INVALID;
    28a4:	4705                	li	a4,1
				transition_count[CORE_INT]++;
    28a6:	00160793          	addi	a5,a2,1
    28aa:	cc3e                	sw	a5,24(sp)
    28ac:	4605                	li	a2,1
    28ae:	d42e                	sw	a1,40(sp)
    28b0:	87aa                	mv	a5,a0
    28b2:	869e                	mv	a3,t2
    28b4:	b959                	j	254a <core_bench_state+0x21c>
				transition_count[CORE_INT]++;
    28b6:	42e2                	lw	t0,24(sp)
    28b8:	4785                	li	a5,1
    28ba:	d43e                	sw	a5,40(sp)
    28bc:	00128093          	addi	ra,t0,1
    28c0:	cc06                	sw	ra,24(sp)
				state = CORE_FLOAT;
    28c2:	4715                	li	a4,5
    28c4:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    28c6:	1e050d63          	beqz	a0,2ac0 <core_bench_state+0x792>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    28ca:	02c00593          	li	a1,44
    28ce:	00138293          	addi	t0,t2,1
    28d2:	26b50263          	beq	a0,a1,2b36 <core_bench_state+0x808>
    28d6:	0026c583          	lbu	a1,2(a3)
			if( NEXT_SYMBOL == 'E' || NEXT_SYMBOL == 'e' ) {
    28da:	04500093          	li	ra,69
    28de:	0df57693          	andi	a3,a0,223
    28e2:	02168363          	beq	a3,ra,2908 <core_bench_state+0x5da>
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    28e6:	fd050393          	addi	t2,a0,-48
    28ea:	0ff3f513          	andi	a0,t2,255
    28ee:	4625                	li	a2,9
    28f0:	16a67c63          	bleu	a0,a2,2a68 <core_bench_state+0x73a>
				transition_count[CORE_FLOAT]++;
    28f4:	4442                	lw	s0,16(sp)
    28f6:	4605                	li	a2,1
    28f8:	87ae                	mv	a5,a1
    28fa:	00140713          	addi	a4,s0,1
    28fe:	c83a                	sw	a4,16(sp)
    2900:	4405                	li	s0,1
				state = CORE_INVALID;
    2902:	4705                	li	a4,1
				transition_count[CORE_FLOAT]++;
    2904:	8696                	mv	a3,t0
    2906:	b191                	j	254a <core_bench_state+0x21c>
				transition_count[CORE_FLOAT]++;
    2908:	47c2                	lw	a5,16(sp)
				state = CORE_S2;
    290a:	470d                	li	a4,3
    290c:	4605                	li	a2,1
				transition_count[CORE_FLOAT]++;
    290e:	00178093          	addi	ra,a5,1
    2912:	c806                	sw	ra,16(sp)
    2914:	4405                	li	s0,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2916:	1a058063          	beqz	a1,2ab6 <core_bench_state+0x788>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    291a:	02c00513          	li	a0,44
    291e:	00128693          	addi	a3,t0,1
    2922:	0023c783          	lbu	a5,2(t2)
    2926:	18a58363          	beq	a1,a0,2aac <core_bench_state+0x77e>
			if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    292a:	4322                	lw	t1,8(sp)
    292c:	fd558393          	addi	t2,a1,-43
    2930:	0fd3f593          	andi	a1,t2,253
    2934:	00130613          	addi	a2,t1,1
    2938:	c432                	sw	a2,8(sp)
				state = CORE_INVALID;
    293a:	4705                	li	a4,1
    293c:	8622                	mv	a2,s0
    293e:	4305                	li	t1,1
			if( NEXT_SYMBOL == '+' || NEXT_SYMBOL == '-' ) {
    2940:	c00595e3          	bnez	a1,254a <core_bench_state+0x21c>
				state = CORE_EXPONENT;
    2944:	4719                	li	a4,6
	for( ; *str && state != CORE_INVALID; str++ ) {
    2946:	c00782e3          	beqz	a5,254a <core_bench_state+0x21c>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    294a:	00228693          	addi	a3,t0,2
    294e:	16a78c63          	beq	a5,a0,2ac6 <core_bench_state+0x798>
    2952:	4432                	lw	s0,12(sp)
    2954:	0022c583          	lbu	a1,2(t0)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2958:	4085                	li	ra,1
    295a:	00140713          	addi	a4,s0,1
    295e:	fd078793          	addi	a5,a5,-48
    2962:	c63a                	sw	a4,12(sp)
    2964:	ca06                	sw	ra,20(sp)
    2966:	0ff7f393          	andi	t2,a5,255
    296a:	40a5                	li	ra,9
				state = CORE_INVALID;
    296c:	4705                	li	a4,1
    296e:	861a                	mv	a2,t1
    2970:	841a                	mv	s0,t1
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2972:	87ae                	mv	a5,a1
    2974:	bc70ebe3          	bltu	ra,t2,254a <core_bench_state+0x21c>
				state = CORE_SCIENTIFIC;
    2978:	471d                	li	a4,7
	for( ; *str && state != CORE_INVALID; str++ ) {
    297a:	bc0588e3          	beqz	a1,254a <core_bench_state+0x21c>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    297e:	00328693          	addi	a3,t0,3
    2982:	16a78063          	beq	a5,a0,2ae2 <core_bench_state+0x7b4>
    2986:	0032c783          	lbu	a5,3(t0)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    298a:	4525                	li	a0,9
		if (NEXT_SYMBOL==',') /* end of this input */ {
    298c:	02c00293          	li	t0,44
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2990:	fd058313          	addi	t1,a1,-48
    2994:	0ff37613          	andi	a2,t1,255
    2998:	00c57e63          	bleu	a2,a0,29b4 <core_bench_state+0x686>
				transition_count[CORE_INVALID]++;
    299c:	45f2                	lw	a1,28(sp)
    299e:	4605                	li	a2,1
    29a0:	4385                	li	t2,1
    29a2:	00158413          	addi	s0,a1,1
    29a6:	ce22                	sw	s0,28(sp)
				state = CORE_INVALID;
    29a8:	4705                	li	a4,1
    29aa:	d232                	sw	a2,36(sp)
    29ac:	4405                	li	s0,1
    29ae:	4305                	li	t1,1
    29b0:	ca1e                	sw	t2,20(sp)
    29b2:	be61                	j	254a <core_bench_state+0x21c>
    29b4:	471d                	li	a4,7
    29b6:	4605                	li	a2,1
    29b8:	4405                	li	s0,1
    29ba:	4305                	li	t1,1
    29bc:	4085                	li	ra,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    29be:	10078e63          	beqz	a5,2ada <core_bench_state+0x7ac>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    29c2:	0016c383          	lbu	t2,1(a3)
    29c6:	85be                	mv	a1,a5
    29c8:	0685                	addi	a3,a3,1
    29ca:	12578663          	beq	a5,t0,2af6 <core_bench_state+0x7c8>
    29ce:	879e                	mv	a5,t2
    29d0:	b7c1                	j	2990 <core_bench_state+0x662>
    29d2:	4685                	li	a3,1
    29d4:	d836                	sw	a3,48(sp)
	for( ; *str && state != CORE_INVALID; str++ ) {
    29d6:	c17d                	beqz	a0,2abc <core_bench_state+0x78e>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    29d8:	0013c603          	lbu	a2,1(t2)
    29dc:	00138713          	addi	a4,t2,1
    29e0:	87aa                	mv	a5,a0
    29e2:	869e                	mv	a3,t2
    29e4:	0c150163          	beq	a0,ra,2aa6 <core_bench_state+0x778>
    29e8:	8532                	mv	a0,a2
    29ea:	83ba                	mv	t2,a4
    29ec:	b555                	j	2890 <core_bench_state+0x562>
				state = CORE_S1;
    29ee:	4709                	li	a4,2
    29f0:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    29f2:	0a008f63          	beqz	ra,2ab0 <core_bench_state+0x782>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    29f6:	02c00793          	li	a5,44
    29fa:	00150293          	addi	t0,a0,1
    29fe:	14f08f63          	beq	ra,a5,2b5c <core_bench_state+0x82e>
    2a02:	4712                	lw	a4,4(sp)
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2a04:	fd008393          	addi	t2,ra,-48
    2a08:	0026c783          	lbu	a5,2(a3)
    2a0c:	00170613          	addi	a2,a4,1
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2a10:	8696                	mv	a3,t0
	retval = ((c>='0') & (c<='9')) ? 1 : 0;
    2a12:	c232                	sw	a2,4(sp)
    2a14:	0ff3f593          	andi	a1,t2,255
    2a18:	42a5                	li	t0,9
    2a1a:	02b2e163          	bltu	t0,a1,2a3c <core_bench_state+0x70e>
				transition_count[CORE_S1]++;
    2a1e:	4285                	li	t0,1
    2a20:	d016                	sw	t0,32(sp)
				state = CORE_INT;
    2a22:	4711                	li	a4,4
    2a24:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2a26:	b20782e3          	beqz	a5,254a <core_bench_state+0x21c>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2a2a:	02c00593          	li	a1,44
    2a2e:	00168393          	addi	t2,a3,1
    2a32:	0cb78563          	beq	a5,a1,2afc <core_bench_state+0x7ce>
    2a36:	00254503          	lbu	a0,2(a0)
    2a3a:	b5b1                	j	2886 <core_bench_state+0x558>
			else if( NEXT_SYMBOL == '.' ) {
    2a3c:	4385                	li	t2,1
    2a3e:	d01e                	sw	t2,32(sp)
    2a40:	02e00593          	li	a1,46
				state = CORE_INVALID;
    2a44:	4705                	li	a4,1
    2a46:	4605                	li	a2,1
			else if( NEXT_SYMBOL == '.' ) {
    2a48:	b0b091e3          	bne	ra,a1,254a <core_bench_state+0x21c>
				state = CORE_FLOAT;
    2a4c:	4715                	li	a4,5
	for( ; *str && state != CORE_INVALID; str++ ) {
    2a4e:	ae078ee3          	beqz	a5,254a <core_bench_state+0x21c>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2a52:	02c00093          	li	ra,44
    2a56:	00168293          	addi	t0,a3,1
    2a5a:	10178963          	beq	a5,ra,2b6c <core_bench_state+0x83e>
    2a5e:	00254583          	lbu	a1,2(a0)
    2a62:	83b6                	mv	t2,a3
    2a64:	853e                	mv	a0,a5
    2a66:	bd95                	j	28da <core_bench_state+0x5ac>
    2a68:	4715                	li	a4,5
    2a6a:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2a6c:	c5a9                	beqz	a1,2ab6 <core_bench_state+0x788>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2a6e:	0012c783          	lbu	a5,1(t0)
    2a72:	00128693          	addi	a3,t0,1
    2a76:	8396                	mv	t2,t0
    2a78:	02c00293          	li	t0,44
    2a7c:	852e                	mv	a0,a1
    2a7e:	ac5586e3          	beq	a1,t0,254a <core_bench_state+0x21c>
    2a82:	82b6                	mv	t0,a3
    2a84:	85be                	mv	a1,a5
    2a86:	bda1                	j	28de <core_bench_state+0x5b0>
				state = CORE_FLOAT;
    2a88:	4715                	li	a4,5
    2a8a:	4605                	li	a2,1
	for( ; *str && state != CORE_INVALID; str++ ) {
    2a8c:	02008263          	beqz	ra,2ab0 <core_bench_state+0x782>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2a90:	83aa                	mv	t2,a0
    2a92:	00150293          	addi	t0,a0,1
    2a96:	02c00513          	li	a0,44
    2a9a:	10a08463          	beq	ra,a0,2ba2 <core_bench_state+0x874>
    2a9e:	0026c583          	lbu	a1,2(a3)
    2aa2:	8506                	mv	a0,ra
    2aa4:	bd1d                	j	28da <core_bench_state+0x5ac>
    2aa6:	86ba                	mv	a3,a4
    2aa8:	87b2                	mv	a5,a2
    2aaa:	4711                	li	a4,4
    2aac:	4605                	li	a2,1
    2aae:	bc71                	j	254a <core_bench_state+0x21c>
	for( ; *str && state != CORE_INVALID; str++ ) {
    2ab0:	4781                	li	a5,0
    2ab2:	86aa                	mv	a3,a0
    2ab4:	bc59                	j	254a <core_bench_state+0x21c>
    2ab6:	4781                	li	a5,0
    2ab8:	8696                	mv	a3,t0
    2aba:	bc41                	j	254a <core_bench_state+0x21c>
    2abc:	4711                	li	a4,4
    2abe:	4605                	li	a2,1
    2ac0:	4781                	li	a5,0
    2ac2:	869e                	mv	a3,t2
    2ac4:	b459                	j	254a <core_bench_state+0x21c>
    2ac6:	0022c783          	lbu	a5,2(t0)
    2aca:	861a                	mv	a2,t1
    2acc:	841a                	mv	s0,t1
    2ace:	bcb5                	j	254a <core_bench_state+0x21c>
    2ad0:	0022c703          	lbu	a4,2(t0)
    2ad4:	85a2                	mv	a1,s0
    2ad6:	c022                	sw	s0,0(sp)
    2ad8:	ba1d                	j	240e <core_bench_state+0xe0>
    2ada:	ca06                	sw	ra,20(sp)
    2adc:	b4bd                	j	254a <core_bench_state+0x21c>
    2ade:	cc06                	sw	ra,24(sp)
    2ae0:	b23d                	j	240e <core_bench_state+0xe0>
    2ae2:	4305                	li	t1,1
    2ae4:	0032c783          	lbu	a5,3(t0)
    2ae8:	861a                	mv	a2,t1
    2aea:	841a                	mv	s0,t1
    2aec:	bcb9                	j	254a <core_bench_state+0x21c>
    2aee:	0026c783          	lbu	a5,2(a3)
			transition_count[CORE_START]++;
    2af2:	869e                	mv	a3,t2
    2af4:	bc99                	j	254a <core_bench_state+0x21c>
    2af6:	ca06                	sw	ra,20(sp)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2af8:	879e                	mv	a5,t2
    2afa:	bc81                	j	254a <core_bench_state+0x21c>
    2afc:	00254783          	lbu	a5,2(a0)
				transition_count[CORE_S1]++;
    2b00:	869e                	mv	a3,t2
    2b02:	b4a1                	j	254a <core_bench_state+0x21c>
    2b04:	cc06                	sw	ra,24(sp)
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2b06:	8716                	mv	a4,t0
    2b08:	b219                	j	240e <core_bench_state+0xe0>
    2b0a:	4405                	li	s0,1
    2b0c:	0032c703          	lbu	a4,3(t0)
    2b10:	85a2                	mv	a1,s0
    2b12:	c022                	sw	s0,0(sp)
    2b14:	b8ed                	j	240e <core_bench_state+0xe0>
    2b16:	00234703          	lbu	a4,2(t1)
				transition_count[CORE_S1]++;
    2b1a:	861e                	mv	a2,t2
    2b1c:	b8cd                	j	240e <core_bench_state+0xe0>
    2b1e:	00264703          	lbu	a4,2(a2)
			transition_count[CORE_START]++;
    2b22:	861e                	mv	a2,t2
    2b24:	b0ed                	j	240e <core_bench_state+0xe0>
	for( ; *str && state != CORE_INVALID; str++ ) {
    2b26:	c202                	sw	zero,4(sp)
    2b28:	ba35                	j	2464 <core_bench_state+0x136>
	while (p < (memblock+blksize)) { /* insert some corruption */
    2b2a:	00a582b3          	add	t0,a1,a0
    2b2e:	d616                	sw	t0,44(sp)
    2b30:	9655e8e3          	bltu	a1,t0,24a0 <core_bench_state+0x172>
    2b34:	bc6d                	j	25ee <core_bench_state+0x2c0>
    2b36:	0026c783          	lbu	a5,2(a3)
    2b3a:	4605                	li	a2,1
				transition_count[CORE_INT]++;
    2b3c:	8696                	mv	a3,t0
    2b3e:	b431                	j	254a <core_bench_state+0x21c>
    2b40:	00264703          	lbu	a4,2(a2)
    2b44:	4585                	li	a1,1
    2b46:	8616                	mv	a2,t0
    2b48:	b0d9                	j	240e <core_bench_state+0xe0>
    2b4a:	8736                	mv	a4,a3
    2b4c:	862e                	mv	a2,a1
    2b4e:	4691                	li	a3,4
    2b50:	4585                	li	a1,1
    2b52:	b875                	j	240e <core_bench_state+0xe0>
    2b54:	00264703          	lbu	a4,2(a2)
			transition_count[CORE_START]++;
    2b58:	861e                	mv	a2,t2
    2b5a:	b855                	j	240e <core_bench_state+0xe0>
    2b5c:	0026c783          	lbu	a5,2(a3)
    2b60:	8696                	mv	a3,t0
    2b62:	b2e5                	j	254a <core_bench_state+0x21c>
    2b64:	00234703          	lbu	a4,2(t1)
				transition_count[CORE_S1]++;
    2b68:	8616                	mv	a2,t0
    2b6a:	b055                	j	240e <core_bench_state+0xe0>
    2b6c:	00254783          	lbu	a5,2(a0)
    2b70:	8696                	mv	a3,t0
    2b72:	bae1                	j	254a <core_bench_state+0x21c>
    2b74:	8786                	mv	a5,ra
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2b76:	56e2                	lw	a3,56(sp)
    2b78:	d202                	sw	zero,36(sp)
    2b7a:	ca02                	sw	zero,20(sp)
    2b7c:	4301                	li	t1,0
    2b7e:	4401                	li	s0,0
    2b80:	d402                	sw	zero,40(sp)
    2b82:	d002                	sw	zero,32(sp)
    2b84:	4601                	li	a2,0
    2b86:	4701                	li	a4,0
			break;
    2b88:	b2c9                	j	254a <core_bench_state+0x21c>
		if (NEXT_SYMBOL==',') /* end of this input */ {
    2b8a:	5772                	lw	a4,60(sp)
    2b8c:	5662                	lw	a2,56(sp)
    2b8e:	c202                	sw	zero,4(sp)
    2b90:	d402                	sw	zero,40(sp)
    2b92:	cc02                	sw	zero,24(sp)
    2b94:	4401                	li	s0,0
    2b96:	c002                	sw	zero,0(sp)
    2b98:	d602                	sw	zero,44(sp)
    2b9a:	d202                	sw	zero,36(sp)
    2b9c:	4581                	li	a1,0
    2b9e:	4681                	li	a3,0
			break;
    2ba0:	b0bd                	j	240e <core_bench_state+0xe0>
    2ba2:	0026c783          	lbu	a5,2(a3)
			transition_count[CORE_START]++;
    2ba6:	8696                	mv	a3,t0
    2ba8:	b24d                	j	254a <core_bench_state+0x21c>
    2baa:	00264703          	lbu	a4,2(a2)
    2bae:	8616                	mv	a2,t0
    2bb0:	b8b9                	j	240e <core_bench_state+0xe0>

00002bb2 <core_init_state>:
	size--;
    2bb2:	fff50293          	addi	t0,a0,-1
	while ((total+next+1)<size) {
    2bb6:	4785                	li	a5,1
void core_init_state(ee_u32 size, ee_s16 seed, ee_u8 *p) {
    2bb8:	83b2                	mv	t2,a2
	while ((total+next+1)<size) {
    2bba:	1457fd63          	bleu	t0,a5,2d14 <core_init_state+0x162>
    2bbe:	00158713          	addi	a4,a1,1
    2bc2:	01071313          	slli	t1,a4,0x10
    2bc6:	01035713          	srli	a4,t1,0x10
				buf=errpat[(seed>>3) & 0x3];
    2bca:	669d                	lui	a3,0x7
void core_init_state(ee_u32 size, ee_s16 seed, ee_u8 *p) {
    2bcc:	1151                	addi	sp,sp,-12
				buf=errpat[(seed>>3) & 0x3];
    2bce:	91868593          	addi	a1,a3,-1768 # 6918 <errpat>
		switch (seed & 0x7) {
    2bd2:	00777693          	andi	a3,a4,7
    2bd6:	00375613          	srli	a2,a4,0x3
void core_init_state(ee_u32 size, ee_s16 seed, ee_u8 *p) {
    2bda:	c226                	sw	s1,4(sp)
				buf=errpat[(seed>>3) & 0x3];
    2bdc:	c02e                	sw	a1,0(sp)
		switch (seed & 0x7) {
    2bde:	649d                	lui	s1,0x7
    2be0:	ffd68593          	addi	a1,a3,-3
    2be4:	90448313          	addi	t1,s1,-1788 # 6904 <sg_timer_config+0x98>
    2be8:	00367493          	andi	s1,a2,3
    2bec:	01059613          	slli	a2,a1,0x10
void core_init_state(ee_u32 size, ee_s16 seed, ee_u8 *p) {
    2bf0:	c422                	sw	s0,8(sp)
		switch (seed & 0x7) {
    2bf2:	01065693          	srli	a3,a2,0x10
				buf=intpat[(seed>>3) & 0x3];
    2bf6:	641d                	lui	s0,0x7
		switch (seed & 0x7) {
    2bf8:	4591                	li	a1,4
	ee_u32 total=0,next=0,i;
    2bfa:	4781                	li	a5,0
				buf=intpat[(seed>>3) & 0x3];
    2bfc:	93840413          	addi	s0,s0,-1736 # 6938 <intpat>
		switch (seed & 0x7) {
    2c00:	0ad5e663          	bltu	a1,a3,2cac <core_init_state+0xfa>
    2c04:	00269613          	slli	a2,a3,0x2
    2c08:	006606b3          	add	a3,a2,t1
    2c0c:	428c                	lw	a1,0(a3)
    2c0e:	8582                	jr	a1
				buf=floatpat[(seed>>3) & 0x3];
    2c10:	00249593          	slli	a1,s1,0x2
    2c14:	649d                	lui	s1,0x7
    2c16:	92848693          	addi	a3,s1,-1752 # 6928 <floatpat>
    2c1a:	0705                	addi	a4,a4,1
				buf=errpat[(seed>>3) & 0x3];
    2c1c:	00b684b3          	add	s1,a3,a1
    2c20:	01071593          	slli	a1,a4,0x10
	while ((total+next+1)<size) {
    2c24:	00978693          	addi	a3,a5,9
				buf=errpat[(seed>>3) & 0x3];
    2c28:	4090                	lw	a2,0(s1)
			break;
    2c2a:	0105d713          	srli	a4,a1,0x10
	while ((total+next+1)<size) {
    2c2e:	0a56ff63          	bleu	t0,a3,2cec <core_init_state+0x13a>
				next=8;
    2c32:	45a1                	li	a1,8
				*(p+total+i)=buf[i];
    2c34:	00064483          	lbu	s1,0(a2)
    2c38:	979e                	add	a5,a5,t2
    2c3a:	00978023          	sb	s1,0(a5)
    2c3e:	00164483          	lbu	s1,1(a2)
    2c42:	009780a3          	sb	s1,1(a5)
    2c46:	00264483          	lbu	s1,2(a2)
    2c4a:	00978123          	sb	s1,2(a5)
    2c4e:	00364483          	lbu	s1,3(a2)
    2c52:	009781a3          	sb	s1,3(a5)
			for(i=0;i<next;i++)
    2c56:	4491                	li	s1,4
    2c58:	02958563          	beq	a1,s1,2c82 <core_init_state+0xd0>
				*(p+total+i)=buf[i];
    2c5c:	00464483          	lbu	s1,4(a2)
    2c60:	00978223          	sb	s1,4(a5)
    2c64:	00564483          	lbu	s1,5(a2)
    2c68:	009782a3          	sb	s1,5(a5)
    2c6c:	00664483          	lbu	s1,6(a2)
    2c70:	00978323          	sb	s1,6(a5)
			for(i=0;i<next;i++)
    2c74:	44a1                	li	s1,8
    2c76:	00959663          	bne	a1,s1,2c82 <core_init_state+0xd0>
				*(p+total+i)=buf[i];
    2c7a:	00764603          	lbu	a2,7(a2)
    2c7e:	00c783a3          	sb	a2,7(a5)
			*(p+total+i)=',';
    2c82:	95be                	add	a1,a1,a5
    2c84:	02c00793          	li	a5,44
    2c88:	00f58023          	sb	a5,0(a1)
    2c8c:	87b6                	mv	a5,a3
		switch (seed & 0x7) {
    2c8e:	00777693          	andi	a3,a4,7
    2c92:	ffd68593          	addi	a1,a3,-3
    2c96:	00375613          	srli	a2,a4,0x3
    2c9a:	00367493          	andi	s1,a2,3
    2c9e:	01059613          	slli	a2,a1,0x10
    2ca2:	01065693          	srli	a3,a2,0x10
    2ca6:	4591                	li	a1,4
    2ca8:	f4d5fee3          	bleu	a3,a1,2c04 <core_init_state+0x52>
				buf=intpat[(seed>>3) & 0x3];
    2cac:	0705                	addi	a4,a4,1
    2cae:	048a                	slli	s1,s1,0x2
    2cb0:	00940633          	add	a2,s0,s1
    2cb4:	01071593          	slli	a1,a4,0x10
	while ((total+next+1)<size) {
    2cb8:	00578693          	addi	a3,a5,5
				buf=intpat[(seed>>3) & 0x3];
    2cbc:	4210                	lw	a2,0(a2)
			break;
    2cbe:	0105d713          	srli	a4,a1,0x10
	while ((total+next+1)<size) {
    2cc2:	0256f563          	bleu	t0,a3,2cec <core_init_state+0x13a>
				next=4;
    2cc6:	4591                	li	a1,4
    2cc8:	b7b5                	j	2c34 <core_init_state+0x82>
				buf=scipat[(seed>>3) & 0x3];
    2cca:	661d                	lui	a2,0x7
    2ccc:	94860693          	addi	a3,a2,-1720 # 6948 <scipat>
    2cd0:	00249593          	slli	a1,s1,0x2
    2cd4:	0705                	addi	a4,a4,1
				buf=errpat[(seed>>3) & 0x3];
    2cd6:	00b684b3          	add	s1,a3,a1
    2cda:	01071593          	slli	a1,a4,0x10
	while ((total+next+1)<size) {
    2cde:	00978693          	addi	a3,a5,9
				buf=errpat[(seed>>3) & 0x3];
    2ce2:	4090                	lw	a2,0(s1)
			break;
    2ce4:	0105d713          	srli	a4,a1,0x10
	while ((total+next+1)<size) {
    2ce8:	f456e5e3          	bltu	a3,t0,2c32 <core_init_state+0x80>
	while (total<size) { /* fill the rest with 0 */
    2cec:	02a7f063          	bleu	a0,a5,2d0c <core_init_state+0x15a>
}
    2cf0:	4422                	lw	s0,8(sp)
    2cf2:	4492                	lw	s1,4(sp)
    2cf4:	40f50633          	sub	a2,a0,a5
    2cf8:	4581                	li	a1,0
    2cfa:	00f38533          	add	a0,t2,a5
    2cfe:	0131                	addi	sp,sp,12
    2d00:	b3cfd06f          	j	3c <memset>
				buf=errpat[(seed>>3) & 0x3];
    2d04:	00249593          	slli	a1,s1,0x2
    2d08:	4682                	lw	a3,0(sp)
    2d0a:	bf01                	j	2c1a <core_init_state+0x68>
}
    2d0c:	4422                	lw	s0,8(sp)
    2d0e:	4492                	lw	s1,4(sp)
    2d10:	0131                	addi	sp,sp,12
    2d12:	8082                	ret
	ee_u32 total=0,next=0,i;
    2d14:	4281                	li	t0,0
    2d16:	40550633          	sub	a2,a0,t0
    2d1a:	4581                	li	a1,0
    2d1c:	00538533          	add	a0,t2,t0
    2d20:	b1cfd06f          	j	3c <memset>

00002d24 <benchmark_coremark_main>:
#if MAIN_HAS_NOARGC
MAIN_RETURN_TYPE benchmark_coremark_main(void) {
	int argc=0;
	char *argv[1];
#else
MAIN_RETURN_TYPE benchmark_coremark_main(int argc, char *argv[]) {
    2d24:	fa410113          	addi	sp,sp,-92
	ee_u8 stack_memblock[TOTAL_DATA_SIZE*MULTITHREAD];
#endif


	/* first call any initializations needed */
	portable_init(&(results[0].port), &argc, argv);
    2d28:	6705                	lui	a4,0x1
MAIN_RETURN_TYPE benchmark_coremark_main(int argc, char *argv[]) {
    2d2a:	cc86                	sw	ra,88(sp)
    2d2c:	caa2                	sw	s0,84(sp)
    2d2e:	c8a6                	sw	s1,80(sp)
    2d30:	80410113          	addi	sp,sp,-2044
    2d34:	77fd                	lui	a5,0xfffff
	portable_init(&(results[0].port), &argc, argv);
    2d36:	81870293          	addi	t0,a4,-2024 # 818 <__divdf3+0x3d0>
    2d3a:	1854                	addi	a3,sp,52
    2d3c:	7e878093          	addi	ra,a5,2024 # fffff7e8 <__heap_end+0xdff7f7e8>
    2d40:	00d28333          	add	t1,t0,a3
    2d44:	862e                	mv	a2,a1
MAIN_RETURN_TYPE benchmark_coremark_main(int argc, char *argv[]) {
    2d46:	da2a                	sw	a0,52(sp)
	portable_init(&(results[0].port), &argc, argv);
    2d48:	001305b3          	add	a1,t1,ra
    2d4c:	07a10513          	addi	a0,sp,122
    2d50:	905fe0ef          	jal	ra,1654 <portable_init>
	/* First some checks to make sure benchmark will run ok */
	if (sizeof(struct list_head_s)>128) {
		printf("list_head structure too big for comparable data!\n");
		return MAIN_RETURN_VAL;
	}
	results[0].seed1=get_seed(1);
    2d54:	4505                	li	a0,1
    2d56:	4c2020ef          	jal	ra,5218 <get_seed_32>
    2d5a:	02a11c23          	sh	a0,56(sp)
	results[0].seed2=get_seed(2);
    2d5e:	4509                	li	a0,2
    2d60:	4b8020ef          	jal	ra,5218 <get_seed_32>
    2d64:	02a11d23          	sh	a0,58(sp)
	results[0].seed3=get_seed(3);
    2d68:	450d                	li	a0,3
    2d6a:	4ae020ef          	jal	ra,5218 <get_seed_32>
    2d6e:	02a11e23          	sh	a0,60(sp)
	results[0].iterations=get_seed_32(4);
    2d72:	4511                	li	a0,4
    2d74:	4a4020ef          	jal	ra,5218 <get_seed_32>
    2d78:	caaa                	sw	a0,84(sp)
#if CORE_DEBUG
	results[0].iterations=1;
#endif
	results[0].execs=get_seed_32(5);
    2d7a:	4515                	li	a0,5
    2d7c:	49c020ef          	jal	ra,5218 <get_seed_32>
	if (results[0].execs==0) { /* if not supplied, execute all algorithms */
    2d80:	28050ae3          	beqz	a0,3814 <benchmark_coremark_main+0xaf0>
    2d84:	00157413          	andi	s0,a0,1
    2d88:	83aa                	mv	t2,a0
	results[0].execs=get_seed_32(5);
    2d8a:	ccaa                	sw	a0,88(sp)
    2d8c:	8622                	mv	a2,s0
		results[0].execs=ALL_ALGORITHMS_MASK;
	}
		/* put in some default values based on one seed only for easy testing */
	if ((results[0].seed1==0) && (results[0].seed2==0) && (results[0].seed3==0)) { /* validation run */
    2d8e:	6505                	lui	a0,0x1
    2d90:	81850793          	addi	a5,a0,-2024 # 818 <__divdf3+0x3d0>
    2d94:	184c                	addi	a1,sp,52
    2d96:	74fd                	lui	s1,0xfffff
    2d98:	00b780b3          	add	ra,a5,a1
    2d9c:	00908733          	add	a4,ra,s1
    2da0:	7ec72283          	lw	t0,2028(a4)
    2da4:	c03a                	sw	a4,0(sp)
    2da6:	14028863          	beqz	t0,2ef6 <benchmark_coremark_main+0x1d2>
		results[0].seed1=0;
		results[0].seed2=0;
		results[0].seed3=0x66;
	}
	if ((results[0].seed1==1) && (results[0].seed2==0) && (results[0].seed3==0)) { /* perfromance run */
    2daa:	4685                	li	a3,1
    2dac:	02d29163          	bne	t0,a3,2dce <benchmark_coremark_main+0xaa>
    2db0:	4302                	lw	t1,0(sp)
    2db2:	7f031483          	lh	s1,2032(t1)
    2db6:	ec81                	bnez	s1,2dce <benchmark_coremark_main+0xaa>
		results[0].seed1=0x3415;
    2db8:	4582                	lw	a1,0(sp)
    2dba:	34153537          	lui	a0,0x34153
    2dbe:	41550793          	addi	a5,a0,1045 # 34153415 <__heap_end+0x140d3415>
		results[0].seed2=0x3415;
		results[0].seed3=0x66;
    2dc2:	06600093          	li	ra,102
		results[0].seed1=0x3415;
    2dc6:	7ef5a623          	sw	a5,2028(a1)
		results[0].seed3=0x66;
    2dca:	7e159823          	sh	ra,2032(a1)
		results[i].err=0;
		results[i].execs=results[0].execs;
	}
#elif (MEM_METHOD==MEM_STACK)
	for (i=0 ; i<MULTITHREAD; i++) {
		results[i].memblock[0]=stack_memblock+i*TOTAL_DATA_SIZE;
    2dce:	6505                	lui	a0,0x1
    2dd0:	81850793          	addi	a5,a0,-2024 # 818 <__divdf3+0x3d0>
    2dd4:	184c                	addi	a1,sp,52
    2dd6:	00b780b3          	add	ra,a5,a1
    2dda:	74fd                	lui	s1,0xfffff
    2ddc:	00908733          	add	a4,ra,s1
    2de0:	07c10293          	addi	t0,sp,124
#error "Please define a way to initialize a memory block."
#endif
	/* Data init */
	/* Find out how space much we have based on number of algorithms */
	for (i=0; i<NUM_ALGORITHMS; i++) {
		if ((1<<(ee_u32)i) & results[0].execs)
    2de4:	0023f793          	andi	a5,t2,2
			num_algorithms++;
    2de8:	00f036b3          	snez	a3,a5
		results[i].memblock[0]=stack_memblock+i*TOTAL_DATA_SIZE;
    2dec:	c03a                	sw	a4,0(sp)
    2dee:	7e572a23          	sw	t0,2036(a4)
		results[i].err=0;
    2df2:	06011c23          	sh	zero,120(sp)
		if ((1<<(ee_u32)i) & results[0].execs)
    2df6:	0043f593          	andi	a1,t2,4
			num_algorithms++;
    2dfa:	00d404b3          	add	s1,s0,a3
		if ((1<<(ee_u32)i) & results[0].execs)
    2dfe:	c599                	beqz	a1,2e0c <benchmark_coremark_main+0xe8>
			num_algorithms++;
    2e00:	00148513          	addi	a0,s1,1 # fffff001 <__heap_end+0xdff7f001>
    2e04:	01051093          	slli	ra,a0,0x10
    2e08:	0100d493          	srli	s1,ra,0x10
	}
	for (i=0 ; i<MULTITHREAD; i++)
		results[i].size=results[i].size/num_algorithms;
    2e0c:	7d000713          	li	a4,2000
    2e10:	02975533          	divu	a0,a4,s1
    2e14:	72fd                	lui	t0,0xfffff
	/* Assign pointers */
	for (i=0; i<NUM_ALGORITHMS; i++) {
		ee_u32 ctx;
		if ((1<<(ee_u32)i) & results[0].execs) {
    2e16:	4681                	li	a3,0
		results[i].size=results[i].size/num_algorithms;
    2e18:	c8aa                	sw	a0,80(sp)
		if ((1<<(ee_u32)i) & results[0].execs) {
    2e1a:	200413e3          	bnez	s0,3820 <benchmark_coremark_main+0xafc>
    2e1e:	22079be3          	bnez	a5,3854 <benchmark_coremark_main+0xb30>
    2e22:	20059fe3          	bnez	a1,3840 <benchmark_coremark_main+0xb1c>
			j++;
		}
	}
	/* call inits */
	for (i=0 ; i<MULTITHREAD; i++) {
		if (results[i].execs & ID_LIST) {
    2e26:	0e061363          	bnez	a2,2f0c <benchmark_coremark_main+0x1e8>
			results[i].list=core_list_init(results[0].size,results[i].memblock[1],results[i].seed1);
		}
		if (results[i].execs & ID_MATRIX) {
    2e2a:	10079863          	bnez	a5,2f3a <benchmark_coremark_main+0x216>
			core_init_matrix(results[0].size, results[i].memblock[2], (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16), &(results[i].mat) );
		}
		if (results[i].execs & ID_STATE) {
    2e2e:	0043f293          	andi	t0,t2,4
    2e32:	02028163          	beqz	t0,2e54 <benchmark_coremark_main+0x130>
			core_init_state(results[0].size,results[i].seed1,results[i].memblock[3]);
    2e36:	6085                	lui	ra,0x1
    2e38:	81808593          	addi	a1,ra,-2024 # 818 <__divdf3+0x3d0>
    2e3c:	1854                	addi	a3,sp,52
    2e3e:	757d                	lui	a0,0xfffff
    2e40:	00d584b3          	add	s1,a1,a3
    2e44:	00a48733          	add	a4,s1,a0
    2e48:	4636                	lw	a2,76(sp)
    2e4a:	7ec71583          	lh	a1,2028(a4)
    2e4e:	4546                	lw	a0,80(sp)
    2e50:	c03a                	sw	a4,0(sp)
    2e52:	3385                	jal	2bb2 <core_init_state>
		}
	}

	/* automatically determine number of iterations if not set */
	if (results[0].iterations==0) {
    2e54:	43d6                	lw	t2,84(sp)
    2e56:	12039b63          	bnez	t2,2f8c <benchmark_coremark_main+0x268>
    2e5a:	00007337          	lui	t1,0x7
		secs_ret secs_passed=0;
		ee_u32 divisor;
		results[0].iterations=1;
		while (secs_passed < (secs_ret)1) {
    2e5e:	a0832603          	lw	a2,-1528(t1) # 6a08 <scipat+0xc0>
    2e62:	a0c32403          	lw	s0,-1524(t1)
    2e66:	4785                	li	a5,1
    2e68:	c432                	sw	a2,8(sp)
    2e6a:	c622                	sw	s0,12(sp)
    2e6c:	80be                	mv	ra,a5
                        //printf("secs_passed=%d\n", secs_passed);
			results[0].iterations*=10;
    2e6e:	00209293          	slli	t0,ra,0x2
    2e72:	00128533          	add	a0,t0,ra
    2e76:	00151093          	slli	ra,a0,0x1
    2e7a:	ca86                	sw	ra,84(sp)
			start_time();
    2e7c:	f74fe0ef          	jal	ra,15f0 <start_time>
		crc=core_bench_list(res,1);
    2e80:	6685                	lui	a3,0x1
	ee_u32 iterations=res->iterations;
    2e82:	47d6                	lw	a5,84(sp)
		crc=core_bench_list(res,1);
    2e84:	75fd                	lui	a1,0xfffff
    2e86:	81868713          	addi	a4,a3,-2024 # 818 <__divdf3+0x3d0>
    2e8a:	03410393          	addi	t2,sp,52
    2e8e:	7ec58493          	addi	s1,a1,2028 # fffff7ec <__heap_end+0xdff7f7ec>
    2e92:	00770333          	add	t1,a4,t2
	res->crc=0;
    2e96:	d882                	sw	zero,112(sp)
    2e98:	da82                	sw	zero,116(sp)
	for (i=0; i<iterations; i++) {
    2e9a:	4401                	li	s0,0
		crc=core_bench_list(res,1);
    2e9c:	949a                	add	s1,s1,t1
	for (i=0; i<iterations; i++) {
    2e9e:	cf85                	beqz	a5,2ed6 <benchmark_coremark_main+0x1b2>
		crc=core_bench_list(res,1);
    2ea0:	4585                	li	a1,1
    2ea2:	8526                	mv	a0,s1
    2ea4:	c03e                	sw	a5,0(sp)
    2ea6:	477020ef          	jal	ra,5b1c <core_bench_list>
		res->crc=crcu16(crc,res->crc);
    2eaa:	07015583          	lhu	a1,112(sp)
    2eae:	3b8020ef          	jal	ra,5266 <crcu16>
    2eb2:	06a11823          	sh	a0,112(sp)
		crc=core_bench_list(res,-1);
    2eb6:	55fd                	li	a1,-1
    2eb8:	8526                	mv	a0,s1
    2eba:	463020ef          	jal	ra,5b1c <core_bench_list>
		res->crc=crcu16(crc,res->crc);
    2ebe:	07015583          	lhu	a1,112(sp)
    2ec2:	3a4020ef          	jal	ra,5266 <crcu16>
    2ec6:	06a11823          	sh	a0,112(sp)
		if (i==0) res->crclist=res->crc;
    2eca:	4782                	lw	a5,0(sp)
    2ecc:	1c0404e3          	beqz	s0,3894 <benchmark_coremark_main+0xb70>
	for (i=0; i<iterations; i++) {
    2ed0:	0405                	addi	s0,s0,1
    2ed2:	fc8797e3          	bne	a5,s0,2ea0 <benchmark_coremark_main+0x17c>
			iterate(&results[0]);
			stop_time();
    2ed6:	f32fe0ef          	jal	ra,1608 <stop_time>
			secs_passed=time_in_secs(get_time());
    2eda:	f46fe0ef          	jal	ra,1620 <get_time>
    2ede:	f58fe0ef          	jal	ra,1636 <time_in_secs>
		while (secs_passed < (secs_ret)1) {
    2ee2:	4622                	lw	a2,8(sp)
    2ee4:	46b2                	lw	a3,12(sp)
			secs_passed=time_in_secs(get_time());
    2ee6:	842a                	mv	s0,a0
    2ee8:	84ae                	mv	s1,a1
		while (secs_passed < (secs_ret)1) {
    2eea:	b95fd0ef          	jal	ra,a7e <__ledf2>
    2eee:	08055063          	bgez	a0,2f6e <benchmark_coremark_main+0x24a>
    2ef2:	40d6                	lw	ra,84(sp)
    2ef4:	bfad                	j	2e6e <benchmark_coremark_main+0x14a>
	if ((results[0].seed1==0) && (results[0].seed2==0) && (results[0].seed3==0)) { /* validation run */
    2ef6:	4702                	lw	a4,0(sp)
    2ef8:	7f071283          	lh	t0,2032(a4)
    2efc:	ec0299e3          	bnez	t0,2dce <benchmark_coremark_main+0xaa>
		results[0].seed3=0x66;
    2f00:	4682                	lw	a3,0(sp)
    2f02:	06600313          	li	t1,102
    2f06:	7e669823          	sh	t1,2032(a3)
	if ((results[0].seed1==1) && (results[0].seed2==0) && (results[0].seed3==0)) { /* perfromance run */
    2f0a:	b5d1                	j	2dce <benchmark_coremark_main+0xaa>
			results[i].list=core_list_init(results[0].size,results[i].memblock[1],results[i].seed1);
    2f0c:	6605                	lui	a2,0x1
    2f0e:	81860793          	addi	a5,a2,-2024 # 818 <__divdf3+0x3d0>
    2f12:	03410313          	addi	t1,sp,52
    2f16:	73fd                	lui	t2,0xfffff
    2f18:	00678433          	add	s0,a5,t1
    2f1c:	007402b3          	add	t0,s0,t2
    2f20:	7ec29603          	lh	a2,2028(t0) # fffff7ec <__heap_end+0xdff7f7ec>
    2f24:	7f82a583          	lw	a1,2040(t0)
    2f28:	c016                	sw	t0,0(sp)
    2f2a:	3bc030ef          	jal	ra,62e6 <core_list_init>
    2f2e:	43e6                	lw	t2,88(sp)
    2f30:	ceaa                	sw	a0,92(sp)
    2f32:	0023f793          	andi	a5,t2,2
		if (results[i].execs & ID_MATRIX) {
    2f36:	ee078ce3          	beqz	a5,2e2e <benchmark_coremark_main+0x10a>
			core_init_matrix(results[0].size, results[i].memblock[2], (ee_s32)results[i].seed1 | (((ee_s32)results[i].seed2) << 16), &(results[i].mat) );
    2f3a:	6085                	lui	ra,0x1
    2f3c:	81808593          	addi	a1,ra,-2024 # 818 <__divdf3+0x3d0>
    2f40:	1854                	addi	a3,sp,52
    2f42:	00d584b3          	add	s1,a1,a3
    2f46:	757d                	lui	a0,0xfffff
    2f48:	00a48733          	add	a4,s1,a0
    2f4c:	c03a                	sw	a4,0(sp)
    2f4e:	4302                	lw	t1,0(sp)
    2f50:	7ee71383          	lh	t2,2030(a4)
    2f54:	4546                	lw	a0,80(sp)
    2f56:	7ec31603          	lh	a2,2028(t1)
    2f5a:	7fc32583          	lw	a1,2044(t1)
    2f5e:	01039793          	slli	a5,t2,0x10
    2f62:	1094                	addi	a3,sp,96
    2f64:	8e5d                	or	a2,a2,a5
    2f66:	771010ef          	jal	ra,4ed6 <core_init_matrix>
    2f6a:	43e6                	lw	t2,88(sp)
    2f6c:	b5c9                	j	2e2e <benchmark_coremark_main+0x10a>
			//secs_passed = 2;
		}
		/* now we know it executes for at least 1 sec, set actual run time at about 10 secs */
		divisor=(ee_u32)secs_passed;
    2f6e:	85a6                	mv	a1,s1
    2f70:	8522                	mv	a0,s0
    2f72:	c25fd0ef          	jal	ra,b96 <__fixunsdfsi>
		if (divisor==0) /* some machines cast float to int as 0 since this conversion is not defined by ANSI, but we know at least one second passed */
    2f76:	45ad                	li	a1,11
    2f78:	c511                	beqz	a0,2f84 <benchmark_coremark_main+0x260>
    2f7a:	42a9                	li	t0,10
    2f7c:	02a2d533          	divu	a0,t0,a0
    2f80:	00150593          	addi	a1,a0,1 # fffff001 <__heap_end+0xdff7f001>
			divisor=1;
		results[0].iterations*=1+10/divisor;
    2f84:	40d6                	lw	ra,84(sp)
    2f86:	02b086b3          	mul	a3,ra,a1
    2f8a:	cab6                	sw	a3,84(sp)
	}
	/* perform actual benchmark */
	Timer_Open();
    2f8c:	efcfe0ef          	jal	ra,1688 <Timer_Open>
	Timer_Start();
    2f90:	f2cfe0ef          	jal	ra,16bc <Timer_Start>
	start_time();
    2f94:	e5cfe0ef          	jal	ra,15f0 <start_time>
	ee_u32 iterations=res->iterations;
    2f98:	43d6                	lw	t2,84(sp)
		crc=core_bench_list(res,1);
    2f9a:	6785                	lui	a5,0x1
    2f9c:	1840                	addi	s0,sp,52
    2f9e:	777d                	lui	a4,0xfffff
    2fa0:	81878613          	addi	a2,a5,-2024 # 818 <__divdf3+0x3d0>
    2fa4:	7ec70313          	addi	t1,a4,2028 # fffff7ec <__heap_end+0xdff7f7ec>
    2fa8:	008602b3          	add	t0,a2,s0
	ee_u32 iterations=res->iterations;
    2fac:	c01e                	sw	t2,0(sp)
	res->crc=0;
    2fae:	d882                	sw	zero,112(sp)
    2fb0:	da82                	sw	zero,116(sp)
	for (i=0; i<iterations; i++) {
    2fb2:	4481                	li	s1,0
		crc=core_bench_list(res,1);
    2fb4:	00628433          	add	s0,t0,t1
	for (i=0; i<iterations; i++) {
    2fb8:	02038c63          	beqz	t2,2ff0 <benchmark_coremark_main+0x2cc>
		crc=core_bench_list(res,1);
    2fbc:	4585                	li	a1,1
    2fbe:	8522                	mv	a0,s0
    2fc0:	35d020ef          	jal	ra,5b1c <core_bench_list>
		res->crc=crcu16(crc,res->crc);
    2fc4:	07015583          	lhu	a1,112(sp)
    2fc8:	29e020ef          	jal	ra,5266 <crcu16>
    2fcc:	06a11823          	sh	a0,112(sp)
		crc=core_bench_list(res,-1);
    2fd0:	55fd                	li	a1,-1
    2fd2:	8522                	mv	a0,s0
    2fd4:	349020ef          	jal	ra,5b1c <core_bench_list>
		res->crc=crcu16(crc,res->crc);
    2fd8:	07015583          	lhu	a1,112(sp)
    2fdc:	28a020ef          	jal	ra,5266 <crcu16>
    2fe0:	06a11823          	sh	a0,112(sp)
		if (i==0) res->crclist=res->crc;
    2fe4:	24048163          	beqz	s1,3226 <benchmark_coremark_main+0x502>
	for (i=0; i<iterations; i++) {
    2fe8:	4502                	lw	a0,0(sp)
    2fea:	0485                	addi	s1,s1,1
    2fec:	fc9518e3          	bne	a0,s1,2fbc <benchmark_coremark_main+0x298>
		core_stop_parallel(&results[i]);
	}
#else
	iterate(&results[0]);
#endif
	stop_time();
    2ff0:	e18fe0ef          	jal	ra,1608 <stop_time>
	total_time=get_time();
    2ff4:	e2cfe0ef          	jal	ra,1620 <get_time>
    2ff8:	c42a                	sw	a0,8(sp)

	Timer_Stop();
    2ffa:	eccfe0ef          	jal	ra,16c6 <Timer_Stop>
	Timer_Close();
    2ffe:	ed2fe0ef          	jal	ra,16d0 <Timer_Close>

	/* get a function of the input to report */
	seedcrc=crc16(results[0].seed1,seedcrc);
    3002:	6685                	lui	a3,0x1
    3004:	81868713          	addi	a4,a3,-2024 # 818 <__divdf3+0x3d0>
    3008:	03410313          	addi	t1,sp,52
    300c:	73fd                	lui	t2,0xfffff
    300e:	006707b3          	add	a5,a4,t1
    3012:	00778633          	add	a2,a5,t2
    3016:	7ec61503          	lh	a0,2028(a2)
    301a:	4581                	li	a1,0
    301c:	c032                	sw	a2,0(sp)
    301e:	0c7020ef          	jal	ra,58e4 <crc16>
	seedcrc=crc16(results[0].seed2,seedcrc);
    3022:	4402                	lw	s0,0(sp)
    3024:	85aa                	mv	a1,a0
    3026:	64a1                	lui	s1,0x8
    3028:	7ee41503          	lh	a0,2030(s0)
    302c:	0b9020ef          	jal	ra,58e4 <crc16>
	seedcrc=crc16(results[0].seed3,seedcrc);
    3030:	4282                	lw	t0,0(sp)
    3032:	85aa                	mv	a1,a0
    3034:	7f029503          	lh	a0,2032(t0)
    3038:	0ad020ef          	jal	ra,58e4 <crc16>
	seedcrc=crc16(results[0].size,seedcrc);
    303c:	85aa                	mv	a1,a0
    303e:	05011503          	lh	a0,80(sp)
    3042:	0a3020ef          	jal	ra,58e4 <crc16>
    3046:	d42a                	sw	a0,40(sp)

	switch (seedcrc) { /* test known output for common seeds */
    3048:	b0548593          	addi	a1,s1,-1275 # 7b05 <__erodata+0xccd>
    304c:	83aa                	mv	t2,a0
    304e:	14b508e3          	beq	a0,a1,399e <benchmark_coremark_main+0xc7a>
    3052:	18a5fb63          	bleu	a0,a1,31e8 <benchmark_coremark_main+0x4c4>
    3056:	64a5                	lui	s1,0x9
    3058:	a0248513          	addi	a0,s1,-1534 # 8a02 <__erodata+0x1bca>
    305c:	16a388e3          	beq	t2,a0,39cc <benchmark_coremark_main+0xca8>
    3060:	60bd                	lui	ra,0xf
    3062:	9f508293          	addi	t0,ra,-1547 # e9f5 <__erodata+0x7bbd>
    3066:	1c539863          	bne	t2,t0,3236 <benchmark_coremark_main+0x512>
			known_id=2;
			printf("Profile generation run parameters for coremark.\n");
			break;
		case 0xe9f5: /* seed1=0, seed2=0, seed3=0x66, size 666 per algorithm */
			known_id=3;
			printf("2K performance run parameters for coremark.\n");
    306a:	000076b7          	lui	a3,0x7
    306e:	aa068513          	addi	a0,a3,-1376 # 6aa0 <scipat+0x158>
    3072:	edcfe0ef          	jal	ra,174e <puts>
    3076:	6509                	lui	a0,0x2
    3078:	63b9                	lui	t2,0xe
    307a:	fd750593          	addi	a1,a0,-41 # 1fd7 <printf+0x807>
    307e:	e3a48493          	addi	s1,s1,-454
    3082:	71438713          	addi	a4,t2,1812 # e714 <__erodata+0x78dc>
			known_id=3;
    3086:	430d                	li	t1,3
			printf("2K performance run parameters for coremark.\n");
    3088:	c026                	sw	s1,0(sp)
    308a:	d62e                	sw	a1,44(sp)
    308c:	cc2e                	sw	a1,24(sp)
    308e:	ca3a                	sw	a4,20(sp)
			known_id=3;
    3090:	d81a                	sw	t1,48(sp)
		default:
			total_errors=-1;
			break;
	}
	if (known_id>=0) {
		for (i=0 ; i<default_num_contexts; i++) {
    3092:	200004b7          	lui	s1,0x20000
			results[i].err=0;
    3096:	6705                	lui	a4,0x1
		for (i=0 ; i<default_num_contexts; i++) {
    3098:	0044a503          	lw	a0,4(s1) # 20000004 <default_num_contexts>
			results[i].err=0;
    309c:	81870313          	addi	t1,a4,-2024 # 818 <__divdf3+0x3d0>
    30a0:	185c                	addi	a5,sp,52
    30a2:	73fd                	lui	t2,0xfffff
    30a4:	00f30633          	add	a2,t1,a5
		for (i=0 ; i<default_num_contexts; i++) {
    30a8:	4581                	li	a1,0
    30aa:	4081                	li	ra,0
			results[i].err=0;
    30ac:	00760433          	add	s0,a2,t2
		for (i=0 ; i<default_num_contexts; i++) {
    30b0:	18050963          	beqz	a0,3242 <benchmark_coremark_main+0x51e>
    30b4:	83a6                	mv	t2,s1
    30b6:	82a2                	mv	t0,s0
    30b8:	8486                	mv	s1,ra
    30ba:	a08d                	j	311c <benchmark_coremark_main+0x3f8>
				(results[i].crcmatrix!=matrix_known_crc[known_id])) {
				printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n",i,results[i].crcmatrix,matrix_known_crc[known_id]);
				results[i].err++;
			}
			if ((results[i].execs & ID_STATE) &&
				(results[i].crcstate!=state_known_crc[known_id])) {
    30bc:	82a45603          	lhu	a2,-2006(s0)
			if ((results[i].execs & ID_STATE) &&
    30c0:	4502                	lw	a0,0(sp)
    30c2:	12a60063          	beq	a2,a0,31e2 <benchmark_coremark_main+0x4be>
    30c6:	ce16                	sw	t0,28(sp)
				printf("[%u]ERROR! state crc 0x%04x - should be 0x%04x\n",i,results[i].crcstate,state_known_crc[known_id]);
    30c8:	000072b7          	lui	t0,0x7
    30cc:	86aa                	mv	a3,a0
    30ce:	c82e                	sw	a1,16(sp)
    30d0:	b5c28513          	addi	a0,t0,-1188 # 6b5c <scipat+0x214>
    30d4:	85a6                	mv	a1,s1
    30d6:	d01e                	sw	t2,32(sp)
    30d8:	ef8fe0ef          	jal	ra,17d0 <printf>
				results[i].err++;
    30dc:	82c45583          	lhu	a1,-2004(s0)
    30e0:	42f2                	lw	t0,28(sp)
    30e2:	00158393          	addi	t2,a1,1
    30e6:	01039693          	slli	a3,t2,0x10
    30ea:	45c2                	lw	a1,16(sp)
    30ec:	5382                	lw	t2,32(sp)
    30ee:	0106d713          	srli	a4,a3,0x10
    30f2:	82e41623          	sh	a4,-2004(s0)
			}
			total_errors+=results[i].err;
    30f6:	00b700b3          	add	ra,a4,a1
		for (i=0 ; i<default_num_contexts; i++) {
    30fa:	0485                	addi	s1,s1,1
			total_errors+=results[i].err;
    30fc:	01009313          	slli	t1,ra,0x10
		for (i=0 ; i<default_num_contexts; i++) {
    3100:	0043a403          	lw	s0,4(t2) # fffff004 <__heap_end+0xdff7f004>
			total_errors+=results[i].err;
    3104:	01035513          	srli	a0,t1,0x10
		for (i=0 ; i<default_num_contexts; i++) {
    3108:	01049793          	slli	a5,s1,0x10
			total_errors+=results[i].err;
    310c:	01051613          	slli	a2,a0,0x10
		for (i=0 ; i<default_num_contexts; i++) {
    3110:	0107d493          	srli	s1,a5,0x10
			total_errors+=results[i].err;
    3114:	41065593          	srai	a1,a2,0x10
		for (i=0 ; i<default_num_contexts; i++) {
    3118:	6e84f163          	bleu	s0,s1,37fa <benchmark_coremark_main+0xad6>
			results[i].err=0;
    311c:	00449413          	slli	s0,s1,0x4
    3120:	009406b3          	add	a3,s0,s1
    3124:	00269513          	slli	a0,a3,0x2
    3128:	00a280b3          	add	ra,t0,a0
    312c:	6705                	lui	a4,0x1
    312e:	00170333          	add	t1,a4,ra
			if ((results[i].execs & ID_LIST) &&
    3132:	80c32783          	lw	a5,-2036(t1)
			results[i].err=0;
    3136:	82031623          	sh	zero,-2004(t1)
			if ((results[i].execs & ID_LIST) &&
    313a:	0017f613          	andi	a2,a5,1
    313e:	ca1d                	beqz	a2,3174 <benchmark_coremark_main+0x450>
				(results[i].crclist!=list_known_crc[known_id])) {
    3140:	82635603          	lhu	a2,-2010(t1)
			if ((results[i].execs & ID_LIST) &&
    3144:	46d2                	lw	a3,20(sp)
				(results[i].crclist!=list_known_crc[known_id])) {
    3146:	c81a                	sw	t1,16(sp)
			if ((results[i].execs & ID_LIST) &&
    3148:	02d60663          	beq	a2,a3,3174 <benchmark_coremark_main+0x450>
    314c:	d016                	sw	t0,32(sp)
				printf("[%u]ERROR! list crc 0x%04x - should be 0x%04x\n",i,results[i].crclist,list_known_crc[known_id]);
    314e:	000072b7          	lui	t0,0x7
    3152:	ce2e                	sw	a1,28(sp)
    3154:	af828513          	addi	a0,t0,-1288 # 6af8 <scipat+0x1b0>
    3158:	85a6                	mv	a1,s1
    315a:	d21e                	sw	t2,36(sp)
    315c:	e74fe0ef          	jal	ra,17d0 <printf>
				results[i].err++;
    3160:	45c2                	lw	a1,16(sp)
    3162:	5282                	lw	t0,32(sp)
    3164:	82c5d383          	lhu	t2,-2004(a1)
    3168:	00138693          	addi	a3,t2,1
    316c:	82d59623          	sh	a3,-2004(a1)
    3170:	5392                	lw	t2,36(sp)
    3172:	45f2                	lw	a1,28(sp)
			if ((results[i].execs & ID_MATRIX) &&
    3174:	00940533          	add	a0,s0,s1
    3178:	00251093          	slli	ra,a0,0x2
    317c:	00128733          	add	a4,t0,ra
    3180:	6305                	lui	t1,0x1
    3182:	00e307b3          	add	a5,t1,a4
    3186:	80c7a703          	lw	a4,-2036(a5)
    318a:	00277613          	andi	a2,a4,2
    318e:	ce15                	beqz	a2,31ca <benchmark_coremark_main+0x4a6>
				(results[i].crcmatrix!=matrix_known_crc[known_id])) {
    3190:	8287d603          	lhu	a2,-2008(a5)
			if ((results[i].execs & ID_MATRIX) &&
    3194:	4562                	lw	a0,24(sp)
				(results[i].crcmatrix!=matrix_known_crc[known_id])) {
    3196:	c83e                	sw	a5,16(sp)
			if ((results[i].execs & ID_MATRIX) &&
    3198:	02a60963          	beq	a2,a0,31ca <benchmark_coremark_main+0x4a6>
				printf("[%u]ERROR! matrix crc 0x%04x - should be 0x%04x\n",i,results[i].crcmatrix,matrix_known_crc[known_id]);
    319c:	56b2                	lw	a3,44(sp)
    319e:	d016                	sw	t0,32(sp)
    31a0:	000072b7          	lui	t0,0x7
    31a4:	ce2e                	sw	a1,28(sp)
    31a6:	b2828513          	addi	a0,t0,-1240 # 6b28 <scipat+0x1e0>
    31aa:	85a6                	mv	a1,s1
    31ac:	d21e                	sw	t2,36(sp)
    31ae:	e22fe0ef          	jal	ra,17d0 <printf>
				results[i].err++;
    31b2:	45c2                	lw	a1,16(sp)
    31b4:	5282                	lw	t0,32(sp)
    31b6:	82c5d383          	lhu	t2,-2004(a1)
    31ba:	80c5a703          	lw	a4,-2036(a1)
    31be:	00138693          	addi	a3,t2,1
    31c2:	82d59623          	sh	a3,-2004(a1)
    31c6:	5392                	lw	t2,36(sp)
    31c8:	45f2                	lw	a1,28(sp)
				(results[i].crcstate!=state_known_crc[known_id])) {
    31ca:	9426                	add	s0,s0,s1
    31cc:	00241313          	slli	t1,s0,0x2
    31d0:	00628633          	add	a2,t0,t1
    31d4:	6785                	lui	a5,0x1
			if ((results[i].execs & ID_STATE) &&
    31d6:	00477093          	andi	ra,a4,4
				(results[i].crcstate!=state_known_crc[known_id])) {
    31da:	00c78433          	add	s0,a5,a2
			if ((results[i].execs & ID_STATE) &&
    31de:	ec009fe3          	bnez	ra,30bc <benchmark_coremark_main+0x398>
    31e2:	82c45703          	lhu	a4,-2004(s0)
    31e6:	bf01                	j	30f6 <benchmark_coremark_main+0x3d2>
    31e8:	6789                	lui	a5,0x2
    31ea:	8f278613          	addi	a2,a5,-1806 # 18f2 <printf+0x122>
    31ee:	78c50263          	beq	a0,a2,3972 <benchmark_coremark_main+0xc4e>
    31f2:	6495                	lui	s1,0x5
    31f4:	eaf48093          	addi	ra,s1,-337 # 4eaf <core_bench_matrix+0x14b7>
    31f8:	02151f63          	bne	a0,ra,3236 <benchmark_coremark_main+0x512>
			printf("Profile generation run parameters for coremark.\n");
    31fc:	00007737          	lui	a4,0x7
    3200:	a7070513          	addi	a0,a4,-1424 # 6a70 <scipat+0x128>
    3204:	d4afe0ef          	jal	ra,174e <puts>
    3208:	6339                	lui	t1,0xe
    320a:	641d                	lui	s0,0x7
    320c:	60848613          	addi	a2,s1,1544
    3210:	5a430793          	addi	a5,t1,1444 # e5a4 <__erodata+0x776c>
    3214:	a7940293          	addi	t0,s0,-1415 # 6a79 <scipat+0x131>
			known_id=2;
    3218:	4689                	li	a3,2
			printf("Profile generation run parameters for coremark.\n");
    321a:	c03e                	sw	a5,0(sp)
    321c:	d632                	sw	a2,44(sp)
    321e:	cc32                	sw	a2,24(sp)
    3220:	ca16                	sw	t0,20(sp)
			known_id=2;
    3222:	d836                	sw	a3,48(sp)
    3224:	b5bd                	j	3092 <benchmark_coremark_main+0x36e>
	for (i=0; i<iterations; i++) {
    3226:	4082                	lw	ra,0(sp)
		if (i==0) res->crclist=res->crc;
    3228:	06a11923          	sh	a0,114(sp)
	for (i=0; i<iterations; i++) {
    322c:	4585                	li	a1,1
    322e:	dcb081e3          	beq	ra,a1,2ff0 <benchmark_coremark_main+0x2cc>
    3232:	4485                	li	s1,1
    3234:	b361                	j	2fbc <benchmark_coremark_main+0x298>
	switch (seedcrc) { /* test known output for common seeds */
    3236:	6541                	lui	a0,0x10
	ee_s16 known_id=-1,total_errors=0;
    3238:	55fd                	li	a1,-1
	switch (seedcrc) { /* test known output for common seeds */
    323a:	157d                	addi	a0,a0,-1
	ee_s16 known_id=-1,total_errors=0;
    323c:	d82e                	sw	a1,48(sp)
    323e:	200004b7          	lui	s1,0x20000
    3242:	c02a                	sw	a0,0(sp)
		}
	}
	total_errors+=check_data_types();
    3244:	0d5020ef          	jal	ra,5b18 <check_data_types>
    3248:	4682                	lw	a3,0(sp)
	/* and report results */
	printf("CoreMark Size    : %u\n",(ee_u32)results[0].size);
    324a:	45c6                	lw	a1,80(sp)
    324c:	000072b7          	lui	t0,0x7
	total_errors+=check_data_types();
    3250:	00a68733          	add	a4,a3,a0
    3254:	01071393          	slli	t2,a4,0x10
	printf("CoreMark Size    : %u\n",(ee_u32)results[0].size);
    3258:	b8c28513          	addi	a0,t0,-1140 # 6b8c <scipat+0x244>
	total_errors+=check_data_types();
    325c:	0103d413          	srli	s0,t2,0x10
	printf("CoreMark Size    : %u\n",(ee_u32)results[0].size);
    3260:	d70fe0ef          	jal	ra,17d0 <printf>
	printf("Total ticks      : %u\n",(ee_u32)total_time);
    3264:	45a2                	lw	a1,8(sp)
    3266:	00007337          	lui	t1,0x7
    326a:	ba430513          	addi	a0,t1,-1116 # 6ba4 <scipat+0x25c>
    326e:	d62fe0ef          	jal	ra,17d0 <printf>
#if HAS_FLOAT
	printf("Total time (secs): %f\n",time_in_secs(total_time));
    3272:	4522                	lw	a0,8(sp)
    3274:	bc2fe0ef          	jal	ra,1636 <time_in_secs>
    3278:	000077b7          	lui	a5,0x7
    327c:	862e                	mv	a2,a1
    327e:	85aa                	mv	a1,a0
    3280:	bbc78513          	addi	a0,a5,-1092 # 6bbc <scipat+0x274>
    3284:	d4cfe0ef          	jal	ra,17d0 <printf>
	if (time_in_secs(total_time) > 0)
    3288:	4522                	lw	a0,8(sp)
    328a:	bacfe0ef          	jal	ra,1636 <time_in_secs>
    328e:	4601                	li	a2,0
    3290:	4681                	li	a3,0
    3292:	f38fd0ef          	jal	ra,9ca <__gedf2>
    3296:	02a05c63          	blez	a0,32ce <benchmark_coremark_main+0x5aa>
		printf("Iterations/Sec   : %f\n",default_num_contexts*results[0].iterations/time_in_secs(total_time));
    329a:	0044a083          	lw	ra,4(s1) # 20000004 <default_num_contexts>
    329e:	4656                	lw	a2,84(sp)
    32a0:	02160533          	mul	a0,a2,ra
    32a4:	94ffd0ef          	jal	ra,bf2 <__floatunsidf>
    32a8:	c02a                	sw	a0,0(sp)
    32aa:	4522                	lw	a0,8(sp)
    32ac:	c22e                	sw	a1,4(sp)
    32ae:	b88fe0ef          	jal	ra,1636 <time_in_secs>
    32b2:	862a                	mv	a2,a0
    32b4:	86ae                	mv	a3,a1
    32b6:	4502                	lw	a0,0(sp)
    32b8:	4592                	lw	a1,4(sp)
    32ba:	98efd0ef          	jal	ra,448 <__divdf3>
    32be:	000076b7          	lui	a3,0x7
    32c2:	862e                	mv	a2,a1
    32c4:	85aa                	mv	a1,a0
    32c6:	bd468513          	addi	a0,a3,-1068 # 6bd4 <scipat+0x28c>
    32ca:	d06fe0ef          	jal	ra,17d0 <printf>
#else
	printf("Total time (secs): %d\n",time_in_secs(total_time));
	if (time_in_secs(total_time) > 0)
		printf("Iterations/Sec   : %d\n",default_num_contexts*results[0].iterations/time_in_secs(total_time));
#endif
	if (time_in_secs(total_time) < 10) {
    32ce:	4522                	lw	a0,8(sp)
    32d0:	b66fe0ef          	jal	ra,1636 <time_in_secs>
    32d4:	00007737          	lui	a4,0x7
    32d8:	a1072603          	lw	a2,-1520(a4) # 6a10 <scipat+0xc8>
    32dc:	a1472683          	lw	a3,-1516(a4)
    32e0:	f9efd0ef          	jal	ra,a7e <__ledf2>
    32e4:	5c054063          	bltz	a0,38a4 <benchmark_coremark_main+0xb80>
		printf("ERROR! Must execute for at least 10 secs for a valid result!\n");
		total_errors++;
	}

	printf("Iterations       : %u\n",(ee_u32)default_num_contexts*results[0].iterations);
    32e8:	0044a783          	lw	a5,4(s1)
    32ec:	40d6                	lw	ra,84(sp)
    32ee:	00007637          	lui	a2,0x7
		total_errors++;
    32f2:	01041293          	slli	t0,s0,0x10
	printf("Iterations       : %u\n",(ee_u32)default_num_contexts*results[0].iterations);
    32f6:	02f085b3          	mul	a1,ra,a5
		total_errors++;
    32fa:	4102d313          	srai	t1,t0,0x10
	printf("Iterations       : %u\n",(ee_u32)default_num_contexts*results[0].iterations);
    32fe:	c2c60513          	addi	a0,a2,-980 # 6c2c <scipat+0x2e4>
		total_errors++;
    3302:	c81a                	sw	t1,16(sp)
	printf("Iterations       : %u\n",(ee_u32)default_num_contexts*results[0].iterations);
    3304:	cccfe0ef          	jal	ra,17d0 <printf>
	printf("Compiler version : %s\n",COMPILER_VERSION);
    3308:	000076b7          	lui	a3,0x7
    330c:	00007537          	lui	a0,0x7
    3310:	c4450593          	addi	a1,a0,-956 # 6c44 <scipat+0x2fc>
    3314:	c5068513          	addi	a0,a3,-944 # 6c50 <scipat+0x308>
    3318:	cb8fe0ef          	jal	ra,17d0 <printf>
	printf("Compiler flags   : %s\n",COMPILER_FLAGS);
    331c:	00007737          	lui	a4,0x7
    3320:	000075b7          	lui	a1,0x7
    3324:	c6870513          	addi	a0,a4,-920 # 6c68 <scipat+0x320>
    3328:	d8458593          	addi	a1,a1,-636 # 6d84 <scipat+0x43c>
    332c:	ca4fe0ef          	jal	ra,17d0 <printf>
#if (MULTITHREAD>1)
	printf("Parallel %s : %d\n",PARALLEL_METHOD,default_num_contexts);
#endif
	printf("Memory location  : %s\n",MEM_LOCATION);
    3330:	000073b7          	lui	t2,0x7
    3334:	000072b7          	lui	t0,0x7
    3338:	c8038593          	addi	a1,t2,-896 # 6c80 <scipat+0x338>
    333c:	c8828513          	addi	a0,t0,-888 # 6c88 <scipat+0x340>
    3340:	c90fe0ef          	jal	ra,17d0 <printf>
	/* output for verification */
	printf("seedcrc          : 0x%04x\n",seedcrc);
    3344:	55a2                	lw	a1,40(sp)
    3346:	00007337          	lui	t1,0x7
    334a:	ca030513          	addi	a0,t1,-864 # 6ca0 <scipat+0x358>
    334e:	c82fe0ef          	jal	ra,17d0 <printf>
	if (results[0].execs & ID_LIST)
    3352:	4666                	lw	a2,88(sp)
    3354:	00167793          	andi	a5,a2,1
    3358:	4a078363          	beqz	a5,37fe <benchmark_coremark_main+0xada>
		for (i=0 ; i<default_num_contexts; i++)
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    335c:	6605                	lui	a2,0x1
    335e:	81860693          	addi	a3,a2,-2024 # 818 <__divdf3+0x3d0>
    3362:	184c                	addi	a1,sp,52
    3364:	757d                	lui	a0,0xfffff
    3366:	00b683b3          	add	t2,a3,a1
		for (i=0 ; i<default_num_contexts; i++)
    336a:	0044a083          	lw	ra,4(s1)
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    336e:	00a382b3          	add	t0,t2,a0
    3372:	c016                	sw	t0,0(sp)
		for (i=0 ; i<default_num_contexts; i++)
    3374:	4701                	li	a4,0
    3376:	44008b63          	beqz	ra,37cc <benchmark_coremark_main+0xaa8>
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    337a:	00471413          	slli	s0,a4,0x4
    337e:	4082                	lw	ra,0(sp)
    3380:	00e40333          	add	t1,s0,a4
    3384:	00231793          	slli	a5,t1,0x2
    3388:	00f08533          	add	a0,ra,a5
    338c:	6405                	lui	s0,0x1
    338e:	00a40633          	add	a2,s0,a0
    3392:	82665603          	lhu	a2,-2010(a2)
    3396:	85ba                	mv	a1,a4
    3398:	ca3a                	sw	a4,20(sp)
    339a:	00007737          	lui	a4,0x7
    339e:	cbc70513          	addi	a0,a4,-836 # 6cbc <scipat+0x374>
    33a2:	c2efe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    33a6:	46d2                	lw	a3,20(sp)
    33a8:	0044a783          	lw	a5,4(s1)
    33ac:	00168593          	addi	a1,a3,1
    33b0:	01059393          	slli	t2,a1,0x10
    33b4:	0103d293          	srli	t0,t2,0x10
    33b8:	0cf2f163          	bleu	a5,t0,347a <benchmark_coremark_main+0x756>
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    33bc:	00429313          	slli	t1,t0,0x4
    33c0:	4502                	lw	a0,0(sp)
    33c2:	005307b3          	add	a5,t1,t0
    33c6:	00279093          	slli	ra,a5,0x2
    33ca:	00150633          	add	a2,a0,ra
    33ce:	00c40733          	add	a4,s0,a2
    33d2:	82675603          	lhu	a2,-2010(a4)
    33d6:	000076b7          	lui	a3,0x7
    33da:	8596                	mv	a1,t0
    33dc:	cbc68513          	addi	a0,a3,-836 # 6cbc <scipat+0x374>
    33e0:	ca16                	sw	t0,20(sp)
    33e2:	beefe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    33e6:	45d2                	lw	a1,20(sp)
    33e8:	0044a783          	lw	a5,4(s1)
    33ec:	00158393          	addi	t2,a1,1
    33f0:	01039293          	slli	t0,t2,0x10
    33f4:	0102d313          	srli	t1,t0,0x10
    33f8:	08f37163          	bleu	a5,t1,347a <benchmark_coremark_main+0x756>
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    33fc:	00431793          	slli	a5,t1,0x4
    3400:	4602                	lw	a2,0(sp)
    3402:	006780b3          	add	ra,a5,t1
    3406:	00209513          	slli	a0,ra,0x2
    340a:	00a60733          	add	a4,a2,a0
    340e:	00e406b3          	add	a3,s0,a4
    3412:	8266d603          	lhu	a2,-2010(a3)
    3416:	000073b7          	lui	t2,0x7
    341a:	859a                	mv	a1,t1
    341c:	cbc38513          	addi	a0,t2,-836 # 6cbc <scipat+0x374>
    3420:	ca1a                	sw	t1,20(sp)
    3422:	baefe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    3426:	45d2                	lw	a1,20(sp)
    3428:	0044a783          	lw	a5,4(s1)
    342c:	00158293          	addi	t0,a1,1
    3430:	01029313          	slli	t1,t0,0x10
    3434:	01035513          	srli	a0,t1,0x10
    3438:	04f57163          	bleu	a5,a0,347a <benchmark_coremark_main+0x756>
			printf("[%d]crclist       : 0x%04x\n",i,results[i].crclist);
    343c:	00451793          	slli	a5,a0,0x4
    3440:	4702                	lw	a4,0(sp)
    3442:	00a780b3          	add	ra,a5,a0
    3446:	00209613          	slli	a2,ra,0x2
    344a:	00c706b3          	add	a3,a4,a2
    344e:	9436                	add	s0,s0,a3
    3450:	82645603          	lhu	a2,-2010(s0) # 826 <__divdf3+0x3de>
    3454:	000073b7          	lui	t2,0x7
    3458:	85aa                	mv	a1,a0
    345a:	ca2a                	sw	a0,20(sp)
    345c:	cbc38513          	addi	a0,t2,-836 # 6cbc <scipat+0x374>
    3460:	b70fe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    3464:	45d2                	lw	a1,20(sp)
    3466:	0044a783          	lw	a5,4(s1)
    346a:	00158293          	addi	t0,a1,1
    346e:	01029313          	slli	t1,t0,0x10
    3472:	01035713          	srli	a4,t1,0x10
    3476:	f0f762e3          	bltu	a4,a5,337a <benchmark_coremark_main+0x656>
    347a:	4666                	lw	a2,88(sp)
	if (results[0].execs & ID_MATRIX)
    347c:	00267513          	andi	a0,a2,2
    3480:	12050063          	beqz	a0,35a0 <benchmark_coremark_main+0x87c>
		for (i=0 ; i<default_num_contexts; i++)
    3484:	34078463          	beqz	a5,37cc <benchmark_coremark_main+0xaa8>
			printf("[%d]crcmatrix     : 0x%04x\n",i,results[i].crcmatrix);
    3488:	6605                	lui	a2,0x1
    348a:	81860693          	addi	a3,a2,-2024 # 818 <__divdf3+0x3d0>
    348e:	1840                	addi	s0,sp,52
    3490:	70fd                	lui	ra,0xfffff
    3492:	008683b3          	add	t2,a3,s0
    3496:	001385b3          	add	a1,t2,ra
		for (i=0 ; i<default_num_contexts; i++)
    349a:	4701                	li	a4,0
			printf("[%d]crcmatrix     : 0x%04x\n",i,results[i].crcmatrix);
    349c:	c02e                	sw	a1,0(sp)
    349e:	00471293          	slli	t0,a4,0x4
    34a2:	4502                	lw	a0,0(sp)
    34a4:	00e28333          	add	t1,t0,a4
    34a8:	00231793          	slli	a5,t1,0x2
    34ac:	00f500b3          	add	ra,a0,a5
    34b0:	6405                	lui	s0,0x1
    34b2:	00140633          	add	a2,s0,ra
    34b6:	82865603          	lhu	a2,-2008(a2)
    34ba:	85ba                	mv	a1,a4
    34bc:	ca3a                	sw	a4,20(sp)
    34be:	00007737          	lui	a4,0x7
    34c2:	cd870513          	addi	a0,a4,-808 # 6cd8 <scipat+0x390>
    34c6:	b0afe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    34ca:	46d2                	lw	a3,20(sp)
    34cc:	0044a783          	lw	a5,4(s1)
    34d0:	00168393          	addi	t2,a3,1
    34d4:	01039593          	slli	a1,t2,0x10
    34d8:	0105d293          	srli	t0,a1,0x10
    34dc:	0cf2f163          	bleu	a5,t0,359e <benchmark_coremark_main+0x87a>
			printf("[%d]crcmatrix     : 0x%04x\n",i,results[i].crcmatrix);
    34e0:	00429313          	slli	t1,t0,0x4
    34e4:	4082                	lw	ra,0(sp)
    34e6:	005307b3          	add	a5,t1,t0
    34ea:	00279513          	slli	a0,a5,0x2
    34ee:	00a08633          	add	a2,ra,a0
    34f2:	00c40733          	add	a4,s0,a2
    34f6:	82875603          	lhu	a2,-2008(a4)
    34fa:	000076b7          	lui	a3,0x7
    34fe:	8596                	mv	a1,t0
    3500:	cd868513          	addi	a0,a3,-808 # 6cd8 <scipat+0x390>
    3504:	ca16                	sw	t0,20(sp)
    3506:	acafe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    350a:	43d2                	lw	t2,20(sp)
    350c:	0044a783          	lw	a5,4(s1)
    3510:	00138593          	addi	a1,t2,1
    3514:	01059293          	slli	t0,a1,0x10
    3518:	0102d313          	srli	t1,t0,0x10
    351c:	08f37163          	bleu	a5,t1,359e <benchmark_coremark_main+0x87a>
			printf("[%d]crcmatrix     : 0x%04x\n",i,results[i].crcmatrix);
    3520:	00431793          	slli	a5,t1,0x4
    3524:	4602                	lw	a2,0(sp)
    3526:	00678533          	add	a0,a5,t1
    352a:	00251093          	slli	ra,a0,0x2
    352e:	00160733          	add	a4,a2,ra
    3532:	00e406b3          	add	a3,s0,a4
    3536:	8286d603          	lhu	a2,-2008(a3)
    353a:	000073b7          	lui	t2,0x7
    353e:	859a                	mv	a1,t1
    3540:	cd838513          	addi	a0,t2,-808 # 6cd8 <scipat+0x390>
    3544:	ca1a                	sw	t1,20(sp)
    3546:	a8afe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    354a:	45d2                	lw	a1,20(sp)
    354c:	0044a783          	lw	a5,4(s1)
    3550:	00158293          	addi	t0,a1,1
    3554:	01029313          	slli	t1,t0,0x10
    3558:	01035513          	srli	a0,t1,0x10
    355c:	04f57163          	bleu	a5,a0,359e <benchmark_coremark_main+0x87a>
			printf("[%d]crcmatrix     : 0x%04x\n",i,results[i].crcmatrix);
    3560:	00451793          	slli	a5,a0,0x4
    3564:	4702                	lw	a4,0(sp)
    3566:	00a780b3          	add	ra,a5,a0
    356a:	00209613          	slli	a2,ra,0x2
    356e:	00c706b3          	add	a3,a4,a2
    3572:	9436                	add	s0,s0,a3
    3574:	82845603          	lhu	a2,-2008(s0) # 828 <__divdf3+0x3e0>
    3578:	000073b7          	lui	t2,0x7
    357c:	85aa                	mv	a1,a0
    357e:	ca2a                	sw	a0,20(sp)
    3580:	cd838513          	addi	a0,t2,-808 # 6cd8 <scipat+0x390>
    3584:	a4cfe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    3588:	45d2                	lw	a1,20(sp)
    358a:	0044a783          	lw	a5,4(s1)
    358e:	00158293          	addi	t0,a1,1
    3592:	01029313          	slli	t1,t0,0x10
    3596:	01035713          	srli	a4,t1,0x10
    359a:	f0f762e3          	bltu	a4,a5,349e <benchmark_coremark_main+0x77a>
    359e:	4666                	lw	a2,88(sp)
	if (results[0].execs & ID_STATE)
    35a0:	00467513          	andi	a0,a2,4
    35a4:	10050f63          	beqz	a0,36c2 <benchmark_coremark_main+0x99e>
		for (i=0 ; i<default_num_contexts; i++)
			printf("[%d]crcstate      : 0x%04x\n",i,results[i].crcstate);
    35a8:	6685                	lui	a3,0x1
    35aa:	81868393          	addi	t2,a3,-2024 # 818 <__divdf3+0x3d0>
    35ae:	184c                	addi	a1,sp,52
    35b0:	70fd                	lui	ra,0xfffff
    35b2:	00b382b3          	add	t0,t2,a1
    35b6:	00128333          	add	t1,t0,ra
    35ba:	c01a                	sw	t1,0(sp)
		for (i=0 ; i<default_num_contexts; i++)
    35bc:	4701                	li	a4,0
    35be:	20078763          	beqz	a5,37cc <benchmark_coremark_main+0xaa8>
			printf("[%d]crcstate      : 0x%04x\n",i,results[i].crcstate);
    35c2:	00471413          	slli	s0,a4,0x4
    35c6:	4502                	lw	a0,0(sp)
    35c8:	00e407b3          	add	a5,s0,a4
    35cc:	00279613          	slli	a2,a5,0x2
    35d0:	00c500b3          	add	ra,a0,a2
    35d4:	6405                	lui	s0,0x1
    35d6:	001406b3          	add	a3,s0,ra
    35da:	82a6d603          	lhu	a2,-2006(a3)
    35de:	85ba                	mv	a1,a4
    35e0:	ca3a                	sw	a4,20(sp)
    35e2:	00007737          	lui	a4,0x7
    35e6:	cf470513          	addi	a0,a4,-780 # 6cf4 <scipat+0x3ac>
    35ea:	9e6fe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    35ee:	43d2                	lw	t2,20(sp)
    35f0:	0044a783          	lw	a5,4(s1)
    35f4:	00138593          	addi	a1,t2,1
    35f8:	01059293          	slli	t0,a1,0x10
    35fc:	0102d313          	srli	t1,t0,0x10
    3600:	0cf37163          	bleu	a5,t1,36c2 <benchmark_coremark_main+0x99e>
			printf("[%d]crcstate      : 0x%04x\n",i,results[i].crcstate);
    3604:	00431793          	slli	a5,t1,0x4
    3608:	4082                	lw	ra,0(sp)
    360a:	00678633          	add	a2,a5,t1
    360e:	00261513          	slli	a0,a2,0x2
    3612:	00a086b3          	add	a3,ra,a0
    3616:	00d40733          	add	a4,s0,a3
    361a:	82a75603          	lhu	a2,-2006(a4)
    361e:	000073b7          	lui	t2,0x7
    3622:	859a                	mv	a1,t1
    3624:	cf438513          	addi	a0,t2,-780 # 6cf4 <scipat+0x3ac>
    3628:	ca1a                	sw	t1,20(sp)
    362a:	9a6fe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    362e:	45d2                	lw	a1,20(sp)
    3630:	0044a783          	lw	a5,4(s1)
    3634:	00158293          	addi	t0,a1,1
    3638:	01029313          	slli	t1,t0,0x10
    363c:	01035513          	srli	a0,t1,0x10
    3640:	08f57163          	bleu	a5,a0,36c2 <benchmark_coremark_main+0x99e>
			printf("[%d]crcstate      : 0x%04x\n",i,results[i].crcstate);
    3644:	00451793          	slli	a5,a0,0x4
    3648:	4682                	lw	a3,0(sp)
    364a:	00a78633          	add	a2,a5,a0
    364e:	00261093          	slli	ra,a2,0x2
    3652:	00168733          	add	a4,a3,ra
    3656:	00e403b3          	add	t2,s0,a4
    365a:	82a3d603          	lhu	a2,-2006(t2)
    365e:	000072b7          	lui	t0,0x7
    3662:	85aa                	mv	a1,a0
    3664:	ca2a                	sw	a0,20(sp)
    3666:	cf428513          	addi	a0,t0,-780 # 6cf4 <scipat+0x3ac>
    366a:	966fe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    366e:	45d2                	lw	a1,20(sp)
    3670:	0044a783          	lw	a5,4(s1)
    3674:	00158313          	addi	t1,a1,1
    3678:	01031513          	slli	a0,t1,0x10
    367c:	01055713          	srli	a4,a0,0x10
    3680:	04f77163          	bleu	a5,a4,36c2 <benchmark_coremark_main+0x99e>
			printf("[%d]crcstate      : 0x%04x\n",i,results[i].crcstate);
    3684:	00471793          	slli	a5,a4,0x4
    3688:	4682                	lw	a3,0(sp)
    368a:	00e78633          	add	a2,a5,a4
    368e:	00261093          	slli	ra,a2,0x2
    3692:	001683b3          	add	t2,a3,ra
    3696:	941e                	add	s0,s0,t2
    3698:	82a45603          	lhu	a2,-2006(s0) # 82a <__divdf3+0x3e2>
    369c:	000072b7          	lui	t0,0x7
    36a0:	85ba                	mv	a1,a4
    36a2:	cf428513          	addi	a0,t0,-780 # 6cf4 <scipat+0x3ac>
    36a6:	ca3a                	sw	a4,20(sp)
    36a8:	928fe0ef          	jal	ra,17d0 <printf>
		for (i=0 ; i<default_num_contexts; i++)
    36ac:	45d2                	lw	a1,20(sp)
    36ae:	0044a783          	lw	a5,4(s1)
    36b2:	00158313          	addi	t1,a1,1
    36b6:	01031513          	slli	a0,t1,0x10
    36ba:	01055713          	srli	a4,a0,0x10
    36be:	f0f762e3          	bltu	a4,a5,35c2 <benchmark_coremark_main+0x89e>
	for (i=0 ; i<default_num_contexts; i++)
    36c2:	10078563          	beqz	a5,37cc <benchmark_coremark_main+0xaa8>
		printf("[%d]crcfinal      : 0x%04x\n",i,results[i].crc);
    36c6:	6605                	lui	a2,0x1
    36c8:	81860093          	addi	ra,a2,-2024 # 818 <__divdf3+0x3d0>
    36cc:	1854                	addi	a3,sp,52
    36ce:	77fd                	lui	a5,0xfffff
    36d0:	00d083b3          	add	t2,ra,a3
    36d4:	00f382b3          	add	t0,t2,a5
	for (i=0 ; i<default_num_contexts; i++)
    36d8:	4401                	li	s0,0
		printf("[%d]crcfinal      : 0x%04x\n",i,results[i].crc);
    36da:	c016                	sw	t0,0(sp)
    36dc:	00441593          	slli	a1,s0,0x4
    36e0:	4702                	lw	a4,0(sp)
    36e2:	00858333          	add	t1,a1,s0
    36e6:	00231513          	slli	a0,t1,0x2
    36ea:	00a707b3          	add	a5,a4,a0
    36ee:	6605                	lui	a2,0x1
    36f0:	00f600b3          	add	ra,a2,a5
    36f4:	8240d603          	lhu	a2,-2012(ra) # ffffe824 <__heap_end+0xdff7e824>
    36f8:	000076b7          	lui	a3,0x7
    36fc:	85a2                	mv	a1,s0
    36fe:	d1068513          	addi	a0,a3,-752 # 6d10 <scipat+0x3c8>
    3702:	8cefe0ef          	jal	ra,17d0 <printf>
	for (i=0 ; i<default_num_contexts; i++)
    3706:	0405                	addi	s0,s0,1
    3708:	0044a283          	lw	t0,4(s1)
    370c:	01041393          	slli	t2,s0,0x10
    3710:	0103d413          	srli	s0,t2,0x10
    3714:	0a547c63          	bleu	t0,s0,37cc <benchmark_coremark_main+0xaa8>
		printf("[%d]crcfinal      : 0x%04x\n",i,results[i].crc);
    3718:	00441593          	slli	a1,s0,0x4
    371c:	4702                	lw	a4,0(sp)
    371e:	00858333          	add	t1,a1,s0
    3722:	00231513          	slli	a0,t1,0x2
    3726:	00a707b3          	add	a5,a4,a0
    372a:	6605                	lui	a2,0x1
    372c:	00f600b3          	add	ra,a2,a5
    3730:	8240d603          	lhu	a2,-2012(ra)
    3734:	000076b7          	lui	a3,0x7
    3738:	85a2                	mv	a1,s0
    373a:	d1068513          	addi	a0,a3,-752 # 6d10 <scipat+0x3c8>
    373e:	892fe0ef          	jal	ra,17d0 <printf>
	for (i=0 ; i<default_num_contexts; i++)
    3742:	0405                	addi	s0,s0,1
    3744:	0044a283          	lw	t0,4(s1)
    3748:	01041393          	slli	t2,s0,0x10
    374c:	0103d413          	srli	s0,t2,0x10
    3750:	06547e63          	bleu	t0,s0,37cc <benchmark_coremark_main+0xaa8>
		printf("[%d]crcfinal      : 0x%04x\n",i,results[i].crc);
    3754:	00441593          	slli	a1,s0,0x4
    3758:	4702                	lw	a4,0(sp)
    375a:	00858333          	add	t1,a1,s0
    375e:	00231513          	slli	a0,t1,0x2
    3762:	00a707b3          	add	a5,a4,a0
    3766:	6605                	lui	a2,0x1
    3768:	00f600b3          	add	ra,a2,a5
    376c:	8240d603          	lhu	a2,-2012(ra)
    3770:	000076b7          	lui	a3,0x7
    3774:	85a2                	mv	a1,s0
    3776:	d1068513          	addi	a0,a3,-752 # 6d10 <scipat+0x3c8>
    377a:	856fe0ef          	jal	ra,17d0 <printf>
	for (i=0 ; i<default_num_contexts; i++)
    377e:	0405                	addi	s0,s0,1
    3780:	0044a283          	lw	t0,4(s1)
    3784:	01041393          	slli	t2,s0,0x10
    3788:	0103d413          	srli	s0,t2,0x10
    378c:	04547063          	bleu	t0,s0,37cc <benchmark_coremark_main+0xaa8>
		printf("[%d]crcfinal      : 0x%04x\n",i,results[i].crc);
    3790:	00441593          	slli	a1,s0,0x4
    3794:	4702                	lw	a4,0(sp)
    3796:	00858333          	add	t1,a1,s0
    379a:	00231513          	slli	a0,t1,0x2
    379e:	00a707b3          	add	a5,a4,a0
    37a2:	6605                	lui	a2,0x1
    37a4:	00f600b3          	add	ra,a2,a5
    37a8:	8240d603          	lhu	a2,-2012(ra)
    37ac:	000076b7          	lui	a3,0x7
    37b0:	85a2                	mv	a1,s0
    37b2:	d1068513          	addi	a0,a3,-752 # 6d10 <scipat+0x3c8>
    37b6:	81afe0ef          	jal	ra,17d0 <printf>
	for (i=0 ; i<default_num_contexts; i++)
    37ba:	0405                	addi	s0,s0,1
    37bc:	0044a283          	lw	t0,4(s1)
    37c0:	01041393          	slli	t2,s0,0x10
    37c4:	0103d413          	srli	s0,t2,0x10
    37c8:	f0546ae3          	bltu	s0,t0,36dc <benchmark_coremark_main+0x9b8>
	if (total_errors==0) {
    37cc:	45c2                	lw	a1,16(sp)
    37ce:	c1fd                	beqz	a1,38b4 <benchmark_coremark_main+0xb90>
#endif
			printf("\n");
		}
#endif
	}
	if (total_errors>0)
    37d0:	0ab05b63          	blez	a1,3886 <benchmark_coremark_main+0xb62>
		printf("Errors detected\n");
    37d4:	00007337          	lui	t1,0x7
    37d8:	dac30513          	addi	a0,t1,-596 # 6dac <scipat+0x464>
    37dc:	f73fd0ef          	jal	ra,174e <puts>
#if (MEM_METHOD==MEM_MALLOC)
	for (i=0 ; i<MULTITHREAD; i++)
		portable_free(results[i].memblock[0]);
#endif
	/* And last call any target specific code for finalizing */
	portable_fini(&(results[0].port));
    37e0:	07a10513          	addi	a0,sp,122
    37e4:	e79fd0ef          	jal	ra,165c <portable_fini>

	return MAIN_RETURN_VAL;
}
    37e8:	7fc10113          	addi	sp,sp,2044
    37ec:	40e6                	lw	ra,88(sp)
    37ee:	4501                	li	a0,0
    37f0:	4456                	lw	s0,84(sp)
    37f2:	44c6                	lw	s1,80(sp)
    37f4:	05c10113          	addi	sp,sp,92
    37f8:	8082                	ret
    37fa:	849e                	mv	s1,t2
    37fc:	b499                	j	3242 <benchmark_coremark_main+0x51e>
	if (results[0].execs & ID_MATRIX)
    37fe:	00267513          	andi	a0,a2,2
    3802:	0044a783          	lw	a5,4(s1)
    3806:	c6051fe3          	bnez	a0,3484 <benchmark_coremark_main+0x760>
	if (results[0].execs & ID_STATE)
    380a:	00467513          	andi	a0,a2,4
    380e:	d8051de3          	bnez	a0,35a8 <benchmark_coremark_main+0x884>
    3812:	bd45                	j	36c2 <benchmark_coremark_main+0x99e>
		results[0].execs=ALL_ALGORITHMS_MASK;
    3814:	439d                	li	t2,7
    3816:	cc9e                	sw	t2,88(sp)
    3818:	4605                	li	a2,1
    381a:	4405                	li	s0,1
    381c:	d72ff06f          	j	2d8e <benchmark_coremark_main+0x6a>
				results[ctx].memblock[i+1]=(char *)(results[ctx].memblock[0])+results[0].size*j;
    3820:	6405                	lui	s0,0x1
    3822:	1854                	addi	a3,sp,52
    3824:	81840313          	addi	t1,s0,-2024 # 818 <__divdf3+0x3d0>
    3828:	00d304b3          	add	s1,t1,a3
    382c:	005480b3          	add	ra,s1,t0
    3830:	18f8                	addi	a4,sp,124
    3832:	c006                	sw	ra,0(sp)
    3834:	7ee0ac23          	sw	a4,2040(ra)
			j++;
    3838:	4685                	li	a3,1
		if ((1<<(ee_u32)i) & results[0].execs) {
    383a:	de078463          	beqz	a5,2e22 <benchmark_coremark_main+0xfe>
    383e:	a819                	j	3854 <benchmark_coremark_main+0xb30>
				results[ctx].memblock[i+1]=(char *)(results[ctx].memblock[0])+results[0].size*j;
    3840:	02a685b3          	mul	a1,a3,a0
    3844:	18e4                	addi	s1,sp,124
    3846:	00b48733          	add	a4,s1,a1
    384a:	c6ba                	sw	a4,76(sp)
		if (results[i].execs & ID_LIST) {
    384c:	dc060f63          	beqz	a2,2e2a <benchmark_coremark_main+0x106>
    3850:	ebcff06f          	j	2f0c <benchmark_coremark_main+0x1e8>
				results[ctx].memblock[i+1]=(char *)(results[ctx].memblock[0])+results[0].size*j;
    3854:	02a68333          	mul	t1,a3,a0
    3858:	18e0                	addi	s0,sp,124
    385a:	6485                	lui	s1,0x1
    385c:	81848713          	addi	a4,s1,-2024 # 818 <__divdf3+0x3d0>
    3860:	72fd                	lui	t0,0xfffff
			j++;
    3862:	0685                	addi	a3,a3,1
				results[ctx].memblock[i+1]=(char *)(results[ctx].memblock[0])+results[0].size*j;
    3864:	006400b3          	add	ra,s0,t1
    3868:	03410313          	addi	t1,sp,52
    386c:	00670433          	add	s0,a4,t1
    3870:	92a2                	add	t0,t0,s0
    3872:	7e12ae23          	sw	ra,2044(t0) # fffff7fc <__heap_end+0xdff7f7fc>
    3876:	c016                	sw	t0,0(sp)
			j++;
    3878:	01069093          	slli	ra,a3,0x10
    387c:	0100d693          	srli	a3,ra,0x10
		if ((1<<(ee_u32)i) & results[0].execs) {
    3880:	da058363          	beqz	a1,2e26 <benchmark_coremark_main+0x102>
    3884:	bf75                	j	3840 <benchmark_coremark_main+0xb1c>
		printf("Cannot validate operation for these seed values, please compare with results on a known platform.\n");
    3886:	000074b7          	lui	s1,0x7
    388a:	dbc48513          	addi	a0,s1,-580 # 6dbc <scipat+0x474>
    388e:	ec1fd0ef          	jal	ra,174e <puts>
    3892:	b7b9                	j	37e0 <benchmark_coremark_main+0xabc>
		if (i==0) res->crclist=res->crc;
    3894:	06a11923          	sh	a0,114(sp)
	for (i=0; i<iterations; i++) {
    3898:	4605                	li	a2,1
    389a:	e2c78e63          	beq	a5,a2,2ed6 <benchmark_coremark_main+0x1b2>
    389e:	4405                	li	s0,1
    38a0:	e00ff06f          	j	2ea0 <benchmark_coremark_main+0x17c>
		printf("ERROR! Must execute for at least 10 secs for a valid result!\n");
    38a4:	000073b7          	lui	t2,0x7
    38a8:	bec38513          	addi	a0,t2,-1044 # 6bec <scipat+0x2a4>
    38ac:	ea3fd0ef          	jal	ra,174e <puts>
		total_errors++;
    38b0:	0405                	addi	s0,s0,1
    38b2:	bc1d                	j	32e8 <benchmark_coremark_main+0x5c4>
		printf("Correct operation validated. See readme.txt for run and reporting rules.\n");
    38b4:	00007537          	lui	a0,0x7
    38b8:	d2c50513          	addi	a0,a0,-724 # 6d2c <scipat+0x3e4>
    38bc:	e93fd0ef          	jal	ra,174e <puts>
		if (known_id==3) {
    38c0:	5742                	lw	a4,48(sp)
    38c2:	478d                	li	a5,3
    38c4:	f0f71ee3          	bne	a4,a5,37e0 <benchmark_coremark_main+0xabc>
                        g_score = default_num_contexts*results[0].iterations/time_in_secs(total_time);
    38c8:	40d6                	lw	ra,84(sp)
    38ca:	0044a603          	lw	a2,4(s1)
    38ce:	02c08533          	mul	a0,ra,a2
    38d2:	b20fd0ef          	jal	ra,bf2 <__floatunsidf>
    38d6:	c02a                	sw	a0,0(sp)
    38d8:	4522                	lw	a0,8(sp)
    38da:	c22e                	sw	a1,4(sp)
    38dc:	d5bfd0ef          	jal	ra,1636 <time_in_secs>
    38e0:	862a                	mv	a2,a0
    38e2:	86ae                	mv	a3,a1
    38e4:	4502                	lw	a0,0(sp)
    38e6:	4592                	lw	a1,4(sp)
    38e8:	b61fc0ef          	jal	ra,448 <__divdf3>
    38ec:	200013b7          	lui	t2,0x20001
    38f0:	20a3a423          	sw	a0,520(t2) # 20001208 <g_score>
    38f4:	20b3a623          	sw	a1,524(t2)
                        printf("g_score: %d\n", (int)g_score);
    38f8:	2083a503          	lw	a0,520(t2)
    38fc:	20c3a583          	lw	a1,524(t2)
    3900:	a32fd0ef          	jal	ra,b32 <__fixdfsi>
    3904:	000072b7          	lui	t0,0x7
    3908:	85aa                	mv	a1,a0
    390a:	d7828513          	addi	a0,t0,-648 # 6d78 <scipat+0x430>
    390e:	ec3fd0ef          	jal	ra,17d0 <printf>
			printf("CoreMark 1.0 : %f / %s %s",default_num_contexts*results[0].iterations/time_in_secs(total_time),COMPILER_VERSION,COMPILER_FLAGS);
    3912:	4356                	lw	t1,84(sp)
    3914:	0044a483          	lw	s1,4(s1)
    3918:	02930533          	mul	a0,t1,s1
    391c:	ad6fd0ef          	jal	ra,bf2 <__floatunsidf>
    3920:	842a                	mv	s0,a0
    3922:	4522                	lw	a0,8(sp)
    3924:	84ae                	mv	s1,a1
    3926:	d11fd0ef          	jal	ra,1636 <time_in_secs>
    392a:	862a                	mv	a2,a0
    392c:	86ae                	mv	a3,a1
    392e:	8522                	mv	a0,s0
    3930:	85a6                	mv	a1,s1
    3932:	b17fc0ef          	jal	ra,448 <__divdf3>
    3936:	00007637          	lui	a2,0x7
    393a:	000077b7          	lui	a5,0x7
    393e:	c4460693          	addi	a3,a2,-956 # 6c44 <scipat+0x2fc>
    3942:	862e                	mv	a2,a1
    3944:	85aa                	mv	a1,a0
    3946:	00007537          	lui	a0,0x7
    394a:	d8478713          	addi	a4,a5,-636 # 6d84 <scipat+0x43c>
    394e:	d8850513          	addi	a0,a0,-632 # 6d88 <scipat+0x440>
    3952:	e7ffd0ef          	jal	ra,17d0 <printf>
			printf(" / %s",MEM_LOCATION);
    3956:	00007737          	lui	a4,0x7
    395a:	000076b7          	lui	a3,0x7
    395e:	c8070593          	addi	a1,a4,-896 # 6c80 <scipat+0x338>
    3962:	da468513          	addi	a0,a3,-604 # 6da4 <scipat+0x45c>
    3966:	e6bfd0ef          	jal	ra,17d0 <printf>
			printf("\n");
    396a:	4529                	li	a0,10
    396c:	dddfd0ef          	jal	ra,1748 <putchar>
    3970:	bd85                	j	37e0 <benchmark_coremark_main+0xabc>
			printf("2K validation run parameters for coremark.\n");
    3972:	00007437          	lui	s0,0x7
    3976:	acc40513          	addi	a0,s0,-1332 # 6acc <scipat+0x184>
    397a:	dd5fd0ef          	jal	ra,174e <puts>
    397e:	62a5                	lui	t0,0x9
    3980:	6539                	lui	a0,0xe
    3982:	74700493          	li	s1,1863
    3986:	d8428693          	addi	a3,t0,-636 # 8d84 <__erodata+0x1f4c>
    398a:	3c150593          	addi	a1,a0,961 # e3c1 <__erodata+0x7589>
			known_id=4;
    398e:	4391                	li	t2,4
			printf("2K validation run parameters for coremark.\n");
    3990:	c036                	sw	a3,0(sp)
    3992:	d626                	sw	s1,44(sp)
    3994:	cc26                	sw	s1,24(sp)
    3996:	ca2e                	sw	a1,20(sp)
			known_id=4;
    3998:	d81e                	sw	t2,48(sp)
    399a:	ef8ff06f          	j	3092 <benchmark_coremark_main+0x36e>
			printf("6k validation run parameters for coremark.\n");
    399e:	000070b7          	lui	ra,0x7
    39a2:	a4408513          	addi	a0,ra,-1468 # 6a44 <scipat+0xfc>
    39a6:	da9fd0ef          	jal	ra,174e <puts>
    39aa:	6691                	lui	a3,0x4
    39ac:	6305                	lui	t1,0x1
    39ae:	660d                	lui	a2,0x3
    39b0:	19930793          	addi	a5,t1,409 # 1199 <csi_usart_initialize+0x3b>
    39b4:	9bf68713          	addi	a4,a3,-1601 # 39bf <benchmark_coremark_main+0xc9b>
    39b8:	34060413          	addi	s0,a2,832 # 3340 <benchmark_coremark_main+0x61c>
			known_id=1;
    39bc:	4285                	li	t0,1
			printf("6k validation run parameters for coremark.\n");
    39be:	c03a                	sw	a4,0(sp)
    39c0:	d63e                	sw	a5,44(sp)
    39c2:	cc3e                	sw	a5,24(sp)
    39c4:	ca22                	sw	s0,20(sp)
			known_id=1;
    39c6:	d816                	sw	t0,48(sp)
    39c8:	ecaff06f          	j	3092 <benchmark_coremark_main+0x36e>
			printf("6k performance run parameters for coremark.\n");
    39cc:	000075b7          	lui	a1,0x7
    39d0:	a1858513          	addi	a0,a1,-1512 # 6a18 <scipat+0xd0>
    39d4:	d7bfd0ef          	jal	ra,174e <puts>
    39d8:	6399                	lui	t2,0x6
    39da:	6331                	lui	t1,0xc
    39dc:	6635                	lui	a2,0xd
    39de:	e5230793          	addi	a5,t1,-430 # be52 <__erodata+0x501a>
    39e2:	e4738713          	addi	a4,t2,-441 # 5e47 <core_bench_list+0x32b>
    39e6:	4b060413          	addi	s0,a2,1200 # d4b0 <__erodata+0x6678>
    39ea:	c03a                	sw	a4,0(sp)
    39ec:	d63e                	sw	a5,44(sp)
    39ee:	cc3e                	sw	a5,24(sp)
    39f0:	ca22                	sw	s0,20(sp)
			known_id=0;
    39f2:	d802                	sw	zero,48(sp)
    39f4:	e9eff06f          	j	3092 <benchmark_coremark_main+0x36e>

000039f8 <core_bench_matrix>:
	Benchmark function

	Iterate <matrix_test> N times,
	changing the matrix values slightly by a constant amount each time.
*/
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
    39f8:	fbc10113          	addi	sp,sp,-68
    39fc:	c086                	sw	ra,64(sp)
	ee_u32 N=p->N;
    39fe:	411c                	lw	a5,0(a0)
	MATRES *C=p->C;
    3a00:	4558                	lw	a4,12(a0)
	MATDAT *A=p->A;
    3a02:	4154                	lw	a3,4(a0)
	MATDAT *B=p->B;
    3a04:	00852083          	lw	ra,8(a0)
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
    3a08:	de22                	sw	s0,60(sp)
    3a0a:	dc26                	sw	s1,56(sp)

	After the last step, matrix A is back to original contents.
*/
ee_s16 matrix_test(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B, MATDAT val) {
	ee_u16 crc=0;
	MATDAT clipval=matrix_big(val);
    3a0c:	747d                	lui	s0,0xfffff
ee_u16 core_bench_matrix(mat_params *p, ee_s16 seed, ee_u16 crc) {
    3a0e:	d032                	sw	a2,32(sp)
	ee_u32 N=p->N;
    3a10:	c63e                	sw	a5,12(sp)
	MATRES *C=p->C;
    3a12:	c23a                	sw	a4,4(sp)
	MATDAT *A=p->A;
    3a14:	c836                	sw	a3,16(sp)
	MATDAT *B=p->B;
    3a16:	ca06                	sw	ra,20(sp)
	MATDAT clipval=matrix_big(val);
    3a18:	8c4d                	or	s0,s0,a1
/* Function: matrix_add_const
	Add a constant value to all elements of a matrix.
*/
void matrix_add_const(ee_u32 N, MATDAT *A, MATDAT val) {
	ee_u32 i,j;
	for (i=0; i<N; i++) {
    3a1a:	e399                	bnez	a5,3a20 <core_bench_matrix+0x28>
    3a1c:	4980106f          	j	4eb4 <core_bench_matrix+0x14bc>
    3a20:	01059293          	slli	t0,a1,0x10
    3a24:	00179313          	slli	t1,a5,0x1
    3a28:	0102d713          	srli	a4,t0,0x10
    3a2c:	d43a                	sw	a4,40(sp)
    3a2e:	c41a                	sw	t1,8(sp)
    3a30:	87b6                	mv	a5,a3
    3a32:	d636                	sw	a3,44(sp)
    3a34:	4501                	li	a0,0
    3a36:	ffe30393          	addi	t2,t1,-2
    3a3a:	0013d493          	srli	s1,t2,0x1
    3a3e:	00148693          	addi	a3,s1,1
    3a42:	0076f093          	andi	ra,a3,7
    3a46:	00678633          	add	a2,a5,t1
    3a4a:	08008763          	beqz	ra,3ad8 <core_bench_matrix+0xe0>
    3a4e:	4285                	li	t0,1
    3a50:	06508b63          	beq	ra,t0,3ac6 <core_bench_matrix+0xce>
    3a54:	4389                	li	t2,2
    3a56:	06708163          	beq	ra,t2,3ab8 <core_bench_matrix+0xc0>
    3a5a:	448d                	li	s1,3
    3a5c:	04908763          	beq	ra,s1,3aaa <core_bench_matrix+0xb2>
    3a60:	4691                	li	a3,4
    3a62:	02d08d63          	beq	ra,a3,3a9c <core_bench_matrix+0xa4>
    3a66:	4295                	li	t0,5
    3a68:	02508363          	beq	ra,t0,3a8e <core_bench_matrix+0x96>
    3a6c:	4399                	li	t2,6
    3a6e:	00708963          	beq	ra,t2,3a80 <core_bench_matrix+0x88>
		for (j=0; j<N; j++) {
			A[i*N+j] += val;
    3a72:	0007d083          	lhu	ra,0(a5)
    3a76:	0789                	addi	a5,a5,2
    3a78:	001704b3          	add	s1,a4,ra
    3a7c:	fe979f23          	sh	s1,-2(a5)
    3a80:	0007d683          	lhu	a3,0(a5)
    3a84:	0789                	addi	a5,a5,2
    3a86:	00d702b3          	add	t0,a4,a3
    3a8a:	fe579f23          	sh	t0,-2(a5)
    3a8e:	0007d383          	lhu	t2,0(a5)
    3a92:	0789                	addi	a5,a5,2
    3a94:	007700b3          	add	ra,a4,t2
    3a98:	fe179f23          	sh	ra,-2(a5)
    3a9c:	0007d483          	lhu	s1,0(a5)
    3aa0:	0789                	addi	a5,a5,2
    3aa2:	009706b3          	add	a3,a4,s1
    3aa6:	fed79f23          	sh	a3,-2(a5)
    3aaa:	0007d283          	lhu	t0,0(a5)
    3aae:	0789                	addi	a5,a5,2
    3ab0:	005703b3          	add	t2,a4,t0
    3ab4:	fe779f23          	sh	t2,-2(a5)
    3ab8:	0007d083          	lhu	ra,0(a5)
    3abc:	0789                	addi	a5,a5,2
    3abe:	001704b3          	add	s1,a4,ra
    3ac2:	fe979f23          	sh	s1,-2(a5)
    3ac6:	0007d683          	lhu	a3,0(a5)
    3aca:	0789                	addi	a5,a5,2
    3acc:	00d702b3          	add	t0,a4,a3
    3ad0:	fe579f23          	sh	t0,-2(a5)
		for (j=0; j<N; j++) {
    3ad4:	06c78563          	beq	a5,a2,3b3e <core_bench_matrix+0x146>
			A[i*N+j] += val;
    3ad8:	0007d383          	lhu	t2,0(a5)
    3adc:	0027d483          	lhu	s1,2(a5)
    3ae0:	0047d283          	lhu	t0,4(a5)
    3ae4:	007700b3          	add	ra,a4,t2
    3ae8:	009706b3          	add	a3,a4,s1
    3aec:	00179023          	sh	ra,0(a5)
    3af0:	00d79123          	sh	a3,2(a5)
    3af4:	0067d083          	lhu	ra,6(a5)
    3af8:	0087d683          	lhu	a3,8(a5)
    3afc:	005703b3          	add	t2,a4,t0
    3b00:	001704b3          	add	s1,a4,ra
    3b04:	00d702b3          	add	t0,a4,a3
    3b08:	00779223          	sh	t2,4(a5)
    3b0c:	00979323          	sh	s1,6(a5)
    3b10:	00a7d383          	lhu	t2,10(a5)
    3b14:	00c7d483          	lhu	s1,12(a5)
    3b18:	00579423          	sh	t0,8(a5)
    3b1c:	00e7d283          	lhu	t0,14(a5)
    3b20:	007700b3          	add	ra,a4,t2
    3b24:	009706b3          	add	a3,a4,s1
    3b28:	005703b3          	add	t2,a4,t0
    3b2c:	00179523          	sh	ra,10(a5)
    3b30:	00d79623          	sh	a3,12(a5)
    3b34:	00779723          	sh	t2,14(a5)
    3b38:	07c1                	addi	a5,a5,16
		for (j=0; j<N; j++) {
    3b3a:	f8c79fe3          	bne	a5,a2,3ad8 <core_bench_matrix+0xe0>
	for (i=0; i<N; i++) {
    3b3e:	4632                	lw	a2,12(sp)
    3b40:	00150493          	addi	s1,a0,1
    3b44:	00960463          	beq	a2,s1,3b4c <core_bench_matrix+0x154>
    3b48:	8526                	mv	a0,s1
    3b4a:	b5f5                	j	3a36 <core_bench_matrix+0x3e>
    3b4c:	cc2a                	sw	a0,24(sp)
    3b4e:	00261513          	slli	a0,a2,0x2
    3b52:	4612                	lw	a2,4(sp)
    3b54:	47c2                	lw	a5,16(sp)
    3b56:	42a2                	lw	t0,8(sp)
    3b58:	c02a                	sw	a0,0(sp)
    3b5a:	d832                	sw	a2,48(sp)
	for (i=0; i<N; i++) {
    3b5c:	4301                	li	t1,0
    3b5e:	ffe28393          	addi	t2,t0,-2
    3b62:	0013d693          	srli	a3,t2,0x1
    3b66:	00168513          	addi	a0,a3,1
    3b6a:	00757693          	andi	a3,a0,7
	for (i=0; i<N; i++) {
    3b6e:	8732                	mv	a4,a2
    3b70:	005780b3          	add	ra,a5,t0
    3b74:	cec9                	beqz	a3,3c0e <core_bench_matrix+0x216>
    3b76:	4385                	li	t2,1
    3b78:	08768163          	beq	a3,t2,3bfa <core_bench_matrix+0x202>
    3b7c:	4509                	li	a0,2
    3b7e:	06a68663          	beq	a3,a0,3bea <core_bench_matrix+0x1f2>
    3b82:	438d                	li	t2,3
    3b84:	04768b63          	beq	a3,t2,3bda <core_bench_matrix+0x1e2>
    3b88:	4511                	li	a0,4
    3b8a:	04a68063          	beq	a3,a0,3bca <core_bench_matrix+0x1d2>
    3b8e:	4395                	li	t2,5
    3b90:	02768563          	beq	a3,t2,3bba <core_bench_matrix+0x1c2>
    3b94:	4519                	li	a0,6
    3b96:	00a68a63          	beq	a3,a0,3baa <core_bench_matrix+0x1b2>
			C[i*N+j]=(MATRES)A[i*N+j] * (MATRES)val;
    3b9a:	00079703          	lh	a4,0(a5)
    3b9e:	0789                	addi	a5,a5,2
    3ba0:	02b706b3          	mul	a3,a4,a1
    3ba4:	00460713          	addi	a4,a2,4
    3ba8:	c214                	sw	a3,0(a2)
    3baa:	00079383          	lh	t2,0(a5)
    3bae:	0711                	addi	a4,a4,4
    3bb0:	0789                	addi	a5,a5,2
    3bb2:	02b38533          	mul	a0,t2,a1
    3bb6:	fea72e23          	sw	a0,-4(a4)
    3bba:	00079683          	lh	a3,0(a5)
    3bbe:	0711                	addi	a4,a4,4
    3bc0:	0789                	addi	a5,a5,2
    3bc2:	02b683b3          	mul	t2,a3,a1
    3bc6:	fe772e23          	sw	t2,-4(a4)
    3bca:	00079503          	lh	a0,0(a5)
    3bce:	0711                	addi	a4,a4,4
    3bd0:	0789                	addi	a5,a5,2
    3bd2:	02b506b3          	mul	a3,a0,a1
    3bd6:	fed72e23          	sw	a3,-4(a4)
    3bda:	00079383          	lh	t2,0(a5)
    3bde:	0711                	addi	a4,a4,4
    3be0:	0789                	addi	a5,a5,2
    3be2:	02b38533          	mul	a0,t2,a1
    3be6:	fea72e23          	sw	a0,-4(a4)
    3bea:	00079683          	lh	a3,0(a5)
    3bee:	0711                	addi	a4,a4,4
    3bf0:	0789                	addi	a5,a5,2
    3bf2:	02b683b3          	mul	t2,a3,a1
    3bf6:	fe772e23          	sw	t2,-4(a4)
    3bfa:	00079503          	lh	a0,0(a5)
    3bfe:	0789                	addi	a5,a5,2
    3c00:	0711                	addi	a4,a4,4
    3c02:	02b506b3          	mul	a3,a0,a1
    3c06:	fed72e23          	sw	a3,-4(a4)
		for (j=0; j<N; j++) {
    3c0a:	06f08763          	beq	ra,a5,3c78 <core_bench_matrix+0x280>
			C[i*N+j]=(MATRES)A[i*N+j] * (MATRES)val;
    3c0e:	00079383          	lh	t2,0(a5)
    3c12:	00279683          	lh	a3,2(a5)
    3c16:	07c1                	addi	a5,a5,16
    3c18:	02b38533          	mul	a0,t2,a1
    3c1c:	02070713          	addi	a4,a4,32
    3c20:	02b683b3          	mul	t2,a3,a1
    3c24:	fea72023          	sw	a0,-32(a4)
    3c28:	ff479503          	lh	a0,-12(a5)
    3c2c:	fe772223          	sw	t2,-28(a4)
    3c30:	ff679383          	lh	t2,-10(a5)
    3c34:	02b506b3          	mul	a3,a0,a1
    3c38:	02b38533          	mul	a0,t2,a1
    3c3c:	fed72423          	sw	a3,-24(a4)
    3c40:	ff879683          	lh	a3,-8(a5)
    3c44:	fea72623          	sw	a0,-20(a4)
    3c48:	ffa79503          	lh	a0,-6(a5)
    3c4c:	02b683b3          	mul	t2,a3,a1
    3c50:	02b506b3          	mul	a3,a0,a1
    3c54:	fe772823          	sw	t2,-16(a4)
    3c58:	ffc79383          	lh	t2,-4(a5)
    3c5c:	fed72a23          	sw	a3,-12(a4)
    3c60:	ffe79683          	lh	a3,-2(a5)
    3c64:	02b38533          	mul	a0,t2,a1
    3c68:	02b683b3          	mul	t2,a3,a1
    3c6c:	fea72c23          	sw	a0,-8(a4)
    3c70:	fe772e23          	sw	t2,-4(a4)
		for (j=0; j<N; j++) {
    3c74:	f8f09de3          	bne	ra,a5,3c0e <core_bench_matrix+0x216>
    3c78:	4782                	lw	a5,0(sp)
	for (i=0; i<N; i++) {
    3c7a:	00130713          	addi	a4,t1,1
    3c7e:	963e                	add	a2,a2,a5
    3c80:	8786                	mv	a5,ra
    3c82:	40e2                	lw	ra,24(sp)
    3c84:	00608463          	beq	ra,t1,3c8c <core_bench_matrix+0x294>
    3c88:	833a                	mv	t1,a4
    3c8a:	bdd1                	j	3b5e <core_bench_matrix+0x166>
    3c8c:	4592                	lw	a1,4(sp)
    3c8e:	4302                	lw	t1,0(sp)
    3c90:	409006b3          	neg	a3,s1
    3c94:	00269293          	slli	t0,a3,0x2
    3c98:	932e                	add	t1,t1,a1
    3c9a:	ce16                	sw	t0,28(sp)
    3c9c:	d21a                	sw	t1,36(sp)
	ee_s16 ret=0;
    3c9e:	4501                	li	a0,0
	MATRES tmp=0,prev=0,cur=0;
    3ca0:	4701                	li	a4,0
    3ca2:	4781                	li	a5,0
	for (i=0; i<N; i++) {
    3ca4:	4281                	li	t0,0
    3ca6:	00369393          	slli	t2,a3,0x3
    3caa:	4672                	lw	a2,28(sp)
    3cac:	00c305b3          	add	a1,t1,a2
    3cb0:	40b306b3          	sub	a3,t1,a1
    3cb4:	ffc68613          	addi	a2,a3,-4
    3cb8:	00265693          	srli	a3,a2,0x2
    3cbc:	00168613          	addi	a2,a3,1
    3cc0:	00767693          	andi	a3,a2,7
    3cc4:	80ae                	mv	ra,a1
    3cc6:	1e068b63          	beqz	a3,3ebc <core_bench_matrix+0x4c4>
    3cca:	4605                	li	a2,1
    3ccc:	0ec68e63          	beq	a3,a2,3dc8 <core_bench_matrix+0x3d0>
    3cd0:	4609                	li	a2,2
    3cd2:	0cc68963          	beq	a3,a2,3da4 <core_bench_matrix+0x3ac>
    3cd6:	460d                	li	a2,3
    3cd8:	0ac68463          	beq	a3,a2,3d80 <core_bench_matrix+0x388>
    3cdc:	4611                	li	a2,4
    3cde:	06c68f63          	beq	a3,a2,3d5c <core_bench_matrix+0x364>
    3ce2:	4615                	li	a2,5
    3ce4:	04c68a63          	beq	a3,a2,3d38 <core_bench_matrix+0x340>
    3ce8:	4619                	li	a2,6
    3cea:	02c68563          	beq	a3,a2,3d14 <core_bench_matrix+0x31c>
			cur=C[i*N+j];
    3cee:	4194                	lw	a3,0(a1)
			tmp+=cur;
    3cf0:	0542                	slli	a0,a0,0x10
    3cf2:	01055093          	srli	ra,a0,0x10
    3cf6:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3cf8:	00f44463          	blt	s0,a5,3d00 <core_bench_matrix+0x308>
    3cfc:	18c0106f          	j	4e88 <core_bench_matrix+0x1490>
				ret+=10;
    3d00:	00a08793          	addi	a5,ra,10
    3d04:	01079093          	slli	ra,a5,0x10
    3d08:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    3d0c:	4781                	li	a5,0
			prev=cur;
    3d0e:	00458093          	addi	ra,a1,4
			cur=C[i*N+j];
    3d12:	8736                	mv	a4,a3
    3d14:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3d18:	01051613          	slli	a2,a0,0x10
    3d1c:	01065513          	srli	a0,a2,0x10
    3d20:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3d22:	2cf45e63          	ble	a5,s0,3ffe <core_bench_matrix+0x606>
				ret+=10;
    3d26:	00a50793          	addi	a5,a0,10
    3d2a:	01079713          	slli	a4,a5,0x10
    3d2e:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3d32:	4781                	li	a5,0
			prev=cur;
    3d34:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3d36:	8736                	mv	a4,a3
    3d38:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3d3c:	01051613          	slli	a2,a0,0x10
    3d40:	01065513          	srli	a0,a2,0x10
    3d44:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3d46:	2af45463          	ble	a5,s0,3fee <core_bench_matrix+0x5f6>
				ret+=10;
    3d4a:	00a50793          	addi	a5,a0,10
    3d4e:	01079713          	slli	a4,a5,0x10
    3d52:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3d56:	4781                	li	a5,0
			prev=cur;
    3d58:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3d5a:	8736                	mv	a4,a3
    3d5c:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3d60:	01051613          	slli	a2,a0,0x10
    3d64:	01065513          	srli	a0,a2,0x10
    3d68:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3d6a:	2af45263          	ble	a5,s0,400e <core_bench_matrix+0x616>
				ret+=10;
    3d6e:	00a50793          	addi	a5,a0,10
    3d72:	01079713          	slli	a4,a5,0x10
    3d76:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3d7a:	4781                	li	a5,0
			prev=cur;
    3d7c:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3d7e:	8736                	mv	a4,a3
    3d80:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3d84:	01051613          	slli	a2,a0,0x10
    3d88:	01065513          	srli	a0,a2,0x10
    3d8c:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3d8e:	2af45063          	ble	a5,s0,402e <core_bench_matrix+0x636>
				ret+=10;
    3d92:	00a50793          	addi	a5,a0,10
    3d96:	01079713          	slli	a4,a5,0x10
    3d9a:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3d9e:	4781                	li	a5,0
			prev=cur;
    3da0:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3da2:	8736                	mv	a4,a3
    3da4:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3da8:	01051613          	slli	a2,a0,0x10
    3dac:	01065513          	srli	a0,a2,0x10
    3db0:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3db2:	26f45663          	ble	a5,s0,401e <core_bench_matrix+0x626>
				ret+=10;
    3db6:	00a50793          	addi	a5,a0,10
    3dba:	01079713          	slli	a4,a5,0x10
    3dbe:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3dc2:	4781                	li	a5,0
			prev=cur;
    3dc4:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3dc6:	8736                	mv	a4,a3
    3dc8:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3dcc:	01051613          	slli	a2,a0,0x10
    3dd0:	01065513          	srli	a0,a2,0x10
    3dd4:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3dd6:	26f45463          	ble	a5,s0,403e <core_bench_matrix+0x646>
				ret+=10;
    3dda:	00a50793          	addi	a5,a0,10
    3dde:	01079713          	slli	a4,a5,0x10
    3de2:	41075513          	srai	a0,a4,0x10
				tmp=0;
    3de6:	4781                	li	a5,0
			prev=cur;
    3de8:	0091                	addi	ra,ra,4
			cur=C[i*N+j];
    3dea:	8736                	mv	a4,a3
		for (j=0; j<N; j++) {
    3dec:	0c131863          	bne	t1,ra,3ebc <core_bench_matrix+0x4c4>
    3df0:	aae9                	j	3fca <core_bench_matrix+0x5d2>
				ret+=10;
    3df2:	00a60793          	addi	a5,a2,10
			cur=C[i*N+j];
    3df6:	4350                	lw	a2,4(a4)
				ret+=10;
    3df8:	01079513          	slli	a0,a5,0x10
    3dfc:	41055693          	srai	a3,a0,0x10
				tmp=0;
    3e00:	4781                	li	a5,0
			tmp+=cur;
    3e02:	06c2                	slli	a3,a3,0x10
    3e04:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    3e06:	0106d513          	srli	a0,a3,0x10
    3e0a:	10f45463          	ble	a5,s0,3f12 <core_bench_matrix+0x51a>
				ret+=10;
    3e0e:	00a50793          	addi	a5,a0,10
    3e12:	01079693          	slli	a3,a5,0x10
    3e16:	4106d093          	srai	ra,a3,0x10
			cur=C[i*N+j];
    3e1a:	4714                	lw	a3,8(a4)
				tmp=0;
    3e1c:	4781                	li	a5,0
			tmp+=cur;
    3e1e:	01009513          	slli	a0,ra,0x10
    3e22:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3e24:	01055093          	srli	ra,a0,0x10
    3e28:	10f45563          	ble	a5,s0,3f32 <core_bench_matrix+0x53a>
				ret+=10;
    3e2c:	00a08793          	addi	a5,ra,10
			cur=C[i*N+j];
    3e30:	00c72083          	lw	ra,12(a4)
				ret+=10;
    3e34:	01079613          	slli	a2,a5,0x10
    3e38:	41065513          	srai	a0,a2,0x10
				tmp=0;
    3e3c:	4781                	li	a5,0
			tmp+=cur;
    3e3e:	0542                	slli	a0,a0,0x10
    3e40:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    3e42:	01055613          	srli	a2,a0,0x10
    3e46:	10f45663          	ble	a5,s0,3f52 <core_bench_matrix+0x55a>
				ret+=10;
    3e4a:	00a60793          	addi	a5,a2,10
    3e4e:	01079693          	slli	a3,a5,0x10
    3e52:	4106d513          	srai	a0,a3,0x10
			cur=C[i*N+j];
    3e56:	4b14                	lw	a3,16(a4)
				tmp=0;
    3e58:	4781                	li	a5,0
			tmp+=cur;
    3e5a:	01051613          	slli	a2,a0,0x10
    3e5e:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3e60:	01065513          	srli	a0,a2,0x10
    3e64:	10f45763          	ble	a5,s0,3f72 <core_bench_matrix+0x57a>
				ret+=10;
    3e68:	00a50793          	addi	a5,a0,10
    3e6c:	01079613          	slli	a2,a5,0x10
    3e70:	41065093          	srai	ra,a2,0x10
			cur=C[i*N+j];
    3e74:	4b50                	lw	a2,20(a4)
				tmp=0;
    3e76:	4781                	li	a5,0
			tmp+=cur;
    3e78:	01009513          	slli	a0,ra,0x10
    3e7c:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    3e7e:	01055093          	srli	ra,a0,0x10
    3e82:	10f45863          	ble	a5,s0,3f92 <core_bench_matrix+0x59a>
				ret+=10;
    3e86:	00a08793          	addi	a5,ra,10
    3e8a:	01079693          	slli	a3,a5,0x10
    3e8e:	4106d513          	srai	a0,a3,0x10
			cur=C[i*N+j];
    3e92:	4f14                	lw	a3,24(a4)
				tmp=0;
    3e94:	4781                	li	a5,0
			tmp+=cur;
    3e96:	01051093          	slli	ra,a0,0x10
    3e9a:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3e9c:	0100d513          	srli	a0,ra,0x10
    3ea0:	10f45963          	ble	a5,s0,3fb2 <core_bench_matrix+0x5ba>
				ret+=10;
    3ea4:	00a50793          	addi	a5,a0,10
    3ea8:	01079613          	slli	a2,a5,0x10
    3eac:	01c70093          	addi	ra,a4,28
    3eb0:	41065513          	srai	a0,a2,0x10
				tmp=0;
    3eb4:	4781                	li	a5,0
			cur=C[i*N+j];
    3eb6:	8736                	mv	a4,a3
		for (j=0; j<N; j++) {
    3eb8:	10130963          	beq	t1,ra,3fca <core_bench_matrix+0x5d2>
			cur=C[i*N+j];
    3ebc:	0000a683          	lw	a3,0(ra)
			tmp+=cur;
    3ec0:	01051613          	slli	a2,a0,0x10
    3ec4:	01065513          	srli	a0,a2,0x10
    3ec8:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3eca:	10f44a63          	blt	s0,a5,3fde <core_bench_matrix+0x5e6>
				ret += (cur>prev) ? 1 : 0;
    3ece:	00d72733          	slt	a4,a4,a3
    3ed2:	00e50633          	add	a2,a0,a4
    3ed6:	01061513          	slli	a0,a2,0x10
    3eda:	41055613          	srai	a2,a0,0x10
			prev=cur;
    3ede:	00408713          	addi	a4,ra,4
			cur=C[i*N+j];
    3ee2:	0040a083          	lw	ra,4(ra)
			tmp+=cur;
    3ee6:	01061513          	slli	a0,a2,0x10
    3eea:	01055613          	srli	a2,a0,0x10
    3eee:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    3ef0:	f0f441e3          	blt	s0,a5,3df2 <core_bench_matrix+0x3fa>
				ret += (cur>prev) ? 1 : 0;
    3ef4:	0016a6b3          	slt	a3,a3,ra
    3ef8:	00d60533          	add	a0,a2,a3
    3efc:	01051613          	slli	a2,a0,0x10
    3f00:	41065693          	srai	a3,a2,0x10
			cur=C[i*N+j];
    3f04:	4350                	lw	a2,4(a4)
			tmp+=cur;
    3f06:	06c2                	slli	a3,a3,0x10
    3f08:	0106d513          	srli	a0,a3,0x10
    3f0c:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    3f0e:	f0f440e3          	blt	s0,a5,3e0e <core_bench_matrix+0x416>
				ret += (cur>prev) ? 1 : 0;
    3f12:	00c0a0b3          	slt	ra,ra,a2
    3f16:	001506b3          	add	a3,a0,ra
    3f1a:	01069513          	slli	a0,a3,0x10
			cur=C[i*N+j];
    3f1e:	4714                	lw	a3,8(a4)
				ret += (cur>prev) ? 1 : 0;
    3f20:	41055093          	srai	ra,a0,0x10
			tmp+=cur;
    3f24:	01009513          	slli	a0,ra,0x10
    3f28:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3f2a:	01055093          	srli	ra,a0,0x10
    3f2e:	eef44fe3          	blt	s0,a5,3e2c <core_bench_matrix+0x434>
				ret += (cur>prev) ? 1 : 0;
    3f32:	00d62633          	slt	a2,a2,a3
    3f36:	00c08533          	add	a0,ra,a2
    3f3a:	01051093          	slli	ra,a0,0x10
    3f3e:	4100d513          	srai	a0,ra,0x10
			cur=C[i*N+j];
    3f42:	00c72083          	lw	ra,12(a4)
			tmp+=cur;
    3f46:	0542                	slli	a0,a0,0x10
    3f48:	01055613          	srli	a2,a0,0x10
    3f4c:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    3f4e:	eef44ee3          	blt	s0,a5,3e4a <core_bench_matrix+0x452>
				ret += (cur>prev) ? 1 : 0;
    3f52:	0016a6b3          	slt	a3,a3,ra
    3f56:	00d60533          	add	a0,a2,a3
			cur=C[i*N+j];
    3f5a:	4b14                	lw	a3,16(a4)
				ret += (cur>prev) ? 1 : 0;
    3f5c:	01051613          	slli	a2,a0,0x10
    3f60:	41065513          	srai	a0,a2,0x10
			tmp+=cur;
    3f64:	01051613          	slli	a2,a0,0x10
    3f68:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3f6a:	01065513          	srli	a0,a2,0x10
    3f6e:	eef44de3          	blt	s0,a5,3e68 <core_bench_matrix+0x470>
				ret += (cur>prev) ? 1 : 0;
    3f72:	00d0a0b3          	slt	ra,ra,a3
    3f76:	00150633          	add	a2,a0,ra
    3f7a:	01061513          	slli	a0,a2,0x10
			cur=C[i*N+j];
    3f7e:	4b50                	lw	a2,20(a4)
				ret += (cur>prev) ? 1 : 0;
    3f80:	41055093          	srai	ra,a0,0x10
			tmp+=cur;
    3f84:	01009513          	slli	a0,ra,0x10
    3f88:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    3f8a:	01055093          	srli	ra,a0,0x10
    3f8e:	eef44ce3          	blt	s0,a5,3e86 <core_bench_matrix+0x48e>
				ret += (cur>prev) ? 1 : 0;
    3f92:	00c6a6b3          	slt	a3,a3,a2
    3f96:	00d08533          	add	a0,ra,a3
			cur=C[i*N+j];
    3f9a:	4f14                	lw	a3,24(a4)
				ret += (cur>prev) ? 1 : 0;
    3f9c:	01051093          	slli	ra,a0,0x10
    3fa0:	4100d513          	srai	a0,ra,0x10
			tmp+=cur;
    3fa4:	01051093          	slli	ra,a0,0x10
    3fa8:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    3faa:	0100d513          	srli	a0,ra,0x10
    3fae:	eef44be3          	blt	s0,a5,3ea4 <core_bench_matrix+0x4ac>
				ret += (cur>prev) ? 1 : 0;
    3fb2:	00d62633          	slt	a2,a2,a3
    3fb6:	00c500b3          	add	ra,a0,a2
    3fba:	01009513          	slli	a0,ra,0x10
    3fbe:	01c70093          	addi	ra,a4,28
    3fc2:	8541                	srai	a0,a0,0x10
			cur=C[i*N+j];
    3fc4:	8736                	mv	a4,a3
		for (j=0; j<N; j++) {
    3fc6:	ee131be3          	bne	t1,ra,3ebc <core_bench_matrix+0x4c4>
    3fca:	40758333          	sub	t1,a1,t2
	for (i=0; i<N; i++) {
    3fce:	45e2                	lw	a1,24(sp)
    3fd0:	00128613          	addi	a2,t0,1
			cur=C[i*N+j];
    3fd4:	8736                	mv	a4,a3
	for (i=0; i<N; i++) {
    3fd6:	06558c63          	beq	a1,t0,404e <core_bench_matrix+0x656>
    3fda:	82b2                	mv	t0,a2
    3fdc:	b1f9                	j	3caa <core_bench_matrix+0x2b2>
				ret+=10;
    3fde:	00a50793          	addi	a5,a0,10
    3fe2:	01079713          	slli	a4,a5,0x10
    3fe6:	41075613          	srai	a2,a4,0x10
				tmp=0;
    3fea:	4781                	li	a5,0
    3fec:	bdcd                	j	3ede <core_bench_matrix+0x4e6>
				ret += (cur>prev) ? 1 : 0;
    3fee:	00d72733          	slt	a4,a4,a3
    3ff2:	00e50633          	add	a2,a0,a4
    3ff6:	01061513          	slli	a0,a2,0x10
    3ffa:	8541                	srai	a0,a0,0x10
    3ffc:	bbb1                	j	3d58 <core_bench_matrix+0x360>
    3ffe:	00d72733          	slt	a4,a4,a3
    4002:	00e50633          	add	a2,a0,a4
    4006:	01061513          	slli	a0,a2,0x10
    400a:	8541                	srai	a0,a0,0x10
    400c:	b325                	j	3d34 <core_bench_matrix+0x33c>
    400e:	00d72733          	slt	a4,a4,a3
    4012:	00e50633          	add	a2,a0,a4
    4016:	01061513          	slli	a0,a2,0x10
    401a:	8541                	srai	a0,a0,0x10
    401c:	b385                	j	3d7c <core_bench_matrix+0x384>
    401e:	00d72733          	slt	a4,a4,a3
    4022:	00e50633          	add	a2,a0,a4
    4026:	01061513          	slli	a0,a2,0x10
    402a:	8541                	srai	a0,a0,0x10
    402c:	bb61                	j	3dc4 <core_bench_matrix+0x3cc>
    402e:	00d72733          	slt	a4,a4,a3
    4032:	00e50633          	add	a2,a0,a4
    4036:	01061513          	slli	a0,a2,0x10
    403a:	8541                	srai	a0,a0,0x10
    403c:	b395                	j	3da0 <core_bench_matrix+0x3a8>
    403e:	00d72733          	slt	a4,a4,a3
    4042:	00e50633          	add	a2,a0,a4
    4046:	01061513          	slli	a0,a2,0x10
    404a:	8541                	srai	a0,a0,0x10
    404c:	bb71                	j	3de8 <core_bench_matrix+0x3f0>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    404e:	4581                	li	a1,0
    4050:	095010ef          	jal	ra,58e4 <crc16>
    4054:	cc2a                	sw	a0,24(sp)
	Multiply a matrix by a vector.
	This is common in many simple filters (e.g. fir where a vector of coefficients is applied to the matrix.)
*/
void matrix_mul_vect(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
	ee_u32 i,j;
	for (i=0; i<N; i++) {
    4056:	4602                	lw	a2,0(sp)
    4058:	4512                	lw	a0,4(sp)
    405a:	4581                	li	a1,0
    405c:	fe1fb0ef          	jal	ra,3c <memset>
    4060:	42a2                	lw	t0,8(sp)
    4062:	4652                	lw	a2,20(sp)
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4064:	45c2                	lw	a1,16(sp)
    4066:	4512                	lw	a0,4(sp)
    4068:	00560333          	add	t1,a2,t0
    406c:	5292                	lw	t0,36(sp)
		C[i]=0;
		for (j=0; j<N; j++) {
    406e:	40c300b3          	sub	ra,t1,a2
    4072:	ffe08393          	addi	t2,ra,-2
    4076:	0013d093          	srli	ra,t2,0x1
    407a:	00108393          	addi	t2,ra,1
    407e:	0073f393          	andi	t2,t2,7
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4082:	8732                	mv	a4,a2
    4084:	86ae                	mv	a3,a1
    4086:	4781                	li	a5,0
    4088:	0a038663          	beqz	t2,4134 <core_bench_matrix+0x73c>
    408c:	4085                	li	ra,1
    408e:	08138863          	beq	t2,ra,411e <core_bench_matrix+0x726>
    4092:	4089                	li	ra,2
    4094:	06138c63          	beq	t2,ra,410c <core_bench_matrix+0x714>
    4098:	408d                	li	ra,3
    409a:	06138063          	beq	t2,ra,40fa <core_bench_matrix+0x702>
    409e:	4091                	li	ra,4
    40a0:	04138463          	beq	t2,ra,40e8 <core_bench_matrix+0x6f0>
    40a4:	4095                	li	ra,5
    40a6:	02138863          	beq	t2,ra,40d6 <core_bench_matrix+0x6de>
    40aa:	4099                	li	ra,6
    40ac:	00138c63          	beq	t2,ra,40c4 <core_bench_matrix+0x6cc>
			C[i]+=(MATRES)A[i*N+j] * (MATRES)B[j];
    40b0:	00059683          	lh	a3,0(a1)
    40b4:	00061783          	lh	a5,0(a2)
    40b8:	00260713          	addi	a4,a2,2
    40bc:	02f687b3          	mul	a5,a3,a5
    40c0:	00258693          	addi	a3,a1,2
    40c4:	00069383          	lh	t2,0(a3)
    40c8:	00071083          	lh	ra,0(a4)
    40cc:	0689                	addi	a3,a3,2
    40ce:	0709                	addi	a4,a4,2
    40d0:	021383b3          	mul	t2,t2,ra
    40d4:	979e                	add	a5,a5,t2
    40d6:	00069383          	lh	t2,0(a3)
    40da:	00071083          	lh	ra,0(a4)
    40de:	0689                	addi	a3,a3,2
    40e0:	0709                	addi	a4,a4,2
    40e2:	021383b3          	mul	t2,t2,ra
    40e6:	979e                	add	a5,a5,t2
    40e8:	00069383          	lh	t2,0(a3)
    40ec:	00071083          	lh	ra,0(a4)
    40f0:	0689                	addi	a3,a3,2
    40f2:	0709                	addi	a4,a4,2
    40f4:	021383b3          	mul	t2,t2,ra
    40f8:	979e                	add	a5,a5,t2
    40fa:	00069383          	lh	t2,0(a3)
    40fe:	00071083          	lh	ra,0(a4)
    4102:	0689                	addi	a3,a3,2
    4104:	0709                	addi	a4,a4,2
    4106:	021383b3          	mul	t2,t2,ra
    410a:	979e                	add	a5,a5,t2
    410c:	00069383          	lh	t2,0(a3)
    4110:	00071083          	lh	ra,0(a4)
    4114:	0689                	addi	a3,a3,2
    4116:	0709                	addi	a4,a4,2
    4118:	021383b3          	mul	t2,t2,ra
    411c:	979e                	add	a5,a5,t2
    411e:	00069383          	lh	t2,0(a3)
    4122:	00071083          	lh	ra,0(a4)
    4126:	0709                	addi	a4,a4,2
    4128:	0689                	addi	a3,a3,2
    412a:	021383b3          	mul	t2,t2,ra
    412e:	979e                	add	a5,a5,t2
		for (j=0; j<N; j++) {
    4130:	06e30e63          	beq	t1,a4,41ac <core_bench_matrix+0x7b4>
			C[i]+=(MATRES)A[i*N+j] * (MATRES)B[j];
    4134:	00071083          	lh	ra,0(a4)
    4138:	00069383          	lh	t2,0(a3)
    413c:	0741                	addi	a4,a4,16
    413e:	06c1                	addi	a3,a3,16
    4140:	021383b3          	mul	t2,t2,ra
    4144:	ff271083          	lh	ra,-14(a4)
    4148:	93be                	add	t2,t2,a5
    414a:	ff269783          	lh	a5,-14(a3)
    414e:	021787b3          	mul	a5,a5,ra
    4152:	ff471083          	lh	ra,-12(a4)
    4156:	93be                	add	t2,t2,a5
    4158:	ff469783          	lh	a5,-12(a3)
    415c:	021787b3          	mul	a5,a5,ra
    4160:	ff671083          	lh	ra,-10(a4)
    4164:	93be                	add	t2,t2,a5
    4166:	ff669783          	lh	a5,-10(a3)
    416a:	021787b3          	mul	a5,a5,ra
    416e:	ff871083          	lh	ra,-8(a4)
    4172:	93be                	add	t2,t2,a5
    4174:	ff869783          	lh	a5,-8(a3)
    4178:	021787b3          	mul	a5,a5,ra
    417c:	ffa71083          	lh	ra,-6(a4)
    4180:	93be                	add	t2,t2,a5
    4182:	ffa69783          	lh	a5,-6(a3)
    4186:	021787b3          	mul	a5,a5,ra
    418a:	ffc71083          	lh	ra,-4(a4)
    418e:	93be                	add	t2,t2,a5
    4190:	ffc69783          	lh	a5,-4(a3)
    4194:	021787b3          	mul	a5,a5,ra
    4198:	ffe71083          	lh	ra,-2(a4)
    419c:	93be                	add	t2,t2,a5
    419e:	ffe69783          	lh	a5,-2(a3)
    41a2:	021787b3          	mul	a5,a5,ra
    41a6:	979e                	add	a5,a5,t2
		for (j=0; j<N; j++) {
    41a8:	f8e316e3          	bne	t1,a4,4134 <core_bench_matrix+0x73c>
    41ac:	46a2                	lw	a3,8(sp)
    41ae:	c11c                	sw	a5,0(a0)
    41b0:	0511                	addi	a0,a0,4
    41b2:	95b6                	add	a1,a1,a3
	for (i=0; i<N; i++) {
    41b4:	eaa29de3          	bne	t0,a0,406e <core_bench_matrix+0x676>
    41b8:	4292                	lw	t0,4(sp)
	ee_s16 ret=0;
    41ba:	4501                	li	a0,0
	MATRES tmp=0,prev=0,cur=0;
    41bc:	4701                	li	a4,0
    41be:	4781                	li	a5,0
	for (i=0; i<N; i++) {
    41c0:	4381                	li	t2,0
			cur=C[i*N+j];
    41c2:	0002a583          	lw	a1,0(t0)
    41c6:	fff48613          	addi	a2,s1,-1
    41ca:	0542                	slli	a0,a0,0x10
			tmp+=cur;
    41cc:	97ae                	add	a5,a5,a1
    41ce:	00367313          	andi	t1,a2,3
			if (tmp>clipval) {
    41d2:	01055093          	srli	ra,a0,0x10
    41d6:	3af457e3          	ble	a5,s0,4d84 <core_bench_matrix+0x138c>
				ret+=10;
    41da:	00a08793          	addi	a5,ra,10
    41de:	01079513          	slli	a0,a5,0x10
    41e2:	8541                	srai	a0,a0,0x10
				tmp=0;
    41e4:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    41e6:	4705                	li	a4,1
    41e8:	00428613          	addi	a2,t0,4
			cur=C[i*N+j];
    41ec:	86ae                	mv	a3,a1
		for (j=0; j<N; j++) {
    41ee:	16977163          	bleu	s1,a4,4350 <core_bench_matrix+0x958>
    41f2:	0c030563          	beqz	t1,42bc <core_bench_matrix+0x8c4>
    41f6:	04e30763          	beq	t1,a4,4244 <core_bench_matrix+0x84c>
    41fa:	4089                	li	ra,2
    41fc:	02130263          	beq	t1,ra,4220 <core_bench_matrix+0x828>
			cur=C[i*N+j];
    4200:	4214                	lw	a3,0(a2)
			tmp+=cur;
    4202:	01051313          	slli	t1,a0,0x10
    4206:	01035513          	srli	a0,t1,0x10
    420a:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    420c:	46f454e3          	ble	a5,s0,4e74 <core_bench_matrix+0x147c>
				ret+=10;
    4210:	00a50793          	addi	a5,a0,10
    4214:	01079513          	slli	a0,a5,0x10
    4218:	8541                	srai	a0,a0,0x10
				tmp=0;
    421a:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    421c:	0705                	addi	a4,a4,1
    421e:	0611                	addi	a2,a2,4
			cur=C[i*N+j];
    4220:	420c                	lw	a1,0(a2)
			tmp+=cur;
    4222:	01051093          	slli	ra,a0,0x10
    4226:	0100d313          	srli	t1,ra,0x10
    422a:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    422c:	36f456e3          	ble	a5,s0,4d98 <core_bench_matrix+0x13a0>
				ret+=10;
    4230:	00a30793          	addi	a5,t1,10
    4234:	01079313          	slli	t1,a5,0x10
    4238:	41035513          	srai	a0,t1,0x10
				tmp=0;
    423c:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    423e:	0705                	addi	a4,a4,1
    4240:	0611                	addi	a2,a2,4
			cur=C[i*N+j];
    4242:	86ae                	mv	a3,a1
    4244:	420c                	lw	a1,0(a2)
			tmp+=cur;
    4246:	0542                	slli	a0,a0,0x10
    4248:	01055093          	srli	ra,a0,0x10
    424c:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    424e:	34f45fe3          	ble	a5,s0,4dac <core_bench_matrix+0x13b4>
				ret+=10;
    4252:	00a08793          	addi	a5,ra,10
    4256:	01079093          	slli	ra,a5,0x10
    425a:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    425e:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4260:	0705                	addi	a4,a4,1
    4262:	0611                	addi	a2,a2,4
    4264:	04976c63          	bltu	a4,s1,42bc <core_bench_matrix+0x8c4>
    4268:	a0e5                	j	4350 <core_bench_matrix+0x958>
				ret+=10;
    426a:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    426e:	42d0                	lw	a2,4(a3)
				ret+=10;
    4270:	01079093          	slli	ra,a5,0x10
    4274:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4278:	4781                	li	a5,0
			tmp+=cur;
    427a:	01051593          	slli	a1,a0,0x10
    427e:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    4280:	0105d513          	srli	a0,a1,0x10
    4284:	08f45963          	ble	a5,s0,4316 <core_bench_matrix+0x91e>
				ret+=10;
    4288:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    428c:	468c                	lw	a1,8(a3)
				ret+=10;
    428e:	01079313          	slli	t1,a5,0x10
    4292:	41035513          	srai	a0,t1,0x10
				tmp=0;
    4296:	4781                	li	a5,0
			tmp+=cur;
    4298:	01051093          	slli	ra,a0,0x10
    429c:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    429e:	0100d513          	srli	a0,ra,0x10
    42a2:	08f45a63          	ble	a5,s0,4336 <core_bench_matrix+0x93e>
				ret+=10;
    42a6:	00a50793          	addi	a5,a0,10
    42aa:	01079513          	slli	a0,a5,0x10
		for (j=0; j<N; j++) {
    42ae:	070d                	addi	a4,a4,3
				ret+=10;
    42b0:	8541                	srai	a0,a0,0x10
				tmp=0;
    42b2:	4781                	li	a5,0
			prev=cur;
    42b4:	00c68613          	addi	a2,a3,12
		for (j=0; j<N; j++) {
    42b8:	08977c63          	bleu	s1,a4,4350 <core_bench_matrix+0x958>
			cur=C[i*N+j];
    42bc:	00062083          	lw	ra,0(a2)
			tmp+=cur;
    42c0:	01051313          	slli	t1,a0,0x10
    42c4:	01035693          	srli	a3,t1,0x10
    42c8:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    42ca:	08f443e3          	blt	s0,a5,4b50 <core_bench_matrix+0x1158>
				ret += (cur>prev) ? 1 : 0;
    42ce:	0015a5b3          	slt	a1,a1,ra
    42d2:	00b68533          	add	a0,a3,a1
    42d6:	01051313          	slli	t1,a0,0x10
    42da:	41035593          	srai	a1,t1,0x10
			cur=C[i*N+j];
    42de:	00462303          	lw	t1,4(a2)
    42e2:	00460693          	addi	a3,a2,4
    42e6:	01059613          	slli	a2,a1,0x10
			tmp+=cur;
    42ea:	979a                	add	a5,a5,t1
		for (j=0; j<N; j++) {
    42ec:	0705                	addi	a4,a4,1
			if (tmp>clipval) {
    42ee:	01065513          	srli	a0,a2,0x10
    42f2:	f6f44ce3          	blt	s0,a5,426a <core_bench_matrix+0x872>
				ret += (cur>prev) ? 1 : 0;
    42f6:	0060a0b3          	slt	ra,ra,t1
    42fa:	001505b3          	add	a1,a0,ra
    42fe:	01059613          	slli	a2,a1,0x10
    4302:	41065513          	srai	a0,a2,0x10
			cur=C[i*N+j];
    4306:	42d0                	lw	a2,4(a3)
			tmp+=cur;
    4308:	01051593          	slli	a1,a0,0x10
    430c:	0105d513          	srli	a0,a1,0x10
    4310:	97b2                	add	a5,a5,a2
			if (tmp>clipval) {
    4312:	f6f44be3          	blt	s0,a5,4288 <core_bench_matrix+0x890>
				ret += (cur>prev) ? 1 : 0;
    4316:	00c32333          	slt	t1,t1,a2
    431a:	006500b3          	add	ra,a0,t1
    431e:	01009593          	slli	a1,ra,0x10
    4322:	4105d513          	srai	a0,a1,0x10
			cur=C[i*N+j];
    4326:	468c                	lw	a1,8(a3)
			tmp+=cur;
    4328:	01051093          	slli	ra,a0,0x10
    432c:	0100d513          	srli	a0,ra,0x10
    4330:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    4332:	f6f44ae3          	blt	s0,a5,42a6 <core_bench_matrix+0x8ae>
				ret += (cur>prev) ? 1 : 0;
    4336:	00b62633          	slt	a2,a2,a1
    433a:	00c50333          	add	t1,a0,a2
    433e:	01031093          	slli	ra,t1,0x10
		for (j=0; j<N; j++) {
    4342:	070d                	addi	a4,a4,3
				ret += (cur>prev) ? 1 : 0;
    4344:	4100d513          	srai	a0,ra,0x10
			prev=cur;
    4348:	00c68613          	addi	a2,a3,12
		for (j=0; j<N; j++) {
    434c:	f69768e3          	bltu	a4,s1,42bc <core_bench_matrix+0x8c4>
    4350:	4682                	lw	a3,0(sp)
	for (i=0; i<N; i++) {
    4352:	0385                	addi	t2,t2,1
			cur=C[i*N+j];
    4354:	872e                	mv	a4,a1
    4356:	92b6                	add	t0,t0,a3
	for (i=0; i<N; i++) {
    4358:	e693e5e3          	bltu	t2,s1,41c2 <core_bench_matrix+0x7ca>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    435c:	45e2                	lw	a1,24(sp)
    435e:	586010ef          	jal	ra,58e4 <crc16>
*/
void matrix_mul_matrix(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
	ee_u32 i,j,k;
	for (i=0; i<N; i++) {
		for (j=0; j<N; j++) {
			C[i*N+j]=0;
    4362:	4332                	lw	t1,12(sp)
    4364:	4591                	li	a1,4
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4366:	d22a                	sw	a0,36(sp)
			C[i*N+j]=0;
    4368:	cc2e                	sw	a1,24(sp)
    436a:	340311e3          	bnez	t1,4eac <core_bench_matrix+0x14b4>
    436e:	47c2                	lw	a5,16(sp)
    4370:	da22                	sw	s0,52(sp)
    4372:	4512                	lw	a0,4(sp)
    4374:	4422                	lw	s0,8(sp)
    4376:	c63e                	sw	a5,12(sp)
	for (i=0; i<N; i++) {
    4378:	ce02                	sw	zero,28(sp)
    437a:	4662                	lw	a2,24(sp)
    437c:	4581                	li	a1,0
    437e:	cbffb0ef          	jal	ra,3c <memset>
				tmp=0;
    4382:	45d2                	lw	a1,20(sp)
    4384:	832a                	mv	t1,a0
    4386:	82aa                	mv	t0,a0
		for (j=0; j<N; j++) {
    4388:	4501                	li	a0,0
			for(k=0;k<N;k++)
			{
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    438a:	46b2                	lw	a3,12(sp)
    438c:	00059083          	lh	ra,0(a1)
    4390:	fff48613          	addi	a2,s1,-1
    4394:	00069703          	lh	a4,0(a3)
    4398:	00767393          	andi	t2,a2,7
			for(k=0;k<N;k++)
    439c:	4605                	li	a2,1
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    439e:	02170733          	mul	a4,a4,ra
    43a2:	0689                	addi	a3,a3,2
    43a4:	008587b3          	add	a5,a1,s0
			for(k=0;k<N;k++)
    43a8:	14967463          	bleu	s1,a2,44f0 <core_bench_matrix+0xaf8>
    43ac:	0a038d63          	beqz	t2,4466 <core_bench_matrix+0xa6e>
    43b0:	08c38f63          	beq	t2,a2,444e <core_bench_matrix+0xa56>
    43b4:	4089                	li	ra,2
    43b6:	08138263          	beq	t2,ra,443a <core_bench_matrix+0xa42>
    43ba:	408d                	li	ra,3
    43bc:	06138563          	beq	t2,ra,4426 <core_bench_matrix+0xa2e>
    43c0:	4091                	li	ra,4
    43c2:	04138863          	beq	t2,ra,4412 <core_bench_matrix+0xa1a>
    43c6:	4095                	li	ra,5
    43c8:	02138b63          	beq	t2,ra,43fe <core_bench_matrix+0xa06>
    43cc:	4099                	li	ra,6
    43ce:	00138e63          	beq	t2,ra,43ea <core_bench_matrix+0x9f2>
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    43d2:	00079603          	lh	a2,0(a5)
    43d6:	00069383          	lh	t2,0(a3)
    43da:	40b2                	lw	ra,12(sp)
    43dc:	97a2                	add	a5,a5,s0
    43de:	02c386b3          	mul	a3,t2,a2
			for(k=0;k<N;k++)
    43e2:	4609                	li	a2,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    43e4:	9736                	add	a4,a4,a3
    43e6:	00408693          	addi	a3,ra,4
    43ea:	00069383          	lh	t2,0(a3)
    43ee:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    43f2:	0605                	addi	a2,a2,1
    43f4:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    43f6:	021383b3          	mul	t2,t2,ra
    43fa:	97a2                	add	a5,a5,s0
    43fc:	971e                	add	a4,a4,t2
    43fe:	00069383          	lh	t2,0(a3)
    4402:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    4406:	0605                	addi	a2,a2,1
    4408:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    440a:	021383b3          	mul	t2,t2,ra
    440e:	97a2                	add	a5,a5,s0
    4410:	971e                	add	a4,a4,t2
    4412:	00069383          	lh	t2,0(a3)
    4416:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    441a:	0605                	addi	a2,a2,1
    441c:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    441e:	021383b3          	mul	t2,t2,ra
    4422:	97a2                	add	a5,a5,s0
    4424:	971e                	add	a4,a4,t2
    4426:	00069383          	lh	t2,0(a3)
    442a:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    442e:	0605                	addi	a2,a2,1
    4430:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4432:	021383b3          	mul	t2,t2,ra
    4436:	97a2                	add	a5,a5,s0
    4438:	971e                	add	a4,a4,t2
    443a:	00069383          	lh	t2,0(a3)
    443e:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    4442:	0605                	addi	a2,a2,1
    4444:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4446:	021383b3          	mul	t2,t2,ra
    444a:	97a2                	add	a5,a5,s0
    444c:	971e                	add	a4,a4,t2
    444e:	00069383          	lh	t2,0(a3)
    4452:	00079083          	lh	ra,0(a5)
			for(k=0;k<N;k++)
    4456:	0605                	addi	a2,a2,1
    4458:	0689                	addi	a3,a3,2
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    445a:	021383b3          	mul	t2,t2,ra
    445e:	97a2                	add	a5,a5,s0
    4460:	971e                	add	a4,a4,t2
			for(k=0;k<N;k++)
    4462:	08967763          	bleu	s1,a2,44f0 <core_bench_matrix+0xaf8>
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4466:	00079083          	lh	ra,0(a5)
    446a:	00069383          	lh	t2,0(a3)
    446e:	97a2                	add	a5,a5,s0
			for(k=0;k<N;k++)
    4470:	0621                	addi	a2,a2,8
				C[i*N+j]+=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4472:	021383b3          	mul	t2,t2,ra
    4476:	00079083          	lh	ra,0(a5)
    447a:	97a2                	add	a5,a5,s0
    447c:	06c1                	addi	a3,a3,16
    447e:	971e                	add	a4,a4,t2
    4480:	ff269383          	lh	t2,-14(a3)
    4484:	021383b3          	mul	t2,t2,ra
    4488:	00079083          	lh	ra,0(a5)
    448c:	97a2                	add	a5,a5,s0
    448e:	971e                	add	a4,a4,t2
    4490:	ff469383          	lh	t2,-12(a3)
    4494:	021383b3          	mul	t2,t2,ra
    4498:	00079083          	lh	ra,0(a5)
    449c:	97a2                	add	a5,a5,s0
    449e:	971e                	add	a4,a4,t2
    44a0:	ff669383          	lh	t2,-10(a3)
    44a4:	021383b3          	mul	t2,t2,ra
    44a8:	ff869083          	lh	ra,-8(a3)
    44ac:	93ba                	add	t2,t2,a4
    44ae:	00079703          	lh	a4,0(a5)
    44b2:	97a2                	add	a5,a5,s0
    44b4:	02e080b3          	mul	ra,ra,a4
    44b8:	00079703          	lh	a4,0(a5)
    44bc:	97a2                	add	a5,a5,s0
    44be:	9386                	add	t2,t2,ra
    44c0:	ffa69083          	lh	ra,-6(a3)
    44c4:	02e080b3          	mul	ra,ra,a4
    44c8:	ffc69703          	lh	a4,-4(a3)
    44cc:	909e                	add	ra,ra,t2
    44ce:	00079383          	lh	t2,0(a5)
    44d2:	97a2                	add	a5,a5,s0
    44d4:	02770733          	mul	a4,a4,t2
    44d8:	00e083b3          	add	t2,ra,a4
    44dc:	ffe69703          	lh	a4,-2(a3)
    44e0:	00079083          	lh	ra,0(a5)
    44e4:	97a2                	add	a5,a5,s0
    44e6:	02170733          	mul	a4,a4,ra
    44ea:	971e                	add	a4,a4,t2
			for(k=0;k<N;k++)
    44ec:	f6966de3          	bltu	a2,s1,4466 <core_bench_matrix+0xa6e>
    44f0:	00e2a023          	sw	a4,0(t0)
		for (j=0; j<N; j++) {
    44f4:	0505                	addi	a0,a0,1
    44f6:	0291                	addi	t0,t0,4
    44f8:	0589                	addi	a1,a1,2
    44fa:	e89568e3          	bltu	a0,s1,438a <core_bench_matrix+0x992>
    44fe:	4502                	lw	a0,0(sp)
	for (i=0; i<N; i++) {
    4500:	45f2                	lw	a1,28(sp)
    4502:	951a                	add	a0,a0,t1
    4504:	4332                	lw	t1,12(sp)
    4506:	00158293          	addi	t0,a1,1
    450a:	ce16                	sw	t0,28(sp)
    450c:	00830633          	add	a2,t1,s0
    4510:	c632                	sw	a2,12(sp)
    4512:	e692e4e3          	bltu	t0,s1,437a <core_bench_matrix+0x982>
    4516:	5452                	lw	s0,52(sp)
    4518:	4392                	lw	t2,4(sp)
	ee_s16 ret=0;
    451a:	4501                	li	a0,0
	MATRES tmp=0,prev=0,cur=0;
    451c:	4701                	li	a4,0
    451e:	4781                	li	a5,0
	for (i=0; i<N; i++) {
    4520:	4601                	li	a2,0
			cur=C[i*N+j];
    4522:	0003a303          	lw	t1,0(t2)
    4526:	fff48693          	addi	a3,s1,-1
    452a:	01051093          	slli	ra,a0,0x10
			tmp+=cur;
    452e:	979a                	add	a5,a5,t1
    4530:	0076f293          	andi	t0,a3,7
			if (tmp>clipval) {
    4534:	0100d593          	srli	a1,ra,0x10
    4538:	02f45ce3          	ble	a5,s0,4d70 <core_bench_matrix+0x1378>
				ret+=10;
    453c:	00a58793          	addi	a5,a1,10
    4540:	01079093          	slli	ra,a5,0x10
    4544:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4548:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    454a:	4705                	li	a4,1
    454c:	00438593          	addi	a1,t2,4
			cur=C[i*N+j];
    4550:	869a                	mv	a3,t1
		for (j=0; j<N; j++) {
    4552:	12977663          	bleu	s1,a4,467e <core_bench_matrix+0xc86>
    4556:	70028463          	beqz	t0,4c5e <core_bench_matrix+0x1266>
    455a:	0ee28e63          	beq	t0,a4,4656 <core_bench_matrix+0xc5e>
    455e:	4089                	li	ra,2
    4560:	0c128963          	beq	t0,ra,4632 <core_bench_matrix+0xc3a>
    4564:	408d                	li	ra,3
    4566:	0a128463          	beq	t0,ra,460e <core_bench_matrix+0xc16>
    456a:	4091                	li	ra,4
    456c:	06128e63          	beq	t0,ra,45e8 <core_bench_matrix+0xbf0>
    4570:	4095                	li	ra,5
    4572:	04128963          	beq	t0,ra,45c4 <core_bench_matrix+0xbcc>
    4576:	4099                	li	ra,6
    4578:	02128463          	beq	t0,ra,45a0 <core_bench_matrix+0xba8>
			cur=C[i*N+j];
    457c:	4194                	lw	a3,0(a1)
			tmp+=cur;
    457e:	01051293          	slli	t0,a0,0x10
    4582:	0102d093          	srli	ra,t0,0x10
    4586:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    4588:	10f449e3          	blt	s0,a5,4e9a <core_bench_matrix+0x14a2>
				ret += (cur>prev) ? 1 : 0;
    458c:	00d32333          	slt	t1,t1,a3
    4590:	00608533          	add	a0,ra,t1
    4594:	01051293          	slli	t0,a0,0x10
    4598:	4102d513          	srai	a0,t0,0x10
		for (j=0; j<N; j++) {
    459c:	0705                	addi	a4,a4,1
    459e:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    45a0:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    45a4:	0542                	slli	a0,a0,0x10
    45a6:	01055293          	srli	t0,a0,0x10
    45aa:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    45ac:	0af452e3          	ble	a5,s0,4e50 <core_bench_matrix+0x1458>
				ret+=10;
    45b0:	00a28793          	addi	a5,t0,10
    45b4:	01079293          	slli	t0,a5,0x10
    45b8:	4102d513          	srai	a0,t0,0x10
				tmp=0;
    45bc:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    45be:	0705                	addi	a4,a4,1
    45c0:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    45c2:	869a                	mv	a3,t1
    45c4:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    45c8:	01051093          	slli	ra,a0,0x10
    45cc:	0100d513          	srli	a0,ra,0x10
    45d0:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    45d2:	02f459e3          	ble	a5,s0,4e04 <core_bench_matrix+0x140c>
				ret+=10;
    45d6:	00a50793          	addi	a5,a0,10
    45da:	01079513          	slli	a0,a5,0x10
    45de:	8541                	srai	a0,a0,0x10
				tmp=0;
    45e0:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    45e2:	0705                	addi	a4,a4,1
    45e4:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    45e6:	869a                	mv	a3,t1
    45e8:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    45ec:	01051293          	slli	t0,a0,0x10
    45f0:	0102d093          	srli	ra,t0,0x10
    45f4:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    45f6:	04f453e3          	ble	a5,s0,4e3c <core_bench_matrix+0x1444>
				ret+=10;
    45fa:	00a08793          	addi	a5,ra,10
    45fe:	01079093          	slli	ra,a5,0x10
    4602:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4606:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4608:	0705                	addi	a4,a4,1
    460a:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    460c:	869a                	mv	a3,t1
    460e:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    4612:	0542                	slli	a0,a0,0x10
    4614:	01055293          	srli	t0,a0,0x10
    4618:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    461a:	7ef45f63          	ble	a5,s0,4e18 <core_bench_matrix+0x1420>
				ret+=10;
    461e:	00a28793          	addi	a5,t0,10
    4622:	01079293          	slli	t0,a5,0x10
    4626:	4102d513          	srai	a0,t0,0x10
				tmp=0;
    462a:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    462c:	0705                	addi	a4,a4,1
    462e:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    4630:	869a                	mv	a3,t1
    4632:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    4636:	01051093          	slli	ra,a0,0x10
    463a:	0100d513          	srli	a0,ra,0x10
    463e:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4640:	7ef45563          	ble	a5,s0,4e2a <core_bench_matrix+0x1432>
				ret+=10;
    4644:	00a50793          	addi	a5,a0,10
    4648:	01079513          	slli	a0,a5,0x10
    464c:	8541                	srai	a0,a0,0x10
				tmp=0;
    464e:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4650:	0705                	addi	a4,a4,1
    4652:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    4654:	869a                	mv	a3,t1
    4656:	0005a303          	lw	t1,0(a1)
			tmp+=cur;
    465a:	01051293          	slli	t0,a0,0x10
    465e:	0102d093          	srli	ra,t0,0x10
    4662:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4664:	78f45763          	ble	a5,s0,4df2 <core_bench_matrix+0x13fa>
				ret+=10;
    4668:	00a08793          	addi	a5,ra,10
    466c:	01079093          	slli	ra,a5,0x10
    4670:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4674:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4676:	0705                	addi	a4,a4,1
    4678:	0591                	addi	a1,a1,4
    467a:	5e976263          	bltu	a4,s1,4c5e <core_bench_matrix+0x1266>
    467e:	4682                	lw	a3,0(sp)
	for (i=0; i<N; i++) {
    4680:	0605                	addi	a2,a2,1
			cur=C[i*N+j];
    4682:	871a                	mv	a4,t1
    4684:	93b6                	add	t2,t2,a3
	for (i=0; i<N; i++) {
    4686:	e8966ee3          	bltu	a2,s1,4522 <core_bench_matrix+0xb2a>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    468a:	5592                	lw	a1,36(sp)
    468c:	258010ef          	jal	ra,58e4 <crc16>
    4690:	4342                	lw	t1,16(sp)
    4692:	c822                	sw	s0,16(sp)
    4694:	4422                	lw	s0,8(sp)
    4696:	4292                	lw	t0,4(sp)
    4698:	ce2a                	sw	a0,28(sp)
    469a:	c61a                	sw	t1,12(sp)
	Multiply a matrix by a matrix, and extract some bits from the result.
	Basic code is used in many algorithms, mostly with minor changes such as scaling.
*/
void matrix_mul_matrix_bitextract(ee_u32 N, MATRES *C, MATDAT *A, MATDAT *B) {
	ee_u32 i,j,k;
	for (i=0; i<N; i++) {
    469c:	c202                	sw	zero,4(sp)
    469e:	4662                	lw	a2,24(sp)
    46a0:	4581                	li	a1,0
    46a2:	8516                	mv	a0,t0
    46a4:	999fb0ef          	jal	ra,3c <memset>
				tmp=0;
    46a8:	45d2                	lw	a1,20(sp)
    46aa:	832a                	mv	t1,a0
    46ac:	82aa                	mv	t0,a0
		for (j=0; j<N; j++) {
    46ae:	4501                	li	a0,0
			C[i*N+j]=0;
			for(k=0;k<N;k++)
			{
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    46b0:	46b2                	lw	a3,12(sp)
    46b2:	00059783          	lh	a5,0(a1)
    46b6:	fff48093          	addi	ra,s1,-1
    46ba:	00069603          	lh	a2,0(a3)
    46be:	0030f393          	andi	t2,ra,3
    46c2:	0689                	addi	a3,a3,2
    46c4:	02f60733          	mul	a4,a2,a5
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    46c8:	40275093          	srai	ra,a4,0x2
    46cc:	40575793          	srai	a5,a4,0x5
    46d0:	00f0f613          	andi	a2,ra,15
    46d4:	07f7f713          	andi	a4,a5,127
    46d8:	02e607b3          	mul	a5,a2,a4
			for(k=0;k<N;k++)
    46dc:	4605                	li	a2,1
    46de:	00858733          	add	a4,a1,s0
    46e2:	12967563          	bleu	s1,a2,480c <core_bench_matrix+0xe14>
    46e6:	08038763          	beqz	t2,4774 <core_bench_matrix+0xd7c>
    46ea:	04c38f63          	beq	t2,a2,4748 <core_bench_matrix+0xd50>
    46ee:	4089                	li	ra,2
    46f0:	02138863          	beq	t2,ra,4720 <core_bench_matrix+0xd28>
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    46f4:	00069383          	lh	t2,0(a3)
    46f8:	00071683          	lh	a3,0(a4)
    46fc:	9722                	add	a4,a4,s0
    46fe:	02d380b3          	mul	ra,t2,a3
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    4702:	4020d613          	srai	a2,ra,0x2
    4706:	4050d693          	srai	a3,ra,0x5
    470a:	00f67393          	andi	t2,a2,15
    470e:	07f6f093          	andi	ra,a3,127
    4712:	02138633          	mul	a2,t2,ra
    4716:	43b2                	lw	t2,12(sp)
    4718:	00438693          	addi	a3,t2,4
    471c:	97b2                	add	a5,a5,a2
			for(k=0;k<N;k++)
    471e:	4609                	li	a2,2
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4720:	00069083          	lh	ra,0(a3)
    4724:	00071383          	lh	t2,0(a4)
			for(k=0;k<N;k++)
    4728:	0605                	addi	a2,a2,1
    472a:	0689                	addi	a3,a3,2
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    472c:	027083b3          	mul	t2,ra,t2
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    4730:	9722                	add	a4,a4,s0
    4732:	4023d093          	srai	ra,t2,0x2
    4736:	4053d393          	srai	t2,t2,0x5
    473a:	00f0f093          	andi	ra,ra,15
    473e:	07f3f393          	andi	t2,t2,127
    4742:	027080b3          	mul	ra,ra,t2
    4746:	9786                	add	a5,a5,ra
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4748:	00069083          	lh	ra,0(a3)
    474c:	00071383          	lh	t2,0(a4)
			for(k=0;k<N;k++)
    4750:	0605                	addi	a2,a2,1
    4752:	0689                	addi	a3,a3,2
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4754:	027083b3          	mul	t2,ra,t2
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    4758:	9722                	add	a4,a4,s0
    475a:	4023d093          	srai	ra,t2,0x2
    475e:	4053d393          	srai	t2,t2,0x5
    4762:	00f0f093          	andi	ra,ra,15
    4766:	07f3f393          	andi	t2,t2,127
    476a:	027080b3          	mul	ra,ra,t2
    476e:	9786                	add	a5,a5,ra
			for(k=0;k<N;k++)
    4770:	08967e63          	bleu	s1,a2,480c <core_bench_matrix+0xe14>
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4774:	00071383          	lh	t2,0(a4)
    4778:	00069083          	lh	ra,0(a3)
    477c:	9722                	add	a4,a4,s0
			for(k=0;k<N;k++)
    477e:	0611                	addi	a2,a2,4
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    4780:	027080b3          	mul	ra,ra,t2
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    4784:	06a1                	addi	a3,a3,8
    4786:	4020d393          	srai	t2,ra,0x2
    478a:	4050d093          	srai	ra,ra,0x5
    478e:	07f0f093          	andi	ra,ra,127
    4792:	00f3f393          	andi	t2,t2,15
    4796:	021383b3          	mul	t2,t2,ra
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    479a:	ffa69083          	lh	ra,-6(a3)
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    479e:	979e                	add	a5,a5,t2
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    47a0:	00071383          	lh	t2,0(a4)
    47a4:	9722                	add	a4,a4,s0
    47a6:	027080b3          	mul	ra,ra,t2
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    47aa:	4020d393          	srai	t2,ra,0x2
    47ae:	4050d093          	srai	ra,ra,0x5
    47b2:	07f0f093          	andi	ra,ra,127
    47b6:	00f3f393          	andi	t2,t2,15
    47ba:	021383b3          	mul	t2,t2,ra
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    47be:	ffc69083          	lh	ra,-4(a3)
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    47c2:	93be                	add	t2,t2,a5
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    47c4:	00071783          	lh	a5,0(a4)
    47c8:	9722                	add	a4,a4,s0
    47ca:	02f087b3          	mul	a5,ra,a5
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    47ce:	4027d093          	srai	ra,a5,0x2
    47d2:	8795                	srai	a5,a5,0x5
    47d4:	07f7f793          	andi	a5,a5,127
    47d8:	00f0f093          	andi	ra,ra,15
    47dc:	02f080b3          	mul	ra,ra,a5
    47e0:	001387b3          	add	a5,t2,ra
				MATRES tmp=(MATRES)A[i*N+k] * (MATRES)B[k*N+j];
    47e4:	00071383          	lh	t2,0(a4)
    47e8:	ffe69083          	lh	ra,-2(a3)
    47ec:	9722                	add	a4,a4,s0
    47ee:	027080b3          	mul	ra,ra,t2
				C[i*N+j]+=bit_extract(tmp,2,4)*bit_extract(tmp,5,7);
    47f2:	4020d393          	srai	t2,ra,0x2
    47f6:	4050d093          	srai	ra,ra,0x5
    47fa:	00f3f393          	andi	t2,t2,15
    47fe:	07f0f093          	andi	ra,ra,127
    4802:	021383b3          	mul	t2,t2,ra
    4806:	979e                	add	a5,a5,t2
			for(k=0;k<N;k++)
    4808:	f69666e3          	bltu	a2,s1,4774 <core_bench_matrix+0xd7c>
    480c:	00f2a023          	sw	a5,0(t0)
		for (j=0; j<N; j++) {
    4810:	0505                	addi	a0,a0,1
    4812:	0291                	addi	t0,t0,4
    4814:	0589                	addi	a1,a1,2
    4816:	e8956de3          	bltu	a0,s1,46b0 <core_bench_matrix+0xcb8>
    481a:	4282                	lw	t0,0(sp)
	for (i=0; i<N; i++) {
    481c:	4592                	lw	a1,4(sp)
    481e:	929a                	add	t0,t0,t1
    4820:	4332                	lw	t1,12(sp)
    4822:	00158513          	addi	a0,a1,1
    4826:	c22a                	sw	a0,4(sp)
    4828:	00830633          	add	a2,t1,s0
    482c:	c632                	sw	a2,12(sp)
    482e:	e69568e3          	bltu	a0,s1,469e <core_bench_matrix+0xca6>
    4832:	4442                	lw	s0,16(sp)
	for (i=0; i<N; i++) {
    4834:	53c2                	lw	t2,48(sp)
	ee_s16 ret=0;
    4836:	4501                	li	a0,0
	MATRES tmp=0,prev=0,cur=0;
    4838:	4601                	li	a2,0
    483a:	4781                	li	a5,0
	for (i=0; i<N; i++) {
    483c:	4281                	li	t0,0
    483e:	fff48693          	addi	a3,s1,-1
    4842:	0036f313          	andi	t1,a3,3
			cur=C[i*N+j];
    4846:	0003a683          	lw	a3,0(t2)
			tmp+=cur;
    484a:	01051093          	slli	ra,a0,0x10
    484e:	0100d593          	srli	a1,ra,0x10
    4852:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    4854:	58f45663          	ble	a5,s0,4de0 <core_bench_matrix+0x13e8>
				ret+=10;
    4858:	00a58793          	addi	a5,a1,10
    485c:	01079093          	slli	ra,a5,0x10
    4860:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4864:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4866:	4605                	li	a2,1
    4868:	00438593          	addi	a1,t2,4
			cur=C[i*N+j];
    486c:	8736                	mv	a4,a3
		for (j=0; j<N; j++) {
    486e:	18967463          	bleu	s1,a2,49f6 <core_bench_matrix+0xffe>
    4872:	0e030963          	beqz	t1,4964 <core_bench_matrix+0xf6c>
    4876:	04c30763          	beq	t1,a2,48c4 <core_bench_matrix+0xecc>
    487a:	4089                	li	ra,2
    487c:	02130263          	beq	t1,ra,48a0 <core_bench_matrix+0xea8>
			cur=C[i*N+j];
    4880:	4198                	lw	a4,0(a1)
			tmp+=cur;
    4882:	01051313          	slli	t1,a0,0x10
    4886:	01035513          	srli	a0,t1,0x10
    488a:	97ba                	add	a5,a5,a4
			if (tmp>clipval) {
    488c:	5cf45b63          	ble	a5,s0,4e62 <core_bench_matrix+0x146a>
				ret+=10;
    4890:	00a50793          	addi	a5,a0,10
    4894:	01079513          	slli	a0,a5,0x10
    4898:	8541                	srai	a0,a0,0x10
				tmp=0;
    489a:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    489c:	0605                	addi	a2,a2,1
    489e:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    48a0:	4194                	lw	a3,0(a1)
			tmp+=cur;
    48a2:	01051093          	slli	ra,a0,0x10
    48a6:	0100d313          	srli	t1,ra,0x10
    48aa:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    48ac:	50f45963          	ble	a5,s0,4dbe <core_bench_matrix+0x13c6>
				ret+=10;
    48b0:	00a30793          	addi	a5,t1,10
    48b4:	01079313          	slli	t1,a5,0x10
    48b8:	41035513          	srai	a0,t1,0x10
				tmp=0;
    48bc:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    48be:	0605                	addi	a2,a2,1
    48c0:	0591                	addi	a1,a1,4
			cur=C[i*N+j];
    48c2:	8736                	mv	a4,a3
    48c4:	4194                	lw	a3,0(a1)
			tmp+=cur;
    48c6:	0542                	slli	a0,a0,0x10
    48c8:	01055093          	srli	ra,a0,0x10
    48cc:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    48ce:	50f45163          	ble	a5,s0,4dd0 <core_bench_matrix+0x13d8>
				ret+=10;
    48d2:	00a08793          	addi	a5,ra,10
    48d6:	01079093          	slli	ra,a5,0x10
    48da:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    48de:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    48e0:	0605                	addi	a2,a2,1
    48e2:	0591                	addi	a1,a1,4
    48e4:	08966063          	bltu	a2,s1,4964 <core_bench_matrix+0xf6c>
    48e8:	a239                	j	49f6 <core_bench_matrix+0xffe>
				ret += (cur>prev) ? 1 : 0;
    48ea:	0016a6b3          	slt	a3,a3,ra
    48ee:	00d70533          	add	a0,a4,a3
    48f2:	01051313          	slli	t1,a0,0x10
    48f6:	41035693          	srai	a3,t1,0x10
			cur=C[i*N+j];
    48fa:	0045a303          	lw	t1,4(a1)
    48fe:	00458713          	addi	a4,a1,4
    4902:	01069593          	slli	a1,a3,0x10
			tmp+=cur;
    4906:	979a                	add	a5,a5,t1
		for (j=0; j<N; j++) {
    4908:	0605                	addi	a2,a2,1
			if (tmp>clipval) {
    490a:	0105d513          	srli	a0,a1,0x10
    490e:	08f45763          	ble	a5,s0,499c <core_bench_matrix+0xfa4>
				ret+=10;
    4912:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    4916:	434c                	lw	a1,4(a4)
				ret+=10;
    4918:	01079093          	slli	ra,a5,0x10
    491c:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4920:	4781                	li	a5,0
			tmp+=cur;
    4922:	01051693          	slli	a3,a0,0x10
    4926:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    4928:	0106d513          	srli	a0,a3,0x10
    492c:	08f45863          	ble	a5,s0,49bc <core_bench_matrix+0xfc4>
				ret+=10;
    4930:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    4934:	4714                	lw	a3,8(a4)
				ret+=10;
    4936:	01079313          	slli	t1,a5,0x10
    493a:	41035513          	srai	a0,t1,0x10
				tmp=0;
    493e:	4781                	li	a5,0
			tmp+=cur;
    4940:	01051093          	slli	ra,a0,0x10
    4944:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    4946:	0100d513          	srli	a0,ra,0x10
    494a:	08f45963          	ble	a5,s0,49dc <core_bench_matrix+0xfe4>
				ret+=10;
    494e:	00a50793          	addi	a5,a0,10
    4952:	01079513          	slli	a0,a5,0x10
		for (j=0; j<N; j++) {
    4956:	060d                	addi	a2,a2,3
				ret+=10;
    4958:	8541                	srai	a0,a0,0x10
				tmp=0;
    495a:	4781                	li	a5,0
			prev=cur;
    495c:	00c70593          	addi	a1,a4,12
		for (j=0; j<N; j++) {
    4960:	08967b63          	bleu	s1,a2,49f6 <core_bench_matrix+0xffe>
			cur=C[i*N+j];
    4964:	0005a083          	lw	ra,0(a1)
			tmp+=cur;
    4968:	01051313          	slli	t1,a0,0x10
    496c:	01035713          	srli	a4,t1,0x10
    4970:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    4972:	f6f45ce3          	ble	a5,s0,48ea <core_bench_matrix+0xef2>
				ret+=10;
    4976:	00a70793          	addi	a5,a4,10
			cur=C[i*N+j];
    497a:	0045a303          	lw	t1,4(a1)
				ret+=10;
    497e:	01079713          	slli	a4,a5,0x10
    4982:	41075693          	srai	a3,a4,0x10
				tmp=0;
    4986:	4781                	li	a5,0
			prev=cur;
    4988:	00458713          	addi	a4,a1,4
			tmp+=cur;
    498c:	979a                	add	a5,a5,t1
    498e:	01069593          	slli	a1,a3,0x10
		for (j=0; j<N; j++) {
    4992:	0605                	addi	a2,a2,1
			if (tmp>clipval) {
    4994:	0105d513          	srli	a0,a1,0x10
    4998:	f6f44de3          	blt	s0,a5,4912 <core_bench_matrix+0xf1a>
				ret += (cur>prev) ? 1 : 0;
    499c:	0060a0b3          	slt	ra,ra,t1
    49a0:	001506b3          	add	a3,a0,ra
    49a4:	01069593          	slli	a1,a3,0x10
    49a8:	4105d513          	srai	a0,a1,0x10
			cur=C[i*N+j];
    49ac:	434c                	lw	a1,4(a4)
			tmp+=cur;
    49ae:	01051693          	slli	a3,a0,0x10
    49b2:	0106d513          	srli	a0,a3,0x10
    49b6:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    49b8:	f6f44ce3          	blt	s0,a5,4930 <core_bench_matrix+0xf38>
				ret += (cur>prev) ? 1 : 0;
    49bc:	00b32333          	slt	t1,t1,a1
    49c0:	006500b3          	add	ra,a0,t1
    49c4:	01009693          	slli	a3,ra,0x10
    49c8:	4106d513          	srai	a0,a3,0x10
			cur=C[i*N+j];
    49cc:	4714                	lw	a3,8(a4)
			tmp+=cur;
    49ce:	01051093          	slli	ra,a0,0x10
    49d2:	0100d513          	srli	a0,ra,0x10
    49d6:	97b6                	add	a5,a5,a3
			if (tmp>clipval) {
    49d8:	f6f44be3          	blt	s0,a5,494e <core_bench_matrix+0xf56>
				ret += (cur>prev) ? 1 : 0;
    49dc:	00d5a5b3          	slt	a1,a1,a3
    49e0:	00b50333          	add	t1,a0,a1
    49e4:	01031093          	slli	ra,t1,0x10
		for (j=0; j<N; j++) {
    49e8:	060d                	addi	a2,a2,3
				ret += (cur>prev) ? 1 : 0;
    49ea:	4100d513          	srai	a0,ra,0x10
			prev=cur;
    49ee:	00c70593          	addi	a1,a4,12
		for (j=0; j<N; j++) {
    49f2:	f69669e3          	bltu	a2,s1,4964 <core_bench_matrix+0xf6c>
    49f6:	4702                	lw	a4,0(sp)
	for (i=0; i<N; i++) {
    49f8:	0285                	addi	t0,t0,1
			cur=C[i*N+j];
    49fa:	8636                	mv	a2,a3
    49fc:	93ba                	add	t2,t2,a4
	for (i=0; i<N; i++) {
    49fe:	e492e0e3          	bltu	t0,s1,483e <core_bench_matrix+0xe46>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4a02:	45f2                	lw	a1,28(sp)
	for (i=0; i<N; i++) {
    4a04:	4401                	li	s0,0
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4a06:	6df000ef          	jal	ra,58e4 <crc16>
	matrix_add_const(N,A,-val); /* return matrix to initial value */
    4a0a:	56a2                	lw	a3,40(sp)
    4a0c:	5332                	lw	t1,44(sp)
    4a0e:	42a2                	lw	t0,8(sp)
			A[i*N+j] += val;
    4a10:	00035783          	lhu	a5,0(t1)
    4a14:	fff48093          	addi	ra,s1,-1
    4a18:	0070f593          	andi	a1,ra,7
    4a1c:	40d78733          	sub	a4,a5,a3
    4a20:	00e31023          	sh	a4,0(t1)
		for (j=0; j<N; j++) {
    4a24:	4705                	li	a4,1
    4a26:	00230793          	addi	a5,t1,2
    4a2a:	10977363          	bleu	s1,a4,4b30 <core_bench_matrix+0x1138>
    4a2e:	cdc9                	beqz	a1,4ac8 <core_bench_matrix+0x10d0>
    4a30:	08e58263          	beq	a1,a4,4ab4 <core_bench_matrix+0x10bc>
    4a34:	4389                	li	t2,2
    4a36:	06758763          	beq	a1,t2,4aa4 <core_bench_matrix+0x10ac>
    4a3a:	460d                	li	a2,3
    4a3c:	04c58c63          	beq	a1,a2,4a94 <core_bench_matrix+0x109c>
    4a40:	4091                	li	ra,4
    4a42:	04158163          	beq	a1,ra,4a84 <core_bench_matrix+0x108c>
    4a46:	4395                	li	t2,5
    4a48:	02758663          	beq	a1,t2,4a74 <core_bench_matrix+0x107c>
    4a4c:	4619                	li	a2,6
    4a4e:	00c58b63          	beq	a1,a2,4a64 <core_bench_matrix+0x106c>
			A[i*N+j] += val;
    4a52:	0007d583          	lhu	a1,0(a5)
    4a56:	40d58733          	sub	a4,a1,a3
    4a5a:	00e79023          	sh	a4,0(a5)
		for (j=0; j<N; j++) {
    4a5e:	4709                	li	a4,2
    4a60:	00430793          	addi	a5,t1,4
			A[i*N+j] += val;
    4a64:	0007d083          	lhu	ra,0(a5)
		for (j=0; j<N; j++) {
    4a68:	0705                	addi	a4,a4,1
    4a6a:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4a6c:	40d083b3          	sub	t2,ra,a3
    4a70:	fe779f23          	sh	t2,-2(a5)
    4a74:	0007d603          	lhu	a2,0(a5)
		for (j=0; j<N; j++) {
    4a78:	0705                	addi	a4,a4,1
    4a7a:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4a7c:	40d605b3          	sub	a1,a2,a3
    4a80:	feb79f23          	sh	a1,-2(a5)
    4a84:	0007d083          	lhu	ra,0(a5)
		for (j=0; j<N; j++) {
    4a88:	0705                	addi	a4,a4,1
    4a8a:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4a8c:	40d083b3          	sub	t2,ra,a3
    4a90:	fe779f23          	sh	t2,-2(a5)
    4a94:	0007d603          	lhu	a2,0(a5)
		for (j=0; j<N; j++) {
    4a98:	0705                	addi	a4,a4,1
    4a9a:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4a9c:	40d605b3          	sub	a1,a2,a3
    4aa0:	feb79f23          	sh	a1,-2(a5)
    4aa4:	0007d083          	lhu	ra,0(a5)
		for (j=0; j<N; j++) {
    4aa8:	0705                	addi	a4,a4,1
    4aaa:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4aac:	40d083b3          	sub	t2,ra,a3
    4ab0:	fe779f23          	sh	t2,-2(a5)
    4ab4:	0007d603          	lhu	a2,0(a5)
		for (j=0; j<N; j++) {
    4ab8:	0705                	addi	a4,a4,1
    4aba:	0789                	addi	a5,a5,2
			A[i*N+j] += val;
    4abc:	40d605b3          	sub	a1,a2,a3
    4ac0:	feb79f23          	sh	a1,-2(a5)
		for (j=0; j<N; j++) {
    4ac4:	06977663          	bleu	s1,a4,4b30 <core_bench_matrix+0x1138>
			A[i*N+j] += val;
    4ac8:	0007d083          	lhu	ra,0(a5)
    4acc:	0027d603          	lhu	a2,2(a5)
		for (j=0; j<N; j++) {
    4ad0:	0721                	addi	a4,a4,8
			A[i*N+j] += val;
    4ad2:	40d083b3          	sub	t2,ra,a3
    4ad6:	40d605b3          	sub	a1,a2,a3
    4ada:	0047d083          	lhu	ra,4(a5)
    4ade:	0067d603          	lhu	a2,6(a5)
    4ae2:	00779023          	sh	t2,0(a5)
    4ae6:	00b79123          	sh	a1,2(a5)
    4aea:	40d083b3          	sub	t2,ra,a3
    4aee:	40d605b3          	sub	a1,a2,a3
    4af2:	0087d083          	lhu	ra,8(a5)
    4af6:	00a7d603          	lhu	a2,10(a5)
    4afa:	00779223          	sh	t2,4(a5)
    4afe:	00b79323          	sh	a1,6(a5)
    4b02:	40d083b3          	sub	t2,ra,a3
    4b06:	40d605b3          	sub	a1,a2,a3
    4b0a:	00c7d083          	lhu	ra,12(a5)
    4b0e:	00e7d603          	lhu	a2,14(a5)
    4b12:	00779423          	sh	t2,8(a5)
    4b16:	00b79523          	sh	a1,10(a5)
    4b1a:	40d083b3          	sub	t2,ra,a3
    4b1e:	40d605b3          	sub	a1,a2,a3
    4b22:	00779623          	sh	t2,12(a5)
    4b26:	00b79723          	sh	a1,14(a5)
    4b2a:	07c1                	addi	a5,a5,16
		for (j=0; j<N; j++) {
    4b2c:	f8976ee3          	bltu	a4,s1,4ac8 <core_bench_matrix+0x10d0>
	for (i=0; i<N; i++) {
    4b30:	0405                	addi	s0,s0,1
    4b32:	9316                	add	t1,t1,t0
    4b34:	ec946ee3          	bltu	s0,s1,4a10 <core_bench_matrix+0x1018>
	crc=crc16(matrix_test(N,C,A,B,val),crc);
    4b38:	01051493          	slli	s1,a0,0x10
}
    4b3c:	5472                	lw	s0,60(sp)
	crc=crc16(matrix_test(N,C,A,B,val),crc);
    4b3e:	5582                	lw	a1,32(sp)
}
    4b40:	4086                	lw	ra,64(sp)
	crc=crc16(matrix_test(N,C,A,B,val),crc);
    4b42:	4104d513          	srai	a0,s1,0x10
}
    4b46:	54e2                	lw	s1,56(sp)
    4b48:	04410113          	addi	sp,sp,68
	crc=crc16(matrix_test(N,C,A,B,val),crc);
    4b4c:	5990006f          	j	58e4 <crc16>
				ret+=10;
    4b50:	00a68793          	addi	a5,a3,10
    4b54:	01079693          	slli	a3,a5,0x10
    4b58:	4106d593          	srai	a1,a3,0x10
				tmp=0;
    4b5c:	4781                	li	a5,0
    4b5e:	f80ff06f          	j	42de <core_bench_matrix+0x8e6>
				ret += (cur>prev) ? 1 : 0;
    4b62:	00132333          	slt	t1,t1,ra
    4b66:	006682b3          	add	t0,a3,t1
    4b6a:	01029513          	slli	a0,t0,0x10
			cur=C[i*N+j];
    4b6e:	0045a283          	lw	t0,4(a1)
				ret += (cur>prev) ? 1 : 0;
    4b72:	41055313          	srai	t1,a0,0x10
			prev=cur;
    4b76:	00458693          	addi	a3,a1,4
			tmp+=cur;
    4b7a:	9796                	add	a5,a5,t0
    4b7c:	01031593          	slli	a1,t1,0x10
		for (j=0; j<N; j++) {
    4b80:	0705                	addi	a4,a4,1
			if (tmp>clipval) {
    4b82:	0105d513          	srli	a0,a1,0x10
    4b86:	10f45763          	ble	a5,s0,4c94 <core_bench_matrix+0x129c>
				ret+=10;
    4b8a:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    4b8e:	42cc                	lw	a1,4(a3)
				ret+=10;
    4b90:	01079093          	slli	ra,a5,0x10
    4b94:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4b98:	4781                	li	a5,0
			tmp+=cur;
    4b9a:	01051313          	slli	t1,a0,0x10
    4b9e:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    4ba0:	01035513          	srli	a0,t1,0x10
    4ba4:	10f45863          	ble	a5,s0,4cb4 <core_bench_matrix+0x12bc>
				ret+=10;
    4ba8:	00a50793          	addi	a5,a0,10
			cur=C[i*N+j];
    4bac:	0086a083          	lw	ra,8(a3)
				ret+=10;
    4bb0:	01079293          	slli	t0,a5,0x10
    4bb4:	4102d513          	srai	a0,t0,0x10
				tmp=0;
    4bb8:	4781                	li	a5,0
			tmp+=cur;
    4bba:	00178333          	add	t1,a5,ra
			if (tmp>clipval) {
    4bbe:	0542                	slli	a0,a0,0x10
    4bc0:	01055793          	srli	a5,a0,0x10
    4bc4:	10645963          	ble	t1,s0,4cd6 <core_bench_matrix+0x12de>
				ret+=10;
    4bc8:	00a78313          	addi	t1,a5,10
			cur=C[i*N+j];
    4bcc:	46cc                	lw	a1,12(a3)
				ret+=10;
    4bce:	01031793          	slli	a5,t1,0x10
    4bd2:	4107d293          	srai	t0,a5,0x10
				tmp=0;
    4bd6:	4301                	li	t1,0
			tmp+=cur;
    4bd8:	01029513          	slli	a0,t0,0x10
    4bdc:	00b307b3          	add	a5,t1,a1
			if (tmp>clipval) {
    4be0:	01055293          	srli	t0,a0,0x10
    4be4:	10f45a63          	ble	a5,s0,4cf8 <core_bench_matrix+0x1300>
				ret+=10;
    4be8:	00a28793          	addi	a5,t0,10
			cur=C[i*N+j];
    4bec:	0106a303          	lw	t1,16(a3)
				ret+=10;
    4bf0:	01079093          	slli	ra,a5,0x10
    4bf4:	4100d293          	srai	t0,ra,0x10
				tmp=0;
    4bf8:	4781                	li	a5,0
			tmp+=cur;
    4bfa:	01029513          	slli	a0,t0,0x10
    4bfe:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4c00:	01055293          	srli	t0,a0,0x10
    4c04:	10f45b63          	ble	a5,s0,4d1a <core_bench_matrix+0x1322>
				ret+=10;
    4c08:	00a28793          	addi	a5,t0,10
			cur=C[i*N+j];
    4c0c:	0146a083          	lw	ra,20(a3)
				ret+=10;
    4c10:	01079593          	slli	a1,a5,0x10
    4c14:	4105d293          	srai	t0,a1,0x10
				tmp=0;
    4c18:	4781                	li	a5,0
			tmp+=cur;
    4c1a:	01029513          	slli	a0,t0,0x10
    4c1e:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    4c20:	01055293          	srli	t0,a0,0x10
    4c24:	10f45c63          	ble	a5,s0,4d3c <core_bench_matrix+0x1344>
				ret+=10;
    4c28:	00a28793          	addi	a5,t0,10
    4c2c:	01079313          	slli	t1,a5,0x10
    4c30:	41035293          	srai	t0,t1,0x10
			cur=C[i*N+j];
    4c34:	0186a303          	lw	t1,24(a3)
				tmp=0;
    4c38:	4781                	li	a5,0
			tmp+=cur;
    4c3a:	01029593          	slli	a1,t0,0x10
    4c3e:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4c40:	0105d513          	srli	a0,a1,0x10
    4c44:	10f45d63          	ble	a5,s0,4d5e <core_bench_matrix+0x1366>
				ret+=10;
    4c48:	00a50793          	addi	a5,a0,10
    4c4c:	01079513          	slli	a0,a5,0x10
    4c50:	8541                	srai	a0,a0,0x10
				tmp=0;
    4c52:	4781                	li	a5,0
		for (j=0; j<N; j++) {
    4c54:	071d                	addi	a4,a4,7
    4c56:	01c68593          	addi	a1,a3,28
    4c5a:	a29772e3          	bleu	s1,a4,467e <core_bench_matrix+0xc86>
			cur=C[i*N+j];
    4c5e:	0005a083          	lw	ra,0(a1)
			tmp+=cur;
    4c62:	0542                	slli	a0,a0,0x10
    4c64:	01055693          	srli	a3,a0,0x10
    4c68:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    4c6a:	eef45ce3          	ble	a5,s0,4b62 <core_bench_matrix+0x116a>
				ret+=10;
    4c6e:	00a68793          	addi	a5,a3,10
			cur=C[i*N+j];
    4c72:	0045a283          	lw	t0,4(a1)
				ret+=10;
    4c76:	01079693          	slli	a3,a5,0x10
    4c7a:	4106d313          	srai	t1,a3,0x10
				tmp=0;
    4c7e:	4781                	li	a5,0
			prev=cur;
    4c80:	00458693          	addi	a3,a1,4
			tmp+=cur;
    4c84:	9796                	add	a5,a5,t0
    4c86:	01031593          	slli	a1,t1,0x10
		for (j=0; j<N; j++) {
    4c8a:	0705                	addi	a4,a4,1
			if (tmp>clipval) {
    4c8c:	0105d513          	srli	a0,a1,0x10
    4c90:	eef44de3          	blt	s0,a5,4b8a <core_bench_matrix+0x1192>
				ret += (cur>prev) ? 1 : 0;
    4c94:	0050a0b3          	slt	ra,ra,t0
    4c98:	00150333          	add	t1,a0,ra
    4c9c:	01031593          	slli	a1,t1,0x10
    4ca0:	4105d513          	srai	a0,a1,0x10
			cur=C[i*N+j];
    4ca4:	42cc                	lw	a1,4(a3)
			tmp+=cur;
    4ca6:	01051313          	slli	t1,a0,0x10
    4caa:	01035513          	srli	a0,t1,0x10
    4cae:	97ae                	add	a5,a5,a1
			if (tmp>clipval) {
    4cb0:	eef44ce3          	blt	s0,a5,4ba8 <core_bench_matrix+0x11b0>
				ret += (cur>prev) ? 1 : 0;
    4cb4:	00b2a2b3          	slt	t0,t0,a1
    4cb8:	005500b3          	add	ra,a0,t0
    4cbc:	01009313          	slli	t1,ra,0x10
			cur=C[i*N+j];
    4cc0:	0086a083          	lw	ra,8(a3)
				ret += (cur>prev) ? 1 : 0;
    4cc4:	41035513          	srai	a0,t1,0x10
			tmp+=cur;
    4cc8:	0542                	slli	a0,a0,0x10
    4cca:	00178333          	add	t1,a5,ra
			if (tmp>clipval) {
    4cce:	01055793          	srli	a5,a0,0x10
    4cd2:	ee644be3          	blt	s0,t1,4bc8 <core_bench_matrix+0x11d0>
				ret += (cur>prev) ? 1 : 0;
    4cd6:	0015a5b3          	slt	a1,a1,ra
    4cda:	00b782b3          	add	t0,a5,a1
			cur=C[i*N+j];
    4cde:	46cc                	lw	a1,12(a3)
				ret += (cur>prev) ? 1 : 0;
    4ce0:	01029513          	slli	a0,t0,0x10
    4ce4:	41055293          	srai	t0,a0,0x10
			tmp+=cur;
    4ce8:	01029513          	slli	a0,t0,0x10
    4cec:	00b307b3          	add	a5,t1,a1
			if (tmp>clipval) {
    4cf0:	01055293          	srli	t0,a0,0x10
    4cf4:	eef44ae3          	blt	s0,a5,4be8 <core_bench_matrix+0x11f0>
				ret += (cur>prev) ? 1 : 0;
    4cf8:	00b0a0b3          	slt	ra,ra,a1
    4cfc:	00128333          	add	t1,t0,ra
    4d00:	01031513          	slli	a0,t1,0x10
			cur=C[i*N+j];
    4d04:	0106a303          	lw	t1,16(a3)
				ret += (cur>prev) ? 1 : 0;
    4d08:	41055293          	srai	t0,a0,0x10
			tmp+=cur;
    4d0c:	01029513          	slli	a0,t0,0x10
    4d10:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4d12:	01055293          	srli	t0,a0,0x10
    4d16:	eef449e3          	blt	s0,a5,4c08 <core_bench_matrix+0x1210>
				ret += (cur>prev) ? 1 : 0;
    4d1a:	0065a5b3          	slt	a1,a1,t1
    4d1e:	00b280b3          	add	ra,t0,a1
    4d22:	01009513          	slli	a0,ra,0x10
			cur=C[i*N+j];
    4d26:	0146a083          	lw	ra,20(a3)
				ret += (cur>prev) ? 1 : 0;
    4d2a:	41055293          	srai	t0,a0,0x10
			tmp+=cur;
    4d2e:	01029513          	slli	a0,t0,0x10
    4d32:	9786                	add	a5,a5,ra
			if (tmp>clipval) {
    4d34:	01055293          	srli	t0,a0,0x10
    4d38:	eef448e3          	blt	s0,a5,4c28 <core_bench_matrix+0x1230>
				ret += (cur>prev) ? 1 : 0;
    4d3c:	00132333          	slt	t1,t1,ra
    4d40:	006285b3          	add	a1,t0,t1
			cur=C[i*N+j];
    4d44:	0186a303          	lw	t1,24(a3)
				ret += (cur>prev) ? 1 : 0;
    4d48:	01059513          	slli	a0,a1,0x10
    4d4c:	41055293          	srai	t0,a0,0x10
			tmp+=cur;
    4d50:	01029593          	slli	a1,t0,0x10
    4d54:	979a                	add	a5,a5,t1
			if (tmp>clipval) {
    4d56:	0105d513          	srli	a0,a1,0x10
    4d5a:	eef447e3          	blt	s0,a5,4c48 <core_bench_matrix+0x1250>
				ret += (cur>prev) ? 1 : 0;
    4d5e:	0060a0b3          	slt	ra,ra,t1
    4d62:	001502b3          	add	t0,a0,ra
    4d66:	01029593          	slli	a1,t0,0x10
    4d6a:	4105d513          	srai	a0,a1,0x10
    4d6e:	b5dd                	j	4c54 <core_bench_matrix+0x125c>
    4d70:	00672733          	slt	a4,a4,t1
    4d74:	00e58533          	add	a0,a1,a4
    4d78:	01051693          	slli	a3,a0,0x10
    4d7c:	4106d513          	srai	a0,a3,0x10
    4d80:	fcaff06f          	j	454a <core_bench_matrix+0xb52>
    4d84:	00b72733          	slt	a4,a4,a1
    4d88:	00e086b3          	add	a3,ra,a4
    4d8c:	01069613          	slli	a2,a3,0x10
    4d90:	41065513          	srai	a0,a2,0x10
    4d94:	c52ff06f          	j	41e6 <core_bench_matrix+0x7ee>
    4d98:	00b6a6b3          	slt	a3,a3,a1
    4d9c:	00d30533          	add	a0,t1,a3
    4da0:	01051093          	slli	ra,a0,0x10
    4da4:	4100d513          	srai	a0,ra,0x10
    4da8:	c96ff06f          	j	423e <core_bench_matrix+0x846>
    4dac:	00b6a333          	slt	t1,a3,a1
    4db0:	006086b3          	add	a3,ra,t1
    4db4:	01069513          	slli	a0,a3,0x10
    4db8:	8541                	srai	a0,a0,0x10
    4dba:	ca6ff06f          	j	4260 <core_bench_matrix+0x868>
    4dbe:	00d72733          	slt	a4,a4,a3
    4dc2:	00e30533          	add	a0,t1,a4
    4dc6:	01051093          	slli	ra,a0,0x10
    4dca:	4100d513          	srai	a0,ra,0x10
    4dce:	bcc5                	j	48be <core_bench_matrix+0xec6>
    4dd0:	00d72333          	slt	t1,a4,a3
    4dd4:	00608733          	add	a4,ra,t1
    4dd8:	01071513          	slli	a0,a4,0x10
    4ddc:	8541                	srai	a0,a0,0x10
    4dde:	b609                	j	48e0 <core_bench_matrix+0xee8>
    4de0:	00d62733          	slt	a4,a2,a3
    4de4:	00e58533          	add	a0,a1,a4
    4de8:	01051613          	slli	a2,a0,0x10
    4dec:	41065513          	srai	a0,a2,0x10
    4df0:	bc9d                	j	4866 <core_bench_matrix+0xe6e>
    4df2:	0066a533          	slt	a0,a3,t1
    4df6:	00a086b3          	add	a3,ra,a0
    4dfa:	01069293          	slli	t0,a3,0x10
    4dfe:	4102d513          	srai	a0,t0,0x10
    4e02:	b895                	j	4676 <core_bench_matrix+0xc7e>
    4e04:	0066a6b3          	slt	a3,a3,t1
    4e08:	00d502b3          	add	t0,a0,a3
    4e0c:	01029093          	slli	ra,t0,0x10
    4e10:	4100d513          	srai	a0,ra,0x10
    4e14:	fceff06f          	j	45e2 <core_bench_matrix+0xbea>
    4e18:	0066a6b3          	slt	a3,a3,t1
    4e1c:	00d280b3          	add	ra,t0,a3
    4e20:	01009513          	slli	a0,ra,0x10
    4e24:	8541                	srai	a0,a0,0x10
    4e26:	807ff06f          	j	462c <core_bench_matrix+0xc34>
    4e2a:	0066a6b3          	slt	a3,a3,t1
    4e2e:	00d502b3          	add	t0,a0,a3
    4e32:	01029093          	slli	ra,t0,0x10
    4e36:	4100d513          	srai	a0,ra,0x10
    4e3a:	b819                	j	4650 <core_bench_matrix+0xc58>
    4e3c:	0066a6b3          	slt	a3,a3,t1
    4e40:	00d08533          	add	a0,ra,a3
    4e44:	01051293          	slli	t0,a0,0x10
    4e48:	4102d513          	srai	a0,t0,0x10
    4e4c:	fbcff06f          	j	4608 <core_bench_matrix+0xc10>
    4e50:	0066a6b3          	slt	a3,a3,t1
    4e54:	00d280b3          	add	ra,t0,a3
    4e58:	01009513          	slli	a0,ra,0x10
    4e5c:	8541                	srai	a0,a0,0x10
    4e5e:	f60ff06f          	j	45be <core_bench_matrix+0xbc6>
    4e62:	00e6a6b3          	slt	a3,a3,a4
    4e66:	00d500b3          	add	ra,a0,a3
    4e6a:	01009313          	slli	t1,ra,0x10
    4e6e:	41035513          	srai	a0,t1,0x10
    4e72:	b42d                	j	489c <core_bench_matrix+0xea4>
    4e74:	00d5a5b3          	slt	a1,a1,a3
    4e78:	00b500b3          	add	ra,a0,a1
    4e7c:	01009313          	slli	t1,ra,0x10
    4e80:	41035513          	srai	a0,t1,0x10
    4e84:	b98ff06f          	j	421c <core_bench_matrix+0x824>
    4e88:	00d72733          	slt	a4,a4,a3
    4e8c:	00e08633          	add	a2,ra,a4
    4e90:	01061513          	slli	a0,a2,0x10
    4e94:	8541                	srai	a0,a0,0x10
    4e96:	e79fe06f          	j	3d0e <core_bench_matrix+0x316>
				ret+=10;
    4e9a:	00a08793          	addi	a5,ra,10
    4e9e:	01079093          	slli	ra,a5,0x10
    4ea2:	4100d513          	srai	a0,ra,0x10
				tmp=0;
    4ea6:	4781                	li	a5,0
    4ea8:	ef4ff06f          	j	459c <core_bench_matrix+0xba4>
			C[i*N+j]=0;
    4eac:	4082                	lw	ra,0(sp)
    4eae:	cc06                	sw	ra,24(sp)
    4eb0:	cbeff06f          	j	436e <core_bench_matrix+0x976>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4eb4:	4581                	li	a1,0
    4eb6:	4501                	li	a0,0
    4eb8:	22d000ef          	jal	ra,58e4 <crc16>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4ebc:	85aa                	mv	a1,a0
    4ebe:	4501                	li	a0,0
    4ec0:	225000ef          	jal	ra,58e4 <crc16>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4ec4:	85aa                	mv	a1,a0
    4ec6:	4501                	li	a0,0
    4ec8:	21d000ef          	jal	ra,58e4 <crc16>
	crc=crc16(matrix_sum(N,C,clipval),crc);
    4ecc:	85aa                	mv	a1,a0
    4ece:	4501                	li	a0,0
    4ed0:	215000ef          	jal	ra,58e4 <crc16>
	matrix_add_const(N,A,-val); /* return matrix to initial value */
    4ed4:	b195                	j	4b38 <core_bench_matrix+0x1140>

00004ed6 <core_init_matrix>:
ee_u32 core_init_matrix(ee_u32 blksize, void *memblk, ee_s32 seed, mat_params *p) {
    4ed6:	1101                	addi	sp,sp,-32
    4ed8:	ce22                	sw	s0,28(sp)
    4eda:	cc26                	sw	s1,24(sp)
    4edc:	ca36                	sw	a3,20(sp)
    4ede:	872a                	mv	a4,a0
	if (seed==0)
    4ee0:	e211                	bnez	a2,4ee4 <core_init_matrix+0xe>
		seed=1;
    4ee2:	4605                	li	a2,1
    4ee4:	fff58793          	addi	a5,a1,-1
    4ee8:	ffc7f293          	andi	t0,a5,-4
    4eec:	00428693          	addi	a3,t0,4
    4ef0:	c236                	sw	a3,4(sp)
	while (j<blksize) {
    4ef2:	4501                	li	a0,0
    4ef4:	30070963          	beqz	a4,5206 <core_init_matrix+0x330>
		i++;
    4ef8:	00150493          	addi	s1,a0,1
		j=i*i*2*4;
    4efc:	029485b3          	mul	a1,s1,s1
    4f00:	00359793          	slli	a5,a1,0x3
	while (j<blksize) {
    4f04:	08e7fa63          	bleu	a4,a5,4f98 <core_init_matrix+0xc2>
		i++;
    4f08:	00148293          	addi	t0,s1,1
		j=i*i*2*4;
    4f0c:	025286b3          	mul	a3,t0,t0
		i++;
    4f10:	8526                	mv	a0,s1
		j=i*i*2*4;
    4f12:	00369313          	slli	t1,a3,0x3
	while (j<blksize) {
    4f16:	08e37163          	bleu	a4,t1,4f98 <core_init_matrix+0xc2>
		i++;
    4f1a:	00128393          	addi	t2,t0,1
		j=i*i*2*4;
    4f1e:	02738433          	mul	s0,t2,t2
		i++;
    4f22:	8516                	mv	a0,t0
		j=i*i*2*4;
    4f24:	00341593          	slli	a1,s0,0x3
	while (j<blksize) {
    4f28:	06e5f863          	bleu	a4,a1,4f98 <core_init_matrix+0xc2>
		i++;
    4f2c:	00348793          	addi	a5,s1,3
		j=i*i*2*4;
    4f30:	02f782b3          	mul	t0,a5,a5
		i++;
    4f34:	00248513          	addi	a0,s1,2
		j=i*i*2*4;
    4f38:	00329693          	slli	a3,t0,0x3
	while (j<blksize) {
    4f3c:	04e6fe63          	bleu	a4,a3,4f98 <core_init_matrix+0xc2>
		i++;
    4f40:	00448313          	addi	t1,s1,4
		j=i*i*2*4;
    4f44:	026303b3          	mul	t2,t1,t1
		i++;
    4f48:	853e                	mv	a0,a5
		j=i*i*2*4;
    4f4a:	00339413          	slli	s0,t2,0x3
	while (j<blksize) {
    4f4e:	04e47563          	bleu	a4,s0,4f98 <core_init_matrix+0xc2>
		i++;
    4f52:	00548593          	addi	a1,s1,5
		j=i*i*2*4;
    4f56:	02b587b3          	mul	a5,a1,a1
		i++;
    4f5a:	851a                	mv	a0,t1
		j=i*i*2*4;
    4f5c:	00379293          	slli	t0,a5,0x3
	while (j<blksize) {
    4f60:	02e2fc63          	bleu	a4,t0,4f98 <core_init_matrix+0xc2>
		i++;
    4f64:	00648313          	addi	t1,s1,6
		j=i*i*2*4;
    4f68:	026306b3          	mul	a3,t1,t1
		i++;
    4f6c:	852e                	mv	a0,a1
		j=i*i*2*4;
    4f6e:	00369393          	slli	t2,a3,0x3
	while (j<blksize) {
    4f72:	02e3f363          	bleu	a4,t2,4f98 <core_init_matrix+0xc2>
		i++;
    4f76:	049d                	addi	s1,s1,7
		j=i*i*2*4;
    4f78:	02948433          	mul	s0,s1,s1
		i++;
    4f7c:	851a                	mv	a0,t1
		j=i*i*2*4;
    4f7e:	00341593          	slli	a1,s0,0x3
	while (j<blksize) {
    4f82:	00e5fb63          	bleu	a4,a1,4f98 <core_init_matrix+0xc2>
		i++;
    4f86:	8526                	mv	a0,s1
    4f88:	00150493          	addi	s1,a0,1
		j=i*i*2*4;
    4f8c:	029485b3          	mul	a1,s1,s1
    4f90:	00359793          	slli	a5,a1,0x3
	while (j<blksize) {
    4f94:	f6e7eae3          	bltu	a5,a4,4f08 <core_init_matrix+0x32>
	B=A+N*N;
    4f98:	02a50733          	mul	a4,a0,a0
    4f9c:	4292                	lw	t0,4(sp)
    4f9e:	c62a                	sw	a0,12(sp)
    4fa0:	00171793          	slli	a5,a4,0x1
    4fa4:	00f28333          	add	t1,t0,a5
    4fa8:	c83e                	sw	a5,16(sp)
    4faa:	c41a                	sw	t1,8(sp)
	for (i=0; i<N; i++) {
    4fac:	22050463          	beqz	a0,51d4 <core_init_matrix+0x2fe>
	B=A+N*N;
    4fb0:	44a2                	lw	s1,8(sp)
    4fb2:	4592                	lw	a1,4(sp)
    4fb4:	00151693          	slli	a3,a0,0x1
			seed = ( ( order * seed ) % 65536 );
    4fb8:	6741                	lui	a4,0x10
    4fba:	c036                	sw	a3,0(sp)
	B=A+N*N;
    4fbc:	83a6                	mv	t2,s1
    4fbe:	4401                	li	s0,0
    4fc0:	4685                	li	a3,1
    4fc2:	409582b3          	sub	t0,a1,s1
			seed = ( ( order * seed ) % 65536 );
    4fc6:	fff70313          	addi	t1,a4,-1 # ffff <__erodata+0x91c7>
    4fca:	02d60633          	mul	a2,a2,a3
    4fce:	fff50793          	addi	a5,a0,-1
    4fd2:	8b8d                	andi	a5,a5,3
    4fd4:	41f65493          	srai	s1,a2,0x1f
    4fd8:	0104d593          	srli	a1,s1,0x10
    4fdc:	00b60733          	add	a4,a2,a1
    4fe0:	01069493          	slli	s1,a3,0x10
    4fe4:	00677633          	and	a2,a4,t1
    4fe8:	8e0d                	sub	a2,a2,a1
			val = (seed + order);
    4fea:	0104d593          	srli	a1,s1,0x10
    4fee:	00c58733          	add	a4,a1,a2
    4ff2:	01071493          	slli	s1,a4,0x10
    4ff6:	0104d713          	srli	a4,s1,0x10
			val =  (val + order);
    4ffa:	00b704b3          	add	s1,a4,a1
			B[i*N+j] = val;
    4ffe:	00e39023          	sh	a4,0(t2)
			A[i*N+j] = val;
    5002:	007285b3          	add	a1,t0,t2
			val=matrix_clip(val,1);
    5006:	0ff4f713          	andi	a4,s1,255
			A[i*N+j] = val;
    500a:	00e59023          	sh	a4,0(a1)
		for (j=0; j<N; j++) {
    500e:	4585                	li	a1,1
			order++;
    5010:	0685                	addi	a3,a3,1
    5012:	00238713          	addi	a4,t2,2
		for (j=0; j<N; j++) {
    5016:	1aa5fa63          	bleu	a0,a1,51ca <core_init_matrix+0x2f4>
    501a:	c7f9                	beqz	a5,50e8 <core_init_matrix+0x212>
    501c:	08b78563          	beq	a5,a1,50a6 <core_init_matrix+0x1d0>
    5020:	4489                	li	s1,2
    5022:	04978363          	beq	a5,s1,5068 <core_init_matrix+0x192>
			seed = ( ( order * seed ) % 65536 );
    5026:	02d60633          	mul	a2,a2,a3
    502a:	41f65793          	srai	a5,a2,0x1f
    502e:	0107d593          	srli	a1,a5,0x10
    5032:	00b604b3          	add	s1,a2,a1
    5036:	01069793          	slli	a5,a3,0x10
    503a:	0064f633          	and	a2,s1,t1
    503e:	8e0d                	sub	a2,a2,a1
			val = (seed + order);
    5040:	0107d593          	srli	a1,a5,0x10
    5044:	00c584b3          	add	s1,a1,a2
    5048:	01049793          	slli	a5,s1,0x10
    504c:	0107d493          	srli	s1,a5,0x10
			val =  (val + order);
    5050:	95a6                	add	a1,a1,s1
			B[i*N+j] = val;
    5052:	00971023          	sh	s1,0(a4)
			val=matrix_clip(val,1);
    5056:	0ff5f793          	andi	a5,a1,255
			A[i*N+j] = val;
    505a:	9716                	add	a4,a4,t0
    505c:	00f71023          	sh	a5,0(a4)
			order++;
    5060:	0685                	addi	a3,a3,1
		for (j=0; j<N; j++) {
    5062:	4589                	li	a1,2
    5064:	00438713          	addi	a4,t2,4
			seed = ( ( order * seed ) % 65536 );
    5068:	02d60633          	mul	a2,a2,a3
		for (j=0; j<N; j++) {
    506c:	0585                	addi	a1,a1,1
			seed = ( ( order * seed ) % 65536 );
    506e:	41f65493          	srai	s1,a2,0x1f
    5072:	0104d793          	srli	a5,s1,0x10
    5076:	963e                	add	a2,a2,a5
    5078:	006674b3          	and	s1,a2,t1
    507c:	40f48633          	sub	a2,s1,a5
			val = (seed + order);
    5080:	01069793          	slli	a5,a3,0x10
    5084:	0107d493          	srli	s1,a5,0x10
    5088:	00c487b3          	add	a5,s1,a2
    508c:	07c2                	slli	a5,a5,0x10
    508e:	83c1                	srli	a5,a5,0x10
			B[i*N+j] = val;
    5090:	00f71023          	sh	a5,0(a4)
			val =  (val + order);
    5094:	97a6                	add	a5,a5,s1
			val=matrix_clip(val,1);
    5096:	0ff7f793          	andi	a5,a5,255
			A[i*N+j] = val;
    509a:	00e284b3          	add	s1,t0,a4
    509e:	00f49023          	sh	a5,0(s1)
			order++;
    50a2:	0685                	addi	a3,a3,1
    50a4:	0709                	addi	a4,a4,2
			seed = ( ( order * seed ) % 65536 );
    50a6:	02d60633          	mul	a2,a2,a3
		for (j=0; j<N; j++) {
    50aa:	0585                	addi	a1,a1,1
			seed = ( ( order * seed ) % 65536 );
    50ac:	41f65493          	srai	s1,a2,0x1f
    50b0:	0104d793          	srli	a5,s1,0x10
    50b4:	963e                	add	a2,a2,a5
    50b6:	006674b3          	and	s1,a2,t1
    50ba:	40f48633          	sub	a2,s1,a5
			val = (seed + order);
    50be:	01069793          	slli	a5,a3,0x10
    50c2:	0107d493          	srli	s1,a5,0x10
    50c6:	00c487b3          	add	a5,s1,a2
    50ca:	07c2                	slli	a5,a5,0x10
    50cc:	83c1                	srli	a5,a5,0x10
			B[i*N+j] = val;
    50ce:	00f71023          	sh	a5,0(a4)
			val =  (val + order);
    50d2:	97a6                	add	a5,a5,s1
			val=matrix_clip(val,1);
    50d4:	0ff7f793          	andi	a5,a5,255
			A[i*N+j] = val;
    50d8:	00e284b3          	add	s1,t0,a4
    50dc:	00f49023          	sh	a5,0(s1)
			order++;
    50e0:	0685                	addi	a3,a3,1
    50e2:	0709                	addi	a4,a4,2
		for (j=0; j<N; j++) {
    50e4:	0ea5f363          	bleu	a0,a1,51ca <core_init_matrix+0x2f4>
			seed = ( ( order * seed ) % 65536 );
    50e8:	02d60633          	mul	a2,a2,a3
		for (j=0; j<N; j++) {
    50ec:	0591                	addi	a1,a1,4
			seed = ( ( order * seed ) % 65536 );
    50ee:	41f65493          	srai	s1,a2,0x1f
    50f2:	80c1                	srli	s1,s1,0x10
    50f4:	009607b3          	add	a5,a2,s1
    50f8:	0067f633          	and	a2,a5,t1
    50fc:	409607b3          	sub	a5,a2,s1
			val = (seed + order);
    5100:	01069493          	slli	s1,a3,0x10
    5104:	80c1                	srli	s1,s1,0x10
    5106:	00f48633          	add	a2,s1,a5
    510a:	0642                	slli	a2,a2,0x10
    510c:	8241                	srli	a2,a2,0x10
			B[i*N+j] = val;
    510e:	00c71023          	sh	a2,0(a4)
			val =  (val + order);
    5112:	9626                	add	a2,a2,s1
			val=matrix_clip(val,1);
    5114:	0ff67613          	andi	a2,a2,255
			A[i*N+j] = val;
    5118:	00e284b3          	add	s1,t0,a4
    511c:	00c49023          	sh	a2,0(s1)
			order++;
    5120:	00168613          	addi	a2,a3,1
			seed = ( ( order * seed ) % 65536 );
    5124:	02c787b3          	mul	a5,a5,a2
    5128:	0642                	slli	a2,a2,0x10
    512a:	41f7d493          	srai	s1,a5,0x1f
    512e:	80c1                	srli	s1,s1,0x10
    5130:	97a6                	add	a5,a5,s1
    5132:	0067f7b3          	and	a5,a5,t1
    5136:	8f85                	sub	a5,a5,s1
			val = (seed + order);
    5138:	01065493          	srli	s1,a2,0x10
    513c:	00f48633          	add	a2,s1,a5
    5140:	0642                	slli	a2,a2,0x10
    5142:	8241                	srli	a2,a2,0x10
			B[i*N+j] = val;
    5144:	00c71123          	sh	a2,2(a4)
			val =  (val + order);
    5148:	9626                	add	a2,a2,s1
			val=matrix_clip(val,1);
    514a:	0ff67613          	andi	a2,a2,255
			A[i*N+j] = val;
    514e:	005704b3          	add	s1,a4,t0
    5152:	00c49123          	sh	a2,2(s1)
			order++;
    5156:	00268613          	addi	a2,a3,2
			seed = ( ( order * seed ) % 65536 );
    515a:	02c787b3          	mul	a5,a5,a2
    515e:	0642                	slli	a2,a2,0x10
    5160:	41f7d493          	srai	s1,a5,0x1f
    5164:	80c1                	srli	s1,s1,0x10
    5166:	97a6                	add	a5,a5,s1
    5168:	0067f7b3          	and	a5,a5,t1
    516c:	8f85                	sub	a5,a5,s1
			val = (seed + order);
    516e:	01065493          	srli	s1,a2,0x10
    5172:	00f48633          	add	a2,s1,a5
    5176:	0642                	slli	a2,a2,0x10
    5178:	8241                	srli	a2,a2,0x10
			B[i*N+j] = val;
    517a:	00c71223          	sh	a2,4(a4)
			val =  (val + order);
    517e:	9626                	add	a2,a2,s1
			val=matrix_clip(val,1);
    5180:	0ff67613          	andi	a2,a2,255
			A[i*N+j] = val;
    5184:	005704b3          	add	s1,a4,t0
    5188:	00c49223          	sh	a2,4(s1)
			order++;
    518c:	00368493          	addi	s1,a3,3
			seed = ( ( order * seed ) % 65536 );
    5190:	029787b3          	mul	a5,a5,s1
    5194:	04c2                	slli	s1,s1,0x10
    5196:	80c1                	srli	s1,s1,0x10
			order++;
    5198:	0691                	addi	a3,a3,4
			seed = ( ( order * seed ) % 65536 );
    519a:	41f7d613          	srai	a2,a5,0x1f
    519e:	8241                	srli	a2,a2,0x10
    51a0:	97b2                	add	a5,a5,a2
    51a2:	0067f7b3          	and	a5,a5,t1
    51a6:	40c78633          	sub	a2,a5,a2
			val = (seed + order);
    51aa:	00c487b3          	add	a5,s1,a2
    51ae:	07c2                	slli	a5,a5,0x10
    51b0:	83c1                	srli	a5,a5,0x10
			B[i*N+j] = val;
    51b2:	00f71323          	sh	a5,6(a4)
			val =  (val + order);
    51b6:	97a6                	add	a5,a5,s1
			val=matrix_clip(val,1);
    51b8:	0ff7f793          	andi	a5,a5,255
			A[i*N+j] = val;
    51bc:	005704b3          	add	s1,a4,t0
    51c0:	00f49323          	sh	a5,6(s1)
			order++;
    51c4:	0721                	addi	a4,a4,8
		for (j=0; j<N; j++) {
    51c6:	f2a5e1e3          	bltu	a1,a0,50e8 <core_init_matrix+0x212>
    51ca:	4582                	lw	a1,0(sp)
	for (i=0; i<N; i++) {
    51cc:	0405                	addi	s0,s0,1
    51ce:	93ae                	add	t2,t2,a1
    51d0:	dea46de3          	bltu	s0,a0,4fca <core_init_matrix+0xf4>
	p->B=B;
    51d4:	42a2                	lw	t0,8(sp)
	p->C=(MATRES *)align_mem(B+N*N);
    51d6:	4342                	lw	t1,16(sp)
	p->A=A;
    51d8:	43d2                	lw	t2,20(sp)
    51da:	4412                	lw	s0,4(sp)
	p->C=(MATRES *)align_mem(B+N*N);
    51dc:	006286b3          	add	a3,t0,t1
	p->N=N;
    51e0:	47b2                	lw	a5,12(sp)
	p->C=(MATRES *)align_mem(B+N*N);
    51e2:	fff68713          	addi	a4,a3,-1
	p->A=A;
    51e6:	0083a223          	sw	s0,4(t2)
	p->C=(MATRES *)align_mem(B+N*N);
    51ea:	ffc77613          	andi	a2,a4,-4
}
    51ee:	4472                	lw	s0,28(sp)
	p->C=(MATRES *)align_mem(B+N*N);
    51f0:	00460493          	addi	s1,a2,4
    51f4:	0093a623          	sw	s1,12(t2)
	p->B=B;
    51f8:	0053a423          	sw	t0,8(t2)
	p->N=N;
    51fc:	00f3a023          	sw	a5,0(t2)
}
    5200:	44e2                	lw	s1,24(sp)
    5202:	6105                	addi	sp,sp,32
    5204:	8082                	ret
	B=A+N*N;
    5206:	00628313          	addi	t1,t0,6
    520a:	53fd                	li	t2,-1
    520c:	4409                	li	s0,2
    520e:	c41a                	sw	t1,8(sp)
    5210:	c61e                	sw	t2,12(sp)
	N=i-1;
    5212:	557d                	li	a0,-1
	B=A+N*N;
    5214:	c822                	sw	s0,16(sp)
    5216:	bb69                	j	4fb0 <core_init_matrix+0xda>

00005218 <get_seed_32>:
	extern volatile ee_s32 seed3_volatile;
	extern volatile ee_s32 seed4_volatile;
	extern volatile ee_s32 seed5_volatile;
	ee_s32 get_seed_32(int i) {
		ee_s32 retval;
		switch (i) {
    5218:	4795                	li	a5,5
    521a:	04a7e463          	bltu	a5,a0,5262 <get_seed_32+0x4a>
    521e:	629d                	lui	t0,0x7
    5220:	050a                	slli	a0,a0,0x2
    5222:	e2028313          	addi	t1,t0,-480 # 6e20 <scipat+0x4d8>
    5226:	006503b3          	add	t2,a0,t1
    522a:	0003a583          	lw	a1,0(t2)
    522e:	8582                	jr	a1
				break;
			case 4:
				retval=seed4_volatile;
				break;
			case 5:
				retval=seed5_volatile;
    5230:	20000637          	lui	a2,0x20000
    5234:	01c62503          	lw	a0,28(a2) # 2000001c <seed5_volatile>
				break;
    5238:	8082                	ret
				retval=seed1_volatile;
    523a:	20000537          	lui	a0,0x20000
    523e:	01452503          	lw	a0,20(a0) # 20000014 <seed1_volatile>
				break;
    5242:	8082                	ret
				retval=seed2_volatile;
    5244:	200007b7          	lui	a5,0x20000
    5248:	0187a503          	lw	a0,24(a5) # 20000018 <seed2_volatile>
				break;
    524c:	8082                	ret
				retval=seed3_volatile;
    524e:	20000737          	lui	a4,0x20000
    5252:	00872503          	lw	a0,8(a4) # 20000008 <seed3_volatile>
				break;
    5256:	8082                	ret
				retval=seed4_volatile;
    5258:	200006b7          	lui	a3,0x20000
    525c:	00c6a503          	lw	a0,12(a3) # 2000000c <seed4_volatile>
				break;
    5260:	8082                	ret
			default:
				retval=0;
    5262:	4501                	li	a0,0
				break;
		}
		return retval;
	}
    5264:	8082                	ret

00005266 <crcu16>:
		   crc &= 0x7fff;
    }
	return crc;
}
ee_u16 crcu16(ee_u16 newval, ee_u16 crc) {
	crc=crcu8( (ee_u8) (newval)				,crc);
    5266:	0015d693          	srli	a3,a1,0x1
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    526a:	8da9                	xor	a1,a1,a0
	crc=crcu8( (ee_u8) (newval)				,crc);
    526c:	0ff57793          	andi	a5,a0,255
		if (x16 == 1)
    5270:	0015f293          	andi	t0,a1,1
		data >>= 1;
    5274:	0017d713          	srli	a4,a5,0x1
		if (x16 == 1)
    5278:	00028b63          	beqz	t0,528e <crcu16+0x28>
		   crc |= 0x8000;
    527c:	7669                	lui	a2,0xffffa
    527e:	00160313          	addi	t1,a2,1 # ffffa001 <__heap_end+0xdff7a001>
    5282:	0066c6b3          	xor	a3,a3,t1
    5286:	01069393          	slli	t2,a3,0x10
    528a:	0103d693          	srli	a3,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    528e:	8f35                	xor	a4,a4,a3
		if (x16 == 1)
    5290:	00177293          	andi	t0,a4,1
		data >>= 1;
    5294:	0027d593          	srli	a1,a5,0x2
		if (x16 == 1)
    5298:	0016d613          	srli	a2,a3,0x1
    529c:	00028b63          	beqz	t0,52b2 <crcu16+0x4c>
		   crc |= 0x8000;
    52a0:	7369                	lui	t1,0xffffa
    52a2:	00130393          	addi	t2,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    52a6:	00764633          	xor	a2,a2,t2
    52aa:	01061693          	slli	a3,a2,0x10
    52ae:	0106d613          	srli	a2,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    52b2:	8db1                	xor	a1,a1,a2
		if (x16 == 1)
    52b4:	0015f313          	andi	t1,a1,1
		data >>= 1;
    52b8:	0037d293          	srli	t0,a5,0x3
		if (x16 == 1)
    52bc:	00165713          	srli	a4,a2,0x1
    52c0:	00030a63          	beqz	t1,52d4 <crcu16+0x6e>
		   crc |= 0x8000;
    52c4:	73e9                	lui	t2,0xffffa
    52c6:	00138693          	addi	a3,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    52ca:	8f35                	xor	a4,a4,a3
    52cc:	01071613          	slli	a2,a4,0x10
    52d0:	01065713          	srli	a4,a2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    52d4:	005742b3          	xor	t0,a4,t0
		if (x16 == 1)
    52d8:	0012f313          	andi	t1,t0,1
		data >>= 1;
    52dc:	0047d593          	srli	a1,a5,0x4
		if (x16 == 1)
    52e0:	00175693          	srli	a3,a4,0x1
    52e4:	00030a63          	beqz	t1,52f8 <crcu16+0x92>
		   crc |= 0x8000;
    52e8:	73e9                	lui	t2,0xffffa
    52ea:	00138613          	addi	a2,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    52ee:	8eb1                	xor	a3,a3,a2
    52f0:	01069713          	slli	a4,a3,0x10
    52f4:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    52f8:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    52fa:	0015f313          	andi	t1,a1,1
		data >>= 1;
    52fe:	0057d293          	srli	t0,a5,0x5
		if (x16 == 1)
    5302:	0016d713          	srli	a4,a3,0x1
    5306:	00030a63          	beqz	t1,531a <crcu16+0xb4>
		   crc |= 0x8000;
    530a:	73e9                	lui	t2,0xffffa
    530c:	00138613          	addi	a2,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5310:	8f31                	xor	a4,a4,a2
    5312:	01071693          	slli	a3,a4,0x10
    5316:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    531a:	005742b3          	xor	t0,a4,t0
		if (x16 == 1)
    531e:	0012f313          	andi	t1,t0,1
		data >>= 1;
    5322:	0067d593          	srli	a1,a5,0x6
		if (x16 == 1)
    5326:	00175693          	srli	a3,a4,0x1
    532a:	00030a63          	beqz	t1,533e <crcu16+0xd8>
		   crc |= 0x8000;
    532e:	73e9                	lui	t2,0xffffa
    5330:	00138613          	addi	a2,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5334:	8eb1                	xor	a3,a3,a2
    5336:	01069713          	slli	a4,a3,0x10
    533a:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    533e:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    5340:	0015f293          	andi	t0,a1,1
		data >>= 1;
    5344:	839d                	srli	a5,a5,0x7
		if (x16 == 1)
    5346:	0016d613          	srli	a2,a3,0x1
    534a:	00028b63          	beqz	t0,5360 <crcu16+0xfa>
		   crc |= 0x8000;
    534e:	7369                	lui	t1,0xffffa
    5350:	00130393          	addi	t2,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    5354:	00764633          	xor	a2,a2,t2
    5358:	01061713          	slli	a4,a2,0x10
    535c:	01075613          	srli	a2,a4,0x10
		if (x16 == 1)
    5360:	00167693          	andi	a3,a2,1
    5364:	00165393          	srli	t2,a2,0x1
    5368:	00f68b63          	beq	a3,a5,537e <crcu16+0x118>
		   crc |= 0x8000;
    536c:	77e9                	lui	a5,0xffffa
    536e:	00178593          	addi	a1,a5,1 # ffffa001 <__heap_end+0xdff7a001>
    5372:	00b3c2b3          	xor	t0,t2,a1
    5376:	01029313          	slli	t1,t0,0x10
    537a:	01035393          	srli	t2,t1,0x10
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    537e:	8121                	srli	a0,a0,0x8
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5380:	00a3c733          	xor	a4,t2,a0
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    5384:	0ff57793          	andi	a5,a0,255
		if (x16 == 1)
    5388:	00177593          	andi	a1,a4,1
		data >>= 1;
    538c:	0017d693          	srli	a3,a5,0x1
		if (x16 == 1)
    5390:	0013d613          	srli	a2,t2,0x1
    5394:	c991                	beqz	a1,53a8 <crcu16+0x142>
		   crc |= 0x8000;
    5396:	72e9                	lui	t0,0xffffa
    5398:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    539c:	00664633          	xor	a2,a2,t1
    53a0:	01061393          	slli	t2,a2,0x10
    53a4:	0103d613          	srli	a2,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    53a8:	8eb1                	xor	a3,a3,a2
		if (x16 == 1)
    53aa:	0016f593          	andi	a1,a3,1
		data >>= 1;
    53ae:	0027d513          	srli	a0,a5,0x2
		if (x16 == 1)
    53b2:	00165713          	srli	a4,a2,0x1
    53b6:	c991                	beqz	a1,53ca <crcu16+0x164>
		   crc |= 0x8000;
    53b8:	72e9                	lui	t0,0xffffa
    53ba:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    53be:	00674733          	xor	a4,a4,t1
    53c2:	01071393          	slli	t2,a4,0x10
    53c6:	0103d713          	srli	a4,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    53ca:	00a74633          	xor	a2,a4,a0
		if (x16 == 1)
    53ce:	00167513          	andi	a0,a2,1
		data >>= 1;
    53d2:	0037d593          	srli	a1,a5,0x3
		if (x16 == 1)
    53d6:	00175693          	srli	a3,a4,0x1
    53da:	c911                	beqz	a0,53ee <crcu16+0x188>
		   crc |= 0x8000;
    53dc:	72e9                	lui	t0,0xffffa
    53de:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    53e2:	0066c6b3          	xor	a3,a3,t1
    53e6:	01069393          	slli	t2,a3,0x10
    53ea:	0103d693          	srli	a3,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    53ee:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    53f0:	0015f513          	andi	a0,a1,1
		data >>= 1;
    53f4:	0047d613          	srli	a2,a5,0x4
		if (x16 == 1)
    53f8:	0016d713          	srli	a4,a3,0x1
    53fc:	c911                	beqz	a0,5410 <crcu16+0x1aa>
		   crc |= 0x8000;
    53fe:	72e9                	lui	t0,0xffffa
    5400:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    5404:	00674733          	xor	a4,a4,t1
    5408:	01071393          	slli	t2,a4,0x10
    540c:	0103d713          	srli	a4,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5410:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    5412:	00167513          	andi	a0,a2,1
		data >>= 1;
    5416:	0057d593          	srli	a1,a5,0x5
		if (x16 == 1)
    541a:	00175693          	srli	a3,a4,0x1
    541e:	c911                	beqz	a0,5432 <crcu16+0x1cc>
		   crc |= 0x8000;
    5420:	72e9                	lui	t0,0xffffa
    5422:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    5426:	0066c6b3          	xor	a3,a3,t1
    542a:	01069393          	slli	t2,a3,0x10
    542e:	0103d693          	srli	a3,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5432:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    5434:	0015f513          	andi	a0,a1,1
		data >>= 1;
    5438:	0067d613          	srli	a2,a5,0x6
		if (x16 == 1)
    543c:	0016d713          	srli	a4,a3,0x1
    5440:	c911                	beqz	a0,5454 <crcu16+0x1ee>
		   crc |= 0x8000;
    5442:	72e9                	lui	t0,0xffffa
    5444:	00128313          	addi	t1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    5448:	00674733          	xor	a4,a4,t1
    544c:	01071393          	slli	t2,a4,0x10
    5450:	0103d713          	srli	a4,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5454:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    5456:	00167593          	andi	a1,a2,1
		data >>= 1;
    545a:	839d                	srli	a5,a5,0x7
		if (x16 == 1)
    545c:	00175393          	srli	t2,a4,0x1
    5460:	c991                	beqz	a1,5474 <crcu16+0x20e>
		   crc |= 0x8000;
    5462:	7569                	lui	a0,0xffffa
    5464:	00150293          	addi	t0,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    5468:	0053c6b3          	xor	a3,t2,t0
    546c:	01069313          	slli	t1,a3,0x10
    5470:	01035393          	srli	t2,t1,0x10
		if (x16 == 1)
    5474:	0013f713          	andi	a4,t2,1
    5478:	0013d513          	srli	a0,t2,0x1
    547c:	00f70a63          	beq	a4,a5,5490 <crcu16+0x22a>
		   crc |= 0x8000;
    5480:	77e9                	lui	a5,0xffffa
    5482:	00178613          	addi	a2,a5,1 # ffffa001 <__heap_end+0xdff7a001>
    5486:	00c545b3          	xor	a1,a0,a2
    548a:	01059513          	slli	a0,a1,0x10
    548e:	8141                	srli	a0,a0,0x10
	return crc;
}
    5490:	8082                	ret

00005492 <crcu32>:
	crc=crc16((ee_s16) newval		,crc);
	crc=crc16((ee_s16) (newval>>16)	,crc);
	return crc;
}
ee_u16 crc16(ee_s16 newval, ee_u16 crc) {
	return crcu16((ee_u16)newval, crc);
    5492:	0015d713          	srli	a4,a1,0x1
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5496:	8da9                	xor	a1,a1,a0
	return crcu16((ee_u16)newval, crc);
    5498:	01051313          	slli	t1,a0,0x10
	crc=crcu8( (ee_u8) (newval)				,crc);
    549c:	0ff57793          	andi	a5,a0,255
		if (x16 == 1)
    54a0:	0015f393          	andi	t2,a1,1
	return crcu16((ee_u16)newval, crc);
    54a4:	01035293          	srli	t0,t1,0x10
		data >>= 1;
    54a8:	0017d613          	srli	a2,a5,0x1
		if (x16 == 1)
    54ac:	00038b63          	beqz	t2,54c2 <crcu32+0x30>
		   crc |= 0x8000;
    54b0:	76e9                	lui	a3,0xffffa
    54b2:	00168313          	addi	t1,a3,1 # ffffa001 <__heap_end+0xdff7a001>
    54b6:	00674733          	xor	a4,a4,t1
    54ba:	01071593          	slli	a1,a4,0x10
    54be:	0105d713          	srli	a4,a1,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    54c2:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    54c4:	00167313          	andi	t1,a2,1
		data >>= 1;
    54c8:	0027d393          	srli	t2,a5,0x2
		if (x16 == 1)
    54cc:	00175693          	srli	a3,a4,0x1
    54d0:	00030a63          	beqz	t1,54e4 <crcu32+0x52>
		   crc |= 0x8000;
    54d4:	75e9                	lui	a1,0xffffa
    54d6:	00158713          	addi	a4,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    54da:	8eb9                	xor	a3,a3,a4
    54dc:	01069613          	slli	a2,a3,0x10
    54e0:	01065693          	srli	a3,a2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    54e4:	0076c3b3          	xor	t2,a3,t2
		if (x16 == 1)
    54e8:	0013f593          	andi	a1,t2,1
		data >>= 1;
    54ec:	0037d313          	srli	t1,a5,0x3
		if (x16 == 1)
    54f0:	0016d713          	srli	a4,a3,0x1
    54f4:	c989                	beqz	a1,5506 <crcu32+0x74>
		   crc |= 0x8000;
    54f6:	7669                	lui	a2,0xffffa
    54f8:	00160693          	addi	a3,a2,1 # ffffa001 <__heap_end+0xdff7a001>
    54fc:	8f35                	xor	a4,a4,a3
    54fe:	01071393          	slli	t2,a4,0x10
    5502:	0103d713          	srli	a4,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5506:	00674333          	xor	t1,a4,t1
		if (x16 == 1)
    550a:	00137613          	andi	a2,t1,1
		data >>= 1;
    550e:	0047d593          	srli	a1,a5,0x4
		if (x16 == 1)
    5512:	00175693          	srli	a3,a4,0x1
    5516:	ca09                	beqz	a2,5528 <crcu32+0x96>
		   crc |= 0x8000;
    5518:	73e9                	lui	t2,0xffffa
    551a:	00138713          	addi	a4,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    551e:	8eb9                	xor	a3,a3,a4
    5520:	01069313          	slli	t1,a3,0x10
    5524:	01035693          	srli	a3,t1,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5528:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    552a:	0015f713          	andi	a4,a1,1
		data >>= 1;
    552e:	0057d393          	srli	t2,a5,0x5
		if (x16 == 1)
    5532:	0016d613          	srli	a2,a3,0x1
    5536:	cb09                	beqz	a4,5548 <crcu32+0xb6>
		   crc |= 0x8000;
    5538:	7369                	lui	t1,0xffffa
    553a:	00130693          	addi	a3,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    553e:	8e35                	xor	a2,a2,a3
    5540:	01061593          	slli	a1,a2,0x10
    5544:	0105d613          	srli	a2,a1,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5548:	007643b3          	xor	t2,a2,t2
		if (x16 == 1)
    554c:	0013f713          	andi	a4,t2,1
		data >>= 1;
    5550:	0067d313          	srli	t1,a5,0x6
		if (x16 == 1)
    5554:	00165693          	srli	a3,a2,0x1
    5558:	cb09                	beqz	a4,556a <crcu32+0xd8>
		   crc |= 0x8000;
    555a:	75e9                	lui	a1,0xffffa
    555c:	00158613          	addi	a2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5560:	8eb1                	xor	a3,a3,a2
    5562:	01069393          	slli	t2,a3,0x10
    5566:	0103d693          	srli	a3,t2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    556a:	0066c333          	xor	t1,a3,t1
		if (x16 == 1)
    556e:	00137713          	andi	a4,t1,1
		data >>= 1;
    5572:	839d                	srli	a5,a5,0x7
		if (x16 == 1)
    5574:	0016d613          	srli	a2,a3,0x1
    5578:	cb11                	beqz	a4,558c <crcu32+0xfa>
		   crc |= 0x8000;
    557a:	75e9                	lui	a1,0xffffa
    557c:	00158393          	addi	t2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5580:	00764633          	xor	a2,a2,t2
    5584:	01061693          	slli	a3,a2,0x10
    5588:	0106d613          	srli	a2,a3,0x10
		if (x16 == 1)
    558c:	00167313          	andi	t1,a2,1
    5590:	00165713          	srli	a4,a2,0x1
    5594:	00f30a63          	beq	t1,a5,55a8 <crcu32+0x116>
		   crc |= 0x8000;
    5598:	77e9                	lui	a5,0xffffa
    559a:	00178593          	addi	a1,a5,1 # ffffa001 <__heap_end+0xdff7a001>
    559e:	8f2d                	xor	a4,a4,a1
    55a0:	01071393          	slli	t2,a4,0x10
    55a4:	0103d713          	srli	a4,t2,0x10
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    55a8:	0082d293          	srli	t0,t0,0x8
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    55ac:	00574633          	xor	a2,a4,t0
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    55b0:	0ff2f313          	andi	t1,t0,255
		if (x16 == 1)
    55b4:	00167593          	andi	a1,a2,1
		data >>= 1;
    55b8:	00135793          	srli	a5,t1,0x1
		if (x16 == 1)
    55bc:	00175693          	srli	a3,a4,0x1
    55c0:	c989                	beqz	a1,55d2 <crcu32+0x140>
		   crc |= 0x8000;
    55c2:	73e9                	lui	t2,0xffffa
    55c4:	00138713          	addi	a4,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    55c8:	8eb9                	xor	a3,a3,a4
    55ca:	01069293          	slli	t0,a3,0x10
    55ce:	0102d693          	srli	a3,t0,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    55d2:	8fb5                	xor	a5,a5,a3
		if (x16 == 1)
    55d4:	0017f593          	andi	a1,a5,1
		data >>= 1;
    55d8:	00235613          	srli	a2,t1,0x2
		if (x16 == 1)
    55dc:	0016d713          	srli	a4,a3,0x1
    55e0:	c991                	beqz	a1,55f4 <crcu32+0x162>
		   crc |= 0x8000;
    55e2:	73e9                	lui	t2,0xffffa
    55e4:	00138293          	addi	t0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    55e8:	00574733          	xor	a4,a4,t0
    55ec:	01071693          	slli	a3,a4,0x10
    55f0:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    55f4:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    55f6:	00167593          	andi	a1,a2,1
		data >>= 1;
    55fa:	00335793          	srli	a5,t1,0x3
		if (x16 == 1)
    55fe:	00175693          	srli	a3,a4,0x1
    5602:	c991                	beqz	a1,5616 <crcu32+0x184>
		   crc |= 0x8000;
    5604:	73e9                	lui	t2,0xffffa
    5606:	00138293          	addi	t0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    560a:	0056c6b3          	xor	a3,a3,t0
    560e:	01069713          	slli	a4,a3,0x10
    5612:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5616:	8fb5                	xor	a5,a5,a3
		if (x16 == 1)
    5618:	0017f593          	andi	a1,a5,1
		data >>= 1;
    561c:	00435613          	srli	a2,t1,0x4
		if (x16 == 1)
    5620:	0016d713          	srli	a4,a3,0x1
    5624:	c991                	beqz	a1,5638 <crcu32+0x1a6>
		   crc |= 0x8000;
    5626:	73e9                	lui	t2,0xffffa
    5628:	00138293          	addi	t0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    562c:	00574733          	xor	a4,a4,t0
    5630:	01071693          	slli	a3,a4,0x10
    5634:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5638:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    563a:	00167593          	andi	a1,a2,1
		data >>= 1;
    563e:	00535793          	srli	a5,t1,0x5
		if (x16 == 1)
    5642:	00175693          	srli	a3,a4,0x1
    5646:	c991                	beqz	a1,565a <crcu32+0x1c8>
		   crc |= 0x8000;
    5648:	73e9                	lui	t2,0xffffa
    564a:	00138293          	addi	t0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    564e:	0056c6b3          	xor	a3,a3,t0
    5652:	01069713          	slli	a4,a3,0x10
    5656:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    565a:	8fb5                	xor	a5,a5,a3
		if (x16 == 1)
    565c:	0017f593          	andi	a1,a5,1
		data >>= 1;
    5660:	00635613          	srli	a2,t1,0x6
		if (x16 == 1)
    5664:	0016d713          	srli	a4,a3,0x1
    5668:	c991                	beqz	a1,567c <crcu32+0x1ea>
		   crc |= 0x8000;
    566a:	73e9                	lui	t2,0xffffa
    566c:	00138293          	addi	t0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5670:	00574733          	xor	a4,a4,t0
    5674:	01071693          	slli	a3,a4,0x10
    5678:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    567c:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    567e:	00167793          	andi	a5,a2,1
		data >>= 1;
    5682:	00735313          	srli	t1,t1,0x7
		if (x16 == 1)
    5686:	00175293          	srli	t0,a4,0x1
    568a:	cb91                	beqz	a5,569e <crcu32+0x20c>
		   crc |= 0x8000;
    568c:	75e9                	lui	a1,0xffffa
    568e:	00158393          	addi	t2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5692:	0072c2b3          	xor	t0,t0,t2
    5696:	01029693          	slli	a3,t0,0x10
    569a:	0106d293          	srli	t0,a3,0x10
		if (x16 == 1)
    569e:	0012f613          	andi	a2,t0,1
    56a2:	0012d393          	srli	t2,t0,0x1
    56a6:	00660b63          	beq	a2,t1,56bc <crcu32+0x22a>
		   crc |= 0x8000;
    56aa:	7369                	lui	t1,0xffffa
    56ac:	00130793          	addi	a5,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    56b0:	00f3c733          	xor	a4,t2,a5
    56b4:	01071593          	slli	a1,a4,0x10
    56b8:	0105d393          	srli	t2,a1,0x10
	crc=crc16((ee_s16) (newval>>16)	,crc);
    56bc:	8141                	srli	a0,a0,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    56be:	00a3c7b3          	xor	a5,t2,a0
	return crcu16((ee_u16)newval, crc);
    56c2:	01051693          	slli	a3,a0,0x10
	crc=crcu8( (ee_u8) (newval)				,crc);
    56c6:	0ff57313          	andi	t1,a0,255
		if (x16 == 1)
    56ca:	0017f713          	andi	a4,a5,1
	return crcu16((ee_u16)newval, crc);
    56ce:	0106d293          	srli	t0,a3,0x10
		data >>= 1;
    56d2:	00135613          	srli	a2,t1,0x1
		if (x16 == 1)
    56d6:	0013d693          	srli	a3,t2,0x1
    56da:	cb09                	beqz	a4,56ec <crcu32+0x25a>
		   crc |= 0x8000;
    56dc:	75e9                	lui	a1,0xffffa
    56de:	00158393          	addi	t2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    56e2:	0076c533          	xor	a0,a3,t2
    56e6:	01051693          	slli	a3,a0,0x10
    56ea:	82c1                	srli	a3,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    56ec:	8e35                	xor	a2,a2,a3
		if (x16 == 1)
    56ee:	00167593          	andi	a1,a2,1
		data >>= 1;
    56f2:	00235793          	srli	a5,t1,0x2
		if (x16 == 1)
    56f6:	0016d713          	srli	a4,a3,0x1
    56fa:	c989                	beqz	a1,570c <crcu32+0x27a>
		   crc |= 0x8000;
    56fc:	73e9                	lui	t2,0xffffa
    56fe:	00138513          	addi	a0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5702:	8f29                	xor	a4,a4,a0
    5704:	01071693          	slli	a3,a4,0x10
    5708:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    570c:	8fb9                	xor	a5,a5,a4
		if (x16 == 1)
    570e:	0017f593          	andi	a1,a5,1
		data >>= 1;
    5712:	00335613          	srli	a2,t1,0x3
		if (x16 == 1)
    5716:	00175693          	srli	a3,a4,0x1
    571a:	c989                	beqz	a1,572c <crcu32+0x29a>
		   crc |= 0x8000;
    571c:	73e9                	lui	t2,0xffffa
    571e:	00138513          	addi	a0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5722:	8ea9                	xor	a3,a3,a0
    5724:	01069713          	slli	a4,a3,0x10
    5728:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    572c:	8e35                	xor	a2,a2,a3
		if (x16 == 1)
    572e:	00167593          	andi	a1,a2,1
		data >>= 1;
    5732:	00435793          	srli	a5,t1,0x4
		if (x16 == 1)
    5736:	0016d713          	srli	a4,a3,0x1
    573a:	c989                	beqz	a1,574c <crcu32+0x2ba>
		   crc |= 0x8000;
    573c:	73e9                	lui	t2,0xffffa
    573e:	00138513          	addi	a0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5742:	8f29                	xor	a4,a4,a0
    5744:	01071693          	slli	a3,a4,0x10
    5748:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    574c:	8fb9                	xor	a5,a5,a4
		if (x16 == 1)
    574e:	0017f393          	andi	t2,a5,1
		data >>= 1;
    5752:	00535593          	srli	a1,t1,0x5
		if (x16 == 1)
    5756:	00175613          	srli	a2,a4,0x1
    575a:	00038a63          	beqz	t2,576e <crcu32+0x2dc>
		   crc |= 0x8000;
    575e:	7569                	lui	a0,0xffffa
    5760:	00150693          	addi	a3,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    5764:	8e35                	xor	a2,a2,a3
    5766:	01061713          	slli	a4,a2,0x10
    576a:	01075613          	srli	a2,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    576e:	8db1                	xor	a1,a1,a2
		if (x16 == 1)
    5770:	0015f793          	andi	a5,a1,1
		data >>= 1;
    5774:	00635393          	srli	t2,t1,0x6
		if (x16 == 1)
    5778:	00165713          	srli	a4,a2,0x1
    577c:	cb89                	beqz	a5,578e <crcu32+0x2fc>
		   crc |= 0x8000;
    577e:	7569                	lui	a0,0xffffa
    5780:	00150693          	addi	a3,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    5784:	8f35                	xor	a4,a4,a3
    5786:	01071613          	slli	a2,a4,0x10
    578a:	01065713          	srli	a4,a2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    578e:	007743b3          	xor	t2,a4,t2
		if (x16 == 1)
    5792:	0013f593          	andi	a1,t2,1
		data >>= 1;
    5796:	00735313          	srli	t1,t1,0x7
		if (x16 == 1)
    579a:	00175613          	srli	a2,a4,0x1
    579e:	c989                	beqz	a1,57b0 <crcu32+0x31e>
		   crc |= 0x8000;
    57a0:	77e9                	lui	a5,0xffffa
    57a2:	00178513          	addi	a0,a5,1 # ffffa001 <__heap_end+0xdff7a001>
    57a6:	00a646b3          	xor	a3,a2,a0
    57aa:	01069613          	slli	a2,a3,0x10
    57ae:	8241                	srli	a2,a2,0x10
		if (x16 == 1)
    57b0:	00167713          	andi	a4,a2,1
    57b4:	00165693          	srli	a3,a2,0x1
    57b8:	00670b63          	beq	a4,t1,57ce <crcu32+0x33c>
		   crc |= 0x8000;
    57bc:	7369                	lui	t1,0xffffa
    57be:	00130393          	addi	t2,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    57c2:	0076c5b3          	xor	a1,a3,t2
    57c6:	01059793          	slli	a5,a1,0x10
    57ca:	0107d693          	srli	a3,a5,0x10
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    57ce:	0082d293          	srli	t0,t0,0x8
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    57d2:	0056c633          	xor	a2,a3,t0
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    57d6:	0ff2f313          	andi	t1,t0,255
		if (x16 == 1)
    57da:	00167393          	andi	t2,a2,1
		data >>= 1;
    57de:	00135513          	srli	a0,t1,0x1
		if (x16 == 1)
    57e2:	0016d713          	srli	a4,a3,0x1
    57e6:	00038a63          	beqz	t2,57fa <crcu32+0x368>
		   crc |= 0x8000;
    57ea:	75e9                	lui	a1,0xffffa
    57ec:	00158793          	addi	a5,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    57f0:	8f3d                	xor	a4,a4,a5
    57f2:	01071693          	slli	a3,a4,0x10
    57f6:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    57fa:	8d39                	xor	a0,a0,a4
		if (x16 == 1)
    57fc:	00157393          	andi	t2,a0,1
		data >>= 1;
    5800:	00235293          	srli	t0,t1,0x2
		if (x16 == 1)
    5804:	00175613          	srli	a2,a4,0x1
    5808:	00038a63          	beqz	t2,581c <crcu32+0x38a>
		   crc |= 0x8000;
    580c:	75e9                	lui	a1,0xffffa
    580e:	00158793          	addi	a5,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5812:	8e3d                	xor	a2,a2,a5
    5814:	01061693          	slli	a3,a2,0x10
    5818:	0106d613          	srli	a2,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    581c:	00c2c2b3          	xor	t0,t0,a2
		if (x16 == 1)
    5820:	0012f513          	andi	a0,t0,1
		data >>= 1;
    5824:	00335713          	srli	a4,t1,0x3
		if (x16 == 1)
    5828:	00165593          	srli	a1,a2,0x1
    582c:	c909                	beqz	a0,583e <crcu32+0x3ac>
		   crc |= 0x8000;
    582e:	73e9                	lui	t2,0xffffa
    5830:	00138793          	addi	a5,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5834:	8dbd                	xor	a1,a1,a5
    5836:	01059693          	slli	a3,a1,0x10
    583a:	0106d593          	srli	a1,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    583e:	8f2d                	xor	a4,a4,a1
		if (x16 == 1)
    5840:	00177513          	andi	a0,a4,1
		data >>= 1;
    5844:	00435293          	srli	t0,t1,0x4
		if (x16 == 1)
    5848:	0015d613          	srli	a2,a1,0x1
    584c:	c909                	beqz	a0,585e <crcu32+0x3cc>
		   crc |= 0x8000;
    584e:	73e9                	lui	t2,0xffffa
    5850:	00138793          	addi	a5,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5854:	8e3d                	xor	a2,a2,a5
    5856:	01061693          	slli	a3,a2,0x10
    585a:	0106d613          	srli	a2,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    585e:	00c2c2b3          	xor	t0,t0,a2
		if (x16 == 1)
    5862:	0012f513          	andi	a0,t0,1
		data >>= 1;
    5866:	00535713          	srli	a4,t1,0x5
		if (x16 == 1)
    586a:	00165593          	srli	a1,a2,0x1
    586e:	c909                	beqz	a0,5880 <crcu32+0x3ee>
		   crc |= 0x8000;
    5870:	73e9                	lui	t2,0xffffa
    5872:	00138793          	addi	a5,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5876:	8dbd                	xor	a1,a1,a5
    5878:	01059693          	slli	a3,a1,0x10
    587c:	0106d593          	srli	a1,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5880:	8f2d                	xor	a4,a4,a1
		if (x16 == 1)
    5882:	00177513          	andi	a0,a4,1
		data >>= 1;
    5886:	00635293          	srli	t0,t1,0x6
		if (x16 == 1)
    588a:	0015d613          	srli	a2,a1,0x1
    588e:	c909                	beqz	a0,58a0 <crcu32+0x40e>
		   crc |= 0x8000;
    5890:	73e9                	lui	t2,0xffffa
    5892:	00138793          	addi	a5,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5896:	8e3d                	xor	a2,a2,a5
    5898:	01061693          	slli	a3,a2,0x10
    589c:	0106d613          	srli	a2,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    58a0:	00c2c5b3          	xor	a1,t0,a2
		if (x16 == 1)
    58a4:	0015f293          	andi	t0,a1,1
		data >>= 1;
    58a8:	00735313          	srli	t1,t1,0x7
		if (x16 == 1)
    58ac:	00165693          	srli	a3,a2,0x1
    58b0:	00028b63          	beqz	t0,58c6 <crcu32+0x434>
		   crc |= 0x8000;
    58b4:	7569                	lui	a0,0xffffa
    58b6:	00150393          	addi	t2,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    58ba:	0076c733          	xor	a4,a3,t2
    58be:	01071793          	slli	a5,a4,0x10
    58c2:	0107d693          	srli	a3,a5,0x10
		if (x16 == 1)
    58c6:	0016f613          	andi	a2,a3,1
    58ca:	0016d513          	srli	a0,a3,0x1
    58ce:	00660a63          	beq	a2,t1,58e2 <crcu32+0x450>
		   crc |= 0x8000;
    58d2:	7369                	lui	t1,0xffffa
    58d4:	00130593          	addi	a1,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    58d8:	00b542b3          	xor	t0,a0,a1
    58dc:	01029513          	slli	a0,t0,0x10
    58e0:	8141                	srli	a0,a0,0x10
}
    58e2:	8082                	ret

000058e4 <crc16>:
	return crcu16((ee_u16)newval, crc);
    58e4:	0015d713          	srli	a4,a1,0x1
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    58e8:	8da9                	xor	a1,a1,a0
	return crcu16((ee_u16)newval, crc);
    58ea:	01051313          	slli	t1,a0,0x10
	crc=crcu8( (ee_u8) (newval)				,crc);
    58ee:	0ff57793          	andi	a5,a0,255
		if (x16 == 1)
    58f2:	0015f393          	andi	t2,a1,1
	return crcu16((ee_u16)newval, crc);
    58f6:	01035293          	srli	t0,t1,0x10
		data >>= 1;
    58fa:	0017d613          	srli	a2,a5,0x1
		if (x16 == 1)
    58fe:	00038a63          	beqz	t2,5912 <crc16+0x2e>
		   crc |= 0x8000;
    5902:	76e9                	lui	a3,0xffffa
    5904:	00168513          	addi	a0,a3,1 # ffffa001 <__heap_end+0xdff7a001>
    5908:	8f29                	xor	a4,a4,a0
    590a:	01071313          	slli	t1,a4,0x10
    590e:	01035713          	srli	a4,t1,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5912:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    5914:	00167393          	andi	t2,a2,1
		data >>= 1;
    5918:	0027d593          	srli	a1,a5,0x2
		if (x16 == 1)
    591c:	00175693          	srli	a3,a4,0x1
    5920:	00038b63          	beqz	t2,5936 <crc16+0x52>
		   crc |= 0x8000;
    5924:	7569                	lui	a0,0xffffa
    5926:	00150313          	addi	t1,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    592a:	0066c6b3          	xor	a3,a3,t1
    592e:	01069713          	slli	a4,a3,0x10
    5932:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5936:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    5938:	0015f393          	andi	t2,a1,1
		data >>= 1;
    593c:	0037d613          	srli	a2,a5,0x3
		if (x16 == 1)
    5940:	0016d713          	srli	a4,a3,0x1
    5944:	00038b63          	beqz	t2,595a <crc16+0x76>
		   crc |= 0x8000;
    5948:	7569                	lui	a0,0xffffa
    594a:	00150313          	addi	t1,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    594e:	00674733          	xor	a4,a4,t1
    5952:	01071693          	slli	a3,a4,0x10
    5956:	0106d713          	srli	a4,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    595a:	8e39                	xor	a2,a2,a4
		if (x16 == 1)
    595c:	00167393          	andi	t2,a2,1
		data >>= 1;
    5960:	0047d593          	srli	a1,a5,0x4
		if (x16 == 1)
    5964:	00175693          	srli	a3,a4,0x1
    5968:	00038b63          	beqz	t2,597e <crc16+0x9a>
		   crc |= 0x8000;
    596c:	7569                	lui	a0,0xffffa
    596e:	00150313          	addi	t1,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    5972:	0066c6b3          	xor	a3,a3,t1
    5976:	01069713          	slli	a4,a3,0x10
    597a:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    597e:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    5980:	0015f513          	andi	a0,a1,1
		data >>= 1;
    5984:	0057d393          	srli	t2,a5,0x5
		if (x16 == 1)
    5988:	0016d613          	srli	a2,a3,0x1
    598c:	c909                	beqz	a0,599e <crc16+0xba>
		   crc |= 0x8000;
    598e:	7369                	lui	t1,0xffffa
    5990:	00130713          	addi	a4,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    5994:	8e39                	xor	a2,a2,a4
    5996:	01061693          	slli	a3,a2,0x10
    599a:	0106d613          	srli	a2,a3,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    599e:	007643b3          	xor	t2,a2,t2
		if (x16 == 1)
    59a2:	0013f513          	andi	a0,t2,1
		data >>= 1;
    59a6:	0067d593          	srli	a1,a5,0x6
		if (x16 == 1)
    59aa:	00165693          	srli	a3,a2,0x1
    59ae:	c909                	beqz	a0,59c0 <crc16+0xdc>
		   crc |= 0x8000;
    59b0:	7369                	lui	t1,0xffffa
    59b2:	00130713          	addi	a4,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    59b6:	8eb9                	xor	a3,a3,a4
    59b8:	01069613          	slli	a2,a3,0x10
    59bc:	01065693          	srli	a3,a2,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    59c0:	8db5                	xor	a1,a1,a3
		if (x16 == 1)
    59c2:	0015f393          	andi	t2,a1,1
		data >>= 1;
    59c6:	839d                	srli	a5,a5,0x7
		if (x16 == 1)
    59c8:	0016d613          	srli	a2,a3,0x1
    59cc:	00038a63          	beqz	t2,59e0 <crc16+0xfc>
		   crc |= 0x8000;
    59d0:	7569                	lui	a0,0xffffa
    59d2:	00150313          	addi	t1,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    59d6:	00664733          	xor	a4,a2,t1
    59da:	01071613          	slli	a2,a4,0x10
    59de:	8241                	srli	a2,a2,0x10
		if (x16 == 1)
    59e0:	00167693          	andi	a3,a2,1
    59e4:	00165713          	srli	a4,a2,0x1
    59e8:	00f68b63          	beq	a3,a5,59fe <crc16+0x11a>
		   crc |= 0x8000;
    59ec:	77e9                	lui	a5,0xffffa
    59ee:	00178593          	addi	a1,a5,1 # ffffa001 <__heap_end+0xdff7a001>
    59f2:	00b743b3          	xor	t2,a4,a1
    59f6:	01039513          	slli	a0,t2,0x10
    59fa:	01055713          	srli	a4,a0,0x10
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    59fe:	0082d293          	srli	t0,t0,0x8
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5a02:	005747b3          	xor	a5,a4,t0
	crc=crcu8( (ee_u8) ((newval)>>8)	,crc);
    5a06:	0ff2f313          	andi	t1,t0,255
		if (x16 == 1)
    5a0a:	0017f593          	andi	a1,a5,1
		data >>= 1;
    5a0e:	00135693          	srli	a3,t1,0x1
		if (x16 == 1)
    5a12:	00175613          	srli	a2,a4,0x1
    5a16:	c989                	beqz	a1,5a28 <crc16+0x144>
		   crc |= 0x8000;
    5a18:	73e9                	lui	t2,0xffffa
    5a1a:	00138513          	addi	a0,t2,1 # ffffa001 <__heap_end+0xdff7a001>
    5a1e:	8e29                	xor	a2,a2,a0
    5a20:	01061713          	slli	a4,a2,0x10
    5a24:	01075613          	srli	a2,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5a28:	8eb1                	xor	a3,a3,a2
		if (x16 == 1)
    5a2a:	0016f793          	andi	a5,a3,1
		data >>= 1;
    5a2e:	00235293          	srli	t0,t1,0x2
		if (x16 == 1)
    5a32:	00165513          	srli	a0,a2,0x1
    5a36:	cb91                	beqz	a5,5a4a <crc16+0x166>
		   crc |= 0x8000;
    5a38:	75e9                	lui	a1,0xffffa
    5a3a:	00158393          	addi	t2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5a3e:	00754533          	xor	a0,a0,t2
    5a42:	01051713          	slli	a4,a0,0x10
    5a46:	01075513          	srli	a0,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5a4a:	00554633          	xor	a2,a0,t0
		if (x16 == 1)
    5a4e:	00167293          	andi	t0,a2,1
		data >>= 1;
    5a52:	00335793          	srli	a5,t1,0x3
		if (x16 == 1)
    5a56:	00155693          	srli	a3,a0,0x1
    5a5a:	00028b63          	beqz	t0,5a70 <crc16+0x18c>
		   crc |= 0x8000;
    5a5e:	75e9                	lui	a1,0xffffa
    5a60:	00158393          	addi	t2,a1,1 # ffffa001 <__heap_end+0xdff7a001>
    5a64:	0076c6b3          	xor	a3,a3,t2
    5a68:	01069713          	slli	a4,a3,0x10
    5a6c:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5a70:	8fb5                	xor	a5,a5,a3
		if (x16 == 1)
    5a72:	0017f613          	andi	a2,a5,1
		data >>= 1;
    5a76:	00435513          	srli	a0,t1,0x4
		if (x16 == 1)
    5a7a:	0016d393          	srli	t2,a3,0x1
    5a7e:	ca11                	beqz	a2,5a92 <crc16+0x1ae>
		   crc |= 0x8000;
    5a80:	72e9                	lui	t0,0xffffa
    5a82:	00128593          	addi	a1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    5a86:	00b3c3b3          	xor	t2,t2,a1
    5a8a:	01039713          	slli	a4,t2,0x10
    5a8e:	01075393          	srli	t2,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5a92:	00a3c533          	xor	a0,t2,a0
		if (x16 == 1)
    5a96:	00157613          	andi	a2,a0,1
		data >>= 1;
    5a9a:	00535793          	srli	a5,t1,0x5
		if (x16 == 1)
    5a9e:	0013d693          	srli	a3,t2,0x1
    5aa2:	ca09                	beqz	a2,5ab4 <crc16+0x1d0>
		   crc |= 0x8000;
    5aa4:	72e9                	lui	t0,0xffffa
    5aa6:	00128593          	addi	a1,t0,1 # ffffa001 <__heap_end+0xdff7a001>
    5aaa:	8ead                	xor	a3,a3,a1
    5aac:	01069713          	slli	a4,a3,0x10
    5ab0:	01075693          	srli	a3,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5ab4:	8fb5                	xor	a5,a5,a3
		if (x16 == 1)
    5ab6:	0017f513          	andi	a0,a5,1
		data >>= 1;
    5aba:	00635393          	srli	t2,t1,0x6
		if (x16 == 1)
    5abe:	0016d593          	srli	a1,a3,0x1
    5ac2:	c911                	beqz	a0,5ad6 <crc16+0x1f2>
		   crc |= 0x8000;
    5ac4:	7669                	lui	a2,0xffffa
    5ac6:	00160293          	addi	t0,a2,1 # ffffa001 <__heap_end+0xdff7a001>
    5aca:	0055c5b3          	xor	a1,a1,t0
    5ace:	01059713          	slli	a4,a1,0x10
    5ad2:	01075593          	srli	a1,a4,0x10
		x16 = (ee_u8)((data & 1) ^ ((ee_u8)crc & 1));
    5ad6:	0075c3b3          	xor	t2,a1,t2
		if (x16 == 1)
    5ada:	0013f793          	andi	a5,t2,1
		data >>= 1;
    5ade:	00735313          	srli	t1,t1,0x7
		if (x16 == 1)
    5ae2:	0015d713          	srli	a4,a1,0x1
    5ae6:	cb91                	beqz	a5,5afa <crc16+0x216>
		   crc |= 0x8000;
    5ae8:	7569                	lui	a0,0xffffa
    5aea:	00150613          	addi	a2,a0,1 # ffffa001 <__heap_end+0xdff7a001>
    5aee:	00c746b3          	xor	a3,a4,a2
    5af2:	01069293          	slli	t0,a3,0x10
    5af6:	0102d713          	srli	a4,t0,0x10
		if (x16 == 1)
    5afa:	00177593          	andi	a1,a4,1
    5afe:	00175513          	srli	a0,a4,0x1
    5b02:	00658a63          	beq	a1,t1,5b16 <crc16+0x232>
		   crc |= 0x8000;
    5b06:	7369                	lui	t1,0xffffa
    5b08:	00130393          	addi	t2,t1,1 # ffffa001 <__heap_end+0xdff7a001>
    5b0c:	007547b3          	xor	a5,a0,t2
    5b10:	01079513          	slli	a0,a5,0x10
    5b14:	8141                	srli	a0,a0,0x10
}
    5b16:	8082                	ret

00005b18 <check_data_types>:
	}
	if (retval>0) {
		printf("ERROR: Please modify the datatypes in core_portme.h!\n");
	}
	return retval;
}
    5b18:	4501                	li	a0,0
    5b1a:	8082                	ret

00005b1c <core_bench_list>:
	- List sort
	- Operate on data from list (crc)
	- Single remove/reinsert
	* At the end of this function, the list is back to original state
*/
ee_u16 core_bench_list(core_results *res, ee_s16 finder_idx) {
    5b1c:	fb810113          	addi	sp,sp,-72
    5b20:	c0a2                	sw	s0,64(sp)
	ee_u16 retval=0;
	ee_u16 found=0,missed=0;
	list_head *list=res->list;
	ee_s16 find_num=res->seed3;
    5b22:	00451403          	lh	s0,4(a0)
ee_u16 core_bench_list(core_results *res, ee_s16 finder_idx) {
    5b26:	c286                	sw	ra,68(sp)
    5b28:	de26                	sw	s1,60(sp)
    5b2a:	c42e                	sw	a1,8(sp)
    5b2c:	da02                	sw	zero,52(sp)
    5b2e:	82aa                	mv	t0,a0
	list_head *list=res->list;
    5b30:	02452383          	lw	t2,36(a0)
	list_data info;
	ee_s16 i;

	info.idx=finder_idx;
	/* find <find_num> values in the list, and change the list each time (reverse and cache if value found) */
	for (i=0; i<find_num; i++) {
    5b34:	44805d63          	blez	s0,5f8e <core_bench_list+0x472>
	info.idx=finder_idx;
    5b38:	86ae                	mv	a3,a1
	for (i=0; i<find_num; i++) {
    5b3a:	4301                	li	t1,0
	ee_u16 found=0,missed=0;
    5b3c:	c202                	sw	zero,4(sp)
    5b3e:	4481                	li	s1,0
	ee_u16 retval=0;
    5b40:	4581                	li	a1,0
    5b42:	c022                	sw	s0,0(sp)
    5b44:	c62a                	sw	a0,12(sp)
		info.data16= (i & 0xff) ;
    5b46:	0ff37093          	andi	ra,t1,255

	Returns:
	Found item, or NULL if not found.
*/
list_head *core_list_find(list_head *list,list_data *info) {
	if (info->idx>=0) {
    5b4a:	3206c063          	bltz	a3,5e6a <core_bench_list+0x34e>
		while (list && (list->info->idx != info->idx))
    5b4e:	78038963          	beqz	t2,62e0 <core_bench_list+0x7c4>
    5b52:	0043a403          	lw	s0,4(t2)
    5b56:	879e                	mv	a5,t2
    5b58:	00241503          	lh	a0,2(s0) # fffff002 <__heap_end+0xdff7f002>
    5b5c:	00d51863          	bne	a0,a3,5b6c <core_bench_list+0x50>
    5b60:	a801                	j	5b70 <core_bench_list+0x54>
    5b62:	43d8                	lw	a4,4(a5)
    5b64:	00271603          	lh	a2,2(a4)
    5b68:	00d60463          	beq	a2,a3,5b70 <core_bench_list+0x54>
			list=list->next;
    5b6c:	439c                	lw	a5,0(a5)
		while (list && (list->info->idx != info->idx))
    5b6e:	fbf5                	bnez	a5,5b62 <core_bench_list+0x46>
*/

list_head *core_list_reverse(list_head *list) {
	list_head *next=NULL, *tmp;
	while (list) {
		tmp=list->next;
    5b70:	0003a403          	lw	s0,0(t2)
		while (list && (list->info->idx != info->idx))
    5b74:	4701                	li	a4,0
		list->next=next;
    5b76:	00e3a023          	sw	a4,0(t2)
	while (list) {
    5b7a:	c425                	beqz	s0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5b7c:	4008                	lw	a0,0(s0)
	while (list) {
    5b7e:	871e                	mv	a4,t2
		list->next=next;
    5b80:	c018                	sw	a4,0(s0)
	while (list) {
    5b82:	83a2                	mv	t2,s0
    5b84:	cd39                	beqz	a0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5b86:	00052283          	lw	t0,0(a0)
		list->next=next;
    5b8a:	c100                	sw	s0,0(a0)
	while (list) {
    5b8c:	8722                	mv	a4,s0
    5b8e:	83aa                	mv	t2,a0
    5b90:	04028963          	beqz	t0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5b94:	0002a603          	lw	a2,0(t0)
		list->next=next;
    5b98:	00a2a023          	sw	a0,0(t0)
	while (list) {
    5b9c:	872a                	mv	a4,a0
    5b9e:	8396                	mv	t2,t0
    5ba0:	c229                	beqz	a2,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5ba2:	4200                	lw	s0,0(a2)
		list->next=next;
    5ba4:	00562023          	sw	t0,0(a2)
	while (list) {
    5ba8:	8716                	mv	a4,t0
    5baa:	83b2                	mv	t2,a2
    5bac:	c81d                	beqz	s0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5bae:	4008                	lw	a0,0(s0)
		list->next=next;
    5bb0:	c010                	sw	a2,0(s0)
	while (list) {
    5bb2:	8732                	mv	a4,a2
    5bb4:	83a2                	mv	t2,s0
    5bb6:	c515                	beqz	a0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5bb8:	00052283          	lw	t0,0(a0)
		list->next=next;
    5bbc:	c100                	sw	s0,0(a0)
	while (list) {
    5bbe:	8722                	mv	a4,s0
    5bc0:	83aa                	mv	t2,a0
    5bc2:	02028063          	beqz	t0,5be2 <core_bench_list+0xc6>
		tmp=list->next;
    5bc6:	0002a603          	lw	a2,0(t0)
		list->next=next;
    5bca:	00a2a023          	sw	a0,0(t0)
	while (list) {
    5bce:	872a                	mv	a4,a0
    5bd0:	8396                	mv	t2,t0
    5bd2:	ca01                	beqz	a2,5be2 <core_bench_list+0xc6>
    5bd4:	83b2                	mv	t2,a2
		tmp=list->next;
    5bd6:	0003a403          	lw	s0,0(t2)
	while (list) {
    5bda:	8716                	mv	a4,t0
		list->next=next;
    5bdc:	00e3a023          	sw	a4,0(t2)
	while (list) {
    5be0:	fc51                	bnez	s0,5b7c <core_bench_list+0x60>
		if (this_find==NULL) {
    5be2:	2a078663          	beqz	a5,5e8e <core_bench_list+0x372>
			if (this_find->info->data16 & 0x1) /* use found value */
    5be6:	43c0                	lw	s0,4(a5)
			found++;
    5be8:	0485                	addi	s1,s1,1
    5bea:	01049713          	slli	a4,s1,0x10
			if (this_find->info->data16 & 0x1) /* use found value */
    5bee:	00041503          	lh	a0,0(s0)
			found++;
    5bf2:	01075493          	srli	s1,a4,0x10
			if (this_find->info->data16 & 0x1) /* use found value */
    5bf6:	00157293          	andi	t0,a0,1
    5bfa:	00028b63          	beqz	t0,5c10 <core_bench_list+0xf4>
				retval+=(this_find->info->data16 >> 9) & 1;
    5bfe:	40955613          	srai	a2,a0,0x9
    5c02:	00167713          	andi	a4,a2,1
    5c06:	95ba                	add	a1,a1,a4
    5c08:	01059413          	slli	s0,a1,0x10
    5c0c:	01045593          	srli	a1,s0,0x10
			if (this_find->next != NULL) {
    5c10:	4388                	lw	a0,0(a5)
    5c12:	c911                	beqz	a0,5c26 <core_bench_list+0x10a>
				this_find->next = finder->next;
    5c14:	00052283          	lw	t0,0(a0)
    5c18:	0057a023          	sw	t0,0(a5)
				finder->next=list->next;
    5c1c:	0003a783          	lw	a5,0(t2)
    5c20:	c11c                	sw	a5,0(a0)
				list->next=finder;
    5c22:	00a3a023          	sw	a0,0(t2)
		if (info.idx>=0)
    5c26:	0006c763          	bltz	a3,5c34 <core_bench_list+0x118>
			info.idx++;
    5c2a:	0685                	addi	a3,a3,1
    5c2c:	01069513          	slli	a0,a3,0x10
    5c30:	41055693          	srai	a3,a0,0x10
    5c34:	0305                	addi	t1,t1,1
	for (i=0; i<find_num; i++) {
    5c36:	4702                	lw	a4,0(sp)
    5c38:	01031293          	slli	t0,t1,0x10
    5c3c:	4102d313          	srai	t1,t0,0x10
    5c40:	f06713e3          	bne	a4,t1,5b46 <core_bench_list+0x2a>
    5c44:	da06                	sw	ra,52(sp)
    5c46:	00249093          	slli	ra,s1,0x2
    5c4a:	4492                	lw	s1,4(sp)
	if (finder_idx>0)
    5c4c:	4522                	lw	a0,8(sp)
    5c4e:	dc36                	sw	a3,56(sp)
    5c50:	409087b3          	sub	a5,ra,s1
    5c54:	00f58633          	add	a2,a1,a5
    5c58:	01061593          	slli	a1,a2,0x10
    5c5c:	0105d413          	srli	s0,a1,0x10
    5c60:	d822                	sw	s0,48(sp)
    5c62:	42b2                	lw	t0,12(sp)
    5c64:	32a04b63          	bgtz	a0,5f9a <core_bench_list+0x47e>
	remover=core_list_remove(list->next);
    5c68:	0003a483          	lw	s1,0(t2)
	if (info->idx>=0) {
    5c6c:	52e2                	lw	t0,56(sp)
	list_head *ret=item->next;
    5c6e:	4080                	lw	s0,0(s1)
	tmp=item->info;
    5c70:	40d8                	lw	a4,4(s1)
	item->info=ret->info;
    5c72:	4050                	lw	a2,4(s0)
	item->next=item->next->next;
    5c74:	400c                	lw	a1,0(s0)
	item->info=ret->info;
    5c76:	c0d0                	sw	a2,4(s1)
	ret->info=tmp;
    5c78:	c058                	sw	a4,4(s0)
	item->next=item->next->next;
    5c7a:	c08c                	sw	a1,0(s1)
	ret->next=NULL;
    5c7c:	00042023          	sw	zero,0(s0)
	if (info->idx>=0) {
    5c80:	849e                	mv	s1,t2
    5c82:	8616                	mv	a2,t0
    5c84:	2e02c863          	bltz	t0,5f74 <core_bench_list+0x458>
		while (list && (list->info->idx != info->idx))
    5c88:	0044a083          	lw	ra,4(s1)
    5c8c:	00209783          	lh	a5,2(ra)
    5c90:	00c78763          	beq	a5,a2,5c9e <core_bench_list+0x182>
			list=list->next;
    5c94:	4084                	lw	s1,0(s1)
		while (list && (list->info->idx != info->idx))
    5c96:	f8ed                	bnez	s1,5c88 <core_bench_list+0x16c>
		finder=list->next;
    5c98:	0003a483          	lw	s1,0(t2)
	while (finder) {
    5c9c:	c4d1                	beqz	s1,5d28 <core_bench_list+0x20c>
    5c9e:	55c2                	lw	a1,48(sp)
    5ca0:	c022                	sw	s0,0(sp)
    5ca2:	8426                	mv	s0,s1
    5ca4:	849e                	mv	s1,t2
		retval=crc16(list->info->data16,retval);
    5ca6:	0044a383          	lw	t2,4(s1)
    5caa:	00039503          	lh	a0,0(t2)
    5cae:	391d                	jal	58e4 <crc16>
		finder=finder->next;
    5cb0:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5cb2:	85aa                	mv	a1,a0
	while (finder) {
    5cb4:	c42d                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5cb6:	0044a283          	lw	t0,4(s1)
    5cba:	00029503          	lh	a0,0(t0)
    5cbe:	311d                	jal	58e4 <crc16>
		finder=finder->next;
    5cc0:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5cc2:	85aa                	mv	a1,a0
	while (finder) {
    5cc4:	cc29                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5cc6:	40c8                	lw	a0,4(s1)
    5cc8:	00051503          	lh	a0,0(a0)
    5ccc:	3921                	jal	58e4 <crc16>
		finder=finder->next;
    5cce:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5cd0:	85aa                	mv	a1,a0
	while (finder) {
    5cd2:	c431                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5cd4:	0044a303          	lw	t1,4(s1)
    5cd8:	00031503          	lh	a0,0(t1)
    5cdc:	3121                	jal	58e4 <crc16>
		finder=finder->next;
    5cde:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5ce0:	85aa                	mv	a1,a0
	while (finder) {
    5ce2:	cc15                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5ce4:	40d4                	lw	a3,4(s1)
    5ce6:	00069503          	lh	a0,0(a3)
    5cea:	3eed                	jal	58e4 <crc16>
		finder=finder->next;
    5cec:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5cee:	85aa                	mv	a1,a0
	while (finder) {
    5cf0:	c41d                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5cf2:	0044a083          	lw	ra,4(s1)
    5cf6:	00009503          	lh	a0,0(ra)
    5cfa:	36ed                	jal	58e4 <crc16>
		finder=finder->next;
    5cfc:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5cfe:	85aa                	mv	a1,a0
	while (finder) {
    5d00:	cc19                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5d02:	40dc                	lw	a5,4(s1)
    5d04:	00079503          	lh	a0,0(a5)
    5d08:	3ef1                	jal	58e4 <crc16>
		finder=finder->next;
    5d0a:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5d0c:	85aa                	mv	a1,a0
	while (finder) {
    5d0e:	c801                	beqz	s0,5d1e <core_bench_list+0x202>
		retval=crc16(list->info->data16,retval);
    5d10:	40d0                	lw	a2,4(s1)
    5d12:	00061503          	lh	a0,0(a2)
    5d16:	36f9                	jal	58e4 <crc16>
		finder=finder->next;
    5d18:	4000                	lw	s0,0(s0)
		retval=crc16(list->info->data16,retval);
    5d1a:	85aa                	mv	a1,a0
	while (finder) {
    5d1c:	f449                	bnez	s0,5ca6 <core_bench_list+0x18a>
    5d1e:	4402                	lw	s0,0(sp)
    5d20:	83a6                	mv	t2,s1
    5d22:	4084                	lw	s1,0(s1)
    5d24:	4058                	lw	a4,4(s0)
    5d26:	d82e                	sw	a1,48(sp)
	item_removed->info=item_modified->info;
    5d28:	40cc                	lw	a1,4(s1)
 */
list_head *core_list_mergesort(list_head *list, list_cmp cmp, core_results *res) {
    list_head *p, *q, *e, *tail;
    ee_s32 insize, nmerges, psize, qsize, i;

    insize = 1;
    5d2a:	4285                	li	t0,1

    while (1) {
        p = list;
        list = NULL;
    5d2c:	c002                	sw	zero,0(sp)
	item_removed->info=item_modified->info;
    5d2e:	c04c                	sw	a1,4(s0)
	item_modified->info=tmp;
    5d30:	c0d8                	sw	a4,4(s1)
	item_removed->next=item_modified->next;
    5d32:	4098                	lw	a4,0(s1)
    5d34:	c018                	sw	a4,0(s0)
	item_modified->next=item_removed;
    5d36:	c080                	sw	s0,0(s1)
        tail = NULL;
    5d38:	4401                	li	s0,0

        nmerges = 0;  /* count number of merges we do in this pass */
    5d3a:	4481                	li	s1,0

        while (p) {
            nmerges++;  /* there exists a merge to be done */
    5d3c:	0072f513          	andi	a0,t0,7
    5d40:	0485                	addi	s1,s1,1
    5d42:	869e                	mv	a3,t2
            /* step `insize' places along from p */
            q = p;
            psize = 0;
    5d44:	4781                	li	a5,0
    5d46:	c939                	beqz	a0,5d9c <core_bench_list+0x280>
    5d48:	4305                	li	t1,1
    5d4a:	04650463          	beq	a0,t1,5d92 <core_bench_list+0x276>
    5d4e:	4089                	li	ra,2
    5d50:	02150e63          	beq	a0,ra,5d8c <core_bench_list+0x270>
    5d54:	460d                	li	a2,3
    5d56:	02c50863          	beq	a0,a2,5d86 <core_bench_list+0x26a>
    5d5a:	4591                	li	a1,4
    5d5c:	02b50263          	beq	a0,a1,5d80 <core_bench_list+0x264>
    5d60:	4715                	li	a4,5
    5d62:	00e50c63          	beq	a0,a4,5d7a <core_bench_list+0x25e>
    5d66:	4319                	li	t1,6
    5d68:	00650663          	beq	a0,t1,5d74 <core_bench_list+0x258>
            for (i = 0; i < insize; i++) {
                psize++;
			    q = q->next;
    5d6c:	0003a683          	lw	a3,0(t2)
                psize++;
    5d70:	4785                	li	a5,1
                if (!q) break;
    5d72:	c6a5                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d74:	4294                	lw	a3,0(a3)
                psize++;
    5d76:	0785                	addi	a5,a5,1
                if (!q) break;
    5d78:	c2ad                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d7a:	4294                	lw	a3,0(a3)
                psize++;
    5d7c:	0785                	addi	a5,a5,1
                if (!q) break;
    5d7e:	ceb1                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d80:	4294                	lw	a3,0(a3)
                psize++;
    5d82:	0785                	addi	a5,a5,1
                if (!q) break;
    5d84:	cab9                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d86:	4294                	lw	a3,0(a3)
                psize++;
    5d88:	0785                	addi	a5,a5,1
                if (!q) break;
    5d8a:	caa1                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d8c:	4294                	lw	a3,0(a3)
                psize++;
    5d8e:	0785                	addi	a5,a5,1
                if (!q) break;
    5d90:	c6a9                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5d92:	4294                	lw	a3,0(a3)
                psize++;
    5d94:	0785                	addi	a5,a5,1
                if (!q) break;
    5d96:	c2b1                	beqz	a3,5dda <core_bench_list+0x2be>
            for (i = 0; i < insize; i++) {
    5d98:	12f28963          	beq	t0,a5,5eca <core_bench_list+0x3ae>
			    q = q->next;
    5d9c:	4294                	lw	a3,0(a3)
                psize++;
    5d9e:	0785                	addi	a5,a5,1
    5da0:	853e                	mv	a0,a5
                if (!q) break;
    5da2:	ce85                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5da4:	4294                	lw	a3,0(a3)
                psize++;
    5da6:	0785                	addi	a5,a5,1
                if (!q) break;
    5da8:	ca8d                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5daa:	4294                	lw	a3,0(a3)
                psize++;
    5dac:	00250793          	addi	a5,a0,2
                if (!q) break;
    5db0:	c68d                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5db2:	4294                	lw	a3,0(a3)
                psize++;
    5db4:	00350793          	addi	a5,a0,3
                if (!q) break;
    5db8:	c28d                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5dba:	4294                	lw	a3,0(a3)
                psize++;
    5dbc:	00450793          	addi	a5,a0,4
                if (!q) break;
    5dc0:	ce89                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5dc2:	4294                	lw	a3,0(a3)
                psize++;
    5dc4:	00550793          	addi	a5,a0,5
                if (!q) break;
    5dc8:	ca89                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5dca:	4294                	lw	a3,0(a3)
                psize++;
    5dcc:	00650793          	addi	a5,a0,6
                if (!q) break;
    5dd0:	c689                	beqz	a3,5dda <core_bench_list+0x2be>
			    q = q->next;
    5dd2:	4294                	lw	a3,0(a3)
                psize++;
    5dd4:	00750793          	addi	a5,a0,7
                if (!q) break;
    5dd8:	f2e1                	bnez	a3,5d98 <core_bench_list+0x27c>

		        /* add the next element to the merged list */
				if (tail) {
				    tail->next = e;
				} else {
				    list = e;
    5dda:	809e                	mv	ra,t2
    5ddc:	8616                	mv	a2,t0
    5dde:	83b6                	mv	t2,a3
            while (psize > 0 || (qsize > 0 && q)) {
    5de0:	c7a5                	beqz	a5,5e48 <core_bench_list+0x32c>
				} else if (qsize == 0 || !q) {
    5de2:	ce61                	beqz	a2,5eba <core_bench_list+0x39e>
    5de4:	0c038b63          	beqz	t2,5eba <core_bench_list+0x39e>
				} else if (cmp(p->info,q->info,res) <= 0) {
    5de8:	0040a703          	lw	a4,4(ra)
    5dec:	0043a583          	lw	a1,4(t2)
		a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16>>8));
    5df0:	00071503          	lh	a0,0(a4)
    5df4:	01051693          	slli	a3,a0,0x10
    5df8:	f0057313          	andi	t1,a0,-256
    5dfc:	0106d513          	srli	a0,a3,0x10
    5e00:	00855693          	srli	a3,a0,0x8
    5e04:	00d36333          	or	t1,t1,a3
    5e08:	00671023          	sh	t1,0(a4)
		b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16>>8));
    5e0c:	00059503          	lh	a0,0(a1)
	return a->idx - b->idx;
    5e10:	00271703          	lh	a4,2(a4)
		b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16>>8));
    5e14:	01051693          	slli	a3,a0,0x10
    5e18:	f0057313          	andi	t1,a0,-256
    5e1c:	0106d513          	srli	a0,a3,0x10
    5e20:	00855693          	srli	a3,a0,0x8
    5e24:	00d36333          	or	t1,t1,a3
    5e28:	00659023          	sh	t1,0(a1)
	return a->idx - b->idx;
    5e2c:	00259583          	lh	a1,2(a1)
    5e30:	40b70533          	sub	a0,a4,a1
				} else if (cmp(p->info,q->info,res) <= 0) {
    5e34:	08a05363          	blez	a0,5eba <core_bench_list+0x39e>
				    e = q; q = q->next; qsize--;
    5e38:	869e                	mv	a3,t2
    5e3a:	0003a383          	lw	t2,0(t2)
    5e3e:	167d                	addi	a2,a2,-1
				if (tail) {
    5e40:	c835                	beqz	s0,5eb4 <core_bench_list+0x398>
				    tail->next = e;
    5e42:	c014                	sw	a3,0(s0)
				    list = e;
    5e44:	8436                	mv	s0,a3
            while (psize > 0 || (qsize > 0 && q)) {
    5e46:	ffd1                	bnez	a5,5de2 <core_bench_list+0x2c6>
    5e48:	ce35                	beqz	a2,5ec4 <core_bench_list+0x3a8>
    5e4a:	fe0397e3          	bnez	t2,5e38 <core_bench_list+0x31c>

			/* now p has stepped `insize' places along, and q has too */
			p = q;
        }

	    tail->next = NULL;
    5e4e:	00042023          	sw	zero,0(s0)

        /* If we have done only one merge, we're finished. */
        if (nmerges <= 1)   /* allow for nmerges==0, the empty list case */
    5e52:	4385                	li	t2,1
    5e54:	08748063          	beq	s1,t2,5ed4 <core_bench_list+0x3b8>
        while (p) {
    5e58:	4482                	lw	s1,0(sp)
            return list;

        /* Otherwise repeat, merging lists twice the size */
        insize *= 2;
    5e5a:	0286                	slli	t0,t0,0x1
        while (p) {
    5e5c:	36048163          	beqz	s1,61be <core_bench_list+0x6a2>
    5e60:	83a6                	mv	t2,s1
        tail = NULL;
    5e62:	4401                	li	s0,0
        nmerges = 0;  /* count number of merges we do in this pass */
    5e64:	4481                	li	s1,0
        list = NULL;
    5e66:	c002                	sw	zero,0(sp)
    5e68:	bdd1                	j	5d3c <core_bench_list+0x220>
		while (list && ((list->info->data16 & 0xff) != info->data16))
    5e6a:	46038b63          	beqz	t2,62e0 <core_bench_list+0x7c4>
    5e6e:	0043a503          	lw	a0,4(t2)
    5e72:	879e                	mv	a5,t2
    5e74:	00054703          	lbu	a4,0(a0)
    5e78:	00e09863          	bne	ra,a4,5e88 <core_bench_list+0x36c>
    5e7c:	b9d5                	j	5b70 <core_bench_list+0x54>
    5e7e:	43d0                	lw	a2,4(a5)
    5e80:	00064283          	lbu	t0,0(a2)
    5e84:	ce1286e3          	beq	t0,ra,5b70 <core_bench_list+0x54>
			list=list->next;
    5e88:	439c                	lw	a5,0(a5)
		while (list && ((list->info->data16 & 0xff) != info->data16))
    5e8a:	fbf5                	bnez	a5,5e7e <core_bench_list+0x362>
    5e8c:	b1d5                	j	5b70 <core_bench_list+0x54>
			retval+=(list->next->info->data16 >> 8) & 1;
    5e8e:	4358                	lw	a4,4(a4)
			missed++;
    5e90:	4612                	lw	a2,4(sp)
			retval+=(list->next->info->data16 >> 8) & 1;
    5e92:	00170783          	lb	a5,1(a4)
			missed++;
    5e96:	00160413          	addi	s0,a2,1
    5e9a:	01041513          	slli	a0,s0,0x10
			retval+=(list->next->info->data16 >> 8) & 1;
    5e9e:	0017f613          	andi	a2,a5,1
    5ea2:	95b2                	add	a1,a1,a2
			missed++;
    5ea4:	01055293          	srli	t0,a0,0x10
			retval+=(list->next->info->data16 >> 8) & 1;
    5ea8:	01059413          	slli	s0,a1,0x10
			missed++;
    5eac:	c216                	sw	t0,4(sp)
			retval+=(list->next->info->data16 >> 8) & 1;
    5eae:	01045593          	srli	a1,s0,0x10
    5eb2:	bb95                	j	5c26 <core_bench_list+0x10a>
				    list = e;
    5eb4:	c036                	sw	a3,0(sp)
    5eb6:	8436                	mv	s0,a3
    5eb8:	b779                	j	5e46 <core_bench_list+0x32a>
				    e = p; p = p->next; psize--;
    5eba:	8686                	mv	a3,ra
    5ebc:	17fd                	addi	a5,a5,-1
    5ebe:	0000a083          	lw	ra,0(ra)
    5ec2:	bfbd                	j	5e40 <core_bench_list+0x324>
        while (p) {
    5ec4:	e6039ce3          	bnez	t2,5d3c <core_bench_list+0x220>
    5ec8:	b759                	j	5e4e <core_bench_list+0x332>
				    list = e;
    5eca:	809e                	mv	ra,t2
            for (i = 0; i < insize; i++) {
    5ecc:	8796                	mv	a5,t0
				    list = e;
    5ece:	8616                	mv	a2,t0
    5ed0:	83b6                	mv	t2,a3
    5ed2:	b739                	j	5de0 <core_bench_list+0x2c4>
	finder=list->next;
    5ed4:	4402                	lw	s0,0(sp)
    5ed6:	4004                	lw	s1,0(s0)
	while (finder) {
    5ed8:	40048263          	beqz	s1,62dc <core_bench_list+0x7c0>
    5edc:	55c2                	lw	a1,48(sp)
		retval=crc16(list->info->data16,retval);
    5ede:	00442083          	lw	ra,4(s0)
    5ee2:	00009503          	lh	a0,0(ra)
    5ee6:	9ffff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5eea:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5eec:	85aa                	mv	a1,a0
	while (finder) {
    5eee:	c8bd                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5ef0:	4050                	lw	a2,4(s0)
    5ef2:	00061503          	lh	a0,0(a2)
    5ef6:	9efff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5efa:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5efc:	85aa                	mv	a1,a0
	while (finder) {
    5efe:	c0bd                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f00:	4058                	lw	a4,4(s0)
    5f02:	00071503          	lh	a0,0(a4)
    5f06:	9dfff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f0a:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f0c:	85aa                	mv	a1,a0
	while (finder) {
    5f0e:	c8b9                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f10:	00442303          	lw	t1,4(s0)
    5f14:	00031503          	lh	a0,0(t1)
    5f18:	9cdff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f1c:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f1e:	85aa                	mv	a1,a0
	while (finder) {
    5f20:	c0b1                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f22:	4048                	lw	a0,4(s0)
    5f24:	00051503          	lh	a0,0(a0)
    5f28:	9bdff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f2c:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f2e:	85aa                	mv	a1,a0
	while (finder) {
    5f30:	c895                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f32:	405c                	lw	a5,4(s0)
    5f34:	00079503          	lh	a0,0(a5)
    5f38:	9adff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f3c:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f3e:	85aa                	mv	a1,a0
	while (finder) {
    5f40:	c095                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f42:	4054                	lw	a3,4(s0)
    5f44:	00069503          	lh	a0,0(a3)
    5f48:	99dff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f4c:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f4e:	85aa                	mv	a1,a0
	while (finder) {
    5f50:	c891                	beqz	s1,5f64 <core_bench_list+0x448>
		retval=crc16(list->info->data16,retval);
    5f52:	00442383          	lw	t2,4(s0)
    5f56:	00039503          	lh	a0,0(t2)
    5f5a:	98bff0ef          	jal	ra,58e4 <crc16>
		finder=finder->next;
    5f5e:	4084                	lw	s1,0(s1)
		retval=crc16(list->info->data16,retval);
    5f60:	85aa                	mv	a1,a0
	while (finder) {
    5f62:	fcb5                	bnez	s1,5ede <core_bench_list+0x3c2>
    5f64:	d82e                	sw	a1,48(sp)
    5f66:	852e                	mv	a0,a1
}
    5f68:	4096                	lw	ra,68(sp)
    5f6a:	4406                	lw	s0,64(sp)
    5f6c:	54f2                	lw	s1,60(sp)
    5f6e:	04810113          	addi	sp,sp,72
    5f72:	8082                	ret
    5f74:	56d2                	lw	a3,52(sp)
		while (list && ((list->info->data16 & 0xff) != info->data16))
    5f76:	40c8                	lw	a0,4(s1)
    5f78:	00054303          	lbu	t1,0(a0)
    5f7c:	d2d301e3          	beq	t1,a3,5c9e <core_bench_list+0x182>
			list=list->next;
    5f80:	4084                	lw	s1,0(s1)
		while (list && ((list->info->data16 & 0xff) != info->data16))
    5f82:	f8f5                	bnez	s1,5f76 <core_bench_list+0x45a>
		finder=list->next;
    5f84:	0003a483          	lw	s1,0(t2)
	while (finder) {
    5f88:	d0049be3          	bnez	s1,5c9e <core_bench_list+0x182>
    5f8c:	bb71                	j	5d28 <core_bench_list+0x20c>
	info.idx=finder_idx;
    5f8e:	dc2e                	sw	a1,56(sp)
    5f90:	d802                	sw	zero,48(sp)
	if (finder_idx>0)
    5f92:	ccb05be3          	blez	a1,5c68 <core_bench_list+0x14c>
        while (p) {
    5f96:	22038463          	beqz	t2,61be <core_bench_list+0x6a2>
    5f9a:	4685                	li	a3,1
    5f9c:	d21e                	sw	t2,36(sp)
    5f9e:	d036                	sw	a3,32(sp)
    5fa0:	8396                	mv	t2,t0
    5fa2:	5292                	lw	t0,36(sp)
				retval=core_bench_matrix(&(res->mat),dtype,res->crc);
    5fa4:	02838313          	addi	t1,t2,40
        tail = NULL;
    5fa8:	c802                	sw	zero,16(sp)
        while (p) {
    5faa:	c216                	sw	t0,4(sp)
        list = NULL;
    5fac:	d202                	sw	zero,36(sp)
        nmerges = 0;  /* count number of merges we do in this pass */
    5fae:	d402                	sw	zero,40(sp)
				retval=core_bench_matrix(&(res->mat),dtype,res->crc);
    5fb0:	d61a                	sw	t1,44(sp)
            nmerges++;  /* there exists a merge to be done */
    5fb2:	5722                	lw	a4,40(sp)
    5fb4:	5782                	lw	a5,32(sp)
    5fb6:	4292                	lw	t0,4(sp)
    5fb8:	00170093          	addi	ra,a4,1
    5fbc:	d406                	sw	ra,40(sp)
            for (i = 0; i < insize; i++) {
    5fbe:	0077f613          	andi	a2,a5,7
            psize = 0;
    5fc2:	4481                	li	s1,0
    5fc4:	ca2d                	beqz	a2,6036 <core_bench_list+0x51a>
    5fc6:	4585                	li	a1,1
    5fc8:	04b60f63          	beq	a2,a1,6026 <core_bench_list+0x50a>
    5fcc:	4409                	li	s0,2
    5fce:	04860763          	beq	a2,s0,601c <core_bench_list+0x500>
    5fd2:	450d                	li	a0,3
    5fd4:	02a60f63          	beq	a2,a0,6012 <core_bench_list+0x4f6>
    5fd8:	4691                	li	a3,4
    5fda:	02d60763          	beq	a2,a3,6008 <core_bench_list+0x4ec>
    5fde:	4315                	li	t1,5
    5fe0:	00660f63          	beq	a2,t1,5ffe <core_bench_list+0x4e2>
    5fe4:	4719                	li	a4,6
    5fe6:	00e60763          	beq	a2,a4,5ff4 <core_bench_list+0x4d8>
			    q = q->next;
    5fea:	0002a283          	lw	t0,0(t0)
                psize++;
    5fee:	4485                	li	s1,1
                if (!q) break;
    5ff0:	0a028263          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    5ff4:	0002a283          	lw	t0,0(t0)
                psize++;
    5ff8:	0485                	addi	s1,s1,1
                if (!q) break;
    5ffa:	08028d63          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    5ffe:	0002a283          	lw	t0,0(t0)
                psize++;
    6002:	0485                	addi	s1,s1,1
                if (!q) break;
    6004:	08028863          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6008:	0002a283          	lw	t0,0(t0)
                psize++;
    600c:	0485                	addi	s1,s1,1
                if (!q) break;
    600e:	08028363          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6012:	0002a283          	lw	t0,0(t0)
                psize++;
    6016:	0485                	addi	s1,s1,1
                if (!q) break;
    6018:	06028e63          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    601c:	0002a283          	lw	t0,0(t0)
                psize++;
    6020:	0485                	addi	s1,s1,1
                if (!q) break;
    6022:	06028963          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6026:	0002a283          	lw	t0,0(t0)
                psize++;
    602a:	0485                	addi	s1,s1,1
                if (!q) break;
    602c:	06028463          	beqz	t0,6094 <core_bench_list+0x578>
            for (i = 0; i < insize; i++) {
    6030:	5082                	lw	ra,32(sp)
    6032:	06148163          	beq	s1,ra,6094 <core_bench_list+0x578>
			    q = q->next;
    6036:	0002a283          	lw	t0,0(t0)
                psize++;
    603a:	0485                	addi	s1,s1,1
    603c:	87a6                	mv	a5,s1
                if (!q) break;
    603e:	04028b63          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6042:	0002a283          	lw	t0,0(t0)
                psize++;
    6046:	0485                	addi	s1,s1,1
                if (!q) break;
    6048:	04028663          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    604c:	0002a283          	lw	t0,0(t0)
                psize++;
    6050:	00278493          	addi	s1,a5,2
                if (!q) break;
    6054:	04028063          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6058:	0002a283          	lw	t0,0(t0)
                psize++;
    605c:	00378493          	addi	s1,a5,3
                if (!q) break;
    6060:	02028a63          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6064:	0002a283          	lw	t0,0(t0)
                psize++;
    6068:	00478493          	addi	s1,a5,4
                if (!q) break;
    606c:	02028463          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6070:	0002a283          	lw	t0,0(t0)
                psize++;
    6074:	00578493          	addi	s1,a5,5
                if (!q) break;
    6078:	00028e63          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    607c:	0002a283          	lw	t0,0(t0)
                psize++;
    6080:	00678493          	addi	s1,a5,6
                if (!q) break;
    6084:	00028863          	beqz	t0,6094 <core_bench_list+0x578>
			    q = q->next;
    6088:	0002a283          	lw	t0,0(t0)
                psize++;
    608c:	00778493          	addi	s1,a5,7
                if (!q) break;
    6090:	fa0290e3          	bnez	t0,6030 <core_bench_list+0x514>
				    list = e;
    6094:	5602                	lw	a2,32(sp)
    6096:	c426                	sw	s1,8(sp)
            while (psize > 0 || (qsize > 0 && q)) {
    6098:	45a2                	lw	a1,8(sp)
				    list = e;
    609a:	c032                	sw	a2,0(sp)
            while (psize > 0 || (qsize > 0 && q)) {
    609c:	0e058f63          	beqz	a1,619a <core_bench_list+0x67e>
				} else if (qsize == 0 || !q) {
    60a0:	4782                	lw	a5,0(sp)
    60a2:	12078463          	beqz	a5,61ca <core_bench_list+0x6ae>
    60a6:	12028263          	beqz	t0,61ca <core_bench_list+0x6ae>
				} else if (cmp(p->info,q->info,res) <= 0) {
    60aa:	4492                	lw	s1,4(sp)
    60ac:	0042a083          	lw	ra,4(t0)
    60b0:	0044a303          	lw	t1,4(s1)
    60b4:	c606                	sw	ra,12(sp)
	ee_s16 data=*pdata;
    60b6:	00031403          	lh	s0,0(t1)
	if (optype) /* if cached, use cache */
    60ba:	08047713          	andi	a4,s0,128
		return (data & 0x007f);
    60be:	07f47493          	andi	s1,s0,127
	if (optype) /* if cached, use cache */
    60c2:	eb31                	bnez	a4,6116 <core_bench_list+0x5fa>
		ee_s16 dtype=((data>>3) & 0xf); /* bits 3-6 is specific data for the operation */
    60c4:	40345593          	srai	a1,s0,0x3
    60c8:	00f5f613          	andi	a2,a1,15
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    60cc:	00461693          	slli	a3,a2,0x4
		ee_s16 flag=data & 0x7; /* bits 0-2 is type of function to perform */
    60d0:	00747513          	andi	a0,s0,7
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    60d4:	00d664b3          	or	s1,a2,a3
		switch (flag) {
    60d8:	0383d583          	lhu	a1,56(t2)
    60dc:	1a050863          	beqz	a0,628c <core_bench_list+0x770>
    60e0:	4605                	li	a2,1
    60e2:	16c50e63          	beq	a0,a2,625e <core_bench_list+0x742>
    60e6:	01041513          	slli	a0,s0,0x10
    60ea:	8141                	srli	a0,a0,0x10
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    60ec:	84a2                	mv	s1,s0
    60ee:	ce1e                	sw	t2,28(sp)
    60f0:	cc16                	sw	t0,24(sp)
    60f2:	ca1a                	sw	t1,20(sp)
		res->crc=crcu16(retval,res->crc);
    60f4:	972ff0ef          	jal	ra,5266 <crcu16>
    60f8:	43f2                	lw	t2,28(sp)
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    60fa:	42d2                	lw	t0,20(sp)
		retval &= 0x007f;
    60fc:	07f4f493          	andi	s1,s1,127
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    6100:	f0047413          	andi	s0,s0,-256
    6104:	0084e6b3          	or	a3,s1,s0
		res->crc=crcu16(retval,res->crc);
    6108:	02a39c23          	sh	a0,56(t2)
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    610c:	0806e793          	ori	a5,a3,128
    6110:	00f29023          	sh	a5,0(t0)
    6114:	42e2                	lw	t0,24(sp)
	ee_s16 data=*pdata;
    6116:	40b2                	lw	ra,12(sp)
    6118:	00009303          	lh	t1,0(ra)
	if (optype) /* if cached, use cache */
    611c:	08037713          	andi	a4,t1,128
		return (data & 0x007f);
    6120:	07f37593          	andi	a1,t1,127
	if (optype) /* if cached, use cache */
    6124:	eb39                	bnez	a4,617a <core_bench_list+0x65e>
		ee_s16 dtype=((data>>3) & 0xf); /* bits 3-6 is specific data for the operation */
    6126:	40335593          	srai	a1,t1,0x3
    612a:	00f5f513          	andi	a0,a1,15
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    612e:	00451413          	slli	s0,a0,0x4
		ee_s16 flag=data & 0x7; /* bits 0-2 is type of function to perform */
    6132:	00737613          	andi	a2,t1,7
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    6136:	008566b3          	or	a3,a0,s0
		switch (flag) {
    613a:	0383d583          	lhu	a1,56(t2)
    613e:	ca71                	beqz	a2,6212 <core_bench_list+0x6f6>
    6140:	4505                	li	a0,1
    6142:	0aa60163          	beq	a2,a0,61e4 <core_bench_list+0x6c8>
    6146:	01031693          	slli	a3,t1,0x10
    614a:	0106d513          	srli	a0,a3,0x10
		dtype |= dtype << 4; /* replicate the lower 4 bits to get an 8b value */
    614e:	841a                	mv	s0,t1
    6150:	ce1e                	sw	t2,28(sp)
    6152:	cc16                	sw	t0,24(sp)
    6154:	ca1a                	sw	t1,20(sp)
		res->crc=crcu16(retval,res->crc);
    6156:	910ff0ef          	jal	ra,5266 <crcu16>
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    615a:	42d2                	lw	t0,20(sp)
		res->crc=crcu16(retval,res->crc);
    615c:	43f2                	lw	t2,28(sp)
		retval &= 0x007f;
    615e:	07f47593          	andi	a1,s0,127
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    6162:	f002f793          	andi	a5,t0,-256
    6166:	4432                	lw	s0,12(sp)
    6168:	00f5e733          	or	a4,a1,a5
    616c:	42e2                	lw	t0,24(sp)
		res->crc=crcu16(retval,res->crc);
    616e:	02a39c23          	sh	a0,56(t2)
		*pdata = (data & 0xff00) | 0x0080 | retval; /* cache the result */
    6172:	08076513          	ori	a0,a4,128
    6176:	00a41023          	sh	a0,0(s0)
	return val1 - val2;
    617a:	8c8d                	sub	s1,s1,a1
				} else if (cmp(p->info,q->info,res) <= 0) {
    617c:	04905763          	blez	s1,61ca <core_bench_list+0x6ae>
				    e = q; q = q->next; qsize--;
    6180:	4402                	lw	s0,0(sp)
    6182:	8616                	mv	a2,t0
    6184:	0002a283          	lw	t0,0(t0)
    6188:	fff40093          	addi	ra,s0,-1
    618c:	c006                	sw	ra,0(sp)
				if (tail) {
    618e:	4742                	lw	a4,16(sp)
    6190:	cb15                	beqz	a4,61c4 <core_bench_list+0x6a8>
				    tail->next = e;
    6192:	c310                	sw	a2,0(a4)
				    list = e;
    6194:	c832                	sw	a2,16(sp)
            while (psize > 0 || (qsize > 0 && q)) {
    6196:	45a2                	lw	a1,8(sp)
    6198:	f581                	bnez	a1,60a0 <core_bench_list+0x584>
    619a:	4402                	lw	s0,0(sp)
    619c:	c021                	beqz	s0,61dc <core_bench_list+0x6c0>
    619e:	fe0292e3          	bnez	t0,6182 <core_bench_list+0x666>
	    tail->next = NULL;
    61a2:	4542                	lw	a0,16(sp)
        if (nmerges <= 1)   /* allow for nmerges==0, the empty list case */
    61a4:	5322                	lw	t1,40(sp)
    61a6:	4685                	li	a3,1
	    tail->next = NULL;
    61a8:	00052023          	sw	zero,0(a0)
        if (nmerges <= 1)   /* allow for nmerges==0, the empty list case */
    61ac:	12d30663          	beq	t1,a3,62d8 <core_bench_list+0x7bc>
        insize *= 2;
    61b0:	5702                	lw	a4,32(sp)
        while (p) {
    61b2:	5792                	lw	a5,36(sp)
        insize *= 2;
    61b4:	00171093          	slli	ra,a4,0x1
    61b8:	d006                	sw	ra,32(sp)
        while (p) {
    61ba:	de0794e3          	bnez	a5,5fa2 <core_bench_list+0x486>
	    tail->next = NULL;
    61be:	00002023          	sw	zero,0(zero) # 0 <Reset_Handler>
    61c2:	9002                	ebreak
				    list = e;
    61c4:	d232                	sw	a2,36(sp)
    61c6:	c832                	sw	a2,16(sp)
    61c8:	b7f9                	j	6196 <core_bench_list+0x67a>
				    e = p; p = p->next; psize--;
    61ca:	4592                	lw	a1,4(sp)
    61cc:	4322                	lw	t1,8(sp)
    61ce:	419c                	lw	a5,0(a1)
    61d0:	fff30693          	addi	a3,t1,-1
    61d4:	c436                	sw	a3,8(sp)
    61d6:	862e                	mv	a2,a1
    61d8:	c23e                	sw	a5,4(sp)
    61da:	bf55                	j	618e <core_bench_list+0x672>
    61dc:	c216                	sw	t0,4(sp)
        while (p) {
    61de:	dc029ae3          	bnez	t0,5fb2 <core_bench_list+0x496>
    61e2:	b7c1                	j	61a2 <core_bench_list+0x686>
				retval=core_bench_matrix(&(res->mat),dtype,res->crc);
    61e4:	5532                	lw	a0,44(sp)
    61e6:	862e                	mv	a2,a1
    61e8:	85b6                	mv	a1,a3
    61ea:	ce1e                	sw	t2,28(sp)
    61ec:	cc16                	sw	t0,24(sp)
    61ee:	ca1a                	sw	t1,20(sp)
    61f0:	809fd0ef          	jal	ra,39f8 <core_bench_matrix>
				if (res->crcmatrix==0)
    61f4:	43f2                	lw	t2,28(sp)
				retval=core_bench_matrix(&(res->mat),dtype,res->crc);
    61f6:	01051313          	slli	t1,a0,0x10
    61fa:	41035413          	srai	s0,t1,0x10
				if (res->crcmatrix==0)
    61fe:	03c3d603          	lhu	a2,60(t2)
    6202:	4352                	lw	t1,20(sp)
    6204:	42e2                	lw	t0,24(sp)
    6206:	e219                	bnez	a2,620c <core_bench_list+0x6f0>
					res->crcmatrix=retval;
    6208:	02a39e23          	sh	a0,60(t2)
    620c:	0383d583          	lhu	a1,56(t2)
    6210:	b781                	j	6150 <core_bench_list+0x634>
				retval=core_bench_state(res->size,res->memblock[3],res->seed1,res->seed2,dtype,res->crc);
    6212:	02200793          	li	a5,34
    6216:	80b6                	mv	ra,a3
    6218:	00f6d463          	ble	a5,a3,6220 <core_bench_list+0x704>
    621c:	02200093          	li	ra,34
    6220:	87ae                	mv	a5,a1
    6222:	00239683          	lh	a3,2(t2)
    6226:	00039603          	lh	a2,0(t2)
    622a:	0143a583          	lw	a1,20(t2)
    622e:	0183a503          	lw	a0,24(t2)
    6232:	0ff0f713          	andi	a4,ra,255
    6236:	ce16                	sw	t0,28(sp)
    6238:	cc1a                	sw	t1,24(sp)
    623a:	ca1e                	sw	t2,20(sp)
    623c:	8f2fc0ef          	jal	ra,232e <core_bench_state>
    6240:	01051393          	slli	t2,a0,0x10
    6244:	4103d413          	srai	s0,t2,0x10
				if (res->crcstate==0)
    6248:	43d2                	lw	t2,20(sp)
    624a:	4362                	lw	t1,24(sp)
    624c:	42f2                	lw	t0,28(sp)
    624e:	03e3d703          	lhu	a4,62(t2)
    6252:	ff4d                	bnez	a4,620c <core_bench_list+0x6f0>
					res->crcstate=retval;
    6254:	02a39f23          	sh	a0,62(t2)
    6258:	0383d583          	lhu	a1,56(t2)
    625c:	bdd5                	j	6150 <core_bench_list+0x634>
				retval=core_bench_matrix(&(res->mat),dtype,res->crc);
    625e:	5532                	lw	a0,44(sp)
    6260:	862e                	mv	a2,a1
    6262:	85a6                	mv	a1,s1
    6264:	ce1e                	sw	t2,28(sp)
    6266:	cc16                	sw	t0,24(sp)
    6268:	ca1a                	sw	t1,20(sp)
    626a:	f8efd0ef          	jal	ra,39f8 <core_bench_matrix>
    626e:	01051393          	slli	t2,a0,0x10
    6272:	4103d493          	srai	s1,t2,0x10
				if (res->crcmatrix==0)
    6276:	43f2                	lw	t2,28(sp)
    6278:	4352                	lw	t1,20(sp)
    627a:	42e2                	lw	t0,24(sp)
    627c:	03c3d583          	lhu	a1,60(t2)
    6280:	e199                	bnez	a1,6286 <core_bench_list+0x76a>
					res->crcmatrix=retval;
    6282:	02a39e23          	sh	a0,60(t2)
    6286:	0383d583          	lhu	a1,56(t2)
    628a:	b595                	j	60ee <core_bench_list+0x5d2>
				retval=core_bench_state(res->size,res->memblock[3],res->seed1,res->seed2,dtype,res->crc);
    628c:	02200793          	li	a5,34
    6290:	80a6                	mv	ra,s1
    6292:	00f4d463          	ble	a5,s1,629a <core_bench_list+0x77e>
    6296:	02200093          	li	ra,34
    629a:	87ae                	mv	a5,a1
    629c:	00239683          	lh	a3,2(t2)
    62a0:	00039603          	lh	a2,0(t2)
    62a4:	0143a583          	lw	a1,20(t2)
    62a8:	0183a503          	lw	a0,24(t2)
    62ac:	0ff0f713          	andi	a4,ra,255
    62b0:	ce16                	sw	t0,28(sp)
    62b2:	cc1a                	sw	t1,24(sp)
    62b4:	ca1e                	sw	t2,20(sp)
    62b6:	878fc0ef          	jal	ra,232e <core_bench_state>
				if (res->crcstate==0)
    62ba:	43d2                	lw	t2,20(sp)
				retval=core_bench_state(res->size,res->memblock[3],res->seed1,res->seed2,dtype,res->crc);
    62bc:	01051293          	slli	t0,a0,0x10
    62c0:	4102d493          	srai	s1,t0,0x10
				if (res->crcstate==0)
    62c4:	03e3d703          	lhu	a4,62(t2)
    62c8:	4362                	lw	t1,24(sp)
    62ca:	42f2                	lw	t0,28(sp)
    62cc:	ff4d                	bnez	a4,6286 <core_bench_list+0x76a>
					res->crcstate=retval;
    62ce:	02a39f23          	sh	a0,62(t2)
    62d2:	0383d583          	lhu	a1,56(t2)
    62d6:	bd21                	j	60ee <core_bench_list+0x5d2>
    62d8:	5392                	lw	t2,36(sp)
    62da:	b279                	j	5c68 <core_bench_list+0x14c>
    62dc:	5542                	lw	a0,48(sp)
    62de:	b169                	j	5f68 <core_bench_list+0x44c>
			retval+=(list->next->info->data16 >> 8) & 1;
    62e0:	00002783          	lw	a5,0(zero) # 0 <Reset_Handler>
    62e4:	9002                	ebreak

000062e6 <core_list_init>:
list_head *core_list_init(ee_u32 blksize, list_head *memblock, ee_s16 seed) {
    62e6:	1111                	addi	sp,sp,-28
    62e8:	ca26                	sw	s1,20(sp)
	ee_u32 size=(blksize/per_item)-2; /* to accomodate systems with 64b pointers, and make sure same code is executed, set max list elements */
    62ea:	44d1                	li	s1,20
    62ec:	029552b3          	divu	t0,a0,s1
list_head *core_list_init(ee_u32 blksize, list_head *memblock, ee_s16 seed) {
    62f0:	cc22                	sw	s0,24(sp)
    62f2:	c02e                	sw	a1,0(sp)
    62f4:	842e                	mv	s0,a1
    62f6:	c432                	sw	a2,8(sp)
	list->info->data16=(ee_s16)0x8080;
    62f8:	7661                	lui	a2,0xffff8
	list->next=NULL;
    62fa:	00042023          	sw	zero,0(s0)
	list->info->data16=(ee_s16)0x8080;
    62fe:	08060793          	addi	a5,a2,128 # ffff8080 <__heap_end+0xdff78080>
	if ((*memblock+1) >= memblock_end)
    6302:	01040713          	addi	a4,s0,16
	ee_u32 size=(blksize/per_item)-2; /* to accomodate systems with 64b pointers, and make sure same code is executed, set max list elements */
    6306:	ffe28493          	addi	s1,t0,-2
	list_head *memblock_end=memblock+size;
    630a:	00349593          	slli	a1,s1,0x3
    630e:	95a2                	add	a1,a1,s0
	list->info=datablock;
    6310:	c04c                	sw	a1,4(s0)
	list_data *datablock_end=datablock+size;
    6312:	00249313          	slli	t1,s1,0x2
	list->info->data16=(ee_s16)0x8080;
    6316:	00f59023          	sh	a5,0(a1)
	list->info->idx=0x0000;
    631a:	00059123          	sh	zero,2(a1)
	list_data *datablock_end=datablock+size;
    631e:	932e                	add	t1,t1,a1
	memblock++;
    6320:	00840793          	addi	a5,s0,8
	datablock++;
    6324:	00458513          	addi	a0,a1,4
	if ((*memblock+1) >= memblock_end)
    6328:	3eb77b63          	bleu	a1,a4,671e <core_list_init+0x438>
	if ((*datablock+1) >= datablock_end)
    632c:	00858693          	addi	a3,a1,8
    6330:	3e66f763          	bleu	t1,a3,671e <core_list_init+0x438>
	newitem->next=insert_point->next;
    6334:	00042423          	sw	zero,8(s0)
	insert_point->next=newitem;
    6338:	c01c                	sw	a5,0(s0)
	newitem->info=*datablock;
    633a:	c448                	sw	a0,12(s0)
	to->data16=from->data16;
    633c:	53fd                	li	t2,-1
	to->idx=from->idx;
    633e:	fff64413          	not	s0,a2
	to->data16=from->data16;
    6342:	00759223          	sh	t2,4(a1)
	to->idx=from->idx;
    6346:	00859323          	sh	s0,6(a1)
	for (i=0; i<size; i++) {
    634a:	22048f63          	beqz	s1,6588 <core_list_init+0x2a2>
    634e:	00815283          	lhu	t0,8(sp)
	to->idx=from->idx;
    6352:	7561                	lui	a0,0xffff8
    6354:	fff54393          	not	t2,a0
    6358:	c816                	sw	t0,16(sp)
    635a:	00711323          	sh	t2,6(sp)
    635e:	0034f413          	andi	s0,s1,3
	for (i=0; i<size; i++) {
    6362:	4601                	li	a2,0
    6364:	c46d                	beqz	s0,644e <core_list_init+0x168>
    6366:	4285                	li	t0,1
    6368:	08540b63          	beq	s0,t0,63fe <core_list_init+0x118>
    636c:	4509                	li	a0,2
    636e:	04a40163          	beq	s0,a0,63b0 <core_list_init+0xca>
	if ((*memblock+1) >= memblock_end)
    6372:	00870393          	addi	t2,a4,8
    6376:	02b3fc63          	bleu	a1,t2,63ae <core_list_init+0xc8>
	if ((*datablock+1) >= datablock_end)
    637a:	00468413          	addi	s0,a3,4
    637e:	02647863          	bleu	t1,s0,63ae <core_list_init+0xc8>
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6382:	4642                	lw	a2,16(sp)
	newitem->next=insert_point->next;
    6384:	c31c                	sw	a5,0(a4)
	insert_point->next=newitem;
    6386:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6388:	00361293          	slli	t0,a2,0x3
    638c:	0782f513          	andi	a0,t0,120
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6390:	00851613          	slli	a2,a0,0x8
    6394:	00a662b3          	or	t0,a2,a0
	to->idx=from->idx;
    6398:	00615503          	lhu	a0,6(sp)
	insert_point->next=newitem;
    639c:	c398                	sw	a4,0(a5)
	newitem->info=*datablock;
    639e:	c354                	sw	a3,4(a4)
	to->data16=from->data16;
    63a0:	00569023          	sh	t0,0(a3)
	to->idx=from->idx;
    63a4:	00a69123          	sh	a0,2(a3)
    63a8:	87ba                	mv	a5,a4
    63aa:	86a2                	mv	a3,s0
    63ac:	871e                	mv	a4,t2
	for (i=0; i<size; i++) {
    63ae:	4605                	li	a2,1
	if ((*memblock+1) >= memblock_end)
    63b0:	00870393          	addi	t2,a4,8
    63b4:	04b3f463          	bleu	a1,t2,63fc <core_list_init+0x116>
	if ((*datablock+1) >= datablock_end)
    63b8:	00468413          	addi	s0,a3,4
    63bc:	04647063          	bleu	t1,s0,63fc <core_list_init+0x116>
    63c0:	01061293          	slli	t0,a2,0x10
    63c4:	0102d513          	srli	a0,t0,0x10
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    63c8:	42c2                	lw	t0,16(sp)
	newitem->next=insert_point->next;
    63ca:	c31c                	sw	a5,0(a4)
	insert_point->next=newitem;
    63cc:	4782                	lw	a5,0(sp)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    63ce:	005542b3          	xor	t0,a0,t0
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    63d2:	028e                	slli	t0,t0,0x3
    63d4:	891d                	andi	a0,a0,7
    63d6:	0782f293          	andi	t0,t0,120
	insert_point->next=newitem;
    63da:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    63dc:	00a2e2b3          	or	t0,t0,a0
	to->idx=from->idx;
    63e0:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    63e4:	00829513          	slli	a0,t0,0x8
	newitem->info=*datablock;
    63e8:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    63ea:	005562b3          	or	t0,a0,t0
	to->idx=from->idx;
    63ee:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    63f2:	00569023          	sh	t0,0(a3)
	to->idx=from->idx;
    63f6:	87ba                	mv	a5,a4
    63f8:	86a2                	mv	a3,s0
    63fa:	871e                	mv	a4,t2
	for (i=0; i<size; i++) {
    63fc:	0605                	addi	a2,a2,1
	if ((*memblock+1) >= memblock_end)
    63fe:	00870393          	addi	t2,a4,8
    6402:	04b3f363          	bleu	a1,t2,6448 <core_list_init+0x162>
	if ((*datablock+1) >= datablock_end)
    6406:	00468413          	addi	s0,a3,4
    640a:	02647f63          	bleu	t1,s0,6448 <core_list_init+0x162>
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    640e:	42c2                	lw	t0,16(sp)
    6410:	01061513          	slli	a0,a2,0x10
    6414:	8141                	srli	a0,a0,0x10
	newitem->next=insert_point->next;
    6416:	c31c                	sw	a5,0(a4)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    6418:	005542b3          	xor	t0,a0,t0
	insert_point->next=newitem;
    641c:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    641e:	028e                	slli	t0,t0,0x3
    6420:	891d                	andi	a0,a0,7
    6422:	0782f293          	andi	t0,t0,120
	insert_point->next=newitem;
    6426:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6428:	00a2e2b3          	or	t0,t0,a0
	to->idx=from->idx;
    642c:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6430:	00829513          	slli	a0,t0,0x8
	newitem->info=*datablock;
    6434:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6436:	005562b3          	or	t0,a0,t0
	to->idx=from->idx;
    643a:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    643e:	00569023          	sh	t0,0(a3)
	to->idx=from->idx;
    6442:	87ba                	mv	a5,a4
    6444:	86a2                	mv	a3,s0
    6446:	871e                	mv	a4,t2
	for (i=0; i<size; i++) {
    6448:	0605                	addi	a2,a2,1
    644a:	12c48f63          	beq	s1,a2,6588 <core_list_init+0x2a2>
    644e:	c626                	sw	s1,12(sp)
    6450:	44c2                	lw	s1,16(sp)
	if ((*memblock+1) >= memblock_end)
    6452:	00870393          	addi	t2,a4,8
    6456:	04b3f263          	bleu	a1,t2,649a <core_list_init+0x1b4>
	if ((*datablock+1) >= datablock_end)
    645a:	00468413          	addi	s0,a3,4
    645e:	02647e63          	bleu	t1,s0,649a <core_list_init+0x1b4>
    6462:	01061513          	slli	a0,a2,0x10
    6466:	8141                	srli	a0,a0,0x10
	newitem->next=insert_point->next;
    6468:	c31c                	sw	a5,0(a4)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    646a:	009542b3          	xor	t0,a0,s1
	insert_point->next=newitem;
    646e:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6470:	028e                	slli	t0,t0,0x3
    6472:	0782f293          	andi	t0,t0,120
    6476:	891d                	andi	a0,a0,7
	insert_point->next=newitem;
    6478:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    647a:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    647e:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6482:	00851293          	slli	t0,a0,0x8
	newitem->info=*datablock;
    6486:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6488:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    648c:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    6490:	00a69023          	sh	a0,0(a3)
	to->idx=from->idx;
    6494:	87ba                	mv	a5,a4
    6496:	86a2                	mv	a3,s0
    6498:	871e                	mv	a4,t2
	if ((*memblock+1) >= memblock_end)
    649a:	00870393          	addi	t2,a4,8
	for (i=0; i<size; i++) {
    649e:	0605                	addi	a2,a2,1
	if ((*memblock+1) >= memblock_end)
    64a0:	04b3f363          	bleu	a1,t2,64e6 <core_list_init+0x200>
	if ((*datablock+1) >= datablock_end)
    64a4:	00468413          	addi	s0,a3,4
    64a8:	02647f63          	bleu	t1,s0,64e6 <core_list_init+0x200>
    64ac:	01061293          	slli	t0,a2,0x10
    64b0:	0102d513          	srli	a0,t0,0x10
	newitem->next=insert_point->next;
    64b4:	c31c                	sw	a5,0(a4)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    64b6:	009542b3          	xor	t0,a0,s1
	insert_point->next=newitem;
    64ba:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    64bc:	028e                	slli	t0,t0,0x3
    64be:	0782f293          	andi	t0,t0,120
    64c2:	891d                	andi	a0,a0,7
	insert_point->next=newitem;
    64c4:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    64c6:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    64ca:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    64ce:	00851293          	slli	t0,a0,0x8
	newitem->info=*datablock;
    64d2:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    64d4:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    64d8:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    64dc:	00a69023          	sh	a0,0(a3)
	to->idx=from->idx;
    64e0:	87ba                	mv	a5,a4
    64e2:	86a2                	mv	a3,s0
    64e4:	871e                	mv	a4,t2
	if ((*memblock+1) >= memblock_end)
    64e6:	00870393          	addi	t2,a4,8
	for (i=0; i<size; i++) {
    64ea:	00160293          	addi	t0,a2,1
	if ((*memblock+1) >= memblock_end)
    64ee:	04b3f263          	bleu	a1,t2,6532 <core_list_init+0x24c>
	if ((*datablock+1) >= datablock_end)
    64f2:	00468413          	addi	s0,a3,4
    64f6:	02647e63          	bleu	t1,s0,6532 <core_list_init+0x24c>
    64fa:	01029513          	slli	a0,t0,0x10
    64fe:	8141                	srli	a0,a0,0x10
	newitem->next=insert_point->next;
    6500:	c31c                	sw	a5,0(a4)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    6502:	009542b3          	xor	t0,a0,s1
	insert_point->next=newitem;
    6506:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6508:	028e                	slli	t0,t0,0x3
    650a:	0782f293          	andi	t0,t0,120
    650e:	891d                	andi	a0,a0,7
	insert_point->next=newitem;
    6510:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6512:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    6516:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    651a:	00851293          	slli	t0,a0,0x8
	newitem->info=*datablock;
    651e:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6520:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    6524:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    6528:	00a69023          	sh	a0,0(a3)
	to->idx=from->idx;
    652c:	87ba                	mv	a5,a4
    652e:	86a2                	mv	a3,s0
    6530:	871e                	mv	a4,t2
	if ((*memblock+1) >= memblock_end)
    6532:	00870393          	addi	t2,a4,8
	for (i=0; i<size; i++) {
    6536:	00260293          	addi	t0,a2,2
	if ((*memblock+1) >= memblock_end)
    653a:	04b3f263          	bleu	a1,t2,657e <core_list_init+0x298>
	if ((*datablock+1) >= datablock_end)
    653e:	00468413          	addi	s0,a3,4
    6542:	02647e63          	bleu	t1,s0,657e <core_list_init+0x298>
    6546:	01029513          	slli	a0,t0,0x10
    654a:	8141                	srli	a0,a0,0x10
	newitem->next=insert_point->next;
    654c:	c31c                	sw	a5,0(a4)
		ee_u16 datpat=((ee_u16)(seed^i) & 0xf);
    654e:	009542b3          	xor	t0,a0,s1
	insert_point->next=newitem;
    6552:	4782                	lw	a5,0(sp)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    6554:	028e                	slli	t0,t0,0x3
    6556:	0782f293          	andi	t0,t0,120
    655a:	891d                	andi	a0,a0,7
	insert_point->next=newitem;
    655c:	c398                	sw	a4,0(a5)
		ee_u16 dat=(datpat<<3) | (i&0x7); /* alternate between algorithms */
    655e:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    6562:	00615783          	lhu	a5,6(sp)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    6566:	00851293          	slli	t0,a0,0x8
	newitem->info=*datablock;
    656a:	c354                	sw	a3,4(a4)
		info.data16=(dat<<8) | dat;		/* fill the data with actual data and upper bits with rebuild value */
    656c:	00a2e533          	or	a0,t0,a0
	to->idx=from->idx;
    6570:	00f69123          	sh	a5,2(a3)
	to->data16=from->data16;
    6574:	00a69023          	sh	a0,0(a3)
	to->idx=from->idx;
    6578:	87ba                	mv	a5,a4
    657a:	86a2                	mv	a3,s0
    657c:	871e                	mv	a4,t2
	for (i=0; i<size; i++) {
    657e:	43b2                	lw	t2,12(sp)
    6580:	060d                	addi	a2,a2,3
    6582:	ecc398e3          	bne	t2,a2,6452 <core_list_init+0x16c>
    6586:	849e                	mv	s1,t2
	while (finder->next!=NULL) {
    6588:	438c                	lw	a1,0(a5)
    658a:	c18d                	beqz	a1,65ac <core_list_init+0x2c6>
		if (i<size/5) /* first 20% of the list in order */
    658c:	4315                	li	t1,5
    658e:	0264d2b3          	divu	t0,s1,t1
			finder->info->idx=0x3fff & (((i & 0x07) << 8) | pat); /* make sure the mixed items end up after the ones in sequence */
    6592:	6411                	lui	s0,0x4
		if (i<size/5) /* first 20% of the list in order */
    6594:	4685                	li	a3,1
			finder->info->idx=0x3fff & (((i & 0x07) << 8) | pat); /* make sure the mixed items end up after the ones in sequence */
    6596:	fff40393          	addi	t2,s0,-1 # 3fff <core_bench_matrix+0x607>
		if (i<size/5) /* first 20% of the list in order */
    659a:	43c8                	lw	a0,4(a5)
    659c:	1456f363          	bleu	t0,a3,66e2 <core_list_init+0x3fc>
		finder=finder->next;
    65a0:	439c                	lw	a5,0(a5)
			finder->info->idx=i++;
    65a2:	00d51123          	sh	a3,2(a0) # ffff8002 <__heap_end+0xdff78002>
		finder=finder->next;
    65a6:	0685                	addi	a3,a3,1
	while (finder->next!=NULL) {
    65a8:	438c                	lw	a1,0(a5)
    65aa:	f9e5                	bnez	a1,659a <core_list_init+0x2b4>
    insize = 1;
    65ac:	4505                	li	a0,1
    65ae:	4702                	lw	a4,0(sp)
        tail = NULL;
    65b0:	4301                	li	t1,0
        list = NULL;
    65b2:	c002                	sw	zero,0(sp)
        nmerges = 0;  /* count number of merges we do in this pass */
    65b4:	4481                	li	s1,0
            nmerges++;  /* there exists a merge to be done */
    65b6:	00757293          	andi	t0,a0,7
    65ba:	0485                	addi	s1,s1,1
    65bc:	87ba                	mv	a5,a4
            psize = 0;
    65be:	4681                	li	a3,0
    65c0:	04028b63          	beqz	t0,6616 <core_list_init+0x330>
    65c4:	4385                	li	t2,1
    65c6:	04728363          	beq	t0,t2,660c <core_list_init+0x326>
    65ca:	4409                	li	s0,2
    65cc:	02828d63          	beq	t0,s0,6606 <core_list_init+0x320>
    65d0:	460d                	li	a2,3
    65d2:	02c28763          	beq	t0,a2,6600 <core_list_init+0x31a>
    65d6:	4591                	li	a1,4
    65d8:	02b28163          	beq	t0,a1,65fa <core_list_init+0x314>
    65dc:	4395                	li	t2,5
    65de:	00728b63          	beq	t0,t2,65f4 <core_list_init+0x30e>
    65e2:	4419                	li	s0,6
    65e4:	00828563          	beq	t0,s0,65ee <core_list_init+0x308>
			    q = q->next;
    65e8:	431c                	lw	a5,0(a4)
                psize++;
    65ea:	4685                	li	a3,1
                if (!q) break;
    65ec:	c7a5                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    65ee:	439c                	lw	a5,0(a5)
                psize++;
    65f0:	0685                	addi	a3,a3,1
                if (!q) break;
    65f2:	c3ad                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    65f4:	439c                	lw	a5,0(a5)
                psize++;
    65f6:	0685                	addi	a3,a3,1
                if (!q) break;
    65f8:	cfb1                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    65fa:	439c                	lw	a5,0(a5)
                psize++;
    65fc:	0685                	addi	a3,a3,1
                if (!q) break;
    65fe:	cbb9                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    6600:	439c                	lw	a5,0(a5)
                psize++;
    6602:	0685                	addi	a3,a3,1
                if (!q) break;
    6604:	cba1                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    6606:	439c                	lw	a5,0(a5)
                psize++;
    6608:	0685                	addi	a3,a3,1
                if (!q) break;
    660a:	c7a9                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    660c:	439c                	lw	a5,0(a5)
                psize++;
    660e:	0685                	addi	a3,a3,1
                if (!q) break;
    6610:	c3b1                	beqz	a5,6654 <core_list_init+0x36e>
            for (i = 0; i < insize; i++) {
    6612:	04a68163          	beq	a3,a0,6654 <core_list_init+0x36e>
			    q = q->next;
    6616:	439c                	lw	a5,0(a5)
                psize++;
    6618:	0685                	addi	a3,a3,1
    661a:	82b6                	mv	t0,a3
                if (!q) break;
    661c:	cf85                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    661e:	439c                	lw	a5,0(a5)
                psize++;
    6620:	0685                	addi	a3,a3,1
                if (!q) break;
    6622:	cb8d                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    6624:	439c                	lw	a5,0(a5)
                psize++;
    6626:	00228693          	addi	a3,t0,2
                if (!q) break;
    662a:	c78d                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    662c:	439c                	lw	a5,0(a5)
                psize++;
    662e:	00328693          	addi	a3,t0,3
                if (!q) break;
    6632:	c38d                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    6634:	439c                	lw	a5,0(a5)
                psize++;
    6636:	00428693          	addi	a3,t0,4
                if (!q) break;
    663a:	cf89                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    663c:	439c                	lw	a5,0(a5)
                psize++;
    663e:	00528693          	addi	a3,t0,5
                if (!q) break;
    6642:	cb89                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    6644:	439c                	lw	a5,0(a5)
                psize++;
    6646:	00628693          	addi	a3,t0,6
                if (!q) break;
    664a:	c789                	beqz	a5,6654 <core_list_init+0x36e>
			    q = q->next;
    664c:	439c                	lw	a5,0(a5)
                psize++;
    664e:	00728693          	addi	a3,t0,7
                if (!q) break;
    6652:	f3e1                	bnez	a5,6612 <core_list_init+0x32c>
				    list = e;
    6654:	863a                	mv	a2,a4
    6656:	85aa                	mv	a1,a0
    6658:	873e                	mv	a4,a5
            while (psize > 0 || (qsize > 0 && q)) {
    665a:	cea1                	beqz	a3,66b2 <core_list_init+0x3cc>
				} else if (qsize == 0 || !q) {
    665c:	cda5                	beqz	a1,66d4 <core_list_init+0x3ee>
    665e:	cb3d                	beqz	a4,66d4 <core_list_init+0x3ee>
				} else if (cmp(p->info,q->info,res) <= 0) {
    6660:	00462383          	lw	t2,4(a2)
    6664:	00472283          	lw	t0,4(a4)
		a->data16 = (a->data16 & 0xff00) | (0x00ff & (a->data16>>8));
    6668:	00039783          	lh	a5,0(t2)
    666c:	f007f413          	andi	s0,a5,-256
    6670:	07c2                	slli	a5,a5,0x10
    6672:	83c1                	srli	a5,a5,0x10
    6674:	83a1                	srli	a5,a5,0x8
    6676:	8c5d                	or	s0,s0,a5
    6678:	00839023          	sh	s0,0(t2)
		b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16>>8));
    667c:	00029783          	lh	a5,0(t0)
	return a->idx - b->idx;
    6680:	00239383          	lh	t2,2(t2)
		b->data16 = (b->data16 & 0xff00) | (0x00ff & (b->data16>>8));
    6684:	f007f413          	andi	s0,a5,-256
    6688:	07c2                	slli	a5,a5,0x10
    668a:	83c1                	srli	a5,a5,0x10
    668c:	83a1                	srli	a5,a5,0x8
    668e:	8c5d                	or	s0,s0,a5
    6690:	00829023          	sh	s0,0(t0)
	return a->idx - b->idx;
    6694:	00229283          	lh	t0,2(t0)
    6698:	405387b3          	sub	a5,t2,t0
				} else if (cmp(p->info,q->info,res) <= 0) {
    669c:	02f05c63          	blez	a5,66d4 <core_list_init+0x3ee>
				    e = q; q = q->next; qsize--;
    66a0:	843a                	mv	s0,a4
    66a2:	4318                	lw	a4,0(a4)
    66a4:	15fd                	addi	a1,a1,-1
				if (tail) {
    66a6:	02030463          	beqz	t1,66ce <core_list_init+0x3e8>
				    tail->next = e;
    66aa:	00832023          	sw	s0,0(t1)
				    list = e;
    66ae:	8322                	mv	t1,s0
            while (psize > 0 || (qsize > 0 && q)) {
    66b0:	f6d5                	bnez	a3,665c <core_list_init+0x376>
    66b2:	c58d                	beqz	a1,66dc <core_list_init+0x3f6>
    66b4:	f775                	bnez	a4,66a0 <core_list_init+0x3ba>
	    tail->next = NULL;
    66b6:	00032023          	sw	zero,0(t1)
        if (nmerges <= 1)   /* allow for nmerges==0, the empty list case */
    66ba:	4305                	li	t1,1
    66bc:	04648c63          	beq	s1,t1,6714 <core_list_init+0x42e>
        while (p) {
    66c0:	4702                	lw	a4,0(sp)
        insize *= 2;
    66c2:	0506                	slli	a0,a0,0x1
        while (p) {
    66c4:	ee0715e3          	bnez	a4,65ae <core_list_init+0x2c8>
	    tail->next = NULL;
    66c8:	00002023          	sw	zero,0(zero) # 0 <Reset_Handler>
    66cc:	9002                	ebreak
				    list = e;
    66ce:	c022                	sw	s0,0(sp)
    66d0:	8322                	mv	t1,s0
    66d2:	bff9                	j	66b0 <core_list_init+0x3ca>
				    e = p; p = p->next; psize--;
    66d4:	8432                	mv	s0,a2
    66d6:	16fd                	addi	a3,a3,-1
    66d8:	4210                	lw	a2,0(a2)
    66da:	b7f1                	j	66a6 <core_list_init+0x3c0>
        while (p) {
    66dc:	ec071de3          	bnez	a4,65b6 <core_list_init+0x2d0>
    66e0:	bfd9                	j	66b6 <core_list_init+0x3d0>
			ee_u16 pat=(ee_u16)(i++ ^ seed); /* get a pseudo random number */
    66e2:	01069713          	slli	a4,a3,0x10
    66e6:	01075613          	srli	a2,a4,0x10
    66ea:	4422                	lw	s0,8(sp)
			finder->info->idx=0x3fff & (((i & 0x07) << 8) | pat); /* make sure the mixed items end up after the ones in sequence */
    66ec:	00160493          	addi	s1,a2,1
    66f0:	00849593          	slli	a1,s1,0x8
    66f4:	7005f313          	andi	t1,a1,1792
			ee_u16 pat=(ee_u16)(i++ ^ seed); /* get a pseudo random number */
    66f8:	00864733          	xor	a4,a2,s0
		finder=finder->next;
    66fc:	439c                	lw	a5,0(a5)
			finder->info->idx=0x3fff & (((i & 0x07) << 8) | pat); /* make sure the mixed items end up after the ones in sequence */
    66fe:	00e36633          	or	a2,t1,a4
    6702:	007674b3          	and	s1,a2,t2
    6706:	00951123          	sh	s1,2(a0)
	while (finder->next!=NULL) {
    670a:	4388                	lw	a0,0(a5)
    670c:	0685                	addi	a3,a3,1
    670e:	e80516e3          	bnez	a0,659a <core_list_init+0x2b4>
    6712:	bd69                	j	65ac <core_list_init+0x2c6>
}
    6714:	4462                	lw	s0,24(sp)
    6716:	4502                	lw	a0,0(sp)
    6718:	44d2                	lw	s1,20(sp)
    671a:	0171                	addi	sp,sp,28
    671c:	8082                	ret
	memblock++;
    671e:	873e                	mv	a4,a5
	datablock++;
    6720:	86aa                	mv	a3,a0
	if ((*datablock+1) >= datablock_end)
    6722:	4781                	li	a5,0
    6724:	b11d                	j	634a <core_list_init+0x64>
	...
