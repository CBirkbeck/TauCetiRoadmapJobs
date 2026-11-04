# Review of PseudodifferentialOperators (pull request #952 at 636402f)

**Verdict:** accepted

No findings. The folder is ready for a human's final approval; this review does not approve or merge the pull request.

## Previous findings

- R01 — repaired: README:1134–1158 retains the analyzed blocks in reconstruction, distinguishes enlarged cutoffs from a partition, and applies the kernel bound to each analyzed block. The overlap Check at :1221–1227 now gives 1/2 on both sides.
- R02 — repaired: README:131–136 and :1269–1271 cite the pinned scalar Schur inequality. The remaining target at :1145–1154 is the finite-rank Bochner adapter and infinity endpoint, with the zero-bound case handled separately.

## Verified sound

:robot: AI review. This is an **incremental re-review of 120 changed lines since 0f89dc4**, comprising 102 insertions and 18 deletions in the README and Suggested.lean. I checked both previous findings, the changed Schur/reconstruction route and its dependent Besov consequences, the five new Lean declarations for the complex derivation dictionary, and deletion of the two downstream RQFT references. Unchanged mathematics is carried from [r7](PRREVIEW-PseudodifferentialOperators~7.md), not represented as a new full review.

Below, README and Suggested.lean refer to `TauCetiRoadmap/PseudodifferentialOperators/README.md` and `TauCetiRoadmap/PseudodifferentialOperators/Suggested.lean`.

The head is 636402fca8e69477e502482c928dbb6f15942793. The comparison with origin/main found no changed file outside this roadmap folder; the worktree remains clean. Repository README and CONTRIBUTING were read, along with main's PDE and OperatorTheory roadmaps for form and ownership. No source, roadmap, manifest, toolchain or merge-order file was edited.

**Gate and dependency direction.** The supplied gate passes every check, including build. My gate rerun passes all its text, scope, metadata and dependency checks; its output does not include a build stage, so I separately ran the specified targeted build. It completed successfully with 8981 jobs. The prescribed dependency command returned exactly:

```text
depcheck: 207 roadmaps, 1460 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Every Needs line was reread. The new supplier edge is to an existing Tau Ceti inequality; the Besov reconstruction change uses the same internal dependencies. The complex headline uses the real dictionary and elementary real/imaginary decomposition. The removal of downstream application references changes no mathematical target or supplier.

**Elaboration and padding.** Direct `lake env lean` on Suggested.lean exits 0, with only nine sorry warnings, at lines 59, 72, 87, 98, 137, 223, 253, 264 and 280. The required import's object file was available for direct elaboration. A scratch copy with `#check @name` for **all 27 declarations** also elaborated successfully. The new complex theorem retains second countability, finite dimension, smooth-manifold structure, Hausdorffness and boundarylessness. Its source is the actual algebra of complex smooth functions on a real base, and its target is the native tensor product of the actual smooth real tangent-section space.

The four new supporting declarations have real bodies. They deliberately need fewer hypotheses than the theorem: the ring instance has no manifold parameter; the constant-function map, algebra and real inclusion need only their charted-space data. No needed hypothesis silently disappeared. The remaining 22 signatures agree with the previous ones; in particular, the two quantization theorems retain completeness, finite-dimensional fibers, and their compact-support or uniform-symbol assumption.

All **nine** sorried theorems were probed on a scratch copy with single-tactic alternatives `simp`, `rfl` and `infer_instance`; none closed. The new derivation equivalence is not an instance or definitional equality. Searches and reading found no single pinned theorem supplying it. The native point-derivation equivalence supplies only its pointwise real input, not the global smooth complex dictionary. The four supporting declarations are simple definitions/instances needed to state that dictionary, not additional admitted API tests.

**Headline coverage.** The headline families are the scalar cotangent and real/complex derivation dictionaries; differential operators, jets, Bochner decomposition and Peetre; Borel summation and inverse elliptic principal symbols; kernel correspondence and quantization; composition, adjoints and symbol recovery; Sobolev and Calderón–Vaillancourt estimates; interpolation and bundle Besov/Zygmund mappings; parametrices, Fredholmness and elliptic regularity; powers and equivariant product indices; elliptic-complex Hodge theory; finite-deck isospectrality; and wavefront detection and distribution operations. The nine Lean theorems now include the complex dictionary alongside the eight existing targets. The module docstring names the other families and their missing carriers. The new Schur adapter is an ingredient of the existing Besov headline, not a replacement acceptance theorem. No free predicate, sorry'd data, weakened substitute, algorithm or route-specific restriction was introduced.

**Sources and the seeded sample.** Two author-hosted works were fetched through the sources service for this increment. No source material was copied into the repository. The 15 seeded targets are covered by the carried mathematical rows below: §§1.2, 2.1, 2.2, 3.1, 4.1, 4.2, 5.3, 5.4, 5.5, 6.1, 6.2, 7.1, 7.2, 8.1 and 8.2. Fresh source verification concerns changed §5.3 and the real dictionary underlying the new complex signature; unchanged locators retain r7's verification and limitations.

| Changed or dependent passage | Source verification |
|---|---|
| README:1134–1140, dyadic analysis and synthesis | bl line 4387–4395, §6.4 equations (1)–(2), printed p. 150. I also inspected the rendered page because extraction omits the displayed formulas. Analysis first takes the original blocks, synthesis applies the enlarged multipliers to those blocks, and synthesis after analysis is the identity on tempered distributions. This supports the repaired formula; the enlarged family is not a second partition of unity. |
| README:1145–1154, finite-p Schur input | The exact pinned theorem at `TauCeti/MeasureTheory/Integral/SchurTest.lean:59–63` has SFinite measures, jointly measurable ENNReal kernel, a.e. measurable input, real p≥1, and a.e. marginal bounds A,B. Its factor is A^(p−1)B, as stated. Lebesgue measure and finite-dimensional fibers meet the measurability/completeness requirements for the norm-kernel application. The infinity endpoint is separately owned here. |
| README:327–339 and Suggested.lean:133–146, complexification | kms line 822–836, Lemma 3.3, printed p. 16, gives the real algebraic-derivation/smooth-vector-field dictionary without continuity of the derivation. The complex statement follows by restricting to real functions, taking real/imaginary parts, applying that dictionary twice, and using complex linearity. It is a consequence developed here, not a claim that Lemma 3.3 literally states the complex tensor-product form. |
| Source reconstruction proof | bl line 4405–4408 retains the source error already recorded in r7: for arbitrary sequence input, overlapping synthesis blocks contribute. The repaired roadmap does not use that false diagonal identity. |

The complex inverse is determined: if δ restricted to real functions is X+iY, complex linearity forces δ(u+iv)=Xu−Yv+i(Yu+Xv). Conversely this formula is complex-linear and satisfies Leibniz because X and Y do. Real test functions separate tangent vectors using the existing local-coordinate/bump input. Together with the real basis (1,i), this proves that the condition on the existential equivalence excludes arbitrary rescaling or conjugation.

**Pinned objects opened and ownership.** The actual library checkouts match lake-manifest.json: Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. I opened these eight relevant declaration groups:

1. `Mathlib/Geometry/Manifold/Algebra/Structures.lean:30–54`: `ContMDiffRing` and `instFieldContMDiffRing`. The native field instance uses the same field for differentiability and target; it does not give real smoothness of the complex field. The added instance fills that specialization.
2. `Mathlib/Geometry/Manifold/Algebra/SmoothFunctions.lean:181–186`: native ring and commutative-ring structures on smooth maps, supplied from a smooth target ring. They impose no Hausdorff or nonempty-source condition.
3. `Mathlib/Geometry/Manifold/Algebra/SmoothFunctions.lean:193–199`: `ContMDiffMap.compLeftRingHom`, consistent with pointwise inclusion by the real-to-complex map.
4. `Mathlib/Geometry/Manifold/Algebra/SmoothFunctions.lean:278–289`: `ContMDiffMap.C` and `ContMDiffMap.algebra`. Their scalar field is the manifold's differentiability field; they supply the real scalar algebra here, not the required complex scalar algebra over a real base. The new constants/algebra do not duplicate that instance at the same type.
5. `Mathlib/Analysis/Complex/Basic.lean:317–325`: `Complex.ofRealCLM` and its evaluation equation; these supply the smooth inclusion used by `ofRealSmooth`.
6. `Mathlib/LinearAlgebra/Complex/Module.lean:142–158`: `Complex.basisOneI`, its real/imaginary coordinates and its vectors 1,i, supporting the unique-pair tensor description.
7. `TauCeti/Geometry/Manifold/DerivationBundle.lean:446–473`: `pointDerivationEquivTangentSpace` and its inverse laws. Finite dimension, Hausdorffness and the interior-point assumption are explicit; global smoothness and complexification are not supplied by this pointwise result.
8. `TauCeti/MeasureTheory/Integral/SchurTest.lean:59–63`: `TauCeti.lintegral_rpow_lintegral_mul_le`. The new adapter now consumes it.

