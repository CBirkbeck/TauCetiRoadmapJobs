# Review of ComplexMultiplicationAndExplicitReciprocityPartII (pull request #1695 at 72c447f)

**Verdict:** accepted

## R01 (P3) — The plan still points the absolute-Hodge gap at §B1.3

**Location:** `packages/ComplexMultiplicationAndExplicitReciprocityPartII/design/plan.json:4281`, `"section": "§B1.3"`, for `absolute-hodge-padic-comparison`; the README contract at `TauCetiRoadmap/ComplexMultiplicationAndExplicitReciprocityPartII/README.md:89` correctly says “extending §1.3”. This is previous R02, still present.

**Claim:** The named extension belongs at AutomorphicBundles §B1.3.

**Witness:** `TauCetiRoadmap/AutomorphicBundles/README.md:875` is “1.3 Descended Hodge-tensor realizations”; its current indexed head has no §B1.3. The plan and README have the same gap slug and mathematical request, so this is a locator defect, not an unowned prerequisite.

**Exact repair and test:** Change only this gap entry's `section` to `§1.3`. That locator resolves to the existing descended-realizations target, while the requested additional p-adic comparison remains explicitly declared. No mathematical statement needs changing.

## Previous findings

- R01 — repaired: README:97 consumes LT.2's four named targets and R07.4.18–R07.4.21, with R07.4.23 for integral dyadic comparison. All five former gap uses now cite LT.2; the redundant gap is gone.
- R02 — not repaired: plan:4281 still says “§B1.3”; README:89 correctly says “extending §1.3”. Carried as nonblocking R01 above.
- R03 — repaired: README:87 no longer cites §11.10. Its remaining tensor and coefficient contracts retain their existing consumers; the quaternionic Hodge-line inputs are unchanged.

## Verified sound

:robot: Independent AI incremental re-review of 20 changed lines since 6cc3139. Only README changed (10 insertions, 10 deletions); Suggested.lean and metadata are unchanged. Reviewed all ten changed lines and their affected consumers, rather than repeating the full review. No P1 or P2 remains. Acceptance is conditional on the nine declared supplier contracts, as permitted by the review brief, and means readiness for human final approval.

**Gate and scope.** Reran the gate successfully: every scanner, identifier, metadata, dependency, stray-file, outside-folder and cleanliness check passed. Separately reran the targeted build of `TauCetiRoadmap.ComplexMultiplicationAndExplicitReciprocityPartII.Suggested`: successful, only the two expected `sorry` warnings. Direct `lake env lean` elaboration also succeeded with only those warnings. The worker's gate independently records `build=0 OK`. The outside-folder diff is empty, and the worktree remains unchanged. No new algorithm, route restriction, sorry'd data, stand-in predicate or option override was introduced.

The fresh dependency check output is:

