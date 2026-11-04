# Review of CanonicalModelsAndGonality (pull request #1726 at e7bed94)
**Verdict:** accepted

Incremental re-review of the 56 lines changed since 51f3f4d (the previous review's head). The three previous findings are repaired; the repairs introduce one non-blocking precision note. The gate passes and the dependency check shows no UPWARD or CYCLE line.

## R01 (P3) — GroebnerGeometry G4's large-degree section comparison is stated for `S/I`, not for every finite graded module

**Location:** `TauCetiRoadmap/CanonicalModelsAndGonality/README.md:694`: “Hilbert-polynomial existence for finite graded modules and the equality with the Euler characteristic of the associated sheaf use GroebnerGeometry G4's eventual polynomial and graded sheafification/global-section comparison”; also the Scope bullet at line 134 and the supplier bullet at line 346.

**Claim:** G4 supplies, for finite graded modules in general, the comparison of graded pieces with global sections of the sheafification in large degree, from which the Euler-characteristic equality follows.

**Witness:** `TauCetiRoadmap/GroebnerGeometry/README.md:370` (on main) states the eventual polynomial for every finitely generated graded module, but states the large-degree comparison only for `(S/I)_m` against `Γ(X, O_X(m))`; exactness of sheafification is at the same place.

**Repair:** none needed for the mathematics, since the three modules in play are covered: the coordinate ring is `S/I`; the normalization's pieces are `L(mD)` by the §2.3 target `R̃_m = L(mD)`; the quotient's pieces follow by exactness and additivity (for the cuspidal cubic `3m + 1 − 3m = 1`, the constant eventual value). Wording only: at line 694 say that G4's comparison is applied to the coordinate ring `S/I`, and that the normalization and its quotient are handled by `R̃_m = L(mD)` and exactness of sheafification; make the Scope and supplier bullets say the same. The author may take or leave this.

## Previous findings

- R01 — repaired: lines 134–137, 346–354, 694–696, 721, 810–811, 833 and 841 now import GroebnerGeometry G4 (eventual Hilbert polynomials, graded sheafification and its large-degree comparison) and keep SchemeAndStackFoundations §2.6 for Serre vanishing and §3.3 for singular-curve Riemann–Roch. Resolved on main: G4 at `GroebnerGeometry/README.md:252–392` (eventual polynomial for finitely generated graded modules at :370, sheafification API with exactness and the `(S/I)_m` comparison at :370–372); §2.6 at `SchemeAndStackFoundations/README.md:3437` (`ample_serre_vanishing`); §3.3 at :4713 (`vectorBundle_riemann_roch` on proper curves with `H⁰ = k`, singular allowed). GroebnerGeometry is on main, so no upward edge; the dependency check went from 1641 to 1646 edges with 0 problems. The precision note above is the only residue.
- R02 — repaired: line 1858: “For `hF`, `hex`, `[PerfectField k]` and `IsBasePointFree D`, choose a basis of `L(D)` and construct its complete-linear-system morphism `φ_D : X_F → ℙ^{ℓ(D)−1}_k`”, then “Prove `IsVeryAmple D ↔ φ_D is a closed immersion`”. The `K+P` witness is now a negative Check in 2.1 (line 657), 2.4 (line 742) and 9.1 (line 1880), and `D = 0` on `ℙ¹` is a Check at line 1881. The 2.1 Check correctly records that the basis model of `L(K+P) = L(K)` has model divisor `K` (the fixed divisor `P` is removed), consistent with the 2.1 API bullet “a basis construction has divisor equal to the original divisor minus its base divisor”.
- R03 — repaired: `gonality_eq_two_of_genus_eq_two` is deleted from `Suggested.lean` (49 admitted declarations, 66 declarations in all, down from 50 and 67); line 419–420 of the README lists only the three remaining 1.3 statements, and the genus-two fact stays as 1.3(d) prose and the Layer 1 Check.

## Verified sound

**Scope of this pass.** Only the changed passages and what cites them: the Scope bullet (lines 134–137), the supplier bullets (346–354), 1.3's statement list (419–420), the Layer 2 header (624), 2.1's new Check (657), 2.3 (676–721), 2.4's new Check (742), 2.7 (798–833), Layer 2 Dependencies (841), 9.1 (1856–1884), the Fulton reference (2050–2053), and the Lean deletion. The diff outside the folder is empty. The worktree at e7bed94 is clean and I changed nothing in it.

**Gate.** The worker's gate at this head passes every check (`build=0 depcheck=0 stray-files=0 outside-folder=0 … OK`). My own dependency check:

    depcheck: 204 roadmaps, 1646 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Every supplier named in the changed lines (GroebnerGeometry, SchemeAndStackFoundations, AlgebraicCurves) is on main.

**Elaboration.** `lake env lean` on `TauCetiRoadmap/CanonicalModelsAndGonality/Suggested.lean`: exit 0, exactly 49 `declaration uses sorry` warnings and no other output. The file keeps `import Mathlib` plus eleven `TauCeti.*` modules, no `set_option`, no `lemma`, no sorried data. The worker's elaborated signatures (66 declarations, none missing a section binder) agree with the previous review's 67 minus the deleted theorem; the deletion touches no other declaration, so the one-tactic padding probe of the previous review (none of the admitted theorems closes by `rfl`, `simp` or `infer_instance`) carries forward unchanged. The 9.1 hypothesis `IsBasePointFree D` is the file's own definition at `Suggested.lean:269` (removing any place of `F` over `k` lowers `ℓ`); `IsVeryAmple` at :276 tests every effective divisor of degree at most two after every finite constant extension with exact constants.

**Sources checked in the changed passages.**

| Target | Text and locator | Outcome |
|---|---|---|
| 9.1 construction of `φ_D`; Layer 2 header; References | Fulton, *Algebraic Curves*, 2008 edition (cache `937a5c2a`, header dated January 28, 2008), Exercise 8.33, lines 4242–4259; page marker 118 carries printed page 110 | (b) assumes no point `P` with `div(f) + D ≥ P` for all nonzero `f ∈ V` and builds the morphism `P ↦ H_P` to the hyperplane space of `V`; (c) identifies the pullback of a hyperplane with `div(f) + D`. This is exactly what lines 1859–1862 cite it for, with the base-point hypothesis now in the README. Fulton's ground field is algebraically closed; the README's construction over perfect `k` goes through §2.7's Proj route and uses Fulton for the geometric content, which is the right division. The old header locator “§8.6” was not wrong (Exercise 8.33 is in §8.6's problem list) and the new one is finer. |
| 2.3, 2.7 Hilbert polynomial and Euler characteristic | GroebnerGeometry G4 (main :370–372), SchemeAndStackFoundations §2.6 (main :3437–3450) and §3.3 (main :4713–4740) | G4: eventual polynomial for finitely generated graded modules over a standard polynomial ring, exactness of sheafification, `(S/I)~ = i_* O_X`, `(S/I)_m ≅ Γ(X, O_X(m))` for large `m`. §2.6: `ample_serre_vanishing`. §3.3: `vectorBundle_riemann_roch`, `χ(E) = deg E + r(1 − g)` for a proper curve with `H⁰ = k`, singular allowed, and `vectorBundleDegree_pullback`. The cuspidal cubic route computes: ring `3m`, normalization `3m + 1`, quotient `1`, so `p_a = 1`, `g = 0`, `δ = 1`. Hartshorne III.5.2 and IV.1.3 remain uncertified (below). |
| 2.4 (sampled) | Fulton Exercise 8.33(b), (e), lines 4249–4259, as above; Hartshorne IV.3.1 uncertified | Unchanged target; the new Check is computed in the table below. |
| 2.2 (sampled) | Unchanged by the diff | Carried from the previous review. |

