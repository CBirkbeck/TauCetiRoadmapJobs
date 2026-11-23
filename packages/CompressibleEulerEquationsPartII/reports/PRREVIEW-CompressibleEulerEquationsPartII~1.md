# Review of CompressibleEulerEquationsPartII (pull request #3010 at 2283f36)

**Verdict:** needs changes

**Summary.** Changes are needed for three findings. On the mathematics: the horizon and null-generator statements of §2.1, §2.2 and the Summary are false on the top face of a finite slab. They need the restriction `t < t₀ + T` that §2.3 already has. Also, the first headline (existence and uniqueness of an acoustical function with given initial values) can be stated with the file's own predicate, but `Suggested.lean` does not state it. Separately, `Suggested.lean` imports two roadmap modules that exist only in open pull requests, so it does not build at this head. There are five small corrections and three format notes. Who owns well-posedness at real Sobolev orders is left to the human reviewers.

## R01 (P1) — `Suggested.lean` imports two roadmap modules that exist only in open pull requests, so it does not build

`Suggested.lean` is the acceptance test, and a file that cannot be elaborated tests nothing. Lines 3–4 import `TauCetiRoadmap.CompressibleEulerEquations.Suggested` and `TauCetiRoadmap.LorentzianGeometry.Suggested`. Neither folder exists on this branch or on main, and `lake env lean` stops at the header with "unknown module prefix 'TauCetiRoadmap'". The rule for this file is `import Mathlib` followed only by `TauCeti.*` modules at the pin; another roadmap's module, and above all one still in a pull request, cannot be imported. The statements themselves are well formed. I checked this on a copy with the suppliers' definitions pasted in from their heads (CompressibleEulerEquations at d30bd0f, LorentzianGeometry at 6e0c85c): all six declarations elaborate, and `sorry` is the only warning.

Smallest change: replace lines 3–4 by `public import Mathlib`. Then, for each theorem, do one of two things:

- restate the few carriers it uses under this roadmap's namespace, as CompressibleEulerEquations' own `Suggested.lean` does for LorentzianGeometry's causal curves ("restated here only because the pins have none");
- or name it in the docstring as not statable at the pins, with the missing carrier.

The carriers involved are:

- for §2.3 and §4.2: `EquationOfState` with `soundSpeed`, `IsSolution` and `acousticalCone`, plus the time-parametrised causal curves with `futureDomainOfDependence` (about 60 lines at the supplier's head);
- for §2.1, in addition: `TimeOrientedLorentzianFieldOn` with `futureDomainOfDependenceIn` (about 60 lines).

`IsAcousticalFunction` could take a cone field `(c, v)` in place of `(P, U)`. That removes its dependence on the equation of state.

## R02 (P2) — The horizon and null-generator statements of §2.1, §2.2 and the Summary fail on the top face of the slab

When the development reaches the time `t₀ + T`, which is the usual case on a finite slab, the third bullet of §2.1 (line 216) and the first statement of §2.2 (lines 233–236) are false as written. The frontier is taken in `𝔐` (§2.2), so `𝒞(D)` contains the spacelike top face.

First example: take `n = 1`, `c = 1`, `v = 0`, `t₀ = 0`, `T = 1/2` and `S = (−1, 1)`. Then `D = {|x| < 1 − t, 0 ≤ t < 1/2}`, and `𝒞(D)` contains the segment `{t = 1/2, |x| ≤ 1/2}`. The point `(1/2, 0)` lies on no null curve inside `𝒞(D)`: the null sides `|x| = 1 − t` meet the top only at `x = ±1/2`.

Second example: take `S = E` and `T = 1`, with `Ô = {t < 1}`. Then `D = Ď = [0, 1) × ℝ` and `frontier D ∩ {t > 0} = {1} × ℝ`. But `H⁺_Ô({0} × ℝ)` is empty, because it lies in `Ô` and every point of `Ď` is in `I⁻(Ď)`. In the same example, `𝒞(D)` has no generators, since there is no edge to issue from.

LorentzianGeometry §12.7 states its identity for the boundary taken inside `Ô`. CompressibleEulerEquations §8.4 restricts its statement on developments inside a slab to `t₀ < t(q) < t₀ + T`, and §2.3 here intersects with `{t < t₁}`. The Lean theorem of §2.1 is not affected: both sides equal `(0, 1) × ℝ` in the second example.

Smallest change: replace `{t > t₀}` by `{t₀ < t < t₀ + T}` in the third bullet of §2.1 and in the first statement of §2.2. In the Summary sentence beginning "For a `C¹` solution on a time slab" (lines 16–20), say "below the top of the slab".

## R03 (P2) — The first headline, an acoustical function with given initial values, can be stated at the pins but is neither stated nor correctly excused

The acceptance test leaves out the first headline of the Summary (lines 14–16). The docstring excuses it (lines 29–31) "because the suppliers' target files have no geodesic of a `C¹` metric", but that reason does not apply to its slab form.

The Slabs and Uniqueness bullets of §1.2 (lines 123–133) involve only `C²` functions, derivatives and bounds:

- Existence: take a `C²` field `(c, v)` with `c > 0` and `C²` norms bounded on each `[t₀, t₂] × E`, and `u₀ ∈ C²(E)` with its `C²` norm and `1/|∇u₀|` bounded. Then some `τ > 0` admits a `C²` acoustical function on `[t₀, t₀ + τ) × E` with `u(t₀, ·) = u₀`.
- Uniqueness: two `C²` acoustical functions on such a slab with the same initial values agree.

Both can be written with the file's `IsAcousticalFunction` (or its cone-field form) and Mathlib's `ContDiffOn` and `fderivWithin`; neither mentions a geodesic. The same holds for the identity of §1.3, `Lκ = T̂^j·T(v^j) − T(c)`.

Smallest change: state the slab existence and the uniqueness in `Suggested.lean`, and also the identity for `κ` if the author counts it as a headline. Narrow the docstring's exclusion to the construction by null geodesics and to the generators of §2.2.

## C01 — Two locators into Luo–Yu 2025b point at the wrong section

§3.5 (line 447) and the References (line 649) cite Luo–Yu 2025b, §3, for the Goursat problem between the rarefaction fronts. But §3 of that paper (arXiv v2, pp. 29–57) constructs the data on `Σ_δ`. The Goursat problem is Step 3 of the plan in §2.3.2 (p. 26), and it is solved in §5.4 (p. 77), at the end of the proof of Theorem 3. Likewise, the diagonalization in the `L`-direction cited in §3.1 (line 318) as "§2" is the system (1.25) of §1.4.3. Replace "§3" by "§5.4 (and §2.3.2, Step 3)", and "§2" by "§1.4.3".

## C02 — Rendall 1990 is cited six times with no locator

§3.1 (lines 318, 331), §3.4 (lines 412, 435) and §3.5 (lines 448, 457) cite Rendall 1990 "by locator" or "the case treated there", but give no section, theorem or page. A reader cannot find the reduction to the Cauchy problem, or the two-hypersurface case, that the routes of §3.4 and §3.5 rest on. Give Rendall's section and theorem numbers (and the page) at each citation.

## C03 — The route of §3.4 cites CompressibleEulerEquations §6.2 for uniqueness with a source that depends on `(t, x)`

The route marks existence for sources depending on `(t, x)` as "constructed here" (lines 420–421). For uniqueness with the same source, it then points to CompressibleEulerEquations §6.2 (line 422). But at the supplier's head, §6.2 is stated for the carrier of its §2.1, whose source `F(U)` depends on the state alone. Mark the uniqueness as constructed here too (the same lens argument of its §6.1 carries a smooth bounded source in `(t, x)`). Better, state existence and uniqueness for such sources once, as a target of §3.4 with its hypotheses.

## C04 — "type (i) data" in the second Check of §3.3 is undefined

The Check at line 402 says `H_{t₀}` is "a development of the type (i) data on all of E". Nothing in this README or its suppliers defines "type (i)". Write "of the initial data set on all of `E` (CompressibleEulerEquations §8.1)".

## C05 — The centered-rarefaction half of §4.2 is neither stated in `Suggested.lean` nor excused with its missing carrier

The README's §4.2 (lines 514–517) and the Summary claim that the plane wave is a family of centered rarefaction waves with `κ′ = t`. `isSolution_planeRarefaction` states only that it is a classical solution with acoustical function `u′`. The docstring (line 34) lists "centered null foliations (§4.1)" among the unstated targets without saying what carrier is missing, which the other entries do. Either say what the centered-rarefaction predicate lacks at the pins, or state it.

## N01 — Three of this roadmap's own names are in code font but declared nowhere

`CharacteristicData` (line 335), `IsCharacteristicDevelopment` (line 375) and `IsCenteredRarefaction` (line 477) are not declared in `Suggested.lean`. A reader who searches for them finds nothing. Write them as proposed names in prose, or declare them.

## N02 — The module docstring keeps the older "suggested forms, not exhaustive" wording

Lines 9–13 say that discharging the statements "finishes neither a layer nor the roadmap". The file's current role is to state the headline theorems the finished roadmap proves. Would "<title>: target signatures … states the roadmap's headline theorems against the pinned APIs" read better?

## N03 — The Luo–Yu locators are to arXiv v2, while the citation gives the Annals version

The References (lines 645–649) cite Ann. of Math. 202 (2025), but the section and definition numbers match arXiv:2302.09714v2 and arXiv:2305.06308v2. Say which version the locators refer to.

## Questions for the author

- §4.1 (lines 491–493) says that "κ′/t bounded above and below by positive constants" becomes condition 4 once `u` is replaced by a function of `u` alone. Relabelling `u ↦ F(u)` divides `κ′` by `F′(u)`, so it gives `κ′/t → 1` only when `lim κ′/t` exists and does not depend on `ϑ`. Remark 2.14 of Luo–Yu 2025b, as I read it, assumes "the limit κ′/t" exists. Does existence of the limit (and its independence of `ϑ`) follow from conditions 1–3, or should the sentence assume it? I could neither prove it nor build a counterexample: in the plane wave every centered foliation has `κ′/t` a function of `u` alone.

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions, `IsAcousticalFunction` | `n = 1`, `c = 1`, `v = 0`, `u = t − x`; wrong sign `x − t` | `∂ₜu + v∂ₓu = 1 = c\|∂ₓu\|`; `μ = −1/g⁻¹(dt,du) = 1 = cκ`; `x − t` gives `−1 ≠ 1` | holds, wrong sign excluded | none |
| §1.1 reflection | `k = 0, 1`; `f(t) = t` | `(a₁,a₂) = (−3,4)`; one-sided derivative `3f′ − 2f′ = f′`; even reflection of `t` is `\|t\|`, not `C¹` | holds | none |
| §1.2 acoustical function | expanding flow, `u₀ = x − 1` | `Bu = (1+t)^{−3/2} = c\|∂ₓu\|`; level set `x = 2√(1+t) − (1+t)`, speed `v − c`; equals CompressibleEulerEquations §3.3 Check | holds | none |
| §1.3 metric and `κ` identity | `(t,u,ϑ)` frame; expanding flow | `g(T,T) = κ² + 2·g̸ΞΞ − 2·g̸ΞΞ = κ²`; `Lκ = κT̂ⁱT̂ʲ∂ᵢvʲ − Tc` = Luo–Yu I (2.6), CM (3.85); `Lκ = 1 = e′κ` | holds | none |
| §1.3 polytropic form | `T = (κ/c)(B − L)`, `Bv = −∇h` | `−(2/(γ−1))Tc − Tc = −((γ+1)/(γ−1))Tc` = Luo–Yu I (2.5) with `ψᵢ = −vⁱ` | holds | none |
| §2.1 Lean, `D = int Ď` | `S = (−1,0)∪(0,1)`; `S = E`, `T = 1` | non-regular: `D = {\|x\|<1−t}∖{\|x\|≤t} ≠ int Ď`; regular: both `(0,1)×ℝ` | holds; regularity needed | none |
| §2.1, third bullet | `S = E`, `T = 1`, `Ô = {t<1}` | left side `{1}×ℝ`; `H⁺_Ô = ∅` | fails | R02 |
| §2.2 generators | `S = (−1,1)`, `T = 1/2`; `T ≥ 1` | `(1/2,0) ∈ 𝒞(D)` on spacelike top; for `T ≥ 1` generators `x = ±(1−t)` | fails on top face | R02 |
| §2.3 Lean | constant state, `u = (v¹+c)(t−t₀) − x¹` | `{u<0} = {x¹ > (v¹+c)(t−t₀)}` = supplier Check; frontier `= {u=0}` since `∇u ≠ 0` | holds | none |
| §3.1 symbol kernels | `p = ρ²/2`, `ρ=1`, `v=0`, `ζ=(1,−1)`; full system | `σ = (δρ−δv, δv−δρ)`; `ℓ=r=(1,1)` annihilate; `(1,−1)` gives `2(δρ−δv)`; `ℓ_s = P_s/c²` | holds | none |
| §3.1 inner expression | expanding flow, `n̂ = e₁` | `Bρ = −(1+t)⁻²`, `ρ div v = (1+t)⁻²`, `Bv = 0`: sum `0` | holds | none |
| §3.2 compatibility | `Ū₀ = (1, ax)`, `Ū_C = (1,0)`, `C = {x=t}` | formal jet `(∂ₜρ,∂ₜv) = (−a,0)`; along `L`: `(−a,a)`; `w₊` change `0`, `w₋` change `2a` | holds iff `a = 0` | none |
| §3.2 source | Luo–Yu II §2.1, pp. 17–18 | C1)–C3): `LᵐXⁿ` jets at `S_{δ,0}`, `m+n ≤ N` | matches | none |
| §3.3 Check | constant data, `φ = (v₀¹+c₀)(t−t₀) − x¹` | `K_φ = {x¹ ≤ (v₀¹+c₀)(t−t₀)}` is `D⁺` of `S₀ ∪ C`; `H_{t₀}` has `φ<0` points | holds | none |
| §3.4 route | supplier §6.2 at d30bd0f | §6.2 carrier has source `F(U)` only | gap in route | C03 |
| §3.5 Check | `n = 1`, constant state | `dφ(B) = dφ̲(B) = c₀`; `g⁻¹(dφ,dφ̲) = −1 − 1 = −2` | holds | none |
| §3.5 source | Luo–Yu II | Goursat at §5.4, p. 77, and §2.3.2, p. 26; §3 constructs data | locator wrong | C01 |
| §4.1 vs Def 2.13 | Luo–Yu II p. 24 | README 1–4 ↔ (1) foliation, (2) smoothness, (3) `lim κ′/t = 1`; constant state `κ′/t → ∞` | matches | Q1 on Remark 2.14 |
| §4.2 Lean | `t > 0`, `γ > 1` | `v+c = x/t`; mass and momentum reduce to `(2/(γ−1))(A/t)(v+c−x/t) = 0`; `c(λ_r t) = c_r`, `v¹ = v_r` | holds | none |
| §4.2 Checks | `T = −t∂₁` | `κ′ = t`; `T̂·Tv − Tc = 2/(γ+1) + (γ−1)/(γ+1) = 1 = m′`; `c > 0` iff `u* < λ_r + 2w_r` | holds | none |
| §4.2 Riemann invariant | Luo–Yu I §1.1, p. 3 | source `w = ½(2c/(γ−1) − v)` = `w_r` | matches | none |
| Headline 1 (acoustical function) | slab form of §1.2 | involves `C²` functions, `fderivWithin`, bounds only; no geodesic | statable, absent | R03 |

