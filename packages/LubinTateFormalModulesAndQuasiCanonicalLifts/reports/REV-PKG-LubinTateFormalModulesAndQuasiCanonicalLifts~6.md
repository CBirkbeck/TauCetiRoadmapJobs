<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6849379847 -->
Review (claude) of cd2af0a

Verdict: needs_changes

1. **F01** (P3) §5.5 uses an `O₀`-action on the elliptic formal group that it does not state

   **Location.** `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:1535–1542`: "Let
   `G` be the formal completion of an elliptic curve `E` over `R` at the zero section … an
   `O₀`-stable subgroup `C_L = H(K̄)` of `G[ϖ₀^∞](K̄)`, as always when `O₀ = ℤ_p`".

   **Claim.** The comparison is stated for the formal completion of any elliptic curve over `R`, and
   then uses `G[ϖ₀^∞]`, `O₀`-stability and the formal `O₀`-module `G_L`.

   **Witness.** `O₀ = W(𝔽_(p²))`, `E/R` with ordinary reduction: the completion has height one and
   endomorphism ring `ℤ_p`, and there is no ring map `W(𝔽_(p²)) → ℤ_p`. So `[ϖ₀]_G`, `G[ϖ₀^∞]` and
   `G_L` are undefined. Also `K̄` (lines 1414, 1541) is used before the layer names a field `K`.

   **Repair.**

   - In the Layer 5 header (line 1406) write "over the integers `R` of a finite extension `K` of
     `F₀`, with `K̄` a fixed algebraic closure of `K`".
   - Replace the first sentence of §5.5 by: "Let `E` be an elliptic curve over `R` whose formal
     completion at the zero section, in a parameter `X` (ModularCurves §7C), is the formal group
     underlying the formal `O₀`-module `G`. For `O₀ = ℤ_p` this is every elliptic curve over `R`,
     with the unique `ℤ_p`-action of its formal group; for `O₀ ≠ ℤ_p` the `O₀`-action on the
     completion is part of the data, as for the curve of §4.4. Let `H ⊂ E` be …".
   - In the conclusion write "is canonically isomorphic, as a formal group, to the formal group
     underlying `G_L`, whose `O₀`-action is the one transported by this isomorphism".

   **Repair test.** The ordinary curve with `O₀ = W(𝔽_(p²))` is now excluded by the stated data
   instead of leaving the objects undefined. For `O₀ = ℤ_p`, `E` supersingular and `H = E[p]`:
   `L = p⁻¹T`, and both sides are `[p]` up to the target coordinate, as the existing Check says. For
   the §4.4 curve with `O₀ = W(𝔽_(p²))` the action is the stated datum and the order-`p` Check
   (an `𝔽_p`-line in `𝔽_(p²)` is not `O₀`-stable) is unchanged.

2. **F02** (P3) four `*Needs:*` lines omit a section their statement names

   **Location.** `README.md:1196` (§3.6), `:1220` (§3.7), `:1844` (§7.2), `:1874` (§7.3).

   **Claim.** Each `*Needs:*` line lists what the statement and its route need, item by item.

   **Witness.** §3.6 extends the functor "to the coefficient bases of §3.1" (line 1174) and §3.7
   compares with "the deformation functor of §3.1" (line 1203); neither lists §3.1. §7.2 takes the
   modulus "in the deformation space of the twist … (§6.6)" (line 1822) and §7.3 defines `Ψ′_s` as
   "the field of moduli of §6.6" (line 1850); neither lists §6.6.

   **Repair.** Line 1196: "*Needs:* §§3.1, 3.4, 3.5; …". Line 1220: "*Needs:* §§3.1, 3.6, 2.1; …".
   Line 1844: "*Needs:* §§7.1, 6.6, 3.6, 5.2." Line 1874: "*Needs:* §§7.1, 6.6, 6.2, 6.5, 2.4." The
   layer Dependencies already list these sections (Layer 7 has §§6.2–6.6); add §3.1 nowhere else, it
   is internal to Layer 3.

   **Repair test.** A scripted comparison of the sections named in each statement with its
   `*Needs:*` line, run over all 50 targets, reports only these four once Checks and forward pointers
   are set aside; after the edit it reports none.

