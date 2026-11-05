# Review of GeometricQuantization (pull request #1186 at b7f61a5)

**Verdict:** accepted

Incremental re-review of the 18 changed README lines since ddba4b9 (§6.11 and the References list). No blocking finding remains; the two findings below are the unrepaired P3 items of the previous two reviews, carried forward as notes for the author to take or leave.

## R01 (P3) — Delete the character-wrapper companion

**Location:** `TauCetiRoadmap/GeometricQuantization/HomogeneousCharacterTargets.lean:1`–91; line 10: “flag dictionaries are specified in Q2A and S3P”; line 20: “def restrictCharacter … := χ.comp i”.

**Claim:** The file is byte-for-byte the one the previous two reviews read. It still carries six generic wrappers over native character operations, eight theorems closed by `rfl`, `Iff.rfl` or extensionality, four `Mathlib.<submodule>` imports, no target-signature module docstring and no README correspondence for its fourteen names; its docstring names a section (S3P) that exists on no roadmap on main.

**Witness:** `git diff ddba4b9..b7f61a5 --stat -- TauCetiRoadmap/GeometricQuantization` lists README.md only. Pinned owners of the wrapped operations: `ContinuousMonoidHom.comp` (`Mathlib/Topology/Algebra/ContinuousMonoidHom.lean:152`), `MonoidHom.ker` (`Mathlib/Algebra/Group/Subgroup/Ker.lean:238`), `QuotientGroup.lift` (`Mathlib/GroupTheory/QuotientGroup/Defs.lean:249`).

**Repair:** Delete the file from the folder. The three character Checks of §3.1 stay in the README (the S₃ sign character has kernel A₃ of order 3 and sends the nonidentity coset to −1; restriction along multiplication by 2 sends the integral character 3 to 6). Do not move the declarations into `Suggested.lean`.

## R02 (P3) — Record the fourteen references in the source manifest

**Location:** `TauCetiRoadmap/GeometricQuantization/README.md:1828`–1872, “## References”; the folder has no `sources.toml`.

**Claim:** The folder lists README.md, Suggested.lean, HomogeneousCharacterTargets.lean and metadata.toml only. None of the fourteen cited works (the Knutson notes are now gone) has a `tauceti-roadmap-sources/v1` entry with its version, locator, retrieval route and legal status; the Schottenloher, Tuynman and Ma–Marinescu locators depend on specific versions and the Demailly page numbers on the author-page PDF.

**Witness:** The Demailly and Graham–Vogan texts were readable through the sources service only with an explicit `--licence-class author-page`; nothing in the folder records that classification.

**Repair:** Add one entry per work (graham-vogan, demailly, schottenloher, tuynman, ma-marinescu, cannas, vergne, meinrenken, meinrenken-sjamaar, sjamaar, kostant, sniatycki, woodhouse, kodaira), with the version read, `locator_scheme`/`locator`/`cited_for`, and the service's `fetched_from`, `sha256`, `licence_class` and `status` (`uncertified` for Kostant, Sniatycki, Woodhouse and Kodaira). No source text enters the folder.

## Previous findings

- R01 — not repaired: `HomogeneousCharacterTargets.lean` is unchanged since 25d4909 (the diff since ddba4b9 touches README.md only); this report's R01.
- R02 — not repaired: the folder still has no `sources.toml`; this report's R02.

No repair report marks any finding “not actionable in this package”; nothing is re-raised against a settled disposition.

## Verified sound

**Scope of this round.** I read the previous report in full, the change set (README.md only, 8 insertions and 10 deletions, no file outside the folder; `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GeometricQuantization'` is empty), and the changed passage with everything it cites and everything that cites it: §6.11 in full (README:1737–1786, including its two API bullets, three Checks and `*Needs:*` line), the ComplexKahlerGeometry supplier contract (README:156–162), §5.2 which already consumed K7.2's polynomial dictionary (README:938–967), and the References list (README:1828–1872). The worktree is clean and no file was changed.

**The change itself.** The diff removes the citation of Allen Knutson's lecture notes by “physical page” from §6.11 and from the References, replaces the source for the degree-n monomial basis of `H⁰(ℂP²,O(n))` by ComplexKahlerGeometry K7.2, and drops the word “source” from the six places where it qualified the exponent-count density and weights. The previous report listed the Knutson notes as unfound, so the removed locator was the one citation of the README that could not be verified; nothing in §6.11 now depends on it. Every statement of §6.11 is an elementary count that I recomputed in full (table below). A grep of the README for `Knutson`, `Semester`, `physical page`, `notebook` and `discrepanc` finds nothing, so no dangling reference to the removed source remains.

