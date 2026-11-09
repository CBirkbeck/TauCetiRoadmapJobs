# Review of StableHomotopyKTheory (pull request #1227 at 6ebf6e2)

**Verdict:** needs changes

This is an incremental re-review of the 40 lines changed since f645066: 38 lines in `README.md` and one line in `Suggested.lean`. Both previous findings are repaired. The tower-algebra repair introduced one new P3 problem. There are no blocking findings.

## R01 (P3) — "shift" now names two different maps, and §4.11 credits Tau Ceti with the wrong cokernel

**Location.** `TauCetiRoadmap/StableHomotopyKTheory/README.md:1613` (§4.11) reads: "through Tau Ceti's identification `TauCeti.ModuleTower.groupTowerLimOneEquiv` of the orbit set with coker(1−shift) for abelian tower groups, to the cokernel `TauCeti.ModuleTower.limOne` of the shift δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁". The same clash appears elsewhere:

- `README.md:74` calls δ the shift.
- `README.md:1213` also calls δ the shift.
- `README.md:97`, `99` and `1224` still use "shift" for the index shift.

**Claim.** The repair adopts Tau Ceti's name `shift` for the difference map δ = 1 − s. Here s is the index shift (xₙ) ↦ (φₙ(xₙ₊₁)). The untouched GeneralizedCohomology contracts and §3.18 still use "shift" for s itself. §4.11 now uses both meanings in one sentence. It also says that a Tau Ceti declaration identifies the orbit set with coker(1−shift). But that declaration's target is the cokernel of `TauCeti.ModuleTower.shift` itself. Read with the README's own definition at line 74, coker(1−shift) is coker(s), which is not lim¹.

**Witness.** At the pin, `shift = id − transition∘proj` and `limOne = coker shift` (`Tower/Basic.lean:160`, `174`), and `groupTowerLimOneEquiv` lands in `F.limOne` (`Tower/GroupTower.lean:56`). On the ×2 tower on ℤ:

- coker δ ≅ ℤ₂/ℤ, which has no 2-torsion.
- coker(1−δ) = ∏ℤ/2.

**Repair.**

1. In the `From Tau Ceti` paragraph (line 74), add after the δ formula: "this is the map written 1−shift in GeneralizedCohomology and AlgebraicTopology, where shift is the index shift (xₙ) ↦ (φₙ(xₙ₊₁)); in this README 'shift' alone keeps that meaning, and δ denotes `TauCeti.ModuleTower.shift`".
2. In §4.11 (line 1613), replace "with coker(1−shift) for abelian tower groups, to the cokernel `TauCeti.ModuleTower.limOne` of the shift δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁" with "with the cokernel `TauCeti.ModuleTower.limOne` of δ(x)ᵢ=xᵢ−rᵢxᵢ₊₁ for abelian tower groups".
3. In §3.18 (line 1213), change "the cokernel `TauCeti.ModuleTower.limOne` of the shift" to "the cokernel `TauCeti.ModuleTower.limOne` of δ".

Tested on the refuting instance: after the edit, every reading of §§3.18 and 4.11 gives coker δ ≅ ℤ₂/ℤ for the ×2 tower. That is the target of `limOneMultiplicationTowerEquiv`, and it agrees with §7.10 and Layer 7's Examples ("The doubling tower of ℤ has lim¹ = ℤ₂/ℤ"). Lines 97, 99 and 1224 then read correctly unchanged.

## Previous findings

- R01 — repaired. Line 74 now reads: "Countable tower algebra is Tau Ceti's, used at R=ℤ. A tower of modules is `TauCeti.ModuleTower R`, the functor category `ℕᵒᵖ ⥤ ModuleCat R`…". `DerivedModuleAlgebra`, `§1.T.1`, `CompactCoefficients` and `Tower.*Comparison` now occur 0 times. Every cited Tau Ceti name resolves at 2fd255d9. The repair introduced R01 above.
- R02 — repaired. `Suggested.lean:192` reads "theorem IsPlusConstruction.nonempty_piTwoEquiv", and `README.md:1338` names it. The gate reports `statement-hygiene=0`. The elaborated type is unchanged apart from the name.

