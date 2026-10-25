<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1197#issuecomment-6395983931 -->
Review (codex) of 11a21b5

Verdict: needs_changes

1. **F01** (P1) The height-zero étale-descent contract is false with this T(0)

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:260`, with the same contract in `packages/GeneralAlgebraicKTheoryPartII/design/plan.json`, slug `spectral-etale-descent`: “For every E∞ ring R and n≥0”. The convention at README line 25 is T(0)=S[1/p].

   **Claim.** The presheaf K(Perf(−))[1/p] satisfies étale descent on every spectral affine scheme.

   **Witness.** Take p=3 and the finite étale C₂-torsor 𝔽₄/𝔽₂. After derived 2-completion, the asserted comparison has π₋₂ equal to 0 on the source and H²(C₂,ℤ₂)=ℤ/2 on the target.

   **Calculation.** Quillen's finite-field groups give K(𝔽₂)^∧₂≃Hℤ₂≃K(𝔽₄)^∧₂: all positive groups have odd order, and the negative groups vanish. The equivariant rank map identifies the C₂-action on the latter completion with the trivial action. Inverting 3 does not change this completion. Derived 2-completion commutes with homotopy limits, so descent would imply Hℤ₂≃(Hℤ₂)^hC₂. The periodic group-cochain differentials are 0,2,0,2,…; consequently H²=ℤ₂/2ℤ₂. This contradicts π₋₂Hℤ₂=0. The finite-field input is explicitly supplied at README line 41.

   Yuan Theorem 4.3 is indeed stated for n≥0 (`yuan` line 310, manuscript p.8), but its height-zero detector is rational, not this package's global p-inversion detector. This is a convention mismatch in the package, not an error in Yuan.

   **Exact repair.** In both copies of the contract, define the detector used by this theorem as D₀=Hℚ and D_n=T(n) for n≥1, and state descent for L_D(n)K, n≥0. This preserves the single general descent theorem and its atomic contract, without changing the package-wide T(0). Use the same explicit D_n in the adjacent strict-henselian-detection contract at line 262; §6.3 only consumes a positive height. Add the 𝔽₄/𝔽₂ test to prohibit an S[1/p] substitution. Retest: rationalizing makes 2 invertible and H²(C₂,ℚ)=0; both completed π₋₂ values in the counterexample are then zero. The positive-height contract does not assert the refuted comparison.

2. **F02** (P1) James–Thom acyclicity is used without an owned target

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:1879`: “Import the precise connectivity, π₀ and chromatic acyclicity properties of the Thom spectra.” The dependencies at line 1886 name §§4.32–4.33.

   **Claim.** The cited local targets provide the chromatic acyclicity needed to apply §5.6 to y(m) and z(m).

   **Witness.** §4.32 states construction, π₀ and colimits only. §4.33 concerns untwisted reduced suspension spectra. The needed twisted-Thom result is `lmmt` line 948, Lemma 4.15, and line 973 for z(m), printed p.1031.

   For m=2,p=2, the proof needs T(1)⊗y(2)=T(1)⊗z(2)=0. Neither π₀y(2)=𝔽₂ nor π₀z(2)=ℤ_(2) computes those values, and an untwisted James splitting does not compute a Thom spectrum's chromatic homology. At odd primes the source uses an additional Adams vanishing-line argument, `lmmt` lines 954–959. At 2, `akq` line 632, Proposition 2.22, manuscript p.15, is the missing input.

   The same object exists as `CH.13/thom-acyclicity` in `packages/ChromaticHomotopyTheory/design/README.md:1701`. That downstream design cannot supply this package. This finding is about the prerequisite absent here; it does not reopen the settled request to edit the other package in F15.

   **Exact repair.** Move ownership of this particular prerequisite into the local build, before §7.8, and state: for m≥1, T(i)⊗y(m)=0 for 0≤i<m; for p=2, T(i)⊗z(m)=0 for 1≤i<m. Give the all-prime route from Lemma 4.15, including its odd-prime vanishing-line input as an owned mathematical target, and the prime-two Margolis/Adams argument from Proposition 2.22. Point §7.8 to it. Do not add an upward supplier citation. Checks: m=1 has an empty positive range; m=2 has exactly i=1; T(0)y(m)=0 whereas T(0)z(m) has nonzero π₀=ℚ. These values verify the corrected ranges and exclude a false bottom-height assertion for z.

3. **F03** (P2) An object's endomorphism algebra need not be E∞

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:1933`: “apply §4.34 to its E∞ endomorphism algebra”. The same identification is suggested at line 1252.

   **Claim.** A commutative algebra object R in a symmetric monoidal stable category has an E∞ algebra of endomorphisms in the ambient category.

   **Witness.** In Perf(ℚ), take R=ℚ×ℚ. Its ambient endomorphism algebra is M₂(ℚ): E₁₂E₂₁=E₁₁ but E₂₁E₁₂=E₂₂. In contrast, Hom(1,R)=ℚ×ℚ is commutative.

   The source uses B=Hom_(C/J)(1,R), not End_(C/J)(R): `cmnn20` lines 807–808, proof of Theorem 4.2, manuscript p.19. The unital commutative multiplication on R gives this mapping spectrum an E∞ multiplication. Its vanishing makes the unit 1→R null, which implies R=0. Arbitrary ambient endomorphisms only have associative composition.

   **Exact repair.** Name B and its source and target exactly as in the preceding paragraph in §§4.34 and 8.2. Apply unit detection to B and use the unital law to conclude R=0. Alternatively, specify the R-linear endomorphisms in an appropriate R-module category and prove the comparison. Add the ℚ×ℚ matrix test: the repaired B has multiplication (a,b)(c,d)=(ac,bd), while the excluded ambient End algebra has the unequal products above. The statement of the rational-transfer theorem itself need not change.

4. **F04** (P3) Refresh two RefinedTraceMethods references

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:9` and line 206 cite the fixpoint result (line 9: “RefinedTraceMethods §2.4 owns the bounded-above Tate fixpoint lemma”); line 1568 lists “4.9–4.18” for the §5.4 route.

   **Claim.** These cited sections supply the Tate fixpoint result and the Hesselholt–Nikolaus TC assembly input used at line 1561.

   **Witness.** At the supplied open head, `TauCetiRoadmap/RefinedTraceMethods/README.md:567` is the fixpoint theorem in §2.3; line 2309 is the TC C_p assembly theorem in §4.19, outside the cited interval.

   **Exact repair.** Change the two fixpoint citations to §2.3. Add §4.19, “The TC assembly map for C_p”, to the exact supplier contract and §5.4's individual Needs line. This is an available earlier supplier, so no new gap is required. Retest: for trivial rational coefficients the Tate term is zero; for connective coefficients the §4.19 cofiber has p−1 copies of the suspended THH homotopy-orbit term (one copy at p=2). The consumed formulas now have the correct owners and locators. The mechanical order check remains valid.

5. **F05** (P1) The supplier example reverses the Witt-coordinate sign

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:250`: “the characteristic-series action gives a(νx)=1+a₁νx”. Lines 27 and 248 set a(t)=χ(a)=∏(1−a_dt^d).

   **Claim.** Under the stated coordinate convention, evaluating χ(a) on a square-zero νx has linear coefficient +a₁ν.

   **Witness.** In 𝔽₃[ε]/ε², take ν=ε and the Witt unit a=(1,0,…). The defining product gives 1−εx; line 250 gives 1+εx. Their difference 2εx is nonzero.

   **Exact repair.** Write χ(a)(νx)=1−a₁νx. If a positive sign with an ordinary series coefficient was intended, introduce a different symbol b₁=−a₁ and write 1+b₁νx. The first option preserves the already established notation. Retest: the Witt unit χ(1)=1−t fixes [1−εx], and evaluating at x=0 gives 1. The proposed inverse action is excluded. At characteristic two the two signs agree, which explains why a prime-three control is necessary. `weibel` lines 49–51 and 221–224 support the package's negative-product convention; the other local occurrences at lines 27 and 1298–1306 use it correctly.

6. **F06** (P3) One sampled page locator is wrong

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:1721`: “Lemma 2.3, p.1016”.

   **Claim.** LMMT's ring-spectrum T(n)/K(n) acyclicity comparison is on printed page 1016.

   **Witness.** `lmmt` line 316 is Lemma 2.3 on printed page 1017, after the page marker and header at lines 299–300.

   **Exact repair.** Change the page to 1017, retaining Lemma 2.3. Retest the actual use: for n≥1, HF_p has both T(n)- and K(n)-homology zero; at n=0 the global HF_q example has T(0)HF_q=HF_q but K(0)HF_q=0, so the package's positive-height restriction remains necessary.

