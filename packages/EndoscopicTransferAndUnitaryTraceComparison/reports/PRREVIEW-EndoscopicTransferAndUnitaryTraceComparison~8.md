# Review of EndoscopicTransferAndUnitaryTraceComparison (pull request #999 at 1af544e)

**Verdict:** accepted

Incremental re-review of 0 changed lines since f99f5d8, plus the check of the pull request's title and description against this head. No finding.

## Previous findings

- R01 — repaired: the description now reads "`Suggested.lean` declares nothing: it consists of `import Mathlib`, its module docstring and an empty namespace, because no headline theorem of the roadmap is statable against the pinned Mathlib and Tau Ceti."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| §10.23 segment-to-monodromy block (cited by the description: "Monodromy comes from segments") | `k=2`, `q=2`, basis `e_1,e_2` | `F N e_1 = q⁻² e_2 = ¼ e_2`; `q⁻¹ N F e_1 = q⁻¹·q⁻¹ e_2 = ¼ e_2`. `N²=0`, `N¹≠0`. | Pass; none. |
| §10.23, wrong model: arithmetic Frobenius `e_i ↦ qⁱ e_i` | Same block | `F N e_1 = 4 e_2`, `q⁻¹ N F e_1 = 1·e_2`: the stated covariance `F N = q⁻¹ N F` fails, so the law excludes it. | Pass; none. |
| §10.23, boundary lengths | `k=1`; `k=0` | `k=1`: `N=0`, `N⁰=1≠0`, consistent. `k=0`: zero space, and the non-vanishing clause is restricted to `k>0`. | Pass; none. |
| Description: "`Suggested.lean` declares nothing" | The file at this head | 44 lines: `import Mathlib`, one module docstring, an empty namespace; 0 `theorem`, `def`, `instance`, `example`. Docstring names the five carrier groups the description lists. | Pass; none. |
| Description: "adds the roadmap folder … and changes nothing outside it" | Three-dot diff against the base | Folder: 3 files, 5684 insertions, 0 deletions. Outside the folder: empty diff stat. | Pass; none. |

Rows for all other statements stand as in the previous review, of `f99f5d8`.

- The folder is identical to `f99f5d8` (0 insertions, 0 deletions); the head differs only by a merge of main. No statement, locator, `*Needs:*` line, supplier or Lean declaration changed, and no target of the seeded sample falls in a changed passage.
- Description read against the head, sentence by sentence. Summary block: characteristic-zero local theory and finite-field curve (README line 7), residue characteristics 2 and 3 (line 47), the weighted lemma outside a finite set of places (lines 135, 4334), Jacquet–Langlands imported (line 1874), `B(G)` imported (line 11), no global Galois theorem as input (line 160), monodromy from segments (lines 102, 4060, 5519), the downstream uses (lines 27, 127, 5519–5523). Prose: the three files, the empty Lean file, the missing carriers. All agree with the head; it states that the pull request adds the roadmap, and nothing is removed, renumbered or dropped.
- Gate rerun on this head: every counter 0, `OK`. Dependency check: `depcheck: 245 roadmaps, 2258 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `TauCetiRoadmap/EndoscopicTransferAndUnitaryTraceComparison/Suggested.lean`: exit 0, no output. The file has no declaration, so there are no signatures to compare and no padding probes to run.
- Overlap facts: no other open pull request changes this roadmap, no cited id is dropped, none is defined only by an open revision, no second copy on main.
- Source independence: changed passages only; 0 passages changed in the folder, so 0 compared; arrangement not compared again (no layer added, removed or reordered).
- Remark on untouched text: §10.23 (README line 4062) says the covariance identity holds "at `q=0`" as a numerical formula; `q⁻ⁱ` has no value there unless `0⁻¹=0` is meant.

Overlap check: read IgusaVarietiesAndTorsionConcentration, AutomorphicSpectralTheory, ModularityAndLanglandsExtensions, AutomorphicGaloisRepresentationsPartII, GL2AutomorphicRepresentationsAndTransfer, SmoothRepresentationsOfLocalGroups, ReductiveGroupsPartII, AdelicAlgebraicGroups (the third list is empty); no object has two owners. Ordinary orbital integrals `O_γ` and pseudo-coefficients: owner AutomorphicSpectralTheory AS.6.9, AS.6.18–AS.6.19, cited here (README lines 29, 706). Cyclic `GL_n` twisted transfer and prime-degree base change: owner AutomorphicSpectralTheory §§7.0a–7.1, cited here (lines 2355, 2589). Tensor isocrystals, `J_b`, central leaves and Igusa towers: owner this roadmap §§7.2–7.10, cited by IgusaVarietiesAndTorsionConcentration's Scope. Global Weil group: owner GL2AutomorphicRepresentationsAndTransfer §R17.5.0, cited here (line 91). Dual groups, `L`-groups and the Kottwitz homomorphism: owner ReductiveGroupsPartII RG2.1.5, RG2.5, cited here (line 94). Smooth categories and Weil–Deligne fields: owner SmoothRepresentationsOfLocalGroups SR.0–SR.5, cited here (lines 17–19). Tamagawa measures and local `H¹` vanishing: owner AdelicAlgebraicGroups §§2, 4.1, cited here (line 95).

## Not verifiable

- The earlier rounds' uncertified locator-only texts are untouched: `wald-weighted-twisted` Theorem 3.8; `arthur-classification` Theorems 1.5.1, 1.5.2, 2.2.1 and Chapters 6–8; `henniart09`; `jacquet-shalika90` §8 Theorem 1; `hiraga-saito12` Theorem 4.14.

## Source issues

- none

## For the human reviewers

- none
