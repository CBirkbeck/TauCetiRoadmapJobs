# Review of RandomMatrices (pull request #1971 at 80b4a22)

**Verdict:** needs changes

## R01 (P2) — Haar-conjugated asymptotic freeness is an end theorem and statable at the pins, but `Suggested.lean` neither states it nor lists it as unstatable

Location: `TauCetiRoadmap/RandomMatrices/README.md` lines 12–13: "asymptotic freeness of Wigner and Haar-conjugated families"; §6.5 lines 961–962: "Prove the Haar-conjugation version for independent Haar unitaries and deterministic bounded Hermitian matrices with limiting individual laws." `Suggested.lean` lines 18–36: the module docstring mentions it in neither list.

Claim: this statement needs only a Haar probability measure on `Matrix.unitaryGroup (Fin n) ℂ`. Mathlib provides `Measure.IsHaarMeasure` and the instance `IsTopologicalGroup (unitary R)` (`Mathlib/Topology/Algebra/Star/Unitary.lean` line 28). Tau Ceti provides `CompactSpace (Matrix.unitaryGroup n 𝕜)` (`TauCeti/Topology/Algebra/UnitaryGroup.lean` line 110), so the hypothesis can be satisfied. The limit is stated exactly as in `wigner_asymptotically_free`.

Witness: appended to a scratch copy of `Suggested.lean`, the declaration below elaborates under the defaults with only the `sorry` warning. Its source is AGZ line 18550 (Theorem 5.4.10, printed p. 390), with Corollary 5.4.11(i) at AGZ line 18567.

Repair: add the declaration under `/-! ## Layer 6: asymptotic freeness -/` and name it in §6.5:

```lean
/-- **Asymptotic freeness of Haar-conjugated matrices, almost surely** (AGZ Theorem 5.4.10,
Corollary 5.4.11(i)). -/
theorem haar_conj_asymptotically_free (P : Measure Ω) [IsProbabilityMeasure P]
    (A B : ∀ n : ℕ, Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
    (hA : ∀ n, (A n).IsHermitian) (hB : ∀ n, (B n).IsHermitian)
    (D : ℝ) (hAD : ∀ n, ‖A n‖ ≤ D) (hBD : ∀ n, ‖B n‖ ≤ D)
    (μ : ∀ n : ℕ, Measure (Matrix.unitaryGroup (Fin (n + 1)) ℂ))
    [∀ n, (μ n).IsHaarMeasure] [∀ n, IsProbabilityMeasure (μ n)]
    (U : ∀ n : ℕ, Ω → Matrix.unitaryGroup (Fin (n + 1)) ℂ) (hU : ∀ n, HasLaw (U n) (μ n) P)
    {C : Type*} [Ring C] [Algebra ℂ C] (ψ : C →ₗ[ℂ] ℂ) (s : Fin 2 → C) (hψ : ψ 1 = 1)
    (hfree : IsFreelyIndependentElements ψ s)
    (hlimA : ∀ k : ℕ, Tendsto (fun n : ℕ ↦ ((n + 1 : ℂ)⁻¹) * (A n ^ k).trace) atTop
      (𝓝 (ψ (s 0 ^ k))))
    (hlimB : ∀ k : ℕ, Tendsto (fun n : ℕ ↦ ((n + 1 : ℂ)⁻¹) * (B n ^ k).trace) atTop
      (𝓝 (ψ (s 1 ^ k)))) :
    ∀ᵐ ω ∂P, TendstoInMoments (A := fun n : ℕ ↦ Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)
      (fun n ↦ ((n + 1 : ℂ)⁻¹) • Matrix.traceLinearMap (Fin (n + 1)) ℂ ℂ)
      (fun n ↦ ![A n, (U n ω : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ) * B n *
        star (U n ω : Matrix (Fin (n + 1)) (Fin (n + 1)) ℂ)]) atTop ψ s := by
  sorry
```

## R02 (P2) — The docstring says `F₁` and the speed-`n²` empirical-measure principle cannot be stated, but both can be stated at the pins

Location: `Suggested.lean` lines 32–36: "the Tracy–Widom limit `F₁` of GOE: it is written through the Hastings–McLeod solution of Painlevé II, whose existence is a theorem of §8.5"; and the speed-`n²` principle: "its rate is the logarithmic energy `E_V` … which the pins do not have."

Claim:
- **`F₁`.** AGZ Theorem 3.1.7 expresses `F₁` through the solution `q` of (3.1.8). The theorem can take `q` as a hypothesis: `C²`, with `q'' = xq + 2q³` and `q/Ai → 1` at `+∞`. That statement uses only the file's own `airyAi`, `airyKernel` and `fredholmDet`. Uniqueness of that solution makes it exact, and existence (a §8.5 target) makes it non-vacuous. That existence is still a theorem does not stop the statement from being written.
- **Speed-`n²` principle.** For GOE and GUE it is AGZ Theorem 2.6.1 with `V = βx²/4`, the same Gaussian case that §9.5 uses for `λ_max`. It needs one definition of three lines, a double lintegral with the value `⊤` on the diagonal. The carrier is Mathlib's `MeasurableSpace (ProbabilityMeasure ℝ)` (`ProbabilityMeasure.lean` line 268), and the map is Tau Ceti's measurable `Matrix.spectralMeasure`. That the pins lack a simple definition is not a reason to call the theorem unstatable: the file exists to supply such definitions.

