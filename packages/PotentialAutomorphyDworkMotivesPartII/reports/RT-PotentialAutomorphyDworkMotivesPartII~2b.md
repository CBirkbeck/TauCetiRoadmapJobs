<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13001#issuecomment-6862641137 -->
Red team round 2 pass b (claude) of b48ff77

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P2) a result called "not at the pin" is at the pin; pinned symplectic and unitary declarations are planned again

   Location: `README.md:76` "Quasiprimitivity of that action and the identification of its kernel with
   `{±1}` are not at the pin and are part of §0.9(3) here"; `README.md:314` (§0.9(3)); `README.md:82`
   "which is why rank two is treated separately there".

   Claim: the pinned Tau Ceti lacks the kernel of the action of `Sp_{2m}(K)` on projective points, and
   has no matrix model of `B₂(q)`; so §0.9(3) plans the kernel, and all of rank two.

   Witness (pin `2fd255d`): `TauCeti.GLSymplecticFin.ker_projective_toPermHom`
   (Symplectic/Projective.lean:66), `TauCeti.GLSymplecticFin.mem_center_iff` (Symplectic/Center.lean:112),
   the `IsPretransitive` instance (Symplectic/Transitivity.lean:83),
   `TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup` (CFSG/BasicProperties/TypeB/Two.lean:124).

   Also at the pin and uncited: `Matrix.unitaryTransvection`
   (TauCeti/LinearAlgebra/Matrix/UnitaryTransvection.lean:71) and
   `TauCeti.ValidLieTypeIndex.unitaryTransvectionHom` (TauCeti/GroupTheory/SpecificGroups/CFSG/UnitaryTransvection.lean:154),
   the unitary transvections `x ↦ x + a B(v, x) v` that §0.9(2) defines again; that file says generation
   by them is not proved, which agrees with §0.9(2) owning it.

   Repair.

   1. `README.md:76`, replace the last sentence of the symplectic bullet by: "The kernel of that action
      is the centre (`TauCeti.GLSymplecticFin.ker_projective_toPermHom`,
      TauCeti/LinearAlgebra/Matrix/GeneralLinearGroup/Symplectic/Projective.lean), the centre in positive
      rank is the group of scalars of square one (`TauCeti.GLSymplecticFin.mem_center_iff`,
      Symplectic/Center.lean), and the action is transitive (the `MulAction.IsPretransitive` instance of
      Symplectic/Transitivity.lean). Primitivity of the action is not at the pin; it is the part of
      §0.9(3) stated here."
   2. `README.md:77`, add to the matrix-models bullet: "`TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup`
      (CFSG/BasicProperties/TypeB/Two.lean) identifies the candidate group of a valid `B₂(q)` (`q ≥ 4`)
      with `Sp₄(𝔽_q)` modulo its centre." Add a bullet: "Unitary transvections: `Matrix.unitaryTransvection`
      (TauCeti/LinearAlgebra/Matrix/UnitaryTransvection.lean) and
      `TauCeti.ValidLieTypeIndex.unitaryTransvectionHom`
      (TauCeti/GroupTheory/SpecificGroups/CFSG/UnitaryTransvection.lean), with their conjugation law;
      generation of `SU_n` by them is not at the pin and is §0.9(2)."
   3. `README.md:82`, replace "the list names `C₂(q)` as `B₂(q)` in a spin model and omits `B₂(3)`, which
      is why rank two is treated separately there" by "for `m = 2` and `q ≥ 5` the same import applies
      through `TauCeti.TypeB2LieIndex.projectiveSymplecticEquivGroup`; the list omits `B₂(3)`, so
      `PSp₄(𝔽₃)` is proved in §0.9(3)."
   4. `README.md:314`, in (3) replace "for `m = 2` this includes the quasiprimitivity of `Sp₄(k)` on the
      points of `ℙ³(k)` and the identification of the kernel of that action with `{±1}`" by "for `m = 2`
      and `q = 3` this includes the primitivity of `Sp₄(𝔽₃)` on the points of `ℙ³(𝔽₃)`; transitivity, the
      kernel of the action and the centre are the pinned Tau Ceti statements". Adjust the proof sketch
      and the Needs line of §0.9 (`README.md:316`, `318`) and the scope bullet `README.md:23` to name the
      four declarations.

   Tested on the refuting instance: `k = 𝔽₃`, `m = 2`: `mem_center_iff` gives scalars `c` with `c² = 1`,
   that is `±1`, and `ker_projective_toPermHom` gives the kernel; `B₂(3)` is not a valid index, so only
   this case remains to prove; `q = 5`: `B₂(5)` is valid and the import applies.

