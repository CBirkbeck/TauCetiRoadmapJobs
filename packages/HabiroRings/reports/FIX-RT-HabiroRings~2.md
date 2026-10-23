# HabiroRings repair findings

The findings are grouped by review, with their original identifiers in the headings. References a/Fnn and b/Fnn distinguish repeated identifiers in the explanations. Overlapping findings have a common repair, with separate verdicts below. This report records mathematical verification and elaboration; it does not replace independent review.

## Review a

## F01 (P3) — applied

Deleted the proved zero-evaluator declaration from `packages/HabiroRings/Suggested.lean`. Its §6.4 README Check remains as prose: the zero map evaluates every tensor to 0, while 0≠1 over ℤ. The deleted declaration is no longer advertised as a Lean name.

## F02 (P3) — applied

Deleted the example-only marked reduction and fibre trivialization definitions and their four examples. Kept their mathematical interfaces and normalization Checks in README §§0.1, 0.4 and 6.4. The independent headline theorems remain. Computations are ε·id·ε⁻¹=id, swap(1,0)=(0,1), and normalized evaluator values 3 and −3.

## F03 (P3) — applied

Replaced unexported QWitt perfection, perfect-coverage, relative-ring and completed-Frobenius identifiers by verified section-and-statement citations throughout the supplier contracts and downstream paragraph. Replaced the Gaussian identifiers in Scope, contracts and §2.11 similarly. QWittVectors §§2.3–2.4, 4.1–6.3 and QSeriesPartitionsAndMockModularForms §3.1 state the mathematics without those identifiers. No additional gap is needed.

## F04 (P3) — applied

Deleted `etale_localization_away_discr`; kept the general support criterion and the discriminant-multiple consequence in README §5.8. For each prime p, p∣disc(F) and disc(F)∣Δ imply p∣Δ by transitivity. The retained theorem also handles F=ℚ(i), Δ=2, where −4∤2. Downstream users of the deleted Lean name must use the support criterion.

## F05 (P2) — applied

Added the concrete Laurent localization, positive-factor submonoid, factorial denominators and two free-module maps, then `LaurentLocalization.free_resolution`. Added `CountableSolidHabiroTensor.separable_weights` with exactly radial properness and no spectral assumption. README §§2.2 and 2.11 give their definitions, API, proof inputs and discriminating Checks. Evidence: Q line 3592 and Q line 3713. The wrong cumulative-factor differential gives −2/3 at q=2, i=1.

## F06 (P2) — applied

Changed the product-divisibility hypotheses in §6.2, its API and §6.7 to separate divisibility by 6 and the relevant discriminants. Kept 6·|disc(F)| as an example choice. Added F=ℚ(i), Δ=12: 6∣12, −4∣12, 24∤12. G line 255 and G line 426 impose discriminant and small-prime exclusions, without those extra multiplicities.

## F07 (P2) — applied differently

The erroneous Lean explanation disappears with a/F02. README §0.1 now says ℤ[1/2] is not finitely generated over ℤ but has rank one. Tensoring with ℚ gives ℚ, of dimension 1. Unbounded powers of 2 in the denominators obstruct finite generation. No boundary declaration was added.

## F08 (P3) — applied

Changed the module to headline target signatures, listed each unavailable-carrier headline and removed both API-catalogue comments. Converted undeclared local API and Check labels throughout README Layers 0–7 and Downstream consumers to prose, preserving their mathematical content. Added the two ordinary milestones under a/F05. Every retained or new named declaration appears in the README.

## F09 (P3) — applied

Deleted the three finite boundary examples. Retained all seven requested boundary values as prose in README §3.2. Kept the combined maximality/mixed-prime/subset-order example and the general height-one theorem. Values are {1,2,4}, {3}, {1}, {0}, {3}, {{1}} and ∅ in the order of the finding.

## F10 (P3) — applied

Added the general obstruction's own QWittVectors §§5.1–5.2 and §6.1 inputs, then labelled its cubic finite-stage corollary and gave it a separate dependency line. Removed the self-reference. W line 1739 states the obstruction; W line 1747 and W line 1768 explain reduction and ghost normalization. The cubic application consumes that obstruction.

## F11 (P2) — applied

Qualified the chain radical formula as integral, and used radicals on both sides after arbitrary coefficient extension. Added three §3.1 Checks, including A=𝔽₂[ε]/(ε²): I=(q−1), but both extended radicals are (ε,q−1). W line 305 gives the integral pair intersection; Q line 601 uses its completion-category consequence. Equality of radicals survives arbitrary base change here via mutual power containments.

## F12 (P3) — applied differently

Replaced H.5/H.6 and K-theory assembly inputs in Scope and §§2.5–2.8, 2.12 and Layer 2 Dependencies with the actual enhanced/spectral owners. Deleted the irrelevant PrismaticCohomology input to Layer 1. StableHomotopyKTheory §5.18 is a connective comparison; no retained statement needs it. BordismFormalGroups F6.5, GeneralizedCohomology G2.1–G2.7 and EnhancedDerivedSheaves E5 supply the stated ambient inputs.

## F13 (P3) — applied

Corrected T's manifest version note: numbered paragraphs 5.1–5.3 span printed pp.85–86/PDF pp.89–90, and only paragraph 5.3 lies in subsection §5.1. T line 3797, T line 3812, T line 3823 and T line 3832 locate the two preceding paragraphs, subsection heading and compact-generator paragraph respectively. The README's more precise paragraph locator remains.

## Review b

## F01 (P1) — not actionable in this package: re-raised supplier ownership decision requires a human

This expressly re-raises the earlier not-actionable supplier finding. The brief reserves that decision to a human. The full prerequisite already appears as gap:light-solid-spectra in Exact supplier contracts and the plan's top-level gaps, naming SolidAnalyticRings and its contract section. It remains an unsatisfied conditional input. No supplier creation, scope transfer or invented upstream target was made.

## F02 (P2) — not actionable in this package: re-raised supplier-head decision requires a human

The three existing gaps already name HabiroCohomologyFoundations §§0.1–0.3. The supplied roadmap registry cannot resolve this roadmap; this board checkout contains no such package, and its asserted head is not a supplied sibling checkout. The brief reserves re-raised not-actionable findings to a human. Those gaps cannot responsibly become certified imports from the review's unsupported head description.

## F03 (P2) — not actionable in this package: re-raised supplier-head decision requires a human

The four existing HabiroNumberFields gaps name the ring, indexed lines, integral evaluation and supported pullback contracts. The supplied registry cannot resolve the roadmap; this board checkout contains no such package, and its asserted head is not a supplied sibling checkout. A human must settle this re-raised finding and provide the supplier head before the contracts can be re-matched.

## F04 (P3) — applied

Deleted the family merge-order sentence from Scope. The remaining sentence records independence of the earlier specialization. RefinedTraceMethods occurs only as a consumer. The required movable dependency check reports zero problems, with no UPWARD or CYCLE line.

## F05 (P3) — applied differently

Shared repair with a/F03. Neither `gaussianRectangle_product` nor the proposed replacement `gaussianPolynomial_product` occurs at the supplied QSeriesPartitionsAndMockModularForms head. Its §3.1 states the integral identity in prose. Cited that statement and ArithmeticStatisticsPartIV §3.2's actual polynomial/product laws instead. At a=b=1 both sides expand to 1−q−q²+q³.

## F06 (P3) — applied differently

Replaced HR.5/HR.6/HR.7 references with §5.5, §5.6, Layer 6 and §7.4 links; replaced HC.n labels throughout with verified sections/layers. Shared §7.4 dependency repair with a/F10. Deleted the irrelevant PrismaticCohomology input rather than merely relabelling it, as explained under a/F12. No old HR.n, HC.n, PR.0 or H.5/H.6 locator remains.

