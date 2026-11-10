# Review of DynamicalDegreesOfRationalMaps (design, round 2)

**Verdict:** needs changes

Six findings: one P1, four P2, one P3. The seven previous repairs are present and mathematically correct. The remaining defects are independently verified below; none re-raises a finding marked not actionable. This is a design review, not a package acceptance or Lean build.

## R01 (P2) — Composition of reduced forms needs a composability hypothesis

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:625`, “For `f = [F]` and `g = [G]` reduced, `g ∘ f = [G(F)/h]`”; also `packages/DynamicalDegreesOfRationalMaps/design/plan.json`, target 6.1 (line 1249).

**Claim.** The substitution, degree inequality, and morphism equality apply to any two rational maps represented by reduced forms. Section 6.1 explicitly includes all rational maps and degree-zero forms; it has no dominance hypothesis.

**Witness.** On ℙ², F=(0,0,1) and G=(yz,xz,xy) are reduced; f is a morphism. G(F)=(0,0,0), so h=0: no projective composite. Mathlib `Birational/Composition.lean:155` requires `[f.IsDominant]`.

**Exact repair.** In the composition item require f dominant, leaving g arbitrary; state that G(F) is not identically zero before dividing by h. Keep the classification of arbitrary rational maps. State iteration of arbitrary morphisms separately using morphism composition (or `RationalMap.compHom`), so constant morphisms are retained. Update target 6.1's hypotheses and add the constant-at-a-base-point negative control. If composition beyond dominant first maps is wanted, give it the explicit hypothesis that the generic image avoids the second map's indeterminacy locus and its own construction. Do not silently use Mathlib's dominant composition for it.

**Repair test.** The displayed constant map is excluded from the rational-composition clause; its ordinary morphism iterates remain constant of degree 0 for n≥1. For f=g=σ, substitution gives xyz·(x,y,z), hence degree 1≤4. For dominant f=[x²:y²:z²] and g=σ, the reduced composite is [y²z²:x²z²:x²y²], degree 4=2·2.

## R02 (P2) — The nef and Kleiman targets, including the gap, already have an earlier owner

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:12`, “No roadmap states these over an arbitrary field”; §§3.1–3.2, lines 296–332; gap contract at line 114; `packages/DynamicalDegreesOfRationalMaps/design/plan.json:1511`.

**Claim.** This roadmap owns the general nef API and Kleiman nonnegativity; forward nef base change on an integral projective scheme is missing from its suppliers.

**Witness.** Pull request #1754, `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md:346`: nef base change for proper morphisms over Noetherian bases. Line 393: arbitrary-field Kleiman and nef-plus-ample. Merge position 261 precedes the candidate’s insertion after 341.

**Exact repair.** Import AlgebraicModuliForArithmeticGeometryPartII §1.5 for the nef carrier, restriction/pullback, and field-extension preservation/detection, and §1.7(ii) for Kleiman and nef-plus-ample. Delete their duplicate construction/theorem targets here, updating internal references and the plan. Keep only the genuinely additional comparison with the Euler-characteristic intersections of §2.2, the all-dimensional component formula, and the explicitly restricted real-class interface if needed. For nonintegral Z, apply §2.1 to the imported integral-subscheme inequality; for positive combinations of nef line bundles, expand multilinearly. Cite §0.1 of that supplier for the already-owned curve component law when treating the r=1 case of §2.1.

The gap is precise and correctly recorded, but is no longer minimal: set S=Spec K and T=Spec K′ in §1.5. Both bases are Noetherian for every field extension, and a projective X is proper. Remove this roadmap's redundant `numerical-nef-big-transfer` entry and uses, replacing them with that supplier citation; do not change StableReductionPartII's separate contract. The supplier's §1.5 does not depend on its bigness contract in §1.6. Import the arbitrary-field nef-plus-ample statement instead of preserving the present algebraically-closed-only target.

Also consume the stronger smooth-surface Hodge index statement now on main at `TauCetiRoadmap/SchemeAndStackFoundations/README.md:7601`: it already permits H²>0 without nefness, and its lines 7607–7611 give the integer-combination argument newly reproduced in §3.4. Retain this roadmap's arbitrary-field, possibly singular surface reduction and the resulting inequality; omit the duplicated smooth-surface proof step.

**Repair test.** On ℙ¹_ℂ/ℝ, the supplier gives nefness on both geometric components, degrees 1 and 1; §2.2 and the component formula recover 2=1+1. On ℙ¹×ℙ¹ over 𝔽₂, O(1,0) is nef and O(1,1) ample, so O(2,1) is ample, with square 4 and ruling degrees 1,2. On a double line, the component factor remains 2. This preserves arbitrary characteristic and nonreduced multiplicities without a second owner.

## R03 (P1) — Infinite-dimensional finrank zero is used as an actual rank

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:203`, “`K(X) ⊗_K K'` is free of rank `e(f)` over `f^*K(Y) ⊗_K K'`”; target 1.4 starts at `packages/DynamicalDegreesOfRationalMaps/design/plan.json:254`.

**Claim.** The field-extension proof uses finite rank e(f) for every dominant map between geometrically integral projective varieties, without requiring equal dimensions.

**Witness.** Take K′=K, X=ℙ², Y=ℙ¹ and the linear projection. Then K(X)=K(u,v) over K(Y)=K(u), e(f)=0, but 1,v,v²,… are linearly independent. The nonzero field is not a free module of rank zero.

**Exact repair.** Split the proof by dimension. In equal dimension, invoke §1.1's positive finite degree, extend a finite basis, and localize. In larger source dimension, use invariance of dimension under field extension and §1.1 to get e(f)=e(f_K′)=0; do not apply the finite-basis argument. Keep the general invariance statement, and record this case split and the projection negative control in target 1.4.

**Repair test.** The projection has transcendence-degree difference 1 before and after extension, so both totalized degrees are 0, with neither module rank asserted zero. For z↦z², the basis {1,z} has size 2 over K(z²) in every characteristic and gives e=2 after extension.

## R04 (P2) — The graph construction is applied outside its declared target class

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:181`, “`W_{f,g} = Γ_{(f, g∘f)}`”; §1.2 at line 159 only defines Γ for projective varieties. Target 1.3 begins at `packages/DynamicalDegreesOfRationalMaps/design/plan.json:198`.

