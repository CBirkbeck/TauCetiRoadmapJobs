<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1502#issuecomment-6428203348 -->
Red team round 1 pass a (codex) of 959da23

Verdict: needs_changes

1. **F01** (P2) The annular comparison admits a zero-width annulus

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:686, “For a locally constant constructible ℤ/n-module sheaf F on B(a,b)”.

   **Claim:** Restriction to D(b)°∩B(a,b) is bijective, without requiring a<b. The preceding definition at line 664 permits a≤b.

   **Witness:** Take a=b=1, n=3 over C₂ and F constant, trivialized by the identity cover. H⁰(B(1,1),F)=ℤ/3, whereas D(1)°∩B(1,1)=∅ and H⁰=0. ITO20 line 1673 requires a<b.

   **Exact repair text:** “Let a,b∈|Kˣ| satisfy 0<a<b≤1. For a locally constant constructible ℤ/n-module sheaf F on B(a,b), …”. Add the negative Check: “At a=b=1, the target of restriction is empty and the nonzero constant H⁰ cannot map isomorphically to it.” This excludes the refuting instance and retains every nondegenerate annulus in the source.

2. **F02** (P3) The ramified base change does not split the whole scheme

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:637, “the scheme splits into two copies of the base”.

   **Claim:** After adjoining √π, Spec V[t]/(t²−π) becomes a disjoint union of two base schemes.

   **Witness:** Write V′=V[s]/(s²−π). The base change is V′[t]/((t−s)(t+s)); modulo s its fibre is κ[t]/(t²), with one point, whereas V′⊔V′ has two reduced special-fibre points.

   **Exact repair text:** “Over V′=V[π^(1/2)], the generic fibre splits into two points. The two branches t=±π^(1/2) meet in the nonreduced special fibre; the generic nearby-cycle stalk has trivial Galois action for every n.” Add the computed special-fibre Check κ[t]/(t²) versus κ×κ. The corrected generic action is the identity on (ℤ/n)², as needed for the subsequent alteration example.

3. **F03** (P1) The supplied plurinodal alteration lacks the prescribed boundary

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:642, “de Jong's plurinodal alteration, supplied as ClassicalAdicEtaleCohomology §5.4 `PlurinodalAlteration.exists`”.

   **Claim:** This supplier supplies ITO20 Theorem 3.3, as needed for the locally unipotent stratification induction.

   **Witness:** ITO20 lines 412–422 prescribe X° and an adapted top open inside its inverse image. TauCetiRoadmap/ClassicalAdicEtaleCohomology/README.md:2721–2723 states a plurinodal chain and group control, without a prescribed open or adapted-boundary conclusion.

   **Exact repair text:** Add to the ClassicalAdicEtaleCohomology contract: “What ClassicalAdicEtaleCohomology must provide (gap:adapted-plurinodal-alteration): For proper surjective f:X→S of Noetherian excellent integral schemes with geometrically irreducible generic fibre and a dense open X°⊂X, supply integral alterations X₀→X and S′→S and a plurinodal factorization X₀→S′ adapted to dense opens at every stage, whose top open lies in the inverse image of X°.” Record the identical slug, supplier and §5.4 in plan.json's gaps, and consume that contract at line 642. Define “adapted” by the smooth-base and étale-marked-boundary conditions of ITO20 lines 378–408, already used by the nodal target. This tests the missing datum on ℙ¹_S with X°=ℙ¹_S∖{0,∞}: the requested marked boundary is {0,∞}; an unmarked identity presentation alone does not assert that condition. No absence of either previously declared gap is being reported.

4. **F04** (P3) The dyadic norm-sign locator points to the coefficient-ring section

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:75, “§R07.4.1 fixes its p = 2 norm-compatible sign”.

   **Claim:** The signed norm-compatible uniformizer is stated in §R07.4.1.

   **Witness:** TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:5395–5417 defines the unsigned mod-p coordinate; :5529–5530 and :5561–5563 in §R07.4.3 give the negative dyadic norm coordinate.

   **Exact repair text:** “FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.4.3 supplies the Kummer field of norms, its Galois equivalence and the p=2 norm-compatible sign; §R07.4.1 supplies the mod-p Kummer frame.” For k=ℚ₂, N(√2)=−2 while N(−πₙ₊₁)=−πₙ; both signs have the same mod-2 coordinate. The repair preserves that distinction.


5. **F05** (P3) Several Checks repeat targets or only cite an application

   **Location:** packages/DeligneWeightsAndPurityPartII/README.md:153, :155, :283, :285, :325, :363, :591, :720 and :896. At :325: “Used in Scholze 2012, final paragraph of the proof of Theorem 9.6”.

   **Claim:** These bullets function as Checks of the datum, purity, summand and conjecture interfaces.

   **Witness:** Lines 153/155/283/285/363 repeat targets; :325 gives only a citation; :591/:896 discuss scope; :720 repeats the general unit law. None specifies and computes a discriminating instance.

   **Exact repair text:** Remove those nine bullets from the Checks, retaining any needed references in the proof prose. Replace the §0.4 repetition by: “For the two-term string at q=2, its dual has graded eigenvalues 1/2 and 1, weights −2 and 0, and central weight −1; using +Nᵗ instead of −Nᵗ fails the differentiated dual action.” Replace the §0.7 citation-only bullet by: “Inflate the permutation representation of S₃ on E³, E=ℚ₃, to S₃ times the tame datum of §0.1 at Q=2. The diagonal and sum-zero complement have Frobenius spectra (1) and (1,1), both weight zero; their intersection is zero because 3a=0 implies a=0.” Replace the §0.8 consequence-only bullet by: “For a split Tate curve, inertia invariants have Frobenius eigenvalue 1, so its local factor is (1−q⁻ˢ)⁻¹ and all poles have real part 0≤1/2.” These give explicit sign, complement and pole tests without replacing the existing nonexamples.

## Verified sound

Read all 936 README lines and all 75 Suggested.lean lines. The inventory contains 30 numbered targets, seven additional bold target blocks in §3.4, and one Lean theorem. The statement table below separates the internal claims of the bold blocks into 52 rows; a further 92 rows audit individual API bullets. All 127 Check bullets were read: 118 were tested on instances; nine are the non-tests in R05. Mathematical failures in those tests are recorded in R01–R02. The supplier audit covers 14 named roadmap supplier groups, the two pinned libraries, and both declared gaps. Ownership searches covered the 110 README/Lean files of the 55 explicitly supplied sibling checkouts, main/Completed, board packages, and the roadmap tool's index; no competing owner or fully qualified Lean name was found for the retained theorem.

The reviewed board head is 959da23192f19e08575ec5aaea0a88ecdb120c45. Main was checked at 7c5176b3a96c268d7dd2c6c4722dd4d31976e17d. The manifest pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The PR diff has eight files, all inside packages/DeligneWeightsAndPurityPartII; the plan diff changes only its top-level gaps. No package source was edited, no build was run, and no remote write was made.

### Lean declaration and headline coverage

| Declaration | Section and complete context | Computation / verdict |
|---|---|---|
| `TauCetiRoadmap.DeligneWeightsAndPurityPartII.duality_splitting`, Suggested.lean:52 | Layer 4; independent universes for E,G,U,U′,V,V′; Field E, Group G; AddCommGroup, Module E and FiniteDimensional for each of U,U′,V,V′; perfect bilinear p,q; linear a,b; c≠0; q(ax,by)=c p(x,y); four representations; a,b intertwining; unit-valued character χ; q(gx,gy)=χ(g)q(x,y). No ambient section variables. | For S₃ over ℚ, diagonal a=b, c=3, annihilator Σxᵢ=0: dimensions 1+2=3, intersection 0. Over 𝔽₃ c=0 and the diagonal lies in the annihilator, excluded. For C₂ with sign on V and trivial V′, q(g1,g1)=−1=χ(g). For U=U′=0 the complement is all V. For 𝔽₂ and identity maps it is V⊕0. Sound. |

I compared every binder with the worker-supplied elaborated `#check @duality_splitting` output; none is missing and no signature change is needed. I did not run a new elaboration, in accordance with the read-only/no-build instruction.

A proof of the entire Lean implication, rather than only its examples, is available on its stated carriers: let r(v) be the unique x with p(x,−)=c⁻¹q(v,b(−)). Perfection of p gives r, and the pairing equality gives r∘a=id. Thus v=a(r(v))+(v−a(r(v))) with the second term in the displayed kernel. Testing against all x proves b injective. Intertwining gives image stability; q(gv,b(y))=χ(g)q(v,b(g⁻¹y)) gives kernel stability. The Lean expression `(q.flip.comp b).flip` evaluates exactly to v↦(y↦q(v,b(y))). No sign or symmetry assumption is missing.

