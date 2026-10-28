<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6399236344 -->
Review (codex) of 95017f1

Verdict: needs_changes

1. **F01** (P1) The new uniform annular proof has unowned inputs

   **Location.** packages/DeligneWeightsAndPurityPartII/README.md:623: “deduced from Proposition 6.6 and Theorem 6.10”. Its Needs line names the tube construction, classical analytic operations, radial calculations, finite-stage descent and alterations.

   **Claim.** These inputs account for the stated route to one annular radius that works for every invertible coefficient order, in both characteristics. They do not: the route consumes uniform preparation of sliced nearby cycles and the positive-characteristic annular covering theorem, neither stated here nor supplied by those cited sections. This is a proof-ownership defect, not a counterexample to Ito's theorem.

   **Witness (source).** ITO20 line 1489 applies Corollary 3.17: one alteration works for every invertible n. ITO20 lines 1630 and 1665 invoke Theorems 6.2 and 6.3 to obtain annular components and Kummer trivialization.

   Corollary 3.17 is at ITO20 line 803, printed pp. 17–18: the base is Noetherian excellent, the morphism separated of finite type, and the conclusion includes arbitrary-base-change compatibility and unipotence of sliced nearby cycles simultaneously in n. This is substantially stronger than the existence/calculus of alterations in SchemeAndStackFoundations §§4.16/4.19. Theorem 6.2, ITO20 line 1427, printed p. 32, decomposes inverse images of sufficiently small annuli under any finite étale punctured-disc cover, also in characteristic p. Theorem 6.3, line 1439, has a precise tameness condition at points with proper generalizations and shrinks an annulus before trivialization. ClassicalAdicEtaleCohomology §§10.1–10.4 supplies radial objects, prime-to-residue Kummer covers and their cohomology; it does not supply this positive-characteristic finite-cover preparation. Section 3.3 here is expressly characteristic zero.

   I read the cited supplier sections and searched main, the indexed open roadmaps and accessible board packages by the objects “sliced nearby”, “uniform unipoten”, annular covers and neighbourhood comparisons. No cited owner supplies these missing inputs. The unavailable board files listed below are not evidence for this finding: it is the specific Needs chain that lacks these inputs. The existing analytic-comparison-automorphisms gap covers a different comparison and cannot supply them.

   **Exact repair.** Keep the full uniform endpoint and its positive-characteristic scope. Before the uniform annular target, add owned, precisely stated targets for (a) coefficient-uniform sliced-nearby-cycle preparation, including its carrier, base-change and unipotence conditions; (b) its analytic direct-image comparison/application, with the hypotheses of ITO20 §§5–6 checked against exact supplier sections; and (c) the general punctured-disc annular decomposition and tame annular trivialization used in Theorems 6.2–6.3. Import any part actually owned earlier by its exact section; otherwise own it here or declare an atomic gap with a named earlier supplier in both README and plan.json. Give the new definitions APIs and three discriminating Checks, individual Needs lines, source locators and a build order leading to §3.4. A citation to Ito alone is not the supplier contract.

   **Repair tests.** For the identity family the nearby-cycle system is constant, the base-change map is identity and the same identity alteration works for every n. For radii εₙ = 2⁻ⁿ, each order separately has a positive radius but their infimum is 0: the quantifier swap needs a uniform input. In characteristic 2, the cover u²−u=T⁻¹ has order-two wild monodromy; after T=Sᵐ with odd m its Artin–Schreier pole order remains odd, so prime-to-2 Kummer pullback does not trivialize it. The general finite Galois cover does. These tests retain both the uniformity and the wild-cover case that the repaired route must explain.

2. **F02** (P3) The smooth alteration input cites the alteration calculus

   **Location.** packages/DeligneWeightsAndPurityPartII/README.md:641 and :693, citing “SchemeAndStackFoundations §§0.9, 0.23a, 4.11, 4.16” for the reduction by alterations.

   **Claim.** Section 4.16 supplies the alteration with smooth generic fibre used in this reduction.

   **Witness.** TauCetiRoadmap/SchemeAndStackFoundations/README.md:6038, §4.16, defines alterations and their calculus. The existence theorem is §4.19 at :6372. ITO20 line 1953 applies de Jong's existence theorem after the purely inseparable parameter extension.

   **Exact repair.** Add SchemeAndStackFoundations §4.19, alteration_theorem, to the uniform-reduction Needs line and Layer 3 dependencies; retain §4.16 for alteration calculus. State that the field theorem is applied to the reduced generic fibre after the indicated parameter extension, with the finite extension and subsequent model spreading retained. No new gap or duplicated alteration theorem is needed.

   **Repair test.** Over an algebraically closed field of characteristic 5, the cusp y²=x³ has singular origin; its normalization s↦(s²,s³) has smooth source and generic degree 1. Section 4.16 recognizes this map as an alteration; §4.19 is the existence input. The corrected citation also covers the characteristic-2 parameter reduction f=(f′)² in README:646, where both tube radii become |t|².

## Verified sound

### Prior findings and their repairs

The prior review's identifiers are F01–F09. None was marked not actionable. I checked each claimed repair against the authored files and current supplier statements, rather than accepting the repair report as evidence.

