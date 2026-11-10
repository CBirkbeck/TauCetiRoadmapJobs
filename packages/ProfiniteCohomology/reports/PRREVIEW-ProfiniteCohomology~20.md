# Review of ProfiniteCohomology (pull request #616 at fb3e3c2)

**Verdict:** needs changes

Incremental re-review of the 50 lines changed in the folder since `d05436c`. The head is the merge of main into the branch: `README.md` and `Suggested.lean` are byte-identical to `d05436c`, `STATUS.md` and `PROGRESS.md` are main's, and `lake-manifest.json` now pins Tau Ceti `2fd255d9` and Mathlib `1b1ccf4b`, the two revisions the README names. The merge is the resolution the previous report tested. One thing the previous report listed as due at the merge was not done, and at this head it is a defect of the file.

## R01 (P3) — two `sorry`s on statements the pin now proves

**Location.** `TauCetiRoadmap/ProfiniteCohomology/Suggested.lean:316` (`abelianizationProPClass_generates`) and `:575` (`galoisEvens_galoisRes`), each ending `:= by sorry`; `README.md:473`–`:474`: "two statements that `Suggested.lean` carries with `sorry` under this roadmap's names are statements of Tau Ceti theorems, which prove them".

**Claim.** Before the merge the branch built against Tau Ceti `358314d4`, where neither theorem exists, so the `sorry`s could not be closed. The manifest now pins `2fd255d9`, where both are proved. An acceptance test that admits a statement its own pinned library proves is wrong, and the module docstring (`:33`–`:36`) says the file states only what the libraries do not prove.

**Witness.** On a scratch copy at this head's pins, with the two replacements below and the added import, `lake env lean` reports no error and no `sorry` warning at either declaration. Pinned declarations: `TauCeti/RepresentationTheory/Homological/ContCohomology/CohomologicalDimension/ClassModule/Sylow.lean:156`; `TauCeti/FieldTheory/GaloisCohomology/EvensNorm.lean:143`.

**Repair.** Deleting the two declarations is not open inside this folder: `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:3078` calls `galoisEvens_galoisRes` and `Completed/LocalGaloisGroups/Suggested.lean:1916` calls `ProfiniteCohomology.abelianizationProPClass_generates`. Give them the form their sibling `galoisRes_eq_zero_iff` (`Suggested.lean:580`–`:586`) already has, a consumer-interface name whose body is the Tau Ceti term:

1. Add after the `ClassModule.Basic` import: `public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.ClassModule.Sylow`.
2. At `:316` replace `sorry` by `exact TauCeti.abelianizationProPClass_generates Fact.out hG hV`.
3. At `:575` replace `sorry` by `exact TauCeti.galoisEvens_galoisRes K L σ hdeg y`.
4. In `README.md:473`–`:478`, drop "carries with `sorry`": say that the two statements are proved in `Suggested.lean` from the named Tau Ceti theorems, and that the two universe-independence theorems of 11.2 are the only statements it carries with `sorry`.

The statements do not change, so the callers are unaffected in type. I did not recompile the four importing modules against the repaired copy at this head; the previous report did so at the same two library revisions and all seven transitive importers compiled.

## Previous findings

- The previous report (at `d05436c`) had no finding. Its R01 line recorded the r18 finding as repaired in the folder, "cited as they are at Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`" (`README.md:469`–`:473`); that text is unchanged and now also agrees with the manifest. Of the two items it listed for the merge, the merge is done; the two closing terms are R01 above.

## Verified sound

**The change.**
- `git diff --stat d05436c HEAD` in the folder: `PROGRESS.md` (+16) and `STATUS.md` (+19 −15) only. Both are identical to main's copies (`git diff origin/main HEAD` on them is empty). They are tool-generated progress files; the gate's `stray-files` counter is 0.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty, and `git diff --stat origin/main HEAD` lists only this folder's `README.md` and `Suggested.lean`. The merge base is main's tip `f8836c4`. The long list of files "changed outside the folder" in the change summary is main's own history brought in by the merge, not a change of this pull request.
- `lake-manifest.json`: Tau Ceti `2fd255d997f4…`, Mathlib `1b1ccf4b088b…`, toolchain v4.36.0-rc2. These are the revisions `README.md:471`–`:472` and `Suggested.lean:36`, `:39` name, so "the pin" in the README is now the manifest's pin.

