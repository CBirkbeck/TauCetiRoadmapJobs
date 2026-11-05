<!-- from CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/2354#issuecomment-6668873133 -->
Review (claude) of 2ef50a1

Verdict: needs_changes

1. **F01** (P2) The completed maximal unramified extension is cited to a supplier that does not build it

   Location: `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md` lines 244–245 ("Layer 2:
   unramified extensions, arithmetic Frobenius and the completed maximal unramified extension"), 709–711
   and 728 (§2.5 route and *Needs:* "LocalFieldsRamification Layers 1–2"), 732–734 and 749 (§2.6:
   "isomorphic over the completion of the maximal unramified extension of `K`"; *Needs:*
   "LocalFieldsRamification Layers 0 and 2"), 759–760 (Layer 2 dependencies).

   Claim: LocalFieldsRamification Layer 2 supplies the completion `K̂^ur` of the maximal unramified
   extension, used as the base of the statement of §2.6 and in the proof route of §2.5.

   Witness: `Completed/LocalFieldsRamification/README.md` Layer 2 (line 576 onward) defines only the
   algebraic `K^ur ⊆ AlgebraicClosure K` (its line 90 of that layer) and the Frobenius; the word
   "completion" occurs in that README only for `Ẑ` and global completions. The carrier is owned by
   RamificationOfCompleteDiscretelyValuedFields §4a.3 at its open head ("Let `K′` be the completion of
   `K^ur` … `G_(K′) ≅ I_K`, `e(K′/K) = 1`, residue field an algebraic closure of `k`"), as
   PadicPeriodRings §0.3 (`completedUnramifiedDescent`) and ArithmeticGaloisRepresentations §3.0 record.

   Repair: in the LocalFieldsRamification contract (line 244–245) delete "and the completed maximal
   unramified extension"; add a supplier subsection "From TauCetiRoadmap.RamificationOfCompleteDiscretelyValuedFields:
   §4a.3 supplies the completion `K̂^ur` of `K^ur` (a complete discretely valued field with `e = 1`,
   residue field `k̄_K`, and `G_(K̂^ur) ≅ I_K`), assumed with the hypotheses stated there"; cite
   "RamificationOfCompleteDiscretelyValuedFields §4a.3" in the §2.5 route, the §2.6 statement, both
   *Needs:* lines and the Layer 2 dependencies, keeping LocalFieldsRamification Layer 2 for `K^ur` and
   Frobenius. The dependency check places that roadmap after ReductiveGroupsPartII, before this one.

2. **F02** (P3) False Check: the additive law has Lubin–Tate endomorphisms in equal characteristic

   Location: README lines 543–544 (§1.3 Checks): "The additive law `X + Y` over `O` admits no
   Lubin–Tate endomorphism: every endomorphism of the additive law over a ring of characteristic zero is
   linear".

   Claim: no Lubin–Tate series is an endomorphism of `X + Y` over the layer's `O`.

   Witness: Layer 1 admits "either characteristic" (lines 455–457). Over `O = 𝔽_q[[t]]`, `π = t`,
   `f = tX + X^q` has constant term `0`, linear coefficient `t`, reduction `X^q`, and
   `f(X + Y) = tX + tY + X^q + Y^q = f(X) + f(Y)` in characteristic `p`: a Lubin–Tate endomorphism of
   the additive law, with `F_f = X + Y`.

   Repair: restrict the Check to `O` of characteristic zero ("over a discrete valuation ring of
   characteristic zero the additive law admits no Lubin–Tate endomorphism, since its endomorphisms are
   linear") and add the computed equal-characteristic instance as a further Check (the Lubin–Tate module
   of `tX + X^q` over `𝔽_q[[t]]` is the additive law itself).

3. **F03** (P3) The erratum paragraph and Check of §4.3 contradict each other

   Location: README lines 1050–1053 and 1060–1061.

   Claim: line 1052–1053 says that for `s = −1` "the two readings agree"; the Check at 1060–1061 says
   the printed pairing is "type `p + T²` with parameter `p`".

   Witness: by the README's own formulas (line 1050: printed type `p + sT²`, parameter `−sp`; correct
   type `p − sT²`, parameter `sp`), `s = −1` gives printed (`p − T²`, `+p`) against correct
   (`p + T²`, `−p`): they differ. For `s = 1` the printed pair is (`p + T²`, `−p`), not "`p + T²` with
   parameter `p`". (BKO21 line 573–578: `a_q = ±2p`, type `±x² + p`, parameter `∓p`.)

   Repair: replace the sentence "The case `a_p = 0` … on which the two readings agree" by "BKO21's
   local construction (`a_p = 0`, so `a_(p²) = −2p`, `s = −1`) uses the correct pair, type `p + T²`
   and parameter `−p`, as in H68 Corollary 4"; rewrite the Check as "for `s = 1` the printed pair is
   type `p + T²` with parameter `−p`, but `pX + X^(p²)` is a Lubin–Tate series for `p` and not for
   `−p` (§1.1), and `[p]` is the endomorphism reducing to Frobenius when `a_(p²) = 2p`".

4. **F04** (P3) The marked modulus lives in the deformation space of the Frobenius twist

   Location: README lines 1389–1390 (§6.6): "fix a universal deformation of the special fibre over
   `B[[t₁,…,t_(n−1)]]` … let `m_L` be its marked modulus".

   Claim: `m_L` is a point of the universal deformation of the special fibre `H̄`.

   Witness: §5.2 (line 1154–1156) and §6.2 mark `H_L` to the `q₀^N`-Frobenius twist `H̄^(q₀^N)`,
   `q₀^N = [L:T]`; Y95 line 159–161 calls `F_L` a lifting of `F̄^(q^N)` and takes its modulus there.
   A deformation of `H̄^(q₀^N)` has no modulus in the space of `H̄` without a comparison.

   Repair: write "fix, for each Frobenius twist `H̄^(q₀^N)` of the special fibre, a universal
   deformation over `B[[t₁,…,t_(n−1)]]` (§3.6); for `H_L` with `[L:T] = q₀^N` let `m_L` be its marked
   modulus in the space of `H̄^(q₀^N)`" (the twist components of §6.2).

5. **F05** (P3) Locator: BKO21 §5.0.1 begins on p.956

   Location: README line 1546 ("BKO21, §§5.0.1–5.0.2, pp.957–959") and
   `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/sources.toml`, BKO21 `locator`.

   Claim: §5.0.1 is on pp.957–959.

   Witness: BKO21 line 554 ("5.0.1. The set-up") lies in the file's page 15, printed p.956 (line 572);
   §5.0.2 starts at line 712, printed p.958.

   Repair: "§§5.0.1–5.0.2, pp.956–959" in both places.

6. **F06** (P3) §4.1 assumes completeness that H70 does not

   Location: README line 981 (§4.1): "Let `O` be a complete discrete valuation ring of characteristic
   zero".

   Claim: Honda's condition (F) and the type calculus need `O` complete.

   Witness: H70 line 305–313: `K` a discrete valuation field of characteristic `0` with residue
   characteristic `p`, condition (F), and "We do not assume the completeness of `K`"; completeness
   enters only at Lemma 3.4 (line 627) and Proposition 3.5 (line 668), cited in §4.2 for the converse.

   Repair: drop "complete" from §4.1 and from the first half of §4.2 (Theorems 2–3 of H70), and state
   completeness only for the converse of §4.2 (H70 Lemma 3.4 and Proposition 3.5), where it is used.

Six findings, one of them blocking (P2). The Lean file is sound: it elaborates with exactly the five
`sorry` warnings, the five headline theorems pass the one-tactic probe, and no statable headline is
missing. The repairs are to the README (one supplier mis-citation, one false Check, one garbled
erratum paragraph, two precision points) and to one locator.

## Verified sound

**Principles.** No route-specific shortcut (Layer 1 is stated over any discrete valuation ring with
finite residue field; the BKO restrictions `p ≥ 5`, unramified quadratic are confined to Layers
7.3–9 and named as such); no re-planning (the duplicated targets of the design were deleted and
cited: formal homomorphisms, logarithm, point carrier to BordismFormalGroups §F1, `FormalLieGroup` and
`BarsottiTate.*` to FiniteFlatGroupsAndIntegralPadicHodgeTheory, quotients to ModularCurves); no
upward citation; no copied passages (sampled locators restate in the author's words); no algorithm;
no sorry'd data; no `set_option`; no `lemma`; no process words, pull-request numbers, LaTeX or
machine paths (grep of README and Lean).

**Elaboration.** `lake env lean` of `Suggested.lean` from the content checkout: exit 0, exactly five
warnings `declaration uses 'sorry'` at lines 76, 90, 111, 126, 148, no other message (the three
`TauCeti.*` object files were present). The elaborated types of all seven declarations
(the elaborated-signature listing, re-read) carry every README hypothesis in their own signatures:
`[IsDomain O] [IsDiscreteValuationRing O] [Finite (IsLocalRing.ResidueField O)]` and
`Irreducible π` in Layer 1; `[IsNonarchimedeanLocalField K] [CharZero K]` in Layer 2; `[Fact p.Prime]`,
`IsUnit W.Δ` and the point count in Layer 4. Nothing changed. (The eighth "declaration" `it` in the
signatures tool's list is the word "theorem it is" inside the docstring at line 147, not a Lean
declaration.)

**Padding probe.** Each of the five sorried theorems was tried with `simp`, `rfl`, `infer_instance`,
`decide`, `(simp; done)`, `trivial` and `exact?` on a scratch copy (35 probes): 30 errors, and the five
`exact?` "Try this" hits each name only the sibling probe declaration of the same statement, no
library lemma. No declaration restates a definition, mirrors a Check or computes a value. The two
definitions `IsLubinTateSeries`, `IsLubinTatePolynomial` have real bodies on Mathlib carriers and are
needed by every theorem.

**Headline theorems** (README summary, lines 14–19) against the file: Lubin–Tate existence and
uniqueness — stated (`exists_formalGroup_of_isLubinTateSeries`, with `existsUnique_lubinTate_intertwiner`);
degree and norm group of division fields — stated (`finrank_adjoin_primitive_lubinTate_root`,
`artinMap_fixes_lubinTate_roots_iff`); supersingular elliptic formal group is Lubin–Tate — stated
(`exists_lubinTate_endomorphism_formalGroup`); representability of marked deformations, quasi-canonical
classification and fields of moduli, BKO trace square, unit formula and Tate-module freeness, Honda
integrality — named in the module docstring with the missing carrier (formal-group homomorphisms,
lattice quotients, evaluated points of a general formal group, `O_σ[[T]]`). The unit formula cannot be
stated without `[a]_f(t)`, which would need a `Classical.choose` on a sorried theorem; the docstring's
reasons hold at the pins (Mathlib's `FormalGroup.Point` is `{f : MvPowerSeries σ R // HasSubst f}`,
`Mathlib/RingTheory/FormalGroup/Basic.lean:126`; Tau Ceti's evaluated points are
`WeierstrassCurve.FormalGroupPoint`, `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/AdicPoint.lean:69`).

**Library declarations opened at the pins** (Mathlib `f6090c709`, Tau Ceti `358314d4a`): `FormalGroup`
(`Mathlib/RingTheory/FormalGroup/Basic.lean:56`), `FormalGroup.IsComm` (:74), `FormalGroup.Point` (:126),
`FormalGroup.map` (:184); `PowerSeries.subst` (`Mathlib/RingTheory/PowerSeries/Substitution.lean:157`),
`PowerSeries.HasSubst` (:39, `IsNilpotent (constantCoeff a)`), `substInv` (:456), `substInvOfIsUnit`
(:566), `subst_substInv_right` (:510), `subst_substInv_left` (used at `FormalGroup/Basic.lean:251`);
`MvPowerSeries.subst` (`MvPowerSeries/Substitution.lean:189`); `PowerSeries.eval₂Hom`
(`PowerSeries/Evaluation.lean:157`), `comp_eval₂` (:197); `exists_isWeierstrassFactorization`
(`PowerSeries/WeierstrassPreparation.lean:813`), `IsWeierstrassFactorizationAt.algEquivQuotient` (:78 docs);
`IsNonarchimedeanLocalField` (`Mathlib/NumberTheory/LocalField/Basic.lean:45`);
`Field.absoluteGaloisGroupAbelianization` (`Mathlib/FieldTheory/AbsoluteGaloisGroup.lean:101`);
`IsKrasner`, `IsKrasner.krasner` (`Mathlib/Analysis/Normed/Field/Krasner.lean:56,63`); `spectralNorm`
(`Mathlib/Analysis/Normed/Unbundled/SpectralNorm.lean:381`); `adicCompletion`, `adicCompletionIntegers`
(`Mathlib/RingTheory/DedekindDomain/AdicValuation.lean:30–33,814`). Tau Ceti: `WeierstrassCurve.formalGroup`
(`…/FormalGroup/Basic.lean:58`), `isComm_formalGroup` (:83), `map_formalGroup` (:75);
`FormalGroupPoint` (`AdicPoint.lean:69`); `formalPointHom` (`Point/Hom.lean:149`);
`formalPointHomAdicCompletion` (`Point/AdicCompletion.lean:273`), `_injective` (:292);
`range_formalPointHomAdicCompletion` (`Point/Range.lean:158`); `TauCeti.ClassFieldTheory.artinMap`
(`Local/ArtinMap.lean:109`, docstring: normalized by arithmetic Frobenius), `artinMap_restrict` (:145),
`exists_artinMap_mem_iff` (:201), `artinMap_norm` (:310), `artinMap_congr` (:356);
`TauCeti.unitFiltration` (`UnitFiltration/Basic.lean:99`, `U(K,0)` the image of `𝒪[K]ˣ` as the README
says); `TauCeti.teichmuller` (`Henselian/Teichmuller.lean:92`);
`weakApproximation_denseRange` (`Global/Approximation/Weak.lean:204`). All present.

**Cross-roadmap citations resolved.** BordismFormalGroups §F1 (main, lines 46–145: homomorphisms,
isomorphisms, strict isomorphisms, inverse series, base change, point carrier on complete Hausdorff
linearly topologized algebras, logarithm/exponential, `[n]_F`, height, Lazard ring, symmetric cocycle
lemma) and §F5 (lines 466–553: universal Lubin–Tate deformation ring `W(k)[[u₁,…,u_(h−1)]]` over a
perfect field). FiniteFlatGroupsAndIntegralPadicHodgeTheory at the head of its pull request:
§R07.1.1 (`frobeniusHom`, `verschiebungHom`), §R07.1.8 (`BarsottiTate.tateModule`, henselian local
domain with characteristic-zero fraction field, free of rank `h`), §R07.1.12 (`FormalLieGroup`,
`.Hom`, `.End`, `.Points`, `.ofFormalGroup`), §R07.1.13 (`BarsottiTate.equivFormalLieGroup`, complete
noetherian local ring with residue characteristic `p`), §R07.1.20 (`schematicClosure_flat`, Dedekind
base), §R07.1.20a (`BarsottiTate.quotientFiniteFlatSubgroup`, complete DVR of mixed characteristic,
with `0 → T_p(G) → T_p(Q) → H(K̄) → 0`), §§R07.2.6–R07.2.8 (`dieudonneEquivalenceFinite`): all exist
with the hypotheses the README assumes. EllipticCurves Layer 1 (isogenies, dual, invariant
differential, formal group, logarithm, convergence, kernel of reduction) and Layer 3 (Frobenius trace,
`deg(1 − π_q) = #E(𝔽_q)`, positivity of the degree form, Hasse). ModularCurves §§0B, 0C, 2B, 7C, 7D
(universal marked deformation over `W(k)[[T]]`), 7E (PD-1–PD-5), 7F (ST-1, ST-2). ClassFieldTheory
Layers 6–8, `localAbelianExistence`, §2.6 (arithmetic Frobenius; `χ_cyc(Art_K(u)) = N(u)⁻¹`, so
`u⁻¹` over `ℚ_p` as §2.5's Check says). LocalFieldsRamification (Completed) Layers 0–1 (unit
filtration, Teichmüller, `U(K,i) ≃ 𝓂^i` for `(p − 1)i > e`) and Layer 2 (`K^ur`, Frobenius) — except
the completion (R01). ColemanPowerSeries (earlier) excludes general Lubin–Tate interpolation (its
line 31); FunctionFieldArithmetic (later) owns the equal-characteristic Layer 2, which is why
`[CharZero K]` in the two Layer 2 theorems matches the README's scope. AnticyclotomicLocalUnits' gap
`formal-point-completion-realization` (its line 95) is answered by §0.4 item by item. The four Lean
names `roadmaps resolve` found nowhere are FiniteFlatGroups' planned declarations, cited as such.

**Dependency check** (`gate --depcheck … --movable`):

    depcheck: 236 roadmaps, 2335 edges, 0 problem(s)

No UPWARD, CYCLE or `moved:` line. Declared gaps: none (plan.json `gaps` is empty; no gap contract in
the README). Ownership against open pull requests was checked by object with `roadmaps grep` (formal
`O`-module, Lubin–Tate series/module/character/tower, Honda type, quasi-canonical, canonical lift,
completed maximal unramified extension) over the heads the brief lists; no earlier roadmap builds
these objects.

**Sources, seeded sample** (every locator read at the cached text):

| Target | Locator | Read at | Result |
| --- | --- | --- | --- |
| 0.3 | H70 §1 pp.216–219 | H70 lines 125–290: invariant differentials, Theorem 1 (transformer `f ≡ x`, `F = f⁻¹(f(x)+f(y))`), `g∘φ∘f⁻¹` linear (lines 283–290) | supports the integral-differential route and `ℓ_G∘φ = c·ℓ_F`; LT65 p.383 uncertified |
| 0.4 | Mathlib `IsKrasner.krasner`, `adicCompletion`; Tau Ceti weak approximation | pins (above) | present; mathematics checked (Checks recomputed below) |
| 1.4 | LT65 Thm 1 (8)–(11) | uncertified | locator only; Check recomputed |
| 2.1 | VZ07 Def. 2.2 pp.60–61; Y95 §3 p.295 | VZ07 lines 2796–2845 (Lemma 2.1 on p.60, Def. 2.2, Lemma 2.4: height is the first `q`-power generator); Y95 lines 116–135 | supports; Lemma 2.1 is p.60, within the cited range |
| 2.6 | LT65 §2 Lemma 2, Thm 3 | uncertified | locator only |
| 3.1 | LT66 §2 pp.51–52, Thm 3.1 pp.56–57; Y95 §2 pp.294–295 | LT66 lines 34–44, 284–295 (`o` complete noetherian local, residue field `⊇ k`, unique `*`-isomorphism to `Γ(α)`); Y95 lines 84–109 | supports |
| 3.4 | VZ07 Lemma 2.6 p.61, Prop. 3.2, Lemma 3.3 pp.62–63; LT66 Prop. 2.4 pp.52–54 | VZ07 lines 2859–2950; LT66 lines 148–206 | supports: rigidity from `[π]_F ≢ 0 mod m`, torsor under `H²` |
| 3.5 | VZ07 Cor. 3.4, Lemma 3.5, Prop. 3.6 pp.63–65; LT66 Prop. 2.6 pp.54–55 | VZ07 lines 2951–3013; LT66 lines 214–222 | supports `h − 1`; VZ07 proves it for normal modules over `k̄` (line 2976, 3023), LT66 for any field `k` of characteristic `p` without the action; the README's route (jet-wise, no normal form) is consistent with VZ07's argument, whose only use of `k̄` is Lemma 2.5 |
| 5.4 | Y95 §§3–4 pp.295–297; G86 §5 pp.324–325 | Y95 lines 138–140, 168–184 (`F_(a⁻¹L) = F_((a,K)L)`, `(u,K)` acts by `[u⁻¹]`, line 220); G86 lines 193–203 | supports, arithmetic normalization consistent |
| 6.3 | Y95 §4 Props. 1–2 p.297, corollary p.298 | Y95 lines 186–230 | supports exactly |
| 6.5 | Y95 §5 Prop. 4 p.300; G86 Prop. 5.3 p.325 | Y95 lines 305–321 (free ⇔ simply transitive ⇔ `O^∨` free); G86 lines 204–217 | supports |
| 7.1 | G86 Prop. 5.3(2) p.325; Y95 Thm 1 p.297 | G86 lines 205–209 (`q^(s−1)(q+1)` unramified, `q^s` ramified); Y95 lines 212–215 | supports; G86 states it over `M = K̂^ur` with norm group `O_s^×`, Y95 over `K` with `π^ℤ O_L^×` as the README says |
| 7.6 | BKO21 §§5.0.1–5.0.2; G86 §5 p.325 | BKO21 lines 754–768 (`p` lattices of the first type permuted by `Gal(Ψ′_(s+1)/Ψ′_s)`, one homothetic to level `s − 1`; `p + 1` at `s = 0` permuted by `Δ`) | supports; §5.0.1 starts p.956 (R05) |
| 9.2 | BKO21 §5.0.2 pp.958–959 | BKO21 lines 734–744 (`Ψ_s ⊂ Ψ′_(s+1)`, `y_s = Σ_(σ∈Δ′) σ x_(s+1) ∈ Ê(𝔪_(Ψ_s))`, `Δ′` the torsion of order `p + 1`) | supports |
| 9.3 | BKO21 §5.0.2 pp.958–959 | BKO21 lines 746–768 (trace relations through `Ψ_(s+1)/Ψ_s`) | supports the square as transitivity; existence of a nonzero system is not claimed, as the README says |

Also read: G86 Prop. 2.1 p.322 (lines 77–83), §5 lines 180–211; H68 Theorem 2 pp.204–205 (lines
210–218: logarithm `Σ π^(−ν) x^(q^(aν))`, `End = ` unramified integers of degree `a`, uniqueness
among group laws with `[π]` reducing to `ξ^a`) and Corollary 4 p.212 (lines 497–502); H70 (F)
(lines 305–313), (F1) (line 508), Lemma 2.3–2.4, Theorems 2–3 (lines 373–505), Prop. 3.3 (537),
Theorem 4 (607), Prop. 3.5 (668), Lemma 4.2 p.231 (738–749), Theorem 9 pp.240–241 (1100–1122);
VZ07 Definition 1.1 (2697–2703) and Theorem 1.4 with the generator `g_(q^t−1)` as the `X^(q^t)`
coefficient of `[π]` (2739–2792, 2844–2845); BKO21 §2 pp.947–948 (lines 225–281, footnote 2 at
279–281), §4 pp.954–955 (514–550), Lemma 5.1 (573–588). Every cited work is in `sources.toml`; LT65
is settled `uncertified` and cited by locator only.

**Adversarial pass** (sampled targets, headlines and the targets of the findings; values computed by me):

| Statement | Instances | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| `IsLubinTateSeries π q f` | `ℤ_p`, `π = p`: `(1+X)^p − 1`; `pX`; `πX + X^q + X^(q+1)`; `W(𝔽_(p²))`, `−pX + X^(p²)` against `π = p` | const `0`, lin `p`, red `X^p` ✓; red `0 ≠ X^p`; red `X^q + X^(q+1)`; lin `−p ≠ p` | discriminates; `q ≥ 2` always since the residue field is finite | none |
| `IsLubinTatePolynomial` | `πX + X^q`; `πX + X^q + πX^(q+1)` | monic, degree `q` ✓; degree `q + 1` ✗ | monic and degree needed (otherwise roots outside `𝔪`) | none |
| `exists_formalGroup_of_isLubinTateSeries` | `f = (1+X)^p − 1`; `𝔽_q[[t]]`, `f = tX + X^q`; `π = ϖ²`; residue `𝔽_(p²)` with `q = p` | `F = X + Y + XY`; `F = X + Y` (additive, R02); division by `π − π^r` fails; `ā^p ≠ ā` | `Irreducible π` and `q = #k` needed; uniqueness among all `FormalGroup O` since LT65's uniqueness is among all series with linear part `X + Y` | none in Lean; Check R02 |
| `existsUnique_lubinTate_intertwiner` | `a = 0`; `a = 1`, `f = g`; `f = πX + X^q`, `g = f + πX²`, `q = 2` and `q > 2` | `φ = 0`; `φ = X`; `X²`: `πc + [q=2] = 1·[q=2] + π + cπ²`, so `c(π − π²) = π`, `c = (1 − π)⁻¹` in both cases | holds; `subst φ f = f(φ)`, `subst g φ = φ(g)` is `f∘φ = φ∘g` | none |
| `finrank_adjoin_primitive_lubinTate_root` | `ℚ_2`, `f = 2X + X²`, `m = 1`: `X(X+2)`, `t = −2`; `m = 2`: `X² + 2X + 2` Eisenstein; `ℚ_p`, `(1+X)^p − 1`; `t = 0` | degree `1 = q − 1`; `2 = (q−1)q`; `(p−1)p^(m−1)`; `t = 0` excluded by `f^{∘0}(t) = t ≠ 0` | holds; `(f.comp)^[m] X = f^{∘m}`, `f^{∘0} = X` | none |
| `artinMap_fixes_lubinTate_roots_iff` | `m = 0`; `ℚ_p` cyclotomic; `x = π`; `π′ = uπ`, `u ≢ 1` | `U(K,0) = O^×` so RHS `= Kˣ`, LHS: only root of `X` is `0`; `p^ℤ(1 + p^m ℤ_p)`; `π ∈ ⟨ϖ⟩`; `π ∈ π′^ℤ U(K,1)` iff `u ∈ U(K,1)` | holds, normalization-independent (norm group); lifts of `Art(x)` differ by the closed commutator subgroup | none |
| `exists_lubinTate_endomorphism_formalGroup` | `p = 2`, `y² + y = x³`: points over `𝔽₂` are `(0,0),(0,1),∞`; `s = 1`, `#E(𝔽_(p²)) = (p−1)²`; ordinary reduction | `Δ = −27`, `a₂ = 0`, `a₄ = −4`, `#E(𝔽₄) = 9`, `s = −1`; `(T − sp)² = 0` and `deg(ϕ − sp)² = 0` give `ϕ_q = sp`; `z = −x/y ↦ z^q` (also at `p = 2`, `−1 = 1`); ordinary `[p]` has leading `X^p` | holds for every prime; `Nat.card` of `Affine.Point` counts `O`; both signs `s` occur over `𝔽_(p²)` (Waterhouse) | none |
| §1.4 `[1]_(f,g)` | `f = πX + X^q`, `g = f + πX²` | `c = (1 − π)⁻¹ ≠ 0`, integral | strict, not `X` | none |
| §2.1 ranks | `m = 0`; `𝔾̂_m`, `m = 1`; `W(𝔽_(p²))`, `π = −p`; additive | `R[[X]]/(X) = R`; rank `p`; `p²` at `π`-level 1, `p`-height 2; `[π] = 0` not finite | finite height needed; `π ∈ 𝔪_R` automatic (residue char `p`) | none |
| §2.6 twist | `Art(π′) = Art(u)Art(π)` | `χ_π = u⁻¹·1`, `η_u = u`, product `1`; with `η_u⁻¹`: `u⁻²` | `η_u`, not its inverse; needs `K̂^ur` (R01) | R01 |
| §3.1 marking | `[1+p]` on `𝔾̂_m` over `𝔽_p` | `(1+X^p)(1+X) − 1 = X + X^p + X^(p+1)` | strict, not marked | none |
| §3.4 rigidity | infinite height over `k[ε]` | `[a](εX^q) = āεX^q = ε(āX)^q` | finite height needed | none |
| §3.5 dimension | `h = 1, 2`; LT over `W(𝔽_(p²))` restricted to `ℤ_p` | `0`; `1`; `1` over `ℤ_p`, `0` over `O` | `h − 1` | none |
| §4.1 type sign | `ℓ = Σ(−p)^(−j)X^(p^(2j))` | `(p + T²)⋆ℓ`: coefficient `p(−p)^(−j) + (−p)^(1−j) = 0`; `(p − T²)⋆ℓ`: `2p(−p)^(−j)`, `= 2/p ∉ pO` at `j = 2` (at `j = 1` it is `−2 ∈ 2ℤ_2`) | type `p + T²` | none |
| §4.2 | `X + X²/p`; `𝔾_m` | `XY` coefficient `−2/p`; `p log(1+X) − log(1+X^p) = log(1 + pB)`, `v(p^n/n) ≥ 1` | logarithm alone insufficient; type `p − T` | none |
| §4.3 sign | `s = ±1` | `pℓ_s − sℓ_s(X^(p²)) = pX` since `s² = 1`; parameter `sp` | correct pair `(p − sT², sp)`; README's `s = −1` "agreement" false (R03) | R03 |
| §6.3 cubic order | `O = O₀ + ϖ₀O_F`, `[F:F₀] = 3` | `ℓ(O_F/O) = 2 ≠ ℓ(O/ϖ₀O_F) = 1` | not Gorenstein, `O^∨` not free, multiplier ring `O` | none |
| §6.4 units | `s = 0` | `1 + O_F ∋ 0` | `s ≥ 1` needed | none |
| §6.5 / 6.6 | `L = T`; level `s` | one marked class; `m_L` in the space of `H̄^(q₀^N)` (Y95 line 161) | twist component must be named (R04) | R04 |
| §7.1 degrees | unramified `s = 1, 2`; ramified `s = 1`; `s = 0` | `#(O_F/ϖ₀^s)^× = (q₀²−1)q₀^(2s−2)` or `(q₀−1)q₀^(2s−1)`, divided by `(q₀−1)q₀^(s−1)`: `q₀+1`, `(q₀+1)q₀`, `q₀`; `(q₀+1)/q₀ ∉ ℤ` | formulas for `s ≥ 1` only | none |
| §7.3/7.4/7.6 | `p = 5` | `[Ψ′_s:Φ] = 6, 30, 150`; torsion `(p²−1)/(p−1) = p+1`; `p + 1` lines in `𝔽_p²`; inward neighbour `p⁻¹L_(s−1) = p^(−s)ℤ_p t + p⁻¹T` of index `p` | ✓ | none |
| §8.2 | `c` conjugation | `G⁺ = κ⁻¹(1 + pℤ_p)`, `G⁻ = κ⁻¹(N = 1)`; `G⁺ ∩ G⁻ = 1` for odd `p` | ✓ | none |
| §8.3/8.4 | `n`, `s = 1`, `p = 5` | `[Θ_n:Φ] = p^(2n)`, `[Ψ_n:Φ] = p^n`; fixing group of `Ψ_n` is `κ⁻¹(μ_(p²−1)(1+pℤ_p)(1+p^(n+1)O))`, equal to that of `(Ψ′_(n+1))^(Δ′)`; `Ψ′_s ∩ Ψ_s`: product `κ⁻¹(μ(1+pℤ_p)(1+p^sO))` is `Ψ_(s−1)`; `Ψ′_sΨ_s`: intersection `ℤ_p^×(1+p^(s+1)O)` is `Ψ′_(s+1)`; degrees `1,6,30` vs `1,5,25` | ✓ | none |
| §8.5 | `n = 0` | `[p]w₁ = [p][−1]v₁ = [−p]v₁ = v₀ = w₀`; `[−p]w₁ = [−1]w₀` | ✓ | none |
| §9.1–9.3 | `ℚ_p(√p)`, `x = √p`; `s = 0` | `N(1+√p) = 1 − p`, `1 + Tr = 1`; `p ∤ p+1`; both composites are `Tr_(Ψ′_(s+2)/Ψ_s)` through `Ψ_(s+1) ⊂ Ψ′_(s+2)` and `Ψ′_(s+1)`; `(p+1)p` both ways | ✓ | none |
| §0.4 | `ℚ_2(i)` vs `X² + 3`; `u′` square mod `p` | `−3 ≡ 5 mod 8`: `ℚ_2(√−3)` unramified `≠ ℚ_2(i)`; split, completions `ℚ_p` | Krasner bound essential; towers by successive Krasner steps | none |

Shape: every layer ends with Examples and Dependencies; every definition section has an API list and
at least three discriminating Checks (counted: §§0.1, 0.2, 1.1, 3.1, 3.2, 3.3, 4.1, 5.1, 5.2, 6.2, 6.4,
8.1, 9.1, 9.2 have four or five); every theorem has hypotheses and a locator; the summary, scope,
conventions, supplier contracts, build paragraph, downstream consumers and references are in the
upstream shape. Every backticked name attributed to this roadmap (`IsLubinTateSeries`,
`IsLubinTatePolynomial`, the five theorem names) is declared in `Suggested.lean`. Import header:
`import Mathlib` and three existing `TauCeti.*` modules. `metadata.toml` topic `math.NT`.

## Not verifiable

- LT65 (paywalled, settled `uncertified`): the locators of §§0.2, 0.3, 1.1–1.4, 2.2–2.6, 8.1, 8.2, 9.1
  are cited by theorem and page only; the statements were checked mathematically instead.
- VZ07 Theorem 3.8 and Proposition 3.6 are proved there for a normal module over `k̄`; the README's
  extension to an arbitrary field `k` and a specified coefficient ring `B` is the roadmap's own route
  (§3.5), consistent with VZ07's argument, but not stated in any read source.
- BordismFormalGroups §F1 on main cites Tau Ceti files (`TauCeti.RingTheory.FormalGroup.NSMul`,
  `…Logarithm`) that do not exist at the current Tau Ceti pin (no `nsmulSeries`, no `FormalGroup.log`
  anywhere in the pinned Mathlib or Tau Ceti); this package cites only §F1 by section, so nothing
  here depends on those names.
- Ownership against open pull requests whose files the brief does not provide was not checked.

## Source issues

- **Misprint** in BKO21 at Lemma 5.1(ii), printed page 956: the source says a lift of a curve with
  `a_(p²) = ±2p` has Honda type `±x² + p` and Lubin–Tate parameter `∓p`; it should be type `∓x² + p`
  and parameter `±p` (the `q`-Frobenius is `±p`, so `[±p]` reduces to `X^q`); affects nothing (the
  paper's case `a_p = 0` uses parameter `−p`, which is correct).

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2ef50a161af2be2bd356df1fb5b22f3b02969d3c", "job": "REV-PKG-LubinTateFormalModulesAndQuasiCanonicalLifts", "model": "fable", "worker": "chris-x19"} -->
