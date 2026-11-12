# Repair of LieGroupsPartII design

All twelve findings of REV-DESIGN-LieGroupsPartII~2 were evaluated. Changes are confined to `packages/LieGroupsPartII/design/README.md`, `packages/LieGroupsPartII/design/plan.json`, `packages/LieGroupsPartII/sources.toml` and this requested report. No acceptance file exists at this design stage; none was created. No commits or external writes were made.

## R01 (P1) — applied

Obsolete compact-fixed/reductive input → full base Cartan datum, retaining its global matrix-cover model, plus compatible B. Polar structure is consumed. Section 2.6 now covers every actual Iwasawa field, including exact roots, Nplus, closed chamber, coverage and central lineality, with §2.3 input. Summary, contracts, examples and plan agree. Naturality/faithfulness use native `map_lieExp`/`lieMap_injective`, with their hypotheses.

## R02 (P1) — applied

Equality of whole Iwasawa data → conjugacy of involutions, K, negative eigenspaces, maximal abelian subspaces and positive systems. Forms and independently chosen matrix models are not equated. Sections 1.1, 1.3, 2.5, Summary and plan specify model transport and preserve B by invariance. Checks compute 1 versus 2 for the scaled forms on ℝ^×.

## R03 (P1) — applied

Unconditional product with exp(V) → product with exp(F), where F is the component-fixed part of V. Section 6.2 and plan give the corrected Lie algebra, polar description, finite averaging projection and positive-character classification. Section 6.3 explicitly uses the trivial-action specialization via §3.1. Checks include inversion and swapping component actions, scalar matrices, compact groups and tilted tori.

## R04 (P1) — applied

Arbitrary symmetric ambient X in the factorization → symmetric X whose exponential normalizes G. Definitions, closed-subgroup assertions, normality and the opposite-parabolic intersection retain their wider generality. Section 8.2 and target 8.2d require normalization only for factorization and its limit argument. Checks retain SL₂ with nontraceless X and add the rotated integral-group obstruction.

## R05 (P2) — applied

Duplicate polar construction → base LieGroups Layer 9 input and a tangent/invariant-form adapter in target 8.1c. Section 2.2 consumes base maximal-abelian conjugacy/exhaustion; duplicate targets 2.2 and 8.3e are deleted from the plan, and the latter's own headline name leaves the README. Numbered README sections remain. All target prerequisites formerly citing target 2.2 now cite LieGroups Layer 9.

## R06 (P2) — applied differently

Backward supply claims → AutomorphicFormsOnReductiveGroups §2.3a input, retaining the broader Lie-group extension here. Its actual comparison is minimal-parabolic, not arbitrary chamber-face comparison: §9.2 retains only that additional extension. Earlier AutomorphicFormsOnReductiveGroups and NoncompactQuantumSymmetry are removed as consumers, as is the indirect SmoothBanachRepresentations claim. Scope, contracts, dependencies and plan agree; no ownership move elsewhere is presumed.

## R07 (P1) — applied

Claim that Q(X) exceeds its normalizer-defined standard parabolic → Q(X₀)=Q_∅ strictly containing P, while Z_G(X₀) strictly contains MA. Section 7.3 and plan add X₁=(3,1,−4), with τX₁=(4,−1,−3), yielding Q(X₁)=P strictly inside Q_∅. Both examples retain the universal containment and N(X)=N.

## R08 (P2) — applied

Root-flow equivalences for arbitrary Y → equivalences for Y≠0; the exponential identity remains universal. The convention and §7.3 Checks explicitly give the zero-vector exception and compute I, I+e^tE₂₁ and I+e^(−t)E₁₂. The plan repeats the corrected quantifier and these controls.

## R09 (P2) — applied

Whole minimal N in the unipotent radical on every chamber face → N in the parabolic, and only N_{Π′} in the unipotent radical. Section 9.2's retained wall-comparison proof and plan make this distinction. Checks compute U_H(0)=1 versus I+E₁₂∈N, and weight 2 for diag(t,t⁻¹).

## R10 (P2) — applied

