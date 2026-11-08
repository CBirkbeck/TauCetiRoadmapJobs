# Triage report: TARGET-SchrodingerOperatorsAndSpectralTypes

Verdict: **design**, name `SchrodingerOperatorsAndSpectralTypes`, no base, no owner. The brief is in
`packages/SchrodingerOperatorsAndSpectralTypes/target.md`; the sources in
`packages/SchrodingerOperatorsAndSpectralTypes/sources.toml`. No text is left in
`needs-references.toml`: every work the design will need is either readable from a legal place or
recorded as `uncertified` by its locator.

## What I searched

1. **The board's open targets and designs** (the list in the job brief, 40 entries): compared by
   mathematical object. None concerns self-adjoint operators, spectral measures, Laplacians on
   manifolds or Schrödinger operators. `DESIGN-HyperbolicDynamicsAndThermodynamicFormalism`,
   `TARGET-SobolevMapsBetweenManifolds`, `TARGET-SchattenClassesAndSchurMultipliers` and
   `TARGET-RiemannianManifoldsWithConvexBoundary` share an area or a supplier (Sobolev spaces,
   trace-class operators, Riemannian manifolds) but plan no theorem of this target. No
   `merge-into`.
2. **Roadmaps on main and Completed** (local grep of every README for: absolutely continuous /
   singular continuous / pure point spectrum, Kato–Rellich, relatively bounded, Kato–Rosenblum, wave
   operator, essentially self-adjoint, Gaffney, Chernoff, Strichartz, Laplace–Beltrami, Friedrichs,
   compact resolvent, Lax–Phillips, quasi-periodic, Schrödinger, Bessel potential, Lebesgue
   decomposition, spectral measure).
