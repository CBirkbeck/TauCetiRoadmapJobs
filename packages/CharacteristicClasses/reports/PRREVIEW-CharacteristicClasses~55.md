# Review of CharacteristicClasses (pull request #1854 at 59d8c40)

**Verdict:** needs changes

This is an incremental re-review of 0 changed lines since 56715a5. `git diff 56715a57 HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty.

The six commits since then touch only other folders: AlgebraicCurves, LocalPurity, ReductiveGroups, BanachSpaceTheory, AlgebraicTopology and BordismFormalGroups. TopologicalKTheory, ClassifyingSpaces and IndexTheory's own pull request carry no repair of anything this folder was asked to change. The pull request description is unchanged.

All nine previous findings stand. They are written again below under their previous numbers, with every witness re-read at this head. Witnesses whose line numbers moved are updated: AlgebraicTopology (R02) and IndexTheory, whose head moved to 6d85f5d4 (R05).

Five findings block: R01 (P1) and R02–R05 (P2). The gate still fails on `outside-folder` (R08). The changed sibling passages do not make any text of this README wrong; see "Verified sound".

## R01 (P1) — No roadmap owns the lifted oriented Schubert cells: this README hands them to TopologicalKTheory T1.6a, which takes them from C1.1a

**Location.** `TauCetiRoadmap/CharacteristicClasses/README.md:20–22`: "TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame quotients by SO(n)), their lifted finite cells and coordinate maps". Also `:323–330`: "TopK T1.6a owns the finite oriented carriers, the fixed-rank/stable oriented colimits".

**Claim.** TopologicalKTheory has not changed in this pull request since c07dda7 (`git diff --stat 56715a57 HEAD -- TauCetiRoadmap/TopologicalKTheory` is empty). It still names C1.1a as the supplier of the oriented cover and of the lifted cells, and no TopologicalKTheory item constructs those cells. So the cells have no owner, and C1.1a and T1.6a each cite the other. The dependency check reads TopologicalKTheory from main, so it cannot see this edge.

**Witness.** `TauCetiRoadmap/TopologicalKTheory/README.md:116–117`: "CharacteristicClasses C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor". Also `:384–387`: "compare using CharacteristicClasses C1.1a's finite oriented-cover precursor … rank-colimit on those lifted cells".

**Repair** (unchanged since r41):
1. In TopologicalKTheory T1.6a (`:383–387`), state as T1.6a's own work:
   - the pinned `TauCeti.finiteOrientedGrassmannian n N` with `Tautological` and `forget` (`Topology/Grassmannian/Oriented.lean`);
   - its lifted Schubert cells, characteristic maps and coordinate maps;
   - the lifts of the pinned `rankStabilization` and `ambientStabilization`;
   - then the fixed-rank BSO(n) colimits and `stableOrientedGrassmannian`.
2. In TopologicalKTheory `:75–81` and `:116–117`, state C1.1a–b as consumers only.
3. In this README at `:21–22`, replace "(orthonormal-frame quotients by SO(n))" with "(the pinned `TauCeti.finiteOrientedGrassmannian`, the orientation double cover of T1.5's tautological bundle)".

The alternative is main's arrangement: C1.1a constructs the lifted cells and T1.6a consumes them. In that case, delete "TopK T1.6a's lifted Schubert cells" from `:323–324`.

**Test.** TopologicalKTheory names exactly one owner of the lifted cells, and none of its lines cites C1.1a as an input. At this head, `:116` and `:386` do.

## R02 (P2) — Compactly supported local-coefficient cochains have two owners: AlgebraicTopology's supported-cellular supplement and C1.2a S0–S4

**Location.** `README.md:71–75`: "For the support lane, C1.2a consumes ordinary AT2–4 and ordinary6.1–6.2 only. The separate AT supported-cellular supplement consumes C1.2a S0–S4". The S0–S4 constructions are at `:585–593`; see also `:656–660` and `:662–669`.

**Claim.** This round's AlgebraicTopology commit (b9f2c11b) touches only the pinned-name list, the uniqueness route of 8.8b and a test. The supplement is unchanged apart from a twelve-line shift. It still owns exactly the objects that S0–S4 construct, and names C1.2a as their consumer. This README still constructs them and says that AlgebraicTopology consumes them.

**Witness.** `TauCetiRoadmap/AlgebraicTopology/README.md:1697–1701` at this head: "owns the compactly supported local-coefficient cochain foundation below … CharacteristicClasses C1.2a consumes the foundation". `:1709` defines the same `C_K^*(X,A;L)=C^*(X,A∪(X∖K);L)`.

**Repair** (unchanged since r41):
1. Make `:71–75` read: "C1.2a consumes AlgebraicTopology's supported-cellular foundation after ordinary 6.2: the support colimit C_c^* and H_c^*, enlargement, cofinality, proper pullback, open extension, supported and mixed cups, and jointly proper homotopy invariance. C1.2a owns S5's collared-pair support excision and supported pair triangle, and the comparison of that triangle with AlgebraicTopology's supported CW-pair triangle. No AlgebraicTopology stage consumes C1.2a."
2. Keep the S0–S4 labels, because AffineMorseLefschetz on main cites "C1.2a S0–S5" (its lines 28, 152 and 622). Reduce each label to one sentence that consumes the matching AlgebraicTopology item.
3. Make `:591` and `:662–669` consume AlgebraicTopology's supported cups.
4. Make `:656–660` read: "These foundations consume AT2–4, ordinary AT6.1–6.2 and AT's supported-cellular foundation, independently of AT8.5."

**Test.** `grep -n "consumes C1.2a" README.md` returns nothing. At this head it returns line 72.

## R03 (P2) — C5.1 restates the compact splitting and root data that LieGroups Layers 5A and 6 own on main

**Location.** `README.md:1585–1601`: "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]` … the negative semidefiniteness of the Killing form … the identification of t_ss,C as a Cartan subalgebra".

