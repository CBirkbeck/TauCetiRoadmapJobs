<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/241#issuecomment-6400354396 -->
Review (codex) of c1b8f80

Verdict: needs_changes

1. **F01** (P1) The ramified-type Check contradicts its trace formula

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md:603`, “the supercuspidal type has dimension 2, no unipotent invariants and traces (−1,−2).” The same Check occurs in `packages/ArithmeticLocallySymmetricSpacesPartII/design/plan.json:1655`.

   **Claim.** At ℓ=3 the specified supercuspidal type has S₄ trace −2.

   **Witness.** README line 594 gives 2(−1)^((ℓ−3)/4). At ℓ=3 this is 2(−1)^0=+2, not −2. fgt10 line 1394 gives the same formula (Lemma 4.19, p. 26).

   **Exact repair.** Change the trace pair in both Checks to (−1,+2). Retain the formula. Add the explicit evaluation 2(−1)^0=2 to make the sign test discriminating. This is a Check refuting its own theorem, hence P1 under the review rules, even though the correction is small. Testing the repaired pair gives S₃=−1, S₄=2, agreeing with both branches of Lemma 4.19. At ℓ=7 the same S₄ formula gives −2, so the repair must not change the formula's overall sign.

2. **F02** (P2) The equivariant Eichler–Shimura refinement has an existing owner

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md:570`, “Own the SL₂(ℤ/Nℤ)-equivariant refinement of Eichler–Shimura at Γ(N)”; also lines 11, 117, 121, 572 and the `WM.5/finite-type-dimension` node in `design/plan.json`.

   **Claim.** Equivariance for the finite quotient at Γ(N) needs to be constructed here, beyond ModularSymbolsPadicLFunctions §0.7.

   **Witness.** `TauCetiRoadmap/ModularSymbolsPadicLFunctions/README.md:1140` states Eichler–Shimura for every finite-index Γ, compatible with every defined double-coset and normalizer action. Every γ∈SL₂(ℤ) normalizes Γ(N); its action descends through Γ(N).

   **Exact repair.** Import this normalizer-equivariant period comparison from ModularSymbolsPadicLFunctions §0.7. Remove the separate ownership/proof obligation for equivariance from the scope, supplier contract, §5.3 and plan. Keep the fixed-type dimension formula and its elliptic/unipotent character calculation here: the supplier does not state that formula. Identify the quotient action as the specialization of the supplied action, with the same slash/pullback convention.

   **Test of the repair.** For N=3, Γ(3) is normal, with quotient SL₂(𝔽₃). The supplied normalizer action therefore supplies this entire finite-group action. At odd k=3, −I acts on forms by −1 and on Sym^(k−2) by (−1)^1=−1; at k=4 both signs are +1. N=1 gives the trivial quotient, and §0.7 already descends general finite-index groups from a torsion-free normal subgroup. No second equivariance theorem or exceptional N=1,2 construction is needed here.

   This is a new overlap found by resolving the supplier at this round's head, not a re-raising of the settled generic-gap portion of F02.

3. **F03** (P3) Several Fu page locators miss the cited argument

   **Location.** `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md:217`, “§6, p. 21, identities preceding the proof of Theorem 1.4”; lines 230, 243, 256 give pp. 21–22 for the cyclic/torsion argument. Line 735 places equation (16) on p. 14. Corresponding plan locators occur at lines 554, 600, 648, 686 and 2108.

   **Claim.** Those pages contain the indicated identities, cyclic filtration and weighted-series display.

   **Witness.** fu24 line 1120 is on p. 22; the cyclic filtration and summed bound are lines 1128–1138 on p. 23. Equation (16), lines 663–675, precedes the p. 14 marker at line 676.

   **Exact repair.** Cite §1.1 to fu24 §6, p. 22, identities in the proof of Theorem 1.4; §1.2 to pp. 22–23; §§1.3–1.4 to p. 23; and E8 to §4, equation (16), p. 13. Update the matching plan locators. The §0.3 pp. 21–22 locator is correct and should stay. Reopening those corrected pages finds respectively the evaluation identity, cyclic reduction, finite sum and weighted-series formula. The manifest's broad §6 locator does not require rewriting.

Three findings: one P1, one P2 and one P3. The design is repairable. Its six declared supplier gaps are valid contracts, not blocking findings. The settled reasons in the previous repair report remain valid; this review does not ask this package to implement another roadmap's gaps or decide its name.

## Verified sound

Reviewed the complete 757-line design README, all 30 plan nodes and their APIs, Checks, prerequisites and source records, six gap records, acceptance specification, source corrections and five manifest entries. The previous review and repair report were read first. The new computation table below covers all 30 targets, including all 15 seeded targets and all three headlines; no unchanged target was accepted solely on an earlier qualitative assertion. No design or manifest entry was changed.

### Previous findings, checked individually

Quoted passages in this table are from `packages/ArithmeticLocallySymmetricSpacesPartII/design/README.md`, except where explicitly noted. “Repaired” refers to the earlier finding, not certification of every new sentence in that section.

