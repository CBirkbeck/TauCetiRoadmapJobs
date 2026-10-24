# PORT-BorelRegulators

Branch: `roadmap/borel-regulators`.
Head commit: `e39a3c495fea256436217416409c9e36adaa3a85`.
Base: `72d2b66`; the initial working tree was clean. The repository-root `README.md` and `CONTRIBUTING.md` supplied the normative guidance; the parent-relative links in the supplied AGENTS instructions do not resolve from this checkout.

The commit contains only `TauCetiRoadmap/BorelRegulators/README.md`, `TauCetiRoadmap/BorelRegulators/Suggested.lean` and `TauCetiRoadmap/BorelRegulators/metadata.toml`. No push, pull-request write, issue write or comment was performed. The report is outside the content checkout.

## Validation

`lake build TauCetiRoadmap.BorelRegulators.Suggested`: exit 0.

```text
Build completed successfully (9010 jobs).
```

Warning count: **4**, all `declaration uses sorry`, on the four headline theorems. No other warning or error occurred in the module build. The metadata is `topic = "math.NT"`, matching the single-key format on main.

Full push gate: exit 0.

```text
gate BorelRegulators: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 depcheck=0 metadata=0 dirty=0 outside-folder=0 source-material=0 OK
```

The gate requires a clean working tree, including a clean index: its precommit runs reported only `dirty` entries. The committed tree was then checked with the exact requested gate. Neither the tooling nor the merge order was edited.

Dependency check with the supplied order and `--movable`: exit 0.

```text
depcheck: 28 roadmaps, 249 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line was emitted. The citation resolver, explicitly pointed at the pinned `.lake/packages`, reports no cross-roadmap citation or Lean name found nowhere. `git diff --check` passes.

## Draft pull request body

Builds Chern-normalized Borel regulators for number fields, their integral image lattices and zeta covolumes through arithmetic norm-one volumes and compact primitive periods. It includes the empty-determinant case, the independent real Deligne realization and the factor-two comparison with Beilinson's regulator, giving special-value consumers a fixed normalization rather than an unspecified regulator map.

AI assistance: GPT-6 (Codex) ported the package, checked the pinned signatures, resolved the supplier boundaries and performed the mathematical audit recorded below.

## Dependencies that are still new-roadmap pull requests

- GeneralAlgebraicKTheory
- StableHomotopyKTheory
- ArithmeticKTheory
- ArithmeticLocallySymmetricSpaces
- AutomorphicFormsOnReductiveGroups
- AdelicAlgebraicGroups
- EndoscopicTransferAndUnitaryTraceComparison
- ArithmeticGaloisDuality
- LFunctions
- IntegralIwasawaTheory
- CharacteristicClasses
- TopologicalKTheory
- SchemeKTheoryOperations
- ResolutionOfSingularitiesCharacteristicZero
- ComplexComparisonPartII

Existing main-branch roadmaps are cited in their main-branch form, including SchemeAndStackFoundations, EtaleCohomologyFoundations, ClassFieldTheory, RepresentationTheory/SemisimpleAlgebras, DifferentialGeometry and AlgebraicTopology. An open revision of one of those roadmaps is not a supplier.

## Port changes and upstream-review fixes

1. Preserved both nonblocking accepted-review notes. The supplied package already lists the native total-reality, zeta and discriminant inputs in §5.1 and already begins §5.2 with n≥2, including the n=1 negative control. At ℚ,n=1, π₁SU=π₁(SU/SO)=0 but d₁=1; its transported subgroup cannot have full-lattice covolume 2π. Neither fix was undone.
2. Replaced the unavailable universal-realization supplier with explicit targets §§6.0a–6.0b. `roadmaps show MotivicEtaleKTheory` finds no main/open roadmap; `packages/MotivicEtaleKTheory/target.md` is a design target. It cannot supply a numbered construction under this port's supplier rule. The accepted mathematical contracts are retained: actual Deligne cohomology and its universal Chern map, disjoint unions, simultaneous real descent, restriction, finite étale transfer, Adams compatibility, and the separate complex/real infinitesimal comparison. They are now work owned here rather than assumptions about an unavailable supplier. Higher-cycle comparisons, the motivic Chern equivalence and supported cycle realization remain outside this roadmap. This is the ownership move required by the earlier-supplier rule; no other roadmap was edited.
3. Made the new Deligne target precise on smooth separated finite-type varieties, with the higher K-theory regulator on smooth quasi-projective varieties, where the scheme K-theory supplier's resolution-property/ample-family hypotheses hold. Added the actual compactification, refinement, scheme K-theory and descent inputs by section. The regulator on every number field retains n≥1; all lattice/isomorphism/special-value assertions retain n≥2.
4. Pinned the Deligne cone arrow to r−f, with differential (dr,df,r−f−dω), and the comparison with the opposite-arrow convention to (r,f,ω)↦(r,f,−ω). This matters because burgos2002 line 3901–3904 and BKK line 4035–4036 use opposite arrows. The two-term witness is +1 versus −1 on the real input 1. The universal class is the unique lift through the actual isomorphism at burgos2002 line 4010–4016, excluding a freely rescaled regulator.
5. Defined the first infinitesimal classifying nerve by the cosimplicial ideal generated by the square of the identity ideal, as at burgos2002 line 2838–2847. For GL₁, x=t−1 satisfies x≠0 and x²=0; formal completion would leave x²≠0. Separated complex CE/Weil coefficients from underlying-real CE coefficients, with degree-two dimensions 0 and 1 for gl₁(ℂ). No infinitesimal map is defined using the factor-two conclusion.
6. Replaced the repeated proof instruction for the suspended-Chern calibration in §2.1 with its CharacteristicClasses C6 supplier citation. The continuous-class construction, its normalizing property and every Check remain. The ownership record is in Scope and ownership.
7. Replaced the unresolvable consumer locator PeriodsAndSpecialValues PS.3.2a with a description of the exported mathematical inputs. `roadmaps show PeriodsAndSpecialValues` has no readable main/open roadmap. This is a downstream application, not a prerequisite; no unverified section number remains.
8. Removed references to an unexported source manifest and process labels such as waived/certified from the roadmap prose. Kept the historical Weil and Beilinson bibliography with the actual mathematical suppliers identified. Added legal source locators for the explicitly owned logarithmic/refinement and classifying-sheaf constructions.

No theorem, definition, API fact or Check was moved **from Lean to the README**: the package's four theorems already have acceptance-test form and are all retained with the same signatures and imports. Only the module docstring changes, identifying the additional missing Deligne/classifying carriers. There is no sorry'd data, example, API padding, option override or new carrier in the Lean file.

## Mechanical signature audit

A single scratch copy of `TauCetiRoadmap/BorelRegulators/Suggested.lean` appended `#check @name` for all four declarations and was elaborated once: exit 0, with exactly the same four expected sorry warnings. Subsequent Lean edits only wrap the module docstring; a mechanical comparison after deleting that docstring confirms the four signatures, bodies and imports are byte-for-byte identical to the source package.