## Verified sound

**Scope and repository state.** `git diff --stat origin/main...HEAD` outside the roadmap folder is empty, and so is the change since f645066 outside the folder. The worker's change summary lists the whole change, which I read line by line:

- the new `From Tau Ceti` tower paragraph (line 74), replacing the deleted `From DerivedModuleAlgebra on main` contract;
- the last sentence of the G3.4 bullet (line 97);
- §3.18 (lines 1213, 1228), §3.29 (line 1338) and §4.11 (lines 1613, 1623);
- Layer 4 Dependencies (line 1923);
- §7.9 (lines 2457–2471), §7.10 (lines 2475, 2485) and §7.17 (line 2549);
- Layer 7 Dependencies (line 2825);
- the theorem name at `Suggested.lean:192`.

The sections that cite §7.9 by number (§§7.10, 7.11, 7.14, 7.17, 7.24–7.26) keep valid citations. The section numbers did not move, and §7.11's "§7.9's supplied natural six-term boundary" is now Tau Ceti's `connecting`.

**Gate, elaboration, dependencies.**

- My rerun of the gate printed: `gate StableHomotopyKTheory: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK`. My rerun's summary line carries no `build=` count. The worker's gate (`build=0`) and my direct elaboration both cover the build.
- `lake env lean` on `TauCetiRoadmap/StableHomotopyKTheory/Suggested.lean` exited 0 with exactly 11 `declaration uses 'sorry'` warnings and nothing else.
- The dependency check printed:

```text
depcheck: 236 roadmaps, 2266 edges, 0 problem(s)
```

  There is no UPWARD, CYCLE or `moved:` line. Dropping the DerivedModuleAlgebra edge removes a supplier on main; Tau Ceti at the pin is not a roadmap edge.
- Signatures: 24 declarations. The four "looks dropped" leads are the same false positives as before. They are the `[Category.{v} C]`/`[Category.{v} D]` binders of the three Quillen theorems, which the elaborated types carry as `inst`, and `continuousFunctions_projective_free`, whose type mentions no category.
- The elaborated `nonempty_piTwoEquiv` concludes `Nonempty (Additive (HomotopyGroup (Fin 2) Y (f x)) ≃+ groupHomology … 2)`, with the hypotheses `HasCWType X`, `HasCWType Y`, path-connectedness, `[P.Normal] [Group.IsPerfect P]`, `IsPlusConstruction f x P` and `TauCeti.IsAspherical X x`. That is the old statement under the new name.
- The four "found nowhere" Lean names from the citation resolver are all declared in `Suggested.lean`, at lines 166, 192, 203 and 221.

**Tau Ceti declarations cited by the changed text, opened at the pin (2fd255d9).** All are under `TauCeti/Algebra/Category/ModuleCat/Tower/` unless another path is given. 36 names in all.

