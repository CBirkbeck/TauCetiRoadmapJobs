# Review of RelativisticQuantumFieldTheory (pull request #1772 at 4395f35)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 4d88833; this round reads the pull request's title and description, as they stand now, against the head. No finding.

## Previous findings

- R01 — repaired: the description now reads "adds the roadmap folder … (`README.md`, `Suggested.lean` and `metadata.toml`) … 14 theorems, each with `sorry`, and the 30 definitions they need (44 declarations)"; the head has exactly these.
- R02 — repaired: "`Suggested.lean` elaborates against the pinned Mathlib and Tau Ceti with 14 `sorry` warnings, one per stated theorem, and nothing else"; elaboration at 4395f35 gives 14 warnings and no other output.

## Verified sound

| # | Statement | Instances and computed values (each side) | Result |
|---|---|---|---|
| D1 | Description: "14 theorems, each with `sorry`, and the 30 definitions they need (44 declarations)", "all of them in Layers 1, 5, 6 and 7" | `Suggested.lean`: 14 `theorem`, 30 `def`/`abbrev`, 14+30=44; layer comments at lines 60, 168, 209, 253 are Layers 1, 5, 6, 7. | agrees |
| D2 | Description: "Its docstring names the headline theorems of Layers 3–11 that are not statable" | Docstring lines 33–51 name RQFT3, 10; 4, 7, 8; 6, 9; 5, 6; 7; 11: every layer 3–11 occurs, each with its missing carrier. | agrees |
| D3 | Description: "Two suppliers are roadmaps still in open pull requests, QuantumFoundations and NoncompactQuantumSymmetry … The other suppliers are … roadmaps on main" | 19 roadmap names in the README: 17 have a folder on main (1a19c9f); the 2 without are exactly these, at merge-order lines 215 and 158, before this roadmap (217). | agrees |
| D4 | Description: "changes nothing outside it" | `git diff --stat origin/main...HEAD` outside the folder: empty. Folder: 3 files, 5978 insertions, 0 deletions. | agrees |
| D5 | `norm_quarticIntegral_sub_sum_le` (Layer 5; one of the 14 theorems the description counts) | `j=0`, `N=0`: left `≤∫e^(−φ²/2)=√(2π)`, right `√(2π)`. `N=1`: right `=|g|/24·3√(2π)=√(2π)|g|/8`, `b₁=3!!/24=1/8`. `b₂=105/1152=35/384=b₁·35/48`, ratio formula at `n=1`: `5·7/48`. | sound |
| D6 | `quarticContinuation_continuation`, oddness clause | `F(−ζ,j)=(−ζ)⁻¹∫exp(−t⁴/24−t²/(2ζ²)−jt/ζ)dt`; `t↦−t` gives `−F(ζ,j)`. `ζ>0`, `φ=t/ζ`: exponent `−φ²/2−ζ⁴φ⁴/24+jφ`, Jacobian `ζ` cancels `ζ⁻¹`. | sound |

The rows for the roadmap's other statements stand as in the previous review, of `4d88833`.

- Description sentences read against the head: title, three summary paragraphs, five prose paragraphs. Contradicted: 0. The eleven results the summary names each have a section: Reeh–Schlieder, §4.7, §4.14, §7.5, §8.1, §9.20, §10.2, §11.5, §6.14/§6.22 (forests), §6.28, §6.35 (renormalization group, Ward identities).
- Changes a reader must know of: the pull request adds the roadmap (stated); 0 headings and 0 declarations removed; no supplier dropped.
- Gate rerun at 4395f35: every check 0, `OK`, exit 0 (the worker's gate adds `build=0`).
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, 14 `declaration uses sorry` warnings, no other line.
- Dependency check: `depcheck: 244 roadmaps, 2229 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- `overlaps.md` and `citations.md` list nothing: no other open pull request changes this folder, no cited id dropped, no citation unresolved.
- Overlap check: read NoncompactQuantumSymmetry, QuantumFoundations, LocalVariationalFieldTheory (resolved as supplier citations in the previous review, unchanged) and LorentzianGeometry (open; its scope leaves the Klein–Gordon, Dirac and Maxwell Green operators to this roadmap and cites §1.1 as a consumer; this README does not cite it); nothing shared.
- Source independence: changed passages only; 0 passages changed in the folder, so none compared; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- "AI assistance: OpenAI Codex authoring and independent mathematical reviews" (description): a statement about the authoring process; nothing at the head records it.
- "Closes #1770": the issue is not among this review's inputs.
- The uncertified and waived sources (`weinberg95`, `unsw-qft`, `sw64`, `haag96`, `rs75`, `hormander83`, `bs80`, `tong-qft`, `strocchi67`, `strocchi70`) are cited by locator only, as in the previous review; no locator changed.

## Source issues

- none

## For the human reviewers

- Scope: two of the most cited sources are course notes: `borcherds-qft` (Borcherds–Barnard lecture notes, arXiv math-ph/0204014; "Borcherds" occurs 64 times in the README) and `unsw-qft` (unpublished UNSW notes, waived; "UNSW" 35 times, cited by page).
- Licence: the description says "verified gpt-6-luna readers supplied Markdown from source images"; which sources were transcribed from images, and under what licence, is not recorded in the folder.
- Not tested: wording and arrangement were not compared this round (0 changed lines); `unsw-qft` has no text in the sources cache, so it has not been compared in any round.
