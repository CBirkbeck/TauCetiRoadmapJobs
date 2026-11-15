# Review of AutomorphicSpectralTheoryPartII (pull request #1761 at 63133f5)

**Verdict:** accepted

Incremental re-review of the 118 changed lines since 6e7ba4f (`TauCetiRoadmap/AutomorphicSpectralTheoryPartII/README.md`, 61 insertions and 57 deletions; `Suggested.lean` and `metadata.toml` unchanged), and the check of the pull request's title and description against this head. No finding.

## Previous findings

- The previous report (6e7ba4f) was an acceptance with no finding: nothing to carry.

## Verified sound

**What the diff does.** Thirteen `###` headings are retitled and each gains a one-paragraph statement of what the group contains and which sections consume it; twenty-two sections (0.3, 0.6, 0.8, 2.8, 2.10, 2.11, 2.13, 2.14, 2.17, 2.18, 3.4, 3.6, 3.6a, 3.7, 3.9, 3.10, 4.5a, 4.6, 4.7, 4.9, 5.2, 5.3) become bold run-in headings under the preceding `###`. No section number, statement, locator, API bullet, Check, `*Needs:*` line or layer changes; no layer is added, removed or reordered.

**The thirteen new paragraphs: their "use" sentences, each recomputed from the `*Needs:*` lines at this head.**

| New paragraph (README line) | Claim | `*Needs:*` lines that carry it (README line) | Result |
|---|---|---|---|
| §0.2 (205) | §§0.8, 4.8 use §0.3 | 404 `§0.3; §0.7`; 1494 `§4.6; §4.7; §0.3; §0.8` | true |
| §0.5 (314) | §§0.7, 0.10, 1.7, 5.2 use §0.5; §§1.1, 1.2a, 1.3 use §0.6 | 387, 442, 560, 1570; 466, 498, 514 | true |
| §0.7 (373) | §4.3 uses §0.7; §§1.8, 4.8, 5.2 use §0.8 | 1373; 574, 1494, 1570 | true |
| §2.7 (788) | §§2.10, 2.13, 3.8, 3.9 use §2.7; §§2.10, 2.11, 2.15, 3.4 use §2.8 | 856, 934, 1227, 1244; 856, 881, 981, 1132 | true |
| §2.9 (817) | §2.12 uses §2.9; §§2.15, 2.16, 3.3, 3.7 use §2.10 or §2.11 | 909; 981 (both), 1025 (§2.10), 1115 (§2.11), 1203 (§2.11) | true |
| §2.12 (895) | §§2.16, 3.8 use §2.12; §2.16 uses §2.13; §3.3 uses §2.14 | 1025, 1227; 1025; 1115 | true |
| §2.16 (1019) | §§3.3, 3.6 use §2.16; §3.4 uses §2.18 | 1115, 1173; 1132 | true |
| §3.3 (1101) | §§3.6, 3.7, 3.8, 3.9 use §3.4 | 1173, 1203, 1227, 1244 | true |
| §3.5 (1142) | the Summary names regular wave packets | line 3: "regular wave packets and Schwartz kernel expansions" | true |
| §3.8 (1213) | the Summary names Schwartz kernel expansions; Downstream consumers lists §§3.8–3.10 | line 3; line 1667 "(§§3.8–3.10)" | true |
| §4.5 (1413) | §4.8 uses §§4.6–4.7; §4.9 uses §4.7; §5.7 uses §4.5a | 1494; 1511; 1649 | true |
| §4.8 (1480) | §5.3 uses §4.9 | 1589 `§4.9; §5.2; §5.1; §4.3; …` | true |
| §5.1 (1529) | §§5.4, 5.6, 5.7 use §5.3; §5.7 also uses §5.1 | 1605, 1633, 1649; 1649 `§5.3; §5.1; §4.5a` | true |

Each new paragraph was also read against the statements it summarises (0.2–0.3, 0.5–0.6, 0.7–0.8, 2.7–2.8, 2.9–2.11, 2.12–2.14, 2.16–2.18, 3.3–3.4, 3.5–3.7, 3.8–3.10, 4.5–4.7, 4.8–4.9, 5.1–5.3): none claims more than the section states (e.g. §2.7 "after a fixed extra power of σ_P" = the `d₀` of §2.8; §3.5 "under that property" = (HP) of §3.7; §5.1 "value 1 at χ whose range lies in the sum of the components where χ occurs" = §5.3).

