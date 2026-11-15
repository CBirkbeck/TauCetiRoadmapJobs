# Review of MotivesAndAlgebraicCycles (pull request #1313 at 4cfd9b7)

**Verdict:** accepted

No finding.

## Previous findings

- R01 — repaired: the description reads “LefschetzStructures builds on its correspondences, Weil cohomology, equivalence relations and standard-conjecture predicates”; README lines 9, 35, 1711 name `LefschetzStructures`, line 1711 with “Layer 2 (its §§2.1–2.4)”. `StandardConjectures` occurs nowhere in the folder.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result / change |
|---|---|---|---|
| Line 1711: LefschetzStructures Layer 2 “imports §§0.1–0.2, 0.5, 2.2–2.3 and 7.3–7.4 of this roadmap by name” | Its README at the open head (#1061): supplier contract, §§2.1–2.4 `*Needs:*`, Layer 2 Dependencies | Contract lists §0.1, §0.2, §0.5, §2.2, §2.3, §7.3; §2.4 there cites §§7.3–7.4 and §7.4's curve case; Layer 2 has exactly 2.1–2.4 | Agrees on both sides; no id cited that this README lacks. |
| Line 1711: “the Künneth components of §2.4 here reach it through the predicate `C_ℚ,H(X)` of §7.3” | LefschetzStructures citations of this roadmap's §2.4; its dictionary | Direct citations of §2.4 here: 0; its §2.4 proves `ProjectorsAlgebraic (𝒜(X))` ⇔ `C_ℚ,H(X)`; §7.3 here (line 1350) defines `C_ℚ,H(X)` by rational representatives of Künneth projectors | Agrees. |
| Line 1711: “`L` comes from correspondence degree `1`, and under B the Lefschetz inverse `Λ` comes from degree `-1`” (convention `Corr^r(X,Y)=CH^{d+r}(X×Y)_ℚ`, line 23) | `ℙ¹`, `d=1`, `ξ` the point class; a curve with `deg ξ = m` | `Δ_*ξ ∈ CH²` (r=1): `1 ↦ ξ`. `[X×X] ∈ CH⁰` (r=−1): `ξ ↦ m·1`, kills `H⁰,H¹`, so `Λ = m⁻¹[X×X]_*`. `CH¹` (r=0) preserves degree: contains neither | Matches §2.3 third Check here and LefschetzStructures §2.2 and §2.4 Checks. |
| Line 9: Layer 2 consumes the core “to compare its Lefschetz-structure properties with the predicates of §7.3” | LefschetzStructures §2.4 dictionary, four rows | `LambdaAlgebraic` ⇔ `B_H(X)`; `ProjectorsAlgebraic` ⇔ `C_ℚ,H(X)`; positivity ⇔ Hodge standard; pairing nondegeneracy ⇔ `D_ℚ,H(X)`; it defines no variety-level predicate of its own | Agrees with “not with predicates of its own” (line 1711). |

Rows for untouched statements stand as in the previous review, of `38cb422`.

- Changed passages: 3 sentences (README lines 9, 35, 1711); 7 cross-roadmap section citations resolved against LefschetzStructures at its open head; no statement, section number, supplier or Lean declaration changed. No target of the seeded sample falls in them (§2.3 is cited, its text is unchanged).
- Supplier direction: LefschetzStructures is named only as a consumer (Scope, contracts preamble, Downstream consumers); no `*Needs:*` line or supplier contract cites it. Dependency check: `depcheck: 245 roadmaps, 2236 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Description against the head: summary block and prose read again; the consumer sentence now names the folder of #1061; the four direct suppliers of the depends-on list equal README line 35; three folder files; the roadmap is new (0 headings or declarations removed, no supplier dropped); #1061 is LefschetzStructures.
- Gate at this head: every counter zero, `OK`. Elaboration of `TauCetiRoadmap/MotivesAndAlgebraicCycles/Suggested.lean`: 4 `sorry` warnings (lines 88, 102, 118, 141), nothing else. No file changed outside the folder.
- Headlines: no Lean line changed since `38cb422`; signatures and padding probes stand.
- Overlap check: read MotivicEtaleKTheory, SchemeKTheoryOperations, EtaleDualityAndPerverseSheaves, KTheoryFiniteLocalFields, LefschetzStructures, SchemeAndStackFoundations, EtaleCohomologyFoundations; nothing shared (LefschetzStructures owns the Lefschetz data, operators and the dictionary; the predicates, implications and cases of §§7.3–7.4 are owned here).
- Source independence: changed passages only; 3 changed sentences compared with 0 sources (they carry no source locator and describe a sibling roadmap), none shared; no layer added, removed or reordered, so contents were not compared again.

## Not verifiable

- Grothendieck1969, pp.299–303: settled as uncertified, outside the changed passages; carried from the previous report.
- DelfsHomology, Chapter III §9, Theorem 9.3, and KunnemannPicard, §7.17: outside the changed passages; carried from the previous report.

## Source issues

- none

## For the human reviewers

- none