| Prior finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: ownerless gaps | Repaired | plan.json:2331 has only the named analytic-comparison-automorphisms entry. README:613 says the four fixed-coefficient inputs “are targets of this subsection.” Neither obsolete source-access nor derived-input slug remains in the gap list. |
| F02: geometric Galois restriction | Repaired | README:67: “§F.4.6 VanishingCycles.adicFunctoriality supplies continuous geometric Galois actions, equivariant restriction along field extensions and conjugacy under closure change.” Opened the supplier at :1089; the statement is present. |
| F03: ample positivity | Repaired | README:99: “Section A2.7 ampleIntersectionPositive gives positive intersection of d ample line bundles”. The supplier's §A2.7 at :1228 supplies it; dimension-zero degree is separately retained. |
| F04: duplicate tilting constructions | Repaired | README:468: “This is notation for the supplied equivalences”. README:487 imports tiltField.residueFieldEquiv. PerfectoidSpaces §§P1.6, P1.15, P3.7–P3.8 explicitly own sharp naturality, residue comparison, degrees and componentwise action. The new marked/tame calculation remains here. |
| F05: narrowed neighbourhood theorem | Partly repaired | README:611: “there exists one ε₀ … for every … positive n invertible in O and every i”. This now matches ITO20 Theorem 4.9 in either characteristic. The newly added proof route still lacks the inputs in R01; its alteration locator is R02. |
| F06: copied source sentences | Repaired | README:507 computes “both Q are q” and “the scalar is 1”, followed by eigenvalues (1,2). README:479–481 gives independent action/degree tests. The two earlier source sentences no longer occur in the README. |
| F07: stale parent locators | Repaired | README:9 cites “7.15”; README:325 cites “§§0.7, 0.9 (direct sums)”. Both now resolve to the intended parent statements. |
| F08: incomplete coordinate/composite APIs | Repaired | README:447 says “Its coordinate API consists of the following facts”; README:470 says “Its API records the following supplied compatibilities”. The retained definitions have four and three Check bullets, including the nonreduced quotient, p=2 sign and nonidentity root action. |
| F09: cup compatibility after its consumer | Repaired | README:657 puts cup pullback in §3.5; :673 puts the Galois-stable neighbourhood in §3.6. Its Needs at :685 now uses the earlier §3.5. The Lean docstring uses the new numbering. |

I searched the rest of the package for the repaired patterns: redundant gap slugs, parent §7.16, direct-sum citations to §0.11, duplicate componentwise tilting ownership, the copied phrases and the old §3.5/§3.6 order. They did not recur. Only the declared comparison gap remains; the source records retain their existing keys and access statuses.

### Coverage and principles

Read all 881 README lines, all 74 Lean lines, metadata.toml, all seven source records and the plan's top-level gap list. The README has 30 numbered targets, 33 Needs lines, five layer dependency paragraphs and 112 target Check bullets, plus the three convention Checks. The ten definition/construction sections with APIs have respectively 7, 5, 6, 7, 6, 4, 3, 5, 6 and 6 Check bullets (§§0.1–0.4, 0.8, 2.1–2.2, 3.1, 4.1–4.2). Repeated positive examples are not counted as additional mathematical evidence in the table below.

The main-branch shapes consulted were AnalyticToricGeometry, LocalFieldsRamification and PerfectoidSpaces. The extension begins where the parent's finite-field/curve work stops. The final scope includes bad reduction, p=2 and p=3, all ℓ≠p, set-theoretic complete intersections, c=0 and the rank-zero complete fan. No whole-roadmap re-plan, computational algorithm, sorry'd data, set_option, forbidden import, admitted example or empty Prop carrier was found. R01 concerns bypassed theory in the added proof route. All four reviewed package files, including the source manifest, were left unchanged.

For unchanged material I used only the earlier review's explicit computed adversarial rows: its data API, scalar-power tests, tensor/dual tests, finite-extension tests, tube functoriality and geometric comparison tests. I reread every statement and recomputed the sampled, changed and headline instances below. The earlier review's narrative summaries were not used to certify the added uniform proof.

### Sources: all fifteen seeded targets

The four readable works were checked in their legal cached extractions. Scholze locators are published numbering; Ito locators are arXiv v1. No additional source was required or fetched. The three original works settled as uncertified were not requested again.

| Seeded target | Text and locator read | Hypotheses and result |
| --- | --- | --- |
| 0.3 restricted local datum | SCH12 line 2592, proof of 9.6, p. 309 | The source discusses the Kummer subgroup. The general closed-subgroup datum is an authorial extension: open residue image gives f≥1, and the nonzero tame image gives a genuine restricted datum. It is not misrepresented as a numbered general theorem in Scholze. |
| 0.4 relative purity | SCH12 lines 2518, 2532, 2543, Proposition 9.1, Definition/Proposition 9.2, Conjecture 9.3, pp. 307–308 | Finite coefficient descent, continuity, nilpotence, centered grades and every complex embedding are retained. The abstract marked-group formulation is additional; the local-field specialization agrees with the source. |
| 0.5 subgroup detection | SCH12 lines 2547, 2592, pp. 308–309 | The source permits finite extension and detects on the p-power tower. The broader statement is justified by the explicit local-field quasi-unipotence input, nonzero restricted tame character, finite inertia on grades and powers in both directions. |
| 0.8 geometric WMC | SCH12 line 2543, Conjecture 9.3, p. 308; line 2560 for local factors | Proper smooth X, actual geometric cohomology, geometric Frobenius and weight i+j agree. Disconnected/empty cases use zero groups and finite permutation H⁰. The L-factor bound is a consequence. |
| 0.10 good reduction | SCH12 line 2564, p. 308 | Good-reduction weights are recalled. Unramifiedness and N=0 use the supplied smooth proper base change; proper smooth finite-field purity is the parent's §7.15. No projectivity hypothesis is introduced. |
| 1.2 all function-field places | SCH12 lines 2571, 2652, Theorems 9.4/9.6, pp. 308, 311; DEL80 line 1528, Theorem 1.8.4, pp. 175–176 | Derived application of the curve theorem by spreading out. At bad places apply it on U∪{v}; use the place's residue cardinality. Separable-closure field comparison is supplied. |
| 2.2 composite Galois equivalence | SCH12 lines 2592–2598, proof of 9.6, p. 309 | K is the completed p-root tower; K♭ is the completed perfection of F_q((t)). The package now imports the componentwise and degree-preserving constructions and only names their composite. |
| 2.3 Tate coordinates/residue | SCH12 line 2597, p. 309, with the supplier's tilt construction | The prime-to-p torsion claim is a proved multiplicative-coordinate consequence, not a verbatim numbered source theorem. If sharp(x)=1, the rth coordinate has both pʳ-power and ℓⁿ-power order, hence is 1. Algebraic closedness supplies equal cardinalities ℓⁿ. |
| 3.2 Huber local constancy | ITO20 lines 99–102, §1.2, p. 3; HUB98 Definition 1.4/Theorem 2.1 | Ito recalls exactly oc-quasi-constructibility and the degreewise punctured-disc consequence in characteristic zero. Radius may depend on j,n. Original Huber text remains uncertified. |
| 3.3 punctured-disc Riemann existence | ITO20 lines 103–106, §1.2, p. 3; LUT93 Theorem 2.2; ITO20 lines 1427–1448, p. 32 | The recalled Kummer trivialization permits p-divisible degree in characteristic zero. The later theorem also explains the distinction from positive-characteristic finite covers. Original LUT93 remains uncertified. |
| 3.5 cup pullback | SCH12 lines 2622–2632, Lemma 9.8, p. 310 | Exact coefficient-module inverse image, its unit and Yoneda composition give multiplication. The inverse restriction map is multiplicative because the restriction is bijective. |
| 4.2 actual comparison | SCH12 lines 2604–2635, Theorem 9.7 and proof of 9.6, pp. 309–310 | All arrows have the correct directions, including inverse tube restriction. Finite-level reductions precede limits. The named automorphism gap correctly records the additional naturality contract; equivariance is not inferred from abstract equal dimensions. |
| 4.4 splitting | SCH12 line 2652, end of proof of 9.6, p. 311 | The source invokes Poincaré duality. The package gives the explicit complementary-pair argument, valid over every field when c≠0 and with a possibly nontrivial top character. |
| 4.5 stable geometric summand | SCH12 lines 2652–2654, p. 311 | The actual multiplicative equivariant comparison and top isomorphism supply the stable complement. Mere injection is correctly insufficient. |
| 4.6 toric WMC | SCH12 lines 2589–2591 and proof through 2654, Theorem 9.6, pp. 309–311 | Finite p-adic k, proper smooth geometrically connected Y, projective smooth fan toric ambient and set-theoretic complete intersection agree. All ℓ≠p and reduction types remain. |

