<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/16328#issuecomment-6898412770 -->
Review (claude) of b513dc1

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) The gap text leaves out the weight of ACC's setting

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/design/README.md:304–310` (Supplier obligations): “a CM field `F` containing an imaginary quadratic field …; a good level `K`; a finite conjugation-stable set `S` … and a non-Eisenstein maximal ideal `𝔪`”; the same list in the `detail` of the gap in `design/plan.json`.

   **Claim.** The list is the setting of ACC23 §3.1.

   **Witness.** ACC23 line 2313 fixes, with the good subgroup, a dominant weight `λ`; the Hecke algebra of Theorem 3.1.1 (lines 2343–2349) is the one acting on the cohomology with coefficients of that weight.

   **Repair.** After “a good level `K`;” insert “a dominant weight `λ` (Theorem 5.3 uses `λ = 0`);” in the README, and “a dominant weight λ;” after “a good level;” in the `detail` of the gap in `plan.json`. The `needs` sentence is unchanged. Tested on Theorem 5.3: with `m = 2` and `λ = 0` the statement asked for is the one §5.3 applies with the sets `(S ∪ Q) ∪ (S ∪ Q)^c` and `R ∪ P ∪ Q`.

2. **F02** (P3) §7.2, route for (a): “a cycle of type `I₃` … before resolution”

   **Location.** `design/README.md:1185–1186`: “the reduced family is no longer a cycle of type `I₃` with nodes of thicknesses two and one before resolution”.

   **Claim.** Before resolution the reduced fibre is a cycle of type `I₃`.

   **Witness.** §7.1(c) and its second Check: before the `A₁` point is resolved the quotient fibre has two rational components meeting in two nodes; it is `I₃` only after resolution (“not the `I₂` read from the two quotient nodes alone”).

   **Repair.** Write “the reduced family is no longer two rational curves meeting in two nodes of thicknesses two and one (type `I₃` once the thickness-two node is resolved)”. Tested against §7.1: thickness `2 + 1 = 3` before resolution, `1 + 1 + 1 = 3` after, so `v(q_A) = 3v(s)` either way.

3. **F03** (P3) The manifest's locator for LeHung26 omits two places the README cites

   **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/sources.toml`, entry `LeHung26`, `locator = "Theorem 1.1 p.2; Section 4.1 p.7; … Remark 4.2 p.9; Lemma 5.1 p.9"`.

   **Witness.** `design/README.md:520` cites LeHung26 §5, lines 364–366 (the CM paragraph, p. 9), and `README.md:1336–1337` cites Remark 1.3.1, line 125 (p. 3); neither is in the `locator` field, although `cited_for` lists 2.4 and 8.1.

   **Repair.** Append “; Remark 1.3.1 p.3; Section 5 p.9” to the `locator` of `LeHung26`. Nothing else in the entry changes. Tested: LeHung26 page markers at lines 95 (p. 3) and 341 (p. 9).

All six findings of round 9 are repaired. The mathematics of the sampled targets, the three headline theorems and every passage the repair changed was recomputed; no statement is false, vacuous or missing a hypothesis. There is no P1 or P2 finding. Three P3 findings follow, each with an exact repair; because each is a repair to apply, the verdict asks for changes. The declared gap `acc-torsion-inertial-comparison` (supplier AutomorphicGaloisRepresentationsPartII AG2.5) is a stated contract and is not a finding. This is a design: there is no `Suggested.lean`, and this lane does not elaborate.

## Verified sound

### Round-9 findings

