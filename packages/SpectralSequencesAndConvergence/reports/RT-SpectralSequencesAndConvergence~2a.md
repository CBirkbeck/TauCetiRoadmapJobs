<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14997#issuecomment-6872312336 -->
Red team round 2 pass a (codex) of 4a46526

Verdict: needs_changes

**For the human reviewers:** this review raises 1 question that a human decides (the scope of the roadmap, or a licence). It is in the section of that name at the end and does not change the verdict.

1. **F01** (P3) The cycle-tower definition still has only two distinct Checks

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:460`: “In the same example `E_3^{0,1} = 0` and `Z_3(0,1) = B_3(0,1)`, as the third API item requires.”

   **Claim:** The three bullets supply three discriminating Checks for §1.2.

   **Witness:** The preceding bullet at lines 458–459 already computes precisely these values: `Z_3(0,1) = B_3(0,1) = E_3^{0,1} = 0`. The third adds neither an instance nor a test.

   **Exact repair text:** Replace the third bullet with:

   > Naturality with nonzero boundaries: map the page-2 complex `ℤ →(×2) ℤ` to `ℤ →(×4) ℤ` at positions `(0,1)` and `(2,0)`, by identity on the source and multiplication by 2 on the target. The square commutes since `2·2 = 4·1`. At `(2,0)`, the first-page map sends `B_3 = 2ℤ` to `4ℤ = B′_3`; the induced page-3 map is `ℤ/2 → ℤ/4`, `[1] ↦ [2]`, and is nonzero. Assigning zero to every induced quotient map fails this test.

   **Retest:** `[1]` has order 2, `[2]` has order 2 in `ℤ/4`, and changing its representative by 2 changes the image by 4. At the source position, both page-3 cycle objects are zero. Thus this is a morphism of the stated spectral sequences and tests their naturality.

2. **F02** (P3) The Euler negative Check diagnoses the wrong hypothesis

   **Location:** `packages/SpectralSequencesAndConvergence/README.md:665`: “the Serre-class hypothesis is necessary for the identity to be meaningful.”

   **Claim:** The infinite-dimensional `finrank` example demonstrates failure of the Serre-class hypothesis.

   **Witness:** Take `P` to be all vector spaces. It satisfies all four closure assumptions. In `0 → k → k^(ℕ) → k^(ℕ) → 0`, the failed hypothesis is additivity: `0 ≠ 1 + 0`.

   **Exact repair text:** Replace that Check with:

   > Additivity is required even when the class contains every object. For the inclusion of the first coordinate and the left shift, `0 → k → k^(ℕ) → k^(ℕ) → 0` is short exact. Mathlib's natural-valued `finrank` gives `0` on both infinite-dimensional terms, so `0 ≠ 1 + 0`. Thus this function fails the additivity hypothesis for the class of all vector spaces. Restricting to finite-dimensional spaces supplies a weak Serre class on which `finrank` is additive.

   **Retest:** The left shift has kernel `k·e₀` and is onto. The zero-total Euler sum of the two infinite terms changes to dimension 1 in homology if additivity is omitted. All closure assumptions on the full category continue to hold.

## Verification of round 1 repairs

All nine earlier findings are repaired. Neither new finding re-raises a settled finding. The two additions to the acceptance file were checked independently; no false theorem was introduced.

| Earlier finding | Status and repaired passage | Witness at this head |
|---|---|---|
| 1a/F01 | **Repaired.** §5.1: “A family that is both monotone and antitone in `t ∈ ℤ` is constant”; §4.2: “For the zero spectral object both families are constantly `0`”. | `packages/SpectralSequencesAndConvergence/README.md:1277` and `:1036`. For the stupid filtration, the wrong monotone inclusion in degree zero is `ℤ ≤ 0`; the constant filtration instead satisfies `⊤ ≤ ⊤`. Unreindexed abutment values are `0, ℤ/2` at `−2,−1`, whereas decreasing steps are `F³=ℤ/2,F⁴=0`. |
| 1a/F02 | **Repaired.** §2.3 now names “`sum_negOnePow_page_eq_sum_negOnePow_page_add_one`”. | `packages/SpectralSequencesAndConvergence/Suggested.lean:139`: arbitrary page, finite support, weak Serre class, additive invariant. Lengths give `−2+1=−1=−1+0`; empty support gives `0=0`. The statement is not restricted to filtered-complex pages. |
| 1a/F03 | **Repaired.** Module docstring: “Boardman's double-tower short exact sequence”. | `packages/SpectralSequencesAndConvergence/Suggested.lean:71` names §7.3, its image system, transitions, and comparison map. The `×ℓ` example has terms `0, ℤ_ℓ/ℤ, ℤ_ℓ/ℤ`; no substitute theorem is declared. |
| 1a/F04 | **Repaired.** §1.3: “`E_2 = E_1` and `E_3 = 0`”; §4.4: “Bounds are degreewise.” | `packages/SpectralSequencesAndConvergence/README.md:482` and `:1150`. The delayed identity differential is `1≠0` over `ℤ/2`; degree-1 bounds for `ℤ[0]` with zero finite stages compare `0→0`, while degree 0 compares `0→ℤ`. The extra repair in §3.5 correctly computes `h(2)=2h(1)=0`. |
| 1b/F01 | **Repaired.** “Convergence bounds of the spectral object of a filtered complex”. | `packages/SpectralSequencesAndConvergence/Suggested.lean:230`. For the stupid filtration, `n=1,a=−2,b=0` gives lower groups zero and upper identity on `ℤ/2`. With `b=−1`, reduction `ℤ→ℤ/2` fails the hypothesis. |
| 1b/F02 | **Repaired.** “and `EInfty`, … (`SpectralObject/Stabilization.lean`)”. | `packages/SpectralSequencesAndConvergence/README.md:275`; `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45` defines `EInfty`; `Abutment.lean:92` defines `EInftyIsoCokernel`. |
| 1b/F03 | **Repaired.** Supplier contract names “`CochainComplex.spectralObjectHIsoCokernel`” and its naturality theorem. | `packages/SpectralSequencesAndConvergence/README.md:293`; `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:224` and `:241`. For `⊥→i`, the cokernel of `0→G_i` is `G_i`. |
| 1b/F04 | **Repaired.** §3.3: “`(f, 2)` and `(f, 2 + ℓ)` are both morphisms, while `(f, 3)` is not”. | `packages/SpectralSequencesAndConvergence/README.md:769`. At ℓ=2 the induced values are `0,0,1`; at ℓ=3 they are `2,2,0`. The constant-filtration example has all graded objects zero, allowing every integer endomorphism. |
| 1b/F05 | **Repaired.** §3.2 attributes Definition 2.7 to “cartan-eilenberg1956 Ch. XV §2”; References now says “mccleary2001 … Ch. 2”. | `packages/SpectralSequencesAndConvergence/README.md:717` and `:1922`; corresponding `sources.toml` entries have `cited_for=["3.2"]` and `["3.6"]`. Attribution agrees with helle-rognes2024 line 94; the settled texts remain uncertified. |

## Verified sound

Read all **1,925 README lines**, all **329 Lean lines**, and both repository rules files. The README has **31 numbered target sections**, rather than bold theorem headings. The acceptance file has **13 actual declarations**: one structure, two definitions, ten theorems. The supplied signature extraction's fourteenth entry, `that`, is prose from line 66; its `Unknown identifier` diagnostic is an extraction artefact, not a declaration or an error in this file. Every actual extracted signature was compared with the README. There are no section-variable blocks and no missing hypothesis binders. No Lean process was started; the supplied elaboration transcript was used, consistently with the no-build instruction.

The audit read **115 Check bullets**. Computations for them, the definitions and the named theorem clauses are recorded below. The two defective Checks are S01 and S02. The comparison with the cached texts covers **59 explicit source-key/line citations** (36 Stacks, 20 Helle–Rognes, two Bhatt–Scholze, one Browning–Sawin citation containing two ranges), including their subsidiary ranges and named results. Six sources remain settled uncertified. **16 individual named supplier section/item references** were resolved, with the unnumbered HeegaardFloer and MorseTheory ownership scopes also inspected.

### Acceptance declarations and contexts

All names below are in `TauCetiRoadmap.SpectralSequencesAndConvergence`. `C` always has independent object and morphism universes and explicit category and abelian instances. “Weak Serre” abbreviates the four explicit instances ContainsZero, IsClosedUnderKernels, IsClosedUnderCokernels and IsClosedUnderExtensions. No finiteness or exactness assumption is inferred from the category name alone.

| Declaration, section and line in Suggested.lean | Additional variable and instance context | Instances and computed values on both sides | Result / change |
|---|---|---|---|
| `BidegreeAssignment`, §2.1, 95 | `κ`, shapes `c`, integer start `r₀`; fields fil, deg, e, injectivity, two relation laws | Standard relation changes `(fil,deg)` by `(r,1)`; classical assignment changes it by `(r−1,1)`. Wrong `fil=q` changes it by `1−r`, requiring `e=2r−1`, not constant. Empty κ has the unique functions; singleton with empty relations permits assignments. | Native structure, real fields; no hidden existence assertion. |
| `dFrom_eq_zero_of_boundedBelow`, §2.2, 113 | Arbitrary E and assignment; integer β; first-page vanishing; `r≥r₀` and bound | At `(1,0)`, β(n)=n+1, threshold `β(2)−1=2`: for r=2 target `(3,−1)` is zero. Generally target fil is `fil+r−e≥β(deg+1)`, so d=0. Empty relation also gives dFrom=0; zero category gives 0=0. | No counterexample; integers avoid truncated subtraction. |
| `dTo_eq_zero_of_boundedAbove`, §2.2, 125 | Arbitrary E and assignment; integer α; first-page vanishing and bound | At `(1,0)`, α=−1, threshold `1−(−1)=2`; r=2 source `(−1,1)` is zero. Generally source fil=`fil−r+e≤α(deg−1)`. At a source with no predecessor dTo=0. | No counterexample. |
| `sum_negOnePow_page_eq_sum_negOnePow_page_add_one`, §2.3, 139 | E, assignment, weak Serre P, abelian G, v, short-exact additivity, r≥r₀, finite s, support and membership | Length on `ℤ/4↠ℤ/2` gives `−2+1=−1` and `−1+0=−1`; empty s gives `0=0`, all next objects zero. Extra zero positions contribute v(0)=0, forced by `v(0)=v(0)+v(0)`. | New headline present; S02 concerns its Check only. |
| `HasConvergenceBounds`, §4.4, 161 | X and n,a,b, no countability or order a≤b | Stupid filtration in n=1: a=−2 gives lower 0,0; b=0 gives id on ℤ/2. a=−1 gives lower ℤ≠0; b=−1 gives `ℤ↠ℤ/2`, not iso. Zero X admits (5,0). | Exact README predicate. |
| `convergence_of_hasConvergenceBounds`, §§4.3–4.4, 187 | hX; quantified q,r, r≥2, both integer bounds and EInt order proofs | n=1,q=−2,a=−2,b=0 gives thresholds 2 and 3: r=3 page and EInfty are ℤ/2, both canonical maps iso and both d=0. r=2 excluded: incoming ×2≠0. q=0 gives r≥4 and zero limit. | New boundary criterion is needed beyond pinned vanishing. |
| `isIso_hom_app_abutment_of_hasConvergenceBounds`, §4.6, 212 | φ:X→Y, common bounds, r≥2, all page components iso | Identity gives id on ℤ/2. Nonexhaustive inclusion ℤ[0]→(ℤ→id ℤ) has pages id but H⁰ map ℤ→0; target's upper map ℤ→0 violates hY. | Hypotheses exclude counterexample. |
| `hasConvergenceBounds_spectralObject_filtrationFunctor`, §5.3, 230 | K; increasing F; n,a,b; lower homology vanishing; upper inclusion homology iso | Same (−2,0) stupid-filtration example gives zero lower H¹,H² and upper id of ℤ/2. K=ℤ[0], F=0 gives `0→ℤ` in degree 0, fails; degree 1 gives `0→0`, passes. | Added statement matches construction and native cokernel identification. |
| `sum_negOnePow_homology_eq_sum_negOnePow_page`, §5.3, 248 | F monotone; bounds ∀m∃a,b; weak Serre, additive v; r≥2, finite support s | Over ℚ, ×2 complex gives page sum `1−1=0`, H sum 0. Over 𝔽₂ it gives `1−1=0` on both sides. Singleton ℤ[0] gives 1=1; s empty forces all H=0. Wrong native-fil sign gives −2. | Degreewise bounds retained; no uniform bound silently assumed. |
| `isIso_homologyMap_of_isIso_page_of_exhaustive_of_boundedBelow`, §5.4, 278 | Exact sequential colimits; K,L,F,G,monotonicity; natural α on EInt; n,a; termwise vanishing n,n+1; LUB exhaustion n−1,n; page iso | ℤ→ℤ_ℓ on adic filtrations has page id but H map not iso; no finite stage vanishes, excluding it. Nonexhaustive example has LUB=0≠⊤ in degree −1. Identity of stupid filtration works at a=−2. | Neither module-only nor bounded-above stand-in. |
| `isReplete_iff_countableAB4Star_and_epi_towerDifference`, §7.2, 304 | Countable products; no repleteness assumed; RHS AB4* plus ∀epi towers | In modules solve x_n−f_n x_(n+1)=y_n by lifting x_n−y_n. In route P_n=F_n⊕T, compatibility is f_n x_(n+1)+y_n=x_n. Conversely the kernel tower gives coker(lim F→F₀)=0. | Both directions have independent proofs. |
| `IsMittagLeffler`, §7.2, 315 | Arbitrary abelian-category tower, no products required | Epi tower: m=n, images=⊤. Zero transitions: m=n+1, images=0. ×ℓ on ℤ: images ℓ^(k−n)ℤ strictly shrink; no m. At k=m the equation is reflexive, but later k enforce stability. | Generic image-subobject predicate, distinct from Type-valued library predicate. |
| `epi_towerDifference_of_isMittagLeffler`, §7.2, 324 | Countable products and native IsReplete, plus ML predicate | Zero transitions give 1−s=id and coker=0. Finite-group towers have stable images, epi subtower and pro-zero quotient. ×ℓ has coker ℤ_ℓ/ℤ≠0 and fails ML. | No counterexample; repleteness not replaced by AB4*. |

The one-tactic/one-library-lemma probe found no padding among the ten theorems. The boundedness pair needs propagation through pages and shape arithmetic; the page Euler theorem needs finite regrouping and weak-Serre homology arguments; the new filtration-bound theorem needs the cokernel isomorphism and its naturality, not just unfolding its conclusion. The comparison statements strengthen the pinned ones, and the two repleteness statements are not the Type/module ML results.

### README statement and Check computations

Notation: K₂ is `ℤ→(×2)ℤ` in degrees 0,1 with the stupid decreasing filtration. Its increasing stages are 0 for t≤−2, ℤ[1] at t=−1, and K₂ for t≥0. Kℓ is the identity complex with filtration from §1.4: degree 0 drops at p=1, while degree 1 has successive ℓ-power tails. These are computations in abelian groups; the same examples over 𝔽₂ and 𝔽₃ test signs and small characteristic. Unrelated geometric hypotheses (smoothness, ramification, quasi-separatedness, group stabilizers) do not occur in any statement.

| Statement / Check | Instances tried | Values computed | Result / change |
|---|---|---|---|
| Conventions: classical/native indices and d | K₂, r=1 | (0,0)↦(1,−1), (1,0)↦(3,−2), native page 2; total degrees 0,1; d=+2 | Consistent with supplier. |
| Conventions: abutment indexing | K₂, n=1 | native F³=ℤ/2, F⁴=0; classical F¹=ℤ/2,F²=0; shift n+1=2 | Correct. |
| Conventions: tower sign | Constant identity and zero-transition towers | 1−s has kernel diagonal A for identity transitions; zero transitions give id, kernel=coker=0 | Correct sign. |
| 1.1 presentation/preimage/order isomorphism | 4ℤ≤ℤ presenting ℤ/4 | 0,2ℤ/4,ℤ/4 pull back to 4ℤ,2ℤ,ℤ; quotient (2ℤ)/(4ℤ)=ℤ/2 | Correct. |
| 1.1 meet/join transport and nested subquotients | Same three-element interval | Meet of 2ℤ and ℤ is 2ℤ; join of 4ℤ and 2ℤ is 2ℤ; direct and two-stage ℤ/2 quotients agree | Correct. |
| 1.1 zero and nonuniqueness Checks | X=0; X=ℤ/2 inside ℤ/4 | X=0 forces B=Z. (0,2ℤ/4) and (2ℤ/4,ℤ/4) both have quotient ℤ/2 | Correct. |
| 1.1 identity marking Check | ℤ² with swap versus canonical marking | Preimage of first axis is second axis under swap, first axis under id | Marking cannot be omitted. |
| 1.2 start, nesting, leaving/entering iff | ×2 at positions (0,1)→(2,0) | Source (B₂,Z₂)=(0,ℤ), (B₃,Z₃)=(0,0); target becomes (2ℤ,ℤ). Nonzero leaving/entering d coincides with strict change in respective tower | Correct. |
| 1.2 zero-page iff | Same | Source quotient 0/0=0; target ℤ/2ℤ≠0 with Z₃≠B₃ | Correct. |
| 1.2 all-zero differentials Check | Constant ℤ at one position | Every (B_r,Z_r)=(0,ℤ), quotient ℤ | Correct. |
| 1.2 naturality | ×2→×4 with component maps 1,2 | Boundary image 2·2ℤ=4ℤ; quotient [1]↦[2] | S01 replacement. |
| 1.2 rebasing, isomorphism invariance | Rebase ×2 example at page 3 | Source towers 0; target towers (0,ℤ/2), corresponding to (2ℤ,ℤ) in original page | Correct. |
| 1.2 third Check | Same source as second Check | 0=0=0 repeated | S01. |
| 1.3 degeneration versus one zero d | Delayed id over ℤ/2 | d₁=0, d₂=id; E₂=E₁≠0, E₃=0; degeneration starts at 3 | Repair sound. |
| 1.3 regular/coregular/stabilisation | ×2 source and target | Source has B constant from 2 but Z changes at 3; target has Z constant from 2 but B changes at 3 | Both directions distinguished. |
| 1.3 canonical later-page isomorphisms | ×2 after page 3, zero sequence | Later objects ℤ/2 with identity comparisons; zero objects with unique comparison | Composition id∘id=id. |
| 1.4 limits/stabilised limit/vanishing | ×2, zero sequence | Source meet=join=0; target meet=ℤ, join=2ℤ, quotient ℤ/2; zero sequence quotient 0 | Correct. |
| 1.4 countable construction | Kℓ | ker(ℤ→∏_r ℤ/ℓ^r)=0; all boundaries 0; quotient 0 | Countable products suffice for meet. |
| 1.4 no stabilised page Check | Kℓ, ℓ=2 or 3 | Z_r=ℓ^(r−1)ℤ≅ℤ≠0; intersection=0; E∞=0 although every source page≠0 | Correct. |
| 1.4 functoriality/rebase | Multiplication by ℓ on Kℓ; rebase at 2 | ℓZ_r⊂Z_r; E∞ map 0→0; rebase intersection in ℓℤ still 0 | Correct. |
| 2.1 standard and classical assignments | Native relation (p,q)→(p+r,q+1−r) | Δdeg=1, Δfil=r or r−1 respectively | e=0 or 1. |
| 2.1 wrong assignment/injectivity Check | fil=q; (p,q)↦(p,p) | r=2,3 would require e=3,5; (0,0),(0,1) have same wrong pair | Rejected. |
| 2.1 natural/homological/finite carriers | n=0,1,2; l=0,1,2 | Natural degree-n positions have p=0,…,n; homological Δ(−p)=r and Δ(−p−q)=1; Fin 0 has none | No out-of-range component. |
| 2.2 boundedness and explicit bounds | First quadrant | β(n)=n+1, α(n)=−1 gives r≥q+2 and r≥p+1, equivalently r>max(p,q+1) | Correct. |
| 2.2 first Check | (p,q)=(1,0) | r=2 has target q=−1, source p=−1, both zero; E₂=E∞ | Correct. |
| 2.2 finite support in adjacent degrees | Kℓ | Degree 0 support={(0,0)}, degree 1 support all p≥1; Z_r=ℓ^(r−1)ℤ not constant | Own degree alone insufficient. |
| 2.2 zero Check and finite-support equivalence | Zero E; finite nonzero fil values −2,5 | Zero E admits α=β=0; finite support is between α=−3 and β=6 | Correct. |
| 2.3 page Euler identity | ℤ/4↠ℤ/2, length | −2+1=−1; next kernel ℤ/2, cokernel 0 gives −1+0=−1 | Correct. |
| 2.3 rational Check | ×2 on ℚ | −1+1=0; kernel=cokernel=0, next sum=0 | Correct. |
| 2.3 additivity negative Check | Full vector-space category; left shift k^(ℕ)→k^(ℕ) | Both infinite finranks 0; kernel dimension 1, giving 0≠1 | S02, not failure of closure. |
| 3.1 adic completeness Check | ℤ and ℤ_ℓ | Join=whole, meet=0; completion ℤ_ℓ; map ℤ→ℤ_ℓ not onto, ℤ_ℓ→ℤ_ℓ iso | Distinguishes completeness. |
| 3.1 constant/zero filtration Check | X=ℤ | Constant: join=ℤ, meet=ℤ; zero: join=0, meet=0 | Exhaustion/separation distinct. |
| 3.1 finite/extension Check | ℤ/4 and (ℤ/2)² | Both graded lists (ℤ/2,ℤ/2); maximal element orders 4 and 2 | Graded objects do not determine extension. |
| 3.1 finite five-lemma, complete⇒separated | Finite morphism with graded isos; constant nonzero filtration | Finite induction gives kernel=coker=0; constant quotient limit=0≠ℤ, so not complete | Correct. |
| 3.2 three convergence structures | K₂; adic ℤ; zero E with constant ℤ | K₂: gr¹=ℤ/2, finite complete. Adic ℤ: gr^p=ℤ/ℓ, meet=0, incomplete. Constant ℤ: gr=0=E∞ but meet ℤ | All implications strict as claimed. |
| 3.2 restriction/transport/missing positions | I={1}; alter H⁰; κ=∅ | H¹ and β unchanged; κ=∅ forces every relevant gr=0; exhaustive separated then forces H=0 | No unconstrained graded positions. |
| 3.3 nonfaithful forgetful functor | ℓ=2,3, f=×2, h=2,2+ℓ,3 | Graded h values 0,0,1 mod2 and 2,2,0 mod3; f values 0,2 respectively | Two valid lifts, one invalid. |
| 3.3 sign Check | E∞=H⁰=ℤ, pair (−1,id) | −1≠1 | β compatibility essential. |
| 3.3 constant weak structure Check | E=0, H⁰=ℤ, constant filtration | All gr=ℤ/ℤ=0; every h induces zero | Correct. |
| 3.3 identity/composition/restriction | Integers 2,3 on one-step ℤ | Page and graded compositions both ×6; identity both ×1; empty range imposes no square | Category laws consistent. |
| 3.4 finite convergence and weak Serre closure | ℤ/4 and (ℤ/2)² | Both length=2=1+1; all zero graded pieces give length/object 0 | Correct, no splitting asserted. |
| 3.4 global Euler and finite support | Nonzero fil span f₋,…,f₊ | r′>f₊−f₋+e implies f+r′−e>f₊; all d=0; empty support already gives H=0 | Stabilisation argument correct. |
| 3.4 convergence-range negative Check | Zero E, H¹=ℚ, I={0} | Page sum 0; H sum −1. Put ℚ at (0,1) instead: both −1 | Global convergence needed. |
| 3.4 filtration negative Check | Zero E, constant filtered H⁰=ℚ | Page sum 0; H sum 1; all gr=0 | Finite filtration condition needed. |
| 3.5 comparison on limit pages | Rebase at page s where f is iso | Tower maps become conjugates of an iso; induced meet and join maps iso, quotient map iso | No arbitrary choice of β used. |
| 3.5 finite morphism Check | ℤ/4→(ℤ/2)² | h(2)=2h(1)=0, so gr¹(h)=0≠id on ℤ/2 | Repaired Check sound. |
| 3.5 separation Check | Constant ℤ→0, E=E′=0 | Page map iso₀; abutment kernel ℤ≠0 | Excluded by separation. |
| 3.5 completeness Check | ℤ→ℤ_ℓ | All gr maps id of ℤ/ℓ; cokernel ℤ_ℓ/ℤ≠0 | Excluded by completeness. |
| 3.6 vanishing | All E_r at degree n zero | All E∞ and gr zero; successive F equal; exhaustion and separation give H=0 | Correct. |
| 3.6 dimension inequality/iff | ×2 over ℚ; zero d on one ℚ | First 1>0; second 1=1. A nonzero entering or leaving map loses positive finite rank | Both directions valid with finite dimension. |
| 3.6 two columns | ℤ/2 in (0,n),(1,n−1) | d_r shifts ≥2 columns, so d=0; extensions ℤ/4 and (ℤ/2)² both possible | Correct. |
| 3.6 two rows and splicing | Hopf example with four ℤ entries | d₂=id kills middle two; H⁰=H³=ℤ,H¹=H²=0; shared d₂ matches at adjacent segments | Correct. |
| 3.6 edge/five-term and m bound | Only E₂^(0,0)=ℤ; m=0 versus m≥1 | Both degree-zero edges id; their composite id≠0, disproving m=0 extension. For m≥1 possible transgression length m+1 | Correct lower bound. |
| Layer 3 circle-method example | Odd pages, delayed d₂=id | E₁=E₂≠0, E₃=0 although all odd d=0; finite m range gives finite filtration | No degeneration overclaim. |
| 4.1 integer towers/start | K₂ at native (1,−1), r=2,3 | r=2 outer intervals equal, δ=0: Z₂=ℤ,B₂=0. r=3 cycle map ×2: Z₃=0 | Correct. |
| 4.1 incoming tower | K₂ at (3,−2) | r=2 B₂=0; r=3 image δ=2ℤ; quotient ℤ/2 | Correct. |
| 4.1 permanent-cycle negative Check | Identity complex with degree-1 filtration constantly ℤ and degree-0 step at 0 | E₁^(0,0)=ℤ, every finite-page d=0, so Z∞=ℤ; H⁰(K)=0, Zᵗ=0 | Strict containment possible. |
| 4.1 finite recipe | l=2,r=3,q=0,1; l=0 | Index quadruples (0,0,1,2),(0,1,2,2); at q=1 B₃=0. l=0 gives no positions; first-page max/min return q,q+1 | Clamping required and correct. |
| 4.1 restricted natural recipe | Identity complex with G₁=K¹, G₂=K | Native page-2 terms ℤ at (−1,1) and (1,0); d₂=id. Restricting away source would give homology ℤ, whereas recipe page 3=0 | HasSpectralSequence is essential. |
| 4.1 homological/naturality | (p,q)=(1,1), r=2,3, n=−2; identity map | r=2 indices (−1,−1,0,0); r=3 (−2,−1,0,1); identity sends each kernel/image identically | Negation correct. |
| 4.2 filtered abutment/graded identification | K₂,n=1 | F³=image(H¹(G_−1)→H¹(K))=ℤ/2; F⁴=0; gr³=EInfty(−2,1)=ℤ/2 | Correct. |
| 4.2 wrong indexing Check | K₂ versus zero X | Unreindexed values at −2,−1 are 0,ℤ/2, not decreasing; zero X gives 0,0 in both conventions | Repaired universal claim. |
| 4.2 quadrant endpoints | n=0,1,2 | Possible nonzero graded indices 0,…,n; endpoints F⁰=H, F^(n+1)=0; negative n forces H=0 | Correct. |
| 4.3 canonical subquotient and both iff | Nonexhaustive identity complex in degrees −1,0 | Z∞=Zᵗ=ℤ, B∞=0, Bᵗ=ℤ; inclusion iso, projection ℤ→0 not iso | Boundary equality cannot be dropped. |
| 4.3 cycles versus stabilisation | Kℓ | Zᵗ=Z∞=0; each Z_r=ℓ^(r−1)ℤ≠0 | Comparison need not imply finite stabilisation. |
| 4.3 cycle and boundary bounds | K₂,(p,q)=(3,−2),i=−2,j=0 | q−i+2=2, j−q+1=3; page 3=ℤ/2=EInfty; page 2 has boundary not yet 2ℤ | Correct max. |
| 4.3 continuity only needs epi | Identity complex in n−2,n−1, finite stages missing lower term | colim H^(n−1)(G_j/G_(q+1))=ℤ→H^(n−1)(K)=0; epi, not mono; boundary image at endpoint=0 | No isomorphism assumption needed. |
| 4.4 definition and endpoint implication | K₂,(a,b)=(−2,0) | H¹,H² at lower endpoint 0,0; upper H¹ comparison id; stronger endpoint-vanishing hypotheses give same via exact sequence 0→H¹(G_j)→H¹(K)→0 | Correct. |
| 4.4 monotonicity/common bounds/transport | K₂ and zero object | a=−3 retains vanishing; b=1 retains identity; common bounds take min a,max b. Transport of 0/id remains 0/id | Correct. |
| 4.4 finite filtration and interior page bound | a≤q<b | q−a+2≤b−a+1, b−q+1≤b−a+1; F^p whole for p≤n+1−b and zero for p≥n+1−a | Correct. |
| 4.4 sharp K₂ Check | a=−1 or b=−1 | Lower H¹(G_−1)=ℤ≠0; upper map ℤ→ℤ/2 not iso | Cannot improve these cohomological bounds. |
| 4.4 mono versus iso Check | ℤ[0], G_j=0 | 0→ℤ mono; E pages=0; all image filtration steps=0, join 0≠ℤ | Exhaustion fails. |
| 4.4 degreewise Check | Same, n=1 versus n=0 | In n=1 all groups 0 and upper map iso₀; in n=0 upper map 0→ℤ not iso | Range {1} accepted, {0,1} rejected. |
| 4.4 reversed bounds Check | Zero X,a=5,b=0,q=1 | max(2,−2,0)=2; integer bound −2 alone is not a page. For K₂,q=0 bound 4, EInfty=ℤ/2 divided by itself=0 | Correct max and zero conclusion. |
| 4.4 failed upper hypothesis Check | Nonexhaustive identity complex | H⁰(G_j)=ℤ→H⁰(K)=0, kernel ℤ | Not even mono. |
| 4.5 first quadrant | n=−1,0,1 | Bounds (0,0),(0,1),(0,2); n=−1 forces H=0; n=0 only E₂^(0,0), giving H⁰=E₂^(0,0) | Correct. |
| 4.5 third quadrant | m=−2 | a=−2,b=1; positions (0,2),(1,1),(2,0); fil=0,−1,−2; EInfty argument −q | Correct. |
| 4.6 naturality identity/zero Checks | id_X; X→0 | Page, abutment and graded maps all identity or all zero respectively; compatibility squares commute | Functoriality controls. |
| 4.6 finite comparison Check | Filtered map iso on graded cohomology | Finite five-lemma induction gives ker=coker=0 on H; agrees with pinned finite comparison | No split assumption. |
| 4.6 missing-top Check | ℤ[0]→nonexhaustive identity complex | All pages id of ℤ at (0,0); H⁰ map ℤ→0 not iso; htop fails | Correct. |
| 5.1 reindexing and d₁ | K₂; same over 𝔽₂,𝔽₃ | Native d₂=+2; over 𝔽₂ map 0 and both homology terms 𝔽₂; over 𝔽₃ map 2 is iso and homology zero | Sign pinned by integral case. |
| 5.1 trivial filtration and homotopies | One-step K | gr⁰=K; E₁^(0,q)=H^q(K); no other column, hence d=0. Filtered homotopy equivalence gives inverse maps on graded H | Correct. |
| 5.1 unnegated filtration Check | K₂ | F⁰.X⁰=ℤ, F¹.X⁰=0; ℤ⊄0. Constant F has F^t=F^(−t) | Repaired Check sound. |
| 5.2 induced filtration | K₂; trivial filtration | K₂: F¹H¹=ℤ/2,F²H¹=0; trivial: F⁰H^n=H^n,F¹=0 | Correct. |
| 5.2 strict boundary subquotient | Nonexhaustive identity complex | E∞=ℤ, gr H⁰=0, quotient map has kernel ℤ | Correct. |
| 5.2 abstract β versus canonical comparison | K⁻¹=ℤ→K⁰=ℤ^(ℕ)⊕ℤ, x↦(0,x) | E∞=ℤ^(ℕ)⊕ℤ≅ℤ^(ℕ)=H⁰; canonical projection kernel 0⊕ℤ≠0; B∞=0, Bᵗ=0⊕ℤ | Abstract strong structure exists but canonical comparison fails. |
| 5.3 cohomological bounds and finite case | K₂ | p₀=2,p₁=0 gives a=−2,b=0; stable classical E₂^(1,0)=ℤ/2=gr¹H¹ | New Lean adapter correct. |
| 5.3 degreewise finite Check | K^m=ℤ for m≥0,d=0,F^pK^m=ℤ iff p≤m | Bounds p₁=n,p₀=n+2; E₁^(m,0)=ℤ; no global p makes all terms zero | Quantifier ∀m∃a,b is necessary. |
| 5.3 adjacent-degree Check | Kℓ,n=0 | H¹(F^sK)=ℓ^(s−1)ℤ≠0 for s≥1; Z_r never stabilises | Needed degree n+1. |
| 5.3 Euler/support Checks | K₂ over ℚ and 𝔽₂; unbounded zero-d complex | Both correct sums 0; wrong native p sign −2; infinite complex has support {(m,0):m≥0}, no finite s | Finite sum and total-degree sign required. |
| 5.4 convergence route | Exact sequential colimits, exhaustive stage union | In degree n−1 colimit quotient map iso, degree n mono; kernels match; cohomology map epi, so B∞=Bᵗ. Upper zero terms give Z∞=Zᵗ and F^pH=0 | Assumptions used in named steps. |
| 5.4 module exhaustion Check | Adic ℤ[0] | F⁰H⁰=ℤ gives exhaustion; every positive F^p=ℓ^pℤ≠0 | Exhaustion alone does not give strong convergence. |
| 5.4 missing n−1 exhaustion Check | Nonexhaustive identity complex | Union in degree −1 is 0≠ℤ, E∞^(0,0)=ℤ while H⁰=0 | Excluded. |
| 5.4 incomplete/compare Checks | ℤ→ℤ_ℓ; identity K₂ | Adic gr maps id but H map has cokernel ℤ_ℓ/ℤ; K₂ identity satisfies a=−2 and has H map id | Bound excludes bad comparison. |
| 6.1 assembly/zero E | D constant ℤ,i=id,E=0; arbitrary degrees | Exactness gives ker i=coker i=0; every page zero | No d=i mistake. |
| 6.1 tuple couple | D=E=ℤ²,i(x,y)=(x,0),j(x,y)=(y,0),k(x,y)=(0,y) | im i=ker j=first axis; im j=ker k=first axis; im k=ker i=second axis; jk(x,y)=(y,0), H=0, i²=i≠0 | Correct. |
| 6.1 degree formula | a=(−1,1),b=0,c=(1,0) | c−(r−1)a=(r,1−r); wrong plus gives (2−r,r−1) | Correct. |
| 6.1 shift equivalence/offset | k=1, native e=1 | Page r becomes r+1; fil rise r; e′=0=1−1; inverse shift restores r | Correct, no page below start. |
| 6.2 tower start/Bockstein | r=0; D=ℤ,i=×ℓ,E=ℤ/ℓ,k=0 | i⁰=id, Z₁=E,B₁=0; all ker i^r=0, all Z=E, E∞=ℤ/ℓ | Correct. |
| 6.2 off-by-one Check | D=ℤ/ℓ²,E=(ℤ/ℓ)²,i=×ℓ,j(x)=(x modℓ,0),k(a,b)=ℓb | d₁=0; Z₂=k⁻¹(im i)=E; wrong i² gives first summand only. For ℓ=2,3 same computation | Correct. |
| 6.2 higher differential formula | Same couple, r=1 | k(a,b)=i(b); d₂(a,b)=j(b)=(b,0); kernel=image=first summand, E₃=0 | Choice of lift changes j by a boundary. |
| 6.3 spectral-object couple degrees | Native (p,q), n=p+q | i:(p,q)→(p−1,q+1); k:(p,q)→(p+2,q−1), total rise 1; d_r=(r+1,−r) | Matches shifted sequence. |
| 6.3 K₂ sign/tower Checks | n=1 | A^p=0 for p≥4, ℤ at 3, ℤ/2 for p≤2; transition reduction; colimit ℤ/2, limit 0; induced F^p whole iff p≤3 | Correct. |
| 6.3 dropping k Check | K₂ at (1,−1) | D=H⁰(K₂)=0,E=ℤ; setting k=0 gives ker k=ℤ≠im j=0 | Exactness determines nontrivial connecting map. |
| 7.1 lim/lim¹ functoriality and six terms | Constant short exact sequence 0→ℤ→×ℓ ℤ→ℤ/ℓ→0 | Limits reproduce ℤ,ℤ,ℤ/ℓ; all lim¹=0; six terms reduce to original short exact sequence | Snake construction agrees. |
| 7.1 constant/zero-transition Checks | A with id; ℤ/ℓ with zero | id tower lim=A, lim¹=0; zero maps 1−s=id, lim=lim¹=0 | Correct. |
| 7.1 ×ℓ and cofinality | ℤ tower; even subsequence | lim=0, lim¹=ℤ_ℓ/ℤ; subsequence ×ℓ² has same completion and cokernel | Correct test; general additive route noted below. |
| 7.1 completeness implication | Product input (x_k), σ_n=Σ_(k<n)x_k | σ_n−σ_(n+1)=−x_n; τ_n=c−σ_n gives τ_n−τ_(n+1)=x_n | Section of 1−s, sign correct. |
| 7.1 converse/constant negative Check | ℤ,ℤ_ℓ with adic filtration; constant nonzero X | For ℤ: lim¹=ℤ_ℓ/ℤ≠0; for ℤ_ℓ: limit quotient map id so lim¹=0; constant X has lim¹=0 but meet=X≠0 | Separation necessary. |
| 7.2 repleteness iff | Epi tower and sheared P_n | f_n x_(n+1)+((1−s)x)_n=x_n; kernel tower of F_n→F₀ epi; six terms give onto lim F→F₀ | Both directions sound. |
| 7.2 enough projectives | Projective P↠F₀ lifted successively | Compatible maps P→F_n yield P→lim F→F₀ equal original epi; hence limit leg epi | No missing existence-of-limits assumption. |
| 7.2 ML closure/stable images | Epi, pro-zero, finite/Artinian towers | Stable images respectively whole, zero, eventually constant; transitions on stable images onto; quotient images eventually zero | Correct. |
| 7.2 ML versus eventual epis | Constant ℤ/ℓ with zero maps | m=n+1 gives all later images 0 while every transition has cokernel ℤ/ℓ | Correct negative control. |
| 7.2 ℓ-adic quotient tower Check | ℤ/ℓ^(n+1)↠ℤ/ℓ^n, n=0,1 | F₀=0; projection to F₁=ℤ/ℓ onto; lim=ℤ_ℓ; recursion lifts x_n−y_n, giving lim¹=0 | Handles n=0. |
| 7.2 ×ℓ Check | ℓ=2,3 on ℤ | Images ℓ^(k−n)ℤ strictly decrease, no ML; lim¹≠0 | Not contradicted by repleteness. |
| 7.2 Artinian cycle tower | Finite first-page group | Descending Z stabilises; resulting inverse tower eventually id, lim¹=0 | Correct without finite length definition. |
| 7.2 light condensed instance | Native IsReplete instance | For epi tower, theorem gives coker(1−s)=0; pointwise surjectivity is not asserted | Instance checked, no explicit nontrivial tower computed. |
| 7.2 nonreplete Galois-module Check | μ_(ℓ^n), ℓ=2,3 | Smooth ℤ_ℓ(1) vectors=0 since (χ(g)−1)x=0 implies x=0; projection to nonzero μ_ℓ not epi | Does not claim AB4* holds here. |
| 7.3 double-tower constant/zero tail | id on ℤ; A^s=0 eventually | Constant Q=ℤ,RQ=0; exact sequence all zeros. Zero-tail Q=RQ=lim¹A=0 | Correct boundary cases. |
| 7.3 ×ℓ double tower | A^s=ℤ,i=×ℓ | Q=0,RQ=ℤ_ℓ/ℤ; induced ×ℓ is bijective; sequence 0→0→ℤ_ℓ/ℤ→ℤ_ℓ/ℤ→0 | Correct; general categorical route not fully reproved. |
| 7.3 epimorphic Q projections | Constant Q=ℤ; replete C | lim Q→Q^s=id; in general native epi_π_app applies to shifted tower | Correct declared dependency. |
| 7.4 conditional convergence definitions | Zero couple; constant i=id,E=0 | Zero: all A±,RA,RE,W=0. Constant: A±=ℤ,RA=RE=W=0; neither conditional hypothesis | Zero pages alone insufficient. |
| 7.4 limit-step Check | D on total degree 1,s≥1; E^(0,0)=ℤ,k=id | A₁^+=ℤ,A₀^+=0,A_m^−=0; F⁰H⁰=ℤ,F¹=0, gr⁰=ℤ=E∞; RA=W=0 | Required total-degree shift +1. |
| 7.4 colimit-step Check | D on total degree 0,s≤0; j=id at s=0 | A₀^−=ℤ,A^+=RA=0; F⁰=ℤ,F¹=0; E∞^(0,0)=ℤ, W=0 | No shift on colimit. |
| 7.4 half-plane criteria | The two step couples | Eventually iso i gives ker(A^s→A^−)=0 on colimit tail; constant image tower gives lim¹=0 on limit tail | Adjacent total degrees supply kernel and cokernel. |
| 7.4 regular/finite-first-page clauses | ℤ/ℓ finite first-page objects | Z descending eventually constant; lim¹ Z=0; constant i=id still has A±≠0 | RE vanishing does not imply conditional convergence. |
| 7.4 nonzero W Check | Tail products ∏_(i≥abs s)k, k=𝔽₂ or 𝔽₃ | d_(2m−1) is id from (−m,m−1) to (m−1,1−m); E∞=RE=0. A^+=RA=0,A^−=∏k/⊕k≠0; every F^s=A^−, meet=W=A^− | Weak but not separated; excludes W=0 model. |
| 7.4 direct W computation | s=−m,r≥2m | Kernel∩image=⊕_(i≥r−m)k; lim¹=∏_(i≥m)k/⊕_(i≥m)k | Agrees with obstruction theorem. |
| 7.5 complete convergence route | Complete exhaustive stages | lim F^sK^m=lim¹ F^sK^m=0; 1−s is iso degreewise; exact products carry this to H^n; conditional A^+=RA=0 | Product exactness used. |
| 7.5 adic positive/negative Checks | ℤ_ℓ[0], ℤ[0] | Graded ℤ/ℓ for p≥0; ℤ_ℓ complete, W=0 and strong; ℤ incomplete with quotient completion ℤ_ℓ/ℤ | Correct. |
| 7.5 first-quadrant Check | F⁰K=K,F^(m+1)K^m=0 | m<0 forces K^m=0; nonzero graded terms only 0≤p≤m; β(n)=n+1,α(n)=−1; p₁=0,p₀=n+2 | Correct. |
| 7.5 first-page-only negative Check | ℤ[0] with constant filtration | E₁=0 (quadrant condition holds), H⁰=ℤ, completion=0≠ℤ | Completeness cannot be inferred from page support. |

For the zero ring every module is zero: all displayed homology and quotient objects become zero and every relevant morphism is both epi and mono. For the square-zero ring `k[ε]/(ε²)`, the two-term complex with differential ε has kernel εR and cokernel k, each of k-dimension 1; the finite Euler identity reads 2−2=1−1=0 and does not require a domain or flatness. No target quantifies over arbitrary nonabelian groups: S₃ and Q₈ are outside the stated abelian-category carriers, rather than omitted test cases. Universe variation in ModuleCat is retained in §7.2; a smallness assumption is used only for the alternative enough-projectives route.

### Headline inventory

| README headline | Acceptance status |
|---|---|
| §2.2 bounded stabilisation | Two native dFrom/dTo vanishing statements, with exact bounds. |
| §2.3 page Euler characteristic | Added general page theorem, line 139. |
| §§3.2,3.4,3.5 general convergence, finite-filtered Euler and comparison | Module docstring names missing recursive towers, limit page and convergence structures. Native filtered-complex/spectral-object versions are stated. |
| §3.6 vanishing, dimension count, two rows/columns, edges and five terms | Named individually in module docstring; require general converging structures. |
| §§4.3–4.4 spectral-object convergence | Canonical maps, finite image filtration and vanishing dFrom/dTo stated at line 187. |
| §4.5 quadrant convergence | Named as requiring general convergence structures; native page identifications already supplied. |
| §4.6 spectral-object comparison | Line 212, with weaker upper condition than the pin. |
| §5.3 cohomological convergence and Euler theorem | Added bounds adapter line 230; Euler line 248. |
| §5.4 exhaustive classical convergence and comparison | General convergence listed as needing the limit page; native comparison line 278. |
| §§6.1–6.3 exact-couple spectral sequence and identification | Named as missing the bigraded exact-couple carrier and recursive towers. |
| §7.2 repleteness characterisation and ML vanishing | Lines 304 and 324. |
| §7.3 double-tower exact sequence | Now explicitly named with missing image-system and comparison-map constructions. |
| §§7.4–7.5 conditional and complete convergence | Named as missing exact couples, cycle towers, the limit page and W. |

No additional statable headline omission or substitute assertion was established.

### Ownership, suppliers and build direction

The following references were resolved against main, except the explicitly identified DGFloer revision mapping. The generic carriers and results here extend beyond the module/topological/sheaf specialisations; those specialisations are named as instances, not required inputs to the general proofs.

| Supplier/nearby owner | Verified location and scope |
|---|---|
| StableHomotopyKTheory §§7.21–7.26 | `TauCetiRoadmap/StableHomotopyKTheory/README.md:2618` defines §7.22's bigraded exact couples, degrees a,b,c and derivation a,b−a,c. Sections 7.21 and 7.23–7.26 concern filtered spectra; §7.26 at line 2683 uses the same conditional A±, RE and W convention. The +1 total-degree shift in this package is explicitly computed rather than inherited silently. |
| DGFloer Layer 1 items 2,3 | `TauCetiRoadmap/DGFloer/README.md:621` supplies module-complex classical and complete convergence; line 646 gives exactly `(2p+q+1,−p−1)` on native page r+1. Its supplied open revision preserves citations through its former-numbering map at line 152, with item 3 mapped explicitly at line 172 to AlgebraicTopology Stage 5.0. No new revision numbering is consumed here. |
| AlgebraicTopology Stage 6 item 0 | `TauCetiRoadmap/AlgebraicTopology/README.md:879` maps this to §6.0 and the native `TauCeti.ModuleTower` generic module algebra; the contract at line 608 names its limits, six-term sequence, ML and Milnor APIs. |
| DerivedModuleAlgebra §S.1 | `TauCetiRoadmap/DerivedModuleAlgebra/README.md:955` owns the double-complex case; its bound, edges and five-term sequence at lines 968–979 agree. The two resolver warnings are not missing declarations: `DoubleComplex.edgeBottom` and `edgeLeft` are explicitly mapped roadmap names at line 65. |
| SchemeAndStackFoundations §§2.2,2.17 | `TauCetiRoadmap/SchemeAndStackFoundations/README.md:4184` owns sheaf Leray/Čech instances; line 4977 begins replete-topos foundations and line 4993 states `IsReplete.derived_limits` with epimorphic transitions, specifically for abelian sheaves. |
| EnhancedDerivedSheaves E2:towers.1, E2.1,E2.2 | `TauCetiRoadmap/EnhancedDerivedSheaves/README.md:1294`, `:2035`, `:2083` distinguish coherent stable-category towers, topos product exactness and derived limits of sheaves. These do not supply general exact-couple convergence in arbitrary abelian categories. |
| ComplexKahlerGeometry K8 | `TauCetiRoadmap/ComplexKahlerGeometry/README.md:366` preserves K8's numbering; line 3317 begins its Frölicher adapter, with ownership restricted to that instance at line 3335. |
| HeegaardFloer and MorseTheory | `TauCetiRoadmap/HeegaardFloer/README.md:1019` owns the finite filtered-module-chain adapter. `TauCetiRoadmap/MorseTheory/README.md:1419` consumes DGFloer's generic carrier for critical-band filtrations. Neither owns the general abelian-category convergence language. |

Ownership searches used `roadmaps grep` (object terms, not just proposed names), `roadmaps show`, direct searches of main/Completed and board packages, and **449 existing README/Lean files from the supplied 236-head index**. The open-head object search produced 158 candidate lines; the general-abstraction matches did not identify another owner. The closest available main scopes were read. A separate name search found no collision for the new acceptance declarations or the generic bidegree/repleteness names; no fully qualified name collision was established for the other retained declarations. The supplied overlap record has no second copy, conflicting edit, dropped cited id or citation defined only by an open revision. Closest open revisions not included in the supplied file index were not independently fetched; see Not verifiable.

The exact-couple morphism gap is declared identically at `packages/SpectralSequencesAndConvergence/design/plan.json:1881` and `packages/SpectralSequencesAndConvergence/README.md:345`, with supplier StableHomotopyKTheory §7.22. It specifies fixed degrees, commuting D/E maps, identities, composition and functorial derivation. These form one needed morphism interface, not unrelated demands. No earlier/pinned carrier supplies that interface. The existing gap is neither vague nor unowned; the review remains conditional on that contract, without treating its present absence as a defect.

The required dependency command, run on this README with the supplied order and main checkout and `--movable --pr 14997`, returned:

```text
depcheck: 242 roadmaps, 2194 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. StableHomotopyKTheory and this roadmap occupy successive order entries 17 and 18. The proof dependency direction is towers → limit page → filtered convergence → spectral-object and filtered-complex criteria → exact-couple identifications → conditional convergence. Later consumer names occur in consumer/example contexts, not supplier contracts.

