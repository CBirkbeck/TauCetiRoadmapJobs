# Review of TracesOnCStarAlgebras (pull request #2464 at 4b14cb0)

**Verdict:** needs changes

Six findings, all P3; none blocks on the mathematics. The gate passes and no statement was refuted.

## R01 (P3) — the README names none of the declarations of `Suggested.lean`

**Location:** `TauCetiRoadmap/TracesOnCStarAlgebras/README.md`, whole file; `TauCetiRoadmap/TracesOnCStarAlgebras/Suggested.lean` lines 62–325.
**Claim:** README and Lean agree: every Lean name appears in the README at the statement it formalises.
**Witness:** `IsTrace`, `finitePart`, `sqIntegrable`, `domain`, `IsSemifinite`, `IsDenselyDefined`, `matrixTrace`, `traceIdeal`, `traceGauge`, `exists_normal_extension`: 0 occurrences each in the README; only V6's `IsNormalSemifiniteTrace` occurs (5).
**Repair:** Add each backticked name where its statement stands, e.g. Conventions: "A trace (`IsTrace`) is a map …", "`𝔪_τ⁺` (`finitePart`), `𝔫_τ` (`sqIntegrable`), `𝔪_τ` (`domain`)", "the trace gauge (`traceGauge`) … the trace ideal (`traceIdeal`)"; Tr2.2: "Normal extension theorem (`IsTrace.exists_normal_extension`)"; likewise for the other theorems of Tr1–Tr3 that the file states.

## R02 (P3) — `traceIdeal_two` is padding

**Location:** `Suggested.lean` lines 239–241, "`theorem traceIdeal_two (τ : B → ℝ≥0∞) : traceIdeal τ 2 = sqIntegrable τ`".
**Claim:** A headline of the roadmap.
**Witness:** On a scratch copy, `by simp [traceIdeal, sqIntegrable, CFC.abs_nnrpow_two]` closes it with no error (Mathlib `CFC.abs_nnrpow_two`, `Mathlib/Analysis/SpecialFunctions/ContinuousFunctionalCalculus/Abs.lean:107`). It holds for every map `τ`, trace or not.
**Repair:** Delete it from `Suggested.lean`; README Tr3.2 keeps the endpoint `J₂ = 𝔫_τ`.

## R03 (P3) — adjoint invariance is stated only for semifinite lower semicontinuous traces, and holds for every trace

**Location:** README line 446, "Consequently … `τ(f(x*x)) = τ(f(xx*))` for every continuous `f : [0,∞) → [0,∞)` with `f(0) = 0` (polar decomposition in `M_τ`, V10.ClosedOperators)"; `Suggested.lean` lines 265–269 (`hlsc`, `hsf`).
**Claim:** The identity, hence `‖b*‖_{τ,p} = ‖b‖_{τ,p}`, needs the normal extension.
**Witness:** `h = f^{1/2}`, `h_n → h` uniformly with `h_n = 0` near `0`, `y_n = x·(h_n(t)/√t)(x*x) ∈ B`: `y_n*y_n = h_n(x*x)²`, `y_ny_n* = h_n(xx*)²`, `(y_n)` Cauchy; the limit `y` has `τ(f(x*x)) = τ(y*y) = τ(yy*) = τ(f(xx*))`. Instance excluded today: `M₂(C[0,1])`, point trace, `b = e₁₂ ⊗ g`: both gauges are `0` or `∞` with `g(x₀)`.
**Repair:** Move the sentence to Tr1.1 as "For every trace, `τ(f(x*x)) = τ(f(xx*))` for continuous `f ≥ 0` with `f(0) = 0`: the norm limit `y` of `x·(h_n(t)/√t)(x*x)`, `h_n → f^{1/2}` vanishing near `0`, has `y*y = f(x*x)` and `yy* = f(xx*)`"; say "for every trace" at the adjoint clause of Tr3.1 (as Tr3.2 does for monotonicity); drop `hlsc` and `hsf` from `IsTrace.traceGauge_star`.

