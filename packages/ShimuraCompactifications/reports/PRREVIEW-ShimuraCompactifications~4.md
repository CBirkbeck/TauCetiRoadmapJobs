# Review of ShimuraCompactifications (pull request #1053 at 35c6b80)

**Verdict:** needs changes

Eleven P3 findings, none blocking. The gate passes, the dependency check is clean and both
statements of `Suggested.lean` survive the adversarial pass.

## R01 (P3) — ComplexComparisonPartII is cited by section numbers it does not have

**Location:** `TauCetiRoadmap/ShimuraCompactifications/README.md` lines 278–281, "§0.4 supplies
coherent analytification; Layer 2 … §4.3 derived GAGA … §6.1 Remmert's theorems; §6.2 Chow's theorem
… §6.3 … §6.4"; lines 1271–1272, "Layer 2, 6.1 (Remmert's proper mapping theorem), 6.3".

**Claim:** These are sections of ComplexComparisonPartII.

**Witness:** ComplexComparisonPartII README at the head of #848, lines 1397, 2233, 2633, 2679, 2701,
2714, 2742: `C0.4`, `Layer C2`, `C3.3`, `C4.1`–`C4.4`. Its `Layer C6` (line 4669) is stratified
topology. It has no renumbering table. 2.7 (line 1313) already cites `C3.3`, `C4.2`, `C4.4`.

**Repair:** Lines 278–281: "§C0.4 supplies coherent analytification; Layer C2 projective and proper
consequences of GAGA; §C3.3 derived GAGA for proper algebraic spaces; §C4.1 Remmert's theorems;
§C4.2 Chow's theorem with nilpotents; §C4.3 compactification and algebraization with proper
support; §C4.4 algebraicity of holomorphic maps out of proper schemes." Lines 1271–1272:
"ComplexComparisonPartII C2, C4.1 (Remmert's proper mapping theorem), C4.3 (compactification and
algebraization with proper support)."

## R02 (P3) — Eight ArakelovGeometryAndAbelianHeights declaration names exist nowhere