**Claim.** LieGroups is unchanged on main since bbbde05 (main is now b9ba334).
- Layer 5A owns the Ad-invariant metric, the orthogonal splitting and the negative-definite Killing form of `[𝔤,𝔤]`.
- Layer 6 owns t_ss,ℂ as a Cartan subalgebra and the root comparison.
- Main's own copy of this README consumes "LieGroups Layer5A and Layer6" (main CharacteristicClasses `:1350`).

At this head C5.1 claims the same objects as its own, so they have two owners.

**Witness.** Main `TauCetiRoadmap/RepresentationTheory/LieGroups/README.md`:
- `:641`: "### Layer 5A: compact Lie-algebra metric and splitting";
- `:655–656`: the orthogonal `𝔤 = z(𝔤) ⊕ [𝔤,𝔤]`, whose Killing form "is negative-definite";
- `:750`: "Prove t_ss,C is a Cartan subalgebra".

**Repair** (unchanged since r41): replace `:1585–1601` with "Consume LieGroups Layer 5A's Ad-invariant metric B_G, the orthogonal splitting `𝔤=𝔷(𝔤)⊕[𝔤,𝔤]` and the negative-definite Killing form of the centerless semisimple ideal `[𝔤,𝔤]`, and Layer 6's identification of t_ss,ℂ as a Cartan subalgebra with its root characters and Weyl comparison."

Keep three things as C5.1's own work: the Haar/Killing scalar comparison on each simple factor, the transport through invariant polynomial functions, and the pinned Chevalley restriction.

## R04 (P2) — TopologicalKTheory T6.4, cited as C1.1b's principal-bundle supplier, does not make the cited statement at this head

**Location.** `README.md:19`: "Its T6.4 supplies continuous principal/associated bundles and descent". `:332–333` and `:366–368` use T6.4's general numerable principal-bundle category and its cylinder homotopy invariance.

**Claim.** At this head T6.4 is compact-Lie equivariant descent. It builds the bundle category only "needed here" and states no homotopy invariance. The general foundation is main's T6.4, unchanged on main since bbbde05. `git merge-tree --write-tree origin/main HEAD`, with origin/main at b9ba334, still exits 1, with conflicts in `TauCetiRoadmap/TopologicalKTheory/README.md` and `Suggested.lean`.

**Witness.** At this head, `TauCetiRoadmap/TopologicalKTheory/README.md:1109–1114`: "Let H be a compact Lie group … Build the continuous principal/associated-bundle category needed here". On main, `:1286`: "**Continuous principal-bundle foundation.**", and `:1309`: "numerable principal bundle over X×I".

