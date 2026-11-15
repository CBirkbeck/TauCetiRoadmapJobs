# Review of SelmerIwasawaCohomologyPartII (pull request #1403 at 6175fcf)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since 6175fcf; this round reads the pull request's title and description against the head. Both findings are in the description; the folder's files need no change.

## R01 (P3) — The description says the Lean file states definitions and theorems; it declares nothing

**Location:** pull request description, prose after the summary block: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti" and "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** A reader concludes that `Suggested.lean` carries headline statements with `sorry`. At this head it has no declaration, and the description nowhere says that no headline is statable at the pins.

**Witness:** `TauCetiRoadmap/SelmerIwasawaCohomologyPartII/Suggested.lean` (48 lines): `import Mathlib`, the docstring, an empty namespace. README line 5: "None is statable at the pinned APIs … The file therefore contains no declarations". Elaboration: exit 0, no warning.

**Repair:** Replace the two clauses by: "`Suggested.lean` declares nothing: none of the headline theorems (§§2.2–2.6, 3.2–3.7, 4.3–4.6, 5.2–6.4, 7.1–7.4, 8.1–8.5) is statable at the pinned Mathlib and Tau Ceti, and its module docstring names the missing carrier for each; every target is in the README." and "the targeted Lake build succeeds with no warning (the file has no `sorry`)".

## R02 (P3) — The summary puts Π₀ on GL(n) and Π₁ on GL(n+1); the README indexes by parity

**Location:** pull request description, summary block, first paragraph: "unitary arithmetic level raising for relevant cuspidal Π₀, Π₁ on GL(n), GL(n+1) over any CM extension F/F⁺".

**Claim:** For odd n the head contradicts the sentence: Π₀ is the representation of the even-rank group, which is GL(n+1).

**Witness:** README line 21: "Let n₀ and n₁ be the even and odd members of {n,n+1} … A relevant representation Πα is irreducible cuspidal on GL(nα,A_F)". n=3: n₀=4, n₁=3, so Π₀ is on GL(4)=GL(n+1).

**Repair:** "… for relevant cuspidal Π₀, Π₁ on GL(n₀), GL(n₁), the even and odd members of {n, n+1}, over any CM extension F/F⁺."

## Previous findings

The previous report (of 6175fcf, accepted) raised no finding of its own; it accounted for the five of the report before it, and nothing in the folder changed since.

- R01 — repaired: gate at this head reads "build=0 OK"; `lake env lean` on `Suggested.lean` at the manifest's pins exits 0 with no output.
- R02 — repaired: README line 103 cites "the surjective-can criterion of §0.13 … the uniform local annihilation theorem of §4.25 with both H⁰ vanishings"; unchanged since.
- R03 — repaired: README lines 135–139 write `S_pf` and cite "the unitary classification contract of §§11.0d–11.0e"; unchanged since.
- R04 — not repaired (a note under the gap rules, not a finding): gap rigid-r-equals-t is still declared on GlobalGaloisDeformations §§3.3–3.8 at README lines 189–195; see the remark below.
- R05 — repaired: README line 249 says "the layer's own targets are §§1.5–1.6"; Layer 1 has exactly those two subsections.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| Description: "H(N) is discharged except when F⁺=ℚ and N≥4" against §8.3 | (n, F⁺) = (2, ℚ), (3, ℚ), (3, ℚ(√2)) | (2, ℚ): N∈{2,3}, both ≤3, discharged; (3, ℚ): N=4 not discharged, §8.3 excludes it; (3, ℚ(√2)): F⁺≠ℚ, discharged | description agrees with §8.3 ("n=2 over every totally real F⁺, and for n≥3 with F⁺≠ℚ") and §8.4 | none |
| Description: Π₀, Π₁ on GL(n), GL(n+1) against Conventions | n=2, n=3 | n=2: (n₀,n₁)=(2,3), r₀+r₁=1+1=2=n, Π₀ on GL(n); n=3: (n₀,n₁)=(4,3), r₀+r₁=2+1=3=n, Π₀ on GL(n+1) | false for odd n | R02 |
| Description: Vλ=(ρΠ₀,λ⊗ρΠ₁,λ)(n), "all seven admissibility clauses" against Conventions and §1.6 | n=2 | tensor rank 2·3=6, twist 2, weight (2−1)+(3−1)−4=−1; §1.6 lists L1, L2, L3, L4, L5, L6, L7: seven | agrees | none |
| Description: "`Suggested.lean` … states only real-bodied definitions and theorems" | count of `def`/`theorem`/`structure` in the file | 0 declarations in 48 lines; elaboration output empty | misleading | R01 |