| Previous finding | Status | Repaired passage and verification |
| --- | --- | --- |
| F01: unowned analytic gaps | Repaired as contracts; external implementation settled | Lines 59–89: “What NoncommutativeAndEquivariantIwasawa must provide”; all four analytic slugs occur in plan.gaps and §1.2 prerequisites. No fictitious supplier remains. |
| F02: five unsupported requests | Partly repaired | Line 91 names `gap:skew-rank`; line 99 names `gap:canonical-dimension-zero`; line 11 assigns “the specialized SL₂ restriction count, ramified finite-type character data, FGT summation and positivity” here. Generic supplier responsibility is settled. The new equivariance ownership overlaps the supplier: R02. |
| F03: compound gaps | Repaired | Line 67 isolates “the natural map … is an isomorphism, natural in M”; line 75 separately states central injectivity. Six precise gap records replace compound requests. The full-matrix quotient is now §0.3. |
| F04: free-twist duplicate | Repaired | Line 57 imports “§0.15 (`IwasawaHomology.freeTwist`, `IwasawaHomology.vanish_above_dim`)”. No regular-acyclicity node remains; §§2.2–2.5 consume that import. |
| F05: unresolved supplier slugs | Repaired | Line 49 cites “§ALS.5a.2 for duality” and “§§ALS.5b.4–ALS.5b.5”; line 129 cites “§1.1”, “§5.2” and “§5.3” for AF. All cited sections were reopened. R02 is content overlap, not a missing citation. |
| F06: README shape | Repaired | Line 1 begins “# Roadmap: arithmetic locally symmetric spaces”; line 3 begins “**Summary.**”. Six numbered layers have Examples and Dependencies. The six definition/construction sections retain APIs and at least three discriminating Checks, subject to R01's correction. |
| F07: process residue | Repaired | Lines 673–675 introduce “Source corrections” and version locators, without the old job narrative. The old packet/adoption/provenance paragraphs are absent from the README. Machine workflow fields remain in the plan, where the earlier repair assigned them. |
| F08: wrong pins | Repaired | Lines 39 and 45 name Mathlib 6b7abb3c7686292736be2955bd3eb9ebf63b456a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039. Both equal content's manifest pins. |
| F09: manifest | Repaired | `sources.toml` contains five certified entries with `cited_for` and version notes. The Marshall entry says “all theorem and page locators use v1.” No second key for a published/preprint version was added. |
| F10: Marshall realization locator | Repaired | Line 430 cites “§2.2, equation (7), p. 4; §5, equation (29) and Lemma 11, pp. 15–16”. Read marshall12 lines 171–174 and 607–658. |
| F11: wrong local group for completed torsion | Repaired | Line 23 says “base field ℚ, group Res_{F/ℚ}SL₂ and prime ideal (p)”. §3.4 repeats the application. Imaginary quadratic local dimension is 6, not 3. |
| F12: vacuous zero-cusp Check | Repaired | Line 566: “degree-one boundary restriction has image dimension c, half of b₁=2c”. This is fgt10 lines 146–150 under the neat Bianchi hypotheses. |
| F13: unnecessarily neat lower bound | Repaired | Line 636: “Let Γ be any congruence subgroup of finite index in SL₂(O_F)”. The ordinary restriction/corestriction argument works at maximal level, index 1. |
| F14: non-neat cuspidal carrier | Repaired | Line 478 says “For a neat level K_f”; line 636 confines the parent interior/cuspidal comparison to neat Γ. Arbitrary-level cusp forms are handled by fixed-vector inclusion. |
| F15: finite-product duplicate | Repaired | Line 19: “write D(x)=∏… using Mathlib’s finite product”. The weight-product node is absent, and line 39 imports the exact product declarations. |
| F16: acceptance-test plan | Repaired at design stage | Line 13: “ordinary degree-one and degree-two Bianchi statements are statable with Mathlib group cohomology and the actual symmetric-power tensor representation.” plan.acceptanceTest additionally requires finite dimensionality. There is no Suggested.lean to test in this design. |
| F17: overlapping Part II description | Repaired exposition; naming settled | Line 7 distinguishes ALS's finite-level endpoint, CompletedCohomologyPartII's towers, and “their weight-aspect application”. The board naming decision is not reopened. |

### Source sample and locator certification

The five entries are legal arXiv or author copies. Every locator in the seeded sample was opened. No manifest entry or README locator is marked unverified/uncertified; the former uncertainties about AW deformation index zero were checked directly in the page images. The source corrections E1–E9 were also revisited. Source numbering below is the numbered cached extraction, not browser line numbers.

