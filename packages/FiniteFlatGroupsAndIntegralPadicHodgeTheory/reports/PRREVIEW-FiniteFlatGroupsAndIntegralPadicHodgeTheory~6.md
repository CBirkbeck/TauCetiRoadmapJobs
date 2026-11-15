# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 57634fc)

**Verdict:** needs changes

## R01 (P2) — The torsion strongly divisible categories omit Breuil's compatibility axiom, and the stated equivalence with Breuil modules fails for them

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:7046–7048`: “objects `S`-modules `M` with a submodule `Fil^{k−1}M ⊇ (Fil^{k−1}S)M` and a `φ`-semilinear `φ_{k−1} : Fil^{k−1}M → M`, with no finiteness condition”; used at `:7050–7052`, `:7243–7244`, `:7274`.

**Claim:** `M ↦ M ⊗_{S₁} k_F[u]/u^{ep}` is an equivalence from the objects of `Mod¹_tor` killed by `p` to Breuil modules.

**Witness:** `F = ℚ_p`, `p > 2`, `E = u − p`: `M = S₁e`, `Fil¹M = Fil¹S₁·e`, `φ₁(ue) = ce`, `φ₁((E^p/p!)e) = e` meets every stated condition, yet `φ₁` is nonzero on `ker(S₁ → k[u]/u^p)·M`. `savitt2005` line 607 and `breuil2000` line 213 require `φ₁(sx) = φ₁(s)φ(x)`.

**Repair:** at `:7046–7048` write: “… and a `φ`-semilinear `φ_{k−1} : Fil^{k−1}M → M` such that `φ_{k−1}(sx) = φ_{k−1}(s)·φ(x)` for all `s ∈ Fil^{k−1}S` and `x ∈ M`, where `φ(x) = c^{−(k−1)}φ_{k−1}(E(u)^{k−1}x)`, with no finiteness condition”. The axiom gives `φ₁((E^p/p!)e) = φ₁(E^p/p!)·φ(e) = 0` for `p > 2`, which excludes the witness; add the witness to the Checks of §R07.4.31, with the remark that on finite free `S`-modules the axiom follows from semilinearity because `S` is `p`-torsion-free.

## R02 (P3) — §R07.4.20 is stated for finite `K/ℚ_p` only, below its own setting and inputs

**Location:** `README.md:6389`: “For every prime `p` (including `p = 2`) and every finite `K/ℚ_p`: if `V` is a crystalline representation of `G_K` with all Hodge–Tate weights equal to `0` or `1`, there is a `p`-divisible group `G` over `𝒪_K`”.

**Claim:** `crystalline01IsBt` needs a finite residue field.

**Witness:** `:6396` “The setting is the Kummer frame of §R07.4.1” (`k` perfect, `:5517`); its inputs §R07.4.14, §R07.4.19 (`:6327`, perfect `k`) and §R07.4.23 (`:6503`) have perfect `k`. FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII, README line 51, asks for exactly this extension.

**Repair:** at `:6389` write “For every prime `p` (including `p = 2`) and every `K` as in §R07.4.1 (a finite totally ramified extension of `W(k)[1/p]`, `k` perfect of characteristic `p`): …”, keep “finite `K/ℚ_p`” as the first Check, and add the Check “`K = W(F̄_p)[1/p]`: `V_p(E)` for `E` with good reduction over `W(F̄_p)`”.

## R03 (P3) — Six `### Dependencies` sections omit suppliers that their own *Needs* lines name, and one cites a Check that does not exist

**Location:** `README.md:2724`: “SchemeAndStackFoundations §0.23 and §4.1 (and §5.4 for the projective-line-bundle Check)”; also `:4530–4536`, `:5474–5481`, `:7494–7503`, `:8305–8310`, `:8912–8921`.

**Claim:** each layer's Dependencies lists what its targets need.

**Witness:** `grep -n 'projective-line' README.md` gives `:2724` only. *Needs* at `:646` (§0.29), `:1461`, `:1582`, `:1646`, `:4198`, `:4223`, `:4643`, `:5553`, `:5860`, `:7023`, `:7839`, `:8207`, `:8575`, `:8815` name suppliers absent from their layer's Dependencies.

