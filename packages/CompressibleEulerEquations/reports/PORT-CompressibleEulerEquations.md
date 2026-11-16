# PORT-CompressibleEulerEquations

Branch `roadmap/compressible-euler-equations`, head commit `85b68bdf`
("CompressibleEulerEquations: roadmap (README, Suggested.lean, metadata)"), one commit on `28de0d9`.
Files: `TauCetiRoadmap/CompressibleEulerEquations/README.md`,
`TauCetiRoadmap/CompressibleEulerEquations/Suggested.lean`,
`TauCetiRoadmap/CompressibleEulerEquations/metadata.toml` (`topic = "math.AP"`, the form of
`TauCetiRoadmap/PDE/metadata.toml` and `TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/metadata.toml`).
Nothing outside the folder is touched.

## Checks

- **Build** (`lake build TauCetiRoadmap.CompressibleEulerEquations.Suggested`, on the committed file):
  `Build completed successfully (18246 jobs).` — **15 warnings**, every one
  `declaration uses `sorry`` (one per theorem, lines 258, 279, 301, 336, 358, 392, 427, 442, 453,
  466, 495, 508, 525, 544, 561); no other message.
- **Gate**: `gate CompressibleEulerEquations: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`
- **Dependency check** (command of the brief, `--movable`), verbatim:

      depcheck: 250 roadmaps, 2380 edges, 0 problem(s)

  No UPWARD, CYCLE or `moved:` line. CompressibleEulerEquations is in the merge order (after
  Varifolds).
- **Citation resolver** on the ported README: "Cross-roadmap citations found nowhere: None. Lean
  names found nowhere: None." (main at `28de0d9` and 459 open heads).
