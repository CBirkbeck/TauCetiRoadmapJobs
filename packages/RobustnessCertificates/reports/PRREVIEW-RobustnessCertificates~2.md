# Review of RobustnessCertificates (pull request #2426 at 713a2ad)

**Verdict:** needs changes

## R01 (P2) — the affine radius formula of 1.3 lacks the hypothesis that `f` predicts `i` at `x`

**Location:** `TauCetiRoadmap/RobustnessCertificates/README.md` lines 162–163: "So the certified radius of an affine classifier is exactly `min_{j ≠ i} g_{ij}(x) / ‖a_j‖_*`, with the convention that a term with `a_j = 0` and `g_{ij}(x) > 0` imposes no constraint."

**Claim:** Without `0 < g_{ij}(x)` for all `j ≠ i` the formula is negative or `0/0`, while the radius of the Conventions (a supremum in `ℝ≥0∞`) is `0`.

**Witness:** Identity of `ℝ²`, `x = (0, 1)`, class `0`, `ℓ²`: `g = -1`, `‖a‖ = √2`, formula `-1/√2`; radius `0`. Constant `f = (0, 0)`: `a = 0`, `g = 0`, term `0/0`.

**Repair:** "So, when `f` predicts `i` at `x`, the certified radius is exactly `min_{j ≠ i} g_{ij}(x) / ‖a_j‖_*` in `ℝ≥0∞`, a term with `a_j = 0` being `⊤`; when `f` does not predict `i` at `x` the radius is `0`." Add the two instances above as Checks (values `0` and `0`; at `x = (1, 0)` the repaired sentence still gives `1/√2`).

## R02 (P3) — the gate fails: two code spans are broken across lines

**Location:** README lines 376–378: "and bias `b_{L,i} -` / `b_{L,j}`, gives a lower bound … because `|a - a'| ≤` / `|a| + |a'|` entrywise."

**Claim:** Gate rule `tex` (3 hits, lines 376–377): a code span that wraps a line leaves `_{` outside a span on each line.

**Witness:** Gate line: `tex=3 … FAIL`; hits "line 376: … bias `b_{L,i} -" and "line 377: b_{L,j} … g_{ij}".

**Repair:** Reflow lines 375–378 as: "- **Specification layer.** For `l ≤ u` on the last hidden box, bounding the gap directly, by / applying 4.1 to the last affine layer with the row `W_{L,i} - W_{L,j}` and bias / `b_{L,i} - b_{L,j}`, gives a lower bound on `g_{ij}` that is at least `lo i - hi j`, because / `|a - a'| ≤ |a| + |a'|` entrywise." (each span on one line).

## R03 (P3) — a Check of 5.1 is false for `crownRelax`, and the cases of 5.2 overlap

**Location:** README line 423: "`crownRelax a l u α` is `(1, 0)` for `0 ≤ l` and `(0, 0)` for `u ≤ 0`, whatever `a` and `α`."; lines 432–433: "as `(1, 0)` if `0 ≤ l_p`, as `(0, 0)` if `u_p ≤ 0`".

**Claim:** At `l = u = 0` both cases apply; `crownRelax` (`Suggested.lean` lines 175–179) tests `0 ≤ l` first.

**Witness:** `crownRelax a 0 0 α = (1, 0)`, not `(0, 0)`, although `u ≤ 0`.

**Repair:** Line 423: "… is `(1, 0)` for `0 ≤ l` and `(0, 0)` for `l < 0` and `u ≤ 0`, whatever `a` and `α`; at `l = u = 0` it is `(1, 0)`." Line 433: "as `(0, 0)` if `l_p < 0` and `u_p ≤ 0`".

## R04 (P3) — a pull-request link stands for a roadmap citation

**Location:** README lines 38–39: "belong to [RandomizedSmoothing](https://github.com/TauCetiProject/TauCetiRoadmap/pull/2428)".

**Claim:** Roadmaps are cited by name and section, never by pull request, also while they are still pull requests.

**Witness:** `grep -n "pull/" README.md` gives line 39 only.

**Repair:** "… and belong to the RandomizedSmoothing roadmap;" with no link.

## R05 (P3) — Layer 6 has no `### Examples` and no `### Dependencies`

**Location:** README lines 461–510 (`## Layer 6: exact certificates and a worked example`); the layer ends with the `*Needs:*` line of 6.2.

**Claim:** Every layer ends with both subsections; Layers 1–5 have them.

