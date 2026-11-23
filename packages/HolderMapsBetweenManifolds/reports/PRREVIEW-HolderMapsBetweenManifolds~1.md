# Review of HolderMapsBetweenManifolds (pull request #3015 at f720b13)

**Verdict:** needs changes

**Summary.** Changes are needed. The main problem is that the README treats about twenty Tau Ceti declarations as supplied, although the pinned Tau Ceti has none of them. They include the compact-manifold Hölder space and its atlas theory, the Euclidean Hölder chain rule and inverse estimates, and the uniform normal radius. As a result Layer 5 and parts of Layers 1–3 rest on objects that no pinned library and no roadmap supplies. Three further findings are blocking: `Suggested.lean` leaves out four headline theorems that its own docstring calls statable, it defines the subgroup `Diff^{k,α}(M)` with `sorry` in the closure fields, and the README gives a reason for excluding `k = 0` that is false at `α = 1`. There are seven small corrections and two format notes. The human reviewers have to decide on the Tau Ceti pin and on the most-cited source, de la Llave–Obaya, which I could not read.

## R01 (P1) — The README treats about twenty Tau Ceti declarations as supplied, but the pinned Tau Ceti has none of them, so Layer 5, the second half of §2.2 and several proof routes rest on objects that nothing supplies

An implementer working at the pin cannot find any of these objects. Layer 5, the second paragraph of §2.2 and §4.1 item 3 are stated about the finite-atlas space `A.CkHolderSpace k α F` over `A : CompactChartAtlas I M`, and §5.1 builds `A.CrSpace` from it. Neither this roadmap nor any supplier defines that carrier for manifolds with corners: PseudodifferentialOperators §5.4 works on boundaryless manifolds and uses none of these names. The summary's claim that for real- or complex-valued maps the class "is the Banach space `C^{k,α}(M)` that Tau Ceti already has" (lines 15–16) is false at the pin.

How I checked: at the pinned Tau Ceti (manifest rev `2fd255d`), `Analysis/Holder/` contains only `Algebra`, `Basic`, `Bilinear`, `Interpolation`, `Iterated`, `Laplacian`, `Lp`, `Normed`, `One` and `Two`. There is no `FaaDiBruno`, `Inverse`, `OpenSet`, `Inclusion`, `Leibniz` or `Precomposition` file there, no `Holder`, `FiniteAtlas` or `Banach` file under `Geometry/Manifold/ContMDiffMap/Chart/`, and no `Analysis/Convolution/Holder.lean`. A search of the whole package finds none of the following:

- the carriers and their atlas theory: `CkHolderSpaceOn`, `CompactChartAtlas`, `chartHolderNorm`, `MemChartHolder`, `forall_memChartHolder_iff`, `atlasEquiv`, `finiteAtlasSeminorm`, `inclusionL`, `inclusionSuccL`, `isCompactOperator_inclusionL`;
- the Euclidean estimates: `exists_holderOnWith_iteratedFDerivWithin_comp`, `HolderOnWith.of_le_of_norm_le`, `IsCompact.exists_holderOnWith_thickening_and_norm_le`, `HolderOnWith.clm_inverse_of_norm_le`, both `OpenPartialHomeomorph` inverse estimates, `compOfFDerivL`, `HolderOnWith.superposition`;
- the Riemannian inputs: `riemannianEDist_le_mul` and `exists_pos_contMDiffAt_riemannianExp_smul_riemannianLog`.

The module docstring of `Suggested.lean` (lines 22–28) says itself that the carriers and the radius lemma are not at the pin. That contradicts README lines 15–16, 33–35, 93, 130 and 168–170 and the supplier contracts at lines 545–566.

The smallest repair has two parts:

- **Cite each object that has an owner by its section, in prose.** PDE §1.7 owns `C^{k,α}(Ω)` on open sets, with its inclusions, restriction and Leibniz estimate. PseudodifferentialOperators §5.4 owns the finite-chart norms on compact boundaryless manifolds. SmoothBundlesConnections B6.0 owns the uniform normal radius on compact sets; RiemannianGeometry only consumes it from there.
- **State as targets here what nobody owns.** That is the finite-atlas space `C^{k,α}(M, F)` with corners (or restrict Layer 5 to boundaryless `M`), the Hölder estimate for operator inversion, the compact-thickening lemma, the local Hölder inverse, the comparison of the Riemannian distance with the chart distance, and the convolution estimates of §5.4.

In either case, drop "that Tau Ceti already has". If the Tau Ceti pin is instead bumped to a commit that contains these declarations, the citations stand as written and only the docstring's list of what is not at the pin changes.

## R02 (P2) — `Suggested.lean` leaves out four headline theorems that can be stated at the pins

The summary names these results, but the acceptance test does not test them:

- the local `C^{k,α}` inverse function theorem (§3.2 item 1);
- the tangent map of a `C^{k,α}` map is `C^{k−1,α}` (§2.4);
- `Diff^{k,α}(M)` with the `C^{k,α}` topology is not a topological group (§4.3);
- `Diff^{k,α}(M)` with the lower Hölder topology is a topological group (§4.4).

The module docstring (lines 30–31) calls §3.2 and the Layer 4 topologies "statable", and it does not mention §2.4 at all. Each is statable:

- §3.2 item 1 needs only Mathlib's `PartialDiffeomorph`, `ModelWithCorners.IsInteriorPoint` and `mfderiv`, together with the file's own `ContMDiffHolderOn`.
- §2.4 needs `tangentMap` and the tangent-bundle model `I.tangent`, both at the pin, with `1 ≤ k` as a hypothesis.
- §4.3 and §4.4 need the bundled type and the chart-test topology of §4.1. These are ordinary definitions with real bodies: a structure, a set of maps, `TopologicalSpace.generateFrom`, and a supremum of induced topologies over `β < α`.

Repair: state the four results. If the topologies are judged too long to encode, the docstring should name the missing carrier instead of calling them statable.

## R03 (P2) — The definition `HolderDiff` has `sorry` in its body

At `Suggested.lean` line 142, the fields `mul_mem'`, `one_mem'` and `inv_mem'` of `HolderDiff` are all `sorry`. So every use of the subgroup depends on `sorryAx`, and the closure property it encodes is assumed rather than stated as a target. A definition must have a real body.

Repair: keep the carrier as a definition with a real body, namely the set `{f | ContMDiffHolder I I k α f ∧ ContMDiffHolder I I k α f.symm}` in `TauCeti.Diff I M k`. Then state the subgroup property as theorems: closure under multiplication, the identity and inverses, or a single theorem that some subgroup has this carrier.

- Closure under inverses is immediate: swap the two conjuncts.
- Closure under multiplication is §2.3 item 1 applied to `f ∘ g` and to `g.symm ∘ f.symm`.

## R04 (P2) — The reason given for excluding `k = 0` is false at `α = 1`, which the roadmap includes

The claim that "`C^{0,α}` homeomorphisms do not form a group" appears in the Conventions (lines 66–67) and again in §3.3 (lines 317–318). It is stated for every `0 < α ≤ 1`, and the inference fails at `α = 1`, where `α² = α`. Take the homeomorphisms that are `C^{0,1}` with a `C^{0,1}` inverse:

- the roadmap's own §2.3 item 2, with `β = γ = 1`, makes them closed under composition;
- the identity is one of them;
- the class is closed under inverses by definition.

So they form a group. The failure is real for `0 < α < 1`. For example, `f(x) = sign(x)|x|^α` near `0` has a Lipschitz inverse, but `f ∘ f = sign(x)|x|^{α²}` is not `α`-Hölder.

Repair: say "for `k = 0` and `0 < α < 1`" in both places. Taking `1 ≤ k` in `HolderDiff` can stay.

## C01 — The Check of §1.2 drops the constant `[u]_α`

The Check at line 160 says `sup |h_t| ≤ t^α`; the correct bound is `sup |h_t| ≤ [u]_α t^α`. Without the constant the inequality fails for a steep cutoff. For example, if `ψ` drops from `1` to `0` on `[1, 1.1]` and `α = 1`, then `sup |h_t| ≈ 10t` for small `t`. The conclusion `[h_t]_β ≤ C t^{α−β}` is unaffected.

