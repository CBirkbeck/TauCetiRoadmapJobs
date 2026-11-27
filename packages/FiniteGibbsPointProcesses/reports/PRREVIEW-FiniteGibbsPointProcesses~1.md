# Review of FiniteGibbsPointProcesses (pull request #3229 at f8aa5c5)

**Verdict:** needs changes

**Summary.** Changes are needed for one reason, and it is about ownership, not about the mathematics: the hereditary Poisson densities, the Papangelou intensity, the Georgii–Nguyen–Zessin formula with its converse and the hard-core density, which 1.3 and 4.1 declare "owned here", are also a layer of the open PointProcesses roadmap, which this text never names. No stated result was found false: every statement was instantiated on degenerate cases and every numerical Check was recomputed and reproduces. There are five small corrections and two format notes, none blocking. Six of the seven sources are behind paywalls and could not be read, and the choice of owner between the two open roadmaps is left to the human reviewers.

## R01 (P2) — The densities, the Papangelou intensity, the Georgii–Nguyen–Zessin formula with its converse and the hard-core density have two owners: 1.3 and 4.1 here, and Layer 5 of the open PointProcesses roadmap

An implementer who takes either roadmap builds the same theory a second time on a different carrier, and nothing in either text says which is the library's statement or how one is obtained from the other. The opening paragraph of 1.3 (README lines 222–225) says finite point processes with a density "are owned here", item 1 of Scope and ownership repeats it, and the module docstring of `Suggested.lean` (lines 31–33) adds the hard-core density. Pull request #417 adds `TauCetiRoadmap/PointProcesses/README.md`, whose scope list (lines 74–75) owns "finite point processes with a density against a Poisson process: hereditary densities, the Papangelou intensity, and the Georgii–Nguyen–Zessin identity" and whose Layer 5 (lines 1176–1268) states, on the carrier `PointMeasure S`, `HasPoissonDensity`, `IsHereditary`, `papangelouIntensity`, `gnz_of_hasPoissonDensity`, `map_eq_of_papangelouIntensity_ae_eq`, the Poisson case with density `c^{N(W)} e^{(1−c)μ(W)}` and the hard-core case. These are `HasConfigDensity`, `IsHereditary`, `papangelou`, `gnz_of_hasConfigDensity`, `map_eq_of_papangelou_ae_eq`, `poissonConfigLaw_withDensity_eq` and `straussDensity_zero_eq` here. The two even differ in a convention: the hard core there is "distance at least `r`", here "more than `R`" (the Check of 4.1 at line 428 records the difference without naming the other roadmap). This README does not mention PointProcesses anywhere.

The smallest change is one boundary entry in Scope and ownership that names PointProcesses, Layer 5, and settles the owner. If 1.3 is kept as the statement on finite sets, say so in one clause (the carrier `Finset S` with the final σ-algebra and `ℝ≥0`-valued densities, tied to the point-measure form by the bridge of 1.2 and `PointMeasure.ofFinset`), and replace "owned here" by what is owned: the finite-set form. If instead the point-measure form is the library's, 1.3 imports it and keeps only the transport along the bridge. Which of the two it is needs agreement with the author of #417, since both pull requests are open and neither roadmap is on main.

## C01 — Three local copies are attributed to Tau Ceti, which does not contain them at the pin

A reader who looks for the originals finds nothing, and cannot tell whether the copies should have been imports. Conventions (line 107) calls `expNeg` "Tau Ceti's `(EReal.exp (-t.toEReal)).toNNReal`", and the docstrings of `expNeg`, `IsIntegerValued` and `IsPoissonRandomMeasure` (`Suggested.lean` lines 56–69) name Tau Ceti's `expNeg`, `MeasureTheory.Measure.IsIntegerValued` and `TauCeti.Probability.IsPoissonRandomMeasure`; the description says the same. At the pinned Tau Ceti (2fd255d) no file contains `IsIntegerValued` or `IsPoissonRandomMeasure`, and the only `expNeg` are two private real-valued helpers (`TauCeti/Probability/Moments/LaplaceDeterminacy.lean` line 54, `TauCeti/Analysis/CompletelyMonotone/Laplace/Measurability.lean` line 62). The three bodies do agree, token for token, with the copies in `Suggested.lean` of SpatialPointProcessFoundations.

Attribute the three to SpatialPointProcessFoundations §§1.1, 5.1 and 5.2 alone. If a later Tau Ceti has them, the repair at that pin is the import of those modules in place of the copies.

