<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1205#issuecomment-6442420721 -->
Red team round 2 pass a (codex) of 5d9cc0a

Verdict: needs_changes

1. **F01** (P2) The modified-adele carrier excludes the torsors used to define descent

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:237`, “X a smooth projective geometrically connected K-variety” and “a point of Z^ξ(A_K)_•”.

   **Claim:** The newly owned modified-adele construction supplies the carrier for every finite étale torsor and its twists in the next sentence.

   **Witness:** Set X=Spec K, G=C₂ and Z=Spec K ⊔ Spec K, the trivial G-torsor. Z is not geometrically connected. Its required modified adelic carrier is outside the construction's stated domain.

   **Exact repair text:** “For every proper finite-type K-scheme T, without a connectedness or smoothness assumption, define T(A_K)_• := ∏_{u finite} T(K_u) × ∏_{u infinite} ConnectedComponents(T(K_u)), with the componentwise surjective projection from T(A_K), natural for K-morphisms of proper finite-type schemes. Now let X be smooth projective and geometrically connected. Define survival and the finite descent locus using this construction for all finite étale torsors Z→X and their twists.” Apply the same general domain to the carrier API and scope paragraph. Keep the existing hypotheses on the descent/section theorems.

   **Repair test:** For the trivial C₂-torsor each finite local factor Z(K_u) has two elements and each archimedean component factor has two elements. The projection to the singleton carrier of Spec K is defined and surjective. This also handles disconnected twists and the empty proper scheme.

2. **F02** (P2) The real-place component interpretation needs an additional hypothesis

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:208`, “at a real place a section class determines at most a connected component of X(K_u)”.

   **Claim:** The paragraph presents a connected component as the real-place substitute for point localisation, but §0.3 allows arbitrary geometrically connected separated finite-type X. That scope does not support even a component-valued localisation.

   **Witness:** X/ℚ: z²−x²−y²=1 has two real components, containing (0,0,±1), but its geometric étale fundamental group is trivial. Both points therefore give the unique real section class.

   For a direct verification, X is smooth because its three partial derivatives cannot vanish on X. Its real locus is the two graphs z=±√(1+x²+y²). Over ℂ, change coordinates to u²+v²+w²=1. Writing a+ib gives a·b=0 and ‖a‖²=1+‖b‖²; this identifies the complex quadric with TS², which retracts to simply connected S². Riemann existence (ComplexComparisonPartII §C6.2) makes its geometric étale fundamental group trivial. Thus the component set has cardinality 2 and the section-class set cardinality 1.

   **Exact repair text:** “No real-point localisation is defined here: at a real place the Selmer condition asks only that the restricted section class belong to the image of X(K_u). For general X it need not determine a connected component.”

   **Repair test:** Both displayed real points satisfy the image condition, and the repaired paragraph does not assign either of the two components to their common section class. The finite-place localisation construction is unaffected.

