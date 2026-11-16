<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/17981#issuecomment-6907474966 -->
Red team round 1 pass a (claude) of 160a122

Verdict: needs_changes

**For the human reviewers:** this review raises 3 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P3) §4.2 uses absolute irreducibility of `ad⁰` for `SL₂(𝔽₅)` with no owner cited

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:929-930`: "its
     values span a nonzero `ρ̄(G_F)`-stable subspace, which is `M` because `ad⁰` is absolutely
     irreducible for `SL₂(𝔽₅)`". The `*Needs:*` line of §4.2 (line 944) is "§4.1; GlobalGaloisDeformations
     §§3.6, 5.1, 5.6; Chebotarev Layer 10".
   - **Claim.** Every input of the route is a target here, a named supplier section or a pinned
     declaration.
   - **Witness.** §3.1 proves only `H⁰(SL(2,k), ad⁰) = 0` (no invariant vectors), which does not exclude
     an invariant plane; no target of Layers 3–4 states irreducibility, and no `*Needs:*` line or
     supplier-contract row names an owner. The owner exists: ArithmeticGaloisRepresentations §7.8,
     "Irreducibility and one-dimensional constituents" (`Sym^a(F̄_p²)` absolutely irreducible for
     `SL₂(F)`, `0 ≤ a ≤ p − 1`), with §7.2 (`ad⁰ ≅ (Sym² ρ)^∨ ⊗ Dρ`). §7.8 is not in this roadmap's
     supplier contract for that roadmap (README lines 341–357 list §§2.1, 4.3, 6.3, 7.2, 7.7, 7.9).
   - **Repair.**
     1. In §4.2, replace "which is `M` because `ad⁰` is absolutely irreducible for `SL₂(𝔽₅)`" by
        "which is `M` because `ad⁰ ⊗ k` is absolutely irreducible for `SL₂(𝔽₅)`: by
        ArithmeticGaloisRepresentations §7.2 it is `(Sym² ρ̄)^∨ ⊗ det ρ̄` with `det ρ̄ = 1`, and by its
        §7.8 `Sym^a` of the standard representation of `SL₂(𝔽₅)` is absolutely irreducible for
        `0 ≤ a ≤ 4`".
     2. §4.2 `*Needs:*`: add "ArithmeticGaloisRepresentations §§7.2, 7.8".
     3. Supplier contract "From TauCetiRoadmap.ArithmeticGaloisRepresentations": add the bullet
        "§7.8 (`Sym^a(F̄_p²)` is absolutely irreducible for `SL₂(F)`, `F` finite of characteristic `p`,
        `0 ≤ a ≤ p − 1`), used by §4.2 for `ad⁰` at `p = 5`, `a = 2`."
     4. Layer 4 Dependencies: "ArithmeticGaloisRepresentations §§4.3, 7.7" → "§§4.3, 7.2, 7.7, 7.8";
        Scope paragraph (line 74–77) needs no change.
     Tested on the instance: `a = 2 ≤ 4 = p − 1`; direct check over `𝔽₅`: a nonzero `Ad(U)`-stable
     subspace meets `ker(D − 1) = k e`, and `Ad(Uᵀ)e = e − h − f`, `Ad(Uᵀ)²e = e − 2h − 4f`, which with
     `e` have determinant `2 ≠ 0` in the basis `e, h, f`, so the span is all of `M`.

2. **F02** (P3) §8.1 derives "non-CM" from a fact about CM images that nothing supplies

   - **Location.** `packages/EllipticCurveModularityImaginaryQuadraticPartII/README.md:1525-1526`:
     "`A_t` is geometrically non-CM because its mod-five image `SL₂(𝔽₅)` (§7.5(a)) has no abelian
     subgroup of index at most two". `*Needs:*` of §8.1 (lines 1533–1535) has no entry for it.
   - **Claim.** The step uses "the mod-`ℓ` image of a geometrically CM elliptic curve has an abelian
     subgroup of index at most two".
   - **Witness.** That statement is a target nowhere in this roadmap (it reappears only as the third
     Check of §7.5, line 1494) and no supplier section is cited for it. It is also unnecessary: the `t`
     of §7.5 is a switch parameter (line 1464–1465), and the Conventions define a switch parameter as an
     output of the parent's §7.4 `simultaneous_specialization`, whose clause (3) is "`A_t` is non-CM";
     §2.1(a) already uses exactly that citation (line 548).
   - **Repair.** In §8.1 replace "`A_t` is geometrically non-CM because its mod-five image `SL₂(𝔽₅)`
     (§7.5(a)) has no abelian subgroup of index at most two, so" by "`A_t` is geometrically non-CM by
     the parent's §7.4(3), `t` being a switch parameter, so"; in the `*Needs:*` line of §8.1 change
     "EllipticCurveModularityImaginaryQuadratic §4.2 (`cubic_character_elliptic`)" to
     "EllipticCurveModularityImaginaryQuadratic §4.2 (`cubic_character_elliptic`) and §7.4"; add "§7.4"
     to the parent's entry in the Layer 8 Dependencies. The third Check of §7.5 may stay (a Check may
     use the fact as a consistency test). Tested: the parent's §7.4 lists output 3 "`A_t` is non-CM"
     for every number field `k`, so the citation covers `K ∋ ζ₅`.

Two P3 findings (both are proof-plan inputs with no cited owner; an owner exists for each). No P1 or
P2 finding survived the checks recorded below.

## The adversarial pass (computed values)

`Suggested.lean` declares nothing (namespace opened and closed, one `import Mathlib`, no
`set_option`, no `sorry`), so the declaration table is empty; `#check @name` had nothing to compare.
README targets, 27 in 8 layers:

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| Conventions, tame relation | `q_v = 11, 7` over `𝔽₅` | `U¹¹ = U`; `U⁷ = [[1,2],[0,1]]`; `7⁻¹ = 3` | as stated |
| Conventions, `Ad(U)`, Gram | basis `e,h,f` | `D e = e`, `D h = h − 2e`, `D f = f + h − e`; Gram determinant `−2` | as stated |
| 1.1 | `ℚ(i) ⊂ ℚ(ζ₂₀)`; `ℚ(i,√3,√5)`; `ℚ(2^(1/3))(ζ₃)`; `S = {1,2}`; `S = ∅` | `{1,9,13,17}` cyclic generated by `13`; 7 quadratic subfields; `S₃`, `c₁c₂` a 3-cycle; `L = K` twice | true; Checks true |
| 1.2 | `K = F`; `1 ⊕ 1` over `𝔽₃`, `q = 2`; `ℚ(ζ₃)` | ratio `1 ≠ 2`; over `ℚ(ζ₃)` `q ≡ 1`, ratio `1 = q` | true; converse fails as stated |
| Layer 1 example `K₆₀` | `(ℤ/60)ˣ` | `29 ≡ −1 (15)`, `≡ 1 (4)`, `≡ 4 (5)`, `≡ 2 (3)`; index 2 of 16 | degree 8, `ζ₅ ∉ K₆₀`, `K₆₀(ζ₃) = ℚ(ζ₆₀)` |
| 2.1 | `√5 ∈ K, ζ₅ ∉ K`; `√5 ∉ K` | det image `{±1}`: projective image `A₅`, no index-2 subgroup; det of order 4: `S₅` has no `ℤ/4` quotient | clause (4) holds whenever `ζ₅ ∉ K`, so parent §5.3 applies |
| 2.2 | lifting primes | `p, 3, p`; none is 5 | five-adic clause never met |
| 2.3 | split multiplicative, `q_v = 4`; good `q = 4, a = 4`; `K = ℚ(ζ₈)`, `z = i` | `(1−T)⁻¹` vs `((1−T)(1−4T))⁻¹`; roots `2,2`, unitary `1,1`; `diag(i,−i)`; St: `L(s,St) = L(s+½,1)` shifts to `(1−q⁻ˢ)⁻¹` | agrees with Mathlib's `1 − X` and supplier R16.3.2 |
| 2.4 | `y² = x³ − x`, `y² = x³ + 1` over `ℚ(ζ₈)`; `y² = x³ − x` over `ℚ(√−3)` | `ℚ(i) ⊂ ℚ(ζ₈)`; `ℚ(ζ₈,ζ₃) = ℚ(ζ₂₄)`; `ℚ(i) ⊄ ℚ(√−3)` | Checks true |
| 2.5, 8.1 | imaginary quadratic; `ℚ(ζ₅)`; `K₆₀`; `ℚ(i,√5)` | `ζ₅ ∉` IQ; `ℚ(ζ₅)` cyclic of degree 4 ≠ `(ℤ/2)²` | branches as stated |
| 3.1 | `X = [[x,y],[z,−x]]`; `diag(2,3)`; characteristic 2 | `UX − XU = [[z,−2x],[0,−z]]`; `UᵀX − XUᵀ = [[−y,0],[2x,y]]`; `2/3 = 3/2 = 4`; `1 ∈ ad⁰` | true; `2 ∈ kˣ` needed |
| 3.2 | `p = 5, 7, 3`; order-3 subgroup | norm `5 + 10N + 10N²`, `7 + 21N + 35N²`, `3 + 3N + N² = N²`; `im N = ke ⊕ kh`; index 24 | `H¹(⟨U⟩) = k f` (5, 7), `0` (3) |
| 3.3 | `Φ = [[a,b],[0,d]]`; `M = [[0,−1],[1,−1]]`, `Φ = [[4,1],[0,1]]` over `𝔽₅` | `ΦUΦ⁻¹ = [[1,a/d],[0,1]]`; `Φ² = 1`, `ΦMΦ⁻¹ = [[4,1],[4,0]] = M² = M¹¹` | true |
| 3.4 | `N = [[a,b],[−a²/b,−a]]`; `q_v = 11`; `(1+εf)U`, `(1+εh)U`; `[[ζ₅,1],[0,ζ₅⁻¹]]`; `𝔽₂₅` | `tr N = det N = 0`; `ΦE₁₂ = qE₁₂Φ` gives `c = 0, a = qd`; `11·12² = 1584`; traces `2+ε`, `2`; `N² = 0` for the second | 3 free parameters; `q tr² = (1+q)²ψ(φ)` |
| 3.5 | `q ≡ 1`, `q ≡ 2 (5)`; `p = 3, q = 7` | `φ·e = q e`; `Z¹` of dimension 4, `B¹` of dimension 2; `C(q,3) ≡ 0` iff `p ≥ 5`; `C(7,3) = 35 ≡ 2 (3)` | (a)–(d) true; `p ≥ 5` in (d) needed |
| 4.1 | no protected place; inertia of order 2; `𝔽₇` | inflated class unramified; `Hom(ℤ/2, M) = 0` | true; negative controls hold |
| 4.2 | `g = diag(2,3)`; framed `P` | eigenvalues `4,1,4`; `κ(γσ₀) = κ(γ) + κ(σ₀)`; `H¹(⟨g⟩,M) = 0` | true (see R01) |
| 4.3 | `(d,t,r) = (2,1,6), (2,3,10)` | `g = 0`; `g = 6`, `14 + 6 = 20 = r + 4t − d`, `22 = r + 4t` | agrees with GlobalGaloisDeformations §3.6 formula |
| 5.1 | degrees `(8,8,24)`, `5 × 8`; `D = 36` | `24 > 20`, `8 < 20`; `24 > 20`; `a + b < 18` forces `8 + 8`, `8 ∤ 36` | Checks true |
| 5.2, 5.4 | `d = 40, t = 10` | `1 + 10·11 = 111 = 1 + 3t + 2d`; `g = r − 111`; `151 − 111 = 40` | true |
| 5.3 | `q_w = 11` at `P^c` | indices `12`, `60`; `det diag(1+ε,1−ε) = 1`; conjugates of `R ∪ P ∪ Q` outside `S ∪ Q` | ACC23 §3.1 hypotheses met (lines 2313–2339) |
| 6.1 | `(109, 2617)`, `q = 11`; `E = ℚ(√31,√59,√71)`; Hilbert symbol at 2 | `2617` prime, `≡ 1 (436)`, both `≡ −1 (11)`; residues `1,4,1 (5)`, `9,4,5 (11)`; product formula `+1·…·(−1)` | Checks true; ACC23 lines 7165–7172 as described |
| 6.2 | `k = 𝔽₂₅`, `μ² = 2`, `γ = diag(1,2)`; det of order 4 | `det(μγ) = −1`, `(μγ)² = diag(2,3)`, order 240, kernels of index 120 both; `120 < 240` | Checks true; `ζ₅ ∈ F` not implied |
| 7.1 | fixed nodes 1 or 3 | genus `3 − 2 + 1 = 2 ≠ 1`; `xy = s` under `(−x,−y)`: `z₁z₂ = s²`; `2 + 1 = 3` | `I₃` |
| 7.2, 7.3 | `v(s) = 1, 5, 7`; `v(q_A) = 3, 15` | `3, 15, 21`; `[[1,3],[0,1]]`, trivial | true |
| 7.4, 7.5 | `Σ = ∅`; transvections `±3` | parent `switch_five`; elementary matrices with unit entry generate `SL₂(𝔽₅)`, order 120 | true (see R02 for §8.1) |

