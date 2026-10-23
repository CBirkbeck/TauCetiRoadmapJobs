<!-- from @CBirkbeck, https://github.com/TauCetiProject/TauCetiRoadmapJobs/pull/963#issuecomment-6373178749 -->
Review (claude) of 2d17434

Verdict: rejected

1. **F01** (P1) The same roadmap is planned twice on the board (AnticyclotomicLocalUnits)

   - **Location.** `packages/ColemanPowerSeriesPartII/README.md` line 18: "AnticyclotomicLocalUnits §§ALU.0–ALU.8 describes the same signed local-unit continuation. The ownership is a single continuation under ColemanPowerSeriesPartII; the two labels do not designate independent libraries or supply one another." See also line 1006, Downstream consumers.
   - **Claim.** The README says ownership is single and treats AnticyclotomicLocalUnits as an alias. On the board it is a separate accepted design. Its build job (PKG-AnticyclotomicLocalUnits) is still open, and it has its own merge-order slot. Two roadmaps would own every object here: the unit tower, the Coleman series, the signed modules, Kummer duality, the local points and Rubin's decomposition.
   - **Witness.** `packages/AnticyclotomicLocalUnits/design/README.md` line 1 titles itself the Part II of Coleman power series on signed anticyclotomic local units; its ALU.0–ALU.8 (lines 108–1389) match Layers 0–9 here. `merge-order/ORDER.txt`: line 214 (it), line 283 (this).
   - **Further evidence.** `packages/InertAnticyclotomicCMMainConjecture/design/README.md` line 40 takes its carriers from ALU nodes. NonordinaryCMSpecialValues (line 213) and LubinTateFormalModulesAndQuasiCanonicalLifts (line 58) also name AnticyclotomicLocalUnits as the consumer. InertAnticyclotomicCMMainConjecture is named here as a downstream consumer, but it is at line 215, before line 283. This package's own `design/plan.json` records a `restructure` entry with action `merge`: "keep one roadmap id and retire the other … The orchestrator decides which id survives".
   - **Repair (orchestrator).** Apply the recorded merge, so that one id survives.
     - If ColemanPowerSeriesPartII survives:
       1. Retire PKG-AnticyclotomicLocalUnits.
       2. Put ColemanPowerSeriesPartII on ORDER line 214 and delete line 283. Its last supplier, NonordinaryCMSpecialValues, is line 213.
       3. Repoint the `AnticyclotomicLocalUnits:ALU.x` citations in the InertAnticyclotomicCMMainConjecture, NonordinaryCMSpecialValues and LubinTate designs to the matching sections here.
       4. Delete the alias paragraph (README line 18): with the duplicate gone it is board-process text.
     - If AnticyclotomicLocalUnits survives, this package is withdrawn.
   - **Test.** After the change, the retired id has zero lines in ORDER.txt, and the dependency check below still reports 0 problems. InertAnticyclotomicCMMainConjecture (line 215) is then later than its supplier at line 214, as line 1006 requires.

2. **F02** (P2) gap:height-two-explicit-reciprocity is circular with §2.6, and its content is largely supplied

   - **Location.** README line 82: "Supply the height-two Lubin–Tate reciprocity comparison … including the factor π^(−n−1) in the finite-character dual-exponential sum and the modulo-O trace formula of §2.6." Line 412, in the §2.6 route: "The normalization is the height-two-explicit-reciprocity contract."
   - **Claim.** §2.6 hands its normalization to the contract, and the contract asks for §2.6's own formula, so Wiles's law has no single owner. The `needs` also bundles two theorems: Wiles's Kummer-pairing formula (§2.6) and the dual-exponential identity (§2.7).
   - **Witness.** The PadicHodgeRegulators package (board head 5eff35d) states no Lubin–Tate reciprocity, but its §§1.4, 1.7, 1.9 (lines 458, 501, 523) give the exp/exp* adjunction, corestriction compatibility and log_BK∘κ=log_A for good-reduction abelian varieties.
   - **Repair.** Own Wiles's law once.
     - Recommended: make §2.6 the owner, with the existing locators (BKO2021 line 545; Rubin1987 Theorem 5.3, Rubin1987 line 322; Wiles1978, uncertified), and delete "The normalization is the … contract".
     - Derive §2.7 from §2.6, PadicHodgeRegulators §§1.4, 1.7 and 1.9, and NonordinaryCMSpecialValues NCM.2/cm-lubin-tate.
     - Narrow the gap to whatever those sections do not state for the rank-one CM realization, or withdraw it.
   - **Test.** At m=0, k=0, the §2.6 value π⁻¹Tr_(Φ₀/Φ)(δ₀λ(y)) is then stated without the contract. Its χ=1 specialization gives the factor 6/5 at p=5, matching §1.6 and §4.4.

