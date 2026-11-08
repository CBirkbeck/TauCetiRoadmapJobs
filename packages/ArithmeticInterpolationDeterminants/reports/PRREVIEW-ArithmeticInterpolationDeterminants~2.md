# Review of ArithmeticInterpolationDeterminants (pull request #1905 at f4e861f)

**Verdict:** needs changes

This head repairs nine of the ten findings of the previous review and part of the tenth (status table under *Verified sound*). One finding blocks (R01, a false converse in 1.3). The other eight are P3: Checks that do not test what they claim, missing or wrong locators, four library names that do not exist at the pins, unused imports, and README bookkeeping. Every Lean statement checks out on the instances below. Nothing in `Suggested.lean` closes in one tactic.

## R01 (P2) — the non-vanishing criterion for the confluent determinant is false as an "iff"

Location: `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:495–496`, "The determinant is a unit of a field iff `a` is injective (or `M ≤ 1`), which gives 1.1 a second proof."

Claim: over a field, `det (confluentVandermonde a m) ≠ 0` forces `a` injective unless `M ≤ 1`.

Witness: `a = (0, 0, 1)`, `m = (1, 0, 1)`: `M = 2`, `a` is not injective, and the matrix `[[1, 0], [1, 1]]` has determinant `1` (the equal pair has exponent `1 · 0`). Likewise `a = (0, 0)`, `m = (2, 0)`: determinant `1`.

Repair: "Over a field the determinant is nonzero iff `a i ≠ a j` for all `i ≠ j` with `m i ≠ 0` and `m j ≠ 0`; injective `a` is the case 1.1 uses." Add `a = (0, 0, 1)`, `m = (1, 0, 1)`, determinant `1`, as a negative-control Check. Tested: the repaired criterion predicts `≠ 0` for that instance, since only the pair `(0, 2)` has positive multiplicities and `0 ≠ 1` (computed `1`). It predicts `0` for `a = (0, 0)`, `m = (1, 1)` (computed `0`).

## R02 (P3) — Checks and an example that do not test what they claim

- `README.md:599–600` (2.3): "over `ℤ[i]`, `det [[i]] = i` has coordinates `(0, 1)`, while the coordinate matrices `[[0]]` and `[[1]]` have determinants `0` and `1`". These two pairs are equal, so the Check exhibits agreement rather than failure. Repair: use `diag(i, i)`. Its determinant `−1` has coordinates `(−1, 0)`, while the coordinate matrices `0` and `I₂` have determinants `0` and `1`.
- `README.md:708–711` (3.4): "Two factors `X, X`, `a = 0`, `J = (0)`, `K = 1`" and "`f = (X), g = X^5`, `J = (0)`, `a = 0`, `K = 3`". In both, the hypothesis requires `D X (0) = 1 ∈ (0)`, which is false, so neither is an instance of the theorem. Repair: take the two factors `X, X` with `K = 0`. Then `X(0) = 0 ∈ (0)` and `X²(0) = 0 ∈ (0)²`, and `D²(X²)(0) = 2 ∉ (0)²` shows that orders above `K` are not covered. For the cofactor Check take `f = (X⁴)`, `g = X⁵`, `K = 3`: `D^k X⁴ (0) = 0` and `D^k X⁹ (0) = 0` for `k ≤ 3`.
- `README.md:810–811` (Layer 4 Examples): "row bounds `B = (1, 1, 1)` from 4.3 with `H = 1`, `A = 1`". With `A = 1`, 4.3 bounds row `(0, 1)` by `choose 2 1 · 1 = 2`, so it gives `B = (1, 2, 1)` (computed). Repair: use the per-node bounds `A = (0, 1)`, which give `(1, 1, 1)`, or keep `A = 1` with `B = (1, 2, 1)`, so that 4.1 gives `1 ≤ 12`.
- `README.md:486` (1.3 route): "lower unitriangular in `k` with diagonal entry `∏_{i' < i} (a_i − a_{i'})^(m_{i'})`". A diagonal different from `1` is not unitriangular. Repair: "lower triangular in `k` with constant diagonal entry …".

## R03 (P3) — the headline determinant formula cites a text that does not state it

Location: `README.md:496–497`, "(Laurent, §6.2, for determinants of this shape in interpolation; the formula is classical.)"; `README.md:909–910`.

Claim: Laurent §6.2 is the source for the confluent Vandermonde determinant.

