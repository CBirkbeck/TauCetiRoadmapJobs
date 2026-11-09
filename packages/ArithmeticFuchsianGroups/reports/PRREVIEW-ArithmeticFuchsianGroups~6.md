# Review of ArithmeticFuchsianGroups (pull request #2026 at 5fdb26d)

**Verdict:** accepted

This is an incremental re-review of the 38 lines changed since 82ce1e4. All of them are in `TauCetiRoadmap/ArithmeticFuchsianGroups/README.md`.

- The one finding of the previous review (R01, P3) is repaired, and the repair introduces no new problem.
- The gate passes.
- The dependency check reports no problem.
- `Suggested.lean` is unchanged since 82ce1e4. It elaborates with only the 17 `sorry` warnings.
- The Takeuchi locator, listed as not verifiable last round, is now checked against a legal copy: Theorem 2.1 is on printed p. 382, as cited.

There are no findings.

## Previous findings

- R01 — repaired: README lines 396–399 now read: "The comparison is made over `ℝ`, and the argument below works for every field `k`. For a number field `k` the image `place(k)` is countable, so `M₂(ℝ)` is infinite-dimensional over `k` … for `k = ℝ`, `place` is the identity".

## Verified sound

**The changed passages, one by one.**

- **§1.1, lines 394–407: the comparison of two real splittings.**
  - *The number-field clause.* A number field is countable, so `place(k)` is a countable subfield of `ℝ`. Since `ℝ` is uncountable, it has infinite dimension over `place(k)`, and so does `M₂(ℝ)`. The `[FiniteDimensional K A]` binder of `TauCeti.skolemNoether` therefore fails over `k`, and "does not apply" is correct.
  - *The `k = ℝ` clause.* Mathlib's `Real.RingHom.unique` (`Mathlib/Algebra/Order/Archimedean/Real/Hom.lean:40`) makes `place = id`. Then `ι = id`, `f_m = S_m`, and the route is Skolem–Noether on `S₁, S₂` themselves.
  - *"Works for every field `k`."* The route needs only three facts. First, `place(a), place(b) ≠ 0`, because a field homomorphism is injective. Second, the `lift` relations hold. Third, `f₁` is onto, because `B` is simple, so `f₁` is injective, and both sides have dimension 4.
  - *Fields between the two cases.* When `place(k) ⊊ ℝ`, Artin–Schreier makes `ℝ` infinite over `place(k)`. The text claims nothing about such fields beyond the route over `ℝ`, which is correct.
- **§1.1, lines 427–434: the new Check at `k = ℝ`.** Every value in it was recomputed. A scratch probe importing the built `Suggested` module elaborates with exit code 0 and only style lints. It does the following:
  - It builds `QuaternionAlgebra.Basis M₂(ℝ) 1 0 1` with `i = diag(1,−1)` and `j = (0 1; 1 0)`, which proves the relations.
  - It builds a term `RealSplitting ℝ 1 1` from it: `place := RingHom.id ℝ`, `ramified` discharged by `Subsingleton.elim`, and `splitting_algebraMap` from `AlgHom.commutes`.
  - It proves `finrank ℝ M₂(ℝ) = 4`.
  - It proves `diag(2,1)·diag(1,−1)·diag(1/2,1) = diag(1,−1)` and `diag(2,1)·(0 1; 1 0)·diag(1/2,1) = (0 2; 1/2 0)`.
  - It proves `(0 1; 1 0)·diag(1,−1) = (0 −1; 1 0)` and `diag(1,−1)·(0 1; 1 0) = (0 1; −1 0)`.
  - It elaborates `TauCeti.skolemNoether ℝ S1 S2`.
  - Separately, the coordinate matrix of `I, diag(1,−1), (0 1; 1 0), (0 1; −1 0)` has determinant 4 ≠ 0, so the four images span `M₂(ℝ)` and the conjugator is unique up to `ℝ^×`.
- **Supplier contract, lines 233–237.** It now says the theorem is applied to the induced maps `ℍ[ℝ, place(a), place(b)] → M₂(ℝ)`. It agrees with the binders at `TauCeti/Algebra/CentralSimple/SkolemNoether.lean:107`: `[IsSimpleRing A] [FiniteDimensional K A] [Algebra.IsCentral K B] [IsSimpleRing B]`, `f g : B →ₐ[K] A`, conclusion `g x = u * f x * u⁻¹`. The direction `f₂ = u f₁ u⁻¹` at line 406 and `S₂ = Ad(u) ∘ S₁` in the Check match it.
- **References, lines 1425–1427: `takeuchi1983`.**
  - The journal, volume and pages (35, 381–407; 27 pages) match `takeuchi1983` lines 5–7.
  - Printed page 382 is `takeuchi1983` line 39, and Theorem 2.1 is lines 66–68.
  - The URL is the J-STAGE copy that the manifest records as certified (sha256 `6c4f44cf…`). J-STAGE is the journal's open archive, so the copy is legal.
