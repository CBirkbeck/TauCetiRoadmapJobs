# Review of GrothendieckTopoi (pull request #1520 at a43840d)

**Verdict:** needs changes

## R01 (P3) — The description describes eight layers; the head has nine

**Location:** pull request description, Scope: "The topos-level half of the theory: … in eight layers:" (items 1–8); Ownership: "GrothendieckTopoi owns Grothendieck topoi, geometric morphisms, subtopoi, localic topoi, frame coproducts and core-compact spaces."

**Claim:** At this head, the scope list, the ownership sentence and the list of statements in `Suggested.lean` all leave out Layer 9, 5.6 (essential morphisms) and 6.5 (essential points, Roos). `Suggested.lean` states headlines for all three.

**Witness:** `TauCetiRoadmap/GrothendieckTopoi/README.md` line 1327, `## Layer 9: abelian sheaves, extension by zero and supports`; lines 882 and 1035 (5.6, 6.5); `Suggested.lean` lines 428–490 and 598–729 (`isEssential_iff_preservesProducts`, `exists_equiv_presheaf_iff_essential_points`, `recollement_extensionByZero`, …).

**Repair:** In the description:
- Change "in eight layers" to "in nine layers".
- Item 5: append ", and essential morphisms".
- Item 6: append ", essential points and Roos's characterization of presheaf topoi".
- Add item 9: "Abelian sheaves on a slice and on an open–closed decomposition: extension by zero, the recollement sequence, sections with support and `i^!`, local cohomology sheaves (compared on a space with Tau Ceti's), and no nonzero projective abelian sheaf on `ℝ`."
- Ownership sentence: append ", essential morphisms and points, and abelian sheaves on an open–closed decomposition of a topos".
- Suggested.lean list: add "essential morphisms and Roos's theorem;" and "exactness and faithfulness of extension by zero, the recollement sequence, the support functor and the local cohomology sheaves with their comparison to Tau Ceti on a space, and the absence of projectives on `ℝ`."

## R02 (P3) — The description's supplier list leaves out three suppliers

**Location:** pull request description: "It consumes: AdicSpacesPartII R0.19.10 (…), for coherent topoi; Mathlib's sites, sheaves, points of sites, subobject classifiers, frames and sublocales."

**Claim:** The head also consumes:
- AdicEtaleGeometry A1.15, for 6.4;
- DiamondEtaleCohomology, "Topological open extension by zero", for 9.1;
- Tau Ceti's supported sections and local cohomology sheaves, for 9.3–9.4.

The Sources sentence leaves out three cited works: Kashiwara–Schapira 1990, Stone 1948 and Bannister 2024.

**Witness:** README lines 227, 246 and 252: `**From Tau Ceti**`, `**From AdicEtaleGeometry.** A1.15`, `**From DiamondEtaleCohomology.**`. `Suggested.lean` line 4 imports `TauCeti.Topology.Sheaves.LocalCohomology.Basic`. References list Kashiwara–Schapira, Stone 1948 and Bannister 2024.

**Repair:** Add to "It consumes:":
- "AdicEtaleGeometry A1.15 (Deligne's theorem for coherent topoi), which 6.4 generalises to locally coherent topoi;"
- "DiamondEtaleCohomology, "Topological open extension by zero" (stalks of extension by zero on a space, 9.1);"
- "Tau Ceti's `supportedSections`, `supportedSectionsSheaf`, `supportedSectionsFunctor` and `supportedHSheaf` (9.3–9.4)."

Add "Kashiwara–Schapira 1990, Stone 1948, Bannister 2024" to the Sources sentence.

## Previous findings