### Pinned-library and policy checks

Pins in `lake-manifest.json`: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`; Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`.

| Pin evidence | Consequence for the audit |
|---|---|
| `Mathlib/Algebra/Homology/SpectralSequence/Basic.lean:36`: page and iso fields; Hom at line 51 | The native carrier contains no recursively marked cycle/boundary tower, limit page or convergence structure. Its iso points from page homology to the next object, as §1.2 uses. |
| `Mathlib/CategoryTheory/Filtration/Basic.lean:44`: `toMonoOver : I ⥤ MonoOver X`; FilteredObject at line 73 | Filtration data imposes monos, not exhaustion, separation or completeness. Constant filtrations remain legal. |
| `Mathlib/Algebra/Homology/ComplexShape.lean:163`: `Rel i j := i + a = j` | Arbitrary displacement, including zero, is allowed for exact-couple assembly. The BidegreeAssignment relation law separately excludes total-degree-zero loops. |
| `Mathlib/Algebra/Homology/SpectralObject/HasSpectralSequence.lean:143`, `:214`, `:394`, `:437` | Integer indices, Fin clamping, and first/third-quadrant vanishing conditions agree with §§4.1,4.5. |
| `Mathlib/Algebra/Homology/SpectralObject/FirstPage.lean:54`, `:59`, `:64` | First-page computation instances exist for the three EInt recipes. The finite recipe instance is genuinely additional. |
| `Mathlib/CategoryTheory/ObjectProperty/Kernels.lean:76`, `:123` | Closure is under all limit kernels/colimit cokernels, not only chosen representatives. Along with ContainsZero this supports isomorphism closure and v(0)=0 in the Euler route. |
| `Mathlib/CategoryTheory/CofilteredSystem.lean:137` | Existing IsMittagLeffler uses ranges of a Type-valued functor. It is not the arbitrary-abelian-category image predicate of line 315. |
| `TauCeti/Algebra/Homology/SpectralObject/Stabilization.lean:45`, `Abutment.lean:92` | EInfty and its cokernel presentation have the repaired file ownership; neither is an arbitrary native spectral sequence's limit page. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/SpectralObject.lean:224`, `:241` | The new §5.3 adapter has the required cokernel comparison and its naturality. No direct one-lemma HasConvergenceBounds theorem is supplied. |
| `TauCeti/Algebra/Homology/SpectralSequence/Filtered/FirstPage.lean:89` | d₁ uses the native connecting map, without a sign insertion. |
| `TauCeti/Algebra/Homology/SpectralObject/Comparison.lean:121`; `SpectralSequence/Filtered/Exhaustive.lean:200` | Pinned comparison needs endpoint vanishing; module exhaustive comparison needs graded-piece bounds. The retained signatures are genuine variants. |
| `TauCeti/CategoryTheory/GrothendieckGroup/EulerCharacteristic.lean:165` | Native engine is an integer-indexed complex with finite interval bounds and a homology relation. It does not already state finite-support spectral-page Euler invariance. |
| `TauCeti/CategoryTheory/Preadditive/TowerDifference.lean:77`, `:122`, `:150`, `:165` | Supplies 1−s, its limit-kernel construction, naturality and pro-zero invertibility; does not state the general ML theorem or Boardman comparison system. |
| `TauCeti/CategoryTheory/Limits/Replete.lean:91`, `:107`, `:118`, `:357` | Native repleteness concerns projections from existing limit cones; countable AB4* follows with products. It neither assumes nor defines lim¹ vanishing. |
| `Mathlib/Algebra/Category/ModuleCat/AB.lean:30`, `:38`; `Projective.lean:60`; `EpiMono.lean:67` | AB5/AB4* instances use same-universe modules; enough projectives uses Small R. Epi preservation of forgetful functor works in the universes claimed by §7.2. |
| `Mathlib/CategoryTheory/Functor/EpiMono.lean:158`; `TauCeti/Condensed/Light/Replete.lean:45` | Faithful reflection has a generated epi dual, and native light condensed repleteness exists. These are not unresolved symbol-search misses. |

