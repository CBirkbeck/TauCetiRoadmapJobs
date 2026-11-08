# Review of SheafConvolutionOnAbelianVarieties (pull request #1809 at b38940e)

**Verdict:** needs changes

Gate at b38940e: every check passed (build with `sorry` the only warning, depcheck 0 problems, outside-folder diff 0 paths). Dependency check run again by this review:

    depcheck: 240 roadmaps, 2296 edges, 0 problem(s)

No UPWARD or CYCLE line; the roadmap is at line 301 of the merge order, after every supplier it names. Six findings, one of them P2.

## R01 (P2) — ShimuraData §§3.1–3.4 cited for Hom variations and tensor operations it does not state

Location: `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md` line 155 ("Consume ShimuraData §§3.1–3.4 for integral and rational polarized variations, Hom variations, tensor operations, and flat Hodge-idempotent splittings") and line 1380 (§9.3 proof route: "On S×S take the weight-zero variation Hom(pr₁*V,pr₂*V), polarized by the form induced from Q").

Claim: the Hom variation of two polarized integral variations, with its induced polarization, and its pullback along the projections of S×S are supplied by ShimuraData §§3.1–3.4.

Witness: ShimuraData at its open head, §3.1 `Variation`, §3.2 `VariationHom` (morphisms, kernels, images), `variationDirectSum` (direct sums and flat idempotent splittings), §3.3 `RationalPolarizedVariation`, §3.4 `polarizedIntegralVariation`, `integralVariationRational`. No internal Hom, tensor product, dual or pullback of variations is constructed anywhere in §§3.1–3.18 (grep of the whole README for "Hom variation", "tensor", "dual variation", "weight-zero variation": no construction). §9.3(a) applies the bounded-norm contract to exactly this Hom variation, so the proof route of a headline rests on an input no supplier states.

Repair: either extend the declared ShimuraData gap (bounded-norm orbit Hodge-locus contract) with a second sentence, "for polarized integral variations V, V′ on S of weights w, w′, the local system Hom(V_ℤ,V′_ℤ) with the induced filtration and the form induced from Q, Q′ is a polarized integral variation of weight w′−w, and pullback along a morphism S′→S of smooth varieties preserves polarized integral variations", or state that construction as an owned target of §9.3 with its API and three Checks (identity transport is a (0,0) class; a transport that moves F is not; pullback along pr₁ of a constant variation is constant) and cite ShimuraData §§3.1–3.4 only for the carrier and morphisms. Tested on the instance: with V the weight-one variation of the universal elliptic curve over Y(3), Hom(pr₁*V,pr₂*V) on Y(3)×Y(3) has weight 0 and the identity at a diagonal point is integral of type (0,0) with Q-norm 2; nothing in ShimuraData §§3.1–3.4 produces that variation.

## R02 (P3) — SpringerResolutionAndCharacteristicCycles cited by section labels that do not exist at its head

Location: README lines 100–106 ("Consume §D for the carrier of coherent, holonomic and regular holonomic D_X-modules …, §D/characteristic-cycle …, §Y for generic-length cycle multiplicities, and §H/regular-holonomic"), and the same labels in §§0.8, 0.9, 4.2, 4.3 Needs lines and the Layer 0 and Layer 4 Dependencies.

Claim: those sections exist in SpringerResolutionAndCharacteristicCycles.

Witness: at the open head of SpringerResolutionAndCharacteristicCycles the sections are numbered by layer: `## Layer 8: Differential operators and characteristic cycles` (§8.1 coherent D-modules, §8.5 characteristic variety, §8.6 characteristic cycle), `## Layer 9` (§9.4 holonomic, §9.5 finite length and cycle additivity, §9.7 regular holonomic), `## Layer 14` (§14.2 generic-length cycles under completion). The strings "§D", "§H", "§Y", "D/characteristic-cycle", "regular-holonomic" occur nowhere in that README, and "microdifferential"/"microlocal" have zero occurrences, so the declared microdifferential gap is genuinely a gap but its supplier section label "D" is also not a section there.

