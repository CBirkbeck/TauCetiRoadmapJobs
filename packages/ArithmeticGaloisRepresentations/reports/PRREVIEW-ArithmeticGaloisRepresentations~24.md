# Review of ArithmeticGaloisRepresentations (pull request #856 at a67c355)

**Verdict:** needs changes

This is an incremental re-review of the 105 changed lines since `c0cf462`: `README.md` §§1.8, 1.11, 5.3, 7.8 and References, and two docstrings in `Suggested.lean`. All three previous findings are repaired. The new §7.8 proofs are correct; I recomputed them below. One P3 defect remains: the rewritten §7.8 routes use inputs that no *Needs:* line records. The gate passes and the dependency check is clean.

## R01 (P3) — The rewritten §7.8 routes name inputs that no *Needs:* line records

**Location:**
- `TauCetiRoadmap/ArithmeticGaloisRepresentations/README.md:5133–5134`: "split `Sym^a V ⊗ V ⊗ Sym^{b−1}V` by Pieri on either side and cancel the common summand `det ⊗ Sym^a V ⊗ Sym^{b−2}V` by Krull–Schmidt".
- `README.md:5150–5152`: "both sides have characteristic polynomial `∏_{|d| < n} (X − (β/α)^d)^{n−|d|}`, so §1.8 applies".
- Neither **Pieri and Clebsch–Gordan** nor **Modulo `p`** has a *Needs:* line. Layer 7's Dependencies (`README.md:5559`) do not name Krull–Schmidt.

**Claim:** the inputs of these two routes are recorded.

**Witness:**
- Krull–Schmidt is at the Tau Ceti pin as `TauCeti.exists_linearEquiv_directSum_isIndecomposableModule` and `TauCeti.exists_equiv_linearEquiv_of_directSum` (`RingTheory/KrullSchmidt/DirectSum.lean:152`, `:202`). Neither is cited here.
- §1.8 is used, but no line of this target names it.
- The next target's *Needs:* line (`README.md:5194`) shows the expected form.

**Repair:**
- After the Pieri paragraph (`README.md:5137`), add: "*Needs:* Tau Ceti `TauCeti.exists_linearEquiv_directSum_isIndecomposableModule` and `TauCeti.exists_equiv_linearEquiv_of_directSum` (Krull–Schmidt for the finite-dimensional, hence finite-length, `k[Γ]`-modules involved)."
- After the **Modulo `p`** paragraph (`README.md:5153`), add: "*Needs:* §1.8; **Pieri and Clebsch–Gordan**."
- Add the two Tau Ceti names to Layer 7's Dependencies.

**Test:** take `a = b = 2` in characteristic 5, where `4! = 24` is invertible.
- `Sym²⊗V⊗V ≅ (Sym²⊗Sym²) ⊕ (det⊗Sym²)`, and also `≅ Sym⁴ ⊕ det⊗Sym² ⊕ det⊗Sym² ⊕ det²`.
- Refine each summand into indecomposables, then apply `exists_equiv_linearEquiv_of_directSum` to these two decompositions of one 12-dimensional module. Cancelling `det⊗Sym²` gives `Sym²⊗Sym² ≅ Sym⁴ ⊕ det⊗Sym² ⊕ det²`, with dimensions `9 = 5 + 3 + 1`.
- That cancellation is exactly the cited input.

## Previous findings

- **R01 — repaired.**
  - `README.md:1242–1248` now reads "by Amitsur's formula the characteristic polynomials at the elements of `Γ` determine the determinant of `k[Γ]` (Chenevier, formula (1.5) and Cor. 1.14, pp. 14–15) … (Chenevier, Thm 2.12 and Cor. 2.13, pp. 28–31); over a general `k` it follows by the descent target above."
  - The docstring at `Suggested.lean:87–90` matches.
- **R02 — repaired.**
  - `README.md:1442–1450` now reads "BHKT, Proposition 3.10 and the remark after its proof, pp. 10–11, states them for the ring of integers of a finite extension of `ℚ_ℓ`. Its proof uses only that `O` is an excellent DVR … Seshadri 1977 … Theorem 3 … Proposition 3 … Lemma 2".
  - Seshadri 1977 is now in References (`README.md:5757`) and recorded in the manifest as uncertified.
- **R03 — repaired.**
  - `README.md:5174–5196` now reads "This is proved here from **Modulo `p`** and Pieri … This is proved here. Scalars act trivially on `ad ρ̄` … *Needs:* **Pieri and Clebsch–Gordan**, **Modulo `p`**, §1.8, §4.4".
  - CHT is kept only on the irreducibility and decomposition clauses.

