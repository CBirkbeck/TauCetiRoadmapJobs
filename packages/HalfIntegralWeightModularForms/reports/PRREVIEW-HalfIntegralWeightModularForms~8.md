# Review of HalfIntegralWeightModularForms (pull request #1721 at b5d7563)

**Verdict:** needs changes

## R01 (P2) — odd-rank Hecke–Schoeneberg is statable at the pins but absent

**Location:** `TauCetiRoadmap/HalfIntegralWeightModularForms/Suggested.lean` 19–20: “Odd-rank lattice modularity lacks ThetaSeries' real-lattice theta-form bridge.”

**Claim:** The headline of §2.2 needs no bridge: every carrier in its statement is at the pinned Tau Ceti, as README 364–388 itself lists. The docstring's reason is false and the headline is missing.

**Witness:** Pinned `ZLattice.thetaSeries` (`ThetaSeries/Basic.lean` 102), `ZLattice.IsEven` (`ZLattice/Integral.lean` 75), `ZLattice.level` (`ZLattice/Level.lean` 113), `ZLattice.DiscriminantGroup` (`ZLattice/Determinant.lean` 90). The statement below elaborated on a scratch copy, `sorry` the only warning.

**Repair:** Delete the docstring sentence, import `TauCeti.NumberTheory.ModularForms.ThetaSeries.Basic`, `TauCeti.Algebra.Module.ZLattice.Level`, `TauCeti.Algebra.Module.ZLattice.Determinant`, `TauCeti.NumberTheory.LegendreSymbol.KroneckerSymbol`, and state under a `Layer 2` heading:

```lean
theorem thetaSeries_oddRank {E : Type*} [NormedAddCommGroup E] [InnerProductSpace ℝ E]
    [FiniteDimensional ℝ E] [MeasurableSpace E] [BorelSpace E] (L : Submodule ℤ E)
    [DiscreteTopology L] [IsZLattice ℝ L] (hL : ZLattice.IsEven L) (k : ℕ)
    (hk : Module.finrank ℝ E = 2 * k + 1) :
    4 ∣ ZLattice.level L ∧
    ∃ f : HalfIntegralForm k (Gamma1 (ZLattice.level L)), (⇑f = ZLattice.thetaSeries L) ∧
      ∀ γ ∈ Gamma0 (ZLattice.level L), ∀ z : ℍ,
        f (γ • z) * theta z ^ (2 * k + 1) =
          (TauCeti.kroneckerSym (2 * (Nat.card (ZLattice.DiscriminantGroup L) : ℤ)) (γ 1 1) : ℂ) *
            theta (γ • z) ^ (2 * k + 1) * f z := sorry
```

Name it in §2.2 and in the module docstring's list of stated headlines.

## R02 (P3) — `kroneckerSymNat` restates the pinned `TauCeti.kroneckerSym`

**Location:** `Suggested.lean` 395–399 (`def kroneckerSymNat`), used at 411; README 1479: “Prove that the two agree for `d ≥ 1`, so that the lift is stated through the consumed symbol.”

**Claim:** The README lists `TauCeti.kroneckerSym` as consumed (389) and then defines a second symbol with a comparison target. What exists at the pin is cited, not restated.

**Witness:** `TauCeti/NumberTheory/LegendreSymbol/KroneckerSymbol.lean` 84. On a scratch copy `kohnenLift` elaborates with `(TauCeti.kroneckerSym D d : ℂ)`, and `kroneckerSymNat D d = TauCeti.kroneckerSym D d` for `d ≠ 0` closes by `kroneckerSym_of_ne_zero` and `simp`.

**Repair:** Delete `kroneckerSymNat`; import `TauCeti.NumberTheory.LegendreSymbol.KroneckerSymbol`; in `kohnenLift` write `(TauCeti.kroneckerSym D d : ℂ)`. Replace README 1473–1482 (“Its Kronecker symbol … never reads that value.”) by: “Its Kronecker symbol `(D/d)` is `TauCeti.kroneckerSym D d`.” Keep the Kronecker Check of 5.3 without its last sentence on `d = 0`.

