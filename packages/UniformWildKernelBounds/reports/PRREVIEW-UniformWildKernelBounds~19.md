# Review of UniformWildKernelBounds (pull request #3027 at f0da4ff)
Folder: `TauCetiRoadmap/RiemannHypothesisForDirichletLFunctions/UniformWildKernelBounds/`
**Verdict:** accepted

**Summary.** An incremental re-review of the 67 lines changed since `7b5fe43`. Accepted, with no finding: the five relabelled origins now agree with the family index; the narrower form given for the formal proof in 3.1 and 2.3 matches its declarations; the new comparison with Soulé (2003) and with Bayer-Fluckiger, Emery and Houriet (2015) in 1.6, 6.1 and 7.4 holds where it was computed; and the written-out definition of `V` is that of BernoulliBoundsForClassGroupEigenspaces §6.17 (e). One format note is carried over, not blocking. The earlier question on Schneider's lemma is answered by the source, which is now readable. The scope and licence of the formal proof remain for the human reviewers.

## N01 — 0.2 and 0.3 state results that [FormalProof] proves but carry no method label

Both ask for proofs (uniqueness and multiplicativity of the components in 0.2; (a)–(d) of 0.3), and the family index asks every section that states something to prove for a method label. A method line on each would align them, or the family index could note the exception that the Labels paragraph (line 151) makes.

## Verified sound

| Statement | Instances tried | Values computed on each side | Result |
|---|---|---|---|
| Conventions, `V(F, t)` (changed) | BernoulliBoundsForClassGroupEigenspaces §6.17 (e), line 101 | same sum `Σ_ℓ log ℓ · Σ_{1≤e<t} length`; for a finite `ℓ`-group `length · log ℓ = log #`, e.g. `ℤ/9`: `2 log 3 = log 9` | agrees |
| Labels paragraph (changed) | origins of 2.3, 3.17, 3.23, 5.2; 3.1, 3.2; 7.5 | four now `particular to this proof`; 3.1 and 3.2 name their own part in a clause; 7.5 alone keeps the reserved label, method `none` | agrees with the family index |
| 3.1 origin (changed) | `UpperTheory.V.Af.CardK`, `SigK` | formal: `IsCMField K`, `2 ≤ n`, `DualIsConj π`, fixed vector at level `M`; README form: CM, `n ≥ 2`, conjugate self-dual | matches |
| 2.3 method (changed) | `UpperTheory.V.Published.FerreroWashington`; `M(i)` at `ℓ = 2` | formal hypothesis: a primitive root of order `ℓ` (4 if `ℓ = 2`) in an abelian field; `M(i) ∋ i`; bound for `Cl/ℓ` along `{ℓ^n}` | matches |
| 1.6, 6.1 origin (changed) | `μ_ℓ ⊂ L`; `e = 1` | `(ℓ − 1) ∣ [L:ℚ]` gives `ℓ ≤ [L:ℚ] + 1 < [L:ℚ] + 2`; `K_{2e}` with small torsion up to `max(d + 1, 4e + 2)`, so `ℓ ≥ max(4e + 3, d + 2)` | excluded, as stated |
| 7.4 origin (changed) | degree `d ≈ x^α`, `log\|D\| ≤ d log N`; `e ≥ 1` | Soulé: `log card ≥ exp(α\|D\|^{1/2})`, so card triple exponential; here `V ≤ (Nt)^C + exp(x^δ)`, card double; BFEH `log card ≤ (nd)^α\|D\|^β`, double | holds |
| 7.4, source of `exp(x^δ)` | route of 7.4 | `2`-part `≤ exp(x^{δ/2}) log 2` (2.4(a)); `B(χ)` through `B = exp(x^{δ/2})` (2.4(b)); minus part `(Nt)^C` | as the label says |
| 7.3 origin (sample, changed) | headline 1 | sum over odd `ℓ ∉ B(χ)`, `1 ≤ e < t`, of `log ℓ · length` is `log ∏ #Ш¹` | consistent |
| 1.1 origin (earlier question) | Schneider §6, Lemma 1; `n = −e` | `R_n(k) = H⁰(G, Z(n))` for every `n ≠ 0`, `p` odd; dual `(X′(e))_Γ`; both signs of `e` covered | as labelled |

