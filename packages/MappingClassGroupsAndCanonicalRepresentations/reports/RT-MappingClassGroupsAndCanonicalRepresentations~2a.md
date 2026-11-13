<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13100#issuecomment-6849383710 -->
Red team round 2 pass a (claude) of 4b7d4fa

Verdict: needs_changes

1. **F01** (P2) §5.11's finiteness criterion says "every complex embedding", and its own Check uses that phrase for the non-real ones

   - **Location.** `README.md:1987–1989`: "a representation `Γ → GL_m(O_K)` which is unitary at every
     complex embedding of `K` has finite image"; `README.md:2001–2003`: "unitary at the two complex
     embeddings and of infinite image, and is not unitary at the real embeddings".
   - **Claim.** Unitarity at the complex embeddings of `K` forces finite image.
   - **Witness.** The Check's Salem character: `K = ℚ(λ)`, `λ ≈ 1.722`, has two real embeddings
     (`λ`, `λ⁻¹`) and one non-real pair of modulus `1`. In the Check's usage it is unitary at every
     complex embedding and has infinite image. LL22 line 1910 says "each embedding `ι : K → ℂ`".
   - **Repair.** Line 1987: "Prove that a representation `Γ → GL_m(O_K)` whose scalar extension along
     every field embedding `ι : K → ℂ`, the real embeddings included, is unitary has finite image".
     Lines 2001–2003: "is integral, unitary at the pair of non-real embeddings (`|λ′| = 1`) and of
     infinite image, and is not unitary at the two real embeddings (`λ ≈ 1.722`, `λ⁻¹ ≈ 0.581`)".
     Tested on the witness: at the real embedding `|λ| = 1.722 ≠ 1`, so the hypothesis fails and the
     statement asserts nothing.

2. **F02** (P2) §5.4's real admissibility uses a limit Hodge filtration that no supplier provides outside quasi-unipotent monodromy

   - **Location.** `README.md:1667–1673`: "the Hodge bundles extend to subbundles of the canonical
     extension inducing the limit Hodge filtration on each `gr^W_k`"; *Needs* at `:1697–1699`.
   - **Claim.** Admissibility of a real variation is the supplier's conditions (a) and (b) read with real
     coefficients.
   - **Witness.** The limit filtration is MixedHodgeModulesAndIrregularHodgeTheory §3.2
     (`packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md:323–325`): rational, quasi-unipotent
     monodromy, proved on the cover `t = u^e`. §3.2 is not cited. For `V = π°^*χ` with §4.5's
     `χ` (`1 ↦ exp(2πi√2)`), `R¹π°_* V_ℝ` has eigenvalues `exp(±2πi√2 k)`: no such `e`.
   - **Repair.** After "…§3.3's admissibility." (line 1673) insert: "The limit Hodge filtration of a
     pure polarizable variation on the punctured disc is MixedHodgeModulesAndIrregularHodgeTheory §3.2
     when the variation is rational with quasi-unipotent monodromy. A real polarizable variation need
     not have quasi-unipotent monodromy, and §3.2's passage to a finite cover `t = u^e` is then
     unavailable. Prove, as a target of this section: for a polarizable real variation of pure Hodge
     structure on `Δ^*`, the monodromy eigenvalues have absolute value one and the Hodge bundles extend
     to holomorphic subbundles of the canonical extension with residue eigenvalues of real part in
     `[0, 1)`; the fibre at `0` of the extended filtration is the limit Hodge filtration of condition
     (a) (Steenbrink–Zucker, Definition 3.4, for real coefficients, as cited in Landesman–Litt, §4.1,
     LL24 line 1013)." Add §3.2 to the *Needs* line, to Layer 5's *Dependencies*, to the supplier
     subsection (line 530) and to the ownership bullet (line 141). Add the Check: "The rank-two
     orthogonal system on `Δ^*` with monodromy the rotation by one radian, of type `(0, 0)`, has
     eigenvalues `e^{±i}`, of absolute value one and not roots of unity; its canonical extension has
     residues `1/2π ≈ 0.159` and `1 − 1/2π ≈ 0.841`, `F⁰` is the whole extension and `F¹ = 0`, so the
     limit filtration exists although §3.2 does not apply." Tested on the witness: the limit filtration
     now has an owner (this section) for `exp(2πi√2 k)`.