7. **F07** (P3) A reference retains process history

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:2346`: “replaces the inaccessible author-hosted URL”.

   **Claim.** The reference describes a change made during preparation instead of identifying the edition used.

   **Witness.** The same entry already gives arXiv:2009.07223v3, §4.4 and the extraction locator. The quoted replacement history contributes no mathematical locator.

   **Exact repair.** Delete that clause; keep the legal edition and comparison locator. Retest: `cdh` lines 4319–4346 still resolve the intended parametrized/retractive comparison. This is the remaining instance of the process-language pattern addressed by F09.

8. **F08** (P3) The negative nice-map Check has no input map

   **Location.** `packages/GeneralAlgebraicKTheoryPartII/README.md:1764`: “a map inducing multiplication by 2 on π₀=ℤ”; line 1765 repeats this test.

   **Claim.** Multiplication by 2 on π₀ is an example of an input failing the nice-map condition.

   **Witness.** Every map of the stated unital E∞ rings induces a unital ring map on π₀. On ℤ, such a map sends 1 to 1, whereas multiplication by 2 sends 1 to 2.

   **Exact repair.** Replace these repetitions by the unital square-zero projection Hℤ⊕ΣHℤ→Hℤ. Both π₀ rings are ℤ and the π₀ map is the identity, but rational π₁ is ℚ→0, so it is not 0-nice. The identity of Hℤ remains a positive test, and id_(H𝔽_p) remains an excluded-carrier test. This gives an actual input that distinguishes the rational-equivalence requirement.

Eight findings: three P1, one P2 and four P3. The package is repairable within its stated scope. Its principal purity and positive-height redshift statements survive the checks below. The blockers concern the global height-zero supplier contract, a missing Thom-acyclicity prerequisite, an incorrectly identified algebra in a proof route, and a Witt-coordinate sign.

The authored package files were read without modification. This review uses the main checkout and the open-head index dated 2026-10-25, the supplied board package index, and the specified library pins. Source references below identify the cached edition by manifest key and extraction line; no source passage is reproduced.

## Verified sound

### Previous findings, checked individually

The repair report is a list of claims, not evidence of correctness. The passages quoted here were read in the present README. The old finding identifiers are F01–F16. “Partly repaired” includes a repaired local change whose stated pattern still occurs elsewhere.

| Prior finding | Present repaired passage and location in packages/GeneralAlgebraicKTheoryPartII/README.md | Status and retest |
|---|---|---|
| F01 | §6.6, line 1705: “ΣTHH(S;M)≃ΣM” | Repaired. M=HA gives the class A in degree 1, not degree −1. |
| F02 | §4.31, line 1193: “after 2-localization its connected-cover restriction has Thom ring Hℤ_(2)” | Repaired. The odd-prime sphere retract has π₃=ℤ/3 at 3; no integral Hℤ comparison is left. |
| F03 | §8.8, line 2029: “over 𝔽₄” and “over 𝔽₉” | Repaired. The actions are the named level-three/semilinear actions; group orders are 48 and 24. |
| F04 | §4.42, line 1398: “every discrete associative ℤ/pʳ-algebra A and every i≥1” | Repaired. For A=𝔽₃[ε]/ε², i=2, the K(𝔽₃)-module argument gives zero with no auxiliary n. |
| F05 | Scope, line 11: “the all-spectra finite-localization extension, the truncated-theory Bousfield classes” | Repaired. §4.6 keeps the global kernel; §4.17 keeps BP⟨n⟩ and k(n). The p-local kernel and inverted-BP identity are imported at line 210. |
| F06 | §4.26, line 1098: “imported from StableHomotopyKTheoryPartII PO.4” | Repaired. The general operation and transfer ideal have one owner; this section retains the Morava transfer generator and quotient theorem. |
| F07 | §4.34, line 1256: “Apply §4.27 in its H∞ form at q” | Repaired for unit detection. Hahn's D_p theorem covers H∞ and every finite height; the HF₂ control retains height ∞. The use of this theorem in §8.2 has the new defect R03. |
| F08 | Lines 59–79, 218–238, 260–282: separate “What … must provide (gap:…)” sentences | Partly repaired. All 33 slugs match the plan and have named suppliers; the compound entries were split. The new n=0 descent contract is false under the global convention: R01. |
| F09 | Line 81: “The supplied perfect stable categories and localizing invariants interface guarantees…” | Partly repaired. The interfaces now sit under RefinedTraceMethods and the product interface has API and Checks. One reference still narrates a URL replacement: R07. |
| F10 | Line 270: “gap:kh-simplicial-model”; §4.13 uses explicit Postnikov sections | Partly repaired. The corrected KH/Witt/space references resolve, but the Tate fixpoint and assembly references need R04. |
| F11 | §6.2, line 1631: “Chromatic field maps” | Repaired. This input precedes §6.3 and §6.5; the two uses no longer depend on a later local target. |
| F12 | References, lines 2358, 2384, 2386: “hs”, “mm”, “goerss” | Repaired. These three cited works now have both references and certified manifest entries. |
| F13 | §4.20, line 997: “secondary citation”; §8.9, line 2049 likewise labels the secondary route | Partly repaired. The principal/secondary distinction and old page corrections are present; the sampled §6.7 page still needs R06. |
| F14 | §4.33, line 1235: “a finite p-local spectrum of type m>n” | Repaired. The S/3 control at fixed prime 2 is excluded; §7.7 uses the same condition and §8.9 names the integral localization sequences. |
| F15 | Scope, line 7: “ChromaticHomotopyTheory is a downstream consumer” | Settled as not actionable in this package, for the repair report's stated reason: it cannot edit the other roadmap. That reason is correct. No external edit is demanded here. R02 instead identifies a locally missing prerequisite. |
| F16 | §4.22, lines 1036–1038: the localized norm, Tate cofiber and functoriality API | Repaired. For G=1 the norm is identity and Tate is zero; for trivial C₂ on Hℚ the norm is ×2 and its cofiber is zero. The ordinary K₀ carriers are named at line 37. |

### Principles, structure and elaboration

The scope is a continuation of GeneralAlgebraicKTheory, with the base's stopping point explicitly stated. It retains arbitrary E₁ rings, nonconnective inputs where appropriate, all primes including 2 and 3, noncommutative discrete rings, and the global/rational distinction. No algorithm, sorry'd data, `set_option`, extra roadmap import, or replacement Prop carrier occurs. The only two output files of this review are the report and verdict. No authored source-manifest entry was changed.

There are 103 numbered targets and 103 individual Needs lines, 109 Checks blocks, and 11 layers, each ending in Examples and Dependencies. Definition interfaces have API lists and at least three Check bullets. Counting bullets is not a claim that all of them discriminate: R08 identifies a failed negative control, and R05 a conflicting computed convention. The repaired supplier interface blocks are not new construction targets. The house shape was compared with main's OptimalTransport and ComplexTori roadmaps. There are no invented Lean declaration names in the README. The remaining timeless-style defect is R07.

Elaboration from the content checkout used the required `lake env lean` command on `packages/GeneralAlgebraicKTheoryPartII/Suggested.lean` by its absolute tool argument. It exited 0 with no output and no warnings. The file imports only Mathlib, so no Tau Ceti object build was needed. It has zero definitions, instances, theorems, admitted examples or other named declarations. Consequently the requested per-declaration `#check @name` file and one-tactic padding probes have an empty input set; there is no silently dropped binder and no padding theorem to delete. This is an elaboration result, not evidence of truth of the README.

### Headline coverage at the pins

The module docstring names all the following headline groups and explains their missing carriers. Its 31 bullet groups match the following README inventory; a few groups contain several related theorems.

| README headline targets | Missing pinned carrier/API; Suggested.lean disposition |
|---|---|
| §0.1 compact-kernel localization | Enhanced stable categories, their compact quotients and K spectra; named in docstring. |
| §§1.1–1.4 connective plus, additive Morita/projective K, A-theory | Spectral rings/modules, group-completion K and retractive-space K; named. |
| §§2.1–2.4 restricted excision, quantitative truncation, nonpositive comparison | Spectral K and localizing invariants on E₁ rings; named. |
| §§3.2–3.6 stable envelope, heart comparison, spectral dévissage, bounded-heart fiber | Spectral presheaves, enhanced hearts, K and perfect spectral modules; named. |
| §§4.10–4.12 periodic-space detection | Telescopic functors and homological localization of spectra; named as Bousfield–Kuhn comparison. |
| §§4.18–4.21, 4.30 finite-height and elliptic locality | Oriented ring spectra, chromatic localizations, elliptic spectral sheaves; named. |
| §§4.24–4.29 telescopic Tate vanishing, blueshift, Hahn and converse | Coherent Tate spectra, H∞/E∞ rings, Morava theory and chromatic height; named. |
| §§4.31–4.34 Thom comparisons and ordinary-homology detection | Spectral units/lines, multiplicative Thom colimits and H∞ rings; named. |
| §§4.35–4.37 continuous Witt/NK action and localization | NK groups in all integer degrees with their K-theoretic action; named. |
| §§4.43–4.46 acyclic categorical K, Mitchell, Theorem A | Enhanced K and telescopic localizations; named. |
| §§5.1–5.6 connective cover, high trace, CMNN, purity, nilpotent comparison | K/TC of rings and their T(n)-localizations; named. |
| §§6.1–6.7 upper bound, field maps, lower bounds, redshift, optimality, graded pieces | Spectral rings, chromatic fields/towers and K; named. |
| §§7.2–7.8 nice-map preservation, iteration and coefficient applications | Multiplicative spectral K and the coefficient ring spectra; named. |
| §§8.2–8.5 transfer/cobar/Galois descent and equivariant Morava construction | Linear motives, spectral cobar towers and semilinear spectral modules; named. |
| §§8.6–8.9 ko/tmf purity and supersingular descent | ko, tmf, K and coherent homotopy fixed points; named. |
| §§9.1–9.7 height-one truncation, excision/cdh, polynomial/KH, TC and colimit obstruction | K(1)-local K/TC, enhanced scheme K and KH; named. |
| §§10.1–10.5 additive-to-stable comparison, sifted continuity, cyclic assembly | Enhanced K/TC and orbit-category spectral diagrams; named. |