2. **F02** (P2) §9.4: the field `F′` is not required to contain `F(ζ_N)⁺`, and the avoidance field `L` has no role

   Location: `README.md:1530` "for an auxiliary finite Galois avoidance field `L/K` … Moret-Bailly gives
   a totally real `F′/F₀`, Galois, linearly disjoint from `F^avoid` over `F`, and `tᵢ ∈ T₀(F′)` with
   `V_{nᵢ}[λᵢ](…)_{tᵢ} ≅ r̄ᵢ|_{G_{F′}}`".

   Claim: the fibres at `tᵢ ∈ T₀(F′)` are `G_{F′}`-modules over `ℤ[ζ_N]⁺/λᵢ` for every such `F′`.

   Witness: `F = F₀ = F′ = ℚ`, `N = 5`, `l = 11`: the sheaf lives over `ℤ[1/10, ζ₅]⁺`; `G_ℚ` exchanges
   the two primes above `11`, so a `ℚ`-point has no fibre over `k(λ)`. BLGGT14 line 1971 takes
   `F′/F(ζ_N)⁺`.

   Repair: replace the quoted clause by "Moret-Bailly gives a totally real field `F′ ⊇ K`, Galois over
   `F₀` and linearly disjoint from `L` over `K`, and `tᵢ ∈ T₀(F′)` with …"; and add after the statement:
   "Taking `L ⊇ F^avoid K` makes `F′` linearly disjoint from `F^avoid` over `F`, because
   `K ∩ F^avoid = F`: no prime dividing `N` ramifies in `F^avoid`, so `ℚ(ζ_N)` and `F^avoid` are
   linearly disjoint over `ℚ` (PotentialModularityAndCompatibleSystems §2.14 with `C = ℚ`, `B = F`,
   `A = F^avoid`, `D = ℚ(ζ_N)`)." Add PotentialModularityAndCompatibleSystems §2.14 to the Needs line
   (`README.md:1532`). On the instance: `F′ ⊇ ℚ(√5)`, so each prime above `11` is fixed by `G_{F′}` and
   the fibre is a `G_{F′}`-module over `𝔽₁₁`.

3. **F03** (P2) `gap:slopes-of-indecomposable-convergent-isocrystals` asks for two theorems, one of which nothing here consumes

   Location: `README.md:134` and the `needs` of the same slug in `design/plan.json`: "… (Drinfeld–Kedlaya,
   Theorem 1.1.5, arXiv v11 p. 3), together with the full faithfulness of restriction of convergent
   F-isocrystals from X to a dense open subset on which its proof rests (their Theorem 2.2.3, p. 6)".

   Claim: the roadmap needs both statements from the supplier.

   Witness: `README.md:1399` (§7.12) applies only Theorem 1.1.5 to the convergent `F`-isocrystals of the
   companions; Theorem 2.2.3 (DK17 line 296) enters only the supplier's own proof (DK17 line 124–126).
   The need is compound and not minimal.

   Repair: end the sentence, in the README and in `plan.json`, after "(Drinfeld–Kedlaya, Theorem 1.1.5,
   arXiv v11 p. 3)." and delete the clause beginning "together with". In `README.md:1399` keep the
   parenthesis on how the source proves it; it is a remark on the supplier's route, not a request.