**Claim.** Section 1.3 can apply §1.2 to a map with target Y×_K Z for arbitrary projective K-varieties Y,Z.

**Witness.** Set K=ℝ, X=Y=Z=ℙ¹_ℂ, f=g=id. Each factor is integral; ℂ⊗_ℝℂ≅ℂ×ℂ makes Y×_ℝZ nonintegral. It is not a “variety” under line 36, so §1.2 does not apply.

**Exact repair.** Define W directly as the scheme-theoretic image of the morphism (ι_U,f_U,(g∘f)_U) into X×_K Y×_K Z on a common dense domain U. Prove the same image/projection facts using an integral source and a projective separated ambient scheme; no integrality of the ambient product is needed. Alternatively generalize the basic graph construction in §1.2 to projective scheme targets, retaining integrality of Y only for function-field/alteration statements. Update target 1.3 and add the example above. Do not add geometric integrality to the roadmap's scope.

**Repair test.** The direct image for this example is the triple diagonal ℙ¹_ℂ, integral of dimension 1; all three indicated projections have degree 1. Thus the intended theorem survives while the two-component target is admitted honestly.

## R05 (P3) — Refresh the contracts against the actual pinned libraries

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/plan.json:6` and `packages/DynamicalDegreesOfRationalMaps/design/README.md:52`–73, especially the Fekete locators at line 61 and the incomplete Tau Ceti inventory.

**Claim.** The listed baseline and declaration locators describe the pinned APIs used for this review.

**Witness.** `lake-manifest.json` pins Mathlib 1b1ccf4b088b32fa3f23f2de1127433254a81e1e and Tau Ceti 2fd255d997f47c0b5d834ee416c7015d55444ce5. `Mathlib/Analysis/Subadditive.lean:44` now defines Submultiplicative.lim; Subadditive.lim is at 106. `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean:71` supplies IsAmple.

**Exact repair.** Refresh the baseline metadata and the declaration locators against these pins (the verified list below supplies the main corrections). Add the native ample predicate, the quasi-compact reduced-image instance, the general dominant-morphism function-field algebra homomorphism, and the existing curve-intersection carrier to the exact contracts. Build the new rational-map extension on those native objects. In particular use `Scheme.Hom.isReduced_image` for the reducedness input in §1.2 and retain the quasi-compact hypothesis. Keep the distinction between native curve intersections and the all-dimensional intersection polynomial supplied by CyclotomicClassGroupsAndStickelberger. Do not claim the whole intersection theory is native.

**Repair test.** `Subadditive.tendsto_lim` at line 155 still needs precisely the bounded-below divided sequence supplied in §5.1, including the harmless value u₀/0=0. For γ_f the source is reduced and the map quasi-compact, meeting `isReduced_image`. The native ample predicate uses affine nonvanishing loci and quasi-compactness; its comparison with very ample powers remains an imported theorem, not a second definition.

## R06 (P2) — Real cycle pullbacks are assigned to an integral Chow group

**Location.** `packages/DynamicalDegreesOfRationalMaps/design/README.md:444`, “`f^*(M_1 ⋯ M_k) … ∈ CH_{d−k}(X)`”; the subsection at line 432 admits line bundles or real classes. Section 2.3 extends numerical intersections, not the Chow groups or their Chern operations.

**Claim.** The displayed cycle-valued construction and degree comparison hold for real classes while taking values in integral Chow homology.

**Witness.** Take X=Y=ℙ¹, f=id, k=1 and M=√2·O(1). The numerical degree is √2. But CH₀(ℙ¹)≅ℤ, and every integral zero-cycle has integer degree; no element can satisfy the claimed comparison.

**Exact repair.** State the integral cycle formula for line bundles, then explicitly extend Chow homology to CH_*(X)⊗_ℤℝ and extend the first-Chern action, proper pushforward and degree map linearly for real classes. Give the real version that codomain, with its multilinearity and projection-formula justification from the integral version. Keep the general numerical mixed degrees and add the irrational class as a coefficient Check. Update target 4.1 in the plan consistently.

**Repair test.** For M=O(1), both integral and real versions give [point] of degree 1. For M=√2·O(1), the real version gives √2[point] of degree √2; for M=0 it gives 0. None asserts an irrational-degree integral cycle.

## Verified sound

### Previous findings checked individually

The entries below quote the repaired text in `packages/DynamicalDegreesOfRationalMaps/design/README.md`. All seven are repaired as requests from the earlier round. R02 concerns an independently resolved owner at the present open head, not a failure to apply the earlier wording repair.

| Earlier finding | Repaired passage | Status and verification |
| --- | --- | --- |
| F01 | Line 40: “a property of the pair, not of a map”; line 143: “if and only if `f` is birational in the sense of the Conventions” | Repaired. Squaring has e=2 and non-surjective pullback although Scheme.Birational ℙ¹ ℙ¹ holds. The inverse-on-dense-opens argument is valid. |
| F02 | Line 114: “For a projective integral `K`-scheme `X`, a line bundle `L` on `X` and a field extension `K'/K`” | Repaired wording: the remainder specifies nonnegative degrees on every integral curve, with exactly the forward implication; plan needs and README agree. The added converse/component argument is valid. Present minimality fails for the separate reason R02. |
| F03 | Line 281: “is integral but not normal”; “`χ_K(O_V(n)) = 2n + 1`” | Repaired. Cotangent dimension 2 at the vertex; normalization ℙ¹_K′; χ=2n+1, normalization χ=2n+2 over K; both leading coefficients 2. |
| F04 | Line 271: “The morphism `W → V` is affine”; “Being affine it is quasi-affine” | Repaired. Stacks Lemma 38.7(2), stacks-morphisms line 3865, requires quasi-affineness. ℙ¹_Q̄→ℙ¹_Q is affine and not finite. |
| F05 | Line 352: “`H` a line bundle with `(H²) > 0`”; “No positivity of `H` is assumed” | Repaired. On Bl_p ℙ², H=2L+E gives H²=3, H·E=−1; the inequality gives 1≥−3 and 4≥3. The added orthogonal-combination proof is correct; its smooth portion is now supplied on main (R02). |
| F06 | Line 543: “For `1 ≤ k ≤ d − 1`”; “For `k = 0` and `k = d` … the infimum is attained at `n = 1`” | Repaired. For d=a=2 the three k-values give constant 1, limit 2 with first term 4, and constant 4. |
| F07 | Line 444: “fulton1998 Theorem 1.4 and Proposition 2.5” | Repaired. Fulton is cited in §4.1 and recorded for that section in sources.toml; no unused §8.1 locator remains. Its text is settled uncertified. |

