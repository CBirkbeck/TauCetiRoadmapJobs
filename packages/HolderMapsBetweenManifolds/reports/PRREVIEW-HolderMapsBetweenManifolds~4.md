# Review of HolderMapsBetweenManifolds (pull request #3015 at 1db4050)

**Verdict:** accepted

**Summary.** Accepted: a full second pass over every statement found no false or unsupported result, and the Lean file states each headline that is statable at the pins. There is one small correction (two remarks, that an inclusion is "not onto" and that a set is "not closed under composition", fail in dimension zero, a case the text treats with care elsewhere) and two format notes carried over, none blocking. The human reviewers still have to decide about de la Llave–Obaya, the source with the most locators, of which no legal copy could be read.

## C01 — Two negative remarks hold only in positive dimension, and the text does not say so

In §5.1 item 2 (line 514) the text says of `C^{k+1}_A(M, F) → C^{k,1}_A(M, F)` that "the Check of §2.5 shows it is not onto", and §3.3 (line 368) says "For `k = 0` and `α < 1` the set is not closed under composition". Both read as statements about every compact `M`. For `M` a point (`E = 0`, which the Conventions allow) every map is of every class: the two finite-atlas spaces are both `F` and the inclusion is the identity, and the set of §3.3 is the whole one-element group. The same happens for `F = 0` in §5.1. The Check of §2.5 is on the circle with real values, and the example of the Conventions is on a line, so neither covers these cases; the Dimension-zero Check of Layer 4 shows the roadmap treats the case elsewhere.

"is not onto when `M` is nonempty of positive dimension and `F ≠ 0`" in §5.1, and "is in general not closed under composition (Conventions), for instance on the circle" in §3.3, would make both true as written.

## N01 — Most targets still carry no source locator

§§1.2 and 1.3, Layers 2 and 4, §§3.1–3.3 and §§5.1–5.3 cite no source. The References entry describes dLO §3 (interpolation) and §6 (examples of discontinuity), natural locators for §1.2 (line 163) and §4.3 (line 454); a textbook locator would suit the openness of diffeomorphisms in §4.2 (line 442).

## N02 — Layers 3–5 depend on all of Layer 2, which includes the comparisons of §2.2

Layer 2's *Needs:* line (lines 325–328) names HeegaardFloer §2.3 and PseudodifferentialOperators §5.4 for the comparisons of §2.2; the *Needs:* lines of Layers 3, 4 and 5 (lines 404, 497, 565) cite "Layer 2" as a whole, though none uses those comparisons. "Layer 2, without the comparisons of §2.2" would keep them from appearing to wait on those sections.

## Previous findings

The previous review, of this same head, had no finding and no small correction.

