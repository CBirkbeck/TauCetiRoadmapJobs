# PKG-CompressibleEulerEquations

The accepted design is written out as `packages/CompressibleEulerEquations/README.md`,
`packages/CompressibleEulerEquations/Suggested.lean` and `packages/CompressibleEulerEquations/metadata.toml`
(`topic = "math.AP"`, as PDE and YangMillsConnectionsAndCaloricGauge on main). The design was already in
README shape; every target, Check and worked example of it is kept. The changes are listed below, each with
its reason. The accepting review's notes (the three P3 findings of the last review round) were already
applied in the accepted design and are kept verbatim.

## Headline theorems

All are statable at the pins and all are stated, each with `sorry`, in
`packages/CompressibleEulerEquations/Suggested.lean`.

| Headline (README) | Lean name | Status |
|---|---|---|
| Local uniqueness on lens-shaped domains (§6.1) | `QuasilinearSystem.eqOn_lens` | stated |
| Uniqueness on domains of dependence (§6.2) | `QuasilinearSystem.eqOn_causalPast` | stated |
| Local well-posedness in `Hᵏ_Λ` of quasilinear symmetric hyperbolic systems (Kato): existence on `T(M, K)`, `Hᵏ` bound `R(M, K)`, continuity in time, uniqueness among classical solutions, continuous dependence (§7.1) | `QuasilinearSystem.localWellPosedness` | stated |
| Continuation criterion (§7.1) | `QuasilinearSystem.exists_extension_of_lintegral_lt_top` | stated (extension form) |
| Local well-posedness of compressible Euler, non-vacuum `Hᵏ_Λ` data, density bound `ρ ≥ ρ_*/2`, `T` independent of `t₀` (§7.2) | `EquationOfState.localWellPosedness` | stated (full system) |
| Continuation criterion for compressible Euler (§7.2) | `EquationOfState.exists_extension_of_lintegral_lt_top` | stated |
| Maximal common development (§8.2) | `EquationOfState.maximalCommonDevelopment` | stated |
| Compatible iff `W₁₂ = D₁ ∩ D₂` iff common upper bound (§8.2) | `EquationOfState.compatible_iff` | stated |
| Existence of maximal developments (§8.2) | `EquationOfState.exists_maximal_development` | stated |
| Uniqueness criterion for data extending to `H_{t₀}` (§8.2) | `EquationOfState.isGreatest_development_of_solution` | stated |
| Non-uniqueness: supersonic counter-flow (§8.2) | `exists_incompatible_developments` | stated |
| Existence of developments in a slab, largest in the slab (§8.3) | `EquationOfState.isDevelopment_slab` | stated |
| Slab inside every maximal development of full Cauchy data (§8.3) | `EquationOfState.slab_subset_of_maximal` | stated |
| Boundary of a development is future causal (§8.4 (a)) | `EquationOfState.boundary_futureCausal` | stated |
| Nullity of the regular boundary (§8.4 (b)) | `EquationOfState.boundary_null` | stated |

The design's "How to read the build" named §7.2, §6.1, §8.2–§8.3 and §8.4; §6.2, §7.1 and the §8.2
counterexample are added because they are the deep results the roadmap is built to reach (Kato's theorem,
the domain-of-dependence theorem) and the result its Summary names (the counterexample). The barotropic
forms of §7.2 and Layer 8 are not stated separately: a barotropic law is the equation of state
`P(ρ, s) = p(ρ)` on `I × ℝ`, and the barotropic statements are the constant-entropy case (README §1.3,
§7.2, "How to read the build"). Moser, Gagliardo–Nirenberg, Friedrichs and the energy estimates
(Layers 4–5) and §7.3 are tools, not headlines; they stay README targets.