**Location:** README lines 337–343 ("§2.0 supplies `GroupScheme.IsSemiAbelianFamily` … §§5.0a–5.0b
supply `SiegelModuli.ToroidalCompactification`, `SiegelModuli.toroidalDegenerationChart`, …"),
1470 (`SiegelModuli.toroidalRefinement`), 1769, 1950 (`GroupScheme.semiAbelianHom_extend`).

**Claim:** The supplier declares these names.

**Witness:** `roadmaps grep` for each of the eight names matches only citing roadmaps. The supplier's
README at the head of #1000 states the objects in prose under `### 2.0` (line 686), `### 5.0a`
(1360), `### 5.0b` (1377); its `Suggested.lean` declares none.

**Repair:** Cite by section and drop the backticks. Lines 337–343: "§2.0 supplies the semi-abelian
family predicate for smooth separated commutative groups of finite presentation, its base-change
API and the extension theorem for homomorphisms over Noetherian normal schemes. … §§5.0a–5.0b supply
the principal Siegel toroidal compactification with its degeneration charts and refinement maps,
the integral minimal compactification, the generated Hodge power and the Hodge-degree criterion".
Line 1470: "§5.0a's refinement maps". Line 1769: "Use the semi-abelian family predicate of
ArakelovGeometryAndAbelianHeights §2.0." Line 1950: "Apply the extension theorem of
ArakelovGeometryAndAbelianHeights §2.0".

## R03 (P3) — 4.2: the field of definition has no locator

**Location:** README lines 1485–1493, "The extension is defined over the compositum of the reflex
fields … ([Pink], 6.25, pp. 112–113)."

**Claim:** Pink 6.25 gives the field of definition of the extended maps.

**Witness:** pink lines 4485–4507 (6.25) construct holomorphic maps only. The fields are in 12.4(b),
pink lines 7887–7889, printed p. 197: `E(P,X)` for the maps of 6.25(a), `E(P_1,X_1)` for 6.25(b).

**Repair:** "([Pink], 6.25, pp. 112–113, and 12.4(b), p. 197, for the fields of definition)".

## R04 (P3) — 4.11: page range of Pilloni's §3.4

**Location:** README line 1695, "[Pilloni20], 3.4, pp. 15–16".

**Claim:** §3.4 of the author copy is on pp. 15–16.

**Witness:** pilloni20 line 625 (heading of §3.4, on p. 14), line 636 (Proposition 3.4.1, p. 15),
line 669 (§4 begins on p. 15).

**Repair:** "[Pilloni20], 3.4, pp. 14–15".

## R05 (P3) — 7.22, 7.23 and 4.10 use a coefficient ring `O` and a uniformizer `ϖ` that are never introduced

**Location:** README line 2747, "every `O`-module `M`, restriction `H^0(X, ω(a, b) ⊗_O M) → …`";
lines 2729 and 2756, "`R = O/ϖ^n`", "`M = O/ϖ^n`"; line 1676, "`M = B/ϖ^n`".

**Claim:** `O` is a coefficient ring with uniformizer `ϖ`.

**Witness:** (6-b), line 1762, fixes `O` as the PEL order, and 7.22 uses it so ("`O ⊗ ℚ` is simple").
For Siegel data `O = ℤ`: 7.23 then reads "every `ℤ`-module" and `ℤ/ϖ^n` is undefined. `ϖ` occurs
only on lines 1676, 2729, 2756; `B` is a scheme.

**Repair:** 7.23: "and every `ℤ_(p)`-module `M` (in particular every module over the integers `𝒪_E`
of a finite extension `E/ℚ_p`, as in [CG]), restriction `H^0(X, ω(a, b) ⊗_{ℤ_(p)} M) → H^0(Y,
ω(a, b) ⊗_{ℤ_(p)} M)`"; Check: "`M = 𝒪_E/ϖ_E^n`, `ϖ_E` a uniformizer, is included." 7.22:
"`R = 𝒪_E/ϖ_E^n`". 4.10 Check: "`M = O_{F_0,(□)}/𝔭^n` for a prime `𝔭` of the base".

## R06 (P3) — 8.23 uses "découpage in the sense of 8.57", which 8.57 does not define

**Location:** README line 3485, "the cusp charts form a découpage in the sense of 8.57; its
hypotheses hold".

**Claim:** 8.57 defines a découpage.

**Witness:** `grep -n découpage README.md` returns line 3485 only. 8.57 (lines 4131–4137) lists the
atlas, `Y°` and `f°` without naming the datum; dimitrov line 652–657 (Définition 5.10) is where the
term comes from.

**Repair:** In 8.57, after "(completion on relative morphisms and grothendieck-algebraization))",
add: "Call the atlas together with `Y°` and such an `f°` a découpage of `X` (Dimitrov, Définition
5.10)."

## R07 (P3) — Layers 3 and 5 have no `### Examples`

**Location:** README lines 1415–1438 (Layer 3) and 1719–1740 (Layer 5): each goes from its Checks to
`### Dependencies`.

**Claim:** Every layer ends with `### Examples` and `### Dependencies`.

**Witness:** `grep -n '^### Examples' README.md`: lines 884, 1128, 1403, 1706, 2176, 3039, 4175,
seven for nine layers.

**Repair:** Before line 1436: "### Examples" with "- For the modular-curve datum 3.1 returns the
model of 2.9, the compactified modular curve." and "- For a datum without proper rational boundary
components the model is the canonical model of ShimuraVarieties 8.22." Before line 1738:
"### Examples" with "- At a modular cusp the descended arrows of `T_p` are `q ↦ q^p` and `q ↦ q`,
as in Layer 4." and "- The identity refinement descends to the identity."

## R08 (P3) — Two layer introductions say the layer follows a source