Witness: Laurent lines 527–600 treat Schur polynomials and `det(exp(x_i y_j))` (Lemmes 1–2), and contain no confluent matrix. W line 5356 (proof of Lemma 3.24, p. 100) defines that matrix, and W line 5912 (Exercise 3.11, p. 111) states `± ∏_{i<j} (X_i − X_j)^(T_i T_j)`.

Repair: cite "W, proof of Lemma 3.24, p. 100, and Exercise 3.11, p. 111 (the transposed matrix, multiplicities `T_j ≥ 1`, formula up to sign)". Add one sentence saying that the sign here is fixed by the lexicographic row order (Check `a = (1, 0)`, `m = (1, 1)`: `−1`). Add these locators to W's entry in `sources.toml`. Drop the Laurent citation, or keep it only for Schur determinants.

## R04 (P3) — twelve targets carry no locator; two page locators are wrong or missing

Location: §§0.1, 0.2, 0.5, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 3.4, 4.2, 4.3 have no source citation. Seven of them (0.1, 2.2, 2.3, 3.2, 3.3, 3.4, 4.3) are in this review's seeded sample, which therefore found nothing to verify. `README.md:905–906`: "[P] … §3.3, Theorem 3.3.7 and Exercise 3.5, pp. 91–95". The M citations at `README.md:832–833`, `855–856` and `907–908` give no page.

Witness: P lines 4992–4993 show PDF page 91 = printed p. 85. Theorem 3.3.7 is on printed p. 87 (P line 5166) and Exercise 3.5 on p. 89 (P line 5272). M line 1397 (printed p. 31) opens the review, and M line 1419 is Corollary 2.20 (p. 32).

Repair:
- Cite IK Lemma 11.14, (11.22), p. 283 for the Hasse Leibniz rule of 3.4.
- Cite IK's definition of `E^k` (p. 282) for the coefficient formula of 0.2 and 4.3.
- Cite IK p. 283 (IK line 816) for the `D^[p] X^p = 1` witness of 0.4 and 0.5.
- Give the linear-algebra targets 2.1–2.3, 3.1–3.3 and 4.2 a textbook theorem number; a paywalled one is recorded as `uncertified`.
- Change the P pages to "pp. 85–89".
- Add "pp. 31–32, Corollary 2.20" to the M citations.

## R05 (P3) — four cited library names do not exist at the pins as written

Location and witness (a scratch `#check` file at the pins: 108 names, these four fail):