Also checked every changed uniform passage against ITO20: Theorem 4.5(2), line 974, p. 21; Theorem 4.9, line 1003, p. 22; Corollary 4.11, line 1030, p. 23; Theorem 1.4, line 124, pp. 3–4; Proposition 6.6, line 1481, p. 33; Theorem 6.10, line 1586, pp. 35–37; Lemma 6.11, line 1673, pp. 37–38; Lemma 7.1, line 1738, p. 39, and its proof at line 1973, pp. 44–46; Proposition 7.2, line 1774, p. 40; Corollary 7.4, line 1813, pp. 40–41; and Lemmas 7.5–7.7, lines 1846, 1901, 1928, pp. 41–44. The annular, support, cone-truncation and inseparable-exponent statements match these texts. Their upstream proof-input ownership is R01. DJ96 lines 597–606, Theorem 4.1/Remark 4.2, printed p. 66, supports the smooth geometrically irreducible alteration after finite field extension in §4.1.

### Computed adversarial pass

Write T(q) for E² with N(e₁)=e₀, N(e₀)=0 and Φ=diag(1,q); Λ=Z/n with positive n invertible in the valuation ring. These are explicit tests and proof-route checks, not a claim that examples prove the general theorems. A “pass” includes the stated hypotheses; excluded controls are identified.

