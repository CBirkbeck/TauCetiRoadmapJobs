# Review of DynamicalDegreesOfRationalMaps (pull request #2431 at 14cf9af)

**Verdict:** needs changes

## R01 (P3) — `mixedDegree_baseChange` restates a pinned Tau Ceti theorem term by term

**Location:** `TauCetiRoadmap/DynamicalDegreesOfRationalMaps/Suggested.lean:215`; `README.md:535` "The first equality, for real classes `L` and `M`, … is the acceptance statement `mixedDegree_baseChange`"; `README.md:71` "`mixedDegree_baseChange` uses it for `Γ_f ×_K Spec K'`"; `README.md:151`.

**Claim:** Every term of `realIntersection` is a signed sum of `finrank` of `H^i` of an invertible sheaf on `graph f`. On the base change the sheaf is pulled back along `pullback.fst`. The pinned library already proves that these dimensions do not change, so the theorem is bookkeeping (`Finsupp.mapDomain`, class pullback), not a headline. The README cites this content only through CyclotomicClassGroupsAndStickelberger §4.3 and never names the pinned declaration.

**Witness:** `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback` (TauCeti/AlgebraicGeometry/Cohomology/FlatBaseChange.lean:277): for any field extension and quasi-coherent `M` on a quasi-compact scheme with affine diagonal, `finrank_{K'} Hⁿ(X_{K'}, g^*M) = finrank_K Hⁿ(X, M)`.

**Repair:**
- Delete `mixedDegree_baseChange` from `Suggested.lean`.
- In README §4.3, replace "is the acceptance statement `mixedDegree_baseChange`" with "follows term by term from Tau Ceti's `TauCeti.AlgebraicGeometry.finrank_cohomology_pullback_eq_of_isPullback`".
- Add that declaration, with its file and line, to "From Tau Ceti" and to the *Needs:* line of §4.3.
- At line 71, drop the clause naming `mixedDegree_baseChange`, together with `CategoryTheory.Limits.pullback` and `canonicallyOverPullback`, which nothing else uses. Keep `CategoryTheory.IsPullback`.
- At line 151, drop "and their invariance under extension of the field, computed on the base-changed graph (§4.3)". `dynamicalDegree_baseChange` remains the headline for field extension.

## R02 (P3) — The description announces the dependencies but names none

**Location:** Pull-request description: "Dependencies (the roadmaps the README cites by name and section, and what they in turn need; the Lean imports none of them). … Roadmaps on main are cited by name; everything else named in the README is a consumer, not a prerequisite."

**Claim:** No supplier is named. The merge-order block lists 106 open pull requests (the transitive closure) without marking the three this README cites. None of the five suppliers on main appears.

