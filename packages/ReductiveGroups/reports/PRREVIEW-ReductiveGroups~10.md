# Review of ReductiveGroups (pull request #1332 at 4742ba3)

**Verdict:** needs changes

## R01 (P1) — Companion supplier attribution still reverses supply

**Location:** `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:134`: “is a target of the lower FCO dictionary”; line 23: “IG.5.1 supplies the generic configuration/disc comparison”.

**Claim:** The unchanged companion still imports the group dictionary from FormalConnectionsOpers, which consumes ReductiveGroups. This conflicts with local ownership in README §§3A.5/11.0 and creates two directions of supply. The configuration attribution also contradicts local §11A.

**Witness:** `TauCetiRoadmap/FormalConnectionsOpers/README.md:240` imports ReductiveGroups Layers 0–9; §4.3 at line 1383 builds its dictionary from them; line 2444 exports it to ReductiveGroups Layer 11. The named open head was reread.

**Repair:** Replace the FCO attribution with local §§3A.5/11.0, and both IG.5.1 attributions (lines 23 and 76) with local §11A. Keep the oper application downstream. For SL₂ at diag(1,−1), the local chart differential has coefficients −2,2,1 and determinant −4; it needs no oper input. The repaired Hurwitz calculation likewise needs no IG input. This is previous R04, unchanged. The mechanical README check below does not detect these companion comments.

## R02 (P2) — Admitted data remain in the companion acceptance files

**Location:** `TauCetiRoadmap/ReductiveGroups/ChevalleyModelTargets.lean:45`, `canonicalSCInput`; `TauCetiRoadmap/ReductiveGroups/SpectralWeylTargets.lean:63`, `centerHomeomorph`.

**Claim:** Both definitions still have admitted bodies. Naming missing constructions in the main module docstring does not remove the companion admissions or the declarations that depend on them. The Lean form rules apply to every listed file.

**Witness:** `canonicalSCInput` ends with “:= by sorry”; `centerHomeomorph` ends with “:= sorry”. IntegralRational:107 similarly admits an actual PBW basis; SpectralWeyl:77 and :118 admit the braid equivalence and spectrum map.

**Repair:** Delete admitted data and their dependent declarations from the acceptance files; keep their construction, maps and defining laws in the README and name the missing objects in the appropriate docstring. Do not move the admissions into `Suggested.lean`. The centering specification still gives (1,3)↦(2,(−1,1)) and inverse (1,3); for n=0 the configuration is a point, not ℂ×point. These mathematical Checks survive the deletion. Previous R05 is not repaired.

## R03 (P2) — The Chevalley input still does not determine the prescribed model

**Location:** `TauCetiRoadmap/ReductiveGroups/ChevalleyModelTargets.lean:23`, `SCRealizationInput`; lines 36–39 impose weights and eigenvalue equations.

**Claim:** The unchanged record used by `canonicalSCInput` lacks identification of the supplied root vectors with the normalized full frame required by README §9A.1c. Its type therefore permits an input whose closure is a torus rather than the prescribed simply connected group.

**Witness:** For A₁ use the standard sl₂ representation on ℚ², lattice ℤ² and H=diag(1,−1), but supplied e=0. Weights ±1 generate ℤ; all eigenvalue constraints hold. The closure has dimension 1, whereas SL₂ has dimension 3.

**Repair:** Remove the stand-in and its dependents as in R02, preserving the full-frame construction in the README. A future realization must identify its supplied vectors with the normalized frame and enforce opposite-root and root-string relations. The equation [E,F]=H rejects the bad input (0≠H) and accepts E₁₂,E₂₁ (their bracket is H). This is previous R06. The record's disclaimer acknowledges, but does not repair, the missing specification.

## R04 (P3) — Companion imports still violate the acceptance-file form

**Location:** `TauCetiRoadmap/ReductiveGroups/CoverLiftTargets.lean:1`: “import TauCetiRoadmap.ReductiveGroups.SignedADETargets”.

**Claim:** The companion files retain roadmap imports, Mathlib submodule imports, or omit the required root Mathlib import.

**Witness:** BruhatCoordinateTargets:1 imports a Mathlib submodule; ChevalleyModelTargets:1–3 has only Tau Ceti imports; SpectralWeylTargets:1 imports Suggested and puts Mathlib at line 12. OrbitGeometry, IntegralRational, SignedADE and FoldingADE likewise import roadmap modules.

**Repair:** After R02, start each retained acceptance file with the single `import Mathlib`, followed only by individually used pinned Tau Ceti modules. Alternatively consolidate surviving headline statements into `Suggested.lean` and delete the companion. The main file already has the required header and elaborates. This is previous R07, unchanged.

## R05 (P3) — Definition expansions and numerical Checks remain as padding

**Location:** `TauCetiRoadmap/ReductiveGroups/IntegralRationalTargets.lean:204`, `rationalDistributionAction_apply`; `TauCetiRoadmap/ReductiveGroups/BruhatCoordinateTargets.lean:38`, `wrong_left_complement_overlaps`.

**Claim:** These acceptance declarations expand definitions or reproduce small README examples. FoldingADE also includes the library's fixed-kernel identity.

**Witness:** A fresh scratch probe of the identical restricted-convolution formula closes with `rfl` for every subalgebra. FoldingADE:329–331 directly invokes `LinearMap.fixedSubmodule_eq_ker`. Bruhat's upper-triangular Check computes 7=1+2·3.

**Repair:** Delete this padding from `Suggested.lean` and its companion acceptance files; the README keeps the statements and Checks. Do not prove it in place. ChevalleyModel:72 is also the specialization of `kostantToralWeightTorusPoints_conj_rootSubgroupPoints` at `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/RootSubgroup/Scheme/ToralClosure/Points.lean:241`, with the record's weight hypotheses. Previous R08 is unchanged; the earlier nine-headline padding probes are carried forward.

## R06 (P3) — Source registration and companion module form remain incomplete

**Location:** `TauCetiRoadmap/ReductiveGroups/README.md:4400`, References; `TauCetiRoadmap/ReductiveGroups/FoldingADETargets.lean:310`: “Uniform matrix and exceptional exact-word certificates”.

**Claim:** There is still no source manifest, the quoted terminology remains undefined, and companions retain catalogue/construction-target docstrings rather than the required headline target-signature form. The new main docstring repairs the endpoint-list part of previous R09.

**Witness:** The folder has no `sources.toml`. FoldingADE:310 is unchanged; ChevalleyModel:6 calls itself “Nonexhaustive integral model construction targets”; SpectralWeyl:17–20 explicitly retains admitted data interfaces. Suggested:35–45 now names the previously omitted endpoints.