4. **F04** (P3) locator: the proof of Drinfeld–Kedlaya's Theorem 1.3.3 ends on p. 13

   Location: `README.md:1395` "Theorem 1.3.3, pp. 4–5, proof in §5, pp. 11–12, arXiv v11".

   Witness: §5 starts at DK17 line 540 (p. 11); the higher-dimensional case §5.3, which §7.12 uses
   ("in higher dimension they restrict to suitable curves (§5.3)"), ends at DK17 line 654, on p. 13
   (page marker at line 609).

   Repair: "proof in §5, pp. 11–13".

Round 2. Three P2 findings and one P3 finding are new (S01–S04). All twenty findings of round 1 are
repaired at this head. Every line of `packages/PotentialAutomorphyDworkMotivesPartII/README.md`
(1732 lines) and of `Suggested.lean` (257 lines) was read. No Lean was run (the brief forbids it);
the elaborated signatures supplied with the job were compared instead.

## Round 1 findings at this head

| Id | Status | Witness at b48ff77 |
|---|---|---|
| 1a/F01 | repaired | `README.md:1079` "Repeating one prime … gives the diagonal image (§5.10), of index `#H` in `H × H`"; `README.md:1042` gives the `N = 5`, `λ | 11` product (recomputed below); `README.md:1064`, `1539` restrict to rank `≥ 4`. |
| 1a/F02 | repaired | `Suggested.lean:239` "When `R` is a domain and `ψ` is nontrivial, `g(0) = 1`; over a ring with nilpotents this can fail"; `README.md:69` cites `gaussSum_one_left` (pin: section variables carry `[IsDomain R']`, Mathlib/NumberTheory/GaussSum.lean:35). |
| 1a/F03 | repaired | `README.md:314` states (1)–(5) for `SL_n`, `SU_n`, `Sp_n`; the contract of CFSGBasicProperties is `README.md:80–82`. A new error in the same passage is S01. |
| 1a/F04 | repaired | `README.md:235` "`h∞ = diag(4, 5)`, `h₀ = diag(1/2, 1/3)` and `h₁ = h₀⁻¹h∞⁻¹ = diag(1/2, 3/5)`" (products `1`, `1`; rank of `h₁ − 1` is `2`). |
| 1a/F05 | repaired | `Suggested.lean:73`, `102`: `transvection_group_classification`, `transvection_group_classification_two`; named at `README.md:346`. |
| 1a/F06 | repaired | `README.md:1439` "Let `λ` be a finite place of `M` of residue characteristic `l ∤ N` (`l = 2` included) … `V = V^ℚ_{t,λ}`". |
| 1a/F07 | repaired | `README.md:1544` "`λ | l` a place of `M` with `λ ∤ N`, so that the integral sheaf `W_λ` of §3.6 is defined"; negative Check at `README.md:1553`. |
| 1a/F08 | repaired | `README.md:100` states `gap:griffiths-residue-hodge-filtration`; same slug, supplier and section in `design/plan.json`; `README.md:524` names it in §2.1. |
| 1a/F09, 1b/F02 | repaired | `README.md:827` "writing `c⁻¹ = ζ_N^θ`, this says `B + θ = B` … the translation fixes a point, so `θ = 0`"; `README.md:45` drops coprimality. Runs recomputed: Qian `n = 5`: `{1,2}`, `{−3}`, middle of length 2; the singleton is unique. |
| 1a/F10 | repaired | `README.md:1109` "it is a unit of `O_λ` (as `v ∤ l`), and by §5.9 its reduction modulo `λ` is the value `det V[λ](Frob_v) ∈ k(λ)^×`". |
| 1a/F11 | repaired | `README.md:892` "(`l = 2` included)"; the three Qian theorems of `Suggested.lean` carry no `hl`; `README.md:1485` records the dihedral obstruction for `n = 2`. Kantor's list checked (KANTOR79 line 250–265). |
| 1b/F01 | repaired | `README.md:134` states `gap:slopes-of-indecomposable-convergent-isocrystals`; in `plan.json`. Its wording is S03. |
| 1b/F03 | repaired | `README.md:1515` "for every place `v | l` of `F′` the representation `V_{λ,t}|_{G_{F′_v}}` is ordinary of weight `μ` with `μ_{σ,i} = M(a_σ)`"; `README.md:1530` likewise over `F′_v(ζ_N)`. |
| 1b/F04 | repaired | `README.md:148`: the clause on a model over `O_F[1/r]` is gone; `README.md:1655` gets good reduction from integral `j` and trivial `ℓ`-torsion. |
| 1b/F05 | repaired | `README.md:350` three-step route; KANTOR79 line 250–265 supports "generated by a conjugacy class of transvections" with `O_p(G) ≤ G′ ∩ Z(G)`. Steps recomputed (table below). |
| 1b/F06 | repaired | `README.md:1412` "ordinarity of `W^ℚ_{t,λ}` is a property of the reduction of `t` (§7.7), and it holds on a dense open set of reductions"; `README.md:911` own argument (compared with BLGHT11 line 1203–1208: no shared sentence). |
| 1b/F07 | repaired | `README.md:661` "`ρ_b` is the character of `μ_N` normalised by the orientation of §4.1 …"; Check `README.md:678`. |
| 1b/F08 | repaired | `README.md:41` sentence on HypergeometricMotives §5.0 (heading exists at its head). |
| 1b/F09 | repaired | `README.md:1069` "For the self-dual data the corresponding statement … is ModularityAndLanglandsExtensions §2.14 and is cited, not a target here". §2.14 read at its head: it lists "Prove geometric connectedness of this scheme"; it does not cite this roadmap, so there is no cycle. |