The repaired patterns were also checked elsewhere: map-specific birationality in §§1.2,1.4,4.5,5.3; normalization and generic multiplicities in §§2.1,2.4,4.3; nef transfer in §3.1 and subsequent reductions; surface positivity in §3.5; endpoints in §§3.6,4.4,5.1; reference keys throughout. R03 is the surviving finiteness/junk-value defect, and R04 is the surviving arbitrary-field product-domain defect.

### Adversarial mathematics, with computed values

I read all 27 targets, their API claims, all 96 planned Checks, and all Needs lines. For untouched claims I reused the earlier review's computed rows, rather than its prose assurances; I independently recomputed all 15 sampled sections, all repaired claims, every headline family, and the new counterexamples. The table groups closely related API statements on the same object to stay within the comment limit. “Retain” means no mathematical repair to that item; an ownership repair is recorded separately.

| Statement / API | Instances tried | Computed left/right values or defining tests | Result / change |
| --- | --- | --- | --- |
| Conventions; §1.1 pullback, degree, determination, composition and birationality | z², z+1 on ℙ¹; characteristic 2; linear projection ℙ²⇢ℙ¹; constant | f.comp g sends 1 to 2, reversed composition to 4; K(z)/K(z²) degree 2, separable degree 1 in char 2; composing two squares gives 4=2·2; projection finrank 0 but trdeg difference 1; constant is non-dominant | Retain definition and F01 repair; R03 must respect the 0 convention. |
| §1.2 graph, representatives, projection and inverse APIs | id, z², Cremona, projection, constant | Graphs have dimensions d,1,2,2,1; first projections have degree 1; second degrees 1,2,1,0-junk,undefined respectively; projection fibres ℙ¹; Cremona exceptional fibres ℙ¹; constant image is one point, not ℙ¹ | Correct on stated source/target class. Use native reduced-image input, R05. |
| §1.3 composite correspondence | two squarings; σ²; ℙ¹_ℂ over ℝ | W→Γ_g has degree 2, not composite degree 4; σ² graph is diagonal and all generic degrees 1; ℂ⊗ℝℂ has 2 components, triple diagonal has 1 | Projection formulas correct; construction's target scope needs R04. |
| §1.4 normalization and field extension | cuspidal cubic; ℙ¹_ℂ/ℝ; projection ℙ²⇢ℙ¹ with K′=K | Normalization degree 1; geometric identity graph has 2 components; for projection e=0 but basis family 1,v,v²,… is infinite | Invariance retained; finite-rank claim false, R03. |
| §2.1 component formula | double point; line plus disjoint point; reducible conic | Empty intersection 2=2·1; coefficient of n in (n+1)+1 is 1; conic degree 2=1+1 | Retain all-dimensional statement; cite earlier curve specialization, R02. |
| §2.2 numerical/Chow comparison | ℙ²; ℙ¹×ℙ¹; Riemann–Roch surface expression | H²=1 on both sides; h₁h₂=1 and h₁²=0; coefficient of n₁n₂ in ½(n₁D₁+n₂D₂)² is D₁D₂ | Retain; this is the needed interface, not a second definition of Chow degree. |
| §2.3 multilinear extension, pullback, field extension and real polarization | √2h₁+h₂; −H on ℙ¹; h₁+h₂; z² | Squares 2√2 and 2; summand squares 0,0; degree −1 excludes nefness; pullback of tH has degree 2t=2·t | Retain. Positive finite combinations are explicitly defined; not silently all numerically nef real classes. |
| §2.4(a,b) constants, reduction and scaling | ℙ¹_ℂ/ℝ; real pointless conic; Spec F/K | c=2, degree 2=2·1; c=1, degree 2=2; dimension 0 gives [F:K]=[F:K]·1 | Retain. Normalization precedes extraction of constants. |
| §2.4(c), repaired imperfect-field Check | K=𝔽₂(t), x²+ty²; ℙ¹_Q̄→ℙ¹_Q | Vertex cotangent dimension 2>local dimension 1; χ=2n+1; normalization has constants K(√t), c=2,m=1; pullback degree 1, original degree 2; base-changed conic cycle 2[line] | F03/F04 repaired. Ample pullback uses affine, not finite, map. |
| §3.1 nef definition, restriction, pullback and transfer | O(a,b); exceptional curve; ℙ¹_ℂ/ℝ; generic line y=tx | Ruling degrees b,a; O(1,−1) gives −1 on one ruling; pullback H has square 1 and exceptional degree 0; 2=1+1; generic line maps densely to a surface | Mathematics sound, duplicate ownership/gap R02. The higher-dimensional source in the transfer statement is necessary. |
| §3.2 nonnegativity and nef-plus-ample | h₁²; O(1,−1)²; O(1,0)+O(1,1); r=0 | 0≥0; −2<0 without nef; O(2,1) has square 4 and ruling degrees 1,2; empty product is positive length/residue degree | Correct; import earlier owner's arbitrary-field theorem, R02. |
| §3.3 Siu and volume route | A=(1,1), B=(1,0), C=(0,1), then C=(1,0); B=(1,−1); r=1 | 2≤2; 0≤2; non-nef B gives 2>0; curve case AB=BA; volume lower bound is p^(r−1)[pA^r−rqA^(r−1)B]>0 under exactly the displayed strict inequality | Retain intersection inequality. Bigness comes from the cited volume supplier, not a separate generic theory. |
| §3.4 arbitrary positive-square H and route | H=(1,1), D=(1,−1); quadric cone; Bl_p with H=2L+E, D=E,L; Bl₂ with H=E₁,D=E₂ | 0≥−4; 4=2·2; 1≥−3 and 4≥3; excluded H²=−1 gives 0<1 | F05 repaired. On an alteration both sides scale by δ²; constant-field reduction by c². |
| §3.4 orthogonal-combination calculation | x=D′A′, y=−H′A′, D′H′=0 | E·A′=xy−yx=0; E²=x²H′²+y²D′²>0 if D′²>0 and y≠0. For D″=H′²D−(DH′)H′, D″H′=0 and D″²=H′²[H′²D²−(DH′)²] | Correct algebra; the first step is already owned on main, R02. |
| §3.5 mixed Hodge and log-concavity | (1,0),(0,1); (2,1),(1,1); aH,bH; disconnected planes | 1≥0; 9≥8; s_k=a^k b^(d−k), s_k²=s_(k−1)s_(k+1); on two planes 16<25 | Retain integrality and nefness. Generic slices and multiplicity μ multiply both sides by μ². |
| §3.6 Siu for products, telescoping and positivity | (ℙ¹)³, B=h₁+h₂+h₃, A₁=h₁,A₂=h₂,C=h₃; i=r; reducible planes | 6≤4·1·2=8; x₁=1,x₂=2,x₃=2, y₁=1,y₂=2,y₃=6: 1≤2 and 2≤8/3; telescope gives 1≤4/3; i=r gives identical products; reducible test 5>2 | Retain. Denominators positive after ample perturbation; r=i=1 handled by equality. |
| §4.1 mixed degree, model independence and cycle formula | z² with (q₁,q₂)=(id,f),(f,f²); diagonal; Cremona | First model degrees (1,2); degree-2 model (2,4)=2(1,2); diagonal gives L^(d−k)M^k; Cremona product intersection 2 | Retain generic factor e. For f=id on ℙ¹ and M=√2·O(1), the claimed cycle degree is √2, whereas degrees in CH₀(ℙ¹) are integers: coefficient repair R06. |
| §4.2 endpoints, morphisms, integrality, positivity, monotonicity | Frobenius p=2,d=2; Cremona; identity with h₁ and h₁+h₂ | (1,2,4), e=4=2²; (1,2,1); nef non-big square 0, sum square 2>0; replacing h₁ by h₁+h₂ increases 0 to 2 | Retain. Polarized e=q^d requires nonzero top intersection. |
| §4.3 normalization and field invariance | cusp with O(1); ℙ¹_ℂ/ℝ; Cremona ℚ→ℂ | Pullback O(3), degree 3=3; graph cycle degree 2=1+1; Cremona degrees (1,2,1) on both fields | Retain multiplicities; no graph-of-an-integral-variety claim for arbitrary geometric base change. |
| §4.4 sub-multiplicativity | two squares; two Cremonas; Frobenius then square; k=0 | 4≤1·2·2=4; 1≤2·2·2=8; 2p=p·2; (L₁^d)=(L₁^d)(L₂^d)/(L₂^d) | Retain. On W the denominator is e(f₁)L₂^d>0 and e(f₁) cancels once. |
| §4.5 comparisons, constants and conjugacy | swap on ℙ¹×ℙ¹, ω=(1,1), ω′=(2,1); scaled curve polarization | Degrees 2,5; c=9/4, c′=9/16, C=9, ratio 5/2∈[1/9,9]; in dimension 1 ratio equals degree(ω′)/degree(ω) independently of f | Retain uniform quantifier: C chosen before f. |
| §5.1 existence, exact infimum, n=0 | degree-2 morphism of ℙ², k=0,1,2; Cremona; scaled polarization | Limits 1,2,4; C-adjusted first terms 1,4,4; Cremona roots tend to 1; u₀=k log(d−k+1)≥0; with ω=H/2 on ℙ²,id,k=1, raw degrees=1/4, C=8, adjusted degrees=2, limit=1 | Retain F06 repair. Positive integer comparison gives a uniform positive lower bound even when real degrees are below 1. |
| §5.2 dynamical degree properties | Frobenius; Fibonacci; id; squares | p^(2k)=p^(k−1)p^(k+1); (1,φ,1), φ²≈2.618≥1; id gives all 1; λ₁((z²)^m)=2^m | Retain independence, iterates, endpoints, log-concavity and λ_k≤λ₁^k. |
| §5.3 invariance | linear conjugate Cremona; cusp identity; ℙ¹_ℂ/ℝ identity | λ₁=1 before/after conjugation; 3^(1/n)→1 on both normalization models; 2^(1/n)→1 from the full two-component base-changed graph | Retain. The last is a cycle-level limit, not a newly defined integral-source map over ℂ. |
| §5.4 entropy, bounds, maximizing indices | degree-2 ℙ² morphism; Cremona; Fibonacci; n=0 | log e=log4=h=2log2; h=0; h=logφ≈0.4812 with 0≤h≤2logφ; id=f⁰ gives 0=0·h; maximizing sets {2},{0,1,2},{1} | Retain. Finite nonempty index set and λ_k≥1 ensure the logarithm is legitimate. |
| §6.1 forms, reduction and composition | common-factor identity; constant into Cremona base point; degree-2 morphism then Cremona | (x²,xy,xz)/x=(x,y,z), degree 1 not 2; substituted tuple (0,0,0), gcd 0; positive-degree example degree 4=2·2 | Classification sound; composition requires R01. |
| §6.2 projective degree formulas and exceptional divisor | Cremona; Frobenius; morphisms a=2,d=2; common-factor identity | Cremona (1,2,1), recursion 2≤2 and 1≤4; Frobenius p^k; morphism (1,2,4), nth iterate (1,2^n,4^n); identity degree 1≠2 | Retain. A^(d−1)E=0 because E maps to codimension≥2; no assertion of multiplicativity for general rational maps. |
| §6.3 standard examples | Fibonacci n=1,2,3; Cremona d=3; Frobenius p=2 | Reduced tuples [yz:xy:z²], [xyz:xy²:z³], [xy²z²:x²y³:z⁵], degrees 2,3,5; Cremona degrees 3 then 1<9; Frobenius e=2^d | Retain n≥1 in the Fibonacci tuple formula; at n=0 use the identity separately. |
| §6.4 affine extension, composition and properness | (x²,y); Hénon; (y,z,x+yz); (x,xy) | Extension [z²:x²:zy], degrees (1,2,2), iterates 2^n; Hénon inverse (y−x²,x), e=1 and degrees 2^n; three-variable map degrees 2,3,5, inverse (z−xy,x,y), e=1; (x,xy) misses (0,1) | Retain; proper dominant affine morphism is finite and surjective, so the last example is excluded. |

