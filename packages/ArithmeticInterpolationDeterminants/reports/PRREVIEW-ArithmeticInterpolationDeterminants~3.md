# Review of ArithmeticInterpolationDeterminants (pull request #1905 at b6b38f9)

**Verdict:** needs changes

This head repairs all nine findings of the previous review (table under *Verified sound*). There are five new findings, two of them blocking:
- R01 (P2): 2.1 and part of 2.2 restate theorems already in the pinned Tau Ceti, and `exists_full_row_minor` closes with one `exact`.
- R02 (P2): the Frobenius substitution identities and test are planned for `X^p` only, though the cited source proves them for `X^q`, `q = p^e`.
- R03–R05 (P3): a wrong formula in a route, a supplier contract that cites a roadmap for objects at the pin, and one inapt library citation.

Every other Lean statement checks out on the instances in the adversarial table.

## R01 (P2) — full-row minors and their field-extension invariance restate the pinned Tau Ceti

Location: `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:45–46`, "existence of a nonzero full-row minor of an independent-row matrix over a field". Also §2.1 (`README.md:606–617`), the field-extension clause of §2.2 (`README.md:634–637`) and `Suggested.lean:146–151` (`exists_full_row_minor`).

Claim: the minor criterion of 2.1, its converse, and "rows independent over `K` iff over `L`" (2.2) are targets owned here.

Witness: pinned Tau Ceti `Matrix.linearIndependent_row_iff_exists_det_submatrix_ne_zero` (`TauCeti/LinearAlgebra/Matrix/Rank.lean:112`) states, over any domain, `LinearIndependent R A.row ↔ ∃ e : m ↪ n, (A.submatrix id e).det ≠ 0`. `Matrix.linearIndependent_map_algebraMap_row_iff` (line 104) covers field extensions.

