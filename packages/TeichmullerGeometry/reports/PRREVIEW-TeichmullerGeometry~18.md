# Review of TeichmullerGeometry (pull request #1169 at 8883653)

**Verdict:** needs changes

This is an incremental re-review of the 18 lines changed since `1991188`. The diff only touches `README.md`. It replaces every citation of ArithmeticFuchsianGroups "Layer 1 item 1" and "Layer 1 item 4" with "§1.1" and "§1.4". The affected README lines are 20, 27, 102, 860, 868, 872, 878, 880 and 1006.

- **The changed lines are correct.** Every new id resolves at ArithmeticFuchsianGroups' current head (`f16c179`), and the claims around each id match what that section states. The diff introduces no defect.
- **Two P3 findings remain, both carried from the previous report.** Neither repair is in this folder.

## R01 (P3) — #903 still assigns the smoothing of paths to its §3.3, which does not state it

**Location.**
- #903 at its head `d3b536e`, `TauCetiRoadmap/GeometricTopology/README.md` line 1460: "a continuous path in `Diff(M)` need not be a smooth isotopy, and the smoothing of paths is Layer 3.3's."
- This README's scope line 12 says: "the parameter-smoothing converse is owned here for every compact manifold … GeometricTopology Layer 3 stating the topological group `Diff(M)` and the smooth-families map but not this converse". §0.2 (line 290) plans it.

**Claim.**
- #903 has not moved since the previous review, and the sentence is unchanged.
- §3.3 (lines 1504–1550) states none of the following: path smoothing, parameter smoothing, or the converse of the smooth-families map.
- So two roadmaps name an owner for one theorem, and only this roadmap plans it.

**Witness.** At `d3b536e`:
- `grep -n "smoothing of paths"` hits only line 1460.
- Over §3.3, `grep -in "path\|smooth"` finds only these items:
  - the weak topology on embeddings;
  - `TauCeti.SmoothIsotopy.exists_diffeotopy_apply_eq`;
  - smooth versus ambient isotopy;
  - the continuous lift of paths in `Emb(N, M)` to `Diff_c(M)`;
  - the disc theorem.

**Repair.**
- **In #903:** replace "and the smoothing of paths is Layer 3.3's" with "and the smoothing of paths is TeichmullerGeometry §0.2's", or with "and the smoothing of paths is not planned here".
- **In this README:** no change.
- **Re-test:** after the edit, `grep -n "smoothing of paths"` over #903 names no section of #903 that lacks the statement.

## R02 (P3) — The description's "Dependencies:" sentence still describes an exchange with FuchsianOrbifolds that does not exist

**Location.** The pull-request description, "Dependencies:" paragraph: "Its early quotient/area/Riemann–Hurwitz and arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9."

**Claim.** The sentence is unchanged, and it contradicts both roadmaps:
- At #1168's head `1e1ceeb`, FuchsianOrbifolds has no Layer 7 or Layer 9. It consumes nothing from this roadmap.
- The arithmetic lattices come from ArithmeticFuchsianGroups §1.1 and §1.4, as this README's lines 27 and 102 now say.
- This README's line 41 says that supply runs one way.

The generated "Depends on" block already lists #2026, #1168 and #903 correctly.

**Witness.** In #1168 at `1e1ceeb`:
- The `## Layer` headings are 0, 1, 2, 3, 4, 5, 4a and 6; a grep for `^## Layer 7` or `^## Layer 9` finds nothing.
- Line 793 reads: "No row depends on TeichmullerGeometry or ArithmeticFuchsianGroups, which consume this roadmap downstream."

**Repair.** Replace the quoted sentence with: "FuchsianOrbifolds (#1168) and ArithmeticFuchsianGroups (#2026) supply this roadmap and consume nothing from it."

## Previous findings