**Repair:** R07.1 (`:2724`): replace by “SchemeAndStackFoundations §§0.29 and 4.1”, and add “NoncommutativeAndEquivariantIwasawa §F.6; ArithmeticGaloisRepresentations §§1.1–1.2, 1.5, 2.3 and 7.6; GlobalNumberFields Layers 9–10; PadicLocalLanglandsForGL2Qp §0.2”. R07.2: add “AdicSpacesPartIII R2.9; SchemeAndStackFoundations §§0.14 and 4.8; CrystallineCohomology §§CR.1.2–CR.1.3 and CR.7.1”. R07.3: add “CrystallineCohomology §CR.4.7”. R07.4: add “RestrictedPowerSeries §7.1; CrystallineCohomology §CR.4.7; DerivedModuleAlgebra §0.4; DerivedDeRhamCohomology §§PD.1–PD.7 and 0.20; Tau Ceti `TauCeti.Algebra.IsStandardSyntomicOfRelativeDimension`”. R07.5: add “ModularCurves Layer 0E; ClassFieldTheory Layer 5; ArithmeticGaloisRepresentations §1.4; EllipticCurves Layer 5”. R07.6: add “ModularCurves Layers 0B, 0C and 0E; SchemeAndStackFoundations §§4.4 and 4.8”.

## R04 (P3) — `## Exact supplier contracts` has no entry for two suppliers and for eight consumed sections

**Location:** `README.md:319–533` (the contracts) against `:4175`: “the discrete-valuation specialization of AdicSpacesPartIII R2.9's `FormalScheme.FSC` and `rigOfFSC`” and `:2883`: “Use CyclotomicClassGroupsAndStickelberger §§0.2–0.3, 2.1–2.5, 3.1–3.2 and 8.1–8.3”.

**Claim:** the contracts list, per supplier, every section and declaration consumed.

**Witness:** `sed -n 51,550p README.md | grep -c` gives `0` for `AdicSpacesPartIII`, `CyclotomicClassGroupsAndStickelberger`, `SchemeAndStackFoundations §1.2`, `§§2.1`, `§4.4`, `§4.8`, `EtaleCohomologyFoundations §0.7`, `CR.1.2`, `Layers 11–13`, and for ModularCurves Layers 2A–2B (`:1832`, `:8338`).

**Repair:** add contract bullets: “**AdicSpacesPartIII.** R2.9 supplies `FormalScheme.FSC`, the Berthelot generic fibre `rigOfFSC` and its tubes, consumed by §R07.2.27.” “**CyclotomicClassGroupsAndStickelberger.** §§0.2–0.3, 2.1–2.5, 3.1–3.2 and 8.1–8.3 supply `cyclotomicClassEigenspace`, `bernoulli_annihilates_component`, Herbrand's implication and `inverseCharacterClassGroup_all_levels`, consumed by §R07.G5.” Extend the existing rows: SchemeAndStackFoundations by “§1.2 (fppf descent of quasi-finite morphisms), §§2.1, 2.3, 2.10–2.11 (site cohomology, torsors, comparison of topologies, Kummer sequence), §4.4 (`schlessinger_prorepresentable`, `smooth_iff_powerSeries`), §4.8 (`coherentFormalModuleEquivSpec_effective`)”; EtaleCohomologyFoundations by “§0.7”; CrystallineCohomology by “§§CR.1.2–CR.1.3”; ClassFieldTheory by “Layers 12–13”; EllipticCurves by “Layer 5”; ModularCurves by “Layers 2A–2B”; and name the three in the Scope paragraph `:148–205`.

## R05 (P3) — Four Checks name Lean declarations that neither the README nor `Suggested.lean` defines

**Location:** `README.md:1209` “`nthSeries n=(1+X)^n−1`”; `:4514` “the scalar pullback in `berthelot_field` is necessary”; `:4786` “as in `isWeaklyAdmissible_split_vs_line`”; `:6762–6763` “recovers `wach_unit` and `wach_mu`”.

**Claim:** a Check states what is computed and never names a Lean counterpart; every term is defined where it first appears.

**Witness:** `grep -c` in `README.md`: `nthSeries` `1`, `berthelot_field` `1`, `isWeaklyAdmissible_split_vs_line` `1`, `wach_unit` `1`, `wach_mu` `1`; none is among the 27 declarations of `Suggested.lean`.

