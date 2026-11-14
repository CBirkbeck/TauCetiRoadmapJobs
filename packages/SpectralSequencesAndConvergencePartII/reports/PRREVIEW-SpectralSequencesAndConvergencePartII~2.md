# Review of SpectralSequencesAndConvergencePartII (pull request #2307 at b05690b)

**Verdict:** accepted

Incremental re-review of the 18 lines changed since `3d767c2` (all in `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md`). No findings.

## Previous findings

- R01 — repaired: README.md:1510–1512 “the transgression is `d₂` in the five-term sequence and `d_{m+1}` in the extended sequence, using the row-gap identifications with page `m + 1`”; the `m = 2` bidegree Check is at README.md:1530–1533.
- R02 — repaired: README.md:1321 “column resolution of 2.3's second Check (*Column resolutions are not enough*)”.

## Verified sound

Sections refer to `TauCetiRoadmap/SpectralSequencesAndConvergencePartII/README.md`. Differentials have bidegree `(r, 1 − r)`; `E₂^{p,q} = R^pG(R^qF(A))`.

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| §3.3 extended sequence, transgression `d_{m+1}` (lines 1510–1512) | `m = 1, 2, 3` with rows `0 < q < m` zero | `d_r` from `(0,m)` lands at `(r, m−r+1)`: row in `[1, m−1]` for `2 ≤ r ≤ m`, row `0` and column `m+1` exactly at `r = m+1`. `m=1`: `d₂`; `m=2`: `d₃`; `m=3`: `d₄`. | holds | none |
| §3.3 row-gap identifications with page `m + 1` | positions `(0,m)` and `(m+1,0)`, pages `2 ≤ r ≤ m` | Leaving `(0,m)`: targets in rows `1..m−1`, zero; entering `(0,m)`: column `−r < 0`. Entering `(m+1,0)`: sources `(m+1−r, r−1)`, rows `1..m−1`, zero; leaving: row `< 0`. So `E_{m+1} = E₂` at both. | holds | none |
| §3.3 Check “The page of the transgression” (lines 1530–1533) | `m = 2` | `d₂ : (0,2) → (2,1)`, and `E₂^{2,1} = 0`; `d₃ : (0,2) → (3,0)`; bidegrees `(2,−1)` and `(3,−2)`. | agrees with the statement | none |
| §3.3 five-term sequence against the Check “The third map can be nonzero” | `ℤ → ℤ/4`, `A = ℤ/2`, `m = 1` | Sequence `0 → ℤ/2 → ℤ/2 → ℤ/2 → ℤ/2 → 0`; `d_{m+1} = d₂ : (0,1) → (2,0)` an isomorphism; consistent with lines 1510–1511 at `m = 1`. | consistent | none |
| §3.3 merely additive `F` (lines 1501–1503, 1510) | `F = − ⊗ ℤ/2`, `G = id`, `A = ℤ` | `R⁰F(ℤ) = 0`, `R⁰(G ∘ F)(ℤ) = 0`, `G(F(ℤ)) = ℤ/2`; `G` left exact gives `E₂^{0,m} = G(R^mF(A))`, so the transgression's source is as written. | holds | none |
| §2.5 Check “The Cartan–Eilenberg conditions are needed” (lines 1320–1325) | double complex of §2.3's second Check: columns `ℚ → ℚ/ℤ`, horizontal `×2` | Row `0`: `ℚ →(×2) ℚ`, cohomology `0, 0`. Row `1`: `ℚ/ℤ →(×2) ℚ/ℤ`, kernel `ℤ/2` in column `0`, cokernel `0`. Only class: resolution degree `1`, column `0`, i.e. `(1,0)`. `R^pF(H^qK)` with `F = id`: `ℤ/2` at `(0,1)`. Both total degree `1`; `H¹(K) = ℤ/2`. | holds | none |
| §2.3 third Check, no longer cited by §2.5 | `K = (A →(id) A)` | Horizontal maps identities, horizontal cohomology `0`: would give no `ℤ/2`; the corrected reference avoids it. | consistent | none |

Rows for the statements the diff does not touch stand as in the previous review, of `3d767c2`.

- Source locators checked: 1 in the changed passages (grothendieck1957 line 1330–1337, Théorème 2.4.1: second functor left exact, first sends injectives to acyclics for it, initial term `R^pG(R^qF(A))`); the seeded targets 2.5 and 3.3 fall in the diff, and their changed text adds no locator.
- Cross-roadmap citations resolved: SpectralSequencesAndConvergence §3.6 at the head of its open pull request (edge morphisms, five-term and extended first-quadrant sequences present under “First quadrant”).
- Lean: the diff changes no declaration; 13 signatures unchanged; `lake env lean` on `Suggested.lean` gives 11 `sorry` warnings and nothing else.
- Gate at `b05690b`: every check passed, including the targeted build; rerun of the text scanners: all 0. Outside-folder diff: 0 paths.
- Dependency check: `depcheck: 243 roadmaps, 2197 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Pull request text: adds a roadmap (3 files, 46 headings, 13 declarations), as the title and description say; the change since `3d767c2` removes no section, declaration or supplier, and no sentence of the description is contradicted by this head.
- Remark (untouched text, no change asked): the supplier contract for SpectralSequencesAndConvergence §3.6 (README.md:494–502) names `d_2` and the edge morphisms only for the five-term sequence; §3.3 itself now carries the identification of the extended sequence's third map with `d_{m+1}`.
- Remark (no change asked): the description's paragraph ending “It covers:” is followed by no list.

Overlap check: read SpectralSequencesAndConvergence (open), DerivedModuleAlgebra and GrothendieckEulerForms (main); the changed passages add no object; first-quadrant edge morphisms and low-degree sequences stay with SpectralSequencesAndConvergence §3.6, cited by §3.3; nothing shared is owned twice.

Source independence: changed passages only; 3 passages compared with 1 source (grothendieck1957), none shared; largest share stacks-05QI, 17 of 90 locators; the diff adds, removes and reorders no layer, so the contents comparison stands as in the previous review: independent. Wording against the four uncertified works was not tested.

## Not verifiable

- weibel1994, mccleary2001, cartan-eilenberg1956, massey1954: settled as uncertified; none is cited in the changed passages, and no text was read.

## Source issues

- none

## For the human reviewers

- may-primer is an author-hosted primer with no journal publication identified in the roadmap's references; §§5.1–5.2 and §§6.1–6.2 cite it. Four other works (weibel1994, mccleary2001, cartan-eilenberg1956, massey1954) are uncertified; their wording could not be compared.
- Acceptance is conditional on the 19 declared supplier gaps on SpectralSequencesAndConvergence, which is still an open pull request and merges first.
