# Review of ArithmeticInterpolationDeterminants (pull request #1905 at 7ff5274)

**Verdict:** needs changes

The gate fails on this head (`set_option=1 latex=3 tex=7 prnum=1 sorry-data=1 sorry-examples=2`, build OK, depcheck `245 roadmaps, 2466 edges, 0 problem(s)`). Three findings block (R01–R03); the rest are P3. The mathematics of every stated theorem checks out (table under *Verified sound*); the defects are a sorry'd definition, a `set_option`, a statable headline that is missing, an API-catalogue `Suggested.lean`, a README that is not in roadmap form, and several supplier citations that do not resolve at the pins or in the merge order.

## R01 (P2) — `hermiteJet` is sorry'd data

Location: `TauCetiRoadmap/ArithmeticInterpolationDeterminants/Suggested.lean:83–87`, "`def hermiteJet … map_add' := by sorry  map_smul' := by sorry`" (gate `sorry-data`).

Claim: the definition has "an explicit mathematical body". The proof fields of a `def` are part of its data; `hermiteJet_bijective` and the README's I1 all depend on a sorry'd definition.

Witness: the gate line `line 83: def hermiteJet`; the brief's rule that no `def` body contains `sorry`.

Repair (elaborates at the pin, inside the file's `noncomputable section`): define the jet map as a composite of library linear maps, which needs no proof fields:

```lean
def hermiteJet (a : Fin r → K) (m : Fin r → ℕ) :
    Polynomial.degreeLT K (∑ i, m i) →ₗ[K] (∀ i, Fin (m i) → K) :=
  LinearMap.pi fun i => LinearMap.pi fun k =>
    Polynomial.leval (a i) ∘ₗ Polynomial.hasseDeriv (k : ℕ) ∘ₗ
      (Polynomial.degreeLT K (∑ i, m i)).subtype
```

(`Polynomial.leval` is `Mathlib/Algebra/Polynomial/Eval/SMul.lean:65`; `Polynomial.hasseDeriv k : R[X] →ₗ[R] R[X]` is `Mathlib/Algebra/Polynomial/HasseDeriv.lean:60`.) Its value on `f`, `i`, `k` is definitionally `(hasseDeriv k f).eval (a i)`, so `hermiteJet_bijective` and the README statement are unchanged.

## R02 (P2) — `set_option` in `Suggested.lean`

Location: `Suggested.lean:17`, "`set_option autoImplicit false`" (gate `set_option`).

Claim: none; the file-level option is forbidden by the roadmap contract ("never `set_option` of any kind"), and the brief lists a `set_option` among the blocking findings.

Witness: gate line `line 17: set_option autoImplicit false`.

Repair: delete the line. Every binder in the file is already explicit, so nothing else changes (checked by reading all 22 signatures in `scratch/signatures.md`: no auto-bound implicit occurs).

## R03 (P2) — the confluent Vandermonde determinant is statable at the pins but absent; the file is an interface catalogue

Location: `README.md:128–135` ("For the Hasse confluent Vandermonde matrix with entry `D^[k](X^j)(a_i)`, prove `det V = ∏_{i<j}(a_j − a_i)^{m_i m_j}`"), `Suggested.lean:7–13` ("This file gives a selection of suggested interfaces, not an exhaustive checklist").

Claim: `Suggested.lean` states "representative signatures". The contract is the opposite: the file is the acceptance test and states the headline theorems. The roadmap's headlines, read off the README, are (i) Hermite interpolation as a linear equivalence (I1; stated as `hermiteJet_bijective`), (ii) the kernel description (stated), (iii) the confluent Vandermonde determinant formula with its sign (I1; **absent**), (iv) the Frobenius-graph nonvanishing test (I0; stated), (v) the Gram change-of-family identity (I3; stated), and the Hadamard consumption (I4; a library theorem). Headline (iii) is statable at the pins: `finSigmaFinEquiv : (i : Fin m) × Fin (n i) ≃ Fin (∑ i, n i)` (`Mathlib/Algebra/BigOperators/Fin.lean:679`) is exactly the README's lexicographic row order (`finSigmaFinEquiv_apply`: index `= ∑_{i<k.1} n i + k.2`), and `Polynomial.hasseDeriv` gives the entries.

Witness: the following elaborated against the pins in my scratch probe (only the `noncomputable` marker was needed):

```lean
noncomputable def confluentVandermonde {R : Type*} [CommRing R] {r : ℕ} (a : Fin r → R)
    (m : Fin r → ℕ) : Matrix (Fin (∑ i, m i)) (Fin (∑ i, m i)) R :=
  Matrix.of fun ρ j =>
    (Polynomial.hasseDeriv ((finSigmaFinEquiv.symm ρ).2 : ℕ) (X ^ (j : ℕ) : R[X])).eval
      (a (finSigmaFinEquiv.symm ρ).1)

theorem det_confluentVandermonde {R : Type*} [CommRing R] {r : ℕ} (a : Fin r → R)
    (m : Fin r → ℕ) :
    (confluentVandermonde a m).det =
      ∏ i : Fin r, ∏ j : Fin r, if i < j then (a j - a i) ^ (m i * m j) else 1 := by
  sorry
```

I recomputed the formula with this row order on `(a, m) = ((0,1,2),(2,1,1))`: both sides `4`; `((0,1,2),(1,2,1))`: both `2`; `((3,−1,2),(2,2,1))`: both `2304`; `((1,4),(3,1))`: both `27`; `((2,5,7),(1,1,1))`: both `30` (agrees with `Matrix.det_vandermonde`, `∏ i, ∏ j > i, (v j − v i)`); `((5),(3))` and the empty case: both `1`. So the statement, with the lex order and this sign, is right over any commutative ring (the README's "over a field" in I1 is narrower than the formula needs).

Repair: add the two declarations above (the determinant over a `CommRing`, which is what the Newton-basis proof gives), and rewrite the module docstring in the required form: "Polynomial interpolation and arithmetic determinants: target signatures", saying that the roadmap is `README.md`, that this file is not the roadmap, that it states the headline theorems against the pinned Mathlib and Tau Ceti, and which headlines are not statable (none, once R03 is applied). Keep the API lemmas the README calls targets in the README; see R04 for the ones to delete.

## R04 (P3) — padding in `Suggested.lean`

Location and claim, one per bullet; the one-tactic probe was run on a scratch copy at the pins.

- `Suggested.lean:117–120` `lift_nonzero_minor`. `Matrix.submatrix_map` (`Mathlib/LinearAlgebra/Matrix/Defs.lean:501`) is `rfl`, so the statement is `RingHom.map_det` read backwards: `fun h0 => h (by rw [Matrix.submatrix_map, ← RingHom.map_det, h0, map_zero])`.
- `Suggested.lean:198–199` and `201–202`, the two admitted `example`s (gate `sorry-examples`). They compute small values and mirror the I1/I3 Checks; `simp` reduces the first to `3 * 2 = 6` and the second to `C 2 + 1 = 0` over `ZMod 3`. An admitted example is never written.
- `Suggested.lean:189–193` `log_divisor_le_log_abs`: a statement about a bare integer and a finset of naturals whose conclusion is monotonicity of `Real.log`; it names no object of the roadmap (and the primality hypothesis `hP` is unused: `p = 0` with `e p > 0` is excluded by `z ≠ 0`, and `p = 0` with `e p = 0` contributes `0 · log 0 = 0`).
- `Suggested.lean:56–60` `ordinary_jet_zero_iff_hasse_jet_zero`: `Polynomial.factorial_smul_hasseDeriv` (`HasseDeriv.lean:134`) gives `derivative^[k] f = k! • hasseDeriv k f`, and `k!` is a unit for `k < p`; the statement restates that lemma.
- `Suggested.lean:184–187` `integral_norm_scalar_pow_dvd`: after `subst h; simp` the probe leaves only `m ^ (finrank ℚ K * e) ∣ (Algebra.norm ℤ) ↑m ^ e * (Algebra.norm ℤ) b`, closed by `Algebra.norm_algebraMap` and `NumberField.RingOfIntegers.rank`.

Repair: delete these six declarations from `Suggested.lean`; the README keeps each as a target or Check (I2, I0, I5, I6).

## R05 (P3) — the README is not in TauCetiRoadmap form

Location: `README.md:1–326` as a whole; e.g. line 1 "# Polynomial interpolation and arithmetic determinants", line 9 "`Suggested.lean` gives representative signatures, not an exhaustive checklist", headings `## I0.` … `## I6.`.

Claim: the file has none of the required shape: no `# Roadmap:` title and `**Summary.**`; no `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts`, `## How to read the build`; no `## Layer k:` / `### k.n` sections (the gate's `layer-ids`/`target-ids` scanners find nothing to check); no `*Needs:*` line on any target; API lists absent; `**Checks.**` lists absent for every definition except one paragraph in I1 (the coefficient-supported submodule and jet-evaluation map of I0, `φ_B`, the coefficient matrix of I2, the row-ideal and unitriangular statements of I3, the row bounds of I4 and the norm package of I5 have no Checks at all); no `### Examples` / `### Dependencies` per layer; no `## Downstream consumers`; I2, I3 and I4 carry no locator at all ("Derivation:" paragraphs are not locators); the "Checks:" of I1 are a prose list without the computed values a Check needs.

Witness: compare `TauCetiRoadmap/DiophantineApproximationAndTranscendence/README.md:1–146` on main (title, Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, Layer 0 with `### 0.1 …`, `**Checks.**`, `*Needs:*`).

Repair: rewrite in that shape, keeping the mathematics: one `### k.n` per target with its hypotheses, locator and `*Needs:*`; at least three discriminating Checks with computed values per definition (the values in the table below can be reused: the confluent determinants, the `F = W` failure at `k = p`, `hasseDeriv 3 (X^3) = 1` versus `6`, the Gram identity on `U = [[1,0],[1,1]]`); `### Examples` and `### Dependencies` closing each layer; `## Downstream consumers` naming only roadmaps later in the merge order (see R08); `## References`.

## R06 (P3) — LaTeX displays, pull-request numbers and process narrative

Location: `README.md:131–133`, `230–232`, `259–261` (gate `latex` ×3, `tex` ×7); `README.md:37` ("[GrothendieckNotesLemmas](…/pull/1431)", "[CharacterSumsOverFiniteFields §4.1](…/pull/1712)"), `45` ("[Mathlib PR #40683]", gate `prnum`), `48` ("rather than waiting for that PR"), `247` ("[Analytic Number Theory Part I §0.34c](…/pull/1126)").

Claim: display mathematics must be Unicode in code spans; roadmaps are cited by name and section, never by pull-request number; a README is timeless.

Repair: `det V = ∏_{i<j} (a_j − a_i)^(m_i m_j)` as a code span; `|det A| ≤ n! ∏_i B_i when |A_ij| ≤ B_i, B_i ≥ 0`; `|D^[k] f(a)| ≤ H Σ_{j=k}^{d} C(j,k) A^(j−k)`. Replace the three TauCetiRoadmap links by `GrothendieckNotesLemmas §1.3–1.4`, `CharacterSumsOverFiniteFields §4.1`, and delete the ANT I link (R08). Delete the Mathlib-PR paragraph (lines 44–48): the finite-matrix Hadamard bound at the pin is Mathlib's `Matrix.det_le` (`Mathlib/LinearAlgebra/Matrix/AbsoluteValue.lean:43`, uniform bound `n! • x^n`), and the row-dependent form is this roadmap's target `norm_det_le_factorial_prod`; cite those.

## R07 (P3) — supplier drift: the cited Tau Ceti multiplicity bound does not exist at the pin

Location: `README.md:31` ("Tau Ceti `Algebra/Polynomial/HasseDeriv.lean` … `exists_eval_hasseDeriv_ne_zero_of_natDegree_lt`", linked at TauCeti commit 29bc687), `README.md:65–68` ("Use the existing finite-set multiplicity bound"), `README.md:22–23` ("the native multivariate Hasse derivative").

Claim: the bound "exists". At the pinned Tau Ceti `2fd255d9` there is no file `TauCeti/Algebra/Polynomial/HasseDeriv.lean` and no declaration matching `exists_eval_hasseDeriv_ne_zero` or `hasseDeriv_ne_zero_of_natDegree` in Tau Ceti or Mathlib; the only near name is `MvPolynomial.exists_eval_hasseDeriv_ne_zero_of_blockLinearForm` (`TauCeti/RingTheory/MvPolynomial/HasseDeriv/ChainRule.lean:232`), a different statement. Commit 29bc687 is not the pin. The prerequisite is not unowned: it is the contrapositive of the root-count inequality `k · #S ≤ D` that CharacterSumsOverFiniteFields §4.1 owns (its README at the open head, lines 1278–1286: multiplicity criterion by Hasse jets, `hasseDeriv k (f^q) = 0` for `0 < k < q`, root-count inequality), and CSFF precedes this roadmap in the merge order (154 before 155). `MvPolynomial.hasseDeriv` is at `TauCeti/Algebra/MvPolynomial/HasseDeriv/Basic.lean:85`, not in the `RingTheory/MvPolynomial/HasseDeriv/Taylor.lean` row.

Repair: in the supplier table and I0, replace the Tau Ceti row by "CharacterSumsOverFiniteFields §4.1: the Hasse multiplicity criterion and the root-count inequality; the finite-set form (nonzero `f`, `natDegree f < #S·(k+1)` ⇒ some `D^[j] f (a) ≠ 0` with `a ∈ S`, `j ≤ k`) is its contrapositive", and link the Tau Ceti files at the pinned commit `2fd255d9`, naming `TauCeti/Algebra/MvPolynomial/HasseDeriv/Basic.lean` for `MvPolynomial.hasseDeriv`.

## R08 (P3) — ANT I §0.34c cannot be a consumer

Location: `README.md:247–252` ("Analytic Number Theory Part I §0.34c consumes these general estimates and I3's divisibility and unitriangular-change interfaces").

Claim: that section consumes this roadmap. AnalyticNumberTheoryPartI is line 90 of the merge order and this roadmap line 155: a roadmap earlier in the order cannot consume a later one. At its open head ANT I §0.34c does not mention ArithmeticInterpolationDeterminants; it states "Hadamard's inequality for positive semidefinite real matrices, the resultant multiplicity bound and the multiplicity estimate are targets here" and lists `Matrix.gram`, `Matrix.posSemidef_gram`, `Matrix.det_gram_ne_zero_iff_linearIndependent` as its needs (its README at the head, the §0.34c paragraph and its `*Needs:*`).

Repair: delete the paragraph. Under `## Downstream consumers` name only roadmaps later in the order that cite this one (none do today; say so), and keep the ownership sentence "this roadmap owns the general interpolation-determinant interfaces; an application's Gram matrix, support and parameters stay with the application" in Scope and ownership.

## R09 (P3) — overlapping owners are not cited

Location: `README.md:37` (GrothendieckNotesLemmas cited without a section), `README.md:111–124` (I1), `README.md:118–122` (CRT decomposition as a target).

Claim and witnesses:

- I0 item 3 (`hasseDeriv_powerSubstitution`, `k < p`) is the `e = 1` case of GrothendieckNotesLemmas §1.4 `Polynomial.hasseDeriv_expand_mul` (`hasseDeriv k (expand R (p^e) f * g) = expand R (p^e) f * hasseDeriv k g` for `k < p^e`, its README at the head, lines 287–293), read through `powerSubstitution`; the roadmap says the "general Hasse-kernel targets … retain their owner" but never names the section. GrothendieckNotesLemmas is not in the merge order; the worker must name it in the merge-order paragraph when it submits.
- GenericDoublePointInterpolation §4.6 `univariateHermiteRank` (its README at the head, lines 1414–1420; `Suggested.lean:228`) owns the first-jet case `m_i = 2`: rank `min(d+1, 2n)` over any field. I1 is the general-multiplicity statement; the kept variant must say so in one clause.
- IntegralIwasawaTheory §4.1c `exists_hasseDeriv_eval_eq_ite` owns Hermite interpolation with equal multiplicity `S` at every node over an ultrametric field, with coefficient bounds. Same remark.
- The CRT decomposition `K[X]/(P) ≅ ∏ K[X]/((X − a_i)^(m_i))` is Mathlib's `Ideal.quotientInfRingEquivPiQuotient` (`Mathlib/RingTheory/Ideal/Quotient/Operations.lean:248`) applied to pairwise coprime powers; it is consumed, not planned.

Repair: a `## Scope and ownership` section listing these four with the clause on how I1 differs (arbitrary multiplicities, any field, no bounds), and `*Needs:*` lines citing GrothendieckNotesLemmas §1.4 and the Mathlib CRT by name.

## R10 (P3) — README and Lean do not name each other

Location: `Suggested.lean` as a whole; `README.md` as a whole.

Claim: none of the 20 declaration names of `Suggested.lean` (`powerSubstitution`, `hermiteJet`, `exists_nonzero_ordinary_jet_on_frobenius_graph`, `det_gram_matrix_smul`, …) appears in the README, so no target says which Lean statement tests it; 16 declarations have no docstring (`powerSubstitution_injOn`, `iterate_derivative_powerSubstitution`, `hasseDeriv_powerSubstitution`, `hermiteJet_bijective`, `exists_full_row_minor`, `lift_nonzero_minor`, `coordinates_mem_extended_ideal`, `det_mem_prod_row_ideals`, `unitriangular_mul_minor`, the three `*_prod_mem_ideal_pow`, `norm_det_le_factorial_prod`, `norm_hasseDeriv_eval_le`, `integral_norm_scalar_pow_dvd`, `log_divisor_le_log_abs`); there are no `/-! ## Layer k -/` section comments.

Repair: name each kept declaration in backticks at its README target (the gate then checks the claim), add a docstring stating the mathematics and source to each, and replace the `section` names by `/-! ## Layer k: … -/` comments in README order.

## Verified sound

**Gate and order.** Gate output read (`FAIL` on the seven text/Lean rules above; build and depcheck pass). Depcheck rerun: `depcheck: 245 roadmaps, 2466 edges, 0 problem(s)`, no UPWARD or CYCLE line; this roadmap is listed at line 155 of the merge order, directly after CharacterSumsOverFiniteFields (154); GenericDoublePointInterpolation 37, IntegralIwasawaTheory 29, GlobalHolomorphicFunctions 89, AnalyticNumberTheoryPartI 90 all precede it. `git diff --stat origin/main...HEAD` outside the folder: empty. `metadata.toml` is `topic = "math.NT"`. Overlaps file: no other open pull request changes this roadmap, no dropped ids either way.

**Library declarations opened at the pins** (Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9`), with the `#check` output of the probe: `Matrix.gram` (`Mathlib/Analysis/InnerProductSpace/GramMatrix.lean:40`, `gram 𝕜 v i j = ⟪v i, v j⟫`); `Matrix.det_gram_le_prod_norm_sq`, `Matrix.re_det_gram_le_prod_norm_sq`, `Matrix.re_det_gram_le_pow`, `OrthonormalBasis.norm_det_le_prod_norm` (`TauCeti/Analysis/InnerProductSpace/Gram/Hadamard.lean:77,115,139`; hypotheses `[RCLike 𝕜] [InnerProductSpace 𝕜 E] [Fintype ι] [DecidableEq ι]`, any `E`, as the README says); `Matrix.abv_det_le_prod_sum_abv` (`TauCeti/LinearAlgebra/Matrix/AbsoluteValue.lean:62`, needs `[Nontrivial R]`); `Matrix.det_le` (Mathlib, uniform `n! • x^n`); `MvPolynomial.injOn_aeval_X_pow`, `linearIndependent_aeval_X_pow` (`TauCeti/RingTheory/MvPolynomial/Kronecker.lean:109,121`; `φ_B` is the case `e = (1, B)`, `T = {μ | μ 0 < B}`, on which `weight e μ = μ 0 + B·μ 1` is injective); `MvPolynomial.hasseDeriv`, `hasseDeriv_mul` (`TauCeti/Algebra/MvPolynomial/HasseDeriv/Basic.lean:85`, `…/HasseDeriv/Taylor.lean:68`); `Polynomial.factorial_smul_hasseDeriv`, `hasseDeriv_mul`, `leval`, `det_vandermonde`, `finSigmaFinEquiv`, `Basis.mem_ideal_iff'` (a basis of an ideal of `S`, not of `A` over `R`: it does not give `coordinates_mem_extended_ideal`, and `exact?` finds no single lemma for it), `Algebra.norm_algebraMap`, `Matrix.submatrix_map` (`rfl`), `Matrix.det_of_isLowerTriangular`. Grep for a `det ∈ ∏ ideal` lemma and a full-row-minor existence lemma in Mathlib: none, so `det_mem_prod_row_ideals` and `exists_full_row_minor` are genuine targets.

**Supplier citations resolved.** DiophantineApproximationAndTranscendence on main: §0.1 (line 194), §0.2 (227), §0.3 (358), §1.4 Wronskians (758) exist; §1.7 is block-*linear* substitution, no overlap with the power substitution `Z ↦ X, W ↦ X^p`; pull request #1906 revises it, so citing main is right. GlobalNumberFields and NumberFieldArithmetic exist under `Completed/`. CharacterSumsOverFiniteFields §4.1 at its head: as in R07. GrothendieckNotesLemmas, GenericDoublePointInterpolation, IntegralIwasawaTheory, AnalyticNumberTheoryPartI, ExplicitNumberFields (#1944, which cites ANT I §0.34 and says the interpolation determinant "is not a target"), GlobalHolomorphicFunctions (#992, Hermite interpolation only inside its Runge proof) and BanachAlgebras (main, CRT over ℂ for the functional calculus) read for ownership: no second owner of the general Hermite equivalence, the confluent determinant, the Gram change-of-family identity or the row-ideal determinant lemma; the special cases are listed in R09. LinearFormsInLogarithms §8.5 (ultrametric Hermite interpolation with bounds) is a forbidden supplier and is not cited. Tau Ceti has no `HermiteInterpolation.lean` at the pin (`TauCeti/RingTheory/Polynomial/Hermite/` holds Hermite polynomials only).

**Sources (seeded sample).** IK `b4c346a8…`: §11.6 "Stepanov's method for hyperelliptic curves" (line 730); Lemma 11.16 (line 862, printed p. 283, continuing on p. 284): Hasse jets of orders `< ℓ` vanishing at `a` give `(X − a)^ℓ ∣ f`, proved from the Taylor expansion, every characteristic, as I1 uses; Lemma 11.17 (line 882, p. 284): over a finite field with `q` elements, `E^k(h(X, X^q)) = (E^k_X h)(X, X^q)` for `k < q`, proved from `C(mq, j) = 0` for `0 < j < q` in characteristic `p`; the README's I0 item 3 is the case `q = p` over any characteristic-`p` ring, and its stated reason (vanishing of the intermediate Hasse derivatives of `X^(pj)`) is the source's. Pottmeyer `f86bb607…` §3.3 (line 5054, printed p. 85) and Exercise 3.5 (line 5272, p. 89): the Kronecker substitution `x_i ↦ t^(d^(i−1))` injective on monomials with partial degrees `< d`, which is the "injective weights" the README cites. Milne `24b83c78…` Chapter 2 "Rings of Integers" (line 1117, p. 25): integral elements, norms and traces, as cited for I5. Laurent (Numdam, `5ab66d62…`, §6.2 "Quelques calculs de déterminants", line 527) and Waldschmidt (`e04a822f…`, §§2.4, 10.2) are context citations only; they support no target. The five "Derivation:" paragraphs carry no locators; their routes were checked instead (table). Bombieri–Gubler is a book: see *Not verifiable*.

**Lean form.** `lake env lean` of my probe (same imports as `Suggested.lean`) elaborated at the pins; the worker's targeted build of `Suggested.lean` passes. Every `TauCeti.*` import exists at the pin. I compared the 22 elaborated signatures in `scratch/signatures.md` with the README: no binder lost; generality agrees except that the Vandermonde formula (R03) and `powerSubstitution_injOn` are stated over a `CommRing` in Lean while I1 says "over a field" (the Lean is the wider, correct one). Unused hypotheses noted, not findings: `[Fact p.Prime]` in `iterate_derivative_powerSubstitution` (only `CharP R p` with `p ≠ 0` is used), `hA : 1 ≤ A` in `norm_hasseDeriv_eval_le` (`0 ≤ A` follows from `‖a‖ ≤ A`), `hP` in `log_divisor_le_log_abs`.

**Adversarial table.**

| Statement | Instances | Values each side | Result | Change |
| --- | --- | --- | --- | --- |
| `powerSubstitution_injOn` (`Z`-degree `< B`) | `B = 2`, `F = Z + W`, `G = Z + Z·W` | `φ_2 F = X + X²`, `φ_2 G = X + X³`, distinct; coefficient at `i + 2j` with `i < 2` recovers `(i,j)`; `B = 2`, `F = Z²`, `G = W` (degree `2 ≥ B`): both `X²`, so the hypothesis is needed | sound | none |
| `iterate_derivative_powerSubstitution` | `p = 2`, `F = W`: `D(X²) = 2X = 0`, `φ_2(∂_Z W) = 0`; `F = Z W`: `D(X³) = 3X² = X²`, `φ_2(W) = X²`; `k = 0`: identity | equal | sound | none |
| `hasseDeriv_powerSubstitution` (`k < p`) | `p = 2`, `k = 1`, `F = Z W`: `D^[1] X³ = 3X² = X²`, `φ_2(∂^[1]_Z(ZW)) = X²`; `p = 3`, `k = 2`, `F = Z²W`: `D^[2] X⁵ = C(5,2) X³ = 10X³ = X³`, `φ_3(∂^[2]_Z) = φ_3(W) = X³`; `k = p = 2`, `F = W`: `D^[2] X² = 1` vs `φ_2(∂^[2]_Z W) = 0` | equal for `k < p`; fails at `k = p` as the README's witness says | sound | none |
| `ordinary_jet_zero_iff_hasse_jet_zero` | `p = 3`, `k = 2`, `f = X²`, `a = 0`: `D²f = 2`, `D^[2]f = 1`, both nonzero; `k = 3 = p` would give `D³(X³) = 6 = 0` vs `D^[3] X³ = 1`: the bound `k < p` is sharp | iff holds | sound | padding (R04) |
| `exists_nonzero_ordinary_jet_on_frobenius_graph` | `p = 2`, `F = Z + W` (`Z`-degree `1 < 2`), `S = {0, 1}`, `m = 0`: `φ_2 F = X + X²`, `natDegree 2 < 2·1`? no, hypothesis fails; `S = {0,1,c}` over `𝔽_4`: `2 < 3`, and `F(1, 1) = 0`, `F(0,0) = 0`, `F(c, c²) = c + c² = 1 ≠ 0` | witness exists | sound | none |
| `hermiteJet_bijective` | `r = 0`: `degreeLT K 0 = 0`, target `Unit`; `r = 1`, `m = (2)`: `f = c_0 + c_1 X ↦ (c_0 + c_1 a, c_1)`, bijective; `r = 2`, `a = (0, 0)` (not injective), `m = (1,1)`: `f = X ↦ (0, 0)`, kernel nonzero, so injectivity of `a` is needed | dimensions `M = M`, kernel `0` | sound | none |
| `all_jets_vanish_iff_dvd` | `r = 1`, `m = (2)`, `a = 0`, `f = X`: `D^[1] X (0) = 1 ≠ 0` and `X² ∤ X`; `f = X²`: jets `0, 0`, `X² ∣ X²`; `r = 0`: `1 ∣ f`, LHS vacuous | both directions | sound | none |
| confluent Vandermonde `det V` (R03) | seven `(a, m)` in R03 | listed there | formula and sign confirmed | add to Lean |
| ordinary matrix factor `∏ k!` | `m = (3)`, `a = 0`: rows `k!·e_k`, `det = 0!·1!·2! = 2` vs Hasse `1` | ratio `2 = ∏_{k<3} k!` | sound | none |
| `det_gram_matrix_smul` (real) | `U = [[1,0],[1,1]]`, `v = (e_1, e_2)`: `w = (e_1, e_1 + e_2)`, `Gram(w) = [[1,1],[1,2]]`, `det 1 = 1²·1`; `U = 2·I`: `det Gram(w) = 16·1 = (det U)²·1` with `det U = 4`; `v = (e_1, e_1)` dependent: both sides `0` | equal | sound | none |
| complex Gram convention | `U = [[i]]`, `v = (e_1)`: `⟪i e_1, i e_1⟫ = conj(i)·i = 1 = conj(U) Gram Uᵀ`; factor `‖i‖² = 1` | equal | sound | none |
| `exists_full_row_minor` | `m = 0`: `det = 1 ≠ 0`; `A = [[1,0,0],[0,1,0]]`: `c = (0,1)`; rows `(1,1),(2,2)` dependent: no `c` with nonzero minor, hypothesis needed | holds | sound | none |
| `lift_nonzero_minor` | `f : ℤ → ZMod 2`, `A = [[2]]`: mapped minor `0`, no conclusion; `A = [[1]]`: `1 ≠ 0` lifts; converse fails at `[[2]]` as the README says | holds | sound | padding (R04) |
| `coordinates_mem_extended_ideal` | `A = R`, `b = 1`: `J·R = J`; `A = ℤ[i]`, `J = 2ℤ`, `a = 2 + 2i ∈ 2ℤ[i]`, coordinates `2, 2`; `a = 1 + i`: coordinate `1 ∉ 2ℤ`, and `1 + i ∉ 2ℤ[i]` | iff | sound | none |
| `det_mem_prod_row_ideals` | `n = 0`: `det = 1 ∈ ⊤`; `A = [[2,4],[3,9]]` over ℤ, `J = (2ℤ, 3ℤ)`: `det = 6 ∈ 6ℤ`; `A = [[2,2],[1,1]]`, `J = (2ℤ, ℤ)`: `det 0` | member | sound | none |
| `unitriangular_mul_minor` | `U = [[1,0],[1,1]]`, `A = [[1,2,0],[0,1,5]]`, `c = (0,1)`: `UA = [[1,2,0],[1,3,5]]`, minor `1·3 − 2·1 = 1` = minor of `A` `1·1 − 2·0 = 1`; `U = [[1,2],[0,1]]` (upper unitriangular, excluded by `htri` but with `det U = 1`): `UA = [[1,4,10],[0,1,5]]`, minor `1`, so the lower-triangular shape is a convenience and only `det U = 1` is used; `U = 2·I`: minor `4`, excluded by `hdiag` | equal | sound | none |
| `derivative_prod_mem_ideal_pow`, Hasse and `pderiv` forms | `ι = ∅`: `J⁰ = ⊤`; one factor `f = X`, `g = 1`, `a = 0`, `J = (0)`, `K = 0`: `f(0) = 0 ∈ J`, product `X(0) = 0 ∈ J¹`; two factors `X, X`, `K = 1`, `J = (0)`: `D(X²)(0) = 0 ∈ J²` ✓, while `D²(X²)(0) = 2 ∉ J²`, so `K` must bound the order; Hasse witness `X^p`: `D^p = p!`, `D^[p] = 1` | member | sound | none |
| `norm_det_le_factorial_prod` | `n = 0`: `1 ≤ 1`; `A = [[1,1],[1,−1]]`, `B = (1,1)`: `|det| = 2 ≤ 2! · 1`; Hadamard gives `2`, sharper by `n!/n^(n/2)` from `n = 3` on | holds | sound | none |
| `norm_hasseDeriv_eval_le` | `f = X²`, `k = 1`, `d = 2`, `H = 1`, `A = 2`, `a = 2`: `D^[1] f (2) = 4 ≤ 1·(C(1,1)·1 + C(2,1)·2) = 5`; `k = 3 > d`: LHS `0`, sum empty `0` | holds | sound | none |
| `integral_norm_scalar_pow_dvd` | `K = ℚ(i)`, `a = 2(1 + i)`, `m = 2`, `e = 1`: `N(a) = 8`, `2^(2·1) = 4 ∣ 8`; `m = 0`, `e ≥ 1`: `a = 0`, `0 ∣ 0` | holds | sound | padding (R04) |
| `log_divisor_le_log_abs` | `z = 12`, `P = {2,3}`, `e = (2,1)`: `2 log 2 + log 3 = log 12 ≤ log 12`; `P = ∅`: `0 ≤ log |z|` since `|z| ≥ 1` | holds | sound | padding (R04) |
| I5 bullets | "prime ideal above `p` does not give `p^n`": `K = ℚ(i)`, `a = 1 + i ∈ 𝔭 ∣ 2`, `N(a) = 2`, not `4` | as stated | sound | none |
| I4 logarithmic bound | `n = 0`: `det 1`, `log 1 = 0`; `n = 2`, `B = (1,1)`: `log 2 ≤ log 2! + 0` | holds | sound | none |

## Not verifiable

- **[BG]** Bombieri–Gubler, *Heights in Diophantine Geometry*, proof of Proposition 6.3.10 (README:109, 318): a Cambridge University Press book, not legally readable here; cited by locator only. The claim it supports (injective Kronecker weights) is independently supported by Pottmeyer Exercise 3.5 and by Tau Ceti `injOn_aeval_X_pow`, so nothing in the review depends on it.

## Source issues

- none
