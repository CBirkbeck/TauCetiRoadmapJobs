# Review of PCurvature (pull request #1747 at 7bd6c74)

**Verdict:** needs changes

Incremental re-review of the 32 lines the folder changed since 12a50f4 (README: the two own backticked names of 0.4 replaced by prose at six places; `Suggested.lean`: the two 0.4 theorems and their docstring bullet deleted). The folder is clean. One P3 remains, outside the folder: the pull request description still lists a supplier the README does not consume.

## R01 (P3) — the pull request description still lists GrothendieckNotesLemmas §3.2 as consumed

**Location.** The pull request description, under "Ownership and suppliers … It consumes:", the bullet "GrothendieckNotesLemmas §3.2;".

**Claim.** PCurvature consumes GrothendieckNotesLemmas §3.2.

**Witness.** `TauCetiRoadmap/PCurvature/README.md` at this head has 0 matches for "GrothendieckNotes"; the commutator and conjugation identities are its own target 0.4 (line 232), with *Needs:* "Mathlib `Derivation.leibniz`, `Derivation.leibniz_of_mul_eq_one`, `LinearMap.mulLeft`, `Module.End`". The description's "Depends on" block is already corrected (three suppliers, none of them GrothendieckNotesLemmas).

**Repair.** Delete the bullet "GrothendieckNotesLemmas §3.2;" from the description. No change to the folder is needed.

## Previous findings

- R01 — repaired: `Suggested.lean` no longer declares `lie_mulLeft` or `mulLeft_mul_mul_mulLeft_inv` and its docstring has no 0.4 bullet; the README states 0.4 in prose ("the commutator identity of 0.4", "the conjugation identity") at lines 234–237, 266, 280, 283, 368.
- R02 — partly repaired: the "Depends on" block no longer lists GrothendieckNotesLemmas, but the "It consumes" list still has "GrothendieckNotesLemmas §3.2;". Written again as R01 above.

## Verified sound

**The repair of the previous R01 introduced no new problem.**
- `grep` for `lie_mulLeft`, `mulLeft_mul_mul_mulLeft_inv` and `GrothendieckNotes` over `README.md` and `Suggested.lean`: 0 matches. No backticked own name is left without a declaration (gate `readme-ids-missing=0`).
- The six rewritten README passages (lines 234–237, 266–267, 279–283, 368–369) change wording only: the hypotheses (commutative `R`-algebra `A`, `D` a derivation of `A` into itself, `a ∈ A`, `u` a unit), the two formulas, the route and the *Needs:* items are those of 12a50f4. 0.4 remains a README target with its four Checks; 1.1 and 1.4 still name it in their *Needs:* lines, and the Layer 0 Dependencies line (271) still covers it.
- The module docstring's headline list (0.1, 0.2, 0.3, 1.4, 2.0, 2.3, 4.1, 4.3) and its "not statable" list (1.1–1.3, 1.5, 2.1–2.2, 3.1–3.2, 4.4) are otherwise unchanged; 0.4 is not a headline, so its absence from the Lean file is correct.

**Gate, build, elaboration.**
- `gate … PCurvature --base origin/main --order <candidate>`, run for this review: every check 0, `OK`. The worker's gate record for this head has every check at 0 including `build=0`.
- `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224) and nothing else. This is the 13 of 12a50f4 minus the two deleted theorems, the remaining lines shifted by the deletions.
- The worker's elaborated signatures list 19 declarations, none having lost a section binder; the 19 are unchanged text since 12a50f4, where each was compared with its README statement by `#check @` (previous report).