- **F01 (three passages close to CaptainSude26): repaired.** §4.2 now reads “Call `σ ∈ G_{C_N}` *detecting* for a nonzero `κ ∈ H_∅` if `ρ̄(σ)` is conjugate to `g` and the value at `σ` of a cocycle representing `κ` lies outside `(Ad ρ̄(σ) − 1)M`”; §5.3: “The comparison thus gives `tr ρ(σ) = 2` and `det ρ(σ) = 1` … These are equalities of elements, carried by ring maps”; §7.2(a): “let `K₁ ⊇ K` be the field of definition of the data of §7.1(b) … defined over `O_{K₁}[1/n₀]`”. A letter-run scan of the whole README against CaptainSude26, LeHung26 and OpenAI26 (below) finds no remaining run in these passages beyond standard phrases.
- **F02 (decomposition groups): repaired.** Line 276: “**ArithmeticGaloisRepresentations** §2.1 (decomposition groups, in its Layer 2)”; the §1.2 *Needs* line, Layer 1 Dependencies and the prerequisite of target 1.2 in `plan.json` agree. That roadmap's head has “### 2.1 Decomposition groups”.
- **F03 (§2.3 first Check): repaired.** Lines 500–504: “The first two already differ in the Weil part of the parameter … What `N` changes is the degree”. Recomputed at `q_v = 4`: `(1 − T)(1 − 4T) = 1 − 5T + 4T²` against `1 − T`.
- **F04 (§4.2 second Check): repaired.** Lines 815–819: “If every protected place were put into the framing set `T` … Framing only part of `P` does no harm”.
- **F05 (§7.2(b)): repaired.** Lines 1194–1195: “for an integer `d ≥ 3` prime to `q` (`d = 3` will do, as `q ≥ 7`)”; this is the hypothesis of NeronModelsAndSemistableAbelianVarieties §3.12.
- **F06 (letters reused): repaired.** §1.1 uses `K'`, `c`, `β`; the Conventions say where `η, ψ, χ`, `w`, `p`, `D`, `t`, `U` and the levels `K` occur. Checked by listing every occurrence by section: `η` in the Conventions, How to read the build, §§2.1, 2.2, 2.5, 8.1; `ψ` in the Conventions, §2.2 and §3.4; the reflection `w` in the Conventions and §7.1 only (`w` is a place in §§1.2, 4.2, 5.3, 7.4); `D = Ad(U)` in the Conventions and §3.2 only; `p` outside the Summary, Layer 1 Examples and Layers 2, 7, 8 is a coefficient prime in every occurrence (lines 132, 238, 272, 304–308, 634–646, 672, 889).

### Adversarial table (values computed this round)