3. **F03** (P2) gap:composite-genus-formula asks for a genus formula that a roadmap on main already supplies

   - **Location.** README line 106: "For arbitrary composite N prime to p, supply the full Γ₀(N) genus formula 2g−2=μ/6−ν₂/2−2ν₃/3−ν_∞, with the cusp and elliptic-point counts giving μ=N∏_(ℓ∣N)(1+1/ℓ), compatibly with the smooth integral modular model."
   - **Claim.** The gap is not minimal.
   - **Witness.** `TauCetiRoadmap/ModularForms/README.md` line 1117 (§10B) gives g=1+d/12−ε₂/4−ε₃/3−ε∞/2 with d=[PSL₂(ℤ):Γ̄], so d=μ for Γ₀(N); ModularCurvesPartII (head 35be0c8, README line 244) itself consumes that formula.
   - **Repair.**
     - Cite ModularForms Layer 10 (§10B) in §5.3's *Needs:* and in the ModularCurves contract, with d=μ because −I∈Γ₀(N). The pinned `CongruenceSubgroup.neg_one_mem_Gamma0` is in `TauCeti/NumberTheory/ModularForms/CongruenceSubgroups/Basic.lean` line 418.
     - Narrow the `needs` to two items: the special fibre of the smooth proper model of X₀(N) over ℤ_p (p∤N) has the genus of X₀(N)(ℂ); and the composite index μ = N∏(1+1/ℓ). The pin has only prime powers: `CongruenceSubgroup.Gamma0_prime_power_index`, line 631.
   - **Test.** Computed from ModularForms' formula:
     - N=11: g = 1+1−0−0−1 = 1, so 2g−2 = 0 ≤ μ/6 = 2.
     - N=27: d=36, ε₂=ε₃=0, ε∞=6, so g=1.
     - N=32: d=48, ε₂=ε₃=0, ε∞=8, so g=1.
     - All three agree with §5.3 and with the Layer 5 Examples.

4. **F04** (P2) gap:formal-kummer-limit-adjunction asks for Kummer-image duality that ArithmeticGaloisDuality D7.6 states

   - **Location.** README line 72: "Supply compatibility of local abelian-variety duality with restriction, corestriction and finite Kummer images, and with the adjoint of the transported O-action, …"
   - **Claim.** The gap is not minimal: the Kummer-image part is already supplied.
   - **Witness.** ArithmeticGaloisDuality (head 09ad340) D7.6, "Self-dual isogenies and their local index" (README line 6017): for an isogeny φ over a characteristic-zero local field, the local sequence containing the Kummer image is dual to that of φ∨.
   - **Repair.**
     - Delete "and finite Kummer images" from the `needs`, in README line 72 and in the plan gap.
     - Add D7.6 "Self-dual isogenies and their local index" to §2.3's *Needs:*.
     - Keep restriction/corestriction and the O-adjoint, which D7.6 does not state.
   - **Test.** For φ=[p^k] on the principally polarized B of §2.3, ψ∨∘φ = φ∨∘ψ holds, so D7.6 gives the Kummer-image duality §2.3 uses.

5. **F05** (P3) Mathlib's `FormalGroup` is at the pin but is not acknowledged

   - **Location.** README line 38, in From Mathlib. `packages/ColemanPowerSeriesPartII/Suggested.lean` line 29: "Native power series, elliptic formal points and completed group algebras do not supply these missing arithmetic constructions."
   - **Claim.** The non-statability argument and the supplier contract omit the native formal-group-law carrier.
   - **Witness.** `Mathlib/RingTheory/FormalGroup/Basic.lean`: `FormalGroup` (line 56), `FormalGroup.IsComm` (line 74), `FormalGroup.Point` (line 126, power-series values only; its TODO, lines 122–124, leaves maximal-ideal points open); no endomorphisms [a]_F, logarithm or torsion points.
   - **Repair.**
     - Name these declarations in From Mathlib, with what they lack, as the law underlying LubinTate LT.0–LT.1.
     - Add one clause to the docstring: Mathlib's `FormalGroup` gives the law but no O-module structure and no points in m_L.
   - **Test.** The non-statability verdict is unchanged; the docstring edit keeps elaboration clean.

6. **F06** (P3) §6.3 re-derives the pinned kernel-of-reduction equivalence

   - **Location.** README line 777: "Each x_s specializes to zero on E and therefore has a unique formal parameter in Ê(m_(Ψ′_s))".
   - **Claim.** The pinned library already gives this, but it is not cited.
   - **Witness.** `TauCeti/AlgebraicGeometry/EllipticCurve/FormalGroup/Point/KerReduction.lean`:
     - line 64: `WeierstrassCurve.kerReduction`;
     - line 79: `range_formalPointHomAdicCompletion_eq_kerReduction`;
     - line 87: `formalPointAddEquivKerReduction`, formal points ≃ the points reducing to the origin.
   - **Repair.**
     - Cite these declarations in From Tau Ceti and in §6.3's *Needs:*.
     - §6.3 keeps only the completion-model transport and the trace squares.
   - **Test.** For x₀ = Q, which reduces to O, `formalPointAddEquivKerReduction` returns its parameter.

