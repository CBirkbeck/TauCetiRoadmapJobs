# Review of GromovWittenTheory (pull request #990 at 0194363)

**Verdict:** needs changes

:robot: Independent AI review, incremental: 20 changed lines since dfbd130 (11 insertions, 9 deletions, in README.md and Suggested.lean). Nothing outside the folder changed. The gate passes on an independent rerun, the dependency check reports no problem, and `lake env lean` on Suggested.lean exits 0 with no output.

The previous R02 is repaired in all three parts, and the repair is sound: every new declaration it names exists at Tau Ceti `2fd255d` and at both Mathlib pins with the hypotheses the README uses, the new independence and closedness routes are correct, and the new `S = ℕ` Check computes as stated. The previous R01 is not repaired: the branch manifest still pins Tau Ceti `a91d3aa`, so the README's Tau Ceti contract and the Lean docstring describe a library the branch does not build against. It is the only finding.

## R01 (P3) — The README and docstring read Tau Ceti at 2fd255d, but the branch still pins a91d3aa

This is the previous R01, not repaired. The change set raises its weight: three more declarations of `NovikovModule/Topology.lean` are consumed.

**Location:**
- `TauCetiRoadmap/GromovWittenTheory/README.md:66`: “### From Tau Ceti (commit 2fd255d)”.
- `README.md:75`: “the convergence criterion `NovikovModule.tendsto_nhds_iff` …, the local constancy `NovikovModule.isLocallyConstant_apply_val` …, the density `NovikovModule.denseRange_ofFinsupp`”.
- `README.md:184`: the *Needs:* line naming the same three declarations.
- `Suggested.lean:39–43`: “which it has in basis coordinates as the completed module `TauCeti.NovikovModule` with its homogeneous pieces `TauCeti.NovikovModule.gradeBy`”.
- `lake-manifest.json:8`.

**Claim:** The targeted build, `lake env lean` and the brief's pinned checkout read Tau Ceti `a91d3aa`, which has no `RingTheory/NovikovSeries/`, no `RingTheory/NovikovModule/` and no `AlgebraicGeometry/Curves/NodalGluing/`. Every statement of the form “the pinned Tau Ceti has …” in the docstring, and every `NovikovModule.*` and `NovikovSeries.*` name in the contract and the *Needs:* lines, is true at `2fd255d` and false at the branch pin. The toolchain also differs (`v4.35.0-rc3` on the branch, `v4.36.0-rc2` on main).

**Witness:** `lake-manifest.json:8` has rev `a91d3aafa8cd…`; origin/main's manifest has `2fd255d997f4…` for Tau Ceti and `1b1ccf4b…` for Mathlib. The branch's `.lake/packages/TauCeti` is at `a91d3aafa` and has no `TauCeti/RingTheory/NovikovModule` directory; main's package checkout at `2fd255d99` has `NovikovModule/Topology.lean` with `tendsto_nhds_iff` (line 260), `isLocallyConstant_apply_val` (313) and `denseRange_ofFinsupp` (352). `git merge-base HEAD origin/main` is `4b002f62`, and main changes nothing in this folder.

**Repair:** The branch takes origin/main, by a merge or a rebase, so that the manifest pins Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b` and toolchain `v4.36.0-rc2`.
- No line in the folder changes.
- Rerun the targeted build afterwards. Suggested.lean declares nothing, so only the toolchain matters.
- This is the worker's rebase step, because a repair job cannot edit the manifest.

## Previous findings

- R01 — not repaired: `lake-manifest.json:8` still pins Tau Ceti `a91d3aa`. README line 66 names `2fd255d`, and lines 75 and 184 now also consume `NovikovModule.tendsto_nhds_iff`, `isLocallyConstant_apply_val` and `denseRange_ofFinsupp`, absent at `a91d3aa` (R01 above).
- R02 — repaired: line 75's Topology.lean list names `NovikovModule.isLocallyConstant_apply_val`; line 164 gives the closedness route through it (“each a fibre of the locally constant coefficient map `a ↦ a s` … and so closed (`IsLocallyConstant.isClosed_fiber`, `isClosed_biInter`)”); line 15 claims “the independence and closedness of the homogeneous pieces `NovikovModule.gradeBy` of Tau Ceti's completed modules over every ring, for every potential and every degree function”. No new problem.

## Verified sound

**Gate and build.** An independent rerun of the full gate at `0194363c92b8a708c45bbbb88511f2946a52da49` gives every check 0, `OK`, exit 0; the rerun line prints no `build` field, the worker's gate at the same head has `build=0`, and the elaboration below covers the module. The dependency check with `--movable`, against the board's merge order and main content, gives:

```text
depcheck: 237 roadmaps, 2341 edges, 0 problem(s)
```

There is no UPWARD or CYCLE line. GromovWittenTheory is at merge-order line 305, after ImplicitAtlases (213), AnalyticStableMaps (214) and FukayaTheory (223).

`git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds README.md, Suggested.lean and metadata.toml. `lake env lean` on Suggested.lean exits 0 with no output (9.5 s).

