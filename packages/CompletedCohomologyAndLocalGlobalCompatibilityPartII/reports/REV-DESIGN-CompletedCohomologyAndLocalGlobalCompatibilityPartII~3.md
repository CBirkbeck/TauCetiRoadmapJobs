<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/252#issuecomment-6405576103 -->
Review (claude) of 6800b8d

Verdict: accepted
Conditional on the announced gaps: `framed-ring-components`, `crystalline-inertial-types`, `principal-series-types`, `minimal-stratum-types`, `projective-products`, `completed-tensor-reduced-equidimensional`, `geometric-component-splitting`, `pd-crystalline-lift`, `algebraic-capture`, `crystalline-lift-prescribed-determinant`, `crystalline-closure-components`, `local-benign-crystalline-points`, `berthelot-points-components`

1. **F01** (P3) IYE Proposition 5.10 is cited at a generality its statement does not carry

   **Location.** `design/README.md` line 54 and the `detail` of `crystalline-closure-components` in `design/plan.json`: “IYE Proposition 5.10, pp. 26–27 (IYE lines 1023–1087), for the framed space of an arbitrary residual representation”.

   **Claim.** The source states the component-union closure theorem for the framed space of an arbitrary ρ̄.

   **Witness.** IYE line 224: from §2.1 on, the paper fixes ρ̄ to be the trivial representation; Proposition 5.10 (IYE lines 1023–1025) is stated under that standing assumption. The general-ρ̄ form is BIPD Theorem 3.3 (BIPD lines 349–354), whose proof cites the IYE argument, and BIPD line 439 (“carries over verbatim”). The proof itself uses only inputs valid for every ρ̄ (Kisin’s crystalline closed subspace, NAK Lemma 4.2, BHS Theorem 3.6.2 via IYE Proposition 5.7, BHS Proposition 4.1.4 via IYE Proposition 5.9, HMS Corollary 3.13), so the contract’s `needs` sentence is correct; only the locator overstates what IYE asserts.

   **Repair.** In both files, replace the phrase by: “IYE Proposition 5.10, pp. 26–27 (IYE lines 1023–1087), stated there under IYE’s standing assumption that ρ̄ is trivial (IYE line 224); its proof applies to every ρ̄ with absolutely irreducible Jordan–Hölder factors, as BIPD Theorem 3.3, p. 8, and the proof of BIPD Theorem 4.2, p. 10, use it (BIPD lines 349–354, 439)”. Tested on the instance that refuted the original: for F=ℚ_2, d=1 and trivial ρ̄ the two statements coincide; for a non-trivial ρ̄ (the unramified quadratic character over ℚ_5) IYE’s text makes no assertion, BIPD Theorem 3.3 does. Nothing else changes; the `needs` sentence stays as it is.

2. **F02** (P3) Rigid-analytic Zariski density is used in two senses without a convention

   **Location.** `design/README.md` line 17 (“Crystalline and benign points are Zariski dense there as well”), the §5.2 statement at line 406 (“already in the rigid generic fibre”) and the §5.2 route at line 408 (“the Zariski closure of these points is a union of components, hence everything. An element of R□[1/p] vanishing on Σcris then lies in every maximal ideal”).

   **Claim.** Density in (Spf R)^rig is a defined notion.

   **Witness.** BIPD lines 31–32 define it by vanishing of global rigid functions; IYE Definition 5.8 (lines 1012–1016) and BIPD Theorem 3.3’s proof use the smallest Zariski-closed analytic subset. The README’s route uses the closure form (through gap:crystalline-closure-components) and then the function form; the two agree on (Spf R)^rig, but only because that space is quasi-Stein, and the Conventions say which one is meant nowhere. Computed control: in the open unit disc (Spf O[[x]])^rig the set {p^a : a ≥ 1} lies in the closed subdisc of radius |p|, where a rigid function with infinitely many zeros vanishes, so its closure is the whole disc and no nonzero global function kills it (both senses agree); the set {p^{1/a}} has |p^{1/a}| → 1 and is killed by ∏_a(1 − x^a/p), which converges on every closed subdisc, so it is dense in neither sense.

   **Repair.** Add one sentence to the Conventions after line 17: “A subset of (Spf R)^rig is Zariski dense when the smallest Zariski-closed analytic subset containing it is the whole space; for these quasi-Stein spaces this is equivalent to the vanishing of every global rigid function that is zero on the subset (BIPD p. 1, BIPD lines 31–32; IYE Definition 5.8).” Mirror the sentence in the plan’s conventions text. No statement changes.

Reviewed at head `6800b8d` of the board pull request (the checkout was already at that head). Files read: `packages/CompletedCohomologyAndLocalGlobalCompatibilityPartII/design/README.md` (589 lines), `design/plan.json`, `sources.toml`. Two findings, both P3, neither blocking. The acceptance is conditional on the thirteen declared supplier gaps listed in the review record.

## Verified sound

### Round-2 findings, checked at the current head