**Location:** README line 2197, "This layer constructs it following Lan's book: good algebraic
models …"; line 3057, "Following Dimitrov, this layer first proves only the elementary unit-orbit
estimates".

**Claim:** The organisation of Layers 7 and 8 is that of a source.

**Witness:** The planning principle: "a roadmap does not say it follows a source". The layers are
not arranged as either source (see `Source independence:` below), so only the two sentences are at
fault.

**Repair:** Line 2197: "This layer constructs it from good algebraic models of the formal boundary
charts of Layer 6, glued by an étale relation …". Line 3057: "This layer first proves only the
elementary unit-orbit estimates 8.1–8.8 and trace-phase arithmetic 8.16–8.20." The locators at the
targets stay.

## R09 (P3) — Two consumed supplier sections are missing from the supplier contracts

**Location:** README lines 350–353 (ModularCurvesPartII entry: "3.6 …, 3.7 …, 3.11 …, 4.8 …, 5.2 …,
5.13 …, 9.1") and lines 260–261 (SchemeAndStackFoundations entry: "§0.3 … §0.6 … §0.8 … §0.28 …
§0.29").

**Claim:** The contracts list every section consumed.

**Witness:** Lines 3603 and 4007 cite "ModularCurvesPartII §§3.5, 4.8" (`### 3.5 Fine loci and
bad-level inertia`, its README line 1025); line 3024 cites SchemeAndStackFoundations §0.17
(`### 0.17 Depth, Cohen–Macaulay modules and Serre's conditions`, its README line 1669).

**Repair:** Add "3.5 (fine loci and bad-level inertia)," before "3.6" on line 350, and "§0.17
supplies depth and Serre's conditions;" after "§0.8 supplies étale coordinates;" on line 261.

## R10 (P3) — The references list EGA IV₂ and omit the EGA volume that is cited

**Location:** README line 4297, "EGA IV₂, §5."

**Claim:** EGA IV₂ §5 is cited in the roadmap.

**Witness:** `grep -n EGA README.md`: line 4136 ("Lemme 5.8, EGA III 5") and line 4297 only.

**Repair:** Replace "EGA IV₂, §5" by "EGA III₁, §5 (algebraization of formal morphisms)".

## R11 (P3) — Title line of the module docstring

**Location:** `TauCetiRoadmap/ShimuraCompactifications/Suggested.lean` line 5, "# Shimura
compactifications: headline target statements".

**Claim:** The docstring is titled "<title>: target signatures".

**Witness:** README line 1: "# Roadmap: toroidal compactifications and boundary geometry"; the
roadmaps on main read "…: target signatures" (`TauCetiRoadmap/AlgebraicVectorBundles/Suggested.lean`
line 11).

**Repair:** "# Toroidal compactifications and boundary geometry: target signatures".

## Previous findings

- R01 (79 Check labels) — repaired: line 560 reads "For the trivial `G_m`-torsor and the positive
  ray, `T(σ) = A¹_Z` with its standard open `G_m`."; `grep -c '_test`' README.md` gives 0.
- R02 (Part II of AnalyticToricGeometry) — repaired: the description reads "Its Layer 0 extends
  AnalyticToricGeometry Layer 0 to arbitrary coefficient rings, torsor bases and arithmetic cone
  systems".
- R03 (layer names `C0`–`C6`) — repaired: the description reads "(Layer 1)", "(Layer 2, with general
  data in Layer 3)", "(Layers 4 and 5)", "(Layer 6)", "(Layer 7)", "(Layer 8)".
- R04 (AI-assistance sentence) — repaired: "GPT-6 (Codex) for the port … and for the statements of
  `Suggested.lean`; Claude Fable 5.1 and Claude Opus 5.5 for the review repairs and the rewording".
