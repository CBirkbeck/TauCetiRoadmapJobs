# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at e1903e9)

**Verdict:** accepted

## Previous findings

- R01 — repaired: README:829–831, "proves Kaplansky's theorem that every projective module over a local ring is free, with no finiteness hypothesis (Tags 0591–0593); 4.3 needs only the finitely generated case, which it takes from Mathlib (`Module.free_of_flat_of_isLocalRing`)". The description matches.
- R02 — repaired: README:822–825, "defines stable isomorphism, characterises Mathlib's `Module.IsStablyFree` by it, and proves two out of three and the lifting of stably free modules along an ideal in the Jacobson radical (Tags 0BC3–0BC5); stable freeness is the notion of 2.1 and 5.4".
- R03 — repaired: README:827–828, "(Tag 0D2J, `MilnorPatching/ProjectiveModules.lean`, proved through the relative situation of Tag 08KK)". The description now reads "(0D2J)".
- R04 — repaired: README:832–835, "`StacksFrontier/RingTheory/Polynomial/MonicLocalization.lean` defines the monic submonoid and `R⟨X⟩`, the objects of 4.1. … It states neither Quillen's Lemma 2 nor the faithful flatness of `R⟨X⟩`." The References and the description name the directory.
- R05 — repaired: Description, "`Suggested.lean` has not changed since `f5960d59`; at the head `e1903e9` it elaborates against the pins (Mathlib `1b1ccf4`) with 18 `sorry` warnings and nothing else."

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1 faithful flatness step (README:496–499) against AxiomMath `disjoint_monicSubmonoid_map_C` (prime `p`) | `A = ℤ`, `m = (2)`; `I = (4)`; `A = 0` | `2ℤ[X]`: leading coefficients even, a monic one is `1`: disjoint, and `2f = s` is impossible, so `2` is not a unit of `ℤ⟨X⟩`. `(4)` is not prime but is still disjoint. `A = 0`: no prime, and `0` is monic | Maximal ideals are prime, so the cited lemma covers 4.1's step | none |
| "`R⟨X⟩` is a domain, or Noetherian, when `R` is" (README:833) | `R = ℤ`; `R = ℤ/4` | `ℤ⟨X⟩ ⊂ ℚ(X)` is a domain. In `(ℤ/4)⟨X⟩`, `s·2` has leading coefficient `2 ≠ 0` for monic `s`, so `2 ≠ 0` and `2·2 = 0`: not a domain | The direction "when `R` is", as stated | none |
| 4.3 `isExtendedFrom_of_isExtendedFrom_monicLocalization` against `Module.free_of_flat_of_isLocalRing` (`[Module.Finite] [Flat]`) | `A_m = ℤ₍₃₎`: `N = ℤ₍₃₎²`, `N = ℚ` | `ℤ₍₃₎²` is finite, flat and free of rank 2. `ℚ` is flat and not finite, and `3ℚ = ℚ`, so it is neither free nor projective, and Kaplansky (0593) is silent too | `N` is finite by `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat`, so the finite case suffices | none |
| 2.1 `isStablyFree_mvPolynomial` (Mathlib `Module.IsStablyFree`) | `ℤ/6`, `P = 3ℤ/6`; `k = 𝔽₃`, `n = 0`, `P = k²` | `P × Rᵐ` has ranks `(m + 1, m)` at `(2), (3)`, and `Rⁿ` has `(n, n)`: not stably free. `k²` is free, hence stably free with complement `0` | The field hypothesis is needed; the elaborated signature carries `Field k`, `Finite` and `Projective` | none |
| 5.4 `exists_generalLinearGroup_col_eq_of_isUnimodular` | `k = ℤ`, `n = 0`, `m = 1`: `v = (2, 3)`, `v = (2, 4)` | `!![2, 1; 3, 2]` has determinant `4 − 3 = 1`; `ker(2, 3)` is spanned by `(−3, 2)` and is free. `(2, 4)` spans `(2) ≠ ℤ`: not unimodular | Stable freeness enters through §RD.0.56 (b), as README:824–825 says | none |
| 3.6 against Milnor patching (0D2J, which needs a surjective leg) | `ℤ`, `f = 2`, `g = 5` (`3·2 − 5 = 1`) | `ℤ = ℤ[1/2] ×_ℤ[1/10] ℤ[1/5]`; `1/5 ∉ ℤ[1/2]` and `1/2 ∉ ℤ[1/5]`, so neither leg is surjective | 3.6 is not an instance of 0D2J, so leaving Milnor patching to AlgebraicKTheory Layer 6 is right | none |

The rows for every other statement stand as in the previous review, of `37e1427`.

