# Review of AlgebraicTopology (pull request #1663 at a67088d)

**Verdict:** needs changes

This is an incremental re-review of the 131 lines of `TauCetiRoadmap/AlgebraicTopology/` changed since `a6488e3`: `README.md` (+85/−25) and `Suggested.lean` (+13/−8). Nothing outside the folder changed.

The repairs to the previous R02, R03, R04 and R06 are mathematically correct. Two findings remain:
- the branch still builds against Tau Ceti `358314d4`, whereas every native this head adds exists only at main's pin `2fd255d`;
- the order against the conflicting open revisions of this folder is still unstated.

## R01 (P2) — The README and the `Suggested.lean` docstring cite Tau Ceti declarations that exist only at main's pin; the branch still pins `358314d4` and conflicts with main

**Location.**
- `README.md` lines 463–484, the new Inventory bullets: "with the other natives of the relative Hurewicz theorem: `TauCeti.RelHomotopyGroup.hurewicz` … `TauCeti.cwApproximation` … `TauCeti.IsTriangulable.finiteCWType`".
- `README.md` lines 2090–2094 (8.3), 2106–2120 (8.4), 2305–2310 (8.7), 2560–2565 (8.11b) and 2845–2846 (8.15).
- `Suggested.lean` lines 39–57 and 59–63.

**Claim.** The pinned Tau Ceti proves the theorems the README now consumes and the docstring's "Tau Ceti proves them at the pin" list names.

This is the previous review's R01, not repaired, and extended by 10 names:
- `RelHomotopyGroup.hurewicz`, `RelHomotopyGroup.surjective_hurewicz` and `RelHomotopyGroup.mul_comm_of_subsingleton`;
- `isZero_singularHomology_ofSubset_of_relHomotopyGroup` and `isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup`;
- `cwApproximation`, `cwApproximationMap`, `cwType_cwApproximation` and `isWeakHomotopyEquivalence_cwApproximationMap`;
- `IsTriangulable.finiteCWType`.

The new docstring paragraph (lines 59–63) makes the inconsistency explicit:
- it says `TauCeti.RelHomotopyGroup` is "absent from the Tau Ceti this file is elaborated against";
- README 8.4 (lines 2107–2109) states the theorem "in Tau Ceti's terms" with that carrier, and says that Tau Ceti "proves the rest of Hatcher's statement".

**Witness.** `lake-manifest.json` pins Tau Ceti `358314d4`, Mathlib `f6090c70` and Lean `v4.35.0-rc3`. There, `grep -rlw` finds:
- none of the 10 names above;
- none of the 85 backticked names whose last component occurs nowhere (70 `TauCeti.*`, 15 others, e.g. `HomotopyGroup.bijective_hurewicz`);
- no `Topology/Triangulable/FiniteCWType.lean`.

All exist at main's `2fd255d`. `git merge-tree HEAD origin/main` still reports three conflicts.

**Repair.** Merge `origin/main` into the branch:
- keep this branch's deletion of `GeneralModelOrientation.lean` and `TopologicalGroupFundamentalGroup.lean`;
- keep this head's `Suggested.lean`.

The manifest then pins Tau Ceti `2fd255d`, Mathlib `1b1ccf4b` and Lean v4.36.0-rc2. At that pin relative Hurewicz becomes statable. Replace docstring lines 59–63 with this theorem, quote it in 8.4, then re-run the gate:

```lean
/-- **Relative Hurewicz** (Stage 8.4; Hatcher, Theorem 4.37, p. 371): for path-connected `Y`,
simply connected `B ⊆ Y` and `π_i(Y, B)` trivial for `1 ≤ i ≤ n + 1`, the relative Hurewicz
map in degree `n + 2` is bijective. -/
theorem relativeHurewicz_bijective_of_simplyConnected {Y : TopCat.{0}} [PathConnectedSpace Y]
    (B : Set Y) (b : B) [SimplyConnectedSpace B] (n : ℕ)
    (hrel : ∀ k ≤ n, Subsingleton (TauCeti.RelHomotopyGroup (Fin k) ⟨TopPair.ofSubset B, b⟩)) :
    Function.Bijective fun a : TauCeti.RelHomotopyGroup (Fin (n + 1)) ⟨TopPair.ofSubset B, b⟩ ↦
      (TauCeti.RelHomotopyGroup.hurewicz (ModuleCat.of ℤ ℤ) (n + 1) a).hom 1
```