| Declaration | Elaborated hypotheses compared with README |
|---|---|
| `dedekindZeta_continuation_leadingTerm` | Field F, NumberField F, analyticity at every z≠1, agreement with the native series for Re z>1, and 2≤n; d is the parity-dependent native place count; exponent d−Nn is in ℤ; the punctured filter and factorial divisor are retained. |
| `period_eq_index` | Field F, NumberField F and A : CSA in the field's universe; native Brauer class and native index. No generic-algebra replacement. |
| `exists_divisionAlgebra_split_at_infinity` | Field F, NumberField F, 1≤a; existential division ring, central F-algebra, finite dimension, dimension a²; both real and complex embedding-dependent algebra structures remain in their splitting assertions. |
| `exists_pos_rat_dedekindZeta_of_isTotallyReal` | Field F, NumberField F, IsTotallyReal F, 2≤n and Even n; positive rational q and the convergent native zeta value. |

No section binder was lost and no signature repair was needed. The Lean names all occur in the README; its other backticked names are pinned library inputs. The imported modules `TauCeti.Algebra.BrauerGroup.Group` and `TauCeti.Algebra.CentralSimple.Index` exist at the pin and are both used.

## Supplier verification and duplication sweep

The manifests and dependency checkouts agree: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Native definitions were opened, not inferred from their names:

- Mathlib/Algebra/BrauerGroup/Defs.lean line 40 bundles centrality, simplicity and finite dimension. Simplicity excludes the zero ring through the nontrivial two-sided-ideal order. The Brauer quotient at line 99 uses positive matrix sizes, and TauCeti/Algebra/BrauerGroup/Group.lean line 174 supplies its same-universe tensor group law.
- TauCeti/Algebra/CentralSimple/Splitting.lean line 120 has body `∃ n : ℕ, Nonempty (L ⊗[K] A ≃ₐ[L] Matrix (Fin n) (Fin n) L)`. It includes n=0 for arbitrary algebras; the division and CSA inputs exclude that case. Index.lean line 99 chooses the division-factor degree; line 112 makes it presentation-independent, line 180 proves positivity and line 255 gives an index-degree splitting field. These do not state divisibility of every splitting degree or number-field period=index.
- Mathlib/Algebra/Module/ZLattice/Basic.lean line 433 requires `[DiscreteTopology L]` separately and has field `span_top : span K (L : Set E) = ⊤`. It does not follow from finite generation alone. Covolume.lean line 72 defines `(addCovolume L E μ).toReal`; positivity at line 98 requires the real finite-dimensional Borel/Haar/discrete/full-span hypotheses. The coordinate determinant and nested-index identities are lines 125 and 148.
- Mathlib/NumberTheory/NumberField/DedekindZeta.lean line 49 is the ideal-count L-series, not its global continuation. TauCeti/NumberTheory/NumberField/DedekindZeta.lean line 158 continues its pole-subtracted remainder only to Re s>1−1/N. LFunctions Layer 3 supplies the global functional equation. Mathlib/Analysis/Analytic/Order.lean line 48 returns the junk value 0 without analyticity; the leading-term theorem explicitly has analyticity at 1−n.
- TauCeti/Geometry/Hodge/Tate/Basic.lean line 44 uses `Algebra.linearMap ℤ ℂ`; line 91 is the unscaled-lattice Hodge structure. The coefficient lattices in §1.1 have the separate nonzero (2πi)-scaling and simultaneous embedding involution, with no second Hodge carrier.
- The remaining README pin locators were checked for discriminants, total reality, product formula, primes above rational primes, quotient projection, exterior powers, empty determinants, zeta(2)/zeta(4), division representatives, and the algebraic/cohomological Brauer comparison. Their explicit hypotheses agree with the supplier paragraphs.

