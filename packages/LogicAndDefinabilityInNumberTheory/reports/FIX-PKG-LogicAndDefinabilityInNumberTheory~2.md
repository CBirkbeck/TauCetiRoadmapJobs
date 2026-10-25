# Repair report: LogicAndDefinabilityInNumberTheory

The review was treated as mathematical claims. Changes are in packages/LogicAndDefinabilityInNumberTheory/README.md, Suggested.lean and sources.toml. The numbering of retained subsections and the worker's heading-slug links are preserved. No metadata or design-plan change was needed.

## F01 (P2) — applied

Absent headlines → Ax–Kochen ring-sentence transfer, Igusa–Poincaré rationality and parameter-uniform Pila–Wilkie. Rationality uses every characteristic-zero DVR finite over ℤ_p, including ramified extensions at every prime. The o-minimal predicate, algebraic part and height have real bodies on native carriers. The module docstring names missing carriers for the remaining headlines.

## F02 (P2) — applied differently

Duplicate §§6.29, 6.31 and 7.6 → ownership and exact imports from AbelianSchemesAndArithmeticModuliPartII B2.6, B2.7, B2.14, B2.15 and B2.18. Section 6.27 retains only integral-height and image-block corollaries; §6.28 consumes B2.6 explicitly. Scope, build description, examples, dependencies and downstream claims agree. These contracts were read at the supplied open head.

## F03 (P2) — applied

Large-prime-only local theory → separate fixed-F Macintyre cell decomposition and constructible integration at every prime in §§2.2 and 2.4, and all-p-adic-field rationality in §2.6. Uniform specialization retains its own large-characteristic hypotheses. Evidence: integrability_of_oscillatory_functions_on_local_fields_transfer_p lines 474–517, 532–554 and 670–681; Denef 1984, Theorems 1.1–1.2, cited uncertified.

## F04 (P2) — applied

Presburger-only elimination/AKE → H_ac,0 with arbitrary ordered abelian value groups and arbitrary fixed residue/value-language expansions in §§1.1–1.4. The discrete specialization remains explicit for integration. The Hahn-field Check witnesses the wider scope. Evidence: cluckers_loeser_2008 lines 318–374; pas_1989 §2.4, p.140, and Theorem 4.1, p.155, inspected visually.

## F05 (P2) — applied

Unspecified analytic setting → o-minimal expansions of R_an in §§6.17–6.18. The smooth ambient closure arguments come from ShimuraVarieties §3.5d; the retained extension treats singular quasi-projective ambients. Added closure and Chow Checks compute the affine line, nodal branch, empty locus and nonproper ambient cases. Evidence: peterzil_starchenko_agc lines 197–199 and Theorems 3.2, 4.1, 4.4/Corollary 4.5.

## F06 (P2) — applied

Finite enumeration, witness traces and timeouts in §5.5 → deletion of that subsection and its downstream promise. The build description now states the measure-normalized arithmetic interface. The mathematical computability and undecidability theory of §§4.11–4.19 remains; no consumer or internal link uses §5.5.

## F07 (P3) — applied differently

The unused Dittmann–Pop proof branch → deletion of §§1.7, 1.10, 1.13–1.16 and 1.19–1.20, including the avoidance paragraph and undefined G_T. No endpoint was added. The retained prime-divisor and residue-interpretation targets have independent uses and sources. Evidence: dittmann_pop lines 44–77 and 694–725 identify the distinct endpoints and their hypotheses.

## F08 (P3) — applied differently

Interpretation citations → Hodges §5.3; Kronecker dimension → dittmann_pop lines 35–36; henselization → Stacks tags 04GN/04GS/0ASK and SchemeAndStackFoundations §§0.12–0.14. The unused §1.7 and Proposition 3.10 attribution disappeared with F07. The published Koenigsmann Proposition 23(c) already states every positive exponent (koenigsmann_defining_z lines 916–933); §4.32 now explains its nonpower input. That subclaim is disputed.

## F09 (P3) — applied

Missing manifest and third-party scans → a validated 43-entry manifest with stable keys, legal retrieval records, exact locators and version notes. Davis and Pila–Wilkie use DOI links. Uncited references and references used only by deleted targets were removed. The four human-waived entries remain settled; five commercial texts are uncertified citations by locator. No unsettled reference request remains.

## F10 (P3) — applied

Pseudo-declaration labels and mixed name/prose spans → mathematical prose throughout API bullets and Checks. Names absent from Suggested.lean were removed from target prose; retained and new acceptance names are individually linked to their mathematical statements. The polynomial comparison and finite-count targets remain in prose. The package scan finds zero missing README declaration identifiers; all internal links resolve.

## F11 (P3) — applied

Polynomial comparison machinery, the conditional integer-transfer theorem, finite residue count and six computational examples → README-only targets/Checks. Suggested.lean retains the five requested arithmetic headlines and their two necessary definitions, alongside the three F01 headlines and their three necessary definitions. There are eight admitted headline theorems and five definitions, with no admitted data or examples.

## F12 (P3) — applied

Representative/nonexhaustive docstring and name catalogue → the required target-signatures docstring listing headlines and individual missing carriers. Commit and pull-request narrative was removed from Lean. The README support-compression source is now the pinned MvPolynomial.exists_finset_rename and the explicit fixed-input argument in §4.7; the pull-request reference was deleted everywhere.

## F13 (P3) — applied

The subfunctor counterexample now uses ∀y, y²≠−1: {⋆} over ℝ maps to ∅ over ℂ; the existential sentence instead gives ∅→{⋆}. The divisor counterexample now uses the finitely generated field 𝔽_p(s,t), value group ℤ+√2ℤ and residue 𝔽_p: the group is noncyclic and the dimension equation is 1≠2. Both are prose Checks.

## F14 (P3) — applied

Duplicated standard-part target → deletion of §0.8. Henselization, algebraic-group gauge measures and Weil volumes now name their existing owners and distinguish the valued-field, manifold/tensor and arbitrary-smooth-model extensions. Native Presburger and semialgebraic carriers are cited exactly. The Presburger multiplication theorem is on ℕ; the integer negative control now explains restriction to nonnegative inputs.

## F15 (P3) — applied differently