Check it on the instances that refute weaker forms:
- `(D³, S²)` with `n = 1`: the hypotheses hold, and the map `π₃ = ℤ → H₃ = ℤ` is bijective, whereas the native bijectivity theorem would need `π₂(S²) = 0`;
- the cone on `S¹ ∨ S¹` is excluded by `SimplyConnectedSpace B`;
- `pt ⊔ S²` is excluded by `PathConnectedSpace Y`.

This statement was not elaborated: this review may run Lean only at the worktree's pin.

The alternative that keeps `358314d4`:
- delete the names absent there;
- restore the seven headlines removed at `a6488e3`;
- in lines 59–63, write degree `n ≥ 2`, not `n ≥ 3`, since no degree-two native exists at that pin.

## R02 (P3) — The order against the conflicting open revisions of this folder is still unstated

**Location.** The pull request description is unchanged:
- "Previous roadmap content and dependency pins are preserved";
- "both new companions build", though this branch deletes both companion files.

`README.md` lines 1477, 1486, 2908 and 2911 consume "CC C1.2a's S0–S4".

**Claim.** This is the previous review's R05, not repaired. Another open pull request changes this roadmap with a conflicting head and no stated order.

**Witness.** `overlaps.md` still lists #1187, #1652, #1797, #1807, #1808 and #1854 as conflicting in `README.md` or `Suggested.lean`; all six are open (`roadmaps list`). At #1854's head, AlgebraicTopology `README.md` line 2899 says that this roadmap owns the compactly supported local-coefficient cochains.

**Repair.**
- State in the description which of these pull requests this branch follows, and rebase onto it before either merges.
- If #1854 merges first, replace the C1.2a S0–S4 consumption at the four lines above with that ownership.
- Delete the companion-file and "pins are preserved" sentences.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d4`. The docstring (lines 59–63) now concedes that `TauCeti.RelHomotopyGroup` is absent from the Tau Ceti it is elaborated against, while README 8.4 states the theorem with it (carried as R01).
- R02 — repaired at the branch pin, by the alternative the previous review allowed. Lines 59–63 now name relative Hurewicz in 8.4's generality as not stated, with the missing carrier. Stating it after the merge is part of R01's repair.
- R03 — repaired:
  - 8.3 (lines 2090–2094) consumes `TauCeti.isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup`;
  - 8.7 (2305–2310) routes through `TauCeti.IsTriangulable.finiteCWType`;
  - lines 123–125, 2560–2565 and 2845–2846 use `TauCeti.cwApproximationMap`, keeping DGFloer only for `ΩK(A,1)`.

  The names exist only at main's pin (R01).
- R04 — repaired:
  - lines 129–133 list MorseTheory's four carriers and say that two are Tau Ceti's;
  - lines 1403–1406 define normalizedLSCategory X as `TauCeti.lsCategoryCount X univ − 1` in ℕ∞.
- R05 — not repaired: the description is unchanged, and #1854's head still assigns the C1.2a support cochains differently (carried as R02).
- R06 — repaired: `compactSupportTopClass_existsUnique` keeps `[T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]` only, and README line 1553 says "Hausdorff topological m-manifold". The file elaborates.

## Verified sound

**Gate.** The worker's gate at `a67088d` passes, and my re-run agrees (`OK`, every counter 0):

```
gate AlgebraicTopology: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The worker's run also reports `build=0`.

**Dependency check.**

```
depcheck: 238 roadmaps, 2353 edges, 0 problem(s)
```

It prints no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/AlgebraicTopology'` is empty. The folder holds `README.md`, `Suggested.lean`, `STATUS.md`, `PROGRESS.md` and `metadata.toml`.

