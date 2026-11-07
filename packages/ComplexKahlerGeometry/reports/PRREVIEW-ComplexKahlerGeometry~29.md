# Review of ComplexKahlerGeometry (pull request #1398 at 80b9617)

**Verdict:** needs changes

Full review. The folder changed by 355 lines since ac2f5a7. This head adds three Weierstrass statements to `Suggested.lean`. It also replaces the README's own constructions of the pointwise Hodge star, the type calculus, ∂/∂̄ and the Nijenhuis tensor with a contract on Tau Ceti declarations, narrows §5.1 to a chart-local operator core and adds an old → new anchor map. Seven findings: one P1, three P2, three P3.

## Previous findings

The previous report (r12, at ac2f5a7) raised no finding of its own. It carried two older dispositions:

- Round-5 R07 (item-disjoint mutual citations with RealAnalyticGeometry, AlgebraicTopology and DGFloer, all on main): unchanged, and the movable dependency check still prints 0 problems. Not re-raised.
- Round-5 R05 accepted that this roadmap, on main, keeps Layer 2's Cauchy–Green/Runge/planar exactness, §5.1's operator core, §8.1's Lie-algebra complex and §6.1's relative integration. The stated reason was that citing the other owners would be an upward citation of an open pull request. That reason still holds for GlobalHolomorphicFunctions (open) and DeRhamCohomologyAndDuality (open), so those parts are not re-raised. It no longer holds for PseudodifferentialOperators and LieGroupoidsPoisson, both on main since 2026-11-04: see R03.

## R01 (P1) — The README's Tau Ceti contract cites declarations that the pinned Tau Ceti does not have

Location: `README.md:32–34` ("The pinned Tau Ceti owns the pointwise real Hodge star of an oriented inner product space, its complex-linear and conjugate-linear extensions with their type law, and the Hodge star and codifferential of smooth real forms; §5.1 consumes them"). Also lines 166–168, 180–208, 303–324, 331–332, 355, 985–1017, 1058 and 1072.

Claim: this head pins Tau Ceti at 358314d (`lake-manifest.json`). None of the following exists there:

- the Hodge stars: `Orientation.hodgeStar`, `formHodgeStar`, `complexHodgeStar`, `barHodgeStar`, `volumeEquiv`, `TauCeti.RoughForm.hodgeStar`, `TauCeti.SmoothForm.hodgeStar`;
- the form algebra: `TauCeti.alternatingFormEquiv`, `TauCeti.alternatingFormInner`, `TauCeti.adjoint_wedgeLeft`, `TauCeti.SmoothForm.codifferential`;
- the complex structure: `TauCeti.SmoothAlmostComplexStructure.nijenhuis`, `del`, `delBar`, `TauCeti.SmoothForm.IsOfType`, `ofComplexManifold`, `nijenhuis_ofComplexManifold`.

The files the contract names are absent too: `TauCeti/Analysis/InnerProductSpace/HodgeStar/*`, `Riemannian/HodgeStar.lean`, `Riemannian/Codifferential.lean`. §1.1 and §5.1 deleted their own constructions in favour of these names. At the pin, the pointwise real and complex stars, the type decomposition, ∂, ∂̄ and the Nijenhuis tensor that K1, K2, K5a and K5b consume therefore have no owner.

Witness: at 358314d, `grep -rl -e hodgeStar -e nijenhuis -e delBar -e alternatingFormEquiv` over pinned `TauCeti/` finds nothing, and `git show 358314d:…/Symplectic/Manifold/Nijenhuis.lean` finds no such path. All exist at main's pin 2fd255d, a descendant.

Repair (route a, recommended): merge main into the branch, so that the manifest pins Tau Ceti 2fd255d and Mathlib 1b1ccf4. At 2fd255d I resolved every contract name file by file: `HodgeStar/{Basic,AlternatingForm,Complex,Contraction,Isometry}.lean`, `Analysis/InnerProductSpace/AlternatingForm.lean`, `Riemannian/{HodgeStar,Codifferential}.lean`, `DifferentialForm/AlmostComplexType.lean`, `DifferentialForm/Dolbeault/Basic.lean`, `Symplectic/Manifold/{Nijenhuis,AlmostComplex/Eigenbundle}.lean` and `Manifold/Complex/AlmostComplexStructure.lean`. Then re-run `lake env lean` on `Suggested.lean` and the gate at the new pins. At that pin three further changes are needed:

- `realified_isManifold_analytic` restates `IsManifold.restrictScalars_of_ne_zero` with `n := ω` and `m := ∞` (`TauCeti/Geometry/Manifold/Complex/Analytic.lean:115`, same binders). Delete it from `Suggested.lean` and cite the declaration in K3.0.
- Line 1644 ("Own `d*=(−1)^(m(k+1)+1)*d*`") is the definition of `TauCeti.SmoothForm.codifferential`: `Codifferential.lean:88–91` defines it as `(−1)^(m(k+2)+1)⋆d⋆` on (k+1)-forms, the same sign. Cite it rather than own it.
- Re-audit K5a's real de Rham statements against `TauCeti/Geometry/Manifold/DeRham/` (for example the de Rham complex in `DeRham/Basic.lean`, which §5.4 attributes to DifferentialGeometry).

Route b, if the branch keeps 358314d: restore §1.1's eigenbundle/type-projection/Nijenhuis constructions and §5.1's real and complex pointwise star as targets (the ac2f5a7 text), and delete contract lines 180–208.

## R02 (P2) — `Suggested.lean` and the README disagree about what the pin provides; on the README's account, three headlines are statable and absent

Location: `Suggested.lean:19–20` ("Newlander–Nirenberg needs the Nijenhuis tensor and the comparison between a complex atlas and its induced smooth almost-complex structure"). Also lines 21–22 (Dolbeault–Grothendieck needs "the manifold type-form bundles, their differential") and 36 ("Hodge star, geometric adjoints"), against `README.md:303–332` and 180–208.

Claim: the README says the pinned Tau Ceti has exactly the carriers the module docstring lists as missing. At the pin the README describes, which is where R01's route a takes this branch:

- Newlander–Nirenberg, in the local form of `README.md:327–330`, is statable with `TauCeti.SmoothAlmostComplexStructure` and `nijenhuis`. Tau Ceti already proves the converse.
- The local Dolbeault–Grothendieck lemma is statable with `delBar` and `IsOfType` on an open polydisc subtype of `Fin n → ℂ`, with J = `ofComplexManifold`.
- The de Rham Hodge decomposition on compact oriented Riemannian manifolds is statable with `SmoothForm.hodgeStar`, `codifferential` and Tau Ceti's `deRhamCohomology`.

Statable headlines that are absent are P2.

Witness: at 2fd255d, `nijenhuis (x : M) : TangentSpace I x →L[ℝ] TangentSpace I x →L[ℝ] TangentSpace I x` (`Symplectic/Manifold/Nijenhuis.lean:158`) and `delBar : SmoothForm I M F k →ₗ[ℂ] SmoothForm I M F (k + 1)` (`Dolbeault/Basic.lean:95`).

Repair: on route a, add the three statements and rewrite the docstring bullets for Layers 1, 2 and 5 so they name only carriers still missing. For Newlander–Nirenberg, the shape below fits the declarations at 2fd255d. It was not elaborated here, because this worktree's packages are at 358314d; elaborate it after the merge.

```lean
theorem newlander_nirenberg {E : Type*} [NormedAddCommGroup E] [NormedSpace ℂ E]
    [FiniteDimensional ℂ E] {M : Type*} [TopologicalSpace M] [ChartedSpace E M]
    [IsManifold 𝓘(ℝ, E) ∞ M] (J : TauCeti.SmoothAlmostComplexStructure 𝓘(ℝ, E) M)
    (hJ : J.nijenhuis = 0) (x : M) :
    ∃ e ∈ IsManifold.maximalAtlas 𝓘(ℝ, E) ∞ M, x ∈ e.source ∧
      ∀ y ∈ e.source, ∀ v : E,
        mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) e y (J y v) = Complex.I • mfderiv 𝓘(ℝ, E) 𝓘(ℝ, E) e y v
```

On route b, delete the README contract instead; the docstring then stands as written.

## R03 (P2) — Two owners for PseudodifferentialOperators' operator core and LieGroupoidsPoisson's Lie-algebra complex, each naming the other as consumer