**Witness:** `grep -c "^### Examples" README.md` is `5` for six layers.

**Repair:** After line 510 add: "### Examples" — "The factorizations of the Checks of 6.1; the network of 6.2." and "### Dependencies" — "6.1 uses only Mathlib; 6.2 uses 1.2, 2.2, 3.2, 4.2, 5.2 and 6.1."

## R06 (P3) — Mathlib's `LDLᵀ` decomposition is not cited

**Location:** README lines 467–469: "Every positive semidefinite real `M` factors as `L diag d Lᵀ` with `L` lower unitriangular and `d ≥ 0` (`exists_ldlt_of_posSemidef`)"; supplier contracts, lines 53–56.

**Claim:** The pin has the positive definite case; 6.1 keeps a variant without saying how it differs.

**Witness:** Pinned Mathlib `Analysis/Matrix/LDL.lean:116`, `LDL.lower_conj_diag : LDL.lower hS * LDL.diag hS * (LDL.lower hS)ᴴ = S` for `hS : S.PosDef`; `:111` `LDL.isLowerTriangular_lower`.

**Repair:** Add to the Mathlib contract and to the `*Needs:*` of 6.1 "`LDL.lower_conj_diag`, `LDL.isLowerTriangular_lower` (the positive definite case)", and to the second bullet of 6.1: "Mathlib has this for positive definite `M`; the target is the semidefinite case, where pivots vanish, with unit diagonal and `d ≥ 0`."

## R07 (P3) — one page number is off by one

**Location:** README lines 416–417: "Zhang et al., §3.2, p. 5, for the adaptive lower lines."

**Claim:** In the arXiv v1 pagination the README's other Zhang locators use, the ReLU lower lines `a y`, `0 ≤ a ≤ 1`, of §3.2 are on p. 6; p. 5 has them only in Table 3.

**Witness:** zhang2018 line 292 is the marker of page 6; the ReLU paragraph of §3.2 is lines 322–330; Table 3 is line 256 (page 5).