No repair introduced a false statement that I could find, except the library claim of S01, which
sits in the passage rewritten for 1a/F03.

## The adversarial pass: declarations of `Suggested.lean`

No section `variable` is used; every binder is in the declaration's own signature (compared with the
supplied elaborated signatures; none lost a binder).

| Declaration (layer) | Instances tried | Values computed | Result |
|---|---|---|---|
| `transvection_group_classification` (L0) | `G = ⊥`; `G = SL₃(𝔽₃)`; unitriangular in `GL₃(𝔽₃)`; `Sp` clause for odd `n`; `l = 3` | `⊥`: `hirr` fails (every subspace invariant, `n > 2`); `k = K`, `P = 1`; `e₁`-line invariant; `Jᵀ = −J`, `det J ≠ 0` forces `n` even; Kantor (T 6) has `n = 2` only | true as typed; equals §0.11(1) |
| `transvection_group_classification_two` (L0) | `SL₂(𝔽₃) ⊂ GL₂(𝔽₃)`; `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)`; `l = 5` | `Q₈ ⊂ SL₂(𝔽₃)` irreducible over `𝔽̄₃`; orders `120` vs `24`, `720`; in `SL₂(𝔽₉)` with `u = E₁₂(1)`, `v = E₂₁(i)`: `tr(uv) = 2 + i`, root of `X² − X − 1`, order `10` | disjunction needed and correct |
| `qianIndexSet` (L1) | `n = 3, 4, 5, 6` | `n = 3`: `{1,2,−3}`, sum `0`; `n = 4`: `{1,2,3,−6}`; top of middle block `(N+n−4)/2`, `(N+n−5)/2`; middle pairs sum to `N` | matches §1.4 and the displayed vectors |
| `selfDualIndexSet` (L1) | `N = 5, n = 2`; `N = 7, n = 4` | `{2,3}`; `{2,3,4,5}`, sum `14 ≡ 0` | matches |
| `ZeroShapedDatum`, `.indexSet` (L1) | `(0,0,0,0,1,2,4)`, `N = 7`; `a = 0`; `n = 0` | `B = {1,2,4}`; `B = ℤ/N − {0}`, `n = N − 1`; `B = ∅` | `#B = n`; `card_zero` forces `N ≥ n + 1`, so `N − n` does not truncate |
| `qian_hypergeometric_group_eq_SL` (L5) | `N = 401, n = 3, l = 5`; `l = 3`; `l = 2, N = 3689`; `l | N` | order of `5` is `25` (`5⁵ ≡ 318`, `5²⁵ ≡ 1`); `3²⁰⁰ ≡ −1` (so `hminus` fails); `2⁶⁰ ≡ 1954 (mod 3689)`, order of `2` mod `7` odd; no primitive root, vacuous | true; `det h₀ = ζ^{∑B} = 1`; (T 2), (T 3), (T 5), (T 7) excluded by `B ≠ −B`, `2B ≠ B`, `4B ≠ B` |
| `selfDual_hypergeometric_group_conj_Sp` (L5) | `l = 3, N = 7, m = 2`; `−1 ∉ ⟨l⟩` | `K = 𝔽_{3⁶}`, `k = 𝔽_{3³}`; then `𝔽_l(ζ + ζ⁻¹) = 𝔽_l(ζ)` (the other root of `X² − (ζ+ζ⁻¹)X + 1` is `ζ⁻¹`) | trace field is `k` in both cases; conjugacy over `k` by absolute irreducibility |
| `qian_hypergeometric_group_conj_SU` (L5) | `l ≡ −1 (mod N)`; `l = 2` | `k = 𝔽_{l²}`, `σ = x ↦ x^l`; `k ⊇ 𝔽₂(ζ_N)`, `N > 400`, so `SU₃(𝔽₄)` does not occur | true |
| `qian_two_prime_hypergeometric_group` (L5) | `(5, 3209)` for `N = 401`; `l₁ = l₂` | `3209 = 8·401 + 1` prime (trial division to `53`); excluded by `hne` | true; `max > 10` is not needed for `n ≥ 3` (unused strength, no finding) |
| `qianGauss` (L6) | `a = 0` over `ℂ`, over `𝔽₂[ε]` | `1`; `1 + ε` | docstring states the domain hypothesis |
| `zeroShaped_gauss_product` (L6) | general; `n = 0`; `a = 0` | multiset `⋃_b (ℤ/N − (b − B))` is symmetric (`#{b : b − c ∉ B} = #{b : b + c ∉ B}`), has `n(N − n)` nonzero elements, `g(c)g(−c) = q`; both sides `1`; `∏_{b≠0} g(b) = q^{(N−1)/2}` | true as typed; `IsDomain`, `IsPrimitive`, `orderOf χ = N`, `Odd N` all used |

