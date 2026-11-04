# Review of StructuredBlockOperators (pull request #260 at 945f5e6)

**Verdict:** needs changes

The push gate fails (imports, metadata, target-ids); the dependency check passes only because the README cites its suppliers by pull-request URL, which the check cannot see. The mathematical core (block-constant matrices, the fiber-sum regrouping identity, block-average Frobenius optimality, softmax on block-constant logits, the block-constant versus equitable distinction) is sound where it is stated and belongs in a roadmap. Two of the eight layers and several bullets plan executable programs, cost semantics and certificate checkers, which the planning principles exclude, and the README is not in TauCetiRoadmap form (no targets, no Checks, no locators, no supplier contracts).

## R01 (P1) — Layers 2 and 7 and several bullets plan computational algorithms, not mathematics

Location: `TauCetiRoadmap/StructuredBlockOperators/README.md` lines 119–131 ("Define a small cost semantics for the straight-line/fold programs … cost preservation/refinement for code extraction to finite arrays"), lines 195–208 ("Define decidable certificate formats … Prove checker soundness … Floating-point data enters through interval/rational certificates"), line 114 ("memory-access and stored-entry counts for explicit array representations"), line 127 ("communication volume under an explicit layout"), line 188 ("radix-2 FFT cost/correctness"), lines 31–32 and 176; `Suggested.lean` lines 44–48 (`denseMulCount`, `blockArithmeticCount`).

Claim: the roadmap owns "verified finite algorithms", "explicit arithmetic/communication cost models", "decidable certificates" and "code extraction".

Witness: the principles say "Mathematical background is welcome; computational algorithms are not." A cost semantics for fold programs, a checker with soundness proof against interval-enclosed float data, memory-access counts and an FFT implementation are programs and their verification, not library mathematics. The two Lean definitions are bare functions `ℕ → ℕ → ℕ → ℕ` with no theorem: `denseMulCount m n d = m * n * d` counts multiplications only, while `blockArithmeticCount m n r d = n * d + m * r * d` adds `n * d` additions to `m * r * d` multiplications, so the two counts are not even in the same unit (README line 123 says the dense count is "scalar products/additions").

Repair: delete Layer 2 and Layer 7 and the bullets at lines 114, 127, 128, 176 and 188, and delete the two count definitions from `Suggested.lean`. Keep as mathematics: the regrouping identity (Layer 1), the equitable/block-constant comparison (Layer 0), block means and their Frobenius optimality, the residual decomposition and rank inequality (Layer 3), the residual-bound interface (Layer 4), softmax on block-constant logits (Layer 5), and the circulant/banded structure statements (Layer 6) stated as matrix identities with the pinned `Matrix.circulant` and `ZMod.dft`. The "break-even inequality" survives only as a plain natural-number inequality about the two stated sums, if at all.

## R02 (P2) — Suppliers cited by pull-request URL; one target is a closed pull request; the dependency is invisible to the merge-order check

Location: README lines 246–247 (`[equitable-roadmap]: …/pull/257`, `[operator-roadmap]: …/pull/126`), used at lines 34, 38, 81, 84.

Claim: the roadmap "consumes the equitable-operator-reduction roadmap" and "the Hilbert-space operator-theory roadmap".

Witness: pull request #126 was merged as commit `cb976c0d` ("Roadmap: Hilbert Space Operator Theory") and is now the `OperatorTheory` family on main, whose Eckart–Young target is `OperatorTheory/OperatorIdeals/README.md` line 245 (OI-A49, `aₙ(T) = σₙ(T)` in finite-dimensional Hilbert spaces) and whose unitarily invariant norms live in `OperatorTheory/Majorization`. Pull request #257 is `EquitableOperatorReduction`, a draft by the same author, absent from the merge order. Because the citations are URLs, the dependency check reports `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)` with no edge from this roadmap at all, so neither the direction nor the placement of the real dependency is checked.

Repair: replace both link references with citations by roadmap name and section in an `## Exact supplier contracts` section: `EquitableOperatorReduction` §Layer 0 (cell maps, fiber sums, cell-constant submodule, normalized embedding), §Layer 1 (constant block-row sums, rectangular), §Layer 4 (residual `A E − E Q` and its consequences); `OperatorTheory/OperatorIdeals` OI-A49 and OI-A50 (Eckart–Young, Weyl perturbation) and `OperatorTheory/Majorization` (unitarily invariant norms). Say what is assumed of each. Note that `EquitableOperatorReduction` is still a draft pull request: the contract is stated against its head and the merge order must place it before this roadmap.

