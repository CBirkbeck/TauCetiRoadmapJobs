# Review of ProfiniteCohomology (pull request #616 at d05436c)

**Verdict:** accepted

Incremental re-review of the 33 lines changed since `0cff68e` (README 31, `Suggested.lean` 2; nothing outside the folder). No finding remains in the folder. Two things outside the folder still stand between this head and a merge, and the person who merges needs them:

- **The branch is 256 commits behind main and conflicts with it in both files of this folder.** `lake-manifest.json` still pins Tau Ceti `358314d4`; main pins `2fd255d9`. The resolution is to keep this branch's `README.md` and `Suggested.lean`. I tested that resolution at main's pins (below): the file elaborates unchanged, and main's importers elaborate against it.
- **After the merge two `sorry`s close with one term each**, as the README says at `:472`–`:478`. Tested at main's pins:
  - `Suggested.lean:316`: `TauCeti.abelianizationProPClass_generates Fact.out hG hV`, after adding `public import TauCeti.RepresentationTheory.Homological.ContCohomology.CohomologicalDimension.ClassModule.Sylow`;
  - `Suggested.lean:575`: `TauCeti.galoisEvens_galoisRes K L σ hdeg y`.

  Neither can be closed or deleted at this head: the two theorems do not exist at `358314d4`, and main's `TauCetiRoadmap/QuadraticFormInvariants/Suggested.lean:3078` and `Completed/LocalGaloisGroups/Suggested.lean:1916` call them under this roadmap's names.

## Previous findings

- R01 — repaired in the folder: "cited as they are at Tau Ceti `2fd255d9…` and Mathlib `1b1ccf4b…`; "the pin" … in this README mean these two revisions" (`README.md:469`–`:473`). The merge itself is outside the two files.

Why I no longer hold R01. The r18 report held it on three grounds; each was re-tested at this head.

1. *The text is false at the pin the branch builds against.* The README no longer says the manifest records the cited revisions; it names them and defines "the pin" by them. Against those revisions the text is correct: of 749 qualified library names and 201 `.lean` paths in the two files, none exists only at `358314d4` (65 names and 31 paths exist only at `2fd255d9`, the rest at both). Main names a revision in a README in the same way (GlobalGaloisDeformationsPartII is the latest instance).
2. *Two proved theorems are stated with `sorry`.* The README and the module docstring now say so in terms, name the two Tau Ceti theorems and the `Fact` adaptation, and the two closing terms elaborate at main's pins. They are consumer-interface names, so deleting them is not open to the author.
3. *The r18 repair asked for the `𝔽₂` laws to be stated or explained* (`README.md:58`–`:60` against `Suggested.lean:59`–`:67`). `README.md:40`–`:42` now explains them; see the table.

What r18 could not do, and I did: elaborate at `2fd255d9`. With that, the remaining risk of the pin lag (a file that builds only at the old pin) is excluded, and what is left is a merge with a tested resolution. The reply's reason for not acting on the merge (only the author or an operator may make it) is correct, so the finding is settled.

## Verified sound

**Gate, dependency check, elaboration at the branch pin.**
- My gate run: every counter `0`, `OK`. The worker's gate with the targeted build (this module, ClassFieldTheory, QuadraticFormInvariants) reports `build=0 OK`.
- Dependency check:

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

  No UPWARD, CYCLE or `moved:` line.
- `lake env lean` on `Suggested.lean` at the branch pin: exit 0 in 16 s, four `declaration uses sorry` warnings (`:276`, `:284`, `:310`, `:569`), nothing else.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/ProfiniteCohomology'` is empty.

**The same file at main's pins** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, Lean v4.36.0-rc2), on scratch copies; nothing in the worktree was changed.
- All 26 `TauCeti.*` imports exist as source files at both revisions.
- A byte-identical copy elaborates: exit 0 in 16 s, the same four `sorry` warnings.
- With the two terms above (and the `Sylow` import) the copy elaborates with two `sorry` warnings only, at the universe theorems of 11.2. So `README.md:476`–`:478` ("the only statements of `Suggested.lean` that these revisions do not prove") is exact.
- Main's importers against that copy, compiled in dependency order from main's sources: `Completed/ProfiniteProPGroups` (22 s), `Completed/LocalFieldsRamification`, `Completed/NumberFieldArithmetic`, `Completed/GlobalNumberFields`, `TauCetiRoadmap/ClassFieldTheory` (58 s), `TauCetiRoadmap/QuadraticFormInvariants` (47 s), `Completed/LocalGaloisGroups` (20 s). Each exits 0 with no error. Main changed three of the four direct importers since the merge base (36, 62 and 8 lines), so this is a different test from the gate's targeted build.

