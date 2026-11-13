<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/14773#issuecomment-6858865620 -->
Review (claude) of 2ade995

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) 1.3(a): the weak Serre clause is false for a single antidiagonal and an arbitrary page

   - **Location.** `design/README.md` line 393–394 (and `design/plan.json`, target 1.3, statement (a)):
     "`Hⁿ(Tot K)` lies in every weak Serre class containing the `′E_r^{p,n−p}` for some `r`".
   - **Claim.** If the terms of one page on the antidiagonal `n` lie in a weak Serre class, so does
     `Hⁿ(Tot K)`.
   - **Witness.** Abelian groups, `P` = ℚ-vector spaces (closed under kernels, cokernels of maps between
     its objects, and extensions; not under subobjects: a weak Serre class in the sense of base §2.3).
     `K^{0,0} = ℚ →(d₁) K^{1,0} = ℚ/ℤ`. For `n = 0`, `r = 1`: `′E_1^{0,0} = ℚ ∈ P`, other `′E_1^{p,−p} = 0`;
     `H^0(Tot K) = ℤ ∉ P`.
   - **Why.** Passing from page `r` to `r + 1` takes kernels and cokernels of differentials to and from
     total degrees `n ± 1`, which the hypothesis does not control. stacks-012K line 3289–3290 (Lemma
     25.3 (4)) asks for all `p, q`; base §3.4 asks for a page on which the positions of degree `n` have
     reached the limit page.
   - **Repair.** Replace the clause by: "`Hⁿ(Tot K)` lies in every weak Serre class that contains
     `′E_r^{p,q}` for all `p, q` and some `r` (stacks-012K Lemma 25.3 (4)), and in every weak Serre class
     that contains `′E_r^{p,n−p}` for all `p` and some `r` at or beyond the stabilisation page of total
     degree `n` (base §3.4)". Make the same change in `plan.json`. Add the witness as a Check of 1.3:
     on it the first form fails its hypothesis at `(1, 0)` (`′E_1^{1,0} = ℚ/ℤ ∉ P`), the second at
     `r = 2` (`′E_2^{0,0} = ℤ ∉ P`), so neither repaired statement is refuted.

2. **F02** (P3) 2.1, third Check: false when `h` is a chain map

   - **Location.** `design/README.md` line 548–551: "for a nonzero degree-`0` map `h : I₃ → I₁` … the
     identity of `I₁ ⊕ I₃` is not a chain map between the two middle resolutions".
   - **Witness.** With `φ(u, v) = (u + h(v), v)` and source differential `d(u, v) = (d₁u + tv, d₃v)`:
     `φd − dφ = (h d₃ − d₁ h)(v)`. For the split sequence with `I₁ = I₃`, `t = 0`, `h = id`:
     `φ d φ⁻¹ = d`, so the identity is a chain map.
   - **Repair.** Ask for `d₁ h ≠ h d₃` and give an instance: `I₁ = I₃ = (ℚ/ℤ →(×2) ℚ/ℤ)` (the
     resolution of `ℤ/2` used in the second Check), `h` the identity in degree `0` and zero in degree
     `1`; then `d₁h⁰ − h¹d₃ = ×2 ≠ 0`, the transported differential differs from `d`, the identity is
     not a chain map and `μ = φ` is.