- N01 (missing locators) — not repaired: the head is unchanged; "this is Mathlib's `HolderOnWith.interpolate` applied to the `α`-Hölder bound" (§1.2, line 164) still carries no source locator. Carried over as N01.
- N02 (coarse *Needs:* lines) — not repaired: "*Needs:* Layer 2; §1.3; Mathlib `Diffeomorph`" (line 404). Carried over as N02.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| §1.1 item 1 (order zero) | `f = g = \|x\|^{1/2}` on `[-1,1]` | `[g∘f]_{1/4} = 1`; bound `[g]_{1/2}[f]_{1/2}^{1/2} = 1`. Exponent `1/2`: quotient `\|h\|^{-1/4} → ∞` | Holds, sharp |
| §1.1 item 2 (positive order) | `k = α = 1`, `f = 2x` on `(0,1)`, `g = y²` on `(0,2)` | `‖f‖ = 2`, `‖g‖ = max(4,4)+2 = 6`, `‖g∘f‖ = max(4,8)+8 = 16`; bound `6(1+2²)M = 30M` | Holds; degree `k+α` in `f` checked term by term via `(2 sup)^{1-α} L^α` |
| §1.1 item 3 and Translation Check | `u = ψ\|x\|^α`, `h_t = u(·+t) − u` | `h_t(0) = t^α`, `h_t(−t) = −t^α`, so `[h_t]_α ≥ 2`; `sup\|h_t\| ≤ t^α → 0` | Loss of exponent needed; the case `β < β'` follows from item 2 and §1.2 |
| §1.2 interpolation | `v = x` on `[0,1]`, `α = 1`, `β = 1/2`; `h_t` | `[v]_{1/2} = 1 ≤ 2^{1/2}`; `[h_t]_β ≤ 2^{1−β/α}([u]t^α)^{1−β/α}(2[u])^{β/α} = 2[u]t^{α−β}` | Holds; matches the constant `C₁^{t₁}C₂^{t₂}` of `HolderOnWith.interpolate` |
| §1.3 items 1, 2 | `φ = exp`, `K = [1,2]`, `k = α = 1`; `φ_c = x − c` | Left `1 + 1 = 2`; route bound `B + B^{2+α}[Dφ]_1 = 1 + 2 = 3`. `sup_K\|φ_c⁻¹\| = \|c\|+1/2`, inputs `1`, `1` | Holds; order-zero term rightly excluded |
| §2.1 definition against the pointwise notion | `x sin(1/x)`, `k = 0`, `α = 1` | `\|f(x) − f(0)\| ≤ \|x\|`; `f'(1/(2πn)) = −2πn` unbounded | Neighbourhood condition strictly stronger, as stated |
| §2.1 item 1, `C^{k+1} ⊂ C^{k,1}`, `C^{k,α} ⊂ C^k` | `x\|x\|` | `f' = 2\|x\|`, Lipschitz constant `2`, not differentiable at `0` | `C^{1,1}`, not `C²`; neither closes by `simp` |
| §2.2 chart independence | `α = 2`, `k = 1`, identity of `ℝ`, chart `u = x + x³` | Standard chart: `Df = 1`, constant. Other chart: derivative `1/(1+3x²)`, not constant, so not `2`-Hölder | `α ≤ 1` needed and stated; `(⇐)` uses `L` a closed ball met with `range I` |
| §2.2 finite-atlas set equals the class | circle, two closed arcs meeting only at endpoints | `y < p < z`: `\|v(y)−v(z)\| ≤ C(\|y−p\|^α+\|p−z\|^α) ≤ 2C\|y−z\|^α`; `n` pieces give `nC` by a chain along the segment | True although the pieces need not overlap |
| §2.3 items 1, 2 | `\|x\|^{1/2}∘\|x\|^{1/2}`; charts at `x`, `f x`, `g(f x)` | `\|x\|^{1/4}`, exponent `βγ = 1/4` attained; representative of `g∘f` is `ĝ∘f̂`, no transition map | Holds |
| §2.4 tangent map | `f = x\|x\|`, `k = 1`, `α = 1` | `(x,v) ↦ (x\|x\|, 2\|x\|v)`: Lipschitz on bounded sets, not `C¹` | `C^{0,1}`, which is `C^{k−1,α}` |
| §2.5 Checks | `\|x\|^{3/2}`; `x^{1/2}` on `[0,1]` | `f' = (3/2)sign(x)\|x\|^{1/2}`; `h^{1/2}/h^β → ∞` for `β > 1/2` | True |
| §3.1 inverse regularity | `f = x + x\|x\|/2` near `0` | `f' = 1+\|x\|`, `B = 1`, `C = 1`; `(f⁻¹)'` Lipschitz with constant at most `B²C·B = 1` | Holds |
| §3.2 item 1 | `x³` at `0`; the pinned inverse function theorem | Derivative `0` at `0`, inverse only `C^{0,1/3}`. The pin asks only `I.IsInteriorPoint x`, as here | Hypotheses match the pin |
| §3.3 `coe_holderDiff` | `k = 0`, `α < 1`: `sign(x)\|x\|^α` | Inverse exponent `1/α > 1`, Lipschitz; square has exponent `α² < α` | `1 ≤ k` needed and stated; not `rfl`, not `simp` |
| §3.4 exponential charts | flat `ℝ/ℤ`, `f = x + εφ` | `f̂_p(z) = f(p+z) − f(p)`, `Df̂_p = 1 + εφ'(p+z)`, constant `ε[φ']_α`; inverse constant `B²ε[φ']_α`, `B = 1/(1−ε sup\|φ'\|)`; no dependence on `p` | Holds; Lean norms are the metric's (instance from `RiemannianBundle`) |
| §4.3 not a group topology | circle, `f = x + εφ`, rotations `R_t` | `[D(f∘R_t) − Df]_α ≥ 2ε` for all small `t`; `R_t → 1` in `C^{k+1}` | Left multiplication discontinuous; `Nonempty M`, `Nontrivial E` in Lean |
| §4.4 group topology | same; `β < β' < α` | `[D(f∘R_t) − Df]_β ≤ Ct^{α−β} → 0`; `(f_n−f)∘g_n → 0` by §1.1 item 2, `f∘g_n` bounded in `C^{k,β'}` and `C^k`-convergent | Holds; inversion uses only orders `1..k` of §1.3 item 2 |
| §5.1 inclusions, compactness | `F = ℝ`, circle, `k = 0`, `α = 1`, `α' = 1/2`; `F = ℓ²`, `u_n ≡ e_n`; `M` a point | `[u_n−u]_{1/2} ≤ √2(sup\|u_n−u\|)^{1/2}(2L)^{1/2} → 0`; norms `1`, distances `√2`; for a point both spaces are `F` | Compactness holds; "not onto" needs positive dimension (C01) |
| §5.3 pullback | `u ∘ (f ∘ g)` | `= (u∘f)∘g = g^*(f^*u)` | Order of composition right |
| §5.4 smoothing | `u = ψ\|x\|^s`, even `ρ` | `(u∗ρ_ε)(0) = ε^s∫\|z\|^sρ`; `\|D^r(v∗ρ_ε)\| ≤ [v]_s ε^{s−r}∫\|z\|^s\|D^rρ\|` | Matches DKRH lines 2486–2499 |