7. **F07** (P3) ColemanPowerSeries Layers 0–1 are cited for statements the parent does not make

   - **Location.**
     - README line 54: "Layers 0–1 supply finite local-unit comparisons and the finite-free determinant-norm method…".
     - *Needs:* lines 160 (§0.2) and 249 (§1.1), and Dependencies lines 230 and 339.
   - **Claim.** The parent's Layers 0–1 concern only ℚ_p(ρ_n), E(ρ_n) and the substitution (1+X)^p−1, so they supply nothing for the Lubin–Tate tower. The generic inputs that §0.2 actually uses are pinned but uncited.
   - **Witness.** Parent README (head 37908a0) line 25 excludes general Lubin–Tate interpolation; its `scalarAlgebra` hard-codes (1+X)^p−1. Pinned: `TauCeti.Algebra.normUnits` (`TauCeti/RingTheory/Norm/Units.lean` line 40), `TauCeti.map_normUnits_unitFiltration_le`, `TauCeti.continuous_normUnits` (`TauCeti/NumberTheory/LocalField/Norm/Basic.lean` lines 329, 337).
   - **Repair.**
     - In §0.2 replace "ColemanPowerSeries Layer 0" by those three declarations, and add them to From Tau Ceti.
     - Drop "ColemanPowerSeries Layer 1" from §1.1 and from the Layer 1 Dependencies: its steps are §1.1's own route.
     - Reword line 54 so that the parent is the base roadmap whose method §1.1 adapts, not a supplier of statements.
   - **Test.** The dependency check is unaffected.

8. **F08** (P3) Process residue and certificate wording

   - **Location.**
     - Line 16: "The good-prime Manin-unit extension is requested explicitly."
     - Line 562: "For primes 5 through47 use the reader’s table" and "certifies the listed class numbers".
     - Line 625: "combine xi-values, xi-signed and W(φ)=+1" and "BKO write W".
     - Line 645: "No unverified use of Cox’s uncleared book is needed."
     - Line 948: the title "Historical numerical range regression".
   - **Claim.** These are board vocabulary: the explorer's "reader", design node slugs, source-clearance status and software terms. A reader of the roadmap cannot interpret them.
   - **Witness.** `xi-values` and `xi-signed` are node ids of `design/plan.json` (AU.4/xi-values, AU.4/xi-signed), not README sections; the house style refuses process narrative and job vocabulary in the README.
   - **Repair.**
     - Line 562: "for 5≤p≤47 the Worked examples table lists D, h(D) and the reduced forms" (a worked example, not a certificate).
     - Line 625: "combine §4.4, §4.5 and W(φ)=+1", and delete "BKO write W".
     - Delete the Cox sentence.
     - Line 16: "… is the supplier contract below".
     - Retitle or delete §9.6 (R09).
   - **Test.** grep for `reader’s|uncleared|xi-|regression|requested explicitly` returns 0 hits.

9. **F09** (P3) §9.6 states a numerical special case as a target

   - **Location.** README lines 948–954, §9.6, which "is not an input to its proof".
   - **Claim.** Special cases are Checks, not targets.
   - **Witness.** Rubin1987 line 568 (p.418) has the range 5≤p≤1000 with p≢1 mod 12. BKO2021 line 310 states the bound 1001, which gives the same prime set since 1001=7·11·13.
   - **Repair.** Delete §9.6 and add this as a Check under §9.2. Layer 9 Dependencies then drop §9.6.
   - **Test.** 54 targets remain, and no *Needs:* line cites §9.6.

10. **F10** (P3) §4.1 cites a CM target that does not exist

   - **Location.** README line 562: "The reduced-form/ideal-class dictionary of ComplexMultiplicationAndExplicitReciprocity CM.1/quadratic-forms-dictionary".
   - **Witness.**
     - `roadmaps grep --fixed 'quadratic-forms-dictionary'` finds no match on main or at any open head.
     - The CM roadmap at head 0c6c6e2 (README line 26) assigns the binary form/ideal dictionary to IntegralLattices B2, B3 and B5.
   - **Repair.** Cite IntegralLattices §§B2 and B5, which §4.1's *Needs:* and the Worked examples already name.
   - **Test.** The citation resolver reports no unresolved lead for §4.1.