- Source locators checked against the text: 14 (Luo–Yu I §1.1, §2 for `𝒟₀`, `C₀`, `𝒟(δ)`, §2.1, §2.2; Luo–Yu II §2.1 C1–C3, Definition 2.13, Remark 2.14, §3, §2/§1.4.3; Christodoulou–Miao §2.1 (2.12)–(2.16), (2.41), Ch. 3 (3.85), (3.92)).
- Library declarations opened at the pin: `zorn_le_nonempty₀` (Mathlib/Order/Zorn.lean:126), `uniqueDiffOn_convex` (Mathlib/Analysis/Calculus/TangentCone/Real.lean:80), `ODE_solution_unique_of_mem_Icc` (Mathlib/Analysis/ODE/ExistUnique.lean:252), `IsPicardLindelof` (Mathlib/Analysis/ODE/PicardLindelof.lean:80), `LipschitzOnWith.ae_differentiableWithinAt_of_mem` (Mathlib/Analysis/Calculus/Rademacher.lean:362), `sigNeg` (Mathlib/LinearAlgebra/QuadraticForm/Signature.lean:98). Tau Ceti has nothing on causal structure, fluids or eikonal functions.
- Cross-roadmap citations resolved: CompressibleEulerEquations §§1.1–1.3, 2.1–2.2, 3.1–3.3, 6.1–6.2, 7.1–7.3, 8.1–8.4 and all 25 declaration names at d30bd0f (the seven of them absent from the pinned libraries are at lines 84, 103, 257, 278, 300, 357, 414 of its `Suggested.lean`); LorentzianGeometry §§3.1–3.3, 7.3, 9.2–9.3, 12.6–12.7 and its two cited Checks at 6e0c85c.
- Dependency check: `depcheck: 133 roadmaps, 1474 edges, 0 problem(s)`.
- Automatic checks: the two import checks and the targeted build failed, all real (R01).
- Elaboration: at the head, failure at the imports. On a copy with the supplier definitions pasted in: `sorry` the only warning. `#check @` of all six declarations: generality matches the README, and §2.1 is more general (any `C¹` extension on any open `Ô` with `Ô ∩ H_{t₀} = O`).
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `aesop`) on the three theorems: none closes; no padding.
- Overlap check: read CompressibleEulerEquations, LorentzianGeometry, HamiltonJacobiAndConservationLaws, RiemannianManifoldsWithConvexBoundary. Nothing is owned twice. CompressibleEulerEquations owns domains of dependence, developments and the nullity of their regular boundary, and hands characteristic data, eikonal functions and null generators to this roadmap. LorentzianGeometry owns horizons and their generators for `C¹` metrics. HamiltonJacobiAndConservationLaws owns the Euclidean local method of characteristics for scalar first-order equations; §1.2 builds only the semi-global eikonal case for the acoustical metric, by null geodesics. Real-order well-posedness is owned by neither (see the human reviewers' section). Ownership against open pull requests was searched by object (Rendall, Goursat, characteristic initial data, rarefaction waves, acoustical coordinates, eikonal functions): no other owner.

Source independence: 11 passages compared with 3 sources (LuoYu2025a, LuoYu2025b, ChristodoulouMiao2014). None shared beyond the defined object's name and formulas the mathematics forces. Largest share: LuoYu2025a and LuoYu2025b, 6 each of 26 located citations (Rendall 1990, cited 6 times with no locator, unread). Contents compared with both Luo–Yu papers: independent.

Research link: Layers 1–4 build the carriers on which Luo–Yu (Ann. of Math. 202, 2025) state the stability of multi-dimensional rarefaction waves and of the Riemann problem: acoustical functions and coordinates, the domain `𝒟₀` and its boundary `C₀`, the development `𝒟(δ)` of characteristic data, the Goursat problem, and centered rarefaction waves. This rests on the README and on LuoYu2025a §2, LuoYu2025b Definition 2.13 and §5.4.

## Not verifiable

- Rendall 1990, Proc. R. Soc. Lond. A 427, 221–239 (§§3.1, 3.4, 3.5): the publisher's DOI page refused access; the sources service found no open copy.
- Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 1.2.6 (§3.4): book; no legal open copy found.
- Hawking–Ellis 1973, Ch. 6 (§2.2): book; no legal open copy found.
- Christodoulou 2007, Ch. 2 (§1.2): EMS monograph; no legal open copy found.
- Numbering of the Annals versions of Luo–Yu I and II: only arXiv v2 read.

## Source issues

- **Misprint** in LuoYu2025b at Definition 2.13, p. 24: the source calls the rarefaction region W′ an open set disjoint from D₀ that contains C₀; since C₀ lies in the closure of D₀, no open set does both; it should be the union of the leaves C′_{u′}, u′ ∈ [0, u*′], closed on the C₀ side, as the definition then writes it; affects nothing.

## For the human reviewers

- Real-order well-posedness has no owner. CompressibleEulerEquations (open; its Scope, "Fractional orders", and Downstream consumers) assigns well-posedness at real Sobolev orders `s > n/2 + 1` to "Compressible Euler equations, Part II". This roadmap's Scope (lines 582–583) excludes it without naming an owner.
- Not tested: Rendall 1990, the source of the routes of §§3.4–3.5, could not be read legally, so the wording and arrangement checks were not run against it.
- Supplier order: both suppliers are open pull requests. LorentzianGeometry, which this roadmap and CompressibleEulerEquations both cite, is not in the merge-order file.