3. **F03** (P3) two Checks comment on an earlier Check instead of stating the test

   **Location.** `README.md:698–699` (§1.3): "A wrong Check that forbids this for every `O`
   contradicts §1.3." `README.md:723–724` (§1.4): "A Check calling every unit comparison non-strict
   fails at `u = 1`."

   **Claim.** The README is timeless: a reader cannot tell which parts were contentious.

   **Witness.** Both sentences speak about a Check that is not in the text; they record that an
   earlier version had it.

   **Repair.** Line 698–699: "The statement that the additive law is never a Lubin–Tate module
   would be false here." Line 723–724: "The statement that every unit comparison is non-strict would
   fail at `u = 1`."

   **Repair test.** The computed content of both Checks is unchanged (`f = tX + X^q` over
   `𝔽_q[[t]]` is additive; `u = 1` gives `X`, `u = 3` gives `(1 + X)³ − 1` over `ℤ₂`); a search for
   "Check" inside Check bullets then returns nothing.

Three findings, all P3, none blocking. The previous round's P1 (formal spectrum used as the finite
group scheme) is repaired, and the mathematics of the repaired passages holds on every instance
computed below. The three findings are a hypothesis left implicit by that repair in §5.5, four
`*Needs:*` lines that omit a section their statement names, and two Checks worded as comments on
an earlier Check.

## Verified sound

### Previous finding, checked first

| Previous finding | Repaired passage | Status |
|---|---|---|
| F01 (P1): `G[π^m] = Spf R[[X]]/([π^m]_G)` called a finite locally free group scheme | §2.1, lines 749–752: "Put `A_m = R[[X]]/([π^m]_G)` … Define the torsion group scheme `G[π^m] = Spec A_m` over `Spec R`, the ordinary spectrum, with the Hopf `R`-algebra structure on `A_m` given by the formal law" | **Repaired.** Retested on `μ₃/ℤ₃` below. |

The same pattern in the rest of the package: §2.2 (line 827–829) now takes geometric points of the
generic fibre of `Spec A_m`; §5.1 (lines 1417–1419) takes the schematic closure inside the base
change of `Spec A_m`; §5.5 was rewritten around a subgroup scheme `H ⊂ E` (R01 concerns what that
rewrite left implicit). The only remaining `Spf` is the formal Lie group `Spf R[[X]]` and the
negative-control Checks. The repair report marked nothing "not actionable".

### Adversarial table

Rows cover the repaired passages, the fifteen sampled targets, the headline theorems and the
targets a finding touches. Untouched sections keep the computed rows of the round-5 table, which
I did not recompute except where listed here.