## C02 — The heredity hypothesis of `isMarkovFunction_iff` follows from each side of the equivalence

In 3.1 (line 332) and in Lean (line 387, `hher`), `h` is assumed hereditary. `IsMarkovFunction r h` contains `IsHereditary h` as its first conjunct, and a product `h(x) = ∏_{y ⊆ x} φ(y)` with values in `ℝ≥0` is hereditary because `h(x) ≠ 0` makes every `φ(y)`, `y ⊆ x`, nonzero. So the theorem holds without the hypothesis, and a user who has only the factorisation need not prove heredity first. The first negative control stays a valid test: for that `h` both sides are false. Dropping `hher` (and "hereditary" from the sentence) states the same theorem at its natural generality. In the same way `hAB` in `markov_density_factorization` follows from `hrel` and reflexivity.

## C03 — `measurable_iff_measurable_comp_toConfig` is the definition of the final σ-algebra read off

As a target it asks an implementer for nothing: on a copy of the file the one term `⟨fun h n => h.comp (measurable_toConfig n), fun h s hs => MeasurableSpace.measurableSet_iInf.2 fun n => h n hs⟩` closes it, using only the supporting step already proved in the file. The README says as much ("It is the universal property of a final σ-algebra"). Would mark it as a supporting step and prove it in place, like `measurable_toConfig`, or keep it in the README only.

## C04 — Two Lean statements conclude less than their README headlines, though both files say every conclusion is carried

The README (lines 55–56) and the module docstring say each named headline is stated "with every conclusion the README attaches to it". In 2.1 a locally stable `h` is "Ruelle stable with `a = h(∅)`", while `isLocallyStable_consequences` concludes `IsRuelleStable W φ h`, which only says some constant exists. In 2.2 `normalisable_of_isLocallyStable` ends "so `configLaw μ W h` is a probability measure", which the Lean statement does not contain. Either add the two conclusions (`∀ x ⊆ W, h x ≤ h ∅ * ∏ ξ ∈ x, φ ξ`, and `IsProbabilityMeasure (configLaw μ W h)`), or soften the sentence about every conclusion.

## C05 — 5.5 is stated for finite-valued energies, below both Dereudre's proposition and the carrier of the rest of Layer 5

Layer 5 takes energies in `WithTop ℝ` so that hard cores are covered, and Dereudre's proposition on the two derivatives (Proposition 2 of the arXiv version, 5.2 in print) is for his general energy functions, which may take the value `+∞`. The two targets of 5.5 take `H : Finset S → ℝ`, so they do not apply to the hard-core or Strauss-with-hard-core energies of 5.1. For `β > 0` the Gibbs law gives `{H = ⊤}` mass zero and both formulas hold with `H` replaced by its finite part, exactly as `gibbs_variational` already writes `(H x).untopD 0`; the derivative in `z` also holds at `β = 0`. Would state 5.5 for the energies of 5.1, or say in the item why the finite-valued case is the target.

## N01 — Two Mathlib pull-request numbers stand in the README

"Related libraries" at the end of Prior formalization cites Mathlib pull requests #34713 and #45387. A reader a year on cannot tell what they became; a description of their content without the numbers reads the same.

## N02 — The proof route of 7.3 has a locator that could be given

The route (iterate the drift to `κ^n V ≤ aⁿ V + b/(1 − a)`, take `R > 2b/(1 − a)²`, contract the norm weighted by `1 + δV`) is that of M. Hairer and J. C. Mattingly, *Yet another look at Harris' ergodic theorem for Markov chains* (arXiv:0810.2777), Assumptions 1–2 and Theorems 1.2–1.3, applied to `κ^n` with `γ = aⁿ`, `K = b/(1 − a)`; `2b/(1 − a)² ≥ 2K/(1 − γ)`, so their condition on `R` holds. Citing it would give the adaptation a readable source beside Møller and Waagepetersen's Proposition 7.9.

## Questions for the author

- The last Check of 6.3 says that the factor `λ` in Gaetan and Guyon's limit `exp{λ ν(S) − Λ_θ(S, x)}` is a misprint. If their reference process in Theorem 5.8 is the Poisson process of intensity `λ`, the cell densities are taken against it and the factor would be correct in their normalisation. Which reference measure do they use there? The book could not be read.
- 7.2 and 8.4 say Møller and Waagepetersen print the exponent of (7.20) and of Proposition 7.14(iii) as `m/n₀` without the floor. The counterexample in the Check is correct for a real exponent; whether the book prints it so could not be checked.

## Verified sound

