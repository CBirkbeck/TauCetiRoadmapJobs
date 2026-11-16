# Review of TracesOnCStarAlgebras (pull request #2464 at 133bb83)

**Verdict:** needs changes

Six findings: one P2 (a statable headline is absent from `Suggested.lean`) and five P3. No statement was refuted and the gate passes.

## R01 (P2) — the cyclicity of the trace pairing is a statable headline and is not stated

**Location:** `TauCetiRoadmap/TracesOnCStarAlgebras/Suggested.lean` line 40, "The examples of Tr1 and Tr3.4 and the multilinear trace forms of Tr3.3 are not stated here."; `README.md` lines 564–565 and 588–591.
**Claim:** Every headline that is statable at the pins is stated; the docstring names a missing carrier for each one that is not.
**Witness:** The Summary (README line 16) lists "the cyclic multilinear trace forms" among Tr3's results; the docstring names no missing carrier. The statement below elaborates on a scratch copy with `sorry` as its only warning.
**Repair:** Add, after `IsTrace.traceGauge_mul_le`, and name it at README Tr3.2 "Cyclicity"; drop "and the multilinear trace forms of Tr3.3" from the docstring or say that the bilinear case is stated:

```lean
/-- **Cyclicity** of the trace pairing: `τ (a b) = τ (b a)` for `a ∈ J_p`, `b ∈ J_q`,
`1 / p + 1 / q = 1` (README, Tr3.2). -/
theorem IsTrace.linearMap_mul_comm_of_mem_traceIdeal {τ : B → ℝ≥0∞} (hτ : IsTrace τ)
    (hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hsf : IsSemifinite τ) {p q : ℝ≥0}
    (hp : 1 < p) (hpq : (p : ℝ)⁻¹ + (q : ℝ)⁻¹ = 1) (f : domain τ →ₗ[ℂ] ℂ)
    (hf : ∀ x (hx : x ∈ finitePart τ), f ⟨x, Submodule.subset_span hx⟩ = ((τ x).toReal : ℂ))
    {a b : B} (ha : a ∈ traceIdeal τ p) (hb : b ∈ traceIdeal τ q) :
    ∃ (hab : a * b ∈ domain τ) (hba : b * a ∈ domain τ), f ⟨a * b, hab⟩ = f ⟨b * a, hba⟩ := by
  sorry
```

## R02 (P3) — three definitions have fewer than three Checks

**Location:** `README.md` lines 380–385 (Tr1.3, `matrixTrace`: two Checks), lines 516–519 (Tr2.3, normal representations and quasi-equivalence: one Check), lines 611–620 (Tr3.4, `K_N`: none).
**Claim:** Every definition has at least three discriminating Checks.
**Witness:** `grep -n "Checks" README.md` shows no block between line 596 and line 645; the blocks at 380 and 516 hold two bullets and one.
**Repair:** Add. Tr1.3: "On `B = ℂ`, `x = [[1,1],[1,1]] ≥ 0` has `τ₂(x) = 2`; summing all entries gives `4`, which is not invariant under the unitary carrying `x` to `diag(2,0)`." Tr2.3: "The identity representation of `K(ℓ²)` on `ℓ²` with `Tr` is a normal representation inducing `Tr`; it is quasi-equivalent, and not unitarily equivalent, to `(π_Tr, τ̄)` on the Hilbert–Schmidt operators." and "Evaluation at `x₀` on `C₀(X)` with `θ(λ) = ∞·λ` on `ℂ` is not a normal representation (`𝔪_θ = 0`), and `θ ∘ π` is the non-semifinite trace of Tr1.2." Tr3.4: "`N = B(H)`, `Tr`: `K_N = K(H)`." "`N = L^∞(ℝ)`, Lebesgue: `K_N = {f : |{|f| > ε}| < ∞ for all ε > 0}`, containing `(1 + t²)^{−1/2}` and not `1`." "`τ(1) < ∞`: `K_N = N`."

## R03 (P3) — layers Tr2, Tr3 and Tr4 do not end with `### Examples`

