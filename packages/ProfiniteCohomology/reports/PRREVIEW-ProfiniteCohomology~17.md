# Review of ProfiniteCohomology (pull request #616 at 0cff68e)

**Verdict:** needs changes

Incremental re-review of the 126 lines changed since `4b49a9b` (121 in `README.md`, 5 in the module docstring of `Suggested.lean`; nothing outside the folder). R02 and R03 of the previous review are repaired and the repairs introduce no defect. R01, the pin lag, is partly repaired: the folder now says which revisions it cites and which two `sorry`s those revisions prove, but the branch still pins the older Tau Ceti, so the one finding stands.

## R01 (P2) — The folder cites Tau Ceti at `2fd255d9` and says the repository's manifest records it; the branch's manifest records `358314d4`

Re-raised: H01

**Location:**
- `TauCetiRoadmap/ProfiniteCohomology/README.md:467`–`:478` (new): "cited as they are at the revisions the content repository's manifest records: Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`" and "each is closed by the Tau Ceti theorem".
- `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:34`–`:37` (new) and `:39`, `:76`–`:84`; the `sorry`s at `:316` and `:575`.

**Claim.** The new paragraph makes the folder consistent with itself: it names the revisions, names the two statements that Tau Ceti proves there, and says the two universe theorems are the only ones those revisions do not prove. I checked each of those three claims at `2fd255d9` and they are true (below). What it cannot change:
- `lake-manifest.json` at this head records Tau Ceti `358314d4` and Mathlib `f6090c70`, not the revisions the sentence at `:469`–`:471` attributes to it. The sentence is true on main and false on this branch, which is 256 commits behind main.
- At the pins this head builds against, the 65 Tau Ceti names and 30 `.lean` paths counted in the two previous reviews still do not exist. The changed passages cite two of them: `OpenSubgroup.evensConj_eq_trivialF2Map` (`README.md:247`, `:3672`, `:4166`) and `ClassModule/Sylow.lean` (`:475`).
- At the cited revisions, `Suggested.lean` carries two `sorry`s on theorems the library proves. The README now says so, and says each "is closed by" the Tau Ceti theorem, but the file does not close them, and cannot at this pin.
- `Suggested.lean:39` ("already proved at the Tau Ceti pin") and `:62`–`:66` (`OpenSubgroup.evensNorm`) describe `2fd255d9`, not the pin.

**Witness.** `git grep -w` at `358314d4` finds no `abelianizationProPClass_generates`, `galoisEvens_galoisRes` or `evensConj_eq_trivialF2Map`. At `2fd255d9` they are `CohomologicalDimension/ClassModule/Sylow.lean:156`, `FieldTheory/GaloisCohomology/EvensNorm.lean:143` and `Corestriction/IndexTwo/EvensConj.lean:210`.

**Why it is held.** No edit of the folder alone repairs this. The merge with main is needed in any case: `git merge-tree HEAD origin/main` reports content conflicts in both files of this folder. The finding is kept, with the re-raise line, so that the roadmap goes to a human rather than to another folder-only repair round.

**Repair** (for the author or an operator):
1. Merge `origin/main` into the branch, keeping this branch's text in `TauCetiRoadmap/ProfiniteCohomology/`.
2. Replace the `sorry` at `Suggested.lean:316` with `TauCeti.abelianizationProPClass_generates Fact.out hG hV`. Replace the one at `:575` with `TauCeti.galoisEvens_galoisRes K L σ hdeg y`. Adjust the explicit arguments to the merged signatures.
3. In `README.md:467`–`:478`, drop the sentence about the two statements carried with `sorry`. In `Suggested.lean:34`–`:37` and `:76`–`:84`, say that the two universe theorems are the only `sorry`s and that the two names are theorems proved by the Tau Ceti theorem.
4. Re-run the gate with the targeted build. Also elaborate `Completed/LocalGaloisGroups/Suggested.lean` and `Completed/ProfiniteProPGroups/Suggested.lean`, which import this module.
5. Update the pull-request description. It still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 admitted targets" and Tau Ceti `a91d3aaf`, none of which is at this head.

