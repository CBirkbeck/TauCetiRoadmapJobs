<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1152#issuecomment-6398602474 -->
Review (codex) of 153251d

Verdict: needs_changes

1. **F01** (P1) Own the de Rham Bessel identification's missing inputs

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:587`, and its input list at line 614: “Its underlying connection is the Bessel connection matched to ψφ by the invariant-parameter identification”.

   **Claim:** The new construction obtains the Bessel connection from the de Rham Hecke eigenvalue, and then transports the rigid Frobenius to it. The declared rigid-specialization contract supplies the comparison between de Rham and rigid cohomology. It does not supply the identification of the de Rham eigenvalue with the explicit Bessel connection. The latter is now asserted here, but neither the invariant-parameter map nor the geometric-Langlands input used to prove this identification is developed or imported. A citation to its proof is not ownership of that input.

   **Witness:** xz line 2243 invokes quantization and geometric Langlands; xz line 2263 constructs the filtered oper-algebra comparison; xz line 2276 invokes Zhu's eigenobject theorem. None occurs in line 614 or the twelve declared gaps.

   The distinction is visible in the source: Theorem 4.2.1, xz line 1994, compares the de Rham and rigid Kloosterman constructions. Theorem 4.3.3, xz line 2201, separately identifies the de Rham construction with Bessel. Its proof uses opers with prescribed singularities, the quantized Hitchin map and the Hecke eigenvalue property of localization. Only after that identification does xz line 2300 transfer Frobenius. The added p-adic contracts address other steps.

   **Exact repair:** Before transporting Frobenius in §4.0, state and own the following intervening constructions and comparison, with their inputs:

   - The invariant-parameter isomorphism from affine-generic functionals modulo T to the dual affine-root parameter quotient, with the invariant-polynomial equation `P_dual(ξ)=λ^h P(φ)` on each almost-simple factor, where λ=−π is the chosen additive-character normalization (xz §4.3.4, printed p. 48, and §4.4.1, p. 49).
   - The required oper singularity space and filtered quantization, followed by the parahoric-level localization/Hecke-eigenvalue theorem that identifies its eigenconnection with `d+(N+xE)dx/x`. Retain the central descent to general semisimple H of xz §4.3.6, p. 49.
   - Import existing oper and critical-center theory by its owners, rather than reconstructing it: `TauCetiRoadmap/FormalConnectionsOpers/README.md`, F4–F5 and F8.4, and `TauCetiRoadmap/AffineLieAlgebras/README.md:428`, A7–A8. The specialized parahoric localization/eigenvalue comparison must be an explicit target here, or a precise declared contract with a named supplier. Neither owner currently supplies that comparison merely by providing opers or a completed center. Add the actual statement/route edges and rerun the dependency check.

   **Repair test:** In type A₁ at p=5, `d+(N+c xE)dx/x` with c=π² and c=2π² has the same principal residue N and maximal formal slope 1/2. For normalized `P(φ)=1`, the matching equation selects c=(−π)²=π² and rejects 2π². Thus principal residue, slope bounds and a de Rham–rigid comparison alone do not determine the required match. The explicit parameter map and eigenvalue theorem close precisely this hole. This completes the unresolved portion of prior F01; it does not reinstate a restriction on p.

2. **F02** (P2) Specify the residue-degree Frobenius iterate

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:432`: “Each partial Frobenius commutes with the local-to-global map on its reindexed source and target.” The unqualified compatibility also occurs at lines 418 and 424.

   **Claim:** Reindexing the legs is not the complete compatibility statement. For r=deg(v), local partial Frobenius corresponds to r global partial Frobenius operations, with the intervening base twists. It also changes the truncation bound; the package currently fixes ≤s without stating the bound needed by this operation.

   **Witness:** lh line 1871 has target ≤s+rκ(V); lh line 1872 requires enlarged deg N; lh line 1876 gives `Θ_n∘Fr_local=(Fr_global)^(r,diamond)∘Θ_n`, not a single global operation.

   **Exact repair:** State that identity, defining r=deg(v), the twisted r-fold global composition, the source bound s and target bound s+rκ(V). Require N sufficiently large for the enlarged bound. Use the same statement in the API and proof route, and add a degree-two Frobenius Check.

   **Repair test:** Take q₁=4, deg(v)=2 and α in 𝔽₁₆ with α⁴+α+1=0. One global operation has α⁴=α+1, whereas the local operation has α¹⁶=α. Two global operations give α¹⁶=α, as required. The r=1 case reduces to the original single-operation identity. The parent also uses degree iterates explicitly in `TauCetiRoadmap/GlobalShtukasAndFunctionFieldLanglands/README.md:1297`, §3.6, and allows enlargement of truncation in §2.9 at line 1105.