Object searches used the roadmap service over main/open heads, the board packages, and both pinned libraries. The other complex-derivation hits were inspected: `TauCetiRoadmap/RepresentationTheory/LieGroups/Suggested.lean:1110` and `TauCetiRoadmap/RepresentationTheory/LieHighestWeight/Suggested.lean:2044` concern finite-dimensional octonion algebras; `TauCetiRoadmap/AffineLieAlgebras/README.md:540` concerns the oscillator algebra. None owns derivations of the smooth-function algebra on a real manifold. The new global complex theorem therefore belongs to this roadmap's existing P1.0 core. The scalar Schur ingredient remains with its pinned owner; the finite-rank Bochner adapter remains here. No colliding fully qualified declaration was found for the five additions.

**Cross-roadmap resolution.** The changed complex passage's supplier was reopened with the roadmap service at the supplied SmoothBundlesConnections head. `TauCetiRoadmap/SmoothBundlesConnections/README.md:560–604`, B2.1, explicitly owns complex bundles over real bases, complexification and decomposition maps. It does not own the algebraic-derivation dictionary. The complexification convention agrees: multiplication by i is (X,Y)↦(−Y,X), not (Y,−X).

Affected analytic contracts were reopened on main: `TauCetiRoadmap/PDE/README.md:235–280` (A.3–A.7 and B.8–B.10) and `TauCetiRoadmap/ComplexKahlerGeometry/README.md:570`, :728–744 and :791–839 (K5a). K5a's Hilbert interpolation and transition comparison remain p=2 inputs; the full Besov endpoint theorem remains owned here. The full endpoint-p statement is supplied by the owned Besov transition target, with its own proof route.

