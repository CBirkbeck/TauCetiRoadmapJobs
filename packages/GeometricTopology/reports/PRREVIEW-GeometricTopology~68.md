# Review of GeometricTopology (pull request #1797 at 11a9ca1)

**Verdict:** needs changes

:robot: AI review of the folder `TauCetiRoadmap/GeometricTopology/` at this head. Incremental re-review of the 6 lines changed since `84818d4`, the head the previous review read (one commit touching this folder, `51ebd8a5`, which adds one paragraph under "## Layer 12"): the previous findings first, then the changed passage in full, the gate, the elaboration and the overlap facts. The worker's gate passes every check (every counter `0`, `OK`). Every claim below is checked at the pins of `lake-manifest.json` (Tau Ceti 2fd255d9, Mathlib 1b1ccf4b), against main or the open heads the brief names, or in the worker's sources cache. The previous R01 is repaired and the repair introduces no new problem; the previous R02 (the pull-request description) is unchanged and is the only finding. Nothing blocks.

## R01 (P3) — The pull request description does not describe this folder's change and states no order against the three conflicting pull requests (previous R02, not repaired)

Location: `scratch/pull-request.md` (data), whose only sentence on this folder is still "GeometricTopology: the `references/` folder of twenty-seven quoted source extracts is removed; the README keeps each chapter, theorem and page locator and drops the links to the extracts."

Claim: the description describes the pull request's changes to this folder and names which of the conflicting pull requests is rebased on which.

Witness: the folder at this head is a 3348-line README in roadmap form (twelve layers, exact supplier contracts) and a `Suggested.lean` of 23 headline theorems on native carriers (`git diff --stat origin/main...HEAD -- TauCetiRoadmap/GeometricTopology`: README.md and Suggested.lean rewritten, `references/` deleted); the description says "No statement changes" and describes only the deletion of `references/`. `scratch/overlaps.md` at this head: #903 (@kim-em), #1517 (@user202729) and #1791 (@mccorvie) conflict with this head in `README.md`, #903 and #1517 also in `Suggested.lean`; the description names none of them. The commit since the previous review (`51ebd8a5`) changes only `README.md`, so nothing on this finding moved; the repair report of the earlier round answered it with the text to state (#1517 and #1791 edit lines this head replaces wholesale, so they are rebased on this head; #903 and this head cannot both merge, so whichever merges second is rebased on the first) and said the description is outside what a repair job edits.

Repair: a paragraph in the pull request description, never in the README: what this folder's change is (the README in roadmap form; the twenty-three headline theorems stated on the native `TauCeti` carriers; the Tau Ceti modules of the supplier contract), and that #1517 and #1791 are rebased on this head and which of #903 and this head is rebased on the other. No file in the folder changes. Retest: the description names the three pull requests and one order; `grep -n 'pull/\|#1[0-9][0-9][0-9]' README.md` still matches nothing.

## Previous findings

- R01 — repaired: `README.md:3116–3120`, "This layer is the section earlier headed "The smoothing-and-triangulation comparison (far horizon)", renumbered: its item 1 (smooth implies PL) is 12.1, its item 2 (PL implies Top) is 12.2, and its item 3 (Top to PL) is 12.3 in dimensions at most four, with the Kirby–Siebenmann obstruction … left to a GeometricTopology Part II". Checked against main's section (below); no new problem.
- R02 — not repaired: the description's sentence on this folder is unchanged and names none of #903, #1517, #1791 (R01 above).

## Verified sound

**Head and diff.** `git rev-parse HEAD` is 11a9ca13ba7fc27623029f3d84d5965af01f88dc; the folder changed by one commit since `84818d4` (`51ebd8a5`, "GeometricTopology: review repairs (Layer 12 records the old far-horizon section and item numbering)"), 6 README lines inserted, 0 deleted, exactly the diff of `scratch/changes.md`; `Suggested.lean` is byte-identical to the file the previous review elaborated. The later commit `11a9ca13` touches only `TauCetiRoadmap/ReductiveGroups/`, one of the pull request's own folders. `git diff --stat origin/main...HEAD` outside the five folders the brief names is empty. The folder holds `README.md`, `Suggested.lean`, `metadata.toml` and the generated `PROGRESS.md`, `STATUS.md`.