11. **F11** (P3) §1.6 cites Rubin for a factor of the opposite sign

   - **Location.** README line 327: "Rubin1987, Lemma 2.1(iv), p.407".
   - **Witness.** Rubin1987 line 139 gives δ = −p/(p+1)·δ_(χ₀), that is δ_(χ₀) = −(1+p⁻¹)δ. Rubin normalizes by p^(−n−1) (Rubin1987 line 131), not π^(−n−1).
   - **Repair.** Add "(Rubin normalizes by p^(−n−1); his factor is −(1+p⁻¹))", or drop the Rubin locator.
   - **Test.** At p=5 Rubin's factor is −6/5 and the README's is 6/5. Their ratio is −1 = π/p, as the normalization predicts.

12. **F12** (P3) Downstream consumers names earlier roadmaps that do not consume this one

   - **Location.** README line 1006: "SelmerIwasawaCohomology and SelmerIwasawaCohomologyPartII consume the actual finite groups F⁺(Ψ_n), F⁻(Ψ_n)…".
   - **Witness.**
     - ORDER.txt lines 64 and 238 place both roadmaps before this one (line 283).
     - Their READMEs at heads 1fa1c7d and 8b21886 never mention Coleman series, anticyclotomic towers or these groups (checked by grep).
   - **Repair.** Delete the sentence, or say that later Selmer roadmaps may consume F^±(Ψ_n), without naming earlier ones.
   - **Test.** No consumer listed precedes this roadmap in the order.

13. **F13** (P3) §2.3 mixes one finite layer with limits over the tower

   - **Location.** README line 365: "For each finite L in the pro-p towers, … the direct-limit defect in the formal Kummer sequence is Pontryagin dual to lim_N F(m_L)."
   - **Witness.** Rubin1987 lines 292–301 (Lemma 5.1 and proof, p.411): the direct limit over the tower n is dual to the norm limit of formal points over the same tower.
   - **Repair.** "For each tower (L_n) of (Θ_n) and (Ψ_n), colim_n H¹(L_n, F(m_Φ̄))[π^(n+1)] is Pontryagin dual to lim_n F(m_(L_n)) under formal norms; the comparison with B is made at each finite L_n."
   - **Test.** For the tower (Ψ_n), both sides are indexed by the same n.

The mathematics is in good order: the computed checks below found no false statement, sign error or wrong count in the 55 targets. The verdict is `rejected` for one reason, R01. The board holds a second accepted design, AnticyclotomicLocalUnits, that plans this same roadmap target for target. It sits earlier in the merge order, and three earlier designs already cite it as the owner. This package's README settles the duplicate by declaration, but only the orchestrator can decide which roadmap id survives: a fix worker cannot repair this inside the package. If the orchestrator keeps ColemanPowerSeriesPartII, R02–R13 are the repair list (three P2, nine P3). Ownership against the parent ColemanPowerSeries (open roadmap pull request, head 37908a0) is sound: the parent's scope excludes general Lubin–Tate interpolation, and nothing of the parent is planned again here.

## Verified sound

### Principles

- No route-specific shortcut: the headline theorem is for every p≥5, which is the source's range (BKO2021 line 38).
- No copied passages: a 7-word n-gram comparison against BKO2021, Rubin1987, Hazewinkel1977 and Fesenko1998 matched only titles in References.
- No computational algorithm beyond the 13-row worked table; see R08 for its wording.
- No `set_option`, sorry'd data or PR numbers.
- The parent ColemanPowerSeries is not re-planned. Re-planning is found only against AnticyclotomicLocalUnits (R01).

### Dependency check

`depcheck: 27 roadmaps, 239 edges, 0 problem(s)`: no UPWARD, CYCLE or `moved:` line.

### Lean

- `lake env lean` on `packages/ColemanPowerSeriesPartII/Suggested.lean`, run from the content checkout at Mathlib 6b7abb3 and Tau Ceti a91d3aa, exits 0 with no output. The file has 0 declarations, so there is no `sorry` warning.
- It has `import Mathlib` only, one module docstring and `namespace TauCetiRoadmap.ColemanPowerSeriesPartII`.
- The `#check @name` comparison and the one-tactic padding probe are vacuous with 0 declarations. Nothing changed.

### Headline theorems and statability

Nine headline groups were checked against the docstring, statement by statement:

- two-variable freeness;
- Lubin–Tate Coleman interpolation;
- Kummer duality and Wiles reciprocity;
- the signed annihilator theorem;
- the optimal plus unit;
- the formal-CM local-point system;
- minus invariants and minus freeness;
- Rubin's decomposition and signed freeness;
- matching-parity nonvanishing.

None is statable at the pins without a long ad hoc encoding, for these reasons:

- No Lubin–Tate module or torsion tower exists in Mathlib or Tau Ceti. A grep for "lubin" finds no hits.
- Mathlib's `FormalGroup` has no O-action and no maximal-ideal points (R05).
- There is no local Artin map, and no anticyclotomic tower or ring-class completion.

The same judgment is made by the parent, which treats even cyclotomic interpolation as not statable. Two auxiliary lemmas (§4.1, §5.1) are statable but are not headlines. No headline is missing.

