# Review of ClassicalErgodicTheory (pull request #2231 at e4df427)

**Verdict:** needs changes

## R01 (P3) — Layer 2, §2.1, §3.5 and §8.1 omit suppliers that their text uses

**Location:** `TauCetiRoadmap/ClassicalErgodicTheory/README.md`:
- line 316, Layer 2 row, "Layers 0–1; Herglotz, Bochner; AmenableGroups";
- lines 885–886, §2.1 *Needs:* (Tau Ceti and Mathlib only);
- lines 1011–1013, Layer 2 Dependencies;
- line 1186, §3.5 *Needs:* "§§0.1, 3.1; Mathlib …";
- line 2097, §8.1 "*Needs:* Layer 7."

**Claim:** §2.1 states a comparison with MathematicalBilliards' spectral measure, and §2.5 a comparison with its §12.4. §3.5 item 1 claims that MathematicalBilliards §8.2's flow and §3.3's flow are conull flows. §8.1 item 1 uses Goodwyn's inequality from ArithmeticDynamics §2.7. None of these suppliers appears in the dependency line that should list it.

**Witness:** Line 866 reads "MathematicalBilliards §§12.4.1 and 12.5 characterize the spectral measure … prove that it is the image of `spectralMeasureReal U f` under `ξ ↦ -2π ξ`". Line 2072 reads "(Goodwyn's inequality, ArithmeticDynamics §2.7)".

**Repair:**
- Line 316: "Layers 0–1; Herglotz, Bochner; AmenableGroups; MathematicalBilliards §§12.4–12.5".
- §2.1 *Needs:*: append "; MathematicalBilliards §§12.4.1 and 12.5 (the spectral measure of the comparison)".
- Layer 2 Dependencies: append "; MathematicalBilliards §§12.4, 12.4.1 and 12.5 (comparisons on `ℝ` in §§2.1 and 2.5)".
- §3.5 *Needs:*: "§§0.1, 3.1, 3.3; MathematicalBilliards §8.2 (the examples of item 1); Mathlib …".
- Line 317 and the Layer 3 Dependencies (line 1232): "MathematicalBilliards §§8.2, 12.1–12.5".
- Line 2097: "*Needs:* Layer 7; ArithmeticDynamics §2.7 (Goodwyn's inequality, item 1)."

## R02 (P3) — Sampled targets carry no locator or only a chapter (previous R07 partly repaired)

**Location:** `README.md` §0.2 (lines 383–394), §1.3 (741–755), §2.4 (945–960) and §§3.2, 5.3: no locator. §8.6, lines 2370–2371: "(Bowen, *Equilibrium States …*, Chapter 1; Parry–Pollicott, Chapter 2.)". §3.3 items 1–4 (1099–1105): no locator. §6.2, lines 1853 and 1859: "Walters1982, Chapter 8".

**Claim:** These targets cite no theorem, although legal texts state the first four exactly. §3.3 and §6.2 are the unrepaired part of the previous R07.

**Witness:**
- Creutz line 4163 (Theorem 11.22, p. 107), line 4529 (Definition 13.9, p. 118), line 4479 (Proposition 13.2.1, p. 117).
- Parry–Pollicott, open on Numdam, line 458 (Theorem 2.2, p. 21) and line 890 (Theorem 3.5, pp. 42–43).

**Repair:**
- §0.2, after "is continuous for every `f`": "(Creutz, Theorem 11.22, p. 107, for `p = 2` on a standard Borel probability space)".
- §1.3, at `MixingVAdd`: "(Creutz, Definition 13.9, p. 118, for locally compact second countable `G`)".
- §2.4, after the Koopman equivalence: "(Creutz, Proposition 13.2.1, p. 117: no finite-dimensional invariant subspace of `L²₀` iff no nonconstant precompact function; Theorem 13.8, p. 118, for the decomposition)".
- §8.6, replace the chapter citation with Parry–Pollicott locators:
  - item 2: Proposition 2.1, p. 19, normalised case;
  - item 3: Theorem 2.2, p. 21, and Theorem 3.5, pp. 42–43, for `log λ = P`;
  - item 4: Proposition 3.2 and Corollary 3.2.1, p. 37;
  - item 5: Proposition 1.2, p. 14;
  - item 6: Proposition 4.10, p. 60.

  Record Parry–Pollicott (Astérisque 187–188, Numdam) in `sources.toml`.
