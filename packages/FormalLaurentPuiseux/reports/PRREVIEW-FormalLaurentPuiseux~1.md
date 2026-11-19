# Review of FormalLaurentPuiseux (pull request #2558 at 234a7fd)

**Verdict:** accepted

**Summary.** Accepted, with no findings. The mathematics holds up: every Check and worked example I recomputed is correct, all backticked Lean names resolve at the pins, the eight pinned headline declarations say what the README says, and the targets listed as remaining are indeed absent from the pinned Tau Ceti. There are four small corrections and four format notes, none blocking. The corrections are misplaced Frenkel locators, two ids cited by roadmaps on main that this revision drops, hypotheses that differ in two summaries, and one Check that needs `2` to be a unit. One fact is left for the human reviewers: the pinned Tau Ceti is older than the work that this folder's generated status file reports as closing several of the remaining targets.

## C01 — Eight of the nine Frenkel locators point to §1.2, which does not contain what they are cited for

A reader who follows "(Frenkel, §1.2, …)" at §§1.1, 1.3, 1.4, 2.3, 3.1, 3.4, 3.5 and 3.6 (lines 111, 172, 231, 398, 465, 539, 579, 615) finds the Galois group of `ℂ((t))`, flat bundles and connections on the punctured disc (FrenkelLoop lines 635–1020, pp. 9–18). There are no formal coordinates, no change of parameter at `0`, no Kähler one-forms, no residue duality and no loop cocycle. The statements rest on the named declarations, so no result is affected, but the pointers send the reader to the wrong place.

Frenkel does treat each of these, elsewhere:
- formal coordinates and `Aut O`, with the composition law of Convention 7: §3.5.3, pp. 90–91 (lines 4059–4084), for §§1.3–1.4;
- `Der₀ O = t ℂ[[t]] ∂_t`: §3.5.4, p. 92 (lines 4116–4118), for §1.6;
- coordinate independence of `Res(f dg)`: §3.5.2, p. 90 (lines 4041–4042), for the case `e = 1` of §3.1. The order-`e` formula is not in Frenkel;
- the residue pairing of `ℂ((t))/ℂ[[t]]` with `ℂ[[t]] dt` and its `Aut O`-invariance: §3.5.5, pp. 94–95 (lines 4279–4286), for §§3.4–3.5;
- the cocycle `(A, B) Res f dg`: §1.3.5, Lemma 1.3.2, equation (1.3-3), p. 28 (lines 1412–1417), for §3.6.

Only the citation at §4.3 fits §1.2 (§1.2.1, p. 9). Replace each locator with the corresponding one, or drop it where nothing fits (§1.1). The References entry (line 1674) repeats "§1.2, for the … local-parameter setting" and would be amended in the same way.

## C02 — Two ids that roadmaps on main cite disappear with the new headings, and the README gives no old → new numbering

ClassicalArithmeticCompletion (its README, line 5499 on main) links to the anchor `#l5-newton-polygons-and-formal-newtonpuiseux`. The heading `## Layer 5: Newton polygons and formal Newton–Puiseux` no longer produces that anchor. PadicDifferentialEquationsAndRigidCohomology cites "FormalLaurentPuiseux §L3" (lines 454, 9757, 9773 and 9778 on main). A reader can guess that L3 is Layer 3, but the link breaks at merge.

One sentence fixes both, for instance after the guide to the layers: "Layers L1–L7, as other roadmaps cite them, are Layers 1–7 below." Alternatively, an explicit anchor `<a id="l5-newton-polygons-and-formal-newtonpuiseux"></a>` above the Layer 5 heading would keep the link. With either repair, the description's sentence that citations of "L1–L3", "L5" and "L7" elsewhere "still resolve" becomes true. As it stands, the linked citation does not resolve.

## C03 — Two summaries state headline results with hypotheses other than those of the declarations

The opening summary (line 19) calls the continuous one-forms "universal for continuous derivations into Hausdorff `F`-modules". §2.3 (line 406) and `TauCeti.ContinuousKaehlerDifferential.existsUnique_compDer_eq` also require continuous scalar multiplication (`[ContinuousSMul (LaurentSeries K) M] [T2Space M]`). Add "with continuous scalar multiplication".

The Layer 6 bullet of the `Suggested.lean` docstring (lines 27–29) puts the trace statement under "For such `K`", that is `K` algebraically closed of characteristic zero. There the condition "`e` nonzero in `K`" is automatic. The pinned `…coeff_neg_one_equivLaurentSeries_trace` holds over every field with `NeZero (d : K)`, as §6.4 says. A separate sentence, "Over every field `K`, when `e` is nonzero in `K`, …", would match it.

