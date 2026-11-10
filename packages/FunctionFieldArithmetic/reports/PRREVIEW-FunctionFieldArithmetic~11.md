# Review of FunctionFieldArithmetic (pull request #1474 at 4cac1f8)

**Verdict:** accepted

No finding. The three folder findings of the previous review are repaired, the gate passes, and the full pass over the README and `Suggested.lean` found nothing to change. What was checked is recorded below.

## Previous findings

- **R01 (P2), Kosters–Wan conductor formula statable but absent — repaired.** `Suggested.lean` lines 242–258 now state `aswConductor_eq`, and the module docstring lists it as statable (lines 19–20). The author did not take the statement proposed in the previous review, and was right not to: that statement asked for a Witt vector `y` over a finite `L` with `℘y = x` at full length, which exists only for `x ∈ ℘W(K)`. The stated hypothesis is the length-`n` equation, "`hy : WittVector.truncate n (WittVector.frobenius y - y) = WittVector.truncate n (…)`", and README §4.4 records the distinction as a Check (lines 1626–1629). README §4.4 (lines 1559–1565) now gives the finite-support form, so the README's generality equals the Lean's. The repair also added the finite-length reduced-representative theorem `aswReduced_exists_unique_length` (README lines 1178–1182, Lean lines 179–191), which the docstring had likewise called not statable.
- **R02 (P3), §4.6 restated the supplier's scheme theorem — repaired.** README lines 1749–1754: "Scheme structure is RelativeJacobiansAndIntegralCurveModels §1.8 applied over `Spec k` … What this target adds to the supplied algebraic spaces is that affineness, geometric connectedness, the torsor structure, the dimension and the forgetful-map compatibilities." §1.8 is cited in the scope (line 177), the supplier contract (lines 549–552), the *Needs* line (1782) and the Layer 4 *Dependencies* (2090). The section resolves at that roadmap's open head (README line 447, with the locally finite-type form and the Check over a field).
- **R03 (P3), finite multiplicities not on the cited page — repaired.** README lines 3039–3042 now cite Morris II §5.5 for the decomposition, §6.5 for the finite-dimensional `K`-type spaces, and Morris I §5.8 for the cuspidal part. Checked: morris2 line 1300 (§5.5, p. 1145), lines 1980–1990 (§6.5, pp. 1163–1164), morris1 lines 629–637 (§5.8, Theorem on p. 107: a discrete sum of irreducibles, each with finite multiplicity).
- **R04 (P3), the description names a roadmap that exists nowhere — settled, not raised again.** The description still reads "FiniteFieldsAndCharacterSums". The author's reply to the previous review answered it as correct but outside the two files of the folder; that reason holds, and the folder's own *Downstream consumers* section names only roadmaps that exist. It does not count against this folder.

## Verified sound

### Gate, dependencies, scope

The gate, rerun on this head:

```text
gate FunctionFieldArithmetic: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

The dependency check (`gate --depcheck … --movable`):

```text
depcheck: 235 roadmaps, 2266 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line. The roadmap is at position 356 of the merge order; its latest suppliers are LubinTateFormalModulesAndQuasiCanonicalLifts (345), MetaplecticAutomorphicForms (150), WeilConjectures (125) and RelativeJacobiansAndIntegralCurveModels (73). The diff outside the folder is empty; the folder holds `README.md`, `Suggested.lean` and `metadata.toml`. The branch's `lake-manifest.json` has the same revisions as main's (Tau Ceti `2fd255d9`).

Ownership was checked against the open roadmap pull requests whose files the brief supplies. The overlap report lists no changed, dropped or revision-only id. Artin–Schreier–Witt theory of fields, reduced Witt–Laurent representatives and the conductor formula have no other owner: the ClassFieldTheory revision leaves them out by name (its README lines 187 and 236), PhiGammaModulesAndIwasawaCohomology's Artin–Schreier–Witt equivalence is the statement for perfect `𝔽_p`-algebras and local systems, a different object, and FunctionFieldArithmeticPartII states neither. No `Suggested.lean` on main or at an open head declares any of this file's theorem names.

### Lean

- **Elaboration.** `lake env lean` on `Suggested.lean`: 16 `declaration uses sorry` warnings and nothing else.
- **Signatures.** `#check @name` for all 26 declarations in one scratch file, each compared with its README statement. Nothing lost a binder and nothing needs to change. For the two new theorems:
  - `aswReduced_exists_unique_length` carries `[Finite k]`, `[CharP k p]`, `[CharP (LaurentSeries k) p]` and `[Algebra (ZMod p) k]`. The last two are needed binders, not redundant ones: no `CharP` instance for Laurent series exists at the pins (Tau Ceti derives it locally, `RingTheory/LaurentSeries/LocalField.lean:111`), and Mathlib's `ZMod.algebra` is not an instance. Both are subsingleton data, as the docstring says.
  - `aswConductor_eq` carries no `[CharP L p]`, correctly: `WittVector.frobenius` is defined for every commutative ring, and `L` has characteristic `p` as an extension of `k((T))`.
