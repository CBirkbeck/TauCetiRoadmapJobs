<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/12984#issuecomment-6791614667 -->
Review (codex) of 3c5cbc7

Verdict: needs_changes

1. **F01** (P2) Specify the ambient boundary in the admissibility test

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:395`, §3.3: “every holomorphic map from a disc sending the punctured disc into `S`”. The locality assertion at line 402 also needs this distinction.

   **Claim:** This defines admissibility on an algebraic smooth variety. The target of the disc map and the boundary along which admissibility is tested are missing. A map to S alone tests only interior points. The preceding curve definition explicitly uses a completion, but that condition has not been carried into the higher-dimensional definition.

   **Witness:** Kash86 §1.9, printed p. 994, Kash86 lines 103–107 tests maps to an ambient X with punctured image in X*. On A², the filtration `F⁰=O(e₀+x e₁)` passes interior tests but fails at infinity.

   Here is a complete instance. Take the constant rational local system with basis e₀,e₁ on S=A², trivial connection, `W_−2=ℚe₁`, `W_0=ℚ²`, `F⁰=O(e₀+x e₁)`, `F⁻¹=O²`, `F¹=0`. Each fibre is an extension of ℚ(0) by ℚ(1); both graded variations are constant and polarized. Transversality holds because `∇(e₀+x e₁)=e₁ dx` lies in F⁻¹. Every disc map into S extends this filtration across its centre; N=0 and relative M=W. Thus all such interior tests pass.

   In the compactification P¹×P¹, use the disc `x=1/s, y=0`. The canonical extension of the flat bundle is trivial, but the saturated extension of F⁰ is `O(s e₀+e₁)`. Its special fibre is ℂe₁. Consequently the induced F⁰ on gr⁽W⁾₀ has dimension 0 instead of 1, and that on gr⁽W⁾₋₂ has dimension 1 instead of 0. This fails the graded extension condition already required in §3.3. It also explains why §5.6 must retain algebraic admissibility: the example has constant underlying local system and nonconstant Hodge filtration.

   **Exact repair:** Define admissibility relative to a pair `(S̄,S)`, with S open in S̄, testing every holomorphic `Δ→S̄` whose punctured image lies in S. For the algebraic smooth quasi-projective S used for Hodge modules, choose a smooth proper SNC compactification, cite ResolutionOfSingularitiesCharacteristicZero §6.2, and state independence of this choice. If the definition is retained for more general S, specify the equivalent algebraic curve test including the completions of the curves. Say that locality is on the ambient pair; ordinary Zariski locality on S requires testing the boundary in each resulting algebraic curve test. Add the displayed A² example as a negative Check. The repaired test rejects it by the dimensions 0≠1 above and accepts the constant filtration `F⁰=Oe₀`, whose boundary graded dimensions are 1 and 0. Add the compactification input to Needs and the layer summary where that version of the definition is used.

2. **F02** (P1) Vanishing of the nilpotent operator is not necessary for the scalar variation formula

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:235`, §1.4: “`var_top = 2πi·var` only where `N_φ = 0`”; repeated at line 451, §4.2, as “`−2πi x` only where `N_φ = 0`”.

   **Claim:** Equality with the constant-term approximation forces Nφ=0. The polynomial formula preceding this assertion is correct, but composition with variation can kill its higher terms.

   **Witness:** For `j_!L[1]` with rank-two unipotent L, identify `can=I`, take `N=Nφ=B≠0`, `B²=0`, `var=B`. Then `var_top=B(2πiI+(2πi)²B/2)=2πiB`, although Nφ is nonzero.

   This is an actual perverse sheaf, not arbitrary quiver data. The zero stalk of j! makes can an isomorphism. Take rational monodromy `T=I+J`, where `Je₁=e₀`, `Je₀=0`; on complex realizations `B=J/(2πi)`. The Tate target accounts for this period factor. Both normalized composites are B, and `var_top can=J=T−I`. The regular Riemann–Hilbert correspondence of §1.5 realizes this example by a regular holonomic module, so it also tests §4.2. With the package's comparison `var=−x`, take `x=−B`; the asserted converse fails there as well.

   **Exact repair:** In both passages replace “only where” by “in particular when”. If an exact criterion is wanted, write `var_top=2πi var` iff `var∘Nφ=0`, or `x∘Nφ=0` in §4.2, on the underlying complex realizations. Indeed `g(u)−2πi=u h(u)` for `g(u)=(exp(2πiu)−1)/u`, and h has nonzero constant `(2πi)²/2`, hence h(Nφ) is invertible. Add the j! square-zero example as a Check beside the j* example. On this instance both sides are `2πiB`, and `var Nφ=B²=0`, while Nφ≠0. Keep the full polynomial normalization and the corrected signs; no semisimplicity restriction is needed.

3. **F03** (P3) Two negative Checks require an impossible rational Hodge structure

   **Location:** `packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:408`, §3.3, and line 521, §4.6: “`N(e₁) = e₀`, `W_0 = ℚe₀` and `W_1 = ℚ²` … although its graded pieces are pure”.

   **Claim:** This is a graded-polarizable rational variation excluded specifically by failure of relative monodromy. Its weight-one graded piece would be a one-dimensional rational pure Hodge structure, which does not exist.

   **Witness:** `dimℚ gr⁽W⁾₁=1`. Conjugate Hodge types of odd total weight occur in pairs, so their total dimension is even. Equivalently, a polarization on this line is alternating, hence zero and degenerate.

   LefschetzPencilsAndVanishingCycles §1.5, `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1220` at PR #873, uses the filtered-vector-space obstruction. That linear-algebra example does not assert a rational Hodge structure on the graded pieces. The nonexistence of a relative filtration is valid, but an incorrect definition omitting admissibility would already reject this purported variation for a different reason. Thus these are not discriminating Hodge-module Checks.

   **Exact repair:** Replace both Checks by a realizable rank-three variation. Let H=ℚa⊕ℚb be a polarized pure structure of weight −1 with `F⁰Hℂ=ℂ(a+i b)`. Set `V=H⊕ℚe`, `W_−1=H`, `W_0=V`, and let `J(e)=a`, `J|H=0`, `T=I+J`. On the universal cover, with `z=log(t)/(2πi)`, take `F⁰(z)=spanℂ(a+i b,e+z a)`, `F⁻¹=Vℂ`, `F¹=0`. The equation `F⁰(z+1)=T F⁰(z)` supplies descent, and transversality is immediate. Its graded variations are the constant polarized H and ℚ(0).

   The induced nilpotent operator on each gr⁽W⁾ is zero, so a relative monodromy filtration would have to equal W. But N sends M₀ nontrivially into ℂa whereas M₋₂=0. Thus the relative filtration does not exist, precisely the intended failure. Contrast the existing Kummer Check with weights −2 and 0: there `N W₀⊂W₋₂` and M=W works. The replacement has graded ranks 2 and 1, so the parity obstruction is gone. These remain README Checks, with no added Lean declarations.