3. **F03** (P3) §11.5 uses a character variety `M_r(π₁(Σ_{g,n}))` that §1.4 does not define

   - **Location.** `README.md:2858–2865`: "lie in a proper closed subset of the character variety
     `M_r(π₁(Σ_{g,n}))` … whose image in the quotient is closed (§1.4)".
   - **Claim.** §1.4 supplies the quotient and its closed-image property.
   - **Witness.** §1.4 (`README.md:936–939`) defines only `R_r(Γ)_χ` and `M_r(Γ)_χ`, cut out by
     `det A_i = χ(s_i)`. Finite-image representations have varying determinants, so no single `χ`
     contains them; LL22 line 2032 uses the quotient with no determinant condition.
   - **Repair.** Append to the first paragraph of §1.4: "Write `R_r(Γ)` and `M_r(Γ)` for the same
     constructions without the determinant equations; the three statements below hold for them with
     the same proofs, `R_r(Γ)_χ` being a closed `GL_r`-stable subscheme of `R_r(Γ)`." Tested: the
     semisimple point `⟨u, l⟩ ⊕ 1^{r−2}` of `R_r(F₂)` (opposite unipotents, determinant `1`,
     `[u^m, l^m] ≠ 1` since `m² ≠ 0` in `ℂ`) lies outside the closed invariant Jordan locus, so its
     image is outside the closed image: the subset of `M_r` is proper.

4. **F04** (P3) "the `O_K` sense" in Layer 10, where `K` is the finitely generated base field

   - **Location.** `README.md:2732` "(4) … it underlies an integral PVHS in the `O_K` sense of §5.1";
     also `:2744`, `:3138`.
   - **Claim.** Condition (4) refers to §5.1's integral PVHS.
   - **Witness.** `README.md:2683`: "Throughout this layer `K` is a finitely generated field of
     characteristic zero" (for the generic curve, of transcendence degree `3g − 3 + n` over `ℚ`); it
     has no ring of integers in §5.1's sense, where `K` is a number field (`:1460`).
   - **Repair.** Line 2732: "(4) for every such choice it underlies an integral PVHS in the sense of
     §5.1, that is, it is `V ⊗_{O_L, ι} ℂ` for a number field `L` and a local system `V` of finite free
     `O_L`-modules all of whose complex conjugates underlie complex PVHS". Lines 2744 and 3138:
     replace "the `O_K` sense" by "the `O_L` sense (`L` a number field)". Tested: for the order-three
     character, `L = ℚ(ζ₃)` is a number field whatever the base field `K` is.

5. **F05** (P3) §9.9's Check is false for `N = 1`

   - **Location.** `README.md:2652–2653`: "`G = F_N^{ab} = ℤ^N` with `Out(G) = GL_N(ℤ)`: the conclusion
     recovers finiteness of `GL_N(ℤ)`-finite characters of `ℤ^N`."
   - **Claim.** Every `GL_N(ℤ)`-finite character of `ℤ^N` is finite.
   - **Witness.** `N = 1`: the character `1 ↦ 2` of `ℤ` has `GL₁(ℤ)`-orbit `{2, 1/2}` and infinite
     image (the README's own §12.8, `:3057`). §9.9 does not apply: `N = 1 = 2g + 1` gives `g = 0` and
     `r = 1` fails `1 < 1`.
   - **Repair.** "`G = F_N^{ab} = ℤ^N` with `Out(G) = GL_N(ℤ)` and `N ≥ 2` (so that `g ≥ 1` and `r = 1`
     is in range): the conclusion recovers finiteness of `GL_N(ℤ)`-finite characters of `ℤ^N`; for
     `N = 1` the character `1 ↦ 2` has orbit `{2, 1/2}` and infinite image, outside the range since
     `g = 0`." Tested: `N = 2`, `(λ, μ) ↦ (λμ^k, μ)` under transvections is finite only for torsion `μ`.