| Statement | Instances tried | Values computed on both sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions; 0.1 twist | T(2), T(3); arithmetic lift | NΦ(e₁)=2e₀ or 3e₀=qΦN(e₁); ΦNΦ⁻¹(e₁)=e₀/2 or e₀/3. Arithmetic inversion instead gives q. | Pass; opposite sign excluded | None |
| 0.1 datum/rescaling | Z₃⋊Z-hat, Q=2; constants 2,3; Fr=I | t(Φ1Φ⁻¹)=1/2; composite scalar 6; inverse 1/2; identity scalar 1. Fr=I would require 1=1/2. | Pass; wrong coset rejected | None |
| 0.1 compactness | Open 9Z₃; discrete Z[1/2] | t(9Z₃)=9Z₃≠0; discrete open {0} has image 0 and exp(0N)=1 for every N. | Topological condition discriminates | None |
| 0.2 local normalization | Kummer generator; ramification e=2; residue f=3 | Ratio ζ gives coordinate +1; t_restricted=2t′; isomorphism scalar 1/2. Q′=q³ in the unramified test. | Pass | None |
| 0.3 restriction | H′=H; indices 2 then 3; H′=I; ℓ-root tower | Q′=Q; nested Q″=(Q²)³=Q⁶. I has residue image 0; ℓ-root tower tame image 0. | Transitivity passes; forbidden subgroups rejected | None |
| 0.4 purity | T(2); same Φ with N=0; zero module | Grades −1,1 have eigenvalues 1,2, weights 0,2, center 1. With N=0 both lie in grade 0 and would need w=0=2. Zero has no eigenvalues. | Pass | None |
| 0.4 log, scalar extension, rescaling | N²=0; t=3; t→2t; E⊂E′ | exp(3N)=1+3N; log/3=N; (2t)(N/2)=tN; kernels/images unchanged; eigenvalues remain 1,2. | Nonzero character determines N | None |
| 0.4 lift independence | Finite grade image S₃; A=1; τ a 3-cycle | (Aτ)⁶=1=A⁶; eigenvalues 1,ζ₃,ζ₃² all have absolute value 1. General identity uses conjugation order r then exponent r·|F|. | Nonabelian control passes | None |
| 0.4 tensor/dual/twist | T(2)⊗T(2), dual, twist (1) | Tensor eigenvalues 1,2,2,4 and weights 0,2,2,4 have center 2. Dual center −1; twist eigenvalues 1/2,1 and center −1=1−2. | Pass | None |
| 0.5 detection, both directions | T(2), residue index 3 | Restricted eigenvalues 1,8 with base 8 still have weights 0,2 and center 1. Using base 2 incorrectly assigns weight 6 to 8. | Pass; qʳ essential | None |
| 0.6 transport | Constant c=2 and inverse 1/2 | Pullback N=2N′; inverse returns (1/2)(2N′)=N′. | Both directions pass | None |
| 0.7 summands | T(2)⊕T(2); ker N⊂T(2) | Grade dimensions (2,2), center 1; ker N has eigenvalue 1, weight 0, and no stable complement. | Summand theorem passes; subobject version fails | None |
| 0.8 geometric predicate | Point, empty X, two permuted points, P² | H⁰(point)=E, Φ=1; empty groups 0; permutation eigenvalues ±1; P² eigenvalues 1,q,q² in degrees 0,2,4. | Pass, including disconnected/empty | None |
| 0.8 local-factor bound | T(q); H²(P¹) | Invariant eigenvalue 1 gives pole real part 0≤1/2; eigenvalue q gives pole 1=2/2. | Bound direction passes | None |
| 0.9 finite field change | P¹, residue degree 3; inseparable degree p | (1,q) becomes (1,q³), class coordinates (1,1); inseparable geometric dimensions stay (1,1), no new Galois action. | Both directions compatible | Repaired supplier import |
| 0.10 good reduction | P¹; split Tate elliptic curve | P¹: N=0 and weights 0,2. Tate H¹: rank N=1, grades weights 0,2. | Good-model hypothesis separates cases | None |
| 1.1 curve theorem | Legendre at λ=0, p odd; good point; degree-a point | Bad H¹ grades have weights 0,2; good H¹ has only grade 0 of weight 1. Degree-a moduli are 1,qᵃ. | Pass; bad point retained | None |
| 1.2 global function field | P¹ over F_q(t), any degree-f place, including infinity | H⁰,H² eigenvalues 1,qᶠ; weights 0,2 with base qᶠ at every place. | Pass | Repaired action import |
| 2.1 tower degrees/values | p=2,3; stages 0,1,2 | Degrees (1,2,4), (1,3,9); normalized valuation steps (1,1/2,1/4), (1,1/3,1/9). Finite stages discrete; union Z[1/p] nondiscrete. | Pass | API complete |
| 2.1 quotient/sign | k=Q₂(√2), ϖ=√2 | v(ϖ₁)=1/2<1, so [ϖ₁]≠0 mod ϖ but [ϖ₁]²=0; norm(ϖ₁)=−ϖ while sharp(t)=ϖ. | Reduced quotient and unsigned norm excluded | New Checks pass |
| 2.1 density | |t|=1/2, truncated t-series | Tail beginning at tᴺ has norm ≤2⁻ᴺ→0; truncations lie in F_q(t)^perf. | Dense coordinate field | None |
| 2.2 Galois composite | Identity; σζ₃=ζ₃² at p=2; unramified quadratic | β(1)t=t, sharp=ϖ; βσ(ζ₃♭)=(ζ₃♭)²≠ζ₃♭; extension degrees 2=2 and residue sizes q²=q². | Supplied composite behaves as required | Duplicate construction removed |
| 2.3 torsion/residue | μ₃ at p=2; μ₂ in mixed characteristic; ε=(1,ζ₂,ζ₄,…) | Prime-to-p groups both size 3 with exponent action 2; residue units map 1→1. μ₂ sizes are 1 versus 2. ε♯=1 but ε≠1 and has infinite order. | Prime-to-p restriction essential | None |
| 2.4 marking | L=K, k″=F₂((t)); k″=F_q((t^(1/p))) | Q=2 on both sides; scalar 1 preserves eigenvalues (1,2). Second case e=p and scalar p⁻¹; p⁻¹(pN)=N. | Scalar direction passes for p=2,3 | Authorial Check replaces quotation |
| 2.5 transfer | W=T(q)⊕T(q), V=T(q); V=ker N control | First centers 1=1; second gives weight 0≠1 without complement. | Complement necessary | None |
| 3.1 ideal tubes | (T), (T,2T), (ϖT), (T²); ε=|ϖ|² | First two radii |ϖ|²; latter two radii |ϖ|. T=ϖ distinguishes them. Ideal 0 gives full space; ideal (1) gives empty for ε<1. | Generator independence and model dependence agree | None |
| 3.1 functoriality/cofinality | Pullback T=S²; smaller radii; proper P¹ versus A¹ | Preimage inequality |S|²≤ε equals pulled-back tube. Radii shrink to T=0; unit disc omits T=ϖ⁻¹, while proper P¹ comparison covers it. | Pass; properness retained | None |
| 3.2 direct images | Identity disc; n=1 | R⁰=Λ, Rʲ=0 for j>0; n=1 makes all 0. Every radius works in this example. | Recalled consequence passes | Original oc definition uncertified |
| 3.3 punctured cover | T=Sᵐ, m=1,2,p in char 0; Artin–Schreier in char p | Pullback splits into m graphs U=ζS; derivative mSᵐ⁻¹≠0 off 0. AS pole order after Kummer is m/p^v_p(m)>0, prime to p. | Char-zero result and negative control pass | None |
| 3.4 fixed sheaf/amplitude | Disc/origin, rank-two constant F; constant P¹ map | Groups (Λ,0,…) or (Λ²,0,…), b=0 for identity. Constant P¹ pushforward has degrees 0,2, so b=2. | Common bound distinguished from degreewise radii | None |
| 3.4 blow-up and Čech descent | Z=X; duplicate identity cover | Blow-up is empty, but Bl_X(X)⊔X contains id. Augmented Čech H⁰=Λ, positive groups 0; blow-up alone gives 0≠Λ. | Cover correction passes | None |
| 3.4 stabilization/continuity | Shrinking discs, thickened origin | All H⁰ restrictions are id_Λ; colimit Λ=H⁰(origin); all higher groups 0 on both sides. | Pass | None |
| 3.4 uniform endpoint | Completed algebraic closure of F₂((t)); every odd n | ε₀=1; tube/origin H⁰=Z/n, higher groups 0, restriction 1→1 for every n at the same radius. | Full source scope restored | F05 endpoint repaired |
| 3.4 uniform annular images | Identity; T↦T³, residue char 2, n=3 | Identity R⁰=Λ. Cubic direct image rank 3, cyclic permutation matrix; its cover gives constant Λ³. Degree scalar 3=0 in Λ, so averaging is invalid. | Statement passes; proof ownership incomplete | R01 |
| 3.4 wild annular cover | u²−u=T⁻¹, Λ=F₃ | Inertia permutation swaps two stalk generators; (M−1)≠0. Odd-degree Kummer change leaves a nonzero AS class; wild degree-two pullback gives M=1. | Need general Galois cover, not only tame Kummer | R01 |
| 3.4 uniform quantifiers | εₙ=2⁻ⁿ | Every εₙ>0; infₙ εₙ=0, so no common positive radius follows from these separate witnesses. | Illustrates missing uniform input, not a counterexample to Ito | R01 |
| 3.4 annular sheaf comparison | Λ, Λ²; cubic trivialization at n=3 | Restriction is identity on H⁰=Λ and H¹=Λ(−1), or on two copies; stated half-open-support Hⁱ_c=0. On the cover there are three generators in each degree. | Matches Lemma 6.11; no division by degree | None |
| 3.4 truncated-cone descent | Identity proper cover; r=0 and r=−1 | All Cₘ=0, so Hʲ(Cₘ)=0 and Hʲ(C)=0 in required ranges. At r=0 levels m=0,1 require j≤0,−1 respectively. | Truncation direction agrees with Cor. 7.4 | None |
| 3.4 inseparable parameter | Char 2, f=T², f′=T, ε=|t|² | T(V(T),ε)= {|T|≤|t|²}=T(V(T²),ε²). Derivatives 0 and 1 distinguish smoothness of f and f′. | Exponent and smooth reduction pass | R02 fixes its input locator |
| 3.4 forbidden coefficients/empty cases | n=p mixed char; n=1; empty Z | dim H¹(disc,F_p)=∞ versus 0 at origin. At n=1 or empty small tube all groups 0. | Invertibility retained; zero coefficient ring allowed | None |
| 3.5 cup and inverse | Identity restriction, n=3, a=b=2; zero map mod 2 | f*(ab)=f*(1)=1=2·2; inverse gives 1. Zero map sends unit 1→0 and fails. | Pass | Cup target now earlier |
| 3.6 uniform Galois tube | Zero section of P¹ over F₂((t)); cubic in P² | All odd-n small-disc groups (Λ,0,…), unit 1 fixed, product ab preserved. Whole P² has H¹ dimension 0 versus cubic's 2. | Uniform small tube works; arbitrary neighbourhood fails | Strengthened endpoint passes |
| 4.1 approximation | c=0, Y=P¹; point; elliptic y²=x³−x over F₃(t) | Identity dimension 1=1; point dimension 0=0; elliptic x-map degree 2, smooth derivative in x is −1, H¹ dimensions 2 versus 0. | No false total-cohomology isomorphism | None |
| 4.1 positivity/trace | O(1) on P¹; degree-two cover; inseparable closed point | Degrees 1 and 2·1=2; point degree [L:k]=p, not 1. Mod 2 trace 2=0, in Q₂ it is nonzero. | Existing positivity import suffices | F03 repaired |
| 4.2 map/square/limits | Same degree-two approximation, ℓ=2, q=3 | H⁰:1→1; both ambient composites take hyperplane trace 1→2. Equivariance 2·3=3·2. Mod 2ᵐ maps multiply by 2; limit/rationalization do likewise. | Actual arrows, products and top character agree | Gap remains declared |
| 4.3 top isomorphism | d=0; degree 2; disconnected target | Scalars 1, 2≠0 in Q₂. E→E², x↦(x,x), is nonzero but not onto. | Rational coefficients and connectedness needed | None |
| 4.4 native splitting | G=S₃ on Q³, diagonal a,b, dot q, p=xy | q(ax,by)=3xy=cp(x,y); annihilator sum xᵢ=0 dimension 2; intersection diagonal∩plane=0; 1+2=3. | Nonabelian equivariant splitting passes | None |
| 4.4 excluded scalar / top character | Same model char 3; C₂ sign on first line | 3=0, diagonal lies in plane, excluded by hc. Sign model q(g1,g1)=−1=χ(g)q(1,1). | c≠0 and character both discriminating | None |
| 4.4 zero/rank-one | U=U′=0; identities on F₂ lines | V=0⊕V; with c=1 identity case V=V⊕0. Both maps injective in each case. | No hidden char-zero assumption | None |
| 4.5 geometric summand | P¹ to elliptic comparison, i=0,1,2,3 | Image dimensions 1,0,1,0; complement dimensions 0,2,0,0. | Correct stable summands in all degrees | None |
| 4.6 toric endpoint | P⁰, P², split Tate plane cubic | P⁰ eigenvalue 1; P² eigenvalues 1,q,q² in degrees 0,2,4. Tate H¹ N has rank 1 and grade weights 0,2. | Rank-zero fan and bad reduction included | None |
| 4.7 products/hypersurfaces | Empty product; P¹×P¹; Fermat (p,e)=(2,3),(3,2),(p,p) | Point H⁰=E; product ranks 1,2,1 with eigenvalues 1,(q,q),q². Derivative coefficients 1,2 are nonzero; e=p gives all derivatives 0 and a pth power. | Smoothness controls and small primes pass | None |

