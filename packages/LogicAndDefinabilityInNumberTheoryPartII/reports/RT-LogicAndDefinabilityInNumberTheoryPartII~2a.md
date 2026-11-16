<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13165#issuecomment-6906256401 -->
Red team round 2 pass a (claude) of 518eebf

Verdict: needs_changes

**For the human reviewers:** this review raises 4 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) the Kato complex on regular schemes of mixed characteristic has no owner (1.5(b), 1.3, 1.1)

   **Location.** `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:572` ("its coniveau spectral
   sequence for étale cohomology with supports has `E₁`-terms identified with the Galois cohomology of the
   residue fields by absolute purity and `E₁`-differentials equal, up to sign, to Kato's boundary maps"),
   with `README.md:581` ("MotivesAndAlgebraicCycles §0.5b (coniveau exact couple and residues)"); the same
   citation in the *Needs:* of 1.1 (`README.md:509`) and of 1.3 (`README.md:536`).

   **Claim.** MotivesAndAlgebraicCycles §0.5b supplies the coniveau exact couple, with residues, of
   `Spec O_{𝒳,x₀}` in 1.5(b) and of the schemes of 1.3.

   **Witness.** `k = ℚ(i)`, `𝒳 = ℙ¹` over `ℤ[i]`, `x₀ = (t, 3)`, `n = 2`: `O_{𝒳,x₀}` has residue field `𝔽₉`
   and fraction field of characteristic zero. §0.5b is stated "for … smooth `X` over its perfect ground
   field" (its README line 162; so described at QuadraticFormInvariantsPartII `README.md:390`). No
   roadmap states it for mixed characteristic (`roadmaps grep`).

   **Repair.** The number-field case of 1.5(b), and 1.3 over a henselian base of mixed characteristic
   (used by 1.5(a) and 3.1), need the statement on regular excellent schemes. This roadmap owns the Kato
   complexes, so state it here. Add after 1.1:

   > ### 1.1a The Kato complex of a regular excellent scheme
   >
   > Prove: let `X` be a regular excellent Noetherian scheme of finite dimension and `n` an integer
   > invertible on `X`. Filtering the étale cohomology of `X` by the codimension of the support
   > (localization sequences for pairs of closed subsets, and the colimit over closed subsets of
   > codimension at least `p`) gives an exact couple and a spectral sequence with
   > `E₁^{p,q} = ⊕_{x ∈ X^{(p)}} H_x^{p+q}(X, ℤ/n(j))` converging to `H^{p+q}(X, ℤ/n(j))`. Absolute purity
   > (LefschetzPencilsAndVanishingCycles §0.10), applied on the regular locus of the closure of `x`, which
   > is open because `X` is excellent, identifies `H_x^{p+q}(X, ℤ/n(j))` with `H^{q−p}(κ(x), ℤ/n(j − p))`.
   > Under this identification the component of `d₁` from `x ∈ X^{(p)}` to a point `y ∈ X^{(p+1)}` of the
   > closure of `x` is, up to a sign depending only on the degrees, the sum over the points `y′` above `y`
   > of the normalization of that closure of the residue of 1.1 at `y′` followed by corestriction from
   > `κ(y′)` to `κ(y)` (Jannsen–Saito–Sato, *Étale duality for constructible sheaves on arithmetic
   > schemes*, as used by Kerz–Saito, §1, pp. 8 and 10, where their complexes (1.6) and (1.9) are
   > identified with (0.2)). Consequently the residue maps of 1.1 form a complex on `X`.
   >
   > **Checks.**
   > - `X` the spectrum of a discrete valuation ring with fraction field `F` and `n` invertible: the
   >   complex is `H^{i+1}(F, ℤ/n(i)) → H^i(Fw, ℤ/n(i − 1))`, the residue of 1.1.
   > - `X = Spec ℤ[i][t]_{(t, 3)}`, `n = 2`, `α = {t, 3, b}` with `b` a unit: at `(t)` the residue is
   >   `{3, b}` in `H²(ℚ(i))`, with residue `b̄` at `3`; at `(3)` it is `{t̄, b̄}` in `H²(𝔽₉(t))`, with
   >   residue `b̄` at `t̄ = 0` up to sign; the sum in `H¹(𝔽₉, ℤ/2)` is `2b̄ = 0`.
   > - `n` must be invertible: at a point of residue characteristic dividing `n` absolute purity does not
   >   apply and the terms are Kato's logarithmic groups; no claim is made there.
   > - For `X` smooth over a perfect field the couple is that of MotivesAndAlgebraicCycles §0.5b.
   >
   > *Needs:* 1.1; LefschetzPencilsAndVanishingCycles §0.10; KTheoryFiniteLocalFields §3.0 (residues and
   > corestriction); MotivesAndAlgebraicCycles §0.5b (the case smooth over a perfect field).

   Then: in the *Needs:* of 1.5 replace "MotivesAndAlgebraicCycles §0.5b (coniveau exact couple and
   residues)" by "1.1a"; in 1.5(b) replace "its coniveau spectral sequence … Kato's boundary maps (Kerz–Saito,
   …)" by "by 1.1a its residue maps form a complex"; in the *Needs:* of 1.3 write "1.1a (the Kato complex
   over a henselian base of mixed characteristic); MotivesAndAlgebraicCycles §0.5b (over a finite field)"
   and add "LefschetzPencilsAndVanishingCycles §0.10" (Kerz–Saito use absolute purity there, kerz_saito
   line 464–467); add 1.1a to the Layer 1 Dependencies and to the ownership bullet for Layer 1. Fetch
   arXiv:0910.3759 through the sources service, record it under a new key, and cite the theorem that
   compares the differentials by its number. Alternatively declare a gap on MotivesAndAlgebraicCycles
   §0.5b with exactly this statement.

   Tested on the instance: `Spec ℤ[i][t]_{(t, 3)}` is regular, excellent and `2` is invertible on it, so
   1.1a applies where §0.5b does not, and the composite at `x₀` is zero as 1.5(b) needs.