Five new findings (S01–S05): 2 P2, 3 P3. None re-raises a finding the repair report marked
`not actionable in this package` (it marks none). No finding concerns `Suggested.lean`.

## Round 1 findings at this head

All locations are in `packages/MappingClassGroupsAndCanonicalRepresentations/`.

| Round 1 id | Status | Witness at 4b7d4fa |
|---|---|---|
| 1a/F01 = 1b/F02 (`Mod` vs `Mod⁺`) | repaired | `README.md:638–640` "For `p = 0` it is GeometricTopology §1.7.2's `Mod⁺(Σ_{g,b})` … equal to its `Mod(Σ_{g,b})` when `b ≥ 1`"; `:316` "Lickorish's theorem that `Mod⁺(F)`"; `:320–323`; `:775–778`. Torus: `SL₂(ℤ)` on both sides. |
| 1a/F02 (rank-two headline) | repaired | `Suggested.lean:227` `rankTwo_mcgFinite_finite_image (g n : ℕ) (hg : 2 ≤ g)`; `README.md:3015–3019`. Checked against LL24 lines 2192–2201, CH19 line 268 (`g > 0`, `n ≥ 0`, actual classes), BGMW17 line 53 (`g ≥ 2`, `n ≥ 0`). |
| 1a/F03 (closed-orbit Check) | repaired | `README.md:2435–2439` "The common orbit on the dense open `t ≠ 0` is that of `A(1)`, which is not closed … whose own orbit `{I}` is closed". |
| 1a/F04 (antilinear identification) | repaired | `README.md:1682–1688` "gives a complex-antilinear isomorphism `c_V : H_V → H_{V^∨}` … `c_V` carries `H^{i,j}_V` onto `H^{j,i}_{V^∨}`"; Check `:1705–1708`. |
| 1a/F05 (finite-cover interpretation) | repaired | `Suggested.lean:151–155` "When `H` is finite and `ϕ` is surjective … For an infinite quotient it is only this algebraic subspace"; `README.md:2046–2050`, Check `:2082–2086`. |
| 1a/F06 (stabilizer Checks) | repaired | `README.md:2074–2081` (`H = 1`; `c_x` with `h = φ(x)`; `−I` on `ℤ² → ℤ/3` needs `2 = 1`). |
| 1a/F07 (instance docstring) | repaired | `Suggested.lean:80`. |
| 1a/F08 (quantum examples) | repaired in the README; not added to the Lean file | `README.md:3030–3033` "there is a real constant `C > 1` such that for every `g ≥ 2` … the constant comes first"; KS16 lines 546–554 agree. The Lean omission is explained at `Suggested.lean:52–54` (range check); I do not re-raise it. |
| 1a/F09 = 1b/F03 (degree form of Putman–Wieland) | repaired | `Suggested.lean:176–184`; `README.md:2170–2177`; LL24 line 1481. |
| 1a/F10 (kernel cover vs realization) | repaired | `README.md:1351–1357` "`ρ̄ ∘ Φ` realizes `ρ` on the genus-`g` family itself. The cover … only trivializes"; `:1423–1426`. |
| 1a/F11 = 1b/F07 (two Checks) | repaired | `README.md:1774–1780`; `:1732–1738` (`ρ = g − 1 − deg E + h⁰(E)`, recomputed by Riemann–Roch). |
| 1b/F01 (real VMHS unowned) | repaired; the repair leaves S02 | `README.md:1657–1673`, `:523–539`, `:137–142`; ShimuraData §§3.1–3.3 and MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3, 5.6 exist with the cited content. |
| 1b/F04 (pinned transgression) | repaired | `README.md:263–274`, `:826–841`; `TauCeti/RepresentationTheory/Homological/ContCohomology/FiveTerm.lean:56`, `Transgression.lean:147`. |
| 1b/F05 (closed torus in §8.3) | repaired | `README.md:2448–2450`. |
| 1b/F06 (§2.2 Check) | repaired | `README.md:1065–1067`. |
| 1b/F08 ("admissible" twice) | repaired | `README.md:1840–1843` "*determinant-finite*"; "admissible" now occurs only in the Hodge sense (lines 64–65, 140, 532–539, 1667–1689). |