| Declaration(s) | File:line | What the README says of it | Agrees |
| --- | --- | --- | --- |
| `TauCeti.ModuleTower`, `.Product` | `Basic.lean:78`, `89` | `ℕᵒᵖ ⥤ ModuleCat R`, product of terms | yes |
| `.shift`, `.lim`, `.limOne` | `Basic.lean:160`, `170`, `174` | `δ(x)ₙ = xₙ − φₙ(xₙ₊₁)`, its kernel, its cokernel | yes |
| `.productMap`, `.limMap`, `.limOneMap` | `Basic.lean:393`, `462`, `516`; `_id/_comp/_zero/_add` at 402–420, 478–490, 525–541 | functorial and additive | yes |
| `.connecting`; `exact_limMap`, `exact_limMap_connecting`, `exact_connecting_limOneMap`, `exact_limOneMap` | `Exact.lean:191`; `99`, `213`, `226`, `136` | six-term sequence, exact at every term | yes; the end terms are `limMap_injective` (`Basic.lean:504`) and `limOneMap_surjective` (`Basic.lean:547`) |
| `.IsMittagLeffler`, `subsingleton_limOne_of_isMittagLeffler`, `isMittagLeffler_of_surjective`, `isMittagLeffler_of_isArtinian` | `MittagLeffler.lean:70`, `191`, `104`, `113` | ML vanishing | yes |
| `lim_eq_bot_of_isProZero`, `subsingleton_limOne_of_isProZero` | `ProZero.lean:75`, `88` | pro-zero towers have vanishing lim and lim¹ (used by §7.17) | yes |
| `limSubsequenceEquiv` | `Subsequence.lean:86` | cofinal subsequence (`hφ : ∀ n, ∃ m, n ≤ φ m`) has the same limit | yes |
| `derivedLimit`, `homotopyLimitTriangle`, `derivedLimitπ`, `derivedLimitIsoLimComplex` | `DerivedLimit.lean:310`, `171` (distinguished: `177`), `350`, `394` | `Rlim` via `Cone(δ)[−1]`; equals `lim K` when every term has vanishing lim¹ (`hK : ∀ i, Subsingleton (K.X i).limOne`) | yes |
| `TauCeti.ComplexTower.limOneToHomology`, `homologyToLim`, `limOneToHomology_injective`, `exact_limOneToHomology_homologyToLim`, `homologyToLim_surjective` | `Milnor/Basic.lean:482`, `383`, `501`, `518`, `532` | Milnor sequence under `hC : ∀ i, Surjective (C.term i).shift`, for `c.Rel i j` | yes |
| `TauCeti.GroupTower`, its twisted action, `.lim`, `.limOne`, `stabilizer_one` | `TauCeti/Algebra/Group/Tower.lean:73`, `92–93`, `106`, `118`, `209` | `(g • h)ₙ = gₙ hₙ rₙ(gₙ₊₁)⁻¹`, pointed orbit set, lim is the stabiliser of `1` | yes; the same action as GeneralizedCohomology G3.10 on main (`GeneralizedCohomology/README.md:923–925`) |
| `groupTowerLimOneEquiv` | `GroupTower.lean:56` | orbit set = cokernel of `shift` for module towers | yes; the wording around it is R01 |
| `multiplicationTower`, `lim_multiplicationTower_eq_bot` | `ProZero.lean:97` (transition `x ↦ x * a`), `173` (`¬IsUnit p`) | ×p tower, lim = 0 | yes |
| `padicSum`, `limOneMultiplicationTowerEquiv` | `Padic.lean:57`, `141` (`p : ℕ`, `[Fact p.Prime]`, target `ℤ_[p] ⧸ (Int.castAddHom ℤ_[p]).range`) | lim¹ ≅ ℤ_p/ℤ by `∑ pⁿ aₙ`, for prime p | yes; §7.10 states "For prime p" |

**Sources: the seeded sample.** Of the 15 seeded targets, only §7.9 falls in the changed passages. I read every locator of §7.9.