The one-tactic probe does not identify this theorem with a pinned result: Mathlib/LinearAlgebra/BilinearForm/Orthogonal.lean:309 concerns a reflexive form on one space and a nondegenerate restriction. It does not supply the scaled two-pairing injection and representation-stable complement. Mathlib/LinearAlgebra/PerfectPairing/Basic.lean:39 requires both adjoints bijective; :69 supplies the linear equivalence used above. There is no sorry'd data, auxiliary definition, example, `lemma`, `set_option`, placeholder or extra import in this file.

| README headline family | Acceptance-test disposition |
|---|---|
| §§0.5–0.10: restriction detection, transport, summands, finite extension and good reduction | Named in module docstring; relative datum, monodromy filtration and cohomological purity carriers are missing at the pins. |
| §§1.1–1.2: equal-characteristic cohomological weight–monodromy | Named; normalized geometric cohomology representation and graded purity missing. |
| §§2.1–2.5: Kummer tilt, marked Galois comparison and transfer | Named; tower completion and functorial perfectoid-field tilt missing. The native `PreTilt` and `Tilt` constructions alone do not supply these field/topological comparison interfaces. |
| §§3.2–3.6: direct images, punctured-disc theorem, both neighbourhood theorems, cup and Galois comparison | Named; analytic sites, supported cohomology and geometric maps missing. The native Ext composition identity is correctly imported instead of duplicated. |
| §§4.1–4.3 and 4.5: approximation, actual multiplicative comparison, top isomorphism, stable geometric summand | Named; toric projection and the actual comparison map missing. |
| §4.4: complementary perfect-pairing splitting | Stated by the sole native theorem; degreewise application proves the graded claim. |
| §§4.6–4.7: toric theorem and projective-space/product corollaries | Named; toric embedding, complete-intersection and geometric weight–monodromy interfaces missing. |

No additional statable headline or padding was identified. The API facts and numerical boundary cases remain in the README.

### Supplier and ownership evidence

Paths in this table refer to the named roadmap's current main file, or the current indexed new-roadmap head when absent on main. AnalyticToricGeometryPartII is the explicit design-only exception described below.

| Supplier contract checked | Evidence and hypothesis comparison |
|---|---|
| LocalFieldsRamification, Layers 0–4, and Tau Ceti local fields | Finite ramification/residue degrees, Eisenstein and arithmetic Frobenius are supplied. TauCeti/NumberTheory/LocalField/Unramified/Inertia/Basic.lean:99, :146, :310 give inertia, closedness and arithmetic lifts; Tame/Character.lean:401 and :406 give the positive tame/Kummer character; Tame/Quotient.lean:387 gives the arithmetic q-power action; Teichmuller.lean:63 is zero-preserving multiplicative. Inversion changes q to q⁻¹ as used here. |
| ArithmeticGaloisRepresentations §§1.5, 2.1a, 2.4–2.6 | README:1767 and :1966 give continuous monodromy and the centered linear filtration; :1993–1997 include rescaling and tensor/dual operations; :2009–2012 give the named Weil predicates. Continuity and ℓ≠p are retained. The arbitrary-datum definition does not assert quasi-unipotence for every profinite representation. |
| LefschetzPencilsAndVanishingCycles §§0.1, 1.1–1.5 | README:329, :929, :1015, :1058, :1111, :1173 identify the tame coordinate and sheaf monodromy/filtration interfaces. Linear filtration ownership remains with ArithmeticGaloisRepresentations. |
| DeligneWeightsAndPurity §§0.1–0.19, 5.11, 7.15 | README:1073 explicitly compares scalar and Weil–Deligne purity under q≥2; :2049 is the punctually pure curve theorem with q_x; :2678 includes proper smooth, without requiring projective. Direct sums and powers are supplied in §§0.9 and 0.11–0.12. |
| EtaleCohomologyFoundations §§F.2–F.4.6, F.3a, G.2, F.6 | README:1091 `VanishingCycles.adicFunctoriality` supplies continuous actions, field restriction and closure change with realization hypotheses. :107 supplies `nagataCompactification`; the Noetherian finite-type use is finitely presented. The normalized coefficient and invertibility restrictions in the contract are retained. |
| PerfectoidSpaces §§P1.6, P1.10–P1.15, P1.32a, P3.7–P3.8 | README:4040 gives sharp naturality; :4453–4469 includes the residue-field equivalence; :5713 the completed Kummer example; :8424 finite extensions preserving degree; :8478–8498 the componentwise action on a chosen completed closure. The package adds the marked prime-to-p coordinate calculation. |
| AdicEtaleGeometry §A1.0.5 and FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.1, R07.4.3 | Topologically henselian completion is present. Kummer field of norms and norm sign are in R07.4.3; R04 corrects the sign locator. No Galois property of the unclosed p-power radical tower is assumed. |
| AdicSpacesPartII §§R0.19, R1.3–R1.6 | Spectral/constructible topology and analytic base-change/properness carriers are supplied. They are used as geometry, not as cohomological continuity without descent. |
| AdicSpacesPartIII §§R2.3–R2.4, R2.8, R2.10 | README:7487 supplies the type-(S), finite-ideal completion comparison, including proper models; :8233 supplies integral section valuation domains, with unit transition functions of absolute value 1. The gluing/finite-ideal refinement belongs to §3.1 here. |
| ClassicalAdicEtaleCohomology §§1.1–1.5, 3.2, 4.5, 5.4, 8.2–8.5, 9.6, 10.1–10.5, 11.1 | README:150–174 gives module/abelian cohomology and Ext comparison; :258 gives composition compatibility; :1204 overconvergence; :2708 oriented nearby cycles; :4920 annulusKummer; :5037 smooth constructibility; :5099 nonproper comparison. The proper prime-to-residue specializations used here retain their hypotheses. The extra prescribed boundary is the mismatch in R03. |
| AnalyticToricGeometry Layer 0; AnalyticToricGeometryPartII NT.0–NT.6 | The parent supplies projective-space/product fans. The Part II design's NT.3 projection and open-topos targets include field/automorphism naturality, and NT.4 cohomology does too; NT.6 gives dimension and containment, without smoothness or irreducibility. Those latter properties are correctly obtained here from components and alterations. |
| SchemeAndStackFoundations §§0.7–0.9, 0.23a, 4.11, 4.16, 4.19, 5.2–5.3 | README:755, :798, :848, :1508 supply components, descent and radicial invariance; :5528 blow-ups; :6038 alteration calculus; :6372 alteration existence; :6653, :6701 Chow pushforward and Chern projection. The positive characteristic alteration is taken over the perfected generic parameter field before finite-stage descent. |
| AbelianSchemesAndArithmeticModuli §A2.7 | README:1229–1238 supplies `ampleIntersectionPositive` for the proper nonempty d-dimensional image. For d=0 the package correctly uses [κ(W):k]>0, including inseparable degree. |
| EtaleDualityAndPerverseSheaves §§0.5–0.6, 1.3, 3.4–3.7 | README:781–786 fixes Galois/Frobenius pairing and the geometrically connected top trace; :821 extends rationally; :1158 and :1269 identify cycle degree and trace. The package's top isomorphism is rational and retains geometric connectedness. |

The two existing gap slugs match README:85/:87 and design/plan.json. Their named supplier is ClassicalAdicEtaleCohomology. The supported nearby-cycle comparison and continuous-automorphism coherence are not replaced by assertions that their generic underlying comparisons already suffice. They remain accepted supplier contracts; this review does not raise their present absence as a finding.

Object searches distinguished ClassicalAdicEtaleCohomologyPartII's almost/p-primary nearby-cycle duality from the prime-to-residue uniform neighbourhood theorem here; SelmerIwasawaCohomologyPartII's integral semistable filtered nearby complex is likewise a different interface. TropicalAndBerkovichArithmetic and ColemanIntegrationPartII have annular metric/de Rham constructions, not the coefficient-uniform étale theorem. Generic filtration, scalar weights, tilting, toric models, alterations and intersections remain with the suppliers above. This continuation owns marked relative purity and its comparison, the uniform analytic refinements and the final geometric assembly.

Pinned Mathlib checks also located RepresentationTheory/Basic.lean:48 (`Representation` has no continuity field), NumberTheory/Padics/PadicNumbers.lean:531 and PadicIntegers.lean:71, FieldTheory/AbsoluteGaloisGroup.lean:42/:59, RingTheory/Nilpotent/Exp.lean:50, LinearAlgebra/Eigenspace/Basic.lean:442, Algebra/Homology/DerivedCategory/Ext/Basic.lean:128 and Ext/Map.lean:223. The Ext lemma's exactness and universe assumptions agree with the supplier paragraph. A continuous absolute-Galois restriction map is not silently treated as an equivalence.

