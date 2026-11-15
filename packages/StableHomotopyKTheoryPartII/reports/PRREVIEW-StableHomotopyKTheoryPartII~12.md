# Review of StableHomotopyKTheoryPartII (pull request #1733 at 8947c46)

**Verdict:** needs changes

Incremental re-review: the folder has 0 changed lines since the previous review of 8947c46, and nothing changed outside it. This round read the pull request's title and description against the head. Both findings are about the description; neither asks for a change to the roadmap's files.

## R01 (P3) — The description says Steenrod operations come from Mathlib and Tau Ceti

**Location:** pull request description, summary block (`<!-- roadmap-summary -->`), last sentence: "Steenrod operations, Witt vectors and the residue correspondence are reused from Mathlib and Tau Ceti."

**Claim:** The head imports Steenrod operations from another roadmap, not from the pinned libraries.

**Witness:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/README.md:12`: "TangentialBordism §B4 items 1, 2 and 7 owns ordinary and stable Steenrod operations"; line 89 consumes them. The pinned Mathlib and Tau Ceti have no Steenrod operation (only Eilenberg–Steenrod axioms and the cup-one product).

**Repair:** Replace the sentence's second half by: "Steenrod operations and the Adams tower are imported from TangentialBordism §B4; Witt vectors, algebraic Tate cohomology and the residue correspondence are reused from Mathlib and Tau Ceti."

## R02 (P3) — The description says the Lean file states definitions and theorems; it states none

**Location:** pull request description: "the Lean states only real-bodied definitions and theorems statable against the pinned Mathlib and Tau Ceti", and under Validation: "the targeted Lake build succeeds with `sorry` as the only warning".

**Claim:** `Suggested.lean` at this head has no declaration and no `sorry`; a reader is not told that none of the headline theorems is stated in Lean.

**Witness:** `TauCetiRoadmap/StableHomotopyKTheoryPartII/Suggested.lean:60–64`: an empty namespace after the docstring, which lists fourteen headlines as not statable at the pins (lines 8–56). `lake env lean` on the file prints nothing.

**Repair:** Write instead: "`Suggested.lean` states no declaration: its docstring names the roadmap's fourteen headline theorems, none of which is statable at the pins because the spectral carriers are missing; every target is in the README." and "the targeted Lake build succeeds with no warning".

## Previous findings

The previous report (of 8947c46) had no finding of its own. Its two carried bullets:

- R01 — not repaired: the board manifest's `stacks-algebra` entry still lacks `authors`, `title` and `year`. Settled in the previous report as outside this pull request (the manifest is not in the folder); not re-raised.
- R02 — repaired: README line 15, "HermitianKTheoryOfPoincareCategories §5.1a owns the C₂ sphere comparison (the Segal–Lin theorem) … neither uses §5.1a", unchanged at this head.

## Verified sound

**Gate, dependency direction and elaboration at 8947c46**, run this round:

```text
gate StableHomotopyKTheoryPartII: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK
depcheck: 245 roadmaps, 2241 edges, 0 problem(s)
```

The gate line is the worker's record at this head; the dependency check and `lake env lean` on `Suggested.lean` (exit 0, no output) were run again.

**Adversarial table.** The diff changes no statement; the rows are for the statements the findings touch.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| TangentialBordism contract Check, README line 98 (the Steenrod operations of R01) | Adem at p=2, a=1, b=2; at p=3, a=b=1 | Sq¹Sq²: c=0 term binom(1,1)=1, so Sq³. P¹P¹: t=0 term (−1)¹·binom(1,1)=−1, so −P²=2P² in 𝔽₃. Both as the README says. | Pass | none |
| Owner of Steenrod operations (R01) | pins; README lines 12, 89 | Pins: 0 declarations of Sq, P or the Steenrod algebra. README: TangentialBordism §B4 items 1, 2, 7 (on main, position 16 < 345). | description wrong | R01 |
| `Suggested.lean` content (R02) | declarations; `sorry`; docstring bullets | 0 declarations, 0 `sorry`, 14 headlines listed as not statable; description implies ≥1 declaration and a `sorry` warning. | description wrong | R02 |
| §3.4, cited by the description's first sentence | X=S; X=Σ⁻¹H𝔽_p; X=KU at p=2 | π₀ target ℤ_p; 𝔽_p in degree −1 on both sides; KU₂^∧/2 has 𝔽₂ in even degrees against T₂(KU)/2=0, so bounded below is needed, as the description says. | Pass | none |

The rows for the untouched statements stand as in the previous review, of 8947c46.

- Description sentences checked against the head and found to agree: the C_p Segal statement without finite-type or cardinality restriction (§§2.7, 3.4); the unit detected through the imported Tate diagonal, with no genuine norm or Segal input (§2.6 route, §2.7); direct sums at a fixed truncation and one stabilization index from the eventual-range declarations (§§3.1–3.3, lines 410, 488); the consumers paragraph (Downstream consumers, line 1088); the folder's three files; 0 missing identifiers, 0 `set_option`, 0 sorry'd data, 0 outside-folder paths.
- Suppliers resolved: GeneralizedCohomology, BordismFormalGroups, EnhancedDerivedSheaves, AlgebraicTopology, TopologicalKTheory, StableHomotopyKTheory (17) and TangentialBordism (16) are on main; AInfCohomology 86, KTheoryFiniteLocalFields 95, PadicHodgeRegulators 339, RefinedTraceMethods 342 precede this roadmap at 345. HermitianKTheoryOfPoincareCategories (68) is cited as a parallel owner only.
- Library declarations opened this round: `TauCeti.residueFieldAutEquiv` is in `TauCeti/NumberTheory/LocalField/ResidueCorrespondence.lean` at the pin, as the description's "residue correspondence … from Tau Ceti" needs.
- Source locators checked against the text this round: 0 (no passage changed; none of the fifteen sampled targets falls in a changed passage).
- `overlaps.md` lists no shared roadmap, no dropped id and no id only an open revision defines.
- Remark, no change asked: the description does not mention the declared gap `steenrod-finite-hopf-chain` (README line 113), a contract that BordismFormalGroups §F6.3 on main does not yet state.

Overlap check: read GeneralAlgebraicKTheoryPartII, RefinedTraceMethods, BordismFormalGroups, ChromaticHomotopyTheory, StableHomotopyKTheory, EllipticCohomology; nothing shared. GeneralAlgebraicKTheoryPartII cites §4.8 here as the finite-field case of RefinedTraceMethods §6.1, and ChromaticHomotopyTheory cites §2.7 and §7.2 here as owner.

Source independence: changed passages only; 0 passages compared, since the folder did not change. Largest share ns18, 96 of 170 line locators; the arrangement was not compared again, no layer having been added, removed or reordered.

## Not verifiable

- The description's "after 2 independent review rounds and 2 red-team rounds on the job board": the board's history is not part of the head; not checked.
- The generated `depends-on` and `merge-order` blocks are outside the check of the text.

## Source issues

- none

## For the human reviewers

- none