**Gate, dependency check, elaboration.**
- My gate run (text scanners and dependency check): every counter `0`, `OK`. The worker's gate with the targeted build of this module, ClassFieldTheory and QuadraticFormInvariants reports `build=0 OK`.
- Dependency check:

```text
depcheck: 235 roadmaps, 2268 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` at this head: exit 0 in 9 s, four `declaration uses sorry` warnings (`:276`, `:284`, `:310`, `:569`), nothing else.

**One-tactic probe** (scratch copy, this head's pins, 20 s). `:279` with `first | rfl | simp | exact?` fails; `:287` with `first | rfl | simp | infer_instance` fails; `:316` and `:575` close with the terms of R01. So the two universe theorems of 11.2 remain headlines and are not padding, and `README.md:476`–`:478` is exact.

**Library declarations opened at the pin.** `Sylow.lean:156` (`abelianizationProPClass_generates (hp : p.Prime) (h : strictCohomologicalDimensionAt.{u} p G ≤ 2) (hV : IsOpen ↑V)`, conclusion equal to the roadmap's); `EvensNorm.lean:143` (`galoisEvens_galoisRes (hL : finrank K L = 2) (y)`, stated with `trivialF2TopPairing … .cup`, which the roadmap's `cup (f2Pairing …)` unfolds to, as the successful `exact` shows).

**Seeded sample.** None of the fifteen targets (1.1, 1.7, 3.1, 3.2, 3.3, 4.2, 6.6, 7.3, 8.5, 9.7, 10.2, 10.3, 10.5, 11.1, 11.2) lies in a changed passage: the README is unchanged. The one sampled target the pin change bears on is 11.2, whose two Lean statements were probed above.

**Overlaps and ownership.** `scratch/overlaps.md`: no cited id dropped, none defined only by an open revision, no id dropped by this pull request. #1187 (a Tau Ceti pin bump) conflicts in this folder's `Suggested.lean` and the manifest; the merge-order block of the description states the order (this pull request, then #1187). The diff adds no object, so the earlier ownership audit stands. The 16 names in `scratch/citations.md` are unchanged README text passed by earlier reviews.

**Remarks on text the diff does not touch** (no change requested here).
- The pull-request description still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 explicit admitted construction/proof targets" and Tau Ceti `a91d3aaf`; none is at this head.
- The generated `STATUS.md` (taken from main) reports Tau Ceti up to `a4fcb57`, later than the pin, so it mentions progress on the general `𝔽₂` norm that the README's supplier text, written at `2fd255d9`, does not.

**Adversarial table.** The diff changes no statement. Rows marked r19 are carried from the previous report (its table, same statements); the first two were computed in this review at the new pin.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `abelianizationProPClass_generates` (`:310`) at pin `2fd255d9` | `exact TauCeti.abelianizationProPClass_generates Fact.out hG hV` | elaborates, no `sorry`; r19: `ℤ_p ⊇ pℤ_p` factor set `p·carry` of order `p`; `C_p ⊇ 1` excluded by `scd = ⊤` | proved by the pin | R01 |
| `galoisEvens_galoisRes` (`:569`) at pin `2fd255d9` | `exact TauCeti.galoisEvens_galoisRes K L σ hdeg y` | elaborates, no `sorry`; r19: `(y + cχ)² + χ(y + cχ) = y² + χy` since `c² + c = 0`; `𝔽₉/𝔽₃`: both sides in `H²(Ẑ, 𝔽₂) = 0` | proved by the pin | R01 |
| 11.2 universe equality (headline, `:276`, `:284`) | `rfl`, `simp`, `exact?`, `infer_instance` at this pin; r19: `G = 1`, `C_p`, `u = 0` | all four tactics fail; r19: `0 = 0`, `⊤ = ⊤`, one term at `u = 0` | true, not padding | none |
| `README.md:469`–`:473` cited revisions | manifest at this head | Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`: equal to the named revisions; r19: 749 names and 201 paths resolve there | exact | none |
| `README.md:40`–`:42` `𝔽₂` laws as cases of 13.2 | r19: `C₈ ⊇ C₄ ⊇ C₂` | r19: both sides restrict to `a⁴ ≠ 0`; `N(a)² = y²` restricts to `a⁴` | consistent | none |
| 0.3 section and extension | r19: `ℤ_p → ℤ/p` | `s((p−1)+1) = 0 ≠ p` | hypotheses needed | none |
| 1.4 compatible pairs | r19: `C₂`, `ℤ`, `×2`, `×3` | `1 ↦ 2 ↦ 6` | direction as in Mathlib | none |
| 2.2 explicit functoriality | r19: `C₄ ↠ C₂`, `1 ↪ C₄` | `χ ↦ (0,1,0,1) ↦ 0` | consistent | none |
| 2.4 conjugation | r19: `S₃ ⊇ A₃`, `𝔽₃` | `τ : f ↦ −f`; `H¹(A₃)^{C₂} = 0 = H¹(S₃)` | inner acts trivially | none |
| 3.3, 3.4 comparison and transport | r19: `∏ℕ C₂`; `C₂ ⊂ C₄` | `0` not isolated pointwise; parity restricts to `0` on both sides | as stated | none |
| 6.6 `cor ∘ res = index` | r19: `C₂ ⊇ 1`; `S₃ ⊇ C₂` | `1 ↦ 1 ↦ 2`; `res ∘ cor : 1 ↦ 3 = 1 + 2` | order as stated | none |
| 8.3 graded commutativity | r19: `C₂×C₂`, `𝔽₂`; `C₃`, `𝔽₃` | `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, `d¹c(a,b) = 1`; `−2χχ = χχ` | homotopy correct | none |
| 8.7 duality pairings | r19: `𝔽₃`; sign | `(id,1) ↦ 1`; `(−id)(−1) = 1` | as stated | none |
| 9.4 dictionary | r19: `𝔽_p`; `ℚ(∛2)` | `U_{𝔽_{pⁿ}} = nẐ`, `Ẑ/4Ẑ ≅ ℤ/4`; index 3, not normal | bijective, inclusion-reversing | none |
| 9.5 Hilbert 90 | r19: `ℂ/ℝ` | `w = 1 + z` gives `w/w̄ = z`; `z = −1`: `w = i` | `H¹ = 0` | none |
| 9.8 mod 2 | r19: `𝔽₃`; `ℝ` | `{±1} ≅ 𝔽₂`; Frobenius sends `√−1` to `−√−1` | no `CharZero` needed | none |
| 11.3 `p`-primary | r19: `⊕ℕ ℤ` | `H¹ ∋ (p^{−k})`, killed by no `pᵏ` | compactness needed | none |
| 11.7 strict criterion | r19: `ℤ_p`, `n = 1, 2` | `H²(p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`; `H³ = 0` | holds for every `n` | none |
| 12 sign of `δ` on the right | r19: `(m,n) = (2,1)`, `(1,2)` | `(−1)¹`, `(−1)²` | excludes `(−1)^m`, `(−1)^{mn}` | none |
| 13.1 index-two form | r19: `C₄ ⊇ C₂` | `Σ_τ ν(τ,σ) = 1 ≠ 0`, extension `C₈` | Checks correct | none |
| 13.2 odd-characteristic Check | r19: `C₃ × C₂ ⊇ C₃`, `𝔽₃` | `res N(a) = a²`; `N(2a) = N(a) ≠ 2N(a)` | non-additive | none |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Settled as `uncertified`, cited by locator; the diff adds no locator into either.
- **Ribes–Zalesskii, Brown, Koch, Serre *Local Fields*.** Not in the manifest or the cache, paywalled books; the diff does not touch their citations.
- **The importers against the repaired file at this head.** Not recompiled in this review (see R01); the statements are unchanged and the previous report's test at the same library revisions passed.

## Source issues

- none