Suggested.lean has `import Mathlib`, one module docstring and the namespace, with no declaration; the diff changes only docstring lines 52–55. So the `#check` signature comparison and the one-tactic padding probe have no subjects. The file has no sorry'd data and no `set_option`.

**Headline theorems** (docstring items 1–4): none is statable at `a91d3aa` or at `2fd255d`, for the reasons the docstring gives; the changed docstring sentence only renames what Layer 0 owns and states nothing in place of a headline.

**Library declarations of the changed lines, opened at Tau Ceti `2fd255d` and at Mathlib `6b7abb3c` and `1b1ccf4b`: 5 new, plus the standing `[Ring R]` and `[Semiring R]` contexts.**

| File | Declaration, line, hypotheses, and what the README says of it |
|---|---|
| TauCeti/RingTheory/NovikovModule/Topology.lean (`variable [Ring R]`, line 98) | `tendsto_nhds_iff` 260: `Tendsto f l (𝓝 a) ↔ ∀ C, ∀ᶠ i in l, ∀ s, C < F s → (f i).val s = a.val s`. README line 75: “converges exactly when, above every potential cutoff, its coefficients eventually agree with those of the limit” — matches. |
| same | `isLocallyConstant_apply_val` 313: `IsLocallyConstant fun a => a.val s` — matches “the local constancy of each coefficient `a ↦ a s`”. |
| same | `denseRange_ofFinsupp` 352: `DenseRange (ofFinsupp F)`, where `ofFinsupp : (S →₀ R) →ₗ[R] NovikovModule R F` (Basic.lean:121) — matches “the finite combinations are dense”. |
| Mathlib/Topology/LocallyConstant/Basic.lean (inside `namespace IsLocallyConstant`, lines 37–209) | `isClosed_fiber` 70: `IsLocallyConstant f → IsClosed {x | f x = y}`, at both pins — matches line 62's gloss. |
| Mathlib/Topology/Basic.lean | `isClosed_biInter` 162: `(∀ i ∈ s, IsClosed (f i)) → IsClosed (⋂ i ∈ s, f i)`, at both pins — the intersection over `{s : d s ≠ k}` is of this shape. |
| TauCeti/RingTheory/NovikovModule/Grading.lean | `gradeBy` 55 under `[Semiring R]` (line 50). A grep of the file for `iSupIndep`, `IsClosed`, `HasSum` and `tendsto` finds nothing, so line 75's “no independence or closedness statement … no decomposition” claim holds and the §0.2 targets stay. |

“Over every ring” (lines 15, 164, 167) matches the `[Ring R]` context of Topology.lean, where the potential-cutoff topology lives; independence alone would hold over a semiring, but the target pairs it with closedness, so the ring scope is the right one.

**Cross-roadmap and ownership checks.** `roadmaps grep NovikovModule` (previous round) finds this roadmap only, on main and at the open heads; the Scope claim at line 15 is now explicit and no other roadmap owns the general statement. `scratch/overlaps.md` lists #1998 (algebraic Gromov–Witten theory and quantum cohomology) as conflicting with this folder's three files; that pull request proposes a different roadmap under the same folder name, so one is rebased on, or renamed away from, the other before either merges. That is a board decision the author cannot settle by an edit here, so it is a remark, not a finding; the previous rounds recorded no such pull request, and nothing in the 20 changed lines bears on it. No id this README cites is dropped by an open pull request, and none is defined only by an open revision.

**Seeded sample.** Of the 15 sampled targets, none is changed by this diff; §0.2 (not in the sample, but the only changed target) carries no external locator, and its library locators are the table above. §7.2 (sampled) consumes §0.2: its ℂP¹ Check `x ⋆ x = q·1` in degree `4 = 2 + 2` is unaffected by the change, which touches only the proofs of independence, closedness and decomposition and not the grading or the product. §7.1 (line 606) uses “the closed homogeneous piece of degree `s + 2(g − 1)m`”, which the strengthened §0.2 target supplies.

