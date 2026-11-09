# Review of ArithmeticInterpolationDeterminants (pull request #1905 at efb9003)

**Verdict:** needs changes

All five findings of the previous review (of `b6b38f9`) are repaired; the evidence is the first table under *Verified sound*. This review has seven findings. One is blocking:

- R01 (P2): the 2.2 criterion, also stated in `Suggested.lean`, is already in the pinned Tau Ceti.

The six P3 findings:

- R02: the Frobenius test omits its Hasse-jet form.
- R03, R04, R05: three plan items repeat pinned lemmas without citing them.
- R06: one symbol clashes with another.
- R07: one Lean statement is narrower than its README target.

## R01 (P2) — the extended-ideal coordinate criterion is already in the pinned Tau Ceti

Location:
- `TauCetiRoadmap/ArithmeticInterpolationDeterminants/README.md:707–709`: "Prove `coordinates_mem_extended_ideal`: for an ideal `J` of `R` and `x ∈ A`, `x ∈ J.map (algebraMap R A)` iff every coordinate `b.repr x i` lies in `J`."
- `Suggested.lean:150–162`, the whole Layer 2 section.
- The Layer 2 list at `README.md:25` and the Scope bullet at `README.md:49–51`.

Claim: 2.2's membership criterion is a target owned here.

Witness:
- Tau Ceti `Ideal.mem_map_algebraMap_iff` (`TauCeti/RingTheory/Ideal/Extended.lean:112`) gives `x ∈ I.map (algebraMap R A) ↔ x ∈ I • ⊤`.
- `Module.Basis.mem_smul_top_iff` (`TauCeti/RingTheory/Ideal/Operations.lean:290`) gives `x ∈ I • ⊤ ↔ ∀ i, b.repr x i ∈ I`.