| Seeded target | Source text read | Result, hypotheses and limits |
| --- | --- | --- |
| 1.3 Cyclic control | fu24 lines 1128–1131, p. 23 | Finite cyclic filtration and surjections from principal quotients support the statement. Its elementary Ore argument also covers the stated noetherian-domain generality. Page repair R03. |
| 1.4 Torsion bound | fu24 lines 1120, 1128–1138, pp. 22–23 | Duality plus finite sums gives the bound; no claim that the cyclic factors themselves are principal quotients. Page repair R03. |
| 2.1 Free approximations | fu24 lines 1122–1125, equations (33)–(34), p. 22 | The source chooses both sequences. Rank additivity and finite generation are supplied/declared separately; no canonical choice is promised. |
| 2.4 Rank error | fu24 lines 130–137, Theorem 1.4, p. 3; lines 1133–1142, p. 23 | Both inequalities occur. Summing nonnegative upper errors is valid and preserves missing-full-monomial degree. |
| 2.5 Syzygies | fu24 lines 1143–1149, equations (35)–(36), p. 23 | The four-term degree-one sequence and i≥2 shift support the exact cancellation route. The free twist is imported. |
| 2.7 Finite support | fu24 lines 142–143, p. 4; aw13 lines 3598–3628, §§10.12–10.13, p. 77 | Dimension-zero equivalence is the Lemma in §10.13; composition length bounds are the roadmap's valid finite-length deduction. Read the p. 77 image: deformation index m≥0, not m>0. Nonzero-module convention retained. |
| 3.1 Weight indices | fu24 lines 29–46, p. 1; lines 1152–1161, p. 23; marshall12 lines 119–122, p. 3 | Even place weights and doubled complex embeddings match. The place minimum and d-entry local tuple are distinguished. |
| 3.2 Auxiliary prime | fu24 lines 1152–1169, p. 23 | Source gives the split-prime product and its level. Arbitrary-level refinement is explicitly supplied by this target using Chebotarev and level maps; not falsely attributed to a complete source proof. |
| 3.4 Descent | fu24 lines 1162–1179, equations (38)–(39), pp. 23–24 | Rank-zero completed modules and spectral sequence are stated for non-totally-real F. The finite filtration gives an upper bound, not degeneration. |
| 4.3 Parallel weights | fu24 lines 89–98, Theorem 1.2, pp. 2–3 | Parallel degree is d−1; no ε or limiting leading constant is imported. |
| 5.1 Cusp torus | fgt10 lines 123–152, equations (1.2)–(1.4), pp. 3–4; lines 165–171 | Source supports boundary/cuspidal interpretation and the half-boundary image. The explicit Koszul proof is owned here and was independently computed. Neatness removes finite-unit invariants. |
| 5.4 Ramified types | fgt10 lines 1092–1106, Definition 4.3, p. 20; lines 1350–1406, Lemma 4.19, pp. 25–26 | The API agrees with the minimal-conductor type formulas, including both dyadic exponents. The ℓ=3 Check does not: R01. “Type” correctly avoids the source's loose wording about uniqueness of compact constituents. |
| 5.6 Positive slope | fgt10 lines 1288–1330, Theorem 4.17, pp. 24–25; lines 1340–1409, pp. 25–26; lines 1417–1421, Corollary 4.20, p. 27 | A_F, parity coefficient B_F and bounded corrections match. Positivity was checked directly; the source omits the final summation, so its omission is not treated as a supplied proof. |
| 5.7 Lower bounds | fgt10 lines 1417–1419, p. 27; lines 144–171, p. 4 | Maximal-level ordinary lower bound plus characteristic-zero transfer gives all stated congruence subgroups. Duality is used only in the neat support comparison. |
| 5.8 Four supports | fu24 lines 95–98, Corollary 1.3, p. 3; fgt10 lines 132–171, p. 4 | Fu supplies the growth motivation, with its ambiguous support notation corrected through §5.2. The actual four-support conclusion follows from the explicit boundary estimates and lower bound; not from identifying compact support with its image. |

