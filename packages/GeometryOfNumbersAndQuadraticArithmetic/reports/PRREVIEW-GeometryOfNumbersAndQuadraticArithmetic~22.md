# Review of GeometryOfNumbersAndQuadraticArithmetic (pull request #3027 at cd99c75)

**Verdict:** accepted

**Summary.** This re-review covers the 76 lines changed since `0b5086d`, and the changes are correct. `Suggested.lean` now states Landherr's theorem, 2a.1 and 2a.2, in Gram matrices. Both statements match the README, held in every instance computed below, and elaborate with `sorry` as their only warning. The repairs to 2.7.5 (every F), 2.7.6 (b) (modulo 𝔓) and 3.2.9 (b) (n = 0) are correct and agree with Kirschmer 2016 at the cited places. All five points of the previous review are repaired. There are no findings, small corrections or format notes. One fact about the sources, unchanged from the previous review, is left for the human reviewers.

## Previous findings

- R01 — repaired: `Suggested.lean` now has a section headed "Layer 2a: Hermitian forms over a quadratic extension of number fields". It declares `hermitian_congr_iff_forall_place` and `exists_hermitian_localizations_iff`, and the module docstring adds "Landherr's theorem … (Layer 2a)".
- C01 — repaired: 2.7.6 (b) now reads "the Gram matrix is congruent modulo `𝔓` to the other diagonal one; … `w_i ≡ u_i mod 𝔓`, so `w_i ≡ u_i mod π`, both lying in `O_{F₀}` and `𝔓 ∩ O_{F₀}` being `πO_{F₀}`".
- C02 — repaired: 2.7.5 (a) now reads "For every F (split, unramified, or ramified with q odd or even)", and (b) is unrestricted. The proof adds "which gives an orthogonal sum of modular lattices of rank one or two, and group the summands of equal scale".
- C03 — repaired: the description now lists "a new Layer 2a on Landherr's theorem …; §2.9 retitled and its standing hypotheses widened; … §§2.2.6 and 2.5.7; … §§3.2.8–3.2.9". Its list of `Suggested.lean` changes names the two Landherr declarations.
- N01 — repaired: 3.2.9 (b) now reads "for `n = 0`, `β = 1`, the value of `q^{−n(n−1)/2}·|O(L/𝔓L)(k_{F₀})|` at `n = 0`".

## Verified sound

| Statement | Instances tried | Values computed (each side) | Result | Change |
|---|---|---|---|---|
| 2.7.5 (a), ramified dyadic case | ℚ₂(i): Gram `[[2,1],[1,2]]`; `⟨1⟩ ⊥ H(1)` with `H(e,f) = 1+i` | no H(x,x) generates O_F, plane det 4−1 = 3 unit, splits; components (1, 0), (2, 1) | holds; Kirschmer Thm 3.3.3 covers it | none |
| 2.7.5 (b), invariance for every F | `⟨1⟩ ⊥ H(1)` over ℚ₂(i) | dim of (𝔓^j L^∨ ∩ L + 𝔓L)/𝔓L: j=0: 3, j=1: 2, j=2: 0, so n₀ = 1, n₁ = 2 | holds | none |
| 2.7.5 proof, grouping by scale | two 𝔓^a-modular summands | (L₁ ⊥ L₂)^∨ = 𝔓^(−a)L₁ ⊥ 𝔓^(−a)L₂ = 𝔓^(−a)(L₁ ⊥ L₂) | holds | none |
| 2.7.6 (b) uniqueness, modulo 𝔓 | ℚ₃(√−3): Gram `[[1, π_F],[−π_F, 1]]` against diag(1, 1) | w₁ = 1, w₂ = 1 − N(π_F) = −2 ≡ 1 mod 3; −2 ∈ 1 + 3ℤ₃ is a square | holds | none |
| 3.2.9 (b), n = 0 and n = 1 | n = 0; n = 1 | q⁰·#O₀ = 1 = β; q⁰·#O₁ = 2 = 2·(empty product) | holds | none |
| `hermitian_congr_iff_forall_place` (2a.1) | ℚ(i): diag(1,1) vs diag(1,2), diag(1,1) vs diag(1,3); n = 0 | B = diag(1, 1+i) gives diag(1,2); at v = 3, 3 not a norm (inert, odd valuation), so both sides false; n = 0: true ↔ true | holds; matches README | none |
| `exists_hermitian_localizations_iff` (2a.2) | ℚ(√−3), n = 2: δ₂ alone; localizations of diag(1,2) | non-norm places {2}: count 1, no M; {2, 3}: count 2, M = diag(1,2), B = I | holds; matches 2a.2 Check | none |
| 2a.2 at real, split, n = 0 | ℚ(i), Mi∞ = diag(1,−1), Mf = I; split v; n = 0 | det −1 ≠ ‖z‖²: count 1, global ⟨1,−1⟩ fails at 2; split det (c,c) = N((c,1)); n = 0: count 0, empty M | holds; `hn` not needed | none |
| 2a.2 count, infinite set | infinite set of non-norm finite places | `Set.ncard` gives 0 (even), so the right side would hold spuriously | excluded by `hfin` | none |
| `Suggested.lean` | elaboration at the pins | 23 `sorry` warnings (21 + 2 new), no errors | holds | none |

