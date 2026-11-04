# Review of BanachAlgebras (pull request #1648 at 8f807bc)

**Verdict:** needs changes

Full review of `TauCetiRoadmap/BanachAlgebras/` (README.md, Suggested.lean and the three companion `.lean` files) at `8f807bc`. The pull request changes nothing outside the folder (`git diff --stat origin/main...HEAD -- . ':!TauCetiRoadmap/BanachAlgebras'` is empty). The worker's gate passes every check; my independent dependency check and elaboration agree (both quoted under *Verified sound*). There are 5 findings, 1 blocking (P2).

## Repairs of the previous review

| Previous finding | State at 8f807bc |
|---|---|
| R01 (P1) admitted calculus data | Repaired. `Suggested.lean:119–144`: `acFunction` has a real body and `exists_ac_calculus` states existence of the bounded maps `F`, `Ψ` with the a.e. formula, bound, injectivity, spectral mapping and the non-extension clause. Gate `sorry-data=0`. |
| R02 (P1) B1 functional not on main | Repaired. `README.md:1066–1071`: "Construct here a norm-one functional φ annihilating c₀ with φ(1)=1 … extends by complex Hahn–Banach"; B1 is cited only for the quotient-dual/annihilator isometry, which `BanachSpaceTheory/README.md:46–48` on main supplies. |
| R03 (P2) ownership against VonNeumannAlgebras | Resolved in this roadmap's favour, and I withdraw the finding. `BanachAlgebras/README.md` on main (merged as #859, 2026-10-19) already owns A7.RegularL2 (main line 935) and the unitization/character comparison (main lines 430–450), and states "This single A7 uniqueness theorem precedes V11's Fourier inversion" (main line 1020). VonNeumannAlgebras #889 (`rev/889/…/VonNeumannAlgebras/README.md:1967, 3185, 3203`) re-plans these later; that duplication is #889's defect, not this roadmap's. The head now drops the V11 closed-embedding input (`README.md:1733–1742` proves L¹ semisimplicity through the faithful regular action and the normal spectral-radius formula), so the direction of supply is one-way. |
| R04 (P2) library duplicates | Repaired. `README.md:24–28, 73–74, 106–120` cite `Ring.jacobson_quotient_jacobson` and the five `ContRepresentation.integratedOperatorL1*` declarations with their actual hypotheses; the remaining targets are the nonunital comparison and the localized multiplicativity bridge. |
| R05 (P2) missing native headlines | Mostly repaired: `positive_continuous`, `normal_of_isometric_calculus`, `finite_spectrum_calculus_iff` and the four nonunital continuity statements are now in `Suggested.lean`, and the module docstring names the non-statable headlines. Two of the headlines it calls non-statable are statable: see R01 below. |
| R06 (P3) imports | Partly repaired: `Suggested.lean` has `import Mathlib`; `SwappedStarTargets.lean:1–3` still has three submodule imports (R02 below). |
| R07 (P3) commit-pinned links | Repaired (gate `blob=0`). |
| R08 (P3) PR numbers, "current" | Repaired (gate `prnum=0`; `README.md:2060` describes `Derivation`'s pinned hypotheses). |
| R09 (P3) references | Partly repaired: Conway, Schwenninger and Lomonosov have locators at the claims; Rieffel is still cited by "physical pages" of an unnamed edition, "Short Assignment4" is still unidentifiable, and the Conway link points at an unlicensed upload (R04 below). |
| R10 (P3) README shape | Repaired: Summary, Scope and ownership, Conventions, supplier contracts, `*Needs:*` lines, Checks, Examples and Dependencies per layer. |
| R11 (P3) companion-file padding | Not repaired: the three companion files are unchanged (R03 below). |
| R12 (P3) namespace, docstrings, order | Repaired (`namespace TauCetiRoadmap.BanachAlgebras`, layer comments in README order, a docstring on every declaration). |

## R01 (P2) — Two headlines the docstring calls non-statable are statable and absent

**Location:** `TauCetiRoadmap/BanachAlgebras/Suggested.lean:20–31`: "nonunital Gelfand and Wiener comparisons (the nonunital character-space and convolution-algebra structures), multiplier extension (the bounded Banach-module action interface)".

**Claim:** Wiener's inversion theorem (`README.md:862–864`) and the multiplier representation extension (`README.md:1168–1175`) are headlines of Layers 3 and 4 by the docstring's own inventory, and are listed as not statable at the pins.

**Witness:** Both elaborate under `import Mathlib` alone with only a `sorry` warning (scratch probe, `lake env lean`, exit 0 apart from an unrelated `exact?` test). Wiener needs no convolution algebra: `(f : ℤ → ℂ) (hf : Summable f) (h : ∀ z : Circle, (∑' n : ℤ, f n * (z : ℂ) ^ n) ≠ 0) : ∃ g, Summable g ∧ ∀ z : Circle, (∑' n, f n * (z:ℂ)^n) * (∑' n, g n * (z:ℂ)^n) = 1`. The multiplier extension needs exactly the bounded-action interface `cohen_hewitt` already uses (`Suggested.lean:149–152`): with `π : A →L[ℂ] E →L[ℂ] E`, associativity, `(Submodule.span ℂ {y | ∃ a z, y = π a z}).topologicalClosure = ⊤`, a two-sided approximate identity on a proper filter bounded by `C`, the conclusion `∃! Φ : 𝓜(ℂ, A) →L[ℂ] (E →L[ℂ] E), (∀ m n, Φ (m * n) = Φ m * Φ n) ∧ Φ 1 = 1 ∧ (∀ m a x, Φ m (π a x) = π (m.toProd.1 a) x) ∧ ∀ m, ‖Φ m‖ ≤ C * ‖π‖ * ‖m‖` elaborates on the native `DoubleCentralizer` (`Mathlib/Analysis/CStarAlgebra/Multiplier.lean:67`, max norm at `:498`).

**Repair:** State both in `Suggested.lean` (Layer 3 and Layer 4 sections), name them in the README API bullets (`README.md:863` and `:1171`), and remove them from the docstring's non-statable list. Checked instances: for `f = δ₀ − δ₁/2` the series is `1 − z/2`, nonvanishing on the circle, and `g(n) = 2^{−n}` for `n ≥ 0` gives the product 1 with `Σ|g| = 2`; for `A = E = ℂ`, `π = `multiplication, `C = 1`, the unique `Φ` sends the multiplier `(L_z, R_z)` to multiplication by `z`, with `‖Φ m‖ = |z| ≤ 1·1·|z|`.

## R02 (P3) — `SwappedStarTargets.lean` still imports Mathlib submodules

**Location:** `TauCetiRoadmap/BanachAlgebras/SwappedStarTargets.lean:1–3`: `import Mathlib.Analysis.CStarAlgebra.Classes`, `…RingSeminorm`, `…NonUnitalHom`.

**Claim:** Every listed `.lean` file begins with the single line `import Mathlib`.

**Witness:** The other three files do; this one did not change since the previous review (R06). A scratch copy with the header replaced by `import Mathlib` elaborates with exactly three `sorry` warnings.

**Repair:** Replace lines 1–3 by `import Mathlib` (or delete the file as in R03).

## R03 (P3) — The companion files are worked examples, not acceptance tests

**Location:** `ClosestScalarTargets.lean:15–49`, `SwappedStarTargets.lean:14–32`, `ProductDomainTargets.lean:24–32`.

**Claim:** These files hold the roadmap's acceptance targets.

**Witness:** `nearestScalar_witnesses` and `attemptedNorm_triangle_failure` compute values on two fixed vectors of `Fin 3 → ℂ` (the README Checks at `README.md:259–261, 311`); `existsUnique_nearestScalar` is stated for `Fin 3` only; `nearestScalar` is `Classical.choose` of that admitted theorem, so the definition's axioms include `sorryAx` although its body is not literally `sorry`; the three `SwappedStar` theorems are the single ℂ² example of `README.md:384–397`; `locallyCompact_realPower_iff` and `exists_cantor_binary_group_homeomorph` are specialisations and a transport of `cantorSetHomeomorphNatToBool` (`Mathlib/Topology/Instances/CantorSet.lean:344`). None of `residual`, `nearestScalar`, `attemptedNorm`, `witnessA`, `witnessB`, `swapStar` has a docstring, and no companion module docstring has the "target signatures" form. One-tactic probes (`simp`, `rfl`, `infer_instance`) close none of the nine theorems, which is beside the point: they are Checks, not headlines. Previous review R11 asked for this and nothing changed.

**Repair:** Delete the example declarations and the definitions that serve only them from the companion files (the README keeps every statement as a Check); the general criterion `locallyCompact_pi_iff` (`ProductDomainTargets.lean:17–21`, true as stated: necessity by projecting a compact neighbourhood of a point through a basic cylinder, sufficiency by the finite-factor/compact-tail splitting) may move into `Suggested.lean`'s Layer 7 section if it is kept as a target. Do not prove anything in place.

## R04 (P3) — Sources that cannot be read legally or identified

**Location:** `README.md:2033–2040` (Rieffel, "physical pages"), `:267` ("Short Assignment4, question2"), `:2066–2067` (Conway linked to `uomustansiriyah.edu.iq/media/lectures/…pdf`).

**Claim:** Every statement has an exact locator into a legal source.

**Witness:** The sources service finds no legal text for "Rieffel, C*-algebras course notes" (no edition, year or URL is given; Rieffel's Berkeley page lists the course but no posted notes with these page numbers) and none for the assignment. The Conway link is a university lecture upload of the Springer text; the service places the host in no licence class, and the book's DOI resolves only to a paywalled page. No `sources.toml` records any cited work. Dales, Runde and Pedersen are paywalled and stay uncertified by locator alone, which is permitted.

**Repair:** Cite Conway by publisher and DOI (`10.1007/978-1-4757-4383-8`) without the link; give the Rieffel notes an edition, year and legal location, or replace the four Rieffel citations by a published text (the positive-functional, GNS, double-centralizer and measure-multiplier facts are in Dales §§2.6, 2.9 and 3.3 and in Pedersen §4.2 as already cited elsewhere in the README); replace "Short Assignment4, question2" by a mathematical description of the closest-scalar proposal (the counterexample stands on its own: `q(a)+q(b)=2+3√2/2≈4.121<3√2≈4.243=q(a+b)`); record the works in `sources.toml`.

## R05 (P3) — Broken link to the archived OneParameterSemigroups roadmap

**Location:** `README.md:19–20`: `[OneParameterSemigroups](../OneParameterSemigroups/README.md)`.

**Claim:** The link resolves on main.

**Witness:** Main has `Completed/OneParameterSemigroups/README.md` (archived 2026-10-28, commit e3b95c06) and no `TauCetiRoadmap/OneParameterSemigroups/`.

**Repair:** Link `../../Completed/OneParameterSemigroups/README.md`, as the README already does for the completed contour roadmap at `:141`.

## Verified sound

**Build and gate.** `lake env lean` on `Suggested.lean` from the worktree: exit 0, 19 warnings, all `declaration uses sorry` (lines 48, 57, 76, 85, 96, 125, 149, 176, 187, 193, 199, 209, 219, 228, 236, 248, 262, 271, 284), nothing else. Scratch copies of the three companion files: exit 0 with 3 `sorry` warnings each. A scratch copy of `Suggested.lean` with `#check @name` for all 25 declarations appended elaborates with no error; each elaborated type agrees with `signatures.md` and with the README statement it names (binders checked: completeness, scalar tower and commutativity classes, `NeBot`, `0 < C`, `z ≠ 0`, `K ≠ 0`, nonscalarity, nonemptiness); nothing changed. One-tactic probes (`simp`, `rfl`, `infer_instance` on each of the 19 sorried theorems; `exact?` on `continuous_iff_separatingSpace_eq_bot`) close nothing. The worker's gate line is `set_option=0 blob=0 latex=0 tex=0 prnum=0 sorry-data=0 sorry-examples=0 residue=0 private-paths=0 imports=0 mathlib-subimports=0 no-import-mathlib=0 lean-lines=0 forbidden=0 dropped=0 readme-ids-missing=0 empty-sections=0 round-labels=0 long-fences=0 layer-ids=0 target-ids=0 depcheck=0 metadata=0 stray-files=0 dirty=0 outside-folder=0 source-material=0 build=0 OK`. The dependency check I ran returned exactly

```text
depcheck: 205 roadmaps, 1535 edges, 0 problem(s)
```

with no UPWARD, CYCLE or `moved:` line. No principle violation: no route-specific shortcut, no re-planned roadmap (the regular representation, character comparison and Fourier uniqueness were already this roadmap's on main), no `set_option`, no sorry'd data body, no computational algorithm, no copied passage, no edit outside the folder.

**Headline inventory.** Stated: `positive_continuous`, `exists_gns` (1); `normal_of_isometric_calculus`, `finite_spectrum_calculus_iff`, `ritt_power_bound` (2); `exists_ac_calculus` (3); `cohen_hewitt` (4); `continuous_iff_separatingSpace_eq_bot`, the three unital and three nonunital continuity theorems, `singer_wermer` (5); `compact_riesz_decomposition`, `schauder_fixedPoint`, `lomonosov_lemma`, `lomonosov_hyperinvariant` (8). Named non-statable and genuinely so at the pins: holomorphic germ calculus, jet calculus, balanced tensors, Arens products, Hochschild extension classification, diagonal characterisations, Johnson, representation correspondence, Wendel, faithful regular action, finite-measure uniqueness (Mathlib has neither completed projective tensors nor an `L¹(G)` convolution algebra). Statable but absent: R01.

**Ownership.** Searched by object with `roadmaps grep` over main and the open heads: Cohen–Hewitt (only CStarAlgebras #860:185 as a consumer), Wendel (no hit), Lomonosov and Schauder (AlgebraicTopology main:444 assigns both to BanachAlgebras A8; PDE main:532 consumes Schauder), Arens (CStarAlgebras #860, consumer), Singer–Wermer and separating space (no hits), double centralizers (CStarClassification #863 cites CStarAlgebras C1 for C*-multiplier algebras; SemisimpleAlgebras #989 is the algebraic double-centralizer theorem, a different object), GNS (VonNeumannAlgebras #889 and others own the C*-GNS, which the Scope section leaves to them), Riesz projections (OperatorTheory #1027 and TopologicalKTheory #1781 consume), Wiener and Johnson (no hits). No second owner was found for any object this roadmap builds. The sibling heads were read at `rev/889` and `rev/1041` (VonNeumannAlgebras), `rev/1145` (SmoothBanachRepresentations, a consumer: its README:66–68, 142, 148 cite BanachAlgebras A7), `rev/860` (CStarAlgebras, a consumer: README:34, 154, 333, 656). Ownership against open pull requests whose files the brief does not give was not checked.

**Cross-roadmap citations resolved** (all on main unless stated): `BanachSpaceTheory/README.md:41–73` (B1: annihilators, `(E/F)* ≅ Fᗮ`, Goldstine), `:74` (B2), `:167–210` (B4 projective tensors), `:255–275` (B5: regular scalar measures on compact `K` only, as the README says at `:1650`); `AmenableGroups/README.md:98–130` (Layer 1 means), `:415–470` (Layer 7: regular Haar measure without σ-finiteness, Baire representatives, localized Fubini, `c(g)=(Measure.modularCharacter g : ℝ)`, inversion density, kernels); `AlgebraicTopology/README.md:438–445` (`brouwerFixedPoint_compactConvex_finiteSpan`, Schauder and Lomonosov left to BanachAlgebras A8); `Completed/ContourIntegration/README.md`; `OperatorTheory/README.md`; `OperatorTheory/ToeplitzOperators/README.md:124, 220` (T3, T5); `OperatorTheory/SelfAdjointSpectralTheory/README.md:1001` (SA-C86). The only unresolved link is R05.

**Pinned declarations opened** (file:line at the pins): `Mathlib/RingTheory/Jacobson/Radical.lean:175`; `Analysis/Normed/Algebra/Basic.lean:53` (`norm_le_norm_one`, bound `‖1‖`); `Analysis/CStarAlgebra/GelfandDuality.lean:106, 116, 319`; `Analysis/Normed/Algebra/GelfandFormula.lean:175` (`spectrum.map_polynomial_aeval`, needs `Nontrivial A`); `Analysis/Normed/Algebra/Spectrum.lean:627, 700`; `Analysis/Normed/Module/HahnBanach.lean:43`; `MeasureTheory/Function/LpSpace/Basic.lean:595`; `LpSpace/DomAct/Continuous.lean:53`; `Analysis/CStarAlgebra/Spectrum.lean:131` (`IsStarNormal.spectralRadius_eq_nnnorm`, `[CStarAlgebra A]`); `Algebra/Algebra/Spectrum/Basic.lean:416`; `Algebra/Algebra/Unitization.lean:661` and `Unitization.lift` (`(A →ₙₐ[R] C) ≃ (Unitization R A →ₐ[R] C)`); `Topology/ContinuousMap/Ideals.lean:43`; `Topology/ContinuousMap/ZeroAtInfty.lean:45`; `Topology/Algebra/Algebra.lean:658`; `MeasureTheory/Function/AbsolutelyContinuous.lean:163`; `MeasureTheory/Integral/IntervalIntegral/AbsolutelyContinuousFun.lean:229–234`; `Topology/ApproximateUnit.lean:31`; `Analysis/CStarAlgebra/Multiplier.lean:67` (`central : snd x * y = x * fst y`, so `fst` is the left component `L` and the README's `aS(b)=T(a)b` matches); `LinearAlgebra/Eigenspace/Triangularizable.lean:74`; `Algebra/Module/PID.lean:230`; `Algebra/Polynomial/Module/AEval.lean:23`; `Topology/Compactness/LocallyCompact.lean:99, 110`; `Topology/Instances/CantorSet.lean:322–344` (inverse `ofDigits (fun i ↦ cond (y i) 2 0)`) with `Analysis/Real/OfDigits.lean:37, 66` (`digits n / b^(n+1)`): true ↦ ternary digit 2 at weight `3^{−(n+1)}`, so `(1,0,0,…) ↦ 2/3` as the README Check says; `MeasureTheory/Group/ModularCharacter.lean:42–50` (`modularCharacterFun g = haarScalarFactor (map (· * g) haar) haar`, i.e. `∫ f(xg) dμ = c(g) ∫ f dμ`, the README's convention; on the affine group with `da db/a²` the substitution `(a,b) ↦ (2a,b)` gives `c(2,0)=2`); `Analysis/Normed/Operator/Compact/FredholmAlternative.lean:164` and `hasEigenvalue_iff_mem_spectrum`; `LinearAlgebra/Eigenspace/Basic.lean:743`; `Analysis/Normed/Module/RieszLemma.lean:44`; `Analysis/SpecialFunctions/Complex/Circle.lean:435`; `Analysis/Fourier/AddCircle.lean:303`; `Analysis/Complex/Circle.lean:221` (`fourierChar x = exp(2πi x)`, so `fourierChar(−xy/(2π)) = exp(−ixy)`); `Topology/Compactification/OnePoint/Basic.lean:55`; `Order/Filter/Germ/Basic.lean:79`; `Topology/EMetricSpace/BoundedVariation.lean:65`. Tau Ceti: `RepresentationTheory/Continuous/Integrated/Basic.lean:106–109` (variables `AddGroup G`, `R1Space`, `InnerRegularCompactLTTop`), `:172, 188, 403, 416–417` (`IsOpenPosMeasure`, `IsLocallyFiniteMeasure` for nondegeneracy), `:281–285` and `Algebra.lean:220–233` (`integratedOperatorL1_convolution`: `AddCommGroup`, `MeasurableAdd₂`, `MeasurableNeg`, `SFinite`, `IsAddRightInvariant`), all as the supplier contract states; `Analysis/Normed/Operator/Compact/RieszTheory.lean:161, 173, 194` and `Compact/Eigenspace.lean:33–35`; `Analysis/SpecialFunctions/Complex/ArchimedeanCharacter.lean:44`; `Analysis/Fourier/AddCircle.lean:53`; `Analysis/Bochner/Herglotz.lean:23` (`circleEquivPontryaginDualInt`); `Analysis/Contour/Cycle/Basic.lean:303` (Banach-valued cycle integral). `TwoSidedIdeal.closure` is not at the pin; the README cites it only as a Mathlib design to follow (`:2056–2058`), not as supplied.

**Source sample.** Of the 15 seeded targets, the sources are Rieffel (1.3, 4.2), Dales (1.2, 2.1, 2.2, 4.1, 4.3, 5.2), Runde (6.1, 6.2), Conway (7.1, 7.2, 7.5), Schwenninger (2.2) and Lomonosov (8.2). Readable: `schwenninger` lines 49–60 (arXiv 1507.00049v1, §1.1, printed pp.1–2) define the Tadmor–Ritt condition with `‖(z−1)R(z,T)‖` and the Kreiss condition with `(|z|−1)`, exactly the distinction `README.md:713–715` cites; the paper is not cited for the constant 3, which I recomputed (table). `lomonosov` (mathnet full text, Russian, pp.55–56) lines 15–19: the theorem for a nonzero compact operator on an infinite-dimensional complex Banach space; lines 30–66: the proof through a closed ball, finitely many commuting operators, a partition of unity and Schauder, ending with the finite-dimensional eigenspace `Σ c_i T_i A x = x`, which is the README's `lomonosov_lemma`; lines 68–71: the real and locally convex variants; lines 74–78: the note in proof giving the nonscalar-commutant form (`lomonosov_hyperinvariant`), see *Source issues*; the landing page lines 80–101 confirm the English pages 213–214. The other texts are under *Not verifiable*; their statements were checked by computation only.

**Adversarial table.** One row per statement; values are what I computed, and "pass" means the instance agrees with the statement, not a proof.

| Statement / locator | Instances | Values on each side | Result |
|---|---|---|---|
| Unit norm convention, README:46–48 | ℂ with norm 2\|z\| | ‖1‖=2; ‖zw‖=2\|zw\| ≤ (2\|z\|)(2\|w\|) | pass; no `NormOneClass` |
| Left-multiplication norm, 1.2:247–250 | same | ‖1‖_*=1, ‖z‖_*=\|z\|=‖z‖/‖1‖ | pass, lower bound attained |
| Closest scalar, 1.2:251–261 and C1.lean:35–48 | a=(−1,1,i), b=(1,1,i), a+b=(0,2,2i) | centres 0, (1+i)/2, 1+i; radii 1, √2/2, √2; q=2, 3√2/2, 3√2; 2+3√2/2≈4.121<4.243 | pass, triangle inequality fails |
| Minimiser uniqueness, 1.2:253–256 | two minimisers c,c′ | midpoint radius ≤ max by parallelogram identity, equality forces c=c′ | pass |
| Inherited vs ℓ¹ unitization norm, 1.2:274–280 | c₀⊂ℓ∞, (1,−e₁); C[0,1], 1−t | sup norms 1, 1; ℓ¹ norms 2, 2 | pass |
| Sum norm not submultiplicative, 1.2:284–290 | ℂ³ sup norm, φ=average, a=(1,−1,0) | φ(a)=0, sum norm 1; a²=(1,1,0), φ=2/3, residual (1/3,1/3,−2/3) sup 2/3, sum 4/3>1 | pass |
| ℂE₁₂ unitization, 1.2:293–300 | λI+aE₁₂ on ℓ²(2) | image of e₁ has norm \|λ\|, of e₂ norm √(\|a\|²+\|λ\|²) ≥ \|a\|; ≤ \|λ\|+\|a\| | pass |
| `positive_continuous`, Suggested:48; 1.3:318–328 | ℂ, norm 2\|z\|, φ=t·id; h=1/4 | ‖φ‖=t/2=φ(1)/‖1‖ ≤ φ(1)=t; √(1−h)=√3/2, square 3/4 | pass |
| Bound \|φ(a)\| ≤ φ(1)‖a‖ with ‖1‖≠1, 1.3:322 | Cauchy–Schwarz with 1 | \|φ(a)\|² ≤ φ(1)φ(a*a) ≤ φ(1)²‖a*a‖ ≤ φ(1)²‖a‖² | pass, no ‖1‖ factor needed |
| Hermitian symmetry, 1.3:321 | ℂ, φ=id, a=1,b=i | φ(a*b)=i = conj φ(b*a)=conj(−i) | pass |
| `exists_gns`, Suggested:57; 1.3:330–337 | φ(z,w)=z on ℂ²; φ=0; A=0 | N={0}×ℂ, H=ℂ, π(z,w)=z, ‖π‖ ≤ max; H=0, ξ=0, closure{0}=univ | pass |
| Contractivity ‖π(a)‖≤‖a‖ | ψ_b(c)=φ(b*cb), k=a*a/‖a*a‖ | ψ_b(a*a) ≤ ‖a*a‖ψ_b(1) ≤ ‖a‖²φ(b*b) | pass |
| Incomplete counterexample, 1.3:346–356 | X^{2n}, n=0,1,2 | sup norms 1; moments √π, √π/2, 3√π/4; ratio Γ(n+3/2)/Γ(n+1/2)=n+1/2 | pass |
| Swapped star, 1.4:384–397 and C3.lean | h=(1,−1), e₁ | h*=(−1,1), h*h=−1 ⇒ φ(1)=0 ⇒ φ=0; e₁*e₁=0 ⇒ π(e₁)=0; q(z,0)²=q(0)=0 ⇒ q=0 | pass |
| Native coordinatewise star control, 1.4:414 | φ(z,w)=z | φ((z,w)*(z,w))=\|z\|² ≥ 0, φ(e₁)=1 | pass, swap essential |
| Contour value, 2.1:488–491, Check 595 | a=2 in ℂ, f=1 | ∮(z−2)⁻¹dz=2πi, value 1; reversed −1 | pass |
| Riesz idempotents, 2.1:524–548 | T=diag(0,i); P=[[1,N],[0,0]] | projections diag(1,0), diag(0,1), sum I, product 0; ‖P‖=√(1+\|N\|²)>1, σ={0,1} | pass |
| PTP=PT vs PT=TP, 2.1:531–534 | P=diag(1,0), T=[[0,0],[1,0]] | PT=0=PTP, TP=[[0,0],[1,0]]≠PT | pass |
| U-calculus obstruction, 2.1:572–576 | N=J₃(0), a=N², s=√x | p(s)↦p(N) sends s²=x to N²=a; ℂ[t]/(t²) has no √t | pass |
| `normal_of_isometric_calculus`, Suggested:76; 2.1:578–585 | diag(0,i); oblique P=[[1,1],[0,0]]; H=0 | sup-norm calculus isometric and T normal; characteristic function ↦ P with ‖P‖=√2≠1; empty spectrum, zero algebras | pass |
| `finite_spectrum_calculus_iff`, Suggested:85; 2.2:605–627 | diag(0,i); J₂(0); E=0 | two idempotents, unique Lagrange calculus; coordinate on {0} is 0 ↦ 0≠J₂(0); eigenspaces ⊥=⊤ and unique map 0→0 | pass both directions |
| Lagrange projections, 2.2:619 | T=diag(0,i) | P₀=(T−i)/(−i)=diag(1,0), P_i=T/i=diag(0,1) | pass |
| All-1/3 matrix, 2.2:646 | J/3 | (J/3)²=J²/9=3J/9=J/3 | pass |
| Jet formula and norm, 2.2:689–692 | J₂(1)⊕[2], p | p(T)=diag(p(1),p(1),p(2))+p′(1)E₁₂; ‖·‖ ≤ max+\|p′(1)\| | pass |
| `ritt_power_bound` constant, Suggested:96; 2.2:698–708 | R=1+1/(n+1), n=0,1,2,∞ | bound C²R^{n+2}(n+1)/(2n+3): 4/3, 27/20, 256/189≈1.355, →e/2≈1.359; all <3 | pass with margin |
| Poisson integral, 2.2:703 | R=2 | ∫dθ/\|2e^{iθ}−1\|²=2π/3 | pass |
| Integration by parts sign, 2.2:700–702 | R′=−R² | ∮z^nR=(n+1)⁻¹∮z^{n+1}R² | pass |
| Ritt controls, Check 728 | a=1, C=1; a=−1 | ‖1^n‖=1≤3; \|z−1\|/\|z+1\|→∞ at z→−1 | pass |
| Kreiss vs Ritt, 2.2:713; `schwenninger` 49–60 | definitions | \|z−1\| vs \|z\|−1 | pass |
| Scaled-ℂ character, 3.1:759–762 | ‖z‖=2\|z\| | character norm 1/2, ‖1‖=2 | pass |
| Unitized characters, 3.1:768–784, Check 944–945 | c₀(ℕ); ℂ; 0 | ℕ∪{∞}; two points; one point; (0,1)↦1 and 0; C*-norm of (1,−1) is max(1,\|1−1\|)=1, ℓ¹ norm 2 | pass |
| Pullback hull criterion, 3.1:800–808 | χ with ker Φ ⊆ ker χ | λ∉σ_B(Φ(a)) ⇒ a−λ=u+k, u∈GL(A), k∈ker Φ ⇒ χ(a)≠λ; so \|χ(a)\| ≤ ‖Φ(a)‖ | pass |
| Even-support ideal, 3.1:904–911 | S=ℕ | ideal, c₀₀⊊I⊊c₀; quotient c₀/c₀₀ indiscrete, no unit | pass |
| 4×4 matrix norms, 3.1:927–930 | rows (1,2,−1,2),… | row sums 6; eigenvectors (1,1,1,1)↦4, (1,−1,1,−1)↦−4, (1,0,−1,0)↦2, (0,1,0,−1)↦2; Hilbert norm 4 | pass |
| Volterra on L², 3.1:875–879 | V^n1=x^n/n! | ‖V^n‖ ≤ 1/n! (Schur), ‖x^n/n!‖₂=1/(n!√(2n+1)) | pass |
| Kernel \|t−1/2\|, 3.1:890–894 | partial sums converge | \|c_n\| ≤ n!√(2n+1) eventually ⇒ Σc_nx^n/n! analytic on (−1,1); ∫₀ˣ\|t−1/2\| has a kink in its derivative at 1/2 | pass |
| AC norm comparison, 3.2:981–985 | f=x | ‖f‖_{AC,0}=1, ‖f‖∞+‖f′‖₁=2 ≤ 2·1 | pass |
| `exists_ac_calculus` formula, Suggested:125–144; 3.2:1022–1030 | (1,0); (0,1); (0,2x) | Ψ=I; Ψ(x)1=2x; Ψ(x²)1=3x²=T²1 (T²1=2x²+x²) | pass, order fixed |
| Multiplicativity | Ψ(f)Ψ(g)h vs Ψ(fg)h | difference f′·(V(gh)+V(g′Vh)−gVh)=0 by parts | pass |
| Operator bound ‖Ψf‖≤‖f‖, 3.2:1027 | kernel column sums | sup_t(\|f(t)\|+∫_t¹\|g\|) ≤ \|c\|+∫₀¹\|g\| | pass |
| Injectivity | h=1, h=x | f+xg=0 and xf+x²g/2=0 ⇒ g=0 ⇒ c=0 | pass |
| Spectrum of T, 3.2:1031–1034 | λ∈[0,1], zero-integral bumps h_n | ‖(x−λ)h_n‖₁→0, ‖Vh_n‖₁ ≤ 2δ→0; ODE ((x−λ)u)′=k forces ∫₀^λ k=0 | pass, σ(T)=[0,1] |
| Spectral mapping σ(Ψf)=f([0,1]) | f=1+x; f=0 | σ=[1,2] with inverse Ψ(1/(1+x)); σ(0)={0}=range | pass |
| No C([0,1]) extension, 3.2:1036–1039 | f_n=e^{2πinx}, h=1 | ∫\|1+2πinx\| ≥ πn−1; ‖f_n‖∞=1; n=1 gives π−1>2 | pass |
| ℓ∞ rank-one operator, 3.2:1066–1075 | φ⊥c₀, φ(1)=1 | dist(1,c₀)=1, ‖φ‖=1; Te_j=0 ∀j, T1=e₀ | pass |
| Bimodule law order, Conventions:59–60, Check 1130 | M₂, E₁₂, E₂₁ | E₁₂E₂₁=E₁₁, E₂₁E₁₂=E₂₂ | pass |
| Approximate-identity bound C+D+CD, 4.1:1118–1119 | e+f−ef | ‖e+f−ef‖ ≤ C+D+CD | pass |
| Bottom filter control, Check 1132 | l=⊥ | every statement vacuous; `NeBot` excludes | pass |
| Double centralizers, 4.2:1138–1150, Check 1189–1191 | ℂ, z=2,w=i; zero product on ℂ | (L₂,R₂)(L_i,R_i)=(L_{2i},R_{2i}); all pairs satisfy the three laws, canonical image 0 | pass, annihilator hypothesis needed |
| Automatic boundedness, 4.2:1145–1148 | a_n→0, S(a_n)→y | b·y=lim T(b)a_n=0 ∀b ⇒ y=0 when the right annihilator is 0 | pass |
| Multiplier norms, 4.2:1157–1162 | ‖z‖=2\|z\|, C=2 | ‖L_1‖=1=‖1‖/2, bound ‖a‖/C ≤ max ≤ ‖a‖ | pass, no isometry |
| ‖S‖=‖T‖ for contractive identity, 4.2:1158 | e_αS(a)=T(e_α)a | ‖S(a)‖=lim‖e_αS(a)‖ ≤ ‖T‖‖a‖ | pass |
| Multiplier extension (R01) | A=E=ℂ, C=1 | Φ(L_z,R_z)=m_z, ‖Φ‖=\|z\| ≤ 1·1·\|z\| | pass, statable |
| `cohen_hewitt`, Suggested:149; 4.3:1197–1203 | ℂ on ℂ, x=2; A=0; C<1 with A≠0 | a=1,y=2; a=y=0 only x=0 admissible; ‖a‖=lim‖ea‖ ≤ C‖a‖ ⇒ A=0, hypotheses contradictory | pass |
| Non-contractive action, 4.3:1203 | ‖x‖′=max(‖x‖,sup_{‖a‖≤1}‖ax‖) | contractive equivalent norm, closures unchanged, ‖a‖ ≤ C kept | pass |
| Balanced tensor, Check 1222–1223 | ℂ⊗̂_ℂℂ; E=0 | z⊗w↦zw, (2x)⊗y−x⊗(2y)↦0; zero tensor | pass |
| Arens order, 4.4:1231–1232, Check 1253 | J(E₁₂), J(E₂₁) | both products J(E₁₁); reversed J(E₂₂) | pass |
| Double limit, Check 1255 | a_m=δ_{2m}, b_n=δ_{−2n−1}, f=1_{k≤−1} | f(a_mb_n)=1 iff 2m−2n−1≤−1 iff m≤n; lim_mlim_n=1, lim_nlim_m=0 | pass, ℓ¹(ℤ) not regular |
| `separatingSpace`, Suggested:172–178; 5.1:1271–1275, Checks 1313–1315 | T=2z; T=0; discontinuous functional | fibres {0}, {0}; y_n=x_n/Tx_n, ‖y_n‖<1/n, Ty_n=1 ⇒ S=ℂ | pass; iff is the closed-graph theorem, not one-tactic |
| Unital continuity theorems, Suggested:187–201; 5.2:1324–1330, Check 1344–1345 | first projection ℂ²→ℂ; D=[E₁₁,·] on M₂ | norm 1, radical 0; D(E₁₂)=E₁₂, D(E₂₁)=−E₂₁, Leibniz aDb+Da·b | pass |
| Nonunital versions, Suggested:209–236 | unitization A⁺ | rad(A⁺)⊂A since A⁺/A=ℂ, so rad(A⁺)=rad(A); D⁺(1)=0 is a derivation | pass |
| `singer_wermer`, Check 1346 | ℂ[ε]/(ε²), D(ε)=ε | range ℂε=rad | pass |
| Hochschild sign, 6.1:1366–1368, Checks 1403–1405 | M₂: x=E₁₂, a=E₂₁; ℂ: T=id | δx(a)=E₂₂−E₁₁; δT(a,b)=ab, δ²T=abc−abc+abc−abc=0; dual numbers (1,0)²=0 | pass |
| Diagonals, 6.2:1415–1422, Checks 1458–1461 | ℂ; M₂; A=0; C¹ point derivation | 1⊗1; (1/2)Σe_ij⊗e_ji has Δ=(1/2)·2I=I; zero; D(x)=1, inner derivations 0 | pass |
| Product criterion, 7.1:1477–1495 and C2.lean:17–21 | I=∅; ℝ²; ℝ^ℕ; Circle^I; one empty factor | point/finite/∞ many noncompact/compact; empty product locally compact with infinitely many noncompact factors | pass; nonempty hypothesis needed |
| Real powers, 7.1:1497 | I finite / infinite | locally compact iff Finite I | pass |
| Cantor digits, 7.1:1503–1511, Check 1530; CantorSet.lean:322–344 | (1,0,0,…) | ofDigits(cond)=2/3; XOR square 0; real sum 4/3 | pass |
| Modular convention, 7.2:1541–1545, Check 1586; ModularCharacter.lean:42 | affine group, g=(2,0) | ∫f(xg)dμ=2∫f dμ, c(2,0)=2, c(1/2,0)=1/2; f*(x)=c(x)conj f(x⁻¹) | pass, matches Mathlib |
| Convolution order, Check 1585 | S₃ | δ_(12)*δ_(23)=δ_(123), reversed δ_(132) | pass |
| Trivial group mass 2, Checks 1584, 1638, 1709, 1818 | a,b | f*h(e)=2ab, unit density 1/2 of L¹ norm 1, ρ(f)=2f(e)I | pass |
| Kernel inversion limit, 7.2:1563–1565 | u_U, c=Δ⁻¹ | ∫c(z)u(z)dμ=∫u(z⁻¹)dμ→1 by continuity of c at e | pass |
| Character norm one, 7.2:1569–1574 | χ(u_U*f)=χ(u_U)χ(f) | χ(u_U)→1, ‖u_U‖₁=1 | pass |
| Regular representation, 7.3:1610–1627, Checks 1641–1642 | S₃; C₂, f=(1,i) | λ(δ_(123))*δ_e=δ_(132); λ(f)=[[1,i],[i,1]], λ(f)*λ(f)=2I, norm √2, eigenvalues 1±i, ‖f‖₁=2 | pass, no isometry |
| L¹ semisimplicity route, 7.5:1733–1742 | f∈rad | σ(f)={0} ⇒ r(λ(f))=0 ⇒ λ(f) normal ⇒ ‖λ(f)‖=0 ⇒ f=0 | pass |
| Measure uniqueness, 7.5:1744–1757, Checks 1817–1819 | C₂: (a,b); ν=δ_e+iδ_g | transforms (a+b,a−b), inverse ((u+v)/2,(u−v)/2); 1+i,1−i; conjugate 1−i,1+i; variations 1,1,2 | pass |
| Standard duals, 7.5:1759–1786, Checks 1820–1822; Circle.lean:221 | ℤ: δ₁ at i; Circle: z⁻¹; ℝ: x=y=1 | i vs −i; coefficient 1 at n=1, 0 at n=0, mass 1; exp(i) vs fourierChar(−1/(2π))=exp(−i) | pass |
| Dirichlet kernels, 7.5:1802–1804 | surjectivity onto c₀ | open mapping bounds ‖D_N‖₁ ≤ C, but ‖D_N‖₁ ≥ c log N | pass |
| Johnson diagonal, Check 1877 | C₂ | (δ_e⊗δ_e+δ_g⊗δ_g)/2, Δ=δ_e, commutator with δ_g is 0 | pass |
| Modulus normalisation, Check 1878 | m(1)=1 | \|m\|(1) ≥ \|m(1)\|=1 | pass |
| `compact_riesz_decomposition`, Suggested:248; Checks 1932–1935 | diag(2,0), λ=2; J₂(1); T=0, λ=0 | ker span e₁, range span e₂; ker(T−I) 1-dim, ker² all; zero shift excluded by z≠0 | pass |
| Eigenvalue threshold, Check 1934 | e_n/(n+1), ε=1/2 | eigenvalues ≥1/2: 1, 1/2 (two) | pass |
| `schauder_fixedPoint`, Suggested:262; Check 2005 | C={0}; C=∅ | fixed point 0; `Nonempty` excludes ∅ | pass |
| `lomonosov_lemma`, Suggested:271; Check 2006; `lomonosov` 63–66 | ℂ, A=ℂ, K=2I; K=0 | a=1/2: aK(1)=1; K=0 gives no nonzero x | pass |
| `lomonosov_hyperinvariant`, Suggested:284; Check 2007; `lomonosov` 74–78 | diag(0,1), K=I; T=I; dim 0,1 | span e₁ hyperinvariant; T=I excluded by nonscalarity; T scalar in dim ≤1 | pass |
| Real control, Check 2008 | 90° rotation on ℝ² | no invariant line; complex statement unaffected | pass |

## Not verifiable

- **Rieffel, C*-algebras course notes** (cited at 1.3, 1.4, 4.2, 7.4 by "physical pages"): the sources service finds no legal text; Rieffel's Berkeley page lists Math 208 but no notes with these pages, and the one Berkeley Math 208 note set found by search (Qiaochu Yuan's) returns HTTP 404. The four statements were checked by computation (table). Listed in `needs-references.toml`.
- **Dales, Banach Algebras and Automatic Continuity** (1.1, 2.1–2.2, 3.1, 4.1, 4.3–4.4, 5.1–5.2): no legal text; the theorem numbers 2.4.4, 2.6.17, 2.6.26, 2.9.24, 5.2.5, 5.2.22–5.2.28 are uncertified. Listed.
- **Runde, Lectures on Amenability** (4.3, 6.1–6.2, 7.3–7.6) and **Pedersen, Analysis Now** (3.1): paywalled (Springer); recorded as uncertified by locator.
- **Conway, A Course in Functional Analysis** (7.1, 7.2, 7.5, 8.1): the DOI is paywalled and the README's linked copy is not a legal source under the brief, so I did not read it. The previous review's locator checks for VII.9 (pp.223–231) are data I did not re-verify; the VI.5 citation at `README.md:1892` for compact spectral theory is unchecked (Conway's compact spectral theory is in Chapter VII in the second edition, so this locator deserves the author's own check).
- **Short Assignment4, question 2** (`README.md:267`): unidentifiable.

## Source issues

- **Gap** in lomonosov at the note added in proof, printed p.56 (lines 74–78): the source says a nonscalar operator commuting with a compact operator has a nontrivial subspace invariant under its whole commutant; it should say a nonzero compact operator, as the main theorem on p.55 does (the zero operator commutes with everything); affects a stated result. The README keeps `K ≠ 0`.