The other sampled targets (1.8, 1.10, 2.5, 3.8, 4.1, 4.4, 5.2, 6.1, 6.3, 7.5, 8.3, 8.6) are untouched by the diff; their source checks are those of the previous review and are carried forward.

**Adversarial table.** Rows for the changed statements carry computed values; rows for untouched statements are carried from the previous review's table (124 rows at 51f3f4d), cited by section.

| Statement | Instances tried | Computed values on the two sides | Result and change |
|---|---|---|---|
| 1.3(d) genus two, after deletion of the Lean theorem | `y² = x⁶ + 1` | Upper bound `2g − 2 = 2`; gonality 1 would force `g = 0 ≠ 2`; gonality `= 2` | True; stays as README prose and Check; no Lean statement, as the padding rule asks. |
| 2.1 new Check: basis model of `L(K+P)` on a smooth plane quartic | `g = 3`, `deg K = 4`, `P` a point | Riemann–Roch: `ℓ(K+P) = 5 + 1 − 3 + ℓ(−P) = 3 = ℓ(K)`; `|K|` is base-point-free since `ℓ(K − Q) = g − 1 = 2 < 3`; so the fixed divisor of `|K+P|` is exactly `P` and the model divisor is `K`, degree 4; ratios of a basis of `L(K)` generate `F` (nonhyperelliptic), so the tuple is a `Model` | Consistent with the 2.1 API bullet “divisor minus its base divisor”. Keep. |
| 2.3 existence of `p_a`, repointed supplier | Line, smooth cubic, cuspidal cubic | Eventual functions `m + 1`, `3m`, `3m`; normalized cusp `3m + 1`; `(p_a, g, δ) = (0,0,0), (1,1,0), (1,0,1)` | G4 supplies the eventual polynomial of the quotient module (constant `1` for the cusp) and exactness; R01 (P3) is wording only. |
| 2.4 new Check: `D = K + P` on a smooth plane quartic | `P` a point | `ℓ(D) = 3`, `ℓ(D − P) = ℓ(K) = 3`, not `< 3`: base-point-freeness fails; very ampleness needs `ℓ(D − P − Q) = 1` for all `Q`, but `ℓ(K − Q) = 2`: fails | Negative control recorded; the `IsVeryAmple` definition rejects it, as the Check says. Keep. |
| 2.4 very ample ⇒ base-point-free (consistency with 9.1's hypothesis) | Any `D` with `ℓ(D) ≥ 2`; `ℓ(D) ≤ 1` | `ℓ(D) − 1 ≤ ℓ(D − P) ≤ ℓ(D)`; if `ℓ(D − P) = ℓ(D)` then `ℓ(D − P − Q) ≥ ℓ(D) − 1 > ℓ(D) − 2`, contradicting very ampleness; for `ℓ(D) ≤ 1` very ampleness demands a negative dimension | So `IsBasePointFree D` in 9.1 restricts nothing on the very-ample side; it is needed only to define `φ_D`. Keep. |
| 2.7 Hilbert polynomial equals `χ(O_{C′}(m))` | Cuspidal cubic image; smooth cubic | Cusp: `h⁰(O_{C′}(m)) = 3m` for `m ≥ 1`, `h¹(O_{C′}) = 1`, `χ(O_{C′}(m)) = 3m + 0 = 3m`, so `p_a = 1`; smooth cubic: `3m`, `h¹ = 1`, `p_a = 1`; normalizations have `h¹ = 0` and `1` | Values unchanged from the previous review; supplier now G4 + §2.6 + §3.3. Keep. |
| 9.1 `φ_D` well defined under base-point-freeness | `D = 0` on `ℙ¹`; `D = ∞` on `ℙ¹` | `ℓ(0) = 1 > ℓ(−P) = 0`, so base-point-free, target `ℙ⁰`, no natural-number junk in `ℓ(D) − 1 = 0`; `ℓ(∞) = 2`, target `ℙ¹`, `φ_D = id` | Keep; base-point-freeness forces `ℓ(D) ≥ 1`. |
| 9.1 `IsVeryAmple D ↔ φ_D` closed immersion | `D = 0` on `ℙ¹`; elliptic `2O`; elliptic `3O`; genus-two `K`; plane-quartic `K` | `0`: both sides false (constant map to a point is not a closed immersion of a curve; `ℓ(−E) = −1` impossible). `2O`: base-point-free, degree-two map, not an immersion; `ℓ(2O − E) = 1 ≠ 0` for a fibre `E`: both false. `3O`: cubic embedding; `ℓ(3O − E) = 1 = 3 − 2`: both true. Genus-two `K`: degree-two map; hyperelliptic fibre leaves `ℓ = 1 ≠ 0`: both false. Quartic `K`: canonical embedding; `ℓ(K − P − Q) = 1 = 3 − 2`: both true | Both directions hold on every instance; `K + P` is excluded by the hypothesis, as the Check says. Keep. |
| 9.1 Noether in scheme form and `2g + 1` | `g = 3` quartic; `g = 2`; elliptic `3O` | Canonical morphism closed immersion iff not geometrically hyperelliptic: true/true, false/false; `deg 3O = 3 = 2g + 1` embeds | Unchanged consequences; the repaired criterion still yields them because `K` (for `g ≥ 1`) and degree `≥ 2g` divisors are base-point-free (3.2, 2.5). Keep. |
| 9.1 descent of closed immersions along `k̄ / k` | Perfect `k`, `L(D) ⊗ k̄ = L(D_{k̄})` | `φ_{D_{k̄}}` is the base change of `φ_D` since constant extension preserves `ℓ` (finite separable steps); closed immersion is fpqc-local on the target | Route inputs are SchemeAndStackFoundations §0.11 and AlgebraicCurves Layer 8, both on main. Keep. |
| Layer 2 header and References, Fulton locator | Cached 2008 text | Exercise 8.33 on printed p. 110 (page marker 118) | Correct. |
| 1.1–1.10, 2.5–2.6, Layers 3–8, 9.2–9.4, worked examples | Untouched by the diff | As in the previous review's table (rows 1.1 … Worked Klein/Jacobian diagnostic), with their values | Carried forward from the review at 51f3f4d. |

**Duplication and ownership.** The new citations import rather than restate: generic graded-module Hilbert theory stays owned by GroebnerGeometry G4; Serre vanishing by SchemeAndStackFoundations §2.6; singular-curve Riemann–Roch by §3.3. The complete-linear-system morphism `φ_D` is built here from §2.7's Proj route, which this roadmap owns on the function-field carrier (no owner on main, in the board packages or in the listed open heads was found by the previous review's object search; the diff adds no new object). Ownership against open pull requests whose files this brief does not give was not checked.