Additional source reads: fu24 Theorem 3.2 and proof, lines 405–554, and Theorem 4.3, lines 695–735; aw14 Theorem in §4.6, lines 491–511, and §5.4, lines 730–753. The aw14 p. 16 image confirms n≥0, allowing first congruence kernels. In type A₁ every odd prime satisfies the required very-good-prime condition; finite coefficient extension solves the integral Casimir equation without imposing a square condition over ℚ_p. The already-recorded author versions were used, rather than assuming the journal pagination. Page-image verification used the [aw14 author copy](https://www.dpmms.cam.ac.uk/~sjw47/VermaIwasawa.pdf) and [aw13 author copy](https://people.maths.ox.ac.uk/ardakov/Smith.pdf), rendered from the cached PDFs.

### Computed adversarial pass

These are tests and proof-route checks, not claims that finitely many numerical cases prove the asymptotic theorems. All dimensions below use the field in the statement. Algebraic models used just to test exact-sequence arithmetic are identified as such. Each row records computed values, including negative controls.

| Statement | Instances tried | Values on the two sides | Result / required change |
| --- | --- | --- | --- |
| §0.1 Proper faces | m=1; m=3, c∅=2,c{0,2}=3, x=(2,5,4); full-face negative control | B=c∅; B=2+3·2·4=26; t²/(1+2t) is unbounded | Pass; full monomial excluded |
| §0.2 Saving | m=1,c∅=5,x=4; B=7x₁,x=(1,5) | 5≤5·4/4=5; 35≤7·5/1=35 | Pass, including a minimal fixed coordinate |
| §0.3 W_k | k=0; (1,2); torus instead of open SL₂ | dim 1 and 6; action quotient dimensions 1 and 36; torus image on standard module has dimension 2<4 | Pass; actual group excludes wrong model |
| §1.1 Evaluation duality | M=A,W=W_(1,2); M=0; g=diag(a,a⁻¹) | Hom and dual coinvariant dimensions 6=6 and 0=0; evaluation factor a·a⁻¹=1 | Pass; contragredient necessary |
| §1.2 Cyclic bound | δ=1; δ=0; α=(3,3),k=(1,t) | 0≤B; excluded δ=0 gives 2(t+1); small-strip bound 2(t+1)≤6(t+1)+12 | Pass; unit and zero separated |
| §1.3 Torsion filtration | R=ℚ_p[X,Y],T=R/(X,Y),W=R/(X,Y); T=0 | Hom(T,W)=1≤Hom(R/(X),W)=1; kernel (Y)/(X) nonzero; empty sum 0=0 | Pass; surjection is not an isomorphism |
| §1.4 Torsion multiplicity | T=0; T=W₀⊕W₀ | multiplicities 0; at k=0, 2=2≤constant 2; other weights 0≤2 | Pass; common finite sum |
| §2.1 Free approximations | M=A²; M=A/Aδ, δ nonzero nonunit; model R-module (X,Y) | (a,ℓ,rk N)=(2,2,0),(0,1,1),(1,2,1); kernel relation X(−Y)+YX=0 | Pass; a≤ℓ and choices explicit |
| §2.2 Upper error | M=A,k=(1,2); M=0 | 6≤1·6+0; 0≤0 | Pass; imported free twist |
| §2.3 Lower error | M=A; a=0 | 6≥6−0; dim H₀≥−U_N≤0 | Pass; does not assert nonvanishing |
| §2.4 Absolute rank error | M=A²,k=(1,2); M=0 | abs(12−2·6)=0≤0; abs(0)=0 | Pass |
| §2.5 Degree-one cancellation | M=A/Aδ,N=Aδ≃A,ℓ=1; augmentation model over ℚ_p⊗ℤ_p[[ℤ_p]] | h₁=h₀(M) since D−D=0; augmentation model gives 1−1+1=1; higher shift starts at 2 | Pass; i=1 cannot be replaced by a shift isomorphism |
| §2.6 Local headline | M=A²,m=2,k=(1,2); m=1; p=2 control | h₀=12, error 0, h_i=0 for i>0; proper-face degree 0 when m=1; at p=2, (1−g)(1+g)=0 for g=−I≠1 | Pass; p=2 first kernel fails the stated domain hypotheses |
| §2.7 Finite support | M=W_(1,2); M=W₀⊕W₀; M=0 | Hom(W,W)=1≤length 1≤dimension 6; multiplicity 2≤2≤2; zero multiplicities 0 | Pass; dimension zero is not rank zero |
| §3.1 Weight dictionary | signatures (0,1),κ=6; (1,1),κ=(4,6); all κ=2 | (D,Δ,min x)=(9,36,3),(27,144,3); trivial dimension 1 versus Δ=2^d | Pass; odd complex κ=3 would require degree 1/2 and is excluded |
| §3.2 Split prime/trace | quadratic normal closure; covering degree 2; attempted order-3 element I+3X | identity-class density 1/2>0; normalized trace composite 2/2=1; trace forces tr X=−1 and determinant forces det X=1/3∉ℤ₃ | Pass; choice and index independent of weight |
| §3.3 Scalar realization | one-dimensional space, [L:ℚ_p]=2; integral complex O --p→ O | dim_L=1, restricted dim=2; over fraction field H=(0,0), mod p H=(1,1) | Pass; flat field change excludes reduction counterexample |
| §3.4 Completed descent | imaginary quadratic F; filtered abutment graded dimensions 2,3 | local dimension 3d=6, not 3; abutment dimension 2+3=5≤E² total | Pass; finite filtration, no degeneration claim |
| §4.1 Cuspidal comparison | one real place; one complex place; trivial coefficient | factors 2 and 1; V=1 has dimension 1 and fails the stated >1 hypothesis | Pass; neatness in scope |
| §4.2 Global headline | (0,1),κ=6; (1,1),κ=(2,K) | Δ/min=36/6=6; Δ/min=2K²/2=K² | Pass; fixed coordinate does not promise an extra exponent saving |
| §4.3 Parallel bound | signature (1,1),κ=4 | 4³/4=16=4^(3−1) | Pass; degree 2, not 1 |
| §4.4 Bianchi upper | κ=2,6 | n=0,2; dim E_n=1,9; κ=2(n+1) gives 2,6 | Pass; change of scale absorbed in C |
| §5.1 Cusp Koszul | n=0,1,2,3; lattice generators 1,i | chain dimensions (1,2,1),(4,8,4),(9,18,9),(16,32,16); differential ranks (0,0),(3,3),(8,8),(15,15); each H=(1,2,1); determinant −2i | Pass by exact rational matrix elimination; trivial rank-9 monodromy would give H¹=18 |
| §5.2 Support bridge | c cusps, n>0; connected n=0 | boundary (c,2c,c); H¹−H¹_!=c; compact/ordinary discrepancy ≤2c and hence ≤3c; H_c³ dimensions 0 and 1 respectively | Pass; n=0 boundary cokernel has dimension 1 |
| §5.3 Fixed type | N=1,σ=1,k=12,2; Γ(3),k=3,4 | 11/12−1/2+1/4+1/3=1; 1/12−1/2−1/4−1/3+1=0; central signs −1=−1 and +1=+1 | Formula passes; import equivariance under R02 |
| §5.4 Ramified types | (ℓ,ν)=(2,2),(2,3),(3,1),(7,1) | principal/super dimensions (6,2),(12,4),(4,2),(8,6); super S₃ at first three 2,−2,−1; S₄ at 3 is +2 versus Check −2; at 7 it is −2 | R01; API formula itself agrees with source |
| §5.5 SL₂ count | non-CM fibre with two ramified places; F=ℚ(i),n=0,1; F=ℚ(√−3),n=0,1,2 | 4·1/4=1; CM corrections 0,1/2 and 0,0,1/2; identity-component quadratic signs all +1 cancel the negative ℒ(F) sum | Pass; denominators nonzero since X contains 1 |
| §5.6 Positive base-change slope | ℚ(i),ℚ(√−3),ℚ(√−5),ℚ(√−7),ℚ(√−2) | (A,B)=(5/24,1/8),(1/6,0),(5/4,1/4),(1/3,0),(3/8,1/8); smaller slopes 1/12,1/6,1,1/3,1/4 | Pass, both parity slopes positive |
| §5.7 Level lower bound | maximal level; subgroup of index r=2 | cor∘res=1·id and 2·id; normalized left inverses 1 and 1/2 | Pass; no neatness needed for ordinary restriction |
| §5.8 Four-support headline | self-dual E₂; fixed boundary c | dim E₂=9=dim E₂∨; dim H¹_!=dim H²_!; C(n+1)+3c≤(C+3c)(n+1) | Pass; one threshold absorbs bounded errors for both degrees |

The 9,723-case rational sweep used m=1,2,3, every α_i=1,2,3 and every k_i=0,…,6. For k≥α it compared (D(x)²−∏(x_i−α_i)²)/D(x) with 2Σα_i∏_{j≠i}x_j; otherwise it compared D(x) with that bound. All comparisons passed. The proof behind the sweep is telescoping the product difference, and using x_i≤α_i in a small-coordinate strip. It does not discard an infinite strip as finitely many exceptions.

For the base-change slope I also checked the local-type parity summation, not just the displayed A_F values. Weight each ramified principal/supercuspidal type by 1/2. The unrestricted dimension product is ∏(1+(d_PS+d_SC)/2)=∏(ℓ^ν+1). Projecting to parity (−1)^n divides by 2 and adds (−1)^n times the signed product; the modular-form slope contributes a further 1/12. For the five fields in the table, the signed product divided by 24 is −1/8,0,−1/4,0,−1/8, respectively, exactly −B_F. This checks the parity-sensitive linear coefficient independently of the omitted full periodic summation.

### APIs, conventions and gap tests

| Object/law | Instances and computed values | Outcome |
| --- | --- | --- |
| Product API | swap (2,4): 8=8; empty product 1; all-one product 1; update first coordinate to 3: 12=3·4; (2,0) gives 0 and fails strict positivity | Native API, not a new target |
| Proper-face API | constants 2,3 add to 5; scale 2 by 4 gives 8; swap B=7x₁ at (1,5) gives 35 on both indexings; c=0 gives degree convention 0≤m−1 | Addition, scaling, reindexing, positivity and degree laws consistent |
| Representation/lattice API | 1+3e sends (0,1) to (3,1); W_(1,2) dimension 6; degree-two scalar extension gives dimension 6 over L and 12 on restriction; invariant alternating pairing gives a·a⁻¹=1 | Actual matrix action determines the object; no integral self-duality asserted |
| Free-approximation API | identity on A² has kernel/cokernel 0; presentation of (X,Y) has kernel generated by (−Y,X), rank 1=2−1 | Maps, exactness, rank and noncanonical choices agree |
| Global weight API | signature (1,1),κ=(4,6) gives local tuple (2,2,2), dimension 27≤144, minimum 3≥2; parallel κ=4 gives Δ=64 | Place/embedding reindexing, dimensions and minimum comparisons agree |
| Realization API | zero complex has dimensions 0=0; rank-one degree-zero complex 1=1; covering degree 2 gives scalar 2 before and after extension | Common algebraic coefficient complex fixes the comparison |
| Finite-type tensor API | principal ℓ=3 times super (2,2): dimension 4·2=8, U-invariants 2·0=0, S₃ trace 1·2=2, central sign (−1)(−1)=1 | Multiplicative laws agree; R01 remains the separate bad Check |
| Noncommuting inverse action | g=(1 3;0 1),h=(1 0;3 1): gh=(10 3;3 1),hg=(1 3;3 10); g⁻¹(0,1)=(−3,1) | Matches NE §0.14 and CC-II §3.1; same-action untwisting rejected |
| Casimir normalization | k=0,1,2 gives 0,3/2,4; changing ef to fe alone changes k=1 to −1/2 | Sign convention pinned; denominator 2 invertible for odd p |
| Flat microlocalisation gap | exp(pe) on Sym¹ equals 1+pe because e²=0; M=A,0 extend to Û,0 | Precise map, handedness and owner; no supplied theorem invented |
| Quotient-comparison gap | M=A,W_(1,2): 36=36; M=W_(1,2): 6=6; M=0: 0=0 | Natural map has specified source and target |
| Central-faithfulness gap | p=3,λ=1: v₃(1+2λ)=1; μ=−1+√3 gives μ(μ+2)/2=1; λ=0 permits μ=0 | Finite extension is necessary and compatible with descent |
| Generic cyclic-growth gap | m=1,α=3,k=3: (16−1)/4=15/4≤6; k=0 gives 1≤6; δ=1 gives 0 | Quantifiers cover all weights, not only a cofinal cone |
| Skew-rank gap | division ring R: rank R²=2; ℚ_p[X,Y]: rank(X,Y)=1, rank R/(X,Y)=0; E₁₁E₂₂=0 in M₂(ℚ_p) | Domain hypothesis excludes the matrix ring; existing Ore carrier alone does not supply this whole rank contract |
| Canonical-dimension gap | W_(1,2): canonical dimension 0, vector dimension 6; A: canonical dimension 3m, infinite vector dimension; zero module multiplicity 0 | Nonzero hypothesis and dimension/rank distinction retained |
| E1 support correction | c cusps, n>0: H_c¹/H_!¹ kernel dimension c and H¹/H_!¹ quotient dimension c | Compact support is not its interior image |
| E2 integral parameter | λ=1,p=3 gives nonsquare 3; after extension Casimir value is 1 | Corrects the false converse about induced parameters |
| E3 density/contraction | R=ℚ_p[x],I=(1−px): R/I≃ℚ_p≠0; Iℚ_p⟨x⟩=whole ring | Density does not ensure ideal contraction; the independent AW route avoids this proof gap |
| E4 indices/asymptotics | (r₁,r₂)=(1,1): 2 place weights versus 3 embeddings; Δ/min at κ=4 is 16; normalized subsequences 1 and 2 satisfy two-sided bounds | No out-of-range minimum or asymptotic equivalent |
| E5 unrestricted central parameter | ‖Δ/λ‖<1: (Δ−λ)(−λ⁻¹Σ(Δ/λ)^n)=1; quotient is zero | Domain claim cannot include every central parameter |
| E6 strips | α=(3,3),k=(1,t): 2(t+1)≤3(t+1)≤6(t+1)+12 | All-weight repair valid |
| E7 level refinement | index 2 gives trace/pullback 2·id and normalized composite id | Constant does not acquire weight dependence |
| E8 Banach completion | r=1/p, coefficient p^(−n): weighted norm 1; successive partial sums distance 1 | Bounded series need not lie in the norm completion; locator R03 |
| E9 ramified denominator | p=uϖ²: 0=p+(−p)∈p+𝔪²; over ℤ_p, v_p(p)=1<2 | Zero denominator excluded by the unramified starting convention |

### Ownership, pinned library and supplier order

The scope is an extension, not a re-plan of ArithmeticLocallySymmetricSpaces or CompletedCohomologyPartII. General finite-level objects, completed towers, Iwasawa rings and free twists remain imported. Odd p is a mathematically necessary hypothesis for these particular first-congruence-domain statements, witnessed by −I at 2; the global theorem still covers every fixed compact open. The ramified finite types explicitly include ℓ=2,3. There is no good-prime restriction on the arithmetic level. No algorithm, copied source paragraph, admitted data, set_option or proposed scalar stand-in was found in the design.

Read main's `TauCetiRoadmap/ComplexTori/README.md` and `TauCetiRoadmap/PadicMeasuresIwasawaAlgebras/README.md` for shape. The target follows the more explicit required house form. Six definition/construction targets have API counts 6,6,4,6,4,5 and Check/acceptance counts 8,7,4,5,5,4. Every theorem has a source locator, with R03's corrections needed. Every layer has explicit Dependencies; all Needs lines were inspected and the local target graph has no forward-reference cycle. Definitions in a theorem's statement, such as Z_F and H_bc, have explicit formulas/maps rather than arbitrary predicates.

Ownership searches used `roadmaps grep` across main and the supplied index of 363 open heads, by Bianchi, Grunewald, Tirao, weight aspect/multiplicity, fixed type, proper face, microlocalisation/microlocalization, skew rank and Jacobson density. The board package index was read before any absence claim. All 18 other indexed package READMEs were retrieved at their listed heads; 14 lived under `design/README.md` rather than the package root. Searches found no competing owner for Fu's proper-face estimates or FGT's specialized finite-level count. Nearby Bianchi work concerns covolumes, Fourier comparisons, modularity or p-adic L-functions. It is not the same SL₂ weight-multiplicity bound. The actual duplicate found is R02. No Suggested.lean exists here, hence no new fully qualified Lean name collides with another file.

Pinned files were read through GitHub contents at the exact manifest revisions. The following is the inspected evidence, not a claim that a newer library was tested:

| Pin / declaration | File and line | What it supplies and what it does not |
| --- | --- | --- |
| Mathlib `Finset.prod`, `Fintype.prod_equiv`, `Fintype.prod_empty`, `Finset.prod_const_one` | `Mathlib/Algebra/BigOperators/Group/Finset/Defs.lean:67`, 741, 753, 391 | CommMonoid products; reindexing, empty and unit laws, not the missing-coordinate estimate |
| Mathlib `Finset.prod_update_of_mem` | `Mathlib/Algebra/BigOperators/Group/Finset/Piecewise.lean:247` | Update on a member of the index set, with decidable equality |
| Mathlib `Finset.prod_pos` | `Mathlib/Algebra/Order/BigOperators/GroupWithZero/Finset.lean:157` | Strict positivity from positive factors under its ordered multiplicative hypotheses |
| Mathlib `Finset.powerset` | `Mathlib/Data/Finset/Powerset.lean:31` | Actual finite subsets; no proper-face coefficient condition |
| Mathlib `MvPolynomial` | `Mathlib/Algebra/MvPolynomial/Basic.lean:79` | AddMonoidAlgebra on finitely supported exponent vectors over a commutative semiring |
| Mathlib `Module.finrank_tensorProduct`, `Module.finrank_baseChange` | `Mathlib/LinearAlgebra/Dimension/Constructions.lean:373`, 376; binders at 347–351 | Free modules, scalar tower and strong rank conditions, all met by the finite-dimensional field specializations |
| Mathlib `groupCohomology` | `Mathlib/RepresentationTheory/Homological/GroupCohomology/Basic.lean:184` | For an actual `Rep k G`, the homology of its inhomogeneous cochain complex. No topology, support condition or automatic finite dimensionality |
| Mathlib `jacobson_density`, `Module.Finite.toModuleEnd_moduleEnd_surjective` | `Mathlib/RingTheory/SimpleModule/Basic.lean:560`, 572 | Semisimple-module density, and surjectivity when finite over the endomorphism ring. Available for §0.3's density step after absolute irreducibility; not a new Burnside theorem to plan |
| Mathlib `OreLocalization.inv`, `OreLocalization.mul_inv_cancel` | `Mathlib/RingTheory/OreLocalization/NonZeroDivisors.lean:48`, 74 | Inversion once the Ore-set instance is supplied. Does not by itself discharge the noetherian Ore existence and finite skew-rank contract |
| Tau Ceti `TauCeti.symPowerRep` | `TauCeti/RepresentationTheory/ClassicalGroups/SymmetricPower.lean:59` | Symmetric power of the actual standard GL action over a commutative ring; restriction to Γ and conjugate tensor needed here |
| Tau Ceti `SymmetricPower.finrank_eq` | `TauCeti/LinearAlgebra/SymmetricPower/Basis.lean:203` | Finite free module dimension via multichoose, not subgroup irreducibility |
| Tau Ceti `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `Module.Basis.pbwBasis` | `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basic.lean:78`; `TauCeti/Algebra/Lie/UniversalEnveloping/PBW/Basis.lean:93` | Ordinary PBW and ordered monomials over a commutative ring, not completed microlocalisation |

All nine direct roadmap suppliers were reopened using `roadmaps show`, with the three on-main suppliers read from main and the six new roadmap suppliers at their supplied heads. The sections resolved as follows:

| Supplier | Resolved sections and consumed content |
| --- | --- |
| ArithmeticLocallySymmetricSpaces | ALS.0.9–0.10: neat quotients and standard levels; ALS.1.1: actual coefficient actions; ALS.1.6–1.8: finite models, flat coefficient change and pullback; ALS.2.5, 2.8: strata and transported nilmanifold fibrations; ALS.3.6: trace with composite index; ALS.4.1, 4.5–4.7: support triangle, Kostant and Hochschild–Serre; ALS.5a.2: dual coefficients/orientation; ALS.5b.4–5b.5: comparison and unconditional cuspidal injection. FrankeInput is only needed for the full decomposition, not used here to infer injection. |
| CompletedCohomologyPartII | 3.1: inverse-action duals; 4.2: actual bounded completed chain model; 5.1: finite generation/topology; 5.6–5.7: fixed-prime semisimple torsion, applied to Res over ℚ; 6.3: homological completed-Tor descent with exactly one coefficient twist. |
| NoncommutativeAndEquivariantIwasawa | F.1 and its referenced Layer 0 foundations: noetherianity, uniform-domain framework and canonical topology; 0.12: rational global dimension; 0.14–0.15: twists, finite homology and cutoff; 1.12: flat Ore extension given an Ore set. The six missing contracts remain declared gaps. |
| LieHighestWeight, main | Layer 0: sl₂ highest-weight strings, classification and irreducibility; Layer 3: native ordinary PBW interface. |
| Chebotarev, main | Layer 10: identity Frobenius density, infinitude and invariance under finite changes. |
| ModularForms, main | 10C: section-space interpretation and ordinary dimension formulas. |
| ModularSymbolsPadicLFunctions | 0.7: period map and Eichler–Shimura for arbitrary finite-index Γ, including normalizer equivariance and descent. R02 corrects the claimed ownership boundary. |
| GL2AutomorphicRepresentationsAndTransfer | R16.2.9: unique supercuspidal type, including dyadic fields; R17.4.2–R17.4.6: general quadratic base change, all-place comparison, descent, cuspidality and fibres. These do not supply the FGT SL₂ count or explicit type traces. |
| AutomorphicFormsOnReductiveGroups | 1.1: relative cochains; 5.2: coefficient convention and connected real degree-one multiplicity two; 5.3: tempered range, with the full-K component caveat. SL₂'s compact groups in this application are connected. |

For the six gaps, plan.gaps slugs, supplier/section fields, README contract slugs and consumer prerequisites agree exactly. Each describes a single missing interface; no supplier is `none`. Native ordinary PBW, finite products and the full-matrix quotient are not requested again. The skew-rank contract still needs the noetherian-domain Ore existence/rank interface beyond the native Ore construction. The criterion gap concerns rational canonical dimension, beyond the supplier's existing integral/residual dimension API. No new supplier gap is required by R01–R03.

Dependency command output, verbatim:

```text
candidate: ArithmeticLocallySymmetricSpacesPartII is not in the merge order yet; checked as if placed after CompletedCohomologyPartII (the intake inserts it when its design is accepted)
depcheck: 53 roadmaps, 589 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. Citation resolution used main 7922565 and the supplied open-head index and found no unresolved roadmap citation or Lean name. Its warning that external library names were not checked locally was addressed by the pinned reads above, not by treating the resolver as proof of correctness. The merge order was not edited.

### Headline and Lean audit

The README's three headline families are §2.6 (one local polynomial for all weights and degrees), §4.2 (fixed-level global cusp-form bound), and §5.8 (two-sided Bianchi growth). The ordinary H¹/H² statements in §5.8 are statable using native group cohomology and the actual symmetric-power tensor action. The design's acceptance plan correctly demands finite dimensionality as well as bounds, preventing finrank's infinite-dimensional zero value from becoming a substitute.

The other versions are explicitly listed for the future module docstring with their missing completed-Iwasawa, adelic cusp-form, cuspidal/interior or compact-support carriers. No scalar substitute is proposed. This is a design-only package: no Suggested.lean exists. Elaboration: **not available (this lane does not elaborate; say so in the report)**. Accordingly there was no permitted signature elaboration, `#check @name` comparison or one-tactic padding probe to run, and no “sorry only” build outcome is claimed. The absence of a Lean file at this stage is not a finding. A package-stage acceptance test must implement the stated ordinary headlines and name the unavailable ones in its module docstring.

## Not verifiable

- Actual Lean elaboration and warning output: unavailable in this lane; there is no Suggested.lean at this design stage. The future signatures and one-tactic padding checks remain package-stage work.
- The complete periodic-term summation finishing fgt10 Theorem 4.17 is omitted at fgt10 lines 1408–1410, p. 26. Its source statement, local ingredients, linear parity coefficient and positivity were checked. No nonexistent written summation proof is certified.
- The general ideal-contraction/separatedness theorem that would complete fu24 Theorem 5.7's large-radius argument is not supplied by its proof at lines 981–1009. The counterexample to density alone and the independent AW replacement were verified; this review does not claim to have completed that missing general proof.
- Journal-version pagination was not used for certification: all checked mathematical locators refer to the explicitly named arXiv/author versions. No cited text needed for this review was inaccessible, so no missing-reference request was added.

## Source issues

- **Error** in fu24 at equation (2) and following discussion, printed page 2: the source says compact-support dimensions equal cusp-form dimensions; it should be cuspidal/interior dimensions, with boundary terms for compact support; affects a stated result.
- **Error** in fu24 at Remark 5.8, printed page 21: the source says the integral valuation condition characterizes induced infinitesimal characters; it should additionally impose the square condition on the SL₂ Casimir parameter over the given field; affects a stated result.
- **Gap** in fu24 at proof of Theorem 5.7, printed page 20: the source says an auxiliary-radius associated graded calculation proves the quotient is a domain; it should establish separatedness or ideal contraction before that inference; affects the proof.
- **Misprint** in fu24 at Theorem 1.2, printed page 2: the source says to minimize over the field-degree index; it should minimize over the archimedean place weights; affects a stated result.
- **Error** in fu24 at Theorem 5.7, printed page 20: the source says the central reduction is a domain without restricting its parameter; it should exclude parameters making the central relation invertible; affects a stated result.
- **Gap** in fu24 at proof of Theorem 3.2, printed page 11: the source says the large-coordinate PBW estimate completes the all-weight bound; it should also bound the infinite small-coordinate strips by coefficient-space dimension; affects the proof.
- **Gap** in fu24 at §7, printed pages 23–24: the source says the selected product-level estimate concludes the arbitrary-fixed-level theorem; it should include a weight-independent neat refinement and fixed-vector injection; affects the proof.
- **Misprint** in fu24 at equation (16), printed page 13: the source says bounded weighted coefficients describe the Banach completion; it should require weighted coefficients tending to zero; affects a stated result.
- **Error** in fu24 at equation (17), printed page 14: the source says the displayed p-based denominator set applies over general coefficient integers; it should restrict that description to an unramified base before ramified scalar extension; affects a stated result.
- **Misprint** in fgt10 at Lemma 4.19, printed page 26: the source says the supercuspidal representation contains a unique compact-subgroup representation; it should specify the distinguished minimal-conductor type, rather than uniqueness among all compact constituents; affects a stated result.
- **Gap** in fgt10 at the end of the proof of Theorem 4.17, printed page 26: the source says the remaining finite summation is omitted; it should supply the parity-sensitive summation establishing the displayed closed formula; affects the proof.

R01 is an error in this design's Check, not an erratum in fgt10's S₄ trace formula.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "c1b8f80e7adac8054e693a46363de413810fd8a7", "job": "REV-DESIGN-ArithmeticLocallySymmetricSpacesPartII~2", "model": "gpt-6-astra", "worker": "chris-42"} -->
