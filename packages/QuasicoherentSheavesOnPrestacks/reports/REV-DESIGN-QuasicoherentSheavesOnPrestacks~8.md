<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16366#issuecomment-6896503519 -->
Review (claude) of a589c3c

Verdict: needs_changes

1. **F01** (P3) 6.3 states two agreements that rest on 7.2 and 7.3

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:655` and the *Needs* at line 666; Layer 6 Dependencies at line 689; `design/plan.json`, target 6.3. Quote: "by 7.2 the stack's `QCoh` is the limit over the bar construction of its action" and "On the lattice quotient of 7.3, the perfect and locally free objects are those of HabiroCohomologyFoundations §1.28."

   **Claim:** 6.3 needs only 1.4, 1.5, 3.3, 5.3 and 6.1 of this roadmap, and its README and plan dependencies agree.

   **Witness:** Both sentences use Layer 7 targets, which are in neither the *Needs* nor the plan's prerequisites of 6.3. Adding them would close a cycle: 7.4 needs 6.2 and Layer 7 depends on Layers 2–6. The plan lists `HabiroCohomologyFoundations §1.28` for 6.3; the README *Needs* and the Layer 6 Dependencies do not.

   **Exact repair:** Move the two agreements to the targets that own the quotients.

   - In 6.3, delete the sentence on the derived parameter stacks and the sentence on the lattice quotient. Remove "§1.8 (…, for the agreement only)" from its *Needs*, change "§§1.7–1.8" to "§1.7" in the Layer 6 Dependencies, and remove `LanglandsParameterStacks §1.8` and `HabiroCohomologyFoundations §1.28` from the plan's 6.3 prerequisites and statement.
   - In 7.2, after the agreement sentence, add: "Its perfect objects (6.3) are §1.8's chartwise dualizable objects: by 1.5 an object of the limit is dualizable exactly when its pullback to the chart is, every other term being a pullback of the chart's." Add 1.5 and 6.3 to the *Needs* of 7.2 and to the plan.
   - In 7.3, write "its heart, vector bundles and perfect complexes (6.2(a), 6.3) are those of its §1.28", and add 6.2 and 6.3 to the *Needs* and to the plan.

   Tested: 7.2 then needs 1.5, 2.3, 3.3, 6.3, 7.1 and 6.3 needs 1.4, 1.5, 3.3, 5.3, 6.1, none in Layer 7, so no cycle. On §1.8's own Check, the free translation quotient of Ĥ over Λ: the limit is `Mod_Λ` and its dualizable objects are `Perf(Λ)`, as §1.8 records.

2. **F02** (P3) the universe of `Ĉat∞` is not fixed

   **Location:** `packages/QuasicoherentSheavesOnPrestacks/design/README.md:54`. Quote: "`Ĉat∞` is the ∞-category of locally (u+1)-small ∞-categories."

   **Claim:** This fixes the target of `QCoh : PreStk_T^op → CAlg(Ĉat∞)`.

   **Witness:** `PreStk_T = Fun(T, Ŝ)` is locally (u+1)-small but its objects form a set of the universe u+2, so the class named has no universe level. `Mod_ℤ` and every `QCoh(X)` are (u+1)-small: a limit over the (u+1)-small `Pts(X)` of (u+1)-small ∞-categories.

   **Exact repair:** "`Ĉat∞` is the ∞-category of (u+1)-small ∞-categories, EnhancedDerivedSheaves' `Cat∞` in the universe u+1. Every `Mod_A` is (u+1)-small and so is every `QCoh(X)`, a limit indexed by the (u+1)-small `Pts(X)`." Tested on the witness: `Mod_ℤ` and `QCoh(BΓ × Spec k)` are objects; `PreStk_T` is not, and nothing in the design needs it to be.

All five round-7 findings are repaired. This round finds no P1 or P2 and two P3 findings, R01 and R02. Each comes with a repair to apply, so the verdict asks for changes although neither is blocking. Nothing else stands in the way of acceptance; the design rests on the two declared supplier gaps, `gap:chevalley-quasiprojective-quotient` (ReductiveGroups Layer 3) and `gap:twist-quasiprojective` (SchemeAndStackFoundations §1.16). No maintainer notes were supplied. The design, the plan and the manifest were not changed by this review.

## Verified sound

### Round-7 findings

| Finding | Status | Repaired passage, and what I checked |
| --- | --- | --- |
| F01 (P1) twists as schemes | repaired | 8.4, line 831: "By gap:twist-quasiprojective, `P ×^G X` is a scheme, flat and quasi-projective over R, on which the module descended from L is ample." Same slug in the README (line 135) and the plan. SGA1 line 6972 (Exposé VIII, Proposition 7.8, PDF page 190, printed 174) has the hypotheses restated: faithfully flat quasi-compact base map, quasi-compact schemes, a relatively ample invertible module with compatible descent datum. |
| F02 (P2) LanglandsParameterStacks §1.8 | repaired | Scope line 11: "§1.8 owns the enhanced `QCoh` and `Perf` of its derived parameter stacks". §1.8 read at its head (heading at line 390 of its README): totalization over the action-groupoid nerve, chartwise dualizability, and the two Checks the README quotes. The repair left a build-order slip in 6.3 (R01). |
| F03 (P3) Layer 4 in *Needs* | repaired | 6.2, 7.1 and 8.2 list 4.1; 7.4 lists 4.1 and 4.2; Layer 7 Dependencies read "Layers 2–6". Plan prerequisites agree (script comparison of all 33 targets: the only difference is R01's). |
| F04 (P3) pinned embedding theorem | repaired | "From Tau Ceti" cites `TauCeti.AffineGroupSchemeCat.exists_isClosedImmersion_generalLinear`; opened at TauCeti/Algebra/AlgebraicGroup/Representation/Embedding.lean:212: a field k, `LocallyOfFiniteType`, one universe, conclusion `IsClosedImmersion`. |
| F05 (P3) products and colimits | repaired | 1.1, line 206: "It also preserves finite products, which are limits and do not follow from this". 2.4, line 384, argues the final prestack through `u_! Spec ℤ ≃ Spec u(ℤ)`. |

No finding of the repair report is marked "not actionable", so nothing is re-raised. The repaired patterns were searched in the rest of the design: no other "colimits, in particular (a limit)" clause; no other route step that needs a twist to be a scheme; the forward-reference pattern of R01 occurs only in 6.3.

### Adversarial pass

Values recomputed by hand. The table covers the fifteen sampled targets, the headline theorems, every passage the repair changed and both findings.

| Statement | Instances tried | Values computed | Result |
| --- | --- | --- | --- |
| Conventions, universes | `Mod_ℤ`; `QCoh(X)`; `PreStk_T` | objects of `Mod_ℤ`: a set in u+1; limit over (u+1)-small `Pts(X)`: (u+1)-small; objects of `PreStk_T`: size u+2 | wording loose (R02) |
| 1.1 θ and products | `ℤ × ℤ`; empty product; free object on one generator | `π₀ = ℤ²`; coproduct `ℤ ⊗ᴸ ℤ = ℤ`; zero ring final; `H₁(Σ₂; ℤ) = ℤ/2` | sound |
| 1.2 base change, projection | `ℤ → 𝔽_p` squared; `R → R[t]`, `M = R[1]`; `A × B` | both sides `π₀ = π₁ = 𝔽_p`, ordinary square gives `π₁ = 0`; `R[t][1]`; idempotents split `Mod` | sound |
| 1.3 t-structure, flatness | `𝔽_p ⊗ᴸ 𝔽_p`; `ℤ → ℤ[1/p] × ℤ_p`; `ℤ → ℚ`; `ℤ → 𝔽_p` | heart `ModuleCat 𝔽_p`, unit has `π₁ = 𝔽_p`; (p) under `pℤ_p`, (0) under (0); `ℚ ⊗ ℤ/p = 0`; `π₁ = 𝔽_p` after base change | sound |
| 1.4 perfect, almost perfect | k over `k[ε]/ε²`; k over `k[x₁, …]`; `ℤ/p`; `ℤ ⊕ ℤ[3]` | `Tor_i = k` all i; maximal ideal not finitely generated; dual `ℤ/p[−1]`; dual `ℤ ⊕ ℤ[−3]` | sound |
| 1.5 descent criterion | identity augmentation; `ℤ → 𝔽_p`; converse direction | constant diagram; kills ℚ; under Beck–Chevalley the projection `lim → C⁰` is comonadic, so "exactly when" holds | sound |
| 2.1 points | `Spec 0`; ∅; BΓ | value at 0: `∗` against ∅; `π₁ = Γ` | sound |
| 2.2 `QCoh` | ∅; `Spec A ⊔ Spec B`; `B(ℤ/2) × Spec 𝔽₂` | zero category; `Mod_A × Mod_B`; `H¹ = 𝔽₂` while each evaluation lies in `π₋₁A = 0` | sound |
| 2.4 change of test rings | `Spec R`; ∅; `Spec ℤ`; `Y = Spec(𝔽_p ⊗ᴸ 𝔽_p)` | `Spec u(R)`; ∅; `u(ℤ)` initial; `ι^*Y = Spec 𝔽_p`, unit loses `π₁` | sound |
| 3.2 flat hyperdescent (headline) | `A → A`; `ℤ → ℤ[1/2] × ℤ[1/3]`; `ℤ → 𝔽_p`; n-truncated connective totalization | constant Tot; fibre `ℤ[1/6][−1]`, `Ext² = 0`, `Hom(ℤ[1/2], ℤ) = 0` so index 2; kills ℚ; `π_k` for `k ≥ 0` needs finitely many stages | sound |
| 3.2 in `CRing`, hypercovers | latching object of a flat hypercover | built by pushouts along flat latching maps, so ordinary and derived colimits agree | sound |
| 3.4 Zariski gluing | doubled plane; ∅; `ℙ¹` | fibre `{U, U′}`, contractible over `D(x)`, `D(y)`; `h_∅ = Spec 0`; cokernel `k·t⁻¹` | sound |
| 4.2 pushforward (headline) | `Spec R[t] → Spec R`; classical `Spec 𝔽_p → Spec ℤ` twice | `R[t]`, base change `R′[t]`; pointwise formula gives `𝔽_p`, true value `𝔽_p ⊗ᴸ 𝔽_p` | sound; flatness needed classically |
| 5.1 affine comparison | `ℤ/2` on `Spec ℤ`; `ℤ → 𝔽_p` | support (2); cohomology `𝔽_p` in degrees 0, −1 | sound |
| 5.2 Zariski descent | tower `τ^{≥−m}K`; `j_!O` on a DVR | `H^q` constant for `q ≥ −m`; stalks K and 0, not quasi-coherent | sound |
| 5.3 (headline) | `⨿_ℕ Spec ℤ`; `ℙ¹` | `∏ D∞(ℤ)` both sides; `H¹(O(−2)) = k` | sound |
| 6.2 t-structure (headline) | `Spec A`; `BG_m`/ℤ; `𝔽_p` on `Spec ℤ` | `ModuleCat(π₀A)`; graded abelian groups; pullback gains `π₁` | sound; SAG line 26690 lists the same four properties for quasi-affine diagonal |
| 6.3 perfect = dualizable (headline) | `O[1]`; `O²`; `ℤ/p`; object of a Δ-limit | inverse `O[−1]`; evaluation rank 4 → 1; dual not connective; level n is a pullback of level 0 | sound; two sentences misplaced (R01) |
| 6.4 almost perfect criterion | F unbounded below on `Spec A`, `G = ⊕_j τ_{≤−j}F` | `π_m(⊕) = ⊕_{j ≤ −m} π_m F`, a finite sum, so `⊕ = ∏`; the canonical map factors through `j ≤ N`, so `π_m F = 0` for `m < −N` | sound without a boundedness hypothesis |
| 7.1 affine diagonal | G not flat; `G = 1` | `X ×_{[X/G]} X = L(G ×_S X) = G ×_S X` affine; points lift fpqc-locally, affineness descends | sound |
| 7.2 against §1.8 | free translation; `BĤ` | `Mod_Λ`, perfect part `Perf(Λ)`; comodules | agree |
| 7.3 discrete quotients (headline) | Γ trivial; ℤ acting trivially; `d = 0` | `QCoh(X)`; `H¹(ℤ; C) = C` against 0; `D∞(C)` | sound |
| 7.4(d) | `B(ℤ/p)`/`𝔽_p`; atlas f | `Ext^i = 𝔽_p`; `Hom(F′, f_*I[n]) = Hom(f^*F′, I[n]) = 0` | sound |
| 8.2 perfect stacks (headline) | `BG_m`; `⨿_ℕ Spec ℤ`; `Spec 𝔽₂` | finite weight support = compact = dualizable; `Hom(O, ⊕O_i) = ∏ℤ`; one point against two | sound |
| 8.3 permanence (headline) | doubled line; `A = k[ε]/ε²`; ample family in Stacks 0BQR | sections (1, y), (x, 1) have non-vanishing loci the two charts; `Ω¹_{A/k}` is `k·dε` or `A·dε`; the proof uses quasi-compactness, affine diagonal and affine `X_s` only | sound |
| 8.4 (headline) | `BGL₁`/ℚ; unbounded M; `G = ℤ/2`, `P = Spec ℚ(i)`, `X = ℙ¹` via `diag(1, −1)` | `π₀ Map(ℚ, O[1]) = 0`, `π₁ = ℚ`; `π_i RΓ(V^∨ ⊗ M) = Hom_G(V, π_i M)`; invariants `ℚe₁ ⊕ ℚ·i e₂`, twist `ℙ¹_ℚ` | sound, conditional on the gaps |
| gap:twist-quasiprojective | P trivial; `G = 1`; X = G; `μ_p` in characteristic p; flatness | `X_R`; `X_R`; P, affine; fppf trivialization suffices for SGA1 7.8; X flat over the field k, flatness descends | precise, true, not provided elsewhere |
| 8.4, `BG → BGL_n` | frame bundle over `Spec R` | Zariski-locally trivial; relative ampleness is local on the base and R is affine, so the glued `O(1)` is ample | sound |
| 8.5 (headline) | `ℤ/p`/`𝔽_p`; `S₃`/`𝔽₃`; trivial Γ | norm and `g − 1` both 0 on k, `Hⁱ = k`; `H¹ = 0`, `H² = (𝔽₃·y)^{C₂} = 0`, coinduced witness of dimension 2; `colim_N ∏_{i≤N} k = ⊕k ≠ ∏k` | sound |

### Sources: the seeded sample

No locator is flagged unverified in the plan. Each sampled target was read at its locator.

| Target | Locators read | Result |
| --- | --- | --- |
| 1.2 | HA lines 22977–22985 (p. 601), 28674 (p. 754), 28032 (p. 737); SAG line 17835 (p. 490) | match |
| 1.3 | HA lines 47511 (Definition 7.2.2.10, p. 1240), 46134–46144 (7.1.1.13, p. 1202, parts 1–4), 47519, 47532 (pp. 1240–1241), 47516, 6013 (p. 160), 47387 (p. 1236) | match; product and filtered-colimit closure is part (4) |
| 1.4 | HA lines 48274, 48428, 48281, 48357, 48432, 48556 (pp. 1260–1268); SAG lines 10004–10009, 10022 (pp. 277–278), 17974 (p. 494); BZFN line 830 | match; 7.2.4.17 assumes left coherent, as restated |
| 2.1 | SAG lines 17853, 17867 (pp. 491–492) | match |
| 2.2 | SAG lines 17835, 17859, 18068 (p. 497); GR-I lines 7354, 7365 (PDF 181–182, printed 144–145) | match |
| 2.4 | SAG line 17845 (Remark 6.2.2.2); GR-I lines 7379–7391 (§1.2, Lemma 1.2.2) | match: both are the left-Kan-extension statement for another pair of ring categories |
| 4.2 | SAG lines 18368 (p. 505), 18458 (p. 507); GR-I line 7740 (PDF 190, printed 153) | match |
| 5.1 | Stacks line 145 (06Z0); SAG lines 7269 (p. 202), 17859 | match |
| 5.2 | Stacks lines 86–93 (0A0J), 102–103 (08D3) | match |
| 6.2 | SAG lines 18017–18033, 17905–17914, 26667–26696 (pp. 733); GR-I lines 7581, 7600 (printed 149–150); HA line 6013 | match |
| 6.3 | SAG lines 18072, 18088 (p. 497), 10219 (p. 283); HA lines 23655–23660 (p. 620); GR-I lines 8201, 8209 (printed 163) | match |
| 7.3 | GR-I line 7463 (Corollary 1.3.8, printed 147) | supports the sheafification clause; the fixed-point formula is the roadmap's own, from 2.3 |
| 8.2 | BZFN lines 834 (p. 17), 970 (p. 20) | match |
| 8.3 | BZFN lines 1149, 1189, 1209, 1216 (pp. 23–25); Stacks 0BQR (line 1897 of the cached chapter, proof to line 1914); 0FXR, 0FXS, 0FXT in the chapter *Morphisms of Schemes*, §12, fetched through the sources service | match |
| 8.4 | BZFN lines 1200–1208 (p. 24); SGA1 line 6972 (printed 174) | match |

Tags 06WG and 06WT (7.4) were also opened in the chapter *Sheaves on Algebraic Stacks*, fetched through the service: Definition 11.1 and Proposition 14.3. The manifest kept its single `Stacks` entry. Every cited work is in the manifest; no text was missing and no reference request was written.

### Pins, suppliers and ownership

Pinned declarations opened (Mathlib and Tau Ceti as in `lake-manifest.json`): all 21 Mathlib declarations of the contracts at their cited files and lines (`SSet.Quasicategory` Basic.lean:41 through `exists_prime_orderOf_dvd_card` Cycle/Type.lean:491, which assumes `Fintype`); `CategoryTheory.Functor.IsFibered` in FiberedCategory/Fibered.lean; Tau Ceti `exists_isClosedImmersion_generalLinear` (Embedding.lean:212) and the finite-subcomodule theorem `iUnion_finiteSubcomodules_eq_univ_of_exists_mem` (Coalgebra/Subcomodule/Finite.lean:273) behind ReductiveGroups Layer 1. Neither pin has an ∞-categorical prestack or its `QCoh` (object search for "prestack" and `QCoh`: only 1-categorical descent files).

Supplier citations resolved this round:

- EnhancedDerivedSheaves on main: all 69 backticked names and all 18 labels of the contract found. `Cat∞` there is "small quasicategories", with `PrL` "in a larger universe" (used for R02).
- SchemeAndStackFoundations on main: all 34 names found; §§1.1, 1.13, 1.16, 1.18, 1.21, 1.22, 2.18 under those headings. §1.16 states `contractedProduct`, `contractedProduct_baseChange` and `contractedProduct_isAlgebraicSpace` and no scheme or ampleness statement. The open revision that touches it keeps the seven headings.
- DerivedModuleAlgebra §0.2 and §1.E.0, ReductiveGroups Layers 1, 3 and 6 on main; the open revision keeps the three layer headings.
- PrismaticCohomologyPartII §4.0 at its head: all 16 cited names at lines 711–732. LanglandsParameterStacks §§1.7–1.8 at lines 380 and 390. HabiroCohomologyFoundations §§1.27–1.28 at lines 807 and 821.
- The InfinityCategoryTheory family (another author's open pull request adding new folders): all 19 labelled statements found with the cited content, for example CartesianFibrations 5.5.3, PresentableInfinityCategories 4.4.2, HypercompletenessAndCoherence 6.1.1.
- AnalyticStacks §§1.1–1.2, the downstream consumer, builds `D(R) = Mod_R(D(ℤ))` on animated rings, as the README says.

`roadmaps resolve` on the README: no cross-roadmap citation and no Lean name found nowhere. `scratch/overlaps.md` lists no competing pull request, no dropped id, no id defined only by a revision and no second copy; confirmed with `roadmaps overlaps`.

Ownership was searched by object on main and at the open heads (`roadmaps grep` for perfect stacks, `Ind(Perf`, flat hyperdescent, the right Kan extension of `QCoh`, Chevalley quasi-projectivity, contracted products with ample bundles, polarised descent). No new owner was found. The board index lists two unrelated packages. Ownership against pull requests outside the index was not checked.

Overlap check: read EnhancedDerivedSheaves (main and its two open revisions), AnalyticStacks, InfinityCategoryTheory with HypercompletenessAndCoherence, SchemeAndStackFoundations (main); shared objects: `Mod_R(D(ℤ))` on animated rings — owner EnhancedDerivedSheaves E5:animation.4, cited by both; general ∞-category theory — owner the InfinityCategoryTheory family, cited; abelian `QCoh` on stacks and `DQCoh` — owner SchemeAndStackFoundations, cited.

### Dependency gate and the declared gaps

```
candidate: QuasicoherentSheavesOnPrestacks is not in the merge order yet; checked as if placed after HabiroCohomologyFoundations (the intake inserts it when its design is accepted)
depcheck: 245 roadmaps, 2232 edges, 0 problem(s)
```

No UPWARD or CYCLE line. The plan has 33 targets and 126 tests, at least three each, and no forward `target:` prerequisite.

- `gap:twist-quasiprojective`: same slug in the README and the plan; supplier SchemeAndStackFoundations §1.16; one `needs` sentence with all hypotheses. Not provided elsewhere: StableReduction Layer 2 states étale descent of polarised schemes through relative `Proj`, ModularCurves Layer 0.5 the projective-curve and finite locally free cases, and K3SurfacesAndSymplecticBoundedness an étale-local criterion for a given algebraic space; none states the twist.
- `gap:chevalley-quasiprojective-quotient`: unchanged; supplier ReductiveGroups Layer 3. Tau Ceti has the line-stabilizer theorem (`exists_finite_subcomodule_exteriorPower_line_stabilizer`) but no quasi-projective quotient, and ReductiveGroups on main does not state one, so the gap asks for nothing already provided.

### Shape, principles, headlines

The README has the required parts in order. Every definition has API prose and at least three Checks, every theorem a locator, every layer Examples and Dependencies. No LaTeX delimiters, process words, pull-request numbers, machine paths, algorithms, `set_option` or sorry'd data (regex scan). No route-specific shortcut: the characteristic-zero hypothesis of 8.4 is the theorem's, and 8.5 shows it cannot be dropped. The README does not say it follows a source and no layer is named after a source's chapter.

Headline theorems (from the Summary): flat hyperdescent (3.2) with sheafification invariance (3.3); affine pushforward with base change (4.2); `QCoh(h_X) ≃ Dqc(X)` for every scheme (5.3); the t-structure and perfect = dualizable (6.2–6.3); `QCoh(X/Γ) ≃ QCoh(X)^{hΓ}` (7.3); perfect stacks and their permanence (8.2–8.3); characteristic-zero quotients (8.4); the non-compact unit in characteristic p (8.5).

This is a design: there is no `Suggested.lean`, so there are no sorried declarations to probe and no signatures to compare.

Source independence: 12 passages compared with 6 sources (HA lines 47511, 48274, 48428; SAG lines 17867, 18072, 26690; BZFN lines 834, 1200; GR-I line 7365; Stacks 0FXT, 0BQR; SGA1 line 6972), none shared beyond what a definition forces (at most five consecutive words); largest share SAG, 45 of 143 locators; contents compared with SAG §§6.2.1–6.2.6, 6.3, 9.1 and D.6: independent. Layer 1 draws on HA, Layer 3 on SAG Appendix D, Layer 5 follows Layer 4 because 5.4 needs 4.2, and Layers 7–8 have no SAG counterpart.

## Not verifiable

- Lean elaboration and the one-tactic probe: not available (this lane does not elaborate). No Lean command was run.
- The two gaps are declared contracts: their statements were checked, not future proofs.
- LanglandsParameterStacks §1.8 does not say in words that its chart is affine; the agreement of `Perf` was checked on its Checks, which treat charts `Spec A`.

## Source issues

- **Error** in BZFN at proof of Corollary 3.22, arXiv page 24: the source says the compact and dualizable objects on the classifying stack are the finite-dimensional representations; it should be their shifts, finite extensions and retracts; affects the proof.
- **Gap** in BZFN at proof of Corollary 3.22, arXiv page 24: the source says the quotient maps quasi-projectively to the classifying stack; it should justify that twists by torsors that are not Zariski-locally trivial are schemes with an ample bundle; affects the proof.

## For the human reviewers

- none

<!-- tauceti-roadmap-review {"agent": "claude", "head": "a589c3c2cf77ef3d77a7e2846252703f964e6fc0", "job": "REV-DESIGN-QuasicoherentSheavesOnPrestacks~8", "model": "fable", "worker": "chris-x30"} -->
