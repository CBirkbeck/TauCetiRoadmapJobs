# Review of GanGrossPrasadUnitaryGroups (pull request #1404 at 18b51e5)

**Verdict:** needs changes

:robot: Incremental AI review of 0 changed lines since 4241641. The previous finding is repaired. The merge from main changed the library pins and Lean toolchain, causing the two P3 issues below. No mathematical change or blocking finding remains in this review's scope. The PR worktree was not edited.

## R01 (P3) — Update the recorded library revisions after merging main

**Location:** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/README.md:46`: “The library pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.”

**Claim:** these revisions identify the libraries against which the supplier contracts and acceptance file are checked.

**Witness:** `lake-manifest.json:10` pins Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`; line 22 pins Mathlib to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`. Both checked-out package HEADs agree with the manifest, not README line 46.

**Repair:** replace the two old hashes with these manifest revisions, or refer directly to `lake-manifest.json` instead of duplicating them. I compared both old and new manifests and the installed package HEADs; the replacement matches this head. This is newly incorrect because of the merge, rather than a reopened defect in unchanged mathematics.

## R02 (P3) — Adopt the module header required to eliminate the new build warning

**Location:** `TauCetiRoadmap/GanGrossPrasadUnitaryGroups/Suggested.lean:1`: `import Mathlib`.

**Claim:** validation permits only `sorry` warnings; this file has no admitted declarations and should build without warnings.

**Witness:** the targeted Lake build succeeds but warns that the file imports Mathlib “which is designed for use with the module system; consider adding `module` to the start of this file.” The warning appears for both module and IR artifacts.

**Repair:** add `module` before the existing single `import Mathlib`, leaving the docstring and namespace intact. A scratch copy with exactly that addition elaborates successfully with no diagnostics. The toolchain changed from v4.35.0-rc3 to v4.36.0-rc2 in this merge. This is warning hygiene, not a failed build.

## Previous findings

- R01 — repaired: the board plan now has exactly the README's 34 gap slugs; the three retired slugs are absent, real-plancherel-decomposition is present, and the five relabelled supplier contracts agree.

## Verified sound

**Scope and previous repair.** The two reviewed files are byte-for-byte unchanged from 4241641. The PR's merge-base diff contains only this roadmap's README, Suggested.lean and metadata.toml; the outside-folder diff is empty. The many paths in the incremental change list came from merging main, not additional PR-owned edits. The package registry now contains 34 distinct slugs, the README contains 34, and both set differences are empty. In `packages/GanGrossPrasadUnitaryGroups/design/plan.json`, checked the repaired entries at lines 2307 (hermitian-unitary), 2461 (enhanced-packets), 2479 (ordinary-endoscopy), 2543 (global-parameters), 2667 (spectral-isolation) and 2735 (real-plancherel-decomposition). Their suppliers and section contracts match the README, as do the six revised needs sentences after whitespace normalization. All 34 supplier names and section labels were compared. No retired distribution-gk, local-fourier-extension or local-schwartz-germs entry remains. The declared contracts remain obligations on their named suppliers; this review does not claim they have been implemented.

**Gate and elaboration.** The worker's gate on 18b51e5 has every counter zero, including `build=0`. My independent text/dependency gate also exits 0 with every reported counter zero and `OK`. The separately run targeted build `lake build TauCetiRoadmap.GanGrossPrasadUnitaryGroups.Suggested` succeeds; its non-sorry warning is R02. Direct `lake env lean` elaboration of the original file exits 0 without diagnostics, as does the module-header scratch copy. No other Lean job remains running.

The independently run dependency check outputs:

```text
depcheck: 227 roadmaps, 2109 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. The 59-line acceptance file has one Mathlib import, its module docstring and an empty namespace: zero declarations, zero sorry'd data, zero overrides and zero padding candidates. Consequently the requested per-declaration `#check @name` and one-tactic probes each have zero subjects.