**Repair:** `:1209` “For `Ĝ_m`, the multiplication-by-`n` series `[n](X) = (1+X)^n − 1` has linear term `nX`”; `:4514` “the scalar pullback `σ_k^*` in the field comparison above is necessary”; `:4786` delete “as in `isWeaklyAdmissible_split_vs_line`”; `:6762–6763` “recovers the unit and multiplicative Wach modules of the Checks of `wachBreuilKisinComparison` below, including the latter's nontrivial semilinear action in its BT basis”.

## R06 (P3) — One cited work has no reference entry, and one entry does not describe the copy at its URL

**Location:** `README.md:7658`: “Silverman, *Advanced Topics*, V.5.3.” and `:9134`: “Romyar Sharifi, *Iwasawa Theory*, 189-page lecture notes, §4.5, pp.114–117.”

**Claim:** every locator points into a work listed under `## References`, as it is at the given address.

**Witness:** `sed -n 8979,9137p README.md | grep -c Silverman` = `0`. The file served at the Sharifi URL has 184 pages (`sharifi` has 184 page markers); Lemma 4.5.2 is at `sharifi` line 3591, printed p.114.

**Repair:** add “- **Silverman 1994.** Joseph H. Silverman, *Advanced Topics in the Arithmetic of Elliptic Curves*, Graduate Texts in Mathematics 151, Springer, 1994; Chapter V, Theorem 5.3.” and write `:7658` as “Silverman 1994, Chapter V, Theorem 5.3”. At `:9134` replace “189-page lecture notes” by “lecture notes (184 pages in the copy read)”.

## R07 (P3) — The description's supplier list omits roadmaps the head consumes

**Location:** pull request description: “Section-level suppliers: NoncommutativeAndEquivariantIwasawa (§F.6 …), … RestrictedPowerSeries (§7.1) and PurityOfBranchLocus (§§2.1–2.2).”

**Claim:** the sentence lists the section-level suppliers.

**Witness:** `README.md:4175`, `:4200`, `:4223`, `:4265` consume AdicSpacesPartIII R2.9; `:2825` ClassFieldTheory Layers 11–13; `:1647` GlobalNumberFields Layers 9–10; `:7655` EllipticCurves Layers 4–5; `:8170` ProfiniteCohomology Layer 9; `:8915` LocalFieldsRamification Layers 3–4. None is in the list.

**Repair:** append to the list “…, and, on main, AdicSpacesPartIII (R2.9, formal schemes and their rigid generic fibres, consumed by R07.2.27), ClassFieldTheory (Layers 5, 7 and 11–13), GlobalNumberFields (Layers 9–10), EllipticCurves (Layers 4–5), ProfiniteCohomology (Layer 9), LocalFieldsRamification (Layers 3–4), EtaleCohomologyFoundations (§§F.0.2, 0.7 and F.10.1–F.10.2b) and PerfectoidSpaces (§§P1.6, P1.10, P1.16–P1.18)”, and add AdicSpacesPartIII, ClassFieldTheory, GlobalNumberFields, EllipticCurves, ProfiniteCohomology and LocalFieldsRamification to the sentence naming the roadmaps on main.

## Previous findings