Source-title-only needs → quantified mathematical implications in both existing gap entries. README contracts now explicitly quantify connected linear algebraic H/ℝ for compactness, and connected reductive H/k with maximal split S for the ordering bijection. Slugs, supplier and section remain unchanged; the gaps document inputs of the supplied minimal comparison, not additional targets fabricated in another roadmap.

## R11 (P3) — applied

Implicit positive-rank assumptions → n≥1 on native GL Tits comparisons/counts, n≥2 on motion-group nonexamples and hyperbolic sphere/root formulas, with n=0 and n=1 exceptions. Changes cover §§1.1, 2.4, 2.6 examples, 3.3–3.4, 4.3, 5.1, 6.2, 8.1, 8.3, 9.1, worked examples and plan repetitions. Native GL contracts retain Field k and Nontrivial kˣ.

## R12 (P3) — applied

Two Checks for the §3.4 definition → three discriminating Checks, also in target 3.4. The added tilted ℝ×S¹ example has P=G for every c but different split-central lines and nonconjugate involutions. It distinguishes equality of the resulting subgroup from recovery of the datum and explains the definition's fixed-line restriction. The rank-one Check also excludes the empty-root case.

## Evidence and supplier reconciliation

The base was read on main in `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md` and `Suggested.lean`. The latter's lines 455–476 specify the finite matrix model, lines 484–500 the Cartan datum, and lines 509–588 the actual Iwasawa fields. Lines 612–618 state the polar theorem; the README's Layer 9 owns its diffeomorphism, maximal-compact and maximal-abelian applications. SU(2)'s polar collision and the circle's period therefore exclude the base datum itself. The base is not weakened.

The native declarations are global names: `map_lieExp` at `TauCeti/Geometry/Lie/Functor.lean:315` and `lieMap_injective` at `TauCeti/Geometry/Lie/Faithfulness.lean:50`. Their source and target real model spaces are finite dimensional; the second additionally requires a preconnected source. Section 1.3 uses restrictions to G⁰. These are not renamed declarations of the base roadmap. The obsolete proposed name restrictedRootSystem was also replaced by the actual Layer 9 root-system contract. The GL native definition at `TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Diagonal/TitsSystem.lean:195`, under the variables at line 58, has carrier GL(Fin(n+1),k) and assumptions Field k and Nontrivial kˣ. No all-field point-normalizer identification is claimed.

AutomorphicFormsOnReductiveGroups §2.3a, read at its supplied open head, states the minimal construction and the strict-cocharacter comparison in its paragraphs at lines 374–380. It does not state the wall case. This is why R06 is applied differently: deleting all of §9.2 would lose a genuine extension not supplied there. The general finite-cover/disconnected Lie-group extension remains here; no real-algebraic minimal construction is assigned twice. ArithmeticLocallySymmetricSpaces ALS.F.1, ALS.0.1–ALS.0.3 and MordellLawrenceVenkatesh §3.10 were read at their supplied heads. The two citation-tool leads, `LocallySymmetric.realPoints_lieGroup` and `LocallySymmetric.IsCartanInvolution.transposeInverse`, occur as planned names in ALS.F.1 and ALS.0.1; they are supplier targets, not assertions about pinned declarations. ALS.0.2 retains its restriction-of-scalars hypothesis.

RootSystems' exact supplier contracts were read on main. Native `RootPairing.Base.existsUnique_map_eq` is at `TauCeti/LinearAlgebra/RootSystem/Weyl/Bases.lean:170`; the chamber stabilizer theorem is at `TauCeti/LinearAlgebra/RootSystem/FundamentalDomain.lean:201`. Neither RootSystems' Coxeter construction nor its geometric representation becomes an input. ReductiveGroups Layer 7 and Layer 7b were checked on main: the Bruhat/Weyl double-coset theorem belongs to Layer 7, so the repeated supplier description was corrected; Layer 7b adds Levi-intersection comparisons.

Ownership was searched by objects using the roadmap grep/show tools, the board packages and the pinned Lie/matrix sources. Closest roadmaps FlagVarieties, AutomorphicFormsOnReductiveGroups, ArithmeticLocallySymmetricSpaces, ShimuraData and ReductiveGroups were read for ownership. FlagVarieties owns algebraic homogeneous-space classifications; ShimuraData owns its Hodge/relative flag comparison; neither owns the general disconnected analytic character decomposition. AdelicAlgebraicGroups §2.1 was inspected: it concerns algebraic/rational characters and adelic logarithms, whereas §6.2 here quantifies all continuous positive characters of possibly nonalgebraic disconnected Lie groups. No new generic construction is assigned to those suppliers. Ownership against open pull-request contents not provided by the supplied index/tools was not checked.