### Sources sample, all 15 read at their locators

| Target | Locators checked |
|---|---|
| 0.2 | BKO2021 lines 253–259, p.948; Rubin1987 lines 106–112, p.406 |
| 0.3 | BKO2021 lines 264–269 |
| 0.4 | BKO2021 lines 262–263 |
| 0.5 | Rubin1987 line 116 (Proposition 1.1, p.407); Wintenberger1980 lines 112–126 (Théorème, p.91): r=2, d=2, ω≠1, ω≠ω^(p+1) |
| 2.3 | Rubin1987 lines 292–301; BKO2021 line 521 |
| 2.7 | BKO2021 lines 422–426 and 467–469; the Kato locator is uncertified |
| 4.1 | BKO2021 lines 339–362, p.950; the table is re-enumerated below |
| 4.2 | BKO2021 lines 366–395 and 489–513 |
| 4.5 | BKO2021 lines 479–488, p.953; a source gap is listed |
| 5.3 | BKO2021 lines 590–593 and 615–616 |
| 5.4 | BKO2021 lines 573–588 and 652–656 |
| 5.6 | BKO2021 lines 603–606 and 662–681 |
| 7.3 | BKO2021 lines 753–768, p.959, also read on the page image; misprints listed |
| 8.2 | BKO2021 lines 777–785; Rubin1987 lines 254–259 (Lemma 4.3, p.410) |
| 9.2 | BKO2021 lines 306 (p.949) and 791–797 (p.960); Rubin1987 lines 163 (p.408) and 579–586 (pp.418–419) |

Theorem numbers, pages and hypotheses match in all 15. The author flagged only Wiles1978 and Kato1993, both settled as uncertified.

### Declared gaps, 8 checked

The gaps are declared identically in the README and in `design/plan.json`.

| Gap | Result |
|---|---|
| quadratic-iwasawa-twist | Sound: PMIA §4.5 gives only the one-variable coordinate. |
| ramified-height-two-norms | Sound: Hazewinkel needs an absolutely unramified base. |
| supersingular-trace-counts | Sound: EllipticCurves Layer 3 has Hasse and supersingularity but no Deuring count. |
| integral-hecke-point-relation | Sound. |
| good-prime-manin-unit | Sound: EllipticCurveModularity R29.5 (README line 1546) gives only a nonzero rational constant, while AbbesUllmo1996 Théorème A, line 49, is exactly the needed statement. |
| height-two-explicit-reciprocity | Finding R02. |
| composite-genus-formula | Finding R03. |
| formal-kummer-limit-adjunction | Finding R04. |

### Duplication audit at the pins

- Mathlib, 7 declarations opened (plus `FormalGroup`, R05):
  - `PowerSeries.derivative` (Derivative.lean line 49) and `coeff_derivative` (line 59);
  - `PowerSeries.isUnit_iff_constantCoeff` (Inverse.lean line 109);
  - `Algebra.norm` (Norm/Defs.lean line 61) and `Algebra.trace` (Trace/Defs.lean line 70);
  - `NumberField.dedekindZeta_residue` (DedekindZeta.lean line 56) and `tendsto_sub_one_mul_dedekindZeta_nhdsGT` (line 77).
- Tau Ceti, 9 declarations opened (plus R06 and R07):
  - `TauCeti.unitFiltration` (line 99) and `unitFiltration_one` (line 192);
  - `completedGroupAlgebra` (Basic.lean line 145) and `IsCompactModule.completedGroupAlgebraModule` (Module.lean line 344);
  - `formalPointHomAdicCompletion` (line 273), `_injective` (line 292) and `range_formalPointHomAdicCompletion` (Range.lean line 158);
  - `TauCeti.IsReducedForm` (line 60, where ⟨0,0,1⟩ is indeed reduced) and `reducedForms` (line 76).
  - `TauCeti.completedGroupAlgebra.powerSeriesCoordinate` (PowerSeries.lean line 350) is a further pinned input the contract could name.
- Lubin–Tate Coleman series, Wiles reciprocity and Rubin's signed decomposition: searched across main and all 330 open heads, by object and by name. They are found only in this package and in the AnticyclotomicLocalUnits design. IntegralIwasawaTheory §§7.1–7.3 (head 5d2ed25) and the parent are cyclotomic only.

### Citations resolved, 24 roadmaps