Re-raised: R05 of the round-5 review. Its reason (that citing these owners would be an upward citation of an open pull request) fails for both, because both have been on main since 2026-11-04.

Location: `README.md:24–30` ("Layer 5 owns the chart-local differential-operator core … the density transpose, the metric formal adjoint, the connection Laplacian and the Laplace-type predicate (§5.1). PseudodifferentialOperators P1.0 owns jet bundles … and consumes this core"). Also lines 37–38, 45–48, 341 and 2645–2650.

Claim: PseudodifferentialOperators P1.0 on main constructs the density transpose, the metric formal adjoint, ∇*∇ and the Laplace-type predicate, and names K5a as their consumer. RiemannianGeometry on main consumes them from P1.0, not from §5.1. So the new statements that P1.0 and RiemannianGeometry R7 consume §5.1's core contradict both roadmaps. LieGroupoidsPoisson §G1.3a on main states the same all-degree real complex `Alt^k_ℝ(L,V)`, with the same differential and the same `oneCochain`/`twoCochain`/`d₁₂`/`d₂₃` comparisons as §8.1, and names K8 as its consumer. LieGroupoidsPoisson consumes nothing from this roadmap.

Witness:
- `PseudodifferentialOperators/README.md:404–407`: P1.0 constructs the transpose and adjoint, which K5a extends; `:438–441`: K5a consumes P1.0's Laplace-type predicate.
- `RiemannianGeometry/README.md:92`: formal adjoints come from P1.0.
- `LieGroupoidsPoisson/README.md:85–86`: K8 consumes §G1.3a.

Repair (tested):

- In §5.1, cite PseudodifferentialOperators P1.0 for the operator space, principal symbol, density transpose, metric formal adjoint, ∇*∇ and the Laplace-type predicate. Delete their construction (lines 1074–1137, keeping the density line that P1.0 consumes), and repoint 1368, 1534–1537, 1660 and 1912. In Scope (24–31, 45–48) and in "Downstream consumers" (2645–2649), record P1.0 as the owner and drop the consumer claims about it.
- In §8.1, cite LieGroupoidsPoisson §G1.3a for the real complex. Keep here, in one clause, only the complex-field version and the pullback, DGA, scalar-extension and left-invariant adapters. Correct lines 37–38, 48 and 2650, and line 341, which reverses the direction LieGroupoidsPoisson states at `:86–91`.