**Location:** `README.md` lines 521, 626 and 721: `### Dependencies` follows the last numbered subsection directly; Tr3's examples are the numbered target "### 3.4 Examples (Tr3.4)".
**Claim:** Every layer ends with `### Examples` and `### Dependencies`.
**Witness:** `grep -n "### Examples" README.md` returns line 387 only (Tr1).
**Repair:** Add `### Examples` before each `### Dependencies`. Tr2: `(K(ℓ²), Tr)` with `M_Tr = B(ℓ²)`, and `C₀(ℝ)` with `M_τ = L^∞(ℝ)`, both already computed in the Checks. Tr3: retitle 3.4 "The compact, commutative and τ-compact cases (Tr3.4)" and list its four cases. Tr4: `(K, Tr)` with `Tr_* = id_ℤ`, `(C₀(ℝ²), dx)` with `τ_*(β) = 0`, and `M_{2^∞} ⊗ K`.

## R04 (P3) — `hlsc` in `IsTrace.eq_of_normal_extension` follows from the other hypotheses

**Location:** `Suggested.lean` lines 220–221, "`(hlsc : LowerSemicontinuousOn τ {x : B | 0 ≤ x}) (hd : IsDenselyDefined τ)`".
**Claim:** The uniqueness statement needs lower semicontinuity of `τ` as a hypothesis.
**Witness:** README lines 498–500: `θ ∘ π` is lower semicontinuous for nondegenerate `π` and normal semifinite `θ`; with `h₁`, `hπ` and `h₁π` this is `hlsc`. The signature without `hlsc` elaborates on a scratch copy.
**Repair:** Delete `hlsc` from the signature and change the docstring to "for a densely defined trace"; in README Tr2.2 write "more generally, for a densely defined trace `τ`, two normal semifinite traces …" (the first clause, about `τ̄`, keeps lower semicontinuity).

## R05 (P3) — the Kustermans–Vaes entry drops the source's standing hypothesis

**Location:** `README.md` lines 763–765, "Definition 2.10 and Proposition 2.22, the normal extension of a weight, faithful for KMS weights, of which traces are the case of the trivial flow (Tr2.2)".
**Claim:** The source constructs the normal extension of a lower semicontinuous weight, as Tr2.2 does for semifinite traces.
**Witness:** kustermans-vaes line 503 fixes a proper weight (nonzero, densely defined, lower semicontinuous: lines 118, 203) for Definition 2.10 (line 509); line 747 adds KMS for Proposition 2.22. The `C[0,1]` trace of Tr2.2's third Check is outside both.
**Repair:** "Definition 2.10 and Proposition 2.22, the normal extension of a proper (nonzero, densely defined, lower semicontinuous) weight, faithful and normal semifinite for KMS weights; densely defined lower semicontinuous traces are the case of the trivial flow, and the semifinite case without density is Dixmier's (Tr2.2)".

## R06 (P3) — the description miscounts the targets and omits two suppliers and one source