Cross-roadmap sections were opened at main or the indexed new-roadmap head, including GeneralAlgebraicKTheory §§2.5,3.2,3.12,7.7–7.8; StableHomotopyKTheory §§2.3–2.5,3.37,4.14; ArithmeticKTheory §§3.2–3.4; ArithmeticLocallySymmetricSpaces ALS.F.5, ALS.0.4–ALS.0.9, ALS.5b.1; AutomorphicFormsOnReductiveGroups §§1.1–1.3; AdelicAlgebraicGroups §§1.2,1.4,2.2–2.5,3.4,4.2; EndoscopicTransferAndUnitaryTraceComparison §6.2; ClassFieldTheory Layers 5,10; SemisimpleAlgebras Layer 6; ArithmeticGaloisDuality R02.4.5b–R02.4.6; LFunctions Layer 3; IntegralIwasawaTheory §6.0; CharacteristicClasses C5a.2–C5a.5 and C6 items 2–3; TopologicalKTheory T4/T7; SchemeKTheoryOperations §§2.1–2.5,4.1,4.3,6.8; and the named main-branch differential/topological foundations. New Layer 6 geometric inputs were checked at SchemeAndStackFoundations §§0.28,2.1–2.2,2.18, EtaleCohomologyFoundations G.1–G.2, ResolutionOfSingularitiesCharacteristicZero §§5.1–5.4,6.2,7.5–7.8 and ComplexComparisonPartII C−1.1,C−1.4,C5.1–C5.2.

Ownership searches used `roadmaps list`, multiple object-based `roadmaps grep` calls (final limit 10000, 1629 matching lines), main active/completed folders, the board packages, and the 27 supplied individual sibling folders. The ownership sweep used the 331-head index supplied in the brief; the final citation resolver identifies its refreshed index as 2026-10-24T00:21:28Z, also with 331 heads. All 15 open supplier head hashes were compared with the earlier index and are unchanged. Matches were triaged by object and the relevant passages read directly; existing-roadmap revisions were not treated as new dependencies.

No additional theorem duplicate was found for the four native headlines. ColemanIntegration L3.Fc.1 has the finite-Galois Beilinson lattice and its determinant pairings; this roadmap's retained variant is the independently Chern-normalized Borel map for every number field, with an exact factor-two comparison. ArithmeticKTheory owns ranks and localization; those are consumed, not replanned. IntegralIwasawaTheory owns negative-integer Hecke rationality, whereas §5.1 includes the rank-zero clause of the actual primitive-period determinant. Polylogarithms owns the explicit symbol and π-calibration comparisons and is a consumer here. The general Tamagawa theorem is supplied from EndoscopicTransferAndUnitaryTraceComparison §6.2. All removals/deferrals are recorded only in the roadmap's Scope and ownership; there are no removed-target stubs. No fully qualified Lean declaration name collides with a readable supplier.

## Sources and limits

The source package and accepted review are mathematical evidence, not instructions. No suspicious instruction to execute fetched code, expose credentials, write outside the authorized files or contact another person was followed. No helper agent was used.

The legal cached texts were read at the relevant locators, including poonen2017 line 1435–1446, borel1977 line 328–337 and 499–615, burgos2002 line 2838–2889, 2967–2969, 3546–3614, 3876–4106 and 4172–4191, and deligne_goncharov2005 line 429–440. Borel's printed pp.632–633 were also inspected as page images because the extraction drops the determinant formulas. The formulas give respectively the exponent −Nn before lattice conversion and dₙ−Nn for the analytic leading coefficient. Newly explicit general Deligne targets use Burgos94 line 102–107 and 181–192, BKK line 4239–4266 and 4315–4316, and BF line 905–960; the BF proof's quasi-projective hypothesis is retained for the general K-theory regulator. All prose is paraphrased.

The Weil proof text remains outside this audit; its historical attribution is through borel1977 line 227, and the actual theorem is supplied by the earlier Tamagawa roadmap. The historical paywalled Beilinson reference is not used as a substitute for the read universal-class and comparison constructions. A Zulip/open-Mathlib search did not supply a usable additional result; no current web result was substituted for either pinned API.

The accepted supplier extension specifications retained here are `stable-finite-range`, `inner-type-a-structure`, `adelic-rational-masses`, `splitting-degree-index`, `cyclic-local-degrees`, `integral-chern-calibration`, `graded-indecomposable-api` and `multiplicative-serre-comparison`. They remain explicit requirements extending named supplier sections, not claims that new declarations exist at the pins. The review's older `classical-tamagawa-proof` and `order-finite-generation` conditions were already superseded in the source package by the earlier Tamagawa supplier and the full-rank image argument. The two universal-realization contracts now have targets §§6.0a–6.0b here. There is no unresolved build, gate, import, signature or order failure.

External consumer drift remains outside the permitted edits: Polylogarithms still points to BorelRegulators §7.1 and Layers 3–5. Its correct number-field inputs here are §§2.3,5.1,5.3–5.4 and §3.4 for the Tamagawa specialization; its explicit polylogarithmic calibration stays there. PeriodsAndSpecialValues has no readable main/open roadmap to validate a section citation. These limitations are recorded without changing the consumer files.

## Adversarial mathematics pass

These are mathematical evaluations and negative controls, not claims that admitted theorems have been proved. Each row identifies the statement or defining law tested. Rational arithmetic, the cyclotomic quotient and phase identities were also recomputed with exact arithmetic.