## R03 (P2) — Two owners for the best block-constant approximation and the residual bounds it implies

Location: README lines 135–146 (Layer 3: "entrywise oscillation and rowwise bounds implying operator bounds", "block means minimize squared Frobenius residual") and lines 153–157 (Layer 4: "block approximation implies a bound on `A E − E Q`"), and lines 90–98 (Layer 0: cell maps, "relation to the cell-constant submodules and the normalized compression").

Claim: this roadmap owns block approximation, oscillation and rowwise bounds, and the bound they give on the intertwining residual.

Witness: `EquitableOperatorReduction` (pull request #257 head) Layer 4 lists as its own target "sufficient residual bounds from entrywise block oscillation, rowwise `ℓ¹` error, Frobenius error, and best block-constant approximation", and its Layer 0 owns "the cell-map object/predicate", "sums by fibers" and "the cell-constant submodule … the normalized embedding". Both pull requests plan the same statements.

Repair: one owner per object. Since this roadmap imports `EquitableOperatorReduction`, consume its Layer 0 cell maps and fiber sums instead of redefining `rowCell`/`colCell` here, and either (a) delete the Layer 4 bullet "block approximation implies a bound on `A E − E Q`" here and cite `EquitableOperatorReduction` §Layer 4 for it, keeping only the Frobenius-optimality of block means (which `EquitableOperatorReduction` does not state); or (b) keep it here and remove "best block-constant approximation" from `EquitableOperatorReduction` Layer 4, which must then not cite this roadmap (that would be a cycle). Record the choice in `## Scope and ownership`.

## R04 (P2) — Headline theorems statable at the pins are absent from `Suggested.lean`

Location: `Suggested.lean` lines 37–48; README lines 210–221 (acceptance gates).

Claim: the file "pins the rectangular block predicate and the exact application algorithm".

Witness: the README's own acceptance gates name four headlines that are statable now and none is stated: (1) block means minimize the squared Frobenius residual over block-constant matrices with the same cell maps (`Matrix.frobenius_norm_def`, `Mathlib/Analysis/Matrix/Normed.lean` line 550, or the entrywise sum of squares over ℝ); (2) rowwise softmax of block-constant logits is block-constant with block matrix `exp(B r c) / ∑ c', |colCell⁻¹ c'| · exp(B r c')` (a real-bodied softmax on `Matrix M N ℝ` with `Real.exp` suffices); (3) block-constant with `rowCell = colCell` implies constant block-row sums with quotient `Q c c' = B c c' · |colCell⁻¹ c'|`; (4) `rank A ≤ rank A_block + rank (A − A_block)` with `rank A_block ≤ min (card I) (card J)` (`Matrix.rank_mul_le_left`, `Mathlib/LinearAlgebra/Matrix/Rank.lean` line 182; `rank_le_card_width` line 174). The only theorem present is the regrouping identity, which is not deep (see R07).

Repair: state (1)–(4) with `sorry` and only the definitions they need (`IsBlockConstant`, block mean, softmax). Name in the module docstring any headline that is not statable (the certified approximate-attention statement of line 176 lacks a carrier and is in any case excluded by R01).

## R05 (P2) — Layer 6 and Layer 0 plan APIs the pinned Mathlib already has; `fullApply` is `Matrix` multiplication

Location: README line 187 ("circulant matrices on `ZMod n`, convolution form and character diagonalization"), line 95 ("Kronecker products"), line 97 ("rank bound"), line 96 (`Finpartition` conversion); `Suggested.lean` lines 23–24 (`fullApply`), 27–29 (`cellSum`).

Claim: "Build separate reusable APIs for … circulant matrices".

Witness at the pin: `Matrix.circulant` (`Mathlib/LinearAlgebra/Matrix/Circulant.lean` line 50) with `Matrix.circulant_mul` (line 114); the finite Fourier transform `ZMod.dft` (`Mathlib/Analysis/Fourier/ZMod.lean`); `Matrix.kroneckerMap` (`Mathlib/LinearAlgebra/Matrix/Kronecker.lean` line 55); `Matrix.rank_mul_le_left` / `rank_mul_le_right` (`Rank.lean` lines 182, 188) and `Matrix.rank_submatrix_le` (line 288); `LinearMap.singularValues` (`Mathlib/Analysis/InnerProductSpace/SingularValues.lean`). In the Lean file, `fullApply A X = A * X` closes by `rfl` for `X : Matrix N D 𝕜` (`Matrix.mul_apply`, `Mathlib/Data/Matrix/Mul.lean` line 298), `cellSum colCell X c e = ∑ j ∈ univ.filter (colCell · = c), X j e` closes by `simp [Finset.sum_filter]`, and `blockApply B ρ κ X = B.submatrix ρ id * Matrix.of (cellSum κ X)` closes by `ext; simp [Matrix.mul_apply]` (all elaborated on a scratch copy).

