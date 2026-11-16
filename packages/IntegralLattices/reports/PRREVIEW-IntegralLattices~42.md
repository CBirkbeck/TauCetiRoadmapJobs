# Review of IntegralLattices (pull request #1411 at dfca92f)

**Verdict:** needs changes

Three findings, all P3; none is mathematical. Pins: Mathlib `1b1ccf4`, Tau Ceti `2fd255d`. `README.md` and `Suggested.lean` mean the files in `TauCetiRoadmap/IntegralLattices/`.

## R01 (P3) — The stabilizer index has two owners inside the roadmap: N0 proves it and 7C lists it as its own target

- **Location.** `README.md:3202–3206`: "The targets of this milestone are the stabilizer-index statement and the Conway–Sloane dictionary at odd `p`"; also `README.md:614` and `README.md:3062`: "the stabilizer-index and Conway–Sloane dictionaries of 7C".
- **Claim.** `[K_p(L) : K_p⁺(L)] = 2` is stated and proved in N0, so it is not a target of 7C; and it is an index, not a dictionary.
- **Witness.** `README.md:2027–2035`: "N0 also owns the improper element of a local stabilizer … so `[K_p(L) : K_p⁺(L)] = 2` … This is proved here." 7C's own *Needs* (`3206`) reads "N0 for the stabilizer index".
- **Repair.** At `3202–3204`: "The target of this milestone is the Conway–Sloane dictionary at odd `p`; the stabilizer index is N0's and is cited here;". At `614` and `3062`: "the Conway–Sloane dictionary of 7C".

## R02 (P3) — The description says the head contains #617's changes word for word; it revises some of them

- **Location.** Pull request description: "It contains every change #617 makes to this folder, word for word, and adds the following." and "the rebase after it merges leaves only the additions listed above."
- **Claim.** The head rewrites part of the text #617 adds, so the rebase will conflict in those passages and the listed additions are not the whole difference.
- **Witness.** Of the 1179 README lines #617 (`da24d08`) adds to main, 64 are absent here; e.g. #617's N0 says the unit-norm hypothesis fails "for `⟨1⟩` and `⟨4⟩` at `2`", while `README.md:2038–2040` says it holds for `⟨1⟩` at `2`.
- **Repair.** Replace by: "It contains #617's changes to this folder and revises some of them (N0 and its Checks, N1's Checks, 3D, 3E, B3, B5, 5A, 6F, 7C, 7E). Where the two differ this head's text is the later one, and the rebase after #617 merges resolves those passages toward this head."

## R03 (P3) — The description does not say that two roadmap suppliers are dropped

- **Location.** Pull request description: "The supplier contracts, the dependency lines and the References are updated to match." and "**Dependencies.** Mathlib and Tau Ceti at the pins; no roadmap supplier beyond those on main."
- **Claim.** The head removes Root Systems (6C, 6G) and `RepresentationTheory/LieGroups` (7E) as suppliers; main and #617 both keep them, and the description names neither removal.
- **Witness.** Main's README has the row `| 6C, 6G | Root Systems | Layer 3 §3.1 …` (line 483) and "R RepresentationTheory/LieGroups" in 7E (line 2588); #617's copy keeps both (553, 3090); the head has neither (`README.md:549–560`, `3303`, `3365`).
- **Repair.** Add to the description: "Two roadmap suppliers are dropped: Root Systems, since 6C and 6G are now native (`IsPosDef.nonempty_isometry_of_isUnimodular_of_finrank_le_nine`, `card_isometry_typeE₈RootLattice`), and `RepresentationTheory/LieGroups`, which 7E no longer consumes. No supplier is added."

## Previous finding (review of `d6e2855`)