3. **F03** (P3) Correct the surviving GHS page locator

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:465` and `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/sources.toml:31`: “Theorem 2.1(iii), p. 7”.

   **Claim:** This clause is on printed page 6 of the published source being cited.

   **Witness:** ghs line 249 begins page 6; Theorem 2.1(iii) is at ghs line 266 and ends at line 269.

   **Exact repair:** Change this particular page locator to p. 6 in the README and the existing ghs manifest entry. Keep the separate pp. 6–7 locator for Theorem 2.3 and Corollary 2.4. No second source key is needed. The reviewer has preserved the author's recorded entry.

   **Repair test:** Opening ghs line 266 on printed page 6 gives the stated dependence of the local semisimplification on the local representation; page 7 is unnecessary for that clause.

4. **F04** (P3) Finish the repeated-dependency cleanup

   **Location:** `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/README.md:539`: “§3.3 (normal-image and coefficient transport); §3.3; §3.4.” Related repetitions remain at lines 221, 555, 678, 885 and 1022.

   **Claim:** The cleanup in prior F05 fixed the named occurrence but did not remove the same pattern elsewhere. Annotated and unannotated copies of the same input are repeated in individual dependency lists.

   **Witness:** Line 539 contains §3.3 twice; line 221 contains MotivesAndAlgebraicCycles §6.3 twice; line 678 contains SmoothRepresentationsOfLocalGroups §SR.3.3 twice.

   **Exact repair:** Deduplicate within each individual `Needs` or layer-dependency list, combining useful annotations on the retained citation. Preserve citations in different targets, since those are separate dependency lists.

   **Repair test:** The line-539 input set is {§3.3, §3.4} before and after cleanup; the annotated reason for §3.3 is retained. This is editorial and does not change the dependency graph.

Four findings: one P1, one P2 and two P3. The package is a repairable Part II extension. Its acceptance file elaborates successfully. The all-prime anchor has substantially better ownership than before, but its new de Rham identification still conceals an input to its proof. The sampled uniformization statement also needs the residue-degree Frobenius iterate.

## Verified sound

### Previous findings and the changed passages

The prior review and its repair report were read before the new pass. No finding was marked “not actionable in this package”; no settled finding is being reopened on that basis.

| Prior finding | Disposition | Repaired passage and verification |
| --- | --- | --- |
| F01, all-prime anchor ownership | Partly repaired | README line 587 says “These comparisons are part of this construction.” Lines 583–614 now own the Bessel construction, adjoint rigidity and conductor/invariant transfer; lines 83–87 declare the three missing rigid inputs. The slope, rigidity and trace-transfer arguments pass the computations below. R01 identifies the remaining de Rham identification input. |
| F02, source attribution | Repaired for the specified omissions | README line 467 now says “Transport the product, Weil-restriction and character-twist identities of fs Theorem I.9.6(ii), (vi)–(vii) through §3.2.” The source contains these at fs line 1331 and line 1337. README line 396 now locates IX.5.1 at “pp. 327–328”; fs line 12683 agrees. R03 is a different surviving page error found by the repeated-pattern audit. |
| F03, omitted headline | Repaired | Suggested.lean lines 24–27 name “the all-prime étale Kloosterman anchor, its Bessel companion construction, adjoint rigidity and local conductor/invariant transfer” and identify their missing carriers. The pin search below confirms the distinction between point isocrystals and curve coefficients. |
| F04, repeated Checks | Repaired | The six affected blocks now have 7, 4, 6, 6, 5 and 4 Checks in §§0.3, 2.1, 3.4, 4.1, 6.1 and 7.3. Representative retained discriminators include line 193, “the faithful identity ⊕ trivial representation with N=0 has weights 2 and 0”, and line 934, “S_σ need not equal all of Ĝ.” Their values are recomputed below. |
| F05, wording and dependency cleanup | Partly repaired | Line 1323 now says “by §8.1 and the recognition theorem of §8.0”; lines 865 and 1002 identify “the place v of §5.4(1)”. The doubled recognition pointer, malformed punctuation and unnamed generic-place references are gone. The same repeated-dependency pattern remains elsewhere: R04. |

The new §4.0 was checked beyond its headline conclusion: coefficient choices, tensor functor, matching, purity, principal residue, maximal slope, integer irregularity, boundary sequence, geometric semisimplicity, invariants versus ker N, N∞, trace comparison, products, central quotients and all nine Checks. The proof no longer substitutes an abstract monodromy-group comparison for local conductor transfer. For pure weight zero on the affine curve, the H¹_c bound and pure weight-2 H²_c do prevent cancellation, so equality of the L-functions does separate these compact-cohomology factors. The remaining concern is upstream of this argument, in R01.

### Source sample

All 15 seeded targets were opened at the specified cached texts, including theorem numbers, printed pages and hypotheses. No author-flagged unverified locator was found. The versions are the README's specified preprints, except the published ghs text. The original fifteen entries remain unchanged. The one newly investigated work, zhu-fg, was fetched through the sources service and recorded as uncertified; see Not verifiable.

| Target | Text actually checked | Outcome |
| --- | --- | --- |
| 0.3 | ty Lemma 1.4(3)–(6), pp. 6–7, ty line 201; ghs Definitions 3.1–3.3, p. 8, ghs line 341; ch26 Definition 2.6, p. 7, ch26 line 333 | Corrected downward monodromy direction; fixed-ι and arithmetic assertions separated; reductive common-weight error avoided. |
| 0.4 | ghs Lemma 3.5 and proof, p. 9, ghs line 384; ty line 219 | Uniqueness is at most one completion, not existence. The argument retains the adjoint qualification for reductive groups. |
| 2.2 | ch26 Proposition 3.1, Lemmas 3.2/3.5, Theorem 3.6, pp. 8–10, ch26 line 390 and line 421 | Finite rational model gives algebraic eigenvalues, not rational eigenvalues. The semisimple/global central normalization is retained. |
| 3.1 | lh Theorem 2.12, p. 15, lh line 699; Theorem 4.9, p. 28, line 1316; Proposition 4.12, pp. 29–30, line 1383; Propositions 5.13–5.14, pp. 37–38, line 1737 and line 1787; Theorem 5.16, pp. 39–40, line 1818; Lemma 5.18, pp. 40–41, line 1870; Lemma 6.4, pp. 42–43, line 1945 | Formal/generic-fibre direction, framing, large level and coefficient comparison supported. Frobenius normalization is incomplete: R02. |
| 3.2 | lh Theorem 6.13, pp. 47–48, lh line 2126; Theorem 6.15 and §6.16, pp. 48–49, line 2185 and line 2203 | Full compact-support commuting action precedes cusp specialization. Equality is of semisimple parameters of the chosen occurring block; it does not reconstruct N. |
| 3.5 | ch26 Proposition 3.10(1), pp. 10–11, ch26 line 489 and line 503; fs I.9.6(ii), p. 36, fs line 1331 | Coefficient transport fixing √q is supplied; transport moving √q explicitly uses the declared chart-comparison gap. |
| 3.6 | ch26 Proposition 3.10(2), pp. 10–11, ch26 line 492 and line 504 | The source's unrestricted torus formulation is incorrect. The package's split/induced-torus replacement, residue degree and separability condition pass the counterexample below. |
| 4.2 | ghs Proposition 3.9 and Remark 3.10, pp. 10–11, ghs line 450 and line 486; glo Theorem 1.1, pp. 1–2, glo line 19; hny Theorem 2, p. 17, hny line 976; xz Corollary 4.5.7 and Remark 4.5.8(i), pp. 53–54, xz line 2478 and line 2503 | The all-prime source exists. The torus exception to infinitude is correct. General reductive globalization uses the explicit central-character and reduction contracts, rather than attributing that entire extension to the semisimple proposition. Its anchor still depends on R01. |
| 5.4 | ch26 Theorem 5.4 and proof, pp. 13–15, ch26 line 609; Corollary 6.32, p. 25, line 1192 | The package retains central compactness, the odd-unitary exception, occurrence and the local transfer contract. These qualifications matter; the noncentral G₂ control is computed below. |
| 5.5 | ch26 Corollary 5.7, p. 15, ch26 line 702 and line 711 | Tempered spherical implies generic with the specified unramified quasi-split/Whittaker input. The general-isogeny statement is assigned to the declared supplier contract. |
| 6.3 | lz Theorem 1.1, p. 2, lz line 51; Proposition 1.2 and Remarks 1.3–1.5, p. 3, line 107; Corollary 2.1, p. 4, line 146; Lemma 4.1, p. 7 | Splitness, finite coefficients, frozen leg and full S_σ invariants retained. No Hecke semisimplicity or automatic constant-coefficient realization is asserted. |
| 6.4 | ch26 Remark 5.8/Expectation 5.9, pp. 15–16, ch26 line 729 and line 731 | It is a defined realization predicate and a conditional expectation. Constant coefficients are literal; duality alone is correctly not claimed to preserve them. |
| 7.5 | ch26 Conjecture 9.1 and Lemma 9.2, pp. 30–31, ch26 line 1468 and line 1479 | Finiteness/base change retained; full finite-dimensional Hecke image, not good-place eigenvalues alone, is used for number-field descent. Fixed-level and all-level claims are distinguished. |
| 8.0 | ch26 Proposition 4.5, p. 12; Theorem 8.3/Definition 8.4, pp. 27–28, ch26 line 1330; Theorem 8.5, pp. 28–30, line 1362 and line 1384; Proposition 10.2, p. 32, line 1554 | Full compact factor retained for strata; classification restricted to the justified sector. Partition parity and the corrected F₄ coordinate agree with direct calculations. |
| 8.4 | ch26 Property A, p. 34, ch26 line 1639; Remark 10.8, p. 35, line 1691 | Nonnegativity, finite support and reflection around the row index are exactly what the proof uses. The strict inequality points from row to column at the greatest discrepancy. |

The changed Bessel route was additionally checked at xz Theorems 4.2.1, 4.3.3 and 4.4.4, §§4.3.1/4.4.2, Lemma 4.5.5 and Corollary 4.5.7, printed pp. 42–54; xz lines 1994, 2175, 2201, 2314, 2329, 2433 and 2478. André's maximal-radius comparison was read at andre-bessel line 393, Proposition 3.2, printed pp. 788–789. The package retains algebraic coefficients and the exterior-annulus condition. At an almost-simple factor, r<h turns the bound r(h+1)/h into the integer bound r. Rank zero is handled separately.

### Computed adversarial record

All 52 numbered subsections, their APIs and their Checks were read. The table gives actual values for the sampled targets, headlines and repaired passages, including the added §4.0 assertions. No previous row lacking computed values was treated as evidence. In the table, δ_i is a unit multiplicity at i, weights use geometric Frobenius, and q=4 unless stated otherwise. “Pass” means the instance and the stated hypothesis/route are consistent, subject to the explicitly named contracts; it is not a claim that finite testing proves the general theorem.

| Statement | Instances tried | Values computed on both sides | Result / change |
| --- | --- | --- | --- |
| Conventions | Tate line, its inverse; degree-two place; rank zero; excluded q=1 | 1/4 has weight −2, 4 has weight 2. `2 log₄2=2 log₁₆4=1`. Rank zero gives empty weights. At formal q=1, `1=1^(w/2)` for every w. | Pass; q≥2 and positive-rank qualifications matter. |
| 0.1 geometricity | G_m values 2, 3, (3+4i)/5 and e^i | Weights 1, log₂3=1.5849625…, 0 and 0 at the chosen embedding. The first and third are algebraic with the same conjugate moduli; e^i is transcendental. | Pass; fixed modulus alone does not suffice. |
| 0.2 faithful realization and inertia | PGL₂ adjoint versus trivial realization; S₃ with C₃ inertia at q=5; cyclic C₃ at q=4 | Adjoint eigenvalues (4,1,1/4) give (2,0,−2); trivial gives only 0. A transposition and its product with a 3-cycle both have eigenvalues (1,−1). At q=4 Frobenius can commute with C₃; at q=5 it must invert it. | Pass in both cyclic and nonabelian cases. |
| 0.3 purity and dictionary | `F=diag(1,4)`, Ne₁=e₀; N=0; G_m value 4 | `FNF⁻¹=N/4`; N joins weights 2→0, centered at 1. With N=0 the required map has rank 0 instead of 1. Identity realization has weight 2, identity⊕trivial has weights (2,0), hence no common weight. | Pass; source errors not copied. |
| 0.4 uniqueness | `diag(2,1/2)` and `diag(1,16)` | Ratio 4 permits one nonzero two-term string up to conjugacy. Ratio 16 permits no nonzero joining N; the two unequal real exponents remain. | One pure completion versus none; pass. |
| 1.1 twist decomposition | Constant value 3; Tate inverse; values 1+i and 1+2i over 𝔽₂, ℓ=7 | Trivial-class ranks 0,1,1,0 respectively. Squared moduli are 9,16,2,5; log₂5 is not an integer. | Pass; coefficient values are units at the chosen ℓ. |
| 1.2 propagation | Constant eigenvalue 2; constant eigenvalue 3 | First has boundary and all closed-point weights 1, including value 4 over q_w=16. Second has weight log₂3 at both boundary and interior and fails the premise. | Pass; a genuine anchor is necessary. |
| 1.3 irreducibility/purity | SL₂ diagonal (2,1/2); diagonal (1,1) | Increasing negative-weight line is e₂. E₂₁ preserves it, E₁₂ does not. Stabilizers are the lower Borel and all SL₂ respectively; weights (−1,1) versus (0,0). | Pass; sign of the parabolic is correct. |
| 1.4 local purity | Normalized rank-two special parameter | Frobenius weights (−1,1), N rank 1, graded weights around 0; its adjoint weights are (−2,0,2). | Pass; full N retained. |
| 2.1 occurrence | Two one-dimensional excursion blocks sharing a Hecke type | Combined multiplicity dimension 2; each specified block dimension 1. Tensor unit has rank 1, a standard GL₂ realization rank 2. | Pass; a Hecke type does not choose a block. |
| 2.2 rationality | Rational Hecke matrix `[[0,2],[1,0]]` | Characteristic polynomial T²−2; eigenvalues ±√2, both degree 2 over ℚ. | Pass; algebraic does not mean rational. |
| 2.3 real Satake part | Pairs (2,1/2), (√2,1/√2) | Real exponents (1/2,−1/2), (1/4,−1/4); weights (1,−1), (1/2,−1/2). | Pass; factor 2 tested. |
| 3.0 local excursion application | G=1; G_m uniformizer values 2 and 1/2 | Unit excursion scalar 1; torus Frobenius values 2 and 1/2 differ, with weights 1 and −1. | Pass; reciprocal convention distinguished. |
| 3.1 framed gluing | GL₁ lattice z^(−d)O, d=1,2; deg(v)=1,2; dual numbers; G=1 | Bundle degrees are 1,2,2,4. k[ε]/ε² retains nonzero ε with ε²=0; reduction has ε=0. Trivial-group tangent dimension 0. | Framing and formal deformation pass. |
| 3.1 partial Frobenius | Degree-two place over 𝔽₄; α⁴+α+1=0 | Local α¹⁶=α; single global α⁴=α+1; twice-global α¹⁶=α. Bound changes from s to s+2κ(V). | R02; specify the iterate and enlarged bound. |
| 3.2 comparison | GL₂ Steinberg and trivial representation | Both semisimple pairs (2,1/2); monodromy ranks 1 and 0. | Pass; only the semisimple parameter is compared. |
| 3.3 operations | Product values 2,3; twist −1; quadratic Weil restriction with χ(ϖ_E)=2 | Product class (2,3), tensor character 6; twisted value −2 on both sides. Induced eigenvalues ±√2 have F-weight 1/2, equal to `2 log₁₆2`. | Pass; fs attribution repaired. |
| 3.4 geometric representations | Steinberg; G_m value 3; transcendental unitary character | Steinberg weights ±1; value 3 weight log₂3; transcendental value has no number-field model despite modulus 1. | Pass. |
| 3.5 coefficient transport | q=5 and √5↦−√5; q=4 | Normalized pair changes from (√5,1/√5) to its negative; moduli and weights ±1 agree. At q=4 the rational √q=2 cannot change sign under a field automorphism. | Pass, conditional on the named chart-transport contract. |
| 3.6 tori | Unramified quadratic E/F with q_F=4; values 4 and 2; ramified f=1; inseparable degree p | q_E=16: weights 1 and 1/2; induced F-weights (1,1) and (1/2,1/2). For f=1 the weight is `2 log₄|a|`. Purely inseparable restriction has unipotent dimension p−1, not a torus. | Pass; refutes the source's unrestricted q_F criterion. |
| 3.7 stability | Reducible normalized GL₂ principal series | Trivial and Steinberg constituents share (2,1/2), hence weights ±1, although their N-ranks are 0 and 1. | Pass; constituent descent uses finite Hecke image. |
| 3.8 center | Normalized GL₂ Steinberg; μ_p in SL_p | Determinant `2·(1/2)=1`; central weight 0. In characteristic p, μ_p(F)={1}, while its scheme has nonreduced length p. | Pass; no nonsmooth-center torus is invented. |
| 4.0 matching | A₁ connections with c=π² and c=2π² | Both residues N, both maximal formal slope 1/2; invariant parameters π² and 2π² differ. Required match for P(φ)=1 is λ²=π². | R01; name the parameter map and own its eigenvalue identification. |
| 4.0 principal residue and affine genericity | Standard 2×2 N≠0 versus N=0; highest-root coefficient zero | Standard kernels 1 versus 2; adjoint kernels 1 versus 3. Killing the highest-root coefficient gives Swan∞=0 instead of standard Swan∞=1. | Pass; genuine negative controls. |
| 4.0 slope/rigidity | A₁; G₂ at p=2,3 | Dimensions 3 and 14; bounds 3/2 and 7/3 give integer irregularities ≤1 and ≤2. Zero-boundary dimensions 1 and 2 force H¹_c dimensions 1 and 2 and infinity boundary 0. | Pass for both small primes, conditional on precise rigid inputs. |
| 4.0 full inertia and N | A₄ inertia in SO₃ at p=2; odd-p rank-two torus normalizer | `(3+3(−1)+8·0)/12=0`. Odd-p adjoint splits dimensions 1+2 but both summands have invariant dimension 0. On any nonzero finite-dimensional space a nilpotent has kernel dimension ≥1. | Pass; ker N=0 forces invariant space 0, which forces invariant adjoint N∞=0. Irreducibility is not needed. |
| 4.0 trace transfer | Pure weight zero, q=4; A₁ adjoint | H¹_c eigenvalue moduli ≤2; H²_c eigenvalue moduli 4, so common roots 0. Here H²_c rank 0 and H¹_c eigenvalue 1/4, giving L(T)=1−T/4. | Pass; disjoint weights justify no cancellation. |
| 4.0 products/zero object | A₁×G₂, central quotient SL₂→PGL₂, H=1 | Conductors 1+2=3, invariants 0+0=0; adjoint dimension 3 on both sides of the isogeny. H=1 has adjoint rank 0 but tensor-unit rank 1 and Frobenius 1. | Pass. |
| 4.1 embedding predicates | Unit-circle conjugate of x⁴−x³−x²−x+1 | Chosen modulus 1; another conjugate modulus 1.7220838057390426. | Pass; one embedding is not all embeddings. |
| 4.2 globalization | G_m with ξ=1; proper rank-one Levi versus anchor | Torus has one prescribed Π=1 and adjoint dimension 0. Proper Levi leaves at least one central adjoint invariant; anchor invariant dimension 0. | Pass; infinitude excludes a torus; R01 remains prerequisite. |
| 4.3 pseudo-globalization | PGL₂ Steinberg pseudo-coefficient | Trace(St)=1, trace(trivial)=−1; trace(induced)=0=1−1. | Pass; nonzero trace implies common support, not equality of representations. |
| 4.4 global realization | Same two constituents | Both semisimple pairs (2,1/2), N-ranks 1 and 0. | Pass; theorem only needs the common semisimple parameter. |
| 4.5 discrete-series completion | PGL₂ Steinberg | Weights (−1,1), N-rank 1; monodromy center 0. Unbounded central scalar twists change full weights but not the adjoint parameter. | Pass; arithmetic assertion is semisimple. |
| 4.6 geometricity | Semisimple Steinberg versus G_m value 3 | Weights ±1 versus log₂3; both examples have algebraic models, only the first has integer Weil weights. | Pass; no reductive central overclaim. |
| 4.7 conjugate discrete series | Steinberg normalized Jacquet exponent | On the chosen negative generator its modulus is 1/2<1 in every conjugate embedding. | Pass; strict Casselman inequality preserved. |
| 4.8 temperedness transport | (3+4i)/5 versus Salem unit-circle conjugate | Both conjugates of the first have modulus 1; Salem conjugates include 1.7220838057390426. | Pass; geometricity excludes the second. |
| 5.1 separators | Dual SL₂ ν=(1/4,−1/4); dual B₂ ν=(1/2,0); A₂ zero | SL₂ adjoint pairings (1/2,0,−1/2), standard ±1/4. B₂ vector pairings (1/2,−1/2,0,0,0), spin ±1/4 each twice. A₂ has 8 zero adjoint weights. | Pass; adjoint/vector tests alone can miss a residual point. |
| 5.2 lifting | G adjoint; constant μ₂ coefficients in p=2; split double-cover kernel | Adjoint kernel has size 1. In p=2, H²(K,ℤ/2)=0 by Artin–Schreier cohomological dimension; in odd p the Kummer comparison gives Br(K)[2]. Nontrivial finite kernel changes lift eigenvalues by roots of unity, hence changes real weights by 0. | Pass; coefficient μ₂ is not the nonreduced characteristic-p group scheme. |
| 5.3 anchor integrality | Steinberg; hyperspecial anchor; constant 3 with no anchor | Local weights ±1; hyperspecial compact pair weights 0,0 before/after deleting that point; constant 3 has noninteger log₂3. | Pass; empty boundary is not an anchor. |
| 5.4 generic Ramanujan | PGL₂ complementary pair; noncentral G₂ compact involution | PGL₂ pair (√2,1/√2) has noninteger weights ±1/2. G₂ positive-coroot values are (−1,2,−2,2,−2,−4), none 4 or 1/4; deleting the compact sign gives highest-coroot value 4. Endpoint reflection subgroup and stabilizer each have size 4, quotient size 1. | Pass with central compactness; the unrestricted source inference fails. |
| 5.5 genericity | Unramified unitary PGL₂ principal series with pair (1,1) | Real part 0; root value 1 differs from q=4 and q⁻¹=1/4; stabilizer/reflection quotient size 1. | Pass; irreducible tempered spherical case is generic. |
| 6.1 ellipticity | GL₂ split distinct characters; irreducible GL₂; nonsplit torus; Klein four in PGL₂ | Centralizer quotient dimensions 1,0,0; the last finite centralizer has order 4 and dimension 0. | Pass; elliptic need not mean trivial component group. |
| 6.2 elliptic temperedness | Semisimple elliptic rank-two realization | Good-place weights (0,0), moduli (1,1); real Satake part 0. | Pass; GL_r needs its extra central normalization. |
| 6.3 frozen-leg formula | Irreducible GL₂, moving standard, then frozen dual⊗moving standard | Central weights 1 and 0. Central-invariant dimensions 0 and 4 respectively before tensoring with A_σ. | Pass; invariants under the finite quotient alone would wrongly retain the first dimension 2. |
| 6.4 realization | Identity U→U; empty stack; constant 3 | R⁰id_! has rank 1. Empty-stack direct images all rank 0. Constant 3 has weight log₂3, incompatible with the integer-weight contract. | Pass; zero case and non-example separated. |
| 6.5 conditional stack weights | G_m and BG_m | H¹_c(G_m) weight 0, H²_c weight 2. For BG_m, H^(−2i)_c has weight −2i for i≥1. | Pass; integral weights do not imply bounded cohomological degree. |
| 7.1 weak Arthur data | Trivial and standard SL₂; unbounded torus Weil factor | Arthur evaluations (1,1) and (2,1/2), N-ranks 0 and 1. Trivial SL₂ with Weil pair (4,1/4) has weights ±2 and is unbounded. | Pass; forgetting SL₂ loses data. |
| 7.2 prediction | Residual trivial PGL₂; complementary point | Neutral profile δ₁+δ₋₁ versus noninteger ±1/2. For N_ψ=0 and all arithmetic conditions, every weight is 0. | Pass; matching global ψ remains conjectural data. |
| 7.3 compatible parameter | Residual trivial PGL₂, trivial realization | Pair (2,1/2) has determinant 1 and weights ±1; trivial realization has polynomial 1−T. | Pass; not restricted to cuspidal π. |
| 7.4 discrete hypotheses | Residual χ∘det on GL₂ descending to PGL₂ | Central scalar a acts by χ(a²); descent requires χ²=1. Trivial residual pair remains (2,1/2). | Pass; generalized excursion eigenspaces allowed. |
| 7.5 rationality | Same rational matrix as §2.2; fixed-level simple Hecke module | Eigenvalues ±√2, field degree 2, full Hecke-image dimension finite. Rational coefficients do not force a one-dimensional rational eigenspace. | Pass; finite splitting/Schur-index extension allowed. |
| 7.6 Xue quotient | ℚ̄_ℓ[T]/(T−a), a transcendental over ℚ | Quotient dimension 1; T eigenvalue a remains transcendental. | Pass; number-field model is an independent hypothesis. |
| 8.0 strata/recognition | PGL₂ trivial/St; ν=(1/2,−1/2), q=4 and 16 | Same semisimple pair at fixed q, distinct nilpotent labels; standard profiles δ₁+δ₋₁ at both residue degrees. Numerical positive-root eigenvalues 4 and 16, each in a one-dimensional q-place eigenspace. | Pass; compares exponents, not numerical operators. |
| 8.1 global patterns | Residual trivial PGL₂; zero realization; ν=(1/4,−1/4) | n(±1)=1, n(0)=0; zero realization sum 0. Complementary example has weights ±1/2 and no integer-indexed pattern. | Pass; rank and integrality conditions explicit. |
| 8.2 complementary propagation | Dual Sp₆ partition (2,2,2) | Central profile 3δ₁+3δ₋₁; alternative δ₂+δ₁+2δ₀+δ₋₁+δ₋₂. Both total rank 6 but largest supports 1 and 2. | Pass; classifications restricted to the stated split sector. |
| 8.3 array | a(0,±1)=1; a(−2,−2)=3; N=0 | First margins 2δ₀ and δ₁+δ₋₁, both total 2. Second margins both 3δ₋₂. N=0 produces only diagonal entries. | Pass; row symmetry is not equal margins. |
| 8.4 Property A | a(2,1)=a(2,3)=1; zero; nonsymmetric singleton; signed array | Greatest discrepancy 3 has c=1>r=0. Zero margins agree. a(1,0)=1 gives c(1)=0<r(1)=1. Signed a(0,±1)=−1 gives c(1)=−1<0=r(1). | Pass; both excluded hypotheses are essential. |
| 8.4 exhaustive small test | Symmetric arrays supported in [−2,2]² with entries 0,1,2 | Nine reflection orbits; 3⁹=19,683 arrays; 243 diagonal/equal-margin arrays; 0 violations. | Pass, supplementing the downward-induction argument. |
| 8.5 classical discrepancy | Same Sp₆ profiles | At greatest difference 2, extraneous 1 versus neutral 0; equality above 2 is 0=0. | Pass; discrepancy is +1. |
| 8.5 exceptional points | All seven points; 48 F₄ roots, 126 E₇ roots, 240 E₈ roots, plus Cartan zeros | F₄ B₃ top entries (10,9,8)=(1,0,2), neutral contract (1,0,1); second F₄ top 4 multiplicity 1. E₇ (10,9)=(1,1), neutral (1,0). E₈ D₆ (18,17,16)=(1,0,2), neutral (1,0,1); remaining maxima 13,9,5, multiplicity 1 each. Dimensions 52,133,248. | Direct real-point root counts pass. Named neutral-orbit identifications remain the declared contract, not certified by these counts. |
| 8.5 printed F₄ negative control | Add the printed extra ω₂ | Top weight changes from 10 to 16, multiplicity 1 at the new maximum. | Package's correction passes. |
| 8.6 elimination | Sp₆ extraneous row versus neutral column; degree-two cover | At 2, row 1>column 0 contradicts Property A. Restriction gives eigenvalue 2→4 and q 4→16, unchanged weight 1; N→2N has unchanged rank in characteristic-zero coefficients. | Pass; no automorphic base change is assumed. |

### Library and ownership audit

The actual content checkout was main at `1ce5c4f05d1387e8830ae981f7d34d74ba931a89`. The manifest pins are Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a` and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. Sources were searched at these pins, not at a newer library. NilpotentOrbits, RepresentationTheory/LieHighestWeight and EtaleCohomologyFoundations on main were read for the repository's form and the actual supplied mathematics.