| Round-2 finding | Status | Repaired passage and independent check |
| --- | --- | --- |
| F01 (P1), fixed-depth family does not characterise the full minimal-stratum set | Repaired | README line 513 defines the deep subset: “Σsc_{k,E,m} consists of the points of Σ_k whose local Langlands representation contains some V(α,θ) with … n>2m, and θ∈C(m,α)”. Line 521 proves deep ⊆ full by EP Proposition 3.19’s proof (EP lines 832–834: Ind_{H^{m+1}}^{H^1}θ is a sum of θ̃∈C(0,α)) and says “The converse fails for strata with n≤2m”. Line 522 restricts the tame equivalence to the deep subset. Line 537 states density of Σsc_{k,E,m} for every m≥1 with U^{m+1}(𝔄) torsion free and of Σsc_{k,E} by inclusion; EP Theorem 5.1’s proof (EP lines 1136–1138, 1161–1164) indeed only places detected points inside the target set. Shallow negative control at line 531 and line 546; recomputed in the table below. Unramified case stated by inclusion at line 544. Plan statements, API and Checks agree verbatim. |
| F02 (P2), continuous finite-index induction already owned | Repaired | README line 122: “§1.3. Continuous induction from an open subgroup H of a profinite group Γ … both Frobenius reciprocities, duality, the projection formula, and the homeomorphism with the finite product over a right transversal”. ArithmeticGaloisRepresentations §1.3 at its open head (`TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md` lines 879–913) states exactly these, with coefficient tier a finite extension of ℚ_ℓ (its Conventions). The gap is gone from `plan.json` (13 gaps remain, none with that slug) and from the README. §3.2 (line 265) carries the coset formula and its continuity; the nonsmooth Check (line 284) is computed below. Scope line 9 and the Layer 3 Dependencies (line 343) cite §1.3. |
| F03 (P3), testing-module Check without an instance | Repaired | README line 286: “H=1, B=O[[x]] acting on M=B/(x²) and Θ=O: M is free of rank two over O=O[[H]] … Ann_B(M)=(x²) … x²=0 but x≠0”. Values recomputed below. |
| F04 (P3), packaging language | Repaired | Line 132 ends “Each gap named in a *Needs:* line is a theorem stated by its supplier, not supplied by a citation alone.” A scan for process words (packaged, review, pull request, so far, current, removed, checkpoint, round, local paths, LaTeX delimiters, `set_option`) over the README returned nothing. |
| F05 (P2), prime restriction on crystalline and benign density | Repaired | Line 406: “For every prime p, every finite F/ℚ_p, every d≥1 and every ρ̄ in the standing setup, Σcris is Zariski dense in X□ … and already in the rigid generic fibre”. Line 460: “For every prime p, benign crystalline points … are Zariski dense in X□ … and already in (Spf R□_{ρ̄})^rig”. The local route (line 408) is BIPD Corollary 2.8 → components X□,χ → IYE/BIPD closure → BIPD Lemma 5.1; each step is a named supplier section or a declared gap (crystalline-lift-prescribed-determinant, framed-ring-components, berthelot-points-components, crystalline-closure-components; local-benign-crystalline-points for §6.1). The patched route is kept for p∤2d and §4.2, §§5.3–5.4, 6.3, 6.5 keep p∤2d, as BIP Remark 6.10 (BIP lines 2498–2500) requires. Summary (line 3), Conventions (line 15), §1.2 Check (line 173), Downstream consumers (line 568) and the headline list (line 572) are synchronised. Positive p=2 Checks at lines 413–414, 469, computed below. |

The two findings of round 2 marked not actionable in the earlier repair (supplier implementation of the pd-crystalline lift and of algebraic capture) remain declared gaps; neither is re-raised.

### Principles

No route-specific shortcut: the all-prime statements are the general theorems and the p∤2d statements are exactly the range of the only known proof (BIP line 2499). No re-planning: the parent’s M∞, type tests, support, benign predicate and trianguline variety are imported (parent §§5.1–5.3, 5.2a at head `7a5b2ea`, lines 1742–1856). Supply is downward: gate output below. No copied passage was found (sources are cited by locator and line; no sentence of the README reproduces a source sentence among the passages read). No algorithm, sorry’d data or `set_option` (the design has no Lean file). Fetched text was treated as data; no instruction-like text was encountered.

### Design files agree with each other

A script compared `plan.json` with the README: all 21 target statements and proof sketches, all 105 API bullets and Checks, all 21 locator parentheses and all 21 `*Needs:*` lines are verbatim in the README; the six layer Dependency lists equal the ordered union of their targets’ prerequisites; the 13 gap paragraphs (`What <Supplier> must provide (gap:<slug>): <needs> Supplier section: <section>. <detail>`) are verbatim; every `gap:` slug used in the README is declared exactly once in `plan.json` and every declared slug is used. `tauceti-roadmap sources check` on `sources.toml`: 0 problems. The citation resolver on the README: no cross-roadmap citation and no Lean name found nowhere (index of 2026-10-26T00:11:57Z, main at `c69a108`).

### Source verification (seeded sample and every locator a repair touched)

Pagination: BIP, EP, NAK, DEJ, CON published; CEGGPS, DPS, ST, EG, HP, BIPD, IYE the recorded preprint or author copy. All twelve texts in the manifest were readable from the sources cache; no fetch was needed and the manifest was not changed.

