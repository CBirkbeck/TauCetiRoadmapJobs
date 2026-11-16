# Review of RobustnessCertificates (pull request #2426 at 98e5d51)

**Verdict:** needs changes

## R01 (P2) — 6.1 asks for an executable checker

**Location:** `TauCetiRoadmap/RobustnessCertificates/README.md` lines 237–239: "Give a decidable check that a rational `M` equals `L diag d Lᵀ` with `L` lower unitriangular and `d ≥ 0`, and prove it sound for `M ⪰ 0`. Use it to discharge the LipSDP condition of 6.2 by computation."

**Claim:** This target is a procedure and its soundness proof, not a mathematical statement; roadmaps carry the mathematics behind an algorithm, not the algorithm.

**Witness:** The condition it is meant to discharge needs no procedure: the Schur matrix of 6.2 is `diag(1, 0)`, computed by hand in line 252.

**Repair:** Replace the bullet by: "Every positive semidefinite `M` over an ordered field factors as `L diag d Lᵀ` with `L` lower unitriangular and `d ≥ 0` (a zero pivot of a semidefinite matrix has a zero column below it); for the matrix of 6.2 the factorization is `L = 1`, `d = (1, 0)`." In the Summary replace "exact rational certificates that the kernel can check" by "rational `LDLᵀ` factorizations witnessing semidefiniteness".

## R02 (P2) — the multilayer LipSDP theorem is neither stated nor named as not stated

**Location:** `TauCetiRoadmap/RobustnessCertificates/Suggested.lean` lines 1–7 (module comment) and Layer 3, lines 84–131; README 3.3, lines 168–178.

**Claim:** README 3.3 (soundness for `MLPSpec ℝ L`, and feasibility of the product point) is a headline; `Suggested.lean` states only the one-hidden-layer case and its header names no headline as not stated.

**Witness:** `grep -n "MLPSpec" Suggested.lean` hits only lines 73, 152, 159, 164 (product bound and interval bounds); none in Layer 3.

**Repair:** Add to the module docstring: "Not stated: LipSDP soundness and product-point feasibility for multilayer perceptrons (README 3.3); the block matrix over the hidden widths of an `MLPSpec` (index `Σ i : Fin L, Fin (A.width i.castSucc)`, with the projections `E₀`, `E_{L-1}`, `P`, `Q`) is a README target and has no carrier at the pins."

## R03 (P2) — three statements fail or are ill-formed on degenerate inputs

**Location:** README lines 201–203: "gives a lower bound on `g_{ij}` that is at least `lo i - hi j`"; line 191: "with both bounds attained"; line 168: "For `A : MLPSpec ℝ L` whose hidden activations…".

**Claim:** 4.2 and the activation bullet of 4.1 need `l ≤ u`; 3.3 needs `1 ≤ L`.

**Witness:** `n = 1`, rows `a = a' = (1)`, biases `0`, `l = 1`, `u = -1`: `c = 0`, `r = -1`; specification bound `0·c − |0|·r = 0`, but `lo i − hi j = 1 − (−1) = 2`. For `L = 0` there is no `W_L` and no block `E_{L-1}`.

**Repair:** Line 190: "If `σ` is monotone and `l ≤ u` then … with both bounds attained (without `l ≤ u` only the inclusion holds)". Line 201: "For `l ≤ u` on the last hidden box, bounding the gap directly…". Line 168: "For `1 ≤ L` and `A : MLPSpec ℝ L`…"; add the instance above as a Check of 4.2. With `r = 1` the same data give `0 ≥ −2`.

## R04 (P3) — the gate fails on the import block

**Location:** `Suggested.lean` lines 9–13: `import Mathlib.Analysis.CStarAlgebra.Matrix` … `import TauCeti.Geometry.Neuromanifold.MLP.Basic`.

**Claim:** Gate rules `imports`, `mathlib-subimports` (4 hits) and `no-import-mathlib` fail: the file must import `Mathlib` once, then the `TauCeti.*` modules used.

**Witness:** Gate line: `imports=1 mathlib-subimports=4 no-import-mathlib=1 … FAIL`.

**Repair:** Replace lines 9–12 by the single line `import Mathlib` and keep line 13. Tested on a copy: it elaborates with `sorry` as the only warning.

## R05 (P3) — the pull request edits the top-level roadmap list

**Location:** `README.md` (repository root) line 49, added: "- [Certified robustness: Lipschitz margins, LipSDP and bound propagation](TauCetiRoadmap/RobustnessCertificates/README.md)".

