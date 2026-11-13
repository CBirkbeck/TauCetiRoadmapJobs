# PerfectoidQuotientsPartII port

Branch: `roadmap/perfectoid-quotients-part-ii`.
Head commit: `9f411af18e502c86575ad8f2e108b317af3c222b`.
Base: `42813dd`; the initial worktree was clean.

Only `TauCetiRoadmap/PerfectoidQuotientsPartII/README.md`, `TauCetiRoadmap/PerfectoidQuotientsPartII/Suggested.lean` and `TauCetiRoadmap/PerfectoidQuotientsPartII/metadata.toml` are committed. The top-level roadmap list and the dependency pins are untouched. The accepted package decisions are retained; its final accepted review has no non-blocking findings to apply.

## Validation

Command: `lake build TauCetiRoadmap.PerfectoidQuotientsPartII.Suggested`.
Exact outcome: `Build completed successfully (18318 jobs).`
Warnings: **16**, all “declaration uses `sorry`”; no other warnings or errors. The module contains 16 headline theorems and three simple definitions.

Final gate summary:

```text
gate PerfectoidQuotientsPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency command outcome, with the supplied order and content checkout:

```text
depcheck: 210 roadmaps, 1912 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. Before committing, the full gate reported zero for every content check and failed only its dirty-worktree check (first the untracked folder, then the three staged files). Its clean-worktree requirement is satisfied by the final commit; the final gate result above is from that commit.

I elaborated a scratch copy with `#check @TauCetiRoadmap.PerfectoidQuotientsPartII.<name>` for **all 19 declarations**, once, and compared every resulting type with the README. Exit 0, with the same 16 sorry warnings. No needed section binder disappeared, and no signature change was necessary. In particular:

- IsSyntomic retains both rings and the specified algebra structure; IsIndSyntomic keeps the common small universe for its finitely presented test algebras. Neither uses the unused prime variable.
- IsPZariski retains p and the ring, and correctly omits the unused primality instance. The semiperfectoid headline retains primality.
- The structural headlines retain perfectoidness, the nonunit instance where needed to form the tilt, the chosen Fontaine generator and its kernel equation, parameter divisibility and completeness, and the prescribed compatible roots.
- Approximation chooses its tilt element before quantifying over all continuous bounded valuations. The independent valuation universe is retained. The nilpotence statement keeps the Tate-ring and pair-of-definition data.
- The regular-local existence theorem keeps p in the maximal ideal. The embedded-cover theorem keeps characteristic zero, maximal-adic completeness and residue-field F-finiteness.
- Both Tor signatures retain the actual inclusion S into the specified absolute integral closure, finiteness, finite étaleness after localization, c in pR, positive n and i, and the specified root sequence and its equations. The conditional theorem retains the cover and its map; the unconditional theorem retains F-finiteness. Multiplication follows the base-changed inclusion in the first Tor argument.

## Draft pull request body

Build the structure theory of integral perfectoid rings with torsion and the ind-syntomic André lemma without completion. Extending PerfectoidQuotients, the roadmap develops tilting identities, fibre products, relative tilting and valuation rings, torsion-free presentations, and the algebraic and valuative inputs for faithfully flat semiperfectoid covers of p-Zariski rings. It then constructs perfectoid covers of regular local rings and derives almost vanishing of Tor along finite subextensions of the absolute integral closure, preserving imperfect F-finite residue fields and all primes.

AI assistance: Codex performed the port, source and ownership checks, mathematical self-review and validation. This is an author-side audit, not an independent mathematical review.

## Suppliers and ownership

The suppliers still represented by new-roadmap pull requests are **PerfectoidQuotients**, **PrismaticCohomology**, **DerivedDeRhamCohomology** and **DeformationAndDerivedPatchingAlgebra**. PerfectoidSpaces, EnhancedDerivedSheaves and StableReduction are on main. No citation requires numbering defined only by an open revision.

I read the supplied overlap and citation leads, then the cited main sections and open heads using the roadmap tools. The three original citation leads are resolved:

- PerfectoidSpaces P7.17, `RegularTower.exists_perfectoidTower`, is named in `TauCetiRoadmap/PerfectoidSpaces/README.md:17510` and specifies the finite-flat regular tower with perfect residue field. It is a roadmap interface, not a claimed pinned declaration.
- DerivedDeRhamCohomology §1.10 names both ordinary flatness criteria in its README and states the Noetherian, regular-element and classical-completeness hypotheses. Those are the contracts consumed here, not generic complete-flatness implies ordinary flatness.

The supplier sections were checked individually: PerfectoidQuotients §§0.2–0.6, 1.2 and 1.4; PerfectoidSpaces P0.1–P0.2, P0.11, P1.4–P1.6, P1.15, P1.24–P1.25, P3.7, P4.15.2, P4.15.4–P4.15.5, P7.16a–P7.17; PrismaticCohomology §§0.61–0.63, 0.79, 2.30–2.31; EnhancedDerivedSheaves §E1.6; DerivedDeRhamCohomology §1.10; DeformationAndDerivedPatchingAlgebra §1.10; StableReduction Layer 1. The downstream locators EtaleDualityAndPerverseSheavesPartII §8.5 and ArcTopologyAndDescent §12.6 were checked at their provided heads; neither becomes a supplier of this port.

The object sweep searched all main and completed roadmap folders, the board packages, and the open-head roadmap index, with an increased result limit to avoid truncating the sweep. Objects searched included syntomic/ind-syntomic and ind-fppf maps, semiperfectoid covers, torsion-free perfectoid presentations, perfectoid fibre products, relative tilting of valuation rings, regular-local perfectoid covers, and the source propositions. I read the closest roadmaps' scope and matching targets: PerfectoidQuotients, DirectSummandsAndBigCohenMacaulay, PrismaticCohomology, PurityForFlatCohomology, PrismaticCohomologyPartIII, PerfectoidSpaces, AdicEtaleGeometry and SchemeAndStackFoundations. The board's SchemeAndStackFoundationsPartII explicitly imports Q7's ring maps instead of owning them.

Ownership conclusions:

- PerfectoidQuotients imports the foundational perfectoid carriers from PerfectoidSpaces and explicitly assigns the general fibre-product/valuation theory and ordinary ind-syntomic André theorem to this Part II. Its modulo-p refinement is distinct from Q9.3's ordinary ring map.
- PrismaticCohomology owns integral perfectoidization and arbitrary-ideal almost purity. Q10.5 consumes these results and adds the map-of-Tor conclusion with the specified roots transported to the absolute integral closure.
- DirectSummandsAndBigCohenMacaulay §3.2 constructs a fixed-perfectoid-field cover with almost faithful flatness in the ramified case. Q10.2 supplies an ordinarily faithfully flat integral-perfectoid cover for every regular local ring of residue characteristic p, without a fixed-field algebra requirement; Q10.4 constructs its embedding for F-finite residue fields. These are distinct targets, so neither is deleted.
- PurityForFlatCohomology consumes Q5.2, Q5.4, Q6.3–Q6.7, Q7.1/Q7.3 and Q10.1. PrismaticCohomologyPartIII's syntomic complexes and quasisyntomic cohomology are different objects from Q7's ring maps. ArcTopologyAndDescent owns complete arc covers; EtaleDualityAndPerverseSheavesPartII owns the cohomological tilting theorem. All Q identifiers were preserved.

No new supplier replacement or duplication deletion was needed. The existing Scope and ownership section already excludes the native tilt-sequence equivalence, integral-perfectoid predicate, standard syntomic carriers, henselization, continuous-valuation inputs, affine blowup carrier, torsion-removal theory, completed ring operations and foundational prism/perfectoidization constructions. These decisions are preserved, with no restatement added.

## Pinned API audit

The checked dependency commits equal the manifest: Mathlib `1b1ccf4b088b32fa3f23f2de1127433254a81e1e`, Tau Ceti `2fd255d997f47c0b5d834ee416c7015d55444ce5`. All four imported TauCeti modules exist and are used. No other roadmap module is imported.

Native definitions inspected at those pins include:

| Native input | Exact location and content relevant to the port |
| --- | --- |
| Integral perfectoidness | `TauCeti/RingTheory/Perfectoid/Integral.lean:76`: `exists_adic_element`, `frobenius_surjective`, `theta_kernel_principal`. The first field includes `IsAdicComplete (span {π}) A`; the last quantifies over nonunit and p-completeness proofs. No domain, reducedness, nonzero-ring or chosen-topology field is imposed. Lines 95, 102, 121, 131, 144 supply p-completeness, the nonunit result, Frobenius surjectivity, perfect-ring and zero-ring examples. |
| Adic completeness | `Mathlib/RingTheory/AdicCompletion/Basic.lean:57`: `Prop extends IsHausdorff I M, IsPrecomplete I M`. Thus the README includes separatedness, rather than merely topological completeness. |
| Tilt and sharp | `Mathlib/RingTheory/Perfection.lean:623`, ring structure at line 630; `Mathlib/RingTheory/Perfectoid/Untilt.lean:49`, `untilt : PreTilt O p →* O`. The latter needs nonunit p and p-completeness; it is multiplicative, not additive. |
| Compatible sequences | `Mathlib/RingTheory/Teichmuller.lean:195`, `quotientMulEquiv`; coefficient-zero formula at line 206. Its target quotient has characteristic p and the source is classically I-complete. It supplies a monoid equivalence, not a ring structure on the inverse-power sequences of a mixed-characteristic ring. |
| Fontaine map | `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean:166`, its Teichmüller formula at line 183 and surjectivity at line 196. These do not prove the new fibre-product or relative completeness theorem. |
| Standard syntomicity | `TauCeti/RingTheory/Syntomic/StandardSyntomic.lean:94`: fields `flat`, `exists_presentation`, `ringKrullDim_fiber`. Empty fibres are excluded from the dimension equation. The count is generators = n + relations, not truncated subtraction. Composition is `Syntomic/Composition.lean:43`; localization is `Syntomic/Localization.lean:57`. Q7's cover/factorization predicates are real specializations on these native carriers. |
| Henselization | `TauCeti/RingTheory/Henselization/Algebra.lean:43`, `IndEtale.lean:47`, `IndEtale.lean:60`, `Quotient.lean:81`, `Henselian.lean:154`. Faithful flatness requires the ideal in the Jacobson radical; completion alone does not assert it. |
| Henselian quotients | `TauCeti/RingTheory/Henselian/Quotient.lean:34` and `Henselian/Ideal.lean:110`. The former takes the image ideal along a surjection; the latter compares an ideal with its radical. |
| Pair of definition | `TauCeti/RingTheory/Huber/Basic.lean:163`: open subring, finitely generated ideal and its adic subspace topology; no completeness or separation field. Tate-ring predicate at line 213. Q8.4 does not add an unsupported completeness hypothesis. |
| Continuous valuative integrality | `TauCeti/RingTheory/Huber/Continuous/ValuativeCriterion.lean:429`: Huber ring, open subring B, bound at every continuous valuation imply integrality over B. This is the actual input of Q8.4, not nilpotence itself. |
| Affine blowup | `TauCeti/RingTheory/Ideal/AffineBlowup.lean:64`, membership at line 138, regularity at line 161 and universal map at line 226. The regular-pair polynomial presentation is Q7.5's additional result. |

I compared the supplied library near-matches with the pinned sources, and searched objects beyond the proposed names. The rank-one valued-field `PreTilt.isDomain` in `Mathlib/RingTheory/Perfection.lean:801` does not give Q6.3's arbitrary-rank valuation statement. `TauCeti.isTopologicallyNilpotent_iff_valuation_lt_one` in `TauCeti/RingTheory/Valuation/Continuous/TopologicallyNilpotent.lean:283` assumes an archimedean valuative topology on the ring; it does not give the all-continuous-valuations theorem for arbitrary Tate rings. Projective-input Tor vanishing in `Mathlib/CategoryTheory/Monoidal/Tor.lean` does not apply to Q10.6's nonflat finite algebra. The complete-integral-closure and fraction-field near-matches do not construct perfectoid covers. None discharges a retained headline.

