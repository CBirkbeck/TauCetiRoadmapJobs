# Review of SiegelModularForms (pull request #1714 at 3739235)

**Verdict:** accepted

An incremental re-review of 34 changed lines since `61c6276`: 7.1 (`TauCetiRoadmap/SiegelModularForms/README.md:2208–2223`), the Layer 7 `Suggested.lean` paragraph (`README.md:2436–2439`), and in `TauCetiRoadmap/SiegelModularForms/Suggested.lean` one docstring bullet (`:40–43`) and the two new statements `isHeckeTriple_gammaGSp` (`:1325`) and `heckeRing_mul_comm` (`:1336`). No finding.

## Previous findings

- R01 — repaired: `Suggested.lean:1325` `theorem isHeckeTriple_gammaGSp (g : ℕ) : IsHeckeTriple ⊤ (gammaGSp g) (gammaGSp g)`, made an instance at `:1328`; `:1336` `heckeRing_mul_comm … [CommSemiring R] … : a * b = b * a`; both named in 7.1 (`README.md:2210`, `:2222`).

## Deferred findings

- D01 — stands
- D02 — stands

## Verified sound

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| `isHeckeTriple_gammaGSp` (7.1) | the four fields of Mathlib's `IsHeckeTriple` with `Δ = ⊤`, `H₁ = H₂ = Γ_g`; `g = 0`; `g = 1`, `γ = diag(1, p)` | `left_le`, `right_le`: `Γ_g ≤ ⊤`; `commensurable`: reflexive; `⊤ ≤ commensurator`: `Γ_1 ∩ γΓ_1γ⁻¹ = Γ⁰(p)`, index `p + 1`; `g = 0`: trivial group | True; elaborated type `∀ (g : ℕ), IsHeckeTriple ⊤ (gammaGSp g) (gammaGSp g)` |
| `isHeckeTriple_gammaGSp`: padding probe | `infer_instance`, `simp`, `constructor <;> simp` before the `attribute [instance]` line | no instance; no progress; `(commensurator (gammaGSp g)).toSubmonoid = ⊤` remains | Not padding |
| `heckeRing_mul_comm` (7.1) | `γ^∨ = μ(γ)γ⁻¹`; `g = 2`, `α = diag(1, 2, 4, 2)`, `μ = 4`; non-integral `γ`, `c > 0` | `α^∨ = diag(4, 2, 1, 2) = JαJ⁻¹`; `(γ^∨)^∨ = γ`; `(cγ)^∨ = c²μ·c⁻¹γ⁻¹ = cγ^∨`, so `Γγ^∨Γ = c⁻¹Γ(cγ)Γ = ΓγΓ`; `γ ∈ Γ_g`: `γ^∨ = γ⁻¹ ∈ Γ_g` | True; type `∀ g R [CommSemiring R] (a b : HeckeRing ⊤ (gammaGSp g) R), a * b = b * a` |
| `heckeRing_mul_comm`: generality and padding probe | README "any commutative semiring" against the binder and against the pinned criterion; `mul_comm a b`, `simp`, `ring`, `apply HeckeCosetModule.mul_comm_of_antiInvolution` | binder `[CommSemiring R]`; criterion needs `[CommSemiring R]`; no `CommMagma`; no progress; no progress; goals `HeckeAntiInvolution ⊤ (gammaGSp g)` and `h_fix` remain | README = Lean; not padding |
| 7.1 locators cited by the two new docstrings | `vdg` lines 1401–1404, 1416–1420, 1437–1441 | Lemma 16.1 (p. 30): `O_g(m)` a finite union of right cosets; Proposition 16.2 (p. 30): diagonal representative; commutativity by `γ^∨ = JγJ⁻¹`, `J ∈ Γ` (p. 30) | Pass |
| Docstring `Suggested.lean:40–43` (7.4, seeded sample) | grep of both pins for `Satake` | Mathlib: 0 files; Tau Ceti: `Newforms/Satake.lean` and `Newforms/BadPrime/Primes.lean` (`GL₂` newform parameters), no transform `H_p ⊗ ℚ → ℚ[Y]^W`; the two names it cites are declared at `:1325`, `:1336` | Pass |
| `README.md:2436–2439` (Layer 7 paragraph) | the four headline names against the file | `isHeckeTriple_gammaGSp` (`attribute [instance]` at `:1328`), `heckeRing_mul_comm`, `exists_eigenform_basis`, `coeffTriple_heckeT` all declared | Pass |

Rows for the roadmap's other statements stand as in the previous review, of `61c6276`.

- **Source locators (3):** the three `vdg` locators above. Of the seeded sample only 7.4 falls in the changed passages (the docstring bullet); the other fourteen targets were not re-read.
- **Library declarations opened (5):** Mathlib `NumberTheory/HeckeRing/Defs.lean:75` (`IsHeckeTriple`, four fields); Tau Ceti `NumberTheory/HeckeRing/Multiplication.lean:109` (`instMulHeckeRing`, `[Semiring R]`), `Associativity.lean:484` (`instRingHeckeRing`), `Commutativity.lean:79` (`HeckeAntiInvolution`), `:459` (`mul_comm_of_antiInvolution`).
- **Duplication:** no `IsHeckeTriple` instance on a symplectic group in Tau Ceti at the pin (20 files with `IsHeckeTriple` read by name: abstract, `GLn`, `GL2`, `HeckeSlash`, modular symbols); the two new names occur in no other `Suggested.lean`, open or on main.
- **Signatures:** `#check @isHeckeTriple_gammaGSp` and `#check @heckeRing_mul_comm` on a scratch copy: no section binder lost or gained; nothing changed.
- **Pull request text:** title and description read against this head; none contradicted (the folder is added, not on main; "12 layers and 66 milestones" unchanged, the diff adds no heading; no supplier or import added or dropped).
- **Gate** (worker's, on this head): every check `0`, `build=0`, `OK`. **Dependency check:** `depcheck: 252 roadmaps, 2396 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- **Elaboration:** `lake env lean` on `Suggested.lean` exits `0` with 74 `declaration uses sorry` warnings and nothing else.
- **Outside the folder and overlaps:** the diff outside the folder is empty; `scratch/overlaps.md` lists no other pull request changing this roadmap, no dropped id, no id only an open revision defines, no second copy.

Overlap check: searched every open roadmap and main for the two new statements and their object (a Hecke pair on `GSp` or `Γ_g`) instead of re-reading the closest-roadmap lists (HalfIntegralWeightModularForms, HilbertModularForms, LevelOneAutomorphicFormsForClassicalGroups, MaassForms, BianchiModularForms, ModularForms, ThetaSeries, NoncongruenceModularForms), which the change does not name; nothing shared.

Source independence: changed passages only: 3 passages compared with 1 source (`vdg` lines 1399–1441), none shared (longest common run 3 words, a formula); the arrangement was not compared again, no layer having been added, removed or reordered.

## Not verifiable

- "Shimura's criterion" (`README.md:2222`, `Suggested.lean:1334`) is credited through the pinned declaration, whose docstring gives Shimura, Proposition 3.8; Shimura's book is not in the sources cache and was not opened.
- "One of 23 roadmaps for the mathematics behind the LMFDB, opened as drafts" (description): a statement about other pull requests.

## Source issues

- none

## For the human reviewers

- The worker's source listing gives three uncertified keys the titles of unrelated works (`mizumoto1991`, `arakawa1983`, `satoh1986`); the README's own references are unaffected. On the board's record as D01 and D02; nothing is asked of the author.