| Statement | Instances | Values computed | Result |
|---|---|---|---|
| Conventions, tame witness | `q_v = 11, 7`, `p = 5` | `U¹¹ = U`; `[[a,b],[0,d]] U [[a,b],[0,d]]⁻¹ = [[1, a/d],[0,1]]`, so `a/d = q_v`; `7⁻¹ = 3 mod 5` | holds |
| Conventions, `ad⁰` | `D = Ad(U)` | `UhU⁻¹ = [[1,−2],[0,−1]] = h − 2e`; `UfU⁻¹ = [[1,−1],[1,−1]] = f + h − e`; Gram determinant `−2` | holds |
| §1.1 (as renamed) | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `S = {1, 2}`; `ℚ(√5)` | three intermediate fields; `L = K`; `ℚ(√5)` real, not containing `K`; `c` nontrivial on `K'` because `K'` is totally complex | holds |
| §1.2 | `1 ⊕ 1` over `𝔽₃` | over `ℚ`, `q = 2`: ratio `1 ≠ 2`; over `ℚ(ζ₃)`: split `q ≡ 1`, ratio `1 = q` | (a) holds, converse fails as the Check says |
| Layer 1 Examples | `{1, 29} ⊂ (ℤ/60)ˣ` | `29 ≡ 1 mod 4`, `2 mod 3`, `4 mod 5`; degree `16/2 = 8`; fixer of `K₆₀(ζ₃)` and of `K₆₀(ζ₅)` is `{1}` | holds |
| §2.2 | primes `p, 3, p`; twist | `χ = ηψ ≡ η mod p`, `≡ ψ mod 3`, `ψ ≡ 1 mod p`; `χ_(h(t))² = 1` | holds; clause (4) of CN23 Theorem 5.2 is for `p = 5` (line 3856) |
| §2.3 | `q_v = 4`, `a = 4`; `z = i`; `ℚ(ζ₈)` | `T² − 4T + 4 = (T − 2)²`, `2/√4 = 1`; `diag(i, −i)`: trace `0`, determinant `1`; two complex places, `[K⁺:ℚ] = 2`; factors `(1 − T)⁻¹` against `((1 − T)(1 − 4T))⁻¹` | holds |
| §2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊆ ℚ(ζ₈)`: sum; `ℚ(√−3) ⊄ ℚ(ζ₈)`, `ℚ(ζ₈, ζ₃) = ℚ(ζ₂₄)`: induction; `ℚ(i) ⊄ ℚ(√−3)`: induction | both branches occur |
| Theorem 2.5 | `ℚ(i)`, `K₆₀`, `ℚ(ζ₅)`, `ℚ(i, √5)` | `ζ₅ ∈ K`: no, no, yes, no; over `K₆₀`, `ζ₅ ∈ F` but `cm_modularity` is applied over `K₆₀` | holds; `ζ₅ ∉ F` is never used |
| §3.1 | `X = [[x, y],[z, −x]]`; `diag(2, 3)`; characteristic 2 | `UX − XU = [[z, −2x],[0, −z]]`; `UᵀX − XUᵀ = [[−y, 0],[2x, y]]`; `2·3⁻¹ = 4`, `3·2⁻¹ = 4`; `1 ∈ ad⁰` fixed | invariants zero iff `2 ∈ k^×` |
| §3.2 | `p = 3, 5, 7` | norm `5 + 10(D−1) + 10(D−1)²`; `(D−1)M = ke ⊕ kh`; `p = 3`: norm `(D−1)²`, `(D−1)²f = −2e = e`, `ker = ke ⊕ kh`; `p = 7`: `7 + 21(D−1) + 35(D−1)² = 0`; index `120/5 = 24` | dimensions of `H¹(⟨U⟩)`: `0, 1, 1` |
| §3.3 | `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅`; ramification index `p` | `det M = 1`, `tr M = −1`; `Φ² = [[16,5],[0,1]] = 1`; `ΦMΦ⁻¹ = [[4,1],[4,0]] = M²`; `11 ≡ 2 mod 3`; image of inertia of `F'_w` has index `p^(v_p(e))`, so `U^p = 1` | definition separates; not protected, as stated |
| §3.4 (used by 3.5, 5.3) | `N = [[a,b],[−a²/b,−a]]`; `[[q δ, z],[0, δ]]`; `(1+εf)U`, `(1+εh)U` | `tr N = det N = 0`; `tr(N)·b = 0` forces `tr N = 0`; `(1+N)^q = 1 + qN`; `q(q+1)²δ² = (1+q)²ψ(φ)`; traces `2 + ε`, `2` | (i)⇔(ii); three parameters |
| §3.5 | `q_v ≡ 1`, `2 mod 5`; `p = 3`; `q_v = 11` | `M^(I) = ke`, `φ` scales `e` by `q_v`; `3 − (3 − h⁰) = h⁰`; `Σ_{i<11} Dⁱ = 2·0 + D¹⁰ = 1`; `Z¹ = 3 + 1`, `B¹ = 2`; norm at `p = 3` is `(D−1)² ≠ 0`, so (d) needs `p ≥ 5`; `#H¹ = #H⁰(M)·#H⁰(M(1))` | (a)–(d) hold |
| §4.1 | `SL₂(𝔽₅) × A`; inertia of order 2 | `H¹(A, M)^G = Hom(A, M^G) = 0`; `Hom(ℤ/2, M) = 0`; `I_v` maps onto an order-five subgroup since `C_N/F` is unramified at `v ∤ 5` | holds |
| §4.2 (rewritten route) | `g ↔ diag(2,3)`; `γ ∈ G_{LC_N}`; `κ(σ₀) ∈ W` or not | `Ad(g) − 1`: `e ↦ 3e`, `h ↦ 0`, `f ↦ 3f`, so `W = ke ⊕ kf`; `κ(gγg⁻¹) = gκ(γ)`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; one of `σ₀`, `γσ₀` is detecting in both cases; a degree-one unramified prime splits in every quadratic subfield | holds |
| §4.2 Check 2 | `P = {v}` framed; `P = {v₁, v₂}`, `v₁` framed | distinct eigenvalues in `SL₂(𝔽₅)` give order prime to five, `H¹(⟨g⟩, M) = 0`; at `v₂` the class is ramified and fails `L_{v₂}^⊥` | as stated |
| §4.3 (used by 5.2, 5.4) | `(d, t, r) = (2, 1, 6)`, `(2, 3, 10)` | `g = 6 − 6 − 1 + 1 = 0`; `g = 6`, `1 + 9 + 4 = 14`, `20 = r + 4t − d`, `1 + 11 + 10 = 22 = r + 4t` | deficit `d` |
| §5.1 (used by 5.2) | degrees multiples of four, `≥ 8` | `a + a' < d/2` forces `d > 32`; at `36` every degree would be `8 ∤ 36`; `(8, 8, 24)`: `24 > 20` and `8 < 20`; `(8⁵)`: `24 > 20` | least `d = 40` |
| §5.2 | `d = 40`, `t = 10`, `R = ∅` | `1 + 10·(3 + 8) = 111 = 1 + 30 + 80` | holds |
| §5.3 (rewritten route) | `u ∈ O_{F_v}^×`; `χ_v(u) = ζ₅`; `w = v^c`, `q_w = 11` | trivial coefficients: `X² − 2X + 1`; with `χ_v⁻¹(a/d)`: roots `ζ₅^(±1) ≠ 1`; index `12`, `12·5 = 60`; `(1 + ε)¹¹ = 1 + ε`, `det = 1 − ε² = 1`; residue characteristics outside the conjugation-stable set split or are unramified by (i) and §4.2 | hypotheses of ACC23 Theorem 3.1.1 met |
| §5.4 | `d = 40`, `t = 10`, `r = 111` | `(1 + 3t + 2d) + (r − 3d − 1 + t) = r + 4t − d`; `g = 0`; `111`, `151` | deficit `40 = l₀` |
| §6.1 | `v ∈ P`, `v^c` | `ρ` unramified at `v^c`, ramified at `v`, so `v ≠ v^c`; index-five completion gives `U⁵ = 1` | holds |
| Theorem 6.2 | `⟨SL₂(𝔽₅), μγ⟩`, `μ² = 2`, `γ = diag(1, 2)`; determinant of order 4 | `det(μγ) = 2·2 = 4`; `(μγ)² = diag(2, 8) = diag(2, 3)`; orders `240`, `120`, kernels of index `120`, `120`; `det(2g) = 4·(−1) = 1`; `120 < 240` | `ζ₅ ∈ F` is a real hypothesis; agrees with CN23 Lemma 6.1.4 |
| §7.1 | nodes; `p = 101` | `2(P₀ + rT') = c₀` has one solution modulo three; genus `3 − 2 + 1 = 2` against `2 − 2 + 1 = 1`; `606`, `303` | one fixed node; thickness `2 + 1 = 1 + 1 + 1` |
| §7.2 (rewritten route) | `m_v = 1, 5, 7`; `d = 1, 3, 3q` | `v(q_A) = 3, 15, 21`; `K₁ ↪ K_v = ℚ_q`; `d = 1` fails `N ≥ 3`, `3q` is not a unit | (a), (b) hold; wording of line 1185 is R02 |
| §7.3 | `v(q_A) = 3, 15`; non-split | `[[1, 3],[0, 1]]`, trivial; Frobenius `[[q_v, b],[0, 1]] = [[1, b],[0, 1]]`, made `1` by `φ ↦ φτ^x`; twist multiplies Frobenius by `−1` | holds |
| §7.5 | transvections with entry `3`; `q` split in the normal closure of `K ∋ ζ₅` | generate `SL₂(𝔽₅)`; `G_D ⊆ G_K` and `det = ε̄₅ = 1`; `q ≡ 1 mod 5`, `v ≠ v^c`; `5 ∤ 3m_v` | hypotheses of Theorem 6.2 over `L` met |
| Theorem 8.1 | `ℚ(ζ₅)`, `ℚ(ζ₁₅)`, `ℚ(ζ₂₀)`, `K₆₀`, `ℚ(i, √5)` | `ζ₅ ∈ K`: yes, yes, yes, no, no (`(ℤ/2)²` is not cyclic of order four) | branches exhaustive |