## C02 — The "Invertible differential" Check of §3.4 does not test what it claims

The Check (lines 346–348) uses `x ↦ x²` on `[0, 1]` to show that the invertibility hypotheses of §3.2 cannot be dropped. But this map also fails §3.2's other hypotheses: `0` is a boundary point, item 1 asks for an interior point, and item 2 assumes boundaryless manifolds. So the example does not isolate the invertibility hypothesis.

`x ↦ x³` on `ℝ` does: it is a smooth bijection with derivative `0` at `0`, and its inverse `y^{1/3}` is only `C^{0,1/3}`.

## C03 — §4.1 item 5, second part, cites a case that §1.1 item 3 does not state

Item 5 (lines 378–380) cites "§1.1 item 3, second part, with outer exponent `k + 1 + α`" to get continuity into the `C^{k,α}` topology. But item 3 as stated has inner and outer exponent `β'` strictly above the target `β`. So it does not cover an inner exponent `k + α` with target `k + α`.

The claim itself is true: with `f ∈ C^{k+1,α}`, `Df` is Lipschitz, and `f ∘ g_n → f ∘ g` in `C^{k,α}`. Item 3's parenthetical describes de la Llave and Obaya's general version. Adding that case to item 3 as a statement would close the gap.

## C04 — The inclusion `HolderDiff I M (k + 1) α ≤ HolderDiff I M k 1` of §3.3 is ill-typed

This inclusion (lines 319–320) compares subgroups of two different groups, `TauCeti.Diff I M (k + 1)` and `TauCeti.Diff I M k`. It would read correctly through the forgetful homomorphism: the image of the first subgroup under it (`Subgroup.map`) is contained in the second.

## C05 — The smoothing construction of §5.4 does not cover boundary charts, although Layer 5 allows corners

The route (lines 479–481) convolves each chart piece with `ρ_ε`. The same is true of the cited proof of DKRH Lemma B.1, which convolves functions on `ℝ^d` that are supported in a chart (DKRH lines 2486–2499). Both need the function on a full neighbourhood, which a chart at a boundary point does not provide. Either restrict §5.4 to boundaryless `M`, or name the change at boundary charts: a mollifier supported in a cone pointing into `Set.range I`.

## C06 — The hyperbolic dynamics roadmap is described as a consumer, but it does not consume this roadmap

The overview (lines 37–40) and Downstream consumers (lines 504–508) say that HyperbolicDynamicsAndThermodynamicFormalism consumes the class and that "Layer 3 supplies its `C^{1+α}` systems". At its head, that roadmap:

- excludes the classes `C^(k,α)` of maps and diffeomorphisms in its scope;
- states its own local Hölder-derivative condition in its §8.7;
- comes earlier in the merge order.

"Could consume" would be accurate.

## C07 — The supplier paragraph of the pull request's description no longer matches the pin

The description says "The local analysis comes from the Euclidean Hölder spaces of PDE and Tau Ceti's Hölder chain rule and inverse estimates" and names RiemannianGeometry for exponential charts. At the pin, Tau Ceti has neither the chain rule nor the inverse estimates, and the uniform normal radius belongs to SmoothBundlesConnections B6.0. Revise the paragraph together with the repair of R01.

## N01 — Line 505 cites HyperbolicDynamicsAndThermodynamicFormalism by its pull-request URL; cite it by name only.

## N02 — Some backticked names are declared nowhere

`HolderMap`, `holderTest`, `HolderMap.holderTopology`, `HolderDiffeomorph.toHolderMap`, `HolderDiffeomorph.ofDiffeomorph` and `A.CrSpace` are this roadmap's own names in backticks, but `Suggested.lean` does not declare them. Write them in prose as proposed names, or declare them.

## Questions for the author