2. **F02** (P3) 0.12(a): "`E_u` has bad reduction at `v`" has lost its input

   **Location.** `README.md:385` ("then `v` ramifies in `L_u`, so `L_u` is a field and `E_u` has bad
   reduction at `v`, hence is isogenous to none of those factors"), with the *Needs:* line `README.md:403`.

   **Claim.** The step follows from the inputs listed for 0.12.

   **Witness.** `GoodIsogeny` (§5.2) compares two isogenous varieties; it does not show that a twist is
   bad. EllipticCurves Layer 5 states `j`-invariance, the anti-equivariant point isomorphism and the
   nonsplit-to-split statement only. poonen_uniform line 428–429 asserts the step without proof. The
   round-1 repair removed the Néron–Ogg–Shafarevich citation.

   **Repair.** In 0.12(a), after "so `L_u` is a field", insert: "The curve `E` is defined over `κ` and has
   good reduction at `v`. For a prime `ℓ ≠ char K`, the point isomorphism of the twist (EllipticCurves
   Layer 5) gives `T_ℓ(E_u) ≅ T_ℓ(E) ⊗ χ`, `χ` the quadratic character of `L_u/L`; inertia at `v` acts
   trivially on `T_ℓ(E)` and through `χ`, which is nontrivial on it because `v` ramifies, so some inertia
   element acts by `−1 ≠ 1` on `T_ℓ(E_u)`. By the easy direction of NeronModelsAndSemistableAbelianVarieties
   §5.1 over the henselization of `O_v`, `E_u` has bad reduction at `v`." Add to the *Needs:* of 0.12 and
   to the Layer 0 Dependencies "NeronModelsAndSemistableAbelianVarieties §5.1 (good reduction implies
   unramified `T_ℓ`)", and to the Scope line `README.md:27` and the contract `README.md:116` "§5.1
   (Néron–Ogg–Shafarevich, used in 0.12(a) for the bad reduction of a ramified twist)".

   Tested on the instance of the Check at `README.md:397`: `κ = 𝔽₅`, `E : y² = x³ + x + 1`, `L = 𝔽₅(u)`,
   `v` the place at infinity, `v(u) = −1`: `y_u² = u³ + u + 1` has value `−3`, `v` ramifies, inertia acts
   by `−1` on `T_ℓ(E_u)` for `ℓ ≠ 5`, and §5.1 gives bad reduction (also in characteristic two, where `−1 ≠ 1`
   on the torsion-free `T_ℓ`).

