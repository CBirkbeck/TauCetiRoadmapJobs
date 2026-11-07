# Review of GlobalShtukasAndFunctionFieldLanglandsPartII (pull request #1845 at 1858508)

**Verdict:** needs changes

## R01 (P2) — §4.0 re-plans the Kloosterman–Bessel roadmap that precedes it in the merge order

**Location.** `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md` line 13 (Scope): "Section 4.0 owns the all-prime étale Kloosterman anchor …, the invariant-parameter match, the specialized oper singularity space, its quantized Hitchin comparison and parahoric localization/eigenvalue theorem, the Bessel companion construction and the adjoint rigidity"; and §4.0, lines 608–684.

**Claim.** These constructions are this roadmap's own targets; only Layers KB.5–KB.11 of KloostermanSheavesAndBesselIsocrystals are deferred to it.

**Witness.** The merge order lists KloostermanSheavesAndBesselIsocrystals at line 347 and this roadmap at line 348, so KB is an earlier supplier. Its accepted design, `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`, already plans every object §4.0 builds, from the same sources:

- line 234, *eigenobject*: the exact tensor functor Rep(H) → F-Isoc† with Hecke eigenisomorphism Hk_W(A) ≅ A ⊠ Kl_W, weight zero, and the étale and de Rham eigenobjects (HNY Theorem 1, XZ Theorem 4.1.5) = §4.0 "Construct the étale Kloosterman tensor local system … and its automorphic eigenobject";
- line 282, *trace-companions*: closed-point characteristic polynomials of the rigid and étale objects agree = §4.0 "its geometric-Frobenius characteristic polynomial equals that of the étale Kloosterman realization";
- line 338, *invariant-parameter*: V*//T ≅ h_aff(1)//T_H with P_h(λφ) = λ^h P_h(φ) = P̌_h(N+xE) (XZ Theorem 4.3.3, §4.3.4) = §4.0 "Invariant parameters";
- line 355, *oper-slice*: H_ad-opers with residue ϖ(0) at 0 and slope ≤ 1/h_i at ∞, torsor for x⊕h_{−θ_i}, point xE ↦ d+(N+xE)dx/x = §4.0 "Oper singularities and quantization"; line 386, *quantized-hitchin*, is the filtered quantization;
- line 403, *zhu-identification*: Kl_H^dR(λφ) ≅ Be_H(N+xΣλ^{h_i}E_i) by quantized localization, with the identical finite-central-descent argument ("the difference is a finite central local system extending to A¹ and hence trivial") = §4.0 "Parahoric localization and the de Rham eigenvalue" and its "central descent";
- lines 446–480, the minuscule, quasi-minuscule and tensor de Rham–rigid comparisons, and line 505, *bessel-isocrystal* (companion is Kl_H^{ét,ℓ}(ψφ)_W, pure of weight zero) = §4.0 "Bessel companion construction";
- line 750, *rigidity-local*: H^i(P¹, j_!+E) = 0, Irr_∞ = rank H, adjoint inertia invariants zero, N_∞ = 0 (XZ Corollary 4.5.7, Remark 4.5.8) = §4.0 "Adjoint rigidity in every characteristic"; line 845, *etale-monodromy*, and line 1279, *all-prime-corollaries* (every almost-simple H at every p, the SO₃ inertia image A₄ at p = 2) = §4.0 "Transfer to the étale adjoint realization" and its p = 2 check.

Two symptoms confirm that §4.0 is a second plan rather than an import: the three supplier contracts FormalConnectionsOpers §§F4–F5/F8.4, AffineLieAlgebras §§A7–A8 and PadicDifferentialEquationsAndRigidCohomology §§RD.2.49–RD.6.97, and the sources `andre-bessel`, `zhu-fg`, `xz` and `hny`, serve §4.0 only; and §4.0's transfer step uses the étale Grothendieck–Ogg–Shafarevich formula with no supplier in its *Needs* line, although EtaleDualityAndPerverseSheaves owns it as `curveEulerPoincareSwan` (its README at #1040, line 4921). The two declared PadicDifferentialEquationsAndRigidCohomology gaps (rigid-middle-extension-specialization, pure-isocrystal-geometric-semisimplicity) restate KB's own open contracts G4 and G7 (KB design README lines 1338–1346, 1362–1370).

