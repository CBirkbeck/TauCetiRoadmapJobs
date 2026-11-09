# Review of ArithmeticInterpolationDeterminants (pull request #1905 at e1cb5e5)

**Verdict:** needs changes

All seven findings of the previous review (of `efb9003`) are repaired; the evidence is the first table under *Verified sound*. The gate passes, the dependency check reports no problem, `Suggested.lean` elaborates with only the fifteen `sorry` warnings, every sampled locator supports its target, and the adversarial computations found no false statement. This review has three findings, none blocking:

- R01: one hypothesis of `powerSubstitution_injOn` is unused, and the README presents its absence as a counterexample.
- R02: the Summary, Scope and Conventions bound the exponent `e` below by `1` where the Hasse statements and the Lean admit `e = 0`.
- R03: one open roadmap builds the Hermite interpolation polynomial over `ℂ` as a step and is not listed in Scope.

## R01 (P3) — `hB : 0 < B` in `powerSubstitution_injOn` is unused: at `B = 0` the statement holds vacuously

Location:
- `TauCetiRoadmap/ArithmeticInterpolationDeterminants/Suggested.lean:50–52`: `theorem powerSubstitution_injOn (B : ℕ) (hB : 0 < B) : Set.InjOn (powerSubstitution B) {f | f.degreeOf 0 < B}`.
- `README.md:422`: "for `B > 0`, the substitution is injective on the set of `F` with `Z`-degree below `B`".
- `README.md:430–431`: "For `B = 0` the substitution sends `W` to `1` and is not injective on any strip containing `W` and `1`."

Claim: the Check reads as the reason `B > 0` is needed. It is not: no polynomial has `Z`-degree below `0`, so the set in the statement is empty at `B = 0` and `Set.InjOn` holds for every `B`.

Witness: in a scratch copy of the file, the statement without `hB` is proved from the stated one by a case split on `B` (`rcases Nat.eq_zero_or_pos B with rfl | hB`; in the first case `intro f hf; simp at hf` closes the goal). It elaborates with no error at the pins. The strip on which `powerSubstitution 0` fails to be injective, `{μ | μ 0 < 1}` with `W ↦ 1` and `1 ↦ 1`, is not the strip of the statement.

Repair:
- Drop `hB` from the Lean statement and "for `B > 0`" from `README.md:422`.
- Reword the Check at `README.md:430–431` as the negative control it is: at `B = 0`, `powerSubstitution 0` sends `W` and `1` both to `1`, so injectivity fails on the strip `{μ | μ 0 < 1}`; the strip of the statement, `{μ | μ 0 < 0}`, is empty, and the bound in the set must be `B` itself.

Tested: the hypothesis-free statement elaborates and is proved as above; the proof depends on nothing else in the file.

## R02 (P3) — the exponent range `e ≥ 1` in the Summary, Scope and Conventions contradicts 0.4, 0.6 and the Lean

Location:
- `README.md:3–4`: "the Frobenius power substitution `Z ↦ X, W ↦ X^q` for every power `q = p^e` (`e ≥ 1`) of the characteristic `p`, with its derivative identities and nonvanishing test".
- `README.md:46–47`: "the ordinary and Hasse derivative identities through `powerSubstitution (p^e)` in characteristic `p` for every `e ≥ 1`".
- `README.md:191–192`: "the Frobenius substitution is `powerSubstitution q` with `q = p^e`, `e ≥ 1`".

Claim: `hasseDeriv_powerSubstitution` (`Suggested.lean:68–72`) carries no `0 < e`, 0.4 says "for every `e` and every `k < q`" (`README.md:454–455`), and the Hasse test of 0.6 is stated and Checked at `e = 0` (`README.md:525–526, 573–575`) through `powerSubstitution 1`, which the Conventions do not call a Frobenius substitution.

Witness: the three quoted passages against `README.md:16` ("every `e ≥ 0`") and `README.md:454–455`.

Repair: in the Summary and the Scope bullet say "for every `e ≥ 0`, with `e ≥ 1` for the ordinary identity and the ordinary test"; in the Conventions define the Frobenius substitution as `powerSubstitution (p^e)` for every `e ≥ 0`, the substitution `W ↦ X` at `e = 0`.

## R03 (P3) — GlobalHolomorphicFunctions §2.5 builds the Hermite interpolation polynomial over `ℂ`, and Scope does not list it

