# Review of ComplexKahlerGeometry (pull request #1807 at 445f965)

**Verdict:** needs changes

## R01 (P3) — 7.3 and 4.5 consume SmoothBundlesConnections B6.3, which the supplier contract and both `*Needs:*` lines omit

**Location.** `TauCetiRoadmap/ComplexKahlerGeometry/README.md` line 324 ("B6.1–B6.2 (the manifold sheaf/singular comparison and the circle-bundle classification)"), line 2978 (7.3 `*Needs:*`: "SmoothBundlesConnections B6.2 for the Hopf circle bundle") and line 1416 (4.5 `*Needs:*`: "SmoothBundlesConnections B6.1–B6.2").

**Claim.** 7.3 uses B6.3's Chern–Weil comparison and 4.5 uses B6's curvature comparison, but neither the contract nor either `*Needs:*` line names B6.3.

**Witness.** README line 2963: "using SmoothBundlesConnections B6.3's Chern–Weil comparison"; line 1394: "consume SmoothBundlesConnections B6's smooth line classification and curvature comparisons". `TauCetiRoadmap/SmoothBundlesConnections/README.md` on main, line 1716: "### B6.3 Rank-one Chern–Weil".

**Repair.** Line 324: "B6.1–B6.3 (the manifold sheaf/singular comparison, the circle-bundle classification and the rank-one Chern–Weil comparison)". Line 2978: "SmoothBundlesConnections B6.2 for the Hopf circle bundle and B6.3 for its Chern–Weil comparison with `[ω_FS]`." Line 1416: "SmoothBundlesConnections B6.1–B6.3". Line 107 (Scope): add "and B6.3 the rank-one Chern–Weil comparison".

## R02 (P3) — Three sections define carriers that no Check tests (4.1, 5.3, 5.8)

**Location.** README 4.1, lines 1116–1155 (the section sheaf of a holomorphic bundle and the ring sheaf R); 5.3, lines 1643–1672 (the Fréchet section topology and its Montel instance); 5.8, lines 2117–2199 (the componentwise carriers).

**Claim.** Layer 4's Checks (lines 1268–1283) test the Chern connection, frame change, monodromy, flatness and rank functions; the Checks after 5.8 (lines 2201–2221) test the Bessel symbol, the density line, bundle tests and the Sobolev threshold. None computes anything on the three carriers above.

**Witness.** A section sheaf defined by smooth frame coordinates, a section topology with the sup norm alone, and an eigenbasis indexed by one component each pass every Check in the text.

**Repair.** Add, after 4.1's `*Needs:*`:

"**Checks.**
- Trivial line on ℂP¹: the section sheaf is R, of rank 1, and its global sections are the constants; smooth frame coordinates would give the infinite-dimensional `C^∞(ℂP¹,ℂ)`.
- `F=0`: the section sheaf is the zero module, locally free of rank 0, and reconstruction returns the zero bundle; on the empty manifold every sheaf is zero.
- Not locally free: the ideal sheaf of the origin in ℂ² has rank 1 off the origin, but its stalk `𝔪=(z,w)` at 0 has `dim 𝔪/𝔪²=2`, so it is the section sheaf of no line bundle; in ℂ the ideal sheaf of 0 is `z·𝒪`, free of rank 1."

After 5.3's `*Needs:*`:

"**Checks.**
- On `S¹` with the trivial line, `f_n(θ)=sin(nθ)` has sup norm 1 and first-derivative seminorm n, so the set is not bounded in the Fréchet topology; it has no uniformly convergent subsequence (a uniform limit would be its weak L² limit 0, while `‖f_n‖_∞=1`), so the sup-norm topology alone is not Montel.
- Dual: on ℝ, `φ↦Σ_(n∈ℤ)φ(n)` is a distribution but not continuous on all smooth functions: a bump at an integer `n>R` pairs to 1 while every seminorm on `[−R,R]` vanishes on it; `δ₀` is continuous, with compact support `{0}`.
- A finite discrete M (dimension 0) with rank r: the section space is `𝕜^(r·|M|)` and bounded sets are relatively compact by Heine–Borel; for the empty M or the zero bundle the space is 0."

After 5.8's `*Needs:*`, before the existing Checks:

"**Checks.**
- `M=S¹⊔S¹`, each circle of length 2π, trivial bundles of ranks 1 and 2, `P=−d²/dθ²`: the eigenvalue 0 has multiplicity `1+2=3` and each `n²`, `n≥1`, multiplicity `2+4=6`; an eigenbasis indexed by one component would give 1 or 2 for the kernel.
- Distributions: for x in the first circle, `δ_x` has components `(δ_x,0)` and `u(φ)=Σ_C u_C(φ|C)=φ(x)`; its assembled `H^s` norm is the first component's, finite exactly for `s<−1/2`.
- Ranks `(0,1)` on `S¹⊔S¹`: the first component contributes the zero Hilbert space and the empty eigenbasis, and the spectrum is that of the second circle; for empty M every space is 0."

## R03 (P3) — The description says `Suggested.lean` changes only in comments; a statement and the imports change

**Location.** Pull request description: "ComplexKahlerGeometry's changes only in comments".

**Claim.** The head restates one headline theorem and adds an import.

**Witness.** `TauCetiRoadmap/ComplexKahlerGeometry/Suggested.lean` line 301–302 at the head: `UniqueFactorizationMonoid ((smoothSheafCommRing …).presheaf.stalk x)`; on main the statement is `∃ _ : IsDomain (…), UniqueFactorizationMonoid (…)`. Line 8 adds `public import TauCeti.Geometry.Manifold.Complex.StructureSheaf.Domain`.

**Repair.** Replace the clause by: "ComplexKahlerGeometry's restates `uniqueFactorizationMonoid_holomorphicStalk` as `UniqueFactorizationMonoid` of the stalk alone, the domain property being Tau Ceti's instance `smoothStalkIsDomain` (one import added), and otherwise changes only comments".

## R04 (P3) — The description's sentence on K7.1 describes an earlier head

**Location.** Pull request description, first bullet: "K7.1 reproves on Mathlib's topology the instances Tau Ceti states on its own copy".

**Claim.** At this head K7.1 does not reprove the instances; it repeats only the proofs of the affine atlas and of the Riemann-sphere diffeomorphism.

**Witness.** README lines 2743–2747: "Obtain the four on Mathlib's instance without repeating those arguments: second countability from the open quotient map … and Hausdorffness, compactness and path-connectedness by transporting the sphere-quotient model's" instances.

**Repair.** Replace the clause by: "K7.1 obtains on Mathlib's topology second countability from the open quotient map and Hausdorffness, compactness and path-connectedness by transport from the sphere-quotient model, and repeats there the proofs of Tau Ceti's affine atlas and Riemann-sphere diffeomorphism".

## R05 (P3) — The description does not state the new supplier, the renumbered sections or the moved target

**Location.** Pull request description, the bullet "Consumer sentences rewritten" and the paragraphs after it; none names these changes of the folder.

**Claim.** A reader must know of three changes the text leaves out: a supplier is added, two sections exchange numbers, and a headline's section moves.

