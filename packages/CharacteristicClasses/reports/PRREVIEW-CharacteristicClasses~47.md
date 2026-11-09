# Review of CharacteristicClasses (pull request #1854 at 56715a5)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since c07dda7. `git diff c07dda78 HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty. The two commits since then, 1ccc5174 and 56715a57, touch only AlgebraicTopology and BordismFormalGroups. Neither commit repairs anything this folder or its suppliers were asked to change, and the pull request description is unchanged.

All nine previous findings stand. They are written again below under their previous numbers, with every witness re-read at this head; witnesses in sibling files whose line numbers moved have been updated. Five are blocking: R01 (P1) and R02–R05 (P2). The gate still fails on `outside-folder` (R08).

The two changed sibling passages do not make any text of this README wrong; see "Verified sound".

## R01 (P1) — The lifted oriented Schubert cells have no owner: this README hands them to TopologicalKTheory T1.6a, which still takes them from C1.1a

Location: `TauCetiRoadmap/CharacteristicClasses/README.md:20–24`: "TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame quotients by SO(n)), their lifted finite cells and coordinate maps". Also `:323–330`, which says T1.6a owns the finite oriented carriers and their lifted Schubert cells.

Claim: TopologicalKTheory is unchanged since c07dda7 (`git diff --stat c07dda78 HEAD -- TauCetiRoadmap/TopologicalKTheory` is empty). It still names C1.1a as the supplier of the oriented cover and the lifted cells. No TopologicalKTheory item constructs those cells, so they have no owner, and C1.1a and T1.6a each cite the other. The dependency check reads TopologicalKTheory from main and cannot see this edge.

Witness: `TauCetiRoadmap/TopologicalKTheory/README.md:116–117`: "CharacteristicClasses C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor". Also `:384–387`: "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor … rank-colimit on those lifted cells".

Repair, the same as r41's:
- TopologicalKTheory T1.6a (`:383–387`): state as T1.6a's own work the pinned `TauCeti.finiteOrientedGrassmannian n N` with `Tautological` and `forget` (`Topology/Grassmannian/Oriented.lean`), its lifted Schubert cells, characteristic maps and coordinate maps, and the lifts of the pinned `rankStabilization` and `ambientStabilization`. Then the fixed-rank BSO(n) colimits and `stableOrientedGrassmannian`.
- TopologicalKTheory `:75–81` and `:116–117`: state C1.1a–b as consumers only.
- This README, `:21–22`: replace "(orthonormal-frame quotients by SO(n))" with "(the pinned `TauCeti.finiteOrientedGrassmannian`, the orientation double cover of T1.5's tautological bundle)".

Alternatively, restore main's arrangement, in which C1.1a constructs the lifted cells and T1.6a consumes them, and delete "TopK T1.6a's lifted Schubert cells" from `:323–324`.

Test: TopologicalKTheory then names exactly one owner of the lifted cells, and none of its lines cites C1.1a as an input.

## R02 (P2) — Compactly supported local-coefficient cochains have two owners: AlgebraicTopology's supported-cellular supplement and C1.2a S0–S4

Location: `README.md:71–75`: "For the support lane, C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4". Also the S0–S4 constructions (`:585–593`), `:656–660` and `:662–669`.

Claim: commit 1ccc5174 did not touch AlgebraicTopology's supported-cellular supplement. It still owns exactly the objects S0–S4 construct and names C1.2a as their consumer, while this README still constructs them and says AlgebraicTopology consumes them.

Witness: `TauCetiRoadmap/AlgebraicTopology/README.md:1685–1690` at this head: "owns the compactly supported local-coefficient cochain foundation below … CharacteristicClasses C1.2a consumes the foundation for its support excision and collared-pair triangle". `:1697` defines the same `C_K^*(X,A;L)=C^*(X,A∪(X∖K);L)`.

