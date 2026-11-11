<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13100#issuecomment-6793661060 -->
Red team round 2 pass b (claude) of 4b7d4fa

Verdict: needs_changes

1. **F01** (P2) admissibility of real variations uses a limit filtration that no supplier or target defines outside quasi-unipotent monodromy

   - **Location.** `packages/MappingClassGroupsAndCanonicalRepresentations/README.md:1667–1673`: "the
     Hodge bundles extend to subbundles of the canonical extension inducing the limit Hodge filtration
     on each `gr^W_k`, and the relative monodromy filtration … exists"; `:532–539`; *Needs* `:1697–1699`.
   - **Claim.** Conditions (a) and (b) of MixedHodgeModulesAndIrregularHodgeTheory §3.3, read with real
     coefficients, define admissibility for the real variations of §5.4.
   - **Witness.** That §3.3 is stated for "quasi-unipotent monodromy" and its (a) is "the limit
     filtration of 3.2", which exists only for a "rationally polarized variation … with quasi-unipotent
     monodromy" (`packages/MixedHodgeModulesAndIrregularHodgeTheory/README.md`, §§3.2, 3.3). §5.4's
     variations are not quasi-unipotent: with `W` the rotation system of the first Check of §4.5
     (`1 ↦ exp(2πi√2)`), `V_ℝ = π°^* W_ℝ` gives `R¹π°_* V_ℝ = R¹π°_* ℝ ⊗ W_ℝ`, whose local monodromy
     has eigenvalues `exp(±2πi√2)` times roots of unity.
   - **Repair.** In §5.4 replace "and *admissible* when … §3.3's admissibility." (`:1667–1673`) by:

     "The local monodromy of such a variation along a punctured disc need not be quasi-unipotent: for
     `V_ℝ = π°^* W_ℝ` with `W` the rotation system of the first Check of §4.5,
     `R¹π°_* V_ℝ = R¹π°_* ℝ ⊗ W_ℝ` has local monodromy with eigenvalues `exp(±2πi√2)` times roots of
     unity. Prove the limit theorem in this generality: for a polarizable pure real variation of weight
     `k` on `Δ^*` the monodromy is `T = T_s T_u` with `T_s` semisimple with eigenvalues of absolute
     value one and `T_u` unipotent; with `N = (2πi)⁻¹ log T_u`, the Hodge bundles extend to holomorphic
     subbundles of the canonical extension with residue eigenvalues of real part in `[0, 1)`
     (*Conventions*), their fibre at `0` is the limit filtration `F_lim`, and with the monodromy
     filtration `M(N, k)` it is a real mixed Hodge structure for which `N` has type `(−1, −1)`
     (Steenbrink–Zucker, Definition 3.4 and §3, as cited at LL24 line 1013; for rationally polarized
     variations with quasi-unipotent monodromy this is MixedHodgeModulesAndIrregularHodgeTheory §3.2).
     The variation is *admissible* when, along every holomorphic map from a disc sending the punctured
     disc into the base, the Hodge bundles extend to subbundles of that canonical extension inducing
     `F_lim` on each `gr^W_k`, and the relative monodromy filtration of `N` with respect to `W`
     (LefschetzPencilsAndVanishingCycles §1.5) exists; no quasi-unipotence is assumed. For rational
     variations with quasi-unipotent monodromy these are conditions (a) and (b) of
     MixedHodgeModulesAndIrregularHodgeTheory §3.3."

     Add "MixedHodgeModulesAndIrregularHodgeTheory §3.2; LefschetzPencilsAndVanishingCycles §1.5" to the
     *Needs* of §5.4, to Layer 5's *Dependencies* and to the supplier subsection at `:523–539` (replace
     "which involve only the complexified local system, `F`, `W` and the local monodromy" by "§5.4
     states the limit filtration for monodromy with eigenvalues of absolute value one as its own
     target"), add the limit theorem to the ownership list at `:63–66`, and add the Check: "For the
     rotation system `W_ℝ` on `Δ^*` (weight `0`, type `(0, 0)`, `T` the rotation by `2π√2`): `T_u = 1`,
     `N = 0`, `F⁰` is the whole bundle and extends, and the limit is pure of weight `0`;
     MixedHodgeModulesAndIrregularHodgeTheory §3.2 does not apply since `T_s` has infinite order."
     Both suppliers precede this roadmap (merge order lines 69 and 261). Tested on the witness: the
     repaired definition applies to `R¹π°_* ℝ ⊗ W_ℝ`; the original refers to an undefined `F_lim` there.