## R04 (P3) — the functional `τ^†` of Tr4.2 is not the one of the cited theorem

**Location:** README line 645, "`𝔪_τ^† = 𝔪_τ + ℂ1 ⊆ B^†` carries `τ^†(x + λ1) = τ(x) + λ`; … (Theorem 4.2, with Corollary 4.7 and Lemma 4.9)".
**Claim:** Thomsen's Theorem 4.2 is about this `τ^†`.
**Witness:** thomsen-wtk lines 264–265: the source's `τ^†(a, λ)` is `τ(a)`, with no `λ`; Theorem 4.2 (lines 274–278), Corollary 4.7 and Lemma 4.9 are proved for that functional. On `[1] ∈ K₀(B^†)` the source's map gives `0`, the README's gives `1`.
**Repair:** Add after the definition: "Thomsen's `τ^†` omits the summand `λ`; the two functionals differ by `λ·Tr_n` of the scalar part, a trace on `M_n(𝔪_τ^†)`, so the two maps on `K₀(B^†)` differ by the rank homomorphism `K₀(B^†) → K₀(ℂ) = ℤ` and agree on `K₀(B)`; the normalisation here is that of OperatorKTheory K1.5's `τ⁺`."

## R05 (P3) — a docstring cites a source the README does not list

**Location:** `Suggested.lean` line 182, "restating VonNeumannAlgebras V6's predicate (Anantharaman–Popa, Definition 8.3.1, pp. 124–125)".
**Claim:** Every source cited in the folder is in the README's references.
**Witness:** `grep -c Anantharaman README.md` = 0; the README's References list seven works, none of them this one. The locator is VonNeumannAlgebras Layer 6's own (its README line 2149).
**Repair:** Replace the parenthesis by "(README, Conventions; the definition and its source are VonNeumannAlgebras V6's)".

## R06 (P3) — the description omits two suppliers and one source