No repair introduced an error in a statement I recomputed (tables below), except the dependency
S02 describes.

## Dependency check

```text
depcheck: 206 roadmaps, 1914 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. Merge-order lines: ComplexComparisonPartII 40,
InverseGaloisAndArithmeticFundamentalGroups 55, LanglandsParameterStacks 81,
AutomorphicLFunctionsAndLocalFactors 95, ShimuraData 117, MordellLawrenceVenkatesh 161,
MixedHodgeModulesAndIrregularHodgeTheory 261, TeichmullerGeometry 288, this roadmap 291.
FiniteGroupInvariants is not in the merge order and not on main; it is an open pull request adding
a new roadmap folder, which the supplier rules allow. No never-cite roadmap is cited.

## Pass record: `Suggested.lean`

The file has no `variable` block; I compared each elaborated type in the worker's signature table
with its README statement and ran no Lean (read-only pass). Nothing changed.

| Declaration (layer; context) | Instances tried | Values computed | Result |
|---|---|---|---|
| `surfaceRelator`, `surfaceGroup`, instance (0; `g n : ℕ`) | `(0,0)`, `(0,1)`, `(0,2)`, `(1,0)`, `(1,1)`; supplier relator `a⁻¹b⁻¹ab p₁` under `a ↦ a⁻¹`, `b ↦ b⁻¹` | trivial; `⟨c∣c⟩ = 1`; `ℤ`; `ℤ²`; `F₂` with `c₁ = [a,b]⁻¹`; image `aba⁻¹b⁻¹c₁` | sound; matches FreeGroupsAndLimitGroups `Suggested.lean:1009–1022` |
| `peripheralLoop` (0; `{g n}`, `j : Fin n`) | `n = 0`; `(0,2)` | no index; `c₂ = c₁⁻¹` | sound |
| `pureMappingClassAut` (0) | `n = 0`; `(0,2)` inversion; `(0,3)` swap; inner `c_h` | all of `Aut`; excluded (`c₁ ≠ c₁⁻¹` in `ℤ`); excluded; included with `h` | sound; inverse-conjugate model excluded by `(0,2)` |
| `HasFiniteConjugacyOrbitUnder` (2; `{G} [Group G] {r}`) | `H = ⊥`; `r = 0`; `ℤ`, `1 ↦ 2`, `H = ⊤`; unipotent `f(a₁) = 1` on genus 2 | 1 class; 1 class; 2 classes `{2, 1/2}`, image infinite; `Sp₄(ℤ)`-orbit of the line infinite | sound; no semisimplification |
| `prymStabilizer` (6; `{H} [Group H]`) | `H = 1`; `c_x`; `ℤ² → ℤ/3`, `−I` | whole group; `h = ϕ(x)`; `2 ≠ 1` | sound |
| `compactPrymCohomology` (6) | `H = 1`, `(2,0)`; identity cover of `(0,3)`; `ϕ → ℤ` on `(2,0)` | dim 4; open 2, compact 0; infinite-dimensional | sound; docstring scoped to finite surjective `ϕ` |
| `putmanWieland_of_irreducible_dim_lt` (6; `[Finite H]`) | `g = 0, 1`; `H = ℤ/5`, `g = 2`; `S₃`, `g = 2, 3`; `d = 0` | trivial rep `d = 1 ≥ g`, vacuous; `1 < 2`; `2 < 2` false, `2 < 3`; not irreducible | true; `Γ′ ∩ im Γ` has finite index in `im Γ`, fixed class gives fixed vector of `V_K` |
| `putmanWieland_of_card_lt` (6; `[Fintype H]`) | `g = 0, 1`; `H = ℤ/2`, `g = 2`; `#H = g²` | no `H`; `2 < 4`, pieces of dim 4 and 2, bound `2`; excluded | true; LL24 lines 154, 1490. Not padding: deducing it from the degree form needs the identification of an arbitrary irreducible `σ` with a member of the enumerated family of `TauCeti.sum_characterDegree_sq_eq_card` (`Table.lean:294`), more than one lemma |
| `mcgFinite_finite_image` (9) | `r = 0`; `g = 0, r = 1`; `(1,0), r = 1`; `(1,n), r = 1`; `g = 3, r = 2`; `g = 4, r = 2` | image 1; `1 < 1` false; `GL₂(ℤ)`-finite ⇒ torsion; point-push gives `χ(b)χ(cⱼ)^k`; `4 < 4` false; `4 < 5` | true; LL24 line 95 |
| `freeGroup_finite_image` (9) | `N = 0, 1`; `N = 2, r = 1`; `N = 2, r = 2` with §12.5 | `g = 0`, `r = 0`; torsion pairs only; `4 ≥ 2`, outside | true; LL24 lines 179–188 |
| `rankTwo_mcgFinite_finite_image` (12) | `g = 1`, `a ↦ diag(λ, λ⁻¹)`, `b ↦ [[0,1],[−1,0]]`; `g = 2`, unipotent with `f(cⱼ) ≠ 0`; `g = 2`, sum of two characters | trace triple `(λ + λ⁻¹, 0, 0)`, orbit of 3, image infinite: excluded by `2 ≤ g`; push gives `f + k f(cⱼ)γ*`, infinitely many lines; CH19 Theorem B(1), torsion | true as typed |

