# Review of GlobalQuadraticForms (pull request #1200 at ac85fbd)

**Verdict:** accepted

Incremental re-review of the 57 lines changed since `bf7aba3`. No finding remains and the gate passes. Both findings of the previous report are repaired, and the repairs introduce no new problem.

## Previous findings

- R01 — repaired: `Suggested.lean:147–148` now reads `theorem injective_wittRing_baseChange_places : Function.Injective (TauCeti.WittRing.globalToLocal K)`; the import is `…Global.WittLocalization`; `README.md:116–118` and `:1092–1098` name `invertibleTwo` and the native map.
- R02 — repaired: the description's *Relation with #1215 and #617* now says "This branch is therefore rebased, before it merges, onto whichever of #1215 and #617 merges first", and that #617 carries #1215's copy unchanged.

## Verified sound

**The repair of R01, checked at the pins (Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`).**
- `TauCeti.WittRing.globalToLocal` (`NumberTheory/QuadraticForm/Global/WittLocalization.lean:167`) is a ring homomorphism `WittRing K →+* (∀ v, WittRing (v.adicCompletion K)) × ({w // w.IsReal} → WittRing ℝ)`, built as `(RingHom.pi fun _ => baseChange).prod (RingHom.pi atRealPlace)`. It takes no `Invertible` argument. The file's docstring (`:40–41`) says that it does not prove injectivity, so 8.3 is not a duplicate.
- The elaborated type of the headline is `∀ {K : Type u_1} [Field K] [NumberField K], Function.Injective ⇑(TauCeti.WittRing.globalToLocal K)`: no `Invertible` binder is left, and `K` is in any universe.
- Mathlib's `invertibleTwo` (`Algebra/CharP/Invertible.lean:125`) is declared under `[DivisionSemiring K] [CharZero K]`, as the new contract line `README.md:201–202` says. "Any other instance is equal to it" holds because `Invertible` is a subsingleton.
- Consumer test, in a scratch copy: from the headline, `injective_iff_map_eq_zero`, `ext` and `simp` with the two hypotheses "`baseChange x = 0` at every finite `v`" and "`atRealPlace w x = 0` at every real `w`" prove `x = 0`. It elaborates, so the headline now combines with Tau Ceti's `globalToLocal_apply_fst` and `globalToLocal_apply_snd` directly, which was the defect R01 named.
- One-tactic probe on the changed theorem: `first | rfl | infer_instance | (simp; done) | (simp_all; done) | exact?` fails (`exact?` could not close the goal). It is not padding.
- The README's 8.3 paragraph, its convention on the instance and the module docstring agree with the Lean statement. No "writes its components out" or "any instance serves" wording remains in either file.

**The repair of R02, checked at the heads.**
- #617's head `dec9d6b8` has #1215's head `6aa9b5bf` as an ancestor, and its two files in this folder are byte-identical to #1215's, as the description says.
- "8.3 already reads as in #1215's revision": the README's 8.3 section is identical to #1215's (a `diff` of the two sections is empty), the convention paragraph and the `invertibleTwo` contract line are the same text, and #1215's `Suggested.lean:136` has the same statement.
- The three differences the description says this branch re-applies are real: #1215 has `equivalent_of_locallyEquivalent` in prose only (its `README.md:1176`, `:1222`; no Lean declaration); this head has the section-map line for `TauCeti.hasFiniteMulSupport_hilbertSymbol_unitAtFinitePlace` that #1215 lacks; and the *Downstream consumers* sentence on Classical Arithmetic Completion names the complex place only here (`README.md:1174`).
- Remark: the generated `merge-order` block still lists only #1215 for this folder. The description's own text states the order with #617, which is what the overlap rule asks for.

**Gate, dependency check, scope.**
- Gate rerun on this head: every check 0 and `OK`; the worker's gate adds `build=0`.
- Dependency check output: `depcheck: 233 roadmaps, 2263 edges, 0 problem(s)`. No UPWARD, CYCLE or `moved:` line; no roadmap supplier; no `gap:` contract.
- `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty. The branch's `lake-manifest.json` and `lean-toolchain` are main's.
- `lake env lean` on `Suggested.lean` exits 0 with 8 `sorry` warnings (lines 52, 69, 77, 85, 94, 112, 121, 147) and nothing else. The file imports Mathlib and five Tau Ceti modules, all present at the pin.
- Signatures: the 9 elaborated types were compared with the README statements again. Only 8.3 changed; the other eight are as the previous report recorded, with every `FiniteDimensional` and `Nondegenerate` hypothesis present.
- Headlines: 4.2, 5.5, 6.1, 6.2, 6.3, 7.3, 8.1, 8.3 and 8.4 are all stated; none is forced through a stand-in.
- No other roadmap, on main or at an open head, cites the theorem name `injective_wittRing_baseChange_places` or the old component-wise form of 8.3 (`roadmaps grep`: the only hits are copies of this folder); the name and the section id 8.3 are kept.

**Sources.** The diff changes no locator. The seeded sample (4.1–4.3, 5.1, 5.5, 6.1–6.3, 7.2–7.4, 8.1–8.4) falls in changed text only at 8.3, whose locator (Milne, VIII, Theorem 6.3, p. 252; milne-cft line 11619) is unchanged and was read in the previous review. The other sampled locators stand as verified there.

**Adversarial table.** The first two rows are computed in this review for the changed statement. The remaining rows are carried from the previous report (at `bf7aba3`), whose statements the diff leaves untouched. "G/L" means global side/local side and "H/C" hypothesis/conclusion.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 8.3 [headline], new Lean form | ℚ: `[⟨1,1,−3⟩] − [⟨1,1,−1⟩]`; `[H]`; `[⟨1⟩]`. ℚ(i): `[⟨1⟩] − [⟨−1⟩]`; `[⟨1⟩]` | at ℚ₃ `⟨1,1,−3⟩` is anisotropic (`(−1,3)_3 = −1`) and `⟨1,1,−1⟩` isotropic, so image ≠ 0 and class ≠ 0; `[H]`: 0/0; `[⟨1⟩]`: odd dimension, ≠ 0 at every `v`; ℚ(i) has no real place, the second factor is a function on the empty type; `−1 = i²` so `⟨1⟩ ≅ ⟨−1⟩`, 0/0; `[⟨1⟩]` ≠ 0 on both sides | consistent with injectivity, also with no real place | none |
| 8.3, instance and usability | elaborated type; kernel form derived in scratch | no `Invertible` binder; `x = 0` from vanishing of `baseChange x` and `atRealPlace w x` elaborates via `injective_iff_map_eq_zero`, `ext`, `simp` | the native map, directly usable | none (R01 repaired) |
| Conventions: discriminants | `H = ⟨1,−1⟩`; `⟨1,1⟩` | plain `[−1]`, signed `(−1)^1·[−1] = [1]`; plain `[1]`, signed `[−1]` | as stated | none (carried) |
| Conventions: Hasse sign | `H` over ℝ | `i<j`: `(1,−1) = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | conventions differ, as stated | none (carried) |
| Conventions: real sign | `⟨−1,−1⟩`; `p⟨1⟩⊥q⟨−1⟩` | `(−1,−1)_ℝ = −1 = (−1)^(2·1/2)`; pairs of negatives `C(q,2)` | agree | none (carried) |
| Conventions: product formula | `(−1,3)` over ℚ | `(−1/3) = −1` at 3; `(−1)^(1·1) = −1` at 2; `+1` at ℝ | two places, product 1 | none (carried) |
| 4.1 finite places | ℚ(i), `σ` = conjugation, `𝔭 = (2+i)` | mod `𝔭̄`: `i ≡ 2`, `2+i ≡ 4 = 2²`, unit; `v_𝔭(2+i) = 1`; mod `𝔭`: `2−i ≡ 4` | square moves to `σ𝔭̄ = 𝔭` | none (carried) |
| 4.1 real places | ℚ(√5), `σθ = 1−θ`, `w': θ ↦ 1.618` | `σ` is an automorphism (`(1−θ)² = 2−θ = (1−θ)+1`); `w'.comap σ: θ ↦ −0.618`; `p(⟨1,1−θ,1−θ⟩, w') = 1 = p(⟨1,θ,θ⟩, w'.comap σ)`; fixed place gives 3 | correspondence needed | none (carried) |
| 4.2 [headline] | ℚ, `a = 4`, `S = ∅`; ℚ(i), `a = −1` | H true; C `2² = 4`. H true; C `i² = −1` | T/T | none (carried) |
| 4.2 [headline] | ℚ, `a = −1`; `a = 2`; `a = −3` | H fails at all `p ≡ 3 (4)`; at `p ≡ ±3 (8)`; at `p ≡ 2 (3)`, infinitely many each | F/F | none (carried) |
| 4.2, exponent 8 | ℚ, 16, `S = {2}` | `x⁸−16 = (x²−2)(x²+2)(x²+2x+2)(x²−2x+2)`; one of `2, −2, −1` is a square mod odd `p`; `16^(1/8) ∉ ℚ` | analogue false, matches Milne Ex. 1.3 | none (carried) |
| 4.3 | ℚ: `d = −1, a = 5`; `d = −1, a = 3`; `d = 5, a = −1`; `d = 3, a = −1` | `1+4` T/T; `(−1,3)_3 = −1` F/F; `4−5 = −1` T/T; `(3,−1)_3 = (−1/3) = −1` F/F | holds | none (carried) |
| 4.3 junk | `d = 0`, `d = 1` | `0 = 0²`, `1 = 1²`: excluded by `¬IsSquare d` | excluded | none (carried) |
| 5.1 binary | ℚ: `⟨1,1⟩`, `⟨1,−2⟩`, `⟨1,−4⟩`; ℚ(i): `⟨1,1⟩` | F/F (at 3); F/F (2 nonresidue mod 3); `2²−4 = 0` T/T; `d = [1] = [−1]` T/T | holds | none (carried) |
| 5.1 ternary | `⟨1,1,−2⟩`; `⟨1,1,−3⟩`; `⟨1,1,1⟩` | `d = −1, a = 2 = 1+1` T/T; anisotropic exactly at 2, 3 (`(−1,3)_v = −1`) F/F; `(−1,−1) = −1` exactly at 2, ℝ, F/F | holds; even number of places | none (carried) |
| 5.5 [headline] | rank 0; `⟨a⟩`; `H` | F/F; F/F; T/T | holds | none (carried) |
| 5.5 [headline] | ℚ, `⟨1,1,1,−7⟩` | G: 7 ≡ 7 (8) is not a sum of 3 squares, F; at 2, `−7 ≡ 1 (8)` is a square, form ≅ `⟨1,1,1,1⟩`, anisotropic over ℚ₂ | F/F | none (carried) |
| 5.5 [headline] | `⟨1,1,1,1,−1⟩`; `⟨1,1,1,1,1⟩` | `(1,0,0,0,1)` T/T; F/F (at ℝ) | holds | none (carried) |
| 5.5 regularity | `⟨1,0⟩` | radical vector `e₂` isotropic globally and after base change: T/T | `hQ` used by the route and 6.1 only | none (carried) |
| 6.1 [headline] | `⟨1,1,1⟩`, `a = 7`; `a = 3` | Milne 6.9(c) at 2: `a = −d`, `(−1,−1)_2 = −1 ≠ S = 1`, F/F; `1+1+1` T/T | holds | none (carried) |
| 6.1 [headline] | zero form, `a = 1`; `⟨1,1⟩`, `a = −1` | no vector, F/F; F at ℝ and 2, F/F | holds | none (carried) |
| 6.2 [headline] | `⟨7⟩ → ⟨1,1,1⟩`; `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨c⟩ → H` | F/F (at 2); inclusion T/T; `((1+c)/2,(1−c)/2) ↦ c` T/T | holds | none (carried) |
| 6.2 [headline] | zero `Q` into any `R`; rank `Q` > rank `R` | zero map injective, T/T; `finrank_le` gives F/F | holds | none (carried) |
| 6.3 [headline] | `⟨1,1⟩` vs `⟨2,2⟩`; vs `⟨21,21⟩` | `(x+y, x−y)`, T/T; `s_3(⟨21,21⟩) = (21,−1)_3 = (3,−1)_3 = −1 ≠ 1`, F/F | holds | none (carried) |
| 6.3 [headline] | `⟨1,1,1,1⟩` vs `⟨1,1,7,7⟩` | `d = [1]` both; `s = (7,−1)`: `(−1/7) = −1` at 7, `(−1)^(1·1) = −1` at 2 | F/F | none (carried) |
| 7.2 | ℚ, rank 3, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | product `(−1)·1 = −1` | H fails, consistent | none (carried) |
| 7.2 | local data of `⟨−1,−1,−1⟩` | `s_2 = (−1,−1)_2³ = −1`, real `(−1)^C(3,2) = −1`, product 1 | realized by the form | none (carried) |
| 7.3 [headline] | ℚ, rank 2, `d = [1]`, `p = 2`, `s_3 = s_7 = −1` | `−1` is a nonsquare in ℚ₃ and ℚ₇, so the rank-two clause is void; product `(−1)²·1 = 1`; `⟨21,21⟩`: `s_3 = −1`, `s_7 = (3,−1)_7(7,−1)_7 = 1·(−1) = −1`, `s_2 = 1` (21 ≡ 1 (4)) | admissible and realized | none (carried) |
| 7.3 (control) | same with `s_3 = s_5 = −1` | `−1` is a square in ℚ₅, so the rank-two clause forces `s_5 = 1` | not admissible | none (carried) |
| 7.3 junk | rank 0; rank 1 with `s = −1` at two places | `1 ≤ n` fails; `isAdmissible_rankOne_iff_eq_empty` | not admissible | none (carried) |
| 7.4 / 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | `d`: `[−1]`, `[−4] = [−1]`; `s`: `(1,1)(1,−1)(1,−1) = 1`, `(1,2)(1,−2)(2,−2) = 1`; `p = 2` both | equal records, isometric | none (carried) |
| 8.1 [headline] | rank 0 vs rank 0; zero form vs `⟨1⟩` | `(0,[1],1,0)` both, T/T; ranks differ, F/F | holds | none (carried) |
| 8.2 | `⟨1,−1,2,−2⟩`, `m = 2` | `d = [4] = 2•[−1]`; `s = (−1,2)(−1,−2) = (−1,−4) = (−1,−1)^C(2,2)`; `p = 2` | locally `2H`, globally `2H` | none (carried) |
| 8.4 [headline] | `⟨1,1⟩`, `⟨2,2⟩` | locally isometric, so isometric by 6.3 | holds | none (carried) |
| Worked ℚ(√5) record | `⟨1,θ,θ⟩`, `N(θ) = −1` | `d = [θ²] = [1]`; `s_{(2)} = (θ,−1) = (N θ, −1)_{ℚ₂} = (−1,−1)_2 = −1`; real `p = 3, 1`; real signs `1, −1`; product 1 | admissible, as stated | none (carried) |

## Not verifiable

- **O'Meara** (`omeara`) and **Serre** (`serre`) are settled in the manifest as uncertified and were not requested. Their locators are untouched by this change; 6.2 and 8.1 rest on O'Meara alone, as the previous report recorded.
- **Descriptions of #1215 and #617** are not readable with this job's tools. Their folders were read at their heads (`6aa9b5bf`, `dec9d6b8`).

## Source issues

- none
