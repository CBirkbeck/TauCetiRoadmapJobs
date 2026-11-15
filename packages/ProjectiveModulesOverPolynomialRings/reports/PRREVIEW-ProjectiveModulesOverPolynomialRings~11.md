# Review of ProjectiveModulesOverPolynomialRings (pull request #2295 at 37e1427)

**Verdict:** needs changes

This is an incremental re-review of the 26 lines added since `4f4a2a8`, which are the new section "Provenance: existing formalizations outside Tau Ceti" and one References entry.

## R01 (P3) — The Kaplansky file is described as proving a different theorem

**Location:** `TauCetiRoadmap/ProjectiveModulesOverPolynomialRings/README.md:827–829`: "`StacksFrontier/RingTheory/Module/Kaplansky.lean` proves Kaplansky's theorem that projective modules are direct sums of countably generated ones (Tags 0591–0593), which this roadmap does not use."

**Claim:** The file actually proves that projective modules over a local ring are free (Stacks Theorem 10.85.4). The decomposition into countably generated summands is Tag 058Y (Theorem 10.84.5), which the file only imports. Also, 4.3 does use the finitely generated case of this freeness.

**Witness:** At `c496df0` the file's title is "projective modules over a local ring are free", and `Module.free_of_projective_of_isLocalRing` carries `@[stacks 0593]`. Stacks 0593 is Theorem 10.85.4. README:557 (4.3) uses `Module.free_of_flat_of_isLocalRing`.

**Repair:** Replace the sentence with: "`StacksFrontier/RingTheory/Module/Kaplansky.lean` proves Kaplansky's theorem that every projective module over a local ring is free, with no finiteness hypothesis (Tags 0591–0593); 4.3 needs only the finitely generated case, which it takes from Mathlib (`Module.free_of_flat_of_isLocalRing`)." In the description's Provenance paragraph, replace "Kaplansky's theorem (0591–0593), not used" with "Kaplansky's theorem over local rings (0591–0593), whose finitely generated case 4.3 takes from Mathlib".

## R02 (P3) — The stably-free file and the layers that use stable freeness are misstated

**Location:** `README.md:822–824`: "`StacksFrontier/Algebra/Module/StablyFree.lean` defines stable isomorphism and stably free modules, with their basic closure properties (Tags 0BC3–0BC5): the notion of Layer 2 and 5.1, which this roadmap takes from Mathlib."

**Claim:** The file does not define stably free modules: it defines only stable isomorphism and works with Mathlib's `Module.IsStablyFree`. Target 5.1 does not involve stable freeness; 2.1 and 5.4 do.

**Witness:** The file declares `IsStablyIso` (0BC3), `isStablyFree_iff_exists_isStablyIso`, `isStablyFree_two_out_of_three` (0BC4) and `exists_isStablyFree_lift` (0BC5), all on Mathlib's class (pin: `Algebra/Module/StablyFree/Basic.lean:34`). README 5.1 (lines 641–671) never mentions stable freeness; README:732 (5.4) does.

**Repair:** Replace the sentence with: "`StacksFrontier/Algebra/Module/StablyFree.lean` defines stable isomorphism, characterises Mathlib's `Module.IsStablyFree` by it, and proves two out of three and the lifting of stably free modules along an ideal in the Jacobson radical (Tags 0BC3–0BC5); stable freeness is the notion of 2.1 and 5.4, which this roadmap takes from Mathlib." In the description, replace "the notion of Layer 2 and 5.1" with "the notion of 2.1 and 5.4".

## R03 (P3) — Tag 08KJ is not the Milnor patching equivalence

**Location:** `README.md:824–826`: "proves Milnor patching, the equivalence between finite projective modules over a fibre product of rings and patching data (Tags 08KJ and 0D2J, `MilnorPatching/ProjectiveModules.lean`)"

**Claim:** Tag 08KJ is a different lemma, and the file named next to it does not cite it.

**Witness:** Stacks 08KJ is Lemma 15.6.6, on the surjectivity of an induced map of fibre products of modules. The equivalence is 0D2J, Lemma 15.6.9. At `c496df0`, `ProjectiveModules.lean` cites 0D2J, and 08KK (Situation 15.7.1) for its route.

