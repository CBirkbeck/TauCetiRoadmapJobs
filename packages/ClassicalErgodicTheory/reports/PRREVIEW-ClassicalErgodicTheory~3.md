# Review of ClassicalErgodicTheory (pull request #2231 at 90f2f6b)

**Verdict:** needs changes

## R01 (P1) — §8.5's Check says an expansive flow is not expansive

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:2132`, "The linear flow on `UnitAddCircle` is not expansive."

**Claim:** The unit-speed flow on `UnitAddCircle` satisfies §8.5's `IsExpansiveFlow` (`Suggested.lean:736`), so the Check asks for a proof of a false statement.

**Witness:** Given `ε`, take `δ = min ε (1/2)`. At `t = 0` the hypothesis gives `dist x y < δ`, so `y = x + u = ϕ u x` with `|u| = dist x y < ε`. This is the conclusion with `s` arbitrary.

**Repair:** Replace the bullet with these two:
- "The linear flow on `UnitAddTorus (Fin 2)` with direction `(1, √2)` is not expansive. For `ε = 1/2` and every `δ`, take `y = x + (η, 0)` with `0 < |η| < δ` and `s t = t`. Then `dist (ϕ t x) (ϕ t y) = |η| < δ` for all `t`. But `y = ϕ u x` needs `u√2 ∈ ℤ` and `u ≡ η mod 1`, which is impossible for `|u| < 1/2`."
- "The unit-speed flow on `UnitAddCircle`, a single closed orbit, is expansive: `dist x y < δ ≤ ε` already gives `y = ϕ u x` with `|u| < ε`."

## R02 (P2) — Statable headlines are declared not statable

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:19–29`, "the spectral measure of a vector for an isometry … exists at the pins only through Tau Ceti's Herglotz existence theorem, so a definition of it would have to choose the measure"; and "the identification of the logarithm of the Ruelle–Perron–Frobenius eigenvalue with the topological pressure".

**Claim:** Partly repaired (previous R08). Four headlines the docstring lists as not statable can be stated at the pins:
- §2.3 item 1, weak mixing iff every mean-zero spectral measure is atomless;
- §2.3 item 2, the Rajchman criterion for mixing;
- the spectral Halmos–von Neumann theorem;
- §8.6's `log λ = P`.

A statement can quantify over the measures with the prescribed moments, so no measure has to be chosen. The file's `topologicalPressure` needs only `[UniformSpace X]`, which the subtype `sftOneSided A` has.

**Witness:** A copy of `Suggested.lean` with the text below elaborates against the pins with 36 `declaration uses sorry` warnings and no error.

**Repair:**
- **Docstring.** Delete the first bullet (lines 19–23). In the second bullet, delete "and the identification of the logarithm of the Ruelle–Perron–Frobenius eigenvalue with the topological pressure (README §8.6)".
- **Spectral statements.** Add to `section Spectral`:

```lean
/-- Layer 2.3: mixing iff every mean-zero `f` has a Rajchman spectral measure,
`σ̂_f(n) = ⟪f, Uⁿ f⟫ → 0`. -/
theorem mixing_iff_exists_rajchman_spectralMeasure {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X} (hT : MeasurePreserving T μ μ) :
    (∀ A B : Set X, MeasurableSet A → MeasurableSet B →
      Tendsto (fun n : ℕ => μ.real (A ∩ T^[n] ⁻¹' B)) atTop (𝓝 (μ.real A * μ.real B))) ↔
    ∀ f : Lp ℂ 2 μ, ∫ x, f x ∂μ = 0 → ∃ σ : Measure Circle, IsFiniteMeasure σ ∧
      (∀ n : ℕ, ∫ z, (z : ℂ) ^ n ∂σ =
        inner ℂ f (((Lp.compMeasurePreservingₗᵢ ℂ T hT).toLinearMap ^ n) f)) ∧
      Tendsto (fun n : ℕ => ∫ z, (z : ℂ) ^ n ∂σ) atTop (𝓝 0) := by
  sorry

/-- Layer 2.3: weak mixing iff every mean-zero `f` has an atomless spectral measure. -/
theorem weakMixing_iff_exists_atomless_spectralMeasure {X : Type*} [MeasurableSpace X]
    (μ : Measure X) [IsProbabilityMeasure μ] {T : X → X} (hT : MeasurePreserving T μ μ) :
    WeakMixing T μ ↔ ∀ f : Lp ℂ 2 μ, ∫ x, f x ∂μ = 0 → ∃ σ : Measure Circle, IsFiniteMeasure σ ∧
      (∀ n : ℕ, ∫ z, (z : ℂ) ^ n ∂σ =
        inner ℂ f (((Lp.compMeasurePreservingₗᵢ ℂ T hT).toLinearMap ^ n) f)) ∧
      ∀ z : Circle, σ {z} = 0 := by
  sorry

/-- Layer 2.3: Halmos–von Neumann, spectral form. -/
theorem koopman_linearIsometryEquiv_iff_eigenvalues_eq {X Y : Type*} [MeasurableSpace X]
    [MeasurableSpace Y] (μ : Measure X) [IsProbabilityMeasure μ] (ν : Measure Y)
    [IsProbabilityMeasure ν] {T : X ≃ᵐ X} {S : Y ≃ᵐ Y} (hT : MeasurePreserving T μ μ)
    (hS : MeasurePreserving S ν ν) (hTe : Ergodic T μ) (hSe : Ergodic S ν)
    (hTd : Dense (Submodule.span ℂ {f : Lp ℂ 2 μ | ∃ c : ℂ,
      Module.End.HasEigenvector (Lp.compMeasurePreservingₗᵢ ℂ T hT).toLinearMap c f} : Set (Lp ℂ 2 μ)))
    (hSd : Dense (Submodule.span ℂ {f : Lp ℂ 2 ν | ∃ c : ℂ,
      Module.End.HasEigenvector (Lp.compMeasurePreservingₗᵢ ℂ S hS).toLinearMap c f} : Set (Lp ℂ 2 ν))) :
    (∃ V : Lp ℂ 2 μ ≃ₗᵢ[ℂ] Lp ℂ 2 ν, ∀ f, V (Lp.compMeasurePreservingₗᵢ ℂ T hT f) =
        Lp.compMeasurePreservingₗᵢ ℂ S hS (V f)) ↔
      {c : ℂ | Module.End.HasEigenvalue (Lp.compMeasurePreservingₗᵢ (E := ℂ) (p := 2) ℂ T hT).toLinearMap c} =
        {c : ℂ | Module.End.HasEigenvalue (Lp.compMeasurePreservingₗᵢ (E := ℂ) (p := 2) ℂ S hS).toLinearMap c} := by
  sorry
```

- **Ruelle–Perron–Frobenius.** Add `sftShift` before `consSeq`:

  ```lean
  /-- Layer 8.6: the shift `(σ x) n = x (n + 1)` on a one-sided subshift of finite type. -/
  def sftShift (A : ι → ι → Bool) (x : sftOneSided A) : sftOneSided A :=
    ⟨fun n => x.1 (n + 1), fun n => x.2 (n + 1)⟩
  ```

  In `exists_ruelleOperator_eigen`, replace the binders `[TopologicalSpace ι] [DiscreteTopology ι]` with `[UniformSpace ι] [DiscreteUniformity ι]`. Replace `0 < c ∧ ν (sftOneSided A) = 1 ∧` with `0 < c ∧ topologicalPressure (sftShift A) (fun x => φ x.1) = (Real.log c : EReal) ∧ ν (sftOneSided A) = 1 ∧`.
- **README.** Put the new names at their claims: §2.3 items 1 and 2 (lines 859, 863), the Halmos–von Neumann sentence (line 872) and §8.6 item 3 (line 2152).