`git diff --stat origin/main...HEAD` lists 11 changed files, all inside `packages/SpectralSequencesAndConvergence/`. The acceptance file has one `import Mathlib`, five existing used Tau Ceti imports, the required namespace and module inventory, and docstrings on all 13 declarations. No `set_option`, sorry-defined data, `lemma`, `True` placeholder, admitted example, process narrative or computational algorithm was found in README/Suggested.lean. The only changes made during this review are the report and scratch notes.

### Source verification and independence

The source-key citation count, excluding the References list, is **87**: stacks-012K 42, helle-rognes2024 21, weibel1994 11, boardman1999 5, eilenberg-moore1962 2, bhatt-scholze2015 2, and one each for browning-sawin2020, mccleary2001, massey1952 and cartan-eilenberg1956. Repeated citations are counted; subsidiary locators under the same source-key occurrence are not separate occurrences.

| Source | Locators read and comparison |
|---|---|
| stacks-012K | Definition 10.1/Lemma 10.3 (lines 1151–1185); Definition 19.1 (2349–2368); Definitions 20.1–20.2 (2598–2637); Definition 21.1, Lemma 21.2, Definition 21.3, Lemma 21.4 (2653–2703); §23 and Lemmas 23.2–23.3 (2834–2905); §24 Definitions 24.1,24.5,24.7,24.9 and Lemmas 24.2–24.4,24.6,24.8,24.10–24.13 (2966–3240); Definition 31.2/Lemma 31.3 (3715–3735). Generalising the page-step argument to arbitrary page shapes is explicitly identified; no source-only coproduct hypothesis is silently used. |
| helle-rognes2024 | Lemma 2.2, Definitions 2.3,2.5,2.7, Remark 2.4, Lemma 2.6 (65–98); Definition 3.1 and §3's listed definitions, lemmas and Theorems 3.9–3.10 (103–247); Definition 4.5 and Remarks 4.6,4.10 (291–335); Example 8.1 (943–967). Reverse filtration indexing and the total-degree +1 shift are computed in the package. |
| bhatt-scholze2015 | Definition 3.1.1 (701–702), Proposition 3.1.10 and proof (755–770). The source concerns abelian sheaves on a replete topos; §7.2 explicitly proves the arbitrary-category extension. |
| browning-sawin2020 | Theorems 1.1 (57–75) and 2.7 (568–587): finite filtration-index support, odd-page differential vanishing and convergence range agree with the example. The roadmap does not reproduce the source's large E₁ formula or assert degeneration on odd pages. |

