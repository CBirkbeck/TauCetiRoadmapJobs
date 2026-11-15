# Review of CharacteristicClasses (pull request #1807 at 89357f3)

**Verdict:** needs changes

Full review. The previous review this round was given (of 35d5208) had no finding, so there is nothing to mark repaired. Two findings, both P3, both about locators of sampled targets.

## R01 (P3) — C5.2's only locator is a whole chapter

**Location.** `TauCetiRoadmap/CharacteristicClasses/README.md:2342–2343` (C5.2): "The Chevalley/torus square then proves both universal Chern–Weil and Borel `H*(BG;R)≃H*(BT;R)^W`. This is the proof spine of Dupont1978 §8."

**Claim.** The target states the torus isomorphism, injectivity of restriction and Borel's theorem, and cites a chapter under a key ("Dupont1978") that the roadmap uses nowhere else; no theorem number and no page.

**Witness.** `dupont-ccc` line 3514 (Theorem 8.1, printed p. 114), line 3713 (torus case, from Proposition 8.20, p. 120), line 3781 (proof for connected G, p. 123), line 3989 (Corollary 8.35, Borel, p. 130).

**Repair.** Replace the last sentence by: "(Dupont, *Curvature and Characteristic Classes*, Theorem 8.1, p. 114: the torus case from Proposition 8.20, p. 120, and the restriction and fibre-integration argument for connected G on pp. 123–129; Corollary 8.35, p. 130, for Borel's theorem)". Add "Corollary 8.35, p. 130" to the References entry.

## R02 (P3) — C1.2b and C5.4 state theorems with no locator at the claim

**Location.**
- `README.md:870–874` (C1.2b): "Own Milnor's weak-equivalence theorem for this actual counit using the adjunction triangle Sing(ε_X)∘η_(Sing X)=id."
- `README.md:906–909` (C1.2b): "Own the Čech/singular comparison on CW type … for every paracompact Hausdorff X of CW type and constant abelian coefficient group A".
- `README.md:2366–2367` (C5.4): "The determinant-component calculation gives, for all n≥0, `H*(BO(n);Q)=Q[p₁,…,p_floor(n/2)]`."

**Claim.** Neither section cites a source in its text. The References entry for May names the counit theorem but no section points to it, and C5.4's BO(n) ring has no citation anywhere.

**Witness.** `may-concise` line 5287 (Chapter 16 §2, printed p. 124: the map from the realization of the total singular complex to X is a weak equivalence). `hatcher-vbkt` lines 3682–3683 (Theorem 3.16(a), printed p. 95).