Three findings: one P1, one P2 and one P3; two blocking. The acceptance test elaborates, its sole sorried theorem is not padding, and the dependency check reports no problems. The findings concern the README. No package input was changed by this review.

## Verified sound

### Previous findings, checked before the new pass

The repair report marked all three round-4 findings applied, with a different supplier for F03. None was marked not actionable. These are not re-raised settled findings. Quotations in this table are from the current package README.

| Previous finding | Repaired passage and computed test | Status |
|---|---|---|
| F01: normalized Euler/monodromy comparison | §4.2, line 451: “`N = (2πi)⁻¹ log T_u = −(x∂_x + α)`”; “`can` corresponds to `∂_x`”; variation “corresponds to `−x`”. For Ae₁=e₀, A²=0, horizontal transport gives T=I−2πiA, log T=−2πiA, and Ne₁=−e₀. Both composites give −e₀. | Core repair verified in Conventions and §§1.4,4.2,5.3. Overall partly repaired because the added necessary-condition assertion is false (R02). |
| F01 pattern: stationary phase | §11.5 states “`(φ_{t,1} FT M, N) ≅ (ψ_{1/τ,1} M, N)`”. For M=D/D(τ∂τ)², Fourier substitution sends τ∂τ to −(t∂t+1); both N have one nonzero size-two block. Multiplication of t by −1 preserves the positive loop. | Repaired. MT Lemma A.4, MT lines 2108–2118, supports equality of normalized N. |
| F02: Hilbert series versus volume | §12.5, line 1127: “`H_Q(t) = (1 − t)^n H_gr(t)`” and “whose value at `1` is `dim Q`”. For x², Hgr=1/(1−t^(1/2)), HQ=1+t^(1/2), HQ(1)=2=1! vol[0,2]. Count: #(kΔ∩ℤ)=2k+1. §12.6 also uses the value at 1. | Repaired, including the rational grading and n=0. |
| F03: missing semigroup CM owner | Exact supplier contract, line 146: “What GroebnerGeometry must provide (gap:normal-semigroup-cohen-macaulay)”. Same slug, supplier and general all-field statement in `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/plan.json`. For S={0}, ℕ, ℤ, ℕ², depths/dimensions are 0/0,1/1,1/1,2/2. | Repaired. GroebnerGeometry §G2 on main owns the affine-semigroup carrier and saturation; moving the requested theorem there is justified. |

All changed scope, supplier, normalization, stationary-phase, Hilbert-series and gap passages were read. Repeated-pattern searches covered other variation identities, powers of monodromy, filtration shifts, relative monodromy Checks, Hilbert-series/volume claims, semigroup CM uses and their Needs/dependency summaries. R03 is the same impossible variation repeated in two sections. No input file was edited to perform these tests.

### Principles and document shape

The package develops general characteristic-zero Betti/Hodge and exponential theory, with Newton nondegeneracy only in the theorem to which it belongs. It does not restrict to one consumer's connection or good primes, and does not re-plan an existing same-named main roadmap. Point Hodge theory, PBW, holonomic foundations, formal differential equations and toric carriers are explicitly imported. No computational algorithm, copied source passage in the compared texts, sorry'd data, set_option, forbidden supplier, upward edge or supply cycle was found.

Main roadmaps GroebnerGeometry and EtaleCohomologyFoundations and completed AnalyticToricGeometry were read for shape. Counts in this README are 12 layers, 64 numbered target subsections, 65 Needs occurrences, 28 API blocks, 65 Checks blocks, and 12 Examples and 12 Dependencies subsections. The 27 definition/construction subsections have 28 definition blocks (two in §12.4). Each has an API and at least three Checks. R03 identifies two purported discriminating Checks that fail, rather than a missing count. Every numbered target has a source locator and dependencies; R01 is a substantive omission in one definition's domain.

The build order is explained by the mathematical dependencies: Betti/RH and Fourier operations; variations and Hodge modules; their operations; exponential objects and filtration; classical embedding; pair cohomology; tg and Fourier comparisons; logarithmic/Newton models. No layer is named for a source chapter, no passage says that a source's exposition is the plan, and no unsupported source-order run was found. The explicit Needs lines force the main chain. The README and Lean contain no machine paths, PR numbers, review dates, HTML anchors, LaTeX delimiters or hand-off residue. Metadata is `topic = "math.AG"`.

All 13 owned backticked Lean names are declared in Suggested.lean and occur in the README. Mathematical code-span notation was not mistaken for an attributed declaration. No conflicting fully qualified name was found in the readable roadmaps. The single import is `import Mathlib`; there is no unused TauCeti import or missing TauCeti object-file build.

### Headline coverage and Lean verification

The README summary and deep intermediate results give the following acceptance-test inventory.

| Headline | Suggested.lean coverage at the pins |
|---|---|
| Regular Riemann–Hilbert, §1.5 | Docstring: missing regular holonomic D-modules and algebraically constructible/perverse Betti categories. |
| Zucker's punctured-curve L² theorem, §3.4 | Docstring: missing variations and weighted Poincaré-metric L² complexes. |
| Strict support/semisimplicity, polarized projective image, MHM abelianness/strictness and weights, §§4.4–4.7,5.2 | Docstring: missing filtered regular holonomic modules, V filtration and geometric Hodge-module carriers. Point MHS structures alone do not state these theorems. |
| Exponential reflector, tensor, weights and exact faithful fibre, Layer 6 | Docstring: missing MHM(A¹) and additive convolution. |
| Irregular E₁ degeneration and strict bifiltered realization, §§7.5–7.6 | Docstring: missing Deligne/irregular filtration and polarized twistor D-modules. |
| Classical tg criterion and zero-locus formula, §§10.1–10.2 | Docstring: missing exponential pair cohomology and Π. |
| Fourier costalk/Hodge numbers and monodromy weights at infinity, §§11.2–11.3,11.6 | Docstring: missing exponential pair cohomology and Π. |
| Model independence, Newton–Hodge comparison, filtered Künneth/duality, §§12.3,12.7,12.9 | Docstring: missing the irregular filtration constructed from Deligne filtration. |
| Laurent concentration and normalized volume, §12.6 | Stated in full as `twistedDeRham_concentration_finrank` at line 146, with native monoid-algebra/linear-map/convex/measure carriers and twelve simple supporting definitions. |

The prescribed `lake env lean` elaboration of the actual package file, run from the pinned content checkout, exited 0. The only diagnostic was `Suggested.lean:146:8: warning: declaration uses sorry`. No options or auxiliary imports were added. All Lean processes finished.

