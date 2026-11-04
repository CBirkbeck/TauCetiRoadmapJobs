<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/128#issuecomment-6391961506 -->
Review (codex) of b571a4c

Verdict: accepted

No package findings: 0 P1, 0 P2, 0 P3. This is an index of eight separately owned roadmaps, not a ninth mathematical development. Acceptance covers this index and its contracts, not the correctness or completeness of every target in the eight parts. No conditional supplier gap is declared or needed.

## Previous findings and repairs

The earlier findings are identified by their F-numbers. The repaired passages below were checked against the files and suppliers again, rather than relying on the repair report.

| Earlier finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: links to the analytic index's redirect stubs | Repaired | `packages/ArithmeticStatistics/README.md:19`: “From TauCetiRoadmap.AnalyticNumberTheoryPartII”. Line 21 now links directly to its seven `s5-N` anchors. All seven resolve to substantive sections; locations are recorded below. |
| F02: wrong owner of summation and “every part” | Repaired | README:29: “The completed ArithmeticDirichletSeries supplies Layer 3 … Layer 6 … and Layer 9”. README:17: “Parts IV and VIII take no input from them.” The exact part-by-part supplier map below agrees with the inspected contracts. The repair correctly declined the earlier suggestion “Parts I–VII directly”: Part IV explicitly excludes both analytic parts. |
| F03: Lean docstring and misleading description of target files | Repaired | `packages/ArithmeticStatistics/Suggested.lean:4`: “Arithmetic statistics: target signatures”; lines 6–11 identify README.md as the roadmap and say the index owns no target. README:48 describes headline statements and missing carriers. The index has zero definitions and zero theorem declarations. |
| F04: undefined contracts, dangling references, process wording | Repaired | README:35: “the hypothesis `C(F,φ,Σ)` of Part III's … windowed cubic counting contract”. Both Part III links resolve, including the volume normalization and all tail parameters. README:52 names two downstream roadmaps. The three supplier subsections exist; the previously flagged process wording and nonexistent “displayed” adapters are absent. |
| F05: conflicting 132-entry bibliography | Repaired | README:56: “This index cites two works, in the parts table.” Lines 58 and 60 contain exactly two different works with explicit version conventions, rather than the earlier duplicated register. The two corresponding manifest keys are unique. |
| F06: missing manifest | Repaired | `packages/ArithmeticStatistics/sources.toml:1`: `schema = "tauceti-roadmap-sources/v1"`. Lines 5 and 19 preserve `as-ref-056` and `as-ref-022`; both remain waived. The source check reports 0 problems. |
| F07: index precedes its parts in the merge order | Not repaired; settled, not re-raised | README:7: “this index states no target of its own.” Order positions remain index 99 and parts 124–128, 157–159. The repair report's reason is correct: placement belongs to intake, the order is read-only, and these navigational links are not supply edges. There is no package repair to demand. |

The same-pattern sweep covered all 60 README lines, all 15 Lean lines and both manifest entries. It found no remaining redirect citation, duplicate source key, attribution of Perron/Wiener–Ikehara to the analytic parts, assertion that the analytic suppliers feed Part IV or VIII, undefined local target, or old API-catalogue requirement for this index. Defects mentioned by the repair report in other parts' bibliographies are outside this package.

## Verified sound

The review read all four submitted files. It checked 7 earlier findings, 8 part links, 7 specific analytic Part II sections, analytic Part I §2.5 and Layer 3, 3 completed ArithmeticDirichletSeries layers, 2 Part III contract anchors, and 4 downstream section references. The 32-row adversarial table records the computations and structural counts. The index contains 0 mathematical targets, 0 definitions, 0 API blocks and 0 Lean declarations. The source register contains 2 works: 1 locator was read in cached source text and 1 remains waived and unread.

### Principles and form

The index imports ownership instead of duplicating the parts' constructions. There is no route-specific restriction, good-prime exclusion, computational algorithm, source passage, sorry'd data, `set_option`, `lemma`, placeholder proposition, or axiom in the submitted files. The general projective cubic contract retains nonprincipal modules and stabilizers; the counting contracts preserve their analytic hypotheses.

The required summary, scope, conventions, supplier, build, consumers and references sections are present. Three `From TauCetiRoadmap.<Name>` subsections identify the shared external suppliers. Per-definition API lists, three Checks, layer examples and layer dependencies are inapplicable to an index with no owned definition or layer; adding them here would recreate the parts. Shape was compared with `Completed/ArithmeticDirichletSeries/README.md`, `TauCetiRoadmap/HeightsAndUnits/README.md` and `TauCetiRoadmap/QuadraticFormInvariants/README.md` on main.

