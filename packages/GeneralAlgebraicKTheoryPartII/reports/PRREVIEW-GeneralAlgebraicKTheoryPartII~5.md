# Review of GeneralAlgebraicKTheoryPartII (pull request #1742 at 8a4b822)

**Verdict:** needs changes

There are six findings. R01 (P2) is the only blocking one: §4.30c re-plans the James–Hopf maps, the one-suspension splitting and the metastable EHP sequence. BordismFormalGroups on main and HomotopySpheres already own them, and nothing in this roadmap uses them. R02–R06 are P3: padding in `Suggested.lean`, Lean names missing from the README, a wrong docstring claim about the pins, four unrecorded sources and two mispaired locators.

The gate passes, the dependency check is clean and `Suggested.lean` elaborates.

## Status of the previous review's findings

- **R01 (ε-notions confined to small categories): repaired.**
  - README line 2026 now reads "Let T be a thick subcategory of a stable idempotent-complete ∞-category C that need not be small".
  - Only the Verdier-quotient bullet keeps smallness, at line 2038: "For small C, X∈T_ε exactly when its image in the idempotent-complete Verdier quotient…".
  - §8.2 (line 2081) now requires ⊗ to be exact in each variable. Its route (line 2093) first passes to a small C₀, as cmnn20 line 801 does.
  - I read cmnn20 lines 480–483 (standing hypotheses), line 801 and line 356 (Proposition 2.6). The two new Checks compute correctly; see the table.
- **R02 (plan sentence for `spectral-units-and-lines`): not repaired, and not raised again.**
  - The board's `design/plan.json` still carries the pre-repair sentence "Supply GL₁R as the multiplicative unit components…". It also still says "already" in `suslin-algebraically-closed-comparison`.
  - The README contract (line 198) is the corrected one.
  - The plan file is outside this pull request, and the brief freezes plan.json after the design, apart from added gaps. Nothing in this folder can repair it, so I do not raise it again.

## R01 (P2) — §4.30c re-plans the James–Hopf maps, the one-suspension splitting and the EHP sequence, which are owned elsewhere and unused here

