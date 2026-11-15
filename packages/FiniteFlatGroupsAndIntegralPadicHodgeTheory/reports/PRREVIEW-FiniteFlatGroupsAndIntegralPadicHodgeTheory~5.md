# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 74989e9)

**Verdict:** needs changes

## R01 (P2) — Perfect-residue ramification theory is attributed to two roadmaps that only consume it; its owner on main is never cited

**Location:** `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md:182–184`: “Its §0.3 owns ramification theory over complete discretely valued fields with arbitrary perfect residue field, the absolute upper filtration and the completed maximal unramified comparison”; also `:123–130`, `:398`, `:471–484`, `:8357`, `:8377`, `:8513`, `:8895`.

**Claim:** PadicPeriodRings §0.3 owns this theory, PadicPeriodRings §2 owns Hasse–Arf in characteristic `0`, and ArithmeticGaloisRepresentations §3.0 owns the equal-characteristic case, wild inertia and the transition functions.

**Witness:** PadicPeriodRings at its open head, §0.3: “This roadmap consumes, and does not construct, the perfect-residue Herbrand contract of RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3 and 4a.1–4a.3”; ArithmeticGaloisRepresentations §3.0: “this section plans none of them”. `grep -c RamificationOfCompleteDiscretelyValuedFields README.md` = `0`.

**Repair:** cite the owner, which is on main. At `:123–130`: “The extension to complete discretely valued fields with arbitrary perfect residue field, in equal and mixed characteristic, is RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3 (lower numbering, the different, Herbrand functions, upper numbering, Hasse–Arf) and §§4a.1–4a.3 (the absolute upper filtration of `G_K`, wild inertia, the finite-separable transition functions, the completed maximal unramified comparison), which agrees with the supplied objects on their common domain. This roadmap plans none of these; Layer R07.6 consumes them.” At `:182–184` delete the sentence. Move the paragraph `:471–484` (“Section 0.3 supplies, for every field `K` … Sections R07.6.2 and R07.6.5 consume exactly these.”) to a new contract bullet “**RamificationOfCompleteDiscretelyValuedFields.** §§3a.1–3a.3 and 4a.1–4a.3 supply, for every field `K` …”. Replace “PadicPeriodRings §0.3” by “RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.2 and 4a.1–4a.3” at `:398`, `:8357`, `:8377`, `:8513`, `:8895`.

## R02 (P3) — Five supplier names that the suppliers' heads do not have

**Location:** `README.md:426–428`: “the subspace `peuRamifieH1` … the predicates `IsPeuRamifiee` … and `IsTresRamifiee`, and `RamificationSupport.peuRamifie_restricted`”; repeated at `:7678–7727` and `:8107–8150`. `README.md:1720`: “PadicPeriodRings §2 (`tateSen`, `PadicFieldCompletion`)”.

**Claim:** these are declarations of PadicLocalLanglandsForGL2Qp §0.3 and of PadicPeriodRings §2.

**Witness:** `roadmaps grep 'peuRamifieH1|IsPeuRamifiee|IsTresRamifiee|peuRamifie_restricted'`: hits in this README only. PadicLocalLanglandsForGL2Qp §0.3 at its head names them in prose: “the unit-Kummer subspace”, “the peu-ramifiée predicate”, “the très-ramifiée predicate”, “the restricted peu-ramifiée comparison”. PadicPeriodRings has `tateSen_H0`, `tateSen_H1`, no `tateSen`.