All mathematical notation in the index is either explained there or linked to its owner. The source-derived wording is a short description of the subject, not a copied theorem statement. Metadata is the single assignment `topic = "math.NT"`.

### Computed adversarial pass

Each row covers the identified assertion, convention or contract. Values below are actual computations, including explicit negative controls. Imported theorem checks verify the index's description and normalization; they do not certify a proof of the supplier theorem. No unchanged passage was accepted merely because the previous review called it sound.

| Statement/location | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Summary and scope, README:3,7: eight parts, no ninth owner | All part headings; index declarations | Eight owners; layer sequence `0,1,2,3,3,4,5,5`; index targets = 0, Lean declarations = 0 | Scope and ownership agree | None |
| Shared layer numbering, README:7 | Sections of IV/V and VII/VIII | IV∩V = {3.2,…,3.9}, cardinality 8; VII∩VIII = ∅, cardinality 0 | The warning to name the Layer 3 part is accurate | None |
| Shared analytic objects, README:9,21 | Seven requested analytic Part II objects | Seven links and seven substantive matching sections; no index construction of any of them | Direct ownership preserved | None |
| Field counts use base-field isomorphism classes, README:13 | ℚ; nonnormal cubic ℚ(∛2); cyclic cubic ℚ(ζ₇)⁺ | Embedded-field counts = 1,3,1; automorphism orders = 1,1,3; cubic weights give `3·(1/3)=1`, `1·(3/3)=1`, matching one isomorphism class each | Matches Part V's headline convention; unweighted embedded counts would fail | None |
| Stabilizer weights are part of a theorem, README:13,21 | Split cubic algebra; quadratic-factor algebra; cyclic and nonnormal cubic fields | Automorphism orders 6,2,3,1; reciprocal weights 1/6,1/2,1/3,1. Replacing all by 1 changes the first three | Supplier distinguishes the models | None |
| Signed cubic discriminants, README:13,21 | `u³−v³`, `uv(u−v)`, zero form | Native cubic polynomial gives −27,1,0 respectively; mod 2: 1,1,0; mod 3: 0,1,0 | Signs and bad characteristics retained | None |
| Twisted row action, README:21 | `u³−v³` under diag(2,1), unipotent [[1,1],[0,1]], and scalar 2I | Discriminants −108 = 2²·(−27); −27 = 1²·(−27); −432 = 4²·(−27). Untwisted diag(2,1) instead gives −1728 | Basis/action normalization agrees with analytic Part II §5.4 and statistics Part I | None |
| Projective cubic equivalence, README:21 | Split algebra; zero form; nonprincipal determinant class I | `uv(u−v)` has discriminant 1 and split automorphism order 6. Zero form has discriminant 0 and square-zero rank-three algebra. For V=O⊕I, determinant of C/O is I⁻¹; it is nontrivial when I is nonprincipal | Full algebra correspondence includes the degenerate algebra; étale restriction excludes it; free-only model fails | None |
| Local Haar measures are specified, README:13,35 | Standard SL₂ integral model at p=2,3; global ℚ normalization | `#SL₂(𝔽₂)/2³=6/8=3/4`; `#SL₂(𝔽₃)/3³=24/27=8/9`; global expression `ζ(2)∏p(1−p⁻²)=1` | Local group volumes cannot independently be set to 1 while retaining the global normalization | None |
| Height cutoffs and denominators, README:13 | Minimal nonsingular short pairs with strict `max(4|A|³,27B²)<X` | X=1 and 4: 0 pairs; X=5: 2 pairs (±1,0); X=28: 8 pairs. At X=4 the inclusive count is 2 while the strict count is 0 | Cutoff and nonempty denominator matter; empty totalized average 0 does not justify a limiting average | None |
| Order of limits, README:13 | `f(d,q)=d/(d+q)` for positive d,q | First d→∞ then q→∞ gives 1; reverse order gives 0 | Convention separates genuinely different limits | None |
| Arithmetic conjectures remain propositions, README:13 | Actual index declarations | Assumed conjecture axioms = 0; unconditional conjecture theorems = 0; no free Prop field | No hidden assumption or unconditionalization here | None |
| Distribution need not imply moment convergence, README:13 | Xₙ=n with probability 1/n, otherwise 0 | At n=2 and 10, E[Xₙ]=1; probabilities outside a fixed neighbourhood of 0 are 1/2 and 1/10 and tend to 0; limit variable has mean 0 | Explicit counterexample supports the convention | None |
| Parts IV and VIII use none of the shared analytic contracts, README:17 | Their supplier sections, including negative mentions | Direct shared-contract count = 0 for each. IV explicitly excludes both analytic parts; VIII has 0 mentions of either part or ADS | Corrected claim holds | None |
| Cubic and large-sieve consumer map, README:21 | I,II,III,V,VI,VII | Core cubic sections requested: 6,2,6,6,4,0 respectively; V additionally uses §5.8. Large-sieve consumers = {I,III,V,VII}, cardinality 4 | Exact map agrees; VII is not described as a direct cubic consumer | None |
| Analytic Part I contracts, README:25 | Four consumer contracts; Dedekind residue at ℚ and ℚ(i) | Consumers = {I,III,V,VII}; §2.5 users named here = {I,V}. Residue formula: 2/(2·1)=1 for ℚ; `2π/(4·2)=π/4` for ℚ(i) | Continuation/residue and Layer 3 attribution resolve | None |
| ArithmeticDirichletSeries consumer map, README:29 | I,III,V contracts | Layer sets are {6,9}, {3,6,9}, {3,6,9}, respectively | Exact attribution repaired | None |
| Euler-product input, README:29 | Two local geometric factors with ratios 1/2 and 1/4 | `(∑k 2⁻ᵏ)(∑k 4⁻ᵏ)=2·(4/3)=8/3`; product and iterated-sum sides agree. Without multiplicativity, f(2)=f(3)=1,f(6)=0 gives product coefficient 1 versus supplied coefficient 0 | Native supplier requires multiplicativity and convergence; index does not invent an unrestricted product | None |
| Perron input, README:29 | x=c=T=1; T→∞ with c=1 | Finite endpoint kernel `arctan(1)/π=1/4`; limit is 1/2, not 1 | Source owner preserves endpoint normalization | None |
| Wiener–Ikehara input, README:29 | a=0,κ=0; aₙ=1 for n≥1,κ=1 | At integral cutoff N≥1, normalized sums 0/N=0 and N/N=1; conclusions are 0 and 1. Nonnegativity and actual half-plane series sums remain required | No vacuous totalized-series replacement | None |
| Build narrative and part scopes, README:33,39–46 | Eight README layer headings | I–III give 3 early layers; IV,V share layer 3; VI gives 4; VII,VIII share 5. VIII's geometric section range has 11 members, §§5.12–5.22 | Table matches the owners | None |
| Windowed cubic hypothesis, README:35 | Parts II,III,VII; divided coordinates (1,0,0,1), (0,1,0,1) | Normalized discriminants 1,4; ordinary discriminants −27,−108 = −27·1,−27·4. At char 3, first normalized value is 1 while ordinary value is 0 | Normalization and characteristic-zero orbit scope are retained | None |
| Seven-item C contract and measure factor, README:35 | Items 1–7; discriminant D=4; zero weight negative control | C requires all seven specified components, including volume one; dropping a tail leaves only 6/7, not C. Covolume factors `4⁻²=1/16=4⁻³ᐟ²·4⁻¹ᐟ²=(1/8)(1/2)`. Zero weights give numerator 0 and cannot satisfy a positive asserted main term | The index keeps the actual analytic hypothesis and normalization | None |
| Even-degree tail inequalities, README:35 | n=4; (δ,η,ξ)=(1/2,1/100,0), (1/100,1/2,0) | First: τ=1/50, 9τ=9/50<5, τ<1. Second: τ=50, 9τ=450>5 and τ>1 | Admissible and inadmissible parameters distinguished | None |
| Strictness of tail condition, README:35 | n=4; (δ,η,ξ)=(1,3/5,0), (1,5/9,0) | τ=3/5<1 but 9τ=27/5>5; τ=5/9<1 but 9τ=5, failing the strict inequality | Keeping only τ<1, or weakening < to ≤, fails | None |
| Four-rank moments and their owner, README:43,58 | Cached Theorem 1, α=0,1,2; Part V §3.8 | α=0 empty product mean 1 for both signs. Put Y=2^rk₄: E⁻(Y−1)=1 gives E⁻Y=2; E⁺(Y−1)=1/2 gives E⁺Y=3/2. E⁻[(Y−1)(Y−2)]=1 gives E⁻Y²=5; positive version 1/4 gives E⁺Y²=11/4 | Author manuscript p.3 supports the subject and all nonnegative integer moments; narrow class-group convention confirmed | None |
| Selmer-average owner, README:44 | Part VI's two headline locations and module description | Two named checks resolve: mean-two-Selmer theorem at line 127 and second-moment theorem at line 181; index redeclarations = 0 | Correct routing; no proof of these averages inferred from small examples | None |
| Function-field three-Selmer bound routing, README:45,60 | Part VII §5.9; q=5,101 in its displayed constants | q=5: C≈5.127281271, L≈1.249999232, 1+C/L≈5.101827537. q=101: C≈3.060903059, L≈1.01, bound≈4.030597088. Limits C→3, L→1 give 4 | Routing and algebra agree. de Jong source itself remains unread and waived; q=3 is excluded, q=1 gives zero denominators | None |
| Named downstream consumers, README:52 | Three HRPO citations and one MLE citation | 3+1=4 section references resolve to 4 matching owner sections; zero supplier edges are introduced by this consumer paragraph | Correct direction | None |
| Reference register, README:56–60 and sources.toml | Titles, keys, version locators | README works = 2; manifest works = 2; distinct keys = 2; duplicate keys = 0; sources check problems = 0 | One key per work preserved | None |
| Acceptance-test form and metadata | Original file; generated signature sweep | Imports: 1 Mathlib, 0 TauCeti; definitions=theorems=sorries=0; both elaborations exit 0 with 0 messages; metadata has 1 topic value | No missing index headline, hypothesis loss or padding | None |