Definitions in the file (only what the headlines need, all with real bodies): `EquationOfState`,
`EquationOfState.soundSpeed`, `EquationOfState.IsSolution`, `EquationOfState.acousticalCone`,
`QuasilinearSystem`, `QuasilinearSystem.symbol`, `QuasilinearSystem.Dominates`,
`QuasilinearSystem.IsClassicalSolution`, `IsHalfSpaceDomain`, `IsCausalCurve`, `IsPastCausalCurve`,
`IsPastInextendible`, `futureDomainOfDependence`, `causalPast`, `IsWeakDerivFamily`, `sobolevNormSq`,
`sobolevNormSqVec`, `stateSobolevNormSq`, `IsContinuousIn`, `IsLensFunction`,
`EquationOfState.IsDevelopment`, and `quadraticLaw` (the law `P = ρ²` of the counterexample, with its
two proof obligations discharged by `fun_prop` and `simp`). The causal notions are the
time-parametrised forms to which LorentzianGeometry §12.6 reduces `IsFutureCausalCurveIn`,
`IsPastInextendibleIn` and `futureDomainOfDependenceIn`; they are restated because the pins have no
causal curve and another roadmap's module may not be imported. No declaration reuses the fully
qualified name of a LorentzianGeometry or SymmetricHyperbolicSystems declaration.

## What changed against the design, and why

1. **Cauchy data are continuous (correction).** §§7.1–7.2 asked for a classical solution with
   `U(0) = U₀` for every `U₀` with `U₀ − Ū ∈ Hᵏ_Λ`. A datum changed on a null set has the same Sobolev
   class and no classical solution attaining it. Witness: `N = n = 1`, `A⁰ = 1`, `A¹ = 0`, `F = 0`,
   `Λ = 2πℤ`, `U₀ = 1` on `2πℤ` and `0` elsewhere: squared norm `0`, only candidate `U(t, x) = U₀(x)`,
   discontinuous. The statements now take continuous data (the `C¹` representative, §4.2); new
   Conventions paragraph "Cauchy data" and a new Check in §7.1.
2. **§7.1 statement matched to what is stated.** `U − Ū ∈ C¹([0, T]; Hᵏ⁻¹_Λ)` moved from the existence
   clause to a "Time regularity" consequence with its reason (`∂_tU = A⁰(U)⁻¹(F(U) − ΣAⁱ(U)∂ᵢU)` in
   `C([0, T]; Hᵏ⁻¹_Λ)` by §4.3 at order `k − 1`); persistence is a consequence bullet; the continuation
   criterion is stated in its extension form with the maximal-time form as its corollary.
3. **§7.2 uniqueness and time.** Uniqueness is now among all classical solutions on the closed slab
   (the design said "unique in the class"); this is what §7.1's uniqueness clause gives (only the
   bounded cones of the constructed solution enter). `T` is stated independent of `t₀`, as the
   design's dependence list implied.
4. **§8.3 stated at its real generality.** The design's hypothesis ("the solution of §7.2/§7.3 for an
   extension of the data") is replaced by "any classical solution on the slab whose initial values
   extend the data", of which §7.2/§7.3 are instances; the Λ-invariance argument for a non-periodic
   extension is written out. The `S = E` clause carries the bounded-field hypothesis it needs
   explicitly (it held implicitly through §7.2's compact range): without it `(O, U)` need not be a
   development (§3.3 Check with the field `(1, x²)`).
5. **`n ≥ 1`.** The README's Conventions have `n ≥ 1`; the Lean theorems carry `[NeZero n]` so that
   their generality equals the README's. (For `n = 0` the statements stay true: in `boundary_null`
   the conclusion `∇φ(q) ≠ 0` is false for `n = 0`, but its hypotheses are then unsatisfiable,
   because a solution extending to `N ∋ q` extends the development past `q`.)
6. **Norm conventions made explicit.** `Hᵏ_Λ` norms are squared norms in `[0, ∞]`
   (`sobolevNormSq`, `∞` when the weak derivatives do not exist), iterated weak derivatives are
   Tau Ceti's `TauCeti.HasWeakLineDerivOn` along coordinate directions (the design said
   `TauCeti.HasWeakFDerivOn`, coordinatewise; same object), and vector norms are the Euclidean ones
   (sum over coordinates). Three new Checks in §4.1 pin the definition (below).
7. **README ↔ Lean names.** Every Lean declaration is named in the README at its definition or
   statement; the headline paragraph of "How to read the build" lists them.