2. **F02** (P3) §5.11's finiteness criterion says "every complex embedding", and its own Check then refutes it

   - **Location.** `README.md:1987–1989`: "a representation `Γ → GL_m(O_K)` which is unitary at every
     complex embedding of `K` has finite image"; Check `:2001–2003`: "unitary at the two complex
     embeddings and of infinite image, and is not unitary at the real embeddings".
   - **Witness.** With "complex embedding" in the Check's sense (non-real), the Salem character
     (`x⁴ − x³ − x² − x + 1`, `y² − y − 3 = 0`, `λ ≈ 1.722`) satisfies the hypothesis and has infinite
     image. LL22 line 1910 has "each embedding `ι : K ↪ ℂ`"; §§7.6–7.7 say "every embedding".
   - **Repair.** `:1987–1988`: "which is unitary at every embedding `K → ℂ`, the real ones included,
     has finite image". `:2002–2003`: "is integral, unitary at the two non-real embeddings and of
     infinite image, and is not unitary at the two real embeddings (`|λ| ≠ 1`)". On the witness the
     repaired hypothesis fails at the real embeddings, as it must.

3. **F03** (P3) `Mod(T²) ≅ GL₂(ℤ)` in §0.2 contradicts the `Mod` of *Conventions*

   - **Location.** `README.md:640`: "`PMod(1, 0, 0) ≅ SL₂(ℤ)` inside `Mod(T²) ≅ GL₂(ℤ)`"; *Conventions*
     `:171–172`: "`Mod(Σ)` is the group of isotopy classes of orientation-preserving homeomorphisms".
   - **Witness.** By `:171` and `:635` (`Mod(g, b, p)` is MordellLawrenceVenkatesh's, orientation
     preserving), `Mod(Σ_{1,0}) = Mod(1, 0, 0) = SL₂(ℤ)`; `:640` gives `GL₂(ℤ)` for the same symbol.
   - **Repair.** `:639–640`: "for `b = 0` GeometricTopology's `Mod(Σ_g)` also contains the
     orientation-reversing classes, which the `Mod` of *Conventions* and of MordellLawrenceVenkatesh
     §5.9 excludes (for the torus, `PMod(1, 0, 0) = Mod(1, 0, 0) ≅ SL₂(ℤ)`, of index two in
     GeometricTopology's `Mod(T²) ≅ GL₂(ℤ)`)." Line 311 is inside the GeometricTopology contract and
     needs no change.

Round 2. Three new findings (S01 P2, S02 P3, S03 P3). S01 and S03 are defects of round-1 repairs;
S02 was missed in round 1. No finding re-raises one settled as not actionable (the repair report
marks none so). No Lean was elaborated (read-only pass); no repair below changes `Suggested.lean`.

## Round-1 findings at this head

| Finding | Status | Witness at 4b7d4fa |
|---|---|---|
| 1a/F01 = 1b/F02 (`Mod` vs `Mod⁺`) | repaired, with a notational clash (S03) | `README.md:638–640` "GeometricTopology §1.7.2's `Mod⁺(Σ_{g,b})` … equal to its `Mod(Σ_{g,b})` when `b ≥ 1`"; `:316–323` Lickorish for `Mod⁺`, "Only `Mod⁺` is consumed"; `:775–776`. Torus: `SL₂(ℤ)` both sides |
| 1a/F02 (rank two absent) | repaired | `Suggested.lean:227–231` `rankTwo_mcgFinite_finite_image (hg : 2 ≤ g)`; `README.md:3015–3019`; BGMW17 line 53 (`g ≥ 2`, `n ≥ 0`, semisimple, pure group line 48), CH19 lines 268–274 (case (2) only for `g = 1`) |
| 1a/F03 (closed-orbit Check) | repaired | `README.md:2434–2439` "The common orbit on the dense open `t ≠ 0` is that of `A(1)`, which is not closed"; ranks `1`, `0` |
| 1a/F04 (lost conjugation) | repaired | `README.md:1682–1688` "complex-antilinear isomorphism `c_V : H_V → H_{V^∨}` … `c_V` carries `H^{i,j}_V` onto `H^{j,i}_{V^∨}`"; Check `:1705–1708`; LL24 lines 1044–1060 |
| 1a/F05 (finiteness in docstrings) | repaired | `Suggested.lean:150–155` "When `H` is finite and `ϕ` is surjective … For an infinite quotient it is only this algebraic subspace"; `:132–133`; Check `README.md:2082–2086` |
| 1a/F06 (stabilizer Checks) | repaired | `README.md:2074–2081`: `h = 1`; `h = φ(x)`; `−I`, `2 ≠ 1` in `ℤ/3` |
| 1a/F07 (instance docstring) | repaired | `Suggested.lean:80` |
| 1a/F08 (quantum examples) | repaired in the README; not added to Lean, with a reason I accept | `README.md:3030–3033` "there is a real constant `C > 1` such that for every `g ≥ 2`"; KS16 lines 546–554 (one `p` for all genera, bound `C^g`). It is the source's Example 10.2.4, not an end theorem of the Summary; the module docstring `Suggested.lean:52–54` says the Layer 12 examples stay in the README |
| 1a/F09 = 1b/F03 (degree form of Putman–Wieland) | repaired | `Suggested.lean:176–184`; LL24 lines 1481–1482; `H = ℤ/5`, `g = 2`: `d = 1 < 2` |
| 1a/F10 (kernel cover) | repaired | `README.md:1351–1357`: `ρ̄ ∘ Φ` on the genus-`g` family; cover genus `1 + 3(2 − 1) = 4` only trivializes |
| 1a/F11 = 1b/F07 | repaired | `README.md:1774–1780` (`1 < 2` at `g = 2`, `rk W = 1`); `:1732–1738` (`ρ = g`, `1 ≥ 0`; rank one `ρ ≥ g − 1`) |
| 1b/F01 (real variations of mixed Hodge structure) | partly repaired: S01 | definitions and suppliers added at `README.md:1659–1673`, `:523–539`; the admissibility clause still rests on an object with no owner in the case real coefficients were introduced for |
| 1b/F04 (pinned transgression) | repaired | `README.md:263–274`, `:826–845`; pin: `Transgression.lean` 147 (`IsTransgressionLift`), 354 (`cocycle`), 393 (`cocycle_sub_mem_B2`), `[CompactSpace G]` at 577, `[TotallyDisconnectedSpace G]` at 696, `fiveTerm_exact_H1N` 779, `fiveTerm_exact_H2Q` 823; `FiveTerm.lean` 56 |
| 1b/F05 (closed torus in §8.3) | repaired | `README.md:2448–2450` "For `g < 3` the bound gives `r = 1` … §3.3, which covers the closed torus" |
| 1b/F06 (§2.2 Check) | repaired | `README.md:1065–1067` "over a point … A base with two points is excluded by connectedness" |
| 1b/F08 ("admissible" twice) | repaired | `README.md:1840–1843` "*determinant-finite* … Drinfeld's category `T_λ(X₀)`"; Dri18 lines 1164–1167; no "admissible" left in §§5.9a–5.10 |

## Dependency check

```text
depcheck: 237 roadmaps, 2158 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The suppliers S01 adds are earlier in the merge order.

## Pass record

| Statement | Instances | Values | Result |
|---|---|---|---|
| `surfaceGroup`, `peripheralLoop` | `(0,0)`, `(0,1)`, `(0,2)`, `(1,0)`, `(1,1)` | `1`; `1`; `ℤ`, `c₂ = c₁⁻¹`; `ℤ²`; `F₂`, `c₁ = [a,b]⁻¹`; `(ab)⁻¹[a,b]⁻¹(ab) = b⁻¹a⁻¹ba` | sound |
| `pureMappingClassAut` | `n = 0`; `(0,2)` inversion; `(1,1)` | all of `Aut`; excluded; fixes the class of `[a,b]⁻¹`, acts as `SL₂(ℤ)` on `H₁` | sound; larger than the topological image only for `n = 0`, which strengthens hypotheses |
| `HasFiniteConjugacyOrbitUnder` | `r = 0`; `H = ⊥`; unipotent `[[1,f],[0,1]]`, genus 2 | one class; `S = {ρ}`; infinitely many lines | sound |
| `mcgFinite_finite_image` | `g = 0`; `(1,0), r = 1`; `(1,1), r = 1`; `(1,2), r = 1`, `χ(c₁) = 2`; `(1,1), r = 2` | `r = 0`; torsion by two transvections; same; `χ(T_γ^k b) = 2^k` for `[γ] = a + c₁`, orbit infinite, hypothesis false; `4 ≥ 2` outside, trace triple `(λ+λ⁻¹, 0, 0)` has orbit of size 3 | true as typed |
| `freeGroup_finite_image` | `N = 0, 1`; `N = 2, r = 1`; `N = 2, r = 2` | `r = 0`; torsion pairs only; `4 ≥ 2` outside (the §12.5 pair is `Out(F₂)`-finite, infinite image) | true; consistent with §12.8 |
| `prymStabilizer`, `compactPrymCohomology` | `H = 1`, `(2,0)`, `(2,1)`, `(2,2)`; inner `c_x`; `φ → ℤ` | dim `4`, `4`, `4` (of `4`, `4`, `5`); `h = φ(x)`, acts trivially on `Hom(ker φ, ℂ)` for `x ∈ ker φ`; infinite-dimensional | sound |
| `putmanWieland_of_irreducible_dim_lt` | `g ≤ 1`; `H = 1`, `g = 2`; `ℤ/5`, `g = 2`; `S₃`, `g = 2, 3`; `d = 0` | `d = 1 ≥ g` vacuous; fixed line would have dim `1 < 2g − 2 = 2`; `1 < 2`; `2 < 2` false, `2 < 3`; not irreducible (`IsSimpleOrder` needs nontrivial) | true; `Γ′ ∩ im Γ` has finite index in `Γ`, so implied by §6.6 |
| `putmanWieland_of_card_lt` | `g = 0, 1`; `ℤ/2`, `g = 2`; `#H = g²` | no `H`; `2 < 4`, dims `4 + 2`, bound `2`; not asserted | true |
| `rankTwo_mcgFinite_finite_image` | `g = 1`; `g = 2, 3`; reducible non-split, `g ≥ 2`; irreducible | §12.5: `bab⁻¹ = a⁻¹`, infinite image, excluded by `hg`; `4 ≥ 3, 4`; extension class spans a `Γ′`-stable line in open `H¹` of the cover, `1 < 2g − 2` contradicts §6.5 (agrees with CH19 Theorem B); `det` finite, square root exists on free abelian `H₁`, BGMW17 Theorem A | true |
| §0.3 twist | torus, `î(a,b) = 1` | `T_a[b] = [b]+[a]`, `[[1,1],[0,1]]`; `T_b[a] = [a]−[b]`, `[[1,0],[−1,1]]` | sound |
| §0.4 capping | `(0,1,2)`, `(0,2,1)`, `(0,3,0)`, `(1,1,0)`; `(0,2,0)`, `(0,1,1)` | kernels `ℤ`, `ℤ²`, `ℤ³`, `ℤ`; `2g−2+b+p = 0`, excluded | sound |
| §0.5 | `g = 1`: `r = 0`, `r ≥ 1`; `g = 2`; `g ≥ 3` | `ℤ/12`, `ℤ^r`; `ℤ/10`; `0` (Kor02 lines 357–359, pure group lines 17–19) | sound |
| §1.2 | `r = 1`; `ℤ ⊃ 2ℤ`, `ρ_N(2) = −1`, `D = μ₂, μ₄` | `μ_D = D`; `H²(ℤ/2, D) = D/D²`: `−1 ≠ 0`, `= 0` | sound |
| §1.4 | `Γ = ℤ/2`, `r = 2`, `χ = 1` | `A² = 1`, `det A = 1` ⇒ `A = ±I`; tangent `2X = 0`; ring `ℂ × ℂ` | sound |
| §1.5 | `u^m l^m`, `l^m u^m` | `[[1+m², m],[m,1]]`, `[[1,m],[m,1+m²]]`; equal iff `p ∣ m` | sound |
| §3.4 Check | `Q₈ × C₂` | image of `Q₈` in `PGL₂` is the Klein four-group, self-centralizing | sound |
| §4.4 | `G = N × ℤ`, `2^k σ(n)` | `c(g)^r = \|det ρ(g)\|² = 1` forces `c = 1`; fails for `2^k` | sound |
| supplier gap example | `A = ℂ[x,y]/(x,y)²`, monodromy `1 + x` | `ker x = 𝔪_A` (dim 2); `𝔪_A ⊗ A/𝔪_A` dim 2; `H⁰(ℂ) = 1` | sound |
| §5.1 Check | `B = (−1, 3)/ℚ` | `i² = −1`, `j² = 3`, `ij = [[0,3i],[−i,0]] = −ji`; ramified at `3` (`−1` non-residue), split at `∞`, hence at `2` | sound |
| §5.2 Checks | `ℙ¹∖{0,∞}`; `O ⊕ O(1)`, `D = x` | `−1 + a + (1−a) = 0`; par-deg `1 + a`, slope `(1+a)/2 < 1` | sound |
| §5.3 Checks | `O(p) ⊕ O(−p)`; `L ⊕ O` coarsened | residues `∓1`; flat lines: `O(p)` or saturation `≅ O(−p)` (`a z² f₁ + b f₂`); par-deg `−a`, `0 > −a/2`; trivial structure `0 > −1/2` | sound |
| §5.3 Deligne-extension item | `∇`-stable `F` | `par-deg F⋆ = deg F + Σ Re tr Res = 0` | sound |
| §5.4 | trivial `V`, `n ≥ 2`; rotation system pulled back from `M` | `dim F¹ ∩ F̄¹ ≥ 2(g+n−1) − (2g+n−1) = n − 1`; eigenvalues `exp(±2πi√2)` | S01 |
| §5.5 rank lemma | rank one | `ρ = g − 1 − deg E + h⁰(E) ≥ g − 1`; LL24 lines 1274–1279 | sound |
| §5.7 | `u(2g − 2u) ≥ g`, `1 ≤ u ≤ g − 1` | `u = 1`: `2g − 2 ≥ g` iff `g ≥ 2`; `u ≥ g`: `uw ≥ g` | sound |
| §5.9a Check | `SO(4)` pair | char. poly `(x²+1)(x²−x+1)` both; traces `1 ∓ √3` | sound |
| §5.11 | Salem polynomial | `y = (1 ± √13)/2 ≈ 2.303, −1.303`; `λ ≈ 1.722`; two real, two non-real embeddings | S02 |
| §6.1 Check | `A = [[0,−1],[1,−1]]` | `A² = [[−1,1],[−1,0]]`, `A³ = I`; `J⁻¹A^{−T} = AJ⁻¹ = [[−1,0],[−1,−1]]` | sound |
| §7.1 | separating `γ`, `g ≥ 3`; multitwist not factorwise in `Γ` | a side of genus `≥ 2`; `μ^N` has factors in `Γ`, `N` bounded by the index | sound |
| §9.2 | `ab ≤ r²/4 < (g+1)/4` | `3ab < 3(g+1)/4 ≤ 2g` iff `g ≥ 3/5`; `a = b = 1`: `2g − 2 > 1` | sound |
| §9.6 Check | `P = I + E₂₁` | `P(I+E₁₃)P⁻¹ = I+E₁₃+E₂₃`; `P(I+E₂₃)P⁻¹ = I+E₂₃` | sound |
| §10.1 | `K` transcendental over the function field `F` of `M_{g,n,ℚ}` | `F̄ ∩ K` finite over `F`, so `Γ_K` has open image | sound |
| §11.6 | `R[1/p] = 0`, `R ≠ 0` | `p` nilpotent, so a zero divisor: not flat; `ℤ_p[[x]]/(p)` complete intersection | sound |
| §12.2, §12.3 | `g = 2`; `(g, n) = (1,1)`; `(0,4)` | `dim ∧³H = 4`; `2g − 3 + n = 0`, commutative; `a ⊗ x − x ⊗ a ≠ 0` in `H ⊗ H`, `dim H = 2` | sound |
| §12.7 | semisimplification | finite image would make a finite-index subgroup of a nonabelian free group nilpotent | sound |
| §0.2 line 640 | torus | `SL₂(ℤ)` (Conventions) vs `GL₂(ℤ)` (line 640) for `Mod(T²)` | S03 |

## Verified sound

- **Declarations read: 13 of 13** (`Suggested.lean`, all 233 lines: 7 definitions, the `Group`
  instance, 5 theorems), each against the worker's elaborated signature; the file has no `variable`
  block, so no binder can be lost. Single `import Mathlib`, no `set_option`, no sorry'd data,
  `theorem` only, a docstring on every declaration, module docstring naming the headlines that are
  not statable with the missing carrier. One-tactic probe: no padding (`putmanWieland_of_card_lt`
  needs the degree-square identity and the passage from a representation on `Fin d → ℂ` to a row of
  the character table, and is the source's Theorem 1.4.1).
- **README targets read: all 85 numbered sections (131 third-level headings) and all 3237 lines; 85
  Check blocks.** Every Lean
  name occurs in the README and every own backticked name is declared; generality agrees
  (§§6.6, 6.7, 9.3, 9.7, 12.6 state the algebraic forms with the containment argument).
- **Locators verified this round against the cached texts: 24.** LL24 lines 120–126, 154–155,
  161–162, 179–184, 1004–1013, 1015–1024, 1044–1060, 1067–1072, 1086–1091, 1274–1279, 1283–1288,
  1473–1476, 1481–1482, 1490, 1496–1499, 2192–2200; LL22 lines 100–107, 1908–1911; BGMW17 lines
  48, 53–55, 62–64; CH19 lines 56–60, 176–180, 268–274, 605–614; KS16 lines 528–532, 546–554; Kor02
  lines 14–19, 357–359; Dri18 lines 1164–1171. The 52 locators of pass 1b were not reopened.
- **Checks recomputed: 41** (the table above).
- **Pinned declarations grepped: 27**, all present where cited: Mathlib `FundamentalGroup.mul_def`
  (`q.trans p`), `Representation.IsIrreducible.bijective_or_eq_zero`, `LinearMap.bijective_or_eq_zero`,
  `isotypicComponent`, `Representation.ind`, `groupCohomology.H1InfRes_exact`, `Subgroup.relIndex`,
  `Representation.IsSemisimpleRepresentation`; Tau Ceti `H1ConjInvariants`, `IsTransgressionLift`
  with `.cocycle` and `.cocycle_sub_mem_B2`, `transgression`, `fiveTerm_exact_H1N`,
  `fiveTerm_exact_H2Q` (compact, totally disconnected), `HInfRes_exact`, `mono_HInfRes_f`, `socle`,
  `isSemisimpleModule_socle`, `sum_characterDegree_sq_eq_card`,
  `ContRepresentation.IsUnitary.isSemisimpleRepresentation`, `IsAspherical`,
  `IsProjectiveRep.cohomologyClass_eq_zero_iff`, `isProjectiveRepEquivExtensionHom`,
  `MonoidHom.exists_isProjectiveRep_toPGL_eq`, `LocalCoefficientSystem.monodromyRepresentation`,
  `LocalCoefficientSystem.pullback`.
- **Sibling citations checked this round: 9 sections in 5 roadmaps.** ShimuraData §3.1 at its open
  head (`Variation`, real or rational); MixedHodgeModulesAndIrregularHodgeTheory §§3.1, 3.2, 3.3, 5.6
  in the board checkout; LefschetzPencilsAndVanishingCycles §1.5 at its open head;
  FiniteGroupInvariants §10.5 (`jordanBound 1 = 1`); GeometricTopology §1.7.2. The resolver's two
  leads are not defects: `StableCurves.Mbar` is a planned name of SchemeAndStackFoundations §4.15,
  and MixedHodgeModulesAndIrregularHodgeTheory is a board package (merge order line 261) that the
  resolver does not index. The overlap listing reports no pull request changing this roadmap and no
  dropped id.
- **Declared gaps:** the three slugs of `design/plan.json` match the three "must provide"
  paragraphs, each with hypotheses and a named earlier supplier.
- **Policy:** the pull request changes only the package folder (7 files); no pull-request numbers
  or process narrative in the README or docstrings; no never-cite roadmap is cited.
- **Ownership by object:** `roadmaps grep` for Putman–Wieland, MCG-finite, higher Prym and
  `pureMappingClass` finds no other owner on main or at the open heads.

## Not verifiable

- The thirteen works settled as uncertified (MS80, SZ85, Mor93, Nie24, Deb01, PS08, Del70, FM12,
  Tim87, Wat89, Kat96, CR62, MKS04). In particular Steenbrink–Zucker, Definition 3.4, cited in S01's
  repair, is taken from LL24 line 1013 and was not opened.
- The truth of the real-coefficient statements of §5.4 beyond their definitions (LL24's proof at
  lines 1034–1043 goes through real mixed Hodge modules, for which no roadmap is an owner).
- MixedHodgeModulesAndIrregularHodgeTheory was read in the board checkout, not at the head of its
  own pull request.
- `packages/SurfaceGroupCharacterVarieties` is still at the design stage and not in the merge
  order; whether §§0.2–0.4 move there cannot be settled now, and nothing is raised.
- No `#check` was run (no Lean in this pass); the comparison used the worker's signature table.
- Deep targets taken from the sources (Layers 5, 7, 8, 10) beyond statements, hypotheses and
  boundary cases.

## Source issues

- **Misprint** in LL24 at Lemma 7.2.5, p. 36: the source says the cover obtained by shrinking boundary circles to punctures has genus `g`; it should be the genus `g′` of the cover; affects a stated result.
- **Gap** in LL24 at Corollary 1.2.3, p. 4: the source says the isomonodromy criterion holds for every pointed curve, quoting a theorem that assumes `2g − 2 + n > 0`; it should assume the hyperbolic range; affects a stated result.
- **Gap** in LL24 at §4.1, p. 24: the source says admissibility for real variations is analogous to the rational case; it should say which limit filtration is meant when local monodromy is not quasi-unipotent; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "4b7d4fa04d1c854f54b1c8b37f22c265830eaa98", "job": "RT-MappingClassGroupsAndCanonicalRepresentations~2b", "model": "fable", "worker": "chris-x8"} -->