A scratch copy with `#check @name` for every one of the 13 declarations also elaborated, with only that warning. The explicitly bound n, φ, full-dimensionality and Newton-nondegeneracy match §§12.4 and 12.6; there are no section-variable hypotheses to disappear. Definitions use genuine bodies, with nonzero torus coordinates in the nondegeneracy predicate and finite support in the ring carrier. No signature repair resulted.

Every sorried theorem was probed: there is exactly one. Separate scratch copies using `simp`, `rfl`, `infer_instance`, and `exact FiniteDimensional.of_finrank_pos` each failed. The first left the substantive conjunction unsolved, the second was not definitional equality, the third was not a class goal, and the fourth neither supplies its positive-finrank premise nor proves concentration/volume. The inspected near-matches below prove polynomial derivative identities, bases, or consequences of a known rank; none proves this headline. It is not a Check, boundary theorem or definition restatement. Nothing should be deleted from Suggested.lean as padding, and no statable headline was found omitted or forced through a stand-in.

### Computed adversarial evidence

The round-4 table was used only for unchanged targets with explicit computed values. Its bare descriptions and source-access conclusions were not treated as fresh verification. In particular its purported Hodge realization of the relative-monodromy counterexample was re-examined and fails (R03). The table below records the fresh seeded sample, every changed/finding target, and headline tests. Other unchanged targets were read with the earlier explicit computations (including compactification, recollement, polarization, Rees strictness, weight negation and localization); their numerical distinctions are recorded after the table. Passing examples test conventions and hypotheses; they are not offered as proofs of the general theorems.

