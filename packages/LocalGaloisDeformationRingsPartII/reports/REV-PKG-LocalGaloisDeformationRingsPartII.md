<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2388#issuecomment-6628513381 -->
Review (claude) of 2b3a5ca

Verdict: needs_changes

1. **F01** (P1) Cyclotomic freeness of `ad(ρ̄)` is used in three routes and owned nowhere

   Location: `packages/LocalGaloisDeformationRingsPartII/README.md` line 387 (3.9: "then `(ρ₁^∨ ⊗ ρ₂)^ss ≅ ad(ρ₁)^ss` is cyclotomic free for 2-generic `ρ₁` (LLHLM18, Proposition 3.9)"), line 559 (5.7: "3.8 identifies morphisms of deformations with those of their restrictions") and line 678 (7.3: "3.8 kills the remaining endomorphisms").

   Claim: the routes of 3.9, 5.7 and 7.3 apply 3.8 to `ρ₁^∨ ⊗ ρ₂` or `ad(ρ̄)`, which requires `ad(ρ̄)` to be cyclotomic free for a 2-generic (resp. normalized 12-generic) `ρ̄ : G_K → GL₂(𝔽)`.

   Witness: BHHMS23 line 1114 proves Corollary 3.2.9 "by the analog of [LLHLM18, Prop. 3.9]"; LLHLM18 line 1118 states Proposition 3.9 only for `GL₃` and `p > 3`; BHHMS23 line 1416 uses "`ad(ρ̄)` is cyclotomic free" for equation (22). No target of Layers 0–7 states the `GL₂` case, and none of the cited supplier sections (FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.4.24, R07.4.39; LocalGaloisDeformationRings §§1.1–3.10) does: 3.7's API and Checks concern single characters only. Computed instance: `f = 1`, `ρ̄ = nr(α)ω^a ⊕ nr(β)ω^b` gives `ad(ρ̄)^ss = 1 ⊕ 1 ⊕ ω^{a−b} ⊕ ω^{b−a}`, cyclotomic free exactly when `a − b ≢ ±1 (mod p−1)`; for normalized data `a − b = r + 1` with `12 < r + 1 < p − 12` this holds, and for `a − b = 1` (the 0-generic boundary, `ρ̄ = ω ⊕ 1` up to twist) it fails. So the statement is true under the hypotheses used but is a genuine input.

   Repair: add to 3.7 the theorem "for `p > 2` and 2-generic `ρ̄ : G_K → GL₂(𝔽)`, `ad(ρ̄)` is cyclotomic free; hence `(ρ₁^∨ ⊗ ρ₂)^ss` is cyclotomic free whenever `ρ₁` is 2-generic and `ρ₁^ss ≅ ρ₂^ss`" with the route: over `K′ = K` (reducible) or the unramified quadratic extension (irreducible), `ad(ρ̄)|_{G_{K′}}` is upper triangular with diagonal characters `ω_{f′}^{a_i − a_{i′}}`, and 2-genericity gives `a₁ − a₂ ≢ ±(1 + p + ⋯ + p^{f′−1}) (mod p^{f′} − 1)` (LLHLM18, Proposition 3.9, p. 29, as the `GL₃` template; BHHMS23, proof of Corollary 3.2.9, p. 24). Add the reducible instance above as a Check with its negative control `a − b = 1`. List the new statement in the *Needs:* lines of 3.9, 5.7 and 7.3. The manifest now records `LLHLM18` (arXiv 1512.06380v3); add it to `## References`.