## Pass record: README targets

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| §0.2 index and non-inversion | `(0,1)`, `(0,2)`, `(1,1)` | trivial group; `[c₁] ≠ −[c₁]` in `ℤ`; free-group centralizer argument | sound |
| §0.3 twist, push, Birman | torus `î(a,b) = 1`; left twist on `ℝ²/ℤ²` in the annulus `y ∈ [0, ε]` | `T_a b = b + a`; left twist sends `b` to `b − a = b + î(b,a)a`, the supplier's formula | consistent with MordellLawrenceVenkatesh §5.12 and GeometricTopology §1.7.2 |
| §0.4 capping | `(0,1,2)`, `(0,2,1)`, `(0,3,0)`, `(1,1,0)`, disc | kernels `ℤ`, `ℤ²`, `ℤ³`, `ℤ`; disc `Mod = 1` | sound in the hyperbolic range |
| §0.5 | `g = 1, 2, ≥ 3` | Kor02 lines 14–19 (pure), 357–359 | sound |
| §1.1 | `ℤ/4 ⊃ 2ℤ/4`; `(ℤ/2)²`; `E_∞^{1,1} ⊂ E₂^{1,1}` | `tg ≠ 0`; `tg = 0`; no incoming `d₂`, kernel `F²` | sound |
| §1.2 | `r = 1`; `ℤ ⊃ 2ℤ`, `D = μ₂, μ₄` | `μ_D = D`; `−1 ∈ D/D²` nonzero, zero | sound |
| §1.3 | `d₁`, `d₂`, `n = 0`; `r = 1`; `ℤ`, `[[1,t],[0,1]]` | kernels `0`; undefined; `ad = 0`; `H¹ = sl₂ ≠ 0` | sound |
| §1.4 | `ℤ/2`, `r = 2`, `χ = 1` | `A² = I`, `det = 1` ⇒ `±I`; tangent space `2X = 0`; ring `ℂ × ℂ` | sound; S03 for the unfixed-determinant quotient |
| §1.5 | `u^m l^m` vs `l^m u^m` | `[[1+m², m],[m,1]]` vs `[[1,m],[m,1+m²]]`: equal iff `p ∣ m` | sound |
| §2.1 bullets | `ψ` normalizing `H` | orbit of `ρ∘ψ` is (orbit of `ρ`)`∘ψ` | sound |
| §3.3 | `(1,0)`; `n ≥ 2`, class `a₁ + cⱼ`; `(0,3)` | torsion; `χ(a₁)χ(cⱼ)` torsion; `(2, 1/2)` infinite | sound |
| §3.4 Checks | `Q₈ × C₂`; trivial centralizer | Klein four self-centralizing in `PGL₂`; `e₁e₂⁻¹` centralizes `Pρ(N)` | sound |
| §4.4 | `G = N × ℤ`, `2^k σ(n)` | infinite, non-unitary | hypothesis needed |
| §5.2 | `ℙ¹∖{0,∞}`; `O ⊕ O(1)` with `D = x` | `−1 + a + (1−a) = 0`; slope `(1+a)/2 < 1` | sound |
| §5.3 | `O(p) ⊕ O(−p)`; saturation of `(a, b)`, `b ≠ 0` | generator `(az², b)`, line `≅ O(−p)`; slopes `{1, −1}` | sound |
| §5.5 | rank one | `h⁰(E^∨⊗ω) − h⁰(E) = g − 1 − deg E` | sound |
| §5.7 | `w + 2u ≥ 2g ⇒ uw ≥ g` | `u ≥ g`: `uw ≥ g`; `1 ≤ u ≤ g−1`: `u(2g−2u) ≥ 2g−2 ≥ g` for `g ≥ 2` | sound |
| §5.9a Check | `SO(4)` pair | `1 + 2cos(5π/6) = 1 − √3`, `1 + 2cos(π/6) = 1 + √3` | sound |
| §5.11 | Salem polynomial | `y² − y − 3`, `y ≈ 2.303, −1.303`; `x ≈ 1.722, 0.581`, two of modulus 1 | S01 |
| §5.1 Check | `(−1, 3)/ℚ` | `i² = −1`, `j² = 3`, `ij = −ji`; ramified at 3 (`(−1/3) = −1`) and 2 | sound |
| §6.6, §6.7 | `ℤ/5`, `g = 2`; `S₃` | `1 < 2`, `5 ≥ 4`; needs `g ≥ 3` | sound |
| §7.1 | separating `γ`, `g ≥ 3`; eigenvalue `λ` of multiplicity `d` | a side of genus `≥ 2`; `λ^{10d} = 1` | sound; AS16 line 436 |
| §9.2 | `3ab < 3(g+1)/4 ≤ 2g` | holds for `g ≥ 1`; `dim σ ≤ dim I_σ ≤ ab` | sound |
| §9.6 Check | `P = I + E₂₁` | `P(I+E₁₃)P⁻¹ = I+E₁₃+E₂₃`, `P(I+E₂₃)P⁻¹ = I+E₂₃` | sound |
| §9.9 Check | `N = 1` | orbit `{2, 1/2}`, image infinite | S05 |
| §10.3–10.4 | `g = 3`, `g = 8` | `r ≤ 3` (`3 < 4`); `r ≤ 5` (`5 < 6`) | sound; S04 |
| §11.5 | `⟨u, l⟩ ⊕ 1^{r−2}` | `[u^m, l^m] ≠ 1` in characteristic 0 | sound; S03 |
| §11.6 | `ℤ_p[[x]]/(p)` | complete intersection, `p = 0` | sound |
| §12.3 | `(1,1)`, `(0,3)`, `(0,4)` | `ℤ²`, `ℤ`: `2g − 3 + n = 0`, excluded; `F₂` | sound |
| §12.5 | trace triple | `(λ + λ⁻¹, 0, 0)`, orbit of size 3 | sound |
| §12.7 | adjoint rank | `d² ≤ (C₀²)^g`; free subgroup not virtually unipotent | sound; KS16 lines 546–554 |
| Worked examples 1–4 | `(2g+1)² − (g+1)`; `Σ₃ → Σ₂`; `g = 8`; `N = 2` | `4g² + 3g > 0`; dims `4 + 2`, bound `2`; `3 < 8`, `2 < 6`; `GL₂(ℤ)` monomials | consistent |

