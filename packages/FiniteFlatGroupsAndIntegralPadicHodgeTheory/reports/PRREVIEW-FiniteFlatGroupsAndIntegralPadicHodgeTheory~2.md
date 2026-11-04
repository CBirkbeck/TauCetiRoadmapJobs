# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 0e779dc)

**Verdict:** needs changes

## Repair status of the previous review (head 1a17d7d)

| Previous finding | Status at 0e779dc |
|---|---|
| R01 (P1) rank `q` in the automatic eigenline assertion | Repaired. README:2126–2129: “for a finite locally free commutative `G` of rank `q` with an `F`-action, the condition `(**)` holds automatically …; the rank hypothesis cannot be dropped”, and the `F₃²` negative control at README:2154–2159 keeps eigenrank 4 ≠ 1. Matches `raynaud-1974` lines 241–245. |
| R02 (P1) perfect-residue Herbrand theory unsupplied on main | Repaired as instructed (“until then, own the missing target here”): README:8298–8363 now proves `perfectResidueHerbrand`. But an eligible earlier owner exists; see R01 below. |
| R03 (P1) unit-filtration reciprocity as an undeclared ClassFieldTheory extension | Repaired. README:395–397 cites Layer 7 only for “the local Artin map, its normalizations and local conductors”; README:1610–1612 uses only the unit normalization `χ_p(Art_K(u)) = N(u)⁻¹`. The dependency check reports no UPWARD line. |
| R04 (P2) import Sen and Cohen-ring constructions | Repaired. README:1577–1592 consumes PadicLocalLanglandsForGL2Qp §0.2’s Sen operator on `D_dif`, labelled decomposition and local-algebraicity criterion (present at that roadmap’s head, its §0.2 paragraphs on `D_dif`, Sen operator and “labelled period/Sen decomposition”); README:5612–5623 states §R07.4.4 as the Kummer-frame instance of NoncommutativeAndEquivariantIwasawa §F.6 stage 1 (present there: “prove the Cohen-ring étale equivalence” for every field of characteristic `p`). |
| R05 (P2) three structures lost coefficient binders | Repaired. `#check` output: `DieudonneModule`, `FLModule`, `TorsionKisinModule` and their `Hom`/`Category` instances all carry `[CharP k p] [PerfectRing k p]`. |
| R06 (P3) nine HTML anchors | Repaired; gate `residue=0`. |
| R07 (P3) absent Lean names in API bullets and Checks; layer comments; R07.G closing sections | Partly repaired: the three named items are gone, `/-! ## Layer … -/` comments are present, R07.G has `### Examples`/`### Dependencies` (README:3016–3037). The general style point remains; see R04 below. |
| R08 (P3) locators and crystalline supplier name | Partly repaired: Stix locators now “Theorem 44, pp.38–42; §8.5, Theorem 54, p.48” (correct: `stix-2012` lines 2197, 2549), Illusie “Corollary 4.8, pp.180–181” (correct: `illusie-1985` line 1181 on printed p.180). The stale supplier name and namespace were not changed; see R02 below. |

