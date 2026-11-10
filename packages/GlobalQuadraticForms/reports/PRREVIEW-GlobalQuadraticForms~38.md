# Review of GlobalQuadraticForms (pull request #1200 at 8fe49f4)

**Verdict:** needs changes

A full review of a head the previous review already read (the folder is unchanged since `8fe49f4`). There are three findings, all P3. Two of them concern this branch's relation to main and to #1215: R01 was the previous R02, R02 was the previous R01. R03 is new: a value of the archimedean symbol that a consumer on main imports from Layer 4 is not resolved by the section map. No finding concerns the truth of a statement. The mathematics, the nine Lean signatures and the sampled Milne locators all check out.

## R01 (P3) — The stated order puts #1215 first, but this head is not rebased onto #1215 and restates #1215's rewrite of this folder differently; the description describes another head

**Location.** The pull-request description, prose part: "Correct the rank-four plain/signed discriminant comparison in both §5.1 and the associated quaternary-descent prototype docstring … The update incorporates current main and retains its `Completed.NumberFieldArithmetic.Suggested` import." Also the generated `merge-order` block: "`GlobalQuadraticForms`: #1215 → **this pull request**", which says that each pull request "re-applies only its own changes".

**Claim.** The description says what this head changes, and the head follows the stated order.

**Witness.** `git merge-tree --write-tree 8fe49f4 693a416` reports content conflicts in this folder's `README.md` and `Suggested.lean`. #1215's copy omits `equivalent_of_locallyEquivalent`, which Integral Lattices on main cites (`README.md:477`, `:916`), and states 8.3 through `globalToLocal`.

What the head shows instead of the description:
- 5.1 (`README.md:635–707`) contains no rank-four discriminant comparison.
- `Suggested.lean:3–8` imports Mathlib and five Tau Ceti modules, and no roadmap module.
- The merge base is `fa41b37`, not main (`f8836c4`).
- The two copies of the README differ on 240 lines.

**Repair.**
- Follow the stated order. Rebase this branch onto #1215's head and keep #1215's text of both files. Then re-apply only what this pull request adds. At this head that is the declaration `equivalent_of_locallyEquivalent` (`Suggested.lean:128–139`) with the 8.4 text that names it, unless #1215 restores it. That declaration is what keeps Integral Lattices' backticked citation resolvable; #1215's alias sentence (its `README.md:1176`) is prose only. If nothing remains after the rebase, close this pull request.
- Alternatively, reverse the order in both descriptions and have #1215 drop its copy of this folder.
- In either case, rewrite the prose so that it describes this head:
  - both files are rebuilt on Tau Ceti carriers;
  - nine declarations and no roadmap import;
  - Layers 0–3 and 4.4 are resolved by the section map;
  - main's 4.1 (vector weak approximation), 4.5, 5.2–5.4, 7.1 and Layer 9 are dropped, and none of these ids is cited elsewhere.

## R02 (P3) — The branch still pins Tau Ceti `358314d`, where 23 declarations the README names do not exist