## Verified sound

- **Declarations read: 13 of 13** (`Suggested.lean`, all 233 lines: seven definitions, one instance,
  five theorems). Single `import Mathlib`; no `set_option`, `lemma`, `#eval`, sorry'd data or `True`
  placeholder; a docstring on every declaration. No padding by the one-tactic probe. Every Lean name
  appears in the README; every own backticked name of the README is declared.
- **Headlines.** Stated: Landesman–Litt Theorem 1.2.1, Corollary 1.6.1, Corollaries 7.2.3 and 7.2.4
  (Theorem 1.4.1), the rank-two theorem. Named as not statable with the missing carrier: Theorems
  1.7.1, 6.2.1, 7.2.1, 1.4.2, 9.1.2, Corollaries 1.3.1, 1.2.3, 9.1.4, 9.2.2. I found no statable
  headline that is absent.
- **README targets read: all 85 numbered sections**, every line of the 3237.
- **Locators verified this pass against the cached texts: 34.** LL24 lines 95, 154, 161, 179–188,
  201–222, 227–232, 239–242, 1015–1048, 1057–1071, 1398–1404, 1465, 1473–1493, 1496–1505, 1698–1706,
  1786–1799, 1816–1821, 1876–1883, 1896–1927, 2144–2171, 2182–2201, 2208–2216, 2226–2258; LL22
  lines 100–107, 118–122, 167–175, 1908–1911, 2030–2046; CH19 lines 174–180, 268–274; BGMW17 lines
  53–64; KS16 lines 521–554; Kor02 lines 14–19, 357–359; Mor89 lines 886–904; AS16 lines 436–449;
  KP20 lines 62–69; EG18 line 29.