Repair:
- Delete `exists_full_row_minor` from `Suggested.lean` and from the Layer 2 list at `README.md:23`.
- Under *Left to other roadmaps and to the libraries* and *From Tau Ceti*, cite these declarations from `TauCeti/LinearAlgebra/Matrix/Rank.lean`:
  - `Matrix.linearIndependent_row_iff_exists_det_submatrix_ne_zero` (both directions, over a domain);
  - `Matrix.le_rank_iff_exists_det_submatrix_ne_zero` (line 124, Treil's Theorem 6.1);
  - `Matrix.linearIndependent_map_algebraMap_row_iff` (needs `[FaithfulSMul R S] [IsDomain S]`, which a field extension satisfies);
  - `Matrix.rank_map` (line 157).
- Keep as a target only what the pin lacks: a chosen nonzero minor lifts along any ring map and survives an injective one (`RingHom.map_det`, `Matrix.submatrix_map`).
- Update the places that name 2.1: the Conventions bullet (lines 140–145), the Layer 2 Examples and *Downstream consumers* (line 998).

Tested: in a scratch copy with `import TauCeti.LinearAlgebra.Matrix.Rank`, the proof `exact (Matrix.linearIndependent_row_iff_exists_det_submatrix_ne_zero.mp hA).elim fun e he => ⟨e, e.injective, he⟩` elaborates at the pins with no error.

## R02 (P2) — the Frobenius substitution identities and test stop at `X^p`, below the cited source

Location: `README.md:346–350`, "In characteristic `p`, prove `iterate_derivative_powerSubstitution` … Prove `hasseDeriv_powerSubstitution`: for `k < p`". Also §0.4 at lines 362–366, §0.6, and `Suggested.lean:49–62, 76–82`.

Claim: both identities, and the nonvanishing test built on them, are planned only for `powerSubstitution p`.

Witness: IK Lemma 11.17 (IK line 882–885, p. 284), cited at 0.4, proves `E^k h(X, X^q) = (E^k_X h)(X, X^q)` for every `k < q`, where `q` is any power of `p`. GrothendieckNotesLemmas §1.4, the cited input, holds for `p^e`. Example: `p = 2`, `q = 4`, `F = Z W` gives `D^[1] X⁵ = X⁴ = (∂_Z^[1] F)(X, X⁴)`.

Repair:
- State both identities for `powerSubstitution (p ^ e)` with `0 < e`, the Hasse identity for `k < p ^ e`.
- State 0.6 for `powerSubstitution (p ^ e)` with `0 < e`, `Z`-degree below `p ^ e` and `m < p`. The Hasse step then uses `k ≤ m < p ≤ p ^ e`.
- Keep `e = 1` as a Check, and add `e = 0` as a negative control.
- The route is GrothendieckNotesLemmas §1.4 at exponent `e`, or Tau Ceti's chain rule with weight `(1, p^e)`, where `(T + a)^(p^e) − a^(p^e) = T^(p^e)`.

Tested:
- `C(i + p^e j, k) ≡ C(i, k) mod p` holds for all `k < p^e`, `i < 40` and `j < 6`, for `(p, e)` in `(2,1), (2,2), (2,3), (3,1), (3,2), (5,1)`, with no exception.
- At `k = p^e`, `F = W`: `1 ≠ 0`, so the bound is sharp.
- `e = 0` must be excluded. For the derivative identity: `D(X) = 1` while `∂_Z W = 0`. For 0.6: `p = 2`, `F = W`, `S = {0}`, `m = 1` meets every hypothesis (`natDegree X = 1 < 2`), yet `∂_Z^k W` vanishes for `k ≤ 1`.

## R03 (P3) — 0.4's evaluated route misreads the Kronecker chain rule

Location: `README.md:354–358`, "expresses `D^[k](F(X, X^p))(a)` through the coefficients of `T^k` in `(T + a)^(ν 0) ((T + a)^p − a^p)^(ν 1) = (T + a)^(ν 0) T^(p ν 1)` …, which vanish for `k < p` unless `ν 1 = 0`".

Claim: the weight of `(∂^ν F)(a, a^p)` in Tau Ceti's `MvPolynomial.eval_hasseDeriv_aeval_X_pow` at `e = (1, p)` is `[T^k] (T + a)^(ν 0) T^(p ν 1)`.

Witness: `TauCeti/RingTheory/MvPolynomial/Kronecker.lean:164–168` weights it by `[T^k] ∏_s ((T + a)^(e s) − a^(e s))^(ν s)`, whose `s = 0` factor is `T^(ν 0)`. Take `F = Z`, `k = 0`, `a = 1`, with Taylor values `1` at `ν = (0,0)` and `(1,0)`. The README's weights give `2`, but `D^[0] X (1) = 1`.

Repair: "… expresses `D^[k](F(X, X^p))(a)` as `∑_ν c_ν · (∂^ν F)(a, a^p)`, where `c_ν` is the coefficient of `T^k` in `T^(ν 0) ((T + a)^p − a^p)^(ν 1) = T^(ν 0 + p ν 1)` in characteristic `p`. For `k < p`, `c_ν = 1` when `ν = (k, 0)` and `0` otherwise, which leaves `(∂_Z^[k] F)(a, a^p)`."

Tested:
- `F = Z`, `k = 0`, `a = 1` gives `1`.
- `F = Z²`, `p = 3`, `k = 1`, `a = 2` gives `(∂_Z^[1] Z²)(2, 8) = 4 = 1 = D^[1](X²)(2)` in `𝔽₃`; the README's weights give `2`.

## R04 (P3) — the DiophantineApproximationAndTranscendence contract cites a roadmap for objects in the pinned Tau Ceti

Location: `README.md:223–227`. It takes from that roadmap:
- §1.1: `Polynomial.l1Norm`, `|P(z)| ≤ ‖P‖₁ max(1, |z|)^(deg P)` and `‖D^[k] P‖₁ ≤ 2^(natDegree P) ‖P‖₁`;
- §1.2: the `MvPolynomial.hasseDeriv` API;
- §1.4: `Polynomial.hasseWronskian`.

The same citations recur at lines 91–98, 893–894, 903–905 and 927–928.

Witness: all of these are in the pinned Tau Ceti:
- `Polynomial.l1Norm`, `Polynomial.norm_eval_le_l1Norm_mul` and `Polynomial.l1Norm_hasseDeriv_le` (`TauCeti/Analysis/Polynomial/L1Norm.lean:52, 217, 293`);
- `Polynomial.hasseWronskian` (`TauCeti/RingTheory/Polynomial/HasseWronskian.lean:73`);
- the §1.2 API names, in `TauCeti/Algebra/MvPolynomial/HasseDeriv/Basic.lean`.

Repair: move these names, with their files, from the subsection *From TauCetiRoadmap.DiophantineApproximationAndTranscendence* to *From Tau Ceti*. Repoint the Scope bullets at lines 91–98, and 4.3's *Needs:* and Dependencies, to them. The §1.7 pointer in Scope can stay, since it already names Tau Ceti's lemma.

Tested: all five names `#check` at the pins. `norm_eval_le_l1Norm_mul` needs `[SeminormedRing R] [NormOneClass R]`, which ℂ satisfies.

## R05 (P3) — 5.2 cites a lemma about products of primes for a product of prime powers

Location: `README.md:964–966`, "combine divisibilities at finitely many distinct primes into the product divisibility (coprime divisors multiply, `Nat.Coprime.mul_dvd_of_dvd_of_dvd` and Mathlib `Finset.prod_primes_dvd`)". The same lemma is in the *Needs:* at line 973.

Witness: `Finset.prod_primes_dvd` (`Mathlib/Algebra/BigOperators/Associated.lean:145`) concludes `∏ p ∈ s, p ∣ n` for primes `p ∈ s`. For `z = 12`, `P = {2, 3}`, `e = (2, 1)` it gives `6 ∣ 12`, not `2² · 3 ∣ 12`.

Repair: cite `Finset.prod_dvd_of_coprime` (`Mathlib/RingTheory/Coprime/Lemmas.lean:102`) applied to `s p = p^(e p)`. These are pairwise coprime by `IsCoprime.pow`.

Tested: at the pins, `Finset.prod_dvd_of_coprime` with `t = {2, 3}`, `s p = p^(2 or 1)`, `z = 12` elaborates (coprimality and divisibility by `decide`), giving `4 · 3 ∣ 12`.

## Verified sound

**Previous findings (review of `f4e861f`).**

| Id | Status at this head | Evidence |
| --- | --- | --- |
| R01 false "iff" for nonvanishing of the confluent determinant | repaired | `README.md:557–559`, "nonzero iff `a i ≠ a j` for all `i ≠ j` with `m i ≠ 0` and `m j ≠ 0`". Negative-control Check `a = (0, 0, 1)`, `m = (1, 0, 1)`, determinant `1`, at lines 584–586 |
| R02 Checks that did not test their claim | repaired | 2.3 uses `diag (i, i)` (lines 681–684). 3.4 uses `K = 0` for `X, X`, and `X⁴, X⁵`, `K = 3` (lines 803–808). Layer 4 Examples: per-node bounds `A = (0, 1)` give `(1, 1, 1)`; `A = 1` gives `(1, 2, 1)` and `1 ≤ 12` (lines 917–923). The 1.3 route now reads "lower triangular … constant diagonal" (lines 544–548) |
| R03 Laurent cited for the confluent formula | repaired in the README | W, proof of Lemma 3.24, p. 100, and Exercise 3.11, p. 111, with the sign sentence (lines 560–563). Laurent is now cited only at 2.1 (§6.1, p. 219, verified). The board manifest's W entry still reads "§§2.4, 10.2"; that file is outside this pull request and is for the worker |
| R04 twelve targets without locators | repaired | Locators now at 0.1, 0.2, 0.5, 2.1, 2.2, 2.3, 3.1, 3.2, 3.3, 3.4, 4.2 and 4.3. P pages read "pp. 85–89", p. 87 and p. 89. M cites p. 31 and Corollary 2.20 on p. 32. IK p. 283 is cited for `D^[p] X^p = 1` |
| R05 four names absent at the pins | repaired | `MvPolynomial.uniqueAlgEquiv`, `map_mul` for `Algebra.norm`, `OrthonormalBasis.det_gram_eq_norm_det_sq` and `Module.Basis.linearCombination_repr` all resolve (`#check`) |
| R06 README and Lean disagree on scope | repaired | `README.md:18–28` lists the 17 Lean statements by layer, matching the module docstring. The Conventions bullet (lines 140–145) separates `Fin n` from arbitrary finite types |
| R07 unused imports | repaired | `Suggested.lean:2` has the single Tau Ceti import `TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic`, which `MvPolynomial.hasseDeriv` needs |
| R08 dependency paragraphs contradicting *Needs:* | repaired | Lines 449–450, 241–243, 904–905 (4.3 names 0.2 and 1.3), 598–600 and 564–568 (1.3 no longer needs 1.1) |
| R09 GenericDoublePointInterpolation first-jet map not cited | repaired | Lines 70–75 cite §§1.3–1.4 `firstJetMap` and `firstJetMatrix`, with the one-clause difference |

**Gate, order and build.**
- The worker's gate on this head passes every check, including `build=0`. My rerun with `--base origin/main` also reports `OK`, with `0` on every text check and `depcheck`.
- Dependency check against the candidate order: `depcheck: 238 roadmaps, 2341 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).
- `lake env lean` on `Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) gives 17 warnings, all "declaration uses `sorry`", and no error.
- File form: one module docstring, no `lemma`, `set_option`, `#eval` or `#print`, and three `def`s with real bodies.