| Where | Roadmap and sections resolved |
|---|---|
| main | LocalFieldsRamification Layers 0–3 |
| main | ProfiniteArithmetic §1.3 |
| main | ProfiniteProPGroups Layer 9 |
| main | PMIA §§1.7, 2.5, 4.2–4.5, 5.2 |
| main | ClassFieldTheory Layers 5, 6, 8 |
| main | IntegralLattices B1, B2, B5 |
| main | ImaginaryQuadraticClassNumber H1.3, H2.1, H2.2 |
| main | ModularCurves §§7D, 8A–8D, 9C–9E |
| main | EllipticCurves Layers 3–4 |
| main | GlobalNumberFields Layers 4, 9 |
| main | AlgebraicCurves Layer 7 |
| open head | ArithmeticGaloisDuality R02.1.1–R02.1.5, R02.2, D7.6 |
| open head | ModularCurvesPartII §§3.1–3.5, 5.2, 5.3, 5.10, 9.1, 9.9, 13.1, 13.2, 16.6–16.8 |
| open head | EllipticCurveModularity R29.5 |
| open head | ComplexMultiplicationAndExplicitReciprocity §§3.1, 4.3 (the CM.1 citation fails, R10) |
| open head | ColemanPowerSeries |
| open head | IntegralIwasawaTheory |
| board | LubinTateFormalModulesAndQuasiCanonicalLifts: all 17 cited node slugs among its 51 nodes |
| board | NonordinaryCMSpecialValues NCM.0–NCM.4 |
| board | PadicHodgeRegulators Layer 1, read at its board head |
| board | AnticyclotomicLocalUnits (R01) |
| board | InertAnticyclotomicCMMainConjecture (R01) |
| open head | SelmerIwasawaCohomology and SelmerIwasawaCohomologyPartII (R12) |

The PKG report says the PadicHodgeRegulators text was absent. It is on the board, at head 5eff35d. Ownership against open pull requests was checked through the roadmaps index for all 330 heads.

### Shape

- 55/55 targets carry a locator and a *Needs:* line.
- 15/15 definitions and constructions carry an API list and exactly 3 Checks.
- 10/10 layers end with Examples and Dependencies.
- No LaTeX, and no backticked names of the roadmap's own.
- `sources check`: 0 problems.

### Adversarial table

Values are computed at p=5 unless stated otherwise.

