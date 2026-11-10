# Review of EnhancedDerivedSheaves (pull request #1630 at 0514180)

**Verdict:** accepted

This is an incremental re-review of the 4 lines (two README passages) changed since `dc57fee`, the head the previous review read. `Suggested.lean` is unchanged and nothing outside the folder changed. No finding remains, the gate passes, and the folder is ready for a human's final approval. `README:N` refers to this folder's README at this head; the two edits replace lines in place, so the previous report's line numbers still hold.

## Previous findings

- R01 — repaired: `README:2258` now reads "truncation adjunction identifies maps into the objects `L_n ∈ D^{≥−n}`, `Map(K, L_n) ≃ Map(τ^{≥−n}K, L_n)`, but the full derived Hom complexes are not identified degree by degree."
  - This is the requested wording. It is the adjunction between `τ^{≥−n}` and the inclusion of `D^{≥−n}`, and it agrees with *postnikovCompletion_eval* (`README:2248`, n-th term in `D^{≥−n}`).
  - On the instance that refuted the old wording (table row 26) the new claim holds, and it agrees with the target's own first Check (`README:2262`) and with its proof route (`README:2266`).
  - The repair introduced no new problem. No other passage of the README calls the tower terms connective; the remaining uses of the word (`README:339`, `:675`, `:2118`, `:2132`, `:2983` onward) concern mapping spaces and animated modules, where it is correct.

## Verified sound

**The second changed passage (`README:2800`, proof route of *derivedComplete_iff_cohomology*).**
- Old text: "`T(K, x)` is then arbitrarily connective, hence zero." New text: applying `T(−, x)` to `τ^{≤m}K → K → τ^{≥m+1}K` gives `T(K, x) ≃ T(τ^{≥m+1}K, x) ∈ D^{≥m+1}` for every m, so `T(K, x) = 0`.
- The new text is correct, and it fixes a direction slip the old text had: the object is bounded below by every m, not connective. Each step was checked:
  - `T(τ^{≤m}K, x) = 0`, because `τ^{≤m}K ≃ Rlim_n τ^{≥−n}τ^{≤m}K` by *IsReplete.leftComplete*, the finite truncations are complete by extensions, and *derivedComplete_limits* passes completeness to the limit. All three are on the target's *Needs:* line.
  - `T(L, x) ∈ D^{≥m+1}` for `L ∈ D^{≥m+1}`, because `T(L, x)` (`README:81`: the derived limit of `L ←x L ←x ⋯`) is the fibre of a map `∏L → ∏L`, and `D^{≥m+1}` is closed under products and fibres.
  - An object of `D^{≥m+1}` for every m has zero cohomology sheaves, so it is zero.
- The route is the one in the source: BS-proet line 1113–1118 (proof of Proposition 3.4.4, p. 23), restated here in the README's own words. The locator "Proposition 3.4.4, p. 21, with proof on p. 23" is right (BS-proet line 986, line 1113).
- The passage cites *IsReplete.leftComplete* (`README:2282`), *derivedCompleteSheaves_weakSerre* (`README:2778`), *IsReplete.rlim_amplitude* (`README:2206`) and the definition of `Dcomp` by `T(K|_U, x) = 0` (`README:2680`). All exist where cited and say what the route uses.

**Gate, order, worktree.**
- `HEAD` is `0514180` and the worktree is clean. `git diff --stat dc57fee HEAD` is `README.md | 4 ++--` only. `git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/EnhancedDerivedSheaves'` is empty.
- I reran `gate … --base origin/main`: exit 0, every counter 0, `OK`. The worker's run on this head also reports `build=0`.
- The dependency check (`gate --depcheck … --movable --pr 1630`) exits 0 with no UPWARD, CYCLE or `moved:` line:

```text
depcheck: 235 roadmaps, 2294 edges, 0 problem(s)
```

**Elaboration.**
- `lake env lean TauCetiRoadmap/EnhancedDerivedSheaves/Suggested.lean` exits 0. The only warnings are 10 "declaration uses `sorry`", at lines 101, 121, 148, 184, 196, 207, 219, 248, 262 and 279, the same as at `dc57fee`.
- The file is byte-identical to the one the previous review read, so its `#check @` comparison of the 17 declarations, its one-tactic padding probe (all 10 theorems fail) and its headline coverage (ten stated; each unstated family named in the docstring with its missing carrier) stand. Neither changed passage has a Lean statement.

**Overlaps and description.**
- `overlaps.md` reports no dropped id and no id that only an open revision defines. The description orders #1701 first and #1187 after this pull request, and states the rebase rule against #1330. Its sentences about what changed still match the head.
- The changed passages cite no other roadmap and no library declaration, so no cross-roadmap citation or pinned name needed re-resolving. The previous report's resolutions (154 Mathlib names, 92 Tau Ceti names, the supplier sections on main and at #1701) stand for the untouched text.

