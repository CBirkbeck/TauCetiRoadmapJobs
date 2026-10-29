# Repair report: HilbertModularVarietiesAndShimuraCurvesPartII

The eight numbered findings F01–F08 are settled individually below. The review's closing R01–R08 labels refer to those same findings. Changes are confined to this package's README, acceptance file, source manifest, top-level design gaps and this report.

## F01 (P2) — applied

Two algebraic input theorems and their two auxiliary definitions → no declarations in Suggested.lean. The module docstring lists the unavailable headline carriers. All four deleted names leave the README; §§2.2–2.3 retain their mathematical targets and Checks. The native fibre-product carrier is credited to Mathlib in scope and contracts (EqLocus.lean:45,102; BHHMS23 lines 4566, 5054).

## F02 (P2) — applied

Two nonexistent roadmap owners → an explicit exclusion of quaternionic varieties with multiple split real places and Hilbert–Siegel moduli. The roadmap service found neither proposed name on main or at open heads; the board only proposes them in design restructuring. No dependency, scope extension or merge-order edit is introduced.

## F03 (P2) — applied

A request to construct intersections → precise requests for the cyclic-quotient and common-cap sum identities, in both the README and top-level gaps. §3.2 retains ownership of global intersections, explains flat power-series transport, and cites each identity at its application. Added singleton, nodal, same-cap and non-interval Checks (EGS15 lines 3212–3283).

## F04 (P2) — applied differently

Self-dependent contracts → intrinsic type/lattice data and crystalline support. §0.2 owns weight-dependent type results and the comparison W(ρ)={σ:ρ^∨ has GK14 Hodge type σ}. The suggested same-input comparison is false under GK14’s sign convention. §§0.6, 1.4, 3.2 and 4.1 use the corrected ownership and duality; τ₀ uniqueness cites BHHMS23 line 5066.

## F05 (P3) — applied

Layer 1's §§1.2–1.7 → §§1.1–1.6. All 56 existing internal references were shifted, including sentence-final references, while source and supplier locators were preserved. The crystalline-quotient reference in the patching route now points to §1.2, its actual construction, rather than the abstract-functor section. All six headings are consecutive.

## F06 (P3) — applied

Cancellation listed among supplied section results → cancellation identified separately as gap:power-series-cancellation. The existing exact contract and its design entry remain intact. DeformationAndDerivedPatchingAlgebra §§3.1–3.4 were reopened: they cover depth, regular homological comparisons, finite actions and complete intersections, not Hamann cancellation. HAM75 line 101 supports the requested theorem.

## F07 (P3) — applied

The STACKS public locator URL ending in 090V → 05G8; the historical PDF fetch provenance remains unchanged. The duplicated EGS15 §6.2 parenthesis is deleted. STACKS line 1544 is the finite-module surjective-endomorphism result; line 12602 is Auslander–Buchsbaum. EGS15 line 1695 supplies the smallness condition. GK14's existing entry also records the newly used §2.2 locator.

## F08 (P3) — applied

An unqualified pair of socle weights → two explicit residual-inertia cases. For ω¹⁵⊕1, duality gives ω¹³⊕1 and weights Sym¹², det¹³Sym¹⁴; for ω¹³⊕1, it gives det¹⁵Sym¹², Sym¹⁴. Each has multiplicity r. The §0.2 examples and §3.4's use of W(r̄_v^∨) agree with this corrected §0.5 Check.

## Source and ownership verification

All mathematical text is paraphrased; no source extraction is copied into the package. The legal cached versions recorded in sources.toml were used, with their own pagination. No additional work or unavailable text was needed, and there is no missing-reference request. The explicit/crystalline weight comparison uses EGS15 Theorem 2.1.8 and GK14 §2.2; this report does not claim to have read Gee–Liu–Savitt separately.