| Pinned declaration opened | What it actually provides and what it does not |
| --- | --- |
| Mathlib/Data/Finsupp/Defs.lean:88, `Finsupp` | Finite support, a function and the support/nonzero equivalence. Positivity comes from choosing ℕ, not from finite support. |
| Mathlib/Data/Finsupp/Basic.lean:267, `Finsupp.mapDomain` | Adds values along fibers of a map under `AddCommMonoid`; the two projections produce exactly the row/column sums. |
| Mathlib/Algebra/BigOperators/Finsupp/Basic.lean:45, `Finsupp.sum` | The additive declaration generated from `prod` sums over support; empty support gives zero. |
| Mathlib/Algebra/BigOperators/Group/Finset/Sigma.lean:120, `Finset.sum_comm` | Additive translation of `prod_comm`, exchanging the two finite sums. |
| Mathlib/Algebra/BigOperators/Group/Finset/Basic.lean:354, `Finset.sum_eq_single` | Requires vanishing away from the selected index and vanishing at that index when absent. No missing-index junk value is assumed away. |
| Mathlib/RepresentationTheory/Basic.lean:48, `Representation` | Body `G →* V →ₗ[k] V`; no topology, continuity, finite dimension, inertia, algebraicity or L-group projection is built in. |
| Mathlib/Algebra/Module/LinearMap/Defs.lean:84, `LinearMap` | Native semilinear map fields, not an arithmetic parameter or a curve coefficient. |
| Mathlib/AlgebraicGeometry/Scheme.lean:40, `AlgebraicGeometry.Scheme` | A scheme carrier; smoothness, finite type and a lisse adic coefficient are not fields automatically supplied by it. |
| Mathlib/RingTheory/WittVector/Isocrystal.lean:113, `Isocrystal` | Module over K(p,k) with `frob : V ≃ᶠˡ[p,k] V`. No curve, connection, overconvergence, Hecke eigenobject or finite-rank requirement is part of this class. |
| Mathlib/Algebra/Lie/Sl2.lean:38, `IsSl2Triple` | Includes `h_ne_zero`; it excludes the zero triple. The package correctly handles the zero orbit separately. |
| TauCeti/RepresentationTheory/Homological/ContCohomology/SmoothDiscrete/Basic.lean:272, `IsSmoothDiscrete` | Discrete topology and open stabilizers; no admissibility, discrete series or Langlands parameter. |
| TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean:91, `satakeParameters` | A classical newform quadratic-root pair. It is not the reductive local Satake class required here. |