- `README.md:230` `MvPolynomial.pUnitAlgEquiv`: "Unknown constant". At the pin it is `MvPolynomial.uniqueAlgEquiv` (`Mathlib/Algebra/MvPolynomial/Equiv.lean:63`).
- `README.md:833` `Algebra.norm_mul`: "Unknown constant". `Algebra.norm R` is a `MonoidHom`; use `map_mul`.
- `README.md:174` and `768`: `det_gram_eq_norm_det_sq` is listed among the `Matrix.` lemmas, but `Matrix.det_gram_eq_norm_det_sq` is unknown. The lemma is `OrthonormalBasis.det_gram_eq_norm_det_sq` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:86`) and needs an orthonormal basis indexed by `ι`.
- `README.md:589` `Basis.linearCombination_repr`: "Unknown identifier". The name is `Module.Basis.linearCombination_repr` (`Mathlib/LinearAlgebra/Basis/Defs.lean:156`).

Repair: replace each name with its pinned name above.

## R06 (P3) — README and `Suggested.lean` disagree on what the Lean file states

Location: `README.md:11–14` names four end theorems, and `README.md:18–20` says "`Suggested.lean` states the headline theorems above against the pinned libraries and the three definitions they need". `Suggested.lean:13–18` says "Every headline theorem of the roadmap is statable at the pins: … (Layer 2), … (Layer 3), and the row-dependent determinant and derivative bounds (Layer 4)". `README.md:121–122` says "Matrices of this roadmap are indexed by `Fin n`".

Witness: the file states 17 theorems, 13 of them outside the README's four (e.g. `unitriangular_mul_minor`, two tactics from `Matrix.det_mul`, `Matrix.det_of_isLowerTriangular`). `coordinates_mem_extended_ideal` and `det_gram_matrix_smul` take an arbitrary finite type `ι`.

Repair: make README lines 11–20 and the module docstring say the same thing. Either the README lists, by layer, the 17 statements the file tests, or the file keeps the end theorems with the Layer 0–1 statements they rest on and the rest stay README targets. Reword the Conventions bullet: "square matrices of Layers 1–4 are indexed by `Fin n`; 2.3 and 3.3 are stated over an arbitrary finite type".

## R07 (P3) — three of the four Tau Ceti imports are unused

Location: `Suggested.lean:2–5`.

Witness: a copy importing only `Mathlib` and `TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic` elaborates at the pins with the same 17 `sorry` warnings and no error. No declaration from `Kronecker`, `HasseDeriv.Taylor`, `Matrix.AbsoluteValue` or `Gram.Hadamard` occurs in the file; `Matrix.gram` is Mathlib's.

Repair: replace lines 2–5 by `import TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic` (the file that defines `MvPolynomial.hasseDeriv`).

## R08 (P3) — the dependency paragraphs contradict the targets' `*Needs:*` lines

Location:
- `README.md:396` says "Nothing later in this roadmap depends on Layer 0." and `209–210` says "Layer 0 is used by nothing later". Against this, 4.3 says at `793–795` "Package the row bounds of a jet matrix of 0.2 or 1.3", `816–818` says "the row packaging uses 0.2 and 1.3", and 4.3's `*Needs:*` (796–798) names neither.
- `README.md:526–527` says "1.2 needs … CharacterSumsOverFiniteFields §4.1", while 1.2's `*Needs:*` (457–459) lists Mathlib only.
- `README.md:497`: 1.3 `*Needs:* 1.1`, although its statement is over any commutative ring and its Newton-basis route uses neither 1.1 nor 1.2.

Witness: the quoted lines.

Repair:
- Add 0.2 and 1.3 to 4.3's `*Needs:*` (or drop the packaging clause) and correct the two Layer 0 sentences.
- Make 1.2's `*Needs:*` and the Layer 1 paragraph agree.
- Replace 1.3's "1.1" by the Mathlib items its route uses, so that 1.3 is not blocked behind the field-only Hermite theory.

## R09 (P3) — GenericDoublePointInterpolation's first-jet map is a special case of 0.2 and is not cited

Location: `README.md:62–64` (only GenericDoublePointInterpolation §4.6 is cited); §0.2 (`README.md:246–262`).

Witness: at its open head, GenericDoublePointInterpolation §1.3 defines `firstJetMap`, `f ↦ (f(P_i), ∂_j f(P_i))`, on polynomials of bounded total degree over a commutative ring. Its §1.4 gives the matrix `firstJetMatrix`, with entries `P_i^α` and `α_j P_i^(α−e_j)`.

Repair: add to *Left to other roadmaps*: "First jets on the total-degree ball: GenericDoublePointInterpolation §§1.3–1.4 `firstJetMap`, `firstJetMatrix`." Add the one-clause difference: "0.2 admits arbitrary Hasse multi-indices and any finite support; with multi-indices `0` and `e_j` on the total-degree ball it is that map."

## Verified sound

**Previous findings (review of `7ff5274`).**

| Id | Status at this head | Evidence |
| --- | --- | --- |
| R01 sorry'd `hermiteJet` | repaired | `Suggested.lean:96–100`, "`LinearMap.pi fun i => LinearMap.pi fun k => Polynomial.leval (a i) ∘ₗ Polynomial.hasseDeriv (k : ℕ) ∘ₗ …subtype`"; gate `sorry-data=0` |
| R02 `set_option` | repaired | no `set_option`; gate `set_option=0` |
| R03 confluent determinant absent; catalogue docstring | repaired | `Suggested.lean:127–139` (`confluentVandermonde`, `det_confluentVandermonde`); docstring "…: target signatures", "The roadmap is `README.md`; this file is not the roadmap" |
| R04 padding (six declarations) | repaired | none of the six remains; one-tactic probe on the 17 remaining theorems (below) closes none |
| R05 README not in roadmap form | partly repaired | full shape now present (title, Summary, Scope, Conventions, supplier contracts, build, `### k.n`, Checks, Examples, Dependencies, consumers, references); locators still missing in 12 targets (R04) |
| R06 LaTeX, PR numbers, narrative | repaired | gate `latex=0 tex=0 prnum=0 round-labels=0`; no pull-request link in the README |
| R07 nonexistent Tau Ceti multiplicity bound | repaired | `README.md:52–56`, `180–184` cite CharacterSumsOverFiniteFields §4.1 and say the finite-set form is its contrapositive |
| R08 ANT I as consumer | repaired | `README.md:881`, "No roadmap on the main branch or earlier in the merge order cites this roadmap" |
| R09 overlapping owners | repaired | `README.md:57–71` name GrothendieckNotesLemmas §§1.3–1.4, GenericDoublePointInterpolation §4.6, IntegralIwasawaTheory §4.1c, `Ideal.quotientInfRingEquivPiQuotient` (one further owner: R09 here) |
| R10 README/Lean cross-naming | repaired | all 20 Lean names occur at their README targets (gate `readme-ids-missing=0`); every declaration has a docstring; `/-! ## Layer k -/` comments in README order |