| Target | Passage read and outcome |
| --- | --- |
| 1.1 Potentially semistable point sets | BIP lines 2284–2309 (p. 46): Σcris with weights varying; Σ_k, Σprnc_k, Σspcd_k with fixed regular k, N=0 and irreducible induced WD for Σspcd_k; CEGGPS lines 460–535 (pp. 12–14): HT(ε)=−1, L_ξ with ξ_{κ,i}=−a_{κ,n+1−i}, r_p twist (1−n)/2, geometric Artin; DPS lines 1742–1761 (p. 38): HT(ε)=+1 there. Matches. |
| 2.1 Patched deformation components | BIP lines 2339–2360 (p. 47), Lemma 6.3: R∞≅R□⊗̂A, A O-torsion free reduced equidimensional; components (χ,𝔭) after enlarging L; geometric integrality via HP Lemma A.5 and Corollaries 4.19/4.21. Matches, including the determinant-torsion meaning of χ. |
| 2.2 Roots of torsion-free characters | BIP lines 2364–2378 (p. 47), Lemma 6.4: hypothesis trivial on torsion of G_F^ab, finite extension, d-th root; the preceding sentence (line 2361–2363) says no p∤2d is used. Matches. |
| 3.1 Capture and scalar actions | EP lines 266–354 (pp. 342–344): Definition 2.1, Lemmas 2.2–2.10; lines 612–621 (p. 351): Proposition 3.1, Corollary 3.2. The design’s W≠0 hypothesis is the correction registered in round 2. Matches. |
| 3.2 Patched testing modules | BIP lines 2413–2418 (p. 48): M∞(Θ)=(Hom(M∞,Θ^d))^d finite over R∞, M∞(V) independent of Θ; EP lines 364–382 (p. 345): Proposition 2.11 and the finite-R-module statement. ArithmeticGaloisRepresentations §1.3 for induction (above). Matches. |
| 3.3 Capture by smooth types | EP lines 552–607 (pp. 349–350): Proposition 2.23 with the uniform member K_{n0} and K_{n0}^{p^m}=K_{n(m)}; lines 635–656: Lemma 3.4 and Proposition 3.5 (U^n(𝔄) uniform for n>c); lines 657–749 (pp. 352–354): principal family, Lemma 3.10, Proposition 3.11; lines 917–928 (p. 358): Proposition 3.26 with “m large enough so that U^{m+1}(𝔄) is torsion free”. The README’s “every m≥1 with U^{m+1}(𝔄) torsion free” is EP’s condition. Matches. |
| 3.5 Algebraic detection of projectives | BIP lines 2432–2446 (p. 49), Lemma 6.7: nonzero projective with fixed centre, product of indecomposables, highest weight for θ, DPS Corollary 7.8 evaluation density. Matches. |
| 4.1 Detection of local components | BIP lines 2448–2461 (p. 49): Lemma 6.5 lift, Lemmas 6.6–6.7 test, EP Theorem 6.12 support, contraction via Lemma 6.3. The component-through-a-point repair of round 2 is retained. Matches. |
| 4.2 Faithfulness | BIP lines 2447–2461 and 2484–2494 (pp. 49–50): faithfulness of R□, not of R∞; reducedness via Corollary 4.22. Matches. |
| 5.2 Crystalline density | BIPD lines 243–319 (pp. 6–7): Propositions 2.6–2.7, Corollary 2.8, no restriction on p or d; lines 329–339 (p. 8): O[μ]-algebra structure, R□,χ O-flat normal domains, components X□,χ by Conrad 2.3.1; lines 347–354: Definition 3.2, Theorem 3.3; lines 442–465 (pp. 10–11): points of (Spf R)^rig, Lemma 5.1, Corollary 5.2; BIP lines 2495–2498 (p. 50): Remark 6.10. Matches the statement and the local route. |
| 5.3 Principal-series density | BIP lines 2311–2312, 2480–2483; EP lines 698–710 (Proposition 3.7), 1126–1164 (Theorem 5.1 proof), 1202–1209 (Theorem 5.3). Matches. |
| 5.4 Supercuspidal density | BIP lines 2306–2312, 2480–2483; EP lines 824–843 (Proposition 3.19, tame part), 1202–1209. Unramified E is tame, so the character-induction form applies. Matches. |
| 6.1 Benign density | BIP lines 2313–2314 (Remark 6.2); NAK lines 1356–1418 (pp. 120–122), Lemma 4.2 on the framed fixed-type crystalline space with benign output including the p^{±f} ratio condition (NAK Definition 2.8, lines 396–402); BIPD lines 428–440 (p. 10), proof of Theorem 4.2; EP lines 1320–1336 (p. 368), Definition 6.8 and Proposition 6.9. Matches. |
| 6.3 Prescribed inertial type | BIP lines 2313–2314; CEGGPS lines 1651–1663 (p. 41), Theorem 3.7 with N=0; lines 1950–1952 (p. 48), finite model; EP lines 618–621. Matches, with weights varying. |
| 6.4 Minimal-stratum points | EP lines 753–770 (p. 354): Definition 3.12, Remark 3.13, Example 3.15; lines 774–843 (pp. 355–356): Lemma 3.16, strata, H^m, J^m, ψ_α nontrivial on U^n (line 800), C(m,α) (line 801), Definition 3.17, Proposition 3.19 and its proof; lines 1116–1125 (pp. 362–363): the §5.3 set Σsc. Matches, including the tame-only character description. |
| Gap locators added in round 3 | EG lines 6816–6828 (Theorem 6.3.2; PDF page 175 = printed p. 165, as cited); DEJ lines 2427–2439 (Definition 7.0.1: A/I finitely generated over k, so Spf of a complete local Noetherian O-algebra with residue field finite over k qualifies) and 2553–2560 (Lemma 7.1.9: bijection with maximal ideals of A⊗K, local map inducing an isomorphism on completions); CON lines 141–152 (FSp, discretely valued base) and 1053–1070 (Theorem 2.3.1 for R-flat X: components of X^rig are the images of the generic fibres of the connected components of the normalization); IYE lines 1012–1087 (Definition 5.8, Propositions 5.9–5.10) and line 224 (R01). |