- R01 — not repaired: #903 at `d3b536e` line 1460 still reads "and the smoothing of paths is Layer 3.3's". Its §3.3 (lines 1504–1550) states no path smoothing. Carried as R01.
- R02 — not repaired: the description still reads "arithmetic L7.4 targets feed Teich; this roadmap's T0/T4a/T9/T10 feed Fuchsian late L9". Carried as R02.
- **The previous report's remark on two citation styles** (not a finding) is resolved by this diff. Lines 20, 27, 102, 860, 868, 872, 878, 880 and 1006 now cite §1.1 and §1.4. A grep for `Layer 1 item` in the README finds only FuchsianOrbifolds citations (line 98).

## Verified sound

### Mechanical checks at `8883653`

- **Gate.** The brief's command printed:

  `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`

  It exited 0. The worker's `gate.md` records the same result, with `build=0`.
- **Elaboration.** `lake env lean TauCetiRoadmap/TeichmullerGeometry/Suggested.lean` exits 0, with 21 "declaration uses `sorry`" warnings and no other diagnostic. `Suggested.lean` is byte-identical to `1991188`: `git diff 1991188 HEAD -- Suggested.lean` is empty.
- **`#check @name`.** A scratch copy with `#check @name` for all 52 `TauCetiRoadmap.TeichmullerGeometry.*` declarations elaborates with 0 errors. No elaborated type changed.
  - The 55 entries of `signatures.md` include three docstring words that the tool misparsed as declarations (`groups`, `group`, `and`). They are not declarations.