**Gate and order.** The worker's gate on this head passes every check, including `build=0`. My rerun with `--base origin/main` gives `0` on every text and Lean check. Its only failure is `depcheck: NOT IN ORDER: ArithmeticInterpolationDeterminants (insert it after its last supplier)`, read against the default order file. That is not a finding at this stage: the candidate order lists this roadmap at line 159, right after CharacterSumsOverFiniteFields (158). Dependency check against the candidate order, as the brief gives it: `depcheck: 237 roadmaps, 2420 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. `git diff --stat origin/main...HEAD` outside the folder is empty, and the folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).

**Lean form.** `lake env lean` on `Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) gives 17 warnings, all "declaration uses `sorry`", and no errors. There is one module docstring, the namespace is `TauCetiRoadmap.ArithmeticInterpolationDeterminants`, there is no `lemma`, `#eval`, `#print` or `set_option`, and the three `def`s have real bodies on native carriers. I compared the 20 elaborated signatures (`#check @name`) with their README statements. No section binder is lost and the generality agrees, except the `Fin n` convention bullet (R06). Unused-hypothesis notes, not findings: `[Fact p.Prime]` in `iterate_derivative_powerSubstitution` (only `(p : R) = 0` is used); `Function.Injective a` in `hermiteJet_bijective` (injectivity on `{i | m i ≠ 0}` suffices).

**One-tactic probe.** Each of the 17 theorems was tried with `first | exact? | simp_all | aesop` on a scratch copy, and none closed. Targeted short proofs: `unitriangular_mul_minor` needs two tactics (`rw [show (U * A).submatrix id c = U * A.submatrix id c from rfl, det_mul, det_of_isLowerTriangular U htri]; simp [hdiag]`). The matrix identity behind `det_gram_matrix_smul` needs `ext; simp [gram_apply, mul_apply, inner_sum, sum_inner, inner_smul_left, …]`. No padding.

**Headline theorems.** From the README:
- `hermiteJet_bijective`, `all_jets_vanish_iff_dvd` (1.1–1.2);
- `det_confluentVandermonde` (1.3);
- `exists_nonzero_ordinary_jet_on_frobenius_graph` with its inputs `powerSubstitution_injOn`, `hasseDeriv_powerSubstitution` and `iterate_derivative_powerSubstitution` (0.3–0.6);
- `det_gram_matrix_smul` (3.3).

All are stated. Layer 5 is correctly left to the README (its scalar-power divisibility follows from `Algebra.norm_algebraMap`; the prime-sum bound is about bare integers).