The only arbitrary-field Lean theorem has c≠0 explicitly. All other uses of inverses are justified by nonzero tame values, positive e/f, Q≥2 or characteristic-zero coefficients. No conclusion uses natural-number subtraction, division by zero, an out-of-range index or the degree of a zero polynomial. The finite-inertia argument works with noncommuting inertia, and equality/iff claims were checked in both directions. The purported pure subrepresentation without complement and the wrong Frobenius direction are explicitly excluded.

### Pinned library and duplication audit

The supplied content checkout is main commit 794d0fcddfd32a8c6bb445faa33347cc578f43b0, in detached checkout form. Its manifest pins Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The following native bodies were opened at those pins. Paths are relative to the respective library repositories.

| File and line | Native declaration and boundary |
| --- | --- |
| Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42, :59 | Field.absoluteGaloisGroup is the algebraic-closure automorphism group; mapOfAlgebra is continuous restriction with scalar towers. It is not automatically an equivalence or injection. |
| Mathlib/RepresentationTheory/Basic.lean:48 | Representation is G →* (V →ₗ[k] V). It has no continuity field. The README supplies continuity where required; the linear splitting legitimately uses an abstract group. |
| Mathlib/NumberTheory/Padics/PadicNumbers.lean:531; Mathlib/NumberTheory/Padics/PadicIntegers.lean:62, :71 | Padic is the Cauchy completion for padicNorm; PadicInt is its norm-at-most-one subring. Both retain the prime fact. These are coefficient carriers, not arbitrary local monodromy data. |
| Mathlib/Algebra/Module/Submodule/Defs.lean:39; Ker.lean:59; Range.lean:57; Mathlib/LinearAlgebra/BilinearMap.lean:112; Mathlib/Order/Disjoint.lean:308 | Submodule records additive and scalar closure; ker is comap of bottom, range is the image submodule, flip exchanges the two arguments, and IsCompl records disjointness and codisjointness. None includes a group-stability condition. |
| Mathlib/LinearAlgebra/Eigenspace/Basic.lean:442 | Module.End.HasEigenvalue requires a nonzero eigenspace; it does not impose algebraicity or the complex absolute values defining a Weil weight. |
| Mathlib/RingTheory/Nilpotent/Exp.lean:50 | IsNilpotent.exp is a finite sum using nilpotencyClass in a rational module. The roadmap uses it on nilpotent endomorphisms, not on its arbitrary-input junk values. |
| Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 | IsPerfPair requires bijectivity of both adjoints. It includes neither equivariance nor a top character. |
| Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:163 | IsPerfectCompl bundles complementary annihilator properties already proved; it does not produce the four-space, nonzero-scalar splitting. |
| Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:309 | isCompl_orthogonal_of_restrict_nondegenerate requires a reflexive single-space form and a nondegenerate restriction. Its conclusion is not the conjunction in duality_splitting. |
| Mathlib/Algebra/Homology/DerivedCategory/Ext/Basic.lean:128 | CategoryTheory.Abelian.Ext.comp is native Yoneda composition. |
| Mathlib/Algebra/Homology/DerivedCategory/Ext/Map.lean:129, :223 | mapExactFunctor and mapExactFunctor_comp supply the exact-functor algebra. Section 3.5 imports it and adds its site/module-sheaf interpretation. |
| Mathlib/CategoryTheory/Sites/SheafCohomology/Basic.lean:56 | CategoryTheory.Sheaf.H is Ext from constant integers in abelian-group sheaves. It does not itself supply the coefficient-module comparison used by cup products. |
| Mathlib/AlgebraicGeometry/Sites/ElladicCohomology.lean:63, :75 | Scheme.ellAdicSheaf and Scheme.EllAdicCohomology give the native integral pro-étale objects. These definitions do not include normalized geometric monodromy and weights. |
| Mathlib/RingTheory/Perfection.lean:633, :789, :825 | PreTilt, its valuation and Tilt exist; Tilt is a fraction field of PreTilt. They do not supply the completed Kummer tower or its perfectoid/Galois comparison. |
| TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99, :146, :310 | inertiaSubgroup, isClosed_inertiaSubgroup and IsArithFrobeniusLift are the native local-field objects; the last convention is arithmetic. |
| TauCeti/NumberTheory/LocalField/Tame/Character.lean:389, :401, :412 | Uniformizer independence, inertiaTameCharacter and its level formula use the positive ratio σ(α)/α. |
| TauCeti/NumberTheory/LocalField/Tame/Quotient.lean:387 | IsArithFrobeniusLift.smul_eq_pow has exponent q; inversion gives this package's geometric q⁻¹. |
| TauCeti/NumberTheory/LocalField/Teichmuller.lean:63 | teichmullerLift is a multiplicative zero-preserving residue section, not an additive coefficient-field embedding. |
| TauCeti/Geometry/Toric/Algebraic/AffineScheme.lean:128 | affineToricScheme is the complex affine monoid-algebra spectrum. It is not the general-field fan toric model required in Layer 4. |