3. **F03** (P1) The unequal-dimension repair has no family or period-domain supplier

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:1125`, “the relative dimension at y′_i, which may vary with i”; the example at line 1131 has relative dimensions 1 and 2.

   **Claim:** The constructions of §§1.2, 5.2–5.4 and 7.1 apply to this family.

   **Witness:** `TauCetiRoadmap/MordellLawrenceVenkatesh/README.md:1053` requires constant relative dimension; line 1388 requires a free E-module of rank 2d. Over E=F×F, the example has component ranks (2,4), hence no such free module.

   The package itself also imposes constant positive relative dimension at line 333 and uses one d in its period-dimension Check at line 887. The corrected numerical bound B=6 is valid, but the example and the newly stated generality are not supplied by those carriers. This is a new defect introduced while repairing r1b.F02, not a rejection of its total-rank correction.

   **Exact repair text:** Add to the MordellLawrenceVenkatesh supplier subsection and to the plan's gaps: “What MordellLawrenceVenkatesh must provide (gap:variable-rank-abelian-by-finite): Extend §§2.1–2.4 and 3.8–3.9 to a polarised abelian scheme of locally constant relative dimension over a finite étale cover, with its finite locally free H¹ module and the product of Weil-restricted Lagrangian varieties indexed by the constant-rank components.” Explicitly allow this supplied generalisation in §§1.2, 1.3 and 5.2–5.4; replace the §5.4 dimension Check by “dim H_y₀ = Σ_i [L_{w_i}:K_v] d_i(d_i+1)/2.” Retain constant d>0 where the trichotomy requires it. Retain B equal to the total rank in §7.1.

   **Repair test:** For an elliptic curve and an abelian surface over the two components, H¹ has ranks (2,4), total rank B=6, and period variety ℙ¹×LGr(2,4), of dimension 1+3=4. The new supplier contract covers this object; the constant-rank supplier does not.

4. **F04** (P3) Two definitions still lack three discriminating Checks

   **Location:** `packages/GaloisSectionsPadicPeriodMaps/README.md:376–380` and `:850–853`, including “The rank of R¹π_*ℚₚ over π_*ℚₚ is 2d” and “At the Hodge point Φ₀”.

   **Claim:** These Check blocks test the constructions of the relative symplectic pair and the filtered period retwist.

   **Witness:** §1.3 repeats its fibre, Chern-class and rank API; its two Legendre bullets test one example. §5.2 repeats its Hodge-point API and unit specialisation, leaving only the elliptic identification and non-Lagrangian exclusion as distinct tests.

   **Exact repair text:** Replace the redundant §1.3 bullets by these three Checks: “For E×ℙ¹→ℙ¹, the geometric monodromy on H⁰ and H¹ is trivial, with ranks 1 and 2. For the Legendre family, H⁰ has rank 1 and H¹ has rank 2 with Zariski-dense SL₂ geometric monodromy. For E×E —pr₂→ E —[2]→ E with E:y²=x³−x, geometric monodromy on H⁰ is the regular permutation action of E[2]; its invariant dimension is 1 rather than the 4 of a constant rank-four algebra, and H¹ has total rank 8.”

   Replace the Hodge-point and unit-specialisation Checks in §5.2 by: “For an ordinary elliptic crystalline fibre over ℚₚ, take Frobenius eigenlines e,f of slopes 0,1. The flags e,f,e+f form three diagonal-automorphism orbits. Retwisting by e has t_H(e)=1>t_N(e)=0 and is not weakly admissible; the other two flags satisfy the subobject inequalities. All three remain points of the period variety.” And: “For A=F×F and V=F²⊕F² with the two standard forms, the graph of diag(1,−1) is a two-dimensional Lagrangian for the trace form, since ω(v,w)+ω(Dv,Dw)=0. It is not A-stable: (1,0)·(v,Dv)=(v,0) leaves the graph for v≠0. Hence it is excluded from the A-linear period variety.” Keep the existing four-space non-isotropy Check.

   **Repair test:** The replacement tests distinguish trivial, finite nontrivial and infinite geometric monodromy; they also distinguish the whole period variety from its admissible locus and from the larger trace-form Grassmannian. The displayed dimensions and pairings give their values without restating the definitions.

## Previous findings verified at this head

The earlier reports use F01, …; IDs below are qualified by pass. None was marked “not actionable in this package”, so no settled-finding exclusion applies. Quotes below are from the repaired README.

| Earlier finding | Status at this head | Repaired passage and independently recomputed witness |
| --- | --- | --- |
| r1a.F01, field-independent auxiliary-prime minima | Repaired | §8.6, line 1404: “for curves of genus 3 over ℚ”. At q=23 the old numerical inequality is approximately 0.00306<1/56; at q=11 the new good-reduction inequality is approximately 0.01628<1/26. For K=ℚ(√5,ζ₁₁+ζ₁₁⁻¹), q_v²≡1 modulo 5 and 11 away from those primes; at the exceptional places the same divisors divide q_v(q_v²−1). Thus q=11 and 23 fail the relevant divisibility conditions over this K, as the new negative Check states. |
| r1a.F02, rational local systems versus π₁ representations | Repaired | §1.3, line 360: “lies in the isogeny category … the comparison with arbitrary rational local systems on a normal Noetherian base is not needed”. A lattice pᵃℤₚ is sent to pᵃ⁺¹ℤₚ by nodal monodromy p, so the revised category correctly excludes it. Although IG.0.3 retains a restrictive scope note, its explicitly consumed EtaleCohomologyFoundations §F.0.2 (lines 203–229) supplies finite monodromy and paths on every connected nonempty scheme, explicitly including Spec k[x₁,x₂,…]. Together with the integral-system equivalence this supplies the repaired route; no new gap is needed. |
| r1a.F03, §1.4 tautological Checks | Repaired | §1.4, line 405, the two “[2]” fibre Checks replace the two repetitions. At 0, E[2] consists of four rational points, so dim A^G=4. Above (0,0), x=±i and y=±(1∓i); complex conjugation has two orbits, so dim A^G=2. Both total H¹ dimensions are 8. |
| r1a.F04, nonexistent general modified-adele supplier | Partly repaired | §0.4, line 237: “Construct the modified adelic carrier”. Ownership now belongs here; Heights §3.17d is no longer asserted to supply it. P¹, Spec K and the two-component real elliptic curve give archimedean component counts 1,1,2. Its new domain omits disconnected torsors: S01. |
| r1a.F05, repeated Checks in §§1.7,4.5,6.2,6.5,9.3 | Repaired for the cited bullets | §6.2, lines 954–955: “x²+y²+z²=0” and “four idempotents”. A primitive 2-adic triple has sum of squares 1,2 or 3 modulo 4, never 0; a quadratic field has 2 idempotents, versus 4 for ℚₚ². §6.5 now computes (1,2g) and (2,4g); §9.3 computes fixed places (3),(1+i) and exchanged places (2±i) of ℚ(i). The cited projection and diagram repetitions have been deleted. Other Check defects are S04. |
| r1a.F06, non-discriminating fibre Checks | Repaired | §1.2, lines 351–352: “Split finite base” and “Non-split finite base”. For two elliptic components the dimensions of H⁰ invariants are 2 and 1 respectively, while dim H¹=4 in both cases. The latter is induction from the quadratic extension, also when ramified or p=2. |
| r1b.F01, modified adelic carrier | Partly repaired | Same new §0.4 construction and 1,1,2 component tests as r1a.F04; the incorrect supplier attribution is removed. The newly constructed carrier still cannot be applied to Spec K⊔Spec K: S01. |
| r1b.F02, insufficient root-degree bound for unequal dimensions | Partly repaired | §7.1, line 1125: “B := dim … = Σ_j 2d_j·[L_{w_j}:K_v]”. For dimensions 1 and 2 over a split degree-two base, B=2+4=6, whereas 2d₁δ=4. Taking powers of a root cannot increase its field degree. The numerical repair works; the required variable-rank family and period carriers remain outside the current suppliers: S03. |
| r1b.F03, number-field topology cited to function-field section | Repaired | Lines 65,986,1119 now cite “§§2.4, 2.11”. Heights §2.4 supplies the number-field adelic topology and §2.11 proper local compactness/product identification. For ℙ¹(ℚₚ), properness gives compactness; for ℚₚ, the sequence p⁻ⁿ is unbounded. The corrected sections have precisely this distinction. |

## Statement-by-statement adversarial record

All 59 numbered target blocks were read, including their hypotheses, API, proof route, Checks and Examples. The following are explicit tests, not proofs of the general theorems. Source/theory verification is recorded separately below. In the result column, “retained” means these instances do not refute the statement. Out-of-scope cases are rejected by the indicated hypothesis, not silently evaluated using a total-function convention.

| README statement | Instances and values computed on both sides | Result; change |
| --- | --- | --- |
| §0.1 Restriction of section classes | Spec K: both global and local section sets have one element; the fibre-product projection is identity. Over ℂ the absolute group is 1. In ℤ̂⋊C₂ with inversion, conjugation by a sends the section parameter b to b+2a; a=−2 sends b=2 to −2, preserving the geometric-conjugacy class. | Retained; completion restriction uses geometric base change, not an arbitrary extension-of-scalars assertion. |
| §0.2 Local injectivity | For a profinite abelian A(F), a point divisible by every n has zero image in each finite quotient: take n equal to its exponent, so n·quotient=0. For E:y²=x³−x the four rational 2-torsion points remain four distinct points/classes over every ℚₚ, including p=2. Over ℝ the identity component is divisible and this argument gives no injectivity. | Retained; finite-place hypothesis essential. |
| §0.3 Selmer sections/localisation | Spec K gives 1 section and 1 localisation. A missing real local point gives empty Selmer set, of size 0. Full rational 2-torsion gives 4 distinct localisations. The affine quadric in S02 has 2 real components but 1 section class. | Definition and finite localisation retained; real-place prose needs S02. |
| §0.4 Modified adeles/descent | Real factors of Spec K, ℙ¹ and E:y²=x³−x have component counts 1,1,2. For ℙ¹ geometric π₁=1, so every adelic point survives after twisting. The trivial C₂-torsor over Spec K has 2 geometric components and falls outside the new carrier's domain. | S01. |
| §0.5 Harari–Stix equivalence | On Spec K, the adelic tuple, section and finite-descent projection are all singletons. On 𝔾_m, the diagonal tuple 1 has zero Kummer evaluation and the point section, testing the nonproper direction. Empty local-point set gives neither an adelic tuple nor a Selmer class. | Both directions supported by hs Theorem 2.1 with all places; no section-conjecture assumption. |
| §1.1 Symplectic pairs | V=0 gives the unique map 0→Hom(0,L)=0, an isomorphism, while L must still have rank 1. The zero form on F² has radical dimension 2 and fails perfection. A=ℚₚ² has 2 ℚₚ-points; a quadratic field has 0; ℚₚ[ε]/ε² has 1 although dim A=2. | Retained; rational algebra points, rank-one target and multiplier data matter. |
| §1.2 Fibre pair | E/F gives (dim H⁰,dim H¹)=(1,2). Two split elliptic components give (2,4) with H⁰-invariants 2; an elliptic curve over quadratic L/F gives (2,4) with invariants 1. The induction index is 2 whether ramified or unramified. | Existing constant-d statement retained; variable-rank extension required by S03. |
| §1.3 Relative pair/Chern class | Constant elliptic family has geometric monodromy 1 and exterior ranks 1,2,1. Legendre has rank 2 with infinite geometric monodromy. Nodal monodromy p sends pᵃℤₚ to pᵃ⁺¹ℤₚ, excluding every stable lattice. | Lattice repair retained; S04 adds discriminating Checks. |
| §1.4 Pair of a section | In the [2]-family, the origin gives 4 fixed coefficient points and dim V=8. Above (0,0), the four halves lie in ℚ(i), arranged in 2 conjugate pairs; invariant dimensions are 4 versus 2. | Retained; actually separates section pairs. |
| §1.5 Restriction/fibre comparison | Trivial rank-one lattice gives rank 1 and identity transport. A quadratic finite-cover fibre has total rank 2, with invariant rank 2 for the split action and 1 for the transitive action; chosen path transport conjugates the action without changing these ranks. | Retained; no path-independent marked fibre is asserted. |
| §1.6 Local section interpolation | For the point section of a constant elliptic family, both local pairs have ranks (1,2), with pairing target ℚₚ(−1). Restricting the [2]-family gives the same 4-point permutation algebra, hence invariants 4 or 2 on the two tested sections. | Retained. |
| §1.7 Adelic LV locus | A constant global elliptic family is interpolated by one global pair of ranks (1,2), so its locus is the whole product. If one local point set is empty, product and locus both have size 0. The quantifier is one pair before all places. | Retained. |
| §1.8 Selmer-to-LV inclusion | A rational section uses its actual fibre pair at all places: ranks and pairings agree place by place. Empty Selmer set maps to ∅⊆LV. For the constant family, the inclusion lands in the whole local point set. | Retained; no finiteness claimed for the constant family. |
| §2.1 Filtered discrete modules/D_pH | Unit has End=ℚₚ; Hom(unit,ℚₚ(−1))=0 since a Frobenius-compatible nonzero scalar would have valuations differing by 1. Zero has End=0. Index-two induction gives dimensions 2, while its tensor square has dimension 4; induction of the tensor unit remains dimension 2. | Retained; induction is lax monoidal, and the de Rham unit induced from L is L, not a split algebra over F. |
| §2.2 Automorphism groups | Rank-zero Aut=1 but multiplier-retaining GSp=𝔾_m. A rank-two diagonal map diag(2,3) multiplies the form by 6, whereas exact preservation requires multiplier 1. Scalar λ gives λ². | Retained; no rank-zero embedding into Aut. |
| §2.3 Retwist orbit criterion | Ordinary split Frobenius has diagonal centralizer on F²; lines e, f and e+f occupy exactly 3 orbits. Within the third orbit diag(1,b/a) sends e+af to e+bf for a,b≠0. Neither eigenline is in that orbit. | Retained in both directions. |
| §2.4 Dimension bounds | For rank d=0, End dimension 0≤0². For the unit d=1, End dimension 1=1². In symplectic rank 2, dim GSp₂=4=1(2·1+1)+1; rank zero gives dim 𝔾_m=1=0+1. | Retained. |
| §3.1 Self-conjugate places | ℚ has no CM subfield, so all finite places qualify. In ℚ(i), (3) and (1+i) are fixed by conjugation, while (2+i) and (2−i) are exchanged. The ramified place (1+i) is self-conjugate but not friendly. | Retained; ramification is allowed. |
| §3.2 Conjugate-place weights | ℚₚ(−1): jumps 1+1=2, equal to weight 2. Finite-order character: 0+0=0. At a self-conjugate place, an odd pure weight would require 2k odd, impossible for integer k. | Retained; ℚₚ coefficient hypothesis prevents substituting a labelled CM character over a larger coefficient field. |
| §3.3 Finite-order twist | For χ=χ_cyc⁻¹, twisting by χ_cyc gives 1; for χ=εχ_cyc⁻¹ with quadratic ε, the twist is ε and its square is 1. Restriction of an idele character along a diagonal gives a product over places, whereas norm descent retains the individual local norm. | Retained; proof uses norm descent. |
| §3.4 Average Hodge degree | Elliptic H¹ over L=K: left sum=1, right=1·2/2=1. A degree-two induced elliptic H¹ gives 2=1·2·2/2. V=0 gives 0=0; no mean 0/0 is needed. | Retained, with local-degree weights. |
| §4.1 Horizontal specialisation | For the constant lattice on a zero-dimensional polyannulus, both period modules and comparison are identical. A cyclotomic rank-one lattice specialises with the same character at both points. Over ℚ₃, z²=t at t=1 is split and at t=2 is unramified quadratic, giving H⁰-invariant ranks 2 versus 1; it cannot satisfy the full-horizontal-basis hypothesis. | Retained conditional on declared horizontal-period gap. |
| §4.2 Disc reduction | Over residue field 𝔽₂, two distinct residues exhaust the choices for a third centre. Over 𝔽₄ and 𝔽₈ there are respectively at least 2 and 6 remaining residues. The two unramified subgroups generate because 2ℤ̂+3ℤ̂=ℤ̂. | Retained, including p=2. |
| §4.3 Canonical transport | At y=y₀, comparison compatibility forces T=id. For three points, c_z⁻¹c_y·c_y⁻¹c_x=c_z⁻¹c_x; the cocycle and inverse identities agree. A zero fibre has the unique 0→0 isomorphism. | Retained; uniqueness is tied to the actual comparison. |
| §4.4 Smooth-proper family transport | Constant elliptic family in degrees 0,1,3 has dimensions 1,2,0 on both fibres and identity transport. Moving Hodge lines are compatible with constant unfiltered D_pst; no filtration-preservation assertion is made before retwisting. | Retained. |
| §4.5 Period control | T=[[1,0],[1,1]] sends e₁ to (1,1), while the period pullback of span(e₁) is (1,−1). T⁻¹T=I; at the centre Φ=F¹. The two lines remain distinct over ℚ₂. | Retained; inverse convention correct. |
| §5.1 Symplectic p-adic Hodge fibre | Elliptic ranks (1,2), filtration jumps (0,1), pairing line jump 1. On a degree-one divisor of ℙ¹ the traces are 1 and 1; the +1 twist uses a⁻¹, cancelling a. For a quadratic base, H⁰ becomes F×F only after splitting. | Retained. |
| §5.2 Period retwist | For rank 2, every line is Lagrangian and the period variety is ℙ¹. In rank 4, span(e₁,f₁) has ω(e₁,f₁)=1 but the target F² is 0, so it fails. Ordinary e-line retwist gives t_H(e)=1>t_N(e)=0 despite being a valid period point. | Target retained; S04 separates admissibility and A-stability. |
| §5.3 Pair-valued period diagram | Constant elliptic family has one period point and both realisations have ranks (1,2). Moving the line using T above gives (1,−1) in both paths through the diagram. Only actual image objects are inverted under full faithfulness. | Retained. |
| §5.4 Period-domain decomposition | Closed points of degrees 1 and 2, both elliptic, give dim H=1+2=3, dim H⁰=3 and dim H¹=6. In the unequal-rank split example, the correct dimension is 1+3=4 and H¹-ranks are (2,4), outside the imported free-module carrier. | S03. |
| §6.1 S-goodness | ℚₚ⊕ℚₚ(−1) has jumps 0,1 but purity weights 0,2, so fails weight 1. H¹(E)(1) has weight −1 and jumps −1,0, also fails. For V=0 purity/de Rham conditions are vacuous but A must remain unramified outside S. | Retained; no rationality of polynomial factors inferred. |
| §6.2 Local LV locus | Constant global elliptic family gives all Y(F). The conic x²+y²+z²=0 has no ℚ₂-point since a primitive triple sums to 1,2 or 3 modulo 4. Split ℚₚ² has 4 idempotents versus 2 in a quadratic field, so those algebras cannot interpolate one another. | Retained. |
| §6.3 Period non-density criterion | A constant elliptic family maps to a point of the one-dimensional ℙ¹, hence is not dense and fails the input. On nonproper ℚₚ, {p⁻ⁿ} is infinite but intersects each bounded closed disc finitely: norm pⁿ→∞. Proper curve compactness removes that failure. | Retained; properness and dimension one are present. |
| §6.4 Global interpolation implies S-good | Constant elliptic family: unramified good-place polynomial degree 2, pure weight 1, and jumps 0,1 at p. Bad places are in S. An empty adelic set supplies no pair and hence no counterexample to the conditional statement. | Retained. |
| §6.5 Rational inclusion | Constant dimension-g abelian variety gives ranks (1,2g); doubled finite base gives (2,4g). The same global representation restricts to these fibres at all places, so the two inclusions have actual witnesses. | Retained. |
| §6.6 Forgetting the pairing | Rank 2: ∧²V recovers its determinant-line pairing. For two distinct absolutely irreducible rank-two constituents and nonsquare c, a putative paired isomorphism needs a₁²=c a₂², impossible with a_i≠0; the underlying unpaired direct sum is unchanged. For genus 3, d₂₃=55 and d₁₁=25. | Retained; pairing is a real constraint. |
| §6.7 Coefficient points | Split quadratic fibre gives 2 fixed points; field quadratic gives one orbit of size 2. A totally ramified quartic extension gives orbit size 4 although residue degree is 1. | Retained; degree is the full local degree. |
| §6.8 Principal trichotomy | Σ=∅ gives 0≥0. For a fixed singleton, c reads 1≥1/(d+1). For m=dim W=1, the weight sum forces #Σ_<4≥#Σ/2. With A=ℚₚ[ε]/ε³ and d=1, #Σ=1 gives threshold 1/2, whereas dim A would give 3/2 and falsely fail. | Retained; corrected #Σ bound essential. |
| §6.9 Types (a),(b),(c) | Unit coefficient algebra has index 1: a=false, b=false, c=true. A transitive 5-point algebra has c=false since 0≥5/(d+1) fails. A=0 has c=true (0≥0), whereas totalising size(∅)=0 would give false 0≥1/(d+1). Ordinary elliptic stable weight-zero line has F¹-dimension 0<1/2. | Retained; type b needs a stable weight-one line, not just ordinarity. |
| §7.1 Local class sets T_i | δ=1 forces L=K and B=2d_i. Split elliptic-plus-surface example gives B=6, not 2d₁δ=4. A root α of a degree-B integer polynomial has [ℚ(α^f):ℚ]≤[ℚ(α):ℚ]≤B. A mismatched discrete module contributes 0 orbits; a matched class contributes 1. | Bound retained; S03 repairs the carrier generality. |
| §7.2 Finiteness of T_i | Fixed δ,S give finitely many L; fixed B and weight bound integer minimal-polynomial coefficients. For the unipotent character-line control, characteristic polynomial=(X−1)², weight 0, root degree 1, and each representation has the same stable isotropic line; the infinite projective family is excluded by GSp-irreducibility. | Retained conditional on the stated symplectic Faltings gap. |
| §7.3 Type-(a) non-density | (d,r)=(1,4): orbit dimension ≤3<4. (1,3): 3=3, so the argument does not assert properness. (2,4): 10<12. Scalars remove one dimension because they fix every flag. | Retained; r≥4 and d>0 matter. |
| §7.4 Type-(a) period locus | A quartic global finite base with local degree 4 and GSp-irreducible elliptic H¹ gives ranks (4,8), index 4, and its actual Hodge point qualifies. Degree-one coefficient points have index 1, so the type-(a) locus is empty. The factor bound is 3<4 in the elliptic quartic case. | Retained. |
| §7.5 Finiteness of type (a) | On a closed curve disc a nonzero analytic function has finitely many zeros; a constant period point in ℙ¹ has image dimension 0<1 and fails full monodromy. An empty type-(a) set has cardinality 0. | Retained via supplied disc theorem and compactness. |
| §7.6 Type-(b) factor non-density | In a symplectic plane, four lines e,f,e+f,e+2f have no common nonzero isotropic W meeting each in dimension ≥dim W/2: e∩f=0. Four identical e-lines admit W=e with intersections 1≥1/2. The first two lines still differ in characteristic 2. | Retained conditional on the four-isotropic-Lagrangian gap; zero symplectic space has empty incidence locus in a one-point flag space. |
| §7.7 Type-(b) period locus | E:y²=x³−x over ℚ₅ has #E(𝔽₅)=8 and trace −2. Its split-CM ordinary weight-one line has F¹-dimension 1≥1/2. Over an unramified quartic coefficient field the index is 4 and the example qualifies; with index 1 it does not. | Retained. |
| §7.8 Finiteness of type (b) | Constant elliptic family has coefficient index 1, giving empty b-locus of cardinality 0. On the full-monodromy route, the factor's proper closed locus pulls back to finitely many points in each of finitely many compact curve discs. | Retained, conditional on the stated period and Lagrangian contracts. |
| §8.1 Small-orbit proportion | Trivial nonempty action: 1. Transitive 5-set: 0. A 3-orbit plus 4-orbit: 3/7. Unequal-fibre surjection in the README gives 4/8=1/2>1/5; regular S₃ gives 0, S₃/C₂ gives 1. Empty set is excluded from division. | Both directions of type-c identification retained for nonzero split A. |
| §8.2 Local degree-2/3 fields | ℚ₅: 3 quadratics+1 unramified cubic+3 conjugate ramified cubics=7. ℚ₇: 3+4 normal cubics=7. ℚ₂: 7+4=11. For local degree N=1 the uniform bound is 2³+6³=224, exceeding all three counts. | Retained; embedded fields, not isomorphism classes. |
| §8.3 Fixed torsion | g=2,k=5,q_v=7: gcds with 6,48,342 are all 1; bound 7·25=175<625. k=1 gives M of size 1 and 1≤n_v. For k=41,q_v=5, dual arithmetic Frobenius acts by 5⁻¹=33 mod 41, not 5. | Retained; μ_k∨ and coprimality are necessary. |
| §8.4 Exclusion of type (c) | q_v=5,q=83 gives k=41,d_q=123,n_v=7. Forbidden odd divisors of 5·6·124 are 3,5,31, none dividing 82; 82≥63. Bound 63/(8·41²)=63/13448<1/124 since 7812<13448. | Retained, including bad reduction. |
| §8.5 Auxiliary prime existence | For ℚ₂, q=11 passes divisibility but q−1=10<9·11=99. q=107 has q−1=106≥99 and avoids 3,7 and divisibility by 4. CRT prescribes 3 mod 4 and 2 mod each forbidden odd prime, a unit class. | Retained; q is chosen before S. |
| §8.6 Old/new conditions and density | Genus 3 over ℚ: old q=23 has 4ζ(6)·8/22³≈0.00306<1/56; new q=11 at good reduction has 2ζ(6)·8/10³≈0.01628<1/26. Over K=ℚ(√5,ζ₁₁+ζ₁₁⁻¹), divisibility rules exclude both. A cyclic group has at most Σ_{i=1}⁷φ(i)=18 elements of order ≤7. | Revised ℚ restriction retained; density route requires disjointness and the declared uniform Linnik gap. |
| §9.1 Finite LV locus | For the chosen family, c-locus=∅, so its cardinality contribution is 0 and total size is ≤#a+#b<∞. The ℚ₂ choice q=107 above meets the c-exclusion inequalities. The quantifier is ∃q ∀suitable S, not ∀S ∃q. | Retained conditional on declared inputs. |
| §9.2 Mordell consequence | Injection Y(K)→Y(K_v) gives #Y(K)≤#LV<∞; empty rational set has cardinality 0. Genus-one positive-rank curves have infinitely many rational points and are excluded by g≥2. | Retained as consequence of the existing owner's theorem, without a duplicate Lean declaration. |
| §9.3 Self-conjugate Selmer image | ℚ(i): (3),(1+i) are fixed and covered; (2+i),(2−i) are exchanged and not covered. Empty Selmer set has image size 0. | Retained; no claim at every place of a CM field. |
| §9.4 No-CM all-place theorem | For ℚ the set of CM subfields is empty, so every finite place, including 2 and 3, is self-conjugate. Empty Selmer image has size 0; under the section conjecture its image equals the rational-point image, but that conjecture is not an input. | Retained. |
| §9.5 Finite-descent projection | Harari–Stix gives equality with the finite Selmer image, so both projection cardinalities agree. If one local point set is empty, both are 0. No inference that the whole adelic locus equals Y(K) is made. | Retained; stronger Stoll prediction remains conditional. |
| §9.6 Original/new comparison | At v=2 the old admissibility predicate is false regardless of q; the new q=107 calculation passes. Removing finitely many bad/ramified places changes natural density by 0 but does not yield the every-place statement. | Retained; distinguishes density-one and all-place assertions. |

### Lean declaration and context ledger

| File/declaration | Section variables and instances | Typed result / computed test |
| --- | --- | --- |
| Suggested.lean, entire 32-line file | No declarations, section variables, instances, axioms or admitted data; one `import Mathlib` | Declaration count=0; requested `#check @name` ledger has 0 rows. No Lean process was run. |