## The adversarial pass: README targets (values recomputed in this round)

| Target | Instances | Values | Result |
|---|---|---|---|
| §0.5 order formula | `SU₂(𝔽₉)`, `SU₄(𝔽₄)`, `SU₃(𝔽₄)` | `3·8 = 24`; `64·3·9·15 = 25920`; `8·3·9 = 216` | agree |
| §0.9 Checks | `PSL₃(𝔽₃)`, `PSp₄(𝔽₃)` | `27·8·26 = 5616`; `81·8·80/2 = 25920` | agree |
| §0.10 | `PSL₂(𝔽₁₁)`; `3^r(3^{2r} − 1)/2` | `660`; `12, 360, 9828` | agree |
| §0.11(1) route | multiplicity and dimension of constituents; normaliser step for `Sp`, `SU` | `rank(x − 1) = m·rank(x_U − 1)` forces `m = 1`; multiplier of a transvection has order dividing `l`, prime to `#k^×` | steps valid for `n > 2` |
| §1.1 | `l = 3, s = 4, N = 35`; orders modulo `A`, `B` | `lcm(4, 6) = 12`, `3⁶ = 729 ≡ 29`; `2^{t−1}`, `2^t`; `−1 = l^j` would need `j ≡ 2^{t−1} (mod 2^t)` and `j ≡ 2^{t−2} (mod 2^{t−1})` | agree |
| §1.2 | singular points at `t = 1` | `X₁ = 1`, `Xᵢ ∈ μ_N`, `∏ = 1`: `N^{N−2}`; `N = 3`: `3` | agree |
| §1.4 Checks | `(1,1,2,2,4)`; `(0,0,0,1,3,5,5)`; Qian's vectors | `B = {0,2}`, sum `2`; `B = {1,3,5}`, sum `9 ≡ 2`; `A′` omits `3, −1, −2` and the middle block, `N − n − 1` entries | agree |
| §1.5 | `x ∈ {1, 3}` or `{1, −3}`; overlap count `N = 11, n = 8` | `4·α(N−x)/2 ≡ −x²`; `L = 3`, `d = 5`: `0`; `d = 1`: `2` | agree |
| §2.1 | Fermat cubic; `N = 5`; `𝔽₂₅` | `b = (1,1,1)`: pole `1`, `a = (2,2,2)`, `p = 1`; `(4⁵ − 4)/5 = 204`; `#X(𝔽₅) = 6`, `#X(𝔽₂₅) = 36` | agree with the Conventions witness |
| §2.5 | `e² = e` | `e = ½(1 + ς)(e_χ + e_{χ⁻¹})`, `ς` commutes with `e_χ + e_{χ⁻¹}` | agree |
| §3.5 | twists | `c(Ψ)ε^{1−n} = Ψ⁻¹ε^{2−N}` gives `ε^{n+1−N}`, weight `2(N − n − 1)` | agree |
| §4.5 | `C((X−1)³)`, triple | last column `(1, −3, 3)`; `B⁻¹·BA⁻¹·A = 1` | agree |
| §4.7 Check | `Φ₉`, `Φ₁₅` mod `3` | `(X − 1)⁶`; `Φ₅²` | agree |
| §5.4 Check | orders of `7`, `11` mod `401` | `7¹⁰⁰ ≡ −1`, `7⁴⁰ ≡ 72`; `11¹⁰⁰ ≡ −1`, `11⁴⁰ ≡ −29`: both `200` | agree |
| §5.5 Check | `7237` | `12·603 + 1`, prime (trial division to `83`) | agree |
| §5.6 | product of two elements of order `3` in `SL₂(𝔽₅) ⊂ SL₂(𝔽₉)` | traces `2 ± i`, both roots of `X² − X − 1`: order `10`, never `5` | agree |
| §5.10 Check | `X² + X − 1` mod `11` | roots `3, 7`; `9 ≠ 49 ≡ 5`; `1320² = 1742400` | agree |
| §6.1 Check | Fermat cubic over `𝔽₇` | `J = 2 + 3ω`, norm `7`, `J + J̄ = 1`; `9` points (counted directly) | agree |
| §6.2 | sketch identity; `q = 11`, `λ | 3` | `q^{n(N−1)/2 − n(n−1)/2} = q^{n(N−n)/2}`; `1331 ≡ 2` | agree |
| §6.3 Check | `N = 301` | orders of `5` and `3` are `42`; `3²¹ ≡ −1`; `4 ∤ 21` | agree |
| §6.4 Check | `N = 7`, `l = 43`, `v | 29`; zero-shaped at `29, 71, 113, 127, 197` | recomputed in `𝔽₄₃[Y]/(Y^q − 1)`: reductions `{4, 6, 7, 22, 29, 31}`; `29¹⁴ ≡ 6`, `29²⁸ ≡ 36`; zero-shaped values all cubes | agree |
| §6.7 | exponents | `n(N−n−2)/2 − n(n−1)/2 = n(N−2n−1)/2`; `197` for `(401, 3)` | agree |
| §7.2 | wrap count; two Checks | grades `1, 1, 2` and `2, 2, 3`; `M(a) = (N − n − 1)/2` for self-dual data by duality | agree |
| §7.9 | determinant | `(θ_τθ_{cτ})^{n(n−1)/2} = ε̄^{−n(n−1)/2}`; `ε̄³ = ε̄⁻³` only for `l − 1 | 6` | agree |
| §7.13 | slopes | `sᵢ ≤ n − i` and `∑ = n(n−1)/2` force equality | agree |
| §8.1 Check | jumps `0, 3` | `t_H = t_N = 3`; the stable line has `t_H = 0 < 1` | agree |
| §9.1 (e), §9.3 (iv) | tower lemma | `B ⊆ A` in each application (`M ⊆ F₀`, `F ⊆ G`) | agree |
| §9.4 | `F′ = ℚ`, `N = 5` | no fibre over `k(λ)` | **S02** |
| §9.8 | `m = 3`, `Q = 7` | `(1, 2, −3) ≡ (1, 2, 4)`; `(m−1)(m+2)/2 = 5 < 7` | agree |
| §9.12 | determinant, multiplier | `[m²n(n−1) + nm(m−1)]/2 = nm(nm−1)/2`; `−m(n−1) + 1 − m = 1 − nm` | agree |