Not re-read this round: ST and HP (unchanged since round 2, which opened them with line numbers).

### Computed adversarial table

Rows cover the passages the repairs changed or added, the seven headlines, the sampled targets and both findings. Models of algebraic steps are labelled as models.

| Statement | Instances tried | Values computed on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §5.2 statement at p=2 | d=1, F=ℚ_2, trivial ρ̄ | μ_{2^∞}(ℚ_2)={±1}; O[μ][1/2]=L×L, so 2 components χ=1, χ=sgn; the character x↦x^n on ℤ_2^×, 1 at 2, is ≡1 mod 2 (x≡1 mod 2), so lifts the trivial character; value at −1 is (−1)^n: n=0 gives +1, n=1 gives −1; 2 divides 2d=2 | Both components contain a regular crystalline point; old hypothesis false here, new statement holds | None |
| §5.2 Check, d=2 at p=2 | F=ℚ_2, trivial ρ̄, diag(χ_a,χ_b) | det at −1 is (−1)^{a+b}: (a,b)=(1,0) gives −1, (2,0) gives +1; a≠b in both; components 2 by gap:framed-ring-components (|μ_{2^∞}(ℚ_2)|=2) | Both components met; agrees with PadicLocalLanglandsForGL2Qp §3.6a’s Check (two dyadic components) | None |
| §5.2 local route, components of (Spf R□)^rig | R□ reduced with minimal primes 𝔭_χ, R□,χ normal | Normalization of R□ = ∏_χ R□,χ (each quotient already normal); Spf of each is connected; CON 2.3.1 gives components (Spf R□,χ)^rig; a point x has one χ_x with x∈X□,χ_x and det ρ_x on μ takes distinct values for distinct χ in characteristic zero, so components are pairwise disjoint | Step holds; needs O-flatness (CON) and excellence (complete local Noetherian rings are excellent) | None |
| gap:berthelot-points-components, components | A=O[[u,v]]/(uv); A=O[[x]]/(x²−ϖ), p odd; A=O | Normalization O[[u]]×O[[v]], 2 components (two open discs meeting at the origin); A=O[√ϖ] is a DVR, 1 component, splitting into (x−a),(x+a) only after adjoining a²=ϖ; Spf(O)^rig = one point = one maximal ideal of L | Component count matches the normalization count; coefficient extension matters, as gap:framed-ring-components says | None |
| gap:berthelot-points-components, points | A=O[[x]] | Point x=p of the open disc ↔ maximal ideal (x−p) of O[[x]][1/p]; x=1 is not a point and x−1 is a unit of O[[x]], so (x−1) is not an ideal of the generic fibre | Bijection consistent on a point and a non-point | None |
| §5.2 rigid-to-scheme step | f∈R□[1/p] zero on Σcris; model B=O[[x]]/(x²) | Closure of Σcris = X, so f(x)=0 at every point x, i.e. f∈⋂ m_x = nilradical of the Jacobson ring R□[1/p] = 0 as R□ is reduced; R□⊆R□[1/p] by O-torsion freeness, so the vanishing ideal in R□ is 0 and V(0)=Spec R□. Control: in B the element x vanishes at every characteristic-zero point but x≠0 | Reducedness and O-flatness are both used and both supplied | None |
| gap:crystalline-lift-prescribed-determinant | d=1; p=d=2 with the unramified twist step | d=1: the lift is ψ, weight vacuously regular; BIPD line 309–312: η unramified ≡1 mod ϖ, χ^d=η needs a d-th root of a principal unit, e.g. η(Frob)=3, χ(Frob)=√3 over ℚ_2(√3) | No restriction on p or d, as the contract says | None |
| HT convention of BIPD/IYE | (2,0), (1,1) | BIPD line 300 and IYE line 957: HT(ε)=+1; negate and reverse: (2,0)↦(0,−2) regular, (1,1)↦(−1,−1) not regular | Same set Σcris in both conventions | None |
| §6.1 local route | x∈Σcris of weight k, Z=closure of benign points, X_k=(Spf R□,k_cr)^rig | If x∉Z then U=(X∖Z)∩X_k is an admissible open neighbourhood of x in X_k; gap:local-benign-crystalline-points gives a benign z∈U; z∈Z, contradiction; hence Σcris⊆Z and closure(Σcris)=X by §5.2 gives Z=X | Route holds; uses the closed immersion of §R2.9 and LocalGaloisDeformationRings §3.4’s point criterion | None |
| §6.1 Checks | rank 1; rank 2 eigenvalues 1,p at f=1; p=2,d=1,F=ℚ_2 | Rank 1: no eigenvalue pairs, benign = crystalline with regular weight (vacuous); ratio p/1=p=p^f excluded; parity of n meets both dyadic components as in §5.2 | Checks hold | None |
| Benign predicate agreement | EP Definition 6.8 vs NAK Definition 2.8 vs parent §5.2a | EP (lines 1320–1325): distinct eigenvalues, noncritical refinements, ratio ≠p^{±f}; NAK (lines 396–402): α_i≠α_j, p^{±f}α_j, strict weights, refinement condition; parent line 1848: the same three conditions | One notion, no mismatch between the two gaps and the parent | None |
| §3.2 induction comparison (F02) | K=ℤ_5^×, H=1+5ℤ_5, χ(u)=u | Index 4; χ(1+5^a)=1+5^a≠1 for every a≥1, so χ is not smooth; dim Ind=4; Hom_H(O[[K]],χ*)≅(χ*)^{4 cosets} has dimension 4; Hom_K(O[[K]],(Ind χ)*)=(Ind χ)* has dimension 4 | Continuous, not smooth, induction is what is used; supplier covers it | None |
| §3.2 coset formula | φ:M∞→V* H-equivariant, Φ(m)(x)=φ(xm) | Φ(m)(hx)=φ(hxm)=h·φ(xm); Φ(gm)(x)=φ(xgm)=Φ(m)(xg), the right-translation action of ArithmeticGaloisRepresentations §1.3; continuity on [K:H] coordinates | Formula correct in both variables | None |
| §3.2 reducedness Check (F03) | H=1, B=O[[x]], M=B/(x²), Θ=O | M≅O², compact projective over O; test (Hom_O(M,O))^d=M by torsion-free biduality; Ann_B(M)=(x²); in B/(x²), x≠0 and x²=0 | Finiteness and projectivity do not give reducedness | None |
| §6.4 shallow point (F01) | p=3, d=1, F=E=ℚ_3(ζ_3), ϖ=ζ_3−1 | U^1/U^2≅𝔽_3; a character trivial on U^2, nontrivial on U^1, is ψ_α on U^1 with v(α)=−1 (α∈𝔭^{−1}∖O_F), stratum n=1, α minimal (e=1); ζ_3=1+ϖ∈U^1∖U^2 and U^2 is torsion free (−1∉U^1), so least m=1 and deep n≥3; every θ∈C(m,α′) with v(α′)=−n is nontrivial on U^n (EP line 800) while the character is trivial there; 3∤2 | Full membership 1, deep membership 0: equality false, inclusion true | None |
| §6.4 deep ⊆ full | d=1 model of EP lines 832–834 | Ind_{U^{m+1}}^{U^1}θ = ⊕ of the [U^1:U^{m+1}] characters θ̃ of U^1 extending θ; each restricts to ψ_α on U^{[n/2]+1}, so each lies in C(0,α); the representation contains one of them | Inclusion holds | None |
| §6.4 “converse fails for n≤2m” | fixed 𝔄, supercuspidal π | The level n of a simple stratum of π in the fixed order 𝔄 is determined by π (normalised depth n/e(𝔄)); a point with n≤2m contains no V(α′,θ′) with n′>2m | Statement correct; witnessed by the row above | None |
| §6.5 torsion-free hypothesis | 𝔄=O_F, F=ℚ_3(ζ_3) | U^1 has torsion ζ_3, U^2 does not, so m≥1 is forced, matching EP line 919; EP’s constant c=e(𝔄|ℚ_3)=2, so U^n is uniform for n>2 and Proposition 2.23’s uniform member exists for every filtration tail | “every m≥1 with U^{m+1}(𝔄) torsion free” is EP’s exact condition | None |
| §6.5 tame inference and non-example | p=5, d=2, E=ℚ_5(√5); degree-12 extension over ℚ_5 | e=2, f=1, 5∤4, uniformizer minimal; for f=2, e=6: sixth powers in 𝔽_25^× form the subgroup of order 24/gcd(6,24)=4, which is 𝔽_5^×, so no residue generates 𝔽_25 | Tame follows from p∤d; minimality is a separate hypothesis | None |
| §6.5 unramified case vs §5.4 | d=1, E=F, unramified χ | χ|U^1=1, so χ contains no stratum with n>0 and χ∉Σsc_{k,F}; χ∈Σ_k=Σspcd_k; conversely Σsc_{k,E,m}⊆Σspcd_k by EP 3.19 (Ind from W_E irreducible, E unramified of degree d) | Inclusion, not equality, exactly as line 544 says | None |
| §4.2 faithfulness (headline) | reduced R; B=O[[x]]/(x²) | ⋂ minimal primes = 0 in R; in B it is (x)≠0 | Reducedness is the input that closes the argument | None |
| §5.3 principal density (headline) | d=1, fixed weight, F=ℚ_p | Characters of ℤ_p^× of order dividing p^a number p^a; for the EP count, |X(n)|∼q^{nN} at N=1; a single fixed type gives one inertia condition and a proper locus | Density needs all conductors; statement unchanged | None |
| §5.4 supercuspidal density (headline) | d=1; d=2, q=5 | d=1: E=F, induction dimension 1, Σspcd_k=Σ_k; d=2 unramified E: a tame character of order 24 has Frobenius exponents 1≠5 mod 24, induction irreducible of dimension 2, N=0 | Tame recognition applies | None |
| §6.3 prescribed type (headline) | W=σ(τ)≠0; W=0 | Tensor capture gives common kernel 0 and Jτ=Ann_R M∞=0; W=0 gives common kernel M∞, J=R, C=∅ | Nonzero type is what the statement uses | None |
| §1.1 point sets | d=1; rank-two Steinberg | d=1: WD dimension 1, N=0, Σspcd_k=Σprnc_k=Σ_k; Steinberg has N≠0 and lies in Σ_k only | Predicates separate as stated | None |
| §1.2 lift input at p=d=3 | trivial rank one; p divides 2d=6 | EG lift exists; faithfulness and fixed-weight densities excluded; §5.2 applies by the local route | Check at line 173 correct | None |
| §2.1 geometric splitting | A=O[[x]]/(x²−ϖ) | Domain before extension; after a²=ϖ, minimal primes (x−a),(x+a), count 2 | Ordinary integrality insufficient | None |
| §2.2 root theorem | p=2, d=2, ψ(γ)=3 | b²=3 over ℚ_2(√3); η(γ)=b; torsion control: ψ(t)=−1 on an order-two t has no square root since η(t)²=1 | Finite extension suffices; torsion hypothesis needed | None |
| §3.1 capture controls | empty family; M=O/ϖ; W=0 | Common kernels M, O/ϖ, O respectively | Degenerate inputs excluded by the stated hypotheses | None |
| §3.3 growth | principal family, d=1,2 | q^{nd}·(q^{nd(d−1)/2})²=q^{nd²}: q^n and q^{4n} | Matches [I_{n0}:K_{n+1}] exponent | None |
| §3.5 central exponents | d=2, exponents 1 and −1 | Highest weights (1,0) and (0,−1); det^a has exponent 2a | Determinant powers miss odd exponents | None |
| §4.1 component through a point | Spec L[x,y]/(xy) | (1,0) lies on V(y) only; (0,0) on both | Selection of a component through the point | None |
| Conventions sign witness | d=2, k=(2,0); F=ℚ_5, u=2 | a=(1,0), dual highest weight (0,−1); δ_geom(2)=2, arithmetic 1/2; (2·f)(m)=f(2⁻¹m)=2f(m) | Consistent across §§1.1, 2.3 | None |
| R01 instance | ρ̄ trivial vs the unramified quadratic character over ℚ_5 | IYE’s statement covers the first and is silent on the second; BIPD Theorem 3.3 covers both | Locator overstates; contract correct | R01 |
| R02 instance | open unit disc, S={p^a}, S′={p^{1/a}} | S in the closed disc of radius |p|: infinitely many zeros there force vanishing, closure = X, no global function kills S; S′: |p^{1/a}|→1 and ∏(1−x^a/p) converges on |x|≤r<1 for every r<1 and vanishes on S′ | Both senses agree on these; a convention still names which is meant | R02 |