- **§1.3, lines 669–672 (untouched).** It applies `TauCeti.skolemNoether` to the induced `ℝ`-algebra maps "and not to the splittings over `k`". Its `k` is a totally real number field (it concerns `Γ(O)`), so it agrees with the new clause.

**The sample target 1.4: Takeuchi 1983, Theorem 2.1, now verified.**

The previous reports listed this locator as not verifiable. Against `takeuchi1983`:

- *Hypotheses.* The theorem allows arbitrary nonnegative `g, t` (lines 66–68). In the signature `(g; e₁, …, e_t)`, `e_j = ∞` encodes a cusp (line 54).
- *Arithmeticity.* Its arithmetic groups are the finite-covolume subgroups of `SL₂(ℝ)` commensurable with some `ρ₁(O¹)` (lines 50–52), over a totally real `k` with one split real place (lines 31–35). This is the README's `IsArithmetic` read in `SL₂(ℝ)`, with `ρ₁` fixed up to `GL₂(ℝ)`-conjugacy (line 43) and the splitting quantified.
- *From `SL₂` to `PSL₂`.* A lattice in `PSL₂(ℝ)` and its preimage in `SL₂(ℝ)` have the same signature. Arithmeticity passes between them, and finiteness up to `SL₂(ℝ)`-conjugacy implies finiteness up to `PSL₂(ℝ)`-conjugacy. So README lines 804–808 and the docstring of `finite_conj_isArithmetic_covolume_le` (`Suggested.lean:206–209`) are supported as written.
- *Covolume normalisation.* Takeuchi's normalisation (2.3) at `(0; 2, 3, ∞)` gives `−2 + 1/2 + 2/3 + 1 = 1/6`, and `2π · 1/6 = π/3`. This is the README's `A` with `c = 1`.
- *Shimizu's formula (2.4).* Lines 94–99 give `vol(H/Γ¹(A, O₁)) = 4(2π)^(−2n) d(k)^(3/2) ζ_k(2) ∏_(𝔭 | D(A)) (N𝔭 − 1)` in that normalisation. Multiplied by `2π`, it is the README's §1.2 formula `8π |d_k|^(3/2) ζ_k(2) (4π²)^(−n) ∏(N𝔭 − 1)`.

**Gate, dependencies and scope.**

- I re-ran the gate at this head. Its output: `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. The worker's run also reports `build=0`.
- The dependency check prints `depcheck: 238 roadmaps, 2321 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- In the merge order, FuchsianOrbifolds is line 49, this roadmap line 284 and TeichmullerGeometry line 285.
- `git diff --stat` against the base, outside the folder, is empty.
- `git diff --stat 82ce1e4 HEAD` lists only `README.md` (25 insertions, 13 deletions).

**Elaboration and signatures.**

- `lake env lean` on `Suggested.lean` gives 17 warnings, all `declaration uses sorry`, at lines 84, 92, 110, 147, 155, 167, 177, 191, 200, 210, 218, 226, 232, 240, 252, 262 and 276. Exit code 0; no other message.
- A scratch file with `#check @` for all 28 declarations, from `RealSplitting` to `existsUnique_pgl_smul_eq_isometryEquiv`, elaborates without error.
- The file is unchanged, so the types are those compared with the README last round. For example, `finite_conj_isArithmetic_covolume_le` still quantifies `Γ.IsCofinite → IsArithmetic Γ → covolume ≤ ofReal C`.
- No binder was lost and nothing changed.

**Headline theorems and padding.** These carry over unchanged, because the file is unchanged.