For R03 the finite-component extension is justified internally, not attributed wholesale to an unread book. Ad(L⁰) fixes V; component representatives in K_L act orthogonally. Averaging gives pr_F with kernel V₀. The split-central logarithm on L⁰ descends because compact central periods project to zero. Its projection is component invariant and zero on K_L, so it gives h:L→F. Every positive character kills compact K_L and the derived algebra and has invariant differential, hence equals exp∘ℓ∘h. The identity on exp(F) provides a central section; the kernel and polar formulas follow. The covering kernel is compact, hence contained in ⁰L, so the restricted Cartan model remains valid. The Wallach manifest locator now distinguishes its trivial-action specialization from this argument.

Legal source evidence: `borel-tits1965 line 1488` (Theorem 4.15), `borel-tits1965 line 1802` (Corollary 5.9), `borel-tits1965 line 2938` (Proposition 9.3), and `borel-tits1965 line 3775` through line 3821 (§14.7). Proposition 9.3's compactness implication has the group/subgroup quantifiers now in the gap. The §14.7 passage assumes semisimplicity; its reductive minimal extension is consumed from the named supplier, not inferred by dropping that hypothesis. `brown-rodriguezhertz-wang2022 line 124` states its connected semisimple finite-centre setting; line 138 gives the parabolic root-space formula and line 147 the exponential factors. Those passages do not justify arbitrary disconnected character formulas. The four books remain settled uncertified under their existing keys; their precise text was not read or certified, and no repeat request was made. No new source or duplicate key was added.

## Adversarial mathematics pass

The following are computations, not Lean proofs. Rows separate the targets and the changed subsidiary constructions/conventions; the target rows also test their API conclusions. All reported outputs were recomputed. The rotated-integral and diagram witnesses and small-rank counts were additionally checked by an exact rational/quadratic-field Python calculation, without downloading code.