**The changed passages.**
- `README.md:40`–`:42` (the `𝔽₂` laws). `OpenSubgroup.evensNorm` is at `Evens/Norm/Basic.lean:55` at `2fd255d9`, in every degree `n`, with values in degree `card (G ⧸ U) * n`; Tau Ceti proves `evensNorm_cochainClass`, `evensNorm_zero`, the index-one, index-two, naturality and single-double-coset laws, and no transitivity or multiplicativity. Milestone 7 of 13.2 (`:3812`–`:3814`) is the characteristic-two form "with the same laws" as milestone 6 (`:3804`–`:3811`), which lists transitivity and multiplicativity. The sentence agrees with `:58`–`:60`, `:3836`–`:3838` and the docstring at `Suggested.lean:59`–`:67`.
- `README.md:469`–`:478`. Checked as above. "With the primality of `p` supplied as a `Fact`" is right: Tau Ceti's theorem takes `(hp : p.Prime)` (`ClassModule/Sylow.lean:156`), and `Fact.out` fills it.
- `README.md:485` ("All paths at the pinned Mathlib, `1b1ccf4b`"). Every Mathlib path token of the README resolves in the Mathlib tree at `1b1ccf4b`, including the three files of the brace pattern `ProfiniteGrp/{Basic,Limits,Completion}.lean`.
- `Suggested.lean:39` ("at Tau Ceti `2fd255d9`"). Agrees with `:36` and with the README.

**Seeded sample.** None of the fifteen targets (0.1, 0.2, 1.4, 2.2, 4.2, 6.6, 7.3, 9.4, 9.6, 9.8, 10.3, 10.6, 10.7, 11.4, 11.5) lies in a changed passage, and the diff adds no source locator. The changed supplier preamble governs their library citations; those are covered by the two-revision audit above.

**Headlines and padding.** Unchanged since r18: the two universe theorems of 11.2 (stated, `sorry`, the one-tactic probe failed on both in r18 and the statements are untouched); the general Evens norm of 13.2 (not statable, named in the docstring with the missing carrier). The two consumer-interface `sorry`s are discussed above.

**Overlaps and ownership.** `scratch/overlaps.md` is unchanged in substance from r18: no cited id is dropped, none is defined only by an open revision, this pull request drops no id that others cite unmapped. #1187 (a Tau Ceti pin bump) conflicts in this folder's `Suggested.lean` and in `lake-manifest.json`; r18 records its order as stated earlier. The diff adds no object, so the r18 ownership audit stands.

**Remarks on text the diff does not touch** (no change requested here).
- The pull-request description still describes `CohomologyUniverseComparison.lean`, `DimensionNormalization.lean`, "19 explicit admitted construction/proof targets" and Tau Ceti `a91d3aaf`; none is at this head.
- The roadmap's manifest does not record Kahn 1984, which 13.1 cites (r18).

