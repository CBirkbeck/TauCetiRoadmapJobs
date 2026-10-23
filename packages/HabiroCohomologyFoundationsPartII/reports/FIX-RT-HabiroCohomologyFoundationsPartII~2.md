# Findings resolution

Review A and Review B identify the two independent review files; cross-references use a-F and b-F prefixes, while each finding heading retains its original id. Overlapping repairs are shared, but every finding has its own verdict below. All changes are in `packages/HabiroCohomologyFoundationsPartII`; no supplier, merge order, tooling or pull-request text was edited.

# Review A

## F01 (P2) — applied

Thirteen purported gaps → imports from the supplied Habiro sections. Removed the matching plan entries and replaced proposed aliases by section descriptions throughout Layers 1–4. The positive-bound repair of b-F02 also makes canonical-smooth-pair supplied, removing that fourteenth entry. Added zero-category and characteristic-two coefficient Checks. Evidence: the supplier inventory below.

## F02 (P1) — not actionable in this package: the spectral prerequisites belong to RefinedTraceMethods

An undeclared spectral prerequisite → two explicit contracts, gap:spherical-perfection-map and gap:perfect-delta-spherical-lifts, in the README and plan, consumed in §§2.3 and 2.1 respectively. Their construction requires a supplier edit outside this package. KU line 3902 and TC line 1304 support these contracts; finite-presentation étale lifting does not cover the toric perfection example.

## F03 (P3) — applied

Order-two Frobenius witnesses alone → an additional order-three witness for ℚ(ζ₇) at 11. Changed both abelian-family formulas to inverse Frobenius and added the source-convention remark. GSWZ line 273 gives the edge direction; GSWZ line 263 displays the inconsistent general formula. Computations: 4² ≡ 2, 4³ ≡ 1 modulo 7; the two right sides are a and a².

## F04 (P2) — applied

The higher-power conclusion inside quotientLift_perfected → perfectedLiftNaive_higherPowers after the general theorem and its proof in §2.2. Split general and application dependencies; retained p-torsion-freeness and the independent prime-two square case. QH line 3011 proves the general criterion without a quotient presentation; QH line 2876 supplies the higher-power application.

## F05 (P2) — applied

HabiroNumberFields described as using this later roadmap → §4.2 itself tests the earlier coefficient specialisations. HabiroNahmSeries remains the later possible consumer. The supplied order places HabiroNumberFields, HabiroRings, RefinedTraceMethods, this roadmap and HabiroNahmSeries at positions 159–163 respectively. Gaussian and cubic Checks stay here.

## F06 (P2) — applied differently

A second Moore-spectrum existence target, quotientLift_moore → imports of StableHomotopyKTheory §§7.32 and 7.34, with specialization recorded only as a compatibility Check. Updated scope, contracts and Layer 2 dependencies. Retained exponent and high-powered Checks. TC line 1310 identifies the specified towers by v-compatible uniqueness; Bu line 412 does not assert uniqueness of arbitrary algebra structures.

# Review B

## F01 (P2) — applied

An exact characterisation in the Summary → sufficient exponent conditions. Matched that wording in the build guide, Layer 2 introduction and examples, including the prime-two chosen tower. Bu line 27 gives an E₁-structure on S/8, while E1QuotientExponent at (2,3) is false; an existence iff would therefore fail.

## F02 (P2) — applied

The undefined bound d = 0 → n = max(d, 1), throughout canonicalFramedTrace, its display, counit, transported structure and étale Check. Added HabiroCohomologyFoundations §5.7 to dependencies. QH line 2419 requires positive n; the supplied §§5.2 and 5.7 cover n = 1 in dimension zero. Thus a-F01 needs no new dimension-zero supplier extension.

## F03 (P3) — applied

The title's “habiro” → “Habiro”. Main's `TauCetiRoadmap/LocalGaloisGroups/README.md:1` and `TauCetiRoadmap/PolynomialGaloisGroups/README.md:1` retain proper-name capitals inside lower-case titles. Both roadmaps were read for the upstream shape.

## F04 (P3) — applied

Nonexistent §3.1 manifest citations → Exact supplier contracts. Deleted the unconsumed Pri and Stacks reference entries and manifest tables. Trimmed BS's unused Lemma 16.10 and Theorem 16.22 locators in both files. BS Theorem 15.3 and Proposition 15.7 remain, at BS line 3898 and BS line 3960. Added QH Paragraph 4.1's positive-bound locator and corrected its reference page range.

## Verification outcomes

- Required elaboration: `lake env lean` on `packages/HabiroCohomologyFoundationsPartII/Suggested.lean`, from the content checkout: **exit 0, no diagnostics**. No Tau Ceti import or missing object file required a module build. Nothing remains running.
- Required dependency command, with the supplied configuration, order, name and `--movable`: **exit 0**, with exactly this output:

```text
depcheck: 26 roadmaps, 230 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

- Elaborated signature audit: zero declarations, zero section variables and zero instances. Consequently the list of `#check @name` probes is empty; there is no elaborated declaration type from which a hypothesis could disappear. The unchanged acceptance file was re-elaborated after the formatting repairs. Its docstring still names all six unavailable headlines and their missing carriers; no stand-in or boundary declaration was added.
- Gap synchronization: **14 distinct README contract slugs = 14 plan entries**. The plan differs only in its top-level gaps list: fourteen supplied entries deleted, two genuine spectral prerequisites added. Its other top-level content is unchanged.
- `sources.toml` parses, with **eight distinct certified works** and no duplicate keys. Every retained cited work has its supplied legal extraction. No missing source, source request, new source download or uncertified passage was needed.
- `git diff --check`: **exit 0, no output**. Metadata and Suggested.lean are unchanged. The two supplied formatting failures are repaired: all ten finding headings retain their original F-ids under separate Review A/B headings, and code spans enclose the ten TeX fragments in the README supplier contracts, Moore-tower Check, perfection-map Check and Frobenius source remark. Mathematical statements and verdicts are unchanged.
- Formatting recheck with the worker’s scanners: **10 parsed finding sections**, **zero coverage problems**, **zero TeX residue hits** (from ten) and **zero LaTeX delimiter hits**. The README differs from the pre-repair deliverable only by code-span delimiters on five lines; all mathematical text is identical.
- Citation resolver: no unresolved Lean-name leads remain. It still reports RefinedTraceMethods §6.10 as absent from main and the indexed open roadmaps. This is an explicitly declared supplier contract, already treated as unavailable; the resolver is not evidence of its implementation. Its note that it could not inspect pinned Lake packages was handled by direct inspection of the pins below.

## Supplier and ownership evidence

The object searches used the roadmap service on main and indexed open heads, plus the board packages and all sibling paths supplied in the brief. Searches for spherical Witt vectors, spherical perfection and perfection lifts found no earlier owner supplying the two additional spectral constructions. RefinedTraceMethods is a named earlier supplier with declared gaps, not an available source of certified declaration names. No finding here reopens the earlier availability decision.

The following inventory checks the thirteen supplied contracts in a-F01 and the canonical contract affected by b-F02. Locations are in the supplied heads of `TauCetiRoadmap/HabiroCohomologyFoundations/README.md` and `TauCetiRoadmap/HabiroRings/README.md`.

| Former gap | Exact supplied contract and evidence |
| --- | --- |
| habiro-complete-category | HabiroCohomologyFoundations §0.1, lines 274–313: complete category, reflection, tower and completed tensor over every commutative A. |
| enhanced-filtration | HabiroCohomologyFoundations §§2.1–2.3, lines 846–909: enhanced filtration, recovery by pullback, Rees ring and degree-one quotient. |
| derived-qderham | HabiroCohomologyFoundations §§1.14–1.16 and 2.4–2.10, lines 911–1000 for animation and comparisons: completed base change and separate rational comparisons. |
| chosen-pair-coherences | HabiroCohomologyFoundations §4.1, lines 1295–1320: four clauses, coherent category, underived pullback and rational pair. |
| qhodge-functor | HabiroCohomologyFoundations §4.4, lines 1337–1359: completed modification, completion invariance and coordinate differential hD. |
| coordinate-pair | HabiroCohomologyFoundations §4.8, lines 1404–1425: coordinate filtration and pullback to qdR. |
| habiro-hodge-descent | HabiroCohomologyFoundations §§4.12–4.24, lines 1467–1675: twisted filtrations, partial descents, coherent limit, reductions and multiplicative upgrades. |
| habiro-descent-exports | HabiroCohomologyFoundations §4.28, lines 1736–1788: coherent descent record, completion and degreewise periodic objects. The finite-projective component retains that supplier's stated extra contracts. |
| canonical-smooth-pair | HabiroCohomologyFoundations §§5.2–5.8, lines 1827–1898: positive n, dimension bound, specified coordinate comparison and agreement on overlaps; §5.7 explicitly covers dimension zero. |
| naive-quasiregular | HabiroCohomologyFoundations §§5.15–5.23, lines 2008–2129: perfect-regular inputs, static preimage, injectivity, completed flat base change and global section. |
| finite-coefficient-pairs | HabiroCohomologyFoundations §5.26, lines 2146–2176: powerful positive moduli, constant rational corner, including m = 1. |
| ordinary-derived-habiro | HabiroRings §§2.1, 2.4–2.5, lines 474–523 for the comparison and tensor: all coefficient modules, including nonflat ones. |
| relative-habiro-taylor | HabiroRings §§5.1–5.9, lines 903–1092: relative ring, full coefficient tensors, root changes, equalizer, completed base change and number-field comparison. |
| cubic-coefficients | HabiroRings §7.3, lines 1291–1299: the cubic ring and completed Frobenius nonconstant-family example. |

