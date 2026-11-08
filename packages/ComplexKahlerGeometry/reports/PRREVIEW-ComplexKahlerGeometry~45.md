# Review of ComplexKahlerGeometry (pull request #1234 at 617869f)

**Verdict:** needs changes

Full re-review: 384 lines changed since `a2c5e1c`, the head the previous review read. Of its eight findings, R01, R04, R05, R06 and R07 are repaired; R02 is settled on the folder side (its description sentence is still missing, carried in R04 below); R03 was answered by owning the relative integration theory here instead of citing DeRhamCohomologyAndDuality, which the dependency check turns out to forbid (a citation is UPWARD), so the move-down is sanctioned, but the object now has two declared owners (R01 below); R08 is not repaired (carried in R04). The gate passes at this head, the dependency check reports no problem, every Lean statement elaborates, and nothing closes with one tactic. The full pass found no false statement; the findings are ownership, one missing locator and description items.

## R01 (P2) — Two owners of the open-pair relative de Rham theory and the fundamental-class integration comparison

Location: `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1744–1797`, "**K6.1.RelativeIntegration — open pairs and fundamental classes.** Own the relative integration theory that the analytic-cycle comparison uses … (i) Relative smooth chains … (ii) The relative de Rham complex … (iii) The integration comparison".

Claim: these three items are, object for object, DeRhamCohomologyAndDuality §2.4 (relative smooth chains, quasi-isomorphism by the five lemma from DifferentialGeometry 8.3), §§3.1–3.2 (the relative complex with term `Ω^q(X)⊕Ω^(q−1)(W)` and differential `(α,β)↦(dα,α|_W−dβ)`, relative integration `∫_cα−∫_(∂c)β`, the relative cocycle `(α,0)` with absolute image `deRhamHom[α]`), §3.3 and §4.1 (the compact formula `∫_Nη=⟨deRhamHom[η],[N]_ℝ⟩`, the compact-support formula with `[N]_K` and its independence of `K`). That roadmap, an open new-roadmap pull request, declares itself the single owner of exactly these objects and names K6.1 as their consumer, and this head's sign check (ψ supported in `(−1,1)`, its primitive Ψ, `β` equal to 0 left and 1 right of the support) is the same witness as its §3.2 check. The previous review asked for a citation; the author owned the theory instead, without saying so. A citation is in fact impossible: the dependency check treats an on-main roadmap citing an open pull request as upward, so the notion has to move down to this roadmap. That is sanctioned, but then the other head must stop owning it, and this README must record the move. As it stands, two heads own the same statements and each names the other as the consumer.

