# Review of GlobalQuadraticForms (pull request #1200 at f6c50f2)

**Verdict:** needs changes

AI-assisted incremental re-review of `TauCetiRoadmap/GlobalQuadraticForms/` at `f6c50f2a3c48793d849b45a27a53d2694ce6e29c`, covering the 51 lines of `README.md` changed since `7aaec79` (the head the previous review read) and everything that cites them. `Suggested.lean` is unchanged. Two findings: one blocking (P1), carried from the previous review, and one P3 in a changed passage. The three P3 findings of the previous review are repaired, and the repairs introduce no mathematical error.

## R01 (P1) — The branch still pins Tau Ceti `358314d`, where 16 cited declarations do not exist, and it does not merge cleanly with main

Re-raised: R01 of the previous two reviews. The round-2 repair report (GATE~2, "Which pin") answered "this job may not touch the manifest"; the repair at `f6c50f2` edits only the README.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:136–137`: "There is no roadmap supplier. Every input below is a declaration of Mathlib or Tau Ceti at the pins." The contracts at :147–308 and the *Needs:* lines of 4.2, 4.3, 7.2, 7.3, 8.2 and 8.3 rest on it.

**Claim.** Every cited input exists at the pins of this head.

**Witness.** At `f6c50f2`, `lake-manifest.json` pins Tau Ceti `358314d4` and Mathlib `f6090c70`, with `lean-toolchain` `v4.35.0-rc3`; main pins `2fd255d9`, `1b1ccf4b`, `v4.36.0-rc2`. Rechecked at `358314d` today, each with zero occurrences in `TauCeti/`: `hilbertSymbol_productFormula`, `finrank_le_index_range_ideleClassNormMap`, `globalToLocal_eq_zero_iff`, `exists_locallyRepresents_prod`, `isAdmissible_ofLocalForms`, `exists_sq_sub_mul_sq_iff_forall_completion`, `exists_hilbertSymbol_eq_ite`, `locally_formClass_eq_nsmul_hyperbolicClass_iff`, `exists_discr_eq_equivalent_of_isRepresentedBy_prod`. Each is present at `2fd255d` (file and line in the previous report). Main's pin-bump commit `a891cd1` is not an ancestor of this head, and a test merge of `origin/main` still conflicts in this folder's `Suggested.lean`, at the start of the Layers 7–8 block. The description's "incorporates current main" refers to the merge at `1bc4ccc4`, which predates the bump.

The names exist at main's pin and the citation resolver finds them there, so nothing in the README is wrong against main; the defect is the state of the branch. The merge conflict alone keeps the pull request from merging.

**Repair.** Unchanged from the previous review.
1. Merge `origin/main` into the branch.
2. Resolve the single conflict in `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean` by keeping this branch's file.
3. Rerun the gate, with its targeted build, at Tau Ceti `2fd255d`, Mathlib `1b1ccf4` and `lean4:v4.36.0-rc2`.

Tested: the five imported Tau Ceti modules exist at both pins and differ only by added theorems (previous report), and every carrier used by the nine statements is unchanged, so the file is expected to elaborate at main's pins as it does here.

## R02 (P3) — Two Tau Ceti declarations the new 4.1 text consumes are not in the supplier contracts

**Location.** `README.md:380`, the 4.1 *Needs:* line: "`TauCeti.RegularFormClass.discr`, `TauCeti.RegularFormClass.localHasse`"; the contracts bullet "Local form theory" at :261–271.

**Claim.** The supplier contracts list every consumed declaration by name.

**Witness.** Between :130 and :310 the string `RegularFormClass.discr` occurs 0 times and `RegularFormClass.localHasse` 0 times; the bullet at :262 names the file `RegularFormClass/Discriminant.lean` and the theorem `eq_iff_rank_eq_and_discr_eq_and_localHasse_eq` only. Every other Tau Ceti name on the 4.1 *Needs:* line (`QuadraticForm.atFinitePlace`, `unitAtFinitePlace`, `TauCeti.hilbertSymbol`, `QuadraticForm.globalInvariants`, `IsLocalRealization`) is in the contracts. Both declarations exist at both pins: `LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:122` and `NumberTheory/LocalField/QuadraticForm/Hasse.lean:93` (`:91` at `358314d`).

**Repair.** Add `TauCeti.RegularFormClass.discr` and `TauCeti.RegularFormClass.localHasse` to the "Local form theory" bullet, and `NumberTheory/LocalField/QuadraticForm/Hasse.lean` to its file list, with one clause each: the square class of the weight product of a diagonalization; the product over `i < j` of the Hilbert symbols of the weights. Test: after the edit, the string count above is 1 each and the 4.1 *Needs:* line cites nothing the contracts omit.

## Previous findings

- R01 — not repaired: `lake-manifest.json` still pins Tau Ceti `358314d` and Mathlib `f6090c7`; the 16 names are still absent there; the test merge of `origin/main` still conflicts in `Suggested.lean`. Re-raised as R01.
- R02 — repaired: :353–365 transport a local form `U_v` to `τ_v U_v = x ↦ τ_v(U_v(τ_v⁻¹ ∘ x))` over `K'_(σ v)`, with regularity, discriminant and local Hasse invariant carried, `R_w` kept, hence a realization of `I` carried to the reindexed record; the 7.2 *Needs:* line (:705–707) says how the hypothesis reaches `Type`.
- R03 — repaired: :431–435 drop `I_K^S` and say in words "an idele whose components at the places of `S` are `1`"; the `√2` idele witness and "α = 1 already achieves this" are both correct.
- R04 — repaired: :696–703 restrict "at most two classes, separated by the Hasse sign" to finite places with Milne VIII 6.10 and 6.11, p. 255, and give the rank-four real counterexample with Milne p. 256.