## Verified sound

- **Dependency check.** `gate --depcheck … --name EllipticCurveModularityImaginaryQuadraticPartII
  --movable --pr 17981` printed `depcheck: 246 roadmaps, 2312 edges, 0 problem(s)`; no UPWARD, CYCLE or
  `moved:` line.
- **Package boundary.** `git diff --stat origin/main...HEAD` touches only the package folder (7
  files); the `plan.json` change is the one `needs` sentence of the declared gap.
- **Declarations read:** 0 (none exist). Module docstring names the three headlines (2.5/8.1, 6.2)
  and the missing carriers; pins confirm no automorphic representation, Weil–Deligne or
  potentially-semistable carrier. The statable consequence "`WeierstrassCurve.LSeries` is entire" is
  not a README target, so its absence is correct.
- **Targets read:** 27 of 27, every line of the README (1605 lines) and of `Suggested.lean` (50).
- **Sibling citations checked:** 21 roadmaps, about 95 section or name citations, all resolved at the
  open heads (via `roadmaps show`) or on main: the 41 parent names cited (`cyclicCover`, `characterSystem`,
  `complexInfinityParameter` are declared with arguments there); parent §§5.2, 5.3, 7.4(1)–(3), 0.3
  read for hypotheses (`switch_five`, `seed_modular` over any imaginary CM field; `cm_modularity` for
  any CM `L` with `ζ₅ ∉ L`); CrystallineLocalGlobalCompatibilityCM §§7.5, 8.2–8.7, 9.1, 9.4–9.11
  (clauses (5)–(15), the count `g = q − 3[F⁺:ℚ] − 1 + |S|`); AutomorphicGaloisRepresentationsPartII
  AG2.0, AG2.5, AG2.7 (three names); PotentialAutomorphyInfrastructure §§2.1, 2.3, 2.5 (three names);
  GlobalGaloisDeformations §§3.4, 3.6, 3.7, 5.1, 5.5, 5.6; LocalGaloisDeformationRings 12 sections;
  ArithmeticGaloisRepresentations §§2.1, 4.3, 6.3, 7.2, 7.7, 7.9 and `ResidualImage.adZeroRep` in its
  `Suggested.lean`; the rest by heading and first paragraph.