- The library baseline on line 217, "Mathlib `1b1ccf4` and Tau Ceti `2fd255d`", is that of
  `lake-manifest.json`.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 face projection | `ℤ/4`, `P = ℕ`, `F = {0}`; even submonoid; `F = P = ℤ` | `π(e_1) = 0`, `π(2e_0) = 2e_0 ≠ 0`; evens: `π(e_1)² = 0 ≠ e_2 = π(e_1²)`; `π = id` | holds; face condition needed; lan line 19725, p. 444 | none |
| 0.5 stratum quotient | `ℤ[ℕ]/(e_1)`; `(ℤ/4)[ℕ]/J`; `F = P`; `R = 0` | `≅ ℤ`; `≅ ℤ/4` with `[2e_0] ↦ 2`; `J = 0`; `0 ≅ 0` | holds; lan line 19725–19741 (source takes the reduced stratum, 0.11 says so) | none |
| 0.9 face charts | quadrant with ray `(1,0)`; `σ = 0` | `m = (0,1)`, `P_τ = P_σ + ℕ(0,−1) = ℕ × ℤ`; `m = 0`, identity | second coordinate inverted; lan lines 19718, 19761, pp. 444–445 | none |
| 0.10 regular coordinates | `⟨(1,0),(1,2)⟩`; quadrant; ray in rank 2; zero cone | `det = 2`; `det = 1`, `R[x_1,x_2]`; `R[x,y^{±1}]`; `R[y_1^{±1},y_2^{±1}]` | first excluded, as the Check says; lan line 19680, p. 443 | none |
| 0.15 `pol` | `x + y + min(x,y)` on the subdivided quadrant | `x+2y` for `y ≤ x`, `2x+y` otherwise; values `1, 1, 3`; `3 ≥ 1+1` | superadditive, positive off `0` | none |
| 4.2 level and datum maps | `q ↦ q^p`; pink 6.25(a), (b); 12.4(b) | ramification index `p`; pink lines 4485–4507; fields `E(P,X)`, `E(P_1,X_1)` at line 7887 | statement supported by 6.25 with 12.4(b) | R03 |
| 4.3 Hecke span | `g = diag(p,1)`, `Γ(N) ∩ gΓ(N)g⁻¹` | upper-right entry `≡ 0 (mod p)` and `(mod N)`: width `pN`; `q_N ↦ t^p` and `t` | agrees | none |
| 4.7 formal functions | `ℙ¹_{k[t]}`, `O(−2)`, `i = 1`; `I = 0`; `I = O_Y` | `H¹ = k[t]`, both limits `k[[t]]`; identity; all three `0` | holds; stacks Tags 08AV, 08AZ (lines 1848, 1927) | none |
| 4.9 Veronese cone | `A = k[s³,s²t,st²,t³]`, `I = (s²t, st²)`, `v = t/s` | `IB = (uv, uv²) = (uv)`: one generator; `I/𝔪_A I` has dimension 2 | kernel nonzero, as stated | none |
| 4.11 completed comparison | tower `ℤ ←p ℤ ←p ⋯` in degree one | `H⁰ = 0` at every level; `lim¹ = ℤ_p/ℤ ≠ 0` | Mittag-Leffler on sections does not suffice; bp lines 2029–2054, p. 39 | R04 |
| 6.12 Tate curve | `u ↦ u^p` from `q` to `q^p`; identity from `q^p` to `q` | kernel `μ_p`, `du/u ↦ p·du/u`; kernel `q^ℤ/q^{pℤ}`, order `p` generic, `1` special | holds; lan §4.4 p. 250, Theorem 4.5.3.6 p. 280 | none |
| 6.16 Klingen subgroup | `L = ⟨e_1, pe_2, pf_2⟩`, `H_1 = ⟨pf_1⟩`; `L_0 = ⟨e_1,e_2⟩` | `⟨pe_2,pf_2⟩ = p² = 0`; `L ∩ [p]⁻¹H_1 = L[p]`, order `p³`; quotient order `p⁵/p³ = p²`, cyclic; `L_0`: `ℤ/p² ⊕ ℤ/p` | level `p^{n+1}`, as stated | none |
| 6.17 `t_1` acyclic | pilloni20 line 3905; blow-up of the quadrant | asserted there without proof, p. 85; `H^i(ℙ¹, O(n)) = 0` for `n ≥ 0`, `i > 0` | README owns the proof, and says so | none |
| 7.3 integral toroidal model | genus-two Siegel cusp | `rank Sym² ℤ² = 3`, toric rank `2`, union ideal `(x_1x_2x_3)` | lan lines 22218 (p. 509), 22555–22568 (p. 518), 22598 (p. 519) | none |
| 7.4 formal completion | `A²`, stratum the punctured `x_1`-axis | with the origin removed `R[x_1^{±1}][[x_2]]`; without `R[x_1][[x_2]]` | removal needed; lan lines 22649–22655, p. 520 | none |
| 7.26 formal Koecher | `0 → L → L → L/p^n → 0`; cone over a curve over `ℤ_p` | `ℋ¹_Z(L/p^n) ≅ ℋ²_Z(L)[p^n]`, transitions `×p`, limit `0`; `H²_𝔪(A)` = `p`-torsion of `⊕ H¹(C,O(m))`, depth of `A/p` is `1` | extension holds without `S2` on thickenings | none |
| 7.29 determinant | `diag(t_1,t_2)` on `Sym²` | `t_1² · t_1t_2 · t_2² = (t_1t_2)³` | agrees | none |
| 7.34 finiteness | `𝔸²`, `𝔸³` at the origin; cone over an abelian surface | curves through `0`: depth `1 < 2`; depth `2 ≥ 2`, `< 3`; `ℋ² = H¹(S,O_S)`, dimension 2 | criterion and Checks agree | none |
| 8.10 positive support | `ℚ(√2)`, `ξ = −√2`, `v = 1+√2` | `Tr(v²ξ) = −8`, `Tr(v⁴ξ) = −48` | unbounded below; dimitrov lines 976–986, p. 547 | none |
| 8.13 ideal level | `n = ((9+5√5)/2)` | `N = (81−125)/4 = −11`: rank `11`, against `121` for `(11)` | agrees | none |
| 8.14 cusp lattices | `F = ℚ`, `a = b = b′ = ℤ`; `b′ = ⅓ℤ` | `X = X^* = ℤ`; `X = ⅓ℤ`, `X^* = 3ℤ`, `⟨⅓,3⟩ = 1`; `cbb′ = ab′` from `a = bc` | dimitrov lines 321–336 (p. 532), 375–382 (p. 533) | none |
| 8.20 phase | `B = ¼ℤ`, `n = 4`, `ζ = 2 ∈ (ℤ/5)^×`; `B = ⅓ℤ`, `x = 1, 4` | `2⁴ = 1`; values `1` and `2`; `traceDual(B) = 3ℤ ∋ 3` | depends on `x` modulo `traceDual(B)` | none |
| 8.23 fine toroidal model | dimitrov Théorème 7.2(i); rapoport Théorème 3.5 | lines 733–749, pp. 541–542, uniqueness included; rapoport lines 792–820, pp. 276–277 | supported; README adds neatness where the source assumes no torsion | R06 |
| 8.28 `Γ₁(4)` cusp | `σ = [[1,0],[2,1]]`, `T` | `σTσ⁻¹ = [[−1,1],[−4,3]]`; `γ = [[1,−1],[4,−3]] ≡ [[1,∗],[0,1]] (mod 4)`; trace `−2`, det `1` | both eigenvalues `−1` | none |
| 8.39 weights on the minimal model | `F = ℚ(√5)`, `u = φ⁵` | `φ⁵ = (11+5√5)/2`, `N(u) = −1`, `N(u−1) = −11`; character `(−1)^k` | odd parallel weight fails; dimitrov lines 1031–1032, 1067–1071 | none |
| 8.43 descent | `ℤ/4 → A = (ℤ/4)[t]/(2t)` | split by `t ↦ 0`; `2t = 0`, `t ∉ 2A` | injective, not flat | none |
| 8.49 fixed point | `S = [[1,1+i],[1−i,−1]]`, `u = 7+4√3`, `E: y² = x³−x` | `S² = 3I`; `u² = 97+56√3 ≡ −1 (mod 7)`; `#E(𝔽_5) = 8`, `a_5 = −2` | ordinary fixed point | none |
| 8.56 stabilizer | `z ↦ a_gz + τ_g`; `ℤ/9`, `ξ = ½`, `e = 2`, `τ_g = 1` | `τ_{gh} = τ_g + a_gτ_h`; `φ_{gh}(ξ) = σ_h(φ_g(ξ))φ_h(a_gξ)`; `(−1)^{2·½·1} = −1` | cocycle and source agree (dimitrov lines 378–382) | none |
| 8.57 formal gluing | hypotheses against rapoport Théorème 3.5 | base, compactifiable `Y°`, dense interior, permitted `f°`, (i), (ii), uniqueness: all present, lines 792–820 | supported | R06 |
| `bounded_cusp_support_is_positive` (8.5) | `F = ℚ`, `a = δ_{−1}`, `B = −1`; `U = 1`, `a = δ_{ξ_0}`; `R = 0`; `ξ = 0` | hypotheses hold, conclusion false: `hd` needed; same: `hU` needed; vacuous; allowed by the disjunction | true as stated; README and Lean agree | none |
| `proper_flat_globalFunctions_baseChange` (8.55) | `∅ → Spec k`; `Spec ℂ → Spec ℝ`; `Spec k[ε] → Spec k`; `ℙ¹_{ℤ/4}` | excluded: Mathlib's `GeometricallyConnected` asks `ConnectedSpace` (`Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40`); two points; not reduced; functions `ℤ/4` | true as stated; stacks Tag 0E0L (line 3679) | none |
| 7.22, 7.23 coefficients | `O = ℤ` for Siegel data | "every `ℤ`-module", `ℤ/ϖ^n` undefined; with `ℤ_(p)`: `M = ℤ/p^n` covered by 7.22 and colimits | notation only | R05 |
| 2.5 supplier ids | ComplexComparisonPartII at its head | `C4.1` Remmert, `C4.3` compactification; `C6` is another subject | wrong numbers | R01 |