Repair, the same as r41's:
- Lines 71–75 should read: "C1.2a consumes AlgebraicTopology's supported-cellular foundation after ordinary 6.2: the support colimit C_c^* and H_c^*, enlargement, cofinality, proper pullback, open extension, supported and mixed cups, and jointly proper homotopy invariance. C1.2a owns S5's collared-pair support excision and supported pair triangle, and the comparison of that triangle with AlgebraicTopology's supported CW-pair triangle. No AlgebraicTopology stage consumes C1.2a."
- Keep the S0–S4 labels, because AffineMorseLefschetz on main cites "C1.2a S0–S5" (its lines 28, 152, 622, 931, 941 and 1494). Reduce each label to one sentence that consumes the matching AlgebraicTopology item.
- Make `:591` and `:662–669` consume AlgebraicTopology's supported cups.
- `:656–660`: "These foundations consume AT2–4, ordinary AT6.1–6.2 and AT's supported-cellular foundation, independently of AT8.5."

Test: `grep -n "consumes C1.2a" README.md` returns nothing (at this head it returns line 72).

## R03 (P2) — C5.1 restates the compact splitting and root data that LieGroups Layers 5A and 6 own on main

Location: `README.md:1585–1601`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the negative semidefiniteness of the Killing form … the identification of t_ss,C as a Cartan subalgebra".

Claim: main (bbbde05) still has LieGroups Layer 5A, which owns the Ad-invariant metric, the orthogonal splitting and the negative-definite Killing form of `[𝔤,𝔤]`. Layer 6 still owns t_ss,ℂ as a Cartan subalgebra and the root comparison. Main's own copy of this README consumes "LieGroups Layer5A and Layer6" (main CharacteristicClasses line 1350). At this head C5.1 claims these as its own, so they have two owners.

Witness: main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md:641`, "### Layer 5A: compact Lie-algebra metric and splitting". Also `:655–656`, the orthogonal `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]` with negative-definite Killing form; and `:750`, "Prove t_ss,C is a Cartan subalgebra".

Repair, the same as r41's:
- Replace `:1585–1601` with: "Consume LieGroups Layer 5A's Ad-invariant metric B_G, the orthogonal splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the negative-definite Killing form of the centerless semisimple ideal `[𝔤,𝔤]`, and Layer 6's identification of t_ss,ℂ as a Cartan subalgebra with its root characters and Weyl comparison."
- Keep as C5.1's own work: the Haar/Killing scalar comparison on each simple factor, the transport through invariant polynomial functions, and the pinned Chevalley restriction.

## R04 (P2) — C1.1b's principal-bundle supplier, TopologicalKTheory T6.4, does not make the cited statement at this head

Location: `README.md:19`: "Its T6.4 supplies continuous principal/associated bundles and descent". Also `:332–333` and `:366–368`, which use T6.4's general numerable principal-bundle category and its cylinder homotopy invariance.

Claim: at this head T6.4 is compact-Lie equivariant descent. It builds the bundle category only "needed here" and states no homotopy invariance. The general foundation is main's T6.4 (#1781, ad30d944). `git merge-tree --write-tree origin/main HEAD` still exits 1, with conflicts in `TauCetiRoadmap/TopologicalKTheory/README.md` and `Suggested.lean`.

Witness: at this head, `TauCetiRoadmap/TopologicalKTheory/README.md:1109–1114`: "Let H be a compact Lie group … Build the continuous principal/associated-bundle category needed here". On main, `:1286`: "**Continuous principal-bundle foundation.**" and `:1309`: "numerable principal bundle over X×I".

Repair, the same as r41's: merge main and resolve the TopologicalKTheory conflict so that T6.4 is main's continuous principal-bundle foundation, with this branch's TopologicalKTheory repairs on top. If the branch's T6.4 is kept instead, C1.1b must state the numerable principal-bundle category and its cylinder homotopy invariance as its own targets, with locators.

## R05 (P2) — C7.1's L₃ target consumes IndexTheory I7.2, a roadmap later in the merge order that consumes this one

Location: `README.md:2161–2162`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

Claim: IndexTheory is not on main. It is line 10 of `ORDER.txt`, and at its open head (75046fc2) it consumes CharacteristicClasses C1–C7. Its signature section I7.2 needs C5. So the two roadmaps cite each other. The dependency check reads main and cannot see this edge. The CP⁶ and HP³ Checks at `:2168–2175` already test L₃.

Witness: IndexTheory head, `TauCetiRoadmap/IndexTheory/README.md:234–236`: "From TauCetiRoadmap.CharacteristicClasses … CharacteristicClasses C1–C7". `:1364`: "### 7.2 The signature operator (I7.2)". `:1383`: "*Needs:* Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5."

Repair: replace `:2161–2162` with "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve." Test: `grep -n IndexTheory README.md` then returns only that consumer sentence.

## R06 (P3) — The README lacks the house shape, and the sampled targets have no Checks or *Needs:* lines

Location:
- `README.md:1`: "# Characteristic classes and Chern–Weil theory";
- C1.0 (`:230–292`), C2.0 (`:856–929`) and C5a.1–C5a.7 (`:1690–2026`).

Claim: unchanged since r41. The README is 2388 lines and has 8 `**Checks.**` blocks, 1 `*Needs:*` line, and no `### Examples` or `### Dependencies` section. It has none of the house-shape sections `# Roadmap:`, `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` and `## Downstream consumers`.

