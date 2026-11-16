<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6908476950 -->
Red team round 2 pass b (claude) of d677463

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §7.4(b): the added opens are not "distinct from those carrying the other conditions" merely because they avoid 2, 3, 5

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1542-1544`: "with
   `Ω_w` at every place of `L` above `w ∈ Σ`, places of residue characteristic other than `2, 3, 5` and so
   distinct from those carrying the other conditions."

   **Claim.** The conditions the selection imposes for `seed_modular` and the partition sit only above
   `2`, `3` and `5`.

   **Witness.** AKT23 lines 3704–3706 (Proposition 9.13): the seed curve is also required to have good
   reduction, with one fixed reduction, at every place above an auxiliary rational prime `l > 5`, which is
   what makes its mod-three representation decomposed generic over `L(ζ₁₂, (Δ/Δ^c)^{1/6})`, a hypothesis
   of the parent's `seed_modular`. So there are conditions at residue characteristic outside `{2, 3, 5}`.
   Instance: `Σ` above `q = 11` (the case of §7.5) and `l = 11` would ask a place of `Σ` to be split
   multiplicative and good. The conclusion of (b) stands, because AKT23 lines 3488–3494 (proof of
   Lemma 9.7) choose `l` after, and prime to, an arbitrary prescribed finite set of places; that reason is
   not the one given, and AKT23 Lemma 9.7 is not cited.

   **Repair.**

   1. Replace the quoted clause by: "with `Ω_w` at every place of `L` above `w ∈ Σ`. These places have
      residue characteristic other than `2, 3, 5`, so none of them carries the Tate, discriminant or
      partition conditions. The selection also prescribes good reduction, with one fixed reduction, at
      every place above an auxiliary rational prime `l > 5`, which makes the mod-three representation of
      `A'` decomposed generic as `seed_modular` requires; every sufficiently large `l` split in a fixed
      finite extension serves, so `l` is taken prime to the residue characteristics of `Σ` (AKT23,
      Lemma 9.7 and its proof, p. 75, lines 3470–3510, where the prescribed set of places is arbitrary
      and `l` is chosen prime to it; Proposition 9.13, pp. 79–80, lines 3684–3708)."
   2. Add to the Checks of §7.4: "The mod-three seed carries conditions outside `2, 3, 5`: good
      reduction with a fixed reduction at every place above its auxiliary prime `l`. For `Σ` above
      `q = 11`, `l = 11` would ask a place of `Σ` to be split multiplicative and good at once; `l` is
      chosen after `Σ`, so `l ≠ 11`."
   3. References, AKT23 entry: add "Lemma 9.7, p. 75 (line 3470); Proposition 9.13, p. 79 (line 3684)";
      extend the `locator` and `cited_for` of the AKT23 entry of `sources.toml` accordingly.

   Tested on the refuting instance: with `l` prime to `11`, no place of `L` carries both an `Ω_w` of `Σ`
   and the good-reduction condition at `l`, and the places above `2, 3, 5` are disjoint from both.

