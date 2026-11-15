# Review of ModularCharactersAndBlocks (pull request #1775 at 8379fba)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** accepted

Incremental re-review of 0 changed lines since `8379fba`; this round reads the pull request's title and description against the head. No findings.

## Previous findings

- none: the previous report, of `8379fba`, had no finding.

## Verified sound

| Row | Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- | --- |
| A01 | `mem_pPrimeCore_iff_forall_principalBlock` with `SameBlock` and `pPrimeCore` (the kernel theorem the description cites) | `S₃` at `p = 2` and `p = 3`; `C₂` at `p = 2`; `G = 1` | `S₃`, `M ∋ 2`: sgn vs 1 gives `−6, 0` (in `M`), std vs 1 gives `−3 ∉ M`; block `{1, sgn}`, right side `C₃`; normal odd-order subgroups `1, C₃`, sup `C₃`. `M ∋ 3`: `−6, −3, −3 ∈ M`, std faithful, right side `1`; left `1`. `C₂`: `−2 ∈ M`, both `1`. `G = 1`: both `G` | Pass | none |
| A02 | `card_simpleModules_eq_card_pRegularClasses` (the count the description places in §2.2) | `S₃`, `p = 3`; `C₃`, `p = 2`; `C_p` | `S₃`: simples `1, sgn` = 2; classes of order prime to 3: `{1}`, transpositions = 2. `C₃` over an algebraic closure of `𝔽₂`: 3 and 3. `C_p`: 1 and 1 | Pass | none |

The rows for the other statements stand as in the previous review, of `8379fba`.

- Gate: the worker's gate at `8379fba` passes every check (`build=0`, `depcheck=0`, `outside-folder=0`). The diff against main outside the folder and the family index is empty.
- Dependency check (candidate order, `--movable`, `--pr 1775`): `depcheck: 246 roadmaps, 2235 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. This roadmap is line 103 of the order; its open suppliers ArithmeticGaloisDuality (62) and GL2AutomorphicRepresentationsAndTransfer (102) precede it.
- Elaboration of `Suggested.lean`: exit 0, 13 warnings, all `declaration uses sorry`. The file has 13 theorems and 5 definitions, as the description says; the worker's elaborated signatures show no lost binder.
- Title and description against the head, 30 sentences checked: the layer summary (Layers 0–8, §8.4 and the Downstream consumers entry at `README.md:1383–1413`), the reused roadmaps and sections (`README.md:72–116`), the §4a.3 route (`README.md:1226–1235`), the generality claims for §§2.2, 2.3, 2.4, 6.2 (`README.md:539`, `556–561`, `581–611`, `642`, `1014–1016`, `1066`, `1084`), the milestone mapping (`README.md:285–286`), the inflation law in §8.2 (`README.md:1311–1316`), the not-statable headlines (`Suggested.lean:29–36`), and the three family-index sentences against the index diff (`TauCetiRoadmap/RepresentationTheory/README.md:29–32`, `78–82`, `128–137`). None is contradicted; the pull request adds the roadmap, removes no heading or declaration, and names every roadmap supplier of the README.
- Cross-roadmap citations resolved at this round's heads: §R17.5.11 and §R17.5.12 (GL2AutomorphicRepresentationsAndTransfer at `5b20d73`, README lines 2928 and 2943), §R02.4.4 (ArithmeticGaloisDuality at `66647f8`, line 3521), §4a.3 (RamificationOfCompleteDiscretelyValuedFields on main, line 1185), CharacterTheory §§3.5, 4.3, 4.5 (main, lines 497, 741, 817). The resolver lists nothing unfound; neither the folder nor the index names LocalFiniteGroupTheory. GlaubermanZStar (`581115c`) cites `M1`, `M2`, `M4`, `M5`, `M7`, `M8`, as the description says.
- Family index: the diff of #1146 (`e5e8364`) still fails to apply on this head at index line 115 and that of #1047 (`7fcba97`) applies, as the description says. This head merges with main (`8ad4192`) without conflict.
- Remark: #1220, which the description lists among the open pull requests changing the index, has merged (main `1d2aa9a`); the head still merges with main cleanly.
- Remark: OddOrderTheorem at its open head (`b3bd1fe`, README lines 32–33 and 319–321) defines the `π`-cores itself; §0.3 here is earlier in the merge order and is the owner, as the description's first bullet says.

Overlap check: read GlaubermanZStar, OddOrderTheorem, SemisimpleAlgebras, FiniteGroupInvariants, ModularInduction, CharacterTheory, InductionRestriction; the `π`-cores are shared with OddOrderTheorem §1.1, owner this roadmap §0.3 (earlier in the merge order); nothing else shared.

Source independence: changed passages only; 0 passages compared, since the folder did not change; the arrangement was not compared again (no layer added, removed or reordered).

## Not verifiable

- Navarro (`navarro`), Theorem 6.10, and Serre (`serre`), Part III §§15.2 and 16.1: settled as uncertified and cited by locator.
- The two Axiom formalizations under References were not opened.

## Source issues

- none

## For the human reviewers

- Licence: `README.md:1438–1440` names two files of the public repository AxiomMath/CFSG as proof sources for §§7.2 and 7.3; the declarations of `Suggested.lean` were not compared with that repository, and its licence was not read.
- Licence: `martinez` (course notes, Firenze 2024) and `craven` (lecture notes, 2008) are unpublished notes read from their authors' pages; the published sources `webb` and `sambale` carry most locators.