| Statement | Instances tried | Computed values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| Group/datum conventions | GL₀; GL₂ | GL₀: Lie=0, K=G=1; GL₂: dim Lie=4=dim skew 1+dim symmetric 3 | consistent with full base | retain Hausdorff/boundaryless hypotheses |
| Root-space sign | diag(1,0), E₁₂, E₂₁ | brackets E₁₂ and −E₂₁; root values 1 and −1 | upper root positive | unchanged |
| Root-flow identity and both iff directions | Y=0, E₁₂, E₂₁ | I; I+e^(−t)E₁₂→I; I+e^tE₂₁ unbounded | zero falsifies old iff | Y≠0 |
| Langlands multiplication order | [[−2,3],[0,−1/2]] | (−I)diag(2,1/2)(I−(3/2)E₁₂) equals the original matrix | MAN sign correct | preserved |
| Cocharacter sign | GL₂ λ=diag(t,1) | upper entry tb, lower t⁻¹c; t=e^(−s) gives e^(−s)b,e^s c | same upper group | preserved on walls |
| Bruhat action convention | SL₂ reflection representative | n_s diag(h,−h)n_s⁻¹=diag(−h,h); sα=−α | inverse-root indexing agrees | preserved |
| 1.1 compatible form definition | GL₂ H=diag(1,−1), J=[[0,1],[−1,0]] | tr(H²)=2, tr(J²)=−2; Bθ(H,H)=Bθ(J,J)=2 | opposite B fails | full base retained |
| 1.1 ad adjointness API | GL₂ H,E₁₂,E₂₁ | ad H eigenvalues 0,2,−2; dθ E₁₂=−E₂₁ | real symmetric-ad and root signs agree | form fields only |
| 1.1 semisimple restriction API | su₂ with nontrivial σ | κ(J,J)=−8, −κ(J,σJ)=κ(J,J)=−8 | wrong involution excluded | no weakened base |
| 1.1 centre/period API | ℝ⋊C₂ | Lie centre=ℝ, exp injective; reflection sends exp(t) to exp(−t) | central in G⁰, not all G | plan wording clarified |
| 1.1 global-model negative controls | SU₂ nontrivial θ; circle inversion | polar(1,πJ)=−I=polar(−I,0); exp_circle(1)=0=exp_circle(0) | both violate base polar injectivity | examples corrected |
| 1.1 transport API | GL₂ g=diag(2,1/2) | (π∘c_g⁻¹)(gkg⁻¹)=π(k); transported B(H,H)=2=B(H,H) | model transported, B fixed | no equality of arbitrary choices |
| 1.2 semisimple involution conjugacy | sl₂ g=diag(2,1/2); zero Lie algebra | σ′σ(E₁₂)=16E₁₂=e^(2ad X)E₁₂ for X=diag(log2,−log2); zero case X=0 only | factor 2 and uniqueness consistent | unchanged |
| 1.3 equal split centre | ℝ^× B and 2B; tilted ℝ×S¹ | involutions equal, B(1,1)=1≠2; θ₀(1/8,0)=(−1/8,0), θ₁(1/8,0)=(−1/8,−1/4 mod ℤ) | forms cannot be conjugated | geometric conjugacy only |
| 1.3 disconnected cocycle | ℝ⋊C₂ | c_(a/4) θ₀ c_(−a/4)(t,ε)=(−t+aε,ε); K_a translation a/2 | central correction needed | retained |
| 2.1 nonreduced positives | BC₁; BC₂ | BC₁ indivisible roots ±λ, positives λ,2λ, simple λ; BC₂ short line contains ±e₂,±2e₂ | divisible root cannot be simple | unchanged |
| 2.2 supplied maximal-abelian geometry | GL₂ | I and E₁₂+E₂₁ span a maximal abelian symmetric plane of dimension 2; rotation π/4 sends its traceless line to the diagonal traceless line | original line alone was not maximal | import and corrected Check |
| 2.3 two Weyl groups | GL₁; SL₂; O(1,1) | orders (1,1), (2,2), (2,1) for (W_G,W(Σ)) | last pair differs | preserve general quotient |
| 2.4 component condition | O(1,1); compact O₄ | M meets 2 of 4 components; for O₄, 𝔞=0 and M=G meets all 2 | compact condition holds without axiom (v) | preserve distinction |
| 2.5 Iwasawa-choice conjugacy | ℝ^× scaled forms; SL₃ | g=1 carries θ,𝔞,∅ to themselves despite 1≠2 forms; SL₃ has 6 positives matched by 6 permutations | form-independent statement true | remove whole-datum equality |
| 2.6 exact roots/root spaces | GL₂; compact G | Σ={±(e₁−e₂)}, root dimensions 1,1; compact case Σ=∅, 𝔞=0 | zero weight excluded | all base fields supplied |
| 2.6 N/Nplus and complement | SL₂ | dim K+dim A+dim N=1+1+1=3; both-root impostor gives 1+1+2=4 and intersects K in dim 1 | impostor excluded | N=Nplus explicitly |
| 2.6 chamber laws/coverage | GL₂ diag(0,1); ±I | swap gives diag(1,0), root value 1≥0; root values on ±I both 0 | full scalar line required | coverage and lineality added |
| 2.6 closedness/zero case | SL₂ open ray; compact G | t=1/j tends to 0 omitted by open ray; closed ray includes it; compact chamber={0}, span=0 | open ray fails closedness/scaling | explicit closed chamber |
| 3.1 centralizer datum | GL₃ diag(1,1,−2) | centralizer GL₂×GL₁, Lie dimension 4+1=5, surviving roots ±(e₁−e₂) | restriction formula consistent | full base model inherited |
| 3.2 M,N,P definitions | SL₂; compact G | SL₂ M={±I}, dim N=1; compact M=P=G and A=N=1 | replacing M by M⁰ loses −I | unchanged extension |
| 3.3 Langlands and recovery | GL₂ upper algebra | Lie P dimension 3; B-orthogonal=ℝE₁₂ dimension 1, nilradical=ℝI+ℝE₁₂ dimension 2 | orthogonal, not nilradical | preserved |
| 3.3 compact quotient/rank boundary | SO₀(2,1); SO₀(1,1) | quotients S¹ versus point; roots multiplicity 1 versus empty | S⁰ claim false at n=1 | lower bound and exception |
| 3.4 minimal parabolic definition/conjugacy | tilted torus c=0,1; SL₂ | P₀=P₁=G although lines ℝ(1,0)≠ℝ(1,1); SL₂ point stabilizers form ℙ¹ | equality of P does not determine θ | third Check |
| 4.1 fixed points | SL₃; O(1,1) | 6 coordinate flags; O(1,1) has 2 cosets fixed by A, although W(Σ)=1 | actual quotient counts correctly | preserved |
| 4.2 Bruhat/cell dimensions | SL₃; SU(2,1); O(1,1) | SL₃ 5,6,6,7,7,8; SU(2,1) 5+2+1=8; O(1,1) two open cells dimension 1 | root multiplicities and component count agree | preserved |
| 4.3 Tits system | GL₀,GL₁,GL₂; 𝔽₂ points | Weyl sizes 1,1,2; n−1 at n=0 indexes GL₁; over 𝔽₂ diagonal point group=1, normalizer=GL₂(𝔽₂) size 6 rather than monomial size 2 | field/unit/rank bounds necessary | native hypotheses retained |
| 5.1 standard root sums | SL₃; GL₀ | four subsets give Lie dimensions 5,6,6,8; GL₀ gives single zero algebra | n=0 cannot use positive-rank count blindly | bounds propagated |
| 5.2 over-algebra classification | sl₃ wrong partial extension | [E₃₁,E₁₂]=E₃₂ outside upper+ℝE₃₁ | nonclosed candidate rejected | preserved |
| 5.3 nonnegative eigenspaces | sl₃ X=diag(1,1,−2); X=0 | simple values 0,3; zero-weight Levi dimension 4, positive part dimension 2, total 6; X=0 gives 𝔤 dimension 8 | closed-wall/zero cases agree | feeds §9.2 |
| 6.1 subgroup normalizers | SL₂; O(1,1) | SL₂ two standard groups P,G; O(1,1) N_G(𝔮_∅)=G but [G:P]=2 | component condition essential | preserved |
| 6.2 character kernel and corrected Lie algebra | ℝ⋊C₂; ℝ^× | inversion forces ℓ=−ℓ=0, F=0,V₀=ℝ, Lie⁰L=ℝ; ℝ^× F=ℝ,V₀=0, Lie⁰L=0 | old formula fails first case | corrected |
| 6.2 averaging definition | swapping action on ℝ² | ((3,1)+(1,3))/2=(2,2), residual=(1,−1); fixed+moving sum=(3,1) | neither projection 0 nor identity works | added Check |
| 6.2 homomorphism/characters | ℝ^×; compact L; tilted torus | h(−2)=log2, h((−2)²)=log4=2log2; compact h=0; tilted h(t,s)=(t,ct) | character kernels equal ker h | explicit values |
| 6.2 product/injectivity | inversion action; ℝ^× | new inversion product L×1=L; old multiplication sends every (exp(−t),exp t) to 1; ℝ^× product (−1,e^t)↦−e^t | corrected factor essential | fixed part replaces V |
| 6.2 restriction and datum dependence | compact L; tilted torus | compact ⁰L=L; tilted ⁰L={0}×S¹ for all c but exp(F) line has slope c | kernel intrinsic, complement varies | retain full model restriction |
| 6.3 parabolic Langlands specialization | GL₃ blocks 2+1; Π′=Π | F=V dimension 2,V₀=0; M dimension 3,A dimension 2,N dimension 2, total 7=dim Q; full type N=1 | component condition supplies trivial action | specialization explicit |
| 7.1 abstract conjugacy containment | GL₃ over ℝ; empty simple set | their uniquely stabilized proper subspaces have dimensions 1 versus 2, so the groups are not conjugate; S=∅ gives P_J=G and g∈G | type cannot change | preserved |
| 7.2 general parabolic correspondence | SL₃; compact G | 4 types; compact only Q=G and Lie Q=𝔤 | both directions agree | preserved |
| 7.3 dynamic definition/subgroup containment | GL₂ X=diag(1,0); X=0 | Q upper, N upper unipotent; at zero Q=G,N=1 | sign and degeneration agree | zero-vector qualification |
| 7.3 diagram controls | Aut(sl₃), X₀ and X₁ | τX₀=X₀; τX₁=(4,−1,−3)≠X₁; Q(X₀) has 2 P-cosets, Q(X₁) has 1, Q_∅ has 2 | universal containment holds | repair strict/equal relation |
| 8.1 self-adjoint predicate | GL₂; discrete powers diag(2,1/2) | GL₂ has 2 components; power subgroup has infinitely many and Lie=0 but nonidentity element diag(2,1/2) | finiteness cannot be dropped for polar structure | imported theorem |
| 8.1b intrinsic tangent definition | SL₂; upper unipotent group | tr E₁₁=1 and det exp(tE₁₁)=e^t; Lie upper group=ℝE₁₂, symmetric part=0 | tangent test distinguishes groups | adapter retained |
| 8.1c trace-form adapter | SL₂ H and J | intrinsic-to-matrix bracket [H,E₁₂]=2E₁₂; tr H²=2, tr J²=−2 | exponential/bracket/sign agreement | no duplicate polar proof |
| 8.2 dynamic bounded predicate | GL₂ X=diag(1,0), g₂₁=1 | lower entry e^t unbounded, while upper entry e^(−t)b bounded | upper triangular exactly | unchanged definition |
| 8.2b dynamic unipotent predicate | GL₂ g=diag(2,5); I+3E₁₂ | limits diag(2,5)≠I and I respectively | excludes nontrivial Levi | unchanged definition |
| 8.2c dynamic Levi predicate | GL₂ diag(1,0); X=0 | commutator with E₁₂ equals E₁₂≠0; commutator with 0 always 0 | diagonal versus all G | unchanged definition |
| 8.2d factorization and order | [[2,3],[0,5]] | diag(2,5)(I+(3/2)E₁₂)=[[2,3],[0,5]]; left factorization instead uses 3/5 | LU order correct | normalization added |
| 8.2d normalization obstruction | rotated SL₂(ℤ) | OᵀO=I; g=[[2+√3,2],[0,2−√3]], det g=1; limit l has (OlOᵀ)₁₂=3/2 not integral | l∉G, so old theorem false | new negative Check |
| 8.2d wider subgroup/intersection claims | same rotated group; skew-X GL₂ | first case intersections remain subgroups even though factorization fails; skew case Q=G,U=1, L invertible aI+bJ proper in G | separate normalization from symmetry | hypotheses split |
| 8.3 linear component predicate | O(p,q), p>q≥1; p=q≥1 | component determinant pairs take 4 values versus 2 values | last fails condition | preserved |
| 8.3b matrix minimal Langlands | SL₂; O(1,1) | SL₂ m=sgn a, A=diag(|a|,|a|⁻¹), u₁₂=b/a; O(1,1) normal P has index 2 | component premise needed | normalization follows from H₀∈Lie G |
| 8.3c matrix Bruhat uniqueness | O(1,1); Aut(sl₃) | 2 cells versus 12 cells for MAN; replacing MAN by Q(X₀) identifies representatives 1 and τ with τ not commuting with 𝔞 | MAN essential | preserved |
| 8.3d overgroup/centralizer criterion | sl₃ X,2X; O(1,1) X=0,Y | sl₃ both give block 2+1; O(1,1) equal Lie centralizers but dynamic groups G versus index-2 P | component premise separates counterexample | preserved |
| 8.3f eigenspace headline | GL₂ X=0,I; SL₃ diag(1,1,−2) | both GL₂ sums are full dim 4 and centralizers full; SL₃ sum dim 6, Levi dim 4 | central scalars harmless | retained |
| 8.3g Tits headline | GL₂; GL₀; O(1,1) | simple-set sizes 1,0; O(1,1) P normal so sPs⁻¹=P for every s | component premise required | n=0 native-index exception |
| 9.1 real-algebraic component comparison | GL₀; GL₂; SO(2,1); O(1,1) | component counts 1,2,2,4; SO(2,1) M={1,diag(1,−1,−1)} meets both; disconnected algebraic O(1,1) fails | connected algebraic H matters | bound and supplier fixed |
| 9.2 chamber-wall extension | SL₂ λ=0, diag(t,t⁻¹) | λ=0: Q=L=G,U=1; regular weight=2 gives Q upper,L diagonal,U=N | minimal and wall cases distinguished | imported minimal, new wall extension |
| 9.2 zero-weight exclusion | SL₃ λ=diag(t,t,t⁻²) | E₁₂ weight 0 survives in Levi, E₁₃,E₂₃ weight 3 contract; dim N=3 versus dim U=2 | N not wholly unipotent on wall | corrected proof |
| 9.3 complexification criterion | gl₂ trace-zero upper; scalar algebra; su₂ | trace-zero upper dim 2 misses centre although derived Borel holds; adding I gives parabolic dim 3; scalar dim 1 contains centre but no derived Borel; su₂ full algebra complexifies to sl₂ | both hypotheses necessary | preserved |
| Ordering gap | SL₂ split torus; anisotropic SO₂ | split case 2 chambers and 2 minimal parabolics; anisotropic root set empty gives 1 chamber and P=H | quantifiers include root-free case | needs expanded |
| Compactness gap | SL₂/B; SL₂/1; trivial group | SL₂/B=ℙ¹(ℝ) compact and B contains split triangular B; SL₂ unbounded via diag(e^t,e^(−t)); trivial quotient point contains 1 | implication excludes wrong input | needs expanded |

