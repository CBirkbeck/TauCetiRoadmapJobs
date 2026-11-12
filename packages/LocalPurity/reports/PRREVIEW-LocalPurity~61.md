# Review of LocalPurity (pull request #1807 at 2faed4d)

**Verdict:** accepted

No findings.

## Previous findings

- none: the previous report (r60, at `8d98b44`) had no findings.

## Verified sound

`TauCetiRoadmap/LocalPurity/` is byte-identical to `8d98b44`. Since then the pull request merged main twice and stopped changing SchemeAndStackFoundations and ReductiveGroups. The supplier contract (README lines 274-292) therefore now resolves against main's SchemeAndStackFoundations, so the rows below cover that contract.

| Statement | Instances tried | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| §0.14 contract: *henselian_finiteEtale_equivalence* (09ZL), *henselian_pair_characterisations* (09XI); SchemeAndStackFoundations lines 1242, 1257 on main | `(ℤ_3, 3)` with `S = ℤ_3[t]/(t²+1)`; non-henselian `(ℤ_(3), 3)` with `S = ℤ_(3)[t]/(t²−7)` | `disc = −4`, a unit, so `S` is étale and lifts `𝔽_9`. For `t²−7`: `S/3S = 𝔽_3×𝔽_3` has 4 idempotents, but `S` is a domain with 2; `disc = 28`, a unit | The henselian hypothesis is needed, and the contract states it | none |
| §2.2 `finiteEtale_extend_of_regular_codimTwo` (re-elaborated) | `𝔸²_k ∖ 0`; the cone `C = Spec k[x²,xy,y²]` with `char k ≠ 2` and `V = 𝔸²∖0 → C∖vertex` | `𝒪_{𝔸²,0}`: regular of dimension 2, so the hypothesis holds. The vertex has `dim 𝔪/𝔪² = 3 > 2`, so the hypothesis fails. The only normal finite candidate, `𝔸² → C`, has a vertex fibre of length `3 ≠ 2`, so `V` does not extend | true; the hypothesis is needed | none |
| `TauCeti.IsRegularLocalRing.depth_eq_ringKrullDim` (named in the description and README line 234) | `k[x,y]_(x,y)`; a field; `k[x,y]/(x²,xy)` localized at `(x,y)` | Depth 2 = dimension 2 (with `x, y` regular). A field: 0 = 0. The non-regular ring: `𝔪·x = 0`, so its depth is 0, while its dimension is 1 and `dim 𝔪/𝔪² = 2` | holds; regularity is needed | none |

The rows of r60 for the untouched statements (§0.9 clauses, §§1.1–1.4, §2.1, §2.2, Layer 1 Example 3) stand as in the previous review, of `8d98b44`.

- **Diff.**
  - `git diff 8d98b44 HEAD -- TauCetiRoadmap/LocalPurity` is empty.
  - The pins are unchanged: `lake-manifest.json` and `lean-toolchain` have no diff, and Tau Ceti is at `2fd255d`.
  - `git diff --name-only origin/main...HEAD` lists 26 files, two in each of the 13 folders the brief names.
- **Supplier.**
  - SchemeAndStackFoundations at this head is identical to main `7a5597a`. Its README is unchanged on main since `c69ba93`, which r60 read.
  - All 10 contract names resolve, in the sections they are cited from:
    - §0.9 (heading at line 1026): name at 1037;
    - §0.14 (1240): names at 1242 and 1257;
    - §2.6 (3554): name at 3584;
    - §2.7 (3613): names at 3621, 3630, 3639 and 3645;
    - §4.8 (5668): names at 5677 and 5680.
- **Gate.**
  - The worker's gate passes, build included.
  - My bare rerun is 0 on every check except `outside-folder=24`. That is the 12 sibling folders, two files each, which the brief names as the pull request's own.
  - Depcheck: `depcheck: 237 roadmaps, 2142 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- **Elaboration.**
  - `lake env lean TauCetiRoadmap/LocalPurity/Suggested.lean` exits 0, with only the 4 `sorry` warnings, at lines 34, 45, 58 and 69.
  - `#check @` of the 4 declarations matches `signatures.md` exactly, so no binder is lost. The 4 Tau Ceti names the description cites also elaborate.
  - One-tactic probe (`rfl | infer_instance | simp | simp_all | exact?`): none of the 4 closes (errors at lines 36, 51, 61, 74).
- **Library.** All 48 backticked `TauCeti.*` names in the README are declared at the pin, and all 27 cited Tau Ceti files exist.
- **Overlaps and ownership.**
  - No cited id is dropped by an open pull request.
  - #1808 and #1854 also change this folder; the merge-order block orders them after this one.
  - 0BMA and 0EY7 appear outside this folder only as citations of LocalPurity:
    - on main: AbhyankarLemma line 28 and PurityOfBranchLocus line 33;
    - in open pull requests: PurityForFlatCohomology (#1840) lines 106 and 599, and CrystallineCohomology (#857) line 440.
- **Pull-request text.** The LocalPurity paragraph, the "Targets retired" bullet and the summary block hold at this head.
  - On main, LocalPurity cites PurityOfBranchLocus §0.3 (main lines 33, 287), and PurityOfBranchLocus cites LocalPurity §2.1 (its line 33).
  - At this head, LocalPurity names PurityOfBranchLocus only under Downstream consumers (line 863), so the loop is cut.
- **Seeded sample.** It is untouched. I re-read:
  - sga2 lines 3377–3391 (Définitions 3.1–3.2, Proposition 3.3, Théorème 3.4 (i));
  - stacks-pione line 2503 (0BMA, Lemma 58.21.3) and line 2604 (0EY7, Lemma 58.21.6).

  These agree with §§2.1–2.2. The README flags no locator as unverified.
- **Remarks (no change asked here).**
  - SchemeAndStackFoundations §0.9 on main still says the properties are "inherited from a finite stage" (line 1041). That is the other folder's text.
  - #1840 cites §2.1 by main's name `purityHolds_of_isRegularLocalRing`. At this head the name is `IsLocalRing.purityHolds_of_isRegularLocalRing`, still in §2.1.

## Not verifiable

- The description's count of "six loops among the roadmaps on main". No tool available here lists main's cycles, and the claim is not specific to this folder.

## Source issues

- none