Repair:
- Delete `coordinates_mem_extended_ideal` and the then-empty `/-! ## Layer 2 … -/` section from `Suggested.lean`.
- Update the module docstring and `README.md:25` (Layer 2 then names no Lean statement).
- In 2.2, replace the target by a citation. The criterion is `(Ideal.mem_map_algebraMap_iff J).trans b.mem_smul_top_iff`. For commutative `A`, Mathlib's `Ideal.smul_top_eq_map` (`Mathlib/RingTheory/Ideal/Maps.lean:290`) serves in place of the first lemma. List both Tau Ceti lemmas under *From Tau Ceti* and under *Left to other roadmaps and to the libraries*. The criterion needs no finiteness of the basis.
- Keep as targets the coefficient matrix and the reduction diagram. For the reduction, cite Mathlib's `IsLocalRing.basisQuotient` (`Mathlib/RingTheory/LocalRing/Quotient.lean:85`) as the case of the maximal ideal of a local ring.
- Keep the four Checks of 2.2 as Checks of the cited criterion.
- Reword `README.md:49–51` and `README.md:744` (2.2's dependencies).

Tested: in a scratch file importing `TauCeti.RingTheory.Ideal.Extended` and `TauCeti.RingTheory.Ideal.Operations`, three proofs elaborate at the pins with no error:
- the term `(Ideal.mem_map_algebraMap_iff J).trans b.mem_smul_top_iff`, for the exact signature of `Suggested.lean:157–159`;
- `rw [← Submodule.restrictScalars_mem R, ← Ideal.smul_top_eq_map, b.mem_smul_top_iff]`;
- the first term again, without `[Fintype ι]`.

## R02 (P3) — the Frobenius-graph test omits its Hasse-jet form, which holds for every `m < p^e`

Location:
- `README.md:462–465`: "a finite set `S ⊆ K`, an order bound `m < p` … there are `a ∈ S` and `k ≤ m` with `MvPolynomial.eval ![a, a^q] (∂_Z^k F) ≠ 0`".
- `Suggested.lean:84–90`.

Claim: the only nonvanishing test planned is the ordinary-jet one with `m < p`.

The route at `README.md:466–476` first proves a stronger fact: some `D^[k] f (a)` with `k ≤ m` is nonzero, and it equals the Hasse jet `eval ![a, a^q] (∂_Z^[k] F)` whenever `k < q`. This is the range of IK Lemma 11.17 (`k < q`, IK line 885, p. 284). So the Hasse form holds for all `m < q = p^e`, even at `e = 0`, but it is not a target.

Witness: `p = 2`, `e = 2`, `K = 𝔽₂`, `F = Z²`, `S = {0}`, `m = 2`.
- The hypotheses hold except `m < p`: the `Z`-degree is `2 < 4`, `natDegree X² = 2 < 1 · 3`, and `m < 4`.
- The ordinary jets of orders `0, 1, 2` at `(0, 0)` are `0, 0, 2 = 0`.
- The Hasse jet `∂_Z^[2] Z² = 1` is nonzero.

Repair:
- In 0.6, state first `exists_nonzero_hasse_jet_on_frobenius_graph` (Lean statement below). It keeps the hypotheses of the ordinary test, with `m < p ^ e` in place of `m < p` and without `0 < e`.
- Derive the ordinary test from it by 0.5, since `k ≤ m < p`.
- Add the witness as a Check showing that `m < p` is needed for the ordinary form.
- Add the statement to `Suggested.lean` beside the ordinary test, and name it in `README.md:23–24` and in the Summary.

```lean
theorem exists_nonzero_hasse_jet_on_frobenius_graph {e : ℕ}
    (F : MvPolynomial (Fin 2) K) (hF : F ≠ 0) (hZ : F.degreeOf 0 < p ^ e)
    (S : Finset K) (m : ℕ) (hm : m < p ^ e)
    (hdeg : (powerSubstitution (p ^ e) F).natDegree < S.card * (m + 1)) :
    ∃ a ∈ S, ∃ k ≤ m,
      MvPolynomial.eval ![a, a ^ p ^ e] (MvPolynomial.hasseDeriv (Finsupp.single 0 k) F) ≠ 0 := by
  sorry
```

Tested:
- The statement elaborates (with the binders of `Suggested.lean:75`) against the built module, with only the `sorry` warning.
- A brute-force check over prime fields `𝔽_p`, for `(p, e)` in `(2,0), (2,1), (2,2), (2,3), (3,0), (3,1), (3,2), (5,1)` with random `F`, `S` and every admissible `m < p^e`, found 0 violations in 31,494 instances.
- The same check of the stated ordinary test found 0 violations in 16,030 instances.

## R03 (P3) — Mathlib's Lagrange interpolation, the case of simple nodes, is not cited

Location: `README.md:85–91`, the Scope bullets on Hermite interpolation (first jets and ultrametric bounds only), and the statement of 1.1 at `README.md:527`.

Claim: Scope lists every existing special case of 1.1, but it omits Mathlib's.

Witness: Mathlib's `Lagrange.funEquivDegreeLT` (`Mathlib/LinearAlgebra/Lagrange.lean:383`) is, for `Set.InjOn v s`, the linear equivalence `degreeLT F #s ≃ₗ[F] (s → F)`, `f ↦ (f.eval (v i))_i`. With `s = univ` and `v = a`, it is `hermiteJet a 1` up to `Fin (∑ i, 1) ≃ Fin r` and `(Fin 1 → K) ≃ K`.

Repair:
- Add a Scope bullet: "*Interpolation at simple nodes*: Mathlib's `Lagrange.interpolate` and `Lagrange.funEquivDegreeLT`; 1.1 differs by arbitrary multiplicities and Hasse jets."
- Add a 1.1 Check: for `a = (0, 1)` and `m = (1, 1)`, `c₀ + c₁ X ↦ (c₀, c₀ + c₁)`, which are the values `funEquivDegreeLT` assigns. A definition that ordered the jet coordinates differently would disagree.

Tested: `#check @Lagrange.funEquivDegreeLT` at the pin, and the two values computed by hand.

## R04 (P3) — 3.2 plans closure lemmas that Tau Ceti has

Location: `README.md:775–785`: "for `U : Matrix (Fin m) (Fin m) R` with `U i i = 1` and `U i j = 0` for `i < j` (lower unitriangular) … closure of lower unitriangular matrices under products and inverses".

Claim: 3.2 encodes unitriangularity by hand and plans its closure properties.

Witness:
- Tau Ceti `Matrix.IsUpperUnitriangular.mul` and `Matrix.IsUpperUnitriangular.inv` (`TauCeti/LinearAlgebra/Matrix/Triangular.lean:405, 412`) give closure under products and inverses.
- `U` is lower unitriangular exactly when `Uᵀ.IsUpperUnitriangular`.

Repair:
- State 3.2's hypothesis as `Uᵀ.IsUpperUnitriangular`.
- Replace the closure item by a citation of `IsUpperUnitriangular.mul`, `.inv` and `.det_eq_one` through transposition. List them under *From Tau Ceti* and in the *Needs:* line.
- Drop `Matrix.mul_apply_diag_of_isLowerTriangular` from the *Needs:* line unless another step uses it.

Tested: `example (hU : U.transpose.IsUpperUnitriangular) : U.det = 1 := by rw [← Matrix.det_transpose]; exact hU.det_eq_one`, for `U : Matrix (Fin m) (Fin m) R`, elaborates. `#check` resolves `.mul` and `.inv`.

## R05 (P3) — 4.3's coarse bound is Tau Ceti's, and Scope says no cited lemma states such a bound

Location:
- `README.md:105–106`: "Target 4.3 is the order-`k` bound from a coefficient sup bound, which none of them states."
- `README.md:952–953`: "Give the coarse versions `‖D^[k] f (a)‖ ≤ H (d + 1) 2^d max(1, A)^d`".

Witness: Tau Ceti's `AbsoluteValue.apply_eval_hasseDeriv_le` (`TauCeti/RingTheory/MvPolynomial/Abv/Taylor.lean:92`). For `degreeOf i P ≤ L i` and `v (coeff s P) ≤ B`, it gives `v (eval a (hasseDeriv d P)) ≤ B ∏ (L i + 1) ∏ (2 max(v(a i), 1))^(L i)`. In one variable, with `L = d` and `B = H`, this is `H (d+1) 2^d max(‖a‖, 1)^d`.

Repair:
- Cite `AbsoluteValue.apply_eval_hasseDeriv_le` under Scope and *From Tau Ceti*, with `AbsoluteValue.apply_eval_le` (`TauCeti/RingTheory/MvPolynomial/Abv/Eval.lean:115`), the order-0 case.
- Restrict the owned part of 4.3 to the sharp binomial-sum bounds, on `Polynomial` and on an arbitrary support `T`.
- Derive the univariate coarse form from the sharp one via `∑_{j=k}^{d} choose j k · A^(j−k) ≤ (d+1) 2^d max(1, A)^d`, and cite Tau Ceti for the multivariate coarse form.
- Reword `README.md:105–106` accordingly.

Tested: `#check @AbsoluteValue.apply_eval_hasseDeriv_le` at the pin. On 300 random univariate instances, `lhs ≤ sharp bound ≤ coarse bound` held every time.

## R06 (P3) — `K` names both the field and the order bound in 0.5

Location: `README.md:441–444`: "Over a field `K` of characteristic `p` … Deduce, for a jet map through order `K < p` as in 0.2 with multi-indices `k e_0`, `k ≤ K`". `README.md:847` then cites "the bound `K < p` of 0.5".

Witness: the quoted paragraph uses `K` for the coefficient field and, two lines later, for a natural number below `p`.

Repair: rename the order bound in 0.5 to `N` (`k ≤ N < p`) and update the reference at `README.md:847`. The Lean `K : ℕ` of 3.4 has no field `K` in scope and can stay.

## R07 (P3) — `pderiv_prod_mem_ideal_pow` states the special case, with the general form left to the README

Location:
- `Suggested.lean:209–217`: `f : ι → MvPolynomial (Fin 2) R`, with `MvPolynomial.pderiv (0 : Fin 2)`.
- `README.md:844–845`: "the bivariate form for `∂_Z^k` and `MvPolynomial.eval a` at a point `a : Fin 2 → R`; give the version for an arbitrary variable set and a chosen partial derivative".

Claim: the named statement is the instance and the general statement is unnamed, which inverts "special cases are Checks".

Witness: the general statement, over `{σ : Type*} (s : σ)` with `f : ι → MvPolynomial σ R` and `a : σ → R`, elaborates. The current statement follows from it as the term `pderiv_prod_mem_ideal_pow' 0 f g a J K hf`.

Repair: state `pderiv_prod_mem_ideal_pow` in that generality. In 3.4, make the general form the target and the `∂_Z` form its instance (a Check, or a sentence of the route).

Tested: both declarations elaborate in a scratch file against the built module, with only the `sorry` warning on the general one.

## Verified sound

**Previous findings (review of `b6b38f9`).**

| Id | Status at this head | Evidence |
| --- | --- | --- |
| R01, minors restating Tau Ceti | repaired | `exists_full_row_minor` is gone from `Suggested.lean`. `README.md:107–120` cites `Matrix.linearIndependent_row_iff_exists_det_submatrix_ne_zero`, `le_rank_iff_exists_det_submatrix_ne_zero`, `linearIndependent_map_algebraMap_row_iff`, `rank_map` and `det_submatrix_mul_left`. 2.1 (`README.md:672–688`) keeps only the transport along a not-necessarily-injective ring map. `unitriangular_mul_minor` is now a README target |
| R02, `X^p` only | repaired | `Suggested.lean:55–90` states both identities and the test for `p ^ e`, with the Hasse bound `k < p ^ e`. Checks at `README.md:426–431`: `q = 4` at orders `1, 2, 3, 4`, and the `e = 0` control. The `e = 0` control for 0.6 is at `README.md:499–501` |
| R03, chain-rule weights | repaired | `README.md:398–402` uses `T^(ν 0) ((T + a)^q − a^q)^(ν 1) = T^(ν 0 + q ν 1)`. New Check at `README.md:435–437` (true value `1`, wrong weights `2`) |
| R04, DiophantineApproximationAndTranscendence for pinned objects | repaired | `README.md:99–106` and `257–260` cite `Polynomial.l1Norm`, `norm_eval_le_l1Norm_mul`, `l1Norm_hasseDeriv_le` and `hasseWronskian` from Tau Ceti. No supplier subsection for that roadmap remains; §1.7 is cited only as a deferral (`README.md:130–132`) |
| R05, `Finset.prod_primes_dvd` | repaired | `README.md:1028–1032` cites `Finset.prod_dvd_of_coprime` with `IsCoprime.pow`; the Check at `1043–1045` contrasts `4 · 3 ∣ 12` with `6 ∣ 12` |

**Gate, order and build.**
- The worker's gate and my rerun (`gate … --base origin/main`) both report `OK`, with `0` on every check.
- Dependency check: `depcheck: 239 roadmaps, 2352 edges, 0 problem(s)`, with no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 398, after IntegralIwasawaTheory (28), GenericDoublePointInterpolation (35) and CharacterSumsOverFiniteFields (156). DiophantineApproximationAndTranscendence is on main.
- GrothendieckNotesLemmas, the one supplier outside the order, is a new roadmap by another author and is named in the description's depends-on list.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml`.
- `lake env lean` on `Suggested.lean` at the pins (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`) gives 15 warnings, all "declaration uses `sorry`", and no error.
- Form: one module docstring; `namespace TauCetiRoadmap.ArithmeticInterpolationDeterminants`; Layer section comments in README order; the imports are `import Mathlib` and `TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic`, which `MvPolynomial.hasseDeriv` needs; no `lemma`, `set_option`, `#eval` or `#print`.
- The file has three `def`s, all with real bodies on native carriers: `powerSubstitution` (`MvPolynomial.aeval`), `hermiteJet` (`LinearMap.pi` of `leval ∘ hasseDeriv ∘ subtype`) and `confluentVandermonde` (`Matrix.of`).

**Signatures.** I ran `#check @name` on all 18 declarations in one scratch file importing the built module, and compared each elaborated type with its README statement. No section binder is lost, and the generality agrees with the README except R07.

Unused hypotheses (notes, not findings):
- `hB` in `norm_det_le_factorial_prod` follows from `hA i i`.
- `hH` in `norm_hasseDeriv_eval_le` follows from `hcoeff 0`.
- `[Fact p.Prime]` in `iterate_derivative_powerSubstitution`: only `(p ^ e : R) = 0` is used.
- 2.1's `IsDomain S` is not needed (McCoy's theorem); `R` must be a domain, since the ring `ℤ × ℤ` projected to `ℤ` refutes the claim otherwise.

**One-tactic probe.** On a scratch copy, each of the 15 theorems was tried with `first | rfl | (simp_all; done) | aesop | exact?`, with the Kronecker, Gram, AbsoluteValue, Hadamard, Taylor and extended-ideal modules imported.
- All 15 fail: `exact?` finds nothing, or the attempt times out.
- `coordinates_mem_extended_ideal` closes with the single composite `exact` of R01.
- The other 14 need real proofs. `norm_det_le_factorial_prod` follows from Tau Ceti's Hadamard bound in a few steps, via `‖A i‖ ≤ √n B_i` and `n^(n/2) ≤ n!`. It is not stated at the pins, so it is a genuine target.

**Headline theorems** (`README.md:12–16`; module docstring):
- `hermiteJet_bijective`, `det_confluentVandermonde`, `exists_nonzero_ordinary_jet_on_frobenius_graph` and `det_gram_matrix_smul` are all stated, with no stand-in.
- Layer 5 is left to the README in both files, with the reason given.
- R02 adds the Hasse-jet test as a general form of the third.

**Library declarations opened at the pins.** All 135 names cited in the README resolve with `#check`. I read these in full:
- Tau Ceti `MvPolynomial.coeff_aeval_X_pow_weight`, `injOn_aeval_X_pow`, `taylor_aeval_X_pow`, `eval_hasseDeriv_aeval_X_pow` (`RingTheory/MvPolynomial/Kronecker.lean:96, 109, 139, 164`). The README's description of the weights matches line 168.
- `Polynomial.eval_hasseDeriv_rootMultiplicity_ne_zero` and `eval_hasseDeriv_X_sub_C_pow` (`Algebra/Polynomial/Taylor.lean:101, 121`).
- `Matrix.det_submatrix_mul_left` (`LinearAlgebra/Matrix/MaximalMinor.lean:72`, any `e : m → n`).
- `Matrix.det_mul_transpose_mul_left` (`LinearAlgebra/Matrix/Gram.lean:70`).
- `Matrix.abv_det_le_prod_sum_abv` and `abv_det_le_prod_sum_abv'` (`LinearAlgebra/Matrix/AbsoluteValue.lean:62, 46`; `∏ ∑`, not `n! ∏`).
- `OrthonormalBasis.det_gram_eq_norm_det_sq` and `norm_det_le_prod_norm` (`Analysis/InnerProductSpace/Gram/Hadamard.lean:86, 77`).
- `Polynomial.norm_eval_le_l1Norm_mul` and `l1Norm_hasseDeriv_le` (`Analysis/Polynomial/L1Norm.lean:217, 293`; `[NormOneClass R]`).
- `Matrix.IsUpperUnitriangular.det_eq_one` (`LinearAlgebra/Matrix/Triangular.lean:140`).
- Mathlib `Polynomial.count_roots` and `card_roots'` (`IsDomain`).
- `Polynomial.pairwise_coprime_X_sub_C` (over a field, injective nodes).
- `Ideal.quotientInfRingEquivPiQuotient` (`Finite ι`, pairwise coprime).
- `Polynomial.lt_rootMultiplicity_iff_isRoot_iterate_derivative` (`CharZero`, as the README says).
- `Algebra.norm_ne_zero_iff` (domains, free, finite) and `Algebra.norm_eq_prod_embeddings` (separable, `IsAlgClosed E`).
- `NumberField.RingOfIntegers.rank`, `Algebra.coe_norm_int`, `Finset.prod_dvd_of_coprime` and `Matrix.det_le` (uniform `n! • x^n`).

**Duplication by object.** I grepped Mathlib and Tau Ceti for each owned object.
- Hermite interpolation with multiplicities: Tau Ceti's `RingTheory/Polynomial/Hermite/` holds the Hermite polynomials, a different object. Mathlib's Lagrange file covers simple nodes (R03).
- The confluent determinant, the power substitution identities and the row-ideal determinant: none at the pins. Tau Ceti's `TauCeti.det_mem_of_mem_span` and `det_mem_minorsIdeal` are different statements.
- The Gram change of family for an arbitrary family: none. Mathlib's `LinearMap.toMatrix₂` change of basis concerns bases only, and Tau Ceti's IntegralLattice Gram lemmas concern lattice bases.
- Leibniz products in ideal powers: none.
- The row-dependent factorial bound: none.
- The sharp 4.3 bound: none, apart from the coarse form (R05).
- The one-node jet-divisibility criterion: none, so 1.2 stands.
- The reduction basis of 2.2 in general: none, beyond `IsLocalRing.basisQuotient`.

**Cross-roadmap citations resolved** (each against main or the open head named):
- CharacterSumsOverFiniteFields §4.1, at its head: the multiplicity criterion and root-count inequality, on `[Field F] [Finite F]`, as the README says.
- GenericDoublePointInterpolation §1.3 `firstJetMap` (its README line 451), §1.4 `firstJetMatrix` (523) and §4.6 (1414), at its head.
- IntegralIwasawaTheory §4.1c `exists_hasseDeriv_eval_eq_ite`, at the head of its new-roadmap pull request (its README line 610).
- GrothendieckNotesLemmas §1.3 `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand` and §1.4 `Polynomial.hasseDeriv_expand_mul`, for `k < p ^ e` in prime characteristic, at its head (lines 268–293). This matches the contract at `README.md:264–267`.
- DiophantineApproximationAndTranscendence §1.7 "Block substitution and nonzero jets" on main (line 885). Its open revision keeps §1.7 (line 810), so no id is dropped.
- Overlaps: no other open pull request changes this roadmap, and no id is dropped in either direction. No roadmap on main or in an open pull request cites this roadmap, as `README.md:1063` says.
- AnalyticNumberTheoryPartI §0.34c, which the description names as a consumer, sits at line 49 of the order, above this roadmap. It plans its own Hadamard target and states its Gram matrix itself; it owns no object owned here.

**Ownership by object.** I ran `roadmaps grep` over main and the 466 open heads for "confluent Vandermonde", "Hermite interpolation", "interpolation determinant", change of family, power substitution, row ideals, ideal powers, the factorial bound, the Frobenius graph and extended-ideal coordinates.
- Hermite interpolation appears only in IntegralIwasawaTheory and GlobalHolomorphicFunctions, as already deferred, and in LinearFormsInLogarithms, a forbidden supplier that is not cited.
- ExplicitNumberFields leaves interpolation determinants to its supplier.
- `powerSubstitution` in HabiroCyclotomicCompletions is `q ↦ q^n`, a different object.

I found no second owner.

**Sources: the seeded sample and every other locator.** All six cited texts are in the cache and were read at their locators.

| Target | Source at its locator | Verdict |
| --- | --- | --- |
| 0.1 | P Lemma 2.6.1 (P line 3886, printed p. 68) and (2.34) (line 3958, pp. 68–69): monomial expansion of derivatives over `ℤ` | supported |
| 0.3 | IK Lemma 11.17 (IK lines 882–885, p. 284); P, proof of Theorem 3.3.7 (lines 5172–5176, p. 87), `x_i ↦ t^(d^(i−1))`; Exercise 3.5(a) (lines 5272–5278, p. 89), over a subfield of `ℂ` | supported |
| 0.4 | IK Lemma 11.17, `k < q`, over a finite field with `q` elements; the README extends it to any ring of characteristic `p` and says so; IK p. 283 (lines 816–817), `E^p X^p = 1` | supported (proof gap in the source, below) |
| 0.5 | IK p. 282 (lines 787–790) and p. 283 (lines 816–818): ordinary derivatives of `X^p` vanish, Hasse orders `1…p−1` vanish, order `p` is `1` | supported |
| 0.6 | IK Lemma 11.16 (lines 862–880, pp. 283–284), over any field; Lemma 11.17 | supported; generality R02 |
| 1.3 | W, proof of Lemma 3.24 (W lines 5356–5373, p. 100): block columns `C(µ−1, k) X_j^(µ−1−k)`, `T_j ≥ 1`. Exercise 3.11 (lines 5912–5917, p. 111): `± ∏ (X_i − X_j)^(T_i T_j)` | supported; sign fixed here |
| 2.1 | Treil (4.2), p. 89 (Treil lines 4620–4624): determinant as an integer polynomial in the entries | supported |
| 2.2 | M (4), p. 22 (M line 1016); extension of scalars, p. 23 (lines 1042–1052); pp. 59–60 (lines 2640–2647) | supported (target cut by R01) |
| 3.1 | Treil (4.2), p. 89: one entry per column per term, and per row since `σ` is a bijection | supported |
| 3.2 | Treil p. 81 (line 4267), triangular determinant; Theorem 3.5, p. 82 (line 4313) | supported |
| 3.3 | M formula (6), p. 32 (M lines 1433–1450) | supported |
| 3.4 | IK Lemma 11.14 and (11.22), p. 283 (lines 820–829) | supported |
| 4.1 | W Lemma 2.8, p. 43 (W lines 2603–2625; factor `L! ∏ max`); §10.2.2 starts on p. 334 (line 16923) | supported |
| 4.2 | W, proof of Lemma 3.25, p. 101 (lines 5385–5397), `L × L` complex matrices | supported |
| 4.3 | IK definition of `E^k`, p. 282 (lines 792–800); P Lemma 2.6.1 and (2.34) | supported |
| 5.1 | M p. 31 (lines 1397–1408: `Nm(ββ′)`, `Nm(a) = a^n`); Corollary 2.20, p. 32 (lines 1419–1422, separable) | supported |
| 5.2 | M Corollary 2.20; W §10.2, pp. 329–356 (contents line 267) | supported |
| Scope | Treil Theorem 6.1, p. 96 (line 4948); Laurent §6.1, p. 219 (Laurent lines 456–466) | supported |

Note for the worker, outside this pull request: the board manifest records Laurent's locator as "§6.2" and W's as "§§2.4, 10.2". The README's §6.1, p. 219 and its W locators were verified as above.

**Adversarial table.** Determinants, Gram identities, binomial congruences and the brute-force tests were computed with an exact-arithmetic script. Rows of the confluent matrix follow the `finSigmaFinEquiv` order.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution` (def) | `B = 2`: `Z + W`, `Z + ZW`; `B = 3`: `Z²W + ZW²`; `F = ZW`, `a = 3` | `X + X²`; `X + X³`, coefficient of `X³` is `1`; `X⁵ + X⁷`, `7 ≤ 2 + 3·2 = 8`; `27 = eval ![3, 9] (ZW)` | sound | none |
| `powerSubstitution_injOn` | `B = 2`: `Z²` vs `W`; `B = 0`: `W` vs `1` | both map to `X²`, but `Z²` has `Z`-degree `2 ≮ 2`; `W ↦ 1`, the image of `1` | sound | none |
| `iterate_derivative_powerSubstitution` | `p = 2, e = 1`: `ZW`, `W`; `p = 2, e = 2`: `ZW`; `e = 0`: `W` | `D X³ = X² = φ(W)`; `D X² = 0 = φ(0)`; `D X⁵ = X⁴ = φ₄(W)`; `D X = 1 ≠ 0` | sound, `0 < e` needed | none |
| `hasseDeriv_powerSubstitution` | `C(i + qj, k) ≡ C(i, k) mod p` for `k < q`, `i < 40`, `j < 6`, seven pairs `(p, e)`; `k = q`, `F = W`; the 0.4 Checks | 0 violations; `1` vs `0` at `k = q` for `(2,1), (2,2), (3,1)`; `C(5,2) = 10 ≡ 1 (3)`, `C(7,3) = 35 ≡ 1 (2)`, `C(4,2) = 6 ≡ 0 (2)` | sound | none |
| 0.4 evaluated weights | `p = 3`, `F = Z²`, `k = 1`, `a = 2` | true value `1`; weights `T^(ν 0)` give `1`; weights `(T + a)^(ν 0)` give `2` | sound | none |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | `𝔽₄` Checks; brute force over `𝔽_p`; `e = 0` control; R02 witness | `F(c, c²) = 1`; `2 < 2` fails; `q = 4`: `F(a, a⁴) = 0` on `𝔽₄`, `4 < 4` fails, `4 < 8` with `∂_Z F = 1`; 0 violations in 16,030 instances; `e = 0`: all jets `0`; witness: ordinary `0, 0, 0`, Hasse `0, 0, 1` | true; Hasse form missing | R02 |
| proposed Hasse test | brute force with `m < p^e`, including `e = 0` | 0 violations in 31,494 instances; elaborates | sound | R02 |
| `hermiteJet`, `hermiteJet_bijective` | `r = 0`; `a = (0, 0)`, `m = (1, 1)`; `a = (0, 1)`, `m = (2, 1)`, datum `(1, 0, 0)`; `m = (0, 3)`, `a = (5, 0)`; `m = (1, 1)`, `a = (0, 1)` | dimensions `0 = 0`; `X ↦ (0, 0)`, so injectivity of `a` is needed; preimage `1 − X²`; identity on coefficients; `(c₀, c₀ + c₁)`, the Lagrange values | sound | R03 |
| `all_jets_vanish_iff_dvd` | `a = (0, 1)`, `m = (1, 1)`: `X² − X`, `X`; `a = 0`, `m = (2)`: `X`, `X²`; `f = 0` | jets `(0, 0)` and `X(X − 1) ∣ f`; `f(1) = 1` and not divisible; `D^[1] X (0) = 1`, `X² ∤ X`; both jets of `X²` vanish and `X² ∣ X²`; `P ∣ 0` | sound | none |
| `det_confluentVandermonde` | 17 listed `(a, m)` and 300 random draws (`r ≤ 4`, `m_i ≤ 3`) | `(0,1)/(2,1)`: `1 = 1`; `(1,0)/(1,1)`: `−1 = −1`; `(1,0)/(2,1)`: `1 = 1`; `(0,1,2)/(2,1,1)`: `4 = 4`; `(2,5,7)/1`: `30 = 30`; `(5)/(3)`: `1 = 1`; empty: `1 = 1`; `(0,0)/(1,1)`: `0 = 0`; `(0,0,1)/(1,0,1)`: `1 = 1`; `(3,−1,2)/(2,2,1)`: `2304 = 2304`; `(1,4)/(3,1)`: `27 = 27`; `(2,−3)/(3,2)`: `15625 = 15625`; `(0,0)/(2,0)`: `1 = 1`; `(2,1,−1,3)/(1,2,2,1)`: `9216 = 9216`; `(7)/(0)`: `1 = 1`; `(1/2,3)/(2,2)`: `625/16 = 625/16`; `(1,2,0)/(0,3,2)`: `64 = 64`; random: 0 violations | sound | none |
| 1.3 ordinary matrix and symmetries | `(5)/(3)`, `(1,4)/(3,1)`, `(2,−3)/(3,2)`, `(0,1,2)/(2,1,1)`, `(0)/(3)`; on `(1,2,4)/(2,1,2)`: scaling by `3`, translation by `5`, swap of the first two nodes | `2 = 2·1`, `54 = 2·27`, `31250 = 2·15625`, `4 = 1·4`, `2 = 2·1`; ratio `6561 = 3^8`; `324 = 324`; `324 = 324` (`m₀m₁ = 2`, even) | sound | none |
| 2.1 transport | `ℤ → ZMod 2`: `[[1]]`, `[[2]]`; `[[1,0,0],[0,1,0]]`, `c = (0,1), (0,2)`; `[[1,1],[2,2]]` | `1 ↦ 1` lifts; `2 ↦ 0`; minors `1` and `0` over both rings; the only minor is `0` | sound | none |
| `coordinates_mem_extended_ideal` | `ℤ[i]`, `J = 2ℤ`: `2 + 2i`, `1 + i`; `diag(i, i)`; the Lean term | `(2, 2) ∈ 2ℤ`; `1 ∉ 2ℤ`; `det = −1`, coordinates `(−1, 0)`, while the coordinate matrices have determinants `0` and `1`; one `exact` closes it | true, already in Tau Ceti | R01 |
| `det_mem_prod_row_ideals` | `[[2,4],[3,9]]`; `[[2,2],[1,1]]`; `[[2,3],[2,3]]`; `[[2,3],[4,9]]`; `[[2,3],[1,1]]`; 200 random with rows in `r_i ℤ` | `6 ∈ 6ℤ`; `0 ∈ 2ℤ`; `0`; `6` by the column form; `−1 ∉ 6ℤ`; 0 violations of `∏ r_i ∣ det` | sound | none |
| 3.2 | `A = [[1,2,0],[0,1,5]]`, `c = (0,1)`, with `U = [[1,0],[1,1]]`, `[[1,2],[0,1]]`, `2I`, the swap | minors `1`, `1`, `4` (excluded), `−1` (excluded) | sound; closure already in Tau Ceti | R04 |
| `det_gram_matrix_smul` | random integer `U` with families of sizes `3×4`, `3×2`, `2×5`, `4×4`, `1×3`; `U = [[1,0],[1,1]]` on `(e₁, e₂)`; `U = 2I`; `(e₁, e₁)`; `ι = ∅` | `1024 = 1024`, `0 = 0`, `17820 = 17820`, `1166400 = 1166400`, `36 = 36`; `1 = 1`; `16 = 4²·1` (a single `det U` gives `4`); `0 = 0`; `1 = 1` | sound | none |
| 3.3 complex form | `U = [[i]]`, `(e₁)` | `⟪ie₁, ie₁⟫ = 1 = ‖i‖²`; `(det U)² = −1` would be wrong | sound | none |
| `derivative_prod_mem_ideal_pow` | `X, X` with `J = (0)`, `K = 0`; `X⁴` with `g = X⁵`, `K = 3`; `ℤ`, `X³`, `J = (3)`; `ι = ∅` | `X²(0) = 0 ∈ (0)`, while `D²X²(0) = 2 ∉ (0)²`; `D^k X⁹(0) = 0`; ordinary jets `0, 0, 0, 6 ∈ (3)`; `J⁰ = ⊤` | sound | none |
| `hasseDeriv_prod_mem_ideal_pow` | `ℤ`, `X³`, `J = (3)` | Hasse jets `0, 0, 0, 1`, so the hypothesis fails at `k = 3` | sound | none |
| `pderiv_prod_mem_ideal_pow` | `f = (Z)`, `g = W`, `a = (0, 5)`, `J = (0)`, `K = 0`; the general `σ` form | `Z(0,5) = 0 ∈ (0)`, `ZW(0,5) = 0 ∈ (0)`; the bivariate statement is the instance `s = 0` | sound; narrower than the README | R07 |
| `norm_det_le_factorial_prod` | `n = 0`; `[[1,1],[1,−1]]` with `B = (1,1)` and `(1,2)`; `[[1,0],[10,1]]`, `B = (1,10)`; 300 random; all `3×3` `±1` matrices | `1 ≤ 1`; `2 ≤ 2`, `2 ≤ 4`; `1 ≤ 20`; 0 violations; maximum `4 ≤ 6` (Hadamard gives `5.196`) | sound | none |
| 4.2 ratio `n!/n^(n/2)` | `n = 1, …, 5` | `1, 1, 1.155, 1.5, 2.147`: above `1` from `n = 3` on, as stated | sound | none |
| `norm_hasseDeriv_eval_le` | `X²`, `k = 1`, `a = A = 2`; `k = 3 > d = 2`; `1 + X + X²`, `a = A = 1`; 300 random | `4 ≤ 5`; `0 ≤ 0`, empty sum; `3 ≤ 3`, coarse `12`; 0 violations of `lhs ≤ sharp ≤ coarse` | sound; coarse form already in Tau Ceti | R05 |
| Layer 4 Examples | rows of `(0,1)/(2,1)`, with `A = (0, 1)` and with `A = 1` | `B = (1, 1, 1)`, `1 ≤ 6`; `B = (1, 2, 1)`, `1 ≤ 12`; Euclidean norms `1, 1, √3` | sound | none |
| 0.1 | box `{μ₀ ≤ 1, μ₁ ≤ 2}` vs ball of radius `2`; `n = 1`, `N = 3` | ranks `6` and `6`, with `ZW²` only in the box and `Z²` only in the ball; `X² ∈ degreeLT 3`, `X³ ∉` | sound | none |
| 0.2 | `T = {0,1,2}`, points `0, 1`, `d = (0, 1)`; `ZW` at `(2, 3)`; `ZMod 2`, `X²`, `d = 2`; `ℤ`, point `3` mod `3` | `[[1,0,0],[0,1,2]]`; values `3, 1, 0`; Hasse `1` vs ordinary `0`; `[1, 3] ↦ [1, 0]` | sound | none |
| 0.5 | `p = 3`: `X²`, `X³` at `0`; `p = 2`, `k = 1` | `2` and `1`; `6 = 0` vs `1`; `1! = 1` | sound | notation R06 |
| 5.1 | `ℚ(i)`: `2(1+i)`, `1+i`; `ℚ × ℚ`: `(1, 0)`; `m = 0` | `N = 8`, `4 ∣ 8`; `N = 2`, `4 ∤ 2`; norm `0`; `0 ∣ 0` | sound | none |
| 5.2 | `1+i`; `z = 12`, `P = {2,3}`, `e = (2,1)`; `P = ∅`; `P = {2}`, `e = 3` | `√2·√2 = 2`; `4·3 ∣ 12`, `log 12 ≤ log 12`; `0 ≤ log 12`; `8 ∤ 12` and `log 8 ≤ log 12` | sound | none |
| Worked examples | `[[2,4,6],[3,6,12]]`; `[[1,√2],[√2,2]]`, `[[1,√2],[√2,3]]`; `ℚ(√2)`: `3(1+√2)`; `ℚ(√−5)`: `2+√−5`; Layer 0, 1 and 3 Examples | minors `0, 6, 12 ∈ 6ℤ`; determinants `0`, `1`; norm `−9`, embedding product `9`; norm `9`; `X⁴ + X ↦ X³ + 1, 0`; `1 − X²`, `4`; `[[2,4],[5,13]]`, `6` | sound | none |

## Not verifiable

- None. IK, P, M, Laurent, W and Treil are in the sources cache and were read at every locator above.
- Ownership against open pull requests was checked with `roadmaps grep` over main and all 466 open heads, and with the overlap list.

## Source issues

- **Gap** in IK at Lemma 11.17, p. 284: the source shows `C(mq, j) = 0` in characteristic `p` for `0 < j < q` by writing it as `(mq/j)·C(mq − 1, j − 1)`, which divides by `j`; it should argue `v_p(mq) ≥ v_p(q) > v_p(j)`, since `p` may divide `j` when `q` is a proper power of `p`; affects the proof.
- **Misprint** in IK at the proof of Corollary 11.15(1), p. 283: the source says the Hasse derivatives of `X − a` vanish for orders above `2`; it should say for orders `≥ 2`, which the argument (only orders `0, 1` contribute) uses; affects nothing.
- **Misprint** in IK at Lemma 11.16, p. 283: the source says `f` has a zero of order greater than `ℓ`; it should say at least `ℓ`, as the stated equivalent (divisibility by `(X − a)^ℓ`) shows; affects nothing.
