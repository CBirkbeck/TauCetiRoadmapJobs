# Review of FiniteFlatGroupsAndIntegralPadicHodgeTheory (pull request #879 at 6b2737f)

**Verdict:** accepted

Incremental re-review of the 150 lines changed since `57634fc` (all in `TauCetiRoadmap/FiniteFlatGroupsAndIntegralPadicHodgeTheory/README.md`). No finding.

## Previous findings

- R01 — repaired: `README.md:7086–7089` “`φ_{k−1}(sx) = φ_{k−1}(s)·φ(x)` for all `s ∈ Fil^{k−1}S` and `x ∈ M`, where `φ(x) = c^{−(k−1)}φ_{k−1}(E(u)^{k−1}x)`”; the witness is the Check at `:7171–7179`. `Mod^{k−1}_tor` and `Mod^{k−1}_0` are full subcategories (`:7092`, `:7096`), so both inherit the axiom.
- R02 — repaired: `:6424–6425` “every `K` as in §R07.4.1 (finite and totally ramified over `K₀ = W(k)[1/p]`, with `k` perfect of characteristic `p`)”; Check at `:6454–6456` gives finite `K/ℚ_p` and `K = W(F̄_p)[1/p]`.
- R03 — repaired: `:2751–2762`, `:4565–4570`, `:5510–5516`, `:7547–7557`, `:8361–8365`, `:8969–8978`; every supplier and section named in a *Needs* line of a layer is in that layer's Dependencies (seven layers compared); `grep -c 'projective-line'` = `0`.
- R04 — repaired: contract bullets at `:399–401` (ModularCurves Layers 2A–2B), `:408–409`, `:414–415`, `:464–465`, `:471–479` (AdicSpacesPartIII, CyclotomicClassGroupsAndStickelberger), `:551–560`; Scope at `:113`, `:144–147`, `:203–210`.
- R05 — repaired: `:1239` “the multiplication-by-`n` series `[n](X) = (1+X)^n − 1`”; `:4546–4547`; `:4820`; `:6800–6803`; `grep -c 'nthSeries\|berthelot_field\|isWeaklyAdmissible_split_vs_line\|wach_unit\|wach_mu'` = `0`.
- R06 — repaired: `:9182–9183` “**Silverman 1994.** … Chapter V, Theorem 5.3”; `:7712` cites it by that key; `:9204` “184-page lecture notes”.
- R07 — repaired: the description's supplier sentence now names AdicSpacesPartIII (R2.9), ClassFieldTheory (Layers 5, 7 and 11–13), GlobalNumberFields (Layers 9–10), EllipticCurves (Layers 4–5), ProfiniteCohomology (Layer 9) and LocalFieldsRamification (Layers 3–4), and lists them among the roadmaps on main.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Compatibility axiom of `′Mod^{k−1}` (§R07.4.31, `:7086–7089`) | `M = S` with `φ_{k−1} = φ/p^{k−1}`; finite free `M`; `k = 2` | `c^{−(k−1)}φ_{k−1}(E^{k−1}x) = c^{−(k−1)}(pc)^{k−1}φ(x)/p^{k−1} = φ(x)`; `φ_{k−1}(sx) = φ(s)φ(x)/p^{k−1}`: holds. Free: both sides times `(pc)^{k−1}` equal `φ_{k−1}(E^{k−1}sx)` | pass; `savitt2005` lines 602–608, `breuil2000` lines 209–213 |
| Negative control `M = (S/pS)e`, `φ₁(γ_p(E)e) = e` (`:7171–7179`) | `F = ℚ_p`, `E = u − p`, `p = 3` and general `p > 2`; `p = 2` | `φ(γ_n(u)) = ((pn)!/n!)γ_{pn}(u)`, valuation `n ≥ 1`: `φ(I) = 0`; `γ_p(u) ∉ I²`; `c ≡ −1 − γ_p(u)`, unit; axiom: `φ₁(γ_p(E)) = p^{p−2}c^p/(p−1)!`, `≡ 0` for `p > 2`, `= c²` at `p = 2` | pass; excluded only by the axiom |
| `M ↦ M ⊗_{S₁} k_F[u]/u^{ep}` (§R07.4.34, `:7295`) on the control | same module | kernel of `S₁ → k[u]/u^p` is `(γ_i(u), i ≥ p)`; without the axiom `φ₁(γ_p(u)e) = e ≠ 0`; with it the module is not an object | pass |
| `crystalline01IsBt` (§R07.4.20, `:6424–6430`) | `K = W(F̄_p)[1/p]`, `V_p(E)`; `K = ℚ₂`, `ℚ₂(1)`; `V = 0`; `ℚ_p(2)` | `E[p^∞]` over `W(F̄_p)`, weights `{0,1}`; `μ_{2^∞}`; `G = 0`; weight `2 ∉ {0,1}`: excluded. Inputs §R07.4.14, §R07.4.19, §R07.4.23 all allow perfect `k` | pass |