**The new citation, resolved this round.**

| Citation | Resolved at | Outcome |
|---|---|---|
| ComplexKahlerGeometry K7.2 (README:1741, 1785) | main `fa41b37`, `TauCetiRoadmap/ComplexKahlerGeometry/README.md:1444`–1458: K7.2 constructs O(−1), O(k) and ω_FS on ℂPⁿ, identifies `H⁰(O(k))` with homogeneous degree-k polynomials for k ≥ 0 by the transition/Hartogs argument, and proves dimension `binomial(n+k,n)` | exists on main and states exactly the “section/polynomial dictionary” §6.11 consumes; the supplier contract at README:156–162 already lists K7.1–K7.2 for it; §5.2 (README:949–950, 966) consumed the same item before this change, so no new supplier edge is created |
| ComplexKahlerGeometry's position | on main, hence absent from `ORDER.txt` and an eligible supplier at every position; the two open pull requests on that roadmap (revisions) are not dependencies and were not cited | downward |
| §6.11's own `*Needs:*` (§5.2; §§6.1/6.4/6.9; K7.2) | §5.2 at README:938, §6.1 at 1062, §6.4 at 1236, §6.9 at 1626; all earlier in the file than §6.11 | internal order sound |
| “its own T4 density” (README:1768) | ConvexityToric T4 (README:144, 340, 1242, 1267), the raw Liouville pushforward density of §6.4 | an existing supplier label, untouched by the diff |

**Gate, dependency direction, elaboration.** The worker's gate at b7f61a5 reports every counter zero and `OK`, including the targeted build. I re-ran the full gate myself from the worktree: every counter zero, `OK` (my invocation prints no build field). I ran the prescribed dependency check; its complete output was

```text
depcheck: 204 roadmaps, 1544 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line. `lake env lean` on `Suggested.lean` from the worktree root: exit 0, no output in 2.6 s (the file declares nothing, so there is no `sorry` warning and no `#check` scratch to compare; its docstring's list of non-statable headlines is unchanged and the previous statability audit stands). Pins as in `lake-manifest.json`: Mathlib `6b7abb3c7686292736be2955bd3eb9ebf63b456a`, Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The diff cites no library declaration.

**Sources at the sampled locators.** Of the fifteen sampled targets only §6.11 falls in the diff, and its one locator is now a roadmap section (resolved above); the section cites no literature. The other fourteen sampled targets are untouched; their locator checks are those of the earlier full reviews (schottenloher 7.15–7.16, 10.18–10.21, 11.4–11.5; tuynman 7.9; sjamaar 2.2, 2.8, 2.11, 2.15; meinrenken (3)–(5), 2.1; vergne §3, 3.2; ma-marinescu §5.2; demailly VI §9.1 and V §11; graham-vogan Example 5.8).

**Adversarial table.** New rows carry values computed this round for every statement the diff touches (§6.11, recomputed from the monomial basis by exhaustive enumeration of nonnegative exponent triples summing to n); untouched statements are carried from the previous report's table by section, with their values there.