| Locator | Text read | Verification |
| --- | --- | --- |
| Stacks, More on Algebra, Lemma 15.88.1, tag 07KW | Stacks (More on Algebra) lines 10638–10653, chapter pp. 231–232 | `Rlim` on inverse systems is represented by `∏Aₙ → ∏Aₙ`, `(xₙ) ↦ (xₙ − fₙ₊₁xₙ₊₁)`, in degrees 0 and 1. ML implies `R¹lim = 0`. Termwise lim computes `Rlim` when the terms are lim-acyclic. This supports δ, lim¹ = coker δ, ML vanishing and the derived-limit comparison; the indexing matches `fᵣ : X_(r+1) → X_r`. |
| Stacks, Algebra, Lemma 10.86.4, tag 0598 | Stacks (Algebra) lines 9540–9549, chapter p. 203 | For countable index sets and ML kernels, lim is exact on short exact sequences. This supports the ML part of the six-term statement. |
| S II, Lemma 5.6 and Remark 5.9, pp. 257–258 | S lines 13539–13602 | This is the Milnor sequence `0 → lim¹[ΣXₙ,Y] → [X̄,Y] → lim[Xₙ,Y] → 0` for homotopy colimits. Kernel and cokernel of `1 − E(f)` on the product are lim and lim¹, with printed pages 257–258. It supports the algebraic identification. The holim form is GeneralizedCohomology G3.4/G3.8's, as consumed. |
| S II, proof of Thm. 8.3, p. 297 | S lines 15796–15808 | The holim Milnor sequence of the Postnikov tower, with lim¹ vanishing because the towers stabilise. The source's lim¹ index is misprinted (see Source issues); the README's `lim¹πₖ₊₁Xᵣ` is the correct one. |
| W IV 2.9, p. IV.22 | W IV lines 963–972 | `0 → lim¹ πₙ₊₁(E;ℤ/ℓ^ν) → πₙ(E;ℤ_ℓ) → lim πₙ(E;ℤ/ℓ^ν) → 0`. This confirms the `πₖ₊₁` index used in §7.9. |

The other 14 seeded targets (§§1.1, 1.13, 1.17, 1.22, 1.25, 2.2, 2.3, 3.15, 3.23, 3.30, 3.33, 4.5, 4.7, 7.25) are untouched; their rows are carried below. No locator in the README is flagged as unverified.

**Ownership and duplication.** The change adds no construction. It moves the countable tower algebra from a roadmap on main (DerivedModuleAlgebra §1.T.1) to its existing owner in the pinned library (Tau Ceti), which defers to the library as required. The README states that no tower carrier or presentation is built here (line 74). The overlap check lists no open pull request that changes this roadmap and no dropped id. With the DerivedModuleAlgebra citations gone, the previous review's dropped-id concern no longer applies. Nothing else in the changed passages could have a second owner, so no further ownership search against open pull requests was needed this round.

**Headline theorems and padding.** These are unchanged: the same 11 sorried theorems and 13 definitions, and the same module docstring listing what is not statable. The renamed `nonempty_piTwoEquiv` asserts the existence of an isomorphism π₂(Y) ≅ H₂(P;ℤ) for a plus construction on an aspherical CW-type source. No single library lemma gives it, so it is not padding.

**Adversarial table.** New rows with computed values for every changed statement come first. After them come the carried rows for the untouched seeded targets and headline theorems, each citing the report it comes from. The full Layer 1–7 sweep of [r4]/[r5] is carried by reference.