**Shape.** The changed subsections keep their prose form, API bullets, Checks (2.1 now ten, 2.4 seven, 9.1 five), `*Needs:*` lines and the layer's Examples and Dependencies. No process words, pull-request numbers or local paths appear in the changed lines. Every backticked name of the roadmap's own in the changed passages (`IsBasePointFree`, `IsVeryAmple`, `Model.exists_arithmeticGenus`, `Model.genus_le_arithmeticGenus`, the three 1.3 names) is declared in `Suggested.lean`; the worker's citation leads are LMFDB knowl identifiers and this roadmap's own declared names, not missing citations.

## Not verifiable

- **Hartshorne IV.3.1, II.7, III.5.2, IV.1.3** (cited in 2.4, 2.7 and 9.1): paywalled; not read. The 9.1 criterion is independently supported by Fulton Exercise 8.33(b)–(c) and the computed instances above, and the 2.7 comparison by GroebnerGeometry G4 and SchemeAndStackFoundations §§2.6 and 3.3 on main.
- Everything the previous review listed as not verifiable for the untouched passages (Stichtenoth, ACGH, Kleiman–Laksov, Mattuck, Kempf, four LMFDB pages, the Klein-quartic isogeny claim, journal pagination of Abramovich and Poonen) is unchanged by this diff and still stands.

## Source issues

- none (the only source newly read for this pass is Fulton Exercise 8.33, lines 4242–4259, which is correct as stated; the issues recorded by the previous review in saint-donat, belov, voight-zureick-brown and two LMFDB knowls are already in the register).
