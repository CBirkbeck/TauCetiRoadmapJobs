<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/13044#issuecomment-6856749714 -->
Red team round 1 pass b (claude) of edc2065

Verdict: needs_changes

**For the human reviewers:** this review raises 2 questions that a human decides (the scope of the roadmap, or a licence). They are in the section of that name at the end and do not change the verdict.

1. **F01** (P1) The supplied Lubin–Tate tower belongs to a differently defined module; the bridge to `F_f` is unowned

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:871-873` ("Identify its division fields and scalar Galois action with the tower of RelativeFarguesFontaine §2.5, through the same-parameter coordinate comparison of §1.4"); also lines 57-60, 251-255, 906-909.

   Claim: §1.4 alone identifies `K(F_f[π^m])` and its scalar action with the supplier's `E_m = E(LT[π^m])`.

   Witness: RelativeFarguesFontaine §2.5 (its README line 1301, and its ownership paragraph, line 136) takes its module from VectorBundlesAndIsocrystals Layer 5, "Lubin–Tate universal cover and sections of O(1)", where `G_LT` is fixed by a Dieudonné-module normalisation (README line 1100 there), not by a Lubin–Tate series. §1.4 compares only `F_f` with `F_g` for two Lubin–Tate series for the same `π`. A height-one formal `O_K`-module over `O_K` is `F_(f′)` for the uniformizer `π′` whose multiplication reduces to the `q`-Frobenius, and for `π′ = uπ`, `u ≠ 1`, its tower is a different field (this README, §2.6). So the identification needs "`[π]_(G_LT)` reduces to `X^q`", which is no target here, no cited section and no pinned declaration. This README never names VectorBundlesAndIsocrystals.

   Repair (tested on `π′ = uπ`: the added statement fails for the module of `π′`, as it must):

   1. In "Taken from other owners", first bullet, and in `### From TauCetiRoadmap.RelativeFarguesFontaine`, add: "The module `LT` of that section is the normalised Lubin–Tate formal `O_E`-module `G_LT` of VectorBundlesAndIsocrystals Layer 5, 'Lubin–Tate universal cover and sections of O(1)'."
   2. In §2.3, before "Prove the primitive-coordinate refinement", insert the target: "Prove that for the module `G_LT` of VectorBundlesAndIsocrystals Layer 5 with `E = K`, in any coordinate over `O_K`, the series `[π]_(G_LT)` is a Lubin–Tate series for `π`: its linear coefficient is `π` by the tangent condition, and its reduction is `X^q` because the `q`-power Frobenius of the special fibre equals `[π]` in that normalisation. Hence `G_LT = F_f` for `f = [π]_(G_LT)` by §1.3, and §1.4 carries the supplied tower and scalar action to those of every Lubin–Tate series for `π`." The repair worker reads the supplier's normalisation at its head and states the Frobenius identity in the supplier's variance.
   3. Add the Check: "For `π′ = uπ` with `u ∈ O_K^×`, `u ≠ 1`, and a Lubin–Tate series `f′` for `π′`, the module `F_(f′)` has height one and `[π]_(F_(f′)) = [u⁻¹] ∘ f′` has linear coefficient `π`, but its reduction is the reduction of `[u⁻¹]` applied to `X^q`, which is not `X^q`, and its tower differs from `K_π` (§2.6): height one alone does not give the identification."
   4. Add "VectorBundlesAndIsocrystals Layer 5 (the normalised module `G_LT`)" to the `*Needs:*` lines of §§2.3 and 2.4 and to the Layer 2 Dependencies. VectorBundlesAndIsocrystals precedes this roadmap in the merge order, so the edge is downward.

