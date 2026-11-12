# Review of ClassicalErgodicTheory (pull request #2231 at e0f8dc5)

**Verdict:** needs changes

## R01 (P2) — `HasFlowBowenProperty` constrains negative times, so the flow Bowen theorem assumes far too much

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:806`, "`∀ (t : ℝ) (x y : X), (∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) ≤ ε) →`"; `README.md:2240`, "whenever `dist (ϕ s x) (ϕ s y) ≤ ε` on `[0, t]`".

**Claim:** For `t < 0`, `Set.Icc 0 t = ∅`, so the definition demands `|∫_t^0 (F (ϕ s x) - F (ϕ s y)) ds| ≤ K` for every pair of points. Any flow with two periodic orbits on which `F` has different averages violates this. `existsUnique_isFlowEquilibriumState` then covers only potentials with the same integral against every invariant measure.

**Witness:** Take the trivial flow on `{a, b}` and `F = 1_{a}`. For `t ≥ 0` and `ε < dist a b`, the README property holds with `K = 0`. At `t = -n`, the Lean conclusion reads `n ≤ K` for every `n`.

**Repair:**
- Replace line 806 with `∃ ε > 0, ∃ K : ℝ, ∀ (t : ℝ) (x y : X), 0 ≤ t → (∀ s ∈ Set.Icc 0 t, dist (ϕ s x) (ϕ s y) ≤ ε) →`. A copy elaborates.
- In README line 2240, write "whenever `t ≥ 0` and `dist (ϕ s x) (ϕ s y) ≤ ε` on `[0, t]`".
- Add this Check to §8.5: "For the trivial flow on two points `a`, `b` and `F = 1_{a}`, `ε < dist a b` and `t ≥ 0` force `x = y`, so `K = 0` works. Without `t ≥ 0`, `t = -n` would demand `n ≤ K`."

## R02 (P2) — Uniqueness of equilibrium states on subshifts of finite type is statable but declared not statable

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/Suggested.lean:22–26`, "uniqueness of equilibrium states for Hölder potentials on transitive subshifts of finite type … Mathlib's `Subshift` carries no metric".

**Claim:** The pins do not block this headline. The block is the file's own `[MetricSpace X]` binder on `IsEquilibriumState`. Its body needs only a uniformity and a σ-algebra, and `sftOneSided A` already carries both: line 854 states its pressure.

**Witness:** A copy in which `IsEquilibriumState` is moved, body unchanged, into `section Topological` (`[MeasurableSpace X] [UniformSpace X]`), with the declarations below added, elaborates: 39 `declaration uses sorry` warnings and no error.

**Repair:**
- Move `IsEquilibriumState`, body unchanged, to just before `end Topological`.
- Add to `section SubshiftsOfFiniteType`:

```lean
/-- Layer 8.4: the two-sided subshift of finite type of sequences with `A (x n) (x (n + 1))`. -/
def sftTwoSided (A : ι → ι → Bool) : Set (ℤ → ι) :=
  {x | ∀ n, A (x n) (x (n + 1)) = true}

/-- Layer 8.4: the shift `(σ x) n = x (n + 1)` on a two-sided subshift of finite type. -/
def sftShiftTwoSided (A : ι → ι → Bool) (x : sftTwoSided A) : sftTwoSided A :=
  ⟨fun n => x.1 (n + 1), fun n => x.2 (n + 1)⟩

/-- Layer 8.4: a `d_θ`-Hölder potential on an irreducible two-sided subshift of finite type has
exactly one equilibrium state. -/
theorem existsUnique_isEquilibriumState_sftTwoSided [Nonempty ι] [DecidableEq ι]
    [UniformSpace ι] [DiscreteUniformity ι] [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (A : ι → ι → Bool)
    (hirr : ∀ i j, ∃ N : ℕ, 0 < N ∧
      0 < ((Matrix.of fun i j => if A i j = true then (1 : ℝ) else 0) ^ N) i j)
    {θ : ℝ} (hθ : θ ∈ Ioo 0 1) (φ : C(sftTwoSided A, ℝ))
    (hφ : ∃ C : ℝ, ∀ x y : sftTwoSided A, ∀ n : ℕ,
      (∀ k : ℤ, |k| < n → x.1 k = y.1 k) → |φ x - φ y| ≤ C * θ ^ n) :
    ∃! ν, IsEquilibriumState (sftShiftTwoSided A) φ ν := by
  sorry

/-- Layer 8.4: the same for an irreducible one-sided subshift of finite type. -/
theorem existsUnique_isEquilibriumState_sftOneSided [Nonempty ι] [DecidableEq ι]
    [UniformSpace ι] [DiscreteUniformity ι] [MeasurableSpace ι] [MeasurableSingletonClass ι]
    (A : ι → ι → Bool)
    (hirr : ∀ i j, ∃ N : ℕ, 0 < N ∧
      0 < ((Matrix.of fun i j => if A i j = true then (1 : ℝ) else 0) ^ N) i j)
    {θ : ℝ} (hθ : θ ∈ Ioo 0 1) (φ : C(sftOneSided A, ℝ))
    (hφ : ∃ C : ℝ, ∀ x y : sftOneSided A, ∀ n : ℕ,
      (∀ k < n, x.1 k = y.1 k) → |φ x - φ y| ≤ C * θ ^ n) :
    ∃! ν, IsEquilibriumState (sftShift A) φ ν := by
  sorry
```

- In the docstring, reduce the bullet to: "uniqueness of equilibrium states for Hölder potentials on suspension flows over subshifts of finite type (README §8.5): the topological suspension space with the Bowen–Walters metric".
- In the README:
  - §8.1, line 2029: "For continuous `T` on a nonempty compact space with its uniformity (a compact metric space, or a subshift with the product uniformity)".
  - §8.4: name `sftShiftTwoSided A` beside `sftTwoSided A`.
  - Put `existsUnique_isEquilibriumState_sftTwoSided` at "Hence every Hölder potential on a transitive two-sided SFT…" and `existsUnique_isEquilibriumState_sftOneSided` at "The same holds for one-sided SFTs".
- In the description, replace "uniqueness of equilibrium states on subshifts of finite type and their suspension flows is the headline left unstated, because Mathlib has no metric instance on its subshifts and no topological suspension space" with "uniqueness of equilibrium states on suspension flows over subshifts of finite type is the headline left unstated, because Mathlib has no topological suspension space".

## R03 (P2) — §8.5 uses the suspension entropy formula for nonergodic measures, but §6.4 proves it only over ergodic bases

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:1892`, "For §3.3's suspension over an ergodic invertible base with positive integrable roof, prove `h_susp(ϕ 1) = h_μ(T) / ∫ r dμ`". Line 2255 applies it to every `ν ∈ invariantProbabilities σ`.

**Claim:** §8.5 item 1 cites §6.4 for the formula `h_{ν^r}(ϕ 1) = h_ν(σ) / ∫ r dν` for every invariant `ν`, ergodic or not. §6.4 owns only the ergodic case. The formula holds without ergodicity, so the hypothesis narrows the target below what §8.5 consumes.

**Witness:** Take a base made of two invariant halves with roofs `1` and `2` and entropies `a` and `b`. The suspension gives the halves weights `1/3` and `2/3`. So `h = a/3 + (2/3)(b/2) = (a+b)/3`, and `h_μ(T) / ∫ r = ((a+b)/2)/(3/2) = (a+b)/3`.

**Repair:** At line 1892, write: "For §3.3's suspension over an invertible base with positive integrable roof, prove `h_susp(ϕ 1) = h_μ(T) / ∫ r dμ`. Deduce the nonergodic case from the ergodic one by the ergodic decomposition `μ = ∫ μ_x` of the base: the suspension measure is the mixture of the `μ_x^r` with weights `∫ r dμ_x / ∫ r dμ`, and entropy is affine on it."

## R04 (P3) — Four definitions of §§8.4–8.5 have no Check, and `IsExpansiveFlow` has two

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:2172–2179` (`HasBowenProperty`, `IsGibbsMeasure`) and 2235–2240 (`HasFlowSpecification`, `HasFlowBowenProperty`); the Checks are at 2216–2224 and 2269–2282.