- The headlines stated are the following:
  - `isCofinite_normOneImage`, `cocompact_normOneImage_iff_anisotropic`, `finiteRamification` and `covolume_normOneImage`;
  - the squared-trace and envelope theorems;
  - `discr_ge_odlyzko_five`, `finite_conj_isArithmetic_covolume_le` (which contains Takeuchi's theorem) and `discr_ge_totallyReal`;
  - `isArithmetic_iff_dense_commensurator` and the PGL theorems.
- The isospectral covers of Layer 3 are named in the module docstring as not statable: there is no Laplace spectrum with multiplicities at the pins.
- The one-tactic probe of the previous reports closed none of the 17 sorried theorems.

**Library declarations opened at the pins (file:line).**

- Mathlib:
  - `Algebra/QuaternionBasis.lean:41`: `Basis` with `i*i = c₁•1 + c₂•i`, `j*j = c₃•1`, `i*j = k` and `j*i = c₂•j − k`.
  - `Algebra/QuaternionBasis.lean:180`: `lift : Basis A c₁ c₂ c₃ ≃ (ℍ[R,c₁,c₂,c₃] →ₐ[R] A)`.
  - `Algebra/Order/Archimedean/Real/Hom.lean:40`: `Real.RingHom.unique`.
- Tau Ceti:
  - `Algebra/CentralSimple/SkolemNoether.lean:107`, `skolemNoether`, in namespace `TauCeti` (line 92).
  - `Algebra/Quaternion/CentralSimple.lean:69`: `instIsSimpleRing`, with `[Field K] [Invertible 2] (a b : Kˣ)`.
  - `Algebra/Quaternion/CentralSimple.lean:151`: `instIsCentral`, with `(a : K) (b : Kˣ) [Invertible 2]`.
  - Both instances are in namespace `TauCeti.QuaternionAlgebra`, as the contract at lines 238–241 names them.

**Cross-roadmap citations.**

- The diff adds no cross-roadmap citation and no Lean name of this roadmap's own.
- The two leads in the worker's `roadmaps resolve` list are in untouched text and were resolved by the previous reports: `Building.exists_fixedPoint_of_bounded` (line 334, ReductiveGroupsPartII) and `Reduction.finite_classes` (line 295, AdelicAlgebraicGroups).
- `overlaps.md` lists no open pull request that changes this folder, and no dropped id.

**Ownership.**

- The diff introduces no new object.
- A `roadmaps grep` for real splittings finds the same notion only in QuaternionArithmetic Layers 8–9. That roadmap is a consumer of this one, over `ℚ`, as the Downstream consumers section already records.
- I found no new second owner.

**Adversarial table.** The first block holds new rows for the changed statements, with computed values.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| §1.1, number-field clause | `k = ℚ`; `k = ℚ(√2)` | `place(k)` is countable and `dim_k ℝ` is uncountable, so `M₂(ℝ)` is not finite over `k`; the binder `[FiniteDimensional K A]` fails | holds | none |
| §1.1, `k = ℝ` clause | `k = ℝ`, `(a,b) = (1,1)` | `Real.RingHom.unique` gives `place = id`; `finrank_ℝ M₂(ℝ) = 4`; `skolemNoether ℝ S1 S2` elaborates | holds; elaborated | none |
| §1.1, "every field `k`" | `place(k) ⊊ ℝ`, e.g. `ℚ(√2)` | `place(a), place(b) ≠ 0`; `f₁` is injective (`B` simple), and `4 = 4` makes it onto; Artin–Schreier makes `ℝ` infinite over every proper subfield | holds | none |
| New Check: `S₁` is a real splitting | `k = ℝ`, `(1,1)` | `S₁(i)² = S₁(j)² = I`; `S₁(j)S₁(i) = (0 −1; 1 0) = −(0 1; −1 0)`; the `RealSplitting ℝ 1 1` term elaborates, with `ramified` vacuous | holds; elaborated | none |
| New Check: the conjugate `S₂` | `u = diag(2,1)`, `u⁻¹ = diag(1/2,1)` | `u·diag(1,−1)·u⁻¹ = diag(1,−1)`; `u(0 1; 1 0)u⁻¹ = (0 2; 1/2 0)`; `u·u⁻¹ = I` | holds; elaborated | none |
| New Check: uniqueness up to `ℝ^×` | images of `1, i, j, ij` | the coordinate determinant is `4 ≠ 0`, so the images span `M₂(ℝ)` and the centralizer is `ℝ·I` | holds | none |
| New Check, wrong model: inverse direction `u⁻¹S₁u` | `u = diag(2,1)` | `diag(1/2,1)(0 1; 1 0)diag(2,1) = (0 1/2; 2 0) ≠ (0 2; 1/2 0)` | the Check pins the direction | none |
| New Check, wrong justification | `k = ℝ` | `M₂(ℝ)` infinite-dimensional over `k`: false, since `4 < ∞` | the Check discriminates | none |
| Supplier contract, `skolemNoether` | binders at `:107` | `B = ℍ[ℝ, place a, place b]` is central and simple; `A = M₂(ℝ)` is simple and 4-dimensional over `ℝ`; no condition over `k` | holds | none |
| §1.4, Takeuchi Theorem 2.1 locator | p. 382 | printed page `382` at `takeuchi1983` line 39; the theorem at lines 66–68; `g, t ≥ 0` arbitrary | holds | none |
| §1.4, covolume of a signature (Takeuchi (2.3)) | `(0; 2, 3; 1)` | `2π(−2 + 1/2 + 2/3 + 1) = π/3`; Takeuchi `1/6 × 2π = π/3` | holds | none |
| §1.2 formula against Shimizu (Takeuchi (2.4)) | general `n`; `k = ℚ`, `M₂(ℤ)` | `2π·4(2π)^(−2n) = 8π(4π²)^(−n)`; at `ℚ`, `4(2π)^(−2)·π²/6 = 1/6`, which is `π/3` after `×2π` | holds | none |

The rows below are carried forward from the previous report (PRREVIEW-ArithmeticFuchsianGroups~5, at 82ce1e4) for the statements this diff leaves untouched. The values are those recorded there.

- Summary / §1.2 index scaling: `π/3`, `Γ₀(2)` gives `π`, `Γ̄(2)` gives `2π`.
- §1.2(c), split place: `3/4, 8/9, 24/25, 48/49`.
- §1.2(c), division place: `3/4, 4/9, 6/25, 8/49`.
- §1.2(c), wrong model: `1 + q⁻¹`, whose product diverges.
- §1.2(c) product: `π/3`.
- §1.1, comparison over `ℝ` at `k = ℚ`: `u = diag(√2,1)`.
- The `QuaternionAlgebra.lift` relations.
- §2.2, Skolem–Noether over `K₀`: `b_c = diag(2,1)`.
- `liftSL`: `{±I}`, `S` of order 4, index 2 for `Γ₁(4)`.
- `squareSubgroup`: indices 2 and 4; no word squares to `aabb`.
- `N_B⁺(O)` and `ν`: `−z̄`, `[4] = [1]`, Hurwitz index 1, the product of the cosines is `1.0000`.
- The Lean section titles.

That report also carried rows from PRREVIEW-ArithmeticFuchsianGroups~4 (at b98ed29), with the values recorded there:

- `RealSplitting`: `−1.414 < 0`.
- `normOneImage`: `π/3`.
- `cocompact_…`: `(1,1)` against `(−1,3)`.
- `IsArithmetic`: `G₅`, with `φ − 1`.
- `finiteRamification`: `{2}, {2,3}, ∅, ∅`.
- `covolume_normOneImage`: `π/3, 2π/3, π/21`.
- `IsNonelementary`: F, F, T.
- `squaredTraceField`.
- The commensurable direction: `2^(±2/3)`.
- The envelope theorem: dimensions 4 and 1.
- `integral_trace_lattice_order`.
- Squared-trace integrality: `5/2` and `φ`.
- `discr_ge_odlyzko_five`: `2.33·10⁻²⁹ ≤ 1`.
- Inequality (13): `4.0·10⁻⁷ > 0`.
- `finite_conj_isArithmetic_covolume_le`: `F = ∅` below `π/21`.
- The §1.4 constants: `325.0 ≥ 49`.
- The standard presentation: `ℤ/6`; genus 3 gives `−4`.
- `discr_ge_totallyReal`: minimum ratio `1.2036914` at `n = 9`.
- `H`, `F_b`: `∫H = 4/3`.
- §2.0, `isArithmetic_iff_dense_commensurator`, `commensurator_discrete_of_not_isArithmetic`, `dense_commensurator_…_number_field`.
- `instTopologicalSpacePGL`: `diag(1+1/n,1) → 1`.
- `commensurator_pgl_eq_of_maximal`.
- `existsUnique_pgl_smul_eq_isometryEquiv`: `cosh d = 3`.
- §§3.1–3.5: characters `8,0,0,0,2,0,4,0,0,2,0`, `h = 17`, `64π`.

**Sources: the seeded sample within the changed passages.**

- **1.1.** The changed text adds no source locator. Its library claims are checked above.
- **1.4.** The Takeuchi locator is verified above.
- **The other targets** (1.2, 1.3, 1.3b, 1.5, 2.0–2.4, 3.1–3.5) are untouched. Their verification in the previous reports carries over.
- The README flags no locator as unverified.

## Not verifiable

- **Maclachlan–Reid, Theorems 11.2.1 and 11.3.1, and Margulis, Chapter IX.** The manifest records both as uncertified (paywalled). The diff does not touch these citations.
- **Odlyzko 1977, displayed formulas (4)–(13), and Odlyzko's Table 2.** The formulas are images in the extraction, and the table is not in the cited file. The previous reports recomputed both, and the diff does not touch them.
- **Ownership against open pull requests.** I checked it only through `overlaps.md` and a `roadmaps grep` for the one object the changed passages concern, real splittings. The diff introduces no object a second roadmap could own.

## Source issues

- none
