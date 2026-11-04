<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/128#issuecomment-6392078921 -->
Red team round 1 pass a (codex) of b571a4c

Verdict: needs_changes

1. **F01** (P2) The index overstates the parts' acceptance coverage

   **Location:** packages/ArithmeticStatistics/README.md:48 and packages/ArithmeticStatistics/Suggested.lean:7–11: “Every headline theorem of the series … whose own target file states it … or names the carrier it lacks.”

   **Claim:** Every part already states each headline against the pins or identifies the carrier preventing its statement.

   **Witness:** TauCetiRoadmap/ArithmeticStatisticsPartV/README.md:1488 states quadratic-tower asymptotics, including degree eight. Its Suggested.lean contains neither that theorem nor its carrier explanation, including module lines 6–13 and omitted-target catalogue lines 557–654.

   **Exact repair:** Replace README line 48 with: “Each part's README is its full mathematical specification. Consult that part's `Suggested.lean` for its target signatures and recorded carrier limitations.” Replace Suggested.lean's module-docstring prose with: “The roadmap is `README.md`; this file is not the roadmap. ArithmeticStatistics is the index of ArithmeticStatisticsPartI–PartVIII. All mathematical targets belong to those parts. This index owns no headline theorem to state against the pinned Mathlib and Tau Ceti and introduces no definition.”

   **Repair check:** For the Part V target at `m=3`, the degree is `2³=8`; its existing degree-at-most-five asymptotics do not cover it. The replacement locates ownership without certifying nonexistent acceptance coverage. It does not duplicate that theorem here. This is a finding about the index's assertion, not a request to edit Part V in this package.

## Verified sound

Read every line of packages/ArithmeticStatistics/README.md (60 lines) and Suggested.lean (15 lines), the repository README and CONTRIBUTING, and the previous repair report. Reviewed the current supplier and consumer sections listed below. Read Part V's entire 658-line Suggested.lean to verify R01; this was a coverage check, not a mathematical review of that separate package.

Counts: **0 package Lean declarations; 0 bold mathematical targets; 0 package definitions; 0 package Checks; 0 literary source locators independently certified; 26 cross-roadmap location records checked across 13 roadmaps** (18 section/target records and eight part-folder links). The sole bold README span is “Summary.” The computed ledger below also tests conventions and the imported contracts; those tests are not counted as package Checks. Both literary references are settled waived sources.

### Declaration and headline inventory

| Item | Section, variables and instances | Computed inventory / coverage | Result |
| --- | --- | --- | --- |
| Every Suggested.lean declaration | Namespace `TauCetiRoadmap.ArithmeticStatistics`; no section variables, universes, instances or `include` blocks | Theorems 0; definitions 0; structures 0; instances 0; examples 0; binder comparisons 0 | Empty declaration table. No declaration can lose a hypothesis, collide with a supplier name or constitute padding. |
| Every bold README target | README:3, Summary | Bold spans 1; mathematical target headings 0 | This is an index, not an additional owner of the parts' results. |
| Headline families named in README:3,33,39–46 | Counts/densities, class-group moments, Selmer averages, finite-group and quadratic laws, geometric/function-field comparisons | Field/class statistics → V; Selmer averages → VI and conditional VII; probability → IV/VII; geometry → VIII; foundational stages → I–III | No independently owned headline needs a signature here. The claim about the parts' complete acceptance coverage is R01. |
| Acceptance syntax and policy | Whole Suggested.lean | Imports: exactly `Mathlib`; `sorry` bodies 0; `lemma` 0; `set_option` 0; `#check` 0; free Prop stand-ins 0 | No package signature or padding finding. |

### Supplier and consumer locations

All roadmap paths in this table are relative to their respective repository roots. Open-roadmap sections were read through `roadmaps show` at the indexed heads; ArithmeticDirichletSeries was read from Completed on main.