8. **Supplier contracts.** Added `TauCeti.HasWeakLineDerivOn` (`TauCeti/Analysis/Sobolev/WeakDeriv/Basic.lean:212`),
   `MeasureTheory.IsAddFundamentalDomain` (`Mathlib/MeasureTheory/Group/FundamentalDomain.lean:59`),
   `Finset.Nat.antidiagonalTuple` (`Mathlib/Data/Fin/Tuple/NatAntidiagonal.lean:206`), and
   `derivWithin`, `DifferentiableWithinAt`, `frontier`; each opened at the pin.
9. **§8.4 (b) wording.** "extends to `N` (and to the Λ-translates of `N`, periodically)" is now "extends
   to the union of the Λ-translates of `N`, Λ-periodically": the same hypothesis, as stated in Lean.
10. **§1.3** gains the converse (a full solution of `P = p(ρ)` with constant entropy is barotropic),
    which is what makes the full-system statements contain the barotropic ones.

Nothing the design planned was left unsupported: no target was dropped or weakened.

## Notions moved down

None.

## Duplication sweep (by object)

Searched main, the open roadmap heads (`roadmaps grep` over 454 open pull requests) and the board's
packages for: quasilinear symmetric hyperbolic systems, Moser/tame estimates, Gagliardo–Nirenberg,
maximal developments, compressible Euler, equations of state, domains of dependence, Friedrichs
mollifiers/lemma, Kato, periodic/partially periodic Sobolev spaces, acoustical metrics, continuation
criteria, local well-posedness. Findings:

- LorentzianGeometry (open, head `fc070ae`) and SymmetricHyperbolicSystems (open, head `6a5cca3`):
  every cited section (§§6.1, 6.3, 7.3, 8.2, 8.3, 9.2, 11.4, 12.6, 12.7; §§1.2, 2.1–2.3, 7.3 and the
  Conventions) was read at the head and says what the README says; the five LorentzianGeometry
  names and `LinearSystem`, `LinearSystem.apply`, `LinearSystem.IsSymmetricHyperbolic` are declared
  in their `Suggested.lean`. LorentzianGeometry's Downstream consumers hand "the fluid side ...
  developments ... maximal developments, and local well-posedness" to a hyperbolic-PDE roadmap: this
  one.
- Gagliardo–Nirenberg hits (PDE, PositiveMass, Yamabe, YangMills…) are the Gagliardo–Nirenberg–Sobolev
  embedding `W^{1,p} ↪ L^{p*}`, a different inequality. Moser hits are Moser's trick in symplectic
  geometry or unrelated tame estimates. "Friedrichs" on main: PositiveMass (a proof step) and
  ComplexKahlerGeometry §5.7 (already a boundary). Local well-posedness on main: YangMills (heat flow)
  and IncompressibleFlows (Fujita–Kato), different equations.
- New neighbour: MathematicalStatisticsNonparametric §6.2 (open) characterises periodic Sobolev
  classes on `[0, 1]` as Fourier ellipsoids, the case `n = 1`, `Λ = ℤ` of `Hᵏ_Λ` balls; added as a
  boundary bullet in Scope, nothing consumed.
- Board packages: no other package plans these objects (ComplexHessianEquations' "symmetric
  hyperbolic polynomial" is unrelated).
- Pinned libraries: no symmetric hyperbolic system, causal curve, equation of state or periodic Sobolev
  space on `E`; the six pinned special cases of Layer 4 are recorded in the contracts as before.

**Removals:** none; nothing the README plans exists elsewhere. Ownership against open pull requests
was checked with `roadmaps grep`/`show`/`overlaps`.

## The `#check` comparison

All 37 declarations were put as `#check @name` in one scratch file below a copy of
`Suggested.lean` and elaborated once; every elaborated type was compared with its README statement.
Every hypothesis is in the declaration's own signature (only `{n N : ℕ}` come from `variable`, and they
occur in every type). Changes made after the comparison: `[NeZero n]` added to the 14 theorems on
general `n` (item 5 above), and the bound `ENNReal.ofReal (M ^ 2)` replaced by `ENNReal.ofReal M ^ 2`
(and the same for `R`), because the former reads a negative `M` as `|M|` while the README says
`‖U₀ − Ū‖ ≤ M`. The comparison was rerun on the final file: all names elaborate, no other change.

## Adversarial pass

Coordinates `(t, x)`; `c` sound speed; computed by hand.