### Pinned library declarations opened

| Declaration | File and line at the pin | What it gives and does not give |
| --- | --- | --- |
| `Module.annihilator`, `Module.mem_annihilator` | `Mathlib/RingTheory/Ideal/Maps.lean` 868, 870 (Mathlib `6b7abb3c`) | `RingHom.ker (Module.toAddMonoidEnd R M)`; membership is `∀ m, r • m = 0`; no topology or reducedness |
| `Module.comap_annihilator`, `Module.annihilator_eq_bot` | same file, 894, 900 | contraction needs `Algebra R₀ R` and `IsScalarTower`; the equivalence with `FaithfulSMul` needs `Ring R`, `AddCommGroup M` |
| `ContRepresentation.coindV`, `ContRepresentation.coind` | `Mathlib/RepresentationTheory/Continuous/Basic.lean` 533, 550 | functions with `f (φ g * h) = π g (f h)`, action by right translation; no finite-index or finite-product statement, which is what ArithmeticGaloisRepresentations §1.3 supplies |
| `PrimeSpectrum.zeroLocus_vanishingIdeal_eq_closure` | `Mathlib/RingTheory/Spectrum/Prime/Topology.lean` 159 | the closure comparison used in §5.1 |
| `TauCeti.completedGroupAlgebra` | `TauCeti/Topology/Algebra/Group/Profinite/CompletedGroupAlgebra/Basic.lean` 145 (Tau Ceti `a91d3aaf`) | a subalgebra of the product of levels; a construction, not admitted data |
| `TauCeti.IsCompactModule.completedGroupAlgebraModule` | `…/CompletedGroupAlgebra/Module.lean` 344 | `smul := hM.completedSMul`; the compact-module witness is an argument |
| `TauCeti.IsCompactModule` | `TauCeti/Topology/Algebra/Module/Compact.lean` 294 | a `Prop` structure: topological additive group, continuous scalar action, compactness, total disconnectedness |