| Index claim | Current location inspected | Comparison |
| --- | --- | --- |
| README:21, §5.4 | TauCetiRoadmap/AnalyticNumberTheoryPartII/README.md, `s5-4` | Twisted row-variable GL₂ action; ordinary cubic discriminant; all commutative rings. |
| README:21, §5.5 | Same file, `s5-5` | Rank-two projective modules, stabilizers and determinant-line discriminants are expressly included. |
| README:21, §5.6 | Same file, `s5-6` | Étale generic fibres, finite weighted discriminant fibres, zero coefficient at n=0. |
| README:21, §5.7 | Same file, `s5-7` | Constant chosen before the degree-d field and positive discriminant norm. |
| README:21, §5.21 | Same file, `s5-21` | Two possible simple poles, specified residues and entire pole clearance. |
| README:21, §5.28 | Same file, `s5-28` | Convexity bound retains the pole-free condition abs(t)≥1. |
| README:21, §5.29 | Same file, `s5-29` | Squarefree quadratic sieve, corrected nonsquarefree diagonal and primitive-real moment. |
| README:25, §2.5 | TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1117 | Dedekind continuation and real-side residue comparison. |
| README:25, Layer 3 | Same file:2028 | Multiplicative means, smooth numbers and moments; arithmetic partial-summation applications. |
| README:29, Layer 3 | Completed/ArithmeticDirichletSeries/README.md:190 | Euler products with multiplicativity and absolute-convergence hypotheses. |
| README:29, Layer 6 | Same file:256 | Abel/Perron, retaining endpoint half weights and convergence conditions. |
| README:29, Layer 9 | Same file:337 | Nonnegative coefficients, genuine sums and a separately continuous boundary remainder. |
| README:35, window contract | TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:2272; PartVII/README.md:49 | The same seven-item C(F,φ,Σ), including both tails and SL₂ volume one. |
| README:35, even summed tail | TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:1919; PartV/README.md:2461 | Same δ,η,ξ,τ inequalities and additional counting hypotheses; even n≥4. |
| README:52, pencil carrier | TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:2531; HeightsRationalPointsAndObstructions/README.md:39 | §0.22, signed determinant coefficients. |
| README:52, pencil dictionaries | TauCetiRoadmap/ArithmeticStatisticsPartII/README.md:1821; same consumer:39 | §1.12, integral orbits and Selmer/Fano comparisons; chart restrictions retained by consumer. |
| README:52, finite congruences | TauCetiRoadmap/ArithmeticStatisticsPartIII/README.md:1967; same consumer:39 | §2.17, actual CRT residue density. |
| README:52, relative density | TauCetiRoadmap/ArithmeticStatisticsPartI/README.md:182; ModularityAndLanglandsExtensions/README.md:1387 | §0.1, relative density in the specified height ordering. |
| README:39–46, eight part links | TauCetiRoadmap/ArithmeticStatisticsPartI–PartVIII/README.md, each separately opened | Eight existing folders and matching scopes; layer/section comparisons are recorded below. |

The consumer map was checked against Part I:62, II:52, III:60–62, IV:53, V:49, VI:53, VII:41,49 and the full-text supplier-name search in VIII. AnalyticNumberTheoryPartI:3423 and PartII:3806 identify the statistics parts as consumers, not inputs. No reverse supplier edge was found.

### Computed statement and convention ledger

The values below test this index's claims and the conventions it imports. A successful finite example does not certify an imported asymptotic theorem's proof. “Retain” means no change to this index; R01 is the exception.