- **Pinned declarations checked:** 17, all present: `NumberField.IsCMField`,
  `IsCMField.of_isAbelianGalois`, `IsCyclotomicExtension.Rat.isCMField`,
  `NumberField.isTotallyComplex_of_algebra`, `Matrix.SpecialLinearGroup.toGL`,
  `groupCohomology.map`, `Rep.FiniteCyclicGroup.groupCohomologyIsoOdd`,
  `Matrix.SL2.commutator_eq_top`, `WeierstrassCurve.localPolynomial`/`LFunction`/`LSeries` (the four
  cases match the README bullet), `continuousCohomology`, `NumberField.AdeleRing`, `ModularForm.L`,
  Tau Ceti `eulerCharacteristic_mixed`, `tateDualityPairing_perfect_mixed`,
  `WeierstrassCurve.tateModuleGaloisRepresentation`.
- **Locators verified:** about 60 line or page locators against the cached texts (every line locator
  of CaptainSude26, LeHung26, CN23, ACC23, AKT23 and MilneCM in the README, the OpenAI26 and CHT08
  page locators, and the printed pages of the References); all point at the stated result and page.
- **Checks tested:** all 93 Check bullets and the 8 Examples paragraphs read; every one with a
  numerical or structural assertion recomputed (table above); none false, vacuous or a restatement. Definitions (`protected`, protected prepared datum, `𝒮^P_χ`, the unipotent-inertia
  condition) have 3 or more discriminating Checks.