No arithmetic carrier of the seven headlines (framed local deformation ring with representation-valued points, potentially semistable predicates, local types, the patched module) exists at either pin; the README’s statability verdict (line 572) stands.

### Supplier resolution

Open roadmaps were read at the heads of the current index; roadmaps on main at `c69a1088`.

| Supplier | Where resolved | Contract checked |
| --- | --- | --- |
| ArithmeticGaloisRepresentations §1.3 (open, `bef111d`) | README lines 879–913 | continuous induction `IndV H σ`, right translation, both reciprocities, duality, projection formula, transversal homeomorphism, agreement with `ContRepresentation.coind`; coefficient tier a finite extension of ℚ_ℓ |
| AdicSpacesPartIII §R2.9 (main) | `TauCetiRoadmap/AdicSpacesPartIII/README.md` lines 7714–7800 | `FS_C`: locally noetherian formal schemes over Spf C with reduced scheme locally of finite type over C_red, affine opens quotients of `C[[q]]{{T}}`; so Spf of a complete local Noetherian O-algebra with residue field finite over k is an object; `rigOfFSC` takes closed immersions to closed immersions. Points-as-maximal-ideals and normalization components are not stated there: the gap is needed and asks for nothing already present (the rig-point bijection at lines 1119–1240 of that README is for admissible, topologically finitely presented models only) |
| CompletedCohomologyAndLocalGlobalCompatibility §§5.1, 5.2, 5.2a, 5.3 (open, `7a5b2ea`) | README lines 1742, 1797, 1831, 1856 | §5.2a constructs the framed trianguline variety X_tri(r̄) and defines benign points (distinct Frobenius eigenvalues, noncritical refinements, ratio ≠p^{±f}) on the patched crystalline quotient; the two local gaps extend this to the local framed space; no second benign definition is introduced here |
| ModularityAndLanglandsExtensions §2.1 (open, `2d70821`) | README line 824 | potential diagonalizability and criteria; the two lift contracts are declared gaps at this section |
| PadicHodgeTheory §3.6 (open, `4c4f1e8`) | README lines 748–770 | crystalline-character criterion on all units and “any integral character admits a crystalline character matching both its residual character and its values on the finite torsion subgroup of G_K^ab” (BIP Lemma 6.5 form); this is what §5.2’s choice of ψ with ψ∘Art_F=χ on μ_{p∞}(F) uses, compatibility being automatic since μ_{p∞}(F) is a p-group |
| LocalGaloisDeformationRings §§F.0.1, 1.1, 1.19, 3.1, 3.4, 3.9 (open, `11b2c65`) | README lines 98, 1294, 1604, 2359, 2416, 2526 | §1.1 representability; §1.19 the character ring `𝒪[μ_{p∞}(K)][[X₁,…]]`; §3.4 the fixed-type potentially crystalline quotient with its finite-E-algebra point criterion, used for (Spf R□,k_cr)^rig in §6.1; §2.15 (line 2004) concerns ℓ≠p Ihara avoidance and is not the BIP component theorem, so gap:framed-ring-components asks for something absent |
| DeformationAndDerivedPatchingAlgebra §§1.12, 4.4, 4.6, 4.7 (open, `a3b5dea`) | README lines 277, 933, 980, 995 | §4.4: generic fibre of a complete local Noetherian O-algebra is Jacobson with finite residue extensions; §4.6: component pairs under geometric integrality and dimension dim A+dim B−1 |
| PadicLocalLanglandsForGL2Qp §§0.1, 3.6a (open, `9971d01`) | README lines 208, 1139 | §0.1 analytic vectors; §3.6a two-dimensional ℚ_p benign crystalline density including the two dyadic components |
| SmoothRepresentationsOfLocalGroups §§SR.2.1, SR.3.1, SR.3.2, SR.5.2 (open) | README lines 1834, 2488, 2604, 3733 | present |
| CompletedCohomologyPartII §§F.1, F.2, F.4, 3.2 (open) | README lines 179, 196, 236, 836 | present |
| EndoscopicTransferAndUnitaryTraceComparison §§10.21, 10.26, 10.30 (open) | README lines 3874, 3986, 4069 | present |
| ClassFieldTheory §2.6, Layers 7, 9 (main) | README lines 460, 1312, 1505 | present |
| ReductiveGroups Layer 6, §10B (main) | README lines 466, 1759 | present |
| PadicMeasuresIwasawaAlgebras Layer 1, §1.7 (main) | README lines 567, 909 | present |