3. **Open roadmap pull requests** (`roadmaps grep` over 454 pull requests for the same objects,
   then `roadmaps show` of UnboundedOperators #1027, QuantumFoundations #1771,
   CongruenceSpectralGap #1504, MaassForms #1717, AutomorphicSpectralTheory #925,
   SpectralManifolds #1158, SobolevDifferentialForms #1609, VariationalMethods #1028, PDE #93 and
   #1614, DifferentialGeometry #886).
4. **The board's packages** (557 folders, including the index of packages under review) for the
   same names and objects.
5. **The pinned libraries**: Mathlib `Analysis/Distribution/Sobolev.lean`,
   `Analysis/InnerProductSpace/LinearPMap.lean`, `MeasureTheory/Measure/Decomposition/Lebesgue.lean`,
   `Geometry/Manifold/Riemannian`; Tau Ceti `Analysis/Sobolev`, `Analysis/PDE`,
   `Analysis/InnerProductSpace/LinearPMap`, `Analysis/InnerProductSpace/Laplacian`,
   `Geometry/Manifold/Riemannian`, `Geometry/Manifold/Distribution`.

## What I found

**Already planned (imports, not re-planned).**

- OperatorTheory/SelfAdjointSpectralTheory (main): the spectral PVM of an unbounded self-adjoint
  operator with its diagonal measures and spectral subspaces (SA-E01–E13), relative boundedness
  (SA-C44–C53), the bounded Kato–Rellich theorem (SA-C54) and the Kato–Rellich theorem (SA-C55).
  So the target's "bounded self-adjoint perturbation is self-adjoint on the same domain" and
  "Kato–Rellich for relative bound < 1" are owned on main; only their lower-bound and core
  statements are new.
- UnboundedOperators (#1027): UO-C03 splits `H = H_pp ⊕ H_ac ⊕ H_sc` into reducing subspaces,
  proves the restrictions self-adjoint and `σ(A) = σ(A_pp) ∪ σ(A_ac) ∪ σ(A_sc)`,
  `σ(A_pp) = closure σ_p(A)`, without separability; UO-C02 is the essential spectrum with Weyl's
  criterion; UO-D06 closed forms and the Friedrichs extension; UO-E04 relatively compact
  perturbations; UO-E06 `−Δ` on `H²(ℝ³)` with `C_c^∞` core and `L² + L^∞` potentials. The target's
  first layer is therefore planned to a large part already; the roadmap owns only the measure-side
  identification of the Lebesgue decomposition, the essential-closure description of `σ_ac` with
  its interval criterion and no-isolated-points corollary, wave operators and Kato–Rosenblum.
- QuantumFoundations (#1771) §8.2: `H₀ = −Δ/(2m)` on `H²(ℝⁿ)` self-adjoint with Schwartz and
  `C_c^∞` cores and `σ = σ_ac = [0, ∞)`. Together with UO-E06 this means the free Laplacian is
  planned twice already; the brief tells the design to import one and report the duplication.
- PDE (main) Lane A.3 reconciles `W^{k,2}(ℝⁿ)` with Mathlib's Bessel scale; Mathlib's
  `memSobolev_iff_exists_smulLeftCLM_fourier` gives the Fourier description. Two of the "three
  descriptions of `H²`" are imports.
- DifferentialGeometry (main) Layer 12: `mgradient`, `divergence`, `laplaceBeltrami = div ∘ grad`,
  `riemannianVolume`, divergence theorem and Green identities, with the warning that everything
  analytic beyond them belongs elsewhere.
- ComplexKahlerGeometry (main) K5a, through VariationalMethods V3–V5 and UO-D06: on a compact
  manifold the `H²` realisation of the scalar Hodge Laplacian, compact resolvent, finite-dimensional
  eigenspaces and a complete smooth eigenbasis. The target's "compact `X` has compact resolvent and
  eigenvalues `→ ∞`" is owned there; the roadmap only compares its `Δ_X` with that realisation.
- AutomorphicSpectralTheory §1.16a and CongruenceSpectralGap §0.2 construct the Friedrichs
  realisation of `−y²(∂ₓ² + ∂ᵧ²)` on congruence quotients and prove its essential self-adjointness
  by hand, by Gaffney's cutoff on a torsion-free finite cover, citing `bms02` Corollary 2.10;
  MaassForms imports from them the congruence spectral description (`σ_ac = [1/4, ∞)`, finitely
  many exceptional eigenvalues). These are exactly the consumers the target names.

**Planned nowhere** (the roadmap's own content): the general completeness theorem for the
Laplace–Beltrami operator (minimal operator, adjoint = maximal operator, energy form on `H¹_0`,
essential self-adjointness on a complete manifold, `H¹_0 = H¹`), the spectral vocabulary of `Δ_X`
on a noncompact manifold, the finite-area hyperbolic surface statement for an arbitrary such
surface, the Lebesgue-decomposition identification of the spectral projections, the interval
criterion and the absence of isolated points of `σ_ac`, the Kato–Rosenblum theorem, the lower-bound
and core clauses of the perturbation theorems, `−Δ + V` for bounded real `V` in every dimension with
its cores and `σ_ess` when `V` vanishes at infinity, and the quasi-periodic model example.
Mathlib has the Lebesgue decomposition and the Bessel-potential Sobolev scale but no spectral types,
no Laplace–Beltrami operator and no Sobolev spaces on manifolds; Tau Ceti has volume densities on
Riemannian manifolds, Euclidean Sobolev spaces and the Dirichlet spectrum on bounded domains, but no
Laplacian on a manifold.

## Why the verdict

- Not a duplicate: no roadmap, pull request, package or library declaration owns the completeness
  theorem, the spectral-type measure identifications, Kato–Rosenblum or the general finite-area
  hyperbolic statement.
- Not a Part II: the material continues no single roadmap. UnboundedOperators is the closest
  base, but Layer 2 is Riemannian geometry and Layer 3 is Euclidean PDE, and a Part II of a
  sub-roadmap of OperatorTheory would have to own manifold analysis it has no business owning.
- Not a merge: no open target or design overlaps.
- Hence `design`, with the scope cut down to what is not planned: the brief lists the imports by
  section so that the design re-plans nothing, and keeps the filed generality (arbitrary complex
  Hilbert space, arbitrary Riemannian manifold without boundary with completeness only in the main
  theorem, arbitrary dimension on `ℝ^d`, arbitrary finite-area hyperbolic surface rather than a
  quotient `Γ\ℍ`).
- Name: the suggested `SchrodingerOperatorsAndSpectralTypes` is unused by any roadmap, pull request
  or package (the board already holds the empty package folder created for this job).

## Sources

Fetched through the sources service: Teschl's book (author page), Braverman–Milatovic–Shubin
(arXiv), Lax–Phillips' 1980 Bulletin survey (publisher open, AMS), Karpeshina–Parnovski–Shterenberg
(arXiv, text partly OCR) and Hide–Magee (arXiv). Locators quoted in the brief were read in the
cached texts: `teschl` lines 4302–4427 (spectral types), 5704–5720 (Kato–Rellich), 7087–7136 (free
Schrödinger operator), 9578–9589 (Theorem 10.2), 10600–10631 (wave operators); `bms02` lines 93–95,
179–182, 245–246; `kps26` lines 28–50; `hm23` lines 39–47, 60–66, 104–105; `lp80` lines 297–301.
Paywalled and recorded as `uncertified` by locator: Strichartz 1983 and Chernoff 1973 (Elsevier;
the service cannot read ScienceDirect even for open-archive articles), Gaffney 1954 (JSTOR),
Reed–Simon I–III, Kato, Grigor'yan, Chavel, Iwaniec, Lax–Phillips 1976, Cycon–Froese–Kirsch–Simon.
None of the design's proof routes depends on an unreadable text: `bms02` Corollary 2.10 carries the
completeness theorem, `teschl` the operator theory; only the two statement-level targets
(Kato–Rosenblum, Lax–Phillips) rest on paywalled proofs, which the brief flags as a risk with a legal
alternative (Colin de Verdière, Numdam) for the hyperbolic case.

Nothing suspicious was found in the fetched texts or the issue text; no fetched text asked for any
action.

## Open points for the design

- Choose the supplier of the free Laplacian (QuantumFoundations §8.2 at `m = 1/2` or UO-E06) and
  report the existing duplication to the board.
- Decide whether Kato–Rosenblum is proved here (trace-class route of Reed–Simon III §XI.3) and
  whether the Lax–Phillips statement stays a headline or becomes a statability Check.
- The distributional Laplacian and local elliptic regularity on a noncompact manifold are
  foundations above the present library; the brief names the chartwise route.
- Merge-order position: directly after `HilbertModules`, ahead of AutomorphicSpectralTheory and
  CongruenceSpectralGap.
