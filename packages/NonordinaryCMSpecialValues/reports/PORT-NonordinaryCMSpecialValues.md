# PORT-NonordinaryCMSpecialValues

- Branch: `roadmap/nonordinary-cm-special-values`, created from `45f58db`.
- Head commit: `ecbdd2f6` — "NonordinaryCMSpecialValues: roadmap (README, Suggested.lean, metadata)".
- Files: `TauCetiRoadmap/NonordinaryCMSpecialValues/README.md` (871 lines), `TauCetiRoadmap/NonordinaryCMSpecialValues/Suggested.lean` (190 lines), `TauCetiRoadmap/NonordinaryCMSpecialValues/metadata.toml` (`topic = "math.NT"`, same form as `TauCetiRoadmap/LFunctions/metadata.toml`). Nothing outside the folder changed.

## Build, gate and direction check

`lake build TauCetiRoadmap.NonordinaryCMSpecialValues.Suggested`:

```text
⚠ [18473/18474] Built TauCetiRoadmap.NonordinaryCMSpecialValues.Suggested (7.5s)
warning: TauCetiRoadmap/NonordinaryCMSpecialValues/Suggested.lean:136:8: declaration uses `sorry`
warning: TauCetiRoadmap/NonordinaryCMSpecialValues/Suggested.lean:146:8: declaration uses `sorry`
warning: TauCetiRoadmap/NonordinaryCMSpecialValues/Suggested.lean:172:8: declaration uses `sorry`
Build completed successfully (18474 jobs).
```

Three warnings, all `declaration uses 'sorry'` (the three headline theorems); no other diagnostic.

Gate (on the committed branch):

```text
gate NonordinaryCMSpecialValues: set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 statement-hygiene=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 OK
```

(An earlier gate run flagged one residue line, "Citations of this roadmap by its earlier catalogue numbering …"; it was reworded.)

Direction check (`gate --depcheck … --movable`), on the committed README:

```text
depcheck: 232 roadmaps, 2079 edges, 0 problem(s)
```

No UPWARD, CYCLE or `moved:` line.

Citation resolver (`roadmaps resolve` on the new README): one lead, "LubinTateFormalModulesAndQuasiCanonicalLifts Layers 2: no roadmap … on main or in an open pull request". This is a false positive of the resolver's index: the roadmap is the board package `packages/LubinTateFormalModulesAndQuasiCanonicalLifts/README.md`, line 347 of the merge order (this roadmap is line 348), and every cited section exists there (§2.1 line 605, §2.2 line 635, §2.3 line 657, §2.4 line 688, §4.3 line 1066, §4.4 line 1101). The resolver did not check library names ("no pinned Lake packages on this host"), so every Mathlib and Tau Ceti declaration the README names was grepped at the pins of this worktree (Tau Ceti `2fd255d`, Mathlib `1b1ccf4`): all exist (`HeckeCharacter.idealCharacter`, `idealCharacter_apply_prime`, `idealCharacter_apply_toPrincipalIdeal`, `finiteConductor_ne_bot`, `conductorExponent`, `finiteComponent`, `IsFiniteOrder`, `Modulus`, `idealsPrimeTo`, `IsCongrOne`, `IsCongrOne.toPrincipalIdeal_mem_idealsPrimeTo`, `TauCeti.ClassFieldTheory.ringClassField`; `MonoidAlgebra.lift`, `MonoidAlgebra.lift_single`, `Subalgebra.linearDisjoint_iff_injective`, `DirichletCharacter.LFunction_apply_one_ne_zero`, `NumberField.IsCMField`, `IsCMField.complexConj`, `Algebra.IsQuadraticExtension`, `NumberField.classNumber`).

## Draft pull request body

