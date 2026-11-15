<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6902544403 -->
Review (claude) of 5eb95ff

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.2, full system: the background entropy is not introduced

   **Location.** `packages/CompressibleEulerEquations/design/README.md` lines 1728–1731, §7.2: "The
   same holds for the full system with `s̄ − s₀ ∈ Hᵏ_Λ` and `(ρ̄, s̄)(E)` contained in a compact
   subset `L` of `𝒪`"; plan target 7.2, same sentence.

   **Claim.** The full-system statement runs through §7.1 at the background `Ū = (ρ₀, v₀, s₀)`,
   which §7.1 needs in `G`. The barotropic statement says `(ρ₀, v₀) ∈ I × E`; the full one never
   introduces `s₀`.

   **Witness.** `n = 1`, `Λ = 2πℤ`, `𝒪 = (0, ∞) × (0, 1)`, `ρ̄ ≡ 1`, `s̄ ≡ 1/2`, `s₀ = 5`:
   `s̄ − s₀ = −9/2 ∈ Hᵏ_Λ` (norm squared `81π/2`), yet `(1, 5) ∉ 𝒪`, so `Ū ∉ G` and §7.1 does not
   apply. The conclusion itself stays true (take `s₀ = 1/2`), hence P3.

   **Exact repair.** Write "The same holds for the full system with a background `(ρ₀, v₀, s₀)`,
   `(ρ₀, s₀) ∈ 𝒪`, data with `s̄ − s₀ ∈ Hᵏ_Λ` as well, and `(ρ̄, s̄)(E)` contained in …"; add
   `(ρ₀, s₀) ∈ 𝒪` (and `(ρ₀, v₀) ∈ I × E`, now only in the statement) to the `hypotheses` of plan
   target 7.2. Tested on the witness: `s₀ = 5` is excluded; `s₀ = 1/2` gives `Ū = (1, v₀, 1/2) ∈ G`
   with `F(Ū) = 0`. For `Λ` not of full rank nothing changes: `s̄ − s₀ → 0` at infinity forces
   `(ρ₀, s₀) ∈ L`.

2. **F02** (P3) `*Needs:*` lines of §5.3 and §7.1 omit §2.1

   **Location.** README line 1439 (§5.3: "§§4.2–4.3, §4.4 …, §5.1") and line 1715 (§7.1:
   "§§4.2–4.4, §§5.1–5.4, §6.2"); plan targets 5.3 and 7.1, `prerequisites`.

   **Claim.** Each `*Needs:*` line lists what the statement and its route need, item by item.

   **Witness.** Both statements open "Fix/let a quasilinear symmetric hyperbolic system", the
   carrier of §2.1 (plan target 2.1), and §7.1's uniqueness clause uses the cone map `κ` of §2.1;
   the sibling lines of §6.1, §6.2 and §7.3 do list §2.1 or Layer 2.

   **Exact repair.** Add "§2.1 (the system; for §7.1 also the dominating cone map `κ`)" to both
   lines, and `target:2.1` to the `prerequisites` of plan targets 5.3 and 7.1. The layer-level
   `### Dependencies` lines already name Layer 2 and need no change.

3. **F03** (P3) §1.3, constant-entropy reduction: "interval" should be "open interval"

   **Location.** README lines 505–507, §1.3: "`(ρ, v)` is a barotropic solution for `ρ ↦ P(ρ, s₀)`
   on each interval `J` with `J × {s₀} ⊆ 𝒪` containing `ρ(D)`".

   **Claim.** A barotropic equation of state is on an open interval (§1.1), and plan target 1.3.1
   and the API bullet of §1.1 both say "open interval `J`".

   **Witness.** `𝒪 = (0, ∞) × ℝ`, `J = [1, 2]`: `J × {s₀} ⊆ 𝒪`, but `(J, P(·, s₀))` is not a
   barotropic equation of state of §1.1, so "barotropic solution on `J`" has no meaning.

   **Exact repair.** Insert "open": "on each open interval `J` with `J × {s₀} ⊆ 𝒪` containing
   `ρ(D)`". Tested: `[1, 2]` is excluded and `(1/2, 3)` qualifies.

