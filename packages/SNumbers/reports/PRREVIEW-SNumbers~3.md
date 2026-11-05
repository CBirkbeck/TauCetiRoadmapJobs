# Review of SNumbers (pull request #1650 at 20aa549)

**Verdict:** accepted

Incremental re-review of the 75 lines changed since 7b6413c (19 in `README.md`, 56 in `Suggested.lean`). Every blocking finding of the previous review is repaired at this head, the gate passes, and the three new Lean statements carry the hypotheses their mathematics needs. Two P3 notes remain, both carried from the previous review; they are the author's to take or leave.

## R01 (P3) — Most targets still have no claim-level locator

**Location:** `TauCetiRoadmap/SNumbers/README.md:192`–197, 217–219, 279–291, 436–458, 489–516: for instance `SN-A12`, `SN-A16`, `SN-B06`–`SN-B08`, `SN-D03`–`SN-D06`, `SN-D08`–`SN-D10`, `SN-E01`–`SN-E03`, `SN-E07`–`SN-E08` end without a source reference.

**Claim:** The References section (lines 621–644) identifies every target well enough.

**Witness:** The two locators the previous review found wrong are now right (`SN-A09`: Pietsch 1974 §4, pp. 206–207, pietsch1974 line 147–162 defines the Gelfand numbers and Theorem 4.1 makes them an injective s-number function; `SN-C17`/`SN-C18`: Theorem 9.5 at pietsch1974 line 552 is additivity only, and the blueprint Theorems 3.6 and 3.8 at lean-snumbers line 237 and 283 state the multiplicative law with its proof at lines 250–254 and 299–303). The targets listed above still cite nothing at the claim.

**Repair:** Give each of them its theorem or section and printed page (for most, the blueprint chapter the Provenance section already maps, or Pietsch 1974 §§4–9); keep the corrected locators. This is the unrepaired part of the previous review's R04.

## R02 (P3) — The README and the Lean file keep the catalogue shape

