<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13760#issuecomment-6899318247 -->
Review (claude) of 638c9f4

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) the route of "Developments inside a slab" takes `Ũ = U`, which need not be Λ-periodic

   **Location:** `packages/CompressibleEulerEquations/design/README.md`, §8.4, bullet *Developments
   inside a slab*: "Route: (b) with `Ũ = U` on `⋃_{λ∈Λ} (N + λ) ⊆ O`"; the same sentence in plan
   target 8.4.2.

   **Claim:** the slab solution `U` is an extension of the kind (b) asks for: classical on `N` "and on
   the Λ-translates of `N`, periodically".

   **Witness:** §8.3 lets the extension `U₀` be a §7.3 datum, or a §7.2 datum for another period
   group. `n = 1`, `Λ = ℤ`, `S = ⋃_k (k, k + 1/2)`, constant data with `c₀ = 1`, `v₀ = 0`;
   `U₀ = const +` a small bump in `(0.52, 0.6)` only. Then `D` is the union of the triangles
   `k + t < x < k + 1/2 − t` (Λ-invariant, `U` constant on it); for `q = (0.2, 0.3)` and `N` the ball
   of radius `0.1` about it, the bump (speed near `−1`, at `x ≈ 0.32` by `t = 0.2`) has entered `N`
   and nothing has entered `N + 1`: `U|_{N+1} ≠ τ₁(U|_N)`.

   The statement itself is true (the conclusion only uses the limit of `U` at `q`, and "largest
   development contained in `O`" holds for every development, periodic extension or not: for a
   development `(D′, U′)` with `D′ ⊆ O`, §6.2 gives `U′ = U` on `D′` because `J⁻_{D′}(p) ⊆ D′ ⊆ O`,
   and the first-exit argument gives `D′ ⊆ D⁺_O`). Only the route sentence is wrong on this instance.

   **Exact repair:** replace the route sentence, in §8.4 and in plan target 8.4.2, by: "Route: (b) on
   a ball `N₁ ⊆ N` about `q` of diameter less than the least norm of a nonzero period, with `Ũ` equal
   to `τ_λ(U|_{N₁})` on `N₁ + λ` (a classical solution there by translation invariance, which extends
   `U` because `U` is Λ-periodic on `D`, and which is `U` itself when `U₀` is Λ-periodic); a
   development above `(D, U)` contained in `D ∪ ⋃_{λ∈Λ} (N₁ + λ) ⊆ O` is a development contained in
   `O`, hence below `(D, U)`, the largest one (§8.3), so it does not contain `q ∉ D`." Tested on the
   witness: the balls `N₁ + k` of radius `< 1/2` are disjoint, `Ũ` on `N₁ + 1` is the translate (bump
   included), agrees with the constant state on `D ∩ (N₁ + 1)`, and (b) gives at `q = (0.2, 0.3)`,
   `φ = x − 1/2 + t`: `∂_tφ = 1 = c|∂_xφ|`, with `c = 1`, `v = 0` the limit of `U` from `D`.

One finding, P3 (a route sentence of the statement added last round), with a written repair, so
the verdict asks for changes; no P1 or P2. Both findings
of round 10 are repaired. The repaired and added passages of §8.4, the fifteen sampled sections,
the two sections the round-10 table had no row for (§3.2, §4.3) and the headlines were recomputed
by hand (table below). All supplier citations were resolved at the present heads, all 55 pinned
name-and-line pairs were opened, and every locator of the sampled sections into a readable text
was opened. This review changed no file of the design and did not touch the manifest.
Elaboration: not available (this lane does not elaborate; say so in the report); the design stage
has no `Suggested.lean`, so the one-tactic probe and the `#check` comparison have nothing to run
on. No supplier gap is declared (`gaps: []` in `packages/CompressibleEulerEquations/design/plan.json`).
No maintainer note was left for this roadmap. No text read contained instructions.

## Verified sound

### Round-10 findings, checked first