**Library declarations opened at the pins.** 108 names `#check`ed in one scratch file. All resolve except the four of R05; `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm` is at `TauCeti/RingTheory/MvPolynomial/HasseDeriv/ChainRule.lean:232`. Read in full:
- `Matrix.gram_apply`, `posSemidef_gram`, `det_gram_ne_zero_iff_linearIndependent`, `gram_eq_conjTranspose_mul` (`Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:43, 83, 126, 131`). No change-of-family identity there or in Tau Ceti, so 3.3 is a genuine target.
- `OrthonormalBasis.norm_det_le_prod_norm`, `det_gram_eq_norm_det_sq`, `Matrix.re_det_gram_nonneg`, `det_gram_le_prod_norm_sq`, `re_det_gram_le_prod_norm_sq`, `re_det_gram_le_pow` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:77, 86, 108, 115, 139, 146`; standing binders `[RCLike 𝕜] [NormedAddCommGroup E] [InnerProductSpace 𝕜 E]`, any `E`, as the README says).
- `Matrix.abv_det_le_prod_sum_abv'`, `abv_det_le_prod_sum_abv`, `abs_det_le_prod_sum_abs` (`TauCeti/LinearAlgebra/Matrix/AbsoluteValue.lean:46, 62, 73`; `[Nontrivial R]`). These give `n^n ∏ B_i`, not `n! ∏ B_i`, so 4.1 is not restated.
- `Matrix.det_le` (uniform `n! • x^n`).
- `Algebra.norm_algebraMap` (`Mathlib/RingTheory/Norm/Defs.lean:100`).
- `finSigmaFinEquiv_apply` (`↑(finSigmaFinEquiv k) = ∑ i : Fin k.1, n (Fin.castLE _ i) + k.2`, the README's lexicographic order).
- `Matrix.linearIndependent_row_iff_isUnit` (needs `IsArtinianRing`, fine over a field).
- `Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative` (`CharZero`, as the README says).
- `MvPolynomial.coeff_aeval_X_pow_weight`, `eval_hasseDeriv_aeval_X_pow`, `abv_coeff_hasseDeriv_le`.

The deprecated `det_of_lowerTriangular` and `linearIndependent_rows_iff_isUnit` are not what the README cites. Greps for Hermite interpolation, confluent determinants, `det ∈ ∏ J_i` and full-row minors in Mathlib and Tau Ceti found nothing.

**Cross-roadmap citations resolved.**
- CharacterSumsOverFiniteFields §4.1 (open head, its README lines 1278–1286): multiplicity criterion, `hasseDeriv k (f^q) = 0` for `0 < k < q`, root-count inequality `k · #S ≤ D`. This is as cited, and 0.6 needs the contrapositive with `k = m + 1`.
- GrothendieckNotesLemmas §1.3 `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand` and §1.4 `Polynomial.hasseDeriv_expand_mul` (open head, lines 268–293). This is a new roadmap, named in the pull request's depends-on list.
- DiophantineApproximationAndTranscendence on main: §1.1 `Polynomial.l1Norm`, `|P(z)| ≤ ‖P‖₁ max(1,|z|)^deg P`, `‖DᵏP‖₁ ≤ 2^natDegree P ‖P‖₁` (lines 541–600); §1.2 `MvPolynomial.hasseDeriv` API (586); §1.4 `Polynomial.hasseWronskian` (758); §1.7 block substitution (885).
- GenericDoublePointInterpolation §4.6 `univariateHermiteRank` and IntegralIwasawaTheory §4.1c `exists_hasseDeriv_eval_eq_ite`, at their heads.

Overlaps: no other open pull request changes this roadmap, and no id is dropped in either direction.

Ownership by object: I searched with `roadmaps grep` over main and the open heads for "confluent Vandermonde", "Hermite interpolation", "power substitution", the Gram scaling identity, `det ∈ ∏` and full-row minors. Results:
- Hermite interpolation: GenericDoublePointInterpolation, IntegralIwasawaTheory, LinearFormsInLogarithms (a forbidden supplier, not cited), GlobalHolomorphicFunctions (inside a proof only) and EffectiveBoundsPartII (cites GenericDoublePointInterpolation §5.3). Only special cases, and the README's scope covers them.
- "Power substitution" in the Habiro roadmaps is a different object (`q ↦ q^n`).
- CStarAlgebras' "change-of-family formulas" are about Kraus maps.

No second owner of the general Hermite equivalence, the confluent determinant, the Gram change-of-family identity or the row-ideal lemma.

**Sources: the seeded sample.** All five manifest texts are in the cache and readable.

| Target | Source at its locator | Verdict |
| --- | --- | --- |
| 0.1 | none cited | R04 |
| 0.3 | IK Lemma 11.17, p. 284 (IK line 882): substitution `h(X, X^q)`. P Thm 3.3.7 proof and Ex. 3.5(a), printed pp. 87, 89 (P lines 5172–5176, 5272–5278): `x_i ↦ t^(d^(i−1))` injective on monomials with partial degrees `< d`, over a subfield of `ℂ`. The README's condition (only the `Z`-degree `< B`) is the `n = 2` case of the same digit argument, and characteristic-free | supported; pages R04 |
| 0.4 | IK Lemma 11.17, p. 284: a finite field with `q` elements, `k < q`; proof by `C(mq, j) = 0` for `0 < j < q`. The README restates it for `k < p` over any ring of characteristic `p` and says so | supported |
| 0.6 | IK Lemmas 11.16–11.17 (pp. 283–284) for the criterion and the substitution; the combination is this roadmap's | supported |
| 1.1 | IK Lemma 11.16, p. 283 (IK line 862): Hasse jets of order `< ℓ` vanish ⇒ `(X − a)^ℓ ∣ f`, any field | supported (one direction; the bijection is a dimension count) |
| 1.2 | IK Lemma 11.16 plus the Taylor remark on pp. 282–283 (IK lines 801–810) for the converse | supported |
| 2.2, 2.3, 3.2, 3.3, 3.4, 4.3 | none cited | R04 |
| 4.1 | W §2.4 (p. 43, "Gel'fond's method with interpolation determinants", §2.4.1 upper bound) and §10.2 (p. 329): context for the shape of the estimate; the bound itself is the Leibniz expansion | supported as context |
| 5.1 | M "Review of norms and traces", pp. 31–32 (M lines 1397–1423): `Nm(a) = a^n` for `a ∈ A`, multiplicativity, Cor. 2.20 product over embeddings | supported; page R04 |
| 5.2 | M Cor. 2.20 (p. 32) for the embedding product; W §10.2 for the use | supported |

**Adversarial table.** Determinants were computed with an exact rational-arithmetic script. Lex row order is `finSigmaFinEquiv`.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution` (def, 0.3) | `B = 2`: `Z + W`, `Z + Z W`; `B = 3`: `Z² W + Z W²`; `B = 0`: `W` | `X + X²`, `X + X³`; `X⁵ + X⁷` (exponents `2 + 3·1`, `1 + 3·2`; `7 ≤ 8`); `W ↦ 1`. Swapping the variables would send `Z + W` to `X² + X` too but `Z + Z W` to `X² + X³`, excluded by the first Check | sound | none |
| `powerSubstitution_injOn` | `B = 2`, `Z²` vs `W`; `B = 1`, `F ∈ R[W]` | both `X²` (`Z`-degree `2 ≥ B`, outside the set); `W^j ↦ X^j` injective | sound | none |
| `iterate_derivative_powerSubstitution` | `p = 2`, `F = Z W`; `F = W`; `p = 3`, `k = 3`, `F = Z³` | `D X³ = 3X² = X² = φ(W)`; `D X² = 0 = φ(0)`; `D³ X³ = 6 = 0 = φ(6)` | sound | none |
| `hasseDeriv_powerSubstitution` | `p = 3`, `k = 2`, `Z² W`; `p = 2`, `k = 1`, `Z³ W` (`Z`-degree `≥ p`, allowed); `k = p = 2`, `W` | `C(5,2) X³ = 10 X³ = X³ = φ(W)`; `D X⁵ = 5 X⁴ = X⁴`, `φ(3 Z² W) = X⁴` (Lucas); `1` vs `0`, excluded by `k < p` | sound | none |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | `p = 2`, `F = Z + W`, `S = {0, 1, c} ⊆ 𝔽₄`, `m = 0`; `S = {0, 1}`; `p = 3`, `F = Z²`, `S = {0}`, `m = 2` | `2 < 3`, `F(c, c²) = 1 ≠ 0`; `2 < 2` false and `F` vanishes at both points; `2 < 3`, `∂_Z² Z² = 2 ≠ 0` in characteristic `3` (uses `m < p`) | sound | none |
| `hermiteJet` (def) | `m = (2)`, node `c`; `p = 2`, `m = (3)`, node `0`, `f = X²`; `m = (0, 3)`, `a = (5, 0)` | `(c₀ + c₁ c, c₁)`; Hasse jet `1`, ordinary `2 = 0` (excludes the ordinary model); identity on coefficients | sound | none |
| `hermiteJet_bijective` | `r = 0`; `a = (0, 0)`, `m = (1, 1)`; `a = (0, 1)`, `m = (2, 1)`, datum `(1, 0, 0)` | dims `0 = 0`; `X ↦ (0, 0)`, so the hypothesis is needed; preimage `1 − X²`: `f(0) = 1`, `f′(0) = 0`, `f(1) = 0` | sound | none |
| `all_jets_vanish_iff_dvd` | `a = (0, 1)`, `m = (1, 1)`, `f = X² − X` and `f = X`; `a = (0, 0)`, `f = X`; `f = 0` | jets `0, 0` and `X(X − 1) ∣ f`; `f(1) = 1`, no divisibility; jets vanish but `X² ∤ X` (injectivity needed); `P ∣ 0` | sound | none |
| `confluentVandermonde` (def) | `(0,1)/(2,1)`; `(5)/(3)`; `(1,0)/(1,1)` | rows `[1,0,0],[0,1,0],[1,1,1]`; `[1,5,25],[0,1,10],[0,0,1]`; `[[1,1],[1,0]]` | sound | none |
| `det_confluentVandermonde` | 13 `(a, m)` | `(0,1)/(2,1)`: `1 = 1`; `(1,0)/(1,1)`: `−1 = −1`; `(1,0)/(2,1)`: `1 = 1`; `(0,1,2)/(2,1,1)`: `4 = 4`; `(2,5,7)/(1,1,1)`: `30 = 30`; `(5)/(3)`: `1 = 1`; empty: `1 = 1`; `(0,0)/(1,1)`: `0 = 0`; `(3,−1,2)/(2,2,1)`: `2304 = 2304`; `(1,4)/(3,1)`: `27 = 27`; `(2,−3)/(3,2)`: `15625 = 15625`; `(0,0,1)/(1,0,1)`: `1 = 1`; `(0,0)/(2,0)`: `1 = 1` | sound | none |
| 1.3 ordinary matrix `= ∏ k! · det V` | `(5)/(3)`, `(1,4)/(3,1)`, `(2,−3)/(3,2)` | `2 = 2·1`, `54 = 2·27`, `31250 = 2·15625` | sound | none |
| 1.3 "unit iff `a` injective or `M ≤ 1`" | `(0,0,1)/(1,0,1)`; `(0,0)/(2,0)` | determinant `1` with `a` not injective and `M = 2` | **false** | R01 |
| 1.3 symmetries | scaling by `u`: exponent `∑ j − ∑ k = M(M−1)/2 − ∑ m_i(m_i−1)/2 = ∑_{i<j} m_i m_j`; transposed pair sign `(−1)^(m_i m_j)` | equal | sound | none |
| `exists_full_row_minor` | `[[1,0,0],[0,1,0]]`; `[[1,1],[2,2]]`; `m = 0`; `m = 2, n = 1` | minor `1` on `(0,1)`, `0` on `(0,2)`; only minor `0`; `det` of `0 × 0` `= 1`; no injective `c`, rows dependent | sound | none |
| 2.2 lift / reduction | `ℤ → ZMod 2`: `[[1]]`, `[[2]]` | `1 ↦ 1` lifts; `2 ↦ 0`, so the converse needs injectivity | sound | none |
| `coordinates_mem_extended_ideal` | `ℤ[i]`, `J = 2ℤ`: `2 + 2i`, `1 + i`; `A = R` | coordinates `(2,2) ∈ 2ℤ`; `(1,1)`, `1 ∉ 2ℤ` and `1 + i ∉ 2ℤ[i]`; identity | sound | none |
| 2.3 "determinants not coordinatewise" Check | `[[i]]`; `diag(i, i)` | `(0, 1)` vs `(0, 1)`, equal; `(−1, 0)` vs `(0, 1)` | Check vacuous | R02 |
| `det_mem_prod_row_ideals` | `[[2,4],[3,9]]`, `J = (2ℤ, 3ℤ)`; `n = 0`; `[[2,3],[1,1]]` | `6 ∈ 6ℤ`; `1 ∈ ⊤`; `−1 ∉ 6ℤ` (no row hypothesis) | sound | none |
| `unitriangular_mul_minor` | `U = [[1,0],[1,1]]`, `A = [[1,2,0],[0,1,5]]`, `c = (0,1)`; `U = 2I`; `U = [[0,1],[1,0]]` | `1 = 1`; `4 ≠ 1` (excluded by `hdiag`); `−1` (excluded) | sound | none |
| `det_gram_matrix_smul` | `U = [[1,0],[1,1]]`, `v = (e₁, e₂)`; `U = 2I`; three integer `3 × 3` `U` with families in `ℝ⁴`; `v = (e₁, e₁)`; `ι = ∅` | `1 = 1²·1`; `16 = 4²·1` (`det U` alone gives `4`); `1713150`, `14899136`, `31104` on both sides; `0 = 0`; `1 = 1` | sound | none |
| 3.3 complex form | `U = [[i]]`, `v = (e₁)` | `⟪i e₁, i e₁⟫ = 1 = ‖i‖²`; `(det U)² = −1` would be wrong | sound | none |
| `derivative_prod_mem_ideal_pow` | `X`, `g = 1`, `J = (0)`, `K = 0`; `X, X`, `K = 0`; `ℤ`, `X³`, `J = (3)`, `K = 3` | `0 ∈ (0)`; `X²(0) = 0 ∈ (0)²`, `D²(X²)(0) = 2 ∉ (0)²`; `0, 0, 0, 6 ∈ (3)` | sound | none |
| 3.4 Checks with `K = 1` and `K = 3` | `X, X`, `J = (0)`; `f = (X)`, `g = X⁵` | hypothesis `D X (0) = 1 ∈ (0)` false in both | Checks not instances | R02 |
| `hasseDeriv_prod_mem_ideal_pow` | `ℤ`, `X³`, `J = (3)`; `ι = ∅` | Hasse jets `0, 0, 0, 1`, hypothesis fails at `k = 3`, as the README says; `J⁰ = ⊤` | sound | none |
| `pderiv_prod_mem_ideal_pow` | `f = (Z)`, `g = W`, `a = (0, 5)`, `J = (0)`, `K = 0` | `Z(0,5) = 0`, `ZW(0,5) = 0 ∈ (0)`; `K = 1` would need `∂_Z Z = 1 ∈ (0)` | sound | none |
| `norm_det_le_factorial_prod` | `n = 0`; `[[1,1],[1,−1]]`, `B = (1,1)`; `[[1,0],[10,1]]`, `B = (1,10)`; `3 × 3` `±1` with `det 4` | `1 ≤ 1`; `2 ≤ 2`; `1 ≤ 20`; `4 ≤ 6` (Hadamard `≈ 5.2`) | sound | none |
| 4.2 ratio `n!/n^(n/2)` | `n = 1, …, 5` | `1, 1, 1.155, 1.5, 2.147`: exceeds `1` from `n = 3`, as stated | sound | none |
| `norm_hasseDeriv_eval_le` | `X²`, `k = 1`, `a = A = 2`; `k = 3 > d`; `1 + X + X²`, `a = A = 1` | `4 ≤ 5`; `0 ≤ 0`; `3 ≤ 3`, coarse `3·4 = 12` | sound | none |
| Layer 4 Examples row bounds | `a = (0,1)`, `m = (2,1)`, `A = 1`; `A = (0,1)` | `(1, 2, 1)` vs stated `(1,1,1)`; `(1,1,1)` | slip | R02 |
| 0.1 rank and box/ball | box `{μ₀ ≤ 1, μ₁ ≤ 2}`; total-degree ball of radius `2` | `6`, `6`; `Z W²` in box only, `Z²` in ball only | sound | none |
| 0.2 jet matrix | `T = {0,1,2}`, points `0, 1`, `d = (0, 1)`; `ZMod 2`, `X²`, `d = 2`; `ℤ → ℤ/3` | `[[1,0,0],[0,1,2]]`; Hasse `1`, ordinary `0`; `[1,3] ↦ [1,0]` | sound | none |
| 0.5 | `p = 3`, `X²`, `k = 2`; `k = p = 3`, `X³` | `2` and `1`, both nonzero; `6 = 0` vs `1` | sound | none |
| 5.1 | `ℚ(i)`: `2(1+i)`, `1+i`; `ℚ × ℚ`: `(1, 0)` | `N = 8`, `4 ∣ 8`; `N = 2`, `4 ∤ 2`; norm `0` | sound | none |
| 5.2 | `1 + i`; `z = 12`, `P = {2,3}`, `e = (2,1)`; `ℚ(√2)`, `3(1+√2)` | `√2·√2 = 2 = N(1 + i)`; `log 12 ≤ log 12`; `N = −9`, moduli product `9` | sound | none |
| Worked examples | `[[2,4,6],[3,6,12]]`; `[[1,√2],[√2,2]]`, `[[1,√2],[√2,3]]` | minors `0, 6, 12 ∈ 6ℤ`; determinants `0`, `1` | sound | none |

## Not verifiable

- none. All five cited texts (IK, P, M, Laurent, W) are in the sources cache and were read at their locators. The README no longer cites Bombieri–Gubler.

## Source issues

- **Gap** in IK at Lemma 11.17, p. 284: the source says the binomial `C(mq, j)` vanishes in characteristic `p` by writing it as `(mq/j)·C(mq−1, j−1)`, dividing by `j`; it should be justified by `v_p(mq) ≥ v_p(q) > v_p(j)` for `0 < j < q`, since `p` may divide `j` when `q` is a proper power of `p`; affects the proof.