Repair: replace the labels by the sections that carry the objects: §8.1 (coherent D-modules, good filtrations §§8.3–8.4), §8.6 (characteristic cycle), §9.4 (holonomic), §9.5 (generic-length multiplicities and additivity), §9.7 (regular holonomic); point the microdifferential contract at Layer 8 (its section heading), in the README and in the plan's `gaps` entry.

## R03 (P3) — StableReductionPartII cited as §MC.4 and §MC.6, which are not sections at its head

Location: README line 15 ("StableReductionPartII §§MC.4 and MC.6 owns curve level moduli and finite Torelli fibres"), line 163 ("Consume StableReductionPartII §MC.4/fine-level-scheme and §MC.6/torelli-finite-fibres"), §9.2 Needs (line 1365) and the Layer 9 Dependencies.

Claim: those sections exist in StableReductionPartII.

Witness: the resolver already flagged both (citations.md: "StableReductionPartII has no MC.4 … no MC.6 (checked #1841)"). At that head the fine level scheme is `### 4.8 The fine smooth full-level curve scheme`, the finite Torelli fibres are `### 6.6 Finite Torelli fibres and the sign ambiguity` and `### 6.14 The sign ambiguity in geometric Torelli fibres`, and the Torelli morphism is §6.3 and §6.12. The polarized integral Jacobian contract is declared on the board with supplier section "MC.6", which is likewise not a section.

Repair: cite StableReductionPartII §4.8 for the fine level scheme and §§6.6, 6.14 for the fibre bound (size at most two, hyperelliptic identification), and move the gap's supplier section to §6.7 or §6.13 (the Hodge comparison along Torelli), in the README and in the plan's `gaps` entry.

## R04 (P3) — Supplier contracts are not labelled with their gap slugs

Location: README lines 59, 62, 73, 76, 85, 95, 98, 103, 111, 113, 120, 126, 131, 150, 165, 167 and the two Layer-9 contracts ("What EtaleCohomologyFoundations must provide (the geometric character comparison contract): …", and so on for all eighteen).

Claim: the contracts are declared where the intake reads them.

Witness: roadmaps on main that declare gaps write `What <Supplier> must provide (gap:<slug>): <needs>` (five READMEs on main, e.g. "must provide (gap:tits-system-of-points)", "must provide (gap:borel-pointwise-normalizer)"); this README contains no `gap:` string, so none of its eighteen contracts carries the slug the brief lists (`gap:geometric-character-comparisons`, …, `gap:microdifferential-localization`), and the intake cannot match them to the plan.

Repair: replace each parenthetical label by its slug, e.g. "(gap:geometric-character-comparisons)", "(gap:closed-extension-constructible-comparison)", "(gap:serre-heart-verdier-comparison)", "(gap:semisimple-proper-direct-image)", "(gap:tannaka-kernel-exactness)", "(gap:ample-divisor-albanese)", "(gap:translation-stabilizer-family-quotient)", "(gap:isogeny-character-trace-decomposition)", "(gap:conormal-gauss-geometry)", "(gap:holonomic-riemann-hilbert-index)", "(gap:hodge-tate-image-cocharacter)", "(gap:minuscule-weight-table)", "(gap:bounded-norm-orbit-hodge-loci)", "(gap:polarized-integral-jacobian-comparison)", "(gap:relative-pointed-albanese)", "(gap:stein-perverse-artin-vanishing)", "(gap:schneider-lang-commutative-groups)", "(gap:microdifferential-localization)"; the prose names used in `*Needs:*` lines may stay as aliases.

## R05 (P3) — Four citation imprecisions and a numbering gap

Location and witness, one bullet each:

- README line 82: "§A6 for rigidity and relative Hom". In AbelianSchemesAndArithmeticModuli rigidity is `### A1.2 Rigidity over arbitrary bases` and relative Hom is `### A6.25 Relative Hom and normal-base extension`. Repair: "§A1.2 for rigidity and §A6.25 for relative Hom" (also in §9.2 Needs).
- README line 134: "Layers 7 and 9–10 derived groups, central isogenies, root data, finite outer automorphisms and rational highest-weight representations". In ReductiveGroups derived groups and central isogenies are Layer 6 (line 469), root data are Layer 7 (line 644), Layer 9 is pinned Chevalley–Demazure group schemes over ℤ, Layer 10 is rational representations. Repair: attribute each item to its layer.
- README line 772 (§4.3 proof route): "R(G_u°) is the ring of Weyl invariants (ReductiveGroups Layer 10)". ReductiveGroups Layer 10 states the classification of rational simples and that characters lie in ℤ[X], not R(G°)≅ℤ[X]^W; the only ^W statement there is ℂ[𝔤]^G≅ℂ[𝔱]^W (Layer 11). LieHighestWeight Layer 6 (line 811) states Weyl invariance of formal characters and builds the representation ring. Repair: cite LieHighestWeight Layer 6 for Weyl invariance and state the surjection onto ℤ[X]^W, which K2 Corollary 2.2.4 (K2 line 714) uses, as part of §4.3(e)'s Needs or as its own API bullet.
- README line 149: "AlgebraicModuliForArithmeticGeometry §§1.1–1.2 and 2.1 supplies projective section spaces and smooth-family parameter geometry". §2.1 is Hilbert/Quot representability (`hilbertFunctorAsQuot`); the openness of the smooth-member locus M⊂|L| that §9.1 uses is Mathlib's smooth locus (Mathlib/RingTheory/Smooth/Locus.lean, Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean). Repair: cite §§1.1–1.2 for the section space and Mathlib for the open smooth locus.
- Layer 7 runs §7.1, 7.2, 7.3, 7.5, 7.6 (README lines 1172–1244): there is no §7.4, and the Lean module docstring and §§8.3, 9.4 cite "§7.5" and "§7.6". Repair: renumber 7.5→7.4 and 7.6→7.5 everywhere, including `Suggested.lean` line 13 and the Needs lines of §§7.6, 8.3, 9.4.

## R06 (P3) — The support-codimension criterion of §0.4 has no owner

Location: README line 103 ("§2.21 for normalized dualizing complexes over Noetherian rings and their localization, which give the local-duality support criterion of §0.4") and line 268 (§0.4 proof route: "a perfect complex whose dual lies in D^(≥0) has H^j supported in codimension at least j, by the local-duality criterion … (BSS, Lemma 2.8 and Remark 2.9)").

Claim: SchemeAndStackFoundations §2.21 gives the criterion.

Witness: SchemeAndStackFoundations §2.21 (README line 4390) defines `DualizingComplex`, `SchemeDualizing`, `NormalizedDualizing` with `residue`, `finite_local`, `shift_unique`, `localization_shift`, and proves `coherent_duality` for `f^!`; it states no bound on the degrees of Ext^i(N,ω) in terms of dim Supp N and no criterion "D(M)∈D^(≥−k) iff dim Supp H^i(M)≤k−i". BSS Lemma 2.8 (BSS line 192) is that criterion, proved there from the Ext range of Stacks 0A7U and a spectral sequence; no layer, supplier section or pinned declaration provides it.

Repair: add to §0.4 an API bullet stating the criterion as this roadmap's own target: for a Noetherian ring S with normalized dualizing complex ω and M∈D^b_coh(S), RHom(M,ω)∈D^(≥−k) iff dim Supp H^i(M)≤k−i for all i; with the route (Ext^i(N,ω)=0 for i∉[−dim Supp N,0] for finitely generated N, then the Ext spectral sequence), and Needs SchemeAndStackFoundations §2.21 `NormalizedDualizing.localization_shift`. Add the Check: for S=k[x] with normalized dualizing complex S[1], the module M=k=S/(x) has RHom(M,S[1])=Ext¹(k,S)[0]=k[0], in D^(≥0), and dim Supp H⁰(M)=0≤0; the module M=S has RHom(S,S[1])=S[1], in D^(≥−1) but not in D^(≥0), and dim Supp H⁰(S)=1 needs k≥1: the criterion separates the two.

