# Review of GromovWittenTheory (pull request #990 at dfbd130)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 46 changed lines since 46c74e9 (28 insertions, 18 deletions, in README.md and Suggested.lean). Nothing outside the folder changed. The gate passes on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

The previous R02 is repaired: §0.2 now builds the completed state module on Tau Ceti's `TauCeti.NovikovModule` through the coordinate map `κ_B`. All 18 cited `NovikovModule` declarations exist at `2fd255d` with the stated hypotheses. The previous R01, the branch pin, is not repaired, and the roadmap now depends on `2fd255d` more heavily than before. One new P3 comes from the repair: the new general closedness target uses a Tau Ceti lemma it does not name, and the Scope section does not claim it.

## R01 (P3) — The README and docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01, not repaired.

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:66`: “### From Tau Ceti (commit 2fd255d)”.
- `README.md:75`: “`TauCeti.NovikovModule R F` (TauCeti/RingTheory/NovikovModule/Basic.lean): for a potential `F : S → ℝ` …”.
- `Suggested.lean:39–43`: “the completed state module of §0.2, which it has in basis coordinates as the completed module `TauCeti.NovikovModule`”.
- `lake-manifest.json:8`.

**Claim:** The targeted build, `lake env lean` and the brief's pinned checkout all read Tau Ceti `a91d3aa`. That commit has none of the following:
- `RingTheory/NovikovSeries/`;
- `RingTheory/NovikovModule/`;
- `AlgebraicGeometry/Curves/NodalGluing/`.

This round adds `TauCeti.NovikovModule` and 17 of its declarations to the Tau Ceti contract (line 75), to §0.2 and to the *Needs:* lines 183, 209 and 644. So more of Layer 0 now consumes declarations that exist only at main's pin. As a result, the docstring's three sentences that say “the pinned Tau Ceti has” are false at the branch pin. They are true at `2fd255d`.

**Witness:** `lake-manifest.json:8` has rev `a91d3aafa8cd…`, and origin/main's manifest has `2fd255d997f4…`. A grep for `NovikovModule|NovikovSeries|GluedCurve` over the branch's pinned Tau Ceti finds 0 files. `git merge-tree` of the merge base, HEAD and origin/main reports 0 conflicts, and main changes nothing in this folder.

**Repair:** The branch takes origin/main, by a merge or a rebase. The manifest then pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` and toolchain `v4.36.0-rc2`.
- No line in the folder changes.
- Rerun the targeted build afterwards. Suggested.lean declares nothing, so only the toolchain matters.
- This is the worker's rebase step, because a repair job cannot edit the manifest.

## R02 (P3) — The new general closedness target in §0.2 uses an unnamed Tau Ceti lemma, and Scope does not claim it

**Location:**
- `README.md:164`: “Prove, for every potential `F : S → ℝ` and every degree function `d : S → Γ` … that the pieces `NovikovModule.gradeBy R F d k` … are independent and closed …, the latter because each coefficient is locally constant”.
- `README.md:75`: the Topology.lean list.
- `README.md:15`: “together with the independence, closedness and convergent decomposition of its homogeneous pieces”.

**Claim:** There are two problems.

1. The closedness route rests on the local constancy of each coefficient map `a ↦ a.val s`. At the pin this is `NovikovModule.isLocallyConstant_apply_val`, and neither the route nor the Topology.lean list of the contract names it. Closedness then follows in one step: `gradeBy R F d k` is the intersection, over the generators `s` with `d s ≠ k`, of the closed sets `{a | a.val s = 0}`. What exists at the pin is cited, not left implicit.
2. The target is stated for every potential and every degree function on Tau Ceti's `NovikovModule`, and so does the API bullet at line 167. Line 15 claims only the pieces of `V ⊗̂ Λ_ω`. The Scope section should say that this roadmap owns the general statement. No other roadmap does: `roadmaps grep NovikovModule` finds only this roadmap on main and at the open heads. FukayaTheory FK0.1 (merge-order line 225) constructs closed pieces only of the nonnegative ring `Λ₀` over MorseNovikov N1's carrier, and states no independence or closedness for module pieces.

