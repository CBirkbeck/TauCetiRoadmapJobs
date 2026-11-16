# Review of ZagierConjecturePolylogarithms (pull request #2454 at 456456e)

**Verdict:** needs changes

## R01 (P3) — Polylogarithms §4.4 is cited for three assertions; it defines two

**Location** `TauCetiRoadmap/ZagierConjecturePolylogarithms/README.md:3`, `:20`, `:82`: "the Zagier determinant and its three assertions"; "§4.4 (the Zagier determinant, its three assertions and zagierPeriod_calibration)"; "§4.4: the Zagier determinant `Zₙ`, the three assertions, and zagierPeriod_calibration".

**Claim** The supplier section is cited for a statement it does not make: at its open head Polylogarithms §4.4 defines two assertions, and says of the two regulator forms that neither is named.

**Witness** Polylogarithms at head `bd1c355`, `TauCetiRoadmap/Polylogarithms/README.md:646` "### 4.4 The two Zagier assertions and their normalization"; `:648` "Define two propositions"; `:657` "Both are motivation only: neither is named".

**Repair** In the three places write "its two assertions (rational existence and every-family rationality)": line 3 "the Zagier determinant and its two assertions"; line 20 "§4.4 (the Zagier determinant, its two assertions and zagierPeriod_calibration)"; line 82 "§4.4: the Zagier determinant `Zₙ`, the two assertions (rational existence, every-family rationality), and zagierPeriod_calibration".

## Verified sound

