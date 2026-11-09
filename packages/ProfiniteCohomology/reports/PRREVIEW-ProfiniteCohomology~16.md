# Review of ProfiniteCohomology (pull request #616 at d581baa)

**Verdict:** needs changes

Incremental re-review of the 108 lines changed since `4b49a9b` (README only; `Suggested.lean` is unchanged and nothing outside the folder changes). R02 and R03 of the previous review are repaired and the repairs introduce no defect. R01, the pin lag, is not repaired and is the only finding.

## R01 (P2) — The folder cites Tau Ceti as at main's pin `2fd255d9`, but the branch still pins `358314d4`

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:36` and `README.md:37`–`:38`: "it states the headline theorems that the pinned libraries do not yet prove".
- The `sorry`s at `Suggested.lean:309` and `:568`.
- New at this head: `README.md:247`, `:3659` and `:4153`, which cite `OpenSubgroup.evensConj_eq_trivialF2Map`.

**Claim.** `lake-manifest.json` at this head pins Tau Ceti `358314d4` and Mathlib `f6090c70`; main pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, and the branch is 256 commits behind main. The README describes Tau Ceti as at `2fd255d9`. The 64 names and 30 paths counted in the previous review are unchanged, and this head adds a 65th name, `OpenSubgroup.evensConj_eq_trivialF2Map`. So the folder is wrong at either pin: at its own pin it cites declarations that do not exist, and at main's pin `abelianizationProPClass_generates` and `galoisEvens_galoisRes` are proved theorems stated here with `sorry`.

**Witness.** `git grep -w evensConj_eq_trivialF2Map 358314d4` in Tau Ceti finds nothing; at `2fd255d9` it is `ContCohomology/Corestriction/IndexTwo/EvensConj.lean:210`. `TauCeti.galoisEvens_galoisRes` is `FieldTheory/GaloisCohomology/EvensNorm.lean` at `2fd255d9` only.

**Why it is held.** The repair of this round changed only the README, and a folder edit cannot repair this: it needs the branch merged with main, which the author or an operator does. That settles who acts, not whether the folder is correct, so the finding stands until the merge.

**Repair** (unchanged from the previous review; for the author or an operator):
1. Merge `origin/main` into the branch, keeping this branch's text in `TauCetiRoadmap/ProfiniteCohomology/`.
2. Replace the `sorry` at `Suggested.lean:309` by `TauCeti.abelianizationProPClass_generates` and the one at `:568` by `TauCeti.galoisEvens_galoisRes`, with the merged signatures.
3. Rewrite `Suggested.lean:34`–`:36` and `:76`–`:84` and `README.md:37`–`:39` so that the two universe theorems (`:275`, `:283`) are the only `sorry`s; re-read `Suggested.lean:58`–`:66`, since `OpenSubgroup.evensNorm` exists at the new pin.
4. Re-run the gate with the targeted build, and elaborate `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean`, which import this module.
5. Update the pull-request description, which still describes files and counts that are not at this head.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `Suggested.lean:34`–`:36` still says the stated headlines are ones "the pinned libraries do not yet prove". Raised again above.
- R02 — repaired: `README.md:4104`–`:4157` widens the sentence to names cited "qualified … or unqualified in a supplier list" and maps `explicitH2Obj`, `Coind`, `coindEmbedding`, `dimensionShiftQuotient`, `cup_add_right`, `trivialF2_isSmoothDiscrete` and `evensConj_eq_conjMapOf`. Each right-hand side resolves (below).
- R03 — repaired: 9.4 (`README.md:2381`–`:2423`) states the dictionary as a bijection onto all open normal subgroups, cites pinned declarations for each part, says "This subsection adds no target", has four Checks, and the cofinality target is gone from `:56`.

## Verified sound

**Gate, build, dependency check.**
- My gate run at this head: every check `0`, `OK`. The worker's gate, with the targeted build, passed too.
- `lake env lean` on `Suggested.lean`: exit 0, with exactly four `declaration uses sorry` warnings, at `:275`, `:283`, `:309` and `:568`, as at the previous head. The file is byte-identical to the one the previous review probed, so its `#check` comparison and one-tactic probe carry over (r15: all four `sorry`s fail the probe; none is padding).
- Dependency check:

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**The 9.4 rewrite, against the pins.**
- Mathlib (`Mathlib/FieldTheory/Galois/Infinite.lean` at the branch pin): `fixedField_fixingSubgroup` (`:85`), `IntermediateFieldEquivClosedSubgroup : IntermediateField k K ≃o (ClosedSubgroup Gal(K/k))ᵒᵈ` (`:196`, `toFun L := L.fixingSubgroup`, inverse the fixed field), `normalAutEquivQuotient (H : ClosedSubgroup Gal(K/k)) [H.Normal] : Gal(K/k) ⧸ H.1 ≃* Gal(fixedField H.1/k)` (`:228`), `isOpen_and_normal_iff_finite_and_isGalois` (`:288`). All need `[IsGalois k K]`, which `Kˢ/K` has. The first two are also at main's Mathlib pin (`:82`, `:193`).
- Tau Ceti, at both pins: `TauCeti.galoisOpenNormalSubgroup` (`FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:345`; `:453` at `2fd255d9`) and `TauCeti.exists_galoisOpenNormalSubgroup_eq` (`:362`; `:588`), whose statement is `∃ E (_ : FiniteDimensional K E) (_ : IsGalois K E), galoisOpenNormalSubgroup K E E.val = U`, as the README says; `TauCeti.quotientFixingSubgroupEquiv : Gal(E/F) ⧸ M.fixingSubgroup ≃ₜ* Gal(↥M/F)` (`FieldTheory/Galois/Quotient.lean:78`), for `E/F` and `M/F` normal.
- Layer 4 does index over `(OpenNormalSubgroup G)ᵒᵖ` (`README.md:212`, `:419`, `:1301`), so `L ⊆ L' ↦ U_{L'} ≤ U_L` is the covariant direction 9.4 states.
- 9.5 cites "the dictionary above" and its `*Needs:*` names the dictionary; both still resolve. No other passage refers to the dropped cofinality target (`cofinal` occurs only at `:2390` and in 11's Shapiro route at `:3112`).
- The Layer 9 supplier paragraphs (`:516`–`:522`, `:620`–`:626`, `:2291`–`:2302`, `:2559`–`:2570`) list the same names; all resolve.

**The seven dropped-name rows, against the pins** (paths under `TauCeti/RepresentationTheory/Homological/ContCohomology/`; lines at the branch pin, all also present at `2fd255d9`):
- `TauCeti.coind` (`Coinduced.lean:104`): locally constant `f` with `f (u * g) = u • f g`; `TauCeti.DiscreteCoind` (`Coinduced/Discrete.lean:93`).
- `TauCeti.DiscreteCoind.unit : M →+[G] DiscreteCoind G U M` (`Coinduced/Discrete.lean:448`), `unit_apply : unit G U M m g = g • m` (`:458`), `unit_injective` (`:465`); `TauCeti.smoothDiscreteResCoindAdjunction R G U` (`Coinduced/Adjunction.lean:157`), whose unit is the orbit map (`:187`).
- `TauCeti.ContCohomology.CoindQuotient` (`Coinduced/Quotient.lean:71`), `coindShortExact` (`:140`), with `ContinuousSMul` under `[IsTopologicalGroup G] [CompactSpace G]` (`:177`), as the row says.
- `TauCeti.TopPairing.cup` (`Cup/Cohomology.lean:167`) is `… →ₗ[R] … →ₗ[R] …`, so additivity in the second argument is `map_add`; `cup_add_left` is declared at `Suggested.lean:360`.
- `TauCeti.isSmoothDiscrete_trivialF2` (`TrivialF2.lean:201`).
- `TopModuleCat.of ℤ (DiscreteH2 G M)` is the source of `explicitH2IsoContinuousCohomology` (`CohomologyComparison.lean:415`; `Suggested.lean:178`).
- `OpenSubgroup.evensConj_eq_trivialF2Map (s) (hs : s ∉ U) (κ) (hκ : ∀ u, (κ u : G) = s⁻¹ * u * s) (n)` at `2fd255d9` only (R01); `OpenSubgroup.evensConj_explicitH1AddEquivContinuousCohomology` (`Corestriction/IndexTwo/EvensConj.lean:183`) and `TauCeti.ContCohomology.evensConj1_eq_explicitConj1` (`Corestriction/IndexTwo/Basic.lean:129`) at both pins.

**Completeness of the dropped-name map.** I listed the 468 declaration names of main's `ProfiniteCohomology/Suggested.lean` that this head does not declare, and searched the four roadmaps on main that cite this one as a supplier (QuadraticFormInvariants, ClassFieldTheory, Completed/LocalGaloisGroups, Completed/ProfiniteProPGroups) for each as a backticked name. Every hit that the map does not cover is the name of a Tau Ceti declaration: 74 at the branch pin and 3 more (`galoisEvens_add`, `galoisEvens_embedding_independent`, `galoisRes_galoisEvens`) at `2fd255d9` only, which is R01. No unmapped name is left.

**Overlaps and ownership.** `scratch/overlaps.md`: no cited id is dropped, none is defined only by an open revision, this pull request drops no cited id; #1187 is the known conflicting head (pin bump; the merge in R01 resolves it). The change adds no object: 9.4 now adds no target, so there is nothing new to own. The 16 "Lean names found nowhere" of `scratch/citations.md` are the left-hand sides of the dropped-name map (`README.md:4109`–`:4153`) and `WreathC2.sectionTable` (`:4097`, untouched, passed in r15).

**Sample.** None of the fifteen seeded targets lies in a changed passage; the changed passages cite no source, so no locator was added or altered. Remark, no change asked: the sampled NSW and Serre locators remain unread, as in r15.

**Adversarial table.** Rows for changed statements are computed here; the others are carried from the r15 report, which holds their values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 9.4 bijection and orientation (changed) | `K = 𝔽_p`; `K = ℝ` | `U_{𝔽_{pⁿ}} = nẐ`: `2 ∈ 2Ẑ`, `2 ∉ 4Ẑ`, so `2Ẑ ⊋ 4Ẑ` and `[Ẑ : 4Ẑ] = 4 = [𝔽_{p⁴} : 𝔽_p]`; `ℝ`: `#G_ℝ = 2`, subgroups `G_ℝ, 1` ↔ `ℝ, ℂ`, two finite Galois fields, two open normal subgroups | bijective, inclusion-reversing | none |
| 9.4 Check, non-normal `L` (changed) | `ℚ(∛2)/ℚ` | degree `3`, closure of degree `6` with group `S₃`; `U_L` maps to a subgroup of order `2`, which has `3` conjugates; `Gal`-conjugate field `ℚ(ω∛2) ≠ L` | open, index 3, not normal | none |
| 9.4 Check, infinite extension (changed) | `⋃ₖ 𝔽_{p^{2^k}}` | fixing subgroup `⋂ₖ 2ᵏẐ = {x : x₂ = 0} = ∏_{ℓ≠2} ℤ_ℓ`; quotient `ℤ₂`, infinite | closed, not open | none |
| 9.4 stage at `U_L` (changed) | `K = ℝ`, `M = UnitsCoeff ℝ` | `(ℂˣ)^{G_ℝ} = ℝˣ`, `(ℂˣ)^{1} = ℂˣ`; stages `Hⁱ(1, ℝˣ)`, `Hⁱ(C₂, ℂˣ)`; `H¹(C₂, ℂˣ)`: `z z̄ = 1 ⇒ z = w/w̄`, `w = 1 + z` | consistent with 9.5 | none |
| `evensConj` is conjugation by any `s ∉ U` (changed, `:247`, `:3659`) | `C₄ ⊇ C₂`; `D₄ ⊇ ⟨r², s⟩`, `n = 1`; `S₃ ⊇ C₃`, `n = 0` | `res∘cor = id + c_s^*`; abelian: `id + id − id = id = κ^*`; `D₄`: `χ ↦ χ + χ∘c_r − χ = χ∘c_r`, which swaps the characters dual to `s` and `sr²`; `S₃`: `2 − 1 = 1` on `𝔽₂` | choice-free, as stated | R01 (name at main's pin) |
| `Coind`, `coindEmbedding`, `dimensionShiftQuotient` rows (changed) | `G = C₂`, `M = 𝔽₃` with sign; `U = G` | `unit(1) = (e ↦ 1, s ↦ 2)`, kernel `0`; `#Coind_1^G M = 9`, quotient of order `3`; `U = G`: `f(g) = g • f(1)`, so `Coind_G^G A ≅ A`, while left translation `f(g·)` would not preserve `f(ug) = u • f(g)` for `S₃` | match the pinned definitions | none |
| `cup_add_right`, `trivialF2_isSmoothDiscrete`, `explicitH2Obj` rows (changed) | `C₂`, `𝔽₂`, `m = n = 1` | `x ⌣ (x + 0) = x² + 0`; trivial action: stabilizer of `1` is `G`, open; `#DiscreteH2(C₂, 𝔽₂) = 2` | resolve | none |
| 0.1, 1.3, 1.6, 3.3, 5.2, 5.5, 7.1, 8.2, 8.5, 9.5, 9.7, 11.4, 11.5, 13.1, 13.2, 13.3 | as in r15 | carried from the r15 table (e.g. 5.5: `d¹f(2,1) = 2 = −carry(2,1)` on `C₃ ⊂ C₉`; 13.1: `Σ_τ ν(τ,σ) = 1` on `C₄ ⊇ C₂`) | untouched by the diff | none |
| 11.2 universe equality (headline) | `G = 1`; `C_p` | `0 = 0`; `⊤ = ⊤`; `rfl` fails between `.{0,u,u}` and `.{0,u,0}` (r15) | true, not padding | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`; `ℤ_p² ⊇ pℤ_p²` | `#H² = p`; `p⁴ ≠ p²` at `scd = 3` (r15) | hypotheses exact | R01 |
| 13.3 identity 5 (headline) | `ℂ/ℝ`; `𝔽₉/𝔽₃` | `0 = χ² + χ²`; both sides in `H²(Ẑ, 𝔽₂) = 0` (r15) | true | R01 |
| R01 pin | 65 names, 30 paths | `evensConj_eq_trivialF2Map`: 0 hits at `358314d4`, `EvensConj.lean:210` at `2fd255d9` | folder cites main's pin | R01 |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Both are settled as `uncertified` and cited by locator; no changed passage cites them.
- **Elaboration at main's pin.** The Lean commands of this review run only at `358314d4`. The `2fd255d9` statements cited above were read from the Tau Ceti git history.
- **The reply to R01.** I had no repair report for the previous round to read; the commit message of `d581baa` names only the 9.4 and dropped-name repairs.

## Source issues

- none