**Claim:** A change outside the roadmap folder (gate rule `outside-folder`); the list is regenerated after merge, and the description does not mention the edit.

**Witness:** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/RobustnessCertificates'` gives `README.md | 1 +`.

**Repair:** Revert that line; the pull request then changes only `TauCetiRoadmap/RobustnessCertificates/`.

## R06 (P3) — no statement carries a source locator

**Location:** README Layers 1–5 throughout, e.g. line 90: "This is the Lipschitz-margin radius of Tsuzuku–Sato–Sugiyama."; References lines 285–298.

**Claim:** No theorem, definition or formula has a theorem number or page; Szegedy et al. and Megretski–Rantzer are cited by no statement; the README widens the source's hypotheses without saying so.

**Witness:** `grep -c "Thm\|Theorem\|Prop\|Lemma\|eq\. " README.md` is `0`. fazlyab2019 line 137 assumes `0 ≤ α < β`, line 284 `ρ > 0`; README has `α ≤ β`, `ρ ≥ 0`.

**Repair:** Put at the claims: 1.2 global (Tsuzuku et al., Prop. 1, eq. (2), p. 3); per-pair (ibid., Prop. 2, eq. (3), p. 3); 2.2 (Szegedy et al., §4.3, pp. 8–9); 3.1 definition and constraint (Fazlyab et al., arXiv v2, Def. 1, p. 3; Lemma 1, eq. (9), p. 4); 3.2 (ibid., Thm 1, eq. (10), p. 5); 3.3 (ibid., Thm 2, eq. (14), p. 6); 4.1 (Gowal et al., eqs. (6)–(7), p. 4); 4.2 specification layer (ibid., eq. (9), p. 4); 5.1 (Wong–Kolter, eq. (3), p. 3); 5.2 (Zhang et al., Thm 3.2 and Cor. 3.3, p. 4; Tables 2–3, p. 5). State in 3.2 that signed `α ≤ β` and `ρ ≥ 0` go beyond the source and follow from the same quadratic-form identity; mark 1.3, the Schur form and the product-point feasibility as having no source, or cite one. Drop Megretski–Rantzer or attach it to a statement.

## R07 (P3) — no definition has Checks; the certified radius has no carrier

**Location:** README lines 56–58: "The **certified radius** at `x` in a metric space is the supremum of the `r` such that…"; definitions at lines 79, 71–73, 154, 69, 184–187, 192–193, 221–223.

**Claim:** `CertifiedOn`, slope restriction, `M(ρ, t)`, the one-hidden-layer network, the affine interval bound, the prefix interval bounds and the relaxation pair `(λ_p, μ_p)` have no `**Checks.**` list; the supremum's type is not fixed.

**Witness:** `grep -c "Checks" README.md` is `0`. For `k = 1`, or constant gaps, every ball is certified: the supremum is `+∞`, and `sSup` in `ℝ` returns `0`.

**Repair:** Define the radius in `ℝ≥0∞`. Add at least three Checks per definition, among them: `t ↦ -t` is not slope-restricted in `[0, 1]` (`a = 1, b = 0` gives `(-1)(2) = -2`); ReLU is not in `[0, 1/2]` (`(1)(1/2 − 1) = -1/2`); the relaxation pair at `(a, l, u) = (-1, -2ε, 2ε)` is `(1/2, ε)`; `M(2, (2, 1))` for the 6.2 gap row has Schur matrix `diag(1, 0)`; the affine bound for `W = (1 1)`, `l = (1-ε, -1-ε)`, `u = (1+ε, -1+ε)` is `[-2ε, 2ε]`; for `f = id` on `EuclideanSpace ℝ (Fin 2)` and class `0`, `CertifiedOn` holds on the ball about `(1, 0)` of radius `r` exactly when `r ≤ 1/√2` (the tie line `x₀ = x₁` is at distance `1/√2`; a non-strict definition would also accept nothing larger, a closed ball would fail at `r = 1/√2`).

## R08 (P3) — README shape: no supplier contracts, no `*Needs:*`, no Lean names, missing sections

**Location:** README line 1: "# Certified robustness: Lipschitz margins, LipSDP and bound propagation"; lines 263–267: "Layer 2 uses 1.2 and `MLPSpec`. … Layer 5 uses Layer 4."

**Claim:** The title lacks `# Roadmap:`; `## Exact supplier contracts`, `## How to read the build`, per-layer `### Examples` and `### Dependencies`, and `## Downstream consumers` are absent; no target has a `*Needs:*` line; 28 of the 29 Lean names are not in the README; the layer-level dependencies are wrong.

