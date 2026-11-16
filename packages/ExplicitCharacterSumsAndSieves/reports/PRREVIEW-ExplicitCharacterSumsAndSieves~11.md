# Review of ExplicitCharacterSumsAndSieves (pull request #1948 at ebf1dc8)

**Verdict:** accepted

Incremental re-review of 36 changed lines since `438bce4` (the section `## Provenance: existing formalizations outside Tau Ceti` and its entry under `## References`), and of the pull request's title and description as they stand now. No finding.

## Previous findings

- The previous review, of `438bce4`, had no finding; nothing is carried.

## Verified sound

Every claim of the added section was read against the LeanPool repository at the commit the README cites (`f8b9b72`), file by file.

| # | Statement (README line) | Instances | Values (left / right) | Result |
|---|---|---|---|---|
| 1 | 1845–1846: the carrier `Sieve` has the fields of Mathlib's `BoundingSieve` | field lists, `LeanPool/SelbergSieve4/SieveLemmas.lean` 34–49 against `Mathlib/NumberTheory/SelbergSieve.lean` 54–74 at the pin | 10 fields each: `support`, `prodPrimes`, `prodPrimes_squarefree`, `weights`, `weights_nonneg`, `totalMass`, `nu`, `nu_mult`, `nu_pos_of_prime`, `nu_lt_one_of_prime` | same |
| 2 | 1846–1848: level `D`, weights supported on `d² ≤ D`, remainder `Σ_{d | P, d ≤ D} 3^{ω(d)}|r_d|` (`fundamental_theorem_simple`) | `MainResults.lean` 56–60; `Selberg.lean` 77–80, 90 (`selbergWeights_eq_zero`), 458–461 | weights vanish unless `d² ≤ level`; remainder sum over `d ∣ prodPrimes`, `d ≤ level`, summand `3^ω(d)·|rem d|` / as the README says | agrees |
| 3 | 1848–1849: SieveMethodsAndPrimePatterns §1.3 cuts off strictly at `d < z` | `P = 2`, `ν(2) = 1/2`: LeanPool at `D = 4`; supplier at `z = 2` (its lines 1263, 1641) | LeanPool: `2² ≤ 4`, sum `1 + g(2) = 2` / supplier: `d = 2` excluded, `G = 1` | the two cutoffs differ as stated |
| 4 | 1851–1853: `S(√z) ≥ (log z)/2` (`BrunTitchmarsh.boudingSum_ge`) is `S(u) > log u` of ExplicitPrimeCounting §0.1 at `u = √z`, non-strict | `selbergTerms` at `ν = 1/d`: `g(6) = (1/6)/((1/2)(2/3))`; `z = 4`; `z = 36` | `g(6) = 1/2 = 1/φ(6)`; `z = 4`: `l ∈ {1, 2}`, sum `2 = S(2)`, bound `0.693`; `z = 36`: `1 + 1 + 1/2 + 1/4 + 1/2 = 3.25 = S(6)`, bound `1.792` | same sum; true |
| 5 | 1853–1855: sifted count `≤ 2y/log z + 5z(1 + log z)³`, prime count `≤ 2y/log z + 6z(1 + log z)³`, for `x, y > 0`, `z > 1` | `BrunTitchmarsh.lean` 249–251, 261–262; `[1, 10]`, `z = 3` | sifted `{1, 5, 7}`: `3 ≤ 16.38 + 138.6`; primes `2, 3, 5, 7`: `4 ≤ 16.38 + 166.4` | constants and hypotheses as stated |
| 6 | 1856–1858: leading term `2y/log z` against `2y/log y` (§5.4 corollary) and `x/log z` (§5.6) | `[1, 10]`, `y = 9`; `Φ(9, 3)` | §5.4: `4 < 18/log 9 = 8.19`; §5.6: `3 < 9/log 3 = 8.19`; LeanPool leading term at `z = 3`: `16.38` | agrees with README lines 1438–1439, 1556 |
| 7 | 1860–1866: the four names, "every error constant there is shown only to exist", §5.2 of the supplier, Scope, Part II | `Rosser.lean` 381; `LinearSieve/TheoremFour.lean` 539–543; `LinearSieve/Estimate.lean` 122; `Jacobsthal.lean` 35–38; supplier heading 5.2 (its line 3369); README 99–101, 144 | `theorem4`: `∃ c₇`; `iwaniecBound`: `∃ C`; `LinearSieveEstimate`: `∃ C₀ c K z₀`; weights `μ(d)/d`, `R(z) = ∏(1 − 1/p)` | agrees |