**Headlines and current pins.** README line 201 and the Lean docstring still agree on distribution symmetry (§2.2), multiplicity one/reductions (§§2.3–2.6), integrability (§2.7), epsilon characters (§§3.1–3.2), regularized forms/geometric multiplicity/relative trace (§§3.3–3.5), Fourier identity and nonsplit local GGP (§§3.6–3.9), split generic nonvanishing (§3.11), global periods/base change (§§4.1–4.3), local evaluations (§§5.1a–5.3), global relative-character comparisons (§§6.1–6.5), adjacent global nonvanishing (§§7.1–7.2) and GGP.8 (§7.4). Section 3.10 is conjectural; §4.4's general-codimension formal proof belongs to Part II. The docstring names the missing actual representation, parameter, period and L-factor carriers for these headlines. Searches at the new pins still find no smooth admissible/Casselman–Wallach unitary representation and Bessel-model development making these headlines statable with a few simple definitions.

One material library update is accounted for: the previous report's claim that Tau Ceti has no completed projective tensor no longer applies. The new pin has `TauCeti.CompletedProjectiveTensorProduct`, `TauCeti/Analysis/Normed/Module/PiTensorProduct/Projective/Completion.lean:54`, and its `liftEquiv`, `TauCeti/Analysis/Normed/Module/PiTensorProduct/UniversalProperty.lean:122`. I opened both: they use seminorm families, `WithSeminorms`, and a complete separated target with compatible additive uniformity, rather than requiring a norm on every factor. The cited NoncommutativeGeometry N1.Tensor now explicitly consumes this pinned construction (`TauCetiRoadmap/NoncommutativeGeometry/README.md:481`). This does not supply the missing representation categories or make a GGP headline statable.

**Pinned declarations reopened.** At Mathlib `1b1ccf4b…`, the following 25 named declarations were located and their defining statements read; paths below are relative to the library repository:

| File | Declarations and lines |
|---|---|
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean` | `LinearMap.Nondegenerate` 547: both separation conditions; `flip_nondegenerate` 608 |
| `Mathlib/LinearAlgebra/SesquilinearForm/Orthogonal.lean` | `Submodule.orthogonalBilin` 48 and `mem_orthogonalBilin` 54: vanishing in the second slot against every member of the first submodule |
| `Mathlib/RepresentationTheory/Intertwining.lean` | `Representation.IntertwiningMap` 36, `ext` 53, `isIntertwining` 87: algebraic equivariance, no continuity/admissibility |
| `Mathlib/RepresentationTheory/Basic.lean` | `Representation.tprod` 618, `tprod_apply` 626, `dual` 670: dual action uses the inverse |
| `Mathlib/LinearAlgebra/UnitaryGroup.lean` | `Matrix.unitaryGroup` 105: identity-Gram unitary matrices |
| `Mathlib/Algebra/Group/Prod.lean` | `Prod.isUnit_iff` 648 |
| `Mathlib/Algebra/GroupWithZero/Units/Basic.lean` | `isUnit_iff_ne_zero` 266 |
| `Mathlib/SetTheory/Cardinal/Finite.lean` | `Nat.card_sum` 221 and `Nat.card_fun` 246 |
| `Mathlib/Algebra/BigOperators/Pi.lean` | `pi_eq_sum_univ'` 73 |
| `Mathlib/Algebra/Algebra/Bilinear.lean` | `LinearMap.mul'` 43 |
| `Mathlib/LinearAlgebra/TensorProduct/Map.lean` | `TensorProduct.map_tmul` 62 |
| `Mathlib/Analysis/Complex/Circle.lean` | `Circle` 53, `Circle.coeHom` 97, `Real.fourierChar` 221 |
| `Mathlib/Algebra/Group/Hom/Basic.lean` | `invMonoidHom` 61 |
| `Mathlib/LinearAlgebra/Dimension/Finrank.lean` | `LinearEquiv.finrank_eq` 115 |
| `Mathlib/Analysis/Distribution/SchwartzSpace/Basic.lean` | `SchwartzMap` 75 |
| `Mathlib/Analysis/Fourier/FourierTransform.lean` | `VectorFourier.fourierIntegral` 81: character evaluated at the negative pairing |

At Tau Ceti `2fd255d9…`, `TauCeti.HopfAlgebra.pointsFunctor` is at `TauCeti/Algebra/AlgebraicGroup/PointsFunctor.lean:135`; its object is the convolution group of algebra maps and its morphisms are postcomposition. The two completed-tensor declarations above were also opened. The unchanged `map_sum` file-attribution remark in [r6] is carried forward without a finding.