**Claim:** No Check computes the Bowen property, the Gibbs property, flow specification or the flow Bowen property for any system, and `IsExpansiveFlow` has two Checks. A Check at negative `t` would have caught R01.

**Witness:** §8.4's Checks test Bowen's theorem's conclusion, the Parry measure and the failure of specification. §8.5's Checks test suspension entropies and expansiveness only.

**Repair:** Add to §8.4's Checks:
- "On the one-sided full shift on `Fin 2` with `d(x, y) = 2^(-min {k | x k ≠ y k})`, a potential depending only on `x 0` has the Bowen property with `ε = 1/2` and `K = 0`. The continuous potential `φ x = 1/(1 + min {k | x k = 1})`, with `φ (000…) = 0`, does not: for `x = 000…` and `y = 0ⁿ1000…`, `S_n φ y - S_n φ x = ∑_{j=2}^{n+1} 1/j → ∞`."
- "The identity of `[0, 1]` with `φ x = x` lacks the Bowen property: `|S_n φ x - S_n φ y| = n |x - y|`."
- "On the same shift, take `ε = 2^(-m)`. For `φ = 0`, the uniform Bernoulli measure is Gibbs with `K = 2^m`, since `μ (B_n(x, ε)) = 2^(-(n+m))` and `P = log 2`. For `φ` depending on `x 0`, the Bernoulli measure with `p_i ∝ exp (φ i)` has ratio `∏_{k=n}^{n+m-1} p_(x k)` in `[p_min^m, 1]`. The Dirac mass at `000…` is not Gibbs, since `μ (B_n(111…, ε)) = 0`."

Add to §8.5's Checks:
- "The trivial flow on two points `a`, `b` is expansive: with `δ < dist a b`, the hypothesis at `t = 0` forces `y = x = ϕ 0 x`."
- "The unit-speed flow on `UnitAddCircle` has no flow specification: its periods are integers, so for `p = n + 1/2` and `ε < 1/2`, no `|τ| ≤ ε` gives `p + τ ∈ ℤ`. The trivial flow on one point has flow specification. The trivial flow on two points at distance `> 2ε` does not."
- "For the unit-speed flow on `UnitAddCircle`, every continuous `F` has the flow Bowen property with `K = 2 ‖F‖_∞`, since `∫_0^t F (x + s) ds = ⌊t⌋ ∫ F + O(‖F‖_∞)`. The trivial flow on `[0, 1]` with `F x = x` lacks it, since the difference is `t |x - y|`."