2. **F02** (P2) 3.3/3.4 cite a covariant realization for a statement that fixes the contravariant one

   Location: `README.md` line 314 (3.3: "It is an object of the étale `φ`-module category of `FiniteFlatGroupsAndIntegralPadicHodgeTheory` §R07.4.39"), lines 329–332 (3.4: "whose restriction to `G_{K∞}` is `V*_K(𝓜(w̃, D))`", API "Its restriction to `G_{K∞}` is the supplier's contravariant realization"), the 3.4 Check "arithmetic Frobenius acts by `α`, not `α^{−1}`, in this contravariant convention", and the 3.4 *Needs:* line, which names only §R07.4.39 and LocalFieldsRamification Layer 4.

   Claim: the realization supplied by §R07.4.39 is contravariant and gives arithmetic Frobenius `α` on a rank-one module with `φ = α`.

   Witness: FiniteFlatGroupsAndIntegralPadicHodgeTheory at #879, §R07.4.5 defines `T(M) = (𝒪̂_{ℰ^ur} ⊗_{𝒪_ℰ} M)^{φ=1}` and §R07.4.39 its coefficient version `T_A : ΦM_{𝒪_ℰ,A} → Rep′_A(G_{K∞})`: both covariant. Computed: for `M = 𝒪_ℰ e`, `φ(e) = αe`, a generator of `T(M)` is `b ⊗ e` with `φ(b)α = b`, and an arithmetic Frobenius lift sends `b ↦ φ(b) = α^{−1}b`, so it acts by `α^{−1}`; in `Hom_{φ}(M, 𝒪̂_{ℰ^ur})` (the contravariant `V*_K` of BHHMS23 line 1046 and LLHL19 §3.1) the generator `e ↦ c` has `φ(c) = αc` and Frobenius acts by `α`. With the cited functor, 3.4's third Check and 3.5's `nr(∏_j λ_j)` (BHHMS23 Lemma 3.2.6, line 1055, proved with `V*_K`) come out inverted, and 3.6's parametrization by `D` changes by `D ↦ D^{−1}`.

   Repair: in 3.3 define the realization actually used, `V*_K(M) := Hom_{𝒪_ℰ ⊗ 𝔽, φ}(M, 𝒪̂_{ℰ^ur} ⊗ 𝔽)`, and prove it is `T_𝔽` of the dual étale `φ`-module (so an exact anti-equivalence, by §R07.4.39); or cite LocalGaloisDeformationRings §6.9's `T*_dd` at trivial descent (`r = 1`) through gap:rank-two-descent-kisin-modules, which 4.2 already uses. Put that owner in the *Needs:* of 3.4 and 3.5, and add the rank-one instance above (`α` versus `α^{−1}`) as a Check of 3.3. Tested on the instance that refuted the original: with the dual-module definition, `M^∨` has `φ = α^{−1}` on the dual basis, `T_𝔽(M^∨)` has Frobenius `(α^{−1})^{−1} = α`, as 3.4 asserts.

3. **F03** (P3) Supplier declaration names that the supplier does not declare

   Location: `README.md` line 13 ("`DeformationSupport.pstRing` and `DeformationSupport.crystallineRing`: `PadicLocalLanglandsForGL2Qp`, §0.4"), line 57 ("§0.3: `fundamentalCharacter`"), line 59 ("`DeformationSupport.framed`"), line 60 ("`HenniartType.sigma`", "`HenniartType.reductionSS`").

   Claim: these are declarations of PadicLocalLanglandsForGL2Qp §§0.3, 0.4, 4.4.

   Witness: PadicLocalLanglandsForGL2Qp at #1312 contains none of these backticked names; §0.3 (lines 268–291) and §0.4 (lines 292–344) describe the objects in prose, §4.4 (line 1473) names `σ(τ)` and `σ̄(w, τ)` in prose, and its downstream table (line 2434) attributes `fundamentalCharacter` to ArithmeticGaloisRepresentations §2.3. The worker's own citation check already lists `crystallineRing`, `pstRing` and `reductionSS` as found nowhere. The names `DeformationSupport.*` are LocalGaloisDeformationRings' abbreviations (its README line 70 and §3.4).

   Repair: cite the objects by section and description ("§0.4's reduced `𝒪`-torsion-free potentially crystalline quotient", "§4.4's `σ(τ)` and its semisimplified reduction") and drop the backticked names, or attribute `DeformationSupport.pstRing`/`crystallineRing` to LocalGaloisDeformationRings §3.4, where they are introduced.

4. **F04** (P3) Stale pin hashes

   Location: `README.md` line 39 ("### From Mathlib (pinned at `6b7abb3`)") and line 45 ("### From Tau Ceti (pinned at `a91d3aa`)").

   Claim: these are the pins.

   Witness: `lake-manifest.json` of the content checkout pins mathlib `f6090c7095e1e56b3464c1daba5f24631f1290d2` and TauCeti `358314d4ab97483df4fc4cb8adcc02e74a8d9f5a`. Every cited declaration exists at these pins (list under Verified sound), so nothing else changes.

   Repair: replace the two hashes by the manifest's, or remove the hashes from the headings.

