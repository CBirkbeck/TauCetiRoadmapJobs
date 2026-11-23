# Review of OperatorIdeals (pull request #2614 at 3cb0a14)
Folder: `TauCetiRoadmap/OperatorTheory/OperatorIdeals/`
**Verdict:** needs changes

**Summary.** Changes are needed for one statement: OI-A40 asserts the least-upper-bound formula for `aₙ(T)` on every pair with the localization property of OI-A38, which is defined for seminormed spaces, and the formula fails when the source has a nonzero vector of norm zero; the pinned declaration assumes a normed source, and adding those words repairs it. The record is intact: all 169 items of main are present under their ids with their statements, and every declaration named on an *In Tau Ceti* line exists at the pin. There are three small corrections and one format note, none blocking; the humans have the roadmap's status and a provenance question to decide.

## R01 (P2) — OI-A40 states the least-upper-bound formula without the normed source it needs

An implementer who takes the first clause of OI-A40 (§A4, line 329) at its word would try to prove it for the seminormed pairs that OI-A38 (line 319) allows, where it is false. The clause reads "On a pair with the property of OI-A38, `aₙ(T)` is the least upper bound of the constants `s` for which `T` is `s`-coercive on the span of some `n + 1` linearly independent vectors", and the qualifier "for a normed source" is attached only to the second clause.

Take `E = 𝕜²` with the seminorm `‖(x₁, x₂)‖ = |x₁|`, `F = 𝕜`, `T(x₁, x₂) = x₁`. Every bounded map `E → 𝕜` is a multiple of `T`, so the pair has the property of OI-A38: for `n = 0` the vector `e₂` has `s‖x‖ = 0 ≤ ‖Tx‖` on its span for every `s`, and for `n ≥ 1` every `aₙ` is `0` (rank at most `1`), so nothing is asked. But `a₀(T) = ‖T‖ = 1`, while the set of coercivity constants on the span of one independent vector contains every `s ≥ 0` (again by `e₂`), so it has no upper bound and `1` is not its supremum. The pinned `TauCeti.HasMinMaxLowerBound.isLUB_singularValue` assumes `[NormedAddCommGroup E]` (`TauCeti/Analysis/OperatorIdeal/ApproximationNumber/MinMax.lean`, lines 417–418 and 444); the upper bound is OI-A34, which the README already states for a normed source.

The smallest change: "On a pair with the property of OI-A38 and a normed source, `aₙ(T)` is the least upper bound …; this least-upper-bound property for every `T` and `n` characterizes the pairs with the property of OI-A38."

## C01 — The Check of §A1 on `diag(3, 1)` leaves the field open, and its values need `ℝ` or `ℂ`

§A1 fixes `𝕜` as any nontrivially normed field (line 131), and its first Check (line 206) computes `a₀(diag(3, 1)) = 3` "on `𝕜²` with the Euclidean norm". Over `ℚ₃` the scalar `3` has norm `1/3` and `a₀ = ‖T‖ = 1`. The Check of §A2 on the coefficients `1/(n + 1)` already says "Over `ℝ` or `ℂ`"; the same three words here, and in the Check of §A6 (entries `1` and `−2`, line 434), would make them true as written.

## C02 — OI-B55 is stated for an inner product target, and the declaration it names assumes a complete one

OI-B55 (§B3, line 693) takes "a bounded `T : E → F` between inner product spaces with `E` finite-dimensional"; `ContinuousLinearMap.hilbertSchmidtEnergy_eq_ofReal_sq_frobenius` carries `[CompleteSpace F]` (`TauCeti/Analysis/InnerProductSpace/HilbertSchmidt/Basic.lean`, line 196). The statement is true as written (for two orthonormal bases of a finite-dimensional `E`, `∑ ‖T bᵢ‖² = ∑ ‖T eⱼ‖²` by expanding `bᵢ` in the `eⱼ`, with no use of the target), so the line names a declaration that realises only the case of a Hilbert target. Either say "into a Hilbert space `F`" in the item, or keep the wider statement and add that the declaration covers a complete target. The description's sentence on OI-B55 ("for a finite-dimensional source only, which is all it needs") has the same gap.

## C03 — The description does not say that `Suggested.lean` loses the 49 declarations it has on main

The paragraph on `Suggested.lean` describes the file as it is now ("restates no statement the pinned library proves") but not the change: main's file declares 49 further definitions and theorems (from `singularValue` and `kyFanGauge` to `tsum_energy_isometryFamily_comp`), all removed here because the pinned Tau Ceti has them. A sentence such as "The 49 declarations of main's `Suggested.lean` that the pinned Tau Ceti now provides are removed; the items they stood for stay in the README with the realising declarations named" would tell a reader of the diff what happened to them.