Dependency check, run from the board checkout with the candidate README, exit code 0:

```text
candidate: CompletedCohomologyAndLocalGlobalCompatibilityPartII is not in the merge order yet; checked as if placed after ModularityAndLanglandsExtensions (the intake inserts it when its design is accepted)
depcheck: 56 roadmaps, 641 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier named is on main or earlier in the merge order (AdicSpacesPartIII line 8, SmoothRepresentationsOfLocalGroups 21, PadicLocalLanglandsForGL2Qp 27, ArithmeticGaloisRepresentations 37, DeformationAndDerivedPatchingAlgebra 55, LocalGaloisDeformationRings 67, PadicHodgeTheory 95, EndoscopicTransferAndUnitaryTraceComparison 110, CompletedCohomologyPartII 131, CompletedCohomologyAndLocalGlobalCompatibility 142, ModularityAndLanglandsExtensions 145).

### Gap audit

Thirteen gaps, each with a named supplier (none `none`), a section, a one-sentence `needs` with its hypotheses, and the same slug in `plan.json` and the README. Minimality: the four gaps added in round 3 were searched by object across main and the 367 open heads (`roadmaps grep` for Berthelot generic fibres, crystalline density, trianguline variety, benign points, crystalline lifts with prescribed determinant): no roadmap states BIPD Proposition 2.7, the component-union closure for arbitrary F and d, NAK Lemma 4.2 on the local framed space, or de Jong 7.1.9/Conrad 2.3.1 for Spf of a complete local ring (the only density statement found is PadicLocalLanglandsForGL2Qp §3.6a, two-dimensional over ℚ_p, cited here as the special case). The nine gaps kept from round 2 were re-checked for the same slugs and sentences; their minimality was settled in round 2 with the supplier passages opened and is not reopened. Precision note: R01 concerns a locator in one gap’s `detail`, not its `needs`.

### Ownership and duplication

Objects searched by name and by shape: completed group algebras and compact actions (native), annihilators, kernels and spectrum closure (native), M∞ and type tests (parent), capture (parent gap), benign points and X_tri (parent §5.2a), Berthelot generic fibre (AdicSpacesPartIII §R2.9), crystalline density (PadicLocalLanglandsForGL2Qp §3.6a for d=2, F=ℚ_p only), simple strata and characters (SmoothRepresentationsOfLocalGroups §SR.5.2), continuous induction (ArithmeticGaloisRepresentations §1.3). The board-package index was read; the fifteen packages under review (none of them a local-deformation or patching roadmap except OrdinaryAutomorphicFormsAndModularityLiftingPartII and PadicLocalLanglandsForGL2QpPartII, whose scopes are global ordinary patching and the GL₂(ℚ_p) correspondence) do not state these endpoints. This roadmap is the owner of local component detection, local faithfulness and the seven density endpoints for arbitrary F and d. No Lean declaration is proposed, so no fully qualified name can collide.

### Shape, headlines, padding and elaboration

Shape matches main’s roadmaps: lower-case title, Summary, Scope and ownership, Conventions, Exact supplier contracts per supplier, How to read the build, six layers with `### k.n` prose targets, API bullets, at least three Checks per definition or construction (§1.1: 5, §3.2: 8, §6.2: 4, §6.4: 5), Examples and Dependencies per layer, Downstream consumers, Worked examples, References. Mathematics in Unicode; no LaTeX delimiters, target tables or field lists.