Object searches used the roadmap service over main and the supplied open-head index, and the board-package index was read before interpreting the resolver's missing-package lead. Searches covered Weil–Deligne fields and purity, local/global shtukas, Bessel/Kloosterman coefficients, companion comparison, oper/critical-center localization, stack weights, pseudo-coefficients, spherical genericity and symmetric finite arrays. No declarations are duplicated by fully qualified Lean name: the acceptance file has none.

The parent owns the global stacks and Genestier–Lafforgue output; the package imports them and adds weight consequences and the Fargues–Scholze application. Linear monodromy fields remain in SmoothRepresentationsOfLocalGroups and ArithmeticGaloisRepresentations; scalar weights remain in DeligneWeightsAndPurity; character theory and triples remain in LieHighestWeight and NilpotentOrbits. Property A is an additional inequality, not a restatement of the native sum lemmas.

The broad searches also located the linear hyper-Kloosterman construction in CongruenceSpectralGap §5 and the linear rigid-cohomology examples in PadicDifferentialEquationsAndRigidCohomology. They do not provide the semisimple-group tensor eigenobject/Bessel identification needed here. Conversely, generic opers and critical centers have existing owners: R01 requires importing them. The later board design `packages/KloostermanSheavesAndBesselIsocrystals/design/README.md`, KB.1, KB.3–KB.4, KB.6–KB.7 and KB.11, overlaps the specialized construction moved into §4.0. This is the ownership move requested by prior F01, not a supplier edge to the later design. Its later monodromy, functoriality and Newton applications must import the moved construction. No sibling file was edited.