Witness: both declarations below elaborate in the scratch copy, with only `sorry`. Their sources are AGZ lines 4731–4735 ((3.1.13), printed p. 95) and AGZ lines 3600–3616 (p. 73). The rate at `semicircleReal 0 1` is `(β/2)(7/4 − 7/4) = 0`, and at `δ₀` it is `⊤`, matching AGZ's `Σ(δ₀) = −∞`.

Repair: add both declarations, delete the two docstring bullets, and in §9.3 say that `Suggested.lean` states the cases `β = 1, 2`, as §9.5 already does for `λ_max`:

```lean
/-- **Tracy–Widom limit `F₁` of the GOE largest eigenvalue** (AGZ Theorem 3.1.7, (3.1.13)). -/
theorem goe_largest_eigenvalue_tracyWidom
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P)
    (q : ℝ → ℝ) (hq : ContDiff ℝ 2 q) (hPII : ∀ x, deriv (deriv q) x = x * q x + 2 * q x ^ 3)
    (hAi : Tendsto (fun x ↦ q x / airyAi x) atTop (𝓝 1)) (s : ℝ) :
    Tendsto (fun n : ℕ ↦ P.real {ω | ((n + 1 : ℕ) : ℝ) ^ ((2 : ℝ) / 3) *
        ((⨆ i, (gaussianEnsemble_isHermitian 1 (n + 1) (G n ω)).eigenvalues i) - 2) ≤ s})
      atTop (𝓝 (Real.sqrt (fredholmDet airyKernel (Set.Ioi s)) *
        Real.exp (-(1 / 2) * ∫ x in Set.Ioi s, q x))) := by
  sorry

/-- `E_V(μ) + 1` for `V(x) = x²/2`, with `+∞` on the diagonal; the integrand is at least
`3/2 - log 2 > 0`. -/
def gaussianLogEnergy (μ : ProbabilityMeasure ℝ) : ℝ≥0∞ :=
  ∫⁻ x, ∫⁻ y, (if x = y then ⊤ else
    ENNReal.ofReal ((x ^ 2 + y ^ 2) / 4 - Real.log |x - y| + 1)) ∂(μ : Measure ℝ) ∂(μ : Measure ℝ)

/-- **Large deviations of the GOE/GUE empirical spectral measure** (AGZ Theorem 2.6.1 with
`V = βx²/4`): speed `n²`, rate `(β/2)(E_V(μ) - 3/4)`. -/
theorem gaussianEnsemble_spectralMeasure_ldp (β : ℕ) (hβ : β = 1 ∨ β = 2)
    (P : Measure Ω) [IsProbabilityMeasure P] (G : ∀ n : ℕ, Ω → Fin (n + 1) × Fin (n + 1) → ℝ)
    (hG : ∀ n, HasLaw (G n) (Measure.pi fun _ ↦ gaussianReal 0 1) P) :
    LargeDeviationPrinciple
      (fun n ↦ P.map fun ω ↦ Matrix.spectralMeasure (gaussianEnsemble β (n + 1) (G n ω))
        (gaussianEnsemble_isHermitian β (n + 1) (G n ω)))
      (fun n ↦ ((n + 1 : ℕ) : ℝ) ^ 2)
      (fun μ ↦ ENNReal.ofReal ((β : ℝ) / 2) * (gaussianLogEnergy μ - ENNReal.ofReal (7 / 4))) := by
  sorry
```

## R03 (P2) — `wigner_asymptotically_free` assumes one common entry law, but the README credits it with the generality of AGZ Theorem 5.4.2

Location: `README.md` lines 951–958: "whose entries are centred with `E|X(m,ℓ)|² = 1` and have moments of every order bounded uniformly in the size, the index `i` and the position … The almost-sure statement … is `wigner_asymptotically_free`". `Suggested.lean` line 249: `(hξ : ∀ l ij, HasLaw (ξ l ij) ν P) (hη : ∀ l i, HasLaw (η l i) ν₀ P)`.

Claim: AGZ Theorem 5.4.2 assumes independent, centred entries with unit second moment (diagonal included) and the uniform moment bound (5.4.1). It does not assume identical distribution. The Lean statement requires every off-diagonal entry of all `k` matrices to have the single law `ν`, and every diagonal entry the law `ν₀`, so it states only the i.i.d. special case.

Witness: take `k = 2`, with Rademacher entries in matrix 0 and standard complex Gaussian entries (and Rademacher diagonals) in matrix 1. AGZ 5.4.2 applies (AGZ lines 17996–18007, printed p. 378), but `hξ` fails. The general form below elaborates.