| Statement | Instances | Values computed (README / independent) | Result |
|---|---|---|---|
| Conv. Tate basis | n=0,1 | [p]w₁=[−1][π][−1]v₁=v₀=w₀; unchanged basis [−p]w₁=−w₀ | holds |
| Conv. degrees | n=0,1,2 | [Θ_n:Φ]=1,25,625; [Ψ_n:Φ]=1,5,25; Δ=24, Δ′=6; [Ψ′₂:Φ]=30, fixed field degree 5=[Ψ₁:Φ] | holds |
| Conv. parity | 1, ord p, ord p² | c=0,2,3 (BKO2021 lines 250–252) → Ξ⁺,Ξ⁺,Ξ⁻ | holds |
| Conv. δ₁/δ | π=−5 | (π−1)/π=6/5, v₅=−1; Rubin's p-normalization gives −6/5 | holds (R11) |
| Conv. Frobenius sign | a_q=−2p | (X+5)²=X²+10X+25, root −5 = parameter −p; BKO's ∓p is a misprint | holds |
| Conv. #E(𝔽_q) | a_p=0 | a_q=−2p ⇒ (p+1)²=36≡1 mod 5 | holds |
| Conv. ℓ-index | ℓ=5 | K[25] has ℓ-part 5 ⇒ order 5 ↔ conductor 25; BKO is off by one | holds |
| 0.1 | as above | exactly one sign each; order pⁿ ↔ c=n+1 | holds |
| 0.2 | identity family; foreign eigenvector | additive 0; e_ω kills ω′≠ω; (p²−1)⁻¹=24⁻¹∈ℤ₅× | holds |
| 0.3 | κ-line, κ(g)=2 | inverse twist κκ⁻¹=1; wrong κ gives 4≠1 | holds |
| 0.4 | σ↦σ², σ^a | σ^a−1=(σ−1)·unit, a=2∈ℤ₅×; σ−κ(σ) ↔ σ−1 after twist | holds |
| 0.5 | Wintenberger r=2, d=2 | ω order 24, ω^(p+1)=ω⁶ of order 4 ≠ω,≠1 | holds |
| 1.1 | v′=bv; f=1 | f∘[b⁻¹](v′_n)=u_n, without inverse [b²]v_n; uniqueness by Weierstrass (finitely many zeros) | holds |
| 1.2 | f=1+aX; bv | δ=a; b⁻¹·b=1; λ′(v_n)∈O×, f(v_n)=u_n unit | holds |
| 1.3 | β∈Γ | δ(βx)=δ(x)^β=δ(x) since δ(x)∈O | holds |
| 1.4 | χ=1, n=0; χ(β)=ζ₅ | π⁻¹Trδ₀; π^(−n−2)ΣTrδ_(n+1)=π^(−n−1)Σδ_n; factor ζ₅⁴ | holds |
| 1.5 | χ(σ)=1 | (χ(σ)⁻¹−1)δ_χ=0 | holds |
| 1.6 | p=5 | Trδ₀=−6δ, δ₁=6δ/5 | holds |
| 2.1 | k≥1 | [π^k] surjective on m_Φ̄; G_L-fixed points = F(m_L) | holds |
| 2.2 | h=2 | a_n=n−⌊(n−1)/2⌋=1,2,2,3,3,… →∞ (Hazewinkel1977 line 48) | holds |
| 2.3 | k_L=𝔽_(p²) | p-part of #B̃=(p+1)² is 1 | holds (R13) |
| 2.4 | [π]y⊗π^(−k−1) | equal to y⊗π^(−k); zero point pairs to 0 | holds |
| 2.5 | π-torsion | needs degree p²−1, prime to p, inside a pro-p tower: impossible | holds |
| 2.6 | m→m+1; y→[π]y | invariant via Trδ_(m+1)=πδ_m and λ([π]y)=πλ(y) (BKO2021 line 545) | holds (R02) |
| 2.7 | n=0, χ=1 | factor π⁻¹=−1/5; agrees with §4.4 via NCM.1 | holds (R02) |
| 3.1 | p^n characters | Σ_χλ_χ=λ; trace law p^(m−n) in both readings | holds |
| 3.2 | base point | λ₁=λ injective ⇒ F⁺(Φ)=0, F(m_Φ)⊂A⁻ | holds |
| 3.3 | δ(v)=1 | δ₁=6/5≠0 ⇒ v∉V*,− | holds |
| 3.4 | p^n e^± | integral (Galois-stable character sums); ∩=0 via torsion-freeness | holds |
| 3.5 | levels 0–3 | minus 1,5,5,105; plus 0,0,20,20; totals 1,5,25,125 | holds |
| 3.6 | parity | A⁺ has odd components, V*,+ kills odd δ_χ | holds |
| 3.7 | ranks | quotient rank ≥1 ⇒ rank V*,ε ≤ 2−1 | holds |
| 4.1 | p≤53 | 13 rows re-enumerated: all D≡1 (8), squarefree, (D/p)=−1, h<p, forms exact; bound 48.94>47, 52.76<53; tail <1 since S(\|D\|)=0 | holds |
| 4.2 | W(φ) | +1 from 2 split (BKO2021 line 495); ℓ≥5 split, ℓ∤h f, p∤ℓ−1 | holds |
| 4.3 | ν=1; ℓ=5, m=2 | L₀=K; order 5 ↦ ζ₅ | holds |
| 4.4 | χ=1 | Euler factor 1−(−p)/p²=1+1/p = δ₁/δ | holds |
| 4.5 | W=+, c odd; W=−, χ=1 | W(φ̄νχ)=−1; W(φ̄ν)=W(φ)=−1 (BKO2021 line 393) | holds |
| 4.6 | I=p^kO | IR=p^kR≠R for k≥1 ⇒ I=O | holds |
| 5.1 | p=5 | \|a_p\|≤2√5≈4.47<5, p∣a_p ⇒ a_p=0 | holds |
| 5.2 | Théorème A | p∤N ⇒ p∤c_E (AbbesUllmo1996 line 49) | holds |
| 5.3 | N=11 | 2g−2=0≤μ/6=2 | holds (R03) |
| 5.4 | j=0, 1728 | fibre ≥(μ−ν₃)/3+ν₃≥μ/3, likewise μ/2 | holds |
| 5.5 | all p<200 | bound ≤1/6 exactly at p=5,7,11,17,19,23,29,47; stronger count ⌊(p−1)/12⌋≥1 for p≥13 | holds |
| 5.6 | p=47 | 47≡2 (3) and ≡3 (4); μ/3, μ/2 > μ/6 | holds |
| 5.7 | s=±1 | M=p∓1=4,6 at p=5; N=27, 32: μ=36, 48, g=1 | holds |
| 5.8 | log Q | 5→6·5=30 is a generator, 5·5=25 is not | holds |
| 6.1 | s=1, 2 | (p²−1)p^(2s−2)/((p−1)p^(s−1))=6, 30 | holds |
| 6.2 | s=0 | T₀=T, x₀=Q | holds |
| 6.3 | x₀=Q | reduces to O | holds (R06) |
| 7.1 | tame trace | 6 terms, not 24 | holds |
| 7.2 | y=6Q | 6∈ℤ₅× | holds |
| 7.3 | s≥1 | p forward (1+ap^sθ) + 1 backward = p+1 superlattices; without θ, 1 lattice | holds |
| 7.4 | s=1, 2, 3 | Tr y₁=−(p+1)Q=−y; Tr y₂=−y₀=0; Tr_(3/0) y₃=py=5y | holds |
| 8.1 | n=1,3,5 | h_n=p^(2(n−1))·p^(−(n−1))=1,25,625; \|Ĥ⁰\|≤p^(n−1) ⇒ H¹=0; traces −y, 5y, −25y | holds |
| 8.2 | Nakayama | Q⁻/(p,γ−1)=𝔽₂₅, one-dimensional ⇒ cyclic ⇒ free | holds |
| 8.3 | rank | projective over a local ring ⇒ free, rank 2−1 | holds |
| 9.1 | coefficient of T | δ(mQ⁻)⊂pO; the T-coefficient functional fails covariance | holds |
| 9.2 | compact | bijective continuous map of compact Hausdorff modules ⇒ homeomorphism | holds |
| 9.3 | ξ* | V*,+ ≅ Q⁻ ≅ Λ, generated by ξ* | holds |
| 9.4 | perfectness | a nonzero point with χ-components pairs nontrivially | holds |
| 9.5 | λv | δ_χ(λv)=ev_(χ⁻¹)(λ)δ_χ(v) | holds |
| 9.6 | 1001 | 7·11·13; Rubin's bound is 1000 | holds (R09) |

