# Review of HypergeometricMotives (pull request #1716 at cea276d)

**Verdict:** needs changes

Source ids used below: `bcm2015` (Beukers–Cohen–Mellit, arXiv 1505.02900v2), `rrv2022` (Roberts–Rodriguez Villegas, Notices 69), `qian2021` (arXiv 2104.09761v1), `negami2026` (arXiv 2609.11793v1, OCR), `greene1987`, `fedorov2018`, `ono1998`. Beukers–Heckman is `beukersheckman1989` (paywalled, see *Not verifiable*).

## R01 (P1) — The zigzag's recorded heights collapse repeated parameters

Location: `TauCetiRoadmap/HypergeometricMotives/README.md` 2.1 ("prove `ht (i+1) = Z(L i)`, so that the height at which `α_i` is recorded is `Z(rep α_i) − 1`"), 2.2 ("Define `recordedHeights := (α.map (fun a ↦ Z(rep a) − 1))`"), 2.3; `TauCetiRoadmap/HypergeometricMotives/Suggested.lean` `HypergeometricParameters.recordedHeights` (Layer 2, about line 500) and everything built on it (`weight`, `hodgeNumber`, `hodgeVector`, `CyclotomicData.weight`, `hodgeTwist`, `type`).

Claim: the multiset of heights at which the `α`'s are recorded is `{Z(rep a) − 1 : a ∈ α}`, and `ht (i+1) = Z(L i)`.

Witness: `Z(x)` counts every copy of a class, so two copies of `1/2` in `α` both receive `Z(1/2) − 1`. For `A2.2_B1.1` (`α = (1/2, 1/2)`, `β = (1, 1)`): `Z(1/2) = 2`, so `recordedHeights = {1, 1}`, `weight = 0`, `hodgeVector = [2]`; the README's own 2.2 procedure (and the LMFDB) give recorded heights `0, 1`, `weight 1`, `(1, 1)`. Likewise `A2.2.2.2_B1.1.1.1` gives `[4]`, `w = 0` instead of `(1,1,1,1)`, `w = 3`; `A2.2_B4` gives `[2]`, `m = 0` instead of `(1,1)`, `m = −1`; `A4.2.2_B3.1.1` gives `[1, 3]` instead of `(2, 2)`; `A6.4.4.3_B12.2.2.2.1` gives `[1,1,2,3,1]` instead of `(1,2,2,2,1)`. Consequently these Lean statements are false as written: `hodgeVector_dworkDatum` (both conjuncts for `dworkDatum` and `tameDatum`), `even_weight_iff` (for `legendreDatum`: `Even 0 ↔ Odd 2`), `two_mul_hodgeTwist` (`legendreDatum`: `0 + 0 + 2 ≠ 0 + 1`), `hodgeTwist_eq_neg_minHeight` (`legendreDatum`: `0 = −1`), `weight_eq_zero_iff_interlace` (`legendreDatum`: weight `0`, not interlacing since `Z(1/2) = 2`), `weight_eq_sSup_sub_sInf` (`legendreDatum`: `0 ≠ 2 − 0 − 1`), `det_hOne_eq_neg_one_iff` (`legendreDatum`: `det h_1 = (−1)^{0+2} = 1`, type collapses to orthogonal), `frobeniusTrace_twistDatum` (`twistDatum.hodgeTwist = (0 + 1 − 0 − 0)/2 = 0 ≠ 1`), `frobeniusSum_integral` (`twistDatum`, `q = 3`, `t = 2`: `3^0 · (−2/3) ∉ ℤ`; the value `H_3(1/2,1/2;1/4,3/4 | 2) = −2/3` is recomputed below). The README's statement "distinctness is `disjoint`" in 2.1 is the error: disjointness of `α` and `β` does not make the entries of `α` distinct, and the LMFDB's families almost always repeat classes.

Repair, tested: define the recorded heights over the distinct classes, each class `a ∈ α` of multiplicity `c = count a α` contributing the interval `{Z(rep a) − c, …, Z(rep a) − 1}` (equivalently `α.dedup.bind (fun a ↦ (range (count a α)).map (fun j ↦ Z(rep a) − 1 − j))`). On all 2322 cyclotomic data with entries `≤ 10` and `d ≤ 6` this multiset equals the one produced by the README's sorted-list procedure, and on the five refuting instances above it gives `{0,1}`, `{0,1,2,3}`, `{−1,0}`, `{0,0,1,1}`, `{−2,−1,−1,0,0,1,1,2}`. In the README, 2.1 must state `ht` on the sorted list with multiplicity and replace "`ht (i+1) = Z(L i)`" by the block form (the height before the block of copies of `a` is `Z(rep a) − count a α`), and 2.3's "definitional unfolding" must use the same multiset. With the correct definition every law of 2.4–2.8 and 4.8 held on all 2322 data (table below).

## R02 (P1) — The shift identity fails at `t = 0`

Location: `Suggested.lean` `katzSum_shift` (Layer 4): "`ω((-1)^d t)^μ * katzSum ω ψ (a.map (· + μ)) (b.map (· + μ)) t = katzSum ω ψ a b t`", no hypothesis on `t`; `README.md` 4.6 likewise states Theorem 3.4 "for `μ ∈ ZMod 𝔮`" with no `t ≠ 0`.