```text
depcheck: 204 roadmaps, 1554 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The changed suppliers precede this roadmap in `ORDER.txt`: AbelianSchemesAndArithmeticModuli 40; FiniteFlatGroupsAndIntegralPadicHodgeTheory 45; NeronModelsAndSemistableAbelianVarieties 46; PELModuli 100; AutomorphicBundles 164; LubinTateFormalModulesAndQuasiCanonicalLifts 321; this roadmap 343.

**Changed passages and resolved ownership.** Read README:87,97,107,392,466,486,879,915,1093,1121 with §§1.3–1.4, 2.1–2.2, 2.7, 6.2 and 11.1–11.3. The added references consume existing theory. The three Lubin–Tate Checks remain discriminating. All nine plan gap slugs equal the README's nine slugs; no Lubin–Tate gap remains. The other eight contracts and the absolute-Hodge mathematical request are unchanged from [R2].

Resolved the affected citations afresh using `roadmaps show` at the indexed heads, and searched ownership by object using `roadmaps grep` (Lubin–Tate character, dyadic classification, relative Hom extension, polarized rigidity), including main and open heads. The board design was read separately because the Lubin–Tate supplier has no main/open-PR roadmap yet:

- `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:356,374,410,447`: finite-height torsion, Tate module, character and arithmetic reciprocity. Its plan is complete with an accepted design review dated 2026-10-18. The torsion-to-p-divisible comparison includes the unit correction between π-power and p-power transition maps. LT.2 supplies the action; this roadmap retains only its CM applications.
- `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:6265,6308,6371,6407,6482`: §§R07.4.18–R07.4.21 and R07.4.23. The rational comparison explicitly covers complete mixed-characteristic DVRs with perfect residue field, including geometric residue fields. R07.4.23 supplies the integral dyadic anti-equivalence and strongly divisible comparison. The new contract correctly distinguishes it from the up-to-isogeny statements.
- `TauCetiRoadmap/AutomorphicBundles/README.md:813,843,875,1336,1423,1463,1506,1550,1574`: §§1.1–1.3, 3.1 and 3.4–3.8. These provide defining tensors, descended realizations and coefficient coherence. §3.7 explicitly excludes crystalline and B_dR assertions, so the declared absolute-Hodge gap remains necessary. Removing §11.10 removes no input used by a target.
- `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:3438`: §A6.25 gives bijective restriction of abelian-scheme Hom over a dense open in a locally Noetherian normal base. These hypotheses hold on the normal integral local models used here. `TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:2933,2996` still supplies §§5.1–5.2, good reduction and its isogeny invariance.
- `TauCetiRoadmap/PELModuli/README.md:2183,2203,2239,3765,3980,4039`: M2.1–M2.3, M6.1, M6.8, M6.10. They distinguish polarized full-level rigidity, neatness, representable level maps, coarse points and bounded definition fields. The newly explicit rigidity inputs support §11.1's existing polarized descent route.
- `TauCetiRoadmap/FaltingsFinitenessAndIsogenyTheoremsPartII/README.md:926`: §5.5 still gives a geometric isogeny over a common number field with degree bounded by a dimension-uniform power of max(1,height,field degree), exactly the form consumed downstream.

These are supplier contracts, not new declarations here. No moved ownership or duplicate construction was introduced. The wider ownership audit is carried forward from [R2]. For shape, consulted the merged SuccessiveMinima and MassFormula roadmaps; the target retains its prose layers, APIs, Checks, Examples and Dependencies.

**Source sample.** Revalidated the four sampled targets in the affected dependency paths: §1.3 against A Proposition 3.2.1, p.417 (A line 1105), including the hypothesis K_p=K₀,p; §2.1 against A Proposition 3.5.2 and Remark 3.5.3, pp.422–424 (A lines 1310,1356); §2.2 against A Corollary 3.5.4 and its proof, pp.424–425 (A lines 1372,1390); §11.1 against T Lemma 4.1, p.384 (T line 241), with the polarized correction supplied by M6.8. The changed contract's §2.2 locator is pp.401–402 (A lines 429–450), and §3.6 is pp.428–429 (A lines 1553,1569–1586). Also checked the affected family extension at A Proposition 3.4.1, pp.419–420 (A lines 1195–1207). No new source was required.

The other eleven seeded targets are unchanged and inherit [R2]'s checks: §§0.2, 3.3, 4.2, 4.2d, 4.6, 7.1, 8.2, 12.4, 12.5, 13.2 and 13.4. Their computed rows are retained below. No new unverified locator was introduced.

**Lean signatures and headline coverage.** Fresh scratch `#check @name` elaboration checked both declarations against README §§10.1–10.2. Both retain g>0, ε>0, Field, NumberField, IsCMField and degree 2g; the isogeny theorem retains dimension g, maximal-order endomorphism identifications and action compatibility. Constants precede fields and varieties. No binder changed or disappeared. Scratch one-tactic probes using `simp`, `rfl` and `infer_instance` failed on both targets; neither is padding.

Opened the following four pinned carrier files again: `Mathlib/NumberTheory/NumberField/CMField.lean:69` (IsCMField records total complexity and quadraticity, not finite degree), `Mathlib/NumberTheory/NumberField/ClassNumber.lean:64,69` (maximal-order class number and positivity), `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.lean:56,61` (finite and surjective, without a degree field), and `Mathlib/AlgebraicGeometry/Morphisms/FlatRank.lean:88` (rank at a target point). They agree with the preserved signatures and their stated restrictions.