**Witness:** Nothing in Layer 2 (lines 115–134) uses 1.2; line 133 uses the example of 6.2, a later layer. `grep -c "Needs" README.md` is `0`. Only `CertifiedOn` is named (line 79).

**Repair:** Retitle `# Roadmap: certified robustness by Lipschitz margins, LipSDP and bound propagation`; add the sections; move lines 263–267 into per-target `*Needs:*` lines (2.2: Mathlib `LipschitzWith.comp`, 2.1, Tau Ceti `MLPSpec.evalPrefix_succ`; 3.2 Schur form: Mathlib `Matrix.PosDef.fromBlocks₁₁`; 4.2: 4.1, 1.1; 5.2: 5.1); move the 6.2 comparison out of 2.2 into 6.2; name each kept `Suggested.lean` declaration at its statement.

## R09 (P3) — padding in `Suggested.lean`

**Location:** `Suggested.lean` lines 27–28 (`CertifiedOn.mono`), 93 (`slopeRestricted_relu`), 173–176 (`max_le_chord`, `mul_le_max`), 198–199 (`posSemidef_mul_diagonal_mul_transpose`).

**Claim:** Each closes in one step, restates a definition, is a special case of the preceding theorem, or is scalar algebra on free variables.

**Witness:** On a copy: `fun x hx => h x (hST hx)`; `simpa using slopeRestricted_of_monotone_of_lipschitzWith (K := 1) …`; `nlinarith […]` for `mul_le_max`; `simpa using (PosSemidef.diagonal hd).mul_mul_conjTranspose_same L` — all accepted.

**Repair:** Delete the five from `Suggested.lean`; the README keeps the statements (1.1, 3.1, 5.1 as API and Checks), and 6.1 cites Mathlib `Matrix.PosSemidef.diagonal` and `Matrix.PosSemidef.mul_mul_conjTranspose_same` instead of posing its first bullet as a target.

## R10 (P3) — operator-norm facts restated instead of cited

**Location:** README lines 117–118: "An affine map `x ↦ W x + b` on Euclidean spaces is `‖W‖₂`-Lipschitz, and `‖W‖₂` is the least such constant."; lines 121–122: "In `ℓ∞`, … `‖W‖_∞ = max_p Σ_q |W_{pq}|`, and this constant is the least one."

**Claim:** Both identify a matrix norm with an operator norm that Mathlib already has; the `ℓ∞` dual norm of 1.3 (`norm_dotProduct_clm_eq_sum_abs`) is the one-row case.

**Witness:** Pinned Mathlib: `Matrix.l2_opNorm_def` (`Analysis/CStarAlgebra/Matrix.lean:196`), `Matrix.l2_opNorm_mulVec` (`:220`); `Matrix.linfty_opNorm_def` (`Analysis/Matrix/Normed.lean:289`), `Matrix.linfty_opNorm_eq_opNorm` (`:480`).

**Repair:** In Scope and in 2.1 cite these four declarations and keep as targets only the Lipschitz corollaries; state 1.3's `ℓ∞` identity as "by `Matrix.linfty_opNorm_eq_opNorm` for the `1 × n` matrix of `a`".

## R11 (P3) — Lean form: header, docstrings, one statement narrower than the README

**Location:** `Suggested.lean` lines 1–7: "# Certified robustness: suggested interfaces"; lines 27, 90, 93, 142, 159, 164, 173, 176, 198, 201; lines 147–149.

**Claim:** The header is a plain comment before the imports, not a module docstring titled "target signatures" that lists the headlines not stated; ten declarations have no docstring; `exists_eq_ibpAffine_fst` states attainment of the lower bound only, the README (line 188) of both.

**Witness:** Line 1 is `/-`, not `/-!`; `theorem evalPrefix_mem_ibpBounds` (line 159) follows a blank line with no `/-- … -/`.