3. **F03** (P3) Kerz–Saito's (0.6) is on p. 4, not p. 2

   **Location.** `README.md:572` ("(Kerz–Saito, (0.6), p. 2, and Example 1.8 with (1.9), pp. 9–10") and
   `README.md:1488` ("(0.2), (0.4) and (0.6) (p. 2)").

   **Claim.** Display (0.6) of Kerz–Saito is on printed p. 2.

   **Witness.** kerz_saito line 188 carries (0.6), after the marker of p. 4 at line 151; p. 2 (line 45–102)
   carries (0.2)–(0.5) only.

   **Repair.** In `README.md:572` write "(Kerz–Saito, (0.6), p. 4, and Example 1.8 with (1.9), pp. 9–10"
   (or drop the sentence if S01 is repaired by 1.1a, which then carries the locator); in `README.md:1488`
   write "(0.2) and (0.4) (p. 2), the account of known cases (p. 3), (0.6) (p. 4)". Tested: kerz_saito
   line 188 is between the markers of pp. 4 and 5 (line 151 and 202).

Three new findings: one P1 (S01), two P3 (S02, S03). All ten round-1 findings are repaired at this
head. S01 and S02 are in passages the round-1 repair wrote or changed. No finding of the last repair
report was marked `not actionable in this package`, so nothing is re-raised.

## Round-1 findings at this head

| Round-1 finding | Status | Witness at 518eebf |
|---|---|---|
| 1a/F01 (P1) §1.5 had no route, inputs unowned | repaired; the repair introduces S01 and S03 | `packages/LogicAndDefinabilityInNumberTheoryPartII/README.md:567–572`: "Prove the two consequences that later layers use: (a) *Detection* … (b) *Complex*". pop_eei2 line 420–452, 489 and 583 use only injectivity and the zero composite of Theorem 2.1, so (a) and (b) suffice for §5.6. The dyadic hypothesis of (a) is met in §5.6(a) (`README.md:1106`). |
| 1a/F02 and 1b/F01 (P2) §1.4, `d ≤ 3`, cited a conditional theorem | repaired | `README.md:542`: "For `d ≤ 3` the detection is Kerz–Saito's Theorem 8.1, p. 37, in its second alternative". kerz_saito line 1852–1862 (projective `X`, `(G)_{ℓ,a−2}`), line 1571 (Remark 6.1(2)), cossart_jannsen_saito line 131–134. The "`d ≤ 4` unconditional (Jannsen, p. 5)" sentence is gone. |
| 1a/F03 and 1b/F04 (P3) Poonen's Theorem 1.2 not a target | repaired | `README.md:416–427` (§0.13a) and `Suggested.lean:74–78` (`exists_formula_mem_primeField`, with `[Infinite K]`); poonen_uniform line 49–51. |
| 1b/F02 (P3) `exists_formula_isAlgebraic_primeField` is padding | repaired | The name occurs in neither file; `README.md:407` reads "Prove:" and names the case `n = 1` of 0.14(b). |
| 1b/F03 (P3) §1.5 stated for every prime `n` | repaired | `README.md:561`: "Let `n = n_K` (so `n = 2` if `char K ≠ 2` and `n = 3` if `char K = 2`)"; Check at `README.md:576`. |
| 1b/F05 (P2) function-field Brauer sequence cited to ClassFieldTheory | repaired | `README.md:99`, `509`, `600`, `1121`: ArithmeticGaloisDuality §R02.3.2; that section states the sequence as item 1 of its class-formation statement (line 2251 of its README at the open head). |
| 1b/F06 (P3) isogeny invariance is §5.2 | repaired; the repair introduces S02 | `README.md:27`, `116`, `337`, `403`, `486` cite NeronModelsAndSemistableAbelianVarieties §5.2 (`GoodIsogeny`); the section exists under that heading at the open head. |
| 1b/F07 (P3) dropped Lean name | repaired | `README.md:67–68`, `129`: `TauCeti.GlobalNumberFields.weakApproximation_denseRange` (`TauCeti/NumberTheory/NumberField/Global/Approximation/Weak.lean:208`, namespace line 76) and `IsDedekindDomain.FiniteAdeleRing.denseRange_algebraMap` (`TauCeti/RingTheory/DedekindDomain/FiniteAdeleRing/Basic.lean:476`). |