## R03 (P3) — a cited Tau Ceti declaration name does not exist

**Location:** README 351: “`TauCeti.ModularForm.finiteDimensional_modularForm_finiteIndex` in `TauCeti/NumberTheory/ModularForms/SturmBound.lean`”.

**Claim:** No declaration has this name at the pin; the instance is in namespace `TauCeti`.

**Witness:** `TauCeti/NumberTheory/ModularForms/SturmBound.lean` 93–98: `namespace TauCeti` … `instance finiteDimensional_modularForm_finiteIndex`. `#check` of the README's name: unknown identifier; of `@TauCeti.finiteDimensional_modularForm_finiteIndex`: resolves.

**Repair:** Write `TauCeti.finiteDimensional_modularForm_finiteIndex`.

## R04 (P3) — status words in the README

**Location:** README 1492 “(Kohnen 1982, uncertified)”, 1494 “pp.32–72, uncertified)”, 1551 “Corollaire 2, uncertified)”, 1597 “pp.237–268, uncertified)”; 1492 “has the same proof ownership”.

**Claim:** “uncertified” is a status of the source manifest and “proof ownership” is process vocabulary; the README is timeless.

**Witness:** Four occurrences of “uncertified” at the lines above; no other roadmap text on main uses the word in a locator.

**Repair:** Delete “, uncertified” at the four places, keeping the locators.

## R05 (P3) — two promised statements are not stated

**Location:** README 1492: “the character version has the same proof ownership in this section”; README 1549–1551: “The nontrivial-`χ` version and its character factor also belong to this section”.

**Claim:** Each promises a theorem with no statement, hypotheses or formula; §5.4 defines its spaces only for trivial character and §5.6 displays only the trivial-`χ` identity.

**Witness:** §5.4's standing sentence, README 1486: “For `N` odd and squarefree and trivial character”; §5.6's display (1542) has no character factor.

**Repair:** Delete both clauses, or state each as a target: for §5.6 the displayed identity with the factor `χ(t'/t)` and the twists by `χ⁻¹χ_{(−1)^k t}` with its hypotheses and locator; for §5.4 the spaces, the hypotheses on `χ` and the isomorphism.

## R06 (P3) — three garbled passages