- **Padding probe.** Each `sorry` replaced by `first | rfl | infer_instance | (simp; done) | (intros; simp_all; done) | (intros; exact?) | (intros; trivial) | sorry` on a scratch copy. None of the 16 theorems closed: 15 fell through to `sorry`, and `zeta_eulerProduct` ran out of heartbeats inside `exact?`. No padding.
- **Headlines.** End theorems named by the summary: §5.3, §4.2, §4.10, §§6.4–6.5, §7.6.
  - Stated: §5.3 (`zeta_rationality`), §4.2 (`localAbelianExistence_all`, `injective_artinMap_all`, `localAbelianExistence_laurentSeries`), and further §0.2, §1.2, §3.1 (three), §3.2 at finite length, §4.4, §§5.1–5.2, §5.6, §5.8.
  - Named in the docstring with the missing carrier: §2 (completed adelic lattices), §3.2 at infinite length (no topology on `W(k((T)))`), §4.3, §§4.1–4.2 Lubin–Tate statements, §§4.7 and 4.10 (generalized Picard schemes, Lang covers), §5.7, §§6.4–6.7, §§7.1–7.6. I found none of these statable at the pins: Tau Ceti has repartitions but no completed function-field adeles, no Lubin–Tate module (the only hits for the name are docstrings and `FormalGroup/Rigidity.lean`), and no zeta function or `L`-polynomial of a function field.

### Pinned declarations opened (Tau Ceti `2fd255d9`, Mathlib at the manifest pin)

| Declaration | File:line | What I confirmed |
| --- | --- | --- |
| `ClassFieldTheory.conductorExponent` | `NumberTheory/ClassFieldTheory/Local/Conductor/Basic.lean:89` | binders at 80–82: finite separable `L/K` only; `Nat.find` of `U(K,n) ≤ normGroup K L`, so `0` for `L = K` and for unramified `L` |
| `conductorExponent_le_iff` | same file, 113 | `c ≤ n ↔ U(K,n) ≤ normGroup` |
| `LaurentSeries.isNonarchimedeanLocalField` | `RingTheory/LaurentSeries/LocalField.lean:118` | an instance under `[Finite K]`, which is why `conductorExponent (LaurentSeries k) L` elaborates |
| `TruncatedWittVector.out` | Mathlib `RingTheory/WittVector/Truncated.lean:98` | zero-padded lift `W_n(R) → W(R)` |
| `WittVector.teichmuller` | Mathlib `RingTheory/WittVector/Teichmuller.lean` | `R →* 𝕎 R` for every commutative ring |

The 20 declarations of the previous review's table (reciprocity, existence in characteristic zero, Herbrand, Hasse–Arf, genus, class number, expansions, descent, point topology, additive Hilbert 90) are unchanged at the same pin and were not reopened.

### Cross-roadmap citations resolved this round (heading, README line at the cited copy)

- RelativeJacobiansAndIntegralCurveModels (open head): §1.3 (300), §1.4 (331), §1.5 (358), §1.8 (447).
- LubinTateFormalModulesAndQuasiCanonicalLifts (board package, merge order 345): §0.1 (292), §0.2 (341), §§1.1–1.4 (472–568), §§2.1–2.5 (605–717); it names this roadmap as a consumer at line 1854. This resolves the resolver's one lead.
- AutomorphicLFunctionsAndLocalFactors (open head): AL.0.1.7 (369), AL.0.1.8 (385), AL.0.3.1 (483), AL.0.6.1 (579), AL.R.3 (615), AL.3.4.1 (1632), AL.3.10.4 (1940), AL.3.14.1 (2211).
- ArithmeticGaloisDuality (open head): R02.3.2 (2074), *Function-field places, ideles and `S`-units* (2076), *The class formation of a global function field* (2245).
- ArithmeticGaloisRepresentations §5.13 (3828); DeligneWeightsAndPurity §3.7 (1262); WeilConjectures §5.20 (1080); GeometryOfNumbersAndQuadraticArithmetic §3.1 (843), §3.2 (879); AdelicAlgebraicGroups Layer 0 (633); SmoothRepresentationsOfLocalGroups SR.4.1 (3191), SR.4.4 (3459); MetaplecticAutomorphicForms §2.5 (520), §3.2a (606), §3.3 (618), §3.3b (646); all at open heads.
- SchemeAndStackFoundations §3.6 (5015) and §3.7 (5052) with `picardComponent_point_iff`, `abelMaps_highDegree` and *picardComponent_test_conic* present at the open heads; EtaleCohomologyFoundations F.2.5 (994), F.10.2 (1407), F.10.3 (2094) at its open head.
- On main: ReductiveGroupsPartII Layer RG2.0a (943); PadicMeasuresIwasawaAlgebras §5.1 (3172, `detLine_acyclic` at 3250).