Ordinary K₀, matrices, rings and quasicategories at the pins do not make any of these spectral statements statable with a few simple definitions. No statable headline was replaced by a scalar identity or a free predicate. The existing ordinary K₀ statements are correctly imported rather than promoted to substitute acceptance tests.

### Pinned declarations opened and object-level duplication audit

Mathlib pin: `6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Tau Ceti pin: `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The following paths are relative to the respective library root.

| Declaration and pinned file | Actual data/hypotheses; computed control and limit of the supplied object |
|---|---|
| `SSet.Quasicategory`, `Mathlib/AlgebraicTopology/Quasicategory/Basic.lean:41` | Inner-horn fillers. The nerve of a discrete two-object category satisfies the condition but has no zero object; it is not thereby stable. |
| `CategoryTheory.Idempotents.Karoubi`, `Mathlib/CategoryTheory/Idempotents/Karoubi.lean:43` | Fields X,p and p≫p=p. On k², diag(1,0) squares to itself, whereas diag(2,0) over ℚ squares to diag(4,0); no enhanced quotient is included. |
| `CategoryTheory.Triangulated.TStructure`, `Mathlib/CategoryTheory/Triangulated/TStructure/Basic.lean:54`; `bounded`, line 262 | Homotopy-category t-structure with integer shifts. `bounded` is plus⊓minus, with object-dependent bounds: k and Σk have amplitudes [0,0] and [1,1], not a common bound for all shifts. |
| `TauCeti.ExactStructure`, `TauCeti/CategoryTheory/Exact/ExactStructure.lean:241` | Preadditive, zero object, binary biproducts; conflations and universal squares. Split k→k²→k has dimensions 1,2,1 and 2=1+1; no stable ∞-category is supplied. |
| `TauCeti.finiteProjectiveModulesExactStructure`, `TauCeti/Algebra/Category/ModuleCat/CartanMap/Basic.lean:222`; `_eq_split`, line 231 | Native finite projective left modules, induced exact structure equal to split. k² has class 2[k]; right spectral modules require the stated opposite-ring comparison. |
| `TauCeti.SplitK0`, `TauCeti/CategoryTheory/GrothendieckGroup/Split.lean:114` | Presented group of split relations; zero morphisms, binary biproducts and essential smallness. [k²]=2[k]. No higher K groups. |
| `TauCeti.AbelianK0`, `TauCeti/CategoryTheory/GrothendieckGroup/Abelian.lean:79` | Exact K₀ of the abelian exact structure. For 0→k→k²→k→0, [k²]=[k]+[k]. No K spectrum. |
| `TauCeti.TriangulatedK0`, `TauCeti/CategoryTheory/GrothendieckGroup/Triangulated.lean:139` | Preadditive, zero object, additive integer shifts, pretriangulation and essential smallness. k→0→Σk forces [Σk]=−[k]. No enhanced localization theorem. |
| `TauCeti.SplitK0.finrankEquiv`, `TauCeti/CategoryTheory/GrothendieckGroup/FiniteDimensionalVectorSpace.lean:148`; `_apply`, line 155 | Retains `[Small k]` and FGModuleCat over a field. Rank-zero/one/two classes map to 0,1,2. This is the degree-zero comparison, not additive K as a spectrum. |

Object searches included spectra/ring spectra, stable enhancements, Waldhausen K, cyclotomic spectra, Grothendieck groups, Karoubi completion, t-structures, power operations, formal-group height, Witt vectors and nilpotent K₀. Spectral-object files found in Mathlib concern triangulated spectral sequences; the other “spectrum” hits are prime/analytic spectra. They do not supply the missing stable homotopy carriers.

`roadmaps grep` was run on main and all 355 indexed open heads, using the objects (Bousfield–Kuhn, Thom/James, Tate, power operations, Mitchell, truncating invariants, stable envelopes, Witt/NK, purity/redshift and cyclic assembly), as well as checking the board package index and local designs. No further duplicate of the package's K-theoretic core was found. The retained §4.18 is more general than BordismFormalGroups F6.5's Landweber-exact coefficient-module locality statement at line 2557; it is an oriented homotopy-commutative ring statement, so it is not a restatement of that input. F05 and F06's earlier duplicate targets are now imports. There are no own Lean names to collide with a sibling's fully qualified declaration.

The external ChromaticHomotopyTheory design still contains overlapping chromatic material, as acknowledged by settled F15. The package assigns it downstream ownership consistently; this review does not require edits outside this package. R02 specifies the one local prerequisite that must be moved with that ownership.

### Supplier resolution and order

All current cross-roadmap citations were resolved again, rather than accepted from the previous round. `roadmaps resolve` found no missing roadmap/name strings. Its library resolver was unavailable in this configuration; the preceding manual pinned-source inspection supplies that part of the audit. String resolution does not catch the semantic locator errors in R04.

| Supplier (path is TauCetiRoadmap/NAME/README.md unless indicated) | Sections opened and what is consumed |
|---|---|
| GeneralAlgebraicKTheory | §§3.12–3.14 (lines 627–657), 6.9/6.19 (1417/1549), 7.1–7.7 (1576–1687), 9.8–9.17 (2117–2264), 10.1–10.13 (2292–2549), 11.15–11.16 (2849/2861), 13.6 (3188), 13.8a–c: classical plus, exact-model K, products/transfers, Nil/Bass, enhanced invariance and finite fields. The coefficient refinements remain in KTheoryFiniteLocalFields. |
| StableHomotopyKTheory | Layers 3–7, particularly §§3.18–3.21 (1156–1191), 5.18–5.19 (2098/2112), 6.1–6.3 (2136–2197), 7.1–7.27 (2215–2576): plus, coherent spectra, connective delooping, Moore coefficients/completion and towers. S/1=0, S/0=S∨ΣS; the package does not silently turn Moore spectra into Hℤ/m-algebras. |
| StableHomotopyKTheoryPartII | `packages/StableHomotopyKTheoryPartII/design/README.md:739`, PO.4 degree-zero operation, and line 783 onward, transfer ideal. The restriction from BΣ_p to BC_p and the mixed-summand transfers have the required inputs. This is the board design, not an invented main-branch module. |
| EnhancedDerivedSheaves (main) | E0.4 (211), E0.7 (360), E3.1 (1121), E5:abstract.1–4 (1440–1512), E5:presentability.1–3 (1597–1698): stability, straightening/Kan extension, monoidal algebra/modules, compactness, Ind and quotients. The E₁ Postnikov extension is genuinely a gap; the animated commutative cotangent material does not already supply it. |
| RefinedTraceMethods | §§2.1–2.17, 4.6, 4.9–4.18 and 6.1: concrete K, localizing invariants, TC/THH, multiplicative K, motives, DGM and Land–Tamme. Read the three named §4.9 parts and §4.18's correction algebra/excision. Stable-K linearization is §4.15. The fixpoint theorem is §2.3, and the missing assembly citation is §4.19 (R04). The open head was used, not the stale board copy. |
| AInfCohomology | §AI.7.2, heading at 3815: relative cyclotomic traces, including circle homotopy fixed/Tate constructions and comparisons. |
| BordismFormalGroups (main) | F1–F3 (46,145,284), F6.1–F6.5 (555,586,760,1248,1526): formal groups, BP/Morava coefficients, localizations, nilpotence and periodicity. In F6.3, line 885 owns the inverted-BP class and lines 1174–1185 own the p-local finite kernel/smashing theorem. F6.5's Landweber-exact height bound is at 2557. |
| GeneralizedCohomology (main) | G2 (211), G3 (663), G4 item 5, G5.1–5.4 (within G5, heading 1373): concrete spectra, localization, orientation, finite duality and KU/KO models. These are constructions of a roadmap, not declarations asserted to be at the pins. |
| TopologicalKTheory | T4 and T7 item 1: Bott/geometric coefficient comparisons. ko degrees 0,1,2,3 give ℤ,ℤ/2,ℤ/2,0 and complexification has α↦2b², β↦b⁴. |
| HomotopySpheres | §§3B, 4B, 4C: James filtration/equivalence, real Bott and Thom-related unstable input. The stable James splitting is a declared extension, not inferred from an isolated Check. |
| EllipticCohomology | E1–E6: original spectral sheaf/coefficient objects, E2's height-one/two realization, E3's sheaf, E5's orientation/units and E6's level structures. Full all-height realization, affineness, precise Galois comparisons and relative Thom colimits remain explicit gaps. |
| ModularCurves (main) | §7E, line 1510: elliptic p-divisible groups and height 1/2 formal groups. This is not the spectral affineness theorem. |
| QWittVectors | §§1.1–1.6, especially §1.3 at line 153: arbitrary positive truncation sets, coordinates, ghosts, F/V and inverse-limit topology. The negative-product characteristic-series bridge is not already a theorem there. |
| KTheoryLowDegrees | §§1.1–1.3 (159–190), §13.1 (1194): projective K₀, stable equality and normalization. No general nilpotent-ideal lifting theorem was found in the cited §1.2. |
| KTheoryFiniteLocalFields | §§1.1–1.6 (197–270), §6.5a (1344): finite-field coefficients/completion and ordinary field étale K. These do not already state spectral-affine descent or the requested arbitrary algebraically closed characteristic-zero comparison. |
| SchemeKTheoryOperations | §§1.1–2.7 (99–627), 3.1–3.5 (663–784), 4.1–4.3 (1053–1102), 4.12 (1401), 5.2–5.9 (1445–1595): enhanced Perf/K, supports, descent criteria, regular homotopy and blowup/Bass theory. General localizing-invariant blowups, approximation/platification and KH/KV are declared extensions. |
| MotivicEtaleKTheory | §7.2, line 673: Deligne-regulator identification, as the scope says. It is not being used to supply finite-coefficient spectral étale descent. |
| AlgebraicTopology (main) | Stages 4 and 8: CW/cofiber and relative homotopy/Hurewicz/Whitehead input, with the stated connectivity conditions. |