| Statement | Instances tried | Computed values on the two sides / wrong-model value | Result and change |
|---|---|---|---|
| §§1.4,4.2 normalized N, can, var | Rank-two residue Ae₁=e₀; O; δ₀ | log T e₁=−2πi e₀; Ne₁=−e₀=var can e₁. On vanishing cycles can var=−(x∂+1). O has nearby/vanishing ranks 1/0, δ has 0/1 and N=0. | Correct repaired sign and indices. |
| §§1.4,4.2 “only where” | j! rank two, B²=0≠B | var=B, can=I, var_top=2πiB; proposed necessary condition is B=0, which is false. var Nφ=B²=0. | R02; replace converse. |
| §1.5 RH headline | O_A1 and δ₀ | DR(O)[1] has constant perverse rank 1; DR(δ)[1] has point rank 1 in degree 0. Omitting [1] shifts both degrees by one. | Retained geometric normalization, no point-only substitute in Lean. |
| §2.1 exponential twist | E^(ct), E^0, E^t, E^(t²) on A¹ | ∇1=c dt; ∇t²=(2t+ct²)dt. Untwisted (dim H⁰,H¹)=(1,0); linear exponential (0,0); quadratic (0,1). Dual exponent adds −f, giving 0. | Sign, nontriviality and duality agree. |
| §3.3 admissibility | Constant Tate; Kummer weights −2,0 | Constant N=0, limit weight −2, F cutoff −1. Kummer N W₀ has rank 1 inside W₋₂ of rank 1; M=W satisfies lowering by 2. | Positive cases pass. |
| §3.3 ambient test | A² variation of R01, curve x=1/s | Interior induced F⁰ graded dimensions (1,0); boundary dimensions (0,1), versus required (1,0). Constant split variation gives (1,0) also at infinity. | R01; include compactification boundary. |
| §§3.3,4.6 negative Check | Original rank-two weights 0,1 | Claimed odd-weight rational graded rank 1; actual possible odd-weight ranks are even. Alternating line polarization has determinant 0, not nonzero. | R03; no such example. |
| §§3.3,4.6 replacement test | Rank-three weights −1,0 | Graded ranks 2,1 are realizable; N M₀ has rank 1, M₋₂ rank 0. For Kummer weights −2,0 those ranks are 1,1. | Replacement isolates absence of relative M. |
| §3.4 L² headline | Constant polarized system on proper genus-g curve | Both H¹ dimensions are 2g and weight 1; g=0 gives 0=0. | Specialization sound; primary text waived. |
| §4.4 strict support/semisimplicity | Constant on G_m, middle versus j* extension | Middle extension has weight 1, no punctual quotient; j* adds a punctual ℚ(−1), weight 2. | The larger extension fails strict support. |
| §4.5 polarized projective image | P¹→pt, identity | Weight-1 input has pushforward degrees −1,1 with ranks 1,1 and weights 0,2. Lefschetz twists ℚ(−1) by (1) to ℚ. Identity has only degree 0 and weight unchanged. | Projectivity, degree and twist retained. |
| §4.7 simultaneous strictness | Projection ℚ(0)⊕ℚ(1)→ℚ(1), zero | W₋₂∩F⁻¹ has ranks 1→1, image rank 1; W₋₂∩F⁰ ranks 0→0. Zero maps have zero image on both sides. | Genuine intersections, no mixed semisimplicity assertion. |
| §5.2 weight bounds | G_m→pt and dual Tate lines | Ordinary H¹ weight 2≥1; compact H¹ weight 0≤1. Dual changes weights 2 to −2 and −2 to 2. | Opposite one-sided bounds and negation agree. |
| §5.3 Hodge cycles | Constant smooth curve, δV, T=−1 | Constant: nearby ℚ weight 0, vanishing 0. Delta: nearby 0, vanishing V. T=−1: full nearby rank 1 versus unipotent rank 0. | Full nearby space retained; graph-V signs agree with §4.2. |
| §5.4 pure curve costalk | Constant, delta, size-two Jordan block | Constant costalk ℚ(−1) in degree 1 and weight 2; stalk ℚ in degree −1 and weight 0. Delta costalk V in degree 0. Jordan cokernel dimension 2−1=1. | Costalk, degree and nonzero N distinguished. |
| §5.6 rigidity | Constant rank r on connected base; rank 0 | Evaluation has rank r, kernel/cokernel 0; r=0 gives 0→0. R01's nonadmissible example has constant rank 2 but moving F⁰. | The admissibility hypothesis matters; repair its definition. |
| §§6.1–6.2 EMHS and Π | Constant, δ₀, K=j!pℚ_Gm | RΓ(constant)=ℚ[1]≠0 and Π=0; RΓ(δ)=ℚ≠0 and Πδ=K; RΓK=0, ΠK=K≠0. | Correct acyclic subcategory and nonzero projected unit. |
| §6.3 exponential tensor | K⊗K, translated deltas, zero | K⊗K=K, fibre ranks 1·1=1; translation parameters a,b give a+b; a+b=0 gives K; zero gives rank 0. | Tensor is projected convolution. |
| §§6.4–6.5 weights/fibre | K, ambient constant, δV, zero | K has exponential weight 0, ambient weights 0/1, fibre rank 1. Ambient constant fibre 0 but RΓ≠0. ω(δV) has rank dim V. | Faithfulness is asserted on EMHS only. |
| §6.5 faithfulness route | Fourier object supported at 0 | FT E=δ₀V implies inverse-transform constant, with RΓ=V[1]; acyclicity forces dim V=0. For nonzero constant V, RΓ has rank dim V≠0. | Does not assume the later classical-embedding theorem. |
| §§7.1,7.5 E₁ filtration | Classical ℚ(−1), exponential constant, delta | F¹ rank 1 and F^(1+ε) rank 0; ∂x(1/x)=−x⁻². Exponential constant cohomology all 0; delta has one graded line and every spectral differential 0. | Endpoint and exponential sign consistent. |
| §§7.3,7.6 strictness headlines | Constant twistor on P¹; classical projection | Twistor direct-image degrees −1,1 have weights −1,1; associated Hodge cohomology weights 0,2. Free Rees line has torsion 0. Intersection ranks are 1→1 or 0→0 as above. | Twistor and Hodge weight conventions not conflated. |
| §9.2 de Rham realization | Point-supported V in dimension d; (G_m,x); (A¹,x) | Point support: pair degree d corresponds to r−d=0; rank dim V. Torus line ordinary H¹ rank 1. Affine linear exponential all ranks 0. | Coefficient and perverse shifts preserved. |
| §9.3 Künneth/duality | Two (G_m,x), opposite versus same exponents | Ordinary product has degree 2, rank 1·1=1, jump 1+1=2. Compact/ordinary degree-1 jumps 0/1 pair into ℚ(−1). Same-exponent trace would target H²_c(G_m,2x)=0. | Opposite exponent is essential for perfect pairing. |
| §9.4 middle and lowest weight | (G_m,x), (A¹,x²), point | Torus compact/ordinary weights 0/2, middle image 0 and both weight-1 extremes 0. Quadratic dimension 1, pure weight 1. Point degree 0 has identity comparison rank 1. | Both directions of the purity criterion survive, including dimension 0. |
| §§10.1–10.2 classical tg | g=1,x,0 | g=1 gives 0; g=x on A¹ gives degree-2 ℚ(−1), rank 1; g=0 gives Hʳ(V) ordinarily and H_c^(r−2)(V)(−1) compactly. | Zero-locus formula includes degenerate g correctly. |
| §11.1 classical Fourier cohomology | δ₀V, constant, δ_a with a≠0 | δ₀ Fourier cohomology V in degree 0, pair degree 1; constant gives ℚ(−1) in degree 1, pair degree 2; δ_a gives 0. Compact possible degrees are 1,2 instead of 0,1. | Shift j+1 and support conventions agree. |
| §§11.2–11.3 costalk/Hodge headlines | Constant smooth curve, size-two block, delta | Constant: Fourier H¹=ℚ(−1)=H¹i!pℚ, gr¹ rank 1 equals generic gr⁰ rank 1. Singular block cokernel rank 1 versus generic rank 2. Delta has H⁰≠0. | Smoothness and exclusion of punctual summands retained where required. |
| §11.5 stationary phase | D/D(τ∂τ)² | τ∂τ maps to −(t∂t+1); N∞ and Nφ both square-zero rank 1 on rank 2. Replacing t by −t has winding number +1, so N unchanged. | Repaired normalization passes nonzero-N test. |
| §11.6 weights at infinity | δ₀; primitive Jordan lengths 1,3 | K has infinity nearby weight 0 and N=0; δ correction is constant ambient weight 1. Primitive tops w−1,w+1 give correction weights w+2,w+4. | No false two-weight truncation. |
| §12.3 model independence | (G_m,x), (A¹,x²); blow-up of z/x | Ordinary jumps 1 and 1/2; compact torus jump 0. Blow-up charts give z′ and 1/x′, exceptional pole multiplicity 0. H*(P¹,O(−1))=0, but H¹(P¹,O(−2)) rank 1. | Horizontal boundary and vanishing range discriminate. |
| §12.4 differential bodies | n=0,1,2; φ=x; φ=0, g=xy | n=0 ring ℂ and d=0. D(x^m)=m x^m+x^(m+1). In n=2, d²xy=xy−xy=0; all-plus convention gives 2xy. | Operators and wedge signs determined by bodies. |
| §12.4 grading and total functions | q=0, q>n, n=0, torus coordinates | No p+1=0, so boundaries₀=0. q>n gives forms=cycles=0. At n=0 top quotient is ℂ/0. Negative powers are evaluated only with every zᵢ≠0 in the predicate. | No natural-subtraction, empty-index or division-by-zero loophole. |
| §12.4 polytope/nondegeneracy | x, x+x⁻¹, (x+y)², zero polynomial | Polytopes [0,1],[-1,1]; gauges m,abs(m). At (1,−1), both face Euler derivatives of (x+y)² are 0. Zero polynomial full-dimensional iff n=0; empty face excluded. | Nonempty/full-face clauses and full dimension necessary. |
| §12.5 repaired Hilbert computation | x², x+x⁻¹, simplex, n=0 | HQ=1+t^(1/2),1+t,1,1; evaluations 2,2,1,1 equal n!vol. For x² lattice count 2k+1 has leading coefficient 2. | F02 repaired; series not equated to scalar. |
| §12.5 gap application | Saturated S={0},ℕ,ℤ,ℕ² | k[S] depth/dimension 0/0,1/1,1/1,2/2, in every field characteristic. Newton cone monoids are saturated. | General named CM contract supplies the needed input. |
| §12.5 nonsaturated control | S generated by (4,0),(3,1),(1,3),(0,4) | (2,2)∉S, 2(2,2)∈S. t⁴·s⁶t²=s⁴·s²t⁶, but s⁶t²∉s⁴R. Parameters s⁴,t⁴ fail regularity; local depth 1, dimension 2. | Correct new Check; saturation is not cosmetic. |
| §12.6 Lean headline | n=0; x; x²; x+x⁻¹; unused coordinate | Dimensions versus n!vol: 1=0!·1; 1=1!·1; 2=1!·2; 2=1!·2. On (G_m)² with φ=x, H¹=H²=ℂ and affine span has dimension 1<2. | Full generality at pins, including n=0; hfull rejects counterexample. |
| §12.7 Newton–Hodge | x, x+x⁻¹, x+y+1/(xy) | Jumps 1; 0,1; triangle dimension 3=2!·3/2. Origin lies on boundary for x and in interior for the latter examples. | Comparison does not incorrectly require convenience. |
| §12.9 filtered Künneth/duality | Quadratics; torus line endpoints | 1/2+1/2=1. For compact jump 0, λ≤0 gives ann Fλ=0=F^(>1−λ); λ>0 gives both sides the whole ordinary line. | Strict endpoint and rational jumps agree. |