## Verified sound

**Gate and build.** Gate at b38940e all green. `lake env lean TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/Suggested.lean` elaborated in 14 s with four "declaration uses `sorry`" warnings (lines 77, 85, 97, 114) and nothing else. A scratch copy with `#check @name` for all eight declarations reproduced the elaborated types in signatures.md exactly; no section binder is dropped (the file has no `variable`).

**One-tactic probes** (scratch copy): `exceptionalPair_classification` and `surface_exterior_classification` tried with `simp`, `simp_all`, `omega`, `decide`: all fail. `threefold_exterior_classification` and `exterior_eulerian_classification` have the same hypotheses with a stronger conclusion and are not one-tactic either. No padding: the four theorems are LS Lemma B.7, Lemma B.4, Lemmas B.5–B.8 and Proposition B.1; the four definitions are exactly what makes them statable.

**Headline theorems.** The README's end theorems are §0.4 (generic vanishing), §0.6/§1.2 (quotient and fibre functor), §2.2 (arithmetic–geometric exact sequence), §4.6–4.8 (simplicity and classical form), §5.2, §5.6, §5.7, §6.6 (combinatorial classification), §6.7 (classical convolution monodromy), §7.6, §8.3 (generic and Galois-uniform big monodromy), §9.2, §9.4 (period finiteness). The four combinatorial ones are statable at the pins and are stated; every other one is named in the module docstring with the missing carrier (perverse category and character sheaves; Tannaka reconstruction; smooth divisor cohomology; rank-one de Rham moduli; clean cycle ring and microdifferential modules; sheaf-generated groups; character space; polarized integral variations). No statable headline is absent.

**Computed values** (scratch `#eval` and an independent Python recomputation):