## Verified sound

**Gate, dependency check, diff, elaboration.**
- The prescribed gate on this head prints `set_option=0 … depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK` (exit 0). The worker's run adds `build=0`.
- The dependency check prints `depcheck: 239 roadmaps, 2371 edges, 0 problem(s)` (exit 0), with no UPWARD, CYCLE or `moved:` line. This roadmap is on line 57 of the merge order.
- `changes.md` lists no file changed outside the folder.
- `lake env lean Suggested.lean` exits 0 in 15.2 s with exactly 20 `declaration uses sorry` warnings and nothing else.
- I put `#check @name` for all 33 declarations in one scratch file and elaborated it: 33 outputs, 0 errors. Only docstrings changed, so every type is identical to the previous head and matches its README statement.
- The `signatures.md` lead on `isEnormous_symPower` (dropped `[Fintype n] [DecidableEq n]`) is again a false positive. The theorem binds its own `n : ℕ` (`Suggested.lean:470`), which shadows the section's `n : Type` (`:381`).
- **Padding probe:** in a scratch copy I replaced every `sorry` with `first | (simp; done) | rfl | infer_instance | trivial | decide`. That gives 20 errors, at exactly the 20 tactic sites (lines 74, 85, 97, 146, 175, 207, 240, 253, 268, 287, 309, 325, 340, 367, 429, 440, 449, 458, 478, 497). None closes in one tactic.

**Headline coverage.** This is unchanged from the previous report:
- recognition, odd absolute irreducibility, adequacy and enormity, Brauer–Nesbitt, Dickson, image algebra and descent, Carayol, Frattini, the multiplicative criterion, Serre's wild bound and Tate lifting are all stated;
- the module docstring still names the headlines that cannot be stated at the pins (the Tate-module and pairing adapters, the Weil–Deligne adapter and purity, conductors with infinite inertia image, the character-conductor comparison).

The two edited docstrings now carry the repaired locators.

**Locators verified at the changed passages** (texts in the sources cache):

| Passage | Locator | Text at the locator |
| --- | --- | --- |
| §1.8 | Chenevier (1.5), p. 14 (line 555) and Cor. 1.14 with proof, pp. 14–15 (lines 593–600) | The determinant of a sum is a signed sum of monomials in `Λ_i(w)`, with `w` words in the elements, so characteristic polynomials at elements of a monoid determine `D` |
| §1.8 | Thm 2.12, p. 28 (line 1165), Cor. 2.13, p. 29 (line 1171, "a group (or a unital monoid)"), end of proof, p. 31 (lines 1263–1268) | `D` determines the semisimple representation over an algebraically closed field |
| §1.8 | DDT Prop. 2.6(b), p. 53 (line 2009) | `G_ℚ`, `k` finite |
| §1.11 | BHKT, paragraph before Prop. 3.2 and Prop. 3.2, p. 8 (lines 335–346, proof "[Ses77, Theorem 3]") | The field case |
| §1.11 | BHKT §3.2, `E` a coefficient field (line 436; line 225: a finite extension of `ℚ_ℓ`) | The DVR is `O_E` |
| §1.11 | BHKT Prop. 3.10, pp. 10–11 (lines 448–467); proof (lines 468–474) | Uses Ses77 Prop. 3, Thm 3, Lemma 2 and "`O` is excellent, hence universally Japanese". The only other step, "finite torsion-free over `O` is free", holds over every DVR |
| §1.11 | BHKT, remark after the proof (lines 478–481) | Bijection on `K`-points; invariant algebras not isomorphic in general |
| §1.11 | Seshadri 1977 in References | Matches BHKT's bibliography (line 3452: Adv. Math. 26(3), 225–274) |
| §5.3 | Deligne–Serre Lemme 3.2 and proof, p. 513 (lines 231–253) | Coefficients `ℂ`, finite, or finite over `ℚ_ℓ`; a set of primes of density 1; footnote (1) (line 265) fixes Artin's arithmetic Frobenius |
| §5.3 | Chenevier Ex. 2.31, p. 38 (lines 1555–1559) | Continuity on a dense subgroup. The README applies it to a dense subset, which the same argument covers, since the characteristic-polynomial map is continuous into a Hausdorff `E` |
| §7.8 | CHT Lemma 2.5.2, p. 56 (lines 2687–2696) | `l > 2n − 1`; `ad Sym^{n−1} ≅ 1 ⊕ Sym² ⊕ ⋯ ⊕ Sym^{2n−2}` as an `SL₂(F_l)`-module, each factor irreducible as `2n − 2 ≤ l − 1`. This matches the narrowed citations "states the resulting decomposition … for primes `ℓ > 2n − 1`" and "for the even `a` and `F = F_p`" |

