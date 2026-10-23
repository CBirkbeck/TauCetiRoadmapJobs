# PORT-HabiroRings

Branch: `roadmap/habiro-rings`.
Head commit: `bb5d6cb4a916d314e7a7fc591a0fe50c1b75b7d5`.
Base: `a07e202`; the checkout was clean before branch creation.

The commit contains only `TauCetiRoadmap/HabiroRings/README.md`, `TauCetiRoadmap/HabiroRings/Suggested.lean`, and `TauCetiRoadmap/HabiroRings/metadata.toml`. Nothing was pushed and no GitHub write was made.

## Validation

Build outcome, verbatim:

```text
Build completed successfully (8976 jobs).
```

There are **8 warnings**, all “declaration uses `sorry`”; zero errors and zero other warnings. The accepted review's seven-warning count does not match this package's eight admitted theorems. The port retains all eight, with unchanged signatures.

Gate summary, verbatim:

```text
gate HabiroRings: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

Dependency-order output, verbatim:

```text
depcheck: 22 roadmaps, 186 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or moved line. No tooling or merge-order file was changed.

All 17 named declarations, including the local scalar instance, were put under `#check @name` in one scratch module and elaborated successfully. Each elaborated type was compared with its README specification. No binder was dropped and no signature repair was necessary: arbitrary B,I,D for lifting; I.FG and ordinary completeness of C for completed maps; m>0 for Laurent regularity; radial properness and both Tendsto conclusions for profiles; all memberships and inclusions for height one; nonzero Δ and discriminant-prime support for étaleness; and invertibility plus an actual constant-coefficient quotient equivalence for completed lines. The local instance explicitly retains `{R} [CommRing R]`.

A separate pin check elaborated 66 cited Mathlib names successfully, with no warnings. Both cited Tau Ceti names were inspected at the pinned source, including their prime, nonzero-order and primitive-root hypotheses. No Tau Ceti declaration is used by a retained signature, so the module correctly has only `import Mathlib`.

All 55 local fragment links resolve. Metadata is exactly `topic = "math.NT"`. Whitespace and folder-boundary checks pass.

## Draft pull request body

Build the ordinary arithmetic theory of relative Habiro rings over perfectly covered Λ-rings with étale coefficients, including their full Frobenius-twisted Taylor presentation, completed base change, and classical and number-field comparisons. Develop the general marked étale-deformation and finite monoidal-localization descent interfaces, spherical and conditional solid completed scalars, and transport of the number-field lines to their integral first fibers and completed Picard classes.

AI assistance: Codex (GPT-6) ported the accepted package and performed the signature, source, ownership and mathematical checks described in the port report.

## Dependencies that are open roadmaps

The registry identifies these consumed roadmaps as new roadmap folders at their open heads: **ArithmeticStatisticsPartIV**, **VStackSheavesAndLisseCategories**, **HabiroCyclotomicCompletions**, **QWittVectors**, and **QSeriesPartitionsAndMockModularForms**. Citations to **SchemeAndStackFoundations**, **DerivedModuleAlgebra**, **EnhancedDerivedSheaves**, **BordismFormalGroups** and **GeneralizedCohomology** were checked on main, regardless of open revisions to those roadmaps.

**HabiroCohomologyFoundations** and **HabiroNumberFields** are earlier entries in the supplied merge order but have no accessible roadmap text in main, the supplied package collection, or the indexed open heads. They are accepted conditional contracts, not certified exported interfaces. **SolidAnalyticRings** likewise has no accessible owner or merge-order entry. These accepted limitations are detailed below. The ownership-only reference to **DerivedDeRhamCohomology §1.12** imports no result into a proof route.

## What moved from Lean to README

The sole proved, value-computing example for `CyclotomicIndex.vertices` at orders 4,6,12, nonmembership of {1,4}, and incomparability of singleton vertices was deleted from `Suggested.lean`. Every assertion remains as a prose Check in README §3.2. The mathematical milestones, native definitions and all eight admitted theorems remain. The resulting acceptance module has 188 lines, no examples, no sorry'd data and no option overrides.

## Supplier replacements and ownership

- README §4.1 now cites **QWittVectors §§4.3–4.6** for relative functoriality, **§4.3** for the relative self-ring, and **§§5.1–5.2** for étaleness/flatness. The two references to local “Layer 4” were self-references, and §§6.1–6.3 concern completed Frobenius rather than the flatness input.
- Mathlib and Tau Ceti have separate contracts. The Tau Ceti residue-tuple and section declarations are located in `TauCeti/RingTheory/Cyclotomic/Lift.lean`, lines 225 and 385. The local constant-coefficient instance is now explicitly named in the README, with three scalar-action Checks.
- Ordinary étale lifting maps out of E, completion quotient kernels, invertible-module surjectivity, Laurent/localization and tensor carriers remain imported native inputs. This roadmap's completed-map theorem is the additional map out of the ordinary completion, not a restatement of the existing lift out of E.
- The pairwise cyclotomic identities, ordinary polynomial/Laurent completion, classical Taylor rigidity and prime-inversion components remain with **HabiroCyclotomicCompletions §§1.4,2.3,4.1,4.3,5.1,5.3**. Here the targets concern their derived comparisons, the finite-subset combinatorics, or relative-ring comparisons. No second construction was added.
- Gaussian polynomials and the denominator-cleared product remain supplied by **ArithmeticStatisticsPartIV §3.2** and **QSeriesPartitionsAndMockModularForms §3.1**; no invented export name was introduced.
- **SchemeAndStackFoundations §0.23a** supplies topological invariance; the retained §0.3 target is its affine marking adapter. **DerivedModuleAlgebra §§1.1–1.5** supplies module completion; **EnhancedDerivedSheaves E0/E1/E2:towers/E3/E5**, **BordismFormalGroups F6.5**, and **GeneralizedCohomology G2.1–G2.7** supply the stated enhanced and spectral carriers.

Object searches used the roadmap registry over all main and indexed open roadmaps, the package collection, and every supplied sibling head. They covered marked ordinary/complete étale lifting, locally nilpotent rigidity, finite commuting-localization descent, relative Habiro rings and Taylor equalizers, Laurent scalar restriction, localization telescopes, prime-power-chain indices, light solid spectra, proper profile weights and K₃-indexed lines. The hits were read to distinguish suppliers and consumers. No further duplication removal was warranted. In particular, no readable owner supplies the general marked completion assembly, the coherent finite-localization theorem, the cyclotomic telescope, or the separable-profile milestone. The accepted ownership of those targets remains here. No declaration uses another roadmap's fully qualified name.

Targeted Mathlib/Zulip web searches produced no verified object-specific upstream replacement; this is a search limitation, not a claim that no such work exists. The roadmap follows the pinned native APIs and requires no wait for upstream work. No helper agents were used.

## Reviewer-pass fixes

1. Corrected “M=0 is excluded” to **m=0** in §2.4. The zero coefficient module is allowed; the excluded operator is multiplication by q⁰−1=0 on a nonzero module.
2. Wrote the prime-stage mapping-space Check in §3.6 as **V×ʰ_(W×W)W**, using the pair of edge maps and the diagonal. This specifies the homotopy equalizer without an ambiguous pullback along two parallel arrows.
3. Repaired the three QWittVectors proof-input citations in §4.1, as recorded above.
4. Corrected the §7.4 Corollary 2.52 locator to printed **pp.35–36**, and distinguished printed page numbers from PDF viewer indices. All twelve fetched PDFs match the package manifest hashes.
5. Named the constant-coefficient scalar instance in the README and computed its action: X·3=0, 2·3=6, (1+X)·3=3 over ℤ. This makes the module action in the completed-line signature explicit.
6. Expanded the Laurent coefficient, denominator, factor, factorial and free-module-map Checks, and the maximal-chain Checks, so the definitions supporting the headline theorems have discriminating values. No new theorem or narrower hypothesis was introduced.
7. Corrected malformed punctuation in the summary, capitalized the mapping-space paragraph, removed duplicate Needs entries, and expressed the finite-field source correction without a process narrative. The §7.1 four-factor calculation remains unchanged.

