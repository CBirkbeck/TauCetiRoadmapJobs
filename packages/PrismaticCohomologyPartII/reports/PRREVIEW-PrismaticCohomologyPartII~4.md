# Review of PrismaticCohomologyPartII (pull request #1065 at 7c47f52)

**Verdict:** accepted

No finding at this head.

## Previous findings

- R01 — repaired: the targeted build of `TauCetiRoadmap.PrismaticCohomologyPartII.Suggested` completes (18239 jobs) and direct elaboration exits 0 with no output; the gate's `build` counter is 0.
- R02 — repaired: `README.md:782` is “### 4.2 Imported generalized Cartier divisors”, between §4.1 (line 755) and §4.3 (line 795), with the interface and four Checks; Scope line 13 keeps a one-sentence deferral to SchemeAndStackFoundations §1.21.
- R03 — repaired: the description now reads “The folder contains the mathematical roadmap, topic metadata and a declaration-free `Suggested.lean`”, and names the missing carriers as listed in the module docstring.
- R04 — repaired: the description now reads “the targeted Lake build succeeds with no `sorry` warnings. It emits the same Mathlib module-system warning in two build stages”; the rerun shows exactly that.
- R05 — repaired: `README.md:1876` and `:1888` read “BS22, Example 1.9 (4); p. 6”; BS22 line 191 marks page 6 and part (4) begins at BS22 line 197.

## Verified sound

| Statement | Instances tried | Computed left side | Computed right side | Result; change |
| --- | --- | --- | --- | --- |
| §4.2 principal points and isomorphism | `(R, u·)` versus `(R, 1·)`, u a unit | ρ = u gives `1·ρ = u` | `α′ρ = α` holds with α = u, α′ = 1 | Isomorphic; arrow direction matches BL22 line 1786 |
| §4.2 effective versus generalized | `(Z, 2·)`, pulled back to F₂; `(R, 0)`, R ≠ 0 | Kernel over Z = 0; over F₂ the map is 0, kernel F₂ | Zero map on R has kernel R ≠ 0 | Effective before pullback only; `(R,0)` not effective |
| §4.2 automorphisms | R = F₂[ε]/ε², f = ε, u = 1+ε; R = Z, f = 2 | uf = ε + ε² = ε, so u ≠ 1 stabilizes | 2u = 2 in Z forces u = 1 | Non-regular f has automorphisms; regular f has none |
| §4.2 dual convention against supplier | `(I, α) = (R, f·)` | α as section of `I∨ = Hom(I, R)` is f | SchemeAndStackFoundations §1.21 pair `(L, s) = (R, f)` | Same point of `[A¹/G_m]`; one owner |
| §5.20 framing independence (locator changed) | Base algebra, empty frames | All complexes `D[0]`, maps id | Two-step composite = id | Unchanged statement; page now 6 |
| §5.21 framed Z_p model (locator changed; seeded sample) | R = Z₂⟨T⟩, monomial T² | `∇_q(T²) = (1+q)T`; at q = 1 gives 2T | d(T²) = 2T dT | Agrees; BS22 lines 197–204 support the statement on page 6 |

The rows for untouched statements stand as in the previous review, of `71b7613`.

- Incremental scope: 30 changed lines, all in `README.md`; 5 previous findings accounted for; 0 changed Lean declarations; `git diff --stat origin/main...HEAD` outside the folder is empty.
- Source locators checked: 3 — BS22 Example 1.9 (4) at BS22 lines 191 and 197 (page 6); BL22 Definition 3.1.1 at BL22 line 1783 and Remarks 3.1.2–3.1.3 at BL22 lines 1790 and 1796 (page 39 begins at BL22 line 1779, page 40 at line 1827).
- Cross-roadmap citations resolved: SchemeAndStackFoundations §1.21 and `lineBundleSectionStack` on main (`TauCetiRoadmap/SchemeAndStackFoundations/README.md:3744`, `:3764`), §1.1 (`:2793`) and §1.18 (`:3538`). Internal citations of §4.2 at `README.md:13`, `:805`, `:832`, `:989` now resolve to the heading at line 782. PrismaticCohomologyPartIII cites no §4.2.
- Duplication by object: “generalized Cartier divisor” occurs in no other roadmap README, open or on main; the §4.2 text declares no second carrier.
- Dependency output: `depcheck: 247 roadmaps, 2240 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Gate rerun: every counter 0, `OK`. Targeted build: `Build completed successfully (18239 jobs)`; the only warnings are the Mathlib module-system notice, twice. Direct `lake env lean` on `Suggested.lean`: exit 0, no output. Named-signature and one-tactic probes: 0 declarations.
- Pull-request text against this head: adds a new roadmap (2101 inserted lines, 0 Lean declarations); the description's sentences on the declaration-free module, §4.2, the suppliers and the validation agree with the head.

Overlap check: read the overlap lists for PrismaticCohomology, PrismaticCohomologyPartIII, PrismaticCohomologyPartIV, HabiroCohomologyFoundations, QWittVectors, EnhancedDerivedSheaves and PerfectoidSpaces; the change touches one shared object, generalized Cartier divisors, owned by SchemeAndStackFoundations §1.21; the other ownerships stand as in the previous review.

Source independence: changed passages only; 3 passages compared with 2 sources (§4.2 with BL22 lines 1783–1800, the two locator paragraphs with BS22 lines 197–204), none shared beyond what the definition forces; largest share BL22, 92 of 195 locators; no layer added, removed or reordered, so the contents comparison is not reopened.

## Not verifiable

- none

## Source issues

- none

## For the human reviewers

- none