2. **F02** (P2) EndoscopicTransferAndUnitaryTraceComparison §12.3 is cited for a functor it does not state

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:272-276` ("§12.3 supplies the corresponding algebraically closed residue-field deformation spaces … identifies the specialization with those same functors by their marked universal properties") and line 1188 ("do the same at its algebraically closed residue base").

   Claim: the §3.1 functor (marking an isomorphism of special fibres) is the §12.3 functor "by the identity on laws, strict actions and markings".

   Witness: EndoscopicTransferAndUnitaryTraceComparison §12.3 (its README line 4596) classifies `(G, ρ, α_m)` with `ρ` an `O_E`-linear quasi-isogeny, and says that at level zero "each quasi-isogeny-height component" is an open ball. The pair `(G, ρ ∘ [ϖ])` is a point of that functor and is no marked deformation in the sense of §3.1.

   Repair: in the supplier contract replace the sentence on §12.3 by "§12.3 supplies the framed deformation spaces over an algebraically closed residue field, framed by a quasi-isogeny; its level-zero component of quasi-isogeny height zero is the functor of deformations marked by an isomorphism." In §3.6 replace "do the same at its algebraically closed residue base" by "over its algebraically closed residue base, identify the functor of §3.1 with the level-zero, quasi-isogeny-height-zero component of §12.3, a marking `ι` being the framing `ρ = ι`." Add the Check: "The framing `ρ = ι ∘ [ϖ]` has height `h ≠ 0` and lies in a different component: the §3.1 functor is one component of the §12.3 space, not all of it." Make the same change at README line 65-68.

3. **F03** (P3) The design's ids `LT.0`–`LT.9` and four target titles, cited by open roadmaps, are dropped without a mapping

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` (whole file: `LT.` occurs 0 times; headings `## Layer 0` … `## Layer 9`, `### 2.1 Finite-height torsion`, `### 2.2 The π-adic Tate module`).

   Claim: consumers can follow this README's numbering.

   Witness: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/design/README.md:68,350,356,374` has `## LT.0.` … `## LT.9.`, "Finite-height torsion comparison", "Formal-module Tate module". Open heads cite them: AnticyclotomicLocalUnits (25 lines, e.g. "LT.2, LT.8"), ComplexMultiplicationAndExplicitReciprocityPartII README line 97 ("LT.2, 'Finite-height torsion comparison', 'Formal-module Tate module', 'Lubin–Tate character'"), ScholzeFunctorAndModpCohomologyOfTheLubinTateTower README line 199 ("'Artin comparison'").

   Repair: add to "How to read the build" the mapping, in this form:

   | Former numbering | Now |
   |---|---|
   | LT.k (k = 0, …, 9) | Layer k |
   | LT.2, "Finite-height torsion comparison" | §2.1 |
   | LT.2, "Formal-module Tate module" | §2.2 |
   | LT.2, "Lubin–Tate character" | §2.4 |
   | LT.2, "Comparison with local reciprocity" (also cited as "Artin comparison") | §2.5 |

   The repair worker completes the table with every other design target title that an open head cites (`roadmaps grep 'LT\.[0-9]'` lists them).

4. **F04** (P3) Conventions put Layer 0 in characteristic zero; the Summary, §§0.1–0.2 and a consumer do not

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:119-121` ("in Layers 0 and 2–9, `K` has characteristic zero, so `K/ℚ_p` is finite").

   Claim: Layer 0 is restricted to characteristic zero.

   Witness: README line 22 ("The formal-module foundations of Layer 0 hold over an arbitrary commutative coefficient ring"); §0.1 line 399 ("Let `A` be a commutative ring"); FunctionFieldArithmetic (open head, README lines 488-496) consumes §§0.1–0.2 over `𝔽_q((t))`. Instance: `A = R = 𝔽_q[[t]]`, additive law, `[t] = tX + X^q` is a formal `A`-module of height one by §0.1, excluded by the Conventions bullet.

   Repair: replace the clause by "in §§0.1–0.2 the coefficient ring is arbitrary (when `A = O_K`, `K` is a nonarchimedean local field of either characteristic); in §§0.3–0.4 and Layers 2–9, `K` has characteristic zero, so `K/ℚ_p` is finite with ramification index `e` and residue degree `f`." In §0.1, API bullet 5 (line 422-423), write "for `F/ℚ_p` finite its `p`-height is `h[F:ℚ_p]`" so that the characteristic-zero clause is explicit.

5. **F05** (P3) H70 §1 is cited for convergence it does not contain

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:528-532` ("choosing `(p−1)r > e_L` puts `𝔪_L^r` in the exponential disc (H70, §1, pp.216–219; LT65, §1, p.383)").

   Claim: H70 §1 supports the evaluated logarithm, its convergence and its deep inverse.

   Witness: H70 §1 (H70 lines 69-300) is formal: invariant differentials and, at H70 line 241 (Theorem 1, p.218), the existence and uniqueness of the formal logarithm over a `ℚ`-algebra. The words "converge", "radius" do not occur in H70 before line 1284. The convergence inputs are the pinned `FormalGroup.summable_coeff_log_mul_pow` and `FormalGroup.summable_coeff_exp_mul_pow`.

   Repair: replace the parenthesis by "(H70, Theorem 1, p.218, for the formal logarithm and the identity `F = ℓ⁻¹(ℓ(X) + ℓ(Y))`; LT65, §1, p.383, for its evaluation on maximal ideals; convergence is from the Tau Ceti declarations named in the `*Needs:*` line)", and in `sources.toml` change the H70 locator item "§1, pp.216–219" to "§1, Theorem 1, p.218".