**Repair:** Register each cited work once with legal provenance and status; preserve uncertified locators for inaccessible texts. Replace the undefined phrase by the exact mathematical surjectivity/root-generation claim. After R02–R05, give surviving files target-signature module docstrings and mathematical declaration docstrings. Keep the newly added endpoint explanations. In particular register the retrieved 1985 Jantzen preprint under one key, with the verified I.7 locators; no request to obtain a paywalled work is needed.

## Previous findings

Dispositions refer to [the previous report][r9] at f917c97. Every prior finding is accounted for.

- R01 — repaired: README:3547–3556 distinguishes the scheme kernel αₚ from the distribution-map kernel, includes γ₀ and γₚ₊₁ controls, and proves the augmentation-ideal formula.
- R02 — repaired: README:4033–4038 sends the swapped product to ba and supplies the noncommuting S₃ example; the Hurwitz pair still multiplies to ab.
- R03 — repaired: README:1894–1897 says “upper unitriangular in the chosen basis”; all displayed conjugates remain unipotent, including the nonidentity s=1 matrix.
- R04 — not repaired: SpectralWeylTargets:23, :76 and :134 retain the IG/FCO attributions despite local ownership in §§11A and 3A.5/11.0; carried as R01.
- R05 — not repaired: ChevalleyModelTargets:45 and SpectralWeylTargets:63 still admit data, alongside other unchanged companion constructions; carried as R02.
- R06 — not repaired: ChevalleyModelTargets:23–39 still permits supplied root vectors e=0; the full-frame prose is unchanged and the Lean specification remains insufficient; carried as R03.
- R07 — not repaired: CoverLiftTargets:1 and the other companion import headers are unchanged; carried as R04.
- R08 — not repaired: IntegralRationalTargets:204 remains a definitional action formula, and the fixed-kernel/numerical companion statements remain; carried as R05.
- R09 — partly repaired: Suggested:35–45 now names Levi, Harish–Chandra/Mackey, distributions/Frobenius/contraction and Weyl/Steinberg endpoints. The absent source manifest, undefined certificate phrase and companion docstrings remain; carried as R06.

The older gap-registry disposition recorded as settled in the previous report is not reopened.

## Verified sound

### Scope and mechanical checks

This is an incremental re-review of **38 changed lines since f917c97**: 24 README lines and 14 main-module docstring lines. No Lean term, theorem type or companion file changed. All three changed mathematical Checks and their surrounding formulas were recomputed. No new mathematical defect was found in those repairs. The worktree is at the requested full head and clean; both the incremental diff and the PR diff against origin/main contain no changes outside this folder.

The supplied push gate passes, including its build check. The fresh gate rerun also reports every scanner/dependency check zero and OK. A separate fresh targeted build, `lake build TauCetiRoadmap.ReductiveGroups.Suggested`, succeeds (9129 jobs). Direct `lake env lean` elaboration of the main file succeeds with exactly nine admitted-theorem warnings and no other warnings. No full-library build, dependency update or repository edit was performed.

The fresh dependency check output is:

    depcheck: 204 roadmaps, 1498 edges, 0 problem(s)

There is no UPWARD or CYCLE line. R01 concerns explicit companion attributions outside the README scanner. The changed passages introduce no supplier edge; their dependencies are existing local §§7b, 9C and 11A. The main docstring's local references §§6A, 7c–7e, 7g, 9C and 10 resolve to the intended constructions.

Fresh scratch `#check @name` probes covered **all 28 explicit main-file declarations**, including its nine theorems. The printed types retain the required algebraic closure, smoothness, affineness, quasi-compactness, finite-type and separatedness assumptions; properness; characteristic zero and geometric connectedness; centrality; the crystallographic pairing and full frame; and n≥2. No binder changed or disappeared. The previous report's 280 unchanged companion declaration checks and one-tactic probes are carried forward rather than represented as newly run. The fresh restricted-convolution padding probe succeeds with `rfl` and no warnings.

### Headline and ownership checks

The README headlines are orbit local closedness, boundary dimension drop and closed orbits (§3A); proper complex points and smooth comparison (§3A.5); complete reducibility, general Levi complements and affine homogeneous quotients (§§6–6B); Lang–Steinberg and Harish–Chandra/Mackey (§§7a–7g); split and relative classification (§8); signed ADE, cover-lift kernel, folding, PBW, pinned integral groups and distributions/Frobenius (§9); highest weights, Weyl/simple and Steinberg modules (§10); and braid, arrangement and spectral Weyl monodromy (§11).

The nine unchanged main statements are `orbit_locallyClosed`, `boundary_dimension_lt`, `exists_closed_orbit_in_closure`, `exists_closed_orbit`, `compact_complexPoints`, `reductive_iff_linearlyReductive`, `exists_characterKernelEquiv`, `integral_pbw` and `permutation_extension_nonsplit`. The new docstring accounts for the endpoint families missing from the old list. Its general Levi complement is distinguished correctly from a cocharacter's dynamic Levi: for GL₂ the latter is the two-dimensional diagonal torus, whereas a Levi complement to R_u(GL₂)=1 is all four-dimensional GL₂. The missing group-specific rational-module and distribution constructions are not supplied by an abstract finite-group representation or a native convolution algebra.

Fresh object searches used the pinned libraries, `roadmaps grep`, the main checkout, supplied open heads and package records. The dynamic-Levi, identity-supported distribution, contracted-module and Harish–Chandra terms were searched as objects. The changed text introduces no new construction owner. FormalConnectionsOpers was reread using `roadmaps show` at the supplied head and its actual file, resolving the three concrete sites in R01. Its local analytic dictionary still claims the reverse supply. No FormalConnectionsOpers folder exists on main, so this is an admissible new-roadmap-head comparison, not substitution of an open revision for main.

The group-specific constructions remain ReductiveGroups' responsibility; the repairs do not narrow to good primes or replace the existing programme. Shape was compared with main ReflectionInvariantTheory and Completed/EffectiveBounds. The wider unchanged supplier and duplication audit is carried from [r9]. Ownership against open heads whose files the brief does not supply was not checked; index hits for those heads were not used as findings.

These **four pinned declaration sites** were reopened for the changed docstring and carried findings (Mathlib 6b7abb3c; Tau Ceti a91d3aaf):