- R01 — repaired: `README.md:122–129` “is RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3 … and §§4a.1–4a.3 … This roadmap plans none of these; §§R07.6.2 and R07.6.5 consume §§3a.1–3a.2, 4a.1 and 4a.3”; the contract bullet is at `:461–474`; `grep -c 'PadicPeriodRings §0.3'` = `0`. The six section headings resolve on main (its lines 421, 566, 696, 908, 1079, 1185).
- R02 — repaired: `:422–427` “the unit-Kummer subspace … the peu-ramifiée predicate … the très-ramifiée predicate, and the restricted peu-ramifiée comparison”; `grep -c 'peuRamifieH1\b\|IsPeuRamifiee\|IsTresRamifiee'` = `0`. `:1727` keeps “(`tateSen`, `PadicFieldCompletion`)”: PadicPeriodRings §2 at its head names both targets (its lines 292, 333), so no change is asked.
- R03 — repaired: `:1391–1400` and `:1509–1516` carry no label; `grep -c '^- `[A-Za-z_.]*` — '` = `0`.
- R04 — repaired: `:1946–1950` (`genericFibre`, `rank`), `:4885–4888` (`FLModule.IsTorsionIn`, `FLTorsion`), `:5612–5613` (`TorsionKisinModule.Hom`).
- R05 — repaired: no heading carries a theorem number (`grep -E '^###? .*(Theorem|Proposition|Lemma) [0-9]'` is empty); `:8036` “given by §R07.3.9”.
- R06 — repaired: the table `:41–49` has seven rows, one per `## Layer` heading.
- R07 — repaired: `:4261` “§7.5.1 and Proposition 7.5.2, pp.91–95”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| `admissible-global-models` (§R07.G1) | constant `ℤ/ℓ`; `H = 0`; nontrivial `I_P` | finite flat iff `I_P` trivial; `mazur1977` lines 688–709 (b), Prop. 1.3; lines 710–747 (c); pp.43–47 | pass |
| `admissible-cohomology-bound` (§R07.G3) | four elementary groups; `ℓ = 2`, `P ≡ 1, 3 mod 4` | `(δ,α,h⁰,h¹)`: `(0,1,1,0)`, `(0,0,1,1)`, `(1,1,0,0)`, `(1,0,0,1 or 0)`; `h¹−h⁰ ≤ δ−α`: `−1≤−1`, `0≤0`, `0≤0`, `1≤1`, `0≤1`; `mazur1977` 836–866 | pass |
| `admissible-cyclotomic-class-obstruction` (§R07.G5) | `ℓ = 3, 5`; `j = 1, 3` | `ω⁻¹(2) = 3 mod 5`; `5L₁ ≡ −1 mod 5`; `L₃ ≡ B₂/2 = 1/12`, unit; `(1+ℓ−ω(1+ℓ))L₁ = ℓL₁`; `mazur1977` 1028–1056 | pass |
| Global Ext vanishing (§R07.G5) | `ℓ = 2` over `ℤ`, `ℤ[1/P]`; dévissage `M = μ_{ℓ²}` | `Ext¹` exact in the middle under dévissage; `mazur1977` 883–884 (2.1), 1306–1309 (5.1: order 2 iff `P ≡ ±1 mod 8`), Step 1 of 4.5 | pass |
| `dyadic-D-model`, amalgam (§§R07.G7–G8) | `ε = −1`; `M = μ₂`; rank-4 `M` | torsor `t² = −1`, trivial mod 2; `#Ext¹ = 4`, two cyclic classes; ranks `2·2`, `2·4`; `mazur1977` 1215–1250, 3965–3982 | pass |
| `deJongCrystalTubeRealization` (§R07.2.27) | recurrence; `σ(V_{n+1}) ⊆ V_n`; `x^[n]` | `αF₂V₂ = pα = F₁σ*(α)V₂`; `p/(n+1) ≥ 1/n`; `v_p(n!) < n`; `dejong1995` 1737–1771, 1811; printed pp.54–57 | pass |
| `deJongFormalLiftingLocus` | pages | `dejong1995` 3022 (7.5.1, p.91) to 3141 (end of proof, p.95); 1865–2192 (pp.58–67); `dejong1998` p.175 | pass |
| `tameConnectedEtaleRankOne` (§R07.3.19) | `μ_{p^∞} × ℚ_p/ℤ_p`; `p = 2`; `y² = x³+1`, `p = 5`; `E(χω̃⁻¹) ⊕ E(ω̃)` | ranks `(1,1)`; `e = 1 = p−1`; level-two characters of order `24/4 = 6` on `I_L`; quotient reduces to `ω`; `cdt1999` 415–433 | pass |
| Crystalline comparison (§R07.4.19) | `ℚ_p/ℤ_p`, `μ_{p^∞}` | `D_cris(ℚ_p)`: `σ`, jump `0`; `D_cris(ℚ_p(−1)) = K₀t`: `pσ`, jump `1` = `D(μ)(W)` | pass; source not readable |
| Integral Tate-module pairing (§R07.4.19) | `ℚ_p/ℤ_p`, `μ_{p^∞}`, `p = 2` | `A_cris^{φ=1} = ℤ_p`; `(Fil¹A_cris)^{φ=p} ∋ t`; `t/2 ∈ A_cris` at `p = 2`: cokernel `ℤ/2` | pass; source not readable |
| `cyclotomicWindowBaseChange` (§R07.4.26) | `r → r+1`; unit and dual | `φ(u₀) = φ(E)u₀`, `φ(τ) = pτ`, so `φ(u₀/τ) = c·u₀/τ`; `caislau2017` 714–726, 744–790 (3.1.4–3.1.8) | pass |
| `cyclotomicCrystalWindowEquivalence` | `ℚ_p/ℤ_p`, `μ_{p^∞}` | `Φe = e`, `Φe = pe`; `caislau2017` 470, 534, 553, 607, 641, 679, 690 | pass |
| `cyclotomicStrictActionConnection` | `d = 1`, `t₁e`; `du` | `N(1+u) = (1+u)log(1+u)`, `τ = p^r log(1+u)`, so `p^rN = (1+u)τ d/du`; `dφ(du) = p(1+u)^{p−1}du`; `caislau2017` 890–936 | pass |
| `cyclotomicWindowDescent` | `K = F_r`; `K = F`; `ℚ_p/ℤ_p` twisted by `[a]` | descended module `ℤ_p(ω̃^i)`: weight `0`, ramified, no model; `caislau2017` 949–999 (3.4.1–3.4.7) | pass |
| `wachBreuilKisinComparison` | `μ_{p^∞}`, `r = 1` | `φ(ue) = (φ(u)/u)ue`, `γ(ue) = (γ(u)/χ(γ)u)ue ≡ ue mod u`; `caislau2017` 58, 1311–1340 | pass |
| `breuilSyntomicPeriods` (§R07.4.31) | `N(u)`, `Nφ`; `n = 1` | `N([π̃](1+X)⁻¹) = −u`; `Nφ(X) = p(1+X)^p = pφN(X)`; `φ(J₁) = 0`, `φ₁(E) = c`; `savitt2005` 548–600 | pass |
| `Mod^{k−1}_tor`, `BreuilModuleModP` (§§R07.4.31, R07.4.34) | `S₁e` with `φ₁(γ_p(E)e) = e`, `p > 2` | stated axioms hold; Breuil's axiom gives `φ₁(γ_p(E)e) = c^p p^{p−2}/(p−1)!·e ≡ 0`; `T₀` undefined | R01 |
| `multiplicativeTateParameter`, finite-flat criterion (§R07.5.4) | `q = π^pu`, `π`; `ℚ₂`: `q = −4`, `2`, `5` | four (sub, quotient) cases at `p = 2`: unit class, unramified, unramified, split; `v(q) = 1` excluded; `serre1972` 707–745, pp.276–277 | pass |
| `BarsottiTate.markedUniversalDeformation` (§R07.6.9) | `d = 0`, `d = h`, `μ × ℚ_p/ℤ_p` | `d(h−d)`: `0`, `0`, `1`; tangent `d·(h−d)`; `illusie1985` 797 (p.171), 1105 (p.178), 1181 (p.180); `raynaud1974` 1137–1176 | pass |
| `crystalline01IsBt` (§R07.4.20) | `K = W(F̄_p)[1/p]` | inputs at `:5517`, `:6327`, `:6503` allow perfect `k`; statement `:6389` finite `K/ℚ_p` | R02 |
| `prolongation_unique_of_lt`, `genericFibre_map_bijective` | `p = 2`; `ℤ_p[ζ_p]`; `α_i` nonunit | `e ≥ 1 = p−1`: empty; `v(δ_i′) ≥ (p−1)v(α_i) > e`; `raynaud1974` 971–996 (3.3.3, 3.3.6) | pass |
| `globalPrimeOrderClassification` | `p = 2`; `ℤ[1/2]`, `p = 3` | `(a,b)`, `ab = 2`, up to `±1`: `(1,2)`, `(2,1)`; eight groups over `ℤ[1/2]`, two over `ℤ` | pass |
| `dieudonneEquivalenceFinite` | `ℤ/p`, `μ_p`, `α_p`, `0` | lengths `1,1,1,0`; `F = σ, 0, 0`; étale iff `F` bijective only for `ℤ/p` | pass |
| `flFiniteFlatDictionary` | `μ_p`, `ℤ/p`; `p = 3`; `i ∉ {0,1}` | `[0,1] = [0,p−2]` at `p = 3`; `φ^i` for `i < 0`, `i ≥ 2` forced by `phi_succ`; lengths `1,1` | pass |
| `finiteFlatClassification` | `𝔖/p`; `E = u − p`; `E = 1` | `u` injective iff no `(p,u)` associated prime iff projective dimension `≤ 1`; `𝔐/u𝔐 = k`, length `1`; `E = 1` fails `hdegree` | pass |
| `fontaineRamificationBound` | `μ_p`, `μ₄/ℤ₂`; trivial `G`; subfield `L` | `(p−2)/(p−1) < p/(p−1)`; `1 < 3`; `0 < e(n+1/(p−1))`; `𝒟_{L/K} ∣ 𝒟_{M/K}` | pass |
| `krasnerEmbeddingCriterion`, `cyclotomicImageStability` | `ℚ₃(ζ₉)/ℚ₃` | `e = 6`, `i = 1/2`, `φ(1/2) = 2`, `d = 3`, `eψ(11/6) = 8/3`; `v₃(𝒟) = 3/2`, bound `< 3/2` | pass |
| `flatTangent_finrank_le` (§R07.6.7) | `k(1) ⊕ k`; `k²`; Schur type `(0,1)` | `h⁰ + d(n−d)`: `2+1 = 3` (four Ext groups: `1+1+1+0`); `4+0`; `1+1` | pass |
| Covariant crystalline evaluation (§R07.2.20) | `ℚ_p/ℤ_p`, `μ_{p^∞}` over `F_p` | `(F,V) = (p,1)`, `φ_G = 1`; `(1,p)`, `φ_G = p⁻¹`; agrees with `M_cov = M(G^D)` | pass |