## R05 (P3) — §1.0's third Check intersects the wrong sets

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:650–651`, "mixing gives `μ (B ∩ (m₀ • ·) ⁻¹' B) = μ B ^ 2` for `A = (m₀ • ·) ⁻¹' B`, and invariance turns the left side into `μ B`".

**Claim:** With `A = (m₀ • ·) ⁻¹' B`, the set `A ∩ (m₀ • ·) ⁻¹' B` is `(m₀ • ·) ⁻¹' B`, not `B ∩ (m₀ • ·) ⁻¹' B`. Invariance does not turn `μ (B ∩ (m₀ • ·) ⁻¹' B)` into `μ B`.

**Witness:** For the swap `T` on two equiprobable points, with `m₀ = T` and `B = {0}`: `μ (B ∩ T ⁻¹' B) = 0`, while `μ B = 1/2`.

**Repair:** "Along `pure m₀`, mixing with `A = (m₀ • ·) ⁻¹' B` gives `μ ((m₀ • ·) ⁻¹' B) = μ ((m₀ • ·) ⁻¹' B) * μ B`, and invariance turns this into `μ B = μ B ^ 2`, so `μ B ∈ {0, 1}` for every measurable `B`: …" (the rest unchanged).

## R06 (P3) — In §8.4 item 1 the deletion of unused symbols governs only the transitivity clause

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md:2201–2203`, "it is topologically transitive iff `A` is irreducible (after deleting symbols that occur in no bi-infinite sequence), and topologically mixing iff `A` is aperiodic".

**Claim:** As written, the mixing clause fails for a matrix with a symbol that occurs in no bi-infinite sequence.

**Witness:** Take `ι = Fin 2`, `A 0 0 = A 0 1 = true` and `A 1 j = false`. Then `sftTwoSided A = {000…}`, a fixed point, so the shift is topologically mixing. But row `1` of every matrix power is zero, so `A` is not aperiodic.

**Repair:**
- Rewrite item 1: "1. the shift on `sftTwoSided A` is expansive. After deleting the symbols that occur in no bi-infinite sequence, it is topologically transitive iff `A` is irreducible, and topologically mixing iff `A` is aperiodic;".
- Add this matrix as a §8.4 Check: deleting symbol `1` leaves the aperiodic `1 × 1` matrix `(1)`.

## R07 (P3) — Sampled targets carry no locator

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- §0.3, lines 413–425;
- §3.3, lines 1080–1098;
- §4.1, lines 1286–1292;
- §5.2, lines 1622–1636;
- §5.6, lines 1758–1778;
- §6.2, lines 1834–1843.

**Claim:** These theorems cite no source, although the cached legal texts state most of them.

**Witness:**
- Sarig2023 line 6001 (Theorem 4.8, p. 121) proves §5.2 items 1–2.
- Sarig2023 line 6416 (Problem 4.4, p. 130) is §4.1 item 2.
- Chung2013 lines 471–516 (p. 9) define §5.6's pressure.

**Repair:** Add at the claims:
- §0.3 items 2–3: "(Sarig2023, Definition 1.6, p. 10, and Proposition 1.8, p. 12, for finite alphabets)".
- §3.3: at the construction, "(Sarig2023, Definition 1.20, p. 30, for roofs with `inf r > 0`)"; for items 1–4, their theorem numbers in CornfeldFominSinai1982, Chapter 11.
- §4.1:
  - items 1–4 and 6: "(Sarig2023, Problems 4.3–4.6 and 4.8, p. 130, and Problem 4.12, p. 131)";
  - item 5: "(Sarig2023, Theorem 4.2, p. 108, with Proposition 4.3, p. 106)".
- §5.2:
  - items 1–2: "(Sarig2023, Definitions 4.5–4.7 and Theorem 4.8, pp. 119–121)";
  - item 3's power rule: "(Sarig2023, Problem 4.13, p. 131)";
  - item 4's isometries: "(Sarig2023, proof of Corollary 4.1, p. 122)".
- §5.6: "(Chung2013, §3, pp. 8–9, for the cover and separated-set definitions along Følner sequences; Proposition 6.1, pp. 23–24, with Theorem 1.1, p. 2, for pressure at zero, constants, monotonicity, the Lipschitz bound, convexity and coboundaries, cited there to MoulinOllagnier1985, Corollary 5.2.6; Theorem 5.3, p. 21, for the full shift)".
- §6.2: the theorem numbers in Walters1982, Chapter 8, for upper semicontinuity under expansiveness and for Jacobs' formula.

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Prev R01: §8.5 Check | line 2280, "The unit-speed flow on `UnitAddCircle`, a single closed orbit, is expansive"; `(1, √2)` torus flow | `δ = min ε (1/2)` gives `y = ϕ u x`; for `y = x + (η, 0)`, `u√2 ∈ ℤ` forces `u = 0` | repaired |
| Prev R02: statable spectral headlines and RPF pressure | `Suggested.lean:289, 300, 313, 854` | stated; file elaborates with 37 `sorry` warnings | repaired |
| Prev R03: §8.6 cone route | lines 2309–2310, "ProbabilisticAndMetricNumberTheoryPartII §3.3's `birkhoff_contraction`" | contract at lines 235–241 matches that roadmap's lines 846–871 at edc1aee | repaired |
| Prev R04: §2.1 conversion | lines 862–863 and 875–877 | `U_t e₁ = e^{-2πit} e₁` gives `δ_{-1}`; its image under `ξ ↦ -2πξ` is `δ_{2π}`, the billiards §12.5 value | repaired |
| Prev R05: locators | §§2.5, 3.4, 4.0, 4.9, 5.1, 6.4, 7.1, 7.4, 8.2 Check, 8.3; path at line 217 | added; §6.3 cites pages only, §8.2 item 5 still says "Chapter 9" | partly; uncertified texts (Not verifiable) |
| Prev R06: Checks | bulleted throughout; line 2122, "recoding by words of length `k - 1`" | `X_2` is the golden mean, `log 1.618`; `X_1` is a fixed point, `λ_1 = 1` | repaired |
| §0.3 examples | `toralEndomorphism !![2,0;0,1]`; switching Markov chain | `(0,0)` and `(1/2,0)` both map to `(0,0)`, two preimages preserve `volume`; `μ({x0=0} ∩ σ⁻ⁿ{x0=0})` alternates `1/2, 0` | holds; no locator (R07) |
| §3.3 suspension | swap with `r ≡ 1`; constant roof `c` | one orbit of length 2; `g = (1,-1)`, `g ∘ T = e^{πi} g`; `exp(2πis/c)` has frequency `1/c` | holds; no locator (R07) |
| §4.1 basic properties | swap with point partition; identity | `H = log 2`, `H(ξⁿ) = log 2`, rate `0`, not independent; identity rate `0` | holds; no locator (R07) |
| §4.4 Abramov, induced | Sarig line 5776 (Thm 4.6, p. 116); fair shift with `A = {x0 = 0}`; fixed point ⊔ shift | spanning set on a Lebesgue space, as stated; `2 log 2 = log 2 / (1/2)`; `0 ≠ log 2` without covering | holds |
| §5.2 entropy | golden mean; swap; isometry | `ρ = 1.618`, `log ρ = 0.4812`; `T^n {0} ∩ {0} = ∅` for odd `n`; `d_n = d` gives `0` | holds; no locator (R07) |
| §5.5 flows | unit-speed circle flow; time change by `c` | at most `⌈1/ε⌉` separated points, `F₁ ≡ ∫F`, `P = ∫F`; `h(ϕ c) = c · h(ϕ 1)` | holds |
| §5.6 amenable | `ℤ` shift on `Fin 2`; trivial action on finite `X`; Chung p. 9 | `log 2`; `log(e^a + e^b)`; `max φ`; left Følner sets and `max_{s∈F} ρ(sx, sy)`, as in the README | holds; no locator (R07) |
| §6.1 small partitions | Sarig line 5564 (Prop 4.5, p. 112), line 5905 (Thm 4.7, p. 119); one-sided shift | Borel map, any partitions with diameter `→ 0`; `x 0` partition has diameter `1/2 < 3/4` | holds |
| §6.2 semicontinuity | `δ_{000…}` as the limit of Bernoulli `(1-1/k, 1/k)` | `H(1/k) → 0 = h(δ)` | holds; no locator (R07) |
| §6.3 `brinKatok` | one-sided shift, `ε = 2^(-m)`; isometry | `B_n` is the `(n+m)`-cylinder, `(n+m) log 2 / n → log 2 = h`; `0` | holds |
| §6.4 `measureEntropy_flow`, suspension | `t = 0, -1, 2`; two-halves base with roofs `1, 2` | `0 = 0 · h`; `h(T⁻¹) = h`; `2h`; `(a+b)/3` both ways | holds; "ergodic" unneeded (R03) |
| §7.1 `topologicalPressure_eq_iSup` | Chung line 66; Misiurewicz lines 125, 221 (pp. 150, 152); identity on `F`; `X = ∅` | Walters Thm 9.10 as cited; `max φ = max φ`; `⊥ = ⊥` | holds |
| §8.1 `isEquilibriumState_iff_toReal` | identity on `{0,1}`, `φ = (1,0)` | `P = 1`; only `δ₀` is an equilibrium state; real supremum `1`, attained by `δ₀` | holds |
| §8.2 structure | Chung lines 1302 (p. 21), 1468 (p. 23); full shift on `Fin k` with `φ(x 0)` | `P = log ∑ e^{φ_i}`; unique Bernoulli `e^{φ_i}/∑` | holds |
| §8.6 `exists_ruelleOperator_eigen` | full 2-shift with `φ(x 0)`; golden mean with `φ = 0` | `c = e^{φ_0} + e^{φ_1}`, `h = 1`, `log c` is §5.4's value; `c = 1.618`, Parry `μ[0] = 0.7236` | holds |
| `measurePreserving_inducedMap` | rotation by `1/3`, `A = [0, 1/3)` | return time `3`, induced map `id` preserves `3 · Leb\|_A` | holds |
| `existsUnique_naturalExtensionMeasure` | identity on two points; doubling map | constant histories, unique image law; `(0,0,…) ≠ (0,1/2,1/4,…)`, both over `0` | holds |
| `exists_small_completeSection` | irrational rotation, `A = [0, ε/2)`; rotation by `1/3` | saturation conull, `μ A = ε/2`; `μ{T³x = x} = 1` violates the hypothesis | holds |
| `relativeSelfJoining_measurePreserving` | `π` to a point; `π = id` | `μ ⊗ μ` invariant; diagonal measure invariant | holds |
| `MixingAlong.weakMixingSMul` | fair shift along `atTop`; `pure m₀` | product mixing implies product ergodic; `μ B ∈ {0,1}`, so `μ.prod μ` is 0–1 valued | holds |
| `weakMixing_iff_tendsto_cesaro` | swap | `\|corr - 1/4\| = 1/4` for all `n`, mean `1/4`; diagonal invariant | both sides false |
| `WeakMixing.ergodic_prodMap_of_ergodic` | fair shift × swap; swap × swap | ergodic; diagonal invariant, measure `1/2` (hypothesis fails) | consistent |
| `tendsto_cesaro_norm_moment_sq` | `δ₁ + δ₋₁`; Haar | mean of `4, 0, 4, …` is `2 = 1 + 1`; `1/N → 0 = 0` | holds |
| `weakMixing_iff_hasEigenvector_ae_const` | swap | `f = (1,-1)`, `Uf = -f`, nonconstant | both sides false |
| `weakMixing_iff_exists_atomless_spectralMeasure` | swap with `f = (1,-1)`; fair shift with `(-1)^{x0}` | `σ = δ_{-1}`, an atom; `σ = ` Haar, atomless | holds |
| `mixing_iff_exists_rajchman_spectralMeasure` | fair shift; irrational rotation with `e₁` | `σ̂(n) = 0`; `\|σ̂(n)\| = 1`, no limit `0` | holds |
| `koopman_linearIsometryEquiv_iff_eigenvalues_eq` | rotations by `α` and `-α`; by `α` and `2α` | equal groups, `V f = f(-x)` intertwines; `e^{2πiα} ∉ {e^{4πinα}}` | holds |
| `exists_tendsto_foelner_average` | `ℤ` intervals, trivial `U`; `U_n = e^{2πinα}` | average `= v = w`; average `→ 0 = P_fix v` | holds |
| `weakMixingVAdd_real_iff_tendsto_cesaro` | trivial flow on two points | integrand `1/4` for all `t`; diagonal invariant | both sides false |
| `weakMixingVAdd_real_iff_weakMixing` | unit-speed circle flow, `t = 1`, `t = √2` | identity and irrational rotation, neither weakly mixing; `e₁` has frequency `1` | consistent |
| `weakMixingVAdd_real_iff_exists_atomless_spectralMeasure` | unit-speed circle flow, `e₁` | `σ = δ_{-1}` | both sides false |
| `exists_conullFlow_realization` | `T t x = x + t` for `x ≠ 0`, `T t 0 = 0` | `Φ` is translation; `Φ t = T t` off `{0, -t}` | holds |
| Kolmogorov–Sinai generator theorems | one-sided fair shift with `x 0`; identity on two points | rate `log 2 = h`; point label rate `0 = h` | holds |
| `measureEntropy_naturalExtension` | one-sided to two-sided fair shift | `log 2 = log 2` | holds |
| `measureEntropy_bernoulliShift` | `(1/3,1/3,1/3)`; `δ_a`; `p_k = 2^(-k)` | `log 3`; `0`; `2 log 2` | holds |
| `measureEntropy_markovShift` | switching kernel; `!![1-p,p;p,1-p]` | `0`; `-(p log p + (1-p) log(1-p))` | holds |
| `measureEntropy_factor_add_relative` | `π = id`; `π` constant | kernel `δ_x`, relative `0`, `h = h + 0`; `𝒜 = ⊥`, relative `h`, `h = 0 + h` | holds |
| `actionPartitionEntropyRate_tendsto` | `ℤ` fair Bernoulli; trivial action | `#F log 2 / #F = log 2 = inf`; `log 2 / #F → 0 = inf` | holds |
| `measureEntropy_toralEndomorphism` | cat map; `!![2,0;0,1]`; `d = 0` | `0.9624`; `log 2`; `0` | holds |
| `coverEntropy_eq_iSup` | full 2-shift | `log 2`, attained by Bernoulli `(1/2,1/2)` | holds |
| `flowTopologicalPressure_eq_iSup` | unit-speed circle flow | left side `∫F`; right side, `volume` only: `0 + ∫F` | holds |
| `actionTopologicalPressure_eq_iSup` | trivial action on finite `X` | `max φ` both sides; comap of `maxFoelner` to `Finset` is `NeBot`, its members are finite | holds |
| `isMeasureOfMaximalEntropy_iff_toReal` | identity on a compact space | `h_top = 0 = h_ν` for all `ν`; both sides true | holds |
| `exists_isEquilibriumState` | identity on finite `F` | `h ≡ 0` is upper semicontinuous; `δ` at the maximizer of `φ` | holds |
| `existsUnique_isEquilibriumState` | two-sided full 2-shift with `φ(x 0)`; identity on two points | unique Bernoulli `e^a/(e^a+e^b)`; no specification, two states | holds |
| `existsUnique_isFlowEquilibriumState` (R01) | trivial flow on `{a,b}`, `F = 1_{a}`, `t = -n` | `Icc 0 (-n) = ∅`; conclusion `n ≤ K` for all `n` | hypothesis degenerate |
| SFT uniqueness (R02) | probe copy | 39 `sorry` warnings, 0 errors | statable |
| §8.4 item 1 (R06) | `A 1 j = false`, `A 0 j = true` | `sftTwoSided A = {000…}`, mixing; `A` not aperiodic | clause fails as written |
| §1.0 Check (R05) | swap, `B = {0}` | `μ(B ∩ T⁻¹B) = 0 ≠ μ B = 1/2` | Check's formula wrong |
| `HasBowenProperty` (R04) | `φ x = 1/(1 + min {k \| x k = 1})` | `S_n φ (0ⁿ1000…) - 0 = ∑_{j=2}^{n+1} 1/j → ∞` | discriminating Check |

- Source locators checked against the cached texts: 24 (Sarig2023 Definitions 1.6, 1.20, 4.3, 4.5–4.7, Propositions 1.8, 4.3, 4.5, Theorems 4.2, 4.6–4.9, Corollary 4.1, Problems 4.3–4.13; Chung2013 pp. 2, 8–9, 21, 23–24; Misiurewicz1976 Parts I–II); every cited printed page matches.
- Library: 42 cited declarations grepped at the pins, all present; opened Mathlib `FoelnerFilter.lean:73–96, 216`, `PiNat.lean:404–414`, `Ergodic/Function.lean:71` and Tau Ceti `MarkovChain.lean:161`, `PathLaw/Basic.lean:216`, `Bochner/LocallyCompactGroup.lean:95`.
- Cross-roadmap citations resolved: 7 roadmaps (ProbabilisticAndMetricNumberTheoryPartII §3.3 at edc1aee; GeometryOfNumbersAndQuadraticArithmetic §4.2 at 3b084ef, 15 names; ArithmeticDynamics §§2.6–2.7 at ae79f44; ProbabilisticAndMetricNumberTheory §§4.1–4.3, 4.6, 5.1a at d311ebe; MathematicalBilliards §§8.2, 12.1–12.5, 12.4.1 in its accepted board design; MarkovChainsAndRenewal, AmenableGroups on main).
- Gate: the worker's gate passed; my rerun's only failure is `depcheck: NOT IN ORDER: ClassicalErgodicTheory` (default order file, not a finding); against the candidate order `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`, no UPWARD or CYCLE line; nothing changes outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean` gives 37 warnings, all `declaration uses sorry`, no error; the 24 binder leads are definitions whose types do not need the binder, and the theorems keep `CompactSpace`, `BorelSpace` and `StandardBorelSpace`.
- Padding: one-tactic probe (`first | rfl | simp | infer_instance | tauto | trivial | positivity`) closes 0 of 37 theorems.
- Probe copy with the R01 and R02 repairs: 39 `sorry` warnings, no error.
- Overlap check: read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, PointProcesses, Equidistribution, ProbabilisticAndMetricNumberTheoryPartII, Exchangeability, OptimalTransport, StochasticCalculus (third list empty); Birkhoff, strong mixing, finite-label entropy: ProbabilisticAndMetricNumberTheory; SMB, ergodic decomposition, Goodwyn, null-boundary partitions: ArithmeticDynamics; cone contraction: ProbabilisticAndMetricNumberTheoryPartII §3.3 (its §3.7 RPF is another operator); Koopman and invariant σ-algebra of maps: Exchangeability via Tau Ceti — all consumed here; point-process mixing: PointProcesses Layer 7, a specialization of §1.3; the rest share nothing.

## Not verifiable

- These sources are uncertified and were not read: Walters1982, CornfeldFominSinai1982, BrinKatok1983, BowenRuelle1975, MoulinOllagnier1985, WardZhang1992, OrnsteinWeiss1987, EinsiedlerWard2011, KechrisMiller2004 and Lindenstrauss2001. Walters Theorems 9.10 and 9.16 and Moulin Ollagnier Theorem 5.2.7 are checked only through Chung2013's citations.
- §6.3 cites "BrinKatok1983 … pp. 30–38" and §8.2 item 5 cites "Walters1982, Chapter 9". Their theorem numbers cannot be checked against a legal text (previous R05, partly repaired).
- §5.5 item 1 cites Bowen–Ruelle 1975 with no section, and §8.6 cites Bowen LNM 470, Chapter 1, and Parry–Pollicott, Chapter 2. None of these is in the manifest, and none was read.
- Abramov 1959, Glasner 2003, Downarowicz 2011, Bowen 1974, Bowen–Walters 1972, Franco 1977, Misiurewicz 1973 and Mackey 1962 are not in the manifest, so nothing was fetched.
- No cached legal text states the toral-entropy formula of §6.4 or the flow results of §§3.4–3.5. These were checked by computation only (table).
- MathematicalBilliards exists only as an accepted design on the board, so its section numbers may change at the package stage.

## Source issues

- **Misprint** in Sarig2023 at Theorem 4.8, proof, p. 121: the source says the elements of the cover have diameter less than δ, after assuming diameters less than ε; it should be ε; affects nothing.
- **Misprint** in Sarig2023 at Theorem 4.8, proof, pp. 121–122: the source says a maximal (n, ε/2)-separated set has cardinality s_n(ε) and concludes N ≤ s_n(ε); it should be s_n(ε/2), giving h_top(T, U) ≤ s(ε/2); affects nothing.