Other supplier citations were resolved by object and section: QWittVectors §§2.1–2.5 (coactions, arithmetic perfection, coverage and relative perfection); HabiroCyclotomicCompletions §§1.4, 2.3, 3.1, 3.3, 5.1 and 5.3 (ordinary completion, Laurent comparison, Taylor re-expansion, modules and localized components); StableHomotopyKTheory §§7.32 and 7.34 (tower and Moore structures); PrismaticCohomology Layer 0; PrismaticCohomologyPartII §§3.1, 3.13–3.16 and 3.20–3.23; PrismaticCohomologyPartIII §7.0; and AInfCohomology §AI.7.2. The latter supply the independent Frobenius-divisibility and trace filtrations with their twists, not a new locally defined filtration. HabiroCohomologyFoundations §§8.18–8.19 are scope boundaries only. HabiroNahmSeries was inspected at the supplied head; it is a later consumer, never a prerequisite.

The general quotient target here specializes the supplied categorical tower to arbitrary connective E∞ coefficient rings and finite sequences and constructs trace inputs from it. The Moore structures themselves stay upstream. No declaration is introduced with a supplier's fully qualified name. Proposed Habiro aliases were replaced in the supplier contracts and in §§1.2–1.3, §2.2, §3.3 and §4.2 by the actual section descriptions. The removed quotientLift_moore name had no Lean declaration; no exported Lean name changes.

## Pin and source audit

The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Direct object searches at these pins find no Tau Ceti Habiro, q-Hodge, spherical-lift, THH or Nygaard carrier, and no Mathlib connective E∞-ring spectrum, enhanced q-Hodge pair or cyclonic fixed-point carrier capable of stating the six headlines. A generic triangulated category or an ordinary filtered module is not the required construction.

Native declarations were checked in their pinned files: `Rat.numberField_discr` at `Mathlib/NumberTheory/NumberField/Discriminant/Defs.lean:75`; `NumberField.RingOfIntegers` at `Mathlib/NumberTheory/NumberField/Basic.lean:101`; `Nat.factorization` at `Mathlib/Data/Nat/Factorization/Defs.lean:50`; `map_dvd` at `Mathlib/Algebra/Divisibility/Hom.lean:31`; `isUnit_of_dvd_unit` at `Mathlib/Algebra/Divisibility/Units.lean:129`; `Commute.isUnit_mul_iff` at `Mathlib/Algebra/Group/Commute/Units.lean:74`; and `IsLocalization.Away.algebraMap_isUnit` at `Mathlib/RingTheory/Localization/Away/Basic.lean:82`. The native `Algebra.Etale` at `Mathlib/RingTheory/Etale/Basic.lean:205` bundles formal étaleness and finite presentation; `Algebra.Smooth` at `Mathlib/RingTheory/Smooth/Basic.lean:539` bundles formal smoothness and finite presentation. Neither packages the non-finitely-presented spherical perfection map.

The decisive source checks were QH line 2419 (positive canonical bound), QH line 2860 (exact hypotheses of the two naive-filtration criteria), QH line 2876 (higher-power spectral argument), QH line 3011 (independent proof route), KU line 973 (cyclotomic base), KU line 988 (local branches), KU line 1908 and its proof through line 1944 (ordinary preimage), KU line 1949 (global amplitude), KU line 2103 (prime-two addendum), KU line 2143 and line 2153 (global pair and multiplicative level), KU line 3726 and line 3873 (framed comparison and commutative refinement), KU line 3880 (number-field realization), KU line 3902 (spectral perfection), TC line 1262 (high-powered moduli), TC line 1304 (perfect δ-ring lifts and tower specialization), Bu line 27 (S/8), Bu line 57 and line 412 (compatible tower), Bu line 474 and line 483 (square tower at two), and GSWZ line 263 versus line 273 (constant-family direction). The remaining independent filtration inputs were read at BS line 3898, BS line 3960 and BMS2 line 252; étale categorical lifting is HA line 52724. These are locators, not copied source passages.

## Computed adversarial mathematics pass

Rows record mathematical tests, including negative controls; they do not purport to prove enhanced statements by computation. The supplied source statements and proof steps above provide the general arguments. A “contract” result records a genuine unfilled supplier requirement. All changed statements, their consumers and the existing Checks using the same objects are included. Group-theoretic noncommutative tests and DVR ramification alternatives do not apply to these commutative, prime-indexed ring statements.