## Dependency check

Output of the command of the brief: `depcheck: 239 roadmaps, 2171 edges, 0 problem(s)`. No UPWARD,
CYCLE or `moved:` line.

## Headline theorems and padding

Headlines of the README: the transvection classification (§0.11), the residual hypergeometric groups
(§§5.1–5.4), Qian's determinant formula (§6.2), Katz's comparison (§3.4), maximal unipotence (§4.6),
geometric residual monodromy and torsors (§§5.5–5.12), the local properties and compatible systems
(§§7.4–7.13, 8.1), and the switching theorems (§§9.3, 9.4, 9.10–9.12). The first three groups are
stated (seven theorems); the others are named in the module docstring with the missing carrier.
I found no statable headline that is absent and no padding: none of the seven theorems follows from
one tactic or one pinned lemma, and the five definitions are each used by a stated theorem.

## Verified sound

- Declarations read: 12 of 12 (7 theorems, 4 definitions, 1 structure). Single `import Mathlib`, no
  `set_option`, no `lemma`, no sorry'd data, 7 `sorry` in theorem bodies only.
- Targets read: all 84 numbered sections of Layers 0–9 (each with its Checks block), the conventions, the contracts, the examples.
- Checks tested by computation: the 41 rows of the two tables above, each with its values; none
  false, none vacuous. Every definition has at least three Checks.