## Source, ownership and signature evidence

The supplied legal extractions were used; no new source was fetched and no source text was copied. The twelve manifest entries remain distinct. No unresolved source text was encountered. The T locator is the only manifest change.

The ordinary milestones belong here: object searches in main, the board packages, all twenty supplied sibling checkouts and the roadmap service found no other owner of this cyclotomic free resolution or separable-profile theorem. General localization and free-module machinery is imported, not rebuilt. No declaration takes another readable roadmap's fully qualified name. Ownership against the supplied open sibling files was checked; the supplier heads asserted only by reviews were unavailable in the supplied registry and were not certified.

| Citation or pin | Evidence read | Consequence |
| --- | --- | --- |
| Mathlib pin | `lake-manifest.json`: 6b7abb3c7686292736be2955bd3eb9ebf63b456a | Native algebra carriers and declarations checked at that revision. |
| Tau Ceti pin | `lake-manifest.json`: a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 | No Tau Ceti module is used by the acceptance signatures. |
| Existing localization | `Mathlib/RingTheory/Localization/Defs.lean:125` and `:245` | Denominator images are units; native fractions supply the augmentation's real body. |
| Existing free-module map | `Mathlib/LinearAlgebra/Finsupp/LinearCombination.lean:52` | Basis families define actual linear maps. |
| Existing completion | `Mathlib/RingTheory/AdicCompletion/Basic.lean:56`; `Completeness.lean:151` and `:181` | Completeness includes separatedness; quotient-kernel/completeness claims retain finite generation. |
| Existing invertibility | `Mathlib/RingTheory/PicardGroup.lean:77` and `:276` | Canonical dual contraction is bijective; a surjection between invertible modules is bijective. It does not supply an arithmetic evaluator. |
| Discriminant support | `Mathlib/NumberTheory/NumberField/Discriminant/Different.lean:191`; Q line 821 | Prime support gives the unramified locus; localized étale assembly remains a target here. |
| All conjugates | `TauCeti/RingTheory/Cyclotomic/Lift.lean:225` and `:385` | Residue tuple and lift retain every conjugate, with prime and primitive-root hypotheses. |
| QWittVectors head | `TauCetiRoadmap/QWittVectors/README.md` §§2.3–2.4, 4.1–6.3 | Perfection, faithful-flat conditions, relative ghosts, pushouts and completed Frobenius are prose contracts; old claimed export names are absent. |
| Gaussian suppliers | `TauCetiRoadmap/ArithmeticStatisticsPartIV/README.md` §3.2; supplied `TauCetiRoadmap/QSeriesPartitionsAndMockModularForms/README.md` §3.1 | Polynomial/product laws and integral denominator-clearing identity exist at these locators; both disputed Gaussian export names are absent from the latter head. |
| Classical completion | `TauCetiRoadmap/HabiroCyclotomicCompletions/README.md` §§1.1, 1.4, 2.3, 3.1, 3.3, 4.1, 4.3, 5.1, 5.3 | Every HC.n replacement points to the corresponding factorial, Laurent, Taylor, intersection, rigidity or module/localization statement. |
| Enhanced categories | `TauCetiRoadmap/BordismFormalGroups/README.md` F6.5; `TauCetiRoadmap/GeneralizedCohomology/README.md` G2.1–G2.7; `TauCetiRoadmap/EnhancedDerivedSheaves/README.md` E2:towers, E5:abstract.2–3, E5:spectra-comparison | Coherent limits, spectra, algebra/module objects and monoidal localization have these owners. |
| Derived modules | `TauCetiRoadmap/DerivedModuleAlgebra/README.md` §§1.1–1.5 | Tower, Hom, completion, Nakayama and regular-sequence/bounded-torsion comparisons retain their hypotheses. |
| Ordinary rigidity | `TauCetiRoadmap/SchemeAndStackFoundations/README.md` §0.23a | Universal-homeomorphism étale equivalence is imported and adapted through affine markings. |
| K-theory label | `TauCetiRoadmap/StableHomotopyKTheory/README.md` §5.18 and Layer 6 | The former delegates ambient spectra; the latter assembles K-theory. Neither is the generic solid tensor input. |
| Radical calculation | W line 305; Q line 601 | Integral pair intersections reduce to characteristic p; completion uses radicals, including after nonreduced coefficient extension. |
| Resolution sign | Q line 3592; Q line 3599 | The resolution exists, but the printed cumulative coefficient fails augmentation; adjacent 1−qⁱ⁺¹ is required. |
| Profiles | Q line 3713 | Radial properness alone gives separable proper lower profiles. |
| Line exclusions | G line 255; G line 426 | Discriminant inversion and exclusion of 2,3 are separate restrictions. |
| Obstruction | W line 1739; W line 1747; W line 1768 | Prime-divisor reduction, normalized ghosts and injectivity are separate inputs to the cubic application. |
| Solid boundary | Q line 3643; Q line 3666; T line 3797; T line 3832 | These locate ambient solid spectra and the stated bounded comparison; the larger tower/resolution contract remains a registered gap. |

The main-roadmap shapes read before editing were DerivedModuleAlgebra and GeneralizedCohomology. Their mathematical scope/ownership and dependency organization were retained; no layer was reorganized.

Every one of the 17 named declarations, including the local scalar instance, was put under `#check @name` in one scratch module and elaborated in a single run. All types were compared to the README. No standing binder was lost. In particular:

| Declarations | Elaborated binders or carriers retained |
| --- | --- |
| `EtaleDeformation.exists_lift` | Arbitrary commutative B, ideal I, étale D/B/I; lift in the maximum universe. |
| `CompletedEtaleLift.mapUnique` | Étale E/B, I.FG, complete separated C for the extended ideal; actual reduced map g. |
| `LaurentLocalization.Coeff`, `.factor`, `.denominators`, `.factorial` | Actual integral Laurent ring, ℕ-indexed positive factors, submonoid and its elements. |
| `LaurentLocalization.augmentation`, `.differential`, `.free_resolution` | Native free modules, native localization, linear kernel/range and both endpoint exactness assertions. |
| `OrdinaryDerivedComparison.laurent_regular` | Arbitrary commutative R and arbitrary R-module M; explicit m>0. |
| `CountableSolidHabiroTensor.separable_weights` | Explicit radial properness; both separate Tendsto assertions and the pointwise lower inequality. |
| `CyclotomicIndex.primeChain`, `.vertices`, `.height_one` | Total definitions; m>0 and all three memberships and both subset inclusions in the theorem. |
| `etale_localization_away_of_prime_dvd` | Field, NumberField, nonzero Δ, every discriminant-prime exclusion and actual localization instance. |
| `completedLineCoeffAlgebra`, `completedRegulatorTriviality` | Arbitrary commutative R, actual invertible P over R[[X]], actual quotient equivalence, constant-coefficient scalar action. |

## Computed adversarial pass

The following tables give values, rather than claiming that successful elaboration proves truth. Spectral and arithmetic calculations are conditional on the explicit supplier contracts. The zero ring is allowed; no arithmetic prime is silently excluded. Nonabelian groups, inseparable field extensions, geometric fans and cardinality-unbounded moduli do not occur in these statements. Empty covers and indexing sets, nonreduced coefficients, total-function junk values, characteristic two, variable orientation and missing completeness do occur and are tested explicitly.