Unsupported named consumers and the downstream Hodge-width promise → removal. ComplexComparisonPartII does refer to this roadmap's LD.6, but is earlier in the supplied order; declaring it a later consumer would be false. Its external citation/order conflict is not actionable in this package. No reverse dependency or invented supplier target was added.

## F16 (P3) — applied differently

Process wording and Gap paragraphs → timeless mathematical statements; supplier contracts are grouped by supplier. Mixed-input Checks were added; G_T vanished with its unused branch. The general proper-equivalence quotient theorem remains with its exact waived locator and three discriminating Checks: narrowing it to a used special case conflicts with the general-library contract. The existing layers were not split or replanned.

## Gate failures

| Initial gate failure | Repair and final outcome |
|---|---|
| Missing sources.toml | Added schema tauceti-roadmap-sources/v1, 43 unique source keys; manifest validation returns an empty error list. All cited works were passed through the sources service except the four settled waivers. |
| TeX-only syntax | Put all affected formulas, including sums, indexed products, component groups and sector formulas, in code spans; scan: tex=0, latex=0. No heading needed a TeX-driven rename. |
| Pull-request number | Deleted the support-compression pull-request reference and both body citations; scan: prnum=0. |
| Six absent polynomial API names | Replaced all API and Check labels by their mathematical facts in prose, including the six named comparison rules; scan: readme-ids-missing=0. No declaration was added to satisfy a label. |
| Three empty Lean sections | Layers 1 and 2 now contain their headlines; the empty Layer 3 header was removed and its missing carriers are explained in the module docstring. All other empty comments were removed; scan: empty-sections=0. |

The worker's removed anchor tags were not restored. The F16 heading change “Rough polynomial localization” has its internal links updated; every internal heading link resolves.

## Verification outcomes

- From the content checkout, `lake env lean` on packages/LogicAndDefinabilityInNumberTheory/Suggested.lean exited 0, with exactly eight expected `sorry` warnings and no errors. The used Tau Ceti module's object file already existed; no build was needed.
- A single scratch module appended `#check @name` for every one of the 13 declarations and elaborated under the defaults, exit 0. Every elaborated type was compared with the README. No section hypothesis disappeared. In particular the rationality type retains primality, characteristic zero, the DVR, its ℤ_p algebra and module finiteness; Pila–Wilkie retains its language structure, o-minimality, family definability, ε>0 and T≥1.
- The package scanner returns `ok=true`, with every reported count zero, and manifest validation returns `[]`. There are no extra imports, option overrides, admitted data, admitted examples, empty sections or private paths in the deliverables.
- The citation resolver reports no unresolved cross-roadmap citations or unknown Lean names. Its library scan is unavailable in its configured location, so native carrier and named-declaration checks were made directly in the pinned Lake packages instead. The old README commit links were updated to lake-manifest.json's actual Mathlib and Tau Ceti revisions.
- A native Mathlib scratch check elaborated all 63 named inputs, exit 0. It exposed the unqualified namespace `exteriorPower`; the README now names `ExteriorAlgebra.exteriorPower`, whose native carrier is the appropriate submodule of the exterior algebra.
- Internal heading-link verification returns no missing target. `git diff --check` exits 0 with no output.
- The requested dependency command with `--movable` exits 0 and prints exactly:

```text
depcheck: 43 roadmaps, 437 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line.

## Evidence and ownership

The shape was compared with the main-branch LocalGaloisGroups, StableReduction and ComplexTori roadmaps. Object searches used the supplied roadmap index, main checkout and board packages, including the available sibling heads. No helper agent supplied a verdict or edit. The distinct owners found are those resolved in F02 and F14: the general real/o-minimal and arithmetic-definability results retained here have no replacement owner in those searches.

| Contract | Copy and evidence inspected |
|---|---|
| Henselization | Main SchemeAndStackFoundations §§0.12–0.14; the_stacks_project line 19728 (04GN), line 19841 (04GS), and line 17792 in the More on Algebra extraction (0ASK). Residue equality and ordered-group equality are separate inputs. |
| Gauge/Weil measures | AdelicAlgebraicGroups open head, §2.4, “The Haar measure of a gauge form over a local field” and “Weil's volume formula for integral points”; its characteristic-zero affine-group scope is retained. |
| Abelian counting/Ax | AbelianSchemesAndArithmeticModuliPartII open head B2.6, B2.7, B2.14, B2.15, B2.18; B2.6 includes the parameter-uniform block decomposition, not merely the marked-path corollary. |
| Definable analytic inputs | ShimuraVarieties open head §§3.5a, 3.5d and 3.6; the smooth ambient setting and expansion of R_an are explicit. |
| Quadratic and height inputs | Main QuadraticFormInvariants Layer 2/§6C, GlobalQuadraticForms §§4.1–4.4, 5.5, 6.1, DiophantineApproximationAndTranscendence §§0.1–0.3; HeightsRationalPointsAndObstructions open head §§2.16b–2.21, 5.1, 5.6, 5.8. |
| Remaining geometric inputs | MotivesAndAlgebraicCycles open head §4.20, NeronModelsAndSemistableAbelianVarieties open head §§2.5/4.6, ResolutionOfSingularitiesCharacteristicZero open head §6.2, WeilConjectures open head “Curve RH from the surface bound”; main AdicSpaces Layer 1, RealAlgebraicGeometry Layers 3/6 and DifferentialGeometry “Boundary and corners”/5.5. |
| Auxiliary prime inputs | Main Chebotarev Layer 14 and ClassFieldTheory Layers 5, 10–13; only their prime-existence, cyclic-algebra and reciprocity interfaces are consumed. |
| Pinned native carriers | Mathlib/ModelTheory/Definability.lean:54; ModelTheory/Algebra/Ring/Basic.lean:223; RingTheory/DiscreteValuationRing/Basic.lean:56; Algebra/MvPolynomial/Rename.lean:282 and Funext.lean:56; ModelTheory/Arithmetic/Presburger/Definability.lean:148/162. |
| Pinned Tau Ceti | Geometry/RealAlgebraic/Semialgebraic/Basic.lean:68; RingTheory/Valuation/Coarsen.lean:69/103; RingTheory/GrothendieckRing.lean:180/205/232; AlgebraicGeometry/AdicSpace/ValuationSpectrum/Basic.lean and PatchPresentation.lean. |

The four waived works were neither fetched again nor requested again. Davis, Hodges, Denef, Bosch–Lütkebohmert–Raynaud and Schneider are recorded as uncertified commercial texts, by their published locators. Published Koenigsmann, Tsimerman and Pila–Tsimerman were fetched from the publisher's open archive, so preprint numbering was not substituted for their published numbering. The fixed-prime integration repair uses the legally fetched CGH arXiv v2; its §3 numbering is explicit.

## Adversarial mathematics pass

Each row records a concrete specialization or countermodel calculation. “Retained” means the calculation supports the stated hypotheses; it does not certify a future proof. API/Check label removals change no underlying equation; the corresponding objects and laws are exercised below. Deleted auxiliary statements are recorded as deletions rather than asserted as new targets.

| Statement | Instances tried | Values computed on the two sides | Result | Change |
|---|---|---|---|---|
| Convention: nontruncated divisor dimension | Trivial valuation of 𝔽₂ | dim κ+1=1, dim K=0; 1≠0 although 0−1 truncates to 0 | Rejects trivial divisor | Retained |
| Convention: Haar normalization | O and πO, q=2 | μ(O)=1; μ(πO)=1/2; norm π=1/2 | Scaling agrees | Retained |
| Convention: tensor density | π²(dx)⊗2, q=2 | square root of norm π²=√(1/4)=1/2 | Excludes density 1/4 | Retained |
| Convention: base-first wedge | a=xy on x≠0 | da∧(−dx/x)=(y dx+x dy)∧(−dx/x)=dx∧dy | Negative relative form is necessary | Retained |
| Convention: parameter q | q=1 and q=2 | 1−q⁻¹=0 and 1/2 respectively | q=1 cannot evaluate localization | Retained |
| Convention: signed polynomial evaluation | X₀−2X₁ at (1,3) | 1−6=−5; truncated subtraction would give 0 | Integer coefficients essential | Retained in README |
| Convention: chart direction | φ₁(u)=u, φ₂(v)=2v | φ₂⁻¹φ₁(u)=u/2, reverse is 2u | Fixes transition direction | Retained |
| Convention: tuple degree | (√2,√3) | each degree 2; joint field degree 4 | Coordinatewise bound differs from joint degree | Retained |
| 0.1 domain and quotient | Fractions (1,2),(2,4),(1,0) | 1·4=2·2=4; denominator 0 fails; quotient value 1/2 | Legal representatives agree | Citation changed |
| 0.1 function uniqueness | One input assigned both 0/1 and 1/1 | Cross products 0 and 1 differ | Graph fails single-valuedness modulo E | Labels removed |
| 0.2 existential semantics | ∃y,2y=1 in Frac ℤ | y=1/2; pair (a,b)=(1,2) gives 2a=b=2 | Both semantic directions agree | Citation changed |
| 0.2 identity/composition | Three identity interpretations on a singleton | arity 1, one quotient class, both composites send ⋆ to ⋆ | Identity/composition agree | Citation changed |
| 0.3 bi-interpretation | Two identity interpretations of ℤ | The class of 2 maps to 2 and its comparison returns 2 | Comparison map is required data | Citation changed |
| 0.4 transitivity parameter bound | Two finite parameter tuples of lengths 2 and 3 | Concatenated length 5; identity at any entry returns that entry | No infinite parameter tuple introduced | Citation changed |
| 0.5 addition/product of fractions | 1/2 and 1/3 | sum (5,6)=5/6; product (1,6)=1/6 | Domain denominators remain nonzero | Citation changed |
| 0.5 domain hypothesis | Zero ring | no pair has b≠0; D=∅, so no nonempty fraction field | Integral-domain hypothesis excludes it | Retained |
| 0.6 arithmetic bridge | 2·(1/2)=1 | translated equation 2a=b at (1,2) gives 2=2 | Guard and representatives agree | Citation changed |
| 0.7 diagonal arithmetic | Constant sequences 2 and 3 | [2]+[3]=[5]; 2+3=5 | Diagonal respects operations | Labels removed |
| 0.7 oversized element | H=[i], numeral 7; principal ultrafilter at 2 | {i:i>7} cofinite, hence H>7; principal H=2 is not >7 | Nonprincipality is essential | Retained |
| 0.7 finite remainders | Modulus 2 | even and odd classes partition ℕ; exactly one belongs to U; residues 0 or 1 | Existence and uniqueness use finite partition | Retained |
| 0.8 native standard part | Real 3; infinite hyperreal omega | stdPart(3)=3; stdPart(omega)=0 does not imply omega≈0 | Native laws already have their owner | Target deleted |
| 1.1 guarded zero | ord(0) assigned 0 or 7 | guard 0≠0 is false in both; nonzero atom has same truth | Totalization cannot leak | General language retained |
| 1.1 Presburger specialization | 3 and 2 modulo 2 | 3≡1; 2≢1 | Extra Presburger symbols belong only to specialization | Broadened language |
| 1.2 multiplicativity | x=0,y=1 and x=t,y=t² | ac(0)=0·1; ac(t³)=1·1=1 | Zero and nonzero laws agree | Broadened value group |
| 1.2 leading coefficient | t³(2+t) over ℂ((t)) | ord=3, ac=2 | Normalization fixed | Retained |
| 1.2 changing uniformizer | π=t, π′=2t, input t³(2+t) | ac at π is 2; at π′ is 2·2⁻³=1/4 | Not invariant under uniformizer choice | Retained |
| 1.3 general elimination | ℂ((t^ℚ)) | residue char 0; Γ=ℚ; 1 has half 1/2, unlike ℤ | Non-discrete model included | Added Check |
| 1.3 residue-characteristic boundary | ℚ₂ | char residue=2≠0 | Outside H_ac,0, inside fixed-prime local theory | Added Check |
| 1.3 trivial valuation | ℂ with trivial valuation | Γ={0}; ac=id; ord(x)=0 for x≠0 | General source has no nontriviality requirement | Removed unintended restriction |
| 1.4 AKE coefficient diagram | Identity pair ℂ((t^ℚ)) | residue, value group and coefficients each map identically; sentence truth equals itself | Both residue/value expansions retained | Broadened |
| 1.5 eventual ring transfer | Sentence 2·1≠0, p=2,3 | p=2: true in ℚ₂, false in 𝔽₂((t)); p=3: true in both | Bound depends on sentence | Headline added |
| 1.6 characteristic offset | 𝔽₂, ℚ, 𝔽₂(t), ℚ(t) | Kronecker dimensions 0,1,1,2 | Offset and isomorphism invariance agree | Locator changed |
| 1.6 algebraic extension | ℚ⊂ℚ(√2) | transcendence degrees 0=0; dimensions 1=1 | Algebraic invariance | Retained |
| 1.8 geometric divisor | t-adic on 𝔽₂(t) | Γ=ℤ, κ=𝔽₂; 0+1=1 | Geometric divisor | Retained |
| 1.8 arithmetic divisor | 2-adic on ℚ | Γ=ℤ, κ=𝔽₂; 0+1=1; characteristics 0 and 2 differ | Arithmetic divisor | Retained |
| 1.8 nondiscrete finite-generation control | v(s)=1,v(t)=√2 on 𝔽₂(s,t) | Γ=ℤ+√2ℤ; κ=𝔽₂; residue dimension plus one=1≠2 | Fails both discreteness and divisor dimension | Replaced vacuous Check |
| 1.9 residue criterion | t-adic on ℚ(t) | dimensions 1+1=2; cyclic Γ=ℤ and residue ℚ finitely generated | DVR conclusion realized | Retained |
| 1.9 finite-generation boundary | 𝔽₂(t^(1/2^∞)) | dimension 1, residue dimension 0; Γ=ℤ[1/2] has no least positive value | Same dimension equation without finite generation does not imply DVR | Retained negative control |
| 1.11 henselian fixed point | ℚ₂ | henselization equals ℚ₂; Γ=ℤ, residue 𝔽₂ unchanged | Initial valued extension fixed | Supplier corrected |
| 1.11 arbitrary rank | Iterated Laurent field ℂ((s))((t)) with composed valuation | Γ=ℤ² lex; residue ℂ before/after henselization | No rank-one restriction | Supplier corrected |
| 1.11 henselization versus completion | Countable ℚ at p | henselization algebraic/countable; ℚ_p uncountable | Distinct objects | Retained |
| 1.12 membership patch | a=0; spectral pair (a,b)=(1,0) | U₀ is all; basicOpen(1,0) is empty | Zero denominator treated separately | Retained |
| 1.17 residue equivalence | ℤ_(3)⊂ℚ, inputs 1 and 4 | difference 3∈3ℤ_(3), same residue 1; 1 and 2 differ modulo 3 | Quotient has three classes | Labels removed |
| 1.17 maximal ideal formula | x=0,3,1 in ℤ_(3) | 0 included by first clause; 1/3 outside ring, 3 included; 1⁻¹=1 in ring, 1 excluded | Zero/unit distinction correct | Retained |
| 1.18 composed valuation | t-adic on ℚ(t), then 2-adic on ℚ | w(t)=(1,0), w(2)=(0,1), residue 𝔽₂ | Composite ring lies in t-adic ring | Retained |
| 1.7/1.10/1.13–1.16/1.19–1.20 | Dependency and source endpoints | No retained Needs link targets these eight subsections; DP Theorem 1.3 has d≥3 and a characteristic-2 resolution hypothesis | Avoid asserting an endpoint absent from the roadmap | Deleted branch |
| 2.1 zero and one cells | q=2, c=0,a=0,ξ=1 | singleton {0} has Haar mass 0; 1+2O has mass 1/2 | Different intrinsic dimensions | Retained |
| 2.1 all units | General q | q−1 angular fibres, each mass q⁻¹; total 1−q⁻¹ | A cell is not the entire annulus | Retained |
| 2.2 fixed-prime preparation | f=1 over ℚ₂; f=x²+y² at (0,0) | order 0 for 1; f(0,0)=0 has no finite order | Zero locus separated | Added fixed-prime theorem |
| 2.2 ramified preparation | ℚ₂(√2), π=√2 | ord π=1, ord 2=2, q=2 | Prime and uniformizer differ | Added Check |
| 2.3 indicator/pullback | Indicator O; empty subset | integrals 1 and 0 respectively; identity pullback fixes both | Constructible does not mean integrable everywhere | Retained |
| 2.3 geometric sum | q=2 | Σ from n=0 of 2⁻ⁿ=2=(1−1/2)⁻¹ | Denominator nonzero | Retained |
| 2.4 one-cell integration | q=2, ord z=1, ac z=1 | μ(2+4O)=1/4=2^(−1−1) | Normalization agrees at small prime | Fixed-prime coverage added |
| 2.4 unbounded integrability | Constant ab−c on F, (a,b,c)=(2,3,6),(2,3,5) | constants 0 and 1; integrals 0 and ∞ | Full locus is c=ab, not a Presburger set | Native theorem scope clarified |
| 2.4 interpolation outside locus | Same constants | replacement is 0 on the nonintegrable constant fibre; agrees with original 0 on integrable fibre | No value of the integral asserted outside locus | Retained |
| 2.5 substitution determinant | x=πu, q=2 | measure of πO=1/2; ∫ over O of norm π=1/2 | Uses determinant, not inverse | Retained |
| 2.6 zero polynomial | f=0, arbitrary m and F | Z=0, A=1/(1−T); TZ=0=1+(T−1)/(1−T) | Zero locus need not be null | All-prime theorem added |
| 2.6 constant unit | f=1 | Z=A=1; TZ=T=1+(T−1) | Level zero retained | Added Check |
| 2.6 coordinate polynomial | f=x, q=2 | raw N_n=1; A=1/(1−T/2); Z=(1/2)/(1−T/2) | Both tails give T/(2−T) | Added Check |
| 2.6 zero variables | m=0, f=0 or 1 | f=0: raw series 1/(1−T); f=1: raw series 1 | Fin 0 and the zero quotient are legitimate | Headline generality audited |
| 2.6 constant of order one | f=π | a₀=a₁=1,a₂=0; A=1+T, Z=T; 1+(T−1)(1+T)=T² | Tail identity survives positive constant order | Added to audit |
| 2.7 gauge scaling | dx and π²(dx)⊗2 | μ(O)=1 and q⁻¹; at q=2, 1 and 1/2 | Tensor root indispensable | Supplier extension stated |
| 2.7 zero/unit factors | 0·dx and u·dx, norm u=1 | measures 0 and original μ; zero form not gauge | Nonvanishing distinguished from density existence | Retained |
| 2.8 null loci | Point in affine line; d=0 point itself | first has codimension 1 and mass 0; second codimension 0, mass 1 | Positive codimension is essential | Retained |
| 2.9 Weil volume | Affine line and multiplicative group, q=2 | 2/2=1; (2−1)/2=1/2 | Matches additive/unit volumes | Supplier extension stated |
| 2.9 empty and zero-dimensional models | Empty smooth model; Spec O | 0/q^d=0; 1/q⁰=1 | Empty and d=0 cases consistent | Retained |
| 2.10 finite quotient | Two disjoint copies mapping to one copy | upstairs mass 2v; divide by #Γ(F)=2 gives v | Sheet factor correct | Retained |
| 2.10 torsor-image limitation | Squaring on ℚ₃× | 1 lifts via ±1; 2 has no lift since 2 nonsquare modulo 3 | Image differs from all rational quotient points | Retained |
| 2.10a split multiplicative curve | Tate curve with component order n | connected fibre count q−1; full count n(q−1) | Component factor necessary | Retained |
| 2.10a arbitrary group action control | S₃ on M=𝔽₃³/diagonal | M^S₃ has 1 element; (M*)^S₃ has 3 | Cannot infer dual invariant-cardinality equality for arbitrary actions | Retained |
| 2.10a cyclic action | −1 on ℤ/3 | invariant subgroup {0} on module and dual; orders 1=1 | Frobenius/procyclic argument differs from S₃ | Retained |
| 2.11 isogeny volume | Zero form; identity on good-reduction A | 0=0; identity gives #A(k)/q^g on both sides | No nonzero-form hypothesis required | Retained |
| 2.12 relative Fubini | xy=a, nonzero x | relative form −dx/x; per shell norm mass 1−q⁻¹ | Base-first sign agrees with layer conventions | Retained |
| 3.1 nonfunctorial truth | ℝ⊂ℂ; universal and existential square-root sentences | universal {⋆}→∅ impossible; existential ∅→{⋆} possible | Counterexample direction repaired | Changed Check |
| 3.1 graph functions | Identity formula y=x and relation y²=x | identity has one output; x=1 has two roots in ℂ | Total unique graph condition excludes a relation | Retained |
| 3.2 scissors and completion | Residue line and two points | [RF]=[RF×]+1; two-point pushforward gives 2 | Completion carrier separate from geometric motives | Retained |
| 3.3 coefficient positivity | L−2 at q=3/2; q=1 | −1/2<0; denominator 1−1/q=0 at 1 | Nonnegative coefficient cone is not coefficientwise positivity | Retained |
| 3.4 Presburger summation | Even ray at q=2 | Σ over m≥0 of 2^(−2m)=4/3=(1−1/4)⁻¹ | Congruence class changes denominator | Retained |
| 3.4 constant ray | 1 on ℕ | partial sums N+1→∞ | Not integrable by counting measure | Retained |
| 3.5 residue pushforward | Two-point fibre | f_!(1·1)=2; f_!(1)·f_!(1)=4 | Additive pushforward is not a ring map | Retained |
| 3.6 graded dimension | Singleton in VF | own grade 0 class remains 1; ambient Haar grade 1 class is 0 | No blanket vanishing of graphs | Retained |
| 3.7 motivic cell integral | ord z=a, ac z=1, specialize L=2 | L^(−a−1) becomes 2^(−a−1); at a=0 gives 1/2 | Motivic/local normalization agrees | Retained |
| 3.8 motivic substitution | Multiplication by t on O | integral on tO=L⁻¹; integral on O with Jacobian factor L⁻¹=L⁻¹ | Jacobian sign fixed | Retained |
| 3.9 specialization | L⁻¹ and residue unit fibre | L⁻¹↦q⁻¹; (L−1)L⁻¹↦1−q⁻¹ | Specialization need not be injective | Retained |
| 3.10 transfer of integrals | Identity function 0 and constant coefficient 1 | zero integral=0 in both fields; ∫ over O 1=1 in both | Fixed expressions transfer, unrelated parameters do not | Retained |
| 3.11 motivic realization | 𝔾_m, ℙ¹; a shift by 2 | images [ℚ(1)]−1, 1+[ℚ(1)]; [X[2]]=[X] | Tate and triangle signs consistent | Label removed |
| 4.1 signed syntax | C(−3) with no variables | evaluation −3; natural-truncated alternative 0 | Native Poly coefficients are integers | Lean padding deleted |
| 4.2 evaluation | X₀−2X₁, natural tuple (1,3) | syntax and native function both −5 | Coordinate cast retained | Lean padding deleted |
| 4.3 syntactic surjectivity | Constant −2 and projection 0 | syntax C(−2), X₀ evaluate to −2 and x₀ | Constants and projections lie in image | README target retained |
| 4.4 infinite-box identity | X(X−1) at 0,1,2 | values 0,0,2 | Finite testing cannot prove polynomial equality | README target retained |
| 4.5 ring comparison | Empty coordinate type | both polynomial rings reduce to ℤ; −3 maps to −3 | Empty/infinite input cases distinguished | Lean intermediate deleted |
| 4.6 renaming | Collapse X₀−X₁ to X₀ | result X₀−X₀=0 on both sides | Renaming need not be injective | Label removed |
| 4.7 finite support | Polynomial X_inl(a)+3 | witness support ∅; same input a retained | No finite-input hypothesis needed | PR source replaced |
| 4.8 witness enumeration | Empty β | t=∅, m=0, unique empty injection | No forced positive witness arity | PR source replaced |
| 4.9 injective witness renaming | U−V−1 | (1,0) is a root; collapsing U,V gives constant −1, no root | Injectivity essential | Retained |
| 4.10 normal form | Even naturals and constant 1 | x−2y=0 iff x even; 1=0 has no witness | Both directions and empty set tested | Lean intermediate deleted |
| 4.11 syntax coding | X−2 at 0 | decoded/effective integer value −2, not 0 | Classical Poly inverse cannot supply code | Retained |
| 4.12 Diophantine implies RE | m=0 and equation 1=0 | single empty tuple tested; equation false | Zero witnesses do not create a search divergence | Retained |
| 4.13 sequence coding | y=6,n=3 | moduli 7,13,19; pairwise gcds 1,1,1 | Positive-domain CRT convention supported | Process word removed |
| 4.14 bounded universal closure | Bound n=0 | no indices, conjunction equals true; empty system encodes 0=0 | Empty universal block correct | Retained |
| 4.15 computation graphs | Minimization with first divergent trial, later successful trial | first trial has no output; later success cannot certify a least defined result | Trace must include earlier defined values | Retained |
| 4.16 MRDP | Empty/full predicates on Fin 0 | unique tuple rejected/accepted; equations 1=0/0=0 | Both are RE and Diophantine | Headline retained |
| 4.17 integer undecidability bridge | Natural witness 7 | 7=2²+1²+1²+1² | Four-square conversion preserves nonnegativity | Retained |
| 4.18 rational integers | −7 and 1/2 | integer witness −7; equation 2z=1 has no integer solution | Embedded subset is correct | Definitions retained |
| 4.18 finite systems | Over ℂ, squares 1 and i; over ℤ/6, factors 2,3 | 1²+i²=0 without both zero; 2·3=0 with both nonzero | One-equation encodings need their field/formal-reality hypotheses | Retained |
| 4.18 unary rational Diophantine sets | ∅ and x≠0 | p=1 has no root; xz−1=0 iff x≠0, witness z=1/x | Definition gives actual equations | Lean examples removed |
| 4.19 denominator transfer | t=1/2, coprime numerator/denominator | m=1,n=2; 1·1+0·2=1 | Bezout and nonzero denominator hold | Conditional Lean padding deleted |
| 4.20 quaternion trace | a,b<0; trace 2 | norm-one tuple (1,0,0,0) has trace 2 | Real ramified trace interval contains 2 | Retained |
| 4.21 dyadic trace witness | (a,b)=(6,15) | a+b−ab=−69≡3 mod8; negative of this norm contribution is 69≡5 | Witness signs distinguished | Retained |
| 4.22 congruence guard | R³₅ | ramification intersection contributes prime 2; output ℤ_(2), not ℤ_(5) | Class-three guard matters | Retained |
| 4.22 empty ramification | R¹_(1,3) | (−2,3) splits; empty intersection is ℚ | No accidental exclusion of all elements | Retained |
| 4.23 semilocal radical | ℤ_(3)∩ℤ_(5) | radical 3ℤ_(3)∩5ℤ_(5); for field ℚ, radical {0} | Zero radical differs from whole field | Retained |
| 4.24 parameter signs | 3,−3, square 1 | 3 lies in positive class 3; −3 fails positivity; 1≡1 mod8 | Sign and congruence guards both needed | Retained |
| 4.25 local integer detection | S={3}; x=1/3,1/5 | 1/3∉ℤ_(3); 1/5∈ℤ_(3) | Local denominator test in right direction | Headlines retained |
| 4.26 rational quantifier blocks | Integer t=0 and noninteger t=1/2 | universal integer predicate true/false respectively; negation reverses them | No existential definition of ℤ follows | Retained |
| 4.27 union rather than intersection | p=17·41, x=1/17 | x∈ℤ_(41), x∉ℤ_(17); union accepts, intersection rejects | Square detector uses union | Retained |
| 4.27 square parameter | p=1 | P(p)=∅, union of local rings=∅ | Empty union not ℚ | Retained |
| 4.28 nonsquares | 0,−1,2/11 | 0=0²; −1 not a rational square; Legendre symbol (2/11)=−1 | Zero excluded, negative rationals included | Headline retained |
| 4.28 nonnorms | y=1 | split norm map (u,v)↦uv reaches every nonzero x | No split-case nonnorms | Retained |
| 4.29 one universal variable | t=0, t=1/2 | t=0 has a witness for every x; for 1/2 some x has no witness, by equivalence | Quantifier order differs from a single existential tuple | Headline retained |
| 4.29a normic degree | deg P=2p, desired cycle degree 2p+1 | difference 1; at p=2, 5−4=1 | Odd/even boundary not excluded | Label removed |
| 4.29a split extension boundary | Split algebra rather than cyclic field | norm is product and surjective; obstruction class vanishes | Field-extension hypothesis substantive | Retained |
| 4.30 nonpowers | r=1, x=0; r=2,x=−1 | every x is first power; 0 is an rth power; −1 is not a square in ℚ | First-power complement empty | Retained |
| 4.31 existential closure | Identity embedding; ℚ⊂ℝ | identity preserves witnesses; x²=2 has 0 roots in ℚ, 2 roots in ℝ | Second inclusion not existentially closed | Retained |
| 4.32 radical closure | n=1; n=3 and cube 8 | K¹=K=L∩K; 2³=8 gives root 2 already in K | Published all-n statement fits §4.30 route | Attribution clarified |
| 4.33 displayed formula degree | Highest u₄ term | coefficient of a²b²u₄⁸ is 1; existential degree 8, total degree 12 | Degree conventions agree | Retained |
| 4.33 guard parameter | a=−1 and u=(1,0,0,0) | a+Σuᵢ²=0; full product F=0 | Nonpositive parameters do not constrain t | Retained |
| 5.1 normalized density | Whole O^d at level n; πO in d=1 | N_n=q^(dn), normalized coefficient 1; πO mass q⁻¹ | Counting dimension retained | Retained |
| 5.1 level zero | n=0 | quotient O/(1) has one element; N₀=1 for every congruence system | Prevents lost constant term | Retained |
| 5.2 uniform identity | Same zero expression in two permitted fields | each side equals 0; numerator identity unchanged after clearing nonzero denominators | Does not exchange arbitrary limits | Retained |
| 5.3 zeta variable | f=x, q=2,s=1 | T=1/2; Z(T)=(1/2)/(3/4)=2/3; valuation integral gives same sum | Substitution convention correct | Retained |
| 5.4 residue axes | 𝔽₂² | solutions (0,0),(0,1),(1,0): 3=2·2−1 | Shared origin subtracted once | Lean example target deleted |
| 5.4 integrated shells | q=2 | 4·(1/2)²·Σ from n=1 of (n+1)2⁻ⁿ=3 | Matches residue count | Retained |
| 5.5 enumeration | Finite residue domain versus infinite witness set | domain at level n has q^(dn) elements; infinite search has no finite exhaustion bound | Mathematical counts retained without procedure | Algorithm subsection deleted |
| 6.1 o-minimal frontier | Interval (0,1), {0}, ℤ | boundaries {0,1}, {0}, ℤ; cardinalities 2,1,infinite | Native predicate excludes definable ℤ | Definition made statable |
| 6.1 empty unary set | ∅ and ℝ | frontiers ∅ and ∅, cardinalities 0,0 | Empty/full sets allowed | Retained |
| 6.2 restricted symbol | Analytic constant 1 on [−1,1] | value at 1 is 1; at 2 is 0 | Closed-cube extension fixed | Retained |
| 6.2 unrestricted sine | sin(πx) | zero set ℤ, infinitely many frontier points | Cannot be globally named in o-minimal field | Retained |
| 6.3 reduct o-minimality | Ordered-field reduct; exponential reduct | unary interval frontier has 2 points in either; a new definable ℤ would have infinitely many | Reduct argument uses same definable sets | Process wording removed |
| 6.4 cells | ∅; point; interval; unit square | cell counts 0,1,1,1 and dimensions −∞,0,1,2 | No analytic-cell assertion for arbitrary expansion | Retained |
| 6.5 frontier versus boundary | Closed line in ℝ² | cl X∖X=∅, but ambient boundary X has dimension 1 | Correct frontier in dimension drop | Retained |
| 6.5 section direction | Two-point set maps to a point | f(g(⋆))=⋆; g∘f cannot fix both distinct points | Right inverse only | Process label removed |
| 6.6 finite charts | Identity and scale-by-2 on a line | transition u↦u/2; inverse u↦2u | Mixed transitions correctly oriented | Labels removed |
| 6.7 abstract corner boundary | Origin in quadrant | two local faces, hence two preimages of vertex | Boundary immersion not injective | Retained |
| 6.8 compact corner atlas | [0,1] | two endpoints, one-dimensional interior; boundary cardinality 2 | Finite restricted-analytic atlas exists | Retained |
| 6.9 identity quotient | Diagonal E on ℝ | q(x)=x; each projection identity, proper inverse image of compact K is K | General noncompact X permitted | General theorem retained |
| 6.9 compact total relation | E=[0,1]² | one quotient point; invariant function takes one value | Quotient universal property realized | Added Check |
| 6.9 closedness boundary | Classes {0},ℝ∖{0} | (1,1/n)∈E tends to (1,0)∉E; nonzero class not closed | Quotient not Hausdorff | Added Check |
| 6.10 exponential sign | Width R=2, z=1+iy and z=5/4+iy | images e^(−2πy) and i e^(−2πy) | Decay sign and factor 2π fixed | Retained |
| 6.11 denominator domain | y>1; candidate x−1/2 | y⁻¹ always defined; candidate vanishes at x=1/2 | Only nowhere-zero denominators admitted | Retained |
| 6.12 rough monomial | y^s and y+(−y) | first has bounding constants 1,1; second is 0 | Signed sums can cancel | Retained |
| 6.13 localization witness | c=(x−1/2)²+y⁻², k=(c+y⁻¹)/(c+2y⁻¹) | 1/2≤k≤1; 1/k−1=y⁻¹/(c+y⁻¹) | Arbitrary comparable rational denominators differ from Laurent denominators | Timeless variant wording |
| 6.13 ring addition | g/h and g′/h′ with nonzero h,h′ | common denominator hh′; value (gh′+g′h)/(hh′) equals sum | No division by zero introduced | Retained |
| 6.14 decay | y²e^(−y), y=10,20 | 100e⁻¹⁰≈0.00454; 400e⁻²⁰≈0.000000824 | Dominates polynomial tail | Formula code-span repair |
| 6.15 width escape | R′=1,m=2,c=0,x₂=3/4 | x₁=3/2>1; inside width 2 | Width-one hypothesis insufficient | Unsupported Hodge promise cut |
| 6.15 denominator width | h=(x−2)²+y⁻² | on width 1: 1<h<5; at x=2 in width 3: h=y⁻²→0 | h∈S₁ but h∉S₃ | Retained |
| 6.15 finite differences | r=2, polynomial (mx+c)² | f₂−2f₁+f₀=2; divide by 2!=2 gives 1 | Leading x-degree isolated | Retained |
| 6.15 distinct powers | Exponents 0,−1 at m=1,2 | matrix [[1,1],[1,1/2]], determinant −1/2 | Coefficients recoverable | Retained |
| 6.16 algebraic atlas | ℙ¹ charts | transition z↦1/z; composition z↦1/(1/z)=z when z≠0 | Nonzero overlap guard explicit | Retained |
| 6.17 closure, smooth | Y=ℂ,E={0},A=ℂ× | closure ℂ, ideal (0) | Definable Remmert–Stein value | Hypothesis corrected |
| 6.17 closure, singular | Node xy=0, punctured x-axis | closure y=0 within node | Singular extension has correct branch | Added Check |
| 6.17 empty domain | E=Y | A=∅; closure ∅ | Empty locus handled | Added Check |
| 6.18 nonproper Chow | Y=ℂ×,A={1} | ideal (z−1) in ℂ[z,z⁻¹] | Properness of ambient unnecessary | Added Check |
| 6.18 Boolean cases | A=∅ or Y | ideals (1) or (0); Y∖∅=Y | Boolean operations yield constructible sets | Added Check |
| 6.19 continuous extension | U=ℝ∖{0}, f=0; f=1/x | first graph closure ℝ×{0}; second has no continuous extension at 0 | Theorem asserts definability only when extension exists | Retained |
| 6.20 countable union control | Countable rational points in ℂ | union ℚ is not o-minimally definable; finite subsets have finite frontiers | No finite-subunion conclusion without definability | Retained |
| 6.21 algebraic part | (0,1), singleton {0}, empty set | algebraic parts (0,1),∅,∅ | Positive dimension excludes isolated points | Native definition added |
| 6.21 nonsemialgebraic graph | Graph of real exp on (0,1) | no semialgebraic positive-dimensional arc; algebraic part ∅ | Definability alone does not put graph in algebraic part | Retained |
| 6.22 heights | −3/4,0,(−3,2),empty tuple | 4,1,3,1 | Reduced denominator, sign and zero dimension correct | Definition and Checks added |
| 6.23 parametrization chain rule | f(t)=t, ψ(t)=t² | (f∘ψ)″=2 while f″=0 | Full chain rule required | Retained |
| 6.24 determinant exponents | k=1,n=2, D=binomial(d+2,2) | B=D(D−1)/2; η=4d/(D−1)→0 | Exponent tends to zero as claimed | Formula code spans repaired |
| 6.25 Pila–Wilkie degenerate fibres | X_t=∅ or singleton, ε>0,T≥1 | counts 0 or ≤1; C=1 works because T^ε≥1 | Empty and zero-dimensional fibres valid | Headline added |
| 6.25 n=0 | Unique empty rational tuple | height 1; algebraic part empty; count at most 1 | Fin 0 statement nonvacuous | Headline audited |
| 6.25 arbitrary algebraic part | X=(0,1) | transcendental part empty, count 0≤C T^ε | No false count of all interval rationals | Headline audited |
| 6.26 block images | Interval and constant semialgebraic image | dimensions 1 and 0; algebraic part interval and ∅ | Image can collapse dimension | Retained |
| 6.27 integral height corollary | Integer tuple (−3,2) | max absolute coordinate 3 equals rational tuple height 3 | Imported bound applies directly | Ownership narrowed to corollary |
| 6.27 semialgebraic image corollary | Identity versus constant on interval | one image block in both cases; dimensions 1 and 0 | Number of blocks does not increase | Added Check |
| 6.28 algebraic height | k=2,H=2 | coefficient-height upper bound 2²·2²=16; coding uses 3 coefficients | Length is k+1 | Timeless wording |
| 6.30 growth comparison | c=C=A=1,δ=1,ε=1/2,D=100 | orbit lower bound 100; singleton bound 10 | Strict exponent inequality forces a positive-dimensional block eventually | Retained |
| 7.1 CM lift | D=−3, τ=(−1+√−3)/2 | Re τ=−1/2 has rational height 2; Im τ has polynomial 4X²−3 and degree 2 | Both lift coordinates have bounded degree | Labels removed |
| 7.1 lift/orbit exponents | g=1, orbit growth D^(1/b), height D^a | comparison exponents 1/b and aε; choose ε<1/(ab) | Counting constant cannot absorb unbounded growth | Retained |
| 7.2 exceptional points | Special singleton versus special curve | singleton has one exceptional point; curve has zero points outside its positive-dimensional special locus | Finiteness statement includes dimension zero | Retained |
| 7.3 maximal special family | Special point V and special curve V | one maximal special subvariety, namely V, in each | Counts maximal members rather than all points | Retained |
| 7.4 André–Oort closure | Empty set of special points; special singleton | closures ∅ and that singleton; unions have 0 and 1 members | Finite-union conclusion consistent | Retained |
| 7.5 CM-pair boundary | Diagonal; line j₁=1728; line j₁=1 | diagonal and CM line each contain infinitely many CM pairs; non-CM line has 0 | Excluded special curves are necessary | Input name made prose |
| 7.7 codimension | dim X=2,dim Ď=3,codim Z≥2,dim U=1 | codim U=4<5≤codim(X×Z)+codim W | Ax–Schanuel strict inequality has right direction | Retained |
| 7.7 isolated component | Point in universal cover | projection a point; dimension 0<dim X | Proper algebraic point locus suffices | Retained |
| 7.8 mixed density | Special torsion singleton and non-torsion singleton in CM elliptic fibre | special-point counts 1 and 0 | Density holds only in first | Added Checks |
| 7.8 pure limit | Torsion component trivial | order=1; polynomial factor 1^a=1 | Lift bound reduces to pure bound | Added Check |
| Lean rationality hypotheses | O finite over ℤ₂, π²=2 | residue cardinal 2, ramification index 2; raw f=x series 1/(1−T) | Generality includes wild small prime | Explicit own binders |
| Lean o-minimal carrier | Order/addition/multiplication graphs, unary ℤ | defining equations x+y=z and xy=z; finite-frontier axiom rejects boundary ℤ | Predicate specifies actual field expansion up to definability | Real-bodied definition |
| Lean algebraic part | n=0; two disconnected points | no non-subsingleton connected subset in either case; algebraic part ∅ | Prevents finite-set false positives | Real-bodied definition |
| Lean rational bounded count | n=1,T=1 | only rationals −1,0,1 qualify, a set of 3; any fibre selects a subset | ncard is finite, not an infinite-set junk value | Headline audited |

## Maintainer consequences

The dependency scan accepts this package. Separately, the supplied merge order places ComplexComparisonPartII before this roadmap, while its open-head prose assigns nonproper definable Chow to LogicAndDefinabilityInNumberTheory LD.6. This external direction conflict requires a human ownership/order decision; this package neither consumes ComplexComparisonPartII nor lists it as a later consumer. There is no missing supplier prerequisite to register in this package's gaps list, and no design/plan.json exists here.

The removed Lean names are Diophantine.toDiophPoly, Diophantine.toDiophPoly_apply, Diophantine.polynomial_comparison, Diophantine.dioph_iff_exists_fin_mvPolynomial, diophantine_integer_transfer and product_zero_residue_count. Their mathematical targets remain in README §§4.1–4.10, 4.19 and 5.4. The source provenance continues to credit Freer's two independent formalization files. Newly stated acceptance names are ax_kochen_ring, igusa_poincare_rationality, IsOMinimalExpansion, algebraicPart, rationalTupleHeight and pila_wilkie. The retained arithmetic acceptance names are unchanged.

The source-fetch logs contain no instruction relied upon as authority. Source extractions remain outside the repository. No other package, checkout, merge order, pull-request text or tooling was edited; no commit or network write to a collaboration service was made. A fresh independent review remains necessary.