- Source locators checked against the text: 4 of 4 for DKRH (§1.1, (1.1) and Theorem 1.1 at DKRH lines 12–31; §2.1 and (2.2) at DKRH lines 395 and 417–421; Lemma B.1 and its proof at DKRH lines 2482–2499); 0 of 5 for dLO (not readable).
- Library declarations opened at the pin, Mathlib: `HolderOnWith.comp` (`Topology/MetricSpace/Holder.lean:105`), `HolderOnWith.interpolate` (`:162`), `HolderOnWith.of_le` (`:186`), `iteratedFDerivWithin_comp` (`Analysis/Calculus/ContDiff/Comp.lean:264`), `ContDiffPointwiseHolderAt` (`Analysis/Calculus/ContDiffHolder/Pointwise.lean:55`), `ModelWithCorners.uniqueDiffOn` (`Geometry/Manifold/IsManifold/Basic.lean:347`), `LinearMap.continuous_of_isClosed_graph` (`Analysis/Normed/Operator/Banach.lean:538`), `arzela_ascoli₂` (`Topology/ContinuousMap/Bounded/ArzelaAscoli.lean:94`).
- Library declarations opened at the pin, Tau Ceti: `ContMDiffMap.chartCkSeminorm` (`Geometry/Manifold/ContMDiffMap/Chart/Seminorm.lean:118`), `TauCeti.Diff` and `coe_mul` (`Geometry/Diffeomorphism/Group.lean:214`, `:106`), `Diffeomorph.continuous_symm` (`Geometry/Diffeomorphism/Inversion.lean:215`), `isLocalDiffeomorphAt_of_mfderiv_eq` (`Geometry/Manifold/LocalDiffeomorph/Basic.lean:358`), `IsNormalDomain` and `riemannianLog` (`Geometry/Manifold/Riemannian/Geodesic/Normal/Basic.lean:89`, `:225`), `HolderSpace` (`Analysis/Holder/Normed.lean:60`), `CkHolderSpace` (`Analysis/Holder/Iterated.lean:98`; whole-space maps only, so no duplication of Layer 1 or §2.2).
- Cross-roadmap citations resolved on main: HeegaardFloer §2.3 (line 1557), PseudodifferentialOperators §5.4 (line 1280), PDE §1.7 (line 996), ComplexHessianEquations §5.2 (line 439), GeometricTopology Layer 3 (line 1429), SmoothBundlesConnections B6.0 (line 1543, the uniform normal radius at lines 1565–1566); at its open head, HyperbolicDynamicsAndThermodynamicFormalism §8.7 (line 640) and its scope (line 929).
- Dependency check: `depcheck: 132 roadmaps, 1466 edges, 0 problem(s)`; no UPWARD or CYCLE line. Nothing changed outside the folder.
- Elaboration: `Suggested.lean` gives 12 `sorry` warnings and nothing else. `#check @name` was run for all 21 declarations and each elaborated type compared with its README statement: every theorem carries `FiniteDimensional` and the `IsManifold` instances it uses; the definitions carry only what their bodies mention, as the README states them. Nothing changed.
- One-tactic probe: `ContMDiffHolder.contMDiff`, `ContMDiff.contMDiffHolder_one`, `ContMDiffHolder.comp_zero` (by `simp_all` with the definitions) and `coe_holderDiff` (by `rfl` and by `simp`) do not close. No padding found.
- Headlines: the theorems of Layers 2–4 listed in the module docstring are all stated; the Banach spaces of §2.2 and the Layer 5 theorems are named there as not statable, with the missing carrier. The automatic checks all pass on this head, and the pull request's description agrees with the head sentence by sentence.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ComplexManifolds, ManifoldOptimization, LorentzianGeometry, HamiltonianReduction, SobolevMapsBetweenManifolds, MorseTheory, RiemannianManifoldsWithConvexBoundary. ComplexManifolds, ManifoldOptimization, HamiltonianReduction, MorseTheory and RiemannianManifoldsWithConvexBoundary have no Hölder content. LorentzianGeometry §2.3 owns Hölder classes of metric tensors (sections of a bundle), not of maps between manifolds: a different object, nothing shared. HyperbolicDynamicsAndThermodynamicFormalism excludes the regularity class from its scope, and its §8.7 uses only a local Hölder condition. Shared objects, each cited here with its owner and a comparison: real `C^k` spaces (owner HeegaardFloer §2.3), bundle `C^{k,α}` norms (owner PseudodifferentialOperators §5.4), Hölder compactness on compact complex manifolds (owner ComplexHessianEquations §5.2), Euclidean Hölder spaces of real functions (owner PDE §1.7). A search of main and all open heads for Hölder diffeomorphisms, `Diff^{k,α}` and a lower Hölder topology finds no other owner.

