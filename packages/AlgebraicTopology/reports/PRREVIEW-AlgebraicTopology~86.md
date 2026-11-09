# Review of AlgebraicTopology (pull request #1663 at 2dc8cf2)

**Verdict:** needs changes

This is an incremental re-review of the 4 lines of `TauCetiRoadmap/AlgebraicTopology/Suggested.lean` changed since `a67088d` (the module docstring, lines 59–61: degree `n ≥ 3` → `n ≥ 2`, "is not stated" → "is not stated in any degree"). `README.md` is unchanged, and nothing outside the folder changed.

The change itself is correct: it is the third part of the alternative repair the previous review allowed, and it makes the docstring agree with README 8.4 (lines 2103–2104, `n ≥ 2`) and with Hatcher, Theorem 4.37 (`hatcher` line 16124, printed p. 371, `n ≥ 2`). The two findings of the previous review stand, because neither the pin nor the description changed.

## R01 (P2) — The README and the docstring cite Tau Ceti declarations that exist only at main's pin; the branch still pins `358314d4` and conflicts with main

**Location.**
- `README.md` lines 443–471 (Inventory: `TauCeti.RelHomotopyGroup`, `TauCeti.RelHomotopyGroup.hurewicz`, `…surjective_hurewicz`, `…bijective_hurewicz_of_subsingleton_homotopyGroup`, `…mul_comm_of_subsingleton`) and lines 2107–2118 (8.4: "In Tau Ceti's terms the source is `TauCeti.RelHomotopyGroup (Fin (n − 1))` … Tau Ceti proves the rest of Hatcher's statement").
- `Suggested.lean` lines 39–57 ("Not stated, because Tau Ceti proves them at the pin: … `TauCeti.brouwerFixedPoint_compactConvex` … `HomotopyGroup.bijective_hurewicz`") and lines 59–63.

**Claim.** The Tau Ceti this file is elaborated against proves the theorems the README consumes and the docstring's "proves them at the pin" list names.

This is the previous review's R01, not repaired. The docstring is now consistent with itself in every degree (it concedes that `TauCeti.RelHomotopyGroup` is absent from the Tau Ceti it is elaborated against), but README 8.4 still states the theorem "in Tau Ceti's terms" with that carrier and says Tau Ceti proves the surjectivity, vanishing, degree-two bijectivity and commutativity halves, and the docstring's "proves them at the pin" list still names declarations absent at the pin.

**Witness.** `lake-manifest.json` at this head pins Tau Ceti `358314d4`, Mathlib `f6090c70`, Lean `v4.35.0-rc3`; the README declares no other revision. `grep -rlw` over `TauCeti/` at `358314d4` finds 0 files for each of `RelHomotopyGroup`, `bijective_hurewicz`, `cwApproximationMap`, `brouwerFixedPoint_compactConvex`, `isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup`, `lsCategoryCount`; at main's `2fd255d9` the counts are 19, 2, 2, 1, 3, 3. `git merge-tree --write-tree HEAD origin/main` reports three conflicts (`Suggested.lean` content; `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean` modify/delete).

**Repair.** Unchanged from the previous review. Merge `origin/main` into the branch (keep this branch's deletion of the two companion files and this head's `Suggested.lean`); the manifest then pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, Lean v4.36.0-rc2, and relative Hurewicz becomes statable: replace docstring lines 59–63 with the statement given in the previous review's R01 (`relativeHurewicz_bijective_of_simplyConnected`, on `TauCeti.RelHomotopyGroup (Fin (n + 1)) ⟨TopPair.ofSubset B, b⟩` with `hrel : ∀ k ≤ n, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) …)`, `[PathConnectedSpace Y]`, `[SimplyConnectedSpace B]`), quote it in 8.4, re-run the gate. Its refuting instances: `(D³, S²)`, `n = 1` (bijective `ℤ → ℤ`, not covered by the native bijectivity theorem since `π₂(S²) ≠ 0`); the cone on `S¹ ∨ S¹` (excluded by `SimplyConnectedSpace B`); `pt ⊔ S²` (excluded by `PathConnectedSpace Y`).