2. **F02** (P3) `K^P(Q)` and "diamond kernel" are used in §5.3 and never defined

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1149` ("the derived
   Hecke image … at the level `K^P(Q)`"), `:1158`, `:1162` ("`K^P(Q)` is hyperspecial on `P^c`"), and
   `:1185` ("the Iwahori subgroup, of index `q_w + 1 = 12`, and its diamond kernel, of index
   `12 · 5 = 60`").

   **Claim.** The level at Taylor–Wiles places is a defined object of Layer 5.

   **Witness.** §5.1 (line 1082) defines only `K^P`; no line defines `K^P(Q)` (every occurrence of `K^P`
   is at lines 235, 1082, 1086, 1130, 1149, 1158, 1162, 1202). "Diamond kernel" occurs once in the README
   and in no supplier: CrystallineLocalGlobalCompatibilityCM §9.6 writes `K₀(Q)`, `K₁(Q)` and
   `Δ_Q = ∏ k_v×(p)`. The statement of Theorem 5.3 therefore names a Hecke algebra at an undefined level.

   **Repair.**

   1. Add to the bullets of §5.2: "For a Taylor–Wiles datum `Q`, `K^P(Q)` denotes the pair of levels
      `K^P_1(Q) ⊂ K^P_0(Q) ⊂ K^P`, equal to `K^P` outside `Q`; at `w ∈ Q`, `K^P_0(Q)_w = Iw_w` and
      `K^P_1(Q)_w` is the kernel of `Iw_w → k_w× → Δ_w = k_w×(5)`, `(a b; c d) ↦ a/d mod ϖ_w`, so that
      `K^P_0(Q)/K^P_1(Q) ≅ Δ_Q`. These are the groups `K₀(Q)`, `K₁(Q)` of
      CrystallineLocalGlobalCompatibilityCM §9.6 for the level `K^P`, and an object 'at the level
      `K^P(Q)`' is that of the complex `C•(K^P_0(Q)/K^P_1(Q), O(χ⁻¹))` localized as in that section."
   2. In the fourth Check of §5.3 replace "by the Iwahori subgroup, of index `q_w + 1 = 12`, and its
      diamond kernel, of index `12 · 5 = 60`" by "by `K^P_0(Q)_w = Iw_w`, of index `q_w + 1 = 12`, and
      `K^P_1(Q)_w`, of index `12 · 5 = 60` (`#k_w× = 10`, so `Δ_w` has order five)".

   Tested: for `q_w = 11`, `#ℙ¹(𝔽₁₁) = 12`, `#k_w× = 10`, five-part `5`, index `60`; for `v ∈ P^c`,
   `K^P_0(Q)_v = K^P_v = PGL₂(O_{F_v})`, which is what line 1162 asserts; `Iw_{w,1} ⊆ K^P_1(Q)_w ⊆ Iw_w`,
   as ACC23 line 2337 requires of the Iwahori-type places.

Two findings, both P3 (S01, S02). No P1 or P2 finding survived the checks recorded below. The six
findings of round 1 are repaired at this head and no repair introduced an error.

## Round 1 findings at this head