- **Dependency check** (the brief's command):

  ```text
  depcheck: 238 roadmaps, 2323 edges, 0 problem(s)
  ```

  It printed no UPWARD, CYCLE or `moved:` line, and exited 0.
  - In `ORDER.txt`, FuchsianOrbifolds is at line 49, ArithmeticFuchsianGroups at line 284 and TeichmullerGeometry at line 285.
  - GeometricTopology is on main.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/TeichmullerGeometry'` is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- **Overlaps and citations.**
  - `overlaps.md` lists no other pull request that changes this roadmap, no dropped id and no revision-only id.
  - The 15 entries under "Lean names found nowhere" in `citations.md` are this roadmap's own `Suggested.lean` declarations.
  - `roadmaps grep -i 'ArithmeticFuchsianGroups Layer 1 item'` finds no match on main or in any open pull request, so the renaming strands no citation.
- **Sibling heads read directly:**
  - #2026 at `f16c179` (it was at `c567d7a` in the previous review);
  - #1168 at `1e1ceeb` (it was at `a1a346e`);
  - #903 at `d3b536e` (unchanged).

### The changed passages, resolved against ArithmeticFuchsianGroups at `f16c179`

- **§1.1 exists** at README line 311 ("Real splittings, orders and the lattices `Γ(O)`"). It matches each clause of this README's line 102:
  - **Split at exactly one real place.** `RealSplitting` (Suggested line 50) has the field `ramified : ∀ σ ≠ place, σ a < 0 ∧ σ b < 0` and a splitting that restricts to `place` on scalars.
  - **The norm-one image.** `normOneImage` (line 67) is generated by the `projSL` images of `S.splitting x` for `x ∈ unitary ℍ[k,a,b] ∩ O`.
  - **A lattice.** `isCofinite_normOneImage` (line 84) assumes `[NumberField k] [IsTotallyReal k]` and `IsOrder k O`.
  - **Cocompact exactly when division.** `cocompact_normOneImage_iff_anisotropic` (line 92) is an iff with `(QuaternionAlgebra.normForm a 0 b).Anisotropic`.
  - **Commensurable up to conjugacy.** `IsArithmetic` (line 75) asks for `∃ c : PSL(2, ℝ)` with `(MulAut.conj c • Γ).Commensurable (normOneImage S O)`.
- **§1.4 exists** at README line 634. It contains the bounded-covolume theorem `finite_conj_isArithmetic_covolume_le` (Suggested line 200) and Takeuchi's fixed-signature corollary.
  - Signatures are quantified with `g, c, r ≥ 0` and `m_j ≥ 2`, so `(g; −)` is included, as line 102 assumes.
  - Classes are counted up to `PSL₂(ℝ)`-conjugacy. Each `PGL₂(ℝ)`-class is the union of at most two `PSL₂(ℝ)`-classes, which is what §9.2's transfer (line 872) needs.
- **§3.1 is unchanged in substance.** It is at line 991, with the Lean statement at Suggested line 241: `existsUnique_pgl_smul_eq_isometryEquiv (f : UpperHalfPlane ≃ᵢ UpperHalfPlane) : ∃! c : PGL(2, ℝ), ∀ z, f z = c • z`. This is exactly what lines 27 and 102 assume.
- **Single owner.** #2026's "Owned here" (lines 30–43) owns `Γ(O)`, the arithmetic predicate, the lattice and cocompactness theorems (§1.1) and both finiteness theorems (§1.4).
  - This README has 0 owning statements for these, and 9 citing lines (20, 27, 102, 860, 868, 872, 878, 880, 1006).
  - #2026 has no *Needs* on this roadmap. Its line 1131 is a consumer note.
- **Untouched citations of the same supplier still resolve:**
  - line 900, "ArithmeticFuchsianGroups Layer 1" (heading at #2026 line 305);
  - line 990, "ArithmeticFuchsianGroups Layer 3" (line 984).
- **FuchsianOrbifolds Layer 4 item 5,** named in changed lines 102, 872 and 880, exists at #1168 `1e1ceeb` lines 542–548. It covers the orbifold signature and the area formula, and points to Layer 5 item 7 for the intrinsic form with the genus. That pointer was already present at `a1a346e`.
- **Mathlib at the pin,** for *Needs* line 868:
  - `QuaternionAlgebra`: `Mathlib/Algebra/Quaternion.lean` line 65. `ℍ[R, a, b]` is `QuaternionAlgebra R a 0 b` (line 83).
  - `NumberField`: `Mathlib/NumberTheory/NumberField/Basic.lean` line 43.
  - `NumberField.IsTotallyReal`: `…/InfinitePlace/TotallyRealComplex.lean` line 48, inside `namespace NumberField` (line 34).
  - `NumberField.InfinitePlace`: `…/InfinitePlace/Basic.lean` line 56.
  - `UpperHalfPlane.cosh_dist`, used by #2026's §3.1 route: `Mathlib/Analysis/Complex/UpperHalfPlane/Metric.lean` line 68.
- **External locators in the changed lines,** re-read in the worker's cache:
  - **Takeuchi 1975** (J-STAGE), line 860.
    - §1 (printed p. 600, takeuchi1975 lines 10–30): `k` totally real, `A` unramified at one real place and ramified at the others, `Γ(A, O)` the image of the norm-one units of an order.
    - The Definition (p. 601, lines 42–46): arithmetic means commensurable with some `Γ(A, O)`, and changing the splitting conjugates by `GL₂(ℝ)` (lines 40–41).
    - The README's "commensurable up to conjugacy" is therefore Takeuchi's definition.
  - **Borel 1981** (Numdam), lines 872 and 878.
    - Lemma 8.1 (printed p. 25, borel1981 lines 779–789): a generator bound for bounded covolume, with the case `a = 1, b = 0`, `G_{1,0} = PGL₂(ℝ)`, treated first.
    - Theorem 8.2 (printed p. 26, lines 811–815): finitely many conjugacy classes of arithmetic subgroups of `G_{a,b}` of covolume at most `c`.
- **The seeded sample.** None of the fifteen seeded targets falls in the changed lines. Their locators were verified in rounds `~8` to `~10` and `~14`. The README flags no locator as unverified.

### Adversarial table

Rows C1–C8 are new and cover every changed statement. The other rows are carried from the previous report, `~17`, for statements this diff leaves untouched; `~17` in turn carried rows from `~13` to `~16`.

| # | Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|---|
| C1 | Line 102: `Γ(O)` is a lattice, cocompact exactly when `B` is division | `k = ℚ`, `(1,1)`, `O ↦ M₂(ℤ)`; `k = ℚ`, `(−1,3)`; `k = ℚ(√2)`, `(1,1)` | `(1,1)`: `Γ(O) = PSL₂(ℤ)`, covolume `π/3 ≈ 1.0472`, a cusp; the norm form `x₀² − x₁² − x₂² + x₃²` vanishes at `(1,1,0,0)`, so isotropic. Both sides false. `(−1,3)`: the norm form `x₀² + x₁² − 3x₂² − 3x₃²`; `3 ∣ x₀² + x₁²` forces `3 ∣ x₀, x₁` (`−1` is a non-square mod 3), then `3 ∣ x₂² + x₃²`, so anisotropic by descent; cocompact; discriminant 6. Both sides true. `ℚ(√2)`, `(1,1)`: `σ(1) = 1 ≮ 0` at the other place, so `RealSplitting.ramified` fails | true; "exactly one real place" is enforced | none |
| C2 | Line 102: §1.4 covers `(g; −)` | `g = 1, 2, 3` | `A = 2π(2g − 2)` gives `0` (no lattice), `4π ≈ 12.566` and `8π ≈ 25.133`. For `g = 2`: `r₀ = 4` and `C_sig = 2⁴·4π = 64π`, equal to #2026 §1.4's own Check | true | none |
| C3 | Lines 20 and 872: transfer from `PSL₂(ℝ)`-classes to `Mod±(Σ)`-orbits | the Bolza group `Γ_B`; `ρ = diag(−1,1)` | `[PGL₂(ℝ) : PSL₂(ℝ)] = 2`, so the `PGL₂(ℝ)`-class of `Γ_B` is the `PSL₂(ℝ)`-class of `Γ_B` together with that of `ρΓ_Bρ⁻¹`: 1 or 2 classes, inside 1 `PGL₂(ℝ)`-class. The covolume is `48·π/12 = 4π = 4π(2 − 1)` | true; finiteness passes down | none |
| C4 | Line 860: an `Arith(Σ)` point's algebra is division | Klein (`g = 3`); `PSL₂(ℤ)` | Klein: `168·π/21 = 8π = 4π(3 − 1)`; `k = ℚ(cos 2π/7)`, `n = 3 ≥ 2`, so `B` ramifies at 2 real places and is division (§1.1). `PSL₂(ℤ)` is not cocompact, and commensurability preserves cocompactness (finite index both ways), so no surface group is commensurable with it | true | none |
| C5 | Line 878, Check 3 (rename only) | `(0;2,3,7)`, `(0;2,3,8)`, `m → ∞` | `2π(−2 + 1/2 + 2/3 + 1 − 1/m) = 2π(1/6 − 1/m)` gives `π/21 ≈ 0.1496`, `π/12 ≈ 0.2618` and a limit `π/3 ≈ 1.0472`, all `< π/3`. The bound `2h − 2 + r/2 ≤ c/2π` gives `4h + r ≤ c/π + 4`, consistent with #2026's `2g + r + c ≤ A/π + 4` | true | none |
| C6 | Lines 868 and 880: *Needs* | the cited ids | §1.1 at #2026 line 311 and §1.4 at line 634; FuchsianOrbifolds Layer 4 item 5 at #1168 line 542; 4 Mathlib names at the pin (above) | resolve; nothing points upward | none |
| C7 | Line 1006: `Γ(O)` is supplied elsewhere | #2026 Suggested line 84 | "discrete of finite covolume" is `Subgroup.IsCofinite`; the list still has 3 supplied-elsewhere bullets, matching "three objects" (line 994) | true | none |
| C8 | Lines 20 and 27: scope lines | ownership greps | #2026 owns at lines 30–43; this README has 0 owning statements and 9 citing lines | single owner | none |
| ~17 B1–B11 | §0.4a, line 51, contracts, Downstream consumers, `Suggested.lean` | `diag(−2,1)`, `diag(−4,2)`, `diag(2,−1)`, `−3I`, `S` | `1+i ↦ −2+2i`; `dist(2+2i, −2+2i) = 1.762747`; `dist(i,2i) = 0.693147`; `rfl` probe; 21 `sorry` warnings | true | none |
| ~16 A3, A4, A9 | §0.4a image of `toPGL`; discreteness; R4 item 7 | `⟨diag(−2,1)⟩`; `⟨diag(2,1), diag(3,1)⟩` | `Γ⁺ = ⟨diag(4,1)⟩`, index 2; `d(i, 4ᵏi) = \|k\|·1.386294` | true | none |
| ~15 H2 | The earlier-id list | 11 ids | 10 headings, and Layer 4.1 maps to §0.4a | true | none |
| ~14 G1–G8, G10, G11 | contracts, §9.1–§9.2 (pre-rename), `OuterAut`, Dehn–Nielsen–Baer | `M₂(ℤ)`, `(2,3,7)`, Bolza, `S₃`, `Q₈`, `T²` | `π/3`; `2π/42`; `\|Out(S₃)\| = 1`; `GL₂(ℤ)`; genus `17 = 8·3 − 7` | true | none |
| ~13 E1–E8 and earlier | §§0.0a–11.1, conventions | `S = ∅`, Dyck, `Q₈`, Bolza, Klein | `χ = 1, 0, −1`; `96 ≤ 168`; `e = −2` | true | R01 (ownership in #903) |

### Headline theorems and padding

- **Headlines.** `Suggested.lean` is unchanged.
  - It states 21 sorried headlines:
    - PL approximation, boundary invariance and Epstein (§§0.0a–0.0d);
    - classification of compact surfaces (§0.0f);
    - topological Riemann–Hurwitz (§0.0g);
    - the PL/topological mapping class comparison (§0.0h);
    - the sphere and torus mapping class groups (§5.4a);
    - Dehn–Nielsen–Baer and its based realization, and the smooth Baer–Epstein kernel (Layer 5);
    - the measurable Riemann mapping theorem (Layer 7);
    - Nielsen realization in its lifting form (Layer 8).
  - The module docstring names as not statable `Teich(Σ)` and its loci, Teichmüller's theorem, the Euler number and coherent orientations. No changed passage adds a headline.
- **Padding.** The diff adds no declaration, so the one-tactic probe of earlier rounds stands.

### Remarks on untouched or supplier text (no change requested here)

- **#2026's consumer note is stale.** #2026 line 1131 still says this roadmap cites §1.1 and §1.4 "as Layer 1 items 1 and 4". That parenthetical is now false; its repair (deleting the parenthetical) belongs to #2026's own review.
- **The previous report's remark on #2026 §3.1 is resolved at `f16c179`.** The route is now metric. Recomputed:
  - `cosh d(z,i) = (x²+y²+1)/(2y)` and `cosh d(z,2i) = (x²+y²+4)/(4y)`, whose combination gives `3/y`;
  - `|z−(1+i)|² − |z−(−1+i)|² = −4x`;
  - `cosh d(1+i, −1+i) = 1 + 4/2 = 3`.
- **Two cited works are not in the manifest.** Takeuchi 1975 and Borel 1981 are read from the worker's cache but are not recorded in the package's `sources.toml`.

## Not verifiable

- **Changed passages:** none. Both external works in the changed lines, Takeuchi 1975 and Borel 1981, were read.
- **Carried from earlier rounds:**
  - Imayoshi–Taniguchi and Hubbard are commercial and not in the cache.
  - Hirsch, Chapter 8, Theorem 1.3 is settled as uncertified.
  - Farb–Margalit, Moise, Massey, Ahlfors–Bers, Douady–Earle, Wolpert and Munkres are paywalled.
  - Kerckhoff 1983 is waived.

## Source issues

- none