| Object | Declaration and pinned file | Boundary verified |
|---|---|---|
| Dynamic Levi | `TauCeti.GeneralLinear.Dynamic.mem_dynamicLevi_iff`, `TauCeti/Algebra/AlgebraicGroup/GeneralLinear/Dynamic/GL2/Subgroups.lean:72` | The cocharacter diag(t,1) gives the diagonal torus; not the general characteristic-zero Levi complement of §6A. |
| Convolution action | `TauCeti.Comodule.convolutionAction` and `convolutionAction_apply`, `TauCeti/Algebra/Coalgebra/Comodule/Convolution.lean:49` and :91 | Coaction contraction on the full convolution dual; restricting to a subalgebra does not change the evaluation formula. |
| Torus/root conjugation | `kostantToralWeightTorusPoints_conj_rootSubgroupPoints`, `TauCeti/Algebra/Lie/UniversalEnveloping/Kostant/RootSubgroup/Scheme/ToralClosure/Points.lean:241` | Requires the actual weight-vector and root-eigenvalue hypotheses, exactly those specialized by ChevalleyModel:72. |
| Fixed submodule | `LinearMap.fixedSubmodule_eq_ker`, `Mathlib/LinearAlgebra/FixedSubmodule.lean:42` | Fixed submodule equals ker(f−id); FoldingADE:329–331 copies this identity. |

### Sources and the seeded sample

None of the 15 seeded sections is changed by this diff. Their source/hypothesis checks and numerical rows are carried from [r9], not claimed as fresh source readings. No README locator is explicitly marked unverified. The only newly introduced source locator, Jantzen's 1985 preprint I.7.2–I.7.3 and I.7.8–I.7.9, was fetched through the sources service from the [MPIM institutional archive](https://archive.mpim-bonn.mpg.de/id/eprint/607/1/preprint_1985_9.pdf).

The actual printed pages agree: I.7.2 starts on p. 136 (jantzen line 3640); the affine-line dual basis is on pp. 137–138 (line 3683); the additive-group product calculation is on p. 144 (line 3867); functoriality as an algebra map is on p. 145 (line 3898), continuing with subgroup inclusions on p. 146 (line 3907). These are the ingredients cited for applying x↦xᵖ, not an assertion that the book states the README's particular kernel sentence verbatim.

For all n,k, the induced functional has value γₖ(x^(pn))=δₖ,ₚₙ, yielding the stated Frobenius images. For k=pm+r with 0<r<p, the coefficient of Xʳ in (1+X)ᵖᵐ⁺ʳ=(1+Xᵖ)ᵐ(1+X)ʳ over 𝔽ₚ is 1. Thus γᵣγₚₘ=γₖ, proving the displayed kernel-span equals the augmentation-generated ideal; the reverse inclusion follows because γ₁,…,γₚ₋₁ map to zero. This verifies the new claim at its stated generality, in addition to the p=2,3 tests.

### Computed adversarial table

Rows marked **Fresh** recompute the changed statements and the endpoint distinctions added to the docstring. Each other row explicitly cites [r9] and carries its previously computed values for an unchanged statement. R-numbers in the final column refer to this report. Finite examples are witnesses and negative controls, not proofs of general headlines.