| statement | instances tried | values computed | result |
|---|---|---|---|
| `exceptionalPair` (§5.2) | j=0..4 | (1,5),(5,20),(20,76),(76,285),(285,1065); a²−4ab+b² vs a+b: 6=6, 25=25, 96=96, 361=361 | matches LS line 939 "1,5,20,76,285,1065" and B.7 |
| Pell descent (B.7) | a>1 | b′=(a²−a)/b: (5,20)→(1,5): 20/20=1; (20,76)→(5,20): 380/76=5 | descent lands on previous pair |
| a=b | (1,1) | LHS −2, RHS 2; no index | both sides of iff false |
| `exceptionalDegree` (§5.3) | j=0,1,2 | C(6,1)/6=1; C(25,5)/6=53130/6=8855=C(23,4); C(96,20)=216182590635135019896, remainder mod 6 = 0, quotient 36030431772522503316 = C(94,19) | identity 6D_j=C(a+b,a), D_j=C(a+b−2,a−1) holds |
| Eulerian count in `hasEulerianExteriorWeights` | n=0..5 | rows [1], [1], [1,1], [1,4,1], [1,11,11,1], [1,26,66,26,1] | descent-indexed, A(0,0)=1 as ClassicalArithmeticCompletion §2.18 |
| `wedgeMultiplicity` 0,0,1,1, k=2 | t=−1..3 | 0,1,4,1,0 | threefold row d=1, s=0 |
| 0,0,0,0,0,1, k=3 | t=−1..2 | 0,10,10,0 | surface row d=C(5,3)=10, m=2k=6 |
| 1[−1]+23[0]+1[1], k=5 | t=−2..2 | 0,8855,35420,8855,0 | 35420=4·8855 and C(23,5)+C(23,3)=33649+1771 |
| middle identity (B.6) | a=k, b=m−k | (m−1−k)/k+(k−1)/(m−k)=4 ⇔ a²−4ab+b²=a+b: (5,20): 19/5+1/5=4 | consistent with LS line 4639 |
| §6.1 ratios | histogram 1,23,1; k=5; r=4, t=19 | R_a=C(23,5)/8855=19/5, R_b=C(23,3)/8855=1/5, sum 4=A(3,1), product 19/25; five q=2 ratios 0,0,1,0,0 sum 1=A(3,2) | matches README |
| §6.2 at n=5 | A=(1,26,66,26,1) | 28·66=1848<1875=3·25²; 78·5·1=390<15625 | holds |
| §6.2, §2.78 threshold | n=10, 11 | 27·47840=1291680>1013²=1026169; 27·152637=4121199<2036²=4145296 | threshold n≥11 is needed |
| §6.2 B.11 constant | n=7, A₁=120, A₄=1191 | √2382+1=49.806≤14400/288=50.0; with 49: 14400/294=48.98 fails | no slack |
| §6.2 n=11 | A₄=9738114 | 78·11·A₄=8355301812<2035³=8427392875, ratio 0.991 | exact-integer range needed |
| §6.4 at n=5 | sum 26, product ≤4 | roots 13±√165 = 0.155, 25.845; five-term bound 1+1+4+0+52=58<66 | holds |
| §6.5 ceilings | n=5, 6 | ⌈26/8⌉=4, ⌈57/10⌉=6; 9·4=36>26, 6·3=18>10 at n=4 | ranges as stated |
| §3.1 rows | n=2,3,4 | (−1)^(n−1−q)dA(n,q): (−d,d); (d,−4d,d); (−d,11d,−11d,d); e_top=−2d,−6d,−24d | matches LS Lemmas 3.2–3.4 |
| §3.3 weights | n=3, d=1 | native weights 0,−1,−2 with multiplicities 1,4,1; total 6=3!·1 | PadicHodgeTheory HT(χ_p)=+1 (its line 672) |
| §4.7 divisibility | n≥3 | 27 mod 6=3, 56 mod 6=2, 2^r mod 3∈{1,2} | spin and E₆, E₇ excluded |
| §4.8 sign | n=3, 4 | (−1)^(n−1)=+1 (SO), −1 (Sp) | LS Lemma 3.11: Sp only for n even, SO only for n odd |
| §4.3 λ-ring Check | Λ=Λ_x+Λ_y | ½(Λ_2x+2Λ_(x+y)+Λ_2y−Λ_2x−Λ_2y)=Λ_(x+y) | matches |
| §4.6 genus Check | n=2 | 2g−2=[H]²=2d, g=1+d | §9.2 agrees |
| §9.2 Check | d=2 | deg φ_L=d²=4 | AbelianSchemes §A2.4 |
| §0.6 Check | E, δ₀⊕F_E[1] | Hom(δ₀,F[1])=H^(−1)(i^!F)=H^(−1)(F(−1)[−2])=0, Hom(F[1],δ₀)=0, End=F⊕F dim 2; quotient dim 1 | matches |
| §1.5 Check | SL₂ pair | tr[A,B]=2 iff common eigenvector (Fricke identity) ⇒ χ(j_*L[1])=2 | matches |
| §8.1 Check | E³, σ=3 on ℤ/4, (e₂,e₃)=(1,0) | 2·3^0+9+5=16≡0, 2·3+9+5=20≡0 mod 4; χ−σχ≡−2≡2∈{0,2}=E₁ | both e₁ bad, η=2≠0 |
| §8.2 Check | E/ℚ, ψ of order 4 | |GL₂(ℤ/4)|=256·(1/2)(3/4)=96; 4^r−96>0 iff r≥4 | matches |
| §9.3 Check | ℂ/ℤ[i], (3+4i)/5 | Aut={±1,±i} order 4; minimal polynomial x²−(6/5)x+1 not integral | matches |
| §9.1 degree | n=3, m′/m=2 | (2)^(2·3)=64 | matches |
| §0.7 Check | E, d+t·dz | holonomy (e^(−t),e^(−tτ)) lies in a proper subtorus iff a+bτ=0 for (a,b)∈ℤ²∖0, impossible for τ∉ℝ | matches |
| LS Cor 4.10 vs §8.3 | ℓ=p | cyclotomic Frobenius acts on prime-to-p roots of unity only; order-p characters all collapse to 1 (README §8.1 Check) | README's ℓ≠p is necessary |