## R03 (P2) — §8.6's cone contraction is cited to a matrix lemma; its owner is ProbabilisticAndMetricNumberTheoryPartII

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:2158–2159`, "contract the cone `{f > 0 | f x ≤ exp (K d_θ x y) f y}` in Hilbert's projective metric (Birkhoff)"; the *Needs:* line at 2180 reads "Tau Ceti Birkhoff contraction".

**Claim:** The route applies Birkhoff's contraction to a cone in `C(Σ⁺, ℝ)`. The cited Tau Ceti theorem covers only entrywise-positive finite matrices. The general-cone theorem is ProbabilisticAndMetricNumberTheoryPartII §3.3, which is earlier in the merge order and is not cited.

**Witness:**
- Tau Ceti `Data/Matrix/BirkhoffContraction.lean:410`: `hilbertProjectiveDist_mulVec_le {K : Matrix ι κ ℝ} (hK : ∀ i j, 0 < K i j)`.
- ProbabilisticAndMetricNumberTheoryPartII `README.md:826–850` (edc1aee), §3.3 `birkhoff_contraction`, is stated for convex cones in real vector spaces.

**Repair:**
- At line 2159, write "metric by ProbabilisticAndMetricNumberTheoryPartII §3.3's `birkhoff_contraction`".
- Add "ProbabilisticAndMetricNumberTheoryPartII §3.3 (`birkhoff_contraction`)" to the *Needs:* line at 2180 and to Layer 8's Dependencies.
- Add a supplier subsection "### From TauCetiRoadmap.ProbabilisticAndMetricNumberTheoryPartII — §3.3" with that theorem and its order-bound hypothesis.
- Keep the Tau Ceti matrix lemma for item 1.
- Name the new supplier in the pull-request description.

## R04 (P3) — The spectral-measure normalization differs from MathematicalBilliards §12.4 with no conversion

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:133–138` (`⟪f, U_t f⟫ = ∫ exp(2π i t ξ) dσ_f`, with the inverse-action Koopman) and line 925, "recover … MathematicalBilliards §12.4's real-interval version for ℝ".

**Claim:** MathematicalBilliards §§12.4–12.4.1 uses `U_t f = f ∘ F^t` and the kernel `exp(itξ)`, so the same vector has spectral measures related by `ξ ↦ −2πξ`. Nothing in the README states or checks this conversion.

**Witness:** Take the unit-speed flow on `AddCircle 1` and `e₁(x) = exp(2πix)`. Here `U_t e₁ = exp(−2πit) e₁`, so `σ = δ_{−1}`. MathematicalBilliards design `README.md`, §12.5's last Check, gives `δ_{2π}`.

**Repair:**
- After line 821 add: "MathematicalBilliards §12.4's measure of `f` is the image of `spectralMeasureReal U f` under `ξ ↦ −2πξ`; atoms and their masses correspond."
- Add the §2.1 Check: "For the unit-speed flow on `AddCircle 1` and `e₁`, `spectralMeasureReal` is `δ_{−1}`, and MathematicalBilliards §12.4.1 gives `δ_{2π}`."

## R05 (P3) — Sampled targets lack theorem-level locators, and one Tau Ceti path is wrong

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- lines 916, 921 (§2.5), 1057 (§3.4), 1178 and 1192 (§4.0), 1437 (§4.9), 1497 (§5.1), 1747 (§6.3), 1769 (§6.4), 1865 (§7.4) and 2001 (§8.3);
- lines 1819, 1821, 1964 and 1980, "(Walters, Chapter 9)";
- line 813, `FiniteMeasure.pontryaginMeasureTransform_injOn_innerRegular` under `TauCeti/Analysis/Bochner/LocallyCompactGroup.lean` (line 216 of the supplier table).

**Claim:** Partly repaired (previous R11). These theorems carry no theorem-level locator or only a chapter-level one. The cited declaration is not in the stated file.

**Witness:**
- Creutz line 4238 (Theorem 12.2, p. 110) and line 4497 (Theorem 13.7, p. 117) are in `sources.toml` but are not cited in the README.
- The declaration is at Tau Ceti `Analysis/Fourier/Pontryagin/Uniqueness.lean:275`.