3. **F03** (P3) 2.1: the route's inputs are cited to a source, not to their pinned owners

   - **Location.** `design/README.md` line 535: "*Needs:* Mathlib `InjectiveResolution`,
     `EnoughInjectives`; Stacks's lifting lemmas as cited"; `plan.json` target 2.1 lists only the two
     Mathlib names.
   - **Claim.** A citation stands in for a supplier of the lifting and homotopy-uniqueness lemmas
     (stacks-05QI Lemmas 18.6, 18.7) and of the one-step horseshoe.
   - **Witness.** At the pins: `CochainComplex.isKInjective_of_injective`
     (`Mathlib/Algebra/Homology/HomotopyCategory/KInjective.lean:134`),
     `CochainComplex.IsKInjective.Qh_map_bijective`
     (`Mathlib/Algebra/Homology/DerivedCategory/KInjective.lean:42`), `InjectiveResolution.desc`,
     `descHomotopy` (`Mathlib/CategoryTheory/Abelian/Injective/Resolution.lean:95, 170`);
     `TauCeti.ExactStructure.exists_conflation_of_conflation_of_injective`
     (`TauCeti/CategoryTheory/Exact/Injective.lean:426`, the one-step injective horseshoe in an exact
     category, with `ExactStructure.abelian`).
   - **Repair.** In 2.1's *Needs:*, in "From Mathlib"/"From Tau Ceti" and in `plan.json`, name these
     declarations in place of "Stacks's lifting lemmas as cited"; say in one clause that 2.1(a) for
     objects is the iteration of the Tau Ceti one-step lemma for the abelian exact structure.

4. **F04** (P3) the base contract and the dependency lines disagree

   - **Location.** `design/README.md` line 234–255 ("From TauCetiRoadmap.SpectralSequencesAndConvergence")
     against line 1116 and 1123 (5.2 uses and needs "base §4.3") and line 412; `plan.json` target 1.3.
   - **Witness.** The contract lists §§1.3, 1.4, 2.1, 2.2, 3.1–3.6, 5.1–5.4, 6.1–6.3, 7.5 and no §4.3.
     `plan.json` 1.3 has prerequisites base §3.2 and §7.4; the README's *Needs:* of 1.3 has neither.
   - **Repair.** Add "§4.3 (the canonical comparison of `EInfty` with the limit page)" to the contract;
     make the *Needs:* of 1.3 and the plan's prerequisites the same list (add §3.2; keep §7.4 only if
     the class of categories is meant, and then say so in the contract, which now says "§7.5 … in the
     class of §7.4").