**Repair.** Reduce §4.0 to what Layer 4 actually consumes, namely Gan–Harris–Sawin Proposition 3.9 and Remark 3.10 (ghs line 450, ghs line 486): the anchor's automorphic component at ∞ is supercuspidal, its parameter has vanishing adjoint inertia invariants and hence lies in no proper Levi, and its algebraic realizations agree with the excursion parameter by normalized Satake and Chebotarev. State those three facts here and import everything else by name: KB.1/eigenobject and trace-companions, KB.2/invariant-parameter, oper-slice, quantized-hitchin and zhu-identification, KB.3/tensor-comparison, KB.4/bessel-isocrystal, KB.6/rigidity-local and KB.11/all-prime-corollaries, in a new `### From TauCetiRoadmap.KloostermanSheavesAndBesselIsocrystals` contract. If KB lacks the product and central-quotient extension from almost-simple to semisimple H, keep that one statement here with its own Checks. Delete the FormalConnectionsOpers, AffineLieAlgebras, andre-bessel and zhu-fg contracts and the RD.* items used only by §4.0, update Scope (line 13) and the Layer 4 Dependencies (line 837), and retire the two PadicDifferentialEquationsAndRigidCohomology gaps in favour of KB's contracts. Any remaining use of the étale Euler–Poincaré formula cites EtaleDualityAndPerverseSheaves `curveEulerPoincareSwan`.

## R02 (P3) — a declared gap is missing from the README, which cites a proof-sketch step in its place

**Location.** README line 91 (PadicDifferentialEquationsAndRigidCohomology contract): "item 3 of RD.6.97 is André's theorem that a solvable differential module … has largest p-adic break at most its largest formal slope at infinity"; and §4.0 line 659 "(PadicDifferentialEquationsAndRigidCohomology §RD.6.97, item 3)".

**Claim.** RD.6.97 supplies André's slope comparison for the Bessel connection of a general dual group.

**Witness.** At the supplier's head (#1002), the theorem of RD.6.97 is about `Kl_{n+1}` alone (parts (a)–(d)); the slope comparison appears only as step 3 of its proof sketch, not as a target. The package's `design/plan.json` declares exactly this as the gap `formal-to-differential-maximal-slope` (supplier PadicDifferentialEquationsAndRigidCohomology §§RD.1.16 and RD.6.52a), but the README's contract (lines 89–95) states only the two other PDE gaps, so the intake and the README disagree.

**Repair.** After R01 the comparison is KB's contract G6 and this item disappears. If any use remains, add `What PadicDifferentialEquationsAndRigidCohomology must provide (gap:formal-to-differential-maximal-slope): …` to the contract and cite that gap at line 659 instead of "RD.6.97, item 3".

## R03 (P3) — §5.4 cites Ciubotaru–Harris Corollary 6.32 for an example that refutes it

**Location.** README line 955 (§5.4, third Check): "Without central compactness, take split G₂ … (ch26, Corollary 6.32 and its proof, p. 25; ch26 line 1192)".

**Claim.** The G₂ witness with the involution s_c and ν = ½ω₂ is in that source.

**Witness.** ch26 line 1192–1205 states Corollary 6.32(1) for an arbitrary compact part s_c and its proof contains no G₂ example; the example (coroot values −1, q^{1/2}, −q^{1/2}, q^{1/2}, −q^{1/2}, −q, the hermitian deformation, unitarity) is SmoothRepresentationsOfLocalGroupsPartII §5.26 (*g2-noncentral-witness*) at #1815, README lines 1420–1428, which §8.0 of this roadmap already names as the owner.

**Repair.** Cite SmoothRepresentationsOfLocalGroupsPartII §5.26 for the example and ch26 Corollary 6.32(1), p. 25 only for the statement it corrects.

## R04 (P3) — §2.3's *Needs* line omits the suppliers its statement names

**Location.** README lines 382–406 (§2.3): "(polar decomposition, as in SmoothRepresentationsOfLocalGroupsPartII §5.1)" and "as in SmoothRepresentationsOfLocalGroupsPartII §6.1"; the *Needs* line (406) lists only §2.2 and ReductiveGroupsPartII §§RG2.5.1–RG2.5.2; Layer 2 Dependencies (line 414) likewise.