### Cross-roadmap citations, conventions and gaps

The following supplier citations were resolved against main or the available open head, every round anew. The locations below are in each roadmap's README, with the prefix `TauCetiRoadmap/`. R01 records the missing input beyond this list; the absence of a declared gap from today's supplier is not a finding.

| Supplier | Resolved sections and representative locations |
| --- | --- |
| GlobalShtukasAndFunctionFieldLanglands | §§1.4, 1.9–1.14; 2.1–2.5, 2.9–2.10; 3.6, 3.10, 3.12; 4.8, 4.12; 5.3–5.10; 6.1–6.2; 7.6–7.9. In particular §1.4 line 620 supplies stack coefficients, §2.9 line 1105 partial Frobenius, §3.6 line 1297 the degree iterate, §4.12 line 1627 full Weil descent, §7.8 line 2094 semisimple comparison. |
| FunctionFieldArithmetic | §5.8 and §§6.1–6.6. Lines 1995, 2226, 2315 and 2344 give Chebotarev, arbitrary connected-reductive finiteness, rational models and Satake normalization. |
| SmoothRepresentationsOfLocalGroups | §§SR.0.2, SR.1.3–SR.1.5, SR.2.2, SR.3.1–SR.3.4, SR.4.1–SR.4.2, SR.5.2. In particular lines 1230, 1962, 2768, 3178 and the raw-parameter/operations portion of SR.5.2 give the Hecke correspondence, normalization, unitary-central-character Casselman criterion, pseudoroots and raw WD data. |
| ArithmeticGaloisRepresentations | §2.6 at line 1938 and §§3.1–3.4 at lines 2448, 2544, 2608 and 2656: centered filtration, geometric-lift purity, conductors and their functoriality. |
| DeligneWeightsAndPurity | §§0.1–0.19, 5.2–5.12, 7.8–7.9, 8.5, 8.17–8.18. Particularly §0.19 line 1073, §5.11 line 2049, §8.5 line 2814 and §8.18 line 3059. The six-operation theorem there is for schemes; the stack extensions are declared gaps. |
| PadicDifferentialEquationsAndRigidCohomology | §§RD.1.16, RD.2.49–RD.2.51, RD.3.13, RD.3.25, RD.4.10–RD.4.12, RD.5.46, RD.6.23, RD.6.39, RD.6.51–RD.6.55 including RD.6.52a, RD.6.64–RD.6.65, RD.6.77, RD.6.84–RD.6.85. RD.6.23 is the coefficient trace formula. RD.6.39 does not by itself give the new IC middle-image specialization; RD.6.77 does not give geometric semisimplicity after forgetting Frobenius; RD.6.52a does not give the exterior-annulus comparison. |
| LanglandsParameterStacks | §§LP0.1–LP0.4, LP1.11–LP1.12, LP2e.5, LP2e.15, LP2c.1–LP2c.4 and LP2c.8. Abstract center and Schur-object reconstruction do not already construct the local Bun_G application. |
| ReductiveGroupsPartII | RG2.3–RG2.4 and RG2.5.1–RG2.5.2; dual group and finite Galois action at line 6724, L-group/normal-image maps at line 6931. Rational-point surjectivity of a central isogeny is not assumed. |
| MotivesAndAlgebraicCycles | §6.3 at line 1133: finite tensor generation with duals and the closed-immersion criterion. |
| NilpotentOrbits; RepresentationTheory/LieHighestWeight | Main N0–N2, especially N2.1, N2.2 and N2.4; main LieHighestWeight Layers 0 and 6, at lines 319 and 773. Named exceptional profiles require the separate gap. |
| HeckeStacksAndLocalShtukas | HS0.1–HS0.4, HS1, HS2.9, HS3.1–HS3.4, HS4.1 and HS4.7. HS2.9 line 1249 supplies the general-local-field analytic tower; HS4.1 line 2250 and HS4.7 line 2533 supply the continuous Hecke datum. Its special classical comparison in HS3.3 is not used to identify an arbitrary equal-characteristic classical rigid space. |
| DiamondEtaleCohomology; DiamondSixOperations | C0; S1.2, S1.5 and S2.1–S2.4, including the stated eligible-map and torsion-coefficient conditions before coefficient passage. |
| SchemeAndStackFoundations; EtaleCohomologyFoundations | Main Layers 1–2 at lines 2044/3232; main F.0–F.4, including scheme descent and finite/adic realization. |

