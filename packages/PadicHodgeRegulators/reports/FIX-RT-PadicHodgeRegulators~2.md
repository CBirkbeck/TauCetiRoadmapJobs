# Repair report: PadicHodgeRegulators

The first fourteen finding sections refer to review RT-PadicHodgeRegulators_r2a; the last three refer to RT-PadicHodgeRegulators_r2b. Overlapping repairs are shared, but each review finding has its own verdict. The evidence and computations below are repair checks, not independent acceptance.

## F01 (P1) — applied

Pass a. §9.4: unused index alone → the §9.1 hypotheses on J∪{j}, including separation. Added rank-one evaluations B(0)=0 and B(5)=5 with inverse 1/5, plus empty/rank-zero controls. LLZ2011 line 1043 uses precisely the missing determinant nonvanishing. The two Lean headlines retain hypotheses only on imposed indices.

## F02 (P1) — applied

Pass a. Vertical-log/rigid equivalence → the horizontal-divisor comparison of CohomologyComparisonsPartII §7.4. Added the weight-one point dimensions 2 versus 1. Rational quotient and derived-reduction bullets now retain §3.4’s arithmetic-pair hypotheses. Evidence: AM2022 line 1302 and line 1314; the vertical point complex has rank-one first differential into a three-dimensional term.

## F03 (P2) — applied

Pass a. Root-class construction in the completion gap → imports from K3BlochGroups §§3.5,4.20,6.3–6.6. Narrowed both gap entries to ordinary/indecomposable quotients and the completed/inverse-limit comparison, retaining TₚK₂. Updated §§5.6,6.5 and both layer dependency lists. The root class of order four at p=5 remains 4⁻¹(4[ζ]). Pass b F01 shares this repair.

## F04 (P1) — applied

Pass a. Uncited finiteness and assumed Borel rank → ArithmeticKTheory §§2.1,3.2–3.4, in ownership, supplier contracts, §§6.1,6.5–6.7 and dependencies. Localization ends in ⊕K₂(𝔽_q)=0, making K₃(𝒪_F)→K₃(F) onto. Rational ranks are 0 for ℚ and 1 for ℚ(i); neither computation assumes regulator injectivity.

## F05 (P1) — applied

Pass a. §4.1’s arbitrary-perfect-residue rational isomorphism → localization sequence; isomorphism for residue fields algebraic over 𝔽ₚ and n≥2. Added the W(𝔽ₚ(s,t)^perf) counterexample and its nonzero boundary {s,t}. Imported ColemanIntegration §L3.Fa.1 and K2SymbolsBrauer §§9.11,11.1,11.3. HK2011 line 145 restricts its ring to a finite extension of ℤₚ.

## F06 (P1) — applied

Pass a. Reconstructed special-unit, cyclotomic and Gros formulas → imports from ColemanIntegration §§L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15. §§4.1–4.5 now compare the supplied normalization with §4.2, preserving the broader perfect-residue Chern comparison. Updated §3.4 and affected Checks: raw coefficients +1 and −2, followed by one orientation transport. Deleted the reversed supply claim.

## F07 (P2) — applied

Pass a. All used weights have equal lattices → equality exactly when a<p. Specified multiplication by a! from EN’s generator to CN’s, retaining it in comparison imports. EN2016 line 95 and CN2017 line 67 give denominators 8 versus 4 at (p,r)=(2,2), and 162 versus 27 at (3,6); at (5,2) both are 1.

## F08 (P2) — applied

Pass a. Dimension-free sharper bound → c₂(d) at p=2, uniform in m and at fixed chart dimension. Kept the separate general exponent N(e,p,r), the directed period map and factorial conversion. CN2017 line 80 explicitly distinguishes these dependencies. Added dimensions 1 and 2 with exponents N+c₂(1), N+c₂(2), versus the common N+c₃.

## F09 (P3) — applied

Pass a. AM18’s author/year → Kazuaki Miyatani/2018; AC20’s year → 2020. Updated README bibliography and existing manifest entries, preserving keys, version IDs and hashes. AM18 line 5 and line 7, AC20 line 5 and line 8 verify these fields. Recorded AM18’s inconsistent internal date, November 1, 2021 (AM18 line 37).

## F10 (P1) — applied

Pass a. Generic finite complex, exact fragments and dual exponential as new outputs → supplied results of NoncommutativeAndEquivariantIwasawa §F.6 and the exponential reexport in PhiGammaModulesAndIwasawaCohomology §5.7. Updated ownership, contracts, §§1.2,1.4 and Layer 1 dependencies. Their arrow remains ((1−φ)x,x̄): the trivial and Tate-one examples give H¹_f dimensions 1 and 1.

## F11 (P2) — applied

Pass a. Reduced comparison assuming vanishing only for F and κ → vanishing for every characteristic-zero field and κ. Weaker assumptions use the unreduced comparison; number fields and weight two remain unconditional. Evidence: BdJ2003 line 162 through line 180 and ColemanIntegration §L3.Fa.4. §4.4’s Checks now distinguish these branches explicitly.

## F12 (P2) — applied

Pass a. Root-class equation on every finite étale algebra → only the odd-p unramified domain and admissible roots of §5.6. The Chern/rationalization/logarithm composite retains all finite local extensions and every p, with its universal sign transported naturally. Added ℚ₅(ζ₅): the composite exists but 5⁻¹ is unavailable in ℤ₅, so no such integral root argument is supplied.

## F13 (P3) — applied

Pass a. Four instruction-only bullets → computed README Checks in §§8.2,8.4,9.26,9.34. Both triangular matrix products equal I; the transposed inverse fails. XE[X] admits X and excludes 1. The Tate-one exponential reaches units but excludes valuation 1. No Lean padding was added; the findings concern README Checks only.

## F14 (P3) — applied

Pass a. Both purported fifth-power expansion tests in §§3.2,6.4 → the computed leading-coefficient Frobenius test. Modulo 5, α⁵=4α+4 and φ(4α²+4α+2)=4α²+4α+2. The printed second row instead gives α+2 on the quadratic factor and 0 on the linear factor. Rechecked §§5.5,5.9,6.8 using its corrected square label (GSWZ2024 line 2705).

## F01 (P2) — applied

Pass b. Shared with pass a F03. K3BlochGroups §§6.3–6.4 own the root multiples and coefficient classes; §6.6 owns the quotient snake sequence and indecomposable/Bloch comparison. Named those suppliers before the completion contract and in §5.6. The remaining gap asks only for the two missing bridges, with finite-product and existing-root compatibility.

## F02 (P3) — applied differently

Pass b. Cleaned three prose-contaminated locators; removed extraction coordinates from README/FO metadata; corrected reciprocity to KTheoryFiniteLocalFields §3.2. Shared bibliographic repair with pass a F09. Rejected the proposed AM18 year 2017: its cited v2 header is 8 April 2018 (AM18 line 5). Printed FO locators resolve at FO line 6878, line 6926 and line 6947.

## F03 (P3) — applied differently

Pass b. Deleted the two unverified roadmap names throughout scope, §6.6’s dependencies, §9.30 and consumers. Named verified consumers HabiroNahmSeries and GrossZagierAndArithmeticHeights. The supplied HabiroNumberFields §§3.0a–3.0b construct the same local theorem themselves, contradicting the proposed consumer attribution. Assigning another roadmap’s ownership cannot be settled here; the overlap is recorded below.

## Required checks and file discipline