- §§3.2–3.3 (items 1–4): cite theorem numbers in CornfeldFominSinai1982. §§5.3 and 6.2: cite theorem numbers in Walters1982. Both texts are recorded as uncertified.

## R03 (P3) — References omit two works the text cites by key

**Location:** `README.md` line 1957, "(Misiurewicz1976, §3, Part I, p. 150)"; lines 1131 and 1615, "(Hochman2012, Proposition 3.4.2, p. 22 …)" and "(Hochman2012, Proposition 4.5.2, p. 41 …)"; References, lines 2416–2463.

**Claim:** A reader cannot identify `Misiurewicz1976` or `Hochman2012`. References lists only Misiurewicz's 1973 paper and no Hochman entry.

**Witness:** Misiurewicz1976 line 9 gives "Astérisque, tome 40 (1976), p. 147-157". Hochman2012 line 2 gives the author's page. Both cited locators match their texts.

**Repair:** Add these two bullets:
- "M. Misiurewicz, [*A short proof of the variational principle for a `ℤ₊ᴺ` action on a compact space*](http://www.numdam.org/item?id=AST_1976__40__147_0), Astérisque 40 (1976), 147–157 (§7.1)."
- "M. Hochman, [*Notes on ergodic theory*](https://math.huji.ac.il/~mhochman/courses/ergodic-theory-2012/notes.final.pdf) (2012), Propositions 3.4.2 and 4.5.2 (§§3.4, 5.1)."

## R04 (P3) — §3.6's four definitions share three Checks, and none pins the correlation's conjugation or centring

**Location:** `README.md` lines 1191–1219. The section defines `flowCorrelation`, `mapCorrelation`, `IsExponentiallyMixing` and `HasCorrelationBound`, followed by three Checks.

**Claim:** One Check gives only a modulus. No Check would separate `∫ conj (f (t +ᵥ x)) * g x` from the stated form, or an uncentred correlation from the centred one.

**Witness:** For the unit-speed flow and `e₁ = fourier 1`, the stated correlation at `t = 1/4` is `i`, and the other conjugation gives `-i`. The README's Check says only "modulus 1".

**Repair:** Add these Checks:
- "For the unit-speed flow on `UnitAddCircle` and `e₁ = fourier 1`, `flowCorrelation volume e₁ e₁ (1/4) = exp (2π i / 4) = i`; conjugating `f` instead of `g` would give `-i`."
- "For `f = g = 1`, `flowCorrelation μ 1 1 t = 1 - 1 = 0` for every `t`. Without the subtracted product of means it would be `1`, so no system would be mixing or satisfy `HasCorrelationBound`."

## R05 (P3) — A sentence in §2.1 has no full stop

**Location:** `README.md` lines 861–863, "positive definiteness and the Bochner representation are compatibility lemmas Prove uniqueness, total mass".

**Claim:** Two sentences have run together.

**Witness:** Line 862 ends "lemmas" and line 863 begins "Prove".

**Repair:** "… are compatibility lemmas. Prove uniqueness, total mass, …".

## Verified sound