The round-15 finding is repaired and the repair is sound. This round found no false, vacuous or
overclaimed statement and no supplier, source or ownership defect. Three findings remain, all P3
and none blocking, each with a written repair: R01 to R03 below. A repair, whatever its priority,
asks for changes, so the verdict is needs changes and not an acceptance. No supplier gap is
declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`).
This review changed no file of the design and did not touch the manifest. Elaboration: not
available (this lane does not elaborate); the design stage has no `Suggested.lean`, so the
one-tactic probe and the `#check` comparison had nothing to run on. No maintainer note was left
for this roadmap. No text read contained instructions.

## Verified sound

### The round-15 finding, checked first

| Round-15 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P2) §3.3 slabs: the start-point description of `D⁺_D(S)` needs `S ⊆ Σ_{t₀}` | Lines 879–889: "for `S ⊆ Σ_{t₀}`, `D⁺_D(S)` is the set of `p ∈ D` all of whose past causal curves in `D` on `[t₀, t_p]` start in `S`", with the route sentence "a curve on `[t₀, t_p]` has no proper extension … meets `S ⊆ Σ_{t₀}` iff its starting point lies in `S`"; new Check, lines 911–916; plan 3.3.3 has the clause, the hypothesis and the test `point_datum_off_slice` | **Repaired** |

Recomputed on the witness (field `(1, 0)`, `D = [0, 2) × ℝ`, `S = {(1, 0)}`): `S ⊄ Σ₀`, so the
description is no longer asserted. The new Check's value `D⁺_D(S) = S`: for `t_p < 1` no curve
reaches `t = 1`; for `t_p ≥ 1`, `x_p ≠ 0` the curve `x ≡ x_p` has value `x_p ≠ 0` at `t = 1`; for
`t_p > 1`, `x_p = 0` the curve `x(t) = (t − t_p)/2` (slope `1/2 ≤ 1`) has value `(1 − t_p)/2 ≠ 0`
at `t = 1`; and `(1, 0) ∈ S ∩ D ⊆ D⁺_D(S)` (LorentzianGeometry §12.6). Start points all have
`t = 0`, so the start-point set is `∅ ≠ S`. The repaired pattern (a description of `D⁺` valid only
for data in the initial slice) was searched in §3.3, §6.2, §7.3 and §8.1–§8.4: compact pasts,
openness and idempotence all carry `S ⊆ Σ_{t₀}`; every consumer uses `Σ_{t₀}` or `{t₀} × S`. The
diff between the two heads touches §3.3 (slab bullet, one Check, the Examples sentence) and plan
target 3.3.3 only.

### Adversarial table

