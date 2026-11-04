# Review of NeronModelsAndSemistableAbelianVarieties (pull request #852 at df080b7)

**Verdict:** needs changes

Incremental re-review of the 49 lines changed since 8986e52: the whole change is the new §1.9a (closures of generic subschemes in an abelian scheme over a Dedekind base, and good reduction of a closed subscheme or hypersurface of the generic fibre); `Suggested.lean` is byte-identical to the head the previous report read. The previous report's three findings are accounted for below; two of them are unrepaired and are written again. §1.9a is mathematically sound at the generality stated; its two defects are a layer-level locator and a Check count. No P1 or P2 finding.

## R01 (P3) — Conventions 11 still lists three of the five Lean statements

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:333–334 "`Suggested.lean` states the headline theorems `LocalExistence` (§1.7), `DedekindExistence` (§1.9) and `EquationGoodComparison` (§6.5)".

**Claim:** the list of what `Suggested.lean` states.

**Witness:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean:101 (`HasGoodModel`) and :111 (`GoodIsogeny`), announced by the `*Lean:*` notes at README lines 952 and 3055, are absent from the sentence. Carried from the previous report (its R01); the diff since then touches only §1.9a.

**Repair:** write "`LocalExistence` (§1.7), `HasGoodModel` (§1.8), `DedekindExistence` (§1.9), `GoodIsogeny` (§5.2) and `EquationGoodComparison` (§6.5)". Instance that must hold afterwards: every backticked name in the sentence is declared in `Suggested.lean` (five of five; three of five now).

## R02 (P3) — The 5.3i locator names one proposition for all four reduction cases

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:3573 "(Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.12, pp. 57–58)".

**Claim:** the good, split multiplicative, nonsplit multiplicative and additive cases of the comparison with Mathlib's local polynomial are supported by Proposition 2.12.

**Witness:** ddt line 2151 (p. 57): Proposition 2.12 assumes multiplicative reduction; the good case is Proposition 2.11 (ddt line 2132, p. 57) and the additive case Proposition 2.13 (ddt line 2177, p. 58). Carried from the previous report (its R03), unrepaired.

**Repair:** cite "Props. 2.11–2.13, pp. 57–58". The three values the target computes (`1 − X`, `1 + X`, `1`) are unchanged.

## R03 (P3) — §1.9a cites a whole layer of AlgebraicModuliForArithmeticGeometry for one clause

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1015 "the base-change clause is the scheme case of AlgebraicModuliForArithmeticGeometry §5" and the `*Needs:*` line at 1035 "AlgebraicModuliForArithmeticGeometry §5".

**Claim:** the clause "formation of the closure commutes with flat base change" is supplied by that roadmap's Layer 5.

**Witness:** at the open head of AlgebraicModuliForArithmeticGeometry, Layer 5 ("rigidification and finite correspondences") has four subsections; the clause is the target `ArithmeticModuli.DMSchematicClosure.stack` of §5.4 "Closures and normalization", whose API says the image after flat base change is the pullback of the image and that for a scheme morphism the construction is exactly `Scheme.Hom.image`. §§5.1–5.3 (inertia, levels, finite correspondences) supply nothing here.

**Repair:** cite "AlgebraicModuliForArithmeticGeometry §5.4" (both at the claim and in the `*Needs:*` line). Instance: the flat base change Spec Ô_{S,s} → S of the image of `Z ↪ A → 𝒜` is the image of `Z_{K̂} → 𝒜_Ô`, exactly the flat-base-change bullet of `DMSchematicClosure.stack`.

## R04 (P3) — §1.9a defines two notions with two Check bullets

**Location:** TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/README.md:1038–1047, the `**Checks.**` list of §1.9a.

**Claim:** the house shape asks at least three discriminating Checks per definition; §1.9a defines the closure of a generic closed subscheme and good reduction of `H` at `s` and over `S`, and gives one degenerate bullet (which tests only the closure) and one non-example (which tests only good reduction).

**Witness:** the two bullets at lines 1040–1047; neither definition reaches three, and no Check separates the closure from its most plausible wrong model, reduction of an unsaturated integral equation.

**Repair:** add, for example, these three Checks, each computed:

- (closure, wrong model) For `H = V(f) ⊆ A` and an integral equation `f = π^a g` on an affine open of `𝒜` with `π ∤ g`, reducing `f` modulo `π` cuts out the whole special fibre `𝒜_s` when `a ≥ 1` (dimension `dim A`), while the closure is `V(g)`, with special fibre `V(ḡ)` of dimension `dim A − 1`: the closure is the saturation `J ∩ R`, not the reduction of a chosen generator (`a = 1`: `(πg) ∩ fibre = 𝒜_s`; `(g) ∩ fibre = V(ḡ)`).
- (good reduction, positive) On the curve `y² + y = x³ − x` of conductor 37 with `P = (0, 0)`, the hypersurface `H = {P} ⊔ {−P} = {(0,0), (0,−1)}` has good reduction at every prime `p ≠ 37`: the two sections stay distinct in every fibre (the `y`-coordinates `0` and `−1` differ modulo every `p`), so the closure is two disjoint sections, étale over `ℤ[1/37]`.
- (good reduction, non-example instance of the existing bullet) On the same curve, `5P = (1/4, −5/8)` and `−5P = (1/4, −3/8)` both lie in the kernel of reduction at `2` (`v₂(x) = −2`), the curve has good reduction at `2`, and `5P` is not `2`-torsion (`2 · 5P = 10P ≠ O`, the point has infinite order); the closure of `{5P} ⊔ {−5P}` is finite flat of degree `2` over `ℤ_(2)` with special fibre supported at the origin of the fibre, hence non-reduced and not étale: bad reduction of `H` at `2`.

## Previous findings