| Statement | Instances | Values computed | Result |
| --- | --- | --- | --- |
| Prev R01: `HasFlowBowenProperty` | `Suggested.lean:810` "0 ≤ t →"; README 2286; Check 2340 | trivial flow on `{a, b}`, `F = 1_{a}`: `K = 0` for `t ≥ 0`; `t = -n` excluded | repaired |
| Prev R02: SFT uniqueness | `Suggested.lean:715, 848, 862`; docstring lines 20–24 | `IsEquilibriumState` over `[UniformSpace X]`; both theorems elaborate; docstring names only suspension flows | repaired |
| Prev R03: suspension entropy | README 1910, "ergodic or not" | halves with roofs 1, 2 and entropies a, b: `(a+b)/3` on both sides | repaired |
| Prev R04: §§8.4–8.5 Checks | lines 2253–2266, 2330–2342 | recomputed in the rows below | repaired |
| Prev R05: §1.0 Check | lines 655–658 | `μ((m₀•)⁻¹B) = μ((m₀•)⁻¹B)·μB`, so `μB = μB²`; swap, `B = {0}`: `0 ≠ 1/4` | repaired |
| Prev R06: §8.4 item 1 | lines 2221–2223; Check 2267 | `M = [[1,1],[0,0]]`, `Mⁿ = M`; deleting symbol 1 leaves `(1)` | repaired |
| Prev R07: locators | §§0.3, 3.3, 4.1, 5.2, 5.6 added | §3.3 items 1–4 still none; §6.2 still "Chapter 8" | partly (R02) |
| §0.2 Koopman continuity | `ℝ` on circle, `f = 1_[0,1/2)`; Creutz line 4163 | `‖π(t)f − f‖₂² = 2\|t\|`, sup norm `1`; Thm 11.22 p. 107 is the standard Borel `L²` case | holds; no locator (R02) |
| §1.3 group mixing | swap as `zAddAction`; Creutz line 4529 | correlations `1/2, 0, 1/2, …`, no limit; Def 13.9 p. 118 uses unbounded sequences | holds; no locator (R02) |
| §2.4 representations | left regular rep of ℤ; Creutz line 4479 | `⟪δ₀, U_n δ₀⟫ = 0` for `n ≠ 0`; Prop 13.2.1 p. 117 | holds; no locator (R02) |
| §2.5 Følner MET | Creutz lines 4238, 4497 | Thm 12.2 p. 110: ergodic, `L²₀`, sum over `F_n⁻¹`, left Følner; Thm 13.7 p. 117: squared correlations | holds |
| §3.2 flows | trivial flow on two points; circle flow | integrand `1/4`, time maps are identities; `e₁` has frequency 1, time-`√2` map an irrational rotation | holds; no legal text |
| §3.3 suspension | Sarig line 1563 (Def 1.20, p. 30); swap, `r ≡ 1` | semiflow with `inf r > 0`, as the README says; `g = (1,−1)`, `g∘T = e^{2πi·½·1}g` | holds; items 1–4 (R02) |
| §4.4 Abramov | Sarig lines 5774–5778 (Thm 4.6, p. 116); fair shift, `A = {x0 = 0}` | spanning set `⋃_{n≥0}T⁻ⁿA`, Lebesgue space; `2 log 2 = log 2/(1/2)` | holds |
| §4.5 K-systems | Sarig lines 4812, 4817 (p. 96); two-sided fair shift | three conditions match the comap form; `T⁻¹σ(x_n : n≥0) = σ(x_n : n≥1)`; the past fails | holds |
| §5.3 expansive maps | one-sided shift; cat map | `d(σᵏx, σᵏy) = 1 > 3/4`; eigenvalues `2.618, 0.382`; `h = h(ε)` for `ε ≤ δ` via `T⁻ᴺ` | holds; no locator (R02) |
| §6.1 small partitions | Sarig line 5564 (Prop 4.5, p. 112), 5905 (Thm 4.7, p. 119) | Borel `T`, diameters → 0, as stated; `x 0` partition diameter `1/2 < 3/4` | holds |
| §7.2 entropy VP | Sarig line 6039 (Thm 4.9, p. 122); full shift on `k` symbols | case `φ = 0` of §7.1; `log k` attained by uniform Bernoulli | holds |
| §8.2 structure | Chung lines 1302, 1467 (pp. 21, 23); `X_k` | Walters 9.16 cited for ℤ; `λ₁ = 1`, `λ₂ = 1.618`, `λ_k ↑ 2`; no measure attains `log 2` | holds |
| §8.3 amenable | Chung line 60 (Thm 1.1, p. 2), line 1304 (Thm 5.3, p. 21) | sofic pressure = amenable pressure; `P = log ∑ e^{a_j}` for `f(x) = a_{x_e}` | holds |
| §8.5 flows | full 2-shift, roofs `(1, 2)`; two-point trivial flow | `e^{−c}+e^{−2c} = 1`: `c = 0.4812 = max H(p)/∫r` at `p = 0.618`; expansive, no specification | holds |
| §8.6 RPF | Parry–Pollicott line 458 (Thm 2.2, p. 21), line 890 (Thm 3.5, p. 42) | aperiodic `A`, real `F_θ`, simple `β`, `β⁻ⁿLⁿv → h∫v dμ`, `P = log β` | holds; chapter only (R02) |
| `measurePreserving_inducedMap` | rotation by 1/3, `A = [0, 1/3)` | return time 3; induced map `id` preserves `3·Leb\|_A` | holds |
| `existsUnique_naturalExtensionMeasure` | identity on two points; doubling map | constant histories, one lift; `(0,0,…) ≠ (0,1/2,1/4,…)`, both over `0` | holds |
| `exists_small_completeSection` | irrational rotation, `A = [0, ε/2)`; rotation by 1/3 | saturation conull, `μA = ε/2`; `μ{T³x = x} = 1` violates the hypothesis | holds |
| `relativeSelfJoining_measurePreserving` | `π` to a point; `π = id` | `μ ⊗ μ` and the diagonal measure, both invariant | holds |
| `MixingAlong.weakMixingSMul` | `l = pure m₀` | `μB ∈ {0,1}` makes `μ ⊗ μ` 0–1 valued, hence ergodic | holds |
| `weakMixing_iff_tendsto_cesaro` | swap, `A = B = {0}` | `\|corr − 1/4\| = 1/4` for every `n`, mean `1/4`; diagonal invariant | both false |
| `WeakMixing.ergodic_prodMap_of_ergodic` | fair shift × swap; swap × swap | ergodic; diagonal of measure `1/2` (hypothesis fails) | consistent |
| `tendsto_cesaro_norm_moment_sq` | `δ₁ + δ₋₁`; Haar | `4, 0, 4, …`, mean `2 = 1 + 1`; `1/N → 0` | holds |
| `weakMixing_iff_hasEigenvector_ae_const` | swap | `f = (1,−1)`, `Uf = −f`, nonconstant | both false |
| `weakMixing_iff_exists_atomless_spectralMeasure` | swap with `(1,−1)`; fair shift with `(−1)^{x0}` | `δ₋₁` (an atom); Haar (atomless) | holds |
| `mixing_iff_exists_rajchman_spectralMeasure` | irrational rotation with `e₁`; fair shift | `\|σ̂(n)\| = 1`; `σ̂(n) = 0` for `n ≥ 1` | holds |
| `koopman_linearIsometryEquiv_iff_eigenvalues_eq` | rotations by `α`, `−α`; by `α`, `2α` | same groups, `f ↦ f(−x)` intertwines; `e^{2πiα} ∉ {e^{4πinα}}` | holds |
| `exists_tendsto_foelner_average` | ℤ, `U_n = e^{2πinα}` on ℂ, `[0, N)` | averages `→ 0 = P_fix v`; trivial `U`: average `v` | holds |
| `weakMixingVAdd_real_iff_tendsto_cesaro` | trivial flow on two points | integrand `1/4` for all `t`; diagonal invariant | both false |
| `weakMixingVAdd_real_iff_weakMixing` | circle flow, `t = 1`, `t = √2` | identity and irrational rotation, neither weakly mixing; flow has `e₁` | consistent |
| `weakMixingVAdd_real_iff_exists_atomless_spectralMeasure` | circle flow, `e₁` | `U_t e₁ = e^{−2πit}e₁`, `σ = δ₋₁` | both false |
| `exists_conullFlow_realization` | `T t x = x + t` for `x ≠ 0`, `T t 0 = 0` on ℝ | `Φ` = translation; `Φ t = T t` off `{0, −t}` | holds |
| `measureEntropy_eq_partitionEntropyRate_of_generator` | one-sided fair shift, `x 0` | `H(ξⁿ) = n log 2`, rate `log 2 = h` | holds |
| `measureEntropy_eq_partitionEntropyRate_of_twoSidedGenerator` | two-sided fair shift | rate `log 2 = h`; a one-sided generator would force `h = 0` | holds |
| `measureEntropy_naturalExtension` | one- to two-sided fair shift | `log 2 = log 2` | holds |
| `measureEntropy_bernoulliShift` | `(1/3,1/3,1/3)`; `δ_a`; `p_k = 2^{−k}` | `log 3`; `0`; `2 log 2` | holds |
| `measureEntropy_markovShift` | switching kernel; `[[1−p,p],[p,1−p]]` | `0`; `−(p log p + (1−p) log(1−p))` | holds |
| `measureEntropy_factor_add_relative` | `π = id`; `π` constant | `h = h + 0`; `h = 0 + h` | holds |
| `actionPartitionEntropyRate_tendsto` | trivial action, fair bit; ℤ Bernoulli | `log 2/#F → 0 = inf`; `log 2` | holds |
| `brinKatok` | one-sided fair shift, `ε = 2^{−m}`; isometry | `B_n` is an `(n+m)`-cylinder, `(n+m) log 2/n → log 2`; `0` | holds |
| `measureEntropy_flow` | `t = 0, −1, 2` | `0 = 0·h`, also for `h = ⊤`; `h(T⁻¹) = h`; `2h` | holds |
| `measureEntropy_toralEndomorphism` | cat map; `!![2,0;0,1]`; `d = 0` | `log 2.618 = 0.9624`; `log 2`; empty root multiset, `0` | holds |
| `topologicalPressure_eq_iSup` | identity on finite `F`; `X = ∅` | `max φ` on both sides; `⊥ = ⊥` | holds |
| `coverEntropy_eq_iSup` | full 2-shift | `log 2`, attained by uniform Bernoulli | holds |
| `flowTopologicalPressure_eq_iSup` | circle flow | `∫F` on both sides; only `volume` is invariant | holds |
| `actionTopologicalPressure_eq_iSup` | trivial action on finite `X` | `max φ` on both sides | holds |
| `isEquilibriumState_iff_toReal` | identity on `{0,1}`, `φ = (1,0)` | `P = 1`; only `δ₀`; real supremum `1` | holds |
| `isMeasureOfMaximalEntropy_iff_toReal` | identity on compact `X` | `h_top = 0 = h_ν` for every `ν` | holds |
| `exists_isEquilibriumState` | identity on finite `F` | `h ≡ 0` upper semicontinuous; `δ` at a maximizer of `φ` | holds |
| `existsUnique_isEquilibriumState` | two-sided full 2-shift, `φ(x0) ∈ {a, b}`; identity on two points | Bernoulli `e^a/(e^a+e^b)`; no specification, two states | holds |
| `existsUnique_isFlowEquilibriumState` | trivial flow on a point; on two points | `δ_p` with `P = F(p)`; no specification, every `ν` an equilibrium state of `0` | holds |
| `existsUnique_isEquilibriumState_sftTwoSided` | `A = !![0,1;1,0]`; full shift | period-2 orbit, unique `(δ_{0101…}+δ_{1010…})/2`; Bernoulli | holds |
| `existsUnique_isEquilibriumState_sftOneSided` | golden mean, `φ = 0` | Parry `μ[0] = 0.7236`, entropy `log 1.618` | holds |
| `exists_ruelleOperator_eigen` | full 2-shift with `φ(x0)`; golden mean with `φ = 0` | `c = e^{φ₀}+e^{φ₁}`, `h = 1`; `λ² = λ + 1`, `h = (1.618, 1)` | holds |
| §2.1 conversion (R01) | circle flow, `e₁` | ours `δ₋₁`; its image under `ξ ↦ −2πξ` is `δ_{2π}`, the value in MathematicalBilliards §12.5 | correct; *Needs:* omits it |
| §3.6 correlations (R04) | circle flow, `e₁`, `t = 1/4`; `f = g = 1` | `i` (`−i` with conjugation on `f`); centred `0`, uncentred `1` | Checks missing |
| §8.4 Bowen-property Check | `φ = 1/(1 + min{k : x_k = 1})`, single 1 at `n+m−1` | `d ≤ 2^{−m}` for `k < n`; `S_n φ y = ∑_{j=m+1}^{n+m} 1/j → ∞` | correct |
| §8.4 Gibbs Check | `2^{−m−1} < ε ≤ 2^{−m}` | `B_n` fixes `−m … n−1+m`; ratio `2^{−2m}`, `K = 4^m`; `p`-weights in `[(min p)^{2m}, 1]` | correct |
| §8.4 specification Check | `M = 2m − 1` | windows `[a_i−m+1, b_i+m−1]` are disjoint iff the gap is `≥ 2m−1`; span `b_k − a_1 + M ≤ p` | correct |
| §8.5 flow Checks | circle flow, `p = n + ½`, `ε < ½`; continuous `F` | no integer in `[p−ε, p+ε]`; integral difference `≤ 2‖F‖_∞` | correct |
| References (R03) | §§3.4, 5.1, 7.1 | Hochman Props 3.4.2 (p. 22) and 4.5.2 (p. 41); Misiurewicz Parts I (p. 150) and II (p. 152) match | not listed |