**Repair:** at `:426–429`: “Over `ℚ_p`, the unit-Kummer subspace of extensions of 1 by `ω` (the total unit-Kummer condition, containing the split class), the peu-ramifiée predicate (nontrivial wild inertia and membership), the très-ramifiée predicate, and the restricted peu-ramifiée comparison (membership is equivalent to trivial wild inertia or the peu-ramifiée predicate)”. Use the same four phrases at `:7678–7727` and `:8107–8150` (for instance `:7694` “§0.3's membership of `c` in the unit-Kummer subspace”). At `:1720`: “PadicPeriodRings §2 (`tateSen_H0`, `tateSen_H1`, PadicFieldCompletion)”.

## R03 (P3) — Twelve API bullets still carry backticked names that `Suggested.lean` does not declare (previous R04, partly repaired)

**Location:** `README.md:1389–1396` (“- `aCris` — The `O_{ℂ_p}` carrier of PadicPeriodRings §3.” and five more) and `:1504–1509` (“- `dCris` — …”, “- `IsCrystalline` — …” and four more).

**Claim:** house style: an API bullet carries a backticked Lean name only when `Suggested.lean` declares it; the pull request description says “the only Lean names they carry are those `Suggested.lean` declares”.

**Witness:** `grep -c '^- `[A-Za-z_.]*` — '` = `12` (it was `18` at `9856719`); none of `aCris`, `aCris_model_equiv`, `bCris`, `bCris_toBDR`, `bCris_frobenius`, `bCris_generatorIndependent`, `dCris`, `dDeRham`, `IsCrystalline`, `IsDeRham`, `crystalline_iff_dim`, `crystalline_isDeRham` is among the 27 declarations. The 8 bullets of the form “- `name`: ” are all declared.

**Repair:** drop the labels and keep the prose, for instance “- The `O_{ℂ_p}` carrier `A_cris` of PadicPeriodRings §3.”, “- The supplied localization `B_cris`, obtained by inverting `p` and `t` (§4.1).”, “- Crystalline implies de Rham, through the canonical embedding `K ⊗_{K₀} B_cris → B_dR`.” The description's sentence is then true as written.

## R04 (P3) — Five declarations of `Suggested.lean` are not named in the README

**Location:** `Suggested.lean:61` `rank`, `:71` `genericFibre`, `:223` `FLModule.IsTorsionIn`, `:252` `FLTorsion`, `:302` `TorsionKisinModule.Hom`.

**Claim:** README and Lean agree: every Lean name appears in the README.

**Witness:** `grep -c` in `README.md`: `IsTorsionIn` `0`, `FLTorsion` `0`, `TorsionKisinModule.Hom` `0`; `genericFibre` occurs only inside `genericFibre_map_bijective` and `BarsottiTate.extend_genericFibre`; `rank` never in backticks as a name.

**Repair:** add to the API list of §R07.1.24: “- `rank`: the order of `G : FLF R`, the `Module.finrank` of `coord G`, used over local bases and over `ℤ`. `genericFibre`: the base change of a model to `K` by Tau Ceti's `baseChangeFunctor`.” To §R07.3.4: “- `FLModule.IsTorsionIn`: `M ∈ MF_tor^{[a,b]}`, that is `FLModule.IsTorsion` with `Fil^a = M` and `Fil^{b+1} = 0`; `FLTorsion` is the full subcategory `MF_tor^{[0,1]}`.” To §R07.4.2: “- `TorsionKisinModule.Hom`: `𝔖`-linear maps commuting with `φ`.”

## R05 (P3) — Six section headings are named by a source's theorem numbers

**Location:** `README.md:2469` “### R07.1.35 Group schemes of order `p` over rings of integers: Oort–Tate Theorem 3”; `:5019` “R07.3.9 Theorem 5.3: …”; `:5046` “R07.3.10 Theorem 3.3: …”; `:5069` “R07.3.11 Theorem 6.1: …”; `:5179` “R07.3.14 The lattice functor: Propositions 7.14–7.15”; `:5240` “R07.3.16 Theorem 8.4: …”.

**Claim:** each section is named by its mathematics; a source's numbering is a locator, not a title.

**Witness:** §§R07.3.4–R07.3.18 run in the order of Fontaine–Laffaille §§1–9 (`fontaine-laffaille1982` lines 35–43); the dependency lines force that order, but five of the fifteen headings carry that paper's theorem numbers.

**Repair:** keep the numbers `R07.x.y` and retitle: “R07.1.35 Group schemes of order `p` over rings of integers: characters and local exponents”; “R07.3.9 Tame inertia on the simple objects, and the weight dictionary”; “R07.3.10 `U_S` is exact, faithful and length-preserving”; “R07.3.11 Full faithfulness away from the endpoint collision”; “R07.3.14 The lattice functor”; “R07.3.16 Weakly admissible modules of filtration length `< p` are admissible”. At `:8016` write “given by §R07.3.9” for “given by Theorem 5.3 (§R07.3.9)”.

## R06 (P3) — The summary table lists a layer `R07.P` that the README does not have

**Location:** `README.md:43`: “| R07.P | Finite-`K` periods and labelled Sen theory | `aCris`, `bCris`, `dCris`, …”.

**Claim:** the table's rows are the roadmap's layers.

**Witness:** `grep -n '^## Layer'`: seven headings (`R07.1`, `R07.G`, `R07.2`–`R07.6`), no `## Layer R07.P`; §§R07.P2–R07.P7.5 are `README.md:1367–1694`, inside Layer R07.1, between §R07.1.17 and §R07.1.19, with no `### Examples` or `### Dependencies` of their own.

**Repair:** delete the row and begin the `R07.1` row's title cell with “Finite flat group schemes and `p`-divisible groups, with the finite-`K` period and labelled Sen interfaces §§R07.P2–R07.P7.5”.

## R07 (P3) — Page range of de Jong's Proposition 7.5.2

**Location:** `README.md:4249`: “Source: de Jong 1995, Proposition 7.5.2, pp.91–94”.

**Claim:** the proposition and its proof are on pp.91–94.

**Witness:** `dejong1995` line 3044 (statement, printed p.92); line 3141 “The proof of 7.5.2 is complete”, under the running head of printed p.95 (line 3130).

**Repair:** “Proposition 7.5.2, pp.91–95”.

## Previous findings

- R01, R02 — repaired: `Suggested.lean:257–261` and `:318–329` state the functor with `Mfun.IsEquivalence` and the length law; the gate's `statement-hygiene` is `0`.
- R03 — repaired: `README.md:2871–2875` “its carrier `cyclotomicClassEigenspace` (§0.2), `bernoulli_annihilates_component`, Herbrand's implication and the exponent-one vanishing theorem (all §3.2), `inverseCharacterClassGroup_all_levels` at `r = 1` (§8.1)”; these resolve at the supplier's head (its lines 148, 566–570, 1233, 1257).
- R04 — partly repaired: `:638` “- The Frobenius `F_G : G ⟶ G^{(p)}` is a homomorphism of group schemes.”; `:318–321` no longer lists `SerreWeights`; twelve bullets remain (R03 above).
- R05–R08 — repaired: the description now says “It has seven layers”, lists the R07.G bullet and the suppliers of `README.md:84–86`, `:138`, `:209`, states “seven headline theorems with `sorry`” and “the `BarsottiTate` carrier of AbelianSchemesAndArithmeticModuli”.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Special-fibre types and the ordinary counting identity (§R07.1.3) | `G = μ_{p^n} × ℤ/p^m`; supersingular `E[p]`; `p = 2` | `[M:W] = p^m = #G_k(k̄)`; `E[p]`: `1` special point, `p²` generic, hypothesis fails; `e < p−1` empty at `p = 2` | pass |
| `admissible-global-models` (§R07.G1) | constant `ℤ/ℓ`; `H = 0`; nontrivial `I_P` | `H = G(ℚ̄)^{I_P}` finite iff `I_P` trivial; minimal model `δ = 1`; Mazur (b), Prop. 1.3 agree | pass |
| `admissible-cohomology-bound` (§R07.G3) | four elementary groups, `ℓ = 2`, `P ≡ 1, 3 mod 4` | `(δ,α,h⁰,h¹)`: `(0,1,1,0)`, `(0,0,1,1)`, `(1,1,0,0)`, `(1,0,0,1 or 0)`; `h¹−h⁰ ≤ δ−α` holds: `−1≤−1`, `0≤0`, `0≤0`, `1≤1` or `0≤1` | pass |
| `admissible-rank-one-global` (§R07.G4) | `k = 𝔽_ℓ`, `𝔽_{ℓ²}`; `ℓ = 2`, `k = 𝔽_4` | Raynaud digits `n₁+2n₂ ≡ 0 mod 3` only for `(0,0)`, `(1,1)`: étale or multiplicative; ranks `ℓ²`, points `ℓ²` and `1` | pass |
| `admissible-cyclotomic-class-obstruction` (§R07.G5) | `ℓ = 5`, `j = 1, 3`; `ℓ = 3` | `ω⁻¹(2) = 3 mod 5`; `B₂ = 1/6` unit for `ℓ ≥ 5`; `−1 ≡ 1 mod 2` at `ℓ = 3`; supplier §§0.2, 3.2, 8.1–8.2 resolve | pass |
| Global Ext vanishing (§R07.G5) | `ℓ = 2` over `ℤ`, `ℤ_2`, `ℤ[1/P]` | over `ℤ_2` étale sub and connected quotient split; class is a quadratic character split at `2`: `±P ≡ 1 mod 8` | pass |
| `dyadic-D-model` (§R07.G7) | `Ext¹_ℤ(ℤ/2, μ₂)`; models over `ℤ_2` | order `4 = #μ₂(ℤ) · #ℤˣ/ℤˣ²`; killed-by-2 classes `≅ H¹(ℤ, μ₂)`, order `2`; torsor `t² = −1`; local model class in `ℤ_2ˣ/ℤ_2ˣ² ↪ ℚ_2ˣ/ℚ_2ˣ²` | pass |
| `dyadic-finite-flat-amalgam` (§R07.G8) | `M = μ₂`; rank-4 `M` | ranks `2·2 = 4`, `2·4 = 8`; `G⁰ = M`, `G^ét = ℤ/2` | pass |
| Covariant crystalline evaluation (§R07.2.20) | `ℚ_p/ℤ_p`, `μ_{p^∞}` over `𝔽_p` | `(F,V) = (p,1)`, `φ_G = 1`, fixed line `ℚ_p`; `(F,V) = (1,p)`, `φ_G = p⁻¹`, fixed `0 = G̃(𝔽_p)` | pass |
| `deJongCrystalTubeRealization` (§R07.2.27) | recurrence, `B_n`, `σ(V_{n+1}) ⊆ V_n` | de Jong (5.3.3)–(5.3.7): `i^{[n]} ↦ i^n/n!`, `φ_{n+1} = p⁻¹ F σ*(φ_n) V` | pass |
| `deJongFormalLiftingLocus` (§R07.2.27) | `T = ∅`, `T = 𝔜_red`; erratum | Prop. 7.5.2 as stated; `β_n : B_n → A/I^{n−c}` from the 1998 erratum; pages `92–95` | R07 |
| Modules of constant fibre length (§R07.2.29) | `A = k`; `M = W(V)/p`; `M = 0` | fibre length `1` at every prime, global length infinite; Berthelot 3.1.2–3.1.4, 3.4.1–3.4.3 as stated; `α_p`, `x ↦ ax`: `a` on `M_B`, `a^p` on `σ^*M_B` | pass |
| `tameConnectedEtaleRankOne` (§R07.3.19) | `μ_{p^∞} × ℚ_p/ℤ_p`; `y² = x³+1`, `p = 5`; `E(χω̃⁻¹) ⊕ E(ω̃)` | ranks `(1,1)`; niveau-two characters of order `24/4 = 6` on `I_L`; étale quotient reduces to `ω`, not `1`; étale: `det = 1`; multiplicative: `det = χ²` | pass |
| Integral Tate-module pairing (§R07.4.19) | `ℚ_p/ℤ_p`, `μ_{p^∞}`, `p = 2` | `A_cris^{φ=1} = ℤ_p`; `(Fil¹A_cris)^{φ=p} ∋ t`, and `t/2` at `p = 2`: cokernel killed by `2` | pass; source not readable |
| `breuilSyntomicPeriods`, `StronglyDivisibleModule` (§R07.4.31) | `N(u)` in `Â_st`; `Fil¹M = Fil¹S·e + pM` | `N([π̃](1+X)⁻¹) = −u`; `Fil¹M ∩ pM = pM ≠ p Fil¹M`; Savitt §3.2, Hyp. 3.5, Def. 3.7–3.8, Prop. 5.1 as stated | pass |
| `multiplicativeTateParameter`, finite-flat criterion (§R07.5.4) | `q = π^p u`, `q = π`; `ℚ_2`: `q = −4`, `q = 2` | `v(q) = −v(j)`; `−4 ≡ −1` unit class, flat; `2`: `v = 1`, no model; every model over `ℤ_2` has unit class | pass |
| `BarsottiTate.markedUniversalDeformation`, `raynaudDetTateModule` (§R07.6.9) | `d = 0`, `d = h`, `μ × ℚ_p/ℤ_p` | `d(h−d)` parameters: `0`, `0`, `1`; `det = χ`, `1`; Illusie 4.4, 4.7, 4.8 and Raynaud 4.2.1–4.2.3 at the cited pages | pass |
| `prolongation_unique_of_lt`, `genericFibre_map_bijective` | `p = 2`; `ℤ_p[ζ_p]`; trivial `G`; non-henselian `R` | `e ≥ 1 = p−1`: hypothesis empty; `e = p−1` excluded (`μ_p`, `ℤ/p`); Raynaud 3.3.3, 3.3.6 assume only unequal characteristic | pass |
| `globalPrimeOrderClassification` | `p = 2` | `(a,b)` with `ab = 2` up to `u = ±1`: `(1,2)`, `(2,1)`: `ℤ/2`, `μ₂` | pass |
| `dieudonneEquivalenceFinite` | `ℤ/p`, `μ_p`, `α_p`, `0` | lengths `1,1,1,0`; `F = σ, 0, 0`: étale only for `ℤ/p` | pass |
| `flFiniteFlatDictionary` | `μ_p`, `ℤ/p`, `0`; `p = 2` excluded | lengths `1,1,0`; `Fil^i`, `φ^i` for `i ∉ {0,1}` determined by `phi_succ` and antitonicity | pass |
| `finiteFlatClassification` | `μ_p`, `ℤ/p`, `ℤ/p²`; `E = 1`; `E = u + p` | `𝔐/u𝔐` lengths `1,1,2`; `E = 1` passes `IsEisensteinAt`, excluded by `hdegree`; `u` injective iff projective dimension `≤ 1` | pass |
| `fontaineRamificationBound` | `μ_p/ℤ_p`; `μ₄/ℤ_2`; trivial `G`; `L` generated by `L`-points only | `(p−2)/(p−1) < 1 + 1/(p−1)`; `1 < 3`; `0 < e(1 + 1/(p−1))`; subfield of the splitting field: different divides | pass |
| `cyclotomicImageStability` (§R07.6.10) | `p = 3` | `v(𝔇_{ℚ_p(ζ_{p²})}) = 2 − 1/(p−1) = 3/2`, bound `1 + 1/(p−1) = 3/2`, strict: excluded | pass |
| Ramification suppliers (§R07.6.2, §R07.6.5) | PadicPeriodRings §0.3, ArithmeticGaloisRepresentations §3.0 at their heads | both “consume” RamificationOfCompleteDiscretelyValuedFields §§3a.1–3a.3, 4a.1–4a.3 | R01 |
| Peu and très ramifiée (§R07.5.5, §R07.5.13) | `ℚ₂(√5)`, split class | supplier: unit class of `5` in the unit-Kummer subspace, trivial wild inertia; same values here; names differ | R02 |

- Gate at this head: every scanner `0`, `build=0`, `OK`. Dependency check: `depcheck: 245 roadmaps, 2221 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration: `lake env lean` on `Suggested.lean`: seven `declaration uses sorry` warnings (lines 94, 103, 113, 170, 257, 318, 347), nothing else. One-tactic probe on a scratch copy (`first | rfl | trivial | simp | infer_instance | decide | exact ⟨_, rfl⟩`): `0` of `7` close. The 27 elaborated types of `signatures.md` were compared with the README; the one lead (`BreuilKisin.frob` without `[CharP k p] [PerfectRing k p]`) is no defect.
- Source locators checked against the text: 16 sources, 67 locators: `mazur1977` (lines 653–878, 1202–1260, 3965–3982), `stix2012` (2045, 2098, 2184, 2197, 2549), `dejong1995` (74–87, 1705–1776, 1811, 1865, 2427, 2988, 3044–3141), `dejong1998` (25–43), `berthelot1980` (846–866, 1017–1022, 1054, 1072), `scholze-weinstein` (80–90, 1118–1131, 1261), `caraiani-scholze` (2341), `savitt2005` (548–655, 732–761, 1202), `breuil2000` (543, 2327), `cdt1999` (412–432), `serre1972` (643, 707), `illusie1985` (797, 1105, 1181), `raynaud1974` (971, 993, 1137–1160), `liu2013` (69, 245), `sharifi-iwasawa` (3591–3748), `fontaine-laffaille1982` (35–43).
- Library declarations opened at the pins: 20 of Tau Ceti (among them `CartierDuality/Rank.lean:56` `finrank_cartierDual`, `CartierDuality/Constant.lean:54, 94, 133`, `Tame/Character.lean:401, 521`, `WorkedExamples/DyadicSqrt/Two.lean:40`) and 25 of Mathlib; all present.
- Cross-roadmap citations resolved: 9 open suppliers at their heads and 15 roadmaps on main; unresolved: R01, R02. Changes outside the folder: none.
- Overlap check: read PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings (open), ModularCurves, RamificationOfCompleteDiscretelyValuedFields, SchemeAndStackFoundations (main); filtered `(φ, N)`-modules and the unit-Kummer predicates: PadicLocalLanglandsForGL2Qp §§0.2–0.3 (cited); perfect-residue ramification: RamificationOfCompleteDiscretelyValuedFields (R01); `tameConnectedEtaleRankOne`, `admissibleConnectedEtaleFiltration`, §§R07.P7.1–R07.P7.5: this roadmap, cited as this roadmap's by PadicHodgeTheory, SmallRamificationAndAbelianVarietyBaseCases §3.3 and ArithmeticGaloisRepresentations.
- Source independence: 17 passages compared with 14 sources, none shared; largest share `fontaine-laffaille1982`, about 110 of 1,030 source mentions; contents compared with `fontaine-laffaille1982` (§§1–9 against §§R07.3.4–R07.3.18: same order, forced by the *Needs* lines of §§R07.3.7–R07.3.18; fifteen sections against nine; headings: R05) and with `raynaud1974` (§§1–4 against §§R07.1.20–R07.1.33 and R07.6.9: different order): independent.

## Not verifiable

- Kisin 2006, 2008, 2009, 2009b: paywalled, and the author's page serves `.dvi`; Lemma (2.2.4) and Theorem (2.3.5) behind §§R07.4.19 and R07.4.22 are cited by locator only.
- Faltings 1999, Theorem 7 (AMS landing page only): the cokernel statement of the *Integral Tate-module pairing* rests on it; the two rank-one cases recompute.
- Serre 1987 (Duke, no open text) and Silverman, *Advanced Topics*, V.5.3: the multiplicative criterion of §R07.5.4 is checked by computation, not against these texts.
- Caraiani–Scholze 2017: read as arXiv v1; the published pages 691, 695, 710–711 were not checked.
- Breuil 1999b, Bloch–Kato 1990, Tate 1967, Demazure 1972, Berthelot–Breen–Messing 1982: no open text; cited by locator only.

## Source issues

- **Error** in dejong1995 at Lemma 7.1.13.1, p. 79: the source asserts a generation statement used to build the maps `β_n`; it should construct `β_n` by the Artin–Rees lemma instead; affects the proof; corrected in print at de Jong 1998, p. 175.

## For the human reviewers

- **Licence.** Stix 2012, Pink 2005 and Sharifi's *Iwasawa Theory* are unpublished lecture notes read from their authors' pages (`README.md:9068`, `:9095`, `:9113`); Yu 2026 is an arXiv preprint (`:9103`).
- **Licence.** `README.md:2888–2893` links two external Lean repositories (SKW, KummerCriterion) as related formalizations; no declaration of `Suggested.lean` shares a name or statement with them.