Repair: delete `fullApply` and write `A * X`; define `cellSum` as the filtered sum or as `Matrix.of (fun c e => ∑ j ∈ univ.filter (colCell · = c), X j e)`; in the README cite `Matrix.circulant`, `ZMod.dft`, `Matrix.kroneckerMap`, the rank lemmas and `LinearMap.singularValues` under `From Mathlib`, and keep only what is missing (the diagonalization of `Matrix.circulant v` by `ZMod.dft`, if no pinned statement gives it).

## R06 (P3) — The gate fails: import line, `metadata.toml`, no targets

Location: `Suggested.lean` line 1 (`import Mathlib.LinearAlgebra.Matrix.DotProduct`); folder `TauCetiRoadmap/StructuredBlockOperators/` (no `metadata.toml`); README line 88 onward (no `### k.n` subsections).

Witness: gate at 945f5e6: `imports=1 mathlib-subimports=1 no-import-mathlib=1 target-ids=1 metadata=1 … FAIL`. Every roadmap on main carries `metadata.toml` (for example `TauCetiRoadmap/OperatorTheory/metadata.toml`, `TauCetiRoadmap/StandardDistributions/metadata.toml`).

Repair: `import Mathlib` as the single import; add `metadata.toml` in the form of a sibling; write the layers as `### k.n <topic>` targets (see R08).

## R07 (P3) — `blockApply_eq_fullApply` is padding, needs no `CommSemiring`, and carries unused binders

Location: `Suggested.lean` lines 37–42.

Claim: "Fiberwise regrouping proves correctness of the exact block algorithm", stated over `[CommSemiring 𝕜]` with `[Fintype M] [DecidableEq M] [DecidableEq N]` in scope.

Witness: on a scratch copy the statement closes over `[Semiring 𝕜]` by `ext i e; simp only [blockApply, fullApply, cellSum, Finset.mul_sum, mul_ite, mul_zero]; rw [Finset.sum_comm]; simp [hblock i]`, and over `CommSemiring` by `ext i e` followed by one `simp` call (`Finset.sum_comm`, `Finset.sum_ite_eq'`, `Finset.mul_sum`, `mul_ite`, `hblock i`). It is `Finset.sum_fiberwise` (`Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean` line 282, additive form) plus distributivity. The elaborated type (scratch `signatures.md`) also carries `[Fintype M] [DecidableEq M] [DecidableEq N]`, none of which the statement uses.

Repair: delete it from `Suggested.lean`; the README keeps it as the Layer 1 target, stated over a semiring with no finiteness on `M` and no decidable equality on `M` or `N`.

## R08 (P3) — The README is not in TauCetiRoadmap form: no targets, API lists, Checks, `*Needs:*` lines, locators or supplier contracts

Location: whole README; lines 88–208 (layers as bullet lists), lines 238–244 (References without locators), lines 22–43 (`## Ownership and dependencies`), lines 75–86 (`## Foundations to consume`).

Witness: a grep for `**Checks.**`, `*Needs:*`, "Thm", "Theorem" or a page number finds nothing; no definition has an API list or a Check; no claim has a locator; the five references are books or papers cited whole, two of them (Vaswani et al., Beltagy et al.) machine-learning papers that state none of the theorems; there is no `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build`, `### Examples`, `### Dependencies` or `## Downstream consumers`. The brief's seeded sample of 15 locators could not be drawn because the README has no locators.

Repair: rewrite in the shape of a main roadmap (for example `TauCetiRoadmap/OperatorTheory/Majorization/README.md`): one `### k.n` prose target per definition or theorem with exact hypotheses, a locator (Horn–Johnson or Golub–Van Loan theorem and page for the Frobenius projection, rank inequalities and circulant diagonalization; Godsil–Royle for equitable partitions), at least three discriminating Checks per definition (for `IsBlockConstant`: the 2×2 identity with the trivial partition is equitable but not block-constant; a 3×2 rectangular example with unequal cells; the block mean on a non-surjective cell map hits an empty block and the definition must say what it returns), and a `*Needs:*` line per target. Record the works in `sources.toml`.