| Target | Instances tried | Values computed (README side / check side) | Result | Change |
|---|---|---|---|---|
| §1.2 specialization table | all sign classes of `(a,b)`, also `u₀ = 1`, `v₀ = 1`, `u₀ = v₀`, against (29) and `δ`; GR lines 407–441 | (29) gives `−[v₀]`, `2[v₀/u₀]`, and `0` at `a=b>0`; `δD₃₁` gives `+δS₄(v₀)`, `−δS₄(u₀)`, `3δS₄(u₀/v₀)` | holds | none |
| §1.5–1.6 inverse map and `δD₂₁` | functional `[w]₂⊗a ↦ D(w)log|a|` at `x = 0.37+1.1i`, `y = −1.9+0.6i` | four-term `δD₂₁`: 1.5177090821; `δ₃` of the six-term image: 1.5177090821 | holds | none |
| §2.1 Stasheff cells | `K₂`, `K₃`; GR lines 1749, 1760, 2044 | 5 vertices, 5 edges; `14 − 21 + 9 − 1 = 1`, 6 pentagons, 3 squares; source pages 39, 40, 46 | holds | none |
| §2.2 flip identity | general quadrilateral; `Δ₁₂=2, Δ₃₄=3, Δ₂₃=Δ₁₄=1` | all 12 wedge terms of `W_T − W_T′` equal those of `(1+X)∧X` with `1+X = Δ₁₃Δ₂₄/(Δ₂₃Δ₁₄)`; `X = 6`, `Δ₁₃Δ₂₄ = 7` | holds | none |
| §2.4 hexagon identity | `(0,1,3,7,11,17,23)`, `(0,1,2,5,−3,1/2,9)`, `(2,3,5,7,11,13,19)`, exact rational arithmetic | facet sum 70 coefficients (42 + 28), `Q₄` 35 (21 + 14); residual of the identity: 0 terms; `D₃₁(−69/8,−1/4)`: −1 and 0 | holds | none |
| §3.1 `d² = 0` on `D₃₁` (used by §3.3) | `x = −7/9−8i`, `y = −2+3i` over `ℚ(i)`; two further points | tensor terms −0.5011330524, `Λ²B₂` term +0.5011330524; (−0.0274757, +0.0274757); (−0.0880626, +0.0880626) | holds | none |
| §3.3 extension theorem | `δ₂₂` on `S₄(x)` and on `D₃₁(x,y)+D₃₁(y,x)`; GR lines 2604, 683, 701 | 0; `[x]₂∧[y]₂+[y]₂∧[x]₂ = 0`; Theorem 6.1 p. 57, sequence (43) and Corollary 1.15 p. 16 | holds | none |
| §3.4 cyclic shuffle coalgebra | words of length 3, 4, 5; `S = {a,s}`; `(0,1,y)`; G08 lines 3667, 3693 | 3, 8, 15 cuts, 5+5+5 by type; `2⟨X,X,X⟩ = 0`; cuts sum to `u(1−y)∧u(y)`; both G08 statements on p. 84 | holds | none |
| §3.9 Hodge correlators | weight two at `(0,1,i)`, plane integral on a 1200×1200 polar grid; M20 lines 114, 128, 145, 627, 895 | integral −2.87773 against `−πD(i) = −2.87759`; literal (3): `−iD(i)/(4π²)`, imaginary; with `i^{m−1}`: 0.023202 = (4) at `−i` | holds | none |
| §3.10 collision continuity | `m = 1`; M20 lines 899, 2378, 2432 | Theorem 11 excludes only the full diagonal (p. 18); Lemma 29 assumes `n > 1` (printed p. 44); closing corollary printed p. 45 | holds | none |
| §3.13 sign of `D₂₁` | the four `(2,1)` cuts of `(0,x,1,y)` | slots of `[x]₂`, `[y]₂`, `[y/x]₂`: `−u(1−1/y)`, `−u(1−1/x)`, `−u((1−y)/(1−x))`; fourth by `[1−w]₂ = −[w]₂`: total `−δD₂₁` | holds | none |
| §4.1 weight-four Bigrassmannian | `m = 5, 6`; GR lines 2839–2843 | rows `q ≥ 4`, `BC₅ = C₅(4)` in degree 5; `p∂` coefficient +1, `∂p` coefficient −1 on the same configuration | holds | none |
| §4.2 flag length (with §4.3) | `N = 4, 5`; GR lines 2871–2879, 2901 | Theorem 7.1 at `n = 4`: length `N−3`; defect `Σ_{d<p}(c_d+c_{d+1}) p t_d`; `N = 5`: unsigned `2A − 2B`, signed 0 | holds | none |
| §4.4 group homology to Bigrassmannian | GR lines 222, 4242, 4288 | Suslin's stabilization only at line 222; "for each n" at 4242; comparison unique up to homotopy at 4288; no rank comparison in the source | holds | none |
| §4.5 `G₄(F)` | GR lines 3225–3231; `p²` on nine vectors | quotient by `r₈∂(C₉(4)) + r₈p(C₉(5))`; signs `(−1)^a(−1)^{b−1}` and `(−1)^b(−1)^a` opposite, 72 terms in 36 pairs | holds | none |
| §4.7 symbolic Bloch modules | three-term element over ℚ; GR lines 4350, 4368, 4393, 4397 | value `[1]₃`, with `L₃(1) = ζ(3) ≠ 0`; `δ₃[1]₃ = [1]₂⊗u(1) = 0`; `dim b₂(2,6) = 10` in Example 10.6 | holds | none |
| §4.8 chain-map identities | `C₈(3)`: two pairs of random complex configurations, `(D∘σ₁)∧(D∘σ₂)`; `C₇(2)`: three configurations | `X = −271.5576`, projected wedge `Y = 2444.0180`, `Y/X = −9.000000` in both pairs; `δR₇² = −18.911296 = R₆²∂` | holds; Lemma 7.9 of GR fails | none |
| §5.3 coefficient diagram | degrees; GR lines 3409, 3439 | `1 + 2 = 3`; `ℚ` in total degree 8; `θ(π∧u∧w) = ū∧w̄`; homotopy `H = 0` on normal crossings (remark 1, p. 73) | holds | none |
| §5.9 extension across residues | `r₃` against `μ₃`; table of §1.2; GR lines 4098–4116, 4251–4266 | `Alt[r(x₁,y₂,x₂,y₁)] = −Alt[r(l₁,m₁,l₂,m₂)]`, so `μ₃ = −r₃/2` with (235); `a>0=b`: `+S₄(v₀)` against `−S₃(v₀)` | holds | none |
| §§3.7, 5.1 periods (used by the headlines) | G08 Definition 4.10 and (106); `z = i` on `∂θ` | `N = 2m−1`: `(5/6,−1/6)`, `(3/5,−1/5,1/5)`; `µ⁻¹`: 20, 10, (4,6,4), (1,3); both sides `−3iζ(3)/256`; weight three both `D(i)/4` | holds | none |
| §5.2 calibration | `z = 2+i` | `D = 0.511666`, correction 0.331341; `L₄* = 0.146294`, `(5/16)L₄ = 0.139391`, difference `0.006903 = 0.331341/48` | holds | none |
| §6.1 rank | `m = 7`; SchemeKTheoryOperations §6.7 on main | bijective for `n ≥ 2m+e`, `e = 1` when `R/Jac(R)` is semisimple: `n ≥ 15`; onto only at 14 | holds | none |
| §6.2 phase and exponent | `[i]` over `ℚ(i)` | `p = β(4)/8 = 0.12361807`; `−p/(8π³) = −0.00049836`; `π^{d−4N}·π^{3d} = π^{−4(r₁+r₂)}` | holds | none |
| `zagier_four_exists` | `F = ℚ`, `ℚ(i)`; one-tactic probe | `π⁴ = 90ζ(4)`; `π⁴β(4)/2 = 48.166095 = 45ζ(4)β(4)`; `rfl`, `simp`, `aesop`, the zero family all leave the goal | holds, on the obligations of §5.7 | none |
| `zagier_four_everyFamily` | zero column; `[i]+[−i]` over `ℚ(i)`; one-tactic probe | determinant 0, `q = 0`; `L₄(i)+L₄(−i) = 0`; probe leaves `∃ q, π^{…}/√|disc|·det = q·ζ_F(4)` | holds | none |
| `TrilogRelationFunction`, `singleValued`, `polylog` | `b = L₃` at `(2,3,5)`, `(−2,1/2,3)`, `(0.3,−0.7,0.6)`, a complex triple, `(1,1,1)` | 22-term sums below `1.6·10⁻¹⁵`; `A↔B` exchanged −0.521041; sign of `b(A/d)` 5.961065; `L₄(2) = 0`; `L₃(3) = 0.914279` | holds | none |
| R01: "three assertions" | Polylogarithms §4.4 at head `bd1c355` | README: three; supplier: heading "The two Zagier assertions…", "Define two propositions" | fails | R01 |

