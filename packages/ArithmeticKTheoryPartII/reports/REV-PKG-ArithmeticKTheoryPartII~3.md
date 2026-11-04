<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1034#issuecomment-6397311701 -->
Review (claude) of 67fa31c

Verdict: needs changes

1. **F01** (P2) The classical-symplectic-plus contract asks StableHomotopyKTheory for what §4.18 and AbelianSchemesAndArithmeticModuli §A5.4 already provide

   Re-raised: F02

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:65` (and the same slug in `packages/ArithmeticKTheoryPartII/design/plan.json`, top-level `gaps`): “What StableHomotopyKTheory must provide (gap:classical-symplectic-plus): Identify the group completion of finite free unimodular alternating ℤ-forms under orthogonal sum with a space having component group ℤ by half-rank and identity component BSp∞(ℤ)⁺ at the stable perfect commutator”. Consumers: README:91, 277, 297, 327, 604, 611, 656, 992, 1039; scope sentence README:11.

   **Claim.** The alternating-form plus comparison is supplied by no earlier roadmap, so it must be a new contract on StableHomotopyKTheory §4.27; the repair report marks F02 “not actionable in this package” because “supplying that theorem requires its owner’s work”.

   **Witness.** `TauCetiRoadmap/StableHomotopyKTheory/README.md:1640` (§4.18, `kSpace_cofinal_plus`): faithful translations and a cofinal sequence give B(S⁻¹S)≃K₀(S)×BAut(s∞)⁺, with `stableAutomorphism_commutatorPerfect`. `TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md:2570` (§A5.4(1)): determinant one forces every dᵢ=1, so each form is Hᵍ.

   **Why the “not actionable” reason fails.** Both inputs precede this roadmap in the merge order (StableHomotopyKTheory at position 4, AbelianSchemesAndArithmeticModuli at 49, this roadmap at 224), so the alternating instance is a short specialization this package can state itself; the only content the contract adds beyond §4.18 is the hyperbolic cofinality of §A5.4(1) and K₀=ℤ. Conversely StableHomotopyKTheory, at position 4, cannot consume §A5.4 and would have to re-prove the integral symplectic basis theorem to meet the contract, creating a second owner of that object. StableHomotopyKTheory’s README contains no alternating or symplectic content anywhere (searched by object), so §4.27 is the symmetric case only and the contract is not a narrowing of an existing target there. The contract therefore asks for what an earlier roadmap already provides.

   **Exact repair.**
   1. Delete the README paragraph at line 65 and the `classical-symplectic-plus` entry from the plan’s top-level `gaps` (it was added at the package stage; no node references it).
   2. In the StableHomotopyKTheory contract (README:63) add §4.18 `kSpace_cofinal_plus` and `stableAutomorphism_commutatorPerfect`. In the AbelianSchemesAndArithmeticModuli contract (README:107) add §A5.4 `polarizationType` (1), used in the determinant-one case.
   3. Rewrite the first sentence of §1.1 (README:277) as this roadmap’s own instance: the groupoid of finite free unimodular alternating ℤ-forms under orthogonal sum has faithful translations; by §A5.4(1) every object is isometric to Hᵍ, so (Hⁿ) is cofinal and K₀=ℤ by half-rank; §4.18 identifies its group completion with ℤ×BSp∞(ℤ)⁺, naturally for forgetting the form into the core of finite projective ℤ-modules and for the hyperbolic functor P↦P⊕P∨.
   4. Replace “StableHomotopyKTheory §4.27 (gap:classical-symplectic-plus)” at README:297, 327, 611, 656, 992, 1039 and the “classical-symplectic-plus contract” wording at README:91 and 604 by “StableHomotopyKTheory §4.18; AbelianSchemesAndArithmeticModuli §A5.4”. In the scope paragraph (README:11) attribute generic group completion with a cofinal sequence to StableHomotopyKTheory §§4.16–4.18 and keep §4.27 as the symmetric-form comparison. Rerun the dependency check.

   **Repair test.** For H=[[0,1],[−1,0]], §A5.4(1) gives type (1), half-rank 1; H⊥H has K₀ class 2 and automorphism group Sp₄(ℤ); the symmetric J=⟨1⟩⊥⟨−1⟩ has self-pairing 1 at (1,0), so it is not an object and §4.27 correctly plays no role. Both new citations precede position 224, so no UPWARD line can appear.

2. **F02** (P3) The new 691 Check cites the wrong FGV section

   **Location.** `packages/ArithmeticKTheoryPartII/README.md:526`: “(FGV §1.2, p. 2, FGV lines 80–85; §§2.7, 5.3.)”

   **Claim.** FGV §1.2 states that the degree-22 arithmetic kernel at p=691 is nonzero.

   **Witness.** FGV line 65 opens §1.1.1 (Statement of main results) on printed p. 2 and lines 80–85 lie inside it; §1.2 begins at FGV line 124 on p. 3.

   **Exact repair.** Replace “FGV §1.2, p. 2” by “FGV §1.1.1, p. 2”.

   **Repair test.** FGV line 85 names k=6, p=691 as the first nonzero case, inside §1.1.1 on p. 2.

3. **F03** (P3) The FGV manifest entry’s page range omits pages the README cites

   **Location.** `packages/ArithmeticKTheoryPartII/sources.toml:12`: “…Appendix A.1–A.5; printed pp. 7–62; Lemmas 2.3, …”

   **Claim.** All FGV locators of the README lie on printed pp. 7–62.

   **Witness.** README:984 cites FGV p. 1 (FGV line 32); README:526 and 1007 cite p. 2 (FGV lines 43, 80–85); README:21 cites §1.4, pp. 6–7 (FGV line 271 is on p. 6; p. 7 starts at FGV line 282).

   **Exact repair.** The fix worker changes “printed pp. 7–62” to “printed pp. 1–62” in the author’s FGV entry (this review does not edit it).

   **Repair test.** Every FGV page cited in the README then lies in 1–62; the largest is p. 62 (§4.4, Appendix A.5).

Three findings: one P2 (blocking) and two P3. The P2 re-raises the settled round-2 finding F02 with a reason why its "not actionable" label fails. Five of the six round-2 repairs are sound as written; the sixth (F02) removed the false citation but replaced it with a supplier contract that is not minimal.

## Earlier findings, checked first

| Round-2 finding | Status and repaired passage | Verification |
| --- | --- | --- |
| F01 (P2) duplicate integral KSp finiteness | Repaired. README:47: “Consume finite generation, including §3.5’s integral classical ε-symmetric GW finiteness for all n≥0: at O=ℤ and ε=−1 these are KSp_n(ℤ)”. | `TauCetiRoadmap/ArithmeticKTheory/README.md:1332` proves classical ε-symmetric GW finite generation for all n≥0 without inverting 2; `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md:3457` identifies classical GW with the group completion of heart forms; FGV line 911 identifies KSp(ℤ) with classical GW at ε=−1. The standalone target is gone (no “Integral KSp finite type” left); §8.4’s Hurewicz Needs (README:992) and Layer 8 Dependencies cite both suppliers. Over ℤ, 2b(x,x)=0 forces b(x,x)=0, so skew equals alternating. |
| F02 (P1) wrong plus supplier | False citation removed; contract declared identically in README:65 and plan.json (17/17 slugs and texts match, checked by script). The “not actionable” reason fails: R01. | README:11 now calls §4.27 the symmetric-form comparison, correctly. |
| F03 (P2) Bott sign | Repaired. README:27: “Write β_Top for TopologicalKTheory’s generator [O(−1)]−1 on complex-oriented ℂP¹ and put bott=−β_Top.” | `TauCetiRoadmap/TopologicalKTheory/README.md:150` sets β=[L]−1 with L the tautological O(−1); FGV lines 383–397 normalize the cyclic image by pairing +1 with c₁ of the determinant line, and c₁(O(−1)) pairs to −1. Propagated consistently to README:71, 73, 81, 177, 183, 191, 471, 477, 608, 994, 1002 and to the gap text in plan.json; recomputed rows below. |
| F04 (P3) GeneralizedCohomology locators | Repaired. README:71: “G2.5 supplies the suspension/infinite-loop adjunction, G2.8 the Γ-machine and G3.8 Postnikov covers.” | `TauCetiRoadmap/GeneralizedCohomology/README.md:302` (G2 item 5, adjunction), :432 (G2 item 8, Γ-objects), :785 (G3 item 8, Postnikov covers). No “G2.6” remains. |
| F05 (P3) unrealizable mod-5 Check | Repaired. README:525 gives the actual value 2·0=0 at q=5; README:526 adds p=691, k=6. | Minkowski bound 1.6992<2 recomputed; 346·2=692≡1 (mod 691). The new Check’s section locator is R02. |
| F06 (P3) §0.1 API list | Repaired. README:179–184: four prose API bullets (normalization, character naturality, Bott adapter, split polynomial injection for q>4 with the q=3 exception). | Each bullet checked against FGV lines 362–400 (Lemma 2.3 and Remark 2.4); see rows below. |

## Verified sound

Read in full: the README (1050 lines, all 42 target subsections, 9 layers), `Suggested.lean`, `metadata.toml`, `sources.toml`, the plan’s 17 gaps, the round-2 review and the round-3 repair report, and the round-3 diff of README, plan and manifest. Counts: 6 earlier findings checked (5 repaired, 1 re-raised); 15 seeded targets checked at their FGV/Borel locators (14 exact, 1 Check locator wrong: R02); 4 Lean declarations elaborated and compared; 8 one-tactic probes run (none closes); 59 computed adversarial rows; every cited supplier section located at its roadmap, and 9 of them opened and read; 9 pinned declarations opened. For text no repair touched, the round-2 table carries computed values for every section (209 rows), so it is relied on where not recomputed here.

### Sources: seeded sample

All against the cached 64-page FGV author copy and the cached Borel 1974 text.

| Target | Text read | Theorem, page, hypotheses |
| --- | --- | --- |
| 0.4 Cyclotomic transfer descent | FGV lines 667–704 | Proposition 2.15 and Remark 2.16 (p. 15), proof p. 16: odd q, coinvariants, both eigenspaces, inverse-different correction; the proof’s all-t H² descent is the declared full-cover gap. Exact. |
| 0.5 Artin–Bott transfer square | FGV lines 705–760 | §2.8 (p. 16), Proposition 2.17 (p. 17): all k∈ℤ with Bott inversion, k≥1 without; (2.11) arithmetic Artin map. Exact. |
| 1.2 Bott-inverted symplectic K-theory | FGV lines 489–509, 964–1006 | Remark 2.8 (p. 11): Adams map of degree 2pⁿ⁻¹(p−1); §3.6 (p. 22) telescope definition and p-adic groups as limits, no periodicity. Exact. |
| 3.1 CM Bott classes | FGV lines 1294–1325 | §5, (5.1)–(5.3), p. 29: classes β²ᵏ⁻¹⊗[(L,b)]. Exact. |
| 3.2 Hodge type character formula | FGV lines 1366–1400 | Proposition 5.2 (p. 31), (5.6) and the pair-switching argument. Exact; FGV’s “usual Bott element” is the README’s bott. |
| 3.5 CM classes generate | FGV lines 1306–1308, 1447–1483 | Proposition 5.1 (p. 29), §5.3 (pp. 32–33): four classes, factor 2, transfer surjectivity from Proposition 2.17. Theorem exact; the 691 Check’s locator is R02. |
| 4.1 Polarized abelian Γ-groupoid | FGV lines 2729–2772 | Appendix A.4 (p. 59), (A.12) (p. 60): ambient ppav, Rosati-symmetric ℤ^T action, selected factor eA, equivalence to (∐A_g)^(T∖{*}). Exact. |
| 4.2 Rigidified ppav simplicial model | FGV lines 2773–2797 | p. 60: embedding with O(1) restricting to 3Δ*L, (n+1)-tuples of embeddings, polarized isomorphisms of eAᵢ, no compatibility with embeddings; Proposition A.13. Exact. |
| 6.1 Finite arithmetic Galois action | FGV lines 1805–1871 | Lemma 7.7 (pp. 39–40): factorization through Gal(H_q/ℚ), equivariant c_H, trivial kernel action, ⟨c⟩-splitting by ker c_B. Exact. |
| 6.3 Finite universal extension | FGV lines 1668–1693 | Theorem 7.1 (header p. 36, statement p. 37) and Remark 7.2: initial in the sectioned and unsectioned categories. Exact (page range acceptable). |
| 7.2 p-adic universal extension | FGV lines 1968–2021 | §7.4 (p. 43), Theorem 7.8 (pp. 43–44): Γ=Gal(H∞/ℚ), unique ⟨c⟩-splitting, both categories. Exact. |
| 7.3 Local splitting | FGV lines 2022–2114 | §7.5 (p. 44), Lemmas 7.12–7.13 (pp. 45–46): c-fixed compatible prime, D_q≅(ℤ/q)×, relative H₁ comparison of pairs. Exact. |
| 7.5 Bott-inverted universality | FGV lines 2122–2151 | Theorem 7.14 and Remark 7.15 (both p. 46; cited range pp. 46–47 is harmless): every integer k. Exact. |
| 8.1 Integral homology indecomposables | FGV lines 2272–2294 | §8.1, (8.3), Example 8.3 (pp. 49–50). The README keeps the quotient (the source misprints it as the denominator) and restricts to integral finite type. Exact. |
| 8.5 Rational stable Hodge generators | FGV lines 32–45, 2241–2255; borel1974 lines 1154, 1194, 1246–1253 | FGV §1.1 (pp. 1–2), §8 (pp. 48–49); Borel §10.6 (p. 265), Theorem 11.1 (p. 266), §11.4 (p. 267): Sp₂ₙ at a real place gives P({xᵢ, 4i−2}). Exact. |

No locator is flagged unverified by the author. Charney is the settled uncertified entry (below).

### Computed adversarial record

“Retain” means the computed instance agrees; it does not claim an unimplemented theorem is proved.

| Statement | Instances | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: Bott adapter (README:27) | Complex-oriented ℂP¹, u=c₁O(1) | ch₁(β_Top)=c₁O(−1)=−u, pairing −1; ch₁(bott)=+1; FGV requires pairing +1 with c₁ of the determinant line | bott is FGV’s Bott | Retain (F03) |
| Bott powers | m=1,2,3 | bott^m=−β, β², −β³ (β=β_Top); ch_m pairings of bott^m: 1,1,1; of β^m: −1,1,−1 | (−1)^m conversion | Retain |
| Tangent versus dual Hodge sign | Line with Chern root u, m=1,2 | ch₁(L∨)=−u, ch₂(L∨)=u²/2; factor (−1)^m restores u, u²/2 | Independent of the coefficient adapter | Retain |
| §0.1 normalization law | q=5: β, 2β, −β, 0 | Bockstein–Hurewicz values 1, 2, 4, 0 | Only β has value 1 | Retain (F06) |
| §0.1 character law | q=5, a=2; trivial character | 2·bott; positive-degree image 0 | Zero character excluded | Retain |
| §0.1 polynomial law | q=5, q=3 | 5>4 true; 3>4 false | q=3 exception kept | Retain |
| §1.1 alternating plane Check | J=[[0,1],[−1,0]]; diag(1,−1) | vᵀJv=xy−yx=0; (1,0) has self-pairing 1 in diag(1,−1) | Carriers distinct | Retain |
| §1.1 KSp carrier | Groupoid of unimodular alternating ℤ-forms | §A5.4(1): det 1 ⇒ all dᵢ=1 ⇒ form ≅Hᵍ; sₙ=Hⁿ cofinal; Aut(Hᵍ)=Sp₂ᵍ(ℤ); §4.18 ⇒ ℤ×BSp∞(ℤ)⁺ | Composable from earlier suppliers | R01 |
| Half-rank K₀ | 0, H, H⊥H, virtual −H | 0, 1, 2, −1 | ℤ, not ℤ² | Retain value; R01 owner |
| §1.2 v₁ periods | q=3, 5, 25, 27 | 2pⁿ⁻¹(p−1)=4, 8, 40, 36 | Remark 2.8 degrees | Retain |
| §1.2 coefficient compatibility | 25→5 | 40=5·8: common iterate exists; 8 is not a multiple of 40 | No fixed ℤ_p period | Retain |
| §0.4 full-cover gap | q=9, k=2, twist 4=i+1 | Cubes of (ℤ/9)× are {1,8}; kernel {1,4,7}; fixed field K₃ of degree 2 versus 6 | Gap needed | Retain |
| §0.4 small case | q=3, k=1 | Pic(O₃)=0; K₂(ℤ[1/3];ℤ/3)=K₂/3⊕K₁[3]=0⊕0 | 0→0 | Retain |
| §0.5 square | q=3, k=1 | G₃=C₂, c−1=−2 invertible on 𝔽₃(1) ⇒ H₁=0; K₂(ℤ;ℤ/3)=0 | Commutes | Retain |
| §0.5 Artin convention | Frob₂ on μ₅, twist 3 | 2³=8≡3; geometric 2⁻³≡2 | Arithmetic direction | Retain |
| §3.1 degree | k=1, 2, 3 | Exponents 1, 3, 5 ⇒ degrees 2, 6, 10; β^k would give 2, 4, 6 | 2k−1 required | Retain |
| §3.1 Hodge scalar | q=5, k=1, Φ={1,2}, {4,2} | 1+2=3; 4+2=6≡1 | Type-dependent | Retain |
| §3.2 odd i, all types | q=5, i=1; Φ={1,2},{1,3},{4,2},{4,3} | Sums 3, 4, 1, 2, all units | c_H onto | Retain |
| §3.2 supplier coordinate | q=5, Φ={1,2}, i=1 and 3 | i=1: 3·bott=−3β=2β, Chern value 2·(−1)=3; i=3: Σa³=9≡4, supplier coefficient −4≡1 | (−1)^i conversion | Retain (F03) |
| §3.2 even i | q=5, i=2 and 4 | i=2: 0,0,0,0; i=4: 2,2,2,2 but every pair switch changes a⁴−(−a)⁴=0 | Check claims only the switch | Retain |
| §3.5 four classes | [L₁][L₂]=[L][L̄]⁻¹, [L₃][L₄]=1 | K₀: [L₁]+[L₂]−[L₃]−[L₄]=[L]−[L̄]; involution β↦−β gives Betti 2·tr(β²ᵏ⁻¹([L]−1)) (FGV lines 1462–1473) | Factor 2 | Retain |
| §3.5 mod-5 Check | n=4, r₂=2, d=125 | (4/π)²·(24/256)·√125=1.6211·0.09375·11.180=1.6992<2 ⇒ Pic=0; K₂(ℤ)=K₁(ℤ)=ℤ/2 ⇒ K₂(ℤ;ℤ/5)=0 | Betti 2·0=0 | Retain (F05) |
| §3.5 691 Check | p=691, k=6 | Degree 22, m=11, twist 12; B₁₂=−691/2730; ζ(−11)=691/32760; 346·2=692≡1 | Correct; locator wrong | R02 |
| §4.1 Γ maps | T={*,a,b}, dims (1,2) | Fold: 3; b↦*: 1; T={*}: e=0, eA=0, unique arrows | Contractible, not a point | Retain |
| §4.2 Čech degrees | r=0, 1, 2 | Embeddings 1, 2, 3; isomorphisms 0, 1, 2 (FGV line 2779) | r+1 convention | Retain |
| §4.3 Betti model | g=0, 1 | Point; H₁(SL₂(ℤ);ℤ)=ℤ/12; genus monoid ℕ→ℤ | Needs line changes with R01 | R01 |
| §6.1 projectors | q=5 | 1/2=3; (1−c)/2:(t,m)↦(0,m); (1+c)/2:(t,m)↦(t,0) | Unique c-section | Retain |
| §6.1 zero kernel | q=3, k=1 | T=K₂(ℤ;ℤ/3)=0; V≅μ₃, c=−1 | Exact | Retain |
| §6.3 relative H₁ | q=5, k=1 | h(K₅)=1, G₅=C₄, ⟨c⟩=C₂; H₀(C₂;μ₅)=H₁(C₂;μ₅)=0 (c−1=−2 unit); H₁(C₄;μ₅)=0 (generator acts by 2, g−1=1 unit) ⇒ relative H₁=0=K₂(ℤ;ℤ/5) | Kernel matches | Retain |
| §6.3 nonsplitting | q=691, k=6 | Kernel ≠0; id_T≠0_T give two endomorphisms of the initial object | No G-section | Retain |
| §6.3 normalization | q=5 | (1/2)H=3H; c_B(3H(x))=6x=x | Identity Betti projection | Retain |
| §7.2 regular case | p=3, k=1 | K₂(ℤ;ℤ₃)=0 ⇒ KSp₂(ℤ;ℤ₃)=ℤ₃(1) | Zero kernel | Retain |
| §7.3 local pair | q=3 | h(K₃)=1, D₃=G₃=C₂; H₁(C₂,C₂;M)=0=H₁(C₂,⟨c⟩;M) | Comparison holds | Retain |
| §7.3 c-fixed prime | #℘(q)=[H_q:K_q] odd | An involution of an odd set has a fixed point; minus C₃ torsor: 1 of 3 fixed | Existence, not uniqueness | Retain |
| §7.4 locally split | p=3, k=1; p=691, k=6 | Local section = identity; G_𝔭 maps onto ℤ_p× (p totally ramified in ℚ(ζ_p∞)), so contains χ=−1 ⇒ uniqueness; global kernel ≠0 at 691 | Local ≠ global | Retain |
| §7.5 all twists | q=5, k=0 vs 2; k=−1 | Twists −1≡3 (mod 4), degrees −2, 6 differ by 8; k=−1: twist −3≡1, degree −6 | Finite periodicity | Retain |
| §7.6 degree 4k−1 | p=3, k=1, ℓ=2; p=5, k=1, ℓ=2; p=3, k=2, ℓ=2 | ord₉(2)=6 and ord₂₅(2)=20 (generators); ℤ₃/(2²−1)=ℤ/3=K₃(ℤ)₃; 2²−1=3 a 5-unit, K₃(ℤ)₅=0 (48); ℤ₃/(2⁴−1)=ℤ/3=K₇(ℤ)₃ (240) | Restriction iso | Retain |
| §7.6 negative control | p=3, ℓ=19 | 19≡1 (mod 9), ord₉(19)=1; 19²−1=360, v₃=2 ⇒ ℤ/9 versus global ℤ/3 | Generator hypothesis needed | Retain |
| §8.1 RP∞, p=2 | Degrees 1, 3, 5, 7 | (I₁²)_N≠0 iff N is not a power of 2; for r≥2, products in H_*(;ℤ/2ʳ) vanish in degrees 4 and 8 (reductions of integral classes, or i(a)·i(b)=i(a·ρi(b)) with ρi=0); Q≠0 in 1, 3, 7; Q₅=0 since a₂a₄=15a₆=a₆ | Check correct | Retain |
| §8.1 point | X=point | I=0, Q₀=0 | No unit | Retain |
| §8.3 Hurewicz, torsion | E=ΣH(ℤ/3), p=3, i=1, 3, 5 | Q₁=ℤ/3=π₁; Q₃=0=π₃ (y₄=y₂²/2∈I₁², β₁ onto H₃); Q₅=ℤ/3≠π₅=0 at 5=2p−1 | Range needed | Retain |
| §8.3 Hurewicz, free | E=Σ²Hℤ, general odd p | Divided powers: x^[n]=x·x^[n−1]/n, so Q_2n=0 for 2≤n≤p−1; Q_2p=ℤ/p≠π_2p=0 | Theorem holds in range | Retain |
| §8.3 Needs locator | Hℤ and τ≥1 | π₀: ℤ→0; positive groups unchanged | G3.8 covers | Retain (F04) |
| §8.4 finite type | ε=−1 over ℤ | Classical GW^{−1}_n(ℤ) f.g. for all n≥0 (ArithmeticKTheory §3.5) = KSp_n(ℤ) | Imported | Retain (F01) |
| §8.4 stability bound | i=0, 1, 2 | g>2i+5 ⇒ g≥6, 8, 10; H₁(Sp₂ᵍ(ℤ))=0 for g≥3 | Conservative | Retain |
| §8.4 Hurewicz | p=3, i=2 | H₁(Sp∞(ℤ))=0, H₂=ℤ ⇒ Q₂=ℤ₃ (no degree-2 products, no Tor); KSp₂⊗ℤ₃=K₂(ℤ;ℤ₃)⊕ℤ₃=ℤ₃ | Agree | Retain; R01 for Needs |
| §8.4 Hodge pairing, odd m | m=1 | Lift with c_H=bott: ĉh₁ pairing +1, ch₁(ω) pairing −1; lift with β_Top: −1, +1 | Signs consistent | Retain (F03) |
| §8.4 Hodge pairing, even m | p=5, m=2 | 4≤7; KSp₄(ℤ;ℤ₅)=0 (degree ≡0 mod 4) | Pairing 0 | Retain |
| §8.5 Borel generators | Degrees 2, 4, 6, 10 | P(x₂,x₆,x₁₀,…): dimensions 1, 1, 2, 3 (x₂⁵, x₂²x₆, x₁₀) | Degrees 4k−2 | Retain |
| §8.5 weights | χ=2 over ℚ₅ | Untwisted x₂: 1/2; x₂²: 1/4; homology 2, 4 | Inverse in cohomology | Retain |
| §8.6 Bernoulli divisibility | (11) at p=691; d=0; a part 3 at p=3 | s∈691ℤ_(691); s=1 with no Bernoulli factor; ch₃ has denominator 6, v₃=1 | Strict p>n_j needed | Retain |
| Lean `exists_split_prime_with_signs` | q=3; q=5 | q=3: t=±7, 7=(3+ζ₃)(3+ζ̄₃)=9−3+1; q=5: t=4+√5 (6.236, 1.764), tε=(9+5√5)/2 (10.090, −1.090), −t, −tε give all four sign patterns; N(t)=11≡1 (mod 5) splits completely; 5∉(t) | True instances | Retain |
| Same, negative controls | q=3, t=2, 3, 0, 1 | x²+x+1 irreducible mod 2 (inert); ≡(x−1)² mod 3 (P=P̄); t≠0; (1) not prime | Each rejected by a hypothesis | Retain |
| Lean `exists_cm_lines_with_ideal_product` | q=3, L=O | 𝔡=(√−3); δ=1/√−3 has Im=−0.577 ⇒ type {conj}; δ=−1/√−3 ⇒ {id}; B₁=B₂=O, a=1 | Both types | Retain |
| Same, nontrivial class | q=23, Cl=C₃ in the minus part (h⁺=1) | [L̄]=[L]⁻¹ ⇒ target [L][L̄]⁻¹=[L]²≠1; FGV route B₁=x, B₂=LL̄⁻¹x⁻¹ (x x̄=(t)) gives product [L]², scalars δ⁻¹t^(∓1) of equal sign | Nonvacuous | Retain |
| `IsSkewCMLine` controls | ℚ(i), B=ℤ[i] | δ=i/2: (i/2)=(1/2)=𝔡⁻¹, type {id}; δ=i: (i)=O, index 4 in 𝔡⁻¹; δ=0 excluded | Perfection discriminates | Retain |
| `conjugateFractionalIdeal` | ℚ(i): (2+i), (1/2), 0 | (2−i), (1/2), 0; (2+i)(2−i)=(5), identity model gives (3+4i) | Semilinear transport | Retain |
| Gap topological-symplectic-hodge (edited) | m=1, 2 | Requested pairing normalized by bott^m=(−1)^mβ^m: +1 on bott^m | Precise, minimal | Retain |
| Merge order of the repairs | F01, F03 suppliers | ArithmeticKTheory 112, GeometryOfNumbers… 81, TopologicalKTheory (another author’s new-roadmap pull request) — all admissible | No upward edge | Retain |

### Pinned declarations opened

| Declaration (file:line at the pin) | Content and limits |
| --- | --- |
| `NumberField.exists_ideal_in_class_of_norm_le`, `Mathlib/NumberTheory/NumberField/ClassNumber.lean:77` | Nonzero integral representative of each class with absolute norm ≤ M K; local notation at :51 is (4/π)^{r₂}·(n!/nⁿ)·√|d|, as the README states. |
| `NumberField.IsCMField`, `Mathlib/NumberTheory/NumberField/CMField.lean:69`; `complexConj` :141 | Class over CharZero fields; conjugation K≃ₐ[K⁺]K. |
| `NumberField.maximalRealSubfield`, `Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:125` | Subfield of conjugation-fixed elements. |
| `FractionalIdeal.ringEquivOfRingEquiv`, `FractionalIdeal.spanSingleton`, `FractionalIdeal.dual` | Used and elaborated in `Suggested.lean`; dual of the nonzero unit ideal is the inverse different. |
| `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:301` | Field coefficients and finite dimension only; it does not give the integral unimodular statement, which is why R01 cites §A5.4. |
| `TauCeti.NumberFieldArithmetic.artinHomAway`, `TauCeti/NumberTheory/NumberField/Ideal/ArtinMap.lean:181`; `artinHomAway_apply_prime` :218 | Ideal Artin map with arithmetic Frobenius. |
| `TauCeti.SymplecticForm.exists_compatible`, `TauCeti/Geometry/Symplectic/ExistsCompatible.lean:188` | Requires `[FiniteDimensional ℝ V]`; existence only. |

Mathlib has no cyclotomic class-number theorem at this pin (`Mathlib/NumberTheory/Cyclotomic/` has no PID file), so the Minkowski route of the q=5 Check is the right citation.

### Cross-roadmap citations resolved

Main is `8888d45`; open heads are those of the roadmap service index of 2026-10-25T11:18:21Z; pins Mathlib `6b7abb3c`, Tau Ceti `a91d3aaf`. The citation resolver reports nothing found nowhere. Each section cited by the README was located as a heading at the cited roadmap: GeneralAlgebraicKTheory §§7.1, 7.7, 13.8b, 13.8c; SchemeKTheoryOperations §§6.1, 6.9–6.11; ComplexMultiplicationAndExplicitReciprocity §§1.3, 2.1, 2.2; PELModuli M1.5, M1.12, M2.3, M2.4, M2.8, M2.9, M3.9, M6.2, M6.3, M6.9; IntegralIwasawaTheory §§3.1, 7.4, 12.3; KTheoryFiniteLocalFields §§1.1, 1.2; ArithmeticLocallySymmetricSpaces ALS.0.8, ALS.1.5, ALS.1.6, ALS.2.3, ALS.2.4; ArithmeticGaloisDuality R02.1, R02.2, R02.4.3; AbelianSchemesAndArithmeticModuli A5.5, A5.8; StableHomotopyKTheory §§3.20, 3.34, 3.37, 4.18, 4.21–4.27, 5.19, 7.1, 7.3, 7.7, 7.9, 7.13, 7.17, 7.28; GeometryOfNumbersAndQuadraticArithmetic §§6.5, 6.8a, 6.10a, 6.11; HermitianKTheoryOfPoincareCategories Layers 4–6; EtaleHomotopyTypes EH.5, EH.6, G7 (board design); ChromaticHomotopyTheory CH.2, CH.3 (board design); EtaleCohomologyFoundations F.0.2, F.0.3, F.4.0–F.4.6; ClassFieldTheory Layers 11, 13; Chebotarev Layer 10; AlgebraicTopology Stage 6; SymplecticGeometry/CotangentLagrangian C2.0. Content was read for the repaired citations: ArithmeticKTheory §3.5 (:1213, :1332) and §6.11 `cyclotomicH2Descent` (:2728); GeometryOfNumbersAndQuadraticArithmetic §6.8a (:3342, :3457); StableHomotopyKTheory §§4.18 (:1640), 4.27 (:1757); AbelianSchemesAndArithmeticModuli §A5.4 (:2570); TopologicalKTheory Conventions (:150); GeneralizedCohomology G2.5, G2.8, G3.8 and G5 (“chosen degree2 Bott class … agreement with TopK”, :1654); ClassFieldTheory Layer 13 names `hilbertClassField`, `narrowHilbertClassField`, `gal_hilbertClassField_equiv_classGroup` (:1827–1832).

### Ownership and duplication

Searched by object over main, all open roadmap pull requests at their heads and the board packages (including the sibling checkouts the brief lists): Feng–Galatius–Venkatesh objects, symplectic K-theory and KSp(ℤ), alternating/symplectic group completion and BSp∞, integral symplectic homological stability, integral indecomposables, universal Galois extensions, Bernoulli divisibility of Hodge numbers. ArithmeticKTheory cites FGV only for Bott-inverted cyclotomic tables it owns and this roadmap imports; EllipticKTheory’s “indecomposable” is the field K₃ notion; StableHomotopyKTheoryPartII and GeneralAlgebraicKTheoryPartII (board designs) own Segal/Steenrod and telescopic purity, with no overlap. No other owner of the arithmetic action, CM Bott classes, the universal-extension theorems, the ppav Γ-model, the integral indecomposable Hurewicz theorem or the family divisibility theorem was found; this roadmap owns them. The one ownership defect found is R01. No fully qualified name of `Suggested.lean` occurs in another readable roadmap.

### Gaps

All 17 slugs match between README and plan, each with a named earlier supplier; none is `none`. The 16 carried over were checked as minimal and precise in round 2 with computed rows, and their texts are unchanged except the sign clause added to topological-symplectic-hodge (precise and still minimal). The new classical-symplectic-plus is not minimal: R01. No design-plan gap lacks a supplier.

### Supplier order

The required command returned exit 0 with exactly:

```text
depcheck: 51 roadmaps, 597 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. This roadmap is at merge-order position 224, after ChromaticHomotopyTheory (223). Every `*Needs:*` line touched by the repairs was read; the Layer 8 dependencies now list GeneralizedCohomology G3.8, ArithmeticKTheory §3.5 and GeometryOfNumbersAndQuadraticArithmetic §6.8a.