Additional unchanged computations retained and checked against the present statements: relative compactification of G_m→A¹ has fibre cardinalities 0 at zero and 1 elsewhere (not an impossible nonconstant map P¹→A¹); filtered identity from cutoff 1 to cutoff 0 has filtered cokernel 0 but Rees cokernel ℂ[z]/(z) of torsion rank 1; a nodal divisor has costalk ranks 2,1 instead of the smooth formula's 1,0; Fourier square sends τ to −τ, twice returning τ; the rank-one residue 1/2 has monodromy −1 whereas replacing it by its negative has the same scalar but the rank-two nilpotent test distinguishes the sign; metric growth 0 and 1/2 at cutoff 1/4 yield lattices tO and O; a translated classical projected delta has slope 1, not 0, at infinity. These cover the remaining convention and wrong-model cases without treating a prose-only previous review row as evidence.

The zero object gives zero maps and zero graded dimensions in the categorical assertions. Positive characteristic, infinite-dimensional variations, nonalgebraic maps and the zero ring are outside the explicit complex/rational finite-dimensional domain. The all-field semigroup gap does include positive characteristic. Nilpotent polynomial quotients are interpreted as power series truncated at nilpotence, not division by a noninvertible operator. No hypothesis containing the conclusion, unrelated free-variable headline or unused-hypothesis defect was found in Lean.

### Seeded source sample and manifest

All 21 cited works have unique existing manifest keys: 14 available certified texts, six settled uncertified works and one waived work. No other author-flagged unverified locator was found beyond those settled limitations. The recorded versions, including their printed/preprint pagination, were used. No source was fetched by hand, renamed, requested again or added. The manifest's added Sai88 introduction locators were checked at Sai88 lines 80–82 and 127; they exist, while the README correctly computes its own left-module convention instead of treating a right-module formula as an unchanged left-module formula.

| Seeded target | Locator and text read | Hypotheses and support |
|---|---|---|
| 2.1 Exponential connections and twists | FSY Appendix A.1, pp. 60–61, FSY lines 2769–2777; ESY §§2.1–2.3, pp. 18–21, especially ESY lines 961–982 | The twist is ∇+df on the localized module; dual reverses f. ESY explicitly localizes along infinity and retains holonomicity. The package does not infer regularity of the exponential twist. |
| 3.3 Admissible variations | Kash86 §§1.8–1.9, pp. 993–994, Kash86 lines 89–109; SZ §3 | Graded polarizability, quasi-unipotence, extension compatibility and relative monodromy appear in the accessible text. The ambient pair in its curve test is missing in the package (R01). SZ remains uncertified. |
| 4.5 Polarized projective images | Sai88 Theorem 5.3.1, p. 977, Sai88 lines 4017–4026 | Projective map, polarizable pure input, strictness, weight w+j and relative hard Lefschetz are present and retained. |
| 5.3 Hodge nearby/vanishing cycles | Sai90 §§2.2–2.4, pp. 237–240, especially Sai90 lines 665–704; FSY Appendix A.2, p. 62, FSY lines 2845–2856 | Weight centres for nearby and unipotent vanishing cycles differ as specified. Full nearby cycles are not replaced by the eigenvalue-one part. The left normalized maps are the separately checked §4.2 comparison. |
| 5.4 Pure curve costalk | FSY Example A.2, pp. 62–63, FSY lines 2848–2871; Corollary A.31/proof, p. 72 | Pure strict-support decomposition and cokernel of N on the unipotent nearby space support the formula. The arbitrary singular case is not assigned the smooth generic-rank formula. |
| 5.6 Constant-local-system rigidity | Sai90 §4.4, pp. 321–323, Sai90 lines 3430–3490; SZ §4 | Adjunction and realization support the evaluation argument. The fixed-part theorem in SZ was not directly read. The package retains connectedness and admissibility; R01 repairs what the latter means. |
| 6.1 Exponential mixed Hodge structures | KS Definition 7, p. 31, KS lines 1109–1113 and preceding construction; FSY Appendix A.3, p. 63, FSY lines 2897–2909 | Global-cohomology acyclicity is the defining condition. The projector realizes the subcategory; neither point support nor zero ordinary fibre is substituted for it. |
| 6.3 Tensor product | KS Definition 7, p. 31, and Proposition 4/Lemma 1, pp. 36–37, KS lines 1278–1308; FSY p. 64, FSY lines 2922–2928 | Projected additive convolution and its unit are supported. Exactness belongs to the exponential category, not all ambient derived convolution. |
| 6.5 de Rham fibre | FSY (A.7)–(A.9), p. 64, FSY lines 2929–2942; KS Definition 8, p. 31, KS lines 1124–1130 | H¹ of the exponential twist is the Fourier fibre at nonzero parameter; the fixed parameter 1 agrees with the roadmap. The faithfulness proof independently excludes Fourier objects supported at zero. |
| 9.2 Twisted de Rham pair realization | FSY (A.16)–(A.17), p. 66, FSY lines 2996–3018 | Ordinary/compact formulas and r−dim(U) coefficient shifts match. Filtration is supplied by the already stated strict realization, not by forgetting the coefficient shift. |
| 9.3 Künneth and duality | FSY Example A.22, pp. 67–68, FSY lines 3061–3085; Yu Theorem 2.2, pp. 14–16, especially Yu lines 711–715 | FSY's example is the torus-sum specialization, not by itself a theorem for arbitrary pairs. The general Künneth target uses the named derived operations and exponential tensor (§§5.1,6.3); Yu supplies perfect duality with −f. The general filtered theorem is separately §12.9, citing CY. |
| 9.4 Middle degree and lowest weight | FSY Proposition A.19/proof, pp. 66–67, FSY lines 3024–3047 | Smooth dimension-d, pure coefficient weight and ordinary/compact bounds support the middle-image statement. Duality supplies the converse formulation involving both extremal weight pieces. |
| 11.1 Classical Fourier cohomology | FSY Lemma A.28 and Notation A.29, p. 71, FSY lines 3231–3235 | The pair shift is j+1, ordinary degrees 0,1 and compact degrees 1,2. All are stated with the input and Fourier-output coordinates distinguished. |
| 12.4 Newton complex | Yu §4 definition, p. 25, Yu lines 1333–1342; (24)–(25), p. 26, Yu lines 1372–1395 | Full-dimensional Newton polytope contains 0. On a face not containing 0, a supporting weight gives the Euler identity, so the common-zero condition on Euler derivatives is equivalent to Yu's condition including f_face. Nonzero torus coordinates are explicit. |
| 12.7 Newton and irregular filtrations | Yu Proposition 4.3, p. 27, Yu lines 1423–1425; Proposition 4.4, p. 29, Yu lines 1533–1537; Lemma 4.5, p. 30, Yu lines 1549–1553; Theorem 4.6, p. 31, Yu lines 1663–1670 | Toric-section comparison, blow-up comparison and the nonnegative-cutoff cohomology vanishing lead to the stated comparison for nondegenerate full-dimensional Laurent polynomials. Convenience is not added to this theorem. |