Recomputed by hand this round; coordinates `(t, x)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.2 barotropic system | expanding flow `n = 1`, `t = 1`; boost `w = 1`; `(1 + t, 0)` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; `−x/4 + (x/2)(1/2) = 0`; `∂_tṽ = −(1 + y)/(1 + t)²`, `ṽ∂_yṽ = (1 + y)/(1 + t)²`, sum `0`; wrong rule: `−(1 + y)/(1 + t)² + (y − t)/(1 + t)² = −1/(1 + t)`, `−1/2` at `t = 1`; `1 ≠ 0` | sound |
| §1.3 full system | entropy wave; wrong momentum; `(1, 0, t)`; reduction on `J = [1, 2]` | `P = e^x e^{−x} = 1`; `e^{x/2}·2e^{x/2}·(−e^{−x/2}/2) = −e^{x/2}`; `Bs = 1`; closed `J` is not an interval of §1.1 | sound; R03 |
| §2.1 carrier | monotonicity; `κ`; wave system; transport `a = 3` | `ζ₀ + w·ζ′ ≥ (c′ − |w′ − w|)|ζ′| ≥ c|ζ′|`; `Σωᵢ Aⁱ ≥ −λA⁰` since `ω ↦ −ω` negates roots, so `σ ≥ (ζ₀ − λ|ζ′|)A⁰`; eigenvalues `ζ₀ ± |ζ′|`, at `(1/2, e₁)`: `−1/2`; `ζ = (1, −1)`: `1 ≥ 1`, symbol `−2` | sound |
| §2.2 symmetrisers (used by §3.1, §7.2) | `ρ = 1`, `c = 2`, `v = 3`; full `S`; `S N` | `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)`; block minor `∂_ρP/ρ + (∂_sP)²/ρ² − (∂_sP)²/ρ² = ∂_ρP/ρ`, at `(1, 0)`: `2·(3/2) − 1 = 2`; entries `(ρ, vⁱ) = (vⁱ, ρ) = ∂_ρP`, `(vⁱ, s) = (s, vⁱ) = ∂_sP`; `σ = [[0, 4], [4, 0]]`, `det = −16` at `ζ = (−3, 1)` | sound |
| §3.1 acoustical form | `n = 2`, `c = 2`, `v = (1, 0)`; covector `(−3, 1, 0)`; boost | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −3 − 1 = −4`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: `−4 + 9 = 5`; `ζ₀ + v·ζ′ = −2`, `c|ζ′| = 2`, `ζ(1, 3, 0) = 0`; `(1, 2, 0)`: `−4 + 4 = 0` for `g_{2,0}`; Luk–Speck value `−1` against `−4` | sound |
| §3.2 causal curves | field `(1, x)`; Cantor curve; integral form | `ẋ = eᵗ = v`; `|3e^{3t} − e^{3t}| = 2e^{3t} ≤ 1` iff `t ≤ −(ln 2)/3`, `0.0996` at `t = −1`; `10 > 1 = ∫₀¹ c`; `|x(t) − x(s)| ≤ ∫(|v| + c)` gives the Lipschitz bound | sound |
| §3.3 pasts and `D⁺` | past-closed restriction; idempotence; expanding flow; closed `D` | an extension in `D` lies in `J⁻_D(p) ⊆ D′`; `q ∈ J⁻_D(p)`, `t_q = t₀` gives `q ∈ S`, so `D⁺_D(S)` is past-closed; `y(t) = −1 + 2(1 + t)^{−1/2}`, `x = 2√(1 + t) − (1 + t)`, `0` at `t = 3`, `0.828` at `t = 1`; `x ≡ 1.9` exits at `t = 0.9` | sound |
| §3.3 slabs (repaired) | point datum; `S = Σ₀`; field `(1, x²)` | above; every start point is in `Σ₀`, so `D⁺_D(Σ₀) = D`; `ẋ = (1/4 − s)^{−2} = x²`, `x(1/2) = −4` | sound |
| §4.1 `Hᵏ_Λ` (used by §4.3, §4.4) | `e^{−|x|²}`, `n = 2`; circle | with `g = √(π/2)`: `∂₁₁`: `(3 − 4 + 4)g² = 3π/2`, `∂₁₂`: `16(g/4)² = π/2`, total `π/2 + π + 7π/2 = 5π`; operator norm: `2π(1 − e^{−2}) + 2π·½(20 − 12 + 2)e^{−2}`, total `(7/2 + 8e^{−2})π = 4.58π`; `2·4·(1/4) = 2` against `2π`, `1` against `2π` | sound |
| §4.3 Gagliardo–Nirenberg, Moser | Nirenberg's relation; scaling; composition; sphere map; `sin(ms)` | `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; exceptional case needs `a < 1`, and `a = 1` only at `i = k` where `k − i − n/2 < 0`; both sides `λ^{i − ni/(2k)}`, wrong side `λ^{1/2}` against `λ^{3/4}`, ratio `2` at `1/16`; Hölder exponents `2k/|βᵢ|` give `‖u − Ū‖_∞^{j−1}‖Dᵏu‖₂`, linear; `π²(4π − 4π/3) = 8π³/3`, mean `(0, 0) ∉ G`; `sin 1 = 0.8415 ≤ C/m` forces `C ≥ m sin 1` | sound |
| §4.4 mollifiers | `a = x`; `a = sin(x/2)`; loss constant; `u = 1` | `ψ = −zφ_ε`, `‖ψ′‖₁ = ∫|φ + wφ′|`; `½[5/8 − 3/8]μ₂ε² = μ₂ε²/8` at `x = π`; each order `1…k` derivative arises at most `n` times, `C = √n∫|y|φ`; `1 ≤ C/ε` false at `ε = 2C` | sound |
| §5.2 weighted energies | derivative of `E_χ`; moving cone; transport; speeds | `dE_χ/dt = ∫⟨σ(dχ)W, W⟩ + ∫χ(⟨KW, W⟩ + 2⟨LW, W⟩)`; `dχ = (e·w − M, −e)`, `M − e·w + w·e = M ≥ M|e|`; `−1 − sign x ≤ 0`, `−1/2 + 1 = 1/2`; support `(−1.1, −0.1)` meets `|x| < 0.55`; `(c, ±ω)` satisfy `c ≥ c|ω|`; `∫₀¹(1 − x)⁻¹ = ∞` | sound |
| §5.3 `Hᵏ` estimates | commutator; tame form; Burgers; forcing Check | `‖∇M(U)‖_∞‖∂W‖_{Hᵏ⁻¹} + ‖∇M(U)‖_{Hᵏ⁻¹}‖∂W‖_∞`; with `W = U − Ū`: `C‖∇U‖_∞‖U − Ū‖_{Hᵏ}`; `∫2u_x(−u_x² − uu_xx) = −∫u_x³`; `S_m ≥ πm⁴/3`, `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²` | sound; R02 |
| §5.4 linear existence | regularised energy; `a = e^{sin x}` Check | `∫⟨J_ε(Aⁱ∂ᵢJ_εW), W⟩ = −½∫⟨∂ᵢAⁱJ_εW, J_εW⟩`; `j = 1`: `−∫cos x (w′)² = −2π`; `∫cos x (w″)² = 4∫sin²2x = 4π`; total `4π + 16π + 2π = 22π`; coefficients have the bounds of §5.1 since `2(k − 1) > n` | sound |
| §6.1 lens uniqueness (headline) | cutoff; non-periodic pair; moving cone | `λI + θ(A⁰ − λI) ≥ λI`, `1.5` at `θ = 1/2`, `A⁰ = 2`; `g′·(1 + x²·(−1/x²)) = 0`, `0.9 − 0.3 = 0.6`; Lipschitz constant `√((|w| + M)² + 1) ≤ 1 + |w| + M` | sound |
| §6.2 (used by §7.3, §8.2) | slab form; cone map of the `z²` system | `J⁻_D(p) ⊆ D ∩ {t ≤ t_p} ⊆ O`; roots `±z², 0`, `κ = (1 + x², 0)`; `1.4 < 1.5 < 1.6` | sound |
| §7.1 (used by §7.2) | Burgers; `λ`-family | `T* = 1.6487/1.4142 = 1.1658`; `0.1166`; `3·1.2533·10³ = 3760` | sound; R02 |
| §7.2 compressible Euler (headline) | simple wave; density bound; no third alternative; full-rank background | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `T* = 1.1658`, `ρ ∈ [1, 3/2]`; `ρ ≥ ρ_* − C′T ≥ ρ_*/2`; `Bv = −(c²/ρ)∇ρ` is integrable in time when `ρ` stays compact in `I`, so `v` is bounded; `s₀ = 5`: `(1, 5) ∉ 𝒪`; `6 > 5`, `4 < 5` | sound; R01 |
| §7.3 uniformly local data | gluing; time; edge Check; switched symbol | `|x(s) − y′| < 1 − mt_p + m(t_p − s) = 1 − ms`; `mt ≤ 1/2 < 1`; `0.4055 − 0.3333 = 0.0721`, `0.086635 − 0.082988 = 0.00365`, `ε²/2 + ε³/3 = 4.84·10⁻⁵`; `(1, 3)`, `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2`; `1 + 3·(1/2) = 5/2 ∉ (0, 2)` | sound |
| §8.2 developments (headline) | `W₁₂ = W₂₁`; compatibility; counter-flow; criterion | a `U₂`-curve leaving `W₁₂` at `q` has `q ∈ J⁻_{D₁}(p)` (compact), so `J⁻_{D₁}(q) ⊆ D₂` and `q ∈ W₁₂`; `J⁻_{D₁}(p) ⊆ J⁻_D(p) ⊆ D₂` under a common bound; speeds `[1, 3]`, `[−3, −1]`, towers `x < −1 + t`, `x > 1 − t`, overlap iff `t > 1`, `2 ≠ −2` at `(2, 0)`; §6.2 with `O = H_{t₀}` gives `U = U_*` on `D`, then `D ⊆ D⁺_H(S)` | sound |
| §8.3 existence (headline) | two extensions; `S = E`; non-periodic extension | each truncated development lies in the other's slab, so they coincide under `t₀ + T₁`; `J⁻_D(p) ⊆ {t ≤ t_p} ⊆ O`, so every development is compatible with `(O, U)`; `(D − λ, U(· + λ))` is a development in `O`, so `D − λ = D` | sound |
| §8.4 regular boundary (headline) | (a); lens bound; expanding flow; slab Check | `dφ` not future causal gives a past timelike `X` with `dφ(X) > 0`; `|y| − (M/a)(b·y) < ε`, bounded iff `M|b| < a`: `−18.2ε < x < 0.514ε`; `0.2929 + 0.4142 = 0.7071`; distances `0.0316 < 0.05 < 0.0707`, foot `0.33 + 0.21 = 0.54`, `1.1 < 1.25` | sound |
| Worked example, full Cauchy data | slab `∪ T_L` and slab `∪ T_R` | each is past-closed for its own field and has initial slice `Σ₀`; both contain `(2, 0)` with velocities `2`, `−2` | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. For the fifteen sampled sections every locator
into a readable text was opened this round and carries the stated object (49 locators in 13 texts):

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 530–544, 606 ((1.24)),
  672–676 ((1.39)–(1.40)), 685, 818–822, 833–838 ((2.1)–(2.3)), 864–872, 872–880, 880–886.