The README headlines remain: CM-height linearity; all-prime CM realizations and different-torsion comparison; total reflex determinant/height; orthogonal big-CM intersection and prime elimination; corrected nearby-type and quaternionic heights; averaged Colmez; relative class-number growth; distant CM isogenies; individual CM height bounds; primitive/general center-order orbits; polynomial CM lifts and bounded-degree finiteness. The two native-carrier headlines are stated. The unchanged module docstring names the others and their missing CM, integral-realization, arithmetic-intersection, stable-height or moduli/uniformization carriers; no replacement stand-in was added.

### Computed adversarial pass

The first table recomputes the changed contracts and affected statements. The second carries forward each untouched row's values from [R2]; it does not present inherited checks as fresh calculations. The rows cover all fifteen sampled targets and the headline theorems.

| Statement | Instances tried | Values computed on both sides / negative control | Result and change |
|---|---|---|---|
| LT.2 contract: torsion, character and arithmetic reciprocity (README:97) | ℚ₅, π=5; units 1,2; levels 1,2 | 2·3=6≡1 mod 5; 2·13=26≡1 mod 25; 13≡3 mod 5. Identity unit and rec(5) both act by 1. Geometric action gives 2≠3. | Recomputed; all four LT.2 targets supply the stated objects and action. |
| LT.2 contract: restriction and general ramification (README:97) | Adjoin full level-one torsion; K=ℚ₂(√2), π=√2, height 1 | Restricted character is 1 mod π. Over the ramified dyadic K, q=2: π-levels have ranks 2 and 4; [2] has rank 4 since 2=π²; underlying Tate rank over ℤ₂ is 2, over O_K is 1. | Recomputed; no unramified-base assumption introduced. |
| R07.4 contract: variance and dyadic integral comparison (README:97) | Ĝ_m over ℤ₂; zero and étale p-divisible groups | Ĝ_m has T=ℤ₂(1); D_cris(T∨) has φ=2 and filtration jump 1, while D_cris(T) has φ=1/2 and jump −1. Zero group gives rank 0 on both sides; ℚ₂/ℤ₂ gives φ=1, jump 0. | Recomputed; §§R07.4.18–21 give the rational comparison, §R07.4.23 the integral dyadic statement. |
| LT contract's dyadic torsion Check (README:103) | μ₂, μ₄; unit 3 | Geometric cardinalities 2 and 4; 3≡1 mod 2 but 3≠1 mod 4; 3²≡1 mod 4. [2](X)=2X+X² has linear coefficient 2 and reduction X². | Recomputed; triviality at level one does not force a trivial Tate character. |
| AutomorphicBundles contract after deletion of §11.10 (README:87) | Unit tensor; alternating form under scalar 2; dual Tate lines | Unit comparison 1↦1; form scales by 4, so keeping its Tate line gives GSp. Dual lines have exponents 1 and −1, whose tensor exponent is 0. | Recomputed; §§1.1–1.3 and 3.1, 3.4–3.8 suffice for the retained claims. |
| Absolute-Hodge gap locator (plan:4281; README:89) | Tensor unit and identity endomorphism | Both comparisons send 1↦1 and I↦I. Supplier has one §1.3 and zero §B1.3 headings; plan/README share the same one gap slug. | Mathematical contract unchanged; stale plan locator is R01. |
| Hom extension contract and §1.4 (README:107,329–337) | E: y²=x³−x over ℤ₅ (discriminant 64), maps id and [2] | Generic/integral maps agree; kernel ranks 1/1 and 4/4. Polarization matrix J scales to 2J with determinant 4 rather than 1. | Recomputed; §A6.25 applies over these locally Noetherian normal bases and gives uniqueness. |
| 1.3 Finite étale CM model | K₀ at 5 versus full 5-torsion level | Inertia image in the K₀ quotient is 1; full torsion sees unit 2 acting as 3≠1 mod 5. | Recomputed; A Proposition 3.2.1 keeps exactly the maximal-level hypothesis. |
| 2.1 Crystallinity; changed Needs at README:392 | ℚ₅ Lubin–Tate character and tensor unit | Unit 2 acts by 3 mod 5; uniformizer by 1. Tensor unit has rank 1, φ=1 and filtration jump 0; the Lubin–Tate cohomological dual has φ=5 and jump 1. | Recomputed; restriction to Γ_y and the image torus is retained. |
| 2.2 CM Breuil–Kisin realization, using repaired contract | Unit module; π_y²=3; p=2 multiplicative group | φ*M modulo u gives W; modulo u²−3 gives O_y; E_y(0)=−3. At p=2 the dual Tate realization has φ=2, jump 1, not φ=1/2, jump −1. | Recomputed; Frobenius-pullback specialization and actual base uniformizer retained. |
| 2.7 Tautological CM crystal; changed Needs at README:466 | E=ℚ(i), p=5, choose one of two split primes | Local factor ranks 1+1=2; distinguished cohomological factor φ=5, other φ=1, hence slopes 1 and 0; Fr(1)=1. | Recomputed; A §3.6 includes the other prime factor. |
| 6.2 Different-torsion comparison; changed Needs at README:879 | ℤ₃[√3]/(2√3) and ℤ₂[√2]/(2√2) | With v(√p)=1, different lengths are 1 and 3; √p−(−√p)=2√p=0 in each quotient. No division by 2. | Recomputed; integral dyadic supplier covers the retained p=2 claim. |
| 11.1 Polarized common field; added M2.1–M2.3 at README:1093,1121 | g=1; level 3; shear on E² | GL₂(𝔽₃) has (9−1)(9−3)=48 elements; 2·3⁴=162 and 162²=26244=4·3⁸. U=[[1,3],[0,1]]≡I mod 3 but UᵗU=[[1,3],[3,10]]≠I for the product polarization. | Recomputed; polarized rigidity excludes the unpolarized wrong model. |
| 11.1 unit and quotient-polarization Checks | E=ℚ(i,√2), u=577+408√2; f=[2] | 577²−2·408²=1, u≡1 mod 3, but uū=u²=665857+470832√2≠1. For f=[2], g₀=id gives g₀f=[2] and g₀*λ=λ. | Recomputed; endomorphism descent and transported polarization agree with M6.8. |