**Location:** pull-request description, "Boundaries" and "Every source is freely available: Dixmier 1963 (Numdam), Thomsen's … Kaad–Nest–Rennie (arXiv)."
**Claim:** The description names the roadmap's suppliers and sources.
**Witness:** README lines 246–260 have `### From TauCetiRoadmap.NoncommutativeGeometry` (N2–N4) and `### From TauCetiRoadmap.OperatorTheory` (OperatorIdeals Part B); README line 759 cites Roe's lecture notes. The description names none of the three.
**Repair:** Add to Boundaries: "Cyclic pairings, Schatten-class characters and Dixmier traces come from NoncommutativeGeometry N2–N4, and the trace-class, Hilbert–Schmidt and Schatten families from OperatorTheory/OperatorIdeals Part B"; add "Roe's lecture notes (author's page), consumed through OperatorKTheory K3.5" to the list of sources.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Tr1.1 traces, `𝔫_τ`, `𝔪_τ`, linear extension (Dixmier Déf. 2, Lemme 3) | `ℂ²`, `τ(a,b) = 2a + ∞·b`; `M₂`, `x ↦ x₁₁`, `x = e₁₂` | `τ(0) = 0·τ(x) = 0`, `𝔪 = ℂ ⊕ 0`; `x*x = e₂₂ ↦ 0`, `xx* = e₁₁ ↦ 1` | holds; dixmier1963 lines 200–211, 275–286 | none |
| Tr1.1 unitary invariance | `z = x^{1/2}u*` | `z*z = uxu*`, `zz* = x`; `z ∈ B` since `B` is an ideal of `B^†` | holds | none |
| Tr1.2 Combes for traces | `K(ℓ²)`, `Tr`; non-dense domain | `sup_ρ Tr(ρx) = Tr(x)` over finite-rank projections; thomsen-kms line 207 and kustermans-vaes line 188 assume lower semicontinuity only, no density | holds | none |
| Tr1.2 density equivalences | `τ = ∞` off `0`; `B = 0` | `finitePart = {0}`, `𝔫 = {0}`, `𝔪 = 0`: all three dense iff `B = 0`; route: `τ(x^{1/2}ex^{1/2}) ≤ ‖x‖τ(e) ≤ ‖x‖δ⁻¹τ(b_F)` | holds | none |
| Tr1.2 density ⇒ semifinite (lsc); converse fails | `C[0,1]`, `∫ f t⁻¹dt`; `c₀` finite-support trace, `f = (1/n²)` | `𝔪⁺ ⊆ {f(0) = 0}`, not dense; `τ(f) = ∞`, minorants `≤ π²/6` | holds; dixmier1963 lines 320–350 | none |
| Tr1.2 regularization (WTK Prop. 4.12) | `c₀` trace; Dixmier trace | `sup_ε τ((f − ε)₊) = Σ f(n)`; `(a − ε)₊` finite rank so `τ̃ = 0`; source (b) is for lsc weights, stronger | holds; thomsen-wtk lines 493–499 | none |
| Tr1.3 `τ_n` is a trace, `𝔫_{τ_n} = M_n(𝔫_τ)` | `n = 0, 1, 2`; `x = [[a,b],[0,0]]` | `Σ_i τ((x*x)_ii) = Σ_{i,k} τ(x_ki*x_ki) = Σ τ(x_ki x_ki*)`; `n = 0`: `0`; diag `a*a`, `b*b`; `xx* = diag(aa* + bb*, 0)` | holds; thomsen-wtk lines 138–142 | none |
| Tr1.3 projections have finite trace | `‖e − x‖ < 1/2` | `exe ≥ e − e/2`, `τ_n(e) ≤ 2τ_n(exe)` | holds; thomsen-wtk lines 474–480 | none |
| Tr2.1 GNS data, Hilbert algebra | `(M₂, Tr)`; `c₀` trace | `⟪Λe₁₂, Λe₁₂⟫ = Tr(e₂₂) = 1`, `Jπ(a)JΛ(x) = Λ(xa*)`; `‖Λ(xe − x)‖² ≤ τ(xx*) − τ(xex*)`; `(1/n) ∉ 𝔫`, `Λ` not closed | holds; dixmier1963 lines 393–402, 451–470 | none |
| Tr2.1 `π_τ(𝔫_τ)'' = π_τ(B)''` without density | `C[0,1]`, `t⁻¹dt` | `π(𝔫)` is an ideal of `π(B)` acting nondegenerately, strong closure contains `1`: both are `L^∞` | holds | none |
| Tr2.2 normal extension; `IsTrace.exists_normal_extension` | `τ = 0`; point trace; `c₀` trace | `H = 0`, `π = 0`, faithful iff `B = 0` iff `π` injective; `τ̄π(f) = 0 ≠ ∞`; `π²/6 ≠ ∞` | holds with both hypotheses; dixmier1963 lines 486–498, 545–547 | none |
| Tr2.2 uniqueness; `IsTrace.eq_of_normal_extension` | route with `e = e_{F,δ} ∈ 𝔪_τ⁺` | index type `Finset × ℝ` in `Type u`; `θ(T^{1/2}π(e)T^{1/2}) = θ(π(e)^{1/2}Tπ(e)^{1/2}) ≤ τ(e)‖T‖`; equality on `π(B)`: `τ(e^{1/2}be^{1/2})` | holds | none |
| Lean `IsNormalSemifiniteTrace` | body against VonNeumannAlgebras `Suggested.lean` line 400 | five clauses identical, same universe for the index type | agrees | none |
| Tr2.3 normal representations, bijection | `(π_τ, 2τ̄)` vs `(π_τ, τ̄)`; `τ = 0` | `Φ∘π = π` forces `Φ = id`, `2τ̄ ≠ τ̄` as `τ̄` has a finite nonzero value; zero trace ↔ `H = 0` | holds; dixmier1963 lines 510–519, 530–534, 556–559 | none |
| Tr3.1 Banach *-ideal, density | `C₀(ℝ)`, Lebesgue; bounded `τ` | `|||ab||| ≤ ‖a‖(‖b‖ + ‖b‖_{τ,p})`; `L¹(ℝ) ⊄ C₀(ℝ)`; `τ(|b|^p) ≤ ‖τ‖‖b‖^p`; hks lines 580–593 | holds | none |
| Tr3.2 Hölder; `IsTrace.traceGauge_mul_le` in `ℝ≥0∞` | `‖a‖_p = ∞`, `‖b‖_q = 0`; `a = (1+t²)^{−1/2}` | right side `∞·0 = 0`; `π_τ(b) = 0` so `‖ab‖_r = 0` (needs `τ = τ̄∘π_τ`); `‖a²‖₁ = π = ‖a‖₂²` | holds | none |
| Tr3.2 monotonicity; `IsTrace.apply_abs_pow_le` | `b = 0`, `q = p` and `q > p`; `diag(n^{−1/p})` | `0⁰·τ(0) = 0`, `0·0 = 0`; in `J_q` iff `Σ n^{−q/p} < ∞` iff `q > p`; `|||b|||_q ≤ 2‖b‖ + ‖b‖_{τ,p}` | holds | none |
| Tr3.2 `J₁ = 𝔪_τ`; R03 | `h = h*`; `e₁₂ ⊗ g` in `M₂(C[0,1])` | `τ(h₊) + τ(h₋) = τ(|h|)`; gauges of `b`, `b*` both `0` or `∞` | holds; adjoint clause over-restricted | R03 |
| Tr3.3 matrix bounds, multilinear forms | `x = [[1,1],[0,0]]`; `n = 0`; `m = 1`, `p = 3` | `‖x‖_{Tr,1} = √2`, entries `1,1,0,0`, sum `2`; empty sums; `diag(n^{−1/2})² = diag(1/n) ∉ S₁` | holds | none |
| Tr3.4 τ-compact operators | `x·1_{[ε,∞)}(|x|)` | `‖x − x1_{[ε,∞)}(|x|)‖ ≤ ε`, `τ(1_{[ε,∞)}(|x|)) ≤ ε^{−p}τ(|x|^p)`; knr lines 695–696 | holds | none |
| Tr4.1 `K_*(J_p) ≅ K_*(B)` | K3.5 condition; Cayley `u` | `|||xy||| ≤ ‖x‖·|||y|||`, so `C = 1`; `(1+j)⁻¹ = 1 − j(1+j)⁻¹`; `|u − 1| = 2(1+t²)^{−1/2} ∈ J_p` iff `p > 1` | holds; OperatorKTheory §3.5 on main | none |
| Tr4.2 `τ_*`; R04 | `Tr` on `K`; `Tr/n` on `M_n`; Dixmier trace; `C₀(ℝ)`; Bott class | `1`; `1/n`; `0` on finite-rank projections; `K₀ = 0`; `∫(Tr q − Tr p(∞)) = 0`; `[1] ↦ 1` here, `0` in the source | holds on `K₀(B)`; thomsen-wtk lines 274–278, 484 | R04 |
| Tr4.3 AF bijection | `K`; `c₀`; `M_{2^∞} ⊗ K` | `k ↦ ck ↔ c·Tr`; `(c_n) ≥ 0 ↔ Σ c_n f(n)`; `Hom⁺(ℤ[1/2], ℝ) = {x ↦ cx}` | holds; thomsen-kms lines 9468–9508 (Lemmas D.1.14–15; the bijection is its Theorem D.1.16) | none |
| `traceIdeal_two`; R02 | one-tactic probe | closes by `simp` with `CFC.abs_nnrpow_two` | padding | R02 |