- Locators verified against the cached texts: 34 (QIAN23: Lemmas 2.1, 2.3, 2.4, 3.1, 3.3, 3.4, 3.6,
  3.8–3.10, Propositions 3.2, 3.7, 4.2, Corollary 3.5, Theorem 1.4; BLGHT11: Lemmas 4.1, 4.3, 4.6,
  5.1–5.3, 6.1, Corollaries 4.4, 4.5, 4.7, 4.8, Propositions 4.2, 6.2, with printed page = page
  marker − 1; DK17: Theorems 1.1.5, 1.3.3, 2.2.3, §1.3.2; KANTOR79 Theorem II; BLGGT14 Theorem 3.1.2).
  One is wrong (S04).
- Sibling citations checked at the current heads: 94 section ids of 28 roadmaps, all present with
  the cited subject (ModularCurves §5C is kept valid by that roadmap's table "Layer 5C | Layer 5.3");
  eight cited declaration names found in the cited sections. ModularityAndLanglandsExtensions
  §§2.9–2.12 and 2.14 were read in full against the contract at `README.md:160`.
- Pinned declarations checked: 13 of Tau Ceti and 24 of Mathlib named in the README, all present in
  the named files; five more found by object (S01).
- Declared gaps: the seven slugs agree between `README.md` and `design/plan.json`, each with a named
  supplier and section that exists; none is already provided at the supplier's head (searched for the
  objects). One `needs` is compound (S03).
- Ownership: no other roadmap on main or at an open head states the transvection classification, the
  Dwork eigensheaves over the parameter line or the switching theorems; no `Suggested.lean` at an
  open head declares one of the twelve names.
- Policy: the pull request changes only the package folder; no process words, pull-request numbers
  or `set_option` in the README or the Lean file; every target has a locator.
