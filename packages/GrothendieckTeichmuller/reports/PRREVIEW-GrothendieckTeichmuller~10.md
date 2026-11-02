# Review of GrothendieckTeichmuller (pull request #1058 at cccfcd9)

**Verdict:** accepted

🤖 Independent AI review. Incremental re-review of 6 changed lines since fd05ad5. No findings remain. The previous coefficient-algebra defect is repaired. This folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: TauCetiRoadmap/GrothendieckTeichmuller/README.md:60–62 now limits the exclusion of `(−1, 1)` to ℚ. The definition still permits arbitrary commutative ℚ-algebras, including the zero algebra. No new problem follows from the qualification.

## Verified sound

**Scope.** The diff has three insertions and three deletions, all in README.md:60–62. Suggested.lean, the pins and the toolchain are unchanged. Both the incremental diff and the pull-request diff against origin/main have no changes outside this roadmap folder. The worktree is clean at cccfcd9eca38f85f0f2a7958f4d13f5fa62d38d5. No pull-request file was edited.

The changed paragraph concerns excluded unipotent theory. It adds no construction, supplier, algorithm, duplicate ownership, shortcut or sorry'd data. Only the distinguishing example is specialized to ℚ; the construction's generality is preserved. Unchanged substantive audits and the padding assessment are inherited from [r9](PRREVIEW-GrothendieckTeichmuller~9.md), including its explicitly cited earlier reports.