| Finding | Status | Witness at `d677463` (`packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md`) |
|---|---|---|
| 1a/F01 (P3), §4.2 irreducibility of `ad⁰` unowned | repaired | lines 983–987: "`M ⊗ k̄` is the module `ad⁰ ⊗ k̄` of `SL₂(𝔽₅)`, which ArithmeticGaloisRepresentations §7.2 identifies with `(Sym² V)^∨ ⊗ det V` … `Sym² V` is absolutely irreducible … by its §7.8". Supplier checked: §7.2 states `ad⁰ ≅ (Sym² ρ)^∨ ⊗ Dρ` for rank two; §7.8 states `Sym^a` absolutely irreducible for `0 ≤ a ≤ p − 1`. `*Needs:*` (line 1001), Layer 4 Dependencies (line 1062) and the contract bullet (line 399) carry §§7.2, 7.8. |
| 1a/F02 (P3), §8.1 non-CM from an unowned fact | repaired | lines 1637–1638: "`A_t` is geometrically non-CM by the last clause of (S2), `t` being a switch parameter (the parent's §7.4(3))". Parent §7.4 output 3 reads "`A_t` is non-CM" for arbitrary number fields; §7.4 is in `*Needs:*` (line 1646) and Dependencies (line 1668). |
| 1b/F01 (P2), switch parameter defined by provenance | repaired | lines 149–171: "A *switch parameter* for `(K, E, p)` is a point `t ∈ U(K)` with the following three properties. (S1) … (S2) … (S3)", with an existence paragraph and four Checks (lines 175–191). Each clause checked against the parent's §6.5 `local_type_opens` and §7.4 items 1–3 and API. |
| 1b/F02 (P2), §7.4 cited the parent for a statement it does not make | repaired, with one residual slip (S01) | lines 1507–1512 state (a) the preparation with `Σ` split; lines 1521–1538 prove it from GL2ModularityLifting §1.7, whose statement (any number field, `D/F` finite Galois, real places prescribed) was read. The route of (b) has a false justification: S01. |
| 1b/F03 (P3), "width-three" undefined | repaired | no occurrence of "width" in the README; heading line 1397 "7.1 The multiplicative degeneration of type I₃". The plan summary in `design/plan.json` still says "width-three" (outside the README; not a finding). |
| 1b/F04 (P2), §7.1(b)–(c) followed its source clause by clause | repaired | lines 1402–1412 are organised by the quotient's special fibre (components `E'`, `Z`; node orbits `1 + 2`; dual graph; one blow-up). Against CaptainSude26 lines 512–516: longest shared run 3 words ("of thickness one"); the genus-zero and orbit arguments (lines 1414–1419) are not in the source. |

## The pass (values computed)

`Suggested.lean`: 0 declarations (one `import Mathlib`, the namespace opened and closed, no
`set_option`, no `sorry`); the declaration table is empty and there is no signature to compare with
`#check`. README targets: 27, plus the switch-parameter definition.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, tame relation | `q_v = 11, 7` over `𝔽₅` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ = 3`, geometric lift gives `U³` | arithmetic convention pinned |
| Conventions, `Ad(U)` and Gram | `e, h, f` | `Uh U⁻¹ = h − 2e`; `Uf U⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram determinant `−2` | as stated |
| Switch parameter (S1)–(S3) | CM `A_t`; `t` near `R_*` above 3; extra opens above `q` | `[[1,3],[0,1]][[1,0],[3,1]] = [[0,3],[3,1]]`, reverse `[[1,3],[3,0]]`; `D ⊇ K(μ₃ₚ, ζ₅)`; `1/j` small at small `s` | clauses match parent §6.5, §7.4(1)–(3), API; definition excludes CM `t` |
| 1.1(a),(b) | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(i,√3,√5)`; `ℚ(2^{1/3})(ζ₃)`; `S = {1,2}`; `S = {4}` over `ℚ(√−3)` | `{1,9,13,17}` cyclic of order 4; seven quadratic subfields, roots of unity `μ₁₂`; `S₃`, centre trivial; `L = K`; `ℚ(ζ₁₂)` | true; `K` CM needed |
| 1.2 | `F = K`; `1 ⊕ 1` over `𝔽₃`, `q = 2`; over `ℚ(ζ₃)` | `F_w = K_v = ℚ_q`; ratio `1 ≠ 2`; split primes `≡ 1 mod 3`, ratio `1 = q` | true; converse fails |
| Layer 1 example | `{1, 29} ⊂ (ℤ/60)ˣ` | `29 ≡ 1 (4)`, `≡ −1 (15)`, `≡ 4 (5)`, `≡ 2 (3)`; degree `16/2 = 8` | `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` |
| 2.1 | `K₆₀`; imaginary quadratic | CN23 Theorem 6.1 hypotheses: `ζ₅ ∉ F`, mod 5 decomposed generic and irreducible on `G_{F(ζ₅)}` (line 4513) | parent §5.3 applies over `K`, not `F` |
| 2.2 | rows of the table | lifting primes `p, 3, p`; residual pairs `(3,p)`, `(p,3)`, `V₁` mod `p`; `χ_(h(t))² = 1` | (S2) covers each row; clause (4) of CN23 5.2 never met |
| 2.3 | split multiplicative `q_v = 4`; good `q = 4, a = 4`; `ℚ(ζ₈)`, `z = i` | `(1−T)⁻¹` against `((1−T)(1−4T))⁻¹`; roots `2, 2`, unitary `1, 1`; `diag(i, −i)`; potentially good with ramified inertia: `V^I = 0` | agrees with Mathlib `localPolynomial` (`1 − X`, `1 + X`, `1`) |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `σ` on `KM = K ⊗ M` is `1 ⊗ conj`, so `θ^σ` has the conjugate type; `ℚ(ζ₈, ζ₃) = ℚ(ζ₂₄)` | true |
| 2.5, 8.1 | imaginary quadratic; `ℚ(ζ₅)`; `K₆₀`; `ℚ(i, √5)` | `(ℤ/2)²` has no cyclic quotient of order 4; `K₆₀(μ₅) = ℚ(ζ₆₀)` | branches exhaustive |
| 3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2·3⁻¹ = 4`; `1 ∈ ad⁰` | `H⁰ = 0` iff `2 ∈ kˣ` |
| 3.2 | `p = 5, 7, 3`; order-3 subgroup | norms `5 + 10N + 10N²`, `7 + 21N + 35N²`, `3 + 3N + N² = N²`; `(D−1)²f = −2e`; index 24; `det [[0,−1],[1,−1]] = 1` | `k f`, `k f`, `0` |
| 3.3 | `Φ` upper triangular; `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]`; `e` divisible by `p` | `M² = [[4,1],[4,0]]`, `M³ = 1`, `Φ² = 1`, `ΦMΦ⁻¹ = M² = M¹¹`; image of `I_w` in `ℤ_p(1)` of index `p^{v_p(e)}` | true |
| 3.4 | `N = [[a,b],[−a²/b,−a]]`; `q = 11`; `(1+εf)U`, `(1+εh)U`; `[[ζ₅,1],[0,ζ₅⁻¹]]` | `tr N · b = 0` forces `tr N = det N = 0`; `ΦE₁₂ = qE₁₂Φ` gives `γ = 0`, `α = qδ`; `11·12² = 1584`; traces `2+ε`, `2`; `N² = 0` for the second | three free parameters |
| 3.5 | `q ≡ 1, 2, −1 (p)`; `p ≥ 5` against `p = 3` | `φ·e = q e`, `φ·e(1) = q² e(1)`; `h¹ = h⁰(M) + h⁰(M(1))`: `2, 0, 1`; `Z¹` of dimension 4, `B¹` of dimension 2; `C(q,3) ≡ 0` needs `p ≥ 5` | (a)–(d) true |
| 4.1 | no protected place; inertia of order 2 | `Gal(LC_N/F) = SL₂(𝔽₅) × Gal(C_N/F)`; `Hom(−, M^{SL₂}) = 0`; `Hom(ℤ/2, M) = 0` | true |
| 4.2 | `g = diag(2,3)`; Borel; all of `P` framed | eigenvalues `4, 1, 4`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `Ad(Uᵀ)e = e − h − f`, `Ad(Uᵀ)²e = e − 2h − 4f`, determinant `2`; `H¹(⟨g⟩, M) = 0` | true |
| 4.3 | `(d,t,r) = (2,1,6), (2,3,10)` | `g = 0`; `g = 6`, `14 + 6 = 20`, `22` | deficit `d` |
| 5.1 | degrees `(8,8,24)`, `5 × 8`; `D = 36` | `24 > 20`, `8 < 20`; `24 > 20`; sums `< 18` force `8 + 8`, `8 ∤ 36` | Checks true; (i), (ii) are CN23 (5), (6) |
| 5.2, 5.4 | `d = 40, t = 10, R = ∅` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = r − 111`; `151 − 111 = 40` | true |
| 5.3 | `q_w = 11` at `P^c`; conjugation-stable set | indices `12`, `60`; `det diag(1+ε, 1−ε) = 1`, `(1+ε)¹¹ = 1 + ε`; ACC23 lines 2316–2339 hypotheses met by (i) and §4.2 | true, on the declared gap (S02 for the notation) |
| 6.1 | `(109, 2617)`, `q = 11`; `E = ℚ(√31,√59,√71)`; Hilbert symbol at 2 | `2617` has no factor `≤ 47`, `= 6·436 + 1`; both `≡ −1 (11)`; residues `1,4,1 (5)`, `9,4,5 (11)`; product formula `(+1)⋯(−1)`; `8` places, `12 > 8` | Checks true; ACC23 lines 7165–7172 as described |
| 6.2 | `𝔽₂₅`, `μ² = 2`, `γ = diag(1,2)`; determinant of order 4 | `det(μγ) = −1`, `(μγ)² = diag(2,3)`, order 240, kernels of index 120 both; `120 < 240` | `ζ₅ ∈ F` not implied; proof's case split complete |
| 7.1 | one or three fixed nodes | `p_a = 2` against 1; Riemann–Hurwitz for genus 3 over genus 1: `2·3 − 2 = 4 = 2·0 + 4`, four fixed points on the generic fibre, `3 + 1` smooth ones on the special fibre; `z₁z₂ = s²`; `2 + 1 = 3` | `I₃` |
| 7.2, 7.3 | `v(s) = 1, 5, 7`; `v(q_A) = 3, 15`; non-split | `3, 15, 21`; `[[1,3],[0,1]]`, trivial; twist multiplies Frobenius by `−1` | true |
| 7.4(a) | `u` split or not in `F`; `Σ = ∅`; `y² = x³ − x`, `y² = x³ + 1` over `𝔽₅` | `[L⁺F_avoid : F_avoid] = [L⁺ : F⁺] = [L : F]`, so `L ∩ F_avoid = F`; point counts `8` and `6`, traces `−2`, `0` | true |
| 7.4(b) | `Σ` above `11` with `l = 11` | split multiplicative and good at one place | route's justification false: S01 |
| 7.5 | transvections `±3`; `q` split in `K ∋ ζ₅` | group of order 120; `q ≡ 1 (5)`, `v ≠ v^c`; `L_{w'} = K_v` above `q` | every hypothesis of 6.2 traced |