**Adversarial computations on the changed statements.** Coefficients are ℚ unless said otherwise.

| Statement | Instances tried | Values computed on each side | Result; change |
|---|---|---|---|
| Independence of `NovikovModule.gradeBy R F d k` “since a finite sum of combinations supported off `d⁻¹{k}` is supported off `d⁻¹{k}`” (line 164) | `S = ℕ`, `F(n) = −n`, `d` = parity; `d(n) = n` | `gradeBy 0 ⊓ gradeBy 1`: an element supported on evens and on odds is `0`. For `d(n) = n`: `gradeBy k ⊓ ⨆_{j≠k} gradeBy j`: the right side is finite sums supported off `{k}`, the left is supported on `{k}`, so the meet is `0`. | Correct. |
| Closedness: `gradeBy k = ⋂_{d s ≠ k} {a : a s = 0}`, each a closed fibre (line 164) | parity, `k = 0`; `a_i → a` with `a_i` even-supported | `a ∈ gradeBy 0` ⇔ `a n = 0` for all odd `n` ⇔ `a ∈ ⋂_{n odd} {a n = 0}`: both inclusions. At odd `n`, `tendsto_nhds_iff` at `C = −n − 1` gives `(a_i) n = a n` eventually, so `a n = 0`. The fibre `{a : a n = 0}` is `{a : (a ↦ a n) = 0}`, a fibre of a locally constant map. | Correct. |
| Sum of the pieces is dense and “closed exactly when it is the whole module” (lines 164, 167) | `d` = parity; `d(n) = n`, element `Σ_n [n]` | Parity: every function is `(even part) + (odd part)`, both in the module since every `ℕ → ℚ` is; so the sum is everything and closed. `d(n) = n`: the sum is the finitely supported functions; the constant `1` has coefficients in infinitely many degrees, so the sum is not everything; it is dense (`denseRange_ofFinsupp`), so it is not closed. Converse: an element with finitely many degrees `k₁..k_m` is `Σ_i (restriction to d⁻¹{k_i})`, each restriction in the module (support condition inherited) and in `gradeBy k_i`. | Correct in both directions. |
| New Check (line 182): `S = ℕ`, `F(n) = −n`: every function is a completed combination | `C = −3.5`; `C = 10` | `{n : C < −n} = {n < −C}`: `{0,1,2,3}` for `C = −3.5`; `∅` for `C = 10`. Finite for every `C`. | Correct. |
| New Check: partial sums of `Σ_n [n]` converge to the constant `1` (line 182) | `C = −3.5`, partial sum over `{0..m}` | Need `(Σ_{n≤m} [n]) s = 1` for all `s` with `C < −s`, i.e. `s < 3.5`, i.e. `s ≤ 3`: holds for `m ≥ 3`. So eventually in `m`, for every `C`; this is `tendsto_nhds_iff`. The limit `1` is not finitely supported. | Correct. |
| New Check: constant `d` gives pieces `⊤` and `⊥` (line 182) | `d ≡ 5`, `k = 5` and `k = 0` | `d⁻¹{5} = ℕ`, `gradeBy 5 = ⊤`; `d⁻¹{0} = ∅`, `gradeBy 0 = {0}`. | Correct. |
| Convergent decomposition through `κ_B` and `tendsto_nhds_iff` (line 164) | `S²` (`ω(k) = k`, `2c₁(k) = 4k`), `V = ℚ`, `v = Σ_{k≥0} q^k`, cutoff `C = 2.5` | Components: `v^(4k) = q^k`. On `{ω < 2.5} = {0,1,2}` only the degrees `0, 4, 8` have nonzero coefficient, so the partial sum over any finite set of degrees containing `{0,4,8}` agrees with `v` there; under `κ_B` (`F_B = −ω`) the cutoff is `−C`, and `C′ < F_B` ⇔ `ω < −C′`, so the two criteria match. | Correct. |
| Scope claim (line 15) vs API bullet (line 167) vs target (line 164): same generality | the three passages | All three say: every ring `R`, every potential `F : S → ℝ`, every degree function `d : S → Γ`; the state modules are the case `R = ℚ`, `F_B`, `d_B`. | Consistent. |
| Line 75: `novikovKernelProduct` is a “Novikov-bilinear map into the completed output module” | the declaration at Bilinear.lean:703 | Its codomain is `NovikovModule R F₀` with the `module` structure, not `R`. The previous remark (“bilinear form”) is now corrected. | Correct. |
| Docstring and contract: “the pinned Tau Ceti has `TauCeti.NovikovModule`” (Suggested.lean:39–43, README:66, 75, 184) | `a91d3aa`; `2fd255d` | `a91d3aa`: no `RingTheory/NovikovModule` directory. `2fd255d`: Basic.lean:53, Topology.lean:260, 313, 352. | R01. |