The five-row worked-example table agrees with these computations. No division by a zero intersection survives in §§3.3–5.1: top self-intersections of the displayed polarizations and generic degrees of equal-dimensional dominant maps are positive. Inseparable degrees are retained throughout. No algorithm, resolution-of-singularities shortcut, sorry'd data, `set_option`, copied source passage, or prohibited supplier edge was found in the design. The generic positivity duplication is R02, not a reason to reject the distinct dynamical-degrees scope.

### Source sample and manifest

All 15 seeded targets were checked against the cached legal texts. There are 15 manifest entries: 13 readable extractions and the two settled uncertified books. No extra source was needed or fetched; no manifest entry was changed. The README explicitly cites the arXiv versions read, so no claim of matching journal pagination is made. Page numbers below are those of the cited preprint/chapter; Guedj's PDF/printed distinction is specified.

| Sample | Locators opened | Result and hypotheses |
| --- | --- | --- |
| 1.2 | dinhsibony2005 line 45, p.2; dang2020 line 21, p.1; guedj2010 line 1099, PDF p.31; stacks-morphisms line 488, Lemma 6.7, p.11 | Graph and projection convention matches. Analytic sources concern complex maps; Stacks supplies the reduced scheme-image fact and the roadmap gives the algebraic construction. |
| 2.1 | stacks-varieties line 4716, Lemma 45.2, p.102; line 4784, Lemma 45.6, p.103; kleiman2005 line 3624, Lemma B.12, p.75 | Properness, coherent generic lengths, top-dimensional components and multiplicities match. |
| 2.3 | stacks-varieties line 4778, Lemma 45.5, p.103; CyclotomicClassGroupsAndStickelberger §4.3 | Additivity supplies the tensor-product extension by its universal property. Dang–Favre's numerical real spaces are not being substituted for Pic⊗ℝ. |
| 2.4 | stacks-varieties line 691, Lemma 8.6, p.15; stacks-morphisms line 3862, Lemma 38.7(2), p.85 | Algebraic closure of constants implies the required separable-closure criterion; ample pullback requires only quasi-affine. Constant-field degree and generic-length factors agree with the computations. |
| 3.3 | dang2020 line 842, Proposition 3.4.1; line 847, Remark 3.4.3, p.17; dangfavre2021 line 427, Theorem 1.2, p.12, especially line 434 | Direction and r constant agree in the integral case. Dang's unrestricted subscheme version has an error recorded below. The design's own volume route and integrality avoid it. |
| 3.5 | cutkosky2015 line 983, Theorem 6.1, pp.21–22; line 1024, Corollary 6.3, p.22; guedj2010 line 1178, Theorem 2.4, PDF p.33 | Arbitrary field and nef hypotheses match Cutkosky. Integrality is essential: his Remark 6.2 gives 16<25. The mixed Hodge form is addressed in the proof at line 994. |
| 3.6 | dang2020 line 141, Theorem 3, p.3; line 871, Theorem 3.4.4 and proof, p.18; dangfavre2021 line 427, Theorem 1.2, p.12 | Constant (r−i+1)^i and telescoping checked. The design restricts to integral supports and supplies Bertini; it does not inherit the false reducible-subscheme generality. |
| 4.1 | dang2020 line 21, p.1; dangfavre2021 lines 436,442,452, §1.3 and footnote 4, p.12; dinhsibony2005 line 61, p.2; russakovskiishiffman1997 line 499, p.13 | Target index convention and integral projection formula agree. Model-independence factor e checked independently. The real-class codomain needs R06. Fulton remains uncertified by agreement. |
| 4.4 | dang2020 lines 1272–1358, Theorem 5.2.1, pp.25–26; dangfavre2021 line 448, Theorem 1.3, p.12; truong2020 line 143, Theorem 1.1(1), p.4; dinhsibony2005 line 245, Proposition 6, p.6; silverman2014 line 387, p.9 | Dang's absolute specialization l=0 has the exact stated constant. Truong's cited item states existence, not this precise constant; it is ancillary. Normal/algebraically-closed and complex hypotheses are explicitly distinguished from the roadmap's own general proof. |
| 5.1 | dangfavre2021 line 461, p.13; dang2020 line 42, p.1; dinhsibony2005 line 256, Corollaire 7, p.7; silverman2014 line 383, Proposition 7, pp.9–10 | Existence and infimum checked. The roadmap includes C in the infimum, correcting the Dinh–Sibony proof's missing factor. Silverman's C=1 projective degree formula is not applied to arbitrary polarizations. |
| 5.3 | truong2020 lines 159–164, Theorem 1.1(2), p.4; line 1529, §6.3, p.36; dang2020 line 35, p.1; dinhsibony2005 line 256, p.7 | Birational invariance matches; arbitrary-field extension is handled by cycles when geometric integrality fails, as Truong cautions. |
| 5.4 | dinhsibony2005 line 33, Theorem 1, p.1; guedj2010 line 1178, Theorem 2.4, PDF p.33 | Max log λ matches the entropy quantity; no topological-entropy theorem over arbitrary fields is claimed. The remaining API follows from §5.2. |
| 6.2 | russakovskiishiffman1997 line 516, Lemma 4.4, pp.13–14; line 582, Lemma 4.6, pp.14–15; guedj2010 line 1141, Example 2.2, PDF p.32; silverman2014 line 350 and line 387, p.9 | Complex-source degree formulas agree. The roadmap provides its own algebraic exceptional-divisor argument, preserving inseparable degrees. R01 concerns its composition input. |
| 6.3 | silverman2014 line 358, Example 5, p.9; guedj2010 line 1272, Example 2.5, PDF p.35; russakovskiishiffman1997 line 542, p.14; truong2020 line 1542, §6.4, p.37 | Iterates and Cremona computations match. Silverman's extra regularity assertion is erroneous but is not repeated here. Frobenius follows from §6.2. |
| 6.4 | silverman2014 line 373, Example 6, p.9; dangfavre2021 line 177, Theorem 2, p.5 | The affine automorphism's Fibonacci indexing is corrected here. Dang–Favre is cited for the setting only; its characteristic-zero spectral conclusion is not asserted. Extension and properness claims have the stated elementary algebraic routes. |