- Previous review: it raised no finding and recorded the two findings of the first review as repaired; at this unchanged head both still hold (`README.md:652` "…Polylogarithms §3.3 (unit-part homomorphism)…"; the description names all ten roadmaps).
- Source locators checked against the texts: 103 (GR 70, G08 20, M20 10, G93 3), those of the fifteen sampled sections included; page and line agree in each, M20 pages 44–45 being the printed ones.
- Library declarations opened at the pins: 17 (among them `NumberField.dedekindZeta`, `Mathlib/NumberTheory/NumberField/DedekindZeta.lean:50`; `Matrix.det_isEmpty`, `…/Determinant/Basic.lean:97`; `bernoulli_one`, `Mathlib/NumberTheory/Bernoulli.lean:207`; `ExteriorAlgebra.exteriorPower`, `…/ExteriorAlgebra/Basic.lean:79`; `TauCeti.Hodge.MixedHodgeStructure`, `TauCeti/Geometry/Hodge/Mixed/Basic.lean:72`; `range_inf_F_eq_map_F`, `…/Mixed/Strictness.lean:110`; `tate`, `…/Tate/Basic.lean:93`).
- Cross-roadmap citations resolved: 63 sections in eleven roadmaps by heading, 19 of them read in the text, on main (PolylogarithmFunctions, SchemeKTheoryOperations, HodgeStructures, FukayaTheory) or at the open heads; one drift (R01). The five declared gaps have the same slugs in the plan and in the README, each with a named supplier section.
- Gate: every check 0, OK, build included. Dependency check: `depcheck: 259 roadmaps, 2488 edges, 0 problem(s)`. No change outside the folder.
- Lean: `lake env lean` on `Suggested.lean` gives two `sorry` warnings only (lines 133, 144); `#check @name` of the ten declarations matches the README statements, no binder lost; the restated `polylog`, `singleValued`, `unitVector`, `trilogCyclic`, `TrilogRelationFunction` agree with those of PolylogarithmFunctions and Polylogarithms for weights `n ≥ 2`.
- Headlines: the two statable ones are stated; the module docstring names the five groups that are not, each with its missing carrier; no declaration is padding.
- Overlap check: read Polylogarithms, BorelRegulators, K3BlochGroups, PeriodsAndSpecialValues, MotivicEtaleKTheory, PolylogarithmFunctions; decorated flags: Polylogarithms §3.4 (this README consumes them; Polylogarithms README line 21 still lists them, and the map `B₄^comb → B₄^ind` at line 710, as built here, which this README does not do); `B₄(F)`, `Γ(F,4)`, `L₄*`, `κ`: here; scissors groups, correlators, cluster maps: no other roadmap.
- Source independence: 8 passages compared with 3 sources (GR lines 399–403, 2867–2876, 3223–3231, 4228–4243, 4274–4291; M20 lines 102–113; G08 lines 3667–3675 and 1967–1971), longest shared run 3 words, none copied; largest share GR, 114 of 177 page locators; contents compared with GR: independent (Layer 3 joins its §§6, 2 and 8.2, Layer 4 its §§7 and 10, Layer 5 its §§8–9; correlators come after the cluster maps because §3.1 needs §2.5).