- None: the review of 25f804d had no finding.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description against the head (R01, R02) | count of layers, supplier contracts and references | layers: 9 in README, 8 in description; suppliers: 5 `**From …**` blocks, 2 named; references: 15, 12 named | contradicted | R01, R02 |
| 9.2 `recollement_extensionByZero` | Sierpiński, `c = {o}`, `F = ℤ`; one-object `B(ℤ/2)`, trivial topology, `F = ℤ` trivial | Sierpiński: counit `0 → ℤ` on `X`, `id` on `{o}`, mono; cokernel `ℤ` on `X`, `0` on `{o}`, restricts to 0. `B(ℤ/2)`: `ℓ c = ℤ/2 → pt` not mono; counit is augmentation `ℤ[ℤ/2] → ℤ`, kernel `ℤ(1−g) ≠ 0` | holds; `hc` needed | none |
| 9.1 `preservesFiniteLimits_…`, `faithful_sheafPullback_overForget` | `B(ℤ/2)`; Sierpiński `U = {o}` | `B(ℤ/2)`: `j_!A = ⨁_{g} A = ℤ[ℤ/2] ⊗ A`, exact, faithful via `A ↪ 1 ⊗ A`. Sierpiński: `(j_!F)(X) = 0`, `(j_!F)({o}) = F({o})`, exact | holds | none |
| Contract "From DiamondEtaleCohomology" (re-resolved at d91fdb5, line 152) | Sierpiński, `Λ = ℤ`, `U = {o}`, `F = ℤ` | stalk at `o`: `ℤ` = input stalk; at `c`: only `X` contains `c`, `(j_!ℤ)(X) = 0`. Supplier bullets: input stalk on `U`, `0` off `U` | agrees | none |
| 6.4 `hasEnoughPoints_coherentTopology`, contract "From AdicEtaleGeometry" (A1.15 on main, lines 5763–5778) | poset `{0 < 1}` | empty family on `0` is effective epi (`0` initial), so `F(0) = pt`; `{0 → 1}` is not (no `1 → 0`); `Sh ≃ Type`, one point `F ↦ F(1)`, conservative | holds | none |

The rows for the other statements stand as in the previous review, of `25f804d`.

- **Gate.** The worker's gate at a43840d reports 0 on every check (`… build=0 OK`). Run here without the candidate order, it reports only `depcheck: NOT IN ORDER: GrothendieckTopoi (insert it after its last supplier)`.
- **Dependency check** with the candidate order and `--movable`: `depcheck: 207 roadmaps, 1915 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line. DiamondEtaleCohomology is at line 75 and GrothendieckTopoi at line 76.
- **Elaboration.** `lake env lean` on `TauCetiRoadmap/GrothendieckTopoi/Suggested.lean` exits 0 with 40 `declaration uses sorry` warnings and nothing else. The file is unchanged, so the `#check` signature comparison and the one-tactic probe of earlier rounds stand.
- **Changes.** The folder diff against 25f804d is empty. `git diff --stat origin/main...HEAD` outside the folder is empty; the files changed since 25f804d come from merging main at af32451 (the merge base). Pins are unchanged: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`.
- **Cross-roadmap citations, 3 resolved again:**
  - AdicSpacesPartII R0.19.10 (main, README line 8005);
  - AdicEtaleGeometry A1.15 (main, line 5673);
  - DiamondEtaleCohomology "Topological open extension by zero" (head d91fdb5, line 152).

  None of the three cites GrothendieckTopoi.
- **Downstream consumers, checked at their heads:** TotallyDistributiveTopoi (4907f68) cites 1.1, 1.2, 1.4, 2.3, 5.2, 5.6, 6.5 and 7.1. ClassifyingTopoi (a2de104) cites Conventions 1 and 4 and 1.1, 1.2, 2.1, 2.2, 2.4, 2.5, 4.1, 4.2 and 6.1. Both match the Downstream consumers paragraph, and every id exists here.
- **Overlaps and citation leads.** `scratch/overlaps.md`: no other pull request changes this roadmap, and no id is dropped. `scratch/citations.md`: the 19 Lean-name leads are the same as in the previous round.
- **Seeded sample.** The folder diff is empty, so no sampled target lies in a changed passage; no locator was re-read this round.

## Not verifiable

- None in this round's scope: the change touches no statement and no locator.

## Source issues

- none