- Wording: 9 passages compared with 5 sources (§1.1 with QIAN23 line 336–352; §5.1 with QIAN23 line
  682–712; §5.4 with QIAN23 line 738–756; §5.2 and §1.5(2) with BLGHT11 line 1182–1227; §7.12 with
  DK17 line 204–230; §0.11(3) and the docstring of `transvection_group_classification` with KANTOR79
  line 250–265; §9.4 with BLGGT14 line 1852–1975). No sentence is shared; the proof plans differ in
  route (§1.5(2), §5.2) or in statement (matrix form, `l = 2`).
- Arrangement: QIAN23 has the largest share, 55 of 195 locators. Its sections are 2 (preliminaries),
  3 (Dwork motives), 4 (proof); the ten layers do not map onto them, and the order of Layers
  1 → 2 → 4 → 5 is forced by the Needs lines (§2.3 needs §§1.2–1.4, §4.2 needs §2.6, §5.5 needs §4.7).
- Reuse: no table, figure or data set of a source is taken over.

Source independence: 9 passages compared with 5 sources, none shared; largest share QIAN23, 55 of 195 locators; contents compared with QIAN23: independent.

## Not verifiable

- ZS76, ARTIN55, LEWIS82, KM74, KIS99, KATZ90: settled as uncertified; the statements cited from
  them were not read. §0.11(1) no longer rests on ZS76 alone (KANTOR79 Theorem II was read).
- The orientation of §3.1 (that Katz's list at infinity is indexed by `B(a)` and not by `−B(a)`)
  against KATZ09 Theorem 5.3: the README's own Check shows only one orientation is consistent with
  §4.2; the sign in Katz's text was not traced.
- BER10 Théorème 3.2.1 and DICKSON01 §260: not re-read in this round (round 1 reported OCR limits).
- Published numbering of QIAN23 (Lemmas 3.7, 3.9–3.11, Proposition 3.8): the published version was
  not read; the arXiv v1 numbering was.
- Elaboration: not run in this pass. The types compared are those of the supplied signature file.
- ModularityAndLanglandsExtensions §2.10 is cited for residue characteristic two; its text says so,
  but its proof route was not checked.

## Source issues

- **Gap** in BLGHT11 at Lemma 4.6, proof, p. 32 (BLGHT11 line 1196–1198): the source says the transvection classification leaves only special linear, symplectic and unitary groups in every rank; it should exclude, in rank two and characteristic three, the binary icosahedral group separately; affects the proof.
- **Gap** in BLGHT11 at §4, definition of the cover `T_W`, p. 28: the source says the cover parametrises isomorphisms respecting the determinant identification; it should require compatibility with the symplectic structures; affects a stated result; corrected in print at BLGGT14, proof of Theorem 3.1.2, arXiv v4 pp. 43–44.
- **Gap** in QIAN23 at Lemma 3.6, proof, arXiv v1 p. 15 (QIAN23 line 691–693): the source says the odd-characteristic classification applies to every residue characteristic allowed by its main theorem; it should treat residue characteristic two by the classification for one class of transvections; affects the proof.

## For the human reviewers

- **Licence.** `sources.toml` records ZS76, ARTIN55, LEWIS82, KM74, KIS99, KATZ90 as uncertified; §3.2 and §3.3 (rank, purity, determinant and local monodromy of hypergeometric sheaves) rest on KATZ90 Chapter 8.
- **Licence.** BLGHT11, KATZ09, ACC23 and CEGS are read from author pages; the README cites author pagination for BLGHT11.
- **Scope.** QIAN21 and ACAMPO24 are arXiv preprints with no journal reference in the README (`README.md:1712`, `1732`); they are cited for §8.1 and one Check.
- **Scope.** `gap:cm-hecke-characters-with-prescribed-infinity-type` and `gap:ordinary-and-supersingular-curves-over-prime-fields` name suppliers that are finished or on main (GlobalNumberFields, EllipticCurves); whether those roadmaps take new targets is a maintainer decision.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b48ff77abe8c56ce859050f0b0884a6b34792e8f", "job": "RT-PotentialAutomorphyDworkMotivesPartII~2b", "model": "fable", "worker": "chris-x55"} -->
