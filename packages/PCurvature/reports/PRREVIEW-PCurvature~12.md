# Review of PCurvature (pull request #1747 at 774be2e)

**Verdict:** accepted

Incremental re-review of 0 changed lines since 7bd6c74. The head differs from 7bd6c74 only by a merge of main; `TauCetiRoadmap/PCurvature/` is byte-identical. The one finding of the previous report, in the pull request description, is repaired. No finding remains.

## Previous findings

- R01 — repaired: the description's "It consumes" list is now CrystallineCohomology CR.1.3, FormalConnectionsOpers §§2.1–2.3, DerivedDeRhamCohomology §3.6, SchemeAndStackFoundations §§0.8, 0.9, 0.29 and Tau Ceti; no GrothendieckNotesLemmas bullet.

The repair introduced no new problem: the four roadmaps and sections the description lists are exactly those of the README's supplier contracts (`TauCetiRoadmap/PCurvature/README.md` lines 111–122), and "changes nothing outside it" holds (below).

## Verified sound

**The change.** `git diff --stat 7bd6c74 HEAD -- TauCetiRoadmap/PCurvature` is empty; the folder holds `README.md`, `Suggested.lean`, `metadata.toml`. `git diff --stat origin/main...HEAD` excluding the folder is empty: the files that differ between the two heads outside the folder all come from the merge of main, not from this pull request.

**Gate, build, elaboration.**
- The worker's gate record for this head: every check 0, including `build=0`, `OK`.
- `gate … PCurvature --base origin/main --order <candidate>`, run for this review: every check 0, `OK`. (Without the candidate order the only line is `depcheck: NOT IN ORDER: PCurvature (insert it after its last supplier)`, which is the expected state of a roadmap not yet in the public order, not a defect.)
- `lake env lean TauCetiRoadmap/PCurvature/Suggested.lean`: exit 0, 11 `sorry` warnings (lines 71, 97, 109, 114, 119, 138, 160, 167, 174, 200, 224), nothing else — identical to 7bd6c74.
- The worker's elaborated signatures: 19 declarations, none having lost a section binder; unchanged text, compared with the README by `#check @` in the earlier reviews.

**Dependency check** (`gate --depcheck … --name PCurvature --order <candidate> --movable --content <main> --pr 1747`):

    depcheck: 234 roadmaps, 2268 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. The candidate order has DerivedDeRhamCohomology at line 22, CrystallineCohomology at 23, FormalConnectionsOpers at 40, PCurvature at 41; SchemeAndStackFoundations is on main.

**Cross-roadmap citations, resolved again at main 641eaf3 and the open heads (6 resolved).**
- CrystallineCohomology CR.1.3: heading "CR.1.3 Differentials, connections and stratifications", README line 1120 at its open head.
- FormalConnectionsOpers §§2.1, 2.2, 2.3: headings at README lines 667, 707, 782 at its open head.
- DerivedDeRhamCohomology §3.6: "3.6 The classical smooth Cartier isomorphism", line 3894, with `DerivedDeRham.smoothCartier` at line 3907 (this resolves the citation listing's lead for README line 120).
- SchemeAndStackFoundations §§0.8, 0.9, 0.29 on main: lines 798, 848 (`spreading_out_models` at 865), 1825 (`schemeFrobeniusTwist` at 1874; this resolves the lead for README line 122). Both open revisions of that roadmap keep the three section numbers and titles.

**Ownership and overlaps.** The overlap listing is empty (no other pull request changes this roadmap, no cited id dropped, none defined only by a revision). `roadmaps grep` for p-curvature, Jacobson's formula and Cartier descent over main and the 448 open pull requests: no second owner; the only hits outside this folder are K3Surfaces (README lines 36, 184, 275–298, 349) and GroupSchemesOverABase (line 86), which cite PCurvature §§0.1–0.3, and the unrelated "Cartier divisors and Cartier descent" of VectorBundlesAndIsocrystals. DeRhamCohomologyAndDuality, opened since the last review, has no match.

**Sources.** No passage changed, so no locator of the seeded sample falls in a change; no locator is flagged as unverified. The locators stand as verified or recorded in the earlier reports.

**Adversarial table.** No statement changed; all rows are carried from the report on 7bd6c74 (and those it carries), with the values recorded there.

| Statement | Instances | Values each side | Result |
| --- | --- | --- | --- |
| 0.4 commutator identity | general `b`; `k[x]`, `D = d/dx`, `a = x`, `b = x^n`; `a = 1`; `D = 0` | `D(ab) − aD(b) = D(a)b`; `(n+1)x^n − n x^n = x^n`; `0 = D(1)b`; `0 = 0` | holds (carried) |
| 0.4 conjugation identity | `u = 1`; `k[x, x⁻¹]`, `u = x`, `b = 1`, `b = x` | `D = D`; `x·D(x⁻¹) = −x⁻¹` both sides; `0 = 1 − x⁻¹·x` | holds (carried) |
| Layer 0 Examples, Weyl relation | `[d/dx, x]` on `1`, on `x` | `1`; `2x − x = x` | identity operator (carried) |
| 1.1 route and *Needs:* | `M = A`, `∇_D = D` | `[∇_D, a] = D(a)` | consistent (carried) |
| 1.4 rank-one formula and gauge | `𝔽_p[x, x⁻¹]`, `u = x`, `p = 2, 3` | `ω(D) = −1/x`; `−x^{−p} + x^{−p} = 0`; `ω(D^p) = 0` | `ψ = 0` both ways (carried) |
| `Suggested.lean` | 19 declarations | 11 admitted theorems elaborate, no dangling name | recomputed this round |
| 0.1–0.3, 1.1–1.5, 2.0–2.4, 3.1, 3.2, 4.1–4.4, Conventions 1, 5, 6, the effective-Honda paragraph, the `pPow` body | as in the earlier reports | as recorded there | hold (carried) |

**Headline theorems.** Stated: Jacobson's formula (0.1), the restricted structure on `Der_R(A)` and Hochschild's formula (0.3), the rank-one formula (1.4), the Frobenius image (2.0), rank one in one variable (2.3), Kronecker (4.1), Honda (4.3). Named as not statable, each with its missing carrier: 1.1–1.3, 1.5, 2.1–2.2, 3.1–3.2, 4.4. Unchanged; no padding (one-tactic probe at the earlier heads, same text).

**Declared gaps:** none declared, none needed.

## Not verifiable

- Honda 1981, Kronecker 1880, Katz 1972 and 1982, Chudnovsky–Chudnovsky 1985, André 1989 and 2004, Beukers–Peters 1984 remain unread, as in the earlier reports; nothing changed cites them anew.

## Source issues

- none