The rows for every statement of the folder stand as in the previous review, of `6175fcf`.

- Summary block, sentence by sentence against the head: "published reflexive closure" (README lines 38, 987), "kernels of the Oλ-extended Hecke algebra onto Oλ/λᵐ" (line 31: n_(Π,m)^Σ=ker(T_O^Σ→A_m)), "every coefficient Frobenius twist of the adjoint" (L5-1, line 284), "`IsRigidFor.mono`" (6 occurrences), "Mathlib finite sum" (line 17), PeriodsAndSpecialValues as consumer (line 982), the Gan–Gross–Prasad sentence (line 982): all agree. The title agrees: the pull request adds the folder (not on main; 1040 insertions, 0 deletions).
- Gate rerun on this head: every scanner 0, `OK`; the worker's gate adds `build=0`. No change outside the folder (`git diff --stat origin/main...HEAD` outside it is empty).
- Dependency check with `--movable`: `depcheck: 245 roadmaps, 2241 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean` with Mathlib `6b7abb3c` and Tau Ceti `a91d3aaf` checked out (the manifest's pins): exit 0, no output. No declaration, so the `#check` comparison and the one-tactic probe have nothing to run on; no headline is statable at these pins, as the previous review recorded.
- Source locators and the seeded sample: no passage of the folder changed, so none of the fifteen sampled targets falls in a changed passage; none re-read. Library declarations opened: none (no Lean statement or library citation changed).
- Cross-roadmap citations resolved this round: IgusaVarietiesAndTorsionConcentration at its open head, and the scopes of the five closest roadmaps. Suppliers cited without an open pull request (EtaleCohomologyFoundations, StableReduction, ProfiniteCohomology, SchemeAndStackFoundations, ReductiveGroupsPartII, AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups, Chebotarev under `Completed/`) are on main.
- Remark (untouched text, no change asked): README lines 147, 297, 314, 466, 538, 912 cite "IgusaVarietiesAndTorsionConcentration §IG.7.2"; at that roadmap's head the section is "7.2 Cohomologically generic Hecke homomorphisms" with no `IG.` prefix, and its `Suggested.lean` declares no `IsCohomologicallyGeneric`.
- Remark (untouched text, no change asked): gaps rigid-r-equals-t and eventual-rigidity name GlobalGaloisDeformations, while PotentialAutomorphyInfrastructurePartII, open and earlier in the merge order, plans the same theorems in its §10.2 ("The almost minimal integral R = T theorem for rigid residual representations") and §10.3 ("Rigidity and residual irreducibility for almost all primes").

Overlap check: read PotentialAutomorphyInfrastructurePartII, AutomorphicGaloisRepresentationsPartII, IgusaVarietiesAndTorsionConcentration, EndoscopicTransferAndUnitaryTraceComparison, HilbertModularVarietiesAndShimuraCurves (the open list; the two other lists are empty); this roadmap owns nothing they own. The rigid polarized R=T theorem and eventual rigidity, which this roadmap consumes through gaps, are owned by PotentialAutomorphyInfrastructurePartII §§10.2–10.3 at its open head (remark above). Cohomological genericity: IgusaVarietiesAndTorsionConcentration §7.2, cited.

Source independence: changed passages only; 0 passages changed in the folder, so none compared; largest share ltxzz, 155 of 186 line locators; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Fulfilment of the 21 declared gaps is a contract on the suppliers, not certified here.
- The description's "AI assistance" sentence (the model, 3 review rounds, 2 red-team rounds) describes the process, not the folder; not checked.
- The `depends-on` and `merge-order` blocks are generated and outside this check.

## Source issues

- none (no source passage was read this round; the four items of the first report, in ltxzz at Lemma 5.11.3, Notation 5.11.1(4), Lemma 2.3.5(b) and Lemma 2.6.4, stand as recorded there)

## For the human reviewers

- none