The domains needed for ring, group, field, characteristic, empty-family and total-function tests are supplied by the named parts; the index adds no carrier that enlarges those domains. Nonabelian and cyclic behavior was tested through the split cubic stabilizer S₃ (order 6), cyclic cubic stabilizer C₃ (order 3), and the trivial stabilizer. There is no local “iff”, constructed map, existential operation or arbitrary-data theorem in this index requiring further model separation.

### Sources and seeded sample

The supplied seeded selection says that no target was found by heading. The index has 0 owned theorem targets, so the requested 15-target sample has 0 selectable entries; no sample of fifteen is claimed. No locator is marked unverified in the README. Both actual bibliography entries were nevertheless checked as follows.

| Key and index location | Text/locator checked | Outcome |
| --- | --- | --- |
| as-ref-022, README:43,58 | Cached legal author manuscript: title at lines 5–7; fundamental discriminants and narrow class group at lines 13–20; moment definitions at lines 23–27,43–56; Theorem 1 at lines 95–98, author p.3 | Theorem number, page, prime 2, integer α≥0 and both signs agree. The index explicitly uses manuscript pagination, so published pagination is not substituted. Waived manifest status remains untouched. |
| as-ref-056, README:45,60 | Manifest's settled Theorem 1.2 locator, author DVI; matching owner at `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md:1150` and its source paragraph at line 1158 | Correctly routes to the function-field three-Selmer bound. Source theorem and pagination could not independently be read. The waiver is retained and no new request or replacement key was made. |