The exact prescribed dependency command returned:

```text
depcheck: 50 roadmaps, 586 edges, 0 problem(s)
```

There was no UPWARD, CYCLE or moved line for this package. Reading all 103 Needs lines also confirms Theorem A precedes the CMNN induction and the CMNN induction precedes purity; it does not use purity to prove itself. The moves of chromatic field maps and the power-operation import are in the right direction. The general spectrum K foundations are supplier interfaces, not silently reconstructed targets.

### Declared supplier contracts

All 33 plan slugs occur under the same named supplier in the README, with matching needs text. None names supplier `none`. Atomicity here means one construction/theorem and its necessary structure, not that a construction must discard its functoriality or normalization. The 32 contracts other than the n=0 portion of R01 are acceptable prerequisites after the displayed convention corrections. Their present absence is not a finding. The rows below give concrete input/output controls as well as the scope/minimality audit.

| Gap slug | Supplier section and computed control | Audit |
|---|---|---|
| witt-characteristic-series | QWittVectors §1.3: χ(0)=1, χ(1)=1−t; −t(1−at)′/(1−at)=Σ_(n≥1)aⁿtⁿ; W_∅=0 | The bridge is missing; contract precise. The surrounding example needs R05. |
| multiplicative-postnikov | EnhancedDerivedSheaves E5:abstract.2: R=Hk⊕ΣHk gives τ≤0R=Hk, τ≤1R=R, fiber ΣHk | Coherent E₁ sections/classification are not the existing animated commutative construction. |
| nilpotent-kzero | KTheoryLowDegrees §1.2: K₀(ℤ/9)→K₀(𝔽₃) is ℤ→ℤ, 1↦1; the ideal (3) has square zero | Stable equality alone does not supply the lifting theorem. |
| tc-mod-p-cyclotomic-colimits | RefinedTraceMethods §2.10: empty diagram has colimit 0 and TC(0)/p=0; a constant point diagram gives TC(X)/p on both sides | Separate cyclotomic colimit theorem; connective underlying spectra retained. |
| tc-mod-p-ring-sifted-colimits | RefinedTraceMethods §2.10: constant sifted diagram A has colimit A, giving TC(A)/p→TC(A)/p=id | Distinct ring-functor consequence; no arbitrary ring pushout claim. |
| thh-all-cyclic-assembly | RefinedTraceMethods §2.10: for G=ℤ, G/G is terminal and both sides are THH(R[ℤ]); finite-cyclic subgroups alone would leave only {1} | Full cyclic family and cyclotomic structure are explicit. |
| tc-z-k1-nonzero | RefinedTraceMethods §4.17: at odd p the L_K(1)S summand has nonzero unit; hence the total TC value is not 0 | Separate nonzero-value theorem includes p=2, not just the odd-prime calculation. |
| tc-z-inverse-p-vanishing | RefinedTraceMethods §2.10: TC(ℤ[1/p])^∧p=0, whereas the preceding K(1)-local TC(ℤ) is nonzero | Separate p-inverted value, not a generalized TC truncation assertion. |
| k1-tc-filtered-colimits | RefinedTraceMethods §2.10: constant diagram ℤ gives the same nonzero K(1)-local spectrum on both sides | Colimits explicitly in the localized target; no unlocalized filtered-colimit claim. |
| linear-weak-additive-motives | RefinedTraceMethods §4.6: split C⊕D gives U(C)⊕U(D), and U(0)=0 | Existing localizing motives are not the requested κ-accessible weakly additive A-linear universal category. |
| linear-motive-tensor-unit | RefinedTraceMethods §4.10: U_A(Perf A)⊗U_A(C)=U_A(C), including C=0 giving 0 | Unit and monoidal structure on the specified category, no new unrelated invariant. |
| linear-motive-kzero-unit | RefinedTraceMethods §4.10: [A²]=2[A] maps to twice the unit; [A] maps to 1 | Degree-zero comparison and normalization are one map. |
| linear-motive-projection-formula | RefinedTraceMethods §4.10: A→A×A gives transfer [B]↦2[A]; projection formula on [A] reads 2=2 | Perfectness supports restriction; not demanded for extension. |
| spectral-etale-descent | KTheoryFiniteLocalFields §6.5a: p=3, 𝔽₄/𝔽₂, n=0 gives completed π₋₂ 0 versus ℤ/2 | R01. Positive-height and rational versions must be distinguished. |
| spectral-strict-henselian-detection | KTheoryFiniteLocalFields §6.5a: R=HL for algebraically closed L gives R^sh=R and identical nonzero values; R=0 has no primes and fails the nonzero hypothesis | Section does not supply this spectral theorem. Align the n=0 convention with the source as in R01. |
| suslin-algebraically-closed-comparison | KTheoryFiniteLocalFields §6.5a: at L=ℂ, completed K₀=ℤ_p=π₀ku_p and π₁ku_p=0 | Characteristic zero and algebraic closure retained; not the finite-field formula Hℤ_p. |
| localizing-nisnevich-descent | SchemeKTheoryOperations §4.12: identity distinguished square maps to an identity pullback; empty scheme gives 0 | Existing geometric criterion alone is not the invariant-on-Perf theorem. |
| localizing-derived-blowup | SchemeKTheoryOperations §5.7: a unit-generated center is empty and the blowup is identity, giving E(A)≃E(A) | General finite-sequence derived theorem exceeds the supplier's regular blowup statement. |
| abstract-blowup-noetherian-approximation | SchemeKTheoryOperations §5.7: a square already over noetherian ℤ descends to itself with identity base change | Finite presentation hypotheses retained; separate approximation result. |
| abstract-blowup-platification-domination | SchemeKTheoryOperations §5.7: identity modification over U=X is dominated by the identity blowup | Schematically dense U and noetherian hypotheses retained; separate domination result. |
| kh-simplicial-model | SchemeKTheoryOperations §5.2: A[Δ⁰]=A, A[Δ¹]≅A[t]; central variables for noncommutative A | Actual geometric realization is missing, not replaced by a Prop-valued KH stand-in. |
| kh-regular-comparison | SchemeKTheoryOperations §5.2: field k gives K₀=KH₀=ℤ, K₋₁=KH₋₁=0 | Separate comparison, regular noetherian assumptions retained. |
| kv-relative-comparison | SchemeKTheoryOperations §5.6: identity pair has relative K=0, all spectral-sequence terms and relative KH=0 | Uniform lower bound is explicit, not pointwise convergence. |
| kh-nilpotent-invariance | SchemeKTheoryOperations §5.6: k[ε]/ε²→k gives KH→KH equivalence; K₁ has the extra subgroup 1+εk≅k | Distinguishes KH from ordinary K, and covers all integer degrees. |
| stable-james-splitting | HomotopySpheres §3B: W=* gives 0; W=S² gives summands S^(2r), r≥1; W=S⁰ would give monoid ℕ versus group ℤ | Connected, pointed and reduced hypotheses exclude the wrong model. |
| all-height-morava-realization | EllipticCohomology E2 items 2–3: height 1 has no deformation parameters; height 3 has two, u₁,u₂ | The current height-one/two realization does not provide all finite heights. Marking and semilinear action retained. |
| elliptic-spectral-affineness | EllipticCohomology E3: under the claimed equivalence Otop maps to ΓOtop and Otop⊗0 maps to 0 | A sheaf of spectra alone does not give the colimit-preserving QCoh/Mod equivalence. |
| elliptic-level-three-galois | EllipticCohomology E6: GL₂(𝔽₃) has (9−1)(9−3)=48 elements; 3 is inverted | Level sheaves/deck maps alone do not supply faithful spectral Galois descent. |
| elliptic-supersingular-at-two | EllipticCohomology E2: p=2, residue field 𝔽₄, height 2, deck group order 48 | Identifies the actual level-three E₂ with action, not an arbitrary Morava E₂. |
| elliptic-supersingular-at-three | EllipticCohomology E2: p=3, residue field 𝔽₉, full semilinear group order 12·2=24 | Separate fixed-point comparison; not an equivariant E₂ identification of TMF(3) at 3. |
| spectral-units-and-lines | EllipticCohomology E5: π₀GL₁Hℤ={1,−1}; 2 is excluded; R=0 has its one contractible unit component | Units and the classifier of lines equivalent to R are one coherent carrier interface. |
| relative-thom-colimit | EllipticCohomology E5: constant line on *=R; empty source gives 0; constant line on X gives R⊗Σ∞₊X | Missing relative colimit construction, with naturality. |
| multiplicative-thom-refinement | EllipticCohomology E5: the unit loop map *=Ωⁿ* gives the unit E_n algebra R; n=1 yields associative structure | Multiplicative refinement is distinct from the underlying colimit. |