**Lean generality versus README.** `exterior_eulerian_classification` has no 2k≤m hypothesis and uses min(k,m−k) as README §6.6; `surface_exterior_classification` and `threefold_exterior_classification` carry the normalization 2k≤m as §§5.6–5.7; d≥1, 1<k, k+1<m in all four as in Prop B.1's 1<k<m−1 (LS line 4345). Natural subtraction: `4*p.2+1−p.1` is exact since p.1<p.2; `(2k−1).choose k` with k≥2; `exceptionalDegree` divides exactly for j≥1 (remainders 0 above) and gives 1 at j=0, excluded by 1≤j.

**Sampled locators** (all at the stated lines; theorem number, page, hypotheses and statement checked): §0.7: Sim Theorem 3.1(c) line 243, Corollary 3.2 line 360, Theorem 3.3 line 367, Proposition 3.4 line 376 with the Schneider–Lang criterion at 379–398 and the proof of 3.3 at 399, Theorem 6.1 line 655; Sch Definition 2.3 line 90, Theorem 16.1 line 1236, Definition 17.3 line 1291, Theorem 17.4 line 1300. §1.1: LS P^χ line 707, Lemma 2.5 lines 710–716, KW P^χ line 1094. §3.2: LS line 864 (G_H of i_*Q[n−1]), Lemma 3.7 line 961. §4.1: K2 Definition 1.2.2 line 348, Example 1.3.2 cited through LS lines 1000–1009. §4.6: LS Lemma 3.9 line 973 (n>2, no translation invariance), K2 Proposition 6.1.1 line 1402 (simple, Stab=0), Lemma 5.2.2 line 1200 (finite stabilizers). §4.7: LS Lemma 3.10 line 1057; K1 table lines 437–441 and Corollary 1.10 line 444. §4.8: LS Lemma 3.11 line 1071. §5.3: LS Lemma B.8 line 4655 (i≥2 ↔ j≥1), Lemma B.6 lines 4523–4640. §5.5: LS Lemma B.2 line 4380, Lemma B.3 (11) line 4420. §6.6: LS Proposition B.1 line 4343, cases 4360–4370, proof plan 4373–4376. §6.7: LS Theorem 3.5 line 943 (n>2; exceptions (1) n=2,d=28 and (2) n=3), proof line 1252. §7.3: LS Lemma 4.4 line 1399. §8.1: LS Lemma 4.8 line 1582, proof 1589–1627. §9.1 and §9.4: LS Proposition 4.11 line 1698, proof 1704–1750; CDK Theorem 1.1 line 54, Corollary 1.3 line 59, Hodge metric line 121. Also opened: LS Lemmas 2.1–2.2 (650, 672), Definitions 2.3–2.4 (693), Lemmas 2.6, 2.8, 2.9 (749, 804, 842), 3.13–3.14 (1137, 1159), 4.1, 4.2, 4.5, Theorem 4.7, Corollary 4.10 (1271, 1358, 1479, 1526, 1669); BSS Theorem 1.1 (25), Lemma 2.6 (172), Proposition 2.7 (183), Lemma 2.8 (192), Corollary 2.10 (221); Sch Theorem 7.3 (423), Corollary 7.5 (453), Theorems 10.3, 10.5 (609, 616); K1 Proposition 3.1 (856), Lemma 3.5 (1036); K2 Proposition 1.3.3 (452), Theorem 2.2.3 (677), Corollary 2.2.4 (711), Theorem 2.3.1 (728), Remark 2.3.2 (776); KW Proposition 10.1 (787); JV Proposition 6.1 (941), Theorem 12.1 (1713); EHS Theorem A.1 (781). Each supports the statement as written.