| Statement | Instances tried | Values computed on each side | Result / change |
| --- | --- | --- | --- |
| README:7, layer assignment | Eight actual part headings | Index `(0,1,2,3,3,4,5,5)`; parts `(0,1,2,3,3,4,5,5)` | Equal; retain. |
| README:7, Layer 3 ambiguity | Part IV and V section sets | IV `{3.1,…,3.11}`; V includes `{3.2,…,3.9}`; intersection `{3.2,…,3.9}` | Part qualification is necessary and stated. |
| README:7, disjoint Layer 5 numbering | VII and VIII section sets | VII `{5.1,…,5.11,5.23,…,5.32}`; VIII `{5.12,…,5.22}`; intersection empty | Retain. |
| README:9,21, cubic supplier normalization | f=x³−y³ over Q; g=diag(2,1) | Disc(f)=−27; g·f=4x³−y³/2; Disc(g·f)=−108=4(−27) | Matches determinant-square covariance. |
| Same action, wrong-model control | Scalar 2I and unipotent [[1,1],[0,1]] | Scalar sends f to 2f, discriminant −432=16(−27), not 8f; unipotent gives coefficients (0,−3,−3,−1), discriminant 81−108=−27 | Twist and row convention distinguished. |
| Same action in small characteristics | f=x³−y³ over F₂ and F₃; zero ring | Disc=1 in F₂; Disc=0 in F₃ and f=(x−y)³; zero-ring identity gives 0=0 | Construction retains these rings; étale restriction does not admit the F₃ example. |
| README:21, projective-algebra coverage | f=xy(x−y); f=0 | Split form: Disc=1, algebra O³, #Aut=6. Zero form: Disc=0, square-zero algebra O⊕V∨ | Degenerate algebra exists; its generic fibre is not in the étale coefficient family. |
| Same contract, nonprincipal control | O=Z[√−5], I=(2,1+√−5), V=O⊕I | Norm(I)=2; a²+5b²=2 has no integral solution; det(C/O) has class I⁻¹≠1 | Cannot replace all projective modules by O²; supplier expressly retains them. |
| README:21, weighted coefficients | Split O³, zero form, coefficient n=0 | Split discriminant norm=1 and weight=1/6; square-zero discriminant=0; coefficient at 0=0 | Family and zero-index boundaries agree. |
| README:21, uniform small-degree count | F=Q, n=1; E=F; n=0 | Identity extension contributes 1; D(Q)=h₂(Q)=1, so RHS=C; relative norm kernel cardinality=1; n=0 excluded | Uniform constant may accommodate C≥1; no missing zero case. |
| README:21, pole-aware supply | Cleared zeta near s=1 and s=5/6 | If residues are r₁,r₅, cleared limits are r₁/6 and −r₅/6, not forced zero | Supplier retains limits separately from totalized products. |
| README:21, convexity boundary | σ=−1/2,3/2; t=0 | D exponents are 9/2+ε and 1/2+ε; height exponents 4n+ε and ε; t=0 violates abs(t)≥1 | No pole included by index's cited bound. |
| README:21, quadratic sieve | M=1,N=3, a₁=1,a₃=±1; m=n=3 | LHS=0 for minus, 4 for plus; squared-coefficient sum=2; RHS=8Cε·3^ε in both; Jacobi(3,3)=0 | Signs and noncoprime zero matter; supplier retains both. |
| README:13, isomorphism-class counts | Non-Galois cubic, cyclic cubic, identity extension | Embedded subfields 3,1,1; automorphisms 1,3,1; sum of #Aut/degree per class=1,1,1 | Matches base-field-isomorphism convention, including S₃ versus cyclic closure. |
| README:13, stabilizer weights | Trivial stabilizer; split cubic S₃; cyclic cubic C₃ | Reciprocal weights 1,1/6,1/3, rather than 1,6,3 | Denominators positive; retain explicit weights. |
| README:13, signed discriminants | Q(i), Q(√5) | Signed values −4,+5; absolute heights 4,5 | Sign and height are different data. |
| README:13, local Haar normalization | Additive Z₂,Z₃ with total mass 1 | Mass(2Z₂)=1/2; mass(3Z₃)=1/3; quotient indices 2,3 | Dyadic place retained; normalization has measurable consequences. |
| README:13, height cutoffs | Singleton of height 1 at cutoff 1 | Inclusive count=1; strict count=0 | Equality requires an explicit boundary argument; retain. |
| README:13, order of limits | a(X,M)=1 when X≤M, else 0 | lim_M lim_X a=0; lim_X lim_M a=1 | Limits cannot be interchanged without hypotheses. |
| README:13, conjectural status | Proposed arithmetic distribution proposition | New axioms in package=0; unconditional theorem declarations=0 | No conjecture installed as an axiom or theorem here. |
| README:13, positive limiting denominator | Empty family; zero numerator with denominator X | Empty ratio is totalized 0/0=0; normalized denominator=0. Second ratio 0/X=0, normalized denominator=1 for X>0 | Empty family cannot discharge the required positivity. |
| README:13, distribution versus moments | P(X_n=n²)=1/n, P(X_n=0)=1−1/n | P(X_n≠0)=1/n→0; E(X_n)=n→∞; E(0)=0 | Index's warning is necessary and correct. |
| README:17,21, cubic/sieve consumer sets | Contracts of all eight parts | Cubic consumers `{I,II,III,V,VI}` on both sides; §5.29 consumers `{I,III,V,VII}` on both sides; IV and VIII analytic inputs=0 | Retain. |
| README:25, Part I analytic consumers | Contract mentions and §2.5 example | Consumer sets `{I,III,V,VII}` agree; residue of Q(i)=(2π·1)/(4·2)=π/4 | Correct section and residue normalization. |
| README:29, Dirichlet-series consumer layers | I, III and V contracts | I `{6,9}`; III `{3,6,9}`; V `{3,6,9}` on both sides | Retain. |
| Same summation/boundary contracts | Empty Euler product; Perron x=c=T=1; zero Wiener–Ikehara data | Product=1; Perron kernel=arctan(1)/π=1/4 and T→∞ limit=1/2; a=F=G=κ=0 gives ratio 0→0 | Boundary and zero-residue cases retained. |
| README:35, cubic counting mass | Two integral orbits with all stabilizers trivial; selector 1 or 0 | D=2; weights 1/2,1/2 sum to 1; zero selector gives 0+0=0 with D still 2 | Positive denominator is not replaced by the selector. |
| Same contract, volume and identity | d=√D_F=2; local ratio constantly 1 | d⁻⁴=1/16=d⁻³d⁻¹=(1/8)(1/2); Selmer mean includes identity, 1+1=2 | SL₂ normalization and identity contribution preserved. |
| README:35, even-tail inequalities | n=4, (δ,η,ξ)=(1/2,1/100,0) | τ=1/50<1; (2n+1)τ=9/50<5; fixed-sieve exponents 4.99,4.02,0.18 are all <5 | Valid parameter test; still conditional on counting estimates. |
| Same inequalities, negative controls | n=4, (δ,η,ξ)=(1,3/5,0), then (1/100,1/2,0) | First τ=3/5<1 but 9τ=27/5>5; second τ=50>1 and 9τ=450>5 | Both controls rejected; retain both displayed inequalities. |
| Same formula, junk/domain controls | δ=0; even n=2 | Division by δ undefined in ordinary arithmetic (totalized to 0 in Lean); degree-two tail is a separate supplier target | δ>0 excludes division case; linked even clause explicitly starts at n=4. |
| README:43, FK target attribution | Part V formula, k=0,1 | Subspace counts N(0,2)=1,N(1,2)=2,N(2,2)=5; moment coefficients at k=0 are 1,1; at k=1 are 2,3/2 | Internal normalization verified; external source locator remains waived. |
| README:45, de Jong target attribution | Part VII's rational main-bound factors, q→∞ and q=1 | C(q)→3, L(q)→1, 1+C/L→4; q=1 has zero denominator factors | Owner restricts to sufficiently large prime powers; external source locator remains waived. |
| README:48 and Suggested:7–11, coverage | Part V tower asymptotic at m=3 | Degree=8; corresponding headline declarations=0 and specific carrier notes=0; supplied low-degree asymptotics stop at 5 | R01; narrow the index's assertion. |
| README:52, pencil convention | Scalar pencils at n=0,1,2,3 | Invariants 1, ax−by, −(ax−by)², −(ax−by)³; for positive-dimensional zero pencils invariant=0 | Supplier and consumer use the same signed determinant. |
| README:52, actual finite residue density | Allowed pairs (0 mod 3,0 mod 5),(1 mod 3,1 mod 5) | Actual count 2/15; marginal product (2/3)(2/5)=4/15 | Cited finite-congruence contract uses 2/15. |