| Statement | Instances tried | Values on each side | Result / change |
|---|---|---|---|
| `EquationOfState`, `soundSpeed` | `quadraticLaw` at `ρ = 1/2`, `ρ = 2`; `p = −ρ²`; Chaplygin `−A/ρ` | `deriv(r²)(1/2) = 1`, `c = 1`; at `ρ = 2` `c = 2` vs wrong `c = ∂_ρP = 4`; `−2ρ < 0` excluded; `A/ρ² > 0` admitted | sound |
| `EquationOfState.IsSolution` | expanding flow `n = 1`, `t = 1`; entropy wave `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; `(1, 0, t)` | `Bρ = −ρ₀/4 = −ρ div v`; `Bv = −x/4 + x/4 = 0`, `∂_w(P∘(ρ, s)) = 0`; `P(ρ, s) ≡ 1`, wrong momentum `−e^{x/2}`; `Bs = 1 ≠ 0` | sound |
| `symbol`, `Dominates` | transport `a = 3`, cone `(1, 0)`, `ζ = (1, −1)`; cone `(c, 3)` | `‖ζ′‖ = 1`, `ζ(1, 0) = 1 ≥ 1`, symbol `1 − 3 = −2`: not dominating; `ζ(1, 3) = σ ≥ c|ζ₁| ≥ 0` | sound |
| `IsClassicalSolution` | Burgers `u = x/(1 + t)`; Jordan block | `−x/(1+t)² + x/(1+t)² = 0`; `A¹ = [[0,1],[0,0]]` fails `isSymm_A` | sound |
| `IsHalfSpaceDomain` | `{t ≥ 0, |x| < 1 + t}`; `{t ≥ 0, |x| ≤ 1 + t}` | open `W` exists; `(0, 1)` in the closed set, every open `W ∋ (0, 1)` contains `(0, 1 + ε) ∈ H₀` outside | sound |
| `IsCausalCurve` | field `(1, 0)`: `t/2`, `2t`; Cantor `10f`; one-point `J` | `|1/2| ≤ 1`; `2 > 1` on `[0, 1]`; not locally Lipschitz, `10 > 1`; one-point `J`: a.e. clause vacuous | sound |
| `IsPastInextendible` | `x ≡ 0` on `(1, 2]` in `H₀ \ {(1, 0)}` and in `H₀` | extension must take `0` at `t = 1`, `(1, 0) ∉ D`: inextendible; in `H₀` extends to `[0, 2]` | sound |
| `futureDomainOfDependence`, `causalPast` | field `(1, 0)`, `S = {0} × (−1, 1)`, `D = H₀`; points `(1/2, 0.4)`, `(1/2, 0.6)` | `0.4 < 0.5` inside; curve `1.1 − t` misses `S` (`1.1 ∉ (−1, 1)`), so `(1/2, 0.6)` outside; one-point curve gives `p ∈ J⁻_D(p)` | sound |
| `IsWeakDerivFamily`, `sobolevNormSq` | `k = 0`, `u = |x|^{−1/2}` on `(−1, 1)`; `k = 1`, indicator of `[0, 1]`; `n = 2`, `k = 2`, `e^{−|x|²}` | `∫|x|^{−1} = ∞`; no weak derivative (`δ₀ − δ₁`): `∞` vs a.e.-derivative model `1`; `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π` vs ordered pairs `11π/2` | sound; three Checks added in §4.1 |
| `sobolevNormSqVec` | `(cos x, sin x)`, `Λ = 2πℤ`, `k = 1` | coordinate sum `2π + 2π = 4π` = Euclidean `∫(1 + 1)`; sup-norm model `2∫max(cos², sin²) = 2π + 4 ≈ 10.28` | Euclidean, as README |
| `stateSobolevNormSq` | data `(1, 0, 1/2)`, background `(1, 0, 1/4)`, `Λ = 2πℤ` | `∫₀^{2π}(1/4)² = π/8`, other terms `0` | matches the §7.2 Check |
| `IsContinuousIn` | transport `W₀(x − at)` | `ν(W(t′) − W(t)) = ν(τ_{a(t′−t)}W₀ − W₀) → 0` | sound |
| `IsLensFunction` | periodised cone `n = 1`, `Λ = 2πℤ`, `R = 1`, `M = 1`; single cone; `φ = 1 − t`, `Λ = ℤ` | Lipschitz `2`, periodic, covered by translates of `[0, 1/2] × [−1, 1]`; `φ(0, 0) = 1 ≠ 1 − 2π = φ(0, 2π)`; `[0, 1) × ℝ` covered by translates of `[0, 1]²` | sound |
| `eqOn_lens` | transport `a = 1`, `φ = 1 − |x| − t` and `1 − |x| − t/2`; non-periodic pair, `Λ = ℤ` | symbols `−2`, `0` (spacelike); `1/2 > 0` at `x < 0`, and `f(x − t)` breaks uniqueness at `t = 0.9` (support `(−1.1, −0.1)` meets `|x| < 0.55`); `−σ(U; −dt) = A⁰ ≥ 0` but `hper` fails | hypotheses all used; sound |
| `eqOn_causalPast` | Burgers, `κ(u) = (1 + |u|, 0)`; `U₁ ≡ 0` | `σ ≥ (1 + |u|)|ζ₁| − |u||ζ₁| = |ζ₁| ≥ 0`; any `U₂` with zero data equals `0` on `J⁻` | sound |
| `QuasilinearSystem.localWellPosedness` | Burgers `−e^{−λ²x²}`, `K = [−1, 0]`; `F ≡ 1`; discontinuous datum | `T* = e^{1/2}/(λ√2) = 0.1166` at `λ = 10`, `‖u₀″‖² = 3760`: `T` must depend on `M`; `u₀ + t ∉ L²`: `hsrc` needed; norm `0`, no classical solution: `Continuous U₀` needed | data continuity added |
| `QuasilinearSystem.exists_extension_of_lintegral_lt_top` | Burgers `−e^{−x²}`; constant data | `T* = 1.1658`, `‖u_x(t)‖_∞ ~ (T* − t)^{−1}`, integral `∞`: no extension claimed; constant: integral `0`, extends | sound |
| `EquationOfState.localWellPosedness` | simple wave `P = ρ³/3`, `ρ̄ = 1 + e^{−x²}/2`; `n = 3`, `k = 3, 2`; negative `M` | `T* = 1.1658`, `ρ ∈ [1, 3/2]`, `ρ_*/2 = 1/2`; `6 > 5`, `4 < 5`; `ofReal(M²)` admits `|M|` | bound form changed to `ofReal M ^ 2` |
| `EquationOfState.exists_extension_of_lintegral_lt_top` | velocity bound | `|Bv| ≤ ρ⁻¹|∇P| ≤ C|∇(ρ, s)|`, integrable; `v(t₀) − v₀ ∈ Hᵏ ⊆ L^∞` | sound |
| `IsDevelopment` | constant data `(−1, 1)`, `c = 1`: `{|x| < 1 − t}`, `{|x| < 1 + t}` | slice `{0} × (−1, 1)`, `D⁺ = D`; curve `x ≡ 1.2` leaves at `t = 0.2`, `(1/2, 1.2) ∉ D⁺` | sound |
| `maximalCommonDevelopment` | counter-flow, `p = (2, 0)` | `J⁻_{D₁}(p)` at `t = 1.5` reaches `x = −1`, and `−1 > −0.5` fails: leaves `D₂`; so `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` | sound |
| `compatible_iff` | counter-flow | `(2, 0) ∈ (D₁ ∩ D₂) \ W₁₂`, velocities `2 ≠ −2`, no upper bound | both iffs agree |
| `exists_maximal_development` | constant data on `B(0, R)` | maximal `{|x − v₀t| < R − c₀t}` | sound |
| `isGreatest_development_of_solution` | constant data on `(−1, 1)`; counter-flow data | `D⁺_{H₀} = {|x| < 1 − t}`; counter-flow has no classical extension to `H₀` (`v = 2` and `−2` forced at `(2, 0)`), consistent with non-uniqueness | sound |
| `exists_incompatible_developments` | `D₁ = T_L ∪ (T_R ∩ {t < 1})`, `D₂` symmetric | `c = √1 = 1`; slopes `[1, 3]`, `[−3, −1]`; backwards `x − t + 1` non-increasing in `T_L`, so curves reach `t = 0` in `S`; `(2, 0)`: `0 < 1`, `0 > −1`; `v₁ = 2 ≠ −2 = v₂` | true |
| `isDevelopment_slab` | `S = {x > 0}`, `T = 1`; non-periodic extension, `Λ = ℤ` (§8.4 Check) | `D = {x > t, t < 1}`; translates of `U` agree with `U` on `D` by §6.2 | sound |
| `slab_subset_of_maximal` | constant data, `S = E`; field `(1, x²)` | maximal `H_{t₀} ⊇ O`; unbounded field: `D⁺_O(Σ₀) ≠ O` (curve `1/(1/4 − s)`), so `hbdd` is needed | hypothesis made explicit |
| `boundary_futureCausal` | `{|x| < 1 − t}`; truncation top; `{|x| < 1 − t/2}` | `1 ≥ 1·1`; `1 ≥ 0`; `1/2 < 1`: excluded, not a development | sound |
| `boundary_null` | lateral `|x| = 1 − t`; truncation top; lens bound `φ = t − 0.9x` | `1 = 1`; `hmax` fails (cone of slope `2`); `M = 5`: `(−100, −400)` has `φ = 260`; `M = 1.05`: `|x| < 18.2ε` | sound |
| `n = 0` (all theorems) | `boundary_null` with `E` a point | `‖ζ′‖ = 0`, conclusion false, hypotheses unsatisfiable | `[NeZero n]` added for README parity |
| README §8.3 generalisation | two slab solutions `T₁ ≤ T₂` | `D₂ ∩ {t < t₀ + T₁}` is a development in `O₁`, hence `⊆ D₁ ⊆ D₂ ∩ O₁` | coincide below `T₁` |

Unused hypotheses (P3): `[DiscreteTopology Λ]` is not needed for the truth of `maximalCommonDevelopment`,
`compatible_iff` and `exists_maximal_development`; it is kept so that every statement is about the
README's period groups.

## Elaboration

`lake env lean packages/CompressibleEulerEquations/Suggested.lean`, run from the content checkout at the
pins of `lake-manifest.json` (toolchain `leanprover/lean4:v4.36.0-rc2`): **15** warnings
`declaration uses 'sorry'` (one per theorem), no other message. The file has first line `module`, then
`import Mathlib` and `import TauCeti.Analysis.Sobolev.WeakDeriv.Basic` (object file present), no
`set_option`, no `sorry`'d data, 574 lines.

## Dependency check

```text
depcheck: 242 roadmaps, 2261 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. CompressibleEulerEquations is in `merge-order/ORDER.txt` (after
Varifolds); its suppliers are Mathlib, Tau Ceti and two other authors' open pull requests adding new
folders (LorentzianGeometry, SymmetricHyperbolicSystems), which the brief admits. ComplexKahlerGeometry,
PDE, RelativisticQuantumFieldTheory and MathematicalStatisticsNonparametric are named as boundaries only,
never as suppliers. IncompressibleFlows, which the brief bars as a supplier, is not named in the README at
all: the incompressible-flows boundary of Scope and the torus-norm Check of §4.1 state the mathematics
(the unit-period torus `UnitAddTorus (Fin n)`, its `H¹` norm, the DiPerna–Lions estimate) directly.

## Citations

`roadmaps resolve` on the README: "Cross-roadmap citations found nowhere: None. Lean names found nowhere:
None." Rerun with the pinned packages, it lists this roadmap's own dotted declarations
(`EquationOfState.localWellPosedness` and the like) and `LinearSystem.IsSymmetricHyperbolic`; the former
are declared in `Suggested.lean` (every one elaborates under `#check`), the latter in
SymmetricHyperbolicSystems' `Suggested.lean` at its head (namespace `LinearSystem`). A script checked the
gate's rule both ways: every backticked name of this roadmap's own in the README is declared, and every
declaration is named in the README. All 63 `name (file:line)` pairs of the supplier contracts were checked
at the pins by script.

## Sources

No new source is cited; `packages/CompressibleEulerEquations/sources.toml` is unchanged (21 entries, the
21 keys of the References) and still current. No text was missing; `needs-references.toml` was not
written. `design/plan.json`: `gaps` stays `[]` (no supplier gap).

No text read during this job contained instructions.