**Pinned declarations opened.**

| Declaration | File:line at the pin | Elaborated type |
| --- | --- | --- |
| `Matrix.SL2.commutator_eq_top` | Mathlib `LinearAlgebra/Matrix/SpecialLinearGroup.lean:804` | `a ≠ 0 → a ^ 2 ≠ 1 → commutator SL(2, F) = ⊤`; holds for `#F ≥ 4`, so for `p ≥ 5` |
| `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple` | Mathlib `LinearAlgebra/Projectivization/PSL/PSL2.lean:139` | `4 ≤ Nat.card F → IsSimpleGroup PSL(2, F)` |
| `IsCyclotomicExtension.Rat.galEquivZMod` | Mathlib `NumberTheory/NumberField/Cyclotomic/Galois.lean:60` | `Gal(K/ℚ) ≃* (ZMod n)ˣ` |
| `LinearMap.charpoly_baseChange` | Mathlib, `#check` | Free and finite carriers |
| `Matrix.trace_eq_neg_charpoly_coeff` | Mathlib, `#check` | — |
| `TauCeti.exists_equiv_linearEquiv_of_directSum` | Tau Ceti `RingTheory/KrullSchmidt/DirectSum.lean:202` | Krull–Schmidt uniqueness, `[IsNoetherian A M] [IsArtinian A M]` (R01) |
| `TauCeti.exists_linearEquiv_directSum_isIndecomposableModule` | Tau Ceti `RingTheory/KrullSchmidt/DirectSum.lean:152` | Krull–Schmidt existence (R01) |

**Consumers of the changed passages.**
- Within the README:
  - §7.9 **Symmetric powers** (`README.md:5287–5299`) consumes §7.8. Clause (2) needs the **Modulo `p`** sequence for `φ_p Std ⊗ Sym^{r−1}`, which is unchanged. Clause (3) needs irreducibility for `n − 1 ≤ p − 3`, inside the new `a ≤ p − 1` range.
  - §7.10 **Enormous symmetric powers** (`README.md:5361`) consumes §7.7 and §7.8; the decomposition it needs is unchanged.
  - §5.6 **Forms** (`README.md:3631`) and §5.9 recognition (`README.md:3911`) consume the statements of §1.8 and §5.3. Those statements are unchanged; only the locators moved.
- Across roadmaps: `roadmaps grep` finds one external consumer. AlgebraicModularFormsAndSerreWeightsPartII imports "§7.8 the absolute irreducibility of `Sym^d(F̄_p²)` under `SL₂(F_p)` for `0 ≤ d ≤ p − 1`" (its README lines 1128 and 1152). The new statement for `SL₂(F)`, `F ⊇ F_p` finite, contains it.
- No bold target heading was renamed. `scratch/overlaps.md` lists no other open pull request changing this folder and no dropped or revision-only id.

**Ownership.** The change introduces no new object. I searched for the Clebsch–Gordan and Pieri objects with `roadmaps grep`:
- RepresentationTheory, ClassicalGroups, SpinRepresentations and LieHighestWeight own the minuscule and dual-standard Pieri rules for highest-weight `gl_n` modules;
- §7.8 here owns the plane `V` over a field of characteristic `p` with an arbitrary acting group.

These are different objects, so §7.8 keeps its single owner.

**Seeded sample.** None of the sampled targets (1.4, 1.9, 2.1a, 2.5a, 3.0, 4.1, 4.6, 5.6, 5.9, 5.10, 6.4a, 7.4, 7.7, 7.9, 7.12) lies in a changed passage. §5.6, §5.9 and §7.9 consume changed passages, and their consumption is checked above.

**Adversarial table, changed statements.** Matrices act on columns, and `x, y` is the standard basis of `V`.