**Witness.** SmoothRepresentationsOfLocalGroupsPartII §5.1 (*real-satake-parameter*, README line 1057 at #1815) and §6.1 (*tau-fixed-dual-group*, line 1567) exist and are what the statement uses; the roadmap's own rule is that a *Needs* line lists what the statement needs.

**Repair.** Add SmoothRepresentationsOfLocalGroupsPartII §§5.1 and 6.1 to §2.3's *Needs* line and to the Layer 2 Dependencies.

## Verified sound

**Gate and build.** The worker's gate at 1858508 passes every check (set_option, sorry-data, imports, statement-hygiene, depcheck, stray-files, outside-folder 0, build OK). I elaborated `Suggested.lean` with `lake env lean` from the worktree: exit 0, no output (nothing is declared, so no `sorry` warning). The diff outside the roadmap folder is empty.

**Dependency check.** `gate --depcheck … --movable`: `depcheck: 239 roadmaps, 2350 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.

**Declared gaps.** All 16 slugs in `design/plan.json` have a named supplier; 15 are stated word for word under the README's supplier contracts; the sixteenth is R02. Each `needs` sentence names its hypotheses. Minimality checked against the suppliers: SR.3.3 at #1688 has Casselman's criterion and tempered support but no pseudo-coefficients, elliptic orthogonality or number-field descent; SR.4.2 has pseudoroots and spherical parameters but no isogeny transfer or c-group chart comparison; RG2.5.2 on main constructs the L-group, products and z-extensions but no normal-image L-homomorphism; NilpotentOrbits N2 item 4 on main has representatives but no exceptional orbit tables; DWP §8.5 at #929 is mixedness under the six operations, not integer weights on stacks; the two PDE gaps are not provided by RD.4.58–RD.4.59 or RD.6.77 (see R01 for their overlap with KB's contracts).

**Seeded sample (15 targets), each read at its locator.** 0.1: ch26 line 323, Definition 2.5, matches, including "one (equivalently any) faithful τ". 1.1: laf02 line 11609, Corollaire VII.8 (unique decomposition ⊕σ_χ⊗χ over integer-weight twist classes, σ_χ mixed), and ch26 line 643 (5.5); the integer-weight reading uses laf02 line 11599 ("pur de poids n ∈ ℤ"). 1.2: ch26 line 353, Proposition 2.7, including the final statement that ρ_{u,i} is pure of weight i. 1.4: ghs line 408, Lemma 3.6 with the dynamic-parabolic definition; Corollary 3.8 and Remark 3.13 (ghs line 524). 3.2: lh line 2126, Theorem 6.13 (the commuting square Exc(W_{F_v},Ĝ) → z_{K_n}(G(F_v)) → End C_c); Theorems A and C as cited. 3.6: ch26 line 492, Proposition 3.10(2); the README's q_E refinement is its own and is correct (computed below). 4.4: ghs line 495, Proposition 3.11; the README's finite-order central-character reduction is stricter than the source. 4.5: ghs line 110, Theorem 1.2 (published text, no restriction on p), line 519 Corollary 3.12, line 524 Remark 3.13. 4.8: ch26 line 531, Theorem 4.3 (the README adds a geometricity hypothesis the source's sketch lacks; see Source issues). 5.1: ch26 line 372 (standing hypothesis), line 619 (the table (i)–(iv), with the reversed node numbering noted), Proposition 6.31 at line 1172. 6.5: sun line 667, Theorem 2.11 (ι-mixedness only), ch26 line 731 Expectation 5.9 and line 757 Sketch 5.10. 7.2: ch26 line 193 (b)–(c), Conjecture 9.1 at line 1468, Conjecture 9.5 at line 1521. 7.3: ch26 line 1512, Definition 9.4. 8.0: ch26 line 1554, Proposition 10.2 and its proof (characters separate W-orbits); line 563 Proposition 4.5 (stated for tempered π; the all-irreducible form here rests on SRPII §7.1's cuspidal-support statement, which is Aubert's theorem for every irreducible). 8.5: ch26 line 1657–1675, cases (1)–(5) (values 8/2>1, 4/1>0, 9/1>0, 16/2>1, 13/1>0, 9/1>0, 5/1>0 all match); Theorem 8.5 at line 1384–1393.

**Other locators opened.** ghs 236, 384, 450, 486, 1789; st 4018 (Lemma 11.4, with "because Ĝ is semisimple" at 4035) and 4037; lz 103–111; hny 950, 976 (p good for B, C; p > 3 for F₄, G₂); xz 1994, 2175, 2201, 2329, 2433 (Baldassarri/André slope bound), 2478, 2503 (restriction on p removed), 2512 (A₄); andre-bessel 393 (algebraic coefficients, exterior annulus); fs 1331–1339, 12683, 12745; lh 248, 1574, 1682, 1737, 1870; zhu-fg 377, 748, 950; ty 201; xue 1412; stacks-as 1410, 4359, 4444; glo 19–42 (Theorem 1.1: Z the identity component of the centre, central character ω prescribed, other components constituents of minimal-parabolic principal series).

**Cross-roadmap citations resolved at the heads named in the brief** (counts of ids checked / found): SmoothRepresentationsOfLocalGroups 12/12; SmoothRepresentationsOfLocalGroupsPartII 28/28 (5.1–5.28, 6.1–6.4, 7.1–7.13); GlobalShtukasAndFunctionFieldLanglands 24/24 (its Downstream line 2242 hands the uniformization and the Fargues–Scholze comparison to this Part II, so §§3.1–3.2 are not re-planned); FunctionFieldArithmetic 6/6; HeckeStacksAndLocalShtukas 8/8; DeligneWeightsAndPurity 18/18 (0.1, 0.2, 0.3, 0.6 "Algebraicity and Weil purity from ι-purity at every ι", 0.7, 0.13, 0.17, 0.19, 5.2, 5.3, 5.5, 5.11, 5.12, 7.8, 7.9, 8.5, 8.17, 8.18); LanglandsParameterStacks 9/9; ArithmeticGaloisRepresentations 3/3 (§3.1 covers function fields through AlgebraicCurves' completion bridge); MotivesAndAlgebraicCycles §6.3; FormalConnectionsOpers F4, F5, F8.4; DiamondEtaleCohomology C0; DiamondSixOperations S1.2, S1.5, S2.1–S2.4; on main: ReductiveGroupsPartII RG2.3, RG2.4, RG2.5, RG2.5.1, RG2.5.2; ReductiveGroups 10A, 10B; NilpotentOrbits N0–N2 (N2.1/N2.2/N2.4 are items 1, 2, 4 of N2, the roadmap's own numbering); AffineLieAlgebras A7, A8; EtaleCohomologyFoundations F.0–F.4; SchemeAndStackFoundations Layers 1–2; RepresentationTheory/LieHighestWeight Layers 0 and 6. KloostermanSheavesAndBesselIsocrystals exists as a board package in the merge order (R01).

**Ownership against open work.** Parent GlobalShtukasAndFunctionFieldLanglands (#1490) stops at §§7.6–7.9 and names this Part II for the uniformization and Fargues–Scholze comparison. HeckeStacksAndLocalShtukasPartII (#1844) has no Li-Huerta or uniformization content. ExcursionOperatorsAndSpectralActionPartII (#1832) excludes equal-characteristic local fields. SmoothRepresentationsOfLocalGroupsPartII (#1815) assigns globalization and global Ramanujan–Arthur consequences to its consumers and owns the local spherical theory this roadmap imports. The only second owner found is KB (R01). `scratch/overlaps.md` lists no dropped ids and no other pull request changing this folder.

**Library declarations at the pins** (Mathlib f6090c70, Tau Ceti 358314d4): `Finsupp` (Mathlib/Data/Finsupp/Defs.lean), `Finsupp.mapDomain` (Mathlib/Data/Finsupp/Basic.lean line 267), `Finset.sum_comm` (Sigma.lean line 121, additive of `prod_comm`), `Finset.sum_eq_single` (Finset/Basic.lean line 355), `IsNonarchimedeanLocalField` (Mathlib/NumberTheory/LocalField/Basic.lean line 45); `TauCeti.ClassFieldTheory.WeilGroup` (WeilGroup/Basic.lean line 181), `weilDegree` (line 235, normalized arithmetically as the README says), WeilGroup/Topology.lean, SmoothDiscrete/Basic.lean, Newforms/Satake.lean all present. No Weil–Deligne representation, L-group or L-parameter carrier exists in Tau Ceti at the pin (grep of `WeilDeligne`, `LParameter`, `LanglandsParam`: no hits), so the docstring's "nothing statable" is correct; Property A (§8.4) is statable on `Finsupp` but is algebra on free variables and is rightly not stated. No `#check` file was needed since there is no declaration.

**Adversarial table** (statement; instances; values computed; result).

| Statement | Instances | Values | Result |
|---|---|---|---|
| Conventions, Tate/N directions | q=4, r=diag(1,4), Ne₁=e₀ | rNr⁻¹e₁ = e₀/4 = N e₁/4; weights 0,2; N: gr₂→gr₀ | consistent with r(w)Nr(w)⁻¹=q⁻¹N |
| Conventions, Weil×SL₂ ↔ WD | e upper generator | Ad(diag(q^{-1/2},q^{1/2}))e = q⁻¹e | matches r=φ(w,diag(q^{-1/2},q^{1/2})) |
| 0.1 geometric, Checks | q=4: 2, 3; q=5: (3+4i)/5; e^{i} | weights 1; log₂3∉ℤ; |(3±4i)/5|=1 (weight 0, infinite order since (2+i)/(2−i) is not a root of unity); e^{i} transcendental (Lindemann–Weierstrass) | all as stated |
| 0.2(b), S₃ Check | q=5 and q=4, inertia C₃ | 5≡2 mod 3 so Frob inverts C₃; transposition eigenvalues 1,−1; q=4≡1 mod 3 allows trivial Frob; at q=5 trivial Frob forces σ=σ⁻¹ so σ=1 | as stated |
| 0.3 purity, Checks | diag(1,q), Ne₁=e₀; N=0; Salem quartic | weights 0,2 joined by N: pure of weight 1; N=0 fails gr₂→gr₀; roots of x⁴−x³−x²−x+1: y=x+1/x solves y²−y−3=0, real root x=1.72208380574, other pair on the unit circle | as stated |
| 0.3 vs ch26 Definition 2.6 | directions (ii),(iii) | ch26 line 341–345: (ii) has N lowering weights, (iii) prints N^i: gr_{w−i}→gr_{w+i} | README's corrected reading right; misprint recorded |
| 1.1 twist classes | ℓ=7 over 𝔽₂: 1+i, 1+2i; ℓ=5 over 𝔽₄: 3 | |1+i|=2^{1/2} weight 1, N(1+i)=2 a 7-adic unit; |1+2i|=√5 not 2^{w/2}; 3 is a 5-adic unit | as stated |
| 1.2 boundary propagation | Kl_n at 0; rank-one 3 on G_m/𝔽₄ | eigenvalues on gr at 0: q^{0..n−1} Weil; W has single piece gr_{n−1}; 3 has no integer weight | as stated; (b),(c) need DWP §0.6, present |
| 1.3 Frobenius cocharacter | q=4, diag(2,1/2); diag(1,1); Ĝ a torus (negative control) | ω(α)=log 4>0 so lower Borel; all SL₂ at diag(1,1); a weight-2 character of G_m has no proper parabolic but weight 2, so semisimplicity is needed and is in the hypothesis | as stated |
| 2.1 occurrence relation | L[ε]/(ε²) action; G_m over 𝔽₄(t), ξ=3^{deg} | generalized block dim 2 vs eigenspace dim 1; 3^d≠1 for d≠0 so ξ trivial on no Ξ; ℓ=3 not continuous | as stated |
| 2.3 real part, nonsplit | Res_{L/F}PGL₂, t_w=1, Fr_w swap on V⊕V | eigenvalues 1,1,−1,−1, weight 0, projection to C₂ nontrivial | as stated |
| 3.1 Frobenius bookkeeping | q₁=4, deg v=2, α⁴+α+1=0 | α⁴=α+1≠α; α¹⁶=(α+1)⁴=α; bound 3→5→7 with κ=2 | as stated |
| 3.1 congruence model | O_v[x,(1+zx)⁻¹], x∗y=x+y+zxy | (1+zx)(1+zy)=1+z(x∗y); special fibre G_a | as stated |
| 3.6 residue degree | E/F unramified quadratic, χ(ϖ_E)=q_F or q_F^{1/2} | induced Frob eigenvalues ±q_F^{1/2} (weight 1) resp. ±q_F^{1/4} (weight 1/2); E=F(t^{1/p}) gives unipotent part of dim p−1 | as stated |
| 4.0 slope bound | A₁: r=1,h=2,dim 3; G₂: r=2,h=6,dim 14 | 3/2→Irr≤1; 14/6<3→Irr≤2 | as stated |
| 4.0 boundary sequence | self-dual E, ker N at 0 of dim r | invariants 0 by self-duality and H²_c=0; r+dim(∞ part)≤dim H¹_c≤Irr_∞≤r forces equality | sound, but owned by KB (R01) |
| 4.0 A₄ invariants | SO₃ at p=2 | (3·1−1·3+0·8)/12=0 | as stated |
| 4.0 trace comparison | q=4, weight-2 H²_c vs H¹_c | moduli 4 vs ≤2; ker N at 0 of normalized Sym² has eigenvalue q⁻¹=1/4 | consistent; L(T)=1−T/4 not independently recomputed |
| 4.1 ι-tempered, Checks | Salem ζ; ζ₃ over Q(ζ₃); (3+4i)/5 | central modulus 1.72208 at the real embedding; ζ₃,ζ₃² both modulus 1; all conjugates of (3+4i)/5 modulus 1 | as stated |
| 4.3 Euler–Poincaré pseudo-coefficient | PGL₂ | tr(St)=1 after normalization gives tr(1)=−1, principal series 0 | as stated |
| 4.4 essentially discrete | GL₂, q=4, St⊗χ∘det, χ(ϖ)=3 | central value 9, pair (6,3/2), ratio 4 | as stated |
| 5.1 separators | PSO₈: ½ω₁, ½ω₂, ½ω₄; PSO₁₂; PGL₂×PGL₃; 𝔽₂((t)) | half-spin at ½ω₁: 2,0,−2 with 1,6,1; at ½ω₂: ±1 with 4,4; at ½ω₄: ±1/4 pairings; vector only 0,±1/2 at ½ω₄; PSO₁₂ pairings 3/4 and 1/2; (1/4,−1/4) integral on adjoint, ±1/4 on standard; classes of 1+t^{2n+1} distinct in F^×/F^{×2}, 𝔽₃((t)) index 4 | as stated |
| 5.2 lifting obstruction | p=2 vs odd p; ±I in SL₂ | cd_p(K)≤1 in characteristic p so H²(G_K,ℤ/2)=0; Br(K′)[2] for odd p; traces ±2, real part 0 | as stated |
| 5.4 G₂ witness | s_c with α∨(s_c)=(−1)^a, ν=½ω₂, q=4, coroots (1,0),(0,1),(1,1),(2,1),(3,1),(3,2) | values −1,2,−2,2,−2,−4; none is 4 or 1/4 so X(s) irreducible along t∈[0,1]; w₀=−1 gives hermitian; highest coroot without s_c gives 4 | as stated; matches SRPII §5.26 (R03 is only the citation) |
| 5.4 PSU(2n+1) exclusion | PSU₃ | residual ½ω₁ separated only by Spin₃'s spin rep, not a rep of SL₃ | as stated |
| 6.1 elliptic | GL₂ χ₁⊕χ₂; torus; Klein four in PGL₂ | S_σ/G_m one-dimensional; (Ĝ)^Γ=(Z)^Γ; centralizer of V₄ in PGL₂ is V₄ | as stated |
| 7.5 rationality | [[0,−1],[1,0]] | X²+1, eigenvalues ±i over Q(i) | as stated |
| 8.0 recognition | Spin₈ ½(1,1,1,1) vs ½(1,1,1,−1); Sp₆ (½,½,½) vs (0,½,1) | vector 4,4 at ±1 for both; half-spin 1,6,1 vs 4,4; standard 3,3 vs 1,1,2,1,1; norms 3/4, 5/4 | as stated |
| 8.4 Property A | a(2,1)=a(2,3)=1; a(0,±1)=1; signed a(0,±1)=−1 | r(2)=2, c(1)=c(3)=1, largest difference index 3 with c(3)=1>r(3)=0; c(1)=1>r(1)=0; signed gives c(1)<r(1) | as stated; proof by downward induction checked |
| 8.5 F₄ B₃ | x=(5/2,1,1/2,0) on 48 coroots ±2e_i, ±e_i±e_j, (±1)^4 plus 4 zeros | multiplicities at 10,9,8 = 1,0,2; neutral from ch26 Table 3 row B₃: 1,0,1; printed point with +ω₂ = (4,3/2,1,1/2) has top weight 16 | as stated; source misprint recorded |
| 8.5 Sp₆ | (2,2,2) | n_x(2)=1>0=n_{h/2}(2), equal above | as stated |
| 8.5 E₇, E₈ | listed i₀ and multiplicities | agree with ch26 line 1666–1675 | locator check only; profiles not recomputed |
| Suggested.lean | headline list vs pins | no carrier for any headline; Property A excluded by the free-variable rule | nothing statable; correct |

**Generality.** Every statement that applies a split-adjoint local theorem (§§5.4, 8.2(b),(c), 8.6) carries the real or central-compact hypothesis the supplier's statement needs; §§1.3–1.4, 4.5–4.7 and 5.3–5.4 carry "G semisimple" where the weight-0 conclusion needs it, and §§4.2–4.5 state the reductive case only for adjoint boundedness, which is what ghs Remark 3.13 supports. Degenerate cases (rank 0, trivial group, torus, q=4 with √q=2 fixed by every automorphism, p=2 isogenies, the zero array) appear as Checks and agree with the theorems of their sections.

## Not verifiable

- README §4.5's note that "the arXiv v3 version assumed p > 3": only the published Forum of Mathematics Pi text is cached (ghs line 110 has no restriction); the arXiv v3 wording was not read.
- The E₇ and E₈ adjoint weight profiles in Worked examples (top weights 18/17/16, 13, 9, 5 and 10/9) were checked against ch26 Tables 2–3 and the case list, not recomputed from the root systems.
- §4.0's Check "L(T) = 1 − T/4 on both sides": consistent with the stated weights and the ker N eigenvalue, not recomputed from the Kloosterman sheaf.
- The KB package is at design stage; its contents were read from `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md` on the board and could still be revised, but it is in the merge order ahead of this roadmap.
- `barbasch-moy-unitarity` and `barbasch-moy-whittaker` are uncertified in the manifest; the README cites neither, so nothing depends on them.

## Source issues

- **Misprint** in ch26 at Definition 2.6(iii), p. 7: the source writes N^i as a map from the weight w−i piece to the weight w+i piece, while (ii) and the Weil–Deligne relation make N lower weights; it should be N^i: gr_{w+i} → gr_{w−i}; affects nothing.
- **Error** in ch26 at Corollary 6.32(1), p. 25: the source states the half-integrality criterion for an arbitrary compact part s_c, but its proof uses that unitarity of L(s) places ν in the real generic unitary region, which needs s_c trivial or central; split G₂ with the involution s_c and ν = ½ω₂ is a generic unitary geometric counterexample; it should assume s_c = 1 or central; affects a stated result.
- **Misprint** in ch26 at Theorem 8.5(3), row F₄ B₃, p. 28: the extraneous point is printed with an extra ω₂ term; it should be ω₁ + ½ω₃ + ½ω₄ = (5/2, 1, 1/2, 0), whose adjoint top weight 10 with profile 1, 0, 2 matches case (3)(a) and Table 3, while the printed point has top weight 16; affects a stated result.
- **Misprint** in ch26 at §10.2, proof of Theorem 10.3, cases (4) and (5)(a), p. 34: the right-hand sides of the strict inequalities at i₀ = 9 and i₀ = 16 are labelled n_v; they should be n_u; affects nothing.
- **Gap** in ch26 at §4.1, sketch step (2), p. 11: geometricity of the local monodromy of L(Π,τ) at every place is asserted from semisimplicity of G alone; it needs an integer-weight input (an ι-tempered anchor gives only fixed-ι integer weights by the §5 argument); affects the proof (the paper defers complete proofs of Theorems 4.2–4.3).