Additionally re-opened: kleiman2005 Theorem B.27, line 3803, p.79, for F05; cutkosky2015 lines 994–1003 for its arbitrary-field discussion; stacks-chow Lemma 41.4, line 3995, pp.82–83, including its reduction proof; stacks-constructions Lemma 13.1, line 1267, p.28, for the generating-sections construction; stacks-morphisms Lemma 26.16, line 2198, pp.48–49, for flat base change of quasi-compact scheme-theoretic images. The old unverified Lazarsfeld and Fulton locators remain explicitly uncertified; they were not requested again.

### Pinned declarations and native objects opened

Pins actually inspected: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`, from `lake-manifest.json`. The resolver's service says it has no pinned Lake packages; that does not describe the supplied local checkout. I inspected the local files directly. Existing names were found; several recorded line numbers are stale (R05).

| Repository-relative pinned file | Declarations opened and relevant conditions |
| --- | --- |
| `Mathlib/AlgebraicGeometry/Birational/RationalMap.lean` | PartialMap:48 (dense open plus morphism); RationalMap:377 (quotient); IsOver:396; compHom:440; fromFunctionField:501 (irreducible source); equivFunctionFieldOver:562 (integral source, target locally of finite type over base); domain:575; dense_domain:586; toPartialMap:608 (reduced source, separated target). |
| `Mathlib/AlgebraicGeometry/Birational/Dominant.lean` | RationalMap.IsDominant:74; dominance of representatives, not merely existence of some field map. |
| `Mathlib/AlgebraicGeometry/Birational/Composition.lean` | comp:155, comp_id:170, composite dominance:173, comp_assoc:182, isOver_comp:193, id_comp:217. First map dominant; relevant irreducibility/nonemptiness assumptions hold for varieties. |
| `Mathlib/AlgebraicGeometry/Birational/Birational.lean` | PartialIso:39, IsOver:55, symm:88, toRationalMap:166, Birational:182. The last is `Nonempty (PartialIso X Y)` and does not mention a specified rational map. |
| `Mathlib/AlgebraicGeometry/IdealSheaf/Subscheme.lean` and `IdealSheaf/Basic.lean` | Hom.image:658, imageι:661, toImage:706, dominance instance:716; Hom.ker:691. Image is the kernel subscheme; quasi-compactness matters for its image API. |
| `Mathlib/AlgebraicGeometry/FunctionField.lean` | Scheme.functionField:37, stalk at the generic point; a field only under integrality. |
| `Mathlib/AlgebraicGeometry/Morphisms/Proper.lean` | IsFinite.iff_isProper_and_isAffineHom:97. Properness alone is not finiteness; affineness supplies the other conjunct in §6.4. |
| `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`; `Mathlib/RingTheory/MvPolynomial/Homogeneous.lean`; `Mathlib/RingTheory/Polynomial/UniqueFactorization.lean` | Proj:855; homogeneousSubmodule:87, gradedAlgebra:613; MvPolynomial.uniqueFactorizationMonoid:128 over a UFD. These support the actual projective-space carrier and reduced forms. |
| `Mathlib/Analysis/Subadditive.lean` | Subadditive generated by to_additive:33–35; Subadditive.lim:106, lim_le_div:109, tendsto_lim:155. The limit is the infimum over n≥1; convergence requires BddBelow of all divided terms. |
| `Mathlib/LinearAlgebra/Dimension/Free.lean`; `Mathlib/Data/Nat/Fib/Basic.lean`; `Mathlib/NumberTheory/Real/GoldenRatio.lean` | Module.finrank_mul_finrank:76; Nat.fib:56 (iterate of (a,b)↦(b,a+b)); Real.goldenRatio:36, (1+√5)/2. |
| `TauCeti/AlgebraicGeometry/LineBundle/Basic.lean`, `Pullback.lean`, `TensorProduct.lean`, `Dual.lean`, `Class.lean` | InvertibleSheaf:119 (full subcategory, not an ample/nef bundle); pullback:100; tensorProduct:65; dual:44; LineBundleClass:50; CommGroup instance:142. |
| `TauCeti/AlgebraicGeometry/Cohomology/Basic.lean`, `EulerCharacteristic.lean`; `LineBundle/Degree.lean` | Cohomology:61; Scheme.Modules.eulerCharBelow:105, actual alternating finrank sum; LineBundleClass.eulerDegree:130. Truncation and finite-dimensionality must be justified before interpreting them as χ. |
| `TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean`; `Scheme/FunctionField.lean`; `EllipticCurve/Isogeny/FunctionField.lean` | IdealSheafData.IsEffectiveCartier:78 (locally principal regular generator); topologicalKrullDim_eq_toNat_trdeg_functionField:101, under integral and locally finite type hypotheses at 55–56; Isogeny.fieldPullback:167, indeed only the elliptic isogeny specialization. |
| `TauCeti/AlgebraicGeometry/SchemeTheoreticImage/Basic.lean` | Scheme.Hom.isReduced_image:78, for quasi-compact f and reduced source. A native input to the graph theorem. |
| `TauCeti/AlgebraicGeometry/Morphisms/Dominant.lean`; `Scheme/BaseAlgebra.lean` | Scheme.Hom.functionFieldMap:151, id:206, comp:212, ext_of_functionFieldMap_eq:221; functionFieldAlgHom:409, id:422, comp:427. These cover general dominant morphisms; extending to rational-map classes is still new. |
| `TauCeti/AlgebraicGeometry/LineBundle/Ample.lean`; `IntersectionNumber/Basic.lean`, `FieldTower.lean` | LineBundleClass.IsAmple:71 includes CompactSpace and affine nonvanishing loci of positive powers; of_pow:96. Curve intersectionNumber:111 is eulerDegree after pullback; field-tower scaling:66. These do not supply an arbitrary-dimensional numerical intersection polynomial or a nef predicate. |

Object searches covered rational graphs, function-field homomorphisms, dominant morphisms, image reducedness, line-bundle positivity, numerical intersections, dynamical degrees, Siu and mixed Hodge inequalities. The native curve and morphism results do not duplicate the new all-dimensional graph-degree and dynamical-limit constructions. No new fully qualified Lean declaration exists in this design to collide with another package.

### Cross-roadmap resolution, ownership and supplier order

Read the board package index before searching for missing owners. Its three listed packages do not provide the algebraic-geometric objects at issue. I used `roadmaps grep` by object and `roadmaps show` to read the available open heads, including all five closest-overlap candidates. No whole existing DynamicalDegreesOfRationalMaps roadmap was found on main or at those heads; the ownership conflict is the foundational part described in R02, not the distinct dynamical-degrees roadmap.

All supplier citations were resolved afresh:

| Supplier and file | Resolved sections / evidence |
| --- | --- |
| `TauCetiRoadmap/CyclotomicClassGroupsAndStickelberger/README.md`, #1260 | §4.3, lines 795–801: Euler-characteristic mixed coefficient, coherent polynomiality, multilinearity, projection with field degree or zero on dimension drop, Cartier restriction, ample positivity and base extension. This matches the numerical convention used here. |
| `TauCetiRoadmap/ArakelovGeometryAndAbelianHeightsPartII/README.md`, #1833 | §0.1 at 152 (geometric nefness); §0.3 at 208–211 (geometric volume, nef Hilbert–Samuel and two-nef Siu over arbitrary fields). This supplier now has an accessible open head; the old reports' board-only explanation is not reused. |
| `TauCetiRoadmap/LefschetzPencilsAndVanishingCycles/README.md`, #873 | §5.1, Bertini irreducibility paragraph: generic codimension-s inverse image has geometrically irreducible support when dim image>s. Applied to very ample embeddings in §§3.5–3.6, not to arbitrary reducible cuts. |
| `TauCetiRoadmap/SchemeAndStackFoundations/README.md`, main | §§0.3:695, 0.7:923, 0.11:1129, 0.20:1448, 0.30:2050, 2.6:3554, 3.3:4917, 4.11:5820, 4.12:5915, 4.13:5945, 4.15:6037 (Nakai at 6171), 4.16:6349, 4.19:6683, 5.1:6902, 5.2:7000, 5.3:7045, 5.10:7565 (Hodge at 7601). The imported statements are present; some now point onward to native Tau Ceti APIs. |
| `TauCetiRoadmap/StableReduction/README.md`, main | Layer 2:405, especially 437–444, supplies relative ampleness, global generation, projective morphisms and relative Proj. |
| `TauCetiRoadmap/ArithmeticDynamics/README.md`, #1335 | §§0.18:1332 and 0.26:1564: binary forms, constant maps included, multiplicative degree and scheme-endomorphism comparison. This is a curve specialization, not ownership of higher-dimensional rational dynamics. |
| `TauCetiRoadmap/StableReductionPartII/README.md`, #1841 | Gap at line 68 covers integral schemes and retains arbitrary fields/inseparable covers. Its existence does not negate the independently supplied nef base-change theorem in #1754. |
| `TauCetiRoadmap/AlgebraicModuliForArithmeticGeometryPartII/README.md`, #1754 | Scope:11, §§0.1:95, 1.5:335, 1.7:387. It owns curve component lengths, general nefness and Kleiman. R02 fixes the conflict and removes a redundant gap. |

The closest open heads were compared by scope: #1754 gives R02; #1833 is already the volume supplier; #1821 HeightsRationalPointsAndObstructionsPartII owns uniform height inequalities and consumes the same volume supplier; #1796 AdicCoefficientsAndComparisonsPartII owns degree-controlled alterations and imports the ordinary de Jong theorem; JacobianChallenge's main scope and revision #1892, `TauCetiRoadmap/JacobianChallenge/README.md:20`, concern cohomology/Jacobians, not rational dynamical degrees. AlgebraicModuliForArithmeticGeometry #853 §9.10's mixed-intersection estimate is for its smooth complex effective-very-ampleness setting; it does not supply this roadmap's arbitrary-field singular mixed Hodge theorem. AbundanceStatement's characteristic-zero case is not imported as a prohibited supplier.

The supplied overlaps file lists no shared-head conflict, dropped cited id, or revision-only cited id. The live `roadmaps overlaps DynamicalDegreesOfRationalMaps` invocation says there is no such roadmap on main or in an open roadmap pull request: this candidate exists at the design stage. That is a tool-coverage limitation, not evidence against the candidate or permission to ignore the supplied overlap candidates. The current citation resolver reported no missing cross-roadmap citations; its library-name check is not available on its service host. All open-head ownership evidence above comes from the provided roadmap service, not an unlisted pull-request search.

Dependency gate output, run on the unchanged candidate:

```text
candidate: DynamicalDegreesOfRationalMaps is not in the merge order yet; checked as if placed after ArakelovGeometryAndAbelianHeightsPartII (the intake inserts it when its design is accepted)
depcheck: 224 roadmaps, 2041 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every Needs line uses native APIs, earlier local targets or permitted suppliers. R02's additional supplier is already earlier in the order (261 versus the proposed insertion after 341); there is no reverse citation from that supplier to this candidate. The gap currently has the same slug in README and plan, a named supplier and precise hypotheses, but fails minimality as explained in R02. No conditional acceptance is issued.