- R01 — not repaired: README 333–334 still "`LocalExistence` (§1.7), `DedekindExistence` (§1.9) and `EquationGoodComparison` (§6.5)" while `Suggested.lean` declares five names; written again as R01.
- R02 — not repaired, settled: the backticked intended-API names (49 in the resolver's list, for example `DualGraph.cycleLattice` at README 658) remain; the last repair report answered this (its H07, standing R08) with the reason that the house shape on main carries exactly this form, verified today at PadicMeasuresIwasawaAlgebras README lines 40, 730 and 3224 on main ("specified here only") and by the gate's identifier check (`readme-ids-missing=0`). The reason holds, so it is not re-raised.
- R03 — not repaired: README 3573 still "(Darmon–Diamond–Taylor 2007, §2.2, Prop. 2.12, pp. 57–58)"; written again as R02.

## Verified sound

**Gate.** Worker's gate at df080b7: every check zero, `OK` (build of `TauCetiRoadmap.NeronModelsAndSemistableAbelianVarieties.Suggested` included). My rerun of the movable dependency check against the board's merge order and main:

```text
depcheck: 209 roadmaps, 1733 edges, 0 problem(s)
```

No UPWARD or CYCLE line. This roadmap is at position 47; the three suppliers §1.9a adds are earlier: AlgebraicModuliForArithmeticGeometry 32, AbelianSchemesAndArithmeticModuli 41, FiniteFlatGroupsAndIntegralPadicHodgeTheory 46. `git diff --stat origin/main...HEAD` outside the folder is empty.

**Build and signatures.** `lake env lean` on TauCetiRoadmap/NeronModelsAndSemistableAbelianVarieties/Suggested.lean at the pins: exactly four `declaration uses 'sorry'` warnings (lines 68, 83, 111, 123), exit 0. The file is byte-identical to the one at 8986e52 (`git diff 8986e52..HEAD` on it is empty), so the previous report's `#check @` audit of the five declarations (every section binder retained, each elaborated type equal to its README statement) and its one-tactic probe (all four theorems still `sorry`, none padding) stand; imports are `import Mathlib` plus three `TauCeti.*` modules that exist at the pin, no `set_option`, no `lemma`, no sorry'd data.

**Headline theorems.** Unchanged since the previous report: `LocalExistence`, `DedekindExistence`, `GoodIsogeny` and `EquationGoodComparison` stated, `HasGoodModel` a real-bodied definition; Grothendieck's criterion, Néron–Ogg–Shafarevich, the component-group cokernel identification and the Tate-system specialization named in the module docstring as not statable (no semistable predicate, inertia action, component group or Néron-model carrier at the pins). §1.9a adds no headline: good reduction of a subvariety is a definition with equivalent forms, and its carrier (the closure in an abelian scheme over a Dedekind base) needs `AbelianScheme S` from AbelianSchemesAndArithmeticModuli A0.1, which is not at the pins, so nothing new is statable.

**Library declarations opened at the pins (file:line).** Mathlib: `Scheme.Hom.image` AlgebraicGeometry/IdealSheaf/Subscheme.lean:659 (`abbrev`, the subscheme of `f.ker`) and `Scheme.Hom.imageι` :662 (its closed immersion into the target), as §1.9a says; `Scheme.Hom.smoothLocus` AlgebraicGeometry/Morphisms/Smooth.lean:300 (an `X.Opens` of the source, points whose stalk map is formally smooth, under `[LocallyOfFinitePresentation f]`, which the closure's structure morphism has as a finite-type morphism over the Noetherian base), `Scheme.Hom.isOpen_smoothLocus` :291, `class Smooth` :59; `class Flat` AlgebraicGeometry/Morphisms/Flat.lean:42. Tau Ceti: `Scheme.IdealSheafData.IsEffectiveCartier` AlgebraicGeometry/EffectiveCartierDivisor/Basic.lean:50 (locally the ideal of a nonzerodivisor, :56), in the file §1.9a names.

**Cross-roadmap citations of §1.9a resolved at the open heads (the service's index of 2026-11-04).** FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20 (its README line 1738, `schematicClosure_flat`: over a Dedekind domain the closure is cut out by the contraction of the generic ideal, torsion-free hence flat; the "same argument" §1.9a refers to). AlgebraicModuliForArithmeticGeometry Layer 5 (line 8630) and §5.4 (line 8893, `DMSchematicClosure.stack` with the flat-base-change bullet and the identification with `Scheme.Hom.image`): R03. AbelianSchemesAndArithmeticModuli A0.1 (line 589: `AbelianScheme S` bundles an `Over S` object, a `GrpObj`, `IsProper`, `Smooth`, `GeometricallyConnected`, with `baseChange`) and Layer A1 (lines 734–1041): the carrier §1.9a's `𝒜` lives on; the colon form `AbelianSchemesAndArithmeticModuli:A0.1–A1` is the one the README uses at lines 369, 845, 941, 981. The resolver lists no unresolved cross-roadmap citation; its 49 Lean names are the settled intended-API names (previous R02).

**Ownership by object.** Searched the open heads and main for the closure of a generic closed subscheme in an abelian scheme and for good reduction of a hypersurface, subvariety, divisor or subscheme: the only hit is §1.9a itself. The closures owned elsewhere are different objects (FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20: subgroups of finite flat group schemes; AlgebraicModuliForArithmeticGeometry §5.4: schematic images of DM stacks, consumed here for base change). No roadmap cites §1.9a yet. Ownership against pull requests outside the service index was not checked.

**Seeded sample.** The fifteen sampled targets (1.5, 1.6, 1.7, 2.1, 2.3, 2.7, 3.10, 4.6, 4.7, 5.1a, 6.1, 6.4a, 6.7, 6.9, 6.11) lie outside the 49 changed lines and nothing in §1.9a is cited by them or cites them (its `*Needs:*` line names 1.4, 1.8, 1.9 only); their verification in the previous report stands and their table rows are carried below. Of §1.9a's sources, Bosch–Lütkebohmert–Raynaud §2.5 is paywalled (below); the statements were checked by computation and through the two supplier roadmaps whose proofs restate the same argument.

**Adversarial table.** New rows for every statement of §1.9a; the remaining rows are carried from the previous report (marked "carried"), their statements untouched by the diff.

| Statement or convention | Instances tried | Computed values | Result / change |
|---|---|---|---|
| 1.9a closure is flat with generic fibre `Z`, unique flat model | affine open `Spec R ⊆ 𝒜`, `Z = V(J)`; `Z = A`; `Z = ∅` | `J ∩ R`; `R/(J ∩ R) ⊆ R_K/J` torsion free over the Dedekind base, flat; `(J ∩ R) ⊗ K = J`; `Z = A`: `J = 0`, closure `𝒜`; `Z = ∅`: `J = R_K`, `J ∩ R = R`, closure empty; uniqueness: a flat closed subscheme has torsion-free ring, so is the closure of its generic fibre | correct; Checks agree |
| 1.9a closure commutes with flat base change | `S' = Spec O_{S,s}`; `S' = Spec Ô_{S,s}` | `j : A → 𝒜` is quasi-compact (base change of `Spec K → S`, `S` Noetherian), image of a quasi-compact morphism commutes with flat base change; completion of a Noetherian local ring is flat | correct; locator R03 |
| 1.9a good reduction at `s`, equivalent forms | closure `Z̄` over `O_{S,s}`; special fibre smooth; completed base | fibre over `s` in `smoothLocus` ⇒ non-smooth locus is closed, misses the closed fibre, has closed image under the proper `Z̄ → Spec O_{S,s}` (closed in `𝒜`, proper), hence empty: `Z̄` smooth over `O_{S,s}` and `H` smooth over `K`; fibre smooth + flat + finite presentation ⇒ smooth at the fibre's points; `Ô` faithfully flat over `O`, smoothness descends, closure commutes (row above) | the three forms are equivalent; properness of `𝒜` is the input the "at `s` ⇒ over the local ring" direction uses, and it is in scope (abelian scheme) |
| 1.9a hypersurface with good reduction: relative Cartier divisor of relative dimension `dim A − 1` | `H = V(f)`, `f = π^a g`, `π ∤ g`, `R` regular local (`𝒜` smooth over a regular `S`); `dim A = 0` | `J ∩ R = (g)` (`π^k r ∈ gR ⇒ g ∣ r` in a UFD with `π ∤ g`), `g` a nonzerodivisor and `π` a nonzerodivisor on `R/(g)`: relative effective Cartier; fibres Cartier in `𝒜_s`; every component dominates `S` with generic fibre of pure dimension `dim A − 1`; `dim A = 0`: the only Cartier divisor of `Spec K` is empty, closure empty | correct |
| 1.9a flat and smooth closed subscheme is the closure of its generic fibre; independence of `S` | any `S`-flat closed `𝒳 ⊆ 𝒜`; two Dedekind bases with the same local ring at `s` | `O_𝒳` torsion free over `O_S`, so `𝒳_K` schematically dense; closure over `O_{S,s}` is the localisation of either closure, and the abelian scheme over `O_{S,s}` is the one of 1.4 and 1.8 | correct |
| 1.9a non-example Check | `y² + y = x³ − x` (conductor 37), `P = (0,0)`: `2P = (1,0)`, `4P = (2,−3)`, `5P = (1/4, −5/8)`, `−5P = (1/4, −3/8)`, `6P = (6,14)`; `p = 2` | `Δ = 37`, good reduction at `2`; `v₂(1/4) = −2`, both points reduce to `O`; the closure of `{5P} ⊔ {−5P}` is finite flat of degree `2` over `ℤ_(2)` with fibre a length-`2` local `𝔽₂`-scheme, not reduced, not étale; `{P} ⊔ {−P} = {(0,0),(0,−1)}` stays two points modulo every `p ≠ 37` | Check true and non-vacuous; the instances are R04's suggested Checks |
| 1.9a wrong model of the closure | reduce the unsaturated equation `πg` | `V(πg)_s = 𝒜_s` of dimension `dim A`, closure fibre `V(ḡ)` of dimension `dim A − 1` | no stated Check excludes it: R04 |
| 1.1 mapping property (carried) | `Y = Spec R`, uniformiser `π`; split Tate `v(q) = 1` under ramified quadratic `R′` | `R^× → K^×` misses `π`; `v′(q) = 2`, `π′` on the non-identity component, no extension | correct (previous report) |
| 1.2, 1.3, 1.4 (carried, sampled) | zero abelian variety, `𝔾_m`, rank-zero torus; translation by `P ≠ 0`, markings `ι`, `ι ∘ [−1]` | `Spec R` quasi-compact, lft `𝔾_m` model not; cross-extension `[−1]`, composite `[1]` | correct (previous report) |
| 1.7 `LocalExistence`, 1.8 `HasGoodModel`, 1.9 `DedekindExistence` (carried, headline) | `dim A = 0`; good elliptic over `ℤ_p`; split `I₅`; Tate curve; non-flat `Spec R ⊔ Spec k`; `S = Spec ℤ[1/N]` | `Spec R`; abelian scheme; five components; no proper smooth model; excluded by smoothness; abelian scheme after shrinking | correct, binders retained (previous report) |
| 1.10 étale base change (carried, sampled) | identity; unramified; ramified `e` on split Tate `n` | same `Φ`; `Φ` becomes `ℤ/en` | étale hypothesis necessary (previous report) |
| 2.2, 2.3, 2.6, 2.8, 2.9 (carried; 2.3 sampled) | nonsplit `I_n`, `n = 1,2,4,5,0`; `E`, `𝔾_m`, `𝔾_a`, `E × 𝔾_m`, nonsplit extension by `𝔾_a`; split `I₅` over `𝔽₅`; Kodaira types; `y² = x³ + 32` over `ℤ₂`, `y² = x³ + 9` over `ℤ₃` | fixed points `1,2,2,1`, `n = 0` fails; `(t,a,u)` = `(0,1,0)`, `(1,0,0)`, `(0,0,1)`, `(1,1,0)`, `t+a+u = g`; `ℤ/5`, `𝔽₅^×`; `0, ℤ/2, ℤ/5, (ℤ/2)², ℤ/4, 0, ℤ/2, ℤ/3`; `II*` with `v₂(Δ) = 14`, `IV` with `v₃(Δ) = 7` | correct (previous report) |
| 3.1, 3.2, 3.4, 3.5, 3.10, 3.11, 3.12, 3.14 (carried; 3.10 sampled) | good, Tate, additive; `[p]` on `𝔾_a`, on Tate, `E_q → E_{q^n}`; `X² − tX − t` over `𝔽_p(s)[[t]]`; `𝔽₂[[t]]`, `y² + txy + y = x³`; non-Japanese DVR; `[[1,ℓ],[0,1]]`; `N = 2` twist; `q = π⁵` | `(0,1)`, `(1,0)`; kernel `μ_p`; `ℤ/2 → ℤ/4`, `r ↦ 2r`; `Δ = 1 + t³`; closure finite by `IsIntegralClosure.finite`; unipotent exponent 2; `N ≥ 3` necessary; class `(1, q^{1/n}) ↦ 1 mod n` | correct (previous report) |
| 4.2–4.7, 4.14 (carried; 4.6, 4.7 sampled) | loop, edge, two parallel edges, two components meeting thrice; `n = 5`, `(2,3), (5,−7)`; `u = [5]`, classes `(1,1)`, `(1,2)`; tree, `n`-cycle, `I₀*`; `ℓ ∣ n`, `ℓ ∤ n` | `ℤ`, `0`, `(1,−1)`, Gram `[[2,−1],[−1,2]]` det 3; `−29`; `1/5`, `2/5`; `0`, `ℤ/n`, `(ℤ/2)²`; `T^I` orders `ℓ²`, `ℓ` | correct (previous report) |
| 5.0b–5.3i, 5.6 (carried; 5.1a sampled) | `y² = x³ − x` at 5 and at 2; `ℚ₇`, `N = 3`, `q = 2·7³`; `[R --π--> R]`; `I₅`, `I₀*`, 32a; 11a1 at `ℓ = 5, 3`; split/nonsplit/additive | `#E(𝔽₅) = 8`, `a₅ = −2`; cubes mod 7 `{0,1,6}`; `detLine = R`, order 1; `5 = 1+5−1`, `6 = 2+5−1`, `6 = 5+2−1`; `N(E[5]) = 1`, `N(E[3]) = 11`; `1 − X`, `1 + X`, `1` | correct; locator R02 (previous report) |
| 6.0a, 6.4, 6.4c, 6.5, 6.6, 6.9, 6.10, 6.11, 6.13, 6.14 (carried; 6.1, 6.4a, 6.7, 6.9, 6.11 sampled) | `E[3]`, `v = 5`; `E_q → E_{q^m}`, `[m]`; `y² = x³ − x` at 5 and 2; `y² + xy = x³ + a₂x² + 2` over `ℤ₂`; `y² = x³ + π⁶`; `F = diag(δ, q^dδ)`, `N = [[0,n],[0,0]]`; `S₆ ≅ Sp₄(𝔽₂)`; `GSp_{2g}(ℤ/N)` | `F² + 2F + 2 = 0`; kernel `0`, cokernel `ℤ/m`; `Δ = 64`; `T² + T − a₂`; `ω = π⁻¹ω_min`; `NF = q^d(FN)`, traces `3, −3, 5`; parabolic order `48`, intersection `8`; `< N^{4g²}` | correct (previous report) |

**Declared gaps.** None declared; none needed for §1.9a: its three inputs resolve at the open heads above.

## Not verifiable

- `blr` (Bosch–Lütkebohmert–Raynaud, Springer), §2.5 pp. 55–56, the only primary source of §1.9a: paywalled, recorded `uncertified` by the service in the previous round; no manifest is readable in the package. The statements were checked by the computations in the table and against the restated argument in FiniteFlatGroupsAndIntegralPadicHodgeTheory §R07.1.20 (Raynaud 1974 §2.1) and AlgebraicModuliForArithmeticGeometry §5.4 (Stacks 0CMI–0CMK).
- The previous report's list (`faltings-chai`, `tate`, `werner`, `katz-messing`, `saito1988`, `serre1987`, `serre-tate`, `yuan-zhang-erratum`, `noot2013`, `sga7-ix`, `knudsen-mumford`, `silverman`, and the sources outside the seeded sample) stands; none of those passages changed.
- The four admitted theorems of `Suggested.lean` are elaboration-checked, not proved.

## Source issues

- none