**Elaboration.** `lake env lean` on `Suggested.lean` at the branch pin exited 0 in 59 s.
- Output: 13 `declaration uses sorry` warnings (lines 171, 185, 267, 317, 346, 361, 385, 398, 427, 453, 476, 491, 510) and the `#check` outputs, nothing else.
- `#check @` on a scratch copy:
  - `compactSupportTopClass_existsUnique` elaborates with exactly `[T2Space M] [ChartedSpace (EuclideanSpace ℝ (Fin m)) M]` and the compact, open and `K ⊆ V` hypotheses;
  - `compactManifoldFiniteCWType`, which is untouched, keeps `T2Space`, `SecondCountableTopology`, `CompactSpace` and the smooth `IsManifold` binder.

  No binder was lost.
- One-tactic probe (`first | rfl | trivial | infer_instance | (simp_all; done) | aesop | sorry`): none of the 13 theorems closes. 6 fall through to `sorry` and 7 end in aesop's unsolved goals.

**Library declarations opened at main's pin `2fd255d`** (what the changed text cites):
- `TauCeti.RelHomotopyGroup` (`AlgebraicTopology/Homotopy/Relative/Basic.lean` 302).
- `RelHomotopyGroup.hurewicz` (`Relative/Hurewicz.lean` 324): from `RelHomotopyGroup (Fin n)` to `H_(n+1)`, as README lines 464–465 say.
- `surjective_hurewicz` (`Hurewicz/Relative.lean` 199): `IsPathConnected B`, `h₀`, and `π_(k+1)` rel trivial for `k + 1 < n + 2`, as lines 466–468 say.
- `bijective_hurewicz_of_subsingleton_homotopyGroup` (282): `Y : TopCat.{0}`.
- `mul_comm_of_subsingleton` (`Relative/Group.lean` 422): `π_N(A)` trivial.
- `isZero_singularHomology_ofSubset_of_relHomotopyGroup` (`Singular/Cubical/Compression/Relative.lean` 233): it needs triviality at every `a ∈ A`, supplied by basepoint change along a simply connected `A`.
- `isZero_singularHomologyFunctor_of_subsingleton_homotopyGroup` (`Singular/Cubical/Based/Retraction.lean` 383): `R : Type u` and `0 < m < n`.
- `cwApproximation` (`Homotopy/CWApproximation/Basic.lean` 154), `cwApproximationMap` (176), the instance `cwType_cwApproximation` (216) and `isWeakHomotopyEquivalence_cwApproximationMap` (336, `[PathConnectedSpace X]`).
- `IsTriangulable` (`Topology/Triangulable/Basic.lean` 38).
- `IsTriangulable.finiteCWType` (`Triangulable/FiniteCWType.lean` 41): `CompactSpace` only, no local finiteness and no `T2Space`.
- `lsCategoryCount` (`Topology/Homotopy/LusternikSchnirelmann.lean` 264, in ℕ∞) with `lsCategoryCount_pos` (329), which supports "truncated subtraction loses nothing".

**Cross-roadmap citations resolved.**
- On main (`172efce6`):
  - DGFloer Layer 1 item 2 ("Every space has a CW approximation", lines 470–471);
  - GeometricTopology's smoothing-and-triangulation comparison item 1 (lines 938–943, smooth implies PL via a smooth triangulation). GeometricTopology cites no AlgebraicTopology section, so there is no cycle;
  - MorseTheory lines 510–511, which consume exactly `LSCategoricalCover`, `lsCategoryCount`, `normalizedLSCategory` and `lsCupLength`. `lsCupLength` is declared at `Suggested.lean` 336.
- At #1227's head, StableHomotopyKTheory README line 9 assigns "simply connected relative Hurewicz" to this roadmap's Stage 8, and its §3.16 (line 1185) owns the trivial-π₁-action generalization. The rewritten 8.4 keeps `A` simply connected, so there is no second owner.

**Ownership by object.** The changed objects were searched with `roadmaps grep`, on main and at the open heads:
- relative Hurewicz;
- the normalized LS category;
- path-connected and arbitrary CW approximation;
- finite CW type of compact triangulable spaces;
- the compact-support lemma.

Each is either owned here, Tau Ceti's at main's pin, or a cited supplier's (DGFloer, GeometricTopology).

**Sources.** The seeded sample falls in the changed passages at two targets: Hatcher Theorem 4.37 and Lemma 3.27. The other 13 were verified in the previous review and are untouched.