- **Checks recomputed: 58** (tables above); two are findings (S01, S05).
- **Pinned declarations grepped: 27**, all present: `FundamentalGroup.mul_def`,
  `Representation.IsIrreducible.bijective_or_eq_zero`, `LinearMap.bijective_or_eq_zero`,
  `isotypicComponent`, `Representation.ind`, `groupCohomology.H1InfRes_exact`, `Subgroup.relIndex`
  and the Tau Ceti names of *From Tau Ceti*. `TauCeti.IsAspherical` also includes
  path-connectedness (`EilenbergMacLane/Basic.lean:36`), which the README's gloss omits; the
  consumers have connected spaces.
- **Sibling citations resolved at main or at the open heads: 62 sections or named targets in 24
  roadmaps**, all present with the cited content: FreeGroupsAndLimitGroups §§6.1, 6.1a, 6.2 and its
  `OrientableSurfaceGroup`, `isFreeGroup_orientable`; FiniteGroupInvariants §10.5; GeometricTopology
  §§1.7, 1.7.2, 11.2.1; MordellLawrenceVenkatesh §§5.1–5.21 as cited; TeichmullerGeometry §§2.4,
  3.1–3.3, 5.1, 5.2, 5.6; SchemeAndStackFoundations §§2.1, 2.2, 4.15, Layer 0 and seven names;
  ComplexCurveModuli D0 items 4–5, D3, D5, D7, D8; ComplexComparisonPartII §§C5.2, C5.6, C6.0–C6.3
  and eleven names; InverseGaloisAndArithmeticFundamentalGroups §§IG.1.2–1.4, 3.1, 5.4 and ten
  paragraph titles; ArithmeticGaloisRepresentations §1.11; LanglandsParameterStacks §2.2 with its
  `k[ε]/(ε²)` Check; LocalGaloisDeformationRings §§F.1.1, F.1.7, F.2.1, F.2.3, F.2.5, F.2.9;
  DeformationAndDerivedPatchingAlgebra §§4.2, 4.4; ResolutionOfSingularitiesCharacteristicZero §6.2;
  AutomorphicLFunctionsAndLocalFactors AL.3.10.13–14; DeligneWeightsAndPurity §§5.5, 7.8, 8.14,
  8.19; AlgebraicTopology stages; DGFloer Layer 1 item 2; ClassifyingSpaces Stage 4 item 17;
  ProfiniteCohomology Layer 5; NoncommutativeAndEquivariantIwasawa §F.3; RepresentationTheory
  (CharacterTheory Layer 2, InductionRestriction Layer 7); ComplexKahlerGeometry K4–K5; ShimuraData
  §§3.1–3.3; MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.3, 5.6; Completed/HodgeStructures and
  Completed/UniversalCovers.