Changed §11.5 was also checked at MT Lemma A.4, p. 39, MT lines 2108–2118. For §§12.5–12.6, AS Theorem 4.1, p. 67, AS lines 395–398, (4.3), p. 69, AS lines 442–445, Theorem 4.13, p. 73, AS lines 569–573, Theorem 5.1, p. 74, AS lines 583–590, and the cone argument at AS lines 610–626 were read. Yu Theorem 4.1, pp. 26–27, Yu lines 1397–1416 supplies a readable concentration/volume statement. AS's cone theorem and its Laurent specialization are correctly distinguished. AS line 617 invokes Hochster for a special cone; it is not treated as a supplier of the general theorem. That input now has its declared owner.

### Pinned library and duplication audit

The content manifest pins Mathlib to `1b1ccf4b088b32fa3f23f2de1127433254a81e1e` and Tau Ceti to `2fd255d997f47c0b5d834ee416c7015d55444ce5`. The following declarations/bodies were opened at those pins. Paths here are library-relative, not paths to a newer installation.

| File and line at the pin | What was verified |
|---|---|
| `Mathlib/Algebra/Homology/DerivedCategory/Basic.lean:87` | DerivedCategory localizes complexes; it does not supply geometric constructibility or perversity. |
| `Mathlib/Algebra/Polynomial/Derivative.lean:47`, `:228` | Polynomial.derivative and derivative_mul give the ordinary polynomial derivation and its Leibniz law. |
| `Mathlib/RingTheory/PowerSeries/Basic.lean:57`; `Mathlib/RingTheory/LaurentSeries.lean:101` | The imported power/Laurent series carriers are the indicated specializations. |
| `Mathlib/Algebra/MonoidAlgebra/Defs.lean:64`, `:69`; `Mathlib/Algebra/MonoidAlgebra/Module.lean:73` | AddMonoidAlgebra has finite-support coefficient data; coeffLinearEquiv is the additive coefficient equivalence used in the Euler body. |
| `Mathlib/LinearAlgebra/Finsupp/LSum.lean:96`; `Mathlib/LinearAlgebra/Finsupp/Defs.lean:87` | lsum and lsingle assemble the diagonal operator on exponent monomials. |
| `Mathlib/Algebra/Module/LinearMap/Defs.lean:1018`; `Mathlib/Algebra/Module/Pi.lean:87`, `:115` | mulLeft, pi and proj have the required native linear-map types. |
| `Mathlib/Analysis/Convex/Hull.lean:48`; `Mathlib/LinearAlgebra/AffineSpace/AffineSubspace/Defs.lean:537` | convexHull and affineSpan give the actual Newton polytope and its full-dimensionality hypothesis. |
| `Mathlib/Analysis/Convex/Exposed.lean:55` | IsExposed allows the empty subset and a zero exposing functional. Thus the explicit nonempty and 0-not-in-face clauses in the predicate are necessary. |
| `Mathlib/MeasureTheory/Constructions/Pi.lean:349`, `:660` | Empty product volume is a Dirac mass, so the n=0 point has volume 1; general product volume is the stated Lebesgue normalization. |
| `Mathlib/Algebra/Module/ZLattice/Covolume.lean:318`; `Mathlib/Analysis/Convex/Measure.lean:38` | ZLattice.covolume.tendsto_card_div_pow requires bounded measurable set with null frontier; Convex.addHaar_frontier supplies the latter for the finite-dimensional convex polytope. These are cited, not re-planned. |
| `Mathlib/Algebra/Polynomial/Laurent.lean:85`, `:490`, `:513`, `:525` | The native one-variable Laurent ring is AddMonoidAlgebra R ℤ and has its localization comparison. The kept n-variable ring is a specialization of a native carrier, not a replacement ring construction. |
| `Mathlib/Algebra/MvPolynomial/Derivation.lean:114`, `:133`; `Mathlib/Algebra/MvPolynomial/PDeriv.lean:61`, `:65`, `:79` | Derivation constructor and Euler action use natural polynomial exponents. They do not state concentration of a twisted Laurent complex. |
| `Mathlib/RingTheory/Kaehler/Polynomial.lean:63`, `:72`, `:83`; `Mathlib/RingTheory/Extension/Cotangent/Basic.lean:441` | Polynomial Kähler basis/coordinate derivative and cotangent-base-change formulas are the near-matches, not the target cohomology theorem. |
| `Mathlib/RingTheory/MvPolynomial/EulerIdentity.lean:58`, `:73` | Homogeneous/weighted-homogeneous Euler identities have polynomial hypotheses; the roadmap's elementary Laurent-coordinate definitions do not assert a competing general library theorem. |
| `Mathlib/LinearAlgebra/FiniteDimensional/Defs.lean:140`, `:143`, `:152`, `:156`, `:173` | Positive or specified finrank yields finite dimensionality; infinite dimensionality forces finrank zero. None computes the unknown rank from φ, Δ or nondegeneracy. |
| `TauCeti/Geometry/Hodge/Structure.lean:62` | HodgeStructureOn includes decomposition/conjugation but no finite-dimensionality or rational model. The package adds these conditions explicitly. |
| `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `TauCeti/Geometry/Hodge/Mixed/Morphism.lean:77` | MixedHodgeStructure includes integral/rational/complex models and finite filtrations; Hom preserves W and F. Finite filtrations alone do not imply finite-dimensional spaces. |
| `TauCeti/Geometry/Hodge/Mixed/Strictness.lean:88`, `:110`, `:131` | Strictness for sums of Deligne pieces includes the intersection region defining W_k∩F^p; the native point statement is imported. |
| `TauCeti/Geometry/Hodge/Mixed/Category.lean:56`; `TauCeti/Geometry/Hodge/Mixed/Abelian.lean:33` | The mixed-Hodge category and abelian instance exist, but do not supply the geometric MHM category. |
| `TauCeti/Geometry/Hodge/Polarization.lean:72`, `:159`, `:221` | IsPolarization, Polarization and IsPolarizable have the integral-form interface; the roadmap explains rational polarizations and does not silently impose an integral lattice. |
| `TauCeti/Geometry/Hodge/Tate/Basic.lean:93`, `:102`; `TauCeti/Geometry/Hodge/Tate/Twist.lean:63` | Tate weight −2m and Hodge cutoff −m agree with the package's shifts. |
| `TauCeti/AlgebraicTopology/LocalCoefficient.lean:46` | LocalCoefficientSystem is a fundamental-groupoid functor to ModuleCat, without a built-in finite-dimensional-value restriction. The dictionary gap specifies the full subcategory. |
| `TauCeti/RingTheory/CohenMacaulay/Ring.lean:40` | The ring predicate includes Noetherianity and Cohen–Macaulay localizations at primes. It is the predicate requested by the new gap, not a theorem that every normal semigroup algebra satisfies it. |

Object searches covered mixed Hodge modules versus point structures, regular RH versus regular-singular connections, irregular Hodge filtration, twisted Laurent cohomology, toric normal fans/rounded vanishing, and saturated semigroup Cohen–Macaulayness. `roadmaps grep` and `roadmaps show` were used for main and the provided open heads, with the board package index checked before absence claims. The one-variable Laurent, polynomial Euler/Kähler and finite-rank near-matches do not prove the sole Lean headline. No additional declaration should be dropped as already formalized. Generic foundations are owned by their cited suppliers; the package owns the rational geometric Hodge/exponential/irregular comparison, not another PBW, point-Hodge or toric foundation.

### Supplier citations, gaps and overlap

Every Needs line and supplier contract was read. Citations were resolved anew at main or the provided open head, not inferred solely from the previous review. The current resolution tool reported no unresolved roadmap or attributed own-name citation; its external-library limitation was covered by the pinned-file audit above. This table gives the resolved sections and their witnesses. PR numbers here identify reviewed heads; the roadmap itself contains no PR-number citations.

| Supplier / version | Resolved repository-relative witness |
|---|---|
| ComplexComparisonPartII, PR #848 | `TauCetiRoadmap/ComplexComparisonPartII/README.md:996` C−1.1; `:2982` C5.1 and `:3083` shared operators; `:4438` C5.6, residue sign `:4464`; `:4680` C6.0; `:4741` C6.1. Arbitrary-ring compact support begins `:4780`; it is distinct from the finite-coefficient dictionary. |
| FormalConnectionsOpers, main | `TauCetiRoadmap/FormalConnectionsOpers/README.md:707`, F2.2: projective-tangent PBW/symbols on the supplied differential operators, with the smooth characteristic-zero comparison. |
| SpringerResolutionAndCharacteristicCycles, PR #1828 | `TauCetiRoadmap/SpringerResolutionAndCharacteristicCycles/README.md:855`, `:869`, `:891`, `:907`, §§8.2–8.5; `:964`, `:990`, `:1016`, `:1038`, `:1051`, `:1075`, §§9.1,9.2,9.4–9.7. Good filtrations, transfers, Kashiwara, holonomicity, finite length, intermediate extension and regularity are present; missing general specializability/stability cases are the named gaps. |
| PadicDifferentialEquationsAndRigidCohomology, PR #1002 | `TauCetiRoadmap/PadicDifferentialEquationsAndRigidCohomology/README.md:12729`, RD.6.52a, and `:12749`, RD.6.53. The characteristic-zero formal classification/good lattices and algebraic curve index apply over ℂ, not only over a p-adic coefficient field. |
| ShimuraData, PR #1038; ShimuraVarieties, PR #933 | `TauCetiRoadmap/ShimuraData/README.md:355`, `:386`, `:417`, §§3.1–3.3, supply pure variations, morphisms and rational polarizations. `TauCetiRoadmap/ShimuraVarieties/README.md:962`, `:974`, §§3.5b.1–3.5b.2, supply unipotent nilpotent-orbit/norm results. The quasi-unipotent all-eigenvalue descent here is a stated extension, not a second pure-variation carrier. |
| LefschetzPencilsAndVanishingCycles, PR #873 | `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md:1093`, `:1146`, `:1220`, `:1279`, `:2410`, §§1.3–1.5,1.7,3.4. Monodromy/primitive/relative filtration and normalized maps are present. Relative-filtration uniqueness is not existence; R03 concerns misuse of its bare-vector-space example. |
| ResolutionOfSingularitiesCharacteristicZero, main | `TauCetiRoadmap/ResolutionOfSingularitiesCharacteristicZero/README.md:791`, `:801`, `:893`, §§5.1,5.2,6.2. Principalization, embedded resolution and smooth proper SNC compactification have the domains used. |
| EtaleCohomologyFoundations, main | `TauCetiRoadmap/EtaleCohomologyFoundations/README.md:57`, `:105`, G.1–G.2; `TauCetiRoadmap/EtaleCohomologyFoundations/Suggested.lean:33`, `:65`, `:155`. Compactification, DenseCompactification and nagataCompactification use separated finite-type maps over qcqs bases. |
| StratifiedSpacesAndTameTopology, PR #1519 | `TauCetiRoadmap/StratifiedSpacesAndTameTopology/README.md:936`, `:957`, §§7.2–7.3: Whitney/Nash strata. The algebraic-map stratification added here is identified as the extra assertion. |
| AlgebraicTopologyPartII, PR #1694 | `TauCetiRoadmap/AlgebraicTopologyPartII/README.md:1539`, `:1571`, `:1596`, `:1617`, `:1647`, §§16.1a–16.1e: smooth stratified data, control tubes, controlled fields and proper isotopy. |
| EnhancedDerivedSheaves, main | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:429`, `:441`, `:455`, `:492`, `:580`, §§0.1–0.4,E1.4: enhanced module sheaves/derived functors; not perverse Betti hearts. |
| SchemeAndStackFoundations, main | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:1310`, `:3420`, `:3554`, `:4104`, `:4452`, `:4917`, `:5820`, `:6389`, `:7109`, §§0.17,2.2,2.6,2.18,2.20,3.3,4.11,4.17,5.5: depth/CM interfaces, cohomology/derived comparisons, curve duality, blow-ups/SNC and normal bundle. No generic semigroup CM theorem is attributed to these interfaces. |
| AlgebraicCurves, main | `TauCetiRoadmap/AlgebraicCurves/README.md:1099`, `:1468`, Layers 9,12: differential/local expansions and regular projective curve models. Over ℂ these models are smooth; no regular=smooth claim over an imperfect field is imported. |
| SchemeKTheoryOperations, PR #1229 | `TauCetiRoadmap/SchemeKTheoryOperations/README.md:1971`, §5.7, and vanishing at `:1979`: exceptional projectivized conormal, O(−E) restriction O(1), normal O(−1), negative-twist vanishing for 1≤μ≤c−1. |
| AnalyticToricGeometry, completed; AnalyticToricGeometryPartII, PR #1647 | `Completed/AnalyticToricGeometry/README.md:186`, Layer 0, dual semigroups/Gordan at `:230`; `TauCetiRoadmap/AnalyticToricGeometryPartII/README.md:117`, `:143`, `:166`, §§0.1–0.3, invariant divisors/weights/sections. The new gap does not reassign these carriers. |
| GroebnerGeometry, main | `TauCetiRoadmap/GroebnerGeometry/README.md:103`, G2: affine semigroup algebras, group-relative saturation and normality. The requested Hochster extension is on precisely this carrier. |

All seven declared gap slugs match the top-level gaps in `packages/MixedHodgeModulesAndIrregularHodgeTheory/design/plan.json` and the README's Exact supplier contracts. None has supplier `none`. Each is precise enough to test its hypotheses and deliver the missing interface:

- `holonomic-specializability` and `regular-holonomic-stability`: graph/hypersurface specializability and the missing derived regular-holonomic operations, with already supplied duality/smooth pullback/middle extension excluded from the missing portion.
- `rational-complex-local-system-dictionary`: finite-dimensional ℚ/ℂ values, not the existing finite-ring finite-stalk dictionary or the unrestricted native functor carrier.
- `toric-normal-fan`: polytope normal fan, regular complete refinement and divisor identification; `toric-rounded-vanishing`: rounded nef rational-divisor higher-cohomology vanishing. Neither is already the monomial-section description.
- `blowup-exceptional-divisor`: all-field smoothness of blow-ups in smooth centres, not the exceptional bundle or negative-twist vanishing already imported. The characteristic-zero resolution supplier does not give its all-field contract.
- `normal-semigroup-cohen-macaulay`: all-field, finitely generated, saturated-in-generated-group semigroup algebras. Native CM predicates and GroebnerGeometry's normality theorem do not supply Hochster's theorem. DirectSummandsAndBigCohenMacaulay's mixed-characteristic subring theorem is a different object and theorem.

These are declared contracts, not findings about absent present-day implementations. Their compatibility clauses form the indicated interfaces rather than unrelated requests. No additional missing owner was found in the proof routes examined.

The supplied overlaps record has no conflicting head changing this roadmap, dropped cited id or id defined only by an open revision. Its five closest roadmaps were opened. Lefschetz, ComplexComparison and PadicDifferentialEquations are the imported foundational directions above. EtaleDualityAndPerverseSheaves, PR #1040, `TauCetiRoadmap/EtaleDualityAndPerverseSheaves/README.md:7`, owns finite/adic étale coefficient theory, not the rational Betti/Hodge realization here. SheafConvolutionOnAbelianVarieties, PR #1809, `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md:7`, owns abelian-variety convolution, Fourier–Mellin and Fourier–Mukai theory; §§0.4,0.9,1.5,4.3 at lines 275,399,520,744 consume the holonomic realization instead of owning this additive-line exponential theory. No shared owned object or mutual supply was found in these scopes.

EllAdicHomotopyTypesAndWeights, PR #1644, `TauCetiRoadmap/EllAdicHomotopyTypesAndWeights/README.md:13`, still cites the old H.1/operations and H.1/weight-bounds ids. The package's explicit former-numbering map resolves them to §§5.1–5.2, so they are not dropped citations. KloostermanMomentsAndPotentialAutomorphy and these downstream roadmaps are consumers, not upward supplier edges.

The prescribed dependency command completed with this full output:

```text
depcheck: 237 roadmaps, 2152 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Neither merge order nor tooling was changed.