The arithmetic/geometric normalization was compared across suppliers, not inferred from their headings. SR.5.2 uses arithmetic degree and `r(Φ)Nr(Φ)⁻¹=qN`; the package and the group-valued dictionary use the inverse lift. With `r(F_geom)=diag(1,4)` and Ne₁=e₀, geometric conjugation gives N/4 and arithmetic inverse `diag(1,1/4)` gives 4N. AGR §2.6 and DWP §0.19 explicitly use the geometric lift for purity. FunctionFieldArithmetic §5.8 counts arithmetic classes; inversion gives the geometric Chebotarev classes. SR.4.2's chosen pseudoroot and the package's q=4 pair have the same Weyl class, with half twists retained. R02 is the separate place-degree mismatch found during these checks.

All twelve slugs in `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/design/plan.json` have the identical needs sentence in README Exact supplier contracts and a named supplier:

- function-field-globalization;
- elliptic-pseudo-coefficients;
- discrete-series-number-field-model;
- reductive-central-reduction;
- spherical-adjoint-transfer;
- parameter-square-root-transport;
- stack-integer-weights;
- satake-constant-realization;
- exceptional-named-orbit-profiles;
- rigid-middle-extension-specialization;
- pure-isocrystal-geometric-semisimplicity;
- formal-to-differential-maximal-slope.