5. **F05** (P3) 3.3: the locator does not contain the low-degree sequences

   - **Location.** `design/README.md` line 836: "prove (base §3.6, first quadrant; grothendieck1957 line
     1330–1337)".
   - **Witness.** grothendieck1957 line 1330–1337 is Théorème 2.4.1: existence of the spectral functor
     with initial term (2.4.3); no five-term or low-degree sequence is stated there.
   - **Repair.** Cite the locator for the spectral sequence only ("the sequence of grothendieck1957
     Théorème 2.4.1") and give the low-degree sequences a locator that states them
     (cartan-eilenberg1956 Ch. XV §5 or weibel1994 §5.8, uncertified), or none beyond base §3.6.

6. **F06** (P3) 1.2 and Layer 1 Examples: the convention of DerivedModuleAlgebra §S.1 is not matched

   - **Location.** `design/README.md` line 379–381 ("`′E_2 ≅ H_I H_II(K)` is DerivedModuleAlgebra §S.1's
     identification") and line 60–64.
   - **Witness.** `TauCetiRoadmap/DerivedModuleAlgebra/README.md` line 957–960: §S.1's double complexes
     have "anticommuting differentials `d′` (in `p`) and `d″` (in `q`)"; here `d₁`, `d₂` commute and the
     total differential is `d₁ + (−1)^p d₂`.
   - **Repair.** Add the dictionary to the Check: a double complex here gives one of §S.1 by
     `d′ = d₁`, `d″ = (−1)^p d₂`, with the same total complex and column filtration; on the unit square
     `d″` is `+1` on `K^{0,0}` and `−1` on `K^{1,0}`.

7. **F07** (P3) Downstream consumers: earlier roadmaps, a promise of import, and an unnamed owner

   - **Location.** `design/README.md` line 1278–1284: "they state these sequences for their own use and
     can import Layers 2–4 in a revision"; line 91–93: "graded Tor over graded algebras are not part of
     this roadmap".
   - **Witness.** ArithmeticStatisticsPartVIII, InverseGaloisAndArithmeticFundamentalGroupsPartII,
     K3BlochGroups, EtaleDualityAndPerverseSheaves, TorsionCohomologyInfrastructure and
     HilbertModularVarietiesAndShimuraCurvesPartII are all earlier in the merge order; an import would
     be upward. ArithmeticStatisticsPartVIII §5.16, *Tor spectral sequences over graded algebras*,
     items (ii), (iii), (v), states balance, universal coefficients and change of rings for
     nonnegatively graded, not necessarily commutative `k`-algebras.
   - **Repair.** Delete "and can import Layers 2–4 in a revision". Under "It leaves to named owners"
     add: "**ArithmeticStatisticsPartVIII, §5.16** (*Tor spectral sequences over graded algebras*):
     balance, universal-coefficient, hyperhomology and change-of-rings sequences for graded modules
     over a nonnegatively graded, possibly noncommutative algebra over a field, on its own graded
     carrier; Layer 4 states the ungraded forms over commutative rings on Mathlib's `Tor`", and say in
     the exclusions that Tor of one-sided modules over noncommutative rings is not part of this
     roadmap.

8. **F08** (P3) 6.2: `A^s` is undefined and collides with the ring `A`

   - **Location.** `design/README.md` line 1234–1235: "the kernel of `A^s → Hⁿ(M)[1/f]` is `⋃_r ker i^r`
     … `gr^s ≅ A^s/(iA^{s+1} + ⋃_r ker i^r)`".
   - **Witness.** `A` is the coefficient ring since line 1179; `A^s = D^{s,n−s}` is the base's notation
     (base §7.4), never introduced here.
   - **Repair.** Write `D^{s,n−s}` (which is `Hⁿ(M)` for every `s`) in place of `A^s`.

One blocking finding (R01, P2: a clause of 1.3(a) is false as written) and seven P3 notes. No
previous review; no maintainer notes; no declared gaps. Files reviewed:
`packages/SpectralSequencesAndConvergencePartII/design/README.md`, `design/plan.json`,
`sources.toml`. This lane does not elaborate, and the design stage has no `Suggested.lean`: steps 6
(Lean form) and 7 (one-tactic probe) were not run.

## Adversarial table

Values computed by me; "base" is the board design of SpectralSequencesAndConvergence.

| Statement | Instances | Values on each side | Result | Change |
|---|---|---|---|---|
| Conventions, total sign | unit square of `ℤ` | `D(1) = (1, 1)`; `K^{1,0} → K^{1,1}`: `−1`, `K^{0,1} → K^{1,1}`: `+1`; `D² = 1 − 1 = 0`; unsigned: `2`. Mathlib `ε₁ = 1`, `ε₂ = c.ε p` (`ComplexShapeSigns.lean:158–159`) | agrees | none |
| 1.1 staircase | `D_p = K^{p,−p}`, `O_p = K^{p+1,−p}` | component at `O_p`: `x_p + (−1)^{p+1} x_{p+1}`; kernel in `∏`: `x = (1, 1, −1, −1, 1, 1, …)`; on `⊕` bijective (solve downward from `x_N = 0`); `H^0(Tot^⊕) = 0`, `H^0(Tot^Π) = ℤ`, `H^1 = 0` both | agrees | none |
| 1.2 first page (sample) | `ℤ →(×2) ℤ` horizontal; column-sign complex | `′E_1^{0,0} = ′E_1^{1,0} = ℤ`, `′d_1 = 2`, `′E_2^{1,0} = ℤ/2`. Flip: `″d_1 = +2`; Stacks 25.1(4): `(−1)^1·2 = −2`; `σ(1,0) = 1`, `σ(1,1) = −1` intertwines | agrees with stacks-012K line 3258–3265 | none |
| 1.2 `gr^p ≅ K^{p,•}⟦−p⟧` | degree `n` | `K^{p,n−p}` both sides; differential `(−1)^p d₂ = (−1)^{−p} d₂` | agrees | none |
| 1.3(a) finite antidiagonals (sample) | `ℤ →(×2) ℤ`; `ℚ → ℚ/ℤ` with `P` = ℚ-vector spaces | first: `F^1H^1 = ℤ/2`, `F^2H^1 = 0`. Second: `′E_1^{0,0} = ℚ ∈ P`, `H^0 = ℤ ∉ P` | weak Serre clause false | R01 |
| 1.3(b), (c) (sample) | staircase; half-planes | `″E` on `⊕`: rows exact, `q ≤ 0` ⇒ `H = 0` ✓. `′E` on `∏`: `p ≥ 0`, `′E_1 = ℤ` at `(0,0)` ⇒ `H^0 = ℤ` ✓. Upper half-plane `q ≥ a` ⇒ `p ≤ n − a` (b); lower `q ≤ b` ⇒ `p ≥ n − b` (c). Regularity: target of `d_r` is `H^{n+1−(p+r)}(K^{p+r,•})` | agrees with base §§5.4, 7.5 hypotheses | none |
| 1.4 | projection of staircase to column `0` | column `p ≥ 1`: `D_p ≅ O_{p−1}` exact; `∏`: `(1,1,−1,…) ↦ 1`, iso; `⊕`: `0 → ℤ` | agrees | none |
| 1.5 and Weibel dictionary | four cases under `C_{p,q} = K^{−p,−q}`; flipped staircase | each of Weibel's four cases lands in one of the eight; flipped staircase: columns exact, `p ≤ 0` ⇒ `Tot^⊕` acyclic ✓, `Tot^Π` has `H^0 = ℤ` and fails `p ≪ 0` ✓ | agrees | none |
| 2.1(a) horseshoe (sample) | `0 → ℤ →(2) ℤ → ℤ/2 → 0` | middle terms `ℚ ⊕ ℚ/ℤ`, `ℚ/ℤ ⊕ ℚ/ℤ`; untwisted sum has `H^0 = ℤ ⊕ ℤ/2 ≠ ℤ` | agrees with stacks-05QI line 3402–3448 | none |
| 2.1(b) route (sample) | general | homotopy `R₂^n → I₃′^{n−1}` lifts through split epi; correction `h̃¹dε = 0`; restriction to `R₁` lands in `I₁′`; extension along mono into injective | sound | R03 (owners) |
| 2.1 Check 3 | `I₁ = I₃`, `h = id` | `φd − dφ = hd₃ − d₁h = 0` | Check false | R02 |
| 2.2 (sample) | `Hom(ℤ/2, −)` at `ℤ`; `− ⊗ ℤ/2` at `ℤ` | `R⁰ = 0`, `R¹ = Hom(ℤ/2, ℚ/ℤ) = ℤ/2`; `R⁰(−⊗ℤ/2)(ℤ) = ker(0 → 0) = 0 ≠ ℤ/2` | agrees with stacks-05QI line 2872–2896, 2952–2970 | none |
| 2.3 | `ℤ →(2) ℤ` with columns `ℚ → ℚ/ℤ`, `d₁ = 2` | `H_I^1`: `ℚ/2ℚ = 0`, `(ℚ/ℤ)/2 = 0`; does not resolve `ℤ/2` | agrees | none |
| 2.4 | `Hom(ℤ/2, −)`, `K = (ℤ →(2) ℤ)` | `′E_1^{0,1} = ′E_1^{1,1} = ℤ/2`, `′d_1 = Ext¹(ℤ/2, 2) = 0`; abutment `ℤ/2` in degrees `1, 2` = `Ext^{n−1}(ℤ/2, ℤ/2)` | agrees | none |
| 2.5 (sample) | same; non-CE column resolution with `F = id` | `″E_2^{0,1} = ℤ/2`, `″E_2^{1,1} = ℤ/2`; non-CE: row `1` kernel of `×2` on `ℚ/ℤ` at `(1, 0)` against `(0, 1)`. F-acyclic rows: `R¹F(Z) = R¹F(B) = 0` keep `0 → Z → L → B → 0` exact after `F` | agrees with stacks-05QI line 3655–3689, grothendieck1957 line 1291–1298 | none |
| 2.6 (sample) | `K = (ℤ →(2) ℤ)` in degrees `−1, 0`, `F = − ⊗ ℤ/2` | `(K°)^n = op K^{−n}`; `E^1_{0,0} = E^1_{1,0} = ℤ/2`, `d^1 = 0`; `L_0 = L_1 = ℤ/2`; unop of `(r, 1 − r)` is `(−r, r − 1)` | agrees | none |
| 3.1 | `F = G = Hom(ℤ/2, −)` at `ℚ/ℤ`; summand argument | `R¹(GF)(ℚ/ℤ) = 0`, `H¹RG(ℤ/2) = ℤ/2`; `I ↪ M` splits, so `R^qG(F(I))` is a summand of `0` | agrees with stacks-05QI line 3705–3717, grothendieck1957 line 1338–1342 | none |
| 3.2 | `ℤ/4 → ℤ/2`, `A = ℤ/2` | `Hom_{ℤ/4}(ℤ/2, ℤ/4) = {0, 2}`, differential `×2 = 0`; `E₂^{0,q} = ℤ/2`; abutment `Ext^n_{ℤ/4}(ℤ/2, ℤ/2) = ℤ/2` | agrees with ArithmeticGaloisDuality §D7.1 | none |
| 3.3 (sample) | same example; `m = 1` | `0 → 0 → ℤ/2 → ℤ/2 → 0 → ℤ/2`; `m = 1` gives the five-term sequence; base §3.6 has both | statement agrees; locator not | R05 |
| 3.4 (sample) | `ℤ → ℤ/2`, `F = − ⊗ ℤ/2`, `G = Hom_{ℤ/2}(−, ℤ/2)`; `G = Hom(−, ℤ)` | `E₂^{0,q} = ℤ/2` (`q = 0, 1`), abutment `Ext^n_ℤ(ℤ/2, ℤ/2)`; non-example: `Ext¹((ℤ/2)^{(X)}, ℤ) = ∏ ℤ/2 ≠ 0`, `Hom(− ⊗ ℤ/2, ℤ) = 0`. Homological five-term from `E²_{2,0}, E²_{0,1}, E²_{1,0}` | agrees | none |
| 4.1 (sample) | `Tor_1(ℤ/4, ℤ/6)` | `ker(6 on ℤ/4) = {0, 2}`, `ker(4 on ℤ/6) = {0, 3}`; rows need `− ⊗ Q_j` exact, columns `P_i ⊗ −` exact; `Tor` derives the second variable (`Tor.lean:44`) | agrees | none |
| 4.2(a) (sample) | `ℤ/2 ⊗^L ℤ/2`; `⊕_n ℤ/2[n]` | rows `P^p`, `p ≤ 0` ⇒ 1.3(b) row case; `E₂^{0,0} = E₂^{−1,0} = ℤ/2`; unbounded: `Hⁿ = (ℤ/2)²`; SES from columns `0, −1` | agrees with stacks-more-algebra line 7121–7134 (bounded there) | none |
| 4.2(c) (sample) | `X = (ℤ →(2) ℤ)`, `M = ℤ` | `E₂^{1,0} = Ext¹(ℤ/2, ℤ) = ℤ/2`, `E₂^{0,0} = 0`; `H¹(Hom(X, ℤ)) = ℤ/2`; SES indices `H^{1−n} = H_{n−1}` match `exact_extToHomology_kronecker` | agrees | none |
| 4.3 | `k[ε]/(ε²)`, `K = L = k`; finiteness | `E₂^{p,0} = k` for `p ≤ 0`; in total degree `n`: `n − a − b ≤ p ≤ 0`, and `q − b ≤ i ≤ a`: finite | agrees | none |
| 4.4 (sample) | `ℤ → ℤ/4`, `M = N = ℤ/2` | `E²_{p,q} = ℤ/2` (`p ≥ 0`, `q ∈ {0,1}`); abutment `ℤ/2, ℤ/2, 0, …`; `E²_{1,0}` survives, so `d² : E²_{p,0} → E²_{p−2,1}` is injective, hence bijective, for `p ≥ 2` | agrees with stacks-more-algebra line 7135–7140 | none |
| 5.1 (sample) | `μ_0`; Bockstein couple of `ℤ`; stupid filtration non-example | `μ_0`: `c = k(xy)` forced, `jk(xy) = jk(x)y ± x jk(y)`; `ℓⁿa = 0 ⇒ a = 0`, `c = 0`; non-example `d(1·1) = 2 ≠ 0` | agrees with may-primer line 249–287 | none |
| 5.2 (sample) | `𝔽₂[x, y]/(x²)`, `dx = y`; route | `d(x²) = 2xy = 0`; `d₁(xy^p) = y^{p+1}`; `d₁(x·y) = y²`; `E₂ = 𝔽₂`. Route: `dx̃ = a′ ∈ F^{p+n+1}` after subtracting `u ∈ F^{p+1}`; `d(x̃ỹ) ∈ F^{p+p′+n+1}` | agrees with may-primer line 295–324 | none |
| 5.3 (sample) | bidegree components of `D(xy)`; `A ⊠ B`; flip | `(−1)^{p+p′}d₂(xy) = (−1)^p d₂(x)y + (−1)^{p+q+p′} x d₂(y)` ⇒ stated rule; `x = 1 ⊗ b`, `y = a′ ⊗ 1`: ratio `(−1)^{qp′}(−1)^{(q+1)p′} = (−1)^{p′}`; flip sign `(−1)^{(p+p′)(q+q′) − pq − p′q′} = (−1)^{pq′+p′q}` | agrees (cartan-eilenberg1956 not read) | none |
| 6.1 (sample) | `ℤ →(p) ℤ`; `ℤ →(p²) ℤ`; `ℤ/p[0]` | `k(1) = [1]`, `j = 1`: `d_1 = +1`; `k(1) = [p]`, `j = 0`; `×p = 0` not injective. Degrees `(−1,1), (0,0), (1,0)` | agrees with may-primer line 136–150, stacks-more-algebra line 12960–13014 | none |
| 6.2 | `ℤ →(p^r) ℤ`; `⊕_k (ℤ →(p^k) ℤ)`; `ℤ → ℤ[1/p]` | `(p^{s−1}ℤ/p^r)[p] = ℤ/p` iff `s ≤ r`; `E_r^0 = ⊕_{k ≥ r} ℤ/p`, `Z_∞ = ker k = 0`; divisible `H^1`: `E_r^0 = ℤ/p`, `H^0[1/p] = 0`. `ker k/B_r ≅ f^{r−1}Hⁿ/f^rHⁿ` checked; `r ≥ b ⇒ f^rH ∩ H[f] = 0` | agrees with hatcher-at line 13330–13337 | R08 (notation) |

## Duplication audit

- Pinned libraries, by object: no product total complex, no Cartan–Eilenberg resolution, no
  hypercohomology or Grothendieck spectral sequence, no `Tor ≅ Tor'` (`Mathlib/CategoryTheory/Monoidal/Tor.lean`
  docstring), no Bockstein spectral sequence (Tau Ceti has first-order Bockstein maps of continuous
  cohomology only), no comparison of `Functor.rightDerived` with `rightDerivedFunctorPlus`
  (`RightDerivedFunctorPlus.lean` has a TODO to refactor `Functor.rightDerived`;
  `RightDerived.lean:45–46` says it shall be redefined through it). Tau Ceti has a one-step injective
  horseshoe and finite projective horseshoes in exact categories (R03).
- Roadmaps (`roadmaps grep` over main and the open heads, eleven object patterns): the
  composite-functor sequence of an object is ArithmeticGaloisDuality §D7.1 (cited, object case);
  first-quadrant double complexes are DerivedModuleAlgebra §S.1 (cited); the singular-chain Künneth
  sequence is AlgebraicTopology §5.1 (cited as instance); ArithmeticLocallySymmetricSpaces ALS.1.7 is
  an instance of 4.2(a) (cited in Examples); TopologicalSheafCohomology §1.4 is Čech hypercohomology
  on covers (cited in Examples); ArithmeticStatisticsPartVIII §5.16 states graded forms of 4.1, 4.2,
  4.4(a) (R07). No match for a Bockstein spectral sequence, acyclic assembly, or pairings of exact
  couples.
- `scratch/overlaps.md`: no other pull request changes this roadmap, no dropped or revision-only id,
  no second copy.

Overlap check: read DerivedModuleAlgebra (§§0.2, S.1), TopologicalSheafCohomology (§1.4), SchemeKTheoryOperations, AlgebraicTopology (§5.1), EnhancedDerivedSheaves, DerivedInfinityCategories; shared objects: first-quadrant double-complex sequence — DerivedModuleAlgebra; derived tensor product — DerivedModuleAlgebra; singular Künneth sequence — AlgebraicTopology; Čech hypercohomology sequences — TopologicalSheafCohomology; nothing else shared.

## Supplier-order audit

Gate output:

    candidate: SpectralSequencesAndConvergencePartII is not in the merge order yet; checked as if placed after ArithmeticGaloisDuality (the intake inserts it when its design is accepted)
    depcheck: 240 roadmaps, 2173 edges, 0 problem(s)

No UPWARD or CYCLE line. Citations resolved now: DerivedModuleAlgebra §0.2 (line 794) and §S.1 (line
955) on main; ArithmeticGaloisDuality §D7.1, target *Derived composite spectral sequence*, at its open
head (statement, hypotheses, edge maps and the three Checks quoted in 3.2 all found);
StableHomotopyKTheory §7.22 at its open head; SchemeAndStackFoundations §§2.2, 2.7, 2.15 with the
four names; DGFloer Layer 1 item 2; TopologicalSheafCohomology §1.4; AlgebraicTopology §5.1;
ArithmeticLocallySymmetricSpaces ALS.1.7; ArithmeticStatisticsPartVIII §5.16. Base sections §§1.3,
1.4, 2.1, 2.2, 3.1–3.6, 4.3, 5.1–5.4, 6.1–6.3, 7.4, 7.5 all exist in the board design of the base, and
the statements consumed (indexing of §5.1, hypotheses of §§5.3, 5.4, 7.5, tower formulas of §6.2,
couple of §6.3, two-column and five-term forms of §3.6) match what is assumed here. All 24 *Needs:*
lines read; mismatches are R03 and R04.

## Shape, headline theorems, copyright

- Shape: six layers, each with Examples and Dependencies; 24 targets, each with at least three
  Checks (3 to 5); every theorem has hypotheses and a locator; no LaTeX delimiters, no machine
  paths, no pull-request numbers; one process phrase (R07). The layer order is forced: Layer 2 needs
  1.2, 1.3, 1.5; Layer 3 needs 2.2, 2.5; Layer 4 needs Layers 1–3; 5.3 needs 1.1, 1.2; 6.2's
  multiplicativity needs 5.2.
- Headline theorems (from the Summary): half-plane convergence and acyclic assembly (1.3, 1.5);
  the two hypercohomology sequences (2.4, 2.5); the composition theorem and composite-functor
  sequence (3.1, 3.2); `Tor ≅ Tor'` (4.1); universal-coefficient, Künneth, change-of-rings (4.2–4.4);
  Leibniz rule on pages (5.1, 5.2); Bockstein pages and convergence (6.2). No `Suggested.lean` at this
  stage; 4.1 and 2.2(i) are statable at the pins and should be stated at the package stage.
- Wording: compared at every sampled locator and at 2.3 (definition and existence), 3.1, 5.1 (the
  condition `μ_n`), 6.1, 4.2(b), the 1.5 route. The definition of `μ_n` and of a Cartan–Eilenberg
  resolution follow their sources in content, as formulas and hypothesis lists that admit one form;
  no sentence is shared.
- Arrangement: Layers 2–3 against stacks-05QI §§16, 18, 19, 21, 22: 2.1 ↔ §18, 2.2 ↔ §16, 2.3–2.5 ↔
  §21, 2.6 ↔ §19, 3.1–3.2 ↔ §22; not in the source's order, and Layers 1, 4, 5, 6 draw on other
  sources.

Source independence: 21 passages compared with 6 sources (stacks-012K, stacks-05QI, stacks-more-algebra, grothendieck1957, may-primer, hatcher-at), none shared; largest share stacks-05QI, 15 of 73 locators; contents compared with stacks-05QI: independent.

## Verified sound

- All 15 sampled targets against the cached texts (table above), plus 1.1, 1.4, 1.5, 2.3, 2.4, 3.1,
  3.2, 4.3, 6.2: 24 of 24 targets recomputed; 85 Checks read, 1 false (R02).
- Every backticked Mathlib and Tau Ceti declaration name of the README (about 70) located at the pins, all present, among them
  `rightDerivedFunctorPlus` (`RightDerivedFunctorPlus.lean:47`), `rightDerivedFunctorPlusUnit` (:96),
  `NatTrans.rightDerivedFunctorPlus` (:156), `DerivedCategory.Plus.Q` with its `IsLocalization`
  instance (`Plus.lean:226, 280`), `SpectralSequence.Hom.comm` (`SpectralSequence/Basic.lean:60`),
  `totalFlipIso` (`TotalComplexSymmetry.lean:113`), `Adjunction.map_injective`
  (`Injective/Basic.lean:280`), `EnoughInjectives Cᵒᵖ` (:265), `CochainComplex.opEquivalence`
  (`CochainComplexOpposite.lean:80`), `quasiIso_totalAugmentation_of_rows`
  (`TauCeti/Algebra/Homology/TotalComplex.lean:596`), `isIso_hom_f_of_le` (`Comparison.lean:32`).
- Remark, no change: the bound of 1.3's API bullet holds because a nonzero `d_r` out of column `p`
  needs the columns `p, …, p + r − 1` on antidiagonal `n`.
- Manifest: 11 works, every cited work recorded; 7 certified texts read at their locators.

## Not verifiable

- weibel1994, mccleary2001, cartan-eilenberg1956, massey1954: settled as uncertified; their locators
  were not read. From memory only: in weibel1994 §5.7, Lemma 5.7.2 is the existence of
  Cartan–Eilenberg resolutions and the lifting of chain maps is an exercise next to it; 2.3 cites the
  lemma for the lifting. A reader with the book should check.
- The base SpectralSequencesAndConvergence is a board design under review (not on main, not in the
  merge order, not in a pull request): its sections were resolved against the board copy, which may
  still change.
- Elaboration, `#check` comparison and the one-tactic probe: no `Suggested.lean` at the design stage,
  and this lane does not elaborate.
- Ownership against open pull requests was checked through `roadmaps grep` and `roadmaps show` at
  the indexed heads only.

## Source issues

- none

## For the human reviewers

- **Scope/order.** The base `SpectralSequencesAndConvergence` exists only as a board design in review
  (`packages/SpectralSequencesAndConvergence/design/`); the gate does not see it and places this
  roadmap after ArithmeticGaloisDuality. The base must enter the merge order first.
- **Not tested.** weibel1994 carries 11 of 73 locators and is uncertified; its wording and contents
  were not compared.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ade995c4b36edcf15aa4e3325df58c4f74b4a50", "job": "REV-DESIGN-SpectralSequencesAndConvergencePartII", "model": "fable", "worker": "chris-x51"} -->