**Repair:** After the imports put `/-! # Certified robustness: target signatures` saying that the roadmap is `README.md`, that the file states its headline theorems against the pinned APIs, and the R02 sentence; add a docstring to each kept declaration; add the conjunct `∧ ∃ y ∈ Set.Icc l u, (W *ᵥ y + b) p = (ibpAffine W b l u).2 p` to `exists_eq_ibpAffine_fst`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 `CertifiedOn` | `S = ∅`; ball with `r > 0`; `k = 0, 1` | vacuous on `∅`; centre lies in ball so prediction at `x`; `k ≤ 1` no `j ≠ i` | holds | R07 Checks |
| 1.2 coordinate gap | `v = e_i − e_j`; sup norm | `|v_i − v_j| = 2`, `√2·‖v‖₂ = 2`; sup norm `2·1 = 2` | sharp both | none |
| 1.2 global certificate | `L = 0`; `ε ≤ 0`; `L > 0`, `‖y − x‖ < ε` | gap(y) `≥ m > 0`; ball empty; gap(y) `> m − √2 L ε ≥ 0` | holds; Tsuzuku Prop. 1 | R06 locator |
| 1.2 per-pair | `L_{ij} = 0`; `f` `L`-Lipschitz | gap(y) `= g(x) > 0`; gap constant `√2 L` | holds | R06 |
| 1.3 affine iff | `a_j = 0`; `X = 0`; `a ≠ 0` both directions | `0 < g` only; ball `{x}`, norm `0`; `inf_{‖v‖<r} a(v) = −r‖a‖`, not attained | iff holds, `r > 0` needed | none |
| 1.3 `ℓ∞` dual norm | `n = 0`; `a = (1, −1)` | `0 = 0`; `v = (1, −1)`, `‖v‖_∞ = 1`, value `2 = Σ|a_q|` | holds | R10 cite |
| 2.1 `‖W‖² ≤ λ ⟺ λ·1 − WᵀW ⪰ 0` | `n = 0, λ = −1`; `W = W₁` of 6.2 | LHS `0 ≤ −1` false, RHS empty matrix true; eigenvalues `(3 ± √5)/2`, threshold `φ²` | `0 ≤ λ` needed and present | none |
| 2.2 product bound | `L = 0`; identity, `W₂ = W₁ᵀ`; 6.2 | constant `1`, realize `= id`; `‖W₁ᵀW₁‖ = ‖W₁‖²`; `φ·√2 ≈ 2.29` vs gradient norms `1, 1, √2, 0` | holds; norm in Lean is the `ℓ²` operator norm (`rfl` probe) | R08 |
| 3.1 slope restriction | monotone `K`-Lipschitz; ReLU; `t ↦ −t`; leaky `c` | `d(KΔ − d) ≥ 0`; ReLU ok; `(−1)(2) = −2 < 0`; slopes in `{c, 1}` | holds | R07 |
| 3.1 quadratic constraint | scalar expansion | `2t((α+β)ΔyΔu − Δy² − αβΔu²) ≥ 0` equals `2t(Δy − αΔu)(βΔu − Δy)` | matches Fazlyab Lemma 1 up to sign | R06 |
| 3.2 soundness | form at `(Δx, Δy)` plus constraint; `α < 0`; `ρ < 0` | sum is `ρ‖Δx‖² − ‖W₂Δy‖² ≥ 0`; no sign of `α` used; inequality still follows | holds beyond source's `0 ≤ α < β` | R06 |
| 3.2 Schur form | `α = 0, β = 1, ρ > 0` | `D − Bᵀ(ρI)⁻¹B = 2T − W₂ᵀW₂ − ρ⁻¹TW₁W₁ᵀT` | `Matrix.PosDef.fromBlocks₁₁` applies | R08 Needs |
| 3.2 product point | `W₂ = 0`; `W₁ = 0`; generic | `M = 0`; `M = diag(0, 2‖W₂‖²I − W₂ᵀW₂) ⪰ 0`; Schur `≥ (2 − 1 − 1)‖W₂‖² I = 0` | feasible, incl. `ρ = 0` | none |
| 3.3 multilayer | `L = 2`; `L = 1`; `L = 0`; product point | reduces to `M(ρ, t)`; `ρI − W₁ᵀW₁`; undefined; telescoping leaves `‖W_L‖²‖x‖² − ‖W_L x‖² ≥ 0` | holds for `L ≥ 1`, diagonal `T` | R02, R03 |
| 4.1 affine box | `l ≤ u`; empty box | lower bound attained at `x_q = l_q` if `W_pq ≥ 0` else `u_q`; inclusion vacuous | holds | R11 |
| 4.1 prefix bounds | recursion vs `MLPSpec.evalPrefix` (`MLP/Basic.lean:124`) | both apply `layerActivation i` to `(θ i).1 *ᵥ h + (θ i).2`; output layer `id` monotone | holds | none |
| 4.2 specification layer | `l ≤ u`; `l = 1, u = −1` | difference `(|a| + |a'| − |a − a'|)·r ≥ 0`; `0` vs `2` | fails for `r < 0` | R03 |
| 5.1 envelopes | `z = l`, `z = u`; `α ∈ [0, 1]` | `0 = 0`, `u = u`; `αz ≤ max z 0` iff `0 ≤ α ≤ 1` on `l < 0 < u` | holds | R09 |
| 5.2 relaxation soundness | four branches of the pair | `relu = z`; `relu = 0`; `a ≥ 0`: `αz ≤ relu`; `a < 0`: `relu ≤ s(z − l)` | `Λ·x + κ ≤ c·f(x)`; Lean matches | none |
| 6.1 cast `ℚ → ℝ` | `simp_all` probe | not closed | kept | R01 |
| 6.2 exact radius | nearest points with `g ≤ 0` | `(0, −1)` and `(1, 0)`, distance `1` in `ℓ²` and `ℓ∞`; inside: `g = min(x₁, −x₂) > 0` | `1` | none |
| 6.2 product, LipSDP | `m = 1`, `L = φ√2`; `ρ = 2, t = (2, 1)` | `1/(√2·φ√2) = 1/(2φ) ≈ 0.309`; Schur `[[4−1−2, 1−1], [1−1, 2−1−1]] = diag(1, 0)`; gradient `(−1, −1)`, norm² `2` | `1/√2` certified, optimal | none |
| 6.2 interval, relaxation | box radius `ε` | hidden `[1−ε, 1+ε] × [0, 2ε]`, bound `1 − 3ε`; true min `1 − ε`; `Λ = (1/2, −1/2)`, `κ = −ε`, min `1 − 2ε` | `1/3 < 1/2 < 1` | none |