## R09 (P3) — Process narrative and non-timeless wording

Location: README lines 223–236 ("Prior formalization and coordination", a GitHub commit link, "The Graphplay author is coordinating this roadmap and permits adaptation", "Tau Ceti should generalize…"), line 86 ("when those targets land"), line 188 ("once the corresponding finite Fourier algorithm exists"), line 101 ("as a regression"), line 206 ("negative tests").

Witness: the house style is timeless and names no coordination, permissions or future events; the pinned Mathlib already has `ZMod.dft`, so "once … exists" is also false at the pin.

Repair: move the Graphplay commit to `## References` as a prior formalization with no process sentences, and state every target definitely.

## R10 (P3) — Lean names absent from the README; README hypotheses not in the Lean

Location: `Suggested.lean` lines 18, 23, 32, 38, 45, 48; README Convention 1 (line 47) and Convention 6 (lines 62–64).

Witness: the README names none of `IsBlockConstant`, `fullApply`, `blockApply`, `blockApply_eq_fullApply`, `denseMulCount`, `blockArithmeticCount` (only `cellSum` at line 51), while the rule is that every Lean name appears in the README. Conversely the README's standing hypothesis "independent surjective row and column cell maps" appears nowhere in the Lean; the regrouping identity does not need it (R07), but the block mean of Convention 6 does: for a non-surjective `colCell`, the block `(r, c)` with `c` unhit is empty and the mean is `0 / 0`, which Lean's division makes `0`, so the "mean" is defined but not a projection onto that block.

Repair: name every kept declaration in the README; carry surjectivity (or a nonempty-block hypothesis) explicitly in the block-mean definition and its optimality theorem, and add the empty-block case as a negative-control Check.

## Verified sound

- **Gate reproduced.** Elaborated `Suggested.lean` with `lake env lean`: the only diagnostic is `declaration uses sorry` at line 38, so the targeted build passes; the text scanners fail as in R06.
- **Dependency check.** Output: `depcheck: 156 roadmaps, 1060 edges, 0 problem(s)`; no UPWARD or CYCLE line. It is vacuous for this roadmap (R02): no citation is in a form the check reads. `OperatorTheory` (merge order line 254) precedes `StructuredBlockOperators` (line 353); `EquitableOperatorReduction` is not in the order.
- **Out-of-folder changes.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/StructuredBlockOperators'` is empty; the two commits touch only the two roadmap files (297 insertions).
- **Signatures.** Compared the 7 elaborated types in the scratch `signatures.md` with the README: `IsBlockConstant` and `fullApply` dropped only finiteness and decidability binders their types do not need (correct); the theorem keeps three it does not use (R07).
- **Pinned declarations opened.** `Matrix.circulant` (Circulant.lean:50), `Matrix.circulant_mul` (:114), `Matrix.kroneckerMap` (Kronecker.lean:55), `Matrix.rank_le_card_width` (Rank.lean:174), `rank_mul_le_left` (:182), `rank_mul_le_right` (:188), `rank_submatrix_le` (:288), `Matrix.mul_apply` (Mul.lean:298), `Matrix.frobenius_norm_def` (Analysis/Matrix/Normed.lean:550), `Finset.prod_fiberwise` with `to_additive` (BigOperators/Group/Finset/Basic.lean:282), `LinearMap.singularValues` (InnerProductSpace/SingularValues.lean), `ZMod.dft` (Analysis/Fourier/ZMod.lean), `Matrix.toBlock`/`blockDiagonal` (Data/Matrix/Block.lean:167, 329). Tau Ceti at the pin has no softmax, block-constant, equitable, circulant or cell-sum declaration (grep over `TauCeti/`).
- **Cross-roadmap citations resolved.** `EquitableOperatorReduction` at the head of pull request #257: Layers 0, 1, 4 and 5 read; ownership overlap as in R03. `OperatorTheory` on main: `OperatorIdeals` OI-A49 (Eckart–Young) and OI-A50 (Weyl) at README line 245–247; `Majorization` owns unitarily invariant norms (family README line 106). Ownership against the other open pull requests whose files the brief lists was checked by `roadmaps grep` for block-constant, softmax, circulant and equitable: no other open roadmap builds them.
- **Adversarial table.** One row per statement of the README and the Lean file.

