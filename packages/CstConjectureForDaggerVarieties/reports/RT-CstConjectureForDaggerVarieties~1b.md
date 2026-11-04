<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/1517#issuecomment-6417591059 -->
Red team round 1 pass b (claude) of 899c252

Verdict: needs changes

1. **F01** (P2) Compound supplier contract `analytic-syntomic-descent` (and two smaller ones)

   **Location.** `packages/CstConjectureForDaggerVarieties/README.md:110` ("What CohomologyComparisons must provide (gap:analytic-syntomic-descent): Provide the model-free smooth dagger HK, B_dR⁺ and syntomic complexes with their cup products …"); the same `needs` in `design/plan.json`.

   **Claim.** One `needs` sentence bundles eight deliverables with different sources and different consumers: (1) the three dagger complexes with cup products, (2) their strict derived completed comparisons, (3) the slope bound [0, min(i, dim X)], (4) natural VS and TVS realizations, (5) the stable-range syntomic/pro-étale period map, (6) the filtered fiber triangle, (7) the Stein/affinoid syntomic diagram over C with its strict maps and topologies, (8) countable exhaustion descent with the derived-system comparison to rigid completions after cofinal strict shrinkings. Fourteen sections consume it (§§1.1–1.5, 2.2, 2.4, 2.6, 3.2, 3.6, 3.7, 4.1, 4.5, 5.2), each a different subset. The brief's test for a declared gap is "precise and minimal"; a compound `needs` is P2.

   **Witness.** The eight items are stated at four unrelated places of the source: CN25 line 1954 (Proposition 6.1, the complexes and the period map), line 2098 (Theorem 6.14, the Stein/affinoid diagram, proved from the earlier paper's Corollary 6.9 and Proposition 5.13), line 2405 (slope bound, inside the proof of Lemma 7.13), line 2601 (Remark 8.9(i): R¹lim X_n = 0 and R¹lim F̄_n = 0 from the earlier paper's Propositions 5.8 and 5.12) and line 2664 (Proposition 8.12's completion step). `qbc-pairs` (README:92) likewise bundles the qBC category with "vanishing of countable derived inverse limits of BC systems" (CN25 Remark 3.15, consumed only by §§4.1, 4.3); `geometric-log-periods` (README:114) bundles algebraic comparison over C, analytic HK GAGA and the proper logarithmic period sequence (three theorems, CN25 lines 2491, 2493, 2523).

   **Repair.** Replace the single contract by four, in the README under CohomologyComparisons and as four `gaps` entries with the same slugs in `design/plan.json` (supplier `CohomologyComparisons`, section `§4.9a Analytic Hyodo–Kato realization and §§4.10–4.11`), and repoint each `*Needs:*` line to the slug it uses:

   - `What CohomologyComparisons must provide (gap:dagger-analytic-complexes): Provide, for a smooth dagger X over C, the model-free overconvergent Hyodo–Kato, B_dR⁺-de Rham and syntomic complexes with their cup products, the strict derived completed comparisons RΓ_HK⊗̂C≃RΓ_dR(X) and RΓ_HK⊗̂B_dR⁺≃RΓ_dR(X/B_dR⁺), the identity τ_≤i F^(r+1)RΓ_dR(X/B_dR⁺)=tF^rRΓ_dR(X/B_dR⁺) for i≤r, the filtered fiber triangle defining the syntomic complex, and the Frobenius slope bound [0,min(i,dim X)] on Hⁱ_HK(X) (CN25 Proposition 6.1, line 1954; Remark 6.23(ii), line 2231; Lemma 7.13 proof, line 2405).` Consumers: §§1.1, 1.2, 1.4, 2.6, 3.2, 3.6, 3.7, 5.2.
   - `What CohomologyComparisons must provide (gap:stable-range-period-map): Provide the syntomic-to-pro-étale period map α_r, an isomorphism in degrees ≤r, with the natural VS and TVS realizations of the four corners of the fundamental square and the left-heart compatibility of the comparison sequence (CN25 §6.2 and Proposition 6.1, line 1954; Definition 4.1, line 960; footnote 22, line 2647).` Consumers: §§1.3, 2.2, 2.4.
   - `What CohomologyComparisons must provide (gap:stein-affinoid-syntomic-diagram): Provide the Stein and affinoid syntomic diagram over C of CN25 Theorem 6.14 (line 2098) with strict vertical maps of closed image and the Fréchet, respectively LB, topology on degree-r pro-étale cohomology.` Consumers: §§1.5, 4.5.
   - `What CohomologyComparisons must provide (gap:analytic-exhaustion-descent): Provide, for a countable increasing admissible exhaustion of a smooth dagger X over C by quasi-compact dagger opens, the derived-limit descent of the Hyodo–Kato, filtered de Rham and pro-étale complexes, the vanishing R¹lim X_n^(r,i)=0 and R¹lim F̄_n^(r,i)=0, and the comparison of the derived systems with those of the rigid completions after cofinal strict shrinkings (CN25 Remark 8.9(i), line 2601; Proposition 8.12 proof, line 2664).` Consumers: §§4.1, 4.5.

   Same repair for the two smaller ones: split `gap:bc-countable-inverse-limits` (supplier VectorBundlesAndIsocrystals VB3; `needs`: "Provide R¹lim=0 for every countable inverse system of finite BC objects with BC transition maps (CN25 Remark 3.15).") out of `qbc-pairs`, cited by §§4.1 and 4.3; and split `geometric-log-periods` into `gap:algebraic-comparison-over-c` (§3.3), `gap:analytic-hk-gaga` (§3.3) and `gap:proper-log-period-sequence` (§§3.4–3.5), each with the one sentence of README:114 that belongs to it. Tested on §3.3: its `*Needs:*` then reads "CohomologyComparisons §4.8 and the algebraic-comparison-over-c and analytic-hk-gaga contracts", and nothing in §3.3 uses the logarithmic sequence.

2. **F02** (P3) §3.7's proof route cites Grosse-Klönne 3.7 for a complement it does not cover, and cites the finiteness gap for a smallness that follows from the tube quasi-isomorphism

   **Location.** `README.md:769` ("Use the local normal-coordinate description along the smooth complete intersection and the unfiltered tube invariance of de Rham cohomology in Grosse-Klönne Proposition 3.7"); `README.md:760` (complements "{x : |f_j(x)|>ε for some j}"); `README.md:776` ("dagger-de-rham-finiteness-over-c, smallness of the tube complement").

   **Claim.** The README's tube is the closed locus |f_j|≤ε (README:751, following BKV22 line 1177), so its complement is {∃j: |f_j|>ε}. GK04 Proposition 3.7 keeps U=∪_i Sp(A⟨(ε⁻¹f_i)⁻¹⟩)={∃i: |f_i|≥ε} and removes the open polydisc tube X−U≅D⁰(ε)^m×Z; it says nothing about {∃j: |f_j|>ε}. The passage between the two (the complement of the closed tube is the increasing union over ε′∈|K×|, ε<ε′<ε₀, of the quasi-compact {∃j: |f_j|≥ε′}, each quasi-isomorphic to X∖Z, and finite-dimensional cohomology makes the derived limit of that union a quasi-isomorphism too) is written nowhere. The target itself is safe because the contract `geometric-finiteness-tubes` asks for the closed-tube statement; the proof route is the defect. Second, the complement of the closed tube is not quasi-compact, so "smallness of the tube complement" is not one of the three classes of `dagger-de-rham-finiteness-over-c` unless it is shown to be a naive interior; it follows instead from the tube quasi-isomorphism and smallness of X∖Z (§3.4).

   **Witness.** GK04 lines 499–508: `U_i = Sp(A<(ǫ⁻¹.f_i)⁻¹>)`, `X−U ≅ (D⁰(ǫ))^m×Z`, conclusion `RΓ_dR(X−Z)→RΓ_dR(U)`. BKV22 lines 1182 and 1187: tube by `|f_U(x)| ≤ ε`. CN25 lines 2566–2567 invoke GK 3.7 with "B(ε) denotes the open disc", the same slip (Source issues).

   **Repair.** In the §3.7 proof route replace the first sentence by: "Grosse-Klönne Proposition 3.7 gives the quasi-isomorphism RΓ_dR(X∖Z)→RΓ_dR(U_ε′) for U_ε′={x : |f_j(x)|≥ε′ for some j} and every ε′∈|K×| below ε₀, using the local normal-coordinate description along the smooth complete intersection. The complement of the closed tube Z(ε) is the increasing union of the quasi-compact U_ε′ over ε<ε′<ε₀, ε′∈|K×|; its de Rham complex is the derived limit of theirs, and since every H^i(U_ε′)≅H^i_dR(X∖Z) is finite dimensional the limit is again a quasi-isomorphism." In the `*Needs:*` line replace "dagger-de-rham-finiteness-over-c, smallness of the tube complement" by "§3.4, smallness of X∖Z, transported to the tube complement by the quasi-isomorphism and the Hyodo–Kato comparison". Tested on P¹ with Z=∞, f=T on the chart, ε=|π|: U_ε′={|T|≥ε′} are closed dagger annuli, each with de Rham cohomology (K,0) like A¹, and their union {|T|>|π|} has (K,0).

3. **F03** (P3) A locator cited for the difference-map convention displays a sum

   **Location.** `README.md:393` ("square (6.16) and sequence (6.17), p.43 (difference-map convention), CN25 line 2185").

   **Claim.** The source's sequence (6.17) prints its second map as `ι_HK⊗ι + can` (a sum), whose composite with `α_st(r)⊕α_dR(r)` is 2·c∘a≠0; the roadmap's difference map `v=(c,−d)` is the correct reading (Checks at README:37 and README:408 compute v(1,1)=0 against the sum's 2), and the plan's register already records the source slip (E9). As written the parenthetical attributes the convention to a locator that shows the opposite sign.

   **Witness.** CN25 line 2127: `(H^r_HK(X)⊗B⁺_st)^(N=0,φ=p^r)⊕F^rH^r_dR(X/B⁺_dR) —ι_HK⊗ι+can→ H^r_dR(X/B⁺_dR)`.

   **Repair.** Replace "(difference-map convention)" by "(whose plus sign is replaced here by the difference map, so that v∘u=0)".

4. **F04** (P3) Two slips the accepting review listed and the head still carries

   **Location.** `README.md:50` ("`WittVector.Isocrystal` … `Mathlib/RingTheory/WittVector/Isocrystal.lean:112`"); `README.md:187` ("### 0.3 weak admissibility and acyclicity over c").

   **Claim.** At the pin, line 112 of the Isocrystal file is the docstring's closing `-/`; the class is declared at line 113. The heading's "c" is the field C that the section's body names throughout ("over C").

   **Witness.** Pinned `Mathlib/RingTheory/WittVector/Isocrystal.lean` lines 112–113: `-/` then `class Isocrystal (V : Type*) [AddCommGroup V] extends Module K(p, k) V where`; `isocrystal_classification` is at line 180 as cited. The other Mathlib locators are correct at the pin: `BDeRhamPlus` :75, `BDeRham` :88, `Module.Free` :43, `Module.Finite` :121, `BicartesianSq` :56.

   **Repair.** Line 50: `:112` → `:113`. Line 187: "over c" → "over C".

5. **F05** (P3) "naive interior" is used but defined only by a pointer into an unrecorded source

   **Location.** `README.md:66` ("naive interiors of smooth quasi-compact dagger spaces (in the sense of CN25 line 2291, footnote at line 2302)"); `README.md:363` ("naive interiors of quasi-compact spaces").

   **Claim.** The term is neither standard nor defined in the roadmap; CN25's footnote 20 (line 2302) defers to the proof of Corollary 3.6 of Colmez–Nizioł's part I, which `sources.toml` does not record. A supplier reading the contract `dagger-de-rham-finiteness-over-c` cannot tell which spaces its second class contains.

   **Witness.** Colmez–Nizioł, *On the cohomology of p-adic analytic spaces, I* (arXiv:2104.13448v3, open repository; fetched through the sources service as `CN1`), line 1163: a naive interior of a smooth dagger affinoid is a Stein subvariety whose complement is open and quasi-compact; footnote 27 (line 1176) gives the rigid analogue.

   **Repair.** In §1.2, after "Quasi-compact smooth dagger spaces, naive interiors of quasi-compact spaces, and algebraic analytifications are the source examples", add: "A naive interior of a smooth dagger affinoid is a Stein open subvariety whose complement is open and quasi-compact; a naive interior of a quasi-compact smooth dagger space is the union of naive interiors of the members of a finite admissible affinoid covering (CN1 Corollary 3.6 proof, line 1163)." Add `CN1` to `sources.toml` (authors Pierre Colmez and Wiesława Nizioł; title as above; year 2025; venue J. Algebraic Geometry 34 (2025), 1–108; `arxiv = "2104.13448v3"`; locator "Corollary 3.6 and its proof, p.21 of arXiv v3"; `cited_for = ["Layer 1, small varieties"]`), and in the gap sentence replace "(in the sense of CN25 line 2291, footnote at line 2302)" by "(defined in §1.2)". Tested on the closed dagger disc: its naive interior is the open disc, Stein, with complement the closed annulus {|T|=1}, open and quasi-compact.

6. **F06** (P3) Process narrative in the module docstring

   **Location.** `Suggested.lean:52–53` ("No weaker algebraic substitute, arbitrary assertion parameter or admitted data object represents a missing headline theorem.").

   **Claim.** The sentence describes the file's conformance to the submission rules rather than the mathematics or the statability boundary; the brief forbids process narrative in docstrings.

   **Witness.** The sentence names no theorem, carrier or hypothesis; every other paragraph of the docstring does.

   **Repair.** Delete lines 52–53 (and the blank line 51). Nothing else in the file changes; the file still has the single `import Mathlib`, the namespace and no declaration.

Pass a: no pass-a report exists on the pull request. The only `github-actions` comment is the pass-a brief itself (job RT-CstConjectureForDaggerVarieties~1a); no reviewer has answered it. There is therefore nothing to confirm or dispute from pass a; the findings below are independent. The last review (accepted, of 899c252) left two P3 items unrepaired; they are re-found as R04.

Checkout: the board checkout was at 899c252 before reading (`gh pr view` head 899c25246436514e95f3b9129b96f93cdb0e5294); no fetch or checkout was needed. Pins: Mathlib `6b7abb3c…`, Tau Ceti `a91d3aaf…` (content `lake-manifest.json`); the pinned files were read at those commits.

## Verified sound

**Scope and policy.** `git diff --stat origin/main...HEAD` touches only `packages/CstConjectureForDaggerVarieties/` (README.md, Suggested.lean, design/plan.json, metadata.toml, sources.toml, three reports). No `set_option`, no Lean `lemma`, no pull-request number, no process word in the README (the two "lemma" hits are prose: "resolution lemma", "snake lemma"), no LaTeX delimiters, no machine path. Every target carries a locator. `Suggested.lean`: one module docstring in the required form, `namespace TauCetiRoadmap.CstConjectureForDaggerVarieties`, no declaration, single `import Mathlib`. The 16 gap slugs in the README match the 16 `gaps` entries of `design/plan.json` (same slugs, suppliers and sections). The resolver reports no unresolved cross-roadmap citation and no unresolved Lean name.

**Dependency gate** (run from the checkout with `--movable`):

```
moved: CstConjectureForDaggerVarieties moved in the merge order from #8 to #204, right after its last supplier CohomologyComparisons (AdicSpacesPartIV, ClassicalAdicEtaleCohomology, LocallyAnalyticDistributions, PadicHodgeTheory, VectorBundlesAndIsocrystals also came after it); checked as moved (the worker moves it there when it submits)
depcheck: 56 roadmaps, 644 edges, 0 problem(s)
```

No UPWARD or CYCLE line. Every supplier cited is either on main (AdicSpacesPartII, AdicSpacesPartIV) or an open roadmap pull request that adds a new folder (PadicHodgeTheory, VectorBundlesAndIsocrystals, LocallyAnalyticDistributions, CohomologyComparisons, ClassicalAdicEtaleCohomology, read at their heads through the roadmaps tool); none is in the "never cite" list (empty).

**Elaboration.** `Suggested.lean` declares nothing, so there is no `#check @name` to elaborate; the docstring's 33 "not statable" items were checked against the pins instead: Mathlib's `RingTheory/Perfectoid` holds only `BDeRham.lean`, `FontaineTheta.lean`, `Untilt.lean` (no B_cris, B_st, Frobenius, N or t on period rings); `WittVector.Isocrystal` has Frobenius only; the Tau Ceti tree at the pin has no étale or pro-étale cohomology of adic spaces, no Hyodo–Kato, syntomic or Banach–Colmez module, and `FarguesFontaine/` holds only `Y.lean`, `Quotient.lean`, `Window.lean` (topological, no coherent sheaves). Each of the 33 headlines names at least one of those missing carriers, so none is statable and no stand-in is used; the two statements consumed rather than restated (CohomologyComparisons §§4.10–4.11) exist at that roadmap's head under those numbers.

**Sibling citations checked (all resolve at the cited head or on main).** AdicSpacesPartII R0.5, R0.10–R0.17, R1 (main). AdicSpacesPartIV F1.7–F1.12, F1.16 (main); F1.9's strict-differential theorem and F1.11's finiteness and Künneth theorems are stated for discretely valued K (F1.11 quasi-compact for Künneth), as the README says, so the three AdicSpacesPartIV gaps ask for exactly the C-valued extensions. PadicHodgeTheory §§0.2–0.5 (N=−d/du, Nφ=pφN), §2.7 with `properRigidLogResolution` for reduced proper rigid X/C and dense smooth Zariski open U, standing C over a finite extension of Q_p (so the field extension is the gap), §3.4 (filtered degree t_N−t_H, destabilizing slope (t_H−t_N)/rank), §3.7, §5.2 (modification degree t_N−t_H, curve degree opposite). VectorBundlesAndIsocrystals VB0 "Coefficient category and rational blocks", "Dieudonné–Manin classification of finite isocrystals"; VB1 "Bundles, annuli and derived cohomology", "The exact tensor isocrystal-to-bundle functor", "Slope-sensitive cohomology of standard bundles", "Untilts and completed local rings", "Harder–Narasimhan filtration of geometric bundles"; VB2 classification "Geometric classification of vector bundles", "Hom and extension calculus for geometric bundles"; VB3 "Sympathetic algebras and the classical category", "Curvature, the tilted coherent heart and HN invariants", "Period modules and curvature calculus", "Curvature-zero finite-length modules", "VS Hom vanishing from torsion period modules", "Le Bras equivalence", "Euler–Poincaré height formula" (ht(H⁰)−ht(H¹)=rk, torsion has height 0), "The fundamental untilt sequence and degree-one divisors". LocallyAnalyticDistributions §0.0 (compact-type regularity and strong duality restricted to finite K/Q_p, as the README says), §0.2 (strict countable inverse limits for Fréchet complexes with finite-dimensional Mittag–Leffler cohomology, as README:100 describes). CohomologyComparisons §4.8 (K complete discretely valued, countable perfect residue field), §4.9 (dual Hom descriptions), §4.9a (`RigidHyodoKatoCohomology` for rigid X/C; the dagger extension is the gap), §4.10, §4.11. ClassicalAdicEtaleCohomology §1.3, §1.4, §8.4 (base change for n invertible in O_Y⁺), §9.7 (traces for n invertible in K): the Z_p contract is genuinely absent there. Ownership: the roadmaps grep finds no other roadmap stating qBC, "de Rham slopes", the dagger C_st-conjecture or the (M,L) pairs; AdmissiblePairsAndPadicHodgeStructures (open) is Tannakian (b,μ)-pair theory over diamonds and CohomologyComparisonsPartII (open) is classical log-syntomic cohomology on models; neither overlaps.

**Counts.** Declarations read: 0 in `Suggested.lean` (33 docstring items checked). Targets read: 44 sections, all four Examples and Worked examples blocks, the Conventions. Locators verified against the cached texts: 66 CN25 lines, GK04 Proposition 3.7 (line 499, p.14) and Corollary 3.8 (line 556, p.16), BKV22 lines 1176–1187; the 61-page manuscript pagination matches the cached page markers. Checks tested with computed values: 38. Sibling citations checked: 7 roadmaps, 46 sections or named subsections; 6 Mathlib and 4 Tau Ceti declarations at the pins.

**Adversarial table** (values computed on each side; R=B_dR⁺, U₁=(B_cris⁺)^(φ=p), D the closed dagger disc).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Conventions: Nφ=pφN, diagonal N, N(u)=−1 | φ=diag(1,p), Ne₁=e₀; p=2 | Nφe₁=pe₀=pφNe₁; N(e₁+ue₀)=e₀−e₀=0; N(e₁−ue₀)=2e₀≠0 in char 0 | pins the sign | none |
| u versus u_π | K=Q₂(√2), π=√2; Q₃ | [p♭]=[π♭]² so u=2u_π, N(u_π)=−1/2; Q₃: u_π=u | p-normalized | none |
| Degree t_H−t_N | trivial line, lattices t⁻¹R, R, tR; φ=p with R | O(1), O, O(−1) (degrees 1,0,−1); φ=p, R: 0−1=−1, bundle O(−1) | matches CN25 Remark 5.14 and the register's E1 | none |
| Source deg sign (plan E1) | jump-1 trivial line | printed deg=t_N−t_H gives −1, "not acyclic", but Lemma 5.3's proof needs shrinking Fil to lower deg and Remark 5.14(i) needs this line acyclic | E1 is a correct erratum | none |
| 0.3 predicates | O, O(1), O(−1), 0; O(1)⊗O(2) | acyclic T,T,F,T; w.a. T,F,F,T; O(3) acyclic | both directions | none |
| 0.4 bounded refinement | r=1, φ=p, L=R; L=t⁻¹R; trivial φ, L=t⁻¹R | bounds force L′=L, deg −1, H¹≠0: not acyclic, no L′; deg 1−1=0 w.a., L′=L; O(1), L′=R admissible | acyclicity needed | none |
| 0.4 Negative control (:230) | as above | H¹(O(−1))=C/Q_p≠0 | correct | none |
| 0.5 sequence | trivial M, L=R, r=0; r=1 | Q_p=Q_p, quotient 0; 0→Q_p t→U₁→C→0 | exact | none |
| 0.5 X^r_st as H⁰ | M slope s∈[0,r] | E(M{−r},M⊗R) has slopes r−s≥0, H¹=0, ht H⁰=rk M | matches CN25 line 1874 | none |
| 0.5 horizontal vector | e₁+ue₀ | φ=p(e₁+ue₀), N=0 ∈ X¹_st; e₁−ue₀ has N=2e₀ | correct | none |
| 0.6 generation | M=0; slope 0, r=0; slope 1, r=0 | 0; Q_p generates R; (B_cris⁺)^(φ=p⁻¹)=0 fails | slope bound needed | none |
| 0.7–0.8 Hom | trivial M, r=1, L=R, t⁻¹R | V=Q_p t or U₁; Hom(C,B_dR)=Ext¹=0; Hom_VS(V,B_dR)=B_dR rank 1 | matches | none |
| 0.9 truncated map | trivial M, L=R, r=1, k=2 | R/t²→Hom(Q_p t,R/t²)=R/t² is ·t: kernel tR/t², cokernel R/t, both killed by t; r=0 iso | kernel bound tʳ is what CN25 lines 1939–1942 prove | none |
| Source Prop 5.20 (plan E3) | statement line 1898 | B_st eigenspace has no map to M⊗R/tʳL; proof line 1903 uses B_st⁺ | E3 correct | none |
| 1.1 F vs Fil | point r=0,1; D at i=r=1; i<0 | point (tʳR,R,tʳR,0); D: F¹¹=Ω¹(D)⊗̂(R/t)≅O(D)/C, B¹=0, Fil=0, A=O/C; negatives 0 | distinct | none |
| 1.3 difference map | point i=r=0 | u(1)=(1,1), v(1,1)=1−1=0; sum gives 2 | source (6.17) prints a sum | R03 |
| 1.4 twist | point i=0, r→1 | H: Q_p→Q_p t; F: R→tR; X¹⁰/tX⁰⁰=U₁/Q_p t=C=B/tB | matches Remark 6.23(ii) | none |
| 1.5 kernel at r=0 and on D | point; D r=1; annulus r=1 | Ω⁻¹=0, ker(Q_p→C)=0=(B_cris⁺)^(φ=p⁻¹); D: ker(O/C→Ω¹)=0=(0⊗…); annulus: (B_cris⁺)^(φ=p⁻¹)=0, dlog T survives | Ker β̃ is the middle vertical map's kernel | none |
| 1.6 | proper point; D i=r=1 | 0→Q_p→Q_p⊕R→R→0, horizontals injective; D: both horizontals O/C→0 onto, common kernel O/C | matches Corollaries 6.15, 6.19 | none |
| 2.1 twist cancel | point i=0, r=1 | φ↦p⁻¹φ and lattice tR: t·B_e glued to tR is O; lattice only: O(−1) | correct | none |
| 2.1 identification range | X with dim X≤r, i>r | Fʳ=⊕t^(r−j)Ωʲ with r−j≥0 for all j≤dim X, so Fʳ=tʳF⁰ as complexes | the quasi-compact clause is safe (and holds without quasi-compactness) | none |
| 2.3 pieces | P¹ (0,1), (1,1); D (1,1); point | (0,0,Q_p t) ht 1; (0,0,0) since H¹(F¹RΓ(P¹))=0; (0,O/C,0); (0,0,Q_p) | matches Corollary 7.9 | none |
| 2.5 height | O; O(−1); formal E_r=O(−1) | 1−0=1; 0−(−1)=1, ht H¹=−1<0; deficit 1 | sign strict for H¹≠0; torsion at x≠∞ has 0 | none |
| 2.6/2.7 | point r=0; D r=1; formal h¹₂=C/Q_p | all defects 0; D: h¹₀(1)=H¹(O)=0, ht(O/C)=0=dim H¹_dR; formal passes degree 0, fails degree 2 | all-degree quantifiers necessary | none |
| 2.8 point | dim 0, r=0; r=1 | [B_cris⁺→B_cris⁺] with 1−φ onto: (Q_p,0); (U₁,0) | matches Lemma 7.13 | none |
| 2.8 Tate algebra | ω=ΣpⁿT^(pⁿ−1)dT | coefficients →0, primitive ΣT^(pⁿ)∉K⟨T⟩, partial sums exact | H¹ non-Hausdorff; overconvergent HK¹(D)=0 | none |
| 3.6 unfiltered only | weak formal P¹, Z=∞ | A¹→D†: H⁰=K=K, H¹=0=0; gr⁰: (1−πT)⁻¹∈O(D†) has a pole at π⁻¹ | source's "filtered" (E16) refuted | none |
| 3.6 degenerate boundaries | m=s | empty intersection = whole model, complement ∅; empty union: complement whole generic fibre | conventions distinct | none |
| 3.7 tube and complement | c=0; c=1, f=T, ε=\|π\|; λ=π; ε=\|π\|² | ∅/whole chart; {\|T\|>\|π\|}, 1 outside, π inside; radius 1; π² inside, π outside | README consistent; GK04 3.7 keeps {∃i:\|f_i\|≥ε} | R02 |
| 4.1 Roos degree | constant Q_p[0]; V[−1] | δ onto with section a₀=0, a_n=−Σ_(k<n)b_k, ker diagonal: (H⁰,H¹)=(Q_p,0); V: H¹=V | fibre, not cone | none |
| 4.2 towers | constant O(D)/C; ⊕_(j≥n)Q_p | lim=O/C, R¹lim=0 via the continuous section; lim=0, R¹lim=∏Q_p/⊕Q_p∋[(1,1,…)] | obstructions real in general | none |
| 4.4 Künneth | P¹×open disc; two open discs | degrees 0–3: Q_p, H¹(S), Q_p(−1), H¹(S)(−1); d(TS) not a sum of pulled-back forms | proper factor needed | none |
| 4.4 perfectness (plan E11) | source line 2693 | needed: RΓ_ét(Y,Z_p) perfect; README states that | E11 correct | none |
| 5.1 | D i=1; i=0; finite L/K | [T]≠0 in O(D)/K; Hom_(G_L)(C,B_dR)=0 on simple tensors, density | continuity needed | none |
| 5.3 | X=point over K; proper curve genus g | Hom values Fⁿʳ, K; ranks 1,2g,1 | matches Theorem 9.3 | none |
| 5.4 | constant Q_p^d, d=0,1,2; D degree 1 | B_st^d, B_dR^d; A=O/C has Hom 0 (dense finite-length presentation), H/A=0 | matches Theorem 9.8 proof line 2834 | none |
| 5.5 sandwich | i=1 | t⁻¹∈B_cris∖B_cris⁺, φⁿ(t⁻¹)=p⁻ⁿt⁻¹∉R | equality is the declared gap (E15) | none |
| Source Lemma 5.4 (plan E2) | line 1675 | "i≠0" must be "i≠i₀"; i₀≥1 since Fil¹≠0, so Fil⁰₁=M_K and Fil^(r+1)₁=0 | E2 correct | none |
| Gaps: declared where read | 16 slugs | README and plan.json agree slug by slug | none unowned | R01 (compound) |

**Checks tested and found correct (38):** Conventions 7 bullets; §0.1 three; §0.2 three; §0.3 three; §0.4 four; §0.5 four; §0.6 one; §0.9 one; §1.1 three; §1.2 three; §1.3 three; §1.5 one; §1.6 one; §2.1 three; §2.3 four; §2.8 three; §3.6 two; §3.7 four; §4.1 four; §4.2 four; Examples blocks and Worked examples (all values recomputed as in the table).

## Not verifiable

- CN25's footnote 20 pointer for "naive interior" was resolved by fetching part I (R05); CN25's other references to part I (Propositions 5.8, 5.12, 5.13, Corollary 6.9, §7.3, Theorem 4.27) were not opened: they are the content of the declared contracts, not of this roadmap's statements.
- The surjectivity of 1−φ and of 1−φ/p on B_cris⁺ used in the §2.8 Check (README:617) is a standard period-ring fact not in the three recorded sources; it is consistent with H¹(X_FF,O)=0 and was not checked against a text.
- VectorBundlesAndIsocrystals' subsection "VS Hom vanishing from torsion period modules" states the B_dR-valued vanishing with the bounded-image step as part of its own proof plan ("this requires a bounded-image lemma for arbitrary natural maps"); whether that supplier's proof plan is complete is that roadmap's matter. The README's citation of the statement is correct.
- Ownership against open pull requests was checked only through the roadmaps grep tool and the two sibling checkouts named above; the other sibling checkouts the brief lists were not read file by file, as none treats dagger cohomology, period modules over C or Banach–Colmez theory according to the grep.
- The journal pagination of CN25 (Duke 174) was not collated; all locators refer to the author manuscript, as `sources.toml` says.

## Source issues

- **Gap** in CN25 at Proposition 8.4 proof, printed p.52 (line 2566): the source says the tube Z(ε) is locally Z times an open disc of radius ε, so that Grosse-Klönne 3.7 applies; it should be the closed locus |f_i|≤ε it cites from BKV22 (line 1177), whose complement is the union over ε′>ε of the quasi-compact complements that Grosse-Klönne 3.7 handles, a limit step the proof omits; affects the proof.

Confirmed against the cached text and already in the plan's register (no new bullet): E1 (§5.1.2 degree sign, line 1633 versus Lemma 5.3's proof), E2 (Lemma 5.4 proof "i≠0", line 1675), E3 (Proposition 5.20 statement B_st for B_st⁺, line 1898), E4 (Proposition 5.20 proof "containing", line 1906), E9 (sequence (6.17) plus sign, line 2127), E11 (Lemma 8.13 proof perfectness, line 2693), E16 (Proposition 8.3 "filtered", lines 2544 and 2552, refuted by the (1−πT)⁻¹ example).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "899c252", "job": "RT-CstConjectureForDaggerVarieties~1b", "model": "fable", "worker": "fable-rt237"} -->