**Source and repair.** The sources service retrieved the legal [Bar-Natan author text](https://www.math.toronto.edu/drorbn/papers/GT1/GT1.pdf), reusing barnatan98. I read its coefficient convention at barnatan98 line 153, Definition 2.4 at barnatan98 lines 294–304 (author-text p. 7), and Proposition 5.3 at barnatan98 lines 1006–1012 (author-text p. 23). These specify the unital commutative ℚ-algebra, skeleton/strand/coproduct/fixed-crossing conditions, and pentagon and hexagons in the indicated completions. The exclusion of the minus-one exponent is an inference from those conditions, now qualified correctly. No source manifest was edited.

Over ℚ the two exponents are −1 and 1, with difference −2. On the degree-one coordinate t of the unipotent pure two-strand group, their actions give −t and t; at t=1 these give −1 and 1. Over the zero ℚ-algebra both coefficients are 0 and the parameter is the identity. The revised sentence makes no contrary assertion there.

**Gate and dependency order.** The supplied worker gate passes every check, including build=0. Independent reruns returned:

~~~text

gate GrothendieckTeichmuller: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
depcheck: 205 roadmaps, 1594 edges, 0 problem(s)
~~~

The independent gate omitted a build field, so I also ran `lake build TauCetiRoadmap.GrothendieckTeichmuller.Suggested`: exit 0, successful completion of 9023 jobs. Direct `lake env lean` elaboration of TauCetiRoadmap/GrothendieckTeichmuller/Suggested.lean exited 0 with exactly 15 warnings, all for `sorry`. There is no UPWARD or CYCLE line. The candidate order places InverseGaloisAndArithmeticFundamentalGroups at 43, PeriodsAndSpecialValues at 296 and this roadmap at 370. No dependency changed; the exact supplier contracts still consume only Mathlib and Tau Ceti.

**Signatures and headlines.** A scratch copy with `#check @name` for all 43 named declarations elaborated successfully. All 43 types equal the supplied signature record after whitespace and explicit-argument-marker normalization. The Lean file and its README targets are unchanged, so r9's binder/generality comparisons carry forward. Four additional scratch proofs establish `(-1 : ℚ) ≠ 1`, `(-1 : PUnit) = 1`, equality of the two images under `algebraMap ℚ PUnit`, and `(-1 : ℚ) - 1 = -2`, without additional warnings.

All eight unchanged headlines remain present: `eq_of_beta_eq` (§1.4), `closure_artin` (§2.2), `isUnit_iff_bijective_beta` (§3.3), `isGT0_iff` (§3.4), `GTHat.isGT0` (§4.1), `GTHat.injective_mk_betaEquiv` (§4.2), `isClosed_setOf_isGT` and `GTHat.isClosedEmbedding_betaEquiv` (§4.5). The module docstring explains that §3.5's five-term form is retained in the README rather than listed as a headline. No changed Lean statement requires a new padding probe.

**Pinned evidence.** Mathlib remains f6090c7095e1e56b3464c1daba5f24631f1290d2 and Tau Ceti 358314d4ab97483df4fc4cb8adcc02e74a8d9f5a. Two declarations directly relevant to this repair were reopened:

| Declaration | File and line at the pin | Contract |
|---|---|---|
| `PUnit.commRing` | Mathlib/Algebra/Ring/PUnit.lean:24 | The one-element type is a commutative ring. |
| `PUnit.algebra` | Mathlib/Algebra/Algebra/Basic.lean:42 | It is an algebra over a commutative semiring; nontriviality is not required. |

**Ownership and citations.** Searches by object for parenthesized braids, GT₁ and unipotent completion used `roadmaps grep`, the readable board packages and pinned libraries. No competing construction is introduced by this edit; other unipotent-completion hits concern the excluded fundamental-group and motivic theories. No declaration or fully qualified name is added. The profinite construction's ownership audit is inherited from r9. BelyiMaps and the completed ProfiniteArithmetic and ProfiniteProPGroups roadmaps were reopened as shape/ownership references.

The resolver was rerun against main fa41b374 and the indexed open heads: no unresolved cross-roadmap citation. It did not inspect library names, so it is not library evidence. The three worker name leads are this roadmap's own declarations at Suggested.lean:254, :276 and :287; all pass the signature probe. The following scope citations were reopened; they designate other owners, not inputs added by the repair:

| Owner and version | File and line | Content resolved |
|---|---|---|
| BelyiMaps, main | TauCetiRoadmap/BelyiMaps/README.md:3772–3774 | Layer 12 names successor owner BelyiArithmeticActions. |
| InverseGaloisAndArithmeticFundamentalGroups, indexed open text | TauCetiRoadmap/InverseGaloisAndArithmeticFundamentalGroups/README.md:989, :5316 | IG.1.2 tangential fibres; IG.5.1 configuration spaces. |
| PeriodsAndSpecialValues, supplied open head | TauCetiRoadmap/PeriodsAndSpecialValues/README.md:2145, :2166, :2186, :2460 | PS.9.8–9.10 and PS.9.22: mixed Tate motives, their Galois group, path torsor and motivic Hoffman basis. |
| ProfiniteArithmetic, main | Completed/ProfiniteArithmetic/README.md:37 | Generic profinite integers, powers and automorphisms. |
| ProfiniteProPGroups, main | Completed/ProfiniteProPGroups/README.md:37 | Free profinite and pro-p carriers and universal properties. |

**Seeded sample.** All 15 requested targets are unchanged: §§0.1–0.4, 1.3–1.5, 2.1–2.3, 3.3, 4.1 and 4.3–4.5. None intersects or depends on the edited exclusion example. Their source and mathematical audits carry forward from r9 and its earlier reports, with the values retained below. No new unverified-locator flag appears. The affected Bar-Natan source was reopened.

**Adversarial table: recomputed changed passage.** Only the exclusion clause changes semantically; the other rows check its boundary and adjacent defining conditions.

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| README:60–61, exclusion over ℚ | c=(−1,1), identity (1,1) | Exponents −1 and 1; difference −2≠0; degree-one actions at t=1 give −1 and 1 | c fails the exponent-one condition | R01 repaired |
| README:57–61, arbitrary coefficient algebra retained | Zero ℚ-algebra PUnit | −1=1=0; c=(1,1); both actions on its zero coefficient module give 0 | Identity remains allowed; exclusion not asserted here | No narrowing of construction |
| README:59–60, fixed-crossing condition | Identity and inversion over ℚ | log(σ²) maps to t versus −t; coefficients 1 versus −1 | The condition rejects the larger full group | Unchanged adjacent condition verified |
| README:61–62, normalized relations | Σ=1 over ℚ and zero algebra | Pentagon 1·1·1=1·1=1; hexagon σ₂σ₁=1·σ₂·1·σ₁·1; zero coefficients coincide on both sides | Adjacent attribution remains consistent | Line wrapping only |

**Adversarial table: unchanged evidence.** 27 rows below are carried from r9, preserving its computed values and inherited coverage; these are not new computations. The old unqualified-exclusion row is superseded above.

| Statement | Instances tried | Values computed on each side | Result and provenance | Change |
|---|---|---|---|---|

| README:669–670, unit exponent does not imply bijectivity | λ=1, f=[y,x], x=(12), y=(13) | f=(132); qβ(x)=qβ(y)=(12); image orders 2 for qβ and 6 for q | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); Correct repaired assertion | Unchanged |
| README:671–674, restriction to (I)–(III) | Same parameter, m=0, z=(123) | (I) gives (123)(132)=1; (II) gives [x,z][z,y][y,x]=(132)≠1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); Counterexample lies outside the remaining question | Unchanged |
| §§1.3,3.2–3.3 used by changed paragraph | Bad parameter, identity, c | Bad quotient image order 2; identity fixes x,y; β_c²(x)=x, β_c²(y)=y and c²=(1,1) | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); Existing bijectivity/units conditions remain necessary | Unchanged |
| Same negative control on cyclic/trivial quotients | Abelian quotients | f=[y,x] maps to 1; β maps x to x and y to y; on trivial group 1=1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); Abelian tests alone miss the failure | Unchanged |
| Finite-quotient sentence and §4.4 | Surjections F̂₂→S₃, c action | 18 generating pairs; inversion fixes 6 and permutes remaining 12 in 6 two-cycles | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); Finite action computed, no classification inferred | Unchanged |
| §4.5 line-wrap repair | Old versus new sentence | Word sequence unchanged; lengths 169→87/67/13 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7 repair preserved | Unchanged |
| §4.5 closed embedding and outer embedding | Units and characteristic finite quotients | Units embed as uv=vu=1; finite action determined by λ mod exp(F̂₂/N), f mod N; compact domain, Hausdorff target, injective map | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r5 | Unchanged |
| Public header and headline signatures | 43 signatures, eight headlines | r6 public olean about 78 KB; 43/43 signatures still equal here | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r6, comparison rerun | Unchanged |
| Scope: motivic ownership | Four PeriodsAndSpecialValues targets | Lines 2145,2166,2186,2460; merge positions 296<370 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r6, citations re-resolved | Unchanged |
| §4.5 sources | ihara91 §3.3; harbaterschneps00 §0; schneps97 §1.3(3) | Earlier source lines 9635–9638,71–73,278–284; parameters recovered from generator images, group recovered as inverse limit of finite images | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r6 | Unchanged |
| Scope: Brown and HLS | Weights 5–7; λ=±1; four surfaces | Basis counts 2,2,3; c∉GT̂¹ since −1≠1; modular dimensions 1,1,2,2; Γ₀³≅ℤ³ with trivial action | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r4 | Unchanged |
| Conventions; §§0.1,1.3,3.2–3.3,4.3,4.5; §2.4 Check 3 | Noncommuting parameters; rank one; dihedral tests | Products (−1,x⁻¹) versus (−1,x); rank-one centralizer is whole group; (II) at f=1 gives r^(−m) or r^(−m−1), forcing λ=±1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r3 | Unchanged |
| subst; §§0.2–0.4,1.1–1.2,1.4–1.5,2.1–2.4,3.1–3.5,4.1–4.2,4.4; HMM scope | Generators, commutators, parameter inverse, outer equality | 1(a,b)=1, x(a,b)=a, y(a,b)=b; [(12),(23)]=(132); δ²(x)=yxy⁻¹; inverse-parameter products (1,1); outer equality forces abelianized conjugator exponents a=b=0 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §0.1 | Rank 1 and 2 | Rank 1: C(g)=ẑ; coordinate retraction π_i(lift(a))=a; rank 2: xy fails to centralize y in the S₃ quotient | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r3 | Unchanged |
| §0.2 | f=1,x,y,z | Substitution yields 1,a,b,(ab)⁻¹ respectively | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §0.4 | x,y | θ²=id; ω:x→y→z→x; δ²(x)=yxy⁻¹, δ²(y)=y | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §1.2 | p=(λ,f), q=(μ,g) | Both compositions send x→x^(λμ), y→(fβ_p(g))⁻¹y^(λμ)(fβ_p(g)) | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §§1.3–1.4 | λ=0; omit commutator membership | β_{0,1}=β_{0,[x,y]}=1 while [x,y]→(132)≠1; β_{λ,f}=β_{λ,y^cf}, but y^cf abelianizes to (0,c) | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2–r3 | Unchanged |
| §§2.2–2.3 | Six Artin words; linking-coordinate quotient | Squares and conjugates have permutation 1; coordinate 13 maps x₁₃→1 in ℤ/2 and adjacent generators to 0 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2; detects omitted nonadjacent generators | Unchanged |
| §2.4 | f=1; abelianized exponent sums (a,b) | 1=1; coordinates 12,34 give (a,b)=(2a,2b), forcing a=b=0 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §§3.2,3.4 | c=(−1,1) | β_cθ=θβ_c; β_cδ(x)=xy, δβ_c(x)=yx=y(xy)y⁻¹; (I),(II) hold with m=−1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §3.3 | Bijective β_{λ,f} | Inverse parameter (λ⁻¹,β⁻¹(f)⁻¹); product second coordinates ff⁻¹=1 and β⁻¹(f)⁻¹β⁻¹(f)=1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §4.1 | 1,c,pq | Character 1,−1,λμ; c²=1; mod 3, χ(c)=2≠1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §4.2 | Inner equality; excluded (1,x) | Equality forces λ=μ, conjugator exponents a=b=0; β_{1,x}=conj(x⁻¹), but x∉F̂₂' | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §4.3 | (±1,1); dihedral quotients | (II): m=0 gives 1; m=−1 gives (xyz)⁻¹=1; all dihedral tests force m=0 or −1 | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r3 | Unchanged |
| §4.4 | p,q,φ | p·(q·φ)=φ∘β_q⁻¹∘β_p⁻¹=φ∘β_{pq}⁻¹; x maps to a^(λ⁻¹) | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r2 | Unchanged |
| §4.5 | Unit-exponent slice f=1; inverse pairs | Intersection with GT̂^{mon} is {(1,1),(−1,1)}; units image is uv=vu=1, closed in the compact product | Carried from [r9](PRREVIEW-GrothendieckTeichmuller~9.md); r7/r3–r5 | Unchanged |

## Not verifiable

- Exact journal pagination for Bar-Natan was not independently certified. The numbered statements and pages of the legal author text were read; it contains later notes. The previous version-comparison limitation remains.
- Unchanged limitations are inherited from r9: continuing openness of the relation-constrained invertibility question and full nonabelian finite-quotient classification was not established; the source-version limitations for Hatcher–Lochak–Schneps, Brown 2012 and Grothendieck's French text remain; Ribes–Zalesskii §9.1 is cited by its settled paywalled locator with the earlier Herfort–Ribes substitute; Ihara 1994, Belyi 1979 and Montpellier folder 145 retain their earlier limitations. These are outside this six-line repair. No settled source request was reopened.
- Ownership against open work is limited to readable indexed roadmap files and supplied package/library copies. Open work without readable files was not checked. The unchanged full ownership audit is inherited, not repeated.

## Source issues

- none