Witness:
- DeRhamCohomologyAndDuality (#1768, `1b57dbe`) `README.md:70–76`: "The relative smooth chain comparison (§2.4), the relative form complex of an open pair, relative integration and the relative de Rham isomorphism (§§3.1–3.3), and the compact-support integration formula (§4.1) have a single owner, this roadmap … consumed from §§2.4, 3.1–3.3 and 4.1"; `:443–506` and `:512–530` state the same terms, differential, formula and `K`-independence; `:695–702` names ComplexKahlerGeometry K6.1 as the consumer.
- A scratch copy of this README with "DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1" added to the `*Needs:*` line at `:1777` gives `UPWARD: ComplexKahlerGeometry (on main) -> DeRhamCohomologyAndDuality (#394) at README lines [1777]`, `depcheck: 236 roadmaps, 2415 edges, 1 problem(s)`.
- The same scratch copy with a consumer sentence in prose instead (below) gives `0 problem(s)`.

Repair:
- In the README, after "the cases used above are the compact ambient M and the regular locus V_reg." (`:1748–1749`), add one sentence recording the ownership: "K6.1.RelativeIntegration owns these boundaryless open-pair statements; DeRhamCohomologyAndDuality §§2.4, 3.1–3.3 and 4.1, which extend them to models with corners, consume these instances." A scratch copy with this sentence passes the dependency check with no UPWARD line.
- In the pull-request description, one sentence: #1768 replaces its single-owner sentence (`README.md:70–76`) and its consumer paragraph (`:695–702`) by a citation of ComplexKahlerGeometry K6.1.RelativeIntegration for the boundaryless open-pair complex, relative integration and the compact-support formula, and keeps the corners extension and §4.2.
- Nothing else in the folder changes: items (i)–(iii) and their four Checks are correct as written (values in the table below).

## R02 (P3) — K5a.DistributionLocalStructure states three theorems with no locator

Location: `README.md:897–955`, "**K5a.DistributionLocalStructure.** Own the continuous-primitive and supported finite-jet structure on these distribution carriers" through "its partial sums do not converge in D′."

Claim: the target states (a) that a distribution of finite order `k` on an interval is, on a relatively compact subinterval, the `m`-th derivative of a continuous function for `m ≥ k+2`, (b) the local form `u=Σ_(|α|≤N)u_α(y)⊗∂_z^αδ(z)` of a distribution supported in a closed submanifold with unique coefficients, and its point case, and (c) the nonextension of `exp(1/‖x‖²)`. None carries a locator; every other theorem of K5a names a pinned declaration or a source. All three are classical and the manifest already settles Hörmander's first volume as a citable key.

Witness: `grep -n "Hörmander\|hormander" README.md` finds no hit between lines 897 and 955; the only citations in that range are the pinned `Distribution Ω F (k:ℕ∞)` carrier names.

Repair: add locators at the claims: for (b), Hörmander, *The Analysis of Linear Partial Differential Operators I*, Theorem 2.3.4 (support in a point) and Theorem 2.3.5 (support in a submanifold, the product form `Σ u_α⊗∂^αδ`); for (a), the finite-order extension and structure theorem of its §2.1 at the theorem the author uses; for (c), the source of the example, or state it as this roadmap's own worked example with its proof (the bound `Cε^(−N)` against `C′ε^n exp((1+c)^(−2)ε^(−2))` is already written out). Test: at `n=1`, `φ_ε` supported in `[ε(1−c), ε(1+c)]`, so `1/x² ≥ (1+c)^(−2)ε^(−2)` there, which is the exponent the README states.

## R03 (P3) — The symplectic normal form is the unimodular case of a theorem another open roadmap owns; say so in one clause

Location: `README.md:2166–2173`, "Own the algebra target that fixes its normal form: a unimodular alternating bilinear form ω on a free ℤ-module L of finite rank r has even rank r=2h and a symplectic basis".

Claim: AbelianSchemesAndArithmeticModuli A5.4 (1) states the elementary-divisor normal form of an alternating form on a free ℤ-module of rank `2g` with nonzero determinant, matrix `[[0,D],[−D,0]]` with `d₁|⋯|d_g`, with uniqueness; the target here is its case `d_i=1`. That roadmap is an open pull request, so this on-main roadmap cannot cite it (the dependency check's rule in R01), and keeping the unimodular case here is the sanctioned move-down. A kept variant says in one clause how it differs; this one does not, and the pinned field version, Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, which does not give integral bases, is not mentioned either.

Witness: AbelianSchemesAndArithmeticModuli (#849, via `roadmaps show`) A5.4, "An alternating form `E` on a free `ℤ`-module of rank `2g` with nonzero determinant has a symplectic basis in which its matrix is `[[0, D], [−D, 0]]` … Over a field the analogue of (1), with every `d_i = 1`, is Tau Ceti's symplectic basis theorem `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`"; `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357` (over a field `K`).

Repair: write "Own, as the unimodular case `d_i=1` of the elementary-divisor normal form that AbelianSchemesAndArithmeticModuli A5.4 states in general, the algebra target …", and add after the route "Tau Ceti's `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J` is the same induction over a field; the integral step is the primitivity of `ω(x,−)`." A scratch copy with the first sentence passes the dependency check (no UPWARD line). The route itself is correct: for `v∈L`, `v′=v−ω(v,y)x+ω(v,x)y` has `ω(v′,x)=ω(v,x)−ω(v,x)=0` and `ω(v′,y)=ω(v,y)−ω(v,y)=0`, so `L=P⊕P^⊥`.

## R04 (P3) — The pull-request description states no order against the heads that conflict with this one or renumber what it cites (not repaired; the previous R08, and the description halves of R02 and R03)

Location: the pull-request description, whose only merge-order statement is "Revisions of roadmaps on main whose numbering this roadmap cites, which merge first: #1186".

Claim: four open pull requests change this folder and conflict with this head, and the description says nothing about which is rebased on which; the DifferentialGeometry revision renames and removes sections this README cites as a supplier; and the sentence the previous two repair reports said "the worker adds" about K4.P's consumers was never added.

Witness:
- `scratch/overlaps.md`: #1398, #1807, #1808 and #1854 each conflict with #1234 in this folder's README (and, for the first three, in `Suggested.lean`). The author's repair report confirms the conflicts at the heads.
- DifferentialGeometry #886 (`e8165fc`): its layer list is 0–5, 5.6 and 12 only (`README.md:392–1363`); it says "Citations of a single section 5.5 … refer to 5.5a (densities) and 5.5b" (`:38–39`) and that the de Rham theorem and its integration comparison are DeRhamCohomologyAndDuality's (`:40–43`). This README cites DG 5.5 (`:868, 1168`), DG 6.2 (`:1195`), DG 8.3–8.5 (`:1746, 1755, 1761, 1765, 1777, 1796, 1971, 2423`) and DG 8's de Rham isomorphism (`:1710`), all of which break at that merge, and the content's new owner is a roadmap this one cannot cite (R01).
- #848 `ComplexComparisonPartII/README.md:147` still reads "C5.4 is the single owner, on every complex manifold, of the holomorphic-to-smooth forgetful adapter, the frame-torsor bi…"; `K4.P` occurs in neither #1285 `K3Surfaces/README.md` nor #1186 `GeometricQuantization/README.md` (`:20, 212, 714, 743` take the segment from C5.4).

Repair: three sentences in the description. (1) Which of #1398, #1807, #1808 and #1854 is rebased on this pull request and which this one is rebased on; whichever merges second keeps #1808/#1854's K8 repointing to AlgebraicTopology Stage 5.0. (2) #886 merges after this pull request and gives old → new numbering for DG 5.5, 6.2, 8.3–8.5 and 12.1/12.4, naming where the de Rham theorem this README consumes at `:1746–1777` then lives. (3) #848 drops the single-owner clause at its line 147 and, with #1285 and #1186, cites K4.P for the frame torsor, the exponential segment and the `c₁` identification (the sentence the a2c5e1c repair report wrote out). Nothing in this folder changes.

## Previous findings

- **R01** (P1, gate failure on SurfaceTopology/PlanarTopology): repaired. `README.md:2137–2201` and `:2443–2449` cite neither name; the gate re-run reports `dropped=0`. The dictionary is now proved on the realified surface by the fundamental class, the universal-coefficient sequence, the integral cup product and the normal form of unimodular alternating forms, every step of which resolves at the pins or on main's AlgebraicTopology (table below); the symplectic normal form is R03.
- **R02** (P2, two owners of the exponential segment): settled on the folder side, as the previous review allowed ("This folder's side is already complete"). The description sentence is still missing: R04 (3). Not re-raised.
- **R03** (P2, K6.1 cited DifferentialGeometry for relative statements it does not plan): the five wrong citations are gone (`:1662–1665, 1718–1737`). The replacement, owning the theory in K6.1.RelativeIntegration, is the move-down the dependency check forces, but it leaves two owners: R01 above. The #886 half is R04 (2).
- **R04** (P2, ℂPⁿ headlines absent): repaired. `Suggested.lean:448–487` states `finrank_dolbeaultCohomology_complexProjectiveSpace`, `finrank_deRhamCohomology_complexProjectiveSpace` and, beyond what was asked, `integralCohomology_complexProjectiveSpace` through `integralCupPow`; K7.1 (`:1833–1851`) names the sphere-quotient model with `instChartedSpace`/`instIsManifold` and owns the comparison; K7.2 (`:1946–1957`) cites `cwComplex`, `cellMap`, `nat_card_cell_cwComplex`, `singularHomologyIso`, the two vanishing lemmas and `eulerChar_complexProjectiveSpace`; the docstring bullet is narrowed (`:72–81`). All names resolve (table below).
- **R05** (P3, false docstring reason): repaired. `Suggested.lean:47–55` now gives the `ContMDiffVectorBundle` mixin and the missing `∂̄_V`, and splits off the flat-connection equivalences with the reason "no category of holomorphic vector bundles with connection"; Mathlib's `CovariantDerivative` directory exists at the pin, so the split is right.
- **R06** (P3, attribution of the projective topology): repaired at `:1801–1806` and `:2427`.
- **R07** (P3, two pinned germ facts planned): repaired at `:455–462`; `meromorphicGermsEquiv_symm_apply` (`TauCeti/Analysis/Meromorphic/Pullback.lean:162`), `regularEval_pullback` (`…/StructureSheaf/RegularEval.lean:147`) and the newly cited `regularEval_eq_eval_regularPart` (`:137`, `regularEval a φ = eval 𝓘(ℂ) ℂ a (regularPart a φ)`) exist and say what the README says.
- **R08** (P3, order against #1398/#1807/#1808/#1854): not repaired; R04 (1).

## Verified sound

**Gate.** The worker's `gate.md` reports every counter at 0. My re-run with the brief's command plus `--build` and `--order`:

```text
gate ComplexKahlerGeometry: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
```

**Dependency check** (`--movable`), exact output:

```text
depcheck: 236 roadmaps, 2413 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is on main and not in `ORDER.txt`. The resolver's one lead ("ComplexManifolds M2.1") is Milestone 2 item 1 of main's ComplexManifolds (`README.md:197–215`), a false positive as before; it reports no missing Lean name.

**Outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ComplexKahlerGeometry'` is empty. `PROGRESS.md`, `STATUS.md` and `metadata.toml` are unchanged from the merge base.

**Lean.** The targeted build passes in the gate. `lake env lean` on a scratch copy of `Suggested.lean` with `#check @` of all 33 declarations exits 0 in 9 s with exactly 25 `sorry` warnings (the 25 theorems) and nothing else: the file is in module form with nine `public import TauCeti.*` lines, all present at `2fd255d`, no `set_option`, no sorry'd data, no `lemma`.

**Binder audit.** The elaborated types equal `scratch/signatures.md`. The four "looks dropped" leads are definitions whose bodies do not need the binders (`dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` drop `[FiniteDimensional ℂ E]`; `lefschetzMap` drops `[FiniteDimensional ℝ E] [I.Boundaryless] [T2Space M] [CompactSpace M]`); every theorem about them carries the hypotheses. The five new declarations elaborate as the README states them: `finrank_dolbeaultCohomology_complexProjectiveSpace : ∀ (n p q : ℕ), finrank ℂ (DolbeaultCohomology (Fin n → ℂ) (ComplexProjectiveSpace n) p q) = if p = q ∧ p ≤ n then 1 else 0` (`README.md:1967–1969`); `finrank_deRhamCohomology_complexProjectiveSpace` with `if Even k ∧ k ≤ 2 * n` (`:1970–1972`); `integralCupPow : {X : TopCat} → H²(X;ℤ) → (k : ℕ) → H^(2k)(X;ℤ)`; `integralCohomology_complexProjectiveSpace` with `∃ u, (∀ k ≤ n, Bijective (m ↦ m • u^k)) ∧ ∀ j, Odd j ∨ 2n < j → Subsingleton H^j` (`:1963–1967`); `finrank_dolbeaultCohomology_riemannSurface` over `[T2Space M] [CompactSpace M] [ChartedSpace ℂ M] [IsManifold 𝓘(ℂ) ∞ M]` with no connectedness and no Kähler form (`:2141–2144`). The real `IsManifold` instances the de Rham statements need come from the scoped `TauCeti.ComplexManifold.isManifold_real`, which the file opens.

**Padding probe.** On a scratch copy every `sorry` was replaced by `first | rfl | infer_instance | fun_prop | (simp; done) | (simp_all; done) | (exact ⟨inferInstance, inferInstance⟩) | decide | sorry`; elaboration (40 s) reports 25 `sorry` warnings, so all 25 fallbacks were used and nothing closes with one tactic. By reading, none of the 25 restates a definition, mirrors a Check or treats a boundary case; `integralCupPow` is the one definition needed to state the cup ring, with a real body on the pinned `integralCup` and `integralCohomologyOne`. The genus dictionary is a corollary of K6.1's headlines only after the existence of a Kähler form on every compact curve, which the file does not state; it is kept as a headline.

**Headlines.** The README's headlines: K1 Newlander–Nirenberg; K2 Dolbeault–Grothendieck, the parameter solver, the Dolbeault theorem; K3 Weierstrass preparation, uniqueness and division, regular local ring and factoriality, Rückert, Oka, Cartan, Riemann extension, Hartogs across a point and across codimension two, singular-locus analyticity; K4 Chern connection, Koszul–Malgrange, flat correspondence; K4.P the exponential segment and `c₁`; K5a the Hilbert scale and elliptic regularity; K5b Dolbeault finiteness and Serre duality; K6.0 the Kähler identities; K6.1 `∂∂̄`, Hodge decomposition and symmetry, odd Betti parity, Hard Lefschetz, Hodge–Riemann, cycle classes; K7 the ℂPⁿ Hodge numbers, Betti numbers and cup ring, the genus dictionary, tori, Hopf, elliptic lines; K8 Frölicher and Iwasawa. 25 are stated. The docstring reasons for the rest I checked at the pins: no sheaf of holomorphic `p`-forms, analytic-subset carrier, density carrier, units sheaf or manifold-level complex Hodge star under `TauCeti/Geometry`; no `∂̄_V` on bundle-valued forms (`…/Dolbeault/Basic.lean:95` acts on a constant `F`); the `Projectivization` import clash (reproduced by the previous review); no tautological line on either ℂPⁿ model (`grep -rl "tautological" TauCeti/Topology/ComplexProjectiveSpace TauCeti/Geometry/Manifold/Instances` is empty); no complex torus `ℂⁿ/Λ` or Hopf surface with a complex atlas. The ℂPⁿ comparison K7.1 owns is at neither pin: the only pinned comparison with the sphere quotient is the toric one (`TauCeti/Geometry/Toric/Analytic/Fan/ProjectiveSpace/Comparison.lean`), and `Projectivization` does not occur in the sphere-quotient modules.

**Pinned declarations opened** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`), beyond the previous review's table, which I re-checked only where this head changed:

| Declaration | File:line | Gives / lacks |
| --- | --- | --- |
| `TauCeti.ComplexProjectiveSpace`, `instTopologicalSpace`, `instCompactSpace`, `instT2Space`, `mk`, `mk_eq_mk_iff`, `isOpenQuotientMap_mk`, `instPathConnectedSpace` | `TauCeti/Topology/ComplexProjectiveSpace/Basic.lean:58, 67, 72, 77, 84, 102, 130, 153` | `Type`; quotient of the unit sphere of `EuclideanSpace ℂ (Fin (n+1))` by unit scalars |
| `ratio`, `affineOpen`, `affineParam`, `affineChart`, `affineChart_apply`, `affineChart_transition` | `…/ComplexProjectiveSpace/Charts.lean:40, 52, 120, 166, 191, 216` | as K7.1 says |
| `instChartedSpace` (model `Fin n → ℂ`), `instIsManifold (r : ℕ∞ω)` | `TauCeti/Geometry/Manifold/Instances/ComplexProjectiveSpace.lean:40, 65` | every `r` including ω |
| `hemispherePoint`, `cellMap`, `cwComplex`, `nat_card_cell_cwComplex`, `finiteCWType` | `TauCeti/Topology/CWComplex/Classical/ComplexProjective.lean:74, 271, 419, 452, 468` | coordinate `k` is `√(1−‖v‖²)`, later ones 0; `if Even m ∧ m ≤ 2n then 1 else 0` |
| `singularHomologyIso`, `isZero_singularHomology_of_odd`, `isZero_singularHomology_of_lt` | `TauCeti/AlgebraicTopology/Cellular/ComplexProjective.lean:124, 133, 139` | `H_(2i)(ℂPⁿ;R)≅R` for `i≤n`, zero for odd and `>2n` |
| `eulerChar_complexProjectiveSpace` | `…/Cellular/EulerCharacteristic/ComplexProjective.lean:68` | `n+1` |
| `integralCohomology`, `integralCup (p q n) (h : p+q=n)`, `integralCup_self_add_self_eq_zero (hp : Odd p)`, `integralCohomologyOne`, `integralCup_integralCohomologyOne_right` | `TauCeti/AlgebraicTopology/Cohomology/IntegralCup.lean:145, 155, 187, 215, 238` | `TopCat.{0}`; `a⌣a+a⌣a=0` for odd degree |
| `HomologicalOrientation.fundamentalClassOn`, `fundamentalClass`, `realFundamentalClass`, `fundamentalClassEquiv` | `TauCeti/AlgebraicTopology/Singular/LocalHomology/FundamentalClass.lean:139, 204, 248, 373` | `fundamentalClassOn` for compact `A` in local homology along `A`; `fundamentalClass` needs `[CompactSpace M]`; `fundamentalClassEquiv : ℤ ≃ₗ[ℤ] Hₙ(M;ℤ)` needs `[ConnectedSpace M]` as the README says |
| `TopCat.singularKronecker`, `singularUniversalCoefficientEquiv` | `…/Cohomology/Kronecker.lean:65`; `…/Cohomology/UniversalCoefficient.lean:209` | `Hⁿ⁺¹ ≃ Ext¹(Hₙ,M) × Hom(Hₙ₊₁,M)` over a hereditary ring, ℤ included; not natural in `X` |
| `smoothSingularSubcomplex`, `smoothSingularSubcomplexMap`, `SmoothSimplex.integral`, `integral_smoothSingularSubcomplexMap_app` | `TauCeti/Geometry/Manifold/SmoothSingular/Basic.lean:77, 205`; `…/Integral.lean:86, 177` | as K6.1.RelativeIntegration cites |
| `regularEval_eq_eval_regularPart`, `regularEval_pullback`; `meromorphicGermsEquiv_symm_apply` | `…/StructureSheaf/RegularEval.lean:137, 147`; `TauCeti/Analysis/Meromorphic/Pullback.lean:162` | R07 |
| `LinearMap.BilinForm.IsAlt.exists_basis_toMatrix_eq_J`, `IsAlt.even_finrank` | `TauCeti/LinearAlgebra/BilinearForm/SymplecticBasis.lean:357, 365` | over a field only (R03) |
| `CovariantDerivative` | `Mathlib/Geometry/Manifold/VectorBundle/CovariantDerivative/` | R05's split reason |

**Cross-roadmap citations resolved:**

| Citation | Copy | Result |
| --- | --- | --- |
| AlgebraicTopology Stage 6.3, 6.4, 6.5; Stage 8 item 7; Stage 4.6 | main `AlgebraicTopology/README.md:1180, 1515, 1560, 1811–1815; 266–273` | 6.3 homological orientation, 6.4 Poincaré–Lefschetz by cap, 6.5 intersection pairing for closed connected oriented manifolds of finite CW type, 8.7 compact manifolds have finite CW type |
| DG 5.4, 5.5, 6.2, 8.3, 8.4, 8.5, 12.1, 12.4 | main `DifferentialGeometry/README.md:524, 528, 791, 836, 845, 852, 915, 923` | exist; 8.3–8.5 absolute; `deRhamHom` (8.4), `deRhamEquiv` (8.5) named there |
| same ids | #886 `e8165fc` | Layers 6–11 absent, 5.5 → 5.5a/5.5b (R04) |
| DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1 | #1768 `1b57dbe` `:70–76, 384–404, 441–530, 695–702` | single-owner claim and consumer paragraph (R01); a `*Needs:*` citation from here is UPWARD |
| AbelianSchemesAndArithmeticModuli A5.4 | #849 via `roadmaps show` | integral elementary-divisor normal form (R03) |
| ComplexComparisonPartII C5.4; K3Surfaces 1.1; GeometricQuantization §3.3 | #848 `:147`; #1285 `:116, 371`; #1186 `:20, 212, 714, 743` | still take the segment from C5.4 (R04) |
| ComplexManifolds Milestones 1–4, 7 | main `:197–215, 319–330` | as before |
| GlobalHolomorphicFunctions GH0/GH2/GH5.1, RealAnalyticGeometry R0–R5, StableReduction Layer 4, LieGroupoidsPoisson G1.3, IndexTheory I7.4, VariationalMethods, UO-D06 | main / open heads, unchanged since the previous review | unchanged text |

**Seeded sample, locators** (each opened in the cache; `demailly-agbook` page markers: p. 280 = line 13789, p. 312 = 15471, p. 317 = 15705):

| Target | Locator | Lines | Result |
| --- | --- | --- | --- |
| Parameter Cauchy–Green | GH0's operator, no external locator | — | adversarial row |
| K3.HolomorphicStalk | Demailly II (2.1), (2.3)–(2.4), (2.7), (2.10) | `demailly-agbook` 3794–3817, 3872, 3931 | preparation, division "unique" (3817), Noetherian, factorial |
| K4.ComponentwiseFiniteRankAssembly | none | — | adversarial row |
| K5a; K5a.SmoothSectionMontel; K5a.ComponentwiseCompact | pinned names | previous table | resolved |
| K5a.DistributionLocalStructure | none | — | R02 |
| K5b; K5b.1 | Demailly VI (7.2), (7.3), (8.12) | 15385, 15390, 15523 | finite Hodge numbers, Serre pairing, `h^(p,q)=h^(n−p,n−q)` |
| K7.1; K7.2 | pinned names; Demailly V (15.10), VI (8.8) | 13812 (p. 280), 15486 (p. 312) | `H•(Pⁿ,ℤ)≅ℤ[h]/(h^(n+1))`, `h=c₁(O(1))`, with (15.11) `H^(2k)=ℤ` for `k≤n`; `H^(p,p)(Pⁿ)=ℂ` for `p≤n`, 0 for `p≠q` |
| Fubini–Study | no external locator | — | adversarial row |
| K7.2.TautologicalIncidence | Knutson §1, p. 1 | `knutson-borel-weil` 12–60 | incidence variety, blowup at the origin, tautological line, Liouville, weight spaces |
| K7.2.RationalQuartic | none | — | adversarial row |
| K7 genus dictionary | Demailly VI (10.1)–(10.2), p. 317 | 15710–15716 | `H¹(X,𝒪)≅ℂ^g`, `H⁰(Ω¹)≅ℂ^g`, `H¹(X,ℤ)=ℤ^(2g)` under the section's standing compact connected hypothesis; Demailly defines `g=h¹(𝒪)`, the README `g=h^(1,0)`, equal by Hodge symmetry |
| K7.FlatDegreeZero | Berwick-Evans–Tripathy Remark 2.1, p. 6 | `berwick-evans-tripathy` 287–292 | degree-zero lines are flat unitary |
| K8.NilpotentCentralReduction | Sakane pp. 188–189 | `sakane-parallelisable` 102–115 | last nonzero `C^m(G)` central, `A∩Γ` a lattice, `AΓ` closed, holomorphic principal torus bundle |
| K6.0 | Ballmann Thm 4.17, pp. 47–48 | `ballmann-kahler` 1990 (p. 48 = 1769) | global Kähler equivalences |
| K6.1 triangulation | Łojasiewicz §3 Thm 2 | `lojasiewicz-triangulation` 512 | locally finite semianalytic families |

The README flags no locator as unverified.

**Ownership by object.** `roadmaps overlaps` reports no dropped id in either direction. By hand: the relative de Rham theory (R01), the integral symplectic normal form (R03), DG's revision (R04). `roadmaps grep --readme-only --fixed 'u^(n+1)'` finds the ℂPⁿ cup ring only in this folder (main and #1234); no roadmap on main or at the open heads states the Hodge or Betti numbers of ℂPⁿ or the genus dictionary on a Lean carrier. `roadmaps grep --lean-only` on `integralCupPow`, `complexProjectiveSpace` and `riemannSurface` finds declarations only in this folder's `Suggested.lean` (DGFloerPartII's `…_codiscBundle_complexProjectiveSpace_lt_top` is a different object). The sanctioned move-downs recorded: the open-pair relative theory from DeRhamCohomologyAndDuality (R01) and the unimodular symplectic normal form from AbelianSchemesAndArithmeticModuli A5.4 (R03); both are forced by the dependency check's rule for on-main roadmaps.

**Adversarial pass.** One row per statement, values recomputed in this review; the rows of the previous review's table for the 21 unchanged Lean statements and the unchanged sampled targets were recomputed and hold (Newlander–Nirenberg on `M=ℂ`, `J=i`; polydisc with `r k≤0` empty; Dolbeault–Grothendieck `∂̄(z̄²/2)=z̄dz̄`; the solver `u=z̄` gives `(1+I·(−I))/2=1`; preparation `f=w²−z` gives `u=1, a₀=−z`; division `w²=(w+z)(w−z)+z²`; Rückert `g=z, f₁=z²`, `m=2`; Oka Koszul `(z₂,−z₁)`; Cartan `(z)` at 0, unit near `y≠0`; Riemann `1/z` excluded by `hbdd`; Bessel `|exp((1+i)log 2)|=2`; ℂP¹ `h^(0,0)=h^(1,1)=1`; Hopf `h^(0,1)=1≠0=h^(1,0)`; elliptic `b₁=2=1+1`; annulus `b₁=1` excluded by `Boundaryless`; Kodaira–Thurston `b₁=3`; `S²×S²` with `aσ₁+bσ₂`, square `2ab`; K7.2.TautologicalIncidence `(t·F)=t⁻¹F` at `k=1`; RationalQuartic image `{b₂=0}`, `n=2` exponents `0..8`, kernel `x₀x₃−x₁x₂`; FlatDegreeZero `(λ,v)~(0,ρ(λ)⁻¹v)`; Heisenberg `Γ∩A=ℤ`, `S¹→H/Γ→T²`; Iwasawa `b₁=4≠5`).

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `finrank_dolbeaultCohomology_complexProjectiveSpace` | `n=0`; `n=1`, `(1,1)`, `(1,0)`, `(2,2)`; `n=2`, `(2,0)` | `h^(0,0)=1`, `h^(1,0)=0`; `1`, `0`, `0` (`p≤n` fails; no 4-forms on a real surface, so without `p≤n` the right side would be 1 and false); `0` | Pass | — |
| `finrank_deRhamCohomology_complexProjectiveSpace` | `n=1`, `k=0..3`; `n=0`, `k=2`; Euler characteristic | `1,0,1,0`; `0` (`2≤0` fails); `Σ(−1)^k b_k=n+1=eulerChar_complexProjectiveSpace` | Pass | — |
| agreement of the two with K6.1 | ℂPⁿ, even `k=2p≤2n` | `Σ_(p′≤k) h^(p′,k−p′)=h^(p,p)=1=b_k`; odd `k`: `0=0` | Pass | — |
| `integralCupPow` | `k=0`; `k=1`; `k=2` | `1`; `u⌣1=u` by `integralCup_integralCohomologyOne_right`; `u⌣u` | Pass | — |
| `integralCohomology_complexProjectiveSpace` | `n=0`; `n=2` with `u=2·gen`; `S²∨S⁴` | `u=0` forced by `H²(pt)=0`, `m↦m·1` bijective on `H⁰=ℤ`, `H^j=0` for `j>0`; `m↦2m·gen` not surjective at `k=1`; `u²=0` fails `k=2` although the groups agree | Pass | — |
| Demailly V (15.10) vs the statement | ring vs groups | `ℤ[u]/(u^(n+1))` ⟺ `H^(2k)=ℤu^k` for `k≤n`, `H^(odd)=0`, `H^(>2n)=0` and `u^(n+1)∈H^(2n+2)=0` | Pass | — |
| `finrank_dolbeaultCohomology_riemannSurface` | elliptic curve; ℂP¹; two elliptic curves; `M=∅`; Hopf surface | `1=1`, `2=2·1`; `0=0`, `0=0`; `2=2`, `4=2·2`; `0=0`, `0=0`; excluded by `ChartedSpace ℂ` (complex dimension one), where it would fail (`0≠1`, `1≠0`) | Pass | — |
| K7 integral dictionary, `H²(Σ;ℤ)≃ℤ` | UCT degree 1 and 2 | `Ext¹(H₀,ℤ)=0` as `H₀=ℤ`; `H¹≃Hom(H₁,ℤ)` free, so `H₁≃H¹` free (Poincaré duality); `Ext¹(H₁,ℤ)=0`; `H²≃Hom(H₂,ℤ)=Hom(ℤ[Σ],ℤ)=ℤ` | Pass | — |
| cup pairing alternating and unimodular | `a` of degree 1; adjoint | `integralCup_self_add_self_eq_zero` with `Odd 1`: `2(a⌣a)=0`, torsion-free `H²` gives `a⌣a=0`; adjoint = Kronecker dual ∘ Poincaré duality, an isomorphism | Pass | — |
| symplectic normal form (R03) | `[[0,1],[−1,0]]`; `[[0,2],[−2,0]]`; `[[1,0],[0,1]]`; splitting | det 1; det 4, no basis with entries ±1; `ω(e₁,e₁)=1≠0`; `v′=v−ω(v,y)x+ω(v,x)y` has `ω(v′,x)=ω(v,x)−ω(v,x)=0`, `ω(v′,y)=0` | Pass | R03 (clause) |
| K7 Checks | elliptic curve; ℂP¹; two curves | cup matrix `[[0,1],[−1,0]]`, det 1; `H¹=0`, `H²≃ℤ`; `H²≃ℤ²`, so connectedness is needed for the integral dictionary only | Pass | — |
| K6.1.RelativeIntegration (ii) sign | `(ℝ,ℝ∖{0})`, ψ with `∫ψ=1` | `d(Ψ,0)=(ψdx,Ψ|_U)=(ψdx,β)`; `∫_(−1)^1ψ−(β(1)−β(−1))=1−1=0`; the other sign gives `2` on a coboundary | Pass | R01 (owner) |
| (ii) relative cocycle | closed α with `α|_U=0` | `d(α,0)=(dα,α|_U−0)=(0,0)` | Pass | — |
| (iii) compact support | `N=ℝ`, `K=[−1,1]`, `[−3,3]`; absolute | `⟨(ψdx,0),[−2,2]⟩=1`; `⟨…,[−4,4]⟩=1`; `deRhamHom[ψdx]=0` since `H¹_dR(ℝ)=0` | Pass | — |
| (iii) compact case | `S¹`, `dθ`; `N=pt` | `2π` both sides, negated by reversal; `∫_pt f=±f=⟨f,[pt]_ℝ⟩` with the orientation sign | Pass | — |
| degenerate pairs | `U=∅`; `U=M` | absolute complex, `deRhamEquiv`; `(α,β)↦(dα,α−dβ)` acyclic, relative homology 0 | Pass | — |
| (i) five lemma | `W=∅`, `W=X` | absolute comparison; zero complexes | Pass | — |
| K6.1 cycle comparison | `ℂP¹⊂ℂP²`, `α=ω_FS` | `∫ω_FS=1=⟨deRhamHom[ω_FS],ι_*[ℂP¹]_ℝ⟩` with `[ℂP¹]` from `fundamentalClass`; node `z²=w²+w³`: two regular branches at the origin, coefficient 1 each | Pass | — |
| K7.1 comparison of models | `n=1`, `[2:4]`; `n=0` | `[v/‖v‖]=[(2,4)/√20]`, `ratio 0 1=2=v₁/v₀` in both charts; a point | Pass | — |
| K7.2 CW citations | `m=2i≤2n`; `m` odd | `nat_card_cell=1`; `0`; `cellMap` image coordinate `i` is `√(1−‖v‖²)≠0` on the open ball | Pass | — |
| K3.MeromorphicGermField (R07) | `φ=1/z+1`, `e=2z` | `regularPart=1`, `regularEval=eval(1)=1`; `1/z↦1/(2z)↦1/w` | Pass | — |
| K5a Montel / ComponentwiseCompact | `M=ℕ`, rank 1; ranks 0,1,2 | `ℂ^ℕ` bounded sets compact; `‖(0,3,(0,4))‖²=25` | Pass | — |
| K5b.0 | standard ℂ, `H=I` | `|dz|²=2`, `dz♯=2∂_z`, `ω¹/1!=dx∧dy` | Pass | — |
| Fubini–Study | `w=(1,i)/√2`; `z=(1,0)`; `diag(1,2)` | `r=2`, `h(e₁,e₂)=i/(8π)`; `H=1/π`; pullback `4ω_FS(0)` | Pass | — |
| Parameter Cauchy–Green | `χ` fixed, `f` holomorphic in `q` | `∂̄_q T(χf)=T(χ∂̄_q f)=0` by differentiation under the compactly supported integral | Pass | — |
| K4.ComponentwiseFiniteRankAssembly | `r(j)=j` on `M=ℕ`; `∅`; rank 0 | no single `VectorBundle ℂ F`; one empty family; zero bundle | Pass | — |
| K8.NilpotentCentralReduction | complex Heisenberg | `A≅ℂ`, `Γ∩A=ℤ[i]`, real rank `2=2 dim_ℂ A` | Pass | — |
| docstring reasons (R05) | trivial line | `ContMDiffVectorBundle ∞ ℂ (Trivial M ℂ) 𝓘(ℂ,E)` holds; no `∂̄_V` at the pin | Pass | — |

Thirty new or re-examined rows plus the twenty-one carried statements. No statement failed. The changes are one ownership sentence, one clause, locators and the description.

## Not verifiable

- ComplexComparisonPartII #848 and AbelianSchemesAndArithmeticModuli #849 were read through `roadmaps show` (no checkout given); #1398, #1807, #1808 and #1854 were not elaborated, only their conflicts taken from `scratch/overlaps.md` and the author's repair report.
- Webster 1989, Hörmander, Wells, Raghunathan and Griffiths–Harris are settled as uncertified; their locators were not opened. R02 cites Hörmander's theorem numbers from the published numbering without the text.
- The adversarial rows check instances; they are not proofs.
- Whether DeRhamCohomologyAndDuality's author accepts consuming K6.1.RelativeIntegration (R01) is a design decision for that pull request; this review only records that a citation in the other direction is refused by the dependency check.

## Source issues

- none
