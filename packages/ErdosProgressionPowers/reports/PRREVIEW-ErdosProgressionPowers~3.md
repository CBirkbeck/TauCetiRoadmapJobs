# Review of ErdosProgressionPowers (pull request #1336 at 0a5da24)

**Verdict:** needs changes

Three findings: one P2 and two P3. The gate passes at this head (every check, build included), the outside-folder diff is empty, and the dependency check reports no problem. The P2 is a consequence of the pin update that came with the merge of main into this branch: the pinned Tau Ceti (`2fd255d9`) now has the elliptic conductor carrier that `Suggested.lean`'s docstring says is missing, so the two theorems it excludes for that reason are statable and absent.

**Previous review (r2 at 883fd29), finding by finding.**

- **Previous R01 (P3, graph constructor name): repaired.** `TauCetiRoadmap/ErdosProgressionPowers/README.md:213`–215 now reads “Use `SimpleGraph` and `completeBipartiteGraph` from `Mathlib/Combinatorics/SimpleGraph/Basic.lean` and `SimpleGraph.Free` from `Mathlib/Combinatorics/SimpleGraph/Copy.lean`”. At the pin `#check @completeBipartiteGraph` gives `(V : Type u_1) → (W : Type u_2) → SimpleGraph (V ⊕ W)` and `SimpleGraph.Free` elaborates.

The 360 changed lines since 883fd29 replace the exceptional-zero branches of both analytic routes by the uniform exclusion of Landau–Siegel zeros (AnalyticNumberTheoryPartI §0.34), move the local ramification contract from LocalFieldsRamification layers to pinned Tau Ceti declarations, and put `Suggested.lean` under the module system. All three were reviewed in full, together with every unchanged passage.

## R01 (P2) — §1.12 and §2.7 are statable at the pin but absent from `Suggested.lean`

**Location.** `TauCetiRoadmap/ErdosProgressionPowers/Suggested.lean:14`–20: “The comparison-curve theorem (README section 1.12) and the full simultaneous quadratic-character family (section 2.7) are not statable at the pins: they need the arithmetic conductor and deletion level of the progression Frey curve, together with its residual Galois-representation comparison.” The same reason at `README.md:628`–632.

**Claim.** The two theorems the README names as headline-class results are left out because no carrier for the conductor, the deletion level or the torsion comparison exists at the pins.

**Witness.** At the pinned Tau Ceti `2fd255d9` the file `TauCeti/AlgebraicGeometry/EllipticCurve/TateAlgorithm/Reduction/Conductor.lean:103` defines `WeierstrassCurve.algorithmicConductor O W : Ideal O` for an elliptic `W` over the fraction field of a Dedekind domain (Ogg's exponent at every height-one prime; its docstring says that by Ogg's formula it is the conductor), with a `ℚ`/`ℤ` section at lines 247–293 (`one_lt_absNorm_algorithmicConductor_iff`, `pow_dvd_absNorm_algorithmicConductor_iff`). This file did not exist at the previous pin `a91d3aaf` (checked with `git cat-file`), which is why the docstring was true when r2 read it. `TauCeti/AlgebraicGeometry/EllipticCurve/MinimalModel/DiscriminantIdeal.lean:170` defines `minimalDiscriminantIdeal`, so the deletion level `M/∏{q ∥ M : ℓ ∣ v_q(Δ_min)}` is an elementary definition on `Ideal.absNorm`, `Nat.primeFactors` and `padicValNat`. Mathlib `Mathlib/AlgebraicGeometry/EllipticCurve/Affine/Point.lean:822` gives `Affine.Point.map (f : F →ₐ[S] K)` on points of a base change, hence the Galois action of `Ω ≃ₐ[ℚ] Ω` on `E[ℓ](Ω)`, and `TauCeti/AlgebraicGeometry/EllipticCurve/TateModule/Galois.lean` packages that action. Dirichlet characters, `MulChar.IsQuadratic`, `IsPrimitive` and `ArithmeticFunction.vonMangoldt` are native. On a scratch copy, the following elaborated at the pin with `sorry` as the only warning (after `lake build TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor`, 7 s):