**Repair:** Add these locators at the claims:
- §2.5 line 916: "(Creutz, Theorem 12.2, p. 110, ergodic case)"; line 921: "(Creutz, Theorem 13.7, p. 117)".
- §3.4: "(Hochman2012, Proposition 3.4.2, p. 22, for a single map)".
- §4.0 item 1: "(Sarig2023, Propositions 4.2–4.3, p. 106)"; item 3: "(Sarig2023, Theorem 4.2, p. 108)".
- §4.9: "(WardZhang1992, Monatsh. Math. 114, 317–329)".
- §5.1: "(Hochman2012, Proposition 4.5.2, p. 41)".
- §6.3: the theorem number of the local entropy formula in BrinKatok1983 (LNM 1007, pp. 30–38).
- §6.4: "(Abramov, Dokl. Akad. Nauk SSSR 128 (1959), 873–875)".
- §7.4: "(MoulinOllagnier1985, Theorem 5.2.7, as cited in Chung2013, p. 2)".
- §8.3 Check: "(Chung2013, Theorem 5.3, p. 21, with Theorem 1.1, p. 2)".
- §7.1: replace "(Walters, Chapter 9)" with "(Walters1982, Theorem 9.10, as cited in Chung2013, p. 2)".
- §8.2's Check at line 1980: use "(Walters1982, Theorem 9.16, as cited in Chung2013, p. 23)".
- Line 216: give `FiniteMeasure.pontryaginMeasureTransform_injOn_innerRegular` its own path, `TauCeti/Analysis/Fourier/Pontryagin/Uniqueness.lean`.

## R06 (P3) — Checks are paragraphs, several definitions have fewer than three, and one Check cites a target that does not cover it

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- The `**Checks.**` of §§0.7, 0.8, 1.4, 1.5, 2.2, 2.4, 2.5, 4.0–4.2, 4.6–4.10, 5.6, 6.2, 7.1–7.4, 8.1 and 8.3 are prose paragraphs.
- §§1.3, 2.3, 3.3, 5.2 and 5.4 define objects and give two bulleted Checks.
- Line 1988: `X_k` forbids `k` consecutive `1`s and cites "§5.2 item 4".

**Claim:** Partly repaired (previous R16). Each definition needs at least three Checks, one per bullet. `X_k` is a `(k−1)`-step subshift of finite type, while §5.2 item 4 covers one-step subshifts.

**Witness:** For example, line 1352 ("**Checks.** For ℤᵈ Bernoulli actions, …") gives two tests in one paragraph for `actionPartitionEntropyRate` and `actionMeasureEntropy`.

**Repair:**
- Rewrite each paragraph as a bullet list with one test per bullet.
- Add these Checks:
  - §1.3: "`ZMod 2` acting on two equiprobable points by translation: `μ (A ∩ (n +ᵥ ·) ⁻¹' A)` alternates `1/2, 0` for `A = {0}`, so the action is ergodic and not `MixingVAdd`."
  - §2.3: "The one-sided fair shift has only constant eigenfunctions, so it does not have discrete spectrum."
  - §3.3: "Over the swap of two points with `r ≡ 1`, the suspension is one closed orbit of length 2."
  - §5.2: "The swap of two points is transitive but not topologically mixing: `T^[n] '' {0} ∩ {0} = ∅` for odd `n`."
  - §5.4: "`P(T, c) = coverEntropy T univ + c`; for the doubling map this is `log 2 + c`."
- At line 1988 write "(its `(k−1)`-block recoding is a one-step subshift of finite type, so §5.2 item 4 applies)".

## Verified sound