No new work needed fetching, and neither existing manifest entry was rewritten. No missing-reference request was created. One harmless source misprint noticed in the cached text is recorded under Source issues.

### Supplier citations resolved

Main was `ae2562cd6d39ddeac99ac18bdf78e6e46a068586`. Open-head resolution used the supplied 2026-10-25T00:51:33Z index. The following are repository-relative source locations; the heads matter because section contents were read, not merely their names matched.

| Citation | Resolved location |
| --- | --- |
| AnalyticNumberTheoryPartII §§5.4,5.5,5.6,5.7 | Head `ed5b737`, `TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md`:763,782,807,827. Full ring action, projective equivalence, weighted coefficients and uniform small-degree count are present. |
| AnalyticNumberTheoryPartII §§5.21,5.28,5.29 | Same file:1193,1553,1581. Entire pole clearance/residues, pole-excluding convexity and the quadratic large sieve are present. |
| AnalyticNumberTheoryPartI §2.5, Layer 3 | Head `4ba2e21`, `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md`:1117,2028. The shared-contract consumers are verified at statistics I:62, III:60, V:49, VII:41. |
| ArithmeticDirichletSeries Layers 3,6,9 | Main, `Completed/ArithmeticDirichletSeries/README.md`:190,256,337. The index cites the completed roadmap on main, not any open revision. |
| Windowed cubic counting contract | Head `6f16f6c`, `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md`:2270–2386; definition at 2272, volume normalization at 2380, factor identity at 2382. Consumed at Part VII:49. |
| Binary summed tail | Same Part III file:1917–1937; the conditional even clause at 1919. Retained in Part V's sieve counts at 2461 and arithmetic Bertini at 2481. |
| Part I | Head `3b1a24f`, `TauCetiRoadmap/ArithmeticStatisticsPartI/README.md`:178, Layer 0. §0.1 at 182 and §0.22 at 2531. |
| Part II | Head `a7cc3be`, `TauCetiRoadmap/ArithmeticStatisticsPartII/README.md`:62, Layer 1. §1.12 at 1821. |
| Part III | Head `6f16f6c`, `TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md`:78, Layer 2. §2.17 at 1967. |
| Part IV | Head `92b9193`, `TauCetiRoadmap/ArithmeticStatisticsPartIV/README.md`:61, Layer 3; analytic exclusion at 53. |
| Part V | Head `7f06cfc`, `TauCetiRoadmap/ArithmeticStatisticsPartV/README.md`:79, Layer 3; four-rank target at 977. |
| Part VI | Head `88461f2`, `TauCetiRoadmap/ArithmeticStatisticsPartVI/README.md`:69, Layer 4. |
| Part VII | Head `cbcd49e`, `TauCetiRoadmap/ArithmeticStatisticsPartVII/README.md`:63, Layer 5; three-Selmer target at 1150. |
| Part VIII | Head `b3b98cc`, `TauCetiRoadmap/ArithmeticStatisticsPartVIII/README.md`:188, Layer 5. |
| HeightsRationalPointsAndObstructions | Head `82cf8af`, `TauCetiRoadmap/HeightsRationalPointsAndObstructions/README.md`:39 explicitly consumes Part I §0.22, Part II §1.12 and Part III §2.17. |
| ModularityAndLanglandsExtensions | Head `2d70821`, `TauCetiRoadmap/ModularityAndLanglandsExtensions/README.md`:1387 explicitly consumes Part I §0.1. |

