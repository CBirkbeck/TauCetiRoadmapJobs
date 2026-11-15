# Review of AutomorphicFormsOnReductiveGroups (pull request #1037 at 4a03177)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 4a03177. The folder is unchanged and the gate passes; both findings are in the pull request's description, which no earlier review read against the head.

## R01 (P3) — The description names a consumer the README no longer names

**Location:** pull request description, summary block `<!-- roadmap-summary -->`, second paragraph: "…GL₂ and GSp₄ modularity and coherent cohomology all use these carriers, as do QuaternionicModularForms and BorelRegulators."

**Claim:** The head does not name QuaternionicModularForms as a consumer; the mention was removed from the README.

**Witness:** `grep -c QuaternionicModularForms TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/README.md` gives 0. `README.md` line 1317 reads "BorelRegulators and Polylogarithms use the van Est comparison and the differentiable cochains of Layer 1."

**Repair:** Replace the clause with: "…GL₂ and GSp₄ modularity and coherent cohomology all use these carriers, as do BorelRegulators and Polylogarithms."

## R02 (P3) — The description credits the headline with density of smooth vectors

**Location:** pull request description, summary block `<!-- roadmap-summary -->`, third paragraph: "The headline `compactFinite_dense_locallyConvex` holds for every compact Hausdorff group acting on a complete locally convex space, so density of smooth vectors needs no separate theorem."

**Claim:** At the head, density of smooth vectors is a separate target of §2.7. What the headline makes unnecessary is a separate theorem for density of compact-finite vectors in the smooth topology.

**Witness:** `README.md` §2.7 (line 489): "Hence `lieSmoothVectors π` is dense in `E` (`lieSmoothVectors_dense`)", proved by smoothing. `README.md` line 313: "Density of compact-finite vectors in the smooth topology … | §2.7, by applying `compactFinite_dense_locallyConvex`".

**Repair:** Replace the sentence's last clause with: "…acting on a complete locally convex space, so density of compact-finite vectors in the smooth topology of a Banach representation of a compact Lie group (§2.7) needs no separate theorem."

## Previous findings

- The previous report (of 4a03177) had no findings; there is none to account for.

## Verified sound

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| Description: headline gives "density of smooth vectors" (R02) | `K=1` on any `E`; `S¹` on `C(S¹)`; `G=ℝ` translating `L²(ℝ)` | `K=1`: every orbit span has dimension `≤1`, so the headline's dense set is all of `E` and says nothing of smoothness; `S¹`: trigonometric polynomials, dense; `ℝ`: not compact, headline does not apply, smooth vectors dense by mollification | the description's clause fails; the README's own statement (line 313) holds | R02 |
| `compactFinite_dense_locallyConvex` as the description states it ("every compact Hausdorff group acting on a complete locally convex space") | elaborated signature | binders `[CompactSpace K] [T2Space K] [LocallyConvexSpace ℝ E] [CompleteSpace E] [T2Space E]`, joint continuity; conclusion `Dense {v | FiniteDimensional ℂ (span (range fun k => π k v))}` | description agrees with the Lean, up to Hausdorffness of `E` and joint continuity, which the README states | none |

The rows for all other statements stand as in the previous review, of 4a03177.

- Gate, rerun at 4a03177 with `--base origin/main`: every check 0, `OK`; the worker's gate.md adds `build=0`.
- `lake env lean` on `TauCetiRoadmap/AutomorphicFormsOnReductiveGroups/Suggested.lean`: only `declaration uses sorry` at 47:8, exit 0.
- Dependency check: `depcheck: 245 roadmaps, 2220 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder: empty. Folder diff since the previous review: empty.
- Description sentences checked against the head and found to agree, 11: new roadmap of three files (worker's diffstat: 1417 insertions, 0 deletions); one Lean declaration; `vanEstIso` (README line 278, every real Lie group with finitely many components, line 276); non-cuspidal, non-unitary automorphic representations (lines 17, 654); Hermitian datum without a Shimura variety (§6.1, line 1317); Hecke operators on invariants (§0.6); `HeckeRing`, `ContRepresentation`, `continuousCohomology` (lines 297, 1307, signature); consumers' imports of the unitary dual, Maass eigenforms, `ℓ₀,q₀`, torsion eigensystems (lines 1313–1317); "LieHighestWeight … Layer 9 owns the reductive centre and Harish-Chandra isomorphisms … is on main" (main's `RepresentationTheory/LieHighestWeight/README.md` §9.2, line 2819; this README lines 7, 55, 351); validation claims (gate above).
- Cross-roadmap citations resolved for this check, 4: LieHighestWeight Layer 9 and CompactGroups on main; QuaternionicModularForms and BorelRegulators against this README. The worker's citation resolver lists no cross-roadmap citation found nowhere.
- The generated `depends-on` and `merge-order` blocks now list ArithmeticGaloisRepresentations; the previous report's remark on its absence no longer applies.
- Seeded sample: no sampled target lies in a changed passage (there is none), so no locator was reopened; the README flags no locator as unverified.
- Remark on untouched text (no change requested), carried: §5.8a's locator "§§3.2.3–3.2.4 and §9.1, pp.85–86" fits pp.85–86 only for §9.1.

Overlap check: read the worker's three lists (open: AutomorphicSpectralTheory, AutomorphicLFunctionsAndLocalFactors, AutomorphicSpectralTheoryPartII; main: SmoothRepresentationsOfLocalGroups, LieHighestWeight, AdelicAlgebraicGroups; by results: none); LieHighestWeight §9.2 on main owns the reductive enveloping centres, cited here as its gap; no folder change, nothing newly shared.

Source independence: changed passages only; 0 passages changed in the folder, so 0 compared with 0 sources; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- Nothing new. The untouched citations with no legal open copy are as in the previous reports: Borel–Jacquet, Flath and Langlands (Corvallis I); Knapp, *Lie Groups Beyond an Introduction*; Vogan 1984; Lapid; Kostant 1961.

## Source issues

- none

## For the human reviewers

- none
