# Review of LatticePackingsAndPerfectForms (pull request #1723 at 5efad72)

**Verdict:** accepted

Incremental re-review of 91 changed lines since `56e4327`. No finding remains: the three findings of the previous report are repaired as written there, the repairs introduce no new problem, and the gate passes.

## Previous findings

- R01 — repaired: `Suggested.lean:472–475` states `coveringRadius_gramForm_leechLattice` for every `Basis (Fin 24) ℤ TauCeti.leechLattice`; the Leech module is imported; the module docstring lists the headline; README 3.4 (`README.md:1067–1069`) names it.
- R02 — repaired: `fvIndex` (`Suggested.lean:680–683`) is `(discriminantOrthogonalHom L he).range.index`; `gramForm` (`:454–456`) is `(L.isPosDef_iff_posDef_map_gramMatrix b).mp hL`; README 7.5 drops the `Suggested.lean` clause and `Subgroup.closure` (three places).
- R03 — repaired: the description now reads "The README cites Tau Ceti and Mathlib at the revisions named at the top of its *Exact supplier contracts* section, which are the ones the branch and main pin."

## Verified sound

**Gate, build and order.**
- The worker's gate at this head: every check 0 (including `build=0`, `depcheck=0`, `outside-folder=0`), OK.
- Dependency check, run this round: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Candidate lines: GeometryOfNumbersAndQuadraticArithmetic 55, ProbabilisticAndMetricNumberTheory 62, WeightsInEtaleCohomology 147, this roadmap 148.
- `git diff --stat origin/main...HEAD` outside the folder is empty. `lake-manifest.json` pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the revisions `README.md:288–289` declares.
- `overlaps.md`: no open pull request changes this roadmap, drops an id it cites, or defines one it cites. `citations.md`: no unresolved cross-roadmap citation; the 12 "Lean names found nowhere" are the same 5 dotted names that `Suggested.lean` declares and 7 LMFDB knowl ids as in the previous round.

**Elaboration, signatures, padding.**
- `lake env lean` on `Suggested.lean` at this head: exit 0, 53 messages, all `declaration uses sorry` (52 at the previous head plus the new Leech theorem).
- `#check` on a scratch copy and the worker's `signatures.md` (111 declarations) agree for the three changed declarations:
  - `coveringRadius_gramForm_leechLattice : ∀ (b : Basis (Fin 24) ℤ ↥TauCeti.leechLattice.carrier), (gramForm TauCeti.isPosDef_leechLattice b).coveringRadius = √2`. This is README 3.4's sentence "in the real model of the Gram matrix of any `ℤ`-basis: `√2`"; no section variable is involved.
  - `gramForm` and `fvIndex` keep their types (`fvIndex : (L : IntegralLattice V) → [L.IsNondegenerate] → ℕ`); only the bodies changed.
  - The one dropped-binder lead is `polynomialsOfDegreeLE`, untouched and cleared earlier.
- One-tactic probe on a scratch copy (`first | rfl | (simp; done) | infer_instance | (norm_num; done) | trivial | (simp_all; done) | exact le_rfl | sorry` in place of each one-line `sorry`): 53 `sorry` warnings remain, so nothing closes, the new theorem included.
- Imports: `import Mathlib` and eleven `TauCeti.*` modules, all present at the pin. The three new ones supply `isPosDef_iff_posDef_map_gramMatrix`, `discriminantOrthogonalHom` and `leechLattice`; the two removed ones (`Matrix.PosDef.Basic`, `QuadraticForm.OrthogonalGroup.Basic`) were used only by the deleted proof and the deleted closure. `Discriminant.Quadratic` still supplies `discriminantQuadraticModule`, the codomain of `discriminantOrthogonalHom`.
- README and Lean agree on the changed passages: the new backticked name of README 3.4 is declared; README 7.5 and the `fvIndex` docstring both say "range of `discriminantOrthogonalHom`"; README 0.2 and the `gramForm` body both use `isPosDef_iff_posDef_map_gramMatrix`. `Subgroup.closure` occurs nowhere in the folder.