- Christodoulou2019 lines 124–126, 130–138; AbbresciaSpeck2022 lines 149–152, 158–171,
  172–179, 408–414; LuoYu2023a lines 82–95 (`γ ∈ (1, 3)` at line 88); LuoYu2023b lines 417–419,
  910; LukSpeck2018 lines 1999–2008 (the normalisation `c⁻²g`).
- LukNotes lines 679, 724, 1158, 1210, 1239, 1612 (with `F(0) = 0`), 1620; Nirenberg1959
  line 318 (Lecture II headed at line 258; the exceptional cases at lines 325–329 do not meet
  `q = ∞`, `r = 2`, `a = i/k`, `i ≥ 1`).
- EperonReallSbierski2019 lines 767, 1129, 1178, 1195, 1338, 1342, 1603; BarGinouxPfaffle2007
  lines 1006–1008, 3664; Minguzzi2019 lines 1359–1364, 1917, 3576–3582, 3716–3718;
  MinguzziCone2019 lines 680–718 (between the page markers at 673 and 720), 1737–1740;
  Chrusciel2011 lines 534, 1169, 1352, 1843–1848, 1859.

`sources.toml`: 21 entries, the 21 keys of the References (14 certified, 3 uncertified,
4 waived), no local path; unchanged by this review.