The rows for untouched statements stand as in the previous review, of `57634fc`.

- Gate at this head: every scanner `0`, `depcheck=0`, `OK`; the worker's run has `build=0`. Dependency check: `depcheck: 245 roadmaps, 2243 edges, 0 problem(s)`; no UPWARD or CYCLE line. Changes outside the folder: none.
- Elaboration of `Suggested.lean` (unchanged since `57634fc`): seven `declaration uses sorry` warnings (lines 94, 103, 113, 170, 257, 318, 347), nothing else. The diff changes no Lean statement and no backticked name of the roadmap's own.
- Source locators checked against the text: 2 sources, 7 locators. `savitt2005`: §3.2 at line 548, the axiom at lines 606–607 on p. 13; Breuil 1998, Prop. 2.2.2.1 cited in §4 at line 1171; BCDT01 Th. 5.1.3 at lines 1186–1187 and Cor. 5.4.5 at line 692; Savitt 2004, Th. 6.3 in Remark 5.5 at line 1254. `breuil2000`: §2.1.1 at line 189, the axiom at lines 212–213 on p. 6 of the author's copy. The seeded target *Strongly divisible modules and their descent data* falls in the changed text and is the first row.
- Cross-roadmap citations in the changed passages resolved: on main, SchemeAndStackFoundations §§0.14, 0.29, 1.2, 2.1, 2.3, 2.10, 2.11, 4.1, 4.4, 4.8 (its lines 1562, 2575, 2819, 4094, 4206, 4643, 4707, 6278, 6456, 6658; `smooth_iff_powerSeries` 6469, `schlessinger_prorepresentable` 6484, `coherentFormalModuleEquivSpec_effective` 6681); AdicSpacesPartIII R2.9 (7714; `FormalScheme.FSC` 7723, `rigOfFSC` 7736); EtaleCohomologyFoundations §0.7 (439); ClassFieldTheory Layers 5, 7, 11–13 (1054, 1204, 1781, 1834, 1924); EllipticCurves Layers 4–5 (793, 1154); ModularCurves Layers 2A–2B (table at 4515–4516); GlobalNumberFields Layers 9–10 (508, 531); RestrictedPowerSeries §7.1 (704). At open heads: CyclotomicClassGroupsAndStickelberger §§0.2, 0.3, 2.1, 2.5, 3.1, 3.2, 8.1, 8.3 with `cyclotomicClassEigenspace` (147), `bernoulli_annihilates_component` (565), `inverseCharacterClassGroup_all_levels` (1232); CrystallineCohomology §§CR.1.2, CR.1.3, CR.4.7, CR.7.1, CR.7.3; AbelianSchemesAndArithmeticModuli §§A3.2, A4.5, A4.5a, A4.CR.7.2; ArithmeticGaloisRepresentations §§1.1, 1.2, 1.4, 1.5, 2.3, 7.6; DerivedDeRhamCohomology §0.20. None unresolved.
- “Used in” pointers of the new contract bullets checked against the *Needs* lines: ClassFieldTheory Layers 11–13 at `:2858`, `:2888`, `:2942`, `:2986`, `:3010` (§§R07.G3–R07.G6); SchemeAndStackFoundations §1.2 at `:2799`, §§2.1–2.11 at `:2855`, `:2985`, `:3010`, §§4.4 and 4.8 at `:8853`, `:8872`, §4.8 at `:4256`; EtaleCohomologyFoundations §0.7 at `:2857`; Layers 2B and 2A at `:1862`, `:8394`; EllipticCurves Layer 5 at `:7709`.
- Overlap check: read PadicHodgeTheory, PadicLocalLanglandsForGL2Qp, LocalGaloisDeformationRings, EllipticCurveModularityWild3Adic, PadicDifferentialEquationsAndRigidCohomology, FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (open), ModularCurves, RamificationOfCompleteDiscretelyValuedFields, SchemeAndStackFoundations (main); the perfect-residue form of §R07.4.20: this roadmap, requested from it by FiniteFlatGroupsAndIntegralPadicHodgeTheoryPartII (its `gap:perfect-residue-bt-realization`), which does not restate it; the other shared objects and their owners are unchanged from the previous review. The overlap listing reports no dropped id, no second copy and no other pull request changing this folder.
- Source independence: changed passages only; 3 passages compared with 2 sources (`savitt2005` lines 602–612, `breuil2000` lines 209–213), none shared beyond the formula of the axiom and its quantifiers, which the mathematics forces; the diff adds, removes and reorders no layer, so the arrangement stands as compared in the previous review (largest share `savitt2005`; independent).
- The pull request's title and description read against this head: no sentence contradicted; the change adds no section, removes none and changes no `Suggested.lean` declaration.