- **Citation leads of the worker.** `StableCurves.Mbar` is SchemeAndStackFoundations §4.15's name,
  not a pinned declaration; MixedHodgeModulesAndIrregularHodgeTheory is a board package in the merge
  order. Neither is a defect.
- **Declared gaps.** The three slugs are in `design/plan.json` with the suppliers and sections the
  README names. Not raised.
- **Policy.** The pull request changes only the package folder; no pull-request numbers or process
  narrative in the README or docstrings; every target has a locator.
- **Ownership.** No fully qualified name of `Suggested.lean` collides with a readable roadmap. The
  overlap listing reports no open pull request changing this roadmap, no dropped id and no close
  second plan.

## Not verifiable

- MS80, SZ85, Mor93, Nie24, Deb01, PS08, Del70, FM12, Tim87, Wat89, Kat96, CR62, MKS04 are settled
  as uncertified; their locators were not opened.
- Farb–Margalit, Proposition 6.3: the README (`README.md:699–700`) says it is "stated for the left
  twist, with the opposite sign". My computation on `ℝ²/ℤ²` gives `b − a` for the left twist about
  `a`, which agrees with the README's mathematics and with MordellLawrenceVenkatesh §5.12. I recall
  the printed formula as `[b] + k·î(a, b)[a]`, which is the README's own formula, not its opposite;
  the parenthesis should be checked against the printed page by someone who holds the book.
- Steenbrink–Zucker, Definition 3.4, named in S02's repair text, is taken from LL24 line 1013 and
  was not opened.
- The remaining Layer 5, 7 and 10 locators that round 1 verified (Dri18, Dri12, Moc06, Sch19,
  LLSS20, EG18 line 410, most of KP20) were not reopened this pass.
- MixedHodgeModulesAndIrregularHodgeTheory was read in this board checkout, not at the head of its
  own pull request.
- `packages/SurfaceGroupCharacterVarieties` is a design-stage package that plans mapping class
  groups of punctured surfaces; ownership of §§0.2–0.4 against it cannot be settled before its
  design is accepted.
- No Lean was elaborated (read-only pass); the comparison of signatures used the worker's table.
- Truth of the deep source theorems beyond their statements, hypotheses and boundary cases.

## Source issues

Only what I read in the texts this pass; round 1's lists stand for the rest.

- **Misprint** in LL24 at Lemma 7.2.5, p. 36: the source says the cover with boundary circles shrunk to punctures has genus `g`; it should be the genus `g′` of the cover; affects a stated result.
- **Error** in AS16 at proof of Lemma 2.5, printed p. 11: the source says the induced representation restricts to the finite-index subgroup as a sum of copies of the original one; it should be that the original is a direct summand of the restriction; affects the proof.
- **Misprint** in LL24 at proof of Corollary 9.1.4, p. 46: the source says the finiteness of integral variations on a very general curve is Corollary 1.2.7 of the isomonodromy paper; it should be Theorem 1.2.5 there; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4b7d4fa04d1c854f54b1c8b37f22c265830eaa98", "job": "RT-MappingClassGroupsAndCanonicalRepresentations~2a", "model": "fable", "worker": "chris-x15"} -->