**Witness.** Heading added at README line 309, "### From TauCetiRoadmap.GlobalHolomorphicFunctions" (main's README has no mention of that roadmap); main's "8.2 Nilmanifold comparisons…" and "8.3 Nilpotent central reduction" are 8.3 and 8.2 at the head (lines 3478, 3425); `dolbeault_grothendieck_polydisc` is in 2.4 (line 731), in 2.1 on main.

**Repair.** Add to the ComplexKahlerGeometry bullet: "ComplexKahlerGeometry gains GlobalHolomorphicFunctions as a supplier: 2.2 cites its Layer 2.5 finite-rank Runge operator and keeps only the parameter form, 2.3 cites Layer 7.1's scalar solver as its parameter-free case, and 5.6 cites Layer 7.2's exactness of complex two-forms, keeping only `H²_dR(Ω;ℂ)=0`. Sections 8.2 and 8.3 exchange numbers (nilpotent central reduction is now 8.2, the nilmanifold comparisons 8.3; the labels K8.NilpotentCentralReduction and K8 are unchanged), and the whole-polydisc Dolbeault–Grothendieck lemma moves from 2.1 to 2.4."

## Verified sound

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 3.1 several-variable calculus, realified atlas | 15 names of 3.1–3.2 at the pins | all found; `smoothStalkIsDomain` at Tau Ceti `Geometry/Manifold/Complex/StructureSheaf/Domain.lean` 93 | sound | none |
| 4.1 section sheaves | trivial line on ℂP¹; `F=0`; ideal of 0 in ℂ² | constants; zero module; `dim 𝔪/𝔪²=2≠1` | sound | Checks (R02) |
| 4.2 Chern connection, Koszul–Malgrange | `h=e^(−|z|²)`; `g=e^z` | `A=−z̄ dz`, `F=dz∧dz̄`, `(i/2π)F=(1/π)dx∧dy`; `A′=A+dz`; `∂h=hA` for conjugate-linear first slot | sound | none |
| 5.2 distribution local structure | `H_m`; `z^β∂^αδ`; `1/(1+2x)` | `D^mH_m=δ`, `C^(m−2)`; `(−1)^|β|β!` at `α=β`; `⟨δ^(n)/n!,φ⟩=(−1)^n(−2)^n=2^n` | sound | none |
| 5.3 Fréchet topology, Montel | `sin(nθ)`; `Σφ(n)` on ℝ; finite M | seminorms `1, n`; pairing 1 against zero seminorms; `𝕜^N` | sound | Checks (R02) |
| 5.8 componentwise transport | `S¹⊔S¹`, ranks 1, 2 | kernel `1+2=3`, `n²` with multiplicity 6 | sound | Checks (R02) |
| 5.10, `finiteDimensional_dolbeaultCohomology`, `finrank_dolbeaultCohomology_serre` | Hopf; ℂP¹; `p>n` | `h^(0,1)=1=h^(2,1)`, `h^(1,0)=0`; `1,1,0,0`; ℕ-subtraction excluded by `hp` | sound | none |
| 6.3 `del_delBar_lemma`, `finrank_deRhamCohomology_eq_sum_dolbeault`, `…_symm`, `even_…_odd` | elliptic curve; ℂP¹; Hopf; `κ=dx₁∧dy₁+dx₂∧dy₂+dx₁∧dx₂` | `2=1+1`; `1=0+1+0`; `b₁=1`; `κ(v,Jv)≥|v|²/2`, `κ(J∂x₁,J∂x₂)=0≠1`, excluded by `Compatible.invariant` | sound | none |
| `hard_lefschetz`, `lefschetzMap`, Hodge–Riemann sign | ℂP²; `S²×S²`; `dz`, `dz̄` on a curve | `[ω]²≠0`; `(aσ₁+bσ₂)²=2ab`, `σ₁²=0`; `i dz∧dz̄=2dx∧dy` and `−i dz̄∧dz=2dx∧dy`, both positive | sound | none |
| 7.1 projective models | `(3,4)`, `2i(3,4)`; `(1,i)`; `n=0` | `(3/5,4/5)`, chart `4/3`; chart `i`, conjugate map `−i`; one point | sound | description (R04) |
| 7.3 `finrank_…_complexProjectiveSpace` (two), `integralCohomology_…`, `integralCupPow` | `n=0,1,2`; `S²∨S⁴`; `u=2·`generator | `h^(0,0)=1`; `h^(2,2)(ℂP¹)=0`; `u²=0`; fails at `k=1`; `Σ(−1)^k b_k=n+1` | sound | Needs (R01) |
| 7.4 incidence blowup | chart overlap; `k=1`; wrong sign | `a′=az_k`, `z′_i=1/z_k`; character `t^(−1)`; `F(v)=tF(tv)→0` | sound | none |
| 7.6 `finrank_dolbeaultCohomology_complexTorus` | `n=0,1,2`; `L=ℤ⊂ℂ` | `1`; `h^(2,0)=0`; `1+4+1=6=C(4,2)`; excluded by `IsZLattice ℝ L` | sound | none |
| 7.7 `finrank_dolbeaultCohomology_riemannSurface`, symplectic normal form | two elliptic curves; `[[0,2],[−2,0]]`; `H₁≅H¹≅Hom(H₁,ℤ)` | `2=2`, `4=2·2`; determinant 4; torsion-free, so free | sound | none |
| 7.8 flat lines | `ρ=e^(aλ)`, `a=α+iβ`, `τ=x+iy`; `u=−2Gφ` | `u=α`, `v=αx−βy`, formula returns `α+iβ`; `iF_(h′)=φω+(Δ_d u)ω/2=0` | sound | none |
| 7.9 Hopf surface | weights on `Ω¹`, `Ω²`; Betti | `2^(a+b+1)`, `2^(1−m−n)`: none 1; `Ω²`: `2^(2−m−n)=1` at `m=n=1`, so `h^(2,1)=1`; `b=(1,1,0,1,1)` | sound | none |
| 8.1, `finrank_deRhamCohomology_le_sum_dolbeault` | `E₁^(1,0)`; Iwasawa; stable page | native `(2p+q+1,−p−1)=(3,−2)→(5,−3)`; `4<5`; `r≥max(p,n−p)+1` | sound | none |
| 8.2–8.3 nilmanifolds | integer Heisenberg; Iwasawa | `log=X+Y+½Z`; `dφ₃=−φ₁∧φ₂`, `h^(1,0)=3`, `h^(0,1)=2`, `b₁=4` | sound | description (R05) |
| `newlander_nirenberg` | `n=0`; `J` of a complex atlas | point, constant φ; charts are the φ, converse pinned | sound | none |
| `dolbeault_grothendieck_polydisc`, `polydisc`, 2.4 Checks | `n=0`; `r_k≤0`; `dz̄/z̄` on ℂ× | point, forms of degree ≥1 vanish; empty; `=∂̄log|z|²`, `∮=−2πi` | sound | description (R05) |
| 2.2 Runge operator, `exists_mixed_parameter_dbar_solution` | annulus in `|z|<4`, `f=1/z`; `f=q̄` | `sup_K|f−Af|≥2π/4π=1/2`, `sup_L|f|=2/3`, none for `ε<3/4`; `∂̄_qT(χf)=T(χ)≠0`, excluded by `hfhol` | sound | description (R05) |
| `weierstrass_preparation`, `_unique`, `weierstrass_division` | `w²−z`; `w³`; `d=0`; `n=0` | `u=1`, `a=(−z,0)`; `q=w`, `r=zw`; `u=f`; `f=u·w^d` | sound | none |
| `ruckert_nullstellensatz`, `oka_coherence`, `cartan_coherence_reducedIdeal` | `k=0`; `f=(z₁,z₂)`; `(zw)²` | `g=0`, `m=1`; relation `(z₂,−z₁)`; generator `zw` | sound | none |
| `riemann_extension`, `hartogs_extension_across_point` | `k=0`; `1/z`; doubled origin | `U=∅`; unbounded, excluded; extends in the chart of `p` | sound | none |
| `isRegularLocalRing_holomorphicStalk`, `uniqueFactorizationMonoid_holomorphicStalk` | `E=0`; `E=ℂ` | field, dimension 0; discrete valuation ring, dimension 1 | sound | description (R03) |
| `hodge_theorem_deRham` | circle; flat torus; `m≠dim` | `d*(f dθ)=−f′`, line; `a dx+b dy`; excluded by `Orientation.card_eq` | sound | none |
| 5.5–5.6 complex de Rham | `dz/z`; `u=z̄/(2i)` | `c_U=0`, `c_L=−2πi`, `Per=2πi`; `d(u dz)=dx∧dy` | sound | description (R05) |
| 5.7 realification adapter; 6.1–6.2 | `a_±=Q±i‖u‖²`; `[Λ,d]`; `x²+y²` | `Re((1∓i)a_±)=Q+‖u‖²`; `i∂̄*−i∂*=−(d^c)*`; `Δ_H=−4` | sound | none |

- Source locators checked against the text, 41: `demailly-agbook` lines 879, 1266, 1288, 3794, 3804–3817, 3872, 3931, 4286, 4399–4403, 4613, 4742, 4789, 4796, 4842, 4929, 5189, 11208, 11260–11287, 12242, 12832, 12846, 12964–12990, 13017, 13040, 13051, 13154–13166, 13215, 13221–13258, 13724–13727, 13812, 14239–14240, 14583–14606, 14697–14706, 14858–14869, 15370–15395, 15442–15460, 15486, 15523–15528, 15557, 15715–15716, 15946–15956, 16000; `sakane-parallelisable` 95–115; `angella-iwasawa` 256, 693–724; `hormann-steinbauer-distributions` 1517–1523, 3751–3764; `ballmann-kahler` 1829, 1990; `berwick-evans-tripathy` 287–292; `knutson-borel-weil` 12–45; `lojasiewicz-triangulation` 504–512; `rainer-advanced-complex-analysis` 1602, 1630.
- Library declarations opened at the pins: Tau Ceti `Geometry/Symplectic/Manifold/TwoForm.lean` 231 (`Compatible` = `invariant` and `tames`), `Geometry/Manifold/Orientation/Basic.lean` 83 (`card_eq`), `Geometry/Manifold/Complex/StructureSheaf/Domain.lean` 93, `Algebra/Homology/SpectralSequence/Filtered/Comparison.lean` 70, `AlgebraicTopology/Cohomology/IntegralCup.lean` 187, `LinearAlgebra/BilinearForm/SymplecticBasis.lean` 357; Mathlib `Analysis/LocallyConvex/Montel.lean` 46, 93, `Algebra/Homology/SpectralObject/HasSpectralSequence.lean` 143. A further 60 backticked names of the sampled sections were each found declared at the pins; the two names of the citation report are module names whose files exist.
- Cross-roadmap citations resolved: GlobalHolomorphicFunctions on main (README 1380, 1444, 2268, 2339; `Suggested.lean` 141, 177, 290, 327; its line 2547 "ComplexKahlerGeometry is a consumer only"); at this head AlgebraicTopology (Stage-to-Layer map at 997–1011; 4.5, 4.6 at 1827, 4.7, 5.0 at 2161, 6.3–6.5, 8.7 at 4186), CharacteristicClasses (C1.5, C1.5a, C2.4a, C7.6), GeneralizedCohomology 418–427, TopologicalKTheory 196; on main ComplexManifolds Milestones 1–7, ComplexTori Milestone 1 items 3–4, DeRhamCohomologyAndDuality §§2.4, 3.1–3.3, 4.1, DifferentialGeometry (5.5 mapped to 5.5a), PDE §§1.3–1.7, 2.2, PseudodifferentialOperators P1.0, P1.1, P5, P7, RealAnalyticGeometry R0–R5, SmoothBundlesConnections B1–B6.3, LieGroupoidsPoisson §G1.3, StableReduction Layer 4, GeometricTopology Layer 11, CalibratedGeometry 974–1002.
- Dependency check: `depcheck: 234 roadmaps, 2252 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The mutual supply with RealAnalyticGeometry and PseudodifferentialOperators is the deferral D01 recorded by the review at d524e59; it is unchanged at this head and not raised again.
- Gate: the worker's gate at 445f965 passed. My rerun: every scanner 0 except `outside-folder=24`, which lists only the twelve other folders this pull request owns.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 27 `sorry` warnings and nothing else. One-tactic probe: all 27 sorried theorems with `first | rfl | infer_instance | simp` on a scratch copy; none closes (22 fail outright, 5 leave goals). `#check @name` for every declaration: each theorem keeps `[FiniteDimensional …]`, `[T2Space M]`, `[CompactSpace M]`, `[I.Boundaryless]`; the four flagged binders are on `dolbeaultCocycles`, `dolbeaultCoboundaries`, `DolbeaultCohomology` and `lefschetzMap`, whose bodies do not use them.
- Headlines: the 27 end theorems of the Summary are all stated; the module docstring names the unstatable ones with the missing carrier. No padding found.
- Pull request #1808 also changes this folder; the merge-order block orders it after this pull request.

Overlap check: read GlobalHolomorphicFunctions, CalibratedGeometry, ComplexComparisonPartII (main), SmoothBundlesConnections, TeichmullerGeometry, SpectralManifolds, RelativisticQuantumFieldTheory, SobolevDifferentialForms and LefschetzStructures (open heads); shared: finite-rank Runge operator, scalar `∂̄` solver and planar two-form exactness, owner GlobalHolomorphicFunctions, cited here; Wirtinger inequality and calibration, owner CalibratedGeometry, which cites K5b.0 and K6.1 for the volume and cycle normalizations; the L² Hodge decomposition of SobolevDifferentialForms is on Lipschitz domains, a different object; nothing else shared.

Source independence: 14 passages compared with 7 sources, none shared beyond statements the mathematics forces; largest share `demailly-agbook`, 57 of 96 source mentions; contents compared with `demailly-agbook` (Chapters I–IX): independent. Layer 2 draws on its Chapters I and IV, Layer 5 mostly on none, Layer 6 on III, VI and VII, Layers 1, 7 and 8 match no chapter; the order germs, bundles, elliptic theory, Kähler theory is forced by 4.1's use of 3.1's sheaf, 5.9's use of Layer 4 and 6.3's use of 5.10.

## Not verifiable

- `webster-nn`, `hormander-alpdo1`, `griffiths-harris`, `koszul-malgrange`, `wells-dacm`: settled as uncertified; cited by locator only.
- `raghunathan-discrete-subgroups`, `nomizu-nilmanifolds`: settled as uncertified; read only as quoted at `sakane-parallelisable` lines 112–113 and `angella-iwasawa` line 256.
- `knutson-borel-weil` §1: the extraction has lost its formulas (lines 13–38); only the prose was compared.

## Source issues

- none

## For the human reviewers

- **Licence.** `knutson-borel-weil` and `rainer-advanced-complex-analysis` are unpublished lecture notes read from their authors' university pages; `ballmann-kahler` is read from a third party's course page (people.maths.ox.ac.uk), not from the publisher or the author.
