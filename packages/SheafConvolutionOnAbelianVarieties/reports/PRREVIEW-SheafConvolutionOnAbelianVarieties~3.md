# Review of SheafConvolutionOnAbelianVarieties (pull request #1809 at 45fda66)

**Verdict:** accepted

Incremental re-review of the 15 lines changed since c1edbd9 (10 insertions, 5 deletions, all in `TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/README.md`; `Suggested.lean` and `metadata.toml` are byte-identical to c1edbd9; no file changed outside the folder). Gate at 45fda66: every check passed. Dependency check run again by this review:

    depcheck: 241 roadmaps, 2362 edges, 0 problem(s)

No UPWARD or CYCLE line. Both previous findings are repaired and the repairs introduce no new defect.

## Previous findings

- R01 — repaired: the §0.4 Check (README line 279) now says that with the unshifted ω=S, RHom_S(S,S)=S[0] lies in D^(≥0) although dim Supp H⁰(S)=1, so the equivalence fails for S, while RHom_S(k,S)=k[−1] still lies in D^(≥0). Recomputed: Ext⁰_S(k,S)=0, Ext¹_S(k,S)=k, so RHom_S(k,S)=k[−1] (cohomology in degree 1), in D^(≥0); the two verdicts are as stated.
- R02 — repaired: the From Tau Ceti contract (line 47), the ShimuraData/AlgebraicModuli paragraph (line 161), §9.1's route (line 1348), its Needs line (line 1358) and the Layer 9 Dependencies (line 1429) now cite AlgebraicModuliForArithmeticGeometry §1.1 for the projective bundle and §1.7 (`rankLocus` with r=0) for the zero scheme, state that neither constructs a universal divisor, and form 𝒟 in §9.1 as the zero scheme of the tautological section, relative effective Cartier by Stacks Lemma 19.9(3). All five passages agree with each other (grep: no remaining "§§1.1–1.2").

## Verified sound

**Gate, build, elaboration.** Gate at 45fda66 all green. `lake env lean TauCetiRoadmap/SheafConvolutionOnAbelianVarieties/Suggested.lean` elaborated with exactly four "declaration uses `sorry`" warnings (lines 77, 85, 97, 114) and nothing else. Since the Lean file is unchanged since c1edbd9, the eight elaborated signatures (0 dropped binders, no `variable` block), the `#check @name` comparison, the one-tactic probes and the headline list of the previous reviews stand unchanged: no padding, four headline theorems (LS Lemma B.7, Lemma B.4, Lemmas B.5–B.8, Proposition B.1).

**Changed-passage locators and suppliers**, each read at its stated place:

- Stacks, Divisors, Lemma 19.9 (tag 062Y): cache header lists 94 pages from the Stacks divisors PDF; section heading "19. Relative effective Cartier divisors" at Stacks line 1665; the lemma begins at line 1788 on page 40 (page marker at line 1754, the page-41 marker at 1799), part (3) at line 1796: for φ:X→S flat locally of finite presentation and Z locally principal with Cartier fibre Z_s near x, Z∩U is a relative effective Cartier divisor near x; lines 1803–1804 state the global form the README uses (locally principal Z with all fibres effective Cartier is relative effective Cartier). The route's hypotheses match: A×P→P is smooth, hence flat and locally of finite presentation; 𝒟 is the zero scheme of a section of a line bundle, hence locally principal; the fibre over [t] is the divisor of the nonzero section t on the integral A, an effective Cartier divisor. The References entry (line 1450) and the manifest entry (`sources.toml`, id `Stacks`, tag 062Y, certified, cited for 9.1) agree.
- Tau Ceti `AlgebraicGeometry.Scheme.IdealSheafData.IsRelativeEffectiveCartier`: TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Relative.lean line 63 at the PR's pin 358314d4, `I.IsEffectiveCartier ∧ Flat (I.subschemeι ≫ f)`, as the README describes; `.comap` at line 96 (arbitrary base change T→S, no flatness hypothesis), `.comap_of_flat` at 169, `.comap_of_isPullback` at 183. The same declarations are at lines 67 and 100 of that file at main's pin 2fd255d9.
- The README's remark that the fibre criterion of TauCeti/AlgebraicGeometry/EffectiveCartierDivisor/Fiber.lean assumes the closed subscheme flat over the base: at main's Tau Ceti pin 2fd255d9 that file exists and its `isEffectiveCartier_of_isEffectiveCartier_comap_fiberι` (line 136) and `isRelativeEffectiveCartier_iff_forall_isEffectiveCartier_comap_fiberι` (line 182) carry `[Flat f] [Flat (I.subschemeι ≫ f)]` with `X` locally Noetherian, so the remark is accurate there and the roadmap is right to take flatness from Stacks 062Y(3) instead. At the PR's own pin 358314d4 the directory has only Basic, Functor, Invertible, Relative and Section, so the file is not there; the roadmap consumes nothing from it (the Needs line and Dependencies cite only `IsRelativeEffectiveCartier`), so this is a note for the pin bump, not a finding.
- AlgebraicModuliForArithmeticGeometry at its open head: §1.1 "Projective quotients and all integer twists" (its line 306) defines `ProjectiveBundles.projectiveBundle` as Proj_S Sym(E) in the quotient convention with the surjection π*E→O(1) commuting with base change; §1.7 "Determinantal and Frobenius loci" (line 969) defines `rankLocus` for a map of finite locally free sheaves by the (r+1)-minors, commuting with arbitrary base change, with r=0 the zero scheme (its §1.7 uses exactly this at line 1017). The strings "universal divisor", "zero scheme", "zero locus" do not occur in §§1.1–1.2, as the README now says.
- Mathlib `AlgebraicGeometry.Scheme.Hom.isOpen_smoothLocus` / `smoothLocus`: unchanged citation, Mathlib/AlgebraicGeometry/Morphisms/Smooth.lean lines 291 and 300 at the pin (previous review).

**Adversarial table** (rows for untouched statements carried from the previous report, with its values; new rows computed here):