- Source locators checked against cached texts: 52, all with matching printed pages:
  - Sarig2023, 30: Defs 1.6, 1.20, 3.8, 4.4; Props 1.7, 1.8, 3.3, 3.5, 4.3, 4.5–4.8; Lemma 1.2; Thms 1.6, 1.7, 3.2, 4.4, 4.6–4.9; Cor 4.1; Problems 4.3–4.6, 4.8, 4.12, 4.13.
  - Creutz, 8; Chung2013, 4; Misiurewicz1976, 2; Hochman2012, 2.
  - Parry–Pollicott, 6, read on Numdam without a manifest edit.
- Library: all 57 cited declarations are present at the pins. Opened `Mathlib/Dynamics/Ergodic/Function.lean:71`, `Mathlib/Analysis/Normed/Algebra/GelfandFormula.lean:126` and `TauCeti/Analysis/Bochner/LocallyCompactGroup.lean:96`. No pinned declaration states weak mixing, pressure, equilibrium states, measure entropy, natural extensions, the Rokhlin lemma or a Ruelle operator.
- Cross-roadmap citations resolved in 7 roadmaps:
  - ProbabilisticAndMetricNumberTheory at d311ebe: §§4.1–4.3, 4.6, 5.1a, 5 names.
  - ProbabilisticAndMetricNumberTheoryPartII at edc1aee: §3.3, `birkhoff_contraction`.
  - GeometryOfNumbersAndQuadraticArithmetic at #851: §4.2, 15 names.
  - ArithmeticDynamics at ae79f44: §§2.6–2.7.
  - MathematicalBilliards (board design; package keeps §§8.2, 12.1–12.6).
  - MarkovChainsAndRenewal Layers 0–3 and AmenableGroups Layer 5, on main.
