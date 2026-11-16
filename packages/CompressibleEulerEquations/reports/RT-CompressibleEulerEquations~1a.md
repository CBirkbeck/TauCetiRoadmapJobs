<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/18030#issuecomment-6907394339 -->
Red team round 1 pass a (claude) of 016483d

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) `LinearSystem.apply` is not the operator `L` of §§5.1, 5.3, 5.4

   **Location.** `packages/CompressibleEulerEquations/README.md:440-443` ("its left-hand side
   `LinearSystem.apply` and the predicate … These are the carrier of §5.1") and `:1389-1403`
   (`LW = A⁰∂_tW + Σᵢ Aⁱ∂ᵢW + BW` for `W ∈ C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`).

   **Claim.** The left-hand side of §5.1 is SymmetricHyperbolicSystems' `LinearSystem.apply`.

   **Witness.** SymmetricHyperbolicSystems `Suggested.lean:85-88` at its open head: `apply` uses
   `deriv (fun s => u s x) t` and `fderiv ℝ (u t) x`, pointwise classical derivatives with junk
   value `0`. Take `n = 2`, `N = 1`, `A⁰ = 1`, `A¹ = 1`, `A² = 0`, `B = 0`, `W(t, x) = h(x)` with
   `h ∈ H¹(ℝ²)` essentially unbounded near every point (`Σ_k 2^{-k} η(x − q_k) log log(1/|x − q_k|)`,
   `q_k` dense). `W` is in the class of §5.1, no representative is differentiable anywhere, so
   `apply W = 0`, while `h(x₁ − t, x₂)` is the solution with the same data: with `apply` as `L` the
   uniqueness clause of §5.1 fails. With weak derivatives `LW = ∂₁h ≠ 0` and nothing fails.

   **Repair.** Replace the last sentence of the §1.2 contract (`README.md:443`) by:

   > The structure and the predicate are the carrier of §5.1. `LinearSystem.apply` is the classical
   > left-hand side (pointwise `deriv` and `fderiv`) and is used here only on `C¹` maps, in the
   > pointwise identity of §5.2. In §§5.1, 5.3 and 5.4, for `W ∈ C¹([0, T]; L²_Λ) ∩ C([0, T]; H¹_Λ)`,
   > `LW` denotes `A⁰∂_tW + Σᵢ Aⁱ∂ᵢW + BW` with `∂_tW` the derivative of `t ↦ W(t)` in `L²_Λ` and
   > `∂ᵢW` the weak derivative of §4.1; it is an element of `C([0, T]; L²_Λ)` and agrees almost
   > everywhere with `LinearSystem.apply` when `W` is `C¹` on `[0, T] × E`.

   and add to §5.1 after the display of `LW` (`README.md:1391`): "with `∂_tW` the `L²_Λ`-valued time
   derivative and `∂ᵢW` the weak derivatives (supplier contracts)". Tested on the witness: `LW = ∂₁h`,
   and `W = h` no longer solves `LW = 0`.

2. **F02** (P2) commutation of mollification with weak derivatives is already pinned for every kernel and every period group

   **Location.** `README.md:331-333` ("These are the `Λ = 0` statements of §4.4 for the
   normalised-bump kernels only; a general even nonnegative kernel … its statements are proved in
   §4.4") and `:1308-1309` ("This section owns the extension of these three statements to every
   admissible kernel and every period group"), with the route at `:1317-1319`.

   **Claim.** At the pins `∂ᵢJ_ε = J_ε∂ᵢ` exists only for normalised bumps at `Λ = 0`, and §4.4 owns
   its extension.

   **Witness.** Pinned Tau Ceti, `TauCeti/Analysis/Sobolev/Mollification/Basic.lean:73,97`:
   `TauCeti.HasWeakLineDerivOn.hasLineDerivAt_convolution_right` and
   `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right`: for `u` locally integrable with weak
   derivative `u′` on `Ω`, any smooth compactly supported `rho`, `∂_v(u ⋆ rho)(x) = (u′ ⋆ rho)(x)`
   when `x − tsupport rho ⊆ Ω`. With `Ω = ⊤` it holds at every `x`, for every kernel of §4.4 and
   every Λ-periodic `u ∈ H¹_Λ` (locally integrable).

   **Repair.** (i) Add to "From Tau Ceti":

   > `TauCeti.HasWeakLineDerivOn.lineDeriv_convolution_right` (with
   > `TauCeti.HasWeakLineDerivOn.hasLineDerivAt_convolution_right`,
   > `TauCeti/Analysis/Sobolev/Mollification/Basic.lean:97,73`): for a locally integrable `u` with a
   > weak derivative `u′` in the direction `v` on an open `Ω`, a left-invariant measure and a smooth
   > compactly supported `ρ`, the convolution `u ⋆ ρ` has directional derivative `(u′ ⋆ ρ)(x)` at
   > every `x` with `x − tsupport ρ ⊆ Ω`. With `Ω = ⊤` this is `∂ᵢJ_ε = J_ε∂ᵢ` of §4.4 for every
   > admissible kernel and every period group; it is consumed, not proved again.

   (ii) In `README.md:331-333` and `:1305-1309` change "these three statements" to the contraction
   and the convergence, and say that the commutation with derivatives is the pinned lemma for every
   kernel and every `Λ`. (iii) In the route (`:1317-1319`) replace the derivation from
   `TauCeti.Wkp.lowerOrder_translate` and `TauCeti.Wkp.iteratedGradient_translate` by the pinned
   lemma; add it to the *Needs:* line of §4.4. Tested on the README's own non-bump kernel
   `φ(x) = (η(x − 2) + η(x + 2))/2` (`README.md:1357-1361`): smooth, compactly supported, so the
   pinned lemma applies with `Ω = ⊤`.

3. **F03** (P3) §3.1 lists the Minkowski frame under "LorentzianGeometry §7.3 does not state"; it states it

   **Location.** `README.md:758-764` ("Prove the following, which LorentzianGeometry §7.3 does not
   state: … the linear map `(τ, ξ) ↦ (cτ, ξ − τv)` … carries `g` to the Minkowski form").

   **Witness.** LorentzianGeometry README at its open head, §7.3, first Check: for `Σ = ℝⁿ`
   Euclidean, `c > 0` and `v` constant, `(t, x) ↦ (ct, x − vt)` is an isometry onto
   `(ℝ × ℝⁿ, minkowskiForm)` carrying `[B]` to `[∂_t]`.

   **Repair.** In the *Determinant and frame* bullet write: "…; the linear map
   `(τ, ξ) ↦ (cτ, ξ − τv)` carries `g` to the Minkowski form (LorentzianGeometry §7.3, first Check,
   and §6.1); stated here are its determinant `c` and the Gram determinant `det g = −c²`." The
   introductory sentence then holds for what remains (determinant, covector cones, Galilean
   covariance, identification with the symbol).

4. **F04** (P3) three targets of §8.2 have no locator

   **Location.** `README.md:2101-2113`: *Maximal common development*, *Compatibility*, *Maximal
   developments* carry no source locator (the paragraph at `:2127-2133` cites only the failure of
   uniqueness).

   **Witness.** EperonReallSbierski2019 line 1141–1144 (common development of two developments),
   lines 1200–1210 (the maximal common development and its identification with a component of the
   intersection), line 1228, Theorem 4.64 (agreement on a connected intersection), lines 1011–1012
   (Zorn's lemma for a maximal development above a given one). The manifest already lists
   Theorem 4.64 for this source.

   **Repair.** Append to the bullets: *Maximal common development*: "(EperonReallSbierski2019 lines
   1141–1144 and 1200–1210, for quasilinear wave equations; the description by causal pasts is
   proved here)"; *Compatibility*: "(EperonReallSbierski2019 line 1228, Theorem 4.64, the
   wave-equation analogue for a connected intersection)"; *Maximal developments*:
   "(EperonReallSbierski2019 lines 1011–1012, the same use of Zorn's lemma)".

Four findings: two P2 (a supplier declaration cited for an operator it does not define on the
class used; a target the pinned Tau Ceti already proves, with a "pins have only the bump case"
claim that is false at the pin) and two P3 (a "does not state" claim about a supplier section that
states it; three targets of §8.2 without a locator although a cited source has them). No P1: no
statement of `Suggested.lean` or of the README was refuted.

## Verified sound

Counts: 37 declarations of `Suggested.lean` read (16 theorems, 21 definitions and structures);
25 README sections (§1.1–§8.4) and the Conventions and supplier contracts read in full; 56
locators verified against 14 cached sources; about 70 Checks recomputed; 66 pinned `file:line` citations
resolved (24 Mathlib, 42 Tau Ceti), all at the cited line; 15 section citations and 9 declaration
names of LorentzianGeometry and SymmetricHyperbolicSystems resolved at their open heads; 6
non-supplier citations (PDE §1.3, §1.4, §7.1, §7.2; ComplexKahlerGeometry §5.7;
MathematicalStatisticsNonparametric §6.2; RelativisticQuantumFieldTheory RQFT1) resolved.

Elaborated signatures: I ran no Lean. I compared the 37 elaborated types of the worker's
`signatures.md` with the README statements: `[NeZero n]` is present in 14 theorems (all but
`exists_incompatible_developments`, where `n = 1`), `[DiscreteTopology Λ]` in the 13 theorems with
a period group; no binder is lost; nothing changed.

Dependency check, verbatim: `depcheck: 245 roadmaps, 2287 edges, 0 problem(s)`.

Headlines (README:483-495): lens uniqueness, uniqueness on domains of dependence, quasilinear
well-posedness and continuation, Euler well-posedness and continuation, the five statements of
§8.2, the two of §8.3, the two of §8.4. All 16 are stated; none is a stand-in. Padding probe: no
theorem follows by one tactic or one pinned lemma; there is no `example`, `#check`, `set_option`
or `lemma`; `quadraticLaw` is the only definition with proof fields and is used by a headline.
Policy: the diff is the package folder only; no process words or pull-request numbers in the
README or docstrings.

Ownership: `QuasilinearSystem`, `EquationOfState`, developments, `Hᵏ_Λ` searched by object in
main and the open heads (`roadmaps grep`): no second owner; LorentzianGeometry's Downstream
consumers names this subject as a consumer's. No fully qualified name of `Suggested.lean`
coincides with one in LorentzianGeometry or SymmetricHyperbolicSystems (different namespaces).
No Friedrichs commutator lemma, Moser estimate, periodic `Hᵏ` on `E`, symmetric hyperbolic system
or causal curve at the pins (grep of both libraries; `TauCeti/Analysis/Calculus/Moser.lean` is the
symplectic Moser deformation).

The adversarial table (values computed on each side):

| Statement | Instances | Values | Result |
|---|---|---|---|
| `EquationOfState`, `soundSpeed` | `p = ρ²/2` at `ρ = 4`; `ρ²` at `1/2`; `−ρ²`; Chaplygin | `c = 2` (not `4`); `c = 1`; `p′ = −2ρ < 0` rejected; `p′ = A/ρ² > 0` accepted | sound |
| `IsSolution` | expanding flow `n = 1`, `t = 1`; `(1 + t, 0)`; entropy wave `P = e^sρ²` | `∂_tρ = −ρ₀/4 = −∂_x(ρv)`; residual `1`; `P ≡ 1`, wrong form gives `−e^{x/2}` | sound |
| Galilean rule §1.2 | boost `w = 1` of expanding flow | correct rule residual `0`; `v ∘ φ⁻¹` residual `−1/2` at `t = 1` | sound |
| `QuasilinearSystem`, `symbol`, `Dominates` | transport `a = 3`; wave system `n = 1`; `N = 0` | `(1, 0)` fails at `ζ = (1, −1)`: `−2`; eigenvalues `±1`; empty matrix, every cone dominates | sound |
| Euler symmetrisers §2.2 | `ρ = 1`, `c = 2`, `v = 3`; full `P = e^sρ²` at `(1, 0)` | `det(A¹ − λA⁰) = 4(λ − 1)(λ − 5)`; `S A` block symmetric, minors `2, 2, 2`; `d = 1/2` gives `det 0` | sound |
| Dominance iff `c′ ≥ c + \|v − w\|` | `(2, 0)`, `(5, 0)`, `(2, 3)` at `c = 2`, `v = 3` | `ζ = (2, −1)`: `2 − 3 − 2 = −3 < 0`; `5 ≥ 5`; `2 ≥ 2` | sound |
| Acoustical form §3.1 | `n = 2`, `c = 2`, `v = (1, 0)` | Gram `det = −4`; `(1, 3, 0)` null; `(1, 4, 0)`: `5`; `ζ = (−3, 1, 0)`: `−2 = −c\|ζ′\|` | sound; signs agree with LorentzianGeometry §6.3 (`g⁻¹ < 0` spacelike) |
| `IsCausalCurve`, integral form | `\|t\|`; `10·`Cantor; `e^{3t}` in field `(1, x)` | corner allowed; `10 > 1` refuted; `2e^{3t} ≤ 1` only for `t ≤ −(ln 2)/3` | sound |
| `IsPastInextendible`, `futureDomainOfDependence` | constant field ball and half-space; `H₀ \ {(1, 0)}`; point datum; closed `D` | `{\|x − tv₀\| < R − c₀t}`; `{x¹ > (v₀¹ + c₀)t}`; complement of the closed cone over `(1, 0)`, open; `D⁺ = S`; closed `D` gives `D⁺ = D` | sound; agrees with LorentzianGeometry §12.6 extension form |
| Expanding-flow domain | `p = ρ²/2`, `S = (−1, 1)` | `ẏ = ∓(1 + t)^{−3/2}`, edge `2√(1 + t) − (1 + t)`, closes at `t = 3`; `0.828` at `t = 1` | sound |
| `sobolevNormSq` | `k = 0`; indicator, `k = 1`; `e^{−\|x\|²}`, `n = 2`, `k = 2`; `cos x` on `2πℤ` | `∫_F u²`; `⊤` (empty infimum); `π/2 + π + 7π/2 = 5π` against `(7/2 + 8e^{−2})π` for `Wkp`; `2π` against `2` (circle) | sound |
| §4.2–4.3 exponents | dilations `u(λx)` | interpolation `λ^{1/2}` both sides, wrong pair `λ^{1/6}`; Gagliardo–Nirenberg `λ^{i − ni/(2k)}` both sides; Nirenberg (2.2) with `a = i/k`: `1/p = i/(2k)`, no exceptional case | sound |
| Composition §4.3 | `Ū ∉ K`: `Φ = y³`, `Ū = a`; hedgehog map `n = 3` | ratio `a²` unbounded; `∫ \|∇u\|² = 8π³/3`, `J_εu(0) = 0 ∉ G` | sound |
| Friedrichs §4.4 | `a = x`; `a = sin(x/2)` on `2πℤ` | `ψ′ ⋆ u`, `‖ψ′‖_{L¹}` independent of `ε`; `μ₂ε²/8` at `π`, opposite at `3π` | sound (but R02) |
| Energy identity §5.1 | `B = bI`; Jordan block; `A⁰ = √(1 + x²)` | `E = e^{−2bt}E(0)`; growth `t‖f′‖`; `‖W′‖² = π/8`, energy `2 asinh R` | sound (but R01) |
| Weighted energy §5.2 | transport, cones of slope `1`, `1/2`; moving cone | `−1 − sign x ≤ 0`; `+1/2` for `x < 0`; `σ(dχ) = −σ((M − e·w, e))`, `M ≥ M\|e\|` | sound |
| §5.3, §5.4 constants | `A⁰ = 1/(2 + u)`, `U = sin mx`; `A⁰ = e^{sin x}`, `A¹ = M` | `C₁ ≥ √(2/3) m²`; `dE₂/dt = 22πM` (`4π + 16π + 2π`) | sound |
| `eqOn_lens` | `t₁ = t₂`; `φ ≤ 0` on the base; non-periodic pair `(0, x)`, `(g(t + 1/x), x)`, `Λ = ℤ` | lens = base; `∂_tφ ≤ 0` forces an empty lens; `∂_tu + x²∂_xu = 0`, differs at `(0.9, −10/3)` | true as typed; periodicity needed |
| `eqOn_causalPast` | counter-flow at `(2, 0)` | `J⁻_{D₁}(p)` at `t = 1.5` is `[−1.5, −0.5]`, outside `T_R = {x > −0.5}` | hypothesis `hpO` needed, present |
| `QuasilinearSystem.localWellPosedness` | `M < 0`; Burgers `−e^{−λ²x²}`; non-continuous datum | only `U₀ = Ū`; `T* = e^{1/2}/(λ√2)`, `‖u″‖² = 3√(π/2)λ³`; excluded by `Continuous` | sound; uniqueness among non-periodic `C¹` solutions holds (cones of `U` only) |
| Continuation theorems | Burgers, simple wave `p = ρ³/3` | `T* = 1.1658`, `ρ ∈ [1, 3/2]`, `∫‖∇U‖_∞ = ∞` | sound |
| `EquationOfState.localWellPosedness` | `L = ∅`; `r < 0`; background off `L` | vacuous; `r/2 ≤ ρ` trivially; `{1, 5} × B̄` compact, non-convex | sound |
| §7.3 | `u′ = u/(1 − u)`; switched system at `ζ = (−2, 1)` | exit times `0.0721`, `0.00365`; added entry `−2 < 0` while `(1, 3)` dominates transport | sound |
| `IsDevelopment`, `exists_incompatible_developments` | `D₁ = T_L ∪ (T_R ∩ {t < 1})`, `D₂` mirrored | pieces disjoint for `t < 1`; backward curves keep `x − t` non-increasing in `T_L`; `v₁(2, 0) = 2 ≠ −2`; `W₁₂ = D₁ ∩ D₂ ∩ {t < 1}` | true; also with `S = ℝ` and a slab `T < 1` |
| `maximalCommonDevelopment`, `compatible_iff` | first-exit argument both ways; `W₁₂` open neighbourhood of `J⁻_{D₁}(p)` | `W₁₂ = W₂₁` = union of the components of `D₁ ∩ D₂` meeting the data | sound; consistent with ERS Cor. 4.68 |
| `exists_maximal_development`, `isGreatest_development_of_solution`, `isDevelopment_slab`, `slab_subset_of_maximal` | `S = ∅`; chain unions; `D ∪ O` glued | `D⁺(∅) = ∅`; compact curve pieces lie in one member; curves from `O \ D` stay below `t_p` | sound |
| `boundary_futureCausal`, `boundary_null` | truncation top `φ = t − T`; `{\|x\| < 1 − t/2}`; lens with `M = 5`, `1.05` | `1 > 0` allowed by (a), (b) fails there; `1/2 < 1` excluded; `(−100, −400)` unbounded, `\|x\| < 18.2ε` | sound; `∇φ(q) ≠ 0` follows from `hdφ` |

## Not verifiable

- Majda1984 (Ch. 2, §§2.1–2.3, Theorem 2.1), Kato1975 (Theorem I, cited for §5.4, §7.1 and
  §7.3), Dafermos2016 (Ch. V, §5.1, Theorem 5.1.1): uncertified, text not readable. Not checked:
  which of Kato's theorems is the uniformly local one used in §7.3; whether Majda's continuation
  principle is stated with `∫‖∇U‖_∞ dt` or with a bound on `sup‖∇U‖_∞`; whether Majda §2.3 is the
  section on local energy and domains of dependence it is cited for in §5.2, §6.1, §6.2.
- Friedrichs1954, Christodoulou2007, HawkingEllis1973, ONeill1983: waived, cited by locator only.
- The Check of §4.1 against PDE §7.2 was recomputed from PDE §7.1's text (`χ = 1` on the unit
  ball, `2π` convention); the periodic blocks themselves are a plan, not a definition, at main.
- Truth of the 16 `sorry` theorems beyond the instances of the table: proof routes read and found
  consistent; no Lean was run.

Source independence: 56 passages compared with 14 sources, none shared; largest share Majda1984 and ChristodoulouMiao2014, 17 of 109 locators each; contents compared with ChristodoulouMiao2014: independent; Majda1984's text and table of contents could not be read.

## Source issues

- **Error** in ChristodoulouMiao2014 at §2.1.2, printed pp. 24–25 (lines 872–880): the source says any two developments of the same data coincide on the intersection of their domains, so the union of all developments is the unique maximal one; it should be that they coincide on the components of the intersection meeting the data, and maximal developments need not be unique; affects a stated result.

## For the human reviewers

- **Not tested.** Majda1984 ties for the largest share of locators (17 of 109) and is uncertified:
  wording and arrangement were not compared with it. They were compared with
  ChristodoulouMiao2014 (also 17).
- **Scope.** README:26-29 and §8.2 state that a uniqueness claim printed in ChristodoulouMiao2014
  (lines 872–880) is false and give a counterexample; EperonReallSbierski2019 Theorem 3.45 is the
  refereed analogue for wave equations, not for Euler.
- **Licence.** LukNotes is lecture notes from an author's page (manifest `licence_class =
  "author-page"`), not a refereed publication; it is cited for 8 locators, each beside a
  published source.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "016483dc2662e275bae18dffb57e3df53de48257", "job": "RT-CompressibleEulerEquations~1a", "model": "fable", "worker": "chris-x89"} -->