- Source locators checked against the text: 42, in lan (16), pink (3), dimitrov (9), pilloni20 (5),
  bp (2), rapoport (1) and the Stacks project (6: Tags 08AV, 08AZ, 0E0L, 0A19, 0A1B, 0E0D). All fifteen
  seeded targets were read at their locators; the README flags no locator as unverified.
- Library declarations opened at the pins: `GeometricallyConnected`
  (`Mathlib/AlgebraicGeometry/Geometrically/Connected.lean:40`), `geometrically`
  (`…/Geometrically/Basic.lean:46`), `NumberField.IsTotallyPositive`
  (`TauCeti/NumberTheory/NumberField/TotallyPositive.lean:71`), `appTop_bijective_of_section`
  (`TauCeti/AlgebraicGeometry/RationalPoint/Basic.lean:308`), `TauCeti.Toric.Fan`
  (`TauCeti/Geometry/Toric/Algebraic/Fan/Basic.lean:97`, empty cone set admitted, as 0.17 uses);
  the 21 Mathlib names of the contracts resolve under `#check`; the 14 cited Tau Ceti files exist.
- Cross-roadmap citations resolved: about 145 section ids in 23 roadmaps, on main or at their open
  heads.
  Two sets fail (R01, R02). The `B`-labels of AutomorphicBundles and the `L`-labels of
  AlgebraicVectorBundles resolve through those roadmaps' own mapping tables.