**Repair:** Replace the parenthesis with "(Tag 0D2J, `MilnorPatching/ProjectiveModules.lean`, proved through the relative situation of Tag 08KK)". In the description, replace "(08KJ, 0D2J)" with "(0D2J)".

## R04 (P3) — The map omits the existing formalisation of the objects of 4.1

**Location:** `README.md:829–832`: "No file name or tag there treats Suslin's `r!` theorem (Layer 1), Quillen's dilation lemma, the Quillen ideal or Quillen patching (Layer 3), Horrocks' theorem (Layer 4) or the Quillen–Suslin theorem (Layer 5)."

**Claim:** The section maps existing code to targets but leaves out the one file that formalises the objects of 4.1, under this roadmap's own name. The repository README's "Porting existing work" rule asks for existing work on the same mathematics to be cited.

**Witness:** At `c496df0`, `StacksFrontier/RingTheory/Polynomial/MonicLocalization.lean` declares `def monicSubmonoid (R : Type*) [CommSemiring R] : Submonoid R[X]`, `abbrev MonicLocalization` (`R⟨X⟩`) and `disjoint_monicSubmonoid_map_C`. `Suggested.lean:157` declares `monicSubmonoid (A : Type u) [CommRing A]`.

**Repair:** Insert before "No file name": "`StacksFrontier/RingTheory/Polynomial/MonicLocalization.lean` defines the monic submonoid and `R⟨X⟩`, the objects of 4.1. It proves that `R⟨X⟩` is a domain, or Noetherian, when `R` is, and that `p[X]` contains no monic polynomial for a prime `p` of `R`, the step used in 4.1's faithful flatness. It states neither Quillen's Lemma 2 nor the faithful flatness of `R⟨X⟩`." Add `StacksFrontier/RingTheory/Polynomial` to the directories in the References entry, and the same clause to the description's Provenance paragraph.

## R05 (P3) — The description's Elaboration paragraph names an earlier head

**Location:** Description, **Elaboration**: "The current head (f5960d59) has not been elaborated locally; its CI is pending."

**Claim:** The head is now `37e1427`, which changes the README after `f5960d59`, so `f5960d59` is no longer the current head.

**Witness:** `git log` shows `37e14278` after `4f4a2a83` and `f5960d59`. `lake env lean` on `Suggested.lean` at `37e1427`, against Mathlib `1b1ccf4`, gives 18 `sorry` warnings and nothing else.

**Repair:** Replace the sentence with: "**Elaboration.** `Suggested.lean` has not changed since `f5960d59`; at the head `37e1427` it elaborates against the pins (Mathlib `1b1ccf4`) with 18 `sorry` warnings and nothing else."

## Previous findings

- none: the review of `4f4a2a8` raised no finding.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result | Change |
|---|---|---|---|---|
| 4.1 `monicSubmonoid` (Suggested.lean:157) against StacksFrontier `monicSubmonoid` | `A = ℤ`; `A = 0`; `m = (2) ⊂ ℤ` | Both carriers: `X² + 2` in, `2X + 1` out; over `0`, `0` is monic, so `A⟨X⟩ = 0`; `2ℤ[X]` has only even leading coefficients, no monic | The same object; ours is the `CommRing` case of theirs | R04 |
| 4.3 freeness over local rings against Kaplansky | `ℤ₍₂₎`: `P = ℤ₍₂₎²` and `P = ℚ` | `ℤ₍₂₎²`: finite, flat, free (`Module.free_of_flat_of_isLocalRing`); `ℚ`: flat, not finite, not free (`2ℚ = ℚ`, `2F ≠ F` for free `F ≠ 0`) | 4.3 needs only the finite case at the pin | R01 |
| Stable freeness in 2.1 and 5.4, against 5.1 | 2.1 Check over `ℤ/6 ≅ ℤ/2 × ℤ/3`, `P = ℤ/2 × 0` | `P ⊕ Rᵐ` has ranks `(m + 1, m)`; `Rⁿ` has ranks `(n, n)`; no `m, n` | Mathlib's `IsStablyFree` excludes `P`. 5.1 states no stably free module | R02 |
| 3.6 against Milnor patching (Scope → AlgebraicKTheory Layer 6) | `ℤ`, `f = 2`, `g = 3` | `ℤ = ℤ[1/2] ×_ℤ[1/6] ℤ[1/3]`; `1/3 ∉ im(ℤ[1/2])` and `1/2 ∉ im(ℤ[1/3])`, so neither leg is surjective | 0D2J needs a surjective leg, so 3.6 is not Milnor patching; the deferral stands | R03 |