| Statement | Instances tried | Values computed | Result | Change |
|---|---|---|---|---|
| 1.1 Configurations | `S` empty; `![a,a]`; `δ_a+δ_a`; `∑_{k∈ℤ}δ_k`; elaborated σ-algebra `⨅ n, map toConfig` | `toConfig ![a,a]={a}`; atoms of `δ_a+δ_a` = `{a}`, `ofFinset{a}=δ_a≠2δ_a`; infinite atoms give `∅` | sound; universal property closes by one term | C03 |
| 1.2 Poisson reference law | `μ=0`; `μ(W)=∞`; `β=0`; `β=2.5, μ(W)=1.7`; `μ=δ_a, β=0.1` | `δ_∅`; zero measure; `e^{−a}` both sides; `12.80710` both; `0.43109` vs `0.40657` | sound; atomless needed | none |
| 1.3 Densities, Papangelou | Strauss `(0,0.5,2)`; one-point indicator; `f(x)=0` with `f(x∪ξ)≠0`; non-measurable `f` | intensities `2,1,2`, product `4=β³γ`; RHS `0` vs `f({a})=1`; GNZ both sides agree by heredity | sound; heredity needed in both | R01 (owner) |
| 2.1 Local and Ruelle stability | `h≡0`; Strauss `γ=1/2`, `γ=2`; `h(x)=0` branch of `papangelou` | ratio `βγ^k ≤ β`; ratio `β2^k` unbounded; `0 ≤ φ` | sound | C04 |
| 2.2 Normalisability | `h=β^n` (equality); `μ=δ_a`, `β=0.1`; `h≡0` | `e^{(β−1)μ(W)}` both; `0.4311 > 0.4066`; `∫h=0` | sound | C04 |
| 3.1 Hammersley–Clifford–Ripley–Kelly | `r=⊥`, `h=2^n`; `h=1` on `∅,{a,b}`; non-clique `y` with `h(y)=0`, proper subsets positive | Markov but only constant products; both sides false; impossible (ratio forces `h(y)>0`), so `φ=1` off cliques | sound; `hher` redundant | C02 |
| 3.2 Global Markov property | `A=∅`; `A∩B≠∅`; Strauss `[0,2]`, `[3.5,10]`, `R=1` | `k=h, g=1`; excluded by `hrel` and reflexivity; gap `1.5>1` | sound | C02 (one clause) |
| 4.1 Strauss, hard core | `R<0`; `β=0`; `x={0,1.5}`, `ξ=0.8, 3`; `x={0,1}`; series `0.3, 1.5` | no close pairs both definitions; `0⁰=1`; `0` and `2`; density `0`; `1.38875`, `4.2374·10⁴`, `3.345·10⁶⁸` | sound | R01 (hard-core owner) |
| 4.2 Multiscale | `k=0`; `γ₀=0`, `[0,1]`, `R₁=0.3`; `n₀=0` with `n₀−1` | Strauss with `R=R₁`; 4 points fit, 5 need length `>1.2`; `n₀` existential so `≥1` can be chosen | sound | none |
| 4.3 Area interaction | `R=1`, `x={0,1.5}`, `ξ=3`; `γ=1`; `R<0` | `(2.5,4]`, length `1.5`; `β^n`; empty balls, `β^n` | sound | none |
| 5.1 Partition function | `H=0.4n, z=3, β=½, μ=2`; `z=0`; `β=0` hard core | `18.40062` = upper bound, lower `0.1353`; `Z=e^{−μ}`, law `δ_∅` both sides; weight `1` | sound; matches Dereudre's bounds | none |
| 5.2 GNZ characterisation | `β=0`; `H x=⊤, β>0`; `z=0`; `g=1_{ξ∉Λ}` | intensity `z`; `f(x)=0`, null under Gibbs; `δ_∅` both; forces `X⊆Λ` | sound; converse as Dereudre Prop. 5 | none |
| 5.3 DLR equation | `Δ=Λ`; `H=0`; `H(x_{Δᶜ})=⊤` | reduces to `∫f dP`; weight `z^{n(y)}`; null by heredity, denominator `≥e^{−μ(Δ)}>0` | sound; matches Dereudre Prop. 3, (9) | none |
| 5.4 Variational principle | `H=0, z=3, μ=2` at intensities `3` and `1`; `Q` not `≪Π`; `β=0` hard core | `−6.5917+2.5917=−4`; `−2.197>−4`; `klDiv=∞`, strict; Gibbs law not admissible | sound | none |
| 5.5 Derivatives | `H=0.4n, z=3, β=½, μ=2`; atoms in `μ` | mean `4.9124`; `1.63746=Var/z`; `−0.78598=−Var(H)`; `z`-identity is exponential-family, no atomless needed | sound; narrower than source | C05 |
| 6.1 Poisson likelihood | `C(u)=u`, `x={0.2,0.9}`, `θ=0.7` | score `0.292093`; Fisher `0.568485`; density `1.379584` | sound | none |
| 6.3 Pseudolikelihood | Poisson `ρ`; Strauss cells `m=20,100,500,2000`; unbounded `φ` | cell product equals PL exactly; `0.42801, 0.45138, 0.45631, 0.45725` → `0.457557`; `∑(∫_{A_j}φ)²→0` by absolute continuity | sound | none |
| 7.2 Doeblin's bound | chain on `{0,1,2,3}`; `n₀=0`; `M(α)=1` | `tvDist=2` at `m=1,2`, bound `2·0⁰=2`; bound `2`; `0` for `m≥n₀` | sound; `tvDist∈[0,2]` at the pin | none |
| 7.3 Geometric drift | two-cycle; `R>2b/(1−a)²` against Hairer–Mattingly | level set `{0,1}` not small; `2b/(1−a)² ≥ 2K/(1−γ)` with `γ=aⁿ, K=b/(1−a)` | sound | N02 |
| 8.2 Reversibility, irreducibility | count chain `β=2,p=½,c=2`, `n₀=1..4`; `h(x)=0` start; `φ(ξ)=0` birth | detailed balance error `≤1.4·10⁻¹⁷`; `κ^m(n,{0})≥4^{−m}` for `m≥n`; `κ(x,{∅})=1−p`; ratio `0` | sound | none |
| 8.3 Small sets, V-uniform | `k=0`; `p=½,c=2,β=2` | `δ_∅≥δ_∅`; `a=½(1+2/(α+1))+¼<1` iff `α>3` | sound | none |
| 8.4 Uniform ergodicity | count chain `n₀=3` from `∅`; `h≠0` only at `∅` | `1.05263, 0.55263, 0.42763` below `2, 2, 1.96875`; bound holds `m≤12`, `n₀=1..4`; iff true with `n₀=1` | sound | none |