The starting-page error in stacks-012K Lemma 24.13 has a concrete witness: put `K⁰=K¹=⊕_(i≥0) k`, with identity differential, and filter both terms by the tails `⊕_(i≥max(p,0)) k`. Every stage is acyclic, so both endpoint cohomology hypotheses hold with zero groups. Nevertheless `E₀^(p,−p)=k` for every p≥0, giving infinite support in total degree 0; all E₁ terms are zero. This separates the false E₀ boundedness assertion from the correct E₁ assertion.

Wording was compared for the 59 explicit source-line citations and six additional prose passages: the convergence dictionary, the page-Euler regrouping route, the continuity-at-top route, the partial-sum proof of completeness, the convergence-bounds docstring, and the repleteness docstring. No distinctive copied sentence, clause-by-clause substituted sentence, source table, figure or exercise list was identified. Repeated mathematical formulas, forced hypothesis lists and standard terminology were not counted as copied expression. No adaptation from a separate public Lean formalisation was identified.

The largest-share source's contents are readable at stacks-012K lines 7–39. The numerical correspondences are Layer 1 ↔ §20, Layer 2 ↔ §§10,24, Layer 3 ↔ §§19,24, Layer 4 ↔ parts of §24 with Helle–Rognes §4, Layer 5 ↔ §24, Layer 6 ↔ §§21,23, Layer 7 ↔ §31 and Helle–Rognes §3. This is not a one-to-one run of that table of contents: §24 is split among four layers, the exact-couple sections move after filtered complexes, and the spectral-object layer has no corresponding Stacks chapter. The dependency lines §1.4←§1.2, §3.2←§1.4/§2.1/§3.1, §4.4←§4.3, §5.3←§4.4 and §7.4←§6.2/§7.1–§7.3 account for the construction order. No arrangement finding was established.