Re-raised: "Which pin" (repair report GATE-GlobalQuadraticForms~2). Its reason is that the branch "must take main's manifest" and the job may not touch the manifest. That reason fails: `git diff --stat origin/main...HEAD -- lake-manifest.json lean-toolchain` is empty, so merging `origin/main`, or rebasing onto #1215 as R01 asks, takes main's pins without editing the manifest.

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:151–154`: "read at the revisions the content repository's manifest records: Tau Ceti `2fd255d997f4…` and Mathlib `1b1ccf4b088b…`."

**Claim.** The declarations the README names exist at the pins this branch builds against.

**Witness.** `lake-manifest.json` at `8fe49f4` pins Tau Ceti `358314d4` and Mathlib `f6090c70`; main pins `2fd255d9` and `1b1ccf4b`. 23 cited names are absent at `358314d4`, for example `TauCeti.WittRing.globalToLocal` and `QuadraticMap.IsRepresentedBy.exists_equivalent_prod`. All 23 exist at `2fd255d9`.

The 23 names support the routes of 4.2 and 4.3 (first inequality, quadratic Hasse norm, idele-class surjectivity), 6.2 (`IsRepresentedBy.exists_equivalent_prod`), 7.2 and 7.3 (the reduction of 72:1 and the correction planes), 8.2 and 8.3 (hyperbolicity lemmas, `globalToLocal`), the section map (4.4) and the examples.

**Why P3.** The branch does not change the manifest. A merge therefore uses main's pins, where all 23 names exist with the statements the README gives.

**Repair.**
- Take main's pins:
  - either by the rebase onto #1215 (R01), whose manifest pins `2fd255d9` and `1b1ccf4b`;
  - or by merging `origin/main`, which reports one conflict, in `Suggested.lean`; keep this branch's file there.
- Rerun the gate.

## R03 (P3) — The section map resolves the real value of the archimedean symbol but not its complex value, which a consumer on main imports from Layer 4

**Location.** `TauCetiRoadmap/GlobalQuadraticForms/README.md:76–77`: "4.4, the real symbol, resolves to `TauCeti.hilbertSymbol_real` and `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff`." Also `README.md:1162–1163`: "Classical Arithmetic Completion consumes Layer 4's real symbol and localized product formula".

**Claim.** The section map resolves every Layer 4 citation that other roadmaps make into this roadmap.

**Witness.** Classical Arithmetic Completion on main imports from this Layer 4 the symbol's value "1 at a complex place" (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md:191`, `:193`). No line of this README names it. Tau Ceti has `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex` (`ArchimedeanSymbol.lean:166`).

Main's own 4.4 planned this value ("at a complex place it is always `1`"), and this head drops it without a mapping.

**Repair.**
- Replace `README.md:76–77` with: "4.4, the archimedean symbol, resolves to `TauCeti.hilbertSymbol_real` and `TauCeti.hilbertSymbol_unitAtRealPlace_eq_neg_one_iff` at a real place, and to `TauCeti.hilbertSymbol_completion_eq_one_of_isComplex` at a complex place."
- Add that name to the Symbols bullet of the Tau Ceti contract (`README.md:276–284`, which already lists `ArchimedeanSymbol.lean`).
- In `README.md:1162`, say "archimedean symbol" instead of "real symbol".

Tested: the lemma states `hilbertSymbol a c = 1` for all `a c : w.Completionˣ` when `w.IsComplex`, for `K : Type*`, at both pins (`:166` at `358314d`, `:167` at `2fd255d`). That is exactly the consumer's claim. #1215's copy already has this line (its `README.md:75–78`), so keeping #1215's text under R01 repairs R03 as well.

## Previous findings