- **R01 (conflict with main; no order with #617) — repaired.** `git merge-tree --write-tree origin/main HEAD` (main `b885423`, merge base `33620f6`) now writes a tree with no conflict; the description states "#617 changes the same IntegralLattices folder and merges first", and the generated merge-order block agrees (`IntegralLattices`: #617 → this pull request). What remains of that paragraph is R02.

## Verified sound

| Statement | Instances | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| B1 (native) | `A₂`, `U`, `⟨1,−2⟩`, `!![4,1;1,6]` | content, `Δ`: `2, −3`; `2, 1`; `1, 8`; `2, −23` | pass | none |
| B2, sign clause | `Δ = 12`; `Δ = −4` twist | `𝔞_f = 𝔞_{f'} = ℤ + √3ℤ`; `−1` not a value of `x² − 3y²` mod 3; `⟨−1⟩²(−1) = ⟨1⟩²`, `|O| = 8` both | pass | none |
| B3, characters at 2 (new) | `N = Δ/4` in each class mod 8 | odd values of `x² − Ny²` mod 8: `N≡3 (4)`: `{1,5}`; `N≡1 (4)`: all; `N≡2`: `{1,7}`; `N≡6`: `{1,3}`; `N≡4`: `{1,5}`; `N≡0`: `{1}` | pass | none |
| B3 step 3, count `2^μ` (new) | every case of `Δ` | first kind `2^{ω(N)}`; second kind `2^{ω(Δ)}` (odd), `2^{ω(N)}` (`N≡3 (4)`, `8∣N`), else 0; totals equal `2^μ` in all six cases | pass | none |
| B3 step 3, two forms per class (new) | `Δ = −4, −3, 5, 12, 45` | `(1,0,1),(2,2,1)`; `(1,1,1),(3,3,1)`; `(1,1,−1),(5,5,1)`; four forms, two per class at 12 and at 45; `#C[2] = 1,1,1,2,2` | pass | none |
| B3 new Checks | `Δ = −8, −24, 45, 25` | `δ(3)=ε(3)=−1`, `δε(3)=1`; tuples `(+,+)`, `(−,−)`, `δ(7)=−1`; discriminants `1+44, 25+20, 81−36, 2025−1980`; `−x²+5xy+5y²` takes `11` at `(2,1)`; `SO = {±1}` | pass | none |
| B3 step 1 | `Δ = −12, −36` | Kronecker character `χ₃` (all assigned); `δ` alone of `χ₃, δ` | pass | none |
| B4 (native) | `!![4,1;1,6]`, `U` | `|O| = 2` against `2·#𝒪ˣ = 4`; `|O(U)| = 4`, `|SO(U)| = 2` | pass | none |
| B5, `ρ` | `Δ = 12, 8` | reduced: four forms, `b = 2`; `ρ(1,2,−2) = (−2,2,1)`, back with `r = 2`; `ρ(1,2,−1) = (−1,2,1)`; `ρ(1,0,−3) = (−3,0,1)`; substitution determinant 1 | pass | none |
| B6 | `x² + y²`, `x² − 3y²`, `U` | `T(ℤ)`: `{±1, ±i}`, `{±(2+√3)^k}`, `{±1}` | pass | none |
| B7 | `Δ = −4, 12, 1` | `2π/4 = π/2`; `log(2+√3)`; modulus kernel `ℤ̂ˣ` of volume 1, full quotient infinite | pass | none |
| B8 | `A₂`; genus of `!![4,1;1,6]` | `m⁺ = 1/6`, `m = 1/12`; `h⁺ = 3`, `a = 1`, `h = 2`, `m = 1/4 + 1/2 = 3/4`, against `h/(2w) = 1/2` | pass | none |
| 3C Check (changed) | `A₂` at 3 | `β(e₁, e₁+2e₂) = 0`, norms `2`, `6`; unit determinants `2, 2` against `1, 1` for `⟨1⟩⊕⟨3⟩`; `(2|3) = −1` | pass | none |
| 3E oddity fusion (changed) | `⟨7⟩⊕⟨2⟩` | `v = e₁+e₂`: 9; `w = 2e₁−7e₂`: `126 = 14·9`; `β(v,w) = 0`; determinant `−9`; oddities `7+1 = 1+7 ≡ 0` | pass | none |
| 3G Check (changed) | `1_5^{−1}3^{+1}`, `1_7^{+1}3^{−1}` | `1+2 = 3 ≢ 5`; 3-excess `2+4 = 6`, `1+6 = 7`; signs `(2|3) = −1` at 2 and `+` at 3 are forced | pass | none |
| N0 improper element / 7C index (R01) | `U` at 2; `⟨1⟩⊕⟨2⟩` at 3; rank 0 | `v = e−f`, norm `−2`, `s_v(e) = f`; `e₁ − (2/3)(e₁+e₂) ∉ L₃`; index 1 | pass | R01 |
| 4B (Lean, two theorems) | `⟨1⟩`; genus of `!![4,1;1,6]`; rank 0 | 1 and 1 point; 2 classes, 3 proper classes; one point each side | pass | none |
| 5A (Lean) | `E₈²`, `D₁₆⁺`; `I₈`, `E₈` | invariants `(16,0,0)` both; `I₈` excluded by evenness | pass | none |
| 5B `padicDiscriminant_…` (Lean) | `⟨6⟩` at 3; `⟨2⟩`, `⟨10⟩` at 2 | `q(2̄) = 1/3 = 2θ/3` gives `θ = 2`, class `2·3 = 6 = det`; both have `q = 1/4`, ratio 5, excluded | pass | none |
| 5B `exists_evenLattice_iff`, `…_of_lt` (Lean) | `(0,0,0)`; `(1,0,q_{⟨6⟩})` | all four clauses hold with empty products; clause 3 at 3: `6 = 2·3`; clause 4 off | pass | none |
| 5G (Lean, two theorems) | `t = 0`; `A₁^{t₊}⊕A₁(−1)^{t₋}` | reduces to `8 ∣ l₊ − l₋`; `l(A) = t ≤ l − t` forces `2t ≤ l` | pass | none |
| 5J (Lean) | `(1;1,0,1)` | `⟨2⟩` | pass | none |
| 6A (Lean, two theorems) | `U`, `⟨1⟩⊕⟨−1⟩` | signature `(1,0,1)` both, parities differ | pass | none |
| 6E (Lean, two theorems) | `D₁₆E₈`, `E₈³`; Leech | `480+240 = 720 = 3·240`; minimum 4 against norm-2 roots | pass | none |
| 7E (Lean, two theorems) | `n = 0, 1, 2, 3` | `1, 1, 2π, 8π²`; `vol O(1) = 2` | pass | none |

- Source locators checked against the text: `allcock-gal-mark2016` lines 686 (Theorem 5.1, p. 16), 707–716 (legal rank-one symbols, p. 16), 760 (Lemma 5.2, pp. 17–18), 864 (Theorem 6.3, p. 20); `voight2023` lines 230, 245, 251; `beli2010` line 254; `boya-sudarshan-tilma2003` lines 643–647.
- Library declarations opened at the pin: the Tau Ceti names newly cited or re-filed since the last review (among them `NormOne.lean:104, 114, 123`, `Quadratic/TwoRank.lean:239`, `GenusCharacter/PrincipalGenus.lean:79, 150`, `Ideal/Reflection.lean:208`, `LMFDB/StoredClassNumberCertificate.lean:73`, `TwoElementary.lean:303`, `OddCyclic/Basic.lean:65`), and Mathlib `RingTheory/IntegralDomain.lean:150`, `Topology/Algebra/Order/ArchimedeanDiscrete.lean:67`, `PrimesInAP.lean:443`, `JacobiSymbol.lean:423`. All exist where cited. The targets of 7C and B8 are not at the pin (no `ConwaySloane` file under `LocalDensity/`).
- Cross-roadmap citations resolved on main: Global Quadratic Forms §7.3 `exists_globalForm_of_isAdmissible` (its README 993–997); Theta Series cites only 6D of this roadmap (its README 980). `roadmaps resolve`: 13 leads, all declarations of `Suggested.lean`.
- Dependency check: `depcheck: 261 roadmaps, 2615 edges, 0 problem(s)`; no UPWARD, CYCLE or `moved:` line. The worker's gate passes every check; no file outside the two roadmap folders changes against `origin/main`.
- Elaboration: `lake env lean` on `Suggested.lean` exits with 15 warnings, all "declaration uses `sorry`", no error. Since `d6e2855` the file changed only inside docstrings; the worker's elaborated signatures (36 declarations, none losing a binder) match the README statements.
- Padding probe: each of the 15 `sorry` replaced by `first | rfl | simp | infer_instance | decide | omega | trivial | aesop | exact?` on a scratch copy; all 15 fail. Headlines not statable (3D, 3E/3G, 4C) are named in the module docstring.
- `Suggested.lean` against #617's copy: two hunks, both docstrings, as the description says.
- Overlap check: read OrthogonalTamagawaAndLatticeMass, LatticePackingsAndPerfectForms, GeometryOfNumbersAndQuadraticArithmetic, LevelOneAutomorphicFormsForClassicalGroups, ThetaSeries, GlobalQuadraticForms; shared: the determinant `−1` reflection of a local stabilizer, owned here over `ℤ_p` (N0) and by GeometryOfNumbersAndQuadraticArithmetic over a discrete valuation ring, which as the open roadmap cites or narrows; nothing else shared. No other roadmap states genus theory for non-maximal quadratic orders (B3).
- Source independence: 9 passages compared with 4 sources, none shared beyond a ten-word list of the four invariants of Theorem 5.1; largest share `omeara1963`, about 38 of about 120 locators; contents not compared with `omeara1963`, whose text and table of contents are not in the cache.
- Research link: Layer 5 states the existence and primitive-embedding theorems of Nikulin (1979) used in K3 lattice theory; Layers 3, 4 and 7 supply the genus, class and local-density inputs of the mass formula as in Conway–Sloane (1988) and Cho (2015), assembled by OrthogonalTamagawaAndLatticeMass. Rests on the README's References and scope.

## Not verifiable

- Cox, *Primes of the form x² + ny²* (B2 Theorem 7.7; B3 §3.B, Theorem 3.15; B4 Theorem 3.9; B5 and B7 Theorems 2.8 and 2.13): no legal copy; uncertified.
- `cohen1993` §§5.2, 5.6 (B2, B5, B7): uncertified. The `ρ` step and the reduced forms of B5 were checked by computation only.
- Cassels, *Rational Quadratic Forms*, ch. 13 (B4, B6): not in the cache; uncertified.
- `conway-sloane-mass1988` equation (1) and §§6, 12 (B8, 7A, 7C): waived.
- B3 for non-fundamental `Δ > 0`: the README cites no source and proves it in the text; checked by recomputation only.
- `omeara1963`, Nikulin 1979, `serre1973`, `milnor-husemoller1973`, `conway-sloane-splag1999`, `kawauchi-kojima1980`, `wall1963`, `van-der-blij1959`: every locator, uncertified or not in the cache.

## Source issues

- none

## For the human reviewers

- **Not tested.** The source with the largest share of the locators is `omeara1963` (about 38 of about 120); its text and table of contents could not be read, so wording and arrangement were not compared against it.
- **Scope.** B3's count of ambiguous classes for non-maximal orders of positive discriminant (`README.md:1544–1578`) is proved in the README with no refereed locator; Cox covers negative discriminants only.