Repair: replace `ν`, `ν₀`, `hξ`, `hη`, `hmom`, `hmom₀`, `hmean`, `hvar`, `hmean₀` and `hvar₀` by per-entry hypotheses, and reword the docstring to match:

```lean
    (hint : ∀ (p : ℕ) l ij i, Integrable (fun ω ↦ ‖ξ l ij ω‖ ^ p) P ∧
      Integrable (fun ω ↦ |η l i ω| ^ p) P)
    (hbound : ∀ p : ℕ, ∃ C : ℝ, ∀ l ij i,
      ∫ ω, ‖ξ l ij ω‖ ^ p ∂P ≤ C ∧ ∫ ω, |η l i ω| ^ p ∂P ≤ C)
    (hmean : ∀ l ij i, ∫ ω, ξ l ij ω ∂P = 0 ∧ ∫ ω, η l i ω ∂P = 0)
    (hvar : ∀ l ij i, ∫ ω, ‖ξ l ij ω‖ ^ 2 ∂P = 1 ∧ ∫ ω, η l i ω ^ 2 ∂P = 1)
```

## R04 (P2) — CompactGroups' `weyl_integration_formula` covers only SU(2); the U(n) formula that §5.4 specializes has no supplier

Location: `README.md` lines 64–67: "Layer 0 and `weyl_integration_formula`, owns normalized Haar averaging and general compact-group Weyl integration"; the same citation appears at lines 230, 782, 820 and 836–837.

Claim: CompactGroups states `weyl_integration_formula` for class functions on `SU(2)` only, and it leaves the general compact-Lie-group formula to a later roadmap. The CUE eigenangle density of §5.4 is Weyl's formula for `U(n)` (AGZ Proposition 4.1.6). No cited supplier provides it, and this roadmap has no target for it.

Witness: `RepresentationTheory/CompactGroups/Suggested.lean` line 475 reads `theorem weyl_integration_formula (f : C(SU2, ℂ)) …`, and its `README.md` lines 426–429 say "here they are proved by hand for `SU(2)`".

Repair:
- **Scope.** Change the Scope bullet to "CompactGroups, Layer 0, owns normalized Haar measure and averaging; its `weyl_integration_formula` is the `SU(2)` case."
- **§5.4.** Add the target: "Prove Weyl's integration formula on `U(n)`: for nonnegative measurable central `φ`, `∫ φ dHaar = (n!)⁻¹ ∫_{[0,2π]^n} φ(e^{i diag θ}) ∏_{i<j}|e^{iθᵢ}-e^{iθⱼ}|² ∏ dθᵢ/(2π)` (AGZ Proposition 4.1.6, (4.1.6), printed p. 194), from the spectral change of variables of §5.2 for normal matrices."
- **Citations.** Remove `weyl_integration_formula` from lines 230, 782 and 836–837.

At `n = 2` the formula gives `(1/2) · 2(2π)²/(2π)² = 1`, which matches the existing CUE Check.

## R05 (P3) — §7.2 has no locator, and its almost-sure law assumes more than its source needs

Location: `README.md` lines 999–1001: "For deterministic `T_p ≥ 0` with `sup‖T_p‖ < ∞` and `L_{T_p} → ν`, and real or complex i.i.d. `X` with mean zero, variance 1 and finite fourth moment, prove the almost-sure limiting law".

Claim: the section cites nothing at the claim. Bai 1999 Theorem 3.4 (Silverstein–Bai 1995) proves the almost-sure limit, with equation (3.9), assuming only `E|x − Ex|² = 1`, for diagonal `T`. Remark 3.2 records Silverstein (1995) for general positive definite `T` with `L_T → H` almost surely, with neither moment convergence nor a norm bound.

Witness: Bai1999 lines 1659–1677 and 1687–1693 (printed p. 643). Counterexample: `T = I` with standardized Student-`t₃` entries, which have `E|x|⁴ = ∞`. Bai Theorem 2.5 still gives `MP_y`, but §7.2 excludes this case.

Repair: state the law for i.i.d. entries of mean zero and variance 1, with `L_{T_p} → ν` almost surely (Bai 1999, Theorem 3.4 and (3.9) for diagonal `T_p`; Remark 3.2 for general `T_p ≥ 0`). Keep `sup‖T_p‖ < ∞` and the fourth moment only for the deterministic equivalent, if its proof uses them.

## R06 (P3) — §9.4 states a quasi-everywhere characterization that AGZ Lemma 2.6.2(e) does not give

Location: `README.md` lines 1327–1330: "is at least the equilibrium constant outside a set of logarithmic capacity zero and equals it on the support except on such a set (AGZ Lemma 2.6.2(e), (2.6.9)–(2.6.10) …)".

Claim: AGZ (2.6.9) gives equality for `σ`-almost every `x`, and (2.6.10) gives strict inequality at every `x` off the support. The README's equality "except on a capacity-zero set" is stronger than (2.6.9), and its "at least … outside a capacity-zero set" is weaker than (2.6.10). The README's form is Frostman's theorem, which needs its own source.