## Dependency check

```
depcheck: 251 roadmaps, 2399 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at line 206 of `merge-order/ORDER.txt`; every
supplier it names is earlier (the latest is the parent at 205) or on main.
EllipticCurveModularityTotallyReal, ModularityAndLanglandsExtensions and BianchiModularForms (lines
207–209) are named only as boundaries and consumers.

## Copyright, licences and scope

Wording: 17 passages set beside their sources. LeHung26 lines 318–321, 334–339, 342–355, 357–366;
CaptainSude26 lines 177–220 (§3.4), 221–226 (§3.5), 228–241 (§4.1), 242–263 (§4.2), 264–289 (§5.1),
410–415 (§5.4), 509–519 (§7.1), 520–532 (§7.2), 538–603 (§§6.1, 7.4); CN23 lines 3849–3872 against
§6.2 and the module docstring of `Suggested.lean`, 4226–4260 against §5.1; ACC23 lines 2309–2355
against the gap contract; MilneCM lines 273–300 against §1.1. The longest shared runs are lists of
hypotheses and formulas ("a non-crystalline extension of `ε⁻¹` by the trivial character", 9 words,
CN23 line 4267). §3.4 and §7.2(a) take the same steps as CaptainSude26 lines 197–215 and 520–530 (a
matrix computation; a spreading-out argument) in different words and notation, with the roadmap's own
additions (general residual Frobenius and the Teichmüller coordinate; the good-reduction argument of
§7.2(b)); no sentence is shared. Arrangement: CaptainSude26 has the largest share. Its sections are
§2 (covers), §3 (local and global lemmas), §4 (Hecke maps, lifting theorem), §5 (degeneration, modular
source), §6 (chain). The roadmap has no layer for §2, begins with two layers absent from it, splits §3
between Layers 3 and 4 and the proof of its Proposition 5.2 between Layers 6 and 7, and puts the chain
(Layer 2) first; the order 3 → 4 → 5 → 6 → 7 → 8 is forced by the `*Needs:*` lines. Reuse: no table,
figure or data taken over; the lifting table of LeHung26 lines 346–349 is described in prose and
attributed to the parent's §8.3.

Source independence: 17 passages compared with 5 sources, none shared; largest share CaptainSude26, 24 of 61 locators in Layers 1–8; contents compared with CaptainSude26: independent.

## Verified sound

- Declarations read: 0. The module docstring names Theorems 2.5, 8.1 and 6.2 and the missing carriers.
  Searched at the pins (Mathlib `1b1ccf4`, Tau Ceti `2fd255d`): no automorphic representation on
  `GL₂(𝔸_K)`, no Weil–Deligne representation, no potentially semistable or Hodge–Tate carrier; no
  headline is statable and none is replaced by a stand-in. Nothing in the file is padding.
- Targets read: 27 of 27, every line of the README (1718) and of `Suggested.lean` (50).
- Pinned declarations checked: 19, all present with the cited files: `NumberField.IsCMField`,
  `IsCMField.of_isAbelianGalois` (an instance), `IsCyclotomicExtension.Rat.isCMField` (hypothesis
  `∃ n ∈ S, 2 < n`), `NumberField.isTotallyComplex_of_algebra`, `Matrix.SpecialLinearGroup.toGL`,
  `Matrix.SL2.commutator_eq_top` (hypotheses `a ≠ 0`, `a² ≠ 1`), `groupCohomology.map`,
  `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`, `WeierstrassCurve.localPolynomial`, `LFunction`,
  `LSeries`, `ModularForm.L`, `NumberField.AdeleRing`, `continuousCohomology`,
  `WeierstrassCurve.tateModuleGaloisRepresentation`, `TauCeti.ClassFieldTheory.GalRep`,
  `eulerCharacteristic_mixed`, `tateDualityPairing_perfect_mixed`, `maximalRealSubfield`.
- Sibling citations checked at the cited roadmaps' current texts (open heads or main): 23 roadmaps.
  Read for statement and hypotheses: the parent's §0.2, §0.3 (all named statements), §5.2, §5.3, §6.5,
  §7.1, §7.2, §7.4; CrystallineLocalGlobalCompatibilityCM §§8.6, 8.7, 9.4–9.9 (9.5–9.9 are bold
  numbered items under 9.4); PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5, 2.6; GL2ModularityLifting
  §1.7; ArithmeticGaloisRepresentations §§6.3, 7.2, 7.7, 7.8, 7.9; MordellLawrenceVenkatesh §§1.3, 1.4;
  ShimuraVarieties §5.6; GlobalGaloisDeformations §§3.6, 5.6; LocalGaloisDeformationRings §§2.5, 2.6,
  2.21; ModularityAndLanglandsExtensions §§2.29, 2.30; AutomorphicGaloisRepresentationsPartII AG2.0,
  AG2.5, AG2.7 with its three names. Resolved by heading: 31 further section ids. All exist where
  cited. The four leads of the citation tool are three source keys and `ResidualImage.adZeroRep`,
  which is a declaration of ArithmeticGaloisRepresentations §7.9, not a library name.
- Declared gap `gap:acc-torsion-inertial-comparison`: same slug and `needs` sentence in
  `design/plan.json` and README lines 343–345; supplier and section named; the contract restates
  ACC23 lines 2309–2355 in its own words; CrystallineLocalGlobalCompatibilityCM §9.7 cites AG2.5 for
  it and no roadmap states it. Not raised.
- Locators verified against the cached texts: 52 (LeHung26 10, CaptainSude26 21, CN23 13, ACC23 4,
  AKT23 1, CHT08 1, MilneCM 1 block, OpenAI26 1 block); all at the stated line and page.
- Checks tested: 96 Check bullets and 8 Examples paragraphs read; all with numerical or structural
  content recomputed (table above); none false, vacuous or a restatement. The definitions (switch
  parameter, protected, the unipotent-inertia condition, protected prepared datum, `𝒮^P_χ`) have three
  or more discriminating Checks each.
- Ownership: searched by object on main and at the open heads ("protected place", unipotent inertia
  at five, composita and cyclotomic extensions of CM fields, switch parameter, both manuscripts): no
  second owner. EllipticCurveModularityTotallyReal states the totally real analogue of §1.1 (base
  totally real, different hypothesis) and names this roadmap as the owner of CM bases.
- Policy: `git diff --stat origin/main...HEAD` touches only the package folder (8 files); no
  pull-request number or process narrative in the README or the docstring; every target has a locator
  and a `*Needs:*` line; no `lemma`, no `set_option`.

## Not verifiable

- The parent's statements over a general CM base (its §§6.5, 6.6, 8.1, 8.5, 8.6) were read as
  contracts; their proofs belong to the parent's review.
- §7.1(b)–(d) and §7.2 rest on the parent's nodal and compact-type models (§§2.1–2.3); the orbit,
  genus and thickness arithmetic was recomputed, the existence of the integral model over
  `O_{K₁}[1/n₀]` was not.
- The third Check of the switch-parameter definition assumes a place above 3 at which the data of
  §7.1(b) are rational; I did not construct such a triple `(K, E, p)`.
- The patching argument of §§5.3–5.4 beyond the dimension counts and the inertial computation at `P`:
  it depends on the declared gap and on supplier contracts.
- No Lean was run: the pass is read-only and the file has no declaration.

## Source issues

- **Gap** in CaptainSude26 at proof of Proposition 5.2, p. 12 (lines 568–569): the source says the added local opens are compatible because their residue characteristics avoid the conditions at 2, 3 and 5; it should also keep them away from the auxiliary prime of good reduction used for the mod-three seed (AKT23 Proposition 9.13); affects the proof.
- **Gap** in LeHung26 at Lemma 5.1, p. 9 (lines 357–360): the source says descent along an abelian extension of CM fields goes one cyclic step at a time; it should note that every intermediate field is CM, which each step needs; affects the proof.

## For the human reviewers

- **Scope.** Layers 3–7 and Theorem 8.1 rest on CaptainSude26, a pseudonymous unrefereed manuscript; Theorem 2.5 on LeHung26, a discussion draft whose Theorem 1.1 (line 86) assumes inputs of OpenAI26, also unrefereed. No refereed source states these headlines.
- **Licence.** CaptainSude26 states no licence (README line 1699); `sources.toml` classes it `author-page` at a code-hosting URL. OpenAI26 is read from a code-hosting repository with no licence recorded.
- **Licence.** LeHung26 is hosted at `hexagonmath.org`, classed `open-repository` in `sources.toml`, CC BY 4.0 by README line 1690; I could not classify the host. MilneCM is classed `open-repository` although the copy is on the author's page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "d6774637a2bbb85b1ddefa7391d1231333cbcc79", "job": "RT-EllipticCurveModularityImaginaryQuadraticPartII~2b", "model": "fable", "worker": "chris-x80"} -->
