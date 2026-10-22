<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/166#issuecomment-6348196741 -->
Red team round 2 pass b (claude) of 9a5eed8

Verdict: needs_changes

1. **F01** (P2) The composite sign law has an earlier owner on the board, and the downstream paragraph reverses the supply direction

   **Location:** `packages/MultiquadraticPartII/README.md:927`–`932`: “The Hecke-period interfaces belong to AnalyticNumberTheoryPartI, Layer 2; the Nielsen surfaces `F_A` of narrow classes and their genus-weighted integrals belong to AutomorphicSpectralTheory §4.17a. These are analytic applications of the normalizations described here.” Also `README.md:435`–`447` (2.1) and the Scope list at `README.md:23`–`55`.

   **Claim:** Since the intake placed this roadmap at the end of the board's merge order (main, line 191), both roadmaps named as consumers precede it (AutomorphicSpectralTheory line 79, AnalyticNumberTheoryPartI line 80). AutomorphicSpectralTheory §4.17a states, as its own target, the genus character on `Cl⁺(K)` with `χ(J)=sgn(d)=sgn(d′)`: the object of 2.1 here; and AnalyticNumberTheoryPartI §2.25 consumes that value from §4.17a, not from this roadmap. So the identity of 2.1 has an earlier owner that Scope and ownership neither cites nor distinguishes in one clause, and "applications of the normalizations described here" asserts a consumption the order forbids (defect classes 6 and 13). This became live after the fix round, when the roadmap entered the order; round 1 recorded the overlap only as an observation because the roadmap was then placed before both.

   **Witness:** `TauCetiRoadmap/AutomorphicSpectralTheory/README.md:2668`–`2670` at its pull-request head `c5cfb92f8322cfdd96e1e20a651c7d7f47155941` (“Construct its narrow ideal class group `Cl⁺(K)`, with the class `J` … and prove multiplicative extension, independence of ideal representatives and `χ(J)=sgn(d)=sgn(d′)`”); `TauCetiRoadmap/AnalyticNumberTheoryPartI/README.md:1541` at head `23d3de1ceddedf160130057c5e7c58a2173a7468` (“consume AutomorphicSpectralTheory §4.17a’s real genus character, its value on J”); board `merge-order/ORDER.txt` on main, lines 79, 80, 191.

   **Exact repair text:** Add to Scope and ownership, after the GeometryOfNumbersAndQuadraticArithmetic bullet: “- **AutomorphicSpectralTheory §4.17a** states, for its real-quadratic surfaces, a genus character on `Cl⁺(K)` with `χ(J)=sgn d=sgn d′`, and AnalyticNumberTheoryPartI §2.25 consumes that value from there. Layer 2.1 here states the same identity on the pinned `genusCharFunNarrowClassGroupHom`, as the subset extension of Tau Ceti's singleton theorem, and adds the complementary-sign equality and the negative-discriminant control; it is the library form of that normalization and consumes nothing from either roadmap.” Replace the sentence “These are analytic applications of the normalizations described here.” by “Those sections state their own normalizations; the statements here are their library forms on the pinned carriers, and neither roadmap depends on this one.” (The board-level resolution, repointing §4.17a and §2.25 to 2.1 and moving this roadmap above them, is outside the package.)

2. **F02** (P3) `genusCharacter_factorSigns_boundary` is one tactic from the pinned libraries

   **Location:** `packages/MultiquadraticPartII/Suggested.lean:216`–`224`: “theorem genusCharacter_factorSigns_boundary : genusCharFun {-4} (-1) = -1 ∧ … (1 : ℤ).sign ≠ (-4 : ℤ).sign := by sorry”.

   **Claim:** Stated as a target, but it closes by a single tactic against the pinned Tau Ceti and Mathlib; every conjunct is a numeral evaluation of `primeDiscriminantCharFun` and `Int.sign`.

   **Witness:** In a probe copy at the pins the statement elaborated with no error under each of `decide +kernel`, `simp +decide [genusCharFun_def, primeDiscriminantCharFun_def, jacobiSym.at_neg_one]`, and `norm_num [genusCharFun_def, primeDiscriminantCharFun_def] <;> decide`; plain `decide` and `norm_num` alone do not close it.

   **Exact repair text:** Replace `sorry` by `decide +kernel` (verified), or delete the declaration; the README keeps the statement at `README.md:458`–`462` and the 2.1 Checks.