## R01 (P2) — §R07.6.1a re-plans PadicPeriodRings §0.3

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:8298–8343`: “Prove `perfectResidueHerbrand` … The following package, in both equal and mixed characteristic, is a target of this roadmap”; also :119–126, :388–392, :8378, :8396, :8519, :8531, :8912–8913.

**Claim:** no eligible earlier roadmap supplies lower/upper numbering, Herbrand functions, the different formula, the absolute upper filtration and the completed maximal-unramified comparison over complete discretely valued fields with arbitrary perfect residue field.

**Witness:** PadicPeriodRings at its open head (#940, earlier than this roadmap in `ORDER.txt`: line 9 versus line 36), README line 71–83, “§0.3 Ramification over complete discretely valued fields with perfect residue field — `generalResidueRamification`”: no finiteness or characteristic assumption on `k`; lower numbering on `TauCeti.IsLocalRing.ramificationGroupReal`, the different formula, Herbrand functions, upper numbering, subgroup compatibility, Herbrand’s quotient theorem, transitivity, the absolute upper filtration of any Galois `M/K` with its closed normal subgroups, inertia, trivial intersection and quotient compatibility, the equivalence of finite extensions of `K^un` and `K̂^un` with preservation of inertia, lower and nonnegative upper filtrations, `ord_K(p)` and the normalized different, and agreement with the pinned `TauCeti.LocalFieldsRamification` declarations. Its line 30 states this ownership explicitly, and its §2 `senUpperBreaks` (line 305) proves Hasse–Arf “over every general `p`-adic field”. This roadmap already consumes PadicPeriodRings §§1.3 and 2 (README:177, :459).

**Repair:** replace §R07.6.1a by a contract citing PadicPeriodRings §0.3 (and §2 for Hasse–Arf in characteristic `0`), and repoint every `§R07.6.1a` citation (:125, :391, :8378, :8396, :8519, :8531, :8913) to it. Keep as a target only what §0.3 does not state and this roadmap uses: the identity `G_K^u ∩ G_L = G_L^{ψ_{L/K}(u)}` for finite separable `L/K`, `G_K^{0+} = P_K`, and equal-characteristic Hasse–Arf if any consumer needs it (none of §§R07.6.2–R07.6.5 does: Fontaine’s setting is characteristic `0`). Test: `K = Frac W(𝔽̄₃)`, `L = K(ζ₃)`: §0.3’s package gives `e = 2`, `G₀ = G`, `G₁ = 1`, different exponent `1`, upper jump `0`, unchanged by completed unramified base change; `ℚ₃(ζ₉)/ℚ₃`: lower breaks `{0, 2}`, upper breaks `{0, 1}`, `v₃(𝒟) = 3/2` on both sides of the comparison.

A third copy of the same contract (`perfectResidueHerbrand`) is in the open revision of LocalFieldsRamification (#1410, its README line 1272); that revision is not an eligible supplier here, but the owner should be settled once, in PadicPeriodRings §0.3.

## R02 (P3) — Stale supplier name and namespace for the Dieudonné crystal (re-raised from R08)

**Location:** README:440 “§A4.CR.7.2 supplies `LogCrystalline.dieudonneEvaluation`”; README:169 “Its public namespace is `TauCetiRoadmap.CrystallineCohomology`”.

**Witness:** AbelianSchemesAndArithmeticModuli at #849, §A4.CR.7.2 (its line 2127–2160): the three targets “are owned by this section and named in this roadmap’s namespace”; the API is `DieudonneCrystal.evaluate`, `DieudonneCrystal.contravariant`, `DieudonneCrystal.fv`. The worker’s citation scan (`citations.md`) lists `LogCrystalline.dieudonneEvaluation` as found nowhere.

**Repair:** write `DieudonneCrystal.evaluate` and the supplier’s own namespace `TauCetiRoadmap.AbelianSchemesAndArithmeticModuli`; the evaluated values `D(ℚ_p/ℤ_p) = (W, σ)`, `D(μ_{p^∞}) = (W, pσ)` and `FV = VF = p` at README:440–443 are unchanged.

## R03 (P3) — The local lift of a `BT₁` in §R07.2.22 is misattributed

**Location:** README:3887–3888: “locally on `S` a `BT₁` is the `p`-torsion `H[p]` of a Barsotti–Tate group `H` (Illusie 1985, Theorem 4.4)”.

**Witness:** `illusie-1985` lines 831–832, Théorème 4.4 (e): the lift of a `BT_n` to a `BT` is asserted for `S` local noetherian complete with perfect residue field, not locally on an arbitrary `𝔽_p`-scheme. Zariski-locally the lift can fail: over the non-henselian local ring `𝔽_p[t]_{(t)}` a smooth cover such as `x² − x = t` has no section, so sections of the smooth truncation maps of §R07.2.23 exist only étale-locally.

**Repair:** state the reduction on strict henselizations (or étale-locally), using §R07.2.23’s smooth `BT_{n+1} → BT_n` and sections of smooth morphisms over strictly henselian bases, or cite Berthelot–Breen–Messing 3.3.10 directly for `BT_n` as AbelianSchemesAndArithmeticModuli §A4.CR.7.2 does. The three statements of `bt1DieudonneHodgeExact` (resolution independence, local freeness of rank `h`, exact Hodge sequence) are unaffected; `μ_p` over `𝔽_p[ε]/ε²` still gives `D(G)_S = O_S` of rank `1`.

## R04 (P3) — Checks carry backticked Lean counterparts

**Location:** README:700, :736, :829, :859 and 394 further `**Checks.**` bullets of the form “- `name`: …” (398 in total; counted by scanning every Checks list).

**Claim:** house style: “a Check never names or claims a Lean counterpart”; a backticked name of this roadmap’s own is a claim that `Suggested.lean` declares it. None of these 398 names is declared there.

**Repair:** delete the labels and keep the prose (as the author did for the three Frobenius Checks at README:637–641). No mathematics changes.

## Verified sound

Reviewed the whole 9,132-line README and the 355-line `Suggested.lean` at 0e779dc; the folder holds only `README.md`, `Suggested.lean`, `metadata.toml`; the pull request changes nothing outside the folder. No good-prime shortcut, algorithm, copied passage, sorry’d data, `set_option`, `lemma`, LaTeX delimiter, pull-request number or process word was found (grep for “optional|deferred|for later|TODO|currently|so far|removed|checkpoint|handoff”: none).

**Gate and dependency check.** The worker’s gate at this head passes every scanner and the targeted build. My run of the dependency check:

```text
depcheck: 201 roadmaps, 1324 edges, 0 problem(s)
```

**Build, signatures, padding.** `lake env lean Suggested.lean` elaborates in 4 s with exactly seven `declaration uses sorry` warnings (lines 94, 103, 113, 170, 256, 313, 336). A scratch copy with `#check @name` for all 30 declarations and the 9 library carriers elaborated; every theorem keeps its hypotheses (`IsFractionRing`, `CharZero K`, `CharP (ResidueField R) p`, `IsAdicComplete`, `PerfectRing`, `IsGalois`, `IsIntegralClosure`, `Module.Finite R S`, `Module.IsTorsionFree R S`), and the three structures keep `CharP`/`PerfectRing` (R05 repaired). A scratch copy replacing each `sorry` by `first | rfl | simp | infer_instance | decide | trivial | simp_all | aesop | omega | exact?` leaves all seven theorems unsolved; no padding. The file states the seven headlines named at README:299–307; the docstring names the headlines not statable (BT, `BT_n`, crystal, period-ring, formal-group, vector-scheme, global-model, Robba, Sen/WD, Ext carriers) with what each lacks; I found no headline statable at the pins that is absent.

**Headline inventory (README:41–50).** R07.P realization interfaces; R07.1 Frobenius/Verschiebung, étale dictionary, rigidity, Tate modules, connected–étale, `BT_n` recognition, formal groups, Hodge–Tate, generic fibres, prolongations, Raynaud uniqueness and tame exponents, Oort–Tate, abelian embedding; R07.G models, lengths, cohomology bound, rank one, purity, `D`, amalgams; R07.2 Dieudonné classifications, Dieudonné–Manin, Hasse invariant, stack smoothness, universal covers, de Jong; R07.3 polygons, eigenvector bound, `U_S`, full faithfulness, admissibility, finite-flat dictionary; R07.4 Kisin modules, field of norms, slope filtration, crystalline embedding, finite height, `{0,1}` theorem, classifications at every `p`, BMS functor, descent data; R07.5 inertia types, Serre criterion, Savitt types, FL weights, peu-ramifié `H¹`, Serre weights; R07.6 torsion, Fontaine bound, Illusie obstruction, flat tangent space, Raynaud determinant, cyclotomic image. Stated in Lean: `prolongation_unique_of_lt`, `genericFibre_map_bijective`, `globalPrimeOrderClassification`, `dieudonneEquivalenceFinite`, `flFiniteFlatDictionary`, `finiteFlatClassification`, `fontaineRamificationBound`.

**Pinned declarations opened** (Mathlib `6b7abb3`, Tau Ceti `a91d3aa`):

