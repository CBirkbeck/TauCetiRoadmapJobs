# Review of PurityOfBranchLocus (pull request #1807 at ed37e7d)

**Verdict:** accepted

## Previous findings

- R01 — repaired: the description's bullet "Targets retired to the pins" now says that "PurityOfBranchLocus keeps only Layer 2 (§§2.1–2.3) and no longer consumes SchemeAndStackFoundations §§0.17 and 4.13, DerivedModuleAlgebra §0.K.1 or ModularCurves §4D". It adds that Layers 0 and 1 and two auxiliary results of §2.3 are at the pins, that two tables map them, and that 20 declarations are replaced by `etale_of_etaleAt_codimOne`.

## Verified sound

**What changed.** The folder is byte-identical to `2faed4d`: `git diff --stat 2faed4d HEAD -- TauCetiRoadmap/PurityOfBranchLocus` is empty, and so is the diff of `lake-manifest.json` and `lean-toolchain`. The only change that touches this roadmap is the description's bullet above. It now covers the repair R01 asked for, apart from one clause, "LocalPurity §2.1 is now its only roadmap supplier". That clause adds or drops no supplier: LocalPurity §2.1 is consumed on main too (main README 33).

**Description, checked against main and the head.**
- Main's README 32–35, 80–91 and 157–160 consume DerivedModuleAlgebra §0.K.1, SchemeAndStackFoundations §§0.17 and 4.13, and ModularCurves §4D. At the head, grep finds none of them (exit 1).
- "Two tables" matches README 82–116: the former-section table (§§0.1–0.4, 1.1) and the former-target table (§0.3, plus two rows for §2.3).
- The 20 declarations are the 18 of former Layer 0 and the two of §2.3 in the worker's list of removals. That list adds one declaration, `etale_of_etaleAt_codimOne`.
- The 12 other files changed since `2faed4d` belong to other folders, and none of them mentions PurityOfBranchLocus or LocalPurity (grep of the diff is empty).

**Adversarial table.** The diff changes no statement. The row is for the statement the changed description cites.

| Statement | Instances tried | Values on each side | Result |
|---|---|---|---|
| §2.2 `etale_of_etaleAt_codimOne`, Suggested.lean:92 | Artin–Schreier `t = yᵖ − y` over `𝔽_p` | `dt = (p yᵖ⁻¹ − 1)dy = −dy`, so `Ω = 0`. RHS true. The map is finite free of rank `p` and unramified, so `Etale f` holds: true ⇔ true | sound |
| same | `Spec ℤ[φ] → Spec ℤ`, `φ² = φ + 1` | `(2φ − 1)² = 5`, so `Ω ≅ ℤ[φ]/(√5) ≠ 0` at the height-one prime `(√5)`. RHS false; not étale there: false ⇔ false | sound |
| same | `f = 𝟙 (Spec k)`, `k` a field | No point has local dimension 1, so the RHS holds vacuously. `hgen` holds and `𝟙` is étale: true ⇔ true | sound |
| same | `Spec ℤ[i, 1/2] → Spec ℤ[1/2]` | `Ω = ℤ[i, 1/2]/(2i) = 0`, so the RHS is true. The map is free of rank 2 and étale: true ⇔ true | sound |

The other rows stand as in the previous review, of `2faed4d`.

**Counts.**
- **Gate.** The worker's gate at `ed37e7d` passes every check, build included. My own run shows 0 for every check except `outside-folder=24`. Those 24 files are the README and Suggested.lean of the 12 other folders this pull request owns. The brief's `diff --stat`, excluding all 13 folders, is empty.
- **Dependency check.** Output: `depcheck: 206 roadmaps, 1897 edges, 0 problem(s)`. There is no UPWARD or CYCLE line.
- **Elaboration.** `lake env lean` on Suggested.lean exits 0. Its only output is six `sorry` warnings, at lines 40, 58, 75, 92, 106 and 119.
- **Binders.** All six signatures in `signatures.md` match the README statements, and no binder was lost. The file is unchanged, so the previous `#check @` run stands.
- **Library declarations opened at the pin (Tau Ceti `2fd255d`):**
  - `LocallyQuasiFinite.lean:142`
  - `RamificationLocus.lean:197`
  - `RegularLocalRing/ProjectiveDimension.lean:376, 441`
  - `GlobalDimension.lean:70`
- **Citations resolved (2).** LocalPurity §2.1 is consumed at main README 33 and supplied at the head's LocalPurity README 863. Main's LocalPurity README 33, 69 and 287 cite PurityOfBranchLocus §0.3, and at the head no LocalPurity file names PurityOfBranchLocus as a supplier. `overlaps.md` reports no dropped id in either direction.
- **Seeded sample (3 locators).** I re-read each one; the text is unchanged.
  - `stacks-0BMB` lines 2524–2533 give the five hypotheses of 0BMB.
  - `sga1` lines 8355–8364 (printed p. 212) give Théorème 3.1, with `Z ≠ X`.

## Not verifiable

- Zariski (1958) and Nagata (1959) are cited only as the origin of the theorem, with no locator, so I did not open them.

## Source issues

- none