3. **F03** (P3) `binaryFormGenusChar_invalidCofactor` is one tactic from the pinned libraries

   **Location:** `packages/MultiquadraticPartII/Suggested.lean:459`–`464`: “theorem binaryFormGenusChar_invalidCofactor : (⟨1, 0, 2⟩ : TauCeti.BinaryQuadraticForm ℤ).discrim = -8 ∧ … genusCharFun {-4} 1 ≠ genusCharFun {-4} 3 := by sorry”.

   **Claim:** Stated as a target, but it is a four-conjunct numeral computation on the pinned carrier.

   **Witness:** In a probe copy at the pins the statement elaborated with no error under `decide`, and also under `simp [TauCeti.BinaryQuadraticForm.discrim_def, discrim, TauCeti.BinaryQuadraticForm.eval_def, genusCharFun_def, primeDiscriminantCharFun_def]` alone.

   **Exact repair text:** Replace `sorry` by `decide` (verified), or delete the declaration; the README keeps the negative control at `README.md:780`–`783` and the cofactor sentence at `README.md:761`–`764`.

4. **F04** (P3) `binaryFormGenusChar_empty` is admitted while the file proves the identical statement four lines later

   **Location:** `packages/MultiquadraticPartII/Suggested.lean:323`–`325`: “theorem binaryFormGenusChar_empty (Q : TauCeti.BinaryQuadraticForm ℤ) : binaryFormGenusChar ∅ Q = 1 := by sorry”; `Suggested.lean:419`–`424`: “example (Q : TauCeti.BinaryQuadraticForm ℤ) : binaryFormGenusChar ∅ Q = 1 := by unfold binaryFormGenusChar …”.

   **Claim:** The sorried API law and the first proved example have the same statement, so the target is already proved in the file and the example restates a theorem.

   **Witness:** In a probe copy the example's proof body, placed verbatim under the theorem's statement, elaborated with no error (`simp [binaryFormGenusChar]` alone does not close it).

   **Exact repair text:** Replace the `sorry` of `binaryFormGenusChar_empty` by the example's proof body:
   ```lean
     unfold binaryFormGenusChar
     split_ifs with h
     · simp
     · exact absurd ⟨Q.a, by simpa using isCoprime_one_right, 1, 0, by
         simp [TauCeti.BinaryQuadraticForm.eval]⟩ h
   ```
   and delete the example at lines 418–424 (the second proved example, the content obstruction, stays). Update `README.md:257`–`258` and `README.md:765`–`766` ("two proved examples") to "one proved example".

## Verified sound

Head `9a5eed8` verified on the clone. Read all 959 lines of `README.md`, all 509 lines of `Suggested.lean` (35 declarations: 1 real-bodied definition, 32 sorried theorems, 2 proved examples), `sources.toml` (two certified entries with hashes), `metadata.toml` (`topic = "math.NT"`), `review.json` and the fix report. All 33 named Lean declarations appear in the README; every backticked name of this roadmap's own in the README is declared in the file.

Elaboration of the submitted file in a probe copy at the pins: exit 0, 32 `declaration uses 'sorry'` warnings, no other diagnostic; both proved examples run. `#check @` of ten declarations in a second probe copy: each theorem carries exactly the binders its README statement names (`K`, `Field`, `NumberField`, `θ`, `d` only where mentioned; the pure-integer targets and `binaryFormGenusChar` carry no field data; `quadratic_two_boundary` carries no `d`); nothing changed against the README.

