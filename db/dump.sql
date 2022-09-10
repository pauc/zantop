--
-- PostgreSQL database dump
--

-- Dumped from database version 13.4
-- Dumped by pg_dump version 13.8 (Ubuntu 13.8-1.pgdg22.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: action_text_rich_texts; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.action_text_rich_texts (id, name, body, record_type, record_id, created_at, updated_at) FROM stdin;
\.


--
-- Data for Name: active_storage_blobs; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.active_storage_blobs (id, key, filename, content_type, metadata, service_name, byte_size, checksum, created_at) FROM stdin;
722	iookpykpzy0sxm312uxo6lshcuna	DSC05616bona.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	235642	OeeOlD9exa17swU5Z47yVA==	2022-07-03 01:36:20.16183
723	c6i233sfa3qbnnoj49bwrosom3tg	100_0602.JPG	image/jpeg	{"identified":true,"width":1004,"height":900,"analyzed":true}	local	78250	ToiANb9ydTQTVoDbhxk9PQ==	2022-07-03 01:36:20.50463
724	oojy23sbk13ygsfzox2zj2viyyua	100_0591.JPG	image/jpeg	{"identified":true,"width":1200,"height":695,"analyzed":true}	local	86959	+kR/FUdhi+9wSKA3Z+o79g==	2022-07-03 01:36:20.819541
725	0kj7ltupvmwjnk97unop45dp6adn	DSC05840.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	78480	n0frOYbOXSnbjzXHwZxWEA==	2022-07-03 01:36:21.197449
726	h23sxvstrwb62d51hzk61xy4daak	constelacciones_2008.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	88418	h+NvuSZcPeL4yFs2gdI9QA==	2022-07-03 01:36:21.526333
727	jsb52uwq8owbuwg98dcla0u1zsmi	Mireia_Zantop__sin_rgia.jpg	image/jpeg	{"identified":true,"width":960,"height":720,"analyzed":true}	local	65337	iSCHHNTg6bVr1fHParMp2Q==	2022-07-03 01:36:21.865174
728	u0vub8x9throtcarz8p591qnmj4d	IMGP1552.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	113395	5G9rtVNj23n8H2mO5AwjiA==	2022-07-03 01:36:22.382742
729	lc08rbbaizru2uo5me6bbbgvkern	invitaci_n_performance_ateneu.jpg	image/jpeg	{"identified":true,"width":425,"height":555,"analyzed":true}	local	39229	6FlV39u7J9wodh9ZdL9qSA==	2022-07-03 01:36:22.599092
730	n53st3ri7fh4f9x3gj1mu63j3qxy	ATENEU_ph.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	37472	0IoxSFtMAmgDHepgr8wBCw==	2022-07-03 01:36:22.862778
731	irsbszfuja3x6q4xlzuibhxpgkke	inici.JPG	image/jpeg	{"identified":true,"width":898,"height":900,"analyzed":true}	local	82170	yy8/38NtyrJXJRwimXLXTQ==	2022-07-03 01:36:23.189042
732	53ha83qg3n71ncmcuklrjc0ci0wl	Performance_mireia__1_.JPG	image/jpeg	{"identified":true,"width":700,"height":700,"analyzed":true}	local	50294	bWNrLlE3x1hE/Un9s+xGVQ==	2022-07-03 01:36:23.504206
733	jbcu3ak8avjujsqspi6sh2qgxf62	DSC06520.JPG	image/jpeg	{"identified":true,"width":550,"height":900,"analyzed":true}	local	56529	Q66Q2zuuceKybktK8On76g==	2022-07-03 01:36:23.787736
734	8tx7knw7rnz52z93qghfi4mo2m3m	Performance_mireia__2_.JPG	image/jpeg	{"identified":true,"width":700,"height":700,"analyzed":true}	local	62918	cFIEWZEr9dcQOcuMJs4amg==	2022-07-03 01:36:24.079598
735	jvzqkxzgttibfyqwdgthg0ipo1x2	5_canvi_enquadr..JPG	image/jpeg	{"identified":true,"width":895,"height":900,"analyzed":true}	local	92043	hZ+Sfh0TCxQ0+PMFJGsVvA==	2022-07-03 01:36:24.481074
736	qxh5boliyc78oigizveh767fe80a	Performance_mireia__6_.JPG	image/jpeg	{"identified":true,"width":700,"height":700,"analyzed":true}	local	63475	2SBezuSs6LaqVub3qmSR6Q==	2022-07-03 01:36:24.78763
737	goz39jdead41jd43wmh544vsr2bv	Performance_mireia__4_.JPG	image/jpeg	{"identified":true,"width":700,"height":700,"analyzed":true}	local	63588	OjF2+h54TOcQHTbguO0gKw==	2022-07-03 01:36:25.188868
738	qii94javlppz0s3qmpuxx2gdtct6	sala_ruinas2.2.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	37017	X9Xvt0dC12EUqY8p13N85w==	2022-07-03 01:36:25.47731
739	5u3e7oda8rrek9wn63dv3a09dwkb	obra_s._paper__ter.jpg	image/jpeg	{"identified":true,"width":708,"height":900,"analyzed":true}	local	36014	qlrXy9hlwDgTImywlKNaPw==	2022-07-03 01:36:25.732338
740	gix0f8z4tzrayzcwkap0064ox5e8	uters3.jpg	image/jpeg	{"identified":true,"width":695,"height":900,"analyzed":true}	local	58755	KjlP3+ZPTIkaXT78viriZQ==	2022-07-03 01:36:26.066
741	83v8p9xshf5nlo0an7xaiss3q671	Mireia.JPG	image/jpeg	{"identified":true,"width":1200,"height":797,"analyzed":true}	local	52314	vYjG+5ZqgavIZ/Kxwpd5Bw==	2022-07-03 01:36:26.378683
742	sc8fpbz19u8bc6wk5uxmg2xfcqd4	Juntas.JPG	image/jpeg	{"identified":true,"width":1200,"height":797,"analyzed":true}	local	51438	OzjCdqizvGrOMYVOtYYGGg==	2022-07-03 01:36:26.689726
743	wl0ano4jhpak077zh2cnglokoyx3	Eva.JPG	image/jpeg	{"identified":true,"width":598,"height":900,"analyzed":true}	local	36241	5KWwC0HyK+D+fng4RMqZXg==	2022-07-03 01:36:26.938464
744	a18vr5j8ihog8nwq7cpbl3swghpp	DSC02215.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	92370	tzeYTRwZWbCBP1HJXmnovg==	2022-07-03 01:36:27.336159
745	lc9grazlu5q1qhqk2jq7vjv6jlj6	dsc3697.jpg	image/jpeg	{"identified":true,"width":120,"height":79,"analyzed":true}	local	2137	KR9X/X+5zUDbc0IVhDJpsg==	2022-07-03 01:36:27.512235
746	txi83b07r7fveqwg7lvp3xrh42k7	DSC02225.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	110008	eZFj1iyZrbqmkBj1qCuukg==	2022-07-03 01:36:27.966008
747	6a8fzodfl4qv3zos9j0rkl4rm602	DSC02239.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	118661	EpviX/XeN+5aENMoXIBQfw==	2022-07-03 01:36:28.421008
748	qinkv954ay907oswmg5i3tutu92q	DSC02327.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	102434	Gws060w74i2CgvaQGa9QsQ==	2022-07-03 01:36:28.877695
749	0rdj33ks5z9lke5wx309morf8uro	DSC02347.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	139985	CQ+9hHLufSfqdrVs5qzV4g==	2022-07-03 01:36:29.338832
750	3ae57gn5z128fw5xoersj6oyawfx	DSC02355.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	141412	yckluSlmPCkJ1dLF1aCN+w==	2022-07-03 01:36:29.773742
751	rb4fmbpfau5jrsag8pj3dzhr9w2a	DSCF1204.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	75168	I328JuBYJimIhRsskUtyvA==	2022-07-03 01:36:30.144307
752	vc0jxinttz76slmqqddtln5he13t	DSCF1197.JPG	image/jpeg	{"identified":true,"width":1173,"height":900,"analyzed":true}	local	53325	bMe/Z7GnEHOsQeL1TpmIkA==	2022-07-03 01:36:30.472783
753	kkjcc57uy0iattoxwhgt6g53gwbq	DSCF1203.JPG	image/jpeg	{"identified":true,"width":1096,"height":900,"analyzed":true}	local	55191	HMaUCAgA9GdPJpH0ZF+95Q==	2022-07-03 01:36:30.816348
754	uvpj8mlo7z1jl3t2t9z4r2u639fa	DSCF1208.JPG	image/jpeg	{"identified":true,"width":1116,"height":900,"analyzed":true}	local	86088	t4XSxElO3oNwoopLuC8CQw==	2022-07-03 01:36:31.263604
755	k5nr7uh7p8mrlgf33mpvejvp7xhm	DSCF1214.JPG	image/jpeg	{"identified":true,"width":1085,"height":900,"analyzed":true}	local	52708	g4nMZRkAaAuoJP7PTKuzDQ==	2022-07-03 01:36:31.658068
756	b3cofh4hxowd223yh5ucljnh6jah	DSC_0250.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	30924	VLoYbrCdeBotdsCv9gk/Sg==	2022-07-03 01:36:31.864647
757	ead0za5sfgq8nlpdyh99svokz4zw	DSC_0248.jpeg	image/jpeg	{"identified":true,"width":396,"height":549,"analyzed":true}	local	21973	4A6Vd3xICH/x4AISVEe+fw==	2022-07-03 01:36:32.022871
758	al30tjn79rze0kglgqkfzux258qe	DSC_0261.jpeg	image/jpeg	{"identified":true,"width":410,"height":564,"analyzed":true}	local	23654	b4psl06rWTMhuH3JFPkIPg==	2022-07-03 01:36:32.220272
759	ty9rnnv08o8hvz4in6vwaiofcqix	DSC_0266.jpeg	image/jpeg	{"identified":true,"width":426,"height":640,"analyzed":true}	local	25518	K3sgt4GuJXISu+66D68cVQ==	2022-07-03 01:36:32.50396
760	lz226p7kpw9l54wcryo360gdjyn6	DSC_0278.jpeg	image/jpeg	{"identified":true,"width":554,"height":425,"analyzed":true}	local	17335	PmvvB7gGerNVSmaSo+bJ/A==	2022-07-03 01:36:32.662602
832	71vy5uz3ww9701u7pv948nfjh9af	separ_2014.4sala_AUDITORIO.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	80650	JwtTBQctMhN5yGR7UiD9xw==	2022-07-03 01:36:56.759394
853	vnzvji3kdzh68y9gzhmbu98r6saq	IMG_6772.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	16555	ZcYE1Zah3WEr7ajjuA7JVA==	2022-07-03 01:37:02.885924
854	oy1bj3046zn6ucg3r6wfgei2pmru	IMG_6775.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	13310	v7L4E0wzEThaP+4HNu7mEQ==	2022-07-03 01:37:03.048837
855	bv54z2sctjjkpnerojx5feqjm2nv	IMG_6798.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	11035	RXqCnWX0zb/yX5jL/9koWg==	2022-07-03 01:37:03.25779
856	76cuxd3205cn6nosk2sf9fic5ulu	IMG_6812.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	15916	iqG1jJnOwxOk8UEskQ/79A==	2022-07-03 01:37:03.421884
857	ikrpsjvahix0f9rm2z9sjywm3kuy	IMG_6819.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	10542	/ugltCsUB5dxVjGPoDTDTQ==	2022-07-03 01:37:03.583926
858	xr4m2vcirsgm9puy312s08v5lsrn	IMG_6827.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	9791	lXwKsbi6HFZapeYfGDNH4g==	2022-07-03 01:37:03.741383
859	4trt2r5rwuxu33o1jqmn3sq56uaz	IMG_6834.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	11757	Esuj/WhU/+f218OhjfGHOw==	2022-07-03 01:37:03.937028
860	p6fi3xdsrax089cwq4i1yr9d6rea	tarja_antic_c18_captura.jpg	image/jpeg	{"identified":true,"width":768,"height":545,"analyzed":true}	local	87126	Xvz6wGtC4HTo76u2OlguSw==	2022-07-03 01:37:04.234075
861	o4wt9f718879e0iz6ftyxzorik6m	tarja_birds.jpeg	image/jpeg	{"identified":true,"width":880,"height":625,"analyzed":true}	local	106869	k5v5vVDbG/t0FtvV2W4iDA==	2022-07-03 01:37:04.609901
862	5txviaewa1a9dh42fcwcp80rczr1	20140706_164949.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	248709	IjVisb1GifhD/LizEx0QGg==	2022-07-03 01:37:05.21391
863	vqykipiqjg7om756n2x7vi3k9cam	20140706_164949.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	248709	IjVisb1GifhD/LizEx0QGg==	2022-07-03 01:37:05.818282
864	v1x621dj1o4zg6we4gd9oc3romg2	20140706_165129.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	266700	hxXF2r6PQ/ws4NvaX/TG+w==	2022-07-03 01:37:06.456169
865	w99r5mmhqvxgzdqze2882im6n3kz	20140706_164738.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	251885	/i8UvENFhh+1XEiWVqAvFQ==	2022-07-03 01:37:07.023991
866	wu0fcr08oa6rj367ag204hiinw0r	20140706_165245.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	301909	ECFGpgyTUy+AuFcvMdgojQ==	2022-07-03 01:37:07.710111
867	x2qdn3vlyngg7cdlhkkmln7i92tf	IMG_1468.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	34959	WfAnxqFxXieH/j4YujSTKQ==	2022-07-03 01:37:07.906924
868	g5xarpd6cf3waxyhealy4pcr5ayp	IMG_1475.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	11364	ikcpakrrUX67ieg1FAZ0IA==	2022-07-03 01:37:08.067054
869	ivi6k9pzeg8krdiipnqnbpkxer5i	IMG_1491.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	14178	k5Fll2l7J2HiDh+uLOh73A==	2022-07-03 01:37:08.243799
870	et12e9eue4uo4n4bosf63x774mh1	IMG_1492.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	3339	3p8sePS6xpJbkKvYye9sNg==	2022-07-03 01:37:08.435896
871	yrnu7b0ih22bsnecyyblkvnbd569	IMG_1499.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	22957	tIj72AgkABkgtXm8K3oobA==	2022-07-03 01:37:08.605893
872	mbbjceir28g42p7fznbv264pm49r	IMG_1513.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	16917	/mFkL85D+4JGHqKiy66gUg==	2022-07-03 01:37:08.760684
873	a51isb6hz5q7zgf64wvm577anv15	P1000490.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	35660	PmpWd5ojAwyw4VZ/UnVT/g==	2022-07-03 01:37:09.026114
874	w7g3jqe92caltylnpkehzs00uhi2	IMG_2324.jpeg	image/jpeg	{"identified":true,"width":320,"height":180,"analyzed":true}	local	8803	RhFX9nBKi2XKEjJMXF38Bw==	2022-07-03 01:37:09.151721
875	0cdszyyzjex9cd4kn1xm3jx165lw	IMG_2334.jpeg	image/jpeg	{"identified":true,"width":320,"height":180,"analyzed":true}	local	16373	fvLNDV4rTV/7bXd8nX2zCQ==	2022-07-03 01:37:09.291446
876	yi4gyg3bmtiazywa7m70hxq2qy7p	IMG_2423.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	17552	JN+JhEw2icHTnK3xIOG5Hg==	2022-07-03 01:37:09.433793
877	gdrwqvfmmdnyngo89ugphyv6ot2k	IMG_2411.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	16988	zN1xxETw/7uQvTW74LBxRw==	2022-07-03 01:37:09.583835
878	m01fymyupmcf99264glx234tmb96	IMG_2450.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	20794	MrgFD+OgWDFEgJBDjlbF8w==	2022-07-03 01:37:09.799574
879	rjytpm3tdevev3vm41xxav0dmlg5	IMG_2464.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	15535	aMyAHXdTioiVicdBfmBHtw==	2022-07-03 01:37:09.939991
880	58dhcqhzt7gcd4zzidckjxr2sy71	IMG_2489.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	16765	Y0HXagID/yL456ycSo0ebw==	2022-07-03 01:37:10.083042
881	ky4rjh4upvghj6owlkh69bykvlff	IMG_2539.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	18585	c026XJE/bpRS9RDrUHM/2g==	2022-07-03 01:37:10.225305
882	c5k8sox2hrvza5f7ilfy6swbu38j	IMG_2533.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	14986	g8cHGgpMoL8kFfImTGdPcg==	2022-07-03 01:37:10.362018
883	cdpij4ag7o7zw7jlfaehok8k7d3x	IMG_2574.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	21143	1AtuPCvtIu4QFfgTcUVEMw==	2022-07-03 01:37:10.586413
884	2npn07wse6obd4wgca5om2elsy5g	DSCF1045.JPG	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	87411	7lyxEAaVO7VbgzE4gFeQDA==	2022-07-03 01:37:10.994862
885	x65vfq3rk26dum22id9nluklx9i1	DSCF1058.JPG	image/jpeg	{"identified":true,"width":1176,"height":900,"analyzed":true}	local	169329	KnnrwyBarjnw/YJ5EpXtqw==	2022-07-03 01:37:11.449009
761	8onlvs66u3wo4w7s0t00yj7p0tub	DSC_0288.jpeg	image/jpeg	{"identified":true,"width":376,"height":338,"analyzed":true}	local	18120	jy3//TQC2C6+GBEBebRi+Q==	2022-07-03 01:36:32.807561
762	2j5c3wsc7947aehcwgfaozesqka7	DSC_0292.jpeg	image/jpeg	{"identified":true,"width":341,"height":637,"analyzed":true}	local	23561	6vfyOdu6rwBPqK4MhRoEHg==	2022-07-03 01:36:32.997089
763	jghgzql2370zjbutj179zqrnpfvk	DSC_0260.jpeg	image/jpeg	{"identified":true,"width":333,"height":384,"analyzed":true}	local	13400	MXnxaykkRLYbKSKjvz6eXQ==	2022-07-03 01:36:33.135172
764	6dpaqhnxpk1eg30rdgnh2ptzywsk	DSC_0298.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	34829	J9FiDtfIl/IdDNnjYhpubg==	2022-07-03 01:36:33.314955
765	ewy62w0pejmuv1i6nnl0jxn7urtm	DSC_0301.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	15752	hlXdGWooRZOY+WStFj8eSw==	2022-07-03 01:36:33.49662
766	0rxo2gufzagd50d3jpovbeirrnkk	DSC_0037.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	9950	UBB0SUnEidKXd0uBFdh/Qg==	2022-07-03 01:36:33.653725
767	u3mxm6y9f0b3hr6g8q3v53kvl368	DSC_0043GUT.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	9768	lG6DXc8Youj1dMpORKxidg==	2022-07-03 01:36:33.830346
768	nunsnys3unnkiuu4eaoe1dcgwuam	DSC_0052GUT.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	17687	IIBoyZ0elJILqQtAfg14aQ==	2022-07-03 01:36:34.068581
769	rp1oemnsu302a9vh85npjwd56kwb	DSC_0058.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	17197	wcQZcsIE/bsDmAfRrg247A==	2022-07-03 01:36:34.23326
770	aisokg0pxii4w4semg9tvqm7gzk6	DSC_0060.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	24162	rLeXP4ihCSXBRdGoAGFcXg==	2022-07-03 01:36:34.417976
771	6t9u1icxkrwkxwf1hi3awfy12ygv	DSC_0063.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	19143	VH82Uq8b77WpLNxWcgP+5g==	2022-07-03 01:36:34.613781
772	3zdcsrr2s2apak48l00c4iv5zjzr	DSC_0065.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	14415	bFJMdLXg9ZgMCDi5O9q/bg==	2022-07-03 01:36:34.787683
773	xdg9s61j5rc8a46epnguni0ldswt	DSC_0067GUT.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	23107	HVlg47eYFql3R4ORiCUcRw==	2022-07-03 01:36:34.958011
774	wdlwsxeyn0ip61m2ar9tabqrp4a6	DSC_0069GUT.jpeg	image/jpeg	{"identified":true,"width":426,"height":640,"analyzed":true}	local	19350	+035N4AIXw5+EemAKiPiqQ==	2022-07-03 01:36:35.128758
775	oshsgusrbsj9pl6743x1bwk6fh3t	09-La_Bodega_Rustica.jpg	image/jpeg	{"identified":true,"width":400,"height":594,"analyzed":true}	local	45331	LqZSxoD7YQNCQKnXGoeHxQ==	2022-07-03 01:36:35.43174
776	fgfsigj8xec080hpvcrcv48x881k	LA_DOCTORA_COLE__Noah_Gordon_.jpg	image/jpeg	{"identified":true,"width":264,"height":400,"analyzed":true}	local	23797	ILSvYMz71r6/SCRt2nXyEQ==	2022-07-03 01:36:35.584268
777	5x7juwtsdud049qh7dwerxipjl6k	imagesNoah_presentaci_n.jpg	image/jpeg	{"identified":true,"width":68,"height":102,"analyzed":true}	local	2282	37b/PmZflDolileXJLoaAg==	2022-07-03 01:36:35.728625
778	q43u445ayd4zkmmck30esx1pjihu	1_Alguien_camina.sense_marc.JPG	image/jpeg	{"identified":true,"width":1110,"height":900,"analyzed":true}	local	84047	Tl2V4rDmB8bysPJ84CGdpA==	2022-07-03 01:36:36.151828
779	p92rk78ymqi8be7slpxhybaqphny	2_El_viento_despeina...JPG	image/jpeg	{"identified":true,"width":663,"height":900,"analyzed":true}	local	89545	fbwOC7n3prVaTQPuBAy4Bg==	2022-07-03 01:36:36.481318
780	xnup9elne7pcoc12m2oepkaey0vn	6_La_hoja_tiembla...JPG	image/jpeg	{"identified":true,"width":645,"height":900,"analyzed":true}	local	83238	sbI2RSx5UZpeoMkqAqDvJQ==	2022-07-03 01:36:36.841989
781	6l5qpwe3tj5kdlr5g8lpslj9j3pa	5_Cien_hormigas...JPG	image/jpeg	{"identified":true,"width":1200,"height":886,"analyzed":true}	local	147978	SuhbdU/USpU/ESadOclv7A==	2022-07-03 01:36:37.434395
782	m2y54day6nc8wj2jje5t2a2mriu8	9_Baile_de_paraguas...JPG	image/jpeg	{"identified":true,"width":1200,"height":869,"analyzed":true}	local	174792	WJnbZLclzyEowSFLD4TVvg==	2022-07-03 01:36:37.926828
783	s7tmrd4qdf5rxmp9nau8y5529nfa	7_La_risa_rompe...JPG	image/jpeg	{"identified":true,"width":654,"height":900,"analyzed":true}	local	75841	VzxjTBTmzq/FduKIAcpBYQ==	2022-07-03 01:36:38.306867
784	lfuefli06zcfmjema35pqrr5qkpk	4_Mi_sostenido...JPG	image/jpeg	{"identified":true,"width":1200,"height":870,"analyzed":true}	local	123457	qsJqMfs9hi0PhM+/T5wdNQ==	2022-07-03 01:36:38.767803
785	r5f0auvzvmnehw119koasvfir9qb	8_Palabras_como_humo...JPG	image/jpeg	{"identified":true,"width":659,"height":900,"analyzed":true}	local	83245	js/Qj0iIK4Xt3HMY4rMJow==	2022-07-03 01:36:39.182419
786	052o6v732aa8p0cd4s2383yr6gqd	3_La_luna_danza...JPG	image/jpeg	{"identified":true,"width":642,"height":900,"analyzed":true}	local	102080	oOJAMMcoNO/ZEFbpBXqCNQ==	2022-07-03 01:36:39.568536
787	zuiqrqfimw6k3sob4ewxltlaw8av	portada.sarria.jpg	image/jpeg	{"identified":true,"width":1040,"height":900,"analyzed":true}	local	152839	HGxFVpfbrsK4o0YeQrKh4w==	2022-07-03 01:36:40.083899
788	fyuggd2xnlueejwfj2p26tdhjfxd	contraportada.jpg	image/jpeg	{"identified":true,"width":1032,"height":900,"analyzed":true}	local	137850	w9PLhtAyhmEWOcxlOZrLoA==	2022-07-03 01:36:40.543644
789	dnugy123tnjbhnmgl0blx585jwo0	vila-cecilia-1.jpg	image/jpeg	{"identified":true,"width":1158,"height":900,"analyzed":true}	local	167244	lPzkFekuJ6DfvuyYmBM5RA==	2022-07-03 01:36:40.98627
790	n73f7413czv9stbfs24e013a3mdv	orlandai-1.jpg	image/jpeg	{"identified":true,"width":1139,"height":900,"analyzed":true}	local	111988	VE5HqnxyjxRZRYHLHoD14w==	2022-07-03 01:36:41.491453
791	euahk7oigj642pjb2tzsnryyh5v0	orlandai.jpg	image/jpeg	{"identified":true,"width":1200,"height":870,"analyzed":true}	local	248593	AaLTO04BIlqT/XImndr9YQ==	2022-07-03 01:36:41.970946
792	6ceajp2fejpiy03v1n16thn9bhp6	can-caralleu-3.jpg	image/jpeg	{"identified":true,"width":1037,"height":900,"analyzed":true}	local	80948	ptvfOZMflN3E9mqxmeObtg==	2022-07-03 01:36:42.359486
793	rscjhk3cumafdhk6z2zgvwf7tf4m	torto-la-valencia.jpg	image/jpeg	{"identified":true,"width":1150,"height":900,"analyzed":true}	local	201165	0APOBU3pzsaNmUBAekSBew==	2022-07-03 01:36:42.930466
794	bpdc4ss1wcyd5lv9g8atjaha9jkv	pino.jpg	image/jpeg	{"identified":true,"width":1137,"height":900,"analyzed":true}	local	180804	4JPiWbpfnKpdOb+Ot09ALA==	2022-07-03 01:36:43.511354
795	owfjindn38wf8um88tef68mnfyug	_MG_3737.jpg	image/jpeg	{"identified":true,"width":649,"height":900,"analyzed":true}	local	39839	H1sGOrlBys37WeUjAv486w==	2022-07-03 01:36:43.759614
796	sia6mlxa8zhem3pq8if0crxes3td	fent_volar_coloms.jpg	image/jpeg	{"identified":true,"width":637,"height":900,"analyzed":true}	local	142511	7hlJrKFgTiuj9ru66RwjPw==	2022-07-03 01:36:44.201939
797	uwimksmdeftynurduhw8f7pr9kfl	Coloms_Laminas1_ClaraBes.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	55921	AU5BDC8fRWfFz+6ovi4Yrw==	2022-07-03 01:36:44.533043
798	y8polls3ocu3gw146ucofj9oli1x	Coloms_circuit1_A.Bombaci.jpg	image/jpeg	{"identified":true,"width":800,"height":533,"analyzed":true}	local	28484	JXQ3sw+pePRnoObUdSgdcg==	2022-07-03 01:36:44.80898
799	m1zsql56i5ja0vfjyh4rj9poyc4z	Coloms_Cordes1_ClaraBes.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	63418	sWUpq8MQIb2YS3PLSGDqTg==	2022-07-03 01:36:45.114152
800	1h2dxhc33opzo0g7mjt1am5cjvcl	Coloms_Globos_ClaraBes.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	48656	nENlL2Rs78agielAHfX9lg==	2022-07-03 01:36:45.403581
801	994qampmfb24mc0wx2bmf6hn6c2x	Coloms_amaralarama1_A.Bombaci.jpg	image/jpeg	{"identified":true,"width":800,"height":533,"analyzed":true}	local	44921	6hYOL+O8DC5TGI9xLt9rpQ==	2022-07-03 01:36:45.637527
802	an6oz8siegdhrw6axtp88hzvpnsc	Coloms_Murmuradores_A.Bombaci.jpg	image/jpeg	{"identified":true,"width":800,"height":533,"analyzed":true}	local	38366	wvKRVLaymgontpvHBjqTDA==	2022-07-03 01:36:45.843794
803	4y6i7f35c920dir1ogd9adler4pp	generart25nov.jpg	image/jpeg	{"identified":true,"width":642,"height":900,"analyzed":true}	local	407194	14W95GjwnU8W8m2IFI19+Q==	2022-07-03 01:36:46.105362
804	rz43ebkyr8hdbpcl58sqxg7f6i7j	despunxa1.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	124214	G7oHnV1XJAsRVVlwm5cegw==	2022-07-03 01:36:46.613015
805	indfsiecf98ynx0cphhtao3f28lg	despunxa2.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	128929	+KXmszTsvesjgcbclIDyiA==	2022-07-03 01:36:47.030168
806	t0098vmxdfik8kmjmnsk18xgnp4i	despunxa3.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	90288	MRVSMYWFVyxtEvbQfPRczg==	2022-07-03 01:36:47.390772
807	t5hkjm8u1e79xtsy00zzljchvm2x	despunxa4.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	112754	fD41u3vm0zoOqQJZNWpymA==	2022-07-03 01:36:47.804729
808	hkrlfgwa0n0z8adghwuzvzyq534m	despunxaFi.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	107040	BgswGnn2lANm8/9GvGjMUw==	2022-07-03 01:36:48.140647
809	wltors90frc3n6alidzroa4f4u27	esbarzer_obrAl_xia1.JPG	image/jpeg	{"identified":true,"width":1200,"height":799,"analyzed":true}	local	112691	rFaKezuo9DrrXuLKP7iZ7w==	2022-07-03 01:36:48.52022
810	oywaty7jq1sdnlrgh4qmb5ajlpwb	DSC_0583.jpeg	image/jpeg	{"identified":true,"width":598,"height":900,"analyzed":true}	local	41083	PbYtmYBR+iIH1Nby7DFqTA==	2022-07-03 01:36:48.880661
811	w0crtecdmnogp2re2yo1wrf01lq9	sum_us_1.jpeg	image/jpeg	{"identified":true,"width":1030,"height":684,"analyzed":true}	local	51796	3sb7qfCinZdPC3XloQaZSg==	2022-07-03 01:36:49.192289
812	xkwm5pk4kmtbz8fu1ec58k28q10m	sum_us_2.jpeg	image/jpeg	{"identified":true,"width":1030,"height":684,"analyzed":true}	local	41527	Ng97AUzTtoPYwz8pdO+47Q==	2022-07-03 01:36:49.514584
813	qcnbvx0ha94ybhxttgv3wreblrkh	sum_us_3.jpeg	image/jpeg	{"identified":true,"width":1030,"height":684,"analyzed":true}	local	54784	zB4buyhOpRdoJriOB7ZDQQ==	2022-07-03 01:36:49.782763
814	6v6f91c344dgv22j2eglmdbw97t0	DSC_0621.jpeg	image/jpeg	{"identified":true,"width":1030,"height":684,"analyzed":true}	local	92641	egcAlCi937NZaHi445I8+A==	2022-07-03 01:36:50.187006
815	sk4cb68p6wo19puer6vqh4jd72ky	CORPOLOGIA_13.jpeg	image/jpeg	{"identified":true,"width":640,"height":461,"analyzed":true}	local	47128	TUMmQ7wfgj2AAgwUIDOVvA==	2022-07-03 01:36:50.401962
816	zcv4bieejbx02hk3jjpqbnh7vel7	DSC_0037.jpeg	image/jpeg	{"identified":true,"width":843,"height":580,"analyzed":true}	local	17162	76+Enm91BuB2CJLdbHrjVg==	2022-07-03 01:36:50.612921
817	jblkdpurq7fvcd1nrys0hq4hnop2	DSC_0038retoc.jpeg	image/jpeg	{"identified":true,"width":650,"height":632,"analyzed":true}	local	43910	4TwZbKprqHex29twvm6iqw==	2022-07-03 01:36:50.857715
818	ebx60gvsq4tvsthdumzisflkwg0z	DSC_0044_copia.jpeg	image/jpeg	{"identified":true,"width":587,"height":900,"analyzed":true}	local	49065	ebmmUKVaYL4JsgqGFR8qaA==	2022-07-03 01:36:51.153607
819	9yec24whxjlyma45i3tdojn5rfb6	DSC_0047_copia.jpeg	image/jpeg	{"identified":true,"width":520,"height":574,"analyzed":true}	local	29123	JWk5Y5nYGrPlOKpzbmKvGw==	2022-07-03 01:36:51.349301
820	57hzb0fmzfnmjgllusqp3xx8bn5c	DSC_0048_copiaretocada.jpeg	image/jpeg	{"identified":true,"width":680,"height":900,"analyzed":true}	local	24116	ZbetKFbRicQLKyJPGR2rqw==	2022-07-03 01:36:51.571211
821	ln5lalsoppsxmzp3hiab8987ntg1	DSC_0051_copia.jpeg	image/jpeg	{"identified":true,"width":566,"height":900,"analyzed":true}	local	36929	+P/ipwtMuGhVeP8ahkLjSA==	2022-07-03 01:36:51.813347
822	mggpv3njndjg00yhveg4fk9y7jir	Programa_Perpetraci_ns_Interior.jpg	image/jpeg	{"identified":true,"width":653,"height":900,"analyzed":true}	local	145381	E7xKh+SFzz7TdQI8ju9Hqg==	2022-07-03 01:36:52.23869
823	8c9ia92nr9i9lg1lo2923vg6wmuw	140531-XIV_Perpetracions-Antologia_Animal-487.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	246563	9iaz0SaPcf6Wm/9EpDC6bw==	2022-07-03 01:36:52.907168
824	43srf48nnzarbjlgzcjq2atpzhal	140531-XIV_Perpetracions-Antologia_Animal-500.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	194338	9n9/1tk7u+mxSgXUTS/deA==	2022-07-03 01:36:53.38394
825	7gzj4xm07gr6gaeaql8w3nh73fsb	140531-XIV_Perpetracions-Antologia_Animal-504.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	175622	Ta9/oF/JMEMliJ1hfAa2+g==	2022-07-03 01:36:53.897773
826	tf2yp8081lxh07jpewt4g2e9iq0e	140531-XIV_Perpetracions-Antologia_Animal-506.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	162454	vv+C5hQnIAOeKMG5Mb2s8w==	2022-07-03 01:36:54.364713
827	15raz6a3s11p3neu2a325agmqpc8	140531-XIV_Perpetracions-Antologia_Animal-496.jpg	image/jpeg	{"identified":true,"width":599,"height":900,"analyzed":true}	local	128236	fQjU+2XkXQc6LNGTsMR+zg==	2022-07-03 01:36:54.793384
828	mu3cuvsacct8futn9iqqqk3nry0v	P1130261.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	69832	5soKjXuRVGyIQkfqI3XJng==	2022-07-03 01:36:55.136589
829	9o6crczfc63pnvjkbeucg8sert3p	P1130264.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	102433	dHMf3WL++NxAWaYgglZwYQ==	2022-07-03 01:36:55.506379
830	o5ig86zsyo4evvljs3ejd2n50301	P1130300.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	117833	zciIpl/ElNikvAJD3VQSzA==	2022-07-03 01:36:55.88612
831	bm3918woxezsx74m68vm9zxn1sar	P1130321.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	139922	zKwx3+eiYS3H+18aaPMe4w==	2022-07-03 01:36:56.370112
706	y3kkdxykhqy58hjfxmcqjzuktxwt	1_Alguien_camina...JPG	image/jpeg	{"identified":true,"width":1063,"height":900,"analyzed":true}	local	100928	cpGVzZCWEjuI+LLNIktgoQ==	2022-07-03 01:36:14.338471
833	3u1d68ms4t7w87pvfk23hu82ajeb	Separ_20143Sala_AUDITORIO.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	95885	Mzeac/DFWcfc8dJSoH+Pcw==	2022-07-03 01:36:57.210643
719	7v7miyyk4gubiz3qpi2kzcjj0op5	DINERGIA_I-Llavors.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	40359	BAovVFlDVXxTzOHe5DNMWg==	2022-07-03 01:36:18.762303
707	ah3prjacmj85muku4hiw9yyqpwm4	Possible_Foto.jpg	image/jpeg	{"identified":true,"width":1200,"height":782,"analyzed":true}	local	64504	UrD0pXb6CSNkLeLACWvY2Q==	2022-07-03 01:36:14.696354
708	5xizglsacxtyz1vhgvm2s9onkxa8	Survival27.jpeg	image/jpeg	{"identified":true,"width":506,"height":380,"analyzed":true}	local	4400	JaMziJlBJqqHGYrVPO3ADQ==	2022-07-03 01:36:14.938701
709	pq01z7w3y1vs7wk30deoghj4h01v	Survival29.jpeg	image/jpeg	{"identified":true,"width":515,"height":367,"analyzed":true}	local	4763	DBNCH0mHU92e2TKNy921lg==	2022-07-03 01:36:15.133673
710	ovj3cuy93ooumx5alypnbwndrox4	Instal.laci__monos_labos.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	99603	6JIXza8O825KBFrhdxs0vg==	2022-07-03 01:36:15.596941
711	dr6a6watcb7mxzb2uxisw3khnjnx	Vil.la_Florida_venus.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	104058	oA+bNPF6nzvjDCNmGLxk6A==	2022-07-03 01:36:16.041056
712	vlw63hvafpt33w596yrzqpf7q31a	DSC_0062GUT.jpeg	image/jpeg	{"identified":true,"width":640,"height":426,"analyzed":true}	local	25927	X4a7UfQVnonrWxbKHdk3dw==	2022-07-03 01:36:16.282229
713	mn1hf7k3m5rth3pf1c1luxidc7xt	ANA_RITA_RODRIGUES_FEM_2011_PAR_8663.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	124243	E0ztzI07p8i2n2CIGlLNsA==	2022-07-03 01:36:16.672404
714	6gs2754rb34rkx70x7i4gormzzb3	ANA_RITA_RODRIGUES_FEM_2011_PAR_8672.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	139281	B+x5k/8JV4RMcSdlNiV+5w==	2022-07-03 01:36:17.072696
715	00om7lnx8gjzggx7ybpuyfalj3mx	ANA_RITA_RODRIGUES_FEM_2011_PAR_8711.jpg	image/jpeg	{"identified":true,"width":1200,"height":798,"analyzed":true}	local	129763	0N72IfM1NkFH2vxlxaZ9yQ==	2022-07-03 01:36:17.480425
716	39z5pctfy0mf4gi8y73ggqje6ttd	ANA_RITA_RODRIGUES_FEM_2011_PAR_8749.jpg	image/jpeg	{"identified":true,"width":599,"height":900,"analyzed":true}	local	102216	JwPx5Itk3C/Pww33fOe0iA==	2022-07-03 01:36:17.770062
717	ewzd6im0ct1r9mz3o0t1k09h2ont	DSC03862.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	54866	R+kjvNoAnnU269OmKhWgtw==	2022-07-03 01:36:18.07984
834	0250pph3x2njxv29d918gaw6bc4i	IMG_2095.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	4339	vCzDwfUq5RlpSvzXVpSLQw==	2022-07-03 01:36:57.344515
718	x2c65eemhy56thosblo4ywg8xza1	DINERGIA_I-Armonia_Diatessaron.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	102041	ouSuZBPrcf3rETSUW+aCDw==	2022-07-03 01:36:18.496356
720	e0y8yljwsw0myw5a5ndgqbmgadwc	DINERGIAIII-Armonia_ad_infinitum.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	34491	woRJHHYE7SMCGiIH6qQj+A==	2022-07-03 01:36:19.034219
835	h40w75siim68yqmth5g9ol1tye01	IMG_2104.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	5240	wNqiS7djfd4KY9Liw7mo8w==	2022-07-03 01:36:57.54285
721	mx2grz53nw48nmrvmmxz700bnntr	DSC03863.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	146219	2tK7u9FSoNM4nccPIgaRAg==	2022-07-03 01:36:19.5135
836	dtxo8memgan8ya0i220vq2n12mz2	IMG_2108.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	4188	2uhVfra+z6gUbknQgGJ6FA==	2022-07-03 01:36:57.723735
837	gle6umxa622af04rx5nqrd3w668n	IMG_2116.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	5125	VkGwl2LkLcXqa6DRBvbKnw==	2022-07-03 01:36:57.860692
838	0jarq71q1dxzx12042rpzajxbto0	IMG_2117.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	8758	K+B+d42jfYYjDvyYFKijgA==	2022-07-03 01:36:58.064011
839	xj75kan9wa13j1uj2xid6t5a0zqh	IMG_2127.jpeg	image/jpeg	{"identified":true,"width":214,"height":320,"analyzed":true}	local	4212	locPYw1hpx3UUFnYBcyvvw==	2022-07-03 01:36:58.188062
840	gz3b831fvdaxm3pwi2tjomtswljc	IMG_2131.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	7455	vfx9mvAGQJhOVYx6roFLYA==	2022-07-03 01:36:58.322544
841	e13pqx0zcdvaa8gy3sl07uht5p9u	IMG_2132.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	3660	FkbutgEsnSq7dDs/TPq76w==	2022-07-03 01:36:58.437264
842	2vmpaxv1btjfwkceedfrdtp6u7d4	IMG_2134.jpeg	image/jpeg	{"identified":true,"width":320,"height":214,"analyzed":true}	local	4069	U3QwRgkCgwCuLVIGNjmSHw==	2022-07-03 01:36:58.5563
843	a7ot9kifvfwzn1e3bg15xbfd45k4	Mireia_Zantop_Accio_.JPG	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	163420	k97a/CoZx0dzGMAXhqXlyw==	2022-07-03 01:36:58.994907
844	9kn4j5ypctxz689iwdpryvazybg5	Fulls_Accio__Mireia.JPG	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	170427	JDeo6SSk/iG/q8kbOryx7Q==	2022-07-03 01:36:59.525408
845	9klyo3byavh2osaosjuyph7x1f43	Pu_blic02.JPG	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	161669	4xEl96oo4L00UNpsQr5A+w==	2022-07-03 01:37:00.011776
846	qvsuics7d6a925a0466ozz9p5ctl	Mireia_Zantop_01.JPG	image/jpeg	{"identified":true,"width":1200,"height":886,"analyzed":true}	local	215387	kVr/P2rA/+H5IgszWHwc5w==	2022-07-03 01:37:00.608656
847	nikyxhi8iq2mob1hyxukbb99co8w	PanorGUILLERIES_accio_.jpg	image/jpeg	{"identified":true,"width":1200,"height":457,"analyzed":true}	local	146308	vCdbCYsTJR8/hhGadGLFrg==	2022-07-03 01:37:01.012515
848	2k56ymlwa4ddw7699o8kv6lwk4b6	Daniel_Ruiz-_Trillo_02.JPG	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	60636	RQv1raHLbQYdIKtOSUGvXA==	2022-07-03 01:37:01.400544
849	z9y7rjamwvsmv1eoiyz0p01hdddk	Mireia_i_Blai_en_accio_.JPG	image/jpeg	{"identified":true,"width":1200,"height":856,"analyzed":true}	local	213661	iUhA/qnpC7SgIUJBs6FMig==	2022-07-03 01:37:01.985107
850	4yhscjdhwnkyxsvb6eynphf4y9hg	IMG_6760.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	26153	Oqs08Unj69p3zUTbBeSEAg==	2022-07-03 01:37:02.201849
851	8ieudykyuks9b040nbss3n72wsrz	IMG_6764.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	28108	WqjxS9iZsEETcER2ZPCNUQ==	2022-07-03 01:37:02.447486
852	zrzvz94jsvqaxqap8o2fhwyh7cim	IMG_6767.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	25038	BE0VZBJJgjYvmOj2/sN2fA==	2022-07-03 01:37:02.712303
886	48yndiguop5rm9y9vg8ttp3cce5c	20130623_164338.jpg	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	198674	uS4KixQvZ8ahy9RpyN0xug==	2022-07-03 01:37:12.033672
887	ouqenfqd2j2mfbjldakcg2u514ic	20140706_171308.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	210473	rCjN2EyWlT2FsAp9JaDf0w==	2022-07-03 01:37:12.610899
888	26qm49ezs2etqy3phc2ccrq4uroq	DSCF1265.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	134796	y10mpqJrjDUMdc5TY9ICnQ==	2022-07-03 01:37:13.108582
889	wtewjq8x6h4du38qusksb7oecbr0	DSCF1556.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	311212	ZzSYSt1w9jVEVxLlCL96LQ==	2022-07-03 01:37:13.809138
890	qcvbj35vm3aznsr79n0o8j7bidt4	DSCF1525.JPG	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	207184	gBwef3EjVB6CV7QHyCvTBA==	2022-07-03 01:37:14.376368
891	3ddbu15hq14d44c1viiyapjhoj2a	poesie.JPG	image/jpeg	{"identified":true,"width":359,"height":900,"analyzed":true}	local	23148	vHsFDqJIvGzfLFJzPDVWQg==	2022-07-03 01:37:14.595674
892	wbkgmrqreay2i1v5alepl3o3voku	Strelitzia_Delitzia.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	41906	e8e845uuZnZA96ylG6geHA==	2022-07-03 01:37:14.850698
893	u7medlxuy05w8gp6dvi6cc4ub7dy	AromaMagn_lia.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	78078	dK+d065pRx5r4e1LMt2rsw==	2022-07-03 01:37:15.190936
894	rzsedcl2u4pb4uymg0dclbdfv8h9	Rosaflordepell.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	80307	rg+TP2cSn1Gw3myCrprxmw==	2022-07-03 01:37:15.583813
895	2r58y02h5k1xv6eto0sufcb7x519	IMG_6061.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	38515	QXbGxhokpKDPluYj2DE27Q==	2022-07-03 01:37:15.911779
896	9s4qxproqgd4aqq1fi84q3begp93	IMG_6068.jpeg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	23003	Gcn9P6qNwBLxOfhNxT9pBg==	2022-07-03 01:37:16.159288
897	ys9eow9yo4uk8252f47jef7tjvno	IMG_6073.jpeg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	34136	QveUjZem3Apr47SU/8zV/A==	2022-07-03 01:37:16.378584
898	iz3bf1zr1te9tlw4l81j0doj36zs	IMG_6090.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	32150	E+9O2tq6OOFG01SkTXn7Sg==	2022-07-03 01:37:16.735827
899	afern8dnzlzoyvivabfwdgl04r21	IMG_6096.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	40555	Dr2I/0KCZNbuHPI5vniW/g==	2022-07-03 01:37:17.019613
900	cfav7k5ndrecr2yn3hp8nvla6gqk	IMG_6103.jpeg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	34700	HONUszlhNEIh0OhdRXBccg==	2022-07-03 01:37:17.283515
901	eel5zjalvftono726gv9wzyugnt0	IMG_6108.jpeg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	20031	zpvCkOu73wuUvbjiMpbijg==	2022-07-03 01:37:17.538185
902	kypo0h3p886hlqspa3ch3p30gixi	IMG_6111.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	47900	XJNMnTWYkipAzkQSOgV0Ww==	2022-07-03 01:37:17.90344
903	dm6nk71cffg57hbvvkpl0awhh6ly	IMG_6112.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	48016	FwUqjKFr4+wdSz0gzozD7w==	2022-07-03 01:37:18.238237
904	a9hh7sskjy69qjkc9zzjkqp2ddbr	Corpologia_21_.jpg	image/jpeg	{"identified":true,"width":1200,"height":846,"analyzed":true}	local	107786	U2BXDVwATF97Nr3P7Ol3Rw==	2022-07-03 01:37:18.697098
905	y29fve01fwzxgcuiy3fm9i9kuge8	IMG-20150128-WA0000.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	63371	yE3YKytVvA/d2Dlq07a2mw==	2022-07-03 01:37:19.03418
906	0c6pygt8wxig7bhs2bizy79sr6rl	IMG-20150128-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	71529	vr/7c5G06bDf3+WkOYiLxA==	2022-07-03 01:37:19.403785
907	ibd0jksntmimg7xmt5a0z6gl4t8e	AdobeBridgeBatchRenameTemp7CanFelipa_15.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	37378	RJSwOq/lyEEBCn3bylE96w==	2022-07-03 01:37:19.721758
908	bapyafck9n29wq176xcxzp2bcqmz	AdobeBridgeBatchRenameTemp12CanFelipa_31.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	48545	MczbsdRGEYUOAcdsgLrzpA==	2022-07-03 01:37:19.98477
909	xhy8wfp2ub9tq8m1t5fs3kfg2t0v	CanFelipa_67.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	43024	/7vhIJSbNyJjAZrDh5MN0g==	2022-07-03 01:37:20.213942
910	jh7eawsdn6veagazlh1vv3z95ps9	CanFelipa_62.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	86937	0ko+C1GuP0praUGT5qtXXA==	2022-07-03 01:37:20.573203
911	clquehxp743xf76k0di1ow5quola	CanFelipa_28.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	47360	k2DT+TeBy2a26pSCQfJgtA==	2022-07-03 01:37:20.884675
912	f6uklq9ug4w45azzgpgzcsg58x0o	CanFelipa_17.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	41112	vTtAm5VM1oDLLsMvwc0bSA==	2022-07-03 01:37:21.161356
913	gtyv84ie2di1dbi1ac5xjp804hgj	AdobeBridgeBatchRenameTemp2CanFelipa_02.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	79726	zRQ5d4HWVJaltEatMR7HRA==	2022-07-03 01:37:21.538145
914	stwo7j5gbvzgfszwzbi5hta62e0u	CanFelipa_39.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	87493	nUXKc2jvE4Tu5uNE5++swA==	2022-07-03 01:37:21.955925
915	h9o7z68sfkndp6m8gq8o3yishl83	CanFelipa_26.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	62018	A+dOEojWe5ed7iVW9i4v+A==	2022-07-03 01:37:22.276639
916	fia8pb8yeh63153cx7bvnyvqbe6r	CanFelipa_09.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	30595	UFGFSgCo+HjrlCr8m2qTAg==	2022-07-03 01:37:22.460349
917	pz6mflgo89u55ilyd7e19dbhvizv	eventuall0.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	41630	9Ygn1CGYLoNsnh7AEpKGbA==	2022-07-03 01:37:22.699606
918	1stpbcxki84vg4b82v2zjlrhgf0r	eventuall2.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	43781	rjcXlRIuHTiClz2tLjP1uA==	2022-07-03 01:37:23.006926
919	rl3noqizbd73l9s1vnyeuhgjnjak	foto_eventuall_ferran_blancafort.jpeg	image/jpeg	{"identified":true,"width":574,"height":480,"analyzed":true}	local	35222	Lj+1xG38GZG6rITvpV4+mA==	2022-07-03 01:37:23.197961
920	qr91eqoqve5l91562ob9uqayn7du	eventuall3.jpeg	image/jpeg	{"identified":true,"width":427,"height":640,"analyzed":true}	local	52095	GSByHvFap+s6mqFICd3cvg==	2022-07-03 01:37:23.416824
921	xm8p5tl8h7xz8blz5o9yzkh9j38v	eventuall4.jpeg	image/jpeg	{"identified":true,"width":640,"height":427,"analyzed":true}	local	67481	hn0cAsBF8Bvmxw1aBtwcbg==	2022-07-03 01:37:23.665426
922	hllszxw1c7kxye05qqdsaskkuwx8	Cartell_ME_expo_cartells_2016.jpg	image/jpeg	{"identified":true,"width":572,"height":900,"analyzed":true}	local	100315	y2+zI27GcjBBVWmVNxyXeg==	2022-07-03 01:37:23.996309
923	5xq1ggezz8da9eatvoopt64bsesk	RIMG0068.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	local	65487	2eaBNyS27EVtPk91QGA7QA==	2022-07-03 01:37:24.326676
924	muk4ztirpc4onp5t8ejnqw79e4vg	DSCF0447_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	74484	x6XrcQw3X4LqjO6JxyxtGg==	2022-07-03 01:37:24.641001
925	t06utlqieec39lad6j110prjtp5x	DSCF0459_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	61120	A8h+tnKrtocK1lm1nEMKaw==	2022-07-03 01:37:24.930268
926	vl66l8wjul3t572yird3vp4crsgs	RIMG0087.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	local	114109	Bdm64TLAcL7y+p/4hwM+Ww==	2022-07-03 01:37:25.294523
927	pygmeh3islx4k36hoc36z3lx79ql	RIMG0082.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	local	55343	e/RBT4WGz01E5dJHGEUG1g==	2022-07-03 01:37:25.565833
928	xvauksnl7yggss7969rkidwgv6va	RIMG0084.jpg	image/jpeg	{"identified":true,"width":1024,"height":768,"analyzed":true}	local	45152	pqrjKxWNtOL35v3OnBNIDg==	2022-07-03 01:37:25.827937
929	x9eaglgtiy96jio2hbj7mtb772rd	ZANTOP_A_BEN1_amb_dibuix_fotos_Joan_Casellas_Arxiu_Aire.jpg	image/jpeg	{"identified":true,"width":1200,"height":618,"analyzed":true}	local	79590	gStboPq4+X+uDgPvrSaPSA==	2022-07-03 01:37:26.120364
930	fwrswriupttpy2ys2zxqe9g7ev9x	DSCF2590.JPG	image/jpeg	{"identified":true,"width":1079,"height":900,"analyzed":true}	local	155201	9TsgpcSho9+4g+LmLK7nZA==	2022-07-03 01:37:26.567845
931	gvrkb0uhwcvdukxhdl1jcqqo4i1p	DSCF2682.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	163297	TOJwKIcxLSdwt6WdEeGJxg==	2022-07-03 01:37:27.083183
932	h1f02relw62kzamfcamtv3qhpskh	DSCF2762.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	135643	PtZsqMQgHC19H6Ppj2Qe2w==	2022-07-03 01:37:27.527638
933	lmoedig621sf2hummfgfub1p4jrn	DSCF2792.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	148607	iBeFV3hDYyi8gDykR1T5ow==	2022-07-03 01:37:27.990498
934	7oh26kjzmek4qmnycgntq2vzs8uq	DSCF2813.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	152729	hDC+F/MNGc+Gu7g24RrNLA==	2022-07-03 01:37:28.484572
935	xsdu3khgsknsouepbrou6hngm7s3	DSCF2805.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	188245	fpsDcS4DWnOLXZ9IT5SGuQ==	2022-07-03 01:37:29.040986
936	s9ffc6bpagag1arzz6h7nj9vc8n0	IMG_9772.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	78912	R7y9OfRxTux6dpP0X1Idkg==	2022-07-03 01:37:29.394833
937	ewklqmbhf0cp7t6iyh2se7c3lx6d	IMG_9780.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	66651	/E/1JJbrP0kolDrmvm+Edw==	2022-07-03 01:37:29.751677
938	dryvdnggmfguwtw6stmhyje16fqs	IMG_9786.jpeg	image/jpeg	{"identified":true,"width":1200,"height":801,"analyzed":true}	local	75267	/XAzY3PMb4Ile5+M8QKuPQ==	2022-07-03 01:37:30.072929
939	p2ugyazjgem5fw1wyfiv1inqk7lc	IMG_9790.jpeg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	49426	T2OK9vPeLZrh8TqJFTUnsw==	2022-07-03 01:37:30.356735
940	l6dhk5aro1x8dvu3a9ey0rj30egs	Performance__Donar_veu_al_desig__Tona_2015__6_.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	264834	+v3vSh2qSqh4gJyXq2fqKw==	2022-07-03 01:37:31.027728
941	kcwp6jxz399pnxaklv4ofxrj291p	VIC2.jpg	image/jpeg	{"identified":true,"width":1200,"height":820,"analyzed":true}	local	155372	HsHBP6cuXTpOD6les0f3Rg==	2022-07-03 01:37:31.477473
942	rjmlfaghi45x819qhlrxm7bj30sr	Performance__Donar_veu_al_desig__Tona_2015__1_.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	165297	4+kQORh0S+tyT8mROJS2dQ==	2022-07-03 01:37:32.015119
943	46q2w1f5f0onjqqf1aovffs2vfh8	DONAR_VEU_AL_DESIG_.jpg	image/jpeg	{"identified":true,"width":1040,"height":720,"analyzed":true}	local	86302	i60616QjGUj0S3D4gOcgUA==	2022-07-03 01:37:32.392909
944	46kdzr16y71oihb1pkupfipb0n9k	MIREIAZANTOP6.png	image/png	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	1040163	+dO1GlpDzGdYPxLuVq6hOQ==	2022-07-03 01:38:44.505737
945	vnfkje2q1topiogpivcrwni6u6u9	DSCF4623.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	154225	QPuvlatfqXMn7T0HEe6KRA==	2022-07-03 01:38:44.951168
946	ejldz6265089bi2jygc6ee8uk4l2	DSCF4634.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	86840	KgQ3D/bnmGBOPATewV8UdA==	2022-07-03 01:38:45.337662
947	4nie9pl4dmw0aeuo8uowx7dkqj9o	DSCF4650.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	80246	BsxKvsis8eG8TEzpTq345Q==	2022-07-03 01:38:45.710246
948	xh3cgqga42p1y8wax34om5pifkfp	DSCF4658.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	122172	NG3HlAuE1rOtYf4eZJIrnQ==	2022-07-03 01:38:46.144306
949	jmbxyi9bq3iv16y5fu2iwqoxwt76	DSCF4653.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	49237	JDFLTt1OCwlzcVly68aXXg==	2022-07-03 01:38:46.52134
950	9ax535dpuhcf6yvas0zf5l8akkoj	DSCF4659.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	131885	wJwxTFcZ803Q754GWQzhsA==	2022-07-03 01:38:46.948651
951	r5yyr2bid2kgdtft8inanmilt5bb	DSCF4661.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	51508	KwbgGX+3OgSMDOp3pMDH6Q==	2022-07-03 01:38:47.332761
952	3jglgnxskq77t5snm80gyt2qwla0	DSCF4662.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	51713	abx22rRo5y6LduVpQJ/hag==	2022-07-03 01:38:47.693941
953	717mdvi2pd5jv42yjhw44b1b42yd	DSCF4665.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	78851	7IGoDjeEEJv4J56+Wmlpcw==	2022-07-03 01:38:48.101205
954	xssmthfqh32227st224cyde5khn2	DSCF4671.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	84361	OYuHtp1ptCJuCPyfZs0iIA==	2022-07-03 01:38:48.472004
955	vm72b9ut8ij4l2gasngnzlx542z5	DSC01109-102.jpeg	image/jpeg	{"identified":true,"width":640,"height":361,"analyzed":true}	local	24254	2DYVJgJcRw9UCV1jXA914g==	2022-07-03 01:38:48.711523
956	4bfdodfxlwikgbpa44doeplwmylz	IMG_20170519_184422.jpg	image/jpeg	{"identified":true,"width":1200,"height":890,"analyzed":true}	local	236565	91TomhJ+UMts8iLX/HbkNg==	2022-07-03 01:38:49.305273
957	3tymy0seg2wrn4w8g9dwne2tao3w	Puig-Reig_2017.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	128385	J8ZEs9tJPfN+PTw5Thdskw==	2022-07-03 01:38:49.791941
958	vuf7ximg7l3enorwndg6yw072qrv	matar_1_2017.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	107381	J7mlkTIIQga4k5fkh3j8rw==	2022-07-03 01:38:50.264521
959	nkliko7ltvoqm0ixvck2u40cdl2k	MIREIAZANTOP42.png	image/png	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	1886613	v2WeHvVbXawmgAdTtJQclA==	2022-07-03 01:39:19.216718
960	4v7m6bjx4jjttbklek8gdwtlkfyp	Josep_Sou_IMG_4360.JPG	image/jpeg	{"identified":true,"width":1170,"height":900,"analyzed":true}	local	151910	Jicf5JBxBNuOLhyirqXBGA==	2022-07-03 01:39:19.669799
961	hci7zmoz5oryc7u02bv2n9wdyvod	MIREIAZANTOP51.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	105785	GRnhwyFK6Q+B532kAitLZQ==	2022-07-03 01:39:20.07627
962	4jvmo8ds1kxkz3shslm6kdesmbwr	MIREIAZANTOP59.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	95092	YpJwVxDu6rBwPkEjc7WYow==	2022-07-03 01:39:20.394425
963	gufcqr1j3ehb8q2fnd7f95ymdzhy	IMG-20161002-WA0002.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	80011	2Xgdz7p8s1VAN9NTiHxuNg==	2022-07-03 01:39:20.73453
964	f39h4sokpo2y97etmza6d4e2e32g	DSCF3668.JPG	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	87521	eMpVkbLcLoNygmBuoCKV/g==	2022-07-03 01:39:21.169542
965	fe5te5zwjt3z9ztgflxi5w15d4ti	DSCF3662.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	61793	7L9MAhp6rkRFa+ZS0Z1L1w==	2022-07-03 01:39:21.432539
966	c408ysppk4bd6627slu591bmmcbj	DSCF3670.JPG	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	69606	B+UFqcx5TTPqMyqAQKi18A==	2022-07-03 01:39:21.73217
967	t2j1j967a0ornsfgupc3brcl558r	DSCF3683.JPG	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	89355	t3NA/UECK5S1l7EybIMNag==	2022-07-03 01:39:22.139214
968	6gds294try2ddd7olsebuqubn9e2	DSCF3681.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	111185	M8r4ag+x30519haggAC0Rg==	2022-07-03 01:39:22.554395
969	7hbkjvjk7x6no8b898ep4yewdhls	DSCF3656.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	90093	hbiAnX3akzOwDBj37lPygg==	2022-07-03 01:39:22.98896
970	04u3m44dx5ageyh2escael5g517u	MIREIAZANTOP8.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	113745	xBpjL8Ob4cW2f+EGc1j4Yg==	2022-07-03 01:39:23.458222
971	9tcauva32td69sgi98ufdfizlbso	MIREIAZANTOP15.jpg	image/jpeg	{"identified":true,"width":1200,"height":857,"analyzed":true}	local	155788	DgGruTICBX1/7rYy97cFAA==	2022-07-03 01:39:23.91775
972	ikfdeghf3w6y4wzf1keunl6v0ddz	MIREIAZANTOP22.jpg	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	146262	myKKFSR6Z7qcs49Zgm+Agw==	2022-07-03 01:39:24.427981
973	koyn6804kn4zc7eito90jj03ysc8	MIREIAZANTOP23.jpg	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	60557	4FQiITExVoNABRBYMEbKsA==	2022-07-03 01:39:24.698566
974	nxtv302vz5gx4sps8fqa537vrkjr	donar_veu..._desig_Manlleu_2016.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	73862	C/2OL8AlXJbFHa2GuUv+Mw==	2022-07-03 01:39:24.985431
975	fjhylvvrq6owjieq1whuas0a04o9	inundart_ph_72ppi.jpg	image/jpeg	{"identified":true,"width":225,"height":300,"analyzed":true}	local	11510	YGqH8B7v3K1NPp2Tps7WWQ==	2022-07-03 01:39:25.12893
976	mdebwusqkckuq1i7vx985i8uyyo5	corpologia_25_5_Girona_2_retocada.jpeg	image/jpeg	{"identified":true,"width":577,"height":379,"analyzed":true}	local	17753	+9b55V0+GE/zUW6zAabs+w==	2022-07-03 01:39:25.302721
977	gd4xitdk2eho501cwsls4svm3j9i	corpologia_25_5_Girona_3_retocada.jpeg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	104926	ON16UniTtn1Jq+Y79PgS9w==	2022-07-03 01:39:25.711911
978	qvaev3pv3oimsewtt4i1c5gof0jd	corpologia_25_5_Girona_4_retocada.jpeg	image/jpeg	{"identified":true,"width":1200,"height":844,"analyzed":true}	local	87577	Qhsj2bPTU7a945hsGfGWOQ==	2022-07-03 01:39:26.075448
979	qe7qwoqpskjmt4j8t5y6uv0zqqkl	be___IMG-3930.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	117260	x5d/eiAOGvDSgfz8ipykVw==	2022-07-03 01:39:26.643871
980	gga5026vtcrn60l06fpk1ky1no82	be__IMG-3931.JPG	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	124732	Vu/54Zlh9/aSolQuwwKCkw==	2022-07-03 01:39:27.086313
981	hi3zs31zvg2remk4huksb26dhkxy	72ppi_rocs_de_lluna.jpg	image/jpeg	{"identified":true,"width":1200,"height":788,"analyzed":true}	local	110857	h2nYrBeyXyv8LXGjZg1o5g==	2022-07-03 01:39:27.571203
982	ic6xbodgzzc0ha9qj30beoyqs9gb	P1050649_redimensionat_amb_gwenvi_i_1024_.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	47143	7RNfAqsV0PeXbAu12xzO3A==	2022-07-03 01:39:27.845813
983	6316swavk9cldv3bnpveybsbl2f9	P1050656_redimensionat.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	48581	99eAygqdvsfdyhYzTVlU7A==	2022-07-03 01:39:28.127902
984	mqyzcgg0rmt2x6jj3n3l3op3zj0s	ph_72_ppi_peus_redimensionat.jpg	image/jpeg	{"identified":true,"width":1000,"height":750,"analyzed":true}	local	62192	fZ3lB3M7ZZ5jNRxPaFZRtg==	2022-07-03 01:39:28.523524
985	swer3023v2aak37ok050jyiuwepd	P1050670.jpg	image/jpeg	{"identified":true,"width":705,"height":900,"analyzed":true}	local	61724	CgzM7+UPlYKSDlXpf5RBBg==	2022-07-03 01:39:28.804345
986	g1appkva79pmyf4ey9smsn1qzvki	P1050683_redimensionat.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	41713	pPW1zBB+nA3wvk90heCbMQ==	2022-07-03 01:39:29.05286
987	rpzfwuovtzkeef4bhju5ux3c8qvn	IMG_6115.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	99061	Bm7P13WWYiWcgMRwD1b/lg==	2022-07-03 01:39:29.465011
988	ih8nm1eura5hsjf4iwj3nyabd50f	IMG_6129.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	78814	d8iZe1DmpVlDURkKXXlRTQ==	2022-07-03 01:39:29.801619
989	sij307au70tamiyyyadki61zofl2	IMG_6130.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	72955	AfV2Wphfa4wZC5qyrkQKdQ==	2022-07-03 01:39:30.184275
990	yzywriey8252ehoeo48mk0e0cgbk	IMG_6183.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	107309	T9lXOVIby1TDOS/9Z80PEw==	2022-07-03 01:39:30.557897
991	blny18qwy67uqjvgxwqrphp2y9qr	P1060009baixant_qualitatjpg.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	97280	pfvUl8P+S1KcXpOvLe+Vfw==	2022-07-03 01:39:30.92281
992	j3fk7js4qg4nndzpt1qmdhwkcmzp	DSCF4982baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":882,"analyzed":true}	local	82239	T7lGc7FOHQhSgg5F5MOUQg==	2022-07-03 01:39:31.249666
993	sd4ixh4hw8hcryuqiia1t5508bti	DSCF5039baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":661,"analyzed":true}	local	53998	OUbE+fzA7trR4wrJsvfPMg==	2022-07-03 01:39:31.532261
994	ma6zpwj6x5nytfrwu0pgbsme4zk6	P1060026baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	48097	iLTV5svEj4NpC35T4o0W6A==	2022-07-03 01:39:31.790604
995	osj73glcmtbuz9zrc2pjkrfqo8dx	DSCF5004.JPG	image/jpeg	{"identified":true,"width":1200,"height":753,"analyzed":true}	local	89607	OFFKoA4J68a8/6h4rMfh6g==	2022-07-03 01:39:32.138164
996	encopcithwp264zi1dlsloqtzh6z	IMG-20180716-WA0015baixa.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	31205	iTIQRiuofyr53vxo9f3Zaw==	2022-07-03 01:39:32.351565
997	jwl29pszu530h17erzj1xu81qamb	IMG-20180115-WA0028baixa.jpg	image/jpeg	{"identified":true,"width":506,"height":900,"analyzed":true}	local	20894	TTjYM9zhsqCDqaRRBZTm0A==	2022-07-03 01:39:32.565711
998	rijdr6jdktqivqwaretz1o3izibo	IMG-20180115-WA0024baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	52391	EHnkCx138DsvdAAR3ikbgg==	2022-07-03 01:39:32.796756
999	h62gqpprzndwicgfmcsk0ncz57qp	P1110547baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":802,"analyzed":true}	local	32278	gAZH78gtiYAdBoCRcem6gw==	2022-07-03 01:39:33.032871
1000	yyz5zreqqvsjp3jac8a5lqwmxzbq	P1110555_aleix_vallverd__baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":802,"analyzed":true}	local	31703	u229N+WNmXLkTvM2WfkuRw==	2022-07-03 01:39:33.277363
1001	rl4y4dorl5na8ar0oawoxotsccbb	P1110558baixa.jpg	image/jpeg	{"identified":true,"width":1200,"height":802,"analyzed":true}	local	23425	docnmLr9zdXeDyJ8VvQxeg==	2022-07-03 01:39:33.550316
1002	le3z030hcdj7rbcbdtgcrslrgo0a	IMG_20190112_132919baixaMZ.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	43432	2RPdMsZ7OE15oliTKeR7eA==	2022-07-03 01:39:33.816034
1003	x8bw6dmy1l6nnq1cdp0ewzkqj2iu	IMG_6180.JPG	image/jpeg	{"identified":true,"width":600,"height":900,"analyzed":true}	local	36788	8WmsetHh6xIwf5nxjDFzSg==	2022-07-03 01:39:34.085002
1004	2ivgz29mktnp52nh501vtcczljj4	almost_finished.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	133581	MPLGWF1FQ08lcen3HuVbzg==	2022-07-03 01:39:34.556516
1005	k6bi2eb1ktcxz3v4nckfmow6fulu	cap_2_IMG_20190405_174933_504.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	289719	oPRlprgQ8hYTVH4lHIonjw==	2022-07-03 01:39:35.264717
1006	lrmso0q1vaisdu6geupufqnp4oa9	capcap_2.jpg	image/jpeg	{"identified":true,"width":1200,"height":802,"analyzed":true}	local	170171	me4JRoMn1sPJstNytZ30Aw==	2022-07-03 01:39:35.761759
1007	rrlg3185e4i7h2s7ykqrp895zxrj	cap1_IMG_20190405_181244_013.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	246746	7G/xNz6g9ok3ZhkzJPP+mg==	2022-07-03 01:39:36.461776
1008	ohka6beqoss46wcooxiwclpebtnp	cap_1_contrallumIMG_20190405_174610_478.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	131629	ruHf78pjwf59Wk3oBBLHMg==	2022-07-03 01:39:36.911979
1009	zrdn5wdi4t9upu24z2yf4eejanux	Escultura_sadernes_ONA.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	230073	v/L22Jjret+cI0S89oqFSA==	2022-07-03 01:39:37.465555
1010	s2hx4paxi19f2tz7bhey74ubccei	IMG-20150907-WA0003.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	279914	m7jy9m1Ds1XcP21hqFW2Eg==	2022-07-03 01:39:38.131202
1011	jq9jzr7e9woa1vd8vq7md2tnatzx	SOM.Escultura_equilibri_ONA.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	199534	bphCGsHxvJH9wryFXKI13Q==	2022-07-03 01:39:38.672248
1012	71idthr96bfccllar745ust9ivgy	cos_cosit_IMG_20171101_155853.jpg	image/jpeg	{"identified":true,"width":1200,"height":784,"analyzed":true}	local	253199	VLrqoPF3ksARv73ZU0GN5g==	2022-07-03 01:39:39.273984
1013	etljub046zdtno8hfn6m6wuy3oaf	20150118_131247.jpg	image/jpeg	{"identified":true,"width":1200,"height":720,"analyzed":true}	local	226058	6Dq5py7Xa6MJEF2n35NLrw==	2022-07-03 01:39:39.866353
1014	4kjwpwtbd5f21542y8rjwgfl7vzd	funambuliaIMG_20171104_161244.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	302194	9Ed+4UFHiRFgsXg/tC7uBw==	2022-07-03 01:39:40.567079
1015	b0kv825nmpkbrypdgnu2bh3upkkz	cordada_IMG_20171101_162351.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	375181	1qB9YaG5v+C1RqbNjR51sg==	2022-07-03 01:39:41.422928
1016	j1614sxvchu13ku55im19x1lw5l1	IMG_20190125_162217.jpg	image/jpeg	{"identified":true,"width":896,"height":900,"analyzed":true}	local	78374	YmL4iF2dknUYxpJb2EOR5A==	2022-07-03 01:39:41.800871
1017	u1fopfzhf970fkd9ruhnnpgn15mx	IMG-20190225-WA0007.jpeg	image/jpeg	{"identified":true,"width":1200,"height":783,"analyzed":true}	local	81190	tNdTQ5GqxAAWOzAILU9mzQ==	2022-07-03 01:39:42.206525
1018	5zf9avmeaxney465nm8nf5gkd6ht	MZantop_4.jpg	image/jpeg	{"identified":true,"width":633,"height":900,"analyzed":true}	local	61972	lNUjiZwwDXVw9GddIPDcjw==	2022-07-03 01:39:42.503097
1019	4i0xv97pqsy3izw94iezkmnhjdb2	_20190412_193903.JPG	image/jpeg	{"identified":true,"width":684,"height":900,"analyzed":true}	local	106080	lhVPQbRqaX4huTOsfGDVbw==	2022-07-03 01:39:42.8982
1020	of3q3y23wtubs85kyv75a1jv5kzs	MZantop.JPG	image/jpeg	{"identified":true,"width":658,"height":900,"analyzed":true}	local	78354	SKI/LjXK/KnP5+pcOCwqPw==	2022-07-03 01:39:43.202474
1021	carcbr5h2fsayqzyb85rmkkpsp5a	mzantop_3.JPG	image/jpeg	{"identified":true,"width":692,"height":900,"analyzed":true}	local	46327	vfrzA/GlA5j3peD3fVNmIA==	2022-07-03 01:39:43.457028
1022	hx0xd9a8489s3yczujba3igx75mt	cartell_i_info_de_taller.jpg	image/jpeg	{"identified":true,"width":900,"height":900,"analyzed":true}	local	158283	wnj6RFWbswK8GRZEwXfRPw==	2022-07-03 01:39:44.044036
1023	hi3qqjzkivxiy1qk6khqjkas96z3	IMG_20190518_124322_433.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	105858	1tMEBMIwwyzGhwKINooTsQ==	2022-07-03 01:39:44.442424
1024	k7hrik33m52ytrlo1g4r55nnwvx0	IMG_20190518_124507_084.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	98881	wbnAx4WSt6LCwpDkpezjow==	2022-07-03 01:39:44.861938
1025	qaopso07o3qr5h4gujv3otund301	MZantop_2_girat_a_dreta.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	91299	3FLIkAQW7tAvzkvGWbnDpA==	2022-07-03 01:39:45.179747
1026	k9mbyz3k8aiifx43lz4k3jkb54p3	MZantop_O.JPG	image/jpeg	{"identified":true,"width":736,"height":900,"analyzed":true}	local	39323	3Xaxqc8kuHQn0vLtfW51IA==	2022-07-03 01:39:45.431901
1027	2lbo64h8qc1csw8gyrdpp2fwp0hh	MZantop_S.JPG	image/jpeg	{"identified":true,"width":759,"height":900,"analyzed":true}	local	46644	hAABHynDsa46SOEanINhUw==	2022-07-03 01:39:45.696422
1028	3jc5ib4vdme52g8pfgknzcsc17ng	DSCN1209_2.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	83349	3TcUFzLSGmfO8kobsqaJdg==	2022-07-03 01:39:46.097444
1029	crxwh8b9e3fci6b4eeou086foyw9	2014-08-05_11-33-00.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	90600	fsjumCcaZSAUjmdl2V1QkQ==	2022-07-03 01:39:46.514747
1030	jqkf8zsfpgjl42i932n6evm4l1ir	2014-08-05_11-44-56.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	41515	bxbnd16ES4Rnik2QFsL3Pg==	2022-07-03 01:39:46.904969
1031	ep5qdzwgydq0vf5lkqfdzi0lhry6	2014-08-05_12-09-46.jpg	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	45732	HyF9bKlSipIpKLM6cktp6w==	2022-07-03 01:39:47.22258
1032	wfm4qmyqkbslwn1qvb4sn67kxfda	DSCN1288.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	90233	QkWkWsbUDI0IS4/Vrihz1w==	2022-07-03 01:39:47.611033
1033	vu8g2cnyv6qebgv5lsouavb8v3sr	2014-08-05_11-39-24.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	78217	mWARNumm0HWBCFvzfQjNDQ==	2022-07-03 01:39:48.048941
1034	feb6dl54a23nv4zudqnolrwb1lon	2014-08-05_11-40-12.jpg	image/jpeg	{"identified":true,"width":900,"height":1200,"analyzed":true}	local	77464	u9gOLDrxLrnCLXZDDn1a8A==	2022-07-03 01:39:48.47479
1035	ipcszxq5t1f96in9ayjolwdgq1hx	2014-08-05_12-20-18.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	46935	331K6pUB5Lsq3zuDF3vSKQ==	2022-07-03 01:39:48.819606
1036	g97g7i9n5vc8qwammf9fbpdzbeam	2014-08-05_11-37-52.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	69731	irzWr7Nu/tHg94X2aao3lA==	2022-07-03 01:39:49.235202
1037	tu57pv2t538ms5lqq9a14vs56tvk	2014-08-05_11-30-34.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	42782	NkDo8QmIryb4UF2WcTMGeA==	2022-07-03 01:39:49.62195
1038	smf38b5sz5uppkyiwuob8tc4gw2z	IMG_20180928_164827.jpg	image/jpeg	{"identified":true,"width":893,"height":900,"analyzed":true}	local	51389	KKvEoNGME/jl8O73AirHxQ==	2022-07-03 01:39:49.934652
1039	bsox8swczn6hv14noawjx5wm3o43	Gravat-Nou-cuadrado.jpg	image/jpeg	{"identified":true,"width":800,"height":800,"analyzed":true}	local	45773	pDGiI+jFiUzUvaw67e04bQ==	2022-07-03 01:39:50.214139
1040	r85fslztai6ek27acys86hymtk7s	IMG_20180928_165542.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	95464	52Ibyi/WGzGfGA4uWfcLJA==	2022-07-03 01:39:50.684326
1041	c4w1vd1lhnst3936m6uctfqhyph6	IMG_20180928_164531.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	57874	rN+roQXksGqYz4bIJDOSfw==	2022-07-03 01:39:51.009895
1042	6jruzmi6uipq6revw1h90a4hlcv2	IMG_20180928_165940.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	108140	AZy1+4bCRJ9m9qw7ufF+EA==	2022-07-03 01:39:51.639663
1043	irhcfnfi5qn7n7na0de9yqyvb5s7	IMG_20180928_170858.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	108028	451X+JVRHU0XLA7F17QdwA==	2022-07-03 01:39:52.066517
1044	2m1d9zv1d4ucgck1wm8f4io351l2	IMG_20180928_170923.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	66384	ZlR3YUnpUmwLA5P1QonDtw==	2022-07-03 01:39:52.445242
1045	fjsmwxvp8x7qyywbhoy0lrawu4jd	IMG-20190307-WA0001.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	55140	3bEBiMjviEJ76uzmKiLlBg==	2022-07-03 01:39:52.874601
1046	nsbvx3lhyuz48dva1u0qptzpyf0t	IMG-20190307-WA0002.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	60274	jv5Ab2v58PoziU11TdVlQA==	2022-07-03 01:39:53.166488
1047	6vp1jqc1ebhrzbpekxkkv1a98ynj	IMG-20190304-WA0006.jpg	image/jpeg	{"identified":true,"width":586,"height":714,"analyzed":true}	local	51766	qJksQkaipCipQxfDTjYLbA==	2022-07-03 01:39:53.448825
1048	xze2260u3mvg6pgpwqdj1mftaudl	DSCF4797.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	135302	xWeJOWc2yXsEYXHaKkKRpw==	2022-07-03 01:39:53.987591
1049	w3zvry0fxfgrldsqxyei6ua1lra0	nav_s_2016.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	151167	bENIjH9A7GiZLGunGVH6Mw==	2022-07-03 01:39:54.593382
1050	i3adfori5o1o59iw1ku141v85hqj	IMG_9343.argentona.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	81848	aGj4t3ENsnbOgRs7TyCWwQ==	2022-07-03 01:39:55.080241
1051	rm5ywvte7t1p2zshskhrr0fzf53o	cardedeu2_2013.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	139922	zKwx3+eiYS3H+18aaPMe4w==	2022-07-03 01:39:55.596484
1052	e2opes0plmnfkhyxemst4sf96jnt	DSCF4797.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	135302	xWeJOWc2yXsEYXHaKkKRpw==	2022-07-03 01:39:56.079032
1053	akaoucxouw7lee2i6pkzk2489y0y	DSCF4408.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	205335	PbsZeIEpOV6Ietuei2iB8w==	2022-07-03 01:39:56.736219
1054	a3ku6f90t5nvwjou33hfx5jxf6il	nav_s_2016.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	151167	bENIjH9A7GiZLGunGVH6Mw==	2022-07-03 01:39:57.291679
1055	vm063yeditmkjd8silzsr9xs4iw7	IMG_9343.argentona.JPG	image/jpeg	{"identified":true,"width":1200,"height":800,"analyzed":true}	local	81848	aGj4t3ENsnbOgRs7TyCWwQ==	2022-07-03 01:39:57.700748
1056	ojfwdm2p6nvt9su7m5yzq0p607vn	cardedeu2_2013.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	139922	zKwx3+eiYS3H+18aaPMe4w==	2022-07-03 01:39:58.225377
1057	lavrqvap434fdwg56jbxrtxh0vvn	M.ZANTOP_phoscenes_TINTA_a4.jpg	image/jpeg	{"identified":true,"width":1200,"height":891,"analyzed":true}	local	78054	iho20bz8wzp4QxbTdcIOHA==	2022-07-03 01:39:58.627634
1058	mhxxr8j1lc79ie18bf40alpikz87	M.ZANTOP_phoscenes_PHOSPHORESCENT_A5.jpg	image/jpeg	{"identified":true,"width":1200,"height":888,"analyzed":true}	local	84909	XQlvriiPBjmS4YEKt2VyCA==	2022-07-03 01:39:59.141236
1059	ocxm6983ltm4jl1mxat5rhg9i3wb	M.ZANTOP_phoscenes_a4_NUS_3D.jpg	image/jpeg	{"identified":true,"width":1200,"height":893,"analyzed":true}	local	48019	iU8BKCdcoK93qMJqEfkhbQ==	2022-07-03 01:39:59.498663
1060	km88hl7cxnmr2lyzysd0z9dp5s2d	M.ZANTOP_phoscenes._tinta_a4.jpg	image/jpeg	{"identified":true,"width":1200,"height":859,"analyzed":true}	local	106690	Xycsg2Hh/UW73P84mpUO9w==	2022-07-03 01:39:59.962878
1061	lmz93ouxgpayeesddruo957eztia	M.ZANTOP_phoscenes_mute_a5_.jpg	image/jpeg	{"identified":true,"width":1172,"height":900,"analyzed":true}	local	65192	I9NemuyOU3UBMMRqWbbPgg==	2022-07-03 01:40:00.348529
1062	x590g407g6zis17nrl01q4ob50fw	M.ZANTOP_phoscenes_aiguada_A4.jpg	image/jpeg	{"identified":true,"width":1200,"height":842,"analyzed":true}	local	51735	UAjtv0kMmsClute9k2INpg==	2022-07-03 01:40:00.713934
1063	5002kbp9tfcuzf4oe6m3c5104z1b	M.ZANTOP_phoscenes_P_TALS_A4.jpg	image/jpeg	{"identified":true,"width":1200,"height":868,"analyzed":true}	local	76097	p/Owc2xzaxGnwrEfv5+5HA==	2022-07-03 01:40:01.125531
1064	e1icpold3b5koob1k3krsvyjlq8r	M.ZANTOP_phoscenes__AIGUAda__A4.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	37127	l5QBY4Sq0VudfInBCWCMpQ==	2022-07-03 01:40:01.477472
1065	gz1we8s0ktcq45ty6c8b5fu3o8ov	_20191228_100620.JPG	image/jpeg	{"identified":true,"width":681,"height":900,"analyzed":true}	local	91577	yl1Rl8IfKUMJF2mYPv0hiA==	2022-07-03 01:40:01.943851
1066	zoshfbdnx9cu43ilob4l8qlru6f5	IMG_20191225_133646_151.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	102560	vAh+Dq06ryUW/gzLWok0dg==	2022-07-03 01:40:02.629276
1067	6l4kk27c2wocrf5ww78dmufqlg35	IMG_20190831_132411_157.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	283621	30/Huy623wLoZINFC7pdig==	2022-07-03 01:40:03.551889
1068	vvggvyaphum4am75osb2fgpj6u05	IMG_20191225_132357_968.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	167911	wM4sOpF8dxSAJTRE2s6slw==	2022-07-03 01:40:04.106451
1069	mphtvnddpebihwmmrletq81nhtrw	IMG-20200924-WA0012.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	178168	sYo6rRLijoWpz8ny3cE2bA==	2022-07-03 01:40:04.681404
1070	c2831gj0nhgxgo813f463c23jore	IMG-20200924-WA0005.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	163592	KqCaQieOBfgfZEkRgoypPA==	2022-07-03 01:40:05.412845
1071	ifcluqy2iral9cnqo2p3zqmvlk4g	IMG_20201016_172309.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	91633	MvHvTjso46vGP7vpx5IkaQ==	2022-07-03 01:40:05.787871
1072	e7qo4m0mf6cdfa9zg3av2ooptqua	IMG_20200308_180723_115.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	139662	n8qZz1UpVR4Yj7eeRmWmEg==	2022-07-03 01:40:06.429655
1073	e1csm8tqg32t3aw7yjawoe1imyq9	__retocat.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	145648	GHm9jgK98NpbDCXMJb90iA==	2022-07-03 01:40:06.942434
1074	s0pwnpei678o0zdt4cjrsr5ua246	des_cuidar_accionant_IMG-20200308-WA0020.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	275619	TTZ6fSl2HpkXnuBFxjADtQ==	2022-07-03 01:40:07.686906
1075	5th9ezpndfl44jkbrp0i8tf4sc95	IMG-20200308-WA0039.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	62030	gjGGysrWa1bDNct7E14uFg==	2022-07-03 01:40:07.954763
1076	v0zt6yj9z6cdh0jzg8mduik2m7lp	IMG-20210315-WA0017.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	232051	PeVCDB2nw2XVmjqhZp8xJA==	2022-07-03 01:40:08.579993
1077	m12c32pe7d82u8wrcm778ovcw96h	IMG-20210315-WA0016.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	253324	0FW1l/lzT8Um7NuFGZ9Pbg==	2022-07-03 01:40:09.226376
1078	lf5o79z5mi5mjakje22zfgkreuv4	IMG-20210313-WA0009.jpg	image/jpeg	{"identified":true,"width":1200,"height":681,"analyzed":true}	local	316390	rz8injj+uWSXtUnYdNeBIA==	2022-07-03 01:40:09.974033
1079	mgjstegbdfxjplt2bevyvsxho66u	IMG-20210315-WA0011.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	165963	CrkO72kw4HocPhv5tcKC6A==	2022-07-03 01:40:10.431214
1080	lzjt3534vdevgaed85b5m0ddri8j	IMG-20210313-WA0004.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	102760	8k38E0dISVABLTrU5TiMKw==	2022-07-03 01:40:10.837651
1081	qq39bi4jl2lyvhx53xic1i4kzv8g	IMG-20210313-WA0010.jpg	image/jpeg	{"identified":true,"width":675,"height":900,"analyzed":true}	local	51641	cineCDC2ceNDZJJOswvUpw==	2022-07-03 01:40:11.543573
1082	dy0m603o6m6slpw12j9jgip6l0dc	Captura_de_pantalla_de_2021-09-01_01-17-09.png	image/png	{"identified":true,"width":961,"height":539,"analyzed":true}	local	252507	Lt5mL9S51BrEtoPzO6ZpWw==	2022-07-03 01:41:02.96424
1083	ypvcvnaxgsx8yh7l8fjt97wfo8gy	arts_entre_lletres_foto_joana_querol.png	image/png	{"identified":true,"width":525,"height":353,"analyzed":true}	local	189766	KMRFTDma5iI/7D4YqHu4eg==	2022-07-03 01:41:19.069528
1084	mjfnq34l3tbegszxk4mrcz3yor1g	IMG-20201116-WA0010.jpg	image/jpeg	{"identified":true,"width":1080,"height":607,"analyzed":true}	local	64659	EI6sNssmB64VgJtfNJhjJw==	2022-07-03 01:41:19.401629
1085	9ofa07kwtsxl8qfju52icsreqpgm	IMG-20201116-WA0013.jpg	image/jpeg	{"identified":true,"width":1080,"height":607,"analyzed":true}	local	74160	K8bqm5o9yWqxw/+Dim2fUw==	2022-07-03 01:41:19.780689
1086	mth2rhvd4zvzrfp5y0y0j5toazvr	DSC_0037__copia_.JPG	image/jpeg	{"identified":true,"width":1200,"height":803,"analyzed":true}	local	196795	ALuVyIZsdquyWoDZVLTc9g==	2022-07-03 01:41:20.34448
1087	v3zta52d5vzwt58hkzzq6odv6h57	Copy_of_DSC_0046-001.jpg	image/jpeg	{"identified":true,"width":1200,"height":803,"analyzed":true}	local	106230	MsbB4ZQ9RvabnZGGuDLc+g==	2022-07-03 01:41:20.784946
1088	1y222irzckfku8xsmkl6kpmdnb6c	DSC_0079-004.jpg	image/jpeg	{"identified":true,"width":1200,"height":803,"analyzed":true}	local	192286	ZIp+GiLoiapKIMb4skhwqg==	2022-07-03 01:41:21.402724
1089	1ndmjwmq9g8izmm9fpinlpqbcv0n	DSC_0083-001.jpg	image/jpeg	{"identified":true,"width":1200,"height":803,"analyzed":true}	local	195269	GbqF9dTnXwpwAzM+/1nYTQ==	2022-07-03 01:41:22.047258
1090	3gecxofdee0fug2kipp6nwb6yt3a	DSCF5838_cavar.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	161654	uPcaJh/yi5jQxqKWrmXGjQ==	2022-07-03 01:41:22.651179
1091	zghy8xf6njsrp62sdv35qgv079n6	DSCF5843_clavant.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	133234	uR0iHMEBumgIY0Hsij8dEw==	2022-07-03 01:41:23.218535
1092	t3xz6itlyrxweubgys2imq30qzw9	DSCF5849torre_lluvi_.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	116133	FXYb9k4X6wBe5pBUO8hDgQ==	2022-07-03 01:41:23.757132
1093	agjfvv2tz5qryuynf2dhxk1g4bxk	IMG_20210827_195621_103agulles_al_pal.jpg	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	171695	q9FyIWJWdLgHmX2p1qCBVQ==	2022-07-03 01:41:24.360068
1094	rlq99hz39hr1q2ve3h062f0m8rrm	P9650800_grup_estaques_i_estaques_fons.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	212657	pi9d6ma9g1g8aJmf0Wod3Q==	2022-07-03 01:41:25.001298
1095	097cryr9nqtah44g3ogrvkrbbx15	IMG_20210829_084447_1amb_cam__.jpg	image/jpeg	{"identified":true,"width":506,"height":900,"analyzed":true}	local	115956	ybDrYaLcLwUzFTTcViE30g==	2022-07-03 01:41:25.436439
1096	7yyfoukdr3kdxnjjh659tsy6d7wt	P9650824_caminet_i_pal_agulles.JPG	image/jpeg	{"identified":true,"width":1200,"height":900,"analyzed":true}	local	131148	QPExT5fVc73YiOzxw5Pjgg==	2022-07-03 01:41:25.955466
1097	kba4vm6axt2xm86o3k2j2pm2tzhl	IMG_20210829_084622_1encaix.jpg	image/jpeg	{"identified":true,"width":1200,"height":675,"analyzed":true}	local	133034	vlsLzi5GDxVedFr2GrcYTQ==	2022-07-03 01:41:26.415321
1098	epqzf6u7i4wgyh28h15oecrjigrr	DSC_0106-004.jpg	image/jpeg	{"identified":true,"width":1200,"height":803,"analyzed":true}	local	239072	/r7rPVFNogiW5vfaCwBtnQ==	2022-07-03 01:41:27.084522
1099	jcokrihmyv2rep85p2f3q639pj7x	ZANTOP_-_4._Odumonde.JPG	image/jpeg	{"identified":true,"width":699,"height":900,"analyzed":true}	local	81376	up1y7NpymFsCCxOVekudFw==	2022-07-03 01:41:27.482562
1100	4ddfuiirxroal7jyocybdg592q8r	ZANTOP_-_EQUILIBRIS.jpg	image/jpeg	{"identified":true,"width":563,"height":900,"analyzed":true}	local	45917	gf3PJmxEmWb/4c13k2Sd+w==	2022-07-03 01:41:27.762556
1101	47sslnnacvvzuyh8sjk8zqdtozvg	ZANTOP_-_ESSENSETEMPO.jpg	image/jpeg	{"identified":true,"width":900,"height":675,"analyzed":true}	local	45479	GQ9cB26jmZiBAxB5cFnOaQ==	2022-07-03 01:41:28.15281
1102	o0nne392e7mbx90of87gcfai28wp	ZANTOP_-_1._ATADALASALAS.jpg	image/jpeg	{"identified":true,"width":743,"height":900,"analyzed":true}	local	117381	VtYbqmyXPRf/8k8Q/4Oa/g==	2022-07-03 01:41:28.586215
1103	tpetc68fkerx0ojgt9f2i7u4bjyb	ZANTOP_-_acord.jpg	image/jpeg	{"identified":true,"width":725,"height":900,"analyzed":true}	local	103985	dsiug64OqmFoJlzzUFp+EA==	2022-07-03 01:41:29.007753
1104	1rnd90uya9upkcz8yxp2wabxffmh	ZANTOP_-_2._piet_.jpg	image/jpeg	{"identified":true,"width":758,"height":900,"analyzed":true}	local	121972	KWB/sszvKGLtITkQEWRhxg==	2022-07-03 01:41:29.546569
1105	k2qol1id095gjityoo9u4am0ia6e	zantop_-_coeurage_.jpg	image/jpeg	{"identified":true,"width":769,"height":900,"analyzed":true}	local	50785	Vz1njqZcEQG65VDMm/37Rw==	2022-07-03 01:41:29.852801
1108	t7ijau07gfgt065koy31kxz0p8c6	P1060009baixant_qualitatjpg.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	45960	7nMZnyQqy3EEGI6MxC/s4A==	2022-07-03 21:48:57.530012
1107	0qqonvvpd4s08jinroxrtiuoo849	M.ZANTOP_phoscenes_TINTA_a4.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	21668	Mgy2OEArOopXqk9mMZsLVw==	2022-07-03 21:48:57.482848
1110	ab9j3xepsa7o1mlcohgpwehcmcic	corpologia_25_5_Girona_2_retocada.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	14732	ZfdyK0zokBUKwz7h/ztUtw==	2022-07-03 21:48:57.556897
1109	qx7xvvvdnaqtehbrycx2w765j59d	cap_2_IMG_20190405_174933_504.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	43648	93NWuIy2SKkwTYWLZqDfRw==	2022-07-03 21:48:57.537824
1111	s6rd5h3i9505wpwzzoivh1g556dc	20140706_164949.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	51010	n11N1et8jrWAD1bHw5w4Xw==	2022-07-03 21:48:58.064875
1106	i0z53eni4kcb44bjyo9pogpsk11s	IMG_6115.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	26167	/qbWqwIZNWWmvLgB3yjO7w==	2022-07-03 21:48:57.416447
1112	xaz3s502w75f2mmpl0amy449lpm1	M.ZANTOP_phoscenes__AIGUAda__A4.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	1446	6eaIw+mMPauBq9ZUoh8qgQ==	2022-07-03 21:56:25.665949
1114	b8qpkajoe4re7ifm7ja6wkradp9a	M.ZANTOP_phoscenes_P_TALS_A4.jpg	image/jpeg	{"identified":true,"width":100,"height":73,"analyzed":true}	local	1838	91jc02tpbQvZ+iBjaoTojA==	2022-07-03 21:56:25.976048
1113	s9o7npz096c73usbubrqj0wneyl5	M.ZANTOP_phoscenes_PHOSPHORESCENT_A5.jpg	image/jpeg	{"identified":true,"width":100,"height":74,"analyzed":true}	local	1954	sGbJ6BBLmMzImUo9KjWbTA==	2022-07-03 21:56:25.961868
1116	podjzon12rqqh6n3skoyrwafms63	M.ZANTOP_phoscenes_TINTA_a4.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2223	Z1IgVCQPAMjslMAgdVZsFQ==	2022-07-03 21:56:26.013205
1115	itfg5yatd4s0ews4w596qn01y8o7	M.ZANTOP_phoscenes_aiguada_A4.jpg	image/jpeg	{"identified":true,"width":100,"height":70,"analyzed":true}	local	1633	I1zaueB1sbXGl2kAUYCVTg==	2022-07-03 21:56:26.001312
1117	dt8sdwk1x5bmkfc0l0kt1a2rthay	M.ZANTOP_phoscenes._tinta_a4.jpg	image/jpeg	{"identified":true,"width":100,"height":72,"analyzed":true}	local	2258	2SUyQI5zx241A0DUYvT3DA==	2022-07-03 21:56:26.06652
1118	hh5pzfz926z0pti35bnau9u95fbo	M.ZANTOP_phoscenes_mute_a5_.jpg	image/jpeg	{"identified":true,"width":100,"height":77,"analyzed":true}	local	1798	axC4uw/uPltTpLjxnEc+Xw==	2022-07-03 21:56:26.318557
1119	nhk0lcu0hum1awp1ka63no2shcg3	M.ZANTOP_phoscenes_a4_NUS_3D.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	1464	aLcSZ5nIA0Y2vUM+YuwpiA==	2022-07-03 21:56:26.421602
1120	73jg5c4pgxae1x8vlah20e8ouyub	almost_finished.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	39563	yvewN7m2EIBH1Okj5Sm/rA==	2022-08-29 20:58:48.3338
1121	yjtlsynhmpp63mgx5k4u4gsnjybi	Escultura_sadernes_ONA.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	54649	FM1TfJuaaAlQGoIC3dN0Xw==	2022-08-29 20:58:48.339431
1122	kizgc2e8ko4iv6i5onix0mp1bpxe	inundart_ph_72ppi.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	23419	xBJUDu3BT+MI1AhDMdyddQ==	2022-08-29 20:58:48.342783
1124	krs5ja2fdqkbe4cf708ds8bstc69	MIREIAZANTOP6.png	image/png	{"identified":true,"width":400,"height":400,"analyzed":true}	local	225870	1lyWpiOjzQAIEk6pr65Z0w==	2022-08-29 20:58:48.407643
1123	7i0tai8mlfviqks9q0ovnse8l7mf	MIREIAZANTOP42.png	image/png	{"identified":true,"width":400,"height":400,"analyzed":true}	local	336333	KY7A15LCe479ZWIPFCsvjw==	2022-08-29 20:58:48.403824
1125	2f8q7cour2val4f2k5ccifkz1g0x	IMG_20170519_184422.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	33869	fI3y3UpnlLknabrjM0opHg==	2022-08-29 20:58:48.844893
1126	mjum6vp3rsjyroyksugvf6bb4y86	IMG_9772.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	23687	JxRQujUdfTPefCh+D7UeEg==	2022-08-29 21:11:21.440496
1128	gil4k8nbuup6yriiky5y34dfn3nu	AdobeBridgeBatchRenameTemp7CanFelipa_15.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	15298	mz2HvKf3Rf1V3EhFexGiXQ==	2022-08-29 22:36:10.200145
1130	1wf04jdbxjkofns2xlxsgooho6ob	Cartell_ME_expo_cartells_2016.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	31738	zz9taWBnTyC9tipLTJNwIQ==	2022-08-29 22:36:10.234555
1127	0750dzv56444u0sottou5tgopgii	eventuall0.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	30633	4G7lfaZmimwTKpwiNJG6Jg==	2022-08-29 22:36:10.195701
1131	eb2t5rynueuyfizwfrzr8d3tvs6m	DSCF2590.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	36391	GARYvSRyYMGoFjb6xVLTeQ==	2022-08-29 22:36:10.264449
1129	c5qt29zrjj3f3cndag466jv7vh7z	Performance__Donar_veu_al_desig__Tona_2015__6_.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	54056	p04DI6JS1VTge3bFenQa5g==	2022-08-29 22:36:10.211454
1132	0dbjpx3ldne2ddwer8kmh5y2vxz3	IMG_1468.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	25641	3OaJZb9zksHYJ84gaV91VQ==	2022-08-29 22:36:10.692195
1133	icxb6rox9dnkes7oxwqeclf1bjmi	IMG_6061.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	14314	v7QZyhdqfS+3bdtpXHL+rQ==	2022-08-29 22:36:10.728082
1135	3jhqs1r1s2i9ltjwsiaeoti7d3gg	IMG-20150128-WA0000.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	18354	MF3hdlnQ/nBvhvXdPbaGmw==	2022-08-29 22:36:10.840714
1134	t2tbtd535g1m42dq3jfzk8yf2d1q	DSCF3668.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	21402	hzzzkwZffc9uSuuiCwtJLw==	2022-08-29 22:36:10.82867
1136	t9si6z1s2hyzdt7eok4ysps6h89y	IMG_6760.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	21159	fqvsN+KIQt7Ee5pFoWy3+A==	2022-08-29 22:36:10.862112
1137	xklw3npwzkywlq3pf9m85r8dp8ys	IMG_2324.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	16847	uJTKg0ZK0OpHgfmtTNJ/Hw==	2022-08-29 22:36:11.186518
1139	ojnmzv3q19nkoonzmtsw9ztv68zy	cap_1_contrallumIMG_20190405_174610_478.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2475	l735cmpQGw6Pu/etrf3LRw==	2022-08-29 22:42:48.675351
1141	0ebyrfljkw9p8v6f16kxm0mtxjvp	cap1_IMG_20190405_181244_013.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2862	aHUcmnIzVO7s0Kl/oW444w==	2022-08-29 22:42:48.683485
1140	2mxxy2vh84kybj352rtqrdvu57ta	capcap_2.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2501	sE9d/YQdDxBI3I/cdBjvQA==	2022-08-29 22:42:48.678222
1138	e1nuh5kv40gdjm5lzja3akh2scn9	cap_2_IMG_20190405_174933_504.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2675	cu2nZWZNv7CwSZjpWpOZug==	2022-08-29 22:42:48.672193
1142	4359v2x1hc5wd4yvcjwbcsbqw9fo	IMG-20200924-WA0012.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	3238	vTDYBRxbontMuFssgk0N2g==	2022-08-29 23:03:03.698943
1143	zt38qodr8uhe3c5bw9uhufjar1pi	IMG_6115.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2504	bP8mkwi31rHUk5WWkTDrSA==	2022-08-29 23:03:03.711911
1145	c9tkybx22z1wf1n417ycce3ecdb7	P1060009baixant_qualitatjpg.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	3557	uLXkRlL/HCEW/RQQtWYOKA==	2022-08-29 23:03:03.721113
1146	o7b9c7o7f0nu17i9ioeity5jkaug	MIREIAZANTOP42.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	12843	TUqRf2CyisorZj7KUSE5BQ==	2022-08-29 23:03:03.725463
1148	ko63yh5hrvazybt6z0cbg7kez7qp	Cartell_ME_expo_cartells_2016.jpg	image/jpeg	{"identified":true,"width":64,"height":100,"analyzed":true}	local	3017	pAcqpxq9svgXXwHaPJ/kZg==	2022-08-29 23:03:04.133184
1150	8n32od3x0cjxs3xomdv6lo62n0ht	MIREIAZANTOP6.png	image/png	{"identified":true,"width":100,"height":67,"analyzed":true}	local	11883	lBLABwjft+67ukFEquK+gw==	2022-08-29 23:03:04.140535
1154	3ykodg98acyv9yjxhwrwnaorfm6u	IMG_2324.jpeg	image/jpeg	{"identified":true,"width":100,"height":56,"analyzed":true}	local	2349	eqK8dTxtDHqyUhzvjbyj/w==	2022-08-29 23:03:04.514248
1156	ff5knfakiu17xsfsobrvxelvw3v6	eventuall0.jpeg	image/jpeg	{"identified":true,"width":67,"height":100,"analyzed":true}	local	2918	YOt0aTYXXl7Bh9jvAt0Ylw==	2022-08-29 23:03:04.538936
1158	m4l5yl4t8e6je378tvrslsdn2tpp	IMG_2095.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	1550	4slZ7J+dVZPNoRxVzkIGFw==	2022-08-29 23:03:04.880564
1164	log12mfe47yeh46rv9hqmoo2dtu7	P1110547baixa.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2666	DyirwxnDSMYTlUeuCcuE/A==	2022-08-29 23:03:05.294744
1169	apsqq4mt9ffrcngqd7wp6remol7a	tarja_birds.jpeg	image/jpeg	{"identified":true,"width":100,"height":71,"analyzed":true}	local	3383	QbE8CkkfICVWYWiqdUFXNQ==	2022-08-29 23:03:05.654452
1174	s9qeb8m9mdntxmjxm2hjjj8tnhnp	fent_volar_coloms.jpg	image/jpeg	{"identified":true,"width":71,"height":100,"analyzed":true}	local	3748	nOQiRm23Vopx2n3pPuVBIg==	2022-08-29 23:03:06.076899
1178	uw409l2dzor7myoz5qf8qoawbl0s	Possible_Foto.jpg	image/jpeg	{"identified":true,"width":100,"height":65,"analyzed":true}	local	2126	pca6W3Ky6q/C4nYD5jzQJg==	2022-08-29 23:03:06.506379
1186	xupo8e0rkroii584xyc6re72e8pe	inici.jpg	image/jpeg	{"identified":true,"width":100,"height":100,"analyzed":true}	local	3383	m0WaZYFLr/0PBqqjbVQ1tg==	2022-08-29 23:03:06.972144
1147	zt6u07h7pswv11q6ytaz94lvwjdx	Performance__Donar_veu_al_desig__Tona_2015__6_.jpg	image/jpeg	{"identified":true,"width":100,"height":57,"analyzed":true}	local	2442	Q1YlXAlqaDdybhAYmzQkxQ==	2022-08-29 23:03:04.128318
1152	rhhmso0lfap6ec3i79xgyq9nn5ey	DSCF2590.jpg	image/jpeg	{"identified":true,"width":100,"height":83,"analyzed":true}	local	3282	3jmRaDMp4V+N7wh3s4782w==	2022-08-29 23:03:04.511738
1157	0x8ndiwyu0nnnipy8dr9orl93p7g	IMG_6760.jpeg	image/jpeg	{"identified":true,"width":67,"height":100,"analyzed":true}	local	2033	O4ohQV79R7TbfijK1bgThg==	2022-08-29 23:03:04.833273
1162	njlvvjvusu39866tdb4q5ed9r5j1	Captura_de_pantalla_de_2021-09-01_01-17-09.png	image/png	{"identified":true,"width":100,"height":56,"analyzed":true}	local	7927	qEFHVsIO/KzGoK87vbctxg==	2022-08-29 23:03:05.279549
1171	ntrytwa6xokfile4vx4rwjxogbh9	DSC01109-102.jpeg	image/jpeg	{"identified":true,"width":100,"height":56,"analyzed":true}	local	2417	zYKQGZnGuSY0r+pezrM3VQ==	2022-08-29 23:03:05.728129
1175	s09sqc792yekqg41znxe05jpksgo	DSC_0250.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2713	ILlYx+gtFSqMEWIGUXbGKQ==	2022-08-29 23:03:06.139187
1181	4s1tidx57c67fim9xpvdy7o7sl3w	DSCF1204.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2235	JfhFWxeheV1+K5ZPzI0Urw==	2022-08-29 23:03:06.545973
1183	t8q9gryqq8jkko7q62n5yxuq71vj	ANA_RITA_RODRIGUES_FEM_2011_PAR_8663.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2675	4hSTeHO4hi2NjEmOVcPCIw==	2022-08-29 23:03:06.890214
1151	h30uwe2qj19wwv59fvas308ss891	IMG_9772.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	3338	mPs7/CWsnH/DgXSr4R0Z5A==	2022-08-29 23:03:04.145071
1153	kstdgzpysmlvhiito724ykqsz04t	IMG_6061.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	1884	sqG0o0j3mOKUPqZ/HDRvdg==	2022-08-29 23:03:04.509079
1160	3y5dudo0k1lwa835an8j0jnmf1rq	DSC_0037__copia_.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2856	A/g1iYb275GF1DEHz9zAGA==	2022-08-29 23:03:04.936513
1165	nlvo9drzkct381tmw1n5z15cui3k	IMG-20210315-WA0017.jpg	image/jpeg	{"identified":true,"width":100,"height":57,"analyzed":true}	local	2560	meGRq4M+zomM5fx5XWsxnw==	2022-08-29 23:03:05.3188
1167	1bu03mwiawantypd67fmu3sf523e	DSC_0037.jpeg	image/jpeg	{"identified":true,"width":100,"height":69,"analyzed":true}	local	1555	jdT0e816CW8PAiV9m4gibA==	2022-08-29 23:03:05.628483
1172	fc3bemgk26hicepq3prlqrzrtace	DSC_0583.jpeg	image/jpeg	{"identified":true,"width":67,"height":100,"analyzed":true}	local	2000	F5LVT84uFGQjA+LwfWMoFg==	2022-08-29 23:03:06.057097
1180	sxa3yien4sf01q0b27xezov5y61r	IMG-20190307-WA0001.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2770	rGjUGAmSFsF1yobjk0sSWQ==	2022-08-29 23:03:06.538366
1185	klykldsywpshksx8j4auejthrhyy	IMGP1552.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2498	LX3MgRFmnu/Bwk+PpjodSw==	2022-08-29 23:03:06.947592
1161	3d71zifndbjp1vml8id8sj5eir39	IMG_1468.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2531	E4aO+2sBnxMA9AgDv6CPtw==	2022-08-29 23:03:04.963328
1166	yya045ldz7sbxihq22dvu95nw712	DSCF4623.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2873	L4+bFFm2OnBEGWl0K0vX8A==	2022-08-29 23:03:05.343721
1170	mlv2mzlk57hhansk5syn9n4els03	despunxa1.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	3184	XJ4ddvcZ4JOfq2VwT/ANVw==	2022-08-29 23:03:05.707832
1176	6onl9h9075cfcsymyygkvca8ft1j	generart25nov.jpg	image/jpeg	{"identified":true,"width":72,"height":100,"analyzed":true}	local	2825	CpdGUAO4NWkVrMwSLmPGhw==	2022-08-29 23:03:06.169008
1179	878btw6oxvrsvco2bs46vq865wzp	DSC_0062GUT.jpeg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2528	drcq5oZJH2x6QAeni1kFRA==	2022-08-29 23:03:06.521647
1182	06rf0xu120jd1neej2qov917727m	DSC02215.jpg	image/jpeg	{"identified":true,"width":75,"height":100,"analyzed":true}	local	3128	x2rwuUvRTCECTIbqnp9EWw==	2022-08-29 23:03:06.826279
1187	pc1n8x1xqbwli2jlor8ymn8tybbr	IMG-20200924-WA0012.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	38008	wNA1FFux2GDDTacYJuADHA==	2022-08-29 23:29:35.531216
1190	bkafg7c8rpmio5z51q3f9l8i5xic	DSC_0037__copia_.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	42212	16guTDIoPUo/mwzkLrg5FQ==	2022-08-29 23:29:36.29845
1194	8abilvzsdzbua7rdvtpq2ixxcp3m	tarja_birds.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	42004	Up5G5rm1ja5HvZjx0F96nw==	2022-08-29 23:29:36.841608
1198	zfkd8lbvpmpewg6t5jywxufx8zq7	despunxa1.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	32204	K4yxIOGzk6lTiWOaekguGQ==	2022-08-29 23:29:37.333375
1205	zmdq2rf3r3fx4pqencsn3xcsdqdq	DSC05616bona.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	42830	L+ZIrD9h9PIIiJDuPTXnMA==	2022-08-29 23:29:37.799795
1207	o0fglpevojvffsi8cmblwkxa260q	DSC_0062GUT.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	20201	wjMMmEaof0A9wUVYr0FgoQ==	2022-08-29 23:29:38.162404
1215	0e72bijk51avtztoekmo70gps7xc	MZantop_4.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	25274	1vxijlELDbMCd2LShJ9nmQ==	2022-08-31 00:17:46.865702
1218	htz1zkctsf7wqyir9uenwzi1c592	portada.sarria.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	40770	ZtAPWwzkPZiKzES8Tzg6Kw==	2022-09-01 20:09:18.913438
1223	dupstuhfwrgzgbcxi1dj6bwic239	Mireia_Zantop__sin_rgia.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	29577	R/K97sQBc4qceCM5SyhSmw==	2022-09-01 20:09:22.380932
1188	jpeqz5a2oiga41gyo5mptf4ic25h	Mireia_Zantop_Accio_.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	43081	08hTeSODCvRgpzukx9wRZA==	2022-08-29 23:29:36.261548
1192	20rmh84ovvadbis6oitok5rz44zp	P1110547baixa.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	22991	sktlUGyaiGMCHeNb1SXGSQ==	2022-08-29 23:29:36.73878
1199	tq8b0r6y6mroxn8kzbhsbmlejgx9	DSC_0583.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	18077	Jihxuc/Vf/u54JDKKpNysA==	2022-08-29 23:29:37.344106
1202	9rrr0phda6ibv65gqwsqrq53auvi	DSC_0250.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	22353	okXGW5x+Doc13aCYrjZ9ag==	2022-08-29 23:29:37.771317
1209	09vd288lpsk58nsjm4fy47fwj7co	DSC02215.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	32266	noTKpvlu4l2vAD/yyqTrvw==	2022-08-29 23:29:38.22745
1216	ktogcqqiz2lhgjogvlyfbuefbjfd	DSCF1045.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	22360	sWAM3gby6mfcFW7Rt4J21w==	2022-08-31 00:17:46.868706
1219	q7e4ylf0fvvgfgcd2dmwr4c7qvkx	1_Alguien_camina...jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	20424	fzwNscwHAZVTb72VviWzYg==	2022-09-01 20:09:18.917163
1225	rs8o7b3xlczb6krptkec66ql5k5i	constelacciones_2008.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	26006	DNuGfhViZ/TARfpn+67hTw==	2022-09-01 20:09:22.41049
1189	x33j3h4twhd3wli6j3akw35ih2zs	IMG_2095.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	10317	sDstU3RRo14tapa0fxs3iA==	2022-08-29 23:29:36.269736
1193	ugon4i7qi2aehy9bamggr7liffu3	DSC01109-102.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	19449	v7rPRHEQJ8Uk4v9X99Y9RA==	2022-08-29 23:29:36.758598
1197	uk48g4vhikk6omfq5rjqaawbxmrl	DSC_0037.jpeg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	8976	E+Zj0gTyqnPfCweFiVjYHQ==	2022-08-29 23:29:37.244934
1203	xyxflavu5zyvcgsdte3agfy4beal	Possible_Foto.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	16887	C/nYuKBiT7CBAj7szbRFPg==	2022-08-29 23:29:37.784648
1210	hmhmzo96fz0bi20wj8gstylxt574	DSCF1204.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	16789	n5Vqojz2p9ROy9VG5UOs5w==	2022-08-29 23:29:38.261248
1212	1e8z4rtjhultnljl18jc6r0l5ymt	IMGP1552.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	24258	r4pifNRnsML7RtTxEYI8Aw==	2022-08-29 23:29:38.591866
1217	qz9izk7ok7cwm1ga85qgaevsz8u1	ZANTOP_-_4._Odumonde.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	24265	+wEd7PRQzuiknH2zMP9ooQ==	2022-08-31 00:17:46.872883
1220	qfazqj7y1c63n1hsiz5vzwwk3uo9	DSCN1209_2.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	19092	RoMJAM4oONkqrI6P3210Ow==	2022-09-01 20:09:18.921592
1222	ybsda7khv3dkl5yyry67drwn0vsk	Instal.laci__monos_labos.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	15467	c8Na1ONe7k9vOgl3AOSUFA==	2022-09-01 20:09:22.371706
1227	lz7tjxt74urm30gywa4orbppwlfc	sala_ruinas2.2.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	12114	9kXbdNgiq2PAlfTQLNQ+3g==	2022-09-01 20:09:22.75976
1191	o2s7b3b7aa2n0ejsplz0vdracjgb	IMG-20210315-WA0017.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	56989	HDHcms78Byus7k30L66utg==	2022-08-29 23:29:36.302421
1195	4wh10qao0hv6wrrtnf5s56l1x4h3	Programa_Perpetraci_ns_Interior.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	49145	T4Gx42lFt+HvlbLYpqrafw==	2022-08-29 23:29:36.873394
1201	iv9e3bsbasji75ehsdn6r4jg3z2f	generart25nov.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	35279	KGh/z1x0WMnETb7cbue05Q==	2022-08-29 23:29:37.518648
1206	ds0vee7h6k4nr7slo3ajkyeck2z3	IMG-20190307-WA0001.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	22021	gM/2K8HfHFEqZXYPOtpM7w==	2022-08-29 23:29:37.919658
1211	72qavfgw7mxiuc4x8bnd6cdfeihp	ANA_RITA_RODRIGUES_FEM_2011_PAR_8663.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	26507	78wzFu+d0VXGQTwnK4gkww==	2022-08-29 23:29:38.309547
1214	x45lvvq1anu6xyjgwartbfwd5bw5	fent_volar_coloms.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	48390	QBivyjDgBFeVzA78HYOolw==	2022-08-29 23:29:38.621783
1221	sidvpouli59163ht8anz4tr8vj8o	DSC03862.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	22198	HaQNMVqxSDQSrJ2mnbU5GA==	2022-09-01 20:09:22.333131
1226	xuilm4m6b89kbmj3h5h8hy0ghda3	DSCF5838_cavar.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	30956	XpwoGcz+oU+gUk7rCNUK9g==	2022-09-01 20:09:22.754968
1196	30r7fmzuoo7htietowitqztxomex	Captura_de_pantalla_de_2021-09-01_01-17-09.png	image/png	{"identified":true,"width":400,"height":400,"analyzed":true}	local	133851	VycuqKvOOYsqKL8WY8gRvw==	2022-08-29 23:29:36.906931
1200	oeik9oeyupcjizhj2l00fokn72t6	DSCF4623.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	32115	uTy5qw+PPELoRVhuuqOgxg==	2022-08-29 23:29:37.35917
1204	bnz0sjehls38qain6fi5opjvc9w2	_MG_3737.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	14663	nTjxwLwEWyMutAP1Sz1t7g==	2022-08-29 23:29:37.794708
1208	ec8kbvag31hktao2yxiibhbq0azg	inici.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	23158	KwtuHDkJJzjBh0a2htH9+w==	2022-08-29 23:29:38.20796
1213	hcshdxyxovm1ey9n5v65hi8264vc	Mireia.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	18350	YvS4MUfnZp4dehWzDZ6unA==	2022-08-29 23:29:38.608032
1224	65qm2ipl305frolzlvcg25dgvytu	09-La_Bodega_Rustica.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	33467	n1/DArNjC2t2nrNrOlfe5g==	2022-09-01 20:09:22.402982
1228	3iv45j2hulft859evz3y4tjarmum	IMG_20180928_164827.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	14235	RJMDIln2ZvhSYTWXx/7KsQ==	2022-09-01 20:09:25.895365
1229	1cj5jduamyxrtfc35pfmg1a3wy4s	_20191228_100620.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	32045	7jyALx5ukm+yu7cnFkNelQ==	2022-09-01 21:15:39.170536
1230	0rhhk453qeohgry1bugrdnjhmyrf	separ_2014.4sala_AUDITORIO.jpg	image/jpeg	{"identified":true,"width":400,"height":400,"analyzed":true}	local	21721	Zg7jRl6EePveZp02PR0HxA==	2022-09-01 21:15:39.396143
1231	3vw74jhdutxvf58yy0tzju5y473m	IMG_20191225_133646_151.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2185	dm/NUCaqXfFZAVJREGzLuw==	2022-09-01 23:41:44.528881
1232	e8fgzn2ijgpg5t49ktniriim28rj	IMG_20191225_132357_968.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2621	JeMRhPz/GDRIo/QEpJPWxw==	2022-09-01 23:41:44.535306
1233	ij6r75io74ahhpertlzcimhu2mpf	IMG_20190831_132411_157.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	3262	P3utZABPQJq7xrKJGN7GQw==	2022-09-01 23:41:44.540981
1234	i678fl9bvitybnyfdo079s1r09qu	_20191228_100620.jpg	image/jpeg	{"identified":true,"width":76,"height":100,"analyzed":true}	local	2685	uumUgofb9BtWCR17cniH9w==	2022-09-01 23:41:44.550056
1235	n39xgnngkss2b4ryozz7pfay3i4s	IMG_20201016_172309.jpg	image/jpeg	{"identified":true,"width":75,"height":100,"analyzed":true}	local	2839	EoBMnUGi8HWq546xN1r0Kg==	2022-09-02 00:03:42.569438
1240	6gacuqv9dk3km53bwjyri9kj0m3d	des_cuidar_accionant_IMG-20200308-WA0020.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	3848	jkZgO3DnPlX3LRdBtXYJkw==	2022-09-02 00:03:43.010257
1236	2wjmi7xlqu59cgpnnzl28nplrgcu	IMG_20200308_180723_115.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2380	l7iUE8WUkSpMkVRGy66SHQ==	2022-09-02 00:03:42.573788
1237	885tn757yea82f2ydln3cfy2wpct	IMG-20200924-WA0005.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	2687	EGY8fva9NSV4JDihx0HA2A==	2022-09-02 00:03:42.576307
1238	vimlk6prehgkd7c4ryxheoduvx96	IMG-20200308-WA0039.jpg	image/jpeg	{"identified":true,"width":75,"height":100,"analyzed":true}	local	2713	T/WndxxsyTSGZiF3y/D9Pg==	2022-09-02 00:03:42.579406
1239	0y6ay65b2d2g4nnb9rquq0dlyens	__retocat.jpg	image/jpeg	{"identified":true,"width":75,"height":100,"analyzed":true}	local	2224	nVtW3dUWVV+s8gaPKXGokQ==	2022-09-02 00:03:42.588986
1144	8nx50fhpfufn0qmllbu6c3yju4xe	corpologia_25_5_Girona_2_retocada.jpeg	image/jpeg	{"identified":true,"width":100,"height":66,"analyzed":true}	local	1797	CWDBqnEJaLyNSDGk8IcnPg==	2022-08-29 23:03:03.718015
1149	it88bly42oob3eq2fvkrlrrr045f	AdobeBridgeBatchRenameTemp7CanFelipa_15.jpg	image/jpeg	{"identified":true,"width":67,"height":100,"analyzed":true}	local	1696	2iujtVQPvO2Hi0JJ1boiTg==	2022-08-29 23:03:04.137643
1155	xb5uouikvyucvwaywgw46s4xt80l	IMG-20150128-WA0000.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	3001	t1YvyZFhEFiU2v42JbIr2g==	2022-08-29 23:03:04.534864
1159	lrx1w6vxgl9ti6wkhc7frx5j13sv	Mireia_Zantop_Accio_.jpg	image/jpeg	{"identified":true,"width":100,"height":57,"analyzed":true}	local	2839	NbZdTV/qKL1rMIFLtjJMyQ==	2022-08-29 23:03:04.900073
1163	2xanoapgogg4ohzeum5ze8wjuq88	IMG_20170519_184422.jpg	image/jpeg	{"identified":true,"width":100,"height":74,"analyzed":true}	local	2355	cczq0CFNHu9DBk47KUnEVg==	2022-08-29 23:03:05.283213
1168	jwj81k7w2nyylmlm7n8ayjnl677i	Programa_Perpetraci_ns_Interior.jpg	image/jpeg	{"identified":true,"width":72,"height":100,"analyzed":true}	local	3262	+EQhNeQLXHDjjAQhGbdFVg==	2022-08-29 23:03:05.646745
1173	55iy2vux2fde4jn56druriix4n6x	_MG_3737.jpg	image/jpeg	{"identified":true,"width":72,"height":100,"analyzed":true}	local	2162	moXK7wkHZtSl4n5syvvrAg==	2022-08-29 23:03:06.07213
1177	ziffc7uv7kef7z416tphox82z512	DSC05616bona.jpg	image/jpeg	{"identified":true,"width":100,"height":75,"analyzed":true}	local	4023	7e4fIUEtxYpfsBs4bQFF1w==	2022-08-29 23:03:06.423495
1184	o8nlv2iarly6qz067j88y998gv4i	Mireia.jpg	image/jpeg	{"identified":true,"width":100,"height":67,"analyzed":true}	local	2475	YSt4s1WIYXMSEmCCuTbmdA==	2022-08-29 23:03:06.938407
\.


--
-- Data for Name: active_storage_attachments; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.active_storage_attachments (id, name, record_type, record_id, blob_id, created_at) FROM stdin;
706	image	Image	3	706	2022-07-03 01:36:14.341448
707	image	Image	4	707	2022-07-03 01:36:14.698412
708	image	Image	5	708	2022-07-03 01:36:14.9416
709	image	Image	6	709	2022-07-03 01:36:15.13556
710	image	Image	7	710	2022-07-03 01:36:15.598733
711	image	Image	10	711	2022-07-03 01:36:16.043005
712	image	Image	12	712	2022-07-03 01:36:16.28429
713	image	Image	14	713	2022-07-03 01:36:16.674289
714	image	Image	15	714	2022-07-03 01:36:17.074499
715	image	Image	16	715	2022-07-03 01:36:17.482488
716	image	Image	17	716	2022-07-03 01:36:17.771951
717	image	Image	18	717	2022-07-03 01:36:18.081834
718	image	Image	19	718	2022-07-03 01:36:18.498368
719	image	Image	20	719	2022-07-03 01:36:18.764338
720	image	Image	21	720	2022-07-03 01:36:19.036266
721	image	Image	22	721	2022-07-03 01:36:19.515344
722	image	Image	23	722	2022-07-03 01:36:20.16389
723	image	Image	24	723	2022-07-03 01:36:20.506555
724	image	Image	25	724	2022-07-03 01:36:20.821454
725	image	Image	26	725	2022-07-03 01:36:21.199434
726	image	Image	27	726	2022-07-03 01:36:21.528211
727	image	Image	28	727	2022-07-03 01:36:21.867089
728	image	Image	29	728	2022-07-03 01:36:22.384668
729	image	Image	30	729	2022-07-03 01:36:22.601028
730	image	Image	31	730	2022-07-03 01:36:22.864779
731	image	Image	32	731	2022-07-03 01:36:23.190937
732	image	Image	33	732	2022-07-03 01:36:23.506212
733	image	Image	34	733	2022-07-03 01:36:23.789618
734	image	Image	35	734	2022-07-03 01:36:24.08156
735	image	Image	36	735	2022-07-03 01:36:24.483114
736	image	Image	37	736	2022-07-03 01:36:24.789657
737	image	Image	38	737	2022-07-03 01:36:25.190732
738	image	Image	40	738	2022-07-03 01:36:25.479411
739	image	Image	41	739	2022-07-03 01:36:25.734305
740	image	Image	42	740	2022-07-03 01:36:26.067972
741	image	Image	43	741	2022-07-03 01:36:26.380703
742	image	Image	44	742	2022-07-03 01:36:26.691834
743	image	Image	45	743	2022-07-03 01:36:26.940412
744	image	Image	46	744	2022-07-03 01:36:27.338677
745	image	Image	47	745	2022-07-03 01:36:27.514443
746	image	Image	48	746	2022-07-03 01:36:27.968168
747	image	Image	49	747	2022-07-03 01:36:28.422914
748	image	Image	50	748	2022-07-03 01:36:28.879598
749	image	Image	51	749	2022-07-03 01:36:29.340787
750	image	Image	52	750	2022-07-03 01:36:29.775668
751	image	Image	55	751	2022-07-03 01:36:30.146258
752	image	Image	56	752	2022-07-03 01:36:30.474922
753	image	Image	57	753	2022-07-03 01:36:30.818216
754	image	Image	58	754	2022-07-03 01:36:31.26559
755	image	Image	59	755	2022-07-03 01:36:31.659837
756	image	Image	60	756	2022-07-03 01:36:31.866543
757	image	Image	61	757	2022-07-03 01:36:32.024894
758	image	Image	62	758	2022-07-03 01:36:32.222318
759	image	Image	63	759	2022-07-03 01:36:32.50626
760	image	Image	64	760	2022-07-03 01:36:32.665175
761	image	Image	65	761	2022-07-03 01:36:32.809567
762	image	Image	66	762	2022-07-03 01:36:32.998995
763	image	Image	68	763	2022-07-03 01:36:33.137141
764	image	Image	69	764	2022-07-03 01:36:33.316996
765	image	Image	70	765	2022-07-03 01:36:33.49857
766	image	Image	71	766	2022-07-03 01:36:33.65568
767	image	Image	72	767	2022-07-03 01:36:33.832518
768	image	Image	73	768	2022-07-03 01:36:34.07049
769	image	Image	75	769	2022-07-03 01:36:34.235493
770	image	Image	76	770	2022-07-03 01:36:34.419942
771	image	Image	77	771	2022-07-03 01:36:34.615769
772	image	Image	78	772	2022-07-03 01:36:34.789776
773	image	Image	79	773	2022-07-03 01:36:34.960174
774	image	Image	80	774	2022-07-03 01:36:35.130893
775	image	Image	85	775	2022-07-03 01:36:35.433774
776	image	Image	86	776	2022-07-03 01:36:35.586179
777	image	Image	89	777	2022-07-03 01:36:35.730777
778	image	Image	91	778	2022-07-03 01:36:36.153724
779	image	Image	92	779	2022-07-03 01:36:36.483424
780	image	Image	93	780	2022-07-03 01:36:36.843963
781	image	Image	94	781	2022-07-03 01:36:37.436421
782	image	Image	95	782	2022-07-03 01:36:37.929184
783	image	Image	96	783	2022-07-03 01:36:38.308792
784	image	Image	97	784	2022-07-03 01:36:38.769881
785	image	Image	98	785	2022-07-03 01:36:39.184432
786	image	Image	99	786	2022-07-03 01:36:39.570427
787	image	Image	102	787	2022-07-03 01:36:40.085859
788	image	Image	103	788	2022-07-03 01:36:40.545648
789	image	Image	104	789	2022-07-03 01:36:40.988298
790	image	Image	105	790	2022-07-03 01:36:41.493298
791	image	Image	106	791	2022-07-03 01:36:41.972956
792	image	Image	107	792	2022-07-03 01:36:42.361475
793	image	Image	108	793	2022-07-03 01:36:42.932557
794	image	Image	109	794	2022-07-03 01:36:43.513335
795	image	Image	111	795	2022-07-03 01:36:43.761526
796	image	Image	126	796	2022-07-03 01:36:44.203965
797	image	Image	127	797	2022-07-03 01:36:44.534995
798	image	Image	128	798	2022-07-03 01:36:44.810955
799	image	Image	129	799	2022-07-03 01:36:45.116161
800	image	Image	130	800	2022-07-03 01:36:45.405632
801	image	Image	131	801	2022-07-03 01:36:45.639494
802	image	Image	132	802	2022-07-03 01:36:45.845706
803	image	Image	133	803	2022-07-03 01:36:46.1086
804	image	Image	134	804	2022-07-03 01:36:46.615021
805	image	Image	135	805	2022-07-03 01:36:47.032194
806	image	Image	136	806	2022-07-03 01:36:47.392834
807	image	Image	137	807	2022-07-03 01:36:47.80675
808	image	Image	138	808	2022-07-03 01:36:48.142635
809	image	Image	139	809	2022-07-03 01:36:48.522225
810	image	Image	140	810	2022-07-03 01:36:48.882668
811	image	Image	141	811	2022-07-03 01:36:49.194332
812	image	Image	142	812	2022-07-03 01:36:49.51661
813	image	Image	143	813	2022-07-03 01:36:49.784995
814	image	Image	144	814	2022-07-03 01:36:50.188918
815	image	Image	146	815	2022-07-03 01:36:50.403866
816	image	Image	147	816	2022-07-03 01:36:50.614848
817	image	Image	148	817	2022-07-03 01:36:50.859648
818	image	Image	149	818	2022-07-03 01:36:51.155632
819	image	Image	150	819	2022-07-03 01:36:51.351295
820	image	Image	151	820	2022-07-03 01:36:51.573204
821	image	Image	152	821	2022-07-03 01:36:51.815323
822	image	Image	156	822	2022-07-03 01:36:52.240685
823	image	Image	157	823	2022-07-03 01:36:52.908985
824	image	Image	158	824	2022-07-03 01:36:53.385875
825	image	Image	159	825	2022-07-03 01:36:53.899724
826	image	Image	160	826	2022-07-03 01:36:54.366587
827	image	Image	161	827	2022-07-03 01:36:54.795259
828	image	Image	162	828	2022-07-03 01:36:55.138872
829	image	Image	163	829	2022-07-03 01:36:55.508481
830	image	Image	164	830	2022-07-03 01:36:55.8881
831	image	Image	165	831	2022-07-03 01:36:56.372143
832	image	Image	167	832	2022-07-03 01:36:56.761369
833	image	Image	168	833	2022-07-03 01:36:57.212541
834	image	Image	169	834	2022-07-03 01:36:57.346596
835	image	Image	170	835	2022-07-03 01:36:57.54506
836	image	Image	171	836	2022-07-03 01:36:57.725854
837	image	Image	172	837	2022-07-03 01:36:57.862677
838	image	Image	173	838	2022-07-03 01:36:58.066151
839	image	Image	174	839	2022-07-03 01:36:58.190125
840	image	Image	175	840	2022-07-03 01:36:58.324696
841	image	Image	176	841	2022-07-03 01:36:58.439637
842	image	Image	177	842	2022-07-03 01:36:58.558389
843	image	Image	178	843	2022-07-03 01:36:58.996765
844	image	Image	179	844	2022-07-03 01:36:59.528083
845	image	Image	180	845	2022-07-03 01:37:00.014103
846	image	Image	181	846	2022-07-03 01:37:00.61074
847	image	Image	182	847	2022-07-03 01:37:01.014637
848	image	Image	183	848	2022-07-03 01:37:01.402488
849	image	Image	184	849	2022-07-03 01:37:01.988874
850	image	Image	185	850	2022-07-03 01:37:02.203938
851	image	Image	186	851	2022-07-03 01:37:02.449514
852	image	Image	187	852	2022-07-03 01:37:02.714442
853	image	Image	188	853	2022-07-03 01:37:02.888318
854	image	Image	189	854	2022-07-03 01:37:03.050917
855	image	Image	190	855	2022-07-03 01:37:03.259975
856	image	Image	191	856	2022-07-03 01:37:03.423948
857	image	Image	192	857	2022-07-03 01:37:03.586062
858	image	Image	193	858	2022-07-03 01:37:03.743384
859	image	Image	194	859	2022-07-03 01:37:03.939157
860	image	Image	195	860	2022-07-03 01:37:04.236089
861	image	Image	196	861	2022-07-03 01:37:04.611848
862	image	Image	197	862	2022-07-03 01:37:05.216099
863	image	Image	198	863	2022-07-03 01:37:05.820373
864	image	Image	199	864	2022-07-03 01:37:06.458294
865	image	Image	200	865	2022-07-03 01:37:07.026023
866	image	Image	201	866	2022-07-03 01:37:07.712258
867	image	Image	204	867	2022-07-03 01:37:07.90902
868	image	Image	205	868	2022-07-03 01:37:08.069323
869	image	Image	206	869	2022-07-03 01:37:08.246014
870	image	Image	207	870	2022-07-03 01:37:08.437986
871	image	Image	208	871	2022-07-03 01:37:08.608084
872	image	Image	210	872	2022-07-03 01:37:08.762835
873	image	Image	211	873	2022-07-03 01:37:09.02823
874	image	Image	212	874	2022-07-03 01:37:09.153874
875	image	Image	213	875	2022-07-03 01:37:09.293425
876	image	Image	214	876	2022-07-03 01:37:09.435797
877	image	Image	215	877	2022-07-03 01:37:09.585992
878	image	Image	216	878	2022-07-03 01:37:09.801717
879	image	Image	217	879	2022-07-03 01:37:09.942514
880	image	Image	218	880	2022-07-03 01:37:10.085263
881	image	Image	219	881	2022-07-03 01:37:10.2272
882	image	Image	220	882	2022-07-03 01:37:10.364009
883	image	Image	221	883	2022-07-03 01:37:10.589131
884	image	Image	222	884	2022-07-03 01:37:10.996789
885	image	Image	223	885	2022-07-03 01:37:11.450933
886	image	Image	224	886	2022-07-03 01:37:12.035699
887	image	Image	225	887	2022-07-03 01:37:12.612929
888	image	Image	226	888	2022-07-03 01:37:13.110477
889	image	Image	227	889	2022-07-03 01:37:13.811988
890	image	Image	228	890	2022-07-03 01:37:14.378745
891	image	Image	229	891	2022-07-03 01:37:14.597672
892	image	Image	230	892	2022-07-03 01:37:14.853038
893	image	Image	231	893	2022-07-03 01:37:15.192868
894	image	Image	232	894	2022-07-03 01:37:15.585894
895	image	Image	233	895	2022-07-03 01:37:15.913726
896	image	Image	234	896	2022-07-03 01:37:16.161195
897	image	Image	235	897	2022-07-03 01:37:16.38056
898	image	Image	236	898	2022-07-03 01:37:16.738
899	image	Image	237	899	2022-07-03 01:37:17.021545
900	image	Image	238	900	2022-07-03 01:37:17.285596
901	image	Image	239	901	2022-07-03 01:37:17.540305
902	image	Image	240	902	2022-07-03 01:37:17.905474
903	image	Image	241	903	2022-07-03 01:37:18.24031
904	image	Image	242	904	2022-07-03 01:37:18.699146
905	image	Image	243	905	2022-07-03 01:37:19.036314
906	image	Image	244	906	2022-07-03 01:37:19.40575
907	image	Image	245	907	2022-07-03 01:37:19.723743
908	image	Image	246	908	2022-07-03 01:37:19.986911
909	image	Image	247	909	2022-07-03 01:37:20.215882
910	image	Image	248	910	2022-07-03 01:37:20.575133
911	image	Image	249	911	2022-07-03 01:37:20.886607
912	image	Image	250	912	2022-07-03 01:37:21.163277
913	image	Image	251	913	2022-07-03 01:37:21.540052
914	image	Image	252	914	2022-07-03 01:37:21.957952
915	image	Image	253	915	2022-07-03 01:37:22.278638
916	image	Image	254	916	2022-07-03 01:37:22.462353
917	image	Image	255	917	2022-07-03 01:37:22.701546
918	image	Image	256	918	2022-07-03 01:37:23.008804
919	image	Image	257	919	2022-07-03 01:37:23.199941
920	image	Image	258	920	2022-07-03 01:37:23.418781
921	image	Image	259	921	2022-07-03 01:37:23.667284
922	image	Image	260	922	2022-07-03 01:37:23.999088
923	image	Image	261	923	2022-07-03 01:37:24.328639
924	image	Image	262	924	2022-07-03 01:37:24.642973
925	image	Image	263	925	2022-07-03 01:37:24.932095
926	image	Image	264	926	2022-07-03 01:37:25.296609
927	image	Image	265	927	2022-07-03 01:37:25.567832
928	image	Image	266	928	2022-07-03 01:37:25.830062
929	image	Image	267	929	2022-07-03 01:37:26.12231
930	image	Image	268	930	2022-07-03 01:37:26.569729
931	image	Image	269	931	2022-07-03 01:37:27.085028
932	image	Image	270	932	2022-07-03 01:37:27.529544
933	image	Image	271	933	2022-07-03 01:37:27.992508
934	image	Image	272	934	2022-07-03 01:37:28.486625
935	image	Image	273	935	2022-07-03 01:37:29.042997
936	image	Image	274	936	2022-07-03 01:37:29.396963
937	image	Image	275	937	2022-07-03 01:37:29.753949
938	image	Image	276	938	2022-07-03 01:37:30.075051
939	image	Image	277	939	2022-07-03 01:37:30.358876
940	image	Image	278	940	2022-07-03 01:37:31.029923
941	image	Image	279	941	2022-07-03 01:37:31.480034
942	image	Image	280	942	2022-07-03 01:37:32.020168
943	image	Image	281	943	2022-07-03 01:37:32.39584
944	image	Image	282	944	2022-07-03 01:38:44.507911
945	image	Image	283	945	2022-07-03 01:38:44.9531
946	image	Image	284	946	2022-07-03 01:38:45.339512
947	image	Image	285	947	2022-07-03 01:38:45.712441
948	image	Image	286	948	2022-07-03 01:38:46.146334
949	image	Image	287	949	2022-07-03 01:38:46.523157
950	image	Image	288	950	2022-07-03 01:38:46.950618
951	image	Image	289	951	2022-07-03 01:38:47.334838
952	image	Image	290	952	2022-07-03 01:38:47.695953
953	image	Image	291	953	2022-07-03 01:38:48.103595
954	image	Image	292	954	2022-07-03 01:38:48.474006
955	image	Image	293	955	2022-07-03 01:38:48.71372
956	image	Image	294	956	2022-07-03 01:38:49.307505
957	image	Image	295	957	2022-07-03 01:38:49.793941
958	image	Image	296	958	2022-07-03 01:38:50.266582
959	image	Image	297	959	2022-07-03 01:39:19.218604
960	image	Image	298	960	2022-07-03 01:39:19.671785
961	image	Image	299	961	2022-07-03 01:39:20.07822
962	image	Image	300	962	2022-07-03 01:39:20.396266
963	image	Image	301	963	2022-07-03 01:39:20.736515
964	image	Image	302	964	2022-07-03 01:39:21.171587
965	image	Image	303	965	2022-07-03 01:39:21.434599
966	image	Image	304	966	2022-07-03 01:39:21.734422
967	image	Image	305	967	2022-07-03 01:39:22.141224
968	image	Image	306	968	2022-07-03 01:39:22.556499
969	image	Image	307	969	2022-07-03 01:39:22.990967
970	image	Image	308	970	2022-07-03 01:39:23.460189
971	image	Image	309	971	2022-07-03 01:39:23.91986
972	image	Image	310	972	2022-07-03 01:39:24.430068
973	image	Image	311	973	2022-07-03 01:39:24.700908
974	image	Image	312	974	2022-07-03 01:39:24.987476
975	image	Image	313	975	2022-07-03 01:39:25.131017
976	image	Image	314	976	2022-07-03 01:39:25.305145
977	image	Image	315	977	2022-07-03 01:39:25.714054
978	image	Image	316	978	2022-07-03 01:39:26.077502
979	image	Image	317	979	2022-07-03 01:39:26.645927
980	image	Image	319	980	2022-07-03 01:39:27.089564
981	image	Image	320	981	2022-07-03 01:39:27.573136
982	image	Image	321	982	2022-07-03 01:39:27.847913
983	image	Image	322	983	2022-07-03 01:39:28.129891
984	image	Image	323	984	2022-07-03 01:39:28.525301
985	image	Image	324	985	2022-07-03 01:39:28.806305
986	image	Image	325	986	2022-07-03 01:39:29.054909
987	image	Image	326	987	2022-07-03 01:39:29.467052
988	image	Image	327	988	2022-07-03 01:39:29.803705
989	image	Image	328	989	2022-07-03 01:39:30.186332
990	image	Image	330	990	2022-07-03 01:39:30.560027
991	image	Image	334	991	2022-07-03 01:39:30.924908
992	image	Image	335	992	2022-07-03 01:39:31.251741
993	image	Image	336	993	2022-07-03 01:39:31.534321
994	image	Image	337	994	2022-07-03 01:39:31.792758
995	image	Image	338	995	2022-07-03 01:39:32.140276
996	image	Image	339	996	2022-07-03 01:39:32.353594
997	image	Image	340	997	2022-07-03 01:39:32.567787
998	image	Image	341	998	2022-07-03 01:39:32.798806
999	image	Image	342	999	2022-07-03 01:39:33.034939
1000	image	Image	343	1000	2022-07-03 01:39:33.279449
1001	image	Image	344	1001	2022-07-03 01:39:33.55263
1002	image	Image	345	1002	2022-07-03 01:39:33.81816
1003	image	Image	346	1003	2022-07-03 01:39:34.087038
1004	image	Image	347	1004	2022-07-03 01:39:34.558486
1005	image	Image	348	1005	2022-07-03 01:39:35.266701
1006	image	Image	349	1006	2022-07-03 01:39:35.764146
1007	image	Image	350	1007	2022-07-03 01:39:36.463816
1008	image	Image	351	1008	2022-07-03 01:39:36.913985
1009	image	Image	352	1009	2022-07-03 01:39:37.467609
1010	image	Image	353	1010	2022-07-03 01:39:38.133204
1011	image	Image	354	1011	2022-07-03 01:39:38.674277
1012	image	Image	355	1012	2022-07-03 01:39:39.276063
1013	image	Image	356	1013	2022-07-03 01:39:39.868354
1014	image	Image	357	1014	2022-07-03 01:39:40.569111
1015	image	Image	358	1015	2022-07-03 01:39:41.424968
1016	image	Image	359	1016	2022-07-03 01:39:41.802908
1017	image	Image	360	1017	2022-07-03 01:39:42.208578
1018	image	Image	361	1018	2022-07-03 01:39:42.50511
1019	image	Image	362	1019	2022-07-03 01:39:42.900534
1020	image	Image	363	1020	2022-07-03 01:39:43.204554
1021	image	Image	364	1021	2022-07-03 01:39:43.459076
1022	image	Image	365	1022	2022-07-03 01:39:44.046046
1023	image	Image	366	1023	2022-07-03 01:39:44.444373
1024	image	Image	367	1024	2022-07-03 01:39:44.863975
1025	image	Image	368	1025	2022-07-03 01:39:45.181698
1026	image	Image	369	1026	2022-07-03 01:39:45.43393
1027	image	Image	370	1027	2022-07-03 01:39:45.698939
1028	image	Image	371	1028	2022-07-03 01:39:46.099462
1029	image	Image	372	1029	2022-07-03 01:39:46.516636
1030	image	Image	373	1030	2022-07-03 01:39:46.907327
1031	image	Image	374	1031	2022-07-03 01:39:47.224714
1032	image	Image	375	1032	2022-07-03 01:39:47.613107
1033	image	Image	376	1033	2022-07-03 01:39:48.050957
1034	image	Image	377	1034	2022-07-03 01:39:48.476828
1035	image	Image	378	1035	2022-07-03 01:39:48.821707
1036	image	Image	379	1036	2022-07-03 01:39:49.237295
1037	image	Image	380	1037	2022-07-03 01:39:49.624062
1038	image	Image	381	1038	2022-07-03 01:39:49.936825
1039	image	Image	382	1039	2022-07-03 01:39:50.216533
1040	image	Image	383	1040	2022-07-03 01:39:50.686412
1041	image	Image	384	1041	2022-07-03 01:39:51.012178
1042	image	Image	386	1042	2022-07-03 01:39:51.644074
1043	image	Image	387	1043	2022-07-03 01:39:52.06864
1044	image	Image	388	1044	2022-07-03 01:39:52.447699
1045	image	Image	389	1045	2022-07-03 01:39:52.876767
1046	image	Image	390	1046	2022-07-03 01:39:53.168767
1047	image	Image	391	1047	2022-07-03 01:39:53.451317
1048	image	Image	392	1048	2022-07-03 01:39:53.990421
1049	image	Image	394	1049	2022-07-03 01:39:54.596884
1050	image	Image	395	1050	2022-07-03 01:39:55.083061
1051	image	Image	396	1051	2022-07-03 01:39:55.598661
1052	image	Image	397	1052	2022-07-03 01:39:56.081985
1053	image	Image	398	1053	2022-07-03 01:39:56.738616
1054	image	Image	399	1054	2022-07-03 01:39:57.293789
1055	image	Image	400	1055	2022-07-03 01:39:57.702994
1056	image	Image	401	1056	2022-07-03 01:39:58.227906
1057	image	Image	416	1057	2022-07-03 01:39:58.629997
1058	image	Image	417	1058	2022-07-03 01:39:59.143474
1059	image	Image	418	1059	2022-07-03 01:39:59.501012
1060	image	Image	419	1060	2022-07-03 01:39:59.965196
1061	image	Image	420	1061	2022-07-03 01:40:00.350664
1062	image	Image	421	1062	2022-07-03 01:40:00.71622
1063	image	Image	422	1063	2022-07-03 01:40:01.128269
1064	image	Image	423	1064	2022-07-03 01:40:01.47996
1065	image	Image	424	1065	2022-07-03 01:40:01.948183
1066	image	Image	425	1066	2022-07-03 01:40:02.632675
1067	image	Image	426	1067	2022-07-03 01:40:03.554325
1068	image	Image	427	1068	2022-07-03 01:40:04.108736
1069	image	Image	428	1069	2022-07-03 01:40:04.684564
1070	image	Image	429	1070	2022-07-03 01:40:05.415179
1071	image	Image	430	1071	2022-07-03 01:40:05.789895
1072	image	Image	431	1072	2022-07-03 01:40:06.432147
1073	image	Image	432	1073	2022-07-03 01:40:06.944418
1074	image	Image	433	1074	2022-07-03 01:40:07.688836
1075	image	Image	434	1075	2022-07-03 01:40:07.956648
1076	image	Image	435	1076	2022-07-03 01:40:08.582534
1077	image	Image	436	1077	2022-07-03 01:40:09.228375
1078	image	Image	437	1078	2022-07-03 01:40:09.976183
1079	image	Image	438	1079	2022-07-03 01:40:10.433112
1080	image	Image	439	1080	2022-07-03 01:40:10.839612
1081	image	Image	440	1081	2022-07-03 01:40:11.545662
1082	image	Image	441	1082	2022-07-03 01:41:02.966629
1083	image	Image	442	1083	2022-07-03 01:41:19.074247
1084	image	Image	443	1084	2022-07-03 01:41:19.40391
1085	image	Image	444	1085	2022-07-03 01:41:19.782849
1086	image	Image	445	1086	2022-07-03 01:41:20.346703
1087	image	Image	446	1087	2022-07-03 01:41:20.78845
1088	image	Image	447	1088	2022-07-03 01:41:21.405928
1089	image	Image	448	1089	2022-07-03 01:41:22.049579
1090	image	Image	449	1090	2022-07-03 01:41:22.65316
1091	image	Image	450	1091	2022-07-03 01:41:23.222321
1092	image	Image	451	1092	2022-07-03 01:41:23.759463
1093	image	Image	452	1093	2022-07-03 01:41:24.362266
1094	image	Image	453	1094	2022-07-03 01:41:25.003753
1095	image	Image	454	1095	2022-07-03 01:41:25.439089
1096	image	Image	455	1096	2022-07-03 01:41:25.958003
1097	image	Image	456	1097	2022-07-03 01:41:26.417652
1098	image	Image	465	1098	2022-07-03 01:41:27.08719
1099	image	Image	466	1099	2022-07-03 01:41:27.484865
1100	image	Image	467	1100	2022-07-03 01:41:27.764843
1101	image	Image	468	1101	2022-07-03 01:41:28.155484
1102	image	Image	469	1102	2022-07-03 01:41:28.590517
1103	image	Image	470	1103	2022-07-03 01:41:29.010528
1104	image	Image	471	1104	2022-07-03 01:41:29.548962
1105	image	Image	472	1105	2022-07-03 01:41:29.855341
1106	image	ActiveStorage::VariantRecord	1	1106	2022-07-03 21:48:57.44918
1107	image	ActiveStorage::VariantRecord	2	1107	2022-07-03 21:48:57.508471
1108	image	ActiveStorage::VariantRecord	3	1108	2022-07-03 21:48:57.540856
1109	image	ActiveStorage::VariantRecord	5	1109	2022-07-03 21:48:57.547195
1110	image	ActiveStorage::VariantRecord	4	1110	2022-07-03 21:48:57.566335
1111	image	ActiveStorage::VariantRecord	6	1111	2022-07-03 21:48:58.068641
1112	image	ActiveStorage::VariantRecord	7	1112	2022-07-03 21:56:25.67518
1113	image	ActiveStorage::VariantRecord	8	1113	2022-07-03 21:56:25.979965
1114	image	ActiveStorage::VariantRecord	9	1114	2022-07-03 21:56:26.00652
1115	image	ActiveStorage::VariantRecord	11	1116	2022-07-03 21:56:26.022308
1116	image	ActiveStorage::VariantRecord	10	1115	2022-07-03 21:56:26.028333
1117	image	ActiveStorage::VariantRecord	12	1117	2022-07-03 21:56:26.084553
1118	image	ActiveStorage::VariantRecord	13	1118	2022-07-03 21:56:26.323745
1119	image	ActiveStorage::VariantRecord	14	1119	2022-07-03 21:56:26.426311
1120	image	ActiveStorage::VariantRecord	17	1120	2022-08-29 20:58:48.345349
1121	image	ActiveStorage::VariantRecord	15	1122	2022-08-29 20:58:48.351531
1122	image	ActiveStorage::VariantRecord	16	1121	2022-08-29 20:58:48.356121
1123	image	ActiveStorage::VariantRecord	19	1124	2022-08-29 20:58:48.416499
1124	image	ActiveStorage::VariantRecord	18	1123	2022-08-29 20:58:48.424221
1125	image	ActiveStorage::VariantRecord	20	1125	2022-08-29 20:58:48.848116
1126	image	ActiveStorage::VariantRecord	21	1126	2022-08-29 21:11:21.445649
1127	image	ActiveStorage::VariantRecord	23	1127	2022-08-29 22:36:10.207542
1128	image	ActiveStorage::VariantRecord	22	1128	2022-08-29 22:36:10.215009
1129	image	ActiveStorage::VariantRecord	24	1129	2022-08-29 22:36:10.226195
1130	image	ActiveStorage::VariantRecord	25	1130	2022-08-29 22:36:10.251327
1131	image	ActiveStorage::VariantRecord	26	1131	2022-08-29 22:36:10.280561
1132	image	ActiveStorage::VariantRecord	27	1132	2022-08-29 22:36:10.708434
1133	image	ActiveStorage::VariantRecord	28	1133	2022-08-29 22:36:10.755874
1134	image	ActiveStorage::VariantRecord	29	1134	2022-08-29 22:36:10.83573
1135	image	ActiveStorage::VariantRecord	30	1135	2022-08-29 22:36:10.857067
1136	image	ActiveStorage::VariantRecord	31	1136	2022-08-29 22:36:10.871601
1137	image	ActiveStorage::VariantRecord	32	1137	2022-08-29 22:36:11.193486
1138	image	ActiveStorage::VariantRecord	34	1139	2022-08-29 22:42:48.690741
1139	image	ActiveStorage::VariantRecord	33	1138	2022-08-29 22:42:48.697036
1140	image	ActiveStorage::VariantRecord	36	1141	2022-08-29 22:42:48.701186
1141	image	ActiveStorage::VariantRecord	35	1140	2022-08-29 22:42:48.706696
1142	image	ActiveStorage::VariantRecord	40	1142	2022-08-29 23:03:03.714917
1143	image	ActiveStorage::VariantRecord	39	1143	2022-08-29 23:03:03.728364
1144	image	ActiveStorage::VariantRecord	37	1144	2022-08-29 23:03:03.732737
1145	image	ActiveStorage::VariantRecord	38	1146	2022-08-29 23:03:03.737533
1146	image	ActiveStorage::VariantRecord	41	1145	2022-08-29 23:03:03.745952
1147	image	ActiveStorage::VariantRecord	44	1148	2022-08-29 23:03:04.143165
1148	image	ActiveStorage::VariantRecord	42	1149	2022-08-29 23:03:04.149932
1149	image	ActiveStorage::VariantRecord	43	1147	2022-08-29 23:03:04.147568
1150	image	ActiveStorage::VariantRecord	46	1151	2022-08-29 23:03:04.156405
1151	image	ActiveStorage::VariantRecord	45	1150	2022-08-29 23:03:04.158417
1152	image	ActiveStorage::VariantRecord	49	1153	2022-08-29 23:03:04.518168
1153	image	ActiveStorage::VariantRecord	48	1154	2022-08-29 23:03:04.522578
1154	image	ActiveStorage::VariantRecord	47	1152	2022-08-29 23:03:04.528083
1155	image	ActiveStorage::VariantRecord	50	1155	2022-08-29 23:03:04.542929
1156	image	ActiveStorage::VariantRecord	51	1156	2022-08-29 23:03:04.547105
1157	image	ActiveStorage::VariantRecord	52	1157	2022-08-29 23:03:04.842207
1158	image	ActiveStorage::VariantRecord	53	1158	2022-08-29 23:03:04.891647
1159	image	ActiveStorage::VariantRecord	54	1159	2022-08-29 23:03:04.925705
1160	image	ActiveStorage::VariantRecord	55	1160	2022-08-29 23:03:04.944974
1161	image	ActiveStorage::VariantRecord	56	1161	2022-08-29 23:03:04.973873
1162	image	ActiveStorage::VariantRecord	58	1162	2022-08-29 23:03:05.292278
1163	image	ActiveStorage::VariantRecord	59	1163	2022-08-29 23:03:05.298478
1164	image	ActiveStorage::VariantRecord	57	1164	2022-08-29 23:03:05.31217
1165	image	ActiveStorage::VariantRecord	60	1165	2022-08-29 23:03:05.328303
1166	image	ActiveStorage::VariantRecord	61	1166	2022-08-29 23:03:05.350903
1167	image	ActiveStorage::VariantRecord	62	1167	2022-08-29 23:03:05.64217
1168	image	ActiveStorage::VariantRecord	64	1168	2022-08-29 23:03:05.662597
1169	image	ActiveStorage::VariantRecord	63	1169	2022-08-29 23:03:05.676074
1170	image	ActiveStorage::VariantRecord	65	1170	2022-08-29 23:03:05.714764
1171	image	ActiveStorage::VariantRecord	66	1171	2022-08-29 23:03:05.745236
1172	image	ActiveStorage::VariantRecord	67	1172	2022-08-29 23:03:06.065216
1173	image	ActiveStorage::VariantRecord	68	1173	2022-08-29 23:03:06.093045
1174	image	ActiveStorage::VariantRecord	69	1174	2022-08-29 23:03:06.096444
1175	image	ActiveStorage::VariantRecord	70	1175	2022-08-29 23:03:06.147485
1176	image	ActiveStorage::VariantRecord	71	1176	2022-08-29 23:03:06.177371
1177	image	ActiveStorage::VariantRecord	72	1177	2022-08-29 23:03:06.428608
1178	image	ActiveStorage::VariantRecord	73	1178	2022-08-29 23:03:06.516462
1179	image	ActiveStorage::VariantRecord	74	1179	2022-08-29 23:03:06.532298
1180	image	ActiveStorage::VariantRecord	75	1180	2022-08-29 23:03:06.55546
1181	image	ActiveStorage::VariantRecord	76	1181	2022-08-29 23:03:06.559483
1182	image	ActiveStorage::VariantRecord	77	1182	2022-08-29 23:03:06.832713
1183	image	ActiveStorage::VariantRecord	78	1183	2022-08-29 23:03:06.906828
1184	image	ActiveStorage::VariantRecord	79	1184	2022-08-29 23:03:06.944758
1185	image	ActiveStorage::VariantRecord	80	1185	2022-08-29 23:03:06.963685
1186	image	ActiveStorage::VariantRecord	81	1186	2022-08-29 23:03:06.98194
1187	image	ActiveStorage::VariantRecord	82	1187	2022-08-29 23:29:35.538301
1188	image	ActiveStorage::VariantRecord	84	1188	2022-08-29 23:29:36.283972
1189	image	ActiveStorage::VariantRecord	83	1189	2022-08-29 23:29:36.28684
1190	image	ActiveStorage::VariantRecord	86	1190	2022-08-29 23:29:36.312331
1191	image	ActiveStorage::VariantRecord	85	1191	2022-08-29 23:29:36.320383
1192	image	ActiveStorage::VariantRecord	88	1192	2022-08-29 23:29:36.747106
1193	image	ActiveStorage::VariantRecord	87	1193	2022-08-29 23:29:36.783505
1194	image	ActiveStorage::VariantRecord	89	1194	2022-08-29 23:29:36.857719
1195	image	ActiveStorage::VariantRecord	90	1195	2022-08-29 23:29:36.890469
1196	image	ActiveStorage::VariantRecord	91	1196	2022-08-29 23:29:36.916387
1197	image	ActiveStorage::VariantRecord	92	1197	2022-08-29 23:29:37.254101
1198	image	ActiveStorage::VariantRecord	93	1198	2022-08-29 23:29:37.348682
1199	image	ActiveStorage::VariantRecord	94	1199	2022-08-29 23:29:37.35317
1200	image	ActiveStorage::VariantRecord	95	1200	2022-08-29 23:29:37.371307
1201	image	ActiveStorage::VariantRecord	96	1201	2022-08-29 23:29:37.529188
1202	image	ActiveStorage::VariantRecord	97	1202	2022-08-29 23:29:37.77813
1203	image	ActiveStorage::VariantRecord	98	1203	2022-08-29 23:29:37.790459
1204	image	ActiveStorage::VariantRecord	100	1205	2022-08-29 23:29:37.808188
1205	image	ActiveStorage::VariantRecord	99	1204	2022-08-29 23:29:37.811049
1206	image	ActiveStorage::VariantRecord	101	1206	2022-08-29 23:29:37.927112
1207	image	ActiveStorage::VariantRecord	102	1207	2022-08-29 23:29:38.186771
1208	image	ActiveStorage::VariantRecord	103	1208	2022-08-29 23:29:38.223218
1213	image	ActiveStorage::VariantRecord	108	1213	2022-08-29 23:29:38.618428
1209	image	ActiveStorage::VariantRecord	104	1209	2022-08-29 23:29:38.253157
1210	image	ActiveStorage::VariantRecord	105	1210	2022-08-29 23:29:38.271972
1212	image	ActiveStorage::VariantRecord	107	1212	2022-08-29 23:29:38.605301
1211	image	ActiveStorage::VariantRecord	106	1211	2022-08-29 23:29:38.317652
1214	image	ActiveStorage::VariantRecord	109	1214	2022-08-29 23:29:38.629465
1215	image	ActiveStorage::VariantRecord	110	1215	2022-08-31 00:17:46.878213
1216	image	ActiveStorage::VariantRecord	112	1216	2022-08-31 00:17:46.881679
1217	image	ActiveStorage::VariantRecord	111	1217	2022-08-31 00:17:46.885392
1218	image	ActiveStorage::VariantRecord	114	1218	2022-09-01 20:09:18.926134
1219	image	ActiveStorage::VariantRecord	115	1219	2022-09-01 20:09:18.931722
1220	image	ActiveStorage::VariantRecord	113	1220	2022-09-01 20:09:18.934214
1221	image	ActiveStorage::VariantRecord	116	1221	2022-09-01 20:09:22.3551
1222	image	ActiveStorage::VariantRecord	118	1222	2022-09-01 20:09:22.377476
1223	image	ActiveStorage::VariantRecord	117	1223	2022-09-01 20:09:22.387782
1224	image	ActiveStorage::VariantRecord	119	1224	2022-09-01 20:09:22.40839
1225	image	ActiveStorage::VariantRecord	120	1225	2022-09-01 20:09:22.417439
1226	image	ActiveStorage::VariantRecord	121	1226	2022-09-01 20:09:22.764403
1227	image	ActiveStorage::VariantRecord	122	1227	2022-09-01 20:09:22.768184
1228	image	ActiveStorage::VariantRecord	123	1228	2022-09-01 20:09:25.900912
1229	image	ActiveStorage::VariantRecord	124	1229	2022-09-01 21:15:39.177375
1230	image	ActiveStorage::VariantRecord	125	1230	2022-09-01 21:15:39.402199
1231	image	ActiveStorage::VariantRecord	126	1231	2022-09-01 23:41:44.537997
1232	image	ActiveStorage::VariantRecord	127	1232	2022-09-01 23:41:44.544349
1233	image	ActiveStorage::VariantRecord	128	1233	2022-09-01 23:41:44.553894
1234	image	ActiveStorage::VariantRecord	129	1234	2022-09-01 23:41:44.566568
1235	image	ActiveStorage::VariantRecord	130	1236	2022-09-02 00:03:42.582614
1236	image	ActiveStorage::VariantRecord	131	1235	2022-09-02 00:03:42.586158
1237	image	ActiveStorage::VariantRecord	133	1237	2022-09-02 00:03:42.591471
1238	image	ActiveStorage::VariantRecord	132	1238	2022-09-02 00:03:42.594251
1239	image	ActiveStorage::VariantRecord	134	1239	2022-09-02 00:03:42.599905
1240	image	ActiveStorage::VariantRecord	135	1240	2022-09-02 00:03:43.013635
\.


--
-- Data for Name: active_storage_variant_records; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.active_storage_variant_records (id, blob_id, variation_digest) FROM stdin;
1	987	M91c9VrFpBr494LVqt2ovQeA/lk=
2	1057	ku0PabRttFoyg1lxkOD6CdmOCUE=
3	991	ku0PabRttFoyg1lxkOD6CdmOCUE=
4	976	mGHHiovEPBXQkNJBADVOPEuT8nw=
5	1005	ku0PabRttFoyg1lxkOD6CdmOCUE=
6	862	ku0PabRttFoyg1lxkOD6CdmOCUE=
7	1064	wj2EsykI81rCJCK6QU6D9xirR/c=
8	1058	wj2EsykI81rCJCK6QU6D9xirR/c=
9	1063	wj2EsykI81rCJCK6QU6D9xirR/c=
10	1062	wj2EsykI81rCJCK6QU6D9xirR/c=
11	1057	wj2EsykI81rCJCK6QU6D9xirR/c=
12	1060	wj2EsykI81rCJCK6QU6D9xirR/c=
13	1061	wj2EsykI81rCJCK6QU6D9xirR/c=
14	1059	wj2EsykI81rCJCK6QU6D9xirR/c=
15	975	ku0PabRttFoyg1lxkOD6CdmOCUE=
16	1009	ku0PabRttFoyg1lxkOD6CdmOCUE=
17	1004	ku0PabRttFoyg1lxkOD6CdmOCUE=
18	959	dvWoyI1NThETC9il+wcjmYkgNFE=
19	944	dvWoyI1NThETC9il+wcjmYkgNFE=
20	956	ku0PabRttFoyg1lxkOD6CdmOCUE=
21	936	mGHHiovEPBXQkNJBADVOPEuT8nw=
22	907	ku0PabRttFoyg1lxkOD6CdmOCUE=
23	917	mGHHiovEPBXQkNJBADVOPEuT8nw=
24	940	ku0PabRttFoyg1lxkOD6CdmOCUE=
25	922	ku0PabRttFoyg1lxkOD6CdmOCUE=
26	930	M91c9VrFpBr494LVqt2ovQeA/lk=
27	867	mGHHiovEPBXQkNJBADVOPEuT8nw=
28	895	mGHHiovEPBXQkNJBADVOPEuT8nw=
29	964	M91c9VrFpBr494LVqt2ovQeA/lk=
30	905	ku0PabRttFoyg1lxkOD6CdmOCUE=
31	850	mGHHiovEPBXQkNJBADVOPEuT8nw=
32	874	mGHHiovEPBXQkNJBADVOPEuT8nw=
33	1005	wj2EsykI81rCJCK6QU6D9xirR/c=
34	1008	wj2EsykI81rCJCK6QU6D9xirR/c=
35	1006	wj2EsykI81rCJCK6QU6D9xirR/c=
36	1007	wj2EsykI81rCJCK6QU6D9xirR/c=
37	976	uGVNt8/KrBA47/Pa9FvWjIjknMY=
38	959	kew+Jjn6rrgNk4/Pj4n+LM0hZVg=
39	987	JkDIZZBvzep28tKq9zM7WlqeP9s=
40	1069	wj2EsykI81rCJCK6QU6D9xirR/c=
41	991	wj2EsykI81rCJCK6QU6D9xirR/c=
42	907	wj2EsykI81rCJCK6QU6D9xirR/c=
43	940	wj2EsykI81rCJCK6QU6D9xirR/c=
44	922	wj2EsykI81rCJCK6QU6D9xirR/c=
45	944	kew+Jjn6rrgNk4/Pj4n+LM0hZVg=
46	936	uGVNt8/KrBA47/Pa9FvWjIjknMY=
47	930	JkDIZZBvzep28tKq9zM7WlqeP9s=
48	874	uGVNt8/KrBA47/Pa9FvWjIjknMY=
49	895	uGVNt8/KrBA47/Pa9FvWjIjknMY=
50	905	wj2EsykI81rCJCK6QU6D9xirR/c=
51	917	uGVNt8/KrBA47/Pa9FvWjIjknMY=
52	850	uGVNt8/KrBA47/Pa9FvWjIjknMY=
53	834	uGVNt8/KrBA47/Pa9FvWjIjknMY=
54	843	JkDIZZBvzep28tKq9zM7WlqeP9s=
55	1086	JkDIZZBvzep28tKq9zM7WlqeP9s=
56	867	uGVNt8/KrBA47/Pa9FvWjIjknMY=
57	999	wj2EsykI81rCJCK6QU6D9xirR/c=
58	1082	kew+Jjn6rrgNk4/Pj4n+LM0hZVg=
59	956	wj2EsykI81rCJCK6QU6D9xirR/c=
60	1076	wj2EsykI81rCJCK6QU6D9xirR/c=
61	945	JkDIZZBvzep28tKq9zM7WlqeP9s=
62	816	uGVNt8/KrBA47/Pa9FvWjIjknMY=
63	861	uGVNt8/KrBA47/Pa9FvWjIjknMY=
64	822	wj2EsykI81rCJCK6QU6D9xirR/c=
65	804	JkDIZZBvzep28tKq9zM7WlqeP9s=
66	955	uGVNt8/KrBA47/Pa9FvWjIjknMY=
67	810	uGVNt8/KrBA47/Pa9FvWjIjknMY=
68	795	wj2EsykI81rCJCK6QU6D9xirR/c=
69	796	wj2EsykI81rCJCK6QU6D9xirR/c=
70	756	uGVNt8/KrBA47/Pa9FvWjIjknMY=
71	803	wj2EsykI81rCJCK6QU6D9xirR/c=
72	722	JkDIZZBvzep28tKq9zM7WlqeP9s=
73	707	wj2EsykI81rCJCK6QU6D9xirR/c=
74	712	uGVNt8/KrBA47/Pa9FvWjIjknMY=
75	1045	wj2EsykI81rCJCK6QU6D9xirR/c=
76	751	JkDIZZBvzep28tKq9zM7WlqeP9s=
77	744	JkDIZZBvzep28tKq9zM7WlqeP9s=
78	713	wj2EsykI81rCJCK6QU6D9xirR/c=
79	741	JkDIZZBvzep28tKq9zM7WlqeP9s=
80	728	JkDIZZBvzep28tKq9zM7WlqeP9s=
81	731	JkDIZZBvzep28tKq9zM7WlqeP9s=
82	1069	ku0PabRttFoyg1lxkOD6CdmOCUE=
83	834	mGHHiovEPBXQkNJBADVOPEuT8nw=
84	843	M91c9VrFpBr494LVqt2ovQeA/lk=
85	1076	ku0PabRttFoyg1lxkOD6CdmOCUE=
86	1086	M91c9VrFpBr494LVqt2ovQeA/lk=
87	955	mGHHiovEPBXQkNJBADVOPEuT8nw=
88	999	ku0PabRttFoyg1lxkOD6CdmOCUE=
89	861	mGHHiovEPBXQkNJBADVOPEuT8nw=
90	822	ku0PabRttFoyg1lxkOD6CdmOCUE=
91	1082	dvWoyI1NThETC9il+wcjmYkgNFE=
92	816	mGHHiovEPBXQkNJBADVOPEuT8nw=
93	804	M91c9VrFpBr494LVqt2ovQeA/lk=
94	810	mGHHiovEPBXQkNJBADVOPEuT8nw=
95	945	M91c9VrFpBr494LVqt2ovQeA/lk=
96	803	ku0PabRttFoyg1lxkOD6CdmOCUE=
97	756	mGHHiovEPBXQkNJBADVOPEuT8nw=
98	707	ku0PabRttFoyg1lxkOD6CdmOCUE=
99	795	ku0PabRttFoyg1lxkOD6CdmOCUE=
100	722	M91c9VrFpBr494LVqt2ovQeA/lk=
101	1045	ku0PabRttFoyg1lxkOD6CdmOCUE=
102	712	mGHHiovEPBXQkNJBADVOPEuT8nw=
103	731	M91c9VrFpBr494LVqt2ovQeA/lk=
104	744	M91c9VrFpBr494LVqt2ovQeA/lk=
105	751	M91c9VrFpBr494LVqt2ovQeA/lk=
106	713	ku0PabRttFoyg1lxkOD6CdmOCUE=
107	728	M91c9VrFpBr494LVqt2ovQeA/lk=
108	741	M91c9VrFpBr494LVqt2ovQeA/lk=
109	796	ku0PabRttFoyg1lxkOD6CdmOCUE=
110	1018	ku0PabRttFoyg1lxkOD6CdmOCUE=
111	1099	M91c9VrFpBr494LVqt2ovQeA/lk=
112	884	M91c9VrFpBr494LVqt2ovQeA/lk=
113	1028	ku0PabRttFoyg1lxkOD6CdmOCUE=
114	787	ku0PabRttFoyg1lxkOD6CdmOCUE=
115	706	M91c9VrFpBr494LVqt2ovQeA/lk=
116	717	M91c9VrFpBr494LVqt2ovQeA/lk=
117	727	ku0PabRttFoyg1lxkOD6CdmOCUE=
118	710	M91c9VrFpBr494LVqt2ovQeA/lk=
119	775	ku0PabRttFoyg1lxkOD6CdmOCUE=
120	726	M91c9VrFpBr494LVqt2ovQeA/lk=
121	1090	M91c9VrFpBr494LVqt2ovQeA/lk=
122	738	M91c9VrFpBr494LVqt2ovQeA/lk=
123	1038	ku0PabRttFoyg1lxkOD6CdmOCUE=
124	1065	M91c9VrFpBr494LVqt2ovQeA/lk=
125	832	ku0PabRttFoyg1lxkOD6CdmOCUE=
126	1066	wj2EsykI81rCJCK6QU6D9xirR/c=
127	1068	wj2EsykI81rCJCK6QU6D9xirR/c=
128	1067	wj2EsykI81rCJCK6QU6D9xirR/c=
129	1065	JkDIZZBvzep28tKq9zM7WlqeP9s=
130	1072	wj2EsykI81rCJCK6QU6D9xirR/c=
131	1071	wj2EsykI81rCJCK6QU6D9xirR/c=
132	1075	wj2EsykI81rCJCK6QU6D9xirR/c=
133	1070	wj2EsykI81rCJCK6QU6D9xirR/c=
134	1073	wj2EsykI81rCJCK6QU6D9xirR/c=
135	1074	wj2EsykI81rCJCK6QU6D9xirR/c=
\.


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
environment	development	2022-04-05 21:10:37.484198	2022-04-05 21:10:37.484198
schema_sha1	a26bce749f032e2b20b97767a3bbefd03a66d219	2022-04-05 21:10:37.500763	2022-04-05 21:10:37.500763
\.


--
-- Data for Name: friendly_id_slugs; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.friendly_id_slugs (id, slug, sluggable_id, sluggable_type, created_at, scope) FROM stdin;
277	group-process	32	Tag	2021-09-26 16:49:29.329393	\N
16	corpologia	5	Tag	2013-01-04 20:22:42.080227	\N
18	zenits-1	6	Work	2013-01-04 20:32:20.781848	\N
21	live-drawing	7	Tag	2013-01-04 20:49:45.169516	\N
22	possibles-impossibles	7	Work	2013-01-04 20:49:50.058707	\N
24	dues-veus-nues	8	Work	2013-01-04 20:55:14.033332	\N
25	instal-laci	9	Tag	2013-01-04 21:08:26.942934	\N
30	instal-lation	9	Tag	2013-01-04 21:11:42.491167	\N
37	e-qui-libri-s-ii	9	Work	2013-01-04 22:53:54.309538	\N
38	anima-l-u	10	Work	2013-01-05 00:35:49.845803	\N
39	dinergia-i-ii-iii	11	Work	2013-01-05 00:51:53.5636	\N
42	musical-ment	12	Work	2013-01-05 01:21:09.076696	\N
44	constelaccions	13	Work	2013-01-05 01:30:15.499152	\N
46	aflora	14	Work	2013-01-05 01:36:10.283705	\N
47	improvisar	15	Work	2013-01-05 01:58:06.695745	\N
280	proces-col-lectiu	32	Tag	2021-09-26 16:54:23.549571	\N
281	group-process--4	32	Tag	2021-09-26 16:54:23.563309	\N
282	proceso-colectivo	32	Tag	2021-09-26 16:54:23.576575	\N
54	paintings	6	Tag	2013-01-05 01:59:24.504772	\N
55	pintura	6	Tag	2013-01-05 01:59:24.523608	\N
57	obra-sobre-paper	8	Tag	2013-01-05 01:59:30.848381	\N
61	poetry	10	Tag	2013-01-05 01:59:34.008002	\N
69	prints	14	Tag	2013-01-05 01:59:49.094415	\N
70	obra-grafica-original	14	Tag	2013-01-05 01:59:49.122038	\N
71	impro	15	Work	2013-01-20 00:30:45.097375	\N
72	ouroboros-veus	16	Work	2013-01-20 00:53:58.84628	\N
73	uters	17	Work	2013-01-20 01:01:02.256225	\N
74	itaca-pas-a-dos	18	Work	2013-01-20 02:15:46.419908	\N
77	taboo-ser-res-cos-soc	19	Work	2013-01-20 02:38:43.5135	\N
85	6-senses--7	23	Work	2013-03-22 00:11:07.047606	\N
86	6-senses-consentidosinsentido	23	Work	2013-03-27 21:32:24.085653	\N
87	s-t-sin-titulo	24	Work	2013-03-27 21:35:26.196542	\N
89	el-celler-i--2	26	Work	2013-03-28 00:59:08.763383	\N
101	work-on-paper	8	Tag	2013-03-30 20:34:49.755064	\N
102	obra-sobre-papel	8	Tag	2013-03-30 20:34:49.783355	\N
104	si-lent-si-silenci	27	Work	2013-04-05 15:05:10.580186	\N
108	grafies-d-una-mirada-a-sarria	29	Work	2013-04-05 18:53:18.984708	\N
109	s-t-sense-titol	24	Work	2013-04-05 19:00:00.78391	\N
111	axis-salus-homenaje-al-buen-medico-premio-separ	30	Work	2013-08-20 12:53:55.078103	\N
112	axis-salus-hommage-to-the-good-doctor	30	Work	2013-08-20 12:58:58.405243	\N
113	a-z-5-5-f-acts	31	Work	2013-09-05 14:59:31.694005	\N
114	fent-volar-coloms	33	Work	2013-12-06 12:49:29.150227	\N
115	sum-us	34	Work	2013-12-06 13:04:41.830294	\N
116	quina-es-la-pregunta	35	Work	2013-12-06 13:07:21.05641	\N
117	despunxar	36	Work	2013-12-06 13:20:59.631277	\N
118	n-ombrares	37	Work	2014-05-17 12:35:52.164693	\N
119	ad-hoc-al-lloc	38	Work	2014-05-17 12:58:04.90134	\N
120	polissons	39	Work	2014-05-17 12:59:00.773155	\N
121	birds-ocells-al-cap	40	Work	2014-05-17 13:01:15.511937	\N
122	present-o-saltal-ara	41	Work	2014-05-17 13:20:04.167981	\N
123	els-polissons	39	Work	2014-07-17 22:28:58.050178	\N
124	axis-salus-homenatge-al-bon-metge	30	Work	2014-10-09 17:19:07.935541	\N
125	ad-hoc	38	Work	2015-01-04 21:41:51.492076	\N
126	d-accions-i-diccions	42	Work	2015-01-04 22:05:21.220762	\N
128	esclau	43	Work	2015-01-04 23:00:44.753569	\N
132	estona	44	Work	2015-01-05 00:13:38.843641	\N
133	free-will-x-veure	46	Work	2015-07-03 00:07:38.042621	\N
151	elgrandtour	47	Work	2015-09-27 22:40:27.716354	\N
152	pes-pressio	48	Work	2016-08-01 15:36:44.514509	\N
153	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	49	Work	2016-08-01 15:46:04.570841	\N
155	aux-bleux-aigus-d-acier-et-de-cristal--2	49	Work	2016-08-01 15:48:05.409903	\N
156	pomps-of-the-subsoil	51	Work	2016-08-01 16:18:35.364208	\N
157	eventuall	52	Work	2016-08-01 16:58:26.661855	\N
158	fluxus	53	Work	2016-08-01 17:43:57.132116	\N
159	donar-veu-al-desig	54	Work	2016-08-01 17:50:44.231874	\N
160	donar-veu-fer-un-pas	55	Work	2016-08-01 17:54:00.865555	\N
161	cromosomx	56	Work	2016-10-19 22:54:30.29125	\N
162	tot-fluxus	57	Work	2016-10-19 22:59:40.444079	\N
163	flux-us	57	Work	2017-02-19 23:10:21.263902	\N
165	idenditat	59	Work	2017-06-01 22:46:09.195209	\N
168	we-were-waiting-for-you--2	61	Work	2017-06-01 23:01:04.883158	\N
169	donar-veu-i-veure-mes	62	Work	2017-06-01 23:33:01.207476	\N
170	flux-u	63	Work	2017-06-02 00:01:33.89065	\N
171	fluxus--2	64	Work	2017-06-02 00:41:14.383949	\N
172	flux	63	Work	2018-08-22 14:36:16.887405	\N
174	desig-per-z-ones	65	Work	2018-08-22 15:06:01.778152	\N
175	per-se	66	Work	2018-08-22 15:12:28.308362	\N
177	ip-sum-id-est	67	Work	2018-08-22 15:22:59.142841	\N
179	quid-de-la-questio	68	Work	2018-08-22 15:29:30.567705	\N
182	ipse-ipsa-ipsum-em	69	Work	2019-01-18 23:45:26.10968	\N
183	proces-in-solid	70	Work	2019-01-28 21:07:00.410046	\N
184	entrar-sortint-sortir-entrant	71	Work	2019-03-07 22:44:50.245614	\N
284	gravats	92	Work	2021-11-19 20:17:29.246789	\N
186	cap-cap	72	Work	2019-04-10 23:03:30.958381	\N
187	trans-form-morf-i-vii	73	Work	2019-04-15 11:41:07.669373	\N
188	accio	21	Tag	2019-06-10 20:05:38.53404	\N
285	prints	92	Work	2021-11-20 13:37:15.609501	\N
286	obra-grafica	92	Work	2021-11-20 13:40:05.743944	\N
191	paisatge-liquid	74	Work	2019-06-10 20:41:51.289634	\N
192	enclaudebes	75	Work	2019-06-10 21:35:33.87648	\N
287	constelacciones	13	Work	2022-01-05 20:10:05.556017	\N
194	gravat9	76	Work	2019-06-10 21:53:37.34139	\N
288	entrar-saliendo-salir-entrando	71	Work	2022-01-05 20:21:12.678863	\N
289	paisaje-liquido	74	Work	2022-01-05 20:50:40.917296	\N
197	donar-veu-i-fer-un-pas	55	Work	2019-06-10 21:56:47.210592	\N
198	de-veu-en-veu	77	Work	2019-06-10 22:08:30.894399	\N
199	gravat-9	76	Work	2020-02-14 20:56:02.883574	\N
200	petraperta	70	Work	2020-02-14 21:04:33.105898	\N
201	thyllandsias	78	Work	2020-02-14 21:53:45.811803	\N
202	s-o-gota-a-gota	81	Work	2020-02-19 17:54:40.933021	\N
203	gota-gota	81	Work	2020-02-19 18:01:52.472334	\N
291	obra-original-sobre-paper	35	Tag	2022-01-05 21:21:36.340074	\N
206	accio-artistica-i-social	23	Tag	2020-06-15 15:31:19.5223	\N
292	original-work-on-paper	35	Tag	2022-01-05 21:21:36.355226	\N
293	obra-original-sobre-papel	35	Tag	2022-01-05 21:21:36.36721	\N
294	enclavedebes-os	75	Work	2022-01-10 11:45:29.824039	\N
214	phoscenes	82	Work	2020-09-21 08:55:36.149383	\N
218	des-cuidar	83	Work	2021-01-04 20:46:08.884519	\N
219	entrelinies-8ple8buit	84	Work	2021-01-04 20:54:14.354195	\N
220	entre-linies-8ple8buit-veure	84	Work	2021-01-04 20:55:21.787664	\N
221	i-o-torno-i-no-torno	85	Work	2021-04-08 21:04:23.004487	\N
223	si-i-o-no-torno-i-no-torno	85	Work	2021-04-08 21:31:03.896342	\N
227	wild-swans	87	Work	2021-08-31 23:10:08.83917	\N
228	over-and-over-again-and-again	87	Work	2021-09-13 17:22:20.925913	\N
229	art-efimer	31	Tag	2021-09-20 19:33:22.477462	\N
230	ull-agulles	88	Work	2021-09-20 19:33:22.594526	\N
231	accio-artistica-social	23	Tag	2021-09-20 19:36:53.841147	\N
232	social-art-performance	23	Tag	2021-09-20 19:36:53.855784	\N
233	accion-artistica-social	23	Tag	2021-09-20 19:36:53.869026	\N
234	accio-col-lectiva	19	Tag	2021-09-20 19:36:55.658244	\N
235	collective-performance	19	Tag	2021-09-20 19:36:55.671384	\N
236	accion-colectiva	19	Tag	2021-09-20 19:36:55.686552	\N
237	accio-poetica	18	Tag	2021-09-20 19:36:57.265862	\N
238	poetry--2	18	Tag	2021-09-20 19:36:57.278927	\N
239	accion-poetica	18	Tag	2021-09-20 19:36:57.29333	\N
240	accio-sonora	17	Tag	2021-09-20 19:36:59.17633	\N
241	sound-action	17	Tag	2021-09-20 19:36:59.193611	\N
242	accion-sonora	17	Tag	2021-09-20 19:36:59.209679	\N
243	ephemeral-art	31	Tag	2021-09-20 19:37:01.111925	\N
244	arte-efimero	31	Tag	2021-09-20 19:37:01.125897	\N
245	art-participatiu	28	Tag	2021-09-20 19:37:03.213451	\N
246	participatory-art	28	Tag	2021-09-20 19:37:03.230092	\N
247	arte-participativo	28	Tag	2021-09-20 19:37:03.245504	\N
248	dansa	1	Tag	2021-09-20 19:37:06.319359	\N
249	dance	1	Tag	2021-09-20 19:37:06.334841	\N
250	danza	1	Tag	2021-09-20 19:37:06.349234	\N
251	dibuix	13	Tag	2021-09-20 19:37:07.723576	\N
252	drawing	13	Tag	2021-09-20 19:37:07.748149	\N
253	dibujo	13	Tag	2021-09-20 19:37:07.761374	\N
254	sculpture	11	Tag	2021-09-20 19:37:08.964353	\N
255	escultura	11	Tag	2021-09-20 19:37:08.976701	\N
256	il-lustracio	15	Tag	2021-09-20 19:37:11.211667	\N
257	illustration	15	Tag	2021-09-20 19:37:11.22489	\N
258	ilustracion	15	Tag	2021-09-20 19:37:11.237544	\N
259	instal-lacio	9	Tag	2021-09-20 19:37:13.025223	\N
260	instalation	9	Tag	2021-09-20 19:37:13.037116	\N
261	instalacion	9	Tag	2021-09-20 19:37:13.048885	\N
262	land-art-o-art-natura	26	Tag	2021-09-20 19:37:15.640688	\N
263	land-art	26	Tag	2021-09-20 19:37:15.652926	\N
264	llibre	16	Tag	2021-09-20 19:37:20.001252	\N
265	book	16	Tag	2021-09-20 19:37:20.013448	\N
266	libro	16	Tag	2021-09-20 19:37:20.026703	\N
267	performance	21	Tag	2021-09-20 19:37:23.48247	\N
268	performance--2	21	Tag	2021-09-20 19:37:23.493662	\N
269	accion	21	Tag	2021-09-20 19:37:23.505331	\N
270	poetry--3	10	Tag	2021-09-20 19:37:25.218974	\N
271	poesia	10	Tag	2021-09-20 19:37:25.232987	\N
272	visual-poetry	27	Tag	2021-09-20 19:37:26.765614	\N
273	poesia-visual	27	Tag	2021-09-20 19:37:26.780888	\N
274	video-accio	30	Tag	2021-09-20 19:37:28.393461	\N
275	video-performance	30	Tag	2021-09-20 19:37:28.405798	\N
276	video-accion	30	Tag	2021-09-20 19:37:28.418593	\N
\.


--
-- Data for Name: image_translations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.image_translations (id, image_id, locale, credits, created_at, updated_at) FROM stdin;
3	55	ca		2013-03-22 00:11:06.540112	2013-03-22 00:11:06.540112
4	56	ca		2013-03-27 21:32:21.839954	2013-03-27 21:32:21.839954
5	57	ca		2013-03-27 21:32:22.733564	2013-03-27 21:32:22.733564
6	58	ca		2013-03-27 21:32:23.189162	2013-03-27 21:32:23.189162
7	59	ca		2013-03-27 21:32:23.645671	2013-03-27 21:32:23.645671
8	60	es		2013-03-27 23:34:07.511615	2013-03-27 23:34:07.511615
9	61	es		2013-03-27 23:34:08.440857	2013-03-27 23:34:08.440857
10	62	es		2013-03-27 23:34:08.852655	2013-03-27 23:34:08.852655
11	63	es		2013-03-27 23:34:09.267109	2013-03-27 23:34:09.267109
12	64	es		2013-03-27 23:34:09.756988	2013-03-27 23:34:09.756988
13	65	es		2013-03-27 23:34:10.144464	2013-03-27 23:34:10.144464
14	66	es		2013-03-27 23:34:10.603487	2013-03-27 23:34:10.603487
16	68	es		2013-03-27 23:34:11.506522	2013-03-27 23:34:11.506522
17	69	es		2013-03-27 23:34:12.078094	2013-03-27 23:34:12.078094
18	70	es		2013-03-27 23:34:12.53479	2013-03-27 23:34:12.53479
19	13	es		2013-03-27 23:42:26.387736	2013-03-27 23:42:26.392488
20	71	es		2013-03-27 23:42:26.406401	2013-03-27 23:42:26.406401
21	72	es		2013-03-27 23:42:26.861009	2013-03-27 23:42:26.861009
22	73	es		2013-03-27 23:42:27.262821	2013-03-27 23:42:27.262821
24	13	ca		2013-03-27 23:48:29.765442	2013-03-27 23:48:29.783226
25	75	ca		2013-03-27 23:48:29.799667	2013-03-27 23:48:29.799667
26	76	ca		2013-03-27 23:48:30.298911	2013-03-27 23:48:30.298911
27	77	ca		2013-03-27 23:48:30.710828	2013-03-27 23:48:30.710828
28	78	ca		2013-03-27 23:48:31.103852	2013-03-27 23:48:31.103852
29	79	ca		2013-03-27 23:48:31.488909	2013-03-27 23:48:31.488909
30	80	ca		2013-03-27 23:48:31.892413	2013-03-27 23:48:31.892413
31	40	ca	<p>\r\n\tL&#39;a muse</p>\r\n	2013-03-28 00:07:10.394093	2013-03-28 00:07:10.397956
32	41	ca	<p>\r\n\tImpostura</p>\r\n	2013-03-28 00:07:10.405479	2013-03-28 00:07:10.409061
33	42	ca	<p>\r\n\t&uacute;ter</p>\r\n	2013-03-28 00:07:10.416625	2013-03-28 00:07:10.420059
38	85	ca		2013-03-28 00:59:06.363294	2013-03-28 00:59:06.363294
39	86	ca		2013-03-28 00:59:06.830378	2013-03-28 00:59:06.830378
42	89	ca		2013-03-28 00:59:07.965667	2013-03-28 00:59:07.965667
44	91	ca		2013-03-28 01:29:42.962659	2013-03-28 01:29:42.962659
53	3	ca	<p>\r\n\tYa no hay horizonte.<br />\r\n\tAlguien camina<br />\r\n\tsin dejar huella ni sombra.</p>\r\n	2013-03-28 01:44:05.440918	2013-03-28 01:44:05.444243
45	92	ca	<p>\r\n\tEl viento despeina<br />\r\n\tlas hierbas. Piedras<br />\r\n\ten el camino del agua.</p>\r\n	2013-03-28 01:34:59.565378	2013-03-28 01:44:05.452648
46	93	ca	<p>\r\n\tLa hoja, a punto<br />\r\n\tde caer, tiembla.<br />\r\n\tSopla el viento.</p>\r\n	2013-03-28 01:35:00.110513	2013-03-28 01:44:05.460051
47	94	ca	<p>\r\n\tCien hormigas<br />\r\n\tresiguen el crep&uacute;sculo<br />\r\n\tque nadie camina.</p>\r\n	2013-03-28 01:35:00.656409	2013-03-28 01:44:05.467717
48	95	ca	<p>\r\n\tBaile de paraguas.<br />\r\n\tRamblas abajo.<br />\r\n\tUn gato se moja.</p>\r\n	2013-03-28 01:35:01.236097	2013-03-28 01:44:05.475085
49	96	ca	<p>\r\n\tLa risa rompe<br />\r\n\tla pesadez de la tarde.<br />\r\n\tSonr&iacute;e una nube.</p>\r\n	2013-03-28 01:35:01.748521	2013-03-28 01:44:05.48332
50	97	ca	<p>\r\n\tFa sostenido.<br />\r\n\tUnos dedos acarician.<br />\r\n\tLa piel de la tecla.</p>\r\n	2013-03-28 01:35:02.35206	2013-03-28 01:44:05.492004
51	98	ca	<p>\r\n\tPalabras como humo<br />\r\n\tcorretean por la cama.<br />\r\n\tLa noche escucha y calla.</p>\r\n	2013-03-28 01:35:02.864505	2013-03-28 01:44:05.499519
52	99	ca	<p>\r\n\tCae la gota.<br />\r\n\tC&iacute;rculos conc&eacute;ntricos.<br />\r\n\tLa luna danza.</p>\r\n	2013-03-28 01:35:03.380843	2013-03-28 01:44:05.507413
56	102	ca		2013-04-05 18:53:13.967487	2013-04-05 18:53:13.967487
57	103	ca		2013-04-05 18:53:14.965796	2013-04-05 18:53:14.965796
58	104	ca		2013-04-05 18:53:15.441805	2013-04-05 18:53:15.441805
59	105	ca		2013-04-05 18:53:16.033262	2013-04-05 18:53:16.033262
60	106	ca		2013-04-05 18:53:16.547989	2013-04-05 18:53:16.547989
61	107	ca		2013-04-05 18:53:17.161278	2013-04-05 18:53:17.161278
62	108	ca		2013-04-05 18:53:17.660573	2013-04-05 18:53:17.660573
63	109	ca		2013-04-05 18:53:18.288205	2013-04-05 18:53:18.288205
64	60	ca		2013-04-05 19:00:00.59727	2013-04-05 19:00:00.603675
65	61	ca		2013-04-05 19:00:00.615755	2013-04-05 19:00:00.621572
66	62	ca		2013-04-05 19:00:00.633942	2013-04-05 19:00:00.63886
67	63	ca		2013-04-05 19:00:00.649863	2013-04-05 19:00:00.654656
68	64	ca		2013-04-05 19:00:00.665156	2013-04-05 19:00:00.670108
69	65	ca		2013-04-05 19:00:00.680682	2013-04-05 19:00:00.685759
70	66	ca		2013-04-05 19:00:00.697105	2013-04-05 19:00:00.702356
71	68	ca		2013-04-05 19:00:00.71339	2013-04-05 19:00:00.718496
72	69	ca		2013-04-05 19:00:00.729647	2013-04-05 19:00:00.734447
73	70	ca		2013-04-05 19:00:00.744889	2013-04-05 19:00:00.75005
74	12	ca		2013-04-05 19:05:21.846347	2013-04-05 19:05:21.851412
75	71	ca		2013-04-05 19:05:21.874111	2013-04-05 19:05:21.878902
76	72	ca		2013-04-05 19:05:21.908947	2013-04-05 19:05:21.913981
77	73	ca		2013-04-05 19:05:21.927624	2013-04-05 19:05:21.932644
78	7	ca		2013-04-05 19:27:48.538638	2013-04-05 19:27:48.544059
80	10	ca		2013-04-05 19:27:48.570916	2013-04-05 19:27:48.575773
83	111	ca	<p>foto: joanseculi.com</p>\r\n	2013-09-05 14:59:30.622685	2013-09-05 14:59:30.622685
98	126	ca		2013-12-06 12:49:22.472573	2013-12-06 12:49:22.472573
99	127	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:23.338676	2013-12-06 12:49:23.338676
100	128	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:23.925633	2013-12-06 12:49:23.925633
101	129	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:25.116646	2013-12-06 12:49:25.116646
102	130	ca	<p>Foto: Clara Bes</p>\r\n	2013-12-06 12:49:25.74365	2013-12-06 12:49:25.74365
103	131	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:26.404582	2013-12-06 12:49:26.404582
104	132	ca	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2013-12-06 12:49:27.244018	2013-12-06 12:49:27.244018
105	133	ca		2013-12-06 13:07:19.849116	2013-12-06 13:07:19.849116
106	134	ca		2013-12-06 13:20:53.597357	2013-12-06 13:20:53.597357
107	135	ca		2013-12-06 13:20:54.378139	2013-12-06 13:20:54.378139
108	136	ca		2013-12-06 13:20:55.184772	2013-12-06 13:20:55.184772
109	137	ca		2013-12-06 13:20:55.937511	2013-12-06 13:20:55.937511
110	138	ca		2013-12-06 13:20:56.970833	2013-12-06 13:20:56.970833
111	139	ca	<p>Obra d&#39;Al&egrave;xia Lleonart</p>\r\n	2013-12-06 13:20:58.334266	2013-12-06 13:20:58.334266
112	140	en	<p>Foto: Denys Blacker</p>\r\n	2014-05-17 12:13:07.545548	2014-05-17 12:13:07.545548
113	141	en		2014-05-17 12:13:08.50649	2014-05-17 12:13:08.50649
114	142	en		2014-05-17 12:13:09.277266	2014-05-17 12:13:09.277266
115	143	en		2014-05-17 12:13:10.114932	2014-05-17 12:13:10.114932
116	144	en		2014-05-17 12:13:10.925149	2014-05-17 12:13:10.925149
117	145	en		2014-05-17 12:13:11.911141	2014-05-17 12:13:11.911141
118	146	en		2014-05-17 12:13:11.936151	2014-05-17 12:13:11.936151
119	134	en		2014-05-17 12:17:29.356949	2014-05-17 12:17:29.364292
120	135	en		2014-05-17 12:17:29.37948	2014-05-17 12:17:29.385582
121	136	en		2014-05-17 12:17:29.398772	2014-05-17 12:17:29.404773
122	137	en		2014-05-17 12:17:29.419569	2014-05-17 12:17:29.425961
123	138	en		2014-05-17 12:17:29.440159	2014-05-17 12:17:29.44618
124	139	en	<p>Obra d&#39;Al&egrave;xia Lleonart</p>\r\n	2014-05-17 12:17:29.460916	2014-05-17 12:17:29.467502
125	126	en		2014-05-17 12:23:53.945801	2014-05-17 12:23:53.949501
126	127	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.957268	2014-05-17 12:23:53.960853
127	128	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:53.968594	2014-05-17 12:23:53.972016
128	129	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.979935	2014-05-17 12:23:53.983667
129	130	en	<p>Foto: Clara Bes</p>\r\n	2014-05-17 12:23:53.991611	2014-05-17 12:23:53.995199
130	131	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:54.003199	2014-05-17 12:23:54.006784
131	132	en	<p>Foto: Alessia Bombaci/Antic Teatre</p>\r\n	2014-05-17 12:23:54.014716	2014-05-17 12:23:54.018469
132	147	ca	<p>Foto Denys Blacker</p>\r\n	2014-05-17 12:35:47.252457	2014-05-17 12:35:47.252457
133	148	ca		2014-05-17 12:35:48.051235	2014-05-17 12:35:48.051235
134	149	ca		2014-05-17 12:35:48.92786	2014-05-17 12:35:48.92786
135	150	ca		2014-05-17 12:35:49.767656	2014-05-17 12:35:49.767656
136	151	ca		2014-05-17 12:35:50.624654	2014-05-17 12:35:50.624654
137	152	ca		2014-05-17 12:35:51.294653	2014-05-17 12:35:51.294653
141	156	ca		2014-07-17 22:28:50.922947	2014-07-17 22:28:50.922947
142	157	ca		2014-07-17 22:28:51.985195	2014-07-17 22:28:51.985195
143	158	ca		2014-07-17 22:28:53.203591	2014-07-17 22:28:53.203591
144	159	ca		2014-07-17 22:28:54.328467	2014-07-17 22:28:54.328467
145	160	ca		2014-07-17 22:28:55.482629	2014-07-17 22:28:55.482629
146	161	ca		2014-07-17 22:28:56.862482	2014-07-17 22:28:56.862482
147	162	ca		2014-07-17 22:55:51.038902	2014-07-17 22:55:51.038902
148	163	ca		2014-07-17 22:55:51.989218	2014-07-17 22:55:51.989218
149	164	ca		2014-07-17 22:55:52.968738	2014-07-17 22:55:52.968738
150	165	ca		2014-07-17 22:55:53.949513	2014-07-17 22:55:53.949513
152	167	ca		2014-10-09 17:19:05.707861	2014-10-09 17:19:05.707861
153	168	ca		2014-10-09 17:19:06.915328	2014-10-09 17:19:06.915328
154	169	ca	<p>fotos: Denys Blacker</p>\r\n	2014-11-03 23:21:44.13056	2014-11-03 23:26:01.578464
155	170	ca		2014-11-03 23:26:02.796285	2014-11-03 23:26:02.796285
156	171	ca		2014-11-03 23:26:03.627676	2014-11-03 23:26:03.627676
157	172	ca		2014-11-03 23:26:04.409901	2014-11-03 23:26:04.409901
158	173	ca		2014-11-03 23:26:05.258961	2014-11-03 23:26:05.258961
159	174	ca		2014-11-03 23:26:06.012967	2014-11-03 23:26:06.012967
160	175	ca		2014-11-03 23:26:06.685567	2014-11-03 23:26:06.685567
161	176	ca		2014-11-03 23:26:07.308865	2014-11-03 23:26:07.308865
162	177	ca		2014-11-03 23:26:07.939509	2014-11-03 23:26:07.939509
163	178	ca	<p>Fotos: Ester Xargay</p>\r\n	2015-01-04 22:05:04.77481	2015-01-04 22:05:04.77481
164	179	ca		2015-01-04 22:05:10.608461	2015-01-04 22:05:10.608461
165	180	ca		2015-01-04 22:05:11.551306	2015-01-04 22:05:11.551306
166	181	ca		2015-01-04 22:05:12.497044	2015-01-04 22:05:12.497044
167	182	ca		2015-01-04 22:05:18.46191	2015-01-04 22:05:18.46191
169	184	ca		2015-01-04 22:05:20.255541	2015-01-04 22:05:20.255541
168	183	ca	<p>Foto: Ester Xargay</p>\r\n\r\n<p>Daniel Ruiz Trillo llegint els seus poemes</p>\r\n	2015-01-04 22:05:19.532489	2015-01-04 22:13:33.93083
170	185	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:32.88948	2015-01-04 23:00:32.88948
171	186	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:33.727122	2015-01-04 23:00:33.727122
172	187	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:34.431416	2015-01-04 23:00:34.431416
173	188	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:35.09108	2015-01-04 23:00:35.09108
174	189	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:35.774428	2015-01-04 23:00:35.774428
175	190	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:41.444479	2015-01-04 23:00:41.444479
176	191	ca		2015-01-04 23:00:42.024554	2015-01-04 23:00:42.024554
177	192	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:42.660426	2015-01-04 23:00:42.660426
178	193	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:43.305073	2015-01-04 23:00:43.305073
179	194	ca	<p>Foto: Denys Blacker</p>\r\n	2015-01-04 23:00:44.054188	2015-01-04 23:00:44.054188
180	195	ca		2015-01-04 23:21:24.472063	2015-01-04 23:21:24.472063
181	196	ca	<p>Disseny: Gresolart</p>\r\n	2015-01-04 23:23:54.79231	2015-01-04 23:23:54.79231
182	197	ca		2015-01-05 00:13:34.149345	2015-01-05 00:13:34.149345
183	198	ca		2015-01-05 00:13:35.084723	2015-01-05 00:13:35.084723
184	199	ca		2015-01-05 00:13:36.051611	2015-01-05 00:13:36.051611
185	200	ca		2015-01-05 00:13:36.910533	2015-01-05 00:13:36.910533
186	201	ca		2015-01-05 00:13:38.005427	2015-01-05 00:13:38.005427
189	204	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:34.09844	2015-07-03 00:07:34.09844
190	205	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:34.96651	2015-07-03 00:07:34.96651
191	206	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:35.577034	2015-07-03 00:07:35.577034
192	207	ca		2015-07-03 00:07:36.111749	2015-07-03 00:07:36.111749
193	208	ca	<p>Foto: Denys Blacker</p>\r\n	2015-07-03 00:07:36.740027	2015-07-03 00:07:36.740027
195	210	ca		2015-07-03 00:10:52.880635	2015-07-03 00:10:52.880635
196	211	ca		2015-09-25 01:15:08.359711	2015-09-25 01:15:08.359711
197	212	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:21.952505	2015-09-27 22:40:21.952505
198	213	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:22.51113	2015-09-27 22:40:22.51113
199	214	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:23.067588	2015-09-27 22:40:23.067588
200	215	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:23.600871	2015-09-27 22:40:23.600871
201	216	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:24.16094	2015-09-27 22:40:24.16094
202	217	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:24.778186	2015-09-27 22:40:24.778186
203	218	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:25.313501	2015-09-27 22:40:25.313501
204	219	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:25.959638	2015-09-27 22:40:25.959638
205	220	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:26.52988	2015-09-27 22:40:26.52988
206	221	ca	<p>Photo: Uma Bunnag</p>\r\n	2015-09-27 22:40:27.14124	2015-09-27 22:40:27.14124
207	222	ca		2015-09-27 23:03:08.950145	2015-09-27 23:03:08.950145
208	223	ca		2015-09-27 23:03:09.721873	2015-09-27 23:03:09.721873
209	224	ca		2015-09-27 23:03:10.288396	2015-09-27 23:03:10.288396
210	225	ca		2015-09-27 23:03:10.9719	2015-09-27 23:03:10.9719
211	226	ca		2015-09-27 23:03:11.704206	2015-09-27 23:03:11.704206
212	227	ca		2015-09-27 23:03:12.58407	2015-09-27 23:03:12.58407
213	228	ca		2015-09-27 23:03:13.351594	2015-09-27 23:03:13.351594
214	28	ca		2015-09-27 23:08:19.097038	2015-09-27 23:08:19.10365
215	229	ca		2015-09-27 23:08:19.121659	2015-09-27 23:08:19.121659
216	230	ca		2015-09-27 23:08:19.737243	2015-09-27 23:08:19.737243
217	231	ca		2015-09-27 23:08:20.457516	2015-09-27 23:08:20.457516
218	232	ca		2015-09-27 23:08:21.145515	2015-09-27 23:08:21.145515
219	233	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:37.820027	2016-08-01 15:36:37.820027
220	234	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:38.500456	2016-08-01 15:36:38.500456
221	235	ca		2016-08-01 15:36:39.119765	2016-08-01 15:36:39.119765
222	236	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:39.728025	2016-08-01 15:36:39.728025
223	237	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:40.46312	2016-08-01 15:36:40.46312
224	238	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:41.16031	2016-08-01 15:36:41.16031
225	239	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:41.764567	2016-08-01 15:36:41.764567
226	240	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:42.530957	2016-08-01 15:36:42.530957
227	241	ca	<p>Foto: Denys Blacker</p>\r\n	2016-08-01 15:36:43.078989	2016-08-01 15:36:43.078989
228	242	ca		2016-08-01 15:36:43.619063	2016-08-01 15:36:43.619063
229	243	ca	<p>Foto: Mar Seriny&agrave;</p>\r\n	2016-08-01 15:46:03.265936	2016-08-01 15:46:03.265936
230	244	ca	<p>Foto: Mar Seriny&agrave;</p>\r\n	2016-08-01 15:46:03.951746	2016-08-01 15:46:03.951746
241	255	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:23.612242	2016-08-01 16:58:23.612242
242	256	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:24.300187	2016-08-01 16:58:24.300187
243	257	ca	<p>Foto Ferran Blancafort</p>\r\n	2016-08-01 16:58:24.847781	2016-08-01 16:58:24.847781
244	258	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:25.438521	2016-08-01 16:58:25.438521
245	259	ca	<p>Foto Denys Blacker</p>\r\n	2016-08-01 16:58:26.040634	2016-08-01 16:58:26.040634
246	260	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:51.79637	2016-08-01 17:43:51.79637
247	261	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:52.572589	2016-08-01 17:43:52.572589
248	262	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:53.105058	2016-08-01 17:43:53.105058
249	263	ca	<p>Foto Joan Casellas</p>\r\n	2016-08-01 17:43:53.876661	2016-08-01 17:43:53.876661
250	264	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:54.799879	2016-08-01 17:43:54.799879
251	265	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:55.422266	2016-08-01 17:43:55.422266
252	266	ca	<p>Foto: Sachiyo Kaneko</p>\r\n	2016-08-01 17:43:55.971456	2016-08-01 17:43:55.971456
253	267	ca		2016-08-01 17:43:56.517073	2016-08-01 17:43:56.517073
231	245	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:28.234163	2016-08-05 11:37:54.952968
232	246	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:29.25837	2016-08-05 11:37:54.965763
233	247	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:29.986679	2016-08-05 11:37:54.974984
234	248	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:30.591014	2016-08-05 11:37:54.984078
365	376	ca		2019-06-10 21:35:30.442716	2019-06-10 21:35:30.442716
366	377	ca		2019-06-10 21:35:31.163044	2019-06-10 21:35:31.163044
367	378	ca		2019-06-10 21:35:31.885154	2019-06-10 21:35:31.885154
368	379	ca		2019-06-10 21:35:32.532903	2019-06-10 21:35:32.532903
369	380	ca		2019-06-10 21:35:33.136901	2019-06-10 21:35:33.136901
370	381	ca		2019-06-10 21:53:33.131838	2019-06-10 21:53:33.131838
371	382	ca		2019-06-10 21:53:33.600858	2019-06-10 21:53:33.600858
372	383	ca		2019-06-10 21:53:34.247034	2019-06-10 21:53:34.247034
373	384	ca		2019-06-10 21:53:34.73458	2019-06-10 21:53:34.73458
375	386	ca		2019-06-10 21:53:35.79109	2019-06-10 21:53:35.79109
376	387	ca		2019-06-10 21:53:36.324155	2019-06-10 21:53:36.324155
377	388	ca		2019-06-10 21:53:36.82542	2019-06-10 21:53:36.82542
378	389	ca		2019-06-10 22:14:22.915555	2019-06-10 22:14:22.915555
379	390	ca		2019-06-10 22:14:23.399172	2019-06-10 22:14:23.399172
380	391	ca		2019-06-10 22:14:23.880505	2019-06-10 22:14:23.880505
235	249	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:31.278186	2016-08-05 11:37:54.993016
236	250	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:31.872979	2016-08-05 11:37:55.007692
237	251	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:32.506156	2016-08-05 11:37:55.017241
238	252	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:33.397761	2016-08-05 11:37:55.026378
239	253	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:33.955117	2016-08-05 11:37:55.035282
240	254	ca	<p>Foto: Cl&agrave;udia Serrahima</p>\r\n	2016-08-01 16:18:34.712323	2016-08-05 11:37:55.044761
254	268	ca	<p>Foto: Mireia Prat</p>\r\n	2016-08-05 11:55:25.390893	2016-08-05 11:55:25.390893
255	269	ca	<p>Foto: Mireia Prat</p>\r\n	2016-08-05 11:55:25.980632	2016-08-05 11:55:25.980632
256	270	ca		2016-08-05 11:55:26.733293	2016-08-05 11:55:26.733293
257	271	ca		2016-08-05 11:55:27.479787	2016-08-05 11:55:27.479787
258	272	ca		2016-08-05 11:55:28.187479	2016-08-05 11:55:28.187479
259	273	ca		2016-08-05 11:55:28.915152	2016-08-05 11:55:28.915152
260	274	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:27.458484	2016-10-19 22:54:27.458484
261	275	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:28.291439	2016-10-19 22:54:28.291439
262	276	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:28.991294	2016-10-19 22:54:28.991294
263	277	ca	<p>Foto: Denys Blacker</p>\r\n	2016-10-19 22:54:29.556653	2016-10-19 22:54:29.556653
264	278	ca		2017-02-19 20:39:16.158617	2017-02-19 20:39:16.158617
265	279	ca		2017-02-19 20:39:17.18229	2017-02-19 20:39:17.18229
266	280	ca		2017-02-19 20:39:17.862599	2017-02-19 20:39:17.862599
267	281	ca		2017-02-19 20:39:18.699521	2017-02-19 20:39:18.699521
268	282	ca	<p>Foto: Paco Justicia</p>\r\n\r\n<p>&nbsp;</p>\r\n	2017-02-19 23:46:47.270032	2017-02-19 23:46:47.270032
269	283	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:00.459755	2017-06-01 22:46:00.459755
270	284	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:01.701325	2017-06-01 22:46:01.701325
271	285	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:02.799746	2017-06-01 22:46:02.799746
272	286	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:03.495576	2017-06-01 22:46:03.495576
273	287	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:04.369825	2017-06-01 22:46:04.369825
274	288	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:05.069345	2017-06-01 22:46:05.069345
275	289	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:05.861139	2017-06-01 22:46:05.861139
276	290	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:06.743032	2017-06-01 22:46:06.743032
277	291	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:07.457008	2017-06-01 22:46:07.457008
278	292	ca	<p>foto: Rosa Ballarin</p>\r\n	2017-06-01 22:46:08.301127	2017-06-01 22:46:08.301127
279	293	ca	<p>Foto: Arto Polus</p>\r\n	2017-06-01 23:00:44.575379	2017-06-01 23:00:44.575379
280	294	ca	<p>Foto: Vanessa Massons</p>\r\n	2017-06-01 23:32:59.023229	2017-06-01 23:32:59.023229
281	295	ca		2017-06-01 23:32:59.705635	2017-06-01 23:32:59.705635
282	296	ca		2017-06-01 23:33:00.465759	2017-06-01 23:33:00.465759
283	297	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:30.344031	2017-06-02 00:01:30.344031
284	298	ca	<p>Foto: Josep Sou</p>\r\n	2017-06-02 00:01:31.267357	2017-06-02 00:01:31.267357
285	299	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:31.940296	2017-06-02 00:01:31.940296
286	300	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:01:32.579708	2017-06-02 00:01:32.579708
287	301	ca		2017-06-02 00:01:33.326173	2017-06-02 00:01:33.326173
288	302	ca		2017-06-02 00:41:09.713163	2017-06-02 00:41:09.713163
289	303	ca		2017-06-02 00:41:10.567958	2017-06-02 00:41:10.567958
290	304	ca		2017-06-02 00:41:11.321952	2017-06-02 00:41:11.321952
291	305	ca		2017-06-02 00:41:12.094887	2017-06-02 00:41:12.094887
292	306	ca		2017-06-02 00:41:12.834172	2017-06-02 00:41:12.834172
293	307	ca		2017-06-02 00:41:13.641721	2017-06-02 00:41:13.641721
294	308	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:05.5543	2017-06-02 00:58:05.5543
295	309	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:06.37942	2017-06-02 00:58:06.37942
296	310	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:07.237012	2017-06-02 00:58:07.237012
297	311	ca	<p>Foto: Paco Justicia</p>\r\n	2017-06-02 00:58:08.001468	2017-06-02 00:58:08.001468
298	312	ca	<p>Foto: Bel&eacute;n Herrero</p>\r\n	2017-06-02 01:10:47.013615	2017-06-02 01:10:47.013615
299	313	ca		2018-08-22 21:50:17.054423	2018-08-22 21:50:17.054423
300	314	ca	<p>Foto Sara Ruiz</p>\r\n	2018-12-21 20:09:56.211471	2018-12-21 20:09:56.211471
301	315	ca	<p>Foto: Sara Ruiz</p>\r\n	2018-12-21 20:09:56.744737	2018-12-21 20:09:56.744737
302	316	ca	<p>Foto: Sara Ruiz</p>\r\n	2018-12-21 20:09:57.984677	2018-12-21 20:09:57.984677
303	317	ca		2018-12-21 20:15:06.245606	2018-12-21 20:15:06.245606
305	319	ca		2018-12-21 20:19:42.213103	2018-12-21 20:19:42.213103
306	320	ca		2018-12-21 20:24:03.748832	2018-12-21 20:24:03.748832
307	321	ca		2018-12-21 20:56:13.148355	2018-12-21 20:56:13.148355
308	322	ca		2018-12-21 20:56:13.660639	2018-12-21 20:56:13.660639
309	323	ca		2018-12-21 20:56:14.162865	2018-12-21 20:56:14.162865
310	324	ca		2018-12-21 20:56:14.736708	2018-12-21 20:56:14.736708
311	325	ca		2018-12-21 20:56:15.468794	2018-12-21 20:56:15.468794
312	326	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:42.529081	2019-01-15 23:24:34.254446
313	327	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:43.256473	2019-01-15 23:24:34.263182
314	328	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:44.00409	2019-01-15 23:24:34.271021
341	355	ca	<p>cos cosit (despr&eacute;s de despreniment)</p>\r\n	2019-04-15 11:41:05.206609	2019-04-15 11:50:28.492195
316	330	ca	<p>Photo Denys Blacker</p>\r\n	2018-12-21 21:13:45.588724	2019-01-15 23:24:34.286766
320	334	ca	<p>Foto: Carme Ors</p>\r\n	2019-01-28 19:08:01.458934	2019-01-28 19:08:01.458934
321	335	ca		2019-01-28 20:12:16.010087	2019-01-28 20:12:16.010087
322	336	ca		2019-01-28 20:12:16.591677	2019-01-28 20:12:16.591677
323	337	ca		2019-01-28 20:12:17.057617	2019-01-28 20:12:17.057617
324	338	ca		2019-01-28 20:12:17.618237	2019-01-28 20:12:17.618237
325	339	ca		2019-01-28 20:12:18.116561	2019-01-28 20:12:18.116561
326	340	ca		2019-01-28 20:12:18.599796	2019-01-28 20:12:18.599796
327	341	ca		2019-01-28 20:12:19.203677	2019-01-28 20:12:19.203677
328	342	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:58.219751	2019-01-28 20:29:58.219751
329	343	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:58.693834	2019-01-28 20:29:58.693834
330	344	ca	<p>Foto: Aleix Vallverd&uacute;</p>\r\n	2019-01-28 20:29:59.210019	2019-01-28 20:29:59.210019
331	345	ca		2019-01-28 20:29:59.712509	2019-01-28 20:29:59.712509
332	346	ca	<p>Photo Denys Blacker</p>\r\n	2019-03-07 22:05:14.182424	2019-03-07 22:05:14.182424
334	348	ca		2019-04-15 10:49:23.945896	2019-04-15 10:49:23.945896
335	349	ca		2019-04-15 10:49:24.57954	2019-04-15 10:49:24.57954
336	350	ca		2019-04-15 10:49:25.121083	2019-04-15 10:49:25.121083
337	351	ca		2019-04-15 10:49:25.794009	2019-04-15 10:49:25.794009
338	352	ca	<p>riualles</p>\r\n	2019-04-15 11:41:03.242984	2019-04-15 11:50:28.467171
339	353	ca	<p>vimet(era)</p>\r\n	2019-04-15 11:41:03.913227	2019-04-15 11:50:28.475765
340	354	ca	<p>common</p>\r\n	2019-04-15 11:41:04.577711	2019-04-15 11:50:28.48404
342	356	ca	<p>sec(q)ualles</p>\r\n	2019-04-15 11:41:05.707814	2019-04-15 11:50:28.499995
343	357	ca	<p>funamb&ograve;lia</p>\r\n	2019-04-15 11:41:06.393635	2019-04-15 11:50:28.507906
344	358	ca	<p>cordada</p>\r\n	2019-04-15 11:41:07.001642	2019-04-15 11:50:28.515933
333	347	ca	<p>Exposici&oacute; col&middot;lectiva d&#39;escultures en pedra a la Biblioteca de Tei&agrave;</p>\r\n	2019-03-07 22:44:49.716905	2019-04-15 12:26:32.171035
345	359	ca		2019-04-15 12:26:32.184707	2019-04-15 12:26:32.184707
346	360	ca		2019-04-15 12:26:32.729244	2019-04-15 12:26:32.729244
347	4	ca		2019-06-10 20:19:22.406901	2019-06-10 20:19:22.411138
348	5	ca		2019-06-10 20:19:22.419072	2019-06-10 20:19:22.422962
349	6	ca		2019-06-10 20:19:22.430648	2019-06-10 20:19:22.434803
350	361	ca		2019-06-10 20:41:47.12282	2019-06-10 20:41:47.12282
351	362	ca		2019-06-10 20:41:47.583684	2019-06-10 20:41:47.583684
352	363	ca		2019-06-10 20:41:48.222389	2019-06-10 20:41:48.222389
353	364	ca		2019-06-10 20:41:48.747892	2019-06-10 20:41:48.747892
354	365	ca		2019-06-10 20:41:49.284754	2019-06-10 20:41:49.284754
355	366	ca		2019-06-10 20:41:50.067191	2019-06-10 20:41:50.067191
356	367	ca	<p>obra de Lesley Yendell</p>\r\n	2019-06-10 20:41:50.655737	2019-06-10 20:41:50.655737
357	368	ca		2019-06-10 21:02:37.539829	2019-06-10 21:02:37.539829
358	369	ca		2019-06-10 21:02:38.177322	2019-06-10 21:02:38.177322
359	370	ca		2019-06-10 21:02:38.649351	2019-06-10 21:02:38.649351
360	371	ca	<p>Foto: Marta Carret&eacute;</p>\r\n	2019-06-10 21:35:27.180994	2019-06-10 21:35:27.180994
361	372	ca		2019-06-10 21:35:27.866121	2019-06-10 21:35:27.866121
362	373	ca		2019-06-10 21:35:28.542191	2019-06-10 21:35:28.542191
363	374	ca		2019-06-10 21:35:29.181255	2019-06-10 21:35:29.181255
364	375	ca	<p>Foto Marta Carret&eacute;</p>\r\n	2019-06-10 21:35:29.834767	2019-06-10 21:35:29.834767
381	392	ca		2019-06-10 22:26:49.599318	2019-06-10 22:26:49.599318
383	394	ca		2019-06-10 22:26:51.033515	2019-06-10 22:26:51.033515
384	395	ca		2019-06-10 22:26:51.820519	2019-06-10 22:26:51.820519
385	396	ca		2019-06-10 22:26:52.468495	2019-06-10 22:26:52.468495
386	397	ca		2019-06-10 22:26:59.327431	2019-06-10 22:26:59.327431
387	398	ca		2019-06-10 22:27:00.131066	2019-06-10 22:27:00.131066
388	399	ca		2019-06-10 22:27:00.879744	2019-06-10 22:27:00.879744
389	400	ca		2019-06-10 22:27:01.580744	2019-06-10 22:27:01.580744
390	401	ca		2019-06-10 22:27:02.118461	2019-06-10 22:27:02.118461
397	46	ca		2020-06-15 15:36:58.160298	2020-06-15 15:36:58.164829
398	47	ca		2020-06-15 15:36:58.172601	2020-06-15 15:36:58.176649
399	48	ca		2020-06-15 15:36:58.184168	2020-06-15 15:36:58.188926
400	49	ca		2020-06-15 15:36:58.197373	2020-06-15 15:36:58.201216
401	50	ca		2020-06-15 15:36:58.20914	2020-06-15 15:36:58.213194
402	51	ca		2020-06-15 15:36:58.220875	2020-06-15 15:36:58.225056
403	52	ca		2020-06-15 15:36:58.234374	2020-06-15 15:36:58.238575
412	416	ca		2020-10-14 22:48:42.560953	2020-10-14 22:48:42.560953
413	417	ca		2020-10-14 22:48:43.208685	2020-10-14 22:48:43.208685
414	418	ca		2020-10-14 22:48:43.807353	2020-10-14 22:48:43.807353
415	419	ca		2020-10-14 22:48:44.425075	2020-10-14 22:48:44.425075
416	420	ca		2020-10-14 22:48:45.023792	2020-10-14 22:48:45.023792
417	421	ca		2020-10-14 22:48:45.668882	2020-10-14 22:48:45.668882
418	422	ca		2020-10-14 22:48:46.137182	2020-10-14 22:48:46.137182
419	423	ca		2020-10-14 22:48:46.761108	2020-10-14 22:48:46.761108
420	424	ca		2020-10-14 23:00:12.409923	2020-10-14 23:00:12.409923
421	425	ca		2020-10-14 23:00:13.012617	2020-10-14 23:00:13.012617
422	426	ca		2020-10-14 23:00:13.692617	2020-10-14 23:00:13.692617
423	427	ca		2020-10-14 23:00:14.387215	2020-10-14 23:00:14.387215
424	428	ca		2021-01-04 20:46:03.91017	2021-01-04 20:46:03.91017
425	429	ca		2021-01-04 20:46:04.677588	2021-01-04 20:46:04.677588
426	430	ca		2021-01-04 20:46:05.237659	2021-01-04 20:46:05.237659
427	431	ca		2021-01-04 20:46:05.983006	2021-01-04 20:46:05.983006
428	432	ca		2021-01-04 20:46:06.630703	2021-01-04 20:46:06.630703
429	433	ca		2021-01-04 20:46:07.427481	2021-01-04 20:46:07.427481
430	434	ca		2021-01-04 20:46:08.228776	2021-01-04 20:46:08.228776
431	435	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:00.124273	2021-04-08 21:31:00.124273
432	436	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:00.775496	2021-04-08 21:31:00.775496
433	437	ca	<p>Foto: Goretti Estengre</p>\r\n	2021-04-08 21:31:01.486446	2021-04-08 21:31:01.486446
434	438	ca	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-04-08 21:31:02.112839	2021-04-08 21:31:02.112839
435	439	ca	<p>Foto: Goretti Estengre</p>\r\n	2021-04-08 21:31:02.746529	2021-04-08 21:31:02.746529
436	440	ca		2021-04-08 21:31:03.300897	2021-04-08 21:31:03.300897
437	441	ca	<p>Foto Joana de Querol</p>\r\n	2021-08-31 23:06:53.612968	2021-08-31 23:06:53.612968
438	442	ca	<p>Foto: Joana de Querol</p>\r\n	2021-08-31 23:06:54.504348	2021-08-31 23:06:54.504348
439	443	ca		2021-08-31 23:06:55.459595	2021-08-31 23:06:55.459595
440	444	ca		2021-08-31 23:06:56.222977	2021-08-31 23:06:56.222977
441	445	es	<p>foto: Isa Fontbona</p>\r\n	2021-09-13 17:24:30.667981	2021-09-13 17:24:30.667981
442	446	es		2021-09-13 17:24:31.596343	2021-09-13 17:24:31.596343
443	447	es		2021-09-13 17:24:32.501255	2021-09-13 17:24:32.501255
444	448	es		2021-09-13 17:24:33.389151	2021-09-13 17:24:33.389151
445	449	ca		2021-09-20 20:07:20.2924	2021-09-20 20:07:20.2924
446	450	ca		2021-09-20 20:07:21.242877	2021-09-20 20:07:21.242877
447	451	ca		2021-09-20 20:07:22.113679	2021-09-20 20:07:22.113679
448	452	ca		2021-09-20 20:07:23.0003	2021-09-20 20:07:23.0003
449	453	ca		2021-09-20 20:07:23.816535	2021-09-20 20:07:23.816535
450	454	ca		2021-09-20 20:07:24.771148	2021-09-20 20:07:24.771148
451	455	ca		2021-09-20 20:07:25.721668	2021-09-20 20:07:25.721668
452	456	ca		2021-09-20 20:07:26.609899	2021-09-20 20:07:26.609899
457	449	en		2021-09-20 20:36:36.302366	2021-09-20 20:36:36.305016
458	450	en		2021-09-20 20:36:36.310557	2021-09-20 20:36:36.313082
459	451	en		2021-09-20 20:36:36.318373	2021-09-20 20:36:36.320831
460	452	en		2021-09-20 20:36:36.326187	2021-09-20 20:36:36.328582
461	453	en		2021-09-20 20:36:36.33406	2021-09-20 20:36:36.3366
462	454	en		2021-09-20 20:36:36.342143	2021-09-20 20:36:36.344787
463	455	en		2021-09-20 20:36:36.350133	2021-09-20 20:36:36.352642
464	456	en		2021-09-20 20:36:36.358641	2021-09-20 20:36:36.414064
468	445	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.727569	2021-09-26 16:57:03.730491
469	446	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.736926	2021-09-26 16:57:03.739363
470	447	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.74578	2021-09-26 16:57:03.748472
471	448	en	<p>Foto: Isa Fontbona</p>\r\n	2021-09-26 16:57:03.754825	2021-09-26 16:57:03.75745
477	465	es		2021-09-26 20:13:56.486011	2021-09-26 20:13:56.486011
478	435	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.218702	2021-09-26 20:50:13.221277
479	436	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.226534	2021-09-26 20:50:13.228843
480	437	es	<p>Foto: Goretti Estengre</p>\r\n	2021-09-26 20:50:13.234183	2021-09-26 20:50:13.236402
481	438	es	<p>Foto: Adolf Alca&ntilde;iz</p>\r\n	2021-09-26 20:50:13.241298	2021-09-26 20:50:13.243488
482	439	es	<p>Foto: Goretti Estengre</p>\r\n	2021-09-26 20:50:13.248492	2021-09-26 20:50:13.250808
483	440	es		2021-09-26 20:50:13.255732	2021-09-26 20:50:13.257983
484	466	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:25.454033	2021-11-19 20:22:18.074148
485	467	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:26.074459	2021-11-19 20:22:18.079845
486	468	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:26.516549	2021-11-19 20:22:18.085277
487	469	ca	<p>Mireia Zantop</p>\r\n\r\n<p><strong>Atadalasalas</strong></p>\r\n	2021-11-19 20:17:27.050408	2021-11-19 20:22:18.090596
488	470	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:27.629663	2021-11-19 20:22:18.095956
489	471	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:28.163345	2021-11-19 20:22:18.101395
490	472	ca	<p>Mireia Zantop</p>\r\n	2021-11-19 20:17:28.736207	2021-11-19 20:22:18.106649
491	456	es		2021-11-19 21:41:37.061825	2021-11-19 21:41:37.064418
492	450	es		2021-11-19 21:41:37.070934	2021-11-19 21:41:37.073318
493	449	es		2021-11-19 21:41:37.078994	2021-11-19 21:41:37.08134
494	452	es		2021-11-19 21:41:37.087615	2021-11-19 21:41:37.089893
495	451	es		2021-11-19 21:41:37.095653	2021-11-19 21:41:37.098037
496	453	es		2021-11-19 21:41:37.104133	2021-11-19 21:41:37.106465
497	454	es		2021-11-19 21:41:37.112247	2021-11-19 21:41:37.114618
498	455	es		2021-11-19 21:41:37.120331	2021-11-19 21:41:37.122705
499	465	en		2021-11-19 22:01:54.676131	2021-11-19 22:01:54.678764
500	466	en	<p>O.dumonde</p>\r\n	2021-11-20 13:37:15.547602	2021-11-20 13:37:15.550153
501	467	en	<p>(des)equilibris</p>\r\n	2021-11-20 13:37:15.555451	2021-11-20 13:37:15.557849
502	468	en	<p>(s)omni</p>\r\n	2021-11-20 13:37:15.563016	2021-11-20 13:37:15.565394
503	469	en	<p>&nbsp;</p>\r\n\r\n<p><strong>Atadalasalas</strong></p>\r\n	2021-11-20 13:37:15.57063	2021-11-20 13:37:15.573115
504	470	en	<p>Acord</p>\r\n	2021-11-20 13:37:15.578398	2021-11-20 13:37:15.580837
505	471	en	<p>piet&agrave;</p>\r\n	2021-11-20 13:37:15.586266	2021-11-20 13:37:15.588625
506	472	en	<p>coeurage</p>\r\n	2021-11-20 13:37:15.593913	2021-11-20 13:37:15.596232
507	466	es	<p>O.dumonde</p>\r\n	2021-11-20 13:40:05.673763	2021-11-20 13:40:05.677113
508	467	es	<p>(des)equilibrio</p>\r\n	2021-11-20 13:40:05.684365	2021-11-20 13:40:05.687319
509	468	es	<p>sue&ntilde;o, senza tempo</p>\r\n	2021-11-20 13:40:05.69437	2021-11-20 13:40:05.697238
514	416	es		2022-01-05 20:06:46.188026	2022-01-05 20:06:46.190922
512	471	es	<p>piet&aacute;</p>\r\n	2021-11-20 13:40:05.719224	2021-11-20 13:40:05.721576
513	472	es	<p>coeurage</p>\r\n	2021-11-20 13:40:05.727438	2021-11-20 13:40:05.729795
510	469	es	<p>Atadalasalas</p>\r\n	2021-11-20 13:40:05.703171	2022-01-05 20:02:40.452642
511	470	es	<p>acuerdo</p>\r\n	2021-11-20 13:40:05.711137	2022-01-05 20:02:40.460228
515	417	es		2022-01-05 20:06:46.19643	2022-01-05 20:06:46.198951
516	422	es		2022-01-05 20:06:46.204415	2022-01-05 20:06:46.207016
517	419	es		2022-01-05 20:06:46.212479	2022-01-05 20:06:46.215405
453	445	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.760246	2022-01-13 20:54:16.097923
454	446	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.769738	2022-01-13 20:54:16.105076
518	418	es		2022-01-05 20:06:46.220995	2022-01-05 20:06:46.223913
519	420	es		2022-01-05 20:06:46.229424	2022-01-05 20:06:46.231897
520	423	es		2022-01-05 20:06:46.237731	2022-01-05 20:06:46.240282
521	421	es		2022-01-05 20:06:46.245909	2022-01-05 20:06:46.248338
522	27	es		2022-01-05 20:10:05.539924	2022-01-05 20:10:05.54259
523	347	es	<p>Exposici&oacute;n colectiva de escultura en piedra en la Biblioteca de Tei&agrave;</p>\r\n	2022-01-05 20:21:12.646895	2022-01-05 20:21:12.649501
524	359	es		2022-01-05 20:21:12.654907	2022-01-05 20:21:12.657387
525	360	es		2022-01-05 20:21:12.66281	2022-01-05 20:21:12.665308
526	381	es		2022-01-05 20:25:20.118371	2022-01-05 20:25:20.120746
527	384	es		2022-01-05 20:25:20.125917	2022-01-05 20:25:20.128229
528	386	es		2022-01-05 20:25:20.133599	2022-01-05 20:25:20.135961
529	383	es		2022-01-05 20:25:20.141262	2022-01-05 20:25:20.143641
530	387	es		2022-01-05 20:25:20.149012	2022-01-05 20:25:20.151508
531	388	es		2022-01-05 20:25:20.15673	2022-01-05 20:25:20.1591
532	382	es		2022-01-05 20:25:20.164499	2022-01-05 20:25:20.167113
533	361	es		2022-01-05 20:33:12.92409	2022-01-05 20:33:12.926651
534	368	es	<p>zarzAmores</p>\r\n	2022-01-05 20:33:12.932027	2022-01-05 20:33:12.934431
536	364	es		2022-01-05 20:33:12.947359	2022-01-05 20:33:12.949771
537	362	es		2022-01-05 20:33:12.954922	2022-01-05 20:33:12.957269
538	369	es	<p>Orchid&eacute;e (instalaci&oacute;n y serie Orgasmo)<br />\r\n&nbsp;</p>\r\n	2022-01-05 20:33:12.962424	2022-01-05 20:33:12.964823
539	370	es	<p>Ave del para&iacute;so (instalaci&oacute;n y serie Orgasmo)<br />\r\n&nbsp;</p>\r\n	2022-01-05 20:33:12.970106	2022-01-05 20:33:12.972389
540	365	es		2022-01-05 20:33:12.977534	2022-01-05 20:33:12.979924
541	367	es	<p>obra de Lesley Yendell</p>\r\n	2022-01-05 20:33:12.985111	2022-01-05 20:33:12.987432
542	366	es		2022-01-05 20:33:12.992635	2022-01-05 20:33:12.99497
535	363	es	<p>funambulista</p>\r\n	2022-01-05 20:33:12.939812	2022-01-05 20:50:40.827581
543	348	es		2022-01-05 21:06:26.048477	2022-01-05 21:06:26.051428
544	349	es		2022-01-05 21:06:26.058464	2022-01-05 21:06:26.061208
545	350	es		2022-01-05 21:06:26.067748	2022-01-05 21:06:26.070485
546	351	es		2022-01-05 21:06:26.07815	2022-01-05 21:06:26.081669
547	313	es		2022-01-05 21:12:29.902855	2022-01-05 21:12:29.905435
548	320	es		2022-01-05 21:12:29.910697	2022-01-05 21:12:29.912957
549	321	es		2022-01-05 21:12:29.918063	2022-01-05 21:12:29.920247
550	322	es		2022-01-05 21:12:29.925307	2022-01-05 21:12:29.927565
551	323	es		2022-01-05 21:12:29.93246	2022-01-05 21:12:29.934783
552	324	es		2022-01-05 21:12:29.939741	2022-01-05 21:12:29.942122
553	325	es		2022-01-05 21:12:29.947206	2022-01-05 21:12:29.949551
554	302	es		2022-01-05 21:18:23.140844	2022-01-05 21:18:23.143509
555	303	es		2022-01-05 21:18:23.149207	2022-01-05 21:18:23.151652
556	304	es		2022-01-05 21:18:23.157304	2022-01-05 21:18:23.159773
557	305	es		2022-01-05 21:18:23.165285	2022-01-05 21:18:23.167828
558	306	es		2022-01-05 21:18:23.173316	2022-01-05 21:18:23.175775
559	307	es		2022-01-05 21:18:23.181134	2022-01-05 21:18:23.183648
560	197	es		2022-01-05 21:31:18.902416	2022-01-05 21:31:18.904992
561	198	es		2022-01-05 21:31:18.910277	2022-01-05 21:31:18.912582
562	199	es		2022-01-05 21:31:18.917636	2022-01-05 21:31:18.91995
563	200	es		2022-01-05 21:31:18.927071	2022-01-05 21:31:18.929481
564	201	es		2022-01-05 21:31:18.935256	2022-01-05 21:31:18.938487
565	352	es	<p>riualles</p>\r\n	2022-01-05 21:43:08.610592	2022-01-05 21:43:08.613104
566	353	es	<p>vimet(era)</p>\r\n	2022-01-05 21:43:08.618158	2022-01-05 21:43:08.620502
567	354	es	<p>common</p>\r\n	2022-01-05 21:43:08.625528	2022-01-05 21:43:08.62776
568	355	es	<p>cos cosit (despr&eacute;s de despreniment)</p>\r\n	2022-01-05 21:43:08.632929	2022-01-05 21:43:08.635311
569	356	es	<p>sec(q)ualles</p>\r\n	2022-01-05 21:43:08.640372	2022-01-05 21:43:08.642695
570	357	es	<p>funamb&ograve;lia</p>\r\n	2022-01-05 21:43:08.647628	2022-01-05 21:43:08.649999
571	358	es	<p>cordada</p>\r\n	2022-01-05 21:43:08.655081	2022-01-05 21:43:08.657392
572	28	es		2022-01-05 21:50:21.083781	2022-01-05 21:50:21.086437
573	229	es		2022-01-05 21:50:21.092172	2022-01-05 21:50:21.09462
574	230	es		2022-01-05 21:50:21.099885	2022-01-05 21:50:21.102351
575	231	es		2022-01-05 21:50:21.107605	2022-01-05 21:50:21.110167
576	232	es		2022-01-05 21:50:21.115518	2022-01-05 21:50:21.118
577	373	es		2022-01-10 11:45:29.730879	2022-01-10 11:45:29.733597
578	371	es	<p>Foto: Marta Carret&eacute;</p>\r\n	2022-01-10 11:45:29.739264	2022-01-10 11:45:29.741773
579	372	es		2022-01-10 11:45:29.746952	2022-01-10 11:45:29.749334
580	374	es		2022-01-10 11:45:29.754502	2022-01-10 11:45:29.756898
581	375	es	<p>Foto Marta Carret&eacute;</p>\r\n	2022-01-10 11:45:29.762156	2022-01-10 11:45:29.76447
582	376	es		2022-01-10 11:45:29.769649	2022-01-10 11:45:29.771935
583	377	es		2022-01-10 11:45:29.777035	2022-01-10 11:45:29.779349
584	378	es		2022-01-10 11:45:29.784444	2022-01-10 11:45:29.786746
585	379	es		2022-01-10 11:45:29.791775	2022-01-10 11:45:29.794123
586	380	es		2022-01-10 11:45:29.799243	2022-01-10 11:45:29.801592
587	222	es		2022-01-10 11:49:05.974823	2022-01-10 11:49:05.977767
588	223	es		2022-01-10 11:49:05.983625	2022-01-10 11:49:05.986378
589	224	es		2022-01-10 11:49:05.992248	2022-01-10 11:49:05.994884
590	225	es		2022-01-10 11:49:06.00062	2022-01-10 11:49:06.003232
591	226	es		2022-01-10 11:49:06.009655	2022-01-10 11:49:06.012234
592	227	es		2022-01-10 11:49:06.017926	2022-01-10 11:49:06.020448
593	228	es		2022-01-10 11:49:06.026206	2022-01-10 11:49:06.028853
455	447	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.7782	2022-01-13 20:54:16.112025
456	448	ca	<p>Foto: Isa Fontbona</p>\r\n	2021-09-20 20:29:33.786852	2022-01-13 20:54:16.11917
594	465	ca	<p>Foto: Isa Fontbona</p>\r\n	2022-01-13 20:54:16.125583	2022-01-13 20:54:16.128236
\.


--
-- Data for Name: works; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.works (id, slug_en, slug_es, slug_ca, realization_date, dimensions, "position", type, created_at, updated_at, published, images_count) FROM stdin;
83	des-cuidar	des-cuidar	des-cuidar	2020-03-08	\N	66	ActionWork	2021-01-04 20:46:03.849595	2021-01-04 20:49:41.618875	f	7
78	thyllandsias	thyllandsias	thyllandsias	2019-02-14	petites	64	VisualWork	2020-02-14 21:53:45.784852	2020-10-14 23:00:12.393682	f	4
82	phoscenes	phoscenes	phoscenes	2020-09-20	15x20cm y 21x30cm	65	VisualWork	2020-09-21 08:55:36.118883	2022-01-05 20:07:42.746165	t	8
72	cap-cap	cap-cap	cap-cap	2019-04-10	4 x 2 x 2m cada cap	60	VisualWork	2019-04-10 23:03:30.93674	2022-01-05 21:06:26.043782	t	4
70	proces-in-solid	proces-in-solid	petraperta	2020-01-28		57	VisualWork	2019-01-28 21:07:00.386441	2020-09-20 21:15:52.229861	f	0
68	quid-de-la-questio	quid-de-la-questio	quid-de-la-questio	2018-08-18	\N	55	ActionWork	2018-08-22 15:29:30.538993	2020-09-20 20:50:24.952837	t	5
66	per-se	per-se	per-se	2018-06-15	\N	53	ActionWork	2018-08-22 15:12:28.262887	2020-09-20 20:50:24.991831	t	5
65	desig-per-z-ones	desig-per-z-ones	desig-per-z-ones	2018-06-28	\N	52	ActionWork	2018-08-22 15:06:01.745665	2020-09-20 20:50:25.025151	t	8
44	estona	estona	estona	2014-01-04	200m x 4h	34	VisualWork	2015-01-05 00:13:34.134193	2022-01-05 21:38:07.421219	t	5
67	ip-sum-id-est	ip-sum-id-est	ip-sum-id-est	2018-08-22	diàmetro: 35cm	54	VisualWork	2018-08-22 15:22:59.105854	2022-01-05 21:12:29.898868	t	7
71	entrar-sortint-sortir-entrant	entrar-saliendo-salir-entrando	entrar-sortint-sortir-entrant	2019-03-07	22 x 20 x 10 cm	58	VisualWork	2019-03-07 22:44:49.704275	2022-01-05 20:21:12.642688	t	3
73	trans-form-morf-i-vii	trans-form-morf-i-vii	trans-form-morf-i-vii	2018-04-15		59	VisualWork	2019-04-15 11:41:03.226797	2022-01-05 21:43:08.606615	t	7
81	s-o-gota-a-gota	s-o-gota-a-gota	gota-gota	2017-02-19	50 x 50 x 175cm	51	VisualWork	2020-02-19 17:54:40.91911	2020-09-20 21:21:00.647538	f	0
63	flux-u	flux-u	flux	2016-09-09	\N	50	ActionWork	2017-06-02 00:01:30.321383	2020-09-20 20:50:25.005059	t	5
62	donar-veu-i-veure-mes	donar-veu-i-veure-mes	donar-veu-i-veure-mes	2017-03-08	\N	49	ActionWork	2017-06-01 23:32:58.900866	2020-09-20 20:50:25.012495	t	12
57	tot-fluxus	tot-fluxus	flux-us	2016-09-17	\N	46	ActionWork	2016-10-19 22:59:40.404894	2020-09-20 20:50:24.893548	t	5
56	cromosomx	cromosomx	cromosomx	2016-10-01	\N	45	ActionWork	2016-10-19 22:54:27.41393	2020-09-20 20:50:24.881316	t	4
51	pomps-of-the-subsoil	pomps-of-the-subsoil	pomps-of-the-subsoil	2015-11-06	\N	43	ActionWork	2016-08-01 16:18:28.208002	2016-08-05 11:39:07.587787	t	10
54	donar-veu-al-desig	donar-veu-al-desig	donar-veu-al-desig	2015-12-12	\N	42	ActionWork	2016-08-01 17:50:44.208163	2020-09-20 20:50:25.018978	t	5
53	fluxus	fluxus	fluxus	2016-07-29	\N	41	ActionWork	2016-08-01 17:43:51.781812	2020-09-20 20:50:25.039552	t	8
52	eventuall	eventuall	eventuall	2015-07-31	\N	40	ActionWork	2016-08-01 16:58:23.594865	2016-08-01 16:59:31.49856	t	5
64	fluxus--2	fluxus--2	fluxus--2	2016-06-02	3 x 1 x 1,75m	44	VisualWork	2017-06-02 00:41:09.680582	2022-01-05 21:20:49.963678	t	6
55	donar-veu-fer-un-pas	donar-veu-fer-un-pas	donar-veu-i-fer-un-pas	2015-03-08	\N	39	ActionWork	2016-08-01 17:54:00.844746	2020-09-20 20:50:25.046377	t	6
49	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	sonet-i-tes-yeux-aux-bleux-aigus-d-acier-et-de-cristal	aux-bleux-aigus-d-acier-et-de-cristal--2	2015-01-27	\N	38	ActionWork	2016-08-01 15:46:03.101867	2016-08-01 17:00:18.671453	t	2
48	pes-pressio	pes-pressio	pes-pressio	2015-10-22	\N	37	ActionWork	2016-08-01 15:36:37.797864	2020-09-20 20:50:24.913002	t	10
47	elgrandtour	elgrandtour	elgrandtour	2015-08-27	\N	36	ActionWork	2015-09-27 22:40:21.937473	2015-09-27 22:42:43.6855	t	10
46	free-will-x-veure	free-will-x-veure	free-will-x-veure	2015-05-29	\N	35	ActionWork	2015-07-03 00:07:34.077024	2020-09-20 20:50:24.906908	t	6
43	esclau	esclau	esclau	2014-12-07	\N	33	ActionWork	2015-01-04 23:00:32.867555	2015-01-04 23:21:24.331086	t	11
42	d-accions-i-diccions	d-accions-i-diccions	d-accions-i-diccions	2014-10-12	\N	32	ActionWork	2015-01-04 22:05:04.756829	2015-01-04 22:13:33.864906	t	7
41	present-o-saltal-ara	present-o-saltal-ara	present-o-saltal-ara	2014-04-25	\N	31	ActionWork	2014-05-17 13:20:04.134108	2020-09-20 20:50:24.966677	t	9
38	ad-hoc-al-lloc	ad-hoc	ad-hoc	2014-05-17	de 5cm a 30m de diámetro	27	VisualWork	2014-05-17 12:58:01.573508	2022-01-10 11:49:05.968889	t	7
92	prints	obra-grafica	obra-grafica	2021-11-19		71	VisualWork	2021-11-19 20:17:25.43168	2022-01-05 20:02:40.427619	t	7
74	paisatge-liquid	paisaje-liquido	paisatge-liquid	2019-06-10	varias	61	VisualWork	2019-06-10 20:41:47.106447	2022-01-10 11:24:54.400521	t	10
87	over-and-over-again-and-again	over-and-over-again-and-again	over-and-over-again-and-again	2021-08-08	\N	69	ActionWork	2021-08-31 23:10:08.820784	2022-01-13 20:54:16.093342	t	5
85	i-o-torno-i-no-torno	si-i-o-no-torno-i-no-torno	si-i-o-no-torno-i-no-torno	2021-03-22	\N	68	ActionWork	2021-04-08 21:04:22.982108	2021-09-26 20:50:13.214682	t	6
84	entrelinies-8ple8buit	entrelinies-8ple8buit	entre-linies-8ple8buit-veure	2020-11-16	\N	67	ActionWork	2021-01-04 20:54:14.332123	2021-08-31 23:06:53.60256	t	4
69	ipse-ipsa-ipsum-em	ipse-ipsa-ipsum-em	ipse-ipsa-ipsum-em	2019-01-12	\N	56	ActionWork	2019-01-18 23:45:25.386543	2020-09-20 20:50:24.946269	t	4
61	we-were-waiting-for-you--2	we-were-waiting-for-you--2	we-were-waiting-for-you--2	2017-05-04	\N	48	ActionWork	2017-06-01 23:00:44.560054	2018-12-22 17:31:52.27902	t	1
59	idenditat	idenditat	idenditat	2017-04-29	\N	47	ActionWork	2017-06-01 22:46:00.441816	2020-09-20 20:50:24.959875	t	10
40	birds-ocells-al-cap	birds-ocells-al-cap	birds-ocells-al-cap	2014-05-10	\N	29	ActionWork	2014-05-17 13:01:15.490385	2016-08-05 12:02:03.827813	t	1
39	polissons	polissons	els-polissons	2014-05-31	\N	28	ActionWork	2014-05-17 12:59:00.756984	2020-09-20 20:50:24.979295	t	6
37	n-ombrares	n-ombrares	n-ombrares	2013-06-22	\N	26	ActionWork	2014-05-17 12:35:47.228536	2020-09-20 20:50:24.939653	t	6
36	despunxar	despunxar	despunxar	2013-11-09	\N	25	ActionWork	2013-12-06 13:20:53.584595	2020-09-20 20:50:24.919016	t	6
35	quina-es-la-pregunta	quina-es-la-pregunta	quina-es-la-pregunta	2013-11-25	\N	24	ActionWork	2013-12-06 13:07:19.832531	2020-09-20 20:50:24.972956	t	5
34	sum-us	sum-us	sum-us	2013-11-22	\N	23	ActionWork	2013-12-06 13:04:41.818596	2020-09-20 20:50:24.925366	t	7
33	fent-volar-coloms	fent-volar-coloms	fent-volar-coloms	2013-11-28	\N	22	ActionWork	2013-12-06 12:49:22.391758	2020-09-20 20:50:24.932879	t	7
31	a-z-5-5-f-acts	a-z-5-5-f-acts	a-z-5-5-f-acts	2013-07-12	\N	21	ActionWork	2013-09-05 14:59:30.581912	2020-09-20 20:50:24.887363	t	1
30	axis-salus-hommage-to-the-good-doctor	axis-salus-homenaje-al-buen-medico-premio-separ	axis-salus-homenatge-al-bon-metge	2013-08-20	11,5 x 14 x 13 cm	20	VisualWork	2013-08-20 12:50:53.330132	2014-10-09 17:19:05.582834	f	2
29	grafies-d-una-mirada-a-sarria	grafies-d-una-mirada-a-sarria	grafies-d-una-mirada-a-sarria	2012-04-05	18 x 23 cm	19	VisualWork	2013-04-05 18:53:13.913679	2013-04-05 18:56:47.172902	t	8
27	si-lent-si-silenci	si-lent-si-silenci	si-lent-si-silenci	2013-04-05	\N	18	ActionWork	2013-04-05 15:05:10.489553	2020-09-20 20:50:24.862163	f	0
24	s-t-sin-titulo	s-t-sin-titulo	s-t-sense-titol	2013-02-23	\N	17	ActionWork	2013-03-27 21:35:26.163119	2020-09-20 20:50:24.874958	t	10
75	enclaudebes	enclavedebes-os	enclaudebes	2014-06-10	Sala de exposiciones del MiD	30	VisualWork	2019-06-10 21:35:27.166925	2022-01-10 11:45:58.720538	t	10
6	zenits-1	zenits-1	zenits-1	2011-09-16	30 x 39,5 cm	6	VisualWork	2013-01-04 20:32:19.488412	2013-03-28 01:44:05.424587	t	10
12	musical-ment	musical-ment	musical-ment	2011-08-15	\N	5	ActionWork	2013-01-05 01:21:06.678029	2020-09-21 12:33:25.921228	t	4
11	dinergia-i-ii-iii	dinergia-i-ii-iii	dinergia-i-ii-iii	2009-01-05		4	VisualWork	2013-01-05 00:51:50.446447	2013-01-05 00:56:53.398888	t	5
26	el-celler-i--2	el-celler-i--2	el-celler-i--2	2008-03-28		3	VisualWork	2013-03-28 00:59:05.058178	2013-03-28 01:20:39.603891	t	3
8	dues-veus-nues	dues-veus-nues	dues-veus-nues	2011-04-01		2	VisualWork	2013-01-04 20:55:13.990187	2020-09-20 20:50:24.900473	t	3
7	possibles-impossibles	possibles-impossibles	possibles-impossibles	2011-04-28	\N	1	ActionWork	2013-01-04 20:49:48.47245	2020-09-20 20:50:24.985554	t	3
14	aflora	aflora	aflora	2011-01-05		8	VisualWork	2013-01-05 01:36:09.623864	2022-01-10 11:21:20.689562	t	5
13	constelaccions	constelacciones	constelaccions	2008-01-05		9	VisualWork	2013-01-05 01:30:14.33089	2022-01-05 20:10:05.535745	t	1
88	ull-agulles	ull-agulles	ull-agulles	2021-09-20	Un trozo de campo en Torre Lluvià. O también: de aquí a Montserrat	70	VisualWork	2021-09-20 19:33:22.557705	2022-01-05 20:16:55.089635	t	8
77	de-veu-en-veu	de-veu-en-veu	de-veu-en-veu	2019-03-06	\N	63	ActionWork	2019-06-10 22:08:30.86874	2021-08-31 23:07:42.432665	f	3
23	6-senses--7	6-senses--7	6-senses-consentidosinsentido	2013-03-07	\N	16	ActionWork	2013-03-22 00:11:06.526061	2020-09-20 20:50:24.851568	t	5
9	e-qui-libri-s-ii	e-qui-libri-s-ii	e-qui-libri-s-ii	2012-09-27	\N	15	ActionWork	2013-01-04 22:53:52.680536	2020-09-20 20:50:24.868469	t	11
17	uters	uters	uters	2010-01-20		14	VisualWork	2013-01-20 01:01:01.351696	2013-03-28 00:07:10.388773	t	3
19	taboo-ser-res-cos-soc	taboo-ser-res-cos-soc	taboo-ser-res-cos-soc	2010-05-02	\N	13	ActionWork	2013-01-20 02:38:39.839034	2020-09-20 20:50:25.03206	t	7
16	ouroboros-veus	ouroboros-veus	ouroboros-veus	2011-09-06	\N	12	ActionWork	2013-01-20 00:53:54.408037	2020-09-20 20:50:24.836661	t	8
10	anima-l-u	anima-l-u	anima-l-u	2011-03-09	\N	11	ActionWork	2013-01-05 00:35:47.123185	2020-09-20 20:50:24.808167	t	4
15	improvisar	improvisar	impro	2012-03-23	\N	10	ActionWork	2013-01-05 01:58:04.864981	2020-09-20 20:50:24.829423	t	3
18	itaca-pas-a-dos	itaca-pas-a-dos	itaca-pas-a-dos	2009-06-22	\N	7	ActionWork	2013-01-20 02:15:44.616616	2020-09-20 20:50:24.844214	t	3
76	gravat9	gravat-9	gravat-9	2019-06-10	varias	62	VisualWork	2019-06-10 21:53:33.118572	2022-01-05 20:26:16.304672	t	7
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.images (id, deprecated_image, "position", created_at, updated_at, video, work_id) FROM stdin;
145	\N	6	2014-05-17 12:13:11.895863	2014-05-17 12:19:36.806395	https://vimeo.com/83686197	34
7	Instal.laci__monos_labos.JPG	2	2013-01-04 21:08:33.070994	2022-07-03 01:36:15.600322		8
199	20140706_165129.jpg	3	2015-01-05 00:13:36.036211	2022-07-03 01:37:06.460123		44
200	20140706_164738.jpg	4	2015-01-05 00:13:36.897578	2022-07-03 01:37:07.027577		44
201	20140706_165245.jpg	5	2015-01-05 00:13:37.994038	2022-07-03 01:37:07.714057		44
204	IMG_1468.jpeg	1	2015-07-03 00:07:34.082814	2022-07-03 01:37:07.91078		46
212	IMG_2324.jpeg	1	2015-09-27 22:40:21.943151	2022-07-03 01:37:09.155686		47
146	CORPOLOGIA_13.jpeg	7	2014-05-17 12:13:11.921266	2022-07-03 01:36:50.405519		34
148	DSC_0038retoc.jpeg	2	2014-05-17 12:35:48.040542	2022-07-03 01:36:50.861388		37
149	DSC_0044_copia.jpeg	3	2014-05-17 12:35:48.913866	2022-07-03 01:36:51.15734		37
128	Coloms_circuit1_A.Bombaci.jpg	4	2013-12-06 12:49:23.917396	2022-07-03 01:36:44.812736		33
129	Coloms_Cordes1_ClaraBes.jpg	5	2013-12-06 12:49:25.10811	2022-07-03 01:36:45.117866		33
130	Coloms_Globos_ClaraBes.jpg	6	2013-12-06 12:49:25.735747	2022-07-03 01:36:45.407462		33
132	Coloms_Murmuradores_A.Bombaci.jpg	8	2013-12-06 12:49:27.235642	2022-07-03 01:36:45.847264		33
133	generart25nov.jpg	2	2013-12-06 13:07:19.838038	2022-07-03 01:36:46.110871		35
134	despunxa1.JPG	1	2013-12-06 13:20:53.588822	2022-07-03 01:36:46.616679		36
150	DSC_0047_copia.jpeg	4	2014-05-17 12:35:49.755477	2022-07-03 01:36:51.35293		37
151	DSC_0048_copiaretocada.jpeg	5	2014-05-17 12:35:50.614842	2022-07-03 01:36:51.57486		37
152	DSC_0051_copia.jpeg	6	2014-05-17 12:35:51.284079	2022-07-03 01:36:51.817021		37
156	Programa_Perpetraci_ns_Interior.jpg	3	2014-07-17 22:28:50.898452	2022-07-03 01:36:52.242409		39
158	140531-XIV_Perpetracions-Antologia_Animal-500.jpg	2	2014-07-17 22:28:53.187017	2022-07-03 01:36:53.387471		39
171	IMG_2108.jpeg	3	2014-11-03 23:26:03.616212	2022-07-03 01:36:57.727703		41
172	IMG_2116.jpeg	4	2014-11-03 23:26:04.397945	2022-07-03 01:36:57.864409		41
173	IMG_2117.jpeg	5	2014-11-03 23:26:05.244875	2022-07-03 01:36:58.068102		41
174	IMG_2127.jpeg	6	2014-11-03 23:26:06.004775	2022-07-03 01:36:58.191964		41
136	despunxa3.JPG	3	2013-12-06 13:20:55.176573	2022-07-03 01:36:47.394523		36
137	despunxa4.JPG	4	2013-12-06 13:20:55.929314	2022-07-03 01:36:47.808486		36
138	despunxaFi.JPG	5	2013-12-06 13:20:56.96195	2022-07-03 01:36:48.14429		36
139	esbarzer_obrAl_xia1.JPG	6	2013-12-06 13:20:58.326664	2022-07-03 01:36:48.523872		36
140	DSC_0583.jpeg	1	2014-05-17 12:13:07.524387	2022-07-03 01:36:48.88441		34
141	sum_us_1.jpeg	2	2014-05-17 12:13:08.49483	2022-07-03 01:36:49.196095		34
175	IMG_2131.jpeg	7	2014-11-03 23:26:06.6773	2022-07-03 01:36:58.326542		41
176	IMG_2132.jpeg	8	2014-11-03 23:26:07.299663	2022-07-03 01:36:58.441424		41
177	IMG_2134.jpeg	9	2014-11-03 23:26:07.928066	2022-07-03 01:36:58.560125		41
178	Mireia_Zantop_Accio_.JPG	2	2015-01-04 22:05:04.762646	2022-07-03 01:36:58.998345		42
179	Fulls_Accio__Mireia.JPG	3	2015-01-04 22:05:10.596075	2022-07-03 01:36:59.530419		42
164	P1130300.JPG	4	2014-07-17 22:55:52.957072	2022-07-03 01:36:55.889859		35
135	despunxa2.JPG	2	2013-12-06 13:20:54.370403	2022-07-03 01:36:47.033948		36
143	sum_us_3.jpeg	4	2014-05-17 12:13:10.103452	2022-07-03 01:36:49.786783		34
144	DSC_0621.jpeg	5	2014-05-17 12:13:10.913218	2022-07-03 01:36:50.190717		34
127	Coloms_Laminas1_ClaraBes.jpg	3	2013-12-06 12:49:23.33067	2022-07-03 01:36:44.536627		33
165	P1130321.JPG	5	2014-07-17 22:55:53.937621	2022-07-03 01:36:56.373987		35
170	IMG_2104.jpeg	2	2014-11-03 23:26:02.782895	2022-07-03 01:36:57.546926		41
159	140531-XIV_Perpetracions-Antologia_Animal-504.jpg	4	2014-07-17 22:28:54.317382	2022-07-03 01:36:53.901403		39
160	140531-XIV_Perpetracions-Antologia_Animal-506.jpg	5	2014-07-17 22:28:55.469747	2022-07-03 01:36:54.368237		39
161	140531-XIV_Perpetracions-Antologia_Animal-496.jpg	6	2014-07-17 22:28:56.851237	2022-07-03 01:36:54.796863		39
162	P1130261.JPG	1	2014-07-17 22:55:51.029461	2022-07-03 01:36:55.140763		35
163	P1130264.JPG	3	2014-07-17 22:55:51.976218	2022-07-03 01:36:55.510211		35
168	Separ_20143Sala_AUDITORIO.jpg	3	2014-10-09 17:19:06.903811	2022-07-03 01:36:57.21413		30
169	IMG_2095.jpeg	1	2014-11-03 23:21:44.115417	2022-07-03 01:36:57.348387		41
180	Pu_blic02.JPG	4	2015-01-04 22:05:11.538994	2022-07-03 01:37:00.016044		42
213	IMG_2334.jpeg	2	2015-09-27 22:40:22.503104	2022-07-03 01:37:09.29523		47
181	Mireia_Zantop_01.JPG	5	2015-01-04 22:05:12.485475	2022-07-03 01:37:00.612485		42
182	PanorGUILLERIES_accio_.jpg	6	2015-01-04 22:05:18.447944	2022-07-03 01:37:01.016421		42
183	Daniel_Ruiz-_Trillo_02.JPG	7	2015-01-04 22:05:19.521168	2022-07-03 01:37:01.404245		42
184	Mireia_i_Blai_en_accio_.JPG	8	2015-01-04 22:05:20.243222	2022-07-03 01:37:01.992293		42
185	IMG_6760.jpeg	2	2015-01-04 23:00:32.874014	2022-07-03 01:37:02.205689		43
186	IMG_6764.jpeg	3	2015-01-04 23:00:33.717678	2022-07-03 01:37:02.451245		43
187	IMG_6767.jpeg	4	2015-01-04 23:00:34.42342	2022-07-03 01:37:02.716352		43
188	IMG_6772.jpeg	5	2015-01-04 23:00:35.082099	2022-07-03 01:37:02.890177		43
189	IMG_6775.jpeg	6	2015-01-04 23:00:35.765695	2022-07-03 01:37:03.052706		43
190	IMG_6798.jpeg	7	2015-01-04 23:00:41.430322	2022-07-03 01:37:03.261817		43
191	IMG_6812.jpeg	8	2015-01-04 23:00:42.015798	2022-07-03 01:37:03.425777		43
192	IMG_6819.jpeg	9	2015-01-04 23:00:42.650881	2022-07-03 01:37:03.587902		43
193	IMG_6827.jpeg	10	2015-01-04 23:00:43.296168	2022-07-03 01:37:03.745125		43
194	IMG_6834.jpeg	11	2015-01-04 23:00:44.045373	2022-07-03 01:37:03.94099		43
196	tarja_birds.jpeg	1	2015-01-04 23:23:54.778561	2022-07-03 01:37:04.613528		40
197	20140706_164949.jpg	1	2015-01-05 00:13:34.13966	2022-07-03 01:37:05.217895		44
198	20140706_164949.jpg	2	2015-01-05 00:13:35.07326	2022-07-03 01:37:05.822152		44
214	IMG_2423.jpeg	3	2015-09-27 22:40:23.059602	2022-07-03 01:37:09.437681		47
252	CanFelipa_39.jpg	8	2016-08-01 16:18:33.389819	2022-07-03 01:37:21.959746		51
253	CanFelipa_26.jpg	9	2016-08-01 16:18:33.944432	2022-07-03 01:37:22.28041		51
254	CanFelipa_09.jpg	10	2016-08-01 16:18:34.704063	2022-07-03 01:37:22.464027		51
111	_MG_3737.jpg	2	2013-09-05 14:59:30.592008	2022-07-03 01:36:43.763176		31
465	DSC_0106-004.jpg	6	2021-09-26 20:13:56.480034	2022-07-03 01:41:27.089799		87
126	fent_volar_coloms.jpg	2	2013-12-06 12:49:22.440575	2022-07-03 01:36:44.205717		33
215	IMG_2411.jpeg	4	2015-09-27 22:40:23.590348	2022-07-03 01:37:09.587902		47
216	IMG_2450.jpeg	5	2015-09-27 22:40:24.149661	2022-07-03 01:37:09.803668		47
217	IMG_2464.jpeg	6	2015-09-27 22:40:24.767326	2022-07-03 01:37:09.944704		47
218	IMG_2489.jpeg	7	2015-09-27 22:40:25.303337	2022-07-03 01:37:10.08716		47
250	CanFelipa_17.jpg	6	2016-08-01 16:18:31.863956	2022-07-03 01:37:21.165076		51
251	AdobeBridgeBatchRenameTemp2CanFelipa_02.jpg	7	2016-08-01 16:18:32.497636	2022-07-03 01:37:21.54192		51
10	Vil.la_Florida_venus.JPG	3	2013-01-04 21:08:34.695465	2022-07-03 01:36:16.044738		8
229	poesie.JPG	2	2015-09-27 23:08:19.111853	2022-07-03 01:37:14.599465		14
230	Strelitzia_Delitzia.JPG	3	2015-09-27 23:08:19.725425	2022-07-03 01:37:14.855416		14
468	ZANTOP_-_ESSENSETEMPO.jpg	3	2021-11-19 20:17:26.510295	2022-07-03 01:41:28.157776		92
231	AromaMagn_lia.JPG	4	2015-09-27 23:08:20.445711	2022-07-03 01:37:15.194481		14
272	DSCF2813.JPG	5	2016-08-05 11:55:28.179231	2022-07-03 01:37:28.488402		55
273	DSCF2805.JPG	6	2016-08-05 11:55:28.906122	2022-07-03 01:37:29.04475		55
276	IMG_9786.jpeg	4	2016-10-19 22:54:28.983146	2022-07-03 01:37:30.076817		56
277	IMG_9790.jpeg	5	2016-10-19 22:54:29.548586	2022-07-03 01:37:30.360679		56
232	Rosaflordepell.JPG	5	2015-09-27 23:08:21.133874	2022-07-03 01:37:15.587646		14
233	IMG_6061.jpeg	1	2016-08-01 15:36:37.806751	2022-07-03 01:37:15.915389		48
262	DSCF0447_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	3	2016-08-01 17:43:53.096192	2022-07-03 01:37:24.644594		53
207	IMG_1492.jpeg	4	2015-07-03 00:07:36.100125	2022-07-03 01:37:08.439776		46
208	IMG_1499.jpeg	5	2015-07-03 00:07:36.731664	2022-07-03 01:37:08.609917		46
210	IMG_1513.jpeg	6	2015-07-03 00:10:52.871909	2022-07-03 01:37:08.764662		46
220	IMG_2533.jpeg	9	2015-09-27 22:40:26.521271	2022-07-03 01:37:10.365772		47
221	IMG_2574.jpeg	10	2015-09-27 22:40:27.133208	2022-07-03 01:37:10.591559		47
235	IMG_6073.jpeg	3	2016-08-01 15:36:39.109254	2022-07-03 01:37:16.382265		48
237	IMG_6096.jpeg	5	2016-08-01 15:36:40.455173	2022-07-03 01:37:17.023285		48
238	IMG_6103.jpeg	6	2016-08-01 15:36:41.15213	2022-07-03 01:37:17.287333		48
239	IMG_6108.jpeg	7	2016-08-01 15:36:41.756187	2022-07-03 01:37:17.542087		48
240	IMG_6111.jpeg	8	2016-08-01 15:36:42.522787	2022-07-03 01:37:17.90729		48
241	IMG_6112.jpeg	9	2016-08-01 15:36:43.071126	2022-07-03 01:37:18.242019		48
242	Corpologia_21_.jpg	11	2016-08-01 15:36:43.611145	2022-07-03 01:37:18.700934		48
243	IMG-20150128-WA0000.jpg	1	2016-08-01 15:46:03.253903	2022-07-03 01:37:19.038031		49
244	IMG-20150128-WA0001.jpg	2	2016-08-01 15:46:03.943581	2022-07-03 01:37:19.407352		49
280	Performance__Donar_veu_al_desig__Tona_2015__1_.jpg	4	2017-02-19 20:39:17.854188	2022-07-03 01:37:32.023024		54
284	DSCF4634.JPG	4	2017-06-01 22:46:01.688096	2022-07-03 01:38:45.341206		59
257	foto_eventuall_ferran_blancafort.jpeg	3	2016-08-01 16:58:24.83924	2022-07-03 01:37:23.201729		52
258	eventuall3.jpeg	4	2016-08-01 16:58:25.430252	2022-07-03 01:37:23.420501		52
259	eventuall4.jpeg	5	2016-08-01 16:58:26.030722	2022-07-03 01:37:23.668899		52
260	Cartell_ME_expo_cartells_2016.jpg	1	2016-08-01 17:43:51.787056	2022-07-03 01:37:24.001568		53
261	RIMG0068.jpg	2	2016-08-01 17:43:52.564463	2022-07-03 01:37:24.330368		53
246	AdobeBridgeBatchRenameTemp12CanFelipa_31.jpg	2	2016-08-01 16:18:29.249618	2022-07-03 01:37:19.988753		51
247	CanFelipa_67.jpg	3	2016-08-01 16:18:29.973361	2022-07-03 01:37:20.217704		51
281	DONAR_VEU_AL_DESIG_.jpg	3	2017-02-19 20:39:18.691339	2022-07-03 01:37:32.398696		54
234	IMG_6068.jpeg	2	2016-08-01 15:36:38.491222	2022-07-03 01:37:16.163004		48
264	RIMG0087.jpg	5	2016-08-01 17:43:54.791985	2022-07-03 01:37:25.298367		53
265	RIMG0082.jpg	6	2016-08-01 17:43:55.413798	2022-07-03 01:37:25.569557		53
266	RIMG0084.jpg	7	2016-08-01 17:43:55.963678	2022-07-03 01:37:25.83186		53
267	ZANTOP_A_BEN1_amb_dibuix_fotos_Joan_Casellas_Arxiu_Aire.jpg	8	2016-08-01 17:43:56.508431	2022-07-03 01:37:26.124048		53
268	DSCF2590.JPG	1	2016-08-05 11:55:25.381222	2022-07-03 01:37:26.571337		55
269	DSCF2682.JPG	2	2016-08-05 11:55:25.971894	2022-07-03 01:37:27.086622		55
248	CanFelipa_62.jpg	4	2016-08-01 16:18:30.582471	2022-07-03 01:37:20.57687		51
249	CanFelipa_28.jpg	5	2016-08-01 16:18:31.269166	2022-07-03 01:37:20.888384		51
255	eventuall0.jpeg	1	2016-08-01 16:58:23.602299	2022-07-03 01:37:22.70316		52
256	eventuall2.jpeg	2	2016-08-01 16:58:24.28788	2022-07-03 01:37:23.010594		52
263	DSCF0459_MIREIA_ZANTOP_foto_Joan_Casellas_Arxiu_Aire.JPG	4	2016-08-01 17:43:53.868735	2022-07-03 01:37:24.933815		53
469	ZANTOP_-_1._ATADALASALAS.jpg	4	2021-11-19 20:17:27.044482	2022-07-03 01:41:28.592812		92
270	DSCF2762.JPG	3	2016-08-05 11:55:26.72496	2022-07-03 01:37:27.531222		55
271	DSCF2792.JPG	4	2016-08-05 11:55:27.471995	2022-07-03 01:37:27.994351		55
470	ZANTOP_-_acord.jpg	5	2021-11-19 20:17:27.623496	2022-07-03 01:41:29.012649		92
471	ZANTOP_-_2._piet_.jpg	6	2021-11-19 20:17:28.155184	2022-07-03 01:41:29.550989		92
278	Performance__Donar_veu_al_desig__Tona_2015__6_.jpg	1	2017-02-19 20:39:16.13435	2022-07-03 01:37:31.031661		54
472	zantop_-_coeurage_.jpg	7	2021-11-19 20:17:28.730148	2022-07-03 01:41:29.857933		92
285	DSCF4650.JPG	5	2017-06-01 22:46:02.788109	2022-07-03 01:38:45.714272		59
205	IMG_1475.jpeg	2	2015-07-03 00:07:34.957377	2022-07-03 01:37:08.071222		46
279	VIC2.jpg	5	2017-02-19 20:39:17.166702	2022-07-03 01:37:31.4823		54
282	MIREIAZANTOP6.png	1	2017-02-19 23:46:47.237139	2022-07-03 01:38:44.509779		57
347	almost_finished.jpg	1	2019-03-07 22:44:49.708459	2022-07-03 01:39:34.560163		71
467	ZANTOP_-_EQUILIBRIS.jpg	2	2021-11-19 20:17:26.068301	2022-07-03 01:41:27.766816		92
315	corpologia_25_5_Girona_3_retocada.jpeg	3	2018-12-21 20:09:56.734044	2022-07-03 01:39:25.715847		66
286	DSCF4658.JPG	6	2017-06-01 22:46:03.486229	2022-07-03 01:38:46.148036		59
344	P1110558baixa.jpg	3	2019-01-28 20:29:59.198321	2022-07-03 01:39:33.554501		69
287	DSCF4653.JPG	7	2017-06-01 22:46:04.360941	2022-07-03 01:38:46.52478		59
288	DSCF4659.JPG	8	2017-06-01 22:46:05.059504	2022-07-03 01:38:46.952376		59
290	DSCF4662.JPG	9	2017-06-01 22:46:06.732934	2022-07-03 01:38:47.697754		59
308	MIREIAZANTOP8.jpg	4	2017-06-02 00:58:05.531724	2022-07-03 01:39:23.461938		57
309	MIREIAZANTOP15.jpg	7	2017-06-02 00:58:06.343089	2022-07-03 01:39:23.921749		57
310	MIREIAZANTOP22.jpg	8	2017-06-02 00:58:07.212784	2022-07-03 01:39:24.431832		57
311	MIREIAZANTOP23.jpg	9	2017-06-02 00:58:07.992327	2022-07-03 01:39:24.702923		57
312	donar_veu..._desig_Manlleu_2016.jpg	2	2017-06-02 01:10:47.004524	2022-07-03 01:39:24.989255		54
314	corpologia_25_5_Girona_2_retocada.jpeg	2	2018-12-21 20:09:56.202489	2022-07-03 01:39:25.30713		66
316	corpologia_25_5_Girona_4_retocada.jpeg	4	2018-12-21 20:09:57.972727	2022-07-03 01:39:26.079243		66
359	IMG_20190125_162217.jpg	2	2019-04-15 12:26:32.177041	2022-07-03 01:39:41.804626		71
451	DSCF5849torre_lluvi_.JPG	6	2021-09-20 20:07:22.107389	2022-07-03 01:41:23.761398		88
421	M.ZANTOP_phoscenes_aiguada_A4.jpg	8	2020-10-14 22:48:45.660183	2022-07-03 01:40:00.718193		82
423	M.ZANTOP_phoscenes__AIGUAda__A4.jpg	7	2020-10-14 22:48:46.750917	2022-07-03 01:40:01.48193		82
317	be___IMG-3930.JPG	5	2018-12-21 20:15:06.236806	2022-07-03 01:39:26.647751		66
319	be__IMG-3931.JPG	7	2018-12-21 20:19:42.204608	2022-07-03 01:39:27.093525		66
335	DSCF4982baixa.jpg	1	2019-01-28 20:12:16.001142	2022-07-03 01:39:31.253485		65
343	P1110555_aleix_vallverd__baixa.jpg	2	2019-01-28 20:29:58.684495	2022-07-03 01:39:33.281313		69
206	IMG_1491.jpeg	3	2015-07-03 00:07:35.567417	2022-07-03 01:37:08.247856		46
350	cap1_IMG_20190405_181244_013.jpg	4	2019-04-15 10:49:25.108785	2022-07-03 01:39:36.465569		72
371	DSCN1209_2.jpg	3	2019-06-10 21:35:27.171697	2022-07-03 01:39:46.101283		75
299	MIREIAZANTOP51.jpg	3	2017-06-02 00:01:31.926976	2022-07-03 01:39:20.079997		63
300	MIREIAZANTOP59.jpg	4	2017-06-02 00:01:32.570647	2022-07-03 01:39:20.397917		63
301	IMG-20161002-WA0002.jpg	5	2017-06-02 00:01:33.317075	2022-07-03 01:39:20.738285		63
302	DSCF3668.JPG	1	2017-06-02 00:41:09.692566	2022-07-03 01:39:21.173362		64
303	DSCF3662.JPG	2	2017-06-02 00:41:10.548581	2022-07-03 01:39:21.436364		64
295	Puig-Reig_2017.JPG	2	2017-06-01 23:32:59.696835	2022-07-03 01:38:49.795726		62
296	matar_1_2017.JPG	3	2017-06-01 23:33:00.456423	2022-07-03 01:38:50.26832		62
297	MIREIAZANTOP42.png	1	2017-06-02 00:01:30.333086	2022-07-03 01:39:19.220105		63
298	Josep_Sou_IMG_4360.JPG	2	2017-06-02 00:01:31.258369	2022-07-03 01:39:19.673468		63
321	P1050649_redimensionat_amb_gwenvi_i_1024_.jpg	4	2018-12-21 20:56:13.139631	2022-07-03 01:39:27.849881		67
322	P1050656_redimensionat.jpg	5	2018-12-21 20:56:13.647604	2022-07-03 01:39:28.131638		67
324	P1050670.jpg	7	2018-12-21 20:56:14.726737	2022-07-03 01:39:28.808004		67
293	DSC01109-102.jpeg	1	2017-06-01 23:00:44.565565	2022-07-03 01:38:48.715544		61
294	IMG_20170519_184422.jpg	1	2017-06-01 23:32:58.907326	2022-07-03 01:38:49.309468		62
363	MZantop.JPG	4	2019-06-10 20:41:48.213093	2022-07-03 01:39:43.206504		74
325	P1050683_redimensionat.jpg	8	2018-12-21 20:56:15.458615	2022-07-03 01:39:29.056739		67
351	cap_1_contrallumIMG_20190405_174610_478.jpg	5	2019-04-15 10:49:25.782141	2022-07-03 01:39:36.91563		72
348	cap_2_IMG_20190405_174933_504.jpg	2	2019-04-15 10:49:23.935701	2022-07-03 01:39:35.268422		72
326	IMG_6115.JPG	1	2018-12-21 21:13:42.52006	2022-07-03 01:39:29.468797		68
304	DSCF3670.JPG	3	2017-06-02 00:41:11.311246	2022-07-03 01:39:21.736394		64
305	DSCF3683.JPG	4	2017-06-02 00:41:12.07919	2022-07-03 01:39:22.143047		64
306	DSCF3681.JPG	5	2017-06-02 00:41:12.821488	2022-07-03 01:39:22.558281		64
307	DSCF3656.JPG	6	2017-06-02 00:41:13.630177	2022-07-03 01:39:22.992663		64
313	inundart_ph_72ppi.jpg	2	2018-08-22 21:50:17.041856	2022-07-03 01:39:25.132884		67
320	72ppi_rocs_de_lluna.jpg	3	2018-12-21 20:24:03.738858	2022-07-03 01:39:27.574904		67
328	IMG_6130.JPG	3	2018-12-21 21:13:43.994911	2022-07-03 01:39:30.188087		68
330	IMG_6183.JPG	5	2018-12-21 21:13:45.579316	2022-07-03 01:39:30.561886		68
334	P1060009baixant_qualitatjpg.jpg	2	2019-01-28 19:08:01.449546	2022-07-03 01:39:30.926717		65
354	SOM.Escultura_equilibri_ONA.JPG	3	2019-04-15 11:41:04.569538	2022-07-03 01:39:38.676049		73
356	20150118_131247.jpg	5	2019-04-15 11:41:05.696436	2022-07-03 01:39:39.870014		73
357	funambuliaIMG_20171104_161244.jpg	6	2019-04-15 11:41:06.382746	2022-07-03 01:39:40.570874		73
346	IMG_6180.JPG	4	2019-03-07 22:05:14.173587	2022-07-03 01:39:34.088819		68
225	20140706_171308.jpg	5	2015-09-27 23:03:10.960936	2022-07-03 01:37:12.614711		38
336	DSCF5039baixa.jpg	3	2019-01-28 20:12:16.582016	2022-07-03 01:39:31.536081		65
349	capcap_2.jpg	3	2019-04-15 10:49:24.570936	2022-07-03 01:39:35.765967		72
292	DSCF4671.JPG	11	2017-06-01 22:46:08.290143	2022-07-03 01:38:48.475773		59
291	DSCF4665.JPG	10	2017-06-01 22:46:07.448056	2022-07-03 01:38:48.105645		59
337	P1060026baixa.jpg	4	2019-01-28 20:12:17.046974	2022-07-03 01:39:31.794603		65
338	DSCF5004.JPG	5	2019-01-28 20:12:17.606523	2022-07-03 01:39:32.142108		65
340	IMG-20180115-WA0028baixa.jpg	7	2019-01-28 20:12:18.586861	2022-07-03 01:39:32.569579		65
341	IMG-20180115-WA0024baixa.jpg	8	2019-01-28 20:12:19.193854	2022-07-03 01:39:32.800579		65
226	DSCF1265.JPG	6	2015-09-27 23:03:11.692762	2022-07-03 01:37:13.112373		38
227	DSCF1556.JPG	7	2015-09-27 23:03:12.575381	2022-07-03 01:37:13.814461		38
228	DSCF1525.JPG	8	2015-09-27 23:03:13.339641	2022-07-03 01:37:14.380685		38
283	DSCF4623.JPG	3	2017-06-01 22:46:00.447742	2022-07-03 01:38:44.954767		59
289	DSCF4661.JPG	2	2017-06-01 22:46:05.850788	2022-07-03 01:38:47.336579		59
342	P1110547baixa.jpg	1	2019-01-28 20:29:58.211152	2022-07-03 01:39:33.036825		69
50	DSC02327.JPG	5	2013-01-20 02:38:42.018621	2022-07-03 01:36:28.881181		19
355	cos_cosit_IMG_20171101_155853.jpg	4	2019-04-15 11:41:05.195215	2022-07-03 01:39:39.277882		73
327	IMG_6129.JPG	2	2018-12-21 21:13:43.243946	2022-07-03 01:39:29.805597		68
426	IMG_20190831_132411_157.jpg	3	2020-10-14 23:00:13.677558	2022-07-03 01:40:03.557028		78
435	IMG-20210315-WA0017.jpg	2	2021-04-08 21:31:00.11372	2022-07-03 01:40:08.584639		85
375	DSCN1288.JPG	6	2019-06-10 21:35:29.826105	2022-07-03 01:39:47.61486		75
358	cordada_IMG_20171101_162351.jpg	7	2019-04-15 11:41:06.993407	2022-07-03 01:39:41.426757		73
436	IMG-20210315-WA0016.jpg	3	2021-04-08 21:31:00.766945	2022-07-03 01:40:09.230028		85
373	2014-08-05_11-44-56.jpg	2	2019-06-10 21:35:28.533335	2022-07-03 01:39:46.909316		75
374	2014-08-05_12-09-46.jpg	5	2019-06-10 21:35:29.172985	2022-07-03 01:39:47.226459		75
376	2014-08-05_11-39-24.jpg	7	2019-06-10 21:35:30.433734	2022-07-03 01:39:48.052756		75
377	2014-08-05_11-40-12.jpg	8	2019-06-10 21:35:31.143949	2022-07-03 01:39:48.478582		75
378	2014-08-05_12-20-18.jpg	9	2019-06-10 21:35:31.876559	2022-07-03 01:39:48.823438		75
379	2014-08-05_11-37-52.jpg	10	2019-06-10 21:35:32.523608	2022-07-03 01:39:49.239118		75
397	DSCF4797.JPG	4	2019-06-10 22:26:59.31811	2022-07-03 01:39:56.083917		62
398	DSCF4408.JPG	5	2019-06-10 22:27:00.122651	2022-07-03 01:39:56.740669		62
364	mzantop_3.JPG	5	2019-06-10 20:41:48.737315	2022-07-03 01:39:43.46088		74
360	IMG-20190225-WA0007.jpeg	3	2019-04-15 12:26:32.71858	2022-07-03 01:39:42.210427		71
372	2014-08-05_11-33-00.jpg	4	2019-06-10 21:35:27.857342	2022-07-03 01:39:46.518309		75
361	MZantop_4.jpg	2	2019-06-10 20:41:47.113692	2022-07-03 01:39:42.506807		74
366	IMG_20190518_124322_433.jpg	11	2019-06-10 20:41:50.057323	2022-07-03 01:39:44.446084		74
368	MZantop_2_girat_a_dreta.jpg	3	2019-06-10 21:02:37.531284	2022-07-03 01:39:45.183415		74
437	IMG-20210313-WA0009.jpg	4	2021-04-08 21:31:01.477819	2022-07-03 01:40:09.977944		85
438	IMG-20210315-WA0011.jpg	5	2021-04-08 21:31:02.10316	2022-07-03 01:40:10.434837		85
439	IMG-20210313-WA0004.jpg	6	2021-04-08 21:31:02.73683	2022-07-03 01:40:10.841285		85
449	DSCF5838_cavar.JPG	4	2021-09-20 20:07:20.285475	2022-07-03 01:41:22.655284		88
450	DSCF5843_clavant.JPG	3	2021-09-20 20:07:21.236949	2022-07-03 01:41:23.224756		88
345	IMG_20190112_132919baixaMZ.jpg	4	2019-01-28 20:29:59.700083	2022-07-03 01:39:33.819931		69
222	DSCF1045.JPG	2	2015-09-27 23:03:08.941238	2022-07-03 01:37:10.998481		38
223	DSCF1058.JPG	3	2015-09-27 23:03:09.713415	2022-07-03 01:37:11.452558		38
399	nav_s_2016.JPG	6	2019-06-10 22:27:00.871318	2022-07-03 01:39:57.295642		62
400	IMG_9343.argentona.JPG	7	2019-06-10 22:27:01.572114	2022-07-03 01:39:57.705491		62
424	_20191228_100620.JPG	1	2020-10-14 23:00:12.399023	2022-07-03 01:40:01.951798		78
425	IMG_20191225_133646_151.jpg	2	2020-10-14 23:00:13.002663	2022-07-03 01:40:02.63508		78
51	DSC02347.JPG	6	2013-01-20 02:38:42.463264	2022-07-03 01:36:29.34242		19
39	\N	8	2013-01-20 00:53:58.799125	2013-01-20 01:03:16.222161	http://www.youtube.com/watch?v=AAvuvEJFgx8	16
395	IMG_9343.argentona.JPG	11	2019-06-10 22:26:51.79918	2022-07-03 01:39:55.084968		62
383	IMG_20180928_165542.jpg	4	2019-06-10 21:53:34.237062	2022-07-03 01:39:50.688409		76
387	IMG_20180928_170858.jpg	5	2019-06-10 21:53:36.315178	2022-07-03 01:39:52.071423		76
56	DSCF1197.JPG	2	2013-03-27 21:32:21.804513	2022-07-03 01:36:30.476751		23
396	cardedeu2_2013.JPG	12	2019-06-10 22:26:52.460067	2022-07-03 01:39:55.600504		62
416	M.ZANTOP_phoscenes_TINTA_a4.jpg	1	2020-10-14 22:48:42.546855	2022-07-03 01:39:58.632031		82
417	M.ZANTOP_phoscenes_PHOSPHORESCENT_A5.jpg	2	2020-10-14 22:48:43.199496	2022-07-03 01:39:59.145441		82
370	MZantop_S.JPG	8	2019-06-10 21:02:38.640197	2022-07-03 01:39:45.701061		74
381	IMG_20180928_164827.jpg	1	2019-06-10 21:53:33.123029	2022-07-03 01:39:49.93873		76
3	1_Alguien_camina...JPG	2	2013-01-04 20:32:19.49924	2022-07-03 01:36:14.343752		6
382	Gravat-Nou-cuadrado.jpg	7	2019-06-10 21:53:33.591413	2022-07-03 01:39:50.21848		76
418	M.ZANTOP_phoscenes_a4_NUS_3D.jpg	5	2020-10-14 22:48:43.798913	2022-07-03 01:39:59.502947		82
420	M.ZANTOP_phoscenes_mute_a5_.jpg	6	2020-10-14 22:48:45.015193	2022-07-03 01:40:00.352553		82
388	IMG_20180928_170923.jpg	6	2019-06-10 21:53:36.81654	2022-07-03 01:39:52.4502		76
386	IMG_20180928_165940.jpg	3	2019-06-10 21:53:35.78219	2022-07-03 01:39:51.64655		76
392	DSCF4797.JPG	9	2019-06-10 22:26:49.589438	2022-07-03 01:39:53.993232		62
394	nav_s_2016.JPG	10	2019-06-10 22:26:51.016655	2022-07-03 01:39:54.600913		62
384	IMG_20180928_164531.jpg	2	2019-06-10 21:53:34.726339	2022-07-03 01:39:51.014129		76
422	M.ZANTOP_phoscenes_P_TALS_A4.jpg	3	2020-10-14 22:48:46.128891	2022-07-03 01:40:01.130585		82
440	IMG-20210313-WA0010.jpg	7	2021-04-08 21:31:03.285654	2022-07-03 01:40:11.547433		85
362	_20190412_193903.JPG	6	2019-06-10 20:41:47.574948	2022-07-03 01:39:42.902367		74
16	ANA_RITA_RODRIGUES_FEM_2011_PAR_8711.jpg	3	2013-01-05 00:35:48.681777	2022-07-03 01:36:17.484129		10
17	ANA_RITA_RODRIGUES_FEM_2011_PAR_8749.jpg	4	2013-01-05 00:35:49.187735	2022-07-03 01:36:17.773681		10
18	DSC03862.JPG	1	2013-01-05 00:51:50.455758	2022-07-03 01:36:18.083453		11
19	DINERGIA_I-Armonia_Diatessaron.JPG	2	2013-01-05 00:51:51.344015	2022-07-03 01:36:18.500085		11
20	DINERGIA_I-Llavors.JPG	3	2013-01-05 00:51:51.988754	2022-07-03 01:36:18.766084		11
21	DINERGIAIII-Armonia_ad_infinitum.JPG	4	2013-01-05 00:51:52.437608	2022-07-03 01:36:19.037984		11
22	DSC03863.JPG	5	2013-01-05 00:51:52.871227	2022-07-03 01:36:19.516948		11
23	DSC05616bona.JPG	1	2013-01-05 01:21:06.684687	2022-07-03 01:36:20.165706		12
24	100_0602.JPG	2	2013-01-05 01:21:07.409764	2022-07-03 01:36:20.508244		12
25	100_0591.JPG	3	2013-01-05 01:21:07.933597	2022-07-03 01:36:20.823096		12
26	DSC05840.JPG	4	2013-01-05 01:21:08.405276	2022-07-03 01:36:21.201069		12
27	constelacciones_2008.JPG	1	2013-01-05 01:30:14.338425	2022-07-03 01:36:21.529921		13
28	Mireia_Zantop__sin_rgia.jpg	1	2013-01-05 01:36:09.63012	2022-07-03 01:36:21.868838		14
31	ATENEU_ph.jpg	3	2013-01-05 01:58:06.208474	2022-07-03 01:36:22.866561		15
33	Performance_mireia__1_.JPG	2	2013-01-20 00:53:55.463728	2022-07-03 01:36:23.507847		16
32	inici.JPG	1	2013-01-20 00:53:54.415123	2022-07-03 01:36:23.192548		16
34	DSC06520.JPG	3	2013-01-20 00:53:56.067475	2022-07-03 01:36:23.791188		16
35	Performance_mireia__2_.JPG	4	2013-01-20 00:53:56.586686	2022-07-03 01:36:24.083206		16
15	ANA_RITA_RODRIGUES_FEM_2011_PAR_8672.jpg	2	2013-01-05 00:35:48.064251	2022-07-03 01:36:17.076		10
29	IMGP1552.JPG	1	2013-01-05 01:58:04.875843	2022-07-03 01:36:22.386235		15
30	invitaci_n_performance_ateneu.jpg	2	2013-01-05 01:58:05.546197	2022-07-03 01:36:22.602674		15
36	5_canvi_enquadr..JPG	5	2013-01-20 00:53:57.168344	2022-07-03 01:36:24.484809		16
37	Performance_mireia__6_.JPG	6	2013-01-20 00:53:57.624964	2022-07-03 01:36:24.791348		16
38	Performance_mireia__4_.JPG	7	2013-01-20 00:53:58.209417	2022-07-03 01:36:25.192337		16
40	sala_ruinas2.2.JPG	1	2013-01-20 01:01:01.484063	2022-07-03 01:36:25.481165		17
41	obra_s._paper__ter.jpg	2	2013-01-20 01:52:33.550087	2022-07-03 01:36:25.736004		17
42	uters3.jpg	3	2013-01-20 01:52:34.332986	2022-07-03 01:36:26.069745		17
43	Mireia.JPG	1	2013-01-20 02:15:44.637816	2022-07-03 01:36:26.382405		18
44	Juntas.JPG	2	2013-01-20 02:15:45.293899	2022-07-03 01:36:26.693611		18
45	Eva.JPG	3	2013-01-20 02:15:45.925373	2022-07-03 01:36:26.942063		18
52	DSC02355.JPG	7	2013-01-20 02:38:42.961502	2022-07-03 01:36:29.777414		19
55	DSCF1204.JPG	1	2013-03-22 00:11:06.530617	2022-07-03 01:36:30.147979		23
57	DSCF1203.JPG	3	2013-03-27 21:32:22.726841	2022-07-03 01:36:30.819758		23
58	DSCF1208.JPG	4	2013-03-27 21:32:23.182231	2022-07-03 01:36:31.267195		23
59	DSCF1214.JPG	5	2013-03-27 21:32:23.638224	2022-07-03 01:36:31.661298		23
60	DSC_0250.jpeg	1	2013-03-27 23:34:07.471372	2022-07-03 01:36:31.868134		24
61	DSC_0248.jpeg	2	2013-03-27 23:34:08.434289	2022-07-03 01:36:32.026589		24
62	DSC_0261.jpeg	3	2013-03-27 23:34:08.845453	2022-07-03 01:36:32.224198		24
63	DSC_0266.jpeg	4	2013-03-27 23:34:09.259986	2022-07-03 01:36:32.50815		24
64	DSC_0278.jpeg	5	2013-03-27 23:34:09.750427	2022-07-03 01:36:32.668222		24
65	DSC_0288.jpeg	6	2013-03-27 23:34:10.13677	2022-07-03 01:36:32.811303		24
85	09-La_Bodega_Rustica.jpg	1	2013-03-28 00:59:06.353876	2022-07-03 01:36:35.435444		26
86	LA_DOCTORA_COLE__Noah_Gordon_.jpg	2	2013-03-28 00:59:06.821734	2022-07-03 01:36:35.587858		26
89	imagesNoah_presentaci_n.jpg	3	2013-03-28 00:59:07.958679	2022-07-03 01:36:35.732668		26
91	1_Alguien_camina.sense_marc.JPG	1	2013-03-28 01:29:42.952631	2022-07-03 01:36:36.155244		6
92	2_El_viento_despeina...JPG	3	2013-03-28 01:34:59.55755	2022-07-03 01:36:36.485126		6
93	6_La_hoja_tiembla...JPG	4	2013-03-28 01:35:00.10358	2022-07-03 01:36:36.845648		6
94	5_Cien_hormigas...JPG	5	2013-03-28 01:35:00.649683	2022-07-03 01:36:37.438173		6
96	7_La_risa_rompe...JPG	7	2013-03-28 01:35:01.740548	2022-07-03 01:36:38.310413		6
97	4_Mi_sostenido...JPG	8	2013-03-28 01:35:02.330805	2022-07-03 01:36:38.771643		6
98	8_Palabras_como_humo...JPG	9	2013-03-28 01:35:02.85449	2022-07-03 01:36:39.186104		6
99	3_La_luna_danza...JPG	10	2013-03-28 01:35:03.373662	2022-07-03 01:36:39.572012		6
102	portada.sarria.jpg	3	2013-04-05 18:53:13.922329	2022-07-03 01:36:40.087415		29
103	contraportada.jpg	4	2013-04-05 18:53:14.954064	2022-07-03 01:36:40.547353		29
104	vila-cecilia-1.jpg	5	2013-04-05 18:53:15.430279	2022-07-03 01:36:40.990038		29
105	orlandai-1.jpg	6	2013-04-05 18:53:16.02135	2022-07-03 01:36:41.494904		29
147	DSC_0037.jpeg	1	2014-05-17 12:35:47.239267	2022-07-03 01:36:50.616497		37
211	P1000490.jpg	4	2015-09-25 01:15:08.350715	2022-07-03 01:37:09.02995		8
224	20130623_164338.jpg	4	2015-09-27 23:03:10.280082	2022-07-03 01:37:12.037538		38
275	IMG_9780.jpeg	2	2016-10-19 22:54:28.283388	2022-07-03 01:37:29.755781		56
369	MZantop_O.JPG	7	2019-06-10 21:02:38.167094	2022-07-03 01:39:45.435654		74
13	\N	3	2013-01-04 22:56:20.429668	2013-04-05 19:05:21.858828	https://vimeo.com/53101599	9
73	DSC_0052GUT.jpeg	6	2013-03-27 23:42:27.255255	2022-07-03 01:36:34.07214		9
5	Survival27.jpeg	2	2013-01-04 20:49:49.126706	2022-07-03 01:36:14.943449		7
46	DSC02215.JPG	1	2013-01-20 02:38:39.844998	2022-07-03 01:36:27.340542		19
47	dsc3697.jpg	2	2013-01-20 02:38:40.653374	2022-07-03 01:36:27.516295		19
48	DSC02225.JPG	3	2013-01-20 02:38:41.050996	2022-07-03 01:36:27.969881		19
68	DSC_0260.jpeg	8	2013-03-27 23:34:11.498207	2022-07-03 01:36:33.138891		24
69	DSC_0298.jpeg	9	2013-03-27 23:34:11.894663	2022-07-03 01:36:33.31875		24
70	DSC_0301.jpeg	10	2013-03-27 23:34:12.526364	2022-07-03 01:36:33.500258		24
71	DSC_0037.jpeg	4	2013-03-27 23:42:26.398666	2022-07-03 01:36:33.657366		9
72	DSC_0043GUT.jpeg	5	2013-03-27 23:42:26.852704	2022-07-03 01:36:33.834325		9
75	DSC_0058.jpeg	7	2013-03-27 23:48:29.790516	2022-07-03 01:36:34.237188		9
76	DSC_0060.jpeg	8	2013-03-27 23:48:30.29204	2022-07-03 01:36:34.421687		9
77	DSC_0063.jpeg	9	2013-03-27 23:48:30.704229	2022-07-03 01:36:34.617576		9
78	DSC_0065.jpeg	11	2013-03-27 23:48:31.096866	2022-07-03 01:36:34.791469		9
79	DSC_0067GUT.jpeg	12	2013-03-27 23:48:31.482008	2022-07-03 01:36:34.961956		9
80	DSC_0069GUT.jpeg	1	2013-03-27 23:48:31.885727	2022-07-03 01:36:35.132724		9
95	9_Baile_de_paraguas...JPG	6	2013-03-28 01:35:01.228049	2022-07-03 01:36:37.931272		6
106	orlandai.jpg	7	2013-04-05 18:53:16.536748	2022-07-03 01:36:41.97467		29
107	can-caralleu-3.jpg	8	2013-04-05 18:53:17.149893	2022-07-03 01:36:42.363098		29
108	torto-la-valencia.jpg	9	2013-04-05 18:53:17.649576	2022-07-03 01:36:42.934306		29
109	pino.jpg	10	2013-04-05 18:53:18.276834	2022-07-03 01:36:43.514967		29
131	Coloms_amaralarama1_A.Bombaci.jpg	7	2013-12-06 12:49:26.396816	2022-07-03 01:36:45.641245		33
142	sum_us_2.jpeg	3	2014-05-17 12:13:09.261653	2022-07-03 01:36:49.518331		34
157	140531-XIV_Perpetracions-Antologia_Animal-487.jpg	1	2014-07-17 22:28:51.970185	2022-07-03 01:36:52.910631		39
167	separ_2014.4sala_AUDITORIO.jpg	2	2014-10-09 17:19:05.601242	2022-07-03 01:36:56.763044		30
195	tarja_antic_c18_captura.jpg	12	2015-01-04 23:21:24.45957	2022-07-03 01:37:04.237844		43
219	IMG_2539.jpeg	8	2015-09-27 22:40:25.950144	2022-07-03 01:37:10.228837		47
236	IMG_6090.jpeg	4	2016-08-01 15:36:39.720092	2022-07-03 01:37:16.739797		48
274	IMG_9772.jpeg	3	2016-10-19 22:54:27.438028	2022-07-03 01:37:29.398761		56
323	ph_72_ppi_peus_redimensionat.jpg	6	2018-12-21 20:56:14.15072	2022-07-03 01:39:28.526984		67
339	IMG-20180716-WA0015baixa.jpg	6	2019-01-28 20:12:18.105904	2022-07-03 01:39:32.355381		65
353	IMG-20150907-WA0003.jpg	2	2019-04-15 11:41:03.904461	2022-07-03 01:39:38.135105		73
365	cartell_i_info_de_taller.jpg	9	2019-06-10 20:41:49.27616	2022-07-03 01:39:44.047783		74
367	IMG_20190518_124507_084.jpg	10	2019-06-10 20:41:50.63583	2022-07-03 01:39:44.865811		74
380	2014-08-05_11-30-34.jpg	11	2019-06-10 21:35:33.12261	2022-07-03 01:39:49.62581		75
389	IMG-20190307-WA0001.jpg	1	2019-06-10 22:14:22.905657	2022-07-03 01:39:52.878599		77
390	IMG-20190307-WA0002.jpg	2	2019-06-10 22:14:23.390512	2022-07-03 01:39:53.17079		77
391	IMG-20190304-WA0006.jpg	3	2019-06-10 22:14:23.870381	2022-07-03 01:39:53.454386		77
401	cardedeu2_2013.JPG	8	2019-06-10 22:27:02.109431	2022-07-03 01:39:58.229792		62
419	M.ZANTOP_phoscenes._tinta_a4.jpg	4	2020-10-14 22:48:44.416543	2022-07-03 01:39:59.967119		82
427	IMG_20191225_132357_968.jpg	4	2020-10-14 23:00:14.377944	2022-07-03 01:40:04.110625		78
428	IMG-20200924-WA0012.jpg	3	2021-01-04 20:46:03.875771	2022-07-03 01:40:04.688232		83
429	IMG-20200924-WA0005.jpg	1	2021-01-04 20:46:04.668456	2022-07-03 01:40:05.417314		83
430	IMG_20201016_172309.jpg	5	2021-01-04 20:46:05.229157	2022-07-03 01:40:05.791608		83
431	IMG_20200308_180723_115.jpg	6	2021-01-04 20:46:05.97429	2022-07-03 01:40:06.434228		83
432	__retocat.jpg	2	2021-01-04 20:46:06.621335	2022-07-03 01:40:06.94617		83
433	des_cuidar_accionant_IMG-20200308-WA0020.jpg	7	2021-01-04 20:46:07.418947	2022-07-03 01:40:07.690541		83
434	IMG-20200308-WA0039.jpg	4	2021-01-04 20:46:08.219791	2022-07-03 01:40:07.958264		83
441	Captura_de_pantalla_de_2021-09-01_01-17-09.png	1	2021-08-31 23:06:53.606217	2022-07-03 01:41:02.968887		84
442	arts_entre_lletres_foto_joana_querol.png	2	2021-08-31 23:06:54.498915	2022-07-03 01:41:19.076289		84
443	IMG-20201116-WA0010.jpg	3	2021-08-31 23:06:55.454014	2022-07-03 01:41:19.406832		84
444	IMG-20201116-WA0013.jpg	4	2021-08-31 23:06:56.217747	2022-07-03 01:41:19.784791		84
445	DSC_0037__copia_.JPG	2	2021-09-13 17:24:30.658413	2022-07-03 01:41:20.348631		87
446	Copy_of_DSC_0046-001.jpg	3	2021-09-13 17:24:31.590234	2022-07-03 01:41:20.791691		87
447	DSC_0079-004.jpg	4	2021-09-13 17:24:32.495359	2022-07-03 01:41:21.408555		87
448	DSC_0083-001.jpg	5	2021-09-13 17:24:33.382089	2022-07-03 01:41:22.051488		87
452	IMG_20210827_195621_103agulles_al_pal.jpg	5	2021-09-20 20:07:22.99403	2022-07-03 01:41:24.36419		88
453	P9650800_grup_estaques_i_estaques_fons.JPG	7	2021-09-20 20:07:23.810454	2022-07-03 01:41:25.006358		88
454	IMG_20210829_084447_1amb_cam__.jpg	8	2021-09-20 20:07:24.763822	2022-07-03 01:41:25.44143		88
455	P9650824_caminet_i_pal_agulles.JPG	9	2021-09-20 20:07:25.716215	2022-07-03 01:41:25.960055		88
456	IMG_20210829_084622_1encaix.jpg	2	2021-09-20 20:07:26.604314	2022-07-03 01:41:26.419887		88
466	ZANTOP_-_4._Odumonde.JPG	1	2021-11-19 20:17:25.438748	2022-07-03 01:41:27.486988		92
4	Possible_Foto.jpg	1	2013-01-04 20:49:48.478672	2022-07-03 01:36:14.700187		7
6	Survival29.jpeg	3	2013-01-04 20:49:49.544329	2022-07-03 01:36:15.137311		7
12	DSC_0062GUT.jpeg	2	2013-01-04 22:53:52.694505	2022-07-03 01:36:16.286044		9
14	ANA_RITA_RODRIGUES_FEM_2011_PAR_8663.jpg	1	2013-01-05 00:35:47.142951	2022-07-03 01:36:16.675833		10
49	DSC02239.JPG	4	2013-01-20 02:38:41.521906	2022-07-03 01:36:28.424528		19
66	DSC_0292.jpeg	7	2013-03-27 23:34:10.59682	2022-07-03 01:36:33.00068		24
245	AdobeBridgeBatchRenameTemp7CanFelipa_15.jpg	1	2016-08-01 16:18:28.223363	2022-07-03 01:37:19.725406		51
352	Escultura_sadernes_ONA.jpg	1	2019-04-15 11:41:03.231274	2022-07-03 01:39:37.469374		73
\.


--
-- Data for Name: page_translations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.page_translations (id, page_id, locale, title, body, created_at, updated_at) FROM stdin;
2	2	ca	Contact	The contact-page	2012-10-29 18:37:00.457137	2012-10-29 18:37:00.459652
1	1	ca	About	<p>mireia zantop zigzageja en l&#39;u,<br />\r\ntreballa amb els llenguatges visuals i del cos,</p>\r\n\r\n<p>en l&#39;art d&#39;acci&oacute;, relaciona identitats en l&#39;espai/temps de conflu&egrave;ncia de mirades i intencions</p>\r\n\r\n<p>performance participativa a l&#39;espai p&uacute;blic: <a href="http://www.lesmireies.com">http://www.lesmireies.com</a></p>\r\n\r\n<p>+ info: hola@mireiazantop.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	2012-10-29 18:37:00.444265	2021-12-10 15:37:26.956474
4	1	es	About	<p><strong>Mireia Zantop</strong> zigzaguea en la unidad poli&eacute;drica, trabaja con los lenguajes visuales y del cuerpo.</p>\r\n\r\n<p>en el arte de acci&oacute;n, ese caj&oacute;n transdisciplinario, conjuga identidades y las relaciona con la poes&iacute;a del espacio/tiempo.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Para una mayor confluencia de miradas e intenciones, para dar voz y presencia a aquello que solemos silenciar de forma individual y colectiva, surgieron</p>\r\n\r\n<p><strong>les mireies,</strong> un proyecto de performance participativa en el espacio p&uacute;blico <a href="http://www.lesmireies.com">http://www.lesmireies.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>+ info: hola@mireiazantop.com</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	2021-11-19 21:55:25.520084	2022-02-11 10:51:02.050197
3	1	en	About	<p>Mireia Zantop zigzags in the polyhedral unit, and works both with visual and presential body languages.</p>\r\n\r\n<p>In performance art she works with identities&#39; crossovers and immaterial questions that affect us in presential space/time poems.</p>\r\n\r\n<p>She is member of OCELLS AL CAP collective&nbsp;<a href="https://ocellsalcap.com/">https://ocellsalcap.com/</a> and CORPOLOGIA <a href="https://corpologialiveart.blogspot.com/">https://corpologialiveart.blogspot.com/</a></p>\r\n\r\n<p>LES MIREIES&nbsp;<a href="http://www.lesmireies.com">http://www.lesmireies.com</a> is a participatory performance project in the public space created with the intention to give voice to what we usually silence both individually and collectively<br />\r\n&nbsp;</p>\r\n\r\n<p>more info: <strong>hola@mireiazantop.com</strong></p>\r\n	2013-09-17 00:13:54.622783	2022-02-11 11:18:01.356398
\.


--
-- Data for Name: pages; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.pages (id, created_at, updated_at) FROM stdin;
2	2012-10-29 18:37:00.455895	2012-10-29 18:37:00.455895
1	2012-10-29 18:37:00.367104	2022-02-11 11:18:01.353326
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.schema_migrations (version) FROM stdin;
20220331224759
20220331204131
20220331222052
20220331223522
20220406153731
20220702222104
20220703004311
20220909224320
\.


--
-- Data for Name: section_translations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.section_translations (id, section_id, locale, title, body, created_at, updated_at) FROM stdin;
2	2	ca	agraïments 	<p>(f&egrave; d&#39;errata)a la p&agrave;gina dels cr&egrave;dits hauria de figurar, escrit a m&agrave;:</p>\r\n\r\n<p>Agra&Iuml;da</p>\r\n\r\n<p>a les saurines de idees,<br />\r\nal pare Jordi i als meus,<br />\r\nals amables del cam&iacute;<br />\r\ni a tot all&ograve; que m&#39;atrau i em permet veure m&eacute;s enll&agrave; de la forma. &nbsp;<br />\r\nA tu.</p>\r\n	2013-04-05 18:53:18.947731	2013-04-05 18:53:18.947731
1	1	ca	CANON de SINEQUANONS	<p>veure per crear<br />\r\ncrear per veure<br />\r\nviure per veure<br />\r\n(i da capo)</p>\r\n	2013-04-05 18:53:18.922375	2013-04-05 18:56:47.263267
3	3	ca		<p>Equilibri, de aequilibrium: aequus = igual i libra=balan&ccedil;a, pes i aqu&iacute;. i a qui? libris: dels llibres o dels lliures. libertas: tornar a la mare</p>\r\n\r\n<p>Fragment del proc&eacute;s d&#39;equilibri de lectures obertes i creuades del pes propi i l&#39;exterior, del cos &iacute;ntim davant del cos p&uacute;blic dels factors intencionats o involuntaris, de l&#39;acci&oacute; de forces que implico o s&#39;impliquen i contrarresten m&uacute;tuament, dels vincles de la paraula-veu i la paraula-paper, paper del lligam, de la (con)fusi&oacute; dels estrats de percepci&oacute; i mem&ograve;ria en l&#39;harmonia de la unitat.</p>\r\n\r\n<p>Els factors (sempre) canviants neguen un estat d&#39;equilibri estable, un resultat, i evidencien un proc&eacute;s pur d&#39;infinit moviment tendint a la justesa i l&#39;harmonia en la unitat.</p>\r\n\r\n<p>...Et qui est libre?</p>\r\n	2013-04-05 19:05:21.9985	2013-04-05 19:05:21.9985
4	4	ca		<p>Fruit d&#39;un proc&eacute;s d&#39;anada i tornada de creaci&oacute; po&egrave;tica que s&#39;endinsa en els llenguatges de la paraula, el tra&ccedil; pict&ograve;ric i l&#39;expressi&oacute; corporal, dues artistes presenten aquesta exposici&oacute; i una performance.</p>\r\n	2013-04-05 19:27:48.604621	2013-04-05 19:27:48.604621
5	5	ca	EXPERIMENTAL ROOM FESTIVAL	<p>EXPERIMENTAL ROOM FESTIVAL<br />\r\nExperiencias esc&eacute;nicas &iacute;ntimas y personales en espacios no convencionales1&ordf; edici&oacute;n Performance, Teatro Experimental, Nuevas Dramaturgias, Arte Vivo, Arte de Acci&oacute;n&hellip;<br />\r\nConcepto y direcci&oacute;n: Mar&iacute;a Stoyanova Organiza:&nbsp;Atelier Esc&egrave;nic Stoyanova, La Ch&aacute;chara Espai d&rsquo;art i ideas y Colectivo Irimi<br />\r\nEXPERIMENTAL ROOM FESTIVAL PROGRAMA de las PERFORMANCES d&iacute;as&nbsp;12, 13 y 14 de julio&nbsp;del 2013<br />\r\nViernes, 12<br />\r\n19:00h Apertura oficial del festival 19:30h Performance/Acci&oacute;n a cargo de Mireia Zantop (Performer y artista pl&aacute;stica) &ndash; Artista invitada 20:30h &ldquo;Alquimia para los que todav&iacute;a no encontraron su lugar&rdquo; de Beatriz L&oacute;pez 21:30h &ldquo;1&rsquo;40&times;2&rsquo;00&rdquo; de Bea Gonz&aacute;lez 23:00h &ldquo;M&aacute;s all&aacute; de mi rinc&oacute;n&rdquo; de Ana Laura L&oacute;pez *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Cartas a Lars Von Trier&rdquo; de Gemma Ingl&eacute;s *** DJ SergiOh<br />\r\nS&aacute;bado, 13<br />\r\n17:00h &ldquo;Ra&iacute;ces &ndash; memorias para no olvidar&rdquo; de Carmen Sillero 18:30h &ldquo;Alquimia para los que todav&iacute;a no encontraron su lugar&rdquo; de Beatriz L&oacute;pez 20:00h Nick Prescott (concierto) &ndash; Artista invitado 21:30h &ldquo;Soy m&aacute;s fea de lo que parezco&rdquo; de Sonia Ezquerra *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Los rostros del silencio&rdquo; de Carmina P&eacute;rez *** DJ SergiOh<br />\r\nDomingo, 14<br />\r\n17:00h Acciones Colectivo IRIMI 18:00h &ldquo;Desaparecer&rdquo; de Graciela Contreras 19:30h &ldquo;M&aacute;s all&aacute; de mi rinc&oacute;n&rdquo; de Ana Laura L&oacute;pez 20:30h &ldquo;L&iacute;nea y Nudo &ndash; mitolog&iacute;a griega contempor&aacute;nea&rdquo; de Alkyoni Bouchalaki *** Instalaci&oacute;n &ndash; performance de larga duraci&oacute;n &ndash; &ldquo;Sin colorantes ni az&uacute;cares a&ntilde;adidos&rdquo; de Konstantina Titkova 22:00h Cierre del festival<br />\r\nArtistas invitados: Mireia Zantop, SergiOh! dj y Nick Prescott (m&uacute;sica) entre otros.<br />\r\nProducci&oacute;n ejecutiva: Karel Mena Dise&ntilde;o de iluminaci&oacute;n: Toni Alonso Audiovisuales: EAST SIDE CONNECTION Servicio de catering: &ldquo;El nieto de la yaya&rdquo;<br />\r\n**Todas las performances, excepto las de los artistas invitados, son fruto del trabajo realizado dentro del #Laboratorio de solos del Atelier Esc&eacute;nic Stoyanova<br />\r\nTeasers de las performances:&nbsp;https://vimeo.com/channels/experimentalroom<br />\r\nBono contribuci&oacute;n: 10&euro; por d&iacute;a<br />\r\nPLAZAS LIMITADAS Reservas al mail: atelierescenic@gmail.com<br />\r\nLUGAR: La Ch&aacute;chara espai d&rsquo;art i ideas, carrer d&rsquo;n Blanco, 15 &ndash; Pl. de Sants, Barcelona<br />\r\nM&aacute;s informaci&oacute;n:<br />\r\nwww.atelierescenic.com www.lachachara.info www.mariastoyanova.com</p>\r\n\r\n<p>&nbsp;</p>\r\n	2013-09-05 14:59:31.659478	2013-09-05 14:59:31.659478
6	6	ca		<p>Accions:</p>\r\n\r\n<p>1.Sols cal&ccedil;ats i Skip</p>\r\n\r\n<p>2. Homenatge a l&#39;operari, Niu</p>\r\n\r\n<p>3. La bolsa, la vida</p>\r\n\r\n<p>4. trio de cordes</p>\r\n\r\n<p>5. trio global</p>\r\n\r\n<p>6. Circuit cons</p>\r\n\r\n<p>7. Atac al cor</p>\r\n\r\n<p>8. Composici&oacute; aleat&ograve;ria en equilibri</p>\r\n\r\n<p>9. los murmuradores</p>\r\n\r\n<p>10. Psicomantra</p>\r\n\r\n<p>11. Amar a la ramA</p>\r\n\r\n<p>Video-accions:</p>\r\n\r\n<p>1. trampA (Homenatge a B)</p>\r\n\r\n<p>2. Fluxus</p>\r\n\r\n<p>3. unOu</p>\r\n\r\n<p>4.tacones sobre ruedas</p>\r\n\r\n<p>5. Ritme mut</p>\r\n\r\n<p>6.Escletxa de censura</p>\r\n\r\n<p>7. S&oacute;c soc</p>\r\n\r\n<p>8.Faldilles al vent</p>\r\n\r\n<p>9. Hombres fritos</p>\r\n\r\n<p>10.GlobOus</p>\r\n\r\n<p>11. Tres al plat</p>\r\n	2013-12-06 12:49:29.115728	2013-12-06 13:33:49.832649
7	6	en		<p>Accions:</p>\r\n\r\n<p>1.Sols cal&ccedil;ats i Skip</p>\r\n\r\n<p>2. Homenatge a l&#39;operari, Niu</p>\r\n\r\n<p>3. La bolsa, la vida</p>\r\n\r\n<p>4. trio de cordes</p>\r\n\r\n<p>5. trio global</p>\r\n\r\n<p>6. Circuit cons</p>\r\n\r\n<p>7. Atac al cor</p>\r\n\r\n<p>8. Composici&oacute; aleat&ograve;ria en equilibri</p>\r\n\r\n<p>9. los murmuradores</p>\r\n\r\n<p>10. Psicomantra</p>\r\n\r\n<p>11. Amar a la ramA</p>\r\n\r\n<p>Video-accions:</p>\r\n\r\n<p>1. trampA (Homenatge a B)</p>\r\n\r\n<p>2. Fluxus</p>\r\n\r\n<p>3. unOu</p>\r\n\r\n<p>4.tacones sobre ruedas</p>\r\n\r\n<p>5. Ritme mut</p>\r\n\r\n<p>6.Escletxa de censura</p>\r\n\r\n<p>7. S&oacute;c soc</p>\r\n\r\n<p>8.Faldilles al vent</p>\r\n\r\n<p>9. Hombres fritos</p>\r\n\r\n<p>10.GlobOus</p>\r\n\r\n<p>11. Tres al plat</p>\r\n	2014-05-17 12:23:54.028142	2014-05-17 12:23:54.036694
8	7	ca	Informe de Carles H. Mor	<p>POESIA ALS PARCS 2014</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>ESPAI NATURAL DE LES GUILLERIES-SAVASSONA<br />\r\nDATA: diumenge 12 d&#39;octubre.</p>\r\n\r\n<p>MUNICIPI: Tav&egrave;rnoles.</p>\r\n\r\n<p>HORA: 12 h.</p>\r\n\r\n<p>ACTES: Recital de poesia.</p>\r\n\r\n<p>LLOC: Ermita de Sant Feliuet de Savassona.</p>\r\n\r\n<p>Temps meteorol&ograve;gic: bo.</p>\r\n\r\n<p>Puntualitat de l&#39;acte: el quart d&rsquo;hora acad&egrave;mic.</p>\r\n\r\n<p>Puntualitat del p&uacute;blic: el quart d&rsquo;hora acad&egrave;mic.</p>\r\n\r\n<p>Presentaci&oacute; de l&#39;acte: Carles Hac Mor i Ester Xargay.</p>\r\n\r\n<p>Autoria de l&#39;acte: Daniel Ruiz-Trillo i Mireia Zantop.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Cadires: pedrissos, un banc i un parell de cadires.</p>\r\n\r\n<p>Assist&egrave;ncia: unes trenta persones.</p>\r\n\r\n<p>Acceptaci&oacute; del p&uacute;blic: molt bona, i amb una gran participaci&oacute;.<br />\r\nDifusi&oacute;: la pr&ograve;pia de Poesia als Parcs.</p>\r\n\r\n<p>Observacions: A difer&egrave;ncia de l&#39;any passat, enguany al recital no hi va acudir cap gos, i aquesta manca sobtada d&#39;inter&egrave;s can&iacute; per la poesia va ser comentada per tothom. En canvi, la pres&egrave;ncia de formigues va ser notable, fins al punt que una de les corrues d&#39;aquests insectes va traspassar l&#39;entrep&agrave; d&#39;un nen que aix&iacute; es va quedar sense esmorzar, mentre una dona ja gran era atacada per una mena de mosquit que va sortir furiosament de la porta de l&#39;ermita, tal vegada impulsat per un rampell l&iacute;ric de Sant Feliuet. I el m&eacute;s curi&oacute;s de tot &eacute;s que tant els poemes del poeta com els de la poetessa van fer joc amb aquelles manifestacions insect&iacute;voles. En efecte, hi van predominar els poemes molt breus, alguns de min&uacute;sculs, i tots d&#39;una gran qualitat subtil, enginyosa i personal, amb un humor tothora delicat que va captivar els espectadors. El recital pr&ograve;piament dit va acabar amb una acci&oacute; po&egrave;tica, proposada per Mireia Zantop i que va consistir en la confecci&oacute; i el llan&ccedil;ament d&#39;avions de paper des de les grans pedres que fan de mirador sobre el riu Ter. Per acabar, hi va haver dos espontanis: l&#39;ermit&agrave; i c&egrave;lebre folklorista Xavier Rovir&oacute; va recitar de mem&ograve;ria un poema llarg de Moss&egrave;n Cinto Verdaguer que versava sobre la vida sexual de dos rius d&#39;aquella comarca; i una noia, que llu&iuml;a una samarreta verda que s&#39;adeia amb tots els colors del verd d&#39;aquell paratge, va expressar en silenci, subliminalment, unes emocions tan &iacute;ntimes i excelses que nom&eacute;s van ser captades pels espectadors m&eacute;s atents.</p>\r\n	2015-01-04 22:05:21.186616	2015-01-04 22:05:21.186616
9	8	ca	Descripció/Notes	<p>En entrar a la sala, cada persona que vol, obt&eacute; un(a) clau. Ning&uacute; el rebutja.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Inici: estirada al terra sota una escala de pintor obertA. En cada esgla&oacute; hi ha clavats claus que impedeixen pujar-hi. Amb la mobilitat limitada, allibero les mans. Un clau en la m&agrave; esquerra, trec del cor una clau amb la dreta (estava calenta). A l&#39;inrev&eacute;s, observo el p&uacute;blic, a trav&eacute;s de l&#39;ull de la clau i amb la punta del clau dirigida a la mirada.</p>\r\n\r\n<p>Observo l&#39;escala des del terra. Decisi&oacute;: inici d&#39;acci&oacute;. Surto de sota, m&#39;aixeco. Dic: cap esclau!</p>\r\n\r\n<p>Amb un martell pico un a un els claus dels travessers de fusta, que cauen al terra.</p>\r\n\r\n<p>Recito articulant, en silenci, el poema ...cau l&#39;esclau, i l&#39;esclau de l&#39;esclau...</p>\r\n\r\n<p>Silenci.</p>\r\n\r\n<p>Comen&ccedil;o a recollir els claus del terra clavant-los en una bossa teixida que duc sobre el cor. Quan ja no hi ha claus al terra, cau un clau del p&uacute;blic.</p>\r\n\r\n<p>I un altre.</p>\r\n\r\n<p>I comencen a ploure claus a l&#39;escenari.</p>\r\n\r\n<p>Algunes persones baixen i els porten en m&agrave;. Accelero, m&#39;emociono, recullo fins a l&#39;&uacute;ltim clau que tira en Carles H. El convido a apropar-se. ?. Denys recull el clau i me&#39;l posa a la bossa.</p>\r\n\r\n<p>Pujo a l&#39;escala. En el pen&uacute;ltim esgla&oacute;, em despenjo la bossa, i, amb les punxes de tots els claus mirant enfora, me la poso al cap:</p>\r\n\r\n<p>cap &eacute;s clau.</p>\r\n\r\n<p>M&agrave; al cor.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>En passejar per la ciutat amb l&#39;escala sota el bra&ccedil;, li enviava somriures a en Joan Brossa.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Era acci&oacute; oberta a uns quants fins. Podia avan&ccedil;ar de diferents maneres, sola, amb participaci&oacute; o pres&egrave;ncia dels presents. O no. La certesa es revela durant.</strong></p>\r\n\r\n<p><strong>A partir del moment en que l&#39;acci&oacute; esdev&eacute;, pren la seva forma imaginable.</strong></p>\r\n	2015-01-04 23:00:44.736057	2015-01-04 23:00:44.736057
10	9	ca		<p><br />\r\nad hoc<br />\r\n<br />\r\ncreated or done for a particular purpose as necessary<br />\r\n&nbsp;</p>\r\n	2015-09-20 18:10:41.196442	2015-09-20 18:10:41.196442
11	10	ca	Corpologia 24	<p><a href="http://corpologialiveart.blogspot.com.es">http://corpologialiveart.blogspot.com.es</a></p>\r\n\r\n<p>CORPOLOGIA&nbsp;es una trobada independent y lliure d&#39;un grup d&#39;artistes y persones amb ganes d&#39;investigar el present a trav&eacute;s de l&#39;acci&oacute;. El format de las obres &eacute;s lliure y d&#39;una m&agrave;xima duraci&oacute; de 10 minuts cada una.</p>\r\n	2016-10-19 22:54:30.223207	2017-02-19 20:55:04.320584
12	11	ca		<p>S&oacute;c a</p>\r\n\r\n<p>amb</p>\r\n\r\n<p>de</p>\r\n\r\n<p>en</p>\r\n\r\n<p>S&oacute;c entre</p>\r\n\r\n<p>per</p>\r\n\r\n<p>contra</p>\r\n\r\n<p>S&oacute;c segons</p>\r\n\r\n<p>sense</p>\r\n\r\n<p>cap</p>\r\n\r\n<p>a for&ccedil;a de</p>\r\n\r\n<p>cos</p>\r\n\r\n<p>S&oacute;c en part</p>\r\n\r\n<p>des de</p>\r\n\r\n<p>fins a</p>\r\n\r\n<p>vers</p>\r\n\r\n<p>S&oacute;c tamb&eacute;</p>\r\n\r\n<p>igual a</p>\r\n\r\n<p>diferent de</p>\r\n\r\n<p>S&oacute;c , a m&eacute;s,</p>\r\n\r\n<p>a causa de</p>\r\n\r\n<p>al costat de</p>\r\n\r\n<p>front a (tu)</p>\r\n\r\n<p>en proc&eacute;s.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>S&oacute;c qui viu, veu, veus, vols veure?</p>\r\n\r\n<p>Mireia Zantop</p>\r\n	2017-06-01 22:46:09.178191	2017-06-01 22:46:09.178191
13	12	ca	Per se	<p>(by itself, in itself, of itself, through itself, itself as such, in essence, by bit&#39;s very nature, essentially)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Una persona, un objecte &ndash; &eacute;s ... per s&iacute; mateix?</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>O es defineix a trav&eacute;s de l&#39;acci&oacute;?</p>\r\n\r\n<p>La intenci&oacute;?</p>\r\n\r\n<p>La interpretaci&oacute;?</p>\r\n	2018-08-22 15:12:28.290697	2018-08-22 15:12:28.290697
14	13	ca		<p><strong>Acci&oacute;</strong> a amb de entre per contra segons sense com fins a en part a for&ccedil;a de vers des de a causa de igual a diferent de d&#39;acord amb en relaci&oacute; a en proc&eacute;s</p>\r\n\r\n<p><strong>de rastres i creences d&#39;identitats estimades.</strong></p>\r\n	2018-08-22 15:22:59.124479	2018-08-22 15:22:59.124479
15	14	ca		<p>En aquesta acci&oacute;/instal.laci&oacute;&nbsp; es relacionen aspectes dels llenguatges del cos alhora subtils i essencials en la nostra comunicaci&oacute; quotidiana. En ser ef&iacute;mers, el sentit del seu rastre canvia en tota lectura posterior.</p>\r\n\r\n<p>L&#39;articulaci&oacute; d&#39;alguns alfabets naturals i culturals a trav&eacute;s del cos tindr&agrave; lloc en l&#39;acci&oacute; de llarga durada creada espec&iacute;ficament in situ, en interacci&oacute; amb l&#39;entorn per fer i desfer poesia sonora. Cada moviment, cada tra&ccedil;, cada fonema besar&agrave; l&#39;ara. El que queda, s&oacute;n formes per reviure o reinterpretar, arqueologies de la mem&ograve;ria.</p>\r\n	2019-06-10 21:35:33.861986	2019-06-10 21:35:33.861986
16	15	ca	estimat paisatge interior i exterior	<p>Estimat paisatge, temple que contemplo mentre em contempla. Sobre el paper et dilueixes; es desdibuixa aquella definici&oacute; de &laquo;la porci&oacute; de territori que l&#39;ull pot recon&egrave;ixer i representar des d&#39;un punt de vista&raquo;. Flueixes cos endins per tots els meus &ograve;rgans de percepci&oacute;, que inclouen el sis&egrave; sentit. Com l&#39;humus inconscient que nodreix i acompanya en el ritual de pas pel propi panorama, tan &iacute;ntim i tan com&uacute;, que aflora en forma d&#39;obra.</p>\r\n\r\n<p>La mirada, serena i salvatge, balla per aquests paratges interiors i exteriors perqu&egrave; vol veure m&eacute;s, i genera interrogants. Sorgeixen imatges que em guien pel bosc intu&iuml;tiu on les seves formes es tornen significants.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>El paisatge l&iacute;quid beu de moltes fonts i s&#39;expressa de moltes maneres. Associa conceptes, creences i formes. L&#39;articulen llenguatges familiars conjuntament amb altres interpretacions subjectives. Una visi&oacute; que s&#39;expressa per ser compartida, per&ograve; fluctua per diferents nivells de lectura. Com una persona, com una poesia, com una acci&oacute;.</p>\r\n	2020-02-19 17:23:07.100032	2020-02-19 17:23:07.100032
17	16	ca		<p><strong>acci&oacute;-homenatge</strong> al silenci propi</p>\r\n\r\n<p>del flu&iuml;r en el pas del temps</p>\r\n\r\n<p>gota a gota</p>\r\n\r\n<p>ress&ograve; del proc&eacute;s en trans-formaci&oacute; amb la mat&egrave;ria (pr&ograve;pia)</p>\r\n\r\n<p>rastre de l&#39;escolta en obrir-se pas endins</p>\r\n	2020-02-19 18:07:36.347754	2020-02-19 18:09:01.872951
18	17	ca		<p>Obrint-se cam&iacute; a partir de la resson&agrave;ncia interna sentida en apropar-me a l&rsquo;obra de la F.F., l&rsquo;acci&oacute; &eacute;s el boc&iacute; d&rsquo;un moment de pas cap a all&ograve; inestable i immaterial. Vol honrar-lo amb la pres&egrave;ncia i convidar tant els lligams com els llindars entre la l&iacute;rica del so de sorra i/o seda , i la intuici&oacute; que es desperta de la m&agrave; del ritme impr&egrave;s en blanc sense negre, en el si del tant s&iacute; com no, en l&rsquo;I/O. Una proposta del mo(vi)ment visible com a vas comunicant i/o acord i/o simbiosi i/o vaiv&eacute; entre buits i plens. Per veure i viure la forma. L&rsquo;acci&oacute; comen&ccedil;a i acaba, i alhora desitja tra&ccedil;ar el brot d&rsquo;un par&egrave;ntesi dins de POESIA, sense article. &Eacute;s la teva i la meva, la del n&uacute;vol i la de la Fel&iacute;cia.</p>\r\n	2021-04-08 21:31:03.869212	2021-04-08 21:31:03.869212
19	18	ca	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-09-20 19:33:22.583899	2021-09-20 20:07:27.515731
21	18	en	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-09-20 20:36:36.420693	2021-09-20 20:36:36.423914
27	20	es		<p>* cap cap, t&iacute;tulo intraducible</p>\r\n\r\n<p>cap, del catal&aacute;n: cabeza, cabo, ning&uacute;n, ninguna, cabe</p>\r\n	2022-01-05 21:06:26.091128	2022-01-05 21:06:26.091128
23	19	es	(Questions) about going to and going away from	<p>The fortune&rsquo;s roulette turns the wheel and it&rsquo;s cycles of repetition, range and power. I hear ancestral<br />\r\nvoices and dream where the bird will nest best. An inner dissociation when moving: Which parts<br />\r\nleave, which parts do not leave?<br />\r\nDiaspora of the genome, not just my own, perhaps an appropriated, adopted one. How long is the<br />\r\nwhile I&rsquo;m neither/nor or still/not yet?<br />\r\nIs the present self a place of permanence, an axis? Do migratory birds flight to or flight from? A<br />\r\ngeneration later, do you go to or come back to? Progress-process idea. What pulls or pushes the<br />\r\ndirection and intention of a step: motivation or fear? Do I move or am I being displaced?<br />\r\nMoving from a safe place like going beyond the known. The horizon, as a nonexisting place, a<br />\r\nvisual illusion, a utopian dartboard, moves as we approach. What vision do you need to start<br />\r\nwalking?</p>\r\n	2021-09-26 20:13:57.516416	2021-09-26 20:13:57.525946
24	17	es		<p><br />\r\nLa acci&oacute;n se abre camino a partir de la resonancia interna sentida al acercarme a la obra de F.F., es el pedazo de un momento hacia aquello inestable e inmaterial. Quiere honrarlo con la presencia e invitar tanto los v&iacute;nculos como los umbrales entre la l&iacute;rica del sonido de arena y/o seda, y la intuici&oacute;n que se despierta de la mano del ritmo impreso y presente en blanco sin negro, en el seno del tanto s&iacute; como no, en el I/O. Una propuesta de lo visible como vaso comunicante y/o acuerdo y/o simbiosis y/o vaiv&eacute;n entre vac&iacute;os y llenos. Para ver y vivir la forma. La acci&oacute;n empieza y acaba, y a la vez desea trazar, como un brote, un par&eacute;ntesis dentro de POES&Iacute;A, sin art&iacute;culo. Es la tuya y es la m&iacute;a, la de la nube y la de la Fel&iacute;cia.<br />\r\n&nbsp;</p>\r\n	2021-09-26 20:50:13.263036	2021-09-26 20:50:13.265396
28	13	es		<p><strong>Acci&oacute;n</strong> a con de entre por para contra seg&uacute;n sin como hasta en parte a fuerza de hacia desde a causa de igual a diferente de de acuerdo con en relaci&oacute;n a en proceso</p>\r\n\r\n<p><strong>de rastros y creencias de identitades estimadas.</strong></p>\r\n	2022-01-05 21:12:29.954599	2022-01-05 21:12:29.95691
25	18	es	Ull viu! agulles	<p>Responent al repte microscopista de fer visible l&rsquo;invisible, retorcem el llenguatge. Plantats davant la majestuositat tel&middot;l&uacute;rica del Montserrat, aquest indret qu&agrave;ntic que &eacute;s lleuger i pesat, lluny&agrave; i proper i tou i dur, i alguns ant&ograve;nims simultanis m&eacute;s, des dels plans de la Torre Lluvi&agrave; posem fil a l&rsquo;agulla i parem compte, ull viu! Seguint el fil de les agulles plantem una composici&oacute; ressonant, una perspectiva significativa que conviu amb les altres, po&egrave;tiques, est&egrave;tiques, presents.</p>\r\n\r\n<p>Observem el fet petit (des d&rsquo;aqu&iacute;). Construint, com dibuixant, mirem, coneixem i potser reconeixem. Reconeixem la pulsi&oacute; ancestral per la connexi&oacute; vertical terra-cel; el menhir, el xiprer, les agulles de Montserrat...</p>\r\n\r\n<p>Ens agrada fer torres de cagarrines a la platja i ens magnetitza el mass&iacute;s petri i aqu&iacute; juguem, perqu&egrave; art i joc s&oacute;n matisos, s&oacute;n llu&iuml;ssors d&rsquo;un mateix ser.</p>\r\n\r\n<p>Juguem amb els elements agr&iacute;coles i la seva tecnologia, el paisatge ind&ograve;mit i el domesticat.</p>\r\n\r\n<p>Juguem amb l&rsquo;escala, la mida i la mesura, la posici&oacute; de l&rsquo;espectador, l&rsquo;hum&agrave; que veu el m&oacute;n, el fons, la figura i una ambig&uuml;itat meton&iacute;mica manifesta en la seva cohabitaci&oacute;.</p>\r\n\r\n<p>Juguem amb els ingredients transrealistes i amb els codis propis dels llenguatges en joc.</p>\r\n\r\n<p>Conjuguem.</p>\r\n\r\n<p>Aleix Antillach i Mireia Zantop : Col&middot;laboren intermitentment,</p>\r\n\r\n<p>mesclant els seus mons, fets de disciplines i indisciplines</p>\r\n\r\n<p>diverses. L&rsquo;arquitectura, la dansa, la performance, les arts</p>\r\n\r\n<p>visuals i les lletres. Inquiets tastaolletes, de gra i de palla.</p>\r\n	2021-11-19 21:41:37.129367	2021-11-19 21:41:37.13267
22	19	en	(Preguntas) sobre ir a y alejarse de	<p><strong>Migraci&oacute;n: (Preguntas) sobre ir a y alejarse de</strong></p>\r\n\r\n<p>Gira la rueda de la fortuna con sus ciclos de repetici&oacute;n, rango y poder. Escucho</p>\r\n\r\n<p>voces ancestrales, sue&ntilde;o sobre d&oacute;nde anidar&aacute; mejor el p&aacute;jaro. Percibo una disociaci&oacute;n interna al moverme: qu&eacute; partes se van, &iquest;qu&eacute; partes se quedan?</p>\r\n\r\n<p>Di&aacute;spora del genoma, no solo el m&iacute;o, tal vez uno apropiado, adoptado. &iquest;Cu&aacute;nto dura el lapso del &ldquo;no soy ni de aqu&iacute; ni de all&iacute;&rdquo;, o del &ldquo;soy todav&iacute;a y a&uacute;n no soy&rdquo;.</p>\r\n\r\n<p>&iquest;Es el yo presente un lugar de permanencia, un eje? &iquest;Las aves migratorias vuelan hacia o se van de un lugar? Una generaci&oacute;n despu&eacute;s, &iquest;vas o vuelves? Idea de progreso-proceso. Lo que estira o empuja la direcci&oacute;n y la intenci&oacute;n de un paso es motivaci&oacute;n? O es miedo? &iquest;Me mudo o estoy siendo desplazada?</p>\r\n\r\n<p>Salir de un lugar seguro es como ir m&aacute;s all&aacute; de lo conocido. El horizonte, como lugar inexistente, es una ilusi&oacute;n visual, una diana ut&oacute;pica, que se aleja a medida que nos acercamos.</p>\r\n\r\n<p><strong>&iquest;Qu&eacute; visi&oacute;n necesitas para empezar a caminar?</strong></p>\r\n	2021-09-26 16:57:03.763881	2021-11-20 13:33:41.376534
26	15	es	estimado paisaje interior y exterior	<p>Estimado paisaje, templo que contemplo mientras me contempla. Sobre el papel te diluyes; se desdibuja aquella definici&oacute;n de &laquo;la porci&oacute;n de territorio que el ojo puede reconocer y representar des de un punto de vista&raquo;. Fluyes cuerpo adentro por todos mis &oacute;rganos de percepci&oacute;n, que inclyen el sexto sentido. Como el humus del inconsciente que nutre y acompa&ntilde;a en el ritual de paso por el propio panorama, un lugar tan &iacute;ntimo i tan com&uacute;n, que aflora y toma forma de obra.</p>\r\n\r\n<p>La mirada, serena y salvaje, baila por estos parajes interiores y exteriores porque quiere ver m&aacute;s, y sigue el ritmo que generan los interrogantes. Surgen im&aacute;genes que me gu&iacute;an por el bosque intuitivo all&iacute; donde sus formas se vuelven significativas.</p>\r\n\r\n<p>El paisatge l&iacute;quido bebe de muchas fuentes y se materializa de muchas maneras. Asocia conceptos, creencias y formas. Lo articulan lenguajes familiares conjuntamente con otras interpretaciones subjectivas. Una visi&oacute;n que se expresa para ser compartida, pero fluct&uacute;a por diferentes niveles de lectura. Como una persona, como una poes&iacute;a, como una acci&oacute;n.</p>\r\n	2022-01-05 20:33:13.000204	2022-01-10 11:24:54.457683
29	14	es		<p>En esta acci&oacute;n/instalaci&oacute;n se relacionan diferentes aspectos&nbsp;tan sutiles como esenciales de los lenguajes corporales que usamos en nuestra comunicaci&oacute;n cotidiana. Al ser ef&iacute;meros, el sentido de su rastro cambia en tota lectura posterior.</p>\r\n\r\n<p>La articulaci&oacute;n de algunos alfabetos naturales y culturales a trav&eacute;s del cuerpo tiene lugar en la acci&oacute;n de larga durada creada espec&iacute;ficamente in situ, en interacci&oacute;n con el entorno para hacer y deshacer poes&iacute;a sonora. Cada movimiento, cada trazo, cada fonema besar&aacute; el ahora. Lo que queda, son formas para ser reinterpretadas: arqueolog&iacute;as de la memoria.</p>\r\n	2022-01-10 11:45:29.806785	2022-01-10 11:45:29.809207
30	9	es		<p><br />\r\nad hoc<br />\r\n<br />\r\ncreated or done for a particular purpose as necessary<br />\r\n&nbsp;</p>\r\n	2022-01-10 11:49:06.034632	2022-01-10 11:49:06.037286
20	19	ca	(Preguntes) sobre l'anar cap a o l'anar-se'n de	<p>La ruleta de la fortuna gira la seva roda en cicles de repetici&oacute;, rang i pot&egrave;ncia. Escolto&nbsp;veus ancestrals<br />\r\n&nbsp;i somnio on l&#39;ocell nia millor. Una dissociaci&oacute; interna mentre ens movem: Quines parts marxen, quines parts es resisteixen a marxar?<br />\r\nDi&agrave;spora del genoma, no nom&eacute;s la meva, potser una altra, apropiada perqu&egrave; l&#39;hem adoptat. Quant de temps hi ha<br />\r\nmentre no soc ni d&#39;aqu&iacute;/ni d&#39;all&agrave; o encara no he marxat del tot / encara no he arribat?<br />\r\nL&#39;un mateix, present, &eacute;s un lloc de perman&egrave;ncia, un eix? Els ocells migradors van o venen de? Una<br />\r\ngeneraci&oacute; m&eacute;s tard, els fills van a o tornen a? La idea del proc&eacute;s en progr&eacute;s. Qu&egrave; &eacute;s el que estira o empeny, marcant la<br />\r\ndirecci&oacute; i la intenci&oacute; d&#39;un pas: motivaci&oacute; o por? Em moc o estic sent despla&ccedil;at?<br />\r\nMarxar d&#39;un lloc segur &eacute;s com anar m&eacute;s enll&agrave; del que coneixem. L&#39;horitz&oacute;, com a lloc inexistent, una il&middot;lusi&oacute; visual, un quadre d&#39;art ut&ograve;pic, es mou a mesura que ens apropem. Quina visi&oacute; necessites per comen&ccedil;ar a caminar?</p>\r\n	2021-09-20 20:29:33.796924	2022-01-13 20:54:16.135356
\.


--
-- Data for Name: sections; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.sections (id, "position", created_at, updated_at, work_id) FROM stdin;
1	1	2013-04-05 18:53:18.872714	2013-04-05 18:56:47.25782	29
2	2	2013-04-05 18:53:18.942055	2013-04-05 18:56:47.269763	29
3	1	2013-04-05 19:05:21.993125	2013-04-05 19:05:21.993125	9
15	1	2020-02-19 17:23:07.09484	2022-01-10 11:24:54.455101	74
14	1	2019-06-10 21:35:33.857657	2022-01-10 11:45:58.774972	75
6	1	2013-12-06 12:49:29.105921	2014-05-17 12:23:54.024482	33
9	1	2015-09-20 18:10:41.186507	2022-01-10 11:49:06.032702	38
19	1	2021-09-20 20:29:33.793828	2022-01-13 20:54:16.132685	87
7	1	2015-01-04 22:05:21.141442	2015-01-04 22:13:33.949414	42
8	1	2015-01-04 23:00:44.731254	2015-01-04 23:21:25.201969	43
5	1	2013-09-05 14:59:31.645367	2015-09-20 18:04:25.996863	31
4	1	2013-04-05 19:27:48.599027	2015-09-25 01:15:09.45399	8
10	1	2016-10-19 22:54:30.208476	2017-06-02 00:09:34.299605	56
12	1	2018-08-22 15:12:28.282722	2018-12-21 20:19:42.844153	66
11	1	2017-06-01 22:46:09.171663	2019-03-07 22:10:16.100687	59
16	1	2020-02-19 18:07:36.343326	2020-02-19 18:09:01.869408	81
17	1	2021-04-08 21:31:03.854723	2021-09-26 20:50:13.261414	85
18	1	2021-09-20 19:33:22.580133	2022-01-05 20:16:55.139998	88
20	1	2022-01-05 21:06:26.087117	2022-01-05 21:06:26.087117	72
13	1	2018-08-22 15:22:59.119266	2022-01-05 21:12:29.953006	67
\.


--
-- Data for Name: tag_translations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.tag_translations (id, tag_id, locale, name, created_at, updated_at) FROM stdin;
1	1	ca	dansa	2012-10-29 18:42:31.571497	2012-10-29 18:42:31.577401
5	1	en	dance	2012-10-29 18:55:28.185695	2012-10-29 18:55:28.188629
6	1	es	danza	2012-10-29 18:55:28.203152	2012-10-29 18:55:28.206018
11	5	ca	corpologia	2013-01-04 20:22:42.068527	2013-01-04 20:22:42.072901
12	5	en	corpologia	2013-01-04 20:23:53.86588	2013-01-04 20:23:53.871008
13	5	es	corpologia	2013-01-04 20:23:53.887166	2013-01-04 20:23:53.891467
16	6	ca	pintura	2013-01-04 20:32:18.181964	2013-01-04 20:32:18.185506
17	6	en	paintings	2013-01-04 20:33:26.64173	2013-01-04 20:33:26.645905
18	6	es	pintura	2013-01-04 20:33:26.665072	2013-01-04 20:33:26.669174
19	7	ca	live-drawing	2013-01-04 20:49:45.14581	2013-01-04 20:49:45.160126
20	7	en	live-drawing	2013-01-04 20:50:30.286029	2013-01-04 20:50:30.290435
21	7	es	live-drawing	2013-01-04 20:50:30.303891	2013-01-04 20:50:30.307886
22	8	ca	obra sobre paper	2013-01-04 20:55:13.937664	2013-01-04 20:55:13.956217
24	10	ca	poesia	2013-01-04 21:08:26.95914	2013-01-04 21:08:26.963895
25	10	en	poetry	2013-01-04 21:11:24.221859	2013-01-04 21:11:24.227959
26	10	es	poesía	2013-01-04 21:11:24.255258	2013-01-04 21:11:24.260365
28	9	es	instalación	2013-01-04 21:11:42.508379	2013-01-04 21:11:42.513237
27	9	en	instalation	2013-01-04 21:11:42.472711	2013-01-04 21:11:51.336207
29	8	en	work on paper	2013-01-04 21:12:17.156945	2013-01-04 21:12:17.161399
31	11	ca	escultura	2013-01-05 00:55:50.504379	2013-01-05 00:55:50.509123
33	13	ca	dibuix	2013-01-05 01:30:12.283621	2013-01-05 01:30:12.288096
34	14	ca	obra gràfica original	2013-01-05 01:36:08.808897	2013-01-05 01:36:08.812854
35	11	en	sculpture	2013-01-05 01:59:37.246614	2013-01-05 01:59:37.250715
36	11	es	escultura	2013-01-05 01:59:37.269881	2013-01-05 01:59:37.273848
39	13	en	drawing	2013-01-05 01:59:46.100143	2013-01-05 01:59:46.103757
40	13	es	dibujo	2013-01-05 01:59:46.124759	2013-01-05 01:59:46.128962
41	14	en	prints	2013-01-05 01:59:49.082537	2013-01-05 01:59:49.086088
42	14	es	obra gráfica original	2013-01-05 01:59:49.105874	2013-01-05 01:59:49.110642
44	16	ca	llibre	2013-01-20 02:25:58.699001	2013-01-20 02:25:58.703181
45	16	en	book	2013-01-20 02:42:09.328749	2013-01-20 02:42:09.353698
46	16	es	libro	2013-01-20 02:42:09.380637	2013-01-20 02:42:09.386213
47	15	es	ilustración	2013-01-20 02:42:24.649838	2013-01-20 02:42:24.657849
48	15	en	illustration	2013-01-20 02:42:24.654556	2013-03-30 20:33:55.160105
30	8	es	obra sobre papel	2013-01-04 21:12:17.185276	2013-03-30 20:34:49.77027
49	17	ca	acció sonora	2013-04-05 15:02:44.212836	2013-04-05 15:02:44.212836
50	17	en	sound action	2013-04-05 15:05:57.103622	2013-04-05 15:05:57.109032
51	17	es	acción sonora	2013-04-05 15:05:57.131685	2013-04-05 15:05:57.136927
52	18	ca	acció poètica	2015-01-04 23:00:30.014269	2015-01-04 23:00:30.014269
53	19	ca	acció col.lectiva	2015-01-04 23:23:54.266821	2015-01-04 23:23:54.266821
72	26	es	land art	2019-06-10 20:06:02.696456	2021-09-20 19:37:15.657863
58	19	en	collective performance	2015-09-27 22:20:59.858286	2015-09-27 22:20:59.86496
59	19	es	acción colectiva	2015-09-27 22:20:59.894902	2015-09-27 22:20:59.901361
60	18	es	acción poética	2015-09-27 22:21:24.12161	2015-09-27 22:21:24.125633
61	21	en	performance	2015-09-27 22:22:41.625433	2015-09-27 22:22:41.629312
86	32	ca	procés col·lectiu	2021-09-26 16:49:29.317474	2021-09-26 16:54:23.544648
43	15	ca	il·lustració	2013-01-20 02:25:58.671586	2015-09-27 22:23:39.93387
23	9	ca	instal·lació	2013-01-04 21:08:26.90975	2015-09-27 22:23:41.159891
63	18	en	poetry	2015-09-27 22:24:47.425436	2015-09-27 22:24:47.431558
68	23	en	social art performance	2018-12-21 20:08:10.895393	2018-12-21 20:08:10.899257
69	23	es	acción artística social	2018-12-21 20:08:10.916252	2018-12-21 20:08:10.920072
62	21	es	performance	2015-09-27 22:22:41.646011	2019-06-10 20:05:38.566569
71	26	en	land-art	2019-06-10 20:06:02.680525	2019-06-10 20:06:02.685113
73	27	ca	poesia visual	2019-06-10 21:53:24.912377	2019-06-10 21:53:24.912377
74	27	en	visual poetry	2019-06-10 21:55:00.776565	2019-06-10 21:55:00.780318
75	27	es	poesía visual	2019-06-10 21:55:00.796799	2019-06-10 21:55:00.800596
76	28	ca	art participatiu	2020-06-15 15:27:55.71982	2020-06-15 15:27:55.71982
65	23	ca	acció artística social	2018-08-22 15:06:01.714501	2020-06-15 15:31:25.877684
78	28	en	participatory art	2020-06-15 15:33:25.599312	2020-06-15 15:33:25.603774
79	28	es	arte participativo	2020-06-15 15:33:25.623532	2020-06-15 15:33:25.627565
55	21	ca	performance	2015-01-05 00:13:25.84741	2020-09-21 12:34:56.352634
80	30	ca	video-acció	2021-04-08 21:30:55.593413	2021-04-08 21:30:55.593413
81	30	en	video performance	2021-04-08 21:31:43.373141	2021-04-08 21:31:43.377127
82	30	es	video-acción	2021-04-08 21:31:43.394487	2021-04-08 21:31:43.398584
83	31	ca	art efímer	2021-09-20 19:33:22.469007	2021-09-20 19:33:22.469007
84	31	en	ephemeral art	2021-09-20 19:37:01.103655	2021-09-20 19:37:01.106298
85	31	es	arte efímero	2021-09-20 19:37:01.117442	2021-09-20 19:37:01.119797
70	26	ca	land-art o art natura	2019-04-10 23:03:30.913316	2021-09-20 19:37:15.633959
89	32	en	group process	2021-09-26 16:54:23.555986	2021-09-26 16:54:23.558283
90	32	es	proceso colectivo	2021-09-26 16:54:23.568773	2021-09-26 16:54:23.571053
91	35	es	obra original sobre papel	2022-01-05 21:20:49.915559	2022-01-05 21:20:49.915559
92	35	ca	obra original sobre paper	2022-01-05 21:21:36.331446	2022-01-05 21:21:36.334137
93	35	en	original work on paper	2022-01-05 21:21:36.346476	2022-01-05 21:21:36.348953
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.tags (id, created_at, updated_at, slug_en, slug_es, slug_ca, taggings_count) FROM stdin;
13	2013-01-05 01:30:12.281032	2022-01-05 20:10:05.551677	drawing	dibujo	dibuix	2
32	2021-09-26 16:49:29.307532	2022-01-13 20:54:16.145591	group-process--4	proceso-colectivo	proces-col-lectiu	1
30	2021-04-08 21:30:55.578699	2022-01-13 20:54:16.146657	video-performance	video-accion	video-accio	2
21	2015-01-05 00:13:25.83929	2022-01-13 20:54:16.147283	performance--2	accion	performance	15
26	2019-04-10 23:03:30.908422	2022-01-05 21:43:08.666358	land-art	land-art	land-art-o-art-natura	4
35	2022-01-05 21:20:49.910361	2022-01-05 21:21:36.35917	original-work-on-paper	obra-original-sobre-papel	obra-original-sobre-paper	1
31	2021-09-20 19:33:22.462251	2022-01-05 20:16:55.151516	ephemeral-art	arte-efimero	art-efimer	1
19	2015-01-04 23:23:54.260462	2021-09-20 19:36:55.676141	collective-performance	accion-colectiva	accio-col-lectiva	4
17	2013-04-05 15:02:44.11078	2021-09-20 19:36:59.199289	sound-action	accion-sonora	accio-sonora	5
28	2020-06-15 15:27:55.712575	2021-09-20 19:37:03.235076	participatory-art	arte-participativo	art-participatiu	5
10	2013-01-04 21:08:26.956849	2022-01-10 11:45:58.784477	poetry--3	poesia	poesia	8
5	2013-01-04 20:22:42.066845	2021-09-20 19:37:04.749941	corpologia	corpologia	corpologia	11
8	2013-01-04 20:55:13.933435	2022-01-10 11:45:58.785941	work-on-paper	obra-sobre-papel	obra-sobre-paper	7
18	2015-01-04 23:00:30.003142	2022-01-10 11:45:58.786469	poetry--2	accion-poetica	accio-poetica	5
1	2012-10-29 18:42:31.567016	2021-09-20 19:37:06.339597	dance	danza	dansa	4
6	2013-01-04 20:32:18.180271	2019-06-10 21:02:35.326056	paintings	pintura	pintura	1
23	2018-08-22 15:06:01.704448	2022-01-05 21:06:26.100184	social-art-performance	accion-artistica-social	accio-artistica-social	5
14	2013-01-05 01:36:08.807148	2022-01-10 11:24:54.46517	prints	obra-grafica-original	obra-grafica-original	4
15	2013-01-20 02:25:58.66069	2021-09-20 19:37:11.22905	illustration	ilustracion	il-lustracio	2
7	2013-01-04 20:49:45.143651	2022-01-05 21:12:29.966798	live-drawing	live-drawing	live-drawing	4
9	2013-01-04 21:08:26.907543	2022-01-10 11:49:06.048257	instalation	instalacion	instal-lacio	14
27	2019-06-10 21:53:24.906665	2022-01-05 20:26:16.350061	visual-poetry	poesia-visual	poesia-visual	1
11	2013-01-05 00:55:50.500097	2022-01-10 11:49:06.048927	sculpture	escultura	escultura	8
16	2013-01-20 02:25:58.696969	2021-09-20 19:37:20.017604	book	libro	llibre	3
\.


--
-- Data for Name: taggings; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.taggings (id, tag_id, created_at, updated_at, work_id) FROM stdin;
90	5	2013-04-05 19:05:21.752616	2013-04-05 19:05:21.752616	9
534	11	2020-10-14 23:00:07.666433	2020-10-14 23:00:07.666433	78
549	18	2021-08-31 23:06:52.002281	2021-08-31 23:06:52.002281	84
550	21	2021-08-31 23:06:52.009598	2021-08-31 23:06:52.009598	84
100	5	2013-06-19 15:49:35.481969	2013-06-19 15:49:35.481969	24
551	16	2021-08-31 23:06:52.015541	2021-08-31 23:06:52.015541	84
552	23	2021-08-31 23:07:42.363915	2021-08-31 23:07:42.363915	77
294	5	2017-06-02 00:09:34.11498	2017-06-02 00:09:34.11498	56
295	21	2017-06-02 00:09:34.136691	2017-06-02 00:09:34.136691	56
203	9	2015-09-20 18:04:25.9152	2015-09-20 18:04:25.9152	31
204	10	2015-09-20 18:04:25.932719	2015-09-20 18:04:25.932719	31
653	23	2022-01-05 21:06:26.013642	2022-01-05 21:06:26.013642	72
654	26	2022-01-05 21:06:26.019027	2022-01-05 21:06:26.019027	72
655	11	2022-01-05 21:06:26.02362	2022-01-05 21:06:26.02362	72
656	21	2022-01-05 21:12:29.868347	2022-01-05 21:12:29.868347	67
299	21	2017-06-02 00:57:42.76304	2017-06-02 00:57:42.76304	57
657	7	2022-01-05 21:12:29.873864	2022-01-05 21:12:29.873864	67
301	7	2017-06-02 00:57:42.802979	2017-06-02 00:57:42.802979	57
659	9	2022-01-05 21:20:49.940297	2022-01-05 21:20:49.940297	64
660	35	2022-01-05 21:20:49.944781	2022-01-05 21:20:49.944781	64
217	8	2015-09-25 01:15:04.503367	2015-09-25 01:15:04.503367	8
219	9	2015-09-25 01:15:04.518094	2015-09-25 01:15:04.518094	8
220	10	2015-09-25 01:15:04.525023	2015-09-25 01:15:04.525023	8
222	19	2015-09-27 22:42:43.638605	2015-09-27 22:42:43.638605	47
600	21	2021-09-26 20:50:13.185813	2021-09-26 20:50:13.185813	85
601	30	2021-09-26 20:50:13.190631	2021-09-26 20:50:13.190631	85
228	5	2016-08-01 15:23:05.650402	2016-08-01 15:23:05.650402	46
229	5	2016-08-01 15:36:44.480106	2016-08-01 15:36:44.480106	48
139	9	2014-05-17 12:17:29.290198	2014-05-17 12:17:29.290198	36
388	21	2019-01-28 20:33:59.945633	2019-01-28 20:33:59.945633	69
142	5	2014-05-17 12:19:36.699762	2014-05-17 12:19:36.699762	34
667	26	2022-01-05 21:38:07.39756	2022-01-05 21:38:07.39756	44
668	21	2022-01-05 21:38:07.402577	2022-01-05 21:38:07.402577	44
145	17	2014-05-17 12:23:53.885253	2014-05-17 12:23:53.885253	33
146	10	2014-05-17 12:23:53.891807	2014-05-17 12:23:53.891807	33
147	1	2014-05-17 12:23:53.898598	2014-05-17 12:23:53.898598	33
501	23	2020-06-15 15:36:58.115241	2020-06-15 15:36:58.115241	19
644	21	2022-01-05 20:26:16.273078	2022-01-05 20:26:16.273078	76
645	27	2022-01-05 20:26:16.277981	2022-01-05 20:26:16.277981	76
646	14	2022-01-05 20:26:16.282367	2022-01-05 20:26:16.282367	76
514	28	2020-06-15 15:43:34.279057	2020-06-15 15:43:34.279057	55
515	23	2020-06-15 15:43:34.287067	2020-06-15 15:43:34.287067	55
681	10	2022-01-10 11:45:58.677547	2022-01-10 11:45:58.677547	75
517	11	2020-09-20 21:15:52.22018	2020-09-20 21:15:52.22018	70
682	9	2022-01-10 11:45:58.682215	2022-01-10 11:45:58.682215	75
519	17	2020-09-20 21:21:00.623163	2020-09-20 21:21:00.623163	81
15	9	2013-01-05 00:51:53.529397	2013-01-05 00:51:53.529397	11
16	11	2013-01-05 00:55:50.527103	2013-01-05 00:55:50.527103	11
683	8	2022-01-10 11:45:58.68652	2022-01-10 11:45:58.68652	75
520	9	2020-09-20 21:21:00.633545	2020-09-20 21:21:00.633545	81
521	11	2020-09-20 21:21:00.642112	2020-09-20 21:21:00.642112	81
684	18	2022-01-10 11:45:58.690684	2022-01-10 11:45:58.690684	75
685	21	2022-01-10 11:49:05.929309	2022-01-10 11:49:05.929309	38
25	1	2013-01-20 00:30:44.912037	2013-01-20 00:30:44.912037	15
26	10	2013-01-20 00:30:44.938692	2013-01-20 00:30:44.938692	15
686	9	2022-01-10 11:49:05.934758	2022-01-10 11:49:05.934758	38
687	11	2022-01-10 11:49:05.939635	2022-01-10 11:49:05.939635	38
33	9	2013-01-20 01:03:16.197571	2013-01-20 01:03:16.197571	16
688	32	2022-01-13 20:54:16.058058	2022-01-13 20:54:16.058058	87
689	30	2022-01-13 20:54:16.063706	2022-01-13 20:54:16.063706	87
46	1	2013-01-22 03:07:57.13106	2013-01-22 03:07:57.13106	18
690	21	2022-01-13 20:54:16.068721	2022-01-13 20:54:16.068721	87
49	9	2013-03-27 21:32:17.812245	2013-03-27 21:32:17.812245	23
50	10	2013-03-27 21:32:17.814903	2013-03-27 21:32:17.814903	23
59	8	2013-03-28 00:07:10.370251	2013-03-28 00:07:10.370251	17
63	15	2013-03-28 01:20:39.590467	2013-03-28 01:20:39.590467	26
64	8	2013-03-28 01:20:39.593428	2013-03-28 01:20:39.593428	26
65	16	2013-03-28 01:20:39.59595	2013-03-28 01:20:39.59595	26
68	6	2013-03-28 01:44:05.391596	2013-03-28 01:44:05.391596	6
69	10	2013-03-28 01:44:05.394322	2013-03-28 01:44:05.394322	6
79	7	2013-04-05 16:13:48.323069	2013-04-05 16:13:48.323069	27
80	9	2013-04-05 16:13:48.332029	2013-04-05 16:13:48.332029	27
81	17	2013-04-05 16:13:48.341013	2013-04-05 16:13:48.341013	27
85	15	2013-04-05 18:56:47.086945	2013-04-05 18:56:47.086945	29
86	8	2013-04-05 18:56:47.097459	2013-04-05 18:56:47.097459	29
87	16	2013-04-05 18:56:47.107504	2013-04-05 18:56:47.107504	29
669	26	2022-01-05 21:43:08.585293	2022-01-05 21:43:08.585293	73
149	5	2014-05-17 12:35:52.122448	2014-05-17 12:35:52.122448	37
150	8	2014-05-17 12:35:52.133956	2014-05-17 12:35:52.133956	37
672	14	2022-01-10 11:21:20.67074	2022-01-10 11:21:20.67074	14
393	19	2019-03-07 22:05:12.34874	2019-03-07 22:05:12.34874	68
394	21	2019-03-07 22:10:15.958474	2019-03-07 22:10:15.958474	59
237	18	2016-08-01 16:59:31.463289	2016-08-01 16:59:31.463289	52
238	5	2016-08-01 16:59:31.470255	2016-08-01 16:59:31.470255	52
239	18	2016-08-01 17:00:18.628472	2016-08-01 17:00:18.628472	49
162	11	2014-10-09 17:18:44.728089	2014-10-09 17:18:44.728089	30
675	14	2022-01-10 11:24:54.36432	2022-01-10 11:24:54.36432	74
676	8	2022-01-10 11:24:54.369086	2022-01-10 11:24:54.369086	74
247	19	2016-08-05 11:39:07.542653	2016-08-05 11:39:07.542653	51
169	5	2014-11-03 23:30:04.558152	2014-11-03 23:30:04.558152	41
172	9	2015-01-04 21:35:15.002672	2015-01-04 21:35:15.002672	35
175	17	2015-01-04 21:39:23.484924	2015-01-04 21:39:23.484924	39
250	19	2016-08-05 12:02:03.811572	2016-08-05 12:02:03.811572	40
181	10	2015-01-04 22:13:33.793967	2015-01-04 22:13:33.793967	42
184	18	2015-01-04 23:21:23.556368	2015-01-04 23:21:23.556368	43
185	5	2015-01-04 23:21:23.567593	2015-01-04 23:21:23.567593	43
410	7	2019-06-10 20:19:22.354383	2019-06-10 20:19:22.354383	7
412	1	2019-06-10 20:19:22.37285	2019-06-10 20:19:22.37285	7
338	21	2018-12-21 20:19:40.548503	2018-12-21 20:19:40.548503	66
339	5	2018-12-21 20:19:40.555481	2018-12-21 20:19:40.555481	66
537	21	2021-01-04 20:49:41.57467	2021-01-04 20:49:41.57467	83
538	28	2021-01-04 20:49:41.582213	2021-01-04 20:49:41.582213	83
445	21	2019-06-10 22:28:06.185876	2019-06-10 22:28:06.185876	62
632	14	2022-01-05 20:02:40.402393	2022-01-05 20:02:40.402393	92
493	28	2020-06-15 15:27:55.779648	2020-06-15 15:27:55.779648	54
634	13	2022-01-05 20:07:42.721888	2022-01-05 20:07:42.721888	82
495	23	2020-06-15 15:34:09.215624	2020-06-15 15:34:09.215624	65
635	13	2022-01-05 20:10:05.519543	2022-01-05 20:10:05.519543	13
497	28	2020-06-15 15:34:09.234324	2020-06-15 15:34:09.234324	65
636	21	2022-01-05 20:10:05.524248	2022-01-05 20:10:05.524248	13
637	31	2022-01-05 20:16:55.050659	2022-01-05 20:16:55.050659	88
638	9	2022-01-05 20:16:55.055614	2022-01-05 20:16:55.055614	88
639	26	2022-01-05 20:16:55.060266	2022-01-05 20:16:55.060266	88
640	11	2022-01-05 20:21:12.626426	2022-01-05 20:21:12.626426	71
462	17	2020-02-19 17:17:17.1457	2020-02-19 17:17:17.1457	53
499	9	2020-06-15 15:36:58.096735	2020-06-15 15:36:58.096735	19
500	28	2020-06-15 15:36:58.105762	2020-06-15 15:36:58.105762	19
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.users (id, name, email, admin, password_digest, created_at, updated_at) FROM stdin;
2	\N	example@example.com	f	$2a$12$ppgW87WSAlIm7zuvzF.QvOwy.lC25yRJatOLEBGOHOVVdEveFDALS	2022-04-05 21:10:51.570191	2022-04-05 21:10:51.570191
\.


--
-- Data for Name: work_translations; Type: TABLE DATA; Schema: public; Owner: zantop
--

COPY public.work_translations (id, work_id, locale, title, description, techniques, place, created_at, updated_at) FROM stdin;
10	9	es	E qui libri (s) II	<p>\r\n\tCORPOLOGIA 9</p>\r\n<p>\r\n\tEquilibri, de aequilibrium: aequus = igual y libra=balanza, peso He (a)qu&iacute; He a qui&eacute;n libris: de los libros o de los libres de libertas: volver a la madre</p>\r\n<p>\r\n\tFragmento del proceso del equilibrio de lecturas abiertas y cruzadas del peso propio i el exterior, del cuerpo &iacute;ntimo delante del cuerpo p&uacute;blico de factores intencionados o involuntarios, de la acci&oacute;n de fuerzas que implico o se implican y contrarestan m&uacute;tuamente, de los v&iacute;nculos de la palabra-voz y la palabra-papel, el papel de la relaci&oacute;n, de la (con)fusi&oacute;n de estratos de percepci&oacute;n i memoria en la armon&iacute;a del conjunto.</p>\r\n<p>\r\n\tLos factores (siempre) cambiantes niegan un estado de equilibrio estable, un resultado, y evidencian un proceso puro de incesante movimento que tiende a la justeza y la armon&iacute;a en la unidad.</p>\r\n<p>\r\n\t...et qui est libre?</p>\r\n	\N	Antic Teatre, Barcelona	2013-01-04 23:01:43.390395	2013-03-27 23:42:28.181869
6	6	ca	ZeNits / 1	<p>\r\n\tPoemes d&#39;Eva Puig. Exposici&oacute; CTN La Floresta</p>\r\n	tècnica mixta sobre fusta	\N	2013-01-04 20:32:20.744798	2013-03-28 01:44:05.514606
11	10	ca	anima(l), U	<p>\r\n\tAlma mater. Coto vedado. Caza y captura de interrogantes abiertos, pero encadenados en espiral, sobre la identidad en desequilibrio entre consciencia espiritual y cuerpo de especie animal capaz de olvidar que lo es, era y ser&aacute;. Memoria embrionaria de origen que niega, domestica, objetualiza y crea imaginarios</p>\r\n<p>\r\n\t&iquest;para entender o redimirse? &iquest;Por casualidad? &iquest;Por curiosidad?</p>\r\n<p>\r\n\tDesvelar la condici&oacute;n b&aacute;sica de nuestra animalidad subraya la condici&oacute;n humana. U. In secula seculorum...</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\thttp://www.avui.cat/noticia/article/5-cultura/19-cultura/378596-el-fem11-ja-bull.html</p>\r\n	\N	FEM / Centre Cultural La Mercè / Girona	2013-01-05 00:35:49.828799	2013-01-05 00:38:00.877773
12	11	ca	Dinergia I,II,III	<p>\r\n\tDinergia I - Llavors... Dinergia II - Armonia Diat&eacute;ssaron&nbsp; Dinergia III - Auria ad infinitum &nbsp;Materials: Dinergia I: Llavor natural, Fil de coure, paper, pedra, respecte&nbsp; Dinergia II: Llavor natural, Fil de coure, paper i tinta, vidre, agra&iuml;ment&nbsp; Dinergia III: Petxina natural, Fil de coure, pedra de lava, mirall, amor &nbsp;</p>\r\n<p>\r\n\t&quot;Dinergia: Els processos i patrons b&agrave;s&igrave;cs de formaci&oacute; i creaci&oacute;, amb els seus l&iacute;mits estrictes i les proporcions &agrave;uries omnipresents, ens reflecteixen en petit format la perfecci&oacute; infinita de l&#39;armonia i pres&egrave;ncia del tot etern, il.limitat, aix&iacute; com l&#39;abs&egrave;ncia de fronteres entre ci&egrave;ncia, art, filosofia i misticisme.&quot;</p>\r\n<p>\r\n\tFESTIVAL MaMa d&#39;Art Contemporani, Madremanya, Girona</p>\r\n		\N	2013-01-05 00:51:53.536201	2013-01-05 00:55:50.542169
13	12	ca	musical ment	<p>\r\n\tL&#39;obra &eacute;s una instal.laci&oacute;/performance col.lectiva on conflueixen l&rsquo;escultura, el so i el moviment, creant un di&agrave;leg interdisciplinar entre la mat&egrave;ria, el silenci i l&rsquo;expressi&oacute; corporal.&nbsp;&nbsp;&nbsp;\r\n\t&nbsp;\r\n\tUna escultura sonora &eacute;s l&rsquo;element central i fil conductor de la composici&oacute; musical i ; a trav&eacute;s del silenci i el so s&#39;experimenta amb l&rsquo;efecte que el ritme i la m&uacute;sica tenen sobre la ment, el cos i els sentiments.&nbsp; El moviment del cos dibuixa l&#39;espai i acciona, tra&ccedil;a camins paral.lels.\r\n\tL&#39;escultura de ferro i fusta, de 3m d&#39;al&ccedil;ada i di&agrave;metre, estructura l&#39;espai del moviment; l&#39;espectador es pot moure al voltant de l&#39;acci&oacute; i percebre el conjunt des de diverses perspectives visuals i sonores.</p>\r\n<p>\r\n\tEscultura i direcci&oacute;: Yago Del&agrave;s\r\n\tFotografia: Mireia Tor\r\n\tM&uacute;sics i artistes: Yago Del&agrave;s, X&egrave;nia Gassull, Adri&agrave; L&oacute;pez, N&uacute;ria Mad&iacute;, Simon Saura, Ruth Soler, Jordi Vinyoles, Mireia Zantop</p>\r\n	\N	Casa de Cultura de Girona / Plaça de la Vila,Viladrau / Festival de percussió, Centelles	2013-01-05 01:21:09.043867	2013-01-05 01:21:09.064496
14	13	ca	constelaccions	<p>\r\n\tAcci&oacute; in&egrave;dita realitzada amb Elisabetta Balasso.</p>\r\n	dibuix sobre pell	\N	2013-01-05 01:30:15.252021	2013-01-05 01:30:15.48331
15	14	ca	AflorA		calcografia i serigrafia	\N	2013-01-05 01:36:10.271251	2013-01-05 01:36:10.275731
16	15	ca	impro	<p>\r\n\tRosa Abuchaibe, Hanneke Ilse, Mireia Zantop (23 Marzo.2012, 18h, Laberinto de Ariadna)</p>\r\n<p>\r\n\tRosa Abuchaibe, poeta, escribe relatos y versos.</p>\r\n<p>\r\n\tHanneke Ilse, trompetista, toca en varios grupos y cultiva desde hace a&ntilde;os diversos estilos musicales.</p>\r\n<p>\r\n\tMireia Zantop, pintora, grabadora y performer, trabaja sobre los lenguajes del cuerpo en su obra pl&aacute;stica y esc&eacute;nica.</p>\r\n<p>\r\n\tEn esta pieza se reencuentran tres lenguajes art&iacute;sticos. La m&uacute;sica, la palabra y el movimiento se complementan en un todo fruto de la conexi&oacute;n entre las personas, el aqu&iacute; y el ahora. Es el arte ef&iacute;mero de la improvisaci&oacute;n.</p>\r\n<p>\r\n\tImparte: Anna Rossell</p>\r\n	\N	Ateneu Barcelonès, Barcelona	2013-01-05 01:58:06.680323	2013-01-20 00:30:45.073577
9	9	ca	E qui libri (s) II	<p>performance a CORPOLOGIA 9</p>\r\n	\N	Antic Teatre, Barcelona	2013-01-04 22:53:54.222335	2013-04-05 19:05:22.008013
17	16	ca	OUROBOROS (veus?)	<p>\r\n\tInsaciable, Ouroboros, el monstre que es menja a s&iacute; mateix.<br />\r\n\tCicle infinit?<br />\r\n\tEl m&eacute;s contradictori del proc&eacute;s &eacute;s que l&#39;acusat de provocar-lo i la v&iacute;ctima de les seves conseq&uuml;&egrave;ncies &eacute;s la mateixa: el monstre, tu, jo.</p>\r\n	\N	Brossa, caos i art | Exposició a Casa Elizalde | Barcelona	2013-01-20 00:53:58.813752	2013-01-20 00:55:10.001451
40	34	en	sum(us)	<p>CORPOLOGIA 13 en el marc de l&#39;exposici&oacute; <strong>Cargol treu banya</strong>.</p>\r\n\r\n<p>sum(us)</p>\r\n\r\n<p>I<br />\r\nsum (lat.): s&oacute;c (cat.), soy (es.)<br />\r\nsumus (lat.): som (cat.), somos (es.)</p>\r\n\r\n<p>s&oacute;c<br />\r\n(s)i som<br />\r\nsi hi som</p>\r\n\r\n<p>II<br />\r\nsum (eng.): suma<br />\r\nus (eng.): nosaltres (cat.), nosotros (es.)<br />\r\nus (cat.): os, a vosotros, to you</p>\r\n\r\n<p>sumant-nos&nbsp; som.<br />\r\nSumeu-nos<br />\r\nsumeu-vos<br />\r\nsomieu-vos</p>\r\n\r\n<p>&quot;...que tots els espectadors passin a l&#39;acci&oacute;.&quot;</p>\r\n\r\n<p>Nos habebat, nos habebit humus.</p>\r\n\r\n<p>Entretant:<br />\r\ntemps de consci&egrave;ncia.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://vimeo.com/83686197">https://vimeo.com/83686197</a></p>\r\n\r\n<p><a href="https://vimeo.com/user14560762">https://vimeo.com/user14560762</a></p>\r\n	\N	Casa Elizalde, Barcelona	2014-05-17 12:13:12.6868	2014-05-17 12:19:18.303007
62	57	ca	Flux(Us)	<p><strong>La Muga Caula</strong>, trobada Internacional de poesia d&#39;acci&oacute; i performance</p>\r\n\r\n<p>panta rei - tot unit en la difer&egrave;ncia</p>\r\n\r\n<p><a href="http://lamugacaula.cat">http://lamugacaula.cat</a></p>\r\n\r\n<p>fotografia: <a href="http://pacojusticia.com">http://pacojusticia.com</a></p>\r\n	\N	Les Escaules, Girona	2016-10-19 22:59:40.435486	2017-02-19 23:10:21.240546
67	62	ca	DONAR VEU...i veure més	<p>Acci&oacute; performativa a l&rsquo;espai p&uacute;blic per donar veu a all&ograve; que solem silenciar entorn de les (des)igualtats de g&egrave;nere.</p>\r\n\r\n<p>Creaci&oacute; i realitzaci&oacute;: <strong>Les Mireies - projecte art&iacute;stic i social</strong> ( Mireia Chalamanch i Mireia Zantop)</p>\r\n	\N	Espai públic de municipis de comarques de Barcelona	2017-06-01 23:33:01.197827	2019-06-10 22:20:51.268437
26	24	es	S/T: sin título	<p>\r\n\tCorpologia 10</p>\r\n<p>\r\n\tPuerta de entrada: portada en blanco.<br />\r\n\tEntre m&iacute; y todos, tiempo com&uacute;n i dos libros sin un solo t&iacute;tulo.<br />\r\n\tPuerta dos, portadores.<br />\r\n\tSe unen, p&aacute;gina a p&aacute;gina, en un cuerpo que no quiere dividirse. Se diferencian por palabra y pensamiento propio, se encuentran entre l&iacute;neas.<br />\r\n\tPuerta tres, al p&uacute;blico.<br />\r\n\tEje de equilibrio. Cruce de enlace mientras act&uacute;a la fuerza del roce y la tensi&oacute;n, atenci&oacute;n.<br />\r\n\tV&iacute;nculo fr&aacute;gil pero contundente arn&eacute;s m&uacute;tuo que aguanta el instante, el tiempo justo. Pueden ser horas, segundos, seg&uacute;n.</p>\r\n<p>\r\n\t<br />\r\n\t&quot;por favor, con calma, os pido que pens&eacute;is un t&iacute;tulo para esta acci&oacute;n. Cuando lo teng&aacute;is, levantad la mano derecha.&quot;<br />\r\n\t...<br />\r\n\tdigo ssss/t.<br />\r\n\tescribo S/T</p>\r\n<p>\r\n\t&quot;Gracias. Yo tambi&eacute;n prometo no decirlo nunca a nadie.&quot;</p>\r\n<p>\r\n\t(y no dud&eacute;is que me muero de ganas de saberlos)</p>\r\n<p>\r\n\tSujeto subjetivo sujetado a dos bandas. Reflejo-reflexi&oacute;n de experiencia.<br />\r\n\tCada uno es titular.</p>\r\n	\N	La Plaça, Celrà	2013-03-27 23:34:12.941673	2013-03-27 23:34:13.0084
18	17	ca	úters |	<p>\r\n\tArts i lletres de la m&agrave;. Exposici&oacute; amb Rosa Abuchaibe, Gloria Andrade, Pedro Blanco i Javier Quintanilla. Pati Llimona, Barcelona</p>\r\n	tècnica mixta sobre paper	\N	2013-01-20 01:01:02.209471	2013-03-28 00:07:10.428195
28	26	ca	El celler i +	<p>\r\n\tportades de t&iacute;tols de Noah Gordon per a Editorial Roca</p>\r\n		\N	2013-03-28 00:59:08.741807	2013-03-28 00:59:08.741807
19	18	ca	Itaca | pas a dos	<p>\r\n\tPerformance amb Eva Puig<br />\r\n\t<br />\r\n\t&Iacute;TACA<br />\r\n\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<br />\r\n\tQuan surts per fer el viatge cap a &Iacute;taca,<br />\r\n\thas de pregar que el cam&iacute; sigui llarg,<br />\r\n\tple d&#39;aventures, ple de coneixen&ccedil;a.<br />\r\n\tEls Lestr&iacute;gons i els C&iacute;clops,<br />\r\n\tl&#39;a&iuml;rat Posid&oacute;, no te n&#39;esfereixis:<br />\r\n\ts&oacute;n coses que en el teu cam&iacute; no trobar&agrave;s,<br />\r\n\tno, mai, si el pensament se&#39;t mant&eacute; alt, si una emoci&oacute; escollida<br />\r\n\tet toca l&#39;esperit i el cos alhora.<br />\r\n\tEls Lestr&iacute;gons i els C&iacute;clops,<br />\r\n\tel fero&ccedil; Posid&oacute;, mai no ser&agrave; que els topis<br />\r\n\tsi no els portes amb tu dins la teva &agrave;nima,<br />\r\n\tsi no &eacute;s la teva &agrave;nima que els dre&ccedil;a davant teu.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tHas de pregar que el cam&iacute; sigui llarg.<br />\r\n\tQue siguin moltes les matinades d&#39;estiu<br />\r\n\tque, amb quina delectan&ccedil;a, amb quina joia!<br />\r\n\tentrar&agrave;s en un port que els teus ulls ignoraven;<br />\r\n\tque et puguis aturar en mercats fenicis<br />\r\n\ti comprar-hi les bones coses que s&#39;hi exhibeixen,<br />\r\n\tcoral i nacres, ambres i banussos<br />\r\n\ti delicats perfums de tota mena:<br />\r\n\ttanta abundor com puguis de perfums delicats;<br />\r\n\tque vagis a ciutats d&#39;Egipte, a moltes,<br />\r\n\tper aprendre i aprendre dels que saben.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tSempre tingues al cor la idea d&#39;&Iacute;taca.<br />\r\n\tHas d&#39;arribar-hi, &eacute;s el teu dest&iacute;.<br />\r\n\tPer&ograve; no forcis gens la travessia.<br />\r\n\t&Eacute;s preferible que duri molts anys<br />\r\n\ti que ja siguis vell quan fondegis a l&#39;illa,<br />\r\n\tric de tot el que haur&agrave;s guanyat fent cam&iacute;,<br />\r\n\tsense esperar que t&#39;hagi de dar riqueses &Iacute;taca.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\t&Iacute;taca t&#39;ha donat el bell viatge.<br />\r\n\tSense ella no hauries pas sortit cap a fer-lo.<br />\r\n\tRes m&eacute;s no t&eacute; que et pugui ja donar.<br />\r\n\t&nbsp;&nbsp;&nbsp;<br />\r\n\tI si la trobes pobra, no &eacute;s que &Iacute;taca t&#39;hagi enganyat.<br />\r\n\tSavi com b&eacute; t&#39;has fet, amb tanta experi&egrave;ncia,<br />\r\n\tja haur&agrave;s pogut comprendre qu&egrave; volen dir les &Iacute;taques.<br />\r\n\t&nbsp;&nbsp;<br />\r\n\tK.P.KAVAFIS, 1911<br />\r\n\tTrad. C. Riba</p>\r\n	\N	Teatre Sants i CCBesós, Barcelona	2013-01-20 02:15:46.404718	2013-01-22 03:07:57.16442
24	23	ca	6 senses (consentidOsinsentido)	<p>\r\n\tPerformance i instal.lacio a l&#39;exposicio Dones amb sentit&#39;s a carrec de Roser Girona</p>\r\n<p>\r\n\tDaU al sis sentits<br />\r\n\t(en clau de tu)</p>\r\n<p>\r\n\tSents?<br />\r\n\tSents cent ocells i l&#39;harmonia.<br />\r\n\tSents sons i suau son.<br />\r\n\tSents sol als ulls clucs, veus el que vols.<br />\r\n\tImagines la imatge, anotes el que notes:<br />\r\n\tCreus i crees imaginaccions.<br />\r\n\tSents la car&iacute;cia i la intenci&oacute;.<br />\r\n\tSents la mel i la seva llengua dol&ccedil;a.&nbsp;<br />\r\n\tSents l&#39;aroma del caf&egrave; i ensums el que sents.<br />\r\n\tT&#39;he sentit, t&eacute; sentit.<br />\r\n\tT&#39;afecta l&#39;afecte i l&#39;efecte del sent-i-ment.<br />\r\n\tI el sis&egrave; sentit m&eacute;s que el com&uacute;.</p>\r\n<p>\r\n\tAssents, dissents, consents i pressents en present.<br />\r\n\tHo sents: ergo ets<br />\r\n\tun tot sensible<br />\r\n\tamb sentit(s)</p>\r\n<p>\r\n\t&nbsp;</p>\r\n<p>\r\n\tTot i ser negat per irreprodu&iuml;ble i indemostrable, el sis&egrave; sentit t&eacute; nom propi. Segons Ramon Llull, els cinc sentits tradicionals proporcionen dades massa disperses per ser copsades per la ment. Defineix l&#39;afat, el sis&egrave; sentit com una facultat unificadora que atorga un concepte a les diferents sensacions que permet comunicar-lo mitjan&ccedil;ant la paraula.<br />\r\n\tLa neuroci&egrave;ncia ara explora el sis&egrave; sentit o la visi&oacute; mental premonit&ograve;ria dels canvis abans que es produeixin. El cervell crea patrons de mem&ograve;ria que s&oacute;n la font de la intuici&oacute;. Els mecanismes resten impredictibles, segurament, perque no els reconeixem prou com una forma complement&agrave;ria de la percepci&oacute;. Encara.</p>\r\n	\N	CCBarceloneta	2013-03-22 00:11:07.040939	2013-03-27 21:32:24.077723
29	27	ca	Sí, lent, sí, silenci		\N		2013-04-05 15:05:10.533417	2013-04-05 15:53:49.048616
31	29	ca	Grafies d'una mirada a Sarrià	<p>Quadern de viatge pel barri de Sarri&agrave; en una primavera. Llibre de la colecci&oacute; Carnet de Voyage editat per l&#39;Ajuntament de Barcelona.</p>\r\n	tècnica mixta sobre paper	\N	2013-04-05 18:53:18.958475	2013-04-05 18:56:47.283683
8	8	ca	dues Veus nues	<p>Exposici&oacute; i instal.laci&oacute; d&#39;obra sobre paper i poemes de Rosa Abuchaibe. Performance, improvisaci&oacute; d&#39;art i poesia amb Rosa Abuchaibe. Vil.la Florida, Barcelona</p>\r\n	mixta sobre paper 	\N	2013-01-04 20:55:14.000793	2013-04-05 19:27:48.627716
25	24	ca	S/T: sense títol	<p>Porta-1 d&#39;entrada: portada en blanc.<br />\r\nEntre mi i tots, temps com&uacute; i dos llibres sense un sol t&iacute;tol.<br />\r\nPorta-do(r)s.<br />\r\nS&#39;uneixen, p&agrave;gina a p&agrave;gina, en un cos que no vol dividir-se. Es diferencien per paraula i pensament propi, es troben entre l&iacute;nies.<br />\r\nPorta tres: em porta al p&uacute;blic.<br />\r\nEix d&#39;equilibri. Cru&iuml;lla d&#39;enlla&ccedil; mentre actua la for&ccedil;a del frec i la tensi&oacute;, atenci&oacute;.<br />\r\nLligam fr&agrave;gil per&ograve; contundent arn&eacute;s mutu que aguanta el instant, el temps just. Poden ser hores, segons.<br />\r\nPorta quatre mosquetons i corda que recorda: no estem nuats.</p>\r\n\r\n<p>&quot;Sisplau, amb la calma, us demano que penseu un t&iacute;tol per a aquesta acci&oacute;. Quan el tingueu, aixequeu la m&agrave; dreta.&quot;<br />\r\n...<br />\r\ndic: ssss/t.<br />\r\nescric S/T</p>\r\n\r\n<p>&quot;Gr&agrave;cies.<br />\r\nJo tamb&eacute; prometo no dir-ho mai a ning&uacute;.&quot;</p>\r\n\r\n<p>(i no dubteu que em moro de ganes de saber-los)</p>\r\n\r\n<p>Subjecte subjectat a dues bandes, reflexe-reflexi&oacute; d&#39;experi&egrave;ncia.<br />\r\nCadasc&uacute; n&#39;&eacute;s titular.</p>\r\n	\N	La Plaça, Celrà	2013-03-27 21:35:26.168316	2013-04-05 19:00:00.761269
66	61	ca	we were waiting for you	<p>Festival FLARE 3</p>\r\n\r\n<p>col&middot;lectiu d&#39;investigaci&oacute; d&#39;art d&#39;acci&oacute; <strong>ocells al cap:</strong></p>\r\n\r\n<p>Denys Blacker, Nat&agrave;lia Espinet, Victoria Grey, Helena Hunter, Marta Vergony&oacute;s, Sabina Vilagut, Lesley Yendell, Mireia Zantop</p>\r\n\r\n<p><a href="https://flare707.wordpress.com/">https://flare707.wordpress.com/</a></p>\r\n	\N	Vane Gallery, Newcastle, GB	2017-06-01 23:01:04.874164	2017-06-01 23:09:35.10061
88	85	ca	SI i/o NO, torno i no torno	<p>Video-acci&oacute; per a l&#39;Exposici&oacute; Plurivisions de Fel&iacute;cia Fuster</p>\r\n\r\n<p>Realitzaci&oacute; del v&iacute;deo: Adolf Alca&ntilde;iz</p>\r\n\r\n<p><a href="https://tempsarts.cat/felicia-fuster-plurivisions/">https://tempsarts.cat/felicia-fuster-plurivisions/</a></p>\r\n	\N	Arts Santa Mònica, Barcelona	2021-04-08 21:04:22.995001	2021-04-08 21:31:03.886253
32	30	ca	axis salus: homenatge al bon metge	<p>Premi al bon metge</p>\r\n\r\n<p>Paraules recollides en el proc&eacute;s de creaci&oacute; de l&#39;escultura -que acompanyaren el premi en composicions cal.ligr&agrave;fiques &uacute;niques- i que envolten l&#39;excel.l&egrave;ncia del bon metge. Valors i virtuts que van m&eacute;s enll&agrave; del coneixement cient&iacute;fic i l&#39;ex`peri&egrave;ncia fruit d&#39;estudis i praxis.&nbsp; Tenen m&eacute;s a veure amb la saviesa human&iacute;stica, el com usar el saber, com tractar el cos i l&#39;&agrave;nima de la persona. Nos&oacute;n mesurables, per&ograve; els reconeixem quan est&agrave;n presents.</p>\r\n\r\n<p>La pe&ccedil;a contempla la relaci&oacute; metge-pacient, tot i asim&egrave;trica, com un tot org&agrave;nic amb una base compartida, com un equillibri delicat, per&ograve; just, com un viatge profund a un centre com&uacute;, com una comunicaci&oacute; clara d&#39;escolta m&uacute;tua en la que parla el silenci.</p>\r\n\r\n<p>Tot el meu agra&iuml;ment i reconeixement a l&#39;equip de SEPAR i a tots els metges que dia a dia cultiven conscientment aquests valors que ens trascendeixen i fan m&eacute;s humans.</p>\r\n	escultura de bronze	\N	2013-08-20 12:50:53.349579	2013-08-20 12:50:53.349579
33	30	es	axis salus: homenaje al buen médico. Premio SEPAR	<p>Premio al Buen M&eacute;dico</p>\r\n\r\n<p>En el proceso de creaci&oacute;n de la escultura, recog&iacute; palabras&nbsp; -que acompa&ntilde;ar&aacute;n el premio- y que envuelven la excelencia del buen m&eacute;dico. Una larga lista de valores y virtudes que van m&aacute;s all&aacute; del conocimiento cient&iacute;fico y la experiencia fruto de estudios y praxis. Tienen m&aacute;s que ver con la sabidur&iacute;a humana de c&oacute;mo usar ese saber, de c&oacute;mo tratar el cuerpo y el alma de la persona. No se pueden medir, pero se reconocen cuando est&aacute;n presentes.<br />\r\nLa pieza contempla la relaci&oacute;n m&eacute;dico-paciente, aunque asim&eacute;trica, como un todo org&aacute;nico con una base compartida, como un equilibrio delicado, pero justo, como un viaje profundo, como una comunicaci&oacute;n clara y de escucha m&uacute;tua en la que tambi&eacute;n habla e lsilencio.</p>\r\n\r\n<p>Todo mi agradecimiento y reconocimiento al equipo de Separ y a todos los m&eacute;dicos que, d&iacute;a a d&iacute;a, cultivan conscientemente estos valores preciosos que nos trascienden y hacen m&aacute;s seres humanos.</p>\r\n	escultura de bronce	\N	2013-08-20 12:52:14.3328	2013-08-20 12:53:55.06822
34	30	en	axis salus: hommage to the good doctor	<p>Good Physician Award<br />\r\n<br />\r\nIn the process of creating the sculpture, picked words that accompany the award-and excellence involving good doctor. A long list of values ​​and virtues that go beyond scientific knowledge and experience result of research and practice. They have more to do with the wisdom of how to use this knowledge, how to treat the body and soul of the person. Can not be measured, but are recognized when present.<br />\r\nThe piece includes the doctor-patient relationship, although asymmetric, as an organic whole with a shared basis, as a delicate balance, but just as a trip deep, as clear communication and mutual listening which also silences speak.<br />\r\n<br />\r\nAll my thanks and appreciation to Separ team and all physicians who, day by day, consciously cultivate these precious values ​​transcend and make us more human.</p>\r\n	bronze sculpture	\N	2013-08-20 12:58:58.389429	2013-08-20 12:58:58.393426
36	33	ca	fent volar coloms	<p>Fent volar coloms s&#39;ha gestat durant el temps de conviv&egrave;ncia amb alguns materials i elements de treball entre les tres persones que operem amb ells i nosaltres. Del laboratori han sortit una s&egrave;rie de peces breus que incorporen tamb&eacute; elements sonors.</p>\r\n\r\n<p>Transitem tamb&eacute; per 11 v&iacute;deo-accions de curta durada.</p>\r\n\r\n<p>Som els responsables del producte final.</p>\r\n\r\n<p>Lucho Hermosilla, Ona Mestre, Mireia Zantop.</p>\r\n\r\n<p>Agra&iuml;ments a l&#39;equip de l&#39;Antic, Clara Bes, Pau Compte, Andr&eacute;s Acebes, Mar, Jordi Nebot, Lesley Yendell.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="http://www.anticteatre.com">http://www.anticteatre.com</a></p>\r\n	\N	Antic Teatre, Barcelona	2013-12-06 12:49:29.127486	2013-12-06 12:57:36.416638
37	34	ca	sum(us)	<p>Corpologia 13 en el marc de l&#39;exposici&oacute; <strong>Cargol treu banya</strong></p>\r\n	\N	Casa Elizalde, Barcelona	2013-12-06 13:04:41.823364	2013-12-06 13:04:41.823364
39	36	ca	despunxar	<p>Acci&oacute; po&egrave;tica amb Al&egrave;xia Lleonart en el marc de l&#39;exposici&oacute; d&#39;obra original Esbarzers.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>http://blog.papasseit.cat/el-raco-de-lart/&nbsp;</p>\r\n	\N	Llibreria Papasseit, Manresa	2013-12-06 13:20:59.623252	2013-12-06 13:20:59.623252
56	51	ca	pomps of the subsoil	<p>Col&middot;lectiu d&#39;art d&#39;acci&oacute; OCELLS AL CAP:</p>\r\n\r\n<p>participen: Denys Blacker, Natalia Espinet, Juliette Murphy, Montse Ser&oacute;, Marta Vergony&oacute;s, Ada Vilar&oacute;, Lesley Yendell, Mireia Zantop</p>\r\n	\N	FESTIVAL ESCENA POBLENOU, Can Felipa, Barcelona	2016-08-01 16:18:35.356281	2016-08-05 11:37:55.053477
41	36	en	despunxar	<p><strong>Acci&oacute; po&egrave;tica amb Al&egrave;xia Lleonart</strong> en el marc de la seva exposici&oacute; d&#39;obra original <strong>Esbarzers.</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>http://blog.papasseit.cat/el-raco-de-lart/&nbsp;</p>\r\n	\N	Llibreria Papasseit, Manresa	2014-05-17 12:17:29.478349	2014-05-17 12:17:29.484756
38	35	ca	Quina és la pregunta?	<p>25 de novembre: Dia per a la eradicaci&oacute; de la viol&egrave;ncia de g&egrave;nere</p>\r\n\r\n<p>Acci&oacute; al carrer amb Mireia Chalamanc i instal.laci&oacute; a la Capella de Sant Corneli</p>\r\n\r\n<p>&ldquo;A poc a poc al endinsar-me a l&rsquo;ambient del mercat amb actitud de receptivitat van anar sorgint complicitats, mirades, apropaments, fins que em vaig sentir submergida a un flux de respostes i preguntes que anaven donant sentit a les nostres pres&egrave;ncies. Receptacles d&rsquo;emocions, pensaments, paraules, comentaris, intimitats, reaccions, necessitats&hellip; en el tap&iacute;s d&rsquo;aquesta Acci&oacute; vaig quedar impregnada de dolor, de veus callades, de veus silenciades, i al mateix temps, impregnada de possibilitats, d&rsquo;escletxes, de veus manifestades, de veus agra&iuml;des, de diversitat de veus i d&rsquo;experi&egrave;ncies.&rdquo;</p>\r\n\r\n<p>&ldquo;Una de les certeses que vaig sentir &eacute;s que durant la nostra acci&oacute; erem alhora subtils emissores i receptores, per&ograve;, sobre tot, canals a trav&eacute;s dels quals permetiem que afluessin, s&#39;expres&eacute;ssin i prengu&eacute;ssin forma verbal, -conscient o inconscientment- alguns pensaments, opinions i sentiments que solen restar soterrats.</p>\r\n\r\n<p>I parlo sempre del tot: nosaltres i els altres, l&#39;espai d d&#39;aquesta trobada &iacute;ntima en l&#39;espai p&uacute;blic nom&eacute;s podia sorgir de l&#39;escolta, la reflexi&oacute; i la sinceritat m&uacute;tua.</p>\r\n\r\n<p>Varem ser full en blanc per a paraules &ldquo;indici&rdquo;, que assenyalen t&iacute;midament moltes hist&ograve;ries que compartim poc i solen ser m&eacute;s silenciades que explicades. &Eacute;s tab&uacute; all&ograve; del que no se&#39;n parla. Em va sorprendre les visions i percepcions de la viol&egrave;ncia, i com alguns neguen ser capa&ccedil;os de sentir-la o recon&egrave;ixer-la, tant com a agents passius o actius. Em va alegrar veure que les persones, amb independ&egrave;ncia de g&egrave;nere, edat o condici&oacute; social, desitgen obrir el di&agrave;leg, cercar respostes i, amb clara determinaci&oacute;, aportar de la seva part per l&#39;eradicaci&oacute; de la viol&egrave;ncia.</p>\r\n	\N	Mercat i capella de Sant Corneli, Cardedeu	2013-12-06 13:07:21.047497	2015-01-04 21:35:15.140994
35	31	ca	A...Z 5/5 (f)acts	<p>(f)acts</p>\r\n\r\n<p>1/5: A&#39;s rain as poem as...</p>\r\n\r\n<p>2/5: pienso, luego... o no</p>\r\n\r\n<p>3/5: yo no he sido</p>\r\n\r\n<p>4/5: entrar saliendo o salir entrando</p>\r\n\r\n<p>5/5: a room, espai habitat</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Experimental Room Festival, Barcelona	2013-09-05 14:59:31.67866	2015-09-20 18:03:57.753149
97	92	ca	obra gràfica	<p>Exposem a Bilbao al Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	gravat calcogràfic i serigrafia sobre diversos papers i suports	\N	2021-11-19 20:17:29.236969	2021-11-20 13:40:31.601172
91	87	es	Over and over, again and again 	<p>Video-performance con Denys Blacker.</p>\r\n\r\n<p>Proceso creativo colectivo sobre migraciones con Marina Barsy, Denys Blacker, Aodan McCardle, Sandra Johnson, Bernadette Hopkins (curadora) e Isa Fontbona.</p>\r\n\r\n<p>Video: Mar Ximenis</p>\r\n\r\n<p>Presentado en Regional Cultural Centre Letterkenny Co.Donegal en oto&ntilde;o de 2021</p>\r\n\r\n<p>WILD SWANS: https://www.bernadettehopkins.com/wild-swans-performance-art.html</p>\r\n	\N	Madremanya, Girona/ Donegal, Ireland	2021-09-13 17:22:20.910774	2021-12-16 21:38:29.44898
46	40	ca	BIRDS-ocells al cap	<p><br />\r\nActivitat vinculada a l&#39;exposici&oacute;<strong>&nbsp;Allan Kaprow. Altres maneres</strong>&nbsp;a la Fundaci&oacute; Antoni T&agrave;pies, Barcelona</p>\r\n\r\n<p><br />\r\nPerformance:&nbsp;Punt de trobada a Can Obert, Madremanya &nbsp;10h - 13h<br />\r\nPosta en com&uacute;:&nbsp;Can Obert, Madremanya 16h -18h</p>\r\n\r\n<p><br />\r\nDe&nbsp;Birds&nbsp;(Ocells) a&nbsp;Tenir ocells al cap&nbsp;<br />\r\nA partir de la proposta de treballar al voltant de l&rsquo;obra&nbsp;de Kaprow i en con&egrave;ixer el seu vincle amb la Womanhouse, decidim recrear la pe&ccedil;a&nbsp;Birds. En el proc&eacute;s de &ldquo;reinvenci&oacute;&rdquo; que proposa el mateix Kaprow ens interessa anar m&eacute;s enll&agrave; de la partitura proposada, i explorar, en aquesta intervenci&oacute; en plena natura, la locuci&oacute; &ldquo;tenir ocells al cap&rdquo;.</p>\r\n\r\n<p><br />\r\nCoordinadores de la reinvenci&oacute;:&nbsp;Denys Blacker i Marta Vergony&oacute;s<br />\r\nAmb la participaci&oacute; de:&nbsp;Montse Ser&oacute;,&nbsp;Ada Vilar&oacute;,&nbsp;Lesley Yendell,&nbsp;Paloma Orts,&nbsp;Nat&agrave;lia Espinet,&nbsp;N&uacute;ria Icl&egrave;sies,&nbsp;Mar Serinya,&nbsp;Clara Gar&iacute;,&nbsp;J&uacute;lia Falgas i Mireia Zantop.<br />\r\n<a href="http://www.fundaciotapies.org/site/spip.php?rubrique1274">http://www.fundaciotapies.org/site/spip.php?rubrique1274</a></p>\r\n	\N	Madremanya	2014-05-17 13:01:15.49841	2016-08-05 12:02:03.841509
42	33	en	fent volar coloms	<p>Fent volar coloms s&#39;ha gestat durant el temps de conviv&egrave;ncia amb alguns materials i elements de treball entre les tres persones que operem amb ells i nosaltres. Del laboratori han sortit una s&egrave;rie de peces breus que incorporen tamb&eacute; elements sonors.</p>\r\n\r\n<p>Transitem tamb&eacute; per 11 v&iacute;deo-accions de curta durada.</p>\r\n\r\n<p>Som els responsables del producte final.</p>\r\n\r\n<p>Lucho Hermosilla, Ona Mestre, Mireia Zantop.</p>\r\n\r\n<p>Agra&iuml;ments a l&#39;equip de l&#39;Antic, Clara Bes, Pau Compte, Andr&eacute;s Acebes, Mar, Jordi Nebot, Lesley Yendell.</p>\r\n\r\n<p><a href="http://vimeo.com/81280599">http://vimeo.com/81280599</a></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="http://www.anticteatre.com">http://www.anticteatre.com</a></p>\r\n	\N	Antic Teatre, Barcelona	2014-05-17 12:23:54.04395	2014-05-17 12:23:54.048024
43	37	ca	(n)ombrares 	<p><strong>(n)ombrares</strong> es basa en la relaci&oacute; amb la pr&ograve;pia ombra en relaci&oacute; amb el nombre d&#39;ombres i el nombre d&#39;ares que percebem conscientment i podem nombrar</p>\r\n\r\n<p>(fent segments subjectius de la unitat flu&iuml;da del tot).</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Anotacions marginals:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La meva ombra m&#39;acompanya des del meu enllumenament.</p>\r\n\r\n<p>&Eacute;s variable - particular, privada (tamb&eacute; de llibertat) y p&uacute;blica, &uacute;nica y m&uacute;ltiple, impert&egrave;rrita i adaptable, singular o plural,</p>\r\n\r\n<p>i sempre sincr&ograve;nica.</p>\r\n\r\n<p>&Eacute;s tots els meus jos i nos. Tenim una bona relaci&oacute;.</p>\r\n\r\n<p>&Eacute;s la meva ombra de la guarda.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Relaci&oacute; d&#39;ares t&ograve;nics per preposicions &agrave;tones</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>a l&#39;ombra (parlo i beso)</p>\r\n\r\n<p>amb l&#39;ombra ( em defineixo i m&#39;abra&ccedil;o)</p>\r\n\r\n<p>de l&#39;ombra (neixo i s&oacute;c inseparable. S&eacute; que no la puc matar sense morir en</p>\r\n\r\n<p>l&#39;intent - o tu i jo o ni tu ni jo)</p>\r\n\r\n<p>en l&#39;ombra (que m&#39;acull, m&#39;esmunyo)</p>\r\n\r\n<p>per l&#39;ombra (interpreto forma i acci&oacute; segons la llum de la mirada)</p>\r\n\r\n<p>per a l&#39;ombra (un got de vi, que tra&ccedil;a i revela la seva ess&egrave;ncia incorp&ograve;ria)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>subtext, flash-acci&oacute; imagin&agrave;ria:</p>\r\n\r\n<p>En algun moment vaig pensar en proposar de reunir-nos tots els corpologistes abra&ccedil;ats i mirar uns instants l&#39;ombra com&uacute;, fer-li una foto amb flash com a evid&egrave;ncia absoluta de la seva pres&egrave;ncia ef&iacute;mera i la incapacitat de retenir-la. Per&ograve; ja havia descartat la opci&oacute; de matar l&#39;ombra... segueixo jaient amb ella.</p>\r\n	\N	Sant Hilari Sacalm	2014-05-17 12:35:52.148102	2014-05-17 12:35:52.148102
45	39	ca	els polissons	<p>Disturbanitats:</p>\r\n\r\n<p>Performance-Acci&oacute; sonora amb instruments tradicionals tocats instintivament, comprovant la hip&ograve;tesi harm&ograve;nica de la teoria del caos a la recerca de la biologia primordial.</p>\r\n\r\n<p>Els Polissons estan formats per artistes transdisciplinars que conreen tant la creaci&oacute; en directe com t&egrave;cniques m&eacute;s el&middot;laborades del m&oacute;n de les arts visuals, liter&agrave;ries, esc&egrave;niques i musicals. Aquest projecte beu de fonts dada&iacute;stes amb precedents de treball en grups d&#39;improvisaci&oacute; i investigaci&oacute; musical.</p>\r\n\r\n<p>Participen:</p>\r\n\r\n<p>Joan Vinuesa&nbsp;<a href="http://www.joanvinuesabaliu.info"> www.joanvinuesabaliu.info</a>&nbsp;&nbsp;&nbsp;</p>\r\n\r\n<p>Aleix Antillach <a href="http://www.leix.org">www.leix.org</a>&nbsp;</p>\r\n\r\n<p>Eva Puig <a href="http://www.estranhaformadevida.com">www.estranhaformadevida.com</a></p>\r\n\r\n<p>Col&middot;labora: Ona Mestre</p>\r\n\r\n<p>contacte: elspolissons@gmail.com</p>\r\n	\N	XIV Festival Perpetracions - Antologia Animal, Sant Martí, Barcelona	2014-05-17 12:59:00.763419	2014-07-17 22:28:58.029492
84	81	ca	gota · gota	<p>Artistes a cel obert</p>\r\n\r\n<p>Taller de Montse Ser&oacute;, a Rupi&agrave;, i exposici&oacute; al Museu de la Terrissa de Quart.</p>\r\n	Ceràmica i instal·lació amb aigua i objectes.	\N	2020-02-19 17:54:40.924657	2020-02-19 18:03:44.48378
44	38	ca	ad hoc	<p>s&egrave;rie de accions/intervencions improvisades ad hoc</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	moviment i relació amb i entre els objets trouvés, acció i escultura efímera	\N	2014-05-17 12:58:04.890932	2015-01-04 21:41:51.477027
83	78	ca	Thyllandsias	<p>viure amb poc i d&#39;all&ograve; (aparentment) immaterial</p>\r\n	Escultura d'alabastre	\N	2020-02-14 21:53:45.80356	2020-09-21 12:36:37.639959
70	65	ca	Desig Per(z)ones	<p><strong>art participatiu a l&#39;espai p&uacute;blic. Pe&ccedil;a entorn de les relacions afectives i la sexualitat</strong></p>\r\n\r\n<p>Acci&oacute;-performance i instal&middot;laci&oacute; col&middot;lectiva fruit de la participaci&oacute; i la reflexi&oacute; individual generant un di&agrave;leg entre espai p&uacute;blic i espai &iacute;ntim, visibilitzant la diversitat de qualsevol forma de sentir per expressar tot all&ograve; silenciat, envoltat de prejudicis i tab&uacute;s.</p>\r\n\r\n<p><strong>Les Mireies</strong>, projecte art&iacute;stic i social,</p>\r\n\r\n<p>som Mireia Chalamanch i Mireia Zantop</p>\r\n	\N	Espai públic de 23 municipis del Barcelonès	2018-08-22 15:06:01.767606	2020-06-15 15:22:31.23499
106	72	es	cap cap	<p><strong>Festival de Land-art</strong> ArtiGavarres, 2019</p>\r\n\r\n<p><a href="http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto">http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto</a></p>\r\n\r\n<p>Proyecto de cocreaci&oacute;n con Aleix Antillach</p>\r\n\r\n<p><a href="http://leix.org">http://leix.org</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	escultures efímeres de palla 	\N	2022-01-05 21:06:26.094854	2022-01-05 21:06:26.097595
82	77	ca	DE VEU · EN VEU	<p><strong>les Mireies, </strong>projecte art&iacute;stic i social</p>\r\n\r\n<p>Mireia Chalamanch i Mireia Zantop</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://vimeo.com/337385523">https://vimeo.com/337385523 </a></p>\r\n\r\n<p><a href="https://vimeo.com/490838260">https://vimeo.com/490838260</a></p>\r\n\r\n<p>De VEU en VEU neix de la necessitat de fer-vos c&ograve;mplices d&rsquo;algunes de les m&eacute;s de 3.500 veus que hem recollit fent la performance DONAR VEU al llarg d&rsquo;aquests 5 anys.</p>\r\n\r\n<p>La pe&ccedil;a vol ser una invitaci&oacute; a l&rsquo;escolta, a la reflexi&oacute;, aix&iacute; com la presa de consci&egrave;ncia de la diversitat d&rsquo;experi&egrave;ncies entorn a temes com la viol&egrave;ncia masclista, la (des)igualtat i la diversitat sexual i de g&egrave;nere.</p>\r\n	\N	Can Manyé, Alella	2019-06-10 22:08:30.884277	2021-01-04 21:07:14.45751
107	67	es	ip(sum), id(est)	<p>Acci&oacute;n en la Fundaci&oacute;n Valvi en el marco del festival Inundart, Girona</p>\r\n\r\n<p>1 de julio de 2018</p>\r\n	Performance, dibujo con el cuerpo, yeso, carbón, saliva y agua.	\N	2022-01-05 21:12:29.961094	2022-01-05 21:12:29.963527
47	41	ca	present% o saltAl'ara	<p>CORPOLOGIA 15</p>\r\n\r\n<p>16 accions de 4 minuts.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Em presenten, em presento amb la pres&egrave;ncia, presento el t&iacute;tol:</p>\r\n\r\n<p><strong>PRESENT%</strong>: t&iacute;tol I pensat anteriorment (del passat)</p>\r\n\r\n<p>salal&#39;ara: t&iacute;tol II pensat just abans de l&#39;acci&oacute; (en un salt a l&#39;ara)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Presento i ofereixo com a present</p>\r\n\r\n<p>els objectes que m&#39;acompanyen:</p>\r\n\r\n<p>un paper blanc rod&oacute; fet a m&agrave; que porta a sobre una bossa plena de sal i 2 vells despertadors negres -d&#39;aquells que fan tic-tac i riiing percutint les dues campanes-</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Volia preguntar -quina hora &eacute;s?, per&ograve; com, sigui quina sigui, ja no &eacute;s, no vaig posar els rellotges a l&#39;hora que &eacute;s/era, si no a l&#39;hora primera i &uacute;ltima de la nostra mesura del temps: 0.00</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Inici</p>\r\n\r\n<p>Sincronia = sense cronos? No cr&ograve;nic? Alhora? Tot</p>\r\n\r\n<p>A-sincronia de 2 rellotges:</p>\r\n\r\n<p>Una dimensi&oacute; del temps absoluta, mesurable. Tremolo mentre dono corda al rellotge</p>\r\n\r\n<p>L&#39;altra dimensi&oacute;, relativa, el temps percebut, l&#39;ara propi. Em calmo</p>\r\n\r\n<p>S&oacute;c a sobre del paper en blanc. Al meu eix i a l&#39;axis tempus 0:00</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Salalcor, salalgust, nusalasal, nusalcap.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Mossego la sal, la sento present en tota la boca en tot moment</p>\r\n\r\n<p>Tra&ccedil;o i salo un cercle/cicle en el sentit del rellotge. al ritme propi que l&#39;acci&oacute; em permet. Estic a les seves mans, s&oacute;c llapis d&#39;una voluntat invisible d&#39;aven&ccedil; imparable, fins a tancar el cercle, una acci&oacute; rodona</p>\r\n\r\n<p>Torno a l&#39;eix vertical, absurd i em desdibuixo canviant de dimensi&oacute;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara sala&#39;m! Em salo i gaudeixo tot el temps immensurable del plaer</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Eix de balan&ccedil;a, amb un rellotge a cada m&agrave; -el que mesura el temps i el que no-, em concentro en la pres&egrave;ncia (present tense!), un ara buit i ple d&#39;acci&oacute; al que li queda poc temps, 30? 10? segons. Ara cent/sent per cent</p>\r\n\r\n<p>...ara riiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiing sincr&ograve;nic</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara em sorpr&egrave;n que els aplaudiments cobreixin el so de les alarmes: un fi fos amb un altre</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Ara d&#39;eixo d&#39;estar, esborro l&#39;eix de la mesura del temps i el seu contrari: marxo</p>\r\n\r\n<p>M&#39;emporto el paper rod&oacute;, la illa blanca de centre i cercle.</p>\r\n\r\n<p>Resta un espai negre sense sal: abs&egrave;ncia.</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	l'Ateneu, Celrà	2014-05-17 13:20:04.158385	2014-11-03 23:29:42.94207
48	42	ca	d'accions i diccions	<p>&nbsp;</p>\r\n\r\n<p>(en el marc de <strong>Poesia als parcs 2014)</strong></p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Acci&oacute; po&egrave;tica que allibera un accionari d&#39;un diccionari</p>\r\n\r\n<p>Acci&oacute; d&#39;aviacci&oacute; de reacci&oacute; a la dicci&oacute;</p>\r\n\r\n<p>Plegats, pleguem</p>\r\n\r\n<p>cadasc&uacute; un avi&oacute;, paraula de paper. Cadasc&uacute; en la direcci&oacute; del vol que vol</p>\r\n\r\n<p><strong>Dicci&oacute; al vent</strong></p>\r\n\r\n<p><strong>acci&oacute; al present</strong></p>\r\n\r\n<p><strong>text al context.</strong></p>\r\n\r\n<p><a href="https://www.facebook.com/poesiaalsparcs"><strong>https://www.facebook.com/poesiaalsparcs</strong></a></p>\r\n	\N	 Ermita de Sant Feliuet de Savassona	2015-01-04 22:05:21.205506	2015-01-04 22:13:33.965796
49	43	ca	esClau	<p>acci&oacute; que complementa un poema llegit als 4 vents unes setmanes abans a l&#39;ermita de Sant Feliu de Savassona (gr&agrave;cies, Ester i Carles):</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>CAP ESCLAU.</p>\r\n\r\n<p>t&eacute; la clau</p>\r\n\r\n<p>cau el cap,</p>\r\n\r\n<p>cau de cap</p>\r\n\r\n<p>cau l&#39;esclau del cap (esclau clau)</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>i l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau de l&#39;esclau</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>els claus cauen de cap per les escales</p>\r\n\r\n<p>&Eacute;s clau: tens la clau.</p>\r\n\r\n<p>La clau de sol.</p>\r\n\r\n<p>Cap &eacute;s clau.</p>\r\n\r\n<p><a href="http://corpologialiveart.blogspot.com.es/">http://corpologialiveart.blogspot.com.es/</a></p>\r\n	\N	Antic Teatre, Barcelona	2015-01-04 23:00:44.744179	2015-01-04 23:21:25.218318
50	44	ca	estOna		intervenció efímera	\N	2015-01-05 00:13:38.832743	2015-07-02 23:53:58.583162
51	46	ca	FRee WILL (x veure +) 	<p><strong>free will</strong> &ndash; lliure albir. Lit.: lliure voluntat</p>\r\n\r\n<p>t&iacute;tol i tema triats per incertesa metaf&iacute;sica.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>(x veure +)</strong></p>\r\n\r\n<p>acci&oacute; sense acci&oacute;</p>\r\n\r\n<p>i veure</p>\r\n\r\n<p>veure-us</p>\r\n\r\n<p>obrir el llibre a l&#39;albir.</p>\r\n\r\n<p>A trav&eacute;s del llibre,</p>\r\n\r\n<p>veure amb ulls que no veuen,</p>\r\n\r\n<p>veure +</p>\r\n\r\n<p>Coneixe-ment</p>\r\n\r\n<p>en un altre sentit.</p>\r\n\r\n<p>La informaci&oacute; embena els ulls</p>\r\n\r\n<p>x a veure +</p>\r\n\r\n<p>la imatge interior encertada,</p>\r\n\r\n<p>la intenci&oacute; certa</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>allibero els o/u(ll)s.</p>\r\n\r\n<p>o van on volen</p>\r\n\r\n<p>o van on vull</p>\r\n\r\n<p>o van on havien d&#39;anar</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>...dansa lliure a l&#39;albir.</p>\r\n	\N	Cicle d'Art d'Acció La Carbonera, Girona 	2015-07-03 00:07:38.029673	2015-07-03 00:12:11.465762
52	47	ca	elGrandTour	<p>Sin&egrave;rgies i elements trobats autour del proc&eacute;s creatiu basat en la intu&iuml;ci&oacute;.</p>\r\n\r\n<p>Acci&oacute; col&middot;lectiva amb Denys Blacker, Carlus Camps, Natalia Espinet, Rotnip, Lesley Yendell, Mireia Zantop.</p>\r\n\r\n<p>en el marc del Grand Tour:</p>\r\n\r\n<p>Del 26/08 al 13/09/2015, de la Nau C&ocirc;clea a St. Feliu de Gu&iacute;xols, 350km a peu en tres setmanes. Obra d&#39;artistes visuals, ballarins, poetes, m&uacute;sics i performers.</p>\r\n\r\n<p><a href="http://elgrandtour.net">http://elgrandtour.net</a></p>\r\n	\N	Madremanya, Girona	2015-09-27 22:40:27.703182	2015-09-27 22:42:43.772683
53	48	ca	pEs&pressió	<p>(EX-PRESSI&Oacute; &eacute;s-cultura?)</p>\r\n\r\n<p>c&agrave;rrega visible:</p>\r\n\r\n<p>- b&agrave;scula</p>\r\n\r\n<p>- 3 maletes de viatge carregades volunt&agrave;riament amb llibres de pes relatiu i involuntari</p>\r\n\r\n<p>- 5 kg de cadenes</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>pes del cap</p>\r\n\r\n<p>pes del cap en cadenes</p>\r\n\r\n<p>al cap, el pes del cap en cadenes (pressi&oacute;)</p>\r\n\r\n<p>pes del cos</p>\r\n\r\n<p>pes del cos en llibres</p>\r\n\r\n<p>construcci&oacute;; s&#39;aguanta per pressi&oacute; del cap</p>\r\n\r\n<p>a sobre, pes de les cadenes, s&#39;aguanta per pressi&oacute; del cos, agenollat</p>\r\n\r\n<p>cos de cap, cos de pes (equilibri per pressi&oacute;)</p>\r\n\r\n<p>pel propi pes de la pres(si)&oacute;</p>\r\n\r\n<p>la consci&egrave;ncia defineix el moment d&#39;alliberacci&oacute;</p>\r\n	\N	Antic Teatre, Barcelona	2016-08-01 15:36:44.498892	2016-08-01 15:36:44.498892
54	49	ca	aux bleux aigus d'acier et de cristal	<p>Festival Pepe Sales, Homenatge a Ren&eacute;e Vivien</p>\r\n\r\n<p>Marta Vergony&oacute;s i Mireia Zantop</p>\r\n	\N	Auditori de La Mercè, Girona	2016-08-01 15:46:04.562559	2016-08-01 15:48:05.399932
58	53	ca	FluxUs	<p>MUGA CAULA 2016.</p>\r\n\r\n<p>Performance en el Museu de l&#39;Empord&agrave;.</p>\r\n\r\n<p>Exposici&oacute; material gr&agrave;fic i audiovisual de la Muga Caula.</p>\r\n\r\n<p>Homenatge.</p>\r\n	\N	Museu de l'Empordà, Figueres	2016-08-01 17:43:57.124514	2020-02-19 17:17:17.26401
101	82	es	Phoscenes	<p>Dibujos del confinamiento, exposici&oacute;n del 18 de septiembre al 30 de octubre 2020 en Lapek (Lavern Subirats) i Madremanya (Girona).</p>\r\n	mixta s/ papel	\N	2022-01-05 20:06:46.252987	2022-01-05 20:07:42.792587
57	52	ca	eventuall	<p>Corpologia 20</p>\r\n\r\n<p>(tra&ccedil;os al vent eventual del ventall)</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>Preparacci&oacute;:</strong></p>\r\n\r\n<p>un llibre-poema a l&#39;aire lliure.</p>\r\n\r\n<p><strong>Inspiracci&oacute;:</strong></p>\r\n\r\n<p>inspiro i escric, sense fer correccions.</p>\r\n\r\n<p><strong>Ventilacci&oacute;:</strong></p>\r\n\r\n<p>el vent del ventall de possibilitats selecciona el que ha de ser sentit:</p>\r\n\r\n<p>Acci&oacute; eventual.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Nota visual: llibre i ventall, ess&egrave;ncies congruents.</p>\r\n\r\n<p>Nota musical: sis p&agrave;gines d&#39;ai -res muts.</p>\r\n\r\n<p>Nota de peu:</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>(ai-)</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>SO</p>\r\n\r\n<p>TO</p>\r\n\r\n<p>TOT</p>\r\n\r\n<p>O</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>SO</p>\r\n\r\n<p>TO</p>\r\n\r\n<p>TOT</p>\r\n\r\n<p>O</p>\r\n\r\n<p>RES</p>\r\n\r\n<p>....</p>\r\n\r\n<p>RESS&Ograve;</p>\r\n	\N	La Fàbrica, Celrà	2016-08-01 16:58:26.654279	2016-08-01 16:58:26.654279
71	66	ca	per se	<p>N&ordm;5 CORPOLOGIA&gt;25</p>\r\n\r\n<p>Inauguraci&oacute; de l&#39;exposici&oacute; de Denys Blacker<strong> Mapes ef&iacute;mers, complicitats i sincronies</strong></p>\r\n\r\n<p>Instal&middot;laci&oacute; a l&#39;aparador de la sala d&#39;exposicions del 14 al 21 de juny per gentilesa de Denys Blacker.</p>\r\n	\N	Bòlit Centre D'Art Contemporani, Girona	2018-08-22 15:12:28.300594	2018-12-21 20:09:58.560882
61	56	ca	cromoSomX	<p>Corpologia 24.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>Reflexi&oacute; intuitiva</p>\r\n\r\n<p>que assenyala identitats,</p>\r\n\r\n<p>emmiralla all&ograve; propi i apropiat,</p>\r\n\r\n<p>com&uacute; i diferenciador.</p>\r\n\r\n<p>Relaci&oacute; de poder d&#39;oposats i equilibri</p>\r\n\r\n<p>entre desig i perm&iacute;s rec&iacute;proc</p>\r\n\r\n<p>entre forma i fons de la unitat dual.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><strong>x (fem.) Present en refleXi&oacute;, seXe i eXpressi&oacute; de g&egrave;nere.</strong></p>\r\n\r\n<p>Lletra de l&#39;alfabet. Signe de multiplicaci&oacute;. Signe que representa la inc&ograve;gnita que no es vol o pot dir.</p>\r\n\r\n<p>Signe de creuament. Signe que defineix un punt en l&#39;espai. Cromosoma sexual present en mascles i femelles de l&#39;esp&egrave;cie humana.</p>\r\n	\N	Matèric Cuerpo/Objeto/Espacio. L'Hospitalet de Llobregat	2016-10-19 22:54:30.251459	2017-06-02 00:09:34.318544
68	63	ca	Flux (...)	<p>La Muga Caula, Trobada internacional de poesia d&#39;acci&oacute; i performance</p>\r\n	\N	Les Escaules, Girona.	2017-06-02 00:01:33.881666	2018-08-22 14:36:16.870776
72	67	ca	ip(sum), id(est)	<p>Acci&oacute; a la Fundaci&oacute; Valvi en el marc del festival Inundart, Girona</p>\r\n\r\n<p>1 de juliol de 2018</p>\r\n	Performance, dibuix amb el cos, carbó, saliva i aigua.	\N	2018-08-22 15:22:59.132785	2018-12-21 20:56:16.075856
73	68	ca	quid de la qüestió	<p>NIT DE PERFORMANCE&nbsp; 18 d&#39;agost, 2018. Continuum d&#39;accions paral&middot;leles a l&#39;esgl&eacute;sia de Sta Ll&uacute;cia i La Carbonera en el marc de l&#39;exposici&oacute; <strong>&quot;Mapes ef&iacute;mers, complicitats i sincronies&quot;</strong>, B&ograve;lit centre d&#39;Art Contemporani, Girona</p>\r\n\r\n<p>Ocells al Cap, col&middot;lectiu d&#39;art d&#39;acci&oacute;:</p>\r\n\r\n<p>Marina Barsy, Marcela Contreras, Hellen Collard, Nat&agrave;lia Espinet, Pir&ograve;mana d&#39;Arg&oacute;s, Anita Ponton, Sandra Johnston, Montse Ser&oacute;, Holly Slingsby, Martine Viale, Ada Vilar&oacute;, Lesley Yendell, Mireia Zantop</p>\r\n	\N	Església de Sta. Llúcia, Girona	2018-08-22 15:29:30.559934	2018-12-21 21:13:46.396649
74	69	ca	Ipse Ipsa Ipsum(em)	<p>2n cicle<strong> PARLEM CONTEMPORANI?</strong></p>\r\n\r\n<p>Ipse, ipsa, ipsum(em)</p>\r\n\r\n<p>[del llat&iacute;, ell mateix, ella mateixa, un mateix] + [del llat&iacute;, soc] + [del catal&agrave;, sumem]</p>\r\n\r\n<p>: acci&oacute; entre rastres d&#39;identitats estimades.</p>\r\n\r\n<p>Entre: cicles d&#39;entrar sortint, de definir desdibuixant, del flux de relacions interrogants.</p>\r\n	\N	Convent de les Arts, Alcover	2019-01-18 23:45:26.102019	2019-01-28 20:30:00.140779
69	64	ca	fluxus	<p>Festival La Muga Caula</p>\r\n\r\n<p><strong>Exposici&oacute; col&middot;lectiva homenatge a Ben Patterson. </strong></p>\r\n\r\n<p><strong>Galeria Dolors Vent&oacute;s, Figueres.</strong></p>\r\n\r\n<p>Obra-acci&oacute; iniciada abans de la inauguraci&oacute;, completant-se durant l&#39;exposici&oacute;.</p>\r\n	tinta i aigua sobre paper, bossa de suero i equip de perfusió, picarols	\N	2017-06-02 00:41:14.374509	2019-01-28 20:37:54.476589
64	59	ca	idenDitat	<p>Festival Flors i Violes.</p>\r\n\r\n<p>Introducci&oacute; i veu: Francesc Oui</p>\r\n\r\n<p><a href="http://francescoui.com">http://francescoui.com</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Fundació Cuixart, Palafrugell	2017-06-01 22:46:09.186381	2019-03-07 22:10:16.110711
59	54	ca	DONAR VEU al desig	<p>Performance participativa a l&#39;espai p&uacute;blic per generar reflexi&oacute; i consci&egrave;ncia personal i social sobre all&ograve; que solem silenciar.</p>\r\n\r\n<p><strong>les Mireies</strong> som Mireia Chalamanc i Mireia Zantop</p>\r\n	\N	Espai públic de Manlleu, Torelló, Tona i Vic	2016-08-01 17:50:44.223621	2020-06-15 15:27:55.925838
79	74	ca	paisatge líquid	<p><strong>Exposici&oacute; col&middot;lectiva i taller &quot;La pell com a paisatge&quot;</strong></p>\r\n\r\n<p>de Tatiana Blanc, Eva Miquel, Victoria Raval, Lesley Yendell i Mireia Zantop</p>\r\n\r\n<p>a La Pedrera, Subirats.</p>\r\n\r\n<p>&nbsp;</p>\r\n	obra original sobre paper i obra gràfica	\N	2019-06-10 20:41:51.28195	2020-02-19 17:23:07.108279
78	73	ca	trans form/morf I-VII		manipulació de materials naturals	\N	2019-04-15 11:41:07.655355	2019-04-15 11:41:07.655355
75	70	ca	PetrAperta	<p>improvisacions en proc&eacute;s: di&agrave;leg amb la pedra</p>\r\n\r\n<p>des del 2018</p>\r\n		\N	2019-01-28 21:07:00.401383	2020-09-20 21:15:52.235421
7	7	ca	possibles IMpossibles	<p>un cos, dos cossos, una acci&oacute; sobre els propis l&iacute;mits i la cooperaci&oacute;</p>\r\n\r\n<p>Co-creaci&oacute; i realitzaci&oacute; amb Norma Ros</p>\r\n\r\n<p>&nbsp;</p>\r\n	\N	Sala Calassanç / Barcelona	2013-01-04 20:49:50.041175	2019-06-10 20:19:22.443508
80	75	ca	EnClauDeBes	<p>Instal.lacci&oacute; po&egrave;tica</p>\r\n\r\n<p><strong>Fisures</strong> I Trobada i Mostra d&#39;Art Multidisciplinari de Palafolls</p>\r\n\r\n<p>acci&oacute;: 12 de juliol de 2014</p>\r\n	escala de fusta, martell, claus, paper fet a mà, roba de lli, alfabets, branques de diferents arbres i arbustos, pintallavis marró	\N	2019-06-10 21:35:33.868726	2019-06-10 21:35:33.868726
81	76	ca	gravat 9	<p>Accions fotogravades i poesies visuals (s&egrave;ries continus-discontinus i rius de cel)</p>\r\n\r\n<p>Exposici&oacute; col&middot;lectiva a La Mirada expandida i Can Bast&eacute;, Barcelona</p>\r\n	fotogravat	\N	2019-06-10 21:53:37.333636	2020-02-14 20:58:34.799422
76	71	ca	entrar sortint, sortir entrant		Escultura d'alabastre	\N	2019-03-07 22:44:50.238451	2020-02-14 21:07:05.797199
60	55	ca	DONAR VEU... i fer un pas	<p>Performance participativa de llarga durada en l&#39;espai p&uacute;blic per donar veu a all&ograve; que solem silenciar</p>\r\n\r\n<p>entorn de la <strong>viol&egrave;ncia de g&egrave;nere</strong></p>\r\n\r\n<p><strong>Les Mireies</strong> som Mireia Chalamanch i Mireia Zantop</p>\r\n	\N	Igualada, Sta. Margarida de Montbui i Vilanova del Camí, Conca d'Òdena	2016-08-01 17:54:00.857897	2020-06-15 15:43:34.388645
102	13	es	constelacciones	<p>Acci&oacute;n in&eacute;dita realizada con Elisabetta Balasso.</p>\r\n	dibujo sobre piel	\N	2022-01-05 20:10:05.54647	2022-01-05 20:10:05.549086
20	19	ca	TABOo... Ser/reS. Cos/soC	<p>Performance participativa de llarga durada i instal.laci&oacute; a INUND&#39;ART 2010.</p>\r\n\r\n<p>Paraules del que es silencia.<br />\r\nQuant acceptem? Quant tolerem? Som tan lliures (de prejudicis) com creiem?</p>\r\n\r\n<p>Reflexi&oacute; sobre el concepte del tab&uacute;. Reflexe de la nostra mirada sobre el ser i el cos,&nbsp; relaci&oacute; amb la intenci&oacute; en la projecci&oacute; subjectiva i el prejudici socio-cultural implicat a l&#39;hora de identificar les seves subtils aparences simb&ograve;liques.</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>La construcci&oacute; de la instal.laci&oacute; &eacute;s un work on progress al llarg de dues jornades d&#39;inundart. Eix de la primera jornada: RES versus SER; Eix de la segona part: S&Oacute;C versus COS.</p>\r\n	\N	Centre Cultural La Mercè, Girona	2013-01-20 02:38:43.499575	2020-06-15 15:36:58.247221
77	72	ca	cap cap	<p>&nbsp;</p>\r\n\r\n<p><strong>Festival de Land-art</strong> ArtiGavarres 2019</p>\r\n\r\n<p><a href="http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto">http://www.artigavarres.cat/galeria.php?idc=2#prettyPhoto</a></p>\r\n\r\n<p>Projecte de co-creaci&oacute; amb Aleix Antillach</p>\r\n\r\n<p><a href="http://leix.org">http://leix.org</a></p>\r\n\r\n<p>&nbsp;</p>\r\n	escultures efímeres de palla 	\N	2019-04-10 23:03:30.950809	2020-06-15 15:40:15.938341
85	82	ca	Phoscenes	<p>Dibuixos del Confinament, Exposici&oacute; del 18 de setembre al 30 d&#39;octubre 2020 a Lapek i Madremanya</p>\r\n	mixtes	\N	2020-09-21 08:55:36.139032	2020-10-14 22:53:13.951877
86	83	ca	(des)CUIDAR	<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p><a href="https://lesmireies.com/descuidar">https://lesmireies.com/descuidar</a></p>\r\n	\N	Puig-reig, St.Joan de V., St.Antoni V. i Folgueroles, 	2021-01-04 20:46:08.768568	2021-01-04 20:49:41.681774
104	76	es	gravat 9	<p><strong>Acciones fotograbadas y poes&iacute;as visuales</strong> (serie cont&iacute;nuos-discont&iacute;nuos y serie r&iacute;os de cielo)</p>\r\n\r\n<p>Exposici&oacute;n colectiva en La Mirada Expandida y Can Bast&eacute;, Barcelona</p>\r\n	fotograbado	\N	2022-01-05 20:25:20.171489	2022-01-05 20:26:16.346682
87	84	ca	entre línies, 8ple8buit, veure +	<p>D&#39;ANADA I TORNADA Viatges d&#39;Arts entre Lletres a la Fundaci&oacute; Brossa de Barcelona. Cicle a cura d&#39;Ester Xargay.</p>\r\n\r\n<p>3 accions po&egrave;tiques i 1 video-acci&oacute;, i una presentaci&oacute; de l&#39;obra recent de poesia visual. Amb Ester Xargay i Jordi Aligu&eacute;.</p>\r\n\r\n<p><a href="https://www.fundaciojoanbrossa.cat/arts-entre-lletres/">https://www.fundaciojoanbrossa.cat/arts-entre-lletres/</a></p>\r\n\r\n<p><a href="https://www.nuvol.com/llibres/poesia/art-entre-lletres-lletres-entre-art-136898">https://www.nuvol.com/llibres/poesia/art-entre-lletres-lletres-entre-art-136898</a></p>\r\n	\N	Fundació Brossa, Barcelona	2021-01-04 20:54:14.346009	2021-08-31 23:06:56.970755
90	87	ca	over and over, again and again	<p>Madremanya, Girona/ Donegal, Ireland<br />\r\n<br />\r\n08/08/2021<br />\r\n<br />\r\nV&iacute;deo-performance amb Denys Blacker <a href="https://denysblacker.com">https://denysblacker.com</a><br />\r\nProc&eacute;s creatiu col&middot;lectiu sobre migracions amb Marina Barsy, Denys Blacker, Aodan McCardle, Sandra Johnson, Bernadette Hopkins (curadora) i Isa Fontbona.<br />\r\nV&iacute;deo: Mar Ximenis<br />\r\nPresentat en Regional Cultural Centri Letterkenny Co.Donegal a la tardor de 2021</p>\r\n\r\n<p>WILD SWANS: <a href="https://www.bernadettehopkins.com/wild-swans-performance-art.html">https://www.bernadettehopkins.com/wild-swans-performance-art.html</a></p>\r\n	\N	Madremanya (Spain), San Juan (Puerto Rico) and Donegal (Ireland)	2021-08-31 23:10:08.833939	2022-01-13 20:54:16.142262
94	87	en	over and over, again and again	<p>Video-performance with Denys Blacker&nbsp;</p>\r\n\r\n<p>Group Process on mygrations with Marina Barsy, Denys Blacker Aodan McCardle, Sandra Johnson, Bernmadette Hopkins (curator in charge) and Isa Fontbona.</p>\r\n\r\n<p>Video: Mar Ximenis</p>\r\n\r\n<p>To be exhibited, in the Regional Cultural Centre Letterkenny Co.Donegal in the Autumn 2021</p>\r\n\r\n<p>WILD SWANS: <a href="https://www.bernadettehopkins.com/wild-swans-performance-art.html">https://www.bernadettehopkins.com/wild-swans-performance-art.html</a></p>\r\n	\N	Madremanya (Spain), San Juan (Puerto Rico) and Donegal (Ireland)	2021-09-26 16:57:03.774287	2021-11-19 22:01:54.690653
93	88	en	ULL! agulles	<p>&nbsp;festival&nbsp; MICROSCOPIES 2021</p>\r\n\r\n<p>Cocreaci&oacute; i coproducci&oacute; d&#39;ALEIX ANTILLACH I MIREIA ZANTOP</p>\r\n\r\n<p>Construint, com dibuixant, mirem, coneixem i potser reconeixem. Juguem amb el paisatge ind&ograve;mit i domesticat. Juguem amb l&rsquo;escala, la mida i la mesura que la nostra mirada conjuga.</p>\r\n\r\n<p>Cat&agrave;leg virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Premsa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instal·lació amb estaques.	\N	2021-09-20 20:36:36.429491	2021-09-20 20:36:36.432545
92	88	ca	ULL! agulles	<p>festival de Land Art MICROSCOPIES 2021</p>\r\n\r\n<p>Cocreaci&oacute; i coproducci&oacute; d&#39;ALEIX ANTILLACH I MIREIA ZANTOP</p>\r\n\r\n<p>Construint, com dibuixant, mirem, coneixem i potser reconeixem. Juguem amb el paisatge ind&ograve;mit i domesticat. Juguem amb l&rsquo;escala, la mida i la mesura que la nostra mirada conjuga.</p>\r\n\r\n<p>Cat&agrave;leg virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Premsa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instal·lació amb estaques.	\N	2021-09-20 19:33:22.589456	2021-09-26 17:13:49.856907
96	85	es	SI i/o NO, torno i no torno	<p>Video-acci&oacute;n para la Exposici&oacute;n itinerante <strong>Plurivisions de Fel&iacute;cia Fuster</strong></p>\r\n\r\n<p>Realizaci&oacute;n del video: Adolf Alca&ntilde;iz</p>\r\n\r\n<p><a href="https://tempsarts.cat/felicia-fuster-plurivisions/">https://tempsarts.cat/felicia-fuster-plurivisions/</a></p>\r\n	\N	Arts Santa Mònica, Barcelona	2021-09-26 20:50:13.269672	2021-09-26 20:50:13.272148
100	92	es	obra gráfica	<p>Estaremos en Bilbao en el Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	grabado calcográfico i serigrafía sobre diversos papeles i soportes	\N	2021-11-20 13:40:05.73467	2022-01-05 20:02:40.480179
99	92	en	prints	<p>&nbsp;FIG Bilbao al Festival Internacional de Grabado y arte sobre papel: Eul&agrave;lia Espasa, Bess Frimog, Roser Sales, Mireia Zantop.</p>\r\n\r\n<p><a href="http://www.figbilbao.com">http://www.figbilbao.com</a></p>\r\n\r\n<p><a href="https://figonlinefair.com/artista/mireia-zantop/">https://figonlinefair.com/artista/mireia-zantop/</a></p>\r\n	gravat calcogràfic i serigrafia sobre diversos papers i suports	\N	2021-11-20 13:37:15.600703	2021-11-20 13:37:15.603289
98	88	es	ULL! agulles	<p>Festival de Land Art MICROSCOPIES</p>\r\n\r\n<p>Manresa, 2021</p>\r\n\r\n<p>Cocreaci&oacute;n i coproducci&oacute;n de ALEIX ANTILLACH y MIREIA ZANTOP</p>\r\n\r\n<p>Construyendo, as&iacute; como dibujando, miramos, conocemos y, tal vez, reconocemos. Jugamos con el paisaje ind&oacute;mito y el domesticado. Jugamos con la escala, el tama&ntilde;o y la medida que nuestra mirada conjuga.</p>\r\n\r\n<p>Cat&aacute;logo virtual: <a href="https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/">https://meandremanresa.com/2021/08/20/propera-sortida/microscopies_2021/</a></p>\r\n\r\n<p>Prensa: <a href="https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet">https://www.naciodigital.cat/manresa/noticia/98872/segona-microscopies-es-fara-torre-lluvia-amb-obres-efimeres-permanent-angels-freixanet</a></p>\r\n	Instalación efímera en el paisaje	\N	2021-11-19 21:41:37.138667	2022-01-05 20:16:55.148213
103	71	es	entrar saliendo, salir entrando		Escultura de alabastro	\N	2022-01-05 20:21:12.669864	2022-01-05 20:21:12.67258
109	44	es	estOna	<p>Intervenci&oacute;n ef&iacute;mera en el sector &quot;Ona&quot; en la Alta Garrotxa.</p>\r\n\r\n<p>ona = ola</p>\r\n\r\n<p>estona = rato</p>\r\n\r\n<p>est = este, punto cardinal, o es, del lat&iacute;n</p>\r\n\r\n<p>visibilizaci&oacute;n de una l&iacute;nea de est-ratos</p>\r\n\r\n<p>&nbsp;</p>\r\n	intervención efímera	\N	2022-01-05 21:31:18.943235	2022-01-05 21:38:07.451519
108	64	es	fluxus	<p>Festival La Muga Caula</p>\r\n\r\n<p><strong>Exposici&oacute;n colectiva en homenaje a Ben Patterson. </strong></p>\r\n\r\n<p><strong>Galeria Dolors Vent&oacute;s, Figueres.</strong></p>\r\n\r\n<p>Acci&oacute;n-instalaci&oacute;n iniciada antes de la inauguraci&oacute;n, completando-se durante la exposici&oacute;.</p>\r\n	tintas sobre papel, bolsa de suero, equipo de perfusión, cascabels	\N	2022-01-05 21:18:23.188331	2022-01-05 21:20:49.99799
110	73	es	trans form/morf I-VII		manipulación,transformación, reubicación de materiales naturales 	\N	2022-01-05 21:43:08.66151	2022-01-05 21:43:08.663907
112	75	es	EnClaveDeBes(os)	<p>Instalacci&oacute;n po&eacute;tica</p>\r\n\r\n<p><strong>Fisures</strong> I Encuentro y Muestra de Arte Multidisciplinario de Palafolls</p>\r\n\r\n<p>acci&oacute;n: 12 de julio de 2014</p>\r\n	Escalera, martillo, clavos, papel hecho a mano, ropa de lino, alfabetos, sonidos, ramas, pintalabios	\N	2022-01-10 11:45:29.813529	2022-01-10 11:45:58.782086
111	14	es	AflorA	<p>Exposici&oacute;n de obra gr&aacute;fica original, Sin&egrave;rgia, Vic.</p>\r\n	calcografía y serigrafía	\N	2022-01-05 21:50:21.122443	2022-01-10 11:21:20.719942
105	74	es	paisaje líquido	<p><strong>Exposici&oacute;n colectiva y taller &quot;La piel como paisaje&quot;</strong></p>\r\n\r\n<p>de Tatiana Blanc, Eva Miquel, Victoria Raval, Lesley Yendell y Mireia Zantop</p>\r\n\r\n<p>en La Pedrera, Subirats.</p>\r\n\r\n<p>&nbsp;</p>\r\n	obra original sobre papel y obra gráfica	\N	2022-01-05 20:33:13.007013	2022-01-10 11:22:41.06805
113	38	es	ad hoc	<p>serie de acciones e intervenciones improvisadas ad hoc</p>\r\n\r\n<p>&nbsp;</p>\r\n\r\n<p>&nbsp;</p>\r\n	movimiento y relación con y entre los objets trouvés, acción, escultura e instalación efímera	\N	2022-01-10 11:49:06.041888	2022-01-10 11:49:06.044599
\.


--
-- Name: action_text_rich_texts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.action_text_rich_texts_id_seq', 1, false);


--
-- Name: active_storage_attachments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.active_storage_attachments_id_seq', 1240, true);


--
-- Name: active_storage_blobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.active_storage_blobs_id_seq', 1240, true);


--
-- Name: active_storage_variant_records_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.active_storage_variant_records_id_seq', 135, true);


--
-- Name: friendly_id_slugs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.friendly_id_slugs_id_seq', 295, true);


--
-- Name: image_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.image_translations_id_seq', 594, true);


--
-- Name: images_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.images_id_seq', 473, true);


--
-- Name: page_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.page_translations_id_seq', 4, true);


--
-- Name: pages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.pages_id_seq', 2, true);


--
-- Name: section_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.section_translations_id_seq', 32, true);


--
-- Name: sections_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.sections_id_seq', 22, true);


--
-- Name: tag_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.tag_translations_id_seq', 93, true);


--
-- Name: taggings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.taggings_id_seq', 690, true);


--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.tags_id_seq', 35, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: work_translations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.work_translations_id_seq', 114, true);


--
-- Name: works_id_seq; Type: SEQUENCE SET; Schema: public; Owner: zantop
--

SELECT pg_catalog.setval('public.works_id_seq', 93, true);


--
-- PostgreSQL database dump complete
--