The module docstring names 14 headline groups: §0.5; §1.8; §2.1; §2.4; §§3.2/3.4; §4.3; §§4.4/4.5/5.3; §6.8; §§7.4–7.8; §§8.4–8.5; and §§9.1,9.3,9.4,9.5. Its separate Mordell paragraph names the existing owner. None can be stated on the pinned carriers using only a few simple definitions: the missing objects are actual arithmetic section classes, de Rham/filtered discrete realisations, family cohomology, or their geometric period/descent loci. No replacement free predicate or elementary stand-in occurs. The one-tactic padding probe therefore has 0 candidates, and no fully qualified declaration can collide with another roadmap.

## Supplier, ownership and dependency audit

Supplier paths in this table are `TauCetiRoadmap/<name>/README.md`. Existing roadmaps were checked on content main; new supplier folders absent there were read with `roadmaps show` at the indexed head. A revision of an existing roadmap was not substituted for its main version. Each row records the consumed section group, a witness in that version, and the hypothesis or convention that matters.

| Supplier | Resolved witness and contract check |
| --- | --- |
| AnabelianGeometryAndNonabelianChabauty §7.1 (NC.6) | Lines 7873–7972: arithmetic sections, geometric conjugacy, point classes and Kummer comparison. Line 7958 states the field-general divisibility criterion; its number-field corollary is not substituted for the local-field theorem. |
| InverseGaloisAndArithmeticFundamentalGroups §§IG.0, IG.1.3 | Lines 797–806: lattices and their isogeny category; lines 1265–1293: characteristic-zero geometric base change. Its input EtaleCohomologyFoundations §F.0.2, lines 203–229, handles arbitrary connected schemes, including the explicitly tested infinite polynomial ring. |
| ArithmeticGaloisRepresentations §§1.3,1.12,2.1 | Lines 894–909 and 938–945: continuous induction and Mackey, with the inducing subgroup open and the restricting subgroup closed in a compact group. Lines 1415–1439 fix the closure/completion embeddings. Index m multiplies rank by m; no induction from a non-open subgroup is used. |
| HeightsRationalPointsAndObstructions §§2.3–2.4,2.11,2.11a,3.1–3.5 | Lines 924,1050 and 1378–1480: number-field adelic topology, proper local compactness, torsors and twists. The modified carrier at §3.17d, line 1823, is for abelian-variety torsors, so the general quotient is correctly owned here, subject to S01. |
| PadicHodgeTheory §§3.3–3.5,5.1–5.3,7.2–7.3,8.1–8.2 | Lines 682–762,988–1023,1256–1285,1384 onward: filtered period functors, algebraic unramified union, local systems and actual comparisons. Its Tate weight +1 becomes filtration jump −1. Its relative de Rham input does not supply the separately declared horizontal potentially semistable specialisation. |
| CohomologyComparisons §§6.4–6.7 | Lines 1255–1335: trace-normalised comparison, cups, duality and Chern classes, with proper projective compactification for a line bundle. Trace c₁(O(1))=1; the +1 twist uses the inverse Tate-line comparison. |
| MordellLawrenceVenkatesh §§0.4–0.5,0.9–0.12,0.18;1.2,1.4–1.16;2.1–2.4,2.9,2.11;3.1–3.19;4.1–4.3;LV.7–LV.11 | Centralizers at lines 489–511; finite counts at 567–607; orbit dimensions at 674; CM/weight identities at 834–1028; family at 1053; free period module at 1388; old local period domains at 1458–1579; five-Lagrangian theorem at 2250; family/fibres at 2510–2532; full monodromy at 2881; admissibility and Mordell at 2922–2969. Old good-model statements retain their unramified, p>2 restrictions. The new domains are declared gaps; the additional variable-rank mismatch is S03. |
| AbelianSchemesAndArithmeticModuli §§A3.5,A3.7,A4.3–A4.4,A6.30–A6.31 | Lines 1453,1571–1580,1843–1894,3565–3593: pairings, dual H¹/exterior algebra, Weil restriction and separable splitting. Rational cohomology in characteristic zero makes the polarisation degree and 2 invertible, including over ℚ₂. |
| AlgebraicModuliForArithmeticGeometry §1.3 | Lines 580–641: quotients and partial flag bundles with locally free quotient conditions. Rank-one flags in a two-space give ℙ¹; an empty flag gives the base. |
| AdicEtaleGeometry §§A1.1,A1.3 | Lines 2310–2315 and 2950–2970: strong sheafiness and finite-étale local-to-global equivalence for Spa(A,A⁺), including the required affinoid polyannuli. |
| AdicSpacesPartII R1.1,R1.7 | Lines 8497–8525 and 9954–9971: rigid analytification and its adic comparison, with functions and finite-type hypotheses. The comparison is not merely a bijection of points. |
| ComplexComparisonPartII §§C5.2,C6.0,C6.2 | Lines 2787–2802,3993,4140: Gauss–Manin/Betti comparison, finite CW type and finite-cover comparison. A field embedding into ℂ need not be continuous. The affine quadric in S02 has geometric π₁=1. |
| EtaleDualityAndPerverseSheaves §§0.3,0.5 | Lines 515–541 and 745–761: curve H¹, Kummer/Weil pairing, cup and trace. The target is μ_n∨, giving inverse cyclotomic arithmetic Frobenius; alternation at n=2 is supplied separately from graded commutativity. |
| ArithmeticGaloisDuality §R02.3 | Lines 1949–1962: bounded-degree extensions unramified outside a fixed finite S, as subfields of a fixed closure. Both bounds are fixed before the fields vary. |
| WeightsInEtaleCohomology R34.1–R34.2 | Lines 168–180 and 278–290: geometric-Frobenius purity, abelian H¹, and rational integral characteristic polynomials. A subquotient need not have a rational polynomial; the package retains root-degree bounds instead. |
| ClassFieldTheory Layers 5,7,11 | Lines 961–980,1340–1373,1683–1725: Kummer for nonzero n invertible in the field, reciprocity and norms. Arithmetic reciprocity sends a unit u over ℚ₃ to cyclotomic value u⁻¹; at u=4 the value is 1/4. |
| GlobalNumberFields Layers 2,7,8 | Lines 273–301,453–468,470–497: finite ray groups, idele quotient and norms, including the product over all places above a base place. Diagonal restriction is not an individual local factor. |
| LocalFieldsRamification Layers 0,1,2,4 | Lines 403–416 and 512–521 supply power classes, including eight square classes over ℚ₂; the unramified/tame sections give the extensions and arithmetic relation στσ⁻¹=τ^q. |
| LocalGaloisGroups Layer 7 | Lines 1082–1105: full absolute group rank [F:ℚₚ]+2. For degree one the bound is 3 generators, hence at most 2³ and 6³ homomorphisms to S₂ and S₃. The pro-p rank is a different statement. |
| ReductiveGroups Layers 0,3 | Lines 129–147,234–250: affine group functors and subgroups/quotients. Rank-zero multiplier-retaining similitudes form G_m although automorphisms of the zero vector space form 1. |
| Chebotarev Layers 10,13–14 | Lines 410–422,609–621: density and prime-counting inputs. The density of C is #C/#G; the package explicitly imposes cyclotomic disjointness. |
| AnalyticNumberTheoryPartI §0.32 | Lines 738–747: logarithmic-modulus prime distribution. This is not the uniform polynomial least-prime estimate, correctly recorded as a gap. |