**Repair** (unchanged since r41): merge main and resolve the TopologicalKTheory conflict so that T6.4 is main's continuous principal-bundle foundation, with this branch's TopologicalKTheory repairs on top. If the branch's T6.4 is kept instead, C1.1b must state as its own targets, with locators, the numerable principal-bundle category and its cylinder homotopy invariance.

## R05 (P2) — C7.1's L₃ target consumes IndexTheory I7.2, and IndexTheory consumes this roadmap

**Location.** `README.md:2161–2162`: "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."

**Claim.** IndexTheory is not on main. At its open head (6d85f5d4) it consumes CharacteristicClasses C1–C7, and its signature section I7.2 needs C5. So the two roadmaps cite each other. The dependency check reads main, so it cannot see this edge. The CP⁶ and HP³ Checks at `:2168–2175` already test L₃ without the comparison.

**Witness.** IndexTheory head, `TauCetiRoadmap/IndexTheory/README.md`:
- `:237–239`: "From TauCetiRoadmap.CharacteristicClasses … CharacteristicClasses C1–C7";
- `:1371`: "### 7.2 The signature operator (I7.2)";
- `:1390`: "*Needs:* Layers 6.1–6.3; SpinGeometry G2; ComplexKahlerGeometry K5; CharacteristicClasses C5."

**Repair.** Replace `:2161–2162` with "IndexTheory I7.2 consumes L₃ for the signature theorem in dimension twelve."

**Test.** `grep -n IndexTheory README.md` then returns only that consumer sentence.

## R06 (P3) — The README lacks the house shape, and the sampled targets have no Checks or *Needs:* lines

**Location.**
- `README.md:1`: "# Characteristic classes and Chern–Weil theory".
- The sampled targets C1.0 (`:230–292`), C2.0 (`:856–929`) and C5a.1–C5a.7 (`:1690–2026`).

**Claim.** Unchanged since r41. The README is 2388 lines long. It has:
- 8 `**Checks.**` blocks and 1 `*Needs:*` line;
- no `### Examples` or `### Dependencies` section;
- none of `# Roadmap:`, `**Summary.**`, `## Scope and ownership`, `## Exact supplier contracts`, `## How to read the build` or `## Downstream consumers`.

**Witness.**
- `grep -c '\*\*Checks\.\*\*'` gives 8, and `grep -c '\*Needs:\*'` gives 1.
- `grep -c '^### Examples\|^### Dependencies'` gives 0.
- `grep -n '^## '` lists "Carriers, scope and suppliers", "Conventions", C1–C7 (with C5a) and "Dependency order and references".

**Repair** (as in r41):
- Rename the headings to the house shape.
- Gather the pinned names under `## Exact supplier contracts`.
- Add `### Examples` and `### Dependencies` to each layer.
- Give each sampled target three Checks and a *Needs:* line. The values computed in r41's table can serve:
  - C1.0: H=diag(1,4) sends e₂ to e₂/2, which has h₁-norm 1; the Sylvester sums are 2, 3 and 4; rank 0 has a singleton frame.
  - C2.0: rank 0 gives S(E)=∅; TS² has Thom cells in degrees 2 and 4; the sup-ball map sends (1,1) to (1,1)/√2.
  - C5a.1: da(X,Y)=−a([X,Y]); H¹(SU(2))=0.
  - C5a.2: U(2) has weights 2 and 4.
  - C5a.3: F₀=0 and F₁=Ω.
  - C5a.4: SU(2) gives Λ(e₃) with De₃=P.
  - C5a.6: SU(2) has Poincaré series 1+t³.
  - C5a.7: the E8 odd degrees sum to 248.

## R07 (P3) — The not-statable list is incomplete, and two pinned names are misattributed

Each item is unchanged since r41.

1. **The not-statable list.** The docstring at `Suggested.lean:44–88` omits two deliverables that `README.md:5–6` names: C5a.1's de Rham/Chevalley–Eilenberg comparison and C5a.4's Cartan–Koszul comparison.
   - Repair: add a docstring bullet naming both, and the carriers they lack: an all-degree Chevalley–Eilenberg complex and a Weil algebra.