**Location:** pull-request description, "the only warnings are the 25 `sorry`s, one per stated target"; "Boundaries"; "Every source is freely available: …".
**Claim:** The description agrees with the head.
**Witness:** Elaboration at 133bb83 gives 24 `sorry` warnings (`traceIdeal_two` is gone). README lines 245–259 contract NoncommutativeGeometry N2–N4 and OperatorTheory/OperatorIdeals Part B; line 774 cites Roe. The description names none (previous review, R06).
**Repair:** Write "the 24 `sorry`s"; add to Boundaries "Cyclic pairings, Schatten-class characters and Dixmier traces come from NoncommutativeGeometry N2–N4, and the trace-class, Hilbert–Schmidt and Schatten families from OperatorTheory/OperatorIdeals Part B"; add "Roe's lecture notes (author's page), consumed through OperatorKTheory K3.5" to the sources.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Tr1.1 trace, `𝔫_τ`, `𝔪_τ`, linear extension; `sqIntegrable_ideal`, `existsUnique_linearMap`, `linearMap_mul_comm` | `ℂ²`, `τ = 2a + ∞·b`; `M₂`, `x ↦ x₁₁`, `x = e₁₂`; `c = 0` | `τ(0) = 0·τ(x) = 0`, `𝔪 = ℂ ⊕ 0`; `e₂₂ ↦ 0`, `e₁₁ ↦ 1`; dixmier1963 lines 200–211, 275–286 | holds | none |
| Tr1.1 adjoint invariance; `traceGauge_star` | `f = t^{p/2}`; `y_n = x·g_n(x*x)` | `y_n*y_n = h_n(x*x)²`, `y_ny_n* = h_n(xx*)²`, `‖y_n − y_m‖² = ‖(h_n − h_m)²(x*x)‖`; no regularity of `τ` used | holds for every trace | none |
| Tr1.1 bounded traces; `exists_positiveFunctional` | `τ = 0`; `Tr` on `M₂`; tracial state | `ω = 0`; `𝔪 = B` so Lemme 3 (v) gives `ω(ab) = ω(ba)`; `sup{τ(x) : ‖x‖ ≤ 1} = ‖ω‖` | holds | none |
| Tr1.2 Combes; `lowerSemicontinuousOn_iff` | `K(ℓ²)`, `Tr`; `x ∉ I_τ` with `τ(x) = ∞` | `sup_ρ Tr(ρx) = Tr(x)`; `nφ∘q ≤ τ`, `nφ(q(x)) → ∞`; thomsen-kms lines 156–162, 207 (semi-weights, no density), kustermans-vaes line 188 | holds | none |
| Tr1.2 density; `isDenselyDefined_iff`, `isSemifinite_of_isDenselyDefined` | `B = 0`; `C[0,1]`, `t⁻¹dt`; `c₀` finite-support trace | all three sets `{0}` and dense; `𝔪⁺ ⊆ {f(0) = 0}`; `τ(1/n²) = ∞`, minorants `≤ π²/6`; `τ(x^{1/2}ex^{1/2}) ≤ ‖x‖δ⁻¹τ(b_F)`; dixmier1963 lines 324–350 | holds | none |
| Tr1.2 regularization; `exists_lowerSemicontinuous_regularization` | `c₀` trace; Dixmier trace; projection `e` | `τ̃ = Σ f(n)`; `τ̃ = 0`; `sup_ε τ((e − ε)₊) = τ(e)`; thomsen-wtk lines 493–499 (maximal among lsc weights) | holds | none |
| Tr1.3 `matrixTrace`; `isTrace_matrixTrace`, `mem_sqIntegrable_matrixTrace_iff`, `matrixTrace_lt_top_of_isStarProjection` | `n = 0, 1, 2`; `x = [[a,b],[0,0]]`; `‖e − x‖ < 1/2` | `n = 0`: `0` on the zero algebra; `Σ_{i,k} τ(x_ki*x_ki) = Σ τ(x_ki x_ki*)`; `e/2 ≤ exe`; thomsen-wtk lines 138–142, 474–480 | holds | R02 (third Check) |
| Tr2.1 GNS data, Hilbert algebra | `(M₂, Tr)`; `c₀` trace | `⟪Λe₁₂, Λe₁₂⟫ = Tr(e₂₂) = 1`; `‖Λ(xe − x)‖² ≤ τ(xx*) − τ(xex*)`; `‖Λ(xb)‖² = τ(xbb*x*) ≤ ‖b‖²τ(x*x)`; `(1/n) ∉ 𝔫`; dixmier1963 lines 393–400, 451–470; kustermans-vaes line 195 | holds | none |
| Tr2.2 normal extension; `exists_normal_extension` | `τ = 0`; point trace; `c₀` trace; `C[0,1]`, `t⁻¹dt` | `H = 0`, `π = 0` injective iff `B = 0`; faithful `τ̄` forces `π = ev_{x₀}`, `M = ℂ`, `τ̄(1) = ∞` not semifinite; `π²/6 ≠ ∞`; `∞ = ∞`; dixmier1963 lines 486–498, 545–547 | holds with both hypotheses | none |
| Tr2.2 uniqueness; `eq_of_normal_extension` | `e = e_{F,δ} ∈ 𝔪_τ⁺` | `θ(T^{1/2}π(e)T^{1/2}) = θ(π(e)^{1/2}Tπ(e)^{1/2}) ≤ τ(e)‖T‖`; on `π(B)`: `τ(e^{1/2}be^{1/2})` both sides; `hlsc` follows from `h₁`, `h₁π` | holds | R04 |
| Lean `IsNormalSemifiniteTrace` | body against VonNeumannAlgebras `Suggested.lean` lines 400–409 on main | five clauses identical, index type in the universe of `H` | agrees | none |
| Tr2.3 normal representations | `(π_τ, 2τ̄)`; `τ = 0`; `I²` for Lemme 4 | `Φ∘π = π` forces `Φ = id`, `2τ̄ ≠ τ̄` at a finite nonzero value; `H = 0`; `π(I²) ⊆ 𝔪_θ`, same closure as `I`; dixmier1963 lines 351–355, 376–391, 510–519, 530–559 | holds | R02 |
| Tr3.1 ideals and norms; `traceGauge_add_le`, `_mul_le_left`, `_mul_le_right`, `exists_tendsto_traceGauge`, `dense_traceIdeal_iff` | `C₀(ℝ)`, Lebesgue; bounded `τ`; `x ≥ 0`, `b → x^{1/p}` | `L¹(ℝ) ⊄ C₀(ℝ)`; `τ(|b|^p) ≤ ‖τ‖‖b‖^p`; `|b|^p → x` with `|b|^p ∈ 𝔪⁺`; `τ(x^p) ≤ ‖x‖^{p−1}τ(x)`; hks lines 580–587 | holds | none |
| Tr3.2 Hölder; `traceGauge_mul_le` | `‖a‖_p = ∞`, `‖b‖_q = 0`; `a = (1+t²)^{−1/2}`, `p = q = 2` | `π_τ(b) = 0` so left side `0 = ∞·0`; `‖a²‖₁ = π = ‖a‖₂²` | holds | none |
| Tr3.2 monotonicity, endpoint; `apply_abs_pow_le`, `traceIdeal_one` | `b = 0` with `q = p`, `q > p`; `p = 0`; `diag(n^{−1/p})` | `0 ≤ 0⁰·0`, `0 ≤ 0·0`; `p = 0` would give `τ(|b|^q) ≤ 0` (excluded by `1 ≤ p`); in `J_q` iff `q > p`; `τ(h₊) + τ(h₋) = τ(|h|)` | holds | none |
| Tr3.2 cyclicity | `p = q = 2`; `p = 1` | `τ(y*x) = τ(xy*)` on `𝔫_τ`; `q⁻¹ = 0` forces `p = 1`, excluded by `1 < p` in the repair | holds; not in `Suggested.lean` | R01 |
| Tr3.3 matrix bounds, multilinear forms; `traceGauge_apply_le_matrix`, `traceGauge_matrix_le_sum` | `x = [[1,1],[0,0]]`; `n = 0`; `m = 1`, `p = 3`; `m = 0` | `x*x` has eigenvalues `2, 0`, gauge `√2`, entries `1,1,0,0`, sum `2`; `0 ≤ 0`; `diag(1/n) ∉ S₁`; `p = 1`, `|τ(a)| ≤ ‖a‖₁`; hks lines 588–594 | holds | none |
| Tr3.4 examples, `K_N` | `x·1_{[ε,∞)}(|x|)` | `‖x − x1_{[ε,∞)}(|x|)‖ ≤ ε`, `τ(1_{[ε,∞)}(|x|)) ≤ ε^{−p}τ(|x|^p)`; knr lines 695–697 | holds | R02, R03 |
| Tr4.1 `K_*(J_p) ≅ K_*(B)` | K3.5's condition; Cayley `u`; `λ + j` | `|||xy||| ≤ ‖x‖·|||y|||`, `C = 1`; `|u − 1| = 2(1+t²)^{−1/2} ∈ J_p` iff `p > 1`; `(λ+j)⁻¹ = λ⁻¹ − λ⁻¹j(λ+j)⁻¹`; OperatorKTheory README lines 900–908 | holds | none |
| Tr4.2 `τ_*` | `(K, Tr)`; `Tr/n`; Dixmier trace; Bott class; `[1] ∈ K₀(B^†)` | `1`; `1/n`; `0`; `∫(Tr q − Tr p(∞)) = ∫(1 − 1) = 0`; `1` here against `0` in thomsen-wtk line 265, the rank homomorphism; lines 274–278, 439–441, 484 | holds | none |
| Tr4.3 AF bijection | `K`; `c₀`; `M_{2^∞} ⊗ K`; zero homomorphism | `c·Tr ↔ k ↦ ck`; `(c_n) ≥ 0 ↔ Σ c_n f(n)`; `Hom⁺(ℤ[1/2], ℝ) = ℝ₊`; `τ = 0` is densely defined; thomsen-kms lines 9468–9508 (bijection: Theorem D.1.16) | holds | none |