5. **F05** (P3) 0.4 cites a remark for a theorem whose proof is in the primary source

   Location: `README.md` line 141 ("(BHHMS23, Remark 2.3.5, p. 15, citing LLHL19, Proposition 2.2.16)").

   Claim: the depth-loss statement is sourced.

   Witness: BHHMS23 line 665 (Remark 2.3.5) only cites LLHL19; the primary source was not in `sources.toml`. Fetched: LLHL19 line 508, Proposition 2.2.16, p. 14: for `λ` `d`-deep in a `p`-restricted alcove with `d ≥ n`, every lowest-alcove presentation of `τ(s, λ+η)` is `(d − n + 1)`-deep; for `n = 2` this is the `(N−1)` of 0.4, with the hypothesis `N ≥ 2` (the `N = 1` case is the definition, as 0.4's first Check says).

   Repair: cite "LLHL19, Proposition 2.2.16, p. 14" at the claim and add `LLHL19` to `## References` (the manifest entry is now recorded, arXiv 1610.04819v4, `cited_for = ["0.4"]`).

Previous review: none. Scope reviewed: `packages/LocalGaloisDeformationRingsPartII/README.md` (755 lines, 40 targets in Layers 0–7), `Suggested.lean` (one declaration), `metadata.toml`, `sources.toml`, `design/plan.json` (gaps only). Principles: no route-specific shortcut (the general `{(3,0),(2,1)}^f` profile set is kept throughout; the Barsotti–Tate profile is excluded by scope, not by convenience); the base roadmap `LocalGaloisDeformationRings` is imported, not re-planned (its §§1.1–3.10 and 6.9 are cited, its `GL₃` charts §§6.20–6.33 are different objects); no copied passage was found (every statement is paraphrased with locators; the chart equations are restated in the roadmap's own `u, d, a, x, t` notation); no algorithm; `Suggested.lean` has one `import Mathlib`, no `set_option`, no sorried data. All ten gaps of `design/plan.json` appear under `## Exact supplier contracts` with the same slugs and suppliers; every supplier is earlier in the merge order or on main.

## Verified sound

**Dependency check** (run from the content checkout with the brief's command):

```text
depcheck: 205 roadmaps, 1751 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. All suppliers are earlier in the merge order (PadicLocalLanglandsForGL2Qp 32, FiniteFlatGroupsAndIntegralPadicHodgeTheory 52, DeformationAndDerivedPatchingAlgebra 69, LocalGaloisDeformationRings 85, ModpRepresentationsOfGL2OverLocalFields 322; this roadmap 324) or on main (LocalFieldsRamification under `Completed/`, ClassFieldTheory under `TauCetiRoadmap/`). The only later roadmap touching this material, HilbertModularVarietiesAndShimuraCurvesPartII (325), is cited only as a consumer.

**Elaboration.** `lake env lean` on `Suggested.lean` from the content checkout: one message, `47:8 warning: declaration uses 'sorry'`. No `TauCeti.*` import, so nothing to build. Binder check: the elaborated type of `crossing_prime` (worker's signatures file, re-read) carries `CommRing O`, `IsDomain O`, `IsDiscreteValuationRing O`, `IsAdicComplete (IsLocalRing.maximalIdeal O) O`, `Irreducible ϖ`, `0 < d`, a unit `u` of `MvPowerSeries (Fin (n+2)) O`, and concludes `Prime (X 0 * X 1 + C (ϖ^d) * u)`: this is README 5.3's first assertion at the README's generality (complete DVR, `n + 2 ≥ 2` variables, `d > 0`, unit `u`). Nothing changed.

**One-tactic probe** (scratch copy, elaborated once): `simp` leaves the goal unchanged; `infer_instance` fails ("type class instance expected"); `rfl` fails; `exact?` finds no library lemma (its only suggestion is the sibling probe theorem). The declaration is not padding. The headline list in the module docstring names the five unstatable headlines with the missing carriers (framed deformation ring of `G_K`, fixed-type quotients, `ψ`, `W(ρ̄)`, `σ(τ)`, étale `φ`-modules with coefficients); I confirmed none of these carriers exists in Mathlib `f6090c7` or Tau Ceti `358314d`.

**Sources, seeded sample** (all read in the worker's cache; locators are `BHHMS23 line N`): 0.1 Definition 2.3.1 and (11)–(12), lines 623–647, p. 14, with the geometric-Frobenius Artin normalization at line 620–621; 0.4 Remark 2.3.5, line 665, p. 15 (and now LLHL19 line 508); 2.1 Proposition 3.1.7, lines 878–909, p. 20, with `λ`, `N_∇` and `𝒪^rig_R` as stated; 3.1 Definition 3.2.1 and Remark 3.2.2, lines 1008–1024, p. 22; 3.3 Definition 3.2.4, line 1033, p. 22; 3.6 Proposition 3.2.7 and (19), lines 1075–1093, p. 23; 4.2 Lemma 4.1.1, lines 1201–1215, pp. 25–26, with the étale matrix `(D s* t^{μ*})_j` at line 1208 and the bound `3 < ⟨μ(τ)_j + η_j, α^∨⟩ < p − 4` at line 1214; 5.1 lines 1314–1318, p. 28, and line 1286 ("`≤ (3,0)` meaning `(3,0)` or `(2,1)`"); 5.2 Tables 1–3, lines 1957–2172, pp. 41–43, every one of the fifteen displayed equations `G₁…G₅` and the three finite-height generators per table recomputed against the README's `u, d, a, x, t` rewriting (details in the table below), the constants `a_i mod p` at lines 2012, 2098, 2170, the dense polynomial subrings at lines 1436–1438 and `I^poly ⊆ (I∞, p^{N−5})` at line 1444; 5.4 Lemma 4.2.3, lines 1478–1495, p. 31 (identity verified symbolically below); 5.7 equation (22) and its explanation, lines 1415–1423, p. 29; 6.1 Proposition 4.2.1, lines 1319–1333, p. 28; 6.3 Corollary 4.2.6 and (27)–(28), lines 1588–1616, pp. 33–34, and Lemma 8.1.2, line 4405, p. 88; 7.1 the multi-type matrix at lines 1674–1680, Figure 2 at lines 1852–1856, Tables 4–5 at lines 2175–2324 (the extra relations `c₁₁ + pd₁₁`, `b₁₂`, `c₂₂ + pd₂₂` at lines 2189, 2203, 2293); 7.3 Proposition 4.3.1, lines 1644–1664, pp. 34–35, Claim 1's tangent bound `p k_j ≤ k_{j−1} + r_j + 3 < k_{j−1} + p − 1` at lines 1764–1765, Claim 3's `p ∈ I_w̃ + I_w̃′` with `a₂ ≢ 1`, `a₁ + a₂ ≡ 2` at lines 1885–1887, and `(f+4) + 2f = 3f + 4` at line 1893. Also checked: 7.4 Lemma 4.3.2, lines 1900–1915 (all four `Q` ideals generator by generator); 7.5 Proposition 4.3.3, lines 1918–1954; 5.3 Lemma 3.3.1, lines 1118–1134; 5.6 (26) and the `L(a,b) ⊗ L(2,0)` decomposition, lines 1524–1536; 5.8 Lemma 4.2.4, lines 1539–1558; 0.5 Proposition 2.4.3, lines 722–740; the star operation, line 579; GHLS17 Theorem D line 174 (p. 4) and Theorem 3.1.5 line 1041 (p. 21); Elkik73 §0.2 line 90 (p. 555) and Lemme 1 lines 118–130 (pp. 555–556, `n > sup(2h, h+k)`, correction modulo `t^{n−h}`); Hamann75 Theorem 4 line 101 (p. 155). No unverified-flagged locator exists in the package.

**Suppliers resolved** at the heads named in the brief: LocalGaloisDeformationRings #923 §§1.1, 1.2, 1.8, 3.1, 3.4, 3.5, 3.9, 3.10, 6.9, 6.28, 8.10 (headings at its lines 1276, 1284, 1399, 2241, 2292, 2300, 2388, 2396, 3052, 3380, 3810; `heightLatticeFunctor`, `HodgeType`, `GaloisType` at lines 1292, 2249, 2250; §6.9 is rank three with `r ∈ {1,2,3}`, so gap:rank-two-descent-kisin-modules is needed; §6.28's "3f" and "nine" match 5.7's Check; §8.10 is the `ℚ_p` reducible crystalline lift, so gap:ghls-existence is needed; §3.9's `d² + Δ(v)` gives `4 + f`). FiniteFlatGroupsAndIntegralPadicHodgeTheory #879 §§R07.4.1, R07.4.2, R07.4.6, R07.4.24, R07.4.36, R07.4.39 (lines 5483, 5559, 5715, 6528, 7307, 7412; `kisinOpenDiscBounded`, `λ = ∏ φⁿ(E(u)/E(0))`, `N_∇ = −uλ d/du` at line 5493–5498; `N_∇φ = (p/c₀)E(u)φN_∇` at line 5719; `KisinModule`, `KisinModuleCoeff` at lines 5561, 7309; R07.4.24 is full faithfulness on finite flat representations, so gap:kummer-restriction-invariants is needed). DeformationAndDerivedPatchingAlgebra #1034 §§1.8, 1.9, 1.11, 1.12, 1.13, 1.14, 3.2, 4.6, 4.7, 6.8 (lines 213, 233, 262, 282, 305, 325, 573, 991, 1006, 1327; `flatCompletion_finiteComparison` line 307); neither it nor any roadmap on main or at an open head states that a regular local ring is factorial (`roadmaps grep` finds only dimension two in PadicMeasuresIwasawaAlgebras), so gap:regular-local-factorial is minimal; no roadmap states Hamann's theorem (HilbertModularVarietiesAndShimuraCurvesPartII declares the same gap on the same supplier), so gap:power-invariance is minimal. PadicLocalLanglandsForGL2Qp #1312 §0.3 (fundamental characters at every niveau, Teichmüller lift, Frobenius conjugation, no Artin-map comparison: gap:fundamental-character-artin minimal), §0.4 (framed pair under `Φ_p`, reduced `𝒪`-torsion-free potentially semistable and crystalline quotients with the finite-local-algebra criterion), §4.4 (Henniart types for `GL₂(ℤ_p)` and supercuspidal types for every `F`, lattice-independent `σ̄`: gap:tame-types-unramified minimal). ModpRepresentationsOfGL2OverLocalFields (board design) MP.3/weight-coordinates (depth `N < r_i + 1 < p − N`, as in the Conventions), MP.3/translation-map (`t_λ`, `Σ`, adjacency), MP.3/tame-weight-set (`τ(s,ν)` with the geometric Artin convention, `W(ρ̄)`), MP.5/projective-adjoint (`P̃_σ[1/p]` has exactly `2^f` pairwise nonisomorphic constituents for 3-deep `σ`). LocalFieldsRamification Layer 4 (Completed, line 1154; no Kummer-tower statement there or in FiniteFlatGroups, so gap:kummer-tower-tame-quotient is minimal). ClassFieldTheory Layer 7 (line 1312; "All local and global Artin maps use arithmetic Frobenius", line 462, consistent with the Conventions' inversion rule). `roadmaps resolve`: no cross-roadmap citation found nowhere. Ownership against open pull requests was checked with the tool's index and the board packages: no other roadmap builds the tame rank-two charts, the crossing lemma or the multiple-type presentations.

**Pinned declarations** (Mathlib `f6090c7`, Tau Ceti `358314d`): `PowerSeries.exists_isWeierstrassFactorization` (WeierstrassPreparation.lean:813), `PowerSeries.isWeierstrassDivision_weierstrassDiv_weierstrassMod` (:560), `IsRegularLocalRing` (RegularLocalRing/Defs.lean:51), `IsDiscreteValuationRing` (DiscreteValuationRing/Basic.lean:56), `IsAdicComplete` (AdicCompletion/Basic.lean:56), `Ideal.minimalPrimes` (MinimalPrime/Basic.lean:56), `Ideal.span_le` (Ideal/Span.lean:70), `Matrix.det_fin_two` (Determinant/Basic.lean:809), `Matrix.adjugate` (Adjugate.lean:187), `Field.absoluteGaloisGroup` (AbsoluteGaloisGroup.lean:42), `modularCyclotomicCharacter` (CyclotomicCharacter.lean), `LaurentSeries` (LaurentSeries.lean:100), `IsLocalRing.notMem_maximalIdeal` (used at WeierstrassPreparation.lean:184), `MvPowerSeries.C/X`; `TauCeti.inertiaTameCharacter` (Tame/Character.lean:401) and `TauCeti.quotientWildInertiaSubgroupEquiv` (:521). No `UniqueFactorizationMonoid` instance for `MvPowerSeries` or for regular local rings at the pin, as the README says.

**Adversarial table** (values I computed; rows for the sampled targets, the headline and every target a finding touches).

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 `τ(s,μ+η)` | `f=1,s=1`; `f=1,s=w`; `f=1,p=7,μ=0` | exponents `(μ₁+1, μ₂)`; `α′₁ = w(μ₁+1,μ₂) = (μ₂,μ₁+1)`, `a′^(0) = (μ₁+1+pμ₂, μ₂+p(μ₁+1))`; `a′^(0)=(1,0)` so `ω₁ ⊕ 1`, and `ω₁` has order 6 ≠ 2 so inversion is visible | holds, source line 627–638 | none |
| 0.2 depth | `N=12` | need `12 < d < p−12`: `p ≥ 26`, hence `29`; `p=23` gives `12 < d < 11`, empty | holds | none |
| 0.3 orientation | `f=1,s=w,p=5,μ=(1,0)` | `α′₀=(2,0)`, `α′₁=(0,2)`, `a′^(0)=(2,10)`, `a′^(1)=(10,2)`; `s′_{or,0}=s₁^{−1}=w`, `w(2,10)=(10,2)` dominant; `s′_{or,1}=1` | holds, line 669–674 | none |
| 0.4 depth loss | `N=1`; `N=13`; `n=2` in LLHL19 | `d−n+1 = N−1`; LLHL19 needs `d ≥ n = 2`; at `N=1` the conclusion is 0-depth by definition | holds | R05: cite primary |
| 0.5 `JH(σ̄(τ))` | `f=1` | `Σ={0,η}`, two constituents, `2 = 2^f`; scalar type: `μ − sw^{−1}ν − η` not 1-deep, excluded | holds, line 722–732 | none |
| 1.1 `Ad` order | `P=[[0,1],[1,0]], D=diag(1,2), C=[[0,1],[0,0]]` | `(PD)C(PD)^{−1} = [[0,0],[1/2,0]]`; `(DP)C(DP)^{−1} = [[0,0],[2,0]]` | distinguishes the order | none |
| 1.1 minors | `λ_j=(2,1)`; `(3,0)` | `1×1` minors divisible by `(v+p)^1`, det by `(v+p)^{1+2}`; `(3,0)`: `(v+p)^0`, det `(v+p)^3` | matches line 846 | none |
| 1.3 gauge degrees | `t^(2,1)`; `wt^(2,1)`; `t^(1,2)` | `t^(2,1)`: `(2,0;2,1)` with `v` on `(2,1)`, pivots `(1,1),(2,2)`; `wt^(2,1)`: `(1,1;2,1)`, pivots `(1,2)` deg 1, `(2,1)` deg 2 with factor `v`; `t^(1,2)`: `(1,1;1,2)`, pivots `(1,1),(2,2)` | equals Tables 1–3 row 1 | none |
| 1.4 ambiguity | `R=𝔽[ε]/ε²` | `ker(T(R)→T(𝔽)) = (1+ε𝔽)²`, `f`-periodic: dimension `2f` | holds, line 871–872 | none |
| 2.1 Frobenius rule | trivial rank one, `u′e` | LHS `N_∇((u′)^p) = −p(u′)^pλ`; RHS `E·φ(−u′λ) = −E(u′)^pφ(λ)`; equal iff `pλ = Eφ(λ)`, true since `λ = (E/p)φ(λ)` | holds | none |
| 2.3 remainders | `h=3, N=12, L=11` | `p^{L−2−t}`: `p⁹, p⁸`; Table rows show `O(p^{N−3}), O(p^{N−4})` | consistent, lines 1981–1994 | none |
| 3.1 good pair | `f=1,s=w,μ=(a,a)`; `μ=(1,0)` | `d(1)=2`, divisor `d=1`, modulus `p+1`; exponents `(p+1)a` (bad), `1` and `p` (good) | holds, line 1011 | none |
| 3.2 | `f=1,p=5,s=w,μ=(3,1)`; `f=2,p=3,δ=(2,−1)` | `3+5=8 ≢ 0 (mod 6)`; `|2−3|=1 < 9` | holds | none |
| 3.3 monomial module | `w̃=1,D=1`; `diag(v^{−1},1)` | sum of two trivial rank-one modules; Laurent entries allowed over `k((v))` | holds, line 1033 | none |
| 3.3/3.4 realization variance | rank one `φ=α` | covariant `T`: Frobenius `α^{−1}` (`φ(b)α=b`); contravariant `Hom_φ`: Frobenius `α` (`φ(c)=αc`) | cited functor is covariant | R02 |
| 3.5 twists | all `λ_j = c`; `f=2, (c,c^{−1})` | `nr(c^f)`; `nr(1)` | holds, line 1055 | none |
| 3.6 | `f=1,s′=1`; `s′=w` good | split `nr(α₁)ω^a ⊕ nr(α₂)ω^b`; irreducible induced from quadratic unramified; `D, D′` with equal orbit products isomorphic by 3.5 | holds, line 1079 | none |
| 3.7/3.9 `ad(ρ̄)` | `f=1`, `nr(α)ω^a ⊕ nr(β)ω^b` | `ad^ss = 1⊕1⊕ω^{a−b}⊕ω^{b−a}`; cyclotomic free iff `a−b ≢ ±1 (mod p−1)`; normalized `a−b=r+1 ∈ (12, p−12)` passes; `a−b=1` fails | true but unowned | R01 |
| 4.1 depth | `N=12` | `μ(τ)_j+η_j ∈ {(r_j,0),(r_j+1,−1)}`, coordinates `r_j, r_j+2 ∈ [12, p−12]`: 11-deep; `11 ≥ 4`, `L=11 ≥ 3`, `10(p−1) ≥ 3` | holds, line 1189–1190 | none |
| 4.2 bound | `N=12` | `3 < r_j`, `r_j+2 < p−4` since `r_j ≥ 12`, `r_j+2 ≤ p−10` | holds, line 1214 | none |
| 4.3 `θ` | `f=1` | `θ(0)=U₃` (`t^(1,2)`), `θ(η)=U₁`; `X(σ)` of size 2; distinctness of `τ_w̃` from (20): the excluded set `∏_j({U₁,U₃}∖{w̃_j})` determines `w̃` | holds, lines 1251–1254 | none (source gap noted) |
| 5.1 profiles | `f=1` | `≤(3,0)` in dominance order is `{(3,0),(2,1)}`; `(2,0),(3,1)` excluded | holds, line 1286 | none |
| 5.2 chart 1 | `G₁…G₅` vs Table 1 row 6 | `d₁₁+(a−2)c₁₂d₂₁/d`, `c₂₂−(a−1)c₁₂d₂₁/u`, `c₂₁+(a−1)(a−2)c₁₂d₂₁²/(aud)`, `c₁₁−(c₁₂d₂₁/d)((a−1)²(a−2)x/a−p)`, `c₁₂((a−1)(a−2)x−2p)` with `x=c₁₂d₂₁/(ud)` | equal, lines 1996–2007 | none |
| 5.2 chart 2 | vs Table 2 row 6 | `c₂₁+(a−1)d(t+p)`, `c₁₂−au(t+p)`, `c₁₁+a(a−1)d₁₁(t+p)/(a+1)`, `c₂₂−a(a−1)d₂₂(t+p)/(a−2)`, `(t+p)(a(a−1)t/((a−2)(a+1))+p)` | equal, lines 2061–2087 | none |
| 5.2 chart 3 | vs Table 3 row 6 | `d₂₂−(a+1)d₁₂c₂₁/u`, `c₁₁+ad₁₂c₂₁/d`, `c₁₂−a(a+1)d₁₂²c₂₁/((a−1)ud)`, `c₂₂−(d₁₂c₂₁/u)(a²(a+1)x/(a−1)−p)`, `c₂₁(a(a+1)x−2p)` | equal, lines 2152–2165 | none |
| 5.2 finite height | `det A₁` | `z³e d₂₂* + z²(ec₂₂+d₁₁d₂₂*−c₁₂d₂₁) + z(d₁₁c₂₂+c₁₁d₂₂*−c₁₂c₂₁+pc₁₂d₂₁) + (c₁₁c₂₂+pc₁₂c₂₁)` | lower three coefficients = Table 1 row 4 | none |
| 5.2 `κ` | `a₂ ∈ {5,7,−3,11/3}`; `(p,κ,x,y)=(3,−1,2,3)` | `κ−1 = −2/(a(a−1))`: `−1/10, −1/21, −1/6, −9/44`; `κ^{−1}(xy+p)(xy+κp) = −27`; at `x=y=0`: `p²` | holds | none |
| 5.2 `a_i mod p` | Tables 1–3 notes | `−sgn(s_j)(r_j+1)+1`, `sgn(s_j)(r_j+1)+1`, `−sgn(s_j)(r_j+1)−1` | equal, lines 2012, 2098, 2170 | none |
| 5.3 crossing | `x₁x₂+ϖx₁`; `d=0`; `f₁=1, f₂=1+x₁x₂` | reducible `x₁(x₂+ϖ)`; unit; `(x₁x₂+ϖ) = (x₁x₂+ϖ+ϖx₁x₂)` would force `x₁x₂+ϖ ∣ ϖx₁x₂`, impossible for a prime dividing none of `ϖ, x₁, x₂` | source "iff" false, README "if" right | none (source issue) |
| 5.4 identity | symbolic; `x=y=0,p=3,κ=−1` | `(2(κ+1)t+p(κ−1)²)F − ((κ+1)t+p(κ²+1))xF_x`: `t³`: 0; `t²p`: `(κ+1)²+(κ−1)²−2(κ²+1)=0`; `tp²`: `(κ+1)(2κ+κ²−2κ+1−κ²−1)=0`; `p³`: `κ(κ−1)²·κ^{−1} = (κ−1)²p³`; value `27·4=108` | holds | none |
| 5.5 Elkik | `N=12`: `n=7`; `n=6` | `n > 2h = 6`; correction `p^{n−3}=p⁴`; `2(6−3)=6` no gain | holds, Elkik line 126 | none |
| 5.7 counts | `f=1` | chart relative dimension `8−5=3`; `dim R^{≤(3,0),τ} + 2 = 3 + 4`, so `5 = 4+f` | holds, line 1419–1420 | R01 (input) |
| 5.8 `ψ` | `N=12`; `N=9` | `p^{N−8}=p⁴`; automorphism for `N ≥ 9` (line 1552) | holds | none |
| 6.1 kernel index | `f=2, λ=((3,0),(2,1))` | `Σ_j P_{j,λ_{f−1−j}} = P_{0,(2,1)} + P_{1,(3,0)}` | holds, line 1332 | none |
| 6.2 dimension | `f=3` | `8` components; `3f+4−2f = 7` | holds, line 1892 | none |
| 6.3 fibres | `m=0,1`; `𝔽⟦U₁,U₂⟧/(U₁²)` | `f+4+m−m = f+4`; non-reduced excluded by (28) | holds, lines 1613–1615 | none |
| 7.1 common chart | variable count; relations | `S_j` has `c₁₁,d₁₁,b,c₁₂,x₁₂,c₂₁,x₂₁,c₂₂,d₂₂`: nine; `c₁₁+pd₁₁` (Table 4, `i=1`), `b₁₂` (`i=2`), `c₂₂+pd₂₂` (Table 5, `i=3`) | equal, lines 2187–2189, 2203, 2293 | none |
| 7.1 Figure 2 | Table 1 `G₁` transported | `d₁₁+(a₁−2)c₁₂d₂₁/d₂₂* ↦ c₁₂−pd₁₂*+(a₁−2)d₁₁d₂₂/d₂₁*` | equals Table 4 line 2190 | none |
| 7.3 tangent | normalized data | `r_j+3 < p−1` since `r_j+1 < p−12` | holds, line 1765 | R01 (input) |
| 7.4 `Q` ideals | `p=5`, units `1` | `Q₁` at `(0,0,5,0,0,0,25)`: `25−25=0`, `5−5=0`; `Q₂` at `(0,1,0,0,0,−5,0)`: `−5+5=0`; `Q₃` at `(0,0,0,5,0,0,25)`: `25−25=0`, `5−5=0` | holds, lines 1901–1909 | none |
| 7.5 membership | `N=12`; `ϖ` with `e ≥ 2` | `(a₂−1)·2/(a₂(a₂−1)) = 2/a₂`, unit (`a₂ ≢ 0`, `p>2`); tail `p^{N−9}=p³`; modulo `Q₂+P`: `c`'s, `b`, `t+p` and `p` die, quotient `(𝒪/p)⟦d₁₁,d₂₂,…⟧/(d₁₁d₂₂) ≠ 0` with `ϖ ≠ 0` | holds; `ϖ`-form false | none |
| Lean `crossing_prime` | `n=0`; `d=0`; probe | `Fin 2` has `0 ≠ 1`; `d=0` excluded by `0<d`; no one-tactic proof | matches 5.3 | none |

**Checks and style.** Every definition has at least three Checks (0.1, 0.2, 0.3, 1.1–1.3, 2.1, 2.2, 3.1, 3.3, 3.4, 3.7, 4.1, 5.1, 5.2, 7.1, 7.2, 7.4); every theorem has a locator; every layer ends with Examples and Dependencies; no LaTeX delimiters, process words, pull-request numbers, `lemma`, absolute paths or "optional/deferred" wording were found; the only backticked own name is `crossing_prime`, declared in `Suggested.lean`. Unicode and code-span conventions match the roadmaps on main.

**Gaps.** All ten declared gaps are precise and minimal (owners searched above), declared in both `plan.json` and the README with identical slugs and suppliers, none with supplier `none`.

**Downstream note (no finding).** HilbertModularVarietiesAndShimuraCurvesPartII at #1745 cites this roadmap by the design's labels `T.0`, `T.6–T.7` and declares gaps (`tame-types`, `single-type-rings`, `breuil-mezard-pbt`) that ask for potentially Barsotti–Tate presentations and Breuil–Mézard multiplicities, which this roadmap's scope excludes. That is the consumer's citation to repair; this README's Downstream consumers paragraph correctly describes what it supplies.

## Not verifiable

- LLHLM23, Lemma 7.2.10(3) (named inside gap:kummer-restriction-invariants) and Kisin06, Corollary 1.3.15 (behind Proposition 3.1.7) were not fetched: the statements used here are stated in BHHMS23 at the cited lines, and the gap text carries its own locator.
- The glyph in GHLS17 lines 174 and 1041 renders as "p ⁄= n"; whether it is `p ∤ n` or `p ≠ n` is immaterial for `n = 2`.
- LLHLM18 was read in arXiv v3 (October 2017); its Proposition 3.9 at line 1118 has the content BHHMS23 cites, so the numbering agrees with the published version for this statement.

## Source issues

- **Error** in BHHMS23 at Lemma 3.3.1, printed page 24: the lemma says the ideals `(x₁x₂+ϖ^d f₁)` and `(x₁x₂+ϖ^d f₂)` are distinct exactly when `f₁ ≢ f₂` modulo the maximal ideal; it should be only the "if" direction, since `f₁ = 1`, `f₂ = 1 + x₁x₂` have equal residues and distinct ideals; affects a stated result.
- **Misprint** in BHHMS23 at the note below Table 5, printed page 45: the note says the constants and tails come from Tables 1–2; it should be Tables 2–3, the tables of the shapes `wt^(2,1)` and `t^(1,2)` that Table 5 covers; affects nothing.
- **Misprint** in BHHMS23 at the proof of Theorem 8.3.9, printed page 102: the type-indexing condition twists `σ_v` by `N_{k/𝔽_p} ∘ det^{−1}` while the displayed bijection `ι` four lines later twists by `N_{k/𝔽_p} ∘ det`; it should use one twist in both places, the inverse one of the indexing condition; affects nothing.
- **Gap** in BHHMS23 at Lemma 4.1.2, printed page 27: the "only if" direction concludes from the length `2^f` of `P̃_σ[1/p]` alone; it should also note that the `2^f` constituents `σ(τ_w̃) ⊗ χ`, `w̃ ∈ X(σ)`, are pairwise non-isomorphic, which follows from equation (20) and the bijectivity of `θ`; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2b3a5ca72195646409c571d5f37cabe926134632", "job": "REV-PKG-LocalGaloisDeformationRingsPartII", "model": "fable", "worker": "chris-x13"} -->