| Statement | Instances tried | Values computed on each side / wrong-model control | Result; change |
| --- | --- | --- | --- |
| Tau Ceti contract: `shift`, `lim`, `limOne` (line 74) | identity tower `ℤ`; ×2 tower on `ℤ`; zero-transition `ℤ/p` | Identity: `δ(x)ₙ = xₙ − xₙ₊₁` has kernel the constant sequences `≅ ℤ`, and it is surjective (`x₀ = 0`, `xₙ₊₁ = xₙ − yₙ`), so lim¹ `= 0`. ×2: kernel 0; `(1,1,…) = δ(−1,−1,…)` and `(1,0,0,…) = δ(1,0,…)`, so both classes are 0. Zero transitions: `δ = id`, so kernel and cokernel are 0. Wrong model `1 − δ`: on ×2 it gives coker `∏ℤ/2 ≠ ℤ₂/ℤ`. | Pass; the naming of `1 − shift` is R01 |
| `GroupTower.limOne` and `groupTowerLimOneEquiv` (lines 74, 1213, 1613) | constant `S₃` tower with identity transitions; `S₃` tower with trivial transitions; ×2 tower on `ℤ` | Identity transitions: the action `gₙhₙgₙ₊₁⁻¹` is transitive, so lim¹ is a point, and the stabiliser of `1` is the constant families `≅ S₃`. Trivial transitions: the action `gₙhₙ` is transitive and lim `= 1`. ×2: the orbit of `h` is `h + range δ`, which matches `limOne`. | Pass |
| §3.18 space-tower Milnor sequence with Tau Ceti lim¹ | constant `S¹`; `S¹ ←2 S¹ ←2 ⋯` (2-adic solenoid) | Constant: lim π₁ `= ℤ` and lim¹ π₂ `= 0`, so π₁ holim `= ℤ`; the π₀ fibre is lim¹ of the constant ℤ tower, a point. Solenoid: lim π₁ `= 0`, lim¹ π₁ `= ℤ₂/ℤ`, so π₀ holim `= ℤ₂/ℤ`, the known path components of the solenoid; π₁ holim `= 0`. | Pass; "of the shift" wording is R01 |
| §4.11 phantom kernel via `limOne` and ML vanishing | constant exhaustion of `S¹`, `T = K(ℤ,1)`; `T = *` | `[ΣS¹,T]_* = π₂T = 0`, so the tower is ML and lim¹ `= 0` (`subsingleton_limOne_of_isMittagLeffler`); `[S¹,T]_* = ℤ` is kept. For `T = *` every term is 0. | Pass; R01 |
| §7.9 difference map = `TauCeti.ModuleTower.shift`; Checks | the five Checks; `0 → pʳℤ → ℤ → ℤ/pʳ → 0` | Identity: `A`, `0`. Zero transitions: `0`, `0`. Surjective transitions give lim¹ `= 0`; the ×p tower fails this. Short exact sequence: lim `0 → ℤ → ℤ_p → lim¹(pʳℤ) → 0`, since lim¹ of the identity ℤ tower is 0. So `connecting` is onto with kernel `ℤ`, under the hypotheses `hf` (inclusion injective), `hfg` (exact) and `hg` (reduction surjective). The `ℤ/p` tower with zero transitions is ML, with lim `= lim¹ = 0`. | Pass |
| §7.10 ×p sphere tower, `limOneMultiplicationTowerEquiv` | `p = 2`, class of 1/3; `p = 3`, levelwise ×2 | `1/3 ∈ ℤ₂ \ ℤ` (2-adic digits `1,1,0,1,0,1,…`; `3·11 = 33 ≡ 1 mod 32`), so the class is nonzero. `padicSum(1,1,…) = −1 ∈ ℤ`, so the class is 0, matching `δ(−1,…)`. At p = 3, `2·[1/2] = [1] = 0` with `[1/2] ≠ 0`. `lim_multiplicationTower_eq_bot` needs `¬IsUnit p`, which holds for primes. | Pass |
| §7.17 pro-zero towers | `E = H(ℤ/p^N)`; control `E = H(ℤ/p^∞)` | ×p on `ℤ/p^N`: the composite of N transitions is 0, so the tower is pro-zero and lim `= lim¹ = 0`. ×p on `ℤ/p^∞` is surjective and not pro-zero; lim `= T_p(ℤ/p^∞) = ℤ_p ≠ 0`, so it is not complete, as the section's last sentence requires. | Pass |
| 3.29 `nonempty_piTwoEquiv` (rename) | `P = A₅`; `P = 1` | `π₂(BA₅⁺) = H₂(A₅) = C₂`; `P = 1` gives `0 ≅ 0`. The elaborated type is identical. | Pass |
| 1.1 (seeded) | empty category; terminal category; identity | `B∅ = ∅`, `B1 = *`, `B(id) = id`; a constant-point model fails the first. | Pass; carried [r5] |
| 1.13 (seeded) | finite discrete subsets of ℕ | both sides have underlying set ℕ in each degree | Pass; carried [r5] |
| 1.17 (seeded) | increasing finite discrete sets | `H₀ = ⊕ℕℤ = colim ℤⁿ`; positive H vanish | Pass; carried [r5] |
| 1.22 (seeded) | `[1]`; parallel pair; `C₃` | π₁ is `1`, `ℤ`, `C₃`; omitting 2-cells gives `F₂` | Pass; carried [r5] |
| 1.25 (seeded) | `[1]` with `ℤ → 0`; discrete pair | H₀ is `0` and `M ⊕ N`, higher vanish, equal to the derived colimit | Pass; carried [r5] |
| 2.2 (seeded) | `PS² → S²` | `π₂(PS², ΩS²) = π₁ΩS² = ℤ = π₂S²` | Pass; carried [r5] |
| 2.3 (seeded) | identity of a 2-point space; `* → S¹` | strict fibre `*` versus homotopy fibre with π₀ `= ℤ` | Pass; carried [r5] |
| 3.15 (seeded) | `S¹`, `T²` | π₁ is `ℤ`, `ℤ²`; conjugation trivial | Pass; carried [r5] |
| 3.23 (seeded) | degree-d self-map of `S¹` | homology isomorphism iff `d = ±1`; `d = 2` has cokernel `C₂` | Pass; carried [r5] |
| 3.30 (seeded) | `id_{A₅}`; `A₅ → 1` | multiplier maps `id_{C₂}` and `0`, the same as the π₂ maps | Pass; carried [r6] |
| 3.33 (seeded, headline) | `1 → C₂ → 2·A₅ → A₅ → 1` | `π₂(B(2·A₅)⁺) = 0`; `π₂(BA₅⁺) = C₂ ≅ π₁BC₂` | Pass; carried [r6] |
| 4.5 (seeded) | ℕ; zero monoid | group completions `ℤ` and `0` | Pass; carried [r5] |
| 4.7 (seeded) | ℕ acting by translation | pushforward `x ↦ x+1`, composite `x ↦ x+2` | Pass; carried [r5] |
| 7.25 (seeded) | constant `Hℤ` tower; `(s,t) = (0,2)` | `F₀ = Hℤ`, `F_s = 0`, lim¹ `= 0`; d₁ lowers the stem 2 → 1 | Pass; carried [r5] |
| 2.31, 2.34, 3.7, 3.10, 3.25, 3.28, 4.29, 5.17 (headlines) | as in [r6] | as in [r6] | Pass; carried [r6] |