6. **F06** (P3) §9.3 `*Needs:*` lists two sections the target does not use and omits the one it does

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md:2196` ("*Needs:* §§9.1, 9.2, 8.4, 8.5, 5.5, 3.6, 0.3.").

   Claim: the trace-compatible square needs the universal deformation (§3.6) and the elliptic quotient comparison (§5.5).

   Witness: the statement and proof route of §9.3 (lines 2170-2182) use transitivity of traces (§9.1), `D_s` (§9.2), the field rectangle (§8.4), `j_n` (§8.5), the logarithm (§0.3) and "an elliptic formal isomorphism defined over the coefficients", which is §4.4; no object of §3.6 or §5.5 occurs.

   Repair: "*Needs:* §§9.1, 9.2, 8.4, 8.5, 4.4, 0.3." and, in the Layer 9 Dependencies (line 2205), "§§0.2, 0.3, 4.4, 8.4, 8.5; LocalFieldsRamification Layer 0."

Six findings: one P1, one P2, four P3. No finding of the last repair report was marked `not actionable in this package`, so nothing is re-raised.

## Verified sound

Dependency check, run on the head as it stands: `depcheck: 223 roadmaps, 1978 edges, 0 problem(s)` (no UPWARD, CYCLE or moved line).

Counts: 7 declarations read (all of `Suggested.lean`, 165 lines); 50 target sections read (README lines 1-2242, every line); 45 locators verified against the cached texts (BKO21 7, H70 9, H68 2, G86 4, Y95 8, VZ07 10, LT66 5); about 60 Checks and worked values recomputed (the 21 rows of the table below); about 45 sibling section ids and declaration names resolved at main or the open heads (heading or name found), with the statements read for RelativeFarguesFontaine §2.5, VectorBundlesAndIsocrystals Layer 5, GrossZagierAndArithmeticHeights §7.2, EndoscopicTransferAndUnitaryTraceComparison §§10.2 and 12.3, FiniteFlatGroupsAndIntegralPadicHodgeTheory §§R07.1.8, R07.1.12, R07.1.13, R07.1.20, R07.1.20a, BordismFormalGroups §§F1 and F5, ModularCurves §7D, ClassFieldTheory C.6 (its former §2.6) and RamificationOfCompleteDiscretelyValuedFields §4a.3; 43 pinned declarations (16 Mathlib, 27 Tau Ceti) and the 17 cited Tau Ceti files found at the pins.

Elaborated signatures: no Lean command is given in the brief, so none was run; the seven elaborated types of the worker's signature listing were compared with the README statements. No section binder is lost: both predicates keep `[CommRing O] [IsLocalRing O]`; both Layer 1 theorems keep `[IsDomain O] [IsDiscreteValuationRing O] [Finite (IsLocalRing.ResidueField O)]` and `Irreducible π`; both Layer 2 theorems keep `[IsNonarchimedeanLocalField K] [CharZero K]`. Nothing changed.

Headline theorems: Lubin–Tate existence and uniqueness (stated), interpolation (stated), division-field degree and splitting (stated), norm group (stated), supersingular elliptic formal group (stated); unit formula and Tate module, universal deformation, Honda integrality, quasi-canonical classification and moduli, BKO towers and traces: named in the module docstring with the missing carrier. Padding probe: none of the five theorems follows from one tactic or one pinned lemma (`library-matches` leads opened: no pinned statement proves any of them); the two predicates are each used by a stated theorem.

Ownership: `Suggested.lean` declares no name that another roadmap's Lean file declares (`roadmaps grep --lean-only` on `LubinTate`: no declaration outside this folder). Equal-characteristic torsion and reciprocity are owned by FunctionFieldArithmetic §4.1 (open head, README lines 484-510), which is why the two Layer 2 theorems carry `[CharZero K]` although `TauCeti.ClassFieldTheory.artinMap` has no such hypothesis.

| Statement | Instances tried | Values computed | Result |
|---|---|---|---|
| `IsLubinTateSeries` | `(1+X)^p−1`, `π=p`; `πX`; `−pX+X^(p²)` over `W(𝔽_(p²))`; `πX+X^q+X^(q+1)` | coefficients `(0,p)`, reduction `X^p`; reduction `0`; linear `−p ≠ p`; reduction `X^q+X^(q+1)` | holds; fails; holds for `−p` only; fails |
| `IsLubinTatePolynomial` | `πX+X^q`, `q ≥ 2`; `pX+X^p` with `q=p²` | monic, degree `q`; reduction `X^p ≠ X^(p²)` | holds; fails |
| `existsUnique_lubinTate_intertwiner` | `a=1,f=g`; `a=0`; `p` odd, `f=(1+X)^p−1`, `g=pX+X^p`; `p=2`; `W(𝔽_(p²))`, `q=p` | `X`; `0`; `pc+p(p−1)/2 = cp²` gives `c=1/2`; both `2X+X²`; `ā^p ≠ ā` obstruction | true; cardinality hypothesis needed |
| `exists_formalGroup_of_isLubinTateSeries` | `f=(1+X)^p−1`; `𝔽_q[[t]]`, `f=tX+X^q`; non-complete DVR; uniqueness for arbitrary `G` | `X+Y+XY`; `f(X+Y)=f(X)+f(Y)`, `F_f=X+Y`; divisor `π−π^r = π·unit` in any local ring; `G` has linear part `X+Y`, so Lemma 1 uniqueness applies | true as typed |
| §1.4 comparison | `g=f+πX²` (also `q=2`); `ℤ₂`, `u=3` | `πc+[q=2] = π+[q=2]+cπ²`, `c=(1−π)⁻¹`; `(1+X)^6−1` both ways | true |
| `finrank_adjoin_primitive_lubinTate_root` | `ℚ₂`, `f=2X+X²`, `m=1,2`; `ℚ_p`, `(1+X)^p−1`; `t=0` | roots `0,−2`, degree `1`; `X²+2X+2` Eisenstein, degree `2`; `(p−1)p^(m−1)`; excluded by `ht'` | true; `q−1 ≥ 1`, `m−1` guarded by `hm` |
| `artinMap_fixes_lubinTate_roots_iff` | `m=0`; `x=π`; `x=u`; `x=π²`; geometric convention | root set `{0}`, right side `⊤`; `χ=1`; `χ=u⁻¹`, fixes iff `u ∈ U(K,m)`; fixed; same norm group | true; every lift acts equally since `K(f^{∘m}=0)/K` is abelian |
| §2.6 twist | `Art(π′)=Art(u)Art(π)`; `Art(π)`; unit `v` | `u⁻¹·u = 1`; `1·u = u`; `v⁻¹` on both | consistent with §2.5 |
| §2.1 rank | `μ₃` over `ℤ₃`; `𝔽₃[ε]`; `p`-levels | 3 primes, rank 3; `X³`; `q^(he) = p^(h[K:ℚ_p])` | true |
| §3.1, §3.4 Checks | `[1+p]` over `𝔽_p`; `ψ=(1+εc)X` on `X+Y+XY`; `εX^q` additive | `X+X^p+X^(p+1)`; `X+Y+(1−εc)XY`; `ε(āX)^q = εāX^q` | true |
| §4.1 type | `ℓ=Σ(−p)^(−j)X^(p^(2j))`, `p+T²` and `p−T²` | `p(−p)^(−j)+(−p)^(1−j) = 0`; `2p(−p)^(−j)`, `2/p` at `j=2` | true |
| §4.2 Check | `ℓ=X+X²/p`, `p` odd and `p=2` | `XY`: `−2/p`; `p=2`: `XY` `−1`, `X²Y²`: `−2/8+24/16−5·96/128 = −5/2` | true |
| §4.3 | `ℓ_s`, type `p−sT²`; `f=2X+X⁴` | `p(sp)^(−j) − s(sp)^(1−j) = 0`; `1+16c=2c`, `c=−1/14`, difference `−4/7` | true |
| `exists_lubinTate_endomorphism_formalGroup` | `y²+y=x³`, `p=2`; `s=1`; ordinary | `Δ=−27`, `#E(𝔽₂)=3`, `#E(𝔽₄)=9`, `s=−1`; `(T−sp)²`, `Frob=[sp]`, `z ↦ z^q`; excluded by the count | true for every prime `p` |
| §5.4, §6.6 action | unramified quadratic, `L_1`, `u` of order `q₀+1`; `a=π_F`, `L=T` | stabilizer `O₀^×(1+ϖ₀O_F)`, index `q₀+1`, `u²L ≠ L`; actual image `T`, class `[π_F⁻¹T]=[T]` | matches Y95 line 175 and line 220 |
| §6.3 Check | cubic `O₀+ϖ₀O_F` | `O_F/O` of length 2 over the residue field, not 1 | not Gorenstein; true |
| §6.5, §7.1 degrees | `s=1,2`; `q₀=2`; `s=0` | `(q₀²−1)q₀^(2s−2)/((q₀−1)q₀^(s−1)) = q₀^(s−1)(q₀+1)`; `(q₀−1)q₀^(2s−1)/… = q₀^s`; `3` and `2`; `(q₀+1)/q₀` not an integer | true, matches G86 line 207 |
| §7.2 | `ℚ₃(π)`, `π²=3` | `[π]∘[π]`: `3X + 4πX³ + … + X⁹`, vertices `(1,2),(3,1),(9,0)` | matches Y95 line 361 |
| §7.3–7.6 | `p=5` | `6, 30, 150`; `p+1` neighbours; `p⁻¹L_(s−1) ⊃ L_s` of index `p` | true, matches BKO21 lines 754-760 |
| §8.1–8.4 | subgroups of `O^×` | `A·B_s = μ_(p²−1)(1+pℤ_p)(1+p^sO)`; `A ∩ B_s = ℤ_p^×(1+p^(s+1)O)`; degrees `p^(2n)`, `p^n`, `p^s(p+1)` | true |
| §8.5, §9.1–9.3 | `[p][(−1)^(n+1)]v_(n+1)`; `N(1+√p)`; `p=5`, `ℓ(x)=25` | `w_n`; `1−p`; `[30]x`, logarithm `750`, sign `−750` | true |