**Location:** `TauCetiRoadmap/SNumbers/README.md:135`–139 (“The labels in Parts A–E are the complete obligation set”), 597–619 (“## Definitions”); `TauCetiRoadmap/SNumbers/Suggested.lean:10`–11 (“not the roadmap and is not exhaustive … suggested forms”), 341–375 and 395–438.

**Claim:** The labelled target list, the milestone lines and the global Worked examples supply the per-definition API, Checks and per-layer dependencies.

**Witness:** There is no `*Needs:*` line and no `### Examples` / `### Dependencies` section in the file; `SN-A16` and `SN-A18` have no Check at all; the Lean name `diagOp` (used by the two diagonal headlines) occurs nowhere in the README; the lifting identity `SN-A14` is stated under the `/-! ## Part D -/` section comment (line 341, theorem at 370) and the embedding identity `SN-A15` under `/-! ### Part B -/` (line 395, theorem at 435), and the duality section follows Part E.

**Repair:** Apply the house shape (Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, numbered layers with `### k.n` prose subsections carrying `*Needs:*` lines, Examples and Dependencies per layer, Downstream consumers), give each definition its API bullets and at least three discriminating Checks, name the retained Lean declarations in the README, put the Lean section comments in README layer order, and open the module docstring with “s-numbers and entropy numbers: target signatures”. The mathematics need not change. This is the previous review's R05, unrepaired.

## Previous findings

- R01 — repaired: README 63 “Pietsch's lifting identity needs a complete `DenselyNormedField 𝕜`”, README 198–199 “Over a complete `DenselyNormedField 𝕜`, for complete `X`”, with the ℚ-scalar negative control at 204–205; Lean 370–371 carries `[CompleteSpace 𝕜]` and `[CompleteSpace X]`.
- R02 — repaired: Lean 5 is `module`; the worker's gate records `build=0`.
- R03 — repaired: `kolmogorovNumber_eq_approximationNumber_comp_summation` (Lean 370), `gelfandNumber_eq_approximationNumber_embedding_comp` (Lean 435) and `IsStrictSNumberSequence.apply_diagOp` (Lean 570) state A14, A15 and E04 on native `lp`, `StrongDual` and `PiLp` carriers; the docstring lists them (Lean 23, 31).
- R04 — partly repaired: the §4 and Theorem 9.5 locators are corrected (README 182, 394–395); claim-level locators for most other targets are still absent (R01 above).
- R05 — not repaired: README 135–139 and 597–619 keep the label-catalogue shape with no `*Needs:*` lines (R02 above).
- R06 — repaired: Lean 46 pins `ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm`; the gate records `readme-ids-missing=0`.
- R07 — repaired: `IsSNumberSequence.le_nnnorm` and `entropyNumber_zero` are gone from the file (no occurrence at this head); the README keeps both statements in prose (`SN-A04`, `SN-D02`).

No repair introduced a new mathematical problem; the only side effects are the two section-comment placements noted under R02.

## Verified sound

### Gate, dependency check and elaboration

The head is `20aa5498a9d59eb52e293f0e548e13f6154f2dca`; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml` only. The worker's gate at this head: every counter `0`, `OK` (build included). The prescribed dependency command returned exactly:

```text
depcheck: 205 roadmaps, 1651 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line; SNumbers is at line 374 of the merge order, after OperatorIdeals and BanachSpaceTheory, both on main.

A scratch copy of `Suggested.lean` (in my scratch directory, the worktree untouched) elaborated with `lake env lean`: with the three new theorems' `sorry` replaced by `first | rfl | simp | infer_instance`, the run produced exactly 54 `sorry` warnings (57 sorried declarations minus the 3 probed) and 3 errors, one at each probe, so none of the three closes in one tactic; no other diagnostic. The same run printed `#check @` for the three new names and `diagOp`; the elaborated types agree with the README: the lifting identity has `[DenselyNormedField 𝕜] [CompleteSpace 𝕜] … [CompleteSpace X]` with `Q` fixed by `∀ α, Q α = ∑' x, α x • x` over the subtype `closedBall (0 : X) 1`; the embedding identity is over `RCLike 𝕜` with `J` fixed by `J y φ = φ y` on `closedBall (0 : StrongDual 𝕜 Y) 1`; the diagonal theorem is over `RCLike 𝕜` for a strict family, `Fact (1 ≤ p)`, `Antitone (‖σ ·‖)`, `n < m`. The pinned `#check` at Lean 46 prints the Mathlib statement with `[DenselyNormedField 𝕜]`, the hypothesis `SN-A11` names. The 80 signatures in the worker's record lose no section binder.

### Adversarial pass: changed statements (computed at this head)

Notation as in the previous report: U = id_ℝ, R = 3·id_ℝ, D = diag(3,1) on Euclidean ℝ².

| Statement | Instances tried and values on each side | Result; change |
|---|---|---|
| A14 lifting, Lean 370 | Over ℝ, T = R: n = 0 gives d₀ = 3 and a₀(RQ) = ‖RQ‖ = 3·sup_{B_ℝ}|x| = 3; n = 1 gives d₁ = 0 (V = ℝ) and a₁(RQ) = 0 (RQ has rank 1). Over ℚ (dense norm, not complete), X = Y = ℝ, T = U, n = 1: d₁ = 0 since ℚ·1 is dense in ℝ (quotient seminorm 0); a₁(Q) = 1: a rank-≤1 ℚ-linear continuous L has finitely many nonzero columns L δ_x (otherwise, choosing rational t_j with |t_j| ≤ 2⁻ʲ and v_j = t_j L δ_{x_j} ∈ (0, 2⁻ʲ v_{j−1}], the 2^ℵ₀ sums ∑ ε_j v_j are distinct points of the countable range), and |x| ↗ 1 on the other columns gives ‖Q − L‖ ≥ 1 = ‖Q‖. Over ℚ₂ (complete, discrete norm), X = Y = ℚ₂ with norm (3/2)|·|₂, T = U, n = 0: d₀ = 1 but a₀(Q) = sup_{B_X}‖x‖ = 3/4. | Pass: `[CompleteSpace 𝕜]` excludes the ℚ instance, `DenselyNormedField` the ℚ₂ instance; the README Check at 204–205 is exactly the first control. Reverse inequality needs only that the finite-dimensional V is complete (`FiniteDimensional.complete`, pinned `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:507`), so Y may be incomplete. Q exists for every complete X (absolutely convergent series), so the hypothesis is satisfiable. |
| A15 embedding, Lean 435 | Over ℝ, Y = ℝ: B_{Y*} = {φ_t : y ↦ ty, |t| ≤ 1}, J y = (ty)_t, ‖J y‖_∞ = |y|. T = R: n = 0 gives c₀ = 3 = ‖JR‖ = a₀(JR); n = 1 gives c₁ = 0 (M = 0) and a₁(JR) = 0. T = D on ℓ₂²: c₁(D) = 1; a₁(JD) ≤ ‖J(D − diag(3,0))‖ = 1 and ≥ ‖(JD)|_{ker L}‖ = ‖D|_{ker L}‖ ≥ 1 for every rank-1 L, so a₁(JD) = 1. Zero J fails the evaluation hypothesis and would give 0 ≠ 3. | Pass; J is fixed by the hypothesis and exists (bounded by ‖y‖); Hahn–Banach needs `RCLike`, in scope. |
| E04 same-exponent diagonal, Lean 570 | σ = (3,1), p = 1, n = 0: ‖D_σ‖ = 3 = |σ₀|; n = 1: a₁ = ‖D_σ − diag(3,0)‖ = 1 and, for every strict s, s₁ ≥ 1 via (S3) with ι = inclusion of the first two coordinates (norm 1), P = coordinate projection (norm 1 in ℓ_p), B = (D_σ|_M)⁻¹ ∘ P of norm 1/|σ₁| = 1, then (S5′) on M ≅ ℓ_p² gives 1 ≤ s₁(D_σ); so s₁ = 1 = |σ₁|. σ = (0,1) violates `Antitone` and would give a₀ = 1 ≠ 0. σ_n = 0: both sides 0. Non-strict control: h on id_{ℓ₁^m} = D_{(1,…,1)} has h_n < 1 = |σ_n| for n + 1 > κ² (`SN-E13`), so strictness is needed and is in the hypothesis. m = 1, n = 0: s₀(σ₀·id) = |σ₀| by (S1). | Pass; `n < m` makes the index legal, `Fact (1 ≤ p)` covers p = ∞. |
| C18 multiplicativity (locator change) | S = diag(3,0), T = diag(0,1), m = n = 1: d₂(ST) = 0 ≤ d₁(S)d₁(T) = 0. S = D, T = id on ℓ₂², m = 1, n = 0: d₁(ST) = 1 ≤ d₁(S)·d₀(T) = 1·1; m = 0, n = 1: 1 ≤ 3·1. Proof route W + S(V) at README 391–394 agrees with lean-snumbers line 299–302. | Pass; locator now distinguishes additivity (Pietsch 9.5) from multiplicativity (blueprint 3.6/3.8). |
| A09 (locator change) | Pietsch 1974 §4 at pietsch1974 line 147–162: definition of c_n and Theorem 4.1 (injective s-number function). Values unchanged: weighted ℚ₂ line (1,0,…), H gives c_n = 1. | Pass. |
| Conventions, README 56–65 | Each field class named in the paragraph matches a Lean section: `NontriviallyNormedField` (General), `CompleteSpace 𝕜` for strictness of a, d (Lean 260, 267, 279), `DenselyNormedField` for `multiplicative_entropy` (Lean 358–363), complete dense field for the lifting (Lean 370), `RCLike` for the rest. | Pass. |

### Adversarial pass: statements the diff leaves untouched (carried from the review at 7b6413c)

The rows below repeat the computed values of the previous report (its “Adversarial computations” table); each row cites that report by its label.

| Statement | Values (r2) | Result |
|---|---|---|
| Conventions, suprema/infima (r2) | O: s₀ = 0; U: s₀ = 1, s₁ = 0; zero space norm 0 excluded by n < rank; empty Bernstein family sup 0. | Pass |
| A01–A05 (r2) | R: a, c, d, b, h = (3,0,…), e = (3, 3/2, …); U + (−U): 0 ≤ 2; 2U∘3U∘4U: 24 = 24; id_ℝ² at n = 1: 1; R, U at n = 0: |3 − 1| = 2 = ‖R − U‖; c = −2: 6 = 2·3. | Pass |
| A06–A07 (r2) | Weighted ℚ₂ line: a₀ = 1, a₁ = 0, ball sup 3/4; id_ℝ²: a = (1,1,0,…). | Pass |
| A08–A13 (r2) | D: c = d = (3,1,0,…); full domain at n = 0 gives 3 not 0; weighted ℚ₂ identity d₀ = 1 vs deviation 3/4 (A11 Check); U + (−U): d₀ = 0 ≤ 2; incomplete ℚ, X = ℝ: d₁(id) = 0 excluded by completeness. | Pass |
| A16–A20 (r2) | D: gains 3, 1, b₂ = 0; U: b = (1,0,…); R: h = (3,0,…); I: h₂ = 1/3 vs c₂ ≥ 1/2; ratio form at A = 2U, B = 4U: 24/8 = 3. | Pass |
| A21–A24 (r2) | J(t) = (t,0), Q(x,y) = x on max-norm ℝ²: ‖J(2)‖ = 2, minimal preimage of 2 has norm 2; c₀(JR) = 3, d₀(RQ) = 3; D into ℝ³: c unchanged; finite-support ℚ₂ summation: d₀(Q) = 1 = d₀(id), deviation 1/2. | Pass |
| B01–B05 (r2) | R: s₀ = a₀ = 3; I: h₂ = 1/3 ≤ a₂ = 1/2; D, n = 1, c = 1/2: B = diag(1/6, 1/2); D: s = (3,1,0,…) = σ; zero-dimensional map: 0 = 0. | Pass |
| B06–B10 (r2) | R([−1,1]) by balls at ±1.5 radius 1.5: d₂ = 0 ≤ 1.5, c₂ = 0 ≤ 3; C: d_n = 1/(n+1) → 0, H: d_n = 1; ε = δ = 0.01, ‖T‖ = 1: error 0.0301; 𝔽₂(u)((t)): d-tail 0, not compact, excluded by RCLike. | Pass |
| B11–B12 (r2) | D, n = 1: 1 ≤ 1; O: 0 ≤ 0; R, n = 0, s = c: 3 ≤ 3; gain 1 gives inverse norm 1. | Pass |
| C01–C03 (r2) | D: 3 ≤ 3, 1 ≤ 2, 0 ≤ 0 for both bounds; zero-dimensional V uses P = 0. | Pass |
| C04–C08 (r2) | O: Δ₀ = 1, Δ₁ = 0; D: Δ₁ = 3, Δ₂ = 3, Δ₃ = 0; 3·1 = |det D|; bordered [[2,6],[5,17]], w = 3: 4 = (17 − 15)·2; lower recursion D: 3 ≤ 3, 0.75 ≤ 3; upper: 3 ≤ 3·1, 3 ≤ 1·3. | Pass |
| C09–C12 (r2) | D, n = 0: 3 ≤ 3; n = 1: 1 ≤ 4; I, n = 2: 1/2 ≤ 27/12 = 9/4 and 1/2 ≤ e; D, n = 1: max(1,1) ≤ 2e. | Pass |
| C13–C15 (r2) | D′ = D, n = 1: 1 = 1; T(z) = iz: Banach dual sends φ(z) = z to iz; R compact: c(R′) = (3,0,…) = d(R). | Pass |
| C16–C19 (r2) | R + U at 0: 4 ≤ 4; R∘U: 3 ≤ 3; S = diag(3,0), T = diag(0,1), m = n = 1: 0 ≤ 0 for c, d, h laws. | Pass |
| C20–C22 (r2) | N = 3, n = 1: b₁(ℓ₂³→ℓ∞³) ≤ 1/√2, reverse ≤ √(3/2); b₂(ST) = 1 > b₁(S)b₁(T) ≤ √3/2 ≈ 0.866; N = 71: b₇₀(S+T) ≥ 1/3 > 1/6 + √71/54 ≈ 0.3227. | Pass |
| D01–D06 (r2) | R: e = (3, 1.5, 0.75, …); weighted ℚ₂ identity e₀ = 3/4 < 1 (D02 needs RCLike); R + U, m = n = 1: e₂(4U) = 1 ≤ 2; R∘U: e₂(3U) = 0.75 = 1.5·0.5; U: e₁ = 1/2 > 0; H: e_n = 1, not compact. | Pass |
| D07–D14 (r2) | R, n = 0: d₁ = c₁ = 0 ≤ 3, 6; H, n = 1: 1 ≤ 1 ≤ 2; U: e₀ = 1 ≥ 1/2, e₁ = 1/2 ≥ 1/2; id_ℝ², n = 1, γ = 1/2 flag with distance 1 > 1/2; signs in ℝ²: norm 1/√2, separation 1; R, n = 0: 3 ≤ 6, 3 ≤ 6e; H, n = 1: 1 ≤ 2, 1 ≤ 4e. | Pass |
| E01–E03, E05–E06 (r2) | m = 2, p = 1, q = 2: norm √2, a₀ = √2, a₁ = 1; σ = (3,1), r = 2: a₀ = √10, a₁ = 1; q = 1, p = ∞: norm 3, a₁ ≤ 1; (0,1) at n = 0: 1 > 0 refuted by ordering. | Pass |
| E07–E12 (r2) | w = (1,1): mean of signed squared norms 2 = ∑‖w_j‖²; (1,i): all 2; identities ℓ∞²→ℓ₂², ℓ₂²→ℓ₁²: sums 2 = ‖·‖²; a = b = 1, n = 0: 1 ≤ 1 ≤ 1; I: c_n ∈ [1/2, 1], h_n = 1, 1/2, 1/3; n = 2: (3/2)(1/3) = 1/2 ≤ c₂. | Pass |
| E13–E14 (r2) | m = 1, n = 0: 1 ≤ h₀ = 1 ≤ 8; m = 65, n = 64: h₆₄ ∈ [1/√65, 8/√65] < 1; κ = 8, n = 8192, m = 16385: 67125249 > 67112960. | Pass |
| Definitions D1–D8, family aliases, `diagOp`, `dualOp` (r2) | Same values as their targets; diagOp(3,1)(1,2) = (3,2); dual of multiplication by i sends the identity functional to iz. | Pass |

### Sources checked at this head

| Locator in the diff | Text at the locator |
|---|---|
| README 182, “Pietsch 1974, §4” | pietsch1974 line 147 (“4. Injective s-numbers”, printed pp. 206–207), line 158–159 (definition of c_n by codimension), line 160–162 (Theorem 4.1: the Gelfand numbers are an injective s-number function; Pietsch's 1974 normalisation is the strict one). Supports strictness and injectivity of c as stated. |
| README 394–395, “Pietsch 1974, Theorem 9.5” | pietsch1974 line 552–553, printed p. 222: approximation, Gelfand and Kolmogorov numbers are additive. Additivity only, as the README now says. |
| README 395, “Lean-SNumbers blueprint, Theorems 3.6 and 3.8” | lean-snumbers (blueprint dated 2 November 2026) line 237–242 (Theorem 3.6, printed p. 9: c strict, additive and multiplicative over a nontrivially normed field, proof of multiplicativity at 250–254 via T⁻¹(M) ∩ N) and line 283–288 (Theorem 3.8, printed p. 10, proof at 299–303 via V + R(U)). |
| README 198–205 (A14 hypotheses) | lean-snumbers line 340–347: the lifting development assumes a densely normed field and complete sources; Theorem 3.10 (line 345) states the identity for Banach X; its proof (line 352–354) sums ∑ α(x) w_x inside V, which needs V complete, hence a complete scalar field (see Source issues). Pietsch 1974 is stated for real or complex Banach spaces, where all hypotheses hold. |

### Pinned declarations opened

| Pinned file and line | What was checked |
|---|---|
| `Mathlib/Analysis/Normed/Operator/NNNorm.lean:200` | `ContinuousLinearMap.sSup_unitClosedBall_eq_nnnorm` under `[DenselyNormedField 𝕜]`; elaborated `#check` confirms. Used by `SN-A11` and by the forward inequality of `SN-A14`. |
| `Mathlib/Analysis/Normed/Field/Lemmas.lean:276` | `Rat.instDenselyNormedField`: ℚ with its usual norm is densely normed, so the ℚ control of `SN-A14` fails only `CompleteSpace 𝕜`. |
| `Mathlib/Topology/Algebra/Module/FiniteDimension.lean:507` | `FiniteDimensional.complete` (complete scalars): the finite-dimensional V of the reverse inequality is complete, so the lifting needs no completeness of Y. |

### Cross-roadmap citations

The diff adds no cross-roadmap citation. The OperatorIdeals labels the changed passages rely on (`OI-A01`, `OI-A17`, `OI-A22`, `OI-A49`) resolve on main `929496d` at `TauCetiRoadmap/OperatorTheory/OperatorIdeals/README.md:125`, `:150`, `:159`, `:245`, and `singularValue` is declared in that roadmap's `Suggested.lean` (Part A header, line 27). The ownership, duplication and open-pull-request searches of the previous review stand: no open pull request listed in this brief states the Gelfand, Kolmogorov, Bernstein, Hilbert or entropy numbers; the two Pietsch identities and the diagonal formula are consequences of those objects and belong here.

## Not verifiable

- `pietsch1980`, `pietsch1987`, `carl1990`, `garling1971`, `kadets1971`, `mityagin1963`: no legal full text was available in the previous round and nothing in the diff cites them anew; the limitation recorded at 7b6413c stands.
- Ownership against open pull requests whose files this brief does not give was not checked beyond the indexed `roadmaps grep` of the previous round, which the diff does not affect.

## Source issues

- **Error** in lean-snumbers at Theorem 3.10, printed p. 12: the source says the lifting identity holds for every Banach space over a densely normed field; it should also require a complete scalar field, since the rank-≤ n lift sums a series inside a finite-dimensional subspace (ℚ-scalars, X = Y = ℝ refute it); affects a stated result.
- **Error** in lean-snumbers at Theorem 3.8, printed pp. 10–11: the source says the Kolmogorov numbers are strict over every nontrivially normed field; the (S5′) step needs a complete field, as its own proof note at printed p. 11 concedes; affects a stated result.