### Seeded source verification

All 30 manifest works are recorded as certified and have readable local extractions. No locator was flagged unverified in the manifest or the README. The 15 mandated targets were opened at the following actual passages, including the proof passages where the target uses more than a named theorem. Printed page numbers are distinguished from manuscript pages.

| Seeded target | Text actually read; hypotheses and conclusion checked | Result |
|---|---|---|
| 1.1 General linear groups | `bgt` lines 3128–3148, Lemma 9.39/Proposition 9.40, pp.819–820; `lt` lines 689–727, Lemma 2.4, manuscript pp.16–17; `lmmt` lines 491–521, Proposition 3.1 proof, pp.1021–1022. Connective E₁ rings, units in matrix π₀, stabilization and positive K-space. | Supported. K₀ is not incorrectly absorbed into the connected plus space. |
| 2.3 Rational and p-adic truncation | `lt` lines 689–727, Lemma 2.4 and proof, manuscript pp.16–17; `lmmt` lines 672–679, p.1025. π₀ isomorphism, coefficient Λ and n≥1 are retained. | Supported; p-inverted spectra have zero mod-p fiber and the resulting K comparison is p-adic. |
| 3.5 Finite-limit control | `pp` lines 1627–1669, Lemmas 4.24–4.25/Theorem 4.26, manuscript pp.35–36; `lmmt` lines 771–790, Proposition 3.12 proof, p.1027. Additive finite-limit input; stable input for the exact-presheaf kernel. | Supported; no general finite-limit theorem for an arbitrary additive category is claimed. |
| 4.5 Finite chromatic localizations | `lmmt` lines 335–357, Definition 2.5/Lemma 2.6, pp.1017–1018. p-inversion bottom versus rational bottom. | Supported. The two functors differ on S/q, q≠p. |
| 4.24 Kuhn Tate vanishing | `cm-tate` lines 118–133, Theorem 2.6/Corollary 2.7, pp.3–4; `kuhn-tate` lines 151–164, Theorem 1.5/Corollary 1.7, manuscript pp.4–5. Finite coherent group action and localized norm. | Supported. The Tate spectrum is localized after formation; raw Tate need not be zero. |
| 4.26 Morava power operations | `hahn` lines 62–68, 167–208, 296–331, 337–360, Theorems 1.6/3.3 and Definition 4.1, pp.2,4–5,7–9. Module quotients and coordinate divisibility checked. | Supported in the written range; k=0 is separately owned, not substituted into the printed k≥1 theorem. General P is imported. |
| 4.34 H∞ unit detection | `may-nilpotence` lines 47–49, Theorem B, p.2; `hahn` lines 19–36, H∞→D_p and Theorem 1.3; `cmnn20` lines 798–817, p.19. Rational and every mod-prime homology are needed. | Main theorem supported. The source uses Hom(1,R) in the quotient application: R03. |
| 5.4 CMNN finite-sphere vanishing | `lmmt` lines 116–120, p.1013, and 694–733, pp.1025–1026; `cmnn24` lines 827–925, Theorem 4.6, Lemma 4.9, Theorem 4.10 and Corollary 4.11, manuscript pp.19–21. | Supported for n≥2. The source's shifted induction and base case avoid high trace at height 1. Missing supplier citation is R04. |
| 5.5 Purity | `lmmt` lines 122–125 and 680–693, pp.1013/1025. All E₁ rings and n≥1, with global T(0)=S[1/p]. | Supported. Theorem A plus CMNN, followed by the module/fracture argument, is not circular. |
| 6.7 Graded redshift | `lmmt` lines 175–186, p.1014, and 316–329, Lemma 2.3, p.1017. Compare vanishing, not equivalence of towers. | Written positive-height version is sound; p-locality handles the n=0 extension. Page correction R06. |
| 7.7 Suspension A-theory | `lmmt` lines 919–928, Corollary 4.14 and proof, p.1030. Connected W and reduced suspension acyclicity. | Supported. The repaired p-local finite-type example avoids the S/3 counterexample. |
| 7.8 James-filtered Thom K | `lmmt` lines 948–975, Lemma 4.15/Corollaries 4.16,4.18, p.1031; `akq` lines 632–661, Proposition 2.22, manuscript p.15. m≥1, z only at 2, positive range for z. | Statement supported. Its acyclicity proof input is not owned in the listed prerequisites: R02. |
| 9.4 Height-one homotopy invariance | `lmmt` lines 1068–1088, Corollary 4.25/Remark 4.26, pp.1033–1034. Connective, K(1)-acyclic E₁ rings and central polynomial variables. | Supported. Both the mod-p-torsion and p-inverted divisible NK arguments keep their hypotheses. |
| 9.5 KH comparison | `lmmt` lines 1089–1093, Remark 4.27, p.1034. Discrete rings, polynomial realization and realization compatibility. | Supported conditional on the explicit KH/KV contracts, rather than a nonexistent existing KH carrier. |
| 10.5 Telescopic Farrell–Jones | `lmmt` lines 1197–1215, Proposition 4.33/Corollary 4.34, p.1036. Every discrete group, all cyclic subgroups, arbitrary E₁ ring, n≥2. | Supported. Passing through connective covers and the high trace comparison keeps the required range. |

The repair-dependent passages were also read in `thom` (Theorem 5.7), `akq` (§2.1), `hahn` (H∞/D_p form), `weibel` (characteristic-series action), and the current supplier heads. Older unsampled source checks are retained only with the previous review's concrete calculations, not with its uncomputed “sound” summaries. The table below records those retained calculations alongside fresh tests. The source texts were not exhaustively re-proved; the task is to verify the stated locators, hypotheses, ownership and adversarial instances.

### Computed adversarial pass

The following table has one row for every numbered target, plus standing conventions and supplied interface blocks. It records computations, not the word “checked” as a substitute for them. Unchanged computations from round 1 are retained as permitted by the brief; all changed targets and all 15 seeded targets were re-read and their displayed instances recomputed. “Pass” is limited to the displayed tests and the stated source/ownership audit, not a formal proof. New contract calculations are in the preceding 33-row table. No numerical total-function division, natural subtraction or out-of-range index is silently used: n−2 only occurs with n≥2, and Witt division uses a series with constant coefficient 1.