Sources: BKO21 Lemma 5.1(ii) is as the README says (BKO21 lines 576-578), and the README's corrected pairing is right (computed: `a_(p²) = 2sp` gives `Frob = [sp]`). Honda's (F), special elements and type are as stated (H70 lines 305-313, 348-354); Theorem 3 (H70 line 482), Theorem 4 under (F1) without completeness (H70 lines 507-508, 607), Lemma 3.4 and Proposition 3.5 with completeness (H70 lines 627, 668), Lemma 4.2 (H70 line 738), Theorem 9 (H70 line 1100). H68 Theorem 2 and Corollary 4 (H68 lines 210, 497). G86 Propositions 2.1 and 5.3 (G86 lines 77, 204-211). Y95 Propositions 1, 2, 4, Theorems 1, 2′ and the canonical polygon (Y95 lines 186, 200, 212, 305, 350, 361). VZ07 Definition 1.1, Theorem 1.4, Lemma 2.1, Definition 2.2, Lemma 2.6, (3.1)–(3.7), Proposition 3.6, Theorem 3.8 (VZ07 lines 2697, 2739, 2799, 2833, 2859, 2878-2885, 3000, 3021). LT66 Propositions 2.4, 2.6, Theorem 3.1, Proposition 3.3, §3.5 (LT66 lines 148, 214, 284, 331, 354).