Witness: AGZ lines 3636–3641 (printed p. 73). For `V = x²/2` at `x = 3`, the effective potential is `1 + 3√5/2 − 2 log((3+√5)/2) = 2.429 > 1`, the strict inequality that (2.6.10) gives.

Repair: write "equals `C` for `σ`-almost every `x` and exceeds `C` at every `x` outside the support (AGZ Lemma 2.6.2(e), (2.6.9)–(2.6.10), printed p. 73)". If the quasi-everywhere form is wanted, state it as a separate claim with a source that proves it.

## R07 (P3) — Wrong or missing locators in §§1.2, 3.2 and 5.1

Location and claim:
- **§1.2, line 390:** "(AGZ Lemma 2.1.19, Lemma 2.3.3)" is the locator for the Lipschitz estimate. AGZ Lemma 2.3.3 is Herbst's lemma (AGZ line 2030). The Lipschitz bound for `tr f(X)` is AGZ Lemma 2.3.1 (AGZ lines 1986–1993, printed p. 39).
- **§3.2, line 584:** "(AGZ Theorem 2.4.4, Lemma 2.1.19 setting)". Lemma 2.1.19 is Hoffman–Wielandt (AGZ line 1123, p. 21) and says nothing about moments, so the moment half of §3.2 has no locator.
- **§5.1, lines 753–763:** no claim-level locator for the GOE/GUE densities or their conjugation invariance.

Witness: the AGZ lines above. The moment convergence theorem with Carleman's condition is at Bai1999 lines 110–116 (printed p. 613). The densities and invariance are at AGZ lines 2564–2576 ((2.5.1), printed p. 52).

Repair:
- **§1.2:** write "(AGZ Lemma 2.1.19, p. 21; Lemma 2.3.1, p. 39)".
- **§3.2:** write "(AGZ Theorem 2.4.4; Bai 1999, §2, moment convergence theorem with Carleman's condition, p. 613)".
- **§5.1:** add "(AGZ (2.5.1) and the paragraph after it, p. 52)".

## R08 (P3) — The supplier contracts cite the Hadamard bound by a placeholder name and omit one consumed Wigner declaration

Location: `README.md` lines 80–81, 242, 1156, 1174 and 1276 cite SuccessiveMinima's `hermitian_gram_hadamard`. §4.1, line 670, uses `identDistrib_wignerMatrix`, but the From Tau Ceti list (lines 202–204) omits it.

Claim: `hermitian_gram_hadamard` is a name from SuccessiveMinima's `Suggested.lean` (line 192), and the pin has no declaration of that name. SuccessiveMinima is complete, and its theorem is Tau Ceti's `Matrix.det_gram_le_prod_norm_sq`. The description says the pull request "moves to consumption everything the pinned Tau Ceti already carries", so both declarations belong in the contract by name and file.

Witness:
- `TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean`, line 115: `det_gram_le_prod_norm_sq`; line 139: `re_det_gram_le_prod_norm_sq`.
- `TauCeti/Probability/RandomMatrix/Wigner.lean`, line 254: `identDistrib_wignerMatrix`.

Repair: add both declarations, with their files, to From Tau Ceti. In §8.3 (line 1156) take the bound from `Matrix.det_gram_le_prod_norm_sq`, and cite SuccessiveMinima 0.1.2 only as the roadmap that planned it.

## R09 (P3) — A Check uses a set outside the count-law definition, and the build overview omits one of Layer 6's inputs

Location and claim:
- **§8.3 Check, lines 1185–1186:** "for the GUE kernel of size `n` and `B = ℝ`, `det(I-(1-z)K) = zⁿ`, the law `δₙ`". Joint count laws are defined only for relatively compact `B` (lines 1139–1140), and `ℝ` is not relatively compact.
- **"How to read the build", lines 252 and 264:** these give Layer 6 the inputs "1, 3, 5 + combinatorics". §6.5's *Needs:* (line 965) and Layer 6's Dependencies (line 975) also include §§4.1–4.2.

Witness: the README lines quoted above.

Repair:
- **Check:** use `B = [−R, R]`. Then `det(I-(1-z)K_B) = ∏ₖ (1 − λₖ(R) + λₖ(R) z)`, and this tends to `zⁿ` as `R → ∞` because each of the `n` eigenvalues of `K_{[−R,R]}` tends to `1`.
- **Build overview:** write "1, 3, 4, 5 + combinatorics → 6" in both places.

## Previous findings (review of c0521f7)