**Supplier citations and ownership.** The current resolver reports zero unresolved cross-roadmap citations against main 8101f2c and the index of 438 open heads. Its library-name check was unavailable, so the pinned-source checks above were performed directly. I fetched and inspected all 14 named supplier READMEs through `roadmaps show`, and read every Needs line in the target. Current anchors include:

| Supplier README (repository-relative) | Sections resolved; representative current lines |
|---|---|
| `TauCetiRoadmap/ReductiveGroups/README.md` | Layers 0, 3, 5, 7 at 978, 1262, 1805, 2253 |
| `Completed/GlobalNumberFields/README.md` | Layers 4–6 and 8 at 418, 429, 439, 476 |
| `Completed/RestrictedProducts/README.md` | Layers 0–3 at 248, 268, 305, 361 |
| `TauCetiRoadmap/ReductiveGroupsPartII/README.md` | RG2.1.2–RG2.1.4 at 1507, 2080, 2137; RG2.3.1, RG2.3.4, RG2.3.5 at 3800, 4530, 4664 |
| `TauCetiRoadmap/GeometryOfNumbersAndQuadraticArithmetic/README.md` | §2.9 at 769; carrier/adjoints explicitly general over fields with involution despite the narrower classification heading |
| `TauCetiRoadmap/SmoothRepresentationsOfLocalGroups/README.md` | SR.0.4 869; SR.2.1–SR.2.3 1916, 2045, 2205; SR.3.1–SR.3.3 2571, 2710, 2875; SR.4.1–SR.4.2 3191, 3286; geometric-lemma 2175, principal-series-jacquet 2193, mirabolic-derivatives 3755, schwartz-submodule 3818 |
| `TauCetiRoadmap/NoncommutativeGeometry/README.md` | N1.Tensor 481, including the pinned tensor construction |
| `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` | §§0.1–0.5 89–185, §0.1a 114; §§2.3–2.7 390–487; §§3.4–3.5 581, 598; §4.2 644 |
| `TauCetiRoadmap/AutomorphicSpectralTheory/README.md` | §0.9 260; §§0.48–0.49 810, 827; §§2.1–2.2 1496, 1517; §§2.4, 2.14 1560, 1728; §§3.1–3.2 1885, 1906; §§6.3–6.6 2898–2969 |
| `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md` | §§3.12, 3.13, 3.16 at 1953, 1969, 2031 |
| `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/README.md` | §§2.1, 2.3, 2.6, 2.16 at 688, 747, 828, 1059; §§11.0d–11.0e 4349, 4365; §§11.2–11.4 4457, 4476, 4505 |
| `TauCetiRoadmap/MetaplecticAutomorphicForms/README.md` | §0.18 328; §3.2a 606; §§3.3, 3.3b, 3.4–3.6 at 618, 646, 669, 689, 707 |
| `TauCetiRoadmap/AdelicAlgebraicGroups/README.md` | §§0.1–0.3 644–730; §§1.1–1.5 1003–1444; §§2.2–2.5 1773–2258 |
| `TauCetiRoadmap/AutomorphicLFunctionsAndLocalFactors/README.md` | AL.R.1 595; AL.0.3.1 483; AL.3.1.2 1450; AL.3.2.1–AL.3.2.3 1489, 1521, 1531; AL.3.8.1 1816 |