In `hatcher`, printed page = marker − 9:
- Theorem 4.37 (`hatcher` line 16124, p. 371): an `(n−1)`-connected pair of path-connected spaces, `n ≥ 2`, `A ≠ ∅`, `h′` on `π′_n` an isomorphism, `H_i = 0` below `n`. This matches 8.4's hypotheses, since a simply connected `A` makes `π′_n = π_n`.
- Lemma 3.27 (`hatcher` line 10255, p. 236).
- The manifold definition (`hatcher` line 10023, p. 231): Hausdorff and locally Euclidean, with no countability. This supports R06's repair.
- Proposition 4.13 (`hatcher` line 15375, p. 353), the CW approximation of every space, newly cited at line 2563.

The README flags no locator as unverified.

**Overlaps.** I checked each of the six items in `overlaps.md`:
- no id this README cites is dropped by an open pull request;
- no id is defined only by an open revision;
- this head drops nothing that others cite;
- the six conflicting heads are R02.

**Adversarial table.** Rows for statements this diff leaves untouched are carried from the previous report (r73), as marked.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| 8.4 relative Hurewicz, Hatcher's generality (changed) | `(D³,S²)`, deg 3; cone `X ⊃ A = S¹∨S¹`, deg 2; `X = pt ⊔ S²`, `A = pt`, deg 2; `X = S²`, `A = pt`, deg 2 | rel `π₁ = π₂ = 0`, `π₃ ≅ π₂S² = ℤ → H₃ = ℤ` bijective; `π₂(X,A) ≅ F₂ → ℤ²` abelianization, not injective; rel `π_i = 0`, `H₂ = ℤ`, `0 → ℤ` not onto; `ℤ → ℤ` bijective | holds; both negative Checks are sharp |
| "in degree two the native case is the whole theorem" (changed) | 8.4 at `n = 2` | `π₀A = π₁A = π₀X = 0`; `π₁A → π₁X → π₁(X,A) = 0` exact, so `π₁X = 0`; the native needs `π_k` of `A` and `X` trivial for `k < 2` | true |
| "what remains is injectivity, `n ≥ 3`" (changed) | `(D³,S²)`, deg 3 | native bijectivity needs `π₂S² = 0`, false; `surjective_hurewicz` needs `S²` path connected, `h₀`, rel `π₁, π₂` trivial, all met | as stated |
| relative vanishing (8.4, changed) | `(D³,S²)`, `m = 0,1,2` | `H_m(D³,S²) ≅ H̃_(m−1)(S²) = 0`; the all-basepoint hypothesis holds by basepoint change in `S²` | holds |
| 8.3 vanishing below the connectivity (changed) | `S³`, `n = 3`; `S¹`, `n = 2`; `n = 1` | `π₀ = π₁ = π₂ = 0`, so `H₁ = H₂ = 0`; `π₁S¹ = ℤ`, excluded (`H₁ = ℤ`); `0 < m < 1` is empty, vacuous | holds |
| `compactSupportTopClass_existsUnique` (changed) | `K = ∅`; `m = 0`; long line, `K` a segment; `S²`, `K = V = S²`, `L = ℤ`; `RP²`, `L = ℤ` | unique `c = 0 ∈ H_m(M,M) = 0`; `⊕_{x∈K} L_x`, determined pointwise; now included, a segment chart as in `ℝ`; `c = [S²]`; `H₂ = 0`, only `s = 0` | holds |
| normalizedLSCategory (changed) | point; `S¹`; `RP^∞` (count ⊤); `∅` | `1−1 = 0`, `0+1 = 1`; `2−1 = 1`, `1+1 = 2`; `⊤−1 = ⊤`, `⊤+1 = ⊤`; count 0, and `0−1 = 0`, `0+1 ≠ 0`, excluded by nonempty | holds; the nonempty hypothesis is needed |
| 8.7 route `IsTriangulable.finiteCWType` (changed) | `S²` (tetrahedron boundary); `ℝ`; `∅` | 4 vertices, finite model; not compact, excluded; empty complex | holds |
| CW-approximation split (8.11b, changed) | `ΩK(ℤ/2,1)`; `ΩK(A,n+1)`, `n ≥ 1` | `π₀ = A`, 2 points, not path connected, so DGFloer; `π₀ = π₁K(A,n+1) = 0`, so Tau Ceti's theorem applies | consistent |
| 8.15 CW approximation of `M = Sⁿ/(C_p×C_p)` (changed) | `p = 2`, `n = 2` | `M` path connected (image of `S²`); `π₂M ≅ π₂S² = ℤ`, the attaching generator | applies |
| docstring "relative Hurewicz not stated" (changed) | branch pin vs main pin | `RelHomotopyGroup` in 0 files at `358314d4`; at `2fd255d`, `Relative/Basic.lean` 302 | true only at the branch pin (R01) |
| `ordinaryPairQuotientComparison` (r73) | `B = ∅`; `(D¹,S⁰)` | `H_n(X) = H_n(X₊,∗)`; `ℤ → H₁(S¹,∗) = ℤ` | holds |
| `homotopyInversePairExtension_left` (r73) | `A = A' = ∅`; `e = id` | a homotopy inverse; `g = id`, `H` constant | holds |
| `poincareDuality_of_fundamentalClass` (r73) | `n = 0`, `k` points; `RP²` over `𝔽₂`, `p = 1` | units on `R^k`; `𝔽₂ → 𝔽₂` | holds |
| `FundamentalClassDatum` (r73) | `S¹` with `μ = [S¹]` and `2[S¹]` | local images `±1` span `ℤ`; `±2` span `2ℤ` | wrong model excluded |
| `lsCupLength_add_one_le_categoryCount` (r73) | point; `T²`; `X = ∅` | `0+1 ≤ 1`; `2+1 ≤ 3`; excluded by `Nonempty` | holds |
| `productBallImages_intersect` (r73) | `p = q = 0`; `(1,0)`; constants at `p = q = 1` | `f 0 = g 0`; IVT; violates `hf` | holds |
| `compactManifoldFiniteCWType` (statement r73) | `S²`; `ℝ` | finite model; excluded by `CompactSpace` | holds |
| `homologicalWhitehead` (r73) | Poincaré sphere `→ S³` | `π₁` of order 120, excluded | `SimplyConnectedSpace` is needed |
| `groupClassifyingSpace_isEMOne` (r73) | `ℤ/2`; `S₃` | `RP^∞`; `π₁ = S₃` | holds |
| `properStrongDeformationRetract_of_inverse` (r73) | `[0,∞) ⊃ {0}`, `g ≡ 0` | `g⁻¹{0}` not compact, `hg` fails | holds |
| `finiteSourceMappingCWType` (r73) | `X = ∅`; `X = Y = S¹` | `C(∅,Y) = pt`; `LS¹ ≃ S¹ × ℤ` | holds |
| `exists_transverse_circle_classifying_map` (r73) | `M = S¹`, `a = 2 b₀` | `f = z²`, `f⁻¹(1) = {±1}` | holds |
| `elementaryAbelianPair_sphere_action_has_stabilizer` (r73) | `p = 2`, `n = 0`; `p = 3`, `n = 2` | 4 elements on 2 points; `dim H³ = 4 > 1` | holds |
| native Hurewicz, connectivity, Whitehead, transfer, Brouwer, `eulerChar_torus`, 8.5 example (r73) | `S²`; `(D², S¹)`; `S¹ ⊔ S¹ → S¹`; `z ↦ z²`; `[0,1]`; `n = 0`; Künneth deg 2 | `ℤ ≅ ℤ`; `π₁` not injective; `π₀` not injective; `2σ`; `1/2`; excluded; `0` vs `ℤ` | as in r73 |

## Not verifiable

- **Elaboration at main's pin** (Tau Ceti `2fd255d`, Mathlib `1b1ccf4b`, v4.36.0-rc2), for the file and for R01's statement: this review may run Lean only at the worktree's pin. The cited names and their hypotheses were read in the source files at that pin.
- **The heads of #1652, #1797, #1807, #1808 and #1187.** They are not among this worker's revision checkouts. R02 relies on `overlaps.md` and on `roadmaps show` for #1854 and #1227.
- **Sources recorded `uncertified`**, unchanged from the previous review: Lee 2012, Thom 1954, Milnor 1963 and Weibel 1994.

## Source issues

- none