**Location.** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/README.md`:
- Line 1245: "For k≥1 the James–Hopf map h_k:J(W)→J(W^∧k) sends w₁⋯w_n to the product, over the k-element subsets…".
- Line 1245 also owns "the metastable EHP sequence" and "ΣJ(W)≃⋁_(r≥1)ΣW^∧r".
- Line 13 claims both for this roadmap.

**Claim.** This roadmap owns these three objects, but no other section of the roadmap uses them: in this README, `h₂`, "EHP" and "one suspension" occur only inside §4.30c and at line 13.

**Witness.**
- BordismFormalGroups on main, line 704 (F6.2 item 3): "Construct the combinatorial James–Hopf maps H_j:J(Y)→J(Y^(∧j)) … using the ordered j-element subwords".
- HomotopySpheres #1287 head: §3B.6 one-suspension splitting (line 1063); Layer 3 EHP (line 855).

**Repair.**
1. Delete from §4.30c:
   - the one-suspension splitting, the James–Hopf maps, and the "Homology of h₂" and "Metastable EHP sequence" bullets;
   - their sentences in the statement, the conventions and the proof route;
   - the Checks on h₂ (J₃W and J₂S¹) and the W=S² EHP Check.
2. Retitle §4.30c "The stable James splitting" and keep its number, since ChromaticHomotopyTheory line 10 cites §4.30c by number.
3. In line 13, drop "the James–Hopf maps" and "the metastable EHP sequence".
4. Drop:
   - the G2.5 Freudenthal sentence of line 182;
   - the Serre spectral sequence and Moore-replacement clauses of the DGFloer contract (line 194) and of §4.30c's Needs;
   - AlgebraicTopology Stage 8 items 4–5 from §4.30c's Needs;
   - the hatcher locators 4I.1–4I.2 and p.474 at line 1249;
   - the `wu` reference.
5. Change §4.33's Needs (line 1344) to "§4.30c (the stable James splitting)".
6. If a later need for H_j arises, cite BordismFormalGroups F6.2 item 3 for it.

**Tested.**
- After the deletion §4.30c keeps four Checks: S⁰, *, S^c and the Moore space S²∪₂e³.
- `roadmaps grep` finds no roadmap that cites h_k, the EHP sequence or the one-suspension splitting from this one. ChromaticHomotopyTheory (#1643, line 10) uses only the stable splitting, and DGFloerPartII (#1799, lines 88, 294 and 563) uses only §4.30b.

## R02 (P3) — Suggested.lean pads the James statements with API lemmas and textbook proof inputs

**Location.** `TauCetiRoadmap/GeneralAlgebraicKTheoryPartII/Suggested.lean`:
- lines 131–183: the def `map`, `continuous_ι`, `isClosed_filtration`, `filtration_zero`, `range_ι`, `iUnion_filtration`, `mul_mem_filtration`, `continuous_map`, `map_ι`, `mapsTo_map_filtration`, `map_id` and `map_comp`;
- line 200: `cwType`;
- lines 255–295: `exists_pointed_cwApproximation`, `isIso_singularHomology_int_iff` and `exists_homotopyEquiv_of_isIso_singularHomology`.

**Claim.** These 15 theorems are not headline theorems. They are:
- functor laws and filtration API of the definitions;
- a boundary case (J₀={1});
- a corollary in one step;
- textbook inputs to the proof of the James theorem: hatcher Corollary 3A.7, Proposition 4.74 and CW approximation.

**Witness.** On a scratch copy:
- `iUnion_filtration` closes by `exact Set.iUnion_eq_univ_iff.2 fun w => ⟨_, le_refl _⟩`.
- `cwType` closes by `obtain ⟨_, _, -⟩ := exists_cwComplex hw₀; infer_instance` (Tau Ceti `CWType.of_cwComplex_univ`, CWType.lean line 72).
- `mul_mem_filtration` closes by `simp_all [filtration]; omega`.

**Repair.**
1. Delete the 15 theorems above, the def `map` (only they use it), the then-empty `section Homology`, and the imports `TauCeti.Topology.CWComplex.Classical.CWType` and `TauCeti.Topology.Homotopy.HomotopyGroup.FundamentalGroupAction`.
2. Keep:
   - `JamesReducedProduct` and the definitions it needs;
   - `existsUnique_lift`, `exists_cwComplex` and `continuousMul`;
   - the two James theorems.
3. The README keeps the deleted facts as §4.30b interface bullets. Shorten line 1231 and the docstring's first paragraph to match.

**Tested.** The trimmed copy elaborates with `lake env lean`: exit 0, five `sorry` warnings and no other message, with only the imports `WeakHomotopyEquivalence` and `PathSpace.Moore`.

## R03 (P3) — fourteen Lean names do not appear in the README

**Location.** `Suggested.lean` lines 83, 100, 104, 110 and 122 (`jamesSubmonoid`, `JamesReducedProduct.toFreeMonoid`, `.reduce`, `.mk`, `.ι`), plus nine of R02's names. README line 1231 is the only place that lists Lean names.

**Claim.** Every Lean name must appear in the README. These fourteen are absent.

**Witness.** A grep of the README for each of `jamesSubmonoid`, `toFreeMonoid`, `reduce`, `mk`, `ι`, `continuous_ι`, `filtration_zero`, `range_ι`, `iUnion_filtration`, `continuous_map`, `map_ι`, `map_id`, `map_comp` and `cwType` in backticks finds 0 occurrences each.

**Repair.**
1. After R02, five names remain unlisted. Name `jamesSubmonoid`, `JamesReducedProduct.toFreeMonoid`, `JamesReducedProduct.reduce`, `JamesReducedProduct.mk` and `JamesReducedProduct.ι` in §4.30b's definition paragraph (line 1210), where the words, the deletion of w₀, the tuple quotient and the inclusion of W are defined.
2. Add them to line 1231 as well.

**Tested.** Of the twelve declarations that remain after R02, exactly these five lack a backticked occurrence. The other seven are named at line 1231.

## R04 (P3) — the module docstring says the pins lack wedges and homotopy fibres

**Location.** `Suggested.lean`:
- line 26: "…the metastable EHP sequence: lack smash products, wedges and homotopy fibers of pointed spaces";
- line 28: "Stable James splitting: lacks suspension spectra of spaces and free E-one ring spectra".

**Claim.** Two of the three carriers named at line 26 exist at the pin. Line 28 names the wrong missing carrier.

**Witness.**
- `TauCeti.WedgeSum` (`TauCeti/Topology/WedgeSum.lean` line 78): wedges of pointed spaces.
- `TauCeti.MooreReplacement.Fiber` (`…/Moore/Replacement/Basic.lean` line 257): the homotopy fibre of any map.
- `TauCeti/AlgebraicTopology/Spectra/Free.lean`: free symmetric spectra, "without a model structure".

**Repair.**
1. After R01, delete line 26, or reduce it to "Filtration quotients: lack the smash product of pointed topological spaces".
2. Reword line 28 to say that the stable splitting lacks stable equivalences of spectra: Tau Ceti's symmetric spectra are point-set constructions with no stable homotopy category.

**Tested.** At the pin, smash products exist only for pointed types (`TauCeti/CategoryTheory/Category/Pointed/Smash/Basic.lean`) and pointed simplicial sets (`TauCeti/AlgebraicTopology/SimplicialSet/Pointed/Smash/Basic.lean`). There is none for pointed topological spaces.

## R05 (P3) — four cited works are missing from sources.toml

**Location.** README line 1214 (§4.30b locators), line 1249 (§4.30c), and References lines 2528 (`hatcher`), 2532 (`james`), 2544 (`lurie-ha`) and 2562 (`wu`).

**Claim.** The roadmap's `sources.toml` does not record these four works.

**Witness.** `packages/GeneralAlgebraicKTheoryPartII/sources.toml` has 34 ids, from `lmmt` to `lrrv`. None of them is `hatcher`, `james`, `lurie-ha` or `wu`.

**Repair.**
1. Fetch `hatcher` (author page, the README's URL) and `lurie-ha` (author page) through the sources service, with the README's locators.
2. Fetch `wu` (arXiv:math/9510209v1) the same way, unless R01 removes it.
3. Record `james` as uncertified, with its journal locator: Annals of Mathematics 62 (1955), pp.170–197.

**Tested.** The sources cache already holds the author-hosted Hatcher text. I read all nine §4.30b hatcher locators in it.

## R06 (P3) — two locators pair a source line with the wrong item

**Location.**
- Line 965 (§4.18): "behrens line 861, §1.6, pp.27–29".
- Line 1100 (§4.26): "hahn line 62, §2, pp.3–4; Theorem 1.6, p.2".

**Claim.** Each cited line is a different item from the one it is paired with.

**Witness.**
- behrens line 861 is the §1.6 heading on p.24. The height-≤n substack is at line 1001 (p.28), and Proposition 1.6.8 is at line 1048 (p.29).
- hahn line 62 is Theorem 1.6 on p.2. §2 starts at line 113, on p.3.

**Repair.**
- §4.18: "behrens line 1001 and line 1048, Proposition 1.6.8, pp.28–29".
- §4.26: "hahn line 113, §2, pp.3–4; line 62, Theorem 1.6, p.2; line 198, Theorem 3.3, p.5, proof from line 306, pp.7–8; line 337, Definition 4.1, p.8".

**Tested.** I read every one of these lines at its page marker.

## Verified sound

**Gate, dependencies and build.**
- My gate run on this head prints every check at 0 and ends `OK`, exit 0.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check output, verbatim: `depcheck: 244 roadmaps, 2465 edges, 0 problem(s)`. There is no UPWARD, CYCLE or moved line.
- `lake env lean` on `Suggested.lean` exits 0. Its only output is 20 `sorry` warnings.

**Lean signatures.**
- I compared all 29 elaborated types in the worker's signature file with the README.
- The seven flagged "dropped" binders are all `[TopologicalSpace X]`, on `jamesSubmonoid`, `JamesReducedProduct`, `toFreeMonoid`, `reduce`, `mk`, `ι` and `filtration`. These are purely algebraic, so dropping the binder is correct.
- Every theorem keeps its hypotheses: `T2Space`, the `CWComplex` structure, the 0-cell base point, `ConnectedSpace`, the countable cells, `hq`, `hq_eq` and `hd`.
- The file has no sorry'd data, no `set_option` and no `lemma`.
- No declaration's fully qualified name clashes with one at any open head (`roadmaps grep --lean-only`).
- The James statements match README §4.30b. One harmless difference: `isClosed_filtration` and `continuous_ι` are stated more generally (T1, Δ-generated) than the README's CW case.

**Sampled locators: 15/15 read at the cited lines.**

| Target | Source, line | Statement and page |
|---|---|---|
| 0.1 | bgt 1622, 1661 | Propositions 5.14–5.15, pp.777–779 |
| 0.1 | lmmt 645 | Lemma 3.7, p.1024 |
| 3.1 | barwick 820 | Theorem 6.1, p.19 |
| 3.1 | agh 241 | Definition 2.1, p.6 |
| 3.3 | barwick 820 | Theorem 6.1 (connective) |
| 3.3 | agh 1227 | Theorem 3.18, p.27, noetherian heart |
| 4.2 | lmmt 255–277 | Definition 2.1 and Lemma 2.2(i),(ii),(viii), p.1016 |
| 4.18 | lmmt 1011–1017 | proof of Corollary 4.21, p.1032; behrens: see R06 |
| 4.26 | hahn 62, 198, 306, 337 | Theorem 1.6 (k≥1), Theorem 3.3, its proof and Definition 4.1 |
| 4.30b | hatcher, printed pages (offset 9 from the PDF) | §3.2, p.224; Proposition 3.22, p.224; Corollary 3A.7, p.266; Proposition 3C.8, p.288, which assumes free homology (README's flat-coefficient form follows from AlgebraicTopology Stage 5 item 1's Künneth collapse); Theorem 4.37, p.371; Proposition 4.74, p.418; Example 4A.3, p.422; Theorem 4J.1, pp.471–473; Theorem A.6, p.524 |
| 4.32 | lmmt 948, 954, 973 | Lemma 4.15, its proof and Corollary 4.18, p.1031 |
| 4.32 | akq 218, 236, 632 | Construction 2.1, p.5; Lemma 2.2, p.6; Proposition 2.22, p.15 |
| 4.34 | may-nilpotence 47 | Theorem B, p.2 |
| 7.4 | lmmt 876–898 | Corollary 4.9 and Remark 4.10, pp.1029–1030 |
| 8.4 | cmnn20 1651, 1664 | Theorem B.2 and Corollary B.3, p.37; proofs at lines 1708 and 1762, pp.38–39 |
| 9.1 | lmmt 1056 | Corollary 4.23, p.1033 |
| 9.4 | lmmt 1068, 1083 | Corollary 4.25, p.1033, and Remark 4.26, p.1034 |
| 10.3, 10.4 | lmmt 1197 | Proposition 4.33, p.1036 |
| 10.4 | lrrv 394, 1396, 1082 | as verified last round |

**Library declarations opened at the pins (17).**
- Mathlib:
  - `Topology.RelCWComplex` with its `cell` field: `Mathlib/Topology/CWComplex/Classical/Basic.lean` lines 99–101.
  - `Topology.CWComplex`: same file, line 135.
  - `Topology.RelCWComplex.Subcomplex`: same file, line 659.
  - `Topology.WithGeneratedByTopology`: `Mathlib/Topology/Convenient/GeneratedBy.lean` line 70.
  - `DeltaGeneratedSpace`, an abbrev: `Mathlib/Topology/Compactness/DeltaGeneratedSpace.lean` line 40.
- Tau Ceti:
  - `MoorePath`, stopped from its length on: `TauCeti/Topology/PathSpace/Moore.lean` line 83.
  - `MooreLoopSpace`: same file, line 608.
  - `MooreLoopSpace.homotopyEquivPath`: `TauCeti/Topology/PathSpace/Moore/Comparison/Basic.lean` line 438.
  - `ContinuousMap.IsWeakHomotopyEquivalence`: `TauCeti/Topology/Homotopy/HomotopyGroup/WeakHomotopyEquivalence.lean` line 78.
  - `ContinuousMap.IsWeakHomotopyEquivalence.homotopyEquiv`, which needs `CWType` on both sides: `TauCeti/AlgebraicTopology/Homotopy/Whitehead.lean` line 243.
  - `CWType`, a `Prop` class: `TauCeti/Topology/CWComplex/Classical/CWType.lean` line 38.
  - `CWType.of_cwComplex_univ`: same file, line 72.
  - `instDeltaGeneratedSpaceOfCWComplexUniv`: `TauCeti/Topology/CWComplex/Classical/DeltaGenerated.lean` line 66.
  - `WedgeSum`: `TauCeti/Topology/WedgeSum.lean` line 78.
  - `MooreReplacement.Fiber`: `TauCeti/Topology/PathSpace/Moore/Replacement/Basic.lean` line 257.
  - The universal coefficient files `TauCeti/Algebra/Homology/UniversalCoefficient/*`, which cover cohomology only.
  - `TauCeti/AlgebraicTopology/Spectra/Free.lean`, which is point-set only.

**Cross-roadmap citations resolved (20).**
- AlgebraicTopology on main:
  - Stage 2 (line 326);
  - Stage 4 item 4, the reduced suspension (lines 535 and 560–561);
  - Stage 5 item 1, Künneth over every ring with flat collapse (line 856);
  - Stage 8 items 1 (`relativeCWConnectivityOfCellDimension`, line 1619), 3 (line 1684), 4 (line 1694), 5 (line 1700) and 9 (line 1870);
  - Stage 8 item 11a, `basedLoopCWType` (lines 1949 and 1988).
- DGFloer on main:
  - Layer 1 item 2, CW approximation (line 471);
  - `arbitraryCWSerreSpectralSequence` (line 531);
  - Layer 2 items 1–2 (lines 848–867).
- GeneralizedCohomology G2.5, Freudenthal (line 326).
- BordismFormalGroups F6.2 item 3 (line 704).
- At open heads:
  - HomotopySpheres #1287 §§3B.1–3B.6 (lines 1013–1146) and Layer 3 (line 855);
  - ChromaticHomotopyTheory #1643, line 10;
  - DGFloerPartII #1799, lines 88, 294 and 563;
  - AlgebraicTopology #1663, line 135.

**Ownership.**
- §4.30b owns the James reduced product and the James equivalence. HomotopySpheres §3B at #1287 plans the same object, and BordismFormalGroups on main (line 668) and AlgebraicTopology #1663 (line 135) treat HomotopySpheres as its owner.
- The brief excludes HomotopySpheres as a supplier, and no other allowed roadmap owns J(W). The only repair available here, citing HomotopySpheres, is therefore excluded, so this is not raised as a finding.
- DGFloerPartII, which the merge order places before this roadmap, consumes §4.30b. That upward citation is DGFloerPartII's to settle.
- `roadmaps overlaps` reports no conflicting head and no dropped id.

**Declared gaps.**
- The README states 21 slugs, and the plan has the same 21.
- Ignoring section prefixes, only `multiplicative-postnikov` (the README adds one sentence), `spectral-units-and-lines` and `suslin-…` differ; see the status of the previous review's R02.
- Each README contract is precise and minimal. None is affected by this round's changes.

**Adversarial table** (values computed on both sides)

| Statement | Instances | Values | Result |
|---|---|---|---|
| §0.1 | Mod_A with q=id and q:D→0; A=0 | kernel 0 gives fib(K(A)→K(A))=0; kernel D gives K(A)→K(A)→0 with fiber K(A); A=0 makes all terms 0 | sound |
| §3.1 | Perf(Hk); Σ^rHk; Postnikov on finite spectra | amplitude [r,r] for each r, so no common interval and the bound depends on the object; τ≤0S=Hℤ has infinite mod-2 homology, so it is not finite | sound |
| §3.3 | Perf(k) | K₀(Vect_k)=ℤ=K₀(Perf k), [Σk]=−[k], K₋₁=0; Barwick's theorem is connective and AGH 3.18 needs a noetherian heart, and both hypotheses are kept | sound |
| §4.2 | *, Σ^rH𝔽_p, S/q with q≠p | 0; bounded above gives zero periodic groups (Lemma 2.2(ii)); π₀(S/q)[1/p]=ℤ/q≠0 at height 0 | sound |
| §4.18 | KU_(p); H𝔽_p[u^±]; TMF | heights {0,1}: L₁-local; height ∞: L_nH𝔽_p=0, so excluded; TMF height ≤2: L₂-local (lmmt line 1016) | sound |
| §4.26 | p=2,3; h=2, k=1 | res P(2)=4 or 8 versus res(P(1)+P(1))=2, differences 2=res tr(1) and 6; rank 2^(h+1)−1=7; mod (2,u₁), [2](z)=u₂z⁴+_F z⁸, so g₂(0)=u₂ | sound |
| §4.30b and `exists_jamesMap_*` | W=S⁰, S¹, S²; d≡0 | J(S⁰)=ℕ versus π₀ΩS¹=ℤ, so `ConnectedSpace` is needed; π₁J(S¹)=ℤ=π₂S²; for d≡0 every letter is the unit loop, so φ is trivial while π₂J(S²)=ℤ, so `hd` is needed; at w₀ the junk s/0=0 gives q(w₀,0), the base point, matching φ(1)=1 | sound |
| §4.30b connectivity | J_rS²→J(S²) | cells outside J_rS² have dimension ≥2r+2, so the fiber is 2r-connected: (2r+1)-connective under §4.13, and 2r after looping; J₂S² has one 2-cell, S²×S² has two | sound |
| §4.30b homology | J(S²); Moore space S²∪₂e³ | Pontryagin ring ℤ[x], while in the cup product x^i is i! times a generator; integrally H̃₅(W∧W)=Tor(ℤ/2,ℤ/2)=ℤ/2 versus T(H̃W)₅=0, and over 𝔽₂ both sides have rank 2 | sound |
| `existsUnique_lift` | X=S⁰, M=Multiplicative ℕ | J(S⁰)≅ℕ is generated by ι a, so a^k↦k is the only lift | sound |
| `continuous_ι` | Cantor set C | Δ-refinement of C^k is discrete, so J(C) is discrete and ι is discontinuous; the Δ-generated hypothesis is needed | sound |
| `isClosed_filtration` | Sierpiński space, x₀ the open point | preimage of J₀ in X¹ is {x₀}, which is not closed; T1 is needed | sound; padding (R02) |
| `iUnion_filtration`, `cwType`, `mul_mem_filtration` | one-tactic probe | close by one `exact`, by `obtain`+`infer_instance`, and by `simp_all`+`omega` | padding (R02) |
| `isIso_singularHomology_int_iff` | RP²→*; degree-2 map S¹→S¹ | RP²: ℚ and 𝔽₃ isomorphisms, 𝔽₂ not (H₁=H₂=𝔽₂), ℤ not (H₁=ℤ/2); degree 2: fails over ℤ and 𝔽₂, holds over ℚ and 𝔽₃ | true; not a headline (R02) |
| `exists_homotopyEquiv_of_isIso_singularHomology` | punctured Poincaré sphere →* | integral homology isomorphism; π₁ is binary icosahedral and non-abelian, so `hX` fails and the map is not an equivalence | hypothesis needed |
| `exists_pointed_cwApproximation` | Warsaw circle | Q=*, a weak equivalence that is not a homotopy equivalence | true |
| §4.30c stable splitting (kept) | S⁰; S^c | Σ∞_+ℕ=T(S) with π₀=ℤ[t] versus S[ℤ] with π₀=ℤ[t,t⁻¹]; Σ∞ΩS^(c+1)≃⊕S^(rc) | sound |
| §4.30c EHP (R01) | W=S², n=2 | ℤ/2→π₅S³→ℤ→ℤ→ℤ/2→0 makes ℤ→ℤ multiplication by ±2, so suspension π₄S²→π₅S³ is onto (hatcher pp.474–475); W→hofib(h₂) is iso below 3n−2 and onto there, so its fiber is (3n−3)-connected | true; owned elsewhere |
| §4.30c h₂ (R01) | w₁w₂w₃ | (w₁∧w₂)(w₁∧w₃)(w₂∧w₃): the ordered 2-subwords of BordismFormalGroups F6.2 item 3 | same object |
| Docstring (R04) | wedges, homotopy fibres | `TauCeti.WedgeSum` and `TauCeti.MooreReplacement.Fiber` exist at the pin | claim false |
| §4.32 | p=3, 5; m=0, 1, 2; z(1) | π₀y(0)=ℤ_p; π₀y(1)=ℤ_p/(p)=𝔽_p; slopes 1/16 versus 1/4 (difference 3/16) and 1/48 versus 1/8 (difference 5/48); π₀z(1)[1/2]=ℚ≠0, so i=0 is excluded for z (akq 2.22) | sound |
| §4.34 | H𝔽₂; R=ℚ×ℚ | H𝔽₂⊗Hℚ=0=H𝔽₂⊗H𝔽₃ but H𝔽₂⊗H𝔽₂≠0; (a,b)(c,d)=(ac,bd) versus E₁₂E₂₁=E₁₁≠E₂₂ | sound |
| §7.4 | m=1 | allowed heights {0,1,2}; id+Σ^(2p−1) acts as 1+(−1)=0 on K; rational ranks (1,0)+(0,1)=(1,1) | sound |
| §8.1 (new Checks) | H(ℚ/ℤ); H𝔽₂ in Sp | N·(1/2N)=1/2≠0 for every N, so not ε (Proposition 2.6); 2·id=0 and H𝔽₂ is a retract of F⊗H𝔽₂ when F_(2)≠0, so ε | sound |
| §8.2 (new Check) | KU→KO in Sp | π₀ sends 1 to 2, with rational image ℚ (N=2); η³=0 on KO since π₃KO=0, so KO is a retract of KO⊗C(η³)∈thick⟨KO⊗Cη⟩=thick⟨KU⟩ | sound |
| §8.3 | G=1; KO→KU | identity; [KU]=[KO]−[ΣKO]=2[KO], so ½[KU] maps to 1 rationally | sound |
| §8.4 | H=1; \|H\|=2 | X=S with K⁰(S)=k free of rank 1; free of rank d over k[C₂] has k-dimension 2d | sound |
| §9.1 | Hℤ at p=2; H𝔽₃ at p=3 | Hℤ is K(1)-acyclic and L₁Hℤ=Hℚ≠Hℤ, so §4.19 cannot replace purity; 𝔽₃[1/3]=0 and L_K(1)K(𝔽₃)=0 | sound |
| §9.4 | A=𝔽_p[ε]/ε² | 1+εx is a nonzero element of NK₁(A); A[1/p]=0, so both K(1)-local values are 0 | sound |
| §10.3 | G=ℤ; finite cyclic family | G/G is terminal in Or_Cyc(ℤ); ℤ's finite cyclic subgroups are only 1, so there is no terminal orbit | sound |
| §10.4 | G=C₂×C₂, R=S | LBG has 4 summands BG; omitting one C₂ loses its summand; lmmt 4.33 is for connective R, which is kept | sound |
| §4.46 Theorem A | H𝔽_p and Hℤ at n=1 | L₁^(p,f)H𝔽_p=0, consistent with K(𝔽_p)^∧p=Hℤ_p; part (ii) at n=1 would give L_T(1)K(ℤ)=0, which is false, so n≥2 is needed and stated | sound |
| §5.5 purity | Hℤ, n=1 | L_(T(0)∨T(1))Hℤ=Hℤ[1/p]; the fiber of K(ℤ)→K(ℤ[1/p]) is K(𝔽_p), which is K(1)-acyclic | consistent |
| §6.1 Theorem B | H𝔽_p, Hℚ, E_n | heights −1, 0, n give K bounds 0, 1, n+1; K(𝔽_p)[1/p]≠0 attains 0 | sound |
| §10.5 | G=ℤ, R=KU | terminal orbit, so assembly is the identity | consistent |

## Not verifiable

- `james` (Annals of Mathematics 62, 1955): the publisher and JSTOR copies are paywalled, and the manifest has no entry. The James equivalence it is cited for was checked against hatcher Theorem 4J.1 instead.
- `lurie-ha` Proposition 4.1.1.18 and `wu` §1: neither is in the manifest or the sample, so I did not read them. R01 would remove `wu`.
- HomotopySpheres #284 and the BordismFormalGroups revisions #1807, #1808 and #1854 were not given with their files. Ownership against them was checked only through `roadmaps grep` and `roadmaps overlaps`; I used BordismFormalGroups on main.

## Source issues

- none