## Changes in the port

No mathematics moved from Lean to README. `Suggested.lean` is byte-for-byte the accepted package file, with the same 16 headline theorems and three real predicate definitions. The relative categorical tilting equivalence remains identified as not statable in the docstring because the integral-perfectoid algebra categories and relative tilt functor are missing. No weakened substitute, API padding, computation or sorry'd data was added.

README changes, after reading the entire file as an upstream reviewer:

1. Q5.4's nonperfectoid negative control now compares A_inf-module actions. Reducedness versus nonreducedness alone distinguishes rings, not their underlying modules. The Teichmüller lift of t acts nontrivially on the completed tilt and as zero on its quotient; this proves the intended failure of module equivalence.
2. Q7.5's g = 0 control now uses R = ℤ and a = 2. The old universal wording asserted a nonzero torsion class X even when a was a unit; in that boundary X is zero. The replacement computes both the actual torsion and the unit boundary.
3. Q7 Examples now asserts ind-syntomicity universally and proves non-syntomicity in the concrete O_C, P = T example by inversion. The old universal non-syntomicity claim was false over the zero ring, where the algebra is zero and syntomic. No general theorem was narrowed.
4. Q7.1, Q7.2, Q8.2, Q9.1 and Q9.5 now have explicit Needs paragraphs naming the inputs of their statements and routes. Definition APIs are introduced as prose rather than catalogue `API:` labels. The title uses lower-case “part II”, and the Fontaine surjectivity supplier has its full WittVector namespace.

5. The examples now fix C as a complete algebraically closed nonarchimedean extension of ℚ_p, with its valuation ring and residue field, and normalize numerical norms by |p| = p^−1. Merely saying “complete algebraically closed” also permits characteristic p, where the nontrivial cyclotomic root sequence in Q5.1 cannot exist. This fixes the examples, without restricting any theorem.
6. Q10.5 also records the degree-zero negative control and n = 0 boundary: multiplication by p^(1/p) on the degree-zero inclusion into R⁺/p is nonzero. This pins the positive-degree hypothesis shared with Q10.6.

The opening Summary, every original numbered target and locator, every API bullet, all Checks, all worked examples and every supplier contract remain. Metadata is `topic = "math.AG"`, matching the main roadmap convention.

## Source audit

Read the legal cached texts rather than treating the accepted review as proof. Exact supporting passages include CS24 line 370 (tilting, limits and divisor-of-p comparison), CS24 line 415 (quotient identities), CS24 line 429 (torsion modules), CS24 line 468 (surjection and fibre-product theorem), CS24 line 539 (relative tilting, completeness and valuation rings), CS24 line 568 (valuation and algebraic-closedness proof), CS24 line 682 (torsion-free presentations), CS24 line 895 (uniform approximation), CS24 line 959 (valuative nilpotence), CS24 line 980 (ind-fppf/ind-syntomic definitions and permanence), CS24 line 1004 (André theorem), CS24 line 1035 (root construction), CS24 line 1080 (blowup and approximation descent), CS24 line 1157 (semiperfectoid covers), and CS24 line 1188 (residue towers).

For the prismatic and Tor applications: BS22 line 1299 (regular-local covers), BS22 line 3208 (the Tor argument), Bha18 line 451 (ordinary flatness criterion), Bha18 line 469 (generalized integral-perfectoid cover), HM17 line 65 (F-finite hypothesis), Ces19 line 303 (completion criterion), Ces19 line 420 (residue tower proof), Ces19 line 447 (perfect-residue-field root tower), BMS1 line 1008 (predicate and examples), BMS1 line 1033 (compatible roots), BMS1 line 1062 (Frobenius criterion), Sch12 line 751 (finite-extension tilting), Wedhorn line 2413 (continuous valuations) and Wedhorn line 2494 (valuative integrality) were read directly. The mod-pⁿ Tor statement is the stronger intermediate claim of BS22, not a claim that HM17 literally states this formula.