Their requests are specific extensions of the cited sections. The coupled clauses concern the same interface and its required compatibility, rather than unrelated work. The pseudo-coefficient search found real-group results elsewhere, not the requested every-local-function-field result. Scheme weights do not supply the stack contract; ℓ-adic geometric semisimplicity does not supply the p-adic contract; formal slopes do not supply the boundary-radius inequality. None is an unowned prerequisite merely because it remains unimplemented. They are not counted among the findings. R01 concerns a different, undeclared input.

The required dependency command exited 0. Its complete output was:

```text
moved: GlobalShtukasAndFunctionFieldLanglandsPartII moved in the merge order from #27 to #243, right after its last supplier HeckeStacksAndLocalShtukas (ArithmeticGaloisRepresentations, LanglandsParameterStacks, MotivesAndAlgebraicCycles, DiamondEtaleCohomology, DiamondSixOperations, DeligneWeightsAndPurity, PadicDifferentialEquationsAndRigidCohomology, FunctionFieldArithmetic, GlobalShtukasAndFunctionFieldLanglands also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 52 roadmaps, 595 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. The permitted moved line is not a defect. Every `Needs` line was read, including the local edges and the conditional interfaces. The resolver's sole missing-roadmap lead, KloostermanSheavesAndBesselIsocrystals, resolves to the board design and is a later consumer, not a missing supplier.

### Headline coverage, Lean and shape

The headline families are: intrinsic geometricity and completion uniqueness (§§0.2/0.4); absolute twist decomposition, propagation and purity (§§1.1–1.4); rational Satake classes (§2.2); local excursion application, uniformization and comparison (§§3.0–3.3); geometricity/transport (§§3.5–3.8); the all-prime anchor and Bessel/rigidity/transfer theorem (§4.0); globalization, pure completion and embedding independence (§§4.2–4.8); the spherical separator theorem (§5.1), integral weights, generic Ramanujan and genericity (§§5.3–5.5); elliptic temperedness, Lafforgue–Zhu and conditional stack consequences (§§6.2–6.5); conditional discrete rationality and Xue parametrization (§§7.5–7.6); and spherical classification/recognition, global patterns, propagation, named weight comparisons and elimination (§§8.0–8.2/8.5–8.6). The Arthur-existence/decomposition statements in §7.2 remain conjectural interfaces.

The module docstring names all these missing-carrier families, including §4.0. Searches at both pins did not locate reductive L-parameters, local/global shtuka stacks, lisse adic curve coefficients or Kloosterman/Bessel tensor coefficients. The native carriers in the table above do not make those headlines statable by a few simple definitions. Property A is statable with Finsupp, but is correctly identified as an auxiliary inequality rather than a substitute headline.

`lake env lean` on `packages/GlobalShtukasAndFunctionFieldLanglandsPartII/Suggested.lean`, run from the pinned content checkout, exited **0 with no output and no warnings**. No TauCeti module build was required. The file has one `import Mathlib`, one module docstring and an empty correct namespace. There are **zero** definitions, instances, theorem signatures or admitted examples. Consequently there are zero local `#check @name` obligations, zero disappearing local binders and zero sorried declarations to which the one-tactic padding probe applies. No substitute or padding declaration is present.