The overlap data has zero conflicting heads, dropped cited identifiers or identifiers supplied only by open revisions. The renewed object search and neighboring scope reads preserve the ownership conclusions of [r6]: `TauCetiRoadmap/TwistedAutomorphicDescents/README.md:11` (#1758) imports this roadmap's unitary Bessel constructions; its orthogonal constructions are distinct. AutomorphicSpectralTheoryPartII (#1761) owns the Schwartz-multiplier continuation; AutomorphicLFunctionsAndLocalFactorsPartII (#1756) owns doubling integrals; ExceptionalThetaCorrespondencesForG2 (#1736) owns exceptional theta models. Their scope statements do not make a second owner of the unitary Bessel endpoints. ReductiveGroups and NoncommutativeGeometry on main were also read as the two roadmap-shape references.

**Source sample and limits of the incremental review.** All 15 seeded passages are unchanged: §§2.1, 2.3, 2.6, 2.7, 3.2a, 3.4, 3.6, 3.7, 3.8, 4.4, 5.5, 6.1, 6.4, 7.2 and 7.3. Their source checks are carried from [r6], not represented as a fresh full source review. The earlier rendered-page checks of Xue's equations (3.12)–(3.14) and BPCZ's completed normalizer remain applicable. There are no changed source locators requiring new retrieval. I reopened bpcz line 3792–3793 to confirm the inherited source-issue entry below; the xue-bessel waiver remains recorded in `packages/GanGrossPrasadUnitaryGroups/sources.toml:31`.

**Adversarial table.** The following 39 rows retain [r6]'s instances, values and results for untouched statements. Each explicitly cites that review; these are inherited evidence, not newly executed tests. Literal vertical bars have been escaped for table rendering.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 field-form comparison h(x,y)=k(y,x) | E=ℂ, k(x,y)=conj(x)y | h(i,1)=conj(1)·i=i; h(1,i)=conj(i)·1=−i; unswapped k(i,1)=−i | Check at line 223 correct; the swap is forced | Unchanged; carried from [r6]. |
| 1.1 split-form comparison | A=F, v=(1,0), w=(0,1) in A⊕A∨, k((x,l),(y,m))=(l(y),m(x)) | k(v,w)=(0·0,1·1)=(0,1); h(v,w)=k(w,v)=(1·1,0·0)=(1,0); k(v,v)=k(w,w)=(0,0); action (2,1/2): h((2,0),(0,1/2))=(1/2·2,0)=(1,0); scaling both by 2 gives (4,0) | Check at lines 239–240 correct; MetaplecticAutomorphicForms §3.2a pairing (ℓ(y),εk(x)) at ε=1 agrees | Unchanged; carried from [r6]. |
| 1.1 split-line frame | e=(e₁,e₂), h(e,e)=e·c(e) | h(e,e)=(e₁e₂,e₁e₂): (1,1)↦1, (1,0)↦0, (2,1)↦2, (2,1/2)↦1 | frame iff e₁e₂≠0; Checks at lines 276–278 correct | Unchanged; carried from [r6]. |
| 1.1 rank formula and Witt index | W=0, V=H⊕⟨1⟩, r=1; positive definite real 3-space | rank 0+2+1=3; maximal isotropic rank 1 (H has one, ⟨1⟩ none); definite form has no isotropic vector so no H summand; signatures (2,1),(1,2) contain H | Checks at lines 258–260 correct | Unchanged; carried from [r6]. |
| 2.1a null-cone homogeneity | V=F, B=xy: δ₀; split plane B=x₁y₂+x₂y₁: Haar on x₂=0 | F_B(δ₀)=constant, support F≠{0}; F_B(Haar on x₂=0)(y)=∫ψ(x₁y₂)dx₁=δ(y₂)·Haar, same line; dilation scales it by \|t\|=\|t\|^(2/2), δ_B=1 (hyperbolic plane, γ=1) | Checks at lines 426–427 correct; exponent dim V/2 as in ag-descent line 585 | Unchanged; carried from [r6]. |
| 2.1a Gelfand–Kazhdan degenerate cases | N=M; M=GL₂, N=1, τ=transpose | biinvariant = bi-translation-invariant = ℂ·Haar, inversion-invariant; Hom_M(π,ℂ)≠0 only for π trivial, product 1; for N=1 Hom_N(π,ℂ) is the infinite-dimensional dual | Checks at lines 428–429 correct | Unchanged; carried from [r6]. |
| 2.3 adjacent multiplicity one | U(0)⊂U(1), χ a character; GL₂(ℝ)⊃GL₁(ℝ) | Hom_1(χ⊗1,1)=ℂ, finrank 1; GL_n(ℝ) is in Sun–Zhu's list (sun-zhu line 46) | Checks at lines 467–471 correct | Unchanged; carried from [r6]. |
| 2.6 odd codimension, non-example | U(2) standard ↓ U(1) weight 1, bilinear pairing | weights of π⊗σ: 1+1, 0+1 = 2, 1; no weight 0 | multiplicity 0, so ≤1 is not =1 | Unchanged; carried from [r6]. |
| 3.1 epsilon character, central value | ℂ/ℝ, φ_V=χ₁⊕χ₋₁, φ_W=1, χ_j(z)=(z/\|z\|)^j | signs: j odd ⇒ sign −1 (xue-real line 65–67), dim V=2 needs (−1)^(2−1)=−1 ✓; product of generator values ε(χ₁)ε(χ₁∨)=χ₁(−1)=−1 (ggp line 601) | χ_W(z)=−1; Check at line 607 correct | Unchanged; carried from [r6]. |
| 3.1 non-example, even multiplicity | φ_V=χ₁⊕χ₁ | C_φ=O₂(ℂ), A_φ=ℤ/2, −Id∈SO₂ ⇒ z_φ=0; one copy at the generator: ε(χ₁,ψ_E)=−1 for one sign of ψ_E (scaling ψ_E by −1 multiplies by χ₁(−1)=−1); both copies: (−1)²=+1 | Check at line 609 correct | Unchanged; carried from [r6]. |
| 3.1 component groups | degree-one nonsplit; multiplicity 2; split GL₁; zero parameter | C_φ={±1}, A_φ=S♮ order 2, z_φ≠0, A_φ/⟨z_φ⟩ order 1; O₂: A_φ order 2, z_φ=0, quotient order 2; split: C_φ=S♮=ℂ×, component group 1; zero: all 1 | Checks at lines 601–603 correct; kmsw line 1074, 2619 | Unchanged; carried from [r6]. |
| 3.1 coordinate identity | Fin 2→ZMod 2, χ(x)=x(0)+x(1), d≡1 | z_d=(1,1), χ(z_d)=1+1=0; χ(e₀)=χ(e₁)=1; multiplicatively (−1)(−1)=+1 | Check at line 625 correct | Unchanged; carried from [r6]. |
| 3.3a p-adic definition excludes \|det g\|^(1/2)\|a−b\| | GL₂(F), x=1, Y with eigenvalues y₁,y₂ | D_G(e^Y)^(1/2)θ(e^Y)=\|y₁−y₂\|·\|y₁−y₂\|=O(\|Y\|²) (expansion (c) with zero coefficients); θ(e^(λY))=\|λ\|θ(e^Y) (degree +1) while ĵ(0,·), ĵ(O_reg,·) have degrees 0 and −1 under λ a square (dim O_reg=2) | no exact expansion on any neighbourhood; Check at line 721 correct | Unchanged; carried from [r6]. |
| 3.3a c_θ values | GL₂(F): trivial character; unramified principal series; Steinberg | D_G(1)=1, \|W\|=2; trivial: ½·lim D_G(t)^(1/2)=0; principal series D^(−1/2)(χ(t)+χ(wt)) gives ½·2=1; Steinberg = PS − trivial gives 1 | Checks at lines 723, 725, 729 correct; agrees with the Whittaker count (bp-arch line 4298–4301) | Unchanged; carried from [r6]. |
| 3.3a Howe finiteness | GL₁, L=O_F, ω=O_F, ω=ϖ⁻¹O_F, ω=F | O_X on C_c(F/L) depends on X+L; dimension ≤1, ≤q, infinite | Check at line 726 correct; compactness needed | Unchanged; carried from [r6]. |
| 3.3a (b) finite length | GL₁(ℝ), π=\|·\|^(s₁)⊕\|·\|^(s₂), X=x d/dx | Xθ_π=s₁\|x\|^(s₁)+s₂\|x\|^(s₂), not proportional to θ_π; each summand a quasi-character, D_G=1 | Check at line 727 correct | Unchanged; carried from [r6]. |
| 3.3a (d) θ_f elliptic | GL₂(F), x elliptic regular | M(x)=G, a_G−a_G=0, v_G=1; θ_f(x)=ν(G_x)⁻¹D^(−1/2)·D^(1/2)∫f(g⁻¹xg)dg=ν(G_x)⁻¹O_x(f) | Check at line 728 correct; bp-arch line 4468 | Unchanged; carried from [r6]. |
| 3.3a (d) D(π), θ̂_f sign | GL₂: discrete series; π=i_T^G(χ) | discrete series: D=1 (w=1, W(σ)_w=1); principal series: D(χ)=1, dπ carries \|W(G,T)\|⁻¹=½; θ̂_f(i_T^G χ)=(−1)^(1−2)J_T(χ,f)=−J_T(χ,f) | matches bp-arch line 2380, 2408, 2423, 4697 | Unchanged; carried from [r6]. |
| 3.4 Δ and empty regular set | W=ℂ, x=−1; compact U(2)×U(1), x=1 | \|N_(ℂ/ℝ)(1−(−1))\|=\|N(2)\|=4; u(2) has no regular nilpotent element, c_θ(1)=0 by the convention, G_1 compact hence not quasi-split (Proposition 4.5.1(i) gives 0) | Checks at lines 757, 761 and 724 consistent | Unchanged; carried from [r6]. |
| 3.6 Fourier identity | μ=−ε; μ=ε, (s,t)=(0,0); A=ℤ/2 values (1,−1) | (1+με)/2 = 0; = 1; the function s↦(1,−1) on ℤ/2 is the nontrivial character, Fourier inversion puts the mass at the nontrivial enhancement | bp-refined line 2888 reads m(φ,s;φ′,s′)=ε^G(s)ε^(G′)(s′)(1+ε(φ⊗φ′)μ(G))/2 | Unchanged; carried from [r6]. |
| 3.7 uniqueness in the packet union | φ′=0 (W=0) | ε^G(s)=ε(φ^(s=−1)⊗0)=1, the trivial character, which is the Whittaker-normalized generic member; E_G(φ) selects the form with μ=ε(φ⊗φ′) | Check at line 817 and the inner-form clause correct (bp-refined line 2224–2225, 2868–2875) | Unchanged; carried from [r6]. |
| 3.8 induction counts | (a,b)=(2,1) | almost-equal-rank lift adds one self-dual character: a′=a−1=1 for π′, b′=b=1 for σ′; second lift a₀=a−2=0 for π₀, σ₀ keeps b=1; sum 3→1; measure a+b−2 | Check at line 847 correct; xue-real line 268–293 | Unchanged; carried from [r6]. |
| 3.8 ψ_ℂ convention | ψ(x)=exp(−2πix), ψ_ℂ(z)=ψ(Tr(iz)) | Tr(iz)=i(z−z̄); ψ(i(z−z̄))=exp(2π(z−z̄)) | matches xue-real line 63–64 | Unchanged; carried from [r6]. |
| 3.8 theta parameter formulas | equal rank; rank n+1 with χ_V absent | rendered xue-real p. 1010: (3.12) θ(η)(a_i)=ε(φ_i⊗χ_V⁻¹, conj(ψ_ℂ))η(a_i); (3.13) θ(φ)=(φ⊗χ_V⁻¹χ_(V′))⊕χ_(V′); (3.14) θ(η)\|A_φ=η, θ(η)(a_(V′))=η(a₁)⋯η(a_r)(−1)^(n(n+1)/2−q), (p,q) the signature of −iV′ | README lines 163 and 829 state exactly these | Unchanged; carried from [r6]. |
| 3.8 non-example | V=⟨−1,−1⟩, W=⟨−1⟩, π standard, σ weight 1 | restricted tensor weights 2 and 1, no weight 0 ⇒ m=0; (a,b)=(2,1) with both tempered | Check at line 851 correct: no unconditional reduction | Unchanged; carried from [r6]. |
| 3.10 split prediction, non-examples | trivial representation of GL₂(ℝ); regular unitary principal series of GL₃(F) | λ(π(u)v)=ψ(u)λ(v) with π(u)v=v forces λ=0 when ψ(u)≠1; Jacquet module has 6 one-dimensional Weyl pieces (bernstein-zelevinsky line 334–338), Hom_N(π,1) of dimension 6, Whittaker dimension 1 | Checks at lines 905, 907 correct | Unchanged; carried from [r6]. |
| 5.1 normalizer, n=1 and split | Δ₂; split place | Δ₂=L_F(1,η)L_F(2,η²)=L_F(1,η)L_F(2,1); η_v=1 gives ζ_v(1)ζ_v(2), finite for q_v>1 | Checks at lines 1075, 1077 correct; rendered bpcz p. 4 puts L(s+1/2,σ,Ad) in the denominator | Unchanged; carried from [r6]. |
| 5.1a Whittaker identity scaling | B=b(ϑ⊗ϑ), dt=a dg; n=1 | left side ab·λ(W)conj(λ(W′)); N₁=1 so λ(W)=∫_(F×)W₂(diag(t,1))χ(t)dt | matches zhang-period line 1545 up to the stated positive scalars; Check at lines 1099–1101 correct | Unchanged; carried from [r6]. |
| 5.2 normalized form | U(1) mass a, inverse weights, B(1,1)=1; c≠0 | α(1,1)=a/C_v, q(1)=a/C_v; q(cx)=\|c\|²α/\|c\|²B=q(x) | Checks at lines 1127, 1131 correct | Unchanged; carried from [r6]. |
| 5.2 discontinuous form on the completed tensor | x∉A dense algebraic tensor, ℓ\|A=0, ℓ(x)=1 | β(u,v)=ℓ(u)conj(ℓ(v)) vanishes on pure-tensor pairs, β(x,x)=1 | Check at line 1135 correct: continuity needed for the density argument | Unchanged; carried from [r6]. |
| 5.3 dyadic split value | F=ℚ₂, π_V=Ind(1⊠ω) with ω(2)=−1, π_W=1, vol(ℤ₂×)=1 | Satake {1,−1}; L_F(1/2,π_V×1)=(1−2^(−1/2))⁻¹(1+2^(−1/2))⁻¹=2; L_E(1/2)=2·2=4 (ggp line 3184–3186); Δ₂=ζ(1)ζ(2)=2·4/3=8/3; L(1,Ad)=L(1,π_V×π_V∨)L(1,1×1)=(2·2·(2/3)·(2/3))·2=32/9; C=(8/3)·4/(32/9)=3; Macdonald: Φ(diag(2^k,1))=2^(−k/2)(1+(−1)^k)/2, raw integral 1+2Σ_(m≥1)2^(−m)=3; α=1 | Check at line 1159 correct | Unchanged; carried from [r6]. |
| 5.3 dyadic unramified value | E/ℚ₂ unramified, W=⟨1⟩, V=⟨1,1⟩, Satake t,t⁻¹ | Δ₂=L(1,η)L(2,1)=(2/3)(4/3)=8/9; L(1,As⁺)=(1−t/2)⁻¹(1−t⁻¹/2)⁻¹(1−1/4)⁻¹ and L(1,BC(1),As⁻)=L(1,η)=2/3, so L(1,σ,Ad)=(8/9)·(1−t/2)⁻¹(1−t⁻¹/2)⁻¹=(8/9)L_E(1/2,BC(π_V)); C=1; raw integral over compact U(1) of mass 1 is 1 | Check at line 1161 correct | Unchanged; carried from [r6]. |
| 6.1 Asai signs and β | n=1 | As_G: sign (−1)^(n+1)=+ on Π₁, (−1)^n=− on Π₂ | Check at line 1245 correct; bpcz line 4137 | Unchanged; carried from [r6]. |
| 6.1a Flicker–Rallis coefficients | one constituent per degree; two and one | 2^(−1)·2^(−1)=1/4=2^(−2); 2^(−2)·2^(−1)=1/8 | Checks at lines 1276, 1348–1350 consistent with §6.3 and the sign-group order 2^(#I+#J) (Nat.card_fun, Nat.card_sum) | Unchanged; carried from [r6]. |
| 6.2a polynomial-exponential part | 5+Te^T; 5+T | purely polynomial parts 5 and 5+T; the latter is not constant | Check at line 1332 correct | Unchanged; carried from [r6]. |
| 6.3a multiplier compatibility | μ′ acts by 3 and μ_h by 3; by 2 | 3κJ=3I persists; 2κJ=3I fails when I≠0; (iii): 2²·3²=36 on both sides, 1 at χ | Checks at lines 1388–1389 correct | Unchanged; carried from [r6]. |
| 7.1 nonvanishing | n=1 | bpcz Theorem 1.1.5.1 is stated for every n≥1 (line 124–134), BPLZZ's n>1 is the stable specialization §7.2 | Checks at lines 1460, 1484 correct | Unchanged; carried from [r6]. |
| 7.4 GGP.8 scaling | f↦cf; B_v↦2B_v; Haar 2 and 1/2 at two places; global H Haar ×2 | \|c\|² cancels; α_v/B_v unchanged; product of q_v unchanged; \|P\|² ×4 | Checks at lines 1532–1536 and 42 correct | Unchanged; carried from [r6]. |
| Conventions | ν(h)=i; counts (1,1),(2,1) | P(R(h)f)=∫f(xh)ν(x)⁻¹dx=ν(h)P(f); weighting by ν gives ν(h)⁻¹=−i; 2^(−2)=1/4, 2^(−3)=1/8 | Checks at lines 38, 41 correct | Unchanged; carried from [r6]. |

The following additional rows make the seeded-sample coverage explicit where [r6]'s table grouped the target with another calculation. Values were recomputed from the unchanged README; these are checks of the displayed conventions, not proofs of the analytic or global theorems.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| §2.1 model and pairing | Circle weights (1,−1), then (1,1); z=i; scalar pairing | i·(−i)=1 gives invariant multiplication and dimension 1; i·i=−1 forces ℓ=−ℓ, so dimension 0. B(i,1)=i and B(1,i)=−i | Dual and linear-first conventions distinguished | None |
| §2.7 integrability | Compact U(1) of mass a, inverse weights; split trivial representations | Integral of the unit coefficient is a; on F× its valuation annuli each have equal positive mass, giving an infinite sum | Compact example agrees; non-tempered counterexample diverges | None |
| §3.2a Fourier averaging | q=2, f(x)=min(1,abs(x)⁻¹), φ the unit indicator | Mass of units=1/2; RHS=1−(1/2)(1+1/2)=1/4; LHS=(1/2)T(f), hence T(f)=1/2. Absolute truncated integral=1+k/2→∞ | Oscillatory value and absolute divergence distinguished | None |
| §4.4 fixed-pair proposition | W=0; complement line ⟨2⟩; ν(h)=i | Tensor L-factor=1; (1/2)·2=1; source character=−i, and both period weights are −i. On a pair with local model 0, §4.2 gives period 0 even if another pair has a period | Fixed-pair and character distinctions retained | None |
| §5.5 all-place product | Exceptional factor 3, a good place of volume 2, other tail 1; then exceptional factor 0 | Before moving good place: 3·2=6; after: (3·2)·1=6. Zero case: 0·2=0 on both descriptions | Finite-set enlargement and zeros agree | None |
| §6.4 isolated comparison | Three constituents; scalar normalization test I=8 | 2⁻³I=1; replacing coefficient by 1/4 gives 2. A sum supported on one form still includes all its cuspidal realizations | Coefficient check agrees; values test normalization, not existence of prescribed spectral data | None |
| §7.2 stable specialization | One constituent in each degree, n=2 | r_total=1+1=2; component order 2²=4; pole signs in degrees 2,3 are −1,+1 and the regular opposite signs are +1,−1 | Stable count and Asai signs agree | None |
| §7.3 refined proposition | Constituent counts (1,1), (2,1); zero/nonzero vectors | Orders 4,8 give coefficients 1/4,1/8; a nonzero vector has positive Petersson norm, whereas zero gives numerator=denominator=0 and is excluded | No fixed 1/4 in endoscopic range; no zero denominator admitted | None |
| README §Exact supplier contracts, R01 | Revision pairs at old and new heads | Old README pair equals old manifest pair; at 18b51e5 both equality tests against manifest are false; replacing with current hashes makes both true | Newly stale provenance | Update recorded pins |
| Suggested.lean header, R02 | Original targeted build; scratch copy with module header | Original: exit 0 with two module-system warning emissions; scratch elaboration: exit 0 with zero diagnostics | Build succeeds; header repair elaborates | Add module header |

The declared-gap repair also has a finite check: README/plan slug counts are 34/34, intersection size 34, and both differences have size 0. The previously missing real Plancherel contract occurs once; each of the three retired slugs occurs zero times.

## Not verifiable

- xue-bessel remains waived: cite its recorded locator only. No new source request was made.
- No new mathematical passage required source verification in this zero-line incremental review; inherited source conclusions are attributed to [r6].

## Source issues

- **Misprint** in bpcz at (7.1.2.1), p. 71 (bpcz line 3792–3793): the source says inequality of the two constituents is equivalent to entireness of their Rankin–Selberg product; it should compare one constituent with the contragredient of the other; affects nothing (the README uses the contragredient condition).

[r6]: packages/GanGrossPrasadUnitaryGroups/reports/PRREVIEW-GanGrossPrasadUnitaryGroups~6.md