The package has no `*Needs:*` line. Every supplier paragraph was read. The three actual external suppliers are analytic Parts I and II (merge-order positions 96 and 97, before index 99) and ArithmeticDirichletSeries on main. References to the eight statistics parts describe ownership and navigation; they are not prerequisites of a theorem in this target-free index.

The prescribed dependency check printed:

```text
depcheck: 44 roadmaps, 443 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line. Citation resolution found no cross-roadmap citation or own Lean name missing. Its automatic library-name search was unavailable on the host, so it was not used as evidence about the pins; direct file inspection supplied that evidence below.

### Library and duplication audit

The actual checked revisions equal the manifest pins: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

| Native object opened at the pin | Exact location and limits |
| --- | --- |
| `Cubic`, `Cubic.discr` | `Mathlib/Algebra/CubicDiscriminant.lean:43` has four coefficient fields a,b,c,d and no nonzero-leading-coefficient or separability condition. At line 461 the body is `b²c²−4ac³−4b³d−27a²d²+18abcd`. The root comparison at 465 explicitly requires a≠0. These explain the degenerate computations above. |
| `NumberField.dedekindZeta_residue`, `NumberField.tendsto_sub_one_mul_dedekindZeta_nhdsGT` | `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:56`,77. The residue includes the regulator, class number, torsion order and square root of the absolute discriminant. The limit is from real s>1; it is not a meromorphic continuation theorem on all ℂ. |
| `TauCeti.EulerProductData` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean:56`: fields `toIdealArithmeticFunction` and `isMultiplicative`. It does not bundle analytic convergence or a finite bad set. |
| `TauCeti.EulerProductData.hasProd_eulerFactor` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/EulerProduct/Analytic.lean:349` requires `Summable (idealTerm K D.toIdealArithmeticFunction s)`; convergence only after regrouping by norm is insufficient. |
| `TauCeti.truncatedPerronKernel`, `TauCeti.truncatedPerronKernel_one` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Basic.lean:140`,203. Real-parameter factor (2π)⁻¹; endpoint value arctan(T/c)/π with c≠0. |
| `TauCeti.perronFormula` | `TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Ideal.lean:161`: x>0, c>0 and `LSeriesSummable`, with half-weight endpoints. The off-endpoint specialization at 169 adds the actual exclusion. |
| `TauCeti.LSeries.wienerIkehara` | `TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301`: nonnegative coefficients, `LSeriesHasSum` for every Re s>1, a separate continuous boundary function G, and the residue identity. The index preserves these conditions through the completed roadmap. |