## N01 — "needs no completeness" in OI-B90, OI-C15 and OI-C18 can only refer to the target

These items take a Hilbert basis `b` of the source, which makes the source complete (Mathlib's `HilbertBasis` is an isometric equivalence with `ℓ²`). Saying "no completeness of the target" would be exact.

## Verified sound

| Statement | Instances tried | Values computed, each side | Result |
| --- | --- | --- | --- |
| OI-A40, first clause (R01) | `E = 𝕜²`, seminorm `|x₁|`, `T = x₁`, `n = 0` | `a₀(T) = 1`; coercivity constants: all `s ≥ 0` via `e₂`; OI-A38 holds for the pair | fails; needs normed `E` (as pinned lemma) |
| OI-A40 on a normed pair | `E = F = ℝ²`, `T = diag(3, 1)`, `n = 1` | constants on the plane: `s ≤ 1`; `a₁ = 1` | holds |
| OI-A29 (headline) | identity of `ℓ²`; diagonal `1/(n+1)` over `ℝ` | `aₙ = 1`, not compact; `aₙ = 1/(n+1) → 0`, compact; pinned: `F` complete inner product, `E` seminormed | agrees with README |
| OI-A24 | `ℝ`, diagonal `1/(n+1)`; complete field needed | `aₙ > 0` all `n`, rank infinite; pinned `[CompleteSpace 𝕜]`, normed `E`, `F` | agrees |
| OI-A48 (headline) and §A1 Check | `S = diag(1,0)`, `T = diag(0,1)` | `a₁(S+T) = 1 > 0 + 0`; `K₂(S+T) = 2 = 1 + 1`; `K₁ = 1 ≤ 2`; pinned: `E` complete, `F` inner product | agrees |
| §A1 Check, `diag(3,1)` (C01) | `𝕜 = ℝ`; `𝕜 = ℚ₃` | `ℝ`: `(3, 1, 0)`; `ℚ₃`: `‖3‖ = 1/3`, `a₀ = 1` | true over `ℝ`, `ℂ` only |
| OI-A35 and §A4 Check | `diag(3,1)`, `n = 1` | `V = span e₀`: norm `1`; `V = span e₁`: norm `3`; infimum `1 = a₁` | holds |
| OI-A39 route | spectral projection of `x ↦ ‖Tx‖²` at `c²` | rank `≥ n+1`: `c`-coercive there; else `‖Tx‖ ≤ c‖x‖` on complement; matches pinned dichotomy | holds |
| OI-A49 and §A5 Check | `(x, y) ↦ (x+y, 0, 0)` | `T†T` eigenvalues `2, 0`; `σ = (√2, 0)`; `a₀ = ‖T‖ = √2`, `a₁ = 0` | holds |
| OI-A51, OI-A52 | `E` of rank `r`, `R` of rank `≤ n < r` | `ker R ≠ 0`, so `‖id − R‖ ≥ 1`; `n ≥ r`: `R = id` | holds over any field |
| OI-A55, OI-A56 | `dₙ = 1/(n+1)` over `ℝ`; `3ⁿ` over `ℚ₃` | `aₙ = |dₙ|`; last clause pinned with `[RCLike 𝕜]`; compactness with locally compact field | agrees |
| §A6 Check | `d = (1, −2)`, `𝕜³ → 𝕜²` over `ℝ` | `(2, 1, 0, …)`, `a₀ = ‖D‖ = 2` | holds |
| OI-B31 | identity, infinite rank | `aₙ = 1` all `n` (OI-A51), `ν = ∞` | holds |
| OI-B35 and §B2 Check | projection onto `(1,1)` in two bases | energies `1/2 + 1/2 = 1` and `1 + 0 = 1`; unsquared `√2` vs `1` | holds |
| OI-B40, energy form | `B = 0`, `E_c(T) = ∞` | left `0`; right `‖A‖ₑ² · ∞ · 0 = 0` | holds |
| OI-B47–B54 and §B3 Check | `diag(3, 4)` | `σ = (4, 3)`; `‖·‖₁ = 7`, `‖·‖₂ = 5 = √25`, `‖·‖_∞ = 4` | holds |
| OI-B55 (C02) | `E` finite-dimensional, `F` incomplete | `∑‖T bᵢ‖² = ∑‖T eⱼ‖²` by change of basis; pinned lemma has `[CompleteSpace F]` | true; declaration narrower |
| OI-B59, OI-B62 | `c = ∞, a = 0`; `c = ∞, a = e₀`; `c = 0, Φ∞(a) = ∞` | `0 = 0`; `∞ = ∞`; `0 = 0` | holds for every `c ∈ ℝ≥0∞` |
| OI-B63 | `c ≤ a + b` finitely supported | `c = min(c, a) + (c − min(c, a))`, parts `≤ a`, `≤ b` | holds |
| OI-B72 (stated in Lean) | `a 0 = ∞`; `a` finite antitone; universes `u > v` | both `∞`; `a = a(D)`, `D` diagonal on `ℓ²(ℕ, 𝕜)`; `ℓ²(ℕ, 𝕜) : Type u`, so the transport from `ℓ²(ℕ, ℂ)` or `ℓ²(ℕ, ℝ)` is needed | route sound; pinned lemma has `𝕜 : Type`, families `.{0,0,0}` |
| §B4 Checks | constant `1`; `(1,1,0,…)`; rank one | sup gauge `1`, `ℓᵖ` gauge `∞`; `1` vs `√2`; `‖u‖‖v‖` | hold |
| OI-B74 | pinned hypotheses | only `Antitone a` assumed, in both forms | agrees |
| OI-B88, OI-B87 and §B5 Check | `(n+1)^(−1/r)`, `p < r < q` | `∑ (n+1)^(−q/r) < ∞` iff `q > r`: in `S_q`, not `S_p` | holds, strict |
| OI-B90 (headline) | diagonal `1/(n+1)`; rank one | both sides `π²/6`; `‖u‖²‖v‖²` both sides | holds; pinned: `E` complete, `F` inner product |
| OI-B89, OI-B91 and §B6 Checks | `(3,1,0,…)`, `(2,2,0,…)`; `(1,1,…)`, `(1/2,0,…)` | merge `(3,2,2,1,0,…)`; trace norm `8 = 4+4`, operator norm `3`; second merge constant `1` | hold |
| OI-B91, `≤` on seminormed spaces | `R₁ ⊕ R₂`, ranks `i + j = n` | `aₙ ≤ min_{i+j=n} max(aᵢ(T₁), aⱼ(T₂)) = (a ⊔↓ b)ₙ` | holds |
| §B6 target, every family | `Qᵢ`, `Pᵢ` coordinate projections | `Φ(QᵢTPᵢ) ≤ Φ(T)` by ideal law; `Φ(T) ≤` sum by subadditivity; `Φ(T₁) = Φ(ι₁T₁π₁)` both ways | holds |
| OI-C08, OI-C14 and §C1 Check | `fᵢ = bᵢ/(i+1)`; identity | `‖f‖² = π²/6 = E_b(T_f)`; identity columns of norm `1`, not in `ℓ²` | hold |
| OI-C16 and §C2 Check | `V : 𝕜 → 𝕜²`, `T = id` | `‖T‖_HS = √2`, `‖TV‖_HS = 1`; `V†` not isometric | hypothesis on `V†` needed, as stated |
| OI-C18–C20 and §C3 Check | coordinate projections of `𝕜²` | `1 + 1 = 2 = E(id)` | holds |
| Scope: "Already in Mathlib" | `LinearMap.singularValues`, `ContinuousLinearMap.sSup_unitClosedBall_eq_norm` | `Mathlib/Analysis/InnerProductSpace/SingularValues.lean` line 95, zero from `finrank` on (line 125); `Mathlib/Analysis/Normed/Operator/NNNorm.lean` line 213 | as cited |
| Scope: "Owned elsewhere" | PD-A36; Majorization sections; SNumbers | PolarDecomposition line 211 defines the modulus as `CFC.sqrt (T† ∘L T)`; three Majorization headings exist (lines 168, 225, 313); SNumbers owns the other s-numbers | as cited |
| Scope: "This roadmap owns" | SNumbers, SchattenClassesAndSchurMultipliers, Majorization ownership sections | each names OperatorIdeals as owner of approximation numbers, their gauges and the Schatten families | single owner |

- Record against main: 169 item ids on main, 169 at the head, none missing, none duplicated; two titles widened (OI-A24, OI-A28) with the same subject; D1–D7, the milestones and the worked examples are all present; the credit of main's Acknowledgements is kept under Provenance.
- Library names: all 250 names on *In Tau Ceti* lines and the Mathlib names of the supplier contracts resolve at the pins (elaborated by `#check` for the built modules, read in source for `HilbertSchmidt/Isometry.lean`, `HilbertSchmidt/Pythagoras.lean`, `ApproximationNumber/Modulus.lean`, `FiniteDiagonal.lean`, `Projection.lean`, `Attainment.lean`, `Isometry.lean`, `Family/BlockSum.lean`); about 60 signatures compared with their items.
- Source locators checked against the text: Ull24 line 21 (real or complex Banach spaces), lines 38–40 ((S1)–(S3)), line 48 ((S5)), lines 52–56 (approximation numbers, one-based), lines 93–95 (Remark 1: additivity and multiplicativity of `aₙ`); the article number 82 agrees with the arXiv record.
- Cross-roadmap citations resolved: PolarDecomposition PD-A36 and Part C; Majorization (three sections); the eleven downstream roadmaps exist on main and cite the items named.
- Dependency check: `depcheck: 133 roadmaps, 1479 edges, 0 problem(s)`; no UPWARD or CYCLE line. The diff against the base touches only this folder's `README.md` and `Suggested.lean`.
- Elaboration: `lake env lean` on `Suggested.lean` gives one warning, "declaration uses `sorry`" (line 48), and the nine `#check` outputs. `#check @symmetricGaugeFamily_injective` keeps `[RCLike 𝕜]`, the hypothesis on the families and `Antitone a`, as OI-B72 states.
- One-tactic probe of `symmetricGaugeFamily_injective`: `exact TauCeti.SymmetricGauge.extend_eq_of_operatorIdealFamily_eq h ha` fails (universes), as do `simp_all`, `rfl`, `aesop` and `exact?`: not padding. All nine headlines of the module docstring are stated or pinned; none is unstatable.
- The automatic checks all pass on this head.

Previous findings (review of `2e05baa`): it had no finding. Its C01 (classical sources cited by title alone, the two targets without locators) is repaired in the main: §B4 now cites "Gohberg and Kreĭn, Ch. III: symmetric norming functions from p. 71, … relation (3.12) of §3, p. 76", §A6 "Pietsch, *Operator Ideals*, Thm 11.11.3", §B2 "Reed and Simon I, Thm VI.22", and OI-B72 cites Gohberg and Kreĭn, Ch. III; the §B6 target follows from the two laws it names and needs none.

Overlap check: read SNumbers (main and its open revision), SchattenClassesAndSchurMultipliers, Majorization, EigenvalueAndSingularValueInequalities, NoncommutativeGeometry; approximation numbers, Ky Fan gauges, symmetric gauges and Schatten families: OperatorIdeals; the other s-number sequences: SNumbers; finite-dimensional Ky Fan sums and unitarily invariant seminorms: Majorization; nothing has two owners.

Source independence: 6 passages compared with 1 source (Ull24 lines 21, 38–40, 48, 52–56, 93–95 against §A1, OI-A01, OI-A23), none shared beyond formulas and "real or complex Banach spaces"; largest share Pietsch's two books, 8 of 36 citations, which could not be read; contents compared with Ull24 only (a seven-page article, no correspondence with Parts A–C): independent as far as tested.

Research link: Part A is the approximation-number theory in which s-number research is stated (Ullrich 2024, Ull24 §1); Part B's Schatten and trace-class families are consumed by NoncommutativeGeometry, NoncommutativeIntegration, VonNeumannAlgebras and SchattenClassesAndSchurMultipliers. Rests on Ull24 and the README's Downstream consumers.

## Not verifiable

- Pietsch, *Operator Ideals* (Thm 11.11.3) and *Eigenvalues and s-Numbers* (Ch. 2): no legal copy found; locators not checked.
- Gohberg and Kreĭn (Ch. II; Ch. III, p. 71 and relation (3.12), p. 76), Simon, *Trace Ideals* (Ch. 2), Reed and Simon I (Thm VI.22), Mirsky (1960), Horn and Johnson (Thm 4.2.6): no open copy; locators not checked.
- Bhatia, *Matrix Analysis*, and Eckart and Young (1936): settled as uncertified (paywalled).

## Source issues

- none

## For the human reviewers

- Status: every item of Parts A–C names realising Tau Ceti declarations at the pin except two targets (OI-B72 in arbitrary universes, README line 770; the block bounds for every family, line 922). Whether the roadmap stays open is yours.
- Licence: `Suggested.lean` line 2 carries "Copyright (c) 2026 Kitware, Inc.", as on main; Provenance (README lines 1116–1124) names an Apache-2.0 implementation in AIQ-Kitware/aiq-dkps-formalization. The one stated theorem was not compared with that repository.
- Not tested: Pietsch's two books, the most-cited source, and Gohberg–Kreĭn could not be read, so wording and arrangement were not compared with them.