| Check | Exact outcome |
|---|---|
| Required elaboration of packages/PadicHodgeRegulators/Suggested.lean, run from the content checkout | Exit 0; exactly three `declaration uses 'sorry'` warnings at lines 42, 80 and 101; no errors. |
| Scratch elaboration with `#check @name` for all seven declarations, run from the content checkout | Exit 0; the same three warnings; every type agrees with its README domain. No binder or declaration changed. An initial invocation from the board checkout failed because it has no default toolchain; rerunning from the prescribed content checkout succeeded. |
| Dependency check after repairs | Exit 0; output below. No UPWARD, CYCLE or moved line. |
| Citation resolver | No unresolved Lean names; one false positive treats FontaineBPR1994 §2.1 as a roadmap. It is the manifest’s existing source entry, not a supplier. Its printed p.153 locator remains. The resolver could not inspect Lake pins from the board; these were inspected directly in the supplied content pins. |
| Source manifest | TOML parses; 32 entries and 32 distinct keys; all 32 recorded hashes have legal cached texts. No additional source or missing-reference request. |
| Diff formatting | git diff --check exits 0. |
| Plan restriction | Only the existing completed-bloch-comparison gap’s needs sentence changed. No other plan field changed. |
| Scope | README, sources.toml, the permitted gap and this report only. Suggested.lean and metadata.toml are unchanged; no tooling, order, sibling, pin or external application edited. No commit. |

Dependency-check output:

```text
depcheck: 39 roadmaps, 404 edges, 0 problem(s)
```

The manifest’s cited_for entries were synchronized with the three renamed comparison headings. No separate gate failures were listed in the brief. The citation-resolver lead was verified as a source/roadmap classification false positive, not suppressed by altering tooling.

## Elaborated contexts and headline truth checks

The pins are Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. The single import is Mathlib; no Tau Ceti object file build was necessary.

| Declaration | Elaborated hypotheses and computed instances | Result/change |
|---|---|---|
| finitePolylog | p prime, n∈ℤ. At p=5,n=2 the coefficients are (0,1,4,4,1), with evaluations (0,0,1,3,0). At n=0 they are (0,1,1,1,1); at p=2 the polynomial is X. | Matches §5.1; unchanged. |
| residueDilogValue | Field F, Algebra (ZMod p) F and prime p retained. At p=5 the values at 0,1,2,3,4 are 0,0,1,4,0; total division gives 0 at the excluded point 1. | Matches §5.2; unchanged. |
| residueDilogValue_spans | p>3 and s>0 retained. At (5,1), values and differences span rank 1. In 𝔽₂₅=𝔽₅[a]/(a²−2), f(2)=1, f(a)=4+2a, f(−1)=0, so both spans have rank 2. At (3,1) the image is {0}, excluded. | Matches §5.5; unchanged. |
| evaluationConstraints | Field E, CommRing R, Algebra E R; no domain/separation assumptions in the definition. In ℚ[X], X meets vanishing at 0, 1 does not; for the diagonal allowed line, (1,1) meets it and (1,0) does not. | Matches §9.1; unchanged. |
| constraint_basis_and_determinant | IsDomain R, InjOn x J, and evaluation, nonzero-factor and kernel conditions only for j∈J retained. Two zero constraints at 0,5 give basis/product X(X−5); two transverse allowed lines give determinant X(X−5). Empty J and d=0 give 1. | Matches §§9.1,9.7–9.8; unchanged. |
| coordinateImageGenerator | Field E, CommRing R, Algebra E R; no unused ev/hker assumptions. For the two transverse lines g₀=X−5, g₁=X; for a diagonal line both are 1; empty J gives 1. | Matches §9.9; unchanged. |
| evaluationConstraints_coordinate_image | Same substantive hypotheses as the basis theorem, plus k∈Fin d,r∈R. For zero constraints at 0,5, r=X(X−5) has itself as witness and is divisible by g; r=1 has neither. A diagonal condition admits every r using (r,r). | Matches §9.11; unchanged. |

For the spanning headline, cancellation gives f=g/(X−1)^(p−2); every fibre has at most p−2 elements. When q>p, (q−2)/(p−2)>q/p excludes containment of the image in any proper affine 𝔽ₚ-subspace, hence proves both spanning assertions. When q=p, inversion pairs the terms at −1 to give f(−1)=0; the nonzero polynomial g, of degree p−3 with g(0)=0, cannot vanish at all p−2 admissible points. These supply zero and a nonzero value.

For the basis headline, an adapted one-point basis is diagonal with codim(V_j) copies of q_j. At the induction step, units remain units under ev_j and ev_j(q_i)=x_j−x_i≠0 at the newly separated point. The determinant therefore multiplies by precisely q_j^codim(V_j). For coordinate images, the kernel conditions give divisibility at forced-zero indices. Conversely, multiply g_k by a Lagrange interpolation row with k-coordinate identically 1 and allowed values at the remaining indices; if there are no remaining indices use g_k·e_k directly. At forced-zero indices g_k already vanishes. These arguments use actual constraint modules and neither conclusion as a hypothesis.

The other headline theorems remain unstatable for the reasons in the module docstring: completed K-theory, syntomic Chern/period-cohomology realizations, étale/Wach modules and the corresponding locally analytic regulator realizations are absent. Direct searches of the pinned carriers/operators found no replacement for these objects. Syntomic morphisms of schemes and real number-field/elliptic regulators in the pins are different objects. No stand-in, extra definition, test theorem or API lemma was introduced.

## Supplier and ownership verification

Read the main-branch LocalGaloisGroups and completed NumberFieldArithmetic roadmaps for shape, including their scope, conventions, layer and dependency organization. Read the package’s README and acceptance file and the cited sections at the provided heads. Object searches covered main, completed roadmaps, board packages and the supplied sibling checkouts; the authorized roadmap index and grep were used as leads. No unseen open head was sought as a new dependency.