## Not verifiable

These are settled source-access limits, not new requests and not claims that the primary text was read. No needs-references entry was added.

- **SZ:** settled uncertified; §§1–4, including the seeded admissibility and fixed-part references in §§3.3 and 5.6, were not directly read. Kash86 supplies a readable independent admissibility definition and the R01 witness.
- **Dimca:** settled uncertified; the perverse/RH/nearby-cycle text, including the locators on the changed §1.4, remains unread. R02 is refuted by an actual two-dimensional quiver computation and j! realization, not by an imagined source quotation.
- **Schmid:** settled uncertified; the primary limit/nilpotent-orbit locators in §3.2 remain unread. The current supplier statements and numerical limit tests were checked.
- **Kash76:** settled uncertified; the primary b-function theorem remains unread. Sai88 and the declared specializability contract were inspected separately.
- **Kou:** settled uncertified; §2/Théorème 2.8 remains unread. AS and Yu were read for their own statements and cited proof steps; their citations do not certify the inaccessible primary proof.
- **Verdier:** settled uncertified; the primary stratification/Bertini–Sard locators remain unread. The current topological and compactification suppliers were resolved.
- **Zucker:** waived; the primary L² theorem and analytic proof were not read. The constant-curve specialization is computed above, without claiming direct source certification.
- The AS extraction drops pieces of the displayed dimension formula in Theorem 4.13. The surrounding text and readable Yu Theorem 4.1 were compared; no fresh visual certification of the damaged AS display is claimed.
- Sai88 is OCR text; some displayed maps in Proposition 3.4.12 are degraded. The repaired sign is checked by horizontal transport and the readable C5.6 convention, not reconstructed from unreadable symbols. The added introduction locators are readable.