2. **`IsThomClass.pullback`.** `README.md:944–945` describes `TauCeti.IsThomClass.pullback` as pulling back Thom classes "along fibrewise isomorphisms". That statement is `TauCeti.IsThomClass.singularCohomologyMap` (`Topology/VectorBundle/EulerClass.lean:269`); `IsThomClass.pullback` (`:327`) is its special case for f*E.
   - Repair: cite both theorems, each for its own statement.
3. **`HasCentralRadical`.** `README.md:1590` says "LieHighestWeight L9's `LieAlgebra.HasCentralRadical`", but the class is Mathlib's (`Mathlib/Algebra/Lie/Semisimple/Defs.lean:75`).
   - Repair: write "Mathlib's `LieAlgebra.HasCentralRadical`".

**Witness.**
- `grep -rln ChevalleyEilenberg` over both pinned libraries returns nothing this round.
- `EulerClass.lean:269` and `:327` declare the two theorems, and its module docstring (`:35–36`) describes them the same way.
- `Defs.lean:75` declares `class HasCentralRadical : Prop`.

## R08 (P3) — The pull request changes two files outside its roadmap folders, so the gate fails

**Location.** `Completed/ArithmeticDirichletSeries/README.md` and `TauCetiRoadmap/SymplecticGeometry/README.md`.

**Witness.** The worker's gate at 59d8c40 reports "outside-folder=2 … FAIL". The brief's `git diff --stat origin/main...HEAD`, with the seventeen folders excluded, lists exactly these two files (4 insertions, 4 deletions).

**Repair.** Either move the two loop-cut sentences to their own pull request, or have both folders recognised as this pull request's own, so that the gate passes.

## R09 (P3) — The merge-order paragraph calls #1808 independent, but #1807 and #1808 both conflict with this folder

**Location.** The description's merge-order paragraph: "#1101 → #1807 → this pull request … #1808 is independent of this pull request."

**Witness.** `overlaps.md` this round reports two conflicts:
- "#1807 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`";
- "#1808 and #1854 conflict in … `TauCetiRoadmap/CharacteristicClasses/README.md`".

`roadmaps show CharacteristicClasses --pr 1807` differs from this head's README in 31 lines; `--pr 1808` differs in 103.

**Repair.** State that this pull request's CharacteristicClasses folder supersedes the copies in #1807 and #1808, and say which branch is rebased onto which. Also name the TopologicalKTheory conflict with main (R04).

## Previous findings

- R01 — not repaired: `README.md:21–22` still reads "TopK T1.6a's positive-rank finite oriented carriers (orthonormal-frame quotients by SO(n)), their lifted finite cells". TopologicalKTheory `:116–117` still says "C1.1a supplies only the earlier finite oriented-cover and lifted-cell precursor".
- R02 — not repaired: `README.md:72` still reads "The separate AT supported-cellular supplement consumes C1.2a S0–S4". AlgebraicTopology `:1697–1698` still "owns the compactly supported local-coefficient cochain foundation".
- R03 — not repaired: `README.md:1585–1587` still reads "State as this item's own input, with hypotheses G compact and connected: the orthogonal splitting `𝔤 = 𝔷(𝔤) ⊕ [𝔤,𝔤]`".
- R04 — not repaired: `README.md:19` still reads "Its T6.4 supplies continuous principal/associated bundles and descent". TopologicalKTheory `:1109` at this head: "Let H be a compact Lie group". The merge conflict with main persists.
- R05 — not repaired: `README.md:2161–2162` still reads "Compare its pairing on a closed oriented twelve-manifold with IndexTheory I7.2's signature index formula."
- R06 — not repaired: `README.md:1` is still "# Characteristic classes and Chern–Weil theory", with 8 Checks blocks, 1 *Needs:* line and no Examples or Dependencies sections.
- R07 — not repaired: `README.md:944–945` still reads "isomorphisms `TauCeti.IsThomClass.pullback`", and `:1590` "of LieHighestWeight L9's `LieAlgebra.HasCentralRadical`". The docstring still lacks the two comparisons.
- R08 — not repaired: the gate still reports "outside-folder=2 … FAIL" (ArithmeticDirichletSeries and SymplecticGeometry).
- R09 — not repaired: the description still says "#1808 is independent of this pull request."

## Verified sound

### The change set