- Gate at this head: every scanner `0`, `build=0`, `OK`. Dependency check: `depcheck: 247 roadmaps, 2247 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: seven `declaration uses sorry` warnings (lines 94, 103, 113, 170, 257, 318, 347), nothing else. One-tactic probe on a scratch copy (`first | rfl | trivial | simp | infer_instance | decide | exact ⟨_, rfl⟩ | constructor <;> simp | aesop`): `0` of `7` close. `#check @name` for the 27 declarations compared with the README; the one lead (`BreuilKisin.frob` without `[CharP k p] [PerfectRing k p]`) is no defect: `WittVector.frobenius` needs neither.
- Source locators checked against the text: 11 sources, about 85 locators: `mazur1977` (655–880, 883–983, 1028–1056, 1202–1309, 3955–3982), `dejong1995`, `dejong1998`, `caislau2017` (58, 447–690, 714–999, 1311–1340), `savitt2005` (531–532, 548–640, 694–760), `illusie1985`, `raynaud1974`, `cdt1999`, `liu2013` (69, 245), `serre1972` (643, 707–745), `sharifi` (3591–3748), `breuil2000` (213, 349).
- Library declarations opened at the pins: 14 of Tau Ceti (among them `CartierDuality/FiniteLocallyFree.lean:122, 298`, `BaseChange.lean:88`, `Rank.lean:56`, `Constant.lean:54, 94`, `Tame/Character.lean:401`, `HopfIdeal/ScalarTorsion.lean:45`, `Syntomic/StandardSyntomic.lean:38`, `DyadicSqrt/Two.lean:166`) and 7 of Mathlib (`Isocrystal.lean:179`, `FrobeniusFractionField.lean:243`, `Frobenius.lean:275`, `FontaineTheta.lean:166`, `Galois/Equivalence.lean:40`); all present. No pinned file defines Dieudonné, Fontaine–Laffaille or Kisin modules.
- Cross-roadmap citations resolved at section and name level: 10 open suppliers at their heads (AbelianSchemesAndArithmeticModuli, PadicLocalLanglandsForGL2Qp, PadicPeriodRings, NoncommutativeAndEquivariantIwasawa, CyclotomicClassGroupsAndStickelberger, ArithmeticGaloisRepresentations, ArithmeticGaloisDuality, CrystallineCohomology, DerivedDeRhamCohomology, SmoothRepresentationsOfLocalGroups) and 13 roadmaps on main; none unresolved. No open roadmap declares a name of this `Suggested.lean`. Changes outside the folder: none.
- Overlap check: read PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings, EllipticCurveModularityWild3Adic, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (open), ModularCurves, RamificationOfCompleteDiscretelyValuedFields, SchemeAndStackFoundations (main); filtered `(φ, N)`-modules, weak admissibility and the semistable equivalence: PadicLocalLanglandsForGL2Qp §0.2 (cited; §R07.4.13 states the agreement); perfect-residue ramification: RamificationOfCompleteDiscretelyValuedFields (cited); coefficient Fontaine–Laffaille category and deformation rings: LocalGaloisDeformationRings §1.6, §4.1 (cited as consumer); Breuil modules, Fontaine–Laffaille and Kisin modules, §§R07.P7.1–R07.P7.5: this roadmap, cited as this roadmap's by the others.
- Source independence: 24 passages compared with 11 sources, none shared; largest share `savitt2005`, 90 of about 750 source mentions (`kisin2006` 74, `fontaine-laffaille1982` 72); contents compared with `savitt2005` (§§2.2, 3.1, 3.2–3.3, 3.4–3.5, 4, 5 against §§R07.4.27–R07.4.35: same order, forced by the *Needs* chain 4.28←4.27, 4.29←4.28, 4.31←4.30, 4.32←4.31, 4.33←4.32, 4.34←4.33, 4.35←4.34; nine sections against six, with §2.2 split in three and §§3.2–3.5 merged in two): independent. The contents of `kisin2006` could not be read.

