# Review of IntegralLattices (pull request #1411 at 60aa3a4)

**Verdict:** needs changes

Incremental re-review of 0 changed lines since `60aa3a4`, and of the title and description as they stand. One finding, P3, in the description; the folder's files need no change. `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`.

## R01 (P3) — The description's list of passages that revise #617 still omits two

- **Location.** Pull request description, paragraph **IntegralLattices**: "It contains #617's changes to this folder and revises some of them: the opening and scope paragraphs and §*Theta series*, the supplier contracts, 1H, 3D, … the introduction of Layer 5, 5A, 6F, 7C, 7E, 8S, …".
- **Claim.** This head also differs from #617's text in §*How to read the build* and in the introduction of Layer 7; the list names neither, and no "beyond #617" bullet covers them.
- **Witness.** #617 (`da24d08`) `README.md:606` and `2827`: "stabilizer-index and Conway–Sloane dictionaries of 7C"; this head `README.md:614` and `3062`: "the Conway–Sloane dictionary of 7C".
- **Repair.** In that sentence replace "the supplier contracts, 1H," by "the supplier contracts, §*How to read the build*, 1H," and "the introduction of Layer 5, 5A, 6F, 7C, 7E, 8S," by "the introductions of Layers 5 and 7, 5A, 6F, 7C, 7E, 8S,".

## Previous findings

- R01 — not repaired: the description's list still reads "the supplier contracts, 1H, 3D, …, the introduction of Layer 5, 5A, 6F, 7C, 7E, 8S"; §*How to read the build* and the introduction of Layer 7 are absent. Raised again as R01.
- R02 — repaired: the summary block now reads "the local densities, whose dictionary to Conway–Sloane's local masses at odd primes is 7C's one target"; it agrees with `README.md:3202–3204`.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| Summary block: `⟨1⟩ ⊥ ⟨56⟩` and `⟨7⟩ ⊥ ⟨8⟩` over `ℤ₂` share the invariants and the space, not isometric (3D Check, `README.md:1039–1045`) | the pair itself | both: scales `1, 8`, ranks `1, 1`, odd, det `56`; `7 ∈ ℤ₂² + 2ℤ₂`, `56 ∈ 8ℤ₂² + 16ℤ₂`; Hasse `(1,56)₂ = (7,8)₂ = (2,7)₂ = +1`; `x² + 56y² ≡ 0, 1, 4 (mod 8)`, never `7` | pass | none |
| Summary block: 7C's one target, `m_p(L) = p^{v_p(det L)(n+1)/2}·α_p(L)⁻¹`, odd `p` | `⟨3⟩` at 3; `⟨1⟩` at 3 | `⟨3⟩`: `3x² ≡ 3 (mod 3^r)` has 6 solutions, `α = 6`, `3¹/6 = 1/2`, the rank-1 local mass; `⟨1⟩`: `α = 2`, `1/2` | pass | none |
| Description: `Suggested.lean` differs from #617's in two docstrings | `diff` with `da24d08` | two hunks: the module docstring (3D, 5 lines added) and the docstring of `sameGenus_iff_of_isEven` | pass | none |
| Description: headings and layers against main | the worker's change table | 0 headings removed; `### Examples`, `### Dependencies` added (Layer 8), as the 8S bullet says | pass | none |

The rows for the untouched statements stand as in the previous review, of `60aa3a4`.

- Changed passages in the folder: none (0 lines); `Suggested.lean`, the README and the pins are those the previous review read. Seeded sample B1–B8: none falls in a changed passage; not re-read.
- Title and description against this head: the summary block's three paragraphs checked against `README.md:3–43` (native results by declaration, the stop at Eichler's theorem, the three principal results), `1039–1057` and `3666` (3D), `1783–1810` (B5), `3202–3204` (7C); the paragraphs **Order with #617** and **Dependencies** against the supplier table (`README.md:549–581`) and the overlap list. No sentence is contradicted; the one omission is R01.
- Description against #617's head `da24d08`: the two passages of R01 re-read at both heads (`606`/`614`, `2827`/`3062`); #617's 7C (`2949`) still names the stabilizer-index statement as a target, and 7C is in the list.
- Gate: the worker's gate passes every check at `60aa3a4`, build included. `depcheck: 261 roadmaps, 2615 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. Against `origin/main` nothing changes outside the two roadmap folders.
- Elaboration: `lake env lean` on `Suggested.lean` exits 0 with 15 warnings, all "declaration uses `sorry`".
- Overlap check: read OrthogonalTamagawaAndLatticeMass, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmetic, LevelOneAutomorphicFormsForClassicalGroups, ThetaSeries, GlobalQuadraticForms (scopes as read for `dfca92f`; nothing in the folder changed since); shared: the determinant `−1` reflection of a local stabilizer, owned here over `ℤ_p` (N0). #617 conflicts in this folder and the description states the order (#617 first). No cited id is dropped by an open pull request, and none is defined only by an open revision.
- Source independence: changed passages only: 0 passages changed, so none compared; largest share `omeara1963`, about 38 of about 120 locators; contents not compared with `omeara1963`, whose text and table of contents are not in the cache. No layer is added, removed or reordered.
- Research link: Layer 5 states the existence and primitive-embedding theorems of Nikulin (1979) used in K3 lattice theory; Layers 3, 4 and 7 supply the genus, class and local-density inputs of the mass formula as in Conway–Sloane (1988) and Cho (2015), assembled by OrthogonalTamagawaAndLatticeMass. Rests on the README's References and scope.
- Remark: the description's paragraph on QuadraticFormInvariants and the title's second half were not checked here; that folder has its own review.

## Not verifiable

- `conway-sloane-mass1988` §12 and equation (6) (7C): waived; the dictionary was checked by computation only.
- Everything listed under this heading in the review of `dfca92f` stands unchanged (Cox; `cohen1993`; Cassels; `omeara1963`; Nikulin 1979; the other uncertified sources).

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of the locators is `omeara1963` (about 38 of about 120); its text and table of contents could not be read, so wording and arrangement were not compared against it.
- **Scope.** B3's count of ambiguous classes for non-maximal orders of positive discriminant (`README.md:1544–1578`) is proved in the README with no refereed locator; Cox covers negative discriminants only.