### Lean acceptance test

`lake env lean` on `packages/ArithmeticKTheoryPartII/Suggested.lean`, run from the pinned content checkout, exited 0; the only messages are “declaration uses `sorry`” at 52:8 and 95:8. No `TauCeti.*` import is used, so no targeted build was needed. A scratch copy with `#check @` for all four declarations exited 0: every binder (p, n, primality, p≠2, 0<n, field, number field, cyclotomic and CM instances, sign function, Φ with its exactly-one-per-pair hypothesis, L≠0) is retained, and each elaborated type equals the README statement at §§2.3–2.4; no binder repair is needed. One-tactic probes on a scratch copy (`simp`, `rfl`, `infer_instance`, and `exact?` on a copy without sibling sorries) failed on both theorems: 8 of 8 attempts leave the goal open. No padding.

Headline inventory: §2.3 and §2.4 are stated; the docstring names, with their missing carriers, the Picard–Bott and Artin comparisons (§§0.3–0.5), Betti–Hodge splitting, CM generation and K(1) comparison (§§3.4–3.6), the coherent action and finite-genus detection (§§4.4–4.5), CM reciprocity (§5.1), the universal relative extension (§5.4), the four universality theorems (§§6.3, 7.2, 7.4, 7.5), degree 4k−1 triviality (§7.6), the Vandiver criterion (§7.7), the indecomposable and Hurewicz theorems (§§8.2–8.3), the stable comparisons (§§8.4–8.5) and Bernoulli divisibility (§8.6). Each lacks a carrier at the pins (higher and Bott-inverted K-theory, KSp, ppav moduli realization, relative group homology with its extension category, Pontryagin/Bockstein homology quotients, abelian schemes). Integral Sp₂ᵍ(ℤ) stability is statable but is a supporting target, not a headline. The file has one `import Mathlib`, one namespace, a Layer 2 section comment, a docstring on every declaration, two theorems and two real-body definitions, and no `set_option`, `lemma`, sorry’d data, admitted example, `#eval`, `#synth` or `#print`.