| Statement | Instances tried | Values computed | Result; change |
|---|---|---|---|
| §2.1 rank and Hopf structure (repaired) | `Ĝ_m/ℤ₃`, `m = 1`; `m = 0`; `𝔽₃[ε]/ε²` | `[3] = 3X + 3X² + X³`, `A_1 = ℤ₃[T]/(T³−1)`, rank 3 = `3^(1·1)`; `Δ(T) = T⊗T`, `S(T) = T²`, `T·T² = 1`. Primes of `Spec A_1`: `(T−1)`, `(T²+T+1)` (`−3` has odd valuation, not a square in `ℚ₃`), `(3, T−1)`: 3 points; `Spf`: 1 point. `m = 0`: `R[[X]]/(X) = R`. Square-zero base: `[3] = X³`, rank 3 | Holds |
| §2.1 `X^(q^(hm)) ∈ 𝔪_R A_m` | Weierstrass form `P = X^d + (coefficients in 𝔪_R)` | `X^d = −(lower terms) ∈ 𝔪_R A_m`; `π ∈ 𝔪_R` because `π^e` is `p` times a unit and `p ∈ 𝔪_R` | Holds |
| §2.1 exact sequence and `p`-levels | `m = n = 1`; `K` with `e, f` | ranks `q^(hm)·q^(hn) = q^(h(m+n))`; rank of `G[p] = G[π^e]` is `q^(he) = p^(h·ef) = p^(h[K:ℚ_p])` | Holds |
| §2.2 Tate module (sampled) | `Ĝ_m/ℤ_p`; Lubin–Tate over `W(𝔽_(p²))` | `T/p^m T = ℤ/p^m`; `O_K`-rank 1, `ℤ_p`-rank 2; direct limit `ℚ_p/ℤ_p` is not free | Holds |
| §5.1 closure independent of `m` (repaired) | `L = T`; `L = ϖ₀⁻¹T` in levels 1 and 2 | trivial subgroup in `Spec R`; `G[ϖ₀]` closed and flat in `G[ϖ₀²]` with the same generic fibre | Holds |
| §5.5 (repaired) | supersingular `H = E[p]`; ordinary `E[p]`; order-`p` `H` in the §4.4 curve; ordinary `E` with `O₀ = W(𝔽_(p²))` | rank `p²`, `L = p⁻¹T`; ordinary `E[p]` has `p` points in its special fibre, excluded; `𝔽_p`-line in `𝔽_(p²)` not `O₀`-stable; no ring map `W(𝔽_(p²)) → ℤ_p` | Statement holds where defined; **R01** |
| §0.2 point module (sampled) | `x = y = p` in `Ĝ_m(pℤ_p)`; `I = 9ℤ₃` | `F(x,y) = x + y + xy·g(x,y) ∈ I` for any ideal `I` (no closedness needed); `2p + p²`; `√(9ℤ₃) = 3ℤ₃ ∋ 3 ∉ 9ℤ₃` | Holds |
| §1.4 coordinate independence (sampled) | `f = πX + X^q`, `g = f + πX²`, including `q = 2`; `u = 3` over `ℤ₂` | `X²`: `πc + [q=2] = π + [q=2] + cπ²`, so `c = (1−π)⁻¹`; `(1+X)³−1` commutes with `(1+X)²−1`, derivative 3 | Holds; wording **R03** |
| §1.2 interpolation headline | odd `p`, `f = (1+X)^p − 1`, `g = pX + X^p` | `pc + p(p−1)/2 = p²c`, `c = 1/2` | Holds |
| §1.3 Lubin–Tate theorem headline | non-complete DVR; non-commutative `G` in the uniqueness clause | correction divides a multiple of `π` by `π − π^r = π(1 − π^(r−1))`, a unit multiple of `π` for `r ≥ 2`; uniqueness uses only the linear part `X + Y` | Holds |
| §2.3 degree headline | `ℚ₂`, `f = 2X + X²`, `m = 1, 2` | root `−2`, degree `1 = (2−1)·2⁰`; `X² + 2X + 2` Eisenstein, degree 2; `t = 0` fails primitivity | Holds |
| §2.5 Artin comparison (sampled, headline) | `m = 0`; `π′ = uπ` | `f^{∘0} = X`, only root 0, right side `π^ℤ·O_K^× = Kˣ`; `χ_(π′)(Art(π)) = χ_(π′)(Art(π′u⁻¹)) = u` | Holds; agrees with the pinned `ℚ_p` case (below) |
| §2.6 change of uniformizer (sampled) | inertia; a Frobenius lift; `Art(π′)` | `σθ(t) = θ^σ(σt)`: on inertia `χ_(π′) = χ_π`; on a Frobenius lift `θ^Frob = θ∘[u]` gives `χ_(π′) = u·χ_π`; `χ_π(Art(π′))·η_u = u⁻¹·u = 1`; `η_u⁻¹` would give `u⁻²` | Holds |
| §3.2 coefficient algebra (sampled) | degree `q^j − 1` | with `c_a = ((a^(q^j) − a)/π)·g`, `c_π = (π^(q^j − 1) − 1)·g`, a unit multiple of `g` | Holds |
| §4.1 Honda operators (sampled) | `ℓ = Σ (−p)^(−j) X^(p^(2j))` | `(p + T²)`: `p(−p)^(−j) + (−p)^(1−j) = 0`; `(p − T²)`: `2p(−p)^(−j)`, `2/p` at `j = 2` (equal to `1 ∉ 2O` at `p = 2`) | Holds |
| §4.4 elliptic headline | `y² + y = x³` over `ℤ₂` | `#E(𝔽₂) = 3` (`x = 0`: two points; `x = 1`: none; infinity), `a₄ = 0² − 4 = −4`, `#E(𝔽₄) = 9 = 4 + 1 + 4`, `s = −1` | Holds |
| §5.2 lattice quotients (sampled) | `Ĝ_m`; reduction | `X −_G c = (X − c)/(1 + c)`; `Ḡ_L(X^Q, Y^Q) = Ḡ(X,Y)^Q`, the `Q`-Frobenius twist | Holds |
| §5.4 descent (sampled) | unramified quadratic, level one | stabilizer of a `k_(F₀)`-line in `k_F^×` is `k_(F₀)^×`; degree `(q₀²−1)/(q₀−1) = q₀+1`; at `q₀ = 2` both degrees are 3; `[O_F^× : O_1^×] = q₀+1` | Holds |
| §6.2, §6.3 (sampled) | `a = π_F^k u`; cubic order `O₀ + ϖ₀O_F` | reduction `Frob^k∘[ū]`, the twist identification only for `u = 1`; lengths `3 ≠ 2·1`, not Gorenstein | Holds |
| §7.2 modulus (sampled) | `ℚ₃(π)`, `π² = 3` | `[π]∘[π] = 3X + (π + π³)X³ + 3π²X⁵ + 3πX⁷ + X⁹`; vertices `(1,2), (3,1), (9,0)`; `v(t_s) ≤ 1/q₀ < v(𝔪_B)` | Holds; `*Needs:*` **R02** |
| §7.3 BKO fields (sampled) | `p = 5` | degrees `6, 30`; `24 > 6` | Holds; `*Needs:*` **R02** |
| §8.3 `Θ_n`, `Ψ_n` (sampled) | `n = 0, 1`; a lift `j` of `c` | `(p²−1)p^(2n)/(p²−1) = p^(2n)`, `p^n`; `j² = (j²)⁻¹` in torsion-free `G⁻`, so `j² = 1` | Holds |
| §8.4 rectangle | index count | `[O^×:H′_s] = p^(s−1)(p+1)`, `[O^×:H_s] = p^s`, product group of index `p^(s−1)`, so the intersection has index `p^s(p+1) = [Ψ′_(s+1):Φ]` | Holds |
| §9.3 trace square (sampled) | `p = 5`, `s = 0`, `ℓ_H(x) = 25` | both routes `[30]x`, logarithm 750; with labels `1 → 0`: `−750` on both sides, `+750` without the correction | Holds |
| §3.6, §3.7 | — | statement names §3.1 | `*Needs:*` **R02** |