**Location:** README 1626 “is the the holomorphic classical specialization”; 1643–1644 “`JacobiForm k 1` is the carrier on which the sibling Section 6.4 supplies the general index maps on this carrier.”; 1055–1056 “the Kronecker symbol of the squarefree-free part (write `2s = u v²` with `u` a squarefree-with-sign integer times a power of `2`”.

**Claim:** The second sentence has no meaning as written, and “squarefree-free part” and “squarefree-with-sign integer times a power of `2`” are not defined terms; `s > 0`, so no sign occurs.

**Witness:** `s = 24`: `2s = 48 = 3 · 4²`, `u = 3`; `s = 2`: `u = 1`; `s = 512`: `u = 1`; these are the three calibrations of README 1066–1068, each with `u` a positive squarefree integer.

**Repair:** 1626: “is the holomorphic”. 1643–1644: “`JacobiForm k m` is the carrier on which §6.4 defines the index maps `U_d` and `V_l`, and on which SiegelModularForms §9.2 states `E_{k,1}`.” 1055–1057: “`(2s/d) := (u/d)`, where `2s = u v²` with `u` a positive squarefree integer and `v ∈ ℚ_{>0}`”.

## Previous findings

- R01 of the review of a6d185b (description said three Layer 5 theorems are “stated”): repaired. The description now reads “the Kohnen–Zagier formula, Waldspurger's theorem and the Shintani lift with its cycle-integral formula, all as proof targets”.
- Its remark on Dedekind sums and eta closed forms owned twice: repaired. README 179–182 lists them under *Not owned here* as ModularForms §0.2's; `Suggested.lean` no longer declares `dedekindSum` or the eta transformation theorems; main's `TauCetiRoadmap/ModularForms/README.md` 395–470 has each consumed item.

## Verified sound

| Statement | Instances and computed values | Result | Change |
|---|---|---|---|
| 0.1 `j(−I) = 1`, `W₄`-law | `z = i`: `θ(i/4) = √2·θ(i)`, `θ(i) = 1 + 2e^{−2π} = 1.003735`, both sides `1.41950` | holds | none |
| 0.3 product characters; `finiteDimensional` | `j^{2k+1}j^{2l+1} = (χ₋₄(d)(cz+d))^{k+l+1}`; `γ = [[7,4],[12,7]]`: det `49 − 48 = 1`, `χ₋₄(7) = −1`; `Γ = ⟨T⟩` infinite-dimensional, so finite index needed | holds; Lean carries both hypotheses | none |
| 0.6 `finrank_four`, `finrank_cuspSpace_four` | `⌊(2k+1)/4⌋ + 1 = k/2 + 1` for `k = 0…4`: `1,1,2,2,3`; cusp `k = 2,3,4`: `0,0,1`; `F`: `σ(2) − 3σ(1) = 0`, `σ(4) − 3σ(2) + 2 = 0`; `(W₄F)(∞) = 3/48 = 1/16` | holds | none |
| 1.1 `T(p²)` | `θ`, `p` odd: `n = 0`: `1 + 1/p`; `n = 1`: `2 + 2/p` | eigenvalue `1 + p⁻¹` both | none |
| 1.2 Euler product | `θ`, `p = 3`: `(1 − X/3)/((1 − X)(1 − X/3))`; `δ`: `252 − 3⁵ = 9 = a(9)` | holds | none |
| 1.3 `shimuraNiwaCipra` | `δ`: `A₁(2) = −56 = τ(2) − 32`; `h_{χ₋₄,3}`, `N = 192`: `2,0,−6,0,12`; `2η(8z)³`, `t = 1`: `A₁(n) = 2χ₋₄(n)σ(n)`, a twist of `F`, level `16 ∣ 32`; `χ(3) = i` mod 16: `χ(9) = −1`, `χ²(9) = 1` | holds incl. `k = 1`; `χ²` descends | none |
| 2.1 level and character | `A₁`: `(4/d) = 1`; `A₃`: det 4, level 8, `(8/3) = −1`; `diag(2,2,6)`: level 12, `(48/5) = (3/5) = −1`; rank 1, `√(2a)ℤ`: `(4a/d) = (a/d)`, the character of `θ(az)` | holds | none |
| 2.2 odd-rank theorem | `((−1)^{k+1}2 det L/d)(−1/d)^{k+1} = (2 det L/d)`; `E₇`: `14 + 112 = 126` | holds; Lean statement missing | R01 |
| 2.3 coset series | `√2ℤ`: `θ₀ + θ_{1/√2} = θ(z/4)`; nontrivial coset `2q^{1/4} + 2q^{9/4}`, `T` acts by `e(1/4) = i` | holds | none |
| 2.4 lattice column | `A₁`: norm list `1,0,2,0,0`, `q`-series `1,2,0`; rank `≥ 3`: `χ² = 1`, target `M_{n−1}(N/2, 1)` | consistent with 1.3 | none |
| 3.1 real-weight factors | `γ = δ = −I`: `σ_{1/2} = i·i = −1`, `σ_1 = 1`, `σ_{√2} = e(√2)` | holds | none |
| 3.3 `ν_η` | `S`: `exp(−πi/4)` both forms; `[[1,0],[2,1]]`: `e((4+3−3−6)/24) = e(−1/12)` and `exp(πi(1/12 − 1/4))` | agree | none |
| 3.4 eta-quotient character; `theta_eq_eta_quotient` | via `fθ`: `χ(d)(−1/d)^{k+1} = ((−1)^{k+1}2s/d)` gives `(2s/d)`; `θ`: sums `−2+10−8 = 0`, `N(−2+5/2−1/2) = 0` | holds | R06 (wording) |
| 4.1 unary theta, Fricke law | Poisson: `θ_ψ(−1/(4r²z)) = (r/g(ψ̄))(−2iz)^{1/2}θ_ψ̄(z)`, `r/g(ψ̄) = g(ψ)`; `ψ = 1, t = 2, z = i`: `θ(i/8) = 2θ(2i) = 2.0000139` | holds | none |
| 4.2 `serreStark` | `N = 4`: 1 index; `N = 8`: `θ(z), θ(2z)`, 2 = two even characters; `N = 16`: `t = 1,2,4`; conductor 7 cubic at 196: 1 index | basis count consistent | none |
| 4.3 `serreStark_cusp`, `TotallyEven` | `χ₁₂`: `(a,b,u) = (4,3,7)`, `χ₁₂(7) = −1`; `r = 1`: totally even; smallest conductor `3·4 = 12`, level `576` | definition is the local-parity test | none |
| 4.5 theta subspace | `k = 1`: `χ(p)(−tm²/p) = ψ(p)`, eigenvalue `ψ(p)(1+p)`; `p = 3, 5`: `−4, 6` | holds | none |
| `unaryTheta_chi12`, `unaryThetaOdd_chi4` | `χ₁₂(5) = 1·(−1)`, `χ₁₂(7) = −1`, `χ₁₂(11) = 1`: `2q − 2q²⁵ − 2q⁴⁹ + 2q¹²¹`; `2(q − 3q⁹ + 5q²⁵)` | equal `2η(24z)`, `2η(8z)³` | none |
| 5.1 `plusSpace`; `finrank_plusSpace` | `θ⁵ − 20θF`: `1, −10, 0, 0, 90 − 160 = −70`; `k = 1`: `θ³` has `6q`, dim 0 = dim `M₂`; `k = 0` also `1 = 1` | holds | none |
| 5.2 `W₄U₄` | `[[6,1/2],[−80,−8]]`: `λ² + 2λ − 8`, roots `−4, 2`; `α_k` signs `k = 2…8`: `−,+,+,−,−,+,+` | holds | none |
| 5.3 `kohnenLift` | `δ`: `A(4) = −704 − 1792 + 1024 = −1472 = τ(4)`; `D = 5`: `960 − 3840 = −2880`, `59400 − 29160 = 30240` | holds; symbol duplicated | R02 |
| 5.5 Kohnen–Zagier | KohnenZagier1981 lines 100–114: constant `(k−1)!/π^k`, `|D|^{k−1/2}`, the `1/6`, absolute squares; table lines 149–163 equals README 1914 term by term | agrees | none |
| 5.6 Waldspurger | `17 ≡ 1 (mod 8)`; `c(17)² = 57600`; identity homogeneous of degree 2 in `g` | consistent; `χ` version unstated | R05 |
| 5.7 Shintani | `(−1)^{k/2}2^k · i^kΓ(k)(2π)^{−k} = Γ(k)π^{−k}`; adjoint's first coefficient `|c(1)|²⟨f,f⟩/⟨g,g⟩ = (k−1)!π^{−k}L(f,k)` by 5.5; KohnenZagier1981 line 360 has the isomorphism hypothesis | consistent with 5.5 | none |
| 6.2 theta decomposition | `k = 4, m = 1, τ = 2i`: `e(1/8)(2i)^{7/2}/√2 = 8`; `T`: `e(−μ²/4m)` | holds | none |
| 6.3 `J_{k,1}` | `(2,6)`: `0+0+0+0+0+0−1 = −1`; `(4,1)`: `1+1−1 = 1`; `(11,2)`: `2 − 1 = 1`; `E_{4,1}`: `1,56,126,576,756` | holds | none |
| 6.4 Skoruppa–Zagier | SkoruppaZagier1988 lines 874–886 (Theorem 5, p.137), 901–907 (`B_{l,d}`, (2), p.138); `E₆Δ`: `−528 + 512 = −16` | agrees | none |

- Source locators checked against the text: 11 (KohnenZagier1981: (1)–(2) p.176, Theorem 1 p.177, table p.178, (4) p.182, Shintani's map and Corollary 8 p.183; SkoruppaZagier1988: (1) p.136, Theorem 5 p.137, `B_{l,d}` and (2) p.138, (3)–(5) pp.138–139); all agree.
- Library declarations opened at the pins: 34 Tau Ceti names of README 349–407 resolved to file and line (1 wrong, R03); Mathlib `Int.IsFundamentalDiscr` (`FundamentalDiscriminant.lean` 41), `ModularForm.eta` (`DedekindEta.lean` 57), `eta_comp_eq_csqrt_I_inv` (`Discriminant.lean` 136).
- Cross-roadmap citations resolved: ModularForms on main (§0.2 at 395–470; the earlier layer labels through its table at 330–348), ThetaSeries on main (6F, 7C, 7D, 7E; the consumed names in its `Suggested.lean`), IntegralLattices (1G, 1H, 3B), and at their open heads AutomorphicBundles §§11.3–11.4, GeometryOfNumbersAndQuadraticArithmetic §4.3 (five names), MetaplecticAutomorphicForms 4.7, 6.17, 6.18, 6.20, 7.1, 7.10, 7.49, QSeriesPartitionsAndMockModularForms §§5.2, 6.1, 9.1, SiegelModularForms (consumer). None missing.
- Gate: every check `0`, `build=0 OK`. Dependency check: `depcheck: 244 roadmaps, 2231 edges, 0 problem(s)`; no UPWARD, CYCLE or moved line. Nothing changed outside the folder.
- Elaboration: `lake env lean` on `Suggested.lean`: exit 0, 13 warnings, all `declaration uses sorry`. Signatures: 0 of 36 lost a binder; each compared with its README statement.
- One-tactic probe (`rfl`, `infer_instance`, `simp`, `decide`, `exact?`) on all 13 sorried theorems: none closes.
- Description: title, summary block, prose and file bullets read against the head; “8 layers and 38 milestones” is `6+3+4+4+7+7+4+3 = 38`; no sentence contradicted.

Overlap check: read SiegelModularForms, MaassForms, QSeriesPartitionsAndMockModularForms (open), ThetaSeries, ModularForms, NoncongruenceModularForms (main); Jacobi carrier in classical form and §6.4's operators: this roadmap (SiegelModularForms consumes them); odd-rank theta modularity: this roadmap (ThetaSeries excludes it); `ν_η`: QSeriesPartitionsAndMockModularForms §5.2; Dedekind sums, eta closed forms, cusp orders: ModularForms §0.2; Kronecker symbol: Tau Ceti (R02).

Source independence: 9 passages compared with 2 sources (KohnenZagier1981, SkoruppaZagier1988), none shared beyond formulas; largest share Shimura 1973, about 15 of 58 locators; its text and contents page could not be read, so the arrangement was not compared with it. Against the two sources read, no layer follows their sections.

## Not verifiable

- Shimura 1973 (JSTOR), Serre–Stark 1977, Kohnen 1980 and 1985 (Springer), Kohnen 1982 (de Gruyter), Waldspurger 1981: paywalled; locators for sampled 0.1, 1.2, 1.3, 4.3, 4.5, 5.1 not checked against the text.
- Niwa 1974, Cipra 1983, Shintani 1975: the Project Euclid and Cambridge copies refused automated access; the locators of 1.3 and 5.7 into them were not checked.
- Eichler–Zagier 1983 preprint: no legal copy found; Theorems 5.1, 5.4, 9.2 and the preprint page numbers of 6.2–6.3 not checked.
- Koblitz, Apostol, Knopp, Ligozat, Cohen: books and paywalled articles, not read; 0.6 and 3.3 were checked by computation only.

## Source issues

- none

## For the human reviewers

- **Not tested.** Shimura 1973 has the largest share of locators (about 15 of 58) and could not be read; wording and arrangement were compared only with KohnenZagier1981 and SkoruppaZagier1988.
- **Licence.** README 1986–1988 cites Eichler–Zagier by an unpublished 1983 MPIM preprint's page numbers rather than the 1985 book; no copy of the preprint was found to confirm its numbering.