| Statement | Instances tried and values on each side | Result; change |
|---|---|---|
| 6.11 first action, `C_n(j)` = #{c : max(0,j−n) ≤ c ≤ floor(j/2)} | Enumerated the monomial basis for n = 0, 1, 2, 3, 6, 10 and compared with the formula at every j from −5 to 3n+5: equal at every j (n=2: weights 0,1,2,3,4 with multiplicities 1,1,2,1,1; n=6: 28 monomials). Negative control: at n=2, j=5 the formula gives max(0,3)=3 > floor(5/2)=2, count 0, as the API bullet says. | Formula correct; retain. |
| 6.11 second action, `C_n(j)` = #{c : max(0,ceil(−j/2)) ≤ c ≤ floor((n−j)/3)} | Same enumeration for a=(0,1,−2), n = 0, 1, 2, 3, 6, 10, j from −2n−5 to n+5: equal at every j. Totals 1, 3, 6, 10, 28, 66 = binomial(n+2,2). | Formula correct; retain. |
| 6.11 degree-2 and degree-3 weight lists for (0,1,−2) | n=2: multiset {0,1,−2,2,−1,−4}, six distinct values, matches the text and the Check. n=3: 0 occurs twice (from x₀³ and x₁²x₂, exponents (3,0,0) and (0,2,1)), and −6,−4,−3,−2,−1,1,2,3 once each; 2+8 = 10 = binomial(5,2). | Agrees; retain. |
| 6.11 exponent-count densities and masses | At n=600: first action C_n(xn)/n = 0.127, 0.252, 0.502, 0.252, 0.052 at x = 0.25, 0.5, 1, 1.5, 1.9 against min(x,2−x)/2 = 0.125, 0.25, 0.5, 0.25, 0.05; second action 0.085, 0.168, 0.252, 0.252, 0.168, 0.035 at x = −1.5, −1, −0.5, 0.25, 0.5, 0.9 against (x+2)/6 on [−2,0] and (1−x)/3 on [0,1] = 0.083, 0.167, 0.25, 0.25, 0.167, 0.033. Masses: triangle areas 1/4+1/4 = 1/2 and (2·(1/3))/2 + (1·(1/3))/2 = 1/3+1/6 = 1/2, as the third Check says. Consistency of the scaling: Σ_j C_n(j)/n = binomial(n+2,2)/n ≈ n/2 = n·(mass 1/2), so a density of mass 1/2 under the n⁻¹ rescaling of a one-dimensional count is the right normalization; a wrong model with mass 1 would overcount the total by a factor 2. | Agrees; retain. |
| 6.11 section convention `m_n(λ) = C_n(nκ−λ)`, natural lift `C_n(−λ)` | With `(t·s)(x) = t_L(s(t⁻¹·x))` and the natural O(1) lift, a monomial of exponent pairing j is sent to t^{−j} times itself (the t⁻¹ in the argument), so section weight −j; twisting by χ_κ multiplies every degree-n section by t^{nκ}, giving weight nκ−j; solving nκ−j = λ gives j = nκ−λ. n=0: weight 0, multiplicity 1 for both actions, matching the second Check. Wrong model (identifying positive exponent weights with positive section weights) is exactly what the paragraph excludes, and the degree-2 list for (0,1,−2) is not symmetric under negation (−4 vs 4), so the sign is detectable. | Agrees; retain. |
| 6.11 ownership of the monomial basis | K7.2 on main (line 1450–1452) identifies H⁰(O(k)) with degree-k polynomials and proves the binomial dimension; §5.2 of this roadmap consumed that before the diff; §6.11 now consumes it too rather than a lecture-notes page. | Single owner, downward; retain. |
| Conventions (5 rows), 1.1 (5 rows), 2.1–2.3 (12 rows), 3.1 (5 rows), 3.1a (4 rows), 3.2 (5 rows), 3.3 (4 rows), 3.4 (4 rows), 4.1–4.3 (11 rows), 5.1–5.3 (11 rows), 6.1–6.10 (44 rows), companion file (14 rows) | carried from the previous report (review of ddba4b9), values unchanged | untouched by the diff |

**Headline theorems and padding.** The headline inventory is the previous report's (§§2.1–2.3 lifts and complete-flow quantization, §§3.1–3.4 homogeneous descent and period/Picard/global-form comparisons, §§4.1–4.3 polarizations, §§5.1–5.3 cotangent/projective/theta realizations, §§6.1–6.10 index bridge, equivariant Riemann–Roch, distribution limit, reduced lines, semistability, Kostant bound, orbifold index, chamber quasi-polynomials, support transport). The diff changes none of them and adds no carrier; `Suggested.lean` still declares nothing and its docstring names each missing carrier. There is no sorried declaration to probe; the companion's eight proved theorems remain the padding of R01.

**Ownership against open work.** The diff reallocates no construction; it replaces a literature locator by a citation of an existing owner on main. Ownership against open pull requests not supplied with files was not checked beyond the roadmaps index, as in the previous rounds.

**Shape.** The changed passage is prose in a `### 6.11` subsection with API bullets, a `**Checks.**` list of three bullets and a `*Needs:*` line; it names its supplier by roadmap and section, carries no process words, pull-request numbers, LaTeX, paths or round labels. Removing the one reference entry leaves the References list well formed.

## Not verifiable

- The access limitations of the earlier full reviews (kostant and sniatycki uncertified; woodhouse HTTP 403; kodaira JSTOR landing page only) are unchanged and were not re-attempted: none of their locators falls in the changed passage. The Knutson notes, previously unfound, are no longer cited.

## Source issues

- none (the eight items recorded by the earlier full review stand; no new source passage was read this round, since the only locator the diff introduces is a roadmap section)