**Witness:** Tau Ceti `2fd255d`, `TauCeti/RingTheory/NovikovModule/Topology.lean:313` has `theorem isLocallyConstant_apply_val (s : S) : IsLocallyConstant fun a : NovikovModule R F => a.val s` (for `[Ring R]`, line 98). Grading.lean (lines 55–272) has neither `iSupIndep` nor `IsClosed` for `gradeBy`, so the target itself stays.

**Repair:**
1. Add `NovikovModule.isLocallyConstant_apply_val` to the Topology.lean list at line 75.
2. At line 164, write: “the latter because each coefficient is locally constant (`NovikovModule.isLocallyConstant_apply_val`), so that each piece is the intersection of the closed sets `{a : a s = 0}` for `d s ≠ k`”.
3. At line 15, replace “together with the independence, closedness and convergent decomposition of its homogeneous pieces” with: “together with the independence and closedness of the homogeneous pieces `NovikovModule.gradeBy` for every potential and degree function, the convergent decomposition of the homogeneous pieces of `V ⊗̂ Λ_ω`”.

**Tested on `S = ℕ`, `F(n) = −n`, `d` = parity:**
- `gradeBy 0` consists of the even-supported combinations. A limit `a` of even-supported `a_i` agrees at each odd `n` with some `a_i`, by the cited lemma at `s = n`, so `a n = 0`, and the piece is closed.
- `gradeBy 0 ⊓ gradeBy 1 = 0`.
- For constant `d`, the pieces are `⊤` and `⊥`.

## Previous findings

- R01 — not repaired: `lake-manifest.json:8` still pins Tau Ceti `a91d3aa`. README line 66 names `2fd255d`, and Suggested.lean:39–43 now also says the pinned Tau Ceti has `TauCeti.NovikovModule`, which is absent at `a91d3aa` (R01 above).
- R02 — repaired: line 75 cites `TauCeti.NovikovModule` with `coordinatesLinearEquiv`, `basis`, `potentialFiltration`, `gradeBy`, `kernelProduct` and `novikovKernelProduct`. §0.2 defines `κ_B` into it. The sentences calling the module missing are gone. One new problem in the repair is R02 above.

## Verified sound

**Gate and build.** An independent rerun of the full gate at `dfbd1302f4c2779152124c301ee591259a474f0d` gives every check 0, `OK`, exit 0. The dependency check with `--movable`, against the board's merge order and main content, gives:

```text
depcheck: 236 roadmaps, 2419 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 306, after ImplicitAtlases (215) and AnalyticStableMaps (216).

`git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds README.md, Suggested.lean and metadata.toml. `lake env lean` on Suggested.lean exits 0 with no output (6.6 s).

Suggested.lean has `import Mathlib`, one module docstring and the namespace, with no declaration. The diff changes only docstring lines 39–54. So the `#check` signature comparison and the one-tactic padding probe have no subjects. The file has no sorry'd data and no `set_option`.

**Headline theorems** (docstring items 1–4): none is statable at `a91d3aa` or at `2fd255d`. With `NovikovModule` present, Theorem 3 still lacks the Gromov–Witten classes, as line 43 now says. The other reasons are unchanged from the previous review.

**Library declarations of the changed lines, opened at `2fd255d` (Tau Ceti) and at both Mathlib pins: 21.**