```lean
import Mathlib
import TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor
open WeierstrassCurve
open scoped WeierstrassCurve Classical

/-- The first Frey curve `Y² = X(X−a)(X+c)` of a triple: coefficients `(0, c−a, 0, −ac, 0)`. -/
noncomputable def freyCurve (n d : ℤ) (i j h : ℕ) : WeierstrassCurve ℚ :=
  let g : ℤ := Int.gcd (term n d i) (Int.gcd (2 * term n d j) (term n d h))
  let a : ℚ := (term n d i : ℚ) / g
  let c : ℚ := (term n d h : ℚ) / g
  ⟨0, c - a, 0, -(a * c), 0⟩

/-- The deletion level: the conductor with every `q ∥ M` such that `ell ∣ v_q(Δ_min)` removed. -/
noncomputable def deletionLevel (E : WeierstrassCurve ℚ) [E.IsElliptic] (ell : ℕ) : ℕ :=
  let M := Ideal.absNorm (algorithmicConductor ℤ E)
  let D := Ideal.absNorm (minimalDiscriminantIdeal ℤ E)
  M / ∏ q ∈ M.primeFactors.filter (fun q => padicValNat q M = 1 ∧ ell ∣ padicValNat q D), q

def HasFullRationalTwoTorsion (E : WeierstrassCurve ℚ) : Prop :=
  Nat.card {P : E.toAffine.Point // 2 • P = 0} = 4

local notation "Ω" => AlgebraicClosure ℚ

/-- The `ell`-torsion of `E` over an algebraic closure of `ℚ`. -/
noncomputable def ellTorsion (E : WeierstrassCurve ℚ) (ell : ℕ) :
    AddSubgroup (E⁄Ω).toAffine.Point where
  carrier := {P | ell • P = 0}
  add_mem' := by
    intro a b ha hb; change ell • (a + b) = 0; rw [nsmul_add]
    change ell • a = 0 at ha; change ell • b = 0 at hb; rw [ha, hb, add_zero]
  zero_mem' := by change ell • (0 : (E⁄Ω).toAffine.Point) = 0; simp
  neg_mem' := by
    intro a ha; change ell • a = 0 at ha; change ell • (-a) = 0; rw [neg_nsmul, ha, neg_zero]

/-- §1.12. -/
theorem comparison_curve {n d : ℤ} {k : ℕ} {y : ℤ} {ell : ℕ} (hH : H n d k y ell)
    {i j h : ℕ} (hk : h < k) (hij : i < j) (hsum : i + h = 2 * j)
    (hE : (freyCurve n d i j h).IsElliptic) :
    ∃ F : WeierstrassCurve ℚ, ∃ _ : F.IsElliptic, HasFullRationalTwoTorsion F ∧
      Ideal.absNorm (algorithmicConductor ℤ F) = deletionLevel (freyCurve n d i j h) ell ∧
      ∃ e : ellTorsion (freyCurve n d i j h) ell ≃+ ellTorsion F ell,
        ∀ (σ : Ω ≃ₐ[ℚ] Ω) (P Q : ellTorsion (freyCurve n d i j h) ell),
          (Q : ((freyCurve n d i j h)⁄Ω).toAffine.Point) = Affine.Point.map σ.toAlgHom P →
          (e Q : (F⁄Ω).toAffine.Point) = Affine.Point.map σ.toAlgHom (e P) := by sorry
```

For §2.7 the same carriers suffice: with `smallPart k t := ∏ p ∈ t.natAbs.primeFactors.filter (· < k), p ^ padicValNat p t.natAbs` and `oddPart N := N / 2 ^ padicValNat 2 N`, the statement “under `H` and `2·10¹⁰ ≤ k`, every triple of `A(k)` has `N`, `χ : DirichletCharacter ℂ N` primitive and quadratic with `‖∑ m ∈ Finset.Ioc (k/2) k, χ m * Λ m‖ > 0.1239 k`, `Squarefree (oddPart N)`, `oddPart N ≠ 1`, `oddPart N ∣ deletionLevel (freyCurve n d i j h) ell`, `oddPart N ∣ smallPart k t_i * smallPart k t_j * smallPart k t_h` and `N ≤ 8 * oddPart N`” elaborated on the same scratch copy (10 s, `sorry` the only warning).