- Source locators checked against the text: 11 into Dereudre (arXiv:1701.08105v2: Definitions 1–4, Propositions 1–5, the bounds on `Z`, the case `β = 0`), all supporting the statements; 2 into Hairer–Mattingly for the route of 7.3.
- Library declarations opened at the pins: `tvDist` (`Mathlib/MeasureTheory/Measure/TotalVariation/Defs.lean` line 62, values in `[0, 2]`), `klDiv` (`Mathlib/InformationTheory/KullbackLeibler/Basic.lean` line 56), `Kernel.IsIrreducible` (`Mathlib/Probability/Kernel/Irreducible.lean` line 56), `Kernel.Invariant` and `Kernel.IsReversible` (`Mathlib/Probability/Kernel/Invariance.lean` lines 39, 58), `poissonMeasure`; Tau Ceti searched for `expNeg`, `IsIntegerValued`, `IsPoissonRandomMeasure`, `mhKernel`, Papangelou (absent).
- Cross-roadmap citations resolved: SpatialPointProcessFoundations §§1.1, 1.2, 2.1, 4.3, 5.1–5.4 at its open head (9 local copies identical to its `Suggested.lean`); LangevinAndHamiltonianMonteCarlo §1.1 on main (`mhKernel` identical, `isMarkovKernel_mhKernel`, `mhKernel_isReversible_iff` present); MarkovChainMixing, HiddenMarkovModels §6.1, GraphicalModelsAndConditionalIndependence Layer 3, GibbsMeasuresAndTheIsingModel.
- Dependency check: `depcheck: 94 roadmaps, 1054 edges, 0 problem(s)`; no UPWARD or CYCLE line.
- Elaboration of `Suggested.lean`: 54 `sorry` warnings and nothing else; 55 theorems, one proved. The elaborated types of all 105 declarations were compared with the README: every theorem keeps its instance binders; only definitions with real bodies drop unused ones. Nothing changed.
- One-tactic probes on a copy: 6 tried, 1 closed (C03).
- Headline theorems, all stated: `gnz_of_hasConfigDensity`, `map_eq_of_papangelou_ae_eq`, `normalisable_of_isLocallyStable`, `isMarkovFunction_iff`, `strauss_lintegral_eq_top`, `map_eq_gibbsLaw_iff_gnz`, `gibbs_dlr`, `gibbs_variational`, `tendsto_prod_cellConditionalDensity`, `tvDist_pow_le_of_isSmallSet`, `isVUniformlyErgodicOn_of_drift`, `birthDeath_isUniformlyErgodicOn_iff`; none is declared unstatable.
- Description against the head: counts (54 `sorry`, one proved step), pins and suppliers agree; its sentence on copies of Tau Ceti's definitions is covered by C01.