| Statement | Instances tried | Values computed on the two sides | Result and change |
| --- | --- | --- | --- |
| h and q-integers | n = 0,1,2; q = 1 | [0] = 0; [1] = 1; [2] = 1+q = 2 at 1; h = 0 | Convention retained. |
| Descending direction and constant nonpositive steps | Unit filtration | F⁰ = B, F¹ = hB, F² = h²B; F⁻¹ = B | Inclusions point toward B. |
| Rees weights and relation | Unit, q = 2 | β = 1,t = 1 gives βt = 1 = q−1; βt ≠ q = 2 | Degree +1 and −1 retained. |
| Bott grading and shift | Bott class β | π₂ degree 2 becomes degree 0 after Σ⁻² | No sign or shift reversal. |
| Degree-one filtered quotient | Unit B = ℤ[[h]], i = 0,1,2 | cofib(h:B→B) = ℤ at 0; cofib(h:h^(i−1)B→h^iB) = 0 at 1,2 | Same-index quotient would give ℤ at 1 and 2. |
| Derived quotient convention | K = ℤ/2, multiplier 2 | cofiber has H⁻¹ = H⁰ = ℤ/2; cokernel has H⁻¹ = 0 | Derived convention retained. |
| Completion before rationalisation | ℤ_p[[h]] | Σ p⁻ⁿhⁿ lies in ℚ_p[[h]], with unbounded denominators; absent from ℤ_p[[h]][1/p] | Final h-completion is necessary. |
| Chosen pair: zeroth step | A = ℚ, R = ℚ(i) | qdR = ℚ[[h]], completed zeroth step = ℚ(i)[[h]] | Completion cannot replace the pair. |
| Pair quotient and rational clauses | Unit; zero algebra | Unit quotient: ℤ in i≤0, 0 above; zero algebra: constant ℚ in every i | Four clauses retained. |
| Completion invariance of modification | Unit; constant ℚ[[h]] filtration | Unit modification = ℤ[[h]] before and after filtration completion; constant modification completes to 0 on both routes | Supplied §4.4 imported. |
| Positive subgroup indices | m = 1; edge 2→1 | C₁ = {1}; first stage = X^{hS¹}; C₀ is never used | Positive divisibility convention retained. |
| Genuine versus homotopy fixed-point definition | m = 1,2 | At 1 genuine fixed points are X; at 2 the expression is (X^{C₂})^{h(S¹/C₂)}, not X^{hC₂} | Order of operations retained. |
| Relative semiperfectness | Identity; 𝔽_p[x]/𝔽_p | Identity relative Frobenius is onto; x has no p-th-power preimage in the polynomial algebra | Hypothesis substantive. |
| p-quasi-lci indexing | Identity; polynomial; regular quotient | L = 0; L = R dx in degree 0; L = R[1] in homological degree 1 | Full cotangent complex retained. |
| Habiro-complete category, reflection and tensor | A = 0 | Category contains only 0; L_H(0) = 0; 0⊗̂0 = 0 | Supplied contract; added README Check. |
| Ordinary/derived coefficient completion | B = M = 𝔽₂ | P₁ = 1+q, degree 1; P₂ = 1+q+q²+q³, degree 3; quotient dimensions 1 and 3 on both routes | No flatness restriction; added Check. |
| Positivity in polynomial-module regularity | m = 0 versus m = 1 | q⁰−1 = 0 has all M[q,q⁻¹] as kernel; (q−1)·1 has leading coefficient 1 | Supplied positive range retained. |
| Coordinate pair | ℤ[x], i = 1,2 | F¹ = [hB[x]→B[x]dx]; F² = [h²B[x]→hB[x]dx] | q-adic alternative misses dx. |
| Habiro descent record and divisor coherence | Unit, 6→2→1 and 6→3→1 | Both paths send 1 to 1 in ℤ[[h]]; a negated edge sends 1 to −1 | Imported coherent record; no invented alias. |
| Periodic export and degreewise completion | Unit pair | Every β-degree has coefficient ℤ[[h]]; degree 0 is ℤ[[h]] on both routes | Degreewise completion retained. |
| Canonical supplier range | d = 0,1,2 | n = 1,1,2; inverted prime sets ∅,∅,{2} | Removed canonical gap using positive n. |
| Algebraic higher-power criterion | p = 2, α = 2 | Γ₁ = x²−hδ(x); Γ₁²/(q+1) at h=0 is x⁴/2 | Supplied algebraic proof includes the square. |
| Finite-coefficient algebraic pairs | m = 1,4,12 | Powerful: true,true,false; at 12, v₃ = 1; at 1 rational corner = ℚ[[h]] and completion = 0 | Imported §5.26 at its full range. |
| Perfect δ-ring spherical lift contract | B = ℤ₂, ℤ₃, 0 | Reductions of S₂, S₃, 0 are ℤ₂, ℤ₃, 0 respectively | New supplier contract. |
| Functorial perfect δ-map lifting contract | Free perfect generator x↦0 and x↦p | Reductions of x are 0 and p, with p ≠ 0; identity sends x to x | New supplier contract, distinct maps required. |
| Spherical perfection map contract | A = ℤ_p; toric ℤ_p⟨x⟩; 0 | First map id; second mod p sends x↦x in 𝔽_p[x^(1/p^∞)]; last map 0→0 | New supplier contract, no finite presentation added. |
| Perfection is not an étale finite-presentation replacement | Roots through p⁻ᴺ | Generated exponents lie in p⁻ᴺℕ; exponent p⁻⁽ᴺ⁺¹⁾ is absent | Separates the required spectral construction. |
| Independent Nygaard input | Prism (ℤ_p,(p)), φ = id | N¹ = pℤ_p and N² = p²ℤ_p; N⁰ = ℤ_p | Imported Frobenius-divisibility convention. |
| Relative Nygaard twist | Relative unit R = A/I | N^i on φ_A*Δ is I^i; gr⁰ = A/I | Twist not dropped. |
| Motivic trace filtration | QRSP coefficient, degree n = 0,1 | gr⁰TC⁻ = Δ̂; gr¹TC⁻ = N≥¹Δ̂{1}[2]; gr¹TP = Δ̂{1}[2] | Imported independent completion and twists. |
| TraceInput category | Same R, different odd-prime branches | Underlying id_R exists; branch-compatibility test is false | No bare ring-map constructor. |
| TraceInput.forget | Unit identity | forget(id_(A,L)) = id_A; id_A(1) = 1 | Functor target retained. |
| TraceInput.lifts | ℤ[x] at 2 and 3 | At 2 chosen E₁ cover; at 3 chosen E₂ lift; reductions both ℤ_p⟨x⟩ | Branch data retained. |
| TraceInput.ofSpherical | ℤ[1/2][x] versus ℤ[x] | First has 2·(1/2)=1 and 2-completion 0; second has 2 not a unit | Constructor retains invertibility. |
| TraceInput.ofEtale | A = ℤ, R = ℤ[1/6] | L = 0; relative Frobenius iso; R̂₂ = R̂₃ = 0 | Étale input and maps use supplier lifting. |
| TraceInput.ofFramed | ℤ[x] at 2 | Cover adjoins x^(1/2^k); x is square of x^(1/2), so relative Frobenius is onto | Prime-two E₁ branch retained. |
| TraceInput.ofIdentityCover | R = ℤ versus ℤ[x] over ℤ | First: relative Frobenius id; second: x absent from image | Identity-cover domain retained. |
| Global cotangent condition | ℚ[u,v]/(u²,uv,v²) | Every p-completion = 0; ideal has height 2 and three minimal generators, so not lci | Local zero inputs do not suffice. |
| TraceInput.unit | Torsion-free A = ℤ | Lift reduces to A; L_(A/A) = 0 | Unit input retained. |
| tracePair pullback | R = A = ℤ | F^i = h^max(i,0)ℤ[[h]]; at i = 1 the inclusion sends h↦h | Specified trace pair retained. |
| tracePair_map | Unit identity morphism | Induced F⁰-map sends 1↦1; F¹-map sends h↦h | Functoriality target retained. |
| tracePair_map_id | Unit pair | id_F(1) = 1 and id_F(h) = h | Identity law tested. |
| tracePair_map_comp | ℤ→ℤ[1/2]→ℤ[1/6] | Both composites send 1↦1, h↦h and 2↦2 | Composition law tested on specified lifts. |
| tracePair_completion | Unit and zero inputs | Unit completion = h-adic filtration; zero input's constant filtration completes to 0 | Completion is not F itself. |
| tracePair_modBeta | Unit | Degrees 0,1 give ℤ,0 on both sides | Degree-one quotient retained. |
| tracePair_rational | Unit | (F^i⊗ℚ)^∧_h = h^max(i,0)ℚ[[h]] | Combined filtration retained. |
| tracePair_pRational | Unit, p = 2,3 | Completed rational steps = h^max(i,0)ℚ_p[[h]] for each p | Separate clause retained. |
| tracePair_multiplicative | n = 2,∞ | Output levels E₁,E∞ respectively | No E∞ conclusion from an E₂ lift alone. |
| tracePair_etale | A = ℚ, R = ℚ(i), k = 1,2 | H⁰F^k = h^kℚ[[h]]; H¹F^k = (R/ℚ)[[h]]/h^k | Pullback retained, not static h^kqdR. |
| tracePair_zero | R = 0 over ℤ | qdR = ℚ[[h]], F^i constant; F/β = ℚ constant; F̂ = 0 | Nonzero uncompleted corner retained. |
| Non-Hodge-completed dR of zero | 0 = ℚ⊗ᴸ_(ℚ[y])ℚ at y=0,1 | Difference of evaluation points = 1, so Tor₀ = Tor₁ = 0; polynomial dR pushout = ℚ | Explains zero-ring rational corner. |
| tracePair_polynomial | ℤ[x], i = 1 | First step coefficients (h,1), compared with h-adic alternative (h,h) | Coordinate filtration retained. |
| traceHabiro definition | Unit; zero input | Unit = lim ℤ[q]^∧_(qᵐ−1); zero = 0 | Supplied descent composed with tracePair. |
| traceHabiro_map | Unit identity | H(id)(1) = 1 | Induced map retained. |
| traceHabiro_hCompletion | ℤ[x], monomial x² | Differential coefficient q²−1 versus q-de Rham coefficient 1+q; at q=1 values 0 versus 2 | q-Hodge, not q-de Rham completion. |
| traceHabiro_partialCompletion | Unit, m = n = 1 | Both sides = ℤ[[h]]; identity completion sends 1↦1 | Positive partial indices retained. |
| traceHabiro_qWittGraded | ℤ[x], m = 1 | gr₀ = ℤ[x]; gr₁ = ℤ[x]dx[−1]; gr₂ = 0 | Ascending convention retained. |
| traceHabiro_smooth | ℤ[x], m = 1 | H⁰ = ℤ[x], H¹ = ℤ[x]dx; Bockstein(x²) = 2x dx | Correct differential on cohomology. |
| traceHabiro_multiplicative | Chosen E₂ lift versus E∞ lift | Descent levels E₁ versus E∞ | No multiplicative promotion invented. |
| traceHabiro_pairEquiv | Identity equivalence of unit pairs | Descent map sends 1↦1; h-completion also sends 1↦1 | Lift independence needs separate theorem. |
| traceHabiro_periodic | Unit | β-degree 0 h-completes to ℤ[[h]]; β-degree 1 to ℤ[[h]]β | Periodic carrier retained. |
| traceHabiro_cyclonic | ℤ[1/6], m = 1 | β-degree 0 h-completion = ℤ[1/6][[h]] on both routes; 2·(1/2)=1 | Extra coherence and module-only conclusion retained. |
| traceHabiro_etale | Unit, m = 1 | Quotient H/(q−1) = ℤ; positive q-Witt degrees = 0 | Supplied finite-quotient theorem imported. |
| traceHabiro_kuLiftInsufficient | Free perfect δ-ring quotient by x | ku-lift exists; degree-one q-deformation test fails for α = 1 | Spherical requirement retained. |
| Reduction versus Hodge filtration | ℤ[x], m = 1 | Descent reduction H¹ = ℤ[x]dx; ordinary dR H¹ = ⊕_(r≥1)ℤ/r | The two quotient objects stay distinct. |
| E1QuotientExponent total definition | p = 0,1,3,4; α = 0…7 | Values 0,0,1,1,1,1,1,1 in each case | Nonprime branch documented; spectral uses require primality. |
| E1QuotientExponent at 2 | α = 0…7 | Values 0,0,0,0,1,0,1,0 | Bound and evenness retained. |
| E2QuotientExponent total definition | p = 0,1,3,4; α = 0…7 | Values 0,0,0,1,1,1,1,1 | Total lower-bound convention retained. |
| E2QuotientExponent at 2 | α = 0…7 | Values 0,0,0,0,0,0,1,0 | Stronger bound retained. |
| E₂ exponent implies E₁ exponent | (2,6), (3,3) | 6≥4 with even 6; 3≥2; both implications true | Arithmetic law remains README-only. |
| quotientLift | Empty sequence; y = 0; y = 1 | Empty tensor = T; T/0^α = T⊕ΣT for α>0; T/1 = 0 | No regularity needed for spectral quotient. |
| quotientLift at odd primes | p = 3, α = 2,3 | Tower exponents 2>1 and 3>2 give E₁ and E₂ | Sufficient range retained. |
| quotientLift at 2 | α = 4,6 | Relative-to-y² exponents 2>1 and 3>2 | Correct square-compatible tower retained. |
| quotientLift_framed | S = ℤ[x], R = S/x⁴ | At 2: E₁ range true, R is 2-torsion-free; at 3: E₂ range true | Trace-input consequence retained. |
| quotientLift_identityCover | B = ℤ[x^(1/n):n≥1], R = B/x⁴ or B/x² | α=4: E₁ condition true at every prime; α=2: true at odd primes, false at 2 | Identity-cover application retained. |
| quotientLift_perfected | Free δ-base, quotient x² at p = 3 | Perfected ring B_∞/x²; exponent test true; cofiber reduces to that quotient | Target ends at the lift assertion. |
| Perfect δ-lift specialization | x↦p versus x↦0 | Cofibers reduce to ℤ/p^α versus ℤ_p⊕Σℤ_p | Added negative control for the spectral map. |
| Moore compatibility import | S/9, S/16, S/64 | v = 3,4,4; quotient powers 2,2,3; E₁,E₁,E₂ | Duplicate existence target deleted. |
| Non-necessity of the selected bound | S/8; S/32 | E₁/E₂ structures supplied by stronger route; selected even-exponent tests at 3/5 are false | Summary and examples corrected. |
| High-powered predicate | 1,4,8,9,12,16,32,64 | True,false,false,true,false,true,false,true | Empty prime set at 1 handled correctly. |
| p-torsion-free boundary | R = ℤ/9, p = 3 | 3·3 = 0 with 3 ≠ 0 | Lift exists; criterion cannot be applied. |
| perfectedLiftNaive | R = A = ℤ₂ or ℤ₃ | F/β = ℤ_p for i≤0 and 0 for i≥1 = fil_Hdg dR | General criterion includes both primes. |
| Completed base-change proof step | A = A_∞ = ℤ_p | (F⊗ᴸ_A A)^∧_(p,h) = F; map on quotient ℤ_p→ℤ_p is identity | No quotient presentation in proof. |
| Perfect-base reduction | A_∞ = ℤ_p | L_(A_∞/ℤ_p) = 0; qdR relative to either base is ℤ_p[[h]] | Proof route remains independent. |
| perfectedLiftNaive_qReg | A = R = ℤ; rational R = ℚ | Unit global F^i = h^max(i,0)ℤ[[h]]; rational local completions = 0 and F^i = h^max(i,0)ℚ[[h]] | Rational corner retained. |
| perfectedLiftNaive_higherPowers | p = 3, α = 2; p = 2, α = 2 or 4 | Spherical tests true,false,true; algebraic higher-power test true in all three torsion-free presentations | Application moved after general criterion. |
| Toric x−1 q-divided powers | n = 0,1,2; q = 1 | δ⁽⁰⁾=1; δ⁽¹⁾=x−1; δ⁽²⁾=(x−1)²/2; at x=3 the last value is 2 | Fractions interpreted in the supplied envelope. |
| Exponent-one obstruction | Free δ-base, α = 1 | Necessary correction hδ(x)/p has coefficient 1/p, not integral | No spherical E₁ lift by criterion. |
| tracePair_quasiRegular membership | R = A = ℤ_p | Extension along id_Sp reduces to ℤ_p⊗_ℤpℤ_p = ℤ_p | Explicit spherical-perfection prerequisite added. |
| tracePair_quasiRegular pair equivalence | R = A = ℤ | Both local and global F^i = h^max(i,0)ℤ[[h]]; all maps send 1↦1 | Gluing proof uses specified corners. |
| tracePair_quasiRegular independence | Identity input over ℤ | Every comparison identifies the same F⁰ = ℤ[[h]] and F¹ = hℤ[[h]] | Independence restricted to identity-cover domain. |
| tracePair_quasiRegular Habiro comparison | Unit; zero ring | Both descents = integral Habiro ring for unit, 0 for zero | Pair equivalence transported. |
| Quasi-regular toric Check | ℤ[x]→ℤ, x↦1 | Relative Frobenius source 𝔽_p[x]/(xᵖ−1) maps onto 𝔽_p | Semiperfectness verified. |
| Finite moduli versus torsion-free theorem | m = 1 and 9 | ℤ/1 = 0: p multiplication injective on 0; ℤ/9: kernel of ×3 contains 3 | Range distinction retained. |
| Framed q-differential | x,x²; q = 1 | ∇_q x = dx; ∇_q x² = (1+q)x dx→2x dx | No division by x on arbitrary coefficients asserted. |
| Framed homotopical degrees | d = 0,1 | Complexes occupy [0,0] and [−1,0] | Degree convention retained. |
| canonicalFramedTrace | d = 0,1,2 | n = 1,1,2; no small prime inversion in first two, invert 2 in third | All bound occurrences repaired. |
| Canonical counit map | Unit, n = 1 | Mod β it is id_ℤ; zero map has reduction 0 ≠ id | Specified comparison, not arbitrary equivalence. |
| Agreement of canonical bounds | d = 0, n = 1,2 over ℚ | Both completed first steps = hℚ[[h]] | Larger bounds require their own admissibility. |
| canonicalFramedTrace_pair | S = ℤ[x] | All three completed first steps [hB[x]→B[x]dx] | Coordinate intermediary retained. |
| canonicalFramedTrace_habiro | Étale R = A; m = 1 | Both descended h-completions = A[[h]], reductions = A | H(S,F_n) updated throughout. |
| canonicalFramedTrace_einfty | Fixed line framing | ∇_q(x²) = (1+q)x dx versus naive Leibniz 2x dx; at q=2 values 3x dx versus 2x dx | Enhanced multiplication is transported. |
| canonicalFramedTrace_etale | d = 0, A = ℚ, S = ℚ(i) | n=1; completed F⁰=S[[h]], uncompleted F⁰=ℚ[[h]] | Dimension-zero use now defined. |
| Derived reduction Check | Modified line complex, r = 1,2 | H⁰(M)/h = ℤ; H⁰(M/^Lh)=ℤ[x]; Bocksteins dx and (1+q)x dx are nonzero h-torsion classes | Reduction of cohomology cannot replace derived reduction. |
| Canonical tensor domain Check | ℤ[x] tensor ℤ[x] | Dimensions 1+1=2; prime set changes ∅→{2} | No false tensor closure. |
| Laurent animated/framed distinction | S = ℚ[x,x⁻¹] | H¹(qdR)=0; H¹(qΩ)=ℚ[[h]]dlog x | Pullback comparison retained. |
| TraceInversion definition | F = ℚ, Δ = 6,1,0,−6 | True,false,false,false, since 6∤1 and positivity fails at 0,−6 | Total integer inputs handled. |
| TraceInversion discriminant | ℚ(i), Δ = 6 or 12; ℚ(∛2), Δ=108 | disc = −4: false,true; disc = −108: true | Divisibility uses signed discriminant. |
| TraceInversion.isUnit_two_three | R = ℤ[1/6] | 2·(3/6)=1; 3·(2/6)=1 | Native commuting-unit theorem suffices. |
| TraceInversion.finiteEtale | ℚ and ℚ(i), Δ=6,12 | Ranks over localized base = 1 and 2; −4 becomes a unit in second case | No duplicate absolute étaleness target. |
| Ramified exclusion | ℤ[i] at 2 without inversion | d(i²+1)=2i di reduces to 0; Ω⊗𝔽₂ = 𝔽₂[i]di ≠ 0 | Missing inversion detected. |
| P_R and ε_R | F=ℚ, Δ=6, m=1 | First term is THH^{hS¹}; ε identifies h-completions with ℤ[1/6][[h]] | π₀ taken after spectral limit. |
| Localization unit arithmetic | Δ=6 and 12 | 6/Δ = 1 and 1/2 are units after inversion | Divisibility arithmetic retained. |
| numberFieldTraceExports construction | m=1, F=ℚ, Δ=6 | ζ₁=1; qW₁=R; τ₁(q)=1+h; ρ₁(q)=1 | Map sources and targets fixed. |
| Base-convention comparison | Rational scalar 1/Δ | φ_p(1/Δ)=1/Δ away from Δ; completed terms =0 at divisors of Δ | Completed base-change use retained. |
| Full coefficient algebra | R=ℤ[i][1/6], m=4 | R⊗ℤ[i]≅R×R; ranks 2 versus rank 1 after choosing a component | No factor discarded. |
| numberFieldTraceExports_cyclotomic | m=1, z=ε_R(q) | ρ₁(z)=1; reduction after ε_R⁻¹ also 1 | Finite-quotient transport retained. |
| numberFieldTraceExports_taylor | m=1, z=ε_R(q) | τ₁(z)=1+h on both routes | Root choices come from supplied §5.2. |
| numberFieldTraceExports_transition | Gaussian constant i, p=7 | Constant family: i versus −i; inverse-twisted family: i versus φ₇(−i)=i | Coefficient Frobenius required. |
| Order-three Frobenius Check | a=ζ₇, p=11 | 11 mod 7=4; inverse family gives a⁸=a; forward family gives a¹⁶=a²≠a | Added sign/direction discriminator. |
| Abelian constant-family identity | Any p∤Δ, φ_m commuting | φ_p φ_(pm)⁻¹(a)=φ_m⁻¹(a); at p=11,m=1 exponent 4·2≡1 | Every occurrence uses inverse Frobenius. |
| Cubic constant-family Check | p=5, x³−2 | Product coefficients mod 5 = (3,0,0,1); quadratic discriminant 3 not in {1,4} | Frobenius moves the quadratic component. |
| numberFieldTraceExports_equalizer | F=ℚ, Δ=6, family (1,0,…) | Edge p=5,m=1 gives 1 versus 0 | Unrestricted product strictly larger. |
| numberFieldTraceExports_hCompletion | F=ℚ, Δ=6 | h-completion R[[h]]; kernel of τ₁ contains localized-order components | Completion not an injectivity assertion. |
| numberFieldTraceExports_mOne | Component at root order 2 over ℤ[1/6] | Nonzero idempotent on that component has τ₁=0 | m=1 Taylor map is not globally injective. |
| numberFieldTraceExports_naturality | Identity embedding; ℚ→ℚ(i), Δ=12 | Both routes send 1↦1 and q↦ζ_m+X_m; for identity, ρ₁(q)=1 | Naturality remains a target. |
| Trace input with Δ=1 excluded | F=ℚ | Ring ℤ is étale; predicate false since 6∤1 | Trace-specific inversion retained. |
| Downstream direction | Gaussian and cubic examples | Supplier positions 160→162; possible consumer 162→163 | No use assigned to position 159. |
| q-Pochhammer sign remark | d=1,2 | (q;q)₁=−h; (q;q)₂=h²(1+q); at q=2,x=3,y=1, λ¹=2 and γ̃¹=−2 | Existing sign correction retained. |
| Normalized q-divided-power derivative | q=2,x=3,y=1,d=2 | δ²=2/3; ∇_qδ²=2=δ¹; γ̃¹=−2 | Confirms the supplied normalized generators. |
| Rational corner source correction | m=1 | Empty local product=0; qdR_(0/ℤ)=ℚ[[h]]; both completed modifications=0 | Uncompleted pair not replaced by local product. |
| Source-reference direction | Étale unit over ℤ | QH Corollary 3.13 gives H; Example 3.12 gives framed differential h∇_q, whose x² coefficient is q²−1 | Existing locator correction retained. |

## Maintainer consequences

Two additional RefinedTraceMethods §6.1 contracts require supplier work; this report does not certify them or settle their implementation. The fourteen supplied Habiro contracts require no new target in those suppliers. The canonical theorem now uses the positive bound already supplied, so no n=0 extension is requested. The only new local target name is perfectedLiftNaive_higherPowers, a relocated application in prose; quotientLift_moore is no longer a local target. No Lean name was added, renamed or deleted.

The inverse-Frobenius correction matters for any downstream use of GSWZ footnote 1 in abelian fields with Frobenius order greater than two. Gaussian and cubic order-two witnesses cannot detect the error. No other roadmap was edited. The repairs and computed tests are ready for the required fresh independent review; they are not a claim of acceptance.