**Library declarations opened at the pin** (Tau Ceti `2fd255d9`; 7 this round).
- `TauCeti.IntegralLattice.isPosDef_iff_posDef_map_gramMatrix` (`TauCeti/LinearAlgebra/IntegralLattice/PosDef/Gram.lean:105`): `L.IsPosDef ↔ ((L.gramMatrix b).map Int.cast).PosDef` for `[Finite ι]` and any `K` with `[Field K] [LinearOrder K] [StarRing K] [TrivialStar K] [StarOrderedRing K]`; `K = ℝ` and `ι = Fin n` qualify.
- `TauCeti.IntegralLattice.Isometry.discriminantOrthogonalHom` (`Discriminant/OrthogonalGroup.lean:249`): `Isometry L L →* FiniteQuadraticModule.orthogonalGroup (L.discriminantQuadraticModule hL)`, a `codRestrict` of `discriminantGroupHom`; `discriminantOrthogonalHom_neg` (`:268`) sends `neg L` to `negOrthogonal`. It carries no finiteness or positivity hypothesis, which `fvIndex` does not need: `Subgroup.index` is total.
- `TauCeti.leechLattice` (`Rank24/Leech/Basic.lean:236`), an `IntegralLattice (Fin 24 → ℚ)`; `discriminant_leechLattice` (`:295`, value 1); `isPosDef_leechLattice` (`:299`); `finrank_leechLattice` (`:304`, value 24); `minimum_leechLattice` (`Rank24/Leech/Minimum.lean:173`, value 4). These are the five names on the *Needs:* line of 3.4.
- Neither pinned library has a covering radius or a deep hole of the Leech lattice (no hit for `coveringRadius`, `covering_radius` or `deepHole` in Tau Ceti), so the new theorem restates nothing.

**Ownership.** `roadmaps grep` for the covering radius or deep holes of the Leech lattice over main and the open heads returns this roadmap only. The closest roadmaps in vocabulary (ThetaSeries, IntegralLattices, GeometryOfNumbersAndQuadraticArithmetic, OrthogonalTamagawaAndLatticeMass) were compared in earlier rounds and the diff adds no object beyond this theorem.

**Headlines.** The module docstring's list now includes the covering radius of `Λ₂₄`. The only README material it names as not stated is the bundled integral-lattice tensor product of 7.1–7.3 (carrier absent at the pins; 7.2 is stated on the Kronecker Gram matrix), unchanged since the previous round. The deep-hole classification stays a README target of 3.4, the route to the headline.

**Seeded sample.** Of the 15 sampled targets (0.3, 1.3, 1.4, 1.6, 1.7, 1.9, 2.3, 3.4, 4.2, 4.5, 4.6, 5.3, 5.4, 6.2, 7.4), 3.4 lies in a changed passage and 7.4 is cited by the changed 7.5. For 3.4 the diff adds no locator: the value rests on the existing citation of Conway–Sloane, Ch. 23 (see *Not verifiable*), and the statement was checked by the values in the table. For 7.4 the pinned declarations were opened as above. The other thirteen are untouched; rows for 1.6/1.7, 1.9, 2.3, 4.2, 4.5, 4.6, 5.3, 5.4, 6.2 are carried below.

**Adversarial pass.** The first five rows were computed this round. Rows marked "(carried)" are rows of the previous report (the review at `56e4327`, which itself carried most of them from the review at `75708d3`) for statements this diff leaves untouched.