| statement | instances tried | values computed | result |
|---|---|---|---|
| §0.4 Check, shifted ω=S[1] (unchanged part) | S=k[x]; M=k, M=S | RHom(k,S[1])=k[0]∈D^(≥0), dim Supp H⁰(k)=0≤0; RHom(S,S[1])=S[1]∉D^(≥0), dim Supp H⁰(S)=1 needs k≥1 | matches BSS Lemma 2.8 |
| §0.4 Check, unshifted ω=S (rewritten clause) | M=k, M=S | Ext⁰(k,S)=0, Ext¹(k,S)=k ⇒ RHom(k,S)=k[−1]∈D^(≥0), verdict unchanged; RHom(S,S)=S[0]∈D^(≥0) with dim Supp 1>0, equivalence fails for S | matches the new text |
| §9.1 quotient convention | h⁰=1; h⁰=2 | P(E), E=H⁰^∨: rank-one quotients of H⁰^∨ = lines of H⁰; P⁰ a point; P¹ | points are nonzero sections mod scalars, as stated |
| §9.1 tautological section | fibre A×{[t]} | O(−1)|_[t] = the line k·t ⊂ H⁰; composite with evaluation = t up to the chosen generator | restriction is t, as stated |
| §9.1 relative Cartier via 062Y(3) | A integral, t≠0 | t nonzerodivisor on integral A ⇒ fibre effective Cartier; 𝒟 locally principal (one section); A×P→P smooth ⇒ flat, lfp | hypotheses of the lemma met |
| §9.1 base change of 𝒟 | parameter T→P | `rankLocus` commutes with base change (AlgebraicModuli §1.7); `IsRelativeEffectiveCartier.comap` with no flatness on T→S | "stable under base change in the parameter" as stated |
| §9.1 Check, E elliptic, deg L=2 | x∈E; Riemann–Hurwitz | h⁰(L)=2, h⁰(L(−x))=1 ⇒ fibre of 𝒟→E one point, 𝒟≅E; deg(𝒟→P¹)=2; 0=2·(−2)+R ⇒ R=4, simple (e≤2); non-smooth locus = 4 ramification points, 4 distinct branch points; M=P¹∖4 points; members 2a over branch points nonreduced but flat | matches both clauses |
| §9.1 Check, ppav surface, L=O(Θ) | Jacobian of genus 2; E₁×E₂ | h⁰(Θ)=1 ⇒ P(H⁰) a point, 𝒟=Θ×{pt}; Θ≅C smooth ⇒ M = point; Θ=E₁×{0}+{0}×E₂ singular at (0,0), reduced ⇒ M=∅ | reducedness would keep the product case, as stated |
| §9.1 n≥2 standing hypothesis vs the elliptic Check | n=1 | the Check says it tests 𝒟 and M alone, outside the subsection's n≥2 | consistent |
| supplier labels | grep | "§§1.1 and 1.7" at lines 161, 1358, 1429; "§§1.1–1.2" 0 occurrences; `IsRelativeEffectiveCartier` at lines 47, 1348, 1358, 1429 | Needs, contract and Dependencies agree |
| §0.4 Gorenstein form, localization step; §9.3 weight, norm, flat continuation, constant variation, local frame, (0,0)⇔morphism; §4.3 character map; ReductiveGroups attributions; Layer 7 renumbering; gap slugs | as in the previous report | values as listed there | previous report, untouched |
| `exceptionalPair`, Pell descent, `exceptionalDegree`, Eulerian rows, `wedgeMultiplicity`, B.6 identity, §6.1–6.5, §3.1, §3.3, §4.7, §4.8, §4.6, §9.2 degree, §0.6, §1.5, §8.1, §8.2, §9.3 ℤ[i], §9.1 degree, §0.7, LS 4.10 ℓ=p | as in the previous reports | values as listed there | previous reports, untouched |

**Sampled targets.** None of the fifteen sampled targets falls in the diff; §9.2 and §9.3 consume §9.1's family and variation (their Needs lines cite §9.1), whose statement and API are unchanged, only the route's construction of 𝒟 and the Checks changed. Their verification by the previous reviews stands.

**Cross-roadmap citations resolved this round:** AlgebraicModuliForArithmeticGeometry §1.1, §1.7 (`rankLocus`) at its open head; SchemeAndStackFoundations §2.21 `NormalizedDualizing.localization_shift` on main (README line 4405: the resolver's lead is a README-only name of that roadmap); LieHighestWeightPartII §N2 is a board design package (the declared gap `gap:minuscule-weight-table` names it; not a finding). Ownership of the universal divisor of a complete linear system searched by object (`roadmaps grep 'universal divisor'`, main and all open heads): the other hits are the universal divisor of symmetric powers of a curve (JacobianChallenge, RelativeJacobiansAndIntegralCurveModels), the Morikawa comparison in AbelianSchemesAndArithmeticModuli §A6.36 and unrelated Floer objects; none builds this one, so §9.1 is its owner. `IsRelativeEffectiveCartier` is consumed by ModularCurves and RelativeJacobiansAndIntegralCurveModels as a library carrier, as here.

**Principles and policy on the new text.** No copied passage (the Stacks lemma and the AlgebraicModuli constructions are paraphrased), no algorithm, no LaTeX, no process words or pull-request numbers; "Stacks line 1796" follows the README's source-line convention (line 1440); the References entry has the version and page; sorry'd data 0, `set_option` 0, single `import Mathlib`; outside-folder diff empty.

## Not verifiable

- none.

## Source issues

- none (the previous reports' four LS items stand).