## Pin and source evidence

The manifest and actual package checkouts agree: Mathlib **6b7abb3**, Tau Ceti **a91d3aa**.

At the pin, `Mathlib/RingTheory/Etale/Basic.lean` line 205 defines `Algebra.Etale` by the fields `formallyEtale : FormallyEtale R A` and `finitePresentation : FinitePresentation R A`. It does not require finiteness as an R-module. `Mathlib/RingTheory/AdicCompletion/Basic.lean` line 56 defines `IsAdicComplete` by extending both `IsHausdorff I M` and `IsPrecomplete I M`; completeness here includes separatedness. The completion carrier at line 171 is the compatible-family subtype of all M/IⁿM, not an unconditional assertion that it is complete. `Completeness.lean` lines 151,181,195 retain I.FG in the quotient-kernel, completeness and first-ring-quotient statements.

`Mathlib/RingTheory/PicardGroup.lean` line 77 defines invertibility by bijectivity of the canonical contraction from the dual tensor the module. Its lines 236 and 276 supply the free-rank-one and surjective-map facts. They do not construct an arithmetic integral evaluator. `Mathlib/RingTheory/Smooth/AdicCompletion.lean` line 94 supplies formal-smooth lifting into a complete target; `Mathlib/RingTheory/Unramified/Basic.lean` line 161 supplies uniqueness. The ordinary completion-map assembly remains the owned target.

All twelve public-source hashes match `packages/HabiroRings/sources.toml`. The source identifiers below refer to the numbered text extractions used for this port; printed page/statement locators remain in the roadmap.

| Source evidence | Verified input or boundary |
| --- | --- |
| Q line 613 | §2.7 assumes R étale; the displayed Theorem 2.9 at Q line 640 is read in that standing context. |
| Q line 712; Q line 781 | Full Taylor equalizer and number-field comparison; the finite-field irreducibility sentence is not used. |
| Q line 3358; Q line 3386 | Completion towers, homotopy criterion and the printed telescope; the adjacent-factor differential has zero augmentation. |
| Q line 3401; Q line 3420 | Cyclotomic detection and degreewise vanishing. |
| Q line 3435; Q line 3458 | Light solid recollections and the bounded-below tensor proof sketch. The extra tower/resolution contract is kept explicitly. |
| W line 302; W line 1515; W line 1599 | Prime-generated cyclotomic ideal with m>1, étale q-Witt pushouts, and the injective-prime-completion Frobenius obstruction. |
| G line 246; G line 393; G line 421; G line 441 | Full ring, actual indexed modules, multiplication and integral constant terms. These do not replace the accepted integral/global supplier hypotheses. |
| G line 2190 | Proof of the integral constant-term assertion, using all prime completions outside Δ. |
| Hab line 634; Hab line 728 | Laurent comparison and ordinary polynomial coefficient-module completion. |
| Stacks04D1 line 17274; Stacks0ALI line 1241; Stacks0ALI line 11757 | Arbitrary-ideal object lifting, locally nilpotent equivalence and principal Koszul completion. |
| H line 192; H line 731 | Dwork congruences and the Witt-comonad coalgebra convention. |
| B line 589; B line 600 | Λ-coalgebras, the torsion-free Frobenius-lift comparison and the free Λ-ring. |
| HA line 6965; HA line 12815; HA line 12821 | Tensor-compatible localization and limits of algebra objects. |
| HA line 44096; HA line 44304; HA line 44309 | Eilenberg–Mac Lane module comparison and static algebra mapping spaces. |
| MW line 1664; T line 3620; T line 3653 | Light solid spectra, null-sequence solidification and the countable-product compact generator. |
| Bosco line 3273; Bosco line 3300 | Abelian p-complete bounded tensor and null-family model; no general spectral inference is substituted. |

## Unresolved accepted contracts

The accepted review preserves the package's explicit conditional supplier decisions. This port does not turn them into assertions of existing exports:

- **HabiroCohomologyFoundations §§0.1–0.3:** reflection/towers/detection/tensor, finite cyclotomic descent, and marked étale coefficient lifts. The registry and package collection contain no text for that roadmap, despite its earlier merge-order entry. The citation resolver's remaining missing-roadmap lead is this same §0.3 reference; it reports no missing Lean names. Its statement that the resolver host lacks pins is addressed by the direct pin checks above.
- **HabiroNumberFields:** ordinary number-field ring, actual global K₃-indexed lines and pairings, integral order-one evaluation, and supported arithmetic pullbacks. No supplier text was available to replace the four explicit contracts with verified section citations.
- **SolidAnalyticRings:** the full light solid spectral product/tower/base-change/null-family/realization contract is an accepted unsatisfied prerequisite. No roadmap or merge-order entry for this name was found. The nonsolid ordinary relative-ring theory is independent of it.
- **QWittVectors:** §§6.1–6.3 supply fixed-base naturality, while cross-base completed Frobenius naturality remains the explicit additional contract. No unexported declaration was certified.
- **HabiroCyclotomicCompletions:** §4.1 supplies pairwise intersections/resultants but does not state the m>1 prime-generated-ideal identity. Its explicit contract remains; W line 302 supports the mathematical identity, with the empty-prime-set exception at m=1.

No scope transfer to a later roadmap was made, and no missing carrier was encoded by a free predicate or sorry'd definition. The missing-carrier headlines remain enumerated in the module docstring. There were no suspicious instructions involving credentials, external writes or unrelated files in the inspected material.

## Adversarial mathematics pass

The table has 264 rows, one per named statement, API law, convention or additional defining Check. The accepted package supplied the inventory labels; every displayed value below was re-evaluated in the port, with exact integer/rational polynomial calculations and independent finite-index enumeration where applicable. Finite examples are witnesses and negative controls, not proofs of the general admitted statements. Categorical, spectral and arithmetic rows remain conditional exactly where the README does.

The computation record gives P₀(2),P₁(2),P₂(2),P₃(2)=1,−1,3,−21; all three tested augmentation/differential composites are 0; Φ₅ has roots 3,4,5,9 modulo 11 and the four stated lifts have value 0 modulo 14641; the cubic quadratic factor has b⁵=2+4b modulo 5; and every one of 11,417 nested triples at orders 1 through 300 satisfies height one. Zero/whole ideals, zero rings/modules, characteristic two, ramified versus inverted primes, nonreduced coefficients, empty covers/blocks, profile total-function boundaries, signs, arrows and integral versus p-adic hypotheses are included. Nonabelian-group and inseparable-field-extension tests are inapplicable: none of the statements is about such a group or an unrestricted field extension.