### Pinned declarations opened

Mathlib at `1b1ccf4b0`, Tau Ceti at `2fd255d997`. The name-and-line pairs of the two
supplier-contract lists were tested by script at their stated lines: all match (the script's two
misses were its own pairing of names with lines, opened by hand:
`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt` at
`Mathlib/Analysis/ODE/ExistUnique.lean:57` and `TauCeti.Wkp.norm_iteratedGradient_lowerOrder_le`
at `TauCeti/Analysis/Sobolev/Wkp/Interpolation.lean:335`, with the factor
`(finrank ℝ E)² / ε` the README quotes). Signatures read in full this round:
`LipschitzWith.integral_lineDeriv_mul_eq` (`Mathlib/Analysis/Calculus/Rademacher.lean:170`: both
factors globally Lipschitz, `g` compactly supported, as the contract says);
`CompactExhaustion.choice` (`Mathlib/Topology/Compactness/SigmaCompact.lean:418`: weakly locally
compact and σ-compact); `Real.young_inequality` (`Mathlib/Analysis/MeanInequalities.lean:547`);
`MeasureTheory.norm_integral_le_integral_norm`
(`Mathlib/MeasureTheory/Integral/Bochner/Basic.lean:970`); `zorn_le_nonempty₀`
(`Mathlib/Order/Zorn.lean:126`); `ODE_solution_unique_of_mem_Icc`
(`Mathlib/Analysis/ODE/ExistUnique.lean:252`); the module docstring of
`TauCeti/Analysis/Sobolev/Wkp/Basic.lean` (lines 30–33: squared norm at order `k + 2` is the sum
of the lower-order one and that of the highest derivative, with operator norms above first
order), which the Checks of §4.1 rely on. The library claims of line 250–252 were checked by
object: Mathlib's only Gagliardo–Nirenberg file is the Sobolev embedding
`Mathlib/Analysis/FunctionalSpaces/SobolevInequality.lean`, not the `L^∞`–`Hᵏ` interpolation;
no symmetric hyperbolic system or acoustical form in either library.