- Previous review: R01 repaired (all 35 declarations are backticked in the README), R02 repaired (`traceIdeal_two` deleted), R03 repaired (README line 293, "Adjoint invariance … for every continuous `f`"; `traceGauge_star` has no `hlsc`, `hsf`), R04 repaired (README lines 658–661), R05 repaired (`Suggested.lean` line 182), R06 not repaired (R06 above).
- Source locators checked against the text: 26 (dixmier1963 12, thomsen-wtk 6, thomsen-kms 2, kustermans-vaes 3, hks 2, knr 1); printed page of dixmier1963 = scan page + 217; one hypothesis differs (R05).
- Library declarations opened at the pins: 27 (Mathlib 18, Tau Ceti 9), each in the file the README names, among them `CFC.abs_nnrpow_two` (`Abs.lean:107`), `NonUnitalStarAlgHom.map_cfcₙ` (`Unique.lean:438`), `CStarMatrix.instStarOrderedRing` (`CStarMatrix.lean:806`), `VonNeumannAlgebra.adjoin` (`Adjoin.lean:38`), `TauCeti.dixmierTrace` (`DixmierTrace.lean:91`). Neither pin has a trace with infinite values, a Hilbert algebra, a tracial `Lᵖ` or `K₀` of a C*-algebra.
- Cross-roadmap citations resolved on main: 23 sections of 8 roadmaps; `OperatorKTheory K1.5`, which the citation tool lists, is its "### 1.5 Order, scale and tracial pairings" (README line 466), with `τ⁺(a+λ) = τ(a) + λ` as the README says.
- Dependency check: `depcheck: 261 roadmaps, 2600 edges, 0 problem(s)`; no UPWARD or CYCLE line. Gate at 133bb83: every check passed. Nothing outside the roadmap folder changes.
- Elaboration of `Suggested.lean`: 24 `sorry` warnings and nothing else. `#check @name` on a scratch copy: `sqIntegrable`, `matrixTrace` and the other definitions drop only instance binders their bodies do not use; every theorem carries `[StarOrderedRing B]` and its stated hypotheses. Nothing changed.
- One-tactic probe (`simp`, `rfl`, `simp` and `simp_all` with the definitions unfolded) on a scratch copy: none of the 24 theorems closes.
- Ownership: main and the 454 open heads were searched for lower semicontinuous, semifinite and densely defined traces, trace ideals, τ-compact operators, Combes's theorem, KMS weights and the declaration names; no other owner and no shared fully qualified name.