### Sources: the seeded sample

Five texts were read in the sources cache this round (VZ07, H70, Y95, G86, BKO21); LT66 and H68 are not in
the sample and keep the round-5 checks; LT65 is settled as uncertified and was not requested.

| Target | Locator checked | Result |
|---|---|---|
| 3.2 | VZ07 Theorem 1.4 and proof, pp.58–59 (VZ07 lines 2739–2792) | Statement and the `h(π)` generator in `q`-power degrees are there. Definition 1.1 is on pp.57–58 (lines 2697–2712). |
| 4.1 | H70 §2, condition (F), special elements, type, pp.220–221 (H70 lines 305–354) | Agrees; completeness is expressly not assumed (line 312–313); the well-definedness remark is on p.221 (line 329). |
| 2.2, 5.2 | Y95 §3, pp.295–296 (Y95 lines 116–140) | Tate module free of rank the height; Serre product and Frobenius-twist marking. |
| 5.4, 6.2 | Y95 §4, p.296 (lines 156–175); G86 §5, pp.324–325 (G86 lines 180–203) | Unit action `m_(a⁻¹L) = m_L^((a,K))`; `π^ℤ` lattice classes; rationality over the stabilizer's fixed field. |
| 6.3 | Y95 Propositions 1–2, p.297 (lines 186–211); corollary, p.298 (lines 227–230) | As stated. |
| 7.2 | G86 Proposition 5.3(3), pp.325–326 (lines 210–233); Y95 Theorem 2′, pp.301–302 (lines 350–376); §§9–10, pp.305–309 (lines 460–583) | As stated, for levels `s ≥ 1`; the canonical Newton polygon `(1,e), (q^f, e−1), …` is at line 361–362. |
| 7.3 | BKO21 §5.0.2, pp.958–959 (lines 712–736); Y95 Theorem 1, p.297 (line 212) | As stated. |
| 8.3 | BKO21 §2, pp.947–948 (lines 227–252) | `Φ_n` for `n ≥ −1`, `κ`, `Δ`, `G^±`, `Ψ_∞`. |
| 9.3 | BKO21 footnote 2, p.948 (lines 272–281); Definition 5.4 and Theorem 5.5, p.959 (lines 739–768) | The sign remark and the tame sum over `Δ′` are there. |
| 0.2, 1.4, 2.5, 2.6 (and the LT65 part of 2.2) | LT65 | Not read: see Not verifiable. The statements were checked by the computations above. |