**Repair:** "Zhang et al., Table 3, p. 5, and §3.2, p. 6, for the adaptive lower lines."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions | `t ↦ -t` in `[0, 1]`; `k = 1`; `oneHidden` with `1, 0, 1, 0` | `(-1 - 0)(1 + 1) = -2`; no `j ≠ i`, radius `⊤`; `relu` | Checks hold | none |
| 1.1 `CertifiedOn` | `S = ∅`; identity of `ℝ²` at `(1, 0)`; `ℓ∞` to `ℓ²` | vacuous; tie line at distance `1/√2`, open ball of that radius misses it; `‖v‖_∞ ≤ ‖v‖₂` so ball inclusion | holds | none |
| 1.2 `abs_sub_le_sqrt_two_mul_norm` | `v = e_i - e_j`; sup norm | `2 = √2·√2`; `2 = 2·1` | sharp | none |
| 1.2 global certificate | `L = 0`; `ε ≤ 0`; `L > 0` | gap(y) `≥ m > 0`; empty ball; gap(y) `> m - √2 L ε ≥ 0` | holds; source has `≥ 0` on the closed ball (tsuzuku2018 lines 126–129) | none |
| 1.2 per-pair | `L_j = 0`; `L_j > 0` | `g(y) = g(x) > 0`; `g(y) > g(x) - L_j ε ≥ 0` | holds | none |
| 1.3 `certifiedOn_ball_affine_iff` | `a = 0`; `X = 0`; `a ≠ 0`, both directions | only `0 < g`; ball `{x}`; `inf_{‖v‖<r} a(v) = -r‖a‖`, not attained | iff holds with `r > 0` | none |
| 1.3 radius formula | `x = (1, 0)`; `x = (0, 1)`; `f = 0` | `1/√2`, `1/2`; `-1/√2` against radius `0`; `0/0` | fails off the predicted region | R01 |
| 2.1 `sq_l2_opNorm_le_iff` | `diag(3, 1)`; `n = 0`; `m = 0` | `9·1 - WᵀW = diag(0, 8)`, `8`: `diag(-1, 7)`; `0 ≤ λ` both sides; `λ·1 ⪰ 0` iff `λ ≥ 0` | holds with `0 ≤ λ` | none |
| 2.2 `lipschitzWith_realize_prod` | `L = 0`; `L = 1`; identity, `W₂ = W₁ᵀ`; 6.2 | constant `1`, realize is `id`; `‖W₁‖₂`; `‖WᵀW‖ = ‖W‖²`; `φ√2 ≈ 2.29` against gradient norms `1, 1, √2, 0` | holds; not least | none |
| 3.1 `slopeRestricted_of_monotone_of_lipschitzWith` | `Δ > 0`, `Δ < 0`; ReLU `[0, 1/2]`; leaky `c = 1/2` in `[3/5, 1]` | `0 ≤ d ≤ KΔ`, `KΔ ≤ d ≤ 0`; `1·(-1/2)`; `(1/10)(-1/2) = -1/20` | holds; Checks hold | none |
| 3.2 `lipSDP_sound` | form at `(Δx, Δy)` plus constraint; `α < 0`; `ρ < 0` | `ρ‖Δx‖² - ‖W₂Δy‖² - Σ 2t(Δy - αΔu)(βΔu - Δy) ≥ 0`; sign of `α` unused; forces `n = 0` | holds; matrix is the negative of fazlyab2019 lines 286–291 | none |
| 3.2 `lipSDPMatrix_posSemidef_iff` | `A = ρ·1`, `B = -W₁ᵀT` | `D - Bᵀ A⁻¹ B = 2T - W₂ᵀW₂ - ρ⁻¹ T W₁W₁ᵀ T`; no sign of `t` needed | `Matrix.PosDef.fromBlocks₁₁` applies | none |
| 3.2 `lipSDPMatrix_prod_posSemidef` | `W₂ = 0`; `W₁ = 0`; generic, `s = ‖W₂‖²` | `M = 0`; `diag(0, 2s·1 - W₂ᵀW₂)`; Schur `⪰ (2s - s - s)·1 = 0` | feasible, `ρ = 0` included | none |
| 3.3 multilayer | `L = 1`; `L = 2`; product point; `W_L = 0` | `ρ·1 - W₁ᵀW₁`; `M(ρ, t)`; telescoping leaves `‖W_L‖²‖y‖² - ‖W_L y‖² ≥ 0`; form `0` | holds for `1 ≤ L`, diagonal `T` (fazlyab2019 lines 329–352) | none |
| 4.1 `mulVec_add_mem_ibpAffine`, `exists_eq_ibpAffine` | `[[1, -1]]` on `[0, 1]²`; `(1 1)` at `(1, -1) ± ε`; `n = 0` | `[-1, 1]` at `(0, 1)`, `(1, 0)`; `[-2ε, 2ε]`; both sides `b` | holds; exact with `l ≤ u` | none |
| 4.1 `ibpBounds`, `evalPrefix_mem_ibpBounds` | recursion against `MLPSpec.evalPrefix`; `x - x` on `[0, 1]` | same `layerActivation i` on `(θ i).1 *ᵥ h + (θ i).2`, output `id`; `[-1, 1]` against `0` | holds; not exact when composed | none |
| 4.2 criterion and specification layer | `f = (x + 1, x)` on `[0, 1]`; `l = 1`, `u = -1`; `t²` on `[-1, 1]` | `hi 1 = lo 0 = 1`, gap bound `1`; `0` against `2`, and `0 ≥ -2` for `l ≤ u`; `[1, 1]` misses `0` | holds with `l ≤ u`, monotone | R02 (wrapping only) |
| 5.1 envelopes, `crownRelax` | `l = -1, u = 1`; `α = 2`; `(-1, -2ε, 2ε)`; `l = u = 0` | chord `(z + 1)/2`; `2 ≤ 1` fails; `(1/2, ε)`; `(1, 0)` | envelopes hold; one Check false | R03 |
| 5.2 `crown_sound` | four branches; 6.2 | `relu = z`; `relu = 0`; `αz ≤ relu`; `relu ≤ s(z - l)`; `Λ = (1/2, -1/2)`, `κ = -ε`, minimum `1 - 2ε` | holds; Lean `κ` equals the README's | R03 |
| 6.1 `exists_ldlt_of_posSemidef`, `PosSemidef.map_ratCast` | `[[1, 1], [1, 1]]`; `[[2, 1], [1, 1]]`; `n = 0` | `L = [[1, 0], [1, 1]]`, `d = (1, 0)`; `L = [[1, 0], [1/2, 1]]`, `d = (2, 1/2)`; empty | hold | R06 |
| 6.2 exact radius | open `ℓ∞` ball of radius `1`; point `(0, -1)` | `x₁ > 0 > x₂` gives `relu(x₁ + x₂) < x₁`; `g = 0` at distance `1` in both norms | `1` | none |
| 6.2 product, LipSDP | `W₁ᵀW₁ = [[2, 1], [1, 1]]`; `ρ = 2`, `t = (2, 1)` | top eigenvalue `(3 + √5)/2 = φ²`; `1/(√2·φ√2) = 1/(2φ) ≈ 0.309`; Schur `[[4-1-2, 0], [0, 2-1-1]] = diag(1, 0)`; gradient `(-1, -1)` | `1/(2φ) < 1/√2 < 1` | none |
| 6.2 interval, relaxation | box of radius `ε < 1` | hidden `[1-ε, 1+ε] × [0, 2ε]`, bound `1 - 3ε`; relaxation minimum `1 - 2ε` | `1/3 < 1/2 < 1` | none |