Object searches included local monodromy/filtrations, Weil-number purity, perfect pairings/annihilators, Ext products, perfectoid/tilt carriers, analytic cohomology, tubes and toric schemes. Topological covering-space declarations named monodromy are different objects. No native declaration supplies the relative marked-monodromy or uniform-neighbourhood interfaces. No duplicate fully qualified duality_splitting name was found in the indexed roadmap Lean files.

### Supplier resolution and merge order

Every supplier citation and Needs line was reread this round. Main was used when the roadmap is on main; the roadmap service supplied new roadmap heads otherwise. The table below records the resolved objects, not merely matching names. Service provenance lines are excluded from repository line numbers.

| Supplier and resolved locator | Consumed contract and audit |
| --- | --- |
| TauCetiRoadmap/LocalFieldsRamification/README.md, Layers 0–4 | Finite extensions, e/f, Eisenstein, Teichmüller, inertia and arithmetic tame action. The geometric sign is obtained by inversion; no assertion that the whole Kummer tower is Galois is consumed. |
| TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:978, :1547, :1739, :1938 | §§1.5, 2.1a, 2.4, 2.6 provide coefficient descent, tame comparison, local monodromy, linear filtration and purity. The IsWeilNumber/IsPureEnd names are planned supplier declarations, not claims about the pins. |
| TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:329, :929, :1015, :1058, :1111, :1173 | §§0.1, 1.1–1.5 give the positive trait comparison and sheaf-theoretic monodromy. Its geometric formula NΦ=qΦN matches the two-term test. The linear filtration remains owned by ArithmeticGaloisRepresentations. |
| TauCetiRoadmap/DeligneWeightsAndPurity/README.md:878, :928, :952, :962, :1073, :2049, :2678 | §§0.7, 0.9, 0.11–0.12, 0.19, 5.11, 7.15 provide purity, direct sums, powers, canonical comparison, closed-point curve monodromy and proper smooth finite-field purity. F07's corrected citations resolve. |
| TauCetiRoadmap/EtaleCohomologyFoundations/README.md:504, :522, :540, :1089, :1120 | §§F.2.1–F.2.3, F.3/F.3a, F.4.3–F.4.6, 0.9, F.6, F.10.2 provide base change, finite/adic cohomology, action/restriction, Chern classes, duality and Frobenius conventions. VanishingCycles.adicFunctoriality retains coefficient descent and realization hypotheses. |
| TauCetiRoadmap/PerfectoidSpaces/README.md:4042, :4453, :5713, :8424, :8478 | P1.6, P1.10–P1.15, P1.32a, P3.7–P3.8 provide the perfectoid criteria, sharp/residue comparison, the Q_p tower example, finite-extension degrees and componentwise Galois action. General finite-k coordinates and the marked tame comparison remain additions here. |
| TauCetiRoadmap/AdicEtaleGeometry/README.md:2142 | A1.0.5 includes topologically henselian Tate completion, sufficient for the Galois comparison with chosen closures. It is not an unrestricted statement about arbitrary field completion. |
| TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md, R07.4.1–R07.4.3, especially :5475 | Field of norms and its abstract Galois equivalence are supplied. The p=2 coordinate is signed for norm compatibility; the package correctly distinguishes norm −ϖ from sharp ϖ. |
| TauCetiRoadmap/AdicSpacesPartII/README.md:7466, :7522, :8968, :9228, :9575, :9660 | R0.19.1–R0.19.2 and R1.3–R1.6 supply constructible topology and analytification/base change/properness on the stated rank-one fields. |
| TauCetiRoadmap/AdicSpacesPartIII/README.md:4615, :4986, :7480, :8158 | R2.3–R2.4, R2.8, R2.10 supply generic fibres, equation tubes, proper model comparison and section valuation domains. The finite-ideal gluing/cofinality target here is additional. |
| TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md, §§1.1–1.5, 8.2–8.5, 9.6, 10.1–10.4, 11.1 | Module-sheaf cohomology, support operations, continuity, proper comparison, smooth duality, radial cohomology and general algebraic comparison exist. These do not supply the uniform sliced-nearby-cycle preparation in R01. All-continuous-automorphism comparison is kept as the declared contract. |
| TauCetiRoadmap/SchemeAndStackFoundations/README.md:755, :798, :848, :1508, :5528, :6038, :6372, :6653, :6701 | §§0.7–0.9, 0.23a, 4.11, 4.16, 4.19, 5.2–5.3 provide components, spreading, inseparable invariance, modifications, alteration calculus/existence, proper Chow degrees and Chern projection. R02 corrects which alteration section is used by the new reduction. |
| TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:1228 | A2.7 supplies ampleIntersectionPositive over any field. It applies to the nonempty integral image W with every line bundle equal to H; dimension-zero degree is [κ(W):k]. |
| TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:665, :818, :1155, :3259, :3380, :3534 | §§0.5–0.6, 1.3, 3.4–3.7 supply trace/cup pairings, degree comparison and rational/coefficient/Tate compatibility. The package uses the general algebraic clauses, not the complex Betti specializations also in that range. |
| TauCetiRoadmap/AnalyticToricGeometry/README.md, Layer 0 | Projective-space and product fans, with rank-zero case. |
| packages/AnalyticToricGeometryPartII/design/README.md, NT.0–NT.6; :487, :520, :576 | Available design supplies integral sections, projection/open-topos field naturality, ambient cohomology and approximation. It explicitly includes continuous-automorphism equivariance. Approximation does not assert smoothness/geometric irreducibility. Its later package/head could not be read; see below. |

