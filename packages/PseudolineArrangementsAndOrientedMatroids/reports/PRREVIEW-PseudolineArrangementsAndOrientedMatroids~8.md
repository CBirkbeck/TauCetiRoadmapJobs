# Review of PseudolineArrangementsAndOrientedMatroids (pull request #1523 at 47f86a6)

**Verdict:** needs changes

This is an incremental re-review of the 11 lines of `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/`
changed since 1ac270d. The change touches only `README.md`: the RootSystems bullet of Scope (line 58–62) and the last
sentence of the RootSystems supplier contract (line 202). `Suggested.lean` is byte-identical to
1ac270d, the pins are unchanged (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`), and no file outside the folder
changes. The previous finding is repaired. The sentence its repair added about longest
elements is contradicted by Layer 4 and 9.5 of this roadmap (R01).

## R01 (P3) — Scope says longest elements are not used here, but 4.1–4.2 and 9.5 are built on two of them

Location: `TauCetiRoadmap/PseudolineArrangementsAndOrientedMatroids/README.md` line 61–62: "Longest
elements and chambers belong to Mathlib and Tau Ceti, through RootSystems' supplier contracts, and
are not used here."

Claim: this roadmap uses no longest element, and the longest elements are the pinned libraries'.

Witness: `Suggested.lean` line 576 calls `hemiW₀ = (s₀ s₁ s₂)⁵` (9.5) "the longest element … of the
icosahedral group". Computed: it has length 15, the maximum, and equals `−1`. Wiring diagrams
(Convention 8, 4.1–4.2, line 127, 749, 768) are reduced words of the longest permutation
`Fin.revPerm`.

Neither pin has the longest element of `H₃`. Tau Ceti's `TauCeti.longestElement`
(`TauCeti/LinearAlgebra/RootSystem/LongestElement.lean` line 197) is an element of `P.weylGroup`
under `[P.IsCrystallographic]` (line 128). `H₃` has a Coxeter entry `5`, so it is not the Weyl group
of a crystallographic root pairing. Mathlib's `GroupTheory/Coxeter` has no longest element. So
both halves of the sentence fail for `H₃`: 9.5 has to define `hemiW₀` itself, and does.

Repair: replace line 61–62 with: "Tau Ceti's longest element and dominant chambers of the Weyl
group of a finite crystallographic root pairing (`TauCeti.longestElement`,
`RootPairing.dominantChamber`), which RootSystems consumes, are not used here: the longest
permutation enters Layer 4 as Mathlib's `Fin.revPerm`, and the longest element of the
non-crystallographic `H₃` enters 9.5 as the explicit word `hemiW₀`."

The replacement was tested on the instances that refuted the original:
- Both names resolve at the pin: `longestElement` is in `namespace TauCeti` (line 81, def line 197), and `dominantChamber` is in `namespace RootPairing` (`Chamber.lean` line 97, def line 141).
- `Fin.revPerm` is Mathlib's `Data/Fin/Rev.lean` line 40, used directly by 4.2.
- `hemiW₀` is declared in `Suggested.lean`, so the gate's name check holds.
- The Scope then agrees with `Suggested.lean` line 576.

Deleting the sentence outright would also clear the finding: the bullet would then credit RootSystems with nothing it does not own.

## Previous findings

- R01 — repaired: line 58–60 "RootSystems owns the general Coxeter geometric sign and
  faithfulness theorems (its Layer 1) and the marked Weyl presentation (its Layer 2); its §1.3
  owns …"; line 202 "Its Layer 2 is named in Scope and not used." The new sentence at line 61–62
  is R01 of this report.

## Verified sound

**The changed passages, at this head.**

- **Layer 1, Layer 2 and §1.3 resolve on main.** File: `TauCetiRoadmap/RepresentationTheory/RootSystems/README.md` at `eaf17b1`.
  - Scope line 13–14 owns "the general Coxeter geometric sign and faithfulness theorems".
  - Line 248 is "Layer 1: geometric roots and faithful representations", with §1.2 "Rank-two positivity and the sign/length theorem" (line 282) and §1.3 "Faithfulness and transport" (line 335).
  - Line 432 is "Layer 2: the marked Weyl presentation".
  - Line 337–339 is `geometric_faithfulness` (Humphreys §5.4, Corollary, p.113; "arbitrary-index extension as in §1.2").
  - Line 357–359 is the transport to `I → ℝ` through `Finsupp.linearEquivFunOnFinite`.
  - Its `Suggested.lean` line 59–61 states `Function.Injective cs.geometricRepresentation` for every `cs : CoxeterSystem M W`.
- **The same citations hold at the head of the open RootSystems revision (`16d2d99a`).** Scope line 16–18 assigns the sign and faithfulness theorems to Layer 1 and "the consumer interface of the marked Weyl presentation" to Layer 2. Layer 1 is at line 428, §1.3 at line 515 and Layer 2 at line 614, and `geometric_faithfulness` is in its `Suggested.lean` line 73. The overlaps tool lists no dropped id, so the citation survives that merge either way.
- **"Its Layer 2 is named in Scope and not used" (line 202) is true.** Every RootSystems mention in the folder is either the Scope bullet or §1.3: README line 58, 59, 199, 1385, 1392, 1395 and 1426, and `Suggested.lean` line 80 and 615. No `*Needs:*` line cites RootSystems Layer 2.
- **The chamber half of line 61–62 is right.**
  - "chamber" occurs only at line 61 in the folder.
  - RootSystems' chambers are the dominant cones of a root pairing (Tau Ceti `RootPairing.dominantChamber` and `openDominantChamber`, `Chamber.lean` line 141 and 144).
  - The topes of Layer 2 are a different object.
  - Mathlib has no chamber under `LinearAlgebra/RootSystem` (grep: 0 hits).
  - Side note: RootSystems' own contract (main line 191) writes `TauCeti.dominantChamber`; that is RootSystems' text, not this roadmap's.
- **10.2, from the seeded sample.** It names the source of each of its claims.
  - The orders are Tau Ceti `CoxeterSystem.orderOf_simple_mul_simple` (`TauCeti/GroupTheory/Coxeter/Geometric.lean` line 525, `orderOf (cs.simple i * cs.simple i') = M i i'`, no hypothesis beyond the Coxeter system).
  - The faithfulness goes through 10.1, which cites RootSystems §1.3.
  - Hypotheses: the consumer works only at `Fin (n + 1)` (`geometricRepresentationFun` carries `[Finite B]`, signatures list), inside the finite-rank setting of the Humphreys locator in any reading of its standing assumptions. The arbitrary-index extension is RootSystems' own claim.
  - Values are in the table below.
- **9.5's Check, recomputed.** The image of the geometric representation of Mathlib's `CoxeterMatrix.H₃` (entries `3, 5, 2`, `Mathlib/GroupTheory/Coxeter/Matrix.lean` line 260) has 120 elements, and its centre is `{I, −I}`.
- **Pull-request description.** The description, outside the folder, still describes the retired `gap:coxeter-geometric-faithfulness`. It is not a finding. A human approver will read it, though, so it should say what line 199–202 now says.

**Gate, dependency check, elaboration.**

- **The worker's gate** at 47f86a6: every counter 0, `build=0`, OK.
- **My run of the brief's command** (`gate … --base origin/main`, the configured merge order): every counter 0 except `depcheck=1`, "NOT IN ORDER: PseudolineArrangementsAndOrientedMatroids (insert it after its last supplier)". The configured order does not list the folder yet, which is not a defect.
- **The same run with `--order merge-order-candidate.txt`:** `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`, exit 0.
- **The dependency check** (`gate --depcheck … --movable`) printed `depcheck: 240 roadmaps, 2428 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. The folder is at line 392 of the candidate order.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits 0 with 28 warnings, all "declaration uses `sorry`", and no other message.
- **Diffs:** `git diff --stat origin/main...HEAD` outside the folder is empty, and `git diff 1ac270d4 HEAD -- Suggested.lean` is empty.
- **Carried forward:** the pins are unchanged, so the previous rounds' one-tactic probe (28 sorried theorems, none closing in one tactic) and binder comparison (73 declarations, none lost a binder) still hold. I re-read the elaborated types of `hemiW₀ : CoxeterMatrix.H₃.Group`, `center_eq_zpowers_hemiW₀`, `geometricRepresentationFun` (with `[Finite B]`) and `geometricRepresentationFun_cartographic_injective : ∀ n, Function.Injective …`.

**Headlines.** The list is unchanged: the covector axioms, the walls theorem, Sylvester–Gallai, the Felsner–Weil bijection, stretchability, the non-Pappus results, the hemi-icosahedron, the torus group order and cartographic faithfulness are all stated. The module docstring (`Suggested.lean` line 60–80) names the headlines that cannot be stated at the pins, with the carrier each lacks, and names RootSystems §1.3 as the supplier of the faithfulness.

**Ownership and overlaps.**

- **Overlaps tool:** no open pull request changes this roadmap, no id is dropped in either direction, and the closest roadmaps are #271 SurfaceTopology and #1196 RootSystems.
- **Single owner:** RootSystems owns the Coxeter faithfulness theorem, and this roadmap consumes it rather than re-planning it.
- **Citation leads:** the citations tool finds no cross-roadmap citation that resolves nowhere. The two Lean-name leads in the supplier contracts (README line 185–186, `BipartiteRibbonGraph.toCombinatorialMap` and `…eulerChar_toCombinatorialMap`) resolve at the SurfaceTopology head of #271 (its README line 420 and 426).

**Sources.** I checked the seeded sample only where it falls in the changed passages or their dependents: 10.2 (above). The other sampled targets (0.1, 1.3, 1.4, 2.5, 2.6, 2.7, 3.3, 3.8, 4.3, 4.6, 7.3, 7.5, 9.1, 9.3) are untouched by the diff. They neither cite nor are cited by the changed lines, so I did not re-read them this round. No locator in the README is flagged unverified.

**Adversarial table.** The first seven rows are this round's. The rest are carried from the previous report (r7, at 1ac270d, itself carrying earlier rounds), whose values I did not recompute.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Scope line 58–60: RootSystems Layer 1 (sign, faithfulness), Layer 2 (marked Weyl presentation), §1.3 | main; open revision head | main: Scope 13–14, Layer 1 l.248, §1.2 l.282, §1.3 l.335, Layer 2 l.432; revision: Scope 16–18, l.428, l.515, l.614 | resolves in both | none |
| Scope line 61–62: longest elements not used, and Mathlib's and Tau Ceti's | `H₃` (9.5); `S₃` (4.2) | `H₃`: `orderOf (s₀s₁s₂) = 10`, `(s₀s₁s₂)⁵ = −I`, length 15 = max, 120 elements; `TauCeti.longestElement` needs `[P.IsCrystallographic]`, `H₃` has entry 5; `S₃`: `[0,1,0]`, `[1,0,1]` multiply to `Fin.revPerm`, length 3 = max | false for both | R01 |
| Scope line 61: chambers not used | folder grep; pin | "chamber" 1 hit (line 61); `RootPairing.dominantChamber` Chamber.lean l.141; Mathlib 0 hits | sound | none |
| Contract line 202: Layer 2 not used | every RootSystems mention | README 58, 59, 199, 1385, 1392, 1395, 1426; Lean 80, 615: Scope or §1.3 only | sound | none |
| 10.2 orders (seeded) | `n = 2`, `M 0 1 = M 1 2 = 0`, `M 0 2 = 2`; `n = 0` | Gram `[[1,−1,0],[−1,1,−1],[0,−1,1]]`; `(s₀s₁)ᵏα₀ = (1,0,0),(3,2,0),(5,4,0),(7,6,0)`: infinite order; `(s₀s₂)² = 1 ≠ s₀s₂`; `n = 0`: matrix `[−1]` | sound | none |
| 10.2 faithfulness via 10.1 | `B = Fin (n + 1)` | Lean `∀ n, Function.Injective (geometricRepresentationFun …)`; supplier `Function.Injective cs.geometricRepresentation` for all `cs` (main Lean l.59–61) | sound | none |
| 9.5 Check: `(s₀s₁s₂)⁵ = −1`, centralizer of order 2 | geometric representation of `H₃` | 120 elements; centre `{I, −I}`; orders of `s₀s₁, s₁s₂, s₀s₂` = `3, 5, 2` | sound | none |
| 10.1–10.2 faithfulness supplier (r7) | RootSystems main §1.3 | l.337 `geometric_faithfulness`; l.357–359 transport; Lean l.59–61 | sound | none |
| Layer 9 "Not a target": AHOS Theorem 3.1 (r7) | `K₄`; hosohedron `{2,n}` | `(4,6,3)`, `χ = 1`, hemicube; `(2,n,n)`, `χ = 2`, diamond at `(−1,1)`, `(0,2)`, `(1,3)` | sound | none |
| "no loops, unlike 8.3" (r7) | projective plane `aa` | 1 vertex, 1 loop; diamond forces 2 vertices per edge | sound | none |
| 2.2 `exists_orientedMatroid_covectorsOf` (r7) | `[Finite E]`; infinite arrangement | `(1/m,0)`: `X fₙ = +`, `X gₙ = −`, no `Z` | sound | none |
| 2.2 `exists_chirotope_covectorsOf` (r7) | `L = {0}`; `E = ∅` | `r = 0`: two chirotopes, `covectorsOf = {0}` | sound | none |
| 2.1 (L3) Check (r7) | `X = (+,+)`, `Y = (+,−)` | `sep = {e₂}`, no `Z` | sound | none |
| 2.2 counts (r7) | three vectors; three independent; alt5 | `13`, `6`; `27`; `83 = 1 + 20 + 40 + 22` | sound | none |
| 2.3 `three_le_ncard_walls` (r7) | three lines; alt5; near-pencil | walls `3`; `3,…,5`; `3` | sound | none |
| 2.7 converse and uniqueness (r7) | `E = Fin 1`; arcs | no `Chirotope 2 (Fin 1)`; arcs of size `|E| − 1` | sound | none |
| 3.1 `crossX` field (r7) | `ofLines`, `i = j`; `i > j` | `0`; `(b j − b i)/(a i − a j)` symmetric | sound | none |
| 3.4 `chiFun_ofLines` (r7) | 200 arrangements, 1257 triples | sign equality on all | sound | none |
| 3.6 route (r7) | `n = 2`, `χ = −alt` | `R = {none}`; inputs 1.5, 1.7, 2.7, 3.3 | sound | none |
| 4.5 Levi's triangle theorem (r7) | near-pencil; three lines; alt5; pencil plus two | `4,4,4,6`; `4,4,4`; `3,3,3,3,3`; `3,4,3,4,4` | sound | none |
| 4.5 flips (r7) | alt5, 10 triples | legal at `123, 125, 145, 234, 345` | sound | none |
| 7.4 residues (r7) | tetrahedron on `S₄` | `{1,2}`: `6,6,6,6`; `{0,2}`: six of 4; `{0,1}`: four of 6 | sound | none |
| 8.4 (ii) Check (r7) | three elements | `48` vs `24` | sound | none |
| 9.6 `torusGroup` (r7) | `n = 2, 3, 4, 5` | `24, 108, 192, 300`; orders `(3,3,2)` then `(3,6,2)` | sound | none |
| 10.1 Gram entries (r7) | `m = 2, 1, 0` | `0, 1, −1` | sound | none |
| 1.4 Plücker Check (r7) | `(1,0),(0,1),(1,1),(1,2)` | `1 − (−1) + (−2) = 0` | sound | none |
| 3.7 counts (r7) | 3 and 4 elements | `(3,6,4)`, 24 flags, `χ = 1`; `(6,12,7)`, 48 flags, `χ = 1` | sound | none |

## Not verifiable

- Humphreys, *Reflection Groups and Coxeter Groups*, §5.4, Corollary, p.113. There is no legal copy and it is not in the manifest, so it is cited by locator, as in the previous rounds. This roadmap consumes it only at finite rank.
- BLSWZ, *Oriented Matroids*; McMullen–Schulte §2A, §2E, Theorem 2E11; Coxeter–Moser §8.4; Bondy–Murty Theorem 10.28; Knuth, *Axioms and Hulls*. There is no legal copy of any of these, so all are cited by locator, unchanged from the previous report.
- Ownership against open pull requests was checked through the overlaps tool, `roadmaps grep` and the checkout of the open RootSystems revision.

## Source issues

- none