Status of the previous review's findings:
- Repaired: R01 (lines 654–656 carry the limit), R02, R03, R04, R05, R06, R07, R09, R10, R12, R13, R14, R15, R17 and R18.
- Partly repaired: R08 (now R02), R11 (now R05) and R16 (now R06).

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| §0.5 `orbitLabel`, `orbitEntourage` | `F = ∅`; `F = {g}`; fair shift, `range 2` | one-point label, `H = 0`, entourage `univ`; `ξ ∘ (g • ·)`; 4 values of mass 1/4, `H = 2 log 2` | holds; definitions, no locator needed |
| §1.5 natural extensions | Sarig line 1335 (Thm 1.6, p. 26); product over identity 2-point base | ergodic ⇔ ergodic, mixing ⇔ mixing (needs `T X = X`); `{z = 0}` invariant pullback, self-product not ergodic | holds |
| §2.3 item 1 | Sarig line 4515 (Thm 3.2, p. 91), line 4618 (Prop 3.3, p. 93); swap | 1 ⇔ 2 ⇔ 3 ⇔ 4 on Lebesgue; 3.3 one direction; eigenvalues `1, −1` simple | holds |
| §2.5 Følner MET | Creutz line 4238; trivial representation; ℤ on `ℂ` by `e^{2πinα}` | `∑_{F⁻¹} π(γ)` = README `∑_F U(g⁻¹)`; average `= v`; irrational `α`: averages `→ 0 = P_fix` | holds; no locator (R05) |
| §3.4 flows | unit circle flow; trivial flow | flow-invariant `{volume}`, `ϕ 1 = id` all; averaging `δ_x` over `[0,1]` gives volume | holds; no locator (R05) |
| §4.0 | fair bit with itself; independent bits; Sarig line 5262 | masses `(1/2,0,0,1/2)`, `log 2`; `2 log 2`; Thm 4.2 countable `α`, `H < ∞` | holds; locator (R05) |
| §4.2 | Sarig lines 5500–5509, 5640–5644; two-sided fair | Def 4.4/Thm 4.4 p. 111 match; invertible with one-sided generator gives `h = 0 < log 2` | holds |
| §4.3 | Sarig lines 5627, 5653; `κ = !![1−p,p;p,1−p]`, `p = 1/2` | `−∑ p_i log p_i`; `−∑ π_i κ_ij log κ_ij = −(p log p + (1−p) log(1−p)) = log 2` | holds |
| §4.9 | one-point factor; Bernoulli fibre | relative = §4.6 entropy; product with fair Bernoulli: `log 2` | holds; no locator (R05) |
| §5.1 | Hochman line 1766; rotation by 1/3; doubling | uniform on `{x, x+1/3, x+2/3}` invariant for each `x`; `δ_0`, volume both ergodic | holds; locator (R05) |
| §6.1 | Sarig line 5564 (Prop 4.5, p. 112), line 5905 (Thm 4.7, p. 119); full 2-shift | Borel map, `diam → 0`; Goodwyn; constant `3/4`, atom diameter `1/2` | holds |
| §6.3 `brinKatok` | full 2-shift, `ε = 2^(−m)`; isometry | `B_n` = `(n+m)`-cylinder, `(n+m) log 2 / n → log 2 = h`; balls fixed, 0 | holds; locator (R05) |
| §6.4 `measureEntropy_flow` | `t = 0`; `t = −1`; cat map | `0 = 0 · ⊤`; `h(T⁻¹) = h(T)`; `log 2.618 = 0.9624` | holds; locator (R05) |
| §7.4 | trivial action of infinite `G` on finite `X`; Chung line 66 | entropy 0, both sides `max φ`; Moulin Ollagnier Thm 5.2.7 | holds; locator (R05) |
| §8.3 | `G`-full shift, `f = a_{x(e)}`; Chung line 1304 | `P = log ∑ exp a_j`, Bernoulli Gibbs weights an equilibrium state (Thm 5.3, p. 21) | holds; locator (R05) |
| `weakMixing_iff_tendsto_cesaro` | swap; one point | `|corr − 1/4| = 1/4` for all `n`, mean 1/4; 0 | holds |
| `WeakMixing.ergodic_prodMap_of_ergodic` | irrational rotation `R`, `R × R` | `{x − y ∈ [0,1/2)}` invariant, measure 1/2: `R` not WM | consistent |
| `tendsto_cesaro_norm_moment_sq` | `δ₁ + δ₋₁`; Haar | `|σ̂(n)|² = 4, 0, 4…`, mean `2 = 1 + 1`; `σ̂(n) = 0` for `n ≥ 1`, mean `→ 0` | holds |
| `weakMixing_iff_hasEigenvector_ae_const` | swap | `f = (1, −1)`, `Uf = −f`, nonconstant; not WM | holds |
| `exists_tendsto_foelner_average` | `G = ℤ`, intervals, trivial `U` | `w = v`, orthogonality vacuous | holds |
| `weakMixingVAdd_real_iff_tendsto_cesaro` | trivial flow, 2 points | integrand `1/4` for all `t` | holds |
| `weakMixingVAdd_real_iff_weakMixing` | unit circle flow, `t = 1` | time map `id` not WM; `e₁` is a frequency-1 eigenfunction; both sides false | holds |
| KS generator theorems | one-sided fair shift; identity on 2 points | rate `log 2 = h`; point label generates, rate `0 = h` | holds |
| `measureEntropy_naturalExtension` | one- to two-sided fair shift | `log 2 = log 2` | holds |
| `measureEntropy_bernoulliShift` | `(1/3,1/3,1/3)`; `δ_a` | `log 3`; `0` | holds |
| `measureEntropy_markovShift` | `κ = !![0,1;1,0]`, uniform `π` | all `κ_ij ∈ {0,1}`: 0, periodic system | holds |
| `measureEntropy_factor_add_relative` | `π = id`; `π` to a point | `h = h + 0`; `h = 0 + h` | holds |
| `actionPartitionEntropyRate_tendsto` | ℤ fair Bernoulli, coordinate label | `H(ξ^F) = #F log 2` for every `F`; limit = inf = `log 2` | holds |
| `measureEntropy_toralEndomorphism` | cat map; `d = 0`; `!![2,0;0,1]` | `log 2.618`; charpoly 1, sum 0; `log 2` | holds |
| `topologicalPressure_eq_iSup`, `coverEntropy_eq_iSup` | `X = ∅`; identity on finite `F`; full 2-shift | `⊥ = ⊥`; `max φ`; `log 2` attained by Bernoulli | holds |
| `flowTopologicalPressure_eq_iSup` | unit circle flow | `F₁ ≡ ∫F`, `P(id, F₁) = ∫F`; RHS volume only: `0 + ∫F` | holds |
| `actionTopologicalPressure_eq_iSup` | trivial action, finite `X` | `max φ` both sides; comap of `maxFoelner` to `Finset` is `NeBot` (finite sets in `maxFoelner`) | holds |
| `isEquilibriumState_iff_toReal`, `exists_isEquilibriumState` | identity on finite `F` | equilibrium states = probabilities on `argmax φ` | holds |
| `existsUnique_isEquilibriumState` | 2-shift, `φ = w(x 0)`; 3-cycle | unique Bernoulli `e^{w_i}/∑`; 3-cycle has no specification for `3 ∤ p` | holds |
| `existsUnique_isFlowEquilibriumState` | unit circle flow | expansive (R01) but no specification (`p + τ ∈ ℤ` fails for `ε < 1/2`); unique invariant measure anyway | consistent |
| `exists_ruelleOperator_eigen` | full shift, `φ(x 0)`; golden mean, `φ = 0` | `c = ∑ e^{φ_i}`, `h = 1`; `c = 1.618`, `log c = h_top` | holds; `log c = P` statable (R02) |
| §8.5 Check (R01) | unit circle flow; `(1, √2)` torus flow | `δ = min ε (1/2)` gives `y = ϕ u x`; `y = x + (η, 0)` stays at distance `|η|` and lies on no short orbit arc | Check false |
| Docstring (R02) | probe file with 3 statements and the RPF conjunct | 36 `sorry` warnings, 0 errors | statable |
| §8.6 route (R03) | `hilbertProjectiveDist_mulVec_le` | hypothesis `K : Matrix ι κ ℝ`, `∀ i j, 0 < K i j` | does not cover cones in `C(Σ⁺)` |
| §2.1 vs MathematicalBilliards (R04) | `e₁` on `AddCircle 1` | here `δ_{−1}`; there `δ_{2π}` | conversion missing |