Location: `README.md:92–103`, the Scope bullets listing the existing special cases of 1.1 (Mathlib's Lagrange interpolation, GenericDoublePointInterpolation §4.6, IntegralIwasawaTheory §4.1c).

Claim: Scope lists every existing special case of Hermite interpolation, but omits one on an open head earlier in the merge order.

Witness: `TauCetiRoadmap/GlobalHolomorphicFunctions/README.md:1078–1082` at the head of its pull request (§2.5): "Build a finite Hermite interpolation polynomial P matching those jets, using the Chinese remainder theorem for the pairwise coprime powers `(X-a)^(m_a+1)`", for finitely many points of `ℂ` and prescribed jet orders, as a step of its pole-pushing refinement. This is the `K = ℂ` case of the quotient comparison of 1.2 (`README.md:658–663`).

Repair: add a Scope bullet "*Finite-jet interpolation over `ℂ` inside Runge approximation*: GlobalHolomorphicFunctions §2.5 constructs, by the Chinese remainder theorem, a polynomial with prescribed jets at finitely many points of `ℂ`, as a step of its approximation theorem. Targets 1.1–1.2 own the statement over every field as a linear equivalence on `degreeLT`, with its kernel, adapted basis and determinant; that step is the case `K = ℂ` of the quotient comparison of 1.2."

## Verified sound

**Previous findings (review of `efb9003`).**

| Id | Status at this head | Evidence |
| --- | --- | --- |
| R01, extended-ideal criterion already in Tau Ceti | repaired | `Suggested.lean` has no Layer 2 section (line 167 goes from Layer 1 to Layer 3) and no `coordinates_mem_extended_ideal`. `README.md:146–156` cites `Ideal.mem_map_algebraMap_iff`, `Module.Basis.mem_smul_top_iff`, `Ideal.smul_top_eq_map` and `IsLocalRing.basisQuotient`; `README.md:316–318` lists the two Tau Ceti lemmas; 2.2 (`README.md:791–795`) consumes the composite and keeps the coefficient matrix and reduction diagram as targets; the four Checks are kept (`README.md:825–834`) |
| R02, Hasse form of the test missing | repaired | `exists_nonzero_hasse_jet_on_frobenius_graph` at `Suggested.lean:87–93`, with `m < p ^ e` and no `0 < e`; README 0.6 (`README.md:525–542`) states it first and derives the ordinary form by 0.5 (`544–549`); the witness `p = 2`, `e = 2`, `F = Z²`, `S = {0}`, `m = 2` is a Check (`576–580`); named at `README.md:15–17, 26` |
| R03, Lagrange case not cited | repaired | Scope bullet `README.md:92–96`; the Check `a = (0, 1)`, `m = (1, 1)`, `c₀ + c₁ X ↦ (c₀, c₀ + c₁)` at `README.md:634–636` |
| R04, closure lemmas planned | repaired | 3.2 (`README.md:876–895`) states the hypothesis as `Uᵀ.IsUpperUnitriangular` and consumes `IsUpperUnitriangular.mul`, `.inv`, `.det_eq_one` through `transpose_mul` and `transpose_nonsing_inv`; the Scope bullet `README.md:140–145`; `mul_apply_diag_of_isLowerTriangular` is gone |
| R05, coarse bound is Tau Ceti's | repaired | `README.md:117–125` cites `AbsoluteValue.apply_eval_hasseDeriv_le` and `apply_eval_le`; 4.3 (`README.md:1078–1088`) derives the coarse univariate form from the sharp one by `Nat.choose_le_two_pow` and owns only the binomial-sum bounds |
| R06, `K` for the field and the order | repaired | `README.md:506–507`: "through order `N < p` … `k ≤ N`" |
| R07, `pderiv_prod_mem_ideal_pow` on `Fin 2` only | repaired | `Suggested.lean:215–223` over `{σ ι : Type*}`, `(s : σ)`, `a : σ → R`; `README.md:953–957` makes the bivariate form the instance `σ = Fin 2`, `s = 0`; a Check with `σ = Fin 3`, `s = 2` at `README.md:983–987` |

**Gate, order and build.**
- The worker's gate and my rerun (`gate … --base origin/main`) both report `OK` with `0` on every check.
- Dependency check (the command of the brief, with `--movable`): `depcheck: 239 roadmaps, 2322 edges, 0 problem(s)`, no UPWARD, CYCLE or `moved:` line. In the candidate order this roadmap is line 399, after IntegralIwasawaTheory (28), GenericDoublePointInterpolation (35), AnalyticNumberTheoryPartI (50) and CharacterSumsOverFiniteFields (157); DiophantineApproximationAndTranscendence is on main. GrothendieckNotesLemmas, the one `*Needs:*` supplier outside the order, is a new roadmap by another author, named in the description's depends-on list.
- `git diff --stat origin/main...HEAD` outside the folder is empty. The folder holds `README.md`, `Suggested.lean` and `metadata.toml` (`topic = "math.NT"`).
- The branch's pins equal main's: Tau Ceti `2fd255d9`, Mathlib `1b1ccf4b`.
- `lake env lean` on `Suggested.lean` at the pins: 15 warnings, all "declaration uses `sorry`", no error.
- Form: one module docstring naming the five end theorems and what Layers 2 and 5 leave to the README; `namespace TauCetiRoadmap.ArithmeticInterpolationDeterminants`; Layer section comments in README order (0, 1, 3, 4); imports `import Mathlib` and `TauCeti.Algebra.MvPolynomial.HasseDeriv.Basic`; no `lemma`, `set_option`, `#eval`, `#print` or `example`. Three `def`s, all with real bodies on native carriers (`MvPolynomial.aeval`, `LinearMap.pi` of `leval ∘ hasseDeriv ∘ subtype`, `Matrix.of`). No sorry'd data.

**Signatures.** I ran `#check @name` on all 18 declarations in one scratch file importing the built module and compared each elaborated type with its README statement: no section binder is lost (`[Fact p.Prime] [CharP K p]`, `[Field K]`, `[Fintype ι] [DecidableEq ι]`, `[LinearOrder S] [IsStrictOrderedRing S]` are all present where the README states them) and the generality agrees with the README in every case. Nothing changed.

Unused hypotheses (notes, not findings): `hH` in `norm_hasseDeriv_eval_le` follows from `hcoeff 0`; `[Fact p.Prime]` in `iterate_derivative_powerSubstitution`, where only `(p ^ e : R) = 0` is used. `hB` in `powerSubstitution_injOn` is R01, since the statement is proved without it.

**One-tactic probe.** On a standalone scratch copy of the file (not importing the built module), the five statements that are new or changed since the previous review (`exists_nonzero_hasse_jet_on_frobenius_graph`, `abv_det_le_factorial_prod`, `pderiv_prod_mem_ideal_pow`, `det_gram_matrix_smul`, `det_mem_prod_row_ideals`) were tried with `first | (simp_all; done) | exact?`, with the Tau Ceti AbsoluteValue, Gram, Taylor and multivariate Hasse modules imported: four fail (`exact?` finds nothing) and `det_gram_matrix_smul` times out. The other ten were probed in the previous review with the same result and are unchanged. No declaration restates a definition, mirrors a Check or computes a value.

**Headline theorems** (`README.md:13–18`; module docstring): `hermiteJet_bijective`, `det_confluentVandermonde`, `exists_nonzero_hasse_jet_on_frobenius_graph`, `exists_nonzero_ordinary_jet_on_frobenius_graph` and `det_gram_matrix_smul` are all stated, each on the roadmap's own carriers, with no stand-in. Layer 2, 3.2 and Layer 5 are left to the README with the reason given in both files.

**Library declarations at the pins.** I extracted every backticked Lean name of the README (208 library names after removing this roadmap's own and the cross-roadmap ones) into one `#check` file and elaborated it with the cited Tau Ceti modules imported: 207 resolve (eight report only the expected ambiguity between `Polynomial`, `MvPolynomial`, `Matrix` and `Algebra` namespaces), and the remaining one, `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm`, is at `TauCeti/RingTheory/MvPolynomial/HasseDeriv/ChainRule.lean:232`, a module the file did not import. I read these in full:
- `MvPolynomial.coeff_aeval_X_pow_weight`, `injOn_aeval_X_pow`, `taylor_aeval_X_pow`, `eval_hasseDeriv_aeval_X_pow` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean:96, 109, 139, 164`): the chain rule's coefficient is the `k`-th coefficient of `aeval (fun s ↦ (X + C a)^(e s) − C (a^(e s))) (monomial ν 1)`, which is the README's `∏_s ((T + a)^(w s) − a^(w s))^(ν s)` (`README.md:290–291`) and 0.4's `T^(ν 0) ((T + a)^q − a^q)^(ν 1)`.
- `Polynomial.eval_hasseDeriv_rootMultiplicity_ne_zero` (`TauCeti/Algebra/Polynomial/Taylor.lean:101`, `[CommRing R]`, `p ≠ 0`).
- `Matrix.det_submatrix_mul_left` (`TauCeti/LinearAlgebra/Matrix/MaximalMinor.lean:72`, any `e : m → n`).
- `Matrix.IsUpperUnitriangular` (`TauCeti/LinearAlgebra/Matrix/Triangular.lean:90`: upper triangular with unit diagonal), `.det_eq_one` (140), `.mul` (405, `[NonAssocSemiring T] [Fintype p] [LinearOrder p]`), `.inv` (412, `[CommRing T] [Invertible M]`), as `README.md:140–145, 313–315` say.
- `Ideal.mem_map_algebraMap_iff` (`TauCeti/RingTheory/Ideal/Extended.lean:112`, `[CommSemiring R] [Semiring A] [Algebra R A]`) and `Module.Basis.mem_smul_top_iff` (`TauCeti/RingTheory/Ideal/Operations.lean:290`, `[I.IsTwoSided]`, any index type).
- `AbsoluteValue.apply_eval_hasseDeriv_le` (`TauCeti/RingTheory/MvPolynomial/Abv/Taylor.lean:92`, `[Fintype ι] [CommRing R] [Nontrivial R]`, `v : AbsoluteValue R ℝ`, bound `B ∏ (L i + 1) ∏ (2 max(v (a i), 1))^(L i)`) and `apply_eval_le` (`Abv/Eval.lean:115`).
- Mathlib `Matrix.det_le` (`Mathlib/LinearAlgebra/Matrix/AbsoluteValue.lean:43`, uniform `(card n)! • x ^ card n`, under `[Nontrivial R]`) and `AbsoluteValue.map_units_int_smul` (`Mathlib/Algebra/Order/AbsoluteValue/Int.lean:37`, no `Nontrivial` hypothesis), so 4.1's route needs nothing the target lacks.
- Mathlib `Lagrange.funEquivDegreeLT` (`Mathlib/LinearAlgebra/Lagrange.lean:383`, `f ↦ (f.eval (v i))_i`), `IsLocalRing.basisQuotient` (`Mathlib/RingTheory/LocalRing/Quotient.lean:85`, `[Module.Finite R S] [Module.Free R S] [Fintype ι]`), `TensorProduct.quotTensorEquivQuotSMul` (`Mathlib/LinearAlgebra/TensorProduct/Quotient.lean:153`, `(R ⧸ I) ⊗[R] M ≃ₗ[R] M ⧸ I • ⊤`), `LinearEquiv.extendScalarsOfSurjective` (`Mathlib/Algebra/Algebra/Tower.lean:300`).

**Duplication by object.** I grepped Mathlib and Tau Ceti at the pins for each owned object: "confluent" (no matrix hit), Hermite interpolation (Tau Ceti's `Hermite/` is the Hermite polynomials), determinants in ideals (`TauCeti.det_mem_of_mem_span`, `Submodule.det_mem_minorsIdeal`: different statements), row-dependent determinant bounds (Tau Ceti has only the `ℓ¹` forms `abv_det_le_prod_sum_abv`, Mathlib the uniform `det_le`), Gram identities (`Matrix.gram` has `star_dotProduct_gram_mulVec` and `det_gram_ne_zero_iff_linearIndependent`, no change of family), Leibniz products in ideal powers (none), binomial-sum evaluation bounds (none), the power substitution (none). The pins are the previous review's, so its findings on 2.2 (R01), 3.2 (R04) and 4.3 (R05) are the only duplications, and all are now citations.

**Cross-roadmap citations resolved** (each at main or at the open head named):
- CharacterSumsOverFiniteFields §4.1 "Hasse derivatives and the multiplicity criterion" (its README line 1293 at the head of #1712), on `[Field F] [Finite F]` (line 14), as `README.md:71–74` says.
- GenericDoublePointInterpolation §1.3 `firstJetMap` (line 451), §1.4 `firstJetMatrix` (521) and §4.6 `univariateHermiteRank` (1414–1416, rank `min(d+1, 2n)`), at the head of #1472.
- IntegralIwasawaTheory §4.1c `exists_hasseDeriv_eval_eq_ite` (its README lines 600, 610, at the head of #1306): equal multiplicity `S` at points of the closed unit disc, coefficient bound `ϱ^(−#ι·S)`, as `README.md:100–103` says.
- GrothendieckNotesLemmas §1.3 `Polynomial.forall_hasseDeriv_eq_zero_iff_exists_expand` (line 268–270) and §1.4 `Polynomial.hasseDeriv_expand_mul` for `k < p ^ e` (287–289), at the head of #1431; this matches `README.md:324–329`. The `roadmaps resolve` lead on `hasseDeriv_expand_mul` is this supplier's own name, not a library name.
- DiophantineApproximationAndTranscendence §1.7 "Block substitution and nonzero jets" on main (line 885).
- `roadmaps grep` for `ArithmeticInterpolationDeterminants` over main and the 469 open heads returns nothing outside this folder, so `README.md:1199` holds. The description's consumer AnalyticNumberTheoryPartI §0.34c (order line 50) does not cite this roadmap at its head.
- Overlaps: no other open pull request changes this roadmap and no id is dropped in either direction.

**Ownership by object.** `roadmaps grep` over main and the 469 open heads for confluent Vandermonde, Hermite interpolation, interpolation determinant, Gram change of family, `powerSubstitution` and row ideals: Hermite interpolation appears in LinearFormsInLogarithms §8.5 (ultrametric bounds; a forbidden supplier, not cited), IntegralIwasawaTheory §4.1c and GenericDoublePointInterpolation §4.6 (both deferred in Scope), and GlobalHolomorphicFunctions §2.5 (R03). `powerSubstitution` in HabiroNumberFields is `q ↦ q^γ`, a different object. ExplicitNumberFields (line 2417) leaves the archimedean size of an interpolation determinant to its supplier. No second owner of the confluent determinant, the row-ideal statement, the Gram change of family, the ideal-power Leibniz statements or the row-dependent bound.

**Sources: the seeded sample and every other locator.** All six cited texts are in the sources cache and were read at their locators (page markers checked against the printed numbers).

| Target | Source at its locator | Verdict |
| --- | --- | --- |
| 0.1 | P Lemma 2.6.1 (P line 3886, printed p. 68) and (2.34) (line 3958, pp. 68–69): the derivative of a monomial is `d! · choose(k, d) · x^(k−d)`, and `∂^d P` expanded in the monomial basis over `ℤ` | supported |
| 0.3 | IK Lemma 11.17 (IK lines 882–886, p. 284), the substitution `h(X, X^q)`; P, proof of Theorem 3.3.7 (lines 5172–5176, p. 87, after the marker at 5122), `x_i ↦ t^(d^(i−1))` injective on the monomials of partial degree below `d`; Exercise 3.5(a) (lines 5272–5278, p. 89), over a subfield of `ℂ` | supported |
| 0.4 | IK Lemma 11.17, `k < q`, `K = F` finite with `q` elements, proof through `choose (mq, j) = 0` for `0 < j < q` (lines 887–898); IK p. 283 lines 816–817 for `E^p X^p = 1`; the README's extension to any ring of characteristic `p` is stated as its own (`README.md:467–474`) | supported (gap in the source's proof, below) |
| 0.5 | IK p. 282 lines 787–790 (ordinary derivatives of `X^p` vanish from order `1`), p. 283 lines 816–818 (Hasse orders `1 … p−1` vanish, order `p` gives `1`) | supported |
| 0.6 | IK Lemma 11.16 (lines 862–880, pp. 283–284), any field; Lemma 11.17 (882–886) | supported |
| 1.1, 1.2 | IK Lemma 11.16 and the Taylor remark (lines 801–815, pp. 282–283) | supported |
| 1.3 | W, proof of Lemma 3.24 (W lines 5356–5373, p. 100, marker at 5333): blocks `M_j` with columns `choose(µ−1, k) X_j^(µ−1−k)`, `T_j` positive; Exercise 3.11 (lines 5912–5917, p. 111, marker at 5881): `± ∏_{i<j} (X_i − X_j)^(T_i T_j)` | supported; sign fixed here |
| 2.1 | Treil (4.2), p. 89 (Treil lines 4620–4624, marker at 4616): the Leibniz sum over permutations | supported |
| 3.1 | Treil (4.2) with lines 4626–4628: each term contains exactly one entry from each column, hence one from each row | supported |
| 3.3 | M, review of bilinear forms, formula (6), p. 32 (M lines 1433–1450): `(ψ(f_k, f_l)) = A (ψ(e_i, e_j)) Aᵀ`, determinant `det(A)² det(ψ(e_i, e_j))` | supported |
| 3.4 | IK Lemma 11.14 and (11.22), p. 283 (lines 820–829), over a field | supported |
| 4.1 | W Lemma 2.8, p. 43 (W lines 2603–2625, marker at 2584): factor `L! ∏_λ max_µ sup_{|z|=R}` of row-wise maxima; §10.2.2 at line 16923 (p. 334, marker at 16909) | supported |
| 4.2 | W, proof of Lemma 3.25, p. 101 (lines 5383–5397): Hadamard `|Δ|² ≤ ∏_λ ∑_µ |a_{λµ}|²` for `L × L` | supported |
| 4.3 | IK definition of `E^k`, p. 282 (lines 792–800); P Lemma 2.6.1 and (2.34) | supported |
| 5.1 | M p. 31 (lines 1397–1408): `Nm(ββ′) = Nm(β) Nm(β′)`, `Nm(a) = a^n` for a free extension of rank `n`; Corollary 2.20, p. 32 (lines 1419–1422, `L` separable) | supported |
| 5.2 | M Corollary 2.20; W §10.2 pp. 329–356 (contents line 267) | supported |
| 2.2 | M (4), p. 22 (line 1016, marker at 995), extension of scalars p. 23 (lines 1042–1052), pp. 59–60 (lines 2640–2647) | supported |
| Scope | Treil Theorem 6.1, p. 96 (line 4948, marker at 4925); Laurent §6.1, p. 219 (Laurent lines 456–466; the page footer `218` at line 439 precedes the page) | supported |

**Adversarial table.** Determinants, Gram identities, binomial congruences and the brute-force tests were computed with an exact-arithmetic script (`Fraction`), independently of the previous review. Rows of the confluent matrix follow the `finSigmaFinEquiv` order.

| Statement | Instances | Values computed (each side) | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution` (def) | `B = 2`: `Z + W`, `Z + ZW`; `B = 3`: `Z²W + ZW²`; `B = 2`, `F = ZW`, `a = 3` | `X + X²`; `X + X³`; `X⁵ + X⁷` with `7 ≤ 2 + 3·2`; `27 = eval ![3, 9] (ZW)` | sound | none |
| `powerSubstitution_injOn` | `B = 2`: `Z²`, `W`; `B = 0`: the set `{degreeOf 0 < 0}` | both `↦ X²`, `Z²` excluded by `Z`-degree `2`; the set is empty, `InjOn` holds; the `B = 0` example elaborates without `hB` | true; `hB` unused | R01 |
| `iterate_derivative_powerSubstitution` | `p = 2, e = 1`: `ZW`, `W`; `p = 3`, `e = 1`, `ZW + Z`; `e = 0`: `W` | `D X³ = X² = φ(W)`; `D X² = 0 = φ(0)`; `D(X⁴ + X) = X³ + 1`, `D² = 12X² = 0`; `D X = 1 ≠ φ(0) = 0` | sound, `0 < e` needed | none |
| `hasseDeriv_powerSubstitution` | `C(i + qj, k) ≡ C(i, k) (mod p)` for `k < q`, `i < 40`, `j < 6`, `(p, e) ∈ {(2,0),(2,1),(2,2),(2,3),(3,1),(3,2),(5,1),(7,1)}`; `k = q`, `F = W`; the 0.4 Checks | 0 violations; `C(q, q) − C(0, q) = 1 ≠ 0 (mod p)` for every `e > 0`; `10 ≡ 1 (3)`, `35 ≡ 1 (2)`, `6 ≡ 0 (2)`, `5 ≡ 1 (2)` | sound; `e = 0` admitted (`k = 0` only) | R02 (wording) |
| 0.4 evaluated weights | `p = 3`, `F = Z²`, `k = 1`, `a = 2` | true value `4 = 1`; weights `T^(ν 0)` give `1`; weights `(T + a)^(ν 0)` give `4 + 1 = 5 = 2` | sound | none |
| `exists_nonzero_hasse_jet_on_frobenius_graph` | brute force over `𝔽_p`, `(p, e) ∈ {(2,0),(2,1),(2,2),(3,0),(3,1),(5,1),(3,2)}`, random `F` of `Z`-degree `< q`, random `S`, every `m < q` with the degree hypothesis; the 0.6 Checks | 0 violations in 2,022 instances; `𝔽₄`: `F(c, c²) = c + c² = 1`; `2 < 2` fails; `Z² + W ↦ 0`; `q = 4`: `F(a, a⁴) = 0` on `𝔽₄`, `4 < 4` fails, `4 < 8` with `∂_Z F = 1`; `e = 0`, `S = {0, 1}`: `F(1, 1) = 1` | sound | none |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | the same draws with `e > 0`, `m < p`; `e = 0` control; the `m ≥ p` witness | 0 violations in 1,362 instances; `e = 0`, `F = W`, `S = {0}`, `m = 1`: both jets `0`; `p = 2`, `e = 2`, `F = Z²`, `S = {0}`, `m = 2`: ordinary jets `(0, 0, 0)`, Hasse jets `(0, 0, 1)` | sound; both hypotheses needed | none |
| `hermiteJet`, `hermiteJet_bijective` | `r = 0`; `m = (2)`, node `c`; `a = (0, 1)`, `m = (1, 1)`; `a = (0, 0)`; `m = (0, 3)`, `a = (5, 0)`; char `p`, `m = (p + 1)` | `0 = 0`; `(c₀ + c₁ c, c₁)`; `(c₀, c₀ + c₁)`, the Lagrange values; `X ↦ (0, 0)`; identity on `(c₀, c₁, c₂)`; ordinary jets of `X^p` are `(0, …, 0, p!) = 0` while the Hasse jet of order `p` is `1` | sound | none |
| `all_jets_vanish_iff_dvd` | `a = 0`, `m = (2)`: `X`, `X²`; `r = 0`; `f = 0`; `a = (0, 1)`, `m = (1, 1)`: `X² − X`, `X` | `D^[1] X (0) = 1`, `X² ∤ X`; jets of `X²` vanish, `X² ∣ X²`; `1 ∣ f`; `0 ∣ 0`; jets `(0, 0)`, `X(X − 1) ∣ X² − X`; `f(1) = 1`, `X(X − 1) ∤ X` | sound | none |
| `det_confluentVandermonde` | the 11 listed `(a, m)` and 400 random draws (`r ≤ 4`, `m_i ≤ 3`, `|a_i| ≤ 4`) | `(0,1)/(2,1)`: `1 = 1`; `(1,0)/(1,1)`: `−1 = −1`; `(1,0)/(2,1)`: `1 = 1`; `(0,1,2)/(2,1,1)`: `4 = 4`; `(2,5,7)/1`: `30 = 30`; `(5)/(3)`: `1 = 1`; empty: `1 = 1`; `(0,0)/(1,1)`: `0 = 0`; `(0,0,1)/(1,0,1)`: `1 = 1`; `(7)/(0)`: `1 = 1`; `(1/2, 3)/(2,2)`: `625/16 = 625/16`; random: 0 violations | sound | none |
| 1.3 ordinary matrix and symmetries | `(0,1,2)/(2,1,1)` with rows scaled by `k!`; swap of two nodes with a third between, sizes `m_i, m_k, m_j` | `4 = 4 · 1! · 0! …`; block-permutation sign `(−1)^(m_i m_k + m_i m_j + m_k m_j)` equals the sign change of the formula's factors `(i,j)`, `(i,k)`, `(k,j)` | sound | none |
| `det_mem_prod_row_ideals` | `[[2,4],[3,9]]`; `[[2,2],[1,1]]`; `n = 0`; `[[2,3],[2,3]]`, `[[2,3],[4,9]]`, `[[2,3],[1,1]]`; 300 random with row `i` in `r_i ℤ` | `6 ∈ 6ℤ`; `0 ∈ 2ℤ`; `1 ∈ ⊤`; `0`, `6`, `−1 ∉ 6ℤ`; 0 violations of `∏ r_i ∣ det` | sound | none |
| 2.1 transport | `ℤ → ZMod 2`: `[[1]]`, `[[2]]`; `[[1,0,0],[0,1,0]]` on `c = (0,1), (0,2)`; `[[1,1],[2,2]]` | `1 ↦ 1`; `2 ↦ 0`; minors `1`, `0`; the only minor is `0` | sound | none |
| 2.2 coefficient matrix | `φ(e₁) = 1 + 2i`, `φ(e₂) = 3i`; `2 + 2i`, `1 + i` in `2ℤ[i]`; `diag(i, i)` | `[[1,0],[2,3]]`, `φ(x, y) = x + (2x + 3y)i`, mod `2`: `I`; coordinates `(2,2) ∈ 2ℤ`, `1 ∉ 2ℤ`; `det = −1 = (−1, 0)` versus coordinate determinants `0`, `1` | sound | none |
| 3.2 | `U = [[1,0],[1,1]]`, `A = [[1,2,0],[0,1,5]]`, `c = (0,1)`; `[[1,2],[0,1]]`; `2I`; the swap; composites | `UA = [[1,2,0],[1,3,5]]`, minor `1 = 1`; `[[1,4,10],[0,1,5]]`, minor `1`; `4`; `−1`; `[[1,0],[3,1]]`, `[[3,2],[1,1]]` of determinant `1` | sound | none |
| `det_gram_matrix_smul` | 300 random integer `U` (`n ≤ 4`) and families in `ℤ^dim` (`dim ≤ 5`, dependent and independent); `U = [[1,0],[1,1]]`; `2I`; `(e₁, e₁)`; `ι = ∅` | 0 violations of `det gram(w) = (det U)² det gram(v)`; `1 = 1`; `16 = 4² · 1`; `0 = 0`; `1 = 1` | sound | none |
| 3.3 complex form | `U = [[i]]`, `v = (e₁)` | `⟪ie₁, ie₁⟫ = 1 = ‖i‖²`; `(det U)² = −1` would be wrong | sound | none |
| `derivative_prod_mem_ideal_pow` | `ℤ`, `J = (3)`: 630 random instances with `h ≤ 3` factors satisfying the hypothesis for `k ≤ K ≤ 3`, random cofactor; the five Checks | 0 violations of `3^h ∣ D^k(g ∏ f_i)(a)`; `X·X` at `0`, `K = 0`: `0 ∈ (0)²`, `D²X²(0) = 2`; `X⁴`, `g = X⁵`, `K = 3`: `0`; `X³`, `J = (3)`: ordinary `0,0,0,6 ∈ (3)`, Hasse `0,0,0,1 ∉ (3)` | sound | none |
| `pderiv_prod_mem_ideal_pow` | `σ = Fin 3`, `s = 2`, `(X₂, X₂)`, `g = X₀`, `a = (7,7,0)`, `J = (0)` | `X₂(a) = 0`, `∂_{X₂} X₂ = 1`; `X₀X₂²(a) = 0 ∈ (0)²`; order `2`: `2X₀(a) = 14 ∉ (0)²` | sound | none |
| `abv_det_le_factorial_prod` | 400 random integer matrices with row bounds `B_i ≤ 4` (`n ≤ 4`), `abs`; `n = 0`; `[[1,1],[1,−1]]` with `B = (1,1)`, `(1,2)`; `[[1,0],[10,1]]`, `B = (1,10)`; `[[2,3],[1,1]]`, `B = (3,1)`; all `3 × 3` `±1` matrices | 0 violations; `1 ≤ 1`; `2 ≤ 2`, `2 ≤ 4`; `1 ≤ 20`; `1 ≤ 6`; maximum `4 ≤ 6` (Hadamard: `5.196`) | sound; `Nontrivial R` not needed by the route | none |
| 4.2 | `v = ((1,0),(1,1))`; ratio `n!/n^(n/2)` | `det gram = 1 ≤ 2`, `|det| = 1 ≤ √2`; `1, 1, 1.155, 1.5, 2.147` for `n = 1 … 5` | sound | none |
| `norm_hasseDeriv_eval_le` | 400 random `(f, d, k, H, a)` with `a ∈ ℚ`; `X²`, `k = 1`, `a = 2`; `k = 3 > d = 2`; `1 + X + X²` at `1`; `X²`, `k = 1`, `a = 10` | 0 violations of `lhs ≤ sharp ≤ coarse`; `4 ≤ 5`; `0 ≤ 0`; `3 ≤ 3`, coarse `12`; `20 ≤ 21`, coarse `1200`; `choose(j, k) ≤ 2^j` for `j ≤ 12` | sound | none |
| 4.3 multivariate | `F = ZW`, `d = (1,0)`, `a = (2,3)` | `3 ≤ 1 · 1 · 2⁰ · 3¹ = 3` | sound | none |
| Layer 4 Examples | rows of `(0,1)/(2,1)`, `A = (0,1)` and `A = 1` | `B = (1,1,1)` (row `(0,1)`: `max(1·0⁰, 2·0) = 1`), `1 ≤ 6`; `B = (1,2,1)`, `1 ≤ 12`; norms `1, 1, √3` | sound | none |
| 0.1, 0.2, 0.5 | box `{μ₀ ≤ 1, μ₁ ≤ 2}` vs ball of radius `2`; `[[1,0,0],[0,1,2]]`; `ZW` at `(2,3)`; `ZMod 2`, `X²`, `d = 2`; `p = 3`: `X²`, `X³` at `0` | ranks `6`, `6`, with `ZW²` and `Z²` separating; `D^[1](1, X, X²)(1) = (0,1,2)`; `3, 1, 0`; Hasse `1` vs ordinary `0`; `2` vs `1`, `6 = 0` vs `1` | sound | none |
| 5.1, 5.2 | `ℚ(i)`: `2(1 + i)`, `1 + i`; `ℚ × ℚ`: `(1, 0)`; `z = 12`, `P = {2,3}`, `e = (2,1)`; `P = {2}`, `e = 3`; `ℚ(√2)`: `3(1 + √2)`; `ℚ(√−5)`: `2 + √−5` | `8`, `4 ∣ 8`; `2`, `4 ∤ 2`; norm `0`; `4 · 3 ∣ 12`, `log 12 ≤ log 12`; `8 ∤ 12`; `−9`, moduli `3(1 + √2)`, `3(√2 − 1)`, product `9`; `9`, modulus `3` | sound | none |

## Not verifiable

- None. IK, P, M, Laurent, W and Treil are in the sources cache and were read at every locator above.
- Ownership against open pull requests was checked with `roadmaps grep` over main and all 469 open heads, with the overlap list, and by reading GlobalHolomorphicFunctions §2.5 at its head.

## Source issues

- **Gap** in IK at Lemma 11.17, p. 284: the source shows `choose(mq, j) = 0` in characteristic `p` for `0 < j < q` by writing it as `(mq/j) · choose(mq − 1, j − 1)`, which divides by `j`; it should compare `p`-adic valuations (`v_p(mq) ≥ v_p(q) > v_p(j)`), since `p` may divide `j` when `q` is a proper power of `p`; affects the proof.
- **Misprint** in IK at the proof of Corollary 11.15(1), p. 283: the source says the Hasse derivatives of `X − a` vanish for orders above `2`; it should say for orders at least `2`, which the argument uses; affects nothing.
- **Misprint** in IK at Lemma 11.16, p. 283: the source says `f` has a zero of order greater than `ℓ`; it should say at least `ℓ`, as the stated divisibility by `(X − a)^ℓ` shows; affects nothing.