## Verified sound

**Gate and dependencies.**
- My rerun of the gate command at this head with the targeted build printed `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK` (every check 0).
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- The dependency check printed exactly `depcheck: 238 roadmaps, 2349 edges, 0 problem(s)`, no UPWARD, CYCLE or moved line.
- No roadmap supplier, no `gap:` contract; the overlap file's one lead (Layer 3 dropped, cited by MetaplecticAutomorphicForms) is answered by the section map at :63, unchanged since the previous review.

**Lean, at the branch pins.**
- `lake env lean` on `TauCetiRoadmap/GlobalQuadraticForms/Suggested.lean`: exit 0, exactly 8 `sorry` warnings at lines 51, 68, 76, 84, 93, 111, 120 and 145.
- `#check @name` for all 9 declarations in one scratch file: each elaborated type agrees with its README statement and with the previous report (`K : Type u_1`, `V`, `W` in their own universes, `Nondegenerate` on both forms, `a ≠ 0` in 6.1, `[Invertible (2 : K)]` in 8.3). Nothing changed.
- The Lean file is byte-identical to the head the previous review read, so its one-tactic padding probe (all 8 sorried theorems fail `rfl`, `simp`, `infer_instance`, `aesop`, `exact?`) stands.

**Library declarations opened for the changed passages** (`TauCeti/`, line at `2fd255d`; also checked at `358314d`).
- `NumberTheory/QuadraticForm/Global/LocalRealization.lean:108` (`:91`): `IsLocalRealization` takes `U v : QuadraticForm (v.adicCompletion K) (Fin I.rank → v.adicCompletion K)` and `R w` on `Fin I.rank → ℝ`; fields: regular, `RegularFormClass.discr … = I.discrAtFinitePlace v`, `localHasse … = I.finiteHasse v`, regular at real places, `sigPos (R w) = I.realPositiveIndex w`. The README's "`U_v` on `Fin n → K_v`" and the three transported quantities match these fields exactly.
- `Global/Invariants.lean:108–114`: `discrAtFinitePlace v` is the square class of the image of `I.discr` in `K_v`; so "the discriminants match because `τ_v` agrees with `σ` on `K`" is the right reason.
- `RingTheory/DedekindDomain/AdicValuation/Transport.lean:140` (`adicCompletionCongr : v.adicCompletion K ≃+* w.adicCompletion K'`) and `:160` (`adicCompletionCongr_algebraMap`: it extends `σ`).
- `LinearAlgebra/QuadraticForm/RegularFormClass/Discriminant.lean:122`: `discr` is the square class of the product of the weights.
- `NumberTheory/LocalField/QuadraticForm/Hasse.lean:93`: `localHasse` is `∏_{i<j} (aᵢ, aⱼ)`; a field isomorphism preserves solvability of `b = x² − a y²`, so it preserves each symbol.

**Sources checked at their locators (milne-cft, certified).** The two locators the diff adds:
- Proposition 6.11, p. 255 (lines 11758–11778): rank 1 forces `S = (−1, d)`; rank 2 with `d = −1` forces `S = (−1, −1)`; every other triple occurs. With Theorem 6.10 (line 11745) this gives the README's "at most two classes, one in those two cases"; in the `i < j` convention both forced values become `1`, as the README's Conventions say.
- The remarks before Theorem 6.12, p. 256 (lines 11781–11785): over ℝ, `d` and `S` determine the negative index for rank ≤ 3 and not for rank > 3. Matches :700–703.