Witness: `grep -c '\*\*Checks\.\*\*'` gives 8 and `grep -c '\*Needs:\*'` gives 1. `grep -n '^## '` lists "Carriers, scope and suppliers", "Conventions", C1–C7 (with C5a) and "Dependency order and references".

Repair, as in r41:
- Rename the headings to the house shape.
- Gather the pinned names under `## Exact supplier contracts`.
- Add `### Examples` and `### Dependencies` to each layer.
- Give each sampled target three Checks and a *Needs:* line, using the values computed in r41's table:
  - C1.0: H=diag(1,4) sends e₂ to e₂/2, of h₁-norm 1; Sylvester sums 2, 3, 4; rank 0 has a singleton frame.
  - C2.0: rank 0 gives S(E)=∅; TS² gives Thom cells in degrees 2 and 4; the sup-ball map sends (1,1) to (1,1)/√2.
  - C5a.1: da(X,Y)=−a([X,Y]); H¹(SU(2))=0.
  - C5a.2: U(2) has weights 2 and 4.
  - C5a.3: F₀=0 and F₁=Ω.
  - C5a.4: SU(2) gives Λ(e₃) with De₃=P.
  - C5a.6: SU(2) has Poincaré series 1+t³.
  - C5a.7: the E8 odd degrees sum to 248.

## R07 (P3) — Three statements about pinned names and the not-statable list are inaccurate