All eight cited works are in `sources.toml`, one key each; no entry was added or changed.

### Lean

- **Elaboration.** `lake env lean` on `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/Suggested.lean`
  from the content checkout: exit 0; the only diagnostics are five `declaration uses 'sorry'`
  warnings (lines 77, 91, 113, 129, 151). No build was needed.
- **Signatures.** A scratch copy with `#check @name` for all seven declarations: both predicates
  keep `CommRing` and `IsLocalRing`; the two construction theorems keep `IsDomain`,
  `IsDiscreteValuationRing`, the finite residue field and `Irreducible π`; the two field theorems
  keep `CharZero K`, `1 ≤ m` and `↑ϖ = ↑π`; the elliptic theorem keeps `IsUnit W.Δ` and the point
  count. They match the README statements and the worker's recorded signatures. Nothing changed.
- **Padding probe.** Every sorried theorem was tried with
  `first | rfl | (simp; done) | infer_instance | exact?`: all five end in "`exact?` could not
  close the goal". None restates a definition, mirrors a Check or treats a boundary case. No
  padding.
- **Headlines.** The six end theorems of the Summary: Lubin–Tate existence and uniqueness
  (`exists_formalGroup_of_isLubinTateSeries`, with `existsUnique_lubinTate_intertwiner`); degree
  and norm group of the division fields (`finrank_adjoin_primitive_lubinTate_root`,
  `artinMap_fixes_lubinTate_roots_iff`); the supersingular elliptic formal group
  (`exists_lubinTate_endomorphism_formalGroup`). Representability of marked deformations, the
  classification and fields of moduli of quasi-canonical lifts and the trace-compatible square are
  named in the module docstring with the missing carrier, as are Honda's theorem and the unit
  formula. No statable headline is absent and none is forced through a stand-in.
- **Own names.** The seven backticked names the README attributes to this roadmap are the seven
  declarations of the file. `roadmaps grep` finds none of them in another roadmap.
- **Form.** `import Mathlib` then three used `TauCeti.*` modules; one module docstring; the
  namespace; layer comments; `theorem` only; no `set_option`, no sorry'd data, no `example`.

### Pinned libraries

Every Mathlib and Tau Ceti declaration the README cites was opened at the pins. Paths are relative
to each library.