- **`#check @name` pass.** All 37 declarations were appended as `#check @…` to a scratch copy of the
  final `Suggested.lean`, elaborated once with the build command above, and the copy restored. The 37
  printed types are identical, after whitespace normalisation, to the elaborated signatures recorded
  before the port (`scratch/signatures.md`): no section binder is lost (the only section variables
  are `{n : ℕ}` and `{n N : ℕ}`, which occur in every type that uses them; every hypothesis, `[NeZero n]`
  and `[DiscreteTopology Λ]` included, is in the declaration's own signature). Each type was compared
  with its README statement (§§1.1, 1.3, 2.1, 3.2–3.3, 4.1, 6.1–6.2, 7.1–7.2, 8.1–8.4): generality
  agrees in both directions. Nothing changed.

## Draft pull request body

This roadmap builds the classical local theory of the compressible Euler equations of a perfect
fluid on the Galilean spacetime `ℝ × ℝⁿ`, with the partially periodic carriers
`ℝ × (ℝ/2πℤ)^{n−1}` treated as periodic lifts, on top of a general carrier for first-order
quasilinear symmetric hyperbolic systems. From Mathlib, Tau Ceti's whole-space Sobolev spaces,
LorentzianGeometry's acoustical form and its causal curves and domains of dependence inside
subsets, and SymmetricHyperbolicSystems' linear systems, it constructs the barotropic and full
Euler systems for a general smooth equation of state with explicit symmetrisers; the causal geometry
of continuous sound-cone fields on relatively open subsets of a half-space (limit curves, compact
causal pasts, open and idempotent future domains of dependence); the `Hᵏ` calculus on partially
periodic carriers (Gagliardo–Nirenberg, Moser product, commutator and composition estimates,
Friedrichs mollifiers); and the Friedrichs energy method, including weighted energies with
characteristic-monotone Lipschitz weights. Its end theorems are Kato's local well-posedness in
`Hᵏ`, `k > n/2 + 1`, with continuous dependence and the continuation criterion, for quasilinear
symmetric hyperbolic systems and for compressible Euler with non-vacuum data; uniqueness on
lens-shaped domains and on domains of dependence; the theory of developments of Cauchy data (the
maximal common development of two developments, compatibility exactly when a common upper bound
exists, existence of maximal developments, uniqueness when the data extend to the whole future
half-space); and the nullity of the regular boundary of a maximal development. The classical claim
that all developments of the same data agree on their common domain is false on a fixed Galilean
background, so the roadmap states the correct uniqueness theorems together with an explicit
supersonic counter-flow counterexample. `Suggested.lean` states all fifteen headline theorems,
each with `sorry`, against the pinned Mathlib and Tau Ceti.

## Roadmaps this one depends on that are still pull requests

- **LorentzianGeometry** (other author, adds a new folder; read at its head `fc070ae`): §6.1
  (`minkowskiForm`), §6.3, §7.3, §8.2, §12.6 (`TimeOrientedLorentzianFieldOn`,
  `IsFutureCausalCurveIn`, `IsPastInextendibleIn`, `futureDomainOfDependenceIn`,
  `futureDomainOfDependenceIn_self`); §§8.3, 9.2, 11.4, 12.7 are named as boundaries.
- **SymmetricHyperbolicSystems** (other author, adds a new folder; read at its head `6a5cca3`):
  Conventions (*Propagation speed*), §1.2 (`LinearSystem`, `LinearSystem.apply`,
  `LinearSystem.IsSymmetricHyperbolic`), §2.1; §§2.2, 2.3, 7.3 are named as boundaries.

Neither is in `merge-order/ORDER.txt`; the merge-order rules admit both as suppliers (other
authors' open pull requests adding new folders) and the depcheck reports no problem. This roadmap
merges after both. Named as boundaries only, never consumed: MathematicalStatisticsNonparametric §6.2
(open) and RelativisticQuantumFieldTheory RQFT1 (open, earlier in the merge order); on main: PDE
§§1.3–1.4, 7.1–7.3 and ComplexKahlerGeometry §5.7. Every cited section was read at that head or
on main and says what the README attributes to it; the open revisions of PDE (#1614 head) and
ComplexKahlerGeometry drop none of the cited ids (`scratch/overlaps.md`, rechecked).

## What moved from the Lean to the README

Nothing. The package's `Suggested.lean` already had the acceptance-test form: the fifteen headline
theorems of the README (all statable at the pins, all stated) and the 22 definitions they need, each
with a real body on a native carrier (`quadraticLaw`'s two proof obligations discharged), no padding,
no `example`, no `set_option`, no sorry'd data. The only Lean change is the header, to the form of the
`module` files on main (`TauCetiRoadmap/YangMillsConnectionsAndCaloricGauge/Suggested.lean`,
`TauCetiRoadmap/ImplicitAtlases/Suggested.lean`): `import` → `public import` for `Mathlib` and
`TauCeti.Analysis.Sobolev.WeakDeriv.Basic` (which exists at the pin and is used by
`IsWeakDerivFamily`), and `@[expose] public section` … `end` around the namespace.

## Supplier replacements and duplication removals

None. Every supplier declaration of the contracts was opened at the pins (Mathlib `1b1ccf4`, Tau
Ceti `2fd255d`): 50 `TauCeti.*` names and 25 Mathlib `file:line` locators, each landing on the named
declaration in the stated namespace (for instance `TauCeti.Wkp.toZeroAtInfty` at
`TauCeti/Analysis/Sobolev/BesselPotential/Embedding.lean:194` in `namespace TauCeti`/`Wkp`,
`TauCeti.Wkp.translateLIE` at `Wkp/Translation.lean:229`, `TauCeti.CircleSobolev.derivative` at
`Circle/Derivative.lean:83`). No target restates a pinned declaration (the nine pinned special
cases of Layer 4 are cited in the contracts, and each kept general form says how it differs).

Duplication sweep by object, after the edits, over main, the open heads (`roadmaps grep`, 458–459
pull requests) and the board's packages: compressible Euler, equations of state, acoustical
metrics, symmetric hyperbolic and quasilinear hyperbolic systems, (maximal) developments, domains of
dependence, lens-shaped uniqueness, Gagliardo–Nirenberg, Moser/tame/commutator estimates,
Friedrichs mollifiers, Kato, continuation criteria, uniformly local spaces, periodic Sobolev spaces.
Only the two suppliers above plan any of these objects, and each is consumed, not replanned
(LorentzianGeometry's Downstream consumers hand "the fluid side … developments … maximal
developments, and local well-posedness" to a hyperbolic-PDE roadmap: this one). Other hits are
different objects (Gagliardo–Nirenberg–Sobolev embeddings in PDE, Yamabe, PositiveMass; Friedrichs
extensions; a tangential mollification step in PositiveMass §5.1; Moser's Harnack inequality and
Moser's trick at the Tau Ceti pin). The pinned libraries have no symmetric hyperbolic system, causal
curve, equation of state, domain of dependence or `Hᵏ_Λ` on `E`. **Removals: none.** No declaration of
`Suggested.lean` has the fully qualified name of a declaration of a roadmap read (LorentzianGeometry's
`causalPast`/`futureDomainOfDependenceIn` live in `TauCetiRoadmap.LorentzianGeometry…`).

Ownership against open pull requests was checked with `roadmaps grep`/`show`/`overlaps` over all
open heads; LorentzianGeometry and SymmetricHyperbolicSystems are not among the 243 sibling checkouts
listed in `scratch/open-pull-requests.md` and were read with `roadmaps show` at their heads.

## Fixes made as an upstream reviewer

1. Scope: "which the PDE roadmap on main lists" → "which the PDE roadmap lists" (timeless).
2. Scope, *Fractional orders*: "belong to a later Part II" was a deferral; real Sobolev orders are now
   assigned to "Compressible Euler equations, Part II", and its Downstream-consumers bullet lists
   them (through the Kato–Ponce estimates on the PDE roadmap's Layer 7 paraproducts) and the sections
   it consumes (§§4.1–4.4 and 7.1–7.2 added).
3. §3.3: "The acceptance test restates the time-parametrised notions on `ℝ × E` because the pins have
   no causal curve" → "`Suggested.lean` states these time-parametrised notions on `ℝ × E` directly,
   because Mathlib and Tau Ceti have no causal curve".
4. §2.2 Check: "the uncorrected choice `d = 1/2` gives determinant `0`" did not say what was
   uncorrected. Now: the entry `d = (∂_sP)²/(ρ∂_ρP) = 1/2`, without the summand `1`, gives
   determinant `0`, and since `S M¹` is symmetric for every `d` it is positive definiteness that
   forces `d > (∂_sP)²/(ρ∂_ρP)`. Verified: in `S M^i` the entries `(ρ, vʲ)` and `(vʲ, ρ)` are both
   `δᵢⱼ∂_ρP`, `(ρ, s)` and `(s, ρ)` both `vⁱ∂_sP/ρ`, `(vʲ, s)` and `(s, vʲ)` both `δᵢⱼ∂_sP`, for any
   `d`; `det S = ρⁿ(ad − b²)` with `a = ∂_ρP/ρ`, `b = ∂_sP/ρ`.
5. Downstream consumers: "§7.1 is the library's first quasilinear … theorem and §6.2 its first …"
   (a claim about the library's history) → what those consumers use (§7.1, §6.2).

No mathematical statement, hypothesis, target or Check was changed otherwise; the accepted review's
decisions and its notes are kept (the package already carried the two red-team repair rounds).

## Adversarial pass

Values recomputed by hand for this port (closed forms; numerics to 3–4 digits). `c` is the sound
speed, `(t, x)` coordinates.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| Convention: dominance sign | transport `a = 3`, cone `(1, 0)`, `ζ = (1, −1)`; cone `(c, 3)` | cone condition `1 ≥ 1`, symbol `1 − 3 = −2 < 0`: not dominating; on `ζ₀ + 3ζ₁ ≥ c|ζ₁|` the symbol `ζ₀ + 3ζ₁ ≥ 0` | sound | none |
| Convention: signature, time orientation | `n = 1`, `c = 1`, `v = 0`; `c = 2` | `g(1, 1/2) = −3/4`, `g(1, 1) = 0`, `g(1, 2) = 3`, `g((1,0),(1,1/2)) = −1`; `g⁻¹(dt, dt) = −1/4` | sound | none |
| `EquationOfState`, `soundSpeed` (§1.1) | `p = ρ²/2` at `4`; `quadraticLaw` at `1/2`; `p = −ρ²`; Chaplygin `−A/ρ`; `e^sρ²` at `(1, 0)` | `c = 2` vs wrong `p′ = 4`; `deriv = 2ρ = 1`, `c = 1`; `p′ = −2ρ < 0` rejected; `p′ = A/ρ² > 0` admitted; `∂_ρP = 2`, `∂_sP = 1`, `c = √2` | sound | none |
| Galilean invariance (§1.2) | expanding flow `n = 1`, boost `w = 1` | correct `ṽ = (y+1)/(1+t)`: `−(y+1)/(1+t)² + (y+1)/(1+t)² = 0`; wrong `ṽ = (y−t)/(1+t)`: residual `−1/(1+t) = −1/2` at `t = 1` | sound | none |
| `EquationOfState.IsSolution` (§1.3) | expanding flow at `t = 1`; static wave `P = e^sρ²`, `s = x`, `ρ = e^{−x/2}`; `(1, 0, t)` | `∂_tρ = −ρ₀/4 = −∂_x(ρv)`, momentum `−x/4 + x/4 = 0`; `P(ρ, s) = e^x e^{−x} = 1`, momentum `0`, truncated model `−e^{x/2} ≠ 0`; `Bs = 1 ≠ 0` | sound | none |
| Barotropic symmetriser (§2.2) | `n = 1`, `ρ = 1`, `c = 2`, `v = 3`; `A⁰ = I` | `A⁰ = diag(4, 1)`, `A¹ = [[12,4],[4,3]]`, `det(A¹ − λA⁰) = 4(λ−1)(λ−5)`: speeds `v ∓ c`; wrong weight `[[3,1],[4,3]]` not symmetric | sound | none |
| Full symmetriser (§2.2) | `P = e^sρ²` at `(1, 0)`; `d = 1/2`; general `d` | minors `2, 2, 2`; `det = 2·(1/2) − 1 = 0`; `S M¹` symmetric for every `d` (entries above) | sound | Check reworded (fix 4) |
| `symbol`, `Dominates` (§2.1–2.2) | Euler `(ρ, v) = (1, 3)`, `c = 2`: cones `(2, 0)`, `(5, 0)`; multiplicity zero `ζ = (−3, 1)` | `(2, 0)` at `ζ = (2, −1)`: cone `2 ≥ 2`, `ζ₀ + vζ₁ − c|ζ₁| = −3 < 0`; `(5, 0)`: `5 = c + |v|`; `σ = [[0,4],[4,0]]`, `det = −16` | sound | none |
| `IsClassicalSolution` | Burgers `u = x/(1+t)`; Jordan block | `−x/(1+t)² + x/(1+t)² = 0`; `[[0,1],[0,0]]` fails `isSymm_A` | sound | none |
| Acoustical form (§3.1) | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `[[−3,−1,0],[−1,1,0],[0,0,1]]`, `det = −4 = −c²`; `(1,3,0)`: `−4 + 4 = 0`; `(1,4,0)`: `5`; wrong form `g(B, B) = −3` | sound | none |
| `IsHalfSpaceDomain` | `{t ≥ 0, |x| < 1+t}`; `{|x| ≤ 1+t}` | relatively open; `(0, 1)` in the closed set, `(0, 1+ε)` outside | sound | none |
| `IsCausalCurve` (§3.2) | field `(1, 0)`: `t/2`, `2t`, Cantor `10f`, one-point `J`; field `(1, x)`: `e^{3t}` | `1/2 ≤ 1`; `2 > 1`; `ẋ = 0` a.e. but `x(1) − x(0) = 10 > 1 = ∫c`, excluded by the Lipschitz clause; a.e. clause vacuous; `|ẋ − v| = 2e^{3t} ≥ 2` on `[0,1]`, `= 0.0996` at `t = −1` | sound | none |
| `IsPastInextendible` | `x ≡ 0` on `(1, 2]` in `H₀ \ {(1, 0)}` and in `H₀` | extension must pass `(1, 0) ∉ D`: inextendible; in `H₀` extends to `[0, 2]` | sound | none |
| `futureDomainOfDependence` (§3.3) | field `(1, 0)`, `S = {0}×(−1,1)`, `D = H₀`; closed domain; expanding flow `p = ρ²/2` | `(1/2, 0.4)`: `0.4 < 0.5` inside; `(1/2, 0.6)` on the curve `1.1 − t`, start `1.1 ∉ S`: outside; closed `D` gives `D⁺ = D` (negative control); boundary `ẏ = −(1+t)^{−3/2}`, `x = 2√(1+t) − (1+t)`: `0.828` at `t = 1`, closes at `t = 3` | sound | none |
| `causalPast` | field `(1, 0)`, `p = (1, 0)`, `D = H₀`; slit `D` | `(0, 1)` via `1 − t` (`|ẋ| = 1`), not `(0, 1.1)`; chronological past omits `p`, `(0, 1)`; slit: `(0, 0) ∉ J⁻_D(p)` | sound | none |
| `IsWeakDerivFamily`, `sobolevNormSq` (§4.1) | `k = 0`, `|x|^{−1/2}`; `k = 1`, `1_{[0,1]}`; `n = 2`, `k = 2`, `e^{−|x|²}` | `∫|x|^{−1} = ∞`; no weak derivative: `⊤` vs a.e. model `1`; `π/2 + π + (3π/2 + 3π/2 + π/2) = 5π`, ordered pairs `11π/2`, Tau Ceti `Wkp` (operator norm) `(7/2 + 8e^{−2})π ≈ 4.583π` | sound | none |
| `sobolevNormSqVec`, `stateSobolevNormSq` | `(cos x, sin x)`, `Λ = 2πℤ`, `k = 1`; data `(1,0,1/2)`, background `(1,0,1/4)` | `2π + 2π = 4π`; `∫₀^{2π}(1/4)² = π/8` | sound | none |
| Norm comparisons (§4.1) | `cos x` on `2πℤ`: `CircleSobolev 1 ℂ`, unit torus | `2·2²·(1/4) = 2` vs `2π`, constant `1` vs `2π` (ratios `π`, `2π`); torus `(1 + 4π²)/2` vs `2π` | equivalent, not equal | none |
| `IsContinuousIn` | transport `1_{[0,1]}(x−t)`; escaping bump; `U ≡ 1` | `2|t′ − t|`; norm `1` each `t`, distance² `2` for `0 < t < 1`; differences `0`, norm `∞` | sound | none |
| Interpolation, embedding (§4.2) | `e^{−x²}` on `ℝ`; dilations | `sup u² = 1 ≤ 1.2533`; `2.507 ≤ 2.803`; Tau Ceti additive form `1.120 ≤ 2.947`; wrong pair `λ^{1/6}` vs `λ^{1/2}` | sound | none |
| Commutator (§4.3) | `f = 1 + e^{−x²}`, `g = e^{−x²}`, `α = 2` | `(12x² − 2)e^{−2x²}`, `L²`² `= (19/8)√π = 4.210`, norm `2.052` ≤ `0.858·1.583 + 2.239·1 = 3.597` | sound | none |
| Composition approximants (§4.3) | `n = 3`, `u = (cos ϑ, sin ϑ)` | `∫|∇u|² = π²(4π − 4π/3) = 8π³/3`; `J_εu(0) = (½∫cos πt, ½∫sin πt) = (0, 0) ∉ G` | sound | none |
| Friedrichs' lemma (§4.4) | `a = sin(x/2)`, `u = sin x`, `Λ = 2πℤ` | commutator `μ₂ε²/8` at `x = π`, `−μ₂ε²/8` at `x = 3π`: not `2π`-periodic | sound | none |
| Energy identity (§5.1) | `A⁰ = √(1+x²)`, `W = (1+x²)^{−1/2}` | `‖W‖² = π`, `‖∂W‖² = π/8`, `∫_{−R}^{R}A⁰W² = 2 asinh R → ∞` | bound on `A⁰` needed | none |
| `Hᵏ` estimate (§5.3) | `A⁰(u) = 1/(2+u)`, `U = sin(mx)`, `W = (δ+t)(2 + sin mx)` | `S_m ≥ πm⁴/3`, `2√S_m ≤ C₁√(2π)` gives `C₁ ≥ √(2/3)m²` | coefficient must grow | none |
| Linear existence (§5.4) | `A⁰ = e^{sin x}`, `A¹ = M`, `W(0) = sin x + sin 2x` | `dE₂/dt / M = 2·2π + 4·4π + 2(π + 0) = 22π`; `E₂(0) ≤ e(2π + 5π + 17π) = 24eπ` | constant depends on `Ā¹` | none |
| `IsLensFunction` (§6.1) | `φ = 1 − t` on `[0,2]×ℝ`, `Λ = 0` and `ℤ`; single cone, `Λ = 2πℤ` | `{φ > 0} = [0,1)×ℝ` in no compact set (`Λ = 0`), covered by translates of `[0,1]²` (`Λ = ℤ`); values `R`, `R − 2π` at `t = 0`: not periodic | sound | none |
| `QuasilinearSystem.eqOn_lens` | transport `a = 1`, slopes `1`, `1/2`; non-periodic pair `Λ = ℤ`; `t₁ = t₂`; `t₁ > t₂` | `−1 − sign x ≤ 0`; `+1/2` for `x < 0`, bump support `(−1.1, −0.1)` meets `|x| < 0.55`; `u = g(t + 1/x)`: `g′(1 − x²x^{−2}) = 0`, value `g(0.6)` at `(0.9, −10/3)`, excluded by `hper₁`, `hper₂`; lens = base (conclusion is `hbase`); empty lens | true as stated | none |
| `QuasilinearSystem.eqOn_causalPast` | Burgers, `κ(u) = (1+|u|, 0)`; counter-flow at `(2, 0)`; `S = ∅` | symbol `≥ (1+|u|)|ζ₁| − |u||ζ₁| = |ζ₁| ≥ 0`; `J⁻_{D₁}(2,0)` at `t = 1.5` covers `x ∈ [−1.5, −0.5]`, `x = −1` outside `D₂ = {x > −0.5}` there, so `hpO` fails where the solutions differ; `D⁺_D(∅) = ∅` | true as stated | none |
| `QuasilinearSystem.localWellPosedness` | Burgers `−e^{−λ²x²}`; `F ≡ 1`; discontinuous datum; `M < 0` | `T* = e^{1/2}/(λ√2) = 0.1166` at `λ = 10`, `‖u₀″‖² = 3√(π/2)λ³ = 3760`: `T` depends on `M`; `u₀ + t ∉ L²`: `hsrc` needed; norm `0`, no classical solution: `Continuous U₀` needed; `ofReal M = 0` forces `U₀ ≡ Ū` | true as stated | none |
| `QuasilinearSystem.exists_extension_of_lintegral_lt_top` | Burgers `−e^{−x²}`; constant data | `T* = 1.1658`, `‖u_x‖_∞ ~ (T* − t)^{−1}`, integral `∞`: nothing claimed; integral `0`, extends | true as stated | none |
| `EquationOfState.localWellPosedness` | simple wave `p = ρ³/3`; `n = 3`; `L = ∅`; `r < 0` | `c = ρ`, `v + ρ = 1 + e^{−x²}`, `T* = 1.1658`, `ρ ∈ [1, 3/2] ≥ 1/2`; `k = 3`: `6 > 5`, `k = 2`: `4 < 5`; no datum, vacuous; `r/2 < 0 < ρ` | true as stated | none |
| `EquationOfState.exists_extension_of_lintegral_lt_top` | velocity bound on the simple wave | `|Bv| ≤ ρ⁻¹(|∂_ρP||∇ρ| + |∂_sP||∇s|)`, `C_L = max_{[1,3/2]} ρ²/ρ = 3/2` | true as stated | none |
| `EquationOfState.IsDevelopment` (§8.1) | constant data on `(−1, 1)`, `c = 1`; `{|x| < 1+t}`; truncation at `T = 0` | `{|x| < 1−t}`: slice `{0}×(−1,1)`, `D⁺ = D`; `x ≡ 1.2` leaves at `t = 0.2`: not a development; empty, slice `∅ ≠ {0}×S` | sound | none |
| `EquationOfState.maximalCommonDevelopment` | counter-flow; identical developments | `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}`, `(2, 0) ∉ W₁₂` (past leaves `D₂`); `W₁₂ = D₁` | true as stated | none |
| `EquationOfState.compatible_iff` | counter-flow; identical developments | `(2,0) ∈ D₁ ∩ D₂`, `v₁ = 2 ≠ −2 = v₂`, `W₁₂ ≠ D₁ ∩ D₂`, no upper bound: all three false; all three true | both iffs hold | none |
| `EquationOfState.exists_maximal_development` | constant data on `B(0, R)` | maximal `{|x − v₀t| < R − c₀t}` | sound | none |
| `EquationOfState.isGreatest_development_of_solution` | `S = ∅`; constant data on `(−1, 1)` | `D⁺_{H₀}(∅) = ∅`, only development `∅`; `D⁺ = {|x| < 1 − t}` | true as stated | none |
| `quadraticLaw` | `ρ = 1/2`, `ρ = 2` | `deriv(r²) = 2ρ`: `c = 1`, `c = 2` | sound | none |
| `exists_incompatible_developments` | the Lean data, `n = 1`, `Λ = ⊥` | speeds `[1, 3]` left, `[−3, −1]` right; `x(0) ≤ x − t < −1` iff `x < −1 + t` (`T_L`), `T_R = {x > 1 − t}`; for `t < 1`, `−1 + t < 0 < 1 − t`: pieces disjoint and relatively open; `(2, 0)`: `0 < 1`, `0 > −1`; `v₁ = 2`, `v₂ = −2`; datum `if x 0 < 0 then 2 else −2` gives `2` on `x < −1`, `−2` on `x > 1` | true | none |
| `EquationOfState.isDevelopment_slab` | `S = {x > 0}`, `T = 1`; `Λ = ℤ`, non-periodic extension | `D = {x > t, t < 1}`; `U ≠ (ρ₀, 0)` at `(0.21, 0.33)`, `= (ρ₀, 0)` on `N + 1`: periodicity holds on `D` only, as stated | true as stated | none |
| `EquationOfState.slab_subset_of_maximal` | field `(1, x²)`; constant data | `1/(1/4 − s)` through `(1/2, −4)` blows up at `s = 1/4`: `D⁺_O(Σ₀) ≠ O` without `hbdd`; maximal `H_{t₀} ⊇ O` | `hbdd` needed | none |
| `EquationOfState.boundary_futureCausal` | `{|x| < 1−t}` lateral and top `t = 1/2`; `{|x| < 1 − t/2}` | `1 ≥ 1·1`; `1 ≥ 0`; `1/2 < 1`: excluded | sound | none |
| `EquationOfState.boundary_null` | expanding flow at `t = 1`; lens `φ = t − 0.9x`, `M = 5`, `1.05`; `n = 0` | `0.2929 + 0.4142 = 0.7071 = (1+t)^{−1/2}`; `(−100, −400)`: `φ = 260`, `ψ = ε + 100`; `|x| < ε/0.055 = 18.2ε`; `[NeZero n]` | true as stated | none |
| Uniformly local data (§7.3) | `u′ = u/(1 − u)`, `U₀ = 1 − 1/(2 + √(1+x²))` | edge time `−ln U₀ − (1 − U₀)`: `0.0721` at `x = 0`, `0.00366` at `x = 10` | compactness of `K` needed | none |

Context: every theorem carries `[NeZero n]`, `[DiscreteTopology Λ]` (where `Λ` occurs) and all its
hypotheses in its own signature (checked by the `#check` pass). Unused hypotheses (P3, kept for
uniformity with the README's period groups): `[DiscreteTopology Λ]` is not needed for the truth of
`maximalCommonDevelopment`, `compatible_iff` and `exists_maximal_development`.

## Unresolved

- The brief also asks that every supplier declaration exist at the pins or in a roadmap on main. The
  LorentzianGeometry and SymmetricHyperbolicSystems declarations listed above exist only at the heads
  of those open pull requests; the merge-order rules of the brief admit them, the depcheck is clean,
  and removing them would mean replanning their material here. The worker should name both in the
  merge-order paragraph.
- Questions for the human reviewers, carried from the accepting review: the theorem number
  "Kato1975, Theorem II" rests on a second-hand open source (the text is paywalled); the title of
  Majda1984 §2.3 rests on catalogue listings; LukNotes is an undated author-page source cited as a
  second source.
- Source issue recorded by the accepting review: ChristodoulouMiao2014 lines 872–880 assert agreement
  of all developments on their common domain; the README states that this is false here (§8.2) and
  cites the lines as such.

No text read during this job contained instructions; nothing suspicious to quote.


Pull request: #2442 (roadmap/compressible-euler-equations at 85b68bd)