Source independence: 65 passages compared with 4 readable sources, no distinctive reproduced wording or imported arrangement found; largest share stacks-012K, 42 of 87 source-key citation occurrences; contents compared with stacks-012K: independent. Wording against the six settled uncertified works was not tested.

## Not verifiable

- The six settled uncertified works were not reopened: weibel1994, boardman1999, eilenberg-moore1962, mccleary2001, massey1952 and cartan-eilenberg1956. Their exact text, wording and locators remain uncertified. No new reference request is needed.
- No fresh Lean elaboration was run. The worker's supplied `#check` signatures cover all 13 actual declarations; the extraction's extra `that` diagnostic is explained above. Suggested.lean was not edited.
- The categorical cofinality/pro-isomorphism proof for lim¹ in §7.1 and the complete two-index product-complex argument of §7.3 were not reconstructed in full. The stated module examples and source formula (3.1) were checked; the supplied source proves its theorem for graded modules. No counterexample to the stated AB4* generalisation was established.
- The light condensed-module Check is supported by its pinned repleteness instance, not by constructing and computing a nontrivial locally-surjective tower here.
- The closest open AlgebraicTopology/EnhancedDerivedSheaves revisions and ArithmeticGaloisDuality listed by overlaps are not in the supplied 236-head file index. Their heads were not independently fetched. Main versions of the first two were checked; ownership against the supplied 236 heads was checked. ArithmeticGaloisDuality has no folder in the supplied main checkout.
- Published/preprint numbering beyond what the supplied manifests certify was not independently re-established. All source-text comparisons here refer to the recorded cached versions.