- Gate, my run at `35c6b80`: every check `0`, `OK`; the worker's run adds `build=0`. Nothing
  changed outside the folder.
- Dependency check: `depcheck: 245 roadmaps, 2246 edges, 0 problem(s)`; the roadmap is line 165 of
  the merge order, after HilbertModularVarietiesAndShimuraCurves (164). No supplier names this
  roadmap in a `*Needs:*` line.
- Elaboration: `lake env lean` on a copy with `#check @` of both theorems: `sorry` the only warning
  (lines 43 and 60); both elaborated types equal their README statements, no binder lost. One-tactic
  probe (`simp`, `rfl`, `infer_instance`, `aesop`, `exact?`, `omega`, `tauto`): 14 failures of 14.
  No declaration at the pins states either theorem. Headlines: of the README's table only 8.5 and
  the general theorem of 8.55 are statable; the docstring names the missing carriers of the rest.
- Overlap check: read AutomorphicBundles, PerfectoidShimuraVarieties, PELModuli, ShimuraVarieties,
  HilbertModularVarietiesAndShimuraCurves, AnalyticToricGeometry, SchemeAndStackFoundations; nothing
  shared. The Koecher principles of ShimuraVarieties 2.8, SiegelModularForms and HilbertModularForms
  are the complex-analytic ones; the principal Siegel compactification is
  ArakelovGeometryAndAbelianHeights', cited in 7.3, 7.13, 7.16.