| File and line at the pin | What was checked |
|---|---|
| `TauCeti/RingTheory/LocalRing/RamificationGroup.lean:42,45` | `IsLocalRing.ramificationGroupReal` and `IsLocalRing.lowerIndex` exist, over a local ring without local compactness, as §R07.6.1a and PadicPeriodRings §0.3 both say. |
| `TauCeti/RingTheory/Ideal/RamificationGroup.lean:60` | `Ideal.ramificationGroup (Q) (i : ℕ)`, the congruence carrier. |
| `TauCeti/NumberTheory/LocalField/RamificationGroup.lean:92–93`, `…/Herbrand/Basic.lean:101–102` | the local-field filtration and Herbrand function assume `IsNonarchimedeanLocalField`, so LocalFieldsRamification Layers 3–4 are finite-residue only, as README:119–126 states. |
| `TauCeti/…/CartierDuality/FiniteLocallyFree.lean`, `BaseChange.lean`, `Constant.lean`, `Rank.lean` | the carrier, `baseChangeFunctor`, constant and diagonalizable groups, `finrank_cartierDual`; the Lean file uses exactly these. |
| `TauCeti/NumberTheory/LocalField/AbsoluteRamificationIndex.lean`, `…/Tame/Character.lean`, `…/Tame/Quotient.lean`, `…/WorkedExamples/DyadicSqrt/Two.lean` | `absoluteRamificationIndex` with `_eq_natCastValuation`, `_padic`; `inertiaTameCharacter`, `quotientWildInertiaSubgroupEquiv`; `irreducible_integerSqrtTwo` (README:2265). |
| `Mathlib/RingTheory/WittVector/Isocrystal.lean`, `FrobeniusFractionField.lean` | `Isocrystal`, `StandardOneDimIsocrystal`, `isocrystal_classification`, `exists_frobenius_solution_fractionRing`, `FractionRing.frobenius`. |
| `Mathlib/RingTheory/Perfection.lean`, `Perfectoid/BDeRham.lean`, `Perfectoid/FontaineTheta.lean`, `NumberTheory/Padics/Complex.lean` | `PreTilt`, `BDeRhamPlus`, `BDeRham`, `fontaineTheta`, `PadicComplex`. |
| `Mathlib/RingTheory/FormalGroup/Basic.lean`, `Analysis/Normed/Field/Krasner.lean`, `RingTheory/Etale/Finite.lean`, `CategoryTheory/Galois/Equivalence.lean`, `AlgebraicGeometry/AffineScheme.lean`, `RingTheory/DedekindDomain/Different.lean`, `Algebra/WithConv.lean`, `RepresentationTheory/Continuous/TopRep.lean` | `FormalGroup`, `IsKrasner`, `CommAlgCat.FiniteEtale` with `fiber` and `equivOfIsSepClosed`, `functorToContAction`, `AffineScheme.equivCommRingCat`, `differentIdeal`, `WithConv`, `continuousCohomology`/`TopRep`. All other Mathlib names of the supplier list resolved (`DividedPowers`, `IsRegularLocalRing`, `Polynomial.IsEisensteinAt`, `Matrix.charpoly`, `HenselianLocalRing`, `Algebra.QuasiFinite`, `KaehlerDifferential`, `TruncatedWittVector`, `GaloisCategory`, `FiberFunctor`). `WittVector.frobeniusEquiv` and `WittVector.irreducible` are not found by name at the pin (the roadmap uses them as background names only). |

**Cross-roadmap citations resolved** (the worker’s scan finds none missing; I opened these): PadicLocalLanglandsForGL2Qp #1312 §0.2 (`D_dif`, Sen operator, labelled decomposition, local-algebraicity criterion), §0.3 (`fundamentalCharacter`, `peuRamifieH1`, `IsPeuRamifiee`, `IsTresRamifiee`, `peuRamifie_restricted`), §§2.7–2.8; NoncommutativeAndEquivariantIwasawa #1307 §F.6 (period sequences with `x−y`, `(1−φ)x`, `blochKatoExp`; stages 1–2 Cohen-ring equivalence, Robba carriers, slopes, bounded descent, with its consumer table naming §§R07.4.4, R07.4.7–R07.4.8); AbelianSchemesAndArithmeticModuli #849 §A4.5 (`BarsottiTate` with `ofAbelian`, `truncation`, `dual`, `baseChange`, `connectedEtale`), §A4.5a (`TruncatedBT`, height, base change, descent, `cartierDual`, `restrict`, Frobenius/Verschiebung with `VF = [p] = FV`), §A4.CR.7.2 (`DieudonneCrystal.evaluate`), §A3.2 `multiplicationAndDensity`; CrystallineCohomology #857 §CR.4.7 “Slope decomposition on the existing isocrystal carrier”, §§CR.7.1, CR.7.3; PadicPeriodRings #940 §§0.3, 1.3, 2, 3, 4.1–4.3 (`tate_almostEtale`, `tateSen_H0/H1`, `generalBasePeriodRings`, `periodTraceIdeal`, `senUpperBreaks`, `senTowerEstimates`); CyclotomicClassGroupsAndStickelberger #1260 (`cyclotomicClassEigenspaces`, `bernoulli_annihilates_component`, `inverseCharacterClassGroup`, `inverseCharacterUnramifiedQuotient_zero`); ArithmeticGaloisDuality #858 R02.1.2, R02.2.3a, `tateDualityPairing_perfect_mixed`; ArithmeticGaloisRepresentations #856 §7.6 “Roots of characters”; SchemeAndStackFoundations (main) `smooth_iff_powerSeries`, `coherentFormalModuleEquivSpec_effective`, §0.29 Frobenius names; AdicSpacesPartIII (main) R2.9 `FormalScheme.FSC`, `rigOfFSC`; PurityOfBranchLocus (main) §§2.1–2.2; RestrictedPowerSeries (main) Layer structure with its §7.1 cited through its open-disc algebra; ModularCurves (main) Layers 0B–0E, 7E; GlobalNumberFields #1339 `AlgebraicInfinityType`, `HeckeCharacter.IsAlgebraic`; LocalFieldsRamification (main) Layers 3–4 (finite residue). Ownership by object: integral crystalline predicates (`IsTorsionCrystalline`) are consumed by SelmerIwasawaCohomology #869 and LocalGaloisDeformationRings #923, both later; `B_HT`/`D_HT` and `deRhamSupplierEquiv` have no other owner; the Kummer-tower field of norms (§R07.4.3) differs from §F.6’s cyclotomic one. Open pull requests without files in this brief were not inspected.

**Seeded source sample (15 targets).** Texts read through the sources service at the cited locators; `serre-1972` is an OCR of the GDZ scan and `fontaine-1985` an OCR of the author-page PDF (its text layer was empty on most pages).