- **Gate.** The worker's gate passed. My rerun passes every text check. Its only failure is `depcheck: NOT IN ORDER: ClassicalErgodicTheory`, the default order file, which is not a finding. The dependency check against the candidate order gives `depcheck: 206 roadmaps, 1900 edges, 0 problem(s)`, with no UPWARD or CYCLE line. Nothing changes outside the folder.
- **Elaboration.** `lake env lean` on `Suggested.lean` gives 33 warnings, all `declaration uses sorry`.
  - The 23 signature leads with dropped binders are all definitions whose types do not need the binder. The theorems keep `CompactSpace`, `BorelSpace` and `StandardBorelSpace` from their sections.
  - One-tactic probe (`first | rfl | simp | infer_instance | tauto`): 0 of 33 theorems close.
- **Sources.** I checked 30 locators against the cached texts:
  - Sarig2023: Def 1.17, Lemma 1.2, Thms 1.6, 1.7, 3.2, 4.2, 4.4, 4.6, 4.7, 4.8, 4.9, Def 3.8, 4.4, Props 1.7, 3.3, 3.5, 4.2, 4.3, 4.5–4.8, Cor 1.1. Printed pages match.
  - Creutz Thms 12.2, 13.7; Hochman2012 Props 3.4.2, 4.5.2; Chung2013 Thms 1.1, 5.3 and p. 2.