| Round-10 finding | Repaired passage (present README) | Disposition |
|---|---|---|
| F01 (P2) §8.3 claims nullity "by §8.4" for a development that is not maximal | §8.4 (b): "and no development `(D′, U′) ≥ (D, U)` with `D′ ⊆ D ∪ ⋃_{λ∈Λ} (N + λ)` contains `q` (this holds in particular when `(D, U)` is maximal, since `q ∉ D`)"; the §8.3 bullet is gone; new bullet "*Developments inside a slab.* … `q ∈ ∂D` with `t₀ < t(q) < t₀ + T`, an open `N ∋ q` with `N ⊆ (t₀, t₀ + T) × E`"; new Check "Developments inside a slab"; *Needs:* "§8.3 (the largest development in a slab) for the statement on developments inside a slab only"; plan 8.4.1 updated, plan 8.4.2 added with prerequisites 8.4.1 and 8.3 | **Repaired.** Applied with a separate target 8.4.2 instead of adding §8.3 to 8.4.1; that is the better dependency (the maximal headline stays independent of Layer 7). The statement is sound (rows below); its route sentence is R01. |
| F02 (P3) the consequence of §8.4 does not repeat the hypothesis of (b) | "*Regular boundary hypersurfaces.* … If `(D, U)` satisfies the hypothesis of (b) at each point of `H` for such an `N` (in particular, if `(D, U)` is maximal), then `H` is null" | **Repaired.** On the truncation top the hypothesis fails (row below), so nothing is claimed. |