Location and repair, unchanged since r41:
- **The not-statable list is incomplete.** The docstring of `Suggested.lean:44–89` omits C5a.1's de Rham/Chevalley–Eilenberg comparison and C5a.4's Cartan–Koszul comparison, which `README.md:5–6` names as deliverables. Repair: add a docstring bullet naming both, and the missing carriers (an all-degree Chevalley–Eilenberg complex and a Weil algebra).
- **`IsThomClass.pullback` is described as the wrong theorem.** `README.md:944–945` calls `TauCeti.IsThomClass.pullback` the pullback of Thom classes "along fibrewise isomorphisms". That theorem is `TauCeti.IsThomClass.singularCohomologyMap` (`Topology/VectorBundle/EulerClass.lean:269`). `IsThomClass.pullback` (`:327`) is its special case for f*E. Repair: cite both, each for its own statement.
- **`HasCentralRadical` is attributed to the wrong owner.** `README.md:1590` reads "LieHighestWeight L9's `LieAlgebra.HasCentralRadical`". It is a Mathlib class (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`). Repair: write "Mathlib's `LieAlgebra.HasCentralRadical`".

Witness: `grep -rln ChevalleyEilenberg` over both pinned libraries returns nothing this round. `EulerClass.lean:269` and `:327` declare the two theorems, and `Defs.lean:75` declares `class HasCentralRadical : Prop`.

## R08 (P3) — The pull request changes two files outside its roadmap folders, and the gate fails

Location: `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

Witness: the worker's gate at 56715a5 reports "outside-folder=2 … FAIL". The brief's `git diff --stat origin/main...HEAD`, excluding the seventeen folders, lists exactly these two files (4 insertions, 4 deletions), from commits b96ce18d and 0d80dc9d.

Repair: move the two loop-cut sentences to their own pull request, or have both folders recognised as this pull request's own, so that the gate passes.

## R09 (P3) — The merge-order paragraph calls #1808 independent, though #1807 and #1808 both conflict with this folder

Location: the description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

Witness: `overlaps.md` this round: "#1807 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`" and "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`".

Repair: state that this pull request's CharacteristicClasses folder supersedes the copies in #1807 and #1808, and which branch is rebased onto which. Also name the TopologicalKTheory conflict with main (R04).

## Previous findings

- R01 — not repaired: `README.md:21–22` still reads "TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame quotients by SO(n)), their lifted finite cells", and TopologicalKTheory `:116–117` still says "C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor".
- R02 — not repaired: `README.md:72`: "The separate AT supported-cellular supplement consumes C1.2a S0–S4"; AlgebraicTopology `:1685–1689` still "owns the compactly supported local-coefficient cochain foundation".
- R03 — not repaired: `README.md:1585–1587`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]`".
- R04 — not repaired: `README.md:19`: "Its T6.4 supplies continuous principal/associated bundles and descent"; TopologicalKTheory `:1109` at this head: "Let H be a compact Lie group".
- R05 — not repaired: `README.md:2161–2162`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."
- R06 — not repaired: `README.md:1`: "# Characteristic classes and Chern–Weil theory"; 8 Checks blocks, 1 *Needs:* line.
- R07 — not repaired: `README.md:944–945`: "isomorphisms `TauCeti.IsThomClass.pullback`"; `:1590`: "of LieHighestWeight L9's `LieAlgebra.HasCentralRadical`".
- R08 — not repaired: gate "outside-folder=2 … FAIL" (ArithmeticDirichletSeries, SymplecticGeometry).
- R09 — not repaired: description: "#1808 is independent of this pull request."

## Verified sound

**The change set.**
- `git diff c07dda78 HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty.
- `git diff --stat c07dda78 HEAD`: AlgebraicTopology README (+107/−) and `Suggested.lean` (40 lines); BordismFormalGroups README (821 lines) and `Suggested.lean` (121 lines).
- TopologicalKTheory and IndexTheory: no change in this pull request since c07dda7. The IndexTheory head moved; R05's witness lines are updated.
- No repair report since r41 marks any finding "not actionable".

**Changed sibling passages read against this roadmap.**
- AlgebraicTopology 8.8b, now the aspherical-target classification `exists_mapOfEq_eq_of_isAspherical_cwComplex`. It keeps the normalized pointed comparison c_G : Z→Bπ for a Hausdorff CW K(G,1) (AT `:2458–2463`). It still names CharacteristicClasses as the consumer of "Stage 8.8b's normalized ℤ/2 model" (AT `:158`, `:2865`). This README's citations at `:66`, `:799` and `:819` therefore still resolve; the change supplies the mapping bijection they rely on.
- AlgebraicTopology Stage 8 item numbers are unchanged: 8.3 absolute Hurewicz (2277), 8.5 Whitehead (2318), 8.8 classifying spaces (2444), 8.9 relative obstruction cochains (2650), 8.10 representability (2688), 8.12 circle comparison (2847). Every AT8.x citation in this README (lines 64–70, 792–820, 842–847, 929, 1373, 1390, 1442) resolves.
- AlgebraicTopology 8.4 (relative Hurewicz from degree two), 8.8c (pinned killing tower) and the new pinned-name list (AT `:449–466`) are not cited here; `grep -n "8\.8c\|8\.4\|killHomotopy"` on this README is empty.
- AlgebraicTopology Stage 4.5 still owns the compact-generation coreflection (AT `:139`, `:1006`), so `README.md:25–27` resolves at this head. #1807's copy of AlgebraicTopology says otherwise; that copy is #1807's review's matter. `relativeCWPushoutCWModel` is still named at AT `:929`.
- BordismFormalGroups cites this roadmap only for C3: at `:42`, `:122` (a new "From TauCetiRoadmap.CharacteristicClasses" contract) and `:631`. C3 states the Whitney laws (`:1335–1340`) and "`H*(BO(n);F2)=F2[w₁,…,w_n]`" (`:1365`), so the contract resolves. This README cites no BordismFormalGroups item, so there is no two-way supply.