| Target | Statement | Instances | Computed values on the two sides | Result | Repair/change |
|---|---|---|---|---|---|
| C1 | Restriction/transfer normalization | R→R; free B/R rank d=1,2 | [R²]↦2[R]; [B]↦d[R]: 1↦1, 2↦2 | Pass | No change |
| C2 | Connectivity conventions | S¹→*; ΣHℤ→0; k→0→Σk | fibres S¹ (0-connected) and ΣHℤ (π₀=0): both 1-connective; [Σk]=−[k] | Pass | No change |
| C3 | Hom versus hom | X=ΣHk,Y=Hk in Hk-modules | π₋₁Hom=k; π₋₁τ≥0Hom=0 | Pass | Ambient category made explicit in this test |
| C4 | T(0)=S[1/p], heights | p=2: HF₃, Hℚ; R=0 | T(0)⊗HF₃=HF₃≠0, Hℚ⊗HF₃=0; ht(0)=−1 | Pass | No change |
| C5 | Witt series, ghosts, NK symbol | a=(a₁,0,…); ν²=0, a=1−rt | −tχ′/χ=Σa₁ⁿtⁿ=Σ_{d∣n}d a_d^{n/d}; a(νx)=1−rνx, value 1 at x=0 (weibel Ex. 3.2) | Pass | No change |
| C6 | Finite-field K values | q=2,3; r=1 | K₁(𝔽₂)=0, K₁(𝔽₃)=ℤ/2; K₂=0 | Pass | No change |
| C7 | ko coefficients, complexification | degrees 0–3, 4, 8 | ℤ,ℤ/2,ℤ/2,0; α²=4β; c(α)=2b², c(β)=b⁴ | Pass | No change |
| C8 | Tate values | Hℚ trivial action; S with C_p | (Hℚ)^{tC_p}=0 (p invertible); S^{tC_p}≃S_p^∧ (Segal/Lin) | Pass | No change |
| C9 | Witt zero/unit and coordinates | χ(0),χ(1); ν=ε in 𝔽₃[ε]/ε² | 1,1−t; χ(1)(εx)=1−εx, versus line 250:1+εx; difference 2εx≠0 | Fail | R05 |
| C10 | James cells | W=S², S⁰ | J_rS² cells 0,2,…,2r; J(S⁰)=ℕ vs ΩS¹≃ℤ | Pass | No change |
| S1 | Imported exact sequences | C→C→0; C=0 | F(C)→F(C)→0 has fiber F(C); zero sequence gives 0 | Pass | F09 repaired |
| S2 | Perf and K of ring spectra | A=0; HR | Perf(0)=0, K(0)=0; π₀K(HR)=K₀(R) | Pass | No change |
| S3 | Imported S-construction | X→Y→Z; S₁ | d₀,d₁,d₂=Z,Y,X; S₁=C; on k→0→Σk: 0=1−1 | Pass | F09 repaired |
| S4 | Swindle and Knc | id⊕T≃T; Perf(k) | [id]=0 ⇒ Knc=0; π₀=ℤ, K₋₁=0 | Pass | No change |
| S5 | LT replacement | identity square on A | C≃A, cartesian | Pass | No change |
| S6 | Idempotent completion | finite-free (k×k)-complexes | K₀=ℤ→ℤ² diagonal (agrees with RTM §4.9 Check) | Pass | No change |
| S7 | Imported product interface | degrees 0,1; zero category; field k | [k]·[k]=[k]; unit 1; degree-(1,1) interchange sign (−1)¹=−1; K(0)=0 | Pass | New interface API/Checks read |
| 0.1 | Compact-kernel K sequence | q=id; q:D→0; A=0 | fibres 0 and K(D); all zero | Pass | No change |
| 1.1 | GL and plus comparison | r=0,1,2; A=Hℤ or Hk⊕ΣHk | GL₀=*; π₀GL₁Hℤ={±1}; GL₂(Hℤ)=GL₂(ℤ); π₁GL₁(Hk⊕ΣHk)=k | Pass | Seed recomputed; connective/positive K retained |
| 1.2 | Additive/projective K | Vect_k; zero category; Perf(k) additively | π₀=ℤ,0,⊕_(j∈ℤ)ℤ respectively; finrank sends [k²] to 2 | Pass | F16 carrier citation repaired |
| 1.3 | Schwede–Shipley | X=A right modules; A⊕A | End(A)=A by left multiplication; Hom(A,A²)=A² | Pass | No change |
| 1.4 | A-theory | X=*, S¹; finite vs finitely dominated | S[Ω*]=S; S[ℤ]; K₀: ℤ vs K₀(ℤ[π₁X]) | Pass | No change |
| 2.1 | Restricted truncation | M⊗R=0; F=0; K on Hk⊕ΣHk | M⊗N=(M⊗R)⊗_RN=0; 0≃0; relative π₂=k≠0, so K is not truncating | Pass | No change |
| 2.2 | Restricted excision/nilinvariance | identity-leg Milnor square; k[ε]→k | correction = A′, cartesian; LT (E1)(E2) l.1182–1183 | Pass | No change |
| 2.3 | Coefficient truncation | A=B; p=2,3; S[1/p]→Hℤ[1/p] | identity fiber=0; both ring spectra mod p=0; relative K mod p=0 by the coefficient theorem | Pass | Seed recomputed; n≥1 and π₀-iso explicit |
| 2.4 | K_{≤0} of connective R | Hℤ; Hk⊕ΣHk; j=0,−1 | K₀=ℤ, K₋₁=0 on both sides | Pass | No change |
| 3.1 | Bounded t-structures | Perf(k): Hk, ΣHk; Sp | amplitudes [0,0], [1,1]; τ≤0S=Hℤ is not finite | Pass | No change |
| 3.2 | Stable envelope | Projω(Hk); 0; Perf(k) | Perf(k), K₀=ℤ; 0; additive ⊕ℤ vs stable ℤ | Pass | No change |
| 3.3 | Theorem of the heart | Perf(k) | K₀(heart)=K₀=ℤ, [Σk]=−1; K₋₁=0 (agh Theorem 3.18) | Pass | No change |
| 3.4 | Regular devissage | Hk[u]; ku→KU | cofib(Σ²R→R)=Hk; K(ℤ)→K(ku)→K(KU) (lmmt l.989) | Pass | No change |
| 3.5 | Finite-limit control | C=0; stable C with k→0→Σk | presheaf/kernel for 0=0; Euler relation 1+(−1)=0; generator has finite amplitude | Pass | Seed reread; finite limits required |
| 3.6 | Levy fibre | C=0; Perf(k) | D=0; e_j↦(−1)^j kills e₀+e₁ | Pass | No change |
| 4.1 | Telescopes, T(0) | p=2, HF₃; nilpotent self-map; v² | HF₃[1/2]=HF₃; Tel=0; Tel(v²)≃Tel(v) | Pass | No change |
| 4.2 | Periodic groups | *; Σ^rHF_p; HF_q | 0; 0 (bounded, lmmt 2.2(ii)); π₀[1/p]=𝔽_q | Pass | No change |
| 4.3 | Acyclicity criteria | Hℤ, Hℚ, n=1 | positive periodic groups 0; (Hℚ)^∧_p=0 yet T(0)Hℚ=Hℚ | Pass | No change |
| 4.4 | Ring K(n)/T(n) acyclicity | HF_p; HF_q | both kill HF_p; T(0)HF_q≠0=K(0)HF_q | Pass | No change |
| 4.5 | Two finite localizations | n=0, p=2; X=S/3 | L₀^fX=0 versus L₀^(p,f)X=S/3; on S: Hℚ versus S[1/2] | Pass | Seed recomputed; different bottom detectors preserved |
| 4.6 | Global finite kernel | n=0,p=2; S/2,S/3 | p-inversion kills S/2 and fixes S/3; only the first lies in the global kernel | Pass | F05: p-local theorem imported |
| 4.7 | p-local comparison | S_(p); HF_q | Hℚ, Hℚ; HF_q vs 0 | Pass | No change |
| 4.8 | Fracture squares | m=0,n=1, X=HF_q | L_F X=0, L_E X=HF_q, corner 0 ⇒ pullback HF_q | Pass | Prior locator/import repair verified |
| 4.9 | Bottom comparison | p=2, HF₃; Hℚ | HF₃=HF₃[1/2]; Hℚ | Pass | No change |
| 4.10 | Φ_v | finite Postnikov X; v, v² | 0; cofinal ⇒ equal | Pass | No change |
| 4.11 | Bousfield–Kuhn Φ_n | Hℤ; T(n); Σ⁻¹Hℚ | 0; L_T(n)T(n)≠0; Ω^∞=* | Pass | No change |
| 4.12 | Σ∞Ω∞ detection | Hℤ→0; Σ⁻¹Hℚ→0 | Σ∞ℤ has sphere summands (lmmt l.402–404); detection fails non-connectively | Pass | No change |
| 4.13 | Postnikov/cover conventions | K(ℤ,1),r=2; S³→K(ℤ,3) | K(ℤ,1)⟨2⟩=*; fiber of identity-on-π₃ map has π₂=0; using ℤ_p instead gives ℤ_p/ℤ | Pass | F10 repaired locators |
| 4.14 | Fibrewise homology | id; ∅→*; E=0 | E→E; 0→E fails unless E=0 | Pass | No change |
| 4.15 | Connective periodic vanishing | n=1,2 | m=n+1=2,3 (lmmt Remark 2.12) | Pass | No change |
| 4.16 | Preservation by Σ∞Ω∞ | Hℤ→0, m=2 | fibre π₀=ℤ fails 2-connectivity: no contradiction | Pass | No change |
| 4.17 | Truncated Bousfield classes | n=0,1; smash with H𝔽_p | BP⟨0⟩=Hℤ_(p), rational-plus-H𝔽_p support; BP⟨1⟩⊗H𝔽_p≠0 versus E(1)⊗H𝔽_p=0 | Pass | F05: inverted BP identity imported |
| 4.18 | Height locality | 𝔾_m, 𝔾_a/𝔽_p, elliptic | heights 1, ∞, ≤2; [p]=0 fails any bound | Pass | No change |
| 4.19 | Telescopes on L_n-local | n=1 Hℚ; n=2 L₁S | T(1)Hℚ=0; T(2)L₁S=0 | Pass | No change |
| 4.20 | T(1)=K(1) | p=2,3: Hℤ, KU_p | both kill Hℤ, both detect KU_p | Pass | Prior locator/import repair verified |
| 4.21 | BP⟨n⟩ support | p=2: BP⟨1⟩→E(1), degree −2 | rational π₋₂: 0 vs ℚ (v₁⁻¹, \|v₁\|=2) | Pass | No change |
| 4.22 | Localized norm and Tate | G=1; trivial C₂ on Hℚ | norm=id, Tate=0; norm ×2 has inverse ×(1/2), cofiber=0 | Pass | F16 API repaired |
| 4.23 | Transfer splitting | L=Hℚ, C₂, C₃ | (1/2)·2=1, (1/3)·3=1; integral Ω^{∞+1} section (cm-tate l.110) | Pass | No change |
| 4.24 | Telescopic Tate vanishing | trivial C_p on KU_p; p=2 | raw π₀ Tate=ℚ_p(ζ_p), at 2 equal to ℚ₂; T(1)-localization=0 | Pass | Seed recomputed; raw vanishing is not asserted |
| 4.25 | Tate blueshift | n=1: X=0; X rational | 0; X^{tC_p}=0 | Pass | No change |
| 4.26 | Morava quotient operation | p=2,3; h=2,k=1 at 2 | res P(2)=4,8 versus 2; transfer differences 2,6; mod(2,u₁), [2](z)=z⁴g₂, g₂(0)=u₂ | Pass | F06 imports P; seed quotient/coordinate computation repeated |
| 4.27 | Hahn in H∞/D_p form | H𝔽_p,Hℚ; h=0,1 | all finite K(i)H𝔽_p=0; K(0)Hℚ≠0 but K(1)Hℚ=0; H∞ supplies a D_p structure at each p | Pass | F07 generality repaired |
| 4.28 | ht_p | 0, HF_p, Hℚ, HF_q | −1, −1, 0, 0 (lmmt l.157) | Pass | No change |
| 4.29 | Tate-height converse | R rational, i=0; R=E₁, i=1 | R^{tC_p}=0 ⇒ T(j)R=0 ✓; L_T(1)E₁^{tC_p}=0 ⇒ L_T(2)E₁=0 ✓ | Pass | No change |
| 4.30 | tmf bounds | tmf→Tmf; Δ²⁴ | fibre τ≤−1Tmf bounded above ⇒ T(n)-equivalence n≥1; \|Δ²⁴\|=576 | Pass | No change |
| 4.31 | Hopkins–Mahowald | p=2 unit; integral sign restriction at 3 | 1−2=−1; 2-local connected-cover Thom π₀=ℤ_(2); unlocalized model at 3 has π₃ containing ℤ/3 versus Hℤ_(3):0 | Pass | F02 restricts the sign-cover comparison correctly |
| 4.32 | Filtered Thom constructions | m=0,1; p=2 | y(0)=S₂^∧ with π₀ℤ₂; π₀y(1)=𝔽₂; π₀z(1)=ℤ_(2); colimits H𝔽₂,Hℤ_(2) | Pass for constructions | Does not provide the chromatic values used in R02 |
| 4.33 | Reduced James acyclicity | W=*,S²; E=Hℚ; p=2 add a mod-3 Moore summand | *=0; S² gives rational classes in degrees 2r,r≥1; ΣS/3 survives S[1/2] | Pass | F14 now excludes the non-p-local example |
| 4.34 | Ordinary-homology unit detection | B=0,Hℚ,H𝔽₂; q=2,3 | all homologies of 0=0; Hℚ detects itself; π₀(H𝔽₂⊗H𝔽₂)=𝔽₂, rational/mod-3 homology=0 | Pass for theorem | F07 route repaired; R03 corrects the quotient algebra |
| 4.35 | Nonpositive nilinvariance | ℤ/9→𝔽₃, j=0,−1 | ℤ→ℤ; 0→0 | Pass | No change |
| 4.36 | Witt action on NK | k[ε]; series ≡1 mod t²; 𝔽₂ | [1−rεx]; acts as 0 since (εx)²=0; t² coefficients 0 vs 1 | Pass | Prior locator/import repair verified |
| 4.37 | Weibel p-divisibility | ℤ[1/2][ε]; 𝔽₂[ε]; ℤ/9 | ×1/2 inverse; (1+εx)²=1; K₁(ℤ/9,(3))={1,4,7}≅ℤ/3 | Pass | No change |
| 4.38 | Highly connective invariance | id; n=1 | fibre 0; N=m−1=1 (lmmt l.494) | Pass | No change |
| 4.39 | Replacement connectivity | identity side; m=n=0 | fibre 0; Σfib(μ)≃Σ²(I⊗_AJ), (m+n+2)-connective | Pass | No change |
| 4.40 | One Postnikov stage | k=0,1; HA | hypothesis = conclusion; τ≤1HA=HA | Pass | No change |
| 4.41 | L_T(n)K truncating | HF₂ at p=2 | L₁^{p,f}HF₂=0; L_T(i)K(𝔽₂)=L_T(i)Hℤ₂=0 | Pass | No change |
| 4.42 | All discrete p-power algebras | ℤ/4,ℤ/9; A=𝔽₃[ε]/ε²;i=2 | K₀=ℤ; positive telescope K values=0 in all cases; relative K₁(ℤ/9,(3)) has order 3 | Pass | F04 removes the proof-procedure hypothesis |
| 4.43 | Acyclic categories | 0; Perf(HF_p) | 0; L_T(i)K=0 | Pass | No change |
| 4.44 | Compact chromatic kernel | A=S, n=0; S/q | S/p↦0; S/q↦S/q | Pass | No change |
| 4.45 | Mitchell | i=2 vs i=1 | L_T(2)K(ℤ)=0; L_T(1)K(ℤ)≠0 | Pass | No change |
| 4.46 | Theorem A | A=0; local A; i<n | 0; id; two-out-of-three via L_iL_n=L_i | Pass | Prior locator/import repair verified |
| 5.1 | τ≥0 invariance | KU, n=2 | K(ku)→K(KU): T(2)-fibre 0 (lmmt Corollary 4.2) | Pass | No change |
| 5.2 | High trace | 0; KU | 0; middle term ku | Pass | No change |
| 5.3 | Genuine transfer | G=1; free C_p | id; res∘ind=×p on K₀ | Pass | No change |
| 5.4 | CMNN finite-sphere vanishing | n=2,3; m=n−2 | m=0,1; L_T(2)K(S[1/p])=0; at m=0 high-trace index 1 is outside range and base case is used | Pass for theorem | R04 names assembly supplier |
| 5.5 | Two-height purity | n=1; R=H𝔽₂ at p=2 and H𝔽₃ at p=3 | L_(T(0)∨T(1))R=0; both sides of the localized K comparison=0; K(𝔽_p)^∧p=Hℤ_p | Pass | Seed recomputed; all-prime range kept |
| 5.6 | Nilpotent K/TC | ℤ/4→𝔽₂ | kernel (2), 2²=0; relative K₁=ℤ/2, 2-torsion | Pass | No change |
| 6.1 | Theorem B | Hℚ, HF_p, 0 | ht 0⇒≤1; −1⇒≤0; −1 | Pass | No change |
| 6.2 | Chromatic field maps | R=E₁(L),Hℚ,H𝔽_q | identity to E₁(L); Hℚ maps to HL[u±1]; H𝔽_q has no unital map to a characteristic-zero field | Pass | F11 input moved before its consumers |
| 6.3 | Yuan nonvanishing | E₁,E₂ | T(2)K(E₁)≠0; T(3)K(E₂)≠0 | Pass at used positive heights | R01 corrects the overbroad auxiliary contract |
| 6.4 | Height-zero bound | L=ℂ, \|u\|=2 | composite [L]+[Σ³L]=1−1=0; π₀=π₁=ℤ_p (bsy l.3901–3925) | Pass | No change |
| 6.5 | Redshift | Hℚ; E₁; (HF₂)^{tC₂} at odd p | 0→1, 1→2; ht 0 but K[1/2]=0 ⇒ excluded by R⊗ℚ≠0 | Pass | No change |
| 6.6 | Optimality of both heights | M=HA; type-n M; square-zero extension | stable derivative ΣHA has π₁=A, versus π₋₁ of ΩHA=A; T(n−1)M=0 while T(n)ΣM≠0 | Pass | F01 suspension repaired |
| 6.7 | Graded-piece redshift | R=E₁,n=1,2; R=Hℚ,n=0 | M₁E₁ and M₂K(E₁) nonzero; M₂E₁=M₃K(E₁)=0; M₀Hℚ≠0 and M₁K(Hℚ)≠0 | Pass | R06 page; n=0 test uses p-local input |
| 7.1 | Nice-map predicate | id_Hℤ; purported ×2 on π₀; square-zero projection | identity sends 1→1; ×2 sends 1→2 and is not unital; Hℤ⊕ΣHℤ→Hℤ has π₀=id but rational π₁ ℚ→0 | Check fails as an input | R08 replaces it with the actual projection |
| 7.2 | K preserves nice | id_Hℤ | π₀K(Hℤ)=ℤ, K₋₁=0 | Pass | No change |
| 7.3 | Iterated K | K(𝔽_p)→Hℤ | rational iso (K_i finite, i>0); T(i): 0,0 | Pass | No change |
| 7.4 | K(K(m)) | m=1 | heights ⊂{0,1,2}; rational ranks (1,1) (lmmt l.898) | Pass | No change |
| 7.5 | Truncated spheres | r=0,1, i=2 | L_T(2)K(ℤ)=0 | Pass | No change |
| 7.6 | BP⟨n⟩ localization | n=0 | fibre K(𝔽_p) of K(ℤ_(p))→K(ℚ), T(i)-acyclic i≥1 | Pass | No change |
| 7.7 | Suspension A-theory | W=*; p=2 mod-3 Moore summand | *=* gives identity K(S); extra summand contributes ΣS/3 after p-inversion and violates the hypothesis | Pass | F14 and sampled acyclicity condition retained |
| 7.8 | James–Thom K comparison | m=1,2;p=2,3 for y | m=1 positive range empty; m=2 only i=1; required T₁y(2)=T₁z(2)=0; T₀y=0 but π₀T₀z=ℚ | Statement supported; route incomplete | R02 adds the owned acyclicity target |
| 8.1 | ε-enlargement | Σ=∅; Hℚ/ℤ | F=0 allowed ⇒ T; Hℚ/ℤ is in no ⟨S/N⟩ (torsion at all primes) | Pass | No change |
| 8.2 | Rational-transfer descent | A=R=M=1; R=ℚ×ℚ in Perf(ℚ) | unit lifts to 1; degree-two transfer sends 1/2→1; End(R): E₁₂E₂₁=E₁₁≠E₂₂=E₂₁E₁₂, while Hom(1,R)=ℚ² commutative | Main statement supported; algebra identification fails | R03 |
| 8.3 | Galois descent | G=1; A→A×A | identities; (a,b)↦a+b hits 1 (cmnn20 Theorem 5.6) | Pass | Perfectness is retained; no new finding from redundancy alone |
| 8.4 | Even complexes | H=1; rank d | X=S; dim_k=d\|H\| | Pass | No change |
| 8.5 | Lubin–Tate transfer | p=2,3 | orders 48, 24; d\|H\| invertible in ℚ | Pass | No change |
| 8.6 | ko-algebras | ko, i=2,3 | ko→KO T(i)-equivalence for i≥1 ⇒ K T(i)-equivalence for i≥2; L_T(3)K=0 | Pass | No change |
| 8.7 | tmf-algebras | tmf, i=2,3,4 | Tmf at 2, TMF at 3, 0 at 4 (lmmt 4.21(i)–(iii)) | Pass | No change |
| 8.8 | Supersingular descent | p=2,3; specified residues | GL₂(𝔽₃) order 8·6=48 over 𝔽₄; full semilinear G₂₄ order 12·2=24 over 𝔽₉; at 3 TMF(3) has K(2)-value 0 | Pass | F03 corrected marked spectra/actions |
| 8.9 | Integral classical localization | ko→KO then T(2)K | integral fiber K(ℤ); its T(2)-value=0 | Pass | F13/F14: integral sequence distinguished from localized consequences |
| 9.1 | K(1) truncation | HF₃, p=3 | 𝔽₃[1/3]=0; L_K(1)K(𝔽₃)=0 | Pass | No change |
| 9.2 | Excision, cdh | k[ε]→k; ∅ | nilinvariant; K(∅)=0 | Pass | No change |
| 9.3 | Affine lines | A=S, degree 2 | Σ∞₊BΣ₂ ≠ S | Pass | No change |
| 9.4 | Height-one polynomial invariance | A=𝔽_p[ε]/ε²; p=2,3 | [1+εx] nonzero in NK₁; p[1+εx]=[1]=0; K(1)-local polynomial fiber=0 | Pass | Seed recomputed; connective K(1)-acyclic input retained |
| 9.5 | Comparison to KH | field k; k[ε]/ε²; A[Δ⁰],A[Δ¹] | K(k)=KH(k); KH of the thickening=KH(k); Δ⁰ gives A and Δ¹ gives A[t] | Pass conditional on contracts | F10 revised KH owner resolved |
| 9.6 | TC obstruction | odd p | TC(ℤ[1/p])^∧p=0; L_K(1)TC(ℤ)≃L_K(1)S⊕ΣL_K(1)S⊕Σ³KU_p≠0 (lmmt l.1104) | Pass | No change |
| 9.7 | Category colimits | Mod_{ℤ/p^k}(Perf ℤ) | each 0; colimit ≃ fibre with L_K(1)TC(ℤ)≠0 | Pass | No change |
| 10.1 | Additive vs stable | Perf(k), i=2 | ⊕ℤ→ℤ; K(D) is a K(ℤ)-module ⇒ 0 at T(2) | Pass | No change |
| 10.2 | Sifted colimits | constant diagrams; T(n−1)-local | A; L_{T(n−1)}(colim) | Pass | No change |
| 10.3 | All-cyclic orbit diagrams | G=1,C₂,ℤ,S₃,Q₈ | first three have terminal G/G; cyclic subgroups of S₃:1,three C₂,one C₃; of Q₈:1,center C₂,three C₄; full group excluded in both | Pass | Confirms nonabelian and infinite-cyclic scope |
| 10.4 | TC assembly | G cyclic; R=0 | identity; 0 | Pass | No change |
| 10.5 | Telescopic assembly | G=1,ℤ; R=KU;n=2 | assembly is identity for cyclic G; τ≥0(KU[H])=ku[H]; both routes have the same localized K target | Pass | Seed recomputed; n≥2 and all cyclic groups retained |