- `git diff 56715a57 HEAD -- TauCetiRoadmap/CharacteristicClasses` is empty.
- `git log 56715a57..HEAD` has six commits: 63ceb102 (AlgebraicCurves), 30817b18 (LocalPurity), 81fee5f3 (ReductiveGroups), c1040618 (BanachSpaceTheory), b9f2c11b (AlgebraicTopology, +74/−) and 59d8c400 (BordismFormalGroups).
- TopologicalKTheory, ClassifyingSpaces and IndexTheory have no change in this pull request since 56715a5. IndexTheory's own head moved to 6d85f5d4, and R05's witness lines are updated for it.
- No repair report since r47 marks any finding "not actionable", so nothing here is a re-raise.

### Changed sibling passages read against this roadmap

**AlgebraicTopology (b9f2c11b).**
- The change adds pinned names (`hasHomotopyExtensionProperty_skeletonLT`, `IsAspherical.of_basepoint`, `homotopicRel_skeletonLT_one_of_forall_homotopicRel` and `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex`), rewrites the uniqueness route of 8.8b, and adds a circle Check.
- The 8.8b interface this README consumes is unchanged. AT `:2466–2476` still constructs the normalized pointed comparison c_G:Z→Bπ for a Hausdorff CW K(G,1). AT `:158` still names CharacteristicClasses as the consumer of "Stage 8.8b's normalized ℤ/2 model".
- So this README's citations at `:66`, `:799` and `:819` resolve. For RP∞ with one 0-cell, the new native `homotopicRel_singleton_of_mapOfEq_eq_of_cwComplex` is exactly the uniqueness half that C1.5a's comparison uses.
- Stage 8 item numbers are unchanged (dependency table AT `:2948–2960`). Every AT8.x citation in this README resolves: lines 64–73, 792–820, 842–847, 929, 1373, 1390 and 1442.
- Stage 4.5 still owns the compact-generation coreflection, so `README.md:25–27` resolves.

**BordismFormalGroups (59d8c400).**
- It cites this roadmap at `:52`, `:141`, `:735`, `:766` and `:903` (C3), and at `:3004` and `:3011` (Conventions, "the standard character line").
- C3 states the Whitney laws and `H*(BO(n);F2)=F2[w₁,…,w_n]` (`:1335–1340`, `:1365`).
- Conventions `:199–203` and `:204–206` define the standard-character line class and `c₁(O(−1))=−h`, so the new contract resolves.
- This README cites no BordismFormalGroups item, so supply runs in one direction only.

**The other four changed folders.** AlgebraicCurves, LocalPurity, ReductiveGroups and BanachSpaceTheory: `grep -c CharacteristicClasses` gives 0 for each, and this README cites none of them.

### Main moved

origin/main is now b9ba334. `git log bbbde05..origin/main` touches CharacteristicClasses only through 2bec3fc8, which adds generated `PROGRESS.md` and `STATUS.md` files; they do not conflict with this head. TopologicalKTheory, LieGroups, AlgebraicTopology, AffineMorseLefschetz and SpinGeometry are unchanged on main since bbbde05.

### The gate

- The worker's gate at 59d8c40 has every check at 0 except `outside-folder=2` (R08), and `build=0`.
- Rerunning the brief's gate command gives `outside-folder=35`:
  - 33 of these are files of the sixteen other folders that the brief names as the pull request's own (`git diff --name-only origin/main...HEAD`, 37 files grouped by folder);
  - 2 are the same two files as R08;
  - 2 of the 37 are this folder's own files.
- The other 26 checks are 0.

### Elaboration

- `lake env lean TauCetiRoadmap/CharacteristicClasses/Suggested.lean` exits 0. The only warnings are `declaration uses sorry`, at 125:8, 149:8, 165:8 and 187:8.
- `#check @name` was run on all four theorems in a scratch copy (`scratch/signatures/SignatureCheck.lean`, identical to `Suggested.lean` plus the checks). The elaborated types equal those in `signatures.md` and r41:
  - `[FiniteDimensional ℝ F]`, `[Module.Projective K R]`, `[T2Space B]` and `hdim` are present;
  - nothing was dropped and nothing changed.
- The pins are identical to main's (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b).
- `Suggested.lean` is unchanged, so r41's one-tactic probe stands: `rfl`, `simp`, `infer_instance`, and `exact` with the pinned compact-base and section-vanishing lemmas each fail to close every theorem.