That is 45 headings resolved; none is missing or renumbered.

### Seeded sample: locators checked against the text

| Target | Locators | Result |
| --- | --- | --- |
| 0.1 | yu lines 366–373 (§2.2.1, p. 8: the degree with its minus sign); yu line 569 (§2.3.4, p. 12: `|g| = q^(deg det g)`) | Correct |
| 0.2 | roquette (waived) | Not verifiable |
| 1.1 | hess (uncertified) | Not verifiable |
| 2.2 | parshin lines 415–420 (§2.2, p. 10: `μ(O) = q^(1−g)`, `μ(A(D)) = q^(1−g+deg D)`, formulas (9) and (10)) | Correct |
| 3.1 | kw line 276 (Proposition 3.1, p. 6); line 280 (Theorem 3.2, p. 6); line 362 (Theorem 3.4, p. 8); goss (uncertified) | Correct; Goss not verifiable |
| 3.2 (changed) | kw lines 720–736 (Proposition 4.3, p. 15, with (i)–(iii)); kw line 594 (proof of Proposition 3.10, p. 12: `℘W + p^iW = V^iW + ℘W`, the step the finite-length reduction uses) | Correct |
| 4.1 | yoshida lines 245, 264, 293, 331, 466, 471, 572, 892, 1049 (Lemma 3.4 p. 416; Prop. 3.5 p. 417; Cor. 3.7 p. 418; Prop. 4.4 p. 419; Def. 5.3 and Prop. 5.4 p. 423; Prop. 5.10 p. 425; Prop. 6.14 p. 433; Prop. 8.1 p. 436) | Correct (the cached file's page `k` is printed page `k + 409`) |
| 4.4 | kw lines 1074–1080 (§4.5.1, p. 21); 1135–1138 (Theorem 4.12, p. 21); 1169–1180 (Lemma 4.13 and the normalization, p. 22); 1184–1199 (Proposition 4.14, pp. 22–23, `u_n` as displayed in the README) | Correct; the clamp correction is confirmed (Source issues) |
| 4.7 | guignard lines 794–824 (Propositions 4.11–4.12, pp. 1319–1320); 830–864 (Proposition 4.14, pp. 1320–1321, `d ≥ N + 2g − 1`); russell lines 1654–1684 (§3.3, Theorems 3.24–3.25, p. 34) | Correct |
| 4.10 | conrad_geom line 157 (Theorem 3.2, p. 4); milne lines 5026, 5048 (Corollaries A.8–A.9, pp. 132–133); 5072, 5107, 5152 (Lemma A.10, Propositions A.11–A.12, pp. 134–135, the last running on to p. 136); kw Proposition 4.14 as above | Correct (the cached file's page `k` is printed page `k − 8`) |
| 5.2 | roquette (waived) | Not verifiable |
| 6.3 | morris1 lines 534–547 (§5.4, p. 104, citing SGA 3 XXVI 2.1 and Borel–Tits 3.17); 458–460 (§4.5, Proposition, p. 102); sga3 line 240 (XXVI, Proposition 2.1); borel_tits line 1109 (Théorème 3.17); bhkt line 1583 (§8.1, p. 34); ciubotaru_harris page 8 | Correct |
| 6.5 | ciubotaru_harris line 390 (Proposition 3.1, p. 8); line 412 (Lemma 3.2, p. 9); bhkt lines 1593–1598 (Proposition 8.2, p. 35); morris1 lines 529–610 (§§5.3–5.6, pp. 104–106) | Correct |
| 6.7 | yu line 1934 (Lemme 5.3.3, p. 36); line 2033 (end of proof, p. 38) | Correct |
| 7.2 (changed) | morris2 lines 1300, 1980–1990; morris1 lines 629–637 | Correct (R03 above) |
| 7.3 | fyz lines 402–447 (§2.2, (2.1)–(2.4), p. 9; the section runs on to p. 10) | Correct |
| 7.6 | fyz lines 660–710 (§2.6, (2.10)–(2.12), Theorem 2.8 and proof, pp. 14–15; (2.12) agrees term by term with the README display, and (2.14)–(2.15) give `|det α|_{F′} = q^(deg 𝓔)` as the README says) | Correct |

The README flags no locator as unverified.

### Adversarial table

Instances are new to this round unless marked.

| Statement | Instances | Values computed (both sides) / wrong-model control | Result | Change |
| --- | --- | --- | --- | --- |
| 0.1 degrees, constant-field reciprocity | `d_v = 3`, `r = 6` | `gcd = 3` completion factors of degree `2`, sum `6 = r`; `φ³` has order `2` on `𝔽_{q⁶}`; `deg = 3`, `deg_Yu = −3`, `|π_v| = q^(−3)` | Pass | None |
| `exists_divisor_degree_eq_one` | `y² = −(x³−x)² − 1` over `𝔽₃` (genus 2) | no rational point (right side `−1` at every `x ∈ 𝔽₃`, leading coefficient a non-square at infinity); Weil gives `N₃ ≥ 28 − 20.8 > 0`, so a place of degree 3; canonical degree `2`; `3 − 2 = 1` | Pass | None |
| 1.1 two charts | `k(t)`, `D = ∞ − [0]`; shift `r = 1` | `ord₀ a ≥ 1`, `ord_∞ a ≥ −1` gives `k·t`, dimension `1 = deg D + 1`; `L(2∞ − [0]) = span(t, t²)`, dimension `2` | Pass | None |
| 2.2 volumes | `𝔽_q(t)`, `ω = dt`, `v` of degree 3, `D = [v]` | `μ = q⁴ = q³·μ(A(0))`; dual lattice `A(−2∞ − [v])` has `q^(−5+1) = q^(−4)`; product `1` | Pass | None |
| `witt_additiveHilbert90` | `L = F = 𝔽₂`, `n = 1`, `σ = 1` | `ker(1−σ) = W₁(F) = range i`; `range(1−σ) = 0 = ker Tr` (trace is the identity); `range Tr = W₁(F)` | Pass | None |
| `exists_addEquiv_aswQuotient_characters` | `F = 𝔽₄`, `p = 2`, `n = 1, 2` | `℘𝔽₄ = {0,1}`, quotient of order `2 = #Hom(Ẑ, ℤ/2)`; `#W₂(𝔽₄) = 16`, `ker ℘ = W₂(𝔽₂)` of order `4`, quotient of order `4 = #Hom(Ẑ, ℤ/4)` | Pass | None |
| `aswReduced_exists_unique_length` | `n = 0`; `k = 𝔽₂`, `n = 1, 2`; lift independence | `ZMod 1` and `ℕ →₀ (Fin 0 → k)` are singletons and `Q₀ = 0`, so `∃!` holds; `n = 1`: `K/℘K` has basis `1, T^(−i)` (`i` odd) over `𝔽₂`, `α = 1` has trace `1`; `n = 2`: `[T⁻¹]` has order `4`, matching a free `ℤ/4`-coordinate; `V^n u − p^n u = ℘(V^n Σ_{j<n} F^j u)`, so two lifts give one class. Wrong model: pole orders divisible by `p` allowed gives `[T^(−p)] ≡ [T^(−1)]`, two representatives | Pass | None |
| 4.1 ramification | `Q = 4`, `m = 2` | degree `12`; displacements `1, 4`; lower orders `12, 4, 4, 4, 1` at `0…4`; `φ(3) = (4+4+4)/12 = 1`, so upper orders `12, 4, 1`, equal to `#U⁰/U²`, `#U¹/U²`, `1` | Pass | None |
| `localAbelianExistence_all`, `injective_artinMap_all` | carried: `𝔽_p((T))`, `H = ⟨𝔽_pˣ, T, 1+T²O⟩`; non-open index `p` | index `p`; `U¹/(U¹)^p` infinite compact, so `IsOpen` is needed | Pass | None |
| `aswConductor_eq` | `p = 2`, `x = [T⁻¹] + 2[T⁻³]`, `n = 1, 2, 3`; `n = 0`; `c₀` only; `x = p[T^(−m)]`, `n = 2`; equal breaks | `n = 1`: `1 + 1 = 2`; `n = 2`: `1 + max(1·2, 3·1) = 4`; `n = 3`: `1 + max(4, 6) = 7` (the length-3 layer of `2[T⁻³]` is the length-2 layer of `[T⁻³]`, conductor `1 + 3·2 = 7`). `n = 0`: `Fin 0` is empty, `adjoin ∅ = ⊥ = ⊤` forces `L = K`, both sides `0`. `s = ∅`: unramified, `0`. `1 + m·p⁰ = m + 1`, the length-one value. Two terms cannot tie: `i p^a = i′ p^b` with `p ∤ i i′` forces `a = b`, `i = i′`, so the maximum is the conductor of the sum. Natural subtraction `n − v i − 1` is exact on the filter `v i < n` | Pass | None |
| `generalizedPicard_schemeStructure` (changed) | `N = 1`; `m = 0`; `m = 3[∞]` on `ℙ¹`, `p = 2` | relative dimension `N − 1 = 0`, an isomorphism; identity map; kernel `{1 + bT + cT²}` of dimension `2 = N − 1 = N − r`, and `(1+bT)² = 1 + b²T²`, so not `𝔾_a²`, as the README allows. Affine over the separated `Pic_X` gives the separatedness §1.8 needs | Pass | None |
| `rayAbel_affineBundle` | `ℙ¹`, `m = 3[∞]` | bound `2g + N − 1 = 2`; rank `n − N − g + 1 = 0` at `n = 2`, `1` at `n = 3`; Guignard 4.14 has `d ≥ N + 2g − 1` | Pass | None |
| `finiteRayLangCover_classifies` | `ℙ¹`, `m = 0`, `B = ℤ/6`, `θ = deg` and `θ = 3·deg` | onto: connected, constants `𝔽_{q⁶}`, `c = 6`, norm group `deg⁻¹(6ℤ)`; image of index `3`: three components, each a constant quadratic cover | Pass | None |
| `effectiveDivisorCount_of_large` | `y² = x³+x+1` over `𝔽₅`, `n = 2`; `g = 1`, `n = 0` | `A₂ = 31 + 18 + 5 = 54` from the series; `4·54 = 216 = 9·(25 − 1)`; `2g ≤ n + 1` is `2 ≤ 1`, false, and indeed `A₀ = 1 ≠ 0` | Pass | None |
| `zeta_rationality` | same curve | `P = 1 + 3T + 5T²`: `coeff 2 = 5¹·1`, `coeff 1 = 9 − 6 = 3`, `P(1) = 9 = h`, degree `2 = 2g` | Pass | None |
| 6.3 constant term weights | Heisenberg group of order `p³`, `Γ = J = {(x,0,0)}` | `p` orbits of mass `1/p²` and `p − 1` of mass `1/p`; total `1/p + (p−1)/p = 1` | Pass | None |
| 6.5 integral model | `R = ℤ[1/p] ⊂ C` | `R → Frac R → C` is flat; `ℤ[1/3] → 𝔽₂` is not, and `2x = 0` changes kernel | Pass | None |
| `cuspForm_exists_degreeZero_ne_zero` | `n = 3`, `g = 2` | valuation degree of `det t` is `−3·(2g−2) = −6`; Yu degree `+6`; scalar `a^(−2)` has `det` Yu degree `−6`; total `0`; Yu's printed sign gives `12` | Pass | None |
| `fourierCoefficient_factor` | `n = 2`, `g_X = 0` | `n` diagonal coordinates give `q^(−2)`, one off-diagonal gives `q^(−2)`; `μ_int = q^(−4) = q^(n²(g−1))`; prefactor `q⁴` | Pass | None |
| `fyz_globalCoefficient` | `n = 2`, `X = ℙ¹`, self-dual | `−n² deg ω_X / 2 = +4`, equal to the §7.3 prefactor; exponent `−deg 𝓔 (s − 1)` equals `|det α|^(−s+1)` with `|det α| = q^(deg 𝓔)`, as fyz (2.14) | Pass | None |

## Not verifiable

- **roquette** (waived): §4.3.3, pp. 25–28, and §8.1, the locators of §§0.2, 5.1–5.3 and 5.6 (sampled: 0.2 and 5.2). Settled; no request made.
- **hess** (uncertified): Lemma 1, Corollaries 3–4, Theorem 7, Proposition 9, Remark 10, Corollary 11 (sampled: 1.1). Settled.
- **goss** (uncertified): §1.1, Example 1.1.1 and Proposition 1.1.2, p. 1 (sampled: 3.1). Settled.
- **rosen**, **stichtenoth**, **sga4half** (uncertified): cited by locator only; outside the sample.

No new reference was requested.

## Source issues

- **Error** in kw at Theorem 4.12, p. 21, and Proposition 4.14, p. 23 (kw lines 1136–1138, 1191): the source uses the exponent `⌈log_p(r/i)⌉` as it stands, which is negative when `i > r`; it should be `max(0, ⌈log_p(r/i)⌉)`, since the unit generators have `j ≥ 0`; affects a stated result.