### Pins, ownership, dependencies and policy

The content checkout is main `ae2562c`; Mathlib is `6b7abb3c7686292736be2955bd3eb9ebf63b456a`; Tau Ceti is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Both library HEADs agree with lake-manifest.json. Read the native coefficient definition `Cubic` and `Cubic.discr` in Mathlib/Algebra/CubicDiscriminant.lean:43,461, `TauCeti.perronFormula` in TauCeti/NumberTheory/ArithmeticDirichletSeries/Perron/Ideal.lean:161, and `TauCeti.LSeries.wienerIkehara` in TauCeti/NumberTheory/LSeries/WienerIkehara/SharpCutoff.lean:301. In particular, `Cubic` does not impose nonzero leading coefficient or separability; Perron requires positive cutoff/abscissa and actual series convergence; Wiener–Ikehara requires actual half-plane sums and a separate continuous remainder.

Supplier-head checks used AnalyticNumberTheoryPartI `4ba2e21`, PartII `ed5b737`; statistics Parts I–VIII respectively `3b1a24f`, `a7cc3be`, `6f16f6c`, `92b9193`, `7f06cfc`, `88461f2`, `cbcd49e`, `b3b98cc`; HeightsRationalPointsAndObstructions `82cf8af`; ModularityAndLanglandsExtensions `2d70821`. These are the tool index's current heads, not remembered section names.