A separate scratch file elaborated the nine native `#check @name` expressions for Finsupp, Finsupp.sum, Finsupp.mapDomain, Finset.sum_comm, Finset.sum_eq_single, Representation, LinearMap, AlgebraicGeometry.Scheme and IsSl2Triple. It exited **0**. In particular the finite-sum APIs require their actual additive structures and the absent-index hypothesis remains in sum_eq_single. Nothing was changed in a package Lean signature. No Lean process remains running.

The README has nine layers, 52 numbered subsections, 54 Checks blocks, and the required scope, conventions, contracts, build-order, examples, dependencies, consumers and references structure. Every definition block has an API and at least three Checks; §5.1 contains two such constructions. No forbidden set_option, sorry'd data, computational algorithm, copied source passage, process identifier or absolute machine path was found in the package's mathematical files. The mathematical small computations are Checks, not proposed executable algorithms. The main scope boundary and the twelve declared gaps are retained. The remaining stylistic repetition is R04.

## Not verifiable

- The source service resolved **zhu-fg**, Zhu's *Frenkel–Gross' irregular connection and Heinloth–Ngô–Yun's are the same*, only to its paywalled published DOI. It appended one `uncertified` entry with Theorem 8, Corollary 9 and Lemmas 18–21. The original text and its exact internal hypotheses were not certified. This settled uncertified entry is not a missing-reference request. The dependency identified in R01 is independently visible in the readable xz proof, lines 2243–2289.
- The exceptional **neutral elements' named-orbit identifications** are the declared exceptional-named-orbit-profiles contract. The real-point root multiplicities were independently computed, and the source's stated neutral comparisons were located, but a root count does not establish that a proposed triple belongs to the named orbit. Acceptance after repair would remain conditional on this and the other declared supplier contracts.

No other sampled cached text was unreadable. Ownership against main, the supplied open-head index and the listed board packages was checked using the roadmap service; no claim of absence was based only on the current board checkout.

## Source issues

- **Misprint** in ch26 at Definition 2.6(iii), printed p. 7: the source says monodromy powers map lower weights to higher weights; it should be N^i from weight w+i to weight w−i for geometric Frobenius; affects a stated result.
- **Misprint** in ghs at Definition 3.3(a)(iii), printed p. 8: the source says N gives the graded isomorphism for every i; it should be N^i, including the identity for i=0; affects a stated result.
- **Error** in ghs at Definition 3.3(b), printed p. 8: the source says common-weight purity in one faithful realization is equivalent to that in every faithful realization; it should be qualified or replaced by intrinsic adjoint essential temperedness for reductive parameters; affects a stated result.
- **Error** in ch26 at Proposition 3.10(2), printed pp. 10–11: the source says Weil q_F-valued characters characterize geometricity for every torus; it should be the split criterion, with q_E normalization for induced tori and L-parameter geometricity in general; affects a stated result.
- **Gap** in ch26 at the sketch after Theorem 4.3, step (1), printed p. 11: the source says the cited pseudo-globalization realizes any discrete series as the actual local component; it should be common cuspidal support there, with a separate number-field descent argument; affects the proof.
- **Gap** in ch26 at the sketch after Theorem 4.3, step (2), printed p. 11: the source says semisimplicity of G makes every local monodromy representation geometric; it should be justified by an independent geometricity argument or retained as a hypothesis; affects the proof.
- **Error** in ghs at Remark 3.10, printed p. 11: the source says the local anchor parameter becomes irreducible under the adjoint representation; it should be absence of adjoint inertia invariants, which does not imply adjoint irreducibility; affects a stated result.
- **Error** in ch26 at Corollary 6.32(1) and its proof, printed p. 25: the source says an arbitrary compact factor permits the real generic-unitary separator argument; it should be qualified by a justified compact-factor restriction, such as central compactness; affects a stated result.
- **Gap** in ch26 at Remark 5.8 following Expectation 5.9, printed p. 16: the source says Lafforgue–Zhu proves constant-coefficient stack realization for elliptic parameters; it should be supplemented by a bridge from Satake coefficients to constant-coefficient stack direct images; affects the proof.
- **Misprint** in ch26 at Theorem 8.5(3), printed p. 29: the source says the F₄ B₃ point includes an extra ω₂; it should be ω₁+½ω₃+½ω₄, giving top adjoint weight 10 rather than 16; affects a stated result.
- **Misprint** in ch26 at the proof of Theorem 8.5(2), printed p. 29: the source says the surviving symplectic multiplicity factors have odd j; it should be even j, as in the theorem and preceding decomposition; affects the proof.
- **Misprint** in ch26 at the proof of Theorem 10.3, cases (3a), (4), (5a), printed p. 34: the source says n_v on both sides of several comparisons, including strict inequalities; it should be n_u for the neutral-profile comparison term; affects the proof.

<!-- tauceti-roadmap-review {"agent": "codex", "head": "153251d3f55de4e5f2f8183da6a7bc7e50d687aa", "job": "REV-PKG-GlobalShtukasAndFunctionFieldLanglandsPartII~3", "model": "gpt-6-astra", "worker": "chris-12"} -->