- In §4.1 item 1 (line 369), at a corner point the representative `ĝ` is only meaningful on `Set.range I`. Is "`φ = ĝ` near `L`" meant within `Set.range I`? If so, which statement supplies a `C^k` map on `E` that agrees with `ĝ` there (a Whitney or Seeley extension)? I could not settle this because neither the layers nor the supplier contracts state such an extension.
- Does the section numbering of the de la Llave–Obaya preprint (§4, §6) agree with the published DCDS version cited in the References? I could not check this because no legal copy was available.

## Verified sound

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `ContMDiffHolderAt` (§2.1) | `√x` on `Icc 0 1` at `0` | Representative `√z₀` on `{z₀ ≥ 0, \|z\| < r}`; quotient `h^{1/2−β} → ∞` for `β > 1/2` | `C^{0,1/2}`, not `C^{0,β}`; a test at interior points only would accept it |
| `ContMDiffHolder.contMDiff` | `x\|x\|` near `0` on the circle | Derivative `2\|x\|` is continuous; second derivative `2 sign x` is not | `C^{1,1}` gives `C^1`; the converse to `C^2` fails |
| `ContMDiff.contMDiffHolder_one` | `k = 0` with `sin`; `k = 1` with `x\|x\|` | `sin` has Lipschitz constant `1`; `x\|x\|` is `C^{1,1}` but not `C^2` | Holds; the converse fails |
| `contMDiffHolder_iff_maximalAtlas` | `α = 2`, `k = 1`, chart `z ↦ z + z³` | An affine representative becomes non-affine after the transition, so the Hölder-2 condition is lost | `α ≤ 1` is needed; backward direction uses compact `L = range I ∩ closedBall r ⊆ U` |
| `ContMDiffHolder.comp` (§2.3.1) | `k = 0`, `f = g = \|x\|^{1/2}` | Composite `\|x\|^{1/4}` | `1 ≤ k` is needed; for `k ≥ 1`, `[Dg∘f]_α ≤ [Dg]_α Lip(f)^α` |
| `comp_zero` (§2.3.2) | `β = γ = 1/2` | `\|x\|^{1/4}`, exponent `1/4 = βγ`; constant `≤ [g][f]^γ = 1` | Holds and is sharp |
| §2.3.3 | Smooth `φ`, `ψ` with `k = 0` | `[f∘φ]_α ≤ [f]_α Lip(φ)^α`; `[ψ∘f]_α ≤ Lip(ψ)[f]_α` | Holds |
| §2.4 tangent map | `f = x\|x\|`, `k = 1`, `α = 1` | `(z, v) ↦ (z\|z\|, 2\|z\|v)`; Lipschitz constant `≤ 2R + 2\|z\|` for `\|v\| ≤ R` | `C^{0,1}` locally; statable but absent (R02) |
| `Diffeomorph.contMDiffHolder_symm` (§3.1) | `k = 0` with `f = sign(x)\|x\|³`; `k = 1` with `x + εφ` | `k = 0`: inverse `\|y\|^{1/3}` is not Lipschitz; `k = 1`: `(f⁻¹)' = 1/(f'∘f⁻¹)` is `α`-Hölder | `hk` is needed; derivative within `range I` is invertible by the chain rule |
| §3.2 item 1 | `x³` at `0` and at `1` | At `0`: derivative `0`, inverse `y^{1/3}` is `C^{0,1/3}`; at `1`: derivative `3`, local inverse smooth | Invertibility hypothesis is needed (C02) |
| `HolderDiff` (§3.3) | `k = 0`, `α = 1/2` and `α = 1` | `α = 1/2`: `sign\|x\|^{1/2}` composed with itself has exponent `1/4`; `α = 1`: Lipschitz∘Lipschitz is Lipschitz | Closure fails only for `α < 1` (R04); body has `sorry` (R03) |
| Conventions, `k = 0` | `α = 1` | `α² = 1`; bi-Lipschitz maps closed under composition with constant `L₁L₂` | False at `α = 1` (R04) |
| §1.1 item 1 | `\|x\|^β`, `\|x\|^α` on `[−1, 1]` | Composite `\|x\|^{αβ}`; at `α = β = 1/2`, quotient `h^{−1/4} → ∞` | Holds; constant `1 ≤ 1·1^α` |
| §1.1 translation Check | `h_t(0)`, `h_t(−t)` | `t^α` and `−t^α` at distance `t`, so `[h_t]_α ≥ 2` | True |
| §1.2 interpolation | `v = \|x\|` on `[−1, 1]`, `α = 1`, `β = 1/2` | `[v]_{1/2} = 1 ≤ 2^{1/2}·1·1 = 1.41` | Holds |
| §1.2 Check | Steep cutoff, `α = 1`, `t = 0.01` | `sup\|h_t\| ≈ 0.1 > t^α = 0.01` | Constant `[u]_α` missing (C01) |
| §2.2 | Chart `T(z) = z + z³`, `k = 1`, `α = 1/2` | `D(T∘f) = T'(f)·Df` stays `1/2`-Hölder on compact `L` | Holds |
| §3.4 against DKRH (2.2) | DKRH lines 417–421 | (2.2) bounds the inverse derivative on `\|ẑ\| ≤ 1/C₁`; direct bound from `A − B = A(B⁻¹ − A⁻¹)B` | Locator correct; README's extra bound holds |
| §4.1 items 4 and 5 | Translation `τ_t`, fixed cusp `u` | `τ_t → id` in `C^k`; `[u∘τ_t − u]_α ≥ 2` | Item 5 fails at `β = α`; second part true but uncited (C03) |
| §4.2 | Circle, `g = id + δ sin(2πx)/2π` | `g' = 1 + δ cos(2πx)`: positive for `\|δ\| < 1`, vanishes at `1/2` for `δ = 1` | Open set of diffeomorphisms; boundary case behaves as expected |
| §4.3 | `f = x + εφ`, rotations `R_t` | `[D(f∘R_t − f)]_α ≥ 2ε` for all `t < 1/2` | Left multiplication is discontinuous |
| §4.4 | Same `f`, `β < α` | `[·]_β ≤ C t^{α−β} → 0`; `R_t∘f − f = t`, so `D` is unchanged | `f·R_t → f` in the lower topology only; `R_t·f → f` in both |
| §5.1 | `\|x\|^{3/2}`; `x\|x\|` | `\|x\|^{3/2}` is in `C^{1,1/2}` but not `C^{1,β}` for `β > 1/2`; `x\|x\|` is in `C^{1,1}` but not `C^2` | Inclusions and non-surjectivity hold |
| §5.2 | Circle, `u = \|x\|^α` near `0` | Riemannian distance equals `\|x − y\|` when `\|x − y\| ≤ 1/2`; quotient `1` both ways | Holds |
| §5.3 | `(f*g)^*u` | `u∘f∘g = g^*(f^*u)`; `k = 0` with `f ∈ C^{0,β}` gives only `αβ` | Anti-homomorphism holds; `C^1` hypothesis is needed |
| §5.4 against DKRH Lemma B.1 | `u = ψ\|x\|^s`, even `ρ` | `(u∗ρ_ε)(0) = ε^s∫\|z\|^sρ`; `u(0) = 0` | Rate `ε^s` attained; DKRH's `ε^{−r}` is weaker; boundary not covered (C05) |
| DKRH Theorem 1.1, (1.1) | DKRH lines 12–31 | `r ∈ ℕ`, `‖·‖_r` is the norm of `C^r(M)`, smooth measure, `C^{1+α}` | Locator correct |