| Claim used in the repairs | Evidence read | Mathematical consequence |
|---|---|---|
| The algebraic freeness statements are inputs | BHHMS23 lines 4566–4586, 4607–4661, 5054–5065 | Their proofs feed common-rank freeness and glued lattices; neither names the roadmap's end objects. |
| Type isolation | EGS15 lines 687–765, Proposition 3.5.1, pp. 14–15 | Genericity, the chosen weight and the residual representation are retained. |
| A type containing all weights | EGS15 lines 767–773, Proposition 3.5.2, pp. 15–16 | Existence holds for generic residual representations; this proposition alone does not state uniqueness. |
| Semisimple equality and uniqueness | BHHMS23 lines 5066–5069, p. 101 | The all-weight type τ₀ is used only with semisimple input. |
| Two-weight extensions | EGS15 lines 3324–3402, Proposition 10.1.11, pp. 62–63 | A nonsplit extension is required, and its lattice filtration, not just its two constituents, is retained. |
| Component ideals and their failure for arbitrary pairs | EGS15 lines 3212–3245, Example 10.1.3, Definition 10.1.4, p. 60 | Reduced unions use intersections; sum equality requires hypotheses on the intervals. |
| Cyclic quotient | EGS15 lines 3246–3262, Lemma 10.1.6, pp. 60–61 | The generator is the product of X′ coordinates between the two endpoints; its annihilator is the lower endpoint's component ideal. |
| Common-cap sum | EGS15 lines 3282–3314, Lemma 10.1.8, p. 61 | Both order convexity and the common cap are included. |
| Application of those ideal identities | BHHMS23 lines 4631–4661, Proposition 8.2.3, p. 92 | The unique-minimum extension and several-minima fibre product have their necessary annihilator inputs. |
| Intrinsic Breuil–Mézard support | GK14 lines 105–115, 244–249, 325–371, Theorem A(1), Definitions 2.2.2–2.2.6 | Support is characterized by crystalline lifts in GK14’s numerical convention; ramified fields require highest-weight embedding choices, not zero Hodge–Tate weights at the other embeddings. |
| The suggested same-input comparison fails | GK14 lines 244–249; EGS15 lines 428–433, 527–534 | EGS D(ρ)=W(ρ^∨), and its crystalline type agrees with GK14. At p=29, ρ=ω⊕1 has trivial BDJ weight, but its determinant on ω=2 is 2 rather than the 15 required by raw GK14 trivial Hodge type. Its dual has the explicit lift ε⁻¹⊕1. |
| Global weight nonvanishing | GK14 lines 1573–1580, Corollary 5.4.5, p. 33; BHHMS23 lines 4355–4361 | The local support comparison is separate from quaternionic global nonvanishing. |
| Duality convention | EGS15 lines 477–526; BDJ10 §3.2; BHHMS23 lines 4355–4361 | EGS input is dualized; the global representation uses W(r̄_v^∨). |
| Cancellation remains a gap | HAM75 lines 101–120, Theorem 4, p. 155 | The local and relative cancellation contract is retained, without pretending the supplier already states it. |
| Smallness and finite-module endomorphisms | EGS15 lines 1686–1695; STACKS line 1544 | The corrected locators refer to the facts actually used. |

The roadmap service's ownership searches covered main and the indexed open heads, by objects as well as by proposed names: tame-type isolation, capped intervals, cyclic component quotients, crystalline weights and the BDJ comparison. The same objects were searched in board packages and designs. Searches with broad words also returned unrelated cyclic-quotient and crystalline-cohomology material; these were not treated as owners of local Serre-weight statements.

LocalGaloisDeformationRingsPartII's readable board design, §“Conventions that every layer retains” and T.0, imports MP.3's tame weight set and imposes semisimplicity separately on its later presentation theorems. ModpRepresentationsOfGL2OverLocalFields MP.3 supplies the tame 1-deep recipe, not BDJ's general nonsplit extension-class condition. Therefore §0.2 here owns the comparisons involving that extended recipe. No generic tame correspondence or ring construction is duplicated here. The algebraic identities remain an explicit gap on LocalGaloisDeformationRingsPartII T.6, rather than being attributed to an invented supplier target.

F04’s proposed repair needs this correction: the true identities in the conventions used here are W(ρ)=D_EGS(ρ^∨)={σ:ρ^∨ has a GK14 crystalline lift of Hodge type σ} and W^{BT}(ρ)=W(ρ^∨). Equivalently ρ has a lift with positive weights {t_j,t_j+s_j+1} in this roadmap’s HT(ε)=+1 convention. This also corrects the same-input phrase in §0.6 and removes the untransported μ_σ(r̄_v^∨) claim from the arithmetic-functor Check. The latter still tests nonvanishing and vanishing using the actual modular weights.

The supplier roadmaps in the exact-contract headings were retrieved with `roadmaps show`. Three are board designs rather than open roadmap folders: ModpRepresentationsOfGL2OverLocalFields, LocalGaloisDeformationRingsPartII and PotentialAutomorphyInfrastructurePartII; their cited design sections were read directly. LocallyAnalyticDistributionsPartII ND.6's ownership boundary was also checked. Source and supplier locators containing 1.n were excluded from the internal renumbering. The relevant main-branch shape examples read were ComplexTori and PadicMeasuresIwasawaAlgebras; no restructuring of this README was needed.