Ownership was searched through roadmaps list/grep/show against main and the supplied open-head index, and locally across board packages/designs. The scalar and sheaf curve-weight theories, generic alterations, ordinary base change, tilting equivalence and ample positivity are imports. The genuinely new objects here are the marked local datum/detection, finite-k coordinate marking, cohomological neighbourhood results, actual comparison and equivariant splitting. No ownership move from a later roadmap was needed. No finding of a duplicate headline was established. The four accessible indexed board READMEs were also searched; fifteen others returned 404.

Fresh citation resolution found no unresolved roadmap citations or Lean names; its external-library check was unavailable on the service host, so the pins were checked locally as above. The earlier three resolver leads resolve to planned declarations: ArithmeticGaloisRepresentations §2.6 and EtaleCohomologyFoundations §F.4.6.

The prescribed dependency command completed with exit 0 and exactly this output:

~~~text
depcheck: 52 roadmaps, 596 edges, 0 problem(s)
~~~

There was no UPWARD, CYCLE or moved line. This graph result does not detect the absent mathematical inputs in R01.

The single remaining gap, analytic-comparison-automorphisms, appears with identical slug and needs text in README:85 and plan.json:2331. It names ClassicalAdicEtaleCohomology §§8.2, 11.1 and asks for naturality of the proper algebraic–adic comparison over the completed algebraic closure, compatible with products and coefficient reductions. This is a precise comparison contract, not an ownerless prerequisite. Existing scheme Galois restriction is different and is correctly imported. No finding is raised against this declared gap. Conditional acceptance is not recorded because R01 still blocks acceptance.