Additional convention/definition controls were applied throughout the repaired material: rank zero and the zero ring give zero K; the unit ideal quotient is the zero ring; identity maps give identity comparisons; free degree-two restriction sends 1 to 2; negative shifts change Euler sign; κ=ω does not admit the countable-sum swindle on compact objects. The two coefficient primes 2 and 3 are distinguished in the Witt and Thom tests. For unital rings, a nilpotent unit ideal forces 1=0, so no nonzero ring is admitted by that boundary case. Formal-series denominators have constant coefficient 1; the Morava z-power quotient is taken only after the specified coefficient reduction. A rational transfer denominator 2 is used only after tensoring with ℚ. No “good primes” restriction was introduced to repair a theorem.

These computations cover all 103 target rows, 10 standing-convention rows, seven supplied-interface rows and 33 gap rows. They expose the four blocking issues instead of treating successful elaboration or a correct source citation as proof of the whole package.

## Not verifiable

- No required source text was unreadable. There is no new missing-source request, and the certified manifest was not changed. The 15 seeded targets and the relevant changed passages were checked directly; the other unchanged target calculations retained from round 1 are identified as such above. This is not a claim to have audited every line of every cited paper.
- The declaration-resolving component of `roadmaps resolve` reported that its pinned-library lookup was unavailable. This did not prevent the manual pin inspection or the successful Lean elaboration documented above.
- Implementation of the 33 supplier gaps is future supplier work, not something this package can demonstrate at the pins. Their contracts and existing-owner boundaries were inspected. R01 is a mathematical problem in one contract, rather than a complaint that it is not implemented.
- The eventual disposition of the overlapping downstream ChromaticHomotopyTheory design is outside this package's editable scope. F15 remains settled for that reason; no claim is made that the other design has already removed its overlapping targets.