The final citation resolver reports no unresolved cross-roadmap citations or Lean names; its library check is unavailable, so the pinned checks above were done separately. The required dependency command returned:

```text
depcheck: 56 roadmaps, 654 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. The internal direction is Layer 0 → 1/2, independent Layer 3, then Layer 4. Forward mentions in API inventories are promises of later theorems, not inputs in their earlier proofs.

### Computed statement table

All section/line references in the next tables are to packages/DeligneWeightsAndPurityPartII/README.md unless indicated otherwise. The zero coefficient ring means ℤ/1; the Lean Field instance excludes a zero field. q=1, ℓ=p, nonprofinite groups and noninvertible finite coefficients are negative controls, not silently admitted instances. Unrelated carriers cannot instantiate a signature; for example a fan does not instantiate a perfect-pairing theorem.

| Statement and context | Instances tried | Computed values on the two sides | Result / change |
|---|---|---|---|
| Conventions, README 21–33 | q=2,3; two-term N; twist 1; V=0 | NΦe₁=qe₀=qΦNe₁; ΦNΦ⁻¹e₁=q⁻¹e₀; grades −1,+1 have (1,q), weights (0,2); twist gives (q⁻¹,1), weights (−2,0); zero has empty spectrum | Sign and zero case consistent |
| §0.1 datum, isomorphism and rescaling | tame semidirect group; identity coset; c=ℓ; discrete model | conjugation t=q⁻¹x; identity coset gives x versus q⁻¹x at x=1; c=ℓ gives t′=ℓt, inverse scalar ℓ⁻¹; open {0} gives t=0 only in excluded discrete model | Pass; finite/trivial H cannot have quotient ℤ̂ and nonzero t |
| §0.2 standard datum | unramified degree 3; e=2, ℓ=2; inseparable e=p | (t,Q) becomes (t,q³); ramified t_k=2t_k′ and (1/2)·2=1; characteristic-p ramification t_k=pt_k′, p≠0 in E | Pass |
| §0.3 restriction | H′=H; I; ℓ-root tower; p-root tower; nested residue indices 2,3 | f=1,Q′=Q; I image=0 (not open); ℓ-root tower t=0; p-root tower t=ℤℓ; nested Q″=(Q²)³=Q⁶ | Pass |
| §0.4 relative purity and API | Tate string; N=0 sum; dual; tensor; rescale; finite inertia | string weights (0,2)=1+(−1,1); N=0 puts weights 0,2 in same grade (no w); dual weights (−2,0), central −1; tensor strings lengths 3,1, central 2; cN has same kernels/images; finite-inertia positive powers eliminate roots of unity | Pass; tensor supplier section checked separately |
| §0.5 detection | residue f=3, q=2; tame image eℤℓ; excluded ℓ-root tower | Φ³ eigenvalues (1,8), q′=8, central w=1 unchanged; t=e a yields same N from log/e a; t=0 admits any N, so uniqueness fails | Pass with admissibility |
| §0.6 transport | t′=2t, N′=N/2; inverse | pulled-back 2(N/2)=N; inverse (1/2)·2=1; M(N/2)=M(N) | Pass |
| §0.7 direct sums | V⊕0; Tate ker N; sum of weights 0 and 2 | spectrum unchanged by 0; ker N has eigenvalue 1 and w=0 versus ambient w=1; mixed sum fails common weight in gr₀ | Pass, stable complement essential |
| §0.8 WMC and local poles | point; empty; ℙ²; two points; Tate curve | point H⁰=E, others 0; empty all 0; ℙ² eigenvalues (1,q,q²), weights (0,2,4); component permutation eigenvalues ±1, weight 0; Tate invariant factor (1−q⁻ˢ)⁻¹ has Re pole=0≤1/2 | Pass |
| §0.9 finite extension | ℙ¹, f=3; purely inseparable extension | eigenvalues (1,q)→(1,q³), trace coordinates (1,1)→(1,1); radicial base change dimensions (1,1) unchanged, e=p invertible in E | Pass both directions |
| §0.10 good reduction | point; ℙ²; Tate elliptic curve | N=0, eigenvalues 1,q,q² for even degrees; Tate N rank 1 excludes smooth proper model | Pass |
| §1.1 curve theorem | Legendre λ=0, p=3; good fibre; degree-a point | gr eigenvalues (±1,±qᵃ) have moduli (1,qᵃ), weights 0,2; good fibre N=0 and only grade 0 | Pass |
| §1.2 global function fields | ℙ¹ at residue degree a; bad Legendre place | H⁰,H² eigenvalues 1,qᵃ; bad H¹ grade weights 0,2 about 1 | Pass |
| §2.1 coordinate Kummer tilt | k=ℚ₂(√2); finite stage; n=0 | degree first stage=2, v(ϖ₁)=1/2; class ϖ₁≠0 but ϖ₁²=0 modulo ϖ, matching T¹/²; norm first root=−ϖ, sharp t=ϖ; n=0 degree=1 | Pass; reduced quotient would fail |
| §2.2 composite β | identity; σζ₃=ζ₃² at p=2; unramified quadratic | β1(t)=t, sharp=ϖ; (βσ ζ₃♭)♯=ζ₃²=σζ₃; degrees 2=2 and residue cardinalities q²=q² | Pass as supplied equivalence |
| §2.3 prime-to-p roots | ℓ=3,p=2,n=1; p-power torsion; ε | μ₃ cardinalities 3=3 and kernel 1; μ₂ cardinalities 1 versus 2; ε♯=1, ε≠1 and ord ε=∞ | Pass |
| §2.4 marked data | L=K; k″=F₂((t¹/²)); finite residue degree a | Q=2 on both; e=2, t_k=2t_k″, scalar=1/2, (1/2)(2N)=N; Q′=qᵃ on both | Pass |
| §2.5 tilting transfer | V=0; whole Tate string; ker N | zero spectra empty; Tate gr eigenvalues (1,q), central weight 1 retained; ker N weight 0 not 1 without complement | Pass |
| §3.1 finite-ideal tube and API | ideals 0,1,(T),(ϖT),(T²); ε=∣ϖ∣² | 0→whole disc; 1→∅ at ε<1; (T) radius ∣ϖ∣², (ϖT) radius ∣ϖ∣; T=ϖ distinguishes; (T²) radius √ε; inverse-image evaluates same g∘f | Pass |
| §3.2 degreewise local constancy | identity disc; disjoint double disc; n=1 | R⁰=ℤ/n or (ℤ/n)², Rʲ=0 for j>0; n=1 all zero | Pass; original HUB98 definition uncertified |
| §3.3 punctured-disc Riemann existence | Kummer m=2 in char0 p=2; identity; AS in char2 | own pullback splits two sheets, m=1 unchanged; AS odd m forces Laurent coefficients g₋₂ʲm=1 and divergence below radius1 | Pass; characteristic restriction essential |
| §3.4 fixed locally constant endpoint | disc F=(ℤ/n)²; two discs; n=1 | H⁰=(ℤ/n)²→(ℤ/n)² identity; higher=0; n=1 gives 0→0 | Pass |
| §3.4 blow-up and finite-open descent | Z=X; two discs | Bl_X X=∅ but Bl⊔Z includes id; degree0 ℤ/n→ℤ/n versus blow-up-only 0; disjoint sections (a,b) preserved | Pass |
| §3.4 bounded direct image | f=id; two identity discs; n=1 | b=0, R⁰ ranks 1,2,0; every Rʲ j>0 is0 | Pass |
| §3.4 disc stabilization | identity disc, n=3 | H⁰ restriction 1↦1, all Hʲ>0=0 on every radius | Pass |
| §3.4 closed-support continuity | point in disc; empty; n=1 | colim ℤ/n=ℤ/n=H⁰(point); higher0; empty and n1 give0→0 | Pass |
| §3.4 sliced nearby-cycle definition/stalk | f=id; empty; t²=π | RΓ(U(η̄),ℤ/n)=ℤ/n[0]; empty=0; finite ramified generic stalk=(ℤ/n)² | Pass |
| §3.4 base-change compatibility and unipotence | identity; t²=π n3,n4; ramified base change | identity exchanges id; swap S has (S−1)^k=(−2)^(k−1)(S−1): nonzero mod3, zero for k≥3 mod4; after adjoining√π generic action=id | R02 corrects scheme splitting |
| §3.4 open restriction and stability under base change | finite map t²=π; remove special point | restriction to removed special fibre=zero; generic nearby stalk remains (ℤ/n)² before/after finite proper exchange | Pass |
| §3.4 locally unipotent along strata | identity constant; ramified rank2 pushforward | constant filtration length1; generic swap n3 not nilpotent, n4 nilpotent exponent3 | Pass on the computed constant and swap cases |
| §3.4 uniform nearby-cycle alteration | identity; t²=π; empty | id degree1 suffices; degree2 alteration kills swap for all n; empty complexes0 | R03: prescribed-boundary supplier contract missing |
| §3.4 nodal propagation | trivial family ℙ¹×S; D=∅ or two sections | pushforward ranks (1,0,1) in degrees0,1,2; complement Gm has compact ranks (0,1,1), all constant and locally unipotent | Pass mathematical scope |
| §3.4 adapted coefficients definition/existence | id; T=S³, n2; char2 AS,n3 | id rank1 constant; 3-cycle on F₂³ not unipotent, after π=f generic rank3 trivial and origin rank1; AS needs degree2 factor | Pass |
| §3.4 adapted tame stalk | trivial stalk; C3 on F₂³; C2 unipotent mod4 | trivial image order1; order3 incompatible with n2 unipotence; unipotent group order2 divides primes of4 | Pass |
| §3.4 adapted overconvergence | id; T=S³ after π=f near a nonbranch point | rank1 id; near nonzero y all three roots separated and rank3 constant, specializations identity | Pass; neighbourhood at origin concerns boundary specializations, not rank jumps to distinct maximal points |
| §3.4 annular decomposition | id; T=Sᵐ; AS char2 | one component; radii (a¹/ᵐ,b¹/ᵐ); AS ∣T∣=∣w∣², derivative=w²/(1−w)²≠0 | Pass |
| §3.4 tame annular trivialization | prime-to-p Kummer; AS odd base exponent | Kummer own pullback splits m sheets; AS coefficients1 on exponents−2ʲm diverge, so not tame | Pass |
| §3.4 overconvergent constructible ⇒ locally constant | constant rank1/rank2; n1 | ranks 1,2,0 stay constant under all specialization maps | Pass |
| §3.4 uniform annular direct images | id; r3,p2,n3; AS char2,n3 | ranks1,3,2 off0; own covers trivialize without division by3; AS needs wild factor degree2 | Pass |
| §3.4 annular sheaf comparison | a<b, constant rank1/rank2; a=b=1,n3 | valid H⁰ ranks1,2 and H¹ same Tate ranks; Hc=0; a=b gives ℤ/3→0 | R01 |
| §3.4 uniform bounds/descent/truncation | id; identity cover; r=−1 | disc N=1; C_m=0 and C=0; at r=−1 only H⁻¹ kernel at m0 needed | Pass |
| §3.4 smooth principal comparison/parameter | f=T; f=T² in char2; empty | radius ε=∣t∣² on T equals ε² on T², both ∣T∣≤∣t∣²; H⁰=ℤ/n→ℤ/n; empty0 | Pass |
| §3.4 uniform endpoint | char2, odd n; n=p in char0; thickening | all odd n give same disc H⁰=ℤ/n,Hⁱ>0=0; p-torsion H¹ infinite versus0(point); (T²) radius √ε but same closed cohomology | Pass |
| §3.5 cup pullback | point n3 a=b=2; zero map n2 | 2·2=1 mod3 on both, unit1→1; zero map sends1→0 | Pass; abstract Ext identity already imported |
| §3.6 Galois neighbourhood | X=Z point; ℙ¹ zero section; cubic in ℙ² | identity ℤ/n; tube disc H⁰ℤ/n,H¹0; ambient H¹0 versus cubic E² excludes arbitrary open | Pass |
| §4.1 approximation and positive degree | c0; d0; elliptic x-map char3; inseparable point | g=id degree1; point degree1 after field extension; elliptic dimH¹2 versus ℙ¹0, deg g*O(1)=2; zero-cycle inseparable degree p>0 | Pass |
| §4.2 actual comparison | degree0; toric identity; degree2 elliptic cover | 1↦1; ambient square id=id; top trace1↦2 and χℓ⁻¹=(χℓ♭∘β)⁻¹ | Pass conditional on toric contract and declared automorphism gap |
| §4.3 top isomorphism | d0; degree2,ℓ2; disconnected altered target | d0 c1; top c2≠0 inℚ₂ but0 mod2; disconnected target E² makes 1↦(1,1) non-surjective | Pass |
| §4.4 graded splitting / duality_splitting | S3 diagonal overℚ; same mod3; C2 sign; zero source; F2 id | c3, annihilator sumx_i=0, dims1+2=3; mod3 diagonal lies in annihilator and c0 forbidden; sign gives q(g1,g1)=−1=χ(g); zero source 0⊕E; F2 id E⊕0 | Pass, nontrivial multi-step theorem |
| §4.5 geometric summand | endpoints; elliptic degree2 approximation | endpoints E→E iso; middle0↪E² has full complement E² | Pass |
| §4.6 toric WMC | point; ℙ²; split Tate cubic p2,p3 | point eigen1; ℙ² even eigen(1,q,q²); Tate H¹ weights0,2 centered1 | Pass |
| §4.7 projective/product corollary | empty product; Fermat degree1, p∤e; plane cubic | empty product point H⁰E; Fermat partials e x_j^(e−1) have no simultaneous projective zero; Tate cubic has rank1 N | Pass |

### Check-by-Check computations

Here Aₙ=ℤ/n, E is a characteristic-zero coefficient field unless stated otherwise, and a displayed pair lists source/target values. Every listed row corresponds to one Check bullet. “R05” marks a bullet that is not itself an instance test; the numeric replacement/control is recorded explicitly.

| Check line | Instance and computed values | Result / change |
|---|---|---|
| 29 | q=2: NΦe₁=2e₀=2ΦNe₁; ΦNΦ⁻¹e₁=e₀/2 | Pass |
| 30 | q=2 string: eigenvalues (1,2), weights (0,2), central 1 | Pass |
| 31 | N=0: only gr₀=V; V=0: no eigenvalues; q=1 gives 1=1^(w/2) for all w | Pass, q=1 excluded |
| 143 | q=2,ℓ=3,x=1: conjugation sends 1↦1/2=t/Q | Pass |
| 145 | Identity coset and x=1 give 1 versus 1/2 | Pass negative control |
| 147 | Arithmetic generator sends 1↦2; required 1/Q would give Q=1/2, not an allowed integer | Pass |
| 149 | c=ℓ=3,x=1: t′=3, ct=3, while constant 1 gives 1 | Pass |
| 151 | Discrete open inertia subgroup {0}: t=0, exp(tN)=1 for N=0 and N≠0 | Pass negative control |
| 153 | No instance in bullet; replacement unramified cubic at q=2 gives Q′=8 and scalar 1 | R05 |
| 155 | No instance in bullet; replacement K at q=2 gives t-coordinate 1↦1 and Q=2 on both sides | R05 |
| 183 | Kummer ratios ζₗⁿ give residue coordinates 1 mod ℓⁿ, hence inverse-limit coordinate 1 | Pass |
| 185 | f′=3,q=2: inertia unchanged, e=1, Q′=8 | Pass |
| 187 | e=2,ℓ=2: old t=2·new t; constants 1/2 and 2 multiply to 1 in ℚ₂ | Pass |
| 189 | Arithmetic class +1 versus geometric −1 in ℤ̂; on t=1 actions q versus q⁻¹ | Pass |
| 191 | e=1,f=2,q=3: datum has Q=9 and unchanged t | Pass |
| 219 | f=3,q=2: Q′=2³=8 | Pass |
| 221 | Identity subgroup: f=1, I′=I, t′=t, Fr′=Fr, Q′=Q | Pass |
| 223 | H′=I: quotient image {0} has infinite index in ℤ̂, no class 1 lift | Pass exclusion |
| 225 | ℓ-root tower fixes every root: ratio 1, additive t=0; exp(0·N)=1 for all N | Pass exclusion |
| 227 | Finite ramified quadratic: e=2, t′=2t_new, residue index 1 | Pass |
| 229 | p-root tower,ℓ≠p: multiplication p is a unit on ℤℓ, so tame image remains ℤℓ; residue index 1 | Pass |
| 275 | q=2, twist −1: Φ=2, modulus 2=2^(2/2), N=0 | Pass |
| 277 | q=2: M₋₂=0,M₋₁=M₀=Ee₀,M₁=E²; graded eigenvalues 1,2 | Pass |
| 279 | V=0: gr_j=0 for every j, eigenvalue set ∅ for every w | Pass boundary |
| 281 | N=0 on E⊕E(−1): gr₀ eigenvalues 1,2 require w=0 and w=2 simultaneously | Pass negative control |
| 283 | Comparison restated; numerical dual control has central weight −1 and graded weights −2,0 | R05 |
| 285 | Definition restated; for ℙ¹ the actual even eigenvalues are 1,q and N=0 | R05 |
| 287 | Tate curve: rank N=1 gives central weight 1; semisimplification rank N=0 gives incompatible weights 0,2 | Pass |
| 299 | ℓ-root restriction kills t; unipotent law becomes identity and eigenvalues 1,q both lie in grade 0 | Pass exclusion |
| 311 | ℓ=2: pullback operator 2(N/2)=N; inverse scale (1/2)(2N)=N | Pass |
| 323 | ker N=Ee₀: eigenvalue 1, weight 0, whereas ambient central weight 1 | Pass |
| 325 | Citation-only; replacement S₃ diagonal and sum-zero spaces have dimensions 1,2 and intersection 0 over ℚ | R05 |
| 353 | ℙ²: H⁰,H²,H⁴ eigenvalues 1,q,q² and weights 0,2,4; odd groups 0 | Pass |
| 355 | Spec k: H⁰=E, Φ=1, weight 0; all other groups 0 | Pass |
| 357 | Good ℙ¹ model: generic/special H⁰,H² both have (1,q); N=0 | Pass |
| 359 | Semisimple Tate H¹ has grade-zero eigenvalues 1,q; required moduli √q,√q fail | Pass |
| 361 | ℙ⁰ and ℙ²: respective even spectra (1) and (1,q,q²), odd dimensions 0 | Pass |
| 363 | Consequence restated; replacement split Tate local factor (1−q⁻ˢ)⁻¹ has pole real part 0≤1/2 | R05 |
| 375 | Potentially good elliptic curve: after residue degree f, N=0 and eigenvalue moduli (qᶠ)^(1/2); root criterion gives q^(1/2) | Pass |
| 377 | ℙ¹,f=3,q=2: (1,2)↦(1,8); unit/hyperplane coordinates (1,1)↦(1,1) | Pass |
| 379 | Radicial degree p extension of ℙ¹: dimensions (1,1)↦(1,1), normalized classes (1,1)↦(1,1) | Pass |
| 391 | ℙ² good model: weights 0,2,4 and N=0. Good elliptic H¹ has two eigenvalues of modulus √q | Pass |
| 393 | Split Tate elliptic H¹: rank N=1≠0; smooth proper reduction would force rank 0 | Pass |
| 415 | Legendre at λ=0,p=3: rank N=1; graded eigenvalue moduli (1,3), weights (0,2) | Pass |
| 417 | Good constant ℙ¹ family: N=0 and H² eigenvalue q_x, weight 2 | Pass |
| 429 | ℙ¹ over F at degree-a place: (1,qᵃ), trivial inertia and weights (0,2) | Pass |
| 458 | k=ℚ₂: t♯=2; quotient roots satisfy (T^(1/2))²=0 modulo T | Pass |
| 460 | k=ℚ₂(√2): first degree 2, valuation 1/2; root class nonzero but square 0 | Pass |
| 462 | Minimal polynomial X²−ϖ: norm(root)=−ϖ, sharp t=ϖ | Pass |
| 464 | Finite stage value group 2⁻ⁿℤ is discrete; completed union value group ℤ[1/2] is nondiscrete | Pass |
| 481 | Identity β fixes t and sharp=ϖ≠0; zero map would give 0 | Pass |
| 482 | p=2,ζ₃: βσ sends ζ₃♭ to its square; sharp=ζ₃²≠ζ₃ | Pass |
| 483 | Kummer roots fixed termwise, βσ(t)=t; unramified quadratic degrees 2=2, residue sizes q²=q² | Pass |
| 495 | p=2,ℓ=3,n=1: both μ₃ have 3 elements, sharp kernel {1}; compatible roots lift uniquely | Pass |
| 497 | p=2,n=1: μ₂(C♭) has 1 element, μ₂(C) has 2; ε♯=1 but ε≠1 | Pass negative control |
| 509 | q=2,L=K: Q=2 on both sides, scalar 1; string eigenvalues (1,2) retained | Pass |
| 511 | k″=𝔽₂((t^(1/2))): e=2, t_old=2t_new, data scalar 1/2, resulting operator (1/2)(2N)=N | Pass |
| 523 | Embed ker N of Tate string: source weight 0, target central weight 1; no stable complement | Pass exclusion |
| 569 | Ideal (T), ε=∣ϖ∣²: tube is ∣T∣≤∣ϖ∣² | Pass |
| 571 | Ideal 0: every inequality 0≤ε; ideal 1 at ε<1: inequality 1≤ε fails everywhere | Pass |
| 573 | One toric coordinate f=T,c=2: finite-ideal tube and section domain both ∣T∣≤∣ϖ∣² | Pass |
| 575 | Ideals (T),(ϖT): radii ∣ϖ∣²,∣ϖ∣; T=ϖ belongs only to the latter | Pass |
| 577 | At c=1,2 section domains have radii ∣ϖ∣,∣ϖ∣²; every fixed positive radius contains a sufficiently small one | Pass |
| 589 | Identity disc: R⁰=Aₙ, Rʲ=0 for j>0, at every radius | Pass |
| 591 | Scope prose; it supplies no direct-image instance or value | R05 |
| 603 | Degree-2 Kummer cover in characteristic zero: its self-pullback away from 0 has two disjoint sheets | Pass |
| 605 | Characteristic 2, odd Kummer degree m: AS solution would have coefficients 1 at −2ʲm, violating convergence below radius 1 | Pass |
| 619 | Identity disc and origin: H⁰=Aₙ→Aₙ is id, higher groups 0; rank-two version Aₙ²→Aₙ² | Pass |
| 620 | Z=X: blow-up ∅, augmented cover contains id; H⁰=Aₙ versus blow-up-only 0 | Pass |
| 621 | Two identity discs: R⁰=Aₙ² and Rʲ=0 for j>0; restriction (a,b)↦(a,b); n=1 gives 0 | Pass |
| 636 | Strict local identity: H⁰=Aₙ, higher 0; Galois and exchange maps id | Pass |
| 637 | Swap S: (S−1)^k=(−2)^(k−1)(S−1); nonzero mod3, zero for k≥3 mod4. Ramified base change special ring κ[t]/t²≠κ×κ | R02 |
| 638 | X=∅ or n=1: complexes 0, exchange 0→0 is iso | Pass boundary |
| 646 | Identity alteration degree1 gives all nearby stalks Aₙ with trivial action for all n | Pass |
| 647 | n=3 swap is not unipotent, n=4 has nilpotence exponent 3; adjoining √π kills the generic action for all n | Pass |
| 648 | Refining covers of prime-power degrees pʳ needs degree divisible by arbitrarily large pʳ, impossible for one finite degree; empty complexes 0 | Pass |
| 660 | Identity f,π: R⁰_!=Aₙ, inertia image order1 and specialization id | Pass |
| 661 | Three-cycle on 𝔽₂³: eigenvalues 1,ζ₃,ζ₃², so S−1 not nilpotent; after π=f action id, ranks3 off0 and1 at0 | Pass |
| 662 | Characteristic2 cover: ∣T∣=∣w∣² below1; u-model forces ∣T∣=1; degree2 normalization splits generic sheets and gives rank2 | Pass |
| 674 | Identity has one annulus; Kummer degree m has root radii (a^(1/m),b^(1/m)), m=2 allowed in char0 | Pass |
| 675 | Characteristic2: T=w²/(1−w), derivative w²/(1−w)²≠0; radii (√a,√b), degree2 noninvertible in K | Pass |
| 676 | Odd m: g₋ₘ=g₋₂ₘ=g₋₄ₘ=1; terms have norms r^(−2ʲm)→∞ for r<1; no AS root | Pass |
| 682 | Identity: δ=1, h=id, R⁰=Aₙ, other degrees0, all n | Pass |
| 683 | p=2,r=3,n=3: cyclic rank3 permutation sheaf; self-cover trivializes to A₃³ despite 3=0 | Pass |
| 684 | p=2,n=3: wild order2 permutation on rank2; the AS double cover kills it, odd Kummer covers do not; n1 gives0 | Pass |
| 690 | At a<b: H⁰=Aₙ,H¹=Aₙ(−1) on both sides, Kummer class T↦T; at a=b=1: H⁰=A₃→0 | R01 |
| 691 | At a<b: restriction id on Aₙ² in degrees0 and1 (with twist in1), support groups0; equal radii fail likewise | R01 |
| 692 | Trivializing cubic annulus: three H⁰ generators and three H¹ Kummer classes fixed; averaging would divide by 0 in A₃ | Pass at strict radii |
| 700 | Identity disc: H⁰=Aₙ,Hʲ=0 for j≥1, N=1; Z=X restriction cone0 | Pass |
| 701 | char2: d(T²)=0, so not smooth off0; ∣T∣≤ε equals ∣T²∣≤ε²; both closed supports give Aₙ[0] | Pass |
| 702 | Empty support at ε<1 gives0; n1 makes every cone0 | Pass boundary |
| 706 | char2, any odd n: all radii≤1 give H⁰=Aₙ,Hʲ=0 for j>0, restriction1↦1 | Pass |
| 707 | C_p, n=p: dim H¹(disc,A_p)=∞ while H¹(point,A_p)=0 | Pass exclusion |
| 708 | ε=∣ϖ∣²: (T²) tube radius∣ϖ∣ versus (T) radius∣ϖ∣²; both origins have Aₙ[0] | Pass |
| 720 | General unit law repeated without a site/element computation | R05 |
| 722 | A₃, a=b=2: a·b=1 on source and target; inverse comparison also1↦1 | Pass |
| 724 | Zero endomorphism of A₂: 1↦0≠1 | Pass exclusion |
| 736 | X=Z geometric point: tube=X, H⁰=Aₙ and all higher0; restriction id | Pass |
| 737 | ℙ¹ zero section, small tube: after C extension Aₙ[0]→Aₙ[0], unit fixed by Galois | Pass |
| 738 | Plane cubic: H¹(ℙ²)=0, dim H¹(cubic)=2, so ambient restriction not iso | Pass |
| 780 | c=0: g=id, degree1, dimension d unchanged, full ambient containment | Pass |
| 782 | d=0 geometric connected smooth Y is a point; after field extension Z′ a point, degree1 | Pass |
| 784 | c=1 section of O(D): pᴺ-power gives section of O(pᴺD); degree pᴺ·deg D, not a global nonconstant function | Pass |
| 786 | char3 elliptic x-map to ℙ¹: generically degree2; dim H¹(elliptic)=2 versus0 for ℙ¹ | Pass |
| 788 | Elliptic degree2 cover: deg g*O(1)=2·1=2, nonzero in ℚ₂ but0 mod2 | Pass |
| 790 | Zero-dimensional W=Spec L: empty intersection degree[L:k], equal1 for k, p for radicial degreep | Pass |
| 818 | Geometrically connected Y,Z′: H⁰=E→E, 1↦1 | Pass |
| 820 | Ambient identity approximation: r_Y=g*=id, so f*=π*_X on both sides of square | Pass |
| 822 | d=1: top character χℓ⁻¹; β identifies χℓ with χℓ♭, giving the same multiplier q | Pass |
| 824 | Ambient ℙ² and cubic: degree-one restriction 0→E² has no inverse | Pass exclusion |
| 826 | Degree0 map1↦1; degree2 for elliptic double cover is multiplication2, invertible in E | Pass |
| 828 | Identity toric case: same π*_X, dimensions agree in each degree; ℙ¹ ranks1,0,1 | Pass |
| 840 | Degree2 at ℓ=2: multiplication2 is0 on A₂ but invertible on ℚ₂ | Pass |
| 842 | Two target components: top E→E², 1↦(1,1), rank1<2 | Pass exclusion |
| 856 | ℙ¹→elliptic cohomology pullback: degrees0,1,2 maps (id,0↪E²,×2); complements (0,E²,0) | Pass |
| 858 | E[h]/h²,deg h=2: unital map h↦0 has top map0, kernel Eh≠0 | Pass exclusion |
| 860 | S₃ diagonal over ℚ: c3; sum-zero complement dim2; intersection solves3x=0 so x0. Over 𝔽₃ intersection dim1 | Pass |
| 862 | C₂ sign/trivial actions: q(g1,g1)=−1, χ(g)=−1; with χ=1 equality fails in char≠2 | Pass |
| 864 | U=U′=0: image0,kernelV; over𝔽₂ with identity maps: imageV,kernel0 | Pass |
| 876 | Geometric degrees0,2d: both source and target dimension1, nonzero comparison gives complement0 | Pass |
| 888 | ℙ²: cohomology ranks1,0,1,0,1 and eigenvalues1,q,q² | Pass |
| 890 | Smooth quadric surface over k with split good reduction: H² rank2, both eigenvalues q, weight2 | Pass |
| 892 | Split Tate plane cubic: H¹ rank2, N rank1, grade weights0 and2 around1 | Pass |
| 894 | A presentation with c>codim Y fails the input equality c=codim Y; no approximation dimension theorem follows from that presentation | Pass scope negative control |
| 896 | Scope discussion only; no scheme, radius or cohomology instance given | R05 |
| 908 | Fermat e1 gives ℙ^(n−1); p∤e makes partials e xᵢ^(e−1) non-simultaneously-zero; e=2,p=3 gives smooth conic | Pass |
| 910 | Fermat cubic threefold at p2: smooth reduction, dim H³=10, N=0 and Frobenius weights3; every other nonzero degree even has its usual Tate weight | Pass |

### Individual API identities

These rows refine the numbered-target table. Each line is one API bullet; all inherit precisely its subsection's hypotheses. T denotes the two-term string N(e₁)=e₀ with Frobenius diag(1,q).

| API line | Instance and values on both sides | Result |
|---|---|---|
| 121 | Tame semidirect model: I=ℤℓ, quotient ℤ̂, t(1)=1, Q=2, Fr residue class1 | Sound construction |
| 123 | σ=(1,0): t(ΦσΦ⁻¹)=1/2=Q⁻¹t(σ) | Sound |
| 125 | Same-coset elements Φ,(x,1): quotient difference0; multiplying by (y,0) on either side retains class1 | Sound in nonabelian semidirect group |
| 127 | Identity residue class0≠1 | Sound |
| 129 | c=ℓ: new character at1 equalsℓ; twist sendsℓ↦ℓ/Q | Sound |
| 131 | Identity D→ℓD: character ratioℓ, Fr and Q identical | Sound |
| 133 | Identity D→D: t/t=1, Φ↦Φ | Sound |
| 135 | Scalars2,3 compose to6: t″=3(2t)=6t | Sound |
| 137 | Scalar2 inverse1/2: (1/2)(2t)=t | Sound |
| 139 | Rescale2: D→2D constant2, reverse constant1/2 | Sound |
| 167 | k=ℚ₂,ℓ=3: I closed, t imageℤ₃, Q=2 | Sound |
| 169 | In standard datum, inertia kernel is ker(G_k→G_𝔽q) on both sides | Sound, quotient Frobenius class retained |
| 171 | Compatible Kummer generator ratios ζ give1; multiplying roots by roots of unity fixed by inertia changes ratios by1 | Sound |
| 173 | Arithmetic class+1 has inverse−1; geometric coset−1 iff inverse arithmetic+1 | Sound both directions |
| 175 | k=ℚ₂: #κ=2=Q; unramified quadratic:4=Q′ | Sound |
| 177 | Ramified quadratic: restricted t at new generator2=2·1 | Sound |
| 179 | Generator has t=1; all ℤℓ-coordinates obtained, imageℤℓ on both sides | Sound |
| 203 | Unramified cubic: residue index3 and tame imageℤℓ≠0, so admissible | Sound |
| 205 | Unramified cubic: H′∩I=I, exactly restricted inertia | Sound |
| 207 | Quotient Φ′=class3 iff Φ′∈H′∩Φ³I; class1 fails both | Sound both directions |
| 209 | Q=2,f=3: Q′=8=2³ | Sound |
| 211 | Nested residue indices2,3: Q″=(2²)³=2⁶=64, same character restriction | Sound |
| 213 | H′=H: f1 and Q¹=Q | Sound |
| 215 | Character scale2 on subgroup of index3 remains2; quotient powerQ³ on both | Sound |
| 241 | T has exponential law and grade weights0,2 around1; N=0 with same spectrum fails weights | Sound definition |
| 243 | Choose t(σ)=a≠0: log ρ(σ)=aN=aN′ implies N=N′; at a0 uniqueness fails, excluded | Sound |
| 245 | On T at q2: ΦNΦ⁻¹(e₁)=e₀/2 | Sound |
| 247 | On T: M₋₁=Ee₀,M₁=E², both preserved by diag(1,2) | Sound |
| 249 | Finite inertia sign: lifts have eigenvalues α,−α and equal squaresα²; absolute weights equal both ways | Sound |
| 251 | Rescale datum2: N↦N/2, ker and image unchanged; grade eigenvalues1,2 unchanged | Sound |
| 253 | Extend E to quadratic E′: eigenvalue moduli and ranks of each Nʲ unchanged; T still central1 | Sound both directions |
| 255 | Standard T: both canonical and relative predicates require weights(0,2) on grades(−1,1) | Sound |
| 257 | Inertia image{±1}: an index2 subgroup acts1, log1=0, only grade0 | Sound |
| 259 | Zero space: every grade0 and spectrum∅, all weights accepted | Sound boundary |
| 261 | Data scale2 and operator N′=N/2: pullback2N′=N | Sound |
| 263 | T⊕0: grade spectra those of T; T⊕E of weight0 fails common central1 | Sound |
| 265 | Residue index3: (1,2)↦(1,8), bases2↦8, central weight1 both | Sound |
| 267 | Dual T: operator−Nᵗ, eigenvalues1,1/2; graded weights0,−2 around−1 | Sound |
| 269 | T⊗T: N tensor Jordan lengths3 and1; grades−2,0,2 have eigenvalues1,(q,q),q² and weights0,2,4 around2 | Sound |
| 271 | Twist1: T eigenvalues become(q⁻¹,1), weights−2,0 around−1=1−2 | Sound |
| 337 | ℙ¹: all integer degrees reduce to ranks1,0,1 in degrees0,1,2, others0 | Sound |
| 339 | ℙ¹: outside[0,2] cohomology0, no additional purity conditions; empty X all0 | Sound both directions |
| 341 | ℙ¹ finite residue extensionf: eigenvalues(1,q)↦(1,qᶠ), same cohomological weights | Sound both directions |
| 343 | Good ℙ¹ model: inertia1, N0, H² eigenq | Sound |
| 345 | Two components permuted: H⁰ eigenvalues1,−1 of absolute value1, both weight0 | Sound |
| 347 | Two points: H⁰=E², each summand weight0; all other degrees0 | Sound both directions |
| 349 | Spec k: H⁰ eigen1 and weight0 | Sound |
| 451 | p2,n0,1,2: stage degrees1,2,4; valuation groupsℤ,(1/2)ℤ,(1/4)ℤ; same residue field | Sound |
| 452 | Union value groupℤ[1/2]; taking next root divides valuation by2, Frobenius surjective modulo p | Sound |
| 453 | n1: T^(1/2) maps toϖ₁≠0 modϖ and squares to0 on both sides | Sound |
| 454 | t♯=ϖ; truncating a t-series gives error≤∣t∣ᴺ→0, proving dense rational subfield | Sound |
| 474 | Identity in G_k∞ maps through all equivalences to identity in G_k′ | Sound |
| 475 | σ actingζ₃↦ζ₃²: both sharp expressionsζ₃² | Sound |
| 476 | β(στ)x=βσ(βτx); unramified quadratic degree2=2 | Sound |
| 477 | L=K restriction is identity; unramified quadratic fixes exactly corresponding degree2 subfield on both sides | Sound |
| 545 | Ideal(T),ε≤1: tube disc radiusε⊂unit disc | Sound |
| 547 | Generators(T,2T) over O at residue characteristic2: max(∣T∣,∣2T∣)=∣T∣, same tube | Sound |
| 549 | Radiusε=∣a∣: rational domain represented by K⟨T/a⟩, open in adic topology | Sound |
| 551 | Same rational affinoid is quasi-compact; finitely many charts give finite union | Sound |
| 553 | ε′=∣ϖ∣²≤∣ϖ∣=ε: small radius disc⊂large radius disc | Sound |
| 555 | T=0 lies in all tubes; T=ϖ fails any ε<∣ϖ∣; intersection is zero locus | Sound |
| 557 | Constructible disc radius∣ϖ∣ contains the tube at that radius; for any neighbourhood threshold a smaller ∣ϖ∣ᴺ suffices | Sound instance |
| 559 | f:S↦S²: preimage ∣T∣≤ε is ∣S²∣≤ε, exactly ideal(S²) tube | Sound |
| 561 | Complete scalar extension retains ∣T∣≤ε on both preimage descriptions | Sound |
| 563 | K-automorphism sends T-value z toσz with ∣σz∣=∣z∣; membership identical | Sound |
| 565 | Proper ℙ¹ model: both generic fibres are ℙ¹^ad; zero section becomes one analytic point | Sound |
| 629 | f=id: stalk RΓ(U(η̄),Aₙ)=Aₙ[0]; finite double cover gives Aₙ²[0] | Sound |
| 630 | Identity morphism: sliced and oriented base-change maps both identity on Aₙ[0] | Sound equivalence instance |
| 631 | Double cover before/after ramified extension: generic swap becomes identity; property implication holds, converse need not | Sound |
| 632 | Restrict away from the only special point: nearby sheaf restricts to0 on both sides | Sound |
| 652 | Identity f: π=id makes Aₙ adapted for every n, independent of n | Sound |
| 653 | Unipotent swap over A₄ has image order2, a prime divisor of4; overA₃ order2 is disallowed by unipotence | Sound |
| 654 | Identity and constant ranks1,2: every specialization on each fixed rank is identity, one neighbourhood works | Sound |
| 666 | Identity annulus one component; AS char2 gives root radii(√a,√b), finite étale degree2 | Sound |
| 667 | Prime-to-p degree3 Kummer torsor pulls back to3 sheets; shrunken radii satisfy a/t<tb iff a/b<t² | Sound |
| 668 | Constant constructible ranks1,2 have identical stalks and specialization isos, hence locally constant; n1 gives rank0 | Sound |
| 760 | Ambient ℙ¹ identity: k₁=𝔽_q(t),L=K,k″=𝔽_q((t)),Z′=ℙ¹,g=id | Sound data |
| 762 | Same c0 instance gives actual existence; point d0 gives point after finite field extension | Sound |
| 764 | Elliptic x-map: dim Z′=dim W=dim Y=1 | Sound |
| 766 | Elliptic source: geometric connected component count1, top dimension1; disjoint pair would give2 | Sound |
| 768 | Smooth projective elliptic cubic has singular locus∅ and proper projective embedding; singular cubic would fail smoothness | Sound |
| 770 | Ambient identity example: image=full ambient=preimage of full tube | Sound |
| 772 | Elliptic x-map: generic degree2≥1; identity degree1 | Sound |
| 774 | k₁=𝔽_q(t): closure𝔽_q((t)), residueq, discrete normalized v(t)=1 | Sound |
| 776 | Elliptic cover: deg pullback O(1)=2=2·1>0; point of inseparable degreep givesp>0 | Sound |
| 802 | Degree0 comparison E→E sends1↦1; elliptic top sends generator↦2·generator | Sound |
| 804 | d1 top: f*(qx)=2qx=q(2x); β identifies the same cyclotomic multiplier | Sound |
| 806 | Degree0 in A₃: f*(2·2)=1=f*(2)f*(2) | Sound |
| 808 | Connected degree0: f*(1)=1, zero map gives0 and fails | Sound |
| 810 | Multiplication2 at ℓ2,m1: A₄→A₂ sends2↦0; both paths send1↦0 | Sound |
| 812 | Ambient identityr_Y=g*=id: both compositesπ*_X; elliptic top: both give degree2 class | Sound |
| 814 | Inverse system×2 on A₂ᵐ limits to×2 onℤ₂, then×2 onℚ₂ (invertible) | Sound |

### Source locator audit

Verified 38 locator groups against four legally cached works. Ranges are grouped only in this accounting table; the individual statements and proof steps used from the ranges were read. The three original paywalled works remain uncertified, as already settled. No additional source request is needed.

| Source locator | Text witness and result |
|---|---|
| SCH12 Theorem 1.1, pp.245–246 | SCH12 line 34 and line 46: Kummer fields, quotient coordinate and sharp. Supports the motivating example. |
| SCH12 Theorem 1.15, p.251 | SCH12 line 239: geometrically connected proper smooth toric set-theoretic complete intersections. Matches final scope. |
| SCH12 Theorem 8.5, pp.304–305 | SCH12 line 2414: tilting/projection and the open étale-topos square. Imported toric owner retains these maps. |
| SCH12 Proposition 8.6, pp.305–306 | SCH12 line 2446: algebraically closed perfectoid base, proper smooth toric variety, ℓ≠p. These conditions are retained. |
| SCH12 Proposition 8.7, p.306 | SCH12 line 2458: hypersurface approximation over a dense subfield. Source's section/function slips are recorded below; README:784 uses a section of O(pᴺD). |
| SCH12 Corollary 8.8, p.307 | SCH12 line 2496: dimension and containment, not smoothness of the approximation. Package adds alterations. |
| SCH12 Proposition 9.1, p.307 | SCH12 line 2518: open-inertia exponential and unique N; source's unbound g is corrected by the package's σ. |
| SCH12 Definition/Proposition 9.2, pp.307–308 | SCH12 line 2532: centered filtration, N lowers by2, Nʲ pairs opposite grades. |
| SCH12 Conjecture 9.3 and following discussion, p.308 | SCH12 line 2543, line 2547 and line 2560: weights i+j, finite-extension invariance and invariant local factor. |
| SCH12 Theorem 9.4, pp.308–309 | SCH12 line 2571: rational closed point form. Package explains extension to degree-a closed points and uses q_x. |
| SCH12 Lemma 9.5, p.309 | SCH12 line 2585: tensor and dual invariant weight criterion; package leaves its ownership with the earlier curve roadmap. |
| SCH12 Theorem 9.6, pp.309–311 | SCH12 line 2589 through line 2654: Kummer restriction, tilt, neighbourhood, alteration, top map and summand. Package preserves bad reduction and small primes. |
| SCH12 Theorem 9.7, p.309 | SCH12 line 2604: algebraic–adic comparison over an algebraically closed field, finite prime-to-characteristic coefficients. Proper instances used. |
| SCH12 Lemma 9.8, p.310 | SCH12 line 2622: site pullback and Yoneda composition, inverse of a multiplicative isomorphism. |
| SCH12 Lemma 9.9, pp.310–311 | SCH12 line 2636: nonzero top map argument. Rational coefficients and connected target needed; both are explicit in package. |
| ITO20 Theorems 1.1–1.2 and §1.2, pp.1–3 | ITO20 line 76, line 99 and line 103: degreewise radii and characteristic-zero Kummer route. Package supplies amplitude/continuity inputs instead of exchanging quantifiers. |
| ITO20 Theorem 1.4, pp.3–4 | ITO20 line 124: uniform radius; cover may depend on coefficients; finite Galois factor retained in characteristic p. |
| ITO20 §2.1, Definitions 2.1–2.2, Remark 2.3, pp.5–7 | ITO20 line 189, line 231, line 238, line 252 and line 317: sliced action, universal base change and stalk. Matches imported-oriented-topos notation. |
| ITO20 Definition 2.5 and Theorem 2.7, pp.7–8 | ITO20 line 348 and line 359: locally unipotent along strata and coefficient-uniform alteration for the proper case. |
| ITO20 §3.1, Proposition 3.1 and Theorem 3.3, pp.8–9 | ITO20 line 378, line 388 and line 412: normal open base, étale boundary and prescribed adapted plurinodal open. R03 concerns the supplier, not the source. |
| ITO20 Definition 3.4 through Proposition 3.16, pp.9–17 | ITO20 line 429 through line 800: truncated defects, proper descent, reduction to a prescribed open, nodal induction and termination. The adapted-boundary step is used explicitly at line 640. |
| ITO20 Corollary 3.17, pp.17–18 | ITO20 line 803: separated finite type, Noetherian excellent base, one alteration for all invertible n. |
| ITO20 Proposition 4.1 and Lemma 4.3, pp.19–20 | ITO20 line 866 and line 918: finite-ideal tubes and constructible cofinality; fixed integral ideal retained. |
| ITO20 Theorem 4.5(2), p.21 | ITO20 line 964 and line 974: locally constant constructible sheaf, characteristic zero, n invertible in O. |
| ITO20 Remark 4.7, p.22 | ITO20 line 987: infinite-dimensional p-torsion H¹ of a disc versus zero at the origin. |
| ITO20 Theorem 4.9 and Corollary 4.11, pp.22–23 | ITO20 line 1003 and line 1030: one radius for all invertible n and all degrees, and the proper-model application. |
| ITO20 Theorem 5.3, p.27 | ITO20 line 1198: compact-support nearby-cycle stalk and Galois action; declared gap retains specialization compatibility used in its proof. |
| ITO20 Proposition 5.5, pp.29–30 | ITO20 line 1299: specialization maps for adapted coefficients. |
| ITO20 Definition 6.1 and Theorems 6.2–6.3, pp.31–32 | ITO20 line 1413, line 1427 and line 1439: higher-rank-point tameness, annular decomposition in either characteristic, and prime-to-residue trivialization only under tameness. |
| ITO20 Definition 6.5, Propositions 6.6–6.7, pp.32–35 | ITO20 line 1455, line 1481, line 1502 and line 1518: adaptedness, uniform choice of π, tameness and one overconvergence neighbourhood. |
| ITO20 Theorem 6.10, pp.35–37 | ITO20 line 1586 through line 1668: Galois factor, radicial comparison, constructibility, overconvergence and shrinking annuli. |
| ITO20 Lemma 6.11, pp.37–38 | ITO20 line 1673: strictly a<b, finite-cover hypothesis and pseudo-adic supports. R01 restores the omitted strict inequality. |
| ITO20 Lemma 7.1 and its proof, pp.39,44–46 | ITO20 line 1738 and line 1973: smooth principal case, duality and supported annular vanishing. |
| ITO20 Proposition 7.2 and Corollary 7.4, pp.40–41 | ITO20 line 1774 and line 1813: uniform cohomological bound and descent. |
| ITO20 Lemmas 7.5–7.7, pp.41–44 | ITO20 line 1846, line 1901 and line 1928: truncated descent and finite purely inseparable parameter change; ε↦ε^(pᴺ) has the package's direction. |
| ITO20 Appendix A, Theorem A.6, Proposition A.8 and Lemma A.11, pp.49–54 | ITO20 line 2191, line 2279, line 2338, line 2382 and line 2391: discriminant convexity, bounded eventual constancy, annular decomposition and tame torsor argument. Original normalization-length misprint in the intervening proof is recorded below. |
| DEL80 Theorem 1.8.4, pp.175–176 | DEL80 line 1528 (context starts line 1524): local pure-sheaf monodromy weights. The package uses all embeddings through the earlier supplier. |
| DJ96 Theorem 4.1 and Remark 4.2, pp.66–67 | DJ96 line 597 and line 604: alteration with compactification; finite extension of constants obtains the smooth geometrically irreducible source used in §4.1. |

## Not verifiable

- HUB98 Definition 1.4 and Theorems 2.1/3.6: the original is settled as uncertified. ITO20 supplies the degreewise local-constancy and neighbourhood formulations, but does not certify the entire original oc-quasi-constructibility definition or proof. No request was reopened.
- LUT93 Theorem 2.2: original settled as uncertified; the precise characteristic-zero form used here was checked in ITO20 §1.2. No request was reopened.
- HUB96 Theorems 3.7.2/3.8.1, Lemma 2.7.11 and Theorem 5.7.8: original settled as uncertified. Relevant formulations were checked in SCH12/ITO20 and against the supplied roadmap contracts. No request was reopened.
- AnalyticToricGeometryPartII has an available board design, including NT.3/NT.4 naturality and NT.6 approximation; a current final package was not available through the roadmap index. Its design was checked, and final-package drift cannot be certified. This is not a finding that the declared supplier is absent.
- No fresh Lean execution was performed. The supplied elaborated signature was checked against every binder and the README, and the mathematical implication was proved on paper above. This review does not independently certify compilation.
- Ownership beyond the supplied sibling files and indexed accessible roadmap texts was not checked. No claim is made about inaccessible private or unlisted open work. No original proof of a theorem merely recalled from Huber/Lütkebohmert or from another cited author's work in ITO20 is independently certified by reading that original.

## Source issues

- **Misprint** in SCH12 at Proposition 9.1, printed page 307 (SCH12 line 2524): the source says the exponential uses a tame character evaluated at an unbound g; it should be evaluated at the quantified inertia element σ; affects nothing.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed page 306 (SCH12 line 2491): the source says the power of the approximating section is a regular function on the proper toric variety; it should be a section of O(pᴺD); affects the proof.
- **Misprint** in SCH12 at proof of Proposition 8.7, printed page 306 (SCH12 line 2480): the source says integral-model trivializations differ by a unit of K°; it should be an invertible integral-model function, whose pointwise absolute value is one; affects nothing.
- **Gap** in SCH12 at proof of Theorem 9.6 and Lemma 9.9, printed pages 309 and 311 (SCH12 line 2609 and line 2647): the source says a nonisomorphism into the alteration's top cohomology must be zero; it should be justified by choosing a geometrically connected alteration after finite constant extension; affects the proof.
- **Misprint** in ITO20 at Theorem 4.5(1)(c), printed page 21, and Theorem 4.8(3), printed page 22 (ITO20 line 973 and line 1001): the source says the target support removes d(Ẑ) from itself; it should be d(X̂) minus d(Ẑ); affects nothing.
- **Misprint** in ITO20 at proof of Proposition A.7, printed page 51 (ITO20 line 2275): the source says the normalization of the one-dimensional nodal local ring has module length one; it should be the quotient of the normalization by the local ring that has length one; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "959da23192f19e08575ec5aaea0a88ecdb120c45", "job": "RT-DeligneWeightsAndPurityPartII~1a", "model": "gpt-6-astra", "worker": "chris-4"} -->