Source independence: 8 passages compared with 1 source (DKRH), none shared beyond the formula of (2.2) and a six-word standard phrase; largest share dLO, 5 of 9 locators, whose text and table of contents could not be read; against the section list the README itself gives for dLO (§§2, 3, 4, 6), only parts of §§1.1–1.2 correspond, so the five layers are not its arrangement.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate (DKRH (2.2)) and §5.4's smoothing (DKRH Lemma B.1) are inputs to Dolgopyat, Kanigowski and Rodriguez Hertz, *Exponential mixing implies Bernoulli* (2024); Layer 4 rests on de la Llave and Obaya (1999). Rests on the README and DKRH lines 12–31, 417–421, 2482–2499.

## Not verifiable

- dLO, the five §4 and §6 locators of §1.1 (lines 120, 125, 127, 130–133, 149): the DOI's landing page and the mp_arc preprint archive are on hosts in no licence class, so no legal copy was found. The statements they support were checked by direct computation (the first three rows of the table).

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators, 5 of 9, all in §1.1 of `TauCetiRoadmap/HolderMapsBetweenManifolds/README.md`. Its text and table of contents could not be read, so wording and arrangement were not compared with it.
- **Licence.** Is the mp_arc preprint archive (`web.ma.utexas.edu`, preprint 98-11) an open repository from which dLO may be read? If so, the five dLO locators can be checked.