Object searches used cubic actions/coefficients, windowed counting, summed tails, Davenport–Heilbronn, Cohen–Lenstra and Selmer averages, not just this package's names. The unrestricted `roadmaps grep` search returned 333 hits across main/open heads. Hits include the eight parts, analytic Part II, ArithmeticDirichletSeriesPartII, HeightsRationalPointsAndObstructions, InductionRestrictionPartII, ArithmeticGaloisDuality and InverseGaloisAndArithmeticFundamentalGroups. They concern the imported objects and applications. This index redeclares none of them.

The board package index was read before making ownership conclusions. The available board package files and both pinned libraries were searched directly; all six hits for that statistical-object search in the local board/library pass belong to this index's prose. Other board branches were not represented by that local search; no claim that their packages are absent is made. The main/open-head search covers the supplied roadmap heads. In addition, an exact-namespace check found zero foreign `TauCetiRoadmap.ArithmeticStatistics` namespaces: the eight `ArithmeticStatisticsPart…` namespaces are different. No fully qualified declaration collision is possible in this empty file.

### Headline theorems, elaboration and padding

The README advertises series headlines, with these owners:

- Uniform orbit counts and sieve estimates: Part III, including its conditional even-degree binary tail and windowed cubic contract.
- Field densities: Part V; `FieldStatistics.davenportHeilbronn_cubicFields` and `FieldStatistics.bhargava_quarticQuinticFields`, `TauCetiRoadmap/ArithmeticStatisticsPartV/Suggested.lean:29`,120.
- Class-group moments: Part V; `FieldStatistics.fouvryKluners_fourRankMoments`, same file:56.
- Selmer averages: Part VI; `Selmer.average_twoSelmer_largeFamily` and `Selmer.secondMoment_twoSelmer_le`, `TauCetiRoadmap/ArithmeticStatisticsPartVI/Suggested.lean:127`,181.
- Finite-group probability and moment tools: Part IV; quadratic-intersection laws and conditional twists: Part VII; geometric/function-field comparisons: Part VIII.

This index owns none of those theorems. Repeating them here would violate single ownership. Its module docstring explicitly accounts for all advertised headline categories and explains that none is omitted here for lack of a carrier. The routing statement is not a separate certification that every part's acceptance test is complete.

The required `lake env lean <absolute Suggested.lean path>` was run from the pinned content checkout and returned exit 0, with no diagnostics or warnings. The only import is `Mathlib`; no Tau Ceti module build was necessary.

A scratch copy was generated after mechanically enumerating all own declarations. The enumeration returned 0, so the mandated `#check @name` list is empty; that copy also elaborated with exit 0 and no messages. There is no binder that could have dropped a standing hypothesis, and nothing changed. The earlier automatic signature-extraction failure is not reproduced by elaborating the submitted file.

The one-tactic padding probe has 0 sorried declarations to try. No API theorem, boundary case, example or definition is present, so no deletion is needed.

## Not verifiable

- The seeded sample has no targets: the supplied selection found none by heading, and this index owns none. Fifteen independent source theorems were not sampled.
- **as-ref-056, Theorem 1.2:** the author DVI text is not present as a readable cached extraction. The prior repair records an unsupported DVI and a failed DOI access. Its human waiver is settled; it was not fetched or requested again. The exact source theorem, its constants and pagination remain uncertified here, although the part and locator to which the index points were resolved.
- **Printed typography of as-ref-022 equation (2):** the line-numbered extraction is readable, but a PDF page renderer is unavailable. The source issue below describes the sign shown in that extraction; published-version typography and any correction were not checked.
- This review does not certify all targets, bibliographies or Lean files of the eight parts, and the local board-package search does not cover other board branches' unavailable working copies. Neither limitation leaves an unowned target in this index.

## Source issues

- **Misprint** in as-ref-022 at equation (2), author manuscript p. 2 (as-ref-022 line 93): the source says the negative-discriminant numerator is divided by the positive-discriminant count; it should be divided by the negative-discriminant count, consistently with M⁻; affects nothing.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b571a4cd35d3bd8aa74cb9d292e21421cdc19a60", "job": "REV-PKG-ArithmeticStatistics~2", "model": "gpt-6-astra", "worker": "chris-7"} -->