This roadmap builds the complex and `p`-adic special-value theory of anticyclotomic twists of a conjugation-equivariant CM Hecke character `φ` of an imaginary quadratic field `K` at a prime `p` inert in `K` — the nonordinary case, where no ordinary `p`-adic period exists and the Katz–Rubin machinery does not apply. On Tau Ceti's native `HeckeCharacter` it defines the anticyclotomic family, primitive Euler factors and central values; it constructs Kato's CM theta functions, standard elliptic units and zeta elements and proves Kato's reciprocity law for CM characters, from which it builds the integral elliptic-unit class of Burungale–Kobayashi–Ota normalised by a Néron differential; it compares the CM torsion tower with the Lubin–Tate tower at the parameter `−p`; it proves the local Fröhlich–Queyrut theorem and the root-number formulas of the twists; it develops Finis's primitive and integral theta functions and proves his divisibility theorem for weight-one anticyclotomic `L`-values; and it proves Jia's arbitrary-class-number nonvanishing theorem through Rohrlich's `p`-adic lattice count. The end theorems are the BKO unit theorem (for an auxiliary split prime `l`, almost every normalised value `Ω⁻¹L_f(φ̄ν, 1)` with `ν` of `l`-power order is a `p`-adic unit) and the parity dichotomy (in the `p`-anticyclotomic family, central values of one conductor parity vanish and all but finitely many of the other parity do not). These are the analytic and reciprocity inputs of the inert-prime anticyclotomic local-unit argument (Rubin's conjecture at inert primes) and of the inert anticyclotomic CM main conjecture, and Kato's CM reciprocity law is stated for every prime so that the CM continuations of the modular Iwasawa main conjectures can import it. `Suggested.lean` states the parity dichotomy and Rohrlich's two lattice-point bounds against the pinned Mathlib and Tau Ceti; its docstring records which headline theorems are not yet statable and what each lacks.

## Roadmaps this one depends on that are still pull requests

ComplexMultiplicationAndExplicitReciprocity, AutomorphicLFunctionsAndLocalFactors, ArithmeticGaloisRepresentations, SelmerIwasawaCohomology, PadicHodgeRegulators, PadicFamilies, ModularSymbolsPadicLFunctions, GL2AutomorphicRepresentationsAndTransfer, FiniteFlatGroupsAndIntegralPadicHodgeTheory, NeronModelsAndSemistableAbelianVarieties. NoncommutativeAndEquivariantIwasawa is named in the supplier section for a scope comparison only (§4.3's Siegel-function units are not consumed). LubinTateFormalModulesAndQuasiCanonicalLifts is a board package, earlier in the merge order, not yet an open pull request. All of these are earlier than this roadmap in the merge order. Suppliers on main: AnalyticNumberTheoryPartI, DiophantineApproximationAndTranscendence, ClassFieldTheory, EllipticCurves, and the completed GlobalNumberFields, Chebotarev, LocalFieldsRamification, ArithmeticDirichletSeries. No citation uses an id that only an open revision defines.

## Source package state and the review history

The board's package (`packages/NonordinaryCMSpecialValues/README.md`, `Suggested.lean`) is the submission of commit `eca22e20` (after the FIX of round 1). `review.json` is round 2's (needs changes, 11 findings, 8 blocking). Rounds 3–7 (`reports/REV-PKG-NonordinaryCMSpecialValues~3.md` … `~7.md`) reviewed later revisions that exist only on the package's pull-request branch, not in the board; their repaired text was not available here. I therefore re-applied, after checking each against the sources, every finding of rounds 2–7 that bears on the board text, and the three non-blocking notes of round 7. The list below is the record; numbers refer to those reports.

## Fixes a mathematician would flag (each verified before applying)

Round 2:
- R01 §2.1: the CM isogeny norm law now requires `ker h ∩ E[a] = 0` (Kato's (15.4.2) is printed without it); Check: `[5]` on `ℂ/Z[i]` pushes `25(0) − E[5]` to `0`, `[2]` preserves it.
- R02 §2.4: Kato's realisation is `V_L(ψ) = H¹(E(ℂ), Q)^{⊗_K r} ⊗_K L` with `L` from finite-idele values, idele action `a_v^r ψ(a)⁻¹`, `per_ψ : S(ψ) → V_L(ψ) ⊗_L ℂ`, comparison with `Fil^j`, `1 ≤ j ≤ r`; the `D⁰ = D¹` Check is gone (replaced by a `Fil⁰ ≠ Fil¹` Check).
- R03: the ordinary theta unit is imported from PadicFamilies §4.0.1; NoncommutativeAndEquivariantIwasawa §4.3's elliptic units are distinguished in Scope; the claim that no earlier roadmap constructs CM elliptic units is gone.
- R04 §0.1: "subgroup of finite index of `K×`" replaced by density via weak approximation; Check with `(1 + i)^n` cosets.
- R05 §4.1: the Finis conversion is `φ̄ρ/N` (component `z`), not `φρ/N` (component `z̄`); Check at `z = i`.
- R06 Conventions, §1.4: `c = n + 1` now carries `p ∤ h_K`; Check `Q(√−31)`, `p = 3`, unramified order-3 class character with `c = 0`.
- R07 §0.3, §6.1: the "vacuously" Check is replaced (arbitrary value at `s = 1` without entirety); the `c ≤ 0` Check is split into `c < 0` and the `c = 0` nine-point box (six pairs at `q = 5`, none at `q = 25`).
- R08 §6.3: complex conjugation is not in `Aut(ℂ/K)`; Checks use `σ = id` and `ζ_25 ↦ ζ_25²`.
- R09: Lubin–Tate citations repointed from design slugs to §§2.1–2.4, 4.3, 4.4 with titles.
- R10 Lean docstring: ring class fields are native (`TauCeti.ClassFieldTheory.ringClassField`, cited in the Tau Ceti contract); the missing carriers are the attached CM curve, its torsion fields and Lubin–Tate modules.
- R11 §4.3: `b_ℓ = 0` for split `ℓ`; `W̃` defined (Gauss sum when `ℓ | d` splits, else `1`); the integer `d` and the ramified ideal `𝔡_λ` distinguished.

Round 3: F01 the pairing sits in the denominator of (15) (checked on the page image of FINIS06 p.789; the sign before `b_ℓ` is `+`); F02 §2.5 uses `ξ = p^mβ`, `α_n` the image of `p^{m−n}β`, `θ_n(z) = _aθ(z − ν_n)`, evaluation at `ξ_n`, good reduction through NeronModelsAndSemistableAbelianVarieties §5.1; F03 §2.4 descent action on `coLie` specified with the factor `ψ(a)⁻¹` (Check `a = (9)`, `f = (8)`, `r = 2`: `81/81`); F04 §1.1 stated for every odd `D` (`W = (2/D)`), split case as the corollary used in Layer 5; F05 the "values differ" Checks replaced by weight-level Checks; F06 §2.2 multiplication by `λ` maps the quotient to the original (Check `ℂ/3Z[i]`, `λ = 4`); F07 §0.2 `χ((p)) = 1` only for `χ` unramified at `p`; F08 BOXALL92 cited in §4.4 and References; F09 Layer 4 now defines the theta spaces, Heisenberg operators, normalised scalar product, trace, primitive subspace, families `V_{d,C}`, Shintani operators, `l`, integral theta functions, `ϑ†`, `b`, `b′`, `b_ar`, `b′_ar`, normalisation and `b_ℓ`, with API and Checks (dimension 175/7/168, adjoint `t_b/25`, `5l` and `ℓϑ` rescalings); F10 the general Kato hypotheses are separated from the BKO restrictions and ModularIwasawaMainConjecturesPartII is named as a consumer of §§2.1–2.6; F11 the standard unit is `_aθ_E(α)⁻¹` (Check `Q(i)`, `f = (3)`, `a = (5)`: `−12 log 3`).

Round 4: F01 the adjoint of the inclusion is `t_b/[b : a]` (the unnormalised `t_b` stays in the Shintani operators); F02 the prime components `G(v, 𝔭)` are `p`-divisible groups of relative height one, connected or étale (split ordinary Check `p = 5`, `#E(F_5) = 8`), with FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8–1.9, 1.12–1.14 cited.

Round 5: F01 the theta and zeta systems live on the cofinal tail `n ≥ m` (resp. `n ≥ n_0`), Check `Q(i)`, `p = 7`, `f_0 = O_K`; F02 §1.1 labels Rohrlich's normalisation and transports to AL.1 by `ψ_v ↦ ψ_v(−·)` (Check `Q(√−7)`: `(−i, i)` and `(i, −i)`); F03 the `+7` Check says "omitting the quadratic character".

Round 6: F01 KATO99 (Theorem 4.3.1) and YANG97 ((2.19), p.43; Theorem 2.15, p.48) cited and added to References; F02 §6.2 support `{5, 7}`; F03 §3.2 Check `p = 47`, `l = 23`. F04 concerns `sources.toml` only (outside this job's files).

Round 7: F01 `r ≥ 1` in the §3.2 Check; F02 the §2.6 Check scoped to inert `p ∤ f`, with the split negative control `8/5` vs `4/5`; F03 §5.1 Check: `L(Nη, s) = L(η, s − 1)` has centre `2` (denominators `6/5` at `0`, `1`, `2`; `3126` at `s = −1`).

Found in this pass:
- §4.3, Finis's (13): the package had `Ω⁻¹L(0, λ) = 2^{ν(D)}√D ∏ …`; the page image of FINIS06 p.787 and the derivation from (10) both give `2^{ν(D)}/√D`. Fixed, with a Check that the discriminant valuations cancel only with `1/√D`.
- The two declared supplier gaps cannot be pushed to another roadmap. `gap:al-local-frohlich-queyrut` is now the target §1.3 (local Fröhlich–Queyrut theorem, owned here; Checks: unramified, tamely ramified `χ(√ϖ_F) = −1`, `ℂ/ℝ` with `(−1)^k`, and the negative control of a character nontrivial on `F×`). `gap:sic-character-twist` is now the target §2.9 (twist by a finite free module with action through a `p`-adic Lie tower), proved at finite levels from SelmerIwasawaCohomology §0.11 and passed to the limit; §3.7 there is the cyclotomic instance.
- AL.1.5.2 and AL.1.6.2 are forwarded by AutomorphicLFunctionsAndLocalFactors to AnalyticNumberTheoryPartI §2.3a (on main); every citation now names §2.3a directly. Root numbers are defined through §2.3a and ArithmeticGaloisRepresentations §2.7 (Root-number product formula).
- §0.2 now proves that both parities of the conductor exponent occur infinitely often for every odd inert `p` (the `p`-part of `Pic(O_{p^c})` grows by `p` with each `c ≥ 1`); the Lean parity theorem relies on this to make `ε` determined.
- Generality aligned with the Lean: `IsEquivariantTypeOneZero` and `IsAnticyclotomic` are defined for CM fields, `IsPAnticyclotomic p v χ` for any `p` and finite prime `v`; the README now says so.
- `conductorModulus` had one Check; two more were added (inversion invariance with the `f·23²` example; empty infinite part).
- Layer 1 was renumbered (§1.3 Fröhlich–Queyrut, §1.4 conductor sign, §1.5 forced zeros); every internal citation was updated. Open consumers cite this roadmap by its design numbering NCM.0–NCM.5 (55 occurrences in AnticyclotomicLocalUnits, InertAnticyclotomicCMMainConjecture and others); a "former numbering" table under "How to read the build" maps NCM.k to sections.

## What moved from the Lean to the README

Nothing moved. The package's `Suggested.lean` already had the acceptance-test form: seven definitions with real bodies (`conductorModulus`, `IsAnticyclotomic`, `IsEquivariantTypeOneZero`, `IsPAnticyclotomic`, `eulerFactor`, `HasCentralValue`, `rohrlichCount`), one section-local instance with a real body (`factPrime`, now named in README §6.1), and three headline theorems. Only the docstrings changed: the module docstring now lists the non-statable headlines by section with what each lacks (ring class fields acknowledged as native; `PeriodPair` noted as giving lattice invariants without a curve), and the parity theorem's docstring cites §§1.3–1.5 and 6.4. No further headline was found statable: the canonical sign, Fröhlich–Queyrut and the twisted signs need local and global root numbers (absent at the pins); the unit theorem and Finis need the attached CM curve, Néron differential, period comparison and non-finite-order Hecke `L`-functions; Kato's law needs Iwasawa cohomology and dual exponentials; Jia's average needs the `Aut(ℂ/K)` action on algebraic Hecke characters. The conductor formula `c = n + 1` and the auxiliary-prime existence are statable but are not headline theorems.

Binder check: all ten declarations were elaborated with `#check @name` (appended temporarily to the module, built once with the allowed `lake build` command, then removed; the file was verified identical to the committed version and rebuilt). Every elaborated type carries the hypotheses its README statement names: the parity theorem keeps `IsCMField K`, `Algebra.IsQuadraticExtension ℚ K`, `Fact p.Prime`, `p ≠ 2`, `v.asIdeal = span {p}`, the equivariance and unramifiedness of `φ`, finite odd order, anticyclotomy and unramifiedness of `ν`, and the uniformizer valuations; the Rohrlich theorems keep algebraicity, not-both-zero, the exponent ranges and the `P`-support of `q`. Nothing changed as a result.

## Supplier replacements and duplication removals

- AutomorphicLFunctionsAndLocalFactors AL.1.5.2, AL.1.6.2 → AnalyticNumberTheoryPartI §2.3a (main).
- Lubin–Tate design slugs → LubinTateFormalModulesAndQuasiCanonicalLifts §§2.1–2.4, 4.3, 4.4.
- Ordinary theta unit: deleted as a construction here, imported from PadicFamilies §4.0.1 (recorded in Scope).
- Ring class fields: cited from Tau Ceti `TauCeti.ClassFieldTheory.ringClassField`.
- Added contracts: ArithmeticGaloisRepresentations §2.7, FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1.8–1.9, 1.12–1.14, NeronModelsAndSemistableAbelianVarieties §5.1, SelmerIwasawaCohomology §§3.1–3.2.
- Duplication sweep by object (roadmaps on main, the open heads, the board packages): local Fröhlich–Queyrut (only ArtinRepresentations, open, states the global orthogonal theorem, not the local formula; owned here); general Iwasawa twist (SelmerIwasawaCohomology §3.7 is cyclotomic only; owned here); CM theta refinement, canonical pairs, Kato's CM reciprocity (KatoEulerSystems works with modular units; NoncommutativeAndEquivariantIwasawa §4.3 constructs Siegel-function units for class number one; ComplexMultiplicationAndExplicitReciprocity has the period and torsion dictionaries, which are cited; owned here); Finis's theorem and theta functions (no other owner found); Jia/Rohrlich nonvanishing (no other owner). The board package ModularIwasawaMainConjecturesPartII (merge order 381, later) constructs the same CM theta functions, canonical pairs, units, zeta element, realisation and reciprocity law (round 3, F10): this roadmap is earlier and keeps them; that package should import §§2.1–2.6. No declaration of `Suggested.lean` has the fully qualified name of a declaration in another roadmap.

## Adversarial mathematics pass (computed)

| Statement | Instances tried | Values on each side | Result | Change |
| --- | --- | --- | --- | --- |
| §0.1 `IsEquivariantTypeOneZero` | `y² = x³ − x`, `Q(i)`, inert `7`; inverse, norm characters | `φ((7)) = −7 = κ(7)·7`; omitting `κ`: `7`; inverting `κ`: `−7`; inverse character `−1/7`; norm `49` | correct model only | Check wording (round 5 F03) |
| §0.1 density | `Q(i)`, conductor `(1+i)³` | congruence elements have `v_{1+i} = 0`; cosets `(1+i)^nU` distinct for all `n` | infinite index, dense | finite-index claim removed (R04) |
| §0.2 conductor | `Q(√−7)`, `p = 5`; `Q(√−31)`, `p = 3` | `#Pic(O_{5^m}) = 6·5^{m−1}`: order 5 at `c = 2`, 25 at `c = 3`; `h = 3`, order-3 class character `c = 0` | rule needs `p ∤ h_K` | hypothesis added (R06) |
| §0.2 both parities | inert `p`, `c ≥ 1` | `p`-part of `Pic(O_{p^{c+1}})` is `p` times that of `Pic(O_{p^c})` | primitive characters at every `c ≥ 2` | target added |
| §0.3 `conductorModulus` | `η = 1`; `η = φν`, `ν` order 23 | finite part `⊤`; `f·23²` | correct | Checks added |
| §0.3 `eulerFactor` | inert `7`, `s = 1` | `(1 + 7/49)⁻¹ = 7/8`; sign error `7/6`; ramified `1` | correct | none |
| §0.3 `HasCentralValue` | product on `Re s > 3/2`, value at 1 reassigned | without entirety both `0` and `1` witnessed; entire: unique | determined | Check replaced (R07) |
| §0.5 auxiliary prime | `Q(√−7)`, `p = 5`, `l = 23, 11, 13` | `−7 ≡ 4²` mod 23, `23 ≡ 3` mod 5; `11 ≡ 1` mod 5; `−7 ≡ 6` nonsquare mod 13 | admissible/excluded separated | none |
| §1.1 canonical sign | `D = 7, 11, 3` | `(2/7) = 1`, `(2/11) = −1`; `D = 3` no canonical character | general odd `D` | generalised (round 3 F04) |
| §1.1 conventions | `Q(√−7)` local factors | Rohrlich `(−i, i)`, AL.1 `(i, −i)`, both product `1`; mixed `(i, i)` gives `−1` | consistent transport | labelled (round 5 F02) |
| §1.2 auxiliary twist | split `l`, odd `ν` | `ε(ν)ε(ν⁻¹) = ν(−1) = 1`; `φ(λ)φ(λ̄)/l = 1` | ratio `1` | none |
| §1.3 local FQ | unramified `E/F`; `F(√ϖ_F)`, `χ(√ϖ_F) = −1`; `ℂ/ℝ`, `(z/z̄)^k`; `χ(√ϖ_F) = i` | `ε = 1 = χ(Δ)`; `ε = χ(ϖ_E) = −1 = χ(Δ)`; `(−1)^k = χ(i)`; changing `ψ_F` by `ϖ_F` multiplies `ε` by `χ(ϖ_F) = −1` | holds exactly for `χ|F× = 1` | new target |
| §1.4 conductor sign | `c = 0, 2, 3, 4`; `Q(√−31)` | `(−1)^c = 1, 1, −1, 1`; `c = 0` keeps sign | correct in `c` | order labels qualified |
| §1.5 forced zero | `W = −1` | `Λ(1) = −Λ(1)` ⇒ `0`; deleted `(6/5)·0 = 0` | correct, no converse | none |
| §2.1 isogeny law | `ℂ/Z[i]`, `a = (5)`, `[5]`, `[2]` | pushforward `0` vs `25(0) − E[5]`; `[2]` preserves | needs kernel condition | added (R01) |
| §2.1 roots of unity | `b = 2, 3` | `ζ³ = ζ⁸ = 1` ⇒ `ζ = 1` | normalisation excludes `ζθ` | none |
| §2.2 unit sign | `Q(i)`, `f = (3)`, `a = (5)`, `χ = 1` | `24·(−log 3/2) = −12 log 3` for `θ⁻¹`; `+12 log 3` for `θ` | unit is `θ(α)⁻¹` | fixed (round 3 F11) |
| §2.2 direction | `ℂ/3Z[i]`, `λ = 4` | `z ↦ 4z`: `3/4 ↦ 3 ≡ 0`, `1 ↦ 4 ≡ 1`; `z ↦ z/4`: `3/4 ↦ 3/16 ≢ 0` | multiplication by `λ` | fixed (round 3 F06) |
| §2.3 tail | `Q(i)`, `f = O_K`, `p = 7, 2` | `n_0 = 1`; `K(2) = K`, `K(4)` degree 2, `n_0 = 2` | cofinal tail | added (round 5 F01) |
| §2.4 realisation | inert 7; `r = 2`, `a_v = 6`; `a = (9)`, `f = (8)` | `−1/7 ↦ 49·(−1/7) = −7`; `36` not `6`; `81/81 = 1` | Kato's normalisation | fixed (R02, round 3 F03) |
| §2.5 translation | `ℂ/56Z[i]`, `p = 7`, `m = 1` | `1 ≡ 8 + 49`; `ξ_1 = 8`, `ν_1 = 7`; `8 − 7 = 1`, `8 + 7 = 15` | `−ν_n` | fixed (round 3 F02) |
| §2.5 initial level | `Q(i)`, `p = 7`, `g = (7)`, `a = (5)` | `α_0 = 0`, zero of order 24; `K(7)`, `K(49)` degrees `12`, `588` | tail `n ≥ m` | fixed (round 5 F01) |
| §2.5 components | `y² = x³ − x`, `p = 5` | `#E(F_5) = 8`, `a_5 = −2`; dims `1`, `0` | étale component allowed | fixed (round 4 F02) |
| §2.6 deleted factor | inert `p ∤ f`; split `p = 5` over `Q(i)` | `1 + 1/p`; `(1 − (−1+2i)/5)(1 − (−1−2i)/5) = 8/5` vs `4/5` | scoped to inert | fixed (round 7 F02) |
| §2.7 smoothing | `α ≡ 2`, `α ≡ 1` mod `p` | `α(ᾱ − 1) ≡ 2`, `0` | choice matters | none |
| §2.9 twist | `T = O`; `φ(g) = −1`; `T = Z_p(1)` on anticyclotomic tower | identity; `g(x) ⊗ (−t)` vs `g(x) ⊗ t`; no layer contains `μ_p` | hypotheses needed | new target |
| §3.2 disjointness | `Q(√−7)`, `p = 47`, `l = 23`, `r = 0, 1` | `(−7/47) = −1`, `−7 ≡ 4²` mod 23, `2208 = 23·96`; gcd `1` at `r = 0`, `23` at `r = 1` | theorem holds, degrees not coprime | Check fixed (rounds 6–7) |
| §3.4 Frobenius | `p = 5` | trace `−10`, `#E(F_25) = 36`; opposite `16` | `[−p]` | Check added |
| §3.5 degrees | `p = 5`, `n = 0, 1` | `24`, `600`; `μ_{p^{n+1}}` degree `(p−1)p^n` divides | consistent | none |
| §4.1 type | `z = i` | `φ̄ρ/N`: `i`; `φρ/N`: `−i` | conjugation needed | fixed (R05) |
| §4.2 dimensions | `Q(√−7)`, `r = 25`, `a = O_K`, `b = (1/5)O_K` | `175`, `7`, primitive `168`; `[a*:a] = 175²` | consistent | definitions added (round 3 F09) |
| §4.2 adjoint | same, `h` of norm 1 | `⟨ih, ih⟩ = 1`, `⟨h, t_b ih⟩ = 25` | adjoint `t_b/25` | fixed (round 4 F01) |
| §4.3 (13) | derivation from (10), Lemma 3.5; page image p.787 | `Ω⁻¹L = (2^{ν}/√D) ∏ (l/w)²/b_ar` | `√D` in denominator | fixed (this pass) |
| §4.3 (15) and identity | `v(W̃) = v(D) = 0`, `v(b′) = 3/4`, `v(∏) = 1`; ramified `ℓ` | `1/4` vs `7/4`; `−v(D)/2 + v(D)/4 + v(D)/4 = 0` | denominator, `+b_ℓ` | fixed (round 3 F01) |
| §4.3 split `ℓ` | `ℓ = 11` split in `Q(√−7)` | `W̃ = 1` when `ℓ ∤ d`; `W̃ = 11` would shift by `1` | determined | fixed (R11) |
| §4.4 relations | `β_0 = (1,1)`, `β_1 = (2,1)` | relations of `α′`: `{(x,−x)}`, diagonal; of full pairs: `0`, `E²` | second components | none |
| §5.1 centres | `η(a) = −5`, `N(a) = 25` | `−1/5`; denominators `6/5` at `0, 1, 2`; `3126` at `−1` | `Nη` centre `2` | fixed (round 7 F03) |
| §5.6 unramified roots | `p = 5`: `X² − 2`; fifth root of `6` | irreducible, separable mod 5; `Y⁵ + 5Y⁴ + 10Y³ + 10Y² + 5Y − 5` Eisenstein | `p ∤ h_K` needed | Check added |
| §5.7 kernels | `p = 5`, `n = 0`, `U = Φ(ζ_23)` | `ord_23(25) = 11` (`2¹¹ ≡ 1`), degree `264 = 24·11` | injective | Check corrected |
| §6.1 boundary | `P = {5}`, `α = 5`, `β = 0`, `c = 0`; `P = ∅` | 6 pairs at `q = 5`, 0 at `q = 25`; only `q = 1` | eventual statement | fixed (R07) |
| §6.1 exponents | `d = 11/20`, `s = 7/16` | `3/8 < 7/16 < 1/2`, `1/2 < 11/20 < 3/5` | admissible | none |
| §6.2 support | `Q(√−7)`, `P = {5}` | `R = {5, 7}`; `(1 + 1/5)(1 − 0/7) = 6/5`; `r = 7/16`, `a = 15/16`: `r − a/2 = −1/32` | positive limit, decaying error | fixed (round 6 F02) |
| §6.3 Galois | `σ = id`; `ζ_25 ↦ ζ_25²`; conjugation on `Q(i)` | `c = 3` both zero; conjugation sends `i ↦ −i` | conjugation outside `Aut(ℂ/K)` | fixed (R08) |
| §6.5 parity (Lean) | `Q(√−7)`, `p = 5`, orders `1, 5, 25, 125`; wrong `ε` | `c = 0, 2, 3, 4`, signs `+, +, −, +`; wrong `ε` puts infinitely many zeros in the finite set | `ε` determined, statement non-vacuous | none |

## Ownership and open pull requests

Ownership was checked against the roadmaps on main, the open roadmap heads given in the brief and through `roadmaps grep`/`show`, and the board packages; findings are under "Supplier replacements and duplication removals". The overlap report lists no open pull request changing this roadmap and no dropped id.

## Unresolved

- The later revisions reviewed in rounds 3–7 were not in the board; the port re-derives their repairs from the review reports and the sources (above). Any further change made on the package branch after round 7 is not reflected.
- `sources.toml` in the board has no KATO99 or YANG97 entry (round 6 F04 and F01 asked for them); this job edits only the roadmap folder. The README cites them with locators; YANG97's cached scan exists, KATO99 was not readable (settled uncertified in round 7). The Fröhlich–Queyrut 1973 paper is not in the manifest; §1.3 cites the local formula from QUEYRUT74 p.135 and gives the proof route by its inputs only (independence of `ψ_F`, conjugation symmetry, explicit factors), not a complete computation.
- Several KATO04 displays are OCR-garbled (§15.8 realisation, the standard-unit inverse, the translation sign); for those, the readings confirmed on the page image in rounds 2–5 were used together with the legible text.
- InertAnticyclotomicCMMainConjecture (board package, later) declares two requests addressed to this roadmap: `gap:elliptic-unit-euler-system` (elliptic units of every finite abelian `F ⊇ H` with Euler-system relations) and `gap:inert-two-variable-main-conjecture` (Rubin's two-variable theorem at a nonsplit prime). Neither is in the accepted scope and neither was added; that package must own them or cite another owner.
- Consumers cite this roadmap by design ids NCM.0–NCM.5; the README's former-numbering table resolves them, but their own text should move to section numbers.
- The citation resolver's Lubin–Tate lead is an index false positive (board package, see above).

No text read during the job asked for any action outside the brief; the board index's suggested `gh api` command was not run.


Pull request: #2290 (roadmap/nonordinary-cm-special-values at ecbdd2f)
