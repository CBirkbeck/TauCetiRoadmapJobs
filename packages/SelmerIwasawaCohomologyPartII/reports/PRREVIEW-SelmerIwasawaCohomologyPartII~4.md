# Review of SelmerIwasawaCohomologyPartII (pull request #1403 at 4f2c89a)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 6175fcf; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: none of the headline theorems (§§2.2–2.6, 3.2–3.7, 4.3–4.6, 5.2–5.6, 6.2–6.4, 7.1–7.4, 8.1–8.5) is statable" and "reports no `sorry` (the file has no declaration)".
- R02 — repaired: the summary block now reads "relevant cuspidal Π₀, Π₁ on GL(n₀), GL(n₁), where {n₀,n₁}={n,n+1} and n₀ is even", which is README line 21.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: Π₀, Π₁ on GL(n₀), GL(n₁), n₀ even, against Conventions (README line 21) | n=2, n=3 | n=2: (n₀,n₁)=(2,3), r₀+r₁=1+1=2=n; n=3: (n₀,n₁)=(4,3), r₀+r₁=2+1=3=n; Π₀ on the even group in both | agrees | none |
| Description: headline list §§2.2–2.6, 3.2–3.7, 4.3–4.6, 5.2–5.6, 6.2–6.4, 7.1–7.4, 8.1–8.5, against the README headings and the module docstring | each range against the headings; §6.1 against the docstring | 5+6+4+5+3+4+5=32 sections, all 32 are headings; docstring names the same ranges and omits §6.1 (data, not a theorem); declarations in the file: 0 | agrees | none |
| Description: "vanishes for a nonzero definite diagonal period and is one-dimensional for a nonzero diagonal regulator", "assuming H(n), H(n+1) and a uniform realised Frobenius span premise", against §§8.1–8.2 | the two conclusions and their premises | §8.1: H¹_f(F,Vλ)=0 under H(n),H(n+1), rank-one span, ∑_s f(s,sh↑(s))≠0; §8.2: dim=1 under H(n),H(n+1), rank-two span, AJλ(Δ)≠0 | agrees | none |
| Description: "H(N) is discharged except when F⁺=ℚ and N≥4" against §§8.3–8.4 | (n, F⁺) = (2, ℚ), (3, ℚ), (3, ℚ(√2)) | (2, ℚ): N∈{2,3}, both ≤3, discharged; (3, ℚ): N=4, not discharged, outside §8.3; (3, ℚ(√2)): F⁺≠ℚ, discharged | agrees | none |
| Description: Vλ=(ρΠ₀,λ⊗ρΠ₁,λ)(n), "all seven admissibility clauses", against Conventions and §8.4 | n=2 | tensor rank 2·3=6, twist 2, weight (2−1)+(3−1)−4=−1; §8.4 retains L1–L7: seven | agrees | none |

The rows for every statement of the folder stand as in the previous review, of `6175fcf`.

- Title and description read sentence by sentence against the head: 0 contradicted. The title agrees: the pull request adds the folder (not on main; 1040 insertions, 0 deletions; README, `Suggested.lean`, `metadata.toml`). The remaining summary sentences (reflexive closure, README lines 38 and 987; `IsRigidFor.mono`, 6 occurrences; the Mathlib finite sum, line 17; PeriodsAndSpecialValues and the Gan–Gross–Prasad sentence, line 982) agree.
- Gate rerun on this head: every scanner 0, `OK`; the worker's gate adds `build=0`. The folder is unchanged since `6175fcf` (`git diff --stat` empty), and `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` at the manifest's pins: exit 0, no output. The file has no declaration, so the `#check` comparison and the one-tactic probe have nothing to run on.
- Source locators and the seeded sample: no passage of the folder changed, so none of the fifteen sampled targets falls in a changed passage; none re-read. Library declarations opened: none.
- Cross-roadmap citations resolved this round: the scopes of the five closest roadmaps at their open heads; the suppliers without an open pull request (EtaleCohomologyFoundations, StableReduction, ProfiniteCohomology, SchemeAndStackFoundations, ReductiveGroupsPartII, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups) are folders on main.
- Remark (untouched text, no change asked): README lines 147, 297, 314, 466, 538, 912 cite "IgusaVarietiesAndTorsionConcentration §IG.7.2"; at that roadmap's head the section is "7.2 Cohomologically generic Hecke homomorphisms", with no `IG.` prefix.
- Remark (untouched text, no change asked): gaps rigid-r-equals-t and eventual-rigidity name GlobalGaloisDeformations, while PotentialAutomorphyInfrastructurePartII, open, plans the same theorems in its §§10.2–10.3.

Overlap check: read PotentialAutomorphyInfrastructurePartII, AutomorphicGaloisRepresentationsPartII, IgusaVarietiesAndTorsionConcentration, EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves (the open list; the two other lists are empty); nothing shared. Cohomological genericity is owned by IgusaVarietiesAndTorsionConcentration §7.2 and cited; unitary packets and transferable levels by EndoscopicTransferAndUnitaryTraceComparison, cited.

Source independence: changed passages only; 0 passages changed in the folder, so none compared; largest share ltxzz, 155 of 186 line locators (as counted in the previous review); the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Fulfilment of the 21 declared gaps is a contract on the suppliers, not certified here.
- The description's "AI assistance" sentence (the model, 3 review rounds, 2 red-team rounds) describes the process, not the folder; not checked.
- The `depends-on` and `merge-order` blocks are generated and outside this check.

## Source issues

- none (no source passage was read this round; the four items of the first report, in ltxzz at Lemma 5.11.3, Notation 5.11.1(4), Lemma 2.3.5(b) and Lemma 2.6.4, stand as recorded there)

## For the human reviewers

- none