- **Previous R01** (pins), restated as R02 — **not repaired.** `README.md:151–154` is unchanged. The manifest still pins `358314d4` and `f6090c70`. The merge base is still `fa41b37`.
- **Previous R02** (#1215), restated as R01 — **partly repaired.**
  - The description now carries a generated `merge-order` block that states an order: "#1215 (ClassFieldTheory) → this pull request".
  - The head is not rebased onto #1215, which has moved from `c1d130b8` to `693a416`. Both files still conflict.
  - The prose of the description is unchanged and still describes another head.

## Verified sound

**Gate, dependency check, scope of the change.**
- **Gate.** My rerun of the gate printed every check at 0 and `OK`, with exit 0. This matches the worker's line, which includes `build=0`.
- **Dependency check.** Output: `depcheck: 235 roadmaps, 2268 edges, 0 problem(s)`. There is no UPWARD, CYCLE or `moved:` line. The README names no roadmap supplier and declares no `gap:` contract.
- **Changes outside the folder.** `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/GlobalQuadraticForms'` is empty.
- **Files changed inside the folder.** Only `README.md` and `Suggested.lean`; `PROGRESS.md`, `STATUS.md` and `metadata.toml` are main's.

**Lean.**
- **Elaboration.** `lake env lean` on `Suggested.lean` at the branch pins exits 0 with exactly 8 `sorry` warnings, at lines 51, 68, 76, 84, 93, 111, 120 and 147.
- **Signatures.** A scratch file of `#check @…` for all 9 declarations elaborated. Every type matches its README statement:
  - binders `[FiniteDimensional K V]` and `[FiniteDimensional K W]`, and `hQ`/`hR : QuadraticMap.Nondegenerate`, are present on 5.5, 6.1, 6.2, 6.3, 8.1 and 8.4;
  - `a ≠ 0` is present on 6.1;
  - `[Invertible 2]` is present on 8.3;
  - `V` and `W` live in independent universes.

  I changed nothing in the file.
- **One-tactic probe.** On a scratch copy, each `sorry` was replaced by `first | rfl | infer_instance | (simp; done) | (aesop; done) | exact?`. All 8 fail.
- **8.4.** It is proved by one term from 6.3. It is kept because Integral Lattices on main cites it by name (`README.md:477`, `:916`), so it is not padding.
- **File form.** One module docstring states that every headline is statable. The header is `module` / `public import Mathlib`, a form 51 Suggested files on main use. There is no `lemma`, no `set_option` and no sorry'd data.

**Headline theorems.** The README's end theorems are 6.3, 7.3, 8.1 and 8.3; the deep results are 4.2, 5.5, 6.1, 6.2 and 8.4. All nine are stated on Tau Ceti carriers, none through a stand-in. Nothing in the Lean file mirrors a Check.

**Citations resolved.**
- **Count.** Of the 251 backticked tokens, the 173 Lean names resolve as follows:
  - 162 found by declaration at Tau Ceti `2fd255d` or Mathlib `1b1ccf4b`;
  - 2 checked by hand: `equivalent_weightedSumSquares_units_of_nondegenerate'` (`IsometryEquiv.lean:177`) and `injective_iff_map_eq_zero` (to_additive of `injective_iff_map_eq_one`, `Algebra/Group/Hom/Basic.lean:181`);
  - 9 are this roadmap's own names, all declared in `Suggested.lean`.
- **Contract paths.** The file paths the contract bullets give match where the names are declared, checked on 22 names, among them the Transport, Witt and Approximation bullets.
- **Inputs stated only in `Type`.** Exactly the eight listed at `README.md:155–162` are stated only in `Type`. Their files declare `{K : Type}`:
  - `FirstInequality.lean:68,103`;
  - `HasseNorm/Quadratic.lean:41`;
  - `PrescribedLocalForms.lean:69`;
  - `ProductFormula.lean:61,100`;
  - `SignPrescription.lean:72`.

  Every other cited input is universe-polymorphic. `isAdmissible_globalInvariants_iff` (`FormInvariants.lean:165`) is polymorphic, as the README implies.
- **Cross-roadmap citations of this roadmap, on main and at the open heads.** Ids cited: 4, 4.2, 4.3, 4.4, 5.5, 6.1, 6.3, 7.3, Layer 4, Layer 5 and "Layers 0–6". All exist or are mapped. No roadmap cites main's 4.1, 4.5, 5.2–5.4, 7.1 or Layer 9. The anchors `#layer-4-global-square-norm-and-approximation-lemmas`, `#61-scalar-representation` and `#63-hasseminkowski-isometry` resolve. Orthogonal and Spin Groups (main `README.md:947`, `:965`) cites `hasseMinkowski_equivalent`, which is kept.

**Library declarations opened.**
- **Mathlib at the pins:**
  - `QuadraticMap.Nondegenerate` (`Radical.lean:115`), `radical_eq_ker_polarBilin` (`:126`);
  - `InfinitePlace.comap`, `isReal_comap_iff` (requires `f : k ≃+* K`) and `comap_embedding_of_isReal` (`Ramification.lean:45`, `:82`, `:90`);
  - `embedding_of_isReal_apply` (`InfinitePlace/Basic.lean:244`).
- **Tau Ceti at `358314d`:**
  - `GlobalFormInvariants`, `realHasse` (`(-1)^(q choose 2)`), `hasseProduct` and `IsAdmissible` with its seven fields (`Invariants.lean:90`, `:142`, `:155`, `:178`);
  - `globalInvariants` (`FormInvariants.lean:77`);
  - the four predicates (`Predicates.lean:51`, `:66`, `:85`, `:147`);
  - `Represents` and `IsRepresentedBy` (`Representation.lean:44`, `:47`);
  - `atFinitePlace` and `atRealPlace` (`Localization.lean:88`, `:94`);
  - `hilbertSymbol` (`HilbertSymbol/Basic.lean:46`: `1` iff `b = x² − a y²`);
  - `localHasse`, a product over `i < j` (`LocalField/QuadraticForm/Hasse.lean:91`).
- **Tau Ceti at `2fd255d`:**
  - `finrank_le_index_range_ideleClassNormMap` (`FirstInequality.lean:108`, with `[IsGalois K L] [IsCyclic Gal(L/K)]` at `:103–104`);
  - `exists_sq_sub_mul_sq_iff_forall_completion` (`HasseNorm/Quadratic.lean:45`);
  - `ideleClassNormMap_surjective_of_forall_range_normUnits_eq_top` (`Ideles/Norm/Surjective.lean:198`);
  - `mem_range_ideleNormMap_iff` (`Range.lean:115`);
  - `exists_fieldUnit_isSquare_div_at_places` (`SquareClass.lean:40`);
  - `not_anisotropic_iff_discr_eq_neg_one_of_finrank_eq_two` (`LowRank.lean:173`);
  - `discr_atFinitePlace` (`Discriminant.lean:42`);
  - `not_anisotropic_of_isLocallyIsotropic_quaternary` (`Quaternary.lean:137`, ternary hypothesis over every `L : Type u`);
  - `not_anisotropic_of_isLocallyIsotropic_of_five_le_finrank` (`HigherRank.lean:87`);
  - `IsLocalRealization.exists_locallyRepresents_prod` (`PrescribedLocalForms.lean:140`, `W` on `Fin I.rank → K`);
  - `LocallyEquivalent.of_globalInvariants_eq` (`Classification.lean:161`);
  - `locally_formClass_eq_nsmul_hyperbolicClass_iff` (`Hyperbolicity.lean:116`, with Hasse sign `(−1,−1)^(m choose 2)`);
  - `WittRing.atRealPlace`, `globalToLocal` and `globalToLocal_wittClass_formClass` (`WittLocalization.lean:94`, `:167`, `:188`);
  - `hilbertSymbol_productFormula` (`ProductFormula.lean:67`);
  - `hilbertSymbol_real` (`HilbertSymbol/Archimedean.lean:59`);
  - `hilbertSymbol_completion_eq_one_of_isComplex` (`ArchimedeanSymbol.lean:167`).

**Duplication and ownership.**
- No Tau Ceti declaration at either pin states any of the nine headlines. A grep for Hasse–Minkowski, global square, `globalToLocal` injectivity and the `LocallyEquivalent → Equivalent` direction finds only `LocallyEquivalent.equivalent_atComplexEmbedding`. `WittLocalization.lean:40` says injectivity is not proved there.
- `roadmaps grep` over the open heads and main finds these headlines only in this roadmap: this head, #1215's copy and main.
- Quadratic Form Invariants Part II (#1834) owns Jannsen's cohomological Hasse principle, not forms over number fields, and states no global-to-local Witt map.
- I checked ownership against the open pull requests through the checkouts the brief lists and `roadmaps grep`.

**Sources: the seeded sample against milne-cft.** The printed page is the PDF page minus 9: Chapter VIII opens at the `page 238` marker, line 10375.
- **4.2.** Theorem 1.1 is at line 10384, printed p. 229. It states that local `n`-th powers at almost all primes are global, for `K ⊇ μ_n`; with `n = 2` this holds for every `K`. It needs no archimedean condition and supports 4.2 as stated.
- **Exercise 1.3**, line 10397, p. 229: 16 is an eighth power in ℝ and every odd `ℚ_p` but not in ℚ. This matches 4.2's fourth Check, and the factorization `x⁸ − 16 = (x² − 2)(x² + 2)(x² + 2x + 2)(x² − 2x + 2)` is correct.
- **4.3.** Theorem 3.1 is at line 10629, p. 234: for a cyclic `L/K`, an element that is a local norm everywhere is a global norm.
- **5.1 and 5.5.**
  - Theorem 3.5 is at line 10686, p. 235.
  - Corollary 3.6 and Proposition 3.7(b), (c) are at lines 10694–10702, p. 236.
  - The proof of 3.5(b) is at lines 10772–10804, p. 237.
  - The README cites Theorem 3.1 for the ternary case, correctly; the source's misprint is below.
- **6.1.** Corollary 3.6, p. 236, states the scalar case.
- **6.3, 8.4, 7.4, 8.2 and 8.3.**
  - Theorem 6.3 is at line 11619, p. 252.
  - Proposition 6.2 (Witt cancellation) is at line 11574, p. 251.
  - Theorem 6.10 and Proposition 6.11 are at lines 11745 and 11758, p. 255.
  - 7.4's convention remark is right: by line 11691, Milne's `i ≤ j` invariant is `ε(q)·(−1, d(q))`, the same factor on two forms of equal discriminant.
- **7.2 (real places).** The remarks at lines 11781–11790, p. 256, say that over ℝ the discriminant and the Hasse invariant determine the negative index only in rank at most 3. This matches 7.2's real-place paragraph.
- **7.2 and 7.3.** As stated, they agree with Theorem 6.12 and its restatement, lines 11792–11807, p. 256, after converting the `i ≤ j` invariant: the product condition is unchanged and the rank-1 and rank-2 clauses become `s_v = 1`.
- **4.1** has no literature locator. Its two facts concern universe transport and transport along ring isomorphisms. I checked its route against the Mathlib and Tau Ceti declarations above, including the hypotheses of `isReal_comap_iff` and `comap_embedding_of_isReal`.

**Adversarial table.** One row per statement; "H/C" means hypothesis/conclusion, "G/L" global side/local side.

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| Conventions: discriminants | `H = ⟨1,−1⟩`; `⟨1,1⟩` | plain `[−1]`, signed `(−1)^1·[−1] = [1]`; plain `[1]`, signed `[−1]` | as stated | none |
| Conventions: Hasse sign | `H` over ℝ | `i<j`: `(1,−1) = 1`; `i≤j`: `(1,1)(1,−1)(−1,−1) = −1` | conventions differ, as stated | none |
| Conventions: real sign | `⟨−1,−1⟩`; `p⟨1⟩⊥q⟨−1⟩` | `(−1,−1)_ℝ = −1 = (−1)^(2·1/2)`; `realHasse = (−1)^(q choose 2)` (`Invariants.lean:142`) | agree | none |
| Conventions: product formula | `(−1,3)` over ℚ | `−1` at 3 (`(−1/3)`), `−1` at 2 (`ε(−1)ε(3) = 1`), `+1` at ℝ | two places, product 1 | none |
| 4.1 places | ℚ(i), `σ` conjugation, `𝔭 = (2+i)` | `2+i ≡ 4` mod `𝔭̄` (square), `v_𝔭(2+i) = 1`; `σ(2+i) = 2−i ≡ 4` mod `𝔭` | square moves to `σ𝔭̄ = 𝔭` | none |
| 4.1 real places | ℚ(√5), `σθ = 1−θ`, `w': θ ↦ (1+√5)/2` | `w'.comap σ: θ ↦ (1−√5)/2 ≈ −0.618`; `p(σQ, w') = 1 = p(Q, w'.comap σ)`; fixed-place model gives `3` | correspondence needed | none |
| 4.1 identity / zero form | `σ = id`; zero form | `σQ = Q`; record rank 0, not admissible on both sides | holds | none |
| 4.2 [headline] | ℚ, `a = 4`, `S = ∅` | H: square everywhere; C: `2² = 4` | T/T | none |
| 4.2 | ℚ, `a = −1`; `a = 2`; any finite `S` | H fails at every `p ≡ 3 (4)`, resp. `p ≡ ±3 (8)`, outside `S`; C false | F/F | none |
| 4.2 | ℚ(i), `a = −1` | H: square everywhere; C: `i² = −1` | T/T | none |
| 4.2, exponent 8 (control) | ℚ, 16, `S = {2}` | H holds (one of `−1, 2, −2` is a square mod odd `p`); `16^(1/8) = √2 ∉ ℚ` | analogue false, so `n = 2` is needed | none |
| 4.3 | ℚ, `d = −1`, `a = 5`; `a = 3` | `5 = 1+4` T/T; `3`: G false, L false at 3 (`(−1,3)_3 = −1`) | T/T; F/F | none |
| 4.3 | ℚ, `d = 2`, `a = −1`; `d = −1`, `a = −1` | `1 − 2 = −1`, T/T; `x²+y² = −1` fails at ℝ, F/F | holds | none |
| 4.3 junk | `d = 0`, `d = 1` | both squares (`0 = 0²`), excluded by `¬IsSquare d` | excluded | none |
| 5.1 binary | ℚ: `⟨1,1⟩`, `⟨1,−2⟩`; ℚ(i): `⟨1,1⟩` | F/F (at 3); F/F (2 is a nonresidue mod 3); `d = [1] = [−1]`, T/T | holds | none |
| 5.1 ternary | `⟨1,1,−2⟩`; `⟨1,1,−3⟩`; `⟨1,1,1⟩` | `(1,1,1)` zero, `d = −1`, `a = 2 = 1²+1²`; F/F (fails at 2, 3); F/F (fails at 2, ℝ) | holds | none |
| 5.5 [headline] | rank 0; `⟨a⟩`; `H` | F/F; F/F; T/T | holds | none |
| 5.5 [headline] | ℚ, `⟨1,1,1,−7⟩` | G: F (7 is not a sum of 3 rational squares); L: isotropic at ℝ and odd `p`, anisotropic at 2 (`7 ≡ −1` mod squares, `(−1,−1)_2 = −1`) | F/F | none |
| 5.5 [headline] | `⟨1,1,1,1,−1⟩`; `⟨1,1,1,1,1⟩` | `(1,0,0,0,1)` T/T; F/F (at ℝ) | holds | none |
| 5.5 without regularity | `⟨1,0⟩` | radical vector `e₂` isotropic globally and after base change | T/T; `hQ` used only by the route | none |
| 6.1 [headline] | `⟨1,1,1⟩`, `a = 7` | G: F; L: F at 2 (Milne 6.9(c): `a = −d`, `(−1,−1)_2 ≠ S`) | F/F | none |
| 6.1 [headline] | `⟨1,1⟩`, `a = 2`; `a = −1`; zero form, `a = 1` | T/T; F/F (ℝ, 2); F/F | holds | none |
| 6.2 [headline] | `⟨7⟩ → ⟨1,1,1⟩`; `⟨1,1⟩ → ⟨1,1,1,1⟩`; `⟨c⟩ → H` | F/F (at 2); T/T; `((1+c)/2, (1−c)/2) ↦ c`, T/T | holds | none |
| 6.2 [headline] | zero `Q` into any `R`; rank `Q` > rank `R` | zero map injective, T/T; F/F | holds | none |
| 6.3 [headline] | `⟨1,1⟩` vs `⟨2,2⟩`; vs `⟨21,21⟩` | `(x+y, x−y)` T/T; `s_3`: `(21,−1)_3 = −1` vs `1`, F/F | holds | none |
| 6.3 [headline] | `⟨1,1,1,1⟩` vs `⟨1,1,7,7⟩`; `⟨1⟩` vs `⟨−1⟩` | `d = [1]` both; `s = (7,−1)_v = −1` at 7 and 2, F/F; F/F (at ℝ) | holds | none |
| 7.2 | ℚ, `n = 3`, `d = [1]`, `R = ⟨1,1,1⟩`, `s_2 = −1` | product `(−1)·1 = −1` | H fails; no form, consistent | none |
| 7.2 | local data of `⟨−1,−1,−1⟩` | `s_2 = (−1,−1)_2³ = −1`, real `(−1)^3 = −1`, product `1` | realized by the form itself | none |
| 7.3 [headline] | ℚ, rank 2, `d = [1]`, `p = 2`, `s_3 = s_7 = −1` | admissible (`−1` is a nonsquare in `ℚ_3`, `ℚ_7`); `⟨21,21⟩`: `s_3 = s_7 = −1`, `s_2 = (−1)^(10·1) = 1` | T, realized | none |
| 7.3 (control) | same with `s_3 = s_5 = −1` | `−1` is a square in `ℚ_5` gives `s_5 = 1`: not admissible; every `⟨a,a⟩` has `s_5 = (a,−1)_5 = 1` | F, and no form | none |
| 7.3 junk | rank 1, `d = [1]`, `p = 0`; rank 0 | real `[1] ≠ 1•[−1]`; `1 ≤ n` fails | not admissible; no form needed | none |
| 7.4 / 8.1 [headline] | `⟨1,1,−1⟩` vs `⟨1,2,−2⟩` | both `(3, [−1], s ≡ 1, p = 2)`: `(1,1)(1,−1)(1,−1) = 1`, `(1,2)(1,−2)(2,−2) = 1` | equal / isometric | none |
| 8.1 [headline] | `⟨1,1⟩` vs `⟨21,21⟩`; rank 0 vs rank 0 | `s_3` differs, F/F; `(0,[1],1,0)` both, T/T | holds | none |
| 8.2 | `⟨1,−1,2,−2⟩` | `m = 2`, `d = [4] = 2•[−1]`, `s = (−1,−4) = (−1,−1)^(2 choose 2)`, `p = 2` | locally `2H`, globally `2H` | none |
| 8.2 | `⟨1,1⟩` | `m = 1` needs `d = [−1]`, `p = 1`; has `[1]`, `2` | F/F | none |
| 8.3 [headline] | `[⟨1,1,−3⟩] − [⟨1,1,−1⟩]`; `[H]`; `[⟨1,1⟩]` | at `ℚ_3` nonzero (else `⟨1,1,−3⟩ ≅ ⟨1⟩⊥H` isotropic); `0` everywhere; real signature `2` | injectivity consistent | none |
| 8.3 complex places | class zero at one finite `v` | dimension even, so `0` in `W(ℂ) = ℤ/2` | omission justified | none |
| 8.4 [headline] | `⟨1,1⟩`, `⟨2,2⟩` | locally isometric, hence isometric by 6.3 | holds | none |
| 4.4 archimedean symbol (R03) | `(−1,−1)` at ℝ; any `a, c` at a complex `w` | `−1` (`hilbertSymbol_real`); `1` (`b = x² − a·0²`, `x = √b`) | Tau Ceti has both; the map names only the first | R03 |

## Not verifiable

- **O'Meara** (`omeara`) is settled as uncertified (paywalled) and cited by locator only. The locators involved are 58:7 (the quaternary input), 65:15 (4.2), 66:1 (5.5), 66:3 (6.1, 6.2), 66:4 (6.3), 66:5 (8.1), 71:19 and 71:19a (References) and 72:1 (7.2, 7.3).
  - I checked 4.2, 5.5, 6.1, 6.3, 7.2 and 7.3 against milne-cft instead (above).
  - 6.2, representation of forms, has no stated counterpart in Milne. I checked its route mathematically: Witt extension carries the line `⟨c⟩` to the split line, and the complements follow.
- **Serre** (`serre`) is uncertified; it is cited for conventions and for examples over ℚ.
- **Elaboration at main's pins** was not run. The only Lean command this job may run elaborates at the branch's pins (`358314d`). Earlier rounds report that the file elaborates at `2fd255d` with 8 `sorry` warnings.
- **#1215's description** is not readable with this job's tools. The order is taken from this pull request's generated `merge-order` block.

## Source issues

- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the three- and four-variable cases follow from Proposition 3.7(c),(d) and Theorem 1.1; it should be Theorem 3.1, the Hasse norm theorem, to which 3.7(c),(d) reduce isotropy; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says the induction assumes "Theorem 3.1b" for `n − 1` variables; it should be Theorem 3.5(b); affects nothing.
- **Misprint** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source says that outside the finite set `S` the form `R` represents 0; it should be `r`, the complement of `aX₁² + bX₂²`; affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 3.5(b), p. 237: the source picks common values `c_v` and `c = ax₁² + bx₂²` without requiring them nonzero, and with `S` empty nothing excludes `c = 0`; it should choose `c_v` and `c` nonzero, so that `cY² − r` is nondegenerate; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source writes the complements as `q₁`, `q′₁`, then names them `q₁`, `q₂` and compares `q₁` with `q₂`; it should read `q′₁` for `q₂`; affects nothing.
- **Gap** in milne-cft at VIII, proof of Theorem 6.3, p. 252: the source takes any `a` represented by `q`; it should take `a ≠ 0`, which exists for a nondegenerate form of positive rank, so that `aZ²` splits off; affects the proof.
- **Misprint** in milne-cft at VIII, proof of Theorem 6.10, p. 255: the source gives `S(q₁ ⊥ aZ²) = (a, d(q₁))·S(q₁)`, the recursion for the `i < j` invariant; for its own `i ≤ j` invariant it should be `(a, a·d(q₁))·S(q₁)`; affects nothing.