**Repair.**
- C1.2b, after "…give the counit weak equivalence.": add "(May, *A Concise Course in Algebraic Topology*, Chapter 16 §2, p. 124, with the proof outlined in §3, pp. 125–126)".
- C1.2b, Čech/singular comparison: add a locator for the comparison on paracompact Hausdorff spaces of CW type. None of the cached texts states it, so I propose none.
- C5.4, after the BO(n) formula: add "(Hatcher, *Vector Bundles and K-Theory*, Theorem 3.16(a), p. 95: all torsion of H*(G_n;ℤ) has order 2 and the quotient is ℤ[p₁,…,p_k] for n=2k or 2k+1)".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| C2.1 `existsUnique_singularCohomology_thomPair_fiber` | base a point; rank 0 on two components with opposite signs; empty base; two trivializations with the same sign | ω: g, −ω: −g; (g,−g), not constant; H(∅)=0, unique; they differ by GL⁺(F), connected, trivial on Hⁿ(F,F∖0) | holds | none |
| C2.1 `exists_isThomClass_of_orientation` | Möbius line, ℤ; compact base | no orientation exists, hypothesis empty; pinned `exists_isThomClass` (`Orientation/ThomClass.lean:186`) is the compact case only | holds, not at the pin | none |
| C2.2 `eulerClass_eq_zero_iff_exists_ne_zero` | TS²; S²×ℝ²; su(F) on S⁴ (rank 3, dim 4); oriented rank 2 on S¹ | e=2≠0, no section; e=0, section; e=0 and no section, excluded by the bound; H²(S¹)=0, trivial bundle | holds; bound needed | none |
| C2.3 `eval_eulerClass_tangent_eq_eulerChar` | S², T², S³; orientation reversed | 2, 0, 0; u↦−u and [M]↦−[M], pairing unchanged | holds | none |
| C2.4a `exists_isSmoothEmbedding_mapFundamentalClass_eq` | m=0,c=1: S¹, x=−3; m=0,c=2: surface; M=∅; RP³, c=2, torsion x; x=0 | three points of sign −1; signed points; N=∅; an embedded circle, H₁=ℤ/2; N=∅ | holds | none |
| C2.4a finite stages and bordism sign | dim M=m, CP^r; M×I; c=1,2 product bordism | CP^r is the (2r+1)-skeleton: 2r≥m suffices; 2r′≥m+1 suffices; (νN,∂_t,T∂W)=(−1)^c(∂_t,νN,T∂W), so ∂=N₁−N₀ after the factor | holds | none |
| C7.3a `not_exists_isImmersion_realProjectiveSpace` | k=1, 2 | RP²: w̄=1+a, w̄₁≠0, normal rank 0; RP⁴: w̄=1+a+a²+a³, w̄₃≠0, normal rank 2; 2^(k+1)−2≥2, no truncation | holds | none |
| C1.2b Checks | one-set cover; Warsaw circle; closed sine curve | d⁰=1−1=0, d¹=1−1+1=1: H⁰=ℤ, H¹=0; Čech H¹=ℤ, singular 0; Čech H⁰=ℤ, singular ℤ² | hold | R02 |
| C1.3 stable range | U(1), m=3; ℤ/2⊂U(1) | E_m is 2(m−N)-connected: bound gives d≤3, true range d≤5 on CP²; RP^(2m−1), iso for d≤2m−1 | sufficient, not sharp, as stated | none |
| C1.4 | Müller–Wockel I.13, II.11, II.12 | finite-dimensional K over a manifold with corners; extension from a neighbourhood of closed C; equivalences agreeing near C | supports the statement | none |
| C1.6 | CW type; Warsaw circle | Hatcher Prop. 3.10: isomorphism when X has CW type; Čech H¹≠singular H¹ off CW type | holds with its hypothesis | none |
| C3.1 | Hatcher 4D.1 hypotheses; RP¹-bundle with a over 𝔽₂ | Hⁿ(F;R) finitely generated free, classes restricting to a basis; basis 1,a | matches the source | none |
| C3.4 | BO(n), BU(n), BSO(n) mod 2; n=1 | Thm 3.9; Prop. 3.12: kernel (w₁), so 𝔽₂[w₂,…,w_n]; BSO(1): 𝔽₂ | holds | none |
| C3.6 | r=1; r=0; R=ℤ[1/2] | BSO(2): R[e], p₁=e²; BSO(1): R; Hatcher 3.16 proof computes R=ℤ[1/2], free, so base change to R with 2 a unit | holds | none |
| C5.2 | SU(2); T | Euler integral of S² is 2=\|W\|; fibre a point, 1 | holds | R01 |
| C5.4 | O(2); n=0,1 | ℤ/2 sends e↦−e: ℚ[e]^(ℤ/2)=ℚ[e²]=ℚ[p₁]; ℚ, floor(n/2)=0 | holds | R02 |
| C5.5 | Dupont Cor. 8.37(i), (7.39) | line 4028 on PDF p. 139, printed 131; line 3441 on PDF p. 119, printed 111 | locators right | none |
| C6.1 Checks | TCP¹, TCP²; both roots ±x | Td₁=h; L₁=3h²/3=h², Â₁=−3h²/24=−h²/8; L(x)L(−x)=L², L₁ doubles to 2p₁/3 | hold | none |
| C6.3 Checks | point; S²; S¹; endpoint sign | ℚ·v^(−n/2), n even; H⁰⊕H²v=ℚ², Hper¹=0; H¹v=ℚ; (−v⁻¹)(−U_R v)=U_R | hold | none |
| C6.4 | rank 1, both conventions; rank 0 | (1−eˣ)/x=−1−x/2−x²/6=−eˣ(1−e⁻ˣ)/x; (1−e⁻ˣ)/x=1−x/2+x²/6; 1 | holds | none |
| C7.2 | r=1; r=2; k=1 | e^(x/2)−e^(−x/2), exterior model negative; four terms equal the product, sign +; 2+x²/6 against 1+x²/3: degree-4 parts both (x₁²+x₂²)/3 | holds | none |
| C7.1 (not sampled, recomputed) | q₃; CP⁶; HP³ | 64·(1/42)/720=2/945; coefficients 2, −13, 62 over 945; (2170−1911+686)/945=1; (496−624+128)/945=0 | holds | none |
| C7.6 | constant map S³→S² | fibre S³, H₃=ℤ; also not a Serre fibration | Check true | none |