**Witness:** README "Exact supplier contracts" (lines 91–141) cites five roadmaps on main, plus ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3, LefschetzPencilsAndVanishingCycles §5.1 and ArithmeticDynamics §§0.18, 0.26, which are open (#1833, #873, #1335 in the block).

**Repair:** Replace the first sentence of that paragraph with: "Dependencies. On main: CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometry §§1.4, 5.4; AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.2, 1.4–1.7; SchemeAndStackFoundations §§0.3, 0.7, 0.11, 0.20, 0.30, 2.6, 3.3, 4.11–4.13, 4.16, 4.19, 5.1–5.3, 5.9, 5.10; StableReduction Layer 2. Open, in the merge order: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3; LefschetzPencilsAndVanishingCycles §5.1; ArithmeticDynamics §§0.18, 0.26 (Checks only)."

## Verified sound

| Statement | Instances tried | Values computed (left / right) | Result |
| --- | --- | --- | --- |
| §1.1 `e(f)` (sample) | `z²` on `ℙ¹`; Frobenius of `ℙ^d`; projection `ℙ² ⤏ ℙ¹` | `[K(z):K(z²)] = 2` in every characteristic; `p^d`; `0` (trdeg 1, junk), excluded by the finiteness item | holds |
| §1.1 rank vs `e` | cusp normalization `K[t²,t³] ⊆ K[t]` | rank `1 = e`; fibre at cusp `K[t]/(t²)`, dimension `2` | holds; Check is correct |
| `graph_isIntegral_and_projections` | constant `ℙ¹ → ℙ¹`; Cremona `σ` | `Γ = ℙ¹×{pt}`, `π₂` not onto (implication needs dominance); `π₁` fibres over three points are lines | holds |
| Conventions `numericalIntersection` | `ℙ¹`, `O(−2)`, `r = 1`; truncation at `1` | `χ(O(−2)) − χ(O) = −1 − 1 = −2`; truncation at 1 gives `−1` | holds |
| `realIntersection` well-defined | `ℙ¹×ℙ¹`, `a + b − c` with `c = O(1,1)` | `2 − 4 + 2 = 0`; `(a+b)² = 0+1+1+0 = 2 = c²` | holds |
| `IsNef` on classes | `2·O(1,1) − O(1,0)` on `ℙ¹×ℙ¹` | degrees `1, 2` on the rulings: nef despite a negative coefficient | holds |
| §2.1 component formula (sample) | `Spec K[ε]/ε²`; `V(xy) ⊂ ℙ²`; line ∪ point | `2 = 2·1`; `2 = 1+1`; `1` (point ignored) | holds |
| §2.2 Chow comparison (sample) | `Bl_p ℙ²`, `E²` | `n₁n₂`-coefficient of `χ(O((n₁+n₂)E))` is `−1`; `deg O_E(E) = −1` | holds |
| §2.4 reduction | `x² + ty²` over `𝔽₂(t)`; `ℙ¹_ℂ/ℝ` | `K' = K(√t)`, `c_V = 2`, `(O(1)) = 2 = 2·1`; `c_V = 2`, `2 = 2·1` | holds |
| §3.1 approximation | `E×E`, `(2.41, 3.41, −1.42)`, `δ = 1/5` | det `−0.0463` → `0.5897`; `N = 100`: matrix `[[119,142],[142,219]]`, det `5897` | holds |
| §3.1 `A` on `E×E` | `A + I` decomposition into four nef bundles | entries `(2, √2, 3)` recovered; `5 − 3√2 > 0` | holds |
| §3.2 Kleiman (sample) | `O(1,0)²`; `O(1,−1)²`; double line `V(x²)` | `0 ≥ 0`; `−2` (not nef); `χ = 2n+1`, value `2` | holds |
| §3.3 Siu | `ℙ¹×ℙ¹` `(1,1),(1,0),(0,1)`; `E×E` `A₀+I, A₀, I` | `2 = 2`; `24 ≤ 30` | holds |
| §3.4 Hodge | `Bl_p ℙ²`, `H = 2L+E`; `H = E₁` on `Bl₂ ℙ²` | `1 ≥ −3`, `4 ≥ 3`; `0 < 1` (hypothesis `H² > 0` needed) | holds |
| `khovanskii_teissier` (sample) | `(2,1),(1,1)` on `ℙ¹×ℙ¹`; `E×E` `A₀, I`; `ℙ²⊔ℙ²` | `9 ≥ 8`; `9 ≥ 0`; `16 < 25` (non-integral, excluded) | holds |
| `siu_inequality_products` (sample) | `(ℙ¹)³`, `B = Σhᵢ`; `i = 0`; `i+j = 0`; `ℙ²⊔ℙ²` | `6 ≤ 8` (`binom` gives 6=6); equality; `[L:K]²` both; `5 > 2` (excluded) | holds |
| `mixedDegree` convention (§4.1, sample) | `z²` on `ℙ¹`, `H`; model `q₁ = f`, `q₂ = f∘f` | `deg₀ = 1`, `deg₁ = 2`; model gives `2 = 2·1` | holds |
| `mixedDegree_pos` | `id`, `O(1,0)`; `id`, `O(1,0)+O(0,1)` | `0` (hypothesis `>0` fails); `2 > 0` | holds |
| `mixedDegree_boundary` | `d = 0`, `Spec L₁ → Spec L₂` | `[L₁:K] = [L₁:L₂]·[L₂:K]` | holds |
| `mixedDegree_baseChange` (§4.3 sample; R01) | `ℙ¹_ℂ/ℝ`, `id`, `O(1)` | `2` over `ℝ` = `1 + 1` over `ℂ`; each `χ` term equal by FlatBaseChange.lean:277 | true; R01 |
| `mixedDegree_comp_le` (§4.4 sample) | `z²∘z²`; Cremona; `E×E`, `L₂ = I`; `L₂ = O(1,0)` | `4 ≤ 4`; `1·1 ≤ 2·2·2`; `2·0 ≤ 2·9`; `0 ≤ 2`, `0 ≤ 0` | holds |
| `exists_mixedDegree_comparison` (§4.5 sample) | swap on `ℙ¹×ℙ¹`; swap on `E×E` | `C = 9`, ratio `5/2`; `C = 25`, degrees `2, 9` | holds |
| `exists_mixedDegree_birational_comparison` | `d = 0`, `K`-isomorphism | both degrees `[L:K]`, `C = 1` | holds |
| `tendsto_dynamicalDegree` (§5.1 sample) | `ω = H/2`, `f = id`; `d = 0` | `λ = 1`; infimum without `C_k` is `2^{−d} < 1`, with `C_k` it is `1`; `d = 0`: `1 = 1` | holds |
| `one_le_dynamicalDegree` | Cremona; Frobenius | `λ₁ = 1`; `p^k` | holds |
| `dynamicalDegree_eq_of_polarizations` | swap, `ω, ω'` on `ℙ¹×ℙ¹` | `deg(τ^{2n})` constant for both, `λ = 1 = 1` | holds |
| `dynamicalDegree_iterate` | `m = 0` | `λ(id) = lim (ω^d)^{1/n} = 1 = λ⁰` | holds |
| `dynamicalDegree_zero_and_top` | Frobenius; `d = 0`, `σ ∈ Aut(L/K)` | `λ_d = p^d = e`; `λ₀ = 1 = [L:σL]` | holds |
| `dynamicalDegree_log_concave` | Fibonacci; extension of `(x², y)` | `φ² ≈ 2.618 ≥ 1`; `4 ≥ 2` | holds |
| `dynamicalDegree_birational_conj` (§5.3 sample) | Cremona conjugated by `PGL₃` | `λ₁ = 1` both sides | holds |
| `dynamicalDegree_baseChange` | Frobenius `𝔽_p → 𝔽_p(t)`; absolute Frobenius | `λ_k = p^k` both; absolute Frobenius not over `𝔽_p(t)`, excluded by `f'.IsOver` | holds |
| `algebraicEntropy_iterate` | `n = 0` | `h(id) = log 1 = 0 = 0·h` | holds |
| `algebraicEntropy_bounds` | `d = 0`; `z²` on `ℙ¹` | `0 ≤ 0 ≤ 0·log 0 = 0`; `log 2 ≤ log 2 ≤ log 2` | holds |
| §6.1 forms (sample) | Cremona chart overlap; `(x₀², x₀x₁, x₀x₂)`; constant then `σ` | factor `x₁/x₀`; identity, degree 1; `G(F) = 0` | holds |
| §6.3 Fibonacci (sample) | `n = 1, 2, 3` | `[yz:xy:z²]`, `[xyz:xy²:z³]`, `[xy²z²:x²y³:z⁵]`; degrees `2, 3, 5 = fib(n+2)` | holds |
| §6.4 affine maps (sample) | `(y, z, x+yz)`; `(x, xy)`; Hénon | degrees `2, 3, 5`; fibre over `(0,1)` empty; `4 = 2²` | holds |

- Source locators checked against the text: 58, in 13 sources (6 Stacks lemmas in Morphisms, 6 in Varieties, 1 in Chow, 1 in Constructions; Kleiman 2; Cutkosky 4; Dang 8; Dang–Favre 6; Dinh–Sibony 5; Guedj 3; Russakovskii–Shiffman 5; Silverman 5; Truong 6).
- Library declarations opened at the pins: 60 Mathlib file:line citations and 41 Tau Ceti citations, all resolved. Also `IntersectionNumber/Basic.lean:111`, `LineBundle/Degree.lean:130`, `Cohomology/EulerCharacteristic.lean:105`, `Cohomology/FlatBaseChange.lean:277`, `Birational/AlgHom.lean`.
- Cross-roadmap citations resolved: 34 sections, every one present with the content claimed.
  - On main: CyclotomicClassGroupsAndStickelberger §4.3; AlgebraicModuliForArithmeticGeometry §§1.4, 5.4, 9.10; AlgebraicModuliForArithmeticGeometryPartII §§0.1, 1.1, 1.2, 1.4–1.7; SchemeAndStackFoundations, 17 sections, also present at #1808's head; StableReduction Layer 2.
  - At open heads: ArakelovGeometryAndAbelianHeightsPartII §§0.1, 0.3 (#1833); LefschetzPencilsAndVanishingCycles §5.1 (#873); ArithmeticDynamics §§0.18, 0.26 (#1335).
- Gate: all checks pass. Dependency check: `depcheck: 243 roadmaps, 2270 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` gives 19 `sorry` warnings and nothing else. Re-running `#check @` on all 32 declarations shows no binder lost; every type matches its README statement.
- One-tactic probe (`rfl | simp | infer_instance | positivity`): 0 of 19 theorems close.
- Overlap check: read NashBlowups, AdicCoefficientsAndComparisonsPartII, ArakelovGeometryAndAbelianHeightsPartII, SchemeAndStackFoundations (#1808 and main), K3SurfacesAndSymplecticBoundedness, AlgebraicModuliForArithmeticGeometryPartII, JacobianChallenge. Three objects are shared, each owned by the supplier and cited here: Siu's volume inequality (ArakelovGeometryAndAbelianHeightsPartII §0.3), nefness and Kleiman (AlgebraicModuliForArithmeticGeometryPartII §§1.5, 1.7), and ample-and-nef log-concavity on smooth varieties (AlgebraicModuliForArithmeticGeometry §9.10, which §3.5 generalizes, difference stated). No other roadmap mentions dynamical degrees, algebraic entropy or the graph of a rational map.
- Source independence: 26 passages compared with 13 sources, none sharing wording beyond forced formulas and theorem names. Largest share: dangfavre2021, 16 of 101 locators.
  - Against dangfavre2021 §§1–6: only §1 overlaps Layers 3–5 in part, and §6 overlaps §6.4.
  - Against dang2020 §§1–3, 5: these line up with Layers 2, 3 and 4–5, but the *Needs:* chain §3.6 → §4.4 → §5.1 forces that order. Layer 1 and Dang §§4, 6–9 have no counterpart.
  - Result: independent.

## Not verifiable

- `lazarsfeld2004` Theorems 1.4.9, 1.6.1, 2.2.15 and Corollaries 1.4.10, 1.6.3: paywalled, recorded as uncertified. dangfavre2021 line 466 corroborates Corollary 1.6.3. dang2020 lines 65, 842 and 845 cite Siu's criterion as Theorem 2.2.13, not 2.2.15; the text that would settle which is right was not read.
- `fulton1998` Theorem 1.4 and Proposition 2.5: paywalled, recorded as uncertified; not read.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1 and Theorem 3.4.4, pp. 17–18: the source says Siu's inequality and its product form hold for every closed subscheme `V`, false for `V = ℙ²×{p} ⊔ {q}×ℙ²` in `ℙ²×ℙ²`, `A = O(1,2)`, `B = O(2,1)`; it should be stated for `V` whose cycle is a multiple of one irreducible variety, as the main proofs use it; affects a stated result.
- **Error** in dinhsibony2005 at Corollaire 7, proof, p. 7: the source says the limit of `δ_l(f^n)^{1/n}` is `inf_n δ_l(f^n)^{1/n}`, false for `f = (z², w)` on `ℙ¹×ℙ¹` with `∫ω² = 1`, where `δ₁(f) = 3/2 < 2 = λ₁`; it should be `inf_n (c_X δ_l(f^n))^{1/n}`; affects the proof.
- **Misprint** in silverman2014 at Example 6, p. 9: the source says `deg(ϕ^n) = F_n` for `ϕ = (y, z, x + yz)`; it should be `F_{n+2}`, since the degrees are `2, 3, 5` for `n = 1, 2, 3`; affects nothing.

## For the human reviewers

- none