### Shape and policy

Nine layers, each ending with Examples and Dependencies; opening summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Downstream consumers and References present. No LaTeX delimiters, fenced blocks, process words, pull-request numbers or machine paths in the package files. Every backticked Lean name of this roadmap’s own is declared in `Suggested.lean`.

## Not verifiable

- `charney1987`, Corollary 4.5: settled as uncertified (paywalled) in the manifest; not requested again. FGV quotes its range as g≥2i+5 (FGV line 32) and as i<(g−5)/2 (FGV line 2236); the README uses the common strict range g>2i+5. Which endpoint Charney proves cannot be checked without the text.
- The FGV author copy was not collated against the published pagination; all locators refer to the author copy, as the manifest’s version note says.
- The citation resolver did not check Lean names outside TauCetiRoadmap (no pinned Lake packages on its host); those names were checked directly in the pinned Mathlib and Tau Ceti sources above.

## Source issues

- **Misprint** in FGV at the proof of Corollary 2.12, p. 14, FGV line 628: the source says Bott multiplication lands in H² with twist 2k−1; it should be twist 2k; affects the proof.
- **Misprint** in FGV at Remark 2.13, p. 15, FGV line 645: the source says finite-coefficient K₀ splits as ℤ plus the Picard group; it should be ℤ/q plus Pic/q; affects nothing.
- **Misprint** in FGV at Lemma 4.8, p. 28, FGV line 1264: the source calls S the real embeddings of the cyclotomic integers; it should be the real embeddings of the real subring O_q⁺, the CM field having none; affects nothing.
- **Error** in FGV at §5.1.2, p. 30, FGV line 1353: the source says the automorphism group of a CM line is μ_q; it should be the norm-one units μ_(2q), containing μ_q; affects nothing.
- **Gap** in FGV at the proof of Proposition 6.1, p. 34, FGV line 1536: the source maps the CM groupoid directly to genus φ(q); it should stabilize from genus φ(q)/2 by a rational ppav of the complementary genus; affects the proof.
- **Misprint** in FGV at Definition 7.3, p. 37, FGV line 1699: the source says the section composed after the projection is the identity of M; it should be π∘s=id_M; affects nothing.
- **Misprint** in FGV at §7.3, p. 41, FGV line 1903: the source says the line class carries Bott exponent k−1; it should be 2k−1, as in the adjacent display; affects nothing.
- **Misprint** in FGV at §7.5, p. 44, FGV line 2025: the source’s definition of G drops the word outside and says extension for group; it should be the Galois group of the maximal extension of ℚ unramified outside p; affects nothing.
- **Misprint** in FGV at Remark 7.9, p. 44, FGV line 2037: the source says Vandiver is equivalent to the whole prime set being a singleton; it should be the conjugation-fixed prime set; affects nothing.
- **Misprint** in FGV at §7.7, p. 47, FGV line 2171: the source cites Theorem 3.3 for injectivity of the Betti map; it should be Theorem 3.5; affects nothing.
- **Misprint** in FGV at §7.7, footnote 13, p. 47, FGV line 2193: the source says the twist-2k action is via the (2k−1)st cyclotomic power; it should be the 2k-th power; affects nothing.
- **Gap** in FGV at Theorem 8.1, p. 48, FGV line 2218: the source allows p≥max nⱼ; the integrality argument needs p>max nⱼ, since nⱼ=p puts p in nⱼ!; affects a stated result.
- **Error** in FGV at §8.1 and Theorem 8.4, pp. 49–50, FGV line 2274: the source asserts the Hurewicz comparison for any connected p-complete spectrum with ordinary ℤ_p homology; it fails for discrete ℤ_p, so finite integral type (or completed homology) is needed; affects a stated result.
- **Misprint** in FGV at §8.1, p. 49, FGV line 2278: the source calls the indecomposables the subgroup I²+Σβ_k(I_k²); it should be the quotient of I by it; affects nothing.
- **Misprint** in FGV at the proof of Theorem 8.4, p. 50, FGV line 2304: the source gives the cyclic model differential ∂y=x; it should be ∂y=p^k x, else the homology vanishes; affects the proof.
- **Gap** in FGV at the proof of Theorem 8.4, p. 50, FGV lines 2312–2316: the source splits the truncation through degree 2p−2; the delooping argument only gives 2p−3, the P¹ k-invariant reaching degree 2p−2; affects the proof.
- **Misprint** in FGV at Appendix A.4, p. 59, FGV line 2747: the source says the Rosati involution is defined by φ; it should be defined by the polarization; affects nothing.
- **Misprint** in FGV at Appendix A.4, p. 60, FGV lines 2776–2777: the source calls the unbounded parameter space quasi-projective; it is a disjoint union of quasi-projective pieces indexed by genus and embedding data; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "67fa31c", "job": "REV-PKG-ArithmeticKTheoryPartII~3", "model": "opus", "worker": "fable-rev115"} -->
