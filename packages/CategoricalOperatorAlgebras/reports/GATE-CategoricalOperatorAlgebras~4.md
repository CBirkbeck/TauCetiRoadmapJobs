# GATE-CategoricalOperatorAlgebras~4: answers to human review

Reviews answered: one comment by roed-math (2026-11-06T06:13:57Z), two points. The closing sentence
of that comment (the label change to `awaiting-author`) is a status note, not a finding. Commit:
`acb81cf5` on top of `79cccda`; only `TauCetiRoadmap/CategoricalOperatorAlgebras/README.md` changed.
`Suggested.lean` is unchanged: it declares nothing, and the edits add no backticked name of this
roadmap.

## H01 (roed-math) — applied differently

CA1a/CA2a stays the single owner. Main's QuantumGroups already consumes it: its supplier row at
`TauCetiRoadmap/QuantumGroups/README.md` line 42 on main (eaf17b1) reads "CategoricalOperatorAlgebras
CA1a,CA2a", and its lines 61, 253, 260, 420 and 850 use CA1/CA2a. A revision pull request is never
cited, so the downstream entry stays, and the Scope now names the owner. README line 53–59: old "CA1–CA6
supplies their tensor-category inputs" (an overclaim: main's QuantumGroups uses only CA1a and CA2a) → new
"C*-categories, their finite additive and Karoubi completion and the finite-Hilbert and Hilbert-module
examples (CA1a), and C*-tensor categories with solutions of the conjugate equations, standard solutions
and intrinsic dimension, unitary dual functors and signed self-dualities (CA2a) have their single home
here; QuantumGroups consumes CA1a and CA2a". The downstream line (now lines 1631–1633) lists what
main's QuantumGroups row consumes. Dropping QuantumGroups from the downstream list, as the comment
suggests if #1649 keeps its §0.3, would make this README disagree with QuantumGroups as it is on main.
The duplication can only be removed on the QuantumGroups side, and two open revisions carry it, not
one: #1649 §0.3 "C*-categories and standard conjugates" (head 968db79, lines 236–278) and #1705
§0.2 with the same title and content (head a938955, lines 194–242). Both drop main's
CA1a/CA2a supplier row. The single-owner repair is for both revisions to restore that row and delete
the section, consuming CA1a/CA2a once this roadmap is ahead of them in the merge order (it is at
`ORDER.txt` line 221; QuantumGroups is on main and its revisions are not in the order).

Why this roadmap and not QuantumGroups owns the material: the objects (dagger and C*-categories, unitary
Karoubi splitting, standard solutions, unitary dual functors, signed Frobenius–Schur data) are general
operator-algebraic category theory with no quantum-group input. A second consumer,
TemperleyLiebOperatorAlgebras (#867, head 7cf3fee), consumes them from CA1a/CA2a (its §3.2 *Needs*
line: CA1a; §3.3 *Needs* line: CA1a, CA2a; supplier contract lines 323–329). Subfactors on main (line
72–73) also assigns pivotal module C*-categories to this roadmap. If QuantumGroups owned them,
TemperleyLiebOperatorAlgebras would have to import C*-categories from a quantum-group roadmap's Layer 0.
CA2a is also strictly wider than the QuantumGroups sections on the multitensor side: it has Penneys's
classification of unitary dual functors by positive characters of the universal grading groupoid,
with a non-simple unit. #1705 §0.1 (Hilbert-module operators, owned by HilbertModules H1–H3) and §0.3
(positive Temperley–Lieb completions, owned by Subfactors 3.3 and TemperleyLiebOperatorAlgebras Layer 3)
re-own other foundations the same way. That is outside this roadmap's files.

## H02 (roed-math) — applied