- Source locators checked against the text: 25 (dixmier1963 10, thomsen-wtk 6, thomsen-kms 3, kustermans-vaes 3, hks 2, knr 1); all support the statements, one normalisation differs (R04). Dixmier's printed page is the scan's page number plus 217.
- Library declarations opened at the pins: 24 (Mathlib 15, Tau Ceti 9), every one named under "From Mathlib" and "From Tau Ceti" exists in the file given; no trace with infinite values, Hilbert algebra, tracial `Lᵖ` or `K₀` of a C*-algebra at either pin.
- Cross-roadmap citations resolved on main: 22 sections of 8 roadmaps. `OperatorKTheory K1.5`, listed as unresolved by the citation tool, is its "### 1.5 Order, scale and tracial pairings" under "## K1." (README line 466).
- Dependency check: `depcheck: 261 roadmaps, 2600 edges, 0 problem(s)`; no UPWARD or CYCLE line. All eight supplier roadmaps are on main.
- Gate at 4b14cb0: every check passed. Elaboration of `Suggested.lean`: 25 `sorry` warnings, nothing else.
- `#check @name` on a scratch copy against the README: the eight flagged definitions drop only instance binders their bodies do not use (`[StarOrderedRing B]`; for `matrixTrace` all three); every theorem carries the full context and each of its hypotheses. Nothing changed.
- Headlines: normal extension and its uniqueness, the trace-ideal inequalities, completeness and density are stated; Tr2.1, Tr2.3, the `Lᵖ` identification of Tr3.1 and all of Tr4 are named in the module docstring with the missing carrier. One-tactic probe: only `traceIdeal_two` closes.
- Ownership: the 455 open heads and main were searched for lower semicontinuous, densely defined and semifinite traces, trace ideals, τ-compact operators and Combes's theorem; no other owner. CategoricalOperatorAlgebras (README line 1466) uses one such trace on one algebra and plans no general theory.