| Statement/object | Instances tried | Values on each side | Result/change |
|---|---|---|---|
| 0.1 convolution order | Constant S₃, a=(12), b=(23) | ab=(123); ba=(132) | Retain noncommutative points.  Carried from [r9]. |
| 0.1 inverse and identity | Gₘ(ℚ), t=2 | inverse evaluates t at 1/2; identity at 1 | Retain.  Carried from [r9]. |
| 0.1 zero test algebra | R=0 | one algebra map and one group element, 0=1 | Retain zero ring.  Carried from [r9]. |
| 0.2 three model comparison | SL₂, I+E₁₂ and I+E₂₁ | product [[2,1],[1,1]] in all models; reversed [[1,1],[1,2]] | Retain variance/order.  Carried from [r9]. |
| 0.2 nilpotent points | Gₐ over k[ε]/ε² | t↦ε is nonzero; reduction sends it to 0 | Retain scheme-valued points.  Carried from [r9]. |
| 0.2 rank zero | Trivial group, any test ring | Hopf algebra k; point set cardinal 1 | Retain.  Carried from [r9]. |
| 0.3 base change | μ₂ over ℚ and 𝔽₂ | rank 2 both; t²−1 becomes (t−1)² only in characteristic 2 | Retain smoothness distinction.  Carried from [r9]. |
| 0.3 quotient sheaf | Squaring Gₘ over ℚ, point 2 | no rational lift; lift √2 after finite flat extension | Retain sheafification.  Carried from [r9]. |
| 1.0a right coaction | Weight 3 at t=2 | v⊗t³ gives 8v; inverse convention gives v/8 | Retain.  Carried from [r9]. |
| 1.0a dual/tensor | Weights 1,2,3 | 2·4=8; weight-3 dual acts by 1/8, evaluation unchanged | Retain.  Carried from [r9]. |
| 1.0a infinite representations | Direct sum of integer weights | each vector has finitely many nonzero coefficients; no uniform bound on all weights | Retain finite support, not finite total dimension.  Carried from [r9]. |
| 1.0b tensor automorphisms | Gₘ, tensor unit and weights ±1 | unit scalar 1; scalars a,a⁻¹; product 1 | Retain; arbitrary unrelated scalars fail.  Carried from [r9]. |
| 1.0b infinitesimal reconstruction | μ₂, k=𝔽₂, A=k[ε]/ε² | 1 and 1+ε are distinct A-points; both square to 1 | Retain all test algebras.  Carried from [r9]. |
| 1.1 cohomology | Trivial group with coefficients A | Hochschild differentials 0,id,0; H⁰=A and Hⁱ=0 for i>0 | Retain; all-zero differential fails.  Carried from [r9]. |
| 1.1 induction/counit | Trivial subgroup in C₂ | induced rank 2; evaluation at identity returns chosen first coordinate | Retain inverse translation convention.  Carried from [r9]. |
| 2.1 tangent and bracket | SL₂, E=E₁₂, F=E₂₁ | EF−FE=diag(1,−1); reverse bracket is its negative | Retain left-invariant sign.  Carried from [r9]. |
| 2.1 scheme kernel | Frobenius on Gₘ in characteristic p | differential 0; Lie kernel dimension 1; μₚ scheme dimension 0 | Retain tangent kernel, no smoothness inference.  Carried from [r9]. |
| 2.1 smooth dimension | Gₐ and αₚ | tangent dimensions 1,1; scheme dimensions 1,0 | Retain smoothness hypothesis.  Carried from [r9]. |
| 3.1 Hopf ideals | αₚ² modulo first αₚ | quotient coordinate k[y]/yᵖ; rank p, kernel rank p | Retain nonreduced subgroup.  Carried from [r9]. |
| 3.1 normal quotient | S₃/A₃ versus S₃/C₂ | quotient group order 2 in first case; second coset set has 3 elements but no quotient group law | Retain normality.  Carried from [r9]. |
| 3.1 inverse order | Ideals 0 and augmentation ideal | represented subgroups G and 1 | Retain order reversal.  Carried from [r9]. |
| 3.2 identity component | μ₂ over 𝔽₂ versus 𝔽₃ | component degree 1 versus 2; total scheme length 2 in both | Retain nonreduced identity component.  Carried from [r9]. |
| 3.2 component descent | μ₃ over ℝ | étale degree 3, but only one real point | Retain scheme π₀, not π₀ of rational points.  Carried from [r9]. |
| 3.2 disconnected example | Constant S₃ | G°=1; π₀ order 6; exact kernel order 1 | Retain.  Carried from [r9]. |
| 3A orbit map and local closedness | Gₘ on ℙ¹ at 1 | orbit ℙ¹−{0,∞}, open; orbit dimension 1 | Retain headline.  Carried from [r9]. |
| 3A boundary_dimension_lt | Same orbit | boundary {0,∞}, dimension 0<1 | Retain headline.  Carried from [r9]. |
| 3A empty boundary | Gₘ on ℙ¹ at 0 | orbit {0}, dimension 0; boundary ∅ has dimension bottom<0 | Retain WithBot dimension.  Carried from [r9]. |
| 3A disconnected boundary | C₂ permutes two points | orbit size 2, dimension 0; empty boundary bottom | Retain disconnected ambient group.  Carried from [r9]. |
| 3A closed orbit in closure | Gₘ on ℙ¹ at 1 | closure ℙ¹; closed orbit {0}⊆ℙ¹ | Retain headline.  Carried from [r9]. |
| 3A existence of closed orbit | Nonempty finite two-point scheme; empty scheme | two closed singleton orbits for trivial action; zero rational points on empty scheme | Retain nonemptiness premise.  Carried from [r9]. |
| 3A nilpotent action scheme | Trivial group on Spec k[ε]/ε² | underlying orbit closure one point, dimension 0, boundary empty | Retain nonreduced X.  Carried from [r9]. |
| 3A.5 classical subbasis | ℂ affine line, coordinate t | t⁻¹(unit disc)=unit disc, not a Zariski open | Retain classical topology.  Carried from [r9]. |
| 3A.5 compact_complexPoints | ℙ¹ and affine line | ℙ¹(ℂ) compact sphere; sequence n in ℂ unbounded | Retain properness premise.  Carried from [r9]. |
| 3A.5 empty/zero-dimensional proper scheme | Empty scheme; Spec ℂ[ε]/ε² | point-space cardinalities 0 and 1, both compact | Retain no reducedness requirement.  Carried from [r9]. |
| 3A.5 smooth charts | Node xy=0 at origin | tangent dimension 2; local component dimension 1 | Retain smoothness premise.  Carried from [r9]. |
| 3A.5 separation | Affine line with doubled origin | two distinct origins not separable by disjoint neighborhoods | Retain separatedness for Hausdorff conclusion.  Carried from [r9]. |
| 4.1 Jordan factors | [[2,1],[0,2]] over ℚ | semisimple 2I, unipotent I+E₁₂/2; product original matrix | Retain.  Carried from [r9]. |
| 4.1 small characteristic | I+E₁₂ over 𝔽₂ | square I; semisimple factor I; unipotent factor original | Retain.  Carried from [r9]. |
| 4.2 diagonalizable functor | M=ℤ and M=ℤ/p | points Aˣ and {u:uᵖ=1}; coordinate ranks infinite and p | Retain torsion characters.  Carried from [r9]. |
| 4.2 smoothness criterion | μₚ in characteristic p | p-torsion present, tangent dimension 1 and nonreduced rank p | Retain no p-torsion criterion.  Carried from [r9]. |
| 4.2 contravariance | ℤ→ℤ, m↦2m | induced Gₘ map u↦u²; at u=3 gives 9 | Retain arrow reversal.  Carried from [r9]. |
| 4.3 character pairing | χ(t)=t³, ν(t)=t⁻² | χν(t)=t⁻⁶; pairing −6 | Retain sign.  Carried from [r9]. |
| 4.3 nonsplit torus | Norm-one torus over ℝ | geometric character lattice ℤ; conjugation −1; invariant characters 0 | Retain geometric lattice.  Carried from [r9]. |
| 5.1 unipotence criterion | αₚ versus μₚ | both have one geometric point; αₚ unipotent, μₚ has nontrivial weights and is not unipotent | Retain nonreduced extension target.  Carried from [r9]. |
| 5.1 triangular group | Upper Borel of GL₂ | diagonal characters t₁,t₂; radical matrices I+aE₁₂ | Retain diagonal characters, not all entries 1.  Carried from [r9]. |
| 5.2 radicals | Gₐ, Gₘ, SL₂ | unipotent radical dimensions 1,0,0 | Retain normality and smoothness.  Carried from [r9]. |
| 5.2 inseparable base change | Res(K/k)Gₘ, [K:k]=p purely inseparable | k-radical dimension 0; geometric radical dimension p−1 | Retain only inclusion in general.  Carried from [r9]. |
| 5P exponential | X=E₁₂, Y=E₂₃ in U₃ over ℚ | exp(X)exp(Y) has (1,3)=1; exp(X+Y) has (1,3)=1/2 | Retain BCH correction.  Carried from [r9]. |
| 5P characteristic bound | E nilpotent with E²=0 | exp(E)=I+E; no division by p! is used | Retain characteristic-zero polynomial construction.  Carried from [r9]. |
| 6.1 reductivity | Gₐ, Gₘ, SL₂ | false,true,true; respective geometric unipotent radicals Gₐ,1,1 | Retain.  Carried from [r9]. |
| 6.1 schematic center | SL₂ over 𝔽₂ | center μ₂, length 2, not smooth | Retain schematic center.  Carried from [r9]. |
| 6.2 characteristic-zero iff | Gₘ and Gₐ over ℚ | weight representations split for Gₘ; translation extension for Gₐ has no invariant complement | Retain headline in both directions.  Carried from [r9]. |
| 6.2 characteristic p | SL₂ acting on Sym²(k²), p=2 | squares span stable dimension 2 inside dimension 3; extension does not split | Retain characteristic-zero premise.  Carried from [r9]. |
| 6.2 smoothness in torus criterion | μₚ | linearly reductive by grading, smooth=false, torus=false | Retain restricted criterion; source error below.  Carried from [r9]. |
| 6.2 Reynolds projection | Gₘ on k[t,t⁻¹] | R(t)=R(t⁻¹)=0; R(tt⁻¹)=1 | Retain linear projection, not algebra homomorphism.  Carried from [r9]. |
| 6A Levi complement | Gₐ⋊Gₘ, t·v=tv | (0,2)(3,1)=(6,2), while (3,1)(0,2)=(3,2) | Retain semidirect product, not direct product.  Carried from [r9]. |
| 6A Levi conjugacy | Upper GL₂ Borel, u=I+E₁₂ | u diag(a,b)u⁻¹=[[a,b−a],[0,b]] | Retain radical conjugacy and noncanonical section.  Carried from [r9]. |
| 6B affine quotient | SL₂/T coordinates x=ab,y=cd,z=ad | [[1,1],[1,2]] gives (1,2,2); xy=2=z(z−1) | Retain affine invariant comparison.  Carried from [r9]. |
| 6B reductive subgroup premise | SL₂/B | quotient ℙ¹, positive dimension and not affine | Retain subgroup reductivity premise.  Carried from [r9]. |
| 6B disconnected reductive identity | S₃/C₂ in characteristic zero | finite affine quotient with 3 points | Retain H° criterion.  Carried from [r9]. |
| 7.1 Borels/maximal tori | GL₂, diagonal T and upper B | dimensions 2 and 3; flag quotient dimension 1 | Retain.  Carried from [r9]. |
| 7.2 Levi decomposition | Upper GL₂ Borel | T×U dimensions 2+1=3; U has no torus factor | Retain.  Carried from [r9]. |
| 7.3 extracted root datum | SL₂ and PGL₂ | same two roots geometrically; root/coroot lattice index 2 changes side | Retain full root datum.  Carried from [r9]. |
| 7.3 Bruhat | SL₂ over 𝔽₂ | flag cells cardinal 1 and 2; total 3 | Retain small field.  Carried from [r9]. |
| 7C ordered roots | U₃ parameters a=2,b=3,c=1 | (1,3)=c+ab=7; inverse recovers c=7−6=1 | Retain order correction; Lean numerical API is padding.  Carried from [r9]. |
| 7C left complement | A₂, w=s₁ | inversion root α₁ belongs to left factor; α₂ lies in overlap if substituted | Retain correct root side; remove Check theorem from Lean.  Carried from [r9]. |
| 7C rank-one representative | n=[[0,1],[−1,0]] | n²=−I, becoming I in characteristic 2 | Retain torus square, not Weyl square upstairs.  Carried from [r9]. |
| 7C Gauss denominator | a=b=1 over ℚ | 1+ab=2, inverse parameter 1/2 | Retain invertibility premise; a=1,b=−1 gives denominator 0 outside chart.  Carried from [r9]. |
| 7a Lang map | Gₐ over 𝔽₄, a²+a+1=0 | a²−a=1; identity image 0 | Retain surjectivity over algebraic closure.  Carried from [r9]. |
| 7a connectedness | Constant C₂ with identity Frobenius | Lang image {1}, misses other element | Retain connectedness premise.  Carried from [r9]. |
| 7b equal parabolics | P=Q=B in GL₂ | intersection dimension 3; deleting U∩V leaves dimension 2 | Retain missing-factor control.  Carried from [r9]. |
| 7b opposite Borels | B⁺,B⁻ in GL₂ | intersection T dimension 2; unipotent factors dimensions 0,0,0 | Retain.  Carried from [r9]. |
| 7b transported tori | T and uTu⁻¹, u=I+E₁₂ | common torus only scalar, dimension 1<2; intersection formula predicts 1 versus actual 2 | Retain common-maximal-torus premise.  Carried from [r9]. |
| 7b GL₃ nested parabolics | Line e₁, plane e₁,e₂ | intersection B dimension 6; T dimension 3 plus three root dimensions 1+1+1 | Retain.  Carried from [r9]. |
| 7b double cosets | ⟨(23)⟩\S₃/⟨(12)⟩ | sizes 4 and 2, total 6; two incidence classes | Retain.  Carried from [r9]. |
| 7c fixed-point cardinality | GL₂(𝔽₂), B=U | orders B=2, T=1, U=2; 2=1·2 | Retain.  Carried from [r9]. |
| 7c induction | Ind(C₂→S₃)1 | dimension 3; trace at transposition 1, at 3-cycle 0 | Retain permutation adapter.  Carried from [r9]. |
| 7c averaging | U=C₂ | e=(1+g)/2 gives e²=e; denominator unavailable in characteristic 2 | Retain invertibility hypothesis.  Carried from [r9]. |
| 7c zero coefficients | Zero coefficient ring | tensor/induction modules 0; identity on zero module equals zero | Retain zero ring without freeness inference.  Carried from [r9]. |
| 7d transport | A₃ in S₃, transposition conjugation | generator (123)↦(132); χ value ζ↦ζ⁻¹ | Retain conjugated character.  Carried from [r9]. |
| 7d GL₃ block transport | diagonal (2,3,5), permutation swaps first two | first transported coordinate 3, not 2 or 5 | Retain specified transporter.  Carried from [r9]. |
| 7e corner inverse | Two eigenspaces with scalars 1,1/4 | inverse scalars 1,4; products 1,1 | Retain actual inverse, not identity.  Carried from [r9]. |
| 7e composition normalization | Product of transitions | intermediate scalar −1/2 differs from candidate 1/4 | Retain required comparison equations; not unnormalized equality.  Carried from [r9]. |
| 7f fixed-coset identity | S₃,H=C₂; g=1, transposition,3-cycle | fixed counts 3,1,0 times 2 = 6,2,0 conjugation counts | Retain; generic theorem belongs to InductionRestriction.  Carried from [r9]. |
| 7f equal characters/nonconjugacy | GL₃(𝔽₂), line and plane stabilizers | both index 7, permutation ranks 7; stabilizers different conjugacy types | Retain Gassmann versus conjugacy distinction.  Carried from [r9]. |
| 7g Steinberg fixed torus | Gₘ, σ(t)=t⁻³ | fixed equation t⁴=1, order 4; 𝔽₉-points order 8 | Retain σ-fixed, not σ²-fixed.  Carried from [r9]. |
| 7g identity endomorphism | Positive-dimensional Gₘ | fixed locus Gₘ infinite, not a finite group | Retain Steinberg hypothesis.  Carried from [r9]. |
| 8.1 root-free classification | Gₘ and trivial group | roots empty in both; cocharacter ranks 1 and 0 | Retain central torus data.  Carried from [r9]. |
| 8.1 pinning change | diag(2,1) conjugates SL₂ root map | I+aE₁₂↦I+2aE₁₂ | Retain marked versus unmarked isomorphism.  Carried from [r9]. |
| 8.2 nonreduced base | GL₂ over ℤ/4 | center rank dimension 1, derived dimension 3, relative flag dimension 1 | Retain arbitrary base.  Carried from [r9]. |
| 8.2 empty base | Empty S | one scheme/group over S for every proposed root label | Retain nonempty-base hypothesis in classification.  Carried from [r9]. |
| 8.2 split root line | Nontrivial invertible line bundle on S | locally rank 1, no global generator; pinning would supply one | Retain split/pinning hypotheses.  Carried from [r9]. |
| 8.3 trivial extension | K=k | nilradical 0; kernel 1; Weil restriction Gₘ | Retain.  Carried from [r9]. |
| 8.3 purely inseparable degree 2 | k=𝔽₂(t), K=k(√t) | geometric units c(1+aε); kernel dimension 1; product parameter a+b | Retain.  Carried from [r9]. |
| 8.3 purely inseparable degree 3 | k=𝔽₃(t), K=k(t^(1/3)) | (1+aε+bε²)(1+cε+dε²): coefficients a+c,b+d+ac | Retain dimension 2, both filtration layers.  Carried from [r9]. |
| 9A signed roots | A₁ lattice | norm 2 vectors ±α, two root lines; rank-zero lattice has none | Retain.  Carried from [r9]. |
| 9A sign convention | A₂, ordered simple roots | ε(α₁,α₂)=1, ε(α₂,α₁)=−1; commutator −1 | Retain central cover sign.  Carried from [r9]. |
| 9A opposite root normalization | A₂, α=α₁+α₂ | ε(α,−α)=−1 before normalization; normalized [Eα,Fα]=Hα | Retain normalization, not arbitrary unit scaling.  Carried from [r9]. |
| 9A Jacobi | sl₃, E₁₂,E₂₃,E₃₁ | nested brackets yield H₁₂,H₂₃,−H₁₃; sum 0 | Retain.  Carried from [r9]. |
| 9A central cover | Q₈→C₂² | i²=j²=−1; ij=−ji | Retain sign kernel, not split abelian cover.  Carried from [r9]. |
| 9A lift kernel headline | χ on C₂² with χ(i)=−1,χ(j)=1 | lift i↦−i,j↦j,ij↦−ij; product preserved | Retain prescribed twist formula.  Carried from [r9]. |
| 9A lift kernel rank zero | Q=1 | Hom(Q,±1) has cardinal 1; projection kernel cardinal 1 | Retain.  Carried from [r9]. |
| 9A based factorization | A₁ and A₂ | orders 2=2·1 and 12=6·2; diagram involution swaps s₁,s₂ | Retain precise named contract; registry issue settled.  Carried from [r9]. |
| 9A signed cycle | Three-cycle with signs whose product is +1 | fixed coefficient vector determined by one scalar, rank 1 | Retain cycle product.  Carried from [r9]. |
| 9A negative cycle | One basis vector sent to its negative | fixed rank 0 over ℚ and ℤ; dimension 1 over 𝔽₂ | Retain characteristic-2 extra kernel.  Carried from [r9]. |
| 9A folding A₂ | E=e₁+e₂,F=f₁+f₂,H=h₁+h₂ | [E,F]=H, [H,E]=E; normalized frame E,2F,2H has index 4 | Retain integral lattice versus normalized lattice.  Carried from [r9]. |
| 9A folding A₂ mod 2 | Pinned diagram action | characteristic-zero fixed dimension 3; mod-2 dimension 5 from two negative root cycles | Retain bad-prime comparison.  Carried from [r9]. |
| 9A A₃ folding | sl₄ outer involution | fixed dimension 10, C₂ Cartan [[2,−2],[−1,2]] in stated ordering | Retain long/short distinction.  Carried from [r9]. |
| 9A D₄ triality | Order-3 pinning action | root orbit contribution 6+6=12; toral rank 2; total 14 | Retain G₂ count.  Carried from [r9]. |
| 9A E₆ folding | Order-2 pinning action | root contribution 24+24=48; toral rank 4; total 52 | Retain F₄ count.  Carried from [r9]. |
| 9A toral Smith kernel | Y=ℤ², order-3 matrix [[0,−1],[1,−1]] | A−I has determinant 3, Smith 1,3; mod-3 kernel spans (1,−1) | Retain full Y, not only root lattice.  Carried from [r9]. |
| 9A PBW headline, rank zero | No roots and Y=0 | only exponent tuple; monomial 1; integral form ℤ | Retain.  Carried from [r9]. |
| 9A PBW headline, central torus | No roots, Y=ℤ | binom(H,2)(−1)=1; integer-valued polynomial, not necessarily ℤ[H] | Retain full toral binomials.  Carried from [r9]. |
| 9A PBW rank one | sl₂ over ℚ | EF−FE=H; E^(1)E^(1)=2E^(2) | Retain straightening constants.  Carried from [r9]. |
| 9A divided powers mod 2 | Integral form tensored with 𝔽₂ | E^(1)²=0 while E^(2) remains a basis vector | Retain base change before division.  Carried from [r9]. |
| 9B Chevalley input negative model | A₁, supplied e=0, h=H | [h,e]=0=2e; weights span ℤ; group dimension 1 versus required 3 | R03: normalized-frame identification needed.  Carried from [r9]. |
| 9B good frame control | e₊=E₁₂,e₋=E₂₁ | [e₊,e₋]=H≠0; root subgroup nonidentity at parameter 1 | Retain intended construction.  Carried from [r9]. |
| 9B torus-root equation | SL₂, s=diag(2,1/2), x=I+E₁₂ | sx s⁻¹=I+4E₁₂ | Native theorem; companion specialization is padding.  Carried from [r9]. |
| 9B group scheme versus point generation | Gₘ over ℤ | coordinate ring includes t⁻¹; monoid closure using t alone gives affine line | Retain Laurent/unit condition.  Carried from [r9]. |
| 9B central isogeny rational points | PGL₂(ℚ), class diag(2,1) | determinant square class 2≠1; no SL₂(ℚ) lift | Retain fppf rather than rational surjectivity.  Carried from [r9]. |
| 9C jets and convolution | Gₘ, order n and weight m=3 | jet rank n+1; H² value 9=3+2·3 | Retain binomial distributions.  Carried from [r9]. |
| 9C additive divided powers | Gₐ over ℤ | γ₁²=2γ₂, both evaluate x² as 2 | Retain integral basis.  Carried from [r9]. |
| 9C higher Frobenius kernel | Gₐ, p=2,r=2 | basis γ₀,…,γ₃, dimension 4=2²; unit γ₀ | Retain finite subalgebra distinction.  Carried from [r9]. |
| 9C isogeny on toral distributions | SL₂→PGL₂, H↦2H′ | binom(H,2)↦4binom(H′,2)+H′; at H′=1 both sides 1 | Retain, including characteristic 2.  Carried from [r9]. |
| 9C idempotent | p=2, μ₀=H−1, weights 1,2,3 | eigenvalues 0,1,0; squares equal same values | Retain projection onto divisible weights.  Carried from [r9]. |
| 9C contraction tensor control | p=3, weights 1 and 2 | separate contractions 0,0; tensor weight 3 contracts to weight 1 | Retain nonmonoidal functor.  Carried from [r9]. |
| 9C rationalDistributionAction_apply | Any rational module, distribution d and v | both expressions definitionally the same function application | R05: fresh rfl closes; delete from Lean.  Carried from [r9]. |
| 10A rational torus lattice | Weights 1 and q over 𝔽_q | same functions on 𝔽_qˣ; distinct Laurent monomials t and t^q | Retain all algebra points.  Carried from [r9]. |
| 10A distribution-only control | p-adic weight −1/3 at p=2 | repeating 2-adic digits, not an integer algebraic character | Retain integrability/actual torus action.  Carried from [r9]. |
| 10B contravariant form | SL₂ highest weight 2 | integral Gram diagonal 1,2,1; rank 3 over ℚ, rank 2 over 𝔽₂ | Retain lattice/form, not dimension alone.  Carried from [r9]. |
| 10B dual convention | Standard GL₃ module | ordinary dual highest weight (0,0,−1), not (1,0,0) | Retain distinction from contravariant dual.  Carried from [r9]. |
| 10B zero weight | Trivial highest-weight module | dimension 1, form value 1, radical 0 | Retain.  Carried from [r9]. |
| 10C binary forms | Degree 2, p=2 | squares span dimension 2; xy and translates generate dimension 3 | Retain highest-line versus arbitrary-vector distinction.  Carried from [r9]. |
| 10C higher binary forms | Degree 4, p=3 | simple socle dimension 2·2=4, ambient Sym⁴ dimension 5 | Retain characteristic-p filtration.  Carried from [r9]. |
| 10D matrix coefficients | SL₂ coordinate a | Δa=a⊗a+b⊗c; at [[1,1],[0,1]],[[1,0],[1,1]] value 2=1+1 | Retain coalgebra matrix order.  Carried from [r9]. |
| 10D torus Peter–Weyl | Character λ and left/right scalars a,b | coefficient transforms by a^(−λ)b^λ | Retain dual on left.  Carried from [r9]. |
| 10D polynomial monoid extension | GL₁ weights −1,0,1 | t⁻¹ undefined at 0; 1 and t extend | Retain actual polynomiality criterion.  Carried from [r9]. |
| 10D rank-zero group | Trivial group | coordinate ring k, one trivial coefficient summand | Retain.  Carried from [r9]. |
| 11.0 cotangent comparison | Gₐ at 0 | [t]↦[t], [t²]=0 on both sides | Retain local algebra map.  Carried from [r9]. |
| 11.0 nonalgebraic germ | v=1, f=exp(t) | derivative at 0 equals 1; derivative of t² equals 0 | Retain full holomorphic-germ inverse.  Carried from [r9]. |
| 11.0 coordinate change | u=2t, f=exp(u/2) | tangent coefficient 2 times derivative 1/2 gives 1 | Retain canonical comparison, reject rescaling.  Carried from [r9]. |
| 11.0 inverse derivative | Gₘ at 1, D(t)=1 | D(t⁻¹)=−1 | Retain quotient-rule sign.  Carried from [r9]. |
| 11.0 bracket comparison | SL₂ E₁₂,E₂₁ | left-invariant bracket H; right-invariant choice gives −H | Retain left convention.  Carried from [r9]. |
| 11A configurations | n=0 and n=1 | configuration spaces point and ℂ; both fundamental groups trivial | Retain boundary cases in README.  Carried from [r9]. |
| 11A centering | n=2, tuple (1,3) | centroid 2, centered (−1,1), inverse (1,3) | Retain specified map; R02 forbids admitting it as data.  Carried from [r9]. |
| 11A zero denominator | n=0 | centroid totalized to 0; configuration space point, not ℂ×point | Retain n>0 premise for homeomorphism.  Carried from [r9]. |
| 11A plane/disc map | z=0 and z with norm √3 | image norms 0 and √3/2; inverse restores 0 and √3 | Retain denominator positivity on disc.  Carried from [r9]. |
| 11A permutation action | σ then τ on tuple z | index becomes τ⁻¹σ⁻¹i=(στ)⁻¹i | Retain inverse indexing.  Carried from [r9]. |
| 11A Hurwitz inverse | Apply mirror to (aba⁻¹,a) | (a,a⁻¹(aba⁻¹)a)=(a,b) | Retain.  Carried from [r9]. |
| 11A Hurwitz square | Apply rule twice | first aba b⁻¹a⁻¹=(ab)a(ab)⁻¹; second aba⁻¹=(ab)b(ab)⁻¹ | Retain noninvolution.  Carried from [r9]. |
| 11A nonsplitting headline | n=2, B₂=ℤ→C₂ | section generator would have 2m=0 and m odd; m=0 contradicts oddness | Retain.  Carried from [r9]. |
| 11A nonsplitting for all n≥2 | A transposition under putative section | exponent sum twice m=0, but permutation parity requires m odd | Retain general headline.  Carried from [r9]. |
| 11B arrangement rank zero | Empty roots | vector space factor contractible, W=1, Artin group=1 | Retain.  Carried from [r9]. |
| 11B rank one | A₁, z↦z² on ℂˣ | covering degree 2; π₁ map m↦2m; quotient parity mod 2 | Retain.  Carried from [r9]. |
| 11B product roots | A₁×A₁ | cover degree 4; π₁ map (m,n)↦(2m,2n) | Retain product convention.  Carried from [r9]. |
| 11B rank-two braid lengths | A₂,B₂,G₂ | alternating lengths 3,4,6 | Retain root-dependent relations.  Carried from [r9]. |
| 11C regular semisimple | GL₂ diag(1,2) and nonzero nilpotent | (trace,det,disc)=(3,2,1) versus (0,0,0) | Retain semisimple locus, not merely regular locus.  Carried from [r9]. |
| 11C regular centralizer | Nonzero nilpotent in gl₂ | centralizer matrices [[a,b],[0,a]], units a≠0; Gₘ×Gₐ, dimension 2 | Retain warning about regular versus regular semisimple.  Carried from [r9]. |
| 11D cameral differential | SL₂, t=diag(1,−1) | coefficients −2,2,1; determinant −4≠0 | Retain local isomorphism; R01 needs no FCO premise.  Carried from [r9]. |
| 11D Weyl representative | SL₂ n=[[0,1],[−1,0]] | n²=−I in T, hence square 1 on G/T | Retain quotient rather than chosen lift action.  Carried from [r9]. |
| 11D flag simple connectedness | PGL₂ | π₁(G)=ℤ/2 but π₁(G/T)=0 | Retain quotient theorem, not simply connected G premise.  Carried from [r9]. |
| 11E eigenprojectors | A=diag(1,2) | (A−2I)/(1−2)=diag(1,0); (A−I)/(2−1)=diag(0,1) | Retain noncollision denominator.  Carried from [r9]. |
| 11E repeated spectrum | A=I₂ | eigenvalue difference 0; chart excluded | Retain simple-spectrum domain.  Carried from [r9]. |
| 11F root local system | A₁ reflection | α↦−α, α∨↦−α∨; pairing stays 2 | Retain both transported factors.  Carried from [r9]. |
| 11F wrong one-sided transport | A₁, flip root only | pairing becomes −2 instead of 2 | Retain dual transport equation.  Carried from [r9]. |
| 11 central torus | Gₘ with no roots | tangent ℂ, W=1, spectral base contractible and π₁=1 | Retain central factor.  Carried from [r9]. |
| 7b conjugate unipotence, README:1894–1897 | M(s), s=0,1 over ℚ and s=1 over 𝔽₂ | M(0)=I; M(1)=[[2,−1],[1,0]]; in 𝔽₂ it is [[0,1],[1,0]]. (M−I)²=0 and det(M)=1 in all cases. | Fresh: every M is unipotent. Previous R03 repaired. |
| 7b fixed-subgroup membership | Same M(s) | Lower-left entry s; membership in T or U⁺ forces s=0 and M=I. At s=1 both memberships fail. | Fresh: upper-unitriangular wording preserves the intersection dimensions 1,0,0,0 versus actual dimension 2. |
| 9C distribution Frobenius | p=2, k=0,1,2,3; p=3, k=3,4 | p=2 images γ₀,0,γ₁,0; p=3 images γ₁,0. Evaluation on xⁿ gives δₖ,ₚₙ on both sides. | Fresh: Frobenius formula unchanged and repair agrees. |
| 9C two different kernels | αₚ, p=2,3 | Dist(α₂)=span(γ₀,γ₁), dimension 2; map kernel has basis γ₁,γ₃,…, infinite. Dist(α₃) has dimension 3; γ₄ is outside it but maps to 0. | Fresh: γ₀ maps to γ₀≠0 for either prime. Previous R01 repaired. |
| 9C augmentation-generated ideal | k=pm+r, 0<r<p; p=2,3,5 and m=0,1,2,3 | binom(pm+r,r) mod p=1 in every case. Thus γᵣγₚₘ=γₖ; every generator maps to 0. | Fresh: both ideal/span inclusions; coefficient identity proved above. |
| 11A Hurwitz versus swap | a=(12), b=(23), right-to-left S₃ composition | ab=(123); ba=(132); aba⁻¹=(13); (13)(12)=(123). | Fresh: swap changes product; Hurwitz preserves it. Previous R02 repaired. |
| 11A inverse and square, dependent Check | Free generators a,b; S₃ quotient above | Mirror after Hurwitz returns (a,b); square gives ((ab)a(ab)⁻¹,(ab)b(ab)⁻¹), namely ((23),(13)) in S₃. | Fresh: square moves a=(12) to (23), excluding an involution. |
| Docstring §6A versus native dynamic Levi | GL₂ over ℚ with λ(t)=diag(t,1) | Native dynamic Levi=T has dimension 2; R_u(GL₂)=1 and a complement is GL₂, dimension 4. | Fresh: added missing-construction distinction is substantive. |
| Docstring §§7c–7e module endpoints | GL₂(𝔽₂)=S₃, B=U=C₂, T=1, coefficients ℚ | Induced trivial T-module has dimension [S₃:C₂]=3; averaging e=(1+u)/2 satisfies e²=e. | Fresh: native finite-group operations need the specified fixed-point groups and functor comparison. |
| Docstring §7g Steinberg extension | Gₘ over an algebraic closure of 𝔽₃ with σ(t)=t⁻³ | Fixed equation t⁴=1 gives 4 points; σ² is t↦t⁹ with 8 fixed points. | Fresh: actual σ-fixed carrier cannot be replaced by the power-Frobenius carrier. |
| Docstring §9C contraction endpoint | T=Gₘ, p=3, weights 1,2,3 | μ₀ acts by binom(λ−1,2): 0,0,1; weight 3 contracts to weight 1. | Fresh: constructed rational module matters; bare vector-space or Lie-weight data do not identify it. |
| Docstring §10 Weyl/simple/Steinberg endpoints | SL₂, p=2, Sym² standard module and Steinberg highest weight 1 | Sym² has dimension 3; square submodule span(x²,y²) has dimension 2; the weight-1 Steinberg module has dimension 2. | Fresh: rational highest-weight constructions distinguish these modules. |