## C04 — The Check of §1.5 that the `2`-jet group is not commutative needs `2` to be a unit in `R`

The witness `2t` (lines 262–264) is a coordinate only when `2 ∈ Rˣ`, and the claim fails when `Rˣ = {1}`. Over `𝔽₂`, the stated law `(a₁, a₂)(b₁, b₂) = (a₁b₁, a₁b₂ + a₂b₁²)` gives `(1, a₂ + b₂)` in both orders. Setting `a₂ = 0` in the law shows that the `2`-jet group is commutative exactly when `Rˣ = {1}`. Add "when `2` is a unit in `R`, for instance over `ℚ`".

## N01 — The remaining targets and the headline theorems of Layers 6 and 7 carry no source locator

The remaining targets are §1.2 (no limit), the Hasse–Leibniz rule of §2.1, §§3.5–3.6, §6.1 and §7.3. Every other statement is backed by a named declaration; these are not. Frenkel §1.2.1, pp. 9–10 (lines 656–668) states the Layer 7 identification over `ℂ`, and footnote 3 of §1.3.5, p. 27 (lines 1386–1388) gives the lattice topology on `g((t))` used in §§3.5–3.6.

## N02 — "Mannaa–Coquand, §1" would be more useful as theorem locators

- §5.2: Lemma 1.7, pp. 4–5.
- §5.3: Lemma 1.8 and Theorem 1.9, pp. 5–7. Theorem 1.9 assumes separability over `K((X))`, which the README's route does not need.
- §5.4: Corollary 1.10 and Lemma 1.13, pp. 7–8.

## N03 — The `Suggested.lean` docstring says that the file states the headline theorems and then that it states none of them

Lines 13 and 15–16 contradict each other. Line 13 could read "It records the roadmap's headline theorems by pinning the declarations that prove them."

## N04 — The Mathlib links in the References use commit `6b7abb3`, not the pinned `1b1ccf4`

Both files exist at the pin, so the links could point to the pinned commit.

<details><summary>What was checked</summary>

The automatic checks passed. The targeted build of `Suggested.lean` elaborated without errors or warnings, and the dependency check reported no upward or cyclic edge. There is no earlier review. I sampled 15 targets and read all 12 inline source locators in the two cited texts. Not verifiable: the Lean files of Dean Cureton's repository (only its README page was read). The Frenkel page numbers are those of the author's draft at the cited URL.

</details>

## Verified sound