- Gate: the worker's gate passed. My rerun's only failure is `depcheck: NOT IN ORDER: ClassicalErgodicTheory` (default order file). Against the candidate order: `depcheck: 206 roadmaps, 1901 edges, 0 problem(s)`, no UPWARD or CYCLE line. No change outside the folder.
- Elaboration: `lake env lean` gives 39 warnings, all `declaration uses sorry`, and no error. `#check @name` on all 91 declarations: theorems keep `CompactSpace`, `BorelSpace` and `StandardBorelSpace`; definitions drop only binders their types do not use.
- Padding: the one-tactic probe (`first | rfl | simp | infer_instance | tauto | trivial | positivity | norm_num | aesop`) closes 0 of 39 theorems. Every Summary headline is stated except uniqueness on suspension flows, which the docstring names as not statable (no topological suspension space at the pins). The description matches the head.
- Overlap check: read ProbabilisticAndMetricNumberTheory, ArithmeticDynamics, PointProcesses, Equidistribution, ProbabilisticAndMetricNumberTheoryPartII, Exchangeability, OptimalTransport and StochasticCalculus (the third list is empty). Shared objects and their owners:
  - Birkhoff, strong mixing, finite-label entropy: ProbabilisticAndMetricNumberTheory.
  - SMB, ergodic decomposition, Goodwyn, null-boundary partitions: ArithmeticDynamics.
  - Cone contraction: ProbabilisticAndMetricNumberTheoryPartII.
  - Koopman operators and invariant σ-algebras: Exchangeability, via Tau Ceti.

  All of these are consumed here. Point-process mixing (PointProcesses Layer 7) is a specialization and is not cited. The other three roadmaps share nothing.