Round-1 repairs verified on this head: pass a F01 (no admitted example remains; 12 named boundary targets), F02 (`TauCeti.BinaryQuadraticForm ℤ`, `Q.eval`, `Q.discrim`, manifest pins at `Suggested.lean:16`–`17`), F03 (`README.md:582`–`585`), F04 (`_empty`, `_smul`, `_comp`, `_proper`, `_neg` at `Suggested.lean:323`–`373`), F05 (`README.md:817`–`819`), F06 (two proved examples, both on `binaryFormGenusChar`), F07 (named value targets at `Suggested.lean:440`–`507`), F08 (`sources.toml`), F09 (`README.md:230`–`236`, `851`–`861`); pass b F01 (import deleted), F02 (`README.md:927`–`931`), F03 (`README.md:44`–`47`). None re-raised. The 12 boundary targets created by the pass a F01/F06/F07 repairs are the product of a settled repair and are not raised as padding, although the acceptance-test rules would class them so.

Adversarial pass, by hand, every statement:

| Statement | Instances and values | Result |
|---|---|---|
| `ker_toClassGroup_eq_pair` | `d = 2`: `1+√2` has norm `−1`, `J = 1`, pair coincides; `d = 3`: `J ≠ 1`; imaginary `d = −1`: narrow = wide, `J = 1`; supplier `mkPrincipal_eq_one_or_eq_mkPrincipal_gen` needs no `0 < d` | sound, either signature |
| `existsUnique_wideCharacter_iff`, `wideCharacter_boundary` | trivial χ; χ(J) = −1 forces χ(J) = ψ(π J) = ψ(1) = 1; `IsSquare J` gives χ(J) = χ(B)² = 1 | sound |
| `narrowDefect_fiber_boundary` | `N(θ) = −d < 0`, so `J = 1` iff a unit of norm `−1` exists (`d = 2`: yes; `d = 3, 7, 34`: no); `d = 12` non-squarefree: `(θ) = (2)(√3)`, same criterion | sound; `0 < d` needed and present |
| `card_genusFiber_mul_twoPow`, `genusFiber_smallFactorizations` | `s = ∅` impossible (`d = 1` has no quadratic minimal polynomial); `D = 5, 8` → `2⁰`; `12, 28` → `2¹`; `60 = (−4)(−3)·5` → `2²`; imaginary `D = −4` covered by the two-signature supplier | sound |
| `genusFiber_cyclicEight_boundary` | squares `{0,2,4,6}`, fibres of size 4, quotient 2, two-torsion `{0,4}` of size 2 | sound (`ElementaryTwoQuotient` is `ModN (Additive G) 2` at the pin) |
| `genusCharacter_J_eq_sign_prod` | `D = 12`: `{−4}`, `{−3}` → `−1`; `∅`, `{−4,−3}` → `1`; `D = 136`: all `1`; `D = −4 = 1·(−4)`: signs differ, excluded by `0 < d` | sound |
| `primeDiscriminants_positive_iff` | `D = 1, 5, 8, 40, 136` pass; `12, 24` fail on `3`; `{−4,−8}` product `32` is the `heven` control; `−4` the `hD` control | sound |
| `fundamental_sumTwoSquares_iff` | `5 = 1+4`, `8 = 4+4`, `136 = 36+100`; `12` has none (`12−{0,1,4,9} ∉` squares); `9 = 0+9` non-fundamental | sound |
| `J_square_iff_sumTwoSquares`, `J_ne_one_of_prime_threeModFour` | `D = 12`: nonsquare, `h⁺ = 2h`; `136`: square, `J ≠ 1` (fundamental unit `35+6√34`, norm `1225−1224 = 1`; `x²−34y² = ±1` has no solution for `1 ≤ y ≤ 5`) | sound |
| `quadratic_two/three_seven/thirtyFour_boundary` | `(1+θ)(1−θ) = −1`; `3 ∣ 12`, `7 ∣ 28`; `34` as above | sound |
| `binaryFormGenusChar` | zero form: value `1` at `t = ∅`, `0` otherwise; `[2,0,−6]` at `{−4}`: `0`; `[1,0,−3]`, `[−1,0,3]` at `{−4}`: `1`, `−1` | real body; choice independence only via the evaluation law |
| `binaryFormGenusChar_eq_of_represents` | odd `p`: `4aQ = (2ax+by)² − disc·y²` gives `(P/m) = (P/a)` when `p ∤ a`, else `(P/c)`; `p = 2`: `b` even, `am ≡ 1 (4)` for `P = −4`, `±1 (8)` for `8`, `1, 3 (8)` for `−8`; `disc = 0`: `Q = εg·L²`, value `genusCharFun t (εg)`; `t = ∅`: both sides `1` | sound, including the `Δ = 0` extension beyond GKZ's convention |
| `binaryFormGenusChar_eq_zero_iff` | no `heven`: `t = {−4, 8}`, `δ = −32`, CRT over `p = 2` still works; `t = ∅`: `IsCoprime g 1`, value `1`; zero form, `t ≠ ∅`: both sides true | sound without `heven` |
| `binaryFormGenusChar_smul` | `μ = 0`, `t ≠ ∅`: `0 = 0·χ`; `t = ∅`: `1 = 1·1`; `μ` not coprime: content obstruction on the left, `genusCharFun t μ = 0` on the right; `disc(μQ) = δ·(μ²δ′)`, `μ²δ′ ≡ 0,1 (4)` | sound |
| `binaryFormGenusChar_comp`, `_proper` | `g ∈ GL₂(ℤ)` and `γ⁻¹` preserve the represented set, so the selecting predicates are equal by `propext`/`funext` and `Classical.choose` agrees; no discriminant hypothesis needed | sound |
| `binaryFormGenusChar_neg` | `−Q = (−1)·Q`, `genusCharFun t (−1) = ∏ sign P = sign δ`; `t = ∅`: sign `1` | sound |
| `formCharacter_eq_idealCharacter` | `N(ua+vβ) = a·Q(u,−v)`; `𝔟 = α𝔞⁻¹` of norm `|m|`; exponent parity `[m<0]+[am<0] ≡ [a<0]`; `a = 0` impossible (`D` fundamental `> 1` is not a square); `ω ↦ −ω` conjugates `𝔞`, inverse class, same value; `D = 12`, `Q = [3,0,−1]`: `𝔞 = 3ℤ+√3ℤ = √3·𝒪_K`, class `J`, `χ_{−4}(J) = −1 = χ_{−4}(Q)`; `Q = [−1,0,3]`: `𝔞 = 𝒪_K`, oriented class `J`, value `−1` | sound in all four sign cases |
| `formCharacter_empty`, `_discriminantFive`, `_discriminantTwelve_orientation`, `_negFifteen_classes`, `_discriminantTwelve` | `𝒪_K = ℤ[√3]`, ideals `𝒪_K`, `(θ)`, `𝒪_K`; `x² − 3y² ≡ −1 (3)` impossible; `T•[1,0,−3] = [1,−2,−2]` and `S•[−1,0,3] = [3,0,−1]` by the pinned `smul_a/b/c` and by `decide` in the probe; `(5/2) = −1`; `ℤ[(−1+√5)/2] = 𝒪_K` | sound |