The table contains **166 carried rows and 12 fresh rows**, 178 total. It covers the unchanged seeded targets and main headlines, the changed Checks, the docstring additions and the mathematical witnesses for the remaining findings.

## Not verifiable

No newly introduced citation remains unreadable: the initial title-only Jantzen fetch failed, but fetching the institution's PDF through the source service succeeded. Its temporary missing-reference entry was cleared. This review has not recertified the unchanged source corpus or rerun the unchanged companion elaboration and all-theorem padding probes; those are explicitly attributed to [r9].

The previous report's source-verification limits remain: Brieskorn (primary braid presentation); Humphreys (integral PBW); Waterhouse; Conrad–Gabber–Prasad; Howlett–Lehrer and Dipper–Du (integral common-Levi comparison); Carter; Lang; Steinberg; Serre's finite-group representations; Gassmann; Borel; Springer; and SGA3. The earlier source-service searches found no readable legal copy, or only publisher/paywall landing pages, with arXiv/Crossref rate limits in several cases. These works were not newly fetched in this incremental review. In particular the full integral Harish–Chandra, integral PBW and primary Brieskorn proofs remain uncertified; the small examples do not certify them.

Ownership against open pull requests without supplied files remains unchecked. No claim is made that a successful sorry build proves the mathematics, or that an admitted map was evaluated. None of these limits delays the verdict: R01–R03 are concrete remaining blockers.

## Source issues

- none

No new source mistake was found at the Jantzen locator checked this round. The six unchanged Milne errata recorded in [r9] remain part of that report; this line does not retract them or claim a fresh audit of them.

[r9]: packages/ReductiveGroups/reports/PRREVIEW-ReductiveGroups~9.md