**Repair.** Add the definitions above (real bodies on native carriers, no sorry'd data) and state §1.12 and §2.7 in `Suggested.lean`, importing `TauCeti.AlgebraicGeometry.EllipticCurve.TateAlgorithm.Reduction.Conductor` after `import Mathlib`; delete the docstring sentence that calls them not statable, and update `README.md:628`–632 and the API bullets of §§1.12 and 2.7 so that each backticked name is declared. The conductor of `F` is rendered by the norm of its algorithmic conductor, which is the conductor by Ogg's formula (the roadmap's Conventions and EllipticCurves Layer 8 already keep the algorithmic–Artin comparison distinct); say so in the docstring. The hypothesis `hE` is harmless (under `H` the Frey curve is elliptic, §1.3) and can be replaced by a `haveI` once §1.3 is proved. If the author prefers to keep one of the two out, the docstring must give a reason that holds at the pin.

## R02 (P3) — `padicValNat_def` is `Nat.padicValNat_def` at the pin

**Location.** `TauCetiRoadmap/ErdosProgressionPowers/README.md:1489`: “*Needs:* … Mathlib `padicValNat_def`; Mathlib `Nat.factorization`.”

**Claim.** The deletion construction cites the unfolding lemma of `padicValNat` by that name.

**Witness.** `#check @padicValNat_def` at the pin: unknown identifier. The lemma is declared inside `namespace Nat` (`Mathlib/Data/Nat/PadicValNat.lean:17`, theorem at line 31); `#check @Nat.padicValNat_def` gives `∀ {p n : ℕ}, padicValNat p n = multiplicity p n`.

**Repair.** Write `Nat.padicValNat_def` (one token). Every other Mathlib name the README cites elaborated by `#check` (list under Verified sound).

## R03 (P3) — effectivity of `c_LS` is attributed to sources that prove an absolute constant

**Location.** `TauCetiRoadmap/ErdosProgressionPowers/README.md:505`–511: “there is an effective absolute c_LS>0 with (1−β)log q≥c_LS … (OpenAI2026, Theorem 1; Green2026, Theorem 1.1)”; repeated at lines 2156–2158 and the reference entries at 2257–2258.

**Claim.** The cited texts support the exclusion with an effective constant.

**Witness.** OpenAI2026 line 23–25: Theorem 1 asserts an absolute constant `c>0`; OpenAI2026 lines 444–475 (§6) prove it by contradiction along a sequence of characters with `q→∞` and `(1−β)log q→0`, taking an upper limit, so the text yields no computable `c`. The effectivity is AnalyticNumberTheoryPartI's own claim: its §0.34 (at the head of #1126) states “absolute, effectively computable” and derives it from its §§0.34b–0.34c with explicit `δ ≥ 1/(16AC)` above an effective threshold and from its §0.12 below it. Green2026 could not be read (below).

**Repair.** Cite the two sources for the exclusion with an absolute constant and attribute the effective constant and threshold to AnalyticNumberTheoryPartI §0.34 (its §§0.34b–0.34c and §0.12), at lines 505–511, 2156–2158 and in the two reference entries. Keep the statement that `c_LS` is effective, since that is the supplier's contract. Note for the author and the human reviewer, not a separate finding: the effective headline `effective_prime_bound` now rests entirely on that supplier claim, whereas the branches removed since 883fd29 (Proposition 7.2's exceptional-character branch with ComputationalNumberTheory §4.24, and Layer 5's real-zero separation) were effective by explicit finite inputs; if the supplier's effectivity is ever weakened, this roadmap loses its effective threshold on both routes.

## Verified sound

**Coverage and mechanical checks.** Read all 57 numbered subsections, the conventions, every supplier contract, the integration requirements and the references; compared each of the 9 Lean declarations with its README statement; resolved the 20 roadmap suppliers and the 6 resolver leads; verified the 15 seeded source targets and every locator the diff touched. Pins: Mathlib `1b1ccf4b`, Tau Ceti `2fd255d9` (both newer than the pins r2 read). `lake env lean` on `Suggested.lean`: 11 s, exactly six `declaration uses sorry` warnings, nothing else. The worker's gate at this head passes every check; `git diff --stat origin/main...HEAD` outside the folder is empty; the folder holds README.md, Suggested.lean and metadata.toml. Merge order: `ORDER.txt` line 195, directly after EllipticCurveModularityPartII (194); AnalyticNumberTheoryPartI is line 90, ComputationalNumberTheory 193, EllipticLegendreCharacterInterfaces 96. The dependency check returned

```text
depcheck: 239 roadmaps, 2426 edges, 0 problem(s)
```

with no UPWARD, CYCLE or moved line.

**Lean form.** The file is `module` / `import Mathlib`, one docstring, one namespace, layer section comments, `theorem` throughout, no `set_option`, no `#eval`, no sorry'd data, no `lemma`. Eighteen roadmaps on main use the same header shape (`module` with a private `import`, no `public section`), so it is accepted practice; its consequence, checked by importing the built module from a scratch file, is that none of the nine declarations is visible to an importer (all are module-private). On the scratch copy `#check @name` for all nine declarations matched the README: integer signs, `Int.gcd`, prime `ell` in `effective_prime_bound`, `k0 ≥ 5`, `k ≥ 10⁸` and `ell > exp(10^k)` in `H`, `2·ell + k < k·ell` for the signed finiteness, `k + ell ≥ 6` and positivity for the positive one, `2 ≤ ell` and `y·d ≠ 0` in the fixed-length statement, `0 < n`, `2 ≤ k`, `2 ≤ ell` and no hypothesis on `y` in the consecutive-product theorem. No section binder is lost (there are no `variable` blocks). Each of the six sorried theorems was tried with `simp_all` (after unfolding the three definitions), `rfl`, `infer_instance`, `omega`, `decide` and `aesop`: none closed, so nothing is padding. The three definitions have real bodies and are used by the headlines.

**Supplier resolution** (every citation re-resolved at main or at the open head; line numbers are those of the cited README).

| Supplier | Where and what was found |
| --- | --- |
| AnalyticNumberTheoryPartI (#1126) | §0.1 l.182 (`ExceptionalRealZero.empty` at width ≤ `c_LS`), §0.3 l.229, §0.4 l.238, §0.5 l.253, §0.6 l.265 (exception-free bounded-height theorem, `q ≤ T`, `|t| ≤ T`, `β > 1−c/log T`), §0.8 l.299, §0.16 l.525, §0.18 l.552 (no `−X^β/β` term, absolute threshold), §0.19–0.20, §0.25 l.647, §0.34 l.805 (`landau_siegel_exclusion`, `q ≥ 3`, effective), §1.4 l.927 (`k ≥ 4`, `2 ≤ T ≤ k`, both endpoint corrections, kernel bounded at 0 in §1.4c), §1.7 l.1013 (log-free, no additive term), §3.1 l.1942. Its §0.7 and §3.2 are no longer consumed; the README says so at l.555–559. |
| ComputationalNumberTheory (#1408) | §4.22 l.2491: `H(q) = max(10⁸/q, …)`, so `H(1) ≥ 10⁸`, `H(4) ≥ 2.5·10⁷`, `H(8) ≥ 1.25·10⁷`, all above 10000. §4.24 is no longer cited. |
| EllipticCurveModularityPartII (#1491) | §1.4 l.225 (`12 g⁺(N) ≤ N+1`, `N ≥ 1`), §1.8 l.288 (`F♯ ≤ F_K`, `G♯ ≤ G_K`, `H♯ ≤ H_K`, `N > 0`), §2.2 l.319 (`ℓ ≤ (√p+1)^((M₀+1)/6)`), §4.7 l.477 (Kraus realization, `ℓ > H♯(N)`), §5.4 l.607 (`ℓ ≥ 5`), §5.5 l.615 (`ℓ ≥ 11`), §6.18 l.1038 (`p > 37`). EC.0–EC.5 match. |
| EllipticLegendreCharacterInterfaces (#1545) | §§0.1–0.6, 0.8–0.10 (l.65–226), §1.2 l.276, §1.4 l.307, §1.5 l.323, §§2.1–2.8 (l.350–445), §3.1 l.470, §3.7 l.528 (`v₂ = 3` for `q ≡ 5 mod 8`), §4.1 l.556, §5.1 l.592, §5.2 l.612 (`quadraticChar(d)` times the trace). |
| ArithmeticGaloisRepresentations (#856) | §1.9 l.1186 (`IntegralModel.reduction`, `IntegralModel.residualSS`, `ContinuousRep.residual` at l.1198–1200), §3.1 l.2588, §3.2 l.2677 (`Conductor.artinConductor`, `artinConductorNat` as intended signatures at l.2681–2682), §3.3 l.2791 (`Conductor.primeToPConductor` l.2819). |
| AutomorphicGaloisRepresentations (#1007) | §1.5 l.1646: arithmetic dual with polynomial `X² − a_p X + ψ(p)p^(k−1)`, continuous, unramified outside `Nℓ`. |
| EllipticCurveModularity (#1018) | Layers R29.3 l.1021, R29.4 l.1262, R29.6 l.1606. |
| WeightsInEtaleCohomology (#1001) | R34.5 l.585, R34.6 l.691; `newform_ramanujan` l.707 (every embedding, every prime away from the level). |
| HeightsRationalPointsAndObstructions (#1017) | §5.12 l.2587, §6.4 l.2929 (`mordell_finite` on the native scheme signature). MordellLawrenceVenkatesh (#1231) §11.6 l.3020 proves that same declaration. |
| NeronModelsAndSemistableAbelianVarieties (#852) | §5.3g l.3562 (`f_2 ≤ 8`, `f_3 ≤ 2+3v_K(3)`), §5.3h l.3586 (actual `E[ℓ]`, `ℓ ≥ 5`, deletion of `q ∥ N_E` with `ℓ ∣ v_q(Δ_min)`). |
| SerreWeightAndLevelOptimisation (#1013) | §6.1 l.1368 (`ℓ ≥ 3`, `q = ℓ` included), §6.2 l.1400 (modularity witness, irreducible `E[ℓ]`, totally real coefficient field), §6.3 l.1418 (good primes and `±(q+1)` at removed primes, `q ≠ ℓ`). |
| On main | EllipticCurves Layers 2–8 (l.647–1374) and `freyCurve` l.1583; ModularForms Layers 2–4, 8, 10 (l.383–1024); ModularCurves §4C l.1100; ClassicalArithmeticCompletion §1.51 l.1789 (2-part 1, 4 or 8; odd part 1 iff `±1, ±2`), §1.32 l.1296 (`v₂(N) ≤ 3`), §4.41 l.8840; ImaginaryQuadraticClassNumber H3.1 l.83; AlgebraicCurves Layer 7 l.783, 12E l.1640; EtaleCohomologyFoundations F.4.0 l.850 (`exists_stable_lattice_iff` l.874, `GaloisLattice.IntegralModel` l.885). |

The six resolver leads are false: the five Lean names are intended signatures stated in ArithmeticGaloisRepresentations §§1.9, 3.2–3.3 and EtaleCohomologyFoundations F.4.0 at the lines above, and “ErdosSelfridge1975, §2.1” is a source locator.

**Pinned Tau Ceti declarations opened** (all present at `2fd255d9`): `TauCeti.LocalFieldsRamification.lowerRamificationGroup` (`TauCeti/NumberTheory/LocalField/RamificationGroup.lean:99`), `lowerRamificationGroup_zero` (127, inertia of the maximal ideal of `𝒪[L]`), `lowerRamificationGroup_antitone` (134), `lowerRamificationGroup_eq_bot_of_largestLowerJump_lt` (245); `herbrand` (`Herbrand/Basic.lean:258`), `inverseHerbrand` (262), `upperRamificationGroup` (421, `G^v = G_{ψ(v)}`); `map_restrictNormalHom_upperRamificationGroup` (`Herbrand/UpperQuotient.lean:98`, tower `M/L/K` with `L/K`, `M/K` Galois); `TauCeti.inertiaSubgroup` (`Unramified/Inertia/Basic.lean:112`), `TauCeti.wildInertiaSubgroup` (`WildInertia.lean:251`), `TauCeti.map_inertiaSubgroup_restrictNormalHom` (`Unramified/Inertia/Finite.lean:57`), `TauCeti.map_wildInertiaSubgroup_restrictNormalHom` (`WildInertia.lean:702`); `WeierstrassCurve.pointCount` (`PointCount.lean:73`), `frobeniusTrace` (101); `CongruenceSubgroup.Gamma0_prime_power_index` (`CongruenceSubgroups/Basic.lean:763`, prime `p`, `0 < k`); `fundamentalDiscriminantChar` (`FundamentalDiscriminant/Character.lean:38`), `fundamentalDiscriminantChar_natCast_eq_legendreSym` (100); `conductor_ringHomComp` (`DirichletCharacter/Conductor.lean:45`), `isPrimitive_ringHomComp_iff` (53); `quadraticTwistOf` (`QuadraticTwist/Basic.lean:164`), `Δ_quadraticTwistOf` (234, `(t²−4n)⁶ Δ`), `quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` (945); `Affine.μ` (`MordellWeil/XSubT.lean:861`), `exists_eq_two_smul_iff` (922), `ker_μ_eq`. The variable block of `RamificationGroup.lean` (lines 95–97) carries exactly the hypotheses the README states at l.265–267 (`IsNonarchimedeanLocalField L`, `ValuativeExtension K L`, `Module.Finite K L`).

**Pinned Mathlib names** elaborated by `#check`: `Int.gcd_def`, `Int.gcd_greatest`, `Int.dvd_of_dvd_mul_left_of_gcd_one`, `Nat.factorization`, `Nat.prod_factorization_pow_eq_self`, `padicValInt.mul`, `WeierstrassCurve.Δ`, `c₄`, `j`, `IsElliptic`, `Affine.Equation`, `DirichletCharacter.conductor`, `IsPrimitive`, `MulChar.IsQuadratic`, `ringHomComp`, `ringHomComp_apply`, `IsQuadratic.comp`, `DirichletCharacter.LFunction`, `ZMod.LFunction_apply_zero_of_even`, `LFunction_ne_zero_of_one_le_re`, `ArithmeticFunction.vonMangoldt`, `Nat.maxPrimeFac` (`maxPrimeFac_zero`, `maxPrimeFac_one` at `Mathlib/Data/Nat/MaxPrimeFac.lean:42`–43 give the values 0 and 1 the Conventions quote), `Chebyshev.theta`, `psi`, `Chebyshev.theta_le_log4_mul_x` (`Mathlib/NumberTheory/Chebyshev.lean:191`, hypothesis `0 ≤ x`), `roth_3ap_theorem_nat`, `Stirling.stirlingSeq`, `log_stirlingSeq_sdiff_le`, `tendsto_stirlingSeq_sqrt_pi`, `le_factorial_stirling`, `Nat.exists_prime_lt_and_le_two_mul`, `SimpleGraph`, `completeBipartiteGraph`, `SimpleGraph.Free`, `Nat.factorial_le_pow`, `Real.log_two_gt_d9`, `Real.log_two_lt_d9`. Only `padicValNat_def` failed (R02).

**Seeded source checks.** BS20 is cited as the published Annals text (cache page `N` = printed page `N+354`); DG95 as the author-hosted scan; Kraus1997 as the Cambridge open text.

| Sampled target | Locator read | Hypotheses and result |
| --- | --- | --- |
| §0.3 Large-prime valuation divisibility | BS20 line 249–253, Lemma 3.1(ii), p. 360 | Prime `q ≥ k`, nontrivial solution, prime `ℓ`: `ℓ ∣ ord_q(n+id)`; (6) at line 255–257 fixes `A_i` positive with primes `< k`. Matches, nonzero terms retained. |
| §1.1 General modular comparison interfaces | BS20 line 184–207, Theorem 3, Lemmas 2.1–2.2, (4), p. 359; line 213–239, (5), `F,G,H`, Theorem 4, p. 360 | Irreducible `E[ℓ]`, totally real coefficient field, `p ∤ ℓMM₀` and `p ∤ ℓM₀, p ∥ M` congruences, Martin's `g₀⁺(M₀) ≤ (M₀+1)/12`, `F = (μ/6+1)^(2g₀⁺)`, `G = (μ(lcm(n,4))/6+1)²`, `H = max`. All retained; the README consumes them from the named suppliers. |
| §1.2 Progression Frey specialization | BS20 line 263–280, (7)–(8), p. 361 | `g = gcd(t_i, 2t_j, t_h)`, `a = t_i/g`, `b = −2t_j/g`, `c = t_h/g`, `E_a : Y² = X(X−a)(X+c)`. Matches. |
| §1.5 Equal-sum second Frey family | BS20 line 309–322, (11)–(13), p. 362 | `I` with `j₁ < i₁ ≤ i₂ < j₂`, `i₁+i₂ = j₁+j₂`; `A−B = κd²`; `E_i : Y² = X(X² + 2κdX + κA)`. Matches. |
| §1.6 Second-family invariants and local tests | BS20 line 323–328, Lemma 3.4, p. 362; line 407–414, §4 second case, p. 364 | Minimal semistable at `p ≥ k`, `p ∤ κ`; `Δ = −64κ³A²B`; two-term branch `(i, i+1, i+p−1, i+p)` with `p ∣ A`, `ℓ ∣ ord_p(A)`, `p ∤ B`, `p ∤ κ`. Matches; the README's `p ≥ 5` is implied by `k ≥ 10⁸`. |
| §1.11 Kraus threshold for progression levels | BS20 line 423–443, Lemma 5.1, p. 365; Kraus1997 line 270–293, (8)–(9), Théorème 4, p. 1144 | `∏(1+1/q) ≤ 2 log k` for `k ≥ 10⁸`, `μ(M_a), μ(lcm(M_a,4)) ≤ 2⁸ log k · exp(1.000081k)`, `H(M_a) < exp(10^k)`; Kraus: full rational 2-torsion, `p > H(N(ρ_p))`, `H = max(F,G)` with `G = (√μ(ppcm(4,n))/6+1)²`. The README compares the majorants `F_K, G_K` (EC.2 gives `F♯ ≤ F_K`). Matches. |
| §2.6 Case-II conductor exclusion and projection | BS20 line 736–789, Case II, pp. 372–373 | `N_a^odd ∣ M_a`; `N_a^odd = 1` gives `tv = α²` or `2α²`, `2T²+2V² = U²` forces `tv = α²`, `T₀⁴+V₀⁴ = 2U₀²`, `λ = 1/2`, CM `j = 1728`, Lemos, integral `j`, `d ∣ 3` against Lemma 4.1. Matches the README's chain. |
| §4.7 Maximal largest-prime family | BS20 line 1336–1357, §10, pp. 384–385 | Nonempty `B` with (i)–(iv), maximal; `S = {P(N_a)}` and Proposition 9.1 contradict maximality when the mass is `< 0.17`. Matches (inclusion maximality). |
| §5.2 Bounded-height exceptional moduli | BS20 line 1408–1416, (40)–(41), p. 386 | `T = exp(c log k/(3 log log k))`, `Q(k)` = moduli `q ≤ k⁴` with a primitive character zero `β+it`, `|t| ≤ T`, `β > 1 − 3 log log k/log k = 1 − c/log T`. Matches. |
| §5.5 Exceptional divisibility indices | BS20 line 1468–1471, Proposition 12.3, pp. 387–388 | `N_{a,d}`: indices with some `r ∣ q ∈ Q(k)`, `r ≥ q^(1/3)/2`, `r ∣ a+nd`. Matches, `+1` retained. |
| §5.6 Exceptional indices are sparse | BS20 line 1472–1488, proof, p. 388 | `≪ k/(log k)^(1/4)`; the source's `k/r + O(1) ≪ k/r` (line 1476) fails for `r > k`; the README sums the `+1` as `τ(q)` first. The new bound `C(k(log k)^61 T^(−1/4) + k^(1/3)(log k)^61)` follows from `|Q| ≤ C(log k)^61`, `q > T`, `τ(q) ≤ Cq^(1/12)`, `q ≤ k⁴` (computed below). |
| §5.8 Exceptional-conductor detection | BS20 line 1495–1502, p. 388 | `N_a ≤ 8A_iA_jA_h ≤ k⁴`, gcd product `≥ N_a/8`, one gcd `≥ N_a^(1/3)/2`; the source's “largest odd squarefree divisor” is replaced by divisibility, which suffices. |
| §5.9 Granville analytic endgame | BS20 line 1501–1502, p. 388 | `N_a ∉ Q(k)` and Proposition 12.2 against Proposition 6.1. Matches. |
| §6.3 Fixed-exponent progression finiteness | DG95 line 325–327, Corollary 2.1, p. 520; line 333–337 (Euler cases); line 346–351, (2.2) | `m ≥ 2`, `k ≥ 3`, `m+k ≥ 6`, coprime integers; `(4,2)` and `(3,3)` by Euler; (2.2) printed with coefficients `j, j−1` for `a+id`, `i = 1..k`, which give `a+(j+1)d`; the README's `j−1, j−2` give `a+jd`. Matches with the correction. |
| §7.3 Smooth-multiplier progression equation | BS20 line 1379–1385, §11, pp. 385–386 | (39) with `P(b) ≤ τk`, `τ < 1/2`, announced extension. Matches. |

Also read: BS20 line 107–111 (Theorem 2, p. 357: `y = 0` or `d = 0` or `ℓ ≤ exp(10^k)`, Faltings consequence), line 395–415 (Lemma 4.1), line 447–459 (Lemma 5.2), line 1140 ((36) `K₀(δ) = exp(exp(132 log 2/δ))`), line 1163 ((37)), line 1401–1406 (§12 opening), line 1417–1439 (Proposition 12.1), line 1440–1464 (Proposition 12.2); OpenAI2026 line 7–9 and 23–25 (Theorem 1) and 444–475 (§6).

**Computed adversarial pass.** Values were computed by hand or with a scratch script; Lean rows were elaborated on the scratch copy.

| Statement | Instances | Values on each side | Result |
| --- | --- | --- | --- |
| §0.1 `primitive_solution` | (1,24,3,35,2); (−3,2,4,3,2); (4,2,1,2,2); k=0 | 1·25·49 = 1225 = 35²; (−3)(−1)(1)(3) = 9 = 3²; gcd(4,2) = 2 ≠ 1; `0 < 0` false | first two hold, last two fail, as elaborated examples |
| §0.1 `term`, `H` | term(2,3,0), term(2,3,1), term(−3,2,2); H at k=2 | 2, 5, 1; `10⁸ ≤ 2` false | keep |
| §0.3 | n=8, d=19, k=2, ℓ=3, q=2 | terms 8, 27: v₂ = 3, 0, both ≡ 0 mod 3; q = k on the large side | keep |
| §1.1 majorants | N=1, 11 | μ(11)=12, μ(44)=72, F_K(11)=9, G_K(11)=169, H_K=169; N=1: F_K=1, G_K=(6/6+1)²=4 | keep |
| §1.2 | n=d=1 and n=2,d=1 on (0,1,2) | g=1, (1,−4,3), a₂=2, a₄=−3; g=2, (1,−3,2), a₂=1, a₄=−2 | keep |
| §1.5/§1.6 | n=d=1, q=(0,1,1,2) | A=3, B=4, κ=−1, A−B=−1=κd²; a₂=−2, a₄=−3; Δ=−64·(−1)·9·4=2304=16·(1·(−4)·3)²; c₄=16·(−1)(−4−9)=208=16(1+12) | both families agree; keep |
| §1.9 headline | p=k prime; level bound at k=10⁸ | k<2k and p≤k admit p=k; log(2⁷e^(1.000081k)) ≈ 1.000081·10⁸ ≪ 10^k=10^(10⁸) | keep |
| §2.3 | ε=0.002811 | (1−3ε)/8 = 0.123945875 > 0.1239 | keep |
| §2.6 | T=V=1, U=2 | 2+2=4=U²; t=v=1/2, λ=2t²=1/2; T₀⁴+V₀⁴=2=2U₀² | keep |
| §3.1 conductor comparison | N=3,4,5,8,12,15,24,40,56,60,120,420; N=16 | 4exp(θ(P)) = 24,8,120,8,24,120,24,120,840,120,120,840, each ≥ N; equality at 8=4·2 and 24=4·6; 16 > 8; log4·(1+P) ≥ log N in every row | keep; N=16 Check correct |
| §3.1 half-interval PNT | S(k)−S(k/2) | log(k/2) ≤ log k, √log(k/2) ≤ √log k make each of S(k), S(k/2) ≤ Ck·exp(−c log(k/2)/(√log k+log N))(log N)⁴ | keep, factor 2 correct |
| §3.2 decay exponent | log k = 10⁶, c₁ = 1/4, 1/2, 3/4 | denominators 44840, 2388, 1045 against (log k)^max(1/2,1−c₁) = 31623, 1000, 1000: ratios 1.42, 2.39, 1.05 | min(c₁,1/2) correct |
| §3.2 at the certified range | k = exp(exp(10⁷)), c₁ = 1/20000 | (log k)^c₁ = e^500 ≈ 10^217 against (log N)⁴ ≤ exp(4·10⁷) ≈ 10^(1.7·10⁷) | error term negligible; keep |
| §3.3 | — | 1/68 = 0.014706 < 0.1239² = 0.015351 | keep |
| §4.1 | δ = 10⁻⁵ | 132 log 2·10⁵ = 9 149 543, between 10⁶ and 10⁷ | keep; source cutoff 10⁶ false |
| §4.7 | labels with largest primes 3,3,5 | maximal distinct-prime subfamily has 2 members, mass 1/3+1/5 = 8/15 | keep |
| §4.8 | — | 0.17 − 17 log k/(10⁴ log k) = 0.1683 > 0.166; D nonempty | keep |
| §5.1 | widths c ≤ c₀/2 | c/log T ≤ c₀/(2 log T) < c₀/log T for T>1; at c=c₀ the point 1−c₀/log T is outside the strict strip | keep; new Check correct |
| §5.2 | k=16, c=0; T(0,c), T(1,c); q=8, 1000 | T=1, 1−3 log log 16/log 16 = −0.103 < 0 = Re 0, χ₅ gives 5 ∈ Q(16,0); log 0 = log 1 = 0 gives T=1; thresholds 8^(1/3)/2 = 1, 1000^(1/3)/2 = 5 | keep |
| §5.3 density | Q=k⁴, σ=1−3 log log k/log k, ε=1/12 | (Q^(5+ε)T^(3+ε))^(1−σ) = (log k)^(60+12ε)·exp((3+ε)c) ≤ C(log k)^61 | keep |
| §5.3 zero-free | T=T(k,c) | c/log T = 3 log log k/log k, so Q's open strip lies in the closed contract strip; T ≥ log k iff c log k ≥ 3(log log k)² (false at k=10⁸, c=1: 18.4 < 25.5; true for large k) | “effectively large k” needed and stated |
| §5.6 | τ(q) ≤ Cq^(1/12), q ≤ k⁴; log log k = 30, c = 1 | per q: Σ(k/r+1) ≤ C(kq^(−1/4)+k^(1/3)); log[(log k)^61 T^(−1/4)] = 1830 − e^30/360 ≈ −3·10^10 | keep |
| §5.7 | x=64 | 8·64^(7/2) = 16 777 216 = 64⁴ | keep |
| §5.8 | N=120, coefficients 3,5,1; control N=24 with 3,5,7 | gcd product 15 = 120/8, max 5 ≥ 120^(1/3)/2 = 2.47; odd part 3 divides 105 but is not 105 | keep divisibility form |
| §5.9 | — | 0.1239k against Ck/log k: strict once log k > C/0.1239 | keep |
| §0.18 absorption (consumed) | X=10³⁰, N=10⁶, c=0.1 | exp(−c log X/log N) = 0.607 ≤ exp(−c log X/(√log X+log N)) = 0.732 | absorbing direction correct |
| §0.34 (consumed) | q=3, β ≤ 1/2 | (1−β)log 3 ≥ 0.549 | consistent with the supplier's Check |
| §6.2 headline | d=0; n=0 with k ≥ 1 | y·d = 0; product 0 = y^ℓ forces y = 0 | disjunction correct |
| §6.3 range | (3,4),(4,3),(5,2),(4,2),(3,3),(3,2) | 2g−2 = 4, 18, 8, 0, 0, −2; 2ℓ+k < kℓ: 11<12, 10<12, 9<10, 8<8 no, 9<9 no, 7<6 no; k+ℓ ≥ 6 fails only at (3,2) | (3,2) rightly excluded: 1, 25, 49 and 49, 169, 289 (products 35², 1547²) are an infinite family |
| §6.3 signed boundary | (n,d) = (−3,2), k=4 | ∏ term = 9 = 3² (elaborated) | signed theorem needs the strict range; positive theorem excludes it by sign |
| §7.1 headline | n=1,k=2; n=4,k=1 | 2 is no perfect power; 4 = 2² with k=1 excluded | keep |
| §7.3 | b=2, n=d=y=1, k=2, ℓ=2; b=0 | 1·2 = 2·1²; prime 2 ≤ 2τ iff τ ≥ 1; b=0 excluded | keep |

**Headlines and padding.** The README's headline tests are §1.9, §6.2, §6.3 (two statements), §6.5 and §7.1; all six are in `Suggested.lean` on native carriers and none is padding. The two further headline-class theorems §1.12 and §2.7 are R01.

**Ownership and overlap.** `scratch/overlaps.md` lists no other pull request changing this roadmap, no cited id dropped by an open pull request and no id this pull request drops. Closest open roadmaps read: EllipticLegendreCharacterInterfaces (#1545, l.640 names this roadmap's §2.1 as its consumer), AnalyticNumberTheoryPartI (#1126; its consumer list at l.3184 still describes this roadmap's use as “§§0.1, 0.6, 0.18 and 0.24”, which is that roadmap's text to update), EllipticModularityEffectiveComparisons (#1810, `ORDER.txt` line 278, hence later than this roadmap: its “Downstream consumers” at l.1695 states that it owns EC.0–EC.5 and that “ErdosProgressionPowers cites EllipticCurveModularityPartII, which plans the same six results”; the two-owner situation is between #1491 and #1810, and this roadmap cites the earlier owner, as it must), SieveMethodsAndPrimePatterns (#1495, consumes this roadmap's §3.1 Gram inequality at its l.132–134 and l.1259), EllipticCurveModularityPartII (#1491; its l.1058 cites this roadmap by the heading “Required effective modular comparisons”, which this README no longer has; that is #1491's text). PolynomialGaloisGroupsPartII (#1419, l.255–257) and ArithmeticDynamicsPartII (#1686, l.83) consume §0.9's divisor bound, which exists. ClassicalArithmeticCompletion on main §1.32 (l.1296–1314) owns `v₂(N) ≤ 3` and mentions BS20 Lemma 7.3 only as a Check; neither it nor AnalyticNumberTheoryPartI §3.2 states the numerical-input-free comparison `N ≤ 4·exp(θ(P(N)))` of §3.1, so that comparison has no other owner. No object this roadmap owns was found owned elsewhere.

**The Landau–Siegel reduction, checked.** With `(1−β)log q ≥ c_LS` for every real zero: (i) the term `X^β/β` of the character explicit formula is at most `2X·exp(−c_LS log X/log N)`, absorbed by the stated error once `c ≤ c_LS` (row above); (ii) a zero of a character of modulus `q ≤ T` in `Re s > 1 − c₀/log T` with `|Im| ≤ T` would, by the classical Landau–Page form, be a real zero of a real character, and `1−β ≥ c_LS/log q ≥ c_LS/log T` excludes it for `c₀ ≤ c_LS`; (iii) BS20's Proposition 7.2 uses the reciprocal mass `≥ 0.166` only in its exceptional-character branch (line 872–890 of the proof), so the single-character form of §3.2 contains the source's form; (iv) §4.8 still needs `D ≠ ∅`, which the mass bound gives. The roadmap states each of these at §3.1, §3.2, §5.1 and §5.3.

## Not verifiable

- **Green2026** (Ben Green, *On Landau–Siegel zeros*, “Hexagon 2610.00311”). The sources service found no legal source for this citation (recorded in the scratch directory only; this review requests nothing). Its Theorem 1.1 locator is unverified. The statement this roadmap consumes is supported by OpenAI2026 Theorem 1 (line 23–25) and by AnalyticNumberTheoryPartI §0.34 at the head of #1126.
- **Waived texts.** IwaniecKowalski2004 (Theorems 5.26–5.27, 12.13, Proposition 5.25), RosserSchoenfeld1962, Tenenbaum1995 and RahmanRoth are waived in the manifest and were cited by locator only; BS20 line 1140 quotes the Rahman bound.
- **Mazur1978** remains uncertified (paywalled primary text), as the References say.
- **Manifest coverage.** The package `sources.toml` records only Faltings1983, ErdosSelfridge1975 and the four waived keys; BS20, DG95, Kraus1997, Lemos2017v2, Martin2003v1, Platt2013v1, Schoenfeld1976, RamareRumely1996, Bombieri1987, OpenAI2026 and Green2026 are in the sources cache or unobtainable but not in the manifest. Earlier repair reports settled manifest maintenance as outside this package's authorized edits (`packages/ErdosProgressionPowers/reports/FIX-RT-ErdosProgressionPowers~1.md`); not re-raised.
- **Gap registration.** The board package has no `design/plan.json`; the four `gap:` slugs of the AnalyticNumberTheoryPartI contract are stated in the README's supplier subsection with owner, precise `needs` and the targets that use them; whether they are registered on the supplier's job could not be checked.

## Source issues

- **Misprint** in BS20 at Lemma 3.2, printed p. 361 (line 283): the source says the model's discriminant is 64(a b c)² = 2⁸g⁻⁶(…)²; it should be 16(a b c)² = 2⁶g⁻⁶ t_i²t_j²t_h², the Weierstrass discriminant of Y² = X(X−a)(X+c); affects a stated result.
- **Misprint** in DG95 at equation (2.2), printed p. 520 (line 346–351): the source says the elimination coefficients are j and j−1 for the terms a+id, i = 1..k; with that indexing they produce a+(j+1)d, so the coefficients should be j−1 and j−2; affects a stated result.
- **Error** in BS20 at the proof of Proposition 9.1, printed p. 384 (line 1329, with (36) at line 1140): the source says K₀(10⁻⁵) < exp(exp(10⁶)); the displayed K₀ gives exp(exp(132 log 2 · 10⁵)) with 132 log 2 · 10⁵ ≈ 9.15·10⁶ > 10⁶, so a cutoff such as exp(exp(10⁷)) is needed; affects the proof.
- **Misprint** in BS20 at the §12 opening, printed p. 386 (line 1401–1406): the source says every zero of every primitive character of modulus q ≤ T has real part below 1−c/log T with at most one exception; it should restrict to zeros of height at most T, as its definition (41) does; affects a stated result.
- **Misprint** in BS20 at Proposition 12.2, printed p. 387 (line 1440–1445): the source states the half-interval bound for every character modulo q ∉ Q(k); it should exclude the principal character, whose sum is of order k/2, as its proof assumes; affects a stated result.
- **Misprint** in BS20 at the proof of Proposition 12.2, printed p. 387 (line 1451 and 1462): the source says the zero sum runs over |t| ≤ T and then over |t| ≤ Q; it should keep the height T throughout; affects the proof.
- **Gap** in BS20 at the proof of Proposition 12.2, printed p. 387 (line 1462–1464): the source says the sum of 1/|ρ| over the truncated zeros is ≪ log k by the standard proof; it should control zeros near 0 separately, for which the bounded kernel (k^ρ−(k/2)^ρ)/ρ suffices; affects the proof.
- **Error** in BS20 at the proof of Proposition 12.3, printed p. 388 (line 1476): the source says k/r + O(1) ≪ k/r; this fails for divisors r > k, where k/r < 1; the +1 terms should be summed as τ(q) and bounded by q^(1/12) ≤ k^(1/3) first; affects the proof.
- **Gap** in BS20 at the final argument, printed p. 388 (line 1496): the source says N_a^odd is the largest odd squarefree divisor of A_iA_jA_h; only divisibility of A_iA_jA_h by the squarefree N_a^odd is established, and it suffices for the gcd-product inequality; affects the proof.