At the pins, Mathlib's equal locus is the actual submodule of equal values (Mathlib/Algebra/Module/Submodule/EqLocus.lean:45); its kernel-of-difference comparison is line 102. It does not assert surjectivity, Noetherianity, locality or support freeness. Those hypotheses belong to §2.3's theorem. Searches in pinned Mathlib and Tau Ceti found the native algebraic carriers but no quaternionic cohomology, coefficient patching functor, big patched module, tame-type carrier or analytic-group canonical-dimension interface sufficient to state the end theorems. The headline carrier exclusions are therefore preserved, without numerical substitutes.

## Adversarial mathematics pass

Values below are recomputed from the stated definitions. The table covers each target subsection, the separate new assertions, the modified supplier contracts, and the conventions and algebraic APIs used in the repairs. Rows concerning the removed Lean declarations test the retained README mathematics; they do not reinstate acceptance-file padding. A model computation tests consistency and its stated hypothesis boundary, not the proof of a deep theorem.

| Statement | Instances tried | Computed values on the two sides / excluded model | Result | Change |
|---|---|---|---|---|
| Geometric Hecke polynomial | 𝔽₂₉, q=5, eigenvalues 2,3 | S=25, T=9; S⁻¹=7; S⁻¹T=5=2+3 and qS⁻¹=6=2·3 | Consistent | None |
| Arithmetic/geometric inversion | Same two eigenvalues | 2⁻¹=15, 3⁻¹=10; inverse roots differ from 2,3 | Direction distinguished | None |
| Parent residual ideal on r̄⊗ω | Same datum | Arithmetic twisted roots 17,21; trace 9; q⁻¹det=6·9=25 | Parent evaluation agrees | None |
| Parent geometric realization adapter | Same datum | Dualization and ε⁻¹ give 5/17=2, 5/21=3 | Correct representation restored | None |
| Hodge–Tate sign and adjoint twist | (0,−1); (2,−1) | Negation gives (0,1); ε-twist gives (3,0); determinant weights 1→3 | Consistent | None |
| Central determinant twist | Scalar z with χ(z)=2 in 𝔽₂₉ | χ⁻²=22, χ²=4; 2²·2⁻²=1 on Sym²det⁻¹ | Wrong sign excluded | None |
| Pontryagin versus integral dual | O/ϖ and O | Hom_O(O/ϖ,O)=0; Hom_O(O/ϖ,E/O)=κ; Hom_O(O,E)=E | Dual carriers distinct | None |
| Dual differential sign | O --ϖ→ O | Dual differential −ϖ; coker(ϖ)=κ=coker(−ϖ) | Consistent | None |
| Left/right group action | Noncommuting u=((1,1),(0,1)), v=((1,0),(1,1)) over 𝔽₂₉ | uv=((2,1),(1,1)); vu=((1,1),(1,2)); (uv)⁻¹=v⁻¹u⁻¹ | Opposite-algebra convention needed | None |
| Scheme-theoretic support rank | M=0; k² | Ann(0)=A, quotient 0; 0ʳ=0 for every r; dim k²=2≠1 | Zero convention and positive-rank distinction hold | Delete auxiliary Lean predicate only |
| MCM and canonical dimension conventions | O; O/ϖ; zero module | depth/dim(O)=1/1; O/ϖ=0/0; zero grade ∞ and dimension −∞ | Finite equalities exclude zero as stated | None |
| Uniform central quotient dimension | f=1,2 | dim(K₁)=4f, dim Z₁=f; quotients have dimensions 3,6 | 3f agrees | None |
| gap:tame-types image | GL₂(𝔽₂₉) | Scalar/principal/cuspidal dimensions 1,30,28; Steinberg dimension 29 excluded | Image boundary retained | Remove W-dependent demands |
| gap:single-type-rings smooth ranks | f=1,2 | One-weight relative dimensions 3+f=4,5; adding the coefficient dimension gives 5,6 | Ring part unchanged | Request exact ideal identities |
| gap:breuil-mezard-pbt support | Predicted regular weight; nonpredicted weight | μ=1 and μ=0; crystalline lifting ring nonzero and zero respectively | Intrinsic support distinguishes both | Replace recipe-dependent support |
| Ramified Hodge-type embedding convention | e=2, f=1, weight a=(1,0) | Highest-weight λ pairs (1,0),(0,0); raw GK14 Hodge–Tate pairs (2,0),(1,0), not (2,0),(0,0) | Ramified convention explicit | Add GK14 definition locator |
| gap:power-series-cancellation | A=ℤ_p⟦t⟧, B=ℤ_p; also A⟦x⟧≅W⟦X₁,X₂⟧ | First pair dimensions 3≠2; second pair dimension 3 before and 2 after cancellation | General cancellation passes dimension check | Scope wording only |
| Witt coefficient correction | 𝔽₉=𝔽₃[a]/(a²+1) | a³=−a, hence [a³]=[−a]=−[a] | Coefficient automorphism visible | None |
| §0.1 reducible generic box | p=23,29; f=1 | Upper bounds 8 and 14; admissible sets ∅ and {12,13,14} | p=23 excluded; p≥29 required | None |
| §0.1 irreducible box and degree | p=29; f=0 | r₀∈{13,14,15}; degree-zero extension is absent since f≥1 | Boundary differs from reducible box | None |
| §0.1 auxiliary place and quaternion parity | q=2; cubic F with indefinite D | Torus order (q−1)²=1; two ramified real places force an even number of finite ones | Smallness/parity retained | Locator cleanup |
| §0.2 semisimple reducible recipe | p=5, s=1 | Weights Sym¹ and det²Sym¹, dimensions 2,2 | Both subset choices represented | None |
| §0.2 irreducible recipe | p=5, s=1 | Weights Sym¹ and det Sym³, dimensions 2,4 | Antisymmetric choices differ | None |
| §0.2 extension-class condition | Très ramifiée extension of 1 by ω | W={Sym^{p−1}} has size 1; the trivial weight is absent | Semisimplification alone fails | New comparison Check includes it |
| §0.2 split cyclotomic boundary | p=5, ρ=ω⊕1 | (t,s)=(0,0),(0,4),(1,2); weights 1,Sym⁴,det Sym²; count 3 | Both exceptional endpoint weights retained | Explicit negative control |
| §0.2 generic cardinality | f=1,2 | 2¹=2, 2²=4 | No embedding discarded | None |
| §0.2 reducible boundary s=p−3 | p=5, inertia ω³⊕1 | Sym²,det³,det³Sym⁴; dimensions 3,1,5; count 3 | Strict two-weight interval necessary | None |
| §0.2 twist law | p=29, inertia ω¹³⊕1, twist ω⁻¹³ | det exponents 0−13≡15 and 13−13=0 mod 28 | Twisted set {det¹⁵Sym¹²,Sym¹⁴} | Reused in §0.5 |
| §0.2 isolating type, semisimple | p=29, W={Sym¹²,det¹³Sym¹⁴} | Isolating intersection sizes 1; all-weight intersection size 2 | τ₀ cannot replace an isolating type | Owned here |
| §0.2 isolating type, nonsplit | W(ρ)={σ}⊆{σ,σ′}=W(ρ^ss) | {σ}∩{σ}= {σ}, cardinality 1; no extra constituent survives | Isolation passes to the subset | Owned here |
| §0.2 containing type | Generic semisimple f=1,2 | All-weight constituent counts 2,4; a singleton isolation supplies only 1 | Equality needs the containing type | Owned here |
| §0.2 τ₀ uniqueness boundary | f=1, p=29 | dim reduction=13+15=28; scalar dimension 1, principal-series dimension 30 | Wrong type models excluded | Cite BHHMS23 line 5066 |
| §0.2 two-weight extension type | 0→σ′→θ→σ→0, dimensions 15,13 | dim θ=28; JH intersection size 2; cosocle θ has one weight | Filtration realizes the extension | Owned here |
| §0.2 split-sum negative control | σ⊕σ′ with the same dimensions | Dimension still 28, but cosocle contains both weights, unlike θ | Constituents alone insufficient | Added Check |
| §0.2 crystalline comparison | Très ramifiée ρ and split ρ=ω⊕1 | Sets of σ with GK14 crystalline lifts of ρ^∨ have sizes 1 and 3; trivial-type ring for ρ^∨ is 0 for the former and nonzero for the latter | Comparison follows extension data | Added target and Check |
| §0.2 raw GK14 input negative control | p=29, ρ=ω⊕1, σ trivial | det ρ on ω=2 is 2; raw GK14 trivial type requires 2⁻¹=15; ρ^∨ lifts as ε⁻¹⊕1 with determinant 15 | Same-input comparison false; dual-input comparison true | F04 applied differently |
| §0.3 square-root central correction | Compatible central characters, identity correction | ψ⁻¹c_σ⁻¹=1 gives residual-trivial square root θ=1; θ²=1 | Identity normalization fixed | None |
| §0.3 covariant multiplicity functor | Zero coefficient; a split two-summand coefficient | M(0)=0; two contravariances give forward maps; rank 1+1=2 on a split free model | Variance/additivity consistent | None |
| §0.4 finite-level control | Regular module of C₂₉ in characteristic 29 | Invariants dimension 1; total dimension 29; constant invariant vector is nonzero | No averaging by 29 | None |
| §0.5 corrected modular socle | r̄_v inertia ω¹⁵⊕1 | −15≡13 mod 28; dual weights Sym¹²,det¹³Sym¹⁴ | Correct first witness | Specify residual datum |
| §0.5 alternate residual datum | r̄_v inertia ω¹³⊕1 | −13≡15; twist of W(ω¹³⊕1) has determinant exponents 15,0 | Weights det¹⁵Sym¹²,Sym¹⁴ | Add second witness |
| §0.5 weighted/unweighted π | Wrong away weight; nonzero matched weight | Wrong-weight space 0; matched multiplicity r≥1; at f=1 canonical dimension 1 rather than finite-dimensional value 0 | Nonvanishing not arbitrary | None |
| §0.6 global weight nonvanishing | Two local multiplicities (1,1),(1,0) | Products 1 and 0; associated global weight spaces nonzero and zero | Both directions agree | Support ownership clarified |
| §0.7 doubling discriminant | q=2, eigenvalue ratios 3,2 over 𝔽₂₉ | 3⁻¹=10; (2−3)(2−10)=8≠0; ratio 2 gives 0 | Auxiliary hypothesis necessary | None |
| §0.7 excluded special component | Same q | Ratios q,q⁻¹ are 2,15; ratio 3 is neither | New-at-w₁ excluded | None |
| §1.1 patched ring variable counts | (f,|S|,q)=(1,2,1),(2,1,2) | R∞/S∞ counts 10/8,9/5; dimensions 11/9,10/6; differences 2,4 | 2f formula correct | Renumber only |
| §1.1 local/global count identity | f=1,|S|=2,q=1; f=2,|S|=1,q=2 | (3+3f)+4(|S|−1)+q−f=6+4=10; 9+0=9 | Empty-variable case valid | Renumber only |
| §1.1 determinant directions | f=2 | Unrestricted determinant f+1=3; fixed Hodge type adds 1 | Two assertions distinguished | Renumber only |
| §1.2 determinant constraint | λ=(1,0),(2,0),(2,−1) | Weight sums 1,2,1; middle quotient 0; ε shifts (2,−1)→(3,0), sum 3 | Nonvanishing/type boundaries agree | Renumber only |
| §1.2 type dimension | f=1,|S|=2,q=1 | 1+(3+1)+4+1−1=9=4·2+1 | Global type dimension matches S∞ | Renumber only |
| §1.3 abstract patching functor | Zero functor; regular A=O⟦t⟧ | Zero values rank 0 fail minimality; A² depth 2, rank 2; A⊕A/(t) depth 1<2 | Definition excludes wrong MCM value | Renumber only |
| §1.3 torsion-freeness | A/(p)⊕A | p·(1,0)=0 with (1,0)≠0 | Not an integral type-lattice value | Renumber only |
| §1.4 arithmetic patching functor | M∞(0); one or two surviving away weights | 0; fibre dimensions 1 and 1+1=2 | Isolating-type hypothesis essential | Consume §0.2 |
| §1.4 scheme-theoretic support | A=𝔽[ε]/ε² versus A/(ε) | ε·1=ε≠0 versus 0; both have one field point | Pointwise support insufficient | Renumber and quotient locator |
| §1.5 residual fibre | Support-free rank r=2; zero weight module | Both Hom-dual and patched fibre dimensions 2; nonmodular values 0 | Naturality/vanishing consistent | Renumber only |
| §1.6 big module | f=1; σ of multiplicity 2 | dim K₁/Z₁=3, residual canonical dimension 1; Hom fibre dimension 2=2 | Residual module not finite-dimensional | Renumber only |
| §2.1 CM condition | Λ=O⟦T⟧, Λ,Λ/ϖ,Λ/(T) | (j,δ)=(0,2),(1,1),(1,1) | Single Ext degree and depth agree | None |
| §2.1 non-CM direct sum | Λ⊕Λ/ϖ | Ext⁰ and Ext¹ both nonzero; depth 1<δ=2 | CM condition distinguishes model | None |
| §2.1 grade of an extension | 0→Λ --ϖ→Λ→κ⟦T⟧→0 | j endpoints 0,1; middle j=0=min(0,1); a zero endpoint gives min(∞,j)=j | Correct minimum rule | None |
| §2.2 extension freeness | A=𝔽₂[ε]/ε², N=(ε), M=A, r=1 | Ann(M/N)/Ann M=(ε)/0≅𝔽₂=A/Ann N; one generator; rank M=1 | Positive model | Remove Lean theorem only |
| §2.2 failed generation | M=𝔽₂², N=𝔽₂ | Minimum generators 2>r=1; annihilator quotient 0≠𝔽₂ | Hypotheses discriminate split extension | None |
| §2.2 support-rank transport API | k² under an invertible basis swap; zero | Annihilator 0 and rank 2 on both sides; zero quotient A/A=0 | Rank/isomorphism and zero APIs agree | Remove auxiliary Lean definition |
| §2.3 native fibre-product carrier | f=g=id_k; f=g=0 | Equal locus diagonal of dimension 1; zero-map equal locus k² dimension 2 | Equality and kernel descriptions agree | Credit native carrier |
| §2.3 universal property and projections | Compatible pair (a,a); surjective identity maps | Unique diagonal pair (a,a); each projection has image k and kernel 0 | Map domains and compatibility fixed | None |
| §2.3 iff, positive branch | A=k⟦x,y⟧/(xy), M₁=A/(x),M₂=A/(y),M=k | Ann sum (x,y)=Ann k; intersection 0; fibre product A rank 1 | Both sides true | Remove Lean theorem only |
| §2.3 iff, negative branch | A=k⟦t⟧, M₁=M₂=A,M=k | Ann sum 0≠(t); pairs (a,b)=(a,a+tc), hence pullback A² rank 2 | Both sides false for rank 1 | None |
| §2.4 central regular variable | A=O⟦T,x⟧, M=A,A/(x) | For A: grades 0→0, dimensions 3→2; for A/(x): grades 1/0, dimensions 2/2 | Shift has correct direction | None |
| §2.4 growth formula | Ω=k⟦T⟧, n=2,3; n=1 excluded | Lengths 2,3; log₂2=log₃3=1; log base 1 undefined | n≥2 retained | None |
| §2.4 ramified coefficient reduction | O=ℤ₃[π]/(π²−3) | O/(π)=𝔽₃; O/(3)=𝔽₃[π]/π² with nonzero square-zero π | ϖ cannot be replaced by p | None |
| §2.4 p=2/trivial group | O=ℤ₂, K=1, M=𝔽₂ | Integral/residual grades 1/0; dimensions 0/0 | Coefficient shift survives | None |
| §2.5 restriction depth | A=O⟦T⟧,B=A⟦y⟧; M=B,B/(y) | Depths 2<3 for B; 2=2 for B/(y), finite over A | Inequality and finite equality distinguished | None |
| §2.6 miracle flatness | A=O⟦T,x⟧; M=A/(T),A/(ϖ) | Grades 1=1 and 1≠0; first is O⟦x⟧, second has nonzero ϖ-torsion | Both directions discriminated | None |
| §3.1 maximal CM on support | k⟦x,y⟧/(x) | Depth 1=support dimension 1; ambient dimension 2 | Support ring is essential | Renumber dependencies only |
| §3.2 common rank | O⟦x,y⟧/(xy−p), rank r=1,2 | Branch ranks 1,1 and 2,2 | Rank is common, not forced to 1 | Type ownership corrected |
| §3.2 union ideal definition | A=k⟦x,y⟧/(xy), selected V(x), both branches, none | Ideals (x),0,A; quotients k⟦y⟧,A,0 | Intersection and empty conventions correct | Clarify ownership |
| §3.2 capped interval definition | Labels ∅,{1},{2},{1,2} | { {1},{1,2} } convex with one cap; {∅,{1,2}} omits two intermediate labels | Plausible non-interval excluded | Add local explanation |
| §3.2 cyclic quotient identity | f=1, F(∅,{1}) | I_F=0, I_{F^×}=(x); Ann(x)=(y); (x)≅A/(y), generator x | Lower endpoint ideal correct | Gap identity and Check |
| §3.2 cyclic quotient degenerate interval | F(J,J) | F^×=∅; I_{F^×}/I_F=A/I_{{J}}, generator 1 (empty product) | No division by a coordinate | Added boundary Check |
| §3.2 common-cap sum identity | A=k⟦x₁,y₁,x₂,y₂⟧/(x₁y₁,x₂y₂), caps {1,2} | (x₁)+(x₂)=(x₁,x₂)=I_{{{1,2}}} | Sum identity applies | Gap identity and Check |
| §3.2 non-interval negative control | Replace second interval by { {1,2},∅ } | Sum (x₁,x₂y₁); intersection-label ideal (x₁,x₂); x₂ survives after x₁=y₁=y₂=0 | Strict containment, not equality | Added Check |
| §3.2 flat base change and pullback | Add t; then compare quotient by (x,y) | Ann_{A⟦t⟧}(x)=(y); after quotient x=0 and its generated ideal is 0 | Flatness is used, arbitrary quotient invalid | Added transport explanation |
| §3.2 extension/fibre-product induction | Rank r=2; unique minimum; at least two minima | Cyclic-quotient rank 1 yields endpoint module ranks 2; same-cap sum gives pullback support rank 2 | Both needed algebraic inputs owned | Cite Lemmas 10.1.6 and 10.1.8 |
| §3.2 lifting a basis modulo p | Kernel C finite, pC=C | C/pC=0; Nakayama gives C=0 | Torsion-free lifting step valid | None |
| §3.3 disjoint locally algebraic types | Multiplicities 1,2, r=2 | Product-support ranks 2,4 | Local freeness need not be constant on disconnected support | Renumber dependencies only |
| §3.4 projective lift and K₁ invariants | r=2, two modular weights | Hom(P_σ,π) dimension 2; D₀² has each modular socle weight twice | Same r as §3.2 | Renumber dependencies only |
| §4.1 adjoint/glued lattice ranks | dim P=d, f=1,2 | P̃ rank d; adjoint tensor 3d; L ranks d,4d,7d | No double-adjoint summand | τ₀ ownership corrected |
| §4.1 two different reductions | R′⊂R of full rank 3d | dim R′/pR=d; dim R′/pR′=3d; difference 2d | Reductions cannot be conflated | None |
| §4.1 N_j exact sequence | rank T=3e, rank L_{j−1}=d′ | rank N_j=3e+d′; multiplication by p has kernel 0 over O | Correct injection and target | None |
| §4.2 Loewy bound | Permitted simple-socle quotient; Q=σ | Permitted lengths 3 or 2; for Q=σ the multiplicity in Q/soc Q is 0≠1 | Hypothesis (b) nonvacuous | None |
| §4.3 minimal generation | r=2 | Quotient fibre dimension 2 gives ≥2 generators; induction gives ≤2 | Minimum exactly 2 | Renumber dependencies only |
| §4.4 adjoint type lattice | Sym²det⁻¹; modular label range | Dimension 3, scalar z²z⁻²=1; labels −2,−1,3 have patched value 0 outside 0,1,2 | Kernel removal preserves patched rank | Renumber dependencies only |
| §4.5 adjoint-lattice freeness | Surjection S²→M, generic rank 2 | Generic kernel rank 2−2=0; p-power torsion kernel inside p-torsion-free S² is 0 | Integral injectivity justified | Renumber dependencies only |
| §4.6 radical truncation | k[t]/t⁴→k[t]/t³ | Full dimensions 4,3; both quotients modulo rad³ dimension 3 | Truncation equality is weaker than full equality | None |
| §4.7 generation equivalence | f=1,r=2 | Baseline Hom dimension 2, extra map would give ≥3; both allowed dimensions 2 | r is not f | Renumber dependencies only |
| §4.8 glued-lattice support | f=2,j=1 | Three profiles; ranks (1+3+3)d=7d; double-adjoint would give 16d | Nonrectangular support retained | Renumber dependencies only |
| §4.8 twist/reversal convention | f=2; diag(2,1) in 𝔽₂₉ | j=0,1 maps to 1,0; det⁻¹=15≠2; determinant weight 3=2+1=3+0 | Index/sign witnesses agree | None |
| §4.8 p-membership unit factor | p=29,N=12,a₂=2,d₂₁*=1 | 2/a₂=1; factor 1+O(29³) a unit; element 29·unit; a₂,a₂−1=2,1 | Nonzero denominators explicit | None |
| §4.9 first-order fibre | r=2 | Source/target fibres dimension 2; surjection kernel dimension 0; before fibre k⟦t⟧→k has kernel (t) | Fibre qualification essential | Renumber dependencies only |
| §5.1 weighted GK dimension | f=1,2 | 2≥3−δ and δ≤1 give δ=1; 4≥6−δ and δ≤2 give δ=2 | Upper/lower bounds match | Renumber dependencies only |
| §5.2 second-congruence structure | r=2 | Each first-order summand occurs twice; K₁-fixed part D₀² | Multiplicity r retained | Renumber dependencies only |
| §5.3 patched faithful flatness | f=1,2; comparison Frac(O) | Both grades 2,4; patched closed fibre π∨≠0; Frac(O)/ϖ=0 | Flatness alone not enough | Renumber dependencies only |
| §5.4 Banach lifts | Compact lattice O versus κ | Hom_O(O,E)=E with unit ball O and reduction κ; Hom_O(κ,E)=0 | Integral torsion-free lattice necessary | Renumber dependencies only |
| §5.5 unweighted GK theorem | Regular C₂₉; weighted filtration | Finite-level invariants dimension 1 versus 29; nonzero weighted pieces have dimension f | Arbitrary invariant/reduction shortcut excluded | None |
| §5.6 completed tower and inertness | One or two places above p | Inert: one varying factor, empty away tensor O; two places: one fixed extra factor | Different tower retained | None |
| §5.6 Hecke/Galois map | T=9,S=25,q=5 in 𝔽₂₉ | Geometric trace 7·9=5, determinant 5·7=6; direct T would give 9 | Same convention as §0.3 | None |
| §5.6 reduction qualification | O --p→ O | Reduction has zero differential and κ in two degrees; integral cohomology κ in one degree | Adjacent Tor cannot be ignored | None |
| §5.7 big R=big T consequence | R=O⟦x,t⟧, regular sequence (x) | dim R=3, dim R/(x)=2; free faithful R/(x)-module detects kernel 0; zero module detects every kernel | Faithfulness and CI route consistent | Renumber dependencies only |

