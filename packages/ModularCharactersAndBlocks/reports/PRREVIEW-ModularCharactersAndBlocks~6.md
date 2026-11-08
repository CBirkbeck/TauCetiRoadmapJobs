# Review of ModularCharactersAndBlocks (pull request #1775 at 931da09)
Folder: `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/`
**Verdict:** needs changes

🤖 Incremental AI re-review of the 30 lines changed since `5c1a0d2` (all in §2.3 of the README; `Suggested.lean` and every other section are byte-identical to the head the previous review read). Two findings, both P3, nothing blocking: the family index is still main's copy and excludes what this roadmap owns (unrepaired since the third review), and the repaired §2.3 route descends along `Gal(k̄/k₀)` with `k̄` the algebraic closure of `k`, which is not a Galois extension of `k₀` when `k` is infinite, the very case the repair was for. The repair of the previous R02 is otherwise correct: the two new Mathlib names exist at the pin with the hypotheses the route uses, the Webb exercises cited for the base change say what the README says, and the new Check's values are right. The gate passes, the dependency check reports no problem, and the Lean file elaborates with exactly the eight `sorry` warnings. No pull-request file was changed.

## R01 (P3) — The family index excludes the roadmap it now contains

**Location:** `TauCetiRoadmap/RepresentationTheory/README.md:11–63` (the list of the family's roadmaps) and `:111–117`, “the modular theory proper — Brauer characters, decomposition matrices, blocks with defect … — is out of scope for every roadmap here”.

**Claim:** The family index describes the family after this pull request.

**Witness:** `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `931da09`; `git diff --stat origin/main...HEAD` lists only the folder's two files. `ls TauCetiRoadmap/RepresentationTheory/` has fourteen roadmap folders and the index lists thirteen; `grep -c ModularCharactersAndBlocks` on the index gives `0`. The exclusion sentence names exactly the objects `ModularCharactersAndBlocks/README.md:26` says this roadmap owns. The pull-request description says the index and the scope boundaries are updated. Re-raised: r5 R01 (r4 R01, r3 R03). No repair report marks it not actionable; if the repair job may not edit the family index, the author's own commit is the place for this edit.

**Repair:** On top of the index as it stands on the branch (main's copy, so that main's later entries are kept), add a list entry for ModularCharactersAndBlocks after ModularInduction (Brauer characters, decomposition and Cartan matrices, projective characters, block idempotents, defect groups, Brauer's three main theorems, the principal-block and section-orthogonality interfaces); a dependency bullet under “How they depend on one another” saying it consumes CharacterTheory, ModularInduction, QuiverRepresentations Layer 3 and InductionRestriction Layer 6; and a scope bullet naming ModularCharactersAndBlocks as the owner of Brauer characters, decomposition matrices and blocks with defect, keeping the exclusion of the modular representation theory of symmetric groups. `git diff 5fe14341~1 4e18c0d3 -- TauCetiRoadmap/RepresentationTheory/README.md` shows three edits with this content; apply them to the current index, not to the older copy that commit edited.

## R02 (P3) — The §2.3 descent is run along `Gal(k̄/k₀)`, which is not a Galois group when `k` is infinite

**Location:** `TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/README.md:420–423`, “Every simple `k̄[G]`-module has Brauer character with values in the image of the `e'`-th roots of unity, so it is fixed by `Gal(k̄/k₀)`; by recognition (§2.1) each simple is Galois-stable, … so it is defined over `k₀`”.

**Claim:** Galois descent along `Gal(k̄/k₀)` takes a Galois-stable simple `k̄[G]`-module to a `k₀[G]`-module, for every field `k` of characteristic `p` containing `ζ_{e'}`.

**Witness:** `k̄` is used throughout the README (§2.1 line 367, the bullet at line 436) as an algebraic closure of `k`. For the Check's own instance `k = 𝔽₄(T)`, `k₀ = 𝔽₄`, the extension `k̄/k₀` has transcendence degree `1`, so it is not algebraic, `Gal(k̄/k₀)` is not a Galois group and Galois descent of modules (which is for a Galois, hence algebraic, extension) does not apply to it; the fixed-field and stability argument that gives a `k₀`-form is only available for the algebraic closure `k̄₀ = 𝔽̄_p` of `k₀` inside `k̄`. The r5 version, with `Gal(k̄/k)` and `k` finite, had no such step; the move to `k₀` created it.

**Repair:** Name `k̄₀ ⊆ k̄` an algebraic closure of `k₀` (it is `𝔽̄_p`, algebraically closed, hence a splitting field for `G`), run the Brauer-character and recognition argument for simple `k̄₀[G]`-modules and `Gal(k̄₀/k₀)`, and conclude that `k₀` is a splitting field; keep the base change `k₀ → k` as written. Then the bullet at line 436 (absolute simplicity, bijection of simples under `k → k̄`) follows from the same radical base change applied to `k ⊆ k̄` (Webb, Chapter 9, Exercise 8(a), p. 166), and should say so. Tested on the instance: `k = 𝔽₄(T)`, `k̄₀ = 𝔽̄₂`, `Gal(𝔽̄₂/𝔽₄)` fixes `ζ₃ ∈ 𝔽₄`, the three one-dimensional simples of `𝔽̄₂[C₃]` (eigenvalues `1, ζ₃, ζ₃²`) are Galois-stable and descend to `𝔽₄`, and the base change gives `𝔽₄(T)[C₃] = 𝔽₄(T)³`, the Check's value.

## Previous findings

- R01 — not repaired: `git diff origin/main...HEAD -- TauCetiRoadmap/RepresentationTheory/README.md` is empty at `931da09`; the index lists thirteen roadmaps, not this one, and `:117` still reads “is out of scope for every roadmap here”. Raised again as R01.
- R02 — repaired, with one new imprecision: `README.md:417–433` now descends over the finite subfield `k₀ = 𝔽_p(ζ_{e'})`, where `littleWedderburn` applies, and passes to `k` by base change of the radical, with the new `*Needs:*` items; the descent names `Gal(k̄/k₀)` with `k̄` the closure of `k`, raised as R02 above.

## Verified sound

**Scope of this round.** The diff since `5c1a0d2` is 23 insertions and 7 deletions, all in §2.3 (`README.md:417–433` and the new Check at `:444–449`); no file outside the folder changed since then, and `git diff --stat origin/main...HEAD` lists only the folder's README (900 lines) and `Suggested.lean` (164 lines). Everything the previous report verified for the untouched sections stands; it is cited below where carried forward.

**Gate and build.** The worker's gate at `931da09` reads `set_option=0 … depcheck=0 … outside-folder=0 … source-material=0 build=0 OK`, every check passing; my own run of the text gate (without the build) gave the same line with every counter `0`. Independent `lake env lean TauCetiRoadmap/RepresentationTheory/ModularCharactersAndBlocks/Suggested.lean` from the pull-request worktree exited 0 in 3.5 s with exactly the eight `declaration uses sorry` warnings at lines 42, 56, 72, 99, 117, 127, 139, 153 and nothing else; the file is unchanged since `5c1a0d2`, so the previous report's signature comparison (`#check @name` for all eleven declarations) and padding probe (none of the eight theorems closes in one tactic) stand. The worktree head is `931da0999a417cfd75b1ce292f452336ced88e86` and clean.

**Dependency check.** The command of the brief returned exactly:

```text
depcheck: 241 roadmaps, 2362 edges, 0 problem(s)
```

No `UPWARD`, `CYCLE` or `moved:` line. The new `*Needs:*` items of §2.3 add no roadmap edge (SemisimpleAlgebras, on main, was already cited; Layers 0 and 2 both exist: `SemisimpleAlgebras/README.md:169` “Layer 0: the Jacobson radical and the semisimplicity criterion”, `:212` “Layer 2: Artin-Wedderburn, assembled with uniqueness”).

**The changed passage against its suppliers and sources.**

| Claim in §2.3 | Where it resolves | Result |
| --- | --- | --- |
| `k₀ = 𝔽_p(ζ_{e'})` is finite because `ζ_{e'}` is integral; Mathlib `IntermediateField.adjoin.finiteDimensional` | `Mathlib/FieldTheory/IntermediateField/Adjoin/Basic.lean:481`, `(hx : IsIntegral K x) : FiniteDimensional K K⟮x⟯` | Exists at the pin with the hypothesis the README states (`ζ_{e'}` is a root of `X^{e'} − 1`, monic over `𝔽_p`). |
| the radical lies in every ideal with semisimple quotient; Mathlib `Ring.jacobson_le_of_eq_bot` | `Mathlib/RingTheory/Jacobson/Radical.lean:166`, `{I : Ideal R} [I.IsTwoSided] (h : jacobson (R ⧸ I) = ⊥) : jacobson R ≤ I` | Exists at the pin; `k ⊗_{k₀} rad(k₀[G])` is two-sided (base change of a two-sided ideal) and its quotient `∏ M_{n_i}(k)` is semisimple, so `jacobson = ⊥` there (`IsSemisimpleRing.jacobson_eq_bot`, which SemisimpleAlgebras Layer 0 consumes). |
| finite division algebras are commutative; Mathlib `littleWedderburn` | `Mathlib/RingTheory/LittleWedderburn.lean:169`, `[DivisionRing D] [Finite D] : Field D` | Applies to `End_{k₀[G]}(T)` for `k₀` finite, which is the only place the route now uses it. |
| a nilpotent ideal lies in the radical; the radical of a finite-dimensional algebra is nilpotent with semisimple quotient (SemisimpleAlgebras Layer 0) | `SemisimpleAlgebras/README.md:176–180` (radical nilpotent via `IsArtinianRing.isNilpotent_jacobson_bot`, quotient semisimple, semisimple iff radical `⊥`) | Covered; nilpotency of `k ⊗ rad(k₀[G])` follows from `rad(k₀[G])^n = 0` and flatness of `k` over `k₀`. |
| `k₀[G]/rad` is a product of matrix algebras over `k₀` (SemisimpleAlgebras Layer 2) | `SemisimpleAlgebras/README.md:212–232`, Artin–Wedderburn presentation with `D_i = End(S_i)ᵐᵒᵖ` | After the descent every `End(S_i) = k₀`, so each `D_i = k₀`. |
| Webb, Chapter 9, Exercise 4, p. 165 | `webb` lines 6974–6977 (printed p. 165 = PDF marker 172): `F` a splitting field for `A`, `E ⊇ F`, then `Rad(E ⊗_F A) ≅ E ⊗_F Rad(A)`; the bracketed remark at 6964–6965 notes `E ⊗ Rad(A) ⊆ Rad(E ⊗ A)` always, as a nilpotent ideal | Supports the base-change step exactly as the README argues it. |
| Webb, Chapter 9, Exercise 8(a), p. 166 | `webb` lines 7004–7008 (PDF 173): `F` a splitting field, `E ⊇ F`, every simple `E ⊗_F A`-module is written in `F`, same number of simples | Supports “`k` is a splitting field” and the line-436 bullet. |
| Webb, remark on p. 144 | `webb` lines 6057–6070 (PDF 151): `𝔽_p(ζ)` is a splitting field, and the smallest one for `G` and all its subgroups | Supports the choice of `k₀` and the subgroup clause. |
| Webb, Theorem 9.2.7, p. 144 (unchanged locator) | `webb` 6054–6056 | As in r5: ordinary form with `m` the exponent; the README's characteristic-`p` reading is explained in the text. |
| Exercise 1(b), p. 165 (not cited, read as the negative control) | `webb` 6958–6966: `A = 𝔽_p(t)` over `F = 𝔽_p(t^p)`, `E = 𝔽_p(t)`: `Rad(E ⊗_F A) ≠ E ⊗_F Rad(A)` | Shows the base change needs `k₀` splitting (or perfect), which the route has, since `k₀` is finite. |

**Recognition step (§2.1).** The Brauer character is taken for `k̄[G]`-modules (`README.md:367`), and §2.1's second bullet (`:388`) gives recognition for semisimple modules; a Galois conjugate of a simple module is simple, so recognition applies to it. The imported Brauer character is for a fixed `τ` on `μ_{e'}`, and `μ_{e'}(k̄) ⊆ k₀`, so a `k₀`-automorphism fixes the eigenvalues and the Brauer character: the Galois-stability step is right once the Galois group is that of `k̄₀/k₀` (R02).

**Sampled targets.** Of the fifteen seeded targets, only “2.3 Residue-field splitting” falls in the changed passage; it is checked in the table above. The other fourteen (§§0.1, 0.2, 1.1, 1.2, 2.2, 2.4, 4.3, 5.1, 5.2, 6.1, 7.1, 7.2, 7.3, 8.1, 8.4) are byte-identical to `5c1a0d2`, where the previous report opened each at its locator (its “Sources: the seeded sample” table and the paragraph after it, with `webb`, `martinez`, `sambale`, `craven`, `axiom-third` and `axiom-section` line numbers); the page offsets it recorded (`webb` printed = PDF − 7, `martinez` PDF − 8, `sambale` = PDF, `craven` PDF − 5) were used again here for Webb and agree.

**Ownership and consumers.** No new object is introduced by the diff (`k₀`, the radical base change and the Galois descent are proof-route steps inside §2.3, not targets with carriers), so the previous report's ownership search stands: `IsDefectGroup`, `brauerProjection`, `IsBlockIdempotent`, `brauer_first_main` declared only here; GlaubermanZStar the only consumer among open heads. Ownership against open pull requests whose files the brief does not supply was not re-searched.

**Adversarial computations.** The rows for the untouched statements are those of the previous report (r5, rows A01–A44), carried forward with their values; A16 is replaced by the rows for the changed route and the new Check. Notation as in r5: `r = (123)`, `t = (12)` in `S₃`; `e₀ = 1 + r + r²`, `e₂ = r + r²` in `𝔽₂[S₃]`; `α² + α + 1 = 0` in `𝔽₄`.

| Statement | Instances | Values on the two sides | Result | Change |
| --- | --- | --- | --- | --- |
| A01 §0.1 `pPart g = x` iff `g = x s`, `s` `p`-regular in `C_G(x)` (r5 A01) | `C₆`, `p = 2`, `x = g³`; `S₃`, `p = 2`, `x = t`; `p = 3`, `x = r` | `g³·{1, g², g⁴} = {g³, g⁵, g}` have `2`-part `g³`, no other element does; `C_{S₃}(t) = {1, t}`, regular part `{1}`, only `t`; `C_{S₃}(r) = C₃`, `3`-regular part `{1}`, only `r` | Pass | — |
| A02 §0.1 class bijection and count (r5 A02) | `C₂ × S₃`, `p = 2`; `S₃`, `p = 2`, `3` | `2 + 2 + 1 + 1 = 6 = k(C₂ × S₃)`; `2 + 1 = 3`; `2 + 1 = 3` | Pass | — |
| A03 §0.1 class-size formula (r5 A03) | `C₂ × S₃`, `g = (c, r)`; `S₃`, `g = t` | `2 = 1 · 2`; `3 = 3 · 1`; `C_G(g) = C_{C_G(x)}(s)` | Pass | — |
| A04 §0.2 `IsBlockIdempotent`, Checks (r5 A04) | `𝔽₂[C₂]`; `𝔽₃[C₂]`; `𝔽₂[S₃]`; `𝔽₃[S₃]` | `(1 + t)² = 0`; `e₊ = 2 + 2t`, `e₊² ≡ e₊`, `e₊ e₋ ≡ 0`, `e₊ + e₋ ≡ 1`; central idempotents of `𝔽₂[S₃]` exactly `{e₂, 1, e₀}`; of `𝔽₃[S₃]` only `1` | Pass | — |
| A05 §0.2 Example (r5 A05) | `𝔽₂[S₃]` | `e₀² = e₀`, `e₂² = e₂`, `e₀ e₂ = 0`, `e₀ + e₂ = 1` | Pass | — |
| A06 §0.2 scalar extension splits a block (r5 A06) | `𝔽₂[C₃] → 𝔽₄[C₃]` | `e₁ = 1 + α² r + α r²`, `e₂' = 1 + α r + α² r²`, orthogonal idempotents with `e₁ + e₂' = r + r²`, `e₀ + e₁ + e₂' = 1` | Pass | — |
| A07 `complete_blockIdempotents_unique` (r5 A07) | `𝔽₃[C₂]` swapped family; empty family | swap matches; empty sum `0 ≠ 1`; `f = ∑ f b_i`, each `∈ {0, f}` | Pass | — |
| A08 §1.1 system (r5 A08) | `e = 1`; `e = 3, p = 2`; `e = 3, p = 3`; `e = 12, p = 2` | `(ℚ_p, ℤ_p, 𝔽_p)`; unramified, residue `𝔽₄`; `(1 − ζ₃)² ∼ 3`, residue `𝔽₃`, `e' = 1`; `ζ₄ ↦ 1`, residue `𝔽₄` | Pass | — |
| A09 §1.2 lattice classes (r5 A09) | `G = 1`, `O` vs `mO`; `C₂`, `p = 2` | class `1` both; `{1 + t, 1 − t}` determinant `−2 ≠ 0` in `K`, reductions `k ⊕ k` vs regular, both of class `2[k]` | Pass | — |
| A10 §1.3 lifts (r5 A10) | `ℤ₂[C₃]`; `ℤ₂[C₂]`; `G = 1` | `(1 + r + r²)/3 ↦ e₀`, `(2 − r − r²)/3 ↦ r + r²`; `(1 ± t)/2 ∉ ℤ₂[C₂]`; lifts `0, 1` | Pass | — |
| A11 `existsUnique_blockIdempotent_map_residue` (r5 A11) | `G = 1`; `O = ℂ[[T]]`, `C₂` | `0, 1`; `(1 ± t)/2` lift both blocks; uniqueness from `x³ = x`, `x ∈ rad`, so `x = 0` | Pass; no `CharP` needed | — |
| A12 §2.1 conventions (r5 A12) | `C₃` over `𝔽₄`, `r ↦ α ↦ ζ₃`; trivial `𝔽₂[C₃]`-module `𝔽₂²` | values `(1, ζ₃, ζ₃²)`, dual `(1, ζ₃², ζ₃)`; trace `0`, Brauer value `2` | Pass | — |
| A13 §2.1 induced formula (r5 A13) | `Ind_1^{S₃}(1)`, `p = 2` | `(6, 0) = 2·(1, 1) + 2·(2, −1)` | Pass | — |
| A14 `card_simpleModules_eq_card_pRegularClasses` (r5 A14) | `S₃`, `p = 3`, `2`; `C_p`; `G = 1`; `C₃` over `𝔽₂` | `2/2`, `2/2`, `1/1`, `1/1`; `det [[1,1],[1,−1]] = −2`; `𝔽₂[C₃]`: `2` simples vs `3` classes, excluded by `IsAlgClosed` | Pass | — |
| A15 §2.3 statement, first three Checks (r5 A15) | `C₃`, `𝔽₂` vs `𝔽₄`; `C₅`, `𝔽₅`; `S₃`, `𝔽₂` | `End = 𝔽₄` for the `2`-dimensional simple of `𝔽₂[C₃]`, not split; `𝔽₄[C₃] = 𝔽₄³`; `𝔽₅[C₅]` local, one simple; `𝔽₂[S₃]` split with `e' = 3` | Pass (sufficiency only, as the Check says) | — |
| A16a §2.3 descent over `k₀` | `k = 𝔽₄(T)`, `G = C₃`, `p = 2`; `k = 𝔽₄`, `G = C₃` | `k₀ = 𝔽₂(ζ₃) = 𝔽₄`, `[k₀ : 𝔽₂] = 2` (minimal polynomial `X² + X + 1`); simples of `𝔽̄₂[C₃]`: `r ↦ 1, ζ₃, ζ₃²`, Brauer values in `ℤ[ζ₃]`, fixed by `Gal(𝔽̄₂/𝔽₄)` (which fixes `ζ₃`) but swapped by Frobenius of `Gal(𝔽̄₂/𝔽₂)` (`ζ₃ ↦ ζ₃²`), so the descent lands in `𝔽₄` and not in `𝔽₂`, matching `𝔽₂[C₃] = 𝔽₂ × 𝔽₄`; `End_{𝔽₄[C₃]}` of each simple is `𝔽₄`; for `k = 𝔽₄(T)`, `k̄/k₀` has transcendence degree `1` | Statement true; the Galois group named is the wrong one for infinite `k` | R02 |
| A16b §2.3 base change `k₀ → k` | `C₃`, `𝔽₄ → 𝔽₄(T)`; `C₂`, `𝔽₂ → 𝔽₂(T)`, `p = 2`; Webb Ex. 1(b) | `rad(𝔽₄[C₃]) = 0` (`3` invertible), `𝔽₄[C₃] = 𝔽₄³`, `𝔽₄(T) ⊗ 0 = 0 = rad(𝔽₄(T)[C₃])`, quotient `𝔽₄(T)³`; `rad(𝔽₂[C₂]) = (1 + t)`, square zero, `k ⊗ (1 + t) = (1 + t) k[C₂]` with quotient `k`, and `k[C₂] = k[x]/(x + 1)²` is local with that radical, equality holds; negative control `𝔽_p(t) ⊗_{𝔽_p(t^p)} 𝔽_p(t) = E[x]/(x − t)^p` has radical `(x − t) ≠ 0` while `Rad(A) = 0`, so the splitting (or perfectness) of the base field is needed and `k₀` finite supplies it | Pass | — |
| A16c §2.3 new Check | `C₃`, `p = 2`, `k = 𝔽₄(T)`; `𝔽₂(T)` | `x³ − 1 = (x − 1)(x − α)(x − α²)` over `𝔽₄ ⊆ k`, distinct roots, `k[C₃] = k³`; over `𝔽₂(T)` the algebraic closure of `𝔽₂` in `𝔽₂(T)` is `𝔽₂`, which has no root of `x² + x + 1`, so `𝔽₂(T)[C₃] = 𝔽₂(T) × 𝔽₂(T)[x]/(x² + x + 1)`, simple dimensions `1` and `2`; `Br(𝔽₄(T)) ≠ 0` (a global field of positive characteristic has nontrivial Brauer group) | Pass | — |
| A16d §2.3 subgroup clause | `H = C₂ ≤ S₃`, `p = 3`; `H = C₃ ≤ S₃`, `p = 2` | `e'(S₃) = 2`, `e'(C₂) = 2 ∣ 2`; `e'(S₃) = 3`, `e'(C₃) = 3 ∣ 3`; in general `exp(H) ∣ exp(G)` so `p'`-parts divide | Pass | — |
| A17 §2.4 surjectivity route (r5 A17) | `E = C₃ × C₂`, `p = 2`; general `q`-elementary `E` | `D_E` is `6 × 3` of image rank `3`; Sylow `p`-subgroup of `E` normal, projection formula | Pass | — |
| A18 §2.4 decomposition matrices (r5 A18) | `S₃`, `p = 3`, `2`; `C₂` | `[[1,0],[0,1],[1,1]]`; `[[1,0],[1,0],[0,1]]`; `[[1],[1]]` of rank `1 < 2` | Pass | — |
| A19 §3.1 reciprocity (r5 A19) | `S₃`, `p = 3`, `2`; `C_p` | `DᵀD = [[2,1],[1,2]]`, `det 3`; `diag(2,1)`, `det 2`; `[p]`; `Φ_1 = (3, 1, 0)`, `Φ_sgn = (3, −1, 0)` | Pass | — |
| A20 §3.1 pairing (r5 A20) | `S₃`, `p = 3` | `⟨Φ_1, φ_1⟩ = (3 + 3)/6 = 1`, `⟨Φ_1, φ_sgn⟩ = (3 − 3)/6 = 0` | Pass | — |
| A21 §3.1 orientation (r5 A21) | path algebra of `A₂` | native `[[1,0],[1,1]]` vs QuiverRepresentations `[[1,1],[0,1]]` | Pass | — |
| A22 §4.1 ordinary idempotents (r5 A22) | `C₂` over `ℚ₂`; `C₃`, `K ∋ ζ₃` | `(1 ± t)/2`, product `0`, sum `1`; `∑_j ⅓(1 + ζ₃^{−j} r + ζ₃^{−2j} r²) = 1` | Pass | — |
| A23 §4.2 central characters (r5 A23) | `S₃`, `p = 2`, `3` | `ω_χ(K_t) = 3, −3, 0`; mod `2`: `{1, sgn}`, `{std}`; mod `3`: one block | Pass | — |
| A24 §4.2 `d ≠ 0` within a block (r5 A24) | `S₃`, `p = 2` | `D` block-diagonal for `{1, sgn} ∪ {std}` | Pass | — |
| A25 §4.3 augmentation (r5 A25) | `𝔽₂[S₃]`; `G = 1` | `aug(e₀) = 3 ≡ 1`, `aug(e₂) = 2 ≡ 0`; `∑ aug(e_B) = 1` | Pass | — |
| A26 §5.1 generalized numbers (r5 A26) | `C₃`, `p = 3`; `S₃`, `p = 3`, `u = r`; `p = 2`, `u = t` | `ζ₃^j`; `(1, 1, −1)`; `(1, −1, 0)` | Pass | — |
| A27 §5.2 Gram matrices (r5 A27) | `C₂`, `p = 2`; `S₃`, `p = 3`, `2` | `Q*Q = diag(2,2)`, `det = −2`; `[[2,1,0],[1,2,0],[0,0,3]]`, `det = −3`; `diag(2,1,2)`, `det = 2` | Pass | — |
| A28 §5.2 conjugation and block sums (r5 A28) | `C₃`, `p = 3`; `S₃`, `p = 2` | `3 = c^r`, without conjugation `0`; block sums `2 + 4 = 6 = |C_G(1)|` | Pass | — |
| A29 §5.2 section orthogonality (r5 A29) | `S₃`, `p = 2`, `B₀`, `g = 1`, `h = t` | `1 − 1 = 0`; defect zero `2·0 = 0` | Pass | — |
| A30 `brauerProjection_mul` (r5 A30) | `S₃`, `p = 2`, `P = ⟨t⟩`; over `ℤ`; `P = C₃` | `Br(x²) = 0 = Br(x)²`; `Br(r r²) = 1 ≠ 0`; over `ℤ` coefficient `2`; `Br_{C₃}(t + (13) + (23)) = 0` | Pass; each hypothesis needed | — |
| A31 `IsDefectGroup`, `isDefectGroup_conj` (r5 A31) | `S₃`, `p = 2`, `e₀`, `e₂`; `C₃`; `e = 0` | `Br_{⟨t⟩}(e₀) = 1`, three conjugate `C₂`; `Br_{⟨t⟩}(e₂) = 0`, defect `1`; `C₃`: defect `1`; `e = 0` none | Pass | — |
| A32 `isDefectGroup_iff_sylow_of_augmentation_ne_zero` (r5 A32) | `S₃`, `p = 2`; `G = 1`; `C₃`; `𝔽₂[C₃]` | defect groups of `e₀` = Sylow; `1 = 1`; Sylow `1`; `aug(e₀) = 1`, defect `1` | Pass | — |
| A33 §6.3 criterion (r5 A33) | `S₃`, `p = 2`, `Q = ⟨t⟩`, `Q = 1`; `C_p` | `Br_Q(e₀)·1 = 1 ≠ 0`, `Br_Q(e₂)·1 = 0`; `e_B f = f` iff `f = e_B`; `(C_p, 1)` maximal | Pass | — |
| A34 §6.3 orbit lemma (r5 A34) | `C₃ ⋊ C₈`, `𝔽₄`, `Q' = ⟨s²⟩ ⊴ ⟨s⟩` | `z = e₁ + e₂`: no `Q`-stable block, `0` both ways; `z = e₀`: `1` both ways | Pass | — |
| A35 `brauer_first_main` (r5 A35) | `S₃`, `p = 2`, `D = ⟨t⟩`, `D = 1`; `p = 3`, `D = C₃` | `k[C₂]` one block of defect `D`, `Br_D(e₀)·1 ≠ 0`; `{e₂}` maps identically; single block both sides | Pass | — |
| A36 §7.1 `Br_P(e_B) = ∑_{b^G = B} e_b` (r5 A36) | `S₃`, `p = 2`, `P = H = ⟨t⟩` | `Br_P(e₀) = 1 = e_{B₀(C₂)}`, `Br_P(e₂) = 0` | Pass | — |
| A37 §7.2 second main (r5 A37) | `S₃`, `p = 2`, `3`; `C₂ × C₃` over `𝔽₄` | `d^t = (1, −1, 0)` nonzero exactly on `Irr(B₀)`; `d^r = (1, 1, −1)`; three blocks each inducing itself | Pass | — |
| A38 `brauer_third_main_local` (r5 A38) | `S₃`, `p = 2`, `P = H = ⟨t⟩`; `P = 1`; `p = 3` | `1·1 ≠ 0`, `aug = 1`; `e₀ e₀ ≠ 0 ↔ aug(e₀) = 1`, `e₀ e₂ = 0 ↔ aug(e₂) = 0`; converse via `|K ∩ C_G(P)| ≡ |K| (mod p)` | Pass, both directions | — |
| A39 §7.3 Example (r5 A39) | `A₄`, `p = 2`, `P = V₄` | `C_G(O_2) ⊆ O_2`, one `2`-block | Pass | — |
| A40 §8.1 domination (r5 A40) | `S₃`, `p = 3`, `N = C₃`; `C₆`; `C_p`; `N = 1` | `1 ↦ e₊ + e₋`, two blocks, `G/C_G(N) = C₂` not a `3`-group; `C₆` bijective; identity | Pass | — |
| A41 §8.2 `e_N` and covering (r5 A41) | `S₃`, `p = 2`, `N = C₃` | `e_N = 1 + r + r²`, `k[S₃] e_N ≅ 𝔽₂[C₂]`; `std|_{C₃}` orbit `{ζ₃, ζ₃²}`, block `e₂` | Pass | — |
| A42 §8.3 kernel theorem (r5 A42) | `S₃`, `p = 2`, `3`; `C_p` | `ker 1 ∩ ker sgn = C₃ = O_{2'}`; `1 = O_{3'}`; `Φ_1 = (2, 0, 2)` constant on `C₃`-cosets | Pass | — |
| A43 Conventions pairing and `p`-parts (r5 A43) | `S₃`; `C₆`, `p = 2` | `⟨1, sgn⟩ = 0`, `⟨1, 1⟩ = 1`; `g = g³ g⁴`, orders `2 · 3` | Pass | — |
| A44 Layer 8 Example (r5 A44) | `C_p`; `C₃` over `𝔽₄`; `S₃` | `D = [1; …; 1]`, `C = [p]`; `D = C = I₃`; as A18–A19 | Pass | — |

## Not verifiable

- **Navarro, Theorem 6.10 (`navarro`)** and **Serre (`serre`)**: settled as uncertified; cited by locator; untouched by the diff.
- **Pull-request comments**: `gh pr view --comments` returned one line (no comment text), so whether a repair report marked the family-index finding not actionable was checked only through the board's reports directory, which holds no repair report.
- **Open pull requests without supplied files** were not re-searched this round; the diff introduces no new object.

## Source issues

- **Misprint** in webb at Theorem 9.2.7 and the remark after it, printed p. 144: the source says a field containing a primitive `m`-th root of unity, `m` the exponent of `G`, is a splitting field, and that `𝔽_p(ζ)` with `ζ` a primitive `m`-th root is the smallest for all subgroups; in characteristic `p` dividing `m` no such root exists, and it should be the prime-to-`p` part of `m`; affects nothing.