The rows for every other statement stand as in the previous review, of `4f4a2a8`.

- Gate at `37e1427` (worker): every check passes, the build included. A local re-run with `--base origin/main` reports only `depcheck: NOT IN ORDER: ProjectiveModulesOverPolynomialRings (insert it after its last supplier)`, which reads the public order; at this stage that is not a finding.
- Dependency check against the candidate order: `depcheck: 237 roadmaps, 2242 edges, 0 problem(s)`.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Elaboration (`lake env lean`): 18 `sorry` warnings and nothing else. The 22 `#check @name` lines of the signature file elaborate with 0 errors. `Suggested.lean` is unchanged since `4f4a2a8`.
- AxiomMath/Stacks at `c496df0`, checked against the README's claims:
  - `LICENSE` is Apache 2.0.
  - `lean-toolchain` is `v4.35.0`, and Mathlib's `inputRev` is `v4.35.0`. Both are earlier than the pin, Lean `v4.36.0-rc2`.
  - Its README calls StacksFrontier AI-written and free of `sorry`, and keeps human review for StacksCore.
  - All three cited files exist.
- Stacks tags opened: 0BC3 (Definition 15.3.1), 08KJ (Lemma 15.6.6), 0D2J (Lemma 15.6.9), 08KK (Situation 15.7.1), 0590 (Lemma 10.85.1), 0593 (Theorem 10.85.4), 058Y (Theorem 10.84.5) and 08KG (Section 15.5).
- Library declarations opened at the pin: `Module.IsStablyFree` (`Algebra/Module/StablyFree/Basic.lean:34`) and `Module.free_of_flat_of_isLocalRing` (`RingTheory/LocalRing/Module.lean:299`). The pin has no `monicSubmonoid`.
- Cross-roadmap citation resolved: AlgebraicKTheory Layer 6 on main (Milnor patching, 6.1–6.4).
  - Remark: the section's opening paragraph is the house template, as in DerivedDeRhamCohomology on main. The repository README's "clearly secondary provenance section" rule allows it.

Overlap check: read the scope of HomologicalStabilityOfGeneralLinearGroups (frames, `E_n` stability); nothing shared. The lists of roadmaps on main closest by vocabulary and by results are empty. Milnor patching is owned by AlgebraicKTheory Layer 6 (main), as Scope says.

Source independence: changed passages only. 4 passages of the new section were compared with the docstrings of the 3 AxiomMath files and its README, and with Stacks Tags 0BC3, 0D2J and 0593. Nothing is shared beyond names and forced phrases; the longest shared run is "written by AI agents", 4 words. No layer was added, removed or reordered. Largest share: LombardiQuitte2015, about 27 of 74 locators; contents comparison stands: independent.

## Not verifiable

- The whole-repository scope of "No file name or tag there treats …" (README:829): the recursive tree exceeds the fetch limit. File names were checked only in StacksFrontier's top level, `RingTheory`, `Algebra/Module`, `RingTheory/Module`, `RingTheory/Polynomial` and `KTheory`.
- Suslin 1977, Theorem 2, p. 479; Suslin 1976; Horrocks 1964; Lang XXI.3.4: not read, as in the previous reviews. The change does not touch them.

## Source issues

- **Misprint** in AxiomMath, *The Stacks Project in Lean* (README at commit c496df0) at its opening line: the README gives Lean v4.34.0-rc2; it should be v4.35.0, the version its `lean-toolchain` and Mathlib `inputRev` name; affects nothing.

## For the human reviewers

- **Licence.** Quillen1976 lines 22–27: the GDZ scan carries terms that restrict reproduction. The README and this report give only locators and restatements.
- **Licence.** README:812–832 and References cite AxiomMath/Stacks `c496df0` (Apache-2.0; its README says StacksFrontier is AI-written and not human-reviewed). `Suggested.lean:157` `monicSubmonoid` matches that repository's `StacksFrontier/RingTheory/Polynomial/MonicLocalization.lean` in name and statement (`CommRing` here, `CommSemiring` there).