Witness: `F = 𝔽_5`, `a = {0}`, `b = {2}`, `μ = 1`, `t = 0`. Left side: `ω(0)^1 · S = 0`. Right side: `S_5(a, b | 0)` is the single `m = 0` term `(1/4) g(0) g(−2) = −√5/4 ≈ −0.559` (computed with Mathlib's conventions `ω(0) = 0`, `g(0) = −1`). The source states the identity for `t ∈ 𝔽_q^×` only (`bcm2015` line 470–472). With `t = 2` the identity as written (with `ω((−1)^d t)`) holds numerically, `−2.236 = −2.236`, while the source's printed `ω(t)^μ` gives `+2.236`: the README's correction of the misprint is right, the dropped hypothesis is not.

Repair, tested: add `(ht : t ≠ 0)` to `katzSum_shift` and to 4.6 (the `H_q` form inherits it). The instance above then lies outside the statement, and at `t = 2`, `3`, `4` over `𝔽_5` the identity holds.

## R03 (P2) — Hasse–Davenport product cited to a section that does not state it

Location: `README.md` *Consumed, not redefined* ("From the sibling roadmap `CharacterSumsOverFiniteFields`: its 3.4, the **Hasse–Davenport product relation** `g(Nm) = …`"), 4.7 ("consumed from `CharacterSumsOverFiniteFields`"), *Ordering*, and the *Explicit scope exclusions*.

Claim: `CharacterSumsOverFiniteFields` 3.4 supplies the general product relation for every `N ∣ q − 1`.

Witness: at its open head, `TauCetiRoadmap/CharacterSumsOverFiniteFields/README.md` 3.4 (line 937) is "The Hasse–Davenport product formula: specialize the product relation in the supplier contract to `ψ_F`" and states only the `m = 2` duplication consequence; its own supplier contract (line 147) says the full product formula "for every multiplicative character and every nontrivial additive character" is `ClassicalArithmeticCompletion` §7.29. That section exists on main (`TauCetiRoadmap/ClassicalArithmeticCompletion/README.md` line 15058, "The Hasse–Davenport product relation", `g(χⁿ) ∏_{j=1}^{n−1} g(λʲ) = χ(n)ⁿ ∏_{j=0}^{n−1} g(χλʲ)`), which is the README's form up to dividing by `χ(N)^N`.

Repair: cite `ClassicalArithmeticCompletion` 7.29 (on main, earlier in the order) for the product relation in *Consumed*, 4.7 and *Ordering*; keep `CharacterSumsOverFiniteFields` for what it owns (its Gauss-sum layer and 3.3, 6.4, 6.5 in *Not owned here*). Its 3.4 may be cited for the duplication case only.

## R04 (P2) — Ono's theorem is statable at the pins and absent

Location: `Suggested.lean` module docstring ("Ono's theorem 6.1 has no declaration here: its curve is the Legendre equation of `EllipticLegendreCharacterInterfaces` 0.1, cited in `README.md` only"); `README.md` 6.1.

Claim: 6.1 is not statable at the pins.

Witness: the same file states `cubic_point_count` on the bare Mathlib literal `cubicFamily lam := ⟨1, 0, lam, 0, 0⟩ : WeierstrassCurve F` and counts `Nat.card (…).toAffine.Point`. The Legendre curve is the literal `⟨0, −(1 + λ), 0, λ, 0⟩` (the README's own 0.1 description), so `Nat.card (⟨0, -(1+λ), 0, λ, 0⟩ : WeierstrassCurve F).toAffine.Point = q + 1 − (−1)^{(q−1)/2} H_q({𝔮/2, 𝔮/2}, {0, 0} | λ)` elaborates against the pins exactly as the cubic case does. Value check: over `𝔽_5` with `λ = 2`, the affine solutions plus the point at infinity number `8` and `H_5 = −2`, so `5 + 1 − (−1)^2 · (−2) = 8`; over `𝔽_13`, `λ = 2`: count `8`, `H_13 = 6`, `13 + 1 − 6 = 8`; `λ = 7`: count `20`, `H_13 = −6`.

Repair: state 6.1 (Theorem 1.2 of `bcm2015`, line 104–108) on the Weierstrass literal with hypotheses `Odd (card F)`, `λ ≠ 0`, `λ ≠ 1`; the README may still say the curve is `EllipticLegendreCharacterInterfaces`' `legendre λ` by definition.

## R05 (P2) — `frobeniusTrace_integral` includes the junk exponent `f = 0`

Location: `Suggested.lean` `frobeniusTrace` ("Intended for … `f ≥ 1`") and `frobeniusTrace_integral (t) (ht) (p) [Fact p.Prime] (f : ℕ) (hp : D.IsGood t p) : ∃ z : ℤ, D.frobeniusTrace t p f = z`.

Claim: the trace is an integer for every `f`.

Witness: at the pin `GaloisField p 0` is `SplittingField (X^1 − X) = SplittingField 0`, and `SplittingFieldAux 0 f` is the base field (`Mathlib/FieldTheory/SplittingField/Construction.lean` lines 125–142), so `GaloisField p 0 ≅ ZMod p` has `p` elements while the prefactor is `(p^0)^δ = 1`. For `twistDatum` (`A2.2_B4`, `δ = 1`), `t = 2`, `p = 3`, `f = 0`: `frobeniusTrace 2 3 0 = H_3(1/2,1/2;1/4,3/4 | 2) = −2/3`, and `3` is good for `(D, 2)`. (With the current collapsed `hodgeTwist` the statement already fails at `f = 1`, R01.)

Repair, tested: add `(hf : 0 < f)` to `frobeniusTrace_integral` (and to any later statement that reads `frobeniusTrace … f` as `a_{p^f}`), or index the field by `f + 1`. With `f = 1` the value is `3 · (−2/3) = −2 ∈ ℤ`.

## R06 (P2) — `frobeniusPolynomial_int_of_isPure` has no good-prime hypothesis

Location: `Suggested.lean` `frobeniusPolynomial_int_of_isPure (t : ℚ) (p : ℕ) [Fact p.Prime] (hpure : D.IsPure t p) : ∃ G : ℤ[X], G.map (Int.castRingHom ℚ) = D.frobeniusPolynomial t p`; `README.md` 5.5 (ii).

Claim: purity alone makes the Frobenius polynomial integral.

Witness: the README's proof of (ii) ("the `λ ∈ Λ` are algebraic integers, because their power sums … are integers (5.1)") uses 4.9, which needs `t ≠ 0` and `p` not wild; the Lean statement quantifies over every `t` and every prime `p`, including wild `p`, where `frobeniusSum` is `Classical.epsilon` of a predicate with no witness (the gamma form need not be rational), so the traces are unspecified rationals and purity carries no integrality. The sibling `frobeniusTrace_integral` carries `(ht : t ≠ 0) (hp : D.IsGood t p)`; this one dropped them.

Repair: add `(ht : t ≠ 0) (hp : D.IsGood t p)` (with `0 < f` per R05 the proof route is Fatou's lemma on `∑_e a_{p^e} T^e`). `frobeniusPolynomial_of_isPure`, `abs_coeff_frobeniusPolynomial_le` and `local_functional_equation` need nothing more: they follow from the multiset `Λ` alone (table).

## R07 (P3) — `polyDiscriminant` duplicates Mathlib's `Polynomial.discr`

Location: `Suggested.lean` `polyDiscriminant` ("through Mathlib's `Polynomial.resultant` (which has no discriminant of its own)"), `determinantConstant`; `README.md` 5.8.

Witness: `Mathlib/RingTheory/Polynomial/Resultant/Basic.lean` line 935 at the pin: `noncomputable def discr (f : R[X]) : R := f.sylvesterDeriv.det * (-1) ^ (f.natDegree * (f.natDegree - 1) / 2)`, with `discr_of_degree_eq_two : discr f = coeff 1 ^ 2 − 4 coeff 0 coeff 2`; for monic `f` this is the file's `(−1)^{d(d−1)/2} · resultant f (derivative f)`.

Repair: delete `polyDiscriminant`, write `determinantConstant` with `Polynomial.discr (cyclotomic v ℤ)`, and list `Polynomial.discr` under *From Mathlib*.

## R08 (P3) — Qian's Lemma 3.4 is not the field form of Levelt's theorem

Location: `README.md` 3.4 ("the field form is Qian Lemma 3.4") and *References* ("Lemma 3.4 (Levelt's theorem over an arbitrary field with disjoint spectra over its algebraic closure, …), the source of 3.4's field form").

Witness: `qian2021` lines 628–666: the lemma concerns one representation `ρ : π_1 → GL_n(ℤ[ζ_N])` with `γ_∞ ↦ A = C((X − 1)^n)`, `γ_0 ↦ B⁻¹`, `γ_1 ↦ BA⁻¹`, asserts equivalence with `ρ_{t'}` "as representation into `GL_n(ℂ)`", and its proof is "See Theorem 3.5 of [BH89]". It does exhibit the companion normal form `BA⁻¹` with a single nontrivial column (lines 656–666), which is what 3.4 (iv) uses.

Repair: cite Qian only for the normal form and the order `g_0 g_1 g_∞ = 1`; attribute the arbitrary-field statement to this roadmap's own generalisation of `beukersheckman1989` Theorem 3.5 (the README's proof sketch is field-independent), or to Levelt's thesis if its statement is checked.

## R09 (P3) — The archimedean shifts follow the LMFDB, not (12.2) as cited

Location: `README.md` *Pinned conventions*, "Archimedean shifts" ("the real shifts `μ` are `|σ|` copies of `0` if `σ > 0` and `|σ|` copies of `1` if `σ ≤ 0`. This is the LMFDB's `hodge.mu_nu` and Roberts–Rodriguez-Villegas (12.2)"); 5.7; `Suggested.lean` `archimedeanShifts`.

Witness: `rrv2022` lines 1238–1241: the real factors are `Γ_ℝ(s − w/2)^{h⁺} Γ_ℝ(s − w/2 + 1)^{h⁻}` with `h^± = (h^{w/2,w/2} ± (−1)^{w/2} σ)/2`, so `h⁺ − h⁻ = (−1)^{w/2} σ`; the LMFDB's `hodge.py` `mu_nu` (read at its repository) takes `h⁺ − h⁻ = σ` with no `(−1)^{w/2}`. The two agree only for `w ≡ 0 (mod 4)`. The definition itself is consistent (`card μ + 2 card ν = d` checked on `(1,1)`, `σ = 0` and `(1,2,3,2,1)`, `σ ∈ {±1, ±3}`).

Repair: say which `σ` the parameter is (the LMFDB's `sig`), and record that Roberts–Rodriguez-Villegas' `σ` is `(−1)^{w/2}` times it.

## R10 (P3) — The gate's build check fails on Lake's `module` warning

Location: gate report, build (1): "imports `Mathlib` from package `mathlib`, which is designed for use with the module system; consider adding `module`".

Witness: `lake env lean TauCetiRoadmap/HypergeometricMotives/Suggested.lean` produces 133 `declaration uses 'sorry'` warnings and nothing else, exit 0; `lake build TauCetiRoadmap.HypergeometricMotives.Suggested` prints the Lake warning above. No `Suggested.lean` on main starts with `module`, so the warning is the toolchain's (v4.35.0-rc3), not this file's. A probe copy with `module` as its first line elaborates with only the `sorry` warnings.

Repair: add the line `module` at the top of `Suggested.lean` (verified to elaborate), or have the gate's rule exempt this warning. The brief's rule counts a build failure as blocking; I record it at P3 because it is a warning common to every roadmap at this toolchain.

## R11 (P3) — The README is not in the house shape

Location: `README.md` headings `## Prerequisites`, `## Pinned conventions`, `## What Mathlib supplies`, `## What Tau Ceti supplies`, `## What is missing (build here)`, `## Ordering`; every milestone ends with `*Prerequisites:*`; only 3.5 has a `**Checks.**` list; no layer has `### Examples` or `### Dependencies`.

Witness: the house shape (repository README, *Writing a roadmap*, and the merged `TauCetiRoadmap/ReductiveGroupsPartII/README.md`) is `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (`### From Mathlib`, `### From Tau Ceti`, `### From TauCetiRoadmap.<X>`), `## How to read the build`, layers with `### Examples` and `### Dependencies`, `*Needs:*` lines, and a `**Checks.**` list per definition. The dependency check reported `0 problem(s)` here; whether it parsed `*Prerequisites:*` lines as edges is not visible from its summary, so every supplier citation was resolved by hand (all resolve, see *Verified sound*). The ten backticked identifiers the worker flagged (`hgm.defining_parameters`, `hgm.levelt_matrices`, `hgm.zigzagplot`, `hodge.mu_nu`, `sage.modular.hypergeometric_motive`, …) are LMFDB knowl and Sage module ids, not Lean names.

Repair: rename and reorder the sections as above; convert `*Prerequisites:*` to `*Needs:*`; move each definition's "Acceptance:" values into a `**Checks.**` list with a non-example per definition (the *Boundary and off-hypothesis checks* section already has most of them); add `### Examples` and `### Dependencies` to each layer; write the LMFDB knowl ids without backticks or as quoted strings.

## R12 (P3) — Two relative links point at the wrong directory

Location: `README.md` *Prerequisites* and *Consumed*: `[Chebotarev roadmap](../Chebotarev/README.md)`, `[PolynomialGaloisGroups](../PolynomialGaloisGroups/README.md)`.

Witness: on main these roadmaps are `Completed/Chebotarev/README.md` and `Completed/PolynomialGaloisGroups/README.md` (the README's other completed links already use `../../Completed/…`); `TauCetiRoadmap/Chebotarev` and `TauCetiRoadmap/PolynomialGaloisGroups` do not exist.

Repair: `../../Completed/Chebotarev/README.md`, `../../Completed/PolynomialGaloisGroups/README.md`.

## R13 (P3) — `Suggested.lean` is an API catalogue, not the acceptance test

Location: `Suggested.lean`, 257 declarations; module docstring ("suggest Lean forms for the load-bearing milestones").

Witness (one-tactic probe on a scratch copy): `Z_one` closes by `simp [Z, (rep_mem_Ioc _).2, P.card_eq]`; `gaussSumPow_zero` by `simp [gaussSumPow, gaussSum_one_left hψ]`; `bezout_transpose` and `bezout_swap` by `ext i j; simp [bezout, …]`; `isGood_iff` by `simp [IsGood, IsTame, Option.isSome_iff_ne_none]; tauto`. Declarations that restate definitions or inherit fields: `swap_swap`, `degree_swap`, `toParameters_swap`, `monic_PhiA`, `monic_PhiB`, `monic_qInf`, `monic_qZero`, `natDegree_qInf`, `natDegree_qZero`, `coeff_zero_frobeniusPolynomial`, `newtonPolygonFn_zero`, `M_pos`, `gamma_swap`, `M_swap`, `type_swap`, `hodgeTwist_swap`. Declarations that compute small values or mirror README acceptance lines: `gammaMultiset_dworkDatum`, `hodgeVector_dworkDatum`, `frobeniusTrace_dworkDatum`, `frobeniusTrace_legendreDatum`, `frobeniusTrace_twistDatum`, `frobeniusPolynomial_dworkDatum`, `tameLocalDegree_tameDatum`. Boundary statements: `rep_mem_Ioc`, `rep_zero`, `Z_one`. Four non-vacuity constructors `legendreDatum`, `dworkDatum`, `tameDatum`, `twistDatum` and `legendreParameters` exist only to feed them.

Repair: delete them from `Suggested.lean` (the README keeps each as an API bullet or Check), and keep the headline theorems: `levelt_rigidity_field`, `levelt_irreducible_field`, `rank_companion_pow_sub_one`, `finite_hypergeometricGroup_iff`, `finite_hypergeometricGroup_iff_weight_eq_zero`, `isImprimitive_of_rotationNumber`, `det_bezout`, `card_bezoutModule`, `even_weight_iff`, `even_degree_of_odd_weight`, `hodgeNumber_symm`, `weight_eq_zero_iff_interlace`, `rotationNumber_eq_gcd`, `gamma_defining_identity`, `gamma_unique`, `pochhammer_identity`, `exists_unique_of_isGaloisStable`, `hypergeometricSum_galois`, `hypergeometricSumRat_spec`, `gammaVectorSum_eq_hypergeometricSum`, `frobeniusSum_spec`, `frobeniusSum_integral`, `frobeniusSum_swap`, `frobeniusSum_primitiveData`, `katzExpSum_eq`, `greeneF_eq_katzSum`, the 5.5 consequences, `tameConductorExponent_inf/zero`, `cubic_point_count`, `hypergeometricSum_degree_one`, Ono (R04), with only the definitions they need. The module docstring should take the form "<title>: target signatures" and name the headlines not statable (the Beukers–Heckman form and signature theorem of 3.5–3.6, which need the form).

## R14 (P3) — `weight_eq_sSup_sub_sInf` needs `0 < degree`

Location: `Suggested.lean` `weight_eq_sSup_sub_sInf : (P.weight : ℤ) = sSup (insert 0 …) − sInf (insert 0 …) − 1`.

Witness: for the empty pair the right side is `0 − 0 − 1 = −1` and the left side is `0`. With the repaired heights (R01) the identity holds for `d > 0` on all 2322 tested data.

Repair: add `(hd : 0 < P.degree)`.

## R15 (P3) — The Greene sign is already determined

Location: `README.md` 4.12 ("**Determine `c`** … In the disjoint cases tried … `c = −1`"); `Suggested.lean` `greeneF_eq_katzSum` (`∃ c, (c = 1 ∨ c = -1) ∧ …`).

Witness: expanding each of Greene's binomials through `jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum` (the products `A_0` and `A_i B̄_i` are nontrivial under the layer's disjointness, so no degenerate Jacobi sum occurs) gives `_{n+1}F_n = ω(−1)^{b_1 + ⋯ + b_n} q^{1−d} (∏_i g(a_i − b_i))⁻¹ S_q(a, b | x)` exactly, so `c = ω(−1)^{∑ b_j} = (−1)^{∑ b_j}` for odd `q`. Numerically: `q = 5, 7, 11`, `b = (0, 3)`: `c = −1`; `b = (0, 1)`: `c = −1`; `b = (0, 2)`: `c = +1` (at `x = 2` over `𝔽_5` both sides vanish, so `c` is undetermined there and the existential holds trivially). The README's "`c = −1`" is the odd-`b` case.

Repair: state `c = ω(−1)^{∑_j b_j}` in 4.12 and in the Lean theorem, and drop the existential (it also removes a theorem that any `c` satisfies whenever `S_q = 0`).

## Verified sound

**Gate and build.** `lake env lean` on `Suggested.lean`: 133 `sorry` warnings, no other diagnostic, exit 0; targeted `lake build`: success with the Lake `module` warning only (R10). Dependency check: `depcheck: 204 roadmaps, 1555 edges, 0 problem(s)`, no UPWARD or CYCLE line (but see R11 on `*Needs:*`). The 8 "dropped binder" leads of the worker's signature list are `[DecidableEq F]`/`[Fintype F]`/`[Field F]` instances that the types do not mention (`qm`, `gaussSumPow`, `cubicFamily`, …); none changes a statement. No file outside the roadmap folder is changed; `metadata.toml` has `topic = "math.NT"`.

**Pinned Mathlib declarations opened** (file:line in `Mathlib/`): `Data/Nat/Totient.lean:78 filter_coprime_Ico_eq_totient`; `Topology/Instances/AddCircle/Defs.lean:310 equivIoc`, `:617 addOrderOf_coe_rat`, `addOrderOf_div_of_gcd_eq_one`; `RingTheory/Polynomial/Cyclotomic/Basic.lean:316 natDegree_cyclotomic`, `:533 cyclotomic_coeff_zero (hn : 1 < n)`, `cyclotomic_eq_prod_X_pow_sub_one_pow_moebius`; `Cyclotomic/Eval.lean:41, :136 eval_one_cyclotomic_(not_)prime_pow`; `Cyclotomic/Expand.lean cyclotomic.isCoprime_rat`; `NumberTheory/Cyclotomic/PrimitiveRoots.lean:351 cyclotomic_eq_prod_X_sub_primitiveRoots`; `RingTheory/Polynomial/Resultant/Basic.lean:51 sylvester`, `:131 resultant`, `:402 resultant_eq_prod_roots_sub`, `:935 discr` (R07); `NumberTheory/MulChar/Lemmas.lean:173 exists_mulChar_orderOf_eq_card_units`; `NumberTheory/MulChar/Basic.lean:454 ringHomComp`; `NumberTheory/GaussSum.lean:83 gaussSum_mulShift_eq`, `:89 star_gaussSum_eq`, `:126 gaussSum_one_left`, `:188 gaussSum_mul_gaussSum_eq_card`, `:245 gaussSum_frob` (general, not only the quadratic one); `NumberTheory/JacobiSum/Basic.lean:56 jacobiSum_ringHomComp`, `:193 jacobiSum_eq_gaussSum_mul_gaussSum_div_gaussSum`; `NumberTheory/LegendreSymbol/AddCharacter.lean:60 IsPrimitive`, `:211 FiniteField.primitiveChar`; `LegendreSymbol/QuadraticChar/Basic.lean:119 quadraticChar`, `:213 quadraticChar_card_sqrts`; `RingTheory/Polynomial/Vieta.lean:101 Multiset.prod_X_sub_C_coeff`; `LinearAlgebra/FreeModule/PID.lean:532 Submodule.smithNormalForm`; `LinearAlgebra/Matrix/Charpoly/Minpoly.lean:73 charpoly_leftMulMatrix`; `FieldTheory/Finite/GaloisField.lean:69 GaloisField`, `:130 card (h : n ≠ 0)` (R05); `Algebra/Polynomial/Splits.lean:35 Splits`; `NumberTheory/Cyclotomic/Gal.lean autEquivPow`; `NumberField/Cyclotomic/Galois.lean galEquivZMod`; `Analysis/SpecialFunctions/OrdinaryHypergeometric.lean:71`. Absent at the pin, as the README says: `Polynomial.companion`, `kroneckerSym`.

**Pinned Tau Ceti declarations opened** (`TauCeti/`): `NumberTheory/Cyclotomic/Aut.lean card_aut_eq_totient`; `NumberTheory/DirichletCharacter/GaussSum.lean:106 gaussSumOfPrimitiveRoot`, `:130 map_gaussSumOfPrimitiveRoot`; `Geometry/Hodge/Dimension.lean:73 hodgeNumber`, `:88 hodgeNumber_symm`; `NumberTheory/ArithmeticDirichletSeries/EulerProduct/Data.lean:56 EulerProductData`; `AlgebraicGeometry/EllipticCurve/PointCount.lean pointCount`; `NumberTheory/Chebotarev/GaloisCharacter/Cyclotomic/Basic.lean`, `NumberTheory/NumberField/Cyclotomic/GaussSum.lean` exist; `FieldTheory/Quadratic.lean companionFinTwo`. Tau Ceti has no hypergeometric sum, Levelt matrix, Bézout matrix or zigzag (grep of the pin).

**Cross-roadmap citations resolved.** On main: `ClassicalArithmeticCompletion` 2.46 (line 4036, `Polynomial.companion`, `leftMulMatrix_root_eq_companion`, `det_companion`, `minpoly_companion`, `hasEigenvalue_companion_iff`, orientation "subdiagonal ones, last column `−coeff`" as the README states), 2.60 (line 4474, `charpoly C(p) = p` over any commutative ring), 7.12 (line 14605, Stickelberger valuation `v_P(gaussSum) = s`, i.e. `s/(p−1)` with `v_p(p) = 1`), 7.29 (line 15058, Hasse–Davenport product, R03), 1.19, 1.36, 1.46, 1.53 (cubic and quartic Gauss and Jacobi sums); `LFunctions` Layer 0 (line 346: `AnalyticLFunctionData`, `ArithmeticLFunctionData`, weight-`w` normalization translation, gamma shifts, root number, polar divisor); `ThetaSeries` 2H (line 562: `kroneckerSym`, `kroneckerChar D : DirichletCharacter ℂ |D|` for `D ≡ 0, 1 (mod 4)`, `D ≠ 0`); `ModularCurves` 4C (line 1100, Legendre problem over `ℤ[1/2]`). Under `Completed/`: `Chebotarev` Layer 4 (line 205, cyclotomic Galois characters), `HodgeStructures`, `NumberFieldArithmetic` (discriminant), `PolynomialGaloisGroups` (`Polynomial.Gal`, transitive-group labels). At open heads: `CharacterSumsOverFiniteFields` 3.3, 3.4, 6.4, 6.5 (R03 on 3.4); `EllipticLegendreCharacterInterfaces` 0.1 (`legendre`, coefficients `(0, −(1+λ), 0, λ, 0)`) and 5.1 (`pointCount = q + 1 + ∑ quadraticChar(f(x))`); `DeligneWeightsAndPurity` 0.1 (Weil `q`-numbers of integer weight); `MotivesAndAlgebraicCycles` Layers 1–2; `FiniteGroupInvariants` exists (named only in *Not owned here*). Ownership: `roadmaps grep` for finite hypergeometric sums, Levelt, Bézout matrices, Greene and Beukers across the 439 open pull requests and main finds no other owner (`HabiroNumberFields` 1.2 "cyclic hypergeometric sum" is a different object; `CharacterSumsOverFiniteFields` names this roadmap as its consumer). Ownership against open pull requests whose files this brief does not give was not checked beyond that grep.

**Sources read at the locator.** `bcm2015`: Definition 1.1 (line 76–86, `(1/(1−q)) ∑_{m=0}^{q−2} ∏ g(m+α_i𝔮)g(−m−β_i𝔮)/(g(α_i𝔮)g(−β_i𝔮)) ω((−1)^d t)^m`), Theorem 1.2 (104–108), Theorem 1.3 (131–143, `(−1)^{r+s}/(1−q) ∑ q^{−s(0)+s(m)} g(pm, −qm) ω(εM⁻¹t)^m`, `ε = (−1)^{∑ q_i}`), Assumption 1.4 (145), Corollary 1.7 (185–188, `q` prime to `6`, `|E_λ| = q+1−H_q(1/3,2/3;1,1|27λ)`), Theorem 2.5 (319–324), Proposition 2.6 (332–342), Lemma 2.7 (344–350), Proposition 3.1 (386–388, `Hyp_q = ω(−1)^{|β|𝔮} S_q`, `t ∈ 𝔽_q^×`), Theorem 3.3 (435–440), Theorem 3.4 (470–478), Theorem 3.5 (488–489), Theorem 4.2 (573–578). `rrv2022`: §2 (262–310, Magma's `HypergeometricData([1,1],[2,2])` is Legendre, "Magma conventions are reversed"), §5 Figure 5.1 (652–666), §9 (990–993, `t = 1` drops the two central Hodge numbers), §10 (1060–1068 wild/tame/good exactly as the README; (10.1) at 1084), §11 ((11.1) at 1117: `exp(∑ c_{p,e} x^e/e) = 1/F_p`; Poincaré duality `a_{p,e} = ε(p) a_{p,n−e} p^{(n−2e)w/2}`, "always 1 when `w` is odd", 1121–1124), §12 ((12.1), (12.2) at 1231–1246, R09), §13 (1331–1340: `c_p = 1` at `τ = 1` except orthogonal with `ord_p(t−1)` even where `c_p = 0`; (13.1) `c_p = rank(h_τ^{|k|} − I)`, `τ = ∞` for `k < 0`, `τ = 0` for `k > 0`; (13.2) at 1400 conjectural). `qian2021` Lemma 3.4 (628–666, R08). `negami2026` 7.2.1: Theorem 7.2 ([BH, Thm 4.5, Cor 4.7]: `|p − q| = |∑_j (−1)^{j+m_j}|`, `m_j = #{k : β_k < α_j}`, reps in `[0,1)`, definite iff interlace, repetitions allowed by the formula) and Theorem 7.3 ([BH, Thm 4.8]: finite iff every `(Δα, Δβ)`, `Δ` prime to the denominator, interlaces) (862–872). `greene1987`: Definition 2.4 (122–123), Definition 3.10 (208–210), Theorem 3.6 (189), Theorem 3.13 (219). `fedorov2018` Theorem 1 (152–153). `ono1998` Theorem 1 (341). Sage `hypergeometric_motive.py` (read at its repository): `cyclotomic=(A, B)` gives `alpha` from the first list; `sign(t, p)`: for `0 ∈ alpha` recurse on the swap at `1/t`, odd `d` gives `−kronecker((1−t)·param)`, even `d` gives `kronecker(t(t−1)·param)`, `param = ∏ disc Φ_v` over `B` when `(d odd) ≠ (0 ∈ alpha)` else over `A`: exactly the README's recipe with `ε_p = (−1)^d χ_Disc(p)`; `padic_H_value`'s `D = −min zigzag` with `flip_beta`; `hodge_numbers` sorts `alpha + beta` in `[0,1)`.

**Adversarial table.** Values computed in exact rational or complex arithmetic over prime fields with Mathlib's conventions (`ω(0) = 0`, `g(0) = −1`), the gamma vector by Möbius inversion, the zigzag by the README's sorted-list procedure.

| Statement | Instances | Values computed | Result | Change |
|---|---|---|---|---|
| 1.2/1.4 `gamma`, `M` | `A2.2.2.2_B1.1.1.1`; `A30_B5.3.2.1`; `A2.2_B4`; `A4_B2.1` | `γ = [−1^8, 2^4]`, `M = 256`; `[−15,−10,−6,1,30]`, `M = 1007769600000`; `[−4,−1,−1,2,2,2]`, `M = 1/4`; `[−2,−2,4]` | as README | none |
| 1.4 `gammaMultiset_sum`, `zero_notMem` | all 2322 data (entries `≤ 10`, `d ≤ 6`) | sum `0`, no `0` entry | holds | none |
| 1.4 `pochhammer_identity` | the three data above, `n = 1, 2` | both sides equal (e.g. `1/16 = 2^4/256`) | holds | none |
| 1.6 `isWild_iff_exists_gamma` | largest element `a*` divisible by `p` | `γ(a*) = mult_A(a*) − mult_B(a*) ≠ 0` | holds | none |
| 1.8 `rotationNumber_eq_gcd` | all 2322 data; `A4_B2.1` | stabiliser order = gcd of `γ`; `2 = gcd(2,2,4)`; empty datum: `Nat.card` of an infinite type `0 = gcd ∅` | holds | none |
| 1.11 `cuspAt`, `isGood_swap_inv` | `t = 0`, `t = 1`, `t = −3` at `p = 3` | `padicValRat p 0 = 0` gives no cusp; `v_3(−3) = 1` cusp `zero`; `1/t` exchanges `zero`/`inf` | holds | none |
| 2.1–2.2 `recordedHeights` (Lean/README formula) | `A2.2_B1.1`, `A2.2.2.2_B1.1.1.1`, `A2.2_B4`, `A4.2.2_B3.1.1`, `A6.4.4.3_B12.2.2.2.1` | `{1,1}`, `{3^4}`, `{0,0}`, `{0,1,1,1}`, `{−2,−1,0,0,0,1,1,1}` vs procedure `{0,1}`, `{0,1,2,3}`, `{−1,0}`, `{0,0,1,1}`, `{−2,−1,−1,0,0,1,1,2}` | **false** | R01 |
| 2.2 Hodge vectors (procedure) | `A10.6.3.2_B14.1.1.1`, `A18.12_B8.3.2.1.1.1`, `A30_B5.3.2.1`, `A1_B2`, `A4_B2.1` | `(1,2,3,2,1)` `w=4`; `(2,6,2)` `w=2`; `(8)`; `(1)`; `(2)` | as README | none |
| 2.3 `weight_eq_sSup_sub_sInf` | all 2322 data; empty pair | `max Z∪{0} − min − 1 = w` on all; empty: `−1 ≠ 0` | holds for `d>0`, fails at `d=0` | R14 |
| 2.4 `hodgeNumber_symm` | all 2322 data | every Hodge vector a palindrome | holds | none |
| 2.5 `even_weight_iff`, `two_mul_hodgeTwist` | all 2322 data | `w` even ⟺ `m_A+m_B` odd; `w+1−m_A−m_B` even and `≥ 0` | holds (procedure); false for Lean's `weight` on `legendreDatum` | R01 |
| 2.5 `hodgeTwist_eq_neg_minHeight`, `δ ≥ 0` | all data with `1 ∉ A`; `A2.2_B4` | `δ = −m`; `δ = 1 = −(−1)` | holds | none |
| 2.6 `even_degree_of_odd_weight` | all 2322 data | odd `w` ⇒ even `d` | holds | none |
| 2.7 `hodgeVector_swap` | all 2322 data | `hv(B,A) = hv(A,B)`, `w` equal | holds | none |
| 2.8 `weight_eq_zero_iff_interlace` | `A30_B5.3.2.1`, `A3_B2.1`, `A2.2_B1.1` | `w=0` and `Z ∈ {0,1}`; `w=0`, interlacing; `w=1`, `Z(1/2) = 2` | holds (procedure); false for Lean's `weight` | R01 |
| 3.1 `rank_companion_pow_sub_one` | `Φ_B = Φ_3Φ_1²`, `k = 1, 3`; `Φ_A = Φ_4Φ_2²`, `k = 1,2,4` | ranks `3, 1`; `4, 3, 1` = `d − #{ζ : ζ^k = 1}` | holds | none |
| 3.1 counterexamples in docstring | `𝔽_2`, `C(X²+1)`, `k=2`; `k = 0` | `C² = 1`, rank `0 ≠ 1`; left side `0` | needed hypotheses confirmed | none |
| 3.2 `hInf_mul_hOne_mul_hZero`, `det_hOne` | `α = {1/2}`, `β = {0}` | `h_∞ = (−1)`, `h_0 = (1)`, `h_1 = (−1)`, `det h_1 = e(0 − 1/2) = −1` | holds | none |
| 3.3 `det_hInfInt`, `det_hZeroInt` | Dwork datum | `det C((X+1)^4) = (−1)^4·1 = 1 = (−1)^{4+0}`; `det C((X−1)^4)^{−1} = 1 = (−1)^{4+4}` | holds | none |
| 3.4 (i) companion normal form | `C(p)⁻¹C(q)` | differs from `1` by `C(p)⁻¹(C(q)−C(p))`, rank `1` iff `p ≠ q` | holds | none |
| 3.4 (iv) `companion_mul_inv_normalForm` | `d = 0`, `d = 1`, general | `p = q = 1` vacuous; `C(q)C(p)⁻¹ e_j = e_j` for `1 ≤ j ≤ d−1` | holds | R08 (citation only) |
| 3.6 `bhSignatureDefect` | `A2.2_B1.1`; Dwork; `A30_B5.3.2.1`; `A3_B2.1`; `A1_B2`; `A2.2_B4` | `0`; `0`; `8 = d`; `2 = d`; `1 = d`; `0` | definite exactly for `w = 0` | none |
| 3.7 `finite_hypergeometricGroup_iff` | `A1_B2` (`Γ = {±1}`) | interlacing for all odd `u` | holds | none |
| 3.8 `det_bezout` | `A6.4.4.4.3_B10.2.2.2.2.2.2`, `d = 10`; Legendre `d = 2`; `f = X²`, `g = X²+1` | `det = −191102976 = (−1)^{45}·191102976 = (−1)^{45} Res`; `−16 = (−1)^1·16`; `−1 = (−1)·1` | holds | none |
| 3.9 `isImprimitive_of_rotationNumber` | `A4_B2.1` (`ρ = 2`) | `q_∞, q_0 ∈ ℂ[X²]`, blocks `span{e_0}`, `span{e_1}` swapped | holds | none |
| 4.3 `hypergeometricSum` = Def 1.1 | `A2.2_B1.1`, `q = 5, 7, 13`, `t = 2, 1/2, −1` | `H_5(2) = −2`, `H_5(1/2) = 2`, `H_13(2) = 6`, `H_13(1/2) = −6`, `H_7 = 0` | as README/LMFDB acceptance | none |
| 4.3 `gaussSumPow_zero`, `_mul_gaussSumPow_neg` | `𝔽_5`, `m = 0`; `m = 2` | `g(0) = −1`; `g(2)g(−2) = ω²(−1)·5 = 5` | holds | none |
| 4.4 (i)–(iv) | derivation on each factor | `ψ ↦ ψ(c·)` scales `g(m)` by `ω(c)^{−m}`, exponents cancel; `ω ↦ ω^u` reindexes `m ↦ um`; conjugation gives `(−a, −b)` | holds | none |
| 4.6 `katzSum_shift` | `𝔽_5`, `a={0}`, `b={2}`, `μ=1`, `t = 2`; `t = 0` | `−2.236 = −2.236` (and `+2.236` with the printed `ω(t)^μ`); `0 ≠ −0.559` | **false at `t = 0`** | R02 |
| 4.6/4.10 `hypergeometricSum_swap`, `frobeniusSum_swap` | Dwork `q = 5`, `t = 2`; `A2.2_B4` `q = 3`, `t = 2`; `A4_B2.1` `q = 7`, `t = 3` | `H(A,B∣2) = 12 = H(B,A∣1/2)`; `−2/3 = −2/3`; `0 = 0` | holds | none |
| 4.7 `gammaVectorSum` vs Def 1.1 | Dwork `q = 5, 7, 13`, three `t`; Legendre `q = 5, 7, 13`; `A1_B2` `q = 5, 7, 11` all `t` | equal in every case (e.g. `−4, 12, −12`; `0, −16, −16`; `−84, −4, 4`) | holds | none |
| 4.7 `commonRootMultiplicity_zero` | `A1_B2`: `r = 2`, `s = 1` | `D(X) = X − 1`, `s(0) = 1 = min(2,1)` | holds | none |
| 4.8 Landau `λ = δ` | all 2322 data; `A2.2_B4` | equal on all; `λ = 1` | holds | none |
| 4.9 `frobeniusSum_integral` | `A2.2_B4`: `q = 3, 11, 7, 5`, `t = 2` | `H = −2/3, −6/11, 0, 0`; `3·(−2/3) = −2`, `11·(−6/11) = −6` | holds with `δ = 1`; false with Lean's `hodgeTwist = 0` | R01 |
| 4.11 `frobeniusSum_primitiveData` | `A4_B2.1` (`ρ=2`) `q = 5, 7, 13`; `A9_B3.3.1.1` (`ρ=3`) `q = 5, 7, 19`, all `t ≠ 0` | equal in every case, including `q = 5` where `3 ∤ q − 1` | holds without `ρ ∣ q−1` | none (README's hypothesis is stronger than needed) |
| 4.12 `hypergeometricSum_degree_one` | `q = 5, 7, 11`, all `t ≠ 0` | `H_q(0; 1/2 | t) = φ(t(t−1))` | holds | none |
| 4.12 `greeneF_eq_katzSum` | `q = 5, 7, 11`, `b_1 ∈ {1, 2, 3}`, `x ∈ {2, 3}` | `c = (−1)^{b_1}`; with `q^{−d}` instead `c = −q^{±1}·…` | holds; `c` determined | R15 |
| 5.1 `frobeniusTrace` | Dwork `t = −1`, `p = 5, 7`; Legendre `t = 2, 1/2`; `A2.2_B4` `t = 2`, `p = 3` | `−4`, `0`; `−2`, `2`; `3·(−2/3) = −2` | as README | none |
| 5.1 `frobeniusTrace_integral` at `f = 0` | `A2.2_B4`, `t = 2`, `p = 3` | `GaloisField 3 0 = ZMod 3`; value `−2/3` | **false** | R05 |
| 5.2 `frobeniusPolynomial_dworkDatum` | `p = 5` | `coeff 1 = −a_5 = 4` ✓; `coeff 2 = (a_5² − a_25)/2 = −130` needs `a_25 = 276` (not recomputed) | first coefficient verified | none |
| 5.5 `frobeniusPolynomial_of_isPure` | `Λ` of size `d`, `|λ| = p^{w/2}` | `exp(−∑∑ λ^e T^e/e) = ∏(1−λT)`, degree `d` since `λ ≠ 0` | holds | none |
| 5.5 `local_functional_equation` | general; `Λ = {√p, −√p}` | `p^{wd/2}T^d F(1/(p^wT)) = ((−1)^d∏λ/p^{wd/2}) F(T)`; `F = 1 − pT²`, `ε = −1` | holds; proviso of `local_sign_eq_one_of_odd_weight` needed | none |
| 5.5 `frobeniusPolynomial_int_of_isPure` | wild `p` | `frobeniusSum` is an unconstrained `Classical.epsilon` value | unprovable as stated | R06 |
| 5.7 `archimedeanShifts`, `card_archimedeanShifts` | `(1,1)`, `σ = 0`; `(1,2,3,2,1)`, `σ = ±1, ±3` | `ν = {1/2}`, `μ = ∅`: `0 + 2 = 2`; `ν = {2, 1, 1, 0^{(3−|σ|)/2}}`, `μ = |σ|` copies: `|σ| + 2(3 + (3−|σ|)/2) = 9` | holds; sign convention vs (12.2) | R09 |
| 5.8 `determinantDiscriminant_ramification` | `1 ∉ A` (`m_B` odd), `1 ∈ A` (`m_A` odd, `m_B = 0`) | `(Odd d ↔ 1∉A) ↔ Odd(d+m_A)` and `↔ Even(d+m_B)` both reduce to `Odd d` resp. `Even d` | holds | none |
| 5.8 recipe vs Sage `sign` | `A4_B2.1`, `t = −8` | `d` even, `1 ∉ A`: `Π_A t(t−1) = −4·72 = −288`, `(−2/5) = −1`; Sage: `kronecker(t(t−1)Π_A, 5) = −1 = (−1)^d ε_5` with `F_5 = 1 − T²` | consistent | none |
| 5.9 `tameConductorExponent` | `A4.2.2_B3.1.1`, `p = 7`, `t = 7³, 7, 7⁻⁴, 7⁻², 7⁻¹` | `c = 1, 3, 1, 3, 4` from matrix ranks; opposite cusp reading gives `4` at `t = 7`, `3` at `t = 1/7` | as README | none |
| 5.9 Legendre at `p = 3`, `t = −3` | cusp `zero` | `rank(C((X−1)²)⁻¹ − 1) = 1`; via `h_∞`: `2` | as README | none |
| 6.1 Ono | `q = 5`: `λ = 2, 3, 4`; `q = 7`; `q = 13` | counts `8, 4, 8`; `8, 8, 8`; `8, 20, 8` all equal `q+1−(−1)^{(q−1)/2}H_q` | holds; statable | R04 |
| 6.2 `cubic_point_count` | change of variables | `y² + xy + y = λx³` ↦ `Y² + XY + λY = X³` under `(λx, λy)` for `λ ≠ 0` | model correct; hypotheses `q` prime to `6`, `λ ≠ 0`, `27λ ≠ 1`, `3 ∣ q−1` carried | none |

**Checks of the README's Checks.** The 3.5 Checks agree with the 3.6 values above (`|p−q| = 0` for `A2.2_B1.1` and the Dwork datum, definite for `A30_B5.3.2.1`); the *Boundary* checks (`A2.2_B2.1`, `A3_B1` rejected; `A4` at `q = 7` not admissible; `t = 1` no tame prime; the rank-one datum) all hold as computed.

## Not verifiable

- `beukersheckman1989` (Invent. Math. 95): the DOI resolves to a paywalled Springer page; the GDZ volume `PPN356556735_0095` landing page was fetched but exposes no article text through the service. Theorem 4.3 (3.5, existence and uniqueness of the invariant Hermitian form and the explicit construction "in the cyclic basis") and Theorem 5.8 (3.9, the converse) are checked only for internal consistency; Theorems 3.5, 4.5, 4.7, 4.8 were checked through the restatements in `qian2021` and `negami2026` named above.
- Katz, *Exponential sums and differential equations* (8.2.1, 8.2.7, §5.6) and *Rigid local systems*; Levelt's thesis; Jouve–Rodriguez Villegas; Corti–Golyshev; Watkins's Magma package: books and texts not in open repositories; cited by locator only.
- LMFDB data (`A2.2_B1.1_t2.1`, `A2.2_B4_t2.1`, `A2.2_B1.1_t-3.1`, `A4_B2.1_t-8.1`, the counts 541, 231, 438, 53, 24, 131, 612, 1593, 5192): the LMFDB pages and API returned no content to the fetcher. The mathematical values behind them (`H_5 = −2`, `H_3 = −2/3`, `c_3 = 1`, `Disc = −288`, `(−2/5) = −1`) were recomputed and agree; what the LMFDB stores was not read.
- `frobeniusPolynomial_dworkDatum`'s coefficients beyond the first (`a_25 = 276`, `a_125`, `a_625`) were not recomputed (non-prime fields).

## Source issues

- **Misprint** in bcm2015 at Theorem 3.4, printed p. 11 (line 472): the source writes the character factor as `ω(t)^{μ𝔮}`; it should be `ω((−1)^d t)^{μ𝔮}`, as reindexing `m ↦ m − μ𝔮` in its own definition of `S_q` shows and as the instance `q = 5`, `α = (0)`, `β = (1/2)`, `μ = 1/4`, `t = 2` confirms; affects a stated result.
- **Misprint** in bcm2015 at Theorem 4.2, printed p. 12 (line 574–577): the minimum is taken over `x ∈ [0, 1]`, where the sum vanishes at `x = 0` and the stated `λ ≥ 1` fails; it should be over `x ∈ (0, 1)`; affects a stated result.
- **Error** in bcm2015 at the remark after Definition 1.1, printed p. 2 (lines 89–95): Greene's `_{n+1}F_n` is said to equal `ω(−1)^{|β|𝔮} q^{−d} ∏ g(α_i𝔮) g(−β_i𝔮)/g(α_i𝔮 − β_i𝔮) · H_q`; from Greene's Definitions 2.4 and 3.10 it equals `−ω(−1)^{|β|𝔮} q^{1−d} ∏(…) H_q` (power `q^{1−d}` and the opposite sign), as the instances `q = 5, 7, 11`, `n = 1` show; affects nothing (a remark; the roadmap's 4.12 uses `q^{1−d}`).