Overlap check: read MarkovRandomFieldsAndAutoModels, SpatialPointProcessFoundations, PointProcesses, DeterminantalPointProcesses, SimulatedAnnealing, MarkovChainMonteCarloGuarantees, LangevinAndHamiltonianMonteCarlo, MathematicalStatisticsFoundations, MarkovChainMixing; densities, Papangelou intensity, GNZ and hard core: two owners, this roadmap and PointProcesses (R01); carriers, Poisson process, Mecke: SpatialPointProcessFoundations (cited); `mhKernel`: LangevinAndHamiltonianMonteCarlo (cited); Doeblin's bound and pseudolikelihood of MarkovRandomFieldsAndAutoModels are the finite-type and lattice statements, each owner of its own; general-state ergodicity (Layer 7) is excluded by MarkovChainMixing, MarkovChainsAndRenewal and LangevinAndHamiltonianMonteCarlo and is owned here.

Source independence: 8 passages compared with 1 source (Dereudre), none shared beyond formulas and standard terms; largest share Møller and Waagepetersen (2004), roughly 45 of roughly 110 locators; contents not compared with it (text and table of contents not readable); by the locator numbers alone Layers 1–4 draw on its Chapter 6 out of numerical order, Layer 5 on another source, and Layer 7 (§7.2) precedes Layer 8 (§§7.1, 7.3).

Research link: Layers 1–4 and 8 state the finite Gibbs and Markov point process theory of Ripley and Kelly (1977) and Møller and Waagepetersen (2004, 2007); Layer 5 is Dereudre (2019), Propositions 1–5, the finite-volume input to infinite-volume Gibbs point processes. Rests on the README's sources and on Dereudre's text.

## Not verifiable

- Møller and Waagepetersen (2004): publisher page only; every locator into it (about 45), including the sampled 1.1–4.2, 6.3, 7.2 and 8.2–8.4, was checked for mathematical truth only.
- Møller and Waagepetersen (2007): the journal page refuses access; (4), (31), (42), (47) not read.
- Van Lieshout (2019) and (2000), Gaetan and Guyon (2010), Ripley (1977): paywalled or not found; no locator read.
- Dereudre (2019): read in the arXiv version, numbered 1–5 where the README has 5.1–5.5; the printed page numbers (pp. 185–193) could not be confirmed.
- The two errata the README reports in sources (the exponent of Møller and Waagepetersen (7.20); the factor in Gaetan and Guyon, Theorem 5.8) could not be confirmed.

Automatic checks set aside as false positives: the section comment "Upstream names used in the README" at the end of `Suggested.lean` has no declaration under it, but it heads a list of `#check` lines that pin library names, which the form allows.

## Source issues

- **Gap** in Dereudre (2019) at Proposition 5.1 (arXiv version: Proposition 1, p. 10–11): the source says the Gibbs law minimises `β E(H) − log z E(N) + I` for all `β ≥ 0`, with `E(H)` possibly infinite; it should exclude or give a convention for `β = 0` with `H = +∞` on positive Poisson measure, where the term is `0 · ∞`; affects a stated result.
- **Gap** in Dereudre (2019) at Proposition 5.2 (arXiv version: Proposition 2, p. 11): the source says the mean energy is differentiable in `β` on the whole half-line; it should say `β > 0`, since at `β = 0` the mean energy under the Poisson law can be infinite; affects a stated result.

## For the human reviewers

- Ownership: the open PointProcesses roadmap (#417, Layer 5) and this one both own Poisson densities, the Papangelou intensity, GNZ and the hard-core density (R01). PointProcesses may not be cited as a supplier; which roadmap keeps them is yours to decide.
- Licence: the README's Prior formalization says `Suggested.lean` shares names and statements with `MSSS/GibbsPointProcesses/` of github.com/bjbraams/lean-MSSS at commit 6826ba2 (the author's own repository); its licence was not read.
- Not tested: Møller and Waagepetersen (2004), the source with the largest share of locators, could not be read, nor its table of contents; wording and arrangement were not compared with it.