## Not verifiable

- Uncertified and not read: Walters1982, CornfeldFominSinai1982, BowenRuelle1975, BrinKatok1983, MoulinOllagnier1985, WardZhang1992, OrnsteinWeiss1987, KechrisMiller2004, EinsiedlerWard2011, Lindenstrauss2001. Walters Theorems 9.10 and 9.16 and Moulin Ollagnier Theorem 5.2.7 and Corollary 5.2.6 were checked only through Chung2013's citations.
- Franco 1977 (§8.5), Bowen–Walters 1972 (§8.5), Bowen 1974 (§8.4) and Bowen LNM 470 (§8.6) are not in the manifest. The sources service found only Elsevier, Springer or JSTOR paywalls.
- No cached legal text states §3.2, §3.3 items 1–4 or §5.3; these were checked by computation only.
- Abramov 1959, Glasner 2003, Downarowicz 2011, Mackey 1962 and Misiurewicz 1973 are not in the manifest and were not fetched.
- MathematicalBilliards' package README was not readable here. Its section numbers were checked in the accepted design and in its package review reports.

## Source issues

- **Misprint** in Sarig2023 at Theorem 4.8, proof, p. 121: the source says the cover's elements have diameter less than δ, right after taking diameters less than ε; it should be ε; affects nothing.
- **Misprint** in Sarig2023 at Theorem 4.8, proof, pp. 121–122: the source takes a maximal (n, ε/2)-separated set but calls its size s_n(ε) and speaks of (n, ε)-separation; it should be s_n(ε/2) and (n, ε/2) throughout; affects nothing.
- **Misprint** in Creutz at Theorem 12.2, p. 110: the source calls the space an ergodic measure-preserving G-space while the acting group is Γ; it should be a Γ-space; affects nothing.