The 14 named Mathlib inputs and one Tau Ceti input were checked at the manifest pins (Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`):

| Pinned file | Declaration/body inspected; boundary witness |
| --- | --- |
| `Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:42` and `:87` | `Field.absoluteGaloisGroup`, `Field.absoluteGaloisGroup.map`; the carrier is algebraic-closure automorphisms with Krull topology, not an arithmetic scheme fundamental group. |
| `Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:57` | `ContinuousMonoidHom` includes continuity and a monoid homomorphism; compactness is not a field of the structure. |
| `Mathlib/Topology/Connected/Clopen.lean:510` | `ConnectedComponents` is a quotient by connected components; it is neither the original point set nor path components by definition. Empty input has zero components. |
| `Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:603` | `HeightOneSpectrum.adicCompletion`; completion does not itself choose the embeddings needed for a decomposition subgroup. |
| `Mathlib/LinearAlgebra/SesquilinearForm/Basic.lean:286` and `:595` | `LinearMap.IsAlt`, `LinearMap.Nondegenerate`; alternation gives B(x,x)=0, and nondegeneracy separates both variables. Over a ring this does not alone assert perfectness: B(x,y)=2xy over ℤ is nondegenerate but not perfect. |
| `Mathlib/LinearAlgebra/SymplecticGroup.lean:101` | `Matrix.symplecticGroup` preserves the fixed form exactly. diag(2,3) has multiplier 6, so this carrier is not GSp. |
| `Mathlib/NumberTheory/NumberField/CMField.lean:69` and `:236` | `NumberField.IsCMField`, `NumberField.IsCMField.ringOfIntegersComplexConj`; conjugation exchanges (2±i) and fixes (3),(1+i). |
| `Mathlib/FieldTheory/IntermediateField/Basic.lean:52` | `IntermediateField` includes inverse closure; arbitrary subalgebras are not substituted for fields. |
| `Mathlib/GroupTheory/GroupAction/Defs.lean:49` | `MulAction.orbit` is the range of g↦g•a. Regular S₃ has orbit size 6; its action on S₃/C₂ has orbit size 3. |
| `Mathlib/NumberTheory/LSeries/PrimesInAP.lean:442` | `Nat.forall_exists_prime_gt_and_eq_mod` supplies arbitrarily large primes in a unit residue class, not a uniform polynomial bound for the least prime. |
| `Mathlib/NumberTheory/ZetaValues.lean:457` | `hasSum_zeta_four`; the zero-index summand is 0 under totalised inversion, so the sum agrees with Σ_{n≥1}n⁻⁴. |
| `TauCeti/Algebra/AlgebraicGroup/Symplectic/Basic.lean:122` | `TauCeti.Symplectic.groupScheme` uses the standard constant alternating form. It supplies Sp, not the filtered-module automorphism functor. |

The seven existing gaps have matching slugs, supplier names and needs in `design/plan.json` and the README. Their linked clauses specify one coherent construction/theorem and its compatibility; no unnamed supplier or disjoint request was found. Their absence today is not a finding.

| Declared gap | Minimality/scope checked |
| --- | --- |
| horizontal-pst-specialisation | Actual horizontal period ring and specialisation, beyond the relative de Rham comparison supplied by PadicHodgeTheory. |
| model-free-polarised-fibres | Removes good-model restrictions on geometric pairings and compatible horizontal transport; it does not replace abelian-scheme cohomology already supplied. |
| model-free-period-maps | Extends the old arithmetic-centre/good-model route to every local rational centre and retains inverse transport. |
| symplectic-faltings-finiteness | GSp-irreducibility and bounded algebraic root degree are stronger interface needs than ordinary semisimple GL finiteness with integral rational polynomials. |
| four-isotropic-lagrangians | The existing LV.7 statement uses five Lagrangians and permits non-isotropic W. The four-isotropic theorem is distinct, including rank zero and characteristic 2. |
| kodaira-parshin-local-fibres | Requires the G_F-set at arbitrary characteristic-zero F/K, including local fields; the older rational-point fibre description does not cover it. |
| linnik-polynomial-least-prime | Constants uniform in modulus and residue class are not supplied by §0.32. SieveMethodsAndPrimePatterns line 2364 instead bounds exceptional least quadratic nonresidues, a different theorem. |

Ownership searches used `roadmaps grep` by mathematical object, the package folders and the supplied open-head files. Relevant overlaps were checked in the owners above and in AdmissiblePairsAndPadicHodgeStructures, PadicHodgeRegulators, CohomologyComparisonsPartII, ColemanIntegrationPartII, TropicalAndBerkovichArithmetic and SieveMethodsAndPrimePatterns. Two-lattice Hodge period spaces, syntomic local comparisons, regulators and Coleman periods do not duplicate this package's horizontal filtered-discrete comparison or its section obstruction. Modified adeles for abelian torsors remain owned by Heights; the general proper-scheme quotient is new here. No duplicate fully qualified Lean name exists, since this package declares none. The introduction correctly identifies this extension as Part II of AnabelianGeometryAndNonabelianChabauty and leaves Mordell with its existing owner.

The requested dependency gate completed, with this exact output:

```text
depcheck: 149 roadmaps, 1029 edges, 0 problem(s)
```

There was no UPWARD or CYCLE line and no merge-order mutation. Internal needs follow the stated layer order, with §1.8 using the S-good locus of §1.7 independently of the later filtered-period description.

## Verified sound

Read all 1,539 README lines and all 32 Suggested.lean lines, all three prior review/repair reports, and the repository rules. Counts: **0 Lean declarations; 59 numbered targets; 60 Check blocks containing 185 bullets reviewed; 58 source-locator paragraphs resolved against four cached legal source versions; 24 supplier contract groups checked (22 roadmaps and two pinned libraries); 15 named pinned declarations; 7 matching declared gaps; 9 earlier findings re-audited.** The table above records computed tests for every target. The Check count is coverage, not a claim that all 185 are discriminating: S04 identifies remaining repetitions.

The source audit used bs v1, hs v2, stoll v3 and stix08 v1 exactly as recorded in `sources.toml`. Anchors include bs lines 4–75 (end theorems/sections), 320–736 (filtered categories and weights), 737–929 and 1360–1635 (relative comparisons), 1635–1985 (polarisation and retwists), 2075–2228 (period closure), 2204–2445 (loci/trichotomy), 2451–2659 (non-density), 2660–2817 (local counting/admissibility), and 2817–2928 (section obstruction); hs lines 90–151 and 391–445 (hypotheses/equivalence); stoll lines 118–148,520–651,750–793,1530–1555 (modified descent/conjecture); stix08 lines 1068–1140 (injectivity). Every target's source paragraph was read with its statement and hypotheses; §9.2 instead cites the existing Mordell owner. The source corrections below are not silently attributed to the uncorrected preprint.

The corrected conventions pass the explicit tests: arithmetic versus geometric Frobenius; χ_cyc jump −1 versus H¹ weights 0,1; half the Poincaré class over ℚ₂; inverse horizontal transport; pair versus module; #Σ versus algebra dimension for nilpotent algebras; and positive relative dimension where the orbit argument needs it. The final statements retain every finite place, including 2, ramification and bad reduction. The conditional source conjecture is not used to prove the result.

The read-only git diff contains nine changed files, all under `packages/GaloisSectionsPadicPeriodMaps`; it has no out-of-folder change. The target files contain no computational algorithm, forbidden Lean option, admitted data, `lemma` declaration, PR number or workflow narrative. Suggested.lean imports only Mathlib and names the unavailable headline carriers without substitutes. No library or roadmap file was changed during this review.

## Not verifiable

- No Lean elaboration or build was run, as required by the read-only brief. There are no declarations to expand with `#check @name`, so no signature expansion is missing from the empty ledger.
- Acceptance remains conditional on the seven declared supplier contracts. Their mathematics and scope were examined; no implementation or completed proof is claimed. S03 identifies an additional contract not currently declared.
- Source certification concerns the recorded preprints. The 2025 published bs version was not used, and no claim is made that the errata below persist in that edition. No additional source text was needed or requested.
- Ownership was searched across the indexed corpus and the supplied checkouts, with relevant hits read. Open pull requests for which the brief supplied no checkout were not independently inspected; search hits outside that set were not treated as evidence of an available supplier.
- Computed instances and source comparison do not constitute formal proofs of the future targets. In particular the general horizontal-monodromy and global-finiteness inputs are supplier obligations, not results proved by this review.

## Source issues

- **Gap** in bs at Proposition 2.16(1), printed p. 12 (bs line 609): the source says G_v-averaging yields the normalised trace to ℚₚ; it should be augmented by Frobenius conjugation, since G_v fixes K_v,0, which can properly contain ℚₚ; affects the proof.
- **Gap** in bs at Remark 2.20, printed p. 14 (bs line 718): the source says diagonal restriction to E_v₀ isolates an individual local character; it should be replaced by finite-power norm descent, because diagonal restriction multiplies the local factors; affects the proof.
- **Gap** in bs at Proposition 3.20(8), printed p. 28 (bs line 1451): the source says the preceding proper comparison applies to a line bundle's total space; it should be applied through the proper compactification P(O⊕L); affects the proof.
- **Misprint** in bs at Lemma 4.7 proof, printed p. 36 (bs line 1839): the source says logarithmic differentials are exact; it should be closed, since dx/x on G_m is not exact; affects the proof.
- **Misprint** in bs at Lemma 4.7 proof, printed p. 36 (bs line 1842): the source says dlog has domain the structure sheaf; it should be the sheaf of units; affects the proof.
- **Error** in bs at Proposition 5.3 proof, printed p. 41 (bs line 2100): the source says forward horizontal columns define the transported flag; it should be inverse transport, yielding (1,−1) rather than (1,1) for the displayed triangular two-space test; affects the proof.
- **Gap** in bs at Remark 5.11, printed p. 43 (bs line 2224): the source says the local points of the smooth curve have a finite disc subcover; it should be conditional on compactness, for example properness, since p⁻ⁿ escapes every compact subset of ℚₚ; affects a stated result.
- **Error** in bs at Proposition 6.7(c), printed p. 46 (bs line 2364): the source says the threshold counts dim A rather than its rational characters; it should be #Σ_A/(d+1), or require split reduced A; A=ℚₚ[ε]/(ε³) gives 1<3/2; affects a stated result.
- **Gap** in bs at Proposition 6.9 proof, printed p. 49 (bs line 2536): the source says an S-good coefficient factor meets the integral-polynomial condition of Definition 6.11; it should be a bounded algebraic-root-degree condition, since rational integral polynomials need not pass to factors; affects the proof.
- **Misprint** in bs at §6.3 and Proposition 6.15 proof, printed pp. 49,51 (bs lines 2545,2656): the source says M¹(Φ) is identified with a symplectic pair; it should be M≤¹(Φ), including its degree-zero algebra; affects the proof.
- **Misprint** in bs at Remark 6.23(I), printed p. 54 (bs line 2780): the source says the product ranges over odd prime divisors of q; it should be divisors of q−1, as in the displayed product; affects the proof.
- **Gap** in bs at Remark 6.23(I), printed p. 54 (bs line 2786): the source says excluding small prime divisors relative to the Galois-closure degree ensures cyclotomic disjointness; it should be strengthened by excluding the ramified primes of that closure; affects the proof.
- **Error** in bs at Remark 6.23(III), printed p. 54 (bs line 2802): the source says genus three alone determines the minima q=23 and q=11; it should be restricted to the ℚ example; ℚ(√5,ζ₁₁+ζ₁₁⁻¹) excludes both choices; affects a stated result.
- **Error** in stoll at Lemma 5.8(1) proof, printed p. 20 (stoll line 767): the source says geometric simple connectedness makes all finite torsors trivial; it should be geometrically trivial and trivial after a suitable twist; Spec ℚ(√2) over Spec ℚ refutes literal triviality; affects the proof.
- **Misprint** in stix08 at Remark 46, printed p. 22 (stix08 line 1113): the source says the preceding injectivity result is Theorem B; it should be Theorem 45; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "5d9cc0a689cb3e24a28a353642397f80875ebeb2", "job": "RT-GaloisSectionsPadicPeriodMaps~2a", "model": "gpt-6-astra", "worker": "chris-3"} -->