**Seeded sample.** The sampled targets (§§0.1–0.4) are not in the changed passages; the previous report read them at their locators. For the changed passages I read BS-proet Definition 3.3.1 and Lemma 3.3.2 (p. 18, line 820–824) and the proof of Proposition 3.4.4 (p. 23, line 1113–1128).

**Adversarial computations.** Rows 1–25 are carried from the previous report (r24, at `dc57fee`), whose statements the diff does not touch. Rows 26 and 27 are the changed statements, computed at this head.

| # | Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- | --- |
| 1 | `hasKInjectiveResolutions` (`:101`) | `ModuleCat ℤ`; acyclic K; `ℤ/4` complex with `d = 2` | r24 row 1: acyclic K resolves to `I ≃ 0`; the `ℤ/4` complex is termwise injective, not K-injective (`1 = 2(h_n+h_{n+1})` impossible) | Pass (carried) |
| 2 | `locallySmall_localization_quasiIso` (`:121`) | `ModuleCat.{u} R`; `SheafOfModules.{u} O` | r24 row 2: Mathlib `Type (u+1)`, K-injective argument `Type u` | Pass (carried) |
| 3 | §0.1 instance Check (`README:477`) | `Q(ℤ/p)⟦−1⟧ ⟶ Q(ℤ)` | r24 row 3: `Ext¹ = ℤ/p`, `Ext⁻¹ = 0` | Pass (carried) |
| 4 | §0.1 cone Checks (`:461`) | `cone(0)`, `cone(id)` | r24 row 4: `H⁻¹ = H⁰ = A`; zero | Pass (carried) |
| 5 | `smallEtaleTopology_W_isMonoidal` (`:148`) | `∅`; `Spec k ⊔ Spec k` | r24 row 5: W is all maps on ∅; presheaf tensor `Λ⁴`, sheaf tensor `Λ²` | Pass (carried) |
| 6 | Koszul Check (`README:511`) | `[ℤ →id ℤ]` | r24 row 6: unsigned swap gives `−e₁⊗e₁ ≠ e₁⊗e₁`; Koszul gives `−e₁⊗e₁` twice | Pass (carried) |
| 7 | Étale flat Check (`:524`) | `(ℤ/2)_X` over `ℤ/4` | r24 row 7: `Tor_i = ℤ/2` for all `i ≥ 0` | Pass (carried) |
| 8 | §0.3 tower Check (`:554`) | `[ℤ → ℤ/ℓ^{i+1}]` | r24 row 8: `lim¹ = ℤ_ℓ/ℤ`, `H¹(K_i) = 0` | Pass (carried) |
| 9 | `isInvertible_iff_isUnit_toSkeleton` (`:184`) | `𝟙`, `ℤ/2`, `Λ_X[1]` | r24 row 9: true/true; false/false; `ε = −1` | Pass (carried) |
| 10 | §0.4 Checks (`:615`–`:617`) | identity; two squares | r24 row 10: identity exchange; `mateEquiv_vcomp` | Pass (carried) |
| 11 | `isRegular_of_frobenius_flat` (`:196`) | `𝔽_p[t]`; `𝔽_p[ε]/ε²`; `𝔽_p[t^{1/p^∞}]`; zero ring | r24 row 11: rank p and regular; not flat; excluded by Noetherian; excluded by `CharP` | Pass (carried) |
| 12 | `perfect_projectiveDimension_le` (`:207`) | `k`; `𝔽_p[t]_perf` | r24 row 12: bound 1 vs value 0; `pd(R/J_t) = 2 = d+1` | Pass (carried) |
| 13 | `perfect_torDimension_le_two_mul_dim` (`:219`) | `(k[x,y]/(xy))_perf`; dimension 0 | r24 row 13: `Tor₂ = k`, `Tor₃ = 0`; `Tor_{≥1} = 0` | Pass (carried) |
| 14 | *frobeniusFlat_completion* route (`README:885`) | Frobenius twist | r24 row 14: `Tor₁^Â(κ, F_*Â) = Tor₁^A(A/𝔪^{[p]}, Â) = 0` | Pass (carried) |
| 15 | Cohen non-uniqueness Check (`:880`) | `𝔽_p(t)⟦T⟧`; `𝔽_p(t)` | r24 row 15: two sections `t ↦ t`, `t ↦ t+T`; one section when `𝔪 = 0` | Pass (carried) |
| 16 | `isDerivedComplete_iff_derivedCompleteness` (`:248`) | `I = ⊤`, `I = 0`, `ℤ` at `(p)`, `ℤ[x₁,…]` | r24 row 16: both sides agree in each case (`lim¹ = ℤ_p/ℤ = Ext¹(ℤ[1/p], ℤ)`) | Pass (carried) |
| 17 | `isAdicComplete_iff_derivedComplete_separated` (`:262`) | `I = ⊤`, `I = 0`, `ℤ`, `coker ψ` | r24 row 17: `M = 0`; true; false/false; `ē₀ = pᵏē_k ≠ 0`, false/false | Pass (carried) |
| 18 | `derivedCompleteModules_weakSerre` (`:279`) | `ℤ ⊂ ℤ_p`; `ℤ_p/ℤ`; `·p` | r24 row 18: ends not complete; kernel 0 and cokernel `𝔽_p` complete | Pass (carried) |
| 19 | E1.6 nodal Check (`README:903`) | p = 2, 3 | r24 row 19: `y ∉ yJ` | Pass (carried) |
| 20 | E1.9 base-change Check (`:1214`) | `k[t,ε]/(tε, ε²)` | r24 row 20: `k[0]` both sides; `H₂ = k` | Pass (carried) |
| 21 | E2.4 window (`:2321`) | `m = 0`; `m = −3` | r24 row 21: `N = 1`; `N = 4` | Pass (carried) |
| 22 | E5:animation.1 Check (`:2033`) | comma category at (one, one) | r24 row 22: 13 objects, 40 arrows, `H₀ = ℚ`, `H₁ = ℚ²` | Pass (carried) |
| 23 | E5:descent Checks (`:1948`–`:1949`) | `𝔽_p[x_i]/(x_i^{i+1})`; `ab+cd=1` | r24 row 23: no index; index ≤ 5 | Pass (carried) |
| 24 | E2:towers Check (`:1545`) | `ℚ[t]`, `|t| = −2` | r24 row 24: `H^j` vanishes for n large, transitions `t^{n+1} ≠ 0` | Pass (carried) |
| 25 | E4 Checks (`:2687`, `:2755`) | `ℤ[1/p][−1]`; `f = 0` | r24 row 25: π zero but `T ≠ 0`; `Rlim = K` | Pass (carried) |
| 26 | *postnikovCompletion_adjunction*, changed (`:2258`) | (a) `K = ℤ[1]`, `L₀ = ℤ[0]`; (b) `K = L₀ = ℤ[−1]`; (c) `K = ℤ/p[0] ⊕ ℤ[1]`, `L₀ = ℤ[−1]`; (d) old wording, connective `L = K = ℤ[1]`, n = 0 | (a) `π_i Map(K, L₀) = Ext^{−i−1}(ℤ, ℤ) = 0` and `τ^{≥0}K = 0`: both contractible, while `H¹ RHom(K, L₀) = ℤ`. (b) `τ^{≥0}K = K`, `π₀ = ℤ` on both sides. (c) `π₀ Map(K, L₀) = Ext¹(ℤ/p, ℤ) ⊕ Ext^{−2}(ℤ, ℤ) = ℤ/p`; `τ^{≥0}K = ℤ/p[0]` gives `ℤ/p`. (d) `ℤ[1] ∉ D^{≥0}`, so the new sentence does not claim `π₀ = ℤ` equals `0`. | Pass |
| 27 | *derivedComplete_iff_cohomology* route, changed (`:2800`) | on `Set`, `R = ℤ`, `x = p`: (a) `K = ℤ_p[1]`; (b) `K = ⊕_{j ≥ 0} ℤ_p[j] = ∏_{j ≥ 0} ℤ_p[j]`; (c) `K = ℤ[1/p][0]`; (d) `K = ℤ[0]` | (a) m = −2: `τ^{≥−1}K = K`, `T = (lim, lim¹ of ℤ_p ←p)[1] = 0 ∈ D^{≥−1}`; m ≥ −1: `T(0) = 0`. (b) `τ^{≥m+1}K` is the finite sum over `j ≤ −m−1`, `T = 0` for each m. (c) cohomology not complete: `T(τ^{≤0}K, p) = ℤ[1/p] ≠ 0`, so the first step fails as it must, and `T(K, p) = ℤ[1/p] ∈ D^{≥0}` is not in `D^{≥1}`. (d) `T(K, p) = (ℤ_p/ℤ)[−1] ≠ 0`, `H⁰ = ℤ` not complete. | Pass |

Rows 26 and 27 use 4 instances each; rows 1–25 are 25 carried statements.

## Not verifiable

- HTT, SAG, Liu–Zheng, Nikolaus–Scholze, Mathew, ECD, Ramzi, Efimov, Robalo, Fargues–Scholze and Bhatt's papers are not in the source cache. Their locators are outside the changed passages and the seeded sample, and were not read this round or the last.
- Ownership against open pull requests was not rechecked this round beyond the overlap report: the change adds no object, name or citation.

## Source issues

- **Error** in BS-proet at Lemma 3.3.2, proof, p. 18: the source says the identification of `R lim RHom(K, L_n)` with `R lim RHom(τ^{≥−n}K, L_n)` is formal; it should say this only after `τ^{≤0}` (on mapping spaces): `K = ℤ[1]`, `L₀ = ℤ` gives `ℤ[−1]` against `0`; affects the proof.