### Sources: the seeded sample

No locator is flagged unverified. All eight manifest texts are in the sources cache; nothing was fetched and nothing is missing.

| Target | Checked at | Result |
|---|---|---|
| 2.2 | LeHung26 lines 292–299, 344–351, 357–360; CaptainSude26 lines 634–670; OpenAI26 lines 1131 (p. 26), 1163 (p. 27) | supported |
| 2.3 | OpenAI26 lines 1192–1199, 1216–1225 (pp. 27–28); CN23 lines 4545–4555 (p. 88) | supported |
| 2.4 | OpenAI26 lines 1200–1215; LeHung26 lines 364–366; CaptainSude26 lines 676–683 | supported |
| 2.5 | LeHung26 lines 86–88 (conditional on the geometric inputs, which the parent supplies), 342–355, 357 | supported |
| 3.1 | CaptainSude26 lines 187–193 | action supported; the invariant statement is this roadmap's computation |
| 3.2 | CaptainSude26 lines 231–241 | supported |
| 3.3 | CaptainSude26 lines 177–183, 533–536 | supported for `p = 5`; the general odd `p` is argued in the API bullets and recomputed above |
| 3.5 | CaptainSude26 lines 187–196, 216–226 | supported for `μ₅ ⊂ F_v`, `ρ̄(φ) = 1`; (a)–(b) in general are argued in the section and recomputed above |
| 4.1 | CaptainSude26 lines 227–241 | supported |
| 4.2 | CaptainSude26 lines 242–263; AKT23 line 3979 (p. 86) | supported |
| 5.2 | CaptainSude26 lines 285–289; CN23 line 4361 | supported |
| 5.3 | CaptainSude26 lines 291–408; CN23 lines 4334–4340; ACC23 lines 2309–2355 (pp. 57–58) | supported |
| 6.2 | CN23 lines 3849–3872 (pp. 73–74), 4562–4572; CaptainSude26 lines 267, 410–415 | supported |
| 7.1 | CaptainSude26 lines 503–532 | supported; the argument for one fixed node in (b) is this roadmap's |
| 7.3 | CaptainSude26 lines 533–536 | supported |

