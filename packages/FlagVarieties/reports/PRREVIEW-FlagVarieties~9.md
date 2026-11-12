# Review of FlagVarieties (pull request #2114 at fe12680)

**Verdict:** accepted

🤖 Independent AI review. Incremental re-review of the 8 lines changed since 2d6cb31 (`README.md` +5/−3; `Suggested.lean` untouched). No finding remains; the folder is ready for a human's final approval.

## Previous findings

- R01 — repaired: `README.md:19` "FlagVarieties owns headlines 1, 2, 4 and 5 and the variant of headline 3 described below"; `:25` states the supplier's reductive completeness statement and the kept variant's three differences.
- R02 — repaired: `README.md:260` "For a nonempty projective homogeneous X whose scheme-theoretic stabilizer at one k-point (equivalently, at every k-point, since the stabilizers are G(k)-conjugate) is smooth, choose x∈X(k), …".
- R03 — repaired: `README.md:236` "Layer 2 classification, `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`Algebra/AlgebraicGroup/Parabolic/Basic.lean`), `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (…), and `gap:tits-system-of-points` with `TitsSystem.normalizer_subgroupB` (…)".

## Verified sound

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| C01 | Ownership of headline 3 (`README.md:19`, `:25`) against ReductiveGroups Layer 7 on main | `G_a` (not reductive); `GL₂` (reductive) | `G_a`: `H = 1` gives `𝔸¹`, not proper, and `1` is not parabolic (the Borel is `G_a`); `H = G_a` gives a point, parabolic. The supplier claims nothing here. `GL₂`, `H = B`: `ℙ¹` on both sides | true; the variant differs as stated |
| C02 | 4.3 with the smooth-stabilizer hypothesis (`README.md:260`) | Frobenius-twisted `SL₂` on `ℙ¹`; standard `ℙ¹`; trivial `G` on a point; `Stab(gx)` | twisted: stabilizer ideal `(c^p)`, not smooth, excluded. Standard: stabilizer `B`, `G/P_∅`. Trivial `G`: `S = ∅`, unique `J = ∅`. `Stab(gx) = g·Stab(x)·g⁻¹`, so smoothness is point-independent | true; agrees with headline 4 (`:10`) and the Check at `:108` |
| C03 | Layer 3 Dependencies (`README.md:236`) against the layer's *Needs:* lines | union of `:222` (3.1) and `:228` (3.2) | *Needs:* union: 2.2, `exists_conjugate_le`, `exists_conjugate_eq`, `gap:tits-system-of-points`, `normalizer_subgroupB`. Dependencies: the same five | equal |
| C04 | `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` as 3.1's existence step | elaborated type; `SL₂`, `P = B⁻` | `IsParabolicOverAlgClosed I → IsBorelOverAlgClosed J → ∃ g, I.conjugate g ≤ J` (ideal order, so the conjugate of `P` contains `B`); `B⁻`: `g = w` | sound |

The rows for the untouched statements stand as in the previous review, of `2d6cb31`.

- Gate, my run at fe12680: every counter 0, `OK` (same line as the worker's, including `build=0` in the worker's run).
- Dependency check: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line.
- Elaboration: `lake env lean TauCetiRoadmap/FlagVarieties/Suggested.lean` gives three `sorry` warnings (lines 52, 62, 75) and nothing else; the four elaborated signatures equal those of the previous review (no statement changed, no binder lost).
- Pinned declarations opened and elaborated with `#check` (3): `HopfIdeal.IsParabolicOverAlgClosed.exists_conjugate_le` (`TauCeti/Algebra/AlgebraicGroup/Parabolic/Basic.lean:217`), `HopfIdeal.IsBorelOverAlgClosed.exists_conjugate_eq` (`TauCeti/Algebra/AlgebraicGroup/Borel/Conjugacy/Existence.lean`), `TitsSystem.normalizer_subgroupB` (`TauCeti/GroupTheory/TitsSystem/Parabolic/Normalizer.lean:83`).
- Cross-roadmap citation resolved (1): ReductiveGroups on main (80abaaa), Layer 7 "structure theory" (line 2821), bullet "Parabolic subgroup schemes and Levi decompositions" (line 2861): for a connected smooth affine reductive group over a field `k`, parabolic exactly when `G/P` is complete (line 2870, Milne Theorem 17.16, p.356), as `README.md:25` says.
- Source locators: none added or changed; of the seeded sample only 4.3 falls in the diff, and its change adds a hypothesis, not a locator.
- Overlap check: read ReductiveGroups (main, and listed open at #1808 and #1854), ReductiveGroupsPartII, LieGroups; shared object: the proper-iff-parabolic theorem, owner ReductiveGroups Layer 7 for the reductive case over a field, FlagVarieties §§4.1–4.2 for the stated variant. The overlap file lists no other pull request changing this roadmap, no dropped id and no id only an open revision defines.
- Pull request text: the title and description are not contradicted by this head (§4.0 dropped, gaps replaced by pinned citations, ShimuraData and GroupSchemesOverABase removed, one declaration added: all as the diff against main shows); the 8 changed lines alter no section, headline, declaration or supplier. `git diff --stat origin/main...HEAD` outside the folder is empty.

## Not verifiable

- Humphreys, *Linear Algebraic Groups* (GTM 21): paywalled, cited by locator only; no changed passage relies on it.
- `design/plan.json`: none readable, so the three gap slugs were treated as declared contracts.
- Open pull requests: ownership was checked against main and the overlap file; the open heads were not searched again in this round.

## Source issues

- none