## Source issues

- **Error** in lmmt at Redshift Theorem and its Nullstellensatz application, introduction, printed p.1014 (`lmmt` lines 172–186): the source says global nonnegative height always increases by one under K; it should require nonzero rationalization at height zero when T(0)=S[1/p]; affects a stated result.
- **Misprint** in lmmt at Remark 3.11, printed p.1026 (`lmmt` line 747): the source says the stabilized relative K construction has value ΩM; it should have value ΣM, equivalently ΣTHH(S;M); affects nothing.
- **Gap** in lmmt at proof of Proposition 3.6, printed p.1023 (`lmmt` lines 621–623): the source uses p-power coefficient vanishing for arbitrary torsion coefficient rings and mentions only height one; it should supply the K(ℤ/pʳ)-module argument in every required positive height; affects the proof.
- **Error** in akq at §2.1, manuscript p.5 (`akq` lines 199–203): the source identifies the integral connected-cover sign Thom spectrum with Hℤ; it should identify its 2-localization with Hℤ_(2); affects a stated result.

The last error is harmless for the subsequent prime-two applications after the correction. Its witness is the odd-prime sphere retract with π₃ containing ℤ/3. The first error is detected by the one-periodic characteristic-two Tate ring at an odd chromatic prime: rationalization is zero, positive odd-primary K vanishes, and global p-inversion still detects the input. Neither issue licenses changing the package's global T(0) convention silently. No correction in a later printed edition was established in this review.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "11a21b5b5a6087fb6daf4bb2d499d46210925fbc", "job": "REV-PKG-GeneralAlgebraicKTheoryPartII~2", "model": "gpt-6-astra", "worker": "chris-8"} -->