### Shape and package-stage checks

The README has Summary, Scope, Conventions, exact contracts, build explanation, six layers, Examples and Dependencies for each layer, downstream consumers, worked examples and references. The plan has 27 targets, eight marked definition/construction targets with API entries and at least three Checks each (counts: 6,5,3,3,5,3,3,4). Mathematical names in the design are prospective plan names, not claims of declarations in a nonexistent acceptance file. The three files contain no Lean implementation, machine-path residue, job identifiers, or pull-request-number supplier citations. Source numbering and version notes are explicit.

The headline families in the README are: graph integrality/projectivity/projections (§1.2); Khovanskii–Teissier and Siu for products (§§3.5–3.6); positivity/endpoints and base extension of degrees (§§4.2–4.3); sub-multiplicativity and comparisons (§§4.4–4.5); existence, properties, invariance and entropy (§§5.1–5.4); projective and affine degree formulas (§§6.2–6.4). All are covered by the computations above. The first two layers provide their objects, rather than arbitrary free predicates standing in for them.

There is no `Suggested.lean` in this design. Consequently package-only checks for sorried-theorem padding, one-tactic closure, declaration-name agreement, missing statable headline signatures, imports and `#check @name` binder elaboration are not applicable yet. They were not silently counted as passing. Elaboration: **not available (this lane does not elaborate; say so in the report)**. No Lean command was run and no process remains running. In particular the old review's suggestion that the pins lack an ample predicate is obsolete: the package-stage statability audit must use the native carrier listed above. Native curve intersections still do not automatically make all higher-dimensional headlines statable.