A scratch copy with *Needs:* lines citing P1.0 (in §5.1's operator block) and §G1.3a (in §8.1) gives `depcheck: 239 roadmaps, 2428 edges, 0 problem(s)`. The P1.0 edge restores the item-level order that PseudodifferentialOperators records at `:95–97` (K5a's density line, then the P1.0 adjoints, then K5a's distributions), which is the pattern round 5 R07 accepted. The alternative, keeping §5.1 as owner, needs a PseudodifferentialOperators revision outside this folder, and that revision would have to be named in the description.

## R04 (P2) — DifferentialGeometry ids cited as suppliers are dropped by the open DifferentialGeometry revision (#886)

Location: `README.md:1072` ("*Needs:* DifferentialGeometry §§0.1–0.4, 5.5; …"), 1139 ("DifferentialGeometry §5.5 integration") and 2083 ("*Needs:* DifferentialGeometry §§5.2, 8.3–8.5; …"). Also prose at 1027, 1449, 1454, 2043, 2066, 2185 and 2678.

Claim: at the head of #886, DifferentialGeometry's item 5.5 is split into 5.5a (densities) and 5.5b (corner Stokes), and Layers 6–11, including 8.3–8.5, are gone. Their content is assigned to DeRhamCohomologyAndDuality, and the revision gives no old → new map. These are supplier citations, so they break when #886 merges.

Witness: the DifferentialGeometry README at #886 defines 5.5a at line 841 and 5.5b at line 850, has no Layer 8 heading, and reassigns de Rham cohomology through the de Rham theorem to DeRhamCohomologyAndDuality (lines 17–18, 258–262).

Repair:

- Cite "DifferentialGeometry §5.5 (5.5a at the head of its open revision)" at 1027, 1072, 1139 and 1454.
- For 8.3–8.5, the new owner is an open roadmap that this roadmap, on main, cannot cite (round-5 R05). Keep main's ids at 1449, 2043, 2066, 2083, 2185 and 2678, and state in the description's merge-order paragraph that this pull request merges before #886, which then owes the old → new map.

## R05 (P3) — §5.7 (K5b.0) has no Checks, no *Needs:* line and no locators

Location: `README.md:1812–1850`, from "### 5.7 Local Hermitian identities (K5b.0)" to §5.8; for example "Prove `dvol_g=ω^n/n!` for the complex orientation."

Claim: §5.7 defines `barStar_E`, the wedge and contraction operators and the Gram dual, and states `dvol_g=ω^n/n!` and `∂̄*=−*∂*`. It is the only numbered subsection with no `**Checks.**` and no `*Needs:*` line, and none of its identities has a locator.

Witness: a heading scan gives §5.7 0 Checks blocks and 0 *Needs:* lines; every other numbered subsection has at least one. `dvol_g=ω^n/n!` is Demailly VI (4.2), p. 296 (`demailly-agbook` line 14675).

Repair:

- Add *Needs:* "K1, K2, K4; §5.1's density line, formal adjoints and complex stars; SmoothBundlesConnections B2", and API bullets.
- Add at least three Checks, with values computed here:
  - on ℂ with the standard metric, `dvol=dx∧dy=ω¹/1!`;
  - `|dz|²_Gram=2` (move it from §5.8), against 1 for the h_T-dual metric;
  - `dz∧barStar(dz)=dz∧(i dz̄)=2dx∧dy=⟨dz,dz⟩dvol`, which the complex-linear star fails, since `*dz=−i dz` gives `dz∧*dz=0`;
  - for `ψ=dz/√2`, `(e_ψ i_ψ+i_ψ e_ψ)1=1`.
- Cite Demailly VI (4.2), p. 296 for the volume identity, (3.6), p. 292 for the conjugate-linear star, and (3.9), p. 292 with VI §7's `D*=−⋆D⋆` (line 15370, p. 309) for `∂̄*=−*∂*`.

## R06 (P3) — Two locators

Location: `Suggested.lean:123` ("**Uniqueness in Weierstrass preparation** (Demailly II, (2.1), p. 80)"); `README.md:1669` ("Use §1.1's exterior derivative of rough forms") and 1670–1671 ("the smooth-section carrier of §0.4").

Claim: Demailly's (2.1) states existence only. Uniqueness of the unit and the coefficients follows from the uniqueness clause of (2.3), applied to dividing `w^d` by `f = uP`, which gives quotient `u⁻¹` and remainder `−Σ a_i w^i`. In §5.5, "§1.1" and "§0.4" read as this roadmap's own sections (§1.1 is K1), but the *Needs:* line shows that DifferentialGeometry's are meant.

Witness: `demailly-agbook` lines 3794–3800 (statement of (2.1): existence only) and line 3817 (the uniqueness sentence of (2.3), p. 80).

Repair: cite "(Demailly II, (2.1) and the uniqueness in (2.3), p. 80)", and write "DifferentialGeometry §1.1" and "DifferentialGeometry §0.4" in §5.5.

## R07 (P3) — Four open pull requests change this folder and conflict with this one, with no stated order

Location: the pull-request description. Its dependency block names #271, #1027 and #1028, but no order relative to #1234, #1807, #1808 or #1854.

Claim: the overlap facts show conflicting heads in this roadmap's files, and no merge order is stated.

Witness: #1234 (normal frames, Picard and projective examples) and #1807 conflict with this head in `README.md` and `Suggested.lean`; #1808 and #1854 conflict in `Suggested.lean`.

Repair: state in the description which pull request is rebased on which (for example, #1234 rebases onto this one), and do not restate here what #1234 changes.

## Verified sound

### Gate, build, signatures, padding

- Worktree at `80b96178d9542b74d0bee8924b4770b663d76ed3`, clean. The diff outside the folder against the merge base is empty.
- Gate rerun: every counter 0, `OK`, exit 0. This run printed no `build` counter; the worker's gate shows `build=0`.
- `lake env lean TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean`: exit 0, exactly 8 warnings, all ``declaration uses `sorry` `` (lines 65, 85, 114, 126, 144, 161, 170, 179).
- Movable dependency check on this head:

```text
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

- `#check @…` for all 8 declarations in one scratch file: the elaborated types are identical to the worker's signature listing. No binder is lost: `FiniteDimensional ℂ E`, `I.Boundaryless`, `T2Space P`, `SecondCountableTopology P` and the analyticity, order and eventual-equality hypotheses all occur in the types.
- Padding probe: each `sorry` replaced by `first | rfl | simp | infer_instance | exact?`, elaborated once. 0 of 8 closed (three `unsolved goals` after `simp` made progress, five `exact?` failures). At 2fd255d, `realified_isManifold_analytic` would close by one declaration (R01).
- Header: `module`, `public import Mathlib`, `@[expose] public section`. No other import, no `set_option`, no `lemma`, no sorry'd data.

### Library declarations opened at the pins

Mathlib f6090c7:

- `exteriorPower.hodgeStar` and `exteriorPower_hodgeStar_eq_wedgePairing` (`LinearAlgebra/ExteriorPower/HodgeStar.lean:48, 53`);
- `CovariantDerivative.leviCivitaConnection` (`…/CovariantDerivative/LeviCivita.lean`);
- `ImplicitFunctionData.contDiffAt_implicitFunction` (`Analysis/Calculus/ImplicitContDiff.lean:41`);
- `MDifferentiable.isLocallyConstant` and `exists_eq_const_of_compactSpace` (`Geometry/Manifold/Complex.lean:154, 169`);
- `MvPolynomial.mul_esymm_eq_sum` (`RingTheory/MvPolynomial/Symmetric/NewtonIdentities.lean:221`);
- `PowerSeries.IsWeierstrassFactorization` (`RingTheory/PowerSeries/WeierstrassPreparation.lean:658`).

Tau Ceti 358314d:

- `analyticAt_implicitFunction` (`Analysis/Analytic/Inverse.lean:129`);
- `SmoothAlmostComplexStructure` (`Geometry/Symplectic/Manifold/AlmostComplex.lean:67`);
- `SmoothTwoForm.Compatible` (`…/TwoForm.lean:157`).

Duplication of the new Weierstrass statements: Mathlib's `WeierstrassPreparation.lean` is formal power series over a complete local ring. Tau Ceti's `RingTheory/PowerSeries/Weierstrass/*` and `MvPowerSeries/TateAlgebra/*` are restricted series over complete ultrametric rings, which excludes ℂ. Neither states convergent preparation or division on `(Fin n → ℂ) × ℂ`.

### Cross-roadmap citations resolved

- VariationalMethods at #1028: `CompactFormPair.operatorDomainV` (README line 845), `exists_compact_selfAdjoint_shifted_inverse` (849) and `mem_operatorDomainV_iff_summable` (884). These are the worker's three leads; they are not defects.
- UnboundedOperators at #1027: §4.7 (UO-D06) `existsUnique_selfAdjoint_of_closed_form` (lines 512, 534).
- DeRhamCohomologyAndDuality at #1768: §§2.4, 3.1–3.3 and 4.1 exist (lines 384, 443, 465, 486, 512). Its lines 70–76 and 692–700 claim the same ownership; this is the settled round-5 disposition for an open roadmap, not re-raised.
- GlobalHolomorphicFunctions at #992: lines 953 and 1964–1969. Same settled disposition.
- CalibratedGeometry at #946 consumes K1–K5a and leaves K6.1's singular-set Stokes and finite mass to this roadmap (its §4.3); there is no reverse edge.
- The anchor map at `README.md:212–224` covers every anchor of main's `## K1.`–`## K8.` headings. Main cites three of them (`#k2-…` once, `#k5-…` four times, `#k7-…` three times).
- Ownership against #848 (ComplexComparisonPartII) and #1609 (SobolevDifferentialForms) was not checked, because their files are not available here.

### Adversarial pass

| Statement / convention | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `weierstrass_preparation` | n=0, f=w²+w³ | iteratedDeriv 0,1,2 of w²+w³ at 0: 0, 0, 2≠0, so d=2; u=1+w, a=(0,0) | True |
| `weierstrass_preparation` | n=1, f=w²−z | derivatives of w↦w²: 0, 0, 2; u=1, a₀(z)=−z with a₀(0)=0, a₁=0 | True |
| `weierstrass_preparation`, d=0 | f=1+z+w | hd: f(0,0)=1≠0; empty sum, w⁰=1, u=f | True; matches docstring |
| `weierstrass_preparation`, negative | f=z | w↦f(0,w)≡0: every iteratedDeriv is 0, so hd fails for every d | Excluded, as the README Check says |
| `weierstrass_preparation_unique` | n=1, d=1, f=w−z | a second factorization u′(w+a′₀(z)): putting w=−a′₀(z) forces a′₀=−z, then u′=1 | True; locator R06 |
| `weierstrass_preparation_unique`, proof route | f=uP | w^d = u⁻¹·f + (−Σa_i w^i); the (2.3) uniqueness fixes u⁻¹ and the a_i | Route sound |
| `weierstrass_division` | n=0, g=w², f=1+w+w² | q=1, r=(1,1); a degree-≤2 remainder would also allow q=0, r=1+w+w² | Fin d bound is what gives uniqueness |
| `weierstrass_division` | n=1, g=w²−z, f=w³ | q=w, r₀=0, r₁=z: (w²−z)w+zw=w³ | True |
| `weierstrass_division`, d=0 | g=2+w | q=f/(2+w), no remainder | True; matches docstring |
| `weierstrass_division`, n=0 docstring | g=uw^d | f ≡ r mod w^d, so r is f's Taylor polynomial below degree d | True |
| `finite_rank_runge_approximation` | K={0}, Ω=ℂ, U=D(0,1) | component ℂ∖{0} has closure ℂ, not compact, so the hypothesis holds; L=closed D(0,½), N=1, ζ=0, g=1: error 0≤εB | True |
| Runge, negative | K=unit circle, Ω=ℂ | component of 0 is the open disk, closure compact ⊆ℂ: hypothesis fails; ∮1/z=2πi, while entire approximants give 0 | Excluded correctly |
| Runge, empty K | K=∅ | L=∅ and N=0; `K ⊆ interior L` holds vacuously | True |
| `mixed_parameter_solver` | P, Q points, f=1 | u=z̄: fderiv gives 1 at 1 and −i at i; (1+i·(−i))/2=1. u=z gives (1+i·i)/2=0 | True; wrong model excluded |
| `mixed_parameter_solver` | f=pq, Q=ℂ∖{0} | u=pq z̄: (uₓ+iu_y)/2=pq; holomorphic in q | True |
| `realified_isManifold_analytic` | transitions z↦iz; z↦z̄ | real matrix ((0,−1),(1,0)), det 1, linear hence analytic; z̄ is analytic but has D(i)=−i≠iD(1) | True at 358314d; restatement at 2fd255d (R01) |
| `holomorphicStalk_noetherian` | E=0; E=ℂ | stalk ℂ, a field; ℂ{z} has every ideal (z^s) (`demailly-agbook` lines 3874–3876) | True; Thm 2.7 at p. 81 |
| `holomorphicStalk_factorial` | E=ℂ²; E=0; real analogue | zw=z·w, nonassociate primes; a field is a UFD; real smooth germs of exp(−1/x)·1ₓ>0 and its reflection have product 0 | True; Thm 2.10 at p. 82 |
| Conventions g(u,v)=ω(u,Jv) | ℂ, u=v=∂ₓ | ω(∂ₓ,∂ᵧ)=1=g(∂ₓ,∂ₓ); with −J: −1 | Pass |
| d^c=i(∂̄−∂) | f=x²+y² | i(z dz̄−z̄ dz)=2x dy−2y dx; dd^c f=4dx∧dy=2i∂∂̄f | Pass |
| §1.1 type decomposition | v=∂ₓ | (∂ₓ∓i∂ᵧ)/2 sum to ∂ₓ; J(∂ₓ−i∂ᵧ)/2=(∂ᵧ+i∂ₓ)/2=i·(∂ₓ−i∂ᵧ)/2 | Pass |
| §1.1 Nijenhuis on (0,1) fields | X, Y of type (0,1), [X,Y]=B+C | N=−2[X,Y]+2iJ[X,Y]=−4B; d(∂̄f)(X,Y)=[X,Y]f−Cf=∂f(B)=−¼∂f(N) | Pass; Tau Ceti 2fd255d `delBar_delBar_apply` has −4⁻¹ |
| §1.1 real-vector form | v, w real | N(v^(0,1),w^(0,1))=½(N−iJN)=N(v,w)^(1,0), using N(JX,JY)=−N | Pass |
| §3.0 realification | z↦iz, E=0 | as above; the zero-dimensional transition is analytic | Pass |
| §3.1 stalk Checks | 1+z; (z²,z³) | inverse 1/(1+z); z³=z·z² gives (z²,z³)=(z²) | Pass |
| §4.1 Chern matrix | h=exp(\|z\|²) | A=h⁻¹∂h=z̄dz; Θ=dA=dz̄∧dz, type (1,1) | Pass; locator II (3.1)–(3.3) pp. 83–84 |
| §5.1 operator symbols | ∂² at ξ=2; x=2y; ∂∘(x∂) | 4 and (2i)²=−4; (¼)·2²=1 in both charts; x∂²+∂ with symbol xξ²=ξ·xξ | Pass |
| §5.1 transposes | (x∂ₓ)ᵗ; multiplication by i | −∂ₓ∘x=−x∂ₓ−1; transpose i, adjoint −i | Pass |
| §5.1 star Checks | plane, both orientations; dimension 0 | *dx=dy, *dy=−dx, reversed −dy, dx; *1=±1 | Pass |
| §5.4 planar exactness | β=dx∧dy, u=z̄/(2i) | ∂̄u=1/(2i); d(u dz)=∂̄u dz̄∧dz=(1/2i)(2i)dx∧dy | Pass |
| §5.4 Sobolev / form Checks | χ₁=χ₂=1/√2; a=2ūv | norm ½+½=1; A=2, (A+1)⁻¹=⅓ | Pass |
| §5.5 star on dz | dz=dx+i dy | *dz=dy−i dx=−i dz; *dz̄=i dz̄ | Pass |
| §5.5 δ formulas | α=P dx+Q dy; h dx∧dy | −⋆d⋆α=−(Pₓ+Q_y); −⋆dh=h_y dx−hₓ dy | Pass |
| §5.5 sign of d* | Demailly (3.9), p. 292 | (−1)^(mp+1) with p=k−1 equals the README's (−1)^(m(k+1)+1); m=2 gives −⋆d⋆ | Pass |
| §5.5 Checks | x dx+y dy; x dy; x²+y²; \|x\|³ | δ=−2; dα=dx∧dy, δ=0; 2y dx−2x dy, Δ_H=−4; Δ_H\|x\|³=−6\|x\| | Pass |
| §5.6 component Checks | ranks (0,1,2), section (0,1,(1,i)) | 0+1+2=3; eigenvalue 2 with multiplicity 1+2=3 | Pass |
| §5.7 Gram identities (R05) | ℂ standard metric; ψ=dz/√2 | \|dz\|²=1+1=2; dz∧i dz̄=2dx∧dy; (e_ψi_ψ+i_ψe_ψ)1=⟨ψ,ψ⟩=1 | Values true; Checks missing (R05) |
| §5.8 Serre | ℂP¹, O(−1); O | h⁰=0 and h¹(O(−1))=h⁰(O(−2)⊗O(1))=0; h⁰(O)=1=h¹(K) | Pass; Thms 7.1–7.3 pp. 309–310 |
| §6.0 [Λ,L]=(n−k) | ℂ: 1, ω; ℂ²: 1 | Λω−0=1; 0−L1=−ω=(1−2)ω; ΛL1=2 | Pass |
| §6.0 Kähler identities | d^c=i(∂̄−∂) | [Λ,d]=i∂̄*−i∂*=−(d^c)*; adjoint gives [L,d*]=d^c | Pass; Thm 6.4 at p. 305 |
| §6.0 non-Kähler check | exp(x₁)(ω₁+ω₂) on ℂ² | dω=exp(x₁)dx₁∧dx₂∧dy₂≠0 | Pass |
| §6.1 relative cone | (α,β)↦(dα, α\|_W−dβ) | applied twice: (0, dα\|_W−dα\|_W+0)=0 | Pass |
| §6.1 evaluation | unit bump on ℝ² | absolute class 0, since H²_dR(ℝ²)=0; relative evaluation 1=∫η | Pass; Łojasiewicz Thm 2 p. 464 |
| §7.1 charts | [1:2:3]; w=1/z | (2,3) and (½,3/2); \|−1/z²\|²=\|z\|⁻⁴>0, +1 at z=1 | Pass; V §15.A p. 277 |
| §7.2 Fubini–Study | ℂP¹ chart | (i/2π)(−2i)dx∧dy/(1+\|z\|²)²; ∫=2∫₀^∞r/(1+r²)²dr=1 | Pass |
| §7.2 curvature | O(1) | Demailly (15.8): Θ=d′d″log(1+\|z\|²)=(2π/i)ω_FS=−2πiω_FS | Pass; p. 279 |
| §8.1 CE normalization | [X,Y]=Z, trivial coefficients | ours: dZ*(X,Y)=−1. CE has P_[x,y]=P_yP_x−P_xP_y (`chevalley-eilenberg` line 1204) and q=1 bracket term +g([x₁,x₂])/2 (lines 1227–1228); reversing the bracket gives −½, ×2=−1 | Pass; §23 pp. 115–116 |
| §8.1 Iwasawa | Angella §3.1 | dφ₃=−φ₁∧φ₂ (`angella-iwasawa` line 510, p. 9); h^(1,0)=3, h^(0,1)=2, b₁=4 | Pass |
| §8.2 central reduction | Heisenberg | [𝔤,𝔤]=ℝZ, next term 0; quotient ℝ², fibre ℝ/ℤ; Sakane takes the last nonzero C^m(G) (`sakane-parallelisable` lines 107–113, p. 189) | Pass |

### Sources sampled

- `demailly-agbook`: (2.1) p. 80 (line 3794); (2.3)–(2.4) p. 80 (3804–3817); Thms 2.7 and 2.10 pp. 81–82 (3872, 3931); II (3.1)–(3.3) pp. 83–84 (3968, 4007); V §15.A–B pp. 277–279 ((15.1) at 13691, (15.8) at 13780); VI (3.1)–(3.5) p. 291 and Thm 3.9 p. 292 (14323–14386); Def 4.1 p. 296, (4.2) p. 296, Examples 4.4 and 4.6 p. 297, Thm 4.8 p. 298; Cor 5.9 p. 301, Def 5.11 p. 302; Thm 6.4 p. 305, Cor 6.5 and Thm 6.7 p. 306; Thms 7.1–7.3 pp. 309–310 (15377–15390); VII Thm 1.1 p. 329, Cor 1.3 p. 330, (6.1) p. 338. Page and statement match each claim, apart from R06.
- `lojasiewicz-triangulation` Thm 2, p. 464 (line 512): countable real-analytic manifold, locally finite semi-analytic family; this matches §6.1's hypotheses.
- `sakane-parallelisable` Thm 1, pp. 188–189 (line 102); the proof's lattice step cites Raghunathan p. 31 Cor 1 and p. 23 Thm 1.13 (lines 112–113), as §8.2 says.
- `angella-iwasawa` §3.1, p. 9 (lines 480–510).
- `chevalley-eilenberg`: fetched for this review from the AMS open archive (publisher-open), Trans. AMS 63 (1948); §23 on printed pp. 115–116 (lines 1165–1232). The manifest lacks this entry; it should be added as `chevalley-eilenberg`, cited for §8.1.

## Not verifiable

- `webster-nn` (§1.1), `hormander-alpdo1` (§5.2) and `wells-dacm` (§5): settled as uncertified, not requested.
- Griffiths–Harris chapter 0 (§3.1 route) and Raghunathan pp. 23 and 31 (§8.2): paywalled books, not in the manifest; no legal copy was sought for this review, which is never parked. For Raghunathan I checked only that Sakane's proof cites those pages.
- The `newlander_nirenberg` sketch in R02 and the statements of `Suggested.lean` at main's pins (Tau Ceti 2fd255d, Mathlib 1b1ccf4): not elaborated, because this worktree's packages are at 358314d/f6090c7 and the brief allows `lake env lean` only there. Declarations at 2fd255d were read with `git show` from the pinned package's object store.
- Ownership against #848 and #1609: their files are not available here.

## Source issues

- none