| Target | Source witness and outcome |
|---|---|
| Special-fibre types and ordinary counting | `stix-2012` lines 2045–2099 (Props 37, 40), 2184 (Cor 43), 2197–2214 (Thm 44, p.42: `G^μ ⊂ G⁰ ⊂ G`, split over a perfect field), 2549–2562 (Thm 54, p.48: simple objects `μ_p, α_p, ℤ/p, ℤ/ℓ`); `raynaud-1974` lines 993–998 (Cor 3.3.6, `e < p−1`). Locators correct after R08. |
| Integral crystalline predicates | `ltxzz` lines 591–599 (Def 2.2.4, `F_w/ℚ_ℓ` unramified, `R = R″/R′` for stable lattices; `R/ℓ^m R` for every `m`; `O_λ` through the forgetful functor), footnote 4 line 606 (`ℚ_ℓ(1)` has weight `−1`): the interval reversal `[c,d] ↦ [−d,−c]` is right. |
| Admissible global models | `mazur1977` lines 653–747 (I §1(a)–(c): extension ↔ `H ⊆ G(ℚ̄)` inertia-fixed, minimal `H = 0`, maximal `H = G(ℚ̄)^{I_N}`, Prop 1.3 at 706–709, closures with `H(𝔽̄_N) = H(ℚ̄) ∩ G(𝔽̄_N)`). |
| Admissible cohomology bound | `mazur1977` lines 809–880 (invariants `ℓ, δ, α, h^i`; table 836–847 with `ε = 0` for `N ≡ −1 mod 4` at `p = 2`; Prop 1.7 with subadditivity, 865–878). |
| Global Ext vanishing | `mazur1977` lines 883–1056 (Prop 2.1 for any `p`; obstruction-to-linearity reduction; Prop 2.8 `Y^{(1)} = 0` and the annihilator `L_j`; Cor 2.9 Herbrand; Cor 2.10 `Y^{(−1)} = 0`), 1269–1270 (Step 1 of Prop 4.5 uses only Prop 2.1). |
| Odd global purity | `mazur1977` lines 1065–1082 (Prop 3.1), 1202–1213 (Prop 4.1 with the sequence `0 → (ℤ^×)[p] → Ext¹ → ℤ^×/(ℤ^×)^p → 0`), 1254–1276 (Prop 4.5, `p ≠ 2`). |
| Dyadic amalgam | `mazur1977` lines 3963–3982 (II §17 `*`-type pushout along `μ₂ ⊂ G⁰ ⊂ D`, Lemma 17.3: `(G_{/ℤ₂})⁰ = G⁰`). Mazur’s `G⁰` sits in a Jacobian; the general finite-flat quotient here is ModularCurves 0C’s. |
| Covariant crystalline evaluation over semiperfect bases | `scholze-weinstein-2013` lines 80–85 (Rem 1.0.1), 1118–1131 (Prop 4.1.3; evaluation with `F : M ⊗_φ A → M`, `V : M → M ⊗_φ A`, `FV = VF = p`; Thm 4.1.4), 1260–1285 (Prop 4.1.11, Cor 4.1.12); `caraiani-scholze-2017` lines 1659–1660 (Example 4.1.3: `φ_G = σ` for `ℚ_p/ℤ_p`, `p⁻¹σ` for `μ`), 1683–1685 (footnote 18). |
| Crystalline morphisms on tubes | `de-jong-1995` lines 1737–1776 ((5.3.2)–(5.3.7): `ρ(x^[i]) = x^i/i!`, `σ(V_{n+1}) ⊆ V_n`, `φ_{n+1} = p⁻¹F₁∘σ^*φ_n∘V₂`, uniqueness and independence of `σ`), 1780–1837 (5.4.1, (5.4.1.6)). |
| Modules of constant fibre length | `berthelot-1980` lines 846–856 (Cor 3.1.2–3.1.3: no `S`-torsion ⟺ constant fibre length; finite presentation, `pd = 1`, `Tor₁ = 0`), 861–866 (Prop 3.1.4 duality with `T_A = W(A)[1/p]/W(A)`). |
| `cyclotomicWindowBaseChange` | `caislau-2017` lines 136–160 (Defs 2.1.1, 2.1.3), 182–186 (`c`-homomorphisms), 241–258 (Ex 2.1.12, Def 2.1.13, Rem 2.1.14), 264–282 (Lemma 2.1.16, Ex 2.1.17), 357–367 (Hyp 2.3.1 `c = φ₁(E)` unit; Prop 2.3.2 for `p ≥ 3`), 744–791 (Prop 3.1.4, Lemma 3.1.6 action `E/γ(E)`, Rems 3.1.7–3.1.8 with `λ_γ` and `φ(λ_γ)`), 1003–1011 (Ex 3.4.8: the `u₀/t` correction). |
| `cyclotomicStrictActionConnection` | `caislau-2017` lines 793–805 (Def 3.1.9, Lemma 3.1.10), 821–849 (Prop 3.2.2, Lemma 3.2.3), 870–937 (`t = log(1+u₀)`, `t^{p−1} ∈ pS_r`, Lemma 3.3.3 estimates, `N = p^r log γ / log χ(γ)`, Prop 3.3.4, Cor 3.3.5–3.3.6). |
| `cyclotomicWindowDescent` | `caislau-2017` lines 946–1002 (Def 3.4.1, Rem 3.4.2, Prop 3.4.3, Lemma 3.4.4 via the universal deformation ring over `W(k)`, Prop 3.4.5, Cor 3.4.6, Rem 3.4.7). |
| Strongly divisible modules and descent data | `savitt-2005` lines 551–560 (`S`, `φ`, `N(u) = −u`, `Fil^{k−1}S`), 623–642 (`Mod^{k−1}_0`, `Mod^{k−1}_cris` with `N(M) ⊂ IM`, canonical `N` for weight `2`), 646–655 (`M_π(G(n))`, `M_π(G)`), 694–757 (Prop 3.3, Cor 3.4, Hyp 3.5, Cor 3.6, Def 3.7), 760 (Def 3.8), 843–846 (Thm 3.10), 871–878 (Prop 3.11), 950–960 (Lemma 3.13), 964–972 (Thm 3.14), 1019–1034 (Def 4.1 (1)–(12)), 1181–1192 (Lemma 4.14, Rem 4.15), 1202–1251 (Props 5.1–5.4); `breuil-2000` lines 2302–2342 (Cor 4.2.2.7: `S_n`-free of rank `d`; Lemme 4.2.2.8; Thm 4.2.2.9 for `p ≠ 2`), 2417–2419 (Prop 5.1.3(1): `Nφ₁ = φN = c⁻¹φ₁∘(E(u)N)`), 2559 (Thm 5.3.2). |
| Multiplicative finite-flat criterion | `serre-1972` OCR lines 691–733 (§1.12: `j` of valuation `−m`, unique `q`, `K′/K` unramified of degree `≤ 2`, footnote 3 `K′ = K(√−c₆)`, Prop 13, case (b) iff `q` has a `p`-th root in `K_nr`, forcing `v(j) ≡ 0 mod p`). Serre 1987 §§2.6, 2.8 could not be read; the odd-`p` direction follows from §R07.5.6(b) (unit Kummer class) and the dyadic examples are computed below. |