- **R01 (LaguerreJacobi supplier): repaired.** Lines 1100–1103 now read "obtain the orthonormal polynomials of `L²(w)` by Gram–Schmidt of the monomials (Mathlib `InnerProductSpace.gramSchmidt` …)". The `c₀ = Γ(a+1)` Check is at lines 1113–1114. LaguerreJacobi occurs nowhere in the folder, and the `depends-on` block lists only #1928.
- **R02 (§8.3 process undefined): repaired.** Lines 1139–1142 define "a joint count law of `K` … a probability measure `P` on `ℕ^m` whose generating function is the Fredholm determinant". Uniqueness, factorial moments and the void probability follow at lines 1142–1146, and existence in three cases at lines 1151–1163. One remaining slip is the R09 Check.
- **R03 (local copies of pinned carriers): repaired.** From Tau Ceti (lines 153–224) lists the carriers. `Suggested.lean` imports the four modules and declares no local copies. Two names are still missing from the contract (R08).
- **R04 (asymptotic freeness unstatable): repaired.** It is stated at `Suggested.lean` lines 246–261, and the docstring bullet is cut back to free convolution. Its generality is R03 of this review.
- **R05 (imaginary mean): repaired.** Lines 704–708 follow Bai1999 lines 197–205.
- **R06 (locators): repaired.**
  - §0.3 now cites "(T §2.3.2, (2.59)–(2.60), …)" (lines 315–317).
  - §2.4 cites V Theorems 4.4.5 and 4.6.1.
  - §2.5 cites AGZ Lemma 2.4.5 and T §2.2.4.
  - §2.6 cites Tropp Theorems 3.2, 1.4 and 1.1.
  - §3.1 cites AGZ 2.4.3 for endpoints that are not atoms.
  - §6.2 cites AGZ Definition 5.3.1 and Theorem 5.3.15.
  - §8.2 cites AGZ Lemmas 3.2.3 and 3.2.2.
  - §9.4 cites AGZ Lemma 2.6.2(e), although its content now differs from the lemma (R06 of this review).
- **R07 (bulk-gap docstring): repaired.** `Suggested.lean` lines 341–342 now give both cases.
- **R08 (*Needs:* and Mercer): repaired.** §2.3 has two *Needs:* lines (lines 487–488 and 495–496), and Mercer's theorem is a target at lines 1125–1128.
- **R09 (DysonBrownianMotion): repaired.** `roadmaps list` shows "#2118 DysonBrownianMotion (new)", so the sentence at lines 39–42 is now true.
- **R10 (`sineKernel` Checks): repaired.** Lines 1225–1230 carry three Checks.

## Verified sound

**Scope of the review.** This was a full review of `README.md` (1479 lines) and `Suggested.lean` (417 lines) at 80b4a22. The three-dot diff against `origin/main` outside the folder is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's generated files.

**Gate.** Rerun at this head, every counter is 0, ending in "OK". The dependency check printed:

```text
depcheck: 234 roadmaps, 2270 edges, 0 problem(s)
```

Every supplier is on main: StandardDistributions, Completed/OrthogonalL2Bases, CompactGroups, OptimalTransport, PolarDecomposition, SpectralSubspacePerturbation, OperatorIdeals, SuccessiveMinima and SpecialFunctionsAiry.

**Build, signatures and padding.**
- **Build.** `lake env lean` exits 0 with 15 `sorry` warnings and nothing else.
- **Signatures.** `#check @name` ran on all 26 declarations in a single scratch file, and each type matches its README sentence. Examples: `hanson_wright` keeps `0 ≤ t` and `iIndepFun X P`; `least_singular_value` has column laws `ν ij.2`; `gue_bulk_gap` keeps `|E| < 2` and `IsCompact A`. No declaration lost a section binder. I made no change to the file.
- **One-tactic probe.** Each `sorry` was replaced by `first | (simp; done) | rfl | infer_instance | (norm_num; done) | positivity | trivial | (aesop; done)`. All 15 headlines fail (errors at lines 65, 79, 112, 131, 164, 184, 232, 261, 288, 306, 339, 352, 380, 399 and 415), so no headline is padding. The three proved `…_isHermitian` lemmas are needed to state the headlines.
- **Witnesses.** Four elaborate, three of which are needed by R01–R03.

**Library declarations opened at the pins** (Tau Ceti 2fd255d, Mathlib 1b1ccf4):
- **Wigner matrices:** `TauCeti.wignerMatrix` and `StrictUpper` (`Probability/RandomMatrix/Wigner.lean` lines 64 and 57; the body has `(√n)⁻¹`, `star` below the diagonal and `η` on it).
- **Named laws:** `marchenkoPastur` (`MarchenkoPastur/Basic.lean` line 62; atom `ofReal((y−1)/y)`, density `√((b−x)(x−a))/(2πyx)`), `semicircleReal` (`LocationScale.lean` line 39) and `semicircleMeasure` (`Semicircle/Basic.lean` line 35).
- **Free probability and Haar:** `TendstoInMoments` (`Distribution/Convergence.lean` line 50) and the unitary-group `CompactSpace` instance (`UnitaryGroup.lean` line 110).
- **Hadamard and Pfaffian:** the Gram–Hadamard theorems (R08). `LinearAlgebra/Matrix/Determinant/Skew.lean` line 28 says Tau Ceti has no Pfaffian, so §8.5's Pfaffians duplicate nothing.
- **From Tau Ceti list:** each of the 77 names in the list resolves at the pin (grep), and `IsSemicircular` is in `Semicircular/Basic.lean`.
- **From Mathlib list:** all 12 files and the names `eigenvalues₀_antitone`, `toEuclideanCLM`, `singularValues_antitone`, `posSemidef_vecMulVec_star_self`, `Matrix.measurable_iff`, `exists_hasLaw_indepFun`, `exists_iid`, `Complex.volume_ball`, `gramSchmidt`, `gramSchmidtNormed` and `resolventTransform` resolve.
- **Searches with no hit:** the pins have no large deviation principle, sample covariance, Gaussian ensemble, circular law, sine kernel, Fredholm series, Mercer theorem, Pfaffian, Airy function or free convolution of measures (grep).