Checks: all 40 bullets recomputed (signed factorizations `12 = (−4)(−3)`, `24 = (−8)(−3)`, `28 = (−4)(−7)`, `60`, `136 = 8·17`, `−15 = 5·(−3)`, `48 = (−4)(−12)`, `−8 = (−4)·2`; Kronecker values `χ₄(−3) = 1`, `χ₄(3) = −1`, `χ₄(−1) = χ₈′(−1) = −1`, `χ₈(−1) = 1`; two-square representations; cyclic-eight counts; the `D = 12` ideals and oriented classes `1, J, J`; the `T` action). None false, vacuous or a restatement; the definition has seven discriminating Checks.

Locators: 16 verified against the cached legal copies, page markers checked (`duke-imamoglu-toth` page N = printed N+948; `gross-kohnen-zagier` pages 25, 26, 28 = pp. 508, 509, 510). `duke-imamoglu-toth`: line 78 (p.950, `h(D)` narrow), lines 86–91 (p.951, `Cl = Cl⁺/J`, norm-unit criterion, `p ≡ 3 (4)` obstruction), 117–118 (p.951, primitivity at fundamental `D`), 123–137 (p.952, correspondence with `a > 0`, table (2.3)–(2.5)), 412–415 (p.959, (4.1)–(4.2)), 416–426 (Theorem 2, p.959), 431–446 (p.960, (4.4), principal genus iff two squares), 947 and 960–963 (p.971, descent after (7.7)), 964–989 and 999 (p.971, genus characters, `χ(J) = sign d = sign d′`, before (7.8)), 1334–1345 and 1356 (p.978, form character, `χ(Q) = χ(A)`, before Proposition 5). `gross-kohnen-zagier`: lines 299–303 (p.503, nonzero discriminants, prime discriminants), 487–499 (p.508, definition, imprimitive extension, zero value), 502–515 (Proposition 1), 521–540 (p.509, odd and dyadic argument). Every locator supports the statement as written; `sources.toml` locators and `cited_for` match.