Overlap check: read SchattenClassesAndSchurMultipliers, AmenableTracesOnCStarAlgebras, NoncommutativeGeometry, VonNeumannAlgebras; nothing shared (Schatten classes and their gauges: OperatorTheory/OperatorIdeals Part B; tracial states and their GNS data: AmenableTracesOnCStarAlgebras §§1.1, 1.4; normal semifinite traces, their `L²` and `Lᵖ`: VonNeumannAlgebras V6, V10.TracialLp; Dixmier traces: NoncommutativeGeometry N4; each cited, none restated).

Source independence: 26 passages compared with 6 sources, none shared; largest share dixmier1963, 12 of 26 locators; contents compared with dixmier1963 (§§1–9): independent (Tr1.1–Tr1.2 use part of §2 and add Combes, regularization and matrices from other sources; Tr2 merges §§3–5; Tr3 and Tr4 have no counterpart; §§6–9 are not used).

Research link: Tr3–Tr4 are the trace ideal `N ∩ L¹(N,τ)` and its K-theory used by Hochs–Kaad–Schemaitat (2018) for the semifinite Fuglede–Kadison determinant, the homomorphism `τ_* : K₀(K_N) → ℝ` of Kaad–Nest–Rennie (2007) for spectral flow, and Thomsen's (2022) pairing of densely defined traces with `K₀`; rests on hks §6, knr §6 and thomsen-wtk §4, which were read.

## Not verifiable

- Roe, *Lectures on K-Theory and Operator Algebras*, Lectures 14–16: not opened; the README consumes it only through OperatorKTheory K3.5, whose text on main was read.
- thomsen-kms Theorem D.1.16: the statement line is damaged in the extracted text (lines 9507–9508); Lemmas D.1.14–D.1.15, which the README cites, are legible and were read.
- NoncommutativeIntegration §§1.4, 2.1 and VonNeumannAlgebras V10.TracialLp, V11: the sections exist on main and state what the README consumes; their own sources (Fack–Kosaki, Hiai, Takesaki) were not opened.

## Source issues

- **Misprint** in thomsen-wtk at Lemma 3.2, proof, p. 4: the source says the matrices over the square-integrable ideal are dense in the matrix algebra of size n; it should be size k, the size fixed in the statement; affects nothing.

## For the human reviewers

- **Licence.** `README.md` line 775 links Roe's lecture notes on a `wpmucdn.com` host serving a `sites.psu.edu` page; the copy was not opened and the host's status as an author page was not settled.