### Dependency check, run this round

```text
depcheck: 239 roadmaps, 2345 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. R01 and R05 are edges the check cannot see: it reads TopologicalKTheory from main, and IndexTheory is not on main.

### Overlaps

- The `overlaps.md` lead "SpinGeometry §G4.1a … main does not" is false. Main `TauCetiRoadmap/SpinGeometry/README.md:397` defines G4.1a, so this README's lines 1417, 1436 and 2346 resolve on main and do not depend on #1674.
- No id this README cites is dropped by an open pull request.
- The #1807 and #1808 conflicts are R09.

### Pinned declarations re-opened this round

- `TauCeti.IsThomClass.singularCohomologyMap` (EulerClass.lean:269) and `TauCeti.IsThomClass.pullback` (:327).
- `LieAlgebra.HasCentralRadical` (Mathlib Semisimple/Defs.lean:75).
- There is no `ChevalleyEilenberg` in either library.
- The 120-odd declarations r41 opened are cited unchanged, and the pins are the same.

### Cross-roadmap citations resolved this round

- TopologicalKTheory at this head `:75–81`, `:116–117`, `:380–387` and `:1105–1114`; main `:1286` and `:1309`.
- AlgebraicTopology at this head `:94–102`, `:158–166`, `:1685–1709`, `:2464–2490`, `:2538–2552` and `:2948–2960`.
- LieGroups main `:641`, `:655–656` and `:750`; main CharacteristicClasses `:1350`.
- IndexTheory head 6d85f5d4 `:237–239`, `:1371` and `:1390`.
- AffineMorseLefschetz main `:28`, `:152` and `:622` (C1.2a S0–S5).
- SpinGeometry main `:397`.
- BordismFormalGroups at this head, as listed above.

### Source spot check

The locators behind the changed AlgebraicTopology passage that this roadmap consumes were checked:
- Hatcher Proposition 1B.9 is on printed p. 90 (hatcher-at line 3884 for the page, line 3905 for the statement). It assumes a connected CW complex X and a K(G,1) target, as AT 8.8b restates. Its proof treats a single 0-cell first. For several 0-cells (lines 3938–3950) it uses a maximal tree and a deformation retraction of that tree onto x₀; AT's route of fixing the tracks at the 0-cells is a different route to the same result.
- Hatcher Proposition 0.19 is on printed p. 16 (hatcher-at lines 838 and 867).

The seeded sample (C1.0, C2.0, C5a.1–C5a.7, C7.AdjointHopfObstruction) is untouched text, checked at its locators in r41. For C7.AdjointHopfObstruction, r47 re-read zentner-instanton-sheet2 line 50.

### Adversarial table

No statement of this folder changed. The rows are carried from r41 (PRREVIEW-CharacteristicClasses_r41, "Adversarial table") and r47, each with its computed values. Two rows recompute the changed sibling interfaces that cite this roadmap or are cited by it.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| `existsUnique_…_thomPair_fiber` (L125), r41 | B=pt, rank 1; K=𝔽₂; rank 0 | o=ω gives u=g; o=−ω gives −g; over 𝔽₂, −g=g; rank 0: H⁰(pt,∅)=K | true; not one-tactic |
| `exists_isThomClass_of_orientation` (L149), r41 | B=ℝ trivial; zero ring; Möbius line | pullback of the generator; H=0, so span{0}=⊤; no orientation exists, so the hypotheses are unsatisfiable | true |
| `eulerClass_eq_zero_iff_exists_ne_zero` (L165), r41 | TS²; S²×ℝ²; O(1)_ℝ on CP¹; su(F) on HP¹ | e=2, no section; e=0, section; e=1, no section; rank 3 with a 4-cell violates `hdim`, and there e∈H³(S⁴)=0 with no section | true; `hdim` necessary |
| `not_exists_isImmersion_…` (L187), r41 | k=1, 2, 3; ℕ subtraction | targets ℝ², ℝ⁶, ℝ¹⁴; (1+a)³=1+a+a²+a³ gives w̄₃≠0 on ℝP⁴; 2^(k+1)≥4, so no truncation | true |
| C1.0 metric transport, r41 | H=diag(1,4); Sylvester | h₁(e₂/2,e₂/2)=1; eigenvalue sums 2, 3, 4 > 0 | correct |
| C1.1a carrier, r41 | r=N; added-line sign | `encard_univ_fullRank`=2; (−1)^(n−1) is −1 for n=2 and +1 for n=3 | correct; ownership is R01 |
| C1.2a S0–S4 vs AT supplement, r41 | C_K definition; H¹_c(ℝ) | both are C*(X,A∪(X∖K);L) (AT `:1709` at this head); x² acts by 0 on H¹_c(ℝ;ℤ)=ℤ | same object, two owners (R02) |
| C1.5a ↔ AT8.8b, recomputed for b9f2c11b | RP∞→Bℤ/2; AT's circle test with 0-cells ±1 | [RP∞,Bℤ/2]_* ≅ Hom(ℤ/2,ℤ/2) has 2 elements, as does H¹(RP∞;𝔽₂); g(z)=z^k·exp(iπ(1−Re z)/2) has g(1)=1, g(−1)=−(−1)^k and degree k, since the factor goes through Re z∈[−1,1]; the homotopy at t=0,1 gives f and g, fixing 1 | consistent; AT supplies the uniqueness C1.5a uses |
| C2.0 cells, r41 | rank 0; TS²; v=(1,1) | S(E)=∅; Thom cells in degrees 2 and 4; image (1,1)/√2 has ‖·‖₂=1 | correct |
| C3 and Conventions ↔ BordismFormalGroups, recomputed for 59d8c400 | BO(1), BO(2); λ=O(−1) on CP¹ | 𝔽₂[w₁]; 𝔽₂[w₁,w₂] has dimensions 1, 1, 2, 2, 3 in degrees 0–4, the coefficients of 1/((1−t)(1−t²)); e(λ)=c₁(O(−1))=−h with ⟨h,[CP¹]⟩=1, as BFG `:3005` states | contracts at BFG `:141` and `:3011` resolve |
| C5a.1 CE complex, r41 | degree 1; SU(2); torus | (−1)a([X,Y]) equals Mathlib's −f⁅x,y⁆; H¹(SU(2))=0; torus H¹=𝔤* | correct |
| C5a.3 Weil algebra, r41 | F_t endpoints | F_t=tΩ+½(t²−t)[θ,θ]; F₀=0, F₁=Ω | correct |
| C5a.6–7 Poincaré series and degrees, r41 | SU(2), U(2), E8 | 1+t³; (1+t)(1+t³); 3+15+23+27+35+39+47+59=248 | correct |
| C5.1 splitting, r41 | SU(2) Killing form | κ(e₁,e₁)=−8<0 | same object as LieGroups 5A (R03) |
| C7.1 L₃, r41 | CP⁶; HP³ | (2170−1911+686)/945=1; (496−624+128)/945=0 | correct |
| C7.AdjointHopf, r41 and r47 | roots; HP¹ | e₂(0,x−y,y−x)=−(x−y)² gives p₁=c₁²−4c₂; ⟨p₁,[HP¹]⟩=−4; matches zentner line 50 | correct |

**Remarks on untouched text** (no R-number): none beyond r41's.

## Not verifiable

- These texts are settled `uncertified` in the manifest and cited by locator; they were not read:
  - Milnor–Stasheff (§§4, 10, 12, 15, 18, 19);
  - Milnor, *Topology from the Differentiable Viewpoint*, §6;
  - Milnor, *Construction of Universal Bundles II*, §§2–3;
  - Bott–Tu.

  r41's table checks the mathematics of those headlines independently.
- tom Dieck 14.4.3 (C1.1b) and May Chapter 16 (C1.2b) are outside the seeded sample and were not read.
- Ownership against open pull requests was checked through the listed sibling checkouts and `roadmaps show`/`roadmaps grep` only for the objects in R01–R05.

## Source issues

- **Misprint** in zentner-instanton-sheet2 at Exercise 2, p. 1: the source calls the endomorphisms defining su(E) "skey-adjoint"; it should say skew-adjoint; affects nothing.
- **Gap** in zentner-instanton-sheet2 at Exercise 2(b), p. 1: the source derives the integral identity for p₁(su(E)) through the Chern character, which sees classes only modulo torsion; it should use the integral splitting principle with roots 0, ±(x−y), or assume torsion-free H⁴; affects the proof.