Suppliers: 44 Tau Ceti and Mathlib declaration names and the module paths of the supplier contracts exist at the pins (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, `6b7abb3c7686292736be2955bd3eb9ebf63b456a`) with the hypotheses the README states: `mkPrincipal_eq_one_or_eq_mkPrincipal_gen` and `narrowTwoRank_eq_ncard_ramifiedPrimes_sub_one` need no sign (0.1, 1.1 claim either signature); `toClassGroup_injective_iff_exists_norm_eq_neg_one` and `genusCharFunNarrowClassGroupHom_mkPrincipal_gen` need `0 < d` (present in 0.1-boundary, 2.1, 2.5); `adjoin_halfGen_eq_top_of_mod_four_eq_one` and `adjoin_gen_eq_top_of_mod_four_ne_one` take `hmin`, `hgen`, `hsf` and the congruence; `eval_smul` is `γ • f = f ∘ γ⁻¹`. Sibling citations on `main`: `TauCetiRoadmap/IntegralLattices/README.md:981` (Layer B), `:1032`–`1037` (B2 with the `a < 0` clause), `:2275` (the `Δ = 12` orientation witness); `TauCetiRoadmap/GlobalNumberFields/README.md:565` (Layer 11), `:578` (`NarrowPic`); `Completed/Multiquadratic/README.md:124` (maximal totally real subfield). A second folder `Completed/IntegralLattices` (a different roadmap, 430 lines) exists on `main`; the README's link resolves to the active one, which holds Layer B. GeometryOfNumbersAndQuadraticArithmetic at head `465728d5df6ed3f673e977b303f3ef920b50dc46` line 2234 consumes the forms and cites IntegralLattices Layer B, with no form character; EffectiveClassNumbers at head `323dd362f7dc42a9e7254a6f17f9531a8adfb199` consumes `TauCeti.BinaryQuadraticForm` with no form character; the AnalyticNumberTheory board package (its pull-request head `0ac1ec8fc43118ecf8db68ab722b619c1d3ab6ab`) has no `AN.4` and forwards its Layer 2 genus sections to AnalyticNumberTheoryPartI. No duplicate of `binaryFormGenusChar` at the pins or on `main`.

Policy: title lower-case with no proper names; no process words, issue or pull-request numbers, `set_option`, `lemma`, LaTeX delimiters, or `def := sorry`; imports are `import Mathlib` plus two `TauCeti.*` modules, both used; one definition with two proved examples (F04 reduces this to one); every target has a locator. Merge order: absent from the branch's `merge-order/ORDER.txt` (imported package); present on the board's `main` at line 191.

```text
depcheck: 14 roadmaps, 101 edges, 0 problem(s)
```

## Not verifiable

- One-tactic probes for the other 29 sorried theorems: 26 mention a field carrier or the choice inside `binaryFormGenusChar` and are not one-tactic consequences by inspection; `primeDiscriminants_boundary`, `fundamental_sumTwoSquares_boundary` and `genusFiber_cyclicEight_boundary` were tried with `decide`, `norm_num` and `simp` and did not close (goals remain on prime divisibility, `¬∃ x y, 12 = x² + y²`, `¬Squarefree 9`, and `Nat.card` of the `ModN` quotient).
- Ownership against open roadmap pull requests other than AutomorphicSpectralTheory, AnalyticNumberTheoryPartI, GeometryOfNumbersAndQuadraticArithmetic, EffectiveClassNumbers and the AnalyticNumberTheory board package was not checked.
- The full gate beyond `--depcheck` wants a content-repository worktree with the roadmap folder, which an imported package does not provide.