Policy: the pull request changes only the package folder (9 files); no `set_option`, no `lemma` declaration, no pull-request number or process word in the README or docstrings; imports are `Mathlib` and three existing `TauCeti` modules.

Wording: the roadmap's text was set beside Y95 lines 175, 186-201 and 212-213 (§§6.3, 6.6), Y95 line 361 (§7.2), G86 lines 185-189 and 204-211 (§§5.2, 7.1, 7.2), BKO21 lines 247-249, 576-578 and 715-728 (§§8.3, 4.3, 7.3), VZ07 lines 2697-2703 and 2877-2885 (§§0.1, 3.3), H70 lines 348-354 (§4.1) and H68 lines 497-499 (§4.4); the longest shared run is six words (Y95 line 212, a statement the mathematics forces). No table, figure or list of examples is taken over.

Source independence: 12 passages compared with 6 sources, none shared; largest share Y95, 23 of 90 locators; contents compared with Y95 (its §§0–14): independent (Layer 3 ↔ §2, Layer 5 ↔ §3, Layer 6 ↔ §§4–5, §7.2 ↔ §6 only, with Layer 4 between, and the order forced by the `*Needs:*` lines §5.2 → §2.1, §6.2 → §5.2, §7.2 → §6.6); LT65 could not be read.

## Not verifiable