- Source locators checked against the text: 21 in 8 sources. `thom1954` lines 538, 1056–1064, 1305–1318, 1499–1502, 1513–1515 (printed page = PDF page + 15: pp. 29, 43, 50, 55). `hatcher-vbkt` lines 3285, 3359, 3504, 3681, 4266 (printed = PDF − 4). `hatcher-at` line 18645 (p. 432). `mueller-wockel-smoothing` lines 225, 461, 686. `dupont-ccc` lines 3441, 3514, 3848–3859, 3989, 4028. `landweber-k-theory-elliptic` lines 600–629. `atiyah-hirzebruch-rr-1959` lines 194–200 (p. 281). `may-concise` line 5287.
- Pinned declarations located at the pin: 73 by name. Among them `TauCeti.HomologicalOrientation` (`Singular/LocalHomology/Orientation/Homological.lean:75`), `fundamentalClass` (`LocalHomology/FundamentalClass.lean:204`, integral, compact), `mapFundamentalClass` (`:275`), `Manifold.IsSmoothEmbedding` (Mathlib `Geometry/Manifold/SmoothEmbedding.lean:70`), `onePointEquivSphereOfFinrankEq` (Mathlib `Topology/Compactification/OnePoint/Sphere.lean:34`). The pin has no mod 2 fundamental class, no relative cup, no Chern class and no infinite Grassmannian, as the module docstring says.
- Remark, no change asked: the pin is Tau Ceti 2fd255d. The folder's generated `PROGRESS.md` reports an arbitrary-base `VectorBundleOrientation.thomClass` in Tau Ceti after that commit; at the pin C2.1's two statements are not proved.
- Cross-roadmap citations resolved: 24. At this head: AlgebraicTopology 4.5 (cellular approximation, `:1638`), 6.4, 8.7 (the dimension-m structure, `:4204–4208`), 8.12, 8.13 (`:4989`), 8.16 (`:5254`); ComplexKahlerGeometry K7.1 (`:2755–2805`); TopologicalKTheory T1.5a, T1.6a, T5 item 5, T6.4. On main: LieGroups Layer 5A and Layer 7 (`:892`, finite faithful representations), SchubertGeometry S9.6, LieGroupoidsPoisson G1.3a, TopologicalSheafCohomology TS1.1–TS1.2, SmoothBundlesConnections B1.4 and B6.0, DifferentialGeometry 10.2, GeometricTopology 1.5 and 11.3, and the consumers MorseNovikov N6, AffineMorseLefschetz A4.0, SpinGeometry G4.3. All 15 supplier folders are on main. The labels C1.0–C7.AdjointHopfObstruction of main are all kept.
- Gate: the worker's gate at 89357f3 passes every check, `build=0` included. The dependency check prints `depcheck: 245 roadmaps, 2263 edges, 0 problem(s)`. `git diff --stat origin/main...HEAD` outside the 13 listed folders is empty.
- Lean: `lake env lean` on `Suggested.lean` gives six `declaration uses sorry` warnings (lines 161, 185, 201, 225, 257, 281) and nothing else. The elaborated types in `signatures.md` agree with the README statements of C2.1, C2.2, C2.3, C2.4a and C7.3a; no binder is lost. One-tactic probe on a scratch copy (`first | rfl | infer_instance | simp | exact` the pinned compact-base lemma): all six fail. No padding.
- Headlines: stated are C2.1 (two), C2.2, C2.3, C2.4a integral, C7.3a. Named as not statable: C2.4a mod 2, the Thom isomorphism, the Gysin sequence, C3.4/C3.6, C5.2, C4.2, C5a.1, C5a.5 (two), C6.3–C6.5. The description's CharacteristicClasses paragraph and its summary block agree with the head: the six dropped declarations, the five stated headlines, the dropped suppliers HomotopySpheres, GeneralizedCohomology and DGFloer.
- Overlap check: read TopologicalKTheory, AlgebraicTopology, GeneralizedCohomology, DGFloerPartII and SmoothBundlesConnections (open) and AlgebraicTopology, TangentialBordism and TopologicalKTheory (main); the third list is empty. Leray–Hirsch: ordinary here (C3.1), generalized in GeneralizedCohomology G4.1, which cites C2.1. Embedded representatives in codimensions one and two: owner C2.4a; AlgebraicTopology 8.13 owns only the transversality targets and says so; AlgebraicTopologyPartII 12.2 (#1694) is a relative surface variant with its own source. #1808 changes this folder after this pull request, as the merge-order block states.
- Source independence: 21 passages compared with 8 sources, none shared; largest share `dupont-ccc`, 13 of 75 locators; contents compared with `dupont-ccc` (nine chapters, forms to flat bundles): independent, since C2, C3, C6 and C7 have no counterpart there and C1 precedes the curvature layers by the dependency lines of C4.3 on C1.3–C1.4.

## Not verifiable

- C2.3 (Milnor–Stasheff, Corollary 11.12), C2.1 (Theorem 10.4), C2.2 and C3.4a (§12), C3.3 (Theorem 15.3), C3.6 (§15): uncertified, cited by locator, not read.
- C2.4 and C2.5 (Bott–Tu §6), C2.3a (Milnor, *Topology from the Differentiable Viewpoint*, §6), C1.1b (Milnor, *Universal Bundles, II*, §§2–3): uncertified, not read.
- C1.2b's Čech/singular comparison: no cached text states it (see R02).
- No README locator is flagged as unverified.

## Source issues

- **Error** in landweber-k-theory-elliptic at §1.7, p. 14: the source says the correction factor equals (−1)^n td(E)^−1; it should be (−1)^n exp(c₁(E)) td(E)^−1, which equals its own roots formula ∏(1−e^(x_i))/x_i; affects a stated result.

## For the human reviewers

- **Licence.** `zentner-instanton-sheet2` is an unpublished course exercise sheet on an author's page, cited once for the formula p₁(su(F))=c₁²−4c₂ (`README.md:3277–3278`); the roadmap proves the formula itself.
- **Licence.** `hatcher-vbkt` is an unpublished book draft (version 2.2) on the author's page; it carries 9 of the 75 locators, with page numbers of that version.