| Statement | Instances tried | Values computed on both sides or in the negative control | Result | Change |
|---|---|---|---|---|
| Number-field and higher-weight conventions | ℚ; ℚ(i); ℚ(√5); n=1 | (r₁,r₂,N)=(1,0,1),(0,1,2),(2,0,2); ζ_ℚ(0)=−1/2 has order 0≠d₁=1 | Pass | n≥2 retained; elementary targets still allow n=1 |
| Tate lines and conjugation | k=1,2 | 2πi conjugates to −2πi; (2πi)²=−4π² conjugates to itself | Pass | Preserved |
| Selected coordinates and representative sign | n=2,3; one nonreal pair | (1,−1) and (1,1); changing representative multiplies by −1 and +1 | Pass | Preserved |
| Rows, columns and signed determinants | two coordinates, swap columns of I₂ | det I₂=1, det swap=−1; both absolute determinants=1 | Pass | Preserved |
| Empty determinant and measure convention | rank 0 | ∧⁰0 has generator 1; det([])=1; normalized point mass=1 | Pass | Preserved |
| Nonzero rational proportionality and integer powers | ℚ,n=2,3 | −1/12=(−1/2)(1/6); π^(1−3)=π^(−2), whereas natural subtraction would give π⁰=1 | Pass | Preserved |
| Real correction multiplicativity | degrees 1,2,3,5 | i·i²=−i=i³; i⁵=i | Pass | Preserved |
| Bott and twisted-character normalization | u² and −u³ | (−v)²/v²=1; −(−v)³/v³=1; twisted values −4π² and −8π³i | Pass | Preserved |
| Left/right cosets and inversion | g=diag(i,−i), h=[[0,1],[−1,0]] | h hᵗ=I, (gh)(gh)ᵗ=g gᵗ=−I; inversion sends gSO to SOg⁻¹ | Pass | Preserved |
| Global gauge convention | ℚ, scalar 2; ℚ(i),h=3 | 2·(1/2)=1; Δ^(−h/2)2^(hr₂)=4^(−3/2)·8=1 | Pass | Preserved |
| §1.1 Vₙ and Cₙ definitions | ℚ,n=2,3; ℚ(i),n=2,3 | dimensions 0,1 and 1,1; C has coordinates ℤ⁰,ℤ,ℤ,ℤ | Pass | Preserved |
| §1.1 extensionality | ℚ(i),n=2, coordinate 1 | selected coordinate 1 forces the pair (1,−1); pair (1,0) fails conjugation | Pass | Preserved |
| §1.1 inverse coordinate maps | n=3, selected generator −4π² | division gives 1; multiplication sends 1 back to −4π² | Pass | Preserved |
| §1.1 dimension, discreteness and span | ℚ,n=2,3 | rank 0 spans {0}; rank 1 lattice ℤ has span ℝ and distinct integers differ by ≥1 | Pass | Preserved |
| §1.1 norm and topology | n=2 nonreal pair; n=3 real generator | ambient norms 2π and 4π²; coordinate norms both 1; scaling constants nonzero | Pass | Preserved |
| §1.1 coordinate changes and measure | n=2 representative change; swap two rows | determinants −1 and −1; absolute Jacobians 1 and 1 | Pass | Preserved |
| §1.2 R and T definitions | ℚ(i)/ℚ,n=3,v=2,w=(3,5) | R(2)=(2,2); T(3,5)=8; averaging would give 4 | Pass | Preserved |
| §1.2 preservation of integral target | ℚ(i)/ℚ,n=2,w=(1,−1) | T(w)=0 in C₂(ℚ)={0}; R(0)=(0,0) | Pass | Preserved |
| §1.2 transfer–restriction identity | ℚ(i)/ℚ,n=3,v=2 | T R(2)=4=[E:F]·2 | Pass | Preserved |
| §1.2 tower and identity laws | two successive quadratic fibres, entries 1,2,3,4 | total sum=10; iterated sum=(1+2)+(3+4)=10; identity sum(2)=2 | Pass | Preserved |
| §1.3 leading coefficient definition | ℚ,n=2,3,4 | d=0,1,0; coefficients −1/12, −ζ(3)/(4π²), 1/120; 0!=1!=1 | Pass | Preserved |
| §1.3 exact zero order and nonvanishing | ℚ,n=2,3; ℚ(i),n=2 | orders 0,1,1; coefficients −1/12, −ζ(3)/(4π²), −Catalan/(6π), all ≠0 | Pass | Preserved |
| §1.3 punctured limit and reality | ℚ,n=3, t=s+2→0 | ζ(s)/t→ζ′(−2)=−ζ(3)/(4π²), imaginary part 0; ζ(−2)=0 differs from coefficient | Pass | Preserved |
| §1.3 functional-equation rational factor | ℚ,n=2,3,4 | ratios to √Δ π^(d−Nn)ζ(n): −1/2, −1/4, 3/4 | Pass | Preserved |
| §1.3 analytic representative hypotheses | ℚ,z=2; arbitrary Z(1) | native value π²/6; zero gives 0 and doubled continuation π²/3, both excluded; 1−n≤−1≠1 | Pass | Preserved |
| §2.1 Boₙ,b construction and calibration | n=2,3 and b≥2n+1 | calibrated rational evaluations 1,1; twisted values −4π², −8π³i; zero/double give 0,2 in divided units | Pass | Calibration cited as supplier input |
| §2.1 stabilization | add a 1×1 identity block | positive-degree character of the added trivial block=0, so 1+0=1 | Pass | Preserved |
| §2.1 simultaneous conjugation | n=2 and n=3 coefficients | conjugating coefficient and embedding twice gives (−1)²=1 and (+1)²=1 | Pass | Preserved |
| §2.2 integral and rational maps | rank-one integral generator x and its localization | integral coordinate t equals rational localized coordinate t; doubled inverse gives 2t≠t for t≠0 | Pass | Preserved |
| §2.2 embedding evaluation | imaginary quadratic class, n=2,3 | divided evaluations (t,−t),(t,t), matching V₂,V₃ | Pass | Preserved |
| §2.2 additivity and torsion annihilation | 0; 2x=0; K₃(ℤ)=ℤ/48 | r(0)=0; 2r(x)=0⇒r(x)=0 in ℝ; torsion K₃ maps to 0 | Pass | Preserved |
| §2.2 uniqueness after rational localization | one rational coordinate t and proposed 2t | equality on the integral generator requires t=2t, hence t=0; nonzero coordinate rules it out | Pass | Preserved |
| §2.3 real isomorphism and rational injectivity | ℚ,n=2,3; ℚ(i),n=2,3; real quadratic,n=3 | source/target dimensions (0,0),(1,1),(1,1),(1,1),(2,2) | Pass | Preserved |
| §2.3 kernel equals torsion, both directions | rank-one ℤ⊕ℤ/2, map (a,b)↦at,t≠0 | kernel={(0,0),(0,1)}; torsion same two elements; (1,0) maps to t≠0 | Pass | Preserved |
| §2.3 restriction square | ℚ(i)/ℚ,n=3, class coordinate t | both routes give (t,t) | Pass | Preserved |
| §2.3 transfer square | ℚ(i)/ℚ,n=2 and n=3 | T(t,−t)=0; T(t,t)=2t, matching tr∘res=2 | Pass | Preserved |
| Finite-stage comparison range | (N,q,a)=(1,5,22),(1,5,21),(2,3,26),(2,3,25) | 21>20,20=20,25>24,24=24; only first/third satisfy strict bound | Pass | Preserved |
| Finite-stage comparison degree zero | a=2,q=0,N≥1 | a−1=1>0; H⁰ comparison 1↦1; zero map gives 0≠1 | Pass | Preserved |
| §3.1 denominator lcm and period=index | empty support; halves at two places; thirds 1/3,−1/3 | lcm=1,2,3; period=index=1,2,3; division dimensions 1,4,9 | Pass | Preserved |
| §3.1 matrix representative of divisible degree | split M₂(ℚ); index 2, desired degree 6 | split period=index=1 although degree=2; M₃(D) has degree 6 and dimension 36 | Pass | Preserved |
| §3.1 zero-sum admissibility | 1/3 alone versus 1/3,−1/3 | sums 1/3≠0 and 0 in ℚ/ℤ; only second is a global invariant family | Pass | Preserved |
| §3.1 real invariants counted | Hamilton quaternion over ℚ | invariants 1/2 at 2 and ∞; lcm2, index2, dimension4; deleting ∞ leaves sum1/2 | Pass | Preserved |
| Splitting-degree divisibility contract | M₂(𝔽₂) split over 𝔽₄; M₂(𝔽₂(t)) over adjoining √t | index1 divides degree2 in both separable/inseparable cases; module identity d²k=d[L:K] is 1·2=1·2 | Pass | Preserved |
| Cyclic full-local-degree contract | ℚ,degree8,S={2}; real and imaginary cyclotomic quotients | quotient groups have order8; local degree at2=8; real quotient local degree31=1; class of −1 in imaginary quotient has order2 | Pass | Preserved |
| Cyclic extension parity and degree-one boundary | a=1, S=R=∅; a=3 and a real place | [F:F]=1; cyclic group of order3 has no element of order2, so real complexification excluded | Pass | Preserved |
| §3.2 every positive division degree | a=1,2,3; a=0 | dimensions 1=1²,4=2²,9=3²; a=0 demands finrank0 although a division ring has 1≠0 | Pass | Preserved |
| §3.2 prescribed invariants survive division representative | 1/a,−1/a at two finite places | denominators lcm a (including a=1); infinite entries0; matrix-equivalent representative has same entries | Pass | Preserved |
| §3.2 infinite splitting | (−1,3) versus Hamilton over ℚ | real Hilbert symbols +1 and −1; scalar extensions M₂(ℝ) and Hamilton, respectively | Pass | Preserved |
| §3.3 gauge definition and discriminant transport | F=ℚ(i),h=3 | m∞ relative to dxdy³ has factor (1/8)·8=1; unscaled 2dxdy product gains factor8 | Pass | Preserved |
| §3.3 gauge scaling | ℚ,ω↦2ω | infinite multiplier2, finite multiplier1/2, product1 | Pass | Preserved |
| §3.3 Tamagawa product and trivial group | h=0,ω=1,2 over ℚ | infinite/finite masses (1,1),(2,1/2); both global masses1 | Pass | Preserved |
| §3.3 chart determinant law | one complex coordinate z↦2z | real determinant4 equals squared complex absolute value4; ordinary absolute value2 is wrong | Pass | Preserved |
| §3.3 nonzero-gauge hypothesis | ω=0 | all masses0, contradicting positive-rational class; excluded | Pass | Preserved |
| Inner type-A structure contract | degrees1,2,3 | geometric norm-one groups 1,SL₂,SL₃; dimensions0,3,8; degree1 excluded from absolute almost simplicity | Pass | Preserved |
| §3.4 supplied norm-one quotient mass | division degrees2 and3, split at infinity | τ=1 and1; dimensions3 and8; no multiplier2 or3 | Pass | Preserved |
| §3.4 gauge independence | ω↦2ω over ℚ | new τ=2·(1/2)·1=1 | Pass | Preserved |
| §3.4 exclusion of norm-one tori | ℚ(i)/ℚ torus versus quaternion norm-one | dimensions1 versus3; geometric character ranks1 versus0; torus can have τ2 rather than1 | Pass | Preserved |
| Rational local mass contract | q=2, SL₂; gauge twice standard; index3 subgroup | masses3/4,3/8,1/8, all positive rational; zero gauge gives0 and is excluded | Pass | Preserved |
| §3.5 split-place finite mass | SL₂(𝔽₂),SL₃(𝔽₂) | 6/8=3/4=1−2⁻²; 168/256=21/32=(3/4)(7/8) | Pass | Preserved |
| §3.5 exceptional correction definition | q=2,SL₂,gauge2ω_std | c=(3/8)/(3/4)=1/2; omitting place wrongly gives1 | Pass | Preserved |
| §3.5 Euler product and nonzero denominator | a=2; q=1 control | good factors (1−q⁻²) multiply to ζ_F(2)⁻¹; q=2 gives3/4>0; q=1 gives0 and is excluded | Pass | Preserved |
| §3.5 independence on enlarging S | add a standard q=2 SL₂ place | new correction multiplier (3/4)/(3/4)=1 | Pass | Preserved |
| §3.5 finite-index mass | index3, starting gauge mass3/8 | m(U′)=(3/8)/3=1/8; 3m(U′)=3/8 | Pass | Preserved |
| §3.6 arithmetic compactness | division quaternion (−1,3); split M₂(ℚ) | first arithmetic quotient compact; second has cusp y→∞ and is noncompact, despite finite volume | Pass | Preserved |
| §3.6 exact quotient identity | mass m, index3 open subgroup | (3vol∞)(m/3)=vol∞m=1 | Pass | Preserved |
| §3.6 subgroup covolume | Γ₀ index3 in Γ | three translates of a Γ-domain give volume3vol, not vol/3 | Pass | Preserved |
| §3.6 unscaled gauge factor | F=ℚ(√5),a=2 | h=3; multiplier Δ^(h/2)=5^(3/2) | Pass | Preserved |
| §4.1 indecomposable quotient definition | Λ(x₃,x₅),degree8; k[u₂],degree4 | H⁸ basis x₃x₅ but Q⁸=0; u₂²≠0 but its Q⁴ class0 | Pass | Preserved |
| §4.1 determinant adapter | Λ(x₃),degree3 and degree6; A=k | Q³ dimension1; Q⁶ dimension0; det Q⁶ and det Q(k) both k with generator1 | Pass | Preserved |
| §4.1 functorial determinant and no free scalar | rank-one map3 and identity rank0 | ∧¹(×3)=×3; ∧⁰ id=×1; independently chosen ×2 fails both prescribed maps | Pass | Preserved |
| §4.1 scalar extension | Q³(Λ_ℚ x₃) and degree6 zero | tensor with ℝ gives ℝx₃ and0; determinant generator x₃⊗1 and empty generator1 | Pass | Preserved |
| Graded indecomposable contract | k[u₂], Λ_k(x₃), A=k; k=𝔽₂ | Q²=k u₂; Q³=k x₃; Q(k)=0; exterior relation x₃²=0 still gives one generator in characteristic2 | Pass | Preserved |
| §4.2 comparison maps and real correction | q=0,3,5 | scalars1,−i,i; constants1↦1; using −i at q5 gives wrong sign | Pass | Preserved |
| §4.2 multiplicativity | q1=1,q2=2 | i¹i²=−i=i³ | Pass | Preserved |
| §4.2 stabilization and finite covers | constant class; degree3 cover | both pullbacks send1 to1; transfer of pulled-back constant gives3 | Pass | Preserved |
| §4.2 realness of corrected comparison | q1 raw value −i on a real class | i·(−i)=1 real; forgetting correction leaves −i with imaginary part−1 | Pass | Preserved |
| §4.2 torsion-free quotient hypothesis | C₂ point stabilizer with 𝔽₂ coefficients | H⁰,H¹,H² dimensions1,1,1; ordinary point dimensions1,0,0; quotient descent hypotheses exclude it | Pass | Preserved |
| Full-compact-subgroup supplier convention | S₃ sign representation; cyclic C₂ sign representation | fixed subspace dimension0 in each; zero Lie algebra alone would incorrectly give dimension1 | Pass | Preserved |
| §4.3 compact determinant | ℚ,n=2,3; ℚ(i),n=2 | classes π²ℚ_>0,π³ℚ_>0,π⁴/8·ℚ_>0; twisted degree3 evaluation has absolute ratio4 to π² | Pass | Preserved |
| §4.3 rational basis invariance | rank-one rational basis multiplied by3 | det multiplier3, nonzero rational; dividing generator by2 gives multiplier1/2 | Pass | Preserved |
| §4.3 stable primitive degree | SL₂→SL₃, degree3 | one primitive generator at each embedding on both sides, dimensions1 and1 over ℚ | Pass | Preserved |
| §4.4 padded regular representation | j=1,N=1,a=17 | b=4; padding13; det L_g=Nrd(g)²=1; 17 is not divisible by4, so no unital D-action on F¹⁷ | Pass | Preserved |
| §4.4 compact cycle dimension | (N,j)=(1,1),(1,2),(2,1) | N(j²+2j)=3,8,6 | Pass | Preserved |
| §4.4 restriction of primitive wedge | same three instances | (j+1)^(jN)=2,9,4, all nonzero | Pass | Preserved |
| §4.4 nonzero compact cycle period | j=1,2 | period classes ζ_F(2) and ζ_F(2)ζ_F(3), positive since both zeta values>0 | Pass | Preserved |
| §4.4 lower-generator ideal annihilation | Λ(x₃,x₅),η₁=x₃ | η₁x₃=0; η₁(x₃x₅)=0; η₁x₅=x₃x₅≠0, so arbitrary positive-degree terms cannot be discarded | Pass | Preserved |
| §4.5 arithmetic primitive determinant | cumulative stages j=0,1,2 | products1,ζ_F(2),ζ_F(2)ζ_F(3); successive ratios ζ_F(2),ζ_F(3) | Pass | Preserved |
| §4.5 full-group rank versus base rank | ℚ,n=2 | full rank N1, compact-dual base rank d0; ζ(2) remains on full line | Pass | Preserved |
| §4.5 finite-index and stable restriction | rational constant, index3 cover; primitive degree3 stabilization | res1=1 and tr res1=3, so rational transfer/3 is inverse on stable image; primitive rank1→1 | Pass | Preserved |
| §4.6 exact sequences and ranks | ℚ,n=2,3; ℚ(i),n=2 | (d,N,N−d)=(0,1,1),(1,1,0),(1,2,1); in each case d+(N−d)=N | Pass | Preserved |
| §4.6 common-fibre determinant identity | block matrix [[a,b],[0,1]] | det=a=det(base)·det(fibre); replacing fibre1 by2 gives2a and is excluded | Pass | Preserved |
| §4.6 lift independence | [[1,2],[0,1]] | det1·1−0·2=1 | Pass | Preserved |
| Multiplicative Serre comparison contract | q0 constant and a base/fibre degree1,2 product | both fibre restrictions send1 to1; differential rule has sign (−1)¹=−1; degree factors i·(−1)=−i | Pass | Preserved |
| §5.1 primitive-period theorem, zero rank | ℚ,n=2,4; ℚ(√5),n=2 | empty map1; √Δζ/π^(Nn)=1/6,1/90,2/75; reciprocals6,90,75/2 | Pass | Preserved |
| §5.1 positive-rank determinant class | ℚ,n=3; ℚ(i),n=2,3 | raw classes ζ(3)/π³,2ζ_F(2)/π⁴,2ζ_F(3)/π⁶; all nonzero | Pass | Preserved |
| §5.1 stability and commensurability | identity cover and index3 cover | identity gives determinant1; rational stable restriction has inverse transfer/3 and nonzero determinant | Pass | Preserved |
| §5.1 phase parity | ℚ,n=2,3; ℚ(i),n=2,3; real quadratic,n=2 | E=−2,2,0,0,−4; i^E=−1,−1,1,1,1; all real rational units | Pass | Preserved |
| Native totally-real even-value theorem | ℚ,n=2,4; ℚ(√5),n=2 | positive q=1/6,1/90,2/75; ℚ(i),n=2 has d1 rather than0 and is excluded | Pass | Preserved |
| §5.2 homotopy-to-Tate lattice definition | ℚ,n=2,3,5; imaginary quadratic,n=2 | covolumes1,4π,2π,2π from (2π)^dε | Pass | Preserved |
| §5.2 real-place Cartan indices | n=3 (π₅),n=5 (π₉) | quotient multipliers1,2; Cartan multipliers2,1; composites2,2 | Pass | Preserved |
| §5.2 complex-pair factor | imaginary quadratic,n=2,3 | d1,r₁0,ε1; one factor2π in both weights, not (2π)² | Pass | Preserved |
| §5.2 zero rank and excluded n1 | ℚ,n=2 and n=1 | n2: (2π)⁰=1; n1: π₁SU=π₁(SU/SO)=0 but d1=1, so no spanning lattice of covolume2π | Pass | Explicit n≥2 and negative control retained |
| §5.2 Cartan map well-definedness | g=diag(i,−i),h=[[0,1],[−1,0]] | ggᵗ=(gh)(gh)ᵗ=−I; C(SO)=I; raw representatives g and gh differ | Pass | Preserved |
| §5.3 image lattice definition and membership | A=ℤ⊕ℤ/2,r(a,b)=at,t≠0 | Λ=tℤ; v=2t has preimage(2,0); v=t/2 has no integral preimage | Pass | Preserved |
| §5.3 torsion quotient image isomorphism | same A | A/tors=ℤ; class of(a,b)↦at has kernel0 and image tℤ | Pass | Preserved |
| §5.3 discreteness and spanning | tℤ; ℤ+√2ℤ; tℚ | tℤ has rank1 and minimum gap abs(t)>0; mixed group rank2 in ℝ-rank1; t/m→0 for rational image | Pass | Preserved |
| §5.3 covolume determinant and unimodular invariance | one-dimensional tℤ and sign basis change | covolume abs(t); basis −t gives same abs(t); sublattice2tℤ gives2abs(t) | Pass | Preserved |
| §5.3 rank zero | ℚ,n=2 | Λ={0}⊂{0}; det1=covolume1, not0 | Pass | Preserved |
| §5.4 leading-term rational proportionality | ℚ,n=2 | R1=(−12)ζ*(−1); factor−12 can be negative | Pass | Preserved |
| §5.4 positive zeta covolume class | ℚ,n=2,3; ℚ(i),n=2,3 | positive ratios with exponents−2,−2,−3,−5; ℚ,n2 ratio6 | Pass | Preserved |
| §5.4 exact reference-lattice conversion | ℚ,n=2,3; real quadratic,n=3 | factors (2π)^dε=1,4π,16π²; rank-two factor is (4π)² | Pass | Preserved |
| §5.4 rational image | rank-one tℤ | span_ℚ(tℤ)=tℚ; contains t/2 and every t/m, so not equal to tℤ | Pass | Preserved |
| §5.4 rational basis change | swap two columns; scale one by2 | signed multipliers−1,2; absolute multipliers1,2 | Pass | Preserved |
| §5.5 S-integer equal image theorem | S=∅; invert prime above2, n=2,3 | degree2n−2 residue K_even=0; localization surjective; image/covolume ratios1 in both cases | Pass | Preserved |
| §5.5 order finite-index covolume | Λ=tℤ, Λ_R=3tℤ; rank0 | index3, covolume ratio3; zero-dimensional index1 and covolume1 | Pass | Preserved |
| §5.5 S/order composition and transfer scope | nested indices2 and3; field degree2 | composite index6 and covolume ratio6; field TR=2; finite-resolution hypotheses retained for general ring transfer | Pass | Preserved |
| §5.5 degree-one negative control | ℤ→ℤ[1/2] | unit ranks0 and1, so no higher-odd-degree equal-image theorem for n1 | Pass | Preserved |
| §6.0a Deligne cone, including sign | point, n=2,3,0 | n2,n3: injective real-line inclusion, H⁰0,H¹ dimension1; n0: map R⊕C→C onto, kernelR; d(1,0,0)=(0,0,1) | Pass | Explicit source sign r−f |
| §6.0a pullback, products, refinement | point identity; two-point swap squared | 1↦1; 1·1=1; (i,2i)↦(2i,i)↦(i,2i); identity refinement fixes1 | Pass | Universal realization made a target |
| §6.0a finite disjoint union and real descent | one real embedding n2,n3; conjugate pair | fixed dimensions0,1,1; forgetting coefficient conjugation would give false real n2 dimension1 | Pass | Explicit target |
| §6.0a universal Chern lift and stabilization | u₁ isomorphism in a one-dimensional test, topological class1 | unique inverse class1; proposed0 or2 maps to0 or2, not1; adding trivial block contributes0 | Pass | Unique-lift law added |
| §6.0a finite étale transfer | two points, coordinates i and2i | T(i,2i)=3i; R(i)=(i,i); TR(i)=2i | Pass | Explicit target |
| §6.0a Adams/Chern law | n3,a1,2 | multipliers1,8; determinant in rank2 is64 after injectivity, not assumed here | Pass | Explicit target |
| §6.0a smoothness boundary | Spec C[ε]/ε² | ε²0 but ε≠0; Ω¹ has generator dε and relation εdε0; nonreduced scheme excluded from smooth-variety target | Pass | Scope explicit |
| §6.0b first infinitesimal nerve | GL₁, x=t−1 | x≠0,x²0 in first square-ideal quotient; formal completion has x²≠0 | Pass | Square-ideal construction explicit |
| §6.0b complex and real CE comparisons | gl₁(C) complex and underlying real | complex dimensions in degrees0,1,2:1,1,0; real:1,2,1; both differentials0 | Pass | Coefficient fields explicit |
| §6.0b differential and products | gl₂, X=E₁₂,Y=E₂₁; ω(H)=1 | [X,Y]=diag(1,−1); dω(X,Y)=−1 and dω(Y,X)=1; real abelian two-generator wedge has dimension1 | Pass | Independent infinitesimal target |
| §6.0b filtration, inclusion and stabilization | degree0 constant; added zero Lie coordinate | F⁰ constant1 stays1; inclusion sends1 to1; added coordinate value0 leaves prior value1 | Pass | Explicit target |
| §6.0b Deligne evaluation/projection square | n2,n3,z=1+i | projected values i and1, respectively; opposite projections give1 andi | Pass | Independent target |
| §6.1 quotient model and projection | n2,n3,z=1,i | P₁(1)=0,P₁(i)=i; P₂(1)=1,P₂(i)=0 | Pass | Preserved |
| §6.1 coset representative independence | n2: i and1+i; n3:1 and1+i | P₁ both=i; P₂ both=1; differences1∈R(2),i∈R(3) | Pass | Preserved |
| §6.1 inverse quotient maps, both directions | z=1+i, n2,3 | z−P₁(z)=1; z−P₂(z)=i; projecting included i or1 returns i or1 | Pass | Preserved |
| §6.1 integral structure | n3 generator (2πi)²=−4π² | quotient image survives and divided coordinate1; image of (2πi)³∈R(3) is0 | Pass | Preserved |
| §6.1 restriction and trace | ℚ(i)/ℚ,n3,t=2 | R(2)=(2,2),T R(2)=4 in both quotient and embedding models | Pass | Preserved |
| §6.1 positive-weight boundary | n1 and natural-subtraction n0 | P₀(1+i)=1; junk P₀(1)=1 does not kill R(0); geometric H_D¹(point,R(0))=0 | Pass | Preserved |
| §6.2 Bo=2Be on independent maps | rank-one generator with Bo coordinate t≠0 | Be coordinate t/2 gives2(t/2)=t; Be0 would give0≠t | Pass | Preserved |
| §6.2 determinant ratio | d=0,1,2 | 2^d=1,2,4; in rank0 both determinants1 | Pass | Preserved |
| §6.2 integral-image covolumes | rank-one Bo lattice tℤ | Be lattice(t/2)ℤ; covolumes abs(t),abs(t)/2; ratio2 | Pass | Preserved |
| §6.2 restriction/transfer compatibility | degree2 extension and scalar2 comparison | T(2w)=2T(w); for w=(t,t), both sides4t | Pass | Preserved |
| §6.3 rational Adams-weight theorem | ℚ,n3,a2; real quadratic,n3,a2 | scalar8 on ranks1,2; determinants8,64 | Pass | Preserved |
| §6.3 zero rank and identity operation | ℚ,n2,a2; a1 in rank2 | det=2^(2·0)=1; scalar1,det1 for ψ¹; a0 excluded | Pass | Preserved |
| §6.3 regulator intertwining | nonzero rank-one coordinate t, n3,a2 | r(ψ²x)=8t=2³r(x); injection then fixes ψ²x=8x | Pass | Preserved |
| Downstream polylogarithmic coordinate conversion | n3,d1,N1; n2,d1,N2 | exponents d−Nn+(n−1)d=0 and−2, respectively; λ contributes λ and not an extra π | Pass | Preserved |
| Opposite Deligne-cone convention | real input r=1,f=0,ω=0 | our last differential +1 maps to −1; opposite arrow −r+f gives −1 on the same input; identity on r,f and negation on ω commute with d | Pass | Explicit cone comparison, BKK versus burgos2002 |


Pull request: #1461 (roadmap/borel-regulators at e39a3c4)