Headlines listed from the README (line 572): local faithfulness (§4.2); crystalline density at every prime (§5.2); principal-series and supercuspidal fixed-weight density (§§5.3, 5.4); benign density (§6.1); prescribed-type density (§6.3); minimal-stratum density (§6.5). None is statable at the pins (carriers above), so the specified `Suggested.lean` states nothing and names all seven in its module docstring; no stand-in is prescribed. Padding: no declarations exist, so the one-tactic probe has an empty target set; the kernel-scalar and closure consequences remain README prose.

Elaboration: not available (this lane does not elaborate; say so in the report). No Lean command was run; no design file was changed; the checkout is clean.

## Not verifiable

- Lean elaboration, `#check @name` binder comparison and one-tactic probes: no `Suggested.lean` exists at the design stage and this lane does not elaborate.
- The thirteen declared supplier gaps are future supply; their statements and sources were checked, their proofs are the suppliers’ work.
- Ownership against open pull requests other than the indexed 367 heads and the fifteen board packages was not checked; no claim of absence beyond those is made.
- ST and HP were not re-opened this round; their locators are unchanged since round 2, which read them.

## Source issues

- none

The seven items registered in round 2 (BIP Lemma 6.5 proof, BIP Theorem 6.8 proof, EP Lemmas 2.6 and 2.9 and Corollary 3.2, EP equation (21), EP Proposition 3.25, DPS Corollaries 7.7–7.8) were re-read at their lines and stand as recorded; the passages added in round 3 (BIPD §§2–5, IYE §5.2, NAK Lemma 4.2, DEJ 7.0.1 and 7.1.9, CON 2.3.1, EG 6.3.2) contained no new mistake.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "6800b8d", "job": "REV-DESIGN-CompletedCohomologyAndLocalGlobalCompatibilityPartII~3", "model": "fable", "worker": "fable-rev170"} -->