| Statement | Instances tried | Computed values | Library or source side | Result |
|---|---|---|---|---|
| §1.4 formal coordinates | inverse of `t + t²`; `1 + t`; group law | inverse `t − t² + 2t³ − 5t⁴ + 14t⁵`; `1 + t` has `a₀ = 1`, excluded | `(φ*ψ) = φ.subst ψ`; `substAlgEquiv_mul`: `σ_(φψ) = σ_ψ∘σ_φ`; Frenkel §3.5.3: `a₀ = 0`, `a₁ ≠ 0` | sound; locator C01 |
| §1.5 jet groups (Check) | `(1,1)(2,0)`, `(2,0)(1,1)`; `R = 𝔽₂` | `(2,4)` vs `(2,2)`; over `𝔽₂`: `(1,a+b)` both orders | law `(a₁b₁, a₁b₂+a₂b₁²)` recomputed from `φ(ψ)` mod `t³` | Check needs `2 ∈ Rˣ`: C04 |
| §1.6 commutator sign | `e₁² = e₂² = 0`; `a = t`, `b = t²` | product `1 + e₁e₂(AB − BA)`; `aDb − bDa = 2t² − t² = t²` | `infinitesimalSubstAlgEquiv (e) (e^2 = 0) (a : S⟦X⟧)`, no condition on `a` | sound |
| §2.1 derivative orders | char `p`, `f = tᵖ + tᵖ⁺¹`; `f = 0` | `Df = tᵖ`, order `p`, not `p − 1`; `f = 0`: `0 = 0` | `coeff_derivative_order_sub_one`: `coeff_(ord−1) = ord • lc`; no Laurent Hasse–Leibniz in Mathlib `LaurentSeries.lean:133–182` or Tau Ceti | sound; target absent |
| §§2.2–2.3 one-forms (headline) | char 0, derivation `∂` killing `K(t)`, `∂(exp t) = 1` | `∂` discontinuous; `ℓ(dg − Dg dt) = ∂g ≠ 0`, so `Ω → Ω¹_cont` not injective | `existsUnique_compDer_eq` needs T2, ContinuousSMul, IsScalarTower | sound; summary hypothesis C03 |
| §3.1 finite-map formula (headline) | `φ = t²`, `f = t⁻¹`; `φ = t²+t³`, `f = t⁻²`; char `p`, `φ = tᵖ` | residue `2 = 2·1`; `0`; both sides `0` | `…_eq_nsmul`: `φ.order.toNat • f.coeff (−1)`, hypotheses `a₀ = 0`, `φ ≠ 0` | sound |
| §3.2 coefficient identity | `u = 1+t`: `e = k = 1`; `e = 2`, `k = 1` | `−1 + 1 = 0`; `2 − 2 = 0` | recomputed from the residue of `φ^(−k−1)dφ`, `φ = tᵉu` | sound |
| §3.4 residue duality | orthogonal of `U_a`; `U₀/U₂` vs `U₋₂/U₀` | `g_k = 0` for `k ≤ −1−a`, so `U_(−a)`; pairs `1↔t⁻¹`, `t↔t⁻²` | Frenkel §3.5.5 p. 94: dual bases `tⁿ`, `t^(−n−1)dt` | sound; locator C01 |
| §3.5 vector-valued dual | `V((t))/U_a(V)`; `g = v*t⁰` | `≅ ⊕_(m<a) V`, so no finiteness needed; vanishes on `U_a` iff `a ≥ 0` | `residueDualEquiv`: CommRing, discrete `R`, no finiteness; no `CompleteSpace` in `Lattice.lean` | sound; targets absent |
| §4.1 ramified embeddings | `ι₂(u+u³)`, `ι₄(u²+u⁶)`; `t^(1/2)` in level 4 | both `t^(1/2)+t^(3/2)`; `t^(1/2) = ι₄(u²)`, so "denominator exactly n" is wrong | images meet in `ι_gcd`: denominators dividing both | sound |
| §4.2 level colimit | universe of the target algebra | colimit in `CommAlgCat K` at `K`'s universe | `levelCoconeIsColimit`, no further hypotheses | sound |
| §4.4 levels over `F` | `Xⁿ − t`; levels 4 and 6 | Eisenstein at `t`; meet is level 2, join level 12; `1/4 + 1/6 = 5/12` | `level_inf_level`, `level_sup_level` | sound |
| §5.2 Hensel lifting | `Y² − (1+t)`; `Y² − t` | `s = 1 + t/2 − t²/8 + t³/16`; `Y·Y` not coprime, Eisenstein | uniqueness `eq_and_eq_of_mul_eq_mul_of_isCoprime` over any CommRing; M–C Lemma 1.7 constructs only | sound |
| §§5.3–5.4 Newton–Puiseux (headline) | char `p`: `Yᵖ − Y − t⁻¹`; slope normalisation | `y = Σ t^(−1/pⁱ)`, `yᵖ = t⁻¹ + y`, unbounded denominators; `q·ord aᵢ − p·i ≥ 0` | `exists_isRoot_map_expand`: IsAlgClosed, CharZero, `degree ≠ 0`; M–C Thm 1.9 assumes separability | sound |
| §6.1 Kummer automorphisms | `σ(u)/u`; `η = i` restricted to level 2 | root of unity of `K((u))` lies in `K`; restriction `η^(m/n) = −1`; `(iu)² = −t` | `exists_eq_transition_comp_kummer`: transition ∘ `kummer_n η`, any field | sound |
| §6.2 finite extensions (headline) | `K = ℚ`, level 4; `L` infinite-dimensional | Galois closure `D₄`: unique quadratic subfield is level 2; `finrank 0 ≠ e` | `nonempty_algEquiv_iff`: `finrank = e`; the `d!` bound uses the `HasEnoughRootsOfUnity` hypothesis stated | sound |
| §6.3 local invariants | `Tr(uᵏ)` on level `d` | `d t^(k/d)` if `d ∣ k`, else `0` (trace of the multiplication matrix); `e = d`, `f = 1` | `trace_parameter_zpow`, `ramificationIdx_maximalIdeal` | sound |
| §6.4 trace and residues (headline) | level 2, `u⁻¹du` | `= ½ t⁻¹dt`; `Res_u = 1`, `Tr` gives `t⁻¹dt`, `Res_t = 1`; `d·Res` would give 2 | any field, `NeZero (d : K)` | sound; docstring C03 |
| §7.1 Galois group of the Puiseux field | Krull limit; level-`n` stabiliser | `≅ lim μₙ(K)`; stabiliser is `ker projₙ` | `isGalois` needs only `HasEnoughRootsOfUnity`; Frenkel §1.2.1 pp. 9–10 matches | sound |
| §7.2 `Gal(F) ≅ ℤ̂` (headline) | `ζ′ = ζ^u`; `u = −1` over `ℂ` | coordinate `a ↦ a/u`; `1 ↦ −1` | `…_eq_gen_iff` for any `π` of order 1 | sound |
| §7.3 roots of uniformizers | `θₘ^(m/n)`; lift of `t ↦ t + t²` | `= θₙ`; `u ↦ u(1+uⁿ)^(1/n)` commutes with `u ↦ ζu` | no inertia file in `Puiseux/Galois/` at the pin; `exists_pow_eq_of_isUnit` needs `(n : K) ≠ 0` | sound; targets absent |