### Headline signatures, elaboration and padding

| README headline | Suggested.lean treatment |
| --- | --- |
| §§0.5–0.10: detection, transport, summands, finite-extension invariance, good reduction | Named at lines 12–14 as not statable: normalized monodromy filtration, relative datum and graded-weight interfaces are missing. |
| §§1.1–1.2: equal-characteristic cohomological WMC, all global-function-field places | Named at lines 15–17; requires normalized lisse geometric cohomology with its monodromy/weight structure. |
| §§2.1–2.5: coordinate completed tower, marked Galois equivalence, purity transfer | Named at lines 18–20; raw Tilt is not the missing completed tower/perfectoid/marked comparison package. |
| §§3.2–3.6: local constancy, Riemann existence, fixed-sheaf and all-order uniform neighbourhoods, cup compatibility and equivariant application | Named at lines 21–28 with the strengthened endpoint. The analytic/pseudo-adic sites, direct images and support comparisons are missing. The abstract Ext composition fact is already native and imported. |
| §§4.1–4.3: approximation, actual comparison, top isomorphism | Named at lines 29–32; actual toric/tube/projection and normalized cohomology maps are missing. |
| §4.4: equivariant Poincaré splitting | duality_splitting at line 51 states the native complementary-pair implication, with four independent spaces and the top character. Applying it degreewise gives exactly the README conclusion. |
| §§4.5–4.7: geometric stable summand, toric WMC and projective-space/product applications | Named at lines 29–35; the actual comparison and geometric weight/toric interfaces are missing. |

There is one theorem, one import Mathlib, no local definition/instance/opaque declaration, no TauCeti import and no set_option. The prescribed lake env lean invocation from the pinned content checkout exited 0 with only the expected declaration-uses-sorry warning at Suggested.lean:51:8. No module-object build was required.

A separate scratch copy appended #check @TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting and elaborated successfully. Its type retains all four finite-dimensional module structures, both IsPerfPair hypotheses, c≠0, the pairing identity, four representations, both intertwining hypotheses and the top-character law. The annihilator is a submodule of V, namely the kernel of the transpose of q.flip composed with b. It matches README:795; no binder disappeared and nothing was changed.

The one-tactic probe tried simp, rfl and infer_instance on the sole sorried theorem, using backtracking alternatives in a scratch copy. None closed the goal. Reading the native complement declarations above also rules out a direct exact of one matching library lemma: their hypotheses/conclusions are different and omit the equivariant four-space conjunction. The theorem is not a definition, boundary case or mirrored Check. No Lean padding or statable missing headline was found. All Lean commands finished; none was left running. Both TOML files and plan.json parse.

## Not verifiable

- HUB98 Definition 1.4 and Theorems 2.1/3.6 were not readable in the original. The manifest settles them as uncertified. The consequences in ITO20 §1.2 and Theorem 4.5(2) were checked; this does not certify the original definition or full proof.
- LUT93 Theorem 2.2 was not readable in the original and remains settled uncertified. The recalled characteristic-zero formulation in ITO20 lines 103–106 and 1427–1448 was checked. No new request was made.
- HUB96 Theorems 3.7.2/3.8.1 remain settled uncertified. SCH12 Theorem 9.7 and the current supplier statements were read; the original book was not. No new request was made.
- AnalyticToricGeometryPartII NT.0–NT.6 was readable in packages/AnalyticToricGeometryPartII/design/README.md. A package README or main/open-head roadmap version was not available in the supplied copies/index. The design's naturality clauses were checked, without claiming to certify a later package.
- The board-package index was read, and exact indexed-head README requests returned HTTP 404 for: ArithmeticLocallySymmetricSpacesPartII; CompletedCohomologyAndLocalGlobalCompatibilityPartII; CrystallineCohomologyPartII; EndoscopicTransferAndUnitaryTraceComparisonPartII; HigherHidaAndColemanTheory; LawrenceVenkateshMethod; OrdinaryAutomorphicFormsAndModularityLiftingPartII; PELModuliPartII; PadicHodgeTheoryPartII; PadicLocalLanglandsForGL2QpPartII; RealSurfacePeriodIndex; SchemeAndStackFoundationsPartII; ShimuraVarietiesPartII; VStackSheavesAndLisseCategoriesPartII; VectorBundlesAndIsocrystalsPartII. Ownership against those files could not be checked. AnalyticNumberTheory, AutomorphicCongruences, KatoEulerSystems and LogicAndDefinabilityInNumberTheory were readable at their indexed heads and searched. Indexed open-roadmap ownership was checked through the roadmap service; no unexposed head files are claimed read.
- An apparent duplicated closed-subspace symbol in ITO20 line 973 could not be distinguished from extraction corruption: no local PDF renderer was available. It is not treated as a confirmed source error or package finding.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, printed p. 307 (SCH12 line 2524): the source says the exponential evaluates the tame character at an unbound g; it should be evaluated at the quantified inertia element σ; affects nothing.
- **Gap** in SCH12 at the proof of Theorem 9.6, printed p. 309, and Lemma 9.9, printed p. 311 (SCH12 lines 2609, 2647): the source says the alteration's geometric top cohomology is one-dimensional without retaining geometric connectedness; it should be chosen geometrically connected after finite field extension; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "95017f1107874635e3d573514d8beb3e15573e5d", "job": "REV-PKG-DeligneWeightsAndPurityPartII~2", "model": "gpt-6-astra", "worker": "chris-10"} -->