- Source independence: 16 passages compared with 7 sources, none shared; largest share lan and
  dimitrov, 51 each of 210 locators; contents compared with both: independent (Layer 8 takes
  dimitrov's §8, §4, §3, §7, §4, §6, §7, §8, §3, §5 in that order; Layers 0, 6, 7 draw on lan's
  §6.1, Chapters 3–4 and §§6.3–7.2 with Layers 1–5 between).

## Not verifiable

- [FC] Faltings–Chai (6.2, 6.5, 6.6, 6.8, 7.13, 7.14, 7.16, 7.32, 7.33): Springer, paywalled; cited
  by locator.
- Ash–Mumford–Rapoport–Tai, Chapter II (through Pink 6.19 in 1.5): no legal copy found.
- SGA 1 VIII 5.2 and XII 3.2, SGA 2 VIII 2.1–2.3, SGA 3 I 4.7.3 and VII_A 4.1–4.3, Stacks Tags 0CBN,
  0C23, 0FW2: not fetched this round; 7.34 was checked by hand on the instances above.
- [BHW], [CG], [DT], [BPS], [Lan16], [Lan17], [LanHK], [Yuan], [Bresciani], [FKW], [BCGP21],
  [BCGP25], [Pilloni12], Moret-Bailly: outside the seeded sample, not re-read this round.

## Source issues

- **Misprint** in pink at 6.25(a), printed p. 113: the source says that for a normal subgroup `K′_f`
  of `K_f` the quotient is by the finite group `K′_f/K_f`; it should be `K_f/K′_f`; affects nothing.
- **Error** in dimitrov at Théorème 8.6(vi), printed p. 548: the source says the weight sheaf extends
  invertibly to the minimal compactification exactly when the weight is parallel; it should also
  require the cusp-unit character to be trivial, which fails for odd parallel weight when a cusp
  unit has norm `−1`; affects a stated result.
- **Misprint** in dimitrov at the proof of Théorème 8.3, printed p. 547: the source says take a
  nonzero coefficient at an exponent that is not totally positive and finds a negative pairing; it
  should exclude the exponent `0`, which has none; affects nothing.
- **Gap** in dimitrov at Proposition 8.5(ii), printed p. 547: the source says the descent holds for
  every `R`-algebra `R′`; it should say for inclusions `R ⊆ R′`, uniqueness failing for `R → 0`;
  affects a stated result.
- **Misprint** in pilloni20 at 13.2.1, author-copy p. 85: the source says the second arrow sends
  the triple to the quotient with subgroup `p⁻¹H_n + L/L`; it should be `(p⁻¹H_n + L)/L`; affects
  nothing.

## For the human reviewers

- none
