# Review of SpinGeometry (pull request #1674 at 49fce1a)

**Verdict:** accepted

This is an incremental re-review of `TauCetiRoadmap/SpinGeometry/` at 49fce1a9: 92 changed lines since 58f89ec, the head review ~29 read. No finding remains and the gate passes, so the folder is ready for a human's final approval. The AI does not approve or merge.

## Previous findings

- R01 — repaired: `README.md:1623–1628` "Equivalences preserve the frame map and hence this orientation … The torsor of G4.4 and the counts of G4.4–G4.4a are those of one fixed orientation."; `:1735` "Fix an orientation of V. Given one lift of Fr⁺_SO(V) for it".

The repair applies all three requested steps and introduces no new problem:

- G4.2 (`:1623–1628`) states that the classes of full-frame structures are the disjoint union, over the orientations of V, of the lift classes of Fr⁺_SO(V), and that a non-orientable V has none.
- G4.4 fixes the orientation in the API bullet (`:1732`), the construction (`:1735`) and the torsor statement (`:1743–1745`, "free and transitive on the equivalence classes of lifts for that orientation").
- G4.2 has the new Check (`:1666–1675`) with the two refuting instances of review ~29: the point with V=ℝ² (two classes, one per orientation) and S¹ with V=TS¹ (four classes, two per orientation).
- Every count that the repair touches now names its orientation: G4.2 `:1661–1665`, G4.4 `:1770–1775`, G4.4a `:1788`, `:1809`, `:1851–1856`, `:1875–1879`, and G5.3 `:2104–2106`.
- `Suggested.lean` changes only two docstrings (the module docstring's G4.3/G4.4 item and the `SpinStructure` docstring). No signature changed.

## Verified sound

**Head, scope and gate.**
- `git rev-parse HEAD` is 49fce1a9 and the worktree is clean. The pins are Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/SpinGeometry'` is empty. `git diff --stat 58f89ec HEAD` shows only `README.md` (80 lines) and `Suggested.lean` (12 lines) of this folder.
- My own gate run ends `OK` with every check at 0 (set_option, sorry-data, imports, lean-lines, statement-hygiene, readme-ids-missing, layer-ids, target-ids, depcheck, stray-files, outside-folder among them). The worker's run adds `build=0`.

**Dependency check** (the required command):

```text
depcheck: 233 roadmaps, 2264 edges, 0 problem(s)
```

There is no UPWARD, CYCLE or `moved:` line. The diff adds no `*Needs:*` item and no supplier citation; the only cross-roadmap names in the changed lines (CharacteristicClasses C7.3, TopologicalKTheory T6.4, SpinRepresentations Layer 2) were already there and were resolved on main by review ~29.

**Build and signatures.**
- `lake env lean TauCetiRoadmap/SpinGeometry/Suggested.lean` exits 0. Its only output is `129:8: warning: declaration uses 'sorry'`.
- I elaborated a scratch copy with `#check @SpinStructure` and `#check @nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul`. Both types are identical to those review ~29 recorded and to the README statement in G4.4a (`:1844–1848`): a Hausdorff `Topology.CWComplex` base in `Type`, `finrank ℝ F = 2`, `IsContinuousRiemannianBundle`, `IsThomClass F E u`, conclusion `Nonempty (SpinStructure F E 2) ↔ ∃ c, eulerClass … u = 2 • c`. Nothing changed and no binder is lost.
- The "`of` (class, line 54)" entry of the worker's signature list is a false lead: the word comes from the module docstring ("class of a real vector bundle"), not from a declaration.
- Imports are `Mathlib` plus the same four Tau Ceti modules. There is no `set_option`, no `lemma`, no `variable` block and no sorry'd data.

**Padding probe.** On a scratch copy I replaced the headline's `sorry` with `simp`, `rfl`, `infer_instance`, `exact Iff.rfl` and `constructor <;> intro h <;> simp_all`. All five fail. The file still holds one definition and one headline; the headline list and the "not statable" list are those of review ~29, with the G4.4 item now reading "the `H¹(X; ℤ/2)` torsor of the spin structures of a fixed orientation".

**Sources for the changed passages** (the sampled targets 4.2, 4.4 and 5.3 fall in the diff; printed page = PDF page − 12 for `nicolaescu`).

| Target | Locator in README | Source line (printed page) | Supports the statement? |
| --- | --- | --- | --- |
| G4.2 Check, circle | Nicolaescu, Exercise 12.2.30, p. 670 | `nicolaescu` line 30984 (running head 670 at 30983) | yes: two spin structures on S¹; the source's manifolds are oriented (Prop. 12.2.25, line 30950), which is the fixed orientation the Check now names |
| G4.2 principal description | Kirby, Chapter IV, p. 33 | `kirby` lines 1133–1139 | yes: orientation as a reduction to SO(n) first, then a Spin(n) covering; Spin(1)=ℤ/2 (line 1137) |
| G4.4 torsor | Nicolaescu, Remark 12.2.28 and Exercise 12.2.29, p. 669 | `nicolaescu` lines 30957–30981 | yes: H¹(M,ℤ₂) acts by multiplying the lifted cocycle, freely and transitively (line 30980), for an oriented M |
| G4.4 three-torus | Nicolaescu, Exercise 12.2.35, p. 673 | `nicolaescu` lines 31121–31126 | yes: eight structures, a bijection with H¹(T³,ℤ₂) from the Lie framing |
| G4.4a, H¹ classification | Kirby, Chapter IV, pp. 33–34 | `kirby` lines 1157–1158, 1163–1164 | yes: spin iff w₂=0, then structures correspond to H¹(X;ℤ/2), for an oriented bundle (line 1155) |
| G5.3 Check | Nicolaescu, Example 12.1.54, pp. 648–649 (untouched locator) | carried from review ~29 | yes |

The twelve other sampled targets (1.1, 1.4, 2.3, 3.1, 3.2, 4.1, 4.3, 5.0, 5.2, 6.0, 6.5, 6.6) lie outside the diff; their text is byte-identical to the head review ~29 read.

**Adversarial table: changed statements.** Every value below was computed this round.

| Statement | Instances | Values on each side | Result; change |
| --- | --- | --- | --- |
| G4.2 class decomposition (`:1623–1627`) | X=pt, V=ℝ²; S¹, V=TS¹; non-orientable V (Möbius line bundle); disconnected X=pt⊔pt, V=ℝ² | pt: 2 orientations × 1 lift class = 2, matching the two components of O(2). S¹: 2 × \|H¹(S¹;ℤ/2)\|=2 × 2 = 4. Möbius: local sections of P give continuous local frames of one sign, hence a global orientation, a contradiction; 0 structures. pt⊔pt: 4 orientations × 1 = 4 = 2 per point, squared | holds; none |
| G4.2 Check, rank one (`:1670–1673`) | n=1, g=−1 ∈ Spin(1) | the vector action of ±1 on ℝ¹ is the identity, so the frames of p and p·(−1) agree: the frame map is constant on fibres, and the structure is an orientation plus a double cover | holds; none |
| G4.2 Check, wrong reading (`:1673–1675`) | pt and S¹ | one H¹ torsor would give \|H¹(pt)\|=1 against 2, and \|H¹(S¹)\|=2 against 4 | discriminates; none |
| G4.2 Check, circle (`:1661–1665`) | S¹; a simply connected base | S¹: 2 double covers for the fixed orientation. Simply connected X: H¹(X;ℤ/2)=Hom(π₁,ℤ/2)=0, a line bundle is trivial, so 1 per orientation | holds; none |
| G4.4 torsor, fixed orientation (`:1735–1745`) | pt (n=2); S¹ (n=1); the twist by ε | pt: 1 class = \|H¹\|=1. S¹: 2 = \|H¹\|=2. Twisting multiplies transitions by central ±1, which acts trivially on frames, so the frame map and its orientation are unchanged | holds; the witness of ~29 R01 no longer refutes it |
| G4.4 Check counts (`:1770–1775`) | S¹, T², Sⁿ (n≥2), tangent bundles | fixed orientation: 2, 4, 1 (\|H¹\|=2, 4, 1). Connected orientable bases have 2 orientations, so full-frame structures number 2·2=4, 2·4=8, 2·1=2, as stated | holds; none |
| G4.4a rank one and TS² (`:1851–1856`, `:1875–1877`) | TS² with either orientation; rank one over S¹ | TS²: e=±2=2·(±1), H¹(S²;ℤ/2)=0, so 1 structure per orientation, 2 in all. Rank one over S¹: an orientation trivializes V, 2 lifts for it | holds; none |
| G4.4a Check, rank three on S¹ (`:1878–1880`) | trivial ℝ³ bundle, standard orientation | π₁SO(3)=ℤ/2 gives 2 loop classes, 2 skeletal classes, 2 lifts = \|H¹(S¹;ℤ/2)\|; constant frames see 1 | holds; none |
| G5.3 Check (`:2104–2108`) | S² with E=TS²; flat T² | c₁=2, no 2-torsion in H²(S²;ℤ)=ℤ, one root (c₁=1) for the orientation of J; reversing J gives E̅ with c₁=−2 and root −1, the other orientation's structure. T²: 4 flat roots = \|H¹(T²;ℤ/2)\| | holds; none |
| `SpinStructure` docstring (`Suggested.lean:85–87`) | n=2 over a point; n=1 over S¹ | the structure chooses the orientation (2 classes over the point, 4 over S¹); equivalences preserving `toFrame` preserve it; H¹ acts on the classes of one orientation (1 and 2) | agrees with G4.2 and G4.4; none |
| Headline `nonempty_spinStructure_iff_exists_eulerClass_eq_two_smul` against the changed text | TS²; e=1 on S²; u↦−u | TS²: e=±2, both sides true for either orientation. e=1: 1∉2ℤ, both false. −u gives −e, divisibility unchanged, so "exists for either orientation" (`:1849–1851`) is consistent with the new per-orientation counts | holds; statement untouched |

**Adversarial table: untouched statements, carried forward.** The rows of review ~29 for G1.1 (Pauli dictionary, bivector sign), G1.2 (Fock metric, Gram determinant), G1.3, G1.4, G2.1, G2.2, G2.3, G3.1, G3.3, G3.4, G4.1, G4.2 metric change (B=diag(4,1)), G5.0, G5.1, G5.2, G5.3 roots (ρ(z), ℝP³, e=1), G6.0, G6.1, G6.2, G6.3, G6.4, G6.6 and G6.7 stand as recorded there, with their computed values; the diff touches none of those statements. The ~29 rows "`SpinStructure` (G4.2)" and "G4.4 torsor", which ended in R01, are replaced by the rows above.

**Overlaps (all 7 items re-checked).**
- **#1780.** Its README at its head is identical to `4e5e6a06:TauCetiRoadmap/SpinGeometry/README.md`, an ancestor of this head. The description's merge-order block states "#1780 → this pull request".
- **`#k5-compact-hermitian-elliptic-theory-and-serre-duality`** (`README.md:500`). Dropped by ComplexKahlerGeometry's four open revisions, each of which maps K5 to its Layer 5, as review ~29 recorded; the citation needs no change.
- **Anchors this pull request drops** (`#g1-…`, `#g4-…`). The former-heading table (`:519–526`) maps G1–G6 to Layers 1–6, and the G labels stay in the subsection headings.
- **Closest open roadmaps.** The diff adds no object: it scopes existing statements to a fixed orientation. Ownership is as review ~29 found it.

**Pull-request description.** The diff makes no sentence of it wrong. "The text explains its two differences from the numerable, oriented definition" still holds, and the G4.4 paragraph describes the twist construction, which is unchanged.

**Remark on the changed docstring, no change requested.** `Suggested.lean:86–87` says the "torsor acts on the classes of one orientation"; I read it as the action of H¹(X;ℤ/2) whose orbit is that torsor, which is what G4.4 states.

## Not verifiable

- Lawson–Michelsohn (Theorem II.1.7 and Chapter II §1, cited in the changed G4.2 and G4.4 passages) and Atiyah–Bott–Shapiro are settled in the manifest as `uncertified`. They are cited by locator only and I did not open them.
- The Kirby text is an OCR of an image-only scan. Lines 1141 and 1156 are garbled; I relied only on the legible lines quoted above.

## Source issues

- **Error** in nicolaescu at Example 12.2.31(d), p. 670: the source says w₂(ℝPⁿ)=0 exactly when n≡3 mod 4; it should say that ℝPⁿ (n≥2) is spin exactly when n≡3 mod 4, since w₂ also vanishes for n≡0 mod 4; affects nothing.
- **Misprint** in nicolaescu at Example 12.1.54, p. 649: the source names the squaring map's domain Spin(1); it should be Spin(2), the example being the case n=2; affects nothing.