The remaining supplier labels were resolved anew: main `TauCetiRoadmap/DifferentialGeometry/README.md:268`, :311, :503 (Layers 0,1,5); `TauCetiRoadmap/HopfRinow/README.md:244` (Layer 1); `TauCetiRoadmap/RepresentationTheory/CompactGroups/README.md:205`, :253, :303 (Haar, reducibility and Schur inputs); `TauCetiRoadmap/TopologicalKTheory/README.md:989–1007` (T6's independent representation ring and external product); `TauCetiRoadmap/RiemannianGeometry/README.md:717–756` (R4.7, including generic free discrete quotients); and `TauCetiRoadmap/RepresentationTheory/InductionRestriction/README.md:346–379` (§2.1). The last names the planned `Gassmann.almostConjugate_iff_permutation_equiv` at :378, resolving that name-search lead. `Symbol.HasCompactSpatialSupport` is declared in the reviewed Suggested.lean:189 and appears in the successful signature run, resolving the other lead.

Supplied downstream heads retain the stated consumption: `TauCetiRoadmap/IndexTheory/README.md:63`, :230 and :432 (I2/I4); `TauCetiRoadmap/LieGroupoidsPoisson/README.md:340–350` (G1.1); and `TauCetiRoadmap/FuchsianOrbifolds/README.md:152–154` (L9's transplantation input). These are consumers, not upward suppliers. The two RQFT consumer sentences were deleted without deleting or narrowing the wavefront/pushforward mathematics.

**Computed adversarial pass.** The following fresh rows cover the new statements, both repairs and their immediate consequences. Every row records values; passing instances are checks, not substitutes for general proofs. The inherited table afterwards preserves the previous report's computed evidence for unchanged statements. In that inherited table, any bare README line number refers to the previous head, and its last column cites r7 as the provenance.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| `realComplexContMDiffRing`, Suggested.lean:107 | z=1+i, w=2+3i; zero and unit | z+w=3+4i; zw=−1+5i; 0z=0, 1z=z; real-coordinate multiplication is (a,b)(c,d)=(ac−bd,ad+bc), a polynomial | Pass; actual real smooth ring | New supporting instance |
| `complexSmoothConstants`, :117 | Nonempty ℝ base; constants 0,1,i; z=1+i,w=2+3i | At every x, C(0)=0,C(1)=1,C(i)=i; C(zw)(x)=−1+5i=C(z)(x)C(w)(x). A conjugated map would give C(i)=−i | Pass; pointwise ring map is fixed | New supporting definition |
| `complexSmoothFunctionsAlgebra`, :125 | f(x)=x+i, x=2; scalars i,0,2 | (i•f)(2)=−1+2i; (i•(i•f))(2)=−2−i=−f(2); 0•f=0; real scalar 2 gives 4+2i on both scalar actions | Pass; complex action has correct sign and real restriction | New supporting instance |
| `ofRealSmooth`, :129 | u=x, x=3; u=0,1; comparison with i | Inclusion values 3+0i,0,1; imaginary part always 0, so i is not in the image; derivative of included x is the real inclusion of 1 | Pass; actual inclusion, not a constant/zero map | New supporting definition |
| Complex derivation equivalence, :137; README:335–339 | δ=(1+2i)∂ on ℝ; X=∂,Y=2∂; real u=x² at x=3 | δu=6+12i=du(X)+i du(Y). For wrong pair (X,−Y), RHS=6−12i; for zero pair RHS=0 | Pass; iff distinguishes the pair and excludes conjugation or zero equivalence | New headline |
| Complex-linear extension to u+iv | Same δ; u=x²,v=x at x=3 | Xu−Yv=6−2=4; Yu+Xv=12+1=13; δ(u+iv)=(1+2i)(6+i)=4+13i | Pass; matches README Check and docstring | New headline's normalization |
| Complex linearity of the equivalence | Multiply previous δ by i; act on x | i(1+2i)=−2+i; tensor multiplication sends (X,Y)=(∂,2∂) to (−2∂,∂), which gives −2+i | Pass; same ℂ action on both carriers | New headline |
| Tensor unique-pair description | V=ℝ, (X,Y)=(3,4); V=ℝ², X=(1,0),Y=(0,1) | 1⊗3+i⊗4 has real/imaginary components (3,4); second example has components ((1,0),(0,1)); changing Y to −Y changes imaginary component unless Y=0 | Pass; all tensors, not only a restricted family | README:338–339 |
| Derivation hypotheses and inverse Leibniz law | δ=(1+2i)∂; f=x,g=x² at x=2; constant i | δ(fg)=12+24i; δ(f)g+fδ(g)=(4+8i)+(8+16i)=12+24i; δ(i)=0 | Pass; inverse is a derivation, not arbitrary algebra on free values | New headline |
| Empty and zero-dimensional complex dictionary | M empty; M a point; finite discrete M | Empty function algebra has one element, derivation and section spaces both 0. At a point, ℂ-linear derivations of ℂ kill every constant, giving 0; tangent space 0. On a discrete base every point derivative is 0 | Pass; no nonemptiness or positive dimension needed | New headline |
| Enlarged cutoff family | χ(3/2)=1/2, frequency 3; low frequency 0 | At 3, ψ₁=ψ₂=1/2, ψ̃₁=ψ̃₂=1: ψ̃_kψ_k=ψ_k, Σψ_k=1, Σψ̃_k=2. At 0, ψ₀=ψ̃₀=1 and annular ψ_k=0 | Pass; finite overlap does not require a second partition | R01 repair |
| Analysis/synthesis identity and convergence | T=Id, u=exp(6πix), j=1; also T=2Id and u=1 | Id: RHS=(1/2)(1·1/2+1·1/2)u=(1/2)u=LHS. T=2Id: both sides u. Partial sums are exact after k=2; for u=1 the low block alone reconstructs 1 | Pass; previous witness repaired | R01 repair |
| Off-diagonal kernel estimate | Identity at disjoint block supports; dilation φ(x)=2x on central frequency 2^k | Separated identity block=0; dilation sends k to j=k+1, requiring C_N≥2^N in a unit-normalized block bound, allowed by dependence on φ and N | Pass; repaired synthesis uses same valid estimate | Dependent route |
| Pinned Schur factor with unequal marginals | K=1_[0,2](x)1_[0,1](y), g=1_[0,1], p=1,2 | Row A=1,column B=2; integrals of output^p equal 2, RHS=1^(p−1)·2·1=2 at both p | Pass; A and B have the right orientation | R02 supplier contract |
| Scalar Bochner adapter | K=2·1_[0,1]⊗1_[0,1], u=1_[0,1], p=1,2,∞ | Input norms 1; output norms 2; both marginal bounds 2. At p=2 integral inequality 4≤2·2·1=4 | Pass; sharp endpoint and finite-p tests | R02 repair, new Check |
| Matrix Bochner adapter | K=1_[0,1]⊗1_[0,1]diag(2,3), u=1_[0,1](0,1); also (1,0) | Marginal norm bounds 3; first input norm 1 maps to 3 at p=1,2,∞. Second input norm 1 maps to 2≤3 | Pass; uses operator norm, not a selected matrix entry | New Check |
| Zero bound and p=1 | A=0, K=0, nonzero u | Operator norm 0; scalar p=1 factor 0^0·0=1·0=0 in ENNReal; output 0 at all p. No division by A occurs | Pass; degenerate case handled directly | R02 repair |
| Taking pth roots | A=3, p=1,2,3 | (3^0·3)^1=3; (3·3)^(1/2)=3; (3²·3)^(1/3)=3 | Pass; equal marginal bound gives A independently of p | New formula |
| Row-only negative control and infinity endpoint | K=1_[0,2]⊗1_[0,1], u=1_[0,1] | Input norms 1; output norms at p=1,2,∞ are 2,√2,1. Row bound 1 alone fails at p=1,2 but gives exactly 1 at ∞ | Pass; column hypothesis matters for finite p | New Check and endpoint |
| Weighted sequence summation | s=−1,N=3, b_l=2^(−2 abs(l)); ℓ¹ point mass and constant ℓ∞ sequence | Σb_l=1+2(1/4)/(1−1/4)=5/3. Both test output norms are 5/3 for input norm 1 | Pass; q-independent bound extends to both endpoints | Changed route |
| Strict summability threshold | s=1,N=1,j≥k | 2^(j−k)2^(−(j−k))=1; partial sum over j−k=0,…,m is m+1→∞ | Pass; N>abs(s), not ≥, is needed by this estimate | Changed route |
| Bundle localization consequence | Two trivial-frame cutoffs χ₁=χ₂=1/√2 | Σχ_i(χ_i u)=(1/2+1/2)u=u; on each overlap the repaired identity above returns the original analyzed block | Pass; reconstruction proof now composes correctly | R01-dependent consequence |
| Little Besov transition restriction | Weighted tail a_j=2^(−j); dilation p=1,s=0; compare constant tail 1 | New tail for j≥2 is (1/2)a_(j−1)=2^(−j)→0; constant tail becomes 1/2, not 0; truncated tail supremum 2^(−N−1)→0 | Pass; c₀ condition preserved, not asserted for all ℓ∞ data | Dependent consequence |
| §5.4 Zygmund endpoint reuse | p=q=∞; constant 1 and δ₀ on ℝ | Constant low-block norm 1 at every order; δ₀ annular norm c2^j, giving weighted values c at order −1 and c2^j→∞ at order 0 | Pass; repaired full-range estimate supplies this endpoint | Dependent consequence |
| Source finite-overlap error | Sequence with only α₁=u at frequency 3, ψ₂=1/2, ψ̃₁=1 | Δ₂(Pα)=(1/2)u, but Δ₂α₂=0; correct neighboring-block sum is (1/2)u | Source error persists; roadmap's repaired formula avoids it | r7 source issue retained |

The table above has **25 fresh rows**. The following **159 unchanged rows** are carried from [r7](PRREVIEW-PseudodifferentialOperators~7.md); the 11 superseded rows from that report are replaced above.

| Statement | Instances tried | Values computed on each side | Result | Change/provenance |
|---|---|---|---|---|
| Matrix multiplication on full Besov range, :1109–1112 | A=diag(2,3) on ℂ²; u=(1,0), p=q=∞, any s; A=0 | Constant low blocks give norms 1→2; operator bound 3·1=3; zero matrix gives 0→0 | Pass; order-zero bound needed | Unchanged; [r7] |
| Nonconstant coefficient Check, :1198–1203 | a(x)=exp(2πi8x), u=1, s=1, p=q=∞ | Input norm 1; only output block j=3, norm 8; sup abs(a)=1 while sup abs(a′)=16π | Pass; derivative dependence substantive | Unchanged; [r7] |
| Diffeomorphism pullback and inverse, :1113–1115 | φ(x)=2x, ψ(x)=x/2; smooth u | (u∘φ)∘ψ=u; derivative bounds 2 and 1/2; Lp factors 2^(−1/p) and 2^(1/p), product 1; at p=∞ both factors 1 | Pass; inverse and orientation of map correct | Unchanged; [r7] |
| Distribution pullback agreement | δ₀ under φ(x)=2x and inverse | φ*δ₀=(1/2)δ₀; ψ*δ₀=2δ₀; composite δ₀; test-function Jacobian is 1/2, not 2 | Pass; not pushforward | Unchanged; [r7] |
| Annular dilation Check, :1192–1197 | j≥2, p=1, s=0 or 2; p=∞ | Δ_j(u(2·))=(Δ_(j−1)u)(2·); weighted factor 2^(s−1/p); p=1 gives 1/2 or 2; p=∞,s=2 gives 4 | Pass; low blocks treated separately | Unchanged; [r7] |
| Low block under dilation | u=1, p=∞, s=2 | Input and output low-block norms both 1; annular shift factor would be 4, so it is not a whole-norm equality | Pass; separate low-block control is necessary | Unchanged; [r7] |
| Positive-s modulus route, :1130–1132 | p=∞, u=exp(2πix), first difference; φ(x)=2x | Sup difference 2 abs(sin πh); after pullback 2 abs(sin 2πh); at h=1/4 values √2 and 2; 2≤2π·2·abs(h)=π | Pass; Lipschitz constant enters, and source only asserts s>0 | Unchanged; [r7] |
| B^s_(2,2)/Bessel comparison Check, :1204–1208 | Single central frequency 2^j, s=1 in Fourier weight | Besov square weight 4^j; Bessel square weight 1+4^j; j=1,2 give 4 vs 5 and 16 vs 17, ratios 5/4 and 17/16 | Pass; equivalent norms, not equality of norms | Unchanged; [r7] |
| Shear negative control, :1206–1208 | φ(x,y)=(x,y+x³); u_R(X,Y)=f(X−R)g(Y), f supported in [0,1], ‖f‖₂=‖g′‖₂=1 | det dφ=1, L² norm preserved; pulled-back x derivative has norm ≥3R²−‖f′‖₂‖g‖₂; at R=1,2 lower bounds 3−C,12−C; input H¹ norm independent of R | Pass; unbounded derivatives invalidate H¹/B¹_(2,2) boundedness | Unchanged; [r7] |
| Zero-dimensional/fiber control for transition target | ℝ⁰, F=0 or F=ℂ, A=3; identity diffeomorphism | No annular frequencies; zero fiber norm 0; scalar low block norm abs(z), multiplication gives 3abs(z); identity gives abs(z) | Pass; no frequency division at zero needed | Unchanged; [r7] |
| Euclidean identity at p=∞ | ℝ, u=1, (s₀,s₁)=(0,2), θ=1/2, q=∞ and q=2 | ‖1‖_∞=1, ‖J²1‖_∞=‖(1−Δ/4π²)1‖_∞=1; J^(−2) has kernel π exp(−2π\|x\|), mass 1, so ‖u₁‖_∞≤‖J²u₁‖_∞ and K(t,1)=min(1,t); q=∞ norm sup t^(−1/2)min(1,t)=1; q=2 norm (∫₀¹1dt+∫₁^∞t^(−2)dt)^(1/2)=√2; Besov blocks (1,0,0,…), norm 1 for every q | Pass; equality of spaces with equivalent, not equal, norms | Unchanged; [r7] |
| Euclidean identity at p=1 | ℝ, g=π^(−1/2)exp(−x²), u=J^(−2)g, θ=1/2, q=∞ | ∫g=1, kernel nonnegative with mass 1, so ‖u‖₁=1, ‖J²u‖₁=‖g‖₁=1 (numerically 1.0001 on a coarse grid); J^(−2) contractive on L¹ gives K(t,u)≥min(1,t)‖u‖₁ and the trivial decompositions give ≤, so K=min(1,t); norm 1; u=0 gives 0 | Pass | Unchanged; [r7] |
| Localized convolution estimate ‖J^sΔ_ju‖_p≤C_s2^(js)‖Δ_ju‖_p | ℝ, p=∞, Δ_ju=exp(2πi2ʲx) (Fourier point mass at 2ʲ), s=2, j=1,2,3 | Left side (1+4ʲ)=5, 17, 65; right side C₂·4, 16, 64; ratios 1.25, 1.0625, 1.0156 → C₂≥1.25, and (1+4^(−j))^(s/2) is bounded, so a finite C_s exists; the rescaled kernel argument gives the same constant for every p | Pass | Unchanged; [r7] |
| Reverse block estimate via −s | same u, s=−2 then s=2 | ‖J^(−2)Δ₁u‖_∞=1/5 ≤ C_(−2)·4^(−1) needs C_(−2)≥0.8; then 2^(js)‖Δ_ju‖_p ≤ C_(−s)‖Δ_jJ^su‖_p reads 4 ≤ 0.8·5=4 | Pass; both directions consistent | Unchanged; [r7] |
| L¹/L∞ operator bounds and Riesz–Thorin with one constant | K=π exp(−2π\|x\|) | Tonelli gives ‖K∗f‖₁≤‖K‖₁‖f‖₁=‖f‖₁; the integral norm bound gives ‖K∗f‖_∞≤‖f‖_∞; Riesz–Thorin gives ‖K∗‖_(p→p)≤1^(1−θ)1^θ=1 for every p; on f=1 the output is 1, so the bound is attained at p=∞ | Pass; constant independent of p | Unchanged; [r7] |
| Embeddings B^s_(p,1)⊂H^(s,p)⊂B^s_(p,∞) at p=∞ | u=1 at s=0; δ₀ at s=−1 and s=−2 with annular blocks of sup norm c2ʲ | u=1: all three norms 1. δ₀, s=−1: weighted blocks c (bounded) so δ₀∈B^(−1)_(∞,∞), while J^(−1)δ₀ has a logarithmic singularity at 0 and is not in L∞, so δ₀∉H^(−1,∞): the second inclusion is strict. δ₀, s=−2: Σc2^(−j)<∞ so δ₀∈B^(−2)_(∞,1), and J^(−2)δ₀=π exp(−2π\|x\|) has sup norm π, so δ₀∈H^(−2,∞) | Pass; both inclusions hold and are strict in the instances | Unchanged; [r7] |
| Weighted-sequence K-method formula (Theorem 5.6.1) at q=∞ | weights 1 and 2ᵏ, one unit coefficient at position k, θ=1/2 | K(t)=min(1,t2ᵏ); sup t^(−1/2)K=2^(k/2), the weight 2^(kθ(s₁−s₀)) predicted by the formula; at k=4 both sides are 4 | Pass | Unchanged; [r7] |
| Interpolated order | s₀=0, s₁=2, θ=1/4 | s_θ=1/2, not 3/2 | Pass | Unchanged; [r7] |
| q indices in the sandwich | N unit weighted coefficients, p=2 | ℓ¹ norm N, ℓ∞ norm 1, Hilbert norm √N; 1≤√N≤N | Pass | Unchanged; [r7] |
| Integer identification restricted to 1<p<∞ | ℝ, p=∞, f=\|x\|·χ with χ=1 near 0 | f∈W^(1,∞) with ‖f′‖_∞=1; Hf′=(1/π)log\|x²/((x−1)(x+1))\| near 0 takes the values −0.35 at x=1/2 and −2.93 at x=1/100 and is unbounded, and J¹−\|D\| is bounded on L∞, so f∉H^(1,∞) | Negative control; the restriction to 1<p<∞ is necessary; None (the clause “when p<∞” is now redundant) | Unchanged; [r7] |
| §4.2 coordinate transformation and compatible full-symbol patching | y=exp(x), principal ξ², input f=x | Pulled-back operator (−∂²+∂)f=1; direct x quantization gives 0; difference is ∂ | Pass; equal principal symbols do not imply smoothing | Unchanged; [r7] |
| Finite-rank frame transformation | Constant frame exchange S=[[0,1],[1,0]], symbol A=diag(1,2) | S⁻¹AS=diag(2,1); at v=(1,0) transformed output (2,0), not (1,0) | Pass | Unchanged; [r7] |
| Classical principal-symbol kernel and order drop | P=D²+D, Q=D², m=2 | Both leading symbols ξ²; P−Q=D has order 1 and leading value 2 at ξ=2 | Pass | Unchanged; [r7] |
| Surjective lift by frequency cutoff | Degree-2 a=ξ²; cutoff zero for norm≤1, one for norm≥2 | Lifted symbol at ξ=0 is 0, at ξ=3 is 9; degree-2 term is ξ², lower homogeneous terms 0 | Pass | Unchanged; [r7] |
| Linear quantization and continuous parameter seminorms | a=ξ, b=2ξ; a_t=(1+t)ξ on circle | Q(a+b)=3D=Q(a)+Q(b); each coefficient seminorm of Q(a_t)−Q(a_s) is abs(t−s) times that of D | Pass | Unchanged; [r7] |
| Lift with prescribed initial operator | P₀=D+2Id; a_t=(1+t)ξ; mode k=2 | Lift eigenvalue 4+2t; at t=0 it is 4, matching P₀, whereas Q(a₀) alone gives 2 | Pass | Unchanged; [r7] |
| Global class by chart compression | Identity kernel δ(x−y), chart cutoff φ=ψ=χ | χIdχ is multiplication by χ²; at χ=1/2 coefficient is 1/4; off diagonal kernel is 0 | Pass | Unchanged; [r7] |
| Full-symbol recovery via Fourier point mass | a=1+ξ, exponential exp(2ix) | (Id+D)exp(2ix)=3exp(2ix); recovered value 3 equals a(x,2) | Pass | Unchanged; [r7] |
| Displacement Fourier sign | δ₀−iδ₀′, ξ=2 | Fδ=1, Fδ′=2i; 1−i(2i)=3; reversed displacement gives −1 | Pass | Unchanged; [r7] |
| Output support iff x-support of full symbol | χ supported in K; Id tested on nonzero bump outside K; zero symbol with K empty | χf outside K=0; Id f outside K=f≠0; zero symbol/kernel/output all 0 | Pass both directions | Unchanged; [r7] |
| Proper-support truncation versus exact recovery | Full smoothing kernel exp(−(x−y)²), cutoff ρ(x−y)=1 near 0 | Kernel difference (1−ρ(z))exp(−z²) is smooth and nonzero where ρ=0; hence symbol difference is smoothing, not identically 0 | Pass | Unchanged; [r7] |
| Square partitions and principal lift | χ₁=χ₂=1/√2 | χ₁²+χ₂²=1; unsquared sum=√2 | Pass | Unchanged; [r7] |
| Finite-q smooth density | Weighted coefficients 2⁻ʲ | Tail ℓ^q norm after N is 2^(−N−1)/(1−2^(−q))^(1/q)→0; for q=2,N=0 equals 1/√3 | Pass | Unchanged; [r7] |
| Failure of full q=∞ smooth density | u=Σ₂⁻ʲ exp(i2ʲx), s=1,p=2 | All weighted blocks 1; every partial-sum error 1; smooth v has weighted blocks→0, so distance≥1 | Pass as negative control | Unchanged; [r7] |
| Little Besov vanishing-tail definition | Weighted sequences 1, 2⁻ʲ and 0 | Limits 1,0,0 respectively; first excluded, other two admitted | Pass | Unchanged; [r7] |
| Little Besov approximation error | Coefficients 2⁻²ʲ, s=1, truncation after N | Weighted supremum tail 2^(−N−1)→0; N=0 gives 1/2 | Pass | Unchanged; [r7] |
| Finite trigonometric polynomials and zero | Single frequency 2ᴶ and zero | Blocks vanish above J+1; weighted tails eventually 0 in both cases | Pass | Unchanged; [r7] |
| Little subspace closed and complete | c⁰ model; weighted tail of limit within ε of a c⁰ sequence | limsup tail≤ε for every ε>0, hence 0; truncated 2⁻ʲ sequences have sup-error 2^(−N−1) | Pass | Unchanged; [r7] |
| Isometric inclusion for chosen norm | Weighted sequence 2⁻ʲ, j≥1 | Little inherited norm=1/2=full ℓ∞ norm; unit weighted sequence would have norm 1 but is excluded | Pass | Unchanged; [r7] |
| Bessel density and bilinear duality restriction retained | p=2, u=exp(ix) on normalized circle, orders ±s | Bessel norms 2^(s/2),2^(−s/2), product 1; pairing with exp(−ix) is 1 | Pass | Unchanged; [r7] |
| Compactness and corrected (5.2) page | Circle multipliers (1+k²)^(−1/2) and 1 | First eigenvalues→0, tail norm after abs(k)≤N is (1+(N+1)²)^(−1/2); identity tail norm 1 | Pass | Unchanged; [r7] |
| Averaging in closure and actual classical class | Trivial group; reflection conjugating multiplication by x; Id | Averages T, (x−x)/2=0 and (1+1)/2=1; constant principal symbol 1 preserved | Pass | Unchanged; [r7] |
| Classical coefficient seminorm control under averaging | Two-element group, coefficients f(x), f(−x), remainder bounds C₁,C₂ | kth derivative of average is (f^(k)(x)+(−1)^k f^(k)(−x))/2; remainder norm bound (C₁+C₂)/2 | Pass | Unchanged; [r7] |
| Downstream homogeneous path use | P_t=(1+t)D+2Id, t∈[0,1], unit covector ξ=±1 | abs(σ₁P_t)=1+t≥1; seminorm difference abs(t−s); initial correction does not change ellipticity | Pass | Unchanged; [r7] |
| Angular versus Mathlib Fourier normalization | n=1, ξ=2πζ | (2π)⁻¹dξ=dζ; both integrands have exp(2πixζ)a(x,2πζ)𝓕u(ζ) | Pass; none. | Unchanged; [r7] |
| D=−i∂ and geometric/Fourier symbols | exp(ixξ), ξ=2 | ∂u=2iu, Du=2u; geometric symbol 2, Fourier symbol 2i | Pass; none. | Unchanged; [r7] |
| Formal-adjoint symbol parity | ∂, order 1 | Geometric symbol of ∂* is −ξ; (−1)¹ξ=−ξ. Fourier symbol −iξ=conj(iξ) | Pass; none. | Unchanged; [r7] |
| Bilinear distribution pairing | Constant scalar i multiplying a real test φ | Both native and Lean pairings are i∫φu; a conjugate-test pairing would give −i on test iφ | Pass; keep distinct from Hermitian pairings. | Unchanged; [r7] |
| smoothVanishingIdeal | At 0 on ℝ, f=x and g=1 | f(0)=0, g(0)=1; f∈I₀, g∉I₀ | Pass; none. | Unchanged; [r7] |
| Ideal-square iff zero value and derivative | f=x² and g=x at 0 | x²=x·x∈I₀², (f(0),f′(0))=(0,0); g′(0)=1 and g∉I₀² | Both directions discriminate; none. | Unchanged; [r7] |
| Global, finite algebraic ideal square | Discrete zero-dimensional M | Indicator e of M\{x} satisfies e²=e; every f∈Iₓ equals ef, so Iₓ²=Iₓ and differential=0 | Pass; no infinite-sum ideal product used. | Unchanged; [r7] |
| Empty/zero-dimensional geometry | Empty M; one point | Empty M has no x to instantiate; one point has I=0, cotangent=0 and derivations=0 | Pass; none. | Unchanged; [r7] |
| Cotangent equivalence and its prescribed map | ℝ at 0, class of 3x+x² | Both class-to-differential and target covector evaluate v as 3v; a rescaled map would give 6v at scale 2 | Pass; prescribed equation excludes rescaling. | Unchanged; [r7] |
| Smooth section module/scalar towers | Trivial line, f=x, s=2, x=3 | (f·s)(3)=6; with constant scalar 5, both tower orders give 30 | Pass; native section carrier retained. | Unchanged; [r7] |
| Restriction and point evaluation of section multiplication | Same section restricted to (2,4) | Restrict(fs)(3)=6=f(3)restrict(s)(3) | Pass; none. | Unchanged; [r7] |
| First-jet carrier | s=1+2x and t=1+2x+x² at 0 | Both jets are (1,2); second derivatives are 0 and 2 | Pass; first jet does not encode second derivative. | Unchanged; [r7] |
| Jet exact sequence/connection splitting | Trivial line with ∇=d+a dx | j¹s=(1,2); splitting derivative component is 2+a, projection remains 1; at a=2 gives 4 | Pass; splitting depends on connection. | Unchanged; [r7] |
| First-jet product rule | f=x, s=1+2x at 0 | d(fs)=1; f ds+s df=0·2+1·1=1 | Pass; omitting the zero-order term gives 0. | Unchanged; [r7] |
| derivationVectorField evaluation | D=∂, f=x², x=3 | (Df)(3)=6; field value 1 acts on df₃ as 6 | Pass; none. | Unchanged; [r7] |
| Smoothness of algebraic derivation field | D=x∂ on ℝ | Field x↦x is smooth; at 0 and 2 coefficients are 0 and 2 | Pass; field not merely pointwise arbitrary. | Unchanged; [r7] |
| Derivation equivalence and linearity | D=∂, scalar 5 | e(5D)=5e(D); applying to x² at 3 gives 30 on both sides | Pass; zero/rescaled arbitrary correspondences excluded. | Unchanged; [r7] |
| Derivation Lie bracket and Leibniz law | X=x∂, Y=∂ | [X,Y]=−∂; applied to x gives −1; reversing bracket gives 1 | Pass; convention fixed. | Unchanged; [r7] |
| Differential operators via iterated commutators | P=∂², multiplication by x | [P,x]=2∂, [[P,x],x]=2Id, third commutator=0 | Pass; exact order detected. | Unchanged; [r7] |
| Differential jet evaluation/local coefficients | P=∂+3, f=x² at 2 | Pf=4+12=16; first jet (4,4) gives 4+3·4=16 | Pass; not determined by derivative alone. | Unchanged; [r7] |
| Density transpose/formal adjoint | P=x∂ with dx | P*=−x∂−1; on constant 1 gives −1, whereas −x∂ gives 0 | Pass; divergence term retained. | Unchanged; [r7] |
| Principal symbol composition | ∂ followed by ∂ | Fourier symbols (iξ)(iξ)=−ξ²; ∂² has symbol −ξ² | Pass; none. | Unchanged; [r7] |
| Matrix leading commutator | A=e₁₂, B=e₂₁, order zero | AB=diag(1,0), BA=diag(0,1); commutator=diag(1,−1) | Pass; no scalar order drop for arbitrary matrices. | Unchanged; [r7] |
| Laplace-type scale and Dirac-square convention | −c∂², ξ=2, c=1 or 2 | Principal values 4 and 8; (i∂)²=−∂² gives 4 | Pass; positive scalar normalization retained. | Unchanged; [r7] |
| Bochner connection versus density adjoint | Circle weight exp(sin x)dx, scalar weighted Laplacian | Drift at 0 is −∂; Bochner coefficient is 1/2, so metric-compatibility defect at 0 is 1, not 0 | Pass; canonical-density hypothesis matters. | Unchanged; [r7] |
| Peetre finite order locally | Disjoint circles, P on component j equals ∂ʲ | Compact set meets finitely many components, order max j; over all components orders 1,2,3,… are unbounded | Pass; no global uniform order claimed. | Unchanged; [r7] |
| Peetre's locality condition | Translation Tf(x)=f(x+1) | Bump supported near 1 has Tf(0)≠0 while 0∉supp f | Negative control; hypothesis excludes translation. | Unchanged; [r7] |
| CoordinateSpace/coordinateDeriv | n=1, f=x³, lists [],[0],[0,0] at x=2 | Values 8,12,12; n=0 admits only the empty index list | Pass; no out-of-range Fin index. | Unchanged; [r7] |
| mixedDeriv ordering | a(x,ξ)=x²ξ³, one x and one ξ derivative | ∂x∂ξa=6xξ²; at (2,3) both orders give 108 | Pass; smoothness justifies permutation. | Unchanged; [r7] |
| Local symbol estimates | a=ξ, m=1 | At ξ=2, 2≤√5; first ξ derivative=1 and weight exponent (1−1)/2=0 gives 1 | Pass; no order-zero bound as ξ→∞. | Unchanged; [r7] |
| Local versus uniform symbol | a=x, K=[−R,R] | Compact x-bound R; all-x supremum ∞ | Pass; IsUniform is substantive. | Unchanged; [r7] |
| Compact spatial support | a=χ(x) with compact support; a=1 | Outside suppχ values 0; a=1 stays 1 outside every compact set on ℝ | Pass; not mere proper kernel support. | Unchanged; [r7] |
| HomogeneousSymbol scaling | ξ², m=2, t=2, ξ=1 | a(2)=4=2²a(1); degree-1 alternative gives 2 | Pass; none. | Unchanged; [r7] |
| Positive-only homogeneity | \|ξ\|, degree 1, ξ=±2 | Both values 2; extending homogeneity to t=−1 would force −2 | Pass; positivity is essential. | Unchanged; [r7] |
| Assigned value at zero | Degree-zero symbol a(ξ)=1 for ξ≠0, a(0)=0 | Values 1 away from zero and 0 at zero; smooth away, not continuous across zero | Pass; no false global smoothness. | Unchanged; [r7] |
| FrequencyCutoff bounds and denominators | Standard smooth transition h(t)/(h(t)+h(1−t)) | At t=0,1/2,1 gives 0,1/2,1; denominator positive everywhere because one argument is positive | Pass; no 0/0. | Unchanged; [r7] |
| FrequencyCutoff wrong models | Step function; smooth overshoot | Step jumps 0→1 and fails smoothness; value 3/2 fails upper bound 1 | Pass; both laws discriminate. | Unchanged; [r7] |
| ClassicalSymbol remainder equality | a=ξ²+1, terms ξ²,0,1 | N=0 remainder=ξ²+1; after N=3 remainder=(1−χ)(ξ²+1), zero at large ξ | Pass; N=0 and zero covector retained. | Unchanged; [r7] |
| Classical versus arbitrary order drop | a=⟨ξ⟩^(1/2)+1, proposed degree 1/2 classical leading term | Constant remainder behaves as 1, not O(⟨ξ⟩^(−1/2)); ratio grows as ⟨ξ⟩^(1/2) | Negative control; not every symbol is classical. | Unchanged; [r7] |
| exists_asymptoticSum, repeated orders | Orders 0,0,−1,…; first two symbols 1,2, then 0 | Choose b=3: remainders at N=0,1,2 are 3,2,0 with orders 0,0,−1 | Pass; antitone need not be strictly decreasing. | Unchanged; [r7] |
| Borel sum is not pointwise series convergence | aⱼ=(−1)ʲ⟨ξ⟩⁻ʲ, b=1/(1+⟨ξ⟩⁻¹) | At ξ=0: b=1/2; remainders 1/2,−1/2,1/2; raw partial sums 0,1,0,1,… | Pass; asymptotic remainder order, not convergence, is claimed. | Unchanged; [r7] |
| Compact parameter Borel bounds | Constant family of the preceding symbols | Same seminorms for every parameter; ξ=0 remainders remain ±1/2 | Pass; no parameter-dependent arbitrary cutoff. | Unchanged; [r7] |
| Oscillatory quantization of identity | u=exp(−x²), a=1, x=0 | Op(1)u(0)=u(0)=1 by Fourier inversion | Pass; normalization excludes zero map. | Unchanged; [r7] |
| quantizeSchwartzValue of derivative/zero | a=ξ, x=1; a=0 | −iu′(1)=2i/e; zero symbol gives integral 0 | Pass; total integral is used where convergence is proved. | Unchanged; [r7] |
| Kernel correspondence | Identity versus smooth kernel 1 | Identity kernel is δ(x−y), output u; kernel 1 gives constant ∫u | Pass; not every operator has a smooth kernel. | Unchanged; [r7] |
| Proper support and smoothing | K(x,y)=exp(−(x−y)²) on ℝ² | K(0,1)=e⁻¹ and support=ℝ²; preimage of compact {0} under first projection is {0}×ℝ, noncompact | Pass; smoothing does not imply proper support. | Unchanged; [r7] |
| Amplitude reduction | a(x,y,ξ)=y with local cutoffs | δ(x−y)y evaluates to x; reduced operator is multiplication by x | Pass; diagonal leading term correct. | Unchanged; [r7] |
| Composition convention | a=ξ, b=x | ξ#x=xξ−i; x#ξ=xξ; [D,x]=−i | Pass; sign fixed. | Unchanged; [r7] |
| Adjoint lower-order correction | P=exp(ix)D, input exp(2ix) | P*exp(2ix)=exp(ix); using conjugate leading symbol alone gives 2exp(ix) | Pass; coefficient derivative necessary. | Unchanged; [r7] |
| Ordered matrix commutator formula | p₁=p₂=ξ(A+sin x B), A=e₁₂,B=e₂₁ | Actual [P,P]=0; ordered first correction cancels to 0; reordered scalar bracket at (0,1) gives diag(−i,i) | Pass in roadmap; source error recorded. | Unchanged; [r7] |
| schwartzToSobolev native comparison | u=0; arbitrary Schwartz u | Distribution component is u, hence at u=0 evaluates every φ to 0 | Pass; real definition, not a free witness. | Unchanged; [r7] |
| exists_quantizeSobolev | χ multiplication, s=m=0 | ‖χu‖₂≤‖χ‖∞‖u‖₂; if χ=0 both sides 0 | Pass; compact local coefficients suffice. | Unchanged; [r7] |
| exists_quantizeUniformOrderZero | a=1, nonzero fiber; zero fiber | Identity operator norm 1; on the zero space norm 0 and both pairings 0 | Pass; degenerate fiber harmless. | Unchanged; [r7] |
| Necessity of uniform control for global L² | a=x, unit L² bumps supported in [k,k+1] | ‖Op(a)uₖ‖₂≥k while ‖uₖ‖₂=1 | Pass; no global bound for merely local order zero. | Unchanged; [r7] |
| Weak space versus zero-boundary closure | Constant 1 on [0,1] | Weak derivative 0; traces (1,1), so in W¹,p but not W¹,p₀ | Pass; native zero-extension result not overused. | Unchanged; [r7] |
| Critical W^(n,1) endpoint | uε(x)=φ(x/ε) | ‖∂ⁿuε‖₁=‖∂ⁿφ‖₁, ‖uε‖∞=‖φ‖∞≠0; support shrinks | Pass; continuous embedding does not give compactness at the endpoint. | Unchanged; [r7] |
| p=∞ smooth density exclusion | u=\|x\| in a chart | Weak derivative sign x; any continuous approximation to it has essential-sup error at least 1 | Pass; finite-p density restriction matters separately from q. | Unchanged; [r7] |
| Banach couple sum/intersection | A₀=A₁=ℂ, u=1 | Sum quotient norm inf(\|a\|+\|b\|)=1; intersection max norm=1; naive sum=2 | Pass; Hausdorff common ambient carrier used. | Unchanged; [r7] |
| Complex interpolation endpoint weights | Endpoint norms \|z\| and 2\|z\|, θ=1/4 | Interpolated norm of 1 is 2^(1/4), not 2^(3/4) | Pass; θ direction fixed. | Unchanged; [r7] |
| Strip decay condition and quotient norm | Equal endpoints, Fε(z)=exp(ε(z−θ)²) | Fε(θ)=1; boundary maxima→1 as ε→0; constant function has no decay | Pass; infimum gives norm 1 without an inadmissible minimizer. | Unchanged; [r7] |
| Interpolation exponent/order | p₀=2,p₁=4,θ=1/2; s₀=0,s₁=2,θ=1/4 | 1/p=3/8 so p=8/3; s=1/2, not 3/2 | Pass; none. | Unchanged; [r7] |
| Bundle coordinate-transition norms | Shear (x,y)↦(x+ky,y), det=1 | L² norm unchanged; derivative coefficients acquire k and higher-order norms depend on k | Pass; volume control alone is insufficient. | Unchanged; [r7] |
| Morrey exponent and integer margin | n=3,k=2,p=2; n=2,k=2,p=2 | Margins 1/2 and 1; second case permits β<1, not an asserted C¹ endpoint | Pass; strict endpoint qualification retained. | Unchanged; [r7] |
| Full Hölder norm | Constant 1 | Sup norm 1, Hölder seminorm 0; full norm 1 | Pass; seminorm alone is not a norm. | Unchanged; [r7] |
| Little Hölder closure | u=\|x\|^α near 0 | Quotient \|u(h)−u(0)\|/\|h\|^α=1 for every h≠0; does not tend to 0 | Pass; full and little spaces differ. | Unchanged; [r7] |
| Hölder exponent discrimination | β=α+1/2 or α−1/2, h=1/16 | Quotients \|h\|^(β−α)=1/4 or 4 | Pass; stronger exponent gives vanishing ratio. | Unchanged; [r7] |
| Zygmund distributions | δ₀ on ℝ, dyadic block constant c | ‖Δⱼδ₀‖∞=c2ʲ; s=−1 weighted value c, s=0 grows c2ʲ | Pass; distribution carrier necessary. | Unchanged; [r7] |
| Ehrling lower-order term | Nonzero constant section, ε=1/2 | 1≤1/2+Cε requires Cε≥1/2; omitting lower-order term says 1≤1/2 | Pass; none. | Unchanged; [r7] |
| Smoothing local regularization | δ₀ and Gaussian kernel | Output exp(−x²), value at 0 is 1 and all derivatives exist | Pass; smoothness is substantive. | Unchanged; [r7] |
| Ellipticity at nonzero covectors | Principal ξ² at ξ=2; zero map on ℂ | Value 4 has inverse 1/4; zero map has kernel ℂ | Pass; inverse hypothesis substantive. | Unchanged; [r7] |
| Zero-dimensional ellipticity | n=0; unequal fiber dimensions allowed | There is no ξ≠0; inverse identities are quantified over the empty set, homogeneous coefficient at 0 is 0 | Pass; no invalid rank-equality inference. | Unchanged; [r7] |
| exists_inversePrincipalSymbol | ξ=2 and t=2 for order 2 | Both products 4·1/4=1; b(4)=1/16=2⁻²b(2); at ξ=0 assigned b=0 with no inverse equation | Pass; two sides and zero exclusion checked. | Unchanged; [r7] |
| Two-sided parametrix | Circle L=1−∂², modes k=0,1,2 | L multiplier 1,2,5; inverse 1,1/2,1/5; products all 1 | Pass; none. | Unchanged; [r7] |
| Smoothing defect for noninvertible elliptic operator | Circle Δ, constant mode | Green multiplier 0 at k=0; ΔG=0=Id−Π there, not Id=1 | Pass; kernel projection retained. | Unchanged; [r7] |
| Elliptic a priori estimate | u=1 on circle | Δu=0 but ‖u‖₂=√(2π); a lower-order norm is necessary | Pass; no false coercivity. | Unchanged; [r7] |
| Solvability/cokernel orthogonality | Δu=1 on circle | ∫Δu=0 whereas ∫1=2π | Pass; orthogonality obstruction is exact. | Unchanged; [r7] |
| Overdetermined ellipticity distinction | d on scalar functions, ξ=(1,0) in ℝ² | Symbol z↦(iz,0) injective rank 1, not onto ℂ²; in ℝ¹ nonzero ξ gives an isomorphism | Pass; injective symbol not conflated with two-sided ellipticity. | Unchanged; [r7] |
| Nonlinear bootstrap before Schauder | n=4, initial exponent 3 | 1/12=1/3−1/4; 1/6=1/12+1/12; W¹,⁶ gives margin 1−4/6=1/3 | Pass; prior positive regularity is produced. | Unchanged; [r7] |
| Elliptic powers/strict positivity | L=1−∂², k=0,1,2 | Eigenvalues 1,2,5; L⁻¹ᐟ² gives 1,1/√2,1/√5; L⁰ gives 1,1,1 | Pass; no zero-eigenvalue division. | Unchanged; [r7] |
| Sobolev domains of powers | Mode k of L | L^(s/2) multiplies by (1+k²)^(s/2); its graph weight matches H^s | Pass on model; general source comparison uncertified. | Unchanged; [r7] |
| Strong parameter resolvent scaling | (ξ²−λ)⁻¹, (ξ,λ)↦(2ξ,4λ) | New value is 1/4 old value; at ξ=0, λ=−1,−2 values are 1 and 1/2 | Pass; combined homogeneity does not allow ξ-only simplification. | Unchanged; [r7] |
| Weak rescaling requires derivative control | b(r,ξ)=r/(1+rξ²), r≥0 | ∂rb(0,ξ)=1; ∂r²b(0,ξ)=−2ξ² | Pass as model; Grubb–Hansen's exact symbol indices remain unverified. | Unchanged; [r7] |
| Shifted product Laplacian | L₁ eigenvalue 2, L₂ eigenvalue 5 | L₁⊗1+1⊗L₂−1 has value 6, not 7 | Pass; shift counted once. | Unchanged; [r7] |
| Change of order/principal normalization | Scalar symbol 2ξ, ξ≠0 | New symbol (2ξ)/\|2ξ\|·\|ξ\|=ξ; at ξ=2 its squared modulus is 4=\|ξ\|², not 16 | Pass; homotopy preserves invertibility. | Unchanged; [r7] |
| Product-symbol block sign | A=[[3,−4],[4,3]] | A*A=25Id with off-diagonal 0; replacing −4 by +4 gives off-diagonal 24 | Pass; sign excludes wrong product. | Unchanged; [r7] |
| Oddness versus self-adjointness | Q=[[0,2],[0,0]], γ=diag(1,−1) | γQ+Qγ=0 but Q*=[[0,0],[2,0]]≠Q | Pass; roadmap does not infer self-adjointness from grading. | Unchanged; [r7] |
| Angular product cutoff ellipticity | Unit direction on either factor axis | One active square contribution is 1; normalized estimate is ≥1/2, not 0 | Pass; no lost axis. | Unchanged; [r7] |
| Cutoff ordering and adjunction | ε=1/4,R=4 at modes (2,16),(3,16) | Arguments 16/65<1/4 and 144/265>1/2 give cutoff values 0 and 1; shifted actions give 0 versus 2 | Pass; cannot commute cutoff through a factor blindly. | Unchanged; [r7] |
| Product homotopy compact tail | Spectral λ>R² with R=4 | λ⁻¹ᐟ²<1/4; finite eigenspace cutoff leaves operator norm ≤1/R→0 | Pass; spectral tail supplies compactness. | Unchanged; [r7] |
| Product index kernel decomposition | Factor kernel/cokernel dimensions (2,1),(3,2) | Even dimension 2·3+1·2=8; odd 2·2+1·3=7; 8−7=1=(2−1)(3−2) | Pass; both grading pieces needed. | Unchanged; [r7] |
| Equivariant/trivial/zero index | Trivial group; identity; zero Hilbert factor | Representation dimensions reduce to previous product; identity has 0−0=0; zero factor gives 0 on both sides | Pass; no nonzero-rank assumption used. | Unchanged; [r7] |
| Elliptic-complex symbol exactness | Circle de Rham symbol at ξ=1 and ξ=0 | At 1 map is multiplication by i, exact; at 0 map is 0, exactness not required | Pass; excludes zero section. | Unchanged; [r7] |
| Hodge/Green decomposition | Circle modes k=0,1,2 | Green values 0,1,1/4; ΔG values 0,1,1 equal Id−Π | Pass; harmonic zero mode retained. | Unchanged; [r7] |
| Even/odd Laplacian types | D:ℂ→ℂ², D(z)=(z,0) | D*D=1 on ℂ; DD*=diag(1,0) on ℂ² | Pass in roadmap; source's repeated D*D is a misprint. | Unchanged; [r7] |
| Quotient metric and degree | Cyclic rotations of circle, order d | Cover length 2π; quotient length 2π/d; local length element unchanged | Pass; free-action hypothesis essential. | Unchanged; [r7] |
| Normalized pullback | d=4, constant 1 | J=1/2 times pullback; cover squared norm (1/4)2π=π/2 equals quotient squared norm | Pass; factor 1/d would give π/8. | Unchanged; [r7] |
| Scalar realization/weak energy identity | exp(ikx), k=0,1,2 | Δ eigenvalues 0,1,4; q(u,u)/‖u‖²=0,1,4 | Pass; previous Friedrichs prerequisite unnecessary. | Unchanged; [r7] |
| Smooth-core completion versus H² operator domain | Fourier coefficients on circle | H¹ weight 1+k²; H² weight (1+k²)²; at k=2 these are 5 and 25 | Pass; form and operator domains are distinct. | Unchanged; [r7] |
| Reducing invariant domain and quotient modes | Rotation group order d | Invariants have k=dj; averaging other k gives 0; Δ values k²=d²j² match quotient | Pass; averaging preserves H². | Unchanged; [r7] |
| Trivial subgroup control | H={1} | d=1, J=identity, norm factor 1 and spectrum unchanged | Pass; none. | Unchanged; [r7] |
| Left inverse-pullback action | Noncommuting q=(12), r=(23) on delta functions over S₃ | q·(r·δe)=δqr=δ(123); reversing inverse convention gives δ(132) | Pass; group-action direction fixed. | Unchanged; [r7] |
| Almost conjugacy and permutation characters | Conjugate order-two subgroups of S₃ | Characters on identity, transposition, 3-cycle are 3,1,0 for both | Pass; not tested only on abelian groups. | Unchanged; [r7] |
| Transplantation of eigenspaces/resolvents | Unitary intertwiner on eigenspace λ, λ=4 | Both resolvents at −1 multiply by 1/(4+1)=1/5; form value 4‖u‖² is preserved | Pass; bounded intertwiner plus domain transport used. | Unchanged; [r7] |
| Wavefront definition | Smooth 1; δ₀ | Smooth localized Fourier transform rapidly decays, WF empty; δ Fourier value 1 in every direction, WF all nonzero covectors over 0 | Pass; zero covector excluded. | Unchanged; [r7] |
| Conormal direction control | δ(x) on ℝ² | Singular covectors are (ξ,0), ξ≠0; no pure nonzero y covector | Pass; direction is not just singular support. | Unchanged; [r7] |
| Microlocal elliptic regularity | Identity on δ; smoothing on δ | WF(Idδ)=WFδ; Gaussian smoothing has empty WF | Pass; characteristic exception needed only for nonelliptic operator. | Unchanged; [r7] |
| Pullback noncharacteristic condition | Projection (x,y)↦x | Transpose sends η to (η,0), zero only when η=0; normal set empty | Pass; δ pulls back to δ(x). | Unchanged; [r7] |
| Forbidden pullback/product | Diagonal map and opposite conormals | Transpose sends (η,−η) to 0; δ₀·δ₀ has matching opposite covectors | Negative control; hypotheses exclude undefined operation. | Unchanged; [r7] |
| Tensor product zero-factor terms | δ₀⊗1 | WF contains (ξ,0), ξ≠0; naïve product WFδ×WF1 would be empty | Pass; enlarged cone retains zero factors. | Unchanged; [r7] |
| Proper pushforward/critical points | Compact smooth density of integral 1 mapped constantly to 0 | Input WF empty; output δ₀ has all nonzero covectors; df=0 creates the required zero-preimage term | Pass; fixed support cone includes it. | Unchanged; [r7] |
| Pushforward identity/nonproper control | Identity; noncompact constant density to point | Identity pairing unchanged; latter fiber has infinite volume and noncompact support | Pass; properness on support is substantive. | Unchanged; [r7] |
| Fixed target cone in pushforward continuity | Same constant map, fixed C; u=0 versus a mass-1 bump | Individual output WFs empty versus all nonzero at 0; fixed C gives the same admissible full cone for both | Pass in roadmap; source issue recorded. | Unchanged; [r7] |
| Equivariant Fredholm local constancy | Z₂ on ℂ² by diag(1,−1), Tₜ=diag(1+t,2−t), 0≤t≤1 | Both eigenvalues stay ≥1; kernel/cokernel multiplicities in both characters stay 0. Crossing a zero eigenvalue leaves the invertible neighborhood | Pass; a common Fredholm ball, not independently chosen radii per irreducible, is used. | Unchanged; [r7] |
| Factor versus product graph domains | Fourier modes (0,k) on the two-torus | First derivative multiplier 0; product H¹ weight 1+k². Coefficients 1/k give finite L² sum but divergent H¹ sum | Pass; an amplified factor domain is larger than product H¹. | Unchanged; [r7] |
| Product graded square | Dₚ=[[0,3],[3,0]], γ=diag(1,−1), Dq=[[0,4],[4,0]] | Dₚγ+γDₚ=0, so cross terms vanish; (Dₚ⊗1+γ⊗Dq)²=(9+16)Id=25Id | Pass; required anticommutation is explicit. | Unchanged; [r7] |

[r7]: PRREVIEW-PseudodifferentialOperators~7.md

## Not verifiable

- This incremental review does not newly certify the unchanged inaccessible sources identified in r7: hormander, adams_fournier, brezis, shubin, grubb, grubb_hansen, seeley and pde_discussion. The earlier review's legal-access attempts and uncertified locators remain the evidence for those limits. No changed claim depends on a newly inaccessible source.
- Ownership against the unsupplied open IncompressibleFlows roadmap remains unverified. Its possible Besov overlap was already a service-search lead in r7; the brief supplies no checkout for it, so I did not open one or turn the lead into a second-owner finding.
- The unchanged ContactGeometry CG5 downstream reference remains unverified against its open work because no checkout is supplied. The deleted RelativisticQuantumFieldTheory references no longer require resolution in this folder. All open-head ownership checks reported above used copies supplied by the brief.

## Source issues

- **Error** in bl at Theorem 6.4.3, proof, printed p. 151: the source says each synthesized block equals the same-index input block; it should be a sum over overlapping synthesis blocks, bounded using finite overlap; affects the proof.

This source issue is carried from r7 and was rechecked at bl line 4405–4408 against the definitions at bl line 4387–4395. It does not invalidate the retraction theorem or the repaired roadmap. No new source issue was found in the changed passages.