- Previous findings R01–R11: all repaired at this head (R08 except the two subsections of Layer 6, now R05); the outside-folder diff is empty.
- Source locators checked against the text: 16, in 6 sources (tsuzuku2018 lines 126–143; szegedy2014 lines 380–396, 408; fazlyab2019 lines 136–138, 194–207, 282–292, 329–352; gowal2018 lines 286–303, 321–342; wong2018 lines 273–278; zhang2018 lines 163–170, 231–242, 245–261, 322–330); 15 agree, one is R07.
- Library declarations opened at the pin: 12 (Mathlib `LinearAlgebra/Matrix/PosDef.lean:62, 204, 335, 649, 668`; `Analysis/CStarAlgebra/Matrix.lean:196, 220`; `Analysis/Matrix/Normed.lean:289, 480`; `Analysis/Matrix/LDL.lean:116`; Tau Ceti `Geometry/Neuromanifold/MLP/Basic.lean` `MLPSpec`, `layerActivation`, `evalPrefix_succ`, `realize` at 171; `Activation.lean:89, 101`; `Dense.lean:84`).
- Cross-roadmap citations resolved: 1 supplier (Neuromanifolds §2 on main, implemented at the pin) and 1 deferral (RandomizedSmoothing, open). Dependency check: `depcheck: 241 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate: FAIL on `tex=3` only (R02); `build=0`. Elaboration of the head: 17 `sorry` warnings and nothing else.
- One-tactic probe on a copy (`simp`, `rfl`, `simp` with the seven definitions unfolded, `simp_all`, `positivity`, `nlinarith`): none of the 17 theorems closes. Every binder is explicit in each signature (no `variable` line); the 24 elaborated types agree with the README statements.
- Pull-request text read against the head: no sentence contradicted, no unstated change. Ownership against open pull requests checked with the roadmap search for `LipSDP`, `CertifiedOn`, slope restriction, interval bounds and certified radius: no second owner; no fully qualified name shared.
- Overlap check: read RandomizedSmoothing, Neuromanifolds (the third list is empty); nothing shared (RandomizedSmoothing keeps its own `SmoothCertified` and leaves deterministic certificates to this roadmap).
- Source independence: 16 passages compared with 6 sources, none shared; largest share fazlyab2019 and zhang2018, 4 of 16 locators each; contents compared with fazlyab2019: 3.1–3.3 run beside its §2.2–2.4, an order the `*Needs:*` lines of 3.2 and 3.3 force, with wider scope in each (Schur form, product point, per-pair form): independent.

## Not verifiable

- The repair of R02 was not run through the gate (the gate reads the worktree, which a review does not change).
- Of the six files of the public formalisation named under Provenance, one (`LipschitzCert/PairSDP.lean`) was opened; the other five were not compared with `Suggested.lean`.
- The Schur form, the product-point feasibility (3.2, 3.3), 1.3 and 6.1 are marked "proved here" and have no source to check against; they were checked by computation (table above).

## Source issues

- **Misprint** in fazlyab2019 at Definition 1, eq. (3), p. 3: the source says the difference quotient lies in `[α, β]` for all pairs of reals; it should be for all pairs of distinct reals; affects nothing.

## For the human reviewers

- **Scope.** The subject is verification of neural-network classifiers; all six references are machine-learning conference papers or arXiv preprints (README lines 539–550); `metadata.toml` files it under `math.OC`.
- **Licence.** README lines 525–535 say the statements generalize a BSD-3 formalisation by the pull request's author (`lean4-mlir`). The one file opened, `LeanMlir/Proofs/Certificates/LipschitzCert/PairSDP.lean`, has no licence header; its six declarations share no name or statement with `Suggested.lean`.