The rows of the previous reviews for the untouched statements stand as in the previous review, of `438bce4`.

- Folder diff `438bce4..ebf1dc8`: 36 insertions in `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/README.md`, no statement and no line of `Suggested.lean` changed; nothing changed outside the folder against `origin/main`.
- External files opened at the cited commit: 12 (`lean-toolchain` = `leanprover/lean4:v4.35.0`, against `v4.36.0-rc2` here; `LICENSE`, Apache-2.0; both project headers, Apache-2.0, authors A. Mellendijk and J. Davies). The three names the citation tool lists as found nowhere (`BrunTitchmarsh.boudingSum_ge`, `BrunTitchmarsh.siftedSum_le`, `BrunTitchmarsh.primesBetween_le`) are LeanPool's, spelled as there, and are not claimed of `Suggested.lean`.
- Cross-roadmap citations resolved on main: SieveMethodsAndPrimePatterns §1.3 (line 1259) and §5.2 (line 3369), ExplicitPrimeCounting §0.1 (lines 629, 645); internal references §5.2–§5.6, Scope and Part II resolved (README lines 99–101, 144, 1342–1552). Remark: "Nothing there treats a weight `f`" is read with `f` Büthe's function of §5.3; the carrier's `weights` field is covered by row 1.
- Source locators: the seeded sample falls in no changed passage and was not rechecked; the added text carries no locator into a source of the manifest.
- Description checked against the head: the summary block and the author's prose; no sentence contradicted. The added section is secondary, removes or renumbers nothing, adds no supplier and no declaration; the five suppliers and three consumers stand. Title matches a pull request that adds the folder. A section of the same name and opening sentence is on main in AbhyankarLemma (its line 436).
- Gate (rerun): `gate ExplicitCharacterSumsAndSieves: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`; the worker's gate adds `build=0`. Dependency check (`--movable`): `depcheck: 248 roadmaps, 2377 edges, 0 problem(s)`; no `UPWARD`, `CYCLE` or `moved:` line.
- Elaboration: `lake env lean` on `TauCetiRoadmap/ExplicitCharacterSumsAndSieves/Suggested.lean` exits 0; the only output is 19 `declaration uses sorry` warnings.
- Overlap check: read ExplicitNumberFields, ExplicitMultiplicativeFunctions, CircleMethodThreePrimes (open, by vocabulary), ExplicitZetaBounds, ExplicitPrimeCounting, SieveMethodsAndPrimePatterns (main); the results-and-headings list is empty; the change touches no owned object: Selberg's weights stay with SieveMethodsAndPrimePatterns §1.3, the linear sieve with its §5.2, the diagonal bound with ExplicitPrimeCounting §0.1. No object has two owners; LeanPool is named as no supplier.
- Source independence: changed passages only; 5 passages compared with 1 source (the LeanPool repository: its README, and the docstrings of `SelbergSieve4/MainResults.lean`, `SelbergSieve4/Applications/BrunTitchmarsh.lean`, `IwaniecLinearSieve/Rosser.lean`, `IwaniecLinearSieve/Jacobsthal.lean`), none shared (longest common run 5 words, a licence name); no `Suggested.lean` declaration shares a name with either project; arrangement not compared again (no layer added, removed or reordered).

## Not verifiable

- The uncertified citations (greaves2001, montgomeryvaughan2007, montgomeryvaughan1973, frolenkovsoundararajan2013, bordelles2012, filaseta1990, trevino2015kth, bachmanrachakonda2001, siebert1976, rieselvaughan1983) and the waived vanlintrichert1965 are cited by locator alone; none is touched by this round.
- The LeanPool proofs were read, not built: that the cited declarations compile at that commit rests on the repository's own statement.
- The description's depends-on and merge-order blocks are generated and outside this check.

## Source issues

- **Error** in fan2022 at the Theorem, inequality (5), printed page 4 (lines 159–161): the source says (5) holds for all `1 < z ≤ x` with `z ≥ max(3, √x)`; it should require `x ≥ 8`, since at `x = 7`, `4.9910 < z < 5` the count is `3` and the bound is below `3`; affects a stated result.

## For the human reviewers

- **Licence.** README lines 1836–1866 and 1912–1915 map targets to two projects of the external repository LeanPool (Apache-2.0 at the cited commit) and state conditions for adapting its code; nothing is imported and no declaration name is shared.