API row numbers below refer to bullets in the named README subsection, in their existing order. A row is a separate mathematical law; common examples test distinct outputs of that law. The following sign values are used throughout: P₀=1, P₁=1−q, P₂=1−q−q²+q³; at q=2 these are 1,−1,3, and P₃=−21. All displayed scalar computations take place only after legitimate specialization; fractions at q=1 or q=−1 are not evaluated.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: positive indices | m=0,1,2 | f₀=0, f₁=q−1, f₂=q²−1; P₀=1; m=0 excluded from regularity | Consistent | None |
| Conventions: torsion-free coefficients | ℤ; 𝔽₂; zero ring | 2·1=2≠0 in ℤ; 2·1=0 in 𝔽₂; 0→0 injective | Consistent | None |
| Conventions: Adams versus exterior operations | toric ℤ[t], a=t; λ-line | ψ₂(t)=t², ψ₃(t)=t³; λ²(t)=0=−c₂(t) | Consistent | None |
| Conventions: right twisted base action | A=R=ℤ[t], m=2 | a⊗b↦ψ₂(a)b sends t⊗1 to t² and 1⊗t to t | Consistent | None |
| Conventions: derived quotient | M=𝔽₂, q=1 | π₀(M/(q−1))=𝔽₂ and π₁=𝔽₂; ordinary quotient has only π₀ | Consistent | None |
| Conventions: divisibility direction | m=2,n=6; n=3 | q⁶−1=(q²−1)(q⁴+q²+1); remainder of q³−1 mod q²−1 is q−1 | Consistent | None |
| Conventions: completed versus localized | M=R_r and M=ℤ with q=1 | L_H(R_r)=0; L_H(ℤ)=ℤ; localization sends the latter to 0 | Consistent | None |
| Conventions: spherical carrier | sphere and Hℤ | π₀=ℤ in both; π₁=ℤ/2 for sphere, 0 for Hℤ | Consistent | None |
| Conventions: homotopy bound | 𝕊; Σ⁻ⁿ𝕊 for all n | sphere has π_k=0 for k<0; Σ⁻ⁿ𝕊 has π_−n=ℤ, with no uniform lower bound | Consistent | None |
| Conventions: X=q−1 | q,q² | q↦1+X; q²↦1+2X+X²; linear sign is + | Consistent | None |
| QWitt supplier: perfection | ℤ; toric ℤ[t] | ℤ^perf=ℤ; t has no ψ₂-preimage in ℤ[t], but t^(1/2) maps to t in perfection | Consistent | None |
| QWitt supplier: perfect coverage | toric ℤ[t], ψ₂ | basis {1,t} over ℤ[t²]; rank 2, faithful and flat, despite nonsurjectivity | Consistent | None |
| QWitt supplier: prime-generated ideal | m=1,2,6 | 0≠(q−1); sole m=2 generator 1+q; for m=6, (1+q²+q⁴)−q(1+q³)=q²−q+1 | Consistent | None |
| QWitt supplier: absolute versus relative | A=ℤ[t], m=2 | relative self-ring contains t; absolute image at q=−1 is ℤ[t²] and excludes t | Consistent | None |
| QWitt supplier: completed Frobenius | R=ℤ[i][1/2], p=3,5,2 | φ₃(i)=−i, φ₅(i)=i, and R̂₂=0 | Consistent | None |
| QWitt supplier: Frobenius versus restriction | m=2→1 | F₁st-stage is evaluation at q=1; a map ℤ[q]/(q+1)→ℤ with q=1 would force 2=0 | Consistent | None |
| Habiro supplier: factorial tower | M=ℤ, q=1; M=R_r | first is fixed; second has all quotients 0 and completion 0, although 1≠0 in R_r | Consistent | None |
| Habiro supplier: derived cyclotomic detection | M=ℤ, q=1 | M is static but M/(q−1) has π₁=ℤ; converse staticity inference fails | Consistent | None |
| Habiro supplier: finite reconstruction | m=1,4,6 | m=1 one vertex; {1,4} has radical (2,q−1); {1,6} gives unit ideal since Φ₆(1)=1 | Consistent | None |
| Habiro supplier: rational fracture completion | t=q²−1, E=ℤ[q]^∧_t | tⁿ/2ⁿ has unbounded denominators; lies in (E[1/2])^∧_t, not E[1/2] | Consistent | None |
| Habiro supplier: marked lifts and staticity | R=0; R=ℤ[1/2], m=1 | zero lifts to 0; nonzero lift is ℤ[1/2][[X]], containing Xⁿ/2ⁿ; static quotient alone has an extra π₁ after derived reduction | Consistent | None |
| Solid supplier: Null and shift | zero spectrum; one sphere coefficient | internal Hom into 0 is 0, so 1−σ* is invertible on 0; Null^■ has countably many sphere factors | Consistent | None |
| Solid supplier: product tensor | one-coordinate projections | e_i⊗e_j projects to 1 in coordinate (i,j) and 0 in the other coordinates | Consistent | None |
| Solid supplier: countable/ω₁ distinction | profiles f_k(n)=max(n−k,0) | common lower profile would have g(n)≤f_n(n)=0; countable subsets instead have countable union | Consistent | None |
| Solid supplier: null families | singleton blocks | constant 1 has infinitely many nonzero residues mod P₁; P_n has residue 0 for n≥1 | Consistent | None |
| Number-field supplier: separate exclusions | F=ℚ(i), Δ=12 | 12 mod 6=0, 12 mod 4=0, 12 mod 24=12; localization is ℤ[i][1/6] | Consistent | None |
| Number-field supplier: integral evaluator | trivial line; zero evaluator | e(1)=1 gives a generator; zero map gives 0≠1 over ℤ | Consistent | None |
| §0.1 API 1: Marked datum | B=ℤ,I=(2),E=ℤ | E/IE=𝔽₂ and ε=id | Consistent under stated hypotheses | Prose label only |
| §0.1 API 2: Carrier étaleness | E=B=ℤ | identity Jacobian determinant=1 | Consistent under stated hypotheses | Prose label only |
| §0.1 API 3: Reduced étaleness | unit over ℤ/(2) | reduction is id:𝔽₂→𝔽₂ | Consistent under stated hypotheses | Prose label only |
| §0.1 API 4: Marking transport | split product, swap | carrier (1,0) unchanged; marking sends it to (0,1) | Consistent under stated hypotheses | Prose label only |
| §0.1 API 5: Conjugated reduction | g=id, target marking swapped | ε′gε⁻¹(1,0)=(0,1) | Consistent under stated hypotheses | Prose label only |
| §0.1 API 6: Reduced identity | same marking | ε·id·ε⁻¹(1,0)=(1,0) | Consistent under stated hypotheses | Prose label only |
| §0.1 API 7: Reduced composition | two split swaps | swap(swap(1,0))=(1,0) | Consistent under stated hypotheses | Prose label only |
| §0.1 API 8: Unit deformation | I=0 and I=B | reductions B and 0, respectively | Consistent under stated hypotheses | Prose label only |
| §0.1 API 9: Split deformation | x²−x=0 over 𝔽₂ | (2x−1)²=1; x↦(0,1), a+(b−a)x↦(a,b) | Consistent under stated hypotheses | Prose label only |
| §0.1 API 10: Localization deformation | a=2,0,1 in ℤ | ℤ[1/2], 0, ℤ; rational rank of first=1 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 1: Completion ring | E=ℤ[t], I=(t) | (1+t)+(1−t)=2 and (1+t)(1−t)=1−t² in ℤ[[t]] | Consistent under stated hypotheses | Prose label only |
| §0.4 API 2: Completion B-action | t and 3 | t↦t, 3↦3 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 3: Completion unit | 1+t∈E | maps to the series with coefficients (1,1,0,…) | Consistent under stated hypotheses | Prose label only |
| §0.4 API 4: Completeness | I=0; I=E | limits E and 0 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 5: Quotient markings | n=1,2 for ℤ[[t]] | quotients ℤ and ℤ[t]/(t²), with coefficients (a₀) and (a₀,a₁) | Consistent under stated hypotheses | Prose label only |
| §0.4 API 6: Reduced unit | input 3+t | reduced value 3 on both paths | Consistent under stated hypotheses | Prose label only |
| §0.4 API 7: Completed hom bijection | E=B, C=ℤ[[t]] | one map on each side; 3↦3 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 8: Lifted map | split swap | (1,0)↦(0,1) before and after reduction | Consistent under stated hypotheses | Prose label only |
| §0.4 API 9: Reduction of lifted map | split swap | reduced output (0,1) | Consistent under stated hypotheses | Prose label only |
| §0.4 API 10: Lifted identity | input (1,0) | output (1,0) | Consistent under stated hypotheses | Prose label only |
| §0.4 API 11: Lifted composition | two swaps | output (1,0) on both sides | Consistent under stated hypotheses | Prose label only |
| §0.4 API 12: Marked equivalence | B and B[1/(1−t)] | completed inverse of 1−t is Σtⁿ; product=1 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 13: Equivalence marking | input 1−t | both reduced values=1 | Consistent under stated hypotheses | Prose label only |
| §0.4 API 14: Comparison transitivity | three copies of ℤ[[t]] | id∘id sends 3+t to 3+t, as does direct comparison | Consistent under stated hypotheses | Prose label only |
| §1.1 API 1: Pair object | (ℤ,ℤ[i][1/2]) | 2 inverted; discriminant −4 becomes a unit | Consistent under stated hypotheses | Prose label only |
| §1.1 API 2: Pair morphism | conjugation, base id | g(3)=3=ι(id(3)); g(i)=−i | Consistent under stated hypotheses | Prose label only |
| §1.1 API 3: Pair category | conjugation twice | i↦−i↦i; composite=id | Consistent under stated hypotheses | Prose label only |
| §1.1 API 4: Base component | conjugation pair | base sends 3 to 3 | Consistent under stated hypotheses | Prose label only |
| §1.1 API 5: Algebra component | conjugation pair | i↦−i | Consistent under stated hypotheses | Prose label only |
| §1.1 API 6: Forgetful functor | conjugation twice | forgotten composite=id_ℤ | Consistent under stated hypotheses | Prose label only |
| §1.1 API 7: Pair base change | ℤ→ℤ[t], R=ℤ[i][1/2] | R⊗ℤ[t]=ℤ[t,i][1/2]; t↦t, i↦i | Consistent under stated hypotheses | Prose label only |
| §2.1 API 1: Rational localization | positive indices 1,2 | (1−q) and (1−q²) become units; index 0 would invert 0 | Consistent under stated hypotheses | Prose label only |
| §2.1 API 2: Cyclotomic localization | m=2 | q²−1=(q−1)(q+1); both factors become units | Consistent under stated hypotheses | Prose label only |
| §2.1 API 3: Completeness predicate | M=ℤ,q=1; M=R_r | RHom(R_r,ℤ)=0; RHom(R_r,R_r) contains id(1)=1 | Consistent under stated hypotheses | Prose label only |
| §2.1 API 4: Laurent comparison | second factorial quotient | q(1+q−q²)−1=−P₂; modulo P₂ the product is 1 | Consistent under stated hypotheses | Prose label only |
| §2.1 API 5: Scalar restriction | A=𝔽₂,M=𝔽₂,q=1 | both derived q−1 quotients have π₀=π₁=𝔽₂ | Consistent under stated hypotheses | Prose label only |
| §2.1 API 6: Adic implies Habiro | ℤ[[q−1]] | q−1 complete; localization has (q−1) invertible; Hom obstruction=0 | Consistent under stated hypotheses | Prose label only |
| §2.1 API 7: Limit/fibre/shift closure | zero map ℤ→ℤ, q=1 | fibre=ℤ⊕Σ⁻¹ℤ, with both groups still complete | Consistent under stated hypotheses | Prose label only |
| §2.1 API 8: Kernel of reflection | M=R_r | L_HM=0; fibre of M→0 is M | Consistent under stated hypotheses | Prose label only |
| §2.1 API 9: HZ-relative comparison | M=Hℤ,q=1 | completion fixes M, with π₀=ℤ and π₁=0 on both sides | Consistent under stated hypotheses | Prose label only |
| §2.4 API 1: Laurent regularity | 𝔽₂, m=2, x=1; m=0 | (q²−1)·1=q²+1≠0; zero factor at m=0 kills 1 | Consistent under stated hypotheses | Prose label only |
| §2.4 API 2: Ordinary/derived comparison | M=𝔽₂, n=1,2 | quotient dimensions=1,3; higher homotopy=0 | Consistent under stated hypotheses | Prose label only |
| §2.4 API 3: Homotopy of comparison | M=0; M=𝔽₂ | zero on all degrees for M=0; π₁=0 for the polynomial coefficient completion | Consistent under stated hypotheses | Prose label only |
| §2.4 API 4: Finite projections | q² at n=1 | q² maps to 1 in both ordinary and derived P₁ quotient | Consistent under stated hypotheses | Prose label only |
| §2.4 API 5: Coefficient naturality | ℤ→𝔽₂, element 3 | both projection/reduction composites give 1 | Consistent under stated hypotheses | Prose label only |
| §2.5 API 1: Completed tensor base change | identity; ℤ→ℤ[t] | identity gives H; polynomial extension gives ΣP_n tⁿ in completed target, outside H[t] | Consistent under stated hypotheses | Prose label only |
| §2.6 API 1: Spherical localization algebra | π₀ generator q | q maps to the invertible Laurent generator; 1 maps to 1 | Consistent under stated hypotheses | Prose label only |
| §2.6 API 2: Localization mapping property | target T; q=1 target | identity map on T; q=1 would force 0 invertible and hence zero target | Consistent under stated hypotheses | Prose label only |
| §2.6 API 3: Positive factors invertible | m=1,2 | (q−1)/(q−1)=1 and (q²−1)/(q²−1)=1 | Consistent under stated hypotheses | Prose label only |
| §2.6 API 4: Localization idempotence | 1⊗1 and q⊗1 | multiply to 1 and q, respectively | Consistent under stated hypotheses | Prose label only |
| §2.6 API 5: Localization fibre transition | P₁→P₂, q=2 | transition factor=−3; P₁·(−3)=(−1)(−3)=3=P₂ | Consistent under stated hypotheses | Prose label only |
| §2.6 API 6: Localized homotopy | π₀ and π₁ of sphere Laurent ring | π₀=R_r; π₁=𝔽₂[q±1,(1−qⁱ)⁻¹], nonzero, unlike H(R_r) | Consistent under stated hypotheses | Prose label only |
| §2.7 API 1: Spectral reflection | M=0 and M=T | both reflected objects=0 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 2: Factorial formula | M=Hℤ,q=1 | quotient has π₀=π₁=ℤ; transition on π₁ is 0, so inverse limit gives only Hℤ | Consistent under stated hypotheses | Prose label only |
| §2.7 API 3: Reflection adjunction | M=N=Hℤ,q=1 | id maps to id; value on 1 is 1 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 4: Reflection idempotence | M=Hℤ,q=1 | both units act as 1↦1 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 5: Completed tensor unit | SH⊗̂SH | multiplication sends 1⊗1 to 1 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 6: Homotopy short exact sequence | M=Hℤ,q=1 | Hom and Ext¹ obstruction terms=0, so π_kRHom(T,M)=0 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 7: Homotopy criterion | M=Hℤ; M=T | first complete; π₀(T)=R_r fails because Hom(R_r,R_r) contains 1 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 8: Cyclotomic detection | M=0; M=Hℤ,q=1 | all reductions of 0=0; nonzero example has π₀(M/Φ₁)=ℤ | Consistent under stated hypotheses | Prose label only |
| §2.7 API 9: Degree detection | M=ΣHℤ,q=1,k=1 | π₁(M/Φ₁)=ℤ, so vanishing hypothesis fails for its nonzero group | Consistent under stated hypotheses | Prose label only |
| §2.7 API 10: Eilenberg–Mac Lane restriction | Hℤ,q=1 | π₀=ℤ, π₁=0 in both completed models | Consistent under stated hypotheses | Prose label only |
| §2.7 API 11: Reflection on maps | multiply by 2 on Hℤ,q=1 | 3↦6 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 12: Reflection identity | same M | 3↦3 | Consistent under stated hypotheses | Prose label only |
| §2.7 API 13: Reflection composition | multiply by 2 then 3 | 1↦6 on both paths | Consistent under stated hypotheses | Prose label only |
| §2.7 API 14: Unit naturality | multiply by 2 | both paths send 3 to 6 | Consistent under stated hypotheses | Prose label only |
| §2.8 API 1: Solid completeness | M=Hℤ,q=1 | localization orthogonality gives 0 internal Hom | Consistent under stated hypotheses | Prose label only |
| §2.8 API 2: Solid quotient tower | M=Hℤ,q=1 | π₀ tower constant ℤ; extra π₁ transition=0; limit=M | Consistent under stated hypotheses | Prose label only |
| §2.8 API 3: Completed discrete embedding | M=0; M=Hℤ,q=1 | outputs 0 and discrete Hℤ | Consistent under stated hypotheses | Prose label only |
| §2.8 API 4: Full faithfulness | M=Hℤ,q=1 | identity corresponds to multiplication by 1 on both sides | Consistent under stated hypotheses | Prose label only |
| §2.8 API 5: Point evaluation | M=Hℤ,q=1 | π₀ of evaluation=ℤ, π₁=0 | Consistent under stated hypotheses | Prose label only |
| §2.9 API 1: Solid unit idempotence | mod P₁ and mod P₂ | finite quotient ranks=1 and 3; multiplication sends 1⊗1 to 1 | Consistent under stated hypotheses | Prose label only |
| §2.10 API 1: Completed block object | all blocks empty; one singleton block | C=0; C=SH | Consistent under stated hypotheses | Prose label only |
| §2.10 API 2: Factorial fibre J_r | r=0,1,2 on π₀ | J₀=H; J₁=(1−q)H; J₂=P₂H | Consistent under stated hypotheses | Prose label only |
| §2.10 API 3: Null-family formula | singleton blocks | constant residues=1 infinitely often; weighted P_n residues=0 for n≥1 | Consistent under stated hypotheses | Prose label only |
| §2.10 API 4: Block injection | single nonempty block, generator 1 | 1↦1 in SH | Consistent under stated hypotheses | Prose label only |
| §2.10 API 5: Mapping property | single block, target SH | multiplication by 3 corresponds to value 3 | Consistent under stated hypotheses | Prose label only |
| §2.10 API 6: Completeness of C | single block; empty blocks | C=SH; C=0; RHom(T,C)=0 in both cases | Consistent under stated hypotheses | Prose label only |
| §2.10 API 7: Profile transitions | f=n+1,g=n at q=2,n=1 | P₂=3 maps to 3 in ideal P₁H; ratio=−3; min(f,g)=g | Consistent under stated hypotheses | Prose label only |
| §2.10 API 8: Finite-support maps | one block, multiply by 2 | 1↦2 | Consistent under stated hypotheses | Prose label only |
| §2.10 API 9: Block-map identity | one block | 1↦1 | Consistent under stated hypotheses | Prose label only |
| §2.10 API 10: Block-map composition | multiply by 2 then 3 | 1↦6 on each side | Consistent under stated hypotheses | Prose label only |
| §2.10 API 11: Injection naturality | multiply by 2 on one block | both composites send 1 to 2 | Consistent under stated hypotheses | Prose label only |
| §2.11 API 1: Countable tensor comparison | one block and empty block | SH⊗SH=SH; SH⊗0=0 in the stated solid category | Consistent under stated hypotheses | Prose label only |
| §2.11 API 2: Separable weights | h=max, (m,n)=(3,5),(8,8) | floor halves give 1+2=3≤5 and 4+4=8≤8 | Consistent under stated hypotheses | Headline added |
| §2.11 API 3: Radial maximum | f(m)=m,g(n)=n, m+n≥2k | max(m,n)≥k; at (3,5) max=5 while sum=8 | Consistent under stated hypotheses | Prose label only |
| §2.12 API 1: Bounded completed-discrete tensor | M=N=SH; N=0 | both comparisons give SH and 0, respectively | Consistent under stated hypotheses | Prose label only |
| §2.12 API 2: Bounded monoidality | unit, pair SH and ΣSH | unit sends 1⊗1 to 1; tensor is ΣSH | Consistent under stated hypotheses | Prose label only |
| §2.12 API 3: Bounded tensor closure | SH and ΣSH | tensor ΣSH has no homotopy below 1; unbounded shifts Σ⁻ⁿSH have no common lower bound | Consistent under stated hypotheses | Prose label only |
| §3.2 API 1: Prime-chain definition | (4,1,2),(1,3,2),(0,1,2),(4,0,2),(4,3,0) | {1,2,4}; {3}; {1}; {0}; {3} | Consistent under stated hypotheses | Definition retained; boundary padding deleted |
| §3.2 API 2: Vertex definition | m=0,1,4,6,12 | cardinalities 0,1,4,8,11 | Consistent under stated hypotheses | Definition retained; boundary padding deleted |
| §3.2 API 3: Vertex membership equivalence | m=4 | {1,2,4} belongs; {1,4} does not | Consistent under stated hypotheses | Prose label only |
| §3.2 API 4: Vertex divisor containment | m=12, chain {3,6,12} | 12/3=4,12/6=2,12/12=1 | Consistent under stated hypotheses | Prose label only |
| §3.2 API 5: Nonempty vertices | m=1, m=0 | unique vertex {1}; no vertices at 0, so universal assertion vacuous there | Consistent under stated hypotheses | Prose label only |
| §3.2 API 6: Subset order | m=2, singleton vertices | neither {1}⊆{2} nor {2}⊆{1}; {1}⊆{1,2} | Consistent under stated hypotheses | Prose label only |
| §3.2 API 7: Poset nerve | m=4 | only strict arrows singleton→{1,2,4}; no strict composable pair | Consistent under stated hypotheses | Prose label only |
| §3.5 API 1: Localization datum | singleton identity cover | L²(x)=x=L(x); unit=id_x | Consistent under stated hypotheses | Prose label only |
| §3.5 API 2: Coherent overlaps | two repeated identity covers | all four overlap localizations=id, all unit composites=id | Consistent under stated hypotheses | Prose label only |
| §3.5 API 3: Restriction functor | repeated identity cover | x↦(x,x,id); tensor unit↦(1,1,id) | Consistent under stated hypotheses | Prose label only |
| §3.5 API 4: Reconstruction | same cover | limit of x→x←x with identity comparisons=x | Consistent under stated hypotheses | Prose label only |
| §3.5 API 5: Mapping spaces | singleton identity cover | mapping homotopy limit=Map(x,y) | Consistent under stated hypotheses | Prose label only |
| §3.5 API 6: Commutative algebras | singleton identity cover | restricted algebra A reconstructs as A, with 1↦1 | Consistent under stated hypotheses | Prose label only |
| §3.5 API 7: Refinement coherence | one identity cover refined by two copies | x↦(x,x,id)↦x; composite=id | Consistent under stated hypotheses | Prose label only |
| §3.5 API 8: Finite-refinement sheaf | empty cover; singleton identity | empty conservative family forces D=0; singleton descent sends x to x | Consistent under stated hypotheses | Prose label only |
| §3.6 API 1: Prime-edge mapping equalizer | m=1 and m=2, identity edge | m=1: W is point and equalizer=V; m=2 both images of identity are identity | Consistent under stated hypotheses | Prose label only |
| §4.1 API 1: Marked finite stage | m=1,R=ℤ[1/2] | stage=ℤ[1/2][[X]], reduction at X=0 is ℤ[1/2] | Consistent under stated hypotheses | Prose label only |
| §4.1 API 2: Stage map of pairs | base ℤ→ℤ[t], R=ℤ | q↦q; at m=1, X↦X and 3↦3 | Consistent under stated hypotheses | Prose label only |
| §4.1 API 3: Stage equivalence for pair isomorphism | split swap | (1,0)↦(0,1) and back to (1,0) | Consistent under stated hypotheses | Prose label only |
| §4.1 API 4: Self-stage comparison | A=ℤ,m=2 | stage ℤ[q]^∧_(q²−1), quotient free rank 2 over ℤ | Consistent under stated hypotheses | Prose label only |
| §5.1 API 1: Ordinary relative limit | A=R=ℤ; R=0 | classical inverse-limit ring; zero ring | Consistent under stated hypotheses | Prose label only |
| §5.1 API 2: Limit projections | polynomial q | π_m(q)=q in every stage; at m=1, q=1+X | Consistent under stated hypotheses | Prose label only |
| §5.1 API 3: Extensionality | q versus 0 | first-stage projections differ by 1+X≠0 | Consistent under stated hypotheses | Prose label only |
| §5.1 API 4: Limit lifting property | maps ℤ[q]→all stages | q lifts to q; projection of lift again q | Consistent under stated hypotheses | Prose label only |
| §5.1 API 5: Factorial cofinality | indices 2,3 | 2 divides 2!; 3 divides 3!=6; both selected projections retain q | Consistent under stated hypotheses | Prose label only |
| §5.1 API 6: Partial completion | m=1, A=R=ℤ | completed target ℤ[[X]], q↦1+X | Consistent under stated hypotheses | Prose label only |
| §5.1 API 7: Cyclotomic completion | m=4,R=ℤ[i][1/2] | full coefficient algebra R⊗ℤ[i]=R×R, two Taylor factors | Consistent under stated hypotheses | Prose label only |
| §5.1 API 8: Regular quotient and Frobenius | A=R=ℤ,m=2→1 | quotient ℤ[q]/(q²−1), rank 2; Frobenius sends q to 1 | Consistent under stated hypotheses | Prose label only |
| §5.1 API 9: Ring functor on pairs | ℤ→ℤ[1/2] | q maps to q under identity and composites; 2 maps to 2 | Consistent under stated hypotheses | Prose label only |
| §5.2 API 1: Compatible root system | m=1,2,3,6 | ζ₁=1, ζ₂=−1, ζ₆=−ζ₃; coprime product holds | Consistent under stated hypotheses | Prose label only |
| §5.2 API 2: Standard compatible roots | m=1,4,6 | empty product=1; ζ₄=i; ζ₆=−exp(2πi/3) | Consistent under stated hypotheses | Prose label only |
| §5.2 API 3: Full coefficient algebra | R=ℤ[i][1/2],m=4 | e=(1−i⊗i)/2 has values (1,0) in R×R | Consistent under stated hypotheses | Prose label only |
| §5.2 API 4: Taylor factors | m=1; R=0 | T₁=R[[X]]; all factors zero for R=0 | Consistent under stated hypotheses | Prose label only |
| §5.2 API 5: Canonical coefficient map | p=2,m=1 | 3+X maps to 3+X over ℤ₂ | Consistent under stated hypotheses | Prose label only |
| §5.2 API 6: Frobenius/re-expansion map | p=2,m=1, input q+1 | Y=q+1 maps to X+2 | Consistent under stated hypotheses | Prose label only |
| §5.2 API 7: Taylor component | f=1−q³ at ζ₃ | constant=0, linear=−3ζ₃², quadratic=−3ζ₃, cubic=−1 | Consistent under stated hypotheses | Prose label only |
| §5.2 API 8: Topologically nilpotent shift | p=2,m=3; p=3,m=1 | ζ₃−ζ₆=2ζ₃; (1−ζ₃)²=−3ζ₃; both have positive prime valuation | Consistent under stated hypotheses | Prose label only |
| §5.2 API 9: Integral re-expansion comparison | p=2,m=1 | q+1 maps to X+2 in both formulas | Consistent under stated hypotheses | Prose label only |
| §5.2 API 10: Root relabelling/Galois comparison | m=4, conjugation | i↦−i swaps e=(1,0) and (0,1); realized action is nonidentity | Consistent under stated hypotheses | Prose label only |
| §5.6 API 1: Stage base change | identity; m=1,R=0 | identity stage comparison; zero stage | Consistent under stated hypotheses | Prose label only |
| §5.6 API 2: Completed ring base change | ℤ→ℤ[t] | ΣP_n(q)tⁿ occurs in completed target, with unbounded t-degrees | Consistent under stated hypotheses | Prose label only |
| §5.6 API 3: Flat base change | same polynomial extension | Tor_i=0 for i>0; H[t] still lacks that series | Consistent under stated hypotheses | Prose label only |
| §5.7 API 1: Classical ring comparison | A=R=ℤ | P₁=1−q, P₂=1−q−q²+q³ on both sides; q↦1+X at first root | Consistent under stated hypotheses | Prose label only |
| §5.8 API 1: Discriminant-multiple consequence | F=ℚ(i), Δ=4 | −4 divides 4; coefficient ring ℤ[i][1/2] | Consistent under stated hypotheses | Consequence kept only in README |
| §5.8 API 2: Prime-support étaleness | F=ℚ(i),Δ=2,1; F=ℚ,Δ=1 | first inverts the only bad prime 2; second fails; rational case is id_ℤ | Consistent under stated hypotheses | Prose label only |
| §5.9 API 1: Number-field ring equivalence | F=ℚ,Δ=1; F=ℚ(i),Δ=12 | classical ring in first case; full order-four coefficient algebra R×R in second | Consistent under stated hypotheses | Prose label only |
| §6.1 API 1: Completed scalar extension | M=H; M=0 | pullbacks H′ and 0 | Consistent under stated hypotheses | Prose label only |
| §6.1 API 2: Scalar adjunction | M=H,N=H′ | identity corresponds to element 1 | Consistent under stated hypotheses | Prose label only |
| §6.1 API 3: Tensor/unit comparison | M=N=H | both sides H′; 1⊗1↦1 | Consistent under stated hypotheses | Prose label only |
| §6.1 API 4: Identity pullback | M=H | 1↦1 | Consistent under stated hypotheses | Prose label only |
| §6.1 API 5: Composite pullback | H→H′→H″, M=H | both tensor-associator paths send 1 to 1 | Consistent under stated hypotheses | Prose label only |
| §6.1 API 6: Perfect pullback | M=H⁰,H¹ | outputs 0,H′ without extra completion | Consistent under stated hypotheses | Prose label only |
| §6.1 API 7: Finite quotient pullback | ℤ→ℤ[1/2],m=2 | ℤ[1/2][q]/(q²−1)=ℤ[1/2]×ℤ[1/2] | Consistent under stated hypotheses | Prose label only |
| §6.1 API 8: Picard map | trivial line | [H] maps to [H′]=identity class | Consistent under stated hypotheses | Prose label only |
| §6.1 API 9: Picard/complete agreement | trivial line | both operations give actual invertible module H′ | Consistent under stated hypotheses | Prose label only |
| §6.2 API 1: Transported Picard character | ξ=0; ξ+(−ξ) | M₀=H; M_ξ⊗M_−ξ≃H under imported inverse pairing; classes add to 0 | Consistent under stated hypotheses | Separate divisibilities |
| §6.3 API 1: q−1 completion map | q,q²; inverted-2 component idempotent e₁ | 1+X, 1+2X+X²; c(e₁)=0 although e₁²=e₁≠0 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 1: Evaluator fixes underlying map | e=id; e=−id, input 3 | t(3)=3; t(3)=−3 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 2: Inverse of one | e=−id over ℤ | t⁻¹(1)=−1 and e(−1)=1 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 3: Normalized coordinates | e=−id, x=3 | e(3)·t⁻¹(1)=(−3)(−1)=3 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 4: Normalization uniqueness | rank-one trivial fibre | same underlying evaluation forces t(3)=e(3), value 3 or −3 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 5: Unit rescaling | u=−1, x=3 | new coordinate=−3=(−1)·3 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 6: Evaluator naturality | ℤ→𝔽₅, e=−id, x=3 | both paths give −3 mod 5=2 | Consistent under stated hypotheses | Prose label only |
| §6.4 API 7: Fibre trivialization | unit evaluator; negative; zero | preimages of 1 are 1 and −1; zero gives 0≠1 and fails hypothesis | Consistent under stated hypotheses | Prose label only |
| §6.5 API 1: Completed line triviality | R=ℤ,ℤ×ℤ,0; free P | bases 1 and 1+X reduce to 1; constant terms 1 and 1; at zero ring both modules=0 | Consistent under stated hypotheses | Prose label only |
| §6.6 API 1: Completed Picard vanishing | ξ=0; arbitrary ξ with supplied integral generator | trivial line has class 0; lifted first-fibre generator gives B≃P, so class=0 | Consistent under stated hypotheses | Prose label only |
| §6.7 API 1: Supported field comparison | identity; ℚ→ℚ(i),Δ=12,ξ=0 | identity sends 1 to 1; scalar extension of the unit line is the unit line, first-fibre value 1 | Consistent under stated hypotheses | Prose label only |
| §0.2 existence | I=0, I=B, and 𝔽₄ over ℤ/(2) | E=D at I=0; D=0 at I=B; discriminant −3 becomes a unit in ℤ[x]/(x²+x+1)[1/3] | Consistent | None |
| §0.2 nonuniqueness | B=ℤ[t], I=(t), D=ℤ | B and B[1/(1−t)] reduce to ℤ; 1−t unit only in second before completion | Consistent | None |
| §0.3 locally nilpotent rigidity | 𝔽₂[x_i]/(x_i²), I=(x_i) | each finite sum has square 0; product x₁⋯x_N survives for every N; split swap²=id | Consistent | None |
| §0.5 completed maps | B=E=ℤ,I=(2), C=𝔽₂ | one map ℤ₂→𝔽₂; reduction=id, but 2↦0 so original map not an isomorphism | Consistent | None |
| §0.5 missing completeness | C=ℤ,I=(2) | 3 has an inverse in ℤ₂; no integer x satisfies 3x=1 | Consistent | None |
| §0.6 principal universality | f=2 on ℤ; f=1; f=0 | lift ℤ₂ regular; unit-complete object 0; zero factor on nonzero static module gives π₁=M | Consistent | None |
| §1.1 negative Λ-map | t↦t+1 over ℤ[t] | fψ₂(t)=t²+2t+1, ψ₂f(t)=t²+1; difference 2t≠0 | Consistent | None |
| §2.1 Laurent cofiber | class q⁻¹ | q·q⁻¹=0 in Laurent/polynomial quotient; (q−1)(−q⁻¹)=q⁻¹ | Consistent | None |
| §2.1 power-series distinction | Φ₂ quotient | ℤ[[t]]/(t+2)=ℤ₂; integral Habiro quotient=ℤ | Consistent | None |
| §2.2 coefficient definition | q,q⁻¹,0 | q·q⁻¹=1; coefficient of q⁻¹ in q⁻¹ is 1; q⁻¹−1≠0 | Consistent | None |
| §2.2 positive factor definition | i=0,1,2 | 1−q,1−q²,1−q³; all nonzero; index-zero exponent would instead give 0 | Consistent | None |
| §2.2 denominator monoid | empty product; repeated factor; zero | 1 and (1−q)² belong; (1−q)² divides P₂ with quotient 1+q; 0 excluded | Consistent | None |
| §2.2 factorial definition | n=0,1,2,3; q=2 | 1,−1,3,−21 after specialization; recursion ratios −1,−3,−7 | Consistent | None |
| §2.2 augmentation definition | e₀,e₁,e₂ at q=2 | 1,−1,1/3; multiplying by P_i gives 1 in each case | Consistent | None |
| §2.2 differential definition | e₀,e₁,e₂ at q=2 | e₀+e₁, e₁+3e₂, e₂+7e₃; first occupied coefficient=1 | Consistent | None |
| §2.2 exact resolution | aug(d(e₀)), aug(d(e₁)), aug(d(e₂)) at q=2 | 1−1=0; −1+3/3=0; 1/3−7/21=0; cumulative-factor error at i=1 gives −2/3 | Consistent | None |
| §2.2 endpoint exactness | input 2e₁+3e₂; fraction 1/(1−q) | d input has first occupied coefficient 2; augmentation of e₁ is the requested fraction | Consistent | None |
| §2.5 Tor | q²−1 and q³−1 | π₀=ℤ, π₁=ℤ·(1+q); (q−1)(1+q)=q²−1=0 in the first quotient | Consistent | None |
| §2.5 non-smashing tensor | x transcendental over ℚ(q) in H | x⊗1−1⊗x maps to 0 under multiplication; in fraction fields the two rational-function variables remain independent | Consistent | None |
| §2.8 completed discrete sum | one singleton block per n | constant family has infinitely many 1 residues mod P₁; decaying family P_n has only its n=0 residue nonzero | Consistent | None |
| §2.9 quotient ranks | n=0,1,2 | degrees 0,1,3; positive quotient ranks 1,3, not n at n=2 | Consistent | None |
| §2.11 Gaussian direction | a=b=1,q=0,1,−1,2 | both products evaluate to 1,0,0,3; at −1, P₁²=4 while P₂=0, excluding reverse divisibility | Consistent | None |
| §2.11 empty Gaussian rectangle | a=0,b=2 | Gaussian quotient=1; P₀P₂=P₂, even at q=1 where both products vanish | Consistent | None |
| §2.11 separable profile proof | h=m+n; h=max; h=0 | f=m,g=n gives equality; half floors at (3,5) give 3≤5; h=0 fails k=1 properness | Consistent | None |
| §2.11 profile proof bounds | row and column minima a(m),b(n) | a(m)≤h(m,n), b(n)≤h(m,n); floor(a/2)+floor(b/2)≤h; m≥B_(2k) gives floor(a/2)≥k | Consistent | None |
| §3.1 integral radical | S={1,2} | (q−1,q+1)=(2,q−1); quotient=𝔽₂ is reduced | Consistent | None |
| §3.1 arbitrary-base radical | A=𝔽₂[ε]/(ε²),S={1,2} | I=(q−1); ε²=0 gives ε in both radicals; both radicals=(ε,q−1) | Consistent | None |
| §3.1 unit/nonunit intersections | S={1,6} and {1,4} | Φ₆(1)=1 yields unit ideal; Φ₄(1)=2 yields radical (2,q−1) | Consistent | None |
| §3.3 height one | m=1…160 | 5,122 nested triples, zero strict chains S⊊T⊊U; at m=4 the only strict arrows end in {1,2,4} | Consistent | None |
| §3.4 unique consecutive edge | m=12,(3,6),(6,12),(2,6) | first two in unique 2-chain {3,6,12}; last in unique 3-chain {2,6} | Consistent | None |
| §3.5 conservativity boundary | D≠0, every L_i=0 | nonzero x maps to 0, so joint conservativity fails; empty cover only permits D=0 | Consistent | None |
| §4.1 first and split stages | R=0; R=ℤ[1/2],m=2 | 0; product of q−1 and q+1 power-series factors, since 2 invertible makes overlap 0 | Consistent | None |
| §5.2 wrong conventional roots | ordinary exponential roots at 3 and 6 | difference −1 is a 2-adic unit; compatible roots instead have difference 2ζ₃ | Consistent | None |
| §5.2 value versus Taylor series | 1−q³ and 0 at ζ₃ | both values 0, but first has cubic Taylor coefficient −1 and second 0 | Consistent | None |
| §5.2 re-expansion convergence | Σ(q−1)^k expanded at ζ₃ | constant series Σ(ζ₃−1)^k; (1−ζ₃)²=−3ζ₃ gives convergence only in completed coefficient ring | Consistent | None |
| §5.3 all unramified factors | m=5,ℓ=11 | four roots 3,4,5,9; Φ₅ evaluates to 0 at each; degree ord₅(11)=1 | Consistent | None |
| §5.4 equalizer | classical q; R=0 | at p=2,m=1, can(1+X)=1+X and φ(Y−1)=X+2−1=1+X; zero equalizer=0 | Consistent | None |
| §5.5 untwisting | self-pair toric ℤ[t] | a⊗b↦ψ_m(a)b is inverse to a↦1⊗a; t⊗1=t^m on the right twist | Consistent | None |
| §5.6 flat toric series | ΣP_n(q)tⁿ | mod P₁ only n=0 term remains; t-degrees unbounded globally, so outside H[t] | Consistent | None |
| §6.2 line admissibility | F=ℚ(i),Δ=12 and Δ=4 | 12 meets 6 and −4 divisibilities; 4 meets ring condition but 6∤4 | Consistent | None |
| §6.3 kernel idempotent | R=ℤ[1/2], root-order valuation one | e₁²=e₁≠0; first Taylor component c(e₁)=0; e₁(1−e₁)=0 | Consistent | None |
| §6.4 negative normalization | H=R=M=ℤ | e(1⊗3)=−3; preimage of 1 is 1⊗(−1); zero evaluator gives 0 | Consistent | None |
| §6.5 Jacobson/Nakayama normalization | 1+X; R=ℤ×ℤ; R=0 | (1+X)Σ(−X)^n=1; constant (1,1) is a unit; zero ring gives unique zero module | Consistent | None |
| §6.7 field support | ℚ→ℚ(i),Δ=12 | 1∣12,−4∣12,6∣12; unit line and first-fibre generator both pull back to 1 | Consistent | None |
| §7.1 four Hensel lifts | 2786,7825,1963,2066 mod 11⁴ | Φ₅ values all 0 mod 14641; residues 3,4,5,9 in that order | Consistent | None |
| §7.2 prime-inversion components | p=2,orders 1,2,4,6 | v₂ values 0,1,2,1; odd-prime edges preserve these indices, deleted 2-edges separate them | Consistent | None |
| §7.3 cubic Frobenius | p=5, b²+3b+4=0 | quadratic discriminant 3∉{0,1,4}; b⁵=2+4b≠b, while linear root 3 is fixed | Consistent | None |
| §7.3 global endomorphism obstruction | α=∛2 real cubic | other two roots αζ₃,αζ₃² are nonreal; only α lies in F, so every endomorphism fixes α | Consistent | None |
| §7.4 finite-stage obstruction | R=ℤ,m=5; m=1 | forced φ₅(3)=3; no prime divides 1, so no implication about a chosen prime at m=1 | Consistent | None |
| §7.4 cubic corollary | R=ℤ[∛2][1/6],5 divides m | α globally fixed but b⁵=2+4b≠b in quadratic residue factor; no marked-variable isomorphism | Consistent | None |