**Signatures.** I compared the 20 elaborated types (`#check @name`, scratch file) with their README statements. No section binder is lost, and generality agrees with the README.

Notes (unused hypotheses, not findings):
- `[Fact p.Prime]` in `iterate_derivative_powerSubstitution`: only `(p : R) = 0` is used.
- `hB : ∀ i, 0 ≤ B i` in `norm_det_le_factorial_prod` follows from `hA` when `n ≥ 1`.
- `[Fact p.Prime]` *is* needed in `hasseDeriv_powerSubstitution`: over `ZMod 4`, `D^[2] X⁴ = 6 X² = 2 X² ≠ 0 = ∂_Z^[2] W`.

**One-tactic probe.** On a scratch copy, each of the 17 theorems was tried with `first | exact? | simp_all | aesop`, with `TauCeti.LinearAlgebra.Matrix.Rank` imported. Only `exists_full_row_minor` closes (R01); the other 16 fail or time out. From the previous probe, `unitriangular_mul_minor` needs two tactics.

**Headline theorems** (README lines 11–14, 18–28):
- `hermiteJet_bijective`;
- `det_confluentVandermonde`;
- `exists_nonzero_ordinary_jet_on_frobenius_graph`, with its inputs `powerSubstitution_injOn`, `iterate_derivative_powerSubstitution` and `hasseDeriv_powerSubstitution`;
- `det_gram_matrix_smul`.