## Not verifiable

- G93 Theorem 4.5: the heading is not legible in the OCR text; only (4.10)–(4.11) were found, on printed p. 190 (G93 lines 803–806).
- G00 and CGR locators (§§5.5–5.7) are outside the sample and were not opened this round.
- The numbering of the published version of GR against arXiv v5, which the README cites: no published copy was read.

## Source issues

- **Error** in GR at Lemma 7.9, p. 72: the source says the composite of the seven-vector map with deletion vanishes on eight vectors in dimension three; it should be that its wedge part is nonzero and cancels the projected weight-two wedge map; affects the proof.
- **Error** in GR at Theorem 1.2, (7), p. 5: the source says the zeta value equals the normalized determinant for suitable cycles, also when there is no complex place; it should be a nonzero rational multiple, the ratio being 90 over ℚ; affects a stated result.
- **Error** in GR at (192), p. 78: the source says the three-factor coefficients are 3/7, −1/7, 1/7 and the four-unit form is one sixth of the alternation; it should be 3/5, −1/5, 1/5 and one twenty-fourth, by the product of Hodge correlators, Definition 4.10; affects a stated result.
- **Misprint** in GR at (192), p. 78: the source says the second term of the trilogarithm-times-unit formula has the logarithm of the symbol argument and the derivative in the unit; it should be the reverse; affects nothing.
- **Misprint** in GR at §1.2, item 3, worked case after (38), p. 14: the source says the equal-pole specialization of the double symbol is the single symbol of the ratio; it should be three times it, as in (26) and at the end of the same computation; affects nothing.
- **Misprint** in GR at §9.3, item 2, p. 93: the source says the k-th path segment varies the first-row entry numbered k−1; it should be the entry numbered k; affects nothing.
- **Gap** in GR at §9.3, item 2, before Lemma 9.6, p. 93: the source says subtracting the cobracket of one alternated double symbol lands in the single-symbol complex; it should carry the factor 3/28 and a second correction on seven vectors in dimension two; affects the proof.
- **Error** in M20 at §1.2.1, (3), p. 3: the source says the tree integral takes values on the line of the weight-n power of 2πi; as printed it is imaginary in every weight, and it should carry a further factor i to the power n−1; affects a stated result.
- **Error** in M20 at §2.1.3, example after (16), p. 18: the source says the weight-two correlator of (1,0,z) is minus one half of the normalized dilogarithm value; it should be that value itself, by (4); affects nothing.
- **Misprint** in G08 at §11.1, differential equation on p. 105: the source says the derivative of the real starred function equals a combination of imaginary forms; it should carry the factor i in alternate weights; affects nothing.

## For the human reviewers

- `zagier_four_exists` for `r₂ > 0`: README §5.7 (lines 960–972) and `Suggested.lean` (lines 12–14) state that no cited source proves three steps of the lift it rests on; GR reaches it only motivically (GR lines 4236–4243).
- Scope: the main source GR is cited as arXiv v5; the manifest's version note records acceptance by Annals of Mathematics, which was not checked independently.
- The README departs from its sources at the ten places listed under Source issues, among them Lemma 7.9 and formula (192) of GR; no published correction of them was found.