At the reviewer's pin b0e66ea6, #867 has no A-labels: its Layer 3 is headed at line 1223 and there is
no label table. The current head 7cf3fee adds a former-label table (line 390, "A6 → Layer 3
(3.1–3.4)"), but a citation names the section. All three occurrences are replaced with the subsections
whose *Needs* lines actually consume this roadmap. CA1a line 164: "TemperleyLiebOperatorAlgebras A6
consumes the C* portion" → "TemperleyLiebOperatorAlgebras 3.2–3.3 consumes the C* portion for the
unitary Temperley–Lieb category". CA2a line 313: "TemperleyLiebOperatorAlgebras A6 instantiates this
layer" → "TemperleyLiebOperatorAlgebras 3.3 instantiates this layer directly on the unitary
Temperley–Lieb category". Downstream lines 1634–1636: "TemperleyLiebOperatorAlgebras Layer 3 consumes
CA1a's C*-category interfaces (3.2–3.3) and CA2a's dagger tensor and unitary-duality interfaces
(3.3)". TL 3.1's and 3.4's *Needs* lines cite neither CA1a nor CA2a, so the citation is 3.2–3.3, not
3.1–3.4.

The same stale-ownership pattern was in the Scope and is repaired. Old (lines 55–58): "The positive
Temperley–Lieb quotients, their C*-towers and the unitary TL category are owned by
TemperleyLiebOperatorAlgebras". At #867's head, TL's Scope assigns the quotients `Q_n` and the
C*-inductive limit `B_δ` to Subfactors 3.3, which on main is headed "Positive path models, Jones
quotients and their C*-tower" (line 774). New (lines 60–64): "The positive Temperley–Lieb quotients and
their C*-inductive limit are Subfactors 3.3. The unitary Temperley–Lieb category is
TemperleyLiebOperatorAlgebras Layer 3, which consumes CA1a (3.2–3.3) and CA2a (3.3)". In the same
sentence "directly from Subfactors Layer 6" → "directly from Subfactors 3.2 and 6.1", the two
subsections CA8 actually cites (README lines 963–967).

A note outside this roadmap's files: TL 3.4 re-proves CA1a's facts that an idempotent in a
finite-dimensional C*-algebra is similar to a self-adjoint projection and that two splittings of a
projection are unitarily equivalent, and does not cite CA1a for them.

## Pattern search

- Every other cross-roadmap label in the README resolves at its copy: on main, VonNeumannAlgebras
  V4–V6, V11–V13 (main uses the V0–V13 labels, Layers 12–13 at lines 3388 and 3688), FreeProbability
  F2–F4, OperatorAlgebraDynamics D6, PivotalSpherical Layers 0–4 and 9, and Subfactors 1.1–1.2,
  2.1–2.5, 3.2, 5.1, 6.1–6.4, 7.1–7.2, 8.1–8.2 and 9.1–9.2; at their heads, HilbertModules H1–H3
  (#861 bbc2ad5), CStarAlgebras C1–C5 (#860 33ddcef) and OperatorKTheory K1–K6 (#866 d1b2465).
  `roadmaps resolve` on the edited README reports no unresolved citation and no unresolved Lean name.
- Roadmaps that cite this one (`roadmaps grep CategoricalOperatorAlgebras`): QuantumGroups and
  Subfactors on main, TemperleyLiebOperatorAlgebras #867, and OperatorAlgebraDynamics #1137, which
  lists this roadmap as a consumer of its D-layers. So the downstream list (QuantumGroups,
  TemperleyLiebOperatorAlgebras) is complete.
- Ownership against open pull requests: checked against the sibling checkouts this brief lists for
  QuantumGroups (#1649, #1705), TemperleyLiebOperatorAlgebras (#867), HilbertModules (#861),
  CStarAlgebras (#860), OperatorKTheory (#866), CStarClassification (#863), VonNeumannAlgebras
  (#1041) and OperatorAlgebraDynamics (#1137), and through `roadmaps grep`. No other open roadmap
  re-owns CA1a/CA2a.

## Adversarial pass on changed statements

The edits change ownership and citation statements, not mathematics. Each row records what the cited
text says at the copy named.

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| TL 3.2–3.3 consumes CA1a | TL #867 head 7cf3fee *Needs* lines of 3.1, 3.2, 3.3, 3.4 | 3.1: TemperleyLieb L3, L6, 1.1, 1.3, Subfactors 3.3 (no CA); 3.2: "CategoricalOperatorAlgebras CA1a"; 3.3: "CA1a, CA2a"; 3.4: 3.1–3.3, TemperleyLieb L7, PivotalSpherical, Subfactors 3.3, 1.3 (no CA) | holds for 3.2–3.3, fails for 3.1–3.4 | cite 3.2–3.3, not the reviewer's `Layer 3` range or the former-label table's 3.1–3.4 |
| TL 3.3 instantiates CA2a | TL 3.3 body and *Needs* | body: "Instantiate CategoricalOperatorAlgebras CA1a's C*-category and CA2a's dagger tensor and unitary-duality interfaces on UTL_δ"; 3.2 *Needs* has no CA2a | holds only for 3.3 | CA2a line 313 cites 3.3 |
| Positive TL quotients and C*-inductive limit are Subfactors 3.3 | Subfactors main §3.3 heading and TL #867 scope | main line 774 "Positive path models, Jones quotients and their C*-tower"; TL scope: "the C*-inductive limit `B_δ` … (3.3)" assigned to Subfactors Layer 3 | holds; old claim (owned by TL) fails | Scope repaired |
| CA8 builds TL(δ) from Subfactors 3.2 and 6.1 | CA8 prose, README 963–967 | cites "Subfactors 6.1's shaded TL planar algebra example" and "positivity … from Subfactors 3.2 and 6.1"; no other Layer 6 subsection | holds; "Layer 6" was wider than used | Scope now "3.2 and 6.1" |
| QuantumGroups consumes CA1a and CA2a (not CA1–CA6) | main QuantumGroups, all `CA[0-9]` hits | line 42 "CA1a,CA2a"; 49, 61, 253, 260, 420 CA2a; 850 "CA1's analytic dagger"; no CA2b or CA3–CA10 | old "CA1–CA6" fails; "CA1a and CA2a" holds | Scope repaired |
| Listed QuantumGroups inputs exist in CA1a/CA2a | main QuantumGroups row 42 vs README | finite-Hilbert dagger category: CA1a "examples from finite Hilbert spaces"; unitary rigid tensor categories: CA2a first paragraph; chosen conjugates: CA2a "solutions of the conjugate equations"; signed self-duality: CA2a `r̄ r=ε φ_x`; standard solutions and intrinsic dimension: CA2a "standard/balanced solutions … dimension", "positive intrinsic dimension" | all six present | downstream bullet lists them |
| CA1a/CA2a ownership is single (no other open owner) | `roadmaps grep` for C*-category / standard-solution sections; #1649 §0.3, #1705 §0.2 | two duplicate sections, both in QuantumGroups revisions that drop main's CA1a/CA2a row; no other copy | duplication is on the revision side | reported under H01; no edit possible in these files |

## Lean check

`Suggested.lean` declares no name, so there is no `#check @name` to compare. The module docstring is
unchanged, and none of the edits touches a headline or a carrier.

## Build and gate

- `lake build TauCetiRoadmap.CategoricalOperatorAlgebras.Suggested`:
  `✔ [8976/8976] Built TauCetiRoadmap.CategoricalOperatorAlgebras.Suggested (20s)` /
  `Build completed successfully (8976 jobs).`
- Depcheck (`gate --depcheck … --movable`): `depcheck: 239 roadmaps, 2359 edges, 0 problem(s)`. No
  UPWARD, CYCLE or moved line.
- Gate after commit `acb81cf5`:
  `gate CategoricalOperatorAlgebras: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0
  sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0
  lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0
  round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0
  outside-folder=0 source-material=0 OK`

No source was fetched or newly cited, and nothing was added to `needs-references.toml`. No suspicious
instruction appeared in the review text.