- **Declared gap.** `gap:acc-torsion-inertial-comparison`: same slug and `needs` sentence in
  `design/plan.json` and README line 300; supplier and section named; the contract matches ACC23
  lines 2309–2355; no roadmap states the theorem today (searched by `Theorem 3.1.1` and `t_{v,i}`).
- **Ownership.** No other roadmap on main, in the board's packages or at the open heads plans the
  protected condition, the lifting theorem at five or modularity over all CM fields (searched by
  object); EllipticCurveModularityTotallyReal owns only totally real bases.
- **P3 note (not a finding).** Theorem 1.1(b) has no consumer in a `*Needs:*` line: §2.2 descends by
  PotentialAutomorphyInfrastructure §2.3(2), whose hypotheses concern only the two end fields.

## Not verifiable

- The parent's proofs over a general CM base (its §§6.5, 6.6, 8.1 at a specialization over
  `F = K(μ₃ₚ)`): read as statements only; their truth belongs to the parent's review.
- §7.1(b)–(d) and §7.2(b) rely on the parent's nodal and compact-type models (§§2.1–2.3), whose
  geometry was not recomputed; only the local quotient and thickness arithmetic was.
- §7.4: compatibility of the added opens at `Σ` with the hypotheses of the parent's `seed_modular`
  (AKT23 §9) was checked only at the level of statements (its conditions are at places above 2 and 3
  and over `M = K(ζ₁₂, (Δ/Δ^c)^(1/6))`); the AKT23 proof was not reopened.
