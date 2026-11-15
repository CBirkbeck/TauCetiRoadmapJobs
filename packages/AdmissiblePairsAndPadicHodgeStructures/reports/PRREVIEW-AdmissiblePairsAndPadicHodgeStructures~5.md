# Review of AdmissiblePairsAndPadicHodgeStructures (pull request #1511 at 794d213)

**Verdict:** accepted

Incremental re-review of the 20 lines changed since `cb12b64`, plus the pull request's title and description as they stand now. No finding.

## Previous findings

- R01 — repaired: `README.md:2125` now argues locally: a de Jong covering splits over the tube W; a connected piece of degree d trivializes the tower, bounding each level's monodromy by d, against p^(m−1)·(p−1).
- R02 — repaired: the description reads "`Suggested.lean` declares nothing: none of the headline theorems is statable at the pinned Mathlib and Tau Ceti, and its module docstring lists the 23 groups"; the `sorry`-warning sentence is gone.
- R03 — repaired: the summary block reads "Bilattices and their elementary-divisor types live over any complete DVR, equal characteristic included; goodness and recovery from a filtration need characteristic zero, an algebraically closed residue field and a coefficient section."

## Verified sound

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §12.3, new proof route (`README.md:2125`) | Igusa tower at p = 2, 3; Tate curve G_m/q^Z | Igusa: level orders (1,2,4), (2,6,18) exceed any d. Tate: every point has a neighbourhood splitting the tower, so no bound is violated and it is not excluded | Holds |
| §12.3, step "neighbourhood contains the tube W" | closed unit disc, Gauss point, neighbourhood {|f| ≥ 1} | contains every residue disc where the reduction of f is nonzero: all but finitely many | Holds |
| §12.3, step "trivial over a piece of degree d ⇒ order ≤ d" | connected level-m cover with group (Z/p^m)×, connected finite étale T₀ → W of degree d | a section over T₀ gives a surjection T₀ → level m, so p^(m−1)·(p−1) ≤ d | Holds |
| §12.3, step "section lies in one valuation component" | I ×_(Z_p×) Q_p× = disjoint union of copies of I indexed by Z | the component index is locally constant, hence constant on connected T₀; the section is a section of I | Holds |
| §12.3, step "level stays connected over W" | formal model finite étale over the formal open, special fibre a dense open of an irreducible smooth curve | reduced connected special fibre ⇒ idempotents of the generic fibre are integral ⇒ generic fibre connected | Holds |
| Scope paragraph, Frobenius quotient (`README.md:17`) | `Adic.lean` lines 158 and 224 at the Tau Ceti pin | library: `CharP R p`, `PerfectRing R p`, `v : Valuation K ℝ≥0`, `v.Integers R`, ϖ ≠ 0, v(ϖ) < 1, the (p,[ϖ])-adic topology on W(R); README states the valuation-ring and 0 < v(ϖ) < 1 conditions; no bundle or modification file in that directory (14 files listed) | Agrees |
| Library pins (`README.md:52`, `:61`) | `lake-manifest.json` | Mathlib `1b1ccf4b088b…`, Tau Ceti `2fd255d997f4…` on both sides | Agrees |
| Description, "the 23 groups" | bullets of the module docstring of `Suggested.lean` | 23 bullets counted | Agrees |

The rows of the earlier reviews for the untouched statements stand as in the previous review, of `cb12b64`.

- Library declarations opened at the pins, 15, each at the line the README now gives: `Isocrystal.lean` 112, 131, 137, 156, 171, 179; `Baire/Lemmas.lean` 167, 287; `Baire/CompleteMetrizable.lean` 27; `BDeRham.lean` 75; `Tannaka/GroupFunctor.lean` 138; `Subcomodule/Finite.lean` 152, 300; `ExteriorStabilizer/Character.lean` 101; `FarguesFontaine/Adic.lean` 158, 224.
- Gate, run again at `794d213`: every check 0, `OK`; the worker's run, which includes the targeted build, reports `build=0`.
- Dependency check: `depcheck: 239 roadmaps, 2256 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The merge order lists this roadmap at line 263.
- Elaboration: `lake env lean` on `TauCetiRoadmap/AdmissiblePairsAndPadicHodgeStructures/Suggested.lean` exits 0 with no output. The file has 0 declarations (only its docstring changed), so there is nothing for the one-tactic probe or a `#check` comparison.
- Outside-folder diff against `origin/main`: empty. The diff touches no heading, `*Needs:*` line, supplier citation or locator; the six suppliers the description calls "on main" without a task-list entry (ReductiveGroups, ReductiveGroupsPartII, AdicSpaces, AdicSpacesPartII, PerfectoidSpaces, AlgebraicVectorBundles) are on main.
- Title and description, read against the head: adds a new roadmap (not on `origin/main`), three files, no declaration, no `sorry`, no `set_option`, single `import Mathlib`, pins `1b1ccf4b` and `2fd255d9`, conditional Ax–Lindemann summit, DVR generality as in §§0.1, 0.2, 0.5: all agree. Source locators read: 1 (HKII lines 2876–2891); of the seeded sample only §12.2–12.3 falls in the changed text.
- Overlap check: read BunGAndNewtonStrata, HeckeStacksAndLocalShtukas, PadicHodgeTheoryPartII, IgusaVarietiesAndTorsionConcentration, GeometricSatakeAndFusion, AdicSpacesPartV, DiamondsAndVStacks; nothing shared. PadicHodgeTheoryPartII's "admissible pairs" are weakly admissible (b, μ) imported from PadicHodgeTheory §5.5, and its §3.2 open derived image concerns generic crystalline period points, not the motivic Galois group of §3.3 here. Remark: both roadmaps declare a Serre–Sen openness gap on PadicHodgeTheory (§4.4 there, §5.5 here).
- Source independence: changed passages only; 2 passages compared with 1 source (the §12.3 route and the docstring sentence against HKII lines 2876–2891), none shared; largest share HKII, 154 of 229 line locators; arrangement not compared again, since the diff adds, removes or reorders no layer.

## Not verifiable

- "AI assistance: codex (gpt-6.1-sol) ported the package" in the description is an account of the pull request's history and was not checked.
- The items of the earlier reviews stand: declared gaps are contracts; AdicSpacesPartV read only as a board design; published versions of HKI and HKII not collated.

## Source issues

- **Gap** in HKII at §10.1, printed p. 64 (HKII lines 2889–2891): the source says a reduction to a rigid variety is impossible because the monodromy is onto Z_p×; it should argue locally near the generic point of the reduction, since the Tate-curve Z_p-tower has full monodromy and reduces to G_m; affects the proof.

## For the human reviewers

- none