### Duplication and supplier-order audit

- **SymmetricHyperbolicSystems** (open pull request adding the folder; README and
  `Suggested.lean` read at its head): Conventions *Propagation speed* as quoted; §1.2
  `structure LinearSystem (n N : ℕ)`, `LinearSystem.apply`,
  `LinearSystem.IsSymmetricHyperbolic S lam` (`0 < lam`, `IsSymm`, `lam (ξ·ξ) ≤ ξ·A⁰ξ` at every
  `(t, x)`), the speed `√n M/λ`; §2.1 the identity with `K = ∂ₜA⁰ + Σⱼ ∂ⱼAʲ − B − Bᵀ` on
  `(0, T) × ℝⁿ` for `A⁰`, `Aʲ` of class `C¹`, `B` continuous; §2.2, §2.3, §7.3 exist. Its scope
  leaves quasilinear systems and the `Hˢ` theory outside. All as cited.
- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1, §6.3
  (the hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `g(B, B) = −c²`,
  `g(X, B) = −c² dt(X)`, inverse, causal `∂_t + Y` iff `|Y − v|_h ≤ |c|`, causal vectors have
  `dt(X) ≠ 0`, the fluid side handed to a hyperbolic-PDE roadmap), §8.2, §8.3, §9.2 (the form
  `g⁻¹(du, du) = 0`), §11.4, §12.6 (the four declarations, `S ∩ D ⊆ D⁺_D(S)`, monotonicity,
  concatenation, the time-function reduction with the extension form and one-point intervals,
  the slab identity, determination, coverings), §12.7 exist and say what the README says.
  `minkowskiForm`, `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`,
  `IsPastInextendibleIn`, `futureDomainOfDependenceIn`, `futureDomainOfDependenceIn_self` are
  declared in its `Suggested.lean`.
- By-object searches over main and the open heads (`roadmaps grep`, this round): "quasilinear
  symmetric hyperbolic", "sound cone": no match; "symmetric hyperbolic", "domain of dependence":
  the two suppliers only; "acoustical", "maximal development", "equation of state":
  LorentzianGeometry only, as a consumer it names; "compressible Euler": LorentzianGeometry and
  IncompressibleFlows, as boundaries; "Moser estimate/product", "Friedrichs mollifier",
  "tame estimate", "uniformly local": unrelated uses; "Gagliardo": the embedding
  `W^{1,p} ↪ L^{p*}` in PDE and IncompressibleFlows, a different inequality from §4.3.