| Statement | Instances and computed values | Result |
| --- | --- | --- |
| §1.8 Brauer–Nesbitt, `iso_of_charpoly_eq` (new route and locators) | Amitsur in rank 2: `det(g+h) = det g + det h + tr g·tr h − tr(gh)`. For `g = diag(1,2)`, `h = (0 1; 1 0)`: the left side is `det(1 1; 1 2) = 1`; the right side is `2 − 1 + 3·0 − tr(0 1; 2 0) = 1`. Monoid `ℕ`, `g ↦ (0 1; 0 0)` against `g ↦ 0` on `k²`: both have `X²` at `g^m` (`m ≥ 1`) and `(X−1)²` at `1`, and equal semisimplifications, but only the second is semisimple. Descent from `k̄`: previous report's argument | Holds |
| §1.11 quotients over an excellent DVR | `O = ℤ_(p)` (excellent, not of BHKT's form `O_E`). `G_m` on `𝔸²` with weights `1, −1`: invariants `O[xy]`, reducing to `F_p[xy]`, the `F_p`-invariants. `SL₂` by conjugation: invariants `O[tr]`; at `K = F̄_p`, `(1 1; 0 1)` and `1` both map to `tr = 2`, and the first orbit's closure contains `1`. `C₂` on `ℤ₂[x]`: `F₂[x²] ≠ F₂[x]`, and no isomorphism of invariant algebras is asserted, matching BHKT's remark | Holds |
| §5.3 recognition, `iso_of_frobenius_charpoly_eq` (locators) | DS's setting is exactly `ℂ`, finite, or finite over `ℚ_ℓ`, with density 1 and no finiteness of ramification. Dense subset, not a subgroup: `Γ = ℤ_p`, `D = ℕ`; characters equal on `ℕ` agree on `ℤ_p` by continuity into Hausdorff `E`. `ℤ/3` over `F₄` (`2! = 0`), trace `0` against polynomials `(X−1)²` and `(X−ω)²`: the Check still excludes the trace form | Holds |
| §7.8 Pieri route | Base case `b = 1` is Pieri with `r = a + 1 ≤ a + b`. The step uses `(a+1, b−1)`, `(a−1, b−1)` and `(a, b−2)`, all with sum `≤ a + b`. Count: `Σ_{i≤b}(a+b−2i+1) = (b+1)(a+b+1) − b(b+1) = (a+1)(b+1)`. `a = b = 2`, characteristic 5: `9 = 5+3+1` (the R01 test). `End(Sym²)`: `9 = 1+3+5`. `(Sym^{n−1}V)^∨ ≅ Sym^{n−1}V ⊗ det^{1−n}` needs `(n−1)!` invertible, implied by `(2n−2)!` | Holds (R01 for *Needs:*) |
| **Modulo `p`** semisimplified `End` formula (new route) | `n = 2`: `End V` has eigenvalues `1, 1, β/α, α/β`, equal to `∏_{|d|<2}(X−(β/α)^d)^{2−|d|}`; `1 ⊕ Sym²⊗det⁻¹` gives `1` and `α/β, 1, β/α`. `n = 3`: multiplicities `1, 2, 3, 2, 1` for `d = −2, …, 2` on both sides (total 9). `p = 2`, `n = 2`: `Sym²V = Frob V ⊕ 1` for `SL₂(F₂)`, and `End V` has dimension `4 = 1 + 2 + 1` | Holds |
| Irreducibility of `Sym^a` for `SL₂(F)`, `a ≤ p − 1` (new proof) | `p = 5`, `a = 4`: `u − 1` has superdiagonal entries `1, 2, 3, 4`, all units, so the fixed line is `⟨x⁴⟩`. `C(4,j) ≡ 1,4,1,4,1 (mod 5)` are units, and `c ∈ F₅` gives a `5×5` invertible Vandermonde. `a = p = 5`: `(x+cy)⁵ = x⁵ + c⁵y⁵` spans only `⟨x⁵, y⁵⟩`, so `a = p` is correctly excluded | Holds |
| One-dimensional constituents of `Sym^{2i}`, `p ≥ 5` (new proof) | `p = 7`, `F = F₇`: trivial constituents at `2i = 0`, at `8` (`r = 2`: `V⊗V ⊇ ∧²`, with `Sym⁴` irreducible), and at `12` (`r = 6`: the `det⁶` quotient). None at `2i = 2, 4, 6`, or at `10` (`Sym⁴ ⊕ Sym²` and `Sym²`; `11 = 5+3+3`). `F = F₄₉`, `2i = 8`: `ord t = 48`, exponents `±6, ±8`, none `≡ 0 (mod 48)`. `p = 5` Check: `7 = 3+1+3` and `9 = 5+3+1`. At `p = 3`, `r = 2 = p − 1` coincide, which is why `p ≥ 5` | Holds |
| `H⁰(G_ℚ, M(1)) = 0`, `p > 3` (new proof) | `ψ` and the scalars `Sym^{n−1}(λ) = λ^{n−1}` act trivially on `ad`. `p = 5`: `PGL₂(F₅) ≅ S₅` has abelianisation `ℤ/2`, while `ε̄` has order 4. `p = 3` Check: `Sym⁴ ⊇ Frob V ⊗ V ⊇ ∧²V`, with quotient `det²`, so after `⊗det⁻²` the constituents are `Sym²⊗det⁻²`, `det⁻¹ = ε̄⁻¹ = ε̄` and `1`; then `M(1) = 1` and `H⁰ ≠ 0`, while `χ² = 1` still holds. Mathlib's `rank_two_simple` needs `4 ≤ #F₀`, which holds for `F₀ ⊇ F₅` | Holds |

**Adversarial table, untouched statements.** Each row is carried forward from the previous report (`c0cf462`), where the values were computed; the diff leaves these statements unchanged.

| Statement | Values (previous report) | Result |
| --- | --- | --- |
| `baire_descent` | `n = 0` gives `E = K`; `(1+ℓ)^a` on `ℤ_ℓ`; countably many finite extensions in `ℚ̄_ℓ` | Holds |
| `exists_integral_conj_GL` | `1 ↦ ℓ` on `ℤ` is not compact; conjugating `(1 a; 0 1)` by `diag(ℓ,1)` gives `(1 ℓa; 0 1)` | Holds |
| `isAbsolutelyIrreducible_of_isOddAt` | Characteristic `≠ 2`, eigenvalues `±1`; over `F₂`, `ρ(c) = 1` is excluded | Holds |
| `dickson_projectiveImage` | `PGL₂(F₃) ≅ S₄`; `A₅ ≅ PSL₂(F₅)`; the Klein four group is excluded by `p ∤ n` | Holds |
| `imageAlgebra_isCentralSimple`, `realizable_iff_imageAlgebra_split`, `realizable_of_charpoly_mem` | `Q₈` over `ℝ`: `B = ℍ`, dimension 4; `ℤ/3` over `F₂`: `X²+X+1` | Holds |
| `conj_into_of_trace_mem_of_distinct_eigenvalues`, `carayol_conj_of_trace_eq` | `1 ⊕ sgn` is rational; `1 ⊕ 1` against `(1 ℓt; 0 1)` is excluded by `habs` | Holds |
| `compact_matrix_frattini_isOpen` | `Φ(1+ℓℤ_ℓ) = 1+ℓ²ℤ_ℓ` | Holds |
| `multiplicative_residual_unramified_iff` | `11a1`, `v(j) = −5`: unramified at `p = 5`, ramified at `p = 3` | Holds |
| `lowerSwanConductor_le` | `ℚ₂(√2)`: `2 ≤ 2`; `χ₈`: `2 ≤ 3` | Holds |
| `isAdequate_of_coprime_or_large`, `isAdequate_tensor` | `SL₂(F₇)`: `6 ≤ 7`; `F₅`, `A = (0 4; 1 4)`, `A + 3I` is a trace-zero centraliser | Holds |
| `isEnormous_iff_isAdequate_rankTwo`, `isEnormous_of_contains_SL`, `isEnormous_symPower` | `SL₂(F₇)` both hold, `SL₂(F₅)` neither; `diag(1,2,3)` over `F₅` | Holds |
| `exists_linear_lift` | `n = 1`; `ℤ/4 → ℤ/2` | Holds |
| §§1.2, 2.4, 2.7, 3.5–3.7, 4.5, 5.4, 5.6, 5.11, 6.1, 6.4, 6.4a, 7.6, 7.10 | Values as tabulated in the previous report (for example `Δ(11a1) = −11⁵`, `ε₂ = −i·4^{1/2−s}`, `#E(F₅) = 6`) | Hold |

**Remark on untouched text** (not a finding): Layer 7's Dependencies cite `Matrix.ProjectiveSpecialLinearGroup.rank_two_simple'`, while §7.8's new *Needs:* cites `rank_two_simple`. Both exist at the pin (`PSL2.lean:124`, `:139`).

## Not verifiable

- **Seshadri 1977** is uncertified in the manifest (paywalled, cited by locator). I checked the contents of its Theorem 3, Proposition 3 and Lemma 2 only as BHKT applies them (BHKT lines 346 and 469–474). I did not check its statement that a universally Japanese base suffices.
- **Ribet 1976** (§1.8, "see also"): no legal copy, as before.
- **Jantzen, *Representations of Algebraic Groups*, II.2.16**: a book, not read. The **Modulo `p`** citation is unchanged.
- The remaining untouched locators listed under "Not verifiable" in the previous report (Serre 1972, Masser–Zannier 2020, Larsen, Bushnell–Henniart, Silverman, Milne, Schneider, the published Duke pagination of CG) were not re-read.

## Source issues

- **Misprint** in chenevier-pseudocharacters at proof of Lemma 1.12(ii), p. 14: the source spells the formula's eponym "Amistur" once, after deriving (1.5); it should be "Amitsur", as everywhere else in the text; affects nothing.