- Source locators: all 12 inline locators read at their sections (9 FrenkelLoop, 3 MannaaCoquand2013), plus Frenkel §§1.2.1, 1.3.5, 3.5.2–3.5.5 and M–C Lemmas 1.7, 1.8, 1.13, Theorem 1.9 and Corollary 1.10.
- Library: all 535 backticked identifiers checked by `#check` at the pins. The 4 rejected are scopes (`TauCeti.PowerSeries.WithValuationTopology`, `TauCeti.HahnModuleDualTopology`, `PowerSeries.WithPiTopology`) and the external `PuiseuxSeries.isAlgClosure`, as the README says. All 96 cited file paths exist.
- Files opened at the pins: Tau Ceti `RingTheory/LaurentSeries/Lattice.lean` (94–616), `Convergence.lean` (129–141), `HahnModuleDerivative.lean` (77–268), `Ramified.lean` (96, 239, 362, 374), `Puiseux/FiniteExtension.lean` (76–90), `PowerSeries/Coordinate/Basic.lean` (118–140); Mathlib `RingTheory/LaurentSeries.lean` (133–182, 821, 891), `AdicCompletion/Completeness.lean` (225).
- Cross-roadmap citations resolved: AlgebraicCurves §§5.7 and 9.2, NewtonPolygons §§1.2, 2.1 and 3.2, Completed/ProfiniteArithmetic Layer 0, FormalConnectionsOpers, AffineLieAlgebras (main and its open head), PainleveEquations, ClassicalArithmeticCompletion line 5499, PadicDifferentialEquationsAndRigidCohomology lines 454 and 9757–9778.
- Dependency check: `depcheck: 200 roadmaps, 2197 edges, 0 problem(s)`. Automatic checks: all passed.
- Elaboration: `Suggested.lean` elaborates with 8 `#check` outputs and no warnings. It declares nothing, so there are no section-variable losses. Each pinned type was compared with its README statement: nothing differs beyond C03.

Overlap check: read AffineLieAlgebras (open, and on main) and NewtonPolygons (main); the third list was empty. Shared objects: `HahnModule ℤ K L` with its bracket is owned here (§3.6), and AffineLieAlgebras A1.1 owns the currents `F ⊗ L` and consumes it. The general polygon geometry is owned by NewtonPolygons and the Laurent specialisation here (§5.1), with NewtonPolygons consuming it. The open pull requests that cite this roadmap (ColemanIntegrationPartII, RealSurfacePeriodIndex, ComputationalNumberTheory, HigherLocalClassFieldTheory) only consume it.

Source independence: 14 passages compared with 2 sources, none shared beyond forced formulas; largest share FrenkelLoop, 9 of 12 locators; contents compared with FrenkelLoop (Ch. 1–10) and MannaaCoquand2013 (§§1–3): independent.

Research link: Layers 1–3 and 7 are the formal-disc calculus (`Aut O`, the residue cocycle, `Gal(ℂ((t))) ≅ ℤ̂`) that Frenkel (2007) uses for local geometric Langlands (FrenkelLoop §§1.2.1, 1.3.5, 3.5). Layer 5 is the Newton–Puiseux theorem of Mannaa–Coquand (2013, after Abhyankar). Rests on the README's References and both texts read.

## Not verifiable

- Dean Cureton's Puiseux repository: only its README page was read, which names `PuiseuxSeries.isAlgClosure`; its Lean files were not opened.
- FrenkelLoop is the author's draft at the cited URL; its page numbers may differ from the printed edition.

## Source issues

- **Misprint** in MannaaCoquand2013 at Lemma 1.7, proof, p. 5 (line 146): the source bounds the degree of the second family of corrections by naming `G_ℓ` again; it should be `H_ℓ`, with degree less than `s`; affects nothing.

## For the human reviewers

- The pinned Tau Ceti is `2fd255d` (4 Nov 2026). The folder's generated `STATUS.md`, up to `385ec2d` (6 Nov), reports remaining targets as proved there, e.g. completeness of `V((t))` and `TauCeti.puiseuxField.inertiaSubgroup_eq_top`. Every headline is already proved at the pin.