- Source locators checked against the text: 11, in 6 sources (tsuzuku2018 lines 126–143; fazlyab2019 lines 136–138, 194–207, 282–292, 329–352, 623–626; gowal2018 lines 286–303, 321–342; wong2018 lines 273–281; zhang2018 lines 231–261; szegedy2014 line 380).
- Library declarations opened at the pin: 11 (Mathlib `LinearAlgebra/Matrix/PosDef.lean:65, 335, 649, 668`; `Analysis/CStarAlgebra/Matrix.lean:196, 210, 220`; `Analysis/Matrix/Normed.lean:289, 480`; Tau Ceti `Geometry/Neuromanifold/MLP/Basic.lean:55, 124`).
- Cross-roadmap citations resolved: 1 (Neuromanifolds, on main; implemented at the pin). No `TauCeti.Neuromanifold` Lipschitz declaration exists at the pin.
- Dependency check: `depcheck: 240 roadmaps, 2251 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL (`imports`, `mathlib-subimports`, `no-import-mathlib`, `outside-folder`); `build=0`. Elaboration of the head and of a copy with `import Mathlib`: `sorry` the only warning.
- `#check @name` types (29) compared with the README: no lost binder; differences are R11 (lower bound only) and README 6.1 "any ordered field" against `ℝ` (removed by R09).
- Pull-request text read against the head: no sentence contradicted; the one unstated change is R05.
- Overlap check: read RandomizedSmoothing, StructuredBlockOperators, SpectralSteepestDescent, Neuromanifolds; nothing shared (RandomizedSmoothing hands deterministic certificates to this roadmap and keeps its own smoothed predicate).
- Source independence: 9 passages compared with 5 sources, none shared; no source has a share of the locators, 0 of 0 locators (R06); contents compared with fazlyab2019 (the source of most statements): independent, Layers 1, 3, 4, 5 draw on four different papers.

## Not verifiable

- Megretski–Rantzer 1997 (DOI 10.1109/9.587335): paywalled at the publisher, no open copy found; no statement of the README cites it.
- The public formalisation named in the Provenance section was not opened: `Suggested.lean` was not compared with its files.
- Feasibility of the product point (3.2, 3.3), the Schur form and 1.3 have no cited source; checked by computation only (table above).

## Source issues

- **Misprint** in fazlyab2019 at Definition 1, eq. (3), p. 3: the source says the difference quotient lies in `[α, β]` for all pairs of reals; it should be for all pairs of distinct reals; affects nothing.

## For the human reviewers

- **Scope.** The subject is verification of neural-network classifiers; six of seven references are machine-learning conference papers or arXiv preprints (README lines 285–298); `metadata.toml` files it under `math.OC`.
- **Licence.** README lines 271–281 say the statements generalize a BSD-3 formalisation by the pull request's author (`lean4-mlir`, files under `LeanMlir/Proofs/Certificates/`); the Lean was not compared with it.