Repaired pattern searched in the rest of the text (a conclusion drawn from (b) or from nullity for
a development not known to be maximal): §3.3 half-space Check (a direct computation of `D⁺`), §8.1
Checks, Layer 8 Examples, Worked examples (each unique maximal by the §8.2 criterion, the data
extending to a global solution, or computed), Downstream consumers ("the regular boundary of
§8.4"), the comparison with LorentzianGeometry §12.7 (now "at which the hypothesis of (b) fails").
None further.

### Adversarial table

Recomputed by hand this round. Coordinates `(t, x)`.

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §8.4 (b), weakened hypothesis (repaired) | maximal `{|x| < 1 − t}`, `c = 1`; `b = 0`; route | lateral: `∂_tφ = 1 = 1·|±1|`; `b = 0` forces `a = ∂_tφ > 0 = c|b|`, strict, so excluded and `∇φ(q) ≠ 0` follows; `D ∪ L = D ∪ ({ψ > 0} ∩ N₀)` open since `D ∩ N₀ = {φ < 0}`; backward `ψ` is nondecreasing (relative speed `< M`), `φ` decreases at rate `≥ a − c̃|b| − o(1) > 0`; return through `D` to the `O(ε)` lens would need distance `≥ r₀ − O(ε)` in time `O(ε)` | sound |
| §8.4 (b) on a truncation top (repaired Check) | `{|x| < 1 − t, t < 1/2}`, `q = (1/2, x_q)`, cone of slope 2, radius `r < 1/2 − |x_q|` | at `t = 1/2`: `|x| < |x_q| + r < 1/2 = 1 − t`, union open; backward: `|x(t)| < |x_q| + r + 1/2 − t < 1 − t`; `∂_tφ = 1 > 0` | hypothesis fails, nothing claimed |
| §8.4 slab statement (added) | `D = {x > t, t < 1}`: `(1/2, 1/2)`, `(1, 5)`; `(ρ₀, v₀)` on `{x¹ > 0}`; `S = E`; a development `D′ ⊆ O` | `φ = t − x`: `1 = 1·1`; top: `1 > 0`, `t(q) = t₀ + T`, excluded, and `x(t) > 5 − r − 1 + t > t` for `r < 4` gives a development above; `v₀¹ + c₀ − v₀¹ = c₀ = c₀·1`; `∂D ∩ {t₀ < t < t₀ + T} = ∅`; `J⁻_{D′}(p) ⊆ D′ ⊆ O` so `U′ = U`, `D′ ⊆ D⁺_O` | statement sound; route R01 |
| §8.4 (a) | negation; `{|x| < 1 − t/2}` | `X = −(1, v − θcb/|b|)`: `dφ(X) = −(a − θc|b|) > 0` for `θ` near 1 when `a < c|b|`; `1/2 < 1` | sound |
| §8.4 Checks | ball; expanding flow at `(1, 2√2 − 2)`; lens, `M = 5`, `1.05` | `−e·v₀ + c₀ + v₀·e = c₀`; `0.2929 + 0.4142 = 0.7071 = 2^{−1/2}`; `φ(−100, −400) = 260`, `ψ = ε + 100`; `|x| + 0.945x < ε`: `−18.2ε < x < 0.514ε` | sound |
| §1.1 sound speed | `ρ²/2` at 4; `ρ²` at 1/2; `e^sρ²` at `(1, 0)`; `−A/ρ` | `c = 2` (wrong `c = p′`: 4); `c² = 1`; `∂_ρP = 2`, `∂_sP = 1`, `c = √2`; `p′ = A/ρ² > 0` | sound |
| §1.2 expanding flow, boost | `n = 1`, `t = 1`, `w = 1` | `∂_tρ = −ρ₀/4`, `∂_x(ρv) = ρ₀/4`; `ṽ = (y + 1)/(1 + t)`: residual 0; wrong rule: `−(1 + y)/(1 + t)² + (y − t)/(1 + t)² = −1/(1 + t) = −1/2` | sound |
| §2.2 barotropic symmetriser | `ρ = 1`, `c = 2`, `v = 3` | `A¹ = [[12, 4], [4, 3]]`, `(12 − 4λ)(3 − λ) − 16 = 4(λ − 1)(λ − 5)` | sound |
| §3.1 form, covectors, frame | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3, −1, 0], [−1, 1, 0], [0, 0, 1]]`, `det = −4 = −c²`; `(1, 3, 0)`: `−4 + 4 = 0`; `(1, 4, 0)`: 5; `ζ = (−3, 1, 0)`: `ζ₀ + v·ζ′ = −2`, `g⁻¹ = −1 + 1 = 0`, `ζ(1, 3, 0) = 0`; future causal covectors: `min_{|u|≤1} (ζ₀ + v·ζ′ + cu·ζ′) = ζ₀ + v·ζ′ − c|ζ′|` | sound; agrees with LorentzianGeometry §7.3 |
| §3.2 integral characterisation, Checks | field `(1, x)`; Cantor curve | `e^{3t}`: `|ẋ − v| = 2e^{3t}`, `≤ 1` iff `t ≤ −(ln 2)/3`, `0.0996` at `−1`; `10 > 1 = ∫₀¹ c` | sound |
| §3.3 slabs, expanding flow, restriction | field `(1, x²)`; `p = ρ²/2`; `D′ ⊆ D` past-closed | `x(s) = 1/(1/4 − s)`: `ẋ = x²`, `−4` at `1/2`, `−∞` at `1/4`; `ẏ = −(1 + t)^{−3/2}`, `x = 2√(1 + t) − (1 + t)`: `0.828` at 1, 0 at 3; an extension in `D` lies in `J⁻_D(p) ⊆ D′` | sound |
| §4.2 embedding, interpolation | `e^{−x²}`; dilations; Tau Ceti additive form | `‖u‖² = ‖u′‖² = √(π/2)`, `‖u″‖² = (3 − 4 + 4)√(π/2)`; `2 ≤ √5`; wrong pair: `λ^{1/2}` against `λ^{1/6}`; `2·3^{1/4}(π/2)^{1/4} = 2.947 ≥ 1.120`; `(3/4, 1/4)`: `λ^{1/2}` against `λ⁰` | sound |
| §4.3 Gagliardo–Nirenberg, composition | scaling; `Φ_m = sin(ms)`; the `ℝ³` map into the circle | Nirenberg exponent `1/p = i/n + (i/k)(1/2 − k/n) = i/(2k)`; both sides `λ^{i − ni/(2k)}`, wrong `λ^{−1/4}`: 2 at `1/16`; `sin 1 = 0.8415 ≤ m·m^{−1}`; `∫|∇ϑ|² = π²(4π − 4π/3) = 8π³/3`, `J_εu(0) = (0, 0) ∉ G` | sound |
| §4.4 loss bound, commutator | count of `(i, α)`; `a = sin(x/2)`, `u = sin x`; `a = x` | `Σ_{|α|≤k−1} Σᵢ ‖∂ᵢ∂^αu‖² ≤ n Σ_{1≤|γ|≤k} ‖∂^γu‖²`; at `x = π`: `½(μ₂ε²/2)(−2 + 9/4 + 1/4) = μ₂ε²/8`; `ψ = −zφ_ε`, `‖ψ′‖_{L¹} = ∫|φ + wφ′|` | sound |
| §5.2 weights, speeds | transport `a = 1`; constant Euler state; `c = 1/2`; `W = (1 − x)^{−1}` | `−1 − sign x ≤ 0`; `−1/2 + 1 = 1/2 > 0`, support `(−1.1, −0.1)` meets `|x| < 0.55`; `(e·v₀ − c₀) − v₀·e + c₀ = 0`; `ζ = (c, ±ω)`: `cξ·A⁰ξ ± ξ·(ΣωA)ξ ≥ 0`; `ζ = (1/2, −1)`: `−1/2`; `∫₀¹ (1 − x)^{−1} = ∞` | sound |
| §5.3 forcing coefficient, tame form | `A⁰ = 1/(2 + u)`, `U = sin mx`, `W = (δ + t)(2 + sin mx)` | `A⁰(U)∂_tW = 1`; `S_m ≥ πm⁴/3`; `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²`; tame: commutator `≤ C‖∇U‖_∞‖U − Ū‖_{Hᵏ}`, source `≤ C‖U − Ū‖_{Hᵏ}` | sound |
| §6.1 lens uniqueness (headline) | `φ = 1 − |x| − t/2`, `a = 1`; `A¹ = diag(z², 0)`, `Λ = ℤ`; cut-off | `1/2 > 0`; `∂_tu + x²∂_xu = g′(1 − 1) = 0`, `t + 1/x = 0.6` at `(0.9, −10/3)`; `λI + θ(A⁰ − λI)`: `1.5` at `θ = 1/2` | sound |
| §6.2 Theorem, slab uniqueness | constant state, `S = (−2, 2)`; Burgers `U₁ ≡ 0`; `κ` for `diag(z², 0)` | `1.4 < 1.5 < 1.6`; characteristic of slope `U₂(p)` reaches `t = 0`; largest root `λ = z² = x²`, field `(1 + x², 0)` unbounded | sound |
| §7.1 well-posedness | Burgers `u₀ = −e^{−x²}`; `F ≡ 1` | `min u₀′ = −√2e^{−1/2}` at `−1/√2`, `T* = 1.6487/1.4142 = 1.1658`; `u₀ + t ∉ L²` | sound |
| §7.2 Euler (headline) | `p = ρ³/3`; `n = 3`; `v` unbounded alternative | `v − ρ ≡ −1`, `v + ρ = 1 + e^{−x²}`, `ρ = (w + 1)/2 ∈ [1, 3/2]`, `T* = 1.1658`; `6 > 5`, `4 < 5`; `|Bv| ≤ C‖∇ρ‖_∞` integrable keeps `v` bounded | sound |
| §7.3 uniformly local | `p ∈ C_y ∩ C_{y′}`; `F = u/(1 − u)`; transport `a = 3` | `|x(t) − y′| < 1 − mt_p + m(t_p − t) = 1 − mt`; exit time `−log U₀ − (1 − U₀)`: `0.4055 − 0.3333 = 0.0721` at 0, `0.08664 − 0.08299 = 0.00365` at 10; `ζ = (−2, 1)`: `1 ≥ 1`, entry `−2` | sound |
| §8.2 (headline) | counter-flow `p = ρ²`, `ρ = 1/2`; compatible pair; `W₁₂ = W₂₁`; full-data variant | `c² = 2ρ = 1`; towers `x < −1 + t`, `x > 1 − t`, disjoint iff `t < 1`; `(2, 0)`: `0 < 1`, `0 > −1`, `2 ≠ −2`; a `U₁`-curve in `T_L` has `x(1) < 0`, outside `T_R`; first exit from `D₁` above `t₀` contradicts `D₁ = D⁺_{D₁}`; `J⁻_{D₁}(p)` compact inside the open `W₁₂` where the fields agree; `T_L ∪ [0, T′) × ℝ` and `T_R ∪ [0, T′) × ℝ` are developments | sound |
| §8.3 (headline) | `S = E`; largest in `O`; two extensions; non-periodic extension | `J⁻_{D′}(p) ⊆ {t ≤ t_p} ⊆ O`, so compatible with the slab; truncation at the smaller time lies in both; `U = τ_λU` on `D⁺_O` by §6.2 with `U₂ = τ_λU`, so `D⁺_O` is Λ-invariant | sound |

### Sources: the seeded sample

No locator is flagged unverified by the author. Every locator of the fifteen sampled sections into
a readable text was opened and resolves to the stated object:

- ChristodoulouMiao2014 lines 481–488 ((1.2)–(1.4)), 529 ((1.10)), 606 ((1.24)), 672–676
  ((1.39)–(1.40)), 685, 818–822, 864–872, 872–880, 880–886.
- AbbresciaSpeck2022 lines 79–83, 149–152, 158–171 ((1.1a)–(1.3)), 172–179, 408–414.
- LuoYu2023a lines 82–95; LuoYu2023b lines 417–419 and 910 (Definition 2.13); Christodoulou2019
  lines 124–126, 130–138; LukSpeck2018 lines 1999–2008 (Definition 3.3, normalisation `c⁻²g`).
- LukNotes lines 679 (Proposition 4.1), 724 (Proposition 4.4), 1158 (Theorem 5.3), 1210
  (Theorem 5.5), 1239 (Theorem 6.1), 1612 (Lemma 6.8, `F(0) = 0`), 1620 (Theorem 6.10).
- EperonReallSbierski2019 lines 767 (Theorem 3.45), 1129–1144, 1178–1189 (Proposition 4.63),
  1195–1210, 1338 and 1342 (Corollaries 4.68, 4.69), 1603 (Theorem 4.82).
- BarGinouxPfaffle2007 lines 1006–1008 (Definition 1.3.5), 3664–3668 (Theorem 3.2.11);
  Minguzzi2019 lines 1917, 3576–3582, 3716–3718; MinguzziCone2019 lines 1737–1740; Chrusciel2011
  lines 1169, 1843–1848, 1859.

### Pinned declarations opened

Mathlib at `1b1ccf4`, Tau Ceti at `2fd255d` (the checkouts' heads equal the pins of
`lake-manifest.json`). All 55 name-and-line pairs of the supplier contracts (20 of Mathlib, 35 of
Tau Ceti) were printed by script at their stated lines; each line is the named declaration, among
them `Matrix.PosDef` (`PosDef.lean:176`), `zorn_le_nonempty₀` (`Zorn.lean:126`),
`IsPicardLindelof.exists_eq_forall_mem_Icc_hasDerivWithinAt` (`ExistUnique.lean:57`),
`HasFTaylorSeriesUpToOn.comp` (`FaaDiBruno.lean:1051`), `TauCeti.Wkp` (`Wkp/Basic.lean:145`),
`TauCeti.Wkp.toZeroAtInfty` (`Embedding.lean:194`, `finrank ℝ E < 2 * k`),
`TauCeti.W1p.eLpNorm_value_comp_add_sub_value_le_mul_enorm_gradient` (`Translation.lean:133`),
`TauCeti.w1p0Submodule_top_eq_top` (`W1p/Density.lean:299`),
`TauCeti.CircleSobolev.norm_sq_eq_tsum` (`Circle/Basic.lean:375`) and
`TauCeti.le_mul_exp_of_le_add_mul_integral` (`Gronwall.lean:59`).

### Duplication and supplier-order audit

- **LorentzianGeometry** (open pull request adding the folder; read at its head): §6.1, §6.3 (the
  hyperplane trichotomy by the sign of `b⁻¹(ξ, ξ)`), §7.3 (form, `B`, inverse,
  `g(X, B) = −c² dt(X)`, causal vectors have `dt(X) ≠ 0`, `∂_t + Y` causal iff `|Y − v|_h ≤ |c|`),
  §8.2, §8.3, §9.2, §11.4, §12.6 (the four declarations, monotonicity, concatenation, time
  functions with the extension form and one-point intervals, the slab identity,
  `futureDomainOfDependenceIn_self`, coverings) and §12.7 (horizons of `S` closed in a slice, null
  where `C¹`) exist and state what the README assumes or compares with. `minkowskiForm`,
  `TimeOrientedLorentzianFieldOn`, `IsFutureCausalCurveIn`, `IsPastInextendibleIn`,
  `futureDomainOfDependenceIn` and `futureDomainOfDependenceIn_self` are in its `Suggested.lean`.
  Its Scope and Downstream consumers leave the compressible Euler equations, their states and
  developments to a hyperbolic-PDE roadmap.
- **SymmetricHyperbolicSystems** (open pull request adding the folder; read at its head): §1.2
  (`LinearSystem n N`, `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` with `IsSymm` and
  `lam |ξ|² ≤ ξ·A⁰ξ`, all in its `Suggested.lean`), §2.1 (the same `K`), §2.2 (single speed, `F = 0`
  on the cone, smoothed weight), §2.3, §7.3 resolve. Its Scope puts quasilinear systems and the
  `Hˢ` theory outside it. The citation lead of `scratch/citations.md`
  (`LinearSystem.IsSymmetricHyperbolic`) is that declaration; `roadmaps resolve`, run again, lists
  nothing.
- **PDE** (main): §1.3, §1.4, Layer 7 with §7.1–§7.3 exist on main, and under the same numbers at
  the head of its open revision. Nothing of it is consumed.
- **IncompressibleFlows** (never-cite list) and **RelativisticQuantumFieldTheory** (RQFT1): named
  as boundaries only; `UnitAddTorus d`, Layer 0 and RQFT1 exist at their heads.
- By object over main and the open heads (`roadmaps grep`): "quasilinear symmetric hyperbolic" and
  "Kato–Ponce" have no match; "Moser estimate" only the De Giorgi–Nash–Moser theory of PDE and a
  DGFloer sentence; "Friedrichs mollification" one tangential use inside a PositiveMass proof;
  "maximal development", "equation of state", "compressible Euler" only LorentzianGeometry's
  deferral sentences; "Gagliardo–Nirenberg" everywhere the Gagliardo–Nirenberg–Sobolev inequality,
  a different statement. No roadmap cites CompressibleEulerEquations.
- Overlap facts (`roadmaps overlaps`, run again): the roadmap is neither on main nor in an open
  pull request: no second copy, no other pull request changes it, no cited id is dropped, none is
  defined only by an open revision.

Overlap check: read LorentzianGeometry, SymmetricHyperbolicSystems, YangMillsConnectionsAndCaloricGauge, IncompressibleFlows, PDE, SobolevPolynomialApproximation, RiemannianGeometry; shared objects: the acoustical form, causal curves and `D⁺_D(S)` in subsets — owner LorentzianGeometry, imported here; null `C¹` horizons in a fixed spacetime — owner LorentzianGeometry §12.7, with the boundary of a development owned here and the difference stated in §8.4; the linear carrier, its predicate and the pointwise energy identity — owner SymmetricHyperbolicSystems, imported here; periodic Sobolev spaces on a full torus — owners PDE §7.2 (main) and IncompressibleFlows Layer 0, with `Hᵏ_Λ` for period groups of every rank owned here; nothing else shared.

Dependency check:

```text
candidate: CompressibleEulerEquations is not in the merge order yet; checked as if placed after MathematicalBilliards (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2241 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every `*Needs:*` line was read: each item is a pinned declaration, a
section of this roadmap or a section of the two suppliers. The new *Needs:* entry of §8.4 (§8.3,
for the slab statement only) is internal and downward. No notion was moved down this round.

### Shape, style, headlines and plan

- Shape: Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the
  build, eight layers each ending with Examples and Dependencies, Downstream consumers, Worked
  examples, References. Every definition has at least three Checks; every theorem has a locator or
  says it is proved here.
- Organisation: the layers are worked back from the developments theorems; none is named after a
  source's chapter and the README does not say it follows one.
- Headline theorems ("How to read the build"): §7.2, §6.1, §8.2–§8.3, §8.4. There is no
  `Suggested.lean` at this stage; every backticked identifier is a library or supplier declaration.
- Style: no LaTeX delimiters, process words, pull-request numbers, dates, HTML or machine paths
  (pattern search); "lemma" occurs only in Zorn's, Friedrichs' and a source's Lemma 6.8.
- `design/plan.json`: parses; 8 layers, 54 targets (37 theorems, 12 definitions, 4 constructions,
  1 example), every definition and construction with at least three tests, no dangling `target:`
  prerequisite, `gaps: []`; 8.4.1 and 8.4.2 agree with the README. `sources.toml`: 21 entries, the
  21 keys of the References.

### Copyright

Wording: fifteen passages set beside their sources: the equation of state (AbbresciaSpeck2022
lines 165–171); the definition of a development (ChristodoulouMiao2014 lines 866–872); the
classical uniqueness claim (lines 875–880); the acoustical form (lines 672–676); the
well-posedness sentence of §7.2 (AbbresciaSpeck2022 lines 175–179); the slab statement of §8.4
(LuoYu2023b lines 417–419); the regular boundary (Christodoulou2019 lines 130–138); `D⁺_D(S)`
(Minguzzi2019 lines 3576–3578, MinguzziCone2019 lines 1737–1740, BarGinouxPfaffle2007
lines 1006–1008, Chrusciel2011 lines 1843–1846); the embedding, the composition estimate and the
weighted energy (LukNotes lines 1210–1212, 1612–1615, 724–726); the uniqueness criterion
(EperonReallSbierski2019 lines 1338–1344). Longest shared run: five words ("the union of all
developments"), where the README reports the source's claim in order to refute it. No table,
figure, exercise or data set is taken over.

Arrangement: 100 source citations in the layers; Majda1984 17, ChristodoulouMiao2014 16
(AbbresciaSpeck2022 and LukNotes 8 each). ChristodoulouMiao2014's contents (lines 338–370: Ch. 1
Euler equations and acoustical metric; Ch. 2 null foliation; Ch. 3 structure equations; Ch. 4
curvature; Ch. 5 fundamental energy estimate; Ch. 6 commutation fields; Ch. 7 estimates of each
order): only its §1.1, §1.3 and §2.1 meet Layer 1, §3.1 and §8.1; Layers 2 and 4–7 have no
counterpart and no run of layers follows its chapters.

Source independence: 15 passages compared with 10 sources, none shared; largest share Majda1984, 17 of 100 locators (ChristodoulouMiao2014 16); contents compared with ChristodoulouMiao2014: independent; Majda1984 could not be read (uncertified), so neither its wording nor its contents were compared.

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I), Dafermos2016 (Ch. V, §5.1,
  Theorem 5.1.1): settled as uncertified; cited by locator, text not read. The statements they are
  cited for were checked mathematically, not against the texts.