Ownership searches used `roadmaps grep` by mathematical object (binary cubics, Davenport–Heilbronn, Cohen–Lenstra, Selmer averages and four-rank moments), the exact namespace, and the concrete targets relevant to R01 and the reference rows. Also searched README/Lean files on main, in Completed, in board packages and in all 44 supplied sibling checkouts: 352 files. The index introduces no object and no fully qualified declaration, so there is no competing implementation owner here. No omitted-open-head ownership claim is made about an object introduced by this package: there are none. The global tool search used its 349-head index of 2026-10-25T01:21:56Z.

`roadmaps resolve` reports no unresolved cross-roadmap citation or own Lean name. Its final library-search warning says it did not see pinned packages; that diagnostic was not treated as proof of library absence. The relevant native declarations were inspected directly at the pins above.

The requested dependency check produced:

```text
depcheck: 45 roadmaps, 450 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line. AnalyticNumberTheoryPartI and PartII are at positions 96 and 97, before this index at 99; ArithmeticDirichletSeries is completed on main. Part-directory navigation and downstream-consumer descriptions are not supplier edges. The prior repair's F07 disposition is not re-raised. No ownership move or new gap is required by this review.

The three-dot diff contains five files, all under packages/ArithmeticStatistics, with 215 inserted lines. README and docstrings contain no pull-request numbers or review narrative; this package specifies no computational algorithm. No source passage was copied into the report. Only this report and scratch notes were written; README, Suggested.lean, metadata, manifest, pins and merge order were untouched. No Lean command, build, Git mutation or external post was run.

## Not verifiable

- **as-ref-022:** Fouvry–Klüners, Theorem 1, author's manuscript p.3. The manifest and brief settle it as waived. The Part V target and its elementary k=0,1 coefficients were checked, but the source text was not available in the supplied extracts and the literary locator was not independently certified. No renewed source request.
- **as-ref-056:** de Jong, Theorem 1.2, author-DVI pagination. Likewise settled waived. The Part VII target and its limiting rational constants were checked; the source theorem was not independently certified. No renewed source request. There are no other cited works in this index, so no missing-reference request file was added.
- **Mechanical elaboration:** No Lean execution was performed under the read-only/no-build instruction. The supplied signature harness appended `#check @-group`, which is absent from packages/ArithmeticStatistics/Suggested.lean. Its parse failure does not establish a package failure. There are zero package declarations, hence zero `#check @name` obligations and no binder changes to report.
- **Separate packages:** Supplier locators, ownership, stated contracts and the specific acceptance-coverage counterexample were checked. This report does not certify all mathematical results, proof routes, sources or Lean signatures in the eight parts or other suppliers.

## Source issues

- none

<!-- tauceti-roadmap-review {"agent": "codex", "head": "b571a4cd35d3bd8aa74cb9d292e21421cdc19a60", "job": "RT-ArithmeticStatistics~1a", "model": "gpt-6-astra", "worker": "chris-6"} -->