[r6]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~6.md
[r5]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~5.md
[r4]: packages/StableHomotopyKTheory/reports/PRREVIEW-StableHomotopyKTheory~4.md

**Remarks on untouched text (no change requested).**

- §7.10's locator "(S II, Remark 5.9, p. 258.)" supports only that lim¹ measures how far a homotopy colimit is from unique. The remark refers to a placeholder citation, printed as "[...]" (S line 13601), for its example. The ×p computation itself now rests on Tau Ceti `Padic.lean`.
- `README.md:941` (§2.34) still contains the doubled phrase carried from [r6].

## Not verifiable

- Thomason (1979), Theorem 1.2 (§2.29): the journal copy is paywalled. It was checked through Kahn's Theorem 1.4.3 in [r6].
- The 14 seeded targets outside the changed passages were not reread at their sources this round. Their rows are carried from [r5]/[r6].
- Limits carried from earlier reports: the Barratt–Eccles Γ⁺-structures I approximation proof (paywalled), and the structure-map details of Schwede's Waldhausen iteration (a source gap already recorded).

## Source issues

- **Misprint** in S at the proof of Theorem II.8.3, printed p. 297 (S line 15805): the source writes the lim¹ term of the homotopy-limit Milnor sequence as lim¹ of πₖ of the suspension of each Postnikov section; it should be lim¹ of πₖ₊₁ (πₖ of the desuspension), as in W IV 2.9 (W IV line 967); affects nothing.
- **Gap** in S at the proof of Theorem II.8.3, printed p. 297 (S lines 15796 and 15804): the source takes the homotopy-limit notion and its Milnor sequence from placeholder references, while Lemma 5.6 proves only the homotopy-colimit form; it should prove or cite the tower-limit Milnor sequence; affects the proof.