The rows for statements this change leaves untouched stand as in the previous review, of `0b5086d`.

- Source locators read against the text: Kirschmer 2016, Theorem 2.4.1 (p. 20), Remark 3.4.2 (3) (p. 40), Algorithm 3.3.2 and Theorem 3.3.3 (pp. 31–32), Proposition 3.3.5 (pp. 32–33). That is 5 locators. None of the 15 seeded targets is in the changed passages.
- Library declarations opened at the pin: `Algebra.IsQuadraticExtension` (Mathlib `LinearAlgebra/Dimension/StrongRankCondition.lean`:666), `Algebra.TensorProduct.map` (Mathlib `RingTheory/TensorProduct/Maps.lean`:534), and the `Algebra K v.Completion` instance at an infinite place (Mathlib `NumberTheory/NumberField/Completion/InfinitePlace.lean`:215). Neither pinned Mathlib nor pinned Tau Ceti has Landherr's theorem or a hermitian Hasse principle.
- Elaborated types: `#check @` was run on both new declarations, and every binder of README 2a.1 and 2a.2 is present. The ten declarations whose section binders looked lost are untouched, and in each the hypotheses survive as unnamed arrows. `latticeCoveringRadius` needs only a norm.
- Cross-roadmap citations resolved: HermitianFormsAndLattices at this head cites 2a.1–2a.5 and 2.7.5 here as "*Corollary of:*" (its README lines 932, 987, 1069, 1111, 1449, 2686).
- Dependency check: `depcheck: 132 roadmaps, 1478 edges, 0 problem(s)` (no UPWARD or CYCLE line).
- Every file the pull request changes, 122 in all, lies in one of its own roadmap folders.
- Overlap check: read HermitianFormsAndLattices (on main and at this head) and the open-roadmap and on-main matches for "Landherr". Landherr's theorem is owned here (2a.1, 2a.2); HermitianFormsAndLattices cites it. That roadmap's `Suggested.lean` also states the same two Gram-matrix statements in its own namespace, which its own review settles. No other roadmap mentions Landherr. The rest of the overlap check stands as in the previous review.

Source independence: changed passages only. Six passages were compared with one source, Kirschmer 2016: the new 2.7.5 (a), (b) and proof sentence; the 2.7.6 (b) uniqueness step; the 3.2.9 (b) n = 0 clause; and the two new Lean docstrings. No wording is shared. The changed lines carry five locators: Landherr 1936 twice, Kirschmer 2016 twice and O'Meara 1963 once, so the largest share is Kirschmer 2016 with 2 of 5. The arrangement was not compared again, because the change adds, removes and reorders no layer.

Research link: Layer 2a and 3.2.8–3.2.9 give Landherr's classification and the Gan–Yu local densities of hermitian lattices. These feed the mass formula for hermitian lattices (Gan–Hanke–Yu 2001; Kirschmer 2016, Theorem 4.2.3) and Kudla's coherent and incoherent collections (Kudla 1997). This rests on the README's motivation and sources, and on Kirschmer 2016 Chapter 4.

## Not verifiable

- Landherr 1936, cited in both new docstrings, is on a publisher's page only. Both statements were checked mathematically and through Kirschmer 2016, Theorem 2.4.1 and Remark 3.4.2 (3).
- O'Meara 1963, §91, cited for the invariance of the Jordan type, is a Springer book with no open text. The invariance argument was checked directly, and it agrees with Kirschmer 2016, Theorem 3.3.3.

Automatic checks set aside as false positives: run without the pull request's list of its own folders, the check that nothing changes outside the roadmap folder under review flags 120 files. Every one lies in a roadmap folder that this pull request revises and that has a review of its own. When a pull request revises several roadmaps, the check should accept the files in all of them.

## Source issues

- **Misprint** in Kirschmer2016 at Remark 3.4.2 (3), p. 40: the source defines the signatures n_i only at the s real places where b is negative, then recovers the space from n_1, …, n_r, with r the number of real embeddings; it should be n_1, …, n_s; affects nothing.

## For the human reviewers

- The changed text's most-cited source, Kirschmer 2016, is a Habilitationsschrift hosted on the author's page (README References). The published primary sources it quotes for these theorems (Landherr 1936, Jacobowitz 1962, Shimura 1964, Gan–Yu 2000) are paywalled and were not read.