- Gate at `e1903e9`: the worker's gate passes every check, the build included. A local re-run with `--base origin/main` reports only `depcheck: NOT IN ORDER: ProjectiveModulesOverPolynomialRings (insert it after its last supplier)`. That comes from the public merge order and is not a finding at this stage.
- Dependency check against the candidate order: `depcheck: 259 roadmaps, 2455 edges, 0 problem(s)`. `git diff --stat origin/main...HEAD` outside the folder is empty. The References change is a reflow plus one added directory (compared word by word).
- Elaboration (`lake env lean`): 18 `sorry` warnings and nothing else. `Suggested.lean` is unchanged since `f5960d59`. The 22 `#check @name` lines elaborate with 0 errors, and the signatures of 2.1, 4.3 and 5.4 match their README statements.
- Locators checked:
  - LombardiQuitte2015 line 43167 (Notation XVI.4.2), line 43263 (Theorem XVI.4.7, p. 914), line 43476 (Theorem XVI.5.5, p. 920, discrete field) and lines 43459–43460 (the remark on Serre, p. 919).
  - Stacks Tags 0BC5 (Lemma 15.3.3: `1 + I` consists of units) and 08KK (Situation 15.7.1).
- AxiomMath/Stacks at `c496df0`, against the README's claims:
  - `StablyFree.lean`: `IsStablyIso` (0BC3), `isStablyFree_two_out_of_three` (0BC4), `exists_isStablyFree_lift` (0BC5).
  - `Kaplansky.lean`: 0591–0593, with no `Module.Finite` hypothesis.
  - `ProjectiveModules.lean`: 0D2J, with 08KK in its implementation notes.
  - `MonicLocalization.lean`: states neither Lemma 2 nor faithful flatness.
  - Its README: StacksCore is human-reviewed and StacksFrontier is AI-written.
  - `lean-toolchain` is `v4.35.0`.
- Library declarations opened at the pin:
  - `Module.free_of_flat_of_isLocalRing` (`RingTheory/LocalRing/Module.lean:299`);
  - `Module.IsStablyFree` (`Algebra/Module/StablyFree/Basic.lean:34`);
  - `Module.Finite.of_finite_tensorProduct_of_faithfullyFlat` (`RingTheory/Finiteness/Descent.lean:35`);
  - `Module.Flat.of_flat_tensorProduct` (`RingTheory/Flat/FaithfullyFlat/Basic.lean:589`).
- Cross-roadmap citations resolved: AlgebraicKTheory Layer 6 on main (6.1–6.4), and PadicDifferentialEquationsAndRigidCohomology §RD.0.55–§RD.0.56 at the head of its open pull request.
- Title and description read against `e1903e9`: the head contradicts no sentence, and the Provenance and Elaboration paragraphs describe this head.

Overlap check: read the scope of HomologicalStabilityOfGeneralLinearGroups (unimodular frames, `E_n` stability); nothing shared. The lists of roadmaps on main closest by vocabulary and by results are empty. A search of the open heads and of main for `monicSubmonoid`, monic localisation and Kaplansky's theorem finds no other owner. Milnor patching is owned by AlgebraicKTheory Layer 6 (main), as Scope says.

Source independence: changed passages only. 5 passages of the provenance section were compared with 2 sources: AxiomMath, *The Stacks Project in Lean* (its README and four file docstrings), and Stacks Tags 0BC5 and 08KK. Nothing is shared beyond forced phrases; the longest shared run is "is free, with no finiteness hypothesis", 6 words. No layer was added, removed or reordered. Largest share: LombardiQuitte2015, about 27 of 74 locators (the change adds none); contents comparison stands: independent.

## Not verifiable

- The whole-repository scope of "No file name or tag there treats …" (README:835–837): not re-listed this round. The previous review found that the recursive tree exceeds the fetch limit and checked only the StacksFrontier directories it names.
- Suslin 1977, Theorem 2, p. 479; Suslin 1976; Horrocks 1964; Lang XXI.3.4: not read, as in the previous reviews. The change does not touch them.

## Source issues

- **Misprint** in AxiomMath, *The Stacks Project in Lean* (README at commit c496df0) at its opening line: the README gives Lean v4.34.0-rc2; it should be v4.35.0, the version its `lean-toolchain` names; affects nothing.

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms that restrict reproduction. The README and this report give only locators and restatements.
- **Licence.** README:812–837 and References cite AxiomMath/Stacks `c496df0` (Apache-2.0, AI-written StacksFrontier tier). `Suggested.lean:157` `monicSubmonoid` matches its `StacksFrontier/RingTheory/Polynomial/MonicLocalization.lean` in name and statement (`CommRing` here, `CommSemiring` there).