The page numbers of the References were checked against the page markers of LeHung26 (pages 2, 3, 7–9), CaptainSude26 (pages 1, 3–6, 9–13), CN23 (pages 73–74, 87–89), AKT23 (page 86) and ACC23 (pages 57–58).

### Library, suppliers, order

- Pins `1b1ccf4b…` (Mathlib) and `2fd255d9…` (Tau Ceti), from `lake-manifest.json`. Opened at the pins: `NumberField.IsCMField` (`Mathlib/NumberTheory/NumberField/CMField.lean:70`), `complexConj` (:142), `isConj_complexConj` (:148), `ofCMExtension` (:510), `of_isAbelianGalois` (:542), `IsCyclotomicExtension.Rat.isCMField` (:43, :575); `NumberField.isTotallyComplex_of_algebra` (`Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean:229`); `Matrix.SpecialLinearGroup.toGL` (`Mathlib/LinearAlgebra/Matrix/GeneralLinearGroup/Defs.lean:369`); `Matrix.SL2.commutator_eq_top` (`Mathlib/LinearAlgebra/Matrix/SpecialLinearGroup.lean:804`, hypotheses `a ≠ 0`, `a² ≠ 1`, met by `a = 2` in `𝔽₅`); `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd` (`Mathlib/RepresentationTheory/Homological/GroupCohomology/FiniteCyclic.lean:114`); `Representation.linHom` (`Mathlib/RepresentationTheory/Basic.lean:655`); `IsCyclotomicExtension` (`Mathlib/NumberTheory/Cyclotomic/Basic.lean:74`); `TauCeti.ClassFieldTheory.eulerCharacteristic_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/EulerCharacteristic/Theorem.lean:98`); `tateDualityPairing_perfect_mixed` (`TauCeti/NumberTheory/ClassFieldTheory/Local/Duality/Perfect.lean`). All exist.
- Supplier citations resolved now, on main or at the open heads: every section, layer and target id cited across the 20 supplier roadmaps is present as a heading or a bold paragraph title (CrystallineLocalGlobalCompatibilityCM §§9.5–9.9 are bold titles), and the cited names (`ResidualImage.adZeroRep`, *ContinuousRep.adZero*, `IsDecomposedGenericPrime`, `decomposedGenericPrime_local`, `cht_soluble_prescribed_completions`, the three names of PotentialAutomorphyInfrastructure) occur. Statements read against their use here: GlobalGaloisDeformations §5.6 (detecting and padding classes, avoidance set, exactly `q` primes of degree one), §3.6 (no condition at framed places) and §3.7 (the tangent-generator surjection needs no liftability outside `T`); CrystallineLocalGlobalCompatibilityCM §8.6 (nilpotent ideal of exponent depending on `[F:ℚ]`, neat refinement), §8.7 (`p` odd, `ζ_p ∈ F`, `ρ̄_𝔪` absolutely irreducible, trivial reduction), §9.1 and §9.3 (`g = q − 3[F⁺:ℚ] − 1 + |S|`, and its Check that `ℚ(ζ₅)` has no imaginary quadratic subfield); ArithmeticGaloisRepresentations §6.3 (for `ℓ ≠ p`, `κ = v(q) t_ℓ` on inertia, `E_q[ℓ^n]` unramified iff `ℓ^n | v(q)`); LocalGaloisDeformationRings §2.21; the parent's §7.4 (the specialized image of `G_D` contains the geometric monodromy) and its boundary section. ModularityAndLanglandsExtensions §§2.29–2.30 and BianchiModularForms are named as consumers only. No roadmap of the never-cite list is cited.
- The citation resolver lists three leads, all source keys (`LeHung26, §4.4`, `OpenAI26, §9.4`, `CaptainSude26, §4`), and no Lean name.
- Gap `acc-torsion-inertial-comparison`: the same slug in `plan.json` (`gaps`, supplier AutomorphicGaloisRepresentationsPartII, section AG2.5, needed by 5.3) and in the README (Supplier obligations, the route and *Needs* of §5.3, Layer 5 Dependencies). The `needs` sentence asks for one statement, ACC Theorem 3.1.1; its hypotheses and conclusion as listed agree with ACC23 lines 2309–2355 except for the weight (R01). A search of every open head and main finds no roadmap stating the theorem.
- Dependency check:

```text
candidate: EllipticCurveModularityImaginaryQuadraticPartII is not in the merge order yet; checked as if placed after EllipticCurveModularityImaginaryQuadratic (the intake inserts it when its design is accepted)
depcheck: 246 roadmaps, 2257 edges, 0 problem(s)
```

No UPWARD or CYCLE line.

### Duplication and overlap

`scratch/overlaps.md`: no other pull request changes this roadmap, no cited id is dropped, none is defined only by a revision, no second copy on main. The board index lists AnalyticNumberTheory and LawrenceVenkateshMethod, both unrelated. Searches of every open head and main, by object: a protected or unipotent-inertia condition at a retained place (no match); a width-three degeneration (one unrelated match); the CaptainSude26 manuscript (one unrelated match of the string); modularity over every CM field (EllipticCurveModularityTotallyReal, which places CM base fields outside its scope and names this Part II for them); CM-ness of intermediate fields of a cyclotomic extension of a CM field (no owner; Mathlib's file has no statement on composita or subfields). ArithmeticGaloisRepresentations §7.7 owns the dimension of `H¹(SL₂(𝔽₅), ad⁰)` and is cited for it; §3.1 says in one clause how its vanishing statement differs.

Overlap check: read EllipticCurveModularityTotallyReal, EllipticCurveModularityImaginaryQuadratic, PotentialAutomorphyInfrastructurePartII, CrystallineLocalGlobalCompatibilityCM, OrdinaryAutomorphicFormsAndModularityLiftingPartII (the lists on main and by results are empty); nothing shared.

### Shape, headlines and policy

Summary, Scope and ownership, Conventions, Exact supplier contracts, How to read the build, eight layers each ending in Examples and Dependencies, Downstream consumers, References. Three definitions (3.3, 5.1, 5.2) with 3, 4, 4 API bullets and 4, 4, 3 Checks; 24 theorems and one example target, each theorem with hypotheses and a locator; `plan.json` parses, with 28 targets and 92 tests, and its reworded tests agree with the README. Headlines: Theorems 2.5, 6.2, 8.1; none is statable at the pins (no automorphic representations of `GL₂(𝔸_K)`, attached Galois representations or potentially semistable local representations in either library), and the *Lean* paragraph says so for each. The README attributes no backticked Lean name to this roadmap. No LaTeX delimiters, pull-request numbers, machine paths, target tables, `set_option` or algorithms. The layers are named by their mathematics; the order of Layers 3 → 8 is forced by the *Needs* lines (4.1 needs 3.2 and 3.5; 5.4 needs 4.2 and 4.3; 6.2 needs 5.4; 7.5 needs 6.2; 8.1 needs 7.5), and Layers 1–2 are independent of 3–7.

### Copyright and arrangement

Wording: 21 passages were put beside their sources (the fifteen sampled targets, §§1.2, 3.4, 5.1, 5.4, 7.2 and the headline 8.1), and a letter-run scan of the whole README against CaptainSude26, LeHung26 and OpenAI26 was made at 24 letters. The longest runs are a hypothesis of Theorem 5.4 (eight words, the non-crystalline extension at `S₅^st`), the first clause of the headline (nine words and symbols, OpenAI26 line 20) and standard phrases (“in every imaginary quadratic subfield of `F`”); all are statements of hypotheses or conclusions of about a dozen words. §7.1(b)–(c) states the facts of CaptainSude26 lines 513–516 in the order the geometry gives them, with at most five consecutive words shared; the argument for (b) and the Checks are the roadmap's own. Arrangement: CaptainSude26 has Sections 2–6. The roadmap puts the assembly of its Section 6 first (Layer 2, with LeHung26), splits its Section 3 across Layers 3 and 4, moves the presentation out of the proof of its Theorem 4.2 into Layer 4, states a preparation and a general lifting theorem (Layer 6) that the manuscript has only inside its Section 5, and adds Layer 1; there is no one-to-one run. Reuse: no table, figure or data taken over.

Source independence: 21 passages compared with 6 sources, none shared beyond statements of a dozen words; largest share CaptainSude26, 23 of 54 locators in the layers; contents compared with CaptainSude26: independent.

## Not verifiable

- Lean elaboration, the one-tactic probe and the `#check` comparison: not available in this lane, and a design has no Lean file.
- The global patching argument of CaptainSude26 (lines 315–408, 445–498) beyond its hypotheses, counts and local computations: no refereed source states it, and it was not re-proved here.
- The geometric inputs of the parent (cover family, monodromy, local opens), on which LeHung26 Theorem 1.1 is conditional (line 86): read as supplier statements only.
- CHT08 Lemma 4.1.2 (p. 116) was not reopened this round; round 9 read it.

## Source issues

- **Error** in CaptainSude26 at Notation, printed p. 2 (lines 63–66): the source says its condition, ratio outside `{1, q, q⁻¹}`, agrees with CN Definition 2.1.27; it should say it is stronger, since that definition excludes only the ratio `q`; affects nothing.
- **Error** in CN23 at Lemma 5.6.5, printed pp. 85–86 (lines 4435–4450): the source says the determinant kernel is reducible in all cases; it should except determinant order three with projective image `A₄`, where the kernel is irreducible; affects a stated result.
- **Misprint** in CN23 at the proof of Theorem 5.2, printed p. 86 (line 4460): the source says the set contains the `q`-adic places of `K`; it should say of `F`; affects nothing.
- **Misprint** in CaptainSude26 at Lemma 5.1, printed p. 11 (line 528): the source writes the unit series as `h(s)`, the letter of the cubic `y² = h(x)` (line 71); it should use another letter; affects nothing.

## For the human reviewers

- **Scope.** Theorems 6.2 and 8.1 rest on CaptainSude26 (pseudonymous, unrefereed) and Theorem 2.5 on LeHung26 (discussion draft, conditional on the parent's geometric inputs, line 86); the parent rests on OpenAI26. No refereed source states these theorems.
- **Licence.** CaptainSude26: the repository has no licence file (`sources.toml`, `version_note`). OpenAI26: `licence_class = "author-page"` for a company repository, no licence recorded.
- **Licence.** MilneCM is recorded as `open-repository`; the host is the author's own page.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "b513dc1ded99cbe84af3a994f68420f3a5f26eae", "job": "REV-DESIGN-EllipticCurveModularityImaginaryQuadraticPartII~10", "model": "fable", "worker": "chris-x52"} -->