**Adversarial table.** Rows for untouched statements are carried from the previous report (marked "r4"); rows with computed values are added for every changed statement.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 4.1 local-form transport: it is a form | `τ U (c·x)` | `τ(U(τ⁻¹c · τ⁻¹∘x)) = τ(τ⁻¹(c)² U(τ⁻¹∘x)) = c² · τU(x)` | quadratic over `K'_(σ v)` | none |
| 4.1 local-form transport: invariants | diagonal `⟨a₁,…,aₙ⟩` | `τU ≅ ⟨τa₁,…,τaₙ⟩`; discr `τ(∏aᵢ)` = image of discr; `(τaᵢ,τaⱼ)_{K'} = (aᵢ,aⱼ)_K` since `b = x²−ay²` solvable iff `τb = x²−τa·y²` solvable | both fields of `IsLocalRealization` carried | none |
| 4.1 realization reindexed | record `I`, places `v ↦ σv`, `w' ↦ w'.comap σ` | `discr(τU_v) = τ(ι_v d) = ι_{σv}(σ d)` by `adicCompletionCongr_algebraMap`; `hasse'(σv) = hasse(v)`; `p'(w') = p(w'.comap σ)` | realizes the reindexed record | none |
| 4.1 new Check (local isotropy follows σ) | `K = ℚ(i)`, `𝔭 = (2+i)`, `𝔭̄ = (2−i)`, `σ` = conjugation | mod `𝔭̄`: `i ≡ 2`, `2+i ≡ 4 = 2²` → `⟨1,−(2+i)⟩` isotropic over `K_𝔭̄`; `τ(−(2+i)) = −(2−i)`; mod `𝔭`: `i ≡ −2`, `2−i ≡ 4 = 2²` → isotropic over `K_𝔭`; `v_𝔭̄(2−i) = 1` → `⟨1,−(2−i)⟩` anisotropic over `K_𝔭̄` | Check correct; a place-fixing transport refuted | none |
| 4.1 places follow σ, real places, model in `Type` | r4 rows | as in r4 | correct | none |
| 4.2 warning, rewritten | ℚ, `S = {∞}`, idele `i_∞ = √2`, `i_p = 1` | `i = α·j` with `j_∞ = 1` forces `α = √2 ∉ ℚ`; `i_∞/1 = √2 > 0` is a real square | both sentences true; no undefined notation | none |
| 4.2 global square [headline], steps 3 and 5 | r4 rows | as in r4 | correct | none |
| 4.3, 5.1, 5.5, 6.1, 6.2, 6.3 [sample/headlines] | r4 rows | as in r4 | correct | none |
| 7.2 finite-place class count | rank 1; rank 2, `d = [−1]`; rank 2, `d = [1]` over ℚ₃ | rank 1: `s = 1` (empty product), one class per `d`; `⟨a,−a⟩`: `(a,−a) = 1`, one class; `⟨1,1⟩` vs `⟨3,3⟩` over ℚ₃: `(1,1)₃ = 1`, `(3,3)₃ = (3,−1)₃ = −1`, two classes | matches Milne 6.10 + 6.11 | none |
| 7.2 real-place remark | ℝ, rank 4, `d = [1]`; rank 3 | `q = 0, 2, 4`: Hasse `(−1)^0 = 1`, `(−1)^1 = −1`, `(−1)^6 = 1`; `d = (−1)^q = 1` all three. Rank 3: `(d, s)` for `q = 0..3` are `(1,1), (−1,−1), (1,−1), (−1,1)`, all distinct | three classes, two with sign 1; rank 3 determined | none |
| 7.2 route in `Type u` | model `K₀ : Type`, `σ : K ≃+* K₀` | `(U,R) ↦ (τU, R)` realizes `σI`; `exists_locallyRepresents_prod` over `K₀`; 6.2 over `K₀`; `V₀ ↦ σ⁻¹V₀` has record `I`; `equivalent_atFinitePlace` | every input in 4.1(2) or pinned | none |
| 7.2 existence, correction plane, vs Milne 6.12; 7.3, 7.4, 8.1–8.4 | r4 rows | as in r4 | correct | none |
| Supplier pin | 9 of the 16 names regrepped at `358314d` vs `2fd255d` | 0 hits each vs 1–3 hits each | absent at the branch pin | R01 |
| Contracts vs 4.1 *Needs:* | 6 Tau Ceti names of the line | occurrences in :130–310: 1, 2, 4, 0, 0, 3 | two names unlisted | R02 |

## Not verifiable

- **O'Meara, *Introduction to Quadratic Forms*** (`uncertified`, paywalled): the locator 72:1 in the changed 7.2 passage is cited by number only; the mathematics was checked directly and against Milne VIII 6.10–6.12.
- **Serre, *A Course in Arithmetic*** (`uncertified`): not touched by the change.
- **Elaboration at main's pins** (`2fd255d`, `1b1ccf4`, `v4.36.0-rc2`) was not run: this review may run Lean only in this worktree, at its own pins. The shared lake directory for main's manifest has no object file for `TauCeti.NumberTheory.QuadraticForm.Global.Predicates`, which is why the worker's signature extraction failed there.

## Source issues

- none new. The four Milne VIII issues of the previous report (misprints at lines 10777, 10788 and 11626–11627; the `c ≠ 0` gap at 10794–10804) still stand and are not repeated here.