| Supplier | Resolved contract and mathematical boundary |
|---|---|
| PadicPeriodRings §§1.5,4.1–4.3 | Topological period rings, invariant functors and fundamental sequence; no independent normalized finite-complex construction is attributed to it. |
| FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.P2–R07.P5 | Period structures, continuous sections, fixed fields and realization data; SelmerIwasawaCohomology §§4.7,4.9 give small-weight realization and propagated finite conditions; §4.26 gives the elliptic tangent/exponential/Kummer comparison. |
| NoncommutativeAndEquivariantIwasawa §F.6 | The exact normalized finite complex, period boundary, dual exponential, adjunction and functoriality are explicit; its general period prefix is independent of its differential branch. PhiGammaModulesAndIwasawaCohomology §5.7 explicitly reexports that prefix. |
| ArithmeticGaloisDuality §R02.1.2 | Continuous inverse-limit cochains; used with the stated coefficient/limit hypotheses. |
| PhiGammaModulesAndIwasawaCohomology Layers 1,3–6, §6.2 | Actual Herr/Iwasawa comparisons, twists, Wach containment and good bases; no arbitrary basis matrix substitutes for them. |
| ColemanPowerSeries Layers 1–2 | Norm-compatible units and series, norm and logarithmic derivative. LocalGaloisGroups Layer 7 and LocalFieldsRamification Layers 1–2 supply multiplicative completion and deep units. |
| PadicMeasuresIwasawaAlgebras; LocallyAnalyticDistributions §§1.1,1.4–1.5,2.1,2.3,3.3 | Bounded versus unbounded coefficients, Amice/Mellin, differential/inverse on ψ-zero and order-r determination retain their distinct domains. |
| KTheoryFiniteLocalFields §§1.5,1.8,3.2,6.6–6.7,7.6 | Finite-field K₂=0, ordinary finite Chern maps, arithmetic reciprocity, completed étale edge and semilocal completion. §§3.3–3.5 also distinguish the uniquely divisible K₂ kernel and root torsion; completion is not ordinary tensoring. |
| K3BlochGroups §§3.5,4.20,6.3–6.6 | Antisymmetric square, enhanced Tor exact sequence, root multiples, coefficient localization and quotient snake sequence. The unramified odd-p quotient kernel vanishes because μ(L) has order prime to p. |
| ArithmeticKTheory §§2.1,3.2–3.4 | Localization, integer-ring finite generation and actual rational localization/Borel ranks. Its rank theorem applies in degree 3; degree-one unit ranks are not used instead. |
| ColemanIntegration §§L0.15,L0.18,L1.1,L1.19,L2.Fb,L2.13,L2.18,L2.25 | Branches, logarithms, good-reduction pairs, Coleman primitives, Bloch presentation and dilogarithms. |
| ColemanIntegration §§L3.Fa.1,L3.Fa.4,L3.Fb.2,L3.Fb.5–L3.Fb.6,L3.14–L3.15 | Rational localization and its residue-field domain, distinct reduced hypotheses, regulator construction, fixed raw signs, Gros depletion and all-order cyclotomic formula. Earlier supplier → comparison here. |
| CohomologyComparisonsPartII §§1.1–1.6,2.1–2.3 | Filtered objects and compactification-filtered nonnegative-weight rigid fibre. Dagger and negative-weight extensions remain explicit gaps. |
| CohomologyComparisonsPartII §§3.1–3.4,4.1–4.4 | Directed divided/undivided maps, arithmetic-pair derived reduction/quotient, modified Tate factors and comparison ranges; c₂ retains chart dimension. |
| CohomologyComparisons §§4.2–4.5; CohomologyComparisonsPartII §§5.1–5.3 | Hyodo–Kato, semistable total fibre and uniformizer transport. Period-coordinate descent remains the named gap; integration descent alone does not fill it. |
| CohomologyComparisonsPartII §§6.1–6.7,7.1–7.5 | Actual relative filtered realizations, independent algebraic finiteness, residue/Gysin and compatible evaluation. §7.4 is the horizontal-log comparison only. |
| ColemanIntegrationPartII §§1.1–1.3,3.0a–3.0c,4.0c,4.2–4.4,5.1–5.5,6.1–6.4,7.1–7.6 | Geometric nodes, single integration, compatible component auxiliary primitives, double/triple indices, trace and integration descent. The full regulator comparison is still owned here. |
| AlgebraicCurves; K2SymbolsBrauer §§9.2–9.4,9.11,9.13,11.1,11.3 | Curves/divisors, tame and higher residues, finite support and product-normalized Quillen comparison. With the parameter last, the residue of {s,t,π} is {s,t}. |
| PadicHodgeTheory | Its period and twist layers supply the realization context; no additional declaration name was invented. |

At the pins, the relevant Tau Ceti definitions were read in TauCeti/RingTheory/Henselian/Teichmuller.lean:92,123,258, TauCeti/NumberTheory/LocalField/UnitsDecomposition.lean:281 and TauCeti/NumberTheory/LocalField/Frobenius.lean:61,74. These require the stated local/Henselian, finite-residue and unramified hypotheses; tame roots have order q−1, not all p-power roots. TauCeti/FieldTheory/GaloisCohomology/Kummer.lean:341 gives the finite Kummer class map with its invertibility hypothesis. Mathlib/Algebra/Module/Equiv/Defs.lean:358 supplies inverse reconstruction; finite-field dimension/cardinality and matrix determinants are native. The seven acceptance names have no competing declaration in the supplied sibling files or pins.

The remaining five gaps have identical slugs in README and plan. The completed-Bloch gap now asks only for missing bridges and compatibility with supplied classes. The dagger, negative-weight, normalized-boundary and semistable-coordinate gaps are unchanged. Their eventual proofs are supplier work, not certified by this repair.

HabiroNahmSeries’s exact supplier contract explicitly requests this local regulator; GrossZagierAndArithmeticHeights’s point-kummer-logarithm gap explicitly requests §1.9’s nonelliptic good-reduction comparison. In contrast, the supplied HabiroNumberFields head expressly owns and constructs the completed comparison, local lattice isomorphism and root generation in §§3.0a–3.0b. Thus pass b F03’s proposed blanket consumer attribution is not supported by that checkout. This overlap requires a maintainer decision in the later roadmap; moving or deleting the existing PadicHodgeRegulators summit would be an unauthorized scope change. No dependency on that later roadmap was added. ModularIwasawaMainConjectures is a merge-order name, but no readable contract for it was supplied or returned by the index; its global signed ownership was not invented here.

## Adversarial mathematics ledger

Each row gives actual values or explicitly computed subspaces, including negative controls. Deep targets remain proof obligations with their cited hypotheses; a finite example does not certify them. Related API identities are checked on the same stated object. The changed comparisons and every added example have separate rows where needed.