Stacks line 11208 in the cached commutative-algebra text verifies the unrestricted flatness-glueing hypotheses. The primary [regular-sequence blowup presentation](https://stacks.math.columbia.edu/tag/0BIQ), Stacks line 23 in the fetched tag page, verifies Q7.5 even over non-Noetherian rings. The primary [syntomicity theorem](https://stacks.math.columbia.edu/tag/00SW), Stacks line 23 in that tag page, verifies the hypersurface input; the [factorization/filtered-colimit criterion](https://stacks.math.columbia.edu/tag/07C3), Stacks line 23 in that tag page, verifies Q7.1–Q7.3. All restatements are in the roadmap's own words. No suspicious instruction in fetched mathematical or roadmap text was acted on.

## Computed adversarial mathematics pass

This is an author-side mathematical audit with explicit computations, not a proof of the admitted theorems. Each row identifies a statement or individual API law. For grouped numerical quantifiers the displayed formulas give their values at all listed indices. The table contains 121 computed statement rows. The same root, divisibility and arrow witnesses were recomputed in their consuming layers. Noncommutative groups and sign/Tate-twist conventions do not enter these commutative-ring statements.

| Statement | Instances tried | Values computed on both sides / separating value | Result | Change |
| --- | --- | --- | --- | --- |
| Commutative, unital, zero-ring convention | 0; 𝔽₂ | In 0, 0 = 1 and the unique unital endomorphism exists; in 𝔽₂, 0 ≠ 1. | Compatible with zero-ring structural targets; local rings are nonzero. | None. |
| Completeness includes separation | ℤ₂ for (2), (1), (0) | Limits are ℤ₂, 0, ℤ₂ respectively; map ℤ₂ → 0 is not injective. | Unit-adic completeness excluded except for 0. | None. |
| Integral-perfectoid predicate | 0, 𝔽₂, ℤ₂ | π = 0 works for first two; ker θ = (2) over 𝔽₂. In ℤ₂, 2v₂(π) ≤ 1 forces v₂(π) = 0; its completion is 0 ≠ ℤ₂. | Does not silently require a domain. | None. |
| Example-field convention | C = ℂ₂; algebraically closed characteristic-2 field as wrong model | In ℂ₂, ζ₂ = −1 ≠ 1 and a primitive fourth root has v₂(ζ₄−1) = 1/2; in characteristic 2, X²−1 = (X−1)² and its only root is 1. | Cyclotomic noninjectivity Check requires characteristic zero. | Added standing example convention and numerical normalization. |
| Tilt and sharp convention | Perfect characteristic 3; O_C cyclotomic sequence | First case x♯ = x; second ε♯ = 1♯ = 1 with ε ≠ 1. | Sharp multiplicative, need not inject. | None. |
| Fontaine normalization and p♭ | 𝔽₂; completed 2-root tower | θ([x]) = x and θ(2) = 0 in 𝔽₂; t♯ = 2 and (t^(1/2))♯ = √2 in the tower. | Correct direction and root normalization. | None. |
| Torsion notation | M = ℤ/4, a = 2; a = 0 | M[2] = {0,2}, M[2^∞] = M; M[0] = M. | Torsion and power torsion distinguished. | None. |
| Compatible-root convention | p = 2, r_n = 2^(1/2^n); r_n = 0 | r_0 = 2, r_(n+1)^2 = r_n; second sequence has 0^2 = 0. | Indices and zero parameter consistent. | None. |
| Monic positive degree | T, T²−2, 1 over ℤ₂ | Degrees 1,2,0; 1 evaluated anywhere = 1 ≠ 0. | Constant 1 excluded throughout. | None. |
| p-Zariski convention | ℤ₂, ℚ₂ | 1+2a is odd in ℤ₂; a = −1/2 gives 0 in ℚ₂. | Faithful-flat conclusions do not apply to ℚ₂. | None. |
| Unramified convention | ℤ₂; ℤ₂[√2] | 2 ∉ (2)²; 2 = (√2)² ∈ m² in the second. | Mixed-characteristic and parameter conditions retained. | None. |
| F-finiteness convention | 𝔽₂, 𝔽₂(t), 𝔽₂(t₁,t₂,…) | Degrees over squares are 1,2,∞ respectively. | Q10.4/Q10.6 include imperfect finite p-degree. | None. |
| Universe convention | Q8.4 Gauss refinement | (|T|,γ^ord_(T=1) T̄) = (1,1); quotient by 1×γ^ℤ gives |T| = 1 in ℝ₊. | Rank-one countervaluation survives coarsening. | None. |
| Q5.1(1), divisor-modulus tilt | ℤ₃ with ϖ = 3; ϖ = 9 control | Both legitimate limits = 𝔽₃; modulo 9, (1+1)³ = 8 ≠ 2. | Divisor hypothesis needed for ring Frobenius. | None. |
| Q5.1(2), uniqueness of θ | Perfect 𝔽₃ | W(𝔽₃) = ℤ₃, θ is reduction; θ([2]) = 2 on both descriptions. | Uniqueness modulo 3ⁿ and separated limit agree. | None. |
| Q5.2(1), products | Empty family; two 𝔽₂ factors | Product = 0 and tilt = 0; two-factor product and its tilt both have four elements. | Empty-product boundary included. | None. |
| Q5.2(2), pullback/completeness | A′ = 0; g = identity; ℤ/4 torsion control | Pullbacks = A×B and A; in ℤ/4, 4·1 = 0 but 2·1 = 2 ≠ 0. | Explains exactly where bound-one torsion is used. | None. |
| Q5.3(1), quotient identifications | Completed 3-root tower, ϖ = 3^(1/3); perfect characteristic 3 | Both mod-3 quotients = 𝔽₃[t^(1/3^∞)]/(t); in characteristic 3 with ϖ = 0 both quotients = A. | Modulus is ϖ^p, not ϖ alone. | None. |
| Q5.3(2), canonical ideals/completeness | Same tower, unit u | (ϖ♭)³ = t; (ut) = (t); limits = t-complete tilt on both sides. | Elements not canonical, ideals are. | None. |
| Q5.4(1), Tor/torsion module | Perfect 𝔽₂, ξ = 2; O_C | Solutions 2x = 2y are diagonal, quotient diagonal/2 = 𝔽₂; O_C has both torsion modules 0. | Projection directions agree. | None. |
| Q5.4(2), parameter torsion | O_C×𝔽̄_p, ϖ = (p^(1/p),0) | Both annihilators = 0×𝔽̄_p. For (p^(1/p),1), intersection of ideal powers = 0×𝔽̄_p ≠ 0. | Completeness excludes wrong parameter. | None. |
| Q5.4 negative module control | A = 𝔽₂[t^(1/2^∞)]/(t), tilt B̂ | [t]·1 = t ≠ 0 on B̂; [t]·a = 0 for every a in A because t♯ = 0. | Ring reducedness alone was insufficient as a module witness. | Added module-action calculation. |
| Q5.5, A_inf surjection/kernel | Identity; O_C → k̄; target 0 | Kernels 0, W(m_C♭), A_inf respectively; target-0 kernel quotient = A_inf/(ξ) = A. | θ-kernel and quotient directions match. | None. |
| Q5.6, perfectoid fibre product | 𝔽₂[t^(1/2^∞)] → 𝔽₂ ← same | Pairs have equal constant term; unique coordinate square roots preserve it. Tilt = same pullback. | Both projections and zero-target product case work. | None. |
| Q5.7, gluing | O_C with B = k̄ or 𝔽_p | Pullbacks are O_C and {a : residue(a) ∈ 𝔽_p}; in both cases arrow is B → k̄. | Reversing the arrow cannot form this pullback. | None. |
| Q6.1, relative equivalence | Perfect characteristic p; B = C♭ over O_C♭ | W(B)/(p) = B; in wrong incomplete object C♭, ξ is a unit and W(C♭)/(ξ) = 0 ≠ C♭. | Completeness excludes the wrong category. | None. |
| Q6.2, completeness iff | ϖ♭ = 0 in characteristic p; ∏ O_C | Zero-adic limits = the rings; product completions = ∏ O_C and ∏ O_C♭. | Both directions tested without Noetherianness. | None. |
| Q6.3, tilt valuation and injection | ℤ₃ and 𝔽₃⟦t⟧ | Tilts = 𝔽₃ in both; additive value-group map {0} → ℤ injective, not onto. | No perfectoidness smuggled into the statement. | None. |
| Q6.3, divisibility orientation | x = 1, y = p♭ in O_C♭ | 1 divides p; |p| ≤ 1; quotient = p♭. Opposite inequality would say 1 ≤ |p| < 1. | Ordered map has correct direction. | None. |
| Q6.4, valuation-ring iff | O_C; O_C×O_C | Predicates true/true; false/false in product since (1,0)(0,1) = 0 with both factors nonzero. | Domain condition essential to carrier. | None. |
| Q6.4, value-group and unit-times-sharp | 2-root tower; x = t^(1/2), y = t; a = 0, 3 | Additive values 1/2 ≤ 1 in both rings; 0 = 1·0♯ and 3 = 3·1♯ with 3 a unit. | Includes zero and does not claim sharp surjectivity. | None. |
| Q6.5, adic localization | V = ℤ₂, q = (2), a = 2 or 0; q = 0 control | V_q = ℤ₂; zero-adic completion ℤ₂; at q = 0 and a = 2 completion = 0 ≠ ℚ₂. | q contains a is needed for nonzero a. | None. |
| Q6.5, valuation-topology localization | O_C at m and at 0 | At m ring unchanged; at 0 coarsened valuation trivial and topology discrete, hence completion = C. | Distinct from nonseparated p-adic topology at 0. | None. |
| Q6.6, perfectoid localizations | O_C at m; O_C♭ at 0 | First returns O_C; second returns perfect field C♭; mixed-characteristic fraction field has p-adic completion 0. | Excluded prime exactly necessary. | None. |
| Q6.7, algebraically closed iff | O_(ℂ₃); completed 3-root tower | True/true for first; X²−2 has no root in second pair, since residue squares in 𝔽₃ are 0,1. | Both iff directions and negative case consistent. | None. |
| Q6.8, regular-parameter presentation | A = 𝔽₂, ϖ = 0 | Completed ℤ₂[2^(1/2^∞)] surjects to 𝔽₂; regular √2 has square 2 and image 0. | Lift regular even if image zero. | None. |
| Q6.8, specified-root presentation | Same A, r_n = 0 | r′_n = 2^(1/2^(n+1)); r′_(n+1)^2 = r′_n; every image = 0. | Prescribed roots actually lift. | None. |
| Q6.8, p-regular presentation | A = 𝔽₂; A = 0 | 2-multiplication injective on mixed-characteristic source; 0-source multiplication is injective and 0 → 0 surjective. | Zero ring permitted. | None. |
| Q6.8, final completion | Characteristic p, ũ = X_u, X_0-adic B | X_u−X_0 maps to 0 under X_u,X_0 ↦ t in a nonzero t-inverted target; so 1−X_0/X_u has no inverse before completion. | p-completion is identity when p = 0; cannot replace X_0-completion. | None. |
| Q7.1, ind-fppf definition/factorization | ℤ → ℤ[X_i]; ℤ → ℚ | Polynomial finite stages are free and have nonzero fibres; ℚ⊗𝔽₂ = 0. | Flat does not mean faithfully flat. | None. |
| Q7.1 API, finite presentation and invariance | ℤ[X] ≅ ℤ[Y], X ↦ Y | Both have basis 1,X,X²,… transported to 1,Y,Y²,…; closed fibre 𝔽₂[X] ≠ 0. | Isomorphism preserves factorization and faithfulness. | None. |
| Q7.1 API, faithful flatness | ℤ[X_i], empty product | Tensor with 𝔽₂ gives 𝔽₂[X_i] ≠ 0; empty product tensor gives 0. | Nonempty condition retained. | None. |
| Q7.1 API, three colimit descriptions | ℤ[X_i : i ∈ ℕ] | Finite-stage monomial bases yield same union of finite polynomials; each residue fibre is κ(q)[X_i] ≠ 0. | Faithful-flatness clause in flat-fp description needed. | None. |
| Q7.2, IsSyntomic definition | k[x]; ℤ[1/2]; 0 | Chart g = 1 has relative dimension 1; localization relative dimension 0 but zero 2-fibre; empty cover span ∅ = top exactly in 0. | Syntomicity does not include faithfulness. | None. |
| Q7.2, IsIndSyntomic definition | A[T^(1/p^∞)]; ℤ → 𝔽₂ | Polynomial stages each have dimension 1; Tor₁^ℤ(𝔽₂,𝔽₂) = 𝔽₂ ≠ 0 rules out second map. | Filtered syntomic implies flat. | None. |
| Q7.2 API, standard chart ⇒ syntomic ⇒ flat/fp | A[T] | Unit chart (1) generates top; no relations, one generator, nonempty fibre dimension 1. | Supplied local model consumed without replanning. | None. |
| Q7.2 API, base change | ℤ[T] to 𝔽₂ | 𝔽₂⊗ℤ ℤ[T] = 𝔽₂[T], one variable, no relation, dimension 1. | Standard-syntomic base change has right base ring. | None. |
| Q7.2 API, composition | A[T] → A[T,U] | Products of unit chart coordinates = 1; dimensions add 1+1 = 2. | Charts cover entire target. | None. |
| Q7.2 API, ind-syntomic flat; faithful ⇒ ind-fppf | A[T^(1/p^∞)] | Every finite stage has monomial basis; every nonzero residue fibre contains 1 ≠ 0. | Two flatness notions distinguished. | None. |
| Q7.2 API, isomorphism invariance | Renaming T^(1/p^n) ↦ U^(1/p^n) | Root relations on both sides: U_(n+1)^p = U_n. | Factorizations transport along the algebra isomorphism. | None. |
| Q7.2 negative non-lci | k[x,y]/(x²,xy,y²) | Dimension 0, embedding dimension 2, three minimal equations; 3 > 2. | Flat fp alone does not supply syntomicity. | None. |
| Q7.3, composition | A[T roots] then U roots | Composite union = A[T roots,U roots]; each stage two variables, dimension 2. | Colimit and composition laws consistent. | None. |
| Q7.3, base change | ℤ[X] to 𝔽₃ | 𝔽₃⊗ℤ ℤ[X] = 𝔽₃[X], nonzero fibre. | Faithfulness preserved. | None. |
| Q7.3, finite products | k×k; empty product over ℤ | Fibres k×k ≠ 0; empty product 0, while syntomic empty cover valid. | Only ind-fppf products require nonempty set. | None. |
| Q7.3, filtered colimits | Increasing polynomial rings | Union contains each finite polynomial; each residue fibre contains 1, so never zero. | Faithfulness passes under these directed maps. | None. |
| Q7.3, faithful + ind-flat-fp characterization | ℤ[1/2] vs ℤ[X_i] | First has zero 2-fibre; second has 𝔽₂[X_i] ≠ 0. | Faithfulness cannot be suppressed. | None. |
| Q7.4, flatness glueing | ℤ, f = 2, M = ℤ₂ | M[1/2] = ℚ₂ flat over ℤ[1/2]; M/2 = 𝔽₂ flat; M flat over ℤ. | Flat version consistent. | None. |
| Q7.4, faithful-flat version | A = M = ℤ, f = 2 | Both localized and reduced identity maps faithfully flat; identity module fibre κ(q) ≠ 0 at every q. | Both loci needed to cover Spec A. | None. |
| Q7.4, regularity on M | M = ℤ/2, f = 2 | Localized M = 0 and M/2 = 𝔽₂ flat, but Tor₁^ℤ(M,M) = 𝔽₂. | Control isolates module regularity. | None. |
| Q7.4, regularity on A | A = ℤ⊕N, N = ℤ[1/2]/ℤ, N² = 0; M = ℤ | 2N = N; N[1/2] = 0; N[2] = 𝔽₂; both fibre modules rank-one free; Tor₁^A(M,M) = N ≠ 0. | Control isolates ring regularity while 2 is regular on M. | None. |
| Q7.5, regular-pair blowup presentation | R = ℤ₂[T], a = 2, g = T | Quotient by 2X−T = ℤ₂[X]; affine blowup also ℤ₂[T/2] = ℤ₂[X]. | Denominator nonzero after localization. | None. |
| Q7.5, repeated pair | R = ℤ, a = g = 2 | Blowup = ℤ; polynomial quotient has X−1 ≠ 0 and 2(X−1) = 0. | Regularity on R/aR needed. | None. |
| Q7.5, zero second element and unit boundary | (ℤ,2,0); a a unit | X ≠ 0, 2X = 0 versus blowup ℤ; for unit a, X = 0 and quotient = R. | Old unrestricted torsion wording false at units. | Replaced by exact example and boundary computation. |
| Q7.6, fibrewise nonzero hypersurface | g = ϖX−q(T), q monic degree d > 0 | At ϖ ≠ 0 relation linear in X; at ϖ = 0 leading T coefficient = −1 ≠ 0; fibre dimension 1 or empty. | Flatness route uses all fibres. | None. |
| Q7.6, degenerate zero-variable case | n = 0, g = 1 | A/(1) = 0, no nontrivial fibres; padded presentation has m+1 variables, one relation, relative dimension m. | No negative relative dimension via truncated subtraction. | None. |
| Q7.6, bad/empty fibres | g = 2X over ℤ; g = 1+2x over ℤ₂ | First has nonzero 2-torsion X; second quotient ℚ₂ with zero closed fibre and dimension-zero generic fibre. | Nonzero fibre polynomial, not nonempty fibre, is required. | None. |
| Q7 Examples, stage non-syntomicity | O_C, P = T, m = 1; A = 0 | Generic stage C[T^(1/p^∞)] misses a next root at every finite-variable bound; zero-base stage = 0 is syntomic. | Universal negative claim false at zero ring. | Restricted negative assertion to computed O_C model. |
| Q8.1, continuity iff cofinal powers | ℤ₂ p-adic and trivial valuations | p-adic v(2ⁿ) = 2^−n → 0; trivial v(2ⁿ) = 1, never < 1. | Both directions discriminated. | None. |
| Q8.1, support and higher-rank controls | v through A/ϖ; lex T/p valuation | First v(ϖ) = 0, so one power below all positive γ; second v(T) = (−1,0) < (0,−n) = v(pⁿ) for every n. | v(p)<1 alone does not imply continuity. | None. |
| Q8.2, tilted valuation definition | O_C, x = p♭; lifts of zeroth residue | v♭(p♭) = v(p); lifts 0,p have values 0,v(p), unequal. | Arbitrary coordinate lift is wrong model. | None. |
| Q8.2 API, valuation laws and bound | x = 0,1,p♭ | Values 0,1,v(p); v♭(p♭²) = v(p)²; v♭(1+p♭) = 1. | Multiplicativity and ultrametric bound agree. | None. |
| Q8.2 API, parameter value and continuity | ϖ♭ with sharp uϖ | v(u) = 1 since u,u⁻¹ both bounded; v♭(ϖ♭) = v(ϖ), hence identical powers. | Unit normalization cannot alter cofinality. | None. |
| Q8.2 API, naturality | Identity; projection O_C×O_C → O_C | Identity gives v(x♯) on both sides; projection on (p♭,1) gives v(p) on both sides. | Both arrow directions checked. | None. |
| Q8.2 API, characteristic-p and field comparison | Perfect valuation ring of characteristic p; O_C | First sharp = identity and v♭ = v; second p♭ has value |p| on tilt and untilt. | Matches supplier P1.15 normalization. | None. |
| Q8.3, approximation | a = b♯; a = 1+p with a′ = 1 | Error 0 in first; error v(p) = v(p)·max(1,v(ϖ)^(pm)) in second. | Valuation-independent choice is possible. | None. |
| Q8.3, m = 0 and characteristic p | m = 0; p = 0 | Bound = v(p); in characteristic p bound = 0 and exact sharp gives error 0. | Zero exponent and zero multiplier consistent. | None. |
| Q8.3, threshold iff | a = ϖ^(pm) a sharp; a = 1, m > 0 | First both values equal v(ϖ)^(pm); second both 1 > v(ϖ)^(pm) when v(ϖ)>0,<1. | Closed inequality equality boundary retained. | None. |
| Q8.4, topological nilpotence iff | p and 1 in ℚ_p; T in Tate disc; 0 ring | Powers pⁿ → 0 with v(p)<1; 1ⁿ = 1 with v(1)=1; Gauss v(T)=1; at 0 powers zero and valuation set empty. | Both directions include empty-test case correctly. | None. |
| Q8.4, pair-of-definition necessity | Open subring ℚ_p in ℚ_p | Bounding both p,p⁻¹ forces v(p)=1, so no continuous bounded valuation; a=1 still not nilpotent. | Such unbounded subring cannot replace ring of definition. | None. |
| Q8.4, rank-one coarsening | Gauss valuation refined at T = 1 | v(T) = (1,1), v(pⁿ) = (p^−n,1); quotient removes second factor, w(T)=1, w(p)=p^−1. | Countervaluation remains continuous and a counterexample. | None. |
| Q9.1, André root extension definition | Empty P; P = T−a; forbidden P = 1 | Empty gives I′ = 0; quotient root α₀ = a; P=1 gives I′=A′ and quotient 0. | Positive degree excludes destroyed faithfulness. | None. |
| Q9.1 API, embedding and root closure | O_C, P=T, r = T^(1/p)/ϖ^(1/p) | r^p = T/ϖ; r is in ambient localization and in p-root closure; structural inclusion sends r to itself. | Ambient p-root closure, not arbitrary algebraic closure. | None. |
| Q9.1 API, divisible ideal | Generator T/ϖ^m | ϖ·(T/ϖ^(m+1)) = T/ϖ^m for every m ≥ 0, including m=0. | No division by zero: ϖ regular. | None. |
| Q9.1 API, root equations | P=T−a, indices 0,1,2 | α₀=a, α₁^p=a, α₂^p=α₁; P(α₀)=0. | Chosen roots need not lie in base. | None. |
| Q9.1 API, quotient and integrality | P=T, A=O_C | Quotient contains nonzero T^(1/p) with pth power 0; generic quotient finite stages satisfy monic X^(p^n)=0. | Quotient can be nonreduced before completion. | None. |
| Q9.1 API, naturality | Identity and projection O_C×O_C → O_C | T/ϖ^m maps to T/f(ϖ)^m; two successive projections give same fraction; image of root equation remains 0. | Map specified on whole defining data. | None. |
| Q9.1 API, uniqueness of maps | Two maps agreeing on A₀, element b with ϖ^n b∈A₀ | ϖ^n(f(b)−g(b))=0; target ϖ-regular gives f(b)−g(b)=0. | Torsion-free target excludes wrong zero-on-denominators map. | None. |
| Q9.2, one-polynomial p-closure | P=T, m=1 | q_j=T^(1/p^j); q_(j+1)^p−q_j=0; ratio r_(j+1)^p=r_j. | Union closed under these ambient p-roots. | None. |
| Q9.2, finite stages and m=0 | O_C; m=0 | Each inverted finite stage C[T^(1/p^n)] omits T^(1/p^(n+1)); m=0 gives A₀[P]=A₀. | Ind-syntomic does not mean syntomic; theorem assumes m>0. | None. |
| Q9.3, ordinary André theorem | O_C; completed 3-root tower; 0 | For O_C choose A′=A,I′=0; X²−2 has no root in 3-root tower (residue squares 0,1), requiring extension; over 0 all objects zero. | Both faithful-flatness conclusions retained. | None. |
| Q9.3, quotient vs completion | O_C root extension with P=T | α₁ ≠ 0, α₁^p=0 in quotient; α₁ is divisible by every ϖ^n and maps to 0 in completion. | The theorem genuinely includes the uncompleted quotient. | None. |
| Q9.4, roots and complete faithful flatness | Perfect 𝔽₂; O_C | First roots unique by inverse Frobenius and completion identity; second mod-ϖ map identity with nonzero residue fibre. | No ordinary faithful-flatness claim for arbitrary completion. | None. |
| Q9.4, almost/faithful distinction | k̄ over O_C | m_C·k̄=0 but k̄≠0; identity tensor k̄=k̄. | Almost zero cannot imply zero. | None. |
| Q9.4, cyclotomic negative roots | p=3, a=3 or 4 | v₃(3)=1 not divisible by 3 in ℚ₃; cube of 1+3z ≡1 mod9 but 4≠1 mod9; root degree 3 would force ζ₃ degree 2 in degree 3 normal extension. | Actual p and 1+p need not have roots in initial cover. | None. |
| Q9.5, IsPZariski definition | ℤ/4, 0, ℚ | 1+2a mod4 = 1 or3, units; unique zero-ring element unit; 1+p(−1/p)=0 nonunit in ℚ. | Definition determines intended class. | None. |
| Q9.5, Zariskization definition | ℤ at p=2; ℚ | Odd n satisfy n∈1+2ℤ; localization = ℤ_(2). In ℚ denominator set contains 0, localization = 0. | Total localization boundary understood. | None. |
| Q9.5, multiplicative-set identity | p=2,b=1,c=2 | (1+2)(1+4)=15=1+2(1+2+2·1·2). | Correct cross term pbc. | None. |
| Q9.5 API, Jacobson characterization | ℤ₂ and ℤ | 2∈Jac(ℤ₂)=(2); 2∉Jac(ℤ)=0; corresponding 1+2a unit condition true/false. | Both directions separated. | None. |
| Q9.5 API, universal extension | ℤ → ℤ₂ | Every odd denominator maps to unit; inverse image of 1/3 is the unique 2-adic unit inverse of 3. | Uniqueness pinned by denominator images. | None. |
| Q9.5 API, complete/henselian ⇒ Zariski | ℤ₂ | Inverse of 1+2a = Σ_(n≥0)(−2a)^n; modulo 2 equals 1. | Completeness and radical condition agree. | None. |
| Q9.5 API, quotient stability | ℤ₂ → ℤ/4 | Units 1+2a descend to 1 or3; 3²=1 mod4. | Quotient need not remain torsion-free. | None. |
| Q9.5 API, Zariskized faithful flatness | ℤ₂[T]; ℚ₂; A=ℤ | First closed fibre 𝔽₂[T]≠0; second Zariskization 0; ℤ_(2)⊗𝔽₃=0. | Both base Zariski and B faithful hypotheses needed. | None. |
| Q9.6, semiperfectoid cover | A=ℤ_(p), 𝔽_p, 0 | Covers ℤ̄_p, ℤ̄_p/p, 0; reductions in latter nonzero case =𝔽̄_p; completions O_(ℂ_p),𝔽̄_p,0. | Reduction precedes completion as stated. | None. |
| Q10.1, unramified residue tower | ℤ₂; ℤ₂[√2]; 𝔽₂⟦x⟧ | Stages W(𝔽_(2^n)) have p-parameter; ramified stages retain 2=(√2)²; equal-char stages have 2=0. | Unramified qualifier not applied in equal characteristic. | None. |
| Q10.2, perfectoid cover existence | ℤ₂, 𝔽₂⟦t⟧, 𝔽₂ | Covers completed 2-root tower, union 𝔽₂⟦t^(1/2^n)⟧, 𝔽₂; all fibres nonzero, equal-char Frobenius flat. | Includes dimensions 0,1 and p=2. | None. |
| Q10.2, distinguished presentation | ℤ₂, f=2−x; wrong crystalline prism | δ(2−x)=−1+2x−x², residue 1; crystalline quotient ℤ₂/(2)=𝔽₂ is not flat over ℤ₂. | Presentation not arbitrary prism reduction. | None. |
| Q10.2, Frobenius lift choices | k=𝔽₂(t), k=𝔽₄ | t↦t² or t²+2 both reduce to t²; identity reduces to t≠t²; Witt lift sends primitive ζ to ζ²≠ζ. | Imperfect-field lift is a choice. | None. |
| Q10.3, absolute integral closure/completion | ℤ₂; 𝔽₂⟦t⟧; ℚ | ℤ̄₂ complete closure gives O_(ℂ₂); characteristic-2 R⁺ has 2·1=0 but 1≠0; over ℚ completion at 2 is 0. | Characteristic-zero hypothesis required for torsion-free assertion. | None. |
| Q10.4(1), finite free stages | ℤ₂, d=1; k=𝔽₂(t), d=2 | R_n ranks 2^n; imperfect example ranks 2^n·2^(2n)=2^(3n), at n=0,1,2:1,8,64. | Coefficient-field p-degree factor retained. | None. |
| Q10.4(2), regular stages and n=0 | f=2−x | Cotangent classes (1,1) at n=0 and (1,0) at n=1,2; all nonzero. | n=0 not justified by n≥1 calculation. | None. |
| Q10.4(2), wrong normalization | f=4−x, p=2 | f class (0,1) nonzero, but φ(f)=4−x²∈m²; quotient has (x−2)(x+2)=0. | Normalization to x−p essential. | None. |
| Q10.4(3), integral embedding/intersection | ℤ₂ root tower | v(√2)=1/2<1, so √2∉2R⁺; v(2√2)=3/2 and 2√2=2·√2∈2R_∞. | Intersection formula and denominator regularity compatible. | None. |
| Q10.4(4), completion embedding | ℤ₂; imperfect infinite p-degree control | Quotients R_∞/2^n inject into R⁺/2^n; inverse-limit kernel 0. For k=𝔽₂(t_i), [k:k²]=∞ so first coefficient stage not finite. | No unsupported embedding claim outside F-finite case. | None. |
| Q10.4, embedded-cover headline | ℤ₂ | Completed tower embeds into O_(ℂ₂); residue fibre nonzero; source has injective multiplication by 2. | Injectivity retained as separate conclusion. | None. |
| Q10.5, map of Tor given cover | S=R; finite étale S; c=0 | Source higher Tor=0 in first two; if c=0 all roots=0 in domain R⁺ and multiplication map=0. | Degenerate statements true, nonzero c not needed. | None. |
| Q10.5/Q10.6, positive-degree and n boundary | R = S = ℤ₂, c = 2, N = 𝔽₂ | At i = 0,n = 1, 1 maps to √2 mod 2, nonzero since v₂(√2) = 1/2 < 1; at n = 0, R/(2⁰) = 0 and both groups = 0. | Positive i is substantive; n = 0 degenerate. | Added explicit README Check. |
| Q10.5, specified-root enlargement | R=ℤ₃, S=ℤ₃[√3], c=3 | S valuations in (1/2)ℕ exclude 1/3; adjoined T^(1/3^k) maps to c_k and has 3^kth power c. | Proof must transport the actual roots. | None. |
| Q10.5, annihilator ideal | Root T^(1/p^k) in enlarged cover | Mod c it has p^kth power 0; map to reduced perfectoid quotient sends it to 0, so it lies in J. | Image ideal contains the specified annihilator. | None. |
| Q10.6, F-finite Tor theorem | R=ℤ₃, S=ℤ₃[ζ₃]; k=𝔽₂(t) | In DVR example S free rank2 gives higher Tor=0; residue p-degree in imperfect example =2, so Q10.4 supplies cover. | Does not require perfect residue field. | None. |
| Q10.6, nonzero-source example | R=ℤ_p⟦x⟧, S=R⊕(p,x)√x, c=px | S closed since (m√x)²⊆R; after inverting px, m=R and discriminant 4x invertible; Tor₁^(R/p^n)(S/p^n,k)=Tor₂^R(k,k)=k≠0. | Headline not vacuous outside free cases, including p=2. | None. |
| Worked tower relation | p=2, g=x or x², stage n=1 | Relations 2−x² and 2−x⁴ give Eisenstein rings with ranks2 over respective R; wrong relations x²,x⁴ retain nonzero nilpotents. | Frobenius applies to p−g, not g alone. | Accepted correction preserved. |

## Unresolved

None for the port. The mathematical proofs remain roadmap work, represented honestly by the 16 sorry theorems. No push, pull-request write, issue write or comment was performed.


Pull request: #2259 (roadmap/perfectoid-quotients-part-ii at 9f411af)