**Gate.**
- The worker's gate at 56715a5: every check is 0 except `outside-folder=2` (R08); `build=0`.
- Rerunning the brief's gate command reports `outside-folder=33`. That count is the 31 files of the sixteen other folders this brief names as the pull request's own (`git diff --name-only origin/main...HEAD` grouped by folder) plus the same two files. The other 26 checks are 0.

**Elaboration.**
- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits 0. Its only warnings are `declaration uses sorry` at 125:8, 149:8, 165:8 and 187:8.
- `#check @name` was run on all four declarations in `scratch/signatures/SignatureCheck.lean`. The elaborated types equal those in `signatures.md` and in r41: `[FiniteDimensional ℝ F]` and `[Module.Projective K R]` are present, and nothing was dropped.
- The pins are identical to main's: Tau Ceti 2fd255d9 and Mathlib 1b1ccf4b in both `lake-manifest.json` files.
- `Suggested.lean` is unchanged, so r41's one-tactic probe (`rfl`, `simp`, `infer_instance`, `exact` with the pinned compact-base and section-vanishing lemmas: none closes) stands.

**Dependency check**, run this round:

```text
depcheck: 239 roadmaps, 2376 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. R01 and R05 are edges the check cannot see: it reads TopologicalKTheory from main, and IndexTheory is not on main.

**Overlaps.**
- The `overlaps.md` lead "SpinGeometry §G4.1a … main does not" is false: main `TauCetiRoadmap/SpinGeometry/README.md:397` defines G4.1a.
- No id this README cites is dropped by an open pull request.
- The #1807/#1808 conflicts are R09.

**Pinned declarations re-opened this round:**
- `TauCeti.IsThomClass.singularCohomologyMap` (EulerClass.lean:269) and `TauCeti.IsThomClass.pullback` (:327);
- `LieAlgebra.HasCentralRadical` (Mathlib Semisimple/Defs.lean:75);
- no `ChevalleyEilenberg` in either library.

The other 120-odd declarations r41 opened are cited unchanged; the pins are the same.

**Cross-roadmap citations resolved this round:**
- TopologicalKTheory `:75–81`, `:116–117`, `:383–387` and `:1109–1114` at this head; main's `:1286` and `:1309`.
- AlgebraicTopology as listed above, plus the supported-cellular supplement `:1685–1741`.
- LieGroups main `:641`, `:655–656` and `:750`; main CharacteristicClasses `:1350`.
- IndexTheory head 75046fc2 `:234–236`, `:1364` and `:1383`.
- AffineMorseLefschetz main `:28, 152, 622, 931, 941, 1494` (C1.2a S0–S5).
- SpinGeometry main `:397`.

**Source spot check.** zentner-instanton-sheet2 line 50 gives `p₁(su(E))=−4c₂(E)+c₁(E)²`, matching C7.AdjointHopfObstruction's `p₁(su(F))=c₁(F)²−4c₂(F)` (`README.md:2228`). The rest of the seeded sample (C1.0, C2.0, C5a.1–C5a.7) is unchanged text that r41 checked at its locators.

**Adversarial table.** No statement of this folder changed. The rows are carried from r41 (PRREVIEW-CharacteristicClasses_r41, "Adversarial table"), each with r41's computed values. Two rows are added for the changed sibling interfaces that cite or are cited by this roadmap.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_…_thomPair_fiber` (L125), r41 | B=pt rank 1; K=𝔽₂; rank 0 | o=ω gives u=g, o=−ω gives −g; over 𝔽₂ −g=g; rank 0: H⁰(pt,∅)=K | true; not one-tactic |
| `exists_isThomClass_of_orientation` (L149), r41 | B=ℝ trivial; zero ring; Möbius line | pullback of the generator; H=0 so span{0}=⊤; no orientation, so hypotheses unsatisfiable | true |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L165), r41 | TS²; S²×ℝ²; O(1)_ℝ on CP¹; su(F) on HP¹ | e=2, no section; e=0, section; e=1, none; rank 3 with a 4-cell violates `hdim`, e∈H³(S⁴)=0 but no section | true; `hdim` necessary |
| `not_exists_isImmersion_…` (L187), r41 | k=1,2,3; ℕ subtraction | targets 2, 6, 14; (1+a)³=1+a+a²+a³ gives w̄₃≠0 on ℝP⁴; 2^(k+1)≥4, no truncation | true |
| C1.0 metric transport, r41 | H=diag(1,4); Sylvester | h₁(e₂/2,e₂/2)=1; eigenvalue sums 2, 3, 4 >0 | correct |
| C1.1a carrier, r41 | r=N; added-line sign | `encard_univ_fullRank`=2; (−1)^(n−1)=−1 for n=2, +1 for n=3 | correct; ownership R01 |
| C1.2a S0–S4 vs AT supplement, r41 | C_K definition; H¹_c(ℝ) | both C*(X,A∪(X∖K);L); x² acts by 0 on H¹_c(ℝ;ℤ)=ℤ | same object, two owners (R02) |
| C1.5a ↔ AT8.8b (new row: changed supplier passage) | RP∞→Bℤ/2; constant map | [RP∞,Bℤ/2]_* ≅ Hom(ℤ/2,ℤ/2) has 2 elements = #H¹(RP∞;𝔽₂); identity pulls ι to a with a²≠0, constant map pulls ι to 0 | consistent; AT supplies the bijection C1.5a uses |
| C2.0 cells, r41 | rank 0; TS²; v=(1,1) | S(E)=∅; Thom cells 2, 4; image (1,1)/√2 has ‖·‖₂=1 | correct |
| C3 ↔ BordismFormalGroups contract (new row) | BO(1), BO(2); MO(1) | 𝔽₂[w₁]; 𝔽₂[w₁,w₂] with dimensions 1,1,2,2,3 in degrees 0–4 = coefficients of 1/((1−t)(1−t²)); U restricts to w₁=a on RP∞ | C3 (`:1365`) states what `BordismFormalGroups:122` consumes |
| C5a.1 CE complex, r41 | degree 1; SU(2); torus | (−1)a([X,Y]) = Mathlib −f⁅x,y⁆; H¹(SU(2))=0; torus H¹=g* | correct |
| C5a.3 Weil algebra, r41 | F_t endpoints | tΩ+½(t²−t)[θ,θ]; F₀=0, F₁=Ω | correct |
| C5a.6–7 Poincaré series and degrees, r41 | SU(2), U(2), E8 | 1+t³; (1+t)(1+t³); 3+15+23+27+35+39+47+59=248 | correct |
| C5.1 splitting, r41 | SU(2) Killing form | κ(e₁,e₁)=−8<0 | same object as LieGroups 5A (R03) |
| C7.1 L₃, r41 | CP⁶; HP³ | (2170−1911+686)/945=1; (496−624+128)/945=0 | correct |
| C7.AdjointHopf, r41 and this round | roots; HP¹ | e₂(0,x−y,y−x)=−(x−y)² gives p₁=c₁²−4c₂; ⟨p₁,[HP¹]⟩=−4; zentner line 50 matches | correct |

**Remarks on untouched text** (no R-number): none beyond r41's.

## Not verifiable

- Milnor–Stasheff (§§4, 10, 12, 15, 18, 19), Milnor *Topology from the Differentiable Viewpoint* §6, Milnor *Construction of Universal Bundles II* §§2–3 and Bott–Tu are settled `uncertified` in the manifest and cited by locator; their texts were not read. The mathematics of those headlines was checked independently in r41's table.
- tom Dieck 14.4.3 (C1.1b) and May Chapter 16 (C1.2b) are outside the seeded sample and were not read.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 1: the source calls the endomorphisms defining su(E) "skey-adjoint"; it should say skew-adjoint; affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), p. 1: the source derives the integral identity for p₁(su(E)) through the Chern character, which sees classes only modulo torsion; it should use the integral splitting principle with roots 0, ±(x−y), or assume torsion-free H⁴; affects the proof.