- **Library.** I grepped 38 cited Mathlib names and 29 Tau Ceti names at the pins. All exist except the wrong path in R05. Files opened: Mathlib `FoelnerFilter.lean:91, 216`, `Flow.lean:143, 154`, `Transitive.lean:31`, `PiNat.lean:406–414`, `Homeomorph/Defs.lean:171`; Tau Ceti `BirkhoffContraction.lean:410`, `Spectrum.lean:152`, `LocallyCompactGroup.lean:95`, `Pontryagin/Uniqueness.lean:275`, `ProjectiveLimit/Countable.lean:165`.
- **Cross-roadmap citations.** All resolve:
  - GeometryOfNumbersAndQuadraticArithmetic §4.2 at 3b084ef (15 names; its restated entropy definitions agree with `Suggested.lean`);
  - ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a at d311ebe;
  - ArithmeticDynamics §§2.6–2.7 at ae79f44;
  - MathematicalBilliards §§7.1–8.3, 12.1–12.5, 12.4.1 in its accepted design;
  - MarkovChainsAndRenewal and AmenableGroups on main.
- **Overlap check:** I read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, Equidistribution, PointProcesses, ProbabilisticAndMetricNumberTheoryPartII, Exchangeability, OptimalTransport and StochasticCalculus; the third list is empty. Shared objects and their owners:
  - Birkhoff, strong mixing and label entropy: ProbabilisticAndMetricNumberTheory (consumed);
  - SMB, the ergodic decomposition, Goodwyn's bound and null-boundary partitions: ArithmeticDynamics (consumed);
  - general-cone Birkhoff contraction: ProbabilisticAndMetricNumberTheoryPartII §3.3 (R03);
  - Koopman operators and the invariant σ-algebra of maps: Exchangeability through Tau Ceti (consumed);
  - mixing of `ℝᵈ`-actions: here §1.3, which PointProcesses Layer 7 specializes to point processes;
  - Equidistribution (Weyl, `nα`), OptimalTransport and StochasticCalculus (Wiener shift) share nothing.

## Not verifiable

- These sources are uncertified (paywalled) and were not read: Walters1982, CornfeldFominSinai1982, EinsiedlerWard2011, KechrisMiller2004, WardZhang1992, OrnsteinWeiss1987, BowenRuelle1975, BrinKatok1983, MoulinOllagnier1985 and Lindenstrauss2001. Walters Theorems 9.10 and 9.16 and Moulin Ollagnier Theorem 5.2.7 are known only through Chung2013's citations.
- These references are not in the manifest and cite no theorem numbers, so I fetched nothing: Glasner 2003, Abramov 1959, Downarowicz 2011, Bowen 1974 and LNM 470, Bowen–Walters 1972, Franco 1977, Parry–Pollicott 1990, Misiurewicz 1973 and Mackey 1962.
- No cached legal text states the toral-entropy formula of §6.4 or the flow forms of §§3.4–3.5. I checked these by computation only (table).
- MathematicalBilliards exists only as an accepted design on the board. Its section numbers could change at the package stage.

## Source issues

- none