**Library declarations at the pins** (file and line): Mathlib `Finset.powersetCard` Data/Finset/Powerset.lean:197, `Finset.card_powersetCard` :211, `ObjectProperty.SerreClassLocalization.abelian` CategoryTheory/Abelian/SerreClass/Localization.lean:15, `preservesFiniteLimits` :427, `preservesFiniteColimits` :433, `DerivedCategory` Algebra/Homology/DerivedCategory/Basic.lean; Mathlib has no Eulerian numbers or permutation descents (only Coxeter descents, GroupTheory/Coxeter/Length.lean), so the permutation count in `hasEulerianExteriorWeights` duplicates nothing at the pin. Tau Ceti `AbelianVariety` AlgebraicGeometry/AbelianVariety/Basic.lean:95 (fields: group object over Spec K, proper, geometrically integral; as the README says), `IsMinuscule` Algebra/Lie/HighestWeight/Minuscule.lean:197 (dominant integral and single Weyl orbit on the weights of `irreducibleQuotient`; vacuous when that module vanishes), `isMinuscule_zero` :259, `IsMinuscule.finrank_irreducibleQuotient_eq_card_orbit` :238, `Tannaka.tensorAutFunctor` Algebra/AlgebraicGroup/Representation/Tannaka/GroupFunctor.lean:63, `Tannaka.fgPointTensorIsoEquiv` …/Tannaka/Equivalence.lean:188, `AffineGroupSchemeCat` AlgebraicGeometry/AffineGroupScheme/Basic.lean:55, `ReductiveAffineGroupSchemeCat` …/Reductive/Basic.lean:89, `geometricallyConnected_of_reductiveAffineGroupSchemeProperty` :109, `FiniteTypeAffineGroupSchemeCat` …/FiniteType.lean:97.