**Adversarial table** (statements the changed text cites; the diff changes no statement).

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §0.2 paragraph / `polynomial_zero_fiber_interpolation`: zero set exactly `q⁻¹(Ψ⁻¹(0))`, rapid strip decay | ψ≡1; ψ≡0; n=0; q constant c | ν=exp(Σzᵢ²): modulus exp(x²−y²) ≤ e^{M²}e^{−y²}, never 0; ν≡0 with `HasFiniteEntireOrder 0` (0 ≤ exp); one-point domain, ν constant, zero iff ψ(c)=0 | true | none |
| §0.2 paragraph / `affine_lattice_interpolation`: zero on the lattice outside A, nonzero on A | k=0, A={a}; A=∅; n=k=1, a=0, b=1, A={0} | exp(Σzᵢ²) nonzero at a, no vanishing required; ν≡0 admissible; exp(z²)sin(πz)/(πz) has value 1 at 0, zeros at ℤ∖{0}, modulus ≤ e^{M²}e^{π\|y\|−y²} | true | none |
| §0.7 paragraph: "vanish for all but finitely many lattice points" (Definition 2.8(3)); seeds nonzero at a finite set (Lemma 2.10) | U(1), Y=ℤ: constant 1; the same damped sinc | 1 is nonzero on every translate: not sharp; damped sinc zero on all n≠0: sharp, value 1 at 0; bplzz lines 478–479, 495–496 | true | none |
| §4.5 paragraph: typicality = two finite-set membership conditions (Definition 3.11) | M=G: `(a_G^G)*=0`; compact central torus | no twist, conditions on χσ∞ alone; derived Casimir 0, central differential still tested; bplzz lines 1231–1234 | true | none |

The rows for the untouched statements stand as in the previous review, of 6e7ba4f.

**Seeded sample.** Four of the fifteen targets lie under a changed heading (0.5, 0.7, 2.12, 4.5); in each only the heading and the added paragraph changed. Locators re-read: 0.7 — bplzz lines 478–479 (Definition 2.8(3), p.10, marker 431), 484–493 (Remark 2.9, p.11, marker 482), 495 (Lemma 2.10); 4.5 — bplzz line 1231 (Definition 3.11, p.25, marker 1206); 0.5 and 2.12 as verified at 6e7ba4f (bplzz line 463; bpcz line 1327). The other eleven (0.10, 1.3, 1.8, 2.5, 2.6, 2.15a, 3.1, 4.1, 4.2, 4.2a, 5.7) are in untouched text.

**The pull request's title and description against this head** (step 8). The title and "Roadmap folder … (README, `Suggested.lean`, `metadata.toml`)" match a pull request that adds the folder (three files, 1811 insertions, not on main). Each sentence of the summary block and the prose was checked:

| Description | Head / source | Result |
|---|---|---|
| multipliers "acting by μ(χπ) on every irreducible admissible π (BPLZZ Theorem 2.13)" | README §1.7 line 556; bplzz lines 548–553 | agrees |
| "(BPCZ §§2.5, 2.9–2.10)" for the quotient spaces, projections, kernels | README Summary line 3; Layers 2–3 locators | agrees |
| "multiplier equal to 1 there whose range lies in the cuspidal-support components where that character occurs (BPLZZ Theorem 3.19)"; "Theorems 3.6–3.7" | README §5.3 line 1585, §5.4 line 1601; bplzz lines 1428–1435, 1120–1130 | agrees |
| "admits rank-zero sets, which BPLZZ exclude" | README §0.1 line 187; bplzz lines 401, 404 (`p > 0`) | agrees |
| "arbitrary comparable measurable functions rather than Franke's admissible ones" | README line 7 (Scope), §2.6 | agrees |
| "Every place in S, including dyadic and ramified ones … T may be infinite" | README line 23 (Conventions) | agrees |
| "extends the compact Paley–Wiener multipliers of AutomorphicSpectralTheory to moderate symbols" | README line 7, §1.7 "agrees with the … §§6.3–6.4 compact multiplier" | agrees |
| GanGrossPrasadUnitaryGroups "needs these isolation theorems and the scalar multiplier action … transfer-preservation theorem supplied elsewhere" | README lines 17, 1667; GanGrossPrasadUnitaryGroups §6.3a at its open head (README line 1370) | agrees |
| "the Lean states only real-bodied definitions and theorems"; "the Lean imports none of them" | 7 definitions with bodies, 3 theorems; the only import is Mathlib | agrees |
| "Validation: … 0" (identifiers, `set_option`, sorry'd data, dependency gate, outside-folder paths) | gate line below; `git diff --stat origin/main...HEAD` outside the folder: empty | agrees |

The description names no section title or heading, so the regrouping of this head makes none of its sentences wrong, and nothing a reader must know (a section removed or renumbered, a declaration removed, a supplier added or dropped) is unstated: every section number is kept and the suppliers are those of 6e7ba4f.

**Counts.**

- Source locators checked against the text this round: 9 (bplzz lines 401, 404, 478, 495, 548, 1120, 1128, 1231, 1428), all as cited.
- Cross-roadmap citations resolved: LocallyConvexDuality §§5.1–5.2 at its open head (README lines 571, 592); GanGrossPrasadUnitaryGroups §§6.2a–6.4 and §6.3a at its open head (lines 1314, 1336, 1370, 1394). `roadmaps resolve` and `overlaps` list nothing; no other roadmap, open or on main, cites a section of this roadmap by title (`roadmaps grep` finds two citations by name only, BanachSpaceTheory line 1998 and NoncommutativeGeometry line 1856), so no retitled heading breaks a citation.
- Gate at 63133f5: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK` (the worker's run with the targeted build; my run of the text and dependency checks agrees).
- Dependency check with `--movable`: `depcheck: 238 roadmaps, 2254 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line.
- Elaboration: `lake env lean TauCetiRoadmap/AutomorphicSpectralTheoryPartII/Suggested.lean`: three `declaration uses sorry` warnings (lines 95, 108, 118), nothing else. The Lean file is byte-identical to 6e7ba4f; the ten recorded signatures equal the README statements (no section binder lost), and the one-tactic probe of the previous review stands.
- Shape of the changed lines: Unicode mathematics, no process words, paths, round labels or pull-request numbers; each run-in section keeps its statement, API, proof route, `*Needs:*` and Checks unchanged; every layer still ends with `### Examples` and `### Dependencies`.
- Remark, no change asked: the heading of §4.8 (line 1478) shares a seven-word phrase with the title of bplzz §3.3 (bplzz line 26); it is a short description that the mathematics all but forces, and the group's scope (Lemma 3.14 and Proposition 3.15 only) is not that subsection's (which also holds what §§4.5–4.7 state).
- Remark, no change asked: the module docstring of `Suggested.lean` still names two not-statable headlines by the former titles ("Weighted Sobolev evaluation…", "Archimedean annihilators…"); both remain identifiable with §§2.7–2.8 and §§4.8–4.9.

Overlap check: read AutomorphicSpectralTheory, GanGrossPrasadUnitaryGroups, AutomorphicFormsOnReductiveGroups (scope sections, for the objects the changed paragraphs name); nothing shared — the diff adds no object, and the ownership recorded at 6e7ba4f stands.

Source independence: changed passages only — 26 passages (13 retitled headings, 13 new paragraphs) compared with 2 sources (bplzz contents lines 12–34 and §§2.1–2.2, 3.3–3.4; bpcz §§2.5.5–2.5.15, 2.9.1–2.9.8, 2.10.1–2.10.2 headings and openings), no sentence shared, longest common run seven words (the §4.8 heading); largest share bplzz, 45 of 91 parenthetical locators; the diff adds, removes or reorders no layer, so the contents comparison of the earlier full review stands: independent.

## Not verifiable

- `bernstein` (Bernstein 1988, cited at §§2.7–2.8): settled as uncertified; cited by locator only; its statements are untouched by this diff.
- The description's "4 independent review rounds and 2 red-team rounds on the job board": a record of the board, not of this head; not checked.

## Source issues

- none

## For the human reviewers

- The description's summary block says "The route follows BPLZZ … and BPCZ for the quotient analysis"; the README itself makes no such statement, and bplzz carries 45 of its 91 parenthetical locators (bpcz 35).
- The heading of README line 1478, "Archimedean annihilation of all but finitely many components", contains the seven-word title of bplzz §3.3 (bplzz line 26).
- The generated depends-on block lists GanGrossPrasadUnitaryGroups (#1404) as a supplier that merges first; the README names it only under Scope (owner of §6.3a) and Downstream consumers (line 1667), and no `*Needs:*` line cites it.