## Check outcomes and maintainer notes

The required dependency command completed with exit status 0. Its exact output was:

```text
candidate: LieGroupsPartII is not in the merge order yet; checked as if placed after MordellLawrenceVenkatesh (the intake inserts it when its design is accepted)
depcheck: 236 roadmaps, 2139 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line. No merge-order file was changed. AutomorphicFormsOnReductiveGroups and MordellLawrenceVenkatesh supply this candidate; the reverse arrows were removed. The two pre-existing ReductiveGroups gaps remain outstanding supplier contracts, now precisely quantified; this repair does not claim to have changed their supplier.

The structured plan parses and has 40 unique targets, 92 target-to-target edges, no cycle and no dangling target reference. Both gaps retain supplier, section and needs. The source manifest parses as TOML and has eight unique keys. `git diff --check` exits 0 with no output; all twelve finding sections are present and each change summary is at most 60 words. Deliverables contain no machine paths. Exact quadratic-field arithmetic confirms the rotated-integral witness, and exact integer arithmetic confirms both diagram values and the rank-0/1/2/3 counts. An initial optional SymPy probe found that SymPy was not installed; the exact check was rerun using Python's standard-library fractions and quadratic-field pairs, with no installation.

The citation resolver found no unresolved roadmap citation or Lean-name lead in the edited README. It reported that its own default host search did not inspect Lake pins; the declarations described above were independently read in the content checkout's pinned packages, whose revisions agree with `lake-manifest.json`. Source and supplier limits are recorded above rather than being presented as certification. The supplied overlap record reported no other edit to this roadmap and no dropped cited id; numbered sections were preserved. No separately listed gate failure was supplied in this job.

Lean elaboration and the mechanical `#check @name` binder comparison were not run: `Suggested.lean` does not exist in this design, no Lean file is editable here, and no elaboration command is authorized by this brief. This is not an elaboration pass. At package stage, the surviving statable headlines require their honest signatures; the full parabolic Langlands result and semisimple involution-conjugacy headline remain obligations. The removed matrix maximal-abelian headline is a base-owned result, not an acceptance omission.

Names/locations affected for consumers: planned target 8.1c retains its id and form/tangent adapter but consumes the polar construction; plan targets 2.2 and 8.3e are replaced by the base supplier, and the proposed own name `exists_conj_maximalAbelian` is absent. README §2.2 remains as the supplier application. Target 2.5 now promises involution/Iwasawa-choice conjugacy, not equality of forms/models. Target 8.2d's factorization needs normalization. Target 9.2 retains its id for the wall extension, while its former minimal comparison clauses are consumed from AutomorphicFormsOnReductiveGroups §2.3a. No existing Lean declaration was renamed or edited.