Additional locators read for the changed passages: `fontaine-1985` OCR lines 32–33 (Thm A), 102–134 (§1.1), 147–155 (Prop 1.3), 159–162 (Prop 1.4), 171–177 (Prop 1.5), 224–247 (§1.6, Prop 1.7), 399–404 (Cor 1.8), 418–457 (Thm 1, `k` reduced to algebraically closed, cases (a)/(b)), 458–461 (Rem 2.2 a)); `illusie-1985` lines 797–834 (Thm 4.4 (a)–(f)), 1105 (Cor 4.7, printed p.178), 1181–1200 (Cor 4.8, printed pp.180–181); `oort-tate-1970` lines 450–454 (Thm 2, p.12), 502 (Remarks, p.15), 609–617 (Lemma 4, p.17), 722–730 (Thm 3, p.20); `kim-2012` lines 445–448 (Thm 4.1), 457–461 (Prop 4.2), 477–479 (Cor 4.3), 501 (Cor 4.4); `pink-2005`, `yu-2026`, `bms-2018`, `brinon-conrad`, `wintenberger-1983`, `liu-2013`, `anschutz-lebras`, `schoof-2003`, `ramakrishna-1993`, `acc-2023`, `patrikis-2019`, `schroer-2023`, `cdt-1999` were fetched but not read beyond confirming identity.

**Adversarial pass: 96 rows.** Values are computed on both sides; “pass” means the instance agrees, not a general proof. Targets omit the `R07.` prefix.