**Dependency check** (`gate --depcheck … --name PCurvature --order <candidate> --movable --content <main>`): `depcheck: 236 roadmaps, 2270 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line; the candidate order lists PCurvature at line 41, after FormalConnectionsOpers. The change adds and removes no supplier edge.

**Ownership and overlaps.**
- `roadmaps grep` for the two deleted names: no match on main or in any open roadmap pull request, so no other roadmap cites a declaration this head dropped. Other roadmaps cite PCurvature only at §§0.1–0.3 (K3Surfaces README lines 36, 184, 275–298, 349; GroupSchemesOverABase README line 86), all untouched.
- GrothendieckNotesLemmas is not on main (3090489) and not in the open-pull-request index of 2026-11-09T21:49Z, so its side of the 0.4 hand-over, verified at 12a50f4, could not be re-read this round; the folder does not cite it, so nothing in the folder depends on that.
- The overlap listing: no other pull request changes this roadmap, no cited id is dropped, no id is defined only by an open revision. The citation listing's two Lean leads (README lines 120, 122) are in untouched supplier contracts, resolved in earlier reviews.
- `git diff --stat origin/main...HEAD` excluding the folder is empty.

**Sources.** The diff touches no locator. Of the seeded sample, only "0.4 Commutators with multiplications" and the routes of "1.1" and "1.4" fall in changed passages: 0.4 is an own statement without a source locator, whose Mathlib inputs (`Derivation.leibniz` at `RingTheory/Derivation/Basic.lean:119`, `Derivation.leibniz_of_mul_eq_one` at line 480, `LinearMap.mulLeft`) were opened at the pin in the previous review; the Katz 1970 locators of 1.1 and 1.4 are unchanged. No locator is flagged as unverified.

**Adversarial table.** Rows for the changed passages (recomputed), then the carried rows.

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 0.4 commutator identity as reworded (README 234–237) | general `b`; `k[x]`, `D = d/dx`, `a = x`, `b = x^n`; `a = 1`; `D = 0` | `D(ab) − aD(b) = D(a)b`; `(n+1)x^n − n x^n = x^n = D(x)·x^n`; `D(b) − D(b) = 0 = D(1)b`; `0 = 0` | holds; wording change only |
| 0.4 conjugation identity as reworded (README 237–241) | `u = 1`; `k[x, x⁻¹]`, `u = x`, `b = 1` and `b = x` | `D = D`; `x·D(x⁻¹) = −x⁻¹` vs `0 − x⁻¹·1 = −x⁻¹`; `x·D(1) = 0` vs `1 − x⁻¹·x = 0` | holds |
| Examples bullet (README 266–267), Weyl relation | `[d/dx, x]` on `1` and on `x` | `D(x) − x·0 = 1`; `2x − x = x` | identity operator, as stated |
| 1.1 route and *Needs:* (README 279–283) | `M = A`, `∇_D = D` | `[∇_D, a] = D(a)` reduces to the commutator identity of 0.4 | consistent; the *Needs:* item names an existing target |
| 1.4 *Needs:* (README 368–369) and gauge sentence | `𝔽_p[x, x⁻¹]`, `u = x`, `p = 2, 3` | `ω(D) = −1/x`; `(−1/x)^p + D^{p−1}(−1/x) = −x^{−p} + x^{−p} = 0` (`(p−1)! ≡ −1`, also at `p = 2`: `D(1/x) = −x⁻² = x⁻²`); `ω(D^p) = 0` | `ψ = 0`, agreeing with `(x∘D∘x⁻¹)^p = x∘D^p∘x⁻¹ = 0` |
| `Suggested.lean` after the deletion | the 19 remaining declarations | none mentions the deleted names; 11 admitted theorems elaborate | no dangling reference |

Carried from the previous report (review of 12a50f4 and those it carries), unchanged text: the four Checks of 0.4; the route's use of `Derivation.leibniz_of_mul_eq_one`; 0.1–0.3, 1.1–1.5, 2.0–2.4, 3.1, 3.2, 4.1–4.4, Conventions 1, 5, 6; the effective-Honda paragraph after 4.3 with its witnesses; the `pPow` body: hold as recorded there.

**Headline theorems.** Stated: Jacobson's formula (0.1), the restricted structure on `Der_R(A)` and Hochschild's formula (0.3), the rank-one formula (1.4), rank one in one variable (2.3), Kronecker (4.1), Honda (4.3). Named as not statable, each with its missing carrier: 1.1–1.3, 1.5, 2.1–2.2, 3.1–3.2, 4.4. No statable headline is absent, none goes through a stand-in, and the padding found at 12a50f4 is gone.

**Declared gaps:** none declared, none needed.

## Not verifiable

- Nothing in the changed passages. Honda 1981, Kronecker 1880, Katz 1972 and 1982, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984 remain unread as in the previous reports; the diff cites none of them.
- GrothendieckNotesLemmas could not be read this round (not on main, not among the open roadmap pull requests indexed); this affects only the description bullet of R01.

## Source issues

- none