| Statement | Instances tried | Computed values on the compared sides | Result | Change |
| --- | --- | --- | --- | --- |
| Conventions: positive indices | m=0,1,2 | f₀=0, f₁=q−1, f₂=q²−1; P₀=1; m=0 excluded from regularity | Consistent | Retained |
| Conventions: torsion-free coefficients | ℤ; 𝔽₂; zero ring | 2·1=2≠0 in ℤ; 2·1=0 in 𝔽₂; 0→0 injective | Consistent | Retained |
| Conventions: Adams versus exterior operations | toric ℤ[t], a=t; λ-line | ψ₂(t)=t², ψ₃(t)=t³; λ²(t)=0=−c₂(t) | Consistent | Retained |
| Conventions: right twisted base action | A=R=ℤ[t], m=2 | a⊗b↦ψ₂(a)b sends t⊗1 to t² and 1⊗t to t | Consistent | Retained |
| Conventions: derived quotient | M=𝔽₂, q=1 | π₀(M/(q−1))=𝔽₂ and π₁=𝔽₂; ordinary quotient has only π₀ | Consistent | Retained |
| Conventions: divisibility direction | m=2,n=6; n=3 | q⁶−1=(q²−1)(q⁴+q²+1); remainder of q³−1 mod q²−1 is q−1 | Consistent | Retained |
| Conventions: completed versus localized | M=R_r and M=ℤ with q=1 | L_H(R_r)=0; L_H(ℤ)=ℤ; localization sends the latter to 0 | Consistent | Retained |
| Conventions: spherical carrier | sphere and Hℤ | π₀=ℤ in both; π₁=ℤ/2 for sphere, 0 for Hℤ | Consistent | Retained |
| Conventions: homotopy bound | 𝕊; Σ⁻ⁿ𝕊 for all n | sphere has π_k=0 for k<0; Σ⁻ⁿ𝕊 has π_−n=ℤ, with no uniform lower bound | Consistent | Retained |
| Conventions: X=q−1 | q,q² | q↦1+X; q²↦1+2X+X²; linear sign is + | Consistent | Retained |
| QWitt supplier: perfection | ℤ; toric ℤ[t] | ℤ^perf=ℤ; t has no ψ₂-preimage in ℤ[t], but t^(1/2) maps to t in perfection | Consistent | Retained |
| QWitt supplier: perfect coverage | toric ℤ[t], ψ₂ | basis {1,t} over ℤ[t²]; rank 2, faithful and flat, despite nonsurjectivity | Consistent | Retained |
| QWitt supplier: prime-generated ideal | m=1,2,6 | 0≠(q−1); sole m=2 generator 1+q; for m=6, (1+q²+q⁴)−q(1+q³)=q²−q+1 | Consistent | Retained |
| QWitt supplier: absolute versus relative | A=ℤ[t], m=2 | relative self-ring contains t; absolute image at q=−1 is ℤ[t²] and excludes t | Consistent | Retained |
| QWitt supplier: completed Frobenius | R=ℤ[i][1/2], p=3,5,2 | φ₃(i)=−i, φ₅(i)=i, and R̂₂=0 | Consistent | Retained |
| QWitt supplier: Frobenius versus restriction | m=2→1 | F₁st-stage is evaluation at q=1; a map ℤ[q]/(q+1)→ℤ with q=1 would force 2=0 | Consistent | Retained |
| Habiro supplier: factorial tower | M=ℤ, q=1; M=R_r | first is fixed; second has all quotients 0 and completion 0, although 1≠0 in R_r | Consistent | Retained |
| Habiro supplier: derived cyclotomic detection | M=ℤ, q=1 | M is static but M/(q−1) has π₁=ℤ; converse staticity inference fails | Consistent | Retained |
| Habiro supplier: finite reconstruction | m=1,4,6 | m=1 one vertex; {1,4} has radical (2,q−1); {1,6} gives unit ideal since Φ₆(1)=1 | Consistent | Retained |
| Habiro supplier: rational fracture completion | t=q²−1, E=ℤ[q]^∧_t | tⁿ/2ⁿ has unbounded denominators; lies in (E[1/2])^∧_t, not E[1/2] | Consistent | Retained |
| Habiro supplier: marked lifts and staticity | R=0; R=ℤ[1/2], m=1 | zero lifts to 0; nonzero lift is ℤ[1/2][[X]], containing Xⁿ/2ⁿ; static quotient alone has an extra π₁ after derived reduction | Consistent | Retained |
| Solid supplier: Null and shift | zero spectrum; one sphere coefficient | internal Hom into 0 is 0, so 1−σ* is invertible on 0; Null^■ has countably many sphere factors | Consistent | Retained |
| Solid supplier: product tensor | one-coordinate projections | e_i⊗e_j projects to 1 in coordinate (i,j) and 0 in the other coordinates | Consistent | Retained |
| Solid supplier: countable/ω₁ distinction | profiles f_k(n)=max(n−k,0) | common lower profile would have g(n)≤f_n(n)=0; countable subsets instead have countable union | Consistent | Retained |
| Solid supplier: null families | singleton blocks | constant 1 has infinitely many nonzero residues mod P₁; P_n has residue 0 for n≥1 | Consistent | Retained |
| Number-field supplier: separate exclusions | F=ℚ(i), Δ=12 | 12 mod 6=0, 12 mod 4=0, 12 mod 24=12; localization is ℤ[i][1/6] | Consistent | Retained |
| Number-field supplier: integral evaluator | trivial line; zero evaluator | e(1)=1 gives a generator; zero map gives 0≠1 over ℤ | Consistent | Retained |
| §0.1 API 1: Marked datum | B=ℤ,I=(2),E=ℤ | E/IE=𝔽₂ and ε=id | Consistent under stated hypotheses | Retained |
| §0.1 API 2: Carrier étaleness | E=B=ℤ | identity Jacobian determinant=1 | Consistent under stated hypotheses | Retained |
| §0.1 API 3: Reduced étaleness | unit over ℤ/(2) | reduction is id:𝔽₂→𝔽₂ | Consistent under stated hypotheses | Retained |
| §0.1 API 4: Marking transport | split product, swap | carrier (1,0) unchanged; marking sends it to (0,1) | Consistent under stated hypotheses | Retained |
| §0.1 API 5: Conjugated reduction | g=id, target marking swapped | ε′gε⁻¹(1,0)=(0,1) | Consistent under stated hypotheses | Retained |
| §0.1 API 6: Reduced identity | same marking | ε·id·ε⁻¹(1,0)=(1,0) | Consistent under stated hypotheses | Retained |
| §0.1 API 7: Reduced composition | two split swaps | swap(swap(1,0))=(1,0) | Consistent under stated hypotheses | Retained |
| §0.1 API 8: Unit deformation | I=0 and I=B | reductions B and 0, respectively | Consistent under stated hypotheses | Retained |
| §0.1 API 9: Split deformation | x²−x=0 over 𝔽₂ | (2x−1)²=1; x↦(0,1), a+(b−a)x↦(a,b) | Consistent under stated hypotheses | Retained |
| §0.1 API 10: Localization deformation | a=2,0,1 in ℤ | ℤ[1/2], 0, ℤ; rational rank of first=1 | Consistent under stated hypotheses | Retained |
| §0.4 API 1: Completion ring | E=ℤ[t], I=(t) | (1+t)+(1−t)=2 and (1+t)(1−t)=1−t² in ℤ[[t]] | Consistent under stated hypotheses | Retained |
| §0.4 API 2: Completion B-action | t and 3 | t↦t, 3↦3 | Consistent under stated hypotheses | Retained |
| §0.4 API 3: Completion unit | 1+t∈E | maps to the series with coefficients (1,1,0,…) | Consistent under stated hypotheses | Retained |
| §0.4 API 4: Completeness | I=0; I=E | limits E and 0 | Consistent under stated hypotheses | Retained |
| §0.4 API 5: Quotient markings | n=1,2 for ℤ[[t]] | quotients ℤ and ℤ[t]/(t²), with coefficients (a₀) and (a₀,a₁) | Consistent under stated hypotheses | Retained |
| §0.4 API 6: Reduced unit | input 3+t | reduced value 3 on both paths | Consistent under stated hypotheses | Retained |
| §0.4 API 7: Completed hom bijection | E=B, C=ℤ[[t]] | one map on each side; 3↦3 | Consistent under stated hypotheses | Retained |
| §0.4 API 8: Lifted map | split swap | (1,0)↦(0,1) before and after reduction | Consistent under stated hypotheses | Retained |
| §0.4 API 9: Reduction of lifted map | split swap | reduced output (0,1) | Consistent under stated hypotheses | Retained |
| §0.4 API 10: Lifted identity | input (1,0) | output (1,0) | Consistent under stated hypotheses | Retained |
| §0.4 API 11: Lifted composition | two swaps | output (1,0) on both sides | Consistent under stated hypotheses | Retained |
| §0.4 API 12: Marked equivalence | B and B[1/(1−t)] | completed inverse of 1−t is Σtⁿ; product=1 | Consistent under stated hypotheses | Retained |
| §0.4 API 13: Equivalence marking | input 1−t | both reduced values=1 | Consistent under stated hypotheses | Retained |
| §0.4 API 14: Comparison transitivity | three copies of ℤ[[t]] | id∘id sends 3+t to 3+t, as does direct comparison | Consistent under stated hypotheses | Retained |
| §1.1 API 1: Pair object | (ℤ,ℤ[i][1/2]) | 2 inverted; discriminant −4 becomes a unit | Consistent under stated hypotheses | Retained |
| §1.1 API 2: Pair morphism | conjugation, base id | g(3)=3=ι(id(3)); g(i)=−i | Consistent under stated hypotheses | Retained |
| §1.1 API 3: Pair category | conjugation twice | i↦−i↦i; composite=id | Consistent under stated hypotheses | Retained |
| §1.1 API 4: Base component | conjugation pair | base sends 3 to 3 | Consistent under stated hypotheses | Retained |
| §1.1 API 5: Algebra component | conjugation pair | i↦−i | Consistent under stated hypotheses | Retained |
| §1.1 API 6: Forgetful functor | conjugation twice | forgotten composite=id_ℤ | Consistent under stated hypotheses | Retained |
| §1.1 API 7: Pair base change | ℤ→ℤ[t], R=ℤ[i][1/2] | R⊗ℤ[t]=ℤ[t,i][1/2]; t↦t, i↦i | Consistent under stated hypotheses | Retained |
| §2.1 API 1: Rational localization | positive indices 1,2 | (1−q) and (1−q²) become units; index 0 would invert 0 | Consistent under stated hypotheses | Retained |
| §2.1 API 2: Cyclotomic localization | m=2 | q²−1=(q−1)(q+1); both factors become units | Consistent under stated hypotheses | Retained |
| §2.1 API 3: Completeness predicate | M=ℤ,q=1; M=R_r | RHom(R_r,ℤ)=0; RHom(R_r,R_r) contains id(1)=1 | Consistent under stated hypotheses | Retained |
| §2.1 API 4: Laurent comparison | second factorial quotient | q(1+q−q²)−1=−P₂; modulo P₂ the product is 1 | Consistent under stated hypotheses | Retained |
| §2.1 API 5: Scalar restriction | A=𝔽₂,M=𝔽₂,q=1 | both derived q−1 quotients have π₀=π₁=𝔽₂ | Consistent under stated hypotheses | Retained |
| §2.1 API 6: Adic implies Habiro | ℤ[[q−1]] | q−1 complete; localization has (q−1) invertible; Hom obstruction=0 | Consistent under stated hypotheses | Retained |
| §2.1 API 7: Limit/fibre/shift closure | zero map ℤ→ℤ, q=1 | fibre=ℤ⊕Σ⁻¹ℤ, with both groups still complete | Consistent under stated hypotheses | Retained |
| §2.1 API 8: Kernel of reflection | M=R_r | L_HM=0; fibre of M→0 is M | Consistent under stated hypotheses | Retained |
| §2.1 API 9: HZ-relative comparison | M=Hℤ,q=1 | completion fixes M, with π₀=ℤ and π₁=0 on both sides | Consistent under stated hypotheses | Retained |
| §2.4 API 1: Laurent regularity | 𝔽₂, m=2, x=1; m=0 | (q²−1)·1=q²+1≠0; zero factor at m=0 kills 1 | Consistent under stated hypotheses | Fixed m=0 negative-control wording |
| §2.4 API 2: Ordinary/derived comparison | M=𝔽₂, n=1,2 | quotient dimensions=1,3; higher homotopy=0 | Consistent under stated hypotheses | Retained |
| §2.4 API 3: Homotopy of comparison | M=0; M=𝔽₂ | zero on all degrees for M=0; π₁=0 for the polynomial coefficient completion | Consistent under stated hypotheses | Retained |
| §2.4 API 4: Finite projections | q² at n=1 | q² maps to 1 in both ordinary and derived P₁ quotient | Consistent under stated hypotheses | Retained |
| §2.4 API 5: Coefficient naturality | ℤ→𝔽₂, element 3 | both projection/reduction composites give 1 | Consistent under stated hypotheses | Retained |
| §2.5 API 1: Completed tensor base change | identity; ℤ→ℤ[t] | identity gives H; polynomial extension gives ΣP_n tⁿ in completed target, outside H[t] | Consistent under stated hypotheses | Retained |
| §2.6 API 1: Spherical localization algebra | π₀ generator q | q maps to the invertible Laurent generator; 1 maps to 1 | Consistent under stated hypotheses | Retained |
| §2.6 API 2: Localization mapping property | target T; q=1 target | identity map on T; q=1 would force 0 invertible and hence zero target | Consistent under stated hypotheses | Retained |
| §2.6 API 3: Positive factors invertible | m=1,2 | (q−1)/(q−1)=1 and (q²−1)/(q²−1)=1 | Consistent under stated hypotheses | Retained |
| §2.6 API 4: Localization idempotence | 1⊗1 and q⊗1 | multiply to 1 and q, respectively | Consistent under stated hypotheses | Retained |
| §2.6 API 5: Localization fibre transition | P₁→P₂, q=2 | transition factor=−3; P₁·(−3)=(−1)(−3)=3=P₂ | Consistent under stated hypotheses | Retained |
| §2.6 API 6: Localized homotopy | π₀ and π₁ of sphere Laurent ring | π₀=R_r; π₁=𝔽₂[q±1,(1−qⁱ)⁻¹], nonzero, unlike H(R_r) | Consistent under stated hypotheses | Retained |
| §2.7 API 1: Spectral reflection | M=0 and M=T | both reflected objects=0 | Consistent under stated hypotheses | Retained |
| §2.7 API 2: Factorial formula | M=Hℤ,q=1 | quotient has π₀=π₁=ℤ; transition on π₁ is 0, so inverse limit gives only Hℤ | Consistent under stated hypotheses | Retained |
| §2.7 API 3: Reflection adjunction | M=N=Hℤ,q=1 | id maps to id; value on 1 is 1 | Consistent under stated hypotheses | Retained |
| §2.7 API 4: Reflection idempotence | M=Hℤ,q=1 | both units act as 1↦1 | Consistent under stated hypotheses | Retained |
| §2.7 API 5: Completed tensor unit | SH⊗̂SH | multiplication sends 1⊗1 to 1 | Consistent under stated hypotheses | Retained |
| §2.7 API 6: Homotopy short exact sequence | M=Hℤ,q=1 | Hom and Ext¹ obstruction terms=0, so π_kRHom(T,M)=0 | Consistent under stated hypotheses | Retained |
| §2.7 API 7: Homotopy criterion | M=Hℤ; M=T | first complete; π₀(T)=R_r fails because Hom(R_r,R_r) contains 1 | Consistent under stated hypotheses | Retained |
| §2.7 API 8: Cyclotomic detection | M=0; M=Hℤ,q=1 | all reductions of 0=0; nonzero example has π₀(M/Φ₁)=ℤ | Consistent under stated hypotheses | Retained |
| §2.7 API 9: Degree detection | M=ΣHℤ,q=1,k=1 | π₁(M/Φ₁)=ℤ, so vanishing hypothesis fails for its nonzero group | Consistent under stated hypotheses | Retained |
| §2.7 API 10: Eilenberg–Mac Lane restriction | Hℤ,q=1 | π₀=ℤ, π₁=0 in both completed models | Consistent under stated hypotheses | Retained |
| §2.7 API 11: Reflection on maps | multiply by 2 on Hℤ,q=1 | 3↦6 | Consistent under stated hypotheses | Retained |
| §2.7 API 12: Reflection identity | same M | 3↦3 | Consistent under stated hypotheses | Retained |
| §2.7 API 13: Reflection composition | multiply by 2 then 3 | 1↦6 on both paths | Consistent under stated hypotheses | Retained |
| §2.7 API 14: Unit naturality | multiply by 2 | both paths send 3 to 6 | Consistent under stated hypotheses | Retained |
| §2.8 API 1: Solid completeness | M=Hℤ,q=1 | localization orthogonality gives 0 internal Hom | Consistent under stated hypotheses | Retained |
| §2.8 API 2: Solid quotient tower | M=Hℤ,q=1 | π₀ tower constant ℤ; extra π₁ transition=0; limit=M | Consistent under stated hypotheses | Retained |
| §2.8 API 3: Completed discrete embedding | M=0; M=Hℤ,q=1 | outputs 0 and discrete Hℤ | Consistent under stated hypotheses | Retained |
| §2.8 API 4: Full faithfulness | M=Hℤ,q=1 | identity corresponds to multiplication by 1 on both sides | Consistent under stated hypotheses | Retained |
| §2.8 API 5: Point evaluation | M=Hℤ,q=1 | π₀ of evaluation=ℤ, π₁=0 | Consistent under stated hypotheses | Retained |
| §2.9 API 1: Solid unit idempotence | mod P₁ and mod P₂ | finite quotient ranks=1 and 3; multiplication sends 1⊗1 to 1 | Consistent under stated hypotheses | Retained |
| §2.10 API 1: Completed block object | all blocks empty; one singleton block | C=0; C=SH | Consistent under stated hypotheses | Retained |
| §2.10 API 2: Factorial fibre J_r | r=0,1,2 on π₀ | J₀=H; J₁=(1−q)H; J₂=P₂H | Consistent under stated hypotheses | Retained |
| §2.10 API 3: Null-family formula | singleton blocks | constant residues=1 infinitely often; weighted P_n residues=0 for n≥1 | Consistent under stated hypotheses | Retained |
| §2.10 API 4: Block injection | single nonempty block, generator 1 | 1↦1 in SH | Consistent under stated hypotheses | Retained |
| §2.10 API 5: Mapping property | single block, target SH | multiplication by 3 corresponds to value 3 | Consistent under stated hypotheses | Retained |
| §2.10 API 6: Completeness of C | single block; empty blocks | C=SH; C=0; RHom(T,C)=0 in both cases | Consistent under stated hypotheses | Retained |
| §2.10 API 7: Profile transitions | f=n+1,g=n at q=2,n=1 | P₂=3 maps to 3 in ideal P₁H; ratio=−3; min(f,g)=g | Consistent under stated hypotheses | Retained |
| §2.10 API 8: Finite-support maps | one block, multiply by 2 | 1↦2 | Consistent under stated hypotheses | Retained |
| §2.10 API 9: Block-map identity | one block | 1↦1 | Consistent under stated hypotheses | Retained |
| §2.10 API 10: Block-map composition | multiply by 2 then 3 | 1↦6 on each side | Consistent under stated hypotheses | Retained |
| §2.10 API 11: Injection naturality | multiply by 2 on one block | both composites send 1 to 2 | Consistent under stated hypotheses | Retained |
| §2.11 API 1: Countable tensor comparison | one block and empty block | SH⊗SH=SH; SH⊗0=0 in the stated solid category | Consistent under stated hypotheses | Retained |
| §2.11 API 2: Separable weights | h=max, (m,n)=(3,5),(8,8) | floor halves give 1+2=3≤5 and 4+4=8≤8 | Consistent under stated hypotheses | Retained |
| §2.11 API 3: Radial maximum | f(m)=m,g(n)=n, m+n≥2k | max(m,n)≥k; at (3,5) max=5 while sum=8 | Consistent under stated hypotheses | Retained |
| §2.12 API 1: Bounded completed-discrete tensor | M=N=SH; N=0 | both comparisons give SH and 0, respectively | Consistent under stated hypotheses | Retained |
| §2.12 API 2: Bounded monoidality | unit, pair SH and ΣSH | unit sends 1⊗1 to 1; tensor is ΣSH | Consistent under stated hypotheses | Retained |
| §2.12 API 3: Bounded tensor closure | SH and ΣSH | tensor ΣSH has no homotopy below 1; unbounded shifts Σ⁻ⁿSH have no common lower bound | Consistent under stated hypotheses | Retained |
| §3.2 API 1: Prime-chain definition | (4,1,2),(1,3,2),(0,1,2),(4,0,2),(4,3,0) | {1,2,4}; {3}; {1}; {0}; {3} | Consistent under stated hypotheses | Retained |
| §3.2 API 2: Vertex definition | m=0,1,4,6,12 | cardinalities 0,1,4,8,11 | Consistent under stated hypotheses | Retained |
| §3.2 API 3: Vertex membership equivalence | m=4 | {1,2,4} belongs; {1,4} does not | Consistent under stated hypotheses | Retained |
| §3.2 API 4: Vertex divisor containment | m=12, chain {3,6,12} | 12/3=4,12/6=2,12/12=1 | Consistent under stated hypotheses | Retained |
| §3.2 API 5: Nonempty vertices | m=1, m=0 | unique vertex {1}; no vertices at 0, so universal assertion vacuous there | Consistent under stated hypotheses | Retained |
| §3.2 API 6: Subset order | m=2, singleton vertices | neither {1}⊆{2} nor {2}⊆{1}; {1}⊆{1,2} | Consistent under stated hypotheses | Retained |
| §3.2 API 7: Poset nerve | m=4 | only strict arrows singleton→{1,2,4}; no strict composable pair | Consistent under stated hypotheses | Retained |
| §3.5 API 1: Localization datum | singleton identity cover | L²(x)=x=L(x); unit=id_x | Consistent under stated hypotheses | Retained |
| §3.5 API 2: Coherent overlaps | two repeated identity covers | all four overlap localizations=id, all unit composites=id | Consistent under stated hypotheses | Retained |
| §3.5 API 3: Restriction functor | repeated identity cover | x↦(x,x,id); tensor unit↦(1,1,id) | Consistent under stated hypotheses | Retained |
| §3.5 API 4: Reconstruction | same cover | limit of x→x←x with identity comparisons=x | Consistent under stated hypotheses | Retained |
| §3.5 API 5: Mapping spaces | singleton identity cover | mapping homotopy limit=Map(x,y) | Consistent under stated hypotheses | Retained |
| §3.5 API 6: Commutative algebras | singleton identity cover | restricted algebra A reconstructs as A, with 1↦1 | Consistent under stated hypotheses | Retained |
| §3.5 API 7: Refinement coherence | one identity cover refined by two copies | x↦(x,x,id)↦x; composite=id | Consistent under stated hypotheses | Retained |
| §3.5 API 8: Finite-refinement sheaf | empty cover; singleton identity | empty conservative family forces D=0; singleton descent sends x to x | Consistent under stated hypotheses | Retained |
| §3.6 API 1: Prime-edge mapping equalizer | m=1 and m=2, identity edge | m=1: W is point and equalizer=V; m=2 both images of identity are identity | Consistent under stated hypotheses | Wrote the diagonal homotopy-pullback formula |
| §4.1 API 1: Marked finite stage | m=1,R=ℤ[1/2] | stage=ℤ[1/2][[X]], reduction at X=0 is ℤ[1/2] | Consistent under stated hypotheses | Retained |
| §4.1 API 2: Stage map of pairs | base ℤ→ℤ[t], R=ℤ | q↦q; at m=1, X↦X and 3↦3 | Consistent under stated hypotheses | Repaired QWittVectors section citation |
| §4.1 API 3: Stage equivalence for pair isomorphism | split swap | (1,0)↦(0,1) and back to (1,0) | Consistent under stated hypotheses | Retained |
| §4.1 API 4: Self-stage comparison | A=ℤ,m=2 | stage ℤ[q]^∧_(q²−1), quotient free rank 2 over ℤ | Consistent under stated hypotheses | Repaired QWittVectors section citation |
| §5.1 API 1: Ordinary relative limit | A=R=ℤ; R=0 | classical inverse-limit ring; zero ring | Consistent under stated hypotheses | Retained |
| §5.1 API 2: Limit projections | polynomial q | π_m(q)=q in every stage; at m=1, q=1+X | Consistent under stated hypotheses | Retained |
| §5.1 API 3: Extensionality | q versus 0 | first-stage projections differ by 1+X≠0 | Consistent under stated hypotheses | Retained |
| §5.1 API 4: Limit lifting property | maps ℤ[q]→all stages | q lifts to q; projection of lift again q | Consistent under stated hypotheses | Retained |
| §5.1 API 5: Factorial cofinality | indices 2,3 | 2 divides 2!; 3 divides 3!=6; both selected projections retain q | Consistent under stated hypotheses | Retained |
| §5.1 API 6: Partial completion | m=1, A=R=ℤ | completed target ℤ[[X]], q↦1+X | Consistent under stated hypotheses | Retained |
| §5.1 API 7: Cyclotomic completion | m=4,R=ℤ[i][1/2] | full coefficient algebra R⊗ℤ[i]=R×R, two Taylor factors | Consistent under stated hypotheses | Retained |
| §5.1 API 8: Regular quotient and Frobenius | A=R=ℤ,m=2→1 | quotient ℤ[q]/(q²−1), rank 2; Frobenius sends q to 1 | Consistent under stated hypotheses | Retained |
| §5.1 API 9: Ring functor on pairs | ℤ→ℤ[1/2] | q maps to q under identity and composites; 2 maps to 2 | Consistent under stated hypotheses | Retained |
| §5.2 API 1: Compatible root system | m=1,2,3,6 | ζ₁=1, ζ₂=−1, ζ₆=−ζ₃; coprime product holds | Consistent under stated hypotheses | Retained |
| §5.2 API 2: Standard compatible roots | m=1,4,6 | empty product=1; ζ₄=i; ζ₆=−exp(2πi/3) | Consistent under stated hypotheses | Retained |
| §5.2 API 3: Full coefficient algebra | R=ℤ[i][1/2],m=4 | e=(1−i⊗i)/2 has values (1,0) in R×R | Consistent under stated hypotheses | Retained |
| §5.2 API 4: Taylor factors | m=1; R=0 | T₁=R[[X]]; all factors zero for R=0 | Consistent under stated hypotheses | Retained |
| §5.2 API 5: Canonical coefficient map | p=2,m=1 | 3+X maps to 3+X over ℤ₂ | Consistent under stated hypotheses | Retained |
| §5.2 API 6: Frobenius/re-expansion map | p=2,m=1, input q+1 | Y=q+1 maps to X+2 | Consistent under stated hypotheses | Retained |
| §5.2 API 7: Taylor component | f=1−q³ at ζ₃ | constant=0, linear=−3ζ₃², quadratic=−3ζ₃, cubic=−1 | Consistent under stated hypotheses | Retained |
| §5.2 API 8: Topologically nilpotent shift | p=2,m=3; p=3,m=1 | ζ₃−ζ₆=2ζ₃; (1−ζ₃)²=−3ζ₃; both have positive prime valuation | Consistent under stated hypotheses | Retained |
| §5.2 API 9: Integral re-expansion comparison | p=2,m=1 | q+1 maps to X+2 in both formulas | Consistent under stated hypotheses | Retained |
| §5.2 API 10: Root relabelling/Galois comparison | m=4, conjugation | i↦−i swaps e=(1,0) and (0,1); realized action is nonidentity | Consistent under stated hypotheses | Retained |
| §5.6 API 1: Stage base change | identity; m=1,R=0 | identity stage comparison; zero stage | Consistent under stated hypotheses | Retained |
| §5.6 API 2: Completed ring base change | ℤ→ℤ[t] | ΣP_n(q)tⁿ occurs in completed target, with unbounded t-degrees | Consistent under stated hypotheses | Retained |
| §5.6 API 3: Flat base change | same polynomial extension | Tor_i=0 for i>0; H[t] still lacks that series | Consistent under stated hypotheses | Retained |
| §5.7 API 1: Classical ring comparison | A=R=ℤ | P₁=1−q, P₂=1−q−q²+q³ on both sides; q↦1+X at first root | Consistent under stated hypotheses | Retained |
| §5.8 API 1: Discriminant-multiple consequence | F=ℚ(i), Δ=4 | −4 divides 4; coefficient ring ℤ[i][1/2] | Consistent under stated hypotheses | Retained |
| §5.8 API 2: Prime-support étaleness | F=ℚ(i),Δ=2,1; F=ℚ,Δ=1 | first inverts the only bad prime 2; second fails; rational case is id_ℤ | Consistent under stated hypotheses | Retained |
| §5.9 API 1: Number-field ring equivalence | F=ℚ,Δ=1; F=ℚ(i),Δ=12 | classical ring in first case; full order-four coefficient algebra R×R in second | Consistent under stated hypotheses | Retained |
| §6.1 API 1: Completed scalar extension | M=H; M=0 | pullbacks H′ and 0 | Consistent under stated hypotheses | Retained |
| §6.1 API 2: Scalar adjunction | M=H,N=H′ | identity corresponds to element 1 | Consistent under stated hypotheses | Retained |
| §6.1 API 3: Tensor/unit comparison | M=N=H | both sides H′; 1⊗1↦1 | Consistent under stated hypotheses | Retained |
| §6.1 API 4: Identity pullback | M=H | 1↦1 | Consistent under stated hypotheses | Retained |
| §6.1 API 5: Composite pullback | H→H′→H″, M=H | both tensor-associator paths send 1 to 1 | Consistent under stated hypotheses | Retained |
| §6.1 API 6: Perfect pullback | M=H⁰,H¹ | outputs 0,H′ without extra completion | Consistent under stated hypotheses | Retained |
| §6.1 API 7: Finite quotient pullback | ℤ→ℤ[1/2],m=2 | ℤ[1/2][q]/(q²−1)=ℤ[1/2]×ℤ[1/2] | Consistent under stated hypotheses | Retained |
| §6.1 API 8: Picard map | trivial line | [H] maps to [H′]=identity class | Consistent under stated hypotheses | Retained |
| §6.1 API 9: Picard/complete agreement | trivial line | both operations give actual invertible module H′ | Consistent under stated hypotheses | Retained |
| §6.2 API 1: Transported Picard character | ξ=0; ξ+(−ξ) | M₀=H; M_ξ⊗M_−ξ≃H under imported inverse pairing; classes add to 0 | Consistent under stated hypotheses | Retained |
| §6.3 API 1: q−1 completion map | q,q²; inverted-2 component idempotent e₁ | 1+X, 1+2X+X²; c(e₁)=0 although e₁²=e₁≠0 | Consistent under stated hypotheses | Retained |
| §6.4 API 1: Evaluator fixes underlying map | e=id; e=−id, input 3 | t(3)=3; t(3)=−3 | Consistent under stated hypotheses | Retained |
| §6.4 API 2: Inverse of one | e=−id over ℤ | t⁻¹(1)=−1 and e(−1)=1 | Consistent under stated hypotheses | Retained |
| §6.4 API 3: Normalized coordinates | e=−id, x=3 | e(3)·t⁻¹(1)=(−3)(−1)=3 | Consistent under stated hypotheses | Retained |
| §6.4 API 4: Normalization uniqueness | rank-one trivial fibre | same underlying evaluation forces t(3)=e(3), value 3 or −3 | Consistent under stated hypotheses | Retained |
| §6.4 API 5: Unit rescaling | u=−1, x=3 | new coordinate=−3=(−1)·3 | Consistent under stated hypotheses | Retained |
| §6.4 API 6: Evaluator naturality | ℤ→𝔽₅, e=−id, x=3 | both paths give −3 mod 5=2 | Consistent under stated hypotheses | Retained |
| §6.4 API 7: Fibre trivialization | unit evaluator; negative; zero | preimages of 1 are 1 and −1; zero gives 0≠1 and fails hypothesis | Consistent under stated hypotheses | Retained |
| §6.5 API 1: Completed line triviality | R=ℤ,ℤ×ℤ,0; free P | bases 1 and 1+X reduce to 1; constant terms 1 and 1; at zero ring both modules=0 | Consistent under stated hypotheses | Retained |
| §6.6 API 1: Completed Picard vanishing | ξ=0; arbitrary ξ with supplied integral generator | trivial line has class 0; lifted first-fibre generator gives B≃P, so class=0 | Consistent under stated hypotheses | Retained |
| §6.7 API 1: Supported field comparison | identity; ℚ→ℚ(i),Δ=12,ξ=0 | identity sends 1 to 1; scalar extension of the unit line is the unit line, first-fibre value 1 | Consistent under stated hypotheses | Retained |
| §0.2 existence | I=0, I=B, and 𝔽₄ over ℤ/(2) | E=D at I=0; D=0 at I=B; discriminant −3 becomes a unit in ℤ[x]/(x²+x+1)[1/3] | Consistent | Retained |
| §0.2 nonuniqueness | B=ℤ[t], I=(t), D=ℤ | B and B[1/(1−t)] reduce to ℤ; 1−t unit only in second before completion | Consistent | Retained |
| §0.3 locally nilpotent rigidity | 𝔽₂[x_i]/(x_i²), I=(x_i) | each finite sum has square 0; product x₁⋯x_N survives for every N; split swap²=id | Consistent | Retained |
| §0.5 completed maps | B=E=ℤ,I=(2), C=𝔽₂ | one map ℤ₂→𝔽₂; reduction=id, but 2↦0 so original map not an isomorphism | Consistent | Retained |
| §0.5 missing completeness | C=ℤ,I=(2) | 3 has an inverse in ℤ₂; no integer x satisfies 3x=1 | Consistent | Retained |
| §0.6 principal universality | f=2 on ℤ; f=1; f=0 | lift ℤ₂ regular; unit-complete object 0; zero factor on nonzero static module gives π₁=M | Consistent | Retained |
| §1.1 negative Λ-map | t↦t+1 over ℤ[t] | fψ₂(t)=t²+2t+1, ψ₂f(t)=t²+1; difference 2t≠0 | Consistent | Retained |
| §2.1 Laurent cofiber | class q⁻¹ | q·q⁻¹=0 in Laurent/polynomial quotient; (q−1)(−q⁻¹)=q⁻¹ | Consistent | Retained |
| §2.1 power-series distinction | Φ₂ quotient | ℤ[[t]]/(t+2)=ℤ₂; integral Habiro quotient=ℤ | Consistent | Retained |
| §2.2 coefficient definition | q,q⁻¹,0 | q·q⁻¹=1; coefficient of q⁻¹ in q⁻¹ is 1; q⁻¹−1≠0 | Consistent | Retained |
| §2.2 positive factor definition | i=0,1,2 | 1−q,1−q²,1−q³; all nonzero; index-zero exponent would instead give 0 | Consistent | Retained |
| §2.2 denominator monoid | empty product; repeated factor; zero | 1 and (1−q)² belong; (1−q)² divides P₂ with quotient 1+q; 0 excluded | Consistent | Retained |
| §2.2 factorial definition | n=0,1,2,3; q=2 | 1,−1,3,−21 after specialization; recursion ratios −1,−3,−7 | Consistent | Retained |
| §2.2 augmentation definition | e₀,e₁,e₂ at q=2 | 1,−1,1/3; multiplying by P_i gives 1 in each case | Consistent | Retained |
| §2.2 differential definition | e₀,e₁,e₂ at q=2 | e₀+e₁, e₁+3e₂, e₂+7e₃; first occupied coefficient=1 | Consistent | Retained |
| §2.2 exact resolution | aug(d(e₀)), aug(d(e₁)), aug(d(e₂)) at q=2 | 1−1=0; −1+3/3=0; 1/3−7/21=0; cumulative-factor error at i=1 gives −2/3 | Consistent | Retained |
| §2.2 endpoint exactness | input 2e₁+3e₂; fraction 1/(1−q) | d input has first occupied coefficient 2; augmentation of e₁ is the requested fraction | Consistent | Retained |
| §2.5 Tor | q²−1 and q³−1 | π₀=ℤ, π₁=ℤ·(1+q); (q−1)(1+q)=q²−1=0 in the first quotient | Consistent | Retained |
| §2.5 non-smashing tensor | x transcendental over ℚ(q) in H | x⊗1−1⊗x maps to 0 under multiplication; in fraction fields the two rational-function variables remain independent | Consistent | Retained |
| §2.8 completed discrete sum | one singleton block per n | constant family has infinitely many 1 residues mod P₁; decaying family P_n has only its n=0 residue nonzero | Consistent | Retained |
| §2.9 quotient ranks | n=0,1,2 | degrees 0,1,3; positive quotient ranks 1,3, not n at n=2 | Consistent | Retained |
| §2.11 Gaussian direction | a=b=1,q=0,1,−1,2 | both products evaluate to 1,0,0,3; at −1, P₁²=4 while P₂=0, excluding reverse divisibility | Consistent | Retained |
| §2.11 empty Gaussian rectangle | a=0,b=2 | Gaussian quotient=1; P₀P₂=P₂, even at q=1 where both products vanish | Consistent | Retained |
| §2.11 separable profile proof | h=m+n; h=max; h=0 | f=m,g=n gives equality; half floors at (3,5) give 3≤5; h=0 fails k=1 properness | Consistent | Retained |
| §2.11 profile proof bounds | row and column minima a(m),b(n) | a(m)≤h(m,n), b(n)≤h(m,n); floor(a/2)+floor(b/2)≤h; m≥B_(2k) gives floor(a/2)≥k | Consistent | Retained |
| §3.1 integral radical | S={1,2} | (q−1,q+1)=(2,q−1); quotient=𝔽₂ is reduced | Consistent | Retained |
| §3.1 arbitrary-base radical | A=𝔽₂[ε]/(ε²),S={1,2} | I=(q−1); ε²=0 gives ε in both radicals; both radicals=(ε,q−1) | Consistent | Retained |
| §3.1 unit/nonunit intersections | S={1,6} and {1,4} | Φ₆(1)=1 yields unit ideal; Φ₄(1)=2 yields radical (2,q−1) | Consistent | Retained |
| §3.3 height one | m=1…300 | 11,417 nested triples, 0 strict chains S⊊T⊊U; at m=4 every strict arrow ends in {1,2,4} | Consistent | Retained |
| §3.4 unique consecutive edge | m=12,(3,6),(6,12),(2,6) | first two in unique 2-chain {3,6,12}; last in unique 3-chain {2,6} | Consistent | Retained |
| §3.5 conservativity boundary | D≠0, every L_i=0 | nonzero x maps to 0, so joint conservativity fails; empty cover only permits D=0 | Consistent | Retained |
| §4.1 first and split stages | R=0; R=ℤ[1/2],m=2 | 0; product of q−1 and q+1 power-series factors, since 2 invertible makes overlap 0 | Consistent | Retained |
| §5.2 wrong conventional roots | ordinary exponential roots at 3 and 6 | difference −1 is a 2-adic unit; compatible roots instead have difference 2ζ₃ | Consistent | Retained |
| §5.2 value versus Taylor series | 1−q³ and 0 at ζ₃ | both values 0, but first has cubic Taylor coefficient −1 and second 0 | Consistent | Retained |
| §5.2 re-expansion convergence | Σ(q−1)^k expanded at ζ₃ | constant series Σ(ζ₃−1)^k; (1−ζ₃)²=−3ζ₃ gives convergence only in completed coefficient ring | Consistent | Retained |
| §5.3 all unramified factors | m=5,ℓ=11 | four roots 3,4,5,9; Φ₅ evaluates to 0 at each; degree ord₅(11)=1 | Consistent | Retained |
| §5.4 equalizer | classical q; R=0 | at p=2,m=1, can(1+X)=1+X and φ(Y−1)=X+2−1=1+X; zero equalizer=0 | Consistent | Retained |
| §5.5 untwisting | self-pair toric ℤ[t] | a⊗b↦ψ_m(a)b is inverse to a↦1⊗a; t⊗1=t^m on the right twist | Consistent | Retained |
| §5.6 flat toric series | ΣP_n(q)tⁿ | mod P₁ only n=0 term remains; t-degrees unbounded globally, so outside H[t] | Consistent | Retained |
| §6.2 line admissibility | F=ℚ(i),Δ=12 and Δ=4 | 12 meets 6 and −4 divisibilities; 4 meets ring condition but 6∤4 | Consistent | Retained |
| §6.3 kernel idempotent | R=ℤ[1/2], root-order valuation one | e₁²=e₁≠0; first Taylor component c(e₁)=0; e₁(1−e₁)=0 | Consistent | Retained |
| §6.4 negative normalization | H=R=M=ℤ | e(1⊗3)=−3; preimage of 1 is 1⊗(−1); zero evaluator gives 0 | Consistent | Retained |
| §6.5 Jacobson/Nakayama normalization | 1+X; R=ℤ×ℤ; R=0 | (1+X)Σ(−X)^n=1; constant (1,1) is a unit; zero ring gives unique zero module | Consistent | Retained |
| §6.7 field support | ℚ→ℚ(i),Δ=12 | 1∣12,−4∣12,6∣12; unit line and first-fibre generator both pull back to 1 | Consistent | Retained |
| §7.1 four Hensel lifts | 2786,7825,1963,2066 mod 11⁴ | Φ₅ values all 0 mod 14641; residues 3,4,5,9 in that order | Consistent | Retained |
| §7.2 prime-inversion components | p=2,orders 1,2,4,6 | v₂ values 0,1,2,1; odd-prime edges preserve these indices, deleted 2-edges separate them | Consistent | Retained |
| §7.3 cubic Frobenius | p=5, b²+3b+4=0 | quadratic discriminant 3∉{0,1,4}; b⁵=2+4b≠b, while linear root 3 is fixed | Consistent | Retained |
| §7.3 global endomorphism obstruction | α=∛2 real cubic | other two roots αζ₃,αζ₃² are nonreal; only α lies in F, so every endomorphism fixes α | Consistent | Retained |
| §7.4 finite-stage obstruction | R=ℤ,m=5; m=1 | forced φ₅(3)=3; no prime divides 1, so no implication about a chosen prime at m=1 | Consistent | Retained |
| §7.4 cubic corollary | R=ℤ[∛2][1/6],5 divides m | α globally fixed but b⁵=2+4b≠b in quadratic residue factor; no marked-variable isomorphism | Consistent | Retained |
| Local scalar instance | R=ℤ, inputs X,2,1+X acting on 3 | 0,6,3; evaluation at X=1 would give 3,6,6 | Matches the quotient action | Named in README; three Checks added |
| Coefficient negative exponent | q⁻¹ and a polynomial | coefficient at −1 is 1 versus 0 | Distinguishes the native Laurent carrier | Explicit Check added |
| Coefficient noncollapse | q⁻¹−1 | coefficients at −1,0 are 1,−1, hence element ≠0 | Excludes q=1 specialization | Explicit Check added |
| Factor initial index | i=0 | 1−q has coefficients 1,−1; exponent-zero model gives 0 | Positive indexing retained | Explicit Check added |
| Factor occupied exponents | i=1,2 | 1−q² has q-coefficient 0; 1−q³ has q³-coefficient −1 | Excludes predecessor indexing | Explicit Check added |
| Denominator empty product | no factors | 1 maps to 1; every single generator evaluates to 0 at q=1 | Closure includes the unit | Explicit Check added |
| Denominator repetition and zero | (1−q)²; 0 | multiplicity at 1 is 2; domain product of nonzero factors ≠0 | Closure is multiplicative and excludes 0 | Explicit Check added |
| Factorial initial value | n=0 | P₀=1 and 1/P₀=1 | Empty product retained | Explicit Check added |
| Factorial successor | n=1,2 | P₁=1−q; P₂=1−q−q²+q³ has degree 3 | Excludes repeated first factor | Explicit Check added |
| Zero augmentation | zero free-module vector | value 0; e₁ at q=2 has value −1, so map is not zero | Linearity and normalization agree | Explicit Check added |
| Higher differential sign | e₂, q=2 | e₂+7e₃; augmentation 1/3−7/21=0 | Adjacent-factor sign retained | Explicit Check added |
| Unequal chain lengths | m=12 | C₂,₃={3,6,12}; C₃,₂={2,6}; 18∤12 | Excludes uniform exponent bound | Explicit Check added |
| Chain maximality | m=4,d=1,p=2 | {1,2,4} includes 2; endpoints {1,4} do not | Excludes endpoint-only definition | Explicit Check added |
| Supplier reflection unit | M=ℤ,q=1 | η_M(3)=3; η_LM(3)=3 | Conditional on completion contract | Retained |
| Supplier completed tensor unit | complete M=ℤ,q=1 | L_H(B)⊗̂M≃M, with 1⊗3↦3; 0⊗̂M=0 | Conditional on completion contract | Retained |
| Supplier mapping-space descent | m=1,4 | at 1, limit=Map(E₁,F₁); at 4, long edge is composite of two prime edges | Conditional on finite descent contract | Retained |
| Supplier divisor restriction | m=6,n=2,k=1 | q↦q↦q, and q at the last quotient is 1 | Identity and composition conventions agree | Retained |
| Supplier descent coefficient naturality | A=ℤ→𝔽₂; element 3 | projection then reduction and reduction then projection both give 1 | Base-change convention agrees | Retained |
| Supplier arithmetic fracture | m=4,p=2,n=1 | all three singleton p-completions identify along the chain; n=1 gives one product factor | Conditional on finite descent contract | Retained |
| Supplier ghost lift | A=R=ℤ,m=2 | completion at Φ₁ gives ℤ[[q−1]], at Φ₂ gives ℤ[[q+1]] | Marked reduction agrees | Retained |
| Supplier transition lift | m=2→1 | q mod q²−1 maps to 1 mod q−1 | Frobenius direction agrees | Retained |
| Supplier coefficient uniqueness | split R=ℤ×ℤ | identity sends (1,0) to (1,0), swap sends it to (0,1) | Contractibility is over a fixed marking | Retained |
| Supplier coefficient limit | R=0; self-pair ℤ | factorial inverse limits 0 and the classical H, respectively | Conditional on coefficient contract | Retained |
| Solidification on discrete objects | discrete 0 and sphere | 0 remains 0; sphere retains π₀=ℤ, π₁=ℤ/2 | Spectral homotopy is retained | Conditional contract retained |
| Solid limit and colimit closure | constant zero diagrams | limit=0, colimit=0; shift of zero=0 | Degenerate case consistent | Conditional contract retained |
| Solid tower tensor comparison | n=1,2 | quotient ranks 1,3; independent double rank at n=2 is 9 before balancing | Balancing identifies q₁,q₂ | Conditional contract retained |
| Solid base change | identity and zero scalar map | tensors give original module and 0, respectively | Unit/zero conventions agree | Conditional contract retained |
| Solid uniform realization bound | connective resolutions versus Σ⁻ⁿ𝕊 | lower bounds 0 uniformly versus −n without common bound | Scope preserves both-factor bounds | Conditional contract retained |
| Cross-base Frobenius naturality | ℤ→ℤ[t], R=A and R′=A′ | φₚ(3)=3 on both routes; linearized base action sends 1⊗t to t | Coefficient contract remains explicit | Retained |
| Integral number-field fiber | ξ=0 with common Δ=12 | integral evaluator sends 1 to 1 in R, not merely in each R̂ₚ | Exact integral hypothesis retained | Retained |
| Supported field pairing | ξ and −ξ under F→E | unit pairing sends 1⊗1 to 1 before and after scalar extension | Coherent arithmetic hypothesis retained | Retained |


Pull request: #1425 (roadmap/habiro-rings at bb5d6cb)