## Not verifiable

| Item | Why |
|---|---|
| Wiles1978 pp.235–254 (§2.6) and Kato1993 Chapter II, Theorem 2.1.7 (§2.7) | Paywalled; settled as uncertified, not read. |
| The complex-conjugation bars in BKO2021 (3.1)–(3.9) (φ against φ̄ in §4.4) | Lost in the text extraction and illegible at the rendered resolution. The README's φ̄ agrees with NonordinaryCMSpecialValues NCM.0/dual-tate-convention. |
| Wintenberger1980 proofs §§5.1–5.5.3 | Only the theorem was read. |
| Fesenko1998 | Outside the sample. |
| Rubin1987 | An OCR scan with garbled formulas: Lemma 2.1(iii) and Corollary 2.2's V⁻ definition are unreadable. Only the cited items needed here were read. |

## Source issues

- **Misprint** in BKO2021 at proof of Theorem 5.5(ii), p.959: the source says the forward index-p lattices are p^(−s−1)(1+ap^s)ℤ_p t+T; it should be (1+ap^sθ) with O=ℤ_p⊕ℤ_pθ, since 1+ap^s is a unit and all p printed lattices coincide; affects nothing.
- **Misprint** in BKO2021 at proof of Theorem 5.5(ii), case s=0, p.959: the source says the p+1 lattices are permuted by Δ and sums over Δ; it should be Δ′, of order p+1 (Δ has order p²−1); affects nothing.
- **Misprint** in BKO2021 at Corollary 5.6, p.959: the source says V_∞ modulo the minus kernel is free; it should be the twisted module V*_∞ modulo V*,−_∞, as in its proof; affects nothing.
- **Misprint** in BKO2021 at Lemma 5.1(ii), p.956: the source says trace ±2p gives Honda type ±x²+p and parameter ∓p; it should be type ∓x²+p and parameter ±p, since q-Frobenius ±p is the reduction of [π]; affects nothing.
- **Gap** in BKO2021 at Lemma 5.2(ii), p.956: the source says its displayed bound gives an unramified point for every p≥31; at p=47 that bound is zero, so it should exclude 47 (covered by part (iii)); affects nothing.
- **Gap** in BKO2021 at proof of Proposition 3.3(3), p.953: the source says only characters of conductor greater than 1 need treatment; when W(φ)=−1 the trivial character also lies in Ξ⁺ and needs W(φν)=W(φ) from p.951; affects the proof.
- **Misprint** in BKO2021 at §3.0.2, pp.952–953: the source says an order-l^m character is localized from z_(fl^m) inside K(fl^mp^(n+1)); it should index by conductor l^m (order l^(m−1)), since the order-l^m layer has conductor l^(m+1); affects nothing.
- **Gap** in BKO2021 at proof of Lemma 5.1(i), p.956: the source says (φ_q∓p)²=0 on T_l forces φ_q=±p; it should add that End(A)⊗ℚ has no nonzero nilpotents (or semisimplicity of Frobenius); affects nothing.
- **Gap** in BKO2021 at §4, p.954: the source says the formal-norm inverse limit over Θ_n vanishes by Hazewinkel; Hazewinkel controls only norms down to the unramified base, and the ramified layers need a separate argument; affects the proof.
- **Error** in Rubin1987 at Lemma 4.2, p.410: the source says any continuous O-linear map X→O sending x to a unit makes x a generator; it should assume augmentation covariance, since the T-coefficient on O[[T]] sends T to 1; affects a stated result.
- **Gap** in Rubin1987 at proof of Lemma 5.1, p.411: the source says Proposition 4.5(i) makes the inverse limit of formal points vanish; that proposition bounds only norms to the base Φ, not the ramified layers; affects the proof.

<!-- tauceti-roadmap-review {"agent": "claude", "head": "2d17434", "job": "REV-PKG-ColemanPowerSeriesPartII", "model": "opus", "worker": "fable-rev29"} -->
