# Review of RobustnessCertificates (pull request #2426 at dfe018c)

**Verdict:** accepted

No findings. Incremental re-review of the 50 lines changed since `713a2ad` (README only; `Suggested.lean` unchanged).

## Previous findings

- R01 — repaired: "So, when `f` predicts `i` at `x`, the certified radius is exactly `min_{j ≠ i} g_{ij}(x) / ‖a_j‖_*` in `ℝ≥0∞`, a term with `a_j = 0` being `⊤`; when `f` does not predict `i` at `x` the radius is `0`." Both Checks added.
- R02 — repaired: "with the row `W_{L,i} - W_{L,j}` and bias / `b_{L,i} - b_{L,j}`, gives a lower bound … because / `|a - a'| ≤ |a| + |a'|` entrywise." Each span on one line; gate `tex=0`.
- R03 — repaired: 5.1 "`(1, 0)` for `0 ≤ l` and `(0, 0)` for `l < 0` and `u ≤ 0`, whatever `a` and `α`; at `l = u = 0` it is `(1, 0)`"; 5.2 "as `(0, 0)` if `l_p < 0` and `u_p ≤ 0`".
- R04 — repaired: "belong to the RandomizedSmoothing roadmap; attacks and lower bounds on the robust radius"; `grep "pull/"` on the README gives nothing.
- R05 — repaired: Layer 6 ends "### Examples — The factorizations of the Checks of 6.1; the network of 6.2." and "### Dependencies — 6.1 uses only Mathlib; 6.2 uses 1.2, 2.2, 3.2, 4.2, 5.2 and 6.1."
- R06 — repaired: contract and `*Needs:*` of 6.1 name `LDL.lower_conj_diag`, `LDL.isLowerTriangular_lower`; 6.1: "Mathlib has this for positive definite `M` …; the target is the semidefinite case, where pivots vanish, with unit diagonal and `d ≥ 0`."
- R07 — repaired: "Zhang et al., Table 3, p. 5, and §3.2, p. 6, for the adaptive lower lines."

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.3 radius formula (changed) | identity of `ℝ²` at `(1, 0)`; at `(0, 1)`; `f = (0, 0)`; constant `f = (1, 0)`; `k = 1` | `g = 1`, `‖a‖₂ = √2`, `Σ|a_p| = 2`: `1/√2`, `1/2`; `g = -1`, not predicted: `0`; `g = 0`, not predicted: `0`; term `⊤`, radius `⊤`; empty minimum `⊤` | agrees with the Conventions' supremum and with `certifiedOn_ball_affine_iff` | none |
| 1.3 new Checks | `(0, 1)` in `ℓ²`; `f = (0, 0)` | formula without the hypothesis gives `-1/√2` and `0/0`; repaired sentence gives `0`, `0` | Checks hold and discriminate | none |
| 4.2 specification layer (rewrapped) | `f = (x + 1, x)` on `[0, 1]` | direct gap bound `1`; `lo 0 - hi 1 = 1 - 1 = 0`; `1 ≥ 0` | wording unchanged, holds | none |
| 5.1 `crownRelax` Check (changed) | `(a, 0, 0, α)`; `(a, -1, 0, α)`; `(a, -1, -1/2, α)`; `(1, -1, 1, α)`; `(-1, -2ε, 2ε, α)` | `(1, 0)`; `(0, 0)`; `(0, 0)`; `(α, 0)`; `s = 2ε/4ε = 1/2`, intercept `-(1/2)(-2ε) = ε` | matches the definition's branch order (`Suggested.lean` lines 175–179) | none |
| 5.2 case split, `crown_sound` (changed) | `l_p = u_p = 0`; `l_p < 0`, `u_p = 0`; `l_p < 0 < u_p` | only case 1 applies, `z = 0`: `relu = 0 = 1·z`; only case 2, `z ≤ 0`: `relu = 0`; case 3 | three cases disjoint and exhaustive; equal `crownRelax a_p l_p u_p α_p` | none |
| 6.1 `exists_ldlt_of_posSemidef` against Mathlib's `LDL` (changed) | `[[1, 1], [1, 1]]`; `[[2, 1], [1, 1]]` | determinant `0`, not positive definite, so `LDL.lower_conj_diag` (needs `hS : S.PosDef`) does not apply, target gives `d = (1, 0)`; `d = (2, 1/2)`, both apply | the target is not at the pin; the variant's difference is stated | none |

The rows of the previous review, of `713a2ad`, stand for every other statement: the diff changes no Lean declaration.

- Source locators checked against the text: 1 changed locator, 2 places (zhang2018 lines 256–261, Table 3 after the page-5 marker at line 244; lines 322–330, the ReLU paragraph of §3.2 after the page-6 marker at line 292); both agree.
- Library declarations opened at the pin: 2 (Mathlib `Analysis/Matrix/LDL.lean:111` `LDL.isLowerTriangular_lower`, `:116` `LDL.lower_conj_diag`, both for `hS : S.PosDef` over `RCLike 𝕜`).
- Cross-roadmap citations resolved: 1 changed (RandomizedSmoothing, an open new roadmap; its README line 38 leaves deterministic certificates to this roadmap). Supplier Neuromanifolds unchanged. Dependency check: `depcheck: 242 roadmaps, 2261 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate at `dfe018c`: every check `0`, `build=0`, OK. Elaboration of `Suggested.lean`: 17 `sorry` warnings and no other message.
- Shape: `### Examples` and `### Dependencies` now close each of the six layers (12 headings); the Dependencies line of Layer 6 agrees with the `*Needs:*` lines of 6.1 and 6.2.
- Pull-request text read against this head: no sentence contradicted; the change since `713a2ad` alters no section, headline, declaration or supplier roadmap the description names. Nothing changed outside the folder.
- Overlap check: read RandomizedSmoothing, Neuromanifolds (the third list is empty); nothing shared.
- Source independence: changed passages only: 7 passages compared with 1 source (zhang2018), none shared; largest share fazlyab2019 and zhang2018, 4 of 16 locators each; the diff adds, removes or reorders no layer, so the arrangement stands as compared in the previous review: independent.

## Not verifiable

- Of the six files of the public formalisation named under Provenance, one was opened in the previous review; the other five were not compared with `Suggested.lean`.

## Source issues

- none

## For the human reviewers

- **Scope.** The subject is verification of neural-network classifiers; all six references are machine-learning conference papers or arXiv preprints (README, `## References`); `metadata.toml` files it under `math.OC`.
- **Licence.** The README's Provenance section says the statements generalize a BSD-3 formalisation by the pull request's author (`lean4-mlir`). The one file opened, `LeanMlir/Proofs/Certificates/LipschitzCert/PairSDP.lean`, has no licence header and shares no name or statement with `Suggested.lean`.