- Mathlib `RingTheory/FormalGroup/Basic.lean:57, 75, 127, 185` (`FormalGroup`, `IsComm`, `Point`,
  `map`); `RingTheory/PowerSeries/Substitution.lean:158, 457, 511, 543, 567`;
  `RingTheory/PowerSeries/Evaluation.lean:60, 157, 197`;
  `RingTheory/PowerSeries/WeierstrassPreparation.lean:689, 814`;
  `NumberTheory/LocalField/Basic.lean:46`; `Analysis/Normed/Field/Krasner.lean:56, 63`;
  `FieldTheory/AbsoluteGaloisGroup.lean:42, 101`; `FieldTheory/Finite/GaloisField.lean:68`.
- Tau Ceti `RingTheory/FormalGroup/Hom.lean:137`; `…/TopNilpotentPoint/Basic.lean:85`,
  `…/TopNilpotentPoint/Hom.lean:42`; `…/Logarithm/Convergence.lean:44, 57, 62, 68`;
  `…/Exponential/Padic.lean:76`; `…/Rigidity.lean:186, 229`;
  `AlgebraicGeometry/EllipticCurve/FormalGroup/Basic.lean:58, 75, 83`, `…/AdicPoint.lean:69`,
  `…/Point/Hom.lean:149`, `…/Point/AdicCompletion.lean:273, 292`, `…/Point/Range.lean:158`;
  `NumberTheory/ClassFieldTheory/Local/ArtinMap.lean:114, 132, 205, 345, 397`;
  `NumberTheory/LocalField/UnitFiltration/Basic.lean:104`;
  `RingTheory/Henselian/Teichmuller.lean:94`;
  `NumberTheory/NumberField/Global/Approximation/Weak.lean:208`.
- The two names added by the repair:
  `AlgebraicGeometry/AffineGroupScheme/CartierDuality/FiniteLocallyFree.lean:122` and `:139–140`.
  The property is finite, flat, locally of finite presentation and commutative,
  as the contract says (instances at lines 125–135). `AlgebraicGeometry/FormalScheme/Spf/Carrier.lean:92`
  (`carrier_eq_zeroLocus`).
- **Duplication by object.** Tau Ceti already proves the `K = ℚ_p` cyclotomic case of §2.5:
  `TauCeti.ClassFieldTheory.abelianizedLocalCyclotomicCharacter_artinMap_padic`
  (`NumberTheory/ClassFieldTheory/Local/ExplicitCyclotomicSymbol/ArtinMap.lean:272`),
  `χ_cyc(Art(p^k u)) = u⁻¹`, proved without Lubin–Tate theory. It is a special case, so no
  finding; its inverse-unit convention is the one of §2.5 and of the first §2.5 Check. No pinned
  declaration states Lubin–Tate interpolation, the formal module of a series, the division-field
  degree, the general norm group or the elliptic recognition.

### Ownership, suppliers and the merge order

- Supplier sections resolved at their current heads: RelativeFarguesFontaine §2.5 (finite torsion
  fields with scalar action `[a]_LT`, "not its inverse"); GrossZagierAndArithmeticHeights §7.2
  (orbit sizes `q^(s−1)(q+1)` and `q^s`, level 0 one lift);
  EndoscopicTransferAndUnitaryTraceComparison §§10.2, 12.3;
  FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.1, R07.1.8, R07.1.12, R07.1.13, R07.1.20,
  R07.1.20a, R07.2.6–R07.2.8, with all eleven cited declaration names;
  RamificationOfCompleteDiscretelyValuedFields §4a.3. On main: BordismFormalGroups §§F1, F5;
  EllipticCurves Layers 1, 3; ModularCurves §§0B, 0C, 2B, 7C–7F with PD-2, ST-1, ST-2 and the
  fppf-exactness sentence of §0B; ClassFieldTheory Layers 6–8, `localAbelianExistence`, and the
  map from the former §2.6 to Conventions C.6; LocalFieldsRamification (completed).