## Not verifiable

- `lazarsfeld2004`: Theorems 1.4.9, 1.6.1, 2.2.15 and Corollaries 1.4.10, 1.6.3. Settled uncertified/paywalled; no text requested. Dang cites 2.2.13 and Dang–Favre cites 2.2.15 for related Siu formulations; without the book I do not declare either locator wrong.
- `fulton1998`: Theorem 1.4 and Proposition 2.5. Settled uncertified/paywalled. The present citation is consistent with the supplier's projection-formula contract, but direct textual certification is unavailable.
- Journal pagination/renumbering versus the explicitly cited arXiv versions was not certified. All readable-source statements above refer to the exact versions recorded in the manifest.
- No Lean elaboration or tactic probe is available in this design lane. No assertion of a passing build or absence of warnings is made.
- The live overlaps command cannot address a design-only candidate; the supplied overlap report and the available candidate heads were checked instead. Ownership against open pull requests was checked where the brief supplies service access, not inferred from titles alone.

## Source issues

- **Error** in dang2020 at Proposition 3.4.1, printed page 17, and Theorem 3.4.4, printed page 18: the source says the global-ratio Siu bound holds on every closed subscheme; it should be restricted to integral supports, with componentwise bounds otherwise; affects a stated result.
- **Misprint** in dang2020 at Theorem 3.4.4 proof, printed page 18: the source says the final constant uses ambient dimension n; it should use support dimension r as in the theorem and telescoping factors; affects nothing.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the limit is the infimum of unadjusted degree roots; it should be the infimum of roots after multiplying degrees by the submultiplicativity constant; affects the proof.
- **Misprint** in dinhsibony2005 at Corollaire 7 proof, printed page 7: the source says the displayed upper bound yields λ(f)≤λ(h); it should yield λ(h)≤λ(f), before applying the reverse conjugacy; affects the proof.
- **Error** in silverman2014 at Example 5, printed page 9: the source says the Fibonacci birational map has disjoint indeterminacy loci from its inverse; it should say the loci intersect at [0:1:0]; affects nothing.
- **Misprint** in silverman2014 at Example 6, printed page 9: the source says the nth iterate of the three-variable automorphism has degree F_n; it should say F_(n+2), giving degrees 2,3,5; affects nothing.
- **Misprint** in guedj2010 at Théorème 2.4(a), printed page 31 (PDF page 33): the source says the adjacent-index inequality includes l=k; it should stop at l=k−1, since λ_(k+1) is outside the index range; affects a stated result.

For the first source issue, a directly checkable witness is X=ℙ²×ℙ² and V=(ℙ²×{q})∪({p}×ℙ²). With A=h₁+2h₂, B=2h₁+h₂ and C=h₁, both A and B are ample, A²·V=5, B·C·V=2, A·B·V=4 and A·C·V=1. The claimed bound gives 10≤8. The design avoids this error by requiring integral V and integral generic slices. For Silverman's regularity assertion, f⁻¹[u:v:w]=[vw:u²:uw]; f has base points [1:0:0],[0:1:0], and its inverse has [0:1:0],[0:0:1]. Neither source error is copied into the roadmap.