- No Lean was run (read-only pass, and the file has no declaration).

## Source issues

- none

Source independence: 12 passages read side by side with 4 sources (CaptainSude26 Lemmas 3.1–3.4, §4, Theorem 4.2, Lemma 5.1, Proposition 5.2; ACC23 §3.1 and §6.5.12; CN23 Theorem 5.2 and §5.6; MilneCM 1.4–1.6), and the whole README matched mechanically against the 8 cached texts (no shared run of 45 letters outside titles and author names), none shared; largest share CaptainSude26, 25 of 60 locators; contents compared with CaptainSude26 (§3 ↔ Layers 3 and 4 split by local/global, §4 ↔ Layer 5, proof of Proposition 5.2 split between Layers 6 and 7, Layers 1–2 from elsewhere): independent, the order being forced by L4←{3}, L5←{3,4}, L6←{3,5}, L7←{1,3,6}, L8←{1,2,7}.

## For the human reviewers

- **Scope.** Theorem 8.1 and Layers 3–7 rest on CaptainSude26, an unrefereed pseudonymous manuscript
  (README line 108); Theorem 2.5 on LeHung26, a discussion draft whose Theorem 1.1 (line 86) is
  conditional on inputs of OpenAI26. No refereed source states these headlines.
- **Licence.** CaptainSude26 has no stated licence (README line 1586; `sources.toml` class
  `author-page`, a GitHub release). OpenAI26 is read from a GitHub repository with no licence
  recorded in `sources.toml`.
- **Licence.** LeHung26 is hosted at a preprint site (`sources.toml` url host `hexagonmath.org`)
  classed `open-repository`, CC BY 4.0 by the README (line 1577); I could not classify the host.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "160a122eb495f95a8c207aa9597e6339f16dc27e", "job": "RT-EllipticCurveModularityImaginaryQuadraticPartII~1a", "model": "fable", "worker": "chris-x80"} -->