**Cross-roadmap citations resolved on main (651d082):**
- **SpecialFunctionsAiry:** 1.1 (line 347), 1.2 (line 370), Layer 2 (line 481), 3.2 (line 585), 3.4 (line 620), 3.6 (line 708, the tail bound) and 8.5 (line 1382, the bound on `[s,∞)²`). Its names are at lines 142–144. Its Suggested.lean declares `airyAi` and `airyKernel` with the same bodies as the local copies, in another namespace, so no fully qualified name clashes.
- **OperatorTheory:** PD-A51/A52 (lines 254 and 257), SSP-D06/D13/D14 (lines 428, 444 and 447), and OI-B01, B19, B23, B29 and B30.
- **Other suppliers:** SuccessiveMinima 0.1.2; StandardDistributions Layers 0 and 3–6, 12.1 (line 2143, `cond volume (ball c r)`) and `wishartGramMeasure` (line 886); OptimalTransport Layers 0–3; OrthogonalL2Bases Parts A–B (lines 147 and 245); CompactGroups (R04).

**Ownership and overlaps.**
- **Overlap tool.** `scratch/overlaps.md` lists no dropped id and no other pull request that changes this roadmap.
- **Second-owner search.** `roadmaps grep` across main and the 448 open heads finds no second owner of large deviation principles, Hanson–Wright, matrix Bernstein, Mercer, Tracy–Widom, Hastings–McLeod or Girko hermitization.
- **Consumers at open heads.** PainleveEquations (#1955, lines 175 and 736) consumes the Fredholm-determinant theory of §8.3. DysonBrownianMotion (#2118, line 90) cites §§1.1–1.2, 3.1–3.3, 5.1–5.3, 6.3 and 7.1, all present at this head.
- **FreeProbability on main.** Its F5 also specifies `⊞` and the R-transform. Its table (line 116) assigns the bounded scalar implementation to this roadmap's Layer 6, consistent with lines 82–86 here, so the supply runs in one direction.

**Description.** These claims hold at this head:
- "compiles at the pins with `sorry` as the only warning (15 headlines)";
- "`least_singular_value` allows independent entries with i.i.d. rows and column variances at least 1 (Rudelson–Vershynin Theorem 1.2)", which matches RV2008 lines 117–124;
- "#2118 … depends on this one";
- "LaguerreJacobi is no longer a supplier".

The phrase "moves to consumption everything the pinned Tau Ceti already carries" misses the two names in R08.

**Seeded sample, checked against the text:**
- **0.1:** supported by T lines 182–263 (§1.1, extensions).
- **1.2:** T §1.3 (Theorem 1.3.2 at T line 1918, Weyl at line 2069) supports it. The AGZ locator is wrong (R07).
- **2.1:** BLM and V are not verifiable (see below).
- **4.3:** supported by Bai1999 lines 125–136 (Theorem 2.1, no diagonal moment), lines 334–342 (Theorem 2.4) and lines 197–205, and by T line 5960 (Theorem 2.4.2).
- **4.5:** supported by Bai1999 lines 992–1001 (Theorem 2.12 (i)–(iv)) and 1214–1226 (Theorems 2.15–2.16), and T line 5731 (Theorem 2.3.24).
- **5.1:** the locator is missing (R07). AGZ (2.5.1) matches Convention 5.
- **5.2:** supported by AGZ lines 2588–2614 (Theorem 2.5.2, (2.5.4), p. 53).
- **6.2:** supported by AGZ lines 16917 and 17218.
- **6.4:** supported by AGZ lines 17752–17760 (Lemma 5.3.32) and 17611–17616 (exercise; see Source issues).
- **7.2:** the locator is missing (R05).
- **8.5:** supported by AGZ lines 4684–4695 and 4731–4739 (Theorems 3.1.5 and 3.1.7, p. 95).
- **8.6:** AGZ line 13749 (Theorem 4.3.20, the Dyson-flow statement, implicit variance) and line 1540 (Theorem 2.1.31) were checked; Johansson 1998 is not verifiable.
- **9.4:** the content differs from its source (R06).
- **9.5:** AGZ lines 4121–4141 (Theorem 2.6.6, Assumption 2.6.5 with `α = −β/2`) support it, and the README has the corrected sign.
- **10.3:** supported by T line 9805 (Theorem 2.8.1), T line 10031 ((2.179)), T line 10034 (Theorem 2.8.3), and TVK2010 lines 339–342 (Theorem 1.13) and 603–616 (Theorem 2.1).

**Adversarial table.** All values were computed this round.

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 extensions | `(X,Z) = (U,U)`; `ν = (δ₀+δ₁)/2` | `P(X∘fst = Z∘fst) = 1`; `P(snd=0, snd=0) = 1/2 ≠ 1/4` | Checks right | none |
| 1.2 Hoffman–Wielandt, rank, Lipschitz | `diag(1,0)` vs `diag(0,1)`; `diag(1,0,0,0)`; `f = |x|`, `A = diag(1,-1)`, `B = 0` | sorted `0 ≤ 2`, unsorted `2`; `sup = 1/4 = rank/4`; `|1 − 0| = 1 ≤ ‖A‖_F/√2 = 1` | true; locator wrong | R07 |
| 2.1 Bernstein, McDiarmid, sub-exponential | Rademacher, `b = v = t = 1`; `f = X₁`, `c = 2`; `Exp(1)` at `λ = 1/2` | `1 ≤ 2e^{-3/8} = 1.375`; `1 ≤ 2e^{-1/2} = 1.213`; `e^{-1/2}/(1/2) = 1.213 ≤ e^{K²/4}` iff `K² ≥ 0.772` | true | none |
| `hanson_wright` | `A = E₁₂+E₂₁`, Rademacher, `K = 1`; `K = 0` | `1 ≤ 2e^{-c/2}` ⇒ `c ≤ 1.386`; Lean `t²/0 = 0`, bound `2 ≥ 0` | true | none |
| `matrix_bernstein` | `d = 0`; `Xₖ = εₖEₖₖ`, `t = 1` | `0 ≤ 0`; `1 ≤ 2m e^{-3/8}` | true | none |
| `wigner_semicircle_ae`, 4.3 | Bai Theorem 2.1; mean `ic` at `n = 2, 3` | diagonal law free, centred variance `σ²`; `cot(π/4) = 1`: eigenvalues `±c/√2`; `n = 3`: `0, ±c` | true | none |
| `wigner_extreme_eigenvalues_ae` | Bai 2.12 for `W` and `−W` | needs `E w₁₂ ≤ 0` and `≥ 0`, so `= 0`; `E(w₁₁^±)² < ∞` ⇐ `hdiag` | exact | none |
| `marchenkoPastur_ae`, extremes | `y = 2`; `y = 1/4`; Bai §2.1.2 | atom `1/2`; edges `9/4` and `1/4`; mean zero is assumed by Bai | true | none |
| `gaussianEnsemble`, 5.1 | `E trₙH²`; `n = 2`, `β = 2` | GUE `(1 + (n−1))/n = 1`; GOE `(n+1)/n`; `Im H₀₁ = g(1,0)/2` | true | R07 (locator) |
| `gaussianEnsemble_eigenvalue_density` | `n = 2, β = 2`; `n = 2, β = 1`; AGZ (2.5.4) at `N = 2, β = 2`; `n = 0` | `Z = π = ∫∫(x−y)²e^{−x²−y²}`; `Z = 4√π = 2π · 2/√π`; `N!C̄ = 1/(2π)` ⇔ `∫∫(x−y)²e^{−(x²+y²)/2} = 4π`; both sides Dirac | true | none |
| 6.2 freeness, cumulants | free centred `a, b`; `κ₄` | `φ(abab) = 0`; semicircle `2 − 2 = 0`, Gaussian free `κ₄ = 1` | true | none |
| 6.4 free limits | variances `1, 3`; free Poisson `λ = 1/2` | limit `semicircleReal 0 2`; `λ`-dilation of `MP_2` has atom `1/2 = 1 − λ`, mean `λ` | true | none |
| `wigner_asymptotically_free` | AGZ 5.4.2; Rademacher plus complex Gaussian | AGZ applies; `hξ` false | narrower than README | R03 |
| Haar freeness, 6.5 | AGZ 5.4.10; witness | statable (elaborates); absent | headline missing | R01 |
| `gaussianEnsemble_spike_ae` | `θ = 1`; `θ = 2` | `1 + 1 = 2`; `5/2`, overlap `3/4` | true | none |
| 7.2 population covariance | `T = I`, `t₃` entries; `ν = δ₁` | Bai 2.5 gives `MP_y`, README excludes it; `z = −1/m̲ + y/(1+m̲)` | hypotheses too strong | R05 |
| 7.4 shrinkage Check | `ν = δ₁` | `w² − (1−y+z)w + z = 0` derived from `yzm² + (z+y−1)m + 1 = 0`; `|w|² = x` | true | none |
| `gue_largest_eigenvalue_tracyWidom` | `Ai(0)`; `K_Ai(0,0)`; AGZ (3.1.6) | `0.4808/1.3541 = 0.3550`; `0.2588² = 0.0670`; same series on `(t,∞)` | true | none |
| `gue_bulk_gap` | `E = 0` vs AGZ 3.1.1; `A = ∅` | AGZ `x = Nλ`, kernel `sin(x−y)/(π(x−y))`; `u = x/π` gives `sin(π(u−v))/(π(u−v))`; both `1` | true | none |
| `sineKernel` | `(x,x)`; `(1,0)`; `∫₀^L` | `1`; `sin π/π = 0`; `L` | true | none |
| 8.3 count laws | `λφ⊗φ`; GUE kernel, `B = ℝ` | `1 − λ∫_Bφ²`; `B` not relatively compact | Check outside definition | R09 |
| 8.5, `F₁` | AGZ (3.1.13); `t → ∞` | `F₁² = F₂e^{−∫q}`; ratio `→ 1`; witness elaborates | statable | R02 |
| 8.6 `gaussianEnsemble_linear_statistic_clt` | `f = x`; `f = x²`; `f = 0` | `2/β`, GUE `n · 1/n = 1`; `4/β`, GUE `2/n + 2(n−1)/n = 2`; empty sum, `gaussianReal 0 0` | true | none |
| `LargeDeviationPrinciple` | AGZ D.1; `δ₀`, `I = ∞·1_{≠0}`; `I ≡ 0` | closed `F ∌ 0`: `⊥ ≤ −⊤`; `I ≡ 0` on open `U ∌ 0`: `0 ≤ ⊥` false | determines | none |
| 9.2, 9.4 energy | `V = x²/2` at `semicircleReal 0 1`; `x = 3` | `E_V = 1/2 + 1/4 = 3/4`; effective potential `1` on `[−2,2]`, `2.429` at `3` | true; locator content differs | R06 |
| `gaussianEnsemble_largest_eigenvalue_ldp` | `x = 3`, `β = 2` | AGZ printed `2·1.0353 − 4.5 + 1 = −1.43`; README `∫₂³√(t²−4) = 1.4292` | README right | Source issues |
| speed-`n²` LDP | witness at `semicircleReal 0 1`, `δ₀` | rate `0`; `⊤` | statable | R02 |
| CUE, 5.4 | `n = 2`; CompactGroups formula | `(1/2) · 2(2π)²/(2π)² = 1`; supplier is `SU(2)` only | unowned as cited | R04 |
| Hadamard, 8.3 | `[[1,a],[a,1]]`, `|a| ≤ 1` | `1 − a² ≤ 1`; pinned `det_gram_le_prod_norm_sq` | true; contract name | R08 |
| `least_singular_value` | RV2008 Theorem 1.2; `N = 1` Gaussian; `K < 1` | per-column laws, variance `≥ 1`; `P(|ξ| ≤ ε) ≈ 0.798ε`; vacuous because proxy `≥` variance | true | none |
| `circular_law_ae`, `circularLaw` | mass; `∫|z|^{2k}` | `π/π = 1`; `π⁻¹∫₀¹r^{2k}·2πr dr = 1/(k+1)` | true | none |

**Counts.**

| Item | Count |
| --- | --- |
| Rows in the adversarial table | 31 |
| Signatures checked with `#check` | 26 |
| Headlines probed with one tactic | 15 |
| Witnesses elaborated | 4 |
| Pinned names resolved by grep | 89 (77 Tau Ceti, 12 Mathlib) |
| Pinned declarations opened and read | 11 |
| Supplier roadmaps resolved | 10 |
| Source passages read | about 55, in AGZ, Bai1999, T, TVK2010, RV2008 and Tropp2012, each cited by line above |

## Not verifiable

- **BLM** (Oxford University Press, 2013): the DOI landing page at academic.oup.com returned HTTP 403, and no open copy exists. The §2.1 locators (Theorem 2.10 and Corollary 2.11, pp. 37–38; Theorem 6.2, p. 171; Theorem 3.1, p. 54) are unchecked.
- **V** (Vershynin, *High-Dimensional Probability*): the author page at math.uci.edu timed out three times. Proposition 2.7.1(v) and Theorem 2.8.1 (§2.1), and Theorems 4.4.5 and 4.6.1 (§2.4), are unchecked.
- **Johansson 1998** (Duke Math. J.): Project Euclid offers no PDF link and there is no arXiv version, so Theorem 2.4 (§8.6) is unchecked.
- **Not fetched:** Silverstein 1995 (cited only through Bai1999 Remark 3.2), Simon 2005 (quoted through AGZ) and PB (layer-level only).

## Source issues

- **Misprint** in AGZ at Theorem 2.6.6, printed page 82: the source gives the rate for `x ≥ x*` as `β∫log|x−y|σ(dy) − V(x) − α`, which is negative to the right of `x*`; it should be `V(x) − β∫log|x−y|σ(dy) + α`, which is zero at `x*` and increasing; affects nothing.
- **Misprint** in AGZ at the free Poisson exercise of §5.3.3, printed page 368: the source gives the limit for `λ < 1` as `(1−λ)δ₀ + λp̃`, but `p̃` already has mass `λ`, so the total is `1 − λ + λ²`; it should be `(1−λ)δ₀ + p̃`; affects nothing.