## Previous findings

- R01 — partly repaired: `README.md:467`–`:478` declares the cited revisions and the two `sorry`s proved there; `lake-manifest.json` still pins Tau Ceti `358314d4`, and the two `sorry`s remain. Raised again above.
- R02 — repaired: `README.md:4117`–`:4170` covers names cited "qualified … or unqualified in a supplier list" and maps `explicitH2Obj`, `Coind`, `coindEmbedding`, `dimensionShiftQuotient`, `cup_add_right`, `trivialF2_isSmoothDiscrete` and `evensConj_eq_conjMapOf`.
- R03 — repaired: 9.4 (`README.md:2394`–`:2436`) states a bijection onto all open normal subgroups, cites a pinned declaration for each part, says "This subsection adds no target" and has four Checks; the cofinality target is gone from `:56`.

## Verified sound

**Gate, build, dependency check.**
- My gate run at this head: every check `0`, `OK`. The worker's gate, with the targeted build, passed too.
- `lake env lean` on `Suggested.lean`: exit 0 in 14 s, with exactly four `declaration uses sorry` warnings, at `:276`, `:284`, `:310` and `:569`.
- The diff of `Suggested.lean` is three docstring lines replaced by four, so every declaration is as the previous review probed it, one line lower. Its `#check @` comparison of all 56 declarations and its one-tactic probe (all four `sorry`s fail; none is padding at this pin) carry over.
- `git diff --stat origin/main...HEAD` outside the folder is empty.
- Dependency check:

```text
depcheck: 235 roadmaps, 2262 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

**The new revision paragraph (`README.md:467`–`:478`), against Tau Ceti `2fd255d9`** (read from the Tau Ceti git history):
- `TauCeti.abelianizationProPClass_generates (hp : p.Prime) (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (hV : IsOpen ↑V)` (`ClassModule/Sylow.lean:156`). Its conclusion is the conjunction at `Suggested.lean:313`–`:315`, term for term.
- `TauCeti.galoisEvens_galoisRes (hL : finrank K L = 2) (y)` (`FieldTheory/GaloisCohomology/EvensNorm.lean:143`). Its conclusion is `N(res y) = y ⌣ y + χ ⌣ y`, as at `Suggested.lean:572`–`:574`.
- "The only statements those revisions do not prove": a search of `2fd255d9` for a comparison of `cohomologicalDimensionAt.{u}` with `.{0}`, or of the strict invariant, finds only uses at `.{0}` (`NumberTheory/ClassFieldTheory/Local/CohomologicalDimension/`), no equality between the two. The two universe theorems remain targets.
- All 26 `TauCeti.*` imports of `Suggested.lean` exist as files at `2fd255d9` as well as at the pin.

**The 9.4 rewrite, against the pins.**
- Mathlib `Mathlib/FieldTheory/Galois/Infinite.lean` at the branch pin:
  - `fixedField_fixingSubgroup` (`:85`; `:82` at `1b1ccf4b`);
  - `IntermediateFieldEquivClosedSubgroup` (`:196`; `:193`);
  - `normalAutEquivQuotient` and `isOpen_and_normal_iff_finite_and_isGalois` (`:288`).

  All take `[IsGalois k K]`, which `Kˢ/K` has.
- Tau Ceti, at both revisions:
  - `TauCeti.galoisOpenNormalSubgroup` (`FieldTheory/Galois/AbsoluteGaloisGroup/FiniteExtension.lean:345`; `:453` at `2fd255d9`);
  - `TauCeti.exists_galoisOpenNormalSubgroup_eq` (`:362`; `:588`), which concludes `∃ E (_ : FiniteDimensional K E) (_ : IsGalois K E), galoisOpenNormalSubgroup K E E.val = U`, as the README says;
  - `TauCeti.quotientFixingSubgroupEquiv : Gal(E/F) ⧸ M.fixingSubgroup ≃ₜ* Gal(↥M/F)` (`FieldTheory/Galois/Quotient.lean:78`).
- 9.5 still cites "the dictionary above", and nothing else refers to the dropped cofinality target.

**The dropped-name rows, against the pins** (under `ContCohomology/`, line at the pin; at `2fd255d9`):
- `TauCeti.DiscreteCoind.unit_injective` (`Coinduced/Discrete.lean:465`; `:474`).
- `TauCeti.smoothDiscreteResCoindAdjunction` (`Coinduced/Adjunction.lean:157`; `:157`).
- `TauCeti.ContCohomology.CoindQuotient` and `coindShortExact` (`Coinduced/Quotient.lean:71`, `:140`; the same).
- `TauCeti.isSmoothDiscrete_trivialF2` (`TrivialF2.lean:201`; `:214`).
- `OpenSubgroup.evensConj_explicitH1AddEquivContinuousCohomology` (`Corestriction/IndexTwo/EvensConj.lean:183`; `:189`).
- `TauCeti.ContCohomology.evensConj1_eq_explicitConj1` (`Corestriction/IndexTwo/Basic.lean:129`; `:129`).
- `TauCeti.ContCohomology.H1ConjInvariants` (`FiveTerm.lean:56`; `:56`).
- `OpenSubgroup.evensConj_eq_trivialF2Map (s) (hs : s ∉ U) (κ) (hκ : ∀ u, (κ u : G) = s⁻¹ * u * s) (n)`: at `2fd255d9` only (`EvensConj.lean:210`); this is R01.
- The remaining rows (`TauCeti.coind`, `DiscreteCoind.unit`, `TopPairing.cup`, `DiscreteH2`) and the completeness of the map against the four citing roadmaps on main were checked at the intermediate head `d581baa`; the rows are unchanged since.

**Overlaps, ownership, citations.**
- `scratch/overlaps.md`: no cited id is dropped, none is defined only by an open revision, and this pull request drops no cited id. #1187 (the pin bump) is the known conflicting head; the merge in R01 settles it.
- The change adds no object to own: 9.4 adds no target, and the other changed passages are citations.
- The 16 "Lean names found nowhere" of `scratch/citations.md` are the left-hand sides of the dropped-name map (`README.md:4122`–`:4166`) and `WreathC2.sectionTable` (`:4110`, untouched).

**Sample.** Two seeded targets have changed passages.
- 9.4 was rewritten; it cites no source, only library declarations, all opened above.
- 13.1 gained the citation at `:3671`–`:3672`; it adds no locator.

The other thirteen are untouched and the README flags no locator as unverified.

Remark, no change asked: the NSW and Serre locators of the untouched sampled targets remain unread, as before.

**Adversarial table.** Rows marked "changed" are computed here; the rest are carried from the previous report (`PRREVIEW-ProfiniteCohomology~15`), which holds their values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 9.4 bijection and orientation (changed) | `K = 𝔽_p`; `K = ℝ` | `U_{𝔽_{pⁿ}} = nẐ`; `2 ∈ 2Ẑ`, `2 ∉ 4Ẑ`, so `2Ẑ ⊋ 4Ẑ`; `[Ẑ : 4Ẑ] = 4 = [𝔽_{p⁴} : 𝔽_p]`; `ℝ`: 2 finite Galois fields `ℝ, ℂ`, 2 open normal subgroups `G_ℝ, 1` | bijective, inclusion-reversing | none |
| 9.4 Check, non-normal `L` (changed) | `ℚ(∛2)/ℚ` | `[L : ℚ] = 3`, index of `U_L` is `3`; image in `S₃` has order `2`, with `3` conjugates; conjugate field `ℚ(ω∛2) ≠ L` | open, not normal | none |
| 9.4 Check, infinite extension (changed) | `⋃ₖ 𝔽_{p^{2^k}}` | `⋂ₖ 2ᵏẐ` is the kernel of `Ẑ → ℤ₂`, that is `∏_{ℓ≠2} ℤ_ℓ`; quotient `ℤ₂` infinite | closed, not open | none |
| 9.4 stage at `U_L` (changed) | `K = ℝ`, `UnitsCoeff ℝ` | `(ℂˣ)^{G_ℝ} = ℝˣ`, `(ℂˣ)^{1} = ℂˣ`; stages `Hⁱ(1, ℝˣ)` and `Hⁱ(C₂, ℂˣ)` | agrees with 9.5 | none |
| `evensConj` is conjugation by every `s ∉ U` (changed; `:247`, `:3671`) | `C₂×C₂ ⊇ C₂`; `D₄ ⊇ ⟨r⟩`; `D₄ ⊇ ⟨s, r²⟩`, `n = 1` | abelian: `res∘cor − id = 2·id − id = id = κ^*`; `⟨r⟩`: `χ∘c_s = χ`, `0 − χ = χ`; Klein: `c_r : s ↦ sr²`, so `b ↦ a + b`, and `(b + b∘c_r) − b = a + b` | equal in each case; the identity map is excluded by the Klein case | R01 (name at `2fd255d9` only) |
| Revision paragraph (changed; `:467`) | 4 `sorry`s; manifest | 2 of 4 proved at `2fd255d9` (`Sylow.lean:156`, `EvensNorm.lean:143`), 0 of 4 at `358314d4`; manifest rev `358314d4 ≠ 2fd255d9` | first two claims true, manifest claim false on this branch | R01 |
| Dropped-name rows (changed) | `G = C₂`, `M = 𝔽₃` with sign; `C₂`, `𝔽₂` | `unit(1) = (e ↦ 1, s ↦ 2)`, kernel `0`; `#Coind = 9`, quotient of order `3`; `x ⌣ (x + 0) = x² + 0` | match the pinned definitions | none |
| 0.1, 1.3, 1.6, 3.3, 5.2, 5.5, 7.1, 8.2, 8.5, 9.5, 9.7, 11.4, 11.5, 13.1, 13.2, 13.3 | as in the previous report | carried, e.g. 5.5: `d¹f(2,1) = 2 = −carry(2,1)` on `C₃ ⊂ C₉`; 13.1: `Σ_τ ν(τ,σ) = 1` on `C₄ ⊇ C₂`; 9.7: `N(g) = g⁴ = −1` in `𝔽₉/𝔽₃` | untouched by the diff | none |
| 11.2 universe equality (headline) | `G = 1`; `C_p` | `0 = 0`; `⊤ = ⊤`; `rfl` fails between `.{0,u,u}` and `.{0,u,0}` (carried) | true, not padding | none |
| 11.8 class module (headline) | `ℤ_p ⊇ pℤ_p`; `ℤ_p² ⊇ pℤ_p²` | `#H² = p`; `p⁴ ≠ p²` at `scd = 3` (carried) | hypotheses exact | R01 |
| 13.3 identity 5 (headline) | `ℂ/ℝ`; `𝔽₉/𝔽₃` | `N(0) = 0 = χ² + χ²`; both sides in `H²(Ẑ, 𝔽₂) = 0` (carried) | true | R01 |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Both are settled as `uncertified` and cited by locator; no changed passage cites them.
- **Elaboration at `2fd255d9`.** The Lean commands of this review run only at the branch pin `358314d4`. I read the `2fd255d9` statements from the Tau Ceti git history, so the two replacement proofs in the repair are untested.
- **The reply to R01.** I had no repair report to read; the commit message of `0cff68e` says the cited revisions were declared and the two statements named, which is what the diff shows.

## Source issues

- none