| File | Declarations, lines and hypotheses checked against README lines 75 and 164 |
|---|---|
| TauCeti/RingTheory/NovikovModule/Basic.lean | `NovikovModule` 53 (finite on `{C < F s}`); `coordinates` 227 (`[AddGroup H] [Finite ι]`, `hF : F⟨i, h +ᵥ p⟩ = F⟨i,p⟩ − N h`, 191); `module` 282; `coordinates_smul` 286 (lift-independence); `coordinatesLinearEquiv` 303; `basis` 332; `coordinates_basis` 342; `coordinates_apply_eq_mul_single` 271 |
| NovikovModule/Topology.lean (`[Ring R]`) | `potentialFiltration` 108 (vanishing at potential `> C`); `isClosed_potentialFiltration` 240; `T2Space` 265; `isLocallyConstant_apply_val` 313; `CompleteSpace` 321; `coordinatesContinuousLinearEquiv` 415; `continuousSMul_module` 445; `continuous_kernelProduct` 527 (`[CommRing R]`) |
| NovikovModule/Bilinear.lean | `kernelProduct` 194 (`[CommSemiring R]`, bound `F₀ ≤ F₁ + F₂ + C`, outputs in `NovikovModule R F₀`); `novikovKernelProduct` 703 (`[AddCommGroup H]`, `[Finite ι₁] [Finite ι₂] [Finite ι₀]` at 685–688, invariance `hn₁` and `hn₂` in each input) |
| NovikovModule/Grading.lean | `gradeBy` 55; `mem_gradeBy_iff_coordinates` 123 (`hd : d⟨i, h +ᵥ p⟩ = δ h + d⟨i,p⟩`, `[AddGroup D]`); `smul_mem_gradeBy` 143; `kernelProduct_mem_gradeBy` 209 (shift `ε`) |
| Mathlib (6b7abb3 and 1b1ccf4b) | `Algebra.TensorProduct.basis`, RingTheory/TensorProduct/Free.lean:65 (`Basis ι A (A ⊗[R] M)`); `Module.Basis`, LinearAlgebra/Basis/Defs.lean:89 |
| TauCeti/RingTheory/NovikovSeries/Basic.lean | `finite_setOf_add_eq` 219 (pairs summing to `h` with both coefficients nonzero) |

Each hypothesis is met by §0.2's data:
- `S_B = Σ (b : B), H₂(X; ℤ)` with `B` finite gives `[Finite ι]`.
- `H₂(X; ℤ)` is an `AddCommGroup`.
- `F_B⟨b, h + A⟩ = −ω(h) − ω(A) = F_B⟨b, A⟩ − ω(h)` is `hF` with `N = ω`.
- `d_B⟨b, h + A⟩ = 2c₁(h) + d_B⟨b, A⟩` is `hd` with `δ = 2c₁`.
- The Cauchy kernel satisfies `hn₁` and `hn₂`, because `[C + g = (A + g) + A′] = [C = A + A′]`.

Line 75's claim that Grading.lean has no independence, closedness or decomposition statement holds. A grep of `NovikovModule/` for `iSupIndep`, `IsClosed … gradeBy` and `HasSum` finds none, so those targets stay in §0.2.