All are stated. Layer 5 is left to the README, consistently in both files. Of the definitions, only `powerSubstitution`, `hermiteJet` and `confluentVandermonde` are declared, all with real bodies on native carriers.

**Library declarations opened at the pins.** I ran `#check` on 136 names cited in the README. All resolve except `Polynomial.hasseDeriv_expand_mul`, which the README cites as GrothendieckNotesLemmas §1.4's target, not as a library name. Read in full:
- `Polynomial.eval_hasseDeriv_rootMultiplicity_ne_zero` (`[CommRing R]`, `p ≠ 0`) and `Polynomial.eval_hasseDeriv_X_sub_C_pow` (`TauCeti/Algebra/Polynomial/Taylor.lean:101, 121`);
- `Polynomial.count_roots` and `Polynomial.card_roots'` (`IsDomain`), `Multiset.toFinset_sum_count_eq`;
- `MvPolynomial.coeff_aeval_X_pow_weight`, `injOn_aeval_X_pow` and `eval_hasseDeriv_aeval_X_pow` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean:164`, R03);
- `OrthonormalBasis.det_gram_eq_norm_det_sq` and `norm_det_le_prod_norm` (any `E`, basis indexed by `ι`);
- `Matrix.abv_det_le_prod_sum_abv`, which gives `∏_i ∑_j`, i.e. `n^n ∏ B_i`, so 4.1's `n! ∏ B_i` is not restated;
- `Matrix.det_le` (uniform `n! • x^n`);
- `Algebra.norm_algebraMap` (`[Module.Free R S]`), `Algebra.norm_ne_zero_iff` (domains, free, finite), `Algebra.norm_eq_prod_embeddings` (separable, `IsAlgClosed E`) and `Algebra.coe_norm_int`;
- `finSigmaFinEquiv_apply` (`↑(finSigmaFinEquiv k) = ∑_{i < k.1} n i + k.2`, the README's lexicographic order);
- `Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative` (`[CharZero R]`, as the README says);
- `Matrix.linearIndependent_row_iff_isUnit` (`IsArtinianRing`).

Duplication greps in Mathlib and Tau Ceti for objects rather than names:
- Hermite interpolation, confluent determinants, the Gram change of family, `det ∈ ∏ J_i`, the 4.3 bound and the 4.1 row bound: nothing besides R01 and R04.
- Gram: only the trace-form analogue `Algebra.discr_of_matrix_mulVec` (`Mathlib/RingTheory/Discriminant.lean:114`), a different bilinear form.
- 2.3: Mathlib has `Ideal.smul_top_eq_map` but not the coordinate criterion, so 2.3 is a genuine target.

**Cross-roadmap citations resolved.**
- CharacterSumsOverFiniteFields §4.1 (open head, its README line 1278; the carrier `[Field F] [Finite F]` at line 14), as the README says.
- GrothendieckNotesLemmas §1.3 `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand` and §1.4 `Polynomial.hasseDeriv_expand_mul` (open head, lines 268–302). This is a new roadmap by another author, named in the pull request's depends-on list, and used only for an alternative route.
- DiophantineApproximationAndTranscendence on main: §1.1 (line 541; `l1Norm`, the evaluation and Hasse bounds), §1.2 (586), §1.4 (758) and §1.7 (885). The open revision of this roadmap keeps all four section numbers, so no id is dropped (R04 concerns the pin, not the ids).
- GenericDoublePointInterpolation §1.3 `firstJetMap` (line 451), §1.4 `firstJetMatrix` (521) and §4.6 `univariateHermiteRank` (1416), at its head.
- IntegralIwasawaTheory §4.1c `exists_hasseDeriv_eval_eq_ite`, at its head (line 601).
- All of these suppliers are on main or earlier in the candidate order: GenericDoublePointInterpolation is line 35, IntegralIwasawaTheory 28 and CharacterSumsOverFiniteFields 156; this roadmap is 396. GrothendieckNotesLemmas is not in the order yet; the depcheck raises nothing.
- Overlaps: no other open pull request changes this roadmap, and no id is dropped in either direction.
- No roadmap on main or in an open pull request cites this roadmap.

**Ownership by object.** `roadmaps grep` over main and the open heads, for "confluent Vandermonde", "Hermite interpolation", "change-of-family", "full-row minor", "powerSubstitution", "hermiteJet", `det_gram_matrix_smul` and "unitriangular":
- Hermite interpolation appears only as special cases already deferred in Scope: GenericDoublePointInterpolation §4.6, IntegralIwasawaTheory §4.1c, and GlobalHolomorphicFunctions inside a proof. LinearFormsInLogarithms also matches; it is a forbidden supplier and is not cited.
- GenericDoublePointInterpolation's "nonzero maximal minor" (§5.3) concerns its universal first-jet matrix, which is an application.
- `powerSubstitution` in HabiroNumberFields is a different object (`q ↦ q^n`).

No second owner of the Hermite equivalence, the confluent determinant, the row-ideal lemma or the Gram identity.

**Sources: the seeded sample.** All six cited texts are in the cache and were read at their locators.

| Target | Source at its locator | Verdict |
| --- | --- | --- |
| 0.2 | IK, definition of `E^k`, p. 282 (IK lines 792–800), over any field; P Lemma 2.6.1 and (2.34), and `∂_d = (1/d!) ∂^d` on p. 69, pp. 68–69 (P lines 3886–3966) | supported |
| 0.3 | IK Lemma 11.17, p. 284 (IK lines 882–885). P proof of Theorem 3.3.7, p. 87 (P lines 5172–5176), and Exercise 3.5(a), p. 89 (P lines 5272–5278): `x_i ↦ t^(d^(i−1))`, injective on monomials of partial degree `< d`, over a subfield of ℂ | supported |
| 0.6 | IK Lemma 11.16, pp. 283–284 (IK lines 862–880), over any field; Lemma 11.17 for the substitution | supported; generality R02 |
| 1.1 | IK Lemma 11.16 (vanishing jets imply `(X − a)^ℓ ∣ f`); bijectivity is a dimension count | supported |
| 1.2 | IK Lemma 11.16 and the Taylor remark, pp. 282–283 (IK lines 801–815) | supported |
| 1.3 | W, proof of Lemma 3.24, p. 100 (W lines 5356–5373): the transposed matrix with entries `C(µ−1, k) X_j^(µ−1−k)`, `T_j ≥ 1`. Exercise 3.11, p. 111 (W lines 5912–5917): `± ∏ (X_i − X_j)^(T_i T_j)` | supported; the sign is fixed here |
| 2.2 | Treil (4.2), p. 89 (Treil lines 4620–4623): the determinant as a polynomial in the entries | supported |
| 3.1 | Treil (4.2), p. 89: one entry from each column per term, and from each row since `σ` is a bijection | supported |
| 3.2 | Treil p. 81, triangular matrices (Treil lines 4260–4267), and Theorem 3.5, p. 82 (Treil line 4313) | supported |
| 3.3 | M formula (6), p. 32 (M lines 1433–1450): `(ψ(f_k, f_l)) = A (ψ(e_i, e_j)) Aᵀ` and `det(A)²`, stated for a basis `e`; the computation is the same for any family | supported |
| 3.4 | IK Lemma 11.14 and (11.22), p. 283 (IK lines 820–829), over a field | supported |
| 4.2 | W, proof of Lemma 3.25, p. 101 (W lines 5385–5397): `|Δ|² ≤ ∏_λ ∑_µ |a_λµ|²` for `L × L` complex matrices | supported |
| 4.3 | IK, `E^k X^n = C(n,k) X^(n−k)`, p. 282; P (2.34), p. 68 | supported |
| 5.1 | M, Review of norms and traces, p. 31 (M lines 1397–1408: `Nm(ββ′) = Nm β Nm β′`, `Nm(a) = a^n`), and Corollary 2.20, p. 32 (M lines 1419–1422, separable) | supported |
| 5.2 | M Corollary 2.20, p. 32; W §10.2, pp. 329–356 (§10.3 starts on p. 356, W line 18091) | supported |

Further locators checked:
- W Lemma 2.8, p. 43 (W line 2603: the factor `L! ∏_λ max_µ` on the circle of radius `R`) and §10.2.2, p. 334 (W line 16923).
- Treil Theorem 6.1, p. 96 (Treil line 4948, real or complex matrices).
- Laurent §6.1, p. 219 (Laurent lines 456–466).
- M (4), p. 22 (M line 1016), extension of scalars, p. 23 (M lines 1042–1052), and pp. 59–60 (M lines 2640–2647).

**Adversarial table.** Determinants and the Gram identity were computed with an exact rational-arithmetic script; rows follow the `finSigmaFinEquiv` order.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution` (def) | `B = 2`: `Z + W`, `Z + ZW`; `B = 3`: `Z²W + ZW²`; `F = ZW`, `a = 3` | `X + X²`, `X + X³`. Swapping the variables would send `Z + ZW` to `X² + X³`, which the Check excludes. `X⁵ + X⁷`, with exponents `2 + 3·1`, `1 + 3·2` and `7 ≤ 8`. `27 = eval ![3, 9] (ZW)` | sound | none |
| `powerSubstitution_injOn` | `B = 2`: `Z²` vs `W`; `B = 1`, `F ∈ R[W]` | both map to `X²`, but `Z²` has `Z`-degree `2 ≥ B`, outside the set; `W^j ↦ X^j` is injective | sound | none |
| `iterate_derivative_powerSubstitution` | `p = 2`: `ZW`, `W`; `p = 3`, `k = 3`, `Z³`; `B = 1`, `W` | `D X³ = X² = φ(W)`; `D X² = 0`; `D³ X³ = 6 = 0 = φ(6)`. For `B = 1`, `D X = 1 ≠ 0` (R02 control) | sound | R02 |
| `hasseDeriv_powerSubstitution` | `p = 3`, `k = 2`, `Z²W`; `p = 2`, `k = 1`, `Z³W`; `k = p = 2`, `W`; `ZMod 4`, `W`, `k = 2` | `C(5,2) = 10 = 1`, so `X³ = φ(W)`; `5X⁴ = X⁴ = φ(3 Z² W)`; `1` vs `0`, excluded by `k < p`; `6 = 2 ≠ 0`, so `Fact p.Prime` is needed | sound | none |
| same, for `p^e` | `C(i + p^e j, k) mod p` vs `C(i, k) mod p`, for `k < p^e`, six `(p, e)` | 0 violations; at `k = p^e`, `1 ≠ 0` | statement narrower than the source | R02 |
| 0.4 evaluated route | `F = Z`, `k = 0`, `a = 1`; `F = Z²`, `p = 3`, `k = 1`, `a = 2` | true values `1`, `1`; Tau Ceti weights `1`, `1`; README weights `2`, `2` | **route formula false** | R03 |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | `p = 2`, `Z + W`, `S = {0, 1, c} ⊆ 𝔽₄`, `m = 0`; `S = {0, 1}`; `Z² + W`; `p = 3`, `Z²`, `S = {0}`, `m = 2`; `B = 1`, `W`, `S = {0}`, `m = 1` | `2 < 3` and `F(c, c²) = 1`; `2 < 2` fails and `F` vanishes at both points; `φ(F) = 0` with `Z`-degree `2`; `∂_Z² Z² = 2 ≠ 0`; the `B = 1` case meets every hypothesis yet all jets vanish (R02 control) | sound | R02 |
| `hermiteJet` (def) | `m = (2)`, node `c`; `m = (0, 3)`, `a = (5, 0)`; char `p`, `m = (p + 1)`, `X^p` | `(c₀ + c₁c, c₁)`; identity on coefficients; ordinary jets all `0`, Hasse jet of order `p` is `1` | sound | none |
| `hermiteJet_bijective` | `r = 0`; `a = (0, 0)`, `m = (1, 1)`; `a = (0, 1)`, `m = (2, 1)`, datum `(1, 0, 0)` | dimensions `0 = 0`; `X ↦ (0, 0)`, so injectivity is needed; preimage `1 − X²` | sound | none |
| `all_jets_vanish_iff_dvd` | `a = (0, 1)`, `m = (1, 1)`: `X² − X`, `X`; `a = (0, 0)`, `X`; `f = 0` | jets `(0, 0)` and divisible; `f(1) = 1` and not divisible; jets vanish but `X² ∤ X`; `P ∣ 0` | sound | none |
| `confluentVandermonde` / `det_confluentVandermonde` | 15 `(a, m)` | `(0,1)/(2,1)`: `1 = 1`; `(1,0)/(1,1)`: `−1 = −1`; `(1,0)/(2,1)`: `1 = 1`; `(0,1,2)/(2,1,1)`: `4 = 4`; `(2,5,7)/1`: `30 = 30`; `(5)/(3)`: `1 = 1`; empty: `1 = 1`; `(0,0)/(1,1)`: `0 = 0`; `(0,0,1)/(1,0,1)`: `1 = 1`; `(3,−1,2)/(2,2,1)`: `2304 = 2304`; `(1,4)/(3,1)`: `27 = 27`; `(2,−3)/(3,2)`: `15625 = 15625`; `(0,0)/(2,0)`: `1 = 1`; `(2,1,−1,3)/(1,2,2,1)`: `9216 = 9216`; `(7)/(0)`: `1 = 1` | sound | none |
| 1.3 ordinary matrix, symmetries | ordinary vs Hasse on `(5)/(3)`, `(1,4)/(3,1)`, `(2,−3)/(3,2)`; scaling by `3` and translation by `5` on `(1,2,4)/(2,1,2)` | `2 = 2·1`, `54 = 2·27`, `31250 = 2·15625`; ratio `6561 = 3^8 = 3^(∑ m_i m_j)`; `324 = 324` | sound | none |
| `exists_full_row_minor` | `[[1,0,0],[0,1,0]]`; `[[1,1],[2,2]]`; `m = 0`; `m = 2`, `n = 1` | minor `1` on columns `(0,1)` and `0` on `(0,2)`; the only minor is `0`; empty minor `1`; no injective `c` | true, but already in Tau Ceti | R01 |
| 2.2 lift and reduction | `ℤ → ZMod 2`: `[[1]]`, `[[2]]` | `1 ↦ 1` lifts; `2 ↦ 0`, so the converse needs injectivity | sound | R01 (field clause) |
| `coordinates_mem_extended_ideal` | `ℤ[i]`, `J = 2ℤ`: `2 + 2i`, `1 + i`; ideal `(1 + i)`; `diag (i, i)` | coordinates `(2, 2)`; `(1, 1)`, not in `2ℤ[i]`; `(1+i) ∩ ℤ = 2ℤ` but `2ℤ[i] ≠ (1+i)`; `det = −1 ↦ (−1, 0)` vs coordinate determinants `0`, `1` | sound | none |
| `det_mem_prod_row_ideals` | `[[2,4],[3,9]]`, `J = (2ℤ, 3ℤ)`; `n = 0`; `[[2,3],[4,9]]` (columns); `[[2,3],[1,1]]` | `6 ∈ 6ℤ`; `1 ∈ ⊤`; `6` by the column form; `−1 ∉ 6ℤ` | sound | none |
| `unitriangular_mul_minor` | `U = [[1,0],[1,1]]` and `[[1,2],[0,1]]`, `A = [[1,2,0],[0,1,5]]`, `c = (0,1)`; `U = 2I`; a swap | `1 = 1`, `1 = 1`; `4`, excluded by `hdiag`; `−1`, excluded | sound | none |
| `det_gram_matrix_smul` | `U = [[1,0],[1,1]]`, `(e₁, e₂)`; `U = 2I`; random integer `U` with families of sizes `3×4`, `3×2`, `2×5`, `4×4`; `v = (e₁, e₁)`; `ι = ∅` | `1 = 1`; `16 = 4²·1` (`det U` alone gives `4`); `14175 = 14175`, `0 = 0`, `4131 = 4131`, `4665600 = 4665600`; `0 = 0`; `1 = 1` | sound | none |
| 3.3 complex form | `U = [[i]]`, `(e₁)` | `⟪ie₁, ie₁⟫ = 1 = ‖i‖²`; `(det U)² = −1` would be wrong | sound | none |
| `derivative_prod_mem_ideal_pow` | `X`, `g = 1`, `J = (0)`, `K = 0`; `X, X`, `K = 0`; `X⁴`, `g = X⁵`, `K = 3`; `ℤ`, `X³`, `J = (3)` | `0 ∈ (0)`; `X²(0) = 0`, while `D²X²(0) = 2 ∉ (0)²`; `D^k X⁹(0) = 0` for `k ≤ 3`; `0, 0, 0, 6 ∈ (3)` | sound | none |
| `hasseDeriv_prod_mem_ideal_pow` | `ℤ`, `X³`, `J = (3)`; `ι = ∅` | Hasse jets `0, 0, 0, 1`, so the hypothesis fails at `k = 3`; `J⁰ = ⊤` | sound | none |
| `pderiv_prod_mem_ideal_pow` | `f = (Z)`, `g = W`, `a = (0, 5)`, `J = (0)`, `K = 0` | `Z(0,5) = 0` and `ZW(0,5) = 0 ∈ (0)`; `K = 1` would need `∂_Z Z = 1 ∈ (0)` | sound | none |
| `norm_det_le_factorial_prod` | `n = 0`; `[[1,1],[1,−1]]` with `B = (1,1)` and `(1,2)`; `[[1,0],[10,1]]`, `B = (1,10)`; `3×3` `±1` matrix with `det = 4` | `1 ≤ 1`; `2 ≤ 2`, `2 ≤ 4`; `1 ≤ 20`; `4 ≤ 6` (Hadamard gives `≈ 5.2`) | sound | none |
| 4.2 ratio `n!/n^(n/2)` | `n = 1, …, 5` | `1, 1, 1.155, 1.5, 2.147`; exceeds `1` from `n = 3` on, as stated | sound | none |
| `norm_hasseDeriv_eval_le` | `X²`, `k = 1`, `a = A = 2`; `k = 3 > d = 2`; `1 + X + X²`, `a = A = 1`; bivariate `ZW`, `d = (1,0)`, `a = A = (2,3)` | `4 ≤ 5`; `0 ≤ 0` (empty sum); `3 ≤ 3`, coarse bound `12`; `3 ≤ 3` | sound | none |
| Layer 4 Examples row bounds | `a = (0,1)`, `m = (2,1)`: `A = (0,1)`; `A = 1` | `(1,1,1)` and `1 ≤ 6`; `(1,2,1)` and `1 ≤ 12`; Euclidean norms `1, 1, √3` | sound | none |
| 0.1, 0.2, 0.5 | box `{μ₀ ≤ 1, μ₁ ≤ 2}` and ball of radius `2`; `T = {0,1,2}`, points `0, 1`, `d = (0, 1)`; `ZMod 2`, `X²`, `d = 2`; `p = 3`: `X²`, `X³` | ranks `6`, `6`, with `ZW²` and `Z²` separating; `[[1,0,0],[0,1,2]]`; Hasse `1`, ordinary `0`; `2` and `1`; `6 = 0` vs `1` | sound | none |
| 5.1 | `ℚ(i)`: `2(1+i)`, `1+i`; `ℚ × ℚ`: `(1, 0)`; `ℚ(√2)`: `3(1+√2)` | `N = 8`, `4 ∣ 8`; `N = 2`, `4 ∤ 2`; norm `0`; `N = −9`, `9 ∣ −9` | sound | none |
| 5.2 | `1+i`; `z = 12`, `P = {2,3}`, `e = (2,1)`; `P = ∅`; `P = {2}`, `e = 3` | `√2·√2 = 2`; `log 12 ≤ log 12`; `0 ≤ log 12`; `log 8 ≤ log 12` with `8 ∤ 12`. `Finset.prod_primes_dvd` gives only `6 ∣ 12` | sound | R05 |
| Worked examples | `[[2,4,6],[3,6,12]]`; `[[1,√2],[√2,2]]`, `[[1,√2],[√2,3]]`; `[[2,4],[5,13]]` | minors `0, 6, 12 ∈ 6ℤ`; determinants `0`, `1`; `26 − 20 = 6` | sound | none |

## Not verifiable

- none. IK, P, M, Laurent, W and Treil are in the sources cache and were read at every locator above.
- Ownership against open pull requests was checked with `roadmaps grep` and the overlap list over all 464 open heads.

## Source issues

- **Gap** in IK at Lemma 11.17, p. 284: the source shows `C(mq, j) = 0` in characteristic `p` for `0 < j < q` by writing it as `(mq/j)·C(mq − 1, j − 1)`, which divides by `j`; it should argue `v_p(mq) ≥ v_p(q) > v_p(j)`, since `p` may divide `j` when `q` is a proper power of `p`; affects the proof.