## Dependency check

```text
depcheck: 242 roadmaps, 2280 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line for this roadmap. `roadmaps resolve` on the README: no cross-roadmap
citation and no Lean name found nowhere (the five names of `scratch/citations.md` are targets of their
roadmaps, checked in round 1 and unchanged).

## The pass: statements, instances, values

`Suggested.lean` (10 declarations; none is in a section with `variable`s, so no binder can be lost; the
worker's elaborated types were compared with the README one by one and agree; no Lean was run).

| Statement | Context | Instances tried | Values computed | Result |
|---|---|---|---|---|
| `kroneckerDimension` | `(K : Type u) [Field K]` | `𝔽₉`, `ℚ`, `𝔽₂(s,t,u)`, `ℚ(s,t)` | `0`, `0+1`, `3`, `2+1` | equals Conventions |
| `IsGeometricPrimeDivisor` | `{K} [Field K] (O : ValuationSubring K)` | `ℤ_(p)[t]_{(p)} ⊂ ℚ(t)`; `t`-adic; `⊤`; places of `𝔽_q(t)` | residue char `p ≠ 0`; `1+1 = 2`; not a DVR; `0+1 = 1` | determines the object |
| `exists_sentence_kroneckerDimension_eq` | theorem, `n : ℕ` | `δ < n`, `δ = n`, `δ > n`; `𝔽₄` | `n ≥ r+ε` gives isotropy; `δ`-slot form anisotropic; sub-tensor of a `δ`-slot form with `n+1` slots anisotropic; non-cube in `𝔽₄ˣ ≅ ℤ/3` | true |
| `exists_sentence_charZero` | theorem | odd `p`, `Z` additively closed; `p = 2`; `Z = ∅` | `s = 2·((p+1)/2)s`; `2 = 0`; `∅ = 2∅` | true; second conjunct needs no `Field.FG` |
| `exists_formula_mem_primeField` | `[Field.FG K] [Infinite K]` | `𝔽₂(t)`; `𝔽₉(t)`; `ℚ(√2,t)`; `𝔽₉` | `𝔽₂[t] ∩ 𝔽₂[1/t] = 𝔽₂`; `𝔽₃`; `ℤ`-quotients `= ℚ`; empty family gives `𝔽₉ ≠ 𝔽₃` | true; `[Infinite K]` needed |
| `exists_formula_not_algebraicIndependent` | `n : ℕ` | `n = 0`; `n = 1`; char `p`, `t₁ ∉ κ`; finite `K` | empty family independent; `¬AlgIndep ↔ IsAlgebraic`; `trdeg ≤ 1 + (n−2)`; `t₁ ∈ κ = K` | true |
| `exists_formula_isGeometricPrimeDivisor` | `d : ℕ` | `d = 0`; `d = 1` number field, function field; `d = 2`, `k₁` not smooth; char 2, `d = 4` | no DVR; residue char `≠ 0`, all places; a proper valuation ring containing `k₁` has residue `δ = 1`; excluded by hypothesis | true as typed |
| `exists_formula_arithmeticNormalization` | `d e : ℕ` | `(1,0)` `ℚ`; `(1,1)` `𝔽_q(t)`; `(0,0)` `𝔽₄`; `e ∉ {d, d−1}`; `T = (t²)` in `𝔽₂(t)` | `ℤ`; `𝔽_q[t]`; `𝔽₄`; no basis, vacuous; `𝔽₂[t]` | equals 6.9 |
| `…_of_isDomain` | `[IsDomain B] [Algebra.FiniteType ℤ B]` | `B = 𝔽₉`; `S` zero ring; `S = ℤ/4`; `B ⊇ ℚ` | `θ₉`; `0 = 1` fails; `2` has no inverse; impossible (`ℚ` would embed in a finite residue field) | true |
| `exists_sentence_realize_iff_nonempty_ringEquiv` | `hK : ringChar K ≠ 2 ∨ δ ≤ 3` | `𝔽₄`; `ℚ`; `L` of char 2, `δ = 5` | `θ₄`; expansion generated by `∅`; no hypothesis on `L` | true |

README targets (all 75 numbered sections read; rows where values were computed in this pass):

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| 0.6(c), three cases | finite, `n = r+1`; number field, `n = r+2`; `k^sep` | `2n_k^{r+1} > n_k^{r+1}`; `b₁⟨⟨a, b₂/b₁⟩⟩` is `(r+3)`-fold, `cd₂ ≤ r+2`; `2n_k^r > n_k^r` over `K k̄` | sound |
| 0.8 route | char 0 and char `p` | `trdeg K′ = δ−1`, `ε = 2`; `trdeg = δ`, `ε = 1`; both give isotropy at `δ+1` slots | sound |
| 0.11 Checks | `y²+xy = x³+1`, `y²+y = x³` over `𝔽₂` | 4 points, trace `−1`; 3 points, trace `0` | sound |
| 0.12(a) ramification | `v(u) = −1`, any characteristic | `2v(y) = −3`; the term `(a₁u+a₃)y` has value `≥ −5/2 > −3` | `v` ramifies; bad reduction: S02 |
| 0.12 Checks | `y² = x³+x+1` over `𝔽₅`; `P₀ = (2,1)`; `t = s²`, `b = 0` | 9 points, trace `−3`; `z = 3`, `b = 1`, `d/ds = 2`; `(2s)² + s² = 5s² = 0` | sound; the source takes `x` and sums in `K` (poonen_uniform line 437–441, 459–461) |
| 0.13a | `x` and `1/x` | no pole on `ℙ¹`, so `𝔽_p` | sound |
| 0.14(b), char `p` | `n = 1`; `t₁` transcendental | empty tail never dependent, so `t₁ ∈ κ`; `L` = closure of `𝔽_p(t₁)` | sound |
| 1.1 Check | `(−1,−1)` over `ℚ(√5)` | `2` inert, `2·½ = 0`; two real invariants `½` | sound |
| 1.3 | `d = dim X` over `O_v^h` | generic fibre of dimension `d−1`, `KH_d = 0` since `dim T_X = 1` (kerz_saito l.1858) | sound; ownership of the complex: S01 |
| 1.4, `d ≤ 3` | `d = 1, 2, 3`; `d = 4` on `ℙ⁴` | `(G)_{2,−1}`, `(G)_{2,0}`, `(G)_{2,1}`, `(G)_{2,2}`, all `q ≤ 2` | sound |
| 1.5(a), number field | `k = ℚ(i)`; `α` vanishing above 2 | no real place; `cd₂ = 1` at complex places; 1.2 gives finite non-dyadic `v`; residue characteristic of `x′` odd or zero | sound |
| 1.5(a) used by 5.6(a) | vertical `x` over `s ∉ V_δ` | `β` an `n`-th power in `k_s^h ⊆ K_x^h`, class zero, residue zero | sound |
| 1.5(b) | `x₀ = (t,3)` on `ℙ¹_{ℤ[i]}` | `b̄ + b̄ = 0` in `ℤ/2` | true; supplier: S01 |
| 1.6(d) | split and division over `K̂_x`, dyadic `x` included | `char K̂_x = 0`, (b) applies; vanishing over `K̂_x` kills `∂_x` | sound |
| 2.1, 2.4 Checks | `(21,−1)`, `(7/3,−1)`; `a₀ = 3`, `a₁ = 145` | `21 = 9·7/3`, `5 = 1+4`, `v₃ = −1`; squares mod 5 are `1, 4`; `145 = 144+1` | sound |
| 2.5 separability | `K/M` purely inseparable | `e = 1` (`w(u_d) = 1`), `f = 1`, so `p^m = 1` | sound |
| 3.5 | `w̃(a_i) = 0` and `> 0` | `w̃(a_d) > 0 = N·0`; `2N w̃(a_i) > N w̃(a_i)` | sound |
| 3.7 | `𝔭` | radical of `(a_d)`; `a_i ∉ 𝔭` by all-`N` bound | sound |
| 4.6 | `2w_L(τ) ≤ w_L(a_d)` | `(a_dβ/τ)²(1−1/β) = a_d²(τ²/a_d)/τ² = a_d` | sound |
| 4.7 Check | `Stab(ℤ ∪ ℤ√2)` | `√2·ℤ√2 = 2ℤ ⊆ ℤ`, so `√2` in it; `Stab(ℤ) ∩ Stab(ℤ√2) = ℤ` | sound |
| 5.1 real places | `a₀ = a₁ = −1` over `ℚ` | no four-square certificate of `−1` | sound |
| 5.5 threshold | `𝔽₂(t)`, `n = 3`; `ℚ(i)`, `n = 2` | `2v(3) = 0` against printed `2v(6) = ∞`; `2v(4) = 8 > 2v(2) = 4` | sound |
| 5.6 Check | `𝔽₅(s)`, `b′ = 2s` | `a(1) = −1/3 = 3` | sound |
| 6.5 | restriction of a flag to `κ(T)` | finite-index subgroup of lexicographic `ℤ^{e+1}` is lexicographic `ℤ^{e+1}` | sound |
| 6.7 | `f = (s+2)/3`, `s ↦ −1` | `s+2 ↦ 1`, value `−1` at `3` | sound |
| 7.3 | `B ⊇ ℚ`? | impossible for a finitely generated ring; core is one-dimensional | sound |

## Verified sound

- Declarations read: 10 of 10 (2 definitions with real bodies, 8 `sorry`'d theorems). Single
  `import Mathlib`, no `set_option`, no `lemma`, no sorry'd data, one docstring each, module docstring
  names the two families that are not statable. Every Lean name occurs in the README and every
  backticked name of this roadmap in the README is declared. No padding: each theorem is an end theorem
  of a cited paper; `exists_formula_mem_primeField` does not follow from the others.
- Headline theorems (Summary and Layers 0, 5, 6, 7, 8): fixed Kronecker dimension, characteristic
  sentence, prime subfield, algebraic dependence (with the constant field as `n = 1`), geometric prime
  divisors, normalization, the domain sentence and the field sentence are stated; the two
  bi-interpretability theorems and the characteristic-two cases above dimension three are named as
  not statable. The Layer 1 principles are inputs and have no carrier at the pins.
- Targets read: 75 numbered sections, with Conventions, supplier contracts and every *Needs:* line.
- Locators verified against the cached texts in this pass (39): kerz_saito 19 (all of the References
  entry; one wrong, S03), cossart_jannsen_saito 1, pop_eei2 9 (Theorem 2.1, §2C, Notation/Remarks 3.1(5),
  3.5, 4.1, Lemmas 3.3, 3.6, Fact 3.4 and the uses in §4), poonen_uniform 8 (Theorems 1.1, 1.2,
  2.2, Lemmas 4.7, 4.8, proofs of Theorems 1.1, 1.2 and 1.3), jannsen_hasse 2 (Conjecture 3, p. 4;
  Theorem 0.6).
- Checks tested: all 252 Check bullets read; 34 recomputed with values (table above); none false or
  vacuous; every definition has at least three.
- Sibling citations checked at main or the open heads in this pass (24 sections of 12 roadmaps):
  LefschetzPencilsAndVanishingCycles §§0.10, 3.5; ArithmeticGaloisDuality §§R02.3.2, R02.4.4;
  NeronModelsAndSemistableAbelianVarieties §§5.1, 5.2; MotivesAndAlgebraicCycles §0.5b (S01);
  KTheoryFiniteLocalFields §§3.0, 3.0a; DeligneWeightsAndPurity §§7.12, 7.15; SchemeAndStackFoundations
  §§0.12, 0.20, 2.15, 4.13; AdicCoefficientsAndComparisonsPartII §§PA.0.12, PA.6.8, PA.6.10;
  CrystallineCohomology §§CR.4.7, CR.4.8 (the Illusie sequences and the slope bounds there, with
  PadicDifferentialEquationsAndRigidCohomology §RD.7.7, give the weights that 1.4 needs);
  EllipticCurves Layer 5; QuadraticFormInvariantsPartII contract of §0.5b.
- Pinned declarations opened at the pins (9): the two approximation theorems of 1b/F07,
  `TauCeti.Place.exists_forall_mem_valuation_sub_le` (`≤ exp (r P)`), `exists_ne_zero_forall_mem_ord_eq`,
  `exists_ord_eq_neg_and_forall_ne_ord_nonneg` (`IsFunctionField`, `IsIntegrallyClosedIn`, `2g ≤ n`),
  `exists_forall_mem_valuation_sub_le_and_forall_mem_integers`, `algebraicIndependent_unique_type_iff`,
  `AbelianVariety.IsAlbanese`, `Field.FG`.
- Declared gaps (5): the slugs of `design/plan.json` and of the README agree, each with a supplier and
  a section. Not raised.
- Ownership against open pull requests, by object: no other roadmap states the Kato complex or a
  coniveau couple on regular schemes of mixed characteristic, Kerz–Saito's or Kato's principle, or the
  uniform definitions; overlaps: none listed, none found.
- Policy: the pull request changes only the package folder (12 files, all under it); no pull-request
  number or process word in the README or docstrings; no machine path in `sources.toml`.

## Not verifiable

- kato_hasse, merkurjev_suslin, moret_bailly, lenstra_cm: uncertified, cited by locator only.
- Jannsen–Saito–Sato (arXiv:0910.3759), needed by the repair of S01: not in the manifest and not
  fetched in this pass (a read-only pass does not edit `sources.toml`); the theorem number is left to
  the repair.
- Stacks, Commutative Algebra and Resolution of Surfaces (11 locators): not in the cached text; not
  reread in this pass (pass b of round 1 read nine on the Stacks project site).
- Published numbering of poonen_uniform, jannsen_hasse and achter_casalaina_vial: only the arXiv
  versions are cached.
- akns, dittmann_pop, rumely, wittenberg_albanese, waterhouse, serre_albanese locators: verified in
  round 1 and unchanged at this head; not reread.
- Truth of the Lean statements beyond the instances above: no Lean was run.

## Source issues

- **Error** in poonen_uniform at Lemma 4.8, printed p. 9 (arXiv v1): the source says the sums of two values of `y/x` are taken inside the field itself and the form is tested over it; it should be sums in the quadratic extension, tested there; affects a stated result.
- **Error** in poonen_uniform at proof of Lemma 4.8, printed p. 10 (arXiv v1): the source says the `x`-coordinate pulled back by a separable endomorphism has a simple pole at a kernel point; it should be a double pole, so `y/x` is used; affects the proof.
- **Gap** in poonen_uniform at proof of Lemma 4.7, printed p. 9 (arXiv v1): the source says a twist by a quadratic extension ramified at a place has bad reduction there; it should give the inertia argument on the Tate module; affects nothing.
- **Misprint** in pop_eei2 at Notation/Remarks 3.5, printed p. 2102: the source says the congruence threshold is twice the value of `2n`; it should be twice the value of `n` in characteristic two, where `2n = 0`; affects a stated result.

Source independence: 12 passages compared with 5 sources (kerz_saito, cossart_jannsen_saito, pop_eei2, poonen_uniform, jannsen_hasse), none shared beyond what a list of hypotheses forces (longest run 8 words, the conclusion of Corollary 0.4 at cossart_jannsen_saito line 134, in the `needs` sentence of a declared gap); largest share dittmann_pop, 56 of about 150 locators; contents compared with dittmann_pop (its §§1–5): independent, as found in round 1 and unchanged at this head (its §3 is split over Layers 2–3, its §4 over Layers 4–5, its §5 over Layers 6–8, Layer 0 has no counterpart, and the order of Layers 1 to 8 is forced by 3.1 needs 1.2–1.4, 4.6 needs 3.8, 5.2 needs 4.7, 6.4 needs 5.7, 7.6 needs 6.9, 8.5 needs 7.6).

## For the human reviewers

- **Scope.** `README.md:386–400` replaces the printed statement and proof of Lemma 4.8 of poonen_uniform by a corrected version of the roadmap's own; only arXiv v1 was read, and no refereed source states the corrected lemma.
- **Scope.** `README.md:567–572` proves two consequences of Kato's two-dimensional theorem and not the theorem; kato_hasse is uncertified and its proof (higher class field theory) has no owner in any roadmap.
- **Licence.** `sources.toml` records achter_casalaina_vial with year 2026 (Annales de l'Institut Fourier 76); only arXiv:2210.05017v3 is cached.
- **Not tested.** The Stacks chapters Commutative Algebra and Resolution of Surfaces (11 locators) are not in the cached text of `stacks`.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "518eebfb01697023a1cd9d7a925ece9211a52e57", "job": "RT-LogicAndDefinabilityInNumberTheoryPartII~2a", "model": "fable", "worker": "chris-x30"} -->