| Statement | Instances and values computed | Result | Change |
|---|---|---|---|
| Conventions: Tate basis, twist and filtration | p=5: φ(d₁)=d₁/5, φ(d₂)=d₂/25; Fil⁰ of both positive twists is 0, while Fil⁰ of ℚ₅ is ℚ₅. At ε′=ε², t′=2t and v′₁=2v₁ give d′₁=d₁. | Distinguishes representation and invariant vectors. | None. |
| Conventions: reciprocity and ordered cup | At p=5, log₅6≡55 mod 125. Pairing κ(6) first gives 55, reversing gives −55≡70; over an unramified quadratic field the norm 36 gives 110. | Geometric convention and norm exponent agree. | Correct supplier §3.2. |
| Conventions: logarithm and dilogarithm | log₅5=0, log₅ω(2)=0; D(ω(2))≡25 mod 125; depleted value ≡−1 mod 5. | Zero logarithm does not force zero dilogarithm. | Raw/oriented dictionary clarified. |
| Conventions: twists and row coordinates | χ(σ₋₁)=−1, so Twχ(σ₋₁)=−σ₋₁. Row (1,0) under [[1,1],[0,1]]⁻¹ becomes (1,−1). | Both inverse conventions distinguish their opposites. | None. |
| Supplier: fundamental period sequences | For V=ℚ₅, D_cris^(φ=1)=ℚ₅ and tangent=0; for V=ℚ₅(2), fixed crystalline part=0 and tangent=ℚ₅. | Kernel and positive-boundary domains differ as required. | Ownership only. |
| Supplier: small-weight integral comparison | p=3 admits weights 0,1 but excludes 2; p=5 admits 2 and its logarithm lattice is 25ℤ₅. | Excludes the dyadic and endpoint extrapolations. | None. |
| Supplier: Fontaine Iwasawa equivalence | Tate tower f=1+π has Δf=1 and h(v₁)=κ_Iw(ε)≠0; multiplying the lattice by p multiplies its image by p. | Rejects zero comparison and rational-only torsion detection. | None. |
| Supplier: character twisting | Tw₁x=x; at χ and σ with χ(σ)=2, Twχ(σx)=σTwχ(x)/2. For x=0 both expressions are 0. | Semilinearity uses the transported action. | None. |
| Supplier: h_Iw twist compatibility | N(ℤₚ(1))=π⁻¹A⁺v₁; its Tate tower lies there and twists to the corresponding χ-twisted class. Untwisting gives the original class. | The π exponent and inverse character match. | None. |
| Supplier: ψ-fixed Wach containment | For V=E, 1/π is ψ-fixed but outside A⁺; for E(1), (1+π)/π·v₁ lies in π⁻¹A⁺v₁. | Trivial-quotient hypothesis is necessary. | None. |
| Supplier: lattice/coefficient squares | T′=pT gives h(D(T′)^(ψ=1))=p·h(D(T)^(ψ=1)); the identity coefficient extension has identical modules/maps. | Does not invert p integrally. | None. |
| Supplier: Teichmüller decomposition | ω(2)≡57 mod 125, 57²≡−1 and 7/57≡101≡1 mod 5; at p=2, −1 is principal, tame part=1. | Rejects treating all roots as tame. | None. |
| Supplier: arithmetic Frobenius | On 𝔽₂₅, a²=2 gives a⁵=4a and a²⁵=a; at p=2, (−1)²=1≠−1. | Full root assertion needs odd p. | None. |
| Supplier: ordinary Chern versus edge | Over 𝔽₃, weight 3 modulo 2, both groups have size 2 but multiplier 2!=0 modulo 2; in weight 2 multiplier 1! is a unit. | Same cardinality does not identify maps. | None. |
| Supplier: rigid syntomic fibre | Point r=2,p=5: η(0,c)=25c/24. Point r=0: H⁰=H¹=ℚ₅. A¹ with compactification (ℙ¹,∞): H¹(F¹)=0, versus K[x]dx for stupid truncation. | Positive-weight and filtration distinctions survive. | None. |
| Supplier: dagger versus compactification filtration | At a point with r=2 both normalized H¹ are K and c maps to 25c/24 over ℚ₅; A¹ has compactification H¹(F¹)=0. | Point agreement does not imply affine equivalence. | Gap unchanged. |
| Supplier: undivided/divided fibres | r=0 gives ω=τ=id; r=2 modulo 5 gives ωτ=25=0. Fib(0:𝔽₅→𝔽₅) has H⁰=H¹=𝔽₅, Fib(id)=0. | Killed-error maps are not inverted integrally. | None. |
| Supplier: arithmetic-pair reduction/quotient | At r=0, RΓ_dR/F⁰=0; for a point r=1, the vertical total fibre has H¹ dimension 2. | Does not erase the quotient or its domain. | Arithmetic-pair hypotheses explicit. |
| Supplier: horizontal/vertical comparison | Point r=1: horizontal two-term fibre has H¹ dimension 1; vertical complex has d₀ rank 1 in dimension 3, d₁=0, so H¹ dimension 2. | Claimed general equivalence fails. | Restricted to horizontal projective pairs. |
| Supplier: modified Tate lattices | (p,r)=(2,2): generators 1/8 and 1/4, multiplication 2; (3,6): 1/162 and 1/27, multiplication 6; (5,2): both 1. | Equality iff v_p(a!)=0. | All-weight equality removed. |
| Supplier: Fontaine–Messing maps | Divided weight-one class κ(u); undivided pκ(u), zero modulo p although κ(u) can be nonzero. | Keeps the directed ω conversion. | Factorial transport explicit. |
| Supplier: exact and bounded comparisons | At p=3,r=1 the divided exact range includes i=1; at p=2 it excludes r=1. Sharper exponents at p=2,r=1 are N+c₂(1),N+c₂(2); at p=3 both are N+c₃. | No dimension equality inferred; general N(e,p,r) separate. | Bound corrected. |
| Supplier: finite unramified étale algebras | Cubic mod 5=(X−2)(X²+X+2); discriminant of quadratic=3, a nonsquare. Degrees 1+2=3; empty product rank 0. ℚ₅(ζ₅) has degree 4 and residue degree 1. | Ramified example excluded from unramified carrier. | None. |
| Supplier: completed K₃ | ℚ₂₅×ℚ₅ at p=5 has rank 2+1=3; zero product has rank 0; K₃(ℚ₃;ℤ₃) has ℤ/3 torsion. | Torsion-free claim retains p>3. | None. |
| Supplier: finite Bloch quotients/completion | At p=5, μ(ℚ₅) has order 4, hence T̃/5^ν=0; at ℚ₅(ζ₅), roots have a 5-primary part, so this vanishing argument is unavailable. | Finite Suslin quotient is supplied separately from completion. | Gap narrowed. |
| Supplier: good Wach coordinates | Basis vector b₁ has coordinate 1; p⁻¹b₁ has coordinate p⁻¹. Under diag(2,1), row (a,b) becomes (a/2,b). | Rejects nonintegral basis and wrong direction. | None. |
| §0.1 period conventions | At r=2,p=5, D_dR/Fil⁰=Kd₂ and φ=1/25; at r=0,−1 the quotient is 0. | Correct weight sign. | None. |
| §1.1 local conditions | K=ℚₚ: V=ℚₚ gives dimensions (e,f,g,H¹)=(0,1,1,2); V=ℚₚ(−1) gives (0,0,0,1); V=ℚₚ(1) gives (1,1,2,2). | Both inclusions can be strict. | Generic finite-condition ownership imported. |
| §1.2 exponential kernel/image | ℚₚ(2): tangent→H¹ is a line isomorphism; ℚₚ: tangent and H_e are 0; ℚₚ(1): unit line dimension 1, ambient dimension 2. | Uniformizer not in image. | Exact fragments imported. |
| §1.2 finite complex | V=ℚ₅: differential 0:ℚ₅→ℚ₅, H⁰=H¹=ℚ₅. V=ℚ₅(1): x↦(4x/5,x), rank 1, H⁰=0,H¹ dimension 1. | Same normalization as supplier. | Imported §F.6. |
| §1.3 logarithm | log_BKκ(6)≡55d₁ mod 125; log_BKκω(2)=0. Quotient model Fil⁰=Ee₁,fixed=Ee₂ in E² has quotient 0, versus E if fixed term omitted. | Inverse is on H_e, or the stated quotient. | None. |
| §1.4 dual exponential/adjunction | exp*(logχ)=1 for ℚₚ; for ℚₚ(1), exp*=0 with kernel all two-dimensional H¹; pairing κ(6) with logχ gives log₅6≠0. | H_g, not H_f, is its kernel. | Imported §F.6. |
| §1.5 dimension formulas | At K=ℚ₅ and twists 0,1,2,−1, (dim H_f,dim H_g,dim H¹)=(1,1,2),(1,2,2),(1,1,1),(0,0,1). | Fixed terms and tangent dimensions agree. | None. |
| §1.6 orthogonality | For ℚ₅ versus ℚ₅(1), annihilator of unramified line is the unit line; for ℚ₅(2) versus ℚ₅(−1), annihilator of all H¹ is 0. | Checks both directions. | None. |
| §1.7 restriction/corestriction/Shapiro | Quadratic unramified L/K, twist 2: cor(exp_L(1))=exp_K(2); identity extension gives exp(1). Twists 0 and 1 have H_g dimensions 1 and 2. | No finite-level basis-induced twist equivalence. | None. |
| §1.8 Tate conditions | Over degree-N K: r=1 has dim H_f=N, dim H¹=N+1; r≥2 both N; r≤−1 has H_g=0 but dim H¹=N. | Weight boundary distinguished. | None. |
| §1.9 abelian Kummer logarithm | Torsion P gives κ(P)=0 and log_A(P)=0 after rationalization; at P=0 both 0. If π*ω_E=2ω_f, scalar comparison is 2·AJ, not AJ. | Differential factor retained. | None. |
| §1.10 integral logarithm | ℚ₅,r=2: lattice 25ℤ₅, index 25; ∂²(1)=exp((25/24)d₂). At p=3,r=2, ℤ/3 torsion prevents the lattice isomorphism. | Plus boundary sign and range tested. | None. |
| §1.11 semilocal maps | ℚₚ×ℚₚ, twist 1: (κ(1+p),0),(0,κ(1+p)) are independent, dimension 2; empty product gives 0. | Rejects diagonal replacement. | None. |
| §2.1 generator change | γ′=γ² gives augmentation u=1/2 and logarithmic normalizer doubled; γ′=γ⁻¹ gives u=−γ. | Opposite scalings cancel. | None. |
| §2.2 root-system change | a=2 gives ∂′=∂/2,v′₁=2v₁,d′₁=d₁; a=−1 negates t and v₁. | Product unchanged. | None. |
| §2.3 character specialization | At η=1 get pr₀; at η=χ, σ₋₁ acts by −1; on zero all outputs 0. Conductor-p classes corestrict equally from levels 1,2. | Evaluation action retained. | None. |
| §2.4 positive Kummer comparison | f=1+π gives Δf=1 and nonzero Tate tower class. f₆ gives Δf₆(0)=5/2. At p=5 ordered cup values are ±55 mod 125. | Sign distinguished on nonzero classes. | None. |
| §2.4 period-limit/root correction | Tate tower: T_nL⁺=p⁻ⁿt d₁, so t(d/dt)T_nL⁺=p⁻ⁿt d₁≠0, while every finite rational Kummer class is 0. | Rational finite projections alone insufficient. | None. |
| §3.1 étale dilogarithm | D(−1)=0; D(ω(2))≡25 mod 125; diagonal embedding sends D(x) to (D(x),D(x)); zero algebra value 0. | Admissible/product domains preserved. | None. |
| §3.1 branch witness | At z=5, changing log₅5 from 0 to 1 changes D by ½log₅(−4)≡85 mod 125. | Detects unpinned branch. | None. |
| §3.2 Frobenius square | In cubic residue algebra, α⁵=4α+4 and (4α²+4α+2)^5=4α²+4α+2; on linear factor value=1. The printed second coefficient has value 0 there. | Fifth-power Check corrected. | Both occurrences repaired. |
| §3.2 depletion and trace | On ℚ₅ root ω(2), D/25≡1 and (1−1/25)D≡−1 mod 5; quadratic trace of a restricted D is 2D. | Detects missing Frobenius scaling. | None. |
| §3.3 combined/Bloch map | ξ’s coefficient vector D₅(ξ)/25 mod 5 is (3,1,2) in (α²,α,1). Zero combination gives 0. Inversion-paired symbols give 0. | Combined map has specified components. | None. |
| §3.4 normalization dictionary | Li₁=−log(1−z) makes Li₂−½log(z)Li₁=D. Raw coefficients at n=2,3 are +1,−2. At ω(2), Besser/Gros residues are 1 and −1 after their respective scalings. | One conversion, no new formula proof. | Supplier/raw sign explicit. |
| §3.5 unit log kernel/rank | ℚ₂: log(−1)=0, so kernel includes −1. ℚ₅: logκ(6)≡55≠0. ℚ has unit rank 0; ℚ(√2) at 7 has rank 1 because 1+√2 is not a root. | Full torsion kernel retained. | None. |
| §3.6 norm–trace | Quadratic extension, scalar u=6: log N(u)=log36=2log6≡110 mod 125=Tr(log6); tame root gives 0=0. | Norm direction agrees. | None. |
| §4.1 Chern normalization | In K₀(ℙ²), c₂(𝒪(1)⊕𝒪(1))=h²≠0, but c₂ of each line is 0; positive-degree maps are additive. | Degree zero retains Whitney sum. | Import on supplier domain. |
| §4.1 localization | For k=𝔽_q,n≥2 both adjacent positive rational residue groups are 0. For W(𝔽ₚ(s,t)^perf), ∂{[s],[t],p}={s,t} and the original t-residue is s of infinite order. | General rational surjectivity fails. | Correct domain and counterexample. |
| §4.1 residue survival | Finite purely inseparable extension of degree p^a: norm∘restriction on {s,t} is p^a{s,t}≠0 rationally. Hence no later stage kills the class in the perfect closure. | Witness uses no discrete t-valuation on the perfect closure. | Added explicit argument. |
| §4.2 Chern/Bloch–Kato square | n=1,u=6: exp(log6)=κ(6); n=2 raw root ω(2) has log_BK Chern value≡25 mod 125. | Same raw orientation on both paths. | Tests synchronized. |
| §4.3 weight-two symbol comparison | Cubic norm values: N(α)=−1,N(α²)=1,N(1−α)=1,N(1+α)=1, hence N(1−α²)=1. All are units; [5] at p=5 has valuation 1 and is excluded. | Special-unit domain distinguished. | Formula imported, comparison kept. |
| §4.4 reduced hypotheses | n=3 reduced target needs universal characteristic-zero vanishing plus κ; n=2 needs none. Primitive cube root at p=3 has abs(1−ζ)=3⁻¹ᐟ²<1 but distribution coefficient 1−4²=−15≠0. | Cyclotomic extension is imported; weaker hypotheses only unreduced. | Hypotheses repaired. |
| §4.4 raw coefficient | n=2: (−1)²1!=1; n=3: (−1)³2!=−2. | Detects omitted sign or factorial. | Explicit supplier convention. |
| §4.5 Gros conversion | p=5,n=2: multiplication 1−1/25=24/25 takes D≡25 to a unit≡−1 mod 5; raw n=3 coefficient −2 is depleted as a whole. | Does not reuse Besser lattice as Gros lattice. | Imported formula/comparison only. |
| §4.6 normalized boundary | Point r=2,p=5,i=1: undivided raw boundary maps to 25exp, normalized boundary to exp. At r=0 ω=τ=id; modulo p at r=2 their composite is 0. | No integral inverse inferred. | Existing gap unchanged. |
| §5.1 finite polylogarithm | p=5,n=2: evaluations (0,0,1,3,0); derivative identity coefficient k is k/k²=1/k. p=3 gives li₂(1)=2≠0; p=2 gives X. | Double root requires p>3. | None. |
| §5.2 residue function | p=5: f(2)=1,f(3)=3/2=4,f(4)=0; total f(0)=f(1)=0 but admissible count=3. | Excludes junk total values. | None. |
| §5.3 root reduction | ω(2)^5=ω(2), D/25≡1. At p=2, ζ=−1 has ζ²=1, outside admissible arguments. | Arithmetic argument direction retained. | None. |
| §5.4 special-unit integrality | D(ω(2))≡25 mod 125; D(5)≡5 mod 25, with 5 not a unit. 1+5 has complement −5, also excluded. | Both unit conditions necessary for stated domain. | None. |
| §5.5 residue and difference spanning | In 𝔽₂₅, columns 1 and 4+2a have determinant 2≠0; subtract f(−1)=0 for difference spanning. At p=3,s=1 image is 0. | Full residue field, not only prime field. | None. |
| §5.5 product root-basis Check | Corrected cubic rows (4,4,2),(2,3,1),(3,3,2) have determinant 2 mod 5. | Three values form the asserted residue basis. | Square label retained. |
| §5.6 root class | Order m=4,p=5: 4⁻¹=4 mod 5 and 4⁻¹=19 mod 25; 4·19=76≡1. An order-5 denominator is not a ℤ₅ unit. | Imported coefficient class, new completed image only. | Ownership/gap corrected. |
| §5.6 inverse/product controls | For p>3, root −1 has class 0; the pair (−1,−1) has (0,0). A product root with component 1 is excluded. | Does not treat the raw symbol [1] as a generator. | None. |
| §5.7 local regulator | Over ℚ₅, chosen root maps to 25 mod 125; zero product maps 0→0. Over ℚ₅(ζ₅), composite still defined but rootClassK3(ζ₅) is not. | General composite distinct from restricted root formula. | Domain explicit. |
| §5.8 local isomorphism | ℚ₂₅×ℚ₅ has free rank 3 and target 25(ℤ₂₅×ℤ₅); at p=3, ℤ/3 torsion cannot inject into 9ℤ₃. | Rational rank alone would not give integral bijectivity. | None. |
| §5.8 Nakayama step | Identity on ℤ₅³ has residue rank 3, multiplication 5 has residue rank 0; rank-zero determinant=1. | Rejects rank-only surjectivity. | None. |
| §5.9 finite root presentations | Corrected cubic root rows have determinant 2 mod 5; ℚ₅’s single root value has valuation 2. Empty product has only zero presentation. | Generators lift through the isomorphism. | None. |
| §6.1 global regulator | For ℚ, K₃⊗ℚ=0 and regulator=0; for ℚ(i) source dimension 1,target dimension 2. | No injectivity inference from dimensions. | ArithmeticKTheory imported. |
| §6.2 special-unit presentation | Cubic symbols and complements have norms ±1, so valuations at all finite primes are 0; [5] fails at 5. | All-prime statement uses actual units. | Uses imported formula. |
| §6.3 restriction/transfer | ℚ(ζ₃)/ℚ: Li₂(ζ₃)+Li₂(ζ₃⁻¹)=0; restriction then transfer multiplies by 2. | Additive trace, not product. | None. |
| §6.4 Frobenius | A=4α²+4α+2 is fixed modulo 5; second printed coefficient B=2α²+3α+1 gives B(2)=0 versus A(2)=1. | B cannot be the fifth-power value. | Both Checks replaced. |
| §6.5 torsion/denominators/image rank | Torsion regulator=0; 5β integral bounds D(β) in 5𝒪; for ℚ(√−3), image rank≤1 inside rank-2 semilocal lattice. | Does not assert attainment or full span. | Root owner and finiteness input fixed. |
| §6.6 Habiro export | At p=5,Δ=138 excludes 2,3,23; the local target is 25𝒪. Gros changes a valuation-2 generator to valuation 0. | Export preserves Besser normalization. | Phantom consumer deleted. |
| §6.7 rational versus strong injectivity | Map ℚ²→ℚₚ, (a,b)↦a+αb with α∉ℚ has kernel 0; its ℚₚ-extension kills (−α,1). Totally real F has zero source. | Both directions of the proposed rank criteria checked. | Borel rank imported as theorem. |
| §6.8 cubic example | Discriminant −23; factor degrees 1,2 at 5; root-value determinant 2 mod 5; leading ξ vector (3,1,2) equals row₁+3row₂+row₃ mod 5. | Corrected second row is the square, not fifth power. | Recomputed with changed Frobenius Check. |
| §7.1 normalized curve target | ℙ¹ has H¹=0. For f=2, B=(1+P)(1−P)=1−P²; scalar model P=1/25 gives A=24/25, B=624/625 and B/A=26/25. | Raw p/q coordinates differ by norm sum. | None. |
| §7.1 pairing factor | q=5,γ=2 gives 1−1/(qγ)=9/10. Weight-one H² has φ=q, so 1−φ/q=0. | Inverse needs stated degree/weight. | None. |
| §7.2 open-curve splitting | X=ℙ¹,D={0,∞}: dlog t has residues (1,−1), maps to 0 in H¹(X). Proper elliptic X,D=∅: dimension 2,id; global-function differential quotient dimension 0. | Empty boundary uses derived cohomology. | None. |
| §7.3 curve regulator vector | Constants c∈μ_(q−1) give log c=0 and ε(f,c)=0; {f,f} is torsion, so rational regulator=0. q=5,γ=2 again gives factor 9/10. | Full vector and pairing normalizations consistent. | None. |
| §7.4 Coleman symbol pairing | Adding primitive constant C changes the result by C·deg div(f)=0. On ℙ¹ the target is 0. A nonzero eigen-pairing is scaled by 9/10 if raw coordinate is substituted. | Both allowed invariance and wrong model tested. | None. |
| §7.5 étale/log curve comparison | On ℙ¹ both vectors=0; eigen-pairing q=5,γ=2 has raw=9/10 times logarithmic value. | Uses normalized regP. | None. |
| §7.6 pullback/trace/base change | Elliptic multiplication [2] acts by 2 on H¹ and scales cup by 4=degree. Unramified quadratic change has raw multiplier 1+P, e.g. 26/25 in the scalar model. | Normalized coordinate, not raw one, base changes unchanged. | None. |
| §7.7 semistable/arbitrary reduction | Split Tate graph has one cycle; smooth good reduction has no node correction. Changing branch by λ alters a valuation-one multiplicative logarithm by λ, while unit valuation 0 changes by 0. | Integration input alone does not identify regulator coordinates. | Existing descent gap retained. |
| §7.8 relative symbol extension | {t,1−t} gives 0; zero symbol gives split extension and coordinates (0,0). Nonzero tame residue, e.g. {u,t} with u=2, has residue 2 and does not lift to the proper kernel. | Actual tame kernel, not all symbols. | None. |
| §7.8 relative sign | In a one-dimensional coordinate test with syntomic value 1, n=1 gives R_σ=−1; replacing (−1)^n by +1 gives 1. | Distinguishes the negative comparison. | None. |
| §7.9 compatible specialization | For σ(t)=t^p on W[t], Teichmüller α satisfies σ(α)=α^p. At p=5, α=2 gives evσ(t)=32, F_W ev(t)=2, unequal; Teichmüller α satisfies equality. | Ordinary W-points are not automatically Frobenius morphisms. | None. |
| §7.10 semistable coordinate quotient | Zero cocycle gives (β,ρ)=(0,0). Adding d(a) changes w to w+a and cancels y−Nw,z+Iw. A cocycle (0,y,0) with fixed y≠0 gives (β,ρ)=(0,y). | Continuous coordinate alone loses information. | None. |
| §7.10 branch-change formula | N(a,b)=(b,0),ρ=(0,1),I=id,λ=2: −λρ−λ²Nρ/2=(−2,−2), versus (0,−2) if quadratic term omitted. | N²=0 does not imply Nρ=0. | None. |
| §7.10 geometry/scalars | I₁ loop: b₁=1−1+1=1; I₂ two-edge graph: b₁=2−2+1=1. Rational ξ/2 maps to reg(ξ)/2; ξ⊗a maps to a·reg(ξ). | Retains multigraph and coefficient distinctions. | None. |
| §7.11 edge correction | Loop c=2,index=3: one-orientation contribution 6, half-sum (6+6)/2=6. Parallel edges (2,3),(−2,5) give −4. | Orientation and geometric identities both matter. | None. |
| §7.11 trace/monodromy quotient | Quadratic α²=π: Tr(α²)=2π while Tr(α)²=0. N=0 gives zero edge correction; for nonzero N, annihilator of ker N is im N. | Traces the whole local index, and determines only H/im N. | None. |
| §8.1 quadratic inverse candidate | Φ=2,a=−5,b=6 gives P=1/2; Φ=−1,a=0,b=−1 gives P=−1; Φ=0,a=b=0 gives total P=0, product 0≠1. | Denominator condition necessary. | None. |
| §8.2 two-sided inverse | Φ=[[2,1],[0,3]], P=[[1/2,−1/6],[0,1/3]] gives ΦP=PΦ=I. ΦPᵀ=[[5/6,1/3],[−1/2,1]]≠I. | Noncommutative-matrix control computed. | Instruction replaced. |
| §8.3 Euler inverse candidate | Φ=2,a=−5,b=6 gives Q=−1; Φ=0,a=b=0 gives Q=1; Φ=1,a=−3,b=2 gives s=0,Q=0. | Inverting Φ not required, excluding Euler zero required. | None. |
| §8.4 two-sided Euler inverse | For triangular Φ above, Q=[[-1,1/2],[0,−1/2]], (I−Φ)Q=Q(I−Φ)=I. For Φ=1,s=0 product=0≠1. | Both products computed. | Instruction replaced. |
| §8.5 Euler-operator identity | Φ=2,a=−5,b=6,p=5 gives Q(1−P/5)=−9/10; polynomial numerator/denominator gives the same −9/10. | Scalar witness checks signs/denominators. | None. |
| §8.6 leading Gamma factor | At j=0,−1,−2,−3 values are 1,1,−1,1/2; at j=2 value 2. | Neither p-adic Gamma nor inverse factorial throughout. | None. |
| §8.7 logarithmic factors | At χ³, λ₂=3·2=6; at trivial character ℓ₀=0,ℓ₁=−1. δ₀(0)=1/log u; λ₀=n₀=1. | Removable division not total zero. | None. |
| §8.8 regulator composite | Model h(x)=2x,boundary=3x,Mellin⁻¹=5x gives L(2)=15; using h instead gives 60. Actual φ-fixed Tate tower has regulator 0. | Map order and actual kernel distinguished. | None. |
| §8.9 obstruction | φ=1,k=0 forces f(0)=0; φ=2,p=5,h=1 gives Euler scalars −1,−9, both invertible. Constant lift differences survive at φ=1. | No unique unqualified inverse. | None. |
| §8.10 big exponential | Lift difference t^k v with k<h is killed by ∏_(i<h)(k−i)=0. For k=h=2 value is 2t²v≠0 before invariant quotient. | Quotient/eigencondition needed. | None. |
| §8.11 auxiliary weight | h=1 gives Ω₁L=ℓ₀; h=2 gives Ω₂L=ℓ₀ℓ₁. At χ³ values are 3 and 6. Empty weight tuple uses h=1. | No h=0 unqualified inverse. | None. |
| §8.12 meromorphic extension | m=1 denominator ℓ₋₁ vanishes at χ⁻¹; numerator 1 produces a pole. m=2 introduces ℓ₋₂ on both sides, cancelling on common domain. | Localization alone does not give analytic values. | None. |
| §8.13 ramified interpolation | p=5,n=1,j=−1: Γ*(0)=1 and p^(n(j+1))=1; j=0 gives Γ*(1)=1 and power 5. Zero source gives 0 in both cases. | Negative factor not omitted. | None. |
| §8.14 unramified interpolation | φ=1,j=0,p=5 gives A=0,B=4/5; specialization can vanish although B is invertible. | No need to invert A in this direction. | None. |
| §8.15 singular Euler relation | φ=1/5,j=0 gives B=0,A=4/5; cleared equality is 0=(4/5)b. It constrains b=0 without determining L. | No total-inverse formula. | None. |
| §8.16 growth quotient | Slope −1 yields h=1; slope 0 yields h=0; zero quotient gives zero distribution. | Slope−1 does not supply a boundedness theorem. | None. |
| §8.17 naturality/lattice | Root changes a then b give [σ_a]⁻¹[σ_b]⁻¹=[σ_ab]⁻¹; identity change gives 1. Lattice pT changes source by p, not by p⁻¹. | Wrong root-action direction excluded. | None. |
| §8.18 reciprocity | Ordered cup model e₁,e₂ has values 1,−1 under swap. ι(ℓ₀)=−ℓ₀ and ι(σ₋₁)=σ₋₁ make +σ₋₁ℓ₀ consistent with both swaps; κ(6),logχ gives nonzero 55 mod 125. | Nonzero ordered-sign witness retained. | None. |
| §8.19 determinant | Weights (0,2) give ℓ₀ℓ₁; (1,1) give ℓ₀². At χ³ these are 6 and 9; rank 0 gives product 1. | Multiplicities retained. | None. |
| §8.20 scalar projection | Vector (2,3): projections give 2,3; doubling first functional gives 4; zero functional gives 0. | Scalar normalization is extra data. | None. |
| §8.21 Tate/Coleman sign | f=1+π gives Col₀=L=0. f₆ has Δf₆(0)=5/2 and second logarithmic jet 35/12; Col₀(χ²)=−35/3, L(χ²)=−70/3·d₁. | Detects both sign and missing ℓ₀. | None. |
| §8.21 jet identities | f=1 and f=1+π both give second jet 0; f₆ gives 35/12; multiplying by nonzero constant leaves it unchanged, product jets add. | Denominator f(0)≠0 retained. | None. |
| §8.22 ordinary/multiplicative map | Split α=1 gives trivial-character factor 0. At p=5,α=−1,β=−5, factor (1+1)/(1+1/5)=5/3≠0. Differential rescaling by 2 halves the scalar map. | Split and nonsplit distinguished. | None. |
| §9.1 constraint submodule | ℚ[X], V₀=0 at 0: X included,1 excluded. Diagonal line: (1,1) included,(1,0) excluded. Empty J gives R^d, d=0 gives 0. | Definition needs neither domain nor separation. | None. |
| §9.2 division | Vanishing at 0,5 gives divisor X(X−5). Repeating point 0 admits X but X² does not divide X. | Separation prevents false multiplicity. | None. |
| §9.3 single-condition basis | d=2,V₀=Ee₁ at 0 gives rows (1,0),(0,X), determinant X. V₀=E² gives I, determinant 1. | Codimension controls exponent. | None. |
| §9.4 new-point invertibility | Prior B=X at x₀=0: evaluating at 5 gives 5, inverse 1/5; repeated 0 gives determinant 0. Empty J or rank 0 gives determinant 1. | New point needs its own separation. | Hypotheses repaired. |
| §9.5 transported subspace | V=E(1,0), C=[[1,1],[0,1]] gives W=E(1,−1). C=0,V=0 gives W=E²; C=I gives W=V. | Inverse/right action fixed. | None. |
| §9.6 transport dimension | V=E(1,0),C=diag(2,3): W=E(1/2,0), dimension 1; V=0 gives dimension 0. | Requires invertibility. | None. |
| §9.7 simultaneous basis | Zero rank-one conditions at 0,5: basis X(X−5). Rank two transverse lines: rows (X−5,0),(0,X), determinant X(X−5). | Fits native-module headline. | New-point repair supports induction. |
| §9.8 determinant ideal | Rescale first row above by 2 over ℚ[X]: determinant doubles, principal ideal stays (X(X−5)). Empty constraints give unit ideal. | Generator equality would fail. | None. |
| §9.9 coordinate generator | Transverse lines: g₀=X−5,g₁=X; diagonal line: both 1; empty J: 1. At E=𝔽₂ and points 0,1, zero conditions give X²+X. | Natural subtraction/product conventions safe. | None. |
| §9.10 interpolation witness | Diagonal at 0: (1,1) realizes coordinate 1. Values 0,1 at 0,5 are realized by X/5 over ℚ₅; over ℤ₅ every polynomial has congruent values there modulo 5. | Does not assert integral interpolation. | None. |
| §9.11 exact coordinate image | Rank-one zero constraints at 0,5 admit r=X(X−5) and exclude r=1 on both sides of iff. Diagonal constraint admits every r by (r,r), although the submodule is proper. | Both implications tested. | None. |
| §9.12 Coleman coordinates | f=id,e=id gives id; f=0 gives 0. Row (1,0) under shear U has new coordinates (1,−1), not (1,1). | Generic definition does not construct Wach inputs. | None. |
| §9.14 logarithmic matrix | For actual row map [[1,2],[3,4]], M is that matrix; identity maps give I; diag(1,0) gives determinant 0. | No inferred invertibility. | None. |
| §9.15 expansion | (5,7)M=(26,38), while (5,7)Mᵀ=(19,43). | Row order detected. | None. |
| §9.16 regulator reconstruction | If Col(z)=(5,7), same actual maps give reconstructed row (26,38); f(z)=0 gives (0,0) on both sides. | Arithmetic identity requires actual comparison maps. | None. |
| §9.17 covariance | c=(1,0),U=[[1,1],[0,1]],M=I: c′=(1,−1),M′=U,c′M′=(1,0). With B=diag(2,3) final coordinates=(1/2,0). | Both basis directions verified. | None. |
| §9.18 shear | e₁=2,e₂=3 sends (7,11) to (29,32), determinant −5; at e₁=1,e₂=−4 determinant 5 is nonunit in ℤ₅. Identity parameters give I. | Nonzero determinant alone insufficient integrally. | None. |
| §9.19 lines under shear | r=7/11, output (29,32): (1+3r)29=(2+r)32=928/11. Axes become F′=2G′ and G′=3F′. | Both iff directions follow from inverse matrix. | None. |
| §9.20 avoiding slopes | ℤ₂,r=−2,e₁=4,e₂=2: e₁+r=2,1+e₂r=−3,det=−7 a unit. e₁=2 gives 0 and is excluded. | Infinite maximal ideal needed for finite avoidance. | None. |
| §9.21 rational surjectivity | Ideal (5,X) is proper over ℤ₅[[X]], with quotient 𝔽₅; after inverting 5 it is the whole ring. | Rational onto does not imply integral onto. | None. |
| §9.22 noncritical flag | For two distinct weights with Fil¹ the second line, starting with that line gives intersection dimension 1 instead of required 0. Rank-one flag has dimension 1 and is noncritical. | Stable alone insufficient. | None. |
| §9.23 saturated flag | Rank-one weight r=1: n₁(0)=1, while ℓ₀(0)=0. Rank zero has no steps or factors. | Correct removable quotient, not λ₁. | None. |
| §9.24 logarithmic divisors | Weights (0,2) give (1,n₂). With u=χ(γ), n₂(0)=log u/(u−1), n₂(u−1)=log u/(u(u−1)), both nonzero. | M invertible at required interpolation points despite nonunit global divisor. | None. |
| §9.25 transported specialization | Swapping coordinates with M=[[0,1],[1,0]] takes V=Ee₁ to W=Ee₂; coordinate 1 becomes forced zero. Full Fil with invertible Euler maps gives W=E²,codimension 0. | Uses W, not untransported V. | None. |
| §9.26 exact Coleman image | Rank-one zero constraint at 0 gives image XE[X], with X included and 1 excluded; full allowed fibre gives E[X]. | Explicit instance tests coordinate ideal. | Instruction replaced. |
| §9.26 bounded descent | X has a zero at 0 and is noninvertible analytically; a bounded constant 5 is already a unit in ℤ₅[[X]][1/5]. | Analytic-unit reflection needs bounded finite-free inclusion. | None. |
| §9.27 regulator divisors | Weights (0,2) give (1,ℓ₀ℓ₁); at χ³ second factor is 6. At X=ζ₅−1, λ₂=0, whereas (X−x₀)(X−x₁)=(ζ₅−1)(ζ₅−u)≠0. | Analytic versus bounded divisors distinguished. | None. |
| §9.28 modular relation | p=5,k=2,a_p=0: (g,h)=(1,2) satisfies 2h=4g and ρ=4−4=0; the swapped printed functional gives −6. | Matrix order/factor checked. | None. |
| §9.28 nebentypus | Nontrivial determinant character, e.g. ε(p)=−1, changes untwisted determinant from 5^(k−1) to −5^(k−1). | Trivial companion matrix cannot represent that input. | None. |
| §9.29 integral lower inclusion | P₀=[[0,−5⁹],[1,5]] reduces modulo 5 to [[0,0],[1,0]], square 0. Unit block φ=1 instead has φⁿ(1)=1, so no contraction. | Actual nonordinary contraction, no size bound on h. | None. |
| §9.29 coordinate finite length | (ϖ,X) has quotient residue field of length 1, but becomes full after inverting ϖ. Product ∏_(i<h)(γ−u^i) kills the h-step graded quotient; h=1 gives γ−1. | Finite cokernel is not zero cokernel. | None. |
| §9.30 signed kernel | Col(z)=(1,0) has second coordinate 0; right multiplication by [[1,1],[0,1]] makes it 1. A unit rescaling keeps a zero coordinate zero. | Basis/sign data affect kernel. | Phantom owner removed, export retained. |
| §9.31 character domain | Center η has valuation difference +∞ and lies inside; other torsion component has −∞ and lies outside; equality at threshold p^(N−c) is excluded. | Strict inequality and components retained, including p=2,q=4. | None. |
| §9.32 analytic differential powers | On ψ-zero Amice transform of Dirac at 2, ∂ acts by 2, ∂⁻¹ by 1/2 and exponent 0 by 1; ∂∂⁻¹ acts by 1. | Does not invert ∂ on all Δ. | None. |
| §9.33 de Rham regulator | φ-fixed source gives 0. Conductor-5 quadratic Gauss sum G is nonzero and normalized value G/G=1; using primitive ζ₂₅ with imprimitive character gives 0 by the five-term fibre sum. | Cannot freely enlarge conductor index. | None. |
| §9.34 de Rham interpolation | V=ℚₚ,j=−1 twists to ℚₚ(1): image has valuation 0, uniformizer has valuation 1. j=−2 gives ℚₚ(2), exponential bijective. Γ*(0)=1 in the excluded-surjectivity case. | Negative Gamma existence alone insufficient. | Instruction replaced. |
| §9.35 crystalline extension | The zero vector has value 0 on its entire extension. The rank-one Tate comparison at χ² gives −70/3·d₁ for f₆; a noncrystalline Tate curve has rank 2 but dim D_cris=1, outside this theorem. | Boundary tests do not replace the stated arbitrary-slope/nonsemisimple proof obligation. | None. |
| §9.36 split multiplicative augmentation | α=1 gives augmentation 0; α=−1,p=5 gives factor 5/3≠0. | Containment in augmentation ideal only in split case; no derivative formula inferred. | None. |

## Maintainer consequences

No Lean declaration was renamed, added or deleted. Consumers can continue citing §§0.1,1.9,3.2–3.6,5.4–5.9 and 6.6. The generic finite Bloch–Kato constructions and Coleman regulator formulas are now explicit imports; their regulator comparisons remain here. The global Borel rank is unconditional imported input, while positive-rank regulator injectivity remains a predicate rather than a theorem.

KTheoryFiniteLocalFields still has to supply the narrower completed-Bloch bridges; K3BlochGroups already supplies the finite Bloch quotients and divided root classes. The other four supplier gaps are unchanged. Work required in those suppliers cannot be completed by editing this package, and no additional supplier target was invented.

The ownership overlap with HabiroNumberFields §§3.0a–3.0b is not actionable in this package: it needs a human decision about another roadmap’s scope. The supplied head is later in the merge order and cannot be imported here. The repaired package preserves its existing summit and does not silently reassign it. No new dependency or merge-order edit resolves that external overlap.

All changed statements were rechecked against their domains and the computed ledger above. There is no new uncertified source and no running Lean process left by the checks. A fresh independent review remains necessary.