| Statement | Instances; values on each side | Result |
|---|---|---|
| `absRamificationIndex` | `ℤ₃`, `p=3`: `v(3)=1`; `ℤ₃`, `p=2`: `2` a unit, `0`; `𝔽₃⟦t⟧`, `p=3`: `v(0)=⊤`, `toNat=0` (junk, excluded by `CharZero K`); `𝒪[√2]`: `v(√2)=1`, `v(2)=2` | pass |
| `prolongation_unique_of_lt` | `p=3`, `e=1`: `1<2`, `ℤ/3` unique model of its generic fibre; `ℤ₃[ζ₃]`: `e=2`, `2<2` false, `ℤ/3` and `μ₃` two models; `p=2`: `e<1` impossible since `v(2)≥1` (vacuous, as README:2244 says) | pass |
| `genericFibre_map_bijective` | `ℤ₃`: `Hom(μ₃,ℤ/3)` generic `0` (`μ₃` ramified), integral `0`; `ℤ₂` (excluded): generic `Hom(μ₂,ℤ/2)` has 2 maps, integral 1 (connected→étale) | pass; hypothesis needed |
| `globalPrimeOrderClassification` | rank `2` over `ℤ`: `ℤ/2`, `μ₂` both admitted, nonisomorphic (special counts 2, 1); over `ℤ[1/2]`, `p=3`: eight groups, outside the stated base | pass |
| `KilledBy` | `m=0`: `toConv(id)^0=1` holds for every `G`, so `hn : 1 ≤ n` is needed and present; `ℤ/9`: `[9]=0`, `[3]≠0` | pass |
| `fontaineRamificationBound` normalization | `length_R(S/𝒟)=f·v_L(𝒟)`, `[L:K]=ef`, quotient `v_L(𝒟)/e=v_K(𝒟)`; `μ_{p^n}/ℤ_p`: `n−1/(p−1) < n+1/(p−1)`; `p=3,n=2`: `3/2<5/2`; `L=K`: `0<e(n+1/(p−1))`; `μ₂/ℤ₂`: `L=ℚ₂`, `0<2`; sub-extension `L ⊆ K(J(K̄))`: `𝒟_{L′/K}=𝒟_{L′/L}𝒟_{L/K}` so the bound descends | pass |
| `dieudonneEquivalenceFinite` | `ℤ/p`: length 1, `F=σ` bijective, étale; `μ_p`: `F=0`, not étale; `W_n^m`: rank `p^{nm}`, length `nm`; zero: length 0, rank 1 | pass |
| `flFiniteFlatDictionary` | `p=3`, `k=𝔽₃`: `ℤ/3 ↦ (k, Fil¹=0, φ⁰=σ)`, `μ₃ ↦ (k, Fil¹=M, φ¹=σ)` in `[0,1]`; `p=2` excluded (`μ₂` not unipotent) | pass |
| `finiteFlatClassification` | `E=u−p`: `ℤ/p ↦ 𝔖/p·e`, `φe=e`, `Ee ∈ span φ(M)`; `μ_p ↦ φe=aEe`, `Ee=a⁻¹φ(e)`; `u` injective on `k⟦u⟧`; `p=2` included (Kim Cor 4.3); `E=1` excluded by `natDegree>0` | pass |
| 1.1 relative `F,V` | over `𝔽_p`: `ℤ/p` `(F,V)=(1,0)`, `μ_p` `(0,1)`, `α_p` `(0,0)`; `VF=FV=p=0`; `𝔽₂×𝔽₂`: invariants dim 3, norm quotient dim 2 | pass |
| 1.2 étale dictionary | `ℤ[1/N]` normal connected; `μ_p` over `𝔽_p` nonreduced; order invertible ⇒ étale (Stix Thm 34) | pass |
| 1.3 types | `ℤ/p` étale+unipotent, `μ_p` connected+multiplicative, `α_p` biconnected; Thm 44 filtration `G^μ⊂G⁰⊂G` | pass |
| 1.3 ordinary count | `μ_{p^n}×ℤ/p^m`, `W=μ_{p^n}`: `[M:W]=p^m=#G_k(k̄)`; supersingular `E[p]`: `p²` vs `1`, excluded; `ℤ₂`: counts `1`,`2` for `μ₂`,`ℤ/2`, `e<p−1` false | pass |
| 1.27 `F`-vector schemes | constant `𝔽₃`: 2 nonzero points, 1 scalar orbit, eigenrank 1; `𝔽₃²`: 8 points, 4 orbits, eigenrank 4; Raynaud 1.2.2 needs “bigèbre de rang `q`” | pass (R01 repaired) |
| 1.28 strictly henselian classes | `e=1`: `n∈{0,1}`, two order-`p` groups; `ℤ_p[ζ_p]`: `n∈{0,…,p−1}`, `p` classes | pass |
| 1.30 boundary | `ℤ₃[√3]`: `e=2=p−1` but `ζ₃∉ℚ₃(√3)` (`x²+x+1` has no root mod `√3`-adically: `−3` not a square), so `μ₃≇ℤ/3` generically | pass |
| 1.31 two models | `ℤ₂`: `ℤ/2`, `μ₂`; `(ℤ/p)²` over `ℚ_p(ζ_p)`: `ℤ/p²`, `ℤ/p×μ_p`, `μ_p²` three models | pass |
| 1.32 exponents | `μ_p/ℤ_p`: `n=1`, character `ω`; `ℤ/p`: `n=0`; supersingular `E[p]`: `(0,1)` level 2 | pass |
| 1.33 determinant | `μ_p`: different `(p)=(π^e)`, character `θ_{p−1}^e`; `ℤ/p`: unit, trivial; product `(p)` | pass |
| 1.34 Oort–Tate | `p=2`, `(1,2)`: `f⋆f=1+1−2=0`; `(2,1)`: `u=1−f`, `u²=1`; over `𝔽_p`: `(1,0),(0,1),(0,0)`; `α_p` lift needs `v(ab)≥2>1` | pass |
| 1.35 number rings | OT Thm 3: `0≤n_𝔭≤v_𝔭(p)`, `χ_𝔭(u)=N(ū)^{−n_𝔭}`; over `ℤ`: `(1,0)`, `(ω,1)` | pass |
| 1.36 Katz–Mazur | `ε=1`: split; `p=2`, `ε=−1`: rank 4, points generate `ℚ(i)` | pass |
| 2.19 charpoly | `n=0`: `P=1`; `ℚ_p/ℤ_p` over `𝔽_{p²}`: `F²=1`, `X−1`, degree 1 odd ≠ `2 dim A` | pass (scope repaired) |
| 2.20 covariant evaluation | `ℚ_p/ℤ_p` over `𝔽_p`: `M_A=ℤ_p`, `F=p`, `V=1`, `φ=1`, fixed line `ℚ_p=G̃(𝔽_p)`; `μ`: `F=1`, `V=p`, `φ=p⁻¹`, fixed `0=μ̃(𝔽_p)`; pairing target `F=pσ`; `D(μ)^t=(W,σ)=D(ℚ_p/ℤ_p)` with `⟨Fe,F^te^*⟩=p=pσ⟨e,e^*⟩` | pass |
| 2.22 `bt1DieudonneHodgeExact` | `μ_p`: `D=O_S`, `ω=O_S`, `Lie(ℤ/p)=0`; `E[p]`: rank 2, `1+1`; `𝔽_p[ε]`: coker of `ε` not flat; `α_p`: `k` with `F=V=0`, `ω` and `Lie` both dim 1, no exact Hodge sequence | pass; route locator R03 |
| 2.27 tube recurrence | identity on `μ`: `p⁻¹·pσ·σ⁻¹=1`; on constant: `p⁻¹σ·pσ⁻¹=1`; zero map stays zero | pass |
| 2.27 bounded functions | `Spf O`: `O`; `O⟦t⟧`: `Σtⁿ` bounded, not in `O⟨t⟩`; `O⟨πt,t²⟩`: `t` bounded, absent; `O/π`: empty generic fibre | pass |
| 2.29 constant length | `k`: ordinary length; `V` nonfield: `M=V`, fibre length 1, chains `V⊃xV⊃…`; `0`; `⊕W(A)/p` excluded | pass |
| 2.28 semiperfect Hom | `ℚ_p/ℤ_p` over `𝔽_p`: `End=ℤ_p=End_{A,F,V}`, rational `ℚ_p`; `p⁻¹` not integral | pass |
| 3.3a interval transport | jump `−1`, `φ_{−1}=σ`: `T_cov=ℤ_p(1)`, `U_{[−1,−1]}=ℤ_p(−1)`; jump `+1`: `ℤ_p(−1)`, `ℤ_p(1)` | pass |
| P5a predicates | `ℤ_p(1)` in `[1,1]`, witness jump `−1`; `p^mℤ_p(1)⊆ℤ_p(1)` quotient `ℤ/p^m(1)`; `p=3`: `χ̄=χ̄⁻¹`, intervals `[1,1]` and `[−1,−1]` both witness; `μ₃` not in `[0,0]`: `Φ₃(1+X)=X²+3X+3` Eisenstein, ramified; trivial `ℤ/p` in `[0,0]` with `B_cris⊗ℤ/p=0` | pass |
| P7.1 adapter | `E(1)`: `e⊗t⁻¹↦t⁻¹⊗e`, jump `−1`, weight `+1`; `V=0`: both sides zero | pass |
| P7.2 Sen (imported) | `χ`: operator `1`; `χ⁻¹`: `−1`; `log χ` extension: `[[0,1],[0,0]]`, eigenvalues `0,0`, not semisimple | pass |
| P7.3 characters | `Frob↦1+p` unramified: weight 0, infinite image; `χ^{1/2}`: weight `1/2` not HT | pass |
| G1 models | `ℤ/ℓ`: maximal fibre `ℓ` points, minimal `1`; `I_P` nontrivial: maximal model quasi-finite not finite; zero group: one model | pass |
| G2 lengths | full constant `(ℓ,δ,α)=(1,0,1)`; minimal `(1,1,1)`; full `μ_ℓ` `(1,0,0)`; zero `(0,0,0)` | pass |
| G3 bound | full `ℤ/ℓ`: `(δ,α,h⁰,h¹)=(0,1,1,0)`, `−1≤−1`; `μ₂`: `(0,0,1,1)`, `0≤0`; minimal constant `(1,1,0,0)`, `0≤0`; minimal `μ₂`, `P≡1 mod 4`: `h¹=1`, `1≤1`; `P≡3`: `0≤1`; Mazur’s `ε` matches | pass |
| G4 rank one | `k=𝔽_ℓ`: `ℤ/ℓ`, `μ_ℓ`; `𝔽_{ℓ²}`: rank `ℓ²`, points `ℓ²` and `1`; `ℤ[1/5]`, order 3 with `χ_{ℚ(√5)}`: neither | pass |
| G5 Stickelberger | `ℓ=3`: `−1≡1 mod 2`; `ℓ=5`: `B₂=1/6` unit; `ω⁻¹(2)=3 mod 5`; `5L₁≡Σa·a⁻¹=4≡−1`; `5L₃≡Σa⁻²=10≡0` so `L₃` integral | pass |
| G5 Ext | `Ext¹_ℤ(μ₂,ℤ/2)=0` (Prop 2.1 any `p`); `Ext¹(ℤ/2,μ₂)∋D`; `M=0` or `C=0`: `0`; over `ℤ[1/P]`, `P≡±1 mod 8`: nonzero (Prop 5.1) | pass |
| G6 purity | `ℤ/3^a×μ_{3^b}` pure; cubic subfield of `ℚ(ζ₇)` unipotent `𝔽₃²`: inertia at 7 of order 3, not pure; `D`: unramified at odd `P`, extends, not pure, `ℓ=2` excluded | pass |
| G7 `D` | rank 4, killed by 2, torsor `ℤ[t]/(t²+1)` has no `ℤ`-section; special fibre `μ₂×ℤ/2`, 2 points; other two classes cyclic of order 4 | pass |
| G8 amalgam | `M=μ₂`: `2·4/2=4` (`D`); rank-4 `M`: `8`; `M=0`: no `μ₂`; `G⁰=M_{ℤ₂}`, `G^ét=ℤ/2` (Lemma 17.3) | pass |
| 3.9 weights | `h=1`, jump `i`: character `ω^i`; `i=0`, `i=p−1` collide; `(1,0)` level 2 | pass |
| 3.18 Honda | `μ_p`: `Fil¹=M`; `ℤ/p`: `Fil¹=0`; `p=2`: `μ₂` has quotient `N=N¹`, excluded | pass |
| 4.3 field of norms | `p=2`: `N(√2)=−2`, `N(−π_{n+1})=−π_n` norm-compatible; residue image equal mod 2 | pass |
| 4.4 Cohen equivalence (instance) | `φ(e)=ue`: unit over `𝒪_ℰ`, cokernel `𝔖/u` over `𝔖`; `φ(e)=pe`: not étale, fixed vectors 0 | pass |
| 4.15 structure | `𝔖/p`: `M_tor=M`; `(p,u)`: `M_free=𝔖`, `M̄=k`; `𝔖/u`: `φ^*(𝔖/u)=𝔖/u^p`, `E≡p·unit mod u`, lengths `p≠1` | pass |
| 4.15 torsion argument | `Z` finite in the open disc; `x` maximal with `|x|≥|π|` ⇒ `p`-th root `y∈Z`, `|y|>|x|`; so `|x|<|π|` ⇒ `x^{p^m}∈Z` ⇒ `x=0`; `K₀[u]/(u^d)≅K₀[u]/(u^{pd})` ⇒ `d=0` | pass |
| 4.15 twist | `E_r/E_s`: for `j≥1`, `φ^j(E)(π)=π^{ep^j}+p·g(π^{p^j})` with `g(0)` unit, valuation `e`, so `≡p·unit`; undivided inverse limit `0` since `𝔖/E_s` is `p`-adically separated | pass |
| 4.16 BMS functor | `ℤ_p(1)↦𝔖{1}`, `A_inf{1}=μ⁻¹(ℤ_p(1)⊗A_inf)`; `E=u−p`: `θ(ι₀E)=0`, `θ(ι₁E)=p^p−p≠0` | pass |
| 4.18 Breuil modules | `μ`: `Fil¹𝓜=𝓜`, `φ=p`; `ℚ_p/ℤ_p`: `Fil¹=Fil¹S·𝓜`, `φ=1`; `φ₁=0` fails generation | pass |
| 4.19 `A_cris` pairing | `ℚ_p/ℤ_p`: `A_cris^{φ=1}=ℤ_p`; `μ`: `(Fil¹A_cris)^{φ=p}∋t`, and `t/2` at `p=2` since `t^{p−1}∈pA_cris` | pass |
| 4.21–4.23 classification | `μ`, `ℚ_p/ℤ_p` ↦ rank-one objects `φ=aE`, `φ=1`; `H=μ_p⊂μ_{p^∞}`: cokernel of `p`; `p=2` integral by Kim Thm 4.1 | pass |
| 4.26 windows | unit: `(S_r,Fil¹S_r,φ,φ/p)`; dual `(S_r,S_r,pφ,φ)` with `u₀/t` correction (CL Ex 3.4.8); `μ` window `Φ(e)=pe`, `∇e=0`, `F=pσ` | pass |
| 4.26 connection estimates | `p⁻¹dφ(du)=(1+u)^{p−1}du`, residue 1, not nilpotent; `p⁻¹dφ(dt_i)=t_i^{p−1}dt_i`, zero at `t=0`; `∇(t₁e)=e⊗dt₁`, `∇Φ(t₁e)=pe⊗t₁^{p−1}dt₁` | pass |
| 4.26 descent | `K′=F_r`: trivial; `ℚ_p/ℤ_p` with `[a]` of order `p−1`, `p>2`: nontrivial on `G_k`, no integral descent (Lemma 3.4.4) | pass |
| 4.27 WD | `𝔽_{p²}`, `a(g)=2`: `φ^{−2}=1` linear; `φ^{−1}` swaps embeddings | pass |
| 4.29 tame types | `x₁=1,x₂=p`: `t_N=1=t_H`; `x₁=x₂=1`: `0≠1` | pass |
| 4.30 descent data | `[1]=0` on `ℚ_p/ℤ_p` fails the unit law; `[gh]=[g]∘[h]` ill-typed | pass |
| 4.31 strongly divisible | `S·e`, `Fil¹=Fil¹S·e`, `φe=a⁻¹e`, `ĝe=ω̃^je` (Savitt Prop 5.1); `Fil¹M=Fil¹S·e+pM`: `pe∈Fil¹M∩pM`, `pe∉pFil¹M` since `p∉Fil¹S`; `p=3`, `ℚ₃/ℤ₃`: `M(G(1))` free over `S/3`, killed by 3, not `S`-free (Breuil Cor 4.2.2.7) | pass |
| 4.31 canonical `N` | Prop 5.1.3: `Nφ₁=φN=c⁻¹φ₁(E(u)N·)` ⇒ `φ₁(E(u)Nx)=cN(φ₁x)` as README:6992–6993 | pass |
| 4.32 dual limit | `ℚ_p/ℤ_p`, `p>2`: `H_n=ℤ/pⁿ`, `j_n=·p`, duals = reduction, limit `ℤ_p(1)`; un-dualized `Hom(ℤ_p,ℚ_p/ℤ_p)=ℚ_p/ℤ_p` torsion | pass |
| 4.34 maximal Breuil | `p=5`, `α(t′)=2t″`: `f(e″)=3e′`, `T(f)(t″)=3t′=α⁻¹(t″)≠2t′` | pass |
| 4.35 characters | `j=0,a=1`: `T=ω`; level-2: `ω₂^{m+p+1}` (Prop 5.4(2)) | pass |
| 5.1–5.3 inertia | `h=2,p=3`: order `8`; `h=1`: `2`; `p=2`, `h=2`: order 3 tame | pass |
| 5.4 multiplicative | `v(q)=1`, `p` odd: case (c), très ramifiée; `p∣v(q)`: unit class; `j=q⁻¹+744+…`, `v(j)=−v(q)`; `K′=K(√−c₆)` unramified | pass |
| 5.4 criterion | `q=πu^p`-free unit class ⇒ model; `q=π`: none, semisimplification `μ_p⊕ℤ/p` has one; `ℚ₂`: `q=−4` class `−1` (unit, `−1` nonsquare) finite nonsplit; `q=2` not finite; quadratic twist acts trivially on 2-torsion | pass |
| 5.5 peu/très | `ℚ₂`: `−1` unit ⇒ peu; `2` valuation 1 ⇒ très; `5` unramified, outside `IsPeuRamifiee`, inside `peuRamifieH1` | pass |
| 5.6 Kummer | `ℤ₃`: `4` noncube unit (cubes `≡±1 mod 9`) ⇒ flat; `3`: none; `ℤ₂` law `(1,1)²=(−1,0)` exponent 4, outside killed-by-2 | pass |
| 5.7 Serre criterion | `μ_p⊕ℤ/p`: `det=χ̄`, flat; `v(q)=1`: nonunit class; `ψ²⊕ψ^{2p}`: digits not in `{0,1}` | pass |
| 5.8 dyadic | `ℚ₂(√−1)`, `√−5`, `√5`: finite; `√±2`, `√±10`: not; discriminants `(4)`, `(1)`, `(8)` | pass |
| 5.11 FL weights | `k=2` irreducible: `ω₂⊕ω₂^p`; `θ_{k−1}(Φ²)=−1` gives `det=µ⁻¹`; `ℤ_p` vs `ℤ_p(p−1)` same reduction, different intervals | pass |
| 5.12 `ℤ_l` types | `1⊕ε̄⁻¹` or `ω₂⁻¹⊕ω₂^{−l}`; `l=2`: `1=ε̄⁻¹`; `det E[5]^∨=ε̄₅⁻¹` | pass |
| 5.13 `H¹_f` | `ℚ_l`, `l` odd: `dim H¹=2`, `dim H¹_f=1`; uniformiser class outside; `ℚ₃`: `4`; `ℚ₂`: `5` gives `X²−X−1` irreducible mod 2 | pass |
| 5.15 Serre weights | `p(p−1)`: 2 at `p=2`, 6 at `p=3`; `diag(2,1)` at `p=5`: traces `3` vs `2` | pass |
| 6.1a Herbrand (owner R01) | `Frac W(𝔽̄₃)(ζ₃)`: `e=2`, different exponent `1`, upper jump `0`; `y^p−y=t⁻¹`: `v_L(y)=−1`, `σ(y⁻¹)−y⁻¹=−1/(y(y+1))` valuation 2, `G₁=G`, `G₂=1`, different `2(p−1)`, integral upper jump 1; tame degree `e`: `G_K^u∩G_L=G_L^{eu}` | values pass; owner is PadicPeriodRings §0.3 |
| 6.2 Fontaine numbering | `ℚ₃(ζ₉)`: `G₀=G` (6), `G₁=G₂=C₃`, `G₃=1`; Serre `φ(2)=1`, breaks `{0,1}`, Fontaine `u=2`; `v₃(𝒟)=2−1/2=3/2=u−i` with `i=3/6=1/2`; `(p,n)=(2,1)`: `L=ℚ₂`, `u=0` | pass |
| 6.3 boundary | `e=6`, `i_{L/K}=1/2`, `d=|G_{(1/2)}|=3`, `m=11/6`; `φ_F(i)=1/2+3i` on `[1/6,1/2]` ⇒ `ψ(11/6)=4/9`, `eψ=8/3`; wrong substitution `35/3`; tame `ℚ₃(ζ₃)`: `u=1`, `(P_{1/2})` fails | pass |
| 6.4 lifting | `B=ℤ₃[X]/(X³−1)`, `a=3`: `4³−1=63≡0 mod 9`, reduction `1` lifts to `X↦1≢4 mod 9`; `m=1/4`: `a^m=3ℤ₃`, `c=1>1/2`; `(√3)`: `c=e/(p−1)`, PD but not nilpotent | pass |
| 6.5 bound | Thm 1 hypotheses: `K` char 0, perfect `k`, `J` killed by `pⁿ`; `μ_{pⁿ}`: `u=n`, `v=n−1/(p−1)`; `e=n=1` without embedding (Rem 2.2 a) | pass |
| 6.7 tangent | `k(1)⊕k`: `h⁰=2`, `d(n−d)=1`, `3`; trivial `k²`: `4`; `k(1)²⊕k²`: `d=2`, excess `4`; Schur `(0,1)`: `2` | pass |
| 6.9 purity normalization | `B={(a,b):a−b∈m}`: not normal, closed fibre dim 3 vs generic rank 2; normalization `A²` | pass |
| 6.10 cyclotomic image | `v₃(𝒟_{ℚ₃(ζ₉)})=3/2` against `<3/2`; general `p`: `2−1/(p−1)=(2p−3)/(p−1)=1+1/(p−1)+(p−3)/(p−1)` | pass |