**Adversarial table.** Rows marked r18 are carried from the previous report, whose statements this diff leaves untouched; the others were computed in this review.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| `README.md:40`–`:42`: `𝔽₂` transitivity is a case of 13.2 | `C₈ ⊇ C₄ ⊇ C₂`, `a` the generator of `H¹(C₂, 𝔽₂)`, `H*(C₄, 𝔽₂) = 𝔽₂[y] ⊗ Λ[x]` | `N_{C₂}^{C₄} a = y` (13.1's Check); `res_{C₂} N_{C₂}^{C₈} a = a⁴` (four one-element double cosets); `res_{C₄} N_{C₄}^{C₈} y = y²`, and `res_{C₂} y² = (a²)² = a⁴` | both sides restrict to `a⁴ ≠ 0`; consistent | none |
| `README.md:40`–`:42`: `𝔽₂` multiplicativity is statable and a case of 13.2 | `C₄ ⊇ C₂`, `x = y = a`; a statement with `U.evensNorm`, this file's `cup`, `f2Pairing` and `degreeCast (mul_add _ m n).symm` | `res_{C₂} N(a²) = a² · a² = a⁴`; `N(a)² = y²` restricts to `a⁴`; the Lean statement elaborates at `2fd255d9` (with `sorry`) | statable; a special case, so correctly not stated in place of the headline | none |
| `README.md:469`–`:473`: cited revisions | 749 names, 201 paths, two Tau Ceti trees and two Mathlib trees | only at `2fd255d9`: 65 names, 31 paths; only at `358314d4`: 0 and 0; at neither: 9 tokens, all file-name or namespace tokens (`TopRep.lean`, `TauCeti.ContCohomology`, …) and `AddSubgroup.zmultiples`, an additivised name | every citation resolves at the named revisions | none |
| `README.md:473`–`:478`: two statements proved, two not | four `sorry`s at `2fd255d9` | `:316` closes with `…_generates Fact.out hG hV`; `:575` closes with `…galoisEvens_galoisRes K L σ hdeg y`; `:276` and `:284` remain | 2 of 4 proved, as stated | none |
| 11.8 class module (statement at `:310`) | `ℤ_p ⊇ pℤ_p`; `C_p ⊇ 1` | r18: factor set `p·carry`, of order `p` in `pℤ_p/p²ℤ_p`; `scd = ⊤` excludes `C_p` | hypotheses exact | none |
| 13.3 identity 5 (statement at `:569`) | cochain identity; `ℂ/ℝ`; `𝔽₉/𝔽₃` | r18: `(y + cχ)² + χ(y + cχ) = y² + χy` since `c² + c = 0`; `0 = χ² + χ²`; both sides in `H²(Ẑ, 𝔽₂) = 0` | true | none |
| 11.2 universe equality (headline) | `G = 1`; `C_p`; `u = 0` | r18: `0 = 0`; `⊤ = ⊤`; one term at `u = 0`; `rfl` fails between `.{u,u}` and `.{0,u}` | true, not padding | none |
| 0.3 section and extension | `ℤ_p → ℤ/p` | r18: `s((p−1)+1) = 0 ≠ p`; a homomorphic section is `0` | hypotheses needed | none |
| 1.4 compatible pairs | `C₂`, `ℤ`, `f = ×2`, `g = ×3` | r18: `1 ↦ 2 ↦ 6` | direction as in Mathlib | none |
| 2.2 explicit functoriality | `C₄ ↠ C₂`, `1 ↪ C₄` | r18: `χ ↦ (0,1,0,1) ↦ 0` | consistent | none |
| 2.4 conjugation | `S₃ ⊇ A₃`, `𝔽₃` | r18: `τ : f ↦ −f`; `H¹(A₃)^{C₂} = 0 = H¹(S₃)` | inner acts trivially | none |
| 3.3, 3.4 comparison and transport | `∏ℕ C₂`; `C₂ ⊂ C₄` | r18: `0` not isolated pointwise; parity restricts to `0` on both sides | as stated | none |
| 6.6 `cor ∘ res = index` | `C₂ ⊇ 1`; `S₃ ⊇ C₂` | r18: `1 ↦ 1 ↦ 2`; `res ∘ cor : 1 ↦ 3 = 1 + 2` | order as stated | none |
| 8.3 graded commutativity | `C₂×C₂`, `𝔽₂`; `C₃`, `𝔽₃` | r18: `(x⌣y)(a,b) = 1`, `(y⌣x)(a,b) = 0`, `d¹c(a,b) = 1`; `−2χχ = χχ` | homotopy correct | none |
| 8.7 duality pairings | `𝔽₃`; sign | r18: `(id,1) ↦ 1`; `(−id)(−1) = 1` | as stated | none |
| 9.4 dictionary | `𝔽_p`; `ℚ(∛2)` | r18: `U_{𝔽_{pⁿ}} = nẐ`, `Ẑ/4Ẑ ≅ ℤ/4`; index 3, not normal | bijective, inclusion-reversing | none |
| 9.5 Hilbert 90 | `ℂ/ℝ` | r18: `w = 1 + z` gives `w/w̄ = z`; `z = −1`: `w = i` | `H¹ = 0` | none |
| 9.8 mod 2 | `𝔽₃`; `ℝ` | r18: `{±1} ≅ 𝔽₂`; Frobenius sends `√−1` to `−√−1` | no `CharZero` needed | none |
| 11.3 `p`-primary | `⊕ℕ ℤ` | r18: `H¹ ∋ (p^{−k})`, killed by no `pᵏ` | compactness needed | none |
| 11.7 strict criterion | `ℤ_p`, `n = 1, 2` | r18: `H² (p^rℤ_p, ℤ)(p) = ℚ_p/ℤ_p ≠ 0`; `H³ = 0` | holds for every `n` | none |
| 12 sign of `δ` on the right | `(m,n) = (2,1)`, `(1,2)` | r18: `(−1)¹`, `(−1)²` | excludes `(−1)^m`, `(−1)^{mn}` | none |
| 13.1 index-two form | `C₄ ⊇ C₂` | r18: `Σ_τ ν(τ,σ) = 1 ≠ 0`, extension `C₈` | Checks correct | none |
| 13.2 odd-characteristic Check | `C₃ × C₂ ⊇ C₃`, `𝔽₃` | r18: `res N(a) = a²`; `N(2a) = N(a) ≠ 2N(a)` | non-additive | none |

## Not verifiable

- **NSW and Serre, *Galois Cohomology*.** Settled as `uncertified`, cited by locator; the diff adds no locator into either.
- **Ribes–Zalesskii, Brown, Koch, Serre *Local Fields*.** As in r18: not in the manifest or the cache, paywalled books. The diff does not touch their citations.
- **The merged tree as CI builds it.** I tested this branch's two files, with the two closing terms, and main's seven importing modules at main's pins from scratch copies; I did not perform the merge.

## Source issues

- none