**Cross-roadmap citations resolved** (on main or at the open head): EtaleCohomologyFoundations §§F.0.2 (line 200), F.0.A2 (368), F.2.1–F.2.7, F.3 (676), F.4.0 (850), F.4.5 (1041), F.4.6 (1089), F.5 (1179), F.6 with `etaleGaussBonnet` (1219); no π₁(A×A′) product statement there, consistent with the declared gap. SchemeAndStackFoundations §2.18 with `DQCoh`, `totalDirectImage`, `torIndependent_baseChange` (3959–3990), §2.21 (4390), §§5.1–5.5, 5.8 (6567–7107), conormal sheaf in §5.5; no conormal cycles or Gauss map, consistent with the declared gap. ClassicalArithmeticCompletion §2.18 (descent-indexed, A(0,0)=1, `eulerian`, `eulerian_one_right`), §2.39, §2.56, §2.57 (C.1–C.2), §2.71 (C.3), §2.77 (C.4: A(n,r−1)(A(n,r−1)−1)>2A(n,3r−2) for 3≤r≤n−2, which is what §6.5 uses), §2.78 (C.5, n≥11). DiophantineApproximationAndTranscendence §3.5 is the exponential-polynomial form only, as the README says. HodgeStructures L0–L3 (Completed; Hodge metric in L1 lines 318–322, `IsLatticeIsometry` in L3). JacobianChallenge Layer F (`isAlbanese_abelJacobi`). ReductiveGroups Layers 3, 6, 7, 10. LieHighestWeight Layers 4, 6 (Weyl dimension formula line 822, minuscule Pieri 858–865), 8 (27, 56). SpinRepresentations Layers 4–5 (2^l, 2^(l−1)). LieHighestWeightPartII is a board design package (not an open pull request, hence the resolver's lead); its N2 is "Classical recognition and half-spin tests" and the minuscule table is declared as a gap on it. EtaleDualityAndPerverseSheaves §§0.5, 2.1, 2.6–2.10, 3.3–3.5, 5.10 (`decompositionTheoremComplex`). MotivesAndAlgebraicCycles §§6.1–6.3, 6.8. AbelianSchemesAndArithmeticModuli §§A1.3, A1.8(1), A2.2, A2.4, A3.1–A3.6, A4.1, A4.2 (`AbelianVectorExtension`, README-only name there), A5, A6. AbelianSchemesAndArithmeticModuliPartII §P1.1 (P♮ and Lie(A♮)≅H¹_dR). ComplexComparisonPartII §§C5.1–C5.6, C6.1, C6.6 (`adicArtinComparison`, README-only name there). PadicHodgeTheory §§3.3, 8.1–8.2 (HT(χ_p)=+1). MordellLawrenceVenkatesh §§0.22–0.24 (Lie-algebra Goursat). FiniteGroupInvariants §10.5 with all four Jordan names in its Suggested.lean (lines 655–673). DeligneWeightsAndPurity §§0.1–0.3, 0.11, 1.4. ShimuraVarieties §§3.5b.1, 3.5c. JacobianChallengePartII §§2.1–2.4. AlgebraicModuliForArithmeticGeometry §§1.1–1.2, 2.1.

**Declared gaps.** All eighteen have a named supplier; each `needs` sentence is single and carries its hypotheses; none asks for something the pins or an earlier roadmap already provide (checked: no π₁ product in EtaleCohomologyFoundations; no Hom/Verdier heart comparison in EtaleDualityAndPerverseSheaves §2.1; no minuscule table in Tau Ceti; no Stein Artin vanishing in ComplexComparisonPartII; no microdifferential operators in SpringerResolutionAndCharacteristicCycles; no commutative-group Schneider–Lang in DiophantineApproximationAndTranscendence).

**Ownership against open work.** Searched by object with `roadmaps grep` over main and the 456 open pull requests: Fourier–Mukai (AnalyticStacks: condensed kernel bicategories; AbelianSchemesAndArithmeticModuliPartII §P2.3: completed Poincaré cohomology, not the D-module transform), generic vanishing (other hits are the torsion-cohomology and Varshavsky senses), Krämer, Simpson, convolution monodromy, exceptionalPair, wedgeMultiplicity: no second owner of any object this roadmap constructs. Suggested.lean declares no fully qualified name of another roadmap.

**Principles.** No route-specific shortcut (the exterior-weight classification is proved for all n, the bespoke comparisons are stated with their exact ranges), no re-planned roadmap, no copied passage (every statement is a paraphrase; checked against the sampled sources), no algorithm, no sorry'd data, no `set_option`, imports `Mathlib` only, no LaTeX delimiters, no process words or pull-request numbers in the README.

## Not verifiable

- none. Every cited text was read from its legal copy (arXiv, Numdam, the author pages of EHS and JV). The published versions of LS (Annals), BSS (Selecta) and Sch (IHÉS) were not collated; the README says its locators follow the preprint numbering.

## Source issues

- **Misprint** in LS at Lemma 3.8 proof, printed page 21: the source computes the characteristic cycle of i_*Q[n] where the distinguished object is i_*Q[n−1]; it should read i_*Q[n−1] (the conormal cycle is unchanged); affects nothing.
- **Misprint** in LS at Lemma B.4 proof, printed page 94: the source writes m_S(w) for the histogram value in the two binomial coefficients and in "m_S(w)=2k−1"; it should be m_H(w); affects nothing.
- **Misprint** in LS at Lemma 3.9 proof, printed page 23: the source writes "deg(Λ_{Z₂}=1)"; it should read deg(Λ_{Z₂})=1; affects nothing.
- **Gap** in LS at Corollary 4.10, printed page 36: the source asserts the result for any prime ℓ, including ℓ=p, but Lemma 4.8's cyclotomic Frobenius action is defined only on prime-to-p roots of unity, and characters of exact order p all collapse under it; it should assume ℓ≠p; affects a stated result (the roadmap's §8.3 adds ℓ≠p).