**The changed passage against main.** Main's `GeometricTopology/README.md:930` is `## The smoothing-and-triangulation comparison (far horizon)` with three numbered items (`:937–949`): 1 smooth implies PL (Whitehead's smooth triangulation, Munkres), 2 PL implies Top (the inclusion `PLGroupoid ≤ continuousGroupoid`), 3 Top to PL with the Kirby–Siebenmann obstruction in `H⁴(M; ℤ/2)` and the failure of the Hauptvermutung. At this head: 12.1 (`:3122–3153`) is Whitehead's theorem with Munkres Theorems 10.5 and 10.6 and the finite CW type consequence; 12.2 (`:3157–3176`) is the native `TauCeti.PLGroupoid_le_continuousGroupoid` with the compatibility of the forgetful maps; 12.3 (`:3178–3215`) is Moise in PL form (dimension at most three) and the `E₈` failure (dimension four), and says in its last sentence that the Kirby–Siebenmann theorem is deferred in the scope statement and is no input of the layer. The Scope bullet `:125–133` says the same: the stable tangent microbundle, `BTOP`, `BPL` and the Kirby–Siebenmann theorem are stated in a GeometricTopology Part II that consumes Layers 11 and 12, where FourManifolds' contract `gap:tangent-microbundle-stable-classifier` is addressed. So the mapping paragraph's three clauses (1 → 12.1, 2 → 12.2, 3 → 12.3 in dimension at most four with the obstruction to Part II) are each what the sections contain. The paragraph adds no `*Needs:*` line, no Lean name and no supplier, and carries no pull-request number or round label; the gate's `residue`, `round-labels`, `readme-ids-missing` and `dropped` counters are `0`.