| Statement | Instances tried | Inherited computed values | Result and provenance |
|---|---|---|---|
| FaltingsFinitenessAndIsogenyTheoremsPartII §5.5 | Inherited instances in [R2] | Rational Hom = 0, geometric isomorphism of degree 1 ≤ C_g·max(1,…)^κ_g requires only C_g ≥ 1; a rational-isogeny version would exclude the pair. §11.2's budget with κ=2, δ=1/16, a=3/16, ε=1/32: δκ=1/8<3/16<1/4 and εκ=1/16<3/16. | Carried from [R2]; statement unchanged. |
| Conventions: metric | Inherited instances in [R2] | Square elliptic torus: squared volume 2; Fal metric 1; YZ metric 1/π; shifts −log(2)/2 and +log(2π)/2. | Carried from [R2]; statement unchanged. |
| Conventions: stack degree | Inherited instances in [R2] | Gaussian stack degree 1/4; absolute count 1/2; (2h/4)/(1/4)=2h. | Carried from [R2]; statement unchanged. |
| Conventions: excluded inputs | Inherited instances in [R2] | g=0, zero ring, equal-characteristic DVR each contradict a standing hypothesis. | Carried from [R2]; statement unchanged. |
| 0.1 CM functions | Inherited instances in [R2] | C₂ overlap (1+χ)/2; C₂×S₃ overlaps 6,2,2 → 10/3, complements 0,4,4 → 8/3, sum 6; C₆ f(r)=1≠f(r⁻¹). | Carried from [R2]; statement unchanged. |
| 0.2 Height linearity | Inherited instances in [R2] | a+a=2a, h+h=2h; t·ev_c changes the value at c by t and no overlap. | Carried from [R2]; statement unchanged. |
| 0.3 Average character | Inherited instances in [R2] | d=1,2,3 at 1: 1,2,4; at c: 0; d=1 gives (1+χ)/2. | Carried from [R2]; statement unchanged. |
| 0.4 Conjecture predicate | Inherited instances in [R2] | f=x, g=y agree at (1,1), differ at (1,0); C₆ function outside H_CM. | Carried from [R2]; statement unchanged. |
| 1.1 Height torus | Inherited instances in [R2] | dimensions d+1=2,3; kernels of order 1,2; pair sums 1,0 vs 1,1. | Carried from [R2]; statement unchanged. |
| 1.2 Integral level | Inherited instances in [R2] | ℚ₃(√3): π=√3(1+√3) class 1, π² class 0; ℚ(√17,i) at 2: valuations (1,−1), norm cokernel order 2 not 4. | Carried from [R2]; statement unchanged. |
| 1.5 Total reflex pair | Inherited instances in [R2] | degrees/dimensions 2/1, 4/2, 8/4; ℚ(i,√2) gives ℚ(i)×ℚ(√−2); −ξ reverses signs. | Carried from [R2]; statement unchanged. |
| 1.6 Total reflex height | Inherited instances in [R2] | 24/6=4 vs 24/8=3. | Carried from [R2]; statement unchanged. |
| 2.3 Tensor torsor | Inherited instances in [R2] | 1↦1, I↦I; scalar 2 multiplies an alternating form by 4. | Carried from [R2]; statement unchanged. |
| 2.4 Bundles/crystals | Inherited instances in [R2] | unit rank 1 filtration 0; H₁/H¹ Hodge indices opposite; W(𝔽̄₃)≠W(𝔽₃). | Carried from [R2]; statement unchanged. |
| 2.5 Torus action | Inherited instances in [R2] | Norm(3+2√2)=1 but not identity; t/t̄=1; 1/2 not integral on ℤ[i]. | Carried from [R2]; statement unchanged. |
| 2.6 Quadratic line | Inherited instances in [R2] | f₁²=f_i²=1 vs i²=−1; B((1,i),(1,−i))=4 vs −4. | Carried from [R2]; statement unchanged. |
| 2.8 Supersingularity | Inherited instances in [R2] | split slopes (0,1), inert (1/2,1/2); endomorphism slopes (1,−1) vs (0,0). | Carried from [R2]; statement unchanged. |
| 3.1 Determinant | Inherited instances in [R2] | ranks 1,4; diag(π,1,1,1) length 1; ε≠0, ε²=0. | Carried from [R2]; statement unchanged. |
| 3.2 Partition quotient | Inherited instances in [R2] | empty/full give 0; C/(2√3) length 1. | Carried from [R2]; statement unchanged. |
| 3.3 Partition length | Inherited instances in [R2] | 1=1−0−0; reversed sign −1; cokernels 1+1−1=1. | Carried from [R2]; statement unchanged. |
| 3.4 Conductor functional | Inherited instances in [R2] | μ(1)=0, μ(χ_tame)=1, μ((1+χ)/2)=1/2; digit sequence ↦ (2p)^(−n−1). | Carried from [R2]; statement unchanged. |
| 3.5 Positive lengths | Inherited instances in [R2] | at 3: (2/2)(1/2+1/2)=1; at 2: (2/2)(3/2+3/2)=3; split 0. | Carried from [R2]; statement unchanged. |
| 3.6 Metrized determinant | Inherited instances in [R2] | r=1 absolute period 2π; d=1 degree 2log(2π)=2^d d log(2π). | Carried from [R2]; statement unchanged. |
| 3.7 Local reflex comparison | Inherited instances in [R2] | fibers 2^(3−1)=4; F=ℚ: v_q(d_F)=0, Δ length 0. | Carried from [R2]; statement unchanged. |
| 3.8 Reflex height | Inherited instances in [R2] | Ω/CM=2h; Δ=log1=0; h=ω/(4CM)−log(2π)/2. | Carried from [R2]; statement unchanged. |
| 4.1 Auxiliary data | Inherited instances in [R2] | ξ=−1 signature (0,2), ξ=1 (2,0); a↦ab adds v(Nm b), ξ/Nm b subtracts it. | Carried from [R2]; statement unchanged. |
| 4.2 GSpin divisors | Inherited instances in [R2] | B(z,z̄)=−4, norm² 4; no vector of norm −1; f=0 ↦ 0. | Carried from [R2]; statement unchanged. |
| 4.2a Borcherds support | Inherited instances in [R2] | v_p(D)=1 error 0, v_p(D)=2 excluded; c₀=2 gives 2log(4πe^γ). | Carried from [R2]; statement unchanged. |
| 4.2b Big-CM degree | Inherited instances in [R2] | 0/Λ(0)=0; 2a/(2d)=a/d. | Carried from [R2]; statement unchanged. |
| 4.2c Hodge-height identity | Inherited instances in [R2] | 2E/(2c₀d)=E/(c₀d); (1/2)ℤ norms 1/4, 1 ⇒ coefficients 0; −2ℓ(0)−log(D_E/D_F), gamma 0. | Carried from [R2]; statement unchanged. |
| 4.2d Filtered Hodge adapter | Inherited instances in [R2] | p⁻¹O_E norm valuation 0 vs p²O_E minimum 6; D_F=1 correction 0. | Carried from [R2]; statement unchanged. |
| 4.3 Average error | Inherited instances in [R2] | 0/(4c₀d)=0; 2E/(8c₀d)=E/(4c₀d). | Carried from [R2]; statement unchanged. |
| 4.4 Avoiding primes | Inherited instances in [R2] | F=ℚ narrow group 1; (−1)^(d/2)=−1,+1 for d=2,4. | Carried from [R2]; statement unchanged. |
| 4.5 Error elimination | Inherited instances in [R2] | 2^m3^n=1 ⇒ m=n=0; empty support 0. | Carried from [R2]; statement unchanged. |
| 4.6 Quadratic average | Inherited instances in [R2] | ℓ(0)=−log4+2logR_Γ ⇒ −logR_Γ−logπ/2 both sides. | Carried from [R2]; statement unchanged. |
| 5.1 Component invariance | Inherited instances in [R2] | identity: lengths 0; O_L/(2√p) length 1 for odd p. | Carried from [R2]; statement unchanged. |
| 5.2 Height decomposition | Inherited instances in [R2] | g=1 correction −log1/8=0; 𝔽₂⁴ has 4 idempotents, one element takes ≤2 values. | Carried from [R2]; statement unchanged. |
| 5.3 Nearby types | Inherited instances in [R2] | (2,1),(4,4),(8,12); opposite square vertices differ in 4 embeddings. | Carried from [R2]; statement unchanged. |
| 5.4 Nearby average | Inherited instances in [R2] | g2^(g−1)a·2^(1−g)=ga; g=1 correction 0. | Carried from [R2]; statement unchanged. |
| 6.1 Graph datum | Inherited instances in [R2] | ℚ(√−3): 3 points, graph 3, product 9; graphs of ±1 meet in 0. | Carried from [R2]; statement unchanged. |
| 6.3 Integral graph | Inherited instances in [R2] | graph order 3, projection kernels 1, Cartier dual 3; product would give kernels 3. | Carried from [R2]; statement unchanged. |
| 6.4 Nearby identity | Inherited instances in [R2] | (a+b)/2; a=b gives a not 2a; unit different: kernel 0, degree 1. | Carried from [R2]; statement unchanged. |
| 6.5 Quaternionic graph | Inherited instances in [R2] | δ=2√3 quotient length 1, graph 3; δ=1 gives 0. | Carried from [R2]; statement unchanged. |
| 7.1 Quaternion datum | Inherited instances in [R2] | inert counts 2,1,0 ⇒ totals 3,3,3; flip ⇒ 2,2,2; 3,7 inert in ℚ(i). | Carried from [R2]; statement unchanged. |
| 7.2 Point height | Inherited instances in [R2] | 6log2/3=2log2=12log2/6; absolute denominator gives log2; norm(dz)=2 at i, 1+i. | Carried from [R2]; statement unchanged. |
| 7.3 Hodge-line bridge | Inherited instances in [R2] | degree 2a−b; norm 2→4; tangent rank 1 vs 2. | Carried from [R2]; statement unchanged. |
| 7.4 Quaternionic average | Inherited instances in [R2] | −ℓ/2−log(d_rel D_F)/4; coefficient of log d_B is 0. | Carried from [R2]; statement unchanged. |
| 8.1 Self-intersection | Inherited instances in [R2] | i₀=2t, i₀/e=t; multiplicity 2 vs 1. | Carried from [R2]; statement unchanged. |
| 8.2 Quaternionic height | Inherited instances in [R2] | h_L=−t; ratio reversal flips log(d_rel/d_B)/2. | Carried from [R2]; statement unchanged. |
| 9.1 Averaged Colmez | Inherited instances in [R2] | d_rel D_F=D_E/D_F; subtract g log(2π)/2 ⇒ orthogonal mean. | Carried from [R2]; statement unchanged. |
| 10.1 / `relative_class_number_growth` | Inherited instances in [R2] | ratios 1,1; ε=1/8, C=4^(−1/8): lower sides 1 and (3/4)^(1/8)=0.96467863; g=3 regulator ratios 4 or 2. | Carried from [R2]; statement unchanged. |
| 10.2 / `distant_cm_isogenies` | Inherited instances in [R2] | degrees 2,4,1 for (1+i),[2],id; B=A minimum 1 ≥ 1, 0.96467863. | Carried from [R2]; statement unchanged. |
| 10.3 Individual height | Inherited instances in [R2] | mean 1; 2·1−(2−1)(−1)=3. | Carried from [R2]; statement unchanged. |
| 11.2 Exponent budget | Inherited instances in [R2] | δκ=1/8<a=3/16<1/4; εκ=1/16<a. | Carried from [R2]; statement unchanged. |
| 11.3 Primitive orbit | Inherited instances in [R2] | orbits 1,1 at D=4,3; c=4^(−δ) gives 1,(3/4)^δ. | Carried from [R2]; statement unchanged. |
| 12.1 Center order | Inherited instances in [R2] | D_x=16,36 for conductors 2,3; degree 2 vs 2n. | Carried from [R2]; statement unchanged. |
| 12.2 Reciprocity image | Inherited instances in [R2] | C₄ doubling: image 2, cokernel 2; ≤2 markings. | Carried from [R2]; statement unchanged. |
| 12.3 Compact index | Inherited instances in [R2] | J=3, I=4, D=36 vs I²·4=64; exp(2) valuations 1,1,1, exp(4) 3,5,9. | Carried from [R2]; statement unchanged. |
| 12.4 General reduction | Inherited instances in [R2] | B^s I·3=12 not 48; Bp^η≥√5/2>1. | Carried from [R2]; statement unchanged. |
| 12.5 General orbit | Inherited instances in [R2] | D≤c^(−1/δ)orbit^(1/δ); conductor 2 gives 16 not 4. | Carried from [R2]; statement unchanged. |
| 13.1 Coordinate degree | Inherited instances in [R2] | 2·2!=4, 2·4!=48; Z=i degree 2, real/imaginary 1. | Carried from [R2]; statement unchanged. |
| 13.2 Lattice basis | Inherited instances in [R2] | Gram diag(2,2), diag(2,8): det 4,16; covolumes 1,2. | Carried from [R2]; statement unchanged. |
| 13.3 Period reduction | Inherited instances in [R2] | det 4m²; L=2ℤ[i] det 64 index 1 vs 4; ζ=i det 1; M+i↦i entry M. | Carried from [R2]; statement unchanged. |
| 13.4 Lift height | Inherited instances in [R2] | H(i)=1 vs height 1 of X²+1; H(2i)=2 vs 4 of X²+4. | Carried from [R2]; statement unchanged. |
| 13.5 Bounded-degree finiteness | Inherited instances in [R2] | D_x≤CN^b, height ≤C′(CN^b)^a, degree ≤2(2g)!; j=1728 degrees 1 vs 2. | Carried from [R2]; statement unchanged. |

## Not verifiable

- The nine declared supplier gaps remain implementation obligations. Acceptance verifies their declared ownership and preserves the prior review's mathematical assessment; it does not claim those contracts have already been proved. The stale plan section is the P3 note above.
- As in [R2], journal pagination of T12 and PT and the 2023 journal version of YE was not collated; those untouched checks rely on the cited preprint/author versions. No new inaccessible text arose.
- Open-work ownership was checked for the affected objects through the indexed heads and board design. Unaffected objects inherit [R2]'s audit; unindexed open work was not searched.

## Source issues

- **Misprint** in A at Proposition 3.5.2, printed p.422 (A line 1311): the source says the crystalline representation is attached to an undefined lattice Λ_p,y; it should be N_p,y, the lattice introduced immediately before the proposition; affects nothing.
- **Error** in T at proof of Lemma 4.1, printed p.384 (T lines 245–246): the source says marking 3-torsion rigidifies an unpolarized abelian variety; it should be a polarized pair with marked 3-torsion, since E² has nontrivial integral shears fixing 3-torsion; affects the proof.

[R2]: packages/ComplexMultiplicationAndExplicitReciprocityPartII/reports/PRREVIEW-ComplexMultiplicationAndExplicitReciprocityPartII~2.md