- Overlap facts (`roadmaps overlaps`, this round): no roadmap of this name on main or in an open
  pull request: no second copy, no other pull request changing it, no dropped id, no id defined
  only by an open revision. The worker's one lead, `LinearSystem.IsSymmetricHyperbolic`, is the
  supplier's declaration (`Suggested.lean` there), not a pinned name: no finding.
- Ownership against open pull requests: checked with the tools above for the objects named;
  the two suppliers are not among the 233 names of the brief's list and were read through
  `roadmaps show`.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, IncompressibleFlows, PDE, RelativisticQuantumFieldTheory, YangMillsConnectionsAndCaloricGauge, SobolevPolynomialApproximation; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; limit curves and null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §11.4 and §12.7, the time-parametrised statements on a domain and the boundary of a development owned here with the differences stated in §3.2 and §8.4; the linear carrier, its predicate, its speed and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check (the brief's command, run this round):

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 239 roadmaps, 2252 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers (R02 is an omission, not a wrong
edge). None of the roadmaps that may never be cited as suppliers is cited as one
(IncompressibleFlows is named as a boundary only). No notion was moved down.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References; 25 sections, each with Checks; every theorem has a locator or says it
  is proved here.
- Organisation: the layers are worked back from the developments theorems; no layer is named
  after a source's chapter and the README does not say it follows a source.
- Headlines ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4; all four are in the table
  above. No `Suggested.lean` exists at this stage; every backticked identifier is a library or
  supplier declaration, resolved above.
- Style (pattern search, this round): no LaTeX delimiters, pull-request numbers, dates, HTML,
  machine paths or process words; "lemma" occurs only in Zorn's and Friedrichs' lemma.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions,
  4 constructions, 1 example); every definition and construction has at least three tests,
  every theorem a locator, no dangling `target:` prerequisite, `gaps: []`.

### Copyright

Wording: twelve passages set beside their sources: the equation of state (AbbresciaSpeck2022
lines 165–171); the Euler systems (ChristodoulouMiao2014 lines 481–529, 833–838); entropy
propagation (lines 530–544); the definition of a development (lines 864–872); the classical
uniqueness claim (lines 875–880); the regular boundary (Christodoulou2019 lines 130–138); §7.2
(AbbresciaSpeck2022 lines 172–179); the half-space configuration (LuoYu2023b lines 417–419);
`D⁺_D(S)` (Minguzzi2019 lines 3576–3578, BarGinouxPfaffle2007 lines 1006–1008, Chrusciel2011
lines 1843–1848); the uniqueness criterion (EperonReallSbierski2019 lines 1342–1344); the
composition estimate (LukNotes lines 1612–1614); the interpolation theorem (Nirenberg1959
lines 318–329). Longest shared run: five words ("the union of all developments"), where the
README reports the claim it refutes. No table, figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16,
AbbresciaSpeck2022 and LukNotes 8 each. The contents of ChristodoulouMiao2014 (lines 339–407)
are twelve chapters on the acoustical structure, energy estimates and commutation fields of
shock formation; only its Chapters 1–2 meet Layer 1, §3.1 and §8.1, and no run of layers
follows its chapters.

Source independence: 12 passages compared with 10 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984, Kato1975, Dafermos2016: settled as uncertified; cited by locator, text not read.
  The statements they are cited for (§§2.1, 4.2–4.4, 5.1–5.4, 7.1, 7.3) were checked
  mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators
  not checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §6.2 (the sweep), §7.1 (the iteration and the Bona–Smith step) and §8.4 (b)
  (the extension lens) have no source theorem at this generality in a readable text; they were
  checked on the instances of the table, not proved in full.
- The IncompressibleFlows and PDE norm conventions behind two Checks of §4.1 were not re-read
  this round; those roadmaps are not suppliers.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt`, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry §7.3 hands "the fluid side" to a hyperbolic-PDE roadmap named under its Downstream consumers; this design takes that role and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "5eb95ff9b25772f0f8f813bd89a8a699c03adfdd", "job": "REV-DESIGN-CompressibleEulerEquations~16", "model": "fable", "worker": "chris-x55"} -->