**Carried forward from the previous report** (r8 at `dfbd130`, for statements the diff leaves untouched, with the values computed there):
- **§0.2, unchanged parts:** `κ_B` carries `U_C(V)` to level `−C` (`v = 1 + q` on `S²`, in `U_C` ⇔ `C ≤ 0` on both sides, `+ω` admits `Σ q^(−k)`); `κ_B` bijective (supports finite on both sides); pieces under `κ_B` on `S²` with `B = {1, x}` (`d_B⁻¹{4} = {⟨1,1⟩}`, `d_B⁻¹{3} = ∅`); change of basis `(f₁, f₂) ↦ (f₁, f₂ − f₁)`, matrix `[[1,0],[−1,1]]`, moved lift multiplies by `q^(−A)`; Cauchy product `(q, q²) ↦ q³`, potentials `−3 = −1 + (−2)`, degrees `12 = 4 + 8`, `(1+q)·q = q + q²`; `V ⊗ Λ_ω → V ⊗̂ Λ_ω` sends `b ⊗ 1` to `basis b`, fails for `ℚ^(∞)`; perfect pairing on `T²` has Gram determinant `−1`, zero pairing `0`, `S²` shift `ε = −2 = −n`.
- **§0.2 ring part:** `S²` gives `ℚ((q))`; Enriques `(q^τ−1)(q^τ+1) = 0`; onto ⇔ `ω = 0`; `q^A·q^(−A) = 1`; `gradeBy` on `S²`, `ℂP²`, K3 gives `⊥` at `D = 6`, `a q²` at `D = 8`, `12 = 6 + 6`, `⊤`; `finite_setOf_add_eq` at `h = 5` gives 6 pairs.
- **Stacks 18.3** (line 774): `L₁ ⊂ L₁ ∪ L₂` gives `𝒢 = I_(L₁) ≠ 0`; the nodal cubic gives `𝒢 = 0`.
- **Sampled and other targets:** 0.1: areas `1, −1, 0`; 0.3: 4 classes; 1.1: `2g−2+n = 1, 1, 0, 0`; 1.2: stable range true, true, false, false and dimensions `0, 10`; 2.1: `1/2` vs `1`; 2.2: `c = 1` vs `1/2`; 2.3: `1, 2`; 3.1: `−1`; 3.2: `h¹ = 1, 0, 1, 1`; 3.3: `r = 0`; 3.4: `−1/24`, `λ² = 0`; 4.1: torsion `0`; 4.2: `+1`; 4.3: `s − 2m`; 5.1: `π_*ev^*H = 1`; 5.2: `8 ≠ 10` gives 0; 5.3: `A = 0` gives 0; 5.4: `1, 0, 1`; 6.1: `−1`; 6.2: `1 = 1·1 + 0`; 6.3: `2 = 2`; 6.4: `ξ_*1 = 2τ_D`; 6.5: `12 = 12`, ImplicitAtlases §6.5 `ℚ²`, `Ȟ¹ = ℚ`; 6.6: `3 > 2`; 7.1: unit only at `A = 0`; 7.2: `H⋆H² = q`, `H²⋆H² = qH`; 8.1: `1` vs `3`; 8.2: `1/24`; 8.3: `1, 1, 1/24`; 8.4: `1/24`; 8.5: `[D₁]` gives 1; 8.6: `⟨τ₁(pt) pt 1⟩ = 1`.

**Remarks on untouched text** (no change requested):
- Pull request #1998 proposes a roadmap under the same folder `TauCetiRoadmap/GromovWittenTheory/` (algebraic Gromov–Witten theory and quantum cohomology) and conflicts with this one in all three files. Two roadmaps cannot share a folder; one of the two is renamed or rebased before either merges. Which one is the board's call.
- Line 209's DifferentialGeometry Layer 8 citation stands as in the previous reviews: main's DifferentialGeometry has Layer 8, and a revision is cited as it is on main.

## Not verifiable

- The construction targets that have no primary source are unchanged from the previous review: §1.2, §2.1, §3.2, §6.5, and the analytic versions of §§8.2 and 8.4–8.6. The sampled instances are consistency tests, not proofs.
- The diff cites no new external source. The one cached text (stacks-curves) is unchanged, and `needs-references.toml` was not needed. This review edits no manifest.

## Source issues

- none