The ledger has 233 rows. The finite computations are witnesses and negative controls; general proof inputs remain the targets and supplier sections named in the README.

## Required checks and gate outcomes

- Formatting checks: the report parser recognizes **19** finding sections; each review's original identifiers and severities match in order, and the coverage check reports **0** problems. README scans report **0** LaTeX-delimiter hits and **0** TeX-residue hits. Acceptance elaboration and the dependency command were rerun after these formatting repairs and returned the results below.
- Acceptance elaboration: `lake env lean` on `packages/HabiroRings/Suggested.lean`, run from the pinned content checkout, exited **0**. Output consisted of **eight** expected “declaration uses `sorry`” warnings, with no errors. No Tau Ceti import or targeted module build was necessary. The first development elaboration identified three definitions requiring `noncomputable`; they now have that modifier and real bodies. One preliminary invocation from the board checkout found no Lake configuration; the recorded acceptance result is from the required content checkout.
- Signature elaboration: one scratch file containing the acceptance declarations and `#check @name` for all **17** named declarations exited **0**, with the same eight expected warnings. Types were compared with the README individually; no hypothesis disappeared and no binder repair was required.
- Dependency command: the specified `gate --depcheck` with `--name HabiroRings`, the supplied order and `--movable` exited **0**, with exactly this output:

```text
depcheck: 21 roadmaps, 172 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. This output checks recognized roadmap directions; it does not discharge the unresolved supplier gaps.

- Citation resolution: after removal of undeclared local names, the resolver reports **no Lean names found nowhere**. Its sole unresolved cross-roadmap lead is HabiroCohomologyFoundations §0.3, already covered by gap:etale-habiro-coefficients and b/F02. The resolver cannot scan pinned Lake packages in its own environment; the pinned-file and elaboration checks above were therefore performed directly.
- Independent finite calculations: orders 1 through 160 gave **5,122** nested vertex triples and no strict two-arrow chain; all stated total-function boundary values were recomputed. The Gaussian values at q=0,1,−1,2 were respectively 1,0,0,3 on both sides. All four stated Hensel roots have Φ₅ value 0 modulo 11⁴. The cubic quadratic root satisfies b⁵=2+4b≠b modulo 5.
- Whitespace and scope: `git diff --check` passes. Edited only the permitted README, acceptance file and source manifest, together with this required report; `metadata.toml` and the plan are unchanged. The ten plan gaps and ten README gap lines still agree by slug, supplier and section. No source file was placed in the repository. No commit, push or external message was made.

The two formatting gate failures are repaired: report headings now use the original Fnn identifiers under separate review labels, and README §2.2 writes the Laurent coefficient ring as ℤ[q,q⁻¹] rather than using an unprotected TeX exponent. The mathematical statements and verdicts are unchanged. The review's dependency failure was repaired by deleting the family-order sentence (b/F04); the declaration-catalogue/name failures were repaired under a/F03, a/F08 and b/F05–F06. No tooling or merge-order file changed.

## Maintainer consequences

The light solid spectral contract, the three HabiroCohomologyFoundations contracts and the four HabiroNumberFields contracts remain explicitly conditional. Findings b/F01–F03 require human resolution of the re-raised decisions and, where appropriate, an accessible supplier head. Their existence in the order alone does not certify the mathematical interfaces. The two remaining gaps concern cross-base completed-Frobenius naturality and the cyclotomic prime-generated ideal. None has been silently discharged.

The deleted named declarations are `EtaleDeformation.reduceMap`, `OrderOneFibre.trivialization`, `OrderOneFibre.zeroEvaluation` and `etale_localization_away_discr`. The first three are prose API/Checks, not acceptance signatures. Consumers citing the last name, including the RefinedTraceMethods citation identified by the review, should use `etale_localization_away_of_prime_dvd` and the transitivity of integer divisibility. This package cannot update those consumers.

The new headline names are `LaurentLocalization.free_resolution` and `CountableSolidHabiroTensor.separable_weights`; the six Laurent definitions exist solely to state the first theorem. README-only mathematical targets keep their content but no longer claim undeclared Lean names. The line construction now accepts Δ=12 for ℚ(i); the scalar criterion and general ring comparison retain their original discriminant-support generality. Fresh independent mathematical review remains necessary.