No unavailable text is needed to verify R01–R03 or the stated repairs. No suspicious instruction from a source or sibling file was followed.

## Source issues

- **Misprint** in FSY at Appendix A.2, printed p. 61, FSY line 2800: the source says left-to-right filtration shifts the index down by the dimension; it should shift the index up by the dimension; affects a stated result.
- **Misprint** in FSY at Appendix A.2, printed p. 62, FSY line 2832: the source says duality twists the smooth constant perverse object by minus its dimension; it should twist by plus its dimension; affects a stated result.
- **Misprint** in FSY at Example A.3, printed p. 63, FSY line 2876: the source says divisor inverse image of the shifted constant object has no additional cohomological shift; it should have the divisor constant perverse object shifted by one; affects a stated result.
- **Misprint** in FSY at Example A.27, printed p. 71, FSY line 3222: the source says the composite direct-image functor on the zero locus is zero; it should say the underlying function is zero and its direct image factors through the origin; affects the proof.
- **Misprint** in FSY at Theorem A.30, printed p. 71, FSY line 3241: the source says the costalk inclusion is into the output t-line; it should be into the input τ-line carrying M; affects a stated result.
- **Misprint** in AS at §4 filtration definition, printed p. 68, AS line 424: the source says the monomial-weight bound in form degree l is k/e minus l; it should be k/e plus l, also identified at Yu line 1443; affects the proof.
- **Error** in Yu at §4(a), printed p. 26, Yu lines 1377–1378: the source says convenience makes the Laurent-polynomial map proper; it should assert exhaustiveness, since x+x⁻¹+y+y⁻¹ has a positive-dimensional affine zero fibre; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "3c5cbc7b94939fbdd81d29b79b64221129553475", "job": "REV-PKG-MixedHodgeModulesAndIrregularHodgeTheory~5", "model": "gpt-6-astra", "worker": "chris-8"} -->