- Source locators checked against the text: 4 DKRH locators (lines 12–31, 417–421, 2482–2499); 5 dLO locators could not be read.
- Library declarations opened at the pin:
  - Mathlib: `iteratedFDerivWithin_comp` (`Analysis/Calculus/ContDiff/Comp.lean:264`), `ContMDiff.contMDiff_tangentMap` (`ContMDiffMFDeriv.lean:338`), `ModelWithCorners.uniqueDiffOn` (`IsManifold/Basic.lean:347`).
  - Tau Ceti: `TauCeti.Diff` (`Diffeomorphism/Group.lean:214`), `weakWhitneyTopology` (`Topology.lean:85`), `continuous_trans` (`Composition.lean:57`), `continuous_symm` and `isTopologicalGroup` (`Inversion.lean:215, 241`), `isLocalDiffeomorphAt_of_mfderiv_eq` (`LocalDiffeomorph/Basic.lean:358`), `manifoldWeakWhitneyTopology` (`Chart/Topology.lean:72`), `riemannianExp` and `riemannianLog`, `CkHolderSpace` (`Holder/Iterated.lean:98`).
  - 21 cited names are absent at the pin (R01).
- Cross-roadmap citations resolved on main: PDE §1.7, PseudodifferentialOperators §5.4, GeometricTopology Layer 3, RiemannianGeometry (uniform radius traced to SmoothBundlesConnections B6.0); HyperbolicDynamicsAndThermodynamicFormalism read at its head.
- Dependency check: `depcheck: 132 roadmaps, 1465 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Automatic checks: one hit, the `sorry` in the body of `HolderDiff`, which is real and is R03. No changes outside the folder; no machine paths.
- Elaboration: `lake env lean` on `Suggested.lean` gives 7 `sorry` warnings and nothing else.
- `#check @` on all 11 declarations: the three definitions and `HolderDiffeomorph` drop `FiniteDimensional`, and `HolderDiff` drops `IsManifold`. This is harmless: none of them needs those binders, and preferred-chart representatives compose without transition maps.
- One-tactic probe (`rfl`, `simp`, `infer_instance`, `trivial`) on the 6 theorems: none closes, so none is padding.