## Not verifiable

- `serre-1987` (Duke, DOI `10.1215/S0012-7094-87-05413-5`): no legal text found (Project Euclid landing page has no PDF); the §2.4, §2.6, §2.8 locators of §§R07.5.5, R07.5.7, R07.5.8 and the finite-flat criterion of §R07.5.4 are cited by locator only. Listed in `needs-references.toml`.
- Kisin 2006, 2008, 2009, 2009b: the author’s page serves `.dvi`, which the service cannot extract; the Layer R07.4 locators into these papers (Lemma 2.2.4, Theorem 2.3.5, Errata E.3–E.5, 1.1.13–1.2.11, Theorem 0.8) are uncertified; Kim 2012 and Breuil 2000 were read instead where they overlap.
- Faltings 1999 Theorem 7 (AMS), Berthelot–Breen–Messing 1982 (Springer LNM 930), Tate 1967, Demazure 1972, Breuil 1999b, Bloch–Kato 1990, Serre *Local Fields*, Silverman *Advanced Topics* V.5.3, SGA 3 XVII 4.2.1: paywalled or not located; cited by locator only.
- Fontaine 1994 (Astérisque 223, both articles), Nizioł 1993, Brinon–Conrad §§9, 13–15, Patrikis, ACC §7, Anschütz–Le Bras, Pink, Yu, Wintenberger, Liu 2013, Schoof, Ramakrishna, Schröer, Conrad–Diamond–Taylor: fetched legally but outside the sample; not read line by line.

## Source issues

- **Misprint** in savitt-2005 at Definition 3.1, printed p.12 (line 532): the source indexes descent data by `Gal(F′/F)`; it should be `Gal(F/F′)`, since `F′ ⊆ F`; affects nothing.
- **Misprint** in savitt-2005 at §3.3, printed p.14 (lines 653–655): the source says the finite-level modules `M(G(n))` are objects of the free-module category `Mod¹₀`; it should say they are `S_n`-free objects of the torsion category, as Breuil’s Corollaire 4.2.2.7 states; affects nothing.