The alternative that keeps `358314d4`: delete from the README and the docstring the names absent there (the Inventory bullets 443–471, the 8.4 sentences 2107–2118, 8.3's vanishing citation, 8.7's `IsTriangulable.finiteCWType` route, 8.11b/8.15's `cwApproximationMap`, the docstring list 39–57) and restore the seven headlines removed at `a6488e3`. The docstring's degree is already right for this alternative.

## R02 (P3) — The order against the conflicting open revisions of this folder is still unstated

**Location.** The pull request description is unchanged: "both new companions build" (this branch deletes both companion files) and "Previous roadmap content and dependency pins are preserved". `README.md` lines 1477, 1486, 2908 and 2911 consume "CC C1.2a's S0–S4".

**Claim.** This is the previous review's R02 (originally R05), not repaired: another open pull request changes this roadmap with a conflicting head and no stated order.

**Witness.** `overlaps.md` lists #1187, #1652, #1797, #1807, #1808 and #1854 as conflicting in `README.md` or `Suggested.lean`; `roadmaps list` shows all six open (heads 66ed0d4, 287181d, f2f59c7, 62d686c, 01872e7, 81fee5f). At #1854's head 81fee5f, AlgebraicTopology `README.md` lines 163–164 and 1686–1690 say this roadmap owns the compactly supported local-coefficient cochains and CharacteristicClasses C1.2a consumes them, the reverse of lines 1477/1486/2908/2911 here.

**Repair.** State in the description which of these pull requests this branch follows and rebase onto it before either merges; if #1854 merges first, replace the C1.2a S0–S4 consumption at the four lines with that ownership; delete the companion-file and "pins are preserved" sentences.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`; `README.md` 2107–2109 still reads "In Tau Ceti's terms the source is `TauCeti.RelHomotopyGroup (Fin (n − 1))` … and the map is `TauCeti.RelHomotopyGroup.hurewicz`", a carrier absent at that pin (carried as R01).
- R02 — not repaired: the description still says "both new companions build" and "dependency pins are preserved"; the six conflicting pull requests are open and no order is stated (carried as R02).

## Verified sound

**The changed passage.** `Suggested.lean` 58–59 now says degree `n ≥ 2` and "not stated in any degree". Checked against:
- `README.md` 2103–2104: "`a₀ ∈ A` and `n ≥ 2`" (agrees);
- `hatcher` line 16124 (marker `=== page 380 ===` at 16122, printed p. 371): Theorem 4.37 is stated for an `(n−1)`-connected pair of path-connected spaces, `n ≥ 2`, `A ≠ ∅` (agrees; the previous `n ≥ 3` was the docstring's own restriction, not the source's);
- the pin: `RelHomotopyGroup` occurs in 0 files of `TauCeti/` at `358314d4`, so no degree of the theorem is statable there, and "in any degree" is the true scope of the omission (at `2fd255d9` the carrier is `AlgebraicTopology/Homotopy/Relative/Basic.lean`, and the omission would be false: R01).

**Gate.** The worker's gate at `2dc8cf2` passes (`build=0`), and my re-run agrees:

```
gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

**Dependency check.**

```
depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. The folder holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md`, `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` at the worktree pin exited 0 in 47 s: 13 `declaration uses 'sorry'` warnings (lines 171, 185, 267, 317, 346, 361, 385, 398, 427, 453, 476, 491, 510, the same 13 as at `a67088d`) and the 10 `#check` outputs, nothing else. No declaration changed, so the `#check @` binder comparison and the one-tactic probe of the previous review (none of the 13 closes; 6 fall through to `sorry`, 7 end in unsolved goals) stand for this head.

**Overlaps.** Each of the six items in `overlaps.md` re-checked: no cited id is dropped by an open pull request, none is defined only by an open revision, this head drops nothing others cite; the six conflicting heads are R02. The closest roadmaps in vocabulary (HomotopySpheres #1287, CharacteristicClasses at #1807/#1808/#1854, TangentialBordism #942) were compared in the previous full review; nothing in this diff touches what they own.

**Sources.** The seeded sample falls in the changed passage at one target, Hatcher Theorem 4.37 (above). The other 14 are untouched and were verified in the previous reviews. The README flags no locator as unverified. `needs-references.toml` carries only the worker's `may1967` entry (image-only scan), unchanged and not needed for the changed passage.

**Adversarial table.** Rows for statements this diff leaves untouched are carried from the previous report (r78), as marked; the changed statement has a computed row.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| docstring 58–61 "relative Hurewicz, `n ≥ 2`, not stated in any degree" (changed) | `n = 2`: `(S², pt)`, `A = pt` simply connected, `π₁(S²,pt) = 0`; `n = 3`: `(D³,S²)`; `(D²,S¹)`; pin `358314d4` | `π₂(S²,pt) = ℤ → H₂(S²,pt) = ℤ` bijective; `π₃(D³,S²) = ℤ → ℤ` bijective; `(D²,S¹)` excluded since `π₁(S¹) = ℤ`; both admitted instances are Hatcher 4.37 with `n ≥ 2`, so `n ≥ 3` undercounted the scope; `RelHomotopyGroup` in 0 files, so neither degree is statable | the sentence is true at the branch pin and matches 8.4 and the source |
| 8.4 relative Hurewicz, Hatcher's generality (r78) | `(D³,S²)`, deg 3; cone on `S¹∨S¹`, deg 2; `pt ⊔ S²`, deg 2 | `ℤ → ℤ` bijective; `F₂ → ℤ²` not injective; `0 → ℤ` not onto | holds; Checks sharp |
| "in degree two the native case is the whole theorem" (r78) | 8.4 at `n = 2` | `π₁A → π₁X → π₁(X,A) = 0` exact, so `π₁X = 0` | true |
| relative vanishing, 8.3 vanishing (r78) | `(D³,S²)`, `m = 0,1,2`; `S³`, `S¹`, `n = 1` | `H̃_(m−1)(S²) = 0`; `H₁ = H₂ = 0`; `H₁S¹ = ℤ` excluded; vacuous at `n = 1` | holds |
| `compactSupportTopClass_existsUnique` (r78) | `K = ∅`; `m = 0`; long line; `S²`; `RP²` | `c = 0`; pointwise; segment chart; `[S²]`; only `0` | holds |
| normalizedLSCategory (r78) | point; `S¹`; `RP^∞`; `∅` | `0`; `1`; `⊤`; excluded by nonempty | holds |
| 8.7, 8.11b, 8.15 native routes (r78) | tetrahedron, `ℝ`, `∅`; `ΩK(ℤ/2,1)`; `Sⁿ/(C_p×C_p)` | finite model / excluded / empty; `π₀` two points so DGFloer; `π₂M = ℤ` | consistent |
| `ordinaryPairQuotientComparison`, `homotopyInversePairExtension_left`, `poincareDuality_of_fundamentalClass`, `FundamentalClassDatum` (r78) | `B = ∅`, `(D¹,S⁰)`; `A = ∅`, `e = id`; `n = 0`, `RP²`/`𝔽₂`; `S¹`, `μ = ±[S¹], 2[S¹]` | `ℤ → ℤ`; constant `H`; units on `R^k`; `±2` spans `2ℤ` | holds; wrong model excluded |
| `lsCupLength_add_one_le_categoryCount`, `productBallImages_intersect`, `compactManifoldFiniteCWType`, `homologicalWhitehead`, `groupClassifyingSpace_isEMOne`, `properStrongDeformationRetract_of_inverse`, `finiteSourceMappingCWType`, `exists_transverse_circle_classifying_map`, `elementaryAbelianPair_sphere_action_has_stabilizer` (r78) | point/`T²`/`∅`; `p = q = 0`, `(1,0)`; `S²`/`ℝ`; Poincaré sphere; `ℤ/2`, `S₃`; `[0,∞) ⊃ {0}`; `∅`, `LS¹`; `S¹`, `z²`; `p = 2, n = 0`, `p = 3, n = 2` | `0+1 ≤ 1`, `2+1 ≤ 3`; IVT; excluded by `CompactSpace`; `π₁` order 120 excluded; `RP^∞`, `π₁ = S₃`; `hg` fails; `S¹ × ℤ`; `f⁻¹(1) = {±1}`; `dim H³ = 4 > 1` | holds |
| native Hurewicz, connectivity, Whitehead, transfer, Brouwer, `eulerChar_torus`, 8.5 example (r78) | `S²`; `(D²,S¹)`; `S¹ ⊔ S¹ → S¹`; `z²`; `[0,1]`; `n = 0`; Künneth deg 2 | `ℤ ≅ ℤ`; not injective; not injective; `2σ`; `1/2`; excluded; `0` vs `ℤ` | as in r78 |

## Not verifiable

- **Elaboration at main's pin** (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`, v4.36.0-rc2), for the file and for R01's proposed statement: this review may run Lean only at the worktree's pin. The cited names were read in the source files at that pin.
- **The heads of #1652, #1797, #1807, #1808 and #1187**: not among this worker's revision checkouts; R02 relies on `overlaps.md`, `roadmaps list` and `roadmaps show --pr 1854`.
- **Sources recorded `uncertified`** (Lee 2012, Thom 1954, Milnor 1963, Weibel 1994) and `may1967` (image-only scan): unchanged, none cited by the changed passage.

## Source issues

- none