Overlap check: read SchattenClassesAndSchurMultipliers, AmenableTracesOnCStarAlgebras, NoncommutativeGeometry, VonNeumannAlgebras; nothing shared (tracial states: AmenableTracesOnCStarAlgebras §1.1; normal semifinite traces and tracial `Lᵖ`: VonNeumannAlgebras V6, V10.TracialLp; Dixmier traces: NoncommutativeGeometry N4; each cited, none restated).

Source independence: 25 passages compared with 6 sources, none shared; largest share dixmier1963, 12 of 26 locators; contents compared with dixmier1963 (§§1–9): independent (Tr1 takes part of §2 and adds Combes, regularization and matrices from other sources; Tr2 merges §§3–5; Tr3 and Tr4 have no counterpart; §§6–9 are not used).

Research link: Tr3–Tr4 are the trace ideal `N ∩ L¹(N,τ)` and its K-theory used by Hochs–Kaad–Schemaitat (2018) for the semifinite Fuglede–Kadison determinant, the pairing `τ_* : K₀(K_N) → ℝ` of Kaad–Nest–Rennie (2007) for spectral flow, and Thomsen's (2022) pairing of densely defined traces with `K₀`; rests on hks §6, knr §6 and thomsen-wtk §4, which were read.

## Not verifiable

- Roe, *Lectures on K-Theory and Operator Algebras*, Lectures 14–16: not opened; the README cites it only through OperatorKTheory K3.5, whose text on main was read instead.
- thomsen-kms Theorem D.1.16: the statement line is damaged in the OCR text (line 9507–9508); Lemmas D.1.14–D.1.15 above it are legible and were read.
- Anantharaman–Popa, Definition 8.3.1 (cited in `Suggested.lean` line 182 only): not opened; see R05.

## Source issues

- **Misprint** in thomsen-wtk at Lemma 3.2, proof, p. 4: the source says the matrices over the square-integrable ideal are dense in the matrix algebra of size n; it should be size k, the size fixed in the statement; affects nothing.

## For the human reviewers

- **Licence.** README line 759 links Roe's lecture notes on a `wpmucdn.com` host serving a `sites.psu.edu` page; the copy was not opened and the host's status as an author page was not settled.