- LT65 (15 locators; §§0.2, 0.3, 1.1–1.4, 2.2–2.6, 8.1, 8.2, 9.1): settled as uncertified, text not read. The statements cited to it were tested by computation (table above), not against the text.
- Elaboration of `Suggested.lean`: not run here (no Lean command in the brief); the worker's elaborated signatures were used.
- The supplier's normalisation in R01 (whether `F = σ/π` there makes the `q`-Frobenius equal to `[π]` or to its inverse-variance form): the supplier section states the normalisation and not the series; the repair states the comparison in the supplier's variance.
- Whether `Suggested.lean` resembles a public formalisation outside the pinned libraries: not checked (no external repository was read).
- §3.3 Check 4 (a formal-group cocycle that does not extend to a module cocycle for ramified `O_K`): no explicit cocycle is given in the README and none was computed.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), p.956: the source says trace `±2p` gives Honda type `p ± x²` and Lubin–Tate parameter `∓p`; it should be type `p ∓ T²` and parameter `±p`, the parameter reducing to the `p²`-Frobenius; affects nothing.
- **Gap** in VZ07 at §3, definition of symmetric 2-cocycles, p.62: the source says the series `δ_a` are arbitrary without constant term; it should require zero linear coefficient, since for ramified `O_K` a nonzero derivation `π ↦ c` otherwise gives extra classes; affects a stated result.

## For the human reviewers

- **Licence.** The cached BKO21 text carries a JSTOR download stamp (BKO21 lines 568-570), while `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml:109-113` records the CaltechAUTHORS record with `licence_class = "institutional"`.
- **Licence.** VZ07 is recorded with the URL of the whole Astérisque 312 volume (227 pages, `sources.toml:92`); the cached file contains all nine chapters, of which the roadmap cites pp.57–66.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "edc206572c3db5c11905b6b05ddc85d64f796a58", "job": "RT-LubinTateFormalModulesAndQuasiCanonicalLifts~1b", "model": "fable", "worker": "chris-x26"} -->