## Validation outcomes

- `lake env lean` on packages/HilbertModularVarietiesAndShimuraCurvesPartII/Suggested.lean, from the content checkout: **exit 0, no output**. The file has one `import Mathlib`, an explanatory module docstring and an empty namespace; zero declarations, no `sorry`, no `set_option`, no data stand-ins, and no Tau Ceti imports requiring a build.
- Mechanical signature audit: a scratch copy of the original file with `#check @name` for all four declarations elaborated **exit 0**, printing all four signatures and the two expected original `sorry` warnings. Comparison with the retained README mathematics found no lost ring, module, nonzero, rank, surjectivity or annihilator binder. All four declarations are deleted for F01, so the final declaration/signature inventory is empty and no binder repair is required. An initial scratch-generation attempt used the wrong Git directory and failed before the corrected audit; it did not modify package files.
- `roadmaps resolve`: no unresolved cross-roadmap citations and no unresolved Lean names on main or the 362 indexed open heads (final index of 2026-10-25T11:51:01Z, main 86e155c). Its warning that it does not check pinned Lake packages was handled by reading the pinned equal-locus declarations directly. Mathlib pin: 6b7abb3c7686292736be2955bd3eb9ebf63b456a; Tau Ceti pin: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039.
- The required dependency command, with the supplied name, order and `--movable`, exited **0** with output:

```text
depcheck: 51 roadmaps, 594 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No tooling or merge-order file was edited.

- Structural checks: the six Layer 1 headings are exactly 1.1–1.6; no own §1.7 remains; no deleted Lean name remains in the README. All four gap slugs remain in both required locations; each of the three revised `needs` strings matches its README contract exactly. Parsed JSON before and after agrees after removing its top-level `gaps` key. The source manifest parses and has unique source keys. `git diff --check` exits **0**, with no output.
- Presentation gate `tex=12`: added eight inline code spans on lines 69, 200, 216 and 756 of packages/HilbertModularVarietiesAndShimuraCurvesPartII/README.md. These cover the single-type ring contract, crystalline-weight comparison and their Checks. Removing code-span markers gives identical mathematical text before and after; no statement, hypothesis, value or locator changed. The worker scanners now return `tex=0` and `latex=0`. Repeated Lean elaboration exits **0, no output**; the repeated dependency check exits **0** with exactly the output above; `git diff --check` exits **0, no output**. Suggested.lean, metadata.toml, sources.toml and design/plan.json remain byte-for-byte unchanged by this presentation repair. F01–F08 remain settled as above; no unrelated target was added.

## Maintainer consequences

The local correspondence/lattice and ring identities remain explicit supplier gaps; this repair does not modify or claim completion of another roadmap. In particular LocalGaloisDeformationRingsPartII T.6 must provide the two stated ideal identities. The BDJ-dependent type comparisons and the unramified explicit/crystalline comparison are owned here in §0.2, keeping supply in one direction. The latter uses the dual Galois input for raw GK14 labels; consumers must retain that adapter. Ramified highest-weight pairs set to (0,0) have GK14 Hodge–Tate weights {1,0}, not {0,0}.

External prose references to this roadmap's Layer 1 should use the map 1.2→1.1, 1.3→1.2, 1.4→1.3, 1.5→1.4, 1.6→1.5, 1.7→1.6. The deleted acceptance names are FreeRankOnSupport, modulePullback, freeRankOnSupport_of_extension and modulePullback_freeRankOnSupport_iff; their general mathematical content remains in §§2.2–2.3 and native carriers remain imported by name. No other public Lean name changes. No commits, pushes, pull-request edits or issue comments were made.