| Statement | Instances | Values computed on each side | Result |
| --- | --- | --- | --- |
| 3.4 `coveringRadius_gramForm_leechLattice` (new) | `Λ₂₄` with any basis; the rescaled model with minimum 2; a second basis `b' = bU`; existence of a basis | pinned minimum 4 and discriminant 1, so the Gram form has min 4, det 1, `ρ = 1`; `μ² = 2`, `μ = √2 = 1.41421`, `μ/ρ = √2`; `Θ = V₂₄·(√2)²⁴/√1 = 2¹²π¹²/12! = 4096·924269.18/479001600 = 7.9035`, the README Check. The minimum-2 scaling would give `μ = 1`, excluded by `minimum_leechLattice = 4` with `minimum_eq_min`. `infDist` to `ℤⁿ` in `FormSpace (UᵀAU)` is that of `FormSpace A` transported by `U`, so the value is basis-free. `finrank = 24` over the PID `ℤ` gives a basis indexed by `Fin 24`, so the quantifier is not empty | Pass |
| 0.2 `gramForm` (changed proof term) | I₂ in basis `(e₁, e₁+e₂)`; Gram [0]; rank 0 | cast Gram `[[1,1],[1,2]]`: det 1, trace 3, PD on both sides of the cited iff; [0]: lattice not PD and `[0]` over ℝ not PD (hypothesis `hL` fails, no value produced); `n = 0`: empty matrix PD, zero lattice PD. Type unchanged, so `gramForm_eq_actGL`, `minimum_eq_min`, `kissingNumber_eq_kissingNumber` read as before | Pass |
| 7.5 `fvIndex` (changed body: range in place of closure of the range) | `[12]`, `[8]`, `[6]`, `A₂`; odd `[3]` | `[12]`: `O(q) = {u : u² ≡ 1 mod 24} = {1,5,7,11}`, range `{1,11}`, index 2; `[8]`: `u² ≡ 1 mod 16` gives `{1,7}`, index 1; `[6]`: `{1,5}` mod 12, index 1; `A₂`: `O(ℤ/3,q) = {±1}`, index 1; `[3]` takes the odd branch (unchanged): `{1,2}`, index 1. The range of a homomorphism is a subgroup, so it equals the closure used before: same numbers | Pass |
| 7.5 `fvIndex_rankOne` (statement unchanged, unfolds the changed body) | m = 3, 5, 6, 8, 12, 15, 24 | filter counts 2, 2, 2, 2, 4, 4, 4 (m = 15: 1, 4, 11, 14; m = 24 mod 48: 1, 7, 17, 23), halved: 1, 1, 1, 1, 2, 2, 2 = order of `O(D_L)` over image order 2 (`−1 ≠ 1` in `ℤ/m` for `m ≥ 3`) | Pass |
| 7.5 prose and *Needs:* (changed) | names on the line against the pin | `MonoidHom.range` and `Subgroup.index` are what the Lean body uses; `discriminantOrthogonalHom`, `discriminantOrthogonalHom_neg` exist at the lines above; `−1 ↦ −1` gives index 1 when `O(D_L) = {±1}`: `A₂` 2/2 = 1 | Pass |
| 7.4 even case: `discriminantOrthogonalHom` (new citation) | `L = [12]`, `g = −1`; `2I₃`, f = (12), g = (23) | `−1` acts on `ℤ/12` as `u = 11`, `11² = 121 ≡ 1 mod 24`, so it lies in `O(q) = {1,5,7,11}`; pin: `discriminantOrthogonalHom_neg` gives `neg L ↦ negOrthogonal`; `(f·g)(e₁/2) = e₂/2` and `(g·f)(e₁/2) = e₃/2`, matching `map_mul'` of `discriminantGroupHom` (`mul_def` then `trans`) | Pass (carried) |
| Worked example `A₃` label (changed) | Gram `[[2,−1,0],[−1,2,−1],[0,−1,2]]` | det = 2·3 − 1·2 = 4; `4A⁻¹ = [[3,2,1],[2,4,2],[1,2,3]]` has odd diagonal, `8A⁻¹` is even, so level 8; prefix `3.4.8` = dim.det.level | Pass (carried) |
| Scope line `LLL-reduced bases: GoN` (changed) | GoN Layer 5 | heading "Layer 5: LLL-reduced bases" and `IsLLLReduced` (5.1.2) with δ = 3/4, η = 1/2; no `hex-lll` claim remains in this README | Pass (carried) |
| 0.1 `actGL` order | U = [[1,1],[0,1]], V = Uᵀ | U then V: [[5,3],[3,2]]; reverse: [[2,3],[3,5]] | Pass (carried) |
| 0.4 shells | [1], t = −1, 0; [2], t = 2 | shells ∅, {0}, {±1} (sizes 0, 1, 2); `sphere 0 √(−1) = {0}`, so `t ≥ 0` is needed | Pass (carried) |
| 0.5 contragredient | I₂, U as above | `(U•A)⁻¹` = [[2,−1],[−1,1]] = `U⁻ᵀ•A⁻¹`; acting by U⁻¹ gives [[1,−1],[−1,2]] | Pass (carried) |
| 1.1 `min`, `minimalVectors` | diag(1,4); I₂; [1]; rank 0 | min 1, S = {±e₁}, kiss 2; kiss 4; sublevels C = −1, 0, 1 give ∅, {0}, {0,±1}; `sInf ∅ = 0` | Pass (carried) |
| 1.5 γ, δ, Δ, γ′ | diag(1,4); [4]; diag(1,1,4); A₂ | 1/2, 1/8, π/8 = 0.39270, (γ/4)¹ = 1/8; 1, 1/2; 0.62996 · 0.39685 → γ′ = 0.5; γ(A₂) = γ(A₂⁻¹) = 1.15470 | Pass (carried) |
| 1.7 `hermite_le_minkowski` | n = 1, 2, 3, 4, 8, 24; [4] | bound 1, 1.27324, 1.53934, 1.80063, 2.81814, 6.73398 ≥ γₙ = 1, 1.15470, 1.25992, 1.41421, 2, 4; [4]: 4 = 4 | Pass (carried) |
| 1.8 `hermite_le_pow` | same n; A₂ | bound 1, 1.15470, 1.33333, 1.53960, 2.73707, 27.33981 ≥ γₙ; A₂ attains equality | Pass (carried) |
| 1.9 coordinate bound | A₂ | (A⁻¹)₁₁ = 2/3, x₁² ≤ 2·2/3 = 4/3; ∏Aⱼⱼ/det = 4/3; C₂ = 4/π = 1.27324 ≥ 1 | Pass (carried) |
| 2.1 `hermiteConstant_pow_le` | n = 2, …, 8 | 1 ≤ 1; 1.25992 ≤ 1.33333; 2 ≤ 2; 3.48220 ≤ 4; 7.69200 ≤ 8; 19.50422 ≤ 21.33333; 64 ≤ 64 | Pass (carried) |
| 2.2 `exists_hermite_eq_hermiteConstant` | n = 1; n = 0 | [1] gives 1 = γ₁; at n = 0, `hermite = 0 ≠ 1 = hermiteConstant 0`, so `0 < n` is needed and present | Pass (carried) |
| 2.3, 4.10, 4.11 constants | A₂, A₃, D₄, D₅, E₆, E₇, E₈, Λ₂₄ | 4/3; 8/4 = 2; 16/4 = 4; 32/4 = 8; 64/3; 128/2 = 64; 256; Leech 4/1^{1/24} = 4 | Pass (carried) |
| 3.1 cell, relevance | [4]; I₂; A₂ | metric length 2 = √4; area 1; coset e₁ + 2ℤ²: only ±e₁ (relevant); (1,1) + 2ℤ²: four vectors of norm 2 (not relevant); coset of e₁−e₂ in A₂: ±(e₁−e₂) norm 2, ±(e₁+e₂) norm 6 | Pass (carried) |
| 3.2 μ, deep holes, Θ ≥ 1 | [4]; I₂; rank 0 | μ = ρ = 1; μ = 0.70711 > ρ = 0.5 with deep hole (½,½) a vertex; Θ = π/2; rank 0: μ = 0 and cell = {0} = its extreme points | Pass (carried) |
| 3.3 Jarník (index i − 1) | I₂; diag(1,4) | 0.5 ≤ 0.70711 ≤ 1 ≤ 1; 1 ≤ 1.11803 ≤ 1.5 ≤ 2 | Pass (carried) |
| 4.1 `IsPerfect` and its three theorems | I₂; A₂; D₄; E₈; rank 0 | span rank 2 of 3, 3 of 3; kiss 6 ≥ 6, 24 ≥ 20, 240 ≥ 72; rank 0: 0 = 0 | Pass (carried) |
| 4.2 eutaxy | I₂; A₂; [[2,1],[1,3]] | ∑xxᵀ = 2I, c = 1/2 = 2/(4·1); Q = [[4,−2],[−2,4]] = 6A⁻¹, c = 1/6 = 2/(6·2); (A⁻¹)₂₂ = 2/5 against 0 | Pass (carried) |
| 4.4 QA scalar | A₂, U = [[−1,−1],[0,1]] | UᵀAU = A; UQ = [[−2,−2],[−2,4]] ≠ QU = [[−4,−6],[2,6]]; QA = 6I | Pass (carried) |
| 4.5 `isExtreme_iff` | A₂; I₂; [[2,1],[1,3]]; ranks 0, 1 | T ↔ T∧T; F ↔ F∧T; F ↔ F∧F; rank 0: T ↔ T∧T; rank 1: γ ≡ 1, span 1 = 1, `[1/a] = c·(2[1])` with c = 1/(2a) | Pass (carried) |
| 4.6, 4.7 finiteness | ranks 1, 2 | perfect classes 1 ([1]) and 1 (A₂); I₂ is eutactic but not perfect | Pass (carried) |
| 4.9 `voronoiNeighbour` | A₂, N = [[0,−1],[−1,0]]; P = N = [1] | `P + tN` is PD for −1 < t < 3; min = 2 iff 0 ≤ t ≤ 2, so ρ = 2 and the neighbour is [[2,−1],[−1,2]], min 2; rank 1: set {0}, ρ = 0, neighbour [1] | Pass (carried) |
| 4.10 `perfectForms_complete` | rank 2, s = {A₂} | the neighbour [[2,−1],[−1,2]] = diag(1,−1)ᵀA₂diag(1,−1) is similar to A₂, so s is closed and meets the only class | Pass (carried) |
| 4.11 Cohn–Elkies | r = 2, f(0)/f̂(0) = 1; f ↦ 3f | δ ≤ 1; Leech δ = (√4/2)²⁴/√1 = 1; ratio 3/3 = 1 | Pass (carried) |
| 5.2 moments | {±1}; four unit vectors of I₂ | j = 0, 1: each side 2; I₂: j = 1 gives 2 = 4/2, j = 2 gives 2 against 1.5, so a 3-design and not a 5-design | Pass (carried) |
| 5.3 2-design ↔ strongly eutactic; 4-design ⇒ perfect | I₂; [[2,1],[1,3]]; A₃ (D₃ model) | I₂: both true (c = 1/2, moment 2 = 4·1/2); [[2,1],[1,3]]: both false; A₃ fourth moment 8 against 48/5 = 9.6 | Pass (carried) |
| 5.4 Gram Laplacian | diag(1,4); E₈ (Mathlib order) | X₀²−X₁²: 2 − 2/4 = 3/2; X₀²−4X₁²: 0; E₈: (A⁻¹)₀₀ = 4, (A⁻¹)₇₇ = 2; X₀²−X₇²: 4 and shell sum 60·4 − 60·2 = 120; X₀²−2X₇²: 0 and 240 − 240 = 0 | Pass (carried) |
| 5.5 Hecke–Bochner | τ = i, d = 1, 2; d = 0 | (i/i)^{−n/2} = 1; i^{−1} = −i, i^{−2} = −1; (τ/i)^{−d}(−i)^d = τ^{−d}; d = 0 recovers `(τ/i)^{−n/2}` | Pass (carried) |
| 5.6 `exists_cuspForm_harmonicTheta` | E₈, d odd; d even | Θ(−1/τ) = (−1)^d τ^{k+d} Θ(τ); d odd gives Θ ≡ 0, a cusp form; P = 2: coefficients 2 and 480 | Pass (carried) |
| 5.7 Venkov | n = 8, 16, 24 | t = 11 − 4r = 7, 3, 11; n = 24: S₁₄…S₂₂ have dimensions 0, 1, 1, 1, 1 < 2; dim S₂₄ = 2; n = 16, d = 4: dim S₁₂ = 1, not < 1 | Pass (carried) |
| 6.1 representation | ℤ³; ℤ⁴; A₂; 2I₄; [2] | ℤ³ misses 7, 15, 23, 28, 31, 39, 47, 55, 60, 63; 7 = 4+1+1+1; A₂ half-norms 1, 3, 4, 7 (2 missed); [2] half-norms are k² | Pass (carried) |
| 6.2 escalation | [1]; 2ℤ⁴ | truant 2; escalations `[[1,a],[a,2]]` with \|a\| ≤ 1 have det 2 or 1, giving Esc₁ = {diag(1,2), I₂}; 2ℤ⁴: min 4, truant 1, index 2 after adjoining e₁ | Pass (carried) |
| 6.3 15 theorem | ⟨1,2,5,5⟩; ⟨1,2,5,10⟩; ⟨1,1,2⟩ | misses below 2000: {15}; below 300: none; truant 14 | Pass (carried) |
| 6.4 290 theorem | 2I₄; [2]; list | all 29 represented; misses 2; README 1744–1745 and the Lean `Finset` both have 29 entries | Pass (carried) |
| 7.1 Kronecker Gram | A₂⊗A₂; A₂⊗D₄ | [[4,2,2,1],[2,4,1,2],[2,1,4,2],[1,2,2,4]], det 81 = 3²·3²; 3⁴·4² = 1296 | Pass (carried) |
| 7.2 `min_tensor_kitaoka` | A₂⊗A₂; [√2]⊗[3]; C = [1] for A = B = [2]; n = 0 | min 4 = 2·2 with 18 minimal vectors and #Aut 144 (enumerated); 3√2 = √2·3; hC rules out C = [1]; 0 = 0·min B | Pass (carried) |
| 7.3 determinant criterion | diag(1,1,2,3); diag(1,1,1,1,1,12); ℤ⁴ | 6 is not a square d₁²d₂²; the exponent of 3 in d₁³d₂² is never 1; det 1 decides nothing | Pass (carried) |

## Not verifiable

- Conway–Sloane, *SPLAG*, Ch. 23 (the source of the theorem now stated in `Suggested.lean`), and Ch. 25: paywalled, cited by locator, as recorded in the earlier rounds. The value was checked against the standard covering density `7.9035` of the Leech lattice, computed above; the chapter text and the count of 23 classes of deep holes were not read.
- The LMFDB record `3.4.8.1.2` for `A₃` (untouched text): as in the previous report, only the label prefix was checked.

## Source issues

- none