- Friedrichs1954, HawkingEllis1973, Christodoulou2007, ONeill1983: settled as waived; locators not
  checked.
- Elaboration: not available in this lane, and the design has no Lean file.
- The routes of §3.2 (limit curves), §3.3 (openness), §6.2 (the sweep), §7.1 (the iteration and the
  Bona–Smith step) and §8.4 (b) (the extension lens) have no source theorem at this generality in a
  readable text; they were checked step by step by hand and on the instances of the table.
- The pinned declarations were compared by name, line and printed signature head; their bodies
  were not unfolded.
- Nirenberg1959 line 318 (OCR text) was not reopened this round; the exponents of §4.3 were
  checked by Nirenberg's dimensional relation and by scaling.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25: the source says two developments of the same data always agree on their common domain, so the union of all developments is the unique maximal one; it should be that they agree on the largest common development, with uniqueness needing an extra property of the data; affects a stated result.

## For the human reviewers

- **Merge order.** The suppliers LorentzianGeometry and SymmetricHyperbolicSystems are other authors' open pull requests adding new folders; neither is in `merge-order/ORDER.txt` nor in the list of open pull requests given to this review, and the dependency check draws no edge to them.
- **Not tested.** Majda1984 has the largest share of locators (17 of 100) and is uncertified: its wording and its table of contents were not compared with Layers 4–7.
- **Licence.** LukNotes is a set of unpublished lecture notes read from the author's page (`packages/CompressibleEulerEquations/sources.toml`, entry `LukNotes`); it is cited only for wave-equation analogues.
- **Scope/ownership.** LorentzianGeometry's Downstream consumers also assign characteristic data and "characteristic iff null" to the hyperbolic-PDE roadmap; this design states the Euler-symbol form (§3.1) and leaves characteristic data to a Part II.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "638c9f480b00addfb95a7a50bf2ee1ae224ac29f", "job": "REV-DESIGN-CompressibleEulerEquations~11", "model": "fable", "worker": "chris-x26"} -->