**The consumers of the dropped anchor and the item citations** (`roadmaps grep --readme-only 'smoothing-and-triangulation'`, 477 open heads then main). "Item 1" is cited by IndexTheory (#1077 `README.md:66`, the dropped anchor, and `:846`: "Whitehead's smooth triangulation of a smooth manifold"), PositiveMass (#956 `:57, :184, :702, :709, :809`), AnalyticStableMaps (#987 `:1081, :1090`), GromovWittenTheory (#990 `:32, :194`), HomotopySpheres (#1287 `:395, :704, :847`), RiemannianGeometry (#1327 `:106, :760, :1375`), PotentialAutomorphyInfrastructure (#1081 `:191`), ArithmeticKTheory (#1418 `:32`), TorsionCohomologyInfrastructure (#1087 `:816`, "Smooth implies PL"), ArithmeticLocallySymmetricSpaces (#871 `:457`, "Smooth implies PL"): every one consumes the smooth triangulation and its finite CW type, which is 12.1's first and third bullets, so the line "item 1 … is 12.1" sends each to the content it consumes. "Item 3" is cited by FourManifolds alone (#936 `:16, :175`: "the statement of the Kirby–Siebenmann obstruction"); that statement is the part of main's item 3 the mapping paragraph and the Scope bullet assign to Part II, and FourManifolds declares the carrier it needs as its own gap `gap:tangent-microbundle-stable-classifier` (#936 `:209`), so the mapping says exactly where that consumer's content went. No consumer cites item 2.

**The gate.** Worker's gate at this head: every counter `0`, `OK`. Dependency check, run here:

```
depcheck: 244 roadmaps, 2457 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `roadmaps resolve` (worker's run, `scratch/citations.md`): no cross-roadmap citation and no Lean name found nowhere.

**Elaboration and binders.** `lake env lean` on a scratch copy of `Suggested.lean` from the pull-request worktree, with `#check @TauCetiRoadmap.GeometricTopology.manolescu_theorem` appended after the namespace closes: exit 0 apart from my probe lines, 23 warnings, all `declaration uses sorry`, no other diagnostic, 16 s. The checked theorem elaborates to `∀ (n : ℕ), 5 ≤ n → ∃ M x x_1, TauCeti.IsClosedConnectedManifold n M ∧ ¬TauCeti.IsTriangulable M`, which is 11.2's Manolescu statement (closed connected `n`-manifold, `n ≥ 5`, not triangulable). The file is unchanged since the previous review, so its binder comparison (`signatures.md`: 24 entries, 0 lost binders; the entry `is` at line 70 is the tool reading the docstring words "theorem is stated") and its one-tactic probe (nothing is padding) stand. No Lean process was left running.

**Overlaps.** The three conflicting pull requests (#903, #1517, #1791) are R01. The dropped anchor `#the-smoothing-and-triangulation-comparison-far-horizon` (cited by IndexTheory #1077 `:66`) now has its old → new line in the README (previous R01, repaired). No id this README cites is dropped by an open pull request and none is defined only by an open revision (`scratch/overlaps.md`). Closest roadmaps in vocabulary (FourManifolds #936, PlanarTopology #271, TeichmullerGeometry #1169, KhovanovHomology #1187, HomotopySpheres #1287): the diff adds no object (the paragraph is a numbering map), so the previous report's ownership search stands.

**Seeded sample.** Of the sampled sections (1.2, 1.3, 2.1, 2.2, 2.3, 7.1, 7.3, 8.1, 8.4, 9.2, 10.2, 10.4, 11.2, 11.3, 12.2), only 12.2 is within reach of the diff: its text (`:3157–3176`) is untouched, its Needs line names `TauCeti.PLGroupoid_le_continuousGroupoid`, `TauCeti.doubleRight`, 1.5 and 12.1, and the mapping paragraph calls it "item 2 (PL implies Top)", which is main's item 2 (`:944–945`). The other fourteen sections are untouched by the diff and stand as the previous reports verified them.

**Adversarial table.** Rows A1–A105 of the previous reports stand for the passages this head leaves untouched (every statement and Check of Layers 1–12 and every headline of `Suggested.lean`); the one changed passage gets a row.

| # | Statement or object | Instances tried | Values on each side | Result / change |
|---|---|---|---|---|
| A106 | Old → new map of the far-horizon section (`:3116–3120`) | main's items 1, 2, 3 (`:937–949`); the consumers' "item 1" (eleven roadmaps), "item 3" (FourManifolds) | item 1 = Whitehead smooth triangulation ↦ 12.1 (Whitehead, Munkres 10.5–10.6, finite CW type: what all eleven consume); item 2 = `PLGroupoid ≤ continuousGroupoid` ↦ 12.2 (the native `TauCeti.PLGroupoid_le_continuousGroupoid`); item 3 = KS obstruction and Hauptvermutung ↦ 12.3 holds Moise (`n ≤ 3`) and `E₈` (`n = 4`), the obstruction (`n ≥ 5`) goes to Part II, which is what FourManifolds' citation names and what its gap `gap:tangent-microbundle-stable-classifier` covers | consistent with main, 12.1–12.3 and the Scope bullet `:125–133`; no change |

**Headline inventory.** Unchanged: 23 headlines stated; Reidemeister's theorem and the Alexander-route agreement not statable, named in the docstring (`Suggested.lean:54–57`).

## Not verifiable

- The previous reports' list stands for the untouched passages (Thurston 1986, Gabai 1983, Rourke–Sanderson, Hirsch, Lickorish 1962/1964, Farb–Margalit and Hoste–Thistlethwaite–Weeks settled uncertified; the in-copyright texts cited by locator). The diff cites no source: the mapping paragraph names no theorem.

## Source issues

- none