- The five "found nowhere" leads of the citation audit are planned declarations of
  FiniteFlatGroupsAndIntegralPadicHodgeTheory, present at its head; not findings.
- Consumers AnticyclotomicLocalUnits and ComplexMultiplicationAndExplicitReciprocityPartII cite
  this roadmap as "LT.0–LT.9" and by section titles that are not the package's headings ("Layer k",
  "§2.1 Finite-height torsion"). That is drift on the consumers' side; nothing here changes.
  AnticyclotomicLocalUnits' declared gap `formal-point-completion-realization` on this roadmap is
  what §0.4 states.
- No gap is declared by this roadmap, and none is needed.
- No overlap fact: no other open pull request changes this roadmap, no cited id is dropped, none
  is defined only by an open revision.

Dependency check, exact output:

```text
depcheck: 206 roadmaps, 1901 edges, 0 problem(s)
```

No UPWARD, CYCLE or moved line.

Overlap check: read AnticyclotomicLocalUnits, FiniteFlatGroupsAndIntegralPadicHodgeTheory, FunctionFieldArithmetic, EllipticCurveModularityWild3Adic, BordismFormalGroups (main and its open revision); the main-vocabulary and named-results lists are empty. Shared objects and owners: formal `O`-modules, Lubin–Tate construction, quasi-canonical fields, the towers `Φ_n`, `Θ_n`, `Ψ_n`, `Ψ′_s` and formal traces — this roadmap (AnticyclotomicLocalUnits and FunctionFieldArithmetic import them); formal Lie groups, `p`-divisible groups, schematic closure and quotients — FiniteFlatGroupsAndIntegralPadicHodgeTheory; formal-group algebra and the height-`h` deformation ring over a perfect field — BordismFormalGroups; nothing shared with EllipticCurveModularityWild3Adic.

### Shape and policy

Fifty numbered targets in ten layers, each layer ending with Examples and Dependencies; every
definition has an API list and at least three Checks; every theorem a locator. The layers are
named by their mathematics and no sentence says the plan follows a source. No LaTeX delimiters,
pull-request numbers, dates, machine paths or HTML anchors. No route-specific restriction (`p ≥ 5`
is confined to the BKO layers), no re-planned roadmap, no algorithm.

## Not verifiable

- **LT65** is paywalled and settled as uncertified. Its locators for the sampled §§0.2, 1.4, 2.5,
  2.6 and the LT65 part of §2.2 were not checked against the text.
- **Board packages.** Ownership against the three packages listed in the board index
  (AnalyticNumberTheory, LawrenceVenkateshMethod, LogicAndDefinabilityInNumberTheory) was not
  checked this round; their READMEs are not in this checkout and I did not fetch them.
- **Y95 source issues of the earlier round** (the initial-object claim in §2 and the level-zero
  exception in §6) were not re-derived this round and are not repeated below.
- Elaboration checks the five signatures, not their proofs.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed p.956: the source says trace `±2p` gives Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `p ∓ T²` and parameter `±p`, as its own proof (`φ_q = ±p`) shows; affects a stated result.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says the outward lattices are generated by `(1 + ap^s)/p^(s+1)` times `t`, which is one lattice for all `a`; it should be `p^(−s−1)t + (a/p)αt` with `α` generating `O` over `ℤ_p`; affects the proof.
- **Misprint** in BKO21 at the proof of Theorem 5.5(ii), printed p.959: the source says each outward lattice is a conjugate of `x_s`; it should be a conjugate of `x_(s+1)`; affects the proof.
- **Misprint** in BKO21 at §2, printed p.948: the source says `Ψ_∞` is the maximal dihedral pro-`p` extension of `ℚ_p` in `Φ_∞`; it should be pro-`p` over `Φ` and dihedral over `ℚ_p`; affects nothing.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "cd2af0a12441b2074b903f8a249a4bee2f65b4d7", "job": "REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts~6", "model": "fable", "worker": "chris-x55"} -->