## Not verifiable

- Kisin 2006, Corollary (2.2.6) and Theorem (0.3), behind §R07.4.20: the author's page serves `.dvi` files the sources service does not read and the published version is paywalled; that the corollary is stated for perfect `k` is checked through §§R07.4.1, R07.4.14 and R07.4.19, not against the text.
- Kisin 2010, Theorem 1.4.2; Breuil 1998, Proposition 2.2.2.1; Breuil–Conrad–Diamond–Taylor 2001; Savitt 2004, Theorem 6.3; Silverman 1994, Chapter V, Theorem 5.3 (the reference entries added at this head): no open text read; the bibliographic data of four of them agree with the reference list of `savitt2005` (lines 2151–2160, 2192), and the locators are those Savitt 2005 gives.
- The items of the previous report's list (Faltings 1999, Serre 1987, Breuil 1999b, Bloch–Kato 1990, Tate 1967, Demazure 1972, Berthelot–Breen–Messing 1982, Kisin 2008, 2009, 2009b) are in untouched text and were not reread.

## Source issues

- none

## For the human reviewers

- **Licence.** Stix 2012, Pink 2005, Sharifi's *Iwasawa Theory* and Brinon–Conrad 2009 are unpublished lecture notes read from their authors' pages (`README.md:9186`, `:9154`, `:9204`, `:9090`); Yu 2026 is an arXiv preprint (`:9194`).
- **Licence.** `README.md:3782` links an author-page PDF (Panny–Robert–Sferlazza, Appendix B) as the statement of Berthelot–Breen–Messing 4.2.14; it has no entry under `## References`.
- **Licence.** `README.md:2933–2934` links two external Lean repositories (SKW, KummerCriterion) as related formalizations; no declaration of `Suggested.lean` shares a name or statement with them.
- **Not tested.** `kisin2006`, the second largest source by mentions (70), could not be read: wording and arrangement of §§R07.4.6–R07.4.22 were not compared with it.