| Statement | Instances tried | Values on each side | Result | Change |
|---|---|---|---|---|
| Regrouping identity `blockApply = fullApply` (Lean l.38; README Layer 1) | `N` empty; `D` empty; a cell `c` not hit by `colCell`; `𝕜` a non-commutative semiring | `N = ∅`: both sides `0`; `D = ∅`: both functions empty; unhit `c`: `cellSum c e = 0`, term `B r c · 0 = 0`; non-commutative: proof closes over `Semiring` | true, hypotheses too strong | R07: drop `CommSemiring`, finiteness on `M`, decidable equality |
| Block-constant ⇒ equitable with cardinality factor (Layer 0) | one cell `{1,2}`, `B = [b]`; discrete partition | `A = [[b,b],[b,b]]`, row sums `2b = b·|cell|`; discrete: `Q = A`, factor `1` | true | none |
| Equitable but not block-constant exists (Layer 0) | `1₂` with the indiscrete partition | row sums `(1,1)` equal; entries `1 ≠ 0` | true; this is the regression example | add as a Check (R08) |
| Rank bound by occupied cells (Layer 0) | `A = P_ρ B P_κᵀ`; `I = J = 1`, `M = N = Fin 3` | `rank A ≤ rank B ≤ 1` (`rank_mul_le_left`, `rank_le_card_width`) versus ambient `3` | true | cite the pinned lemmas (R05) |
| Block mean is the Frobenius projection (Layer 3, Conv. 6) | `A = [[1,3],[2,2]]`, indiscrete partition; non-surjective `colCell` | mean `2`, residual `[[−1,1],[0,0]]`, `‖R‖_F² = 2`, orthogonal to constants (`∑ R = 0`); non-surjective: empty block, `0/0 = 0` in Lean | true with surjective maps; junk value otherwise | R10: carry surjectivity in the definition |
| Monotonicity under refinement (Layer 3) | indiscrete → discrete on the example above | error `2` → `0` | true (larger subspace) | none |
| Rank lower bound for the residual (Layer 3, l.147–149) | `A = 1₂`, indiscrete partition | `A_block = ½ J`, rank `1`; `R = 1 − ½J`, rank `1`; `2 = rank A ≤ 1 + 1` | true; a rank-0 residual cannot represent `A` | state as `rank A ≤ rank A_block + rank R` (R04) |
| Block approximation bounds `A E − E Q` (Layer 4) | `A = A_block + R` with one partition | `A_block E = E Q` exactly, so `A E − E Q = R E`, `‖·‖ ≤ ‖R‖ ‖E‖ = ‖R‖` (`E` an isometry) | true | owner conflict R03 |
| Softmax of block-constant logits is block-constant with multiplicity (Layer 5) | two tokens in one cell, `B = [0]`; cells of sizes `1, 2` with `B = [0, 0]` | `(½, ½)`, block value `½ = 1/(2·e⁰)`; sizes `1,2`: `(⅓, ⅓, ⅓)`, block values `⅓, ⅓` = `e⁰/(1·e⁰ + 2·e⁰)`; without the multiplicity factor one would get `1` and `½` | true as stated | state in Lean (R04) |
| Break-even `n d + m r d ≤ m n d` (Layer 2, Lean l.48) | `m = n = r = d = 1`; `m = n = d = 2, r = 1` | `2 ≤ 1` false; `4 + 4 = 8 ≤ 8` true | an inequality of two bare functions whose units differ (adds+mults versus mults) | delete (R01) |
| Circulant on `ZMod n` diagonalized by characters (Layer 6) | `n = 1`; `n = 2`, `v = (a, b)` | `n = 1`: `1×1`, trivially diagonal; `n = 2`: eigenvalues `a + b`, `a − b` for `(1,1)`, `(1,−1)` | true; `Matrix.circulant` and `ZMod.dft` exist at the pin | cite, do not rebuild (R05) |
| Convention 6, "empty blocks are excluded by surjective cell maps" | surjective `ρ`, `κ`; block `(r, c)` | fibers nonempty, product nonempty | true | none |

## Not verifiable

- **The seeded sample of 15 source locators**: the README has no locators (no theorem, section or page anywhere), so no target could be sampled; there is no `sources.toml`, and the five references are whole works. The Graphplay repository (a GitHub commit) was not opened: it is prior code, not a mathematical source, and the review needs none of its contents.
- **The equitable supplier's final form**: `EquitableOperatorReduction` is a draft pull request by the same author; what is cited here is its head as the brief gives it.

## Source issues

- none