**Cross-roadmap and ownership checks.**
- `roadmaps grep NovikovModule` finds this roadmap only, on main and at all 471 open heads.
- FukayaTheory FK0.1 (#1045 head, README line 100) owns the closed pieces `Λ₀^b` of N1's nonnegative ring, a different object from `NovikovModule.gradeBy`. No object has two owners.
- `scratch/overlaps.md` lists no other pull request changing this roadmap and no id that only an open revision defines.

**Seeded sample.** Of the sample, §0.2 (“The Novikov coefficient ring and the completed state module”) is the only changed target. It carries no external locator, and its Tau Ceti and Mathlib locators are the 21 declarations above.

§7.2 (sampled) and §7.1 consume §0.2. §7.1 uses “the closed homogeneous pieces of total degree” and their filtered completion, which agrees with §0.2. The ℂP¹ Check of §7.2, `x ⋆ x = q·1` in degree `4 = 2 + 2`, agrees with `deg q = 4` and with the Cauchy product's degree shift `ε = 0` in §0.2.

The other sampled targets (§§0.3, 1.1, 1.2, 2.1, 3.2, 4.1, 5.1, 5.2, 6.2, 6.5, 6.6, 8.5, 8.6) are untouched, and their rows are carried below.

**Adversarial computations on the changed statements.** Coefficients are ℚ, and `S²` has area 1, so `ω(k) = k` and `2c₁(k) = 4k`.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| `κ_B` carries `U_C(V)` to level `−C` (line 164; Convention line 55; Check line 179) | `S²`, `V = ℚ`, `v = 1 + q`; the wrong model `F = +ω` | `v ∈ U_C(V)` ⇔ `{0,1} ∩ {A < C} = ∅` ⇔ `C ≤ 0`. `κ_B(v)` has potentials `0, −1`, so it lies in level `−C` ⇔ `0 ≤ −C` ⇔ `C ≤ 0`, and in level `C` ⇔ `C ≥ 0`. Under `+ω`, `Σ_(k≥0) q^k` has `{k > C}` infinite, so it is excluded, and `Σ q^(−k)` is admitted. | Correct. |
| `κ_B` is a bijection into `NovikovModule ℚ F_B` | the support of `κ_B(v)` above `C`; the inverse `f ↦ (A ↦ Σ_b f⟨b,A⟩ b)` | The support is contained in `B × {A : v_A ≠ 0, ω(A) < −C}`, which is finite. The inverse support is contained in `⋃_b {f⟨b,·⟩ ≠ 0, ω < C}`, which is finite. | Correct. |
| Homogeneous pieces under `κ_B` (Check line 178) | `S²`, `B = {1, x}`, `D = 3, 4, 6`; the wrong degree `deg b − 2c₁(A)` | `d_B⁻¹{4} = {⟨1,1⟩}`, `d_B⁻¹{6} = {⟨x,1⟩}`, `d_B⁻¹{3} = ∅`. On the other side, `(V ⊗̂ Λ)^4 = ℚ·(q·1)`, `(V ⊗̂ Λ)^6 = ℚ·(q·x)` and `(V ⊗̂ Λ)^3 = 0`. The wrong degree gives `q·1` degree `−4 ≠ 4`. | Correct. |
| Change of basis is `Λ_ω`-linear (Check line 180) | `V = ℚ²`, `B₁ = {e₁+e₂, e₂}`; moving a lift | The dual basis is `e₁^*`, `e₂^* − e₁^*`: `(e₂^*−e₁^*)(e₁+e₂) = 0` and `(e₂^*−e₁^*)(e₂) = 1`. So `(f₁,f₂) ↦ (f₁, f₂−f₁)`, with matrix `[[1,0],[−1,1]]`. Moving a lift from `0` to `A` multiplies by `single(0 − A) 1 = q^(−A)` (Basic.lean:271). | Correct. |
| Cauchy product = `kernelProduct`, `Λ_ω`-bilinear, degree shift 0 (line 164; Check line 181) | `S²`, `V = W = ℚ`, with `(v, w) = (q, q²)` and `(1+q, q)` | `(v⋆w)_3 = v_1 w_2 = 1`, and `v_0 w_3 = v_2 w_1 = 0`. Potentials: `−3 = (−1) + (−2)`, so the bound is 0. Degrees: `12 = 4 + 8`. `(1+q)·q = q + q²`. Each input pair has one output, so `hfin` holds. | Correct. |
| `V ⊗ Λ_ω → V ⊗̂ Λ_ω` is an isomorphism for finite-dimensional `V` | `b ⊗ 1` for `b ∈ B`; `V = ℚ^(∞)` | `κ_B(b⊗1)⟨b′,A⟩ = δ_(bb′) δ_(A0)`, which is `basis b` at lifts `⟨b,0⟩` (`coordinates_basis`, line 342). For `ℚ^(∞)`, `A_k ↦ e_k` is not a finite sum of pure tensors. | Correct, and finite dimension is needed. |
| Independence and closedness of `NovikovModule.gradeBy` for every `F`, `d` (line 164; API line 167) | `S = ℕ`, `F(n) = −n`, `d` = parity; `d` constant | `gradeBy 0 ⊓ gradeBy 1 = 0`. A Cauchy limit of even-supported `a_i` agrees at odd `n` with some `a_i`, so it is 0 there. For constant `d`, the pieces are `⊤` and `⊥`. | True and absent at the pin. Its route is R02. |
| Perfect pairing, degree `−n` (line 164; API line 169; Check line 177) | `T²` with basis `1, α, β, pt`; the zero pairing; `S²` with `⟨1, x⟩ = 1` | `T²`: the Gram matrix is the permutation `(1 4)(2 3)` (even), with entry product `1·1·(−1)·1`, so `det = −1`. The zero pairing has `det = 0`, so it is not perfect. `S²`: `d₀ = 4(A+A′)`, `d₁+d₂ = 2 + 4(A+A′)`, so `ε = −2 = −n`. | Correct. |
| Docstring and contract: Tau Ceti has `NovikovModule` (Suggested.lean:39–43, 50–51; README line 75) | `a91d3aa`; `2fd255d` | `a91d3aa`: 0 files. `2fd255d`: Basic.lean:53. | R01. |

**Carried forward from the previous report** (r7 at `46c74e9`, for statements the diff leaves untouched, with the values computed there):
- **§0.2 ring part** (lines 74 and 164, unchanged in substance):
  - `S²` gives `toLaurentSeries`, `ℚ((q))`;
  - Enriques `(q^τ−1)(q^τ+1) = 0`;
  - onto ⇔ `ω = 0`;
  - `q^A·q^(−A) = 1`;
  - `gradeBy` on `S²`, `ℂP²` and K3 gives `⊥` at `D = 6`, `a q²` at `D = 8`, `12 = 6 + 6`, and `⊤`;
  - `finite_setOf_add_eq` at `h = 5` gives 6 pairs.
- **Stacks 18.3** (line 774): `L₁ ⊂ L₁ ∪ L₂` gives `𝒢 = I_(L₁) ≠ 0`; the nodal cubic gives `𝒢 = 0`.
- **The r6/r5/r3/r4 rows carried in r7:**
  - §3.2: `h¹ = 1, 0, 1, 1`;
  - §1.2: stable range true, true, false, false;
  - §2.2: `c = 1` vs `1/2`;
  - ImplicitAtlases §6.5: `ℚ²`, `Ȟ¹ = ℚ`;
  - §8.2: `1/24`;
  - 0.1: areas `1, −1, 0`;
  - 0.3: 4 classes;
  - 1.1: `2g−2+n = 1, 1, 0, 0`;
  - 1.2: dimensions `0, 10`;
  - 2.1: `1/2` vs `1`;
  - 2.3: `1, 2`;
  - 3.1: `−1`;
  - 3.3: `r = 0`;
  - 3.4: `−1/24`, `λ² = 0`;
  - 4.1: torsion `0`;
  - 4.2: `+1`;
  - 4.3: `s − 2m`;
  - 5.1: `π_*ev^*H = 1`;
  - 5.2: `8 ≠ 10` gives 0;
  - 5.3: `A = 0` gives 0;
  - 5.4: `1, 0, 1`;
  - 6.1: `−1`;
  - 6.2: `1 = 1·1 + 0`;
  - 6.3: `2 = 2`;
  - 6.4: `ξ_*1 = 2τ_D`;
  - 6.5: `12 = 12`;
  - 6.6: `3 > 2`;
  - 7.1: unit only at `A = 0`;
  - 7.2: `H⋆H² = q`, `H²⋆H² = qH`;
  - 8.1: `1` vs `3`;
  - 8.3: `1, 1, 1/24`;
  - 8.4: `1/24`;
  - 8.5: `[D₁]` gives 1;
  - 8.6: `⟨τ₁(pt) pt 1⟩ = 1`.

**Remarks on untouched text** (no change requested):
- Line 209 changed only in its Tau Ceti item. Its DifferentialGeometry Layer 8 citation is the overlaps lead. DifferentialGeometry's open revision, now at head `e8165fc3`, still lists no Layer 8. Main's DifferentialGeometry has it (line 816), and its successor DeRhamCohomologyAndDuality (head `1b57dbe0`) is at merge-order line 394, after this roadmap. A revision is cited as it is on main, so the citation stands, as in the previous reviews.
- Line 75 calls `novikovKernelProduct` a “bilinear form”. It is a bilinear map into a completed module, not into the scalars.

## Not verifiable

- The construction targets that have no primary source are unchanged from the previous review: §1.2, §2.1, §3.2, §6.5, and the analytic versions of §§8.2 and 8.4–8.6. The sampled instances are consistency tests, not proofs.
- The diff cites no new external source. The one cached text (stacks-curves) is unchanged, and `needs-references.toml` was not needed. This review edits no manifest.

## Source issues

- none