The rows for the untouched statements stand as in the previous review, of `7b5fe43`.

- Source locators checked against the text: 3 (`Schneider1979` lines 729–756, with odd `p` at lines 47 and 70; Bayer-Fluckiger–Emery–Houriet, arXiv:1406.5953v3, Theorem 1.1 and Corollary 1.2, and its account of Soulé's Proposition 4).
- [FormalProof] declarations opened: 2 (`UpperTheory.V.Af.CardK` with `SigK`, in `…/AutomorphicForms/IsoOfFrob.lean`; `UpperTheory.V.Published.FerreroWashington`, in `…/PublishedTheorems/FerreroWashington.lean`).
- Cross-roadmap citations resolved: 3 (BernoulliBoundsForClassGroupEigenspaces §6.17 (e), §9.4, §9.7), in the pull request's own copy of that roadmap.
- Library declarations opened: none needed; `Suggested.lean` is unchanged and declares nothing.
- Automatic checks: all passed. Dependency check: `depcheck: 122 roadmaps, 1415 edges, 0 problem(s)`.
- Elaboration: `lake env lean` on `Suggested.lean`, exit 0, no messages; no declaration to `#check` or probe for padding. Its docstring names the three headlines as not statable and what each lacks.
- Record: the change touches no heading; all 8 layers of the README at the merge base keep their ids and titles.
- Description: its count of labels over the family (208, 311, 267, 28, 45; 863 sections) was recounted at this head and agrees; four sections open their label with a clause letter.

Overlap check: read AutomorphyLiftingBeyondTaylorWiles, AutomorphicCongruences, ModularityAndLanglandsExtensionsPartII, OrdinaryAutomorphicFormsAndModularityLiftingPartII, GlobalGaloisDeformationsPartII, HeckeIdealsAndTaylorWilesRelations, ReducibilityIdealsAndUltrafilterPatching, BernoulliBoundsForClassGroupEigenspaces (scope as in the earlier rounds; the change adds no owned object); nothing shared. The total `V` is owned by BernoulliBoundsForClassGroupEigenspaces §6.17 (e), which the Conventions cite.

Source independence: changed passages only; 3 passages compared with 2 sources (Schneider 1979; Bayer-Fluckiger–Emery–Houriet 2015), none shared beyond standard names and formulas. Largest share of the locators: [FormalProof], 236 file-and-declaration locators; no layer is added, removed or reordered, so the arrangement was not compared. Soulé (2003) could not be read.

Research link: the window theorem (7.4–7.6) bounds étale wild kernels of abelian fields uniformly; CongruenceModulesOfThetaLifts uses it in the family's route to the Riemann hypothesis for Dirichlet L-functions ([FormalProof], Alpöge). Its tools extend Skinner–Wiles (1999), Thorne (2015), Allen–Newton–Thorne (2020), with Ferrero–Washington (1979) and Soulé (2003). Rests on the README's Summary and References.

## Previous findings

- none: the previous review raised no finding. Its small correction C01 is repaired (2.3, 3.17, 3.23 and 5.2 read `particular to this proof`; 3.1 names its own part in a clause); its format note is written again as N01; its question is answered by Schneider §6, Lemma 1, which covers every `n ≠ 0`.

## Not verifiable

- Soulé (2003), Theorem 3 and Proposition 4 (1.6, 6.1, 7.4, References): no legal copy reached (the Documenta archive address is gone, the publisher's host is unclassified). The range of primes and the size of the bound were checked only through their restatement in Bayer-Fluckiger–Emery–Houriet (introduction, Theorem 1.1); the theorem numbers and the pages 761–788 were not.
- The pull request's description reached this review cut short; the part read says nothing that this folder contradicts, and the rest was not checked.

## Source issues

- none

## For the human reviewers

- Scope: the main source is [FormalProof], an announced, unrefereed Lean formalisation by one author, cited by 236 locators; 39 of the 59 labelled sections are now "particular to this proof" (README, References).
- Licence: the licence of the [FormalProof] repository was not determined; the README cites file paths and declaration names only, no text.
- Neither decision of the human reviewers bears on this folder: it removes no section, and 1.1 and 5.1 stay, naming IntegralIwasawaTheory §10.5a and ExplicitNumberFields §5.3 as their general theorems.