Overlap check: read HyperbolicDynamicsAndThermodynamicFormalism, ComplexManifolds, ManifoldOptimization, SobolevMapsBetweenManifolds, RiemannianManifoldsWithConvexBoundary and MorseTheory; nothing shared. HyperbolicDynamics excludes the `C^(k,α)` classes and its §8.7 is a local hypothesis of its own; a search of all open heads and main for Hölder diffeomorphisms finds no second owner. The owners of the prerequisites are PDE §1.7, PseudodifferentialOperators §5.4 and SmoothBundlesConnections B6.0 (R01).

Source independence: 3 passages compared with 1 source (§3.4 with DKRH lines 417–421, §5.4 with DKRH lines 2486–2499, Downstream consumers with DKRH lines 12–27). None shares more than 6 consecutive words, all of them forced phrases ("is defined on the ball of radius"). Five further passages (§§1.2, 2.2, 3.2, 4.2, 4.3) cite no source, so there was nothing to compare them with. The largest share of locators is dLO's, 5 of 9; its text and contents could not be read. On the README's own description of dLO's sections, it informs only §1.1, so the layers cannot map onto its chapters.

Research link: Layer 3's `C^{1+α}` diffeomorphisms, §3.4's estimate (2.2) and §5.4's smoothing are the inputs that Dolgopyat, Kanigowski and Rodriguez Hertz (Ann. Math. 2024) use to prove that exponential mixing implies Bernoulli. The continuity of composition is de la Llave and Obaya (1999). This rests on the README and on DKRH lines 12–31, 417–421 and 2482–2499.

## Not verifiable

- dLO (de la Llave–Obaya, the five §4 and §6 locators of §1.1): the mp_arc preprint page (`web.ma.utexas.edu`) and the AIMS landing page of the DOI are hosts outside every licence class of the sources service, so no legal copy was found.

## Source issues

- none

## For the human reviewers

- **Not tested.** dLO has the largest share of locators (5 of 9). Its text and table of contents could not be read, so the wording and arrangement checks were not run against it.
- **Licence.** Whether the mp_arc preprint archive at `web.ma.utexas.edu` is an open repository from which dLO may be read is a human decision. If it is, the dLO locators can be checked.
- **Pin.** The description says the Hölder declarations of R01 are on Tau Ceti main but not at the repository's pin (`lake-manifest.json` rev `2fd255d`). Bumping the pin, which is outside this pull request, would change R01's repair. I checked only the pin.