## Not verifiable

- Kisin 2006, 2008, 2009, 2009b: the author's page serves `.dvi` files the sources service does not read, and the published versions are paywalled; Lemma (2.2.4), Corollary (2.2.6), Theorem (2.3.5) behind §§R07.4.19–R07.4.22 are cited by locator only.
- Faltings 1999, Theorem 7 (publisher landing page only): the cokernel statement of the *Integral Tate-module pairing* rests on it; the two rank-one cases recompute.
- Serre 1987 (Duke, no open text) and Silverman, *Advanced Topics*, V.5.3: the multiplicative criterion and the Tate parameter of §R07.5.4 are checked by computation, not against these texts.
- Breuil 1999b, Bloch–Kato 1990, Tate 1967, Demazure 1972, Berthelot–Breen–Messing 1982: no open text; cited by locator only.
- Sources outside the seeded sample (Fontaine–Laffaille 1982, Fontaine 1985, Stix 2012, Pink 2005, Scholze–Weinstein 2013 and others) were not reread against their locators in this round.

## Source issues

- **Error** in dejong1995 at Lemma 7.1.13.1, p. 79: the source asserts a generation statement used to build the maps `β_n`; it should construct `β_n` from the Artin–Rees lemma instead; affects the proof; corrected in print at de Jong 1998, p. 175.
- **Misprint** in savitt2005 at Definition 3.1, p. 12: the source says the descent maps are indexed by the Galois group of `F′` over `F`; it should be the Galois group of `F` over `F′`, since `F′ ⊆ F`; affects nothing.

## For the human reviewers

- **Licence.** Stix 2012, Pink 2005, Sharifi's *Iwasawa Theory* and Brinon–Conrad 2009 are unpublished lecture notes read from their authors' pages (`README.md:9116`, `:9089`, `:9134`, `:9027`); Yu 2026 is an arXiv preprint (`:9124`).
- **Licence.** `README.md:3749` links an author-page PDF (Panny–Robert–Sferlazza, Appendix B) as the statement of Berthelot–Breen–Messing 4.2.14; it has no entry under `## References`.
- **Licence.** `README.md:2900–2901` links two external Lean repositories (SKW, KummerCriterion) as related formalizations; no declaration of `Suggested.lean` shares a name or statement with them.
- **Not tested.** `kisin2006`, the second largest source by mentions (74), could not be read: wording and arrangement of §§R07.4.6–R07.4.22 were not compared with it.