## Source issues

- **Misprint** in stacks-012K at Lemma 24.11 proof, printed page 65 (line 3162): the source says vanishing in degree n removes the differential's target condition; it should be vanishing in degree n+1; affects the proof.
- **Error** in stacks-012K at Lemma 24.13(1), printed page 66 (lines 3208–3215): the source says cohomological endpoint bounds imply boundedness at the starting E₀ page; it should be boundedness starting at E₁, since acyclic graded summands can give infinitely supported E₀; affects a stated result.
- **Misprint** in stacks-012K at Lemma 24.13 proof, printed page 67 (lines 3224–3226): the source says a degree-n preimage is the differential image of F^(p+r)K^n plus cycles; it should be F^(p+r)K^n plus cycles, for r≥1; affects the proof.
- **Misprint** in stacks-012K at Lemma 24.13 proof, printed page 67 (lines 3229–3232): the source says a degree-(n−1) cohomology isomorphism gives the degree-n boundary equality; it should be injectivity in degree n, with threshold p₁(n); affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 2.2 proof, printed page 2 (line 69): the source says the exiting differential's image lies in the cycles at its source; it should be the entering differential's image, indexed s+r; affects the proof.
- **Misprint** in helle-rognes2024 at Lemma 3.13 proof, printed page 4 (line 186): the source says π from the inverse limit is a colimit structure map; it should be an inverse-limit projection; affects nothing.
- **Misprint** in helle-rognes2024 at Proposition 4.9 proof, printed page 6 (line 332): the source says the incoming-image calculation uses index s−r; it should be s+r, as in the proposition; affects the proof.
- **Misprint** in bhatt-scholze2015 at Proposition 3.1.10 proof, printed page 17 (line 766): the source says G_n is a product of F_n over i≤n; it should be the product of F_i over i≤n; affects nothing.

## For the human reviewers

- **Not tested.** Wording and contents of the six settled uncertified works in `packages/SpectralSequencesAndConvergence/sources.toml` remain untested. The largest-share source, stacks-012K, was available and its wording and contents were compared.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "4a46526ce0ca049ff91c6bdb18adeca7fe0f72f8", "job": "RT-SpectralSequencesAndConvergence~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
